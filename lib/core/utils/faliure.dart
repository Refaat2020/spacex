import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class Failure extends Equatable {
  final int? code;
  final String? message;

  Failure({this.code, @required this.message}) {
    Logger().e(toString());
  }

  @override
  String toString() => message ?? 'error code:$code message:$message';

  @override
  List<Object> get props => [code??0, message??""];
}
