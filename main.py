import sqlite3
from datetime import datetime, date, timedelta
from random import randint, choice

from faker import Faker


fake = Faker('uk-UA')

subjects =[
    "Історія магії",
    "Захист від темних мистецтв",
    "Трансфігурація",
    "Зіллєваріння",
    "Маглознавство",
    "Догляд за магічними тваринами",
    "Літання на мітлах",
    "Закляття"
]

groups = ["Ґрифіндор", "Гафелпаф", "Рейвенклов","Слизерин"]

NUMBERS_TEACHERS = 5
NUMBERS_STUDENTS = 70

connect = sqlite3.connect('hw06.sqlite')
cursor = connect.cursor()


def seed_teachers():
    teachers = [fake.name() for _ in range(NUMBERS_TEACHERS)]
    sql = "INSERT INTO teachers(fullname) VALUES (?);"
    cursor.executemany(sql, zip(teachers,))


def seed_groups():
    sql = "INSERT INTO groups(name) VALUES (?);"
    cursor.executemany(sql, zip(groups,))


def seed_students():
    students = [fake.name() for _ in range(NUMBERS_STUDENTS)]
    list_group_id = [randint(1, len(groups)) for _ in range(NUMBERS_STUDENTS)]
    sql = "INSERT INTO students(fullname, group_id) VALUES (?, ?);"
    cursor.executemany(sql, zip(students, list_group_id))


def seed_subjects():
    list_teacher_id = [randint(1, NUMBERS_TEACHERS) for _ in range(len(subjects))]
    sql = "INSERT INTO subjects(name, teacher_id) VALUES (?, ?);"
    cursor.executemany(sql, zip(subjects, list_teacher_id))


def seed_grades():
    start_data = datetime.strptime("2022-09-01", "%Y-%m-%d")
    finish_data = datetime.strptime("2023-05-31", "%Y-%m-%d")
    sql = "INSERT INTO grades(student_id, subject_id, grade, date_of) VALUES (?, ?, ?, ?);"

    def get_list_date(start: date, end: date) -> list[date]:
        result = []
        current_date = start
        while current_date <= end:
            if current_date.isoweekday() < 6:
                result.append(current_date)
            current_date += timedelta(1)
        return result

    list_date = get_list_date(start_data,finish_data)

    grades = []
    for day in list_date:
        random_subject = randint(1, len(subjects))
        random_students = [randint(1, NUMBERS_STUDENTS) for _ in range(7)]
        for student in random_students:
            grades.append((student, random_subject, randint(1, 12), day.date()))

    cursor.executemany(sql, grades)

if __name__=='__main__':
    try:
        seed_teachers()
        seed_groups()
        seed_students()
        seed_subjects()
        seed_grades()
        connect.commit()
    except sqlite3.Error as error:
        print(error)
    finally:
        connect.close()