import 'package:flutter/material.dart';
import 'package:shamo_app/config/theme.dart';
import 'package:shamo_app/widgets/chat_bubble.dart';

class DetailChatPage extends StatelessWidget {
  const DetailChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PreferredSize header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(70.0),
        child: AppBar(
          backgroundColor: bgColor1,
          centerTitle: false,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
          title: Row(
            children: [
              Image.asset(
                'assets/images/support_online.png',
                width: 50,
              ),
              const SizedBox(
                width: 12.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Shoe Store',
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: medium,
                    ),
                  ),
                  Text(
                    'Online',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: light,
                    ),
                  ),
                ],
              )
            ],
          ),
          elevation: 0,
        ),
      );
    }

    Widget productPreview() {
      return Container(
        padding: EdgeInsets.all(10.0),
        width: 225,
        height: 74,
        margin: EdgeInsets.only(bottom: 20.0),
        decoration: BoxDecoration(
          color: bgColor5,
          border: Border.all(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                'assets/images/sepatu.png',
                width: 54,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'COURT VISION IN THE WORLD',
                    style: primaryTextStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    '\$57,15',
                    style: priceTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  )
                ],
              ),
            ),
            Image.asset(
              'assets/icons/btn_close.png',
              width: 22,
            ),
          ],
        ),
      );
    }

    Widget chatInput() {
      return Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            productPreview(),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: bgColor4,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration.collapsed(
                        hintText: 'Typle Message...',
                        hintStyle: subtitleTextStyle,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Image.asset(
                  'assets/icons/btn_send.png',
                  width: 45,
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: [
          ChatBubble(
            isSender: true,
            text: 'Hi, This item is still available?',
            hasProduct: true,
          ),
          ChatBubble(
            isSender: false,
            text: 'Good night, This item is only available in size 42 and 43',
          )
        ],
      );
    }

    return Scaffold(
      backgroundColor: bgColor3,
      appBar: header(),
      bottomNavigationBar: chatInput(),
      body: content(),
    );
  }
}
