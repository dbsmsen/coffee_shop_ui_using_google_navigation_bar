import 'package:coffee_shop/components/coffee_tile.dart';
import 'package:coffee_shop/models/coffee_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/coffee.dart';

class ShopPage extends StatefulWidget{
  const ShopPage ({super.key});

  @override
  State <ShopPage> createState() => _ShopePageState();
}

class _ShopePageState extends State<ShopPage> {

  void addToCart(Coffee coffee) {
    Provider.of <CoffeeShop>(context, listen: false).addItemToCart(coffee);

    final snackBar = SnackBar(
      content: Text('${coffee.name} added to your cart!'),
      duration: Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CoffeeShop>(
        builder: (context, value, child) => Scaffold(
          backgroundColor: Colors.brown[200],
          body: SafeArea(
              child: Column(
                children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.brown[400],
                        ),
                          padding: EdgeInsets.only(top: 25,bottom: 25),
                          child: Center(
                            child: Text("How would you like to have your coffee ?",
                              style: TextStyle(
                                color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                  SizedBox(height: 5),
                  Expanded (
                    child: ListView.builder(
                      itemCount: value.coffeeShop.length,
                      itemBuilder: (context, index){
                        Coffee eachCoffee = value.coffeeShop[index];
                        return Padding(
                          padding: EdgeInsets.fromLTRB(20, 5, 22, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            margin: const EdgeInsets.only(bottom: 10),
                            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                            child: CoffeeTile(
                              coffee: eachCoffee,
                              icon: Icon(Icons.add, color: Colors.black,),
                              onPressed: () => addToCart(eachCoffee),
                            ),
                          ),
                        );
                        },
                    ),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
        );
  }
}