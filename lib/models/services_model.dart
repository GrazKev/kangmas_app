import 'package:flutter/material.dart';
import 'package:kangmas_app/models/service_provider_model.dart';
import 'package:kangmas_app/utils/images.dart';

List<ServicesModel> serviceProviders = getServices();

class ServicesModel {
  int id;
  String serviceName;
  String subName;
  String shortDescription;
  String serviceImage;
  IconData serviceIcon;
  List<ServiceProviderModel> serviceProviders;
  bool isSelected;

  ServicesModel(this.id, this.serviceName, this.shortDescription, this.subName, this.serviceProviders, this.serviceImage, this.serviceIcon, {this.isSelected = false});
}

List<ServicesModel> getServices() {
  List<ServicesModel> list = List.empty(growable: true);
  list.add(ServicesModel(1, "Tukang Ledeng", "Yang melayanimu di bidang perledengan", "Tukang Ledeng", getPlumbers(), plumber, Icons.plumbing, isSelected: true));
  list.add(ServicesModel(2, "Tukang Listrik", "Yang membantu di bidang listrik", "Tukang Listrik", getElectricians(), electrician, Icons.cable_outlined));
  list.add(ServicesModel(3, "Tukang Cat", "Yang membantu di bidang cat rumah", "Tukang Cat", getPainters(), painter, Icons.format_paint));
  list.add(ServicesModel(4, "Tukang Kayu", "Yang membantu di bidang perkayuan", "Tukang Kayu", getCarpenters(), carpenter, Icons.other_houses_sharp));
  list.add(ServicesModel(5, "Kebersihan", "Yang membantu anda membersihkan", "Kebersihan", getHomeCleaning(), homeCleaner, Icons.cleaning_services_sharp));
  list.add(ServicesModel(5, "Konsultan", "Yang membantumu melalui konsultan", "Konsultan", getHomeCleaning(), painter1, Icons.car_repair_outlined));
  list.add(ServicesModel(6, "Tukang Bengkel", "Yang membantu memperbaiki mobil", "Tukang Bengkel", getElectricians(), electrician, Icons.home_repair_service));
  return list;
}

void setLiked(int serviceIndex, int index) {
  if (serviceProviders[serviceIndex].serviceProviders[index].isLiked) {
    serviceProviders[serviceIndex].serviceProviders[index].isLiked = false;
    removeFavouriteProvider(serviceIndex, index);
  } else {
    serviceProviders[serviceIndex].serviceProviders[index].isLiked = true;
    addFavouriteProvider(serviceIndex, index);
  }
}
