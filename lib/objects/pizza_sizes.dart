enum PizzaSizes {
  small, 
  medium, 
  large
}

Map<String,dynamic> smallPizza = {
  'name': 'Para picar y ya',
  'diameter': 10,
  'slices': 6,
  'price': 20000.0
};

Map<String,dynamic> mediumPizza = {
  'name': 'Maso',
  'diameter': 12,
  'slices': 8,
  'price': 40000.0
};

Map<String,dynamic> largePizza = {
  'name': 'Grandota',
  'diameter': 16,
  'slices': 12,
  'price': 60000.0
};

List <Map <String,dynamic>> pizzaSizes = [
  largePizza,
  mediumPizza,
  smallPizza
];
