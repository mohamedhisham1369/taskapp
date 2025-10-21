import 'package:json_annotation/json_annotation.dart';

part 'job_model.g.dart';

@JsonSerializable(explicitToJson: true)
class JobModel {
  final String id;
  final String? code;
  final String? customerName;
  final String? address;
  final double? price;
   String? status;
  final String? notes;
  final String? eta;
  final String? truckType;
  final String? createdAt;
  final String? name;
  final String? avatar;
  final List<ItemModel>? items;

  JobModel({
    required this.id,
    this.code,
    this.customerName,
    this.address,
    this.price,
    this.status,
    this.notes,
    this.eta,
    this.truckType,
    this.createdAt,
    this.name,
    this.avatar,
    this.items,
  });

  /// JSON serialization
  factory JobModel.fromJson(Map<String, dynamic> json) =>
      _$JobModelFromJson(json);
  Map<String, dynamic> toJson() => _$JobModelToJson(this);
}

@JsonSerializable()
class ItemModel {
  final String? name;
  final int? qty;

  ItemModel({this.name, this.qty});

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
