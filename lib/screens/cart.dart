import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vip_number_app/model/cartModel.dart';
// import 'package:vip_number_app/model/numberModel.dart';
// import 'package:vip_number_app/widget/square.dart';

import '../widget/cartSquare.dart';

final cartProvider1 = ChangeNotifierProvider((ref) => CartProvider());

class Cart extends ConsumerWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(cartProvider1);
    return provider.cart.isEmpty
        ? Center(
            child: Text(
              'No todos.',
              style: TextStyle(fontSize: 20),
            ),
          )
        : SafeArea(
            child: Stack(
              children: [
                ListView.separated(
                  physics: BouncingScrollPhysics(),
                  padding: EdgeInsets.all(16),
                  separatorBuilder: (context, index) => Container(height: 5),
                  itemCount: provider.cart.length,
                  itemBuilder: (context, index) {
                    return CartSquare(
                        id: provider.cart[index].id,
                        price: provider.cart[index].price,
                        number: provider.cart[index].number);
                  },
                ),
              ],
            ),
          );
  }
}
