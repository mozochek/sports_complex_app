// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null, 'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;
 
      return instance;
    });
  } 

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null, 'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sports Complex`
  String get app_name {
    return Intl.message(
      'Sports Complex',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome_text {
    return Intl.message(
      'Welcome',
      name: 'welcome_text',
      desc: '',
      args: [],
    );
  }

  /// `Sports complex`
  String get sports_complex_text {
    return Intl.message(
      'Sports complex',
      name: 'sports_complex_text',
      desc: '',
      args: [],
    );
  }

  /// `Workouts schedule`
  String get workouts_schedule_text {
    return Intl.message(
      'Workouts schedule',
      name: 'workouts_schedule_text',
      desc: '',
      args: [],
    );
  }

  /// `Health`
  String get health_text {
    return Intl.message(
      'Health',
      name: 'health_text',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back`
  String get sign_in_screen_title {
    return Intl.message(
      'Welcome back',
      name: 'sign_in_screen_title',
      desc: '',
      args: [],
    );
  }

  /// `We were waiting for you`
  String get sign_in_screen_subtitle {
    return Intl.message(
      'We were waiting for you',
      name: 'sign_in_screen_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_up_screen_title {
    return Intl.message(
      'Sign Up',
      name: 'sign_up_screen_title',
      desc: '',
      args: [],
    );
  }

  /// `Register to start using the application`
  String get sign_up_screen_subtitle {
    return Intl.message(
      'Register to start using the application',
      name: 'sign_up_screen_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Do not have an account`
  String get do_not_have_an_account_text {
    return Intl.message(
      'Do not have an account',
      name: 'do_not_have_an_account_text',
      desc: '',
      args: [],
    );
  }

  /// `Already registered`
  String get already_registered_text {
    return Intl.message(
      'Already registered',
      name: 'already_registered_text',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home_text {
    return Intl.message(
      'Home',
      name: 'home_text',
      desc: '',
      args: [],
    );
  }

  /// `Schedule`
  String get schedule_text {
    return Intl.message(
      'Schedule',
      name: 'schedule_text',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile_text {
    return Intl.message(
      'Profile',
      name: 'profile_text',
      desc: '',
      args: [],
    );
  }

  /// `Favorite workouts`
  String get favorite_workouts_text {
    return Intl.message(
      'Favorite workouts',
      name: 'favorite_workouts_text',
      desc: '',
      args: [],
    );
  }

  /// `Admin console`
  String get admin_console_text {
    return Intl.message(
      'Admin console',
      name: 'admin_console_text',
      desc: '',
      args: [],
    );
  }

  /// `Add schedule`
  String get add_schedule_text {
    return Intl.message(
      'Add schedule',
      name: 'add_schedule_text',
      desc: '',
      args: [],
    );
  }

  /// `Write news`
  String get write_news_text {
    return Intl.message(
      'Write news',
      name: 'write_news_text',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings_text {
    return Intl.message(
      'Settings',
      name: 'settings_text',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel_text {
    return Intl.message(
      'Cancel',
      name: 'cancel_text',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete_text {
    return Intl.message(
      'Delete',
      name: 'delete_text',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get sign_in_text {
    return Intl.message(
      'Sign In',
      name: 'sign_in_text',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_up_text {
    return Intl.message(
      'Sign Up',
      name: 'sign_up_text',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out`
  String get sign_out_text {
    return Intl.message(
      'Sign Out',
      name: 'sign_out_text',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email_text {
    return Intl.message(
      'Email',
      name: 'email_text',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password_text {
    return Intl.message(
      'Password',
      name: 'password_text',
      desc: '',
      args: [],
    );
  }

  /// `List is empty`
  String get list_is_empty_text {
    return Intl.message(
      'List is empty',
      name: 'list_is_empty_text',
      desc: '',
      args: [],
    );
  }

  /// `Unknown`
  String get unknown_text {
    return Intl.message(
      'Unknown',
      name: 'unknown_text',
      desc: '',
      args: [],
    );
  }

  /// `User`
  String get user_text {
    return Intl.message(
      'User',
      name: 'user_text',
      desc: '',
      args: [],
    );
  }

  /// `Coach`
  String get coach_text {
    return Intl.message(
      'Coach',
      name: 'coach_text',
      desc: '',
      args: [],
    );
  }

  /// `Admin`
  String get admin_text {
    return Intl.message(
      'Admin',
      name: 'admin_text',
      desc: '',
      args: [],
    );
  }

  /// `List of trainers`
  String get list_of_coaches_text {
    return Intl.message(
      'List of trainers',
      name: 'list_of_coaches_text',
      desc: '',
      args: [],
    );
  }

  /// `List of halls`
  String get list_of_halls_text {
    return Intl.message(
      'List of halls',
      name: 'list_of_halls_text',
      desc: '',
      args: [],
    );
  }

  /// `Sign Out?`
  String get sign_out_confirmation_dialog_title {
    return Intl.message(
      'Sign Out?',
      name: 'sign_out_confirmation_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `You will be sign out of your current account and will be redirected to the login screen.`
  String get sign_out_confirmation_dialog_content {
    return Intl.message(
      'You will be sign out of your current account and will be redirected to the login screen.',
      name: 'sign_out_confirmation_dialog_content',
      desc: '',
      args: [],
    );
  }

  /// `Delete coach?`
  String get coach_delete_confirmation_dialog_title {
    return Intl.message(
      'Delete coach?',
      name: 'coach_delete_confirmation_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `This will delete selected coach from list.`
  String get coach_delete_confirmation_dialog_content {
    return Intl.message(
      'This will delete selected coach from list.',
      name: 'coach_delete_confirmation_dialog_content',
      desc: '',
      args: [],
    );
  }

  /// `Add hall`
  String get hall_form_title {
    return Intl.message(
      'Add hall',
      name: 'hall_form_title',
      desc: '',
      args: [],
    );
  }

  /// `Hall name`
  String get hall_form_hall_name_label_text {
    return Intl.message(
      'Hall name',
      name: 'hall_form_hall_name_label_text',
      desc: '',
      args: [],
    );
  }

  /// `Delete hall?`
  String get hall_delete_dialog_title {
    return Intl.message(
      'Delete hall?',
      name: 'hall_delete_dialog_title',
      desc: '',
      args: [],
    );
  }

  /// `This will delete selected hall from list.`
  String get hall_delete_dialog_content {
    return Intl.message(
      'This will delete selected hall from list.',
      name: 'hall_delete_dialog_content',
      desc: '',
      args: [],
    );
  }

  /// `Loading data`
  String get loading_data_text {
    return Intl.message(
      'Loading data',
      name: 'loading_data_text',
      desc: '',
      args: [],
    );
  }

  /// `There is no schedule for this date`
  String get no_schedule_for_this_date_text {
    return Intl.message(
      'There is no schedule for this date',
      name: 'no_schedule_for_this_date_text',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email or password`
  String get invalid_email_or_password {
    return Intl.message(
      'Invalid email or password',
      name: 'invalid_email_or_password',
      desc: '',
      args: [],
    );
  }

  /// `User not found`
  String get user_not_found {
    return Intl.message(
      'User not found',
      name: 'user_not_found',
      desc: '',
      args: [],
    );
  }

  /// `User is disabled`
  String get user_disabled {
    return Intl.message(
      'User is disabled',
      name: 'user_disabled',
      desc: '',
      args: [],
    );
  }

  /// `Too many requests. Try later`
  String get too_many_requests {
    return Intl.message(
      'Too many requests. Try later',
      name: 'too_many_requests',
      desc: '',
      args: [],
    );
  }

  /// `User data is empty`
  String get user_data_is_empty {
    return Intl.message(
      'User data is empty',
      name: 'user_data_is_empty',
      desc: '',
      args: [],
    );
  }

  /// `Network problems. Check your internet connection`
  String get network_problems {
    return Intl.message(
      'Network problems. Check your internet connection',
      name: 'network_problems',
      desc: '',
      args: [],
    );
  }

  /// `Unsupported error`
  String get unsupported_error {
    return Intl.message(
      'Unsupported error',
      name: 'unsupported_error',
      desc: '',
      args: [],
    );
  }

  /// `Unknown error`
  String get unknown_error {
    return Intl.message(
      'Unknown error',
      name: 'unknown_error',
      desc: '',
      args: [],
    );
  }

  /// `Email already in use`
  String get email_already_in_use {
    return Intl.message(
      'Email already in use',
      name: 'email_already_in_use',
      desc: '',
      args: [],
    );
  }

  /// `This operation is not allowed. Try later`
  String get operation_not_allowed {
    return Intl.message(
      'This operation is not allowed. Try later',
      name: 'operation_not_allowed',
      desc: '',
      args: [],
    );
  }

  /// `Weak password`
  String get weak_password {
    return Intl.message(
      'Weak password',
      name: 'weak_password',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect data entered`
  String get incorrect_data {
    return Intl.message(
      'Incorrect data entered',
      name: 'incorrect_data',
      desc: '',
      args: [],
    );
  }

  /// `At least 2 characters`
  String get invalid_user_surname {
    return Intl.message(
      'At least 2 characters',
      name: 'invalid_user_surname',
      desc: '',
      args: [],
    );
  }

  /// `At least 2 characters`
  String get invalid_user_name {
    return Intl.message(
      'At least 2 characters',
      name: 'invalid_user_name',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get invalid_email {
    return Intl.message(
      'Invalid email',
      name: 'invalid_email',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}