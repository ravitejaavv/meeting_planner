import 'package:flutter/material.dart';
import 'package:meeting_planner_app/generated/l10n.dart';
import 'package:meeting_planner_app/src/controllers/blocs/home/home_bloc.dart';
import 'package:meeting_planner_app/src/ui/resources/asset_constants.dart';
import 'package:meeting_planner_app/src/ui/utils/common_util.dart';

class NoMeetingWidget extends StatelessWidget {

  HomeBloc homeBloc;

  NoMeetingWidget(this.homeBloc);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 100, height: 100, child: Image.asset(AssetConstants.ic_logo_solid, color: Colors.grey.withOpacity(0.6),)),
            SizedBox(height: 15.0,),
            StreamBuilder<DateTime>(
              stream: homeBloc.selectedDateTimeStream,
              builder: (context, snapshot) {
                String text = S.of(context).no_meetings_available;
                if(snapshot.hasData){
                  String date = CommonUtil.instance.convertTo_dd_MMM_yyyy(snapshot.data);
                  text = text + " on $date";
                  if(!CommonUtil.instance.isPast(snapshot.data)){
                    text = text + "\n" + S.of(context).add_meeting;
                  }
                }
                return Text(text, textAlign: TextAlign.center, style: TextStyle(color: Colors.grey),);
              }
            )
          ],
        ),
      ),
    );
  }
}
