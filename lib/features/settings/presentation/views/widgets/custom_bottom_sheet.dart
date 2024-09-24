import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_project/features/settings/presentation/manager/setting_cubit/settings_cubit.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();

    return Container(
      padding: const EdgeInsets.all(16.0),
      height: MediaQuery.sizeOf(context).height * 0.45,
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Edit Name',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: 'Enter new name',
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<SettingsCubit>(context)
                        .settingsRepo
                        .upDateUserName(name: nameController.text);
                    Navigator.pop(context);
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
