Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011033.outbound.protection.outlook.com [52.101.65.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F0893988E3
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 20:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772484898; cv=fail; b=kHel3NQJKMvAXVtFi/gK+4HSqPuJ5vjgTPmRTvJdLJ42CjAaNokVr9bg96nn8CtISySwxfmrIsgWA7WPNmu2IZjSAiwj+6RA7q00o9KFZFiR5gM8t/Bc5/mJ28Kz4y0srZzu7tdcWI/TCcLOPGsottyHZSX0/tkq/96UdzZA9SI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772484898; c=relaxed/simple;
	bh=wyf3+0urJF/mZZPyHvku/hxmUHHNDzESYuZci46gD9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WqyNtkUFKq3IRQ0AF+OhU0nRjD3QzshvxP658NoLSmYBJVZbRjWddvSOJfPsB1xij7I0N3aeS1heDNH3NSBZWQYUCQgnevcp4WzVUWKa6Kn7pTU+PA0DkzFbfkOCsmxxdOFCE8Da9a3kH7w6cdMPOvjvwGsO6Q0Fbp99uc7g/48=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dMSa0nct; arc=fail smtp.client-ip=52.101.65.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dMSa0nct"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NDY8Wrw2yDsDUhLCK8h53HFcrZP4k1EOYXI1wz9CbaxK7tZpzxEGl+5lkUcvkyztY169riQ3/jWUs07S9a/0siwsDPU1xZawBTzjBfL55ZFVBVEVYSO5uUopOdh2c8TFAG9Uk7OuL3wuHYpcNyxd5OExS7YIKB8lH9beVu5Z6vvUdOL1S1Cj/4b+txKMearvQ0dim0T4YkTpbFZmY98qPjr22x+EkMw3Q3dO5opwxs1cR6923Sp9CPSw1XAVRW/xWhs18KCnIp1UfrpWUJm0+dHdDNCXpzSxQ6SwB+vBwbcnu1WrArTfTLxMhR/0Hg4WOTotcoxtfcr+TXPnRjZQ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kw3ngEp+XD3gkH1yFnKkWyeG/G9zdSoymuVEKgWIWe8=;
 b=NRYe96tLWiHVn7RvCwcYyrKXIF6Y9HaNQjTs/dg28jif3f7uanT4NACWHAEbFftvp+iiuEjEGJ0PIbVUduhYP+9J722QPoyZ3zTG2QjIjzZ3qCXM2nyOToINSJZPR+6WVZnyn/nsM1X9NJjFdQ3SYoX9Mqixm4Od0dDztkJn6v9pwWOesItJP3mDOwk//Q9cMTEQaiS/sdeUfaIPRDS0gEoDzQzeGpYWg4hP64XOH+PzQNGRyGUiX7npaEJJAkVqLqbXfeAzHAFcjk3v7TuL0kCopxT3ES1Ygpw7UDfn/mymdS+Tfx+FnwkKR7UnAnSAvPrDt1UQgGnyGHlivTd7Zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kw3ngEp+XD3gkH1yFnKkWyeG/G9zdSoymuVEKgWIWe8=;
 b=dMSa0nctE5p5AXtNA4qBzUNedCEemeG+DZ7Wj16lB8weH+qva/q0FnYl++VeKuKMxkzFqfxiJg88x5ZgZb39T4JCd5RBXFOzcwyM69P8kJJyKgLEx0TZPbq7CJBfXY399X/3/7wPEIEKSFYhX9TBpuCT44842S05LhJXhoLvd7APFld+iBJ5PWB+FdHjhmwkW3Wxy12TcB46lbzEBMmqgzksTTaHiu4eCUwmy/sNmeaKMLzL1l6p7Ou+v2NGgtW14wlM0R3iivMOnwp1ke50x4g/ByixE3wp/zs3GPSFrXP1d1y8NnBtIF5uMN02LPbgydbMYHDvkJp4+r4e6tREoA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB9111.eurprd04.prod.outlook.com (2603:10a6:20b:44a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 2 Mar
 2026 20:54:53 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 20:54:53 +0000
Date: Mon, 2 Mar 2026 15:54:43 -0500
From: Frank Li <Frank.li@nxp.com>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
	laurent.pinchart+renesas@ideasonboard.com,
	antonin.godard@bootlin.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH 08/14] ARM: dts: imx6ul-var-som: factor out SD card
 support
Message-ID: <aaX5E7-3xvkaVV-o@lizhi-Precision-Tower-5810>
References: <20260302190953.669325-1-hugo@hugovil.com>
 <20260302190953.669325-9-hugo@hugovil.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260302190953.669325-9-hugo@hugovil.com>
X-ClientProxiedBy: PH7PR10CA0021.namprd10.prod.outlook.com
 (2603:10b6:510:23d::20) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB9111:EE_
X-MS-Office365-Filtering-Correlation-Id: 63cf5b39-be36-4bc0-d559-08de789df3f7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
 0bvcEJtXRv4X3gYRrqRdw1clKWmxNiCTwC0RYrLRXbeO4B2kVrR1R2ZUa0s1VYihcCV9yCCXvBgzkCCp56X9rck1j0kYZUoJ6gsylwyYhg2DqGtq4l4kBLmH3E4pZtwg9y/V/bLxfH8GIwhItCClPTjMUJIC6cKtyPwAHdz5c/wxdyEKThvxfd3GnpEwKqSmRFyQhXqI4RlNCKz427vl/XKXW1S2OO+roykOcnXS9jlpqU+qV82/LV1RYx3gZnwwGlM4H7yFWgl9WTupuuTIM8wFDo+J8TN2Ym8+kl79jIjx7WwjZLo82VaFg26u6xDGnGutUwFR2MX2mVxrjbErSVFaXoWwXJ5wmSHdjDOoecMPDtMZrm5uyKAKM+z3H8+fxBq0rHQG7ZjrdZprgOFJqcBZD/2twbIMARmnSvFOIAz97mB1TEl+zu9EVQ1iuYLRkFlvrLhLLfolGCxpQOGmmQeuZliQ1qYNJX71TqLkzGUmJUgOh0kLMMzIDOK3sMzYsk1K2j/vVAtVupEW91Idtj/00ZXnLFDo5pUDpugnTY8cd6HujInj73sLMVkxvgZFKGqlLxUnJvADVI4EOTpcBXvidd0ETh4u/WAVM69mLZF1aF05u2fQ0RcxSAogIl5tQ82r9upqb3qfRDz5Qwu7vYPz8qIVapH2q9n5pAjD4bK+cKU19p+UccO8fTRKFNAk8q8APOD0qMip6QS8iLqjK4uDlZQq5HryAhdBT5naUocDccWW9r5Mw+VZb3a4nAuXMNUS88yrY3zeMsjvxGRKyeCBgGJEguyuTB9ZGtTodT8=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?dFTyzZFlKo/Ygf1gyRTmd4OTfGz/WpZ5/vePabJPx4xzZs3LxuT0ahPnNI37?=
 =?us-ascii?Q?95ia5PChA8XZvRzYbFO9p2rVPhg9eljAusHgoXUi+9+cI5HunPdUUWFcGYzm?=
 =?us-ascii?Q?WHRvhQBTCA3iu7GhYYSAp5ELBKpDXxIdXpjlOWuug5CR9jhDUP4cE6PcXsFG?=
 =?us-ascii?Q?p5Qd+FVnw7n52ertIkopP1G+g9aK/uNtAYeYFe+9nOUyAaJSShwxCuDe2Kni?=
 =?us-ascii?Q?3OqnTw/RqyP5By/8I8xOWpsUL/aQO38cklC0wTJNMn/bAsssj+YAsLHbS3uP?=
 =?us-ascii?Q?7MxCy/z9i8thhciQFXMguNBbN5FhMbpqGEcop00bT++ljXP9XItR9QV0oG6L?=
 =?us-ascii?Q?lSumJbZj2dU7tWHCdokD1lIDy+jHLkSXGV3h/RWUrJOC4JUVBiJFH5q7fTic?=
 =?us-ascii?Q?/Brq+hnuxGfn4nUDmDfi17MT32gehqmiZmu0UEZDEcX3aQfktsowZn2PWocx?=
 =?us-ascii?Q?lIDHY6WIXfqSwyjTwLCp18EXJoeVhf0n26mAnQKuLKlXIxn+YnQxWyWeQhJz?=
 =?us-ascii?Q?t3DvoRXS2u/kLoL3tdaVyi4CBZQBi/7HVNwg9oRy24jOFTqaxHS8WHI1ahgc?=
 =?us-ascii?Q?YCksQyWahrEjVFqtsv12/J/dih9QidK6adcg9G2vS1lft/TtnOpWmsGrvi4j?=
 =?us-ascii?Q?bzfwBWBrbANmOTmoKezhVzX+I2gDIF92/hKut93sLMbOjlG4mpMi12iGs5WN?=
 =?us-ascii?Q?opSpI8h93T4sq2LPKBsqD9qOVfHpDfW9Yy+JuIq6ABHH62TrlxOwUd/q7yRF?=
 =?us-ascii?Q?ZMc09pDKuUfQMd7lxthsTT20D3scJzeaWoZSg2hGbrreRP6Fzhec7E/H5svr?=
 =?us-ascii?Q?jYmesmuss+ELSC616wFqDb6/IhyEMmxwZXy+qesWURWL3ju+RO6KvYAE3NZx?=
 =?us-ascii?Q?4VqD7rbDLmR+OBsBZXQlI9/GoNnJ6vgvnWM3bgFDHHnbk5lfE/dcN89AfN9t?=
 =?us-ascii?Q?r6YCFRaUQIVYSqZY34CdGsYdrZANo2bECuZMyfFSAzYaB/S0AQmzjjbNjqxI?=
 =?us-ascii?Q?WHTa5ZylV4UY2NFX8Ahpo3mMIVGm3wIyBhhIuuQ+eM0GEvASFtav9xKT27bJ?=
 =?us-ascii?Q?Z2Ig/Y7jY4VxH6abG/E0z+Fx2iAEsxdnjFtQxsnS11d8rCKIVgwa7BdMigZB?=
 =?us-ascii?Q?NQdD2HB2wWljQvw3fphGAsu14RmZvVyaRDoqwDCROMW0hRgdLhYgJ9j3F/Nv?=
 =?us-ascii?Q?F7ika5DbUGIAyb8Q0+asw9AJC30mMj6gLREoC+zWdOd8wkkkoeKVa4p9NimV?=
 =?us-ascii?Q?ai2YVlypED3/5Ryz6myWRoBICisSVF7HFpYt6JFzEjKAGdYjakGusg4LVK6A?=
 =?us-ascii?Q?UOzbTzC4fKMgoU/b8vLQkA4Ewf5F5duhLZ8z2kSDwYldLan4m/AZ7BDq9H+u?=
 =?us-ascii?Q?vESF/bI1bPDBM1PiLcJVhr0zaWSwHAp1dtFiXskUHWtUY/PPABPUCx+GEiHK?=
 =?us-ascii?Q?E0LN5H+vwqoiY53gNlP4NPk870l/Uhv1eFrj/+ylufa3coqymjdZAmZkSVoG?=
 =?us-ascii?Q?u8ZxLJOMoTk43loU2ZdP0PayfzQ1RIQe/Tgw5p8tHlru7Spm9/4QSzZo32Wm?=
 =?us-ascii?Q?gdt7iAC2dsvynnkiXTJZJNaEQk4UVu/FkXiE1ndFfqwBHJeRQ9a37MzO8peg?=
 =?us-ascii?Q?jQVd8cFAQWtiptQhHK+EFPwVbgpXUmeLnPmrOqSSJIF1zidPoeAcNssUk7lB?=
 =?us-ascii?Q?3wDfJRg9JOO0nWzCF1k7z0g5TyGtV/KC27cpClH4jgncD6l6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63cf5b39-be36-4bc0-d559-08de789df3f7
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 20:54:53.3303
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ik+LtVNezlfNVx0g07TkKu2V7LoDySkqox+tUbjyYaIoR5uqPCgje4Fj+rq170hiOkOO03AmfbeNuOGwRCfwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9111

On Mon, Mar 02, 2026 at 02:03:44PM -0500, Hugo Villeneuve wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
>
> Move SD support to a separate include, since it cannot be used at the

s/include/dtsi/

> same time as the Wifi/BT module.

what's relation ship between wifi/bt? you just move sd related part to a
dtsi file.

Frank
>
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
>  .../dts/nxp/imx/imx6ul-var-som-common.dtsi    | 33 ++++++++++++
>  .../imx/imx6ul-var-som-concerto-common.dtsi   | 51 -------------------
>  .../dts/nxp/imx/imx6ul-var-som-concerto.dts   |  1 +
>  .../boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi   | 27 ++++++++++
>  .../dts/nxp/imx/imx6ull-var-som-concerto.dts  |  1 +
>  5 files changed, 62 insertions(+), 51 deletions(-)
>  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi
>
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
> index 22b0c4e0725a5..dd4ecff1eb786 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
> @@ -139,6 +139,39 @@ MX6UL_PAD_UART2_RTS_B__UART2_DCE_RTS	0x1b0b1
>  		>;
>  	};
>
> +	pinctrl_usdhc1: usdhc1grp {
> +		fsl,pins = <
> +			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x17059
> +			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x17059
> +			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x17059
> +			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x17059
> +			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x17059
> +			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x17059
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> +		fsl,pins = <
> +			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170b9
> +			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100b9
> +			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170b9
> +			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170b9
> +			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170b9
> +			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170b9
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> +		fsl,pins = <
> +			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170f9
> +			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100f9
> +			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170f9
> +			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170f9
> +			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170f9
> +			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170f9
> +		>;
> +	};
> +
>  	pinctrl_usdhc2: usdhc2grp {
>  		fsl,pins = <
>  			MX6UL_PAD_NAND_RE_B__USDHC2_CLK		0x10069
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi
> index 10a23ae104359..ea8d9905ce6e7 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi
> @@ -186,45 +186,6 @@ MX6UL_PAD_UART3_TX_DATA__ANATOP_OTG1_ID	0x17059
>  		>;
>  	};
>
> -	pinctrl_usdhc1: usdhc1grp {
> -		fsl,pins = <
> -			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x17059
> -			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x17059
> -			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x17059
> -			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x17059
> -			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x17059
> -			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x17059
> -		>;
> -	};
> -
> -	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> -		fsl,pins = <
> -			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170b9
> -			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100b9
> -			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170b9
> -			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170b9
> -			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170b9
> -			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170b9
> -		>;
> -	};
> -
> -	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> -		fsl,pins = <
> -			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170f9
> -			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100f9
> -			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170f9
> -			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170f9
> -			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170f9
> -			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170f9
> -		>;
> -	};
> -
> -	pinctrl_usdhc1_gpio: usdhc1-gpiogrp {
> -		fsl,pins = <
> -			MX6UL_PAD_GPIO1_IO00__GPIO1_IO00	0x1b0b1 /* CD */
> -		>;
> -	};
> -
>  	pinctrl_wdog: wdoggrp {
>  		fsl,pins = <
>  			MX6UL_PAD_GPIO1_IO01__WDOG1_WDOG_B	0x78b0
> @@ -286,18 +247,6 @@ &usbotg2 {
>  	status = "okay";
>  };
>
> -&usdhc1 {
> -	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> -	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_usdhc1_gpio>;
> -	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_usdhc1_gpio>;
> -	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_usdhc1_gpio>;
> -	cd-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
> -	no-1-8-v;
> -	keep-power-in-suspend;
> -	wakeup-source;
> -	status = "okay";
> -};
> -
>  &wdog1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_wdog>;
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
> index 11b45f105b7ad..85ebac30d7bed 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
> @@ -11,6 +11,7 @@
>
>  #include "imx6ul-var-som.dtsi"
>  #include "imx6ul-var-som-concerto-common.dtsi"
> +#include "imx6ul-var-som-sd.dtsi"
>
>  / {
>  	model = "Variscite VAR-SOM-6UL Concerto Board (6UL CPU)";
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi
> new file mode 100644
> index 0000000000000..0e6d9b945eb4a
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-sd.dtsi
> @@ -0,0 +1,27 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Support optional SD card interface on Variscite VAR-SOM-6UL module.
> + *
> + * Copyright 2019-2024 Variscite Ltd.
> + * Copyright 2026 Dimonoff
> + */
> +
> +&iomuxc {
> +	pinctrl_usdhc1_gpio: usdhc1-gpiogrp {
> +		fsl,pins = <
> +			MX6UL_PAD_GPIO1_IO00__GPIO1_IO00	0x1b0b1 /* CD */
> +		>;
> +	};
> +};
> +
> +&usdhc1 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_usdhc1_gpio>;
> +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_usdhc1_gpio>;
> +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_usdhc1_gpio>;
> +	cd-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
> +	no-1-8-v;
> +	keep-power-in-suspend;
> +	wakeup-source;
> +	status = "okay";
> +};
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
> index 7c601af2657d7..ebf88c3e1addc 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
> @@ -10,6 +10,7 @@
>
>  #include "imx6ull-var-som.dtsi"
>  #include "imx6ul-var-som-concerto-common.dtsi"
> +#include "imx6ul-var-som-sd.dtsi"
>
>  / {
>  	model = "Variscite VAR-SOM-6UL Concerto Board (6ULL CPU)";
> --
> 2.47.3
>
