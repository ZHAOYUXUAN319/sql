--���37�I




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

