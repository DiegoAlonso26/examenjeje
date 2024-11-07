import 'dart:convert';
import 'package:intl/intl.dart';

// Funciones para parsear y serializar los datos de Reservation
List<Reservation> reservationsFromJson(String str) =>
    List<Reservation>.from(json.decode(str).map((x) => Reservation.fromJson(x)));

String reservationsToJson(List<Reservation> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Reservation {
  int? id;
  String nombre;
  DateTime? fechaEntrada;
  DateTime? fechaSalida;
  String tipoHabitacion;
  int numHuespedes;
  String? observaciones;

  Reservation({
    required this.id,
    required this.nombre,
    required this.fechaEntrada,
    required this.fechaSalida,
    required this.tipoHabitacion,
    required this.numHuespedes,
    this.observaciones,
  });

  // Método para convertir JSON en un objeto Reservation
  factory Reservation.fromJson(Map<String, dynamic> json) {
    final rfc1123Format = DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'", 'en_US');
    DateTime? parseDate(String? dateStr) {
      if (dateStr == null || dateStr == "0000-00-00") return null;

      try {
        return rfc1123Format.parse(dateStr);
      } catch (e) {
        print("Error parsing date with rfc1123Format: $e");
        try {
          return DateTime.parse(dateStr); // Intentar con el formato por defecto de Dart
        } catch (e) {
          print("Error parsing with DateTime.parse: $e");
          return null;
        }
      }
    }

    return Reservation(
      id: json["id"],
      nombre: json["nombre"] ?? 'Sin nombre', // Valor predeterminado si es null
      fechaEntrada: parseDate(json["fecha_entrada"]),
      fechaSalida: parseDate(json["fecha_salida"]),
      tipoHabitacion: json["tipo_habitacion"] ?? 'Desconocido', // Valor predeterminado si es null
      numHuespedes: json["num_huespedes"] ?? 1, // Valor predeterminado si es null
      observaciones: json["observaciones"] ?? "", // String vacío si es null
    );
  }

  // Método para convertir un objeto Reservation a JSON
  Map<String, dynamic> toJson() => {
    "id": id,
    "nombre": nombre,
    "fecha_entrada": fechaEntrada?.toIso8601String(),
    "fecha_salida": fechaSalida?.toIso8601String(),
    "tipo_habitacion": tipoHabitacion,
    "num_huespedes": numHuespedes,
    "observaciones": observaciones ?? "",
  };
}
