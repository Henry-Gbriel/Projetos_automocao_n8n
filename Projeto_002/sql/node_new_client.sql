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
VALUES (
    'Cliente 101',
    'cliente101@exemplo.com',
    '11900000041',
    'Rio de Janeiro',
    'RJ',
    'ativo',
    'telegram',
    NOW(),
    100000.10
)
ON CONFLICT (email)
DO UPDATE SET
    nome = EXCLUDED.nome,
    telefone = EXCLUDED.telefone,
    cidade = EXCLUDED.cidade,
    estado = EXCLUDED.estado,
    status = EXCLUDED.status,
    origem = EXCLUDED.origem,
    retorno_financeiro = EXCLUDED.retorno_financeiro
RETURNING *;