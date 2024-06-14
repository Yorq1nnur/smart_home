class CountryModel {
  final Map<String, dynamic> name;
  final String flag;

  CountryModel({
    required this.name,
    required this.flag,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name'] as Map<String,dynamic>? ?? {},
      flag: json['flag'] as String? ?? '',
    );
  }
}