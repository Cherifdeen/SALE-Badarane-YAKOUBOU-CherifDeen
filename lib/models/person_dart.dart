class Person {
  String? name;
  String? surname;
  String? politicsparty;
  String? description;
  String? birthDate;
 /* String? sex;
  String? profil;
  Person? spouse;*/

  Person({this.name, this.surname,}); /* this.birthDate, this.sex*/

  @override
  String toString() {
    return 'Person{name: $name, surname: $surname,politicsparty: $politicsparty, description: $description , birthDate: $birthDate,}'; /* sex: $sex*/
  }
}
