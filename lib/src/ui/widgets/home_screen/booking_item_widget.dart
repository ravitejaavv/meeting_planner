import 'package:flutter/material.dart';
import 'package:meeting_planner_app/generated/l10n.dart';
import 'package:meeting_planner_app/src/models/booking_model.dart';
import 'package:meeting_planner_app/src/models/ui_models/room_model.dart';
import 'package:meeting_planner_app/src/ui/resources/color_constants.dart';
import 'package:meeting_planner_app/src/ui/utils/common_util.dart';

class BookingItemWidget extends StatelessWidget {
  final BookingItem bookingItem;
  Function(BookingItem) onItemClick;

  BookingItemWidget(this.bookingItem, this.onItemClick);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: InkResponse(
          onTap: () {
            onItemClick(bookingItem);
          },
          child: Card(
            color: bookingItem.isCancelled == 1
                ? Colors.grey.shade200
                : Colors.white,
            elevation: 3.0,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: 60,
                          height: 100,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              color: Color(bookingItem.colorCode)),
                            child: Center(
                                child: Text(bookingItem.meetingRoom, style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700, foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 1
                                  ..color = Colors.white,))
                            ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            height: 18,
                            width: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5.0),
                                    topRight: Radius.circular(5.0)),
                                color: ColorConstants.primaryDarkColor),
                            child: Center(
                                child: Text(
                              bookingItem.priority == 1
                                  ? "High"
                                  : bookingItem.priority == 2
                                      ? "Medium"
                                      : "Low",
                              style: TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            bookingItem.title,
                            maxLines: 1,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14.0),
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(bookingItem.description,
                              maxLines: 2,
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 12.0),
                              overflow: TextOverflow.ellipsis),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Text(
                                S.of(context).meeting_time,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.0),
                              ),
                              Text(
                                CommonUtil.instance.convertTo_dd_MMM_yyyy_hhmm(
                                    CommonUtil.instance.convertTo_DateTime(
                                        bookingItem.dateTime)),
                                maxLines: 2,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.0,
                                    color: ColorConstants.primaryColor),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Row(
                            children: [
                              Text(
                                S.of(context).meeting_duration_,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.0),
                              ),
                              Text(
                                "${bookingItem.meetingDuration} minutes",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12.0,
                                    color: ColorConstants.primaryColor),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          if (bookingItem.isCancelled == 1)
                            Row(
                              children: [
                                Text(
                                  S.of(context).booking_status,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12.0),
                                ),
                                Text(
                                  S.of(context).cancel_status,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12.0,
                                      color: Colors.red),
                                ),
                              ],
                            )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
