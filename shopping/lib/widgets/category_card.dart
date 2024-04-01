import 'package:flutter/material.dart';

import 'package:shopping/models/category.dart';

class CategoryCard extends StatelessWidget {
  final CategoryCardModel categoryCardModel;

  const CategoryCard({
    super.key,
    required this.categoryCardModel,
  });
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Container(
            decoration: BoxDecoration(
                color: const Color(0xffc9cbcd),
                borderRadius: BorderRadius.circular(
                  12,
                )),
            height: 60,
            width: 60,
            child: InkWell(
              onTap: () {},
              child: Icon(categoryCardModel.icon),
            ),
          ),
        ),
      ),
      const SizedBox(height: 1.0),
      Text(categoryCardModel.title)
    ]);
  }
}
