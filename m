Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795450698;
	b=UHk65SW99m+i9zhQXRsxeohuV2CMlR6y72RsAWOZynSVh3qiGhEi1wXFio6vYCikOv0T
	 8Bh1U1xLAEhmEjSwRI+RjDFF7or4FUlmQVHxMB6S0CpoRpuI6dqROUMJt8ZT0+7FvVX5S
	 e9VfKUW7cW/vaKUmOr4n9HfCTHuyA9JkKTTwtv6o2vhajn/aBvEtWtJxOibh5FzY5njwu
	 y29dBsybiELyNWylse45Ov+6c+HFU/IjpSVODgyyvxneD05qp5WBhRXvKH+ynDhNWc2vw
	 MZ9MctN5WTPf7krVv8RtQ6pNgTjAZQv6+fhkp2/YToYfQENeyslm1GE+zbT1pjUn1cQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795450698;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Uwe7ZF3/4/s0VbkSVjCgNCJubx8E+uCwRJvfm324haU=;
	b=dowFTA5P0aoJpjRre1hRVCCiVhFXLRm1xNV9uRCTWKPozzcXY27LQVJw0i6O/IMjey7w
	 Bq5QN9dCyJprsDrPV1VB7g9YWi+uwhWK0M5/Se0Y09gj37yeW+xJjVlTjhyEBFfzYY8Ww
	 I+/pJ0Nl/BZ8XSc2iCK9j/KjVVcAXpjgyVGsbiGyxYHYcBFvMFs6lwX0P0haJTl0M6ep3
	 5HRJ+97yOzen0DX7j2QGGpopsgweVvrlvAGHogR+LzKpQ/8ReWJr/1GdgvZm3pLQZpCK9
	 sjyULDnCxNd59pIj9jhPdf8KHXUOiTnEV9NGUtcLVJRDwwzK3I9kQG97/vzVUWSMuuw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=cIuLXkLH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.69
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012069.outbound.protection.outlook.com [52.101.66.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843C8606A31A
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 16:18:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 843C8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=cIuLXkLH
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=stIyFBbTVpAHQmM1mA19H05dAjbVM/48Lxcy6bCM/5tGqfSWQTd1wZRBm/veHWMkdCuWem3ZLjXjsFAA/wub9i4u2OHpEeYsvnQ5V4tRC8od1pPtBeqRANiQ2L+zH6oOqKLZI+rKPiWN4+/AH9/eSuLYA7yXbmCl1ak1FmAWl0Y1rr02gXMt3se/9p1gSZxaJ2AEs7TsrdCatvwUSmSSKwaQefBXdFOE1ijXvMdjFbKzWvR/c3wf0ESeGk7OKGPbBFcuI/Nl2gSx0KGDmKd+AtEBFwvKuDp8XaRJTLty3ciuNCkGqSauaK7CSAb7E3PMACAd4nXeDZRqzzyrD6vSVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uwe7ZF3/4/s0VbkSVjCgNCJubx8E+uCwRJvfm324haU=;
 b=faN6L2j5BU52gvS5CIWBDRvQfYAnGt0XLCTgbrq5TTkEQTjildP3zAjuxTRW2U4BHopBYjjVJiJcHmlgsKJbmNUGzwzWI7jV2dAz09XzX4T8jKGRtBq4Mw1WgPk7z4C7nE0166HfHoBG1mDmZsqsFsTrTQdbk3HNs2q+h17RPf6Lfu2qHOovUPj9XWJyHkoj1JYTOi0POxOH84pQm5Pz/HRUbFd+NpAKEgaWyz3s6Gl3Kw/yRiGiw3nn+vIP9fxfE01h54VvbmAWjFD8hhPNYkEhLZOz9pmAeWoUSgGVOKnjTRzGNGaw37Me4craoHeruYhcmx9qKio6Su/RrDeIBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uwe7ZF3/4/s0VbkSVjCgNCJubx8E+uCwRJvfm324haU=;
 b=cIuLXkLHSUkRhe8iT6MQLmF32ZZkRzqLAcU7JCyyslisCF4JHpPJr29kUml+a2Zf7V1ly89bih6Ln7fPxbj+C5igR9z1NRotnO4Cj7TKKT3QSOgedhDfJaGKMHJmFGYUEKnz3vX77XzrDgj6qPzipadrILfjSlihL9XaupPw2sVTcReH4hbqPMSMSjZL98nrouDjxHRyXJR18/zRo/5qQUzqrCNvAHSKOMllKiR9L3xyF72lzbqkAedSR4ocXjrKaUq/wT8wEOwVyScSnj6umAJh9lhG2HEjVH1Jk0FTH37mKc5eXWcLgbWbKAaL9B6k5N63T8GxifiLeUeoDuTZjQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PAXPR04MB8686.eurprd04.prod.outlook.com (2603:10a6:102:21d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 16:18:13 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 16:18:13 +0000
Date: Mon, 23 Nov 2026 10:18:04 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Freimut Diener <f.diener@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH v2 1/5] arm64: dts: freescale: imx93-11x11-frdm-common:
 Enable I2C level shifter
Message-ID: <awRnPBbqQL-Lt-v2@SMW015318>
References: <20261123-imx93-frdm-fixes-v2-0-dd97c7fca4b1@pengutronix.de>
 <20261123-imx93-frdm-fixes-v2-1-dd97c7fca4b1@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261123-imx93-frdm-fixes-v2-1-dd97c7fca4b1@pengutronix.de>
X-ClientProxiedBy: PH7PR02CA0021.namprd02.prod.outlook.com
 (2603:10b6:510:33d::26) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PAXPR04MB8686:EE_
X-MS-Office365-Filtering-Correlation-Id: fa646acc-3f19-4586-6315-08df497d5f7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|1800799024|376014|7416014|366016|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261102123227099003|11063799006|4143699003|56012099006|10067099003|22082099003|18002099003|261009223027099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	rUynIEYz9lS4+RZbkVZDrBBYdR0ghgcDhOzIAzcFPMfaPA3KQAGNsJ2mz3VdgJmQWFcGS5DOO5lRuWZNVlVrng6klJVg6e+0QdbBmMhVmAaUU37Uqd79+4HT+ep6TDH0B03RDVDv86aZ9UCniJhCNzGCT+J76i4YfCrh9hT/gFfzFSxsf8O1cVqu8pkdrE9l2PYtuYxcW2ONk+Qmx1ZloXs9lkDZwwWsqYW/5Bwoi9ybMf6oDemIrfZZ4onI5KZLmF+Lm0XZddO+khCwsCcqcod8peRnv4WD1v2JPbVS/8JGxxoILpxqlBZpjxRBXZh4Fn5/WCGj2L7QqQl6gwqMRVab4criqrYWZvnYOYEhXTgyq9OQhqDmJQio19V37ln9yv0mDOcCGwiK0/2LVIh/t+e2IAYMfyMPh6xiwuQZmrfP7LxnEVWX8Le8BDUCABGlq3PYStc8mQEtdrdIqMO/jJPHICi1CwjN2v8yQjO7dblvIRYX3EI6iWdW/1ieP/riG1C0JuRqO6zS2NPMsDkzY31+6nzyk50qDnpnuaym69lLfPPmubYweSDV0o4Y1e7LIddPUpdvan+reFC+vuL75/dkIAW0VhzewmE0Ho9/xWo0zFvm/9XsoClA7RnbhQaOXanpmUF8DCDXNiS3bJEW7qbbpYqqR3P/n5oBJ845Wjo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(1800799024)(376014)(7416014)(366016)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261102123227099003)(11063799006)(4143699003)(56012099006)(10067099003)(22082099003)(18002099003)(261009223027099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QZh65rqYLRm2O0v8VqL5xTlW67oiWWso0rMifQl+fm5D+nK19KUPlJBqsFgw?=
 =?us-ascii?Q?EzsLvU3AaT9VdEvo2RsFF3ub0aN5wLncl9kCmOTBCdYkJh/TwyHFFm2RwJlx?=
 =?us-ascii?Q?BEzIQI5CTc0Au6jIH+JaN0mdbwIF3HuFSaSw+9pOEHlgEoYn/FqMueRWIdSP?=
 =?us-ascii?Q?LTv7xl3WpCPedw+aB3uawv+FrLQ+lCTg3e3jiBmFPUtjnRbCQ8YUAakrhhS1?=
 =?us-ascii?Q?XwWd4xo41ur/iDDm1ulutESYmV90/XWSX5M7ZBdSCiyWyBQhL21JHRyhLKUx?=
 =?us-ascii?Q?ZmAsxT1SmuQvPkJpsX7FMDLR7KFn4P8MmYOSi3KGYJWM0vjFToFHfmRakUVa?=
 =?us-ascii?Q?7eQNQoyYCxlLjiCP4U4D1Lbuzz/+SNxFOs6U9BacxjAm73xJbQfw124l1Eef?=
 =?us-ascii?Q?5VBeIS8AnK5IQcZOZG9V63hgliuSDpeDfVw1qKTDzz/dSATFHMlfpfbIBO9R?=
 =?us-ascii?Q?9kOyeI5Shp6XLCn3pMK+b4+DLvpkUrBEiG/CpmkY4BWG+k6zJqf6Zuj+Y4sX?=
 =?us-ascii?Q?3aCiIFSqpMhw3u1UpaWHFiJbRD6H7/Enwmh7X3CwZiIChAzocKpODoBPX87Q?=
 =?us-ascii?Q?PLfu1WAQPA3ugva/jpZ97MeSB5PSPQg5kpJKTE7FFadKHQH8sqdy8ej5ijwn?=
 =?us-ascii?Q?Jje2vvyYU6LHVrgoOBmsLmWsbFUMxpYQor8A8Qdi6nCzuOtD0os7pcNKcCux?=
 =?us-ascii?Q?BTTyqk+IMl5hmNv2qkZfzqVwE03dJsN5yDm98Wk/LZLw9SUQ+G63Bfm0WhnS?=
 =?us-ascii?Q?7qyK2Mxqk5fH7VFESfwI9IwlyWwY3wver6x+6m1b/Lumk4jtSowr8grju85X?=
 =?us-ascii?Q?TLeoB7kdsnWWlUm1h4gedTz+KTnoDf0xRpdDxagZKO3UdwkyDnQv/IjJU/Ds?=
 =?us-ascii?Q?IV35re/yB7azvd43uQPL2eM8CgPbQXr8UFsJxfGuvSN6NldSi3NimWxFXz6w?=
 =?us-ascii?Q?XlS4H7IEqbR39yF+OjCZlU2hj76/RQPdVhWHbUEj132jqM9dW6FH3H1Pm3Q+?=
 =?us-ascii?Q?2Wo44fVBVNx3zG26YPrCic8JG5oKqtb1MtoA4NFVUaruHE/jPq6cc68wzDVt?=
 =?us-ascii?Q?8aJOQBGUAQr/9E9yT++qWYRdYFdkGWhnWiCG1hDYcv+VzAZQWPZtADXd59VE?=
 =?us-ascii?Q?7yPm+LSyLSnuKDIrd3CDgnoggoOfHrynlqmfT1e5VENQ+42gLelBB/fMvR+5?=
 =?us-ascii?Q?eMFB4vDW95UVPJUXp4f4u+V1az2Qo1Mbfoq6XDCAtjVhfKruGog1naMXcozH?=
 =?us-ascii?Q?ilajLhEJrBnqVHb8GsQrb/XMZhxW86rvv+wnhxQvJIlshFtE7rm89BIsOiO/?=
 =?us-ascii?Q?28/5NeoUYcPQ1kQODGJcwmAsmCBDCLQt+RG/91yuk2OHfZoMHs7QW1Dv/AV+?=
 =?us-ascii?Q?8+jaiYEbnLeeZHKcC/S9JZRqWebOkQpgCUg7Af4fZe5vx1tMS9u+EJHo3sIQ?=
 =?us-ascii?Q?vAYKL8gC4HIhajeQtLuoa74gKnCpb6JCbQtDOWG9YA0jRsanOOWDm5hoq6p4?=
 =?us-ascii?Q?J4rrKN4Syri6Cz/+gqsbxTpjpEEARh7W8wzTytJMpS4bFv2sERTOevslEU0t?=
 =?us-ascii?Q?CiqiPSRvNbFD/v6vpV96WyH87TCpfcpqif/PMOTgK8s0hy2rqo8zoyjNhJAd?=
 =?us-ascii?Q?mERX6LTpaJLa/hLqbhg6eMXeEFgn60lq/hgO9gwXlbPIYRG59oQ1jgX0WUnr?=
 =?us-ascii?Q?J9oW9wWdyAQysaMlHvdftERTzdHFQ1+JJUuXGkAqrYFQhSeBHvY2Ynz4JUuB?=
 =?us-ascii?Q?sAMFSKOyg6+crSbn3RgH+60CaAShbVeOFbitXXevPZ75G9wczw/P?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa646acc-3f19-4586-6315-08df497d5f7f
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 16:18:13.2656
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lKozzN1Fk9nf2DgDR7S2kAyfiDOdOtwuWzGJQ1ARA/Pnwt8VMcMBpDRhrFwj6Eh1p+hnZuTFN9knMVghXwWuTSOjMBcIwkJc03Ny86ovtKuVZrdg1bVwuQtekMPwfnEV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8686

On Mon, Nov 23, 2026 at 12:25:15PM +0100, Freimut Diener wrote:
> Without the PMIC's I2C level translator enabled, probing the GPIO
> expander fails with input/output error:
>
>        pca953x 0-0020: failed writing register: -5
>        pca953x 0-0020: probe with driver pca953x failed with error -5
>
> So enable it.
>
> The GPIO expander is connected to the level shifted I2C output of the PMIC.
>
> Suggested-by: Marco Felsch <m.felsch@pengutronix.de>
> Signed-off-by: Freimut Diener <f.diener@pengutronix.de>
> ---

Need fix tags.

Frank

>  arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
> index 33ed26aafde88..b3dfe516b1d55 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm-common.dtsi
> @@ -216,6 +216,7 @@ pmic@25 {
>  		reg = <0x25>;
>  		interrupt-parent = <&pcal6524>;
>  		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
> +		nxp,i2c-lt-enable;
>
>  		regulators {
>
>
> --
> 2.56.0
>
>
