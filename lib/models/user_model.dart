

class User {
  final String username;
  final String email;
  final String id;
  final String? selectedDietaryPreference;
  final List<String>? selectedPreferences;
  final Map<String,int>? rankings;

  User({
    required this.username,
    required this.email,
    required this.id,
    this.selectedDietaryPreference,
    this.selectedPreferences,
    this.rankings,
  });

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      username: json['username'], 
      email: json['email'], 
      id: json['_id'], 
      rankings: json['rankings'],
      selectedDietaryPreference: json['selectedDietaryPreference'], 
      selectedPreferences: json['selectedPreferences'] != null ? List<String>.from(json['selectedPreferences']) : null,
    );
  } 

  Map<String, dynamic> toJson() {
    return {
      '_id' : id,
      'username' : username,
      'email' : email,
      'rankings' : rankings,
      'selectedDietaryPreference' : selectedDietaryPreference,
      "selectedPreferences" : selectedPreferences
    };
  }


}