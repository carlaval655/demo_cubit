import '../dto/login_response_dto.dart';

class LoginService{
  static Future<LoginResponseDto> login(String username, String password) async {
    if (username == "jperez" && password == "123456") {
      return LoginResponseDto(
        token: "token",
        refreshToken: "refreshToken",
        firstName: "Juan",
        lastName: "Perez",
      );
    } else {
      throw Exception("Usuario o contraseña incorrectos");
    }
}
}

// var response = await http.post(
//   'https://api.example.com/login',
//   body: {'username': username, 'password': password},
// );
// if (response.statusCode == 200) {
//   return LoginResponse.fromJson(json.decode(response.body));
// } else {
//   throw Exception('Failed to load post');
// }