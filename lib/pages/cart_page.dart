import 'package:coffee_shop/components/coffee_tile.dart';
import 'package:coffee_shop/models/coffee.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/coffee_shop.dart';

class CartPage extends StatefulWidget{
  const CartPage ({super.key});

  @override
  State <CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  void removeFromCart(Coffee coffee){
   Provider.of<CoffeeShop>(context, listen: false).removeItemFromCart(coffee);

   final snackBar = SnackBar(
     content: Text('${coffee.name} removed to the cart!'),
     duration: Duration(seconds: 2), // Adjust duration as needed
   );
   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void payNow(){
  }

  @override
  Widget build(BuildContext context) {
    return Consumer <CoffeeShop>(
        builder: (context, value, child) => Scaffold(
          backgroundColor:  Colors.brown[100],
            body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Your Cart',
                    style: TextStyle(fontSize: 44,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[800],
                    ),),
                  ),
                ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: value.userCart.length,
                  itemBuilder: (context, index) {
                    Coffee eachCoffee = value.userCart[index];

                    return CoffeeTile(
                      coffee: eachCoffee,
                      onPressed: () => removeFromCart(eachCoffee),
                      icon: Icon(Icons.delete, color: Colors.black,
                      ),
                    );
                },
              ),
              ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 15.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text("Total: ",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown[800],
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "\$${value.calculateTotalPrice().toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.brown[800],
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),

                  GestureDetector(
                    onTap: payNow,
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.brown,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          "Pay Now",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}