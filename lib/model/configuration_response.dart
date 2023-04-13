import 'dart:convert';

import 'package:booking_system_flutter/model/country_list_model.dart';

class ConfigurationResponse {
  List<Configuration>? configurations;
  List<PaymentSetting>? paymentSettings;
  int? notificationUnreadCount;
  PrivacyPolicy? privacyPolicy;
  AppDownload? appDownload;
  PrivacyPolicy? termConditions;
  String? inquiryEmail;
  String? helplineNumber;
  List<LanguageOption>? languageOption;
  String? isAdvancedPaymentAllowed;
  bool? enableUserWallet;
  GeneralSettingModel? generalSetting;

  ConfigurationResponse({
    this.configurations,
    this.appDownload,
    this.paymentSettings,
    this.notificationUnreadCount,
    this.privacyPolicy,
    this.termConditions,
    this.inquiryEmail,
    this.helplineNumber,
    this.languageOption,
    this.isAdvancedPaymentAllowed,
    this.enableUserWallet,
    this.generalSetting,
  });

  factory ConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return ConfigurationResponse(
      configurations: json['configurations'] != null ? (json['configurations'] as List).map((i) => Configuration.fromJson(i)).toList() : null,
      paymentSettings: json['payment_settings'] != null ? (json['payment_settings'] as List).map((i) => PaymentSetting.fromJson(i)).toList() : null,
      notificationUnreadCount: json['notification_unread_count'],
      privacyPolicy: json['privacy_policy'] != null ? PrivacyPolicy.fromJson(json['privacy_policy']) : null,
      appDownload: json['app_download'] != null ? AppDownload.fromJson(json['app_download']) : null,
      termConditions: json['term_conditions'] != null ? PrivacyPolicy.fromJson(json['term_conditions']) : null,
      generalSetting: json['general_settings'] != null ? GeneralSettingModel.fromJson(json['general_settings']) : null,
      inquiryEmail: json['inquriy_email'],
      helplineNumber: json['helpline_number'],
      languageOption: json['language_option'] != null ? (json['language_option'] as List).map((i) => LanguageOption.fromJson(i)).toList() : null,
      isAdvancedPaymentAllowed: json['is_advanced_payment_allowed'],
      enableUserWallet: json['enable_user_wallet'] == '1',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    if (this.configurations != null) {
      data['configurations'] = this.configurations!.map((v) => v.toJson()).toList();
    }
    if (this.paymentSettings != null) {
      data['payment_settings'] = this.paymentSettings!.map((v) => v.toJson()).toList();
    }
    if (this.privacyPolicy != null) {
      data['privacy_policy'] = this.privacyPolicy;
    }
    if (this.appDownload != null) {
      data['app_download'] = this.appDownload;
    }
    if (this.termConditions != null) {
      data['term_conditions'] = this.termConditions;
    }
    if (this.generalSetting != null) {
      data['general_settings'] = this.generalSetting;
    }
    data['inquriy_email'] = this.inquiryEmail;
    data['helpline_number'] = this.helplineNumber;

    if (this.languageOption != null) {
      data['language_option'] = this.languageOption!.map((v) => v.toJson()).toList();
    }

    data['is_advanced_payment_allowed'] = this.isAdvancedPaymentAllowed;
    data['enable_user_wallet'] = this.enableUserWallet;
    return data;
  }
}

class PrivacyPolicy {
  int? id;
  String? key;
  String? type;
  String? value;

  PrivacyPolicy({this.id, this.key, this.type, this.value});

  factory PrivacyPolicy.fromJson(Map<String, dynamic> json) {
    return PrivacyPolicy(
      id: json['id'],
      key: json['key'],
      type: json['type'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['key'] = this.key;
    data['type'] = this.type;
    data['value'] = this.value;
    return data;
  }
}

class Configuration {
  CountryListResponse? country;
  int? id;
  String? key;
  String? type;
  String? value;

  Configuration({this.country, this.id, this.key, this.type, this.value});

  factory Configuration.fromJson(Map<String, dynamic> json) {
    return Configuration(
      country: json['country'] != null ? CountryListResponse.fromJson(json['country']) : null,
      id: json['id'],
      key: json['key'],
      type: json['type'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['key'] = this.key;
    data['type'] = this.type;
    data['value'] = this.value;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    return data;
  }
}

class PaymentSetting {
  int? id;
  int? isTest;
  LiveValue? liveValue;
  int? status;
  String? title;
  String? type;
  LiveValue? testValue;

  PaymentSetting({this.id, this.isTest, this.liveValue, this.status, this.title, this.type, this.testValue});

  static String encode(List<PaymentSetting> paymentList) {
    return json.encode(paymentList.map<Map<String, dynamic>>((payment) => payment.toJson()).toList());
  }

  static List<PaymentSetting> decode(String musics) {
    return (json.decode(musics) as List<dynamic>).map<PaymentSetting>((item) => PaymentSetting.fromJson(item)).toList();
  }

  factory PaymentSetting.fromJson(Map<String, dynamic> json) {
    return PaymentSetting(
      id: json['id'],
      isTest: json['is_test'],
      liveValue: json['live_value'] != null ? LiveValue.fromJson(json['live_value']) : null,
      status: json['status'],
      title: json['title'],
      type: json['type'],
      testValue: json['value'] != null ? LiveValue.fromJson(json['value']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['is_test'] = this.isTest;
    data['status'] = this.status;
    data['title'] = this.title;
    data['type'] = this.type;
    if (this.liveValue != null) {
      data['live_value'] = this.liveValue?.toJson();
    }
    if (this.testValue != null) {
      data['value'] = this.testValue?.toJson();
    }
    return data;
  }
}

class LiveValue {
  /// For Stripe
  String? stripeUrl;
  String? stripeKey;
  String? stripePublickey;

  /// For Razor Pay
  String? razorUrl;
  String? razorKey;
  String? razorSecret;

  /// For Flutter Wave
  String? flutterwavePublic;
  String? flutterwaveSecret;
  String? flutterwaveEncryption;

  /// For PayStack
  String? paypalUrl;

  /// For Sadad
  String? sadadId;
  String? sadadKey;
  String? sadadDomain;

  /// For CinetPay
  String? cinetId;
  String? cinetKey;
  String? cinetPublicKey;

  LiveValue({
    this.stripeUrl,
    this.stripeKey,
    this.stripePublickey,
    this.razorUrl,
    this.razorKey,
    this.razorSecret,
    this.flutterwavePublic,
    this.flutterwaveSecret,
    this.flutterwaveEncryption,
    this.paypalUrl,
    this.sadadId,
    this.sadadKey,
    this.sadadDomain,
    this.cinetId,
    this.cinetKey,
    this.cinetPublicKey,
  });

  factory LiveValue.fromJson(Map<String, dynamic> json) {
    return LiveValue(
      stripeUrl: json['stripe_url'],
      stripeKey: json['stripe_key'],
      stripePublickey: json['stripe_publickey'],
      razorUrl: json['razor_url'],
      razorKey: json['razor_key'],
      razorSecret: json['razor_secret'],
      flutterwavePublic: json['flutterwave_public'],
      flutterwaveSecret: json['flutterwave_secret'],
      flutterwaveEncryption: json['flutterwave_encryption'],
      paypalUrl: json['paypal_url'],
      sadadId: json['sadad_id'],
      sadadKey: json['sadad_key'],
      sadadDomain: json['sadad_domain'],
      cinetId: json['cinet_id'],
      cinetKey: json['cinet_key'],
      cinetPublicKey: json['cinet_publickey'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['stripe_url'] = this.stripeUrl;
    data['stripe_key'] = this.stripeKey;
    data['stripe_publickey'] = this.stripePublickey;
    data['razor_url'] = this.razorUrl;
    data['razor_key'] = this.razorKey;
    data['razor_secret'] = this.razorSecret;
    data['flutterwave_public'] = this.flutterwavePublic;
    data['flutterwave_secret'] = this.flutterwaveSecret;
    data['flutterwave_encryption'] = this.flutterwaveEncryption;
    data['paypal_url'] = this.paypalUrl;
    data['sadad_id'] = this.sadadId;
    data['sadad_key'] = this.sadadKey;
    data['sadad_domain'] = this.sadadDomain;
    data['cinet_id'] = this.cinetId;
    data['cinet_key'] = this.cinetKey;
    data['cinet_publickey'] = this.cinetPublicKey;

    return data;
  }
}

class LanguageOption {
  String? flagImage;
  String? id;
  String? title;

  LanguageOption({this.flagImage, this.id, this.title});

  factory LanguageOption.fromJson(Map<String, dynamic> json) {
    return LanguageOption(
      flagImage: json['flag_image'],
      id: json['id'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flag_image'] = this.flagImage;
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}

class AppDownload {
  String? appstore_url;
  String? created_at;
  String? description;
  int? id;
  String? playstore_url;
  String? provider_appstore_url;
  String? provider_playstore_url;
  String? title;
  String? updated_at;

  AppDownload({
    this.appstore_url,
    this.created_at,
    this.description,
    this.id,
    this.playstore_url,
    this.provider_appstore_url,
    this.provider_playstore_url,
    this.title,
    this.updated_at,
  });

  factory AppDownload.fromJson(Map<String, dynamic> json) {
    return AppDownload(
      appstore_url: json['appstore_url'],
      created_at: json['created_at'],
      description: json['description'],
      id: json['id'],
      playstore_url: json['playstore_url'],
      provider_appstore_url: json['provider_appstore_url'],
      provider_playstore_url: json['provider_playstore_url'],
      title: json['title'],
      updated_at: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['appstore_url'] = this.appstore_url;
    data['created_at'] = this.created_at;
    data['description'] = this.description;
    data['id'] = this.id;
    data['playstore_url'] = this.playstore_url;
    data['provider_appstore_url'] = this.provider_appstore_url;
    data['provider_playstore_url'] = this.provider_playstore_url;
    data['title'] = this.title;
    data['updated_at'] = this.updated_at;
    return data;
  }
}

class GeneralSettingModel {
  String? earningType;
  String? facebookUrl;
  String? helplineNumber;
  String? inquriyEmail;
  String? instagramUrl;
  List<String>? languageOption;
  String? linkedinUrl;
  String? rememberToken;
  String? siteCopyright;
  String? siteDescription;
  String? siteEmail;
  String? siteFavicon;
  String? siteLogo;
  String? siteName;
  String? timeZone;
  String? twitterUrl;
  String? youtubeUrl;

  GeneralSettingModel({
    this.earningType,
    this.facebookUrl,
    this.helplineNumber,
    this.inquriyEmail,
    this.instagramUrl,
    this.languageOption,
    this.linkedinUrl,
    this.rememberToken,
    this.siteCopyright,
    this.siteDescription,
    this.siteEmail,
    this.siteFavicon,
    this.siteLogo,
    this.siteName,
    this.timeZone,
    this.twitterUrl,
    this.youtubeUrl,
  });

  factory GeneralSettingModel.fromJson(Map<String, dynamic> json) {
    return GeneralSettingModel(
      earningType: json['earning_type'],
      facebookUrl: json['facebook_url'],
      helplineNumber: json['helpline_number'],
      inquriyEmail: json['inquriy_email'],
      instagramUrl: json['instagram_url'],
      linkedinUrl: json['linkedin_url'],
      //rememberToken: json['remember_token'],
      siteCopyright: json['site_copyright'],
      siteDescription: json['site_description'],
      //siteEmail: json['site_email'],
      //siteFavicon: json['site_favicon'],
      siteLogo: json['site_logo'],
      //siteName: json['site_name'],
      //timeZone: json['time_zone'],
      twitterUrl: json['twitter_url'],
      youtubeUrl: json['youtube_url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['earning_type'] = this.earningType;
    data['facebook_url'] = this.facebookUrl;
    data['helpline_number'] = this.helplineNumber;
    data['inquriy_email'] = this.inquriyEmail;
    data['instagram_url'] = this.instagramUrl;
    data['linkedin_url'] = this.linkedinUrl;
    data['remember_token'] = this.rememberToken;
    data['site_copyright'] = this.siteCopyright;
    data['site_description'] = this.siteDescription;
    data['site_email'] = this.siteEmail;
    data['site_favicon'] = this.siteFavicon;
    data['site_logo'] = this.siteLogo;
    data['site_name'] = this.siteName;
    data['time_zone'] = this.timeZone;
    data['twitter_url'] = this.twitterUrl;
    data['youtube_url'] = this.youtubeUrl;
    if (this.languageOption != null) {
      data['language_option'] = this.languageOption;
    }
    return data;
  }
}