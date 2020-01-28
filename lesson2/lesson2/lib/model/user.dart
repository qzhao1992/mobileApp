class User{
  String email;
  String password;
  int age;
  String classification;
  Map<String, bool> languages = Map();
}

const CLASSIFICATION = [
  'freshmen',
  'sophomore',
  'junior',
  'senior',
  'graduate',
];