/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.64
 * Generated at: 2022-09-27 06:01:48 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.Calendar;

public final class admin_jsp extends org.apache.jasper.runtime.HttpJspBase
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
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.util.Calendar");
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

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
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
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");

	Calendar cal = Calendar.getInstance();

	int calMonth = cal.get(Calendar.MONTH)+1;

	session.setAttribute("tYear", "" + Calendar.YEAR);
	session.setAttribute("tMonth", "" + calMonth);
	session.setAttribute("tDay", "" + cal.get(Calendar.DATE));

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html lang=\"en\">\r\n");
      out.write("  <head>\r\n");
      out.write("    <meta charset=\"UTF-8\" />\r\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />\r\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\" />\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css\" />\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"./style/css/main.css\" />\r\n");
      out.write("    <link rel=\"stylesheet\" href=\"./style/css/main2.css\" />\r\n");
      out.write("  \r\n");
      out.write("    <title>admin</title>\r\n");
      out.write("  </head>\r\n");
      out.write(" <body>\r\n");
      out.write("   <header>\r\n");
      out.write("   	");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "/WEB-INF/jsp/include/adminheader.jsp", out, false);
      out.write("\r\n");
      out.write("   </header>\r\n");
      out.write("    <!-- main -->\r\n");
      out.write("    <main class=\"hana__main-wrap\">\r\n");
      out.write("      <div class=\"hana__main__banner-wrap\">\r\n");
      out.write("        <div class=\"hana__main__banner-inner\">\r\n");
      out.write("          <div class=\"swiper mySwiper\">\r\n");
      out.write("            <ul class=\"swiper-wrapper\">\r\n");
      out.write("              <li class=\"swiper-slide hana__main__banner-slide-list\">\r\n");
      out.write("                <img src=\"./image/img/sample1.jpg\" alt=\"banner_img\" />\r\n");
      out.write("              </li>\r\n");
      out.write("              <li class=\"swiper-slide hana__main__banner-slide-list\">\r\n");
      out.write("                <img src=\"./image/img/sample2.jpg\" alt=\"banner_img\" />\r\n");
      out.write("              </li>\r\n");
      out.write("              <li class=\"swiper-slide hana__main__banner-slide-list\">\r\n");
      out.write("                <img src=\"./image/img/sample3.jpg\" alt=\"banner_img\" />\r\n");
      out.write("              </li>\r\n");
      out.write("            </ul>\r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        <nav class=\"hana__main__nav-wrap\">\r\n");
      out.write("          <ul class=\"hana__main__nav\">\r\n");
      out.write("            <li>\r\n");
      out.write("              <a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/report\">나의 리포트</a>\r\n");
      out.write("            </li>\r\n");
      out.write("            <li>\r\n");
      out.write("              <a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/challenge\">도전하기</a>\r\n");
      out.write("            </li>\r\n");
      out.write("            <li>\r\n");
      out.write("              <a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/product\">맞춤 상품</a>\r\n");
      out.write("            </li>\r\n");
      out.write("            <li>\r\n");
      out.write("              <a href=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pageContext.request.contextPath}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("/mypage\">마이페이지</a>\r\n");
      out.write("              \r\n");
      out.write("            </li>\r\n");
      out.write("         \r\n");
      out.write("          </ul>\r\n");
      out.write("        </nav>\r\n");
      out.write("      </div>\r\n");
      out.write("      <div class=\"hana__main-inner\">\r\n");
      out.write("        <section class=\"hana__main__section\">\r\n");
      out.write("          <span class=\"hana__main__title\">금융상품</span>\r\n");
      out.write("          <ul class=\"hana__main__list-wrap\">\r\n");
      out.write("            <li>\r\n");
      out.write("              <span class=\"hana__icon icon--deposit\"></span>\r\n");
      out.write("              예/적금\r\n");
      out.write("            </li>\r\n");
      out.write("            <li>\r\n");
      out.write("              <span class=\"hana__icon icon--loan\"></span>\r\n");
      out.write("              대출\r\n");
      out.write("            </li>\r\n");
      out.write("            <li>\r\n");
      out.write("              <span class=\"hana__icon icon--foreign\"></span>\r\n");
      out.write("              외화\r\n");
      out.write("            </li>\r\n");
      out.write("            <li>\r\n");
      out.write("              <span class=\"hana__icon icon--insurance\"></span>\r\n");
      out.write("              보험\r\n");
      out.write("            </li>\r\n");
      out.write("            <li>\r\n");
      out.write("              <span class=\"hana__icon icon--fund\"></span>\r\n");
      out.write("              펀드\r\n");
      out.write("            </li>\r\n");
      out.write("            <li>\r\n");
      out.write("              <span class=\"hana__icon icon--trust\"></span>\r\n");
      out.write("              신탁\r\n");
      out.write("            </li>\r\n");
      out.write("            <li>\r\n");
      out.write("              <span class=\"hana__icon icon--pension\"></span>\r\n");
      out.write("              퇴직연금\r\n");
      out.write("            </li>\r\n");
      out.write("            <li>\r\n");
      out.write("              <span class=\"hana__icon icon--isa\"></span>\r\n");
      out.write("              ISA\r\n");
      out.write("            </li>\r\n");
      out.write("          </ul>\r\n");
      out.write("        </section>\r\n");
      out.write("      </div>\r\n");
      out.write("\r\n");
      out.write("    </main>\r\n");
      out.write("    <!-- main -->\r\n");
      out.write("    \r\n");
      out.write("\r\n");
      out.write("   \r\n");
      out.write("\r\n");
      out.write("    <script\r\n");
      out.write("    src=\"https://code.jquery.com/jquery-3.6.0.js\"\r\n");
      out.write("    integrity=\"sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=\"\r\n");
      out.write("    crossorigin=\"anonymous\"></script>\r\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js\"></script>\r\n");
      out.write("    <script>\r\n");
      out.write("      const swiper = new Swiper(\".mySwiper\", {\r\n");
      out.write("        loop: true,\r\n");
      out.write("        autoplay: {\r\n");
      out.write("          delay: 2500,\r\n");
      out.write("          disableOnInteraction: false,\r\n");
      out.write("        },\r\n");
      out.write("      });\r\n");
      out.write("    </script>\r\n");
      out.write("  </body>\r\n");
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
