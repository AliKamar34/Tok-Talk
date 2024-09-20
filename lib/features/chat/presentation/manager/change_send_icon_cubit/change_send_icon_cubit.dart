import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_send_icon_state.dart';

class ChangeSendIconCubit extends Cubit<ChangeSendIconState> {
  ChangeSendIconCubit() : super(ChangeSendIconInitial());

  changeIcon(bool recordIcon) {
    recordIcon ? emit(ChangeSendIconRecord()) : emit(ChangeSendIconIText());
  }
}
