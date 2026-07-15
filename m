Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013054.outbound.protection.outlook.com [52.101.83.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEC82BE026
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 15:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784128672; cv=fail; b=ooaCtQ0YfNmw+GbQh4iuZki/2EC4InYQIatEvbkK7xq7A2bCf/CYB+Kfv1HnC8+97fNYS7eKWlpGl2O5BCQR1tCGT64jPj2PVhR64Zx8UBhwxVAq1OwEKb/LUJTEPjRgrQDemVJAqtPtkDijs7CMcpd1rTjqlcgUzKCDuwHvnXA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784128672; c=relaxed/simple;
	bh=qEAzmbe9ZQlzNgM+7LcD1G1HVI1oCC20ljw9Jqpjbl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hr8GO3uHGjfGFvnMq5FhjgeAfYmSRVaAButRR5tSqZzHh9/LM1OVnkguNZfOz6flFIyuwrCdc2O8hqdhBKaEkUU8EcOG+cNIifOBRf3gpo8ofDP94i61kCfTGazMa/m4fLzwcPHDlADxNruHroTB8Uw09renfKQhgdwzCTYC/38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OxAeg58k; arc=fail smtp.client-ip=52.101.83.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OxAeg58k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJTO/RzMI3W1Dvb2vyaY/UueV6oB7JcAJgdoXVemILn1c2qJUbiizFqpbosUUnZEXaFms3IbtoIHBW/3DXJ3ygkX/ajfFHU5pYZBEYcKIIgaxHb9c4KuXWS8nmAAaWO4e2SOSYdk973wLo8RoOGvwLi7+m+fjjuMzlGr3lYzAOggKXaHmc4raqNKSTgRHa8bE252BLrW6neWpLCd9lQlhursPCk1gpSl5ohtZCvBpWD/X9AzjQXhzgrPlPiF14hUp7+L71De0gXF7RDkTRNZqmU1rMolGfG1gO4HBXgi3G0XW+GM+/hNxsar6P8rvFpb9VoSyQVLkJC4OvdOLtv/aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J54Trzto32k8Zc2ov1vi7yEcywLZkklFBKuK6wZip/A=;
 b=bsYI0eo51M9L1+QFGPvIjSKZ0wPOwPuMujEyWVKIYBRGukZbyVLGdKOymF8O2zJy/k0/G/YYKLNUFR/xhFGQa6sZTjbTN45pInvxId/rIx2LfQfOasZrX5qdAwz4vXaFGJItNGb+se4oXdAGDiwOaGcoUGd13oL2IZSCBkWz/YxGxA13XKvqosU9pvvxIA7J1j7HK2hFUUVu+RIg+JkTok03XJJCA2cSG+qBf0UGTmWziBmwJE9wnq7hfSzUWf7m36KaTR7kTDRxqjHOOAwvDEkSBht7E7qfMsI8xbgJ9EkvjzIfN5Szz2DwkIKPTHcfTJFQgJ9alGhT7w0jqtlMwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J54Trzto32k8Zc2ov1vi7yEcywLZkklFBKuK6wZip/A=;
 b=OxAeg58kwF6CI12+6YkA6Curtlho5QahfLiN6AauA6TGya131GZ/aw/da0G7FGVyVCYu/MWRnHEt9TufqjvUWuggTqsIB4fD8veszIER7I+rMP21DC5IKMUXBh7HL8pmsdfOup4Q2Agz0wk2Yfxx7t6fHUVmk6qQUf68IMFSjC4f2XbTGG5ObbAJ385B/elnbPh9aHsWlkWxnU7zJ8mBpxCFloGU8WOEMPvAeEUe4uTxl/yZ7dYksS2aBefQORbdiEh9TWQyVuEAx6jQXXi9RqnvZYJECdSUuCQntk0WZO7KG3XBzQ0TBqvkTppBrGqYH2tbrBIBO5qSs2csIy1QRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8557.eurprd04.prod.outlook.com (2603:10a6:102:214::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Wed, 15 Jul
 2026 15:17:46 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0202.018; Wed, 15 Jul 2026
 15:17:46 +0000
Date: Wed, 15 Jul 2026 10:17:36 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Sherry Sun <sherry.sun@nxp.com>
Subject: Re: [PATCH 6/9] arm64: dts: imx8ulp-evk: Enable LPUART6 for Bluetooth
Message-ID: <alekkFQGl8x8n9KD@SMW015318>
References: <20260715-imx8ulp-dts-v1-0-19651358b599@nxp.com>
 <20260715-imx8ulp-dts-v1-6-19651358b599@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715-imx8ulp-dts-v1-6-19651358b599@nxp.com>
X-ClientProxiedBy: PH8PR22CA0005.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8557:EE_
X-MS-Office365-Filtering-Correlation-Id: f9ac9955-2bbd-4e7e-d273-08dee284395c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|19092799006|376014|1800799024|366016|23010399003|11063799006|56012099006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	4G98tTlZOztTXlnhFw4mI3uyRtsUIewBDUrO/LjO+t4k7ikVtqgVyr9vokRKWwavaCouAzpkAQGC0KvPHMfKCnLYgMeNtAeP5aKnkwbb6er0hxboIRw3UaM5Ni9o9+3+CRyvJC+J97RYYS//UvVwINNORW9R2AIRp/qoHfMv3ck3Bkz3BFgWi4h4dSq9DCe+n+tHks3mSFN/JN1EFQaWteaNcb+JQTnWPR2L8XjItYeDy+1Zrl/KvzhrWiDaFM03Zqy3snDPnEPHWGYUsDhoWGqJXG6ufobkCh3YWGMkFLZRtsn5A5vdryt1QmYAQlJiUzp7fPaeTv5fK0oUp5IN63+Sz+rffTEAUQymdsPDaLGAV0Zcqth4EFngsA9oZqB+PiUE87ChluacVUc6sUXGVHuBTvVgyE3wIcVP4U1mBOmM6UEfzphTzaoXwmiQ995MCmnpnE4JBxQtyrfFEWyqovXYQptwjvdLfFDg2vA3j3G/h5zn8P1XgXLCqSBIRWdD8W0GPWlxdiGDefXRrqruMTceb2RFfeDV93Wb+6rgHK1CqdbibcdFlYONmDWa8FCYJZLRe3MEsr1Oh3AmXbWw9OjjziXpPvtVaAdDLUwLHwyo0+jKGoUhFtkdUYFmo+HGOJQav+sJMu7FE+2Xv44waNDtA9R3raqusfNcENtClmE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(376014)(1800799024)(366016)(23010399003)(11063799006)(56012099006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?O56wlMVgC6DXqhY2WgWOlsN5SW8q6Wk5AxTu1aapWFdtaEShHoGUSX40NOKC?=
 =?us-ascii?Q?/+X3tvE0Tb70uITojGf49PrRNE45rl4/Q6zurscTSknTgl3uzHQGtvPHS8DC?=
 =?us-ascii?Q?tGmll4es5RmdRPg2rBzHy54ThfTmHzCnaM7zHuLeMHtNbW0O8Djyyf09EX/p?=
 =?us-ascii?Q?ZHUv7Vjt5ijnyiU9b0c5x8/jLBfDi1qD5u1CRwpgR8+z4wcL+hMRKVSeO3wT?=
 =?us-ascii?Q?MOyDwIWwSeSL4IAwUO9bBogaHhSALHAc2vOf/HV86z4K3QrJUiXVr1X2asev?=
 =?us-ascii?Q?JdlzDPSBdHqtKb63snsuY5y8wb5ow8lop+Ye1vkWoXoOFw4Hj3JUdGtqqPHE?=
 =?us-ascii?Q?yZrOhB0C0TEUcgS0rhuE0s2Wmnymf5FbitiYwK0PZ5QXUEpkxv1Vn8/7Bfh9?=
 =?us-ascii?Q?gkrdMBijb/mNrVs4F974RZkpN7opxtiUcql6SE3edlpZeKdXuEvUcoFUWZQc?=
 =?us-ascii?Q?8n+XpGOiH3Ta9Gr/boA5QPQkeraEBE5mzb1nu5+JBb1m9F5DMOoSZ/8PajMH?=
 =?us-ascii?Q?tIsWC01SqoFkmMWKFTojDBWR81Auvz61Gyw7dBEYEuIbdPQlRj0TDIgWPLOC?=
 =?us-ascii?Q?zwQ+lXzUo+pGvaDCTNZc4Fe9P/2goYVXbMsJPXP6OQWAYRv+lcGgk8OknCxj?=
 =?us-ascii?Q?orNGjZ7ZaS6NnLm+0YbUvWVnCbVvSNP+Oh3TJ3AypHZRDHt68h9eN+bCPNnh?=
 =?us-ascii?Q?7PLsZXl0GkGgarecOxY6GGG1jsMkEy4kSEYjWN0W0YS/RAbIVoD1zKBLJWN8?=
 =?us-ascii?Q?AXuqwf45Lpnre1YFEgFP3AySU97od5EqRlcU+dfeUyY4kexp5PcyBgW63PrT?=
 =?us-ascii?Q?/niGk3tybTWoTQykHE3tZ3lGxSS3cfivVRhlaxxTprOIlGDzJFUZZuDm3Vzb?=
 =?us-ascii?Q?2KIG2MFrJzayMPlhsESredog25cBl97nmYu31I5o+129Kkyw6SNyW2RFjNKo?=
 =?us-ascii?Q?ak2uhWlFx2EDNhvYs6ai5sKYrEs0O1AZ3zUCoVkZY6lmnWS2LFT+nqHw+xar?=
 =?us-ascii?Q?q5RfjYZKbs3klzuN+ZvBlcThHn8ppeNBt91N8xgVB6oDgtaoU7JxQwjuDOG+?=
 =?us-ascii?Q?dNAJAwVIwde+8wNhRsGFNCGu5fmDJkp33oHRwqGc1vCbFvnYT+1FZ4w5gTE7?=
 =?us-ascii?Q?ZVnUeKg8Egtv7QKk4vjoAmlRR6CiWGbKyEKriA6zAaVXgODONW9JLjnC1Y9x?=
 =?us-ascii?Q?ZD1hYHVGd+vVB6klm0KyNSqLlNcIlLb54F3ZTQS9vbInAHUGWjX7awO57U4d?=
 =?us-ascii?Q?fmQ2z6Re9u3RGhgTxKIAUZyrmDJVQWF0Rn04HzLFsGYJgULJDLGOxmAAyTDp?=
 =?us-ascii?Q?YxRikX02/YsHmWWIwyBK/kMhCVH/+rapnh3aM3PWpeybpUzVskrwmDsSYnD1?=
 =?us-ascii?Q?YC0R+jW84LgNOLg7ttiwHUHkbmaYPtV1DiM6t+pjIvu3JPwVtv6qEzehSL+B?=
 =?us-ascii?Q?C9GrNGM+tNCNuCKJyrXb1TyTjWNwEVQBL5GO6HAAKJxCuljrE6NG+gL6nVj7?=
 =?us-ascii?Q?Pt/e16jmLU31/NtutEljijLBU/p6DuyCdCygcc5Vv3CE/meTEDzHvrIH6T8p?=
 =?us-ascii?Q?/Affh91rtLg1BqQyLbyRdyg/TQhgCoKifCsvRwvHiWmmC9rdSkyHPjXOJyBk?=
 =?us-ascii?Q?Jcj1uLVKGOFxCyvj/65/AZ9hUR1N7XIYxOz7REnR1zlDyULH1keK3WVVDUzD?=
 =?us-ascii?Q?xr7/lBkPF2fpWviL+IfFYJQ3XHsRa/SLP0jfXxV3wVDjCPH99oWQKbricuAl?=
 =?us-ascii?Q?ha/i4cs78t9jhIhwQbkXbc2F25P7e3kcULfCTrv4fxb/armPTlH8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9ac9955-2bbd-4e7e-d273-08dee284395c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 15:17:46.2864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rFpKwqgdkMTieutaIUmfNzfCwPH069/m7GudtWok3HXvmIQ/GTw+ZufY1xrIPJHbOP9oj4FtzdCQr+rnlw9F1XZ/cb+z0+AXw7gn+sKBBjK2NxHUFkVsoLLv661dgplU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8557

On Wed, Jul 15, 2026 at 08:33:07PM +0800, Peng Fan (OSS) wrote:
> From: Sherry Sun <sherry.sun@nxp.com>
>
> Enable lpuart6 with RTS/CTS flow control on the i.MX 8ULP EVK board
> and add an NXP 88W8987 Bluetooth companion node to pair the UART
> transport with the wireless chip.
>
> i.MX8ULP 9X9 EVK use different lpuart6 pins which used for M.2 bluetooth,
> also use the sai6 instead of sai5 for PCM interface on M.2, so need to
> update the pin setting in dts.
>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts | 17 +++++++++++++++++
>  arch/arm64/boot/dts/freescale/imx8ulp-evk.dts     | 21 +++++++++++++++++++++
>  2 files changed, 38 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
> index af8f0d6087f71..71c66c58edc4d 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
> @@ -75,6 +75,23 @@ MX8ULP_PAD_PTE20__USB1_OC		0x10003
>  	>;
>  };
>
> +&pinctrl_lpuart6 {
> +	fsl,pins = <
> +		MX8ULP_PAD_PTF18__LPUART6_TX    0x3
> +		MX8ULP_PAD_PTF19__LPUART6_RX    0x3
> +		MX8ULP_PAD_PTF16__LPUART6_CTS_B 0x3
> +		MX8ULP_PAD_PTF17__LPUART6_RTS_B 0x3
> +	>;
> +};
> +
> +&lpspi5 { /* conflict with lpuart6 PAD_PTF16-19 */
> +	status = "disabled";
> +};
> +
> +&sai5 {
> +	status = "disabled";
> +};
> +
>  &sai6 {
>  	pinctrl-names = "default", "sleep";
>  	pinctrl-0 = <&pinctrl_sai6>;
> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
> index 6a92c5ca9a412..66e99cd24040f 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
> @@ -167,6 +167,18 @@ &lpuart5 {
>  	status = "okay";
>  };
>
> +&lpuart6 {
> +	/* BT */
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&pinctrl_lpuart6>;
> +	pinctrl-1 = <&pinctrl_lpuart6>;

sleep is the same as default state, are you sure need both?

Frank

> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "nxp,88w8987-bt";
> +	};
> +};
> +
>  &lpi2c7 {
>  	#address-cells = <1>;
>  	#size-cells = <0>;
> @@ -349,6 +361,15 @@ MX8ULP_PAD_PTF15__LPUART5_RX	0x3
>  		>;
>  	};
>
> +	pinctrl_lpuart6: lpuart6grp {
> +		fsl,pins = <
> +			MX8ULP_PAD_PTE10__LPUART6_TX	0x3
> +			MX8ULP_PAD_PTE11__LPUART6_RX	0x3
> +			MX8ULP_PAD_PTE9__LPUART6_RTS_B	0x3
> +			MX8ULP_PAD_PTE8__LPUART6_CTS_B	0x3
> +		>;
> +	};
> +
>  	pinctrl_lpi2c7: lpi2c7grp {
>  		fsl,pins = <
>  			MX8ULP_PAD_PTE12__LPI2C7_SCL	0x20
>
> --
> 2.34.1
>
>
