// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String NameValueKey = 'name';

final Map<String, TextEditingController> _UiToolkitsViewTextEditingControllers =
    {};

final Map<String, FocusNode> _UiToolkitsViewFocusNodes = {};

final Map<String, String? Function(String?)?> _UiToolkitsViewTextValidations = {
  NameValueKey: null,
};

mixin $UiToolkitsView {
  TextEditingController get nameController =>
      _getFormTextEditingController(NameValueKey);

  FocusNode get nameFocusNode => _getFormFocusNode(NameValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_UiToolkitsViewTextEditingControllers.containsKey(key)) {
      return _UiToolkitsViewTextEditingControllers[key]!;
    }

    _UiToolkitsViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _UiToolkitsViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_UiToolkitsViewFocusNodes.containsKey(key)) {
      return _UiToolkitsViewFocusNodes[key]!;
    }
    _UiToolkitsViewFocusNodes[key] = FocusNode();
    return _UiToolkitsViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    nameController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    nameController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          NameValueKey: nameController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _UiToolkitsViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _UiToolkitsViewFocusNodes.values) {
      focusNode.dispose();
    }

    _UiToolkitsViewTextEditingControllers.clear();
    _UiToolkitsViewFocusNodes.clear();
  }
}

extension ValueProperties on FormStateHelper {
  bool get hasAnyValidationMessage => this
      .fieldsValidationMessages
      .values
      .any((validation) => validation != null);

  bool get isFormValid {
    if (!_autoTextFieldValidation) this.validateForm();

    return !hasAnyValidationMessage;
  }

  String? get nameValue => this.formValueMap[NameValueKey] as String?;

  set nameValue(String? value) {
    this.setData(
      this.formValueMap..addAll({NameValueKey: value}),
    );

    if (_UiToolkitsViewTextEditingControllers.containsKey(NameValueKey)) {
      _UiToolkitsViewTextEditingControllers[NameValueKey]?.text = value ?? '';
    }
  }

  bool get hasName =>
      this.formValueMap.containsKey(NameValueKey) &&
      (nameValue?.isNotEmpty ?? false);

  bool get hasNameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey]?.isNotEmpty ?? false;

  String? get nameValidationMessage =>
      this.fieldsValidationMessages[NameValueKey];
}

extension Methods on FormStateHelper {
  setNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[NameValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    nameValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      NameValueKey: getValidationMessage(NameValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _UiToolkitsViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _UiToolkitsViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      NameValueKey: getValidationMessage(NameValueKey),
    });
