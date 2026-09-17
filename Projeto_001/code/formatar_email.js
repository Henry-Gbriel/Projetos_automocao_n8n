const registros = $input.all().map(item => item.json);

const escaparHtml = (valor) => {
  if (valor === null || valor === undefined) {
    return '—';
  }

  return String(valor)
    .replaceAll('&', '&amp;')
    .replaceAll('<', '&lt;')
    .replaceAll('>', '&gt;')
    .replaceAll('"', '&quot;')
    .replaceAll("'", '&#039;');
};

const formatarMoeda = (valor) => {
  if (valor === null || valor === undefined) {
    return '—';
  }

  return Number(valor).toLocaleString('pt-BR', {
    style: 'currency',
    currency: 'BRL',
  });
};

const formatarData = (valor) => {
  if (!valor) {
    return '—';
  }

  return new Date(valor).toLocaleString('pt-BR', {
    timeZone: 'America/Sao_Paulo',
  });
};

const linhas = registros.map((registro, indice) => {
  const cor = indice % 2 === 0 ? '#ffffff' : '#f8fafc';

  return `
    <tr style="background-color: ${cor};">
      <td style="padding: 8px; border: 1px solid #d1d5db;">
        ${escaparHtml(registro.nome)}
      </td>

      <td style="padding: 8px; border: 1px solid #d1d5db;">
        ${escaparHtml(registro.email)}
      </td>

      <td style="padding: 8px; border: 1px solid #d1d5db;">
        ${escaparHtml(registro.produto)}
      </td>

      <td
        style="
          padding: 8px;
          border: 1px solid #d1d5db;
          text-align: center;
        "
      >
        ${escaparHtml(registro.quantidade)}
      </td>

      <td style="padding: 8px; border: 1px solid #d1d5db;">
        ${formatarMoeda(registro.valor_total)}
      </td>

      <td style="padding: 8px; border: 1px solid #d1d5db;">
        ${formatarData(registro.data_consumo)}
      </td>
    </tr>
  `;
}).join('');

const valorTotal = registros.reduce(
  (total, registro) =>
    total + Number(registro.valor_total ?? 0),
  0
);

const mensagem = `
  <div
    style="
      max-width: 1000px;
      margin: 0 auto;
      font-family: Arial, sans-serif;
      color: #1f2937;
    "
  >
    <h2 style="color: #2563eb;">
      Relatório de clientes e consumos
    </h2>

    <div
      style="
        background-color: #eff6ff;
        border: 1px solid #bfdbfe;
        border-radius: 8px;
        padding: 16px;
        margin-bottom: 20px;
      "
    >
      <p style="margin: 0 0 8px;">
        Total de registros:
        <strong>${registros.length}</strong>
      </p>

      <p style="margin: 0;">
        Valor total dos consumos:
        <strong>${formatarMoeda(valorTotal)}</strong>
      </p>
    </div>

    <table
      style="
        width: 100%;
        border-collapse: collapse;
        font-size: 14px;
      "
    >
      <thead>
        <tr
          style="
            background-color: #2563eb;
            color: #ffffff;
          "
        >
          <th style="padding: 10px; border: 1px solid #1d4ed8;">
            Cliente
          </th>

          <th style="padding: 10px; border: 1px solid #1d4ed8;">
            E-mail
          </th>

          <th style="padding: 10px; border: 1px solid #1d4ed8;">
            Produto
          </th>

          <th style="padding: 10px; border: 1px solid #1d4ed8;">
            Quantidade
          </th>

          <th style="padding: 10px; border: 1px solid #1d4ed8;">
            Valor total
          </th>

          <th style="padding: 10px; border: 1px solid #1d4ed8;">
            Data
          </th>
        </tr>
      </thead>

      <tbody>
        ${linhas}
      </tbody>
    </table>

    <p
      style="
        margin-top: 20px;
        color: #6b7280;
        font-size: 12px;
      "
    >
      Relatório gerado automaticamente pelo n8n.
    </p>
  </div>
`;

return [{
  json: {
    assunto: 'Relatório de clientes e consumos',
    mensagem,
    total_registros: registros.length,
    valor_total: valorTotal,
  },
}];