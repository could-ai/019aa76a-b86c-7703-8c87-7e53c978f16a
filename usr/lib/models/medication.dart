import 'package:flutter/material.dart';

class Medication {
  final String id;
  final String name;
  final String dosage;
  final TimeOfDay time;
  bool isTaken;

  Medication({
    required this.id,
    required this.name,
    required this.dosage,
    required this.time,
    this.isTaken = false,
  });
}
