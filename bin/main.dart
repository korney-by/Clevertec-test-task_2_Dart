import 'zoo.dart';

void main(List<String> arguments) {
  Zoo zoo = Zoo();
  print("Животных в Зоопарке: ${zoo.quantityAnimals}");
  zoo.showAllAnimals();
  print("");
  zoo.startLife();
}
