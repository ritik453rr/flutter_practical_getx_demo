import 'package:get/get.dart';
import 'package:getx_demo/language/app_strings.dart';

// Manages translations for different languages in the application
class AppLanguge extends Translations {
  // Returns a map of language codes to their respective translations
  @override
  Map<String, Map<String, String>> get keys => {
        // English Language
        'en_US': {
          AppStrings.language: 'Language',
          AppStrings.ok: 'OK',
        },
        //Hindi Language
        'hi_IN': {
          AppStrings.language: 'भाषा',
        },
      };
}
