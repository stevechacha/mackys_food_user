import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  final bool success;
  final String? message;
  final T? data;
  final int? statusCode;

  ApiResponse({
    required this.success,
    this.message,
    this.data,
    this.statusCode,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$ApiResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$ApiResponseToJson(this, toJsonT);

  factory ApiResponse.success({
    T? data,
    String? message,
    int? statusCode,
  }) =>
      ApiResponse(
        success: true,
        data: data,
        message: message,
        statusCode: statusCode,
      );

  factory ApiResponse.error({
    String? message,
    int? statusCode,
  }) =>
      ApiResponse(
        success: false,
        message: message,
        statusCode: statusCode,
      );
}

@JsonSerializable(genericArgumentFactories: true)
class PaginatedResponse<T> {
  final List<T> results;
  final int count;
  final String? next;
  final String? previous;

  PaginatedResponse({
    required this.results,
    required this.count,
    this.next,
    this.previous,
  });

  factory PaginatedResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$PaginatedResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$PaginatedResponseToJson(this, toJsonT);
} 