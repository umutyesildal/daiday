import 'package:get_it/get_it.dart';
import 'package:local_storage/local_storage.dart';

final sl = GetIt.instance;

void setup() {
  sl.registerSingletonAsync<DaylogStorage>(() async {
    final HiveDaylogStorage hiveDaylogRepository = HiveDaylogStorage();
    await hiveDaylogRepository.init();
    await Future.delayed(Duration(seconds: 2));
    return hiveDaylogRepository;
  });
}
