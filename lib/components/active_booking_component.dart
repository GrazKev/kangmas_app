import 'package:flutter/material.dart';
import 'package:kangmas_app/custom_widget/space.dart';
import 'package:kangmas_app/main.dart';
import 'package:kangmas_app/models/active_bookings_model.dart';
import 'package:kangmas_app/screens/cancel_booking_screen.dart';
import 'package:kangmas_app/utils/colors.dart';
import 'package:kangmas_app/utils/images.dart';

class ActiveBookingComponent extends StatelessWidget {
  final ActiveBookingsModel? activeBookingsModel;
  final int index;

  ActiveBookingComponent(this.index, {this.activeBookingsModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CancelBookingScreen(activeId: index)),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
          color: appData.isDark ? cardColorDark : cardColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      activeBookingsModel!.serviceName,
                      textAlign: TextAlign.start,
                      style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                    ),
                    Text(
                      activeBookingsModel!.status,
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: activeBookingsModel!.status == "Dalam Proses" ? orangeColor : blueColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                Space(4),
                Divider(color: dividerColor, thickness: 1),
                Space(2),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.height * 0.06,
                        child: Image.asset(home, fit: BoxFit.cover),
                      ),
                    ),
                    Space(8),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(activeBookingsModel!.name, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18)),
                        Space(4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.watch_later_outlined, color: orangeColor, size: 16),
                            Space(2),
                            Text(activeBookingsModel!.date, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                            Space(2),
                            Text("di", style: TextStyle(color: orangeColor, fontSize: 12)),
                            Space(2),
                            Text(activeBookingsModel!.time, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Space(4),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Rp.${activeBookingsModel!.price}",
                    textAlign: TextAlign.end,
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                  ),
                ),
                Space(4),
                Divider(color: dividerColor, thickness: 1),
                Space(4),
                Text(
                  "Batalkan",
                  textAlign: TextAlign.start,
                  style: TextStyle(color: blueColor, fontWeight: FontWeight.w900, fontSize: 18),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
