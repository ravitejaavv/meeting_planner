
import 'package:flutter/cupertino.dart';
import 'package:meeting_planner_app/generated/l10n.dart';

class BookMeetingValidator{

  static checkTitleError(BuildContext context, String value) {
    if (value.isEmpty) {
      return S.of(context).title_empty_error;
    } else if (value.length < 2) {
      return S.of(context).title_invalid_error;
    }
    return null;
  }

  static checkDescriptionError(BuildContext context, String value) {
    if (value.isEmpty) {
      return S.of(context).description_empty_error;
    } else if (value.length < 15) {
      return S.of(context).description_invalid_error;
    }
    return null;
  }
}