import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_soul/core/widgets/custom_error_widget.dart';
import 'package:muslim_soul/core/widgets/custom_loading.dart';
import 'package:muslim_soul/features/qari/data/models/qaris_model/qaris_model.dart';
import 'package:muslim_soul/features/qari/presentation/menegare/qaris_cubit/qaris_cubit.dart';

import 'qari_list_view_item.dart';

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
