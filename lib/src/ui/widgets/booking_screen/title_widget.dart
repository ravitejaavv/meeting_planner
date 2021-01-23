import 'package:meeting_planner_app/src/controllers/blocs/home/book_meeting/book_meeting_validator.dart';
import 'package:meeting_planner_app/src/ui/widgets/common/stateful_widget_base.dart';

class TitleWidget extends StatefulWidgetBase {

  final GlobalKey<FormState> formKey;
  final TextEditingController textEditingController;
  final bool isSubmitted;
  final bool isEnabled;

  TitleWidget(this.formKey, this.textEditingController, this.isSubmitted, this.isEnabled) : assert(formKey != null || textEditingController != null);

  @override
  _TitleWidgetState createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.isEnabled,
      controller: widget.textEditingController,
      keyboardAppearance: Brightness.light,
      keyboardType: TextInputType.text,
      maxLines: 1,
      style: TextStyle(fontSize: 14.0,
        fontWeight: FontWeight.w500,),
      decoration: InputDecoration(
        contentPadding:
        new EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        border: OutlineInputBorder(),
        labelText: S.of(context).title,
        labelStyle: TextStyle(
            fontSize: 14,
            color: Colors.black54,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,),
        hintText: S.of(context).enter_title,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorConstants.primaryColor, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.withOpacity(0.5)),
        ),
      ),
      onChanged: (text) {
        if (widget.isSubmitted ?? true) {
          widget.formKey.currentState.validate();
        }
      },
      validator: (value) => BookMeetingValidator.checkTitleError(context, value),
    );
  }
}
