import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sports_complex_app/injection.dart';

import 'package:sports_complex_app/src/domain/coaches/coach.dart';

class CoachListTile extends StatelessWidget {
  const CoachListTile({
    required this.coach,
    this.onTap,
    this.onLongPress,
    Key? key,
  }) : super(key: key);

  final Coach coach;
  final Function()? onTap;
  final Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Column(
        children: <Widget>[
          ListTile(
            contentPadding:
                const EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
            // TODO: cool dash placeholder
            leading: SizedBox(
              width: 50.0,
              height: 50.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: FutureBuilder<String>(
                  future: getIt<FirebaseStorage>()
                      .ref('user-pic-${coach.id}')
                      .getDownloadURL(),
                  builder: (_, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      return Image.network(
                        snapshot.data!,
                        fit: BoxFit.cover,
                      );
                    }
                    return SvgPicture.asset('assets/icons/man.svg');
                  },
                ),
              ),
            ),
            title: Text(coach.fullName),
          ),
          const Divider(height: 0.0),
        ],
      ),
    );
  }
}
