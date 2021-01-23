import 'package:flutter/cupertino.dart';
import 'package:meeting_planner_app/src/ui/widgets/common/common_widget.dart';
import 'package:meeting_planner_app/src/ui/widgets/common/stateful_widget_base.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../utils/sharedpreference_helper.dart';

class TimeZoneScreen extends StatefulWidgetBase {
  static const ROUTE_NAME = "/home/settings/timezone_screen";

  TimeZoneScreenArguments arguments;

  TimeZoneScreen(this.arguments);

  @override
  _TimeZoneScreenState createState() => _TimeZoneScreenState();
}

class _TimeZoneScreenState extends State<TimeZoneScreen> with CommonWidget {

  List<tz.Location> list, filteredList = List();

  @override
  void initState() {
    list = tz.timeZoneDatabase.locations.values.toList();
    filteredList.addAll(list);
    super.initState();
  }

  Future<bool> _willPopScope() {
    widget.arguments.onUpdate();
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopScope,
      child: Scaffold(
        appBar: getAppBar(context, S.of(context).timezone, onBackPressed: (from){
          widget.arguments.onUpdate();
          Navigator.of(context).pop();
        }),
        body: SafeArea(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                _searchBar(),
                SizedBox(height: 10.0),
                Expanded(child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: filteredList.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: (){
                        prefsHelper.setTimeZone(filteredList[index].name);
                        widget.arguments.onUpdate();
                        Navigator.of(context).pop();
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Text(filteredList[index].name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black54),),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                ))
              ],)
            )
          ),
        ),
      ),
    );
  }

  _searchBar(){
    return TextFormField(
      maxLines: 1,
      decoration: InputDecoration(
        suffixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        hintText: 'Search',
        contentPadding: EdgeInsets.only(left: 15.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 1.5,
              style: BorderStyle.solid,
              color: Colors.black),
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
      ),
      onChanged: (value) {
        setState(() {
          if(value.length == 0){
            filteredList.clear();
            filteredList.addAll(list);
          }else {
            filteredList.clear();
            for (var item in list) {
              if(item.name.toLowerCase().contains(value.toLowerCase())){
                filteredList.add(item);
              }
            }
          }
        });
      },
    );
  }
}

class TimeZoneScreenArguments {
  Function() onUpdate;
  TimeZoneScreenArguments(this.onUpdate);
}
