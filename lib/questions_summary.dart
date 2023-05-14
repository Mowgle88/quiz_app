import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const QuestionsSummary(this.summaryData, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            final questionNumber = (data['question_index'] as int) + 1;
            final isCorrectanswer =
                data['user_answer'] == data['correct_answer'];

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                      color: isCorrectanswer
                          ? const Color.fromARGB(255, 132, 246, 136)
                          : const Color.fromARGB(255, 249, 133, 241),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      questionNumber.toString(),
                      style: const TextStyle(
                          color: Color.fromARGB(255, 22, 2, 56)),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: GoogleFonts.lato(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '- ${data['user_answer'] as String}',
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 222, 36, 255),
                        ),
                      ),
                      Text(
                        '- ${data['correct_answer'] as String}',
                        style: GoogleFonts.lato(
                          color: const Color.fromARGB(255, 89, 174, 243),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
