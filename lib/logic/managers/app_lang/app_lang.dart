import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_lang_en.dart';
import 'app_lang_fr.dart';

/// Callers can lookup localized strings with an instance of AppLang returned
/// by `AppLang.of(context)`.
///
/// Applications need to include `AppLang.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'app_lang/app_lang.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLang.localizationsDelegates,
///   supportedLocales: AppLang.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLang.supportedLocales
/// property.
abstract class AppLang {
  AppLang(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLang? of(BuildContext context) {
    return Localizations.of<AppLang>(context, AppLang);
  }

  static const LocalizationsDelegate<AppLang> delegate = _AppLangDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr')
  ];

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @connected.
  ///
  /// In en, this message translates to:
  /// **'Connected'**
  String get connected;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// No description provided for @darkmode.
  ///
  /// In en, this message translates to:
  /// **'Dark theme'**
  String get darkmode;

  /// No description provided for @discover.
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get discover;

  /// No description provided for @end.
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get end;

  /// No description provided for @firstname.
  ///
  /// In en, this message translates to:
  /// **'First names'**
  String get firstname;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @initializing.
  ///
  /// In en, this message translates to:
  /// **'Initialization'**
  String get initializing;

  /// No description provided for @live.
  ///
  /// In en, this message translates to:
  /// **'Live'**
  String get live;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading ...'**
  String get loading;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @offline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get offline;

  /// No description provided for @online.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get online;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @product.
  ///
  /// In en, this message translates to:
  /// **'Product'**
  String get product;

  /// No description provided for @products.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get products;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @provider.
  ///
  /// In en, this message translates to:
  /// **'Powered by KKHGROUP'**
  String get provider;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @sex.
  ///
  /// In en, this message translates to:
  /// **'Sex'**
  String get sex;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @slider.
  ///
  /// In en, this message translates to:
  /// **'Slider'**
  String get slider;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @user.
  ///
  /// In en, this message translates to:
  /// **'User'**
  String get user;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Assigame Market'**
  String get welcome;

  /// No description provided for @fr.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get fr;

  /// No description provided for @en.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get en;

  /// No description provided for @lang.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get lang;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @alreadyRegistered.
  ///
  /// In en, this message translates to:
  /// **'Already registered?'**
  String get alreadyRegistered;

  /// No description provided for @langChangeSuccess.
  ///
  /// In en, this message translates to:
  /// **'Language changed successfully'**
  String get langChangeSuccess;

  /// No description provided for @notYetRegistered.
  ///
  /// In en, this message translates to:
  /// **'Not registered yet?'**
  String get notYetRegistered;

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Assigame Market'**
  String get appName;

  /// No description provided for @changeLang.
  ///
  /// In en, this message translates to:
  /// **'Change the language'**
  String get changeLang;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change the password'**
  String get changePassword;

  /// No description provided for @forgetPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Your Password?'**
  String get forgetPassword;

  /// No description provided for @productList.
  ///
  /// In en, this message translates to:
  /// **'Products List'**
  String get productList;

  /// No description provided for @resetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// No description provided for @sliderFour.
  ///
  /// In en, this message translates to:
  /// **'Take advantage of our\nbest deals at\nour BLACK FRIDAY'**
  String get sliderFour;

  /// No description provided for @sliderOne.
  ///
  /// In en, this message translates to:
  /// **'Make your purchases\nfrom the comfort of\nyour living room'**
  String get sliderOne;

  /// No description provided for @sliderThree.
  ///
  /// In en, this message translates to:
  /// **'Get the best price \nfor your purchases'**
  String get sliderThree;

  /// No description provided for @sliderTwo.
  ///
  /// In en, this message translates to:
  /// **'Major Appliances\nnew or used'**
  String get sliderTwo;

  /// No description provided for @updateAccount.
  ///
  /// In en, this message translates to:
  /// **'Update account data'**
  String get updateAccount;

  /// No description provided for @myInfos.
  ///
  /// In en, this message translates to:
  /// **'My information'**
  String get myInfos;

  /// No description provided for @quickMenu.
  ///
  /// In en, this message translates to:
  /// **'Quick Menu'**
  String get quickMenu;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @previous.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get previous;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @createShop.
  ///
  /// In en, this message translates to:
  /// **'Create your store'**
  String get createShop;

  /// No description provided for @myShop.
  ///
  /// In en, this message translates to:
  /// **'My store'**
  String get myShop;

  /// No description provided for @campaign.
  ///
  /// In en, this message translates to:
  /// **'Campaign'**
  String get campaign;

  /// No description provided for @order.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get order;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @transaction.
  ///
  /// In en, this message translates to:
  /// **'Transaction'**
  String get transaction;

  /// No description provided for @map.
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get map;

  /// No description provided for @seller.
  ///
  /// In en, this message translates to:
  /// **'Seller'**
  String get seller;

  /// No description provided for @buyer.
  ///
  /// In en, this message translates to:
  /// **'Buyer'**
  String get buyer;
}

class _AppLangDelegate extends LocalizationsDelegate<AppLang> {
  const _AppLangDelegate();

  @override
  Future<AppLang> load(Locale locale) {
    return SynchronousFuture<AppLang>(lookupAppLang(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLangDelegate old) => false;
}

AppLang lookupAppLang(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLangEn();
    case 'fr':
      return AppLangFr();
  }

  throw FlutterError(
      'AppLang.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
