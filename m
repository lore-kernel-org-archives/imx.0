Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012064.outbound.protection.outlook.com [52.101.66.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04DD34402B
	for <imx@lists.linux.dev>; Thu, 14 May 2026 18:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778783929; cv=fail; b=czKLeVyVK4uq/ClJLimhP+C/wmEr5LY1WxfFjylHNX4+409qTt7roukUIToXDXL58wVlkbbQdomQZFK4AGx4gX9NSpmA2/Zx7VnREwhUviBfyGjfLsz7UnQ3rGQ8iDqacu91QKOKpGFgaRYRmJPUy9DXyJyUpSPQslduUcMzsjU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778783929; c=relaxed/simple;
	bh=Zclf6mTTlXpVTi/Zw5+RShNz6yJ/1MO4E/oVfwOIIHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Jot6L0R++GUbBoGq04CTcnjYM72c/XAulzF4q0N1FNL+Xbp8Cl1M3lMu6lymnQZbr67JxGk/a2nfJIALgbHxk36x95eLePSogIyG2s10QXExwUxPlF/44bgFCQd1aEBtlOaot5Jq/e4Rre2lM/UAnXKi50SWS9ov9UhaQsTrs8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bT1kaAaD; arc=fail smtp.client-ip=52.101.66.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bT1kaAaD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b5Xrj0nWdjGta/oFDG95l0k8omrmz0cE1nnVv2pUfz8Yd4+QKzhHsCkO+xsBsl6mVR8AEsC2kQbQ+Q5ty2F0d2OyflHuUmQPS7RpmzzPPHBDwdAVMAY48eurnByFK5hWivbxJsZ59wBIB1t3/FgPpviquiJ/V2U/BaBM+D/kflyoBDTFFVqSX4YD2zles7He6SaOeEqSncB/piTM/u/sK9W48fApsuNNjHhBIX9D2KVHIEwQePiNSb+CaSja1ydPWozJ0JyWLWmDxuG1c9RB1tLIZTqtXvMFdPXzBoKuidYSgPVzBFC732biMhcTwFZlyfBYYRMAeGPmbAGyMTHx1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2oVIC25K3l4vaP+V6wpdiBaxJrT5wtVrekZ77OU7IA=;
 b=QU/QM4s4W863HIvgdsCHHd3PpqsapgB/28YSzI2fuEAKpm8eUpDi0M5k97aXLlx/8e2L6SA/ryEjmJJw4z7UdaGneFtA+yDTaPv79EcHjRwlalocIfJq2wlpklLkpHblrY3it71KdesNBLjO2w3MehhGB9M9sY0HttuHUjGgSC4R3c6YtfHIYY0KW97gqcIuxxPUUMMYa6l9mGiZWfg0ZixfOEY5VPYUKGBWeyAKwWC/RCrqsVb6J+hmQpKKMKakOfGNCl8oRV3RNO+22m32riSPBeMdfkqGGzFZwtDgG57j2STRFjVuP+ulf8C4nDi6XUrY11hXfLlVMdE2rc//sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2oVIC25K3l4vaP+V6wpdiBaxJrT5wtVrekZ77OU7IA=;
 b=bT1kaAaDk66edBY26ZiGnAHtHc3AgMyoMvO/5tfWYquwmk67xjzh4e/0xx+xVG6yrN1z0DnkHM+Y9Wtb6nIrbAVhMX4TLd4xALoNKQK3pPB6kkHEc/vRke8EPqwHkzUiTT8Ag6naD+cdIqeLD4rSN7tC4+fsp16+cKwzptVe3Mm4q5vq83MLmZy6a3qPyODG6Ow4Kkmwpdi66Zky/XoYGo83TKZ+iRhX+tHfYXyrFwSXv+kbl2ce4c+rQvJadKbvjDAMMRTUfW6LtbfVFl3A59iZva/3GMt3kiQLPckbc1IQ8lzdVuwtEQSqXSCTQZLsBuJYyzR2BYOLNg87Mxi2TA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB9938.eurprd04.prod.outlook.com (2603:10a6:10:4ee::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 18:38:39 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 18:38:39 +0000
Date: Thu, 14 May 2026 14:38:30 -0400
From: Frank Li <Frank.li@nxp.com>
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: Re: [PATCH 2/2] dt-bindings: timer: pit: add PIT node example for
 s32g2/3 platforms
Message-ID: <agYWpjBzgMXE6UbG@lizhi-Precision-Tower-5810>
References: <20260514070605.996462-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260514070605.996462-3-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514070605.996462-3-khristineandreea.barbulescu@oss.nxp.com>
X-ClientProxiedBy: BY3PR04CA0005.namprd04.prod.outlook.com
 (2603:10b6:a03:217::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB9938:EE_
X-MS-Office365-Filtering-Correlation-Id: 26d33c13-2286-4bbb-f048-08deb1e80465
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|7416014|52116014|1800799024|376014|38350700014|4143699003|18002099003|22082099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info:
 aBecZ9MbWuZCuQmKcSTErftawfI+80Xrm46ITasDTBLcRKEBksYcgWqGQ9xAvxsao52WyIvwxXe/zJOgvtEWlreQbWiZAYzbpVNkcP6LXn4rfc2YmO+ym8jxNNopfiHK4yMhY5JuC43dsXwgWQyCUSHWKmEUaZN5kP4d/i0Nhmcs+FFQ46IvTNUR0W69PSFPtsPSaS4sa3xOmbpnsYPr36bPcmh9STcEMnXtwfZN84eUeYCg2yzwk1ooiZw1mkHRkKaamBuSsYsI0R2lq9tk5mrDEr5J12KVl4+QGyURuJIaJFQttA2t791nd8mhLNUiIwPxf9/W8KT7tZJYaupiZqniQ5ZQaI5hC4anqQvFI66y+MIKJDQ+su+a4KF8UhbkgJ0eS7GIZVpQtpY5wuOhCQ6qUVEUXcXm0caNI7CYHZ9pTV9s+hW6V32Av8UURLDq4NqpHwGPVcSkrruOJPMofU+bFOhSb2W4uHdckgvjKihvVosVGVkGmHiWMgDT8EEJwYQDpKikXvIWvxunq3xF9ZnfxWSP3G4oAfppynkRzuf0iDhA/wF4R7OJlq//Olb9NmyMdSkKdje38Y6eZ6odF2f9CjkNes95UWNhHmZIng5cPfUvZovX+jzM8s+hTM6pNtizFNJkvQYaoHhpExlqlOqTTdwDQgr4N9KrZYuQS2WdtA1bNoikaw5WATlZZY4cgzDVVoI3BtQf48Ac5uWlxs/Oj3Wn7KDlld51GsSaRuvnIIcwPpZBsOc6WAPu+GMK
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(52116014)(1800799024)(376014)(38350700014)(4143699003)(18002099003)(22082099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?YdAkVoTPMP0PAi1Lx7YRsElgyBDUA97fpN4mH4tx8FpmQ5t8KLKAFb7vyqVq?=
 =?us-ascii?Q?HJljzMf3ou7W7ler2K9a0cjRlBfbD7PO2XI1cwk9Cz6Y3ZRnzI6zI4TsrH/t?=
 =?us-ascii?Q?yRGB1JhZ+ohBaf8SvcfzTfBLDxCOakEkUAG621a77JFNLOwC9HgFCKfgx7ne?=
 =?us-ascii?Q?TnwGNovhrXST/lLv8PRnW+rimUMpZUAdGpuQm6ZNHoAEo8g85DZBUDsfxth2?=
 =?us-ascii?Q?xW3b/yPuoiP6NZ7FVtqDtP49eEsLUyqncCTJQN0yEk9d6BwVHAv5KHGj1udT?=
 =?us-ascii?Q?U0rOA3QoglX07DAulPvneZwbFFGhuNoYwBQDtZ3+JLtuz4A0MTaK+Lv6Mjq6?=
 =?us-ascii?Q?GFINV8Hfo8c8bncwnBS6y7z+Ip0PLG5JjDUpdQrF3bxU0xg1CTH9rvDQJV6W?=
 =?us-ascii?Q?DrH0ryEAOBULAWCFTprPf7Uao+v3wlBHwKTMUdCG7xzXBp7W8hhOi79tYn8K?=
 =?us-ascii?Q?gKQ3a2Q9Cy035xlaj03vIVF0V5CyNXr+y+v7YyOtQcEcfWdmawVbVxPw9Xux?=
 =?us-ascii?Q?j+YnvpdyBfW7FOkUwdRRTLeYrPUOqRVb5W0HbRqq+ctrvoe1Sgd+Q+aOgJ1H?=
 =?us-ascii?Q?qEKeuu9n8x6YKm9BhmJgLQCSBFVX1GVzoOSGYk4Ol32TkwJ1K59Ilx6mu24H?=
 =?us-ascii?Q?5AQQnshFSXsRAoot5HRhmlqAJzN3D8LrVlRgSIXVWSIEBE8W113IVGVzhD5s?=
 =?us-ascii?Q?xz5YGslGQb7PYfZf3n0PrlyO+wlHFtS169pbX9ONccIwoT02BDDy92xemKUR?=
 =?us-ascii?Q?a1/EOHn3YF1DfwzlNNJztllOjFKxtp5rWuFOzjGAPba0LB95VsEzoL+n++UG?=
 =?us-ascii?Q?AQsUD6afPknfqwSm7eYAwRH/7VWcoJDpt00yVGJkAsmOnA24umD2zzA/qa1F?=
 =?us-ascii?Q?i/pba1wIWWqw/hHEdfnCGFAJh0xzWLeua3umEP3nBIVzmhHRF1zRKRouuTqM?=
 =?us-ascii?Q?RSiPuRsIjnsLITg/Io7Q+Dy+trNWhWpJh5qHErCdPT1ICZKlC5l+HsT3nydo?=
 =?us-ascii?Q?oS3O5dsOnYDdK+CoxNejTwBLkIqfmppzYX0AQcjbgQ5tLUqz+dbm2u0BFgWh?=
 =?us-ascii?Q?6ywOskR/1iH8W+iIgKXbh9wXYwzEMCPh8RtiDjMD+OEXQPezAkRnLN/7CrFh?=
 =?us-ascii?Q?FSMb7zvgV+M5OIQisv21d3YR/hGdv+GskGvSoR2mb37RDZEvtLsxXZVgYXWr?=
 =?us-ascii?Q?c6aGRTSwe1XokgB/QK8goQiU/YlrvUkRI4wtxTIK47DHWay6Bh7VzzjtTbiR?=
 =?us-ascii?Q?/32aChkxqhH35iL7f1le8/kfz4uDxgm3UwACqANGASG5DseOQxKRG537n0f1?=
 =?us-ascii?Q?9nhx3m7vGYCklnFP3sBbfJM1uIOAjgTcb4TB0wpZdGtqSK7gIsGrzJYP/W8A?=
 =?us-ascii?Q?oBHH9qEJyzg5V//E9POKZ1cH774xvTZUNvG6VOjLFNCGVdhc9PrJ+fFKl/G7?=
 =?us-ascii?Q?XRoFHte1sYLiLfUkfx0Tkw/P9v51NHq00CqJJKWYe5GFTLzHrUVe4OBvOX5n?=
 =?us-ascii?Q?yBC7VhzSqXmRJYpF5RpmVkDsN80hHumNqdhPw8MGEVEJEIHbJzeSnJwkHpS5?=
 =?us-ascii?Q?rDfwBKhWIwHfZtNwi1KReIjrqBnKzwfUdRuPGaIVJhiKK4JVs0BiHBPlZ/tu?=
 =?us-ascii?Q?owdWLHlgQi9Hs2Lt1b6Z6KCdNGSQSeu587LNZZ1ER6YgedN6B92BxIsNozOx?=
 =?us-ascii?Q?ZvQWOq3N41XGXa6tduU/rdtAWeVtzKIV55zRyGaBGtKEsNXyOzr4u1UQaZmf?=
 =?us-ascii?Q?8VXMRiv92A=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d33c13-2286-4bbb-f048-08deb1e80465
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 18:38:39.8688
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tGsiFPSMhW+Q5yBVl9mGDmFJNkOeAxLnVjVX9hLc0k8T00F0sQSCOoa35mQmcJLkBD2aM9wAPuwbpCxzw0V8TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9938

On Thu, May 14, 2026 at 09:06:05AM +0200, Khristine Andreea Barbulescu wrote:
> Add devicetree binding example for the PIT timer as used on
> NXP S32G2 and S32G3 platforms.
>
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
> ---
>  .../devicetree/bindings/timer/fsl,vf610-pit.yaml          | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/timer/fsl,vf610-pit.yaml b/Documentation/devicetree/bindings/timer/fsl,vf610-pit.yaml
> index 42e130654d58..8696696776b3 100644
> --- a/Documentation/devicetree/bindings/timer/fsl,vf610-pit.yaml
> +++ b/Documentation/devicetree/bindings/timer/fsl,vf610-pit.yaml
> @@ -57,3 +57,11 @@ examples:
>          clocks = <&clks VF610_CLK_PIT>;
>          clock-names = "pit";
>      };
> +
> +    pit@40188000 {
> +        compatible = "nxp,s32g2-pit";
> +        reg = <0x40188000 0x3000>;
> +        interrupts = <53 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&clks 61>;
> +        clock-names = "pit";
> +    };

Needn't change example

Frank
> --
> 2.34.1
>
