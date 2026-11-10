PART_1

ANSWER_1: Hindi na-open ng Course Materials Portal yung config file niya na /etc/course-portal/portal.conf kasi permission denied, base sa log.

ANSWER_2: Yung permissions ng file is -rw------- na pag ginawang octal ay 600: yung owner may read at write (6), pero yung group at others wala talagang access (0 both). Si root yung owner ng file, at course-portal naman yung group niya. Member si course-portal ng group na yun (gid 995), pero hindi siya yung owner. Kaya kahit member siya ng group, wala pa rin siyang access kasi zero yung permission ng group.

ANSWER_3: 640
ANSWER_3_WHY: Sa 400, read lang ang meron si root, wala pa ring makukuha si course-portal kasi zero pa rin ang group. Sa 755, may read and execute na yung group pero sobra na kasi may access na rin yung "others" (lahat ng ibang users), tapos hindi naman kailangan ng execute sa config file. Sa 777, lahat (owner, group, others) may full access na, sobrang sobra na. Yung 640 lang yung sapat — group makakabasa na, pero hindi nadagdagan yung access ng ibang tao.

ANSWER_4_ORDER: B, G, E, D, F, A, I, C, H

ANSWER_5: Kapag 777, kahit sino sa system, hindi lang si course-portal, pwede na mag-edit o baguhin (write) ng config file, delikado kasi kahit sino makakapasok.

ANSWER_6: Kailangan tignan ulit yung /var/log/course-portal/app.log para makita kung wala na yung "permission denied" error — para makumpirma na na-open na talaga ng application yung file, hindi lang na nag-work yung chmod command.

ANSWER_7_BRIDGE: component=part ng permissions/config, detect=may automatic na monitoring na nagbabantay sa error logs, recover=automatic na aayos ulit ng tamang permissions, proof=health check o test request para makita kung gumagana na talaga ang service

PART_2

The server-level failure happened in the configuration/permissions component. A larger system needs log monitoring to detect it, automated remediation to recover from it, and a health check to prove that users are served again.