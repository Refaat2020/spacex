import 'package:dartz/dartz.dart';
import 'package:spacex/core/extension/task_fail_mapper.dart';

import '../utils/faliure.dart';

extension TaskExcuter<T> on Future<T> {
  //TODO add execute multiple futures
  Future<void> execute({
    Function(Failure f)? onFailed,
    Function(T value) ?onSuccess,
  }) async {

      return await Task(() => this).attempt().mapFailure().run().then((o) {
        return o.fold(
              (f) async {
            try {
              if (onFailed != null) await onFailed(f);
            } catch (e) {
              print(e);
            }
          },
              (s) async {
            try {
              if (onSuccess != null) await onSuccess(s);
            } catch (e) {
              print(e);
            }
          },
        );
      });
    }
  }

