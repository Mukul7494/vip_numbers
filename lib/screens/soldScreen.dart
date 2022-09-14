import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:vip_number_app/model/cartModel.dart';
import 'package:vip_number_app/model/soldModel.dart';
// import 'package:vip_number_app/model/numberModel.dart';
// import 'package:vip_number_app/widget/square.dart';

// import '../widget/cartSquare.dart';
import '../widget/soldSquare.dart';

class SoldScreen extends ConsumerWidget {
  const SoldScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(soldProvider);
    return provider.cart.isEmpty
        ? const Center(
            child: Text(
              'Nothing Purchased.',
              style: TextStyle(fontSize: 20),
            ),
          )
        : SafeArea(
            child: Stack(
              children: [
                ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  separatorBuilder: (context, index) => Container(height: 5),
                  itemCount: provider.cart.length,
                  itemBuilder: (context, index) {
                    return SoldSquare(
                      id: provider.cart[index].id,
                      price: provider.cart[index].price ?? 0,
                      number: provider.cart[index].number ?? 0,
                    );
                  },
                ),
              ],
            ),
          );
  }
}
