# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals

from django.db import models


class AcademicYear(models.Model):
    academic_year_id = models.IntegerField(primary_key=True)
    academic_year_name = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'academic_year'


class Activation(models.Model):
    user_id = models.CharField(max_length=50)
    code = models.CharField(primary_key=True, max_length=200)
    time = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'activation'


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=80)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group_id = models.IntegerField()
    permission_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group_id', 'permission_id'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type_id = models.IntegerField()
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type_id', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=30)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user_id = models.IntegerField()
    group_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user_id', 'group_id'),)


class AuthUserUserPermissions(models.Model):
    user_id = models.IntegerField()
    permission_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user_id', 'permission_id'),)


class Class(models.Model):
    class_id = models.IntegerField(primary_key=True)
    class_num = models.CharField(max_length=20)
    major_code = models.ForeignKey('Major', models.DO_NOTHING, db_column='major_code')
    grade = models.ForeignKey('Grade', models.DO_NOTHING)
    college = models.ForeignKey('College', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'class'


class ClassContest(models.Model):
    class_contest_id = models.IntegerField(primary_key=True)
    class_field = models.ForeignKey(Class, models.DO_NOTHING, db_column='class_id')  # Field renamed because it was a Python reserved word.
    contest_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'class_contest'


class Collections(models.Model):
    col_id = models.AutoField(primary_key=True)
    user_id = models.CharField(max_length=30)
    title = models.CharField(max_length=300)
    description = models.TextField()
    cnt = models.IntegerField()
    div = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'collections'


class CollectionsProblem(models.Model):
    idx = models.AutoField(primary_key=True)
    col_id = models.IntegerField()
    pid = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'collections_problem'


class College(models.Model):
    college_id = models.IntegerField(primary_key=True)
    college_name = models.CharField(max_length=100)
    university_code = models.ForeignKey('University', models.DO_NOTHING, db_column='university_code')

    class Meta:
        managed = False
        db_table = 'college'


class Compileinfo(models.Model):
    solution_id = models.IntegerField(primary_key=True)
    error = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'compileinfo'


class Contest(models.Model):
    contest_id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=255, blank=True, null=True)
    start_time = models.DateTimeField(blank=True, null=True)
    end_time = models.DateTimeField(blank=True, null=True)
    defunct = models.CharField(max_length=1)
    points = models.TextField(blank=True, null=True)
    private = models.IntegerField()
    langmask = models.IntegerField()
    contest_mode = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'contest'


class ContestPrivilege(models.Model):
    privilege_id = models.AutoField(primary_key=True)
    privilege = models.CharField(max_length=45, blank=True, null=True)
    private_id = models.CharField(max_length=45, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'contest_privilege'


class ContestProblem(models.Model):
    problem_id = models.IntegerField()
    contest_id = models.IntegerField(blank=True, null=True)
    title = models.CharField(max_length=200)
    num = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'contest_problem'


class ContestUsers(models.Model):
    user_id = models.CharField(max_length=20)
    contest_id = models.IntegerField(blank=True, null=True)
    title = models.CharField(max_length=200)
    num = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'contest_users'


class Course(models.Model):
    course_code = models.CharField(primary_key=True, max_length=20)
    course_name = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'course'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.SmallIntegerField()
    change_message = models.TextField()
    content_type_id = models.IntegerField(blank=True, null=True)
    user_id = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Grade(models.Model):
    grade_id = models.IntegerField(primary_key=True)
    start_time = models.DateField()

    class Meta:
        managed = False
        db_table = 'grade'


class Language(models.Model):
    language_id = models.AutoField(primary_key=True)
    language = models.IntegerField(blank=True, null=True)
    language_name = models.CharField(max_length=45, blank=True, null=True)
    language_compile = models.CharField(max_length=45, blank=True, null=True)
    language_ext = models.CharField(max_length=45, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'language'


class Loginlog(models.Model):
    user_id = models.CharField(max_length=20)
    password = models.CharField(max_length=40, blank=True, null=True)
    ip = models.CharField(max_length=100, blank=True, null=True)
    time = models.DateTimeField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'loginlog'


class Mail(models.Model):
    mail_id = models.AutoField(primary_key=True)
    to_user = models.CharField(max_length=20)
    from_user = models.CharField(max_length=20)
    title = models.CharField(max_length=200)
    content = models.TextField(blank=True, null=True)
    new_mail = models.IntegerField()
    reply = models.IntegerField(blank=True, null=True)
    in_date = models.DateTimeField(blank=True, null=True)
    defunct = models.CharField(max_length=1)

    class Meta:
        managed = False
        db_table = 'mail'


class Major(models.Model):
    major_code = models.CharField(primary_key=True, max_length=10)
    major_name = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'major'


class News(models.Model):
    news_id = models.AutoField(primary_key=True)
    comment = models.TextField()
    time = models.DateTimeField()
    release = models.IntegerField(blank=True, null=True)
    type = models.IntegerField(blank=True, null=True)
    author = models.CharField(max_length=45, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'news'


class Online(models.Model):
    hash = models.CharField(primary_key=True, max_length=32)
    ip = models.CharField(max_length=20)
    ua = models.CharField(max_length=255)
    refer = models.CharField(max_length=255, blank=True, null=True)
    lastmove = models.IntegerField()
    firsttime = models.IntegerField(blank=True, null=True)
    uri = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'online'


class Privilege(models.Model):
    user_id = models.CharField(max_length=20)
    rightstr = models.CharField(max_length=30)
    defunct = models.CharField(max_length=1)

    class Meta:
        managed = False
        db_table = 'privilege'


class Problem(models.Model):
    problem_id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=200)
    description = models.TextField(blank=True, null=True)
    input = models.TextField(blank=True, null=True)
    output = models.TextField(blank=True, null=True)
    sample_input = models.TextField(blank=True, null=True)
    sample_output = models.TextField(blank=True, null=True)
    spj = models.CharField(max_length=1)
    hint = models.TextField(blank=True, null=True)
    source = models.CharField(max_length=100, blank=True, null=True)
    in_date = models.DateTimeField(blank=True, null=True)
    time_limit = models.IntegerField()
    memory_limit = models.IntegerField()
    defunct = models.CharField(max_length=1)
    accepted = models.IntegerField(blank=True, null=True)
    submit = models.IntegerField(blank=True, null=True)
    solved = models.IntegerField(blank=True, null=True)
    fileupload = models.CharField(max_length=1, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'problem'


class Reply(models.Model):
    rid = models.AutoField(primary_key=True)
    author_id = models.CharField(max_length=20)
    time = models.DateTimeField()
    content = models.TextField()
    topic_id = models.IntegerField()
    status = models.IntegerField()
    ip = models.CharField(max_length=30)

    class Meta:
        managed = False
        db_table = 'reply'


class Runtimeinfo(models.Model):
    solution_id = models.IntegerField(primary_key=True)
    error = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'runtimeinfo'


class Semester(models.Model):
    semester_id = models.IntegerField(primary_key=True)
    semester_name = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'semester'


class Sim(models.Model):
    s_id = models.IntegerField(primary_key=True)
    sim_s_id = models.IntegerField(primary_key=True)
    sim = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'sim'
        unique_together = (('s_id', 'sim_s_id'),)


class SimConfig(models.Model):
    id = models.IntegerField(primary_key=True)
    sim_enable = models.IntegerField()
    sim_threshold = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'sim_config'


class Solution(models.Model):
    solution_id = models.AutoField(primary_key=True)
    problem_id = models.IntegerField()
    user_id = models.CharField(max_length=20, blank=True, null=True)
    time = models.IntegerField(blank=True, null=True)
    memory = models.IntegerField(blank=True, null=True)
    in_date = models.DateTimeField(blank=True, null=True)
    result = models.SmallIntegerField(blank=True, null=True)
    language = models.IntegerField(blank=True, null=True)
    ip = models.CharField(max_length=15, blank=True, null=True)
    contest_id = models.IntegerField(blank=True, null=True)
    valid = models.IntegerField(blank=True, null=True)
    num = models.IntegerField(blank=True, null=True)
    code_length = models.IntegerField(blank=True, null=True)
    judgetime = models.DateTimeField(blank=True, null=True)
    is_sim = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'solution'


class SourceCode(models.Model):
    solution_id = models.IntegerField(primary_key=True)
    source = models.TextField()

    class Meta:
        managed = False
        db_table = 'source_code'


class Status(models.Model):
    status_id = models.IntegerField(primary_key=True)
    result_id = models.IntegerField()
    status = models.CharField(max_length=45, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'status'


class Student(models.Model):
    student_num = models.CharField(primary_key=True, max_length=20)
    student_name = models.CharField(max_length=100)
    student_email = models.CharField(max_length=100, blank=True, null=True)
    class_field = models.ForeignKey(Class, models.DO_NOTHING, db_column='class_id')  # Field renamed because it was a Python reserved word.
    user_id = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'student'


class Teacher(models.Model):
    teacher_num = models.CharField(primary_key=True, max_length=20)
    teacher_name = models.CharField(max_length=50)
    teacher_email = models.CharField(max_length=255, blank=True, null=True)
    college = models.ForeignKey(College, models.DO_NOTHING, blank=True, null=True)
    problem = models.IntegerField()
    user_id = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'teacher'


class TeachingRelation(models.Model):
    teaching_relation_id = models.AutoField(primary_key=True)
    teacher_num = models.ForeignKey(Teacher, models.DO_NOTHING, db_column='teacher_num')
    class_field = models.ForeignKey(Class, models.DO_NOTHING, db_column='class_id')  # Field renamed because it was a Python reserved word.
    academic_year = models.ForeignKey(AcademicYear, models.DO_NOTHING)
    semester = models.ForeignKey(Semester, models.DO_NOTHING)
    course_code = models.ForeignKey(Course, models.DO_NOTHING, db_column='course_code')

    class Meta:
        managed = False
        db_table = 'teaching_relation'


class Topic(models.Model):
    tid = models.AutoField(primary_key=True)
    title = models.CharField(max_length=60)
    status = models.IntegerField()
    top_level = models.IntegerField()
    cid = models.IntegerField(blank=True, null=True)
    pid = models.IntegerField()
    author_id = models.CharField(max_length=20)

    class Meta:
        managed = False
        db_table = 'topic'


class Type(models.Model):
    type_id = models.IntegerField(primary_key=True)
    type_name = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'type'


class University(models.Model):
    university_code = models.CharField(primary_key=True, max_length=10)
    university_name = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'university'


class Users(models.Model):
    user_id = models.CharField(primary_key=True, max_length=20)
    email = models.CharField(max_length=100, blank=True, null=True)
    submit = models.IntegerField(blank=True, null=True)
    solved = models.IntegerField(blank=True, null=True)
    defunct = models.CharField(max_length=1)
    ip = models.CharField(max_length=20)
    accesstime = models.DateTimeField(blank=True, null=True)
    volume = models.IntegerField()
    language = models.IntegerField()
    password = models.CharField(max_length=32, blank=True, null=True)
    reg_time = models.DateTimeField(blank=True, null=True)
    nick = models.CharField(max_length=100)
    school = models.CharField(max_length=100)
    activated = models.IntegerField()
    accepted = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'users'


class Statusinfo(models.Model):
    solution_id = models.AutoField(primary_key=True)
    problem_id = models.IntegerField()
    user_id = models.CharField(max_length=20)
    time = models.IntegerField(blank=True, null=True)
    memory = models.IntegerField(blank=True, null=True)
    in_date = models.DateTimeField(blank=True, null=True)
    language = models.IntegerField(blank=True, null=True)
    ip = models.CharField(max_length=15,blank=True, null=True)
    contest_id = models.IntegerField(blank=True, null=True)
    valid = models.IntegerField(blank=True, null=True)
    num = models.IntegerField(blank=True, null=True)
    code_length = models.IntegerField(blank=True, null=True)
    judgetime = models.DateTimeField(blank=True, null=True)
    status_id = models.IntegerField(blank=True, null=True)
    status = models.CharField(max_length=45, blank=True, null=True)
    language_name = models.CharField(max_length=45, blank=True, null=True)
    is_sim = models.IntegerField(blank=True, null=False)
    # sim_s_id = models.IntegerField(blank=True, null=True)
    # sim = models.IntegerField(blank=True, null=True)

    class Meta:
        db_table = 'statusinfo'


class Contestinfo(models.Model):
    privilege = models.CharField(max_length=45, blank=True, null=True)
    contest_id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=255, blank=True, null=True)
    start_time = models.DateTimeField(blank=True, null=True)
    end_time = models.DateTimeField(blank=True, null=True)
    defunct = models.CharField(max_length=1)
    points = models.TextField(blank=True, null=True)
    langmask = models.IntegerField()
    contest_mode = models.IntegerField()
    language=models.CharField(max_length=45, blank=True, null=True)
    class Meta:
        db_table = 'contestinfo'


class Archive(models.Model):
    user_id = models.CharField(max_length=20)
    problem_id = models.IntegerField()
    solution_id = models.AutoField(primary_key=True)
    language_ext = models.CharField(max_length=45, blank=True, null=True)
    result = models.CharField(max_length=45, blank=True, null=True)
    code = models.TextField()
    class Meta:
        db_table = 'archive'


class ClassInfo(models.Model):
    class_id = models.IntegerField(primary_key=True)
    class_num = models.CharField(max_length=20)
    major = models.CharField(max_length=100)
    grade = models.IntegerField()
    class Meta:
        db_table = 'class_info'