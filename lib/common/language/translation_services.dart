import 'package:demo/common/language/language_string.dart';
import 'package:get/get.dart';

class TranslationServices extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          LanguageString.hello: 'Hello',
          LanguageString.share: "Share",
        },
        'ur_PK': {
          LanguageString.hello: 'ہیلو', // 'Hello' in Urdu
          LanguageString.share: 'شیئر کریں', // 'Share' in Urdu
        },
      };
}
