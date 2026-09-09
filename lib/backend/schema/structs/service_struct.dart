// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ServiceStruct extends FFFirebaseStruct {
  ServiceStruct({
    String? type,
    String? description,
    String? image,
    String? slugin,
    String? price,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _type = type,
        _description = description,
        _image = image,
        _slugin = slugin,
        _price = price,
        super(firestoreUtilData);

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;

  bool hasImage() => _image != null;

  // "slugin" field.
  String? _slugin;
  String get slugin => _slugin ?? '';
  set slugin(String? val) => _slugin = val;

  bool hasSlugin() => _slugin != null;

  // "price" field.
  String? _price;
  String get price => _price ?? '';
  set price(String? val) => _price = val;

  bool hasPrice() => _price != null;

  static ServiceStruct fromMap(Map<String, dynamic> data) => ServiceStruct(
        type: data['type'] as String?,
        description: data['description'] as String?,
        image: data['image'] as String?,
        slugin: data['slugin'] as String?,
        price: data['price'] as String?,
      );

  static ServiceStruct? maybeFromMap(dynamic data) =>
      data is Map ? ServiceStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'type': _type,
        'description': _description,
        'image': _image,
        'slugin': _slugin,
        'price': _price,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'slugin': serializeParam(
          _slugin,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.String,
        ),
      }.withoutNulls;

  static ServiceStruct fromSerializableMap(Map<String, dynamic> data) =>
      ServiceStruct(
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        slugin: deserializeParam(
          data['slugin'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ServiceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ServiceStruct &&
        type == other.type &&
        description == other.description &&
        image == other.image &&
        slugin == other.slugin &&
        price == other.price;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([type, description, image, slugin, price]);
}

ServiceStruct createServiceStruct({
  String? type,
  String? description,
  String? image,
  String? slugin,
  String? price,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ServiceStruct(
      type: type,
      description: description,
      image: image,
      slugin: slugin,
      price: price,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ServiceStruct? updateServiceStruct(
  ServiceStruct? service, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    service
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addServiceStructData(
  Map<String, dynamic> firestoreData,
  ServiceStruct? service,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (service == null) {
    return;
  }
  if (service.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && service.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final serviceData = getServiceFirestoreData(service, forFieldValue);
  final nestedData = serviceData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = service.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getServiceFirestoreData(
  ServiceStruct? service, [
  bool forFieldValue = false,
]) {
  if (service == null) {
    return {};
  }
  final firestoreData = mapToFirestore(service.toMap());

  // Add any Firestore field values
  mapToFirestore(service.firestoreUtilData.fieldValues)
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getServiceListFirestoreData(
  List<ServiceStruct>? services,
) =>
    services?.map((e) => getServiceFirestoreData(e, true)).toList() ?? [];
