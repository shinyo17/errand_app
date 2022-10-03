import 'package:errand_app/common/const/colors.dart';
import 'package:flutter/material.dart';

class RequestModel {
  final int price;
  final String location;
  final String errand;
  final int more;
  final Color priceColor;
  final Color priceTextColor;

  RequestModel({
    required this.price,
    required this.location,
    required this.errand,
    this.priceColor = ICEBLUE100,
    this.priceTextColor = ICEBLUE800,
    this.more = 0,
  });
}
