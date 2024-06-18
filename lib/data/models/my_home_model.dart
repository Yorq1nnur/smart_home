import 'package:smart_home/data/models/address_model.dart';
import 'package:smart_home/data/models/room_model.dart';

class MyHomeModel {
  final String country;
  final String countryOfFlag;
  final String homeName;
  final List<RoomModel> rooms;
  final AddressModel addressModel;

  MyHomeModel({
    required this.addressModel,
    required this.country,
    required this.countryOfFlag,
    required this.homeName,
    required this.rooms,
  });

  static MyHomeModel initial() => MyHomeModel(
        addressModel: AddressModel(
          addressDetails: '',
          lat: 0.0,
          long: 0.0,
        ),
        country: '',
        countryOfFlag: '',
        homeName: '',
        rooms: [],
      );

  MyHomeModel copyWith({
    String? country,
    String? countryOfFlag,
    String? homeName,
    List<RoomModel>? rooms,
    AddressModel? addressModel,
  }) =>
      MyHomeModel(
        addressModel: addressModel ?? this.addressModel,
        country: country ?? this.country,
        countryOfFlag: countryOfFlag ?? this.countryOfFlag,
        homeName: homeName ?? this.homeName,
        rooms: rooms ?? this.rooms,
      );
}

enum MyHomeModelFields {
  country,
  countryOfFlag,
  homeName,
  rooms,
  addressModel,
}
