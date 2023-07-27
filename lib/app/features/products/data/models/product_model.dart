import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const ProductModel._();

  const factory ProductModel({
    required int id,
    @Default(0.0) double price,
    @Default('') String title,
    @Default('') String description,
    @Default('') String category,
    @Default('') String image,
    @Default(RatingModel()) RatingModel rating,
  }) = _ProductModel;

  factory ProductModel.fromJson(Map<String, dynamic> json) => _$ProductModelFromJson(json);

  Product toEntity() => Product(
        id: id,
        price: price,
        title: title,
        description: description,
        category: category,
        image: image,
        rating: rating.toEntity(),
      );
}
