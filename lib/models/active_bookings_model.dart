import 'package:kangmas_app/utils/images.dart';

List<ActiveBookingsModel> activeBooking = getActiveBooking();

class ActiveBookingsModel {
  int id;
  String serviceName;
  String serviceImage;
  String name;
  String date;
  String time;
  String status;
  int price;

  ActiveBookingsModel(this.id, this.serviceName, this.serviceImage, this.name, this.date, this.time, this.status, this.price);
}

List<ActiveBookingsModel> getActiveBooking() {
  List<ActiveBookingsModel> list = List.empty(growable: true);
  list.add(
    ActiveBookingsModel(0, "Tukang Ledeng", home, "Tukang Gracias Kevin", "Jan 4,2022", "17.00", "Dalam Proses", 10000),
  );
  list.add(
    ActiveBookingsModel(1, "Tukang Listrik", home, "Tukang Gracias Kevin", "Dec 4,2022", "18.00", "Bertugas", 3000),
  );
  list.add(
    ActiveBookingsModel(2, "Tukang Bengkel", home, "Tukang Gracias Kevin", "Feb 17,2022", "18.00", "Bertugas", 5000),
  );
  return list;
}

void cancelBooking(int id) {
  activeBooking.removeAt(id);
}
