
-- actualizar (saldo) de los (cliente)

declare @NumCliente smallint
declare @saldo smallint

set @NumCliente=99
set @saldo=1000

begin try
	begin tran
	if exists (select* from Cliente where NumCliente=@NumCliente)
		begin
			update Cliente set Saldo1=case 
			when Saldo1-@saldo<0 then 0 
			else Saldo1-@saldo end where NumCliente=@NumCliente			
      
			Select* from Cliente
			where Cliente.NumCliente=@NumCliente
			commit tran
		end
	else
		print 'Cliente no existe'
end try

begin catch
	rollback tran
	select @@error
end catch