import 'package:fitness_training/presentation/widgets/settings_camers_widget.dart';
import 'package:fitness_training/core/resources/resources.dart';
import 'package:flutter/material.dart';

class ImageUserWidget extends StatelessWidget {
  const ImageUserWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      //radius: 19.r,
      backgroundColor: const Color(0xFFC8CE37),
      child: Center(
        child: IconButton(
          onPressed: () {
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              context: context,
              builder: (context) => Container(
                height: 250,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 12),
                    Container(
                      width: 50,
                      height: 7,
                      decoration: ShapeDecoration(
                        color: const Color(0xFFD9D9D9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    SettingsCamersWidget(
                      image: AppSvgs.photo,
                      title: "Select from Gallery",
                      onPressed: () {},
                    ),
                    SettingsCamersWidget(
                      image: AppSvgs.camera,
                      title: "Open Camera",
                      onPressed: () {},
                    ),
                    SettingsCamersWidget(
                      image: AppSvgs.delete,
                      title: "Delete Photo",
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            );
          },
          icon: const Icon(
            Icons.camera_alt,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
