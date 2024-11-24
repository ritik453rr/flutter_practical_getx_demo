import 'package:demo/common/languages/language_string.dart';
import 'package:get/get.dart';

class TranslationServices extends Translations {
  @override
  Map<String, Map<String, String>> get keys => translations;

  final Map<String, Map<String, String>> translations = {
    // English translations
    'en_US': {
      LanguageString.signIn: 'Sign In',
      LanguageString.welcome:
          'Please login with one of the options to continue using our app.',
      LanguageString.email: 'Email',
      LanguageString.enterEmail: 'Enter your email',
      LanguageString.enterPassword: 'Enter your password',
      LanguageString.login: 'Log In',
      LanguageString.dontHaveAccount: 'Don’t have an account?',
      LanguageString.signUp: 'Sign up',
    },
    // Hindi translations
    'hi_IN': {
      LanguageString.signIn: 'साइन इन करें', // Sign In in Hindi
      LanguageString.welcome:
          'कृपया हमारे ऐप का उपयोग जारी रखने के लिए विकल्पों में से एक से लॉगिन करें।', // Welcome message in Hindi
      LanguageString.email: 'ईमेल', // Email in Hindi
      LanguageString.enterEmail:
          'अपना ईमेल दर्ज करें', // Enter your email in Hindi
      LanguageString.enterPassword:
          'अपना पासवर्ड दर्ज करें', // Enter your password in Hindi
      LanguageString.login: 'लॉग इन करें', // Log In in Hindi
      LanguageString.dontHaveAccount:
          'क्या आपके पास खाता नहीं है?', // Don't have an account? in Hindi
      LanguageString.signUp: 'साइन अप करें', // Sign up in Hindi
    },
  };
}
