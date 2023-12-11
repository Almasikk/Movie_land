import 'package:vk_copy/localization/localizations.dart';

class DataModel {
  final String title;
  final String imageName;
  final double price;
  DataModel(
      this.title,
      this.imageName,
      this.price,
      );
}

List<DataModel> dataList = [
  DataModel(MyLocalizations.venom, "assets/images/358680934_6591675907551361_7872116745136174677_n.png", 2024),
  DataModel(MyLocalizations.deadpool, "assets/images/Deadpool3.webp", 2024),
  DataModel(MyLocalizations.kungfuPanda, "assets/images/dfwpwo8-07a8bf16-f7ad-4ae1-9258-3d1d6a289bcd.jpg", 2024),
  DataModel(MyLocalizations.furiosa, "assets/images/furiosa-button-1701465096703.jpg", 2024),
];
