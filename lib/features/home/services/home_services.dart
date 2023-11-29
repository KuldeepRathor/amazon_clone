import 'dart:convert';

import 'package:amazon_clone/constants/global_variables.dart';
import 'package:amazon_clone/constants/utils.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:amazon_clone/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../constants/error_handling.dart';

class HomeServices {
  Future<List<Product>> fetchCategoryProducts({
    required BuildContext context,
    required String category,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res = await http.get(
          Uri.parse(
            '$uri/api/products?category=$category',
          ),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': userProvider.user.token,
          });

      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            for (int i = 0; i < jsonDecode(res.body).length; i++) {
              productList.add(
                Product.fromJson(jsonEncode(
                  jsonDecode(res.body)[i],
                )),
              );
            }
          });
    } catch (e) {
      debugPrint(e.toString());
      showSnackBar(context, e.toString());
    }
    return productList;
  }

  Future<Product> fetchDealOfDay({
    required BuildContext context,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    Product product = Product(
      name: '',
      description: '',
      price: 0,
      quantity: 0,
      category: '',
      images: [],
    );
    try {
      http.Response res = await http.get(
          Uri.parse(
            '$uri/api/deal-of-day',
          ),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': userProvider.user.token,
          });

      // ignore: use_build_context_synchronously
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            product = Product.fromJson(res.body);
          });
    } catch (e) {
      debugPrint(e.toString());
      showSnackBar(context, e.toString());
    }
    return product;
  }
}
