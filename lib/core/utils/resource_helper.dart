import 'package:cine_shelf/core/utils/log_utils.dart';

class ResourceHelper {
  static String getImagePath(String filename) {
    final resource = "assets/images/$filename";
    LogUtils.log("RESOURCE_HELPER_IMAGE", resource);
    return resource;
  }
}
