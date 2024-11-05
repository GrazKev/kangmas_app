import 'common_model.dart';
import '../utils/images.dart';

List<CommonModel> renovateServices = getRenovateServices();

List<CommonModel> getRenovateServices() {
  List<CommonModel> renovateServices = [];
  renovateServices.add(CommonModel.withoutIcon("Interior Rumah", room,isSelected: true));
  renovateServices.add(CommonModel.withoutIcon("Perdapuran", kitchen,isSelected: false));
  renovateServices.add(CommonModel.withoutIcon("Bangunan Komersil", building,isSelected: false));
  renovateServices.add(CommonModel.withoutIcon("Interior Kantor", office,isSelected: false));
  return renovateServices;
}
