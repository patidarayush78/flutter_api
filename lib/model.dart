

class Person {
  String name;
  int age;
  String email;

  Person({required this.name, required this.age, required this.email});
  // Create a factory method to convert a map (from the database) to a Person object
  factory Person.fromMap(Map<String, dynamic> map) {
    return Person(
      name: map['name'],
      age: map['age'],
      email: map['email'],
    );
  }
  // Convert the Person object to a map (for inserting into the database)
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'age': age,
      'email': email,
    };
  }
}



