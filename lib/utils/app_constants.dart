class AppConstants {
  static final passwordExp =
      RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d{4,})(?=.*[a-zA-Z]{4,}).*$');
  static final emailRegExp =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  static const String countriesUrl = 'https://all-countries.free.mockoapp.net/countries';
}
