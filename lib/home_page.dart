import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:store/models/cart_model.dart';
import 'package:store/pages/cart_page.dart';

import 'component/grocery_item.dart';
import 'component/notification_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //carrinho de pedidos
        body: Consumer<CartModel>(
      builder: (context, value, child) {
        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              //Max's Store
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.00),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Max's Store",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800]),
                    ),

                    //Cart + Notificação
                    NotificationItem(
                      countItem: '${(value.cartItems.length)}',
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const CartPage();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              // Divider
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.00),
                child: Divider(),
              ),
              const SizedBox(height: 24),

              //Faça seu Pedido
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.00),
                    child: Text(
                      'Faça seu pedido',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 165, 214, 167)),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              //Grid com os items
              Expanded(
                child: Consumer<CartModel>(
                  builder: (context, value, child) {
                    return GridView.builder(
                      itemCount: value.shopItems.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1.3,
                      ),
                      itemBuilder: (context, index) {
                        return GroceryItemTitle(
                          itemName: value.shopItems[index][0],
                          itemPrice: value.shopItems[index][1],
                          imagePath: value.shopItems[index][2],
                          color: value.shopItems[index][3],
                          onPressed: () {
                            Provider.of<CartModel>(context, listen: false)
                                .addItemtoCart(index);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}
