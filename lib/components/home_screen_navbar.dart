import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import '../screens/cart.dart';

class HomeSceenNavbar extends StatelessWidget {
  const HomeSceenNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 24,
          width: 24,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: Svg('assets/svg/icon-burger.svg', size: Size(24, 24)),
            ),
          ),
        ),
        SizedBox(
          width: 36,
          height: 36,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
            child: const CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://avatars.githubusercontent.com/u/143471181?v=4'),
            ),
          ),
        ),
      ],
    );
  }
}
