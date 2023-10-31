declare cur_dropProc cursor  
scroll for  
select [name] from sysobjects where xtype='p'  

open cur_dropProc  
go  
Declare @procName varchar(500)  
fetch first from cur_dropProc into @procName  
while @@fetch_status=0  
begin  
Exec('drop procedure ' + @procName)  
fetch next from cur_dropProc into @procName  
end  
go  
close cur_dropProc  
go  
deallocate  cur_dropProc