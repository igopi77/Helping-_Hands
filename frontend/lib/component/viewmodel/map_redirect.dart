import 'package:url_launcher/url_launcher.dart';

class MapRedirect{
  static Future<void>openMap(double lat,double lon)async {
    String url = "https://www.google.com/maps/search/?api=1&query=$lon,$lat";
    // ignore: deprecated_member_use
    if(await(canLaunch(url))){
      // ignore: deprecated_member_use
      await launch(url);
    }
    else{
      throw 'sorry';
    }
  }
}