// To parse this JSON data, do
//
//     final adsIdsModel = adsIdsModelFromJson(jsonString);

import 'dart:convert';

AdsIdsModel adsIdsModelFromJson(String str) =>
    AdsIdsModel.fromJson(json.decode(str));

String adsIdsModelToJson(AdsIdsModel data) => json.encode(data.toJson());

class AdsIdsModel {
  final Admob? admob;
  final Admob? adx;
  final String? atme;
  final Facebook? facebook;
  final int? howManyClick;
  final String? keywords;
  final String? qureka;
  final Unity? unity;

  AdsIdsModel({
    this.admob,
    this.adx,
    this.atme,
    this.facebook,
    this.howManyClick,
    this.keywords,
    this.qureka,
    this.unity,
  });

  factory AdsIdsModel.fromJson(Map<String, dynamic> json) => AdsIdsModel(
        admob: json["admob"] == null ? null : Admob.fromJson(json["admob"]),
        adx: json["adx"] == null ? null : Admob.fromJson(json["adx"]),
        atme: json["atme"],
        facebook: json["facebook"] == null
            ? null
            : Facebook.fromJson(json["facebook"]),
        howManyClick: json["howManyClick"],
        keywords: json["keywords"],
        qureka: json["qureka"],
        unity: json["unity"] == null ? null : Unity.fromJson(json["unity"]),
      );

  Map<String, dynamic> toJson() => {
        "admob": admob?.toJson(),
        "adx": adx?.toJson(),
        "atme": atme,
        "facebook": facebook?.toJson(),
        "howManyClick": howManyClick,
        "keywords": keywords,
        "qureka": qureka,
        "unity": unity?.toJson(),
      };
}

class Admob {
  final String? aOpenAd;
  final String? bannerAd;
  final String? intertitialAd;
  final int? isShow;
  final String? nativeAd;
  final String? rewaredIntertitialAd;

  Admob({
    this.aOpenAd,
    this.bannerAd,
    this.intertitialAd,
    this.isShow,
    this.nativeAd,
    this.rewaredIntertitialAd,
  });

  factory Admob.fromJson(Map<String, dynamic> json) => Admob(
        aOpenAd: json["a_open_ad"],
        bannerAd: json["banner_ad"],
        intertitialAd: json["intertitial_ad"],
        isShow: json["isShow"],
        nativeAd: json["native_ad"],
        rewaredIntertitialAd: json["rewared_intertitial_ad"],
      );

  Map<String, dynamic> toJson() => {
        "a_open_ad": aOpenAd,
        "banner_ad": bannerAd,
        "intertitial_ad": intertitialAd,
        "isShow": isShow,
        "native_ad": nativeAd,
        "rewared_intertitial_ad": rewaredIntertitialAd,
      };
}

class Facebook {
  final String? appId;
  final String? bannerAd;
  final String? intertitialAd;
  final int? isShow;
  final String? mediumRectengle;
  final String? nativeAd;
  final String? nativeBannerAd;
  final String? rewaredIntertitialAd;

  Facebook({
    this.appId,
    this.bannerAd,
    this.intertitialAd,
    this.isShow,
    this.mediumRectengle,
    this.nativeAd,
    this.nativeBannerAd,
    this.rewaredIntertitialAd,
  });

  factory Facebook.fromJson(Map<String, dynamic> json) => Facebook(
        appId: json["app_id"],
        bannerAd: json["banner_ad"],
        intertitialAd: json["intertitial_ad"],
        isShow: json["isShow"],
        mediumRectengle: json["medium_rectengle"],
        nativeAd: json["native_ad"],
        nativeBannerAd: json["native_banner_ad"],
        rewaredIntertitialAd: json["rewared_intertitial_ad"],
      );

  Map<String, dynamic> toJson() => {
        "app_id": appId,
        "banner_ad": bannerAd,
        "intertitial_ad": intertitialAd,
        "isShow": isShow,
        "medium_rectengle": mediumRectengle,
        "native_ad": nativeAd,
        "native_banner_ad": nativeBannerAd,
        "rewared_intertitial_ad": rewaredIntertitialAd,
      };
}

class Unity {
  final String? bannerAd;
  final String? gameId;
  final String? intertitialAd;
  final int? isShow;
  final String? rewaredIntertitialAd;

  Unity({
    this.bannerAd,
    this.gameId,
    this.intertitialAd,
    this.isShow,
    this.rewaredIntertitialAd,
  });

  factory Unity.fromJson(Map<String, dynamic> json) => Unity(
        bannerAd: json["banner_ad"],
        gameId: json["game_id"],
        intertitialAd: json["intertitial_ad"],
        isShow: json["isShow"],
        rewaredIntertitialAd: json["rewared_intertitial_ad"],
      );

  Map<String, dynamic> toJson() => {
        "banner_ad": bannerAd,
        "game_id": gameId,
        "intertitial_ad": intertitialAd,
        "isShow": isShow,
        "rewared_intertitial_ad": rewaredIntertitialAd,
      };
}
