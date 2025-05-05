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
  final bool acceptPrivacyPolicy;

  // Cuarta pantalla: preferencias
  final List<Category> interests;

  UserModel(
      {required this.name,
      required this.lastName,
      this.birthDay,
      required this.genre,
      required this.email,
      this.phoneNumber,
      required this.allowPromotions,
      required this.acceptTerms,
      required this.acceptPrivacyPolicy,
      required this.interests});
}

enum Category { body, bra, panty, corset, swinsuit, sleepwear, suit, none }

// UserModel testUser = PersonalDataFormController().getUserData();

// Se separa el objeto completo en partes para facilitar la obtención de datos en cada pantalla del formulario.
class UserPersonalData {
  String name = '';
  String lastName = '';
  DateTime? birthDay;
  String genre = '';

  UserPersonalData({
    required this.name,
    required this.lastName,
    required this.birthDay,
    required this.genre,
  });
}

class UserContactData {
  String email = '';
  String phoneNumber = '';

  UserContactData({
    required this.email,
    required this.phoneNumber,
  });
}

class UserTermsData {
  bool allowPromotions = false;
  bool acceptTerms = false;
  bool acceptPrivacyPolicy = false;

  UserTermsData({
    required this.allowPromotions,
    required this.acceptTerms,
    required this.acceptPrivacyPolicy,
  });
}

UserModel? testUser;
