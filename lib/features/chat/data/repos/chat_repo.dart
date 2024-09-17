import 'package:dartz/dartz.dart';
import 'package:new_project/core/errors/failuer_error.dart';
import 'package:new_project/features/chat/data/models/enums/message_enum.dart';
import 'package:new_project/features/chat/data/models/message_model.dart';

abstract class ChatRepo {
  Either<Failure, void> sendMessage(
    String message,
    MessageEnum messageEnum,
    String receverEmail,
    String receverPhoto,
    String receverName,
  );
  Either<Failure, List<MessageModel>> getMessages({required String receverEmail});
}
