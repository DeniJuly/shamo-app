import 'package:flutter/material.dart';
import 'package:shamo_app/config/theme.dart';
import 'package:shamo_app/models/cart_model.dart';

class CheckoutCard extends StatelessWidget {
  final CartModel cart;
  CheckoutCard(this.cart);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 12,
      ),
      decoration: BoxDecoration(
        color: bgColor4,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.network(
              cart.product!.galleries![0].url ??
                  'https://source.unsplash.com/random',
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
                  cart.product!.name ?? 'Name',
                  style: primaryTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  '\$${cart.product!.price}',
                  style: priceTextStyle,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            '${cart.quantity} Items',
            style: secondaryTextStyle.copyWith(
              fontSize: 12,
            ),
          )
        ],
      ),
    );
  }
}
