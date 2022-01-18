import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter_task/model/ads.dart';

class AdsNotifier with ChangeNotifier {
  List<Ads> _adsList = [];
  late Ads _currentAds;

  UnmodifiableListView<Ads> get adsList => UnmodifiableListView(_adsList);

  set adsList(List<Ads> adsList) {
    _adsList = adsList;
    notifyListeners();
  }

  set currentAds(Ads ads) {
    _currentAds = ads;
    notifyListeners();
  }
}
