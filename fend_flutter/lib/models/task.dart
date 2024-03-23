import 'package:flutter/material.dart';

class Task {

  const Task({required this.id, required this.details, required this.reward, required this.networkImage});
  
  final String id;
  final String details;
  final String reward;
  final String networkImage;

} 