import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/config/theme.dart';
import 'package:shamo_app/models/product_model.dart';
import 'package:shamo_app/providers/wishlist_provider.dart';

class LoveCard extends StatelessWidget {
  final ProductModel product;
  LoveCard(this.product);

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    return Container(
      margin: EdgeInsets.only(
        top: 20,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: bgColor4,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              product.galleries![0].url ?? 'https://source.unsplash.com/random',
              width: 60,
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
                  product.name ?? 'Name',
                  style: primaryTextStyle.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '\$${product.price}',
                  style: priceTextStyle,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 12,
          ),
          GestureDetector(
            onTap: () => wishlistProvider.setProduct(product),
            child: Image.asset(
              'assets/icons/btn_love_green.png',
              width: 34,
            ),
          ),
          SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }
}
