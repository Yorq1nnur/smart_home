class AddressModel {
  final double lat;
  final double long;
  final String addressDetails;

  AddressModel({
    required this.addressDetails,
    required this.lat,
    required this.long,
  });

  @override
  String toString() {
    return 'AddressModel{'
        ' addressDetails: $addressDetails,'
        ' lat: $lat,'
        ' long: $long'
        '}';
  }
}
