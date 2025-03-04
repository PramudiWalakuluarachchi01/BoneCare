import 'package:flutter/material.dart';

class MonthlyprogressScreen extends StatefulWidget {
  const MonthlyprogressScreen({super.key});

  @override
  State<MonthlyprogressScreen> createState() => _MonthlyprogressScreenState();
}

class _MonthlyprogressScreenState extends State<MonthlyprogressScreen> {
  List<List<bool>> isTaskCompletionCompleted =
      List.generate(4, (_) => [false, false, false, false, false]);
  List<List<bool>> isOverallProgressCompleted =
      List.generate(4, (_) => [false, false, false, false, false]);

  List<int> taskActiveStep = [1, 1, 1, 1];
  List<int> overallActiveStep = [1, 1, 1, 1];

  List<String> stepLabels = ["Very Low", "Low", "Medium", "High", "Very High"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 137, 189, 238),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/pic11.png', // Path to your background image
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white, size: 28),
                  onPressed: () {
                    Navigator.pop(context); // Navigates back to Home Screen
                  },
                ),
                SizedBox(width: 10),
                Text(
                  'Monthly Progress',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                          blurRadius: 10,
                          color: Colors.white.withOpacity(0.5),
                          offset: Offset(2, 2)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 120.0, left: 20.0, right: 20.0, bottom: 20.0),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 178, 191, 201).withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(2, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSection("Physiotherapy Tracking",
                        isTaskCompletionCompleted, taskActiveStep),
                    SizedBox(height: 20),
                    _buildSection("Pain Level", isOverallProgressCompleted,
                        overallActiveStep),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
      String title, List<List<bool>> progressList, List<int> activeSteps) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10),
        Column(
          children: List.generate(4, (week) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: _buildProgressRow(
                  "W${week + 1}", progressList[week], activeSteps[week],
                  (index) {
                setState(() {
                  if (progressList[week][index]) {
                    progressList[week][index] = false;
                    if (index + 1 == activeSteps[week]) {
                      activeSteps[week]--;
                    }
                  } else {
                    progressList[week][index] = true;
                    if (activeSteps[week] < 5) {
                      activeSteps[week]++;
                    }
                  }
                });
              }),
            );
          }),
        ),
      ],
    );
  }

  Widget _buildProgressRow(String label, List<bool> isStepCompleted,
      int activeStep, Function(int) onTap) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Row(
          children: List.generate(5, (stepIndex) {
            bool isActive = stepIndex + 1 == activeStep;
            bool isCompleted = isStepCompleted[stepIndex];
            return GestureDetector(
              onTap: () => onTap(stepIndex),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 14,
                    backgroundColor: isActive
                        ? Colors.blue[800]
                        : isCompleted
                            ? Colors.blue[400]
                            : Colors.grey[300],
                    child: Text(" ", style: TextStyle(color: Colors.white)),
                  ),
                  if (stepIndex < 4)
                    Container(
                      width: 20,
                      height: 2,
                      color: Colors.blue,
                    ),
                ],
              ),
            );
          }),
        ),
        Text(
          stepLabels[activeStep - 1],
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
    );
  }
}
