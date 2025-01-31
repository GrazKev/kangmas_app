import 'package:flutter/material.dart';
import 'package:kangmas_app/components/service_list_component.dart';
import 'package:kangmas_app/screens/provider_services_screen.dart';
import 'package:kangmas_app/utils/widgets.dart';

import '../custom_widget/space.dart';
import '../main.dart';
import '../models/renovate_services_model.dart';
import '../models/services_model.dart';
import '../utils/colors.dart';
import 'all_categories_screen.dart';

class ProviderDetailScreen extends StatefulWidget {
  final int serviceIndex;
  final int index;

  const ProviderDetailScreen({Key? key, required this.serviceIndex, required this.index}) : super(key: key);

  @override
  State<ProviderDetailScreen> createState() => _ProviderDetailScreenState();
}

class _ProviderDetailScreenState extends State<ProviderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, true);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: transparent,
          title: Text(
            "Detail",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
          ),
        ),
        bottomSheet: BottomSheet(
          elevation: 10,
          enableDrag: false,
          builder: (context) {
            return Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          foregroundColor: appData.isDark ? whiteColor : blackColor,
                          fixedSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height * 0.06),
                          shape: StadiumBorder(),
                          side: BorderSide(color: appData.isDark ? whiteColor : blackColor, width: 1)),
                      child: Icon(Icons.message_rounded, size: 20),
                      onPressed: () {
                        //
                      },
                    ),
                  ),
                  Space(16),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        backgroundColor: appData.isDark ? Colors.grey.withOpacity(0.2) : Colors.black,
                        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 32),
                        fixedSize: Size(140, 45),
                      ),
                      child: Text(
                        "Pesan",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProviderServicesScreen(serviceIndex: widget.serviceIndex, index: widget.index),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
          onClosing: () {},
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  serviceProviders[widget.serviceIndex].serviceProviders[widget.index].name,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  serviceProviders[widget.serviceIndex].serviceProviders[widget.index].detailDescription,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 6,
                  textAlign: TextAlign.start,
                  style: TextStyle(color: subTitle, fontSize: 14),
                ),
              ),
              Space(8),
              Padding(
                padding: EdgeInsets.all(16),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        foregroundDecoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [blackColor, transparent, transparent, transparent],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            stops: [0, 0.2, 0.8, 1],
                          ),
                        ),
                        child: Image.asset(
                          serviceProviders[widget.serviceIndex].serviceProviders[widget.index].providerImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 8,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Text("jobs", style: TextStyle(color: whiteColor, fontSize: 12)),
                                Space(4),
                                Text(
                                  serviceProviders[widget.serviceIndex].serviceProviders[widget.index].jobs,
                                  style: TextStyle(color: whiteColor, fontWeight: FontWeight.w900, fontSize: 18),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text("bagi", style: TextStyle(color: whiteColor, fontSize: 12)),
                                Space(4),
                                Icon(
                                  Icons.share,
                                  color: whiteColor,
                                  size: 18,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text("Rating", style: TextStyle(color: whiteColor, fontSize: 12)),
                                Space(4),
                                Text(
                                  serviceProviders[widget.serviceIndex].serviceProviders[widget.index].star,
                                  style: TextStyle(color: whiteColor, fontWeight: FontWeight.w900, fontSize: 18),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text("Simpan", style: TextStyle(color: whiteColor, fontSize: 12)),
                                Space(4),
                                GestureDetector(
                                  onTap: () {
                                    setLiked(widget.serviceIndex, widget.index);
                                    setState(() {});
                                  },
                                  child: serviceProviders[widget.serviceIndex].serviceProviders[widget.index].isLiked
                                      ? Icon(Icons.favorite, color: Colors.red, size: 18)
                                      : Icon(
                                          Icons.favorite,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Space(32),
              homeTitleWidget(
                titleText: "Proyek Saat Ini",
                onAllTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AllCategoriesScreen(
                        list: renovateServices,
                        fromProviderDetails: true,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 130,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  children: List.generate(
                    renovateServices.length,
                    (index) => ServiceListComponent(commonModel: renovateServices[index], index: index),
                  ),
                ),
              ),
              Space(70),
            ],
          ),
        ),
      ),
    );
  }
}
