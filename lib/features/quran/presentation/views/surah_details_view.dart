import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muslim_soul/constants.dart';

class SurahDetailsView extends StatelessWidget {
  const SurahDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.kPrimary,
        title: const Text(
          'سورة الفاتحة',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          color: Colors.white,
          onPressed: () {
            GoRouter.of(context).pop();
          },
        ),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 7,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 1,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(
                          color: Constants.kPrimary,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
                        ),
                      ),
                      Positioned(
                        top: -3,
                        left: 12,
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black26,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              '1',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'بسم الله الرحمن الرحيم',
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Divider(),
                        Text(
                          'xxxxx xxxxx xxxx xx xxxxxx',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
