import 'package:meeting_planner_app/src/ui/widgets/common/stateful_widget_base.dart';

class ButtonWidget extends StatelessWidget {
  final Function() onClick;
  final String title;
  final double width;
  final double height;
  final double titleFontSize;
  final bool isNormal;
  final bool isHavingBorder;
  final EdgeInsets padding;
  final double letterSpacing;
  final Color bottomBgColor;
  final double radius;

  ButtonWidget(this.onClick, this.title,
      {this.width = double.maxFinite,
      this.height = 50.0,
      this.titleFontSize = 14.0,
      this.isNormal = true, this.isHavingBorder = false, this.padding = const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 8.0), this.letterSpacing = 1.0, this.bottomBgColor = Colors.white, this.radius = 5.0});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(alignment: Alignment.bottomCenter,child: Container(height: height - 20, color: bottomBgColor,)),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: padding,
            child: MaterialButton(
              height: height,
              minWidth: width,
              color: ColorConstants.primaryColor,
              onPressed: onClick,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
              textColor: Colors.white,
              highlightColor: Colors.black.withOpacity(0.7),
              highlightElevation: 5.0,
              child: Text(
                title,
                style: !isNormal
                    ? TextStyle(
                    fontSize: titleFontSize,
                    color: Colors.white,
                    fontWeight: FontWeight.w900, letterSpacing: letterSpacing)
                    : TextStyle(
                    fontSize: titleFontSize,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal, letterSpacing: letterSpacing),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
