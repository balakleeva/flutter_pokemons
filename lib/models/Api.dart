import 'package:flutter/material.dart';

class ApiResponse<T> {
  final int count;
  final String next;
  final String previous;
  final List<T> results;

  const ApiResponse({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });
}
