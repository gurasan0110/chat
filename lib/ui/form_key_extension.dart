import 'package:flutter/material.dart';

extension FormKeyExtension on GlobalKey<FormState> {
  bool validateAndSave() {
    final currentState = this.currentState;
    if (currentState == null) {
      return false;
    }

    final noErrors = currentState.validate();
    if (noErrors != true) {
      return false;
    }

    currentState.save();

    return true;
  }
}
