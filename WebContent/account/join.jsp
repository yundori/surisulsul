<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8" />
    <title>수리술술 가입하기</title>
    <style type="text/css">
    .form-horizontal {
        border: 5px solid #d5d5d5;
        width: 500px;
        margin: auto;
        padding: 0 10px;
    }

    .form-group:after {
        content: '';
        display: block;
        float: none;
        clear: both;
    }

    .form-group {
        padding-top: 10px;
        padding-bottom: 10px;
        border-bottom: 1px dotted #eee;
    }

    .form-group:last-child {
        border-bottom: 0;
    }

    .col-md-2 {
        width: 20%;
        display: block;
        float: left;
        font-size: 14px;
        padding-top: 7px;
        text-indent: 5px;
    }

    .col-md-10 {
        width: 80%;
        display: block;
        float: left;
    }

    .form-control {
        width: 100%;
        padding: 5px 0;
        font-size: 14px;
        border: 1px solid #eee;
    }

    .text-center {
        text-align: center;
    }

    .identify {
        font-size: 14px;
        color: #f00;
    }
    </style>
</head>

<body>
    <body>
    <form class="form-horizontal" name="join_form" id="join_form">
        <div class="form-group">
            <label for="email" class="col-md-2">이메일<span class="identify">*</span></label>
            <div class="col-md-10">
                <input type="email" name="email" id="email" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label for="user_pw" class="col-md-2">비밀번호<span class="identify">*</span></label>
            <div class="col-md-10">
                <input type="password" name="user_pw" id="user_pw" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label for="user_pw_re" class="col-md-2">비밀번호 확인<span class="identify">*</span></label>
            <div class="col-md-10">
                <input type="password" name="user_pw_re" id="user_pw_re" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label for="user_name" class="col-md-2">이름<span class="identify">*</span></label>
            <div class="col-md-10">
                <input type="text" name="user_name" id="user_name" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label for="tel" class="col-md-2">전화번호<span class="identify">*</span></label>
            <div class="col-md-10">
                <input type="tel" name="tel" id="tel" class="form-control" />
            </div>
        </div>
        <div class="form-group">
            <label for="birthday" class="col-md-2">생년월일<span class="identify">*</span></label>
            <div class="col-md-10">
                <div class="col-md-2">
                    <select name="birth_year" id="birth_year">
                        <option>-</option>
                        <option value="1999">1999</option>
                        <option value="1998">1998</option>
                        <option value="1997">1997</option>
                        <option value="1996">1996</option>
                        <option value="1995">1995</option>
                        <option value="1994">1994</option>
                        <option value="1993">1993</option>
                        <option value="1992">1992</option>
                        <option value="1991">1991</option>
                        <option value="1990">1990</option>
                    </select>
                </div>년&nbsp;
                <div class="col-md-2">
                    <select name="birth_month" id="birth_month">
                        <option>-</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="text-center">
                <button type="submit">가입하기</button>
                <button type="reset">다시작성</button>
            </div>
        </div>
    </form>
</body>

</html>