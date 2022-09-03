// Algoritmo para gerir o Stock e as vendas da empresa Gar Alimentar
// Autores: Igildo Cassoma, Adriano Mateus, Florência Joaquim, Jesus Horácio,Emanuel Diatshambo Djuma

//Declaração das variaveis globais
literal area,vend,administrativa,contabilidade
inteiro cont,f, maxVenda<-1000
real arec_geral,luc_geral

// DECLARAÇÃO DOS REGISTOS, PROCEDIMENTOS E FUNÇÕES

// Declaração do registo do preço
registo tpreco
	real precodecompra,precodevenda
fimregisto
//Registo da data de caducidade
registo caducidade
	inteiro dia,mes,ano
fimregisto
//Registo da quantidade de stock
registo tquantidade
	inteiro quantidade,qminima_stock
fimregisto
//Registo do produto
registo produto
    literal codigo,nome,tipo
    caducidade data_caducidade
    tpreco preco 
    tquantidade quant
fimregisto
//Registo do tipo valor,valor por pagar e valor pago
registo tvalor
	real vporpagar,vpago,troco
fimregisto
//Registo da venda do produto
registo venda
	literal codigo,nomecliente,datavenda
	inteiro quantproduto
	tvalor valor
	real arec_tipo
fimregisto

//Registo do stock de produtos
registo stock
	produto produtos_stock [50]
	inteiro qtd_stock
fimregisto
//Registo da venda, venda máxima e quantidades de venda
registo RegVenda
	venda vendas[maxVenda]
	inteiro qtd_vendas
fimregisto
    //Declaração da variavel hiper que é do tipo stock
	stock hiper
	// Dclaração da variavel vender que é do tipo Regvenda
	RegVenda vender
//Função do stock esgotado
funcao logico stock_esgotado (stock hiper)
	se hiper.qtd_stock=0 entao
	   retorne verdadeiro
	fimse	
	retorne falso
fimfuncao
//Função do Stock cheio
funcao logico stock_cheio (stock p)
	se hiper.qtd_stock=50 entao
	   retorne verdadeiro
	fimse	
	retorne falso
fimfuncao
//Função para criar Stock
funcao inteiro criar_stock (stock hiper)
	hiper.qtd_stock<-0
	retorne 1
fimfuncao
//Função quando não tiver nada no registo de venda
funcao logico sem_vendas (RegVenda vender)
    se vender.qtd_vendas=0 entao
       retorne verdadeiro
    fimse
    retorne falso	
fimfuncao
//Função para registar o produto
funcao logico regista_prod (stock hiper)
    inteiro i
    literal codig
    faca
    limpatela
       escreva "\n\t ---------------------------------- REGISTAR PRODUTO ---------------------------------"
       escreva "\nNome do Produto:"
       leia hiper.produtos_stock [hiper.qtd_stock].nome
       escreva "\nCódigo do produto: "
       leia codig
       para i de 1 ate hiper.qtd_stock aumentando 1
	        se StrCmpIg (codig,hiper.produtos_stock [i-1].codigo)=0 ou strIsVazia (codig)=verdadeiro entao
	            escreva "\n O código já existe ou nada introduzido"
	            faca
	                escreva "\n O código já existe ou nada introduzido, Instiste novamente ou pressione 0 para sair"	
	            enquanto(StrCmpIg (codig,hiper.produtos_stock [i-1].codigo)=0 ou strIsVazia (codig)=verdadeiro ou codig<>"0")
	        fimse
       fimpara
       hiper.produtos_stock[i-1].codigo<-codig
       escreva "\nTipo de produto:"
       leia hiper.produtos_stock [hiper.qtd_stock].tipo
       faca
       escreva "Data de caducidade\n"
       escreva "\ndigite o dia:"
       leia hiper.produtos_stock [hiper.qtd_stock].data_caducidade.dia 
       se hiper.produtos_stock [hiper.qtd_stock].data_caducidade.dia>31 ou hiper.produtos_stock [hiper.qtd_stock].data_caducidade.dia<=0 entao
       	  escreva "\ndia Não existe"
       fimse
       enquanto hiper.produtos_stock [hiper.qtd_stock].data_caducidade.dia>31 ou hiper.produtos_stock [hiper.qtd_stock].data_caducidade.dia<=0
       faca
       	   escreva "\ndigite o mês:"
       	   leia hiper.produtos_stock [hiper.qtd_stock].data_caducidade.mes
       	   se hiper.produtos_stock [hiper.qtd_stock].data_caducidade.mes>12 ou hiper.produtos_stock [hiper.qtd_stock].data_caducidade.mes<=0 entao
       	   	   escreva "\nMês não existente"
       	   fimse
       enquanto hiper.produtos_stock [hiper.qtd_stock].data_caducidade.mes>12 ou hiper.produtos_stock [hiper.qtd_stock].data_caducidade.mes<=0
       faca 
       	   escreva "\nDigite o ano:"
       	   leia hiper.produtos_stock [hiper.qtd_stock].data_caducidade.ano
       	   se hiper.produtos_stock [hiper.qtd_stock].data_caducidade.ano<2017 e hiper.produtos_stock [hiper.qtd_stock].data_caducidade.ano>2030 entao
       	   	   escreva "\n Não aceitamos Cadastrar  produtos com ano de caducidade menor que 2017 e maior que 2030"
       	   senao
       	       se ((hiper.produtos_stock [hiper.qtd_stock].data_caducidade.dia=ddia () ou hiper.produtos_stock [hiper.qtd_stock].data_caducidade.mes<=dmes()+1 e hiper.produtos_stock [hiper.qtd_stock].data_caducidade.ano<=dano ())) entao
	               escreva "\nProduto expirado"
                   faca
	           	     	escreva "\nData de caducidade"
	               		escreva "\nDigite o dia:"   
                   		leia hiper.produtos_stock [hiper.qtd_stock].data_caducidade.dia
                   		escreva "\n Digite o mês:"
                   		leia hiper.produtos_stock [hiper.qtd_stock].data_caducidade.mes
                   		escreva "\n Digite o ano:"
                   		leia hiper.produtos_stock [hiper.qtd_stock].data_caducidade.ano
	           	   enquanto((hiper.produtos_stock [hiper.qtd_stock].data_caducidade.dia=ddia () ou hiper.produtos_stock [hiper.qtd_stock].data_caducidade.mes<=dmes()+1 e hiper.produtos_stock [hiper.qtd_stock].data_caducidade.ano<=dano()))
       	       fimse
       	   fimse
       enquanto hiper.produtos_stock [hiper.qtd_stock].data_caducidade.ano<2017 ou hiper.produtos_stock [hiper.qtd_stock].data_caducidade.ano>2023              
       string preco_compr,preco_venda,qtd_produto,qtd_min_stock
       inteiro k
       caracter c,cf,cc,cff,c3,cf3,c4,cf4
       faca
            escreva "\n Preço de Compra:"
            cf<-'0'
            leia preco_compr
//Ciclo para fazer a contagem do tamanho da string e receber apenas o numero do tipo real compra
            para k de 1 ate strTamanho ( preco_compr) aumentando 1
                c <-strCar (preco_compr,k-1)
                se carIsAlfabeto ( c )=verdadeiro entao
                    cf<-c
                fimse
            fimpara
            se carIsAlfabeto ( cf )=verdadeiro entao
                escreva "  ",preco_compr," inválido apenas números "
            fimse
       enquanto (carIsAlfabeto( cf )=verdadeiro)
       faca
       		se strValorReal(preco_compr) >= 0 entao
        		hiper.produtos_stock [hiper.qtd_stock].preco.precodecompra<-strValorReal(preco_compr)
       		senao
       			escreva " \n O valor digitado nao e valido"
       	 		escreva " \n Digite o preço de compra:"
     			leia preco_compr
     	 		hiper.produtos_stock [hiper.qtd_stock].preco.precodecompra<-strValorReal(preco_compr)
       		fimse
       enquanto strValorReal(preco_compr) <= 0
//Ciclo para fazer a contagem do tamanho da string e receber apenas o numero do tipo real da venda
       faca
   	        cff<-'0'
            escreva "\n Preço da Venda:"
            leia preco_venda
            para k de 1 ate strTamanho ( preco_venda) aumentando 1
                cc <-strCar (preco_venda,k-1)
                se carIsAlfabeto ( cc )=verdadeiro entao
                    cff<-cc
                fimse
            fimpara
            se carIsAlfabeto ( cff )=verdadeiro entao
                escreva " '",preco_venda,"', inválido, apenas números "
            fimse
       enquanto (carIsAlfabeto( cff )=verdadeiro)
// Cilco que verifica o valor de venda se é menor ou igual a 0       
       faca
       		se strValorReal(preco_venda) >= 0 entao
        		hiper.produtos_stock [hiper.qtd_stock].preco.precodevenda<-strValorReal(preco_venda)
       		senao
       			escreva " \n O valor digitado nao e valido"
       	    	escreva " \n Digite o preço de venda:"
     	    	leia preco_venda
     	    	hiper.produtos_stock [hiper.qtd_stock].preco.precodevenda<-strValorReal(preco_venda)
       		fimse
       enquanto strValorReal(preco_venda) <= 0
//Ciclo para fazer a contagem do tamanho da string e receber apenas o numero do tipo inteiro da quantidade de produto
       faca
   	        cf3<-'0'
            escreva "\nQuantidade do produto:"
            leia qtd_produto
            para k de 1 ate strTamanho ( qtd_produto) aumentando 1
                c3 <-strCar (qtd_produto,k-1)
                se carIsAlfabeto ( c3 )=verdadeiro entao
                    cf3<-c3
                fimse
            fimpara
            se carIsAlfabeto ( cf3 )=verdadeiro entao
                escreva " '",qtd_produto,"', invalido apenas números "
            fimse
       enquanto (carIsAlfabeto( cf3 )=verdadeiro)
//Ciclo que verifica se a quantidade de produto for menor ou igual a 0
       faca
       		se strValorInt(qtd_produto) >= 0 entao
       			hiper.produtos_stock [hiper.qtd_stock].quant.quantidade<-strValorInt(qtd_produto)
       		senao
       			escreva " \n A quantidade de produto inserido não é válido"
       	 		escreva " \n Digite a quantidade: "
     			leia qtd_produto
     	 		hiper.produtos_stock [hiper.qtd_stock].quant.quantidade<-strValorInt(qtd_produto)
     	 	fimse
       enquanto strValorInt(qtd_produto) <= 0
//Ciclo para fazer a contagem do tamanho da string e receber apenas o numero do tipo inteiro da quantidadade minima do produto
       faca
   	        cf3<-'0'
            escreva "\nQuantidade mínima do produto:"
            leia qtd_min_stock
            para k de 1 ate strTamanho ( qtd_min_stock) aumentando 1
                c3 <-strCar (qtd_min_stock,k-1)
                se carIsAlfabeto ( c3 )=verdadeiro entao
                    cf3<-c3
                fimse
            fimpara
            se carIsAlfabeto ( cf3 )=verdadeiro entao
                escreva " '",qtd_min_stock,"', inválido apenas números "
            fimse
       enquanto (carIsAlfabeto( cf3 )=verdadeiro)
       hiper.produtos_stock [hiper.qtd_stock].quant.qminima_stock<-strValorInt(qtd_min_stock)
 //Ciclo que verifica a quantidade minima se é menor ou igual a 0
       faca
       		se strValorInt(qtd_min_stock) >= 0 entao
      			hiper.produtos_stock [hiper.qtd_stock].quant.qminima_stock<-strValorInt(qtd_min_stock)
       		senao
       			escreva " \n A quantidade minima Stock de produto inserido não é válido"
       			escreva " \n Digite a quantidade minima de stock: "
     			leia qtd_min_stock
     			hiper.produtos_stock [hiper.qtd_stock].quant.qminima_stock<-strValorInt(qtd_min_stock)
     	 	fimse
       enquanto strValorInt(qtd_min_stock) <= 0 
       hiper.produtos_stock [hiper.qtd_stock].quant.qminima_stock<-strValorInt(qtd_min_stock)
       hiper.qtd_stock<-hiper.qtd_stock+1
       escreva " Se quiseres sair clica zero para voltar ao menu\n Se não, clica um número diferente de zero para continuar a registar o produto: "
       leia codig
       se codig="0" entao
            retorne falso
       fimse
       se codig<>"0" entao
            hiper.produtos_stock [hiper.qtd_stock].codigo<-codig
       fimse
       
    enquanto(codig<>"0")
    retorne verdadeiro
fimfuncao
//Função para fazer o registo da venda do produto
funcao logico vender_prod (RegVenda vender,stock hiper)
	inteiro i
    escreva "\nIntroduz o código do Produto:"
    leia vender.vendas[vender.qtd_vendas].codigo
    para i de 1 ate hiper.qtd_stock aumentando 1
	   se (StrCmpIg(vender.vendas[vender.qtd_vendas].codigo,hiper.produtos_stock[i-1].codigo)=0) entao
	        se  hiper.produtos_stock[i-1].quant.quantidade=0 entao
	            escreva "\nNão será possível efectuar esta venda, Stock esgotado"
	            retorne falso
	        fimse
	        se hiper.produtos_stock[i-1].quant.quantidade<>0 entao
	            escreva "\nNome do cliente:"
                leia vender.vendas[vender.qtd_vendas].nomecliente
                escreva "\nData de venda-dd/mm/aaaa:"
                leia vender.vendas[vender.qtd_vendas].datavenda
                string qtd_venda,qtd_pago,qtd_produto,qtd_min_stock
                inteiro k
                caracter c,cf,cc,cff,c3,cf3,c4,cf4
                faca
                	cf3<-'0'
                    escreva "\nQuantidade de produto a vender:"
                    leia qtd_venda
                    para k de 1 ate strTamanho ( qtd_venda) aumentando 1                      
                        c3 <-strCar (qtd_venda,k-1)
                        se carIsAlfabeto ( c3 )=verdadeiro entao
                            cf3<-c3
                        fimse
                    fimpara
                    se carIsAlfabeto ( cf3 )=verdadeiro entao
                        escreva " '",qtd_venda,"', inválido apenas números "
                    fimse
                enquanto (carIsAlfabeto( cf3 )=verdadeiro)
                vender.vendas[vender.qtd_vendas].quantproduto<-strValorInt(qtd_venda)
                //
                vender.vendas[vender.qtd_vendas].valor.vporpagar<-vender.vendas[vender.qtd_vendas].quantproduto*hiper.produtos_stock[i-1].preco.precodevenda
                escreva "\n Valor por pagar:", vender.vendas[vender.qtd_vendas].valor.vporpagar
                faca
                	cf<-'0'
                    escreva "\n Valor Pago:"
                    leia qtd_pago
                    para k de 1 ate strTamanho ( qtd_pago) aumentando 1
                        c <-strCar (qtd_pago,k-1)
                        se carIsAlfabeto ( c )=verdadeiro entao
                            cf<-c
                        fimse
                    fimpara
                    se carIsAlfabeto ( cf )=verdadeiro entao
                         escreva " '",qtd_pago,"', inválido apenas números "
                    fimse
                enquanto (carIsAlfabeto( cf )=verdadeiro)
                vender.vendas[vender.qtd_vendas].valor.vpago<-strValorInt(qtd_pago)
 
                se vender.vendas[vender.qtd_vendas].valor.vpago < vender.vendas[vender.qtd_vendas].valor.vporpagar entao
                    escreva "\n Valor inferior concernente ao pedido"
                    faca
                         faca
                         	cf4<-'0'
                            escreva "\nValor Pago novamente:"
                            leia qtd_pago
                            para k de 1 ate strTamanho ( qtd_pago) aumentando 1
                                 c4 <-strCar (qtd_pago,k-1)
                                 se carIsAlfabeto ( c4 )=verdadeiro entao
                                     cf4<-c4
                                 fimse
                            fimpara
                            se carIsAlfabeto ( cf4 )=verdadeiro entao
                                 escreva " '",qtd_pago,"', inválido. Apenas números "
                            fimse
                         enquanto (carIsAlfabeto( cf4 )=verdadeiro)
                         vender.vendas[vender.qtd_vendas].valor.vpago<-strValorInt(qtd_pago)
                    enquanto(vender.vendas[vender.qtd_vendas].valor.vpago < vender.vendas[vender.qtd_vendas].valor.vporpagar)
                    //
                fimse
                vender.vendas[vender.qtd_vendas].valor.troco<-vender.vendas[vender.qtd_vendas].valor.vpago-vender.vendas[vender.qtd_vendas].valor.vporpagar
                escreva "\nTroco do cliente:",vender.vendas[vender.qtd_vendas].valor.troco
                hiper.produtos_stock[i-1].quant.quantidade<-hiper.produtos_stock[i-1].quant.quantidade-vender.vendas[vender.qtd_vendas].quantproduto
                vender.vendas[vender.qtd_vendas].arec_tipo<-vender.vendas[vender.qtd_vendas].arec_tipo+vender.vendas[vender.qtd_vendas].valor.vpago
                real lucro
                lucro <-hiper.produtos_stock[i-1].quant.quantidade*hiper.produtos_stock[i-1].preco.precodecompra-vender.vendas[vender.qtd_vendas].valor.vpago
                luc_geral<-luc_geral+lucro
                vender.qtd_vendas<-vender.qtd_vendas+1
                retorne verdadeiro
	        fimse
        fimse
	fimpara
	retorne falso
fimfuncao
//Procedimento para listar a venda do produto
procedimento listar_venda_prod(literal cod,RegVenda vender)
	inteiro i
	escreva "\n---------------- Resultados de vendas do Produto código -",cod,"-------------------"
	para i de 1 ate vender.qtd_vendas aumentando 1
	    se (StrCmpIg(cod,vender.vendas[i-1].codigo)=0) entao
	        escreva "\nNome do cliente |Data de venda |Quantidade vendida |Valor Pago |Troco do cliente"
	        escreva "\n",vender.vendas[i-1].nomecliente," |",vender.vendas[i-1].datavenda," |",vender.vendas[i-1].quantproduto," |",vender.vendas[i-1].valor.vpago," |",vender.vendas[i-1].valor.troco
	        escreva "\n---------------------------------------------------------------------------------------"
	    senao
	        escreva " \n Erro na escrita ou código não encontrado"
	    fimse
	fimpara
fimprocedimento
//Procedimento para a listagem geral das vendas dos produtos
procedimento listar_venda_geral(RegVenda vender)
	inteiro i
	escreva "\n------------------------ Resultados de vendas Geral ----------------------------------"
	para i de 1 ate vender.qtd_vendas aumentando 1
	    escreva "\nNome do cliente |Data de venda |Quantidade vendida |Valor Pago |Troco do cliente"
	    escreva "\n",vender.vendas[i-1].nomecliente," |",vender.vendas[i-1].datavenda," |",vender.vendas[i-1].quantproduto," |",vender.vendas[i-1].valor.vpago," |",vender.vendas[i-1].valor.troco
	    escreva "\n---------------------------------------------------------------------------------------"
	fimpara
fimprocedimento
//Função para eliminar produto do stock
funcao logico eliminar_prod(stock hiper)
	inteiro i
	literal codigo
	escreva "\nIntroduz o código do Produto a eliminar:"
	leia codigo
	para i de 1 ate hiper.qtd_stock aumentando 1
	    se (StrCmpIg(codigo,hiper.produtos_stock[i-1].codigo)=0) entao
	//REMOVER O PRODUTO
	        hiper.produtos_stock[i-1]<-hiper.produtos_stock[i]
 	        hiper.qtd_stock <-hiper.qtd_stock-1
	        escreva "\n removido do stock",codigo
	        retorne verdadeiro
	    fimse
	    se (StrCmpIg(codigo,hiper.produtos_stock[i-1].codigo)<>0)entao
	        escreva "\nCódigo não encontrado"
	        retorne falso
	    fimse
	fimpara
	retorne falso
fimfuncao
//Função para actualizar produto
funcao logico actualizar_prod (stock hiper)
	 inteiro i,dia,mes,ano
	 literal preco_compr_prd,preco_venda_prd,quant_prd,quant_min_stock,cod_prd,nome_prd,tipo_prd
     inteiro k
     caracter c,cf,cc,cff,c3,cf3,c4,cf4
	 escreva "Código do produto a actualizar:"
	 leia cod_prd
//Ciclo para actualizar o nome do produto, data de caducidade tipo produto, preço de venda do produto, preço de compra do produto e quantidade do produto e quantidade minima do produto 
	 para i de 1 ate hiper.qtd_stock aumentando 1
	    se (StrCmpIg(cod_prd,hiper.produtos_stock[i-1].codigo)=0) entao
	        escreva "\nActualiza o nome do produto:"
	        leia nome_prd
	        hiper.produtos_stock[i-1].nome<-nome_prd
	        escreva "\nActualiza o tipo do produto"
	        leia tipo_prd
	        hiper.produtos_stock[i-1].tipo<-tipo_prd
	        escreva "\nActualiza a data de caducidade do Produto(dia):"
	        leia dia
	        hiper.produtos_stock[i-1].data_caducidade.dia<-dia
	        escreva "\nActualiza a data de caducidade do Produto(mês):"
	        leia mes
	        hiper.produtos_stock[i-1].data_caducidade.mes<-mes
	        escreva "\nActualiza a data de caducidade do Produto(ano):"
	        leia dia
	        hiper.produtos_stock[i-1].data_caducidade.ano<-ano
	        faca
	 	        cf<-'0'
	            escreva "\nActualiza o preço de compra do Produto:"
	            leia preco_compr_prd
	            para k de 1 ate strTamanho ( preco_compr_prd) aumentando 1
                    c <-strCar (preco_compr_prd,k-1)
                    se carIsAlfabeto ( c )=verdadeiro entao
                         cf<-c
                    fimse
                fimpara
                se carIsAlfabeto ( cf )=verdadeiro entao
                    escreva " '",preco_compr_prd,"', inválido. Apenas números "
                fimse
            enquanto (carIsAlfabeto( cf )=verdadeiro)
            hiper.produtos_stock [k-1].preco.precodecompra<-strValorReal(preco_compr_prd) 
            faca
    	        cff<-'0'
	            escreva "\nActualiza o preço de venda do Produto"
	            leia preco_venda_prd
	            para k de 1 ate strTamanho ( preco_venda_prd) aumentando 1
                    cc <-strCar (preco_venda_prd,k-1)
                    se carIsAlfabeto ( cc )=verdadeiro entao
                         cff<-cc
                    fimse
                fimpara
                se carIsAlfabeto ( cff )=verdadeiro entao
                    escreva " '",preco_venda_prd,"', inválido apenas números "
                fimse
            enquanto (carIsAlfabeto( cff )=verdadeiro)
            hiper.produtos_stock [k-1].preco.precodevenda<-strValorInt(preco_venda_prd)
	        faca
	 	        cf4<-'0'
	            escreva "\nActualiza a  quantidade do Produto:"
	            leia quant_prd
		        para k de 1 ate strTamanho ( quant_prd) aumentando 1
                    cc <-strCar (quant_prd,k-1)
                    se carIsAlfabeto ( c4 )=verdadeiro entao
                         cf4<-c4
                    fimse
                fimpara
                se carIsAlfabeto ( cf4 )=verdadeiro entao
                    escreva " '",quant_prd,"', inválido apenas números "
                fimse
            enquanto (carIsAlfabeto( cf4 )=verdadeiro)
            hiper.produtos_stock [k-1].quant.quantidade<-strValorInt(quant_prd)
	        i<-i+1
	        retorne verdadeiro
	    senao
	        escreva "\nCódigo não encontrado(verifica a sua escrita)."
	    fimse
	 fimpara
     retorne falso
fimfuncao
//Função para consultar produto na area de Venda 
funcao logico consultar_prod (stock hiper)
	 inteiro i
	 literal codigo_prd
	 escreva "\nCódigo do Produto a consultar:"
	 leia codigo_prd
	 para i de 1 ate hiper.qtd_stock aumentando 1
	    se (StrCmpIg(hiper.produtos_stock[i-1].codigo,codigo_prd)=0) entao
	        escreva "\n                           ============== Resultado do:",codigo_prd," Encontrado ================== "
	        escreva "\n//////////////////////////////////////////////// Nome do Produto: ",hiper.produtos_stock[i-1].nome,"//////////////////////////////////////////////"
	 		escreva "\n Código: ",hiper.produtos_stock[i-1].codigo
	 		escreva "\n Preço de venda: ",hiper.produtos_stock[i-1].preco.precodevenda," kz"
	 		escreva "\n_______________________________________________________________________________________________________________________________________________"
	        tPause(5000)
	        retorne verdadeiro
	    senao
	        escreva "\nCódigo do Produto a consultar não encontrado."
	        retorne falso	
        fimse
	 fimpara
	 retorne falso
fimfuncao
//Função para listar todos produtos que estão no stock
procedimento listar_prd(stock hiper)
	 inteiro i  
	 escreva "\n                           ============== LISTA DE TODOS OS PRODUTOS DO HIPERMERCADO: =================="
	 para i de 1 ate hiper.qtd_stock aumentando 1
	 	escreva "------------------------------- O Numero do registo do produto é",i,"--------------------------------------------------------"
	 	escreva "\n//////////////////////////////////////////////// Nome do Produto: ",hiper.produtos_stock[i-1].nome,"//////////////////////////////////////////////"
	 	escreva "\n Código: ",hiper.produtos_stock[i-1].codigo
	 	escreva "\n Preço de compra: ",hiper.produtos_stock [i-1].preco.precodecompra," kz"
	 	escreva "\n Preço de venda: ",hiper.produtos_stock[i-1].preco.precodevenda," kz"
	 	escreva "\n Data de caducidade: ",hiper.produtos_stock[i-1].data_caducidade.dia,"/",hiper.produtos_stock[i-1].data_caducidade.mes,"/",hiper.produtos_stock[i-1].data_caducidade.ano
	 	escreva "\n Quantidade do produto: ",hiper.produtos_stock[i-1].quant.quantidade
	 	escreva "\n Quantidade do produto: ",hiper.produtos_stock[i-1].quant.qminima_stock
	 	escreva "\n_______________________________________________________________________________________________________________________________________________"
	 fimpara
fimprocedimento
//Procedimento para consultar o produto na area de Administractiva
funcao logico consultar_prod1 (stock hiper)
	 inteiro i
	 literal codigo_prd
	 escreva "\nCódigo do Produto a consultar:"
	 leia codigo_prd
	 para i de 1 ate hiper.qtd_stock aumentando 1
	    se (StrCmpIg(hiper.produtos_stock[i-1].codigo,codigo_prd)=0) entao
	        escreva "\n                           ============== Resultado do:",codigo_prd," Encontrado ================== "
	        escreva "\n//////////////////////////////////////////////// Nome do Produto: ",hiper.produtos_stock[i-1].nome,"//////////////////////////////////////////////"
	 		escreva "\n Código: ",hiper.produtos_stock[i-1].codigo
	 		escreva "\n Preço de venda: ",hiper.produtos_stock[i-1].preco.precodevenda," kz"
	 		escreva "\n Preço de venda: ",hiper.produtos_stock[i-1].preco.precodevenda," kz"
	 		escreva "\n Data de caducidade: ",hiper.produtos_stock[i-1].data_caducidade.dia,"/",hiper.produtos_stock[i-1].data_caducidade.mes,"/",hiper.produtos_stock[i-1].data_caducidade.ano
	 		escreva "\n Quantidade do produto: ",hiper.produtos_stock[i-1].quant.quantidade
	 		escreva "\n Quantidade do produto: ",hiper.produtos_stock[i-1].quant.qminima_stock
	 		escreva "\n_______________________________________________________________________________________________________________________________________________"
	        tPause(5000)
	        retorne verdadeiro
	    senao
	        escreva "\nCódigo do Produto a consultar não encontrado."
	        retorne falso	
        fimse
	 fimpara
	 retorne falso
fimfuncao
//Procedimento para o valor arrecadado por tipo
procedimento arrecadado_tipo (RegVenda vender,stock hiper)
	 inteiro i,k
	 real arecad_tipo
	 literal cod_pd
	 escreva "\nCódigo do Produto a consultar:"
	 leia cod_pd
	 listar_venda_prod(cod_pd,vender)
	 para i de 1 ate vender.qtd_vendas aumentando 1
	    se(StrCmpIg(cod_pd,vender.vendas[i-1].codigo)=0) entao
	        arecad_tipo<-arecad_tipo+vender.vendas[i-1].arec_tipo
	    fimse
	 fimpara
//Ciclo que mostra  os valores arrecadado por tipo
	 para k de 1 ate hiper.qtd_stock aumentando 1
	    se(StrCmpIg(cod_pd,hiper.produtos_stock[k-1].codigo)=0) entao
	        escreva"\n============= Valor arrecadado da",hiper.produtos_stock[k-1].nome,"é de",arecad_tipo,"kz.==============="
	    fimse
	 fimpara
fimprocedimento
//Procedimento para o valor arrecadado geral
procedimento arrecadado_geral (RegVenda vender,stock hiper)
	 inteiro k
	 listar_venda_geral(vender)
	 para k de 1 ate vender.qtd_vendas aumentando 1
	    arec_geral<-arec_geral+vender.vendas[k-1].valor.vpago
	 fimpara
	 escreva"\n============= Valor arrecadado Geral é de",arec_geral,"kzs.==============="
	 //	 
fimprocedimento
//Procedimento para o valor do lucro por tipo
procedimento lucro_por_tipo (RegVenda vender,stock hiper)
	 inteiro i,k
	 real lucro_tipo,arrec_tipo
	 literal cod_pd
	 escreva "\n Código do Produto a consultar:"
	 leia cod_pd
	 para i de 1 ate vender.qtd_vendas aumentando 1
	    se(StrCmpIg(cod_pd,vender.vendas[i-1].codigo)=0) entao
	        arrec_tipo<-arrec_tipo+vender.vendas[i-1].arec_tipo
	    fimse
	 fimpara
	 //
	 para k de 1 ate hiper.qtd_stock aumentando 1
	    se(StrCmpIg(cod_pd,hiper.produtos_stock[k-1].codigo)=0) entao
	        lucro_tipo<-hiper.produtos_stock[k-1].quant.quantidade*hiper.produtos_stock[k-1].preco.precodecompra-arrec_tipo
	        escreva"\n============= Valor arrecadado da",hiper.produtos_stock[k-1].nome,"é de",lucro_tipo,"kz.==============="
	    fimse
	 fimpara
fimprocedimento
//Procedimento para o valor do lucro geral
procedimento lucro_geral ()
	 listar_venda_geral(vender)
	 escreva"\n============= Lucro Geral é de: ",luc_geral,"kz.==============="
	 	 
fimprocedimento
//Procedimento do MENU de venda
procedimento menu_venda()
	
     mostre "1-Vender produto\n 2-Consultar produto\n 3-Sair\n \n Escolha uma opcao:\t"

fimprocedimento
//Procedimento do MENU da área Administrativa
procedimento menu_Administrativo()
	
	mostre "================================================|GAR ALIMENTAR|=================================================\n\n\n"
    mostre " \n____________________________________________ MENU ADMINISTRATIVA_________________________________________\n\n \n"
    mostre "\t\t\t\t\t\t1-Registar produto\n \t\t\t\t\t\t2-Actualizar produto\n \t\t\t\t\t\t3-Listar produto\n \t\t\t\t\t\t4-Consultar produto\n \t\t\t\t\t\t5-Eliminar produto\n \t\t\t\t\t\t6-Sair\n"
fimprocedimento
//Procedimento do MENU para a área de Contabilidade
procedimento menu_contabilidade()
    mostre "\t\t\t\t\t\t1-Valor arrecadado geral\n \t\t\t\t\t\t2-Valor arrecado por tipo\n \t\t\t\t\t\t3-Lucro geral\n \t\t\t\t\t\t4-Lucro por tipo\n \t\t\t\t\t\t5-Sair\n Escolha uma opcao:"
fimprocedimento
//Procedimento do MENU geral
procedimento gar_alimentar (RegVenda vender,stock hiper)

	literal opcao1,opcao2,opcao3,opcao4,voltar
	inteiro i
	faca
	limpatela
	    mostre "================================================|GAR ALIMENTAR|=================================================\n\n\n"
        mostre "\t\t\t\t\t\t1-Venda\n \t\t\t\t\t\t2-Administrativa\n \t\t\t\t\t\t3-Contabilidade\n \t\t\t\t\t\t4-Autores\n\n Em que area voce trabalha:"

	//
	    para i de 1 ate hiper.qtd_stock aumentando 1
	       se hiper.produtos_stock [i-1].quant.quantidade<3 entao
		       escreva "\n OBS:(O Produto '",hiper.produtos_stock [i-1].nome,"' Esta a esgotar com quantidade de apenas (",hiper.produtos_stock [i-1].quant.qminima_stock,")):"
	       fimse
	    fimpara
	    leia opcao1
	    escolha (opcao1)
	    //MENU VENDA
	    caso "1":
		limpatela
		   mostre "================================================|GAR ALIMENTAR|=================================================\n\n\n"
           mostre " \n___________________________________________MENU_VENDA____________________________________________________\n \n"

		   se stock_esgotado (hiper)=verdadeiro entao
		       faca
		           escreva "\nSem produtos no stock para vender ou consultar.\n Tecla 0 para voltar ao menu: "
		           leia voltar
		           se voltar="0" entao
		               gar_alimentar (vender, hiper)
		           fimse
		       enquanto(voltar<>"0")
		   senao
		       faca	
		           menu_venda()		           
		           leia opcao2
		           escolha (opcao2)
		           	//Vender produto
		           caso "1":
		               vender_prod (vender, hiper)	//
		               faca
		                   escreva "\n Tecla 0 para sair: "
		                   leia voltar
		                   se voltar="0" entao
		                       gar_alimentar (vender, hiper)//
		                   fimse
		               enquanto(voltar<>"0")
		           //Consultar produto
		           caso "2":
		           limpatela
		               consultar_prod (hiper)//
		               faca
	                       escreva "\n tecla 0 para voltar ao menu:"
		                   leia voltar
		                   se voltar="0" entao
		                       gar_alimentar (vender, hiper)
		                   fimse
		               enquanto(voltar<>"0")
		           //Sair
		           caso "3":
		               gar_alimentar (vender, hiper)
		           fimescolha
		       enquanto(opcao2<>"1" e opcao2<>"2" e opcao2<>"3")
		   fimse
		//MENU ADMINISTRATIVA
	    caso "2":
		limpatela
		   faca
		   limpatela
		       menu_Administrativo()
		       escreva "\nescolha uma opção:"
		       leia opcao3
		       escolha (opcao3)
		       	//Registar produto
		       caso "1":
			   limpatela
			       regista_prod (hiper)
			       gar_alimentar (vender, hiper)
			   //Actualizar produto
		       caso "2":	
		           se stock_esgotado (hiper)=verdadeiro entao
		 	           faca
		 	           limpatela
		 	               escreva "\n não há nada no stock à actualizar.\nDigite 0 para voltar ao menu:"
		                   leia voltar
		                   se voltar="0" entao
		 	                    gar_alimentar (vender, hiper)
		                   fimse
		               enquanto(voltar <>"0")
		           senao
		 	       limpatela
		               actualizar_prod (hiper)	
		               gar_alimentar (vender, hiper)
		           fimse
		       //Listar produto    
		       caso "3":
			       se stock_esgotado (hiper)=verdadeiro entao
			           faca
			           limpatela
		 	               escreva "\n não há nada no stock para listar.tecla 0 para voltar ao menu:"
		 	               leia voltar
		 	               se voltar="0" entao
		 	                   gar_alimentar (vender, hiper)
		 	               fimse
		 	           enquanto(voltar<>"0")
			       senao 
				   limpatela
		               listar_prd(hiper)
		               escreva "\nTecla 0 para sair:"
		               leia voltar
		               se voltar="0" entao
		                   gar_alimentar (vender, hiper)
		               fimse
	               fimse
	           //Consultar produto
	           caso "4":
                   se stock_esgotado (hiper)=verdadeiro entao
        	           faca
		               escreva "\n não há nada no stock para consultar.\nTecla 0 para voltar o Menu:"
		               leia voltar
		               se voltar="0" entao
		                   gar_alimentar (vender, hiper)
	                   fimse
		               enquanto (voltar<>"0")
                   senao
                   limpatela
	                   consultar_prod1 (hiper)//
	                   faca
                       limpatela
		                   escreva "\nTecla 0 para voltar o Menu:"
		                   leia voltar
		                   se voltar="0" entao
		                       gar_alimentar (vender, hiper)
		                   fimse
		               enquanto (voltar<>"0")
                   fimse
                //Eliminar produto
	           caso "5":
	               se stock_esgotado (hiper)=verdadeiro entao
	                  faca
	                  limpatela
		                   escreva "\n Não há nada no stock para Eliminar.\n Tecla 0 para voltar ao Menu:"
		                   leia voltar
		                   se  voltar="0" entao
		                       gar_alimentar (vender, hiper)
		                   fimse
		              enquanto(voltar<>"0")
	               senao
	               limpatela
	                  eliminar_prod(hiper)//
	                  gar_alimentar (vender, hiper)//
	               fimse
	           //Sair
	           caso "6":
	               gar_alimentar (vender, hiper)//
	           fimescolha	
	       enquanto (opcao3<>"1" e opcao3<>"2" e opcao3<>"3" e opcao3<>"4" e opcao3<>"5" e opcao3<>"6")
	// MENU CONTABILIDADE
	    caso "3":
	       
		   se stock_esgotado (hiper)=verdadeiro entao
		 	   faca
		 	   limpatela
		 	       mostre "================================================|GAR ALIMENTAR|=================================================\n\n\n"
		           mostre " \n____________________________________________MENU DE CONTABILIDADE_________________________________________\n \n"
		           escreva "\n Não há nada no stock para contabilizar.\n Tecla 0 para voltar ao menu:"
		           leia voltar
		           se voltar="0" entao
		              gar_alimentar (vender, hiper)
		           fimse
		       enquanto(voltar<>"0")	
		   senao 
		       faca
		 	       limpatela
		 	       menu_contabilidade()
		 	       escreva "\nescolha uma opcão:"	
		 	       leia opcao4
		 		   escolha (opcao4)
		 		   	//Valor arrecadado geral
		 		   caso "1":
		 		   limpatela
		              arrecadado_geral ( vender,hiper)
		              faca
		                  escreva "\nTecla 0 para voltar ao menu:"
		                  leia voltar
		                  se voltar="0" entao
		                      gar_alimentar (vender, hiper)//
		                  fimse
		              enquanto(voltar<>"0")
		            //Valor arrecadado por tipo	
		 		   caso "2":
		 			  limpatela
		 		      literal cod
		 		      escreva "\n Código do produto:"
		 		      leia cod
		 		      listar_venda_prod(cod, vender)
		 		      arrecadado_tipo (vender, hiper)//
		 		      faca
		                  escreva "\nTecla 0 para voltar ao menu:"
		                  leia voltar
		                  se voltar="0" entao
		                      gar_alimentar (vender, hiper)//
		                  fimse
		 		      enquanto(voltar<>"0")
		 		   //Lucro geral
		 		   caso "3":
		 			  limpatela
		 		      lucro_geral ()	
		 		      faca
		                  escreva "\nTecla 0 para voltar ao menu:"
		                  leia voltar
		                  se voltar="0" entao
		                      gar_alimentar (vender, hiper)//
		                  fimse
		 		      enquanto(voltar<>"0")
		 		   //Lucro por tipo
		 		   caso "4":
		 			  limpatela
		 		      lucro_por_tipo (vender, hiper)
		 		      faca
		                  escreva "\nTecla 0 para voltar ao menu:"
		                  leia voltar
		                  se voltar="0" entao
		                      gar_alimentar (vender, hiper)//
		                  fimse
		              enquanto(voltar<>"0")
		 		   //Sair
		 		   caso "5":
		 		      gar_alimentar (vender, hiper)//
		           fimescolha
		 	   enquanto ((opcao1<>"1") e (opcao1<>"2") e (opcao1<>"3") e (opcao1<>"4") e (opcao1<>"5") )
		   fimse
	    caso "4":
	    	limpatela
	       escreva "Este projecto foi feito pelos estudantes do 1ºano do curso de Ciências da Computação da Universidade Agostinho Neto da faculdade de Ciências\n\n"
		   escreva "\n Adriano Matari Mateus"
		   escreva "\n Emanuel Diatshambo Djuma"
		   escreva "\n Igildo Filipe Candumbo Cassoma"
		   escreva "\n Jesus Manuel Horácio"
		   escreva "\n Florência Dilumbaka Joaquim"
		   faca
		        escreva "\n\n Tecla 0 para voltar ao menu:"
		        leia voltar
		        se voltar="0" entao
		            gar_alimentar (vender, hiper)
		        fimse
		    enquanto(voltar<>"0")
	   fimescolha
    enquanto ((opcao1<>"1") e (opcao1<>"2") e (opcao1<>"3")e(opcao1<>"4")  )
fimprocedimento
//Inicio do programa
inicio
	RegVenda vender
	stock hiper
	gar_alimentar (vender,hiper)
fimalgoritmo