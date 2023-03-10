import 'package:flutter/material.dart';

class CateogriesScreen extends StatelessWidget {
  const CateogriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Cateogries Screen',
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
