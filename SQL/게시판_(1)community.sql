/*
커뮤니티 게시판을 위한 db 설계
- 주요 항목을 일반 게시판 형식
- 메인글에 댓글을 작성하는 형식

메인글 테이블명 : community
컬럼 항목 : 글번호(PK), 작성자(로그인한 사용자), 글 제목, 글 내용, 조회수, 작성 날짜 시간, ip, 댓글 개수

댓글 테이블명 : communityComments
컬럼 항목 : 댓글번호(PK), 메인글번호(FK), 작성자(로그인한 사용자), 댓글 내용, 작성 날짜 시간, ip
*/

CREATE TABLE community (
	idx number(9) NOT NULL,
	writer varchar2(50) NOT NULL,
	title varchar2(100) NOT NULL,
	content varchar2(3000) NOT NULL,
	readCount number(10) DEFAULT '0',
	createdAt DATE DEFAULT sysdate,
	ip varchar2(15) DEFAULT '127.0.0.1',
	commentCount number(6) DEFAULT '0',
	PRIMARY KEY(idx)
);

CREATE SEQUENCE community_idx_seq;
SELECT * FROM community ;
-- DROP TABLE community ;
-- DROP SEQUENCE community_idx_seq ;
-- COMMIT;

INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, 'kevin','글자가 사라진다면','유치원에서 읽고 재미있다고 해서 구입했어요. 책에 나온 단어외에 아이가 스스로 단어를 찾아보는 재미가 있네요!');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, 'wonder','자비를 베푸소서 (외전증보판) 1','재미있게 잘 읽었습니다. 다음 편이 궁금해지네요.');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, 'tom0099','기네스 세계 기록 2024','2023년 광화문 광장에서 약10,000명이 태권도 태극 1장을 하여 기네스북에 올랐다는 사실, 알고 계셨나요?
제게 있어 기네스 북은 "가장~한 기록"이 담긴 책이었는데요, <기네스 세계 기록 2024>을 보고나니, 그 기록 하나하나엔 역사와 문화, 열정과 노력, 과학기술의 발전 등 그동안 생각지 못했던 많은 것들을 담고 있었다는걸 알게 되었어요.
올해는 2만 9100건에 달하는 기록 신청서를 검토하고, 인증받은 기록 중 가장 선호도가 높은 약 2000건의 기록을 골라 담았다고 하는데요, 책에 담지 못한 기록들은 온라인으로 볼 수 있게 책 곳곳에 보너스 영상 QR코드들이 있었어요. 지면으로 보는 것과는 또 다른 재미가 있었답니다.
기록들도 큰 주제별로 나뉘어 정리되어 있어서, 흥미있는 주제별로 찾아볼 수 있었어요. 개인적으로 지구의 물에 대해 기록한 <푸른 행성>편이 제일 눈길을 끌었는데요, 제가 요즘 <코스모스>를 읽고 있어서 그런 것 같아요. 저희 아이들의 눈길을 끈 것은 <물속 생물>과 <사람>에 대한 기록들이었어요, 상상을 초월한 수치들이었답니다. 사진도 함께 있어서 그 기록의 위대함(?)을 이해하기가 더 쉬었어요.
기록을 통해서 이렇게나 다양한 것들을 알 수 있다니..! 정말 놀라며 봤어요. 별별 기록들이 다 있더라고요. 개중엔 대체 저게 무슨 의미가 있는걸까? 이해할 수 없는 것들도 물론 있었지만요.');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, 'chchch','해병과 스님','시에 이런저런 세상 이야기가 녹아있네요. 즐거운 시 공양 하고갑니다. ');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, 'seri111','인생은 순간이다.','쉬운 듯하면서도 어려운 세상 살이의 답을 찾지 못해 헤매다 지쳐 쓰러질 때쯤 감독님의 책을 읽게 되었어요. 처음에는 팬심으로 구입해 가벼운 마음으로 읽기 시작했는데 책을 넘길수록 감독님의 말씀이 가슴 깊이 다가와 울기도 웃기도 하면서 한자한자 마음에 새겼습니다. 제 말을 들어줄 큰 어른이 한 분 계시면 정말 좋을 거 같다는 생각을 해왔는데 이 책을 읽고 나니 마치 감독님께서 제 이야기를 다 들으시고 답을 주신 거 같아요. 감독님께서 인생을 대하시는 마음가짐을 조금이라도 이해하고 저도 본받아 최선을 다해 살겠습니다. 항상 건강하시길 진심으로 바라요!!');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, 'minkr','인생의 절반쯤 왔을 때 읽어야 할 논어','우리가 살아가면서 반드시 알아야 할 것들 중에 윤리와 도덕이 있습니다. 이 윤리와 도덕은 흔히 도덕과 국민윤리로 학창시절에 배우곤 합니다. 이 도덕이니 국민윤리니 하는 것들은 딱 보면 쉬워서 조금만 공부하고 시험보면 80점 이상이 나오는 과목이긴 합니다만 그렇다고 너무나 공부를 안 하게 되면 성적이 잘 나오지 않는 과목이기도 합니다. 그 이유는 인문학의 특성 때문일 것입니다. ');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, 'nara34','시간을 달리는 소년','넘 기대되는 책이예요 도착하자마자 사진부터 찰칵!이제 뜯어서 밤새도록 읽을꺼예요.회사에서 일상을 투정하며 보낸 저를 반성하며');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, 'wonder','라이칸','좋아하는 작가님 책이라 아묻따 구매했어요 기대됩니다 ');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, 'tom0099','달의 아이','결론이 예측되지 않아서 더 집중해서 봤어요.하나의 재난을 극복하기 위한 이겨내기 위한 서로 다른 선택..그들의 선택에 생각을 많이 하게 되네요');
INSERT INTO community (idx,writer,title,content)
VALUES (community_idx_seq.nextval, 'minkr','결혼 피로연','잘읽었습니다잘읽었습니다');