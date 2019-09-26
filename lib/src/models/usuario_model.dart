import 'dart:convert';


UsuarioModel usuarioModelFromJson(String str) => UsuarioModel.fromJson(json.decode(str));

String usuarioModelToJson(UsuarioModel data) => json.encode(data.toJson());

class UsuarioModel{
  String id;
  String tipo;
  String nombre;
  String apellido;
  String email;
  String password;
  String telefono;
  String descripcion;

  UsuarioModel({
    this.id,
    this.tipo,
    this.nombre ='',
    this.apellido ='',
    this.email ='',
    this.password ='',
    this.telefono ='',
    this.descripcion ='',
  });

  factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
    id            : json["id"],
    tipo          : json["tipo"],
    nombre        : json["nombre"],
    apellido      : json["apellido"],
    email         : json["email"],
    password      : json["password"],
    telefono      : json["telefono"],
    descripcion   : json["descripcion"],
  );

  Map<String, dynamic> toJson() => {
    "id"            : id,
    "tipo"          : tipo,
    "nombre"        : nombre,
    "apellido"      : apellido,
    "email"         : email,
    "password"      : password,
    "telefono"      : telefono,
    "descripcion"   : descripcion,
  };
}
