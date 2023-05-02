import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:search_and_stay_test/controller/controller_delete_rule.dart';
import 'package:search_and_stay_test/controller/controller_get_rule.dart';
import 'package:search_and_stay_test/controller/controller_post_rule.dart';
import 'package:search_and_stay_test/controller/controller_put_rule.dart';
import 'package:search_and_stay_test/controller/controlller_auth.dart';
import 'package:search_and_stay_test/core/config/firebase/firebase_options.dart';
import 'package:search_and_stay_test/core/config/injector.dart';
import 'package:search_and_stay_test/core/method_channels/http_channel_delete.dart';
import 'package:search_and_stay_test/core/method_channels/http_channel_get.dart';
import 'package:search_and_stay_test/core/method_channels/http_channel_post.dart';
import 'package:search_and_stay_test/core/method_channels/http_channel_put.dart';
import 'package:search_and_stay_test/service/service_http_delete.dart';
import 'package:search_and_stay_test/service/service_http_get.dart';
import 'package:search_and_stay_test/service/service_http_post.dart';
import 'package:search_and_stay_test/service/service_http_put.dart';
import 'package:search_and_stay_test/usecase/usecase_auth.dart';
import 'package:search_and_stay_test/usecase/usecase_delete_rule.dart';
import 'package:search_and_stay_test/usecase/usecase_get_rule.dart';
import 'package:search_and_stay_test/usecase/usecase_post_rule.dart';
import 'package:search_and_stay_test/usecase/usecase_put_rule.dart';

void _initServiceDependencies() {
  Injector.shared.create<ServiceHttpGet, ServiceHttpGet>(
    () => ServiceHttpGet(
      HttpChannelGet(),
    ),
  );

  Injector.shared.create<ServiceHttpDelete, ServiceHttpDelete>(
    () => ServiceHttpDelete(
      HttpChannelDelete(),
    ),
  );

  Injector.shared.create<ServiceHttpPut, ServiceHttpPut>(
    () => ServiceHttpPut(
      HttpChannelPut(),
    ),
  );
  Injector.shared.create<ServiceHttpPost, ServiceHttpPost>(
    () => ServiceHttpPost(
      HttpChannelPost(),
    ),
  );
}

void _initControllerDependencies() {
  final ServiceHttpGet serviceHttpGet =
      Injector.shared.read<ServiceHttpGet, ServiceHttpGet>() ??
          ServiceHttpGet(
            HttpChannelGet(),
          );

  final ServiceHttpDelete serviceHttpDelete =
      Injector.shared.read<ServiceHttpDelete, ServiceHttpDelete>() ??
          ServiceHttpDelete(
            HttpChannelDelete(),
          );

  final ServiceHttpPut serviceHttpPut =
      Injector.shared.read<ServiceHttpPut, ServiceHttpPut>() ??
          ServiceHttpPut(
            HttpChannelPut(),
          );
  final ServiceHttpPost serviceHttpPost =
      Injector.shared.read<ServiceHttpPost, ServiceHttpPost>() ??
          ServiceHttpPost(
            HttpChannelPost(),
          );

  Injector.shared.create<ControllerGetRule, ControllerGetRule>(
    () => ControllerGetRule(
      UsecaseGetRule(serviceHttpGet),
    ),
  );

  Injector.shared.create<ControllerDeleteRule, ControllerDeleteRule>(
    () => ControllerDeleteRule(
      UsecaseDeleteRule(serviceHttpDelete),
    ),
  );

  Injector.shared.create<ControllerPutRule, ControllerPutRule>(
    () => ControllerPutRule(
      UsecasePutRule(serviceHttpPut),
    ),
  );
  Injector.shared.create<ControllerPostRule, ControllerPostRule>(
    () => ControllerPostRule(
      UsecasePostRule(serviceHttpPost),
    ),
  );
}

void _initAuthDependencies() =>
    Injector.shared.create<ControllerAuth, ControllerAuth>(
      () => ControllerAuth(
        UsecaseAuth(),
      ),
    );

Future<void> _initFirebase() =>
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
        .then((_) => debugPrint("Firebase initialized successfully."))
        .onError(
          (error, stackTrace) => debugPrint(
              "Error initializing Firebase: ERROR $error \n\n\nSTACKTRACE: $stackTrace"),
        );

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  _initServiceDependencies();
  _initControllerDependencies();
  _initAuthDependencies();
  _initFirebase();
}
