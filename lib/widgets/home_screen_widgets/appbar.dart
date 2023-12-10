
import 'package:e_learning/utils/textstyles.dart';
import 'package:flutter/material.dart';

AppBar appBar = AppBar(
  leading: Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 45,
      width: 45,
      clipBehavior: Clip.hardEdge,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(
            Radius.circular(12.0) //
        ),
      ),

    ),
  ),
  title: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Hi, Moh',
        style: TextStyles.medBoldBlack,
      ),
      Text(
        'lets keep learning!',
        style: TextStyles.smallGray,
      ),
    ],
  ),
  actions: [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: 50,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: const BorderRadius.all(
              Radius.circular(12.0) //
          ),
        ),
        child: const Icon(
          Icons.notifications_none,
          color: Colors.black54,
        ),
      ),
    ),
  ],
);
