/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.36
 * Generated at: 2018-06-06 14:04:07 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.join;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class IdCheckForm_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

final java.lang.String _jspx_method = request.getMethod();
if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
return;
}

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n");
      out.write("    <title>아이디 중복 체크</title>\r\n");
      out.write("    \r\n");
      out.write("    <style type=\"text/css\">\r\n");
      out.write("        #wrap {\r\n");
      out.write("            width: 490px;\r\n");
      out.write("            text-align :center;\r\n");
      out.write("            margin: 0 auto 0 auto;\r\n");
      out.write("        }\r\n");
      out.write("        \r\n");
      out.write("        #chk{\r\n");
      out.write("            text-align :center;\r\n");
      out.write("        }\r\n");
      out.write("        \r\n");
      out.write("        #cancelBtn{\r\n");
      out.write("            visibility:visible;\r\n");
      out.write("        }\r\n");
      out.write("        \r\n");
      out.write("        #useBtn{\r\n");
      out.write("             visibility:hidden;\r\n");
      out.write("        }\r\n");
      out.write(" \r\n");
      out.write("   </style>\r\n");
      out.write("    \r\n");
      out.write("    <script type=\"text/javascript\">\r\n");
      out.write("    \r\n");
      out.write("        var httpRequest = null;\r\n");
      out.write("        \r\n");
      out.write("        // httpRequest 객체 생성\r\n");
      out.write("        function getXMLHttpRequest(){\r\n");
      out.write("            var httpRequest = null;\r\n");
      out.write("        \r\n");
      out.write("            if(window.ActiveXObject){\r\n");
      out.write("                try{\r\n");
      out.write("                    httpRequest = new ActiveXObject(\"Msxml2.XMLHTTP\");    \r\n");
      out.write("                } catch(e) {\r\n");
      out.write("                    try{\r\n");
      out.write("                        httpRequest = new ActiveXObject(\"Microsoft.XMLHTTP\");\r\n");
      out.write("                    } catch (e2) { httpRequest = null; }\r\n");
      out.write("                }\r\n");
      out.write("            }\r\n");
      out.write("            else if(window.XMLHttpRequest){\r\n");
      out.write("                httpRequest = new window.XMLHttpRequest();\r\n");
      out.write("            }\r\n");
      out.write("            return httpRequest;    \r\n");
      out.write("        }\r\n");
      out.write("        \r\n");
      out.write("        \r\n");
      out.write("        // 회원가입창의 아이디 입력란의 값을 가져온다.\r\n");
      out.write("        function pValue(){\r\n");
      out.write("            document.getElementById(\"userId\").value = opener.document.join_form.id.value;\r\n");
      out.write("        }\r\n");
      out.write("        \r\n");
      out.write("        // 아이디 중복체크\r\n");
      out.write("        function idCheck(){\r\n");
      out.write(" \r\n");
      out.write("            var id = document.getElementById(\"userId\").value;\r\n");
      out.write(" \r\n");
      out.write("            if (!id) {\r\n");
      out.write("                alert(\"아이디를 입력하지 않았습니다.\");\r\n");
      out.write("                return false;\r\n");
      out.write("            } \r\n");
      out.write("            else if( (id < \"0\" || id > \"9\") && (id < \"A\" || id > \"Z\") && (id < \"a\" || id > \"z\") ){ \r\n");
      out.write("                alert(\"한글 및 특수문자는 아이디로 사용하실 수 없습니다.\");\r\n");
      out.write("                return false;\r\n");
      out.write("            }\r\n");
      out.write("            else\r\n");
      out.write("            {\r\n");
      out.write("                var param=\"id=\"+id\r\n");
      out.write("                httpRequest = getXMLHttpRequest();\r\n");
      out.write("                httpRequest.onreadystatechange = callback;\r\n");
      out.write("                httpRequest.open(\"POST\", \"idCheck\", true);    \r\n");
      out.write("                httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); \r\n");
      out.write("                httpRequest.send(param);\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("        \r\n");
      out.write("        function callback(){\r\n");
      out.write("            if(httpRequest.readyState == 4){\r\n");
      out.write("                // 결과값을 가져온다.\r\n");
      out.write("                var resultText = httpRequest.responseText;\r\n");
      out.write("                if(resultText == 0){\r\n");
      out.write("                    alert(\"사용할수없는 아이디입니다.\");\r\n");
      out.write("                    document.getElementById(\"cancelBtn\").style.visibility='visible';\r\n");
      out.write("                    document.getElementById(\"useBtn\").style.visibility='hidden';\r\n");
      out.write("                    document.getElementById(\"msg\").innerHTML =\"\";\r\n");
      out.write("                } \r\n");
      out.write("                else if(resultText == 1){ \r\n");
      out.write("                    document.getElementById(\"cancelBtn\").style.visibility='hidden';\r\n");
      out.write("                    document.getElementById(\"useBtn\").style.visibility='visible';\r\n");
      out.write("                    document.getElementById(\"msg\").innerHTML = \"사용 가능한 아이디입니다.\";\r\n");
      out.write("                }\r\n");
      out.write("            }\r\n");
      out.write("        }\r\n");
      out.write("        \r\n");
      out.write("        // 사용하기 클릭 시 부모창으로 값 전달 \r\n");
      out.write("        function sendCheckValue(){\r\n");
      out.write("        \t\r\n");
      out.write("            // 중복체크 결과인 idCheck 값을 전달한다.\r\n");
      out.write("            opener.document.join_form.idDuplication.value =\"idCheck\";\r\n");
      out.write("            // 회원가입 화면의 ID입력란에 값을 전달\r\n");
      out.write("            opener.document.join_form.id.value = document.getElementById(\"userId\").value;\r\n");
      out.write("            \r\n");
      out.write("            if (opener != null) {\r\n");
      out.write("                opener.chkForm = null;\r\n");
      out.write("                self.close();\r\n");
      out.write("            }\r\n");
      out.write("            \r\n");
      out.write("            return false;\r\n");
      out.write("        }    \r\n");
      out.write("   </script>\r\n");
      out.write("    \r\n");
      out.write("</head>\r\n");
      out.write("<body onload=\"pValue()\">\r\n");
      out.write("<div id=\"wrap\">\r\n");
      out.write("    <br>\r\n");
      out.write("    <b><font size=\"4\" color=\"gray\">아이디 중복체크</font></b>\r\n");
      out.write("    <hr size=\"1\" width=\"460\">\r\n");
      out.write("    <br>\r\n");
      out.write("    <div id=\"chk\">\r\n");
      out.write("        <form id=\"checkForm\">\r\n");
      out.write("            <input type=\"text\" name=\"idinput\" id=\"userId\">\r\n");
      out.write("            <input type=\"button\" value=\"중복확인\" onclick=\"idCheck()\">\r\n");
      out.write("        </form>\r\n");
      out.write("        <div id=\"msg\"></div>\r\n");
      out.write("        <form id = \"submitBtn\">\r\n");
      out.write("        <br>\r\n");
      out.write("        <input id=\"cancelBtn\" type=\"button\" value=\"취소\" onclick=\"window.close()\">\r\n");
      out.write("        <br>\r\n");
      out.write("        <input id=\"useBtn\" type=\"button\" value=\"사용하기\" onclick= sendCheckValue()>\r\n");
      out.write("        </form>\r\n");
      out.write("    </div>\r\n");
      out.write("</div>    \r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
