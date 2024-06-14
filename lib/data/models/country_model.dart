class CountryModel {
  final String name;
  final String flag;

  CountryModel({
    required this.name,
    required this.flag,
  });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      name: json['name'] as String? ?? '',
      flag: json['emoji'] as String? ?? '',
    );
  }
}
