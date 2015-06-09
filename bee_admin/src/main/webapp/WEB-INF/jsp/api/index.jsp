<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
    <!-- title -->
    <title>API文档和示例</title>
    <!-- set content charset -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- stuffs -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">
    <meta name="author" content="Tony">
    <!-- Stylesheets -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap3-mac/style/bootstrap.css">
    <!-- Font awesome icon -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap3-mac/style/font-awesome.css">
    <!-- doc style -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap3-mac/style/docs.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/bootstrap3-mac/style/bs-docs-patch.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/highlight/idea.css">
    <!-- HTML5 Support for IE -->
    <!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/resources/bootstrap3-mac/js/html5shim.js"></script>
    <script src="${pageContext.request.contextPath}/resources/bootstrap3-mac/js/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <div class="container bs-docs-container">
        <div class="row">

            <div class="col-md-9">
                <div class="bs-docs-section">
                    <div class="panel-group" id="api-doc" role="tablist" aria-multiselectable="true">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#api-doc" href="#api-doc-1" aria-expanded="true" aria-controls="api-doc-1">
                                        登陆接口
                                    </a>
                                </h4>
                            </div>
                            <%--默认闭合 class="panel-collapse collapse"默认展开panel-collapse  in--%>
                            <div id="api-doc-1" class="panel-collapse collapse" role="tabpanel">
                                <div class="panel-body">
                                    <!-- nav tabs -->
                                    <ul class="nav nav-tabs" role="tablist">
                                        <li class="active"><a href="#login-doc" role="tab" data-toggle="tab">文档</a></li>
                                        <li><a href="#login-demo" role="tab" data-toggle="tab">示例</a></li>
                                    </ul>
                                    <!-- Tab panes -->
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="login-doc">
                                            <p>接口地址：/api/user/login</p>
                                            <p>请求参数：</p>
                                            <table class="table table-bordered table-striped">
                                                <thead>
                                                <tr>
                                                    <th width="200">参数名</th>
                                                    <th width="100">是否为空</th>
                                                    <th width="120">参数类型</th>
                                                    <th>说明</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>username</td>
                                                    <td>N</td>
                                                    <td>String</td>
                                                    <td>用户账号</td>
                                                </tr>
                                                <tr>
                                                    <td>password</td>
                                                    <td>N</td>
                                                    <td>String</td>
                                                    <td>用户密码</td>
                                                </tr>
                                                <tr>
                                                    <td>appToken</td>
                                                    <td>N</td>
                                                    <td>String</td>
                                                    <td>应用令牌</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                            <p>响应参数：</p>
                                            <table class="table table-bordered table-striped">
                                                <thead>
                                                <tr>
                                                    <th width="200">参数名</th>
                                                    <th width="100">是否为空</th>
                                                    <th width="120">类型</th>
                                                    <th >说明</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>status</td>
                                                    <td>N</td>
                                                    <td>String</td>
                                                    <td>响应状态码</td>
                                                </tr>
                                                <tr>
                                                    <td>permissionCodes</td>
                                                    <td>Y</td>
                                                    <td>Array[String]</td>
                                                    <td>权限列表</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="tab-pane" id="login-demo">
                                            <div class="bs-example">
                                                <form class="form-horizontal" action="${pageContext.request.contextPath}/api/user/login"
                                                      method="post" role="form">
                                                    <div class="form-group">
                                                        <label class="control-label col-sm-2" for="username">用户名：</label>
                                                        <div class="col-sm-10">
                                                            <input id="username" type="text" class="form-control" name="username" placeholder="请输入用户名" value="admin">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label col-sm-2" for="password">密码：</label>
                                                        <div class="col-sm-10">
                                                            <input id="password" type="password" class="form-control" name="password" placeholder="请输入密码" value="admin">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label col-sm-2" for="appToken">应用令牌：</label>
                                                        <div class="col-sm-10">
                                                            <input id="appToken" type="text" name="appToken" value="23X2vt5CKYsQaQQwTiH88mUPo877nmDKrHTR5QiwBMonXW2qH2J6WJxtVnbYZB3GgJdEYDUBCY3rzWogf3B45Rik" class="form-control" readonly>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-offset-2 col-sm-10">
                                                            <button class="btn btn-primary" type="submit">登陆</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="highlight">
                                                <pre>
                                                    <code style="word-break: break-all;" class="json"></code>
                                                </pre>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    <a data-toggle="collapse" data-parent="#api-doc" href="#api-doc-2" aria-expanded="true" aria-controls="api-doc-2">
                                        更新用户密码
                                    </a>
                                </h4>
                            </div>
                            <div id="api-doc-2" class="panel-collapse collapse in" role="tabpanel">
                                <div class="panel-body">
                                    <!-- nav tabs -->
                                    <ul class="nav nav-tabs" role="tablist">
                                        <li class="active"><a href="#update-pwd-doc" role="tab" data-toggle="tab">文档</a></li>
                                        <li><a href="#update-pwd-demo" role="tab" data-toggle="tab">示例</a></li>
                                    </ul>
                                    <!-- Tab panes -->
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="update-pwd-doc">
                                            <p>接口地址：/api/user/updatePwd</p>
                                            <p>请求参数：</p>
                                            <table class="table table-bordered table-striped">
                                                <thead>
                                                <tr>
                                                    <th width="200">参数名</th>
                                                    <th width="100">是否为空</th>
                                                    <th width="120">参数类型</th>
                                                    <th>说明</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>username</td>
                                                    <td>N</td>
                                                    <td>String</td>
                                                    <td>用户账号</td>
                                                </tr>
                                                <tr>
                                                    <td>appToken</td>
                                                    <td>N</td>
                                                    <td>String</td>
                                                    <td>应用令牌</td>
                                                </tr>
                                                <tr>
                                                    <td>originalPwd</td>
                                                    <td>N</td>
                                                    <td>String</td>
                                                    <td>原密码</td>
                                                </tr>
                                                <tr>
                                                    <td>newPwd</td>
                                                    <td>N</td>
                                                    <td>String</td>
                                                    <td>新密码</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                            <p>响应参数：</p>
                                            <table class="table table-bordered table-striped">
                                                <thead>
                                                <tr>
                                                    <th width="200">参数名</th>
                                                    <th width="100">是否为空</th>
                                                    <th width="120">类型</th>
                                                    <th >说明</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td>status</td>
                                                    <td>N</td>
                                                    <td>String</td>
                                                    <td>响应状态码</td>
                                                </tr>
                                                <tr>
                                                    <td>permissionCodes</td>
                                                    <td>Y</td>
                                                    <td>Array[String]</td>
                                                    <td>权限列表</td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="tab-pane" id="update-pwd-demo">
                                            <div class="bs-example">
                                                <form class="form-horizontal" action="${pageContext.request.contextPath}/api/user/updatePwd"
                                                      method="post" role="form">
                                                    <div class="form-group">
                                                        <label for="username_2" class="control-label col-sm-2">用户名：</label>
                                                        <div class="col-sm-10">
                                                            <input type="text" value="admin" placeholder="请输入用户名" name="username" class="form-control" id="username_2">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="password" class="control-label col-sm-2">原始密码：</label>
                                                        <div class="col-sm-10">
                                                            <input type="password" value="admin" placeholder="请输入原始密码" name="originalPwd" class="form-control" id="password_2">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="newPwd" class="control-label col-sm-2">新密码：</label>
                                                        <div class="col-sm-10">
                                                            <input type="password" class="form-control" placeholder="请输入新的密码" value="" name="newPwd" id="newPwd">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="appToken_2" class="control-label col-sm-2">应用令牌：</label>
                                                        <div class="col-sm-10">
                                                            <input type="text" readonly="" class="form-control" value="23X2vt5CKYsQaQQwTiH88mUPo877nmDKrHTR5QiwBMonXW2qH2J6WJxtVnbYZB3GgJdEYDUBCY3rzWogf3B45Rik" name="appToken" id="appToken_2">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-sm-offset-2 col-sm-10">
                                                            <button type="submit" class="btn btn-primary">登陆</button>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            <button target="clear" type="button" class="btn btn-default">清空</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="highlight">
                                                <pre>
                                                    <code style="word-break: break-all;" class="json"></code>
                                                </pre>
                                            </div>
                                        </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="co-md-3 bs-docs-sidebar">
                <p>aa</p>
            </div>
        </div>
    </div>
<!-- jQuery -->
<script src="${pageContext.request.contextPath}/resources/bootstrap3-mac/js/jquery.js"></script>
<!-- Bootstrap -->
<script src="${pageContext.request.contextPath}/resources/bootstrap3-mac/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/resources/highlight/highlight.pack.js"></script>
<script>
    $(function () {
        $(".bs-example form button[type=submit]").on('click', function (e) {
            e.preventDefault();
            var $form = $(this).closest("form");
            $.ajax({
                type: $form.attr('method'),
                url: $form.attr('action'),
                data: $form.serializeArray(),
                dataType: 'text',
                success: function (responseData) {
                    _createResponseDiv($form, responseData);
                }
            });
        });

        $("button[target='clear']").on("click", function () {
            var $this = $(this),$bsexample = $this.closest("div.bs-example");
            var $hight = $bsexample.next("div.highlight");
            $hight.find("code").empty();
        });
        function _createResponseDiv($form,data) {
            var $code = $form.closest(".bs-example").next("div.highlight").find("code");
            $code.html(data);
            hljs.highlightBlock($code[0]);
//           var $div = $("<div class='highlight'><pre><code style='word-break: break-all;'>" + data + "</code></pre></div>");
//            $div.insertAfter($form.closest(".bs-example"));
//            hljs.highlightBlock($div.find('code')[0]);
        }
    });
</script>
</body>
</html>
