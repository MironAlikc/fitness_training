import 'package:fitness_training/data/models/appointment_model.dart';
import 'package:flutter/material.dart';

class ListCalendarWidget extends StatelessWidget {
  const ListCalendarWidget({
    required this.onTap,
    super.key,
    required this.appointment,
  });
  final Function() onTap;
  final AppointmentModel appointment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      child: Stack(
        children: [
          InkWell(
            onTap: onTap,
            child: Container(
              width: double.infinity,
              height: 108,
              padding: const EdgeInsets.all(20),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x26000000),
                    blurRadius: 4,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 37,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage(
                      appointment.client.photo ?? '',
                    ),
                  ),
                  const SizedBox(width: 18),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${appointment.date.hour}:${appointment.date.minute}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Color(0xFFA3A3A3),
                          fontSize: 16,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        appointment.client.name,
                        style: const TextStyle(
                          color: Color(0xFF1E1E1E),
                          fontSize: 18,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Material(
          //   color: Colors.transparent,
          //   child: InkWell(
          //     borderRadius: BorderRadius.circular(13),
          //     onTap: onTap,
          //   ),
          // ),
        ],
      ),
    );
  }
}
