import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:search_and_stay_test/core/config/extensions.dart';
import 'package:search_and_stay_test/core/model/house_rule.dart';
import 'package:search_and_stay_test/view/style/fonts.dart';
import 'package:search_and_stay_test/view/widget/appbar/appbar_divider.dart';
import 'package:search_and_stay_test/view/widget/appbar/custom_appbar.dart';
import 'package:search_and_stay_test/view/widget/banner/banner.dart';
import 'package:search_and_stay_test/view/widget/modal/modal_sheet.dart';
import 'package:search_and_stay_test/viewmodel/viewmodel_home.dart';

class ViewHome extends StatefulWidget {
  const ViewHome({Key? key}) : super(key: key);

  @override
  State<ViewHome> createState() => _ViewHomeState();
}

class _ViewHomeState extends State<ViewHome> with ViewModelListRuleUpdater {
  bool isEditing = false;
  bool validInput = true;

  @override
  void initState() {
    pagingController.addPageRequestListener(
      (_) async {
        await _onFetchNewPage(
          pageKey,
        );
        pageKey++;
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        child: Scaffold(
          backgroundColor: context.colors.background,
          appBar: const CustomAppBar(
            title: "HouseRules",
          ),
          body: PagedListView<int, HouseRule?>(
            pagingController: pagingController,
            builderDelegate: PagedChildBuilderDelegate<HouseRule?>(
                itemBuilder: (context, item, index) =>
                    _tile(item ?? HouseRule())),
          ),
          floatingActionButton: _floatingActionButton(),
        ),
        onWillPop: () async => false,
      );

  Widget _tile(HouseRule rule) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: Text(
              rule.name,
              style: context.bodyText,
            ),
            trailing: IconButton(
              icon: Icon(
                Icons.delete,
                color: context.colors.primary,
              ),
              onPressed: () async => await _onDelete(rule),
            ),
            onTap: () => _openModal(true, rule: rule),
          ),
          CustomDivider(
            color: context.colors.secondary,
            thickness: 0.8,
          )
        ],
      );

  Widget _floatingActionButton() => FloatingActionButton(
        onPressed: () => _openModal(false),
        backgroundColor: context.colors.primary,
        child: Icon(
          Icons.add,
          color: context.colors.onPrimary,
        ),
      );

  Future<void> _onDelete(HouseRule rule) async => await deleteItem(
        rule.id,
        _onError,
      ).then(_onSuccess);

  Future<void> _onPut(
          HouseRule rule, String newRuleName, int newRuleState) async =>
      await putItem(
        rule.id,
        HouseRule(
          id: rule.id,
          order: rule.order,
          name: newRuleName,
          active: newRuleState,
        ),
        _onError,
      ).then(_onSuccess);

  Future<void> _onPost(HouseRule newRule) async =>
      await postItem(newRule, _onError).then(_onSuccess);

  _onFetchNewPage(int page) async {
    await fetchNextPage(page.toString(), _onError);
    if (getPagination() != null) {
      if (getPagination()!.links.next.isNotEmpty) {
        pagingController.appendPage(newRules, page);
      } else {
        pagingController.appendLastPage(newRules);
      }
    }
  }

  void _openModal(bool isEditMode, {HouseRule? rule}) => showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: ModalSheet(
              isEditMode: isEditMode,
              onPressedEditMode: (text, isActive) async => await _onPut(
                rule ?? HouseRule(),
                text,
                isActive,
              ),
              onPressed: (text, isActive) async => await _onPost(
                HouseRule(name: text, active: isActive),
              ),
              currentRuleName: rule?.name ?? "",
              isActive: rule?.active ?? 0,
            ),
          ),
      isScrollControlled: true);

  void _onError() => ScaffoldMessenger.of(context).showMaterialBanner(
        CustomBanner(
          context: context,
          message: "Unfortunately, an error has ocurred. Please try again.",
          backgroundColor: context.colors.secondary,
        ),
      );

  void _onSuccess(dynamic value) =>
      ScaffoldMessenger.of(context).showMaterialBanner(
        CustomBanner(
          context: context,
          message: "Operation completed successfully.",
          backgroundColor: Colors.green,
        ),
      );
}
