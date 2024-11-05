import 'package:flutter/material.dart';

import 'common_model.dart';

List<CommonModel> homeConstruction = getHomeConstruction();

List<CommonModel> getHomeConstruction() {
  List<CommonModel> homeConstruction = [];
  homeConstruction.add(CommonModel.withoutImage("Perbaikan", Icon(Icons.construction, size: 35)));
  homeConstruction.add(CommonModel.withoutImage("Perkabelan", Icon(Icons.architecture, size: 35)));
  homeConstruction.add(CommonModel.withoutImage("Ahli Ruangan", Icon(Icons.house_siding, size: 35)));
  homeConstruction.add(CommonModel.withoutImage("Ahli Furnitur", Icon(Icons.vertical_split_rounded, size: 35)));
  homeConstruction.add(CommonModel.withoutImage("Konsultan", Icon(Icons.person, size: 35)));

  return homeConstruction;
}
