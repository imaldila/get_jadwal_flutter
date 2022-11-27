import 'package:flutter/material.dart';
import 'package:get_jadwal/app/features/schedule/models/day.dart';

import '../../../../../configs/configs.dart';
import '../../../../../constants/constants.dart';
import 'components/day_card.dart';
import 'components/header_app.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({super.key, required this.user});

  final String user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: HeaderApp(user: user),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: sizeWidth(context) * 0.08, vertical: 54),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.add,
                  size: 16,
                ),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Palette.kDarkPink,
                ),
                label: Text(
                  'Buat Jadwal Kuliah',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Palette.kWhite),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 28.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                Day.days.length,
                (index) => DayCard(
                  day: Day.days[index],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
