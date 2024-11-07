import 'package:examen/src/data/api/ApiConfig.dart';
import 'package:examen/src/domain/models/Reservation.dart';
import 'package:examen/src/domain/utils/Resource.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ReservationService {
  // Método para obtener todas las reservas (GET /reservations)
  Future<Resource<List<Reservation>>> fetchReservations() async {
    try {
      Uri url = Uri.http(ApiConfig.API, '/reservations');
      Map<String, String> headers = {"Content-Type": "application/json"};
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        List<Reservation> reservations = reservationsFromJson(response.body);
        return Success(reservations);
      } else {
        return Error('Error: ${response.statusCode}, ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error $e');
      return Error('Error al obtener reservas: $e');
    }
  }

  // Método para obtener los detalles de una reserva específica (GET /reservations/{id})
  Future<Resource<Reservation>> fetchReservationDetail(int reservationId) async {
    try {
      Uri url = Uri.http(ApiConfig.API, '/reservations/$reservationId');
      Map<String, String> headers = {"Content-Type": "application/json"};
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        Reservation reservation = Reservation.fromJson(json.decode(response.body));
        return Success(reservation);
      } else {
        return Error('Error: ${response.statusCode}, ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error $e');
      return Error('Error al obtener detalles de la reserva: $e');
    }
  }

  // Método para crear una nueva reserva (POST /reservations)
  Future<Resource<Reservation>> createReservation(Reservation reservation) async {
    try {
      Uri url = Uri.http(ApiConfig.API, '/reservations');
      Map<String, String> headers = {"Content-Type": "application/json"};
      final response = await http.post(
        url,
        headers: headers,
        body: json.encode(reservation.toJson()),
      );

      if (response.statusCode == 201) {
        Reservation newReservation = Reservation.fromJson(json.decode(response.body));
        return Success(newReservation);
      } else {
        return Error('Error: ${response.statusCode}, ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error $e');
      return Error('Error al crear la reserva: $e');
    }
  }

  // Método para actualizar una reserva existente (PUT /reservations/{id})
  Future<Resource<Reservation>> updateReservation(int reservationId, Reservation reservation) async {
    try {
      Uri url = Uri.http(ApiConfig.API, '/reservations/$reservationId');
      Map<String, String> headers = {"Content-Type": "application/json"};
      final response = await http.put(
        url,
        headers: headers,
        body: json.encode(reservation.toJson()),
      );

      if (response.statusCode == 200) {
        Reservation updatedReservation = Reservation.fromJson(json.decode(response.body));
        return Success(updatedReservation);
      } else {
        return Error('Error: ${response.statusCode}, ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error $e');
      return Error('Error al actualizar la reserva: $e');
    }
  }

  // Método para eliminar una reserva (DELETE /reservations/{id})
  Future<Resource<bool>> deleteReservation(int reservationId) async {
    try {
      Uri url = Uri.http(ApiConfig.API, '/reservations/$reservationId');
      Map<String, String> headers = {"Content-Type": "application/json"};
      final response = await http.delete(url, headers: headers);

      if (response.statusCode == 200) {
        return Success(true);
      } else {
        return Error('Error: ${response.statusCode}, ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error $e');
      return Error('Error al eliminar la reserva: $e');
    }
  }

}
