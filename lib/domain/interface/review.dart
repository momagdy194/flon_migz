import 'package:dartz/dartz.dart';
import 'package:gshop/domain/model/model/reivew_statistic_model.dart';
import 'package:gshop/domain/model/response/review_check_response.dart';
import 'package:gshop/domain/model/response/review_pagination_response.dart';

abstract class ReviewInterface {
  Future<Either<ReviewResponseModel, dynamic>> fetchReviewList({
    int? shopId,
    int? blogId,
    int? driverId,
    String? productUuid,
    int? page,
  });

  Future<Either<ReviewCountModel, dynamic>> fetchReview({
    int? shopId,
    int? driverId,
    int? productId,
  });

  Future<Either<bool, dynamic>> sendReviewProduct({
    required String? productUuid,
    required String? title,
    required num? rate,
    required List list,
  });

  Future<Either<bool, dynamic>> sendReviewShop({
    required int? shopId,
    required String? title,
    required num? rate,
    required List list,
  });

  Future<Either<bool, dynamic>> sendReviewOrder({
    required int? orderId,
    required String? title,
    required num? rate,
    required List list,
  });

  Future<Either<bool, dynamic>> sendReviewBlog({
    required int? blogId,
    required String? title,
    required num? rate,
    required List list,
  });

  Future<Either<ReviewCheckResponse, dynamic>> checkReview({
    int? shopId,
    int? productId,
    int? blogId,
  });
}
