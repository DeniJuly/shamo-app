import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/config/theme.dart';
import 'package:shamo_app/models/cart_model.dart';
import 'package:shamo_app/providers/cart_provider.dart';

class CartCard extends StatelessWidget {
  final CartModel cart;
  CartCard(this.cart);
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
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
                        fontWeight: FontWeight.w600,
                      ),
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
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      cartProvider.addQuantify(cart.id ?? 0);
                    },
                    child: Image.asset(
                      'assets/icons/btn_add.png',
                      width: 16,
                      height: 16,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    cart.quantity.toString(),
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  GestureDetector(
                    onTap: () {
                      cartProvider.reduceQuantify(cart.id ?? 0);
                    },
                    child: Image.asset(
                      'assets/icons/btn_min.png',
                      width: 16,
                      height: 16,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          GestureDetector(
            onTap: () {
              cartProvider.removeCart(cart.id ?? 0);
            },
            child: Row(
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
            ),
          )
        ],
      ),
    );
  }
}
