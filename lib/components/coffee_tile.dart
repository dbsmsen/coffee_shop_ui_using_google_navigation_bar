import 'package:flutter/material.dart';
import '../models/coffee.dart';

class CoffeeTile extends StatelessWidget{
  final Coffee coffee;
  void Function()? onPressed;
  final Widget icon;
  CoffeeTile({
    super.key,
    required this.coffee,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(coffee.name),
      subtitle: Text(
          '\$${coffee.price}'
      ),
      leading: Image.asset(coffee.imagePath),
      trailing: IconButton(
        icon: icon,
        onPressed: onPressed,
      ),
    );
  }

}