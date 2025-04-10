import 'package:flutter/material.dart';

class InstructionsScreen extends StatefulWidget {
  const InstructionsScreen({super.key});

  @override
  State<InstructionsScreen> createState() => _InstructionsScreenState();
}

class _InstructionsScreenState extends State<InstructionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 137, 189, 238),
      body: Stack(
        children: [
          // Background Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/pic9.png', // Make sure the path is correct
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),

          // Back button and "Instructions" text
          Positioned(
            top: 50,
            left: 20,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                  onPressed: () {
                    Navigator.pop(context); // Navigates back to Home Screen
                  },
                ),
                const Text(
                  'Instructions',
                  style: TextStyle(
                    fontSize: 26,
                    fontFamily: 'Playfairdisplay',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10,
                        color: Colors.white54,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Content Layer (Position the buttons lower)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.35, // Adjust this value to move the buttons lower
            left: 30,
            right: 30,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start, // Align from top
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Option Buttons (Physiotherapy options)
                    PhysioButton(
                      title: 'Spine Exercises',
                      onTap: () {
                        showInstructionsDialog(context, 'Spine Exercises',
                            'Goal: Improve posture and strengthen back extensors.\n\nBack Extension Exercise\n• Lie face down (use a mat).\n• Place hands under your shoulders (like a cobra pose in yoga).\n• Gently lift your chest off the floor while keeping hips down.\n•🔁 Hold for 5 seconds, do 10 reps.\n\nShoulder Blade Squeeze\n•Sit or stand upright.,\n•Pull shoulder blades together, \n•hold 5 seconds.,\n•🔁 10–15 reps.');
                      },
                    ),
                    PhysioButton(
                      title: 'Hip Strengthening',
                      onTap: () {
                        showInstructionsDialog(context, 'Hip Strengthening',
                            'Goal: Strengthen hip stabilizers and maintain joint mobility.\n\nSide-Lying Leg Lifts\n•Lie on your side, bottom leg bent, top leg straight.\n•Raise the top leg 12–18 inches, hold 3 seconds.\n•🔁 10 reps per leg.\n\nStanding Hip Abduction\n•Stand with support.\n•Raise one leg sideways, hold 3 seconds.\n•🔁 10 reps per side.');
                      },
                    ),
                    PhysioButton(
                      title: 'Knee Support Routine',
                      onTap: () {
                        showInstructionsDialog(context, 'Knee Support Routine',
                            'Goal: Strengthen quads and reduce joint stress.\n\n Quad Sets\n•Sit with legs straight, tighten thigh muscle to press knee toward the floor.\n•Hold for 5 seconds.\n•🔁 10–15 reps.\n\nSit-to-Stand\n•Sit on a firm chair.\n•Stand up slowly without using hands.\n•Sit back down slowly.\n•🔁 10 reps.');
                      },
                    ),
                    PhysioButton(
                      title: 'Balance & Ankle Care',
                      onTap: () {
                        showInstructionsDialog(context, 'Balance & Ankle Care',
                            'Goal: Improve stability and prevent falls.\n\nHeel-to-Toe Walk\n•Walk in a straight line, placing the heel of one foot directly in front of the toes of the other.\n•Use a wall for support if needed.\n•🔁 Walk 10 steps each way.\n\nHeel Raises\n•Hold on to a chair.\n•Rise onto toes, hold 3 seconds.\n•Lower slowly.\n•🔁 10–15 reps.');
                      },
                    ),
                    PhysioButton(
                      title: 'Wrist Mobility',
                      onTap: () {
                        showInstructionsDialog(context, 'Wrist Mobility',
                            'Goal: Improve grip strength and joint mobility.\n\nWrist Flexion/Extension Stretch\n•Stretch wrist by bending it down and up using the opposite hand.\n• Stress Ball Squeezes\n•Hold each stretch for 15 seconds.\n•🔁 Repeat 2–3 times per hand.\n\nGrip Strengthening\n•Squeeze a stress ball or rolled towel.\n•Hold for 3–5 seconds.\n•🔁 10 reps per hand.');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showInstructionsDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}

class PhysioButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const PhysioButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(16),
        width: MediaQuery.of(context).size.width * 0.8, // Buttons take 80% of screen width
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
