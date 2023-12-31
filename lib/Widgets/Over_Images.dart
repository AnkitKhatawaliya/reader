import 'package:flutter/material.dart';

import '../Workflow/Base_URLs.dart';

class Over_Images extends StatelessWidget {
  const Over_Images({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.maxFinite,
          height: MediaQuery.of(context).size.height * 0.42,
          child: Stack(
            children: [
              Image.network(
                School_Image,
                width: double.maxFinite,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  }
                },
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.26,
                left: MediaQuery.of(context).size.width * 0.4,
                child: ClipOval(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.24,
                    height: MediaQuery.of(context).size.width * 0.24,
                    child: Image.network(School_ICON_URL, fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    (loadingProgress.expectedTotalBytes ?? 1)
                                : null,
                          ),
                        );
                      }
                    }),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
