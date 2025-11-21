import 'package:flutter/material.dart';
import '../models/medication.dart';

class MedicationService {
  static final MedicationService _instance = MedicationService._internal();
  factory MedicationService() => _instance;
  MedicationService._internal();

  // Mock data
  final List<Medication> _medications = [
    Medication(
      id: '1', 
      name: 'Aspirin', 
      dosage: '100mg', 
      time: const TimeOfDay(hour: 8, minute: 0)
    ),
    Medication(
      id: '2', 
      name: 'Vitamin D', 
      dosage: '1 pill', 
      time: const TimeOfDay(hour: 9, minute: 30)
    ),
    Medication(
      id: '3', 
      name: 'Amoxicillin', 
      dosage: '500mg', 
      time: const TimeOfDay(hour: 20, minute: 0)
    ),
  ];

  List<Medication> get medications => _medications;

  void addMedication(Medication med) {
    _medications.add(med);
    _sortMedications();
  }

  void toggleTaken(String id) {
    final index = _medications.indexWhere((m) => m.id == id);
    if (index != -1) {
      _medications[index].isTaken = !_medications[index].isTaken;
    }
  }
  
  void deleteMedication(String id) {
    _medications.removeWhere((m) => m.id == id);
  }

  void _sortMedications() {
    _medications.sort((a, b) {
      final aMinutes = a.time.hour * 60 + a.time.minute;
      final bMinutes = b.time.hour * 60 + b.time.minute;
      return aMinutes.compareTo(bMinutes);
    });
  }
}
