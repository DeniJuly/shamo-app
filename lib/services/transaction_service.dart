import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shamo_app/models/user_model.dart';
import '../models/cart_model.dart';

class TransactionService {
  String baseUrl = 'http://shamo-backend.buildwithangga.id/api';

  Future<bool> checkout(
      String token, List<CartModel> carts, double totalPrice) async {
    var url = Uri.parse(baseUrl + '/checkout');
    var header = {
      'Content-Type': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode(
      {
        'address': 'Marsemoon',
        'items': carts
            .map(
              (e) => {
                'id': e.product!.id,
                'quantity': e.quantity,
              },
            )
            .toList(),
        'status': 'PENDING',
        'total_price': totalPrice,
        'shipping_price': 0
      },
    );
    var response = await http.post(url, headers: header, body: body);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal checkout');
    }
  }
}
