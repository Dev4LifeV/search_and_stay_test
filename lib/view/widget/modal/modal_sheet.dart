import 'package:flutter/material.dart';
import 'package:search_and_stay_test/core/config/extensions.dart';
import 'package:search_and_stay_test/view/style/fonts.dart';
import 'package:search_and_stay_test/view/widget/appbar/appbar_divider.dart';

class ModalSheet extends StatefulWidget {
  const ModalSheet({
    Function(String text, int active)? onPressed,
    Function(String text, int active)? onPressedEditMode,
    String? currentRuleName,
    int? isActive,
    bool isDismissible = true,
    bool isEditMode = true,
    bool isValid = false,
    super.key,
  })  : _onPressed = onPressed,
        _onPressedEditMode = onPressedEditMode,
        _controllerText = currentRuleName,
        _isActive = isActive,
        _isEditMode = isEditMode;

  final Function(String, int)? _onPressedEditMode;
  final Function(String, int)? _onPressed;
  final bool _isEditMode;
  final String? _controllerText;
  final int? _isActive;

  @override
  State<StatefulWidget> createState() => _ModalSheetState();
}

class _ModalSheetState extends State<ModalSheet> {
  final TextEditingController ruleNameTextController = TextEditingController();
  final BorderRadius containerBorder = const BorderRadius.only(
    topLeft: Radius.circular(30),
    topRight: Radius.circular(30),
  );
  int activeState = 0;
  bool validField = true;

  @override
  void initState() {
    if (widget._isEditMode) {
      ruleNameTextController.text = widget._controllerText ?? "";
      activeState = widget._isActive ?? 0;
    }
    super.initState();
  }

  @override
  void deactivate() {
    validField = true;
    super.deactivate();
  }

  bool _checkFields(BuildContext context, String fieldText) {
    if (fieldText.trim().isEmpty) {
      setState(() => validField = false);
      return false;
    }
    Navigator.pop(context);
    setState(() => validField = true);
    return true;
  }

  @override
  Widget build(BuildContext context) => ScaffoldMessenger(
        key: widget.key,
        child: Container(
          padding: const EdgeInsets.only(bottom: 50),
          decoration: BoxDecoration(
            color: context.colors.secondary,
            borderRadius: containerBorder,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: context.colors.onPrimary,
                    borderRadius: containerBorder),
                padding: const EdgeInsets.only(top: 20, bottom: 20, left: 50),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      widget._isEditMode ? Icons.edit : Icons.add,
                      color: context.colors.primary,
                      size: context.title.fontSize,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      widget._isEditMode ? "Edit Rule" : "New Rule",
                      style: context.title,
                    )
                  ],
                ),
              ),
              const CustomDivider(),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 300,
                        child: TextField(
                          decoration: InputDecoration(
                            errorText: !validField
                                ? "Please, fill the rule name properly."
                                : null,
                            errorBorder: !validField
                                ? UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: context.colors.error))
                                : null,
                          ),
                          controller: ruleNameTextController,
                          onTap: () => setState(() => validField = true),
                          style: context.bodyText,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Active ",
                            style: context.bodyText,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Switch(
                            onChanged: (changed) =>
                                setState(() => activeState = changed ? 1 : 0),
                            value: activeState > 0,
                            activeColor: context.colors.primary,
                          )
                        ],
                      ),
                      SizedBox(
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_checkFields(
                                context, ruleNameTextController.text)) {
                              widget._isEditMode
                                  ? widget._onPressedEditMode?.call(
                                      ruleNameTextController.text, activeState)
                                  : widget._onPressed?.call(
                                      ruleNameTextController.text, activeState);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: context.colors.primary,
                          ),
                          child: const Text("SAVE"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
