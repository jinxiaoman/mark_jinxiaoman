import 'package:flutter/material.dart';

import 'package:mark_jinxiaoman/app/ui/widgets/menu_item.dart';

class MenuItemGroup extends StatelessWidget {
  final List<MenuItem> items;
  final double separatorHeight;
  final Color separatorColor;
  final BorderRadius borderRadius;

  MenuItemGroup({
    required this.items,
    this.separatorHeight = 1.0,
    this.separatorColor = const Color(0xFFF0F0F0), // Light gray color
    this.borderRadius =
        const BorderRadius.all(Radius.circular(12.0)), // Default border radius
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: List.generate(items.length, (index) {
          return Column(
            children: [
              if (index == 0)
                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: borderRadius.topLeft),
                    color: items[index].backgroundColor,
                  ),
                  child: items[index],
                )
              else if (index == items.length - 1)
                Container(
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: borderRadius.bottomLeft),
                    color: items[index].backgroundColor,
                  ),
                  child: items[index],
                )
              else
                Container(
                  color: items[index].backgroundColor,
                  child: items[index],
                ),
              if (index != items.length - 1)
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: 16.0), // Add horizontal padding to Divider
                  child: Divider(
                    height: separatorHeight,
                    color: separatorColor,
                  ),
                ),
            ],
          );
        }),
      ),
    );
  }
}
