import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timer/streamtime.dart';

class ViewField extends StatelessWidget {
  const ViewField({required this.field, super.key});
  final String field;

  @override
  Widget build(BuildContext context) {
    Map<String, String> roles = {
      'speech': 'Speech',
      'stortel': 'Storytelling',
      'newscast': 'Newscasting',
      'spellbe': 'Spelling Bee',
      'debate': 'Debate'
    };
    return SizedBox(
      height: MediaQuery.of(context).size.height * .7,
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: (roles[field] != 'Debate')
                ? MainAxisAlignment.spaceAround
                : MainAxisAlignment.center,
            children: [
              Text(
                roles[field].toString(),
                style: GoogleFonts.lato(fontSize: 25),
              ),
              if (roles[field] != 'Debate')
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        '/${roles[field].toString().toLowerCase()}_prep_1');
                  },
                  child: SizedBox(
                    width: 400,
                    child: StreamTime(
                      title: 'Prep room 1',
                      room: 'prep room1',
                      field: roles[field].toString(),
                      fontsize: 15,
                    ),
                  ),
                ),
              if (roles[field] != 'Debate')
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                        '/${roles[field].toString().toLowerCase()}_prep_2');
                  },
                  child: SizedBox(
                    width: 400,
                    child: StreamTime(
                      title: 'Prep room 2',
                      room: 'Prep room2',
                      field: roles[field].toString(),
                      fontsize: 15,
                    ),
                  ),
                ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                      '/${roles[field].toString().toLowerCase()}_perform');
                },
                child: SizedBox(
                  width: 400,
                  child: StreamTime(
                    title: 'Perform room',
                    room: 'Perform room',
                    field: roles[field].toString(),
                    fontsize: (roles[field] != 'Debate') ? 15 : 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}