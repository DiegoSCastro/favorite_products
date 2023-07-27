import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../app.dart';

part 'rating_model.freezed.dart';
part 'rating_model.g.dart';

@freezed
class RatingModel with _$RatingModel {
  const RatingModel._();

  const factory RatingModel({
    @Default(0.0) double rate,
    @Default(0) int count,
  }) = _RatingModel;

  factory RatingModel.fromJson(Map<String, dynamic> json) => _$RatingModelFromJson(json);

  Rating toEntity() => Rating(rate: rate, count: count);
}
