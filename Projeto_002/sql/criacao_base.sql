
-- PROJETO 001
-- Criação da base fictícia de clientes e consumos


CREATE EXTENSION IF NOT EXISTS pgcrypto;

-- TABELA DE CLIENTES

CREATE TABLE IF NOT EXISTS public.clientes (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    nome VARCHAR(150) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    cidade VARCHAR(100),
    estado CHAR(2),
    status VARCHAR(20) NOT NULL DEFAULT 'ativo',
    origem VARCHAR(50) DEFAULT 'n8n',
    criado_em TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    retorno_financeiro NUMERIC(12, 2)
);

ALTER TABLE public.clientes
ENABLE ROW LEVEL SECURITY;

-- INSERÇÃO DE 100 CLIENTES FICTÍCIOS
INSERT INTO public.clientes (
    nome,
    email,
    telefone,
    cidade,
    estado,
    status,
    origem,
    criado_em,
    retorno_financeiro
)
SELECT
    'Cliente ' || numero,

    'cliente' || numero || '@exemplo.com',

    '119' || LPAD(numero::TEXT, 8, '0'),

    CASE
        WHEN numero % 5 = 0 THEN 'São Paulo'
        WHEN numero % 5 = 1 THEN 'Rio de Janeiro'
        WHEN numero % 5 = 2 THEN 'Belo Horizonte'
        WHEN numero % 5 = 3 THEN 'Curitiba'
        ELSE 'Salvador'
    END,

    CASE
        WHEN numero % 5 = 0 THEN 'SP'
        WHEN numero % 5 = 1 THEN 'RJ'
        WHEN numero % 5 = 2 THEN 'MG'
        WHEN numero % 5 = 3 THEN 'PR'
        ELSE 'BA'
    END,

    CASE
        WHEN numero % 4 = 0 THEN 'inativo'
        ELSE 'ativo'
    END,

    'n8n',

    NOW() - ((numero % 30) || ' days')::INTERVAL,

    ROUND(
        (100 + RANDOM() * 9900)::NUMERIC,
        2
    )

FROM generate_series(1, 100) AS numero

ON CONFLICT (email) DO NOTHING;

-- TABELA DE CONSUMOS

CREATE TABLE IF NOT EXISTS public.consumos_clientes (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    cliente_id UUID NOT NULL
        REFERENCES public.clientes(id)
        ON DELETE CASCADE,

    produto VARCHAR(100) NOT NULL,

    quantidade INTEGER NOT NULL
        CHECK (quantidade > 0),

    valor_unitario NUMERIC(12, 2) NOT NULL
        CHECK (valor_unitario >= 0),

    valor_total NUMERIC(12, 2) NOT NULL
        CHECK (valor_total >= 0),

    data_consumo TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

ALTER TABLE public.consumos_clientes
ENABLE ROW LEVEL SECURITY;

CREATE INDEX IF NOT EXISTS idx_consumos_cliente_id
    ON public.consumos_clientes(cliente_id);

CREATE INDEX IF NOT EXISTS idx_consumos_data
    ON public.consumos_clientes(data_consumo);


-- INSERÇÃO DE TRÊS CONSUMOS POR CLIENTE
WITH dados_consumo AS (
    SELECT
        cliente.id AS cliente_id,

        (
            ARRAY[
                'Notebook',
                'Monitor',
                'Teclado',
                'Mouse',
                'Headset',
                'Webcam',
                'Cadeira de escritório',
                'Smartphone'
            ]
        )[1 + FLOOR(RANDOM() * 8)::INTEGER] AS produto,

        (1 + FLOOR(RANDOM() * 5))::INTEGER AS quantidade,

        ROUND(
            (50 + RANDOM() * 4950)::NUMERIC,
            2
        ) AS valor_unitario,

        NOW()
            - (
                FLOOR(RANDOM() * 90)::INTEGER
                * INTERVAL '1 day'
            ) AS data_consumo

    FROM public.clientes AS cliente

    CROSS JOIN generate_series(1, 3)

    -- O Cliente 101 é inserido posteriormente pelo n8n.
    WHERE cliente.email <> 'cliente101@exemplo.com'

      -- Evita adicionar novamente os consumos de teste.
      AND NOT EXISTS (
          SELECT 1
          FROM public.consumos_clientes AS consumo
          WHERE consumo.cliente_id = cliente.id
      )
)

INSERT INTO public.consumos_clientes (
    cliente_id,
    produto,
    quantidade,
    valor_unitario,
    valor_total,
    data_consumo
)
SELECT
    cliente_id,
    produto,
    quantidade,
    valor_unitario,
    ROUND(quantidade * valor_unitario, 2),
    data_consumo
FROM dados_consumo;


-- CONSULTAS DE VALIDAÇÃO

SELECT COUNT(*) AS total_clientes
FROM public.clientes;

SELECT COUNT(*) AS total_consumos
FROM public.consumos_clientes;

SELECT *
FROM public.clientes
ORDER BY nome;