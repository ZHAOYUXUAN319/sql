--問題37！ 49！ 50! 51! 52! 58! 64!
--わからない問題:




--問題25：全選手の以下のデータを抽出してください。
         --・背番号（uniform_num）
         --・名前（name）
         --・所属クラブ（club）
select uniform_num,name,club from players;



--問題26：グループCに所属する国をすべて抽出してください。
select * from countries where group_name = 'C';



--問題27：グループC以外に所属する国をすべて抽出してください
select * from countries where group_name <> 'C';



--問題28：2016年1月13日現在で40歳以上の選手を抽出してください。（誕生日の人を含めてください。）
select * from players where birth <= '1976-1-13';



--問題29：身長が170cm未満の選手を抽出してください。
select * from players where height < 170;



--問題30：FIFAランクが日本（46位）の前後10位に該当する国（36位～56位）を抽出してください。ただし、BETWEEN句を用いてください。
select * from countries where ranking between 36 and 56;



--問題31：選手のポジションがGK、DF、MFに該当する選手をすべて抽出してください。ただし、IN句を用いてください。
select * from players where position in ('GK','DF','MF');



--問題32：オウンゴールとなったゴールを抽出してください。goalsテーブルのplayer_idカラムにNULLが格納されているデータがオウンゴールを表しています。
select * from goals where player_id is NULL;



--問題33：オウンゴール以外のゴールを抽出してください。goalsテーブルのplayer_idカラムにNULLが格納されているデータがオウンゴールを表しています。
select * from goals where player_id is not null;



--問題34：名前の末尾が「ニョ」で終わるプレイヤーを抽出してください。
select * from players where name like  '%ニョ';



--問題35：名前の中に「ニョ」が含まれるプレイヤーを抽出してください。
select * from players where name like '%ニョ%';



--問題36：グループA以外に所属する国をすべて抽出してください。ただし、「!=」や「<>」を使わずに、「NOT」を使用してください。
select * from countries where not group_name = 'A';



--問題37：全選手の中でBMI値が20台の選手を抽出してください。BMIは以下の式で求めることができます。
--sqlの中で、２の二乗の書き方はpow(2,2) 
select * from players where weight / POW (height / 100,2) > =20 and weight / POW (height / 100,2) < 21



--問題38：全選手の中から小柄な選手（身長が165cm未満か、体重が60kg未満）を抽出してください。
select * from players where height < 165 or height < 60



--問題39：FWかMFの中で170未満の選手を抽出してください。ただし、ORとANDを使用してください。
select * from players where ( position = 'MF' or position = 'FW') and height < 170



--問題40：ポジションの一覧を重複なしで表示してください。グループ化は使用しないでください。
select distinct position from players



--問題41：全選手の身長と体重を足した値を表示してください。合わせて選手の名前、選手の所属クラブも表示してください。
select name ,club ,height + weight from players



--問題42：選手名とポジションを以下の形式で出力してください。シングルクォートに注意してください。
select
    concat(name, '選手のポジションは', position, 'です') 
from
    players;



--問題43：全選手の身長と体重を足した値をカラム名「体力指数」として表示してください。合わせて選手の名前、選手の所属クラブも表示してください。
select 
   name,club,height + weight as 体力指数
from 
    players;
    
    

--問題44：FIFAランクの高い国から順にすべての国名を表示してください。
select 
    ranking
from
    countries order by ranking;
    
    
    
--問題45：全ての選手を年齢の低い順に表示してください。なお、年齢を計算する必要はありません。
select
    * 
from
    players 
order by
    birth desc;
    
    
    
--問題46：全ての選手を身長の大きい順に表示してください。同じ身長の選手は体重の重い順に表示してください。
select
    * 
from
    players 
order by
    height desc
    , weight desc;



--問題47：全ての選手のポジションの1文字目（GKであればG、FWであればF）を出力してください。
select
    id
    , country_id
    , uniform_num
    , substring(position, 1, 1)
    , name 
from
    players;



--問題48：出場国の国名が長いものから順に出力してください。
select
    name 
from
    countries 
order by
    length(name) desc;



---問題49：全選手の誕生日を「2017年04月30日」のフォーマットで出力してください。
select
    name
    ,date_format(birth,'%y年%m月%d日') as birthday
from 
    players;
    
    
    
--問題50：全てのゴール情報を出力してください。ただし、オウンゴール（player_idがNULLのデータ）はIFNULL関数を使用してplayer_idを「9999」と表示してください。
select 
    IFNULL(player_id,9999) as player_id, goal_time
from 
    goals
    


--問題51：全てのゴール情報を出力してください。ただし、オウンゴール（player_idがNULLのデータ）はCASE関数を使用してplayer_idを「9999」と表示してください。
SELECT
    CASE 
        WHEN player_id IS NULL 
            THEN 9999 
        ELSE player_id 
        END AS player_id
    , goal_time 
FROM
    goals



--問題52：全ての選手の平均身長、平均体重を表示してください。
select
    avg(height) as 平均身長
    , avg(weight) as 平均体重
from
    players;



--問題53：日本の選手（player_idが714から736）が上げたゴール数を表示してください。
select
    count(id) as 日本のゴール数 
from
    goals 
where
    player_id between 714 and 736;



--問題54：オウンゴール（player_idがNULL）以外の総ゴール数を表示してください。ただし、WHERE句は使用しないでください。
SELECT
    COUNT(player_id) AS オウンゴール以外のゴール数 
FROM
    goals;



--問題55：全ての選手の中で最も高い身長と、最も重い体重を表示してください。
select
    max(height) as 最も高い身長
    , max(weight) as 最も重い体重 
from
    players;



--問題56：AグループのFIFAランク最上位を表示してください。
SELECT
    MIN(ranking) AS AグループのFIFAランク最上位 
FROM
    countries 
WHERE
    group_name = 'A';



--問題57：CグループのFIFAランクの合計値を表示してください。
select
    sum(ranking) as CグループのFIFAランクの合計値 
from
    countries 
where
    group_name = 'C';



--問題58：全ての選手の所属国と名前、背番号を表示してください。
SELECT c.name, p.name, p.uniform_num
FROM players p
JOIN countries c ON c.id = p.country_id



--問題59：全ての試合の国名と選手名、得点時間を表示してください。オウンゴール（player_idがNULL）は表示しないでください。

SELECT c.name, p.name, g.goal_time
FROM goals g
JOIN players p ON g.player_id = p.id
JOIN countries c ON p.country_id = c.id



--問題60：全ての試合のゴール時間と選手名を表示してください。左側外部結合を使用してオウンゴール（player_idがNULL）も表示してください
SELECT g.goal_time, p.name
FROM goals g
LEFT JOIN players p ON g.player_id = p.id



--問題61：全ての試合のゴール時間と選手名を表示してください。右側外部結合を使用してオウンゴール（player_idがNULL）も表示してください。
select g.goal_time, p.name
from players p
right join goals g ON g.player_id = p.id



--問題62：全ての試合のゴール時間と選手名、国名を表示してください。また、オウンゴール（player_idがNULL）も表示してください。
SELECT c.name , g.goal_time,  p.name
FROM goals g
LEFT JOIN players p ON g.player_id = p.id
LEFT JOIN countries c ON p.country_id = c.id

SELECT c.name AS country_name, g.goal_time, p.position, p.name AS player_name
FROM goals g
LEFT JOIN players p ON g.player_id = p.id
LEFT JOIN countries c ON p.country_id = c.id



--問題63：全ての試合のキックオフ時間と対戦国の国名を表示してください。
SELECT
    p.kickoff
    , mc.name AS my_country
    , ec.name AS enemy_country 
FROM
    pairings p JOIN countries mc 
        ON mc.id = my_country_id JOIN countries ec 
        on ec.id = enemy_country_id




--問題64：全てのゴール時間と得点を上げたプレイヤー名を表示してください。オウンゴールは表示しないでください。ただし、結合は使わずに副問合せを用いてください。
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



--問題65：全てのゴール時間と得点を上げたプレイヤー名を表示してください。オウンゴールは表示しないでください。ただし、副問合せは使わずに、結合を用いてください。
SELECT
    
    g.goal_time
    , p.name 
FROM
    goals g JOIN players p 
        ON p.id = g.player_id



--問題66：各ポジションごと（GK、FWなど）に最も身長と、その選手名、所属クラブを表示してください。ただし、FROM句に副問合せを使用してください
SELECT
    p1.position
    , p1.最大身長
    , p2.name
    , p2.club 
FROM
    ( 
        SELECT
            position
            , MAX(height) AS 最大身長 
        FROM
            players 
        GROUP BY
            position
    ) p1 
    LEFT JOIN players p2 
        ON p1.最大身長 = p2.height 
        AND p1.position = p2.position



--問題67：各ポジションごと（GK、FWなど）に最も身長と、その選手名を表示してください。ただし、SELECT句に副問合せを使用してください。
SELECT
    p1.position
    , MAX(p1.height) AS 最大身長
    , ( 
        SELECT
            p2.name 
        FROM
            players p2 
        WHERE
            MAX(p1.height) = p2.height 
            AND p1.position = p2.position
    ) AS 名前 
FROM
    players p1 
GROUP BY
    p1.position



--問題68：全選手の平均身長より低い選手をすべて抽出してください。表示する列は、背番号、ポジション、名前、身長としてください。
select
    uniform_num
    , position
    , name
    , height 
from
    players 
where
    height < (select avg(height) from players)



--問題69：各グループの最上位と最下位を表示し、その差が50より大きいグループを抽出してください。
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



--問題70：1980年生まれと、1981年生まれの選手が何人いるか調べてください。ただし、日付関数は使用せず、UNION句を使用してください。
SELECT
    '1980' AS 誕生年
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



--問題71：身長が195㎝より大きいか、体重が95kgより大きい選手を抽出してください。ただし、以下の画像のように、どちらの条件にも合致する場合には2件分のデータとして抽出してください。また、結果はidの昇順としてください。
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

