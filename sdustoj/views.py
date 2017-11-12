# coding=utf-8
import codecs
import logging

import sys
from json.decoder import JSONObject
from rexec import FileWrapper

import select
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render_to_response, RequestContext
from django.template.context_processors import csrf
from django.views.decorators.csrf import csrf_protect, csrf_exempt
from django.core.paginator import Paginator
from django.utils import timezone
from django.forms.models import model_to_dict
from sdustoj.models import *
import operator
import time
import json
import config
import os
import re
import datetime
from django.core import serializers
import shutil
from DjangoCaptcha import Captcha
from django.utils.timezone import utc
from django.utils.timezone import local
import operator
from django.http import StreamingHttpResponse
from django.core import serializers

reload(sys)
sys.setdefaultencoding('utf-8')

'''
this is the views file
deal the page data
'''
__author__ = 'Lonely'

'''
The User Power level
A : Super Administator
B : General Administrator
C : General User
'''
powers = ['A', 'B', 'C']
'''
The System resered words!
must not use these words!
'''
reserved = ['null']
'''
The Contest Problem Limit By 24;
If you want to add contest problem max num,
Please Modify problem_index with yourself!
'''
problem_index = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
                 'U', 'V', 'W', 'X', 'Y', 'Z']

'''
Use in administrator termial
Check the user wheather login or not,
if not will return to admin login page!
'''


def admin_control(request):
    c = RequestContext(request)
    uname = ''
    power = ''
    if 'uname' in request.COOKIES:
        uname = request.COOKIES.get('uname')
    if 'power' in request.COOKIES:
        power = request.COOKIES.get('power')
    if power == 'A' or power == 'B':
        return HttpResponseRedirect(request.path, c)
    else:
        return HttpResponseRedirect('login', c)


'''
Deal General user login in system,
check user login info,ip just so so.
'''


def signin(request, user=None, p=""):
    ca = Captcha(request)
    c = RequestContext(request)
    code = ''
    u = ''
    ip = request.META.get('REMOTE_ADDR', None)
    if 'uname' in request.POST:
        u = request.POST.get('uname')
    else:
        return render_to_response('Sign/signin.html', c)
    if 'pw' in request.POST:
        p = request.POST.get('pw')
    if 'code' in request.POST:
        code = request.POST.get('code')
        if not ca.validate(code):
            return render_to_response('Sign/signin.html', {'error': 'verifyerror'}, c)
    else:
        return render_to_response('Sign/signin.html', c)
    try:
        user = Users.objects.get(user_id=str(u))
    except Users.DoesNotExist:
        return render_to_response('Sign/signin.html', {'error': 'usererror'}, c)
    if p != "" and str(p) == str(user.password) and len(p) > 0:
        result = 'true'
    else:
        result = 'false'
    if result == 'true':
        log = Loginlog(user_id=u, ip=ip, password=p, time=time.strftime('%Y-%m-%d %H:%M:%S', time.localtime()))
        log.save()
        response = HttpResponseRedirect('index', c)
        response.set_cookie('uname', u, 3600)
        response.set_cookie('power', user.defunct, 3600)
        return response
    else:
        return render_to_response('Sign/signin.html', {'error': 'pwderror'}, c)


'''
Render the index page
'''


def index(request):
    c = RequestContext(request)
    return render_to_response('index/index.html', c)


'''
Deal user page
'''


def user(request):
    c = RequestContext(request)
    userid = ''
    login = False
    if 'uname' in request.GET:
        userid = request.GET.get('uname')
    if 'uname' in request.COOKIES:
        if userid == request.COOKIES['uname']:
            login = True
    user = Users.objects.filter(user_id=userid)[0]
    problemlist = Statusinfo.objects.filter(user_id=userid, status='Accepted').values('problem_id').distinct().order_by(
        'problem_id')
    print problemlist
    solve = len(problemlist)  # raise an error
    submit = len(Statusinfo.objects.filter(user_id=userid))
    ac = len(Statusinfo.objects.filter(user_id=userid, status='Accepted'))
    pe = len(Statusinfo.objects.filter(user_id=userid, status='Presentation Error'))
    wa = len(Statusinfo.objects.filter(user_id=userid, status='Wrong Answer'))
    tle = len(Statusinfo.objects.filter(user_id=userid, status='Time Limit Exceeded'))
    mle = len(Statusinfo.objects.filter(user_id=userid, status='Memory Limit Exceeded'))
    ole = len(Statusinfo.objects.filter(user_id=userid, status='Output Limit Exceeded'))
    re = len(Statusinfo.objects.filter(user_id=userid, status='Runtime Error'))
    ce = len(Statusinfo.objects.filter(user_id=userid, status='Compile Error'))
    return render_to_response('user/user.html',
                              {'user': user, 'submit': submit, 'ac': ac, 'pe': pe, 'wa': wa, 'tle': tle, 'mle': mle,
                               'ole': ole, 're': re, 'ce': ce, 'solve': solve, 'problemlist': problemlist,
                               'login': login}, c)


'''
Render  the useredit pagr and deal modify user info
'''


def useredit(request):
    c = RequestContext(request)
    userid = ''
    user = ''
    if 'uname' in request.COOKIES:
        userid = request.COOKIES['uname']
        user = Users.objects.filter(user_id=userid)[0]
    if 'uname' in request.POST:
        pwd = request.POST.get('pwd')
        rpwd = request.POST.get('rpwd')
        if pwd != rpwd:
            return render_to_response('user/useredit.html', {'user': user, 'result': 'pwderror'}, c)
        nick = request.POST.get('nick')
        email = request.POST.get('email')
        user.password = pwd
        user.nick = nick
        user.email = email
        user.save()
        return HttpResponse('index')
    return render_to_response('user/useredit.html', {'user': user}, c)


'''
Render problem page,
it can base on jump from page(contest or not),
dispaly the different info
'''


def problem(request):
    c = RequestContext(request)
    islogin = False
    uname = ''
    language_id = 100
    contestid = -1
    if 'uname' in request.COOKIES:
        uname = request.COOKIES.get('uname')
    if uname != '':
        islogin = True

    pid = request.GET.get('id')
    if 'contestid' in request.GET:
        contestid = request.GET.get('contestid')
    if 'l_id' in request.GET:
        language_id = request.GET.get('l_id')
    problem = Problem.objects.filter(problem_id=pid)
    return render_to_response('problemset/problem.html',
                              {'problem': problem[0], 'islogin': islogin, 'contestid': contestid,
                               'language_id': language_id}, c)


'''
Rennder the problemset page
'''


def problemset(request):
    c = RequestContext(request)
    page_num = 1
    if 'page_num' in request.GET:
        page_num = request.GET.get('page_num')
    problemlist = Problem.objects.all().order_by('problem_id')
    p = Paginator(problemlist, config.page_count)
    page = p.page_range
    if len(page) == 0:
        page = [1]
    problemlist = p.page(page_num).object_list
    cur_page = page_num
    return render_to_response('problemset/problemset.html',
                              {'problemlist': problemlist, 'page': page, 'cur_page': cur_page}, c)


def problemstatistics(request):
    c = RequestContext(request)
    p_id = ''
    count_info = []
    problem_info = []

    if 'p_id' in request.GET:
        p_id = request.GET.get('p_id')
    if p_id != '' and p_id is not None:
        # lang_c = Statusinfo.objects.filter(problem_id=p_id, language_name='C').count()
        # lang_cpp = Statusinfo.objects.filter(problem_id=p_id, language_name='C++').count()
        # lang_java = Statusinfo.objects.filter(problem_id=p_id, language_name='Java').count()

        # get all data needed
        count_info = Statusinfo.objects.filter(problem_id=p_id).extra(
            select={
                'C': "count(case when language_name='C' then language_name end)",
                'CPP': "count(case when language_name='C++' then language_name end)",
                'Java': "count(case when language_name='Java' then language_name end)",
                'AC': "count(case when status='Accepted' then status end)",
                'WA': "count(case when status='Wrong Answer' then status end)",
                'Waiting': "count(case when status='Waiting' then status end)",
                'TLE': "count(case when status='Time Limit Exceeded' then status end)",
                'MLE': "count(case when status='Memory Limit Exceeded' then status end)",
                'RE': "count(case when status='Runtime Error' then status end)",
                'OL': "count(case when status='Output Limit' then status end)",
                'CE': "count(case when status='Compile Error' then status end)",
                'PE': "count(case when status='Presentation Error' then status end)",
                'SE': "count(case when status='System Error' then status end)",
                'Judging': "count(case when status='Judging' then status end)",
                'sim': "count(case when is_sim=1 then is_sim end)"
            }
        ).get()
        problem_info = Problem.objects.filter(problem_id=p_id).get()
        # json_info = serializers.serialize("json", count_info)

        print count_info.problem_id
        # info = "SELECT \
        #         count(case when language_name='C' then language_name end) C, \
        #         count(case when language_name='C++' then language_name end) 'C++', \
        #         count(case when language_name='Java' then language_name end) Java, \
        #         count(case when status='Accepted' then status end) AC,\
        #         count(case when status='Wrong Answer' then status end) WA,\
        #         count(case when status='Waiting' then status end) Wainting,\
        #         count(case when status='Time Limit Exceeded' then status end) TLE,\
        #         count(case when status='Memory Limit Exceeded' then status end) MLE,\
        #         count(case when status='Runtime Error' then status end) RE,\
        #         count(case when status='Output Limit' then status end) OL,\
        #         count(case when status='Compile Error' then status end) CE,\
        #         count(case when status='Presentation Error' then status end) PE,\
        #         count(case when status='System Error' then status end) SE,\
        #         count(case when status='Judging' then status end) Judging \
        #         FROM sdustoj.statusinfo \
        #         where problem_id = " + str(p_id) + ";"

    return render_to_response('problemset/problemstatistics.html', {'count_info': count_info,
                                                                    'problem_info': problem_info}, c)


'''
Render the submit page
'''


def submit(request):
    c = RequestContext(request)
    contestid = -1
    languageid = 100
    languages = []
    if 'c_id' in request.GET:
        contestid = request.GET.get('c_id')
    if 'l_id' in request.GET:
        languageid = request.GET.get('l_id')
    problemid = request.GET.get('p_id')
    language = Language.objects.all()
    if str(languageid).isdigit() and int(languageid) != 100:
        for item in language:
            if item.language == int(languageid):
                languages.append(item)
    else:
        languages = language
    return render_to_response('problemset/submit.html',
                              {'problemid': problemid, 'language': languages, 'contestid': contestid}, c)


'''
Render the faq page
'''


def faq(request):
    c = RequestContext(request)
    return render_to_response('FAQ/faq.html', c)


'''
Render the about page
'''


def about(request):
    c = RequestContext(request)
    return render_to_response('Other/about.html', c)


'''
Render the sign page
'''


def sign(request):
    c = RequestContext(request)
    return render_to_response('Sign/sign.html', c)


'''
Render the registe data
'''


def signup(request):
    c = RequestContext(request)
    if 'uname' not in request.POST:
        return render_to_response("Sign/signup.html", c)
    ca = Captcha(request)
    if 'code' in request.POST:
        code = request.POST.get('code')
        if not ca.validate(code):
            return render_to_response("Sign/signup.html", {'error': 4}, c)
    else:
        return render_to_response("Sign/signup.html", c)
    uname = request.POST.get('uname')
    pwd = request.POST.get('pwd')
    rpwd = request.POST.get('rpwd')
    email = request.POST.get('email')
    validate = request.POST.get('validate')
    nick = request.POST.get('nick')
    ip = request.META.get('REMOTE_ADDR', None)
    if uname == '' or pwd == '' or nick == '':
        return render_to_response("Sign/signup.html", {'error': 2}, c)
    if pwd == rpwd:
        c_u = Users.objects.filter(user_id=uname)
        if c_u:
            return render_to_response("Sign/signup.html", {'error': 3}, c)
        u = Users(defunct='C', nick=nick, user_id=uname, password=pwd, email=email, volume=str(555), language=str(555),
                  ip=str(ip), activated=str(555), submit=0, solved=0)
        u.save()
        return HttpResponseRedirect('index')
    elif pwd != '' and rpwd != '':
        return render_to_response("Sign/signup.html", {'error': 1}, c)
    else:
        return render_to_response("Sign/signup.html", c)


'''
render the status page
'''


def status(request):
    c = RequestContext(request)
    page_num = 1
    contest_id = -1
    ifcontest = 'False'
    # sim_set = None
    problem_id = ''
    user_id = ''
    result = ''
    language = ''
    uname = ''
    power = ''

    if 'uname' in request.COOKIES:
        uname = request.COOKIES.get('uname')
    if 'power' in request.COOKIES:
        power = request.COOKIES.get('power')

    if 'page_num' in request.GET:
        page_num = int(request.GET.get('page_num'))
    if 'op' in request.GET:
        op = request.GET.get('op')
        if 'add' in str(op):
            page_num = page_num + 1
        if 'sub' in str(op) and page_num > 1:
            page_num = page_num - 1

    # 添加搜索功能
    statusinfo = Statusinfo.objects.all().order_by('-solution_id')
    if 'problem_id' in request.GET \
            and request.GET.get('problem_id') != '' \
            and request.GET.get('problem_id') is not None:
        problem_id = int(request.GET.get('problem_id'))
        statusinfo = statusinfo.filter(problem_id=problem_id)
    if 'user_id' in request.GET \
            and request.GET.get('user_id') != '' \
            and request.GET.get('user_id') is not None:
        user_id = request.GET.get('user_id')
        statusinfo = statusinfo.filter(user_id=user_id)
    if 'result' in request.GET \
            and request.GET.get('result') != '' \
            and request.GET.get('result') is not None \
            and request.GET.get('result') != 'all':
        result = int(request.GET.get('result'))
        statusinfo = statusinfo.filter(status_id=result)
    if 'language' in request.GET \
            and request.GET.get('language') != '' \
            and request.GET.get('language') is not None \
            and request.GET.get('language') != 'all':
        language = int(request.GET.get('language'))
        statusinfo = statusinfo.filter(language=language)
    # select.option中的下拉列表值
    language_set = Language.objects.all()
    print language_set
    result_set = Status.objects.values('status_id', 'result_id', 'status')
    print result_set

    # print statusinfo.values('solution_id', 'is_sim')

    if 'c_id' in request.GET:
        contest_id = request.GET.get('c_id')
        if str(contest_id).isdigit() and int(contest_id) != -1 and contest_id != None and contest_id != 'None':
            ifcontest = 'True'
            statusinfo = statusinfo.filter(contest_id=contest_id).order_by('-solution_id').values(
                'status', 'status_id', 'problem_id', 'contest_id', 'solution_id', 'user_id', 'memory', 'time',
                'in_date', 'language',
                'code_length', 'judgetime', 'valid', 'num', 'language_name', 'ip', 'is_sim')
            for item in statusinfo:
                item['ifcontest'] = 'True'
                problem_num = problem_index[
                    ContestProblem.objects.get(contest_id=contest_id, problem_id=item['problem_id']).num]
                item['problem_num'] = problem_num
    # # 如果设置为检查相似度
    # if config.sim_enable is True:
    #     sim_set = Sim.objects.all().order_by('-s_id')

    p = Paginator(statusinfo, config.page_count)
    page = p.page_range  # <==>if it has 10 pages,and the Paginator.page_range = [1,2,3,4,5,6,7,8,9,10]
    if len(page) == 0:
        page_num = 1
    elif len(page) < page_num:
        page_num = page[-1]  # <==>if it has 5 pages,and the Paginator.page_range = [1,2,3,4,5], page[-1]=5
    statusinfo = p.page(page_num).object_list
    return render_to_response('Status/status.html',
                              {'statusinfo': statusinfo, 'result_set': result_set, 'language_set': language_set,
                               'problem_id': problem_id, 'user_id': user_id, 'result': result, 'language': language,
                               'cur_page': page_num, 'ifcontest': ifcontest, 'c_id': contest_id,
                               'ifsim': config.sim_enable}, c)


'''
render the contest page
'''


def contest(request):
    c = RequestContext(request)
    uname = ''
    power = ''
    if 'uname' in request.COOKIES:
        uname = request.COOKIES.get('uname')
    if 'uname' in request.COOKIES:
        power = request.COOKIES.get('power')
    contestid = request.GET.get('id')
    problem_list = ContestProblem.objects.filter(contest_id=contestid).order_by('num', 'problem_id').values(
        'contest_id', 'id', 'problem_id', 'title', 'num')
    for item in problem_list:
        item['num'] = problem_index[item['num']]
        status = Statusinfo.objects.filter(user_id=uname, problem_id=item['problem_id'], contest_id=contestid,
                                           status='Accepted')
        if len(status) > 0:
            item['status'] = 'Y'
        else:
            item['status'] = 'N'
    contest = Contestinfo.objects.get(contest_id=contestid)
    cur_time = time.strftime('%Y-%m-%d %H:%M %p', time.localtime())
    if contest.privilege == 'Private' and power != 'A':
        users = ContestUsers.objects.filter(contest_id=contestid, user_id=uname)
        if len(users) <= 0:
            return render_to_response('error/errorinfo.html', {'error': 'contestprivilegeerror'}, c)
    c_time = int(time.mktime(datetime.datetime.utcnow().timetuple()))
    s_time = int(time.mktime(contest.start_time.timetuple()))
    e_time = int(time.mktime(contest.end_time.timetuple()))
    if c_time < s_time:
        return render_to_response('error/errorinfo.html', {'error': 'conteststarterror'}, c)
    if c_time > e_time:
        return render_to_response('error/errorinfo.html', {'error': 'contestfinisherror'}, c)

    return render_to_response('contest/contest.html',
                              {'problemlist': problem_list, 'contest': contest, 'cur_time': cur_time}, c)


'''
render the contest list page
control the contest page jump
'''


def contestlist(request):
    c = RequestContext(request)
    page_num = 1
    if 'page_num' in request.GET:
        page_num = request.GET.get('page_num')
        if page_num <= 0:
            page_num = 1
    contestlist = Contestinfo.objects.all().order_by('-contest_id').values('contest_id', 'title', 'start_time',
                                                                           'end_time', 'defunct', 'points', 'privilege',
                                                                           'language')
    for item in contestlist:
        cur_time = int(time.mktime(time.gmtime()))
        s_time = int(time.mktime(item['start_time'].timetuple()))
        e_time = int(time.mktime(item['end_time'].timetuple()))
        if cur_time < s_time:
            status = 'Wating...'
        elif cur_time > e_time:
            status = 'Finished'
        elif cur_time >= s_time and cur_time <= e_time:
            status = 'Running'
        item['status'] = status
    p = Paginator(contestlist, config.page_count)
    contestlist = p.page(page_num).object_list
    page = p.page_range
    if len(page) <= 0:
        page = [1]
    return render_to_response('contest/contestlist.html',
                              {'contestlist': contestlist, 'page': page, 'cur_page': page_num}, c)


'''
Render the ranklistpage
deal user data to hava user rank
'''


def ranklist(request):
    c = RequestContext(request)
    page_num = 1
    if 'page_num' in request.GET:
        page_num = int(request.GET.get('page_num'))
    if 'op' in request.GET:
        op = request.GET.get('op')
        if 'add' in str(op):
            page_num = page_num + 1
        if 'sub' in str(op) and page_num > 1:
            page_num = page_num - 1
    users = list(Users.objects.all().values('nick', 'user_id'))
    for user in users:
        user_id = user['user_id']
        user['ac'] = ac = int(Users.objects.get(user_id=user_id).accepted)
        user['sub'] = sub = int(Users.objects.get(user_id=user_id).submit)
        try:
            user['rate'] = rate = str(round(ac * 100.0 / sub, 2)) + '%'
        except:
            user['rate'] = '0.0%'
    users.sort(key=operator.itemgetter('ac'), reverse=True)
    count = 1
    for user in users:
        user['index'] = count
        count += 1
    p = Paginator(users, config.page_count)
    page = p.page_range
    if len(page) == 0:
        page_num = 1
    elif len(page) < page_num:
        page_num = page[-1]
    users = p.page(page_num).object_list
    return render_to_response('ranklist/ranklist.html', {'users': users, 'cur_page': page_num}, c)


def webboard(request):
    c = RequestContext(request)
    return render_to_response('webboard/webboard.html', c)


'''
render the board page
'''


def board(request):
    c = RequestContext(request)
    contest_id = -1
    if 'c_id' in request.GET:
        contest_id = request.GET.get('c_id')
        if contest_id.isdigit():
            contest_id = int(contest_id)
    c_problems = ContestProblem.objects.filter(contest_id=contest_id)
    problem_size = len(c_problems)
    c_users = ContestUsers.objects.filter(contest_id=contest_id).values('user_id').distinct()
    user_size = len(c_users)
    result = []
    names = []
    for k in range(problem_size):
        names.append(problem_index[k])
    for i in range(user_size):
        result.append({})
        result[i]['user_id'] = u = c_users[i]['user_id']
        result[i]['ac_size'] = len(
            Statusinfo.objects.filter(user_id=u, contest_id=contest_id, status='Accepted').values(
                'problem_id').distinct())
        result[i]['judge'] = []
        for j in range(problem_size):
            result[i]['judge'].append({})
            result[i]['judge'][j]['ac'] = 'False'
            result[i]['judge'][j]['sub'] = 0
            p = ContestProblem.objects.get(contest_id=contest_id, num=j)
            p_id = p.problem_id
            p_sub = Statusinfo.objects.filter(contest_id=contest_id, problem_id=p_id, user_id=u)
            p_ac = Statusinfo.objects.filter(contest_id=contest_id, problem_id=p_id, status='Accepted', user_id=u)
            result[i]['judge'][j]['sub'] = len(p_sub)
            if len(p_sub) <= 0:
                result[i]['judge'][j]['ac'] = 'None'
            if len(p_ac) > 0:
                result[i]['judge'][j]['ac'] = 'True'
    result.sort(key=operator.itemgetter('ac_size'), reverse=True)
    # result.sort(key=lambda x,y:cmp(x['ac_size'],y['ac_size']))
    return render_to_response('board/board.html', {'result': result, 'names': names}, c)


'''
render the admin page
* this page is not be used
'''


def admin(request):
    c = RequestContext(request)
    return render_to_response('admin/admin.html', c)


'''
Deal the submit source data
'''


def sub_source(request):
    c = RequestContext(request)
    ip = request.META.get('REMOTE_ADDR', None)
    username = ''
    if 'uname' in request.COOKIES:
        username = request.COOKIES['uname']
    contestid = request.POST.get('c_id')
    problemid = request.POST.get('p_id')
    languageid = request.POST.get('language')
    source = request.POST.get('source')
    if contestid == None or contestid == '' or contestid == 'None':
        contestid = -1
    if problemid == None or problemid == '' or problemid == 'None':
        problemid = -1
    s = Solution(ip=str(ip), problem_id=int(problemid), user_id=username, contest_id=int(contestid),
                 language=int(languageid),
                 result=0, code_length=len(source), time=0, memory=0,
                 in_date=time.strftime('%Y-%m-%d %H:%M:%S', time.localtime()))
    s.save()
    s = s.solution_id
    sou = SourceCode(solution_id=s, source=source)
    sou.save()
    problem = Problem.objects.get(problem_id=problemid)
    problem.submit += 1
    problem.save()
    user = Users.objects.get(user_id=username)
    user.submit = user.submit + 1
    user.save()
    return HttpResponseRedirect('status?c_id=' + str(contestid), c)


'''
Render the admin login page
'''


def admin_login(request):
    c = RequestContext(request)
    user_name = ''
    ca = Captcha(request)
    pwd = ''
    ip = request.META.get('REMOTE_ADDR', None)
    if 'user_name' in request.POST:
        user_name = request.POST.get('user_name')
    else:
        return render_to_response("admin/login.html", c)
    if 'code' in request.POST:
        code = request.POST.get('code')
        if not ca.validate(code):
            return render_to_response('admin/login.html', {'verify_error': True}, c)
    if 'password' in request.POST:
        pwd = request.POST.get('password')
    if user_name != '':
        try:
            user = Users.objects.get(user_id=user_name)
            if str(user.password) == pwd:
                if user.defunct != 'C':
                    log = Loginlog(user_id=user_name, password=pwd, ip=ip,
                                   time=time.strftime('%Y-%m-%d %H:%M:%S', time.localtime()))
                    log.save()
                    response = HttpResponseRedirect('index?menuName=&submenuName=See%20SDUSTOJ', c)
                    response.set_cookie('uname', user_name, 3600)
                    response.set_cookie('power', user.defunct, 3600)
                    return response
                else:
                    return render_to_response('admin/login.html', {'user_error': True}, c)
            else:
                return render_to_response('admin/login.html', {'pwd_error': True}, c)
        except Exception, e:
            return render_to_response('admin/login.html', {'user_error': True}, c)
    else:
        return render_to_response('admin/login.html', {'user_error': True}, c)


'''
Render the admin index page
'''


def admin_index(request):
    return render_to_response('admin/index.html')


'''
render the admin add problem page
'''


def admin_addproblem(request):
    return render_to_response('admin/addproblem.html')


'''
deal the admin add problem data
'''


def admin_addproblem_save(request):
    c = RequestContext(request)
    title = request.POST.get('title')
    timelimit = request.POST.get('timelimit')
    memlimit = request.POST.get('memlimit')
    descripe = request.POST.get('descripe')
    input = request.POST.get('input')
    output = request.POST.get('output')
    sampleinput = request.POST.get('sampleinput')
    sampleoutput = request.POST.get('sampleoutput')
    hint = request.POST.get('hint')
    try:
        problem = Problem(in_date=time.strftime('%Y-%m-%d %H:%M:%S', time.localtime()), accepted=0, submit=0, solved=0,
                          time_limit=timelimit, sample_output=sampleoutput, sample_input=sampleinput, title=title,
                          memory_limit=memlimit, input=input, output=output, description=descripe, hint=hint)
        problem.save()

    except:
        return HttpResponse("failure", c)
    return HttpResponse("success", c)


'''
render admin add contest page
'''


def admin_addcontest(request):
    language = Language.objects.all()
    privilege = ContestPrivilege.objects.all();
    return render_to_response("admin/addcontest.html", {'language': language, 'privilege': privilege})


'''
deal admin add contest data
'''


def admin_addcontest_save(request):
    c = RequestContext(request)
    flag = True
    title = request.POST.get('title')
    starttime = request.POST.get('starttime')
    endtime = request.POST.get('endtime')
    contest_private = request.POST.get('contest_private')
    language = request.POST.get('language')
    problems = request.POST.get('problems')
    users = request.POST.get('users')
    c = Contest(defunct='C', title=title,
                start_time=datetime.datetime.strptime(starttime, '%Y-%m-%d %H:%M:%S'),
                end_time=datetime.datetime.strptime(endtime, '%Y-%m-%d %H:%M:%S'),
                private=int(contest_private), langmask=int(language))
    c.save()
    contestid = c.contest_id
    index = 0
    for problem in re.split(';|,', str(problems)):
        try:
            if problem != '':
                item = Problem.objects.get(problem_id=problem)
                cp = ContestProblem(contest_id=contestid, title=item.title, problem_id=item.problem_id, num=index)
                index += 1
                cp.save()
        except Exception, e:
            flag = False
    for user in re.split(';|,', str(users)):
        try:
            if user != '':
                item = Users.objects.get(user_id=user)
                cu = ContestUsers(user_id=user, contest_id=contestid, num=0)
                cu.save()
        except Exception, e:
            flag = False
    if flag == True:
        return HttpResponse("success", c)
    return HttpResponse("error", c)


'''
deal comile error data
jump to compile error page
'''


def compileerror(request):
    c = RequestContext(request)
    solution_id = ''
    if 'solution_id' in request.GET:
        solution_id = request.GET.get('solution_id')
    compileinfo = Compileinfo.objects.get(solution_id=solution_id)
    return render_to_response('error/errorinfo.html', {'error': 'compileerror', 'compileerror': compileinfo.error}, c)


'''
render the admin problem list page
'''


def admin_problemlist(request):
    c = RequestContext(request)
    page_num = 1
    if 'page_num' in request.GET:
        page_num = int(request.GET.get('page_num'))
    if 'op' in request.GET:
        op = request.GET.get('op')
        if 'add' in str(op):
            page_num = page_num + 1
        if 'sub' in str(op) and page_num > 1:
            page_num = page_num - 1
    problems = Problem.objects.all().order_by('problem_id')
    p = Paginator(problems, config.admin_page_cuont)
    page = p.page_range
    if len(page) == 0:
        page_num = 1
    elif len(page) < page_num:
        page_num = page[-1]
    problems = p.page(page_num).object_list
    return render_to_response('admin/problemlist.html',
                              {'problems': problems, 'cur_page': page_num, 'totalpage': page[-1]}, c)


'''
render the add problem file page
'''


def admin_addproblemfile(request):
    c = RequestContext(request)
    problems = Problem.objects.all()
    return render_to_response('admin/addproblemfile.html', {'problems': problems}, c)


'''
deal the add problem file data
'''


def admin_addproblemfile_save(request):
    c = RequestContext(request)
    files = request.FILES.getlist('files')
    problem_id = request.POST.get('problem_id')
    data_path = config.data_dir + '/' + str(problem_id)
    problem = Problem.objects.filter(problem_id=problem_id)
    if len(problem) > 0:
        try:
            if not os.path.exists(data_path):
                os.mkdir(data_path)
            else:
                shutil.rmtree(data_path)  # <==>删除目录(!!!之前的文件会被删除)
                os.mkdir(data_path)  # <==>重建目录
            for f in files:
                destination = open(data_path + '/' + f.name, 'wb+')
                for chunk in f.chunks():
                    destination.write(chunk)
                destination.close()
            problem = problem[0]
            problem.fileupload = 'Y'
            problem.save()
            return render_to_response('admin/addproblemfile.html', {'result': 'success'}, c)
        except:
            return render_to_response('admin/addproblemfile.html', {'result': 'failure'}, c)
    return render_to_response('admin/addproblemfile.html', {'result': 'failure'}, c)


'''
render the contest list page
'''


def admin_contestlist(request):
    c = RequestContext(request)
    page_num = 1
    if 'page_num' in request.GET:
        page_num = int(request.GET.get('page_num'))
    if 'op' in request.GET:
        op = request.GET.get('op')
        if 'add' in str(op):
            page_num = page_num + 1
        if 'sub' in str(op) and page_num > 1:
            page_num = page_num - 1
    contests = Contestinfo.objects.all().order_by('-contest_id')
    p = Paginator(contests, config.admin_page_cuont)
    page = p.page_range
    if len(page) == 0:
        page_num = 1
    elif len(page) < page_num:
        page_num = page[-1]
    contests = p.page(page_num).object_list
    return render_to_response('admin/admin_contestlist.html',
                              {'contests': contests, 'cur_page': page_num, 'totalpage': page[-1]}, c)


'''
render the news list page
'''


def admin_newslist(request):
    c = RequestContext(request)
    page_num = 1
    if 'page_num' in request.GET:
        page_num = int(request.GET.get('page_num'))
    if 'op' in request.GET:
        op = request.GET.get('op')
        if 'add' in str(op):
            page_num = page_num + 1
        if 'sub' in str(op) and page_num > 1:
            page_num = page_num - 1
    news = News.objects.all().order_by('-news_id')
    p = Paginator(news, config.admin_page_cuont)
    page = p.page_range
    if len(page) == 0:
        page_num = 1
    elif len(page) < page_num:
        page_num = page[-1]
    news = p.page(page_num).object_list
    return render_to_response('admin/newslist.html', {'news': news, 'cur_page': page_num, 'totalpage': page[-1]}, c)


'''
render the admin add user page
'''


def admin_adduser(request):
    c = RequestContext(request)
    return render_to_response('admin/adduser.html', c)


'''
render the admin add news page
'''


def admin_addnews(request):
    c = RequestContext(request)
    return render_to_response('admin/addnews.html', c)


'''
deal the news data
'''


def admin_dealnews(request):
    c = RequestContext(request)
    op = request.POST.get('op')
    news_id = request.POST.get('news_id')
    if op == 'del':
        try:
            news = News.objects.get(news_id=news_id)
            news.delete()
        except Exception, e:
            return HttpResponse('failure', c)
    if op == 'release':
        release = request.POST.get('release')
        try:
            news = News.objects.get(news_id=news_id)
            news.release = int(release)
            news.save()
        except Exception, e:
            return HttpResponse('failure', c)
    return HttpResponse('success', c)


'''
render the admin add news page
'''


def admin_addnews_save(request):
    c = RequestContext(request)
    type = ''
    release = ''
    content = ''
    author = ''
    if 'type' in request.POST:
        type = request.POST.get('type')
    if 'type' in request.POST:
        release = request.POST.get('release')
    if 'type' in request.POST:
        content = request.POST.get('content')
    if 'uname' in request.COOKIES:
        author = request.COOKIES.get('uname')
    try:
        news = News(type=type, release=release, comment=content, author=author,
                    time=time.strftime('%Y-%m-%d %H:%M:%S', time.localtime()))
        news.save()
        return HttpResponse('success', c)
    except Exception, e:
        return HttpResponse('failure', c)


'''
deal admin get news port
'''


def admin_getnews(request):
    c = RequestContext(request)
    type = request.POST.get('type')
    if int(type) == 0:
        news = News.objects.filter(type=0, release=1)
        str = "["
        for item in news:
            str += '{\"content\":\"' + item.comment + '\"},'
        if len(str) <= 1:
            str = str + ']'
        else:
            str = str[0:-1] + ']'
        return HttpResponse(str, c)
    if int(type) == 1:
        news = News.objects.filter(type=1, release=1)
        str = "["
        for item in news:
            str += '{\"content\":\"' + item.comment + '\"},'

        if len(str) <= 1:
            str = str + ']'
        else:
            str = str[0:-1] + ']'
        return HttpResponse(str, c)


'''
render the admin user list
'''


def admin_userlist(request):
    c = RequestContext(request)
    page_num = 1
    if 'page_num' in request.GET:
        page_num = int(request.GET.get('page_num'))
    if 'op' in request.GET:
        op = request.GET.get('op')
        if 'add' in str(op):
            page_num = page_num + 1
        if 'sub' in str(op) and page_num > 1:
            page_num = page_num - 1
    users = Users.objects.all().order_by('reg_time')
    p = Paginator(users, config.admin_page_cuont)
    page = p.page_range
    if len(page) == 0:
        page_num = 1
    elif len(page) < page_num:
        page_num = page[-1]
    users = p.page(page_num).object_list
    return render_to_response('admin/userlist.html', {'users': users, 'cur_page': page_num, 'totalpage': page[-1]}, c)


'''
render the admin teaching
'''


def admin_teaching(request):
    c = RequestContext(request)

    return render_to_response('admin/teaching.html', {}, c)


# ---------------
'''
deal with login out port
clear up login data
'''


def loginout(request):
    response = HttpResponseRedirect('index')
    response.delete_cookie("uname", path="/")
    response.delete_cookie("username", path="/")
    response.delete_cookie("power", path="/")
    return response


# -------------JSON
'''
use with status page
return the user's code info
response json
'''


def getcodeinfo(request):
    c = RequestContext(request)
    solution_id = -1
    if 's_id' in request.POST:
        solution_id = request.POST.get('s_id')
    try:
        code = SourceCode.objects.get(solution_id=int(solution_id))
        code = str(code.source)
        code = re.sub("[\\\]", '\\\\', code)
        code = re.sub('\"', '\\"', code)
        code = re.sub('[<]', '&lt;', code)
        code = re.sub('[>]', '&gt;', code)
        code = re.sub('[\r\n]', '<p>', code)
        code = re.sub('[\t]', '    ', code)
        json_data = '{\"source\":\"' + code + '\"}';
        return HttpResponse(json_data, c)
    except Exception, e:
        solution_id = -1
        return HttpResponse("{}", c)


'''
Administrator termial.
Deal contestlist,problemlist,userlist
the delete function of these page
'''


def admin_deal_data(request):
    c = RequestContext(request)
    type = request.POST.get('type')
    if type == 'problem':
        try:
            problem_id = request.POST.get('p_id')
            ppath = config.data_dir + "/" + problem_id
            if os.path.exists(ppath):
                shutil.rmtree(ppath)
            problem = Problem.objects.get(problem_id=problem_id)
            problem.delete()
        except Exception, e:
            return HttpResponse("{\"result\":\"failure\"}", c)
    elif type == 'contest':
        try:
            contest_id = request.POST.get('c_id')
            contest = Contest.objects.get(contest_id=contest_id)
            contest.delete()
        except Exception, e:
            return HttpResponse("{\"result\":\"failure\"}", c)
    elif type == 'user':
        try:
            user_id = request.POST.get('u_id')
            user = Users.objects.get(user_id=user_id)
            user.delete()
        except Exception, e:
            return HttpResponse("{\"result\":\"failure\"}", c)
    return HttpResponse("{\"result\":\"success\"}", c)


'''
use of
Modify userinfo
response json
'''


def admin_dealuser(request):
    c = RequestContext(request)
    pwd = request.POST.get('pwd')
    uname = request.POST.get('uname')
    power = request.POST.get('power')
    try:
        user = Users.objects.get(user_id=uname)
        if pwd not in reserved:
            user.password = pwd
        if power in powers:
            user.defunct = power
        user.save()
    except Exception, e:
        return HttpResponse("{\"result\":\"failure\"}", c)
    return HttpResponse("{\"result\":\"success\"}", c)


'''
use of administrator termial
Render the userloginlog page
'''


def admin_userloginlog(request):
    c = RequestContext(request)
    page_num = 1
    if 'page_num' in request.GET:
        page_num = int(request.GET.get('page_num'))
    if 'op' in request.GET:
        op = request.GET.get('op')
        if 'add' in str(op):
            page_num = page_num + 1
        if 'sub' in str(op) and page_num > 1:
            page_num = page_num - 1
    userlog = Loginlog.objects.all().order_by('-time')
    p = Paginator(userlog, config.admin_page_cuont)
    page = p.page_range
    if len(page) == 0:
        page_num = 1
    elif len(page) < page_num:
        page_num = page[-1]
    users = p.page(page_num).object_list
    return render_to_response('admin/userloginlog.html',
                              {'userlog': users, 'cur_page': page_num,
                               'totalpage': page[-1], 'total': len(userlog)}, c)


'''
deal edit problem data
'''


def admin_editproblem(request):
    c = RequestContext(request)
    type = ''
    problem_id = -1
    if 'type' in request.POST:
        type = request.POST.get('type')
        problem_id = request.POST.get('p_id')
    if type == 'get':
        problem = Problem.objects.get(problem_id=problem_id)
        result = {}
        result['problemid'] = problem.problem_id
        result['title'] = problem.title
        result['describe'] = problem.description
        result['input'] = problem.input
        result['output'] = problem.output
        result['sampleinput'] = problem.sample_input
        result['sampleoutput'] = problem.sample_output
        result['hint'] = problem.hint
        result['appendcode'] = ''
        return HttpResponse(json.dumps(result), c)
    elif type == 'save':
        try:
            problem = Problem.objects.get(problem_id=problem_id)
            problem.description = request.POST.get('describe')
            problem.input = request.POST.get('input')
            problem.output = request.POST.get('output')
            problem.sample_input = request.POST.get('sampleinput')
            problem.sample_output = request.POST.get('sampleoutput')
            problem.title = request.POST.get('title')
            problem.hint = request.POST.get('hint')
            problem.save()
        except:
            return HttpResponse("{\"result\":\"failure\"}")
    return HttpResponse("{\"result\":\"success\"}")


'''
add users accordding user file
'''


def admin_adduserfile(request):
    c = RequestContext(request)
    file = request.FILES.get('userfile')
    ip = request.META.get('REMOTE_ADDR', None)
    try:
        for line in file:
            userinfo = re.split(',|;', str(line))
            if userinfo[0] != '' and userinfo[1] != '' and userinfo[2] != '' and userinfo[3] != '':
                u = Users(defunct='C', nick=userinfo[1], user_id=userinfo[0], password=userinfo[2], email=userinfo[3],
                          volume=str(555), language=str(555), ip=str(ip), activated=str(555), submit=0, solved=0)
                u.save()
            else:
                return render_to_response('admin/adduser.html', {'result': 'failure'}, c)
    except:
        return render_to_response('admin/adduser.html', {'result': 'failure'}, c)
    return render_to_response('admin/adduser.html', {'result': 'success'}, c)


def admin_rejudge(request):
    c = RequestContext(request)
    return render_to_response('admin/rejudge.html', c)


'''
deal rejudge data
'''


def admin_rejudge_save(request):
    c = RequestContext(request)
    rejudgefrom = request.POST.get('rejudgefrom')
    rejudgeto = request.POST.get('rejudgeto')

    try:
        if rejudgefrom.isdigit() and rejudgeto.isdigit():
            problems = Solution.objects.filter(solution_id__gte=int(rejudgefrom), solution_id__lte=int(rejudgeto))
            for item in problems:
                item.result = 0
                item.save()
        else:
            return render_to_response('admin/rejudge.html', {'result': 'failure'}, c)
    except Exception, e:
        return render_to_response('admin/rejudge.html', {'result': 'failure'}, c)
    return render_to_response('admin/rejudge.html', {'result': 'success'}, c)


def sim(request):
    c = RequestContext(request)
    s_id = request.GET.get('s_id')
    sim_info = Sim.objects.filter(s_id=s_id).order_by('-sim')
    return render_to_response('Status/sim.html', {'sim_info': sim_info}, c)


def file_iterator(file_name, chunk_size=512):
    with open(file_name) as f:
        while True:
            c = f.read(chunk_size)
            if c:
                yield c
            else:
                break


'''
deal problem_file download file
'''


def download_file(request):
    p_id = request.GET['problem_id']
    fn = os.path.join(config.data_dir, p_id, '%s.pdf' % p_id)

    response = StreamingHttpResponse(file_iterator(fn))
    response['Content-Type'] = 'application/octet-stream'
    response['Content-Disposition'] = 'attachment;filename= %s.pdf' % p_id
    return response


'''
deal with the archive_file download
'''


def archive(request):
    global response
    user_id = request.GET.get('user_id')
    write_code_to_file(user_id)
    tgz_file(config.archive_dir, user_id)
    fn = os.path.join(config.archive_dir, '%s.tgz' % user_id)
    while True:
        if os.path.exists(fn):
            response = StreamingHttpResponse(file_iterator(fn))
            # 文件流写入客户端硬盘
            response['Content-Type'] = 'application/octet-stream'
            response['Content-Disposition'] = \
                'attachment;filename= %s.tgz' % user_id
            break
    return response


def write_code_to_file(user_id):
    archive_obj = Archive.objects.filter(user_id=user_id).order_by('problem_id')
    uid_path = os.path.join(config.archive_dir, user_id)
    if not os.path.exists(uid_path):
        try:
            os.mkdir(uid_path)
        except OSError as e:
            logging.error(e)
    for item in archive_obj:
        pid_path = os.path.join(uid_path, str(item.problem_id))
        if not os.path.exists(pid_path):
            os.mkdir(pid_path)
        sid_path = os.path.join(pid_path, '%s_%s.%s' % (item.solution_id, item.result, item.language_ext))
        # try:
        #     os.mkdir(sid_path)
        # except OSError as e:
        #     logging.error(e)
        try:
            f = codecs.open(sid_path, 'w')
            try:
                f.write(item.code)
            except OSError as e:
                logging.error(e)
                return False
        except OSError as e:
            logging.error(e)
            return False
    return True


def tgz_file(father_path, child_path):
    pth = os.path.join(father_path, child_path)
    tgz_pth = os.path.join(father_path, '%s.tgz' % child_path)
    try:
        os.system('tar -zcvf %s %s' % (tgz_pth, pth))
    except OSError as e:
        logging.error(e)
        return False
    return True


# def download_tgz(tgz_file):
#     try:
#         temp = open(tgz_file, "rb")
#     except IOError as e:
#         logging.error(e)
#         return HttpResponse("Open zip error")
#     wrapper = FileWrapper(temp)
#     response = HttpResponse(wrapper, content_type='application/tgz')
#     realZipfileName = os.path.split(zipfileName)[1]
#     response['Content-Encoding'] = 'utf-8'
#     response['Content-Disposition'] = 'attachment; filename=%s' % realZipfileName
#     response['Content-Length'] = temp.tell()
#     temp.seek(0)


def clean_archive_dir(user_id):
    '''清理archive目录，删除临时文件'''
    dir_name = os.path.join(config.archive_dir, str(user_id))
    shutil.rmtree(dir_name)
    tgz_name = os.path.join(config.archive_dir, "%s.tgz" % user_id)
    if os.path.exists(tgz_name):
        os.remove(tgz_name)


def teaching_relation(request):
    # Firstly, find teacher by user_id

    # username = ''
    # if 'uname' in request.COOKIES:
    #     username = request.COOKIES['uname']
    # teacher_num = Teacher.objects.filter(user_id=username).values("teacher_num")
    # teaching_relation_list = TeachingRelation.objects.filter(teacher_num=teacher_num)
    # 页面中“班级”下拉列表中的所有option
    # class_id_list = teaching_relation_list.values("class_field").distinct().order_by("class_field")
    # class_info_list = ClassInfo.objects.filter(class_id=class_id_list)
    # class_list = []
    # for class_info in class_info_list:
    #     class_name = '%s%s级%s' % (class_info.major, class_info.grade, class_info.class_num)
    #     class_list.append(class_name)

    # 页面中“学期”下拉列表中的所有option
    # semester_id_list = teaching_relation_list.values("semester").distinct().order_by("semester")
    # semester_list = Semester.objects.filter(semester_id=semester_id_list)

    # 页面中“学期”下拉列表中的所有option
    # course_code_list = teaching_relation_list.values("course_code").distinct().order_by("course_code")
    # course_list = Course.objects.filter(course_code=course_code_list)

    c = RequestContext(request)

    # 填充页面中的所有option
    academic_year_list = AcademicYear.objects.all().order_by('-academic_year_name')
    semester_list = Semester.objects.all().order_by('semester_id')
    course_list = Course.objects.all().order_by('course_code')
    grade_list = Grade.objects.all().order_by('-grade_id')
    major_list = Major.objects.all().order_by('major_code')
    class_list = Class.objects.all().order_by('class_num').distinct()

    academic_year_selected = -1
    semester_selected = -1
    course_selected = ''
    grade_selected = -1
    major_selected = ''
    class_selected = ''

    if len(academic_year_list):
        academic_year_selected = academic_year_list[0].academic_year_id
    if len(semester_list):
        semester_selected = semester_list[0].semester_id
    if len(course_list):
        course_selected = course_list[0].course_code
    if len(grade_list):
        grade_selected = grade_list[0].grade_id
    if len(major_list):
        major_selected = major_list[0].major_code
    if len(class_list):
        class_selected = class_list[0].class_num

    # if 'uname' in request.COOKIES:
    #     username = request.COOKIES['uname']
    # teacher_num = Teacher.objects.filter(user_id=username).values("teacher_num")
    # teaching_relation_list = TeachingRelation.objects.filter(teacher_num=teacher_num)

    if 'academic_year_selected' in request.GET \
            and request.GET.get('academic_year_selected') != '' \
            and request.GET.get('academic_year_selected') is not None:
        academic_year_selected = int(request.GET.get('academic_year_selected'))
    if 'semester_selected' in request.GET \
            and request.GET.get('semester_selected') != '' \
            and request.GET.get('semester_selected') is not None:
        semester_selected = int(request.GET.get('semester_selected'))
    if 'course_selected' in request.GET \
            and request.GET.get('course_selected') != '' \
            and request.GET.get('course_selected') is not None:
        course_selected = request.GET.get('course_selected')
    if 'grade_selected' in request.GET \
            and request.GET.get('grade_selected') != '' \
            and request.GET.get('grade_selected') is not None:
        grade_selected = int(request.GET.get('grade_selected'))
    if 'major_selected' in request.GET \
            and request.GET.get('major_selected') != '' \
            and request.GET.get('major_selected') is not None:
        major_selected = request.GET.get('major_selected')
    if 'class_selected' in request.GET \
            and request.GET.get('class_selected') != '' \
            and request.GET.get('class_selected') is not None:
        class_selected = request.GET.get('class_selected')

    # 首先根据学年、学期、课程筛选出符合条件的班级（class_id）
    class_id_list = TeachingRelation.objects.filter(academic_year=academic_year_selected,
                                                    semester_id=semester_selected,
                                                    course_code=course_selected).values("class_field")

    # 再根据选择的“班级（一班、二班、...，并非class_id）”、“专业”、“年级”三个条件进一步筛选出符合条件的班级
    class_id_list = Class.objects.filter(class_id=class_id_list,
                                         class_num=class_selected,
                                         major_code=major_selected,
                                         grade=grade_selected).values('class_id')

    # 根据上面筛选出的班级，获取对应班级的学生（结果为：没有和只有一个班的学生）
    student_list = Student.objects.filter(class_field=class_id_list).order_by("student_num")

    # 分页
    page_num = 1
    if 'page_num' in request.GET and request.GET.get('page_num') != '':
        page_num = int(request.GET.get('page_num'))
    if 'op' in request.GET and request.GET.get('op') != '':
        op = request.GET.get('op')
        if 'add' in str(op):
            page_num = page_num + 1
        if 'sub' in str(op) and page_num > 1:
            page_num = page_num - 1
    p = Paginator(student_list, config.admin_page_cuont)
    page = p.page_range
    if len(page) == 0:
        page_num = 1
    elif len(page) < page_num:
        page_num = page[-1]
    student_list_curr_page = p.page(page_num).object_list

    # 返回json数据
    if 'changeOption' in request.GET and request.GET.get('changeOption') == 'true':
        # ajax_val = serializers.serialize("json", student_list_curr_page)
        ajax_val = []
        for student in student_list_curr_page:
            ajax_val.append(model_to_dict(student))
        # print ajax_val
        json_data = {'academic_year_selected': academic_year_selected, 'semester_selected': semester_selected,
                     'course_selected': course_selected, 'grade_selected': grade_selected,
                     'major_selected': major_selected, 'class_selected': class_selected,
                     'student_list': ajax_val, 'student_list_size': len(student_list_curr_page),
                     'cur_page': page_num, 'totalpage': page[-1], 'total': len(student_list)}
        print json.dumps(json_data)
        return HttpResponse(json.dumps(json_data), content_type="application/json")

    return render_to_response('admin/teaching.html',
                              {'academic_year_list': academic_year_list, 'semester_list': semester_list,
                               'course_list': course_list, 'grade_list': grade_list,
                               'major_list': major_list, 'class_list': class_list,
                               'academic_year_selected': academic_year_selected, 'semester_selected': semester_selected,
                               'course_selected': course_selected, 'grade_selected': grade_selected,
                               'major_selected': major_selected, 'class_selected': class_selected,
                               'student_list': student_list_curr_page, 'student_list_size': len(student_list_curr_page),
                               'cur_page': page_num, 'totalpage': page[-1], 'total': len(student_list)}, c)


def add_student(request):
    c = RequestContext(request)
    print "111111111111111111111111111111111111"
    file = request.FILES.get('student_file')
    # ip = request.META.get('REMOTE_ADDR', None)
    try:
        for line in file:
            student_info = re.split(',|;', str(line))
            if student_info[0] != '' and student_info[1] != '' and student_info[3] != '':
                class_instance = Class.objects.get(class_id=int(student_info[3]))
                student = Student(student_num=student_info[0], student_name=student_info[1],
                                  student_email=student_info[2], class_field=class_instance, user_id=student_info[0])
                stu_user = Users(defunct='C', nick=student_info[1], user_id=student_info[0], password=student_info[0],
                                 email=student_info[2], volume=str(555), language=str(555),
                                 ip=str(request.META.get('REMOTE_ADDR', None)),
                                 activated=str(555), submit=0, solved=0,
                                 reg_time=time.strftime('%Y-%m-%d %H:%M:%S', time.localtime()), accepted=0)
                student.save()
                stu_user.save()
            else:
                return render_to_response('admin/teaching.html', {'result': 'failure'}, c)
    except Exception as e:  # 可能异常：主键冲突；主键为空；外键（班级）不存在
        print e
        return render_to_response('admin/teaching.html', {'result': 'failure'}, c)
    return render_to_response('admin/teaching.html', {'result': 'success'}, c)


# TEST!!!
@csrf_protect
def admin_test(request):
    c = RequestContext(request)
    return render_to_response('admin/test.html', c)
