import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_soul/core/widgets/custom_error_widget.dart';
import 'package:muslim_soul/core/widgets/custom_loading.dart';
import 'package:muslim_soul/features/qari/data/models/qaris_model/qaris_model.dart';
import 'package:muslim_soul/features/qari/presentation/menegare/qaris_cubit/qaris_cubit.dart';

class QariViewBody extends StatelessWidget {
  const QariViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 12,
        right: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 12,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 1.0,
                  spreadRadius: 0.0,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Search'),
                  Spacer(),
                  Icon(
                    Icons.search_rounded,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: BlocBuilder<QarisCubit, QarisState>(
              builder: (context, state) {
                if (state is QarisSuccess) {
                  return ListView.builder(
                    itemCount: state.qaris.length,
                    itemBuilder: (constxt, index) {
                      QarisModel qarisModel = state.qaris[index];
                      return QariListViewItem(
                        qari: qarisModel,
                      );
                    },
                  );
                } else if (state is QarisFailure) {
                  return CustomErrorWidget(
                    errMessage: state.errMessage,
                    onPressed: () {
                      BlocProvider.of<QarisCubit>(context).getQaris();
                    },
                  );
                } else {
                  return const CustomLoading();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class QariListViewItem extends StatelessWidget {
  const QariListViewItem({super.key, required this.qari});

  final QarisModel qari;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 3,
                spreadRadius: 0,
                color: Colors.black12,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            children: [
              Text(
                qari.name ?? '------',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
