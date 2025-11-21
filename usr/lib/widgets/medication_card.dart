import 'package:flutter/material.dart';
import '../models/medication.dart';

class MedicationCard extends StatelessWidget {
  final Medication medication;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const MedicationCard({
    super.key,
    required this.medication,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: medication.isTaken 
          ? colorScheme.surfaceContainerHighest.withOpacity(0.5) 
          : colorScheme.surface,
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: CircleAvatar(
          backgroundColor: medication.isTaken 
              ? colorScheme.secondary.withOpacity(0.2) 
              : colorScheme.primaryContainer,
          child: Icon(
            Icons.medication,
            color: medication.isTaken ? colorScheme.secondary : colorScheme.primary,
          ),
        ),
        title: Text(
          medication.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            decoration: medication.isTaken ? TextDecoration.lineThrough : null,
            color: medication.isTaken ? colorScheme.onSurface.withOpacity(0.6) : colorScheme.onSurface,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.water_drop, size: 14, color: colorScheme.secondary),
                const SizedBox(width: 4),
                Text(medication.dosage),
                const SizedBox(width: 16),
                Icon(Icons.access_time, size: 14, color: colorScheme.secondary),
                const SizedBox(width: 4),
                Text(medication.time.format(context)),
              ],
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(
                medication.isTaken ? Icons.check_circle : Icons.circle_outlined,
                color: medication.isTaken ? Colors.green : colorScheme.outline,
                size: 32,
              ),
              onPressed: onToggle,
            ),
            PopupMenuButton(
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'delete',
                  child: Row(
                    children: [
                      Icon(Icons.delete, color: Colors.red),
                      SizedBox(width: 8),
                      Text('Delete'),
                    ],
                  ),
                ),
              ],
              onSelected: (value) {
                if (value == 'delete') {
                  onDelete();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
