import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo_app/config/theme.dart';
import 'package:shamo_app/models/product_model.dart';
import 'package:shamo_app/providers/cart_provider.dart';
import 'package:shamo_app/providers/wishlist_provider.dart';

class ProductPage extends StatefulWidget {
  final ProductModel product;

  ProductPage(this.product);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List familiarShoes = [
    'assets/images/sepatu.png',
    'assets/images/sepatu.png',
    'assets/images/sepatu.png',
    'assets/images/sepatu.png',
    'assets/images/sepatu.png',
    'assets/images/sepatu.png',
    'assets/images/sepatu.png',
    'assets/images/sepatu.png',
    'assets/images/sepatu.png',
  ];

  int currentIndex = 0;
  bool isWishlist = true;

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of<WishlistProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    Future<void> showSuccessDialog() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) => Container(
          width: MediaQuery.of(context).size.width - (defaultMargin * 2),
          child: AlertDialog(
            backgroundColor: bgColor3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: primaryTextColor,
                      ),
                    ),
                  ),
                  Image.asset(
                    'assets/icons/ic_success.png',
                    width: 100,
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Hurray :)',
                    style: primaryTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Item added successfully',
                    style: secondaryTextStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 154,
                    height: 44,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cart');
                      },
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        backgroundColor: primaryColor,
                      ),
                      child: Text(
                        'View My Cart',
                        style: primaryTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    Widget indicator(int index) {
      return Container(
        width: currentIndex == index ? 16 : 4,
        height: 4,
        margin: EdgeInsets.symmetric(
          horizontal: 2,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: currentIndex == index ? primaryColor : carouselColor,
        ),
      );
    }

    Widget familiarShoesCard(String image, int index) {
      return Container(
        margin: EdgeInsets.only(
          left: index == 0 ? defaultMargin : 0,
          right: 16,
        ),
        width: 54,
        height: 54,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
          ),
          borderRadius: BorderRadius.circular(6),
        ),
      );
    }

    Widget header() {
      int index = -1;
      return Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 20,
              left: defaultMargin,
              right: defaultMargin,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.chevron_left,
                    color: bgColor1,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/cart');
                  },
                  child: Icon(
                    Icons.shopping_bag,
                    color: bgColor1,
                  ),
                ),
              ],
            ),
          ),
          CarouselSlider(
            items: widget.product.galleries!
                .map((val) => Image.network(
                      val.url ?? 'https://source.unsplash.com/random',
                      width: MediaQuery.of(context).size.width,
                      height: 320,
                      fit: BoxFit.cover,
                    ))
                .toList(),
            options: CarouselOptions(
              initialPage: 0,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.product.galleries!.map((e) {
              index++;
              return indicator(index);
            }).toList(),
          )
        ],
      );
    }

    Widget content() {
      int index = -1;
      return Container(
        margin: EdgeInsets.only(
          top: 17,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
          color: bgColor1,
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 30,
                left: defaultMargin,
                right: defaultMargin,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.product.name ?? 'Name',
                          style: primaryTextStyle.copyWith(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          widget.product.category!.name ?? 'Category',
                          style: secondaryTextStyle.copyWith(fontSize: 12),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      wishlistProvider.setProduct(widget.product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(
                            seconds: 1,
                          ),
                          content: Text(
                            wishlistProvider.isWishlist(widget.product)
                                ? 'Has been added to the Wishlist'
                                : 'Has been removed from the Wishlist',
                            textAlign: TextAlign.center,
                            style: primaryTextStyle,
                          ),
                          backgroundColor:
                              wishlistProvider.isWishlist(widget.product)
                                  ? alertColor
                                  : errorColor,
                        ),
                      );
                    },
                    child: Image.asset(
                      wishlistProvider.isWishlist(widget.product)
                          ? 'assets/icons/btn_love_green.png'
                          : 'assets/icons/btn_love.png',
                      width: 46,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 20,
                left: defaultMargin,
                right: defaultMargin,
              ),
              padding: EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4), color: bgColor2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price starts from',
                    style: primaryTextStyle,
                  ),
                  Text(
                    '\$${widget.product.price}',
                    style: priceTextStyle.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 30,
                left: defaultMargin,
                right: defaultMargin,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style:
                        primaryTextStyle.copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    widget.product.description ?? 'Description',
                    style: subtitleTextStyle.copyWith(
                      fontWeight: FontWeight.w300,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Text(
                      'Fimiliar Shoes',
                      style: primaryTextStyle.copyWith(
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: familiarShoes.map((image) {
                        index++;
                        return familiarShoesCard(image, index);
                      }).toList(),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(defaultMargin),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/detail-chat');
                          },
                          child: Image.asset(
                            'assets/icons/btn_chat.png',
                            width: 54,
                            height: 54,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Container(
                            height: 54,
                            child: TextButton(
                              onPressed: () {
                                cartProvider.addCart(widget.product);
                                showSuccessDialog();
                              },
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                backgroundColor: primaryColor,
                              ),
                              child: Text(
                                'Add to Cart',
                                style: primaryTextStyle.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: bgColor6,
      body: ListView(
        children: [
          header(),
          content(),
        ],
      ),
    );
  }
}
