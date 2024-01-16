import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:linkyoutask/features/UsersListPage/presentation/manager/cubit/user_list_cubit.dart';

import 'widgets/DetailsContainer.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {



  @override
  Widget build(BuildContext context) {

    return CustomScrollView(
      slivers: [
        BlocBuilder<ListUsersCubit, UserListState>(
          builder: (context, state) {
           if(state is UserListSuccess){
             return SliverList.builder(
              itemCount: state.userlistmodel.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: userdetail(userlistmodel: state.userlistmodel[index]),
                );
              },
            );
           }else if(state is UserListFailure){
            return SliverToBoxAdapter(child: Center(child:Text(state.errmessag)));
           }
           else{
            return SliverToBoxAdapter(child: CircularProgressIndicator());
           }
          },
        )
      ],
    );
  }
}
