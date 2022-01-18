import 'package:flutter/src/widgets/editable_text.dart';

class PublishAdsModal {
   final String adName;
   final String adPrice;
   final String adDescription;

  PublishAdsModal({required this.adName, required this.adPrice, required this.adDescription});

 

  Map<String, dynamic> toMap() {
    return {
      "adName" : this.adName,
      "adPrice" : this.adPrice,
      "adDescription" :this.adDescription,
    };
  }
}
