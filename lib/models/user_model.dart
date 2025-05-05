class UserModel {
  // Primera pantalla: datos personales
  final String name;
  final String lastName;
  final DateTime? birthDay;
  final String genre;

  // Segunda pantalla datos de contacto
  final String email;
  final String? phoneNumber;

  // Tercera pantalla: términos y condiciones
  final bool allowPromotions;
  final bool acceptTerms;

  // Cuarta pantalla: preferencias
  final List<Category> interests;

  UserModel(this.name, this.lastName, this.birthDay, this.genre, this.email,
      this.phoneNumber, this.allowPromotions, this.acceptTerms, this.interests);
}

enum Category { body, bra, panty, corset, swinsuit, sleepwear, suit, none }

// UserModel testUser = PersonalDataFormController().getUserData();
