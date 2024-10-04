// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const bool _autoTextFieldValidation = true;

const String QuantityValueKey = 'quantity';

final Map<String, TextEditingController> _QuantityDialogTextEditingControllers =
    {};

final Map<String, FocusNode> _QuantityDialogFocusNodes = {};

final Map<String, String? Function(String?)?> _QuantityDialogTextValidations = {
  QuantityValueKey: null,
};

mixin $QuantityDialog {
  TextEditingController get quantityController =>
      _getFormTextEditingController(QuantityValueKey);

  FocusNode get quantityFocusNode => _getFormFocusNode(QuantityValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_QuantityDialogTextEditingControllers.containsKey(key)) {
      return _QuantityDialogTextEditingControllers[key]!;
    }

    _QuantityDialogTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _QuantityDialogTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_QuantityDialogFocusNodes.containsKey(key)) {
      return _QuantityDialogFocusNodes[key]!;
    }
    _QuantityDialogFocusNodes[key] = FocusNode();
    return _QuantityDialogFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormStateHelper model) {
    quantityController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    quantityController.addListener(() => _updateFormData(model));

    _updateFormData(model, forceValidate: _autoTextFieldValidation);
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormStateHelper model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          QuantityValueKey: quantityController.text,
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

    for (var controller in _QuantityDialogTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _QuantityDialogFocusNodes.values) {
      focusNode.dispose();
    }

    _QuantityDialogTextEditingControllers.clear();
    _QuantityDialogFocusNodes.clear();
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

  String? get quantityValue => this.formValueMap[QuantityValueKey] as String?;

  set quantityValue(String? value) {
    this.setData(
      this.formValueMap..addAll({QuantityValueKey: value}),
    );

    if (_QuantityDialogTextEditingControllers.containsKey(QuantityValueKey)) {
      _QuantityDialogTextEditingControllers[QuantityValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasQuantity =>
      this.formValueMap.containsKey(QuantityValueKey) &&
      (quantityValue?.isNotEmpty ?? false);

  bool get hasQuantityValidationMessage =>
      this.fieldsValidationMessages[QuantityValueKey]?.isNotEmpty ?? false;

  String? get quantityValidationMessage =>
      this.fieldsValidationMessages[QuantityValueKey];
}

extension Methods on FormStateHelper {
  setQuantityValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[QuantityValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    quantityValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      QuantityValueKey: getValidationMessage(QuantityValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _QuantityDialogTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _QuantityDialogTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormStateHelper model) =>
    model.setValidationMessages({
      QuantityValueKey: getValidationMessage(QuantityValueKey),
    });
