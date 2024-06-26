import 'package:path/path.dart';
import 'package:smart_home/utils/utility_functions.dart';
import 'package:sqflite/sqflite.dart';
import '../models/device_model.dart';
import '../network/network_response.dart';

class LocalDb {
  static final LocalDb _instance = LocalDb._internal();
  static Database? _database;

  factory LocalDb() {
    return _instance;
  }

  LocalDb._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'my_devices.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE MyDevices(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        deviceName TEXT,
        deviceCategoryName TEXT,
        deviceImage TEXT,
        isActiveDevice INTEGER,
        roomName TEXT
      )
      ''');
  }

  Future<NetworkResponse> insertDevice(DeviceModel device) async {
    final db = await database;
    try {
      await db.insert('MyDevices', device.toJson());
      UtilityFunctions.methodPrint(
        "Device inserted successfully",
      );
      return NetworkResponse(data: 'Device inserted successfully');
    } catch (e) {
      return NetworkResponse(
        errorText: e.toString(),
      );
    }
  }

  Future<NetworkResponse> updateDevice(DeviceModel device) async {
    final db = await database;
    try {
      await db.update(
        'MyDevices',
        device.toJsonForUpdate(),
        where: 'id = ?',
        whereArgs: [device.id],
      );
      UtilityFunctions.methodPrint(
        "Device updated successfully, Updated device is: ${device.toString()}",
      );
      return NetworkResponse(data: 'Device updated successfully. Updated device is: ${device.toString()}');
    } catch (e) {
      return NetworkResponse(
        errorText: e.toString(),
      );
    }
  }


  Future<NetworkResponse> getDevices() async {
    final db = await database;
    try {
      final List<Map<String, dynamic>> maps = await db.query('MyDevices');
      List<DeviceModel> devices = List.generate(maps.length, (i) {
        return DeviceModel.fromJson(maps[i]);
      });
      UtilityFunctions.methodPrint(
        "GET ALL DEVICES FROM DB OF LENGTH IS: ${devices.length}",
      );
      return NetworkResponse(data: devices);
    } catch (e) {
      return NetworkResponse(errorText: e.toString());
    }
  }

  Future<NetworkResponse> deleteDevice(String deviceName) async {
    final db = await database;
    try {
      await db.delete(
        'MyDevices',
        where: 'deviceName = ?',
        whereArgs: [deviceName],
      );
      return NetworkResponse(data: 'Device deleted successfully');
    } catch (e) {
      return NetworkResponse(errorText: e.toString());
    }
  }
}
