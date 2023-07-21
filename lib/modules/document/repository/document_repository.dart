import 'package:check_in/core/base_response.dart';
import 'package:check_in/modules/document/models/document_model.dart';
import 'package:check_in/modules/document/provider/document_provider.dart';

class DocumentRepository {
  DocumentRepository({required this.documentProvider});

  final DocumentProvider documentProvider;

  Future<BaseResponse?> document(DocumentModel documentModel, url, token) =>
      documentProvider.document(documentModel, url, token);
  Future<BaseResponse?> postGradeList(String classroomId, url, token) =>
      documentProvider.postDocumentList(classroomId, url, token);
}
