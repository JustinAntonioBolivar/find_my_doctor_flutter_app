import 'package:find_my_doctor/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../models/doctor.dart';

class TopDoctorCard extends StatelessWidget {
  const TopDoctorCard({Key? key, this.doctor}) : super(key: key);

  final Doctor? doctor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        color: Colors.transparent,
        height: 80,
        width: MediaQuery.of(context).size.width - 32,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 88,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/${doctor!.doctorPicture}'),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctor!.doctorName,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(
                    '${doctor!.doctorSpecialty} • ${doctor!.doctorHospital}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const Spacer(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 136,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            RatingBar.builder(
                              itemSize: 16,
                              initialRating: double.parse(doctor!.doctorRating),
                              minRating: 1,
                              direction: Axis.horizontal,
                              itemCount: 5,
                              itemPadding: EdgeInsets.zero,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: kYellowColor,
                              ),
                              onRatingUpdate: (rating) {
                                debugPrint(rating.toString());
                              },
                              unratedColor: kGreyColor600,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text('(${doctor!.doctorNumberOfPatient})',
                                style: Theme.of(context).textTheme.bodyMedium),
                          ],
                        ),
                        Container(
                          height: 24,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 13,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: kGreenLightColor,
                          ),
                          child: Text(
                            'Open',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: kGreenColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
