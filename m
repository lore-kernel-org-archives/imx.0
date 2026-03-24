Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010026.outbound.protection.outlook.com [52.101.69.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142F02773C3
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 15:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774367283; cv=fail; b=nOdx/aO7ppOtVtZ15zxyzdmpSuXXOngkl3w1jNZBxfY7A4vrStBqYoyA8jXukAzen7U66MoDnMSHHz1hNEHqHgPKruHKeVKU5iOZBMyoohJIo1Vt0Vsnteq+//gb4zx7T1uxDZFtm966+FHhgvwKwlGSN0KwKtTwNToJBHu6xnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774367283; c=relaxed/simple;
	bh=ngPGyjV1ODR/6stEuO0LgoxwovRGn1erW1XbMS4De4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=h+6oLLKDjRI4BY1spYm5/yFbIVGFH1g21jECkfSdg6AXVorLQUrKQQev3mCmwGfgsV7Rp4sBOQi+iN99ySGwaRc7mxxs+o7aOdFoU21HWEGfaEvpcTmyk8vZlTBPH1aVgkgIeFRgQsTJ9CgtVwjAYhiZSn632DcKSgaV89qqPwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MEABuDLW; arc=fail smtp.client-ip=52.101.69.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MEABuDLW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vWyRD3BDLtsmehuaYGfuihbYvjCLxxUghk4EhQg9wJEA3sGBPh6Q4P3PiYwe+f8EcxjjYLOM8bslDQe7O20Ve+F9WVNnBRr2s/ke6WmtsLDYf2kGithH2mljCJ/HYhIDwBHEaZCAoStT8lqHCJxF0uN+jkUOOd+P9XIuQQ6Xo44P952ZVUJqRGIwqDNKIF8kRJtUZez2pPS4M70b56kSIM6J6461CWDP1NEIfwDN7OJ53B1m+YfNGsVXMDw6TBOT0nREc/Rz//IVmckS1jZ4ZKYECbKS3rxoXLjJE2h2/hZ/NK8WMqWW+z7bCXRvL/H4YOjRZrj8Aum1WI7fQduBiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUDK+NyK5qKuM3I/BmkulAYbRTzZXqih6fsQdf8mKHA=;
 b=gPZhs5groyODA9VfPJFgytU/abcKKeQMoMEB28L9Y/01IOaTkEXD0m+cKCIeYkk9Lqv3d5KPX6qO7hFdqjbZV0JEC8QEHvdseuldOW9WR5UJOLOHBLUlvxv0V8ZmyKY9WkbU511ARaU/8sBVRBU69Dhp0U5z5Ve2PCfuplIzQeGbEBCTbbz6CqPNPRSW/yBdvry9CqUszYlOUWBBwzgpQKU0b1m9AF3qfg7KtpsqsUP3yf+fQ52+q0EZLKG/bBHrIJK/VOSuQ9aLSqtlCJeF8nECzmJlFYUXf+ZLQ12smWeCVW9UZHxcJMouMJ+UrIY4kIfZHRUaxa2ybzjmW7KSpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUDK+NyK5qKuM3I/BmkulAYbRTzZXqih6fsQdf8mKHA=;
 b=MEABuDLWR7qOOD/BsOgiVr9pi4Kbh0VJJWAXy/kzwSwXZekVr9MDo8A+7xaqYLhnnEJMB5DpgR/Iz+r/mE8ESBTRs43KsxabGPrXbEJt+yrEDu4yx26UcKgj/2NjDWH04dbGqI6XNNz9P0WayZASGZceSi5AGlRJyVVZ2kR0qpfcF5JHFG1CzH/9XreRbPCvr8hz5hCMXzfzyW5Cw29f1KGi6VftJofmCS7OGeDSiHMoa7ZwECSdAPuk9lMfByd9/D2pzcv0pV7pc3QfjE6Owq4ouWUZsABMv39J2uQEO7mCS0GFUGVTVy80BOxZsP3bYu8g2mCCy2eQckILHMzqoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA4PR04MB7629.eurprd04.prod.outlook.com (2603:10a6:102:f2::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 15:47:42 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 15:47:50 +0000
Date: Tue, 24 Mar 2026 11:47:49 -0400
From: Frank Li <Frank.li@nxp.com>
To: Eduard Bostina <egbostina@gmail.com>
Cc: daniel.baluta@nxp.com, simona.toaca@nxp.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] arm64: dts: imx8mp-edm-g-wb: Use 0 for reserved bit
Message-ID: <acKyJTkqq-bV_3jZ@lizhi-Precision-Tower-5810>
References: <20260310091054.2029912-1-egbostina@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310091054.2029912-1-egbostina@gmail.com>
X-ClientProxiedBy: SJ0PR05CA0098.namprd05.prod.outlook.com
 (2603:10b6:a03:334::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA4PR04MB7629:EE_
X-MS-Office365-Filtering-Correlation-Id: 6edfc991-3e32-4a59-feb8-08de89bcb41a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|19092799006|366016|38350700014|56012099003|22082099003|7053199007|18002099003;
X-Microsoft-Antispam-Message-Info:
	N0J5wm9rsG5nn7dczmYnZPkhRKzVHD2WL8hDpfl7YOz9BHQ3vABspyo2pQosn2/9F+37JRkMKUFMZnVvhoYBH2c2Esl0fpmRdYzIXe8WBWOCyBS3caF8JMC9GNAz+47iSbT9o6DNOMD5VwFnuZyzus4wjMAcD+RY1TtFI+XAkMnrBHShgOrhWcsPB3uThMYYYTJZ7TuYsWoc4lFUfR5vE5Ukmnx1s93uKPGYqZkDM5cpMAymxy4Nev9izFsS6ulnZ01k2B8hm9qvcACTw0/jn2GkmaDzmaHOFgXPibMsrsY+2GR3oyby4yGKtTZ8w1NTI8xyOWeUvWapSD45Dr+8o0BgKM+jWoI1XIFTP9oL7m0Pa5+or0jnHs5tArd2OLYvanF84sVRFUaVQpEZVBZxuurPZjd76VghJw4QYITJNUnlK+eI13Qb6X1s1I6ukaDmrVPdrxuDP+qWIGR9OAEH6tmdWt7FrCCYb/ULOfKy667JDt5SG6/Iq3z9X9aqMhYiIGQ51RAc2mF35ZsHWyvxUXmZnQpZ7zP+sJI9VNInTBtNqLtzGChxLZjbBp3/lDtlCEBpfE912uq7wbLGJKK4EdqI32vqGe8V4sug9RZaBX7MZvl2gicJ9dptX5tpYGC1BRCuEC2Dx1Ms75/kvhNkIWq/lTA3iaRycfYvK7JQgvv4Qm6f4i/yC2PnLcK9ccgGzRhr/oro9UXgXTs3IXCV7x9q90q9r4t20bIlcw8J8EpZFFJxI/t5m1kLZP99/+SM+obigbq+KC4dbJO5vdX9hvEe08QX0ty/jF0J4Po0sA0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(19092799006)(366016)(38350700014)(56012099003)(22082099003)(7053199007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0GpDkv3eoRU19JGj4oj+73h+thZvKNZAisLyQ0Okd6KXHNDMJ3snY/Q1Vc/B?=
 =?us-ascii?Q?/sp1nOYhBlq1nCXJ70D/v2iMkl7CMJq8LB0EJtVMpAutNcr3BTNsWS5gtVKn?=
 =?us-ascii?Q?OvG4LEl7AL7Aew6gpDWg8Qo01pVLy0KUqARnQ12TSGIDyWfgvQ+MTqPJj5K9?=
 =?us-ascii?Q?s8V5gloTlPJVwyBvCT2gtgBIyxqfWKe9bFfW7/In3fKAfcLxmtYeSNYFaEwT?=
 =?us-ascii?Q?2SWHOeeRVAN+anHtjp67LtquFZh6/PVBhuTkYj62D3r2Zy+lsGv7HzlO2fn5?=
 =?us-ascii?Q?Jga7fr+CxfRGX1d+/wcFYWkySYor7WemwSvGMPOy9RZlyp8DcqPUH9XdqJ6B?=
 =?us-ascii?Q?16I5axKKX7x77o5kyxdSfJRJTnaLP+zp8rJ3YXAThboc7wBibgLLpIB8DnVq?=
 =?us-ascii?Q?2sybA4q7BzpuFmekfPK+vMopFNo9++t5BULE/qjgJrYyOMbZ/4Z/O0QHS68I?=
 =?us-ascii?Q?TwTtxL6Kyt8IlG9n7RHJQDT9aPnYaz/wca7ZY64ayV8HoYfn2FWLKXbXYUez?=
 =?us-ascii?Q?7A1PzY/9ZQCNcZbVsXkW3Tu3FGipXU4eM3bfJOsaJvjh8abPUVPBMiabyxYQ?=
 =?us-ascii?Q?epnoX7K677HMoGVq2OyiiapTiscp4gugaifufavAwcKfCrh3D2T2v1pnfxjx?=
 =?us-ascii?Q?L4zXazxy+MHP23Z9QxmPcW1+QzDKOOkTEE1vwJ6N7Z1RQyMFnfpdKqGDlaTW?=
 =?us-ascii?Q?MG6ueKtED9L2nk5MnW2tO95c+TLN6wUbo1C9ydxhoqIdyrTMD1/t4yKxnmsN?=
 =?us-ascii?Q?QKSvH6o0mulej0dBRBMMCTvuD9IRpNmsfNt0dWRrYK2Uw6TmCWVOcSl7AEWT?=
 =?us-ascii?Q?hAWv+alOPsiI9z30t4prPf//3/x3RmxI9GYADU0LW6cHeKD0ZoyHnvvzqz9k?=
 =?us-ascii?Q?fH2Y4hT5X2HMy7NKBvvy6BW6RPMHTo0MHsy3+oUGtBortRwhXrDVZx5h8jyY?=
 =?us-ascii?Q?4zY7wjh0oO4TjaPEXxOHmikQDUVgTLqo75CpcTAjzJnPD39N7Ia7blIuh/E/?=
 =?us-ascii?Q?73ZO/k9ULqdxU2X9+s/zkvgLM8kepxppPa9UjkWvOctit295XhKwTBYyaWcs?=
 =?us-ascii?Q?s9OL1+A1YvdkuMfzGgfDzvjtI8tMoPoC1p3xKFVVVNSNfn8V06D+RRfedydR?=
 =?us-ascii?Q?1rDpUR2kpXxqERyZpqUr984lG0oyjQQfJ1q/04E04AMkG/717I2F6putm1f6?=
 =?us-ascii?Q?lQ+swm013fDaTiMNhz4gHA/sx1vmL8dNPKaYQfZ/CGbxcyDELOy3PM2ix+U2?=
 =?us-ascii?Q?lj2Aj5vEPo6ees0+VYtyIA+c4QvThSPH17gv2tDbbGGH2y8kbH4+dWWUEGGj?=
 =?us-ascii?Q?Vp9Ga/XMTulXZSrF8GC+S4fAm+OUEfG6yHCucsj+sna0sEP3R3CyAon+q2jV?=
 =?us-ascii?Q?zt4l2qaXruNM/ch6timDghFmYLWFB8F9X4c5TKHyUQ1/TsURbo310GfpALDA?=
 =?us-ascii?Q?13hm7ejLJ5mwZ+0R+S3jkCwxolUuAsdwQOJ5zs+bscUv87NpggLNWzelbVvT?=
 =?us-ascii?Q?PGtN044Wl6RhWs8uAtbAv3WBgw/HI5a3CEp02QkInglH6iQOB9R11jDBFi6y?=
 =?us-ascii?Q?MOABWQMkNjLwQXGdK35QTxmVRn3TmcZ4aEMQ0e05cF7qsDz+1m1GRwgnal0z?=
 =?us-ascii?Q?LwiSioLUn2S1Cnj0dsGvyF4iri1jO4UU72XHBC1YkptHs6TG5x8daQA1KxPW?=
 =?us-ascii?Q?+TbX9ra7KdlrmayF5fxxLbUNnkGRetYxfAB1tK7TAe3O+Bd7IPGRPvP3T1iq?=
 =?us-ascii?Q?5VtrbvDz0g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6edfc991-3e32-4a59-feb8-08de89bcb41a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 15:47:50.3235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HqjKZ4IrA4cW3QKK9AjBQHdNSTjlmLY6THsBi2qNMKBWZ5sAITRyw714SGALJX6acCC41biWYXTQD1TCHk0p0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7629

On Tue, Mar 10, 2026 at 09:10:53AM +0000, Eduard Bostina wrote:

Remove RFC.

> The i.MX8MP Reference Manual documents bit 0 of the
> IOMUXC_SW_PAD_CTL_PAD registers as reserved. The hd3ss3220
> IRQ pin (SAI1_RXD6/GPIO4_IO08) currently uses pad config
> value 0x41 which sets this reserved bit.
>
> Change 0x41 to 0x40 to leave the reserved bit cleared, as
> recommended by the reference manual.

Any impact if set bit 0 to 1?

> This also allows for
> easier conversion to symbolic macros.

Can you send this patch also?

Frank
>
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts b/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts
> index 242fa930b..a78401d11 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-edm-g-wb.dts
> @@ -345,7 +345,7 @@ MX8MP_IOMUXC_SAI1_TXD5__GPIO4_IO17		0x16 /* DSI_VDDEN */
>
>  	pinctrl_hd3ss3220_irq: hd3ss3220-irqgrp {
>  		fsl,pins = <
> -			MX8MP_IOMUXC_SAI1_RXD6__GPIO4_IO08		0x41 /* GPIO_P253 */
> +			MX8MP_IOMUXC_SAI1_RXD6__GPIO4_IO08		0x40 /* GPIO_P253 */
>  		>;
>  	};
>
> --
> 2.43.0
>
