import 'package:flutter/material.dart';
import 'package:shamo_app/config/theme.dart';

class CartCard extends StatelessWidget {
  const CartCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: defaultMargin,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: bgColor4,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  'assets/images/sepatu.png',
                  width: 60,
                  height: 60,
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Terrex Urban Low',
                      style: primaryTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '\$143,98',
                      style: priceTextStyle,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                children: [
                  Image.asset(
                    'assets/icons/btn_add.png',
                    width: 16,
                    height: 16,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    '2',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Image.asset(
                    'assets/icons/btn_min.png',
                    width: 16,
                    height: 16,
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.delete_outline,
                color: errorColor,
                size: 16,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                'Remove',
                style: errorColorStyle.copyWith(
                  fontSize: 12,
                  fontWeight: light,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
