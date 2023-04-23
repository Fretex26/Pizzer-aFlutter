import 'package:flutter/material.dart';
import '../objects/order_prams.dart';
import '../objects/pizza_sizes.dart';


class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    OrderParams params = ModalRoute.of(context)!.settings.arguments as OrderParams;
    String pizzaSize = pizzaSizes[params.size]['name'];
    double pizzaPrice = pizzaSizes[params.size]['price'];
    Set <String> flavors = params.flavors;
    return Scaffold(
      appBar: AppBar(
        title:  const Text ('YA CASITO 🤤'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Tu deliorder es:'),
            DataTable(
              dataRowHeight: 90.0,
              columns: const [
                DataColumn(label: Text('Tamaño')),
                DataColumn(label: Text('Sabores'))
              ], 
              rows: [
                DataRow(
                  cells: [
                    DataCell(Text(pizzaSize)),
                    DataCell(
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                          flavors.map((flavor) => 
                            Text(flavor)
                          ).toList(),
                      )
                    ),
                  ]
                ),
                DataRow(
                  cells: [
                    const DataCell(
                      Text(
                        'Total',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ),
                    DataCell(Text(pizzaPrice.toString()))
                  ]
                )
              ]
            )
          ]
        ),
      )
    );
  }
}