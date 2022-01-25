enum AnimalType { DUCK, HUMMINGBIRD, BEAR, WOLF, PEACOCK, BEAVER }

extension AnimalTypeExtention on AnimalType {
  String get value {
    switch (this) {
      case AnimalType.DUCK:
        return "Утка";
      case AnimalType.HUMMINGBIRD:
        return "Колибри";
      case AnimalType.BEAR:
        return "Медведь";
      case AnimalType.WOLF:
        return "Волк";
      case AnimalType.PEACOCK:
        return "Павлин";
      case AnimalType.BEAVER:
        return "Бобёр";
    }
  }
}
