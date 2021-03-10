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
  
  static S current;
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name); 
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      S.current = S();
      
      return S.current;
    });
  } 

  static S of(BuildContext context) {
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

  /// `Sign In screen`
  String get sign_in_screen_text {
    return Intl.message(
      'Sign In screen',
      name: 'sign_in_screen_text',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up screen`
  String get sign_up_screen_text {
    return Intl.message(
      'Sign Up screen',
      name: 'sign_up_screen_text',
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
    if (locale != null) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}