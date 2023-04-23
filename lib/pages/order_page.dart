import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import '../objects/pizza_sizes.dart';
import '../objects/order_prams.dart';
import '../components/custom_alert.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _ScreenState();
}

class _ScreenState extends State<OrderPage> {
  GroupButtonController checkboxController = GroupButtonController();
  GroupButtonController radioController = GroupButtonController();

  final _radioButtons = pizzaSizes;
  final _checkboxButtons = ['Hawaiana', 'Peperoni', 'Vegetales', 'Anchoas'];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pide lo que quieras'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(86, 89, 2, 1),
        onPressed: () {
          if (checkboxController.selectedIndexes.isEmpty|| radioController.selectedIndex == null){
            showAlert(context, 'Prece que te falta llenar un poquito para tener tu pizza 🤤, verifica los datos por favor');
          } else {

            Set <String> flavors = {};

            for (var flavor in checkboxController.selectedIndexes) {
              flavors.add(_checkboxButtons[flavor]);
            }

            Navigator.pushNamed(
              context, 
              '/confirm', 
              arguments: OrderParams(flavors: flavors, size: radioController.selectedIndex!)
            );
          }
        },
        child: const Icon(
          Icons.shopping_cart,
          color: Color.fromARGB(255, 217, 82, 4),
          size: 36.0,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            const Text(
              '¿Cómo es tu hambre?',
              style: TextStyle(
                fontSize: 24.0
              ),
            ),

            GroupButton(
              controller: radioController,
              isRadio: true,
              buttons: _radioButtons,
              buttonIndexedBuilder: (selected, index, context) {
                return CustomRadio(
                  title: _radioButtons[index]['name'],
                  selected: radioController.selectedIndex,
                  index: index,
                  onTap: () {
                    radioController.selectIndex(index);
                  },
                );
              },
            ),

            const Text(
              '¿De qué tienes ganas?',
              style: TextStyle(
                fontSize: 24.0
              ),
            ),
            
            GroupButton(
              controller: checkboxController,
              isRadio: false,
              buttons: _checkboxButtons,
              buttonIndexedBuilder: (selected, index, context) {
                return CustomCheckBox(
                  title: _checkboxButtons[index],
                  selected: selected,
                  onTap: () {
                    if (!selected) {
                      checkboxController.selectIndex(index);
                      return;
                    }
                    checkboxController.unselectIndex(index);
                  },
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}

class CustomCheckBox extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const CustomCheckBox({
    super.key,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          // const Color.fromARGB(255, 140, 3, 3)
          fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return const Color.fromRGBO(86, 89, 2, 1).withOpacity(.32);
            }
            return const Color.fromRGBO(86, 89, 2, 1);
          }),
          //activeColor: Colors.amber,
          checkColor: const Color.fromARGB(255, 236, 196, 148),
          //focusColor: Colors.amber,
          value: selected,
          onChanged: (value) {
            onTap();
          },
        ),
        Text(title),
      ],
    );
  }
}

class CustomRadio extends StatelessWidget {
  final String title;
  final int index;
  final int? selected;
  final VoidCallback onTap;

  const CustomRadio({
    super.key,
    required this.title,
    required this.index,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          fillColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.amber.withOpacity(.32);
            }
            return const Color.fromRGBO(86, 89, 2, 1);
          }),
          overlayColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.amber.withOpacity(.32);
            }
            return Colors.amber;
          }),
          activeColor: Colors.amber,
          focusColor: Colors.amber,
          groupValue: selected,
          value: index,
          onChanged: (value) {
            onTap();
          },
        ),
        Text(title),
      ],
    );
  }
}
