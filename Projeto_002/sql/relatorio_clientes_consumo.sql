SELECT
    cliente.id AS cliente_id,
    cliente.nome,
    cliente.email,
    cliente.telefone,
    cliente.cidade,
    cliente.estado,
    cliente.status,
    cliente.origem,
    cliente.criado_em,
    cliente.retorno_financeiro,

    consumo.id AS consumo_id,
    consumo.produto,
    consumo.quantidade,
    consumo.valor_unitario,
    consumo.valor_total,
    consumo.data_consumo

FROM public.clientes AS cliente

INNER JOIN public.consumos_clientes AS consumo
    ON consumo.cliente_id = cliente.id

ORDER BY
    consumo.data_consumo DESC,
    cliente.nome;