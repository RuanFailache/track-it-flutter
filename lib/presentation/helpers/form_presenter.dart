import 'package:formz/formz.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class FormPresenter<Form extends FormzMixin> {
  FormPresenter(this.form);

  @protected
  Form form;

  @protected
  final submissionStatus = Rx(FormzSubmissionStatus.initial);

  Stream<FormzSubmissionStatus> get submissionStatusStream =>
      submissionStatus.stream;

  bool get canSubmitForm =>
      form.isDirty &&
      form.isValid &&
      submissionStatus.value != FormzSubmissionStatus.inProgress;
}
