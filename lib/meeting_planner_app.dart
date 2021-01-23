import 'package:meeting_planner_app/src/controllers/routes/routes.dart';
import 'package:meeting_planner_app/src/ui/screens/home_screen.dart';
import 'package:meeting_planner_app/src/ui/widgets/common/stateful_widget_base.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'generated/l10n.dart';

class MeetingPlannerApp extends StatefulWidgetBase {
  @override
  _MeetingPlannerAppState createState() => _MeetingPlannerAppState();

  static const locale = [Locale("en", "")];

  static void setLocale(BuildContext context, Locale newLocale) async {
    _MeetingPlannerAppState state =
        context.findAncestorStateOfType();
    state.setState(() {
      state.locale = newLocale;
    });
  }
}

class _MeetingPlannerAppState extends State<MeetingPlannerApp> {
  var locale = MeetingPlannerApp.locale[0];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: ColorConstants.primaryColor,
          primaryColorDark: ColorConstants.primaryDarkColor,
          accentColor: ColorConstants.primaryLightColor, fontFamily: 'Poppins'),
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: locale,
      home: HomeScreen(),
      onGenerateRoute: (RouteSettings settings) {
        return Routes.onGenerateRoute(settings);
      },
    );
  }
}
