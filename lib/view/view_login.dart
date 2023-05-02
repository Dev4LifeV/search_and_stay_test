import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search_and_stay_test/controller/controlller_auth.dart';
import 'package:search_and_stay_test/core/config/extensions.dart';
import 'package:search_and_stay_test/core/config/injector.dart';
import 'package:search_and_stay_test/view/style/fonts.dart';
import 'package:search_and_stay_test/view/view_home.dart';
import 'package:search_and_stay_test/view/widget/banner/banner.dart';
import 'package:search_and_stay_test/view/widget/button/button_signin_with_google.dart';
import 'package:search_and_stay_test/view/widget/loading/loading.dart';

class ViewLogin extends StatefulWidget {
  ViewLogin({Key? key}) : super(key: key);

  final ControllerAuth? _controllerAuth =
      Injector.shared.read<ControllerAuth, ControllerAuth>();

  @override
  State<ViewLogin> createState() => _ViewLoginState();
}

class _ViewLoginState extends State<ViewLogin> {
  User? getUser() => Injector.shared.read<User, User?>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: context.colors.background,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _logo(
              height * 0.2,
              width * 0.4,
            ),
            loading
                ? const Loading()
                : ButtonGoogle(
                    onPressed: () async {
                      nowLoading;
                      await widget._controllerAuth?.executeUsecase().then((_) {
                        stopLoading;
                        if (getUser() != null) {
                          nowLoading;
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => const ViewHome(),
                            ),
                          );
                        } else {
                          _openBannerOperationCancelled(
                            context,
                          );
                        }
                      });
                    },
                  )
          ],
        ),
      ),
    );
  }

  Widget _logo(double height, double width) => Column(
        children: [
          Image.asset(
            'assets/logo.png',
            height: height,
            width: width,
            fit: BoxFit.contain,
          ),
          Text(
            "HouseRules",
            style: context.headlineLarge,
          ),
        ],
      );

  void _openBannerOperationCancelled(BuildContext context) =>
      ScaffoldMessenger.of(
        context,
      ).showMaterialBanner(
        _bannerOperationCancelled(context),
      );

  MaterialBanner _bannerOperationCancelled(BuildContext context) =>
      CustomBanner(context: context, message: "User cancelled operation.");
}
