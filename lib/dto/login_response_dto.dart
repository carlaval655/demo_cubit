// Un DTO significa Data Transfer Object, es un objeto que se utiliza para transferir datos entre diferentes capas de la aplicación.
// Tambien puede ser llamado VO (Value Object) o POJO (Plain Old Java Object).
// No tienen lógica de negocio, solo contienen datos.

class LoginResponseDto{
  final String token;
  final String refreshToken;
  final String firstName;
  final String lastName;

  LoginResponseDto(
    {required this.token, 
    required this.refreshToken, 
    required this.firstName,
    required this.lastName});

  //El endpoint de login devuelve un json, por lo que se debe convertir a un objeto de tipo LoginResponseDto con la siguiente estructura:
  // {"token":"aqui va el token","refreshToken":"aqui va el refresh token","firstName":"aqui va el nombre","lastName":"aqui va el apellido"} 

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) {
    return LoginResponseDto(
      token: json['token'],
      refreshToken: json['refreshToken'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }
}