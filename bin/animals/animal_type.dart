enum AnimalType { duck, hummingbird, bear, wolf, peacock, beaver }

extension AnimalTypeExtention on AnimalType {
  String get value {
    switch (this) {
      case AnimalType.duck:
        return "Утка";
      case AnimalType.hummingbird:
        return "Колибри";
      case AnimalType.bear:
        return "Медведь";
      case AnimalType.wolf:
        return "Волк";
      case AnimalType.peacock:
        return "Павлин";
      case AnimalType.beaver:
        return "Бобёр";
    }
  }
}
