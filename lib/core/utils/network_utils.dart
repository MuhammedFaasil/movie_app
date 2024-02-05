import 'dart:io';

class NetworkUtils{
  static Future<bool> hasNetwork() async {
  try {
    final result = await InternetAddress.lookup('image.tmdb.org');
    return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
  } on SocketException catch (_) {
    return false;
  }
}
}
