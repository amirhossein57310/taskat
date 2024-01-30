import 'package:flutter/material.dart';

class SimpleTimeline extends StatefulWidget {
  final int selectedEventIndex;
  final Function(int) onEventTap;

  SimpleTimeline({
    required this.selectedEventIndex,
    required this.onEventTap,
  });

  @override
  State<SimpleTimeline> createState() => _SimpleTimelineState();
}

class _SimpleTimelineState extends State<SimpleTimeline> {
  final List<String> timeLabels = [
    'همه',
    '12:00 AM',
    '01:00 AM',
    '02:00 AM',
    '03:00 AM',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 24,
      ),
      child: Container(
        height: 50,
        child: ListView.builder(
          reverse: true,
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => widget.onEventTap(index),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Container(
                        height: 2,
                        width: 80, // Adjust the length of the line as needed
                        color: Colors.blue,
                      ),
                      widget.selectedEventIndex == index
                          ? Container(
                              margin: const EdgeInsets.only(
                                top: 0,
                              ),
                              height: 16,
                              width: 16,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue,
                              ),
                            )
                          : const Text(''),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                    ),
                    child: Text(
                      timeLabels[index],
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
