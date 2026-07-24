Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011028.outbound.protection.outlook.com [52.101.65.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2B337F75B
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 06:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784873664; cv=fail; b=AKPRbbVxSnwYhNBjlFqETTiRRuKab7mcNNP8TmMK55YaNoLwUvYtNC24qnqGzqiqku5hgkqqdXxNZ6IinSzxoGEW7luk3Nj3IelQgFtySHF76XAWkhP9VPmDPGXKbu9eFNfSrZWf1H7MV7yB2DCLA0jCLfOr7imKbOJMYwLEZDM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784873664; c=relaxed/simple;
	bh=si+pqpYHEzfPMPSCq7ncvVkS7lYT4Z/XUkcd84oVlWM=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=M4eHO5pcjWJINRHPmS99gdu8Vf7KEAm9jqAxoArA3fbqilHjj1YflTCJyxO8WW+zQyNdu2U6FQQkJcSNMjDRxnKktVJ8zYG7zQgMW6kAM+leiycKcaDxop/JkJDePfHsz4Lcc+xLajozVDa0LCsGixNPneq+y92mUkr+VJYzgsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TFZLieEo; arc=fail smtp.client-ip=52.101.65.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TFZLieEo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jnHpRPTO9v9h7gciDhzr+ONlbbS9UtVl38LtwOF4HQyzmZJFYBLiCJbGXWSzco9kbZazM0gB+kP9X0TNCHuYVD/iALkq6iy+dyVF36YlPgQow8+3Lq0/HEavmFGacCdmq2vbRKcrkAM22N15wJP+47EI4fHLjEPwiDk7QJqvkhhlKBn3kO0eKfU/bjn9l4krGFo3vEYa9Dy8kZx8zgDlvA+ZB5/usPAfAnxN1hKAegUNr+s/C1WfxUjURa3Gjc473qmVsdG8K/NLJ9bz6bRD4fdEvKPEQlvqFlgydUWUMMVPcp0rff7RGnuMu3Tatm8SD/bdHog7j2XrV/+24+Z9bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNPUzsghkT5p4sqt0qGq5Sa8OqCFExGoE8yYOCRW5BU=;
 b=ZU4XFHmQhWTKp4V+jOydt5MTjQblddVJvnYcnyQGWLcYvhFyj/ForF+ADdPMjXUqgvo/Oer2L/DaKHTYdNXaJGK1FhjiwMR43+FcxCONhSBXa2p5Rvgr4kgN3wESAH7PockxSh/wD2SUMFpzBYm06q0iDFvzpyGTadk08HoZktCZs96Hr6SryFov43lqIs08UMpM1iBdqmdO1sn6D4N0lcYbUGMEEHYHsbE2xhAYh7sCn7vQFyvZXADso/kf3Sowivp5DmFk1UBiaAh59DeCsF6rS/Ce7YQwoTQEWGEGleoBghTe9vqSmV8kq9sjkaqlExHcbd8KYTdKCEKfEFVKww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNPUzsghkT5p4sqt0qGq5Sa8OqCFExGoE8yYOCRW5BU=;
 b=TFZLieEoo26J55EOgzISatAiGJlzCfyzJeF/ZTkAfYespHlcsCEk9MpC0X9Ac6lT2xxHhJ5BRC9aHaN84g82lcZr671Uy3w5ajF/bcNS2e5lRqFfELGAdmEgIZ3/4SR1TN2PYUk2m04UVGNOT0rXFfnM42Yi++aAdpoeszyJxTIAmiNoLdo2kB8wdRc/BQ/PQYbJchsw+owyBRwMFFI9+1RaVuecUyWTjWQTLTwCBxyKGQVJGjhwjs5wPVQJmhihi8QFZUn75uakzrcitztDiUc/8ndqGkrLgp8XcX4VakxqxDL2bgijM2uH8zk6FlKvSdUfW1DPZsJANm1ZsrblyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PA2PR04MB10258.eurprd04.prod.outlook.com (2603:10a6:102:404::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 24 Jul
 2026 06:14:18 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0223.017; Fri, 24 Jul 2026
 06:14:18 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v3 0/4] arm64: dts: freescale: Add remoteproc support for
 i.MX EVKs
Date: Fri, 24 Jul 2026 14:17:54 +0800
Message-Id: <20260724-imx-rproc-dts-v3-0-175381bdd02d@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJIDY2oC/3WNwQ6CMBAFf4X0bE1ZsoCe+A/jgZat1ARKWmwwh
 H+3xYPGxOMkb+atzJMz5Nk5W5mjYLyxY4TikDHVt+ONuOkiMxBQiipHboaFu8lZxbvZ81JVta6
 hRNAnFp3JkTbL3rtc3+wf8k5qTpG06I2frXvuhyFPu3/tkHPBOwES60KhqGQzLtNR2YGlcoAvF
 4pfF6LbokalgSRi+3G3bXsBXSrkrvYAAAA=
X-Change-ID: 20260715-imx-rproc-dts-6c78f82652f9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Biwen Li <biwen.li@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: SG2P153CA0032.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::19)
 To AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PA2PR04MB10258:EE_
X-MS-Office365-Filtering-Correlation-Id: 4658c2dc-fa12-4b0b-6087-08dee94acb77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|19092799006|376014|7416014|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	6dQ2aMAtuZXB5PpoNvqb9uVmAAUrv25J8+OAXJZP8DgNvkdYdiFa2wO+GUPvQE0lG9FUg2k5y0TDpf2cVgziKdVN5aug8kyuD8xyf8R67mq9NBaZtFEj3FKfGENZ4aLm33Ct6QYJQEYO8RL7sQMmkDN0Q6y+Kv/R7sNPXaT8TD/l8dHMEtCkPtH+mSFtOEylLUPvCIvyEdWGYAilHcSvLSDSgwfunu07zfnXXTIFNGNbuD5rQvy0WTnCgs3gDyJNCWiojgjWPp8ynb9/lhM86rhReTLv6R14oT1zU4BdQe+W38UzUFoTHA7bq7pfVlX6hjeJohswkxIG3rmvEKxQ7pJ3Shf0ZjgNz6FFEpmoEdMrULP7rPPkHOjC6XJr5EW7bibFIFogjmiKA/a4XVIlkiBUioCrUtQ2Cnjl6xy98sppk++n/+UDAQptz3utOeeZcXmUyOoIaPvNZS8n3BGvo8AzSU/nrvItzp9lPAZVSusoXQyBfnFINr06g7ywOZAdI3J4aXKDFes5DArKBVT8Z1ZSL0gjeaZ+N3XrWB91L6xsAJUp0xCeUJLg1aFbcHRjxhRWnLy23U2bpDSpiRMIRLthKdfXyT6mUrYa3x7E3V5kixlfrJv3XHa9TGo585jU
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(19092799006)(376014)(7416014)(56012099006)(11063799006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFdRRXNhNDY5Y3FmWXZLS0Yxc0syak85cjNYcEFOVWoyVGZOWE1rYTEreXZJ?=
 =?utf-8?B?ZWZqVi9ITXg4YXlZclpZU21kS3FZNk03OERmZG5ld0daWVdGK2NtMmFldWpR?=
 =?utf-8?B?NGlZemg0SUZkOW5FeW1QUmUzUWRlL2V5dkFVeTI1aUVhOVYwRGZ3U0duRU45?=
 =?utf-8?B?NDJDWDNXL25tZmY1MmIwOEhPek5kOHlibEQwbjBpejUyUFUwU1hPUWhBdk5h?=
 =?utf-8?B?YWZZb2dCWDJSWWJGVnV3UUFhY0dZYlVCSkMvMnUvckZRLzZMWkZ2aDdQZitC?=
 =?utf-8?B?VzlDWnN1NDc5WnNybGwrZ0liNU5XSS9wMnlycEREVTdQUlhYL1hYU3NBa2JJ?=
 =?utf-8?B?TDZlcEdwOUdQcFFjTzFZVGhYdnlHSTJMQnBqcUxXUFh3ZVpuRnFQUmVubDM2?=
 =?utf-8?B?Y2pZaWQ2NXI3Nk94d1ptb1lYRlVLeEpqM2w4QWNVQitRR3pGQVNiT2p6SjVp?=
 =?utf-8?B?Y0psQ1ZTYkpWR1dxOTZzdGNMSzZRV2pqMUdXY1NTc2FUeUhIR2JRbXBPV0Fs?=
 =?utf-8?B?aXFVbEE4cWlvWk5HNTJKOXlkVmhTV2lJWTJIbk01YzQrRWdvVC84Z0FVWTdI?=
 =?utf-8?B?dllPekpjVEROREZWUTVwZ2puYjVGOU9pQXdiNzRqZzVIZ0I5ajM0MUJQR1VZ?=
 =?utf-8?B?ZEpSUkpwMjdJcUs3QTgwK3JIT3ZzTmc5dys5RDdRQjZabzNoMFB5TWNaR0h6?=
 =?utf-8?B?YXVld0RSTWYybUkxWjZxdWlQejlYOTg5cXdMNDFveXFtdGx0dUs4cmdaRW1E?=
 =?utf-8?B?ZjMzdjhYNlJKT3Z1T0h2SndCUVc3dGR2M2tTOSt0Nm00SHJvT2NpWmlsWmJT?=
 =?utf-8?B?RG8zUGNSbytZUGJ4ZnQ4YmpGcWkxeWpQYlEzMmFubUdqZ0NmdklVTVhSOS94?=
 =?utf-8?B?R1l6RWU0YzJQUWdzaWF3NWUzNGFuc1dGek9uZHllK1l3WDdPZ2d2NnJRRXBU?=
 =?utf-8?B?ODYrWTRoZ0hvNFRQazZxb0lqcitaMi9HYldTb1VpRVpoTGZuamZNRmFVQ0Nw?=
 =?utf-8?B?bEhiZlFURUlpVEllTG1iUDQ4bkZyT3ZOM1g3UzNNQVZKWVYwZkFXR3dpZVlh?=
 =?utf-8?B?UXJhd2ZaTFZhVnlGRHZXbXBRNW53MjBiWEpvQjdGWEFRS1N5RmhLQ210SEVW?=
 =?utf-8?B?YlZCSjhlTk1qMDhsSGV1SEx0YXo5VUxkUStpMU1FWUFqVE40dXhHUVFITmUv?=
 =?utf-8?B?aWVSUDRLYnRUSGxubGREcFNwQUQwK05CWVYycHRXVmkveVNyR3RZRUtaWkxM?=
 =?utf-8?B?c3JwR2xhMmR4Rkh3N1FOeFYzc1JySEdwcngyYyt5Q0NOcXBIZDVTQ0J1c211?=
 =?utf-8?B?amNNS000aFBkL1dJMEVZOEgwZkhOYTVyajdmTlhHYkhia2ZhY3A5ZllXUzIw?=
 =?utf-8?B?MitJdTlqQ1NpVzVnakhkK1ZYR1NkRHZIQTNwRVJuSGdmdFpTL1dQWmlJRWtZ?=
 =?utf-8?B?d29LY0I0UUhGT1ZLRU8vN282TGlhNUo0SnJJeWdiVjRERWI0alA1NExYdzF3?=
 =?utf-8?B?ejkyQ2oxd3B4V3B3aThJQ3l1UUQ4cmsvMjltcXZPZm02U2Nhck51ZUw0Mkg1?=
 =?utf-8?B?NXlleUVBOTlPejQyY3B4bW1kZEVHK0FJS0FaQUpDUlp1WlJFZWxMRnJycTlC?=
 =?utf-8?B?OEtDd3pSdjV4L2xEL2ZJZUdxRmwvdDQxUFM4NWdYOFZXM1IyU1U3VEZpN2Yz?=
 =?utf-8?B?K1Job1BPeUZVRmlBQjlZY0xKYzVBaDRJQThTMkxZZWZ2ak5TcjhSbnFlak9H?=
 =?utf-8?B?RURoL2MwSGF0ZTFBdmxEV0VjclhuMmI1eVAwb0FXWkNLbzhPUEhWdlhnWjFL?=
 =?utf-8?B?NHRWbGVOcG5zQzJ3R0IwZkM5YngvMlhyUENlYUJOaDdkWjJXT211YXhZQlNH?=
 =?utf-8?B?WEZ2ZFhkRVNYblBwdVB0R0dtU1BnVGE0YVFwVmRia2dKVG5PSDVCM3A3SG5B?=
 =?utf-8?B?VG8zSkRVNGVGcDZoZ05NVExjUGdLSnF0V1lsZmZadXdtYTluTldxMVdDeGov?=
 =?utf-8?B?WC9xMjAzYXRZMFhFelUwOGJRamVSZTFDbzh1S3J5MUhPOVZMelZjT241VVcv?=
 =?utf-8?B?S1ZHM0pySTFPaytOZkJPcmhxMGM1TzF3MEN4cURDazh6bWxwQUViZklDL0tG?=
 =?utf-8?B?ZGNwaHdEMjVrRnFQdXRpU0JPSHdvT1RCOXJuN2plYkN5L2NpNVp3TDlicHZz?=
 =?utf-8?B?Q1R1ejFDd1ovQjFjR09DL3dTdE0zaDhFKzAzVmRGYlR1RUNITGpxcTdvTFlN?=
 =?utf-8?B?MS94VDlXQytCMS91V082WlpQcUF0dEVOMThCL0FoVlFxRU5ZTjhyUjZ0TThm?=
 =?utf-8?B?WFh6U3dyUzVyeXdLNmtNUzRTWUNadVhSdGU4UW1mNm1CUHlVdFhjeVEvWm4r?=
 =?utf-8?Q?meQxdodTenreEfK+sxpXlzxefiCaUt02Up4TX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4658c2dc-fa12-4b0b-6087-08dee94acb77
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 06:14:18.7186
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LfriONsBYZmdXVsMUC4SVMhs95WJ74LwLML1YHJ1LTwPusEJQDDJNSp7HDv7vO7Qbv/K7lFIlM9OKTs039ckZM9jV2ZObGuzgOkcJBPtAwzmnThHDNSgC28Kq2We1E5m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10258

This series adds remoteproc node and reserved memory regions for the
i.MX95, i.MX952 and i.MX943 EVK boards.

- Patch 1 adds CM7 support for imx95-19x19-evk
- Patch 2 adds CM7 support for imx952-evk
- Patch 3 adds CM7-0, CM7-1 and CM33S support for imx943-evk
- Patch 4, update resource table address for i.MX8ULP-EVK

Each patch defines the remoteproc device node with mailbox channels
and the associated reserved memory regions (firmware memory, virtio
vring buffers, resource tables and shared DMA pools).

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v3:
- Change to vdev0buffer in patch 2 and 3 for i.MX95
- Link to v2: https://patch.msgid.link/20260723-imx-rproc-dts-v2-0-a5f5cf2eb55a@nxp.com

Changes in v2:
- Change to vdev0buffer in patch 1 for i.MX95
- Link to v1: https://patch.msgid.link/20260715-imx-rproc-dts-v1-0-d02b583c507b@nxp.com

---
Biwen Li (1):
      arm64: dts: imx8ulp-evk: Update rpmsg resource table address

Peng Fan (3):
      arm64: dts: imx95-19x19-evk: Add CM7 node and related memory nodes
      arm64: dts: imx952-evk: Add CM7 node and related memory nodes
      arm64: dts: imx943-evk: Add CM7 and CM33S nodes

 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts     |   4 +-
 arch/arm64/boot/dts/freescale/imx943-evk.dts      | 135 ++++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts |  46 ++++++++
 arch/arm64/boot/dts/freescale/imx952-evk.dts      |  50 ++++++++
 4 files changed, 233 insertions(+), 2 deletions(-)
---
base-commit: cc2b5f627e8ccbae1188ef2d8be3e451d7f933a5
change-id: 20260715-imx-rproc-dts-6c78f82652f9

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

