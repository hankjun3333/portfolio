<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <div class="top">
            <h1><a href="./index.do" class="icon-hd-logo"></a></h1>
            <nav id="gnb">
                <li>
                    <a href="./sub01.jsp"><span>사업정보</span></a>
                    <ul>
                        <li><a href="./sub01.jsp">지구안내</a></li>
                        <li><a href="./sub02.jsp">입지안내</a></li>
                        <li><a href="">지역조감도</a></li>
                    </ul>
                </li>
                <li>
                    <a href="./sub03.jsp"><span>단지정보</span></a>
                    <ul>
                        <li><a href="./sub03.jsp">단지안내</a></li>
                        <li><a href="">시스템</a></li>
                        <li><a href="">단지배치도</a></li>
                        <li><a href="">동호배치도</a></li>
                    </ul>
                </li>
                <li>
                    <a href=""><span>세대정보</span></a>
                    <ul>
                        <li><a href="">타입별 평면도</a></li>
                        <li><a href="">인테리어</a></li>
						<li><a href="">사이버모델하우스</a></li>
						<li><a href="">인테리어마감재</a></li>
                    </ul>
                </li>
                <li>
                    <a href=""><span>공급정보</span></a>
                    <ul>
                       <li><a href="">입주자 모집공고</a></li>
                        <li><a href="">E-카달로그</a></li>
                         <li><a href="">공급일정 안내</a></li>
                        <li><a href="">오시는 길</a></li>
                      <li><a href=""></a></li>
                    </ul>
                </li>
                <li>
                    <a href="./reservation_in.jsp"><span>사전방문예약</span></a>
                    <ul>
                        <li><a href="./reservation_in.jsp">사전방문예약</a></li>
                        <li><a href="./reservation_ck.do?userid=<%= userid %>">사전방문예약확인</a></li>
                        <li><a href="./reservation_cancel.do?userid=<%= userid %>">사전방문예약취소</a></li>
                    </ul>
                </li>
            </nav>
        </div>