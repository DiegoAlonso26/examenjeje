import 'package:examen/src/domain/models/Reservation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'bloc/ReservationBloc.dart';
import 'bloc/ReservationEvent.dart';
import 'bloc/ReservationState.dart';

class ReservationListPage extends StatefulWidget {
  const ReservationListPage({super.key});

  @override
  _ReservationListPageState createState() => _ReservationListPageState();
}

class _ReservationListPageState extends State<ReservationListPage> {
  @override
  void initState() {
    super.initState();
    // Disparar el evento para cargar las reservas al iniciar la página
    context.read<ReservationBloc>().add(const FetchReservations());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Lista de Reservas'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<ReservationBloc, ReservationState>(
          builder: (context, state) {
            if (state is ReservationLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ReservationLoaded) {
              return _buildReservationList(state.reservations);
            } else if (state is ReservationError) {
              return Center(child: Text('Error: ${state.error}'));
            }
            return const Center(child: Text('No hay reservas disponibles'));
          },
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () async {
              // Navegar a la página de creación de reservas y esperar el resultado
              final result = await Navigator.pushNamed(context, 'registerPage');
              if (result == true) {
                // Si se creó una reserva, volver a cargar las reservas
                context.read<ReservationBloc>().add(const FetchReservations());
              }
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              backgroundColor: Colors.blueAccent,
            ),
            child: const Text(
              'Crear Reserva',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Construir la lista de reservas
  Widget _buildReservationList(List<Reservation> reservations) {
    final dateFormat = DateFormat("dd MMM yyyy"); // Define el formato de la fecha
    return ListView.builder(
      itemCount: reservations.length,
      itemBuilder: (context, index) {
        final reservation = reservations[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      reservation.nombre,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit, color: Colors.green),
                          onPressed: () {
                            // Navegar a la página de edición con los datos de la reserva
                            Navigator.pushNamed(
                              context,
                              'editPage',
                              arguments: reservation,
                            ).then((result) {
                              if (result == true) {
                                // Si se actualizó una reserva, volver a cargar las reservas
                                context.read<ReservationBloc>().add(const FetchReservations());
                              }
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            // Confirmación antes de eliminar
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Confirmar eliminación"),
                                  content: Text("¿Estás seguro de que deseas eliminar esta reserva?"),
                                  actions: [
                                    TextButton(
                                      child: Text("Cancelar"),
                                      onPressed: () => Navigator.of(context).pop(),
                                    ),
                                    TextButton(
                                      child: Text("Eliminar"),
                                      onPressed: () {
                                        // Ejecutar el evento de eliminación
                                        context.read<ReservationBloc>().add(DeleteReservationEvent(reservation.id!));
                                        Navigator.of(context).pop(); // Cerrar el diálogo
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                _buildDetailRow(
                  Icons.calendar_today,
                  'Entrada: ${reservation.fechaEntrada != null ? dateFormat.format(reservation.fechaEntrada!) : '-'}',
                ),
                _buildDetailRow(
                  Icons.calendar_today,
                  'Salida: ${reservation.fechaSalida != null ? dateFormat.format(reservation.fechaSalida!) : '-'}',
                ),
                _buildDetailRow(Icons.king_bed, 'Habitación: ${reservation.tipoHabitacion}'),
                _buildDetailRow(Icons.group, 'Huéspedes: ${reservation.numHuespedes}'),
                _buildDetailRow(Icons.notes, 'Observaciones: ${reservation.observaciones ?? '-'}'),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.black54),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ],
    );
  }
}
