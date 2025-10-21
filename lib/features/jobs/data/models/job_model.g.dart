// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobModel _$JobModelFromJson(Map<String, dynamic> json) => JobModel(
      id: json['id'] as String,
      code: json['code'] as String?,
      customerName: json['customerName'] as String?,
      address: json['address'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      status: json['status'] as String?,
      notes: json['notes'] as String?,
      eta: json['eta'] as String?,
      truckType: json['truckType'] as String?,
      createdAt: json['createdAt'] as String?,
      name: json['name'] as String?,
      avatar: json['avatar'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$JobModelToJson(JobModel instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'customerName': instance.customerName,
      'address': instance.address,
      'price': instance.price,
      'status': instance.status,
      'notes': instance.notes,
      'eta': instance.eta,
      'truckType': instance.truckType,
      'createdAt': instance.createdAt,
      'name': instance.name,
      'avatar': instance.avatar,
      'items': instance.items?.map((e) => e.toJson()).toList(),
    };

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      name: json['name'] as String?,
      qty: (json['qty'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'name': instance.name,
      'qty': instance.qty,
    };
