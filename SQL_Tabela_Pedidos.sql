CREATE DATABASE TabelaPedidos;

CREATE TABLE Cliente (
    codCLi INT NOT NULL,
    nomeCli VARCHAR(50) NOT NULL,

    CONSTRAINT PK_Cliente PRIMARY KEY (codCLi),
);

CREATE TABLE Peca (
    codPeca INT NOT NULL,
    descPeca VARCHAR(100) NOT NULL,

    CONSTRAINT PK_Peca PRIMARY KEY (codPeca),
);

CREATE TABLE Pedido (
    numPedido INT NOT NULL,
    dataPed DATETIME NOT NULL,
    codCli INT NOT NULL,

    CONSTRAINT PK_Pedido PRIMARY KEY (numPedido),
);

ALTER TABLE Pedido ADD CONSTRAINT FK_Pedido_Cliente FOREIGN KEY (codCLi) REFERENCES Cliente(codCli);

CREATE TABLE Pedido_Telefone (
    numPedido INT NOT NULL,
    numTelefone VARCHAR(14) NOT NULL,

    CONSTRAINT PK_Pedido_Telefone PRIMARY KEY (numPedido),
    CONSTRAINT FK_Pedido_Telefone_Pedido FOREIGN KEY (numPedido) REFERENCES Pedido(numPedido),
);

CREATE TABLE Item_Pedido (
    numPedido INT NOT NULL,
    codPeca INT NOT NULL,
    numTelefone VARCHAR(14) NOT NULL,

    CONSTRAINT PK_Item_Pedido PRIMARY KEY (numPedido, codPeca),
    CONSTRAINT FK_Item_Pedido_Pedido FOREIGN KEY (numPedido) REFERENCES Pedido(numPedido),
    CONSTRAINT FK_Item_Pedido_Peca FOREIGN KEY (codPeca) REFERENCES Peca(codPeca),
);