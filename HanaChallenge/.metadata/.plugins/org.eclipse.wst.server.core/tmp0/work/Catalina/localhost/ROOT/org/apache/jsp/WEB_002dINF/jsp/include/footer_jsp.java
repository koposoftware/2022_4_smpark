/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.64
 * Generated at: 2022-10-09 09:25:35 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.jsp.include;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class footer_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html; charset=EUC-KR");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"EUC-KR\">\r\n");
      out.write("<title>Insert title here</title>\r\n");
      out.write(" <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css\" />\r\n");
      out.write("  <link rel=\"stylesheet\" href=\"./style/css/main.css\" />\r\n");
      out.write(" <link rel=\"stylesheet\" href=\"./style/css/main2.css\" />\r\n");
      out.write(" <link rel=\"stylesheet\" href=\"./style/bootstrap.css\" />\r\n");
      out.write(" <link rel=\"stylesheet\" href=\"./style/bootstrap-utilities.css\" />\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<!-- ======= Footer ======= -->\r\n");
      out.write("  <footer id=\"footer\" class=\"footer\">\r\n");
      out.write("\r\n");
      out.write("    <div class=\"footer-content\">\r\n");
      out.write("      <div class=\"container\">\r\n");
      out.write("        <div class=\"row\">\r\n");
      out.write("\r\n");
      out.write("          <div class=\"col-lg-3 col-md-6\">\r\n");
      out.write("            <div class=\"footer-info\">\r\n");
      out.write("              <h3>하나챌린지</h3>\r\n");
      out.write("              <p>\r\n");
      out.write("                인천 서구 에코로 167 하나금융그룹 <br>\r\n");
      out.write("                통합데이터센터 비전센터 5층<br><br>\r\n");
      out.write("                <strong>Phone:</strong> 02-2151-6400<br>\r\n");
      out.write("                <strong>Fax:</strong> 02-2151-6410<br>\r\n");
      out.write("              </p>\r\n");
      out.write("            </div>\r\n");
      out.write("          </div>\r\n");
      out.write("\r\n");
      out.write("          <div class=\"col-lg-2 col-md-6 footer-links\">\r\n");
      out.write("            <h4>회사소개</h4>\r\n");
      out.write("            <ul>\r\n");
      out.write("              <li><i class=\"bi bi-chevron-right\"></i> <a href=\"#\">CEO</a></li>\r\n");
      out.write("              <li><i class=\"bi bi-chevron-right\"></i> <a href=\"#\">비전과 미션</a></li>\r\n");
      out.write("              <li><i class=\"bi bi-chevron-right\"></i> <a href=\"#\">연혁</a></li>\r\n");
      out.write("              <li><i class=\"bi bi-chevron-right\"></i> <a href=\"#\">알림</a></li>\r\n");
      out.write("              <li><i class=\"bi bi-chevron-right\"></i> <a href=\"#\">하나금융그룹</a></li>\r\n");
      out.write("            </ul>\r\n");
      out.write("          </div>\r\n");
      out.write("\r\n");
      out.write("          <div class=\"col-lg-2 col-md-6 footer-links\">\r\n");
      out.write("            <h4>기술</h4>\r\n");
      out.write("            <ul>\r\n");
      out.write("              <li><i class=\"bi bi-chevron-right\"></i> <a href=\"#\">사업영역</a></li>\r\n");
      out.write("              <li><i class=\"bi bi-chevron-right\"></i> <a href=\"#\">신성자동력</a></li>\r\n");
      out.write("              <li><i class=\"bi bi-chevron-right\"></i> <a href=\"#\">전문서비스</a></li>\r\n");
      out.write("              \r\n");
      out.write("            </ul>\r\n");
      out.write("          </div>\r\n");
      out.write("\r\n");
      out.write("          <div class=\"col-lg-4 col-md-6 footer-newsletter\">\r\n");
      out.write("            <h4>Location</h4>\r\n");
      out.write("             <div id=\"map\" style=\"width:600px;height:200px;\"></div>\r\n");
      out.write("\r\n");
      out.write("		         <script type=\"text/javascript\" src=\"//dapi.kakao.com/v2/maps/sdk.js?appkey=bbd5593625485c63ff901a78742bce4e&libraries=services,clusterer\"></script>\r\n");
      out.write("		         <script>\r\n");
      out.write("		         var mapContainer = document.getElementById('map'), // 지도를 표시할 div \r\n");
      out.write("		             mapOption = { \r\n");
      out.write("		                 center: new kakao.maps.LatLng(37.556088112071826, 126.6287096567498), // 지도의 중심좌표\r\n");
      out.write("		                 level: 3 // 지도의 확대 레벨\r\n");
      out.write("		             };\r\n");
      out.write("		         \r\n");
      out.write("		         var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다\r\n");
      out.write("		         \r\n");
      out.write("		         // 마커가 표시될 위치입니다 \r\n");
      out.write("		         var markerPosition  = new kakao.maps.LatLng(37.556088112071826, 126.6287096567498); \r\n");
      out.write("		         \r\n");
      out.write("		         // 마커를 생성합니다\r\n");
      out.write("		         var marker = new kakao.maps.Marker({\r\n");
      out.write("		             position: markerPosition\r\n");
      out.write("		         });\r\n");
      out.write("		         </script>\r\n");
      out.write("\r\n");
      out.write("        </div>\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("    <div class=\"footer-legal text-center\">\r\n");
      out.write("      <div class=\"container d-flex flex-column flex-lg-row justify-content-center justify-content-lg-between align-items-center\">\r\n");
      out.write("\r\n");
      out.write("        <div class=\"d-flex flex-column align-items-center align-items-lg-start\">\r\n");
      out.write("          <div class=\"copyright\">\r\n");
      out.write("            &copy; Copyright <strong><span>HeroBiz</span></strong>. All Rights Reserved\r\n");
      out.write("          </div>\r\n");
      out.write("          <div class=\"credits\">\r\n");
      out.write("            <!-- All the links in the footer should remain intact. -->\r\n");
      out.write("            <!-- You can delete the links only if you purchased the pro version. -->\r\n");
      out.write("            <!-- Licensing information: https://bootstrapmade.com/license/ -->\r\n");
      out.write("            <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/herobiz-bootstrap-business-template/ -->\r\n");
      out.write("            Designed by <a href=\"https://bootstrapmade.com/\">BootstrapMade</a>\r\n");
      out.write("          </div>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("        <div class=\"social-links order-first order-lg-last mb-3 mb-lg-0\">\r\n");
      out.write("          <a href=\"#\" class=\"twitter\"><i class=\"bi bi-twitter\"></i></a>\r\n");
      out.write("          <a href=\"#\" class=\"facebook\"><i class=\"bi bi-facebook\"></i></a>\r\n");
      out.write("          <a href=\"#\" class=\"instagram\"><i class=\"bi bi-instagram\"></i></a>\r\n");
      out.write("          <a href=\"#\" class=\"google-plus\"><i class=\"bi bi-skype\"></i></a>\r\n");
      out.write("          <a href=\"#\" class=\"linkedin\"><i class=\"bi bi-linkedin\"></i></a>\r\n");
      out.write("        </div>\r\n");
      out.write("\r\n");
      out.write("      </div>\r\n");
      out.write("    </div>\r\n");
      out.write("\r\n");
      out.write("  </footer><!-- End Footer -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
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
