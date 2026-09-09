import '../database.dart';

class AppTable extends SupabaseTable<AppRow> {
  @override
  String get tableName => 'app';

  @override
  AppRow createRow(Map<String, dynamic> data) => AppRow(data);
}

class AppRow extends SupabaseDataRow {
  AppRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => AppTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get welcomeTo => getField<String>('welcomeTo');
  set welcomeTo(String? value) => setField<String>('welcomeTo', value);

  List<String> get fromDrop => getListField<String>('fromDrop');
  set fromDrop(List<String>? value) => setListField<String>('fromDrop', value);

  List<String> get toDrop => getListField<String>('toDrop');
  set toDrop(List<String>? value) => setListField<String>('toDrop', value);

  List<String> get fromShipping => getListField<String>('fromShipping');
  set fromShipping(List<String>? value) =>
      setListField<String>('fromShipping', value);

  List<String> get tofrom => getListField<String>('tofrom');
  set tofrom(List<String>? value) => setListField<String>('tofrom', value);

  bool? get pay => getField<bool>('pay');
  set pay(bool? value) => setField<bool>('pay', value);

  bool? get update => getField<bool>('update');
  set update(bool? value) => setField<bool>('update', value);

  double? get maplt => getField<double>('maplt');
  set maplt(double? value) => setField<double>('maplt', value);

  double? get maplng => getField<double>('maplng');
  set maplng(double? value) => setField<double>('maplng', value);

  String? get map => getField<String>('map');
  set map(String? value) => setField<String>('map', value);

  int? get kmPriceShipping => getField<int>('kmPriceShipping');
  set kmPriceShipping(int? value) => setField<int>('kmPriceShipping', value);

  int? get kmPriceTravell => getField<int>('kmPriceTravell');
  set kmPriceTravell(int? value) => setField<int>('kmPriceTravell', value);

  List<String> get shippingSizes => getListField<String>('shippingSizes');
  set shippingSizes(List<String>? value) =>
      setListField<String>('shippingSizes', value);

  List<double> get shipppingPrices => getListField<double>('shipppingPrices');
  set shipppingPrices(List<double>? value) =>
      setListField<double>('shipppingPrices', value);

  List<String> get branches => getListField<String>('branches');
  set branches(List<String>? value) => setListField<String>('branches', value);

  List<String> get currency => getListField<String>('currency');
  set currency(List<String>? value) => setListField<String>('currency', value);

  int? get specialTripPrice => getField<int>('specialTripPrice');
  set specialTripPrice(int? value) => setField<int>('specialTripPrice', value);

  List<String> get latlngGovrs => getListField<String>('latlngGovrs');
  set latlngGovrs(List<String>? value) =>
      setListField<String>('latlngGovrs', value);

  List<double> get shipppingPricesDollar =>
      getListField<double>('shipppingPricesDollar');
  set shipppingPricesDollar(List<double>? value) =>
      setListField<double>('shipppingPricesDollar', value);

  List<double> get shipppingPricesEuro =>
      getListField<double>('shipppingPricesEuro');
  set shipppingPricesEuro(List<double>? value) =>
      setListField<double>('shipppingPricesEuro', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get playstore => getField<String>('playstore');
  set playstore(String? value) => setField<String>('playstore', value);

  String? get appstore => getField<String>('appstore');
  set appstore(String? value) => setField<String>('appstore', value);

  double? get specialTripPriceVan => getField<double>('specialTripPriceVan');
  set specialTripPriceVan(double? value) =>
      setField<double>('specialTripPriceVan', value);

  double? get field2directions => getField<double>('2directions');
  set field2directions(double? value) => setField<double>('2directions', value);

  int? get specialTripVip => getField<int>('specialTripVip');
  set specialTripVip(int? value) => setField<int>('specialTripVip', value);

  String? get shamcash => getField<String>('shamcash');
  set shamcash(String? value) => setField<String>('shamcash', value);

  List<String> get categories => getListField<String>('categories');
  set categories(List<String>? value) =>
      setListField<String>('categories', value);

  String? get terms => getField<String>('terms');
  set terms(String? value) => setField<String>('terms', value);

  String? get termsEN => getField<String>('termsEN');
  set termsEN(String? value) => setField<String>('termsEN', value);

  String? get share => getField<String>('share');
  set share(String? value) => setField<String>('share', value);

  String? get valor => getField<String>('valor');
  set valor(String? value) => setField<String>('valor', value);

  DateTime? get today => getField<DateTime>('today');
  set today(DateTime? value) => setField<DateTime>('today', value);

  String? get siteUrl => getField<String>('siteUrl');
  set siteUrl(String? value) => setField<String>('siteUrl', value);

  List<String> get fromDropEn => getListField<String>('fromDropEn');
  set fromDropEn(List<String>? value) =>
      setListField<String>('fromDropEn', value);

  List<String> get toDropEn => getListField<String>('toDropEn');
  set toDropEn(List<String>? value) => setListField<String>('toDropEn', value);

  List<String> get shippingsizesEn => getListField<String>('shippingsizesEn');
  set shippingsizesEn(List<String>? value) =>
      setListField<String>('shippingsizesEn', value);

  List<String> get fromShippingEn => getListField<String>('fromShippingEn');
  set fromShippingEn(List<String>? value) =>
      setListField<String>('fromShippingEn', value);

  List<String> get categoriesEn => getListField<String>('categoriesEn');
  set categoriesEn(List<String>? value) =>
      setListField<String>('categoriesEn', value);

  List<String> get currencyAR => getListField<String>('currencyAR');
  set currencyAR(List<String>? value) =>
      setListField<String>('currencyAR', value);
}
