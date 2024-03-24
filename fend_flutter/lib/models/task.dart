import 'package:flutter/material.dart';


class Task {
  const Task({
    required this.title,
    required this.details,
    required this.reward,
    required this.networkImage,
    required this.expirationDate,
    required this.status,
    required this.dateCompleted,
    required this.quantity, 
    required this.metric,
    required this.category,
    required this.progress
  });

  final String title;
  final String details;
  final String reward;
  final String networkImage;
  final String expirationDate;
  final bool status;
  final String dateCompleted;
  final int quantity;
  final String metric;
  final String category;
  final int progress;
} 

//Title
//Details
//Rewards
//ExpirationDate
//Status
//DateCompleted - not here
//Quantity
//Metric
//Category