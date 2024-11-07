
import 'package:flutter/material.dart';
import 'package:namer_app/app_theme.dart';

class CustomBottomTabBar extends StatelessWidget {
  const CustomBottomTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).colorScheme.primary,
      height: 70,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 15.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.menu,
                  color: Theme.of(context).colorScheme.font,
                  size: 25,
                ),

                Icon(
                  Icons.more_horiz,
                  color: Theme.of(context).colorScheme.font,
                  size: 25,
                ),
              ],
            ),
        ),
      ),
    );
  }
}
