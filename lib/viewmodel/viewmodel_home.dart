import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:search_and_stay_test/controller/controller_delete_rule.dart';
import 'package:search_and_stay_test/controller/controller_get_rule.dart';
import 'package:search_and_stay_test/controller/controller_post_rule.dart';
import 'package:search_and_stay_test/controller/controller_put_rule.dart';
import 'package:search_and_stay_test/core/config/endpoints.dart';
import 'package:search_and_stay_test/core/config/injector.dart';
import 'package:search_and_stay_test/core/model/house_rule.dart';
import 'package:search_and_stay_test/core/model/house_rules.dart';
import 'package:search_and_stay_test/core/model/token.dart';

mixin ViewModelListRuleUpdater implements Type {
  static final Injector _injector = Injector.shared;

  final ControllerGetRule? _controllerGetRule =
      _injector.read<ControllerGetRule, ControllerGetRule>();
  final ControllerDeleteRule? _controllerDeleteRule =
      _injector.read<ControllerDeleteRule, ControllerDeleteRule>();
  final ControllerPutRule? _controllerPutRule =
      _injector.read<ControllerPutRule, ControllerPutRule>();
  final ControllerPostRule? _controllerPostRule =
      _injector.read<ControllerPostRule, ControllerPostRule>();

  final String? _token = _injector.read<Token, Token>()?.token;

  static List<HouseRule?> rules = [];
  List<HouseRule?> newRules = [];

  int pageKey = 1;

  final PagingController<int, HouseRule?> pagingController =
      PagingController<int, HouseRule?>(firstPageKey: 1);

  Future fetchNextPage(String page, Function() onError,
      {int? ruleId, bool reloadList = false}) async {
    try {
      if (reloadList) {
        newRules.clear();
        rules.clear();
        pageKey = 1;
        pagingController.refresh();
      }

      var result = await _controllerGetRule?.executeUsecase([
            adminHouseRuleEndpoint,
            _token,
            page,
          ]) ??
          [];

      _updateListRules(result);
    } catch (e) {
      onError.call();
    }
  }

  Future putItem(
    int id,
    HouseRule editedRule,
    Function() onError,
  ) async {
    try {
      await _controllerPutRule?.executeUsecase([
        "$adminHouseRuleEndpoint$id/",
        _token,
        editedRule.toJson(),
        editedRule,
      ]).then(
        (value) async => await fetchNextPage(
          pageKey.toString(),
          onError,
          reloadList: true,
        ),
      );
    } catch (e) {
      onError.call();
    }
  }

  Future postItem(HouseRule newRule, Function() onError) async {
    try {
      await _controllerPostRule?.executeUsecase(
        [adminHouseRuleEndpoint, _token, newRule.toJson()],
      ).then(
        (value) async => await fetchNextPage(
          pageKey.toString(),
          onError,
          reloadList: true,
        ),
      );
    } catch (e) {
      onError.call();
    }
  }

  Future deleteItem(int id, Function() onError) async {
    try {
      await _controllerDeleteRule?.executeUsecase(
        [
          "$adminHouseRuleEndpoint$id/",
          _token,
          id,
        ],
      ).then(
        (value) async => await fetchNextPage(
          pageKey.toString(),
          onError,
          reloadList: true,
        ),
      );
    } catch (e) {
      onError.call();
    }
  }

  void _updateListRules(List<HouseRule?> updatedList) {
    newRules.clear();
    newRules.addAll(updatedList);

    rules.addAll(newRules);
    rules.toSet().toList();
  }

  Pagination? getPagination() =>
      Injector.shared.read<HouseRules, HouseRules>()?.data.pagination;
}
