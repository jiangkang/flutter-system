/// 任务模型
class Task {
  /// 开始时间
  DateTime startDate;

  /// 完成时间
  DateTime endDate;

  /// 截止日期
  DateTime deadline;

  /// 任务
  String taskName;

  /// 任务详情/说明/备注
  String taskDetail;

  /// 任务状态
  /// 1. to do
  /// 2. in progress
  /// 3. done
  /// 4. overdue(逾期，超过截止日期未完成，可转变为done)
  TaskStatus taskStatus;

  bool needRemind;

  DateTime remindDate;

  /// 任务重复类型（日，星期，月，年为间隔重复，由于提醒是附着在任务上的，因此提醒也会重复）
  RepeatType repeatType;

  Task(this.taskName,
      {this.taskDetail,
      this.startDate,
      this.endDate,
      this.deadline,
      this.taskStatus = TaskStatus.TODO,
      this.needRemind = false,
      this.remindDate,
      this.repeatType = RepeatType.NONE});
}

/// 任务状态
enum TaskStatus { TODO, IN_PROGRESS, DONE, OVERDUE }

/// 任务重复类型
enum RepeatType {
  /// 不重复,默认
  NONE,

  /// 每天重复，提醒时间为指定时间点
  DAY,

  /// 每一周的星期几重复，默认为当前星期天数，可指定
  WEEK,

  /// 每个月的几号重复，默认为当前日期，可指定
  MONTH,

  /// 每年的几号重复，默认为当前日期
  YEAR
}
