-- 회원정보(회원가입)
create table member (
	id varchar(30) primary key,
    password varchar(30) not null,
    name varchar(10) not null,
    birthDate varchar(10),
    email varchar(30) not null,
    nickname varchar(30) not null,
	phone varchar(20),
    registerDate DATE,
    lastVisitDate DATE,
    score int,
    location varchar(20),
    total varchar(20),
    profileImg varchar(400),
    gender varchar(10) not null
);


-- 크루 게시판
create table crewboard(
	no int primary key auto_increment,
    id varchar(30) not null,
    nickname varchar(30) not null,
    created varchar(20) not null,
    title varchar(300) not null,
    content text not null,
    category varchar(20) not null,
    imgName varchar(450),
    crewName varchar(100) not null,
    foreign key(id) references member(id) on delete cascade
);



-- 게시판 추천
create table recommend(
	no int not null,
    id varchar(30) not null,
    primary key(no, id),
    foreign key(no) references crewboard(no) on delete cascade,
    foreign key(id) references member(id)
);


select * from course;

-- 단기크루 등록 & 일정 등록 / 장기크루 일정 
create table crewRecruit(
	no int primary key auto_increment,
	crewName varchar(30) not null,
    title varchar(30) not null,
    content varchar(400) not null,
    location varchar(30) not null,
    memberNum int not null,
    created varchar(20) not null,
    gatherDate varchar(20) not null,
    adminId varchar(30) not null,
    isCrew boolean default true,		-- 단기크루 생성(true)인지, 장기크루 일정(false)인지 확인
    courseId varchar(20),
    complete boolean					-- course 테이블에 있는 일정(유저가 참여완료 버튼 눌렀다는 의미)인지 아닌지(있으면 false, 없으면 true)
);




-- 크루 일정 멤버 등록 & 단기크루 멤버(일정멤버) 등록
create table crewSchedule(
	no int not null,
	crewName varchar(30) not null,
    memberNum int not null,
    memId varchar(30) not null,
    memAdmin boolean not null,			-- 일정등록자인지 아닌지
    PRIMARY KEY(no, memId),
    foreign key(memId) references member(id) on delete cascade,
	foreign key(no) references crewRecruit(no) on delete cascade
);



-- 게시판 댓글
create table reply(
	r_no int primary key auto_increment,
    b_no int not null,
    content varchar(70) not null,
    created varchar(20) not null,
    id varchar(30) not null,
    foreign key(b_no) references crewboard(no) on delete cascade
);


-- 장기크루 등록
create table longCrewRecruit(
	crewName varchar(30) primary key,
    content varchar(400) not null,
    memberNum int not null,
    created varchar(20) not null,
    adminId varchar(30) not null,
    dueDate varchar(20) not null
);






 -- 장기크루 크루가입 정보
create table longCrewMember(
	crewName varchar(30) not null,
    memId varchar(30) not null,
	memberNum int not null,
    isAdmin boolean not null,
    joinDate varchar(100),
    PRIMARY KEY(crewName, memId),
    foreign key(memId) references member(id) on delete cascade,
    FOREIGN KEY (crewName) references longCrewRecruit(crewName) on delete cascade
);


-- 가입정보 (장기 단기 크루가입 신청한 정보)
create table crewJoin(
	no int primary key auto_increment,
	crewName varchar(30) not null,
    memId varchar(30) not null,
    adminId varchar(30) not null,
    isCheck int not null,		-- 1: 승인대기, 2: 승인완료, 3: 승인거절
    memberNum int not null,
    isShortCrew boolean,		-- true : 단기크루, false : 장기크루
    gender varchar(10) not null
);










-- no로 일정 정보 끌어오고 아이디랑 course
 create table myCourse(
	memId varchar(30) not null,
   courseId varchar(100) not null,
   no int not null,
	UNIQUE (memId, courseId, no)
    
);


set foreign_key_checks=1;



-- member 인서트
insert into member values('aa', '1111', '김가나', '1968-11-20', 'aa@naver.com', '고릴라', '010-9634-9071', '2023-09-13', '2023-12-13', null, null, null, null, '여');
insert into member values('bb', '2222', '전종수', '1997-06-27', 'bb@hanmail.com', '지킬', '010-1205-7513', '2023-08-11', '2023-12-13', null, null, null, null, '남');
insert into member values('cc', '3333', '짱구', '1985-05-29', 'cc@naver.com', 'cc', '010-1508-7592', '2023-05-15', '2023-12-13', null, null, null, null, '남');
insert into member values('dd', '4444', '둘리', '1975-04-15', 'dd@naver.com', 'dd', '010-7515-1238', '2023-07-01', '2023-12-13', null, null, null, null, '남');
insert into member values('ee', '5555', '박지수', '1999-12-25', 'ee@naver.com', '고양이', '010-0711-8500', '2023-02-01', '2023-12-13', null, null, null, null, '여');
insert into member values('ff', '6666', '한가인', '1980-09-10', 'ff@naver.com', '왕눈이', '010-8502-8851', '2023-01-10', '2023-12-13', null, null, null, null, '여');
insert into member values('gg', '7777', '정민지', '1995-01-01', 'gg@naver.com', '초코라떼', '010-9620-8501', '2023-03-14', '2023-12-13', null, null, null, null, '여');
insert into member values('hh', '8888', '이종혁', '1975-07-15', 'hh@naver.com', 'hh', '010-5215-8520', '2023-10-11', '2023-12-13', null, null, null, null, '남');


-- crewboard 인서트
insert into crewboard (id, nickname, created, title, content, category, imgName, crewName) values('aa', '고릴라', '2023-10-13', '제목1','내용1', 'notice', 'dog.png', '크루5');
insert into crewboard (id, nickname, created, title, content, category, imgName, crewName) values('bb', '지킬', '2023-11-10','제목2', '내용2', 'board', 'dog.png', '크루5');
insert into crewboard (id, nickname, created, title, content, category, imgName, crewName) values('cc', 'cc', '2023-07-15', '제목3','내용3', 'notice', 'dog.png', '크루5');
insert into crewboard (id, nickname, created, title, content, category, imgName, crewName) values('aa', '고릴라', '2023-08-02', '제목4','내용4', 'notice', 'dog.png', '크루5');
insert into crewboard (id, nickname, created, title, content, category, imgName, crewName) values('bb', '지킬', '2023-09-17', '제목5','내용5', 'greeting', 'dog.png', '크루5');
insert into crewboard (id, nickname, created, title, content, category, imgName, crewName) values('cc', 'cc', '2023-05-24', '제목6','내용6', 'notice', 'dog.png', '크루5');
insert into crewboard (id, nickname, created, title, content, category, imgName, crewName) values('aa', '고릴라', '2023-06-12', '제목7','내용7', 'notice', 'dog.png', '크루5');
insert into crewboard (id, nickname, created, title, content, category, imgName, crewName) values('bb', '지킬', '2023-07-01', '제목8','내용8', 'greeting', 'dog.png', '크루5');
insert into crewboard (id, nickname, created, title, content, category, imgName, crewName) values('cc', 'cc', '2023-12-13', '제목9','내용9', 'notice', 'dog.png', '크루5');
insert into crewboard (id, nickname, created, title, content, category, imgName, crewName) values('aa', '고릴라', '2023-03-14', '제목10','내용10', 'greeting', 'dog.png', '크루10');
insert into crewboard (id, nickname, created, title, content, category, imgName, crewName) values('bb', '지킬', '2023-02-01', '제목11','내용11', 'board', 'dog.png', '크루10');
insert into crewboard (id, nickname, created, title, content, category, imgName, crewName) values('cc', 'cc', '2023-07-05', '제목12','내용12', 'greeting', 'dog.png', '크루10');
insert into crewboard (id, nickname, created, title, content, category, imgName, crewName) values('aa', '고릴라', '2023-02-11', '제목13','내용13', 'board', 'dog.png', '크루10');
insert into crewboard (id, nickname, created, title, content, category, imgName, crewName) values('bb', '지킬', '2023-01-05', '제목14','내용14', 'notice', 'dog.png', '크루10');
insert into crewboard (id, nickname, created, title, content, category, imgName, crewName) values('cc', 'cc', '2023-01-13', '제목15','내용15', 'greeting', 'dog.png', '크루10');
insert into crewboard (id, nickname, created, title, content, category, imgName, crewName) values('aa', '고릴라', '2023-02-16', '제목16','내용16', 'greeting', 'dog.png', '크루10');
insert into crewboard (id, nickname, created, title, content, category, imgName, crewName) values('bb', '지킬', '2023-03-17', '제목17', '내용17', 'board', 'dog.png', '크루10');
insert into crewboard (id, nickname, created, title, content, category, imgName, crewName) values('cc', 'cc', '2023-04-19', '제목18','내용18', 'notice', 'dog.png', '크루10');
insert into crewboard (id, nickname, created, title, content, category, imgName, crewName) values('aa', '고릴라', '2023-05-18', '제목19','내용19', 'notice', 'dog.png', '크루10');
insert into crewboard (id, nickname, created, title, content, category, imgName, crewName) values('bb', '지킬', '2023-06-11', '제목20','내용20', 'board', 'dog.png', '크루10');
insert into crewboard (id, nickname, created, title, content, category, imgName, crewName) values('cc', 'cc', '2023-07-13', '제목21','내용21', 'greeting', 'dog.png', '크루10');
insert into crewboard (id, nickname, created, title, content, category, imgName, crewName) values('aa', '고릴라', '2023-08-09', '제목22','내용22', 'notice', 'dog.png', '크루10');
insert into crewboard (id, nickname, created, title, content, category, imgName, crewName) values('bb', '지킬', '2023-04-18','제목23', '내용23', 'board', 'dog.png', '크루10');
insert into crewboard (id, nickname, created, title, content, category, imgName, crewName) values('cc', 'cc', '2023-11-11', '제목24','내용24', 'notice', 'dog.png', '크루10');

-- crewRecruit 인서트
insert into crewRecruit values(null, '크루11', '제목1', '내용1', '모임장소1', 15, '2023-11-30', '2023-12-30', 'aa', 1, '코스1', 1); 
insert into crewRecruit values(null, '크루12', '제목2', '내용2', '모임장소2', 20, '2023-10-30', '2023-12-27', 'bb', 1, '코스2', 1); 
insert into crewRecruit values(null, '크루13', '제목3', '내용3', '모임장소3', 25, '2023-09-21', '2023-12-20', 'cc', 1, '코스3', 1); 
insert into crewRecruit values(null, '크루14', '제목4', '내용4', '모임장소4', 30, '2023-08-05', '2023-12-26', 'aa', 1, '코스4', 1); 
insert into crewRecruit values(null, '크루15', '제목5', '내용5', '모임장소5', 10, '2023-07-05', '2023-12-25', 'bb', 1, '코스5', 1); 
insert into crewRecruit values(null, '크루16', '제목6', '내용6', '모임장소6', 7, '2023-11-05', '2023-12-12', 'aa', 0, '코스6', 1); 
insert into crewRecruit values(null, '크루6', '제목6-1', '내용6-1', '모임장소6-1', 6, '2023-11-05', '2023-12-12', 'aa', 0, '코스6-1', 1); 
insert into crewRecruit values(null, '크루17', '제목7', '내용7', '모임장소7', 10, '2023-11-05', '2023-11-16', 'bb', 0, '코스7', 1); 
insert into crewRecruit values(null, '크루7', '제목7-1', '내용7-1', '모임장소7-1', 12, '2023-11-05', '2023-12-16', 'bb', 0, '코스7-1', 1); 
insert into crewRecruit values(null, '크루18', '제목8', '내용8', '모임장소8', 15, '2023-11-05', '2023-10-18', 'cc', 0, '코스8', 1); 
insert into crewRecruit values(null, '크루8', '제목8-1', '내용8-1', '모임장소8-1', 20, '2023-11-05', '2023-12-16', 'cc', 0, '코스8-1', 1); 
insert into crewRecruit values(null, '크루19', '제목9', '내용9', '모임장소9', 20, '2023-11-05', '2023-09-20', 'aa', 0, '코스9', 1); 
insert into crewRecruit values(null, '크루9', '제목9-1', '내용9-1', '모임장소9-1', 18, '2023-11-05', '2023-12-16', 'aa', 0, '코스9-1', 1); 
insert into crewRecruit values(null, '크루20', '제목10', '내용10', '모임장소10', 19, '2023-11-05', '2023-08-20', 'bb', 0, '코스10', 1); 
insert into crewRecruit values(null, '크루10', '제목10-1', '내용10-1', '모임장소10-1', 25, '2023-11-05', '2023-12-16', 'bb', 0, '코스10-1', 1); 


-- longCrewRecruit 인서트
insert into longCrewRecruit values('크루6', '내용6', 10, '2023-11-20', 'aa', '2023-12-10');
insert into longCrewRecruit values('크루7', '내용7', 15, '2023-11-10', 'bb', '2024-12-10');
insert into longCrewRecruit values('크루8', '내용8', 20, '2023-11-11', 'cc', '2023-12-20');
insert into longCrewRecruit values('크루9', '내용9', 25, '2023-11-12', 'aa', '2024-12-10');
insert into longCrewRecruit values('크루10', '내용10', 30, '2023-11-30', 'bb', '2024-12-10');
insert into longCrewRecruit values('크루1', '내용1', 10, '2023-11-10', 'bb', '2023-12-10');
insert into longCrewRecruit values('크루2', '내용2', 20, '2023-11-11', 'ff', '2023-12-10');
insert into longCrewRecruit values('크루3', '내용3', 30, '2023-11-12', 'gg', '2024-12-10');
insert into longCrewRecruit values('크루4', '내용4', 15, '2023-11-13', 'hh', '2023-12-10');
insert into longCrewRecruit values('크루5', '내용5', 25, '2023-11-14', 'bb', '2023-12-10');

insert into longCrewRecruit values('크루16', '같이 뛸 사람들 모집합니다', 30, '2023-11-30', 'aa', '2023-12-10');
insert into longCrewRecruit values('크루17', '같이 뛸 사람들 모집합니다', 30, '2023-11-30', 'bb', '2024-12-10');
insert into longCrewRecruit values('크루18', '같이 뛸 사람들 모집합니다', 30, '2023-11-30', 'cc', '2024-12-10');
insert into longCrewRecruit values('크루19', '같이 뛸 사람들 모집합니다', 30, '2023-11-30', 'aa', '2023-02-10');
insert into longCrewRecruit values('크루20', '같이 뛸 사람들 모집합니다', 30, '2023-11-30', 'bb', '2023-03-10');

 
-- crewSchedule 인서트
	insert into crewSchedule values(6, '크루16', 15, 'aa', 1);
	insert into crewSchedule values(6, '크루16', 15, 'bb', 0);
	insert into crewSchedule values(6, '크루16', 15, 'cc', 0);

	insert into crewSchedule values(7, '크루6', 20, 'bb', 1);
	insert into crewSchedule values(7, '크루6', 20, 'cc', 0);
	insert into crewSchedule values(7, '크루6', 20, 'aa', 0);

	insert into crewSchedule values(8, '크루17', 25, 'cc', 1);
	insert into crewSchedule values(8, '크루17', 25, 'bb', 0);
	insert into crewSchedule values(8, '크루17', 25, 'aa', 0);


	insert into crewSchedule values(9, '크루7', 30, 'bb', 1);
	insert into crewSchedule values(9, '크루7', 30, 'aa', 0);
	insert into crewSchedule values(9, '크루7', 30, 'cc', 0);

	insert into crewSchedule values(10, '크루18', 10, 'bb', 1);
	insert into crewSchedule values(10, '크루18', 10, 'aa', 0);
	insert into crewSchedule values(10, '크루18', 10, 'cc', 0);

	insert into crewSchedule values(2, '크루12', 20, 'cc', 1);
	insert into crewSchedule values(3, '크루13', 25, 'cc', 1);
	insert into crewSchedule values(3, '크루13', 25, 'dd', 0);
	insert into crewSchedule values(3, '크루13', 25, 'ee', 0);
	insert into crewSchedule values(4, '크루14', 30, 'aa', 1);
	insert into crewSchedule values(4, '크루14', 30, 'bb', 0);
	insert into crewSchedule values(4, '크루14', 30, 'cc', 0);
	insert into crewSchedule values(5, '크루15', 10, 'bb', 1);
	insert into crewSchedule values(5, '크루15', 10, 'aa', 0);
	insert into crewSchedule values(5, '크루15', 10, 'cc', 0);
	insert into crewSchedule values(11, '크루8', 6, 'aa', 1);
	insert into crewSchedule values(11, '크루8', 6, 'dd', 0);
	insert into crewSchedule values(11, '크루8', 6, 'ff', 0);
	insert into crewSchedule values(12, '크루19', 8, 'aa', 1);
	insert into crewSchedule values(12, '크루19', 8, 'ff', 0);
	insert into crewSchedule values(12, '크루19', 8, 'ee', 0);
	insert into crewSchedule values(13, '크루9', 8, 'bb', 1);
	insert into crewSchedule values(13, '크루9', 8, 'ee', 0);
	insert into crewSchedule values(13, '크루9', 8, 'ff', 0);
	insert into crewSchedule values(14, '크루20', 10, 'bb', 1);
	insert into crewSchedule values(14, '크루20', 10, 'ff', 0);
	insert into crewSchedule values(14, '크루20', 10, 'ee', 0);
	insert into crewSchedule values(15, '크루10', 15, 'cc', 1);
	insert into crewSchedule values(15, '크루10', 15, 'ff', 0);
	insert into crewSchedule values(15, '크루10', 15, 'ee', 0);
	insert into crewSchedule values(15, '크루10', 15, 'aa', 0);
	insert into crewSchedule values(15, '크루10', 15, 'bb', 0);
	insert into crewSchedule values(15, '크루10', 15, 'gg', 0);



-- reply 인서트
insert into reply values(null, 1, '댓글1', '2023-12-13', 'cc');
insert into reply values(null, 2, '댓글2', '2023-12-13', 'bb');
insert into reply values(null, 3, '댓글3', '2023-12-13', 'aa');
insert into reply values(null, 4, '댓글4', '2023-12-13', 'cc');
insert into reply values(null, 5, '댓글5', '2023-12-13', 'bb');
insert into reply values(null, 6, '댓글6', '2023-12-13', 'aa');
insert into reply values(null, 7, '댓글7', '2023-12-13', 'cc');
insert into reply values(null, 8, '댓글8', '2023-12-13', 'bb');
insert into reply values(null, 9, '댓글9', '2023-12-13', 'aa');
insert into reply values(null, 10, '댓글10', '2023-12-13', 'cc');
insert into reply values(null, 11, '댓글11', '2023-12-13', 'bb');
insert into reply values(null, 12, '댓글12', '2023-12-13', 'aa');
insert into reply values(null, 13, '댓글13', '2023-12-13', 'cc');
insert into reply values(null, 14, '댓글14', '2023-12-13', 'bb');
insert into reply values(null, 15, '댓글15', '2023-12-13', 'aa');
insert into reply values(null, 16, '댓글16', '2023-12-13', 'cc');
insert into reply values(null, 17, '댓글17', '2023-12-13', 'bb');
insert into reply values(null, 18, '댓글18', '2023-12-13', 'aa');
insert into reply values(null, 19, '댓글19', '2023-12-13', 'cc');
insert into reply values(null, 20, '댓글20', '2023-12-13', 'bb');
insert into reply values(null, 21, '댓글21', '2023-12-13', 'aa');
insert into reply values(null, 22, '댓글22', '2023-12-13', 'cc');
insert into reply values(null, 23, '댓글23', '2023-12-13', 'bb');
insert into reply values(null, 24, '댓글24', '2023-12-13', 'aa');




-- longCrewMember 인서트
insert into longCrewMember values('크루6', 'aa', 10, 1, '2023-11-21');
insert into longCrewMember values('크루6', 'dd', 10, 0, '2023-11-21');
insert into longCrewMember values('크루6', 'ee', 10, 0, '2023-11-21');
insert into longCrewMember values('크루6', 'ff', 10, 0, '2023-11-21');
insert into longCrewMember values('크루7', 'bb', 15, 1, '2023-11-10');
insert into longCrewMember values('크루7', 'dd', 15, 0, '2023-11-10');
insert into longCrewMember values('크루7', 'ee', 15, 0, '2023-11-10');
insert into longCrewMember values('크루7', 'ff', 15, 0, '2023-11-10');
insert into longCrewMember values('크루8', 'cc', 20, 1, '2023-11-11');
insert into longCrewMember values('크루8', 'dd', 20, 0, '2023-11-11');
insert into longCrewMember values('크루8', 'ee', 20, 0, '2023-11-11');
insert into longCrewMember values('크루8', 'ff', 20, 0, '2023-11-11');
insert into longCrewMember values('크루9', 'aa', 25, 1, '2023-11-12');
insert into longCrewMember values('크루9', 'dd', 25, 0, '2023-11-12');
insert into longCrewMember values('크루9', 'ee', 25, 0, '2023-11-12');
insert into longCrewMember values('크루9', 'ff', 25, 0, '2023-11-12');
insert into longCrewMember values('크루10', 'bb', 30, 1, '2023-11-30');
insert into longCrewMember values('크루10', 'dd', 30, 0, '2023-11-30');
insert into longCrewMember values('크루10', 'ee', 30, 0, '2023-11-30');

insert into longCrewMember values('크루16', 'aa', 30, 1, '2023-11-15');
insert into longCrewMember values('크루16', 'bb', 30, 0, '2023-10-31');
insert into longCrewMember values('크루16', 'cc', 30, 0, '2023-08-17');
insert into longCrewMember values('크루16', 'dd', 30, 0, '2023-07-15');

insert into longCrewMember values('크루17', 'aa', 30, 0, '2023-11-15');
insert into longCrewMember values('크루17', 'bb', 30, 1, '2023-10-31');
insert into longCrewMember values('크루17', 'cc', 30, 0, '2023-08-17');
insert into longCrewMember values('크루17', 'dd', 30, 0, '2023-07-15');

insert into longCrewMember values('크루18', 'aa', 30, 0, '2023-11-15');
insert into longCrewMember values('크루18', 'bb', 30, 0, '2023-10-31');
insert into longCrewMember values('크루18', 'cc', 30, 1, '2023-08-17');
insert into longCrewMember values('크루18', 'dd', 30, 0, '2023-07-15');

insert into longCrewMember values('크루19', 'aa', 30, 1, '2023-11-15');
insert into longCrewMember values('크루19', 'bb', 30, 0, '2023-10-31');
insert into longCrewMember values('크루19', 'cc', 30, 0, '2023-08-17');
insert into longCrewMember values('크루19', 'dd', 30, 0, '2023-07-15');

insert into longCrewMember values('크루20', 'aa', 30, 0, '2023-11-15');
insert into longCrewMember values('크루20', 'bb', 30, 1, '2023-10-31');
insert into longCrewMember values('크루20', 'cc', 30, 0, '2023-08-17');
insert into longCrewMember values('크루20', 'dd', 30, 0, '2023-07-15');

-- recommend 인서트 
insert into recommend values(1,'aa');
insert into recommend values(1,'bb');
insert into recommend values(1,'cc');
insert into recommend values(1,'dd');
insert into recommend values(2,'dd');
insert into recommend values(3,'dd');
insert into recommend values(4,'dd');
insert into recommend values(5,'dd');
insert into recommend values(6,'cc');



-- crewJoin 인서트
insert into crewJoin values(null, '크루1', 'dd', 'aa', 1, 15, 1, '여');
insert into crewJoin values(null, '크루1', 'ee', 'aa', 1, 15, 1, '남');
insert into crewJoin values(null, '크루1', 'ff', 'aa', 1, 15, 1, '여');
insert into crewJoin values(null, '크루2', 'dd', 'bb', 1, 20, 1, '여');
insert into crewJoin values(null, '크루2', 'ee', 'bb', 1, 20, 1, '남');
insert into crewJoin values(null, '크루2', 'ff', 'bb', 1, 20, 1, '여');
insert into crewJoin values(null, '크루3', 'dd', 'cc', 1, 25, 1, '여');
insert into crewJoin values(null, '크루3', 'ee', 'cc', 1, 25, 1, '남');
insert into crewJoin values(null, '크루3', 'ff', 'cc', 1, 25, 1, '여');
insert into crewJoin values(null, '크루4', 'dd', 'aa', 1, 30, 1, '여');
insert into crewJoin values(null, '크루4', 'ee', 'aa', 1, 30, 1, '남');
insert into crewJoin values(null, '크루4', 'ff', 'aa', 1, 30, 1, '여');
insert into crewJoin values(null, '크루5', 'dd', 'bb', 1, 10, 1, '여');
insert into crewJoin values(null, '크루5', 'ee', 'bb', 1, 10, 1, '남');
insert into crewJoin values(null, '크루5', 'ff', 'bb', 1, 10, 1, '여');
insert into crewJoin values(null, '크루6', 'bb', 'aa', 1, 10, 0, '여');
insert into crewJoin values(null, '크루6', 'cc', 'aa', 1, 10, 0, '남');
insert into crewJoin values(null, '크루7', 'aa', 'bb', 1, 15, 0, '여');
insert into crewJoin values(null, '크루7', 'cc', 'bb', 1, 15, 0, '남');
insert into crewJoin values(null, '크루8', 'aa', 'cc', 1, 20, 0, '여');
insert into crewJoin values(null, '크루8', 'bb', 'cc', 1, 20, 0, '여');
insert into crewJoin values(null, '크루9', 'cc', 'aa', 1, 25, 0, '남');
insert into crewJoin values(null, '크루9', 'bb', 'aa', 1, 25, 0, '여');
insert into crewJoin values(null, '크루10', 'aa', 'bb', 1, 30, 0, '여');
insert into crewJoin values(null, '크루10', 'cc', 'bb', 1, 30, 0, '남');
-- 코스 데이터 베이스 -- 
create table course(
	id varchar(50) primary key not null,
    location varchar(50) not null,
    length varchar(30) not null,
    expect_time varchar(30) not null,
    difficulty varchar(30) not null,
    file_id varchar(100) not null
);

insert into course values('WalkingCrew000000001','천년 마중길 1코스','5.0km','2시간','쉬움','천년_마중길_1코스.gpx');
insert into course values('WalkingCrew000000002','경기 둘레길 파주 05코스','15.8km','5시간 10분','보통','경기_둘레길_파주_05코스.gpx');
insert into course values('WalkingCrew000000003','갈재길','11.2km','3시간 10분','보통','갈재길.gpx');
insert into course values('WalkingCrew000000004','요천생태습지 둘레길','2.0km','2시간','보통','요천생태습지_둘레길.gpx');
insert into course values('WalkingCrew000000005','풍류락도 영산가람길 1코스 나주목사 행차길','6.5km','2시간 30분','쉬움','풍류락도_영산가람길_1코스_나주목사_행차길.gpx');
insert into course values('WalkingCrew000000006','풍류락도 영산가람길 2코스 나주의 진산 금성산길','13.0km','4시간 30분','보통','풍류락도_영산가람길_2코스_나주의_진산_금성산길.gpx');
insert into course values('WalkingCrew000000009','풍류락도 영산가람길 3코스 오색풍류길','9.3km','3시간 30분','보통','풍류락도_영산가람길_3코스_오색풍류길.gpx');
insert into course values('WalkingCrew000000007','경제신화 도보길','4.4km','1시간','쉬움','경제신화_도보길.gpx');
insert into course values('WalkingCrew000000008','해남 달마고도','17.8km','7시간','어려움','해남_달마고도.gpx');
insert into course values('WalkingCrew000000010','정선 산소길 레일바이크길','12.5km','3시간','쉬움','정선_산소길_레일바이크길.gpx');
insert into course values('WalkingCrew000000011','함양 선비문화탐방로 1코스','6.0km','1시간 30분','보통','함양_선비문화탐방로_1코스(선비문화탐방간-농월정).gpx');
insert into course values('WalkingCrew000000012','강진 바스락길(남도 명품길) 인연의 길','8.0km','2시간 30분','보통','강진_바스락길(남도_명품길)_인연의_길.gpx');
insert into course values('WalkingCrew000000013','성남누비길 1구간 남한산성길','7.5km','4시간','보통','성남누비길_1구간_남한산성길.gpx');
insert into course values('WalkingCrew000000014','하동별천지길 십리벚꽃길','13.0km','3시간 30분','보통','하동별천지길_십리벚꽃길.gpx');
insert into course values('WalkingCrew000000015','인천둘레길 4코스 함봉산','6.2km','3시간','어려움','인천둘레길_4코스_함봉산.gpx');
insert into course values('WalkingCrew000000016','오산 도보여행코스 오산천길','8.0km','2시간','쉬움','오산_도보여행코스_오산천길.gpx');
insert into course values('WalkingCrew000000017','무주 예향천리 백두대간마실길 1코스','6.8km','2시간','어려움','무주_예향천리_백두대간마실길_1코스.gpx');
insert into course values('WalkingCrew000000018','밀양아리랑길 영남루 수변공원길','6.2km','3시간','쉬움','밀양아리랑길_영남루_수변공원길.gpx');
insert into course values('WalkingCrew000000019','풍류락도 영산가람길 4코스 황금들판길','7.9km','2시간 30분','보통','풍류락도_영산가람길_4코스_황금들판길.gpx');
insert into course values('WalkingCrew000000020','풍류락도 영산가람길 5코스 영산가람길','9.4km','3시간 30분','보통','풍류락도_영산가람길_5코스_영산가람길.gpx');
insert into course values('WalkingCrew000000021','풍류락도 영산가람길 6코스 유유자적 나그네길','6.2km','2시간 30분','보통','풍류락도_영산가람길_6코스_유유자적_나그네길.gpx');
insert into course values('WalkingCrew000000022','풍류락도 영산가람길 7코스 마한 고대문화길','10.3km','4시간','보통','풍류락도_영산가람길_7코스_마한_고대문화길.gpx');
insert into course values('WalkingCrew000000023','한남리 머체왓숲길','6.7km','2시간 30분','쉬움','한남리_머체왓숲길.gpx');
insert into course values('WalkingCrew000000024','한남리 머체왓숲길 소롱콧길','6.3km','2시간 30분','보통','한남리_머체왓숲길_소롱콧길.gpx');
insert into course values('WalkingCrew000000025','우이령 나들길','7.9km','2시간 30분','보통','우이령_나들길.gpx');
insert into course values('WalkingCrew000000026','여수 갯가길 밤바다 코스','6.0km','1시간 30분','쉬움','여수_갯가길_밤바다_코스.gpx');
insert into course values('WalkingCrew000000027','북악스카이웨이길','6.2km','2시간 30분','보통','북악스카이웨이길.gpx');
insert into course values('WalkingCrew000000028','새만금 바람길','12.0km','4시간','보통','새만금_바람길.gpx');
insert into course values('WalkingCrew000000029','산청백의종군로','18.9km','4시간','쉬움','산청백의종군로.gpx');
insert into course values('WalkingCrew000000030','저도 비치로드','6.5km','3시간','보통','저도_비치로드.gpx');


-- 코스 추천 개수 데이터 베이스 --
create table courseRecommend(
    user_id varchar(100),
    course_id varchar(100),
    CONSTRAINT unique_like UNIQUE (user_id,course_id)
);


insert into courseRecommend values ('aa','WalkingCrew000000030');
insert into courseRecommend values ('aa','WalkingCrew000000029');
insert into courseRecommend values ('aa','WalkingCrew000000028');
insert into courseRecommend values ('aa','WalkingCrew000000005');
insert into courseRecommend values ('aa','WalkingCrew000000009');
insert into courseRecommend values ('aa','WalkingCrew000000015');
insert into courseRecommend values ('aa','WalkingCrew000000012');
insert into courseRecommend values ('aa','WalkingCrew000000011');
insert into courseRecommend values ('aa','WalkingCrew000000027');
insert into courseRecommend values ('aa','WalkingCrew000000003');	
insert into courseRecommend values ('bb','WalkingCrew000000003');
insert into courseRecommend values ('bb','WalkingCrew000000006');
insert into courseRecommend values ('bb','WalkingCrew000000009');
insert into courseRecommend values ('bb','WalkingCrew000000012');
insert into courseRecommend values ('bb','WalkingCrew000000015');
insert into courseRecommend values ('bb','WalkingCrew000000018');
insert into courseRecommend values ('bb','WalkingCrew000000021');
insert into courseRecommend values ('bb','WalkingCrew000000024');
insert into courseRecommend values ('cc','WalkingCrew000000024');
insert into courseRecommend values ('cc','WalkingCrew000000022');
insert into courseRecommend values ('cc','WalkingCrew000000021');
insert into courseRecommend values ('cc','WalkingCrew000000001');
insert into courseRecommend values ('cc','WalkingCrew000000002');
insert into courseRecommend values ('hh','WalkingCrew000000002');
insert into courseRecommend values ('hh','WalkingCrew000000004');
insert into courseRecommend values ('hh','WalkingCrew000000008');
insert into courseRecommend values ('hh','WalkingCrew000000016');
insert into courseRecommend values ('hh','WalkingCrew000000017');
insert into courseRecommend values ('hh','WalkingCrew000000019');



-- mycourse 더미데이터 아이디와 코스명과 일정의 id값

insert into mycourse values ('aa','WalkingCrew000000030',1);
insert into mycourse values ('bb','WalkingCrew000000030',1);
insert into mycourse values ('aa','WalkingCrew000000030',5);
insert into mycourse values ('aa','WalkingCrew000000030',2);
insert into mycourse values ('aa','WalkingCrew000000030',3);
insert into mycourse values ('aa','WalkingCrew000000030',4);
insert into mycourse values ('aa','WalkingCrew000000027',4);
insert into mycourse values ('aa','WalkingCrew000000026',4);
insert into mycourse values ('aa','WalkingCrew000000022',4);
insert into mycourse values ('aa','WalkingCrew000000014',4);
