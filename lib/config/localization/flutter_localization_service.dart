import 'package:flutter_localization/flutter_localization.dart';
import 'locale/arabic.dart';
import 'locale/english.dart';

class FlutterLocalizationService {
  static final FlutterLocalizationService _instance =
      FlutterLocalizationService._internal();

  factory FlutterLocalizationService() => _instance;

  FlutterLocalizationService._internal();

  final FlutterLocalization localization = FlutterLocalization.instance;
  Future<void> init() async {
    await localization.ensureInitialized();

    localization.init(
      mapLocales: [
        const MapLocale('en', EnglishMap.EN),
        const MapLocale('ar', ArabicMap.AR),
      ],
      initLanguageCode: 'ar', // default language
    );

    localization.onTranslatedLanguage = (locale) {};
  }
}
