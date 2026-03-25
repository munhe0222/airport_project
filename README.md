# airport_project

Энэхүү төсөл нь "Airport Management System" системийн өгөгдлийн санг зохион байгуулсан болно.
Систем нь дараах үндсэн хүснэгтүүдээс бүрдэнэ:
* **Table 1: aircrafts** - Онгоцны мэдээлэл
* **Table 2: flights** - Нислэгийн мэдээлэл
* **Table 3: passengers** - Зорчигчийн мэдээлэл
* **Table 4: tickets** - Тасалбарын мэдээлэл
Эдгээр хүснэгтүүд нь хоорондоо Foreign Key холбоотой бөгөөд өгөгдлийн бүрэн бүтэн байдлыг хангасан.

##  Ашиглах заавар 
Дараах дарааллаар ажиллуулна:
1. MySQL server ажиллаж байгаа эсэхийг шалгана.
2. `mysqlScript.sql` файлыг нээнэ.
3. Бүх кодыг нэг дор ажиллуулна.

##  4-р хэсэг: Аюулгүй байдал (Theory)
1. **Strong Password:** Том жижиг үсэг, тоо, тэмдэгт хосолсон, урт (8+ тэмдэгт) нууц үг.
2. **SQL Injection:** Хортой SQL код оруулж database-д зөвшөөрөлгүй хандах халдлага.
3. **Хамгаалах аргууд:** Prepared statement ашиглах, Хэрэглэгчийн эрхийг хязгаарлах.

##  6-р хэсэг: Backup & Restore
- **Backup:** `mysqldump -u root -p airport_db > airport_db_backup.sql`
- **Restore:** `mysql -u root -p airport_db < airport_db_backup.sql`

##  Ажиллуулсан нотолгоо (MySQL CLI)
![proof](![alt text](image.png))

## Файлын бүтэц
project
 ├── mysqlScript.sql
 └── README.md

## 👨‍🎓 Оюутны мэдээлэл
- **Нэр:** [Munkh-erdene]
- **Код:** [B242270124]
- **GitHub Repository:** [Энд GitHub линкээ оруулна]
