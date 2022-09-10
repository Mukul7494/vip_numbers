import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vip_number_app/model/numberModel.dart';
import 'package:vip_number_app/widget/square.dart';

class Cart extends ConsumerWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numberProvider1 = Provider((ref) => NumberProvider());
    final provider = ref.watch(numberProvider1).getNumber;
    return provider.isEmpty
        ? Center(
            child: Text(
              'No todos.',
              style: TextStyle(fontSize: 20),
            ),
          )
        : Stack(
            children: [
              ListView.separated(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.all(16),
                separatorBuilder: (context, index) => Container(height: 5),
                itemCount: provider.length,
                itemBuilder: (context, index) {
                  return Square(
                      price: provider[index].price,
                      number: provider[index].number);
                },
              ),
            ],
          );
  }
}
