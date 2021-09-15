import 'package:flutter/material.dart';

class MoreInformation extends StatelessWidget {
  final String startDate,
      endDate,
      nextRelease,
      popularityRank,
      ratingRank,
      ageRatingGuide,
      status,
      episodeCount,
      episodeLength;

  const MoreInformation(
      {Key? key,
      required this.startDate,
      required this.endDate,
      required this.nextRelease,
      required this.popularityRank,
      required this.ratingRank,
      required this.ageRatingGuide,
      required this.status,
      required this.episodeCount,
      required this.episodeLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Start Date                 ",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(0, 0, 0, 0.65),
                        ),
                      ),
                      TextSpan(
                        text: startDate,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "End Date                   ",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(0, 0, 0, 0.65),
                        ),
                      ),
                      TextSpan(
                        text: endDate,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Next Release            ",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(0, 0, 0, 0.65),
                        ),
                      ),
                      TextSpan(
                        text: nextRelease,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Popularity Rank       ",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(0, 0, 0, 0.65),
                        ),
                      ),
                      TextSpan(
                        text: popularityRank,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Rating Rank              ",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(0, 0, 0, 0.65),
                        ),
                      ),
                      TextSpan(
                        text: ratingRank,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Age Rating Guide    ",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(0, 0, 0, 0.65),
                        ),
                      ),
                      TextSpan(
                        text: ageRatingGuide,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Status Guide             ",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(0, 0, 0, 0.65),
                        ),
                      ),
                      TextSpan(
                        text: status,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Total Episodes         ",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(0, 0, 0, 0.65),
                        ),
                      ),
                      TextSpan(
                        text: episodeCount,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Episode Length        ",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color.fromRGBO(0, 0, 0, 0.65),
                        ),
                      ),
                      TextSpan(
                        text: episodeLength,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
