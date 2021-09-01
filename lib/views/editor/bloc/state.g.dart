// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EditorPageState _$_$_EditorPageStateFromJson(Map<String, dynamic> json) {
  return _$_EditorPageState(
    isExecuting: json['isExecuting'] as bool? ?? false,
    executed: json['executed'] as bool? ?? false,
    action: _$enumDecodeNullable(_$EditorPageEventEnumMap, json['action']) ??
        EditorPageEvent.none,
    data: json['data'] == null
        ? null
        : Article.fromJson(json['data'] as Map<String, dynamic>),
    errorMsg: json['errorMsg'] as String?,
  );
}

Map<String, dynamic> _$_$_EditorPageStateToJson(_$_EditorPageState instance) =>
    <String, dynamic>{
      'isExecuting': instance.isExecuting,
      'executed': instance.executed,
      'action': _$EditorPageEventEnumMap[instance.action],
      'data': instance.data,
      'errorMsg': instance.errorMsg,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$EditorPageEventEnumMap = {
  EditorPageEvent.fetch: 'fetch',
  EditorPageEvent.update: 'update',
  EditorPageEvent.none: 'none',
};
