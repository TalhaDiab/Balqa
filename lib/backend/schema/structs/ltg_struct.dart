// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class LtgStruct extends FFFirebaseStruct {
  LtgStruct({
    double? lt,
    double? lg,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _lt = lt,
        _lg = lg,
        super(firestoreUtilData);

  // "lt" field.
  double? _lt;
  double get lt => _lt ?? 0.0;
  set lt(double? val) => _lt = val;

  void incrementLt(double amount) => lt = lt + amount;

  bool hasLt() => _lt != null;

  // "lg" field.
  double? _lg;
  double get lg => _lg ?? 0.0;
  set lg(double? val) => _lg = val;

  void incrementLg(double amount) => lg = lg + amount;

  bool hasLg() => _lg != null;

  static LtgStruct fromMap(Map<String, dynamic> data) => LtgStruct(
        lt: castToType<double>(data['lt']),
        lg: castToType<double>(data['lg']),
      );

  static LtgStruct? maybeFromMap(dynamic data) =>
      data is Map ? LtgStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'lt': _lt,
        'lg': _lg,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'lt': serializeParam(
          _lt,
          ParamType.double,
        ),
        'lg': serializeParam(
          _lg,
          ParamType.double,
        ),
      }.withoutNulls;

  static LtgStruct fromSerializableMap(Map<String, dynamic> data) => LtgStruct(
        lt: deserializeParam(
          data['lt'],
          ParamType.double,
          false,
        ),
        lg: deserializeParam(
          data['lg'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'LtgStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LtgStruct && lt == other.lt && lg == other.lg;
  }

  @override
  int get hashCode => const ListEquality().hash([lt, lg]);
}

LtgStruct createLtgStruct({
  double? lt,
  double? lg,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LtgStruct(
      lt: lt,
      lg: lg,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LtgStruct? updateLtgStruct(
  LtgStruct? ltg, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    ltg
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLtgStructData(
  Map<String, dynamic> firestoreData,
  LtgStruct? ltg,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (ltg == null) {
    return;
  }
  if (ltg.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && ltg.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final ltgData = getLtgFirestoreData(ltg, forFieldValue);
  final nestedData = ltgData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = ltg.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLtgFirestoreData(
  LtgStruct? ltg, [
  bool forFieldValue = false,
]) {
  if (ltg == null) {
    return {};
  }
  final firestoreData = mapToFirestore(ltg.toMap());

  // Add any Firestore field values
  mapToFirestore(ltg.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLtgListFirestoreData(
  List<LtgStruct>? ltgs,
) =>
    ltgs?.map((e) => getLtgFirestoreData(e, true)).toList() ?? [];
