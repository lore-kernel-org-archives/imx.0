Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012037.outbound.protection.outlook.com [52.101.66.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA3122A1D5
	for <imx@lists.linux.dev>; Tue, 18 Nov 2025 15:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763480050; cv=fail; b=qhq+mfGkFLs1MnJ2xhtsIgwTBtd0SfmH2UxhBi+es9OQJ0qHZ8F/UcTJluwxIUqIdgJZJmylpBFeUdTUIylplJLAdGN9GY7JMt67i6Q3wbPTJZEdC8kcIk7oVamX6Df4Z0m+kfNyWy8NULDxlSNib9InIaCRGLIcFEsbnp1cchI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763480050; c=relaxed/simple;
	bh=aGgtKhe/rvJ5/bFa/XdxPcx90a0O9vRA60rZmNPVvJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=T7Dk73iLqo2Hs1FSmP8mrlERvJdCs1cXloYmutrzn0y4PvlDYvIBNJjxZ9n2M0z8xsLzggGAnzcdlhTIbmo3KSnD+N8MlAKQnmCM9yOIiEZCDHa0ulI7AK5Z4HG4andOghqvYVh72yy7wgF3FwSAB5ksGStEw8uWU0cHa9NxfgA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hZu82X70; arc=fail smtp.client-ip=52.101.66.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hZu82X70"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HglxBTZLnH1a4VWROAgEu6KGmuBS7zlNxMN3flkJYh879GLECzcpKAzpmtAFQcwevPvJ/Ditxz5NgjoqqH7SPbhATpYQCc7vgEO2SE82dL+Ycvzq/um7OxyaBlJQjxYUP5wM5Yg2pqYLyYZVOLCb57GBB2EaMwxxKZTxelek9YoZiMX/johW0DixU6PokJ5n7M3kp7pKxHlCe0zPTo5a+BLzGF5rAHMLGHklvwHrPjeRCdb8pzX2oRwpKzB5PQSuZgWdY06Xt+tVJZuY+MIqJmGYPwAFE++hT5L1GhjmLK/qCtr3zxPYQ1XSBhCqrhe74pMVlPsRzuTfYkDMK9hPfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1clQ02Ij18ng3pYKEp3onM2LBbz7HgyEZN2xSV8KtZE=;
 b=m0qFXzDPKX9PhccC8WyNbUjdR6awBmRspYLljLVIA/pCA2vcKPEGWiFydBPcGV4CZg30QQKT5S/NDe3MJT/JywQ910sQVrmSU3X8UrsyP8aorl6GPnaa/qtgqqgqCVXQnOgpObvO8Hg79U0lW/lSuLyc2pmGOe7XkEmGfaZFx4/WDolSwUAyxzTS1pQnuVX678jAUbve6yfSAwqX5iG0IEadNkTbraH9Hi7/evNP4H85MextNuqe3IyCTMfjRqMCt8MRvSvgEQx95C8qTsdurQmHU3SBI8rthze2ODfnfQjVD1WJs4qskTFyncE02wBxornlUzXBMPogFNKWM3Pv0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1clQ02Ij18ng3pYKEp3onM2LBbz7HgyEZN2xSV8KtZE=;
 b=hZu82X70n/OdpxzBDw88dShGEQAEvX/53HrXwBp3GuqFwsINZiaO8Uq52462JdtJf6VOU/Qd6Sot+0RKqN1sW1OTJ7jqe9TKOUcMGmQ8wHTNTijSB+9RsOIsLojgirQFmLhrVqQj5HTRPqQ/wocMs6gs5B5OZFPyoe1Bo+bMA1FCqglhxubrOiM33i8Qx4dJ7CjzW9PkSRQ/Nx40FCwCd++GCoSCcIfF1USJjtTTUkrCfKtZ31mwddWdJ8glp/UgFgf9kzwiBenf4q1d9iaHjx5ZX6DZxcIlNDymS8VDN4L+X3bHTkKrf44iB7/uyAvtS2Nqx3/1l9gFsnKMzR0Ikw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by AM9PR04MB8397.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Tue, 18 Nov
 2025 15:34:00 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 15:34:00 +0000
Date: Tue, 18 Nov 2025 10:33:52 -0500
From: Frank Li <Frank.li@nxp.com>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: add off-on-delay-us for usdhc2 regulator
Message-ID: <aRyR4MSk50BMSrFM@lizhi-Precision-Tower-5810>
References: <20251118-dts-imx8qm-v1-0-63e226ffe512@nxp.com>
 <20251118-dts-imx8qm-v1-2-63e226ffe512@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118-dts-imx8qm-v1-2-63e226ffe512@nxp.com>
X-ClientProxiedBy: SJ0PR03CA0245.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::10) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|AM9PR04MB8397:EE_
X-MS-Office365-Filtering-Correlation-Id: d2c69517-4e7a-4570-10a2-08de26b7e58c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|366016|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+dJyHUMSnVGiShAfc2Udps4kP6RUuStPALG7R+YAZnGRSzc01sKviBnfGBtm?=
 =?us-ascii?Q?BplALBVU6PRH/JZb4J+G0fr8g22y9bZlYh6lyKCoWoax3otj13qdP8/+LW8K?=
 =?us-ascii?Q?uFfSzxGShCZEVqAG2LCEENT5ftnGizmv3Z+zasOYAE0aN8sIKpVKYWobeQ+y?=
 =?us-ascii?Q?EjlbnY6rh0u5uSgdgad+OzfqqFo79Pwtg/DoNZKshxMkXmPAAnxWmc7rhtbf?=
 =?us-ascii?Q?a/Y6ihcp7VJP7FaCPvrpdiFaar2dQ9t6NbOhVMoRMPQrkjitLTBsyqeRLCyL?=
 =?us-ascii?Q?I3MKXOHzpEXkgrERx7z+0bkrFRGkdIFN4cJqxoftnmet0q8Aiueyh3VaIPOr?=
 =?us-ascii?Q?hEG+b+6+g3suJSdLOBV5fJUXY4kSiGxHMBSukbn0d2CN0BhYcwupLsPQv5WI?=
 =?us-ascii?Q?5k1QcfTXUCc6fw/n/rHBfyLEjHNe1qZvnrrVVmpVq1GAZX6uGThQ5k7ZCuxK?=
 =?us-ascii?Q?1dudou6a4gKCGLTAH4+mHiCGGr2ZDCD3STYspfTI6oMZ8hQAzR0t7uxug/Ji?=
 =?us-ascii?Q?4WRhC0vUzaOrBpxf/aJ5gAsRaUE/idUOSzjbkOWMzXRnCUM/AqslrMD4mdoq?=
 =?us-ascii?Q?ZR5zvgoIpkV1ni0/bi9re/WJEPWZyhG7K7NMXn4CVvTznLKxoHQKBnJjQlRg?=
 =?us-ascii?Q?jLiiv2hHUPXPA8RO4Bm2sfO7QGx8apFJ4h/V4Ek+GwEddPnki4uVq4U7Qjau?=
 =?us-ascii?Q?69N9lK7OdzQE/rl7FEFb+S9ChF6th/NDvHDJCbtabWj1fXEM1ILjDRDV/C3T?=
 =?us-ascii?Q?jVGleHFXJ5Z/DVppmgZ/TgmfcwIcwdsXFQzERCledoL7DZPI1EYsUm4xx6qD?=
 =?us-ascii?Q?zgO+djJ7vdaOVIyoUmxugC3L11hRNEfqGBPSU0AIN5SFcfH6TfhxfCKWRwhA?=
 =?us-ascii?Q?GFsuFwJZsxpRmxNMJOmzYmTVmy9qM6Uda+lIZVeTmyOw8rCzEkZf4NMt0Kdv?=
 =?us-ascii?Q?JBz441+ghiOz0LsWnLZHeva8S5+oiPp8SnFnqyC17PqtAEK7jk8Dt8+EeNpc?=
 =?us-ascii?Q?COeluFa4q/EfAoeWQdr54uzg5D2UndWNZGGM4yt2e11iYuLLS7KV3Y4Xq03v?=
 =?us-ascii?Q?kI3Ows3dc2Ux+NE2xtypBe1DZGWONo2fGUxZ6iB6Ron0/7JYtFrTmOHxpmnI?=
 =?us-ascii?Q?VUxRmVJaJGJjcmI4oSEOyX6ZcHVKKI4cJCe3vcvyHB+FD3Vflbm+pfU86zDx?=
 =?us-ascii?Q?2dnKF+O9+KgHLSe9zTegCboIj/Iy0wdFbGXAifZptDpTk9SWyUohaHUhy+z8?=
 =?us-ascii?Q?ydB6dlYPytTvRsPMo5Cd0/1qX7iveNeSfj0/ZwQKHJVOuYsuhCfuYxFMrdml?=
 =?us-ascii?Q?ScmqER4pAI28tnYfzd9S3ohvcSC1dfTyAXO6Pr/QpAf0e6Lt5Ureeg9Ora0h?=
 =?us-ascii?Q?1MnV7NkUbgtDrjRBQAajDvCuiknthqQPtZPSDsuRBsnicBqrmRQtK2PySWsq?=
 =?us-ascii?Q?P2mbqXxHdXhaoQUVsKCpk7OYVsIQm4Rxb1tyPdUrUPLXyP2QNZF7ZThjZM6x?=
 =?us-ascii?Q?4yKymU7Uj4RmLcg1XZNkiTy5/eoVgVTRmmor?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(366016)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3JQRRBayF+BRj11GZSpPmAi0ogjx8l50YmHP3ICelsOknH2Y6Rk/NfM5MEox?=
 =?us-ascii?Q?FesJGAEXZ96o2ZSW9NIRbv5E77PJf4qP8IonWkaJj5UeOP7JzI7VDEX5TmmI?=
 =?us-ascii?Q?P5KwVTO3hE7xEAI45QugBMa7K0/+PUq72dpYxGHtoiLgnwbTvhAF6p4pJxIz?=
 =?us-ascii?Q?SxrLKmiP/qqmw/P1V/m3KwY/J3SSbZwGT+cythqXOfiBqM50dyyCyhYUTyzg?=
 =?us-ascii?Q?ncuB+blHe1fHPQu6JBLrIIr+me3S35DM0NpzSxGbjBOcsk4SWiylUtQWGssr?=
 =?us-ascii?Q?XZM6LS6w8VfK0zxxyDA91hS4VvP3XFV7H6C8FqKbd0OpZGZh3y1SvnUV9yTB?=
 =?us-ascii?Q?/sW7+EUT41C40gMxlF/rLUQLFVMDwpTzoK2FxQ1UQy8B0ysPQMtuno1qiQfP?=
 =?us-ascii?Q?epNUom9oYOAiakFR0GkYPdXRIT9C0B3lTbolIKR7dRyaYv5LKQBKYoJuqphq?=
 =?us-ascii?Q?ThNntFXSmvPFjweIg2TRgtJhOegakR/Y/a3hOLLvBCT/3Yug8GQ73tlIn1m8?=
 =?us-ascii?Q?oMYF6eaWT7Qnns1/Lm21u//Oldk43RTbSuwKvzRKcKYPIjppUI0szeUGwmOn?=
 =?us-ascii?Q?Dqw6U1cmoFoDIUlReIKCjP706E9VyKiesnAKd02/3NQjHqOaI1HJVMMrI++K?=
 =?us-ascii?Q?U2e5j1GHDCAJX90W9/++ryUU+ytiURtrY/ewsn4N9NcpubzOpJp/kI4zJEEr?=
 =?us-ascii?Q?r4l9yrU7LFLcMvI3Vs3q930ZKFK8/qI3n8r4vgAmRH1qBIqh1crLNfsJKvPY?=
 =?us-ascii?Q?FuIH/2YBLXUt4Jy3I4TJq5aeBt/P0XfWu/7AxIS1FtzFggGiReRmYjYDTkJr?=
 =?us-ascii?Q?+wrKee527m5qOq4zlDexCAfos/Wyv6zPMM5Wuh0XttebcNr+7Cog7XEyQKve?=
 =?us-ascii?Q?osRFhBU8EKGvm3BuGv/TcsfjaHadKkZZc9jR0gG0YGVriyPxbI5vTiQG5ymS?=
 =?us-ascii?Q?zs7NbC2n+1FvIgQ9TIP0pBapHQYxx7LyUBLQ7BO8EITZAFGcwg6+5G7AdyZf?=
 =?us-ascii?Q?9yrn/XEPKFKcGTmhEpUWH32c4f5GpunfpQ1+Un0NDTMhbbTfx0IenxXl2hQX?=
 =?us-ascii?Q?B54mbEetJzjl63123/etumrJAAJ08O30hNyt/tjq/z1voldzY5EsXaM5fZpO?=
 =?us-ascii?Q?jhTgWs52H4lz3PWRk84vWKIW/2JHkWCwE5nuw6fLU7X7y2brYQ1rYcOyrqCG?=
 =?us-ascii?Q?O6Re/P38iabqB4NjnHfhvBswc2wHj6DRMvz8Tx/7uR/IVREnsAyHpXTwiuYO?=
 =?us-ascii?Q?m5dP0rWcc9POlIwWoBxFtEVrbH1mEgkGxpMLN2pp9/Sqxb84mckSBwtqoJ3B?=
 =?us-ascii?Q?Eali6ydNxMHpqg9wUvJ5tQkqWmHvFzUYtBbzFJ4h9X4PXgibreyuZ0qkKjU4?=
 =?us-ascii?Q?5/Q6MkcQfcFX81ayHyIni2EiOG6eX/Mfc26kMGTGDRaZ8VFw9lVKMicEMUnC?=
 =?us-ascii?Q?6PXxT4UzI9nbNhS8WDnegkS0mMo+x58UKoLk2xx4wMLfqMJoP7hXB3broomo?=
 =?us-ascii?Q?jv7raFOLDti7N/vvmdgsRY6L/gCHizOvnbx/JRV04gI/Tr+Mnwmew4paipnu?=
 =?us-ascii?Q?kwNuMRaB8uSW/vtVMM3FScyhvkkNluPd2skqt8iB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2c69517-4e7a-4570-10a2-08de26b7e58c
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 15:34:00.7037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fPkVkzclfnrbZy8JrOHtKYs16Yd29mItD7weTrMmwO0azmqWFEYjbtfHsY5VqYCgMVu3gJH7FsKFHW9fEF7K7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8397

On Tue, Nov 18, 2025 at 04:30:18PM +0800, Haibo Chen wrote:
> For SD card, according to the spec requirement, for sd card power reset
> operation, it need sd card supply voltage to be lower than 0.5v and keep
> over 1ms, otherwise, next time power back the sd card supply voltage to
> 3.3v, sd card can't support SD3.0 mode again.
>
> To match such requirement on imx8qm-mek board, add 4.8ms delay between
> sd power off and power on.
>
> Fixes: 307fd14d4b14 ("arm64: dts: imx: add imx8qm mek support")
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> index 667ba2fea8678215c611dc0ca19e8fbc397f9273..f1b0563d3a09044dda30627a62de5707b53f021a 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
> @@ -263,6 +263,7 @@ reg_usdhc2_vmmc: usdhc2-vmmc {
>  		regulator-max-microvolt = <3000000>;
>  		gpio = <&lsio_gpio4 7 GPIO_ACTIVE_HIGH>;
>  		enable-active-high;
> +		off-on-delay-us = <4800>;
>  	};
>
>  	reg_audio: regulator-audio {
>
> --
> 2.34.1
>
