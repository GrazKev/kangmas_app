import 'package:flutter/material.dart';
import 'package:kangmas_app/custom_widget/space.dart';
import 'package:kangmas_app/models/combos_services_model.dart';
import 'package:kangmas_app/screens/service_screen.dart';
import 'package:nb_utils/nb_utils.dart';

class CombosSubscriptionsComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 8),
        scrollDirection: Axis.horizontal,
        children: List.generate(
          combosServices.length,
          (index) => GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ServiceScreen(index: index)),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: SizedBox(
                      width: 170,
                      height: 100,
                      child: Image.asset(combosServices[index].imagePath!, fit: BoxFit.cover),
                    ),
                  ),
                  Space(8),
                  Text(
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    combosServices[index].title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ).expand(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
