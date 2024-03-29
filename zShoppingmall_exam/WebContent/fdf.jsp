<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>espriter 실습 - 회원 가입 양식에서 유효성 검사하고 jsp로 넘기기</title>
<!-- 회원 가입 양식에서 유효성 검사하고 jsp로 넘기기 -->
<!-- 설명 : 이름이나 나이를 입력할 때 유효한지 검사(나이 form은 숫자만 입력하는 식으로) -->
<script type="text/javascript">
window.onload =function(){
     document.getElementById("btnSend").onclick = chkData;
     document.getElementById("btnClear").onclick = clsData;
}
function chkData(){
     if(document.frm.name.value === "" || isNaN(frm.name.value) === false){ //isNaN에 의해서 숫자는 처리 불가
          frm.name.focus(); //request는 생략 가능(java)
          alert("이름을 입력하시오");
          return;
     }
     
     if(frm.id.value.length <= 4) {
          frm.id.focus();
          alert("id는 4글자 이상이여만 합니다!")
          return;
     }
     
     //정규 표현식으로 입력자료 검사
           var aa=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/; // 표준식
          // a부터 z까지 문자 1개 이상일 경우 and 숫자 0,1,2일 경우에만 / [^a-z, 0,1,2] : ^ 붙이면 부정의 뜻 / 한글은 가-힣
          if(!frm.email.value.match(aa)){
              alert("이메일을 정확히 입력하세요!");
              frm.email.focus();
              return;   
          }
          
          var regExp2 = /[0-9]{1,2}$/ // 1개나 2개 자리 숫자만 허용
              if(!frm.age.value.match(regExp2)){
                   alert("나이를 제대로 확인하십쇼")
                   frm.age.focus();
                   return;
              }
     frm.action = "form.jsp";
     frm.method = "post";
     frm.submit(); //서버에 파일로 전송(servlet, jsp)
     
     
     }
function clsData(){
     frm.name.value= "";
     frm.id.value= "";
     frm.email.value= "";
     frm.age.value= "";
     alert("삭제 완료");
     return;
     }
</script>
</head>
<body>
* 입력양식 오류 검사 * <br>
<form name="frm">
이름 : <input type="text" name="name" placeholder="예 : 홍길동"><br> <!-- value는 사전에 미리 입력한 값 -->
아이디 : <input type="text" name="id" placeholder="4자 이상"><br> <!--  placeholder는 입력전에 출력 -->
이메일 : <input type="email" name="email"><br>
나이 : <input type="text" name="age" maxlength="5"><br> <!-- type을 number로 변경하면 애초에 숫자만 입력 가능하게 바뀜 / maxlength는 최대 입력 가능한 숫자 -->
<br><br>
<input type="button" id="btnSend" value="자료 전송">
<input type="reset" value="내용 삭제" id="btnClear">
</form>
</body>
</html>


출처: https://note.espriter.net/1122 [에스프리터]