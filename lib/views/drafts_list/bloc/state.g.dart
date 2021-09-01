// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DraftsListState _$_$_DraftsListStateFromJson(Map<String, dynamic> json) {
  return _$_DraftsListState(
    isFetching: json['isFetching'] as bool? ?? false,
    fetched: json['fetched'] as bool? ?? false,
    data: (json['data'] as List<dynamic>?)
            ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
            .toList() ??
        [],
    errorMsg: json['errorMsg'] as String?,
  );
}

Map<String, dynamic> _$_$_DraftsListStateToJson(_$_DraftsListState instance) =>
    <String, dynamic>{
      'isFetching': instance.isFetching,
      'fetched': instance.fetched,
      'data': instance.data,
      'errorMsg': instance.errorMsg,
    };
