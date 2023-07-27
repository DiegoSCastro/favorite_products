import 'package:favorite_products/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  test('AppColors should return the correct primary color', () {
    final appColors = AppColors.i;
    final primaryColor = appColors.primary;
    expect(primaryColor, equals(const Color(0xFF3366CC)));
  });

  test('AppColors should return the correct secondary color', () {
    final appColors = AppColors.i;
    final secondaryColor = appColors.secondary;
    expect(secondaryColor, equals(const Color(0xFFF37A20)));
  });

  test('AppColors should return the correct blue color', () {
    final appColors = AppColors.i;
    final blueColor = appColors.blue;
    expect(blueColor, equals(const Color(0xFF3366CC)));
  });

  test('AppColors should return the correct red color', () {
    final appColors = AppColors.i;
    final redColor = appColors.red;
    expect(redColor, equals(const Color(0xFFFF0000)));
  });

  test('AppColors should return the correct yellow color', () {
    final appColors = AppColors.i;
    final yellowColor = appColors.yellow;
    expect(yellowColor, equals(const Color(0xFFFFD700)));
  });

  test('AppColors should return the correct tangoNormal color', () {
    final appColors = AppColors.i;
    final tangoNormalColor = appColors.tangoNormal;
    expect(tangoNormalColor, equals(const Color(0xFFF37A20)));
  });

  test('AppColors should return the correct green color', () {
    final appColors = AppColors.i;
    final greenColor = appColors.green;
    expect(greenColor, equals(const Color(0xFF5EC401)));
  });

  test('AppColors should return the correct blackNormal color', () {
    final appColors = AppColors.i;
    final blackNormalColor = appColors.blackNormal;
    expect(blackNormalColor, equals(const Color(0xFF37474F)));
  });

  test('AppColors should return the correct blackMedium color', () {
    final appColors = AppColors.i;
    final blackMediumColor = appColors.blackMedium;
    expect(blackMediumColor, equals(const Color(0xFF37474F).withOpacity(0.72)));
  });

  test('AppColors should return the correct lightGray color', () {
    final appColors = AppColors.i;
    final lightGrayColor = appColors.lightGray;
    expect(lightGrayColor, equals(const Color(0xFFF0F1F2)));
  });

  test('AppColors should return the correct lighterGray color', () {
    final appColors = AppColors.i;
    final lighterGrayColor = appColors.lighterGray;
    expect(lighterGrayColor, equals(const Color(0xFFF0F0F0)));
  });

  test('AppColors should return the correct white color', () {
    final appColors = AppColors.i;
    final whiteColor = appColors.white;
    expect(whiteColor, equals(const Color(0xFFFFFFFF)));
  });
}
