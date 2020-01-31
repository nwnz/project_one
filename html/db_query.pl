#!/usr/bin/perl -wT
        
use DBI;
        
my $host = "test-mysql"; # MySQL-сервер нашего хостинга
#my $host = "127.0.0.1";
my $port = "3306"; # порт, на который открываем соединение
my $user = "root"; # имя пользователя
my $pass = "root"; # пароль
my $db = "test"; # имя базы данных 
print "Content-type: text/plain\n\n";
#    print "Content-type: text/plain\n\n";
#print "Hello World In CGI Perl";

$dbh = DBI->connect("DBI:mysql:$db:$host:$port",$user,$pass);
$sth = $dbh->prepare("SELECT * FROM user_details"); # готовим запрос
$sth->execute; # исполняем запрос

while ($ref = $sth->fetchrow_arrayref) {
print "$$ref[0]\t";
print "$$ref[1]\t";
print "$$ref[2]\t";
print "\n" # печатаем результат
} 

$rc = $sth->finish;    
$rc = $dbh->disconnect;  # закрываемсоединение

#hello ))))
