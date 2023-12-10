
import 'package:e_learning/utils/textstyles.dart';
import 'package:flutter/material.dart';

Widget searchBar() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'what do you wanna learn?',
            style: TextStyles.bigBoldBlack,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
              height: 50,
              width: 600,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.all(Radius.circular(
                    12.0) //
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Search now...',
                        style: TextStyles.smallGray,
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ],
    ),
  );
}
