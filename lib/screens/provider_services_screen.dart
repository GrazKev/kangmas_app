import 'package:flutter/material.dart';
import 'package:kangmas_app/main.dart';
import 'package:kangmas_app/models/services_model.dart';
import 'package:kangmas_app/screens/service_screen.dart';

import '../custom_widget/space.dart';
import '../utils/colors.dart';
import '../utils/images.dart';

class ProviderServicesScreen extends StatefulWidget {
  final int serviceIndex;
  final int index;

  const ProviderServicesScreen({Key? key, required this.index, required this.serviceIndex}) : super(key: key);

  @override
  State<ProviderServicesScreen> createState() => _ProviderServicesScreenState();
}

class _ProviderServicesScreenState extends State<ProviderServicesScreen> {
  Color _textColor = transparent;
  Color _iconColor = Colors.white;

  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _textColor = _isSliverAppBarExpanded
              ? appData.isDark
                  ? whiteColor
                  : blackColor
              : transparent;
          _iconColor = _isSliverAppBarExpanded
              ? appData.isDark
                  ? whiteColor
                  : blackColor
              : whiteColor;
        });
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool get _isSliverAppBarExpanded {
    return _scrollController.hasClients && _scrollController.offset > (200);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      fixedSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height * 0.06),
                      foregroundColor: appData.isDark ? whiteColor : blackColor,
                      shape: StadiumBorder(),
                      side: BorderSide(color: appData.isDark ? whiteColor : blackColor, width: 1),
                    ),
                    child: Icon(Icons.message_rounded),
                    onPressed: () {
                      //
                    },
                  ),
                ),
                Space(16),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height * 0.06),
                      shape: StadiumBorder(),
                    ),
                    child: Text("Pesan", style: TextStyle(fontWeight: FontWeight.bold)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ServiceScreen(
                            index: serviceProviders[widget.serviceIndex].serviceProviders[widget.index].providerServices.length - 1,
                            fromBooking: true,
                            serviceIndex: widget.serviceIndex,
                            providerIndex: widget.index,
                          ),
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: customAppbarColor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: _iconColor),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            expandedHeight: MediaQuery.of(context).size.height * 0.35,
            flexibleSpace: FlexibleSpaceBar(background: Image.asset(room, fit: BoxFit.cover)),
            centerTitle: true,
            title: Text(
              "Tukang Ledeng",
              textAlign: TextAlign.center,
              style: TextStyle(color: _textColor, fontWeight: FontWeight.w900, fontSize: 20),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(top: 10),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: serviceProviders[widget.serviceIndex].serviceProviders[widget.index].providerServices.length,
              (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ServiceScreen(
                            index: index,
                            fromBooking: true,
                            serviceIndex: widget.serviceIndex,
                            providerIndex: widget.index,
                          ),
                        ));
                  },
                  child: Card(
                    color: transparent,
                    elevation: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              serviceProviders[widget.serviceIndex].serviceProviders[widget.index].providerServices[index].serviceImage,
                              width: 90,
                              height: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Space(32),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                serviceProviders[widget.serviceIndex].serviceProviders[widget.index].providerServices[index].serviceName,
                                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                              ),
                              Space(4),
                              Text(
                                "Menyelesaikan ${serviceProviders[widget.serviceIndex].serviceProviders[widget.index].providerServices[index].servicePrice} di bidang ini",
                                style: TextStyle(color: greyColor, fontWeight: FontWeight.w900, fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: SizedBox(height: MediaQuery.of(context).size.height * 0.07),
            ),
          )
        ],
      ),
    );
  }
}
