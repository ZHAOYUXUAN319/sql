--���37�I 49�I 50! 51! 52! 58! 64!
--�킩��Ȃ����:23 22
--�����Ɗ֌W����SQL�����ׂĎ��s�o���Ȃ�18,19�A20,21�Ƃ�


--���1�F�e�O���[�v�̒���FIFA�����N���ł��������ƒႢ���̃����L���O�ԍ���\�����Ă��������B
SELECT
    group_name AS �O���[�v
    , MIN(ranking) AS �����L���O�ŏ��
    , MAX(ranking) AS �����L���O�ŉ��� 
FROM
    countries 
GROUP BY
    group_name
    
    

--���2�F�S�S�[���L�[�p�[�̕��ϐg���A���ϑ̏d��\�����Ă�������
select avg(height) as ���ϐg��, avg(weight) as ���ϑ̏d from players



--���3�F�e���̕��ϐg�������������珇�ɕ\�����Ă��������B�������AFROM���countries�e�[�u���Ƃ��Ă��������B
select
    countries.name
    , avg(players.height) 
from
    countries join players 
        on countries.id = players.country_id 
group by
    countries.id
    , countries.name 
order by
    avg(players.height) desc



--���4�F�e���̕��ϐg�������������珇�ɕ\�����Ă��������B�������AFROM���players�e�[�u���Ƃ��āA�e�[�u���������g�킸���⍇����p���Ă��������B
SELECT
    ( 
        SELECT
            c.name 
        FROM
            countries c 
        WHERE
            p.country_id = c.id
    ) AS ����
    , AVG(p.height) AS ���ϐg�� 
FROM
    players p 
GROUP BY
    p.country_id 
ORDER BY
    AVG(p.height) DESC



--���5�F�L�b�N�I�t�����Ƒΐ퍑�̍������L�b�N�I�t�����̑������̂��珇�ɕ\�����Ă�������
SELECT
    kickoff AS �L�b�N�I�t����
    , c1.name AS ����1
    , c2.name AS ����2 
FROM
    pairings p 
    LEFT JOIN countries c1 
        ON p.my_country_id = c1.id 
    LEFT JOIN countries c2 
        ON p.enemy_country_id = c2.id 
ORDER BY
    kickoff
    
    

--���6�F���ׂĂ̑I���ΏۂƂ��đI�育�Ƃ̓��_�����L���O��\�����Ă��������B�iSELECT��ŕ��⍇�����g�����Ɓj
SELECT p.name AS ���O, p.position AS �|�W�V����, p.club AS �����N���u, 
    (SELECT COUNT(id) FROM goals g WHERE g.player_id = p.id) AS �S�[����
FROM players p
ORDER BY �S�[���� DESC



--���7�F���ׂĂ̑I���ΏۂƂ��đI�育�Ƃ̓��_�����L���O��\�����Ă��������B�i�e�[�u���������g�����Ɓj
SELECT
    p.name AS ���O
    , p.position AS �|�W�V����
    , p.club AS �����N���u
    , COUNT(g.id) AS �S�[���� 
FROM
    players p 
    LEFT JOIN goals g 
        ON g.player_id = p.id 
GROUP BY
    p.id
    , p.name
    , p.position
    , p.club 
ORDER BY
    �S�[���� DESC



--���8�F�e�|�W�V�������Ƃ̑����_��\�����Ă��������B
select
    p.position
    , count(g.id) 
from
    players p 
    left join goals g 
        on p.id = g.player_id 
group by
    p.position



--���9�F���[���h�J�b�v�J�Ó����i2014-06-13�j�̔N����v���C���[���ɕ\������B
SELECT
    birth
    , TIMESTAMPDIFF(YEAR, birth, '2014-06-13') AS age
    , name
    , position 
FROM
    players 
ORDER BY
    age DESC;


--���10�F�I�E���S�[���̉񐔂�\������
SELECT
    COUNT(g.goal_time) 
FROM
    goals g 
WHERE
    g.player_id IS NULL;



--���11�F�e�O���[�v���Ƃ̑����_����\�����ĉ������B
SELECT
    c.group_name
    , count(g.id) 
FROM
    goals g 
    LEFT JOIN pairings p 
        ON p.id = g.pairing_id 
    LEFT JOIN countries c 
        ON p.my_country_id = c.id 
WHERE
    p.kickoff BETWEEN '2014-06-13 0:00:00' AND '2014-06-27 23:59:59' 
GROUP BY
    c.group_name



--���12�F���{VS�R�����r�A��ipairings.id = 103�j�ł̃R�����r�A�̓��_�̃S�[�����Ԃ�\�����Ă�������
SELECT
    goal_time 
FROM
    goals 
WHERE
    pairing_id = 103



--���13�F���{VS�R�����r�A��̏��s��\�����ĉ������B

SELECT c.name, COUNT(g.goal_time)
FROM goals g
LEFT JOIN pairings p ON p.id = g.pairing_id
LEFT JOIN countries c ON p.my_country_id = c.id 
WHERE p.id = 103 OR p.id = 39
GROUP BY c.name


select * from countries as ��;
select * from pairings as �����;
select * from goals as �_�����;



--���14�F�O���[�vC�̊e�ΐ했�ɃS�[������\�����Ă�������
SELECT p1.kickoff, c1.name AS my_country, c2.name AS enemy_country,
    c1.ranking AS my_ranking, c2.ranking AS enemy_ranking,
    COUNT(g1.id) AS my_goals
FROM pairings p1
LEFT JOIN countries c1 ON c1.id = p1.my_country_id
LEFT JOIN countries c2 ON c2.id = p1.enemy_country_id
LEFT JOIN goals g1 ON p1.id = g1.pairing_id
WHERE c1.group_name = 'C' AND c2.group_name = 'C'
GROUP BY p1.kickoff, c1.name, c2.name, c1.ranking, c2.ranking
ORDER BY p1.kickoff, c1.ranking



--���15�F�O���[�vC�̊e�ΐ했�ɃS�[������\�����Ă��������B
--���P�S�Ɠ���



--���16�F�O���[�vC�̊e�ΐ했�ɃS�[������\�����Ă��������B
SELECT p1.kickoff, c1.name AS my_country, c2.name AS enemy_country, 
    c1.ranking AS my_ranking, c2.ranking AS enemy_ranking,
   
    (SELECT COUNT(g1.id) FROM goals g1 WHERE p1.id = g1.pairing_id) AS my_goals,
    (
        SELECT COUNT(g2.id) 
        FROM goals g2 
        LEFT JOIN pairings p2 ON p2.id = g2.pairing_id
        WHERE p2.my_country_id = p1.enemy_country_id AND p2.enemy_country_id = p1.my_country_id
    ) AS enemy_goals
FROM pairings p1
LEFT JOIN countries c1 ON c1.id = p1.my_country_id
LEFT JOIN countries c2 ON c2.id = p1.enemy_country_id
WHERE c1.group_name = 'C' AND c2.group_name = 'C'
ORDER BY p1.kickoff, c1.ranking



--���17�F���16�̌��ʂɓ����_����ǉ����Ă��������B
SELECT p1.kickoff, c1.name AS my_country, c2.name AS enemy_country, 
    c1.ranking AS my_ranking, c2.ranking AS enemy_ranking,
    (SELECT COUNT(g1.id) FROM goals g1 WHERE p1.id = g1.pairing_id) AS my_goals,
    (
        SELECT COUNT(g2.id) 
        FROM goals g2 
        LEFT JOIN pairings p2 ON p2.id = g2.pairing_id
        WHERE p2.my_country_id = p1.enemy_country_id AND p2.enemy_country_id = p1.my_country_id
    ) AS enemy_goals,
    -- �ǉ���������
    (SELECT COUNT(g1.id) FROM goals g1 WHERE p1.id = g1.pairing_id) - ( 
        SELECT COUNT(g2.id) 
        FROM goals g2 
        LEFT JOIN pairings p2 ON p2.id = g2.pairing_id
        WHERE p2.my_country_id = p1.enemy_country_id AND p2.enemy_country_id = p1.my_country_id
    ) AS goal_diff
    -- �ǉ������܂�
FROM pairings p1
LEFT JOIN countries c1 ON c1.id = p1.my_country_id
LEFT JOIN countries c2 ON c2.id = p1.enemy_country_id
WHERE c1.group_name = 'C' AND c2.group_name = 'C'
ORDER BY p1.kickoff, c1.ranking



--���18�F�u���W���imy_country_id = 1�j�΃N���A�`�A�ienemy_country_id = 4�j��̃L�b�N�I�t���ԁi���n���ԁj��\�����Ă��������B
SELECT
    p.kickoff
    , p.kickoff - cast('12 hours' as INTERVAL) AS kickoff_jp 
FROM
    pairings p 
WHERE
    p.my_country_id = 1 
    AND p.enemy_country_id = 4;


--���19�F�N��Ƃ̑I�萔��\�����Ă��������B�i�N��̓��[���h�J�b�v�J�Ó����ł���2014-06-13���g���ĎZ�o���Ă��������B�j
select
    date_part('year', AGE('2014-06-13', birth)) as age
    , COUNT(id) AS player_count 
FROM
    players 
GROUP BY
    age 
order by
    age



--���20�F�N��Ƃ̑I�萔��\�����Ă��������B�������A10�Ζ��ɍ��Z���ĕ\�����Ă��������B
select
    count(date_part('year', AGE('2014-06-13', birth)) between 10 and 20) as age,
    COUNT(id) AS player_count 
FROM
    players 
    where 
    date_part('year', AGE('2014-06-13', birth)) between 10 and 20 
order by
    age
    
    

    select
        date_part('year', AGE('2014-06-13', birth)) as age
        , COUNT(id)AS player_count 
    FROM
        players where 
        date_part('year', AGE('2014-06-13', birth)) between 10 and 19 
    GROUP BY
        age 
    order by
        age



---���21�F�N��Ƃ̑I�萔��\�����Ă��������B�������A5�Ζ��ɍ��Z���ĕ\�����Ă��������B



--���22�F�ȉ��̏�����SQL���쐬���A���o���ꂽ���ʂ����Ƃɂǂ̂悤�ȌX�������邩�l���Ă݂Ă��������B
SELECT FLOOR(TIMESTAMPDIFF(YEAR, birth, '2014-06-13') / 5) * 5   AS age, position, COUNT(id) AS player_count, AVG(height), AVG(weight)
FROM players 
GROUP BY age, position
ORDER BY age, position



--���23�F�g���̍����I��x�X�g5�𒊏o���A�ȉ��̍��ڂ�\�����Ă��������B
SELECT name, height, weight
FROM players
ORDER BY height DESC
LIMIT 5



--���24�F�g���̍����I��6�ʁ`20�ʂ𒊏o���A�ȉ��̍��ڂ�\�����Ă��������B
SELECT name, height, weight
FROM players
ORDER BY height DESC
LIMIT (5) offset (15)




--���25�F�S�I��̈ȉ��̃f�[�^�𒊏o���Ă��������B
         --�E�w�ԍ��iuniform_num�j
         --�E���O�iname�j
         --�E�����N���u�iclub�j
select uniform_num,name,club from players;



--���26�F�O���[�vC�ɏ������鍑�����ׂĒ��o���Ă��������B
select * from countries where group_name = 'C';



--���27�F�O���[�vC�ȊO�ɏ������鍑�����ׂĒ��o���Ă�������
select * from countries where group_name <> 'C';



--���28�F2016�N1��13�����݂�40�Έȏ�̑I��𒊏o���Ă��������B�i�a�����̐l���܂߂Ă��������B�j
select * from players where birth <= '1976-1-13';



--���29�F�g����170cm�����̑I��𒊏o���Ă��������B
select * from players where height < 170;



--���30�FFIFA�����N�����{�i46�ʁj�̑O��10�ʂɊY�����鍑�i36�ʁ`56�ʁj�𒊏o���Ă��������B�������ABETWEEN���p���Ă��������B
select * from countries where ranking between 36 and 56;



--���31�F�I��̃|�W�V������GK�ADF�AMF�ɊY������I������ׂĒ��o���Ă��������B�������AIN���p���Ă��������B
select * from players where position in ('GK','DF','MF');



--���32�F�I�E���S�[���ƂȂ����S�[���𒊏o���Ă��������Bgoals�e�[�u����player_id�J������NULL���i�[����Ă���f�[�^���I�E���S�[����\���Ă��܂��B
select * from goals where player_id is NULL;



--���33�F�I�E���S�[���ȊO�̃S�[���𒊏o���Ă��������Bgoals�e�[�u����player_id�J������NULL���i�[����Ă���f�[�^���I�E���S�[����\���Ă��܂��B
select * from goals where player_id is not null;



--���34�F���O�̖������u�j���v�ŏI���v���C���[�𒊏o���Ă��������B
select * from players where name like  '%�j��';



--���35�F���O�̒��Ɂu�j���v���܂܂��v���C���[�𒊏o���Ă��������B
select * from players where name like '%�j��%';



--���36�F�O���[�vA�ȊO�ɏ������鍑�����ׂĒ��o���Ă��������B�������A�u!=�v��u<>�v���g�킸�ɁA�uNOT�v���g�p���Ă��������B
select * from countries where not group_name = 'A';



--���37�F�S�I��̒���BMI�l��20��̑I��𒊏o���Ă��������BBMI�͈ȉ��̎��ŋ��߂邱�Ƃ��ł��܂��B
--sql�̒��ŁA�Q�̓��̏�������pow(2,2) 
select * from players where weight / POW (height / 100,2) > =20 and weight / POW (height / 100,2) < 21



--���38�F�S�I��̒����珬���ȑI��i�g����165cm�������A�̏d��60kg�����j�𒊏o���Ă��������B
select * from players where height < 165 or height < 60



--���39�FFW��MF�̒���170�����̑I��𒊏o���Ă��������B�������AOR��AND���g�p���Ă��������B
select * from players where ( position = 'MF' or position = 'FW') and height < 170



--���40�F�|�W�V�����̈ꗗ���d���Ȃ��ŕ\�����Ă��������B�O���[�v���͎g�p���Ȃ��ł��������B
select distinct position from players



--���41�F�S�I��̐g���Ƒ̏d�𑫂����l��\�����Ă��������B���킹�đI��̖��O�A�I��̏����N���u���\�����Ă��������B
select name ,club ,height + weight from players



--���42�F�I�薼�ƃ|�W�V�������ȉ��̌`���ŏo�͂��Ă��������B�V���O���N�H�[�g�ɒ��ӂ��Ă��������B
select
    concat(name, '�I��̃|�W�V������', position, '�ł�') 
from
    players;



--���43�F�S�I��̐g���Ƒ̏d�𑫂����l���J�������u�̗͎w���v�Ƃ��ĕ\�����Ă��������B���킹�đI��̖��O�A�I��̏����N���u���\�����Ă��������B
select 
   name,club,height + weight as �̗͎w��
from 
    players;
    
    

--���44�FFIFA�����N�̍��������珇�ɂ��ׂĂ̍�����\�����Ă��������B
select 
    ranking
from
    countries order by ranking;
    
    
    
--���45�F�S�Ă̑I���N��̒Ⴂ���ɕ\�����Ă��������B�Ȃ��A�N����v�Z����K�v�͂���܂���B
select
    * 
from
    players 
order by
    birth desc;
    
    
    
--���46�F�S�Ă̑I���g���̑傫�����ɕ\�����Ă��������B�����g���̑I��͑̏d�̏d�����ɕ\�����Ă��������B
select
    * 
from
    players 
order by
    height desc
    , weight desc;



--���47�F�S�Ă̑I��̃|�W�V������1�����ځiGK�ł����G�AFW�ł����F�j���o�͂��Ă��������B
select
    id
    , country_id
    , uniform_num
    , substring(position, 1, 1)
    , name 
from
    players;



--���48�F�o�ꍑ�̍������������̂��珇�ɏo�͂��Ă��������B
select
    name 
from
    countries 
order by
    length(name) desc;



---���49�F�S�I��̒a�������u2017�N04��30���v�̃t�H�[�}�b�g�ŏo�͂��Ă��������B
select
    name
    ,date_format(birth,'%y�N%m��%d��') as birthday
from 
    players;
    
    
    
--���50�F�S�ẴS�[�������o�͂��Ă��������B�������A�I�E���S�[���iplayer_id��NULL�̃f�[�^�j��IFNULL�֐����g�p����player_id���u9999�v�ƕ\�����Ă��������B
select 
    IFNULL(player_id,9999) as player_id, goal_time
from 
    goals
    


--���51�F�S�ẴS�[�������o�͂��Ă��������B�������A�I�E���S�[���iplayer_id��NULL�̃f�[�^�j��CASE�֐����g�p����player_id���u9999�v�ƕ\�����Ă��������B
SELECT
    CASE 
        WHEN player_id IS NULL 
            THEN 9999 
        ELSE player_id 
        END AS player_id
    , goal_time 
FROM
    goals



--���52�F�S�Ă̑I��̕��ϐg���A���ϑ̏d��\�����Ă��������B
select
    avg(height) as ���ϐg��
    , avg(weight) as ���ϑ̏d
from
    players;



--���53�F���{�̑I��iplayer_id��714����736�j���グ���S�[������\�����Ă��������B
select
    count(id) as ���{�̃S�[���� 
from
    goals 
where
    player_id between 714 and 736;



--���54�F�I�E���S�[���iplayer_id��NULL�j�ȊO�̑��S�[������\�����Ă��������B�������AWHERE��͎g�p���Ȃ��ł��������B
SELECT
    COUNT(player_id) AS �I�E���S�[���ȊO�̃S�[���� 
FROM
    goals;



--���55�F�S�Ă̑I��̒��ōł������g���ƁA�ł��d���̏d��\�����Ă��������B
select
    max(height) as �ł������g��
    , max(weight) as �ł��d���̏d 
from
    players;



--���56�FA�O���[�v��FIFA�����N�ŏ�ʂ�\�����Ă��������B
SELECT
    MIN(ranking) AS A�O���[�v��FIFA�����N�ŏ�� 
FROM
    countries 
WHERE
    group_name = 'A';



--���57�FC�O���[�v��FIFA�����N�̍��v�l��\�����Ă��������B
select
    sum(ranking) as C�O���[�v��FIFA�����N�̍��v�l 
from
    countries 
where
    group_name = 'C';



--���58�F�S�Ă̑I��̏������Ɩ��O�A�w�ԍ���\�����Ă��������B
SELECT c.name, p.name, p.uniform_num
FROM players p
JOIN countries c ON c.id = p.country_id



--���59�F�S�Ă̎����̍����ƑI�薼�A���_���Ԃ�\�����Ă��������B�I�E���S�[���iplayer_id��NULL�j�͕\�����Ȃ��ł��������B

SELECT c.name, p.name, g.goal_time
FROM goals g
JOIN players p ON g.player_id = p.id
JOIN countries c ON p.country_id = c.id



--���60�F�S�Ă̎����̃S�[�����ԂƑI�薼��\�����Ă��������B�����O���������g�p���ăI�E���S�[���iplayer_id��NULL�j���\�����Ă�������
SELECT g.goal_time, p.name
FROM goals g
LEFT JOIN players p ON g.player_id = p.id



--���61�F�S�Ă̎����̃S�[�����ԂƑI�薼��\�����Ă��������B�E���O���������g�p���ăI�E���S�[���iplayer_id��NULL�j���\�����Ă��������B
select g.goal_time, p.name
from players p
right join goals g ON g.player_id = p.id



--���62�F�S�Ă̎����̃S�[�����ԂƑI�薼�A������\�����Ă��������B�܂��A�I�E���S�[���iplayer_id��NULL�j���\�����Ă��������B
SELECT c.name , g.goal_time,  p.name
FROM goals g
LEFT JOIN players p ON g.player_id = p.id
LEFT JOIN countries c ON p.country_id = c.id

SELECT c.name AS country_name, g.goal_time, p.position, p.name AS player_name
FROM goals g
LEFT JOIN players p ON g.player_id = p.id
LEFT JOIN countries c ON p.country_id = c.id



--���63�F�S�Ă̎����̃L�b�N�I�t���ԂƑΐ퍑�̍�����\�����Ă��������B
SELECT
    p.kickoff
    , mc.name AS my_country
    , ec.name AS enemy_country 
FROM
    pairings p JOIN countries mc 
        ON mc.id = my_country_id JOIN countries ec 
        on ec.id = enemy_country_id




--���64�F�S�ẴS�[�����ԂƓ��_���グ���v���C���[����\�����Ă��������B�I�E���S�[���͕\�����Ȃ��ł��������B�������A�����͎g�킸�ɕ��⍇����p���Ă��������B
SELECT
    g.id
    , g.goal_time
    , ( 
        SELECT
            p.name 
        FROM
            players p 
        WHERE
            p.id = g.player_id
    ) AS player_name 
FROM
    goals g 
WHERE
    g.player_id IS NOT NULL



--���65�F�S�ẴS�[�����ԂƓ��_���グ���v���C���[����\�����Ă��������B�I�E���S�[���͕\�����Ȃ��ł��������B�������A���⍇���͎g�킸�ɁA������p���Ă��������B
SELECT
    
    g.goal_time
    , p.name 
FROM
    goals g JOIN players p 
        ON p.id = g.player_id



--���66�F�e�|�W�V�������ƁiGK�AFW�Ȃǁj�ɍł��g���ƁA���̑I�薼�A�����N���u��\�����Ă��������B�������AFROM��ɕ��⍇�����g�p���Ă�������
SELECT
    p1.position
    , p1.�ő�g��
    , p2.name
    , p2.club 
FROM
    ( 
        SELECT
            position
            , MAX(height) AS �ő�g�� 
        FROM
            players 
        GROUP BY
            position
    ) p1 
    LEFT JOIN players p2 
        ON p1.�ő�g�� = p2.height 
        AND p1.position = p2.position



--���67�F�e�|�W�V�������ƁiGK�AFW�Ȃǁj�ɍł��g���ƁA���̑I�薼��\�����Ă��������B�������ASELECT��ɕ��⍇�����g�p���Ă��������B
SELECT
    p1.position
    , MAX(p1.height) AS �ő�g��
    , ( 
        SELECT
            p2.name 
        FROM
            players p2 
        WHERE
            MAX(p1.height) = p2.height 
            AND p1.position = p2.position
    ) AS ���O 
FROM
    players p1 
GROUP BY
    p1.position



--���68�F�S�I��̕��ϐg�����Ⴂ�I������ׂĒ��o���Ă��������B�\�������́A�w�ԍ��A�|�W�V�����A���O�A�g���Ƃ��Ă��������B
select
    uniform_num
    , position
    , name
    , height 
from
    players 
where
    height < (select avg(height) from players)



--���69�F�e�O���[�v�̍ŏ�ʂƍŉ��ʂ�\�����A���̍���50���傫���O���[�v�𒊏o���Ă��������B
SELECT
    group_name
    , MAX(ranking)
    , MIN(ranking) 
FROM
    countries 
GROUP BY
    group_name 
HAVING
    MAX(ranking) - MIN(ranking) > 50



--���70�F1980�N���܂�ƁA1981�N���܂�̑I�肪���l���邩���ׂĂ��������B�������A���t�֐��͎g�p�����AUNION����g�p���Ă��������B
SELECT
    '1980' AS �a���N
    , COUNT(id) 
FROM
    players 
WHERE
    birth BETWEEN '1980-1-1' AND '1980-12-31' 
UNION 
SELECT
    '1981'
    , COUNT(id) 
FROM
    players 
WHERE
    birth BETWEEN '1981-1-1' AND '1981-12-31'



--���71�F�g����195�p���傫�����A�̏d��95kg���傫���I��𒊏o���Ă��������B�������A�ȉ��̉摜�̂悤�ɁA�ǂ���̏����ɂ����v����ꍇ�ɂ�2�����̃f�[�^�Ƃ��Ē��o���Ă��������B�܂��A���ʂ�id�̏����Ƃ��Ă��������B
SELECT
    id
    , position
    , name
    , height
    , weight 
FROM
    players 
WHERE
    height > 195 
UNION ALL 
SELECT
    id
    , position
    , name
    , height
    , weight 
FROM
    players 
WHERE
    weight > 95 
ORDER BY
    id

