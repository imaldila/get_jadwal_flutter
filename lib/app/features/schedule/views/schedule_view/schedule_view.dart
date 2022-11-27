import 'package:flutter/material.dart';

import '../../../../../configs/configs.dart';

class ScheduleView extends StatelessWidget {
  const ScheduleView({super.key, required this.user});

  final String user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'GetJadwal',
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 28,
                    color: Palette.kWhite,
                    fontWeight: FontWeight.w700,
                  ),
            ),
            InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                print('Tapped');
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Palette.kDarkPink,
                ),
                child: Text(
                  'Check out | $user',
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 14,
                        color: Palette.kWhite,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
