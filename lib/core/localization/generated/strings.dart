import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'strings_en.dart';
import 'strings_id.dart';

/// Callers can lookup localized strings with an instance of Strings
/// returned by `Strings.of(context)`.
///
/// Applications need to include `Strings.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/strings.dart';
///
/// return MaterialApp(
///   localizationsDelegates: Strings.localizationsDelegates,
///   supportedLocales: Strings.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
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
/// be consistent with the languages listed in the Strings.supportedLocales
/// property.
abstract class Strings {
  Strings(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static Strings? of(BuildContext context) {
    return Localizations.of<Strings>(context, Strings);
  }

  static const LocalizationsDelegate<Strings> delegate = _StringsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('id')
  ];

  /// No description provided for @dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get dashboard;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @map.
  ///
  /// In en, this message translates to:
  /// **'Map'**
  String get map;

  /// No description provided for @order.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get order;

  /// No description provided for @chat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @selectDate.
  ///
  /// In en, this message translates to:
  /// **'Choose Date'**
  String get selectDate;

  /// No description provided for @selectTime.
  ///
  /// In en, this message translates to:
  /// **'Choose Time'**
  String get selectTime;

  /// No description provided for @select.
  ///
  /// In en, this message translates to:
  /// **'Select'**
  String get select;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @pleaseWait.
  ///
  /// In en, this message translates to:
  /// **'Please Wait...'**
  String get pleaseWait;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @askRegister.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an Account?'**
  String get askRegister;

  /// No description provided for @errorInvalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Email is not valid'**
  String get errorInvalidEmail;

  /// No description provided for @errorEmptyField.
  ///
  /// In en, this message translates to:
  /// **'Can\'t be empty'**
  String get errorEmptyField;

  /// No description provided for @errorPasswordLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get errorPasswordLength;

  /// No description provided for @passwordRepeat.
  ///
  /// In en, this message translates to:
  /// **'Repeat Password'**
  String get passwordRepeat;

  /// No description provided for @errorPasswordNotMatch.
  ///
  /// In en, this message translates to:
  /// **'Password doesn\'t match'**
  String get errorPasswordNotMatch;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @applicationSettings.
  ///
  /// In en, this message translates to:
  /// **'Application Settings'**
  String get applicationSettings;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Theme Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Theme Dark'**
  String get themeDark;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'Theme System'**
  String get themeSystem;

  /// No description provided for @chooseTheme.
  ///
  /// In en, this message translates to:
  /// **'Choose Theme'**
  String get chooseTheme;

  /// No description provided for @chooseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose Language'**
  String get chooseLanguage;

  /// No description provided for @errorNoData.
  ///
  /// In en, this message translates to:
  /// **'No data'**
  String get errorNoData;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @logoutDesc.
  ///
  /// In en, this message translates to:
  /// **'Do you want to logout from the app?'**
  String get logoutDesc;

  /// No description provided for @exit.
  ///
  /// In en, this message translates to:
  /// **'Exit'**
  String get exit;

  /// No description provided for @exitDesc.
  ///
  /// In en, this message translates to:
  /// **'Do you want to exit from the app?'**
  String get exitDesc;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @saveChanges.
  ///
  /// In en, this message translates to:
  /// **'Save Changes'**
  String get saveChanges;

  /// No description provided for @emailAlreadyUse.
  ///
  /// In en, this message translates to:
  /// **'Email is already in use by existing user'**
  String get emailAlreadyUse;

  /// No description provided for @invalidPassword.
  ///
  /// In en, this message translates to:
  /// **'Password is invalid. It must be at least 6 characters'**
  String get invalidPassword;

  /// No description provided for @userNotFound.
  ///
  /// In en, this message translates to:
  /// **'There is no existing account with this email'**
  String get userNotFound;

  /// No description provided for @professionalService.
  ///
  /// In en, this message translates to:
  /// **'We provide professional service at a friendly price'**
  String get professionalService;

  /// No description provided for @yourSatisfaction.
  ///
  /// In en, this message translates to:
  /// **'The best result and your satisfaction is our top priority'**
  String get yourSatisfaction;

  /// No description provided for @letsRepair.
  ///
  /// In en, this message translates to:
  /// **'Let\'s repair electronics in your home'**
  String get letsRepair;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @loginToAccount.
  ///
  /// In en, this message translates to:
  /// **'Login to your Account'**
  String get loginToAccount;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create your Account'**
  String get createAccount;

  /// No description provided for @fillYourProfile.
  ///
  /// In en, this message translates to:
  /// **'Fill your profile'**
  String get fillYourProfile;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @errorInvalidPhoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number is not valid'**
  String get errorInvalidPhoneNumber;

  /// No description provided for @cntnue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get cntnue;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAll;

  /// No description provided for @specialOffers.
  ///
  /// In en, this message translates to:
  /// **'Special Offers'**
  String get specialOffers;

  /// No description provided for @service.
  ///
  /// In en, this message translates to:
  /// **'Service'**
  String get service;

  /// No description provided for @recomendation.
  ///
  /// In en, this message translates to:
  /// **'Recomendation'**
  String get recomendation;

  /// No description provided for @reviews.
  ///
  /// In en, this message translates to:
  /// **'reviews'**
  String get reviews;

  /// No description provided for @review.
  ///
  /// In en, this message translates to:
  /// **'review'**
  String get review;

  /// No description provided for @aboutMe.
  ///
  /// In en, this message translates to:
  /// **'About Me'**
  String get aboutMe;

  /// No description provided for @photosVideos.
  ///
  /// In en, this message translates to:
  /// **'Photos & Videos'**
  String get photosVideos;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @noReviewsYet.
  ///
  /// In en, this message translates to:
  /// **'No reviews yet'**
  String get noReviewsYet;

  /// No description provided for @orderNow.
  ///
  /// In en, this message translates to:
  /// **'Order Now'**
  String get orderNow;

  /// No description provided for @technicianIsInOrder.
  ///
  /// In en, this message translates to:
  /// **'Technician is in order'**
  String get technicianIsInOrder;

  /// No description provided for @technicianIsOffline.
  ///
  /// In en, this message translates to:
  /// **'Technician is offline'**
  String get technicianIsOffline;

  /// No description provided for @electronics.
  ///
  /// In en, this message translates to:
  /// **'Electronics'**
  String get electronics;

  /// No description provided for @gripe.
  ///
  /// In en, this message translates to:
  /// **'Gripe'**
  String get gripe;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @chooseElectronicFirst.
  ///
  /// In en, this message translates to:
  /// **'Choose Electronic First'**
  String get chooseElectronicFirst;

  /// No description provided for @chooseGripeFirst.
  ///
  /// In en, this message translates to:
  /// **'Choose Gripe First'**
  String get chooseGripeFirst;

  /// No description provided for @photoOfElectronicDamage.
  ///
  /// In en, this message translates to:
  /// **'Photo of Electronic Damage'**
  String get photoOfElectronicDamage;

  /// No description provided for @optional.
  ///
  /// In en, this message translates to:
  /// **' (optional)'**
  String get optional;

  /// No description provided for @orderSummary.
  ///
  /// In en, this message translates to:
  /// **'Order Summary'**
  String get orderSummary;

  /// No description provided for @electronicRepair.
  ///
  /// In en, this message translates to:
  /// **'Electronic Repair'**
  String get electronicRepair;

  /// No description provided for @technician.
  ///
  /// In en, this message translates to:
  /// **'Technician'**
  String get technician;

  /// No description provided for @technicianLocation.
  ///
  /// In en, this message translates to:
  /// **'Technician Location'**
  String get technicianLocation;

  /// No description provided for @myLocation.
  ///
  /// In en, this message translates to:
  /// **'My Location'**
  String get myLocation;

  /// No description provided for @distance.
  ///
  /// In en, this message translates to:
  /// **'Distance'**
  String get distance;

  /// No description provided for @estimatedTime.
  ///
  /// In en, this message translates to:
  /// **'Estimated Time'**
  String get estimatedTime;

  /// No description provided for @minutes.
  ///
  /// In en, this message translates to:
  /// **'minutes'**
  String get minutes;

  /// No description provided for @checkingCost.
  ///
  /// In en, this message translates to:
  /// **'Checking Cost'**
  String get checkingCost;

  /// No description provided for @noTechnician.
  ///
  /// In en, this message translates to:
  /// **'No Technician'**
  String get noTechnician;

  /// No description provided for @inProgress.
  ///
  /// In en, this message translates to:
  /// **'In Progress'**
  String get inProgress;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @canceled.
  ///
  /// In en, this message translates to:
  /// **'Canceled'**
  String get canceled;

  /// No description provided for @orderDetails.
  ///
  /// In en, this message translates to:
  /// **'Order Details'**
  String get orderDetails;

  /// No description provided for @progres.
  ///
  /// In en, this message translates to:
  /// **'Progres'**
  String get progres;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;
}

class _StringsDelegate extends LocalizationsDelegate<Strings> {
  const _StringsDelegate();

  @override
  Future<Strings> load(Locale locale) {
    return SynchronousFuture<Strings>(lookupStrings(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'id'].contains(locale.languageCode);

  @override
  bool shouldReload(_StringsDelegate old) => false;
}

Strings lookupStrings(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return StringsEn();
    case 'id': return StringsId();
  }

  throw FlutterError(
    'Strings.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
