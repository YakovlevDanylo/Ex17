# Task 5.f (get all homework)
SELECT name, description
FROM homework;

# Task 5.g (get all lessons and it homework)
SELECT lesson.name as lesson_name,
       lesson.updatedAt as lesson_updateAt,
       homework.name as homework_name,
       homework.description as homework_description
FROM lesson LEFT JOIN homework ON lesson.homework_id = homework.id;


# Task 5.h (get all lessons and it homework ordered by updateAt column)
SELECT lesson.name as lesson_name,
       lesson.updatedAt as lesson_updateAt,
       homework.name as homework_name,
       homework.description as homework_description
FROM lesson LEFT JOIN homework ON lesson.homework_id = homework.id
ORDER BY lesson_updateAt;


# Task 5.i (get all schedule and lessons)
SELECT schedule.name as schedule_name,
       schedule.updateAt as schedule_updateAt,
       lesson.name as lesson_name,
       lesson.updatedAt as lesson_updateAt,
       homework.name as homework_name,
       homework.description as homework_description
FROM (schedule_lesson LEFT JOIN schedule ON schedule_lesson.schedule_id = schedule.id)
LEFT JOIN (lesson LEFT JOIN homework ON lesson.homework_id = homework.id)
    ON schedule_lesson.lesson_id = lesson.id;


# Task 5.j (get count lessons for schedule)
SELECT schedule.name,
       COUNT(schedule_id) AS lessons
FROM schedule_lesson LEFT JOIN schedule ON schedule_lesson.schedule_id = schedule.id
GROUP BY schedule_id;
