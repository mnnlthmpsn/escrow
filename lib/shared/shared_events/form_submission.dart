abstract class FormSubmissionStatus {
  const FormSubmissionStatus();
}

class InitialFormStatus extends FormSubmissionStatus {
  const InitialFormStatus();
}

class FormLoading extends FormSubmissionStatus {}

class SubmissionSuccess extends FormSubmissionStatus {}

class SubmissionFailed extends FormSubmissionStatus {
  final Exception exception;

  SubmissionFailed({ required this.exception });
}