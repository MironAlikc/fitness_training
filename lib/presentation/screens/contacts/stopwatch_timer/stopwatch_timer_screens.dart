import "dart:async";

import "package:flutter/material.dart";

class StopwatchTimerScreens extends StatefulWidget {
  const StopwatchTimerScreens({super.key});

  @override
  State<StopwatchTimerScreens> createState() => _StopwatchTimerScreensState();
}

class _StopwatchTimerScreensState extends State<StopwatchTimerScreens> {
  int seconds = 0;
  int minutes = 0;
  int hours = 0;
  String digitSeconds = "00";
  String digitMinutes = "00";
  String digitHours = "00";
  Timer? timer;
  bool started = false;
  List laps = [];

  void stop() {
    timer!.cancel();

    setState(() {
      started = false;
    });
  }

  void reset() {
    timer!.cancel();
    setState(() {
      seconds = 0;
      minutes = 0;
      hours = 0;

      digitSeconds = "00";
      digitMinutes = "00";
      digitHours = "00";

      started = false;
    });
  }

  void addLaps() {
    final String lap = "$digitHours:$digitMinutes:$digitSeconds";

    setState(() {
      laps.add(lap);
    });
  }

  void start() {
    started = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      int localSeconds = seconds + 1;
      int localMinutes = minutes;
      int localHours = hours;

      if (localSeconds > 59) {
        if (localMinutes > 59) {
          localHours++;
          localMinutes = 0;
        } else {
          localMinutes++;
          localSeconds = 0;
        }
      }
      setState(() {
        seconds = localSeconds;
        minutes = localMinutes;
        hours = localHours;
        digitSeconds = (seconds >= 10) ? "$seconds" : "0$seconds";
        digitHours = (hours >= 10) ? "$hours" : "0$hours";
        digitMinutes = (minutes >= 10) ? "$minutes" : "0$minutes";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Text(
                "$digitHours:$digitMinutes:$digitSeconds",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(reset);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 60, 59, 59),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(34),
                  ),
                  child: const Text(
                    "Reset",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  color: Colors.white,
                  onPressed: addLaps,
                  icon: const Icon(Icons.flag),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    (!started) ? start() : stop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: (!started)
                        ? const Color.fromARGB(255, 47, 112, 49)
                        : const Color.fromARGB(255, 119, 46, 41),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(34),
                  ),
                  child: Text(
                    (!started) ? "Start" : "Pause",
                    style: TextStyle(
                      color: (!started) ? Colors.black : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: laps.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "круг ${index + 1}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "${laps[index]}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
