Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013009.outbound.protection.outlook.com [52.101.83.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E5A43CEC3
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 16:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768926359; cv=fail; b=OkJQuXYqKJBWtcV45qLlUTJ77kN4vlEx42CK22Evsw0GJyqQc/O8XNJrfW1qsYGc92yJZg7z3N/XXlCzCCbI8nOiko+TgCOFRfeMZLXIBRrE76kM45Duwmt31vUtVjE9Y04couIBXLBGhiw8yfKS2V72qi0p+4KTiezWN+HAdog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768926359; c=relaxed/simple;
	bh=h2CNM+o4k56iiDsqG0ofYQw2A29Eib5D1KwdAmKyOLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KHN5QQ+8adDfMNIK1mTdl4AIM7Xs9nie3e1E4jBCvGuZHPFiXjBFcVs+riXFzShfk/g3LHZU6wxYKbJFjT6mJ1Dv21BtwszCaKJpW5xEUVGEtU9wo1MPpIjCVuYLvFtuM5f87ZFuyA69IKamSpeprf8o3OM2rJAOU+3txo60UGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=C0+etfV3; arc=fail smtp.client-ip=52.101.83.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="C0+etfV3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ub+GqAERD+x3AZ4lZywWOvvRf+i9Xq+eVWQrhxSUKS3MY/brF2Pu9hmkJcqPEO5wxmN49OzSK4YR2/BvXGCQ+LR4g+AMGsfzdurlnUczGeyuAdzCygHvf9THtArihldVGmZkXCzEdIXWKcRqGXrrQZqJB8grhnsroigJ+U6Wfl/rP4//+g/PMWgt9jmLt8qCVyCe90eCsexP3FAL6u2Hr5ft1hMkSLrt06A3HzCUq+6ppRv2Edm/2Ck76O2ABpGlAOSworpzB4WIcuurRvOOrbYB12JbePDHdTDu5h2s1x7dStFE+vvpZ7ovYOT14fqI/KLf1fb29vLdKJcP3oEyAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FeFWDHrGN5pyrfoRaGTcqOUYfR0ubT9bWdJhRbBPjL8=;
 b=Hu/RoTxqUlYiKfojqLUc+S/EeGKMjfk7FBqBgiWxS6P9cyLCUEMc7dYXEjTY66DBKShbwY2co+4tjQh5BNMNF6EnorSqp8H6wk7euLp/LKv9TN2/1wV+hCc+VaEi+vP9L9YlkteQ6iICkIqObQeXA/Zj2BNmObaQS2wT8aa0jJ6GD90bKDyP/zMM3Pyf8mQMik+bsG5IJoYSU2JRRrPsetXSsWU5dgVQ74OK/wBJ6nJfWz3u0RRTzl7NiizwChh5dNau3v7hpNg96lJTS9IVnmlLiaOF39Vm4rlfLC2MelHjFwDnyPLQDB45UITA/S422xbrUZ7h1xQ7/aPa6+aXew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FeFWDHrGN5pyrfoRaGTcqOUYfR0ubT9bWdJhRbBPjL8=;
 b=C0+etfV3JeeMrDLLz6Ylrrb1ug1dMDZZov5SbPj2rR8xVO+Ae1l7aUUIObTsZzfMoRiEpX4i9B3MTKm5HLAIgp4ndnZ1JXpVUA8CZPmG8cwAc9Z3BwyfcA9oLwnXdcwotS6kNs2UGfGxozdutOxt87TU3omkvfCWUYXqCLcN61KQFzfkn9H0JhDdkDvstQpoQoz3FpTcWimDY9ZTz0oc2kb2sjXMznZ0cleSGRI+zquOQIM0Mr/mEM/ithG9tXrIJGSNBXr5e7TvyXKw8WgEAWNm4OyHGs9xewFLX2WtkIcrtvbVrMekEbxawBqZSO4/O2XGuUcdYbModOmyKCjKqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DB9PR04MB8332.eurprd04.prod.outlook.com (2603:10a6:10:24f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Tue, 20 Jan
 2026 16:25:50 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 16:25:50 +0000
Date: Tue, 20 Jan 2026 11:25:42 -0500
From: Frank Li <Frank.li@nxp.com>
To: Joy Zou <joy.zou@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Ye Li <ye.li@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx95: Reserve eDMA channels 0-1 for V2X
Message-ID: <aW+shmRG/K/T/UjX@lizhi-Precision-Tower-5810>
References: <20260120-b4-imx95-v2x-v1-1-52b2025b27a0@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120-b4-imx95-v2x-v1-1-52b2025b27a0@nxp.com>
X-ClientProxiedBy: PH8P220CA0051.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::34) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DB9PR04MB8332:EE_
X-MS-Office365-Filtering-Correlation-Id: 266a7817-2c32-4e16-aa14-08de584092db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|52116014|376014|7416014|1800799024|38350700014|7142099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J+/1j/fYi+fdvgUPu7DFYFDzLGv7QU5nxxAMNMa9EqZ5ee0KWvPdUYx8MErA?=
 =?us-ascii?Q?m9YAGsjHWXG2LXfoKQ5z0qZdtWEgXRRaEKp1ake2Ma6zquD1LkW9SPAS0VOz?=
 =?us-ascii?Q?GgEcp9eJI7PAChEhMYOUouQK881CzxkL9W9Qa5jAcW2igd1cz40srvELeh3i?=
 =?us-ascii?Q?bJrpKFO9eR1XuPKVKQMDccgQU9Mi4hBFLogZQqhuzVq+AksZrm1Hwk3Q2s5E?=
 =?us-ascii?Q?fE8w0fGq9w12NJCSQtnHKMx+HGZYshm61pUja9z2sl6kq36CHNx99O8J8Ccm?=
 =?us-ascii?Q?6w7K6I5tn7G+4Q4qPx/pFcCpWYPVFv5q4+f4rITEArkcacEQiNrOhKz2X1qE?=
 =?us-ascii?Q?WTwM7xshKQvnMDKohvDSozK07m/LfDB84RJorXfsVYUrydKHA86aaUoTVs32?=
 =?us-ascii?Q?IH6dLq7lK4c2kH3Mv27E6Negx3oVEG+sleqalF/pnxdVtqDXjlJlVUvGKvR2?=
 =?us-ascii?Q?9ja0Wj9pU7yX37D4l12o9tBqNRaWgVjah7c2xilSvrY8RP3HJf0X/KJvAZfq?=
 =?us-ascii?Q?9wYjhLOjmv+VHBZZ0xedDUzszhY/Bgj/iKQnrnIM4WtwIM0jLjz13Pf6eQYK?=
 =?us-ascii?Q?qskys4pLDJVjhngFDC7WvfaODpoLa5KK1MuIP1/dGyf10wAw4ddZfE+Qa1AP?=
 =?us-ascii?Q?7+1g5fMCr4UXxkEuNK2wZKGcZ+0duSOsD5Cc748ECZ151R6LwksDUxsPsjWP?=
 =?us-ascii?Q?73OGk1FVCogHzxuy+VKIEvb7D/fPVlNTz6CoQfi6xcuaCcK3KvOuVreHSPer?=
 =?us-ascii?Q?eOed+c24FHKjagsoWCmmHBHpxVSr+YOxuRh/RYj9wx40xVzpTncXVNQ7b7NI?=
 =?us-ascii?Q?vjeGaAjku68PUWl6daTqQgCHszWx3Co8p97pkm6VuiooWsDGJkCmycqP1Ejs?=
 =?us-ascii?Q?GJvMK1PDlXPwsaJ7Nj4JSGueMtie/tvbJlWrZnQFfErtJ/QoI3CFngyBmU/v?=
 =?us-ascii?Q?OOZJXQHwOL2zLgT0X1GkU9Doh2X+bdiX01T0FpxyW/bhgTxyTuCJ0bwHMPgt?=
 =?us-ascii?Q?IWbJNL6kJiFEBto9SflK9q9Sdlbc2ddibKslk5HvwiAkF8Wnot2vtKZ+dLwv?=
 =?us-ascii?Q?CQ1zgYcWL9V5pSvGkLg1MtTNBfLqXb3cCFmv7pfHwekgsmK8jTKACAfDq5ME?=
 =?us-ascii?Q?97nR5HQlmNUD8kYjCtg98l24IQXfD+7VIPV6hvnyNXuA3moWjRP3/iOtK2t9?=
 =?us-ascii?Q?KoSDTiIWQLTjUy+DGkuLbY+1kM2NlPDDQP+OBN++NQIKMSekEQRti6Aq8wwc?=
 =?us-ascii?Q?RH926r6IwNqpGwCwwqDukS3yW5elGQmA1VcE0i5Ekz7IixbXooqxyihyrZwW?=
 =?us-ascii?Q?UhJmcSd0nfCLJ2mtttCcsXgBiChLavsjrbnGrG+42G/T0EuK2RoJ2TZwgaZn?=
 =?us-ascii?Q?/GY+WkXjrQ3Q/uaIzUrMfAV2dElyHpZ/0HGfrVLvg8QDPmpZsY47L3n5hFrW?=
 =?us-ascii?Q?OMpDXvCYHPUCTobwfgh8syoSmDnjIAf5ip2Ku95bO33gN+8Veog4ME0boY88?=
 =?us-ascii?Q?KGGgYgn1rKTPWmhIvHX9QITocayiweLA9ronnmHpDGteY3FPneyeDOa0Pdy6?=
 =?us-ascii?Q?R2DAYgrexB8i5ABgvHUNJEHvEABMrSesscIs2QZgY9o0NyAvujdIiHQFMpdU?=
 =?us-ascii?Q?YnoSKSf6H/Gs0ioFzpm3sbY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k/G2Opxy25Urzxqd3oVVsJ3j7Gi1SRO6AQgMvuyGRCtglfvwm3nXkHsRdw/Z?=
 =?us-ascii?Q?JHHce1ahPjBHZPeZ+l/DO1tilzlPqwbMpwRIyE1qSnAqR3xHUZGCACCnqdAJ?=
 =?us-ascii?Q?zf2ENf3HCjY8jrNhygj9cJbGpXU9+mthzGrqIKCnM9Ezaksee8bGWGuRHT+1?=
 =?us-ascii?Q?OcqcMnoti+RZ7RArR6L7Bw2/oTl4Vq0PADb03oW4wY/8prQA536lkKHse8L3?=
 =?us-ascii?Q?RA8LC0PNPV061VemjRoAoZrFPfwDYdLRfEr5x1n6ODQhqtN8w9qwOlHUI8tx?=
 =?us-ascii?Q?W29+VeFPyOovV9hJGxz+QxPp4CiZd0fc6qL4tPTNBN3U8PcIhh+MGKM2Qz5O?=
 =?us-ascii?Q?+UlzTROvtxvmfTPhtx/E5DxX5mptHafcuz4hosZjnuUwVXI53zHiJzkgCEOt?=
 =?us-ascii?Q?OUULyFNpSmhg4aTPq/19tAsouVbHuN7Se7tkfArbPXZNc48uIcvl2eFCHSEA?=
 =?us-ascii?Q?sRBIg/PILojmQGOr32B9weRNeYVV9ipZTszQtfenBnORkB3fET8Y/HmIgJhU?=
 =?us-ascii?Q?8yTD+URezBSEOZo84RvCLpe1kspA/BV8EmBruWCl32OKtly3XEpzKV1AITln?=
 =?us-ascii?Q?YeLeHQkYhR7etq/xGrxiIw0tSBypRXeTHHmsdHylqjhyBSOKp/i6fJ6RpulM?=
 =?us-ascii?Q?I0v4cwdVoU0X0jN7DjfFI4k9UZCI2Dpvb6tNysWQs26KYlKKz3Ztk7mKU2ch?=
 =?us-ascii?Q?jaeD8YmlmkP1VMP/holw6YsgmUgp9+FcMVzBAySyXZ5VnPDh0M+tYtMchGej?=
 =?us-ascii?Q?kcUzVcwJFwUtd9LqY5Jd5tO2R96vv0arz7e540EPssPR4MUQmIzmIoT6gOa3?=
 =?us-ascii?Q?ftcwoKFCIf67U76asZ0DzUxAItwkIt0h37o+ep55QBy0W0XvrosLSSH6r7c4?=
 =?us-ascii?Q?gnv61S0w4kt+Ej043HNN0k0QnV363kHA4DOb8AFDXuFzqtMyQrfXSZizcXB0?=
 =?us-ascii?Q?Gy1HNIx5iCkzRSwjje8yekX7C3QQ78gblFAxCFsN5lQCZ5Khd7wUMqeEHGaZ?=
 =?us-ascii?Q?kgEAdUpLXWTrFX0s/fIVFJvsUF2P5uLOncOcfGmOH5x/PppipZeeYHPzrkAT?=
 =?us-ascii?Q?4ZAyUxVu4NBGxtF09HTxiBWb3gkyGClOA3JLZ0z0ABoyWyQZsewC96IQiWCX?=
 =?us-ascii?Q?NMrndzpVBmAKErjRADNiYJY9HOoAtbAXCiO671Rr2vYdfzAH9oGebgAsOeo6?=
 =?us-ascii?Q?ATcBObfF4GgOMLMVCkijeqB36D5El4kP1jaxy67MPokACVnU4Jth1dayab4l?=
 =?us-ascii?Q?UK4nu+6uEEYAWwFUpmbr456BffLW7IH0YtNGPeRpSaCQ8NzH8hUrdZs3fph+?=
 =?us-ascii?Q?I9CsNHsEv7/UeCm4zoCmqdwV95m+6B4OEFJPzyDgNUSTmq2xUo3mJxrk/inw?=
 =?us-ascii?Q?XXH8QzVzpe2ApNHBizkLBls9Xpdf5HUXnz9HBsOTtRIHBWmVkDU/OmWo9DEz?=
 =?us-ascii?Q?o+5w6IBsEU6oC36rwWeZwwmWhmMgeqh6FF97cmNTfyUgkzXfHcv5hpm4RKKQ?=
 =?us-ascii?Q?XQB2+W0gj5Uwatuvf4ZtAuhsfm+IhC11NBnGjzAI62JjkFAjXD44/poUPqoG?=
 =?us-ascii?Q?TpFw03tYTCjo52qufdMk7RcO3q4IV/tn+vfhllhAwDP7Nsry732hh5z0nZrV?=
 =?us-ascii?Q?qp9uhyZZkgrBx9tYotB06uTeDOqpqvy7ewM8cmQ2CuCFq3ttGvUjV9ESWZnG?=
 =?us-ascii?Q?MoTdC6E45nX3mGmGjK6HkCMfIIgddycxyxuiKcrZDMv7dLBP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 266a7817-2c32-4e16-aa14-08de584092db
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 16:25:49.9277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JXMIoFjIJS0xuxsmheGZb4hZj2IjMc3zlbAhoCgcm+kRhWliWQI+aEkn7I94lOWsVyE/wDiusbpcpffWlVCVNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8332

On Tue, Jan 20, 2026 at 04:35:50PM +0800, Joy Zou wrote:
> Reserve eDMA channels 0 and 1 on the AXI eDMA controller for exclusive
> use by V2X (Vehicle-to-Everything) fast hash operations.
>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>
> ---
> ---
>  arch/arm64/boot/dts/freescale/imx95.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> index 55e2da094c889fc7c1096d0e36f31ae118d2a982..24d02aa18b2f480bbffdc30bc41c658fb3aaf67a 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -631,6 +631,7 @@ edma2: dma-controller@42000000 {
>  				reg = <0x42000000 0x210000>;
>  				#dma-cells = <3>;
>  				dma-channels = <64>;
> +				dma-channel-mask = <0x3>;

Can you add comments here? v2x needn't dt node?

Frank

>  				interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
>  					     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
>  					     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
>
> ---
> base-commit: d08c85ac8894995d4b0d8fb48d2f6a3e53cd79ab
> change-id: 20260120-b4-imx95-v2x-3e01c7bc6881
>
> Best regards,
> --
> Joy Zou <joy.zou@nxp.com>
>
