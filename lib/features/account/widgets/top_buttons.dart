import 'package:amazon_clone/features/account/services/account_services.dart';
import 'package:amazon_clone/features/account/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButtons extends StatelessWidget {
  const TopButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              onTap: () {},
              text: 'Your Orders',
            ),
            AccountButton(
              onTap: () {},
              text: 'Turn Seller',
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            AccountButton(
              onTap: () {
                AccountServices().logOut(context);
              },
              text: 'Log Out',
            ),
            AccountButton(
              onTap: () {},
              text: 'Your Wish List',
            )
          ],
        ),
      ],
    );
  }
}
