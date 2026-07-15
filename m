Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011024.outbound.protection.outlook.com [52.101.70.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFFD48095C
	for <imx@lists.linux.dev>; Wed, 15 Jul 2026 15:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784128755; cv=fail; b=Hd/FFLX4jgIikVyspvLJ2z4lsFuEVyFCmeBf2RNky11RJrPP+Fpsh/CxSj+2YN+7BayhNT+138K8JGqt/GuQiQjEP+c/4c9/NRvvJM0AYY0+wa8ZZ2a5TPiPOsr6zGXAWgUYlBcsQlUZ4lBNRbmA40Y9GE9yGm0g14dq040wN04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784128755; c=relaxed/simple;
	bh=70azV+2U/tSnT9PXZKKxF9fpT/Rgg5NRbJehjR64LAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DkLGlLoVEiPb3b67TY2r8Xh0wU81UcC5wX+BMZuFMPQib1SUDmL+E0xfgkuYvBLvM0P73MAkBEFjSNoUWOQvVKWH50KRg8c/fcZkF9yl/8Jmx08wNyPJzaoaLwLF+DjVvXWeKSiCR1KyKlrbb1lvFj4qPHrLHFWMEiQ+2fXb57E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=P+Y7k+mM; arc=fail smtp.client-ip=52.101.70.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="P+Y7k+mM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qtTWiP2ftLWHwQOg68d1QsBgbsBslOd+zbifrYTwPNtd/eb2ecHPSJ448y46pOEfazG2fWBJNzkz+odf991dQCmp6SJAUVQaozmsM72SjJ4iMEIvPxKM30aa7o1wg1ppnoIlGe9C4jZTKDNuK0fazY9tQH8NOkLmsA5vlCpxQ6wjLCyTxFLREfPqvFBI4TF4jYIfrRg3udVfrVn7FvvJl0C4qQNwmHk2H+bG1icblpLTz5jsCtDomn8asCus/6PRjqOV6x8IETMGnwMp5oFq6yOYZCsdHZaViQE6+eT57et89eyaE11OghkaqT362Fp6mXHoLPinyd/kqt1g60QSYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tt67xBHD1qf9Tb3wlx6rbSuh1dHlyDIwD4+9s1Vcu20=;
 b=HbBA4LMmnMre8MbSK42hNc9MfGst9WrzEbRvhgQ+HR8jFiNxsVuenRLC+u23boW09PcQunXIVY4nfwFeg3PMzJRmh00lsP4q00gETRaXeOdCi+sDHHNJiUe6MtZ0VRjSm3HNdBUEYHGMdyAGAGj9yF9bdAqJSrYDaxvNN6n8W/MwXL9Tu3XIu6Upl3gkKrot6/DB4N4WYy4TeCdMfwhLn3Ic1J9siAdcAoIQ5ntIJ6ukwzC9WafqdQjphj5LZeViEScirOpk+d/k/ANjnAVpgwExI4Uvn9RQtzpeIYFVLxagJz3E11KicxsMvBqdNsEvMEuSDc+pxgVD3j2PJtW3+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tt67xBHD1qf9Tb3wlx6rbSuh1dHlyDIwD4+9s1Vcu20=;
 b=P+Y7k+mMy/Jv3uNkMhT/P3eYCdXUVQP3Oi+f7yQh4ccRjUpKBgim4zzvYwMu7RMTpTsXIEcmOauKaIvrYTZgMoVOARiY+30iLOhDdMHzEpPqxq7ZzuspOwwrmxyefBcPq/WqiK3HbxUij1Vo+F/HOkYWjqUs1reD5JaTPPWo+WhWpEBKZrjPr3RmM2uZfDRCfxIqd1EQ7rNg0/1YYkYQd+zD6D0n2vdZmZVREEbS2eYgN1cMuwaOlnJ6mxXgQ0Wb0P0om2Zpvt97bhGcAbrn/yz3cDX1k46B4402j8DXLKKjgTJGLcjpXT8yT/dEwzeWto8CRvmWpMLDXsD4JKK1UA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA1PR04MB10746.eurprd04.prod.outlook.com (2603:10a6:102:484::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.20; Wed, 15 Jul
 2026 15:19:08 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0202.018; Wed, 15 Jul 2026
 15:19:08 +0000
Date: Wed, 15 Jul 2026 10:18:58 -0500
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
Subject: Re: [PATCH 7/9] arm64: dts: imx8ulp-evk: Enable LPUART7
Message-ID: <alek4tElFofLUaO-@SMW015318>
References: <20260715-imx8ulp-dts-v1-0-19651358b599@nxp.com>
 <20260715-imx8ulp-dts-v1-7-19651358b599@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715-imx8ulp-dts-v1-7-19651358b599@nxp.com>
X-ClientProxiedBy: PH0PR07CA0104.namprd07.prod.outlook.com
 (2603:10b6:510:4::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA1PR04MB10746:EE_
X-MS-Office365-Filtering-Correlation-Id: 83572b8e-b229-4d5d-274d-08dee2846a59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|19092799006|22082099003|18002099003|10067099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	m2mtzYm7qod118+MNls4vcJbTrRHHTWJvJ4excyv/dydU/hyD5HjrfkSFvCTTpcDmCZDCMz7ThmthXWtPs7YGdIt7YByOB1hjwz308K+wtKWYwPaaht67LYgPbgrHE23gKlkMx3B6eclN3bz9SfvPujGd9Q6VDXp206qSMCuhSwFt9q0mvvDuNeHtuMX+iuyCWxDJuTfpw9uFHTl5nZh3fdGZZZs/MijqWQS0NGsD2C0xm4goTIzDU+VCWkPgKGSOsLuaLTrYpkjAyF5B95r+n7ZjnMcgoFMj7wkeOoyKyd8O9CstN6TMbJYANY53NEgDqIFSV+rwkdRmK/nSlyKdQsg7UYIAMzSXe+Ih6q9LGnWm0vCEmlzpKJyM+dgOezrMlk/pC0Jh/ETl0QMhBFckhGGHVHmXVIMjSUl+qe+Qq0bwgCwr55vBud2QqTDlsFM+zfbHulbjLdxgApflu+EI/aI9DXSGwFEG0pikh71RwoFHLq5J+3MAIamdfa2XkXjcV3uREpLUPG7TUCF4DfJ5hzh2OrPG/jVVln8ltBp4g47stVBkaEMg+QlQ3eUs1sl+oOITNsih5BmE083Y7CTCTwpjQjxeDVsKhQx084ohsR8jab93RQxkEwUra8xG3UiU7Zvnyd4dSTBvvBXRYwFjGXSFAX8eWWHwF1PismxgiQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(19092799006)(22082099003)(18002099003)(10067099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bFiarnQGWocIdvwgDSYNbnerKGVgLc4Z8C+mldK0a3QbDPMkAqSH0EyI1i5w?=
 =?us-ascii?Q?NK5S3/sRyfEYkCckmpijHhqczzM4qWlRc9VRPKBQApr7DeDD3OGUjOl+Wl80?=
 =?us-ascii?Q?tyKBkRO1i+D6/iBnUCSE6HrmpgX8Eygb0CuJOQxX1yOQpiCSmo2AeuETyhpo?=
 =?us-ascii?Q?z6tY726wun98qCk7WTG0rUOaOdv0m6I58zXyM28BFc3ThKyLkoA7pYZ8oPYg?=
 =?us-ascii?Q?kIkn94OCT1c4G3Esq5nJnFB0MMQNbWDvygv1vEsCtLr/OPthOO6XvN+jQ7oT?=
 =?us-ascii?Q?C3/GEFOZJ11XNMNmyyqQtcbOmnxEN8TzsbHwxRg8gyJRs3hiZsblstao/+T0?=
 =?us-ascii?Q?xjuwRQLnw9h7g0A3F2znujvcMECXFj/SUCJ0kc1BhI+jmUzoZkuJSJ+Kb0xM?=
 =?us-ascii?Q?Dz4b3isN+FPZKaqcIU3GRWonyhKjUbrCibyJJU4QuTW3VMCHOHZ6cKDDspTn?=
 =?us-ascii?Q?0UwsgNFTUyrzfGv5CXWixGsMpgxFAdS7mK1ucgJNb8hPykqJ7ZPJpBmD4oNd?=
 =?us-ascii?Q?LJ+FdCol4nKT7o3ekIgBTEKZBaMuFSci+uADIUsVESjWO5qQObK2yuSrkA1F?=
 =?us-ascii?Q?ST0IxSZRev4WVgIn12GQBY80btrSZ21StVAvh9VYRpMY69nJG3Di74k9whq6?=
 =?us-ascii?Q?D9ca8EDqe0TdcfKqtNKq50v6qfY33n4oodWi5IY7Dy3ObsR07v4usrYCuTSw?=
 =?us-ascii?Q?LnVHzliJFHmnMk2Bvoi4N8OxzPRWA1hqPdFulD66OAAxUYZl+qXLQe+FAme/?=
 =?us-ascii?Q?1fnBW2FdUBj0AfTK8EusIQ/1QxRQIZUNCrTaYzmuCAekmIEECjdYR1oSP0WF?=
 =?us-ascii?Q?pHMctcb/naMQ5xAepTnDD/g7MJcgc4+zZjN9Gp85XOC5iE4oUsGarbaQAAJN?=
 =?us-ascii?Q?gyVW0aU/v/qRdzCxc5Qp9AWuGr1N3OPg9yAx2CIt7TzF/iSHqexeAhVhb3p1?=
 =?us-ascii?Q?KoQkuS9EVYIj5yJH8s3v24ia0ypQrduv6mlyZP16L3v2KBPrNPbJ4fpgYRDv?=
 =?us-ascii?Q?uAsOBM/Vz7zSnnDgFwZJH6Nv9VqBm2pTnud2DWe3jI8sABH3Vi8afrwOPohQ?=
 =?us-ascii?Q?YTAZHLUSTr8G4upV+IPs3KKtObn2p7dgQsLAkdNIGo29KX2GXVf2SARABe7+?=
 =?us-ascii?Q?f6JCo4N1hjhE4Pk7xErnupVM6SYwUVPtVBuALv/V4SerqbXjistJFCLwAVJC?=
 =?us-ascii?Q?BpIhotGQh330TwmM/YUvHLut5iDD48A8Hxb1CsooHD0yNZIet7icpmPKmq/K?=
 =?us-ascii?Q?iHo5fVKd98dvEmqmXL93jGh9pCYBa7IWr8NmI+97pftuA91IxcmvDJ0g0B6b?=
 =?us-ascii?Q?J9kTAqALONf5CKRf/Qfj64gO3X8LEzT/10Af7g25T6qcs2k03+uTSvwlD5DO?=
 =?us-ascii?Q?Ux9HtqE2heYjiswOH0OQKIZzLdZP3XMR8xligiL+yrDfpocZEGaouce/PXRH?=
 =?us-ascii?Q?B6CyK0anmICa/TaQ9lVeLypqGxoLFPfqsbxjl+9ev6+BPEFVQviCq5I+kIOY?=
 =?us-ascii?Q?wXrrzpAlxcP2VvTztSixt5pkS7ZoJx457de9+ASx6nk58Jucf1v2SW3lYCIP?=
 =?us-ascii?Q?N6uM3YIx94dA86Ysx8BLTjN0//cmkgNTL/etX1tOlLQ8dUitCURMbHR2WaqZ?=
 =?us-ascii?Q?26O1sTFtbl8dJgQkr3fqR+LTWcKIYqecGmwfYitt6mXh7G1FTZBTEa6lAvzU?=
 =?us-ascii?Q?McYcUPQJslgr++2T1ulwdW79FKal7IzOk8paiaA11KY/TTCSP8dMQVXnldNi?=
 =?us-ascii?Q?3Qpu51p74eQiHoUcePIvl3Y4red5Y78HnQ9GOAWHxElkVtKk2icz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83572b8e-b229-4d5d-274d-08dee2846a59
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 15:19:08.4132
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bvPzfg5Yej2QeyaeysC/uq+ZYSbYTndtCL0WmMuxXjEOdvAsU28V9+k/wLIHK0cg5I7nHhhMW5uX3fEHGPXBUwWVjw/f43Y/WsHgAbeZymSL7pkOcrizHk50qs6UumwU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10746

On Wed, Jul 15, 2026 at 08:33:08PM +0800, Peng Fan (OSS) wrote:
> From: Sherry Sun <sherry.sun@nxp.com>
>
> The i.MX 8ULP EVK proto1B revision routes LPUART7 TX/RX to the FT4232
> PortD connector (J25/J26 pins 2-3). Enable the port by default so the
> additional serial console is available out of the box.
>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
> index 66e99cd24040f..938ead54ff50c 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
> @@ -179,6 +179,14 @@ bluetooth {
>  	};
>  };
>
> +&lpuart7 {
> +	/* FT4232 PortD: need to connect J25/J26 2-3 */
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&pinctrl_lpuart7>;
> +	pinctrl-1 = <&pinctrl_lpuart7>;

The same question here?

why need sleep state

Frank

> +	status = "okay";
> +};
> +
>  &lpi2c7 {
>  	#address-cells = <1>;
>  	#size-cells = <0>;
> @@ -370,6 +378,13 @@ MX8ULP_PAD_PTE8__LPUART6_CTS_B	0x3
>  		>;
>  	};
>
> +	pinctrl_lpuart7: lpuart7grp {
> +		fsl,pins = <
> +			MX8ULP_PAD_PTF22__LPUART7_TX	0x3
> +			MX8ULP_PAD_PTF23__LPUART7_RX	0x3
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
