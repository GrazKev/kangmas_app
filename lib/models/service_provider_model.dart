import 'package:kangmas_app/models/provider_services_model.dart';
import 'package:kangmas_app/models/services_model.dart';
import 'package:kangmas_app/utils/images.dart';

List<ServiceProviderModel> likedProviders = getLikedServices();

class ServiceProviderModel {
  int id;
  String name;
  String providerImage;
  String occupation;
  String star;
  String detailDescription;
  String jobs;
  String perHourPrice;
  bool isLiked;
  List<ProviderServicesModel> providerServices;

  ServiceProviderModel(this.id, this.name, this.providerImage, this.occupation, this.star, this.detailDescription, this.jobs, this.perHourPrice, this.isLiked, this.providerServices);
}

List<ServiceProviderModel> getPlumbers() {
  List<ServiceProviderModel> list = List.empty(growable: true);
  list.add(ServiceProviderModel(
    0,
    "Gracias Kevin",
    plumber,
    "Tukang Ledeng",
    "3.5",
    "Tukang ledeng adalah blablablablabla",
    "120",
    "330",
    false,
    getProviderServices(),
  ));
  list.add(ServiceProviderModel(0, "Gracias Kevin", homeCleaner, "Tukang Ledeng", "3.5", "Hi", "120", "350", false, getProviderServices()));
  list.add(ServiceProviderModel(0, "Gracias Kevin", homeCleaner, "Tukang Ledeng", "3.5", "Hi", "120", "350", false, getProviderServices()));
  list.add(ServiceProviderModel(0, "Gracias Kevin", homeCleaner, "Tukang Ledeng", "3.5", "Hi", "120", "350", false, getProviderServices()));
  return list;
}

List<ServiceProviderModel> getElectricians() {
  List<ServiceProviderModel> list = List.empty(growable: true);
  list.add(ServiceProviderModel(1, "Gracias Kevin", homeCleaner, "Tukang Ledeng", "3.5", "Hi", "120", "350", false, getProviderServices()));
  list.add(ServiceProviderModel(1, "Gracias Kevin", homeCleaner, "Tukang Ledeng", "3.5", "Hi", "120", "350", false, getProviderServices()));
  list.add(ServiceProviderModel(1, "Gracias Kevin", homeCleaner, "Tukang Ledeng", "3.5", "Hi", "120", "350", false, getProviderServices()));
  list.add(ServiceProviderModel(1, "Gracias Kevin", homeCleaner, "Tukang Ledeng", "3.5", "Hi", "120", "350", false, getProviderServices()));
  return list;
}

List<ServiceProviderModel> getPainters() {
  List<ServiceProviderModel> list = List.empty(growable: true);
  list.add(ServiceProviderModel(2, "Gracias Kevin", homeCleaner, "Tukang Ledeng", "3.5", "Hi", "120", "350", false, getProviderServices()));
  list.add(ServiceProviderModel(2, "Gracias Kevin", homeCleaner, "Tukang Ledeng", "3.5", "Hi", "120", "350", false, getProviderServices()));
  list.add(ServiceProviderModel(2, "Gracias Kevin", homeCleaner, "Tukang Ledeng", "3.5", "Hi", "120", "350", false, getProviderServices()));
  list.add(ServiceProviderModel(2, "Gracias Kevin", homeCleaner, "Tukang Ledeng", "3.5", "Hi", "120", "350", false, getProviderServices()));
  return list;
}

List<ServiceProviderModel> getCarpenters() {
  List<ServiceProviderModel> list = List.empty(growable: true);
  list.add(ServiceProviderModel(3, "Gracias Kevin", homeCleaner, "Tukang Ledeng", "3.5", "Hi", "120", "350", false, getProviderServices()));
  list.add(ServiceProviderModel(3, "Gracias Kevin", homeCleaner, "Tukang Ledeng", "3.5", "Hi", "120", "350", false, getProviderServices()));
  list.add(ServiceProviderModel(3, "Gracias Kevin", homeCleaner, "Tukang Ledeng", "3.5", "Hi", "120", "350", false, getProviderServices()));
  list.add(ServiceProviderModel(3, "Gracias Kevin", homeCleaner, "Tukang Ledeng", "3.5", "Hi", "120", "350", false, getProviderServices()));
  return list;
}

List<ServiceProviderModel> getHomeCleaning() {
  List<ServiceProviderModel> list = List.empty(growable: true);
  list.add(ServiceProviderModel(
    4,
    "Gracias Kevin",
    homeCleaner,
    "Tukang Ledeng",
    "3.5",
    "Tukang ledeng adalah blablblabla",
    "1000",
    "150",
    true,
    getProviderServices(),
  ));
  list.add(ServiceProviderModel(
    4,
    "Gracias Kevin",
    homeCleaner,
    "Tukang Ledeng",
    "3.5",
    "Tukang ledeng adalah blablblabla",
    "1000",
    "150",
    false,
    getProviderServices(),
  ));
  list.add(ServiceProviderModel(
    4,
    "Gracias Kevin",
    homeCleaner,
    "Tukang Ledeng",
    "3.5",
    "Tukang ledeng adalah blablblabla",
    "1000",
    "150",
    false,
    getProviderServices(),
  ));
  list.add(ServiceProviderModel(
    4,
    "Gracias Kevin",
    homeCleaner,
    "Tukang Ledeng",
    "3.5",
    "Tukang ledeng adalah blablblabla",
    "1000",
    "150",
    true,
    getProviderServices(),
  ));
  list.add(ServiceProviderModel(
    4,
    "Gracias Kevin",
    homeCleaner,
    "Tukang Ledeng",
    "3.5",
    "Tukang ledeng adalah blablblabla",
    "1000",
    "150",
    false,
    getProviderServices(),
  ));
  return list;
}

List<ServiceProviderModel> getLikedServices() {
  List<ServiceProviderModel> list = List.empty(growable: true);
  list.add(ServiceProviderModel(
    0,
    "Gracias Kevin",
    homeCleaner,
    "Tukang Ledeng",
    "3.5",
    "Tukang ledeng adalah blablblabla",
    "1000",
    "150",
    true,
    getProviderServices(),
  ));
  list.add(ServiceProviderModel(
    1,
    "Gracias Kevin",
    homeCleaner,
    "Tukang Ledeng",
    "3.5",
    "Tukang ledeng adalah blablblabla",
    "1000",
    "150",
    true,
    getProviderServices(),
  ));
  return list;
}

void addFavouriteProvider(int serviceIndex, int index) {
  likedProviders.add(ServiceProviderModel(
    serviceProviders[serviceIndex].serviceProviders[index].id,
    serviceProviders[serviceIndex].serviceProviders[index].name,
    serviceProviders[serviceIndex].serviceProviders[index].providerImage,
    serviceProviders[serviceIndex].serviceProviders[index].occupation,
    serviceProviders[serviceIndex].serviceProviders[index].star,
    serviceProviders[serviceIndex].serviceProviders[index].detailDescription,
    serviceProviders[serviceIndex].serviceProviders[index].jobs,
    serviceProviders[serviceIndex].serviceProviders[index].perHourPrice,
    true,
    serviceProviders[serviceIndex].serviceProviders[index].providerServices,
  ));
}

void removeFavouriteProvider(int serviceIndex, int index) {
  for (int i = 0; i < likedProviders.length; i++) {
    if (serviceProviders[serviceIndex].serviceProviders[index].name == likedProviders[i].name) {
      likedProviders.removeAt(i);
    }
  }
}
