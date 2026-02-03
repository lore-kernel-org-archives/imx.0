Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013039.outbound.protection.outlook.com [40.107.159.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1879B3D3CF5
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 17:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770138435; cv=fail; b=GlhkGDeBsLrCZhcJ1ZYUgadjWdDY7wpvrTrJ9CQeS3wCEHeuhc9rwU+0mxKMQItXJ+ZSBUvnCOW6JVkxExTpVUoQede5DCCxos50Q8uvzTlxe/1vIJ+nLtjxF8Xap6bHjygROm9U/aKLSKFwvsXmAt7bbQTpWu+g0vVtIrhF4RI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770138435; c=relaxed/simple;
	bh=QEWHFGSIcqDYOFBINaZKLA3+isif9NKKl7KaI1terUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=q2aaRAozBYuVUyC2byLGJCHNyKwTTgsc9Bv9dYLkNXzPYrItO5E/yB3z5d7MUt9PNLFDVv1S3HJeImH6hsTG7nY7gd4px/5GUB3sNqPy4XNU31jYnk7Hgj2FJU73aSQsjqYkZ9+wg2umLOrb0dW4SN21tHgRfoajfjn5lG19GgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hWG3MTXx; arc=fail smtp.client-ip=40.107.159.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hWG3MTXx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iiydFOvjiLgVFURjn5Q/aJmgyunzSQ2LK+efeK7NcXVNablYyKYueBynkadDvUuXylMPkfbKEAo/r1pUyzD1LEy0Vr+/B5MIKWi1vuLk8XBrdiLmrPK8Ew90OqkJ8ml/kGBVXt2qzzoi5OdK3AkTypAy+G/rUJCi6U6DTiHx5f95hu9lDySQRG2DuN43t2J1hJeCeikpp2quLOjF+unyYeyd3WQhDyIRm1ESK/OwiFgMWZtvTnyh/0cq1f7cpOHCY+0xPupFeDDHCihUs3VO11ojrOf5ZgX1vI3OPJXb38/l92Ra4QyYylSzCGWTYAu9aee6ZKfAYhtB9qijjzYrsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dXOtwaQE33oHJIxGY1dconMQ5TXnpihRbt1p/ZVc4s=;
 b=qSUcAsvS/85JivtBLk4NiJLBfRMi85nv/L8GB6fW2nDHBAmv2wTQ8KHF3ccr9+J5TGXWX7FzkEuZpd0CTzKDU1YlYw2rnI+9axId+T2nIzVA+vU+ORW390U03BS6zc+s/15jM1Cs1zJg3Cfqw8mL+DBH71A7HEuGEWpUST0qavGtkux7qf19U72/q7J5hoDNa2awEYKTM8+xKczHeLPLqihj4441hPK05QCNdCcqxWm7Wae+8grz5ow73KECrOCLGVYTR/qXEbH9biqickjWCpTSGSEU6T1FWJQ2AiEtplMMbmBCqaJTOvoqc/cD6dY5zYUFyJjKhw7lGWVZ0yiRYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5dXOtwaQE33oHJIxGY1dconMQ5TXnpihRbt1p/ZVc4s=;
 b=hWG3MTXxPPTvfjvOz2SDsgybrWytWWp8sRlHJx/uT9AV1JjLUMthn1vrzcjV+/uBg6hGD89dlC7nslOWQceS0YIq0sEG8lUtM679k7+o1XFl3PrK/tK3yXjvAedQSx/IzKVSjpMiOFPxa8U608iCQE3TCzEv2xusS7AGM8JWx4HH/hv/K58sVIaN0LR8uI7PtS2pLXYiSSMtIyWqv74DidyijRBqr/m+1tS1CIqYcz8mNAbgaW574E5+S+0MqTPrp4Q7NhKg/qt9z9jLuB3xPi5AY4SxR2gE1md55jftSs26BI+BiREcFSKVXLxalE0+qk2XuKyXES25ZWUVfe9hjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM7PR04MB6838.eurprd04.prod.outlook.com (2603:10a6:20b:10a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Tue, 3 Feb
 2026 17:07:09 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Tue, 3 Feb 2026
 17:07:09 +0000
Date: Tue, 3 Feb 2026 12:06:58 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
	daniel.baluta@nxp.com, dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com, Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com, y.moog@phytec.de,
	josua@solid-run.com, francesco.dolcini@toradex.com,
	primoz.fiser@norik.com, imx@lists.linux.dev, kernel@pengutronix.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V5 3/5] arm64: dts: imx93: Move 11x11 EVK specific parts
 back to imx93-11x11-evk.dts
Message-ID: <aYIrMqZ5yBfmy2AZ@lizhi-Precision-Tower-5810>
References: <20260203080137.1492376-1-sherry.sun@nxp.com>
 <20260203080137.1492376-4-sherry.sun@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203080137.1492376-4-sherry.sun@nxp.com>
X-ClientProxiedBy: SJ0PR13CA0209.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::34) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM7PR04MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b4af84d-21d6-45e6-2459-08de6346aa0d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|52116014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?icTbOOc9pkYwvGe2js8ReoMAcfOX+jqVzV3GdldT2UtnxpU/BmqAM0vm4pgN?=
 =?us-ascii?Q?W03Hjvdmg0SfgMUhExtj7TVTZcTGC2SIujXwsCTILnVncpAnCCCCFc69tcpB?=
 =?us-ascii?Q?zQwDS2EHa4kDp8HPEii1CyfiITTVFbUbprv2rOOLtdAYGc8nFbUZryJ3ZQoj?=
 =?us-ascii?Q?X6Q2nwY2X0vY74dD7wN7YaMFhk8ebu1s649jXMR5PYn3yWVuvm9ZNMYtNl/O?=
 =?us-ascii?Q?PQQxKMCeKDusxKgUZbBeYWqA7PQ0ZnblJv5Irea23/2LiGjMHoJhWvbrYr3k?=
 =?us-ascii?Q?HUbUac6JDf4YxUiXBG35C5XO3hbnECQJG6qQIxYR8AZJ/+8IEUih5JIfAS7W?=
 =?us-ascii?Q?AclCOaKBmc8u8eqVPLMyEC//phZwmIXjAu2LdGaqL5XCOSwAkuNqQMUVji9x?=
 =?us-ascii?Q?j34OMKyWytxv0y9WVAmp3hEV5dtHQSoS1ZPe6PE+anz8tYQNVPKFxOP1nC7i?=
 =?us-ascii?Q?w3nEmWWHfwNOqPyXCMbGH7xNt4kpH0Spdm1tF/JWMxssvR8nqhrT7aXzKYsW?=
 =?us-ascii?Q?KFB0Z1EFSugoIJph1EmEm8nt4SvOKXqwXO6Jjs9Gt6G2Feorusa/dYyukdrn?=
 =?us-ascii?Q?gb4B/r+RnlrutNWhVrTL2cVBTmKHLbG9+VaNIhdDhpXAt3f5CX0wK4GDKPff?=
 =?us-ascii?Q?p5HcF/J2oRKFE7S/XFUwgOPnKCRfHNvMF0myMWFAEJX0V4jVwWPr0j9lEaxL?=
 =?us-ascii?Q?dwrbEptLk6j+piQAHEdh3txSwiahM1Vtpntb2FNlXaSfIggyddBlQvbLnOYp?=
 =?us-ascii?Q?aV55oij+BqycJ796EguzkmbZN2I134gjy6iu4jlKTmnhzc2Fe4jbwYvXKhM0?=
 =?us-ascii?Q?ujLmRItztmJilKJ6DEtJ5kolaOiOe7LcVbTMwlJy+kA0IEr0el9Y3Qe086eK?=
 =?us-ascii?Q?HWHn3zqpo+citjNj9H9M8LUj5Vcu427t+TU88t6Hm5qRFf1br3pKAkrsOd67?=
 =?us-ascii?Q?JQmURf65FuRFeNMhlyPyPzbhbKJPWQlI3RECDm0U8sFlV4vf2pop5PpHpwCm?=
 =?us-ascii?Q?58aXBvbhfHSH5Mk6WGPJCWpBBZLh/og7wNFwBsdshUSOGp7M3ODE0N7cHABP?=
 =?us-ascii?Q?AT6lVLyHwJGn1WzABskNjapc23dR8pf0s7a8feHUv6tTWqByuW88P+qc4PpA?=
 =?us-ascii?Q?VWUneI3EajZN4/JcpoawuPBJjg25cwWqfj4mvMzvIZe4duAuASga+9r/gnDr?=
 =?us-ascii?Q?jjaZ9jBZZhRC/GhYT48B0dF7694MKOgSq8hRXZ01l17C8W2Df4wajKYMVV1A?=
 =?us-ascii?Q?wq+p4EEw66rD9qxC1KOXEE52WoCBJwF3CgHVip4EPbYlfgRuPUrNFzk5a9zJ?=
 =?us-ascii?Q?2vi36eoaRsNpP322f5qrxa7yQdp1uE/UePS07pPaVxjaVLaYn3Rus/phD17c?=
 =?us-ascii?Q?gmcfwTe7NLjw06DXy/2M04akFoMovHva5lng09yRgEaIUSk+qNwUCrJy9ZH3?=
 =?us-ascii?Q?mvs1djWONulPuMfTvjIsUnoGq7sEIhbz2YLXU9VWNQnI0snMGC977WYIgnPK?=
 =?us-ascii?Q?PLnhQDpT66WnGr4cOuhTINmkgk0qmgeJ0ZNyu5hqRTxn2q9qnaBA2KMHK2Jr?=
 =?us-ascii?Q?SrIJOjKmAtbwHx3frS8qpr/lfHV7GH1eF/Lb9D/lY/tR8O3epPK+lNquEclz?=
 =?us-ascii?Q?qED0bJybAVkuiK/sdbeVF/I=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?VLuzt9FT2eXivBbNnyojHT51lf3QQQDfDqxG6a/Qnr1VaEf8zf/i4C3AHlRW?=
 =?us-ascii?Q?k80El7CctlykQwQ5bIYuTEutuZl5rR8tQz9hWvuGosercliEsanaUwfQVGiH?=
 =?us-ascii?Q?xnnn/BHHaaLjTAPSysuQ61o6ozvatKxL/OR/hSYeCo/EgBtHNhF9RIpgMj98?=
 =?us-ascii?Q?a2pYLOOOFbyEko6K9d8Or8cZ13kxRUmb5gqARMZESa1pv6QfnivlNENbBnoO?=
 =?us-ascii?Q?Gbe0AG/Zfu1aXuD7pq6eBmB9y/tfx+47j1gXi91sq4/gOcrhw6Ghf3emSf9V?=
 =?us-ascii?Q?vsG6I3ENXtu+AsJifxeEcRMRh4SQ6+9pjXLr9hWTj768G5zDi/EpsFmjR4tT?=
 =?us-ascii?Q?77wzFHQM5zQdkx5m4pGfHEvXU6VzDUW1GPluxmBtxxfFktCOH+ZAuA34FQ8i?=
 =?us-ascii?Q?NMjB3XSaU454B8YrBYED3r9Opo6iHrjtYhYxKs45EsCAg55oHct7eLfdSRk8?=
 =?us-ascii?Q?Rr45w+af99FHEcCciTxDAUhmcxW40aQuzu83C+hbID02SIr65EFK4ZHPu7Gy?=
 =?us-ascii?Q?Jmh86Fb4eQAzebg1Cj/vONSW7V2R5nZXH3zKudoKhHQigKfX7XWMOqiliTYt?=
 =?us-ascii?Q?/seHLZEwdi+ZRnVo2rQ5SaP0Ek3ZwtS16D15nTbx9H9w9x1xVbclrke7337M?=
 =?us-ascii?Q?dbXfbnZaaVGE8+02jQUILqRmFbvGJXsrt95c1Mv4iQHBDpFVp6XloDzEPwEo?=
 =?us-ascii?Q?pGmIq3GeuPmcnHbCEVO72zJ+AaL4X4HrT/33VzCcnR1ug3reyWK3HJqIavLH?=
 =?us-ascii?Q?TetDkpVxlARmC97Qq7BN3crewhTa1Q6dSVHKqkdviQg3ONC5ClzbAM8cM/ei?=
 =?us-ascii?Q?qpNS0S2xu4M6rwqdoq3siK93oQ0zdCkLaW2Pm9S2FE5c1aNmUYMQtlANOm7f?=
 =?us-ascii?Q?Rvv/ah2aOdnOfXdkYFoC6E+wd2pRZfN2ZWvYYapvhe7P8G+i8WchYhqEDxjt?=
 =?us-ascii?Q?gV1t9C0ww8NNVFJIBeF+zzfFcSVijPH/KWSjFg98ybJN3GZWVhuihxlMVrZX?=
 =?us-ascii?Q?S4zpZlSah/SgolZH3cyS6/YDBUP7cWnmLX6pGH1vQXcrjYahV2TWBzh90j+I?=
 =?us-ascii?Q?L7VViCTf8tZe0nL6JeGibIZZB4U946kU/gJdsxxX2yrssUqpfh7cs89xzw9f?=
 =?us-ascii?Q?xm6ygaCmiGhoJg3iRWUs5y+PYIGXPR6ojEFDUxdZTSjWpr6WN6P+B+UZsjcJ?=
 =?us-ascii?Q?Zl4fTM8yygt/h+/zifpXgEGsyQypTRCJqlLgSYSBJ6XeifMdlYPZ4s90T+Wd?=
 =?us-ascii?Q?+KPUy+KaGs+K/+SruSz2lUH1tIch26pvYjKyXylyKPPcHFmxe23zVQyoAIcw?=
 =?us-ascii?Q?Z+siPn+V6udP5RTNVv06r4XcTuzj/ci2Y5rRkYuowlDxDg/Y2jLDExB2bI1l?=
 =?us-ascii?Q?1Iu8QkxE6J0jbY1NtZbL7ZYxuZqHLDIeXGnsuwN68tnk/pFs8aKGzmCuy9O0?=
 =?us-ascii?Q?GVu9DURld5SgrK+8/FH0Pi1H8CIhQzVVgzsDKL4uPvyb8PoE7ihP8GDxAmHr?=
 =?us-ascii?Q?aLlpC1UgOGTWsZ294xLGgdqT5YS/1YnCJ8UqJ0LFjnCQTfvz5Ahrme3YvxQ9?=
 =?us-ascii?Q?qFQWHKCNIedtM2QE2Gt1MMhNymRStXaEZAjtPyQ6NOL0KOpSxO5QGiTiKPAU?=
 =?us-ascii?Q?2PZNqKDt+3Xux+WfJQOjiy6WQPFiVkfrWk8Tyodrwpk7TGOxtjWu1PpWI1ch?=
 =?us-ascii?Q?P6cFLwUOGATimt4dCcf21UBuog4cxhJwy79YgyP3RS7/2v3X?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b4af84d-21d6-45e6-2459-08de6346aa0d
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2026 17:07:09.0078
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yF97hSJvih2XA1MlREMIuKFec/r23I1O7qkwkVBR8CY54PgPGcByN18ieZo8Yn75pYF2cWNNS5whTB0zieEwAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6838

On Tue, Feb 03, 2026 at 04:01:35PM +0800, Sherry Sun wrote:
> The previous patch renamed imx93-11x11-evk.dts to imx93-evk-common.dtsi
> to prepare for adding the i.MX93 Wireless EVK, which shares most of its
> design with the 11x11 EVK.
>
> This patch moves the board specific differences out of

Move ....

Frank

> imx93-evk-common.dtsi and back into imx93-11x11-evk.dts, ensuring that
> the common dtsi only contains the truly shared parts between the two EVK
> boards.
>
> No functional changes intended.
>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
>  .../boot/dts/freescale/imx93-11x11-evk.dts    | 206 ++++++++++++++++++
>  .../boot/dts/freescale/imx93-evk-common.dtsi  | 198 -----------------
>  2 files changed, 206 insertions(+), 198 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> index cca923f4ac7a..6b6d06c70af1 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> @@ -11,4 +11,210 @@
>  / {
>  	model = "NXP i.MX93 11X11 EVK board";
>  	compatible = "fsl,imx93-11x11-evk", "fsl,imx93";
> +
> +	aliases {
> +		mmc2 = &usdhc3;
> +	};
> +
> +	reg_m2_pwr: regulator-m2-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "M.2-power";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&pcal6524 13 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reg_usdhc3_vmmc: regulator-usdhc3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "WLAN_EN";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&reg_m2_pwr>;
> +		gpio = <&pcal6524 20 GPIO_ACTIVE_HIGH>;
> +		/*
> +		 * IW612 wifi chip needs more delay than other wifi chips to complete
> +		 * the host interface initialization after power up, otherwise the
> +		 * internal state of IW612 may be unstable, resulting in the failure of
> +		 * the SDIO3.0 switch voltage.
> +		 */
> +		startup-delay-us = <20000>;
> +		enable-active-high;
> +	};
> +
> +	usdhc3_pwrseq: usdhc3_pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&pcal6524 12 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	bt_sco_codec: bt-sco-codec {
> +		compatible = "linux,bt-sco";
> +		#sound-dai-cells = <1>;
> +	};
> +
> +	sound-bt-sco {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,name = "bt-sco-audio";
> +		simple-audio-card,format = "dsp_a";
> +		simple-audio-card,bitclock-inversion;
> +		simple-audio-card,frame-master = <&btcpu>;
> +		simple-audio-card,bitclock-master = <&btcpu>;
> +
> +		btcpu: simple-audio-card,cpu {
> +			sound-dai = <&sai1>;
> +			dai-tdm-slot-num = <2>;
> +			dai-tdm-slot-width = <16>;
> +		};
> +
> +		simple-audio-card,codec {
> +			sound-dai = <&bt_sco_codec 1>;
> +		};
> +	};
> +
> +	sound-micfil {
> +		compatible = "fsl,imx-audio-card";
> +		model = "micfil-audio";
> +
> +		pri-dai-link {
> +			link-name = "micfil hifi";
> +			format = "i2s";
> +
> +			cpu {
> +				sound-dai = <&micfil>;
> +			};
> +		};
> +	};
> +};
> +
> +&micfil {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&pinctrl_pdm>;
> +	pinctrl-1 = <&pinctrl_pdm_sleep>;
> +	assigned-clocks = <&clk IMX93_CLK_PDM>;
> +	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
> +	assigned-clock-rates = <49152000>;
> +	status = "okay";
> +};
> +
> +&pcal6524 {
> +	m2-pcm-level-shifter-hog {
> +		gpio-hog;
> +		gpios = <19 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +	};
> +};
> +
> +&sai1 {
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&pinctrl_sai1>;
> +	pinctrl-1 = <&pinctrl_sai1_sleep>;
> +	assigned-clocks = <&clk IMX93_CLK_SAI1>;
> +	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
> +	assigned-clock-rates = <12288000>;
> +	fsl,sai-mclk-direction-output;
> +	status = "okay";
> +};
> +
> +&usdhc3 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> +	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_usdhc3_wlan>;
> +	pinctrl-1 = <&pinctrl_usdhc3_100mhz>, <&pinctrl_usdhc3_wlan>;
> +	pinctrl-2 = <&pinctrl_usdhc3_200mhz>, <&pinctrl_usdhc3_wlan>;
> +	pinctrl-3 = <&pinctrl_usdhc3_sleep>, <&pinctrl_usdhc3_wlan>;
> +	mmc-pwrseq = <&usdhc3_pwrseq>;
> +	vmmc-supply = <&reg_usdhc3_vmmc>;
> +	bus-width = <4>;
> +	keep-power-in-suspend;
> +	non-removable;
> +	wakeup-source;
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl_pdm: pdmgrp {
> +		fsl,pins = <
> +			MX93_PAD_PDM_CLK__PDM_CLK			0x31e
> +			MX93_PAD_PDM_BIT_STREAM0__PDM_BIT_STREAM00	0x31e
> +			MX93_PAD_PDM_BIT_STREAM1__PDM_BIT_STREAM01	0x31e
> +		>;
> +	};
> +
> +	pinctrl_pdm_sleep: pdmsleepgrp {
> +		fsl,pins = <
> +			MX93_PAD_PDM_CLK__GPIO1_IO08			0x31e
> +			MX93_PAD_PDM_BIT_STREAM0__GPIO1_IO09		0x31e
> +			MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10		0x31e
> +		>;
> +	};
> +
> +	pinctrl_sai1: sai1grp {
> +		fsl,pins = <
> +			MX93_PAD_SAI1_TXC__SAI1_TX_BCLK			0x31e
> +			MX93_PAD_SAI1_TXFS__SAI1_TX_SYNC		0x31e
> +			MX93_PAD_SAI1_TXD0__SAI1_TX_DATA00		0x31e
> +			MX93_PAD_SAI1_RXD0__SAI1_RX_DATA00		0x31e
> +		>;
> +	};
> +
> +	pinctrl_sai1_sleep: sai1sleepgrp {
> +		fsl,pins = <
> +			MX93_PAD_SAI1_TXC__GPIO1_IO12                   0x51e
> +			MX93_PAD_SAI1_TXFS__GPIO1_IO11			0x51e
> +			MX93_PAD_SAI1_TXD0__GPIO1_IO13			0x51e
> +			MX93_PAD_SAI1_RXD0__GPIO1_IO14			0x51e
> +		>;
> +	};
> +
> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> +	pinctrl_usdhc3: usdhc3grp {
> +		fsl,pins = <
> +			MX93_PAD_SD3_CLK__USDHC3_CLK		0x1582
> +			MX93_PAD_SD3_CMD__USDHC3_CMD		0x40001382
> +			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x40001382
> +			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x40001382
> +			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x40001382
> +			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x40001382
> +		>;
> +	};
> +
> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> +	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> +		fsl,pins = <
> +			MX93_PAD_SD3_CLK__USDHC3_CLK		0x158e
> +			MX93_PAD_SD3_CMD__USDHC3_CMD		0x4000138e
> +			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x4000138e
> +			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x4000138e
> +			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x4000138e
> +			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x4000138e
> +		>;
> +	};
> +
> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> +	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> +		fsl,pins = <
> +			MX93_PAD_SD3_CLK__USDHC3_CLK		0x15fe
> +			MX93_PAD_SD3_CMD__USDHC3_CMD		0x400013fe
> +			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x400013fe
> +			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x400013fe
> +			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x400013fe
> +			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x400013fe
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_sleep: usdhc3grpsleepgrp {
> +		fsl,pins = <
> +			MX93_PAD_SD3_CLK__GPIO3_IO20		0x31e
> +			MX93_PAD_SD3_CMD__GPIO3_IO21		0x31e
> +			MX93_PAD_SD3_DATA0__GPIO3_IO22		0x31e
> +			MX93_PAD_SD3_DATA1__GPIO3_IO23		0x31e
> +			MX93_PAD_SD3_DATA2__GPIO3_IO24		0x31e
> +			MX93_PAD_SD3_DATA3__GPIO3_IO25		0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_wlan: usdhc3wlangrp {
> +		fsl,pins = <
> +			MX93_PAD_CCM_CLKO1__GPIO3_IO26		0x31e
> +		>;
> +	};
>  };
> diff --git a/arch/arm64/boot/dts/freescale/imx93-evk-common.dtsi b/arch/arm64/boot/dts/freescale/imx93-evk-common.dtsi
> index 6279b8eb4ea7..301e9f05122e 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-evk-common.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx93-evk-common.dtsi
> @@ -107,15 +107,6 @@ reg_audio_pwr: regulator-audio-pwr {
>  		enable-active-high;
>  	};
>
> -	reg_m2_pwr: regulator-m2-pwr {
> -		compatible = "regulator-fixed";
> -		regulator-name = "M.2-power";
> -		regulator-min-microvolt = <3300000>;
> -		regulator-max-microvolt = <3300000>;
> -		gpio = <&pcal6524 13 GPIO_ACTIVE_HIGH>;
> -		enable-active-high;
> -	};
> -
>  	reg_usdhc2_vmmc: regulator-usdhc2 {
>  		compatible = "regulator-fixed";
>  		pinctrl-names = "default";
> @@ -128,28 +119,6 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
>  		enable-active-high;
>  	};
>
> -	reg_usdhc3_vmmc: regulator-usdhc3 {
> -		compatible = "regulator-fixed";
> -		regulator-name = "WLAN_EN";
> -		regulator-min-microvolt = <3300000>;
> -		regulator-max-microvolt = <3300000>;
> -		vin-supply = <&reg_m2_pwr>;
> -		gpio = <&pcal6524 20 GPIO_ACTIVE_HIGH>;
> -		/*
> -		 * IW612 wifi chip needs more delay than other wifi chips to complete
> -		 * the host interface initialization after power up, otherwise the
> -		 * internal state of IW612 may be unstable, resulting in the failure of
> -		 * the SDIO3.0 switch voltage.
> -		 */
> -		startup-delay-us = <20000>;
> -		enable-active-high;
> -	};
> -
> -	usdhc3_pwrseq: usdhc3_pwrseq {
> -		compatible = "mmc-pwrseq-simple";
> -		reset-gpios = <&pcal6524 12 GPIO_ACTIVE_LOW>;
> -	};
> -
>  	backlight_lvds: backlight-lvds {
>  		compatible = "pwm-backlight";
>  		pwms = <&adp5585 0 100000 0>;
> @@ -161,44 +130,6 @@ backlight_lvds: backlight-lvds {
>  		status = "disabled";
>  	};
>
> -	bt_sco_codec: bt-sco-codec {
> -		compatible = "linux,bt-sco";
> -		#sound-dai-cells = <1>;
> -	};
> -
> -	sound-bt-sco {
> -		compatible = "simple-audio-card";
> -		simple-audio-card,name = "bt-sco-audio";
> -		simple-audio-card,format = "dsp_a";
> -		simple-audio-card,bitclock-inversion;
> -		simple-audio-card,frame-master = <&btcpu>;
> -		simple-audio-card,bitclock-master = <&btcpu>;
> -
> -		btcpu: simple-audio-card,cpu {
> -			sound-dai = <&sai1>;
> -			dai-tdm-slot-num = <2>;
> -			dai-tdm-slot-width = <16>;
> -		};
> -
> -		simple-audio-card,codec {
> -			sound-dai = <&bt_sco_codec 1>;
> -		};
> -	};
> -
> -	sound-micfil {
> -		compatible = "fsl,imx-audio-card";
> -		model = "micfil-audio";
> -
> -		pri-dai-link {
> -			link-name = "micfil hifi";
> -			format = "i2s";
> -
> -			cpu {
> -				sound-dai = <&micfil>;
> -			};
> -		};
> -	};
> -
>  	sound-wm8962 {
>  		compatible = "fsl,imx-audio-wm8962";
>  		model = "wm8962-audio";
> @@ -350,12 +281,6 @@ pcal6524: gpio@22 {
>  		#interrupt-cells = <2>;
>  		interrupt-parent = <&gpio3>;
>  		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> -
> -		m2-pcm-level-shifter-hog {
> -			gpio-hog;
> -			gpios = <19 GPIO_ACTIVE_HIGH>;
> -			output-high;
> -		};
>  	};
>
>  	pmic@25 {
> @@ -548,16 +473,6 @@ bluetooth {
>  	};
>  };
>
> -&micfil {
> -	pinctrl-names = "default", "sleep";
> -	pinctrl-0 = <&pinctrl_pdm>;
> -	pinctrl-1 = <&pinctrl_pdm_sleep>;
> -	assigned-clocks = <&clk IMX93_CLK_PDM>;
> -	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
> -	assigned-clock-rates = <49152000>;
> -	status = "okay";
> -};
> -
>  &mu1 {
>  	status = "okay";
>  };
> @@ -566,17 +481,6 @@ &mu2 {
>  	status = "okay";
>  };
>
> -&sai1 {
> -	pinctrl-names = "default", "sleep";
> -	pinctrl-0 = <&pinctrl_sai1>;
> -	pinctrl-1 = <&pinctrl_sai1_sleep>;
> -	assigned-clocks = <&clk IMX93_CLK_SAI1>;
> -	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
> -	assigned-clock-rates = <12288000>;
> -	fsl,sai-mclk-direction-output;
> -	status = "okay";
> -};
> -
>  &sai3 {
>  	pinctrl-names = "default", "sleep";
>  	pinctrl-0 = <&pinctrl_sai3>;
> @@ -647,21 +551,6 @@ &usdhc2 {
>  	no-mmc;
>  };
>
> -&usdhc3 {
> -	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> -	pinctrl-0 = <&pinctrl_usdhc3>, <&pinctrl_usdhc3_wlan>;
> -	pinctrl-1 = <&pinctrl_usdhc3_100mhz>, <&pinctrl_usdhc3_wlan>;
> -	pinctrl-2 = <&pinctrl_usdhc3_200mhz>, <&pinctrl_usdhc3_wlan>;
> -	pinctrl-3 = <&pinctrl_usdhc3_sleep>, <&pinctrl_usdhc3_wlan>;
> -	mmc-pwrseq = <&usdhc3_pwrseq>;
> -	vmmc-supply = <&reg_usdhc3_vmmc>;
> -	bus-width = <4>;
> -	keep-power-in-suspend;
> -	non-removable;
> -	wakeup-source;
> -	status = "okay";
> -};
> -
>  &wdog3 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_wdog>;
> @@ -808,40 +697,6 @@ MX93_PAD_CCM_CLKO2__GPIO3_IO27			0x31e
>  		>;
>  	};
>
> -	pinctrl_pdm: pdmgrp {
> -		fsl,pins = <
> -			MX93_PAD_PDM_CLK__PDM_CLK			0x31e
> -			MX93_PAD_PDM_BIT_STREAM0__PDM_BIT_STREAM00	0x31e
> -			MX93_PAD_PDM_BIT_STREAM1__PDM_BIT_STREAM01	0x31e
> -		>;
> -	};
> -
> -	pinctrl_pdm_sleep: pdmsleepgrp {
> -		fsl,pins = <
> -			MX93_PAD_PDM_CLK__GPIO1_IO08			0x31e
> -			MX93_PAD_PDM_BIT_STREAM0__GPIO1_IO09		0x31e
> -			MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10		0x31e
> -		>;
> -	};
> -
> -	pinctrl_sai1: sai1grp {
> -		fsl,pins = <
> -			MX93_PAD_SAI1_TXC__SAI1_TX_BCLK			0x31e
> -			MX93_PAD_SAI1_TXFS__SAI1_TX_SYNC		0x31e
> -			MX93_PAD_SAI1_TXD0__SAI1_TX_DATA00		0x31e
> -			MX93_PAD_SAI1_RXD0__SAI1_RX_DATA00		0x31e
> -		>;
> -	};
> -
> -	pinctrl_sai1_sleep: sai1sleepgrp {
> -		fsl,pins = <
> -			MX93_PAD_SAI1_TXC__GPIO1_IO12                   0x51e
> -			MX93_PAD_SAI1_TXFS__GPIO1_IO11			0x51e
> -			MX93_PAD_SAI1_TXD0__GPIO1_IO13			0x51e
> -			MX93_PAD_SAI1_RXD0__GPIO1_IO14			0x51e
> -		>;
> -	};
> -
>  	/* need to config the SION for data and cmd pad, refer to ERR052021 */
>  	pinctrl_usdhc1: usdhc1grp {
>  		fsl,pins = <
> @@ -996,59 +851,6 @@ MX93_PAD_SD2_VSELECT__GPIO3_IO19	0x51e
>  		>;
>  	};
>
> -	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> -	pinctrl_usdhc3: usdhc3grp {
> -		fsl,pins = <
> -			MX93_PAD_SD3_CLK__USDHC3_CLK		0x1582
> -			MX93_PAD_SD3_CMD__USDHC3_CMD		0x40001382
> -			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x40001382
> -			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x40001382
> -			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x40001382
> -			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x40001382
> -		>;
> -	};
> -
> -	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> -	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD3_CLK__USDHC3_CLK		0x158e
> -			MX93_PAD_SD3_CMD__USDHC3_CMD		0x4000138e
> -			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x4000138e
> -			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x4000138e
> -			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x4000138e
> -			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x4000138e
> -		>;
> -	};
> -
> -	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> -	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD3_CLK__USDHC3_CLK		0x15fe
> -			MX93_PAD_SD3_CMD__USDHC3_CMD		0x400013fe
> -			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x400013fe
> -			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x400013fe
> -			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x400013fe
> -			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x400013fe
> -		>;
> -	};
> -
> -	pinctrl_usdhc3_sleep: usdhc3grpsleepgrp {
> -		fsl,pins = <
> -			MX93_PAD_SD3_CLK__GPIO3_IO20		0x31e
> -			MX93_PAD_SD3_CMD__GPIO3_IO21		0x31e
> -			MX93_PAD_SD3_DATA0__GPIO3_IO22		0x31e
> -			MX93_PAD_SD3_DATA1__GPIO3_IO23		0x31e
> -			MX93_PAD_SD3_DATA2__GPIO3_IO24		0x31e
> -			MX93_PAD_SD3_DATA3__GPIO3_IO25		0x31e
> -		>;
> -	};
> -
> -	pinctrl_usdhc3_wlan: usdhc3wlangrp {
> -		fsl,pins = <
> -			MX93_PAD_CCM_CLKO1__GPIO3_IO26		0x31e
> -		>;
> -	};
> -
>  	pinctrl_wdog: wdoggrp {
>  		fsl,pins = <
>  			MX93_PAD_WDOG_ANY__WDOG1_WDOG_ANY	0x31e
> --
> 2.37.1
>
