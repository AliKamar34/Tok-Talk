import 'package:dartz/dartz.dart';
import 'package:new_project/core/errors/failuer_error.dart';
import 'package:new_project/features/chat/data/models/enums/message_enum.dart';

abstract class ChatRepo {
  Either<Failure, void> sendMessage(
    String message,
    MessageEnum messageEnum,
    String receverEmail,
    String receverPhoto,
    String receverName,
  );

  Future<Either<Failure, void>> sendImage(
    String receverEmail,
    String receverPhoto,
    String receverName,
  );

  Future<Either<Failure, void>> sendRecord(
    String receverEmail,
    String receverPhoto,
    String receverName,
  );
  Future<Either<Failure, void>> startRecording();
  playRecord(String url);
   stopRecord();

}
