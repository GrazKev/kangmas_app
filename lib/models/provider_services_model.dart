import '../utils/images.dart';

List<ProviderServicesModel> providerServices = getProviderServices();

class ProviderServicesModel {
  String serviceImage;
  String serviceName;
  int servicePrice;

  ProviderServicesModel(this.serviceImage, this.serviceName, this.servicePrice);
}

List<ProviderServicesModel> getProviderServices() {
  List<ProviderServicesModel> list = [];
  list.add(ProviderServicesModel(sofa, "Tukang Ledeng", 750));
  list.add(ProviderServicesModel(kitchen, "Tukang Listrik", 1000));
  list.add(ProviderServicesModel(bathroom, "Tukang Bengkel", 1250));
  list.add(ProviderServicesModel(carpet, "Ahli Konsultan", 750));
  list.add(ProviderServicesModel(home, "Tukang Kebersihan", 1000));
  return list;
}
