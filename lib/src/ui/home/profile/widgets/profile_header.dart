import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      height: 112,
      child: Row(
        children: [
          const SizedBox(
            width: 32,
          ),
          SizedBox(
            height: 56,
            width: 56,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(56),
              child: Image.asset(
                "assets/images/sample.jpeg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 32,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                "Tiffany Schneider",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 24,
                    height: 1,
                    fontWeight: FontWeight.w900),
              ),
              Text(
                "tiffany.s@email.com",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 12,
                    fontWeight: FontWeight.w200),
              ),
              const Spacer(),
            ],
          )
        ],
      ),
    );
  }
}
