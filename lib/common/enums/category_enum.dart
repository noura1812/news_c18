import 'package:news_c18/common/gen/assets.gen.dart';

enum CategoryEnum {
  general,
  business,
  entertainment,
  tech;

  String getImage() {
    switch (this) {
      case CategoryEnum.general:
        return Assets.images.general.path;
      case CategoryEnum.business:
        return Assets.images.busniess.path;
      case CategoryEnum.entertainment:
        return Assets.images.entertainment.path;
      case CategoryEnum.tech:
        return Assets.images.tech.path;
    }
  }
}
