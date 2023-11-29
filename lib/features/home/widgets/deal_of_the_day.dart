// ignore_for_file: prefer_const_constructors

import 'package:amazon_clone/constants/loader.dart';
import 'package:amazon_clone/features/home/services/home_services.dart';
import 'package:amazon_clone/features/product_details/screens/product_details_screens.dart';
import 'package:amazon_clone/models/product.dart';
import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  final HomeServices homeServices = HomeServices();
  Product? product;
  @override
  void initState() {
    super.initState();
    fetchDealOfDay();
  }

  void fetchDealOfDay() async {
    product = await homeServices.fetchDealOfDay(context: context);
    setState(() {});
  }

  void navigateToDetailsScreen() {
    Navigator.pushNamed(
      context,
      ProductDetailsScreen.routeName,
      arguments: product,
    );
  }

  @override
  Widget build(BuildContext context) {
    return product == null
        ? Loader()
        : product!.name.isEmpty
            ? SizedBox()
            : GestureDetector(
                onTap: navigateToDetailsScreen,
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(
                        left: 10,
                        top: 15,
                      ),
                      child: const Text(
                        'Deal of the Day',
                        style: TextStyle(
                          fontSize: 20,
                          // fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Image.network(
                      product!.images[0],
                      // 'https://images.unsplash.com/photo-1696023169341-294108cf3bdc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60',
                      height: 235,
                      fit: BoxFit.fitHeight,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      alignment: Alignment.topLeft,
                      child: Text(
                        '\$999',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(left: 15, top: 5, right: 40),
                      child: Text(
                        'Alexa',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: product!.images
                            .map(
                              (e) => Image.network(
                                e,
                                fit: BoxFit.contain,
                                width: 100,
                                height: 100,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 15,
                      ).copyWith(left: 15),
                      alignment: Alignment.topLeft,
                      child: Text(
                        'See all deals',
                        style: TextStyle(
                          color: Colors.cyan[800],
                        ),
                      ),
                    ),
                  ],
                ),
              );
  }
}
