import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'backend/supabase/supabase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_user')) {
        try {
          final serializedData = prefs.getString('ff_user') ?? '{}';
          _user = UserStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
    _safeInit(() {
      _trip = prefs.getStringList('ff_trip')?.map(int.parse).toList() ?? _trip;
    });
    _safeInit(() {
      _shippings =
          prefs.getStringList('ff_shippings')?.map(int.parse).toList() ??
              _shippings;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  UserStruct _user = UserStruct();
  UserStruct get user => _user;
  set user(UserStruct value) {
    _user = value;
    prefs.setString('ff_user', value.serialize());
  }

  void updateUserStruct(Function(UserStruct) updateFn) {
    updateFn(_user);
    prefs.setString('ff_user', _user.serialize());
  }

  List<String> _names = [];
  List<String> get names => _names;
  set names(List<String> value) {
    _names = value;
  }

  void addToNames(String value) {
    names.add(value);
  }

  void removeFromNames(String value) {
    names.remove(value);
  }

  void removeAtIndexFromNames(int index) {
    names.removeAt(index);
  }

  void updateNamesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    names[index] = updateFn(_names[index]);
  }

  void insertAtIndexInNames(int index, String value) {
    names.insert(index, value);
  }

  List<int> _trip = [];
  List<int> get trip => _trip;
  set trip(List<int> value) {
    _trip = value;
    prefs.setStringList('ff_trip', value.map((x) => x.toString()).toList());
  }

  void addToTrip(int value) {
    trip.add(value);
    prefs.setStringList('ff_trip', _trip.map((x) => x.toString()).toList());
  }

  void removeFromTrip(int value) {
    trip.remove(value);
    prefs.setStringList('ff_trip', _trip.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromTrip(int index) {
    trip.removeAt(index);
    prefs.setStringList('ff_trip', _trip.map((x) => x.toString()).toList());
  }

  void updateTripAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    trip[index] = updateFn(_trip[index]);
    prefs.setStringList('ff_trip', _trip.map((x) => x.toString()).toList());
  }

  void insertAtIndexInTrip(int index, int value) {
    trip.insert(index, value);
    prefs.setStringList('ff_trip', _trip.map((x) => x.toString()).toList());
  }

  List<int> _shippings = [];
  List<int> get shippings => _shippings;
  set shippings(List<int> value) {
    _shippings = value;
    prefs.setStringList(
        'ff_shippings', value.map((x) => x.toString()).toList());
  }

  void addToShippings(int value) {
    shippings.add(value);
    prefs.setStringList(
        'ff_shippings', _shippings.map((x) => x.toString()).toList());
  }

  void removeFromShippings(int value) {
    shippings.remove(value);
    prefs.setStringList(
        'ff_shippings', _shippings.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromShippings(int index) {
    shippings.removeAt(index);
    prefs.setStringList(
        'ff_shippings', _shippings.map((x) => x.toString()).toList());
  }

  void updateShippingsAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    shippings[index] = updateFn(_shippings[index]);
    prefs.setStringList(
        'ff_shippings', _shippings.map((x) => x.toString()).toList());
  }

  void insertAtIndexInShippings(int index, int value) {
    shippings.insert(index, value);
    prefs.setStringList(
        'ff_shippings', _shippings.map((x) => x.toString()).toList());
  }

  int _price = 0;
  int get price => _price;
  set price(int value) {
    _price = value;
  }

  int _booking = 0;
  int get booking => _booking;
  set booking(int value) {
    _booking = value;
  }

  bool _showDrawer = false;
  bool get showDrawer => _showDrawer;
  set showDrawer(bool value) {
    _showDrawer = value;
  }

  double _sliderValue = 0.0;
  double get sliderValue => _sliderValue;
  set sliderValue(double value) {
    _sliderValue = value;
  }

  String _numberAState = '';
  String get numberAState => _numberAState;
  set numberAState(String value) {
    _numberAState = value;
  }

  String _textValue = '';
  String get textValue => _textValue;
  set textValue(String value) {
    _textValue = value;
  }

  String _CountryValue = '';
  String get CountryValue => _CountryValue;
  set CountryValue(String value) {
    _CountryValue = value;
  }

  bool _pay = false;
  bool get pay => _pay;
  set pay(bool value) {
    _pay = value;
  }

  LtgStruct _map = LtgStruct();
  LtgStruct get map => _map;
  set map(LtgStruct value) {
    _map = value;
  }

  void updateMapStruct(Function(LtgStruct) updateFn) {
    updateFn(_map);
  }

  String _fcmToken = '';
  String get fcmToken => _fcmToken;
  set fcmToken(String value) {
    _fcmToken = value;
  }

  LatLng? _up;
  LatLng? get up => _up;
  set up(LatLng? value) {
    _up = value;
  }

  LatLng? _down;
  LatLng? get down => _down;
  set down(LatLng? value) {
    _down = value;
  }

  LatLng? _governetore;
  LatLng? get governetore => _governetore;
  set governetore(LatLng? value) {
    _governetore = value;
  }

  LatLng? _distination;
  LatLng? get distination => _distination;
  set distination(LatLng? value) {
    _distination = value;
  }

  double _delevery = 0.0;
  double get delevery => _delevery;
  set delevery(double value) {
    _delevery = value;
  }

  double _delevery2 = 0.0;
  double get delevery2 => _delevery2;
  set delevery2(double value) {
    _delevery2 = value;
  }

  String _upAddress = '';
  String get upAddress => _upAddress;
  set upAddress(String value) {
    _upAddress = value;
  }

  String _downAddress = '';
  String get downAddress => _downAddress;
  set downAddress(String value) {
    _downAddress = value;
  }

  String _duration = '';
  String get duration => _duration;
  set duration(String value) {
    _duration = value;
  }

  String _distance = '';
  String get distance => _distance;
  set distance(String value) {
    _distance = value;
  }

  String _from = '';
  String get from => _from;
  set from(String value) {
    _from = value;
  }

  String _to = '';
  String get to => _to;
  set to(String value) {
    _to = value;
  }

  bool _car = false;
  bool get car => _car;
  set car(bool value) {
    _car = value;
  }

  bool _van = false;
  bool get van => _van;
  set van(bool value) {
    _van = value;
  }

  int _directions = 1;
  int get directions => _directions;
  set directions(int value) {
    _directions = value;
  }

  DateTime? _Departure;
  DateTime? get Departure => _Departure;
  set Departure(DateTime? value) {
    _Departure = value;
  }

  DateTime? _returnTime;
  DateTime? get returnTime => _returnTime;
  set returnTime(DateTime? value) {
    _returnTime = value;
  }

  LatLng? _location;
  LatLng? get location => _location;
  set location(LatLng? value) {
    _location = value;
  }

  LatLng? _mapinitial = LatLng(33.513803, 36.276549);
  LatLng? get mapinitial => _mapinitial;
  set mapinitial(LatLng? value) {
    _mapinitial = value;
  }

  int _spicealTripPrice = 0;
  int get spicealTripPrice => _spicealTripPrice;
  set spicealTripPrice(int value) {
    _spicealTripPrice = value;
  }

  double _kms = 0.0;
  double get kms => _kms;
  set kms(double value) {
    _kms = value;
  }

  double _downkms = 0.0;
  double get downkms => _downkms;
  set downkms(double value) {
    _downkms = value;
  }

  String _duration2 = '';
  String get duration2 => _duration2;
  set duration2(String value) {
    _duration2 = value;
  }

  List<String> _govDam = [];
  List<String> get govDam => _govDam;
  set govDam(List<String> value) {
    _govDam = value;
  }

  void addToGovDam(String value) {
    govDam.add(value);
  }

  void removeFromGovDam(String value) {
    govDam.remove(value);
  }

  void removeAtIndexFromGovDam(int index) {
    govDam.removeAt(index);
  }

  void updateGovDamAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    govDam[index] = updateFn(_govDam[index]);
  }

  void insertAtIndexInGovDam(int index, String value) {
    govDam.insert(index, value);
  }

  String _serviceScope = 'سوريا';
  String get serviceScope => _serviceScope;
  set serviceScope(String value) {
    _serviceScope = value;
  }

  String _userCountry = '';
  String get userCountry => _userCountry;
  set userCountry(String value) {
    _userCountry = value;
  }

  String _fromLocation = '';
  String get fromLocation => _fromLocation;
  set fromLocation(String value) {
    _fromLocation = value;
  }

  String _toLocation = '';
  String get toLocation => _toLocation;
  set toLocation(String value) {
    _toLocation = value;
  }

  String _sharing = '';
  String get sharing => _sharing;
  set sharing(String value) {
    _sharing = value;
  }

  String _otp = '';
  String get otp => _otp;
  set otp(String value) {
    _otp = value;
  }

  final _userIDManager = FutureRequestManager<List<UsersRow>>();
  Future<List<UsersRow>> userID({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<List<UsersRow>> Function() requestFn,
  }) =>
      _userIDManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearUserIDCache() => _userIDManager.clear();
  void clearUserIDCacheKey(String? uniqueKey) =>
      _userIDManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
