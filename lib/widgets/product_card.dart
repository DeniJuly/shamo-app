import 'package:flutter/material.dart';
import 'package:shamo_app/config/theme.dart';
import 'package:shamo_app/models/product_model.dart';
import 'package:shamo_app/pages/product_page.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(product),
          ),
        );
      },
      child: Container(
        width: 215,
        height: 278,
        margin: const EdgeInsets.only(right: 30.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: const Color(0xffECEDEF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.0,
            ),
            Image.network(
              product.galleries![0].url ?? 'https://source.unsplash.com/random',
              width: 215,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category?.name ?? 'category',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 12.0,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    product.name ?? 'name',
                    style: blackColorStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    '\$${product.price}',
                    style: priceTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
