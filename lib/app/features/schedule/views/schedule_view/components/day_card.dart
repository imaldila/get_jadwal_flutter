import 'package:flutter/material.dart';

import '../../../../../../configs/configs.dart';
import '../../../models/day.dart';

class DayCard extends StatelessWidget {
  const DayCard({
    Key? key, required this.day,
  }) : super(key: key);

  final Day day;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              day.day,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 6.0),
            Text(
              'Belum Ada Mata Kuliah',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 12,
                    color: Palette.kDarkGrey,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
