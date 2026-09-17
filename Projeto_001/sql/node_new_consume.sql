INSERT INTO public.consumos_clientes (
    cliente_id,
    produto,
    quantidade,
    valor_unitario,
    valor_total,
    data_consumo
)
SELECT
    id,
    'Notebook',
    1,
    3500.00,
    3500.00,
    NOW()
FROM public.clientes
WHERE email = 'cliente101@exemplo.com'
RETURNING *;