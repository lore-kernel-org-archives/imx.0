Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010022.outbound.protection.outlook.com [52.101.69.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5415830F94E
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 17:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769620454; cv=fail; b=hROUNtZ1qXHOPf5n+6H56jIayZxZ11cwdeEC/4Vrqua8F4JT3g2Qp+Sb/PtMS2y6M8Z3op+i64MFWzk7nEb0QKbxxGMrwWY/nNLHi/PeTWRb8I0JuhVLCV1B/hj6VyXSkN2RM6XD7V1MMU5kvU0TauLHWatT+yIn3Fpl/ztOMzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769620454; c=relaxed/simple;
	bh=X1q2PPJOs6dPc5Q4Vf2GLPBLmpMN6aRAvJohVDHNddg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TQ20ER53FMzhE+DW5xju9j9a0VW1MsE9dgRs9kL7Wwvmhn3nwLZa+8JsVUrkIwCSSTv2BsI2fp5xl/4CsDyOzcJhMyZ0neCN99ioUbR9MUzTl3kHkx8G4CIUNNE7lKzDQJ5Ag3wrmq2zlT90Ffja/fPHlK5fr8+aqH7sANhULUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CsyKR4jQ; arc=fail smtp.client-ip=52.101.69.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CsyKR4jQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JAXupyc7nfzLsVcaMXC4KBRtiEhq3IBGU06kgBJIWTWum9DU7asf0EdGn0yCLne3HFdSTSW3fs07f7hS3Lclu6yUpoxjIQrFmqtBItPNHUGpEC0NF7DLRY1E31Hb8lv6UYaWZG3nwToltldzIkPtV3Cl5/vsolx+L1iO8/MvqegKwrkAHzmUiG2HS2RJ7qD6ncxEseYukPdOUHif/gSE0D9oPYr6NppiT4U7P3OE0nmO/UZgfXnMsmOTsRmhKl3yaQnRd2AAu7fcWHlBk6mubi7ARS0nKIMw5GMRMEWIIh/MAtMJz06A3vzvz9MwuFQ6q9HJQC1S0rMa0TpehfH1Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpiqqFtqm1e0+JHpiwx2Og4KnvejCTDM3o63QGfnzL4=;
 b=WIAwlEURQPm6DJaVx6yekQ4PiFngOLBZaTMNamAFXI2YRJzzBrGmsnLEKoNEHfUyzJPbmsrcY/HbedD4ubN0Phe+3pu3hxWg/wP3K/o8NdcTS5UVg1w5OfLdFb0Hgmt0Q0XuQnNEI0fCDS4tdSS/XTkERcZfqNZ118i0OVDshQQVtHXlD9dQhLe12LqmYbgwk7mbWu2UMX3S4u+/rdIsLDTej9ChZkmazRDZpE8mTfVFc2XJ18/fmhT7YyF3ohBFHeQtS39CkyLIekilwkcC4x0pF8i8k6/9FHpXgMaFKheGGABlzPbxA9EFsopvjCxWpKrkCi9Y8Oq8Qn05/HdW9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UpiqqFtqm1e0+JHpiwx2Og4KnvejCTDM3o63QGfnzL4=;
 b=CsyKR4jQwHncot30ZVuuL/qk+zRctjMtQOytUMN+vDtiBqCkmBh1etfIkc0f0dYLyoLTvdS8ZLKnYeMLcu+QsWRRTCjPpkpdBH8v1Z44UVWX9qfBk1xOiJvkMJ6UYPVHGxgfhjKCa0GDKM5ymCKJgykaavegjorW1kK085gwsXgy5H2OBnvtZT2Nxn3uQ2xGz1xQrGouaczcvfTyR0Zu0l53MGvD8GvQR9pBV+crFlACFp9pHyHIv7LS3sy6IgXO4RHg2wTAYzw8EhpVtnBTjaiMGQ5601rclgx7Wk8cTF2V3e5jN4v00d4xnIZN37rUNYugMmqbsznkvGjmZpx/Gg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by MRWPR04MB12277.eurprd04.prod.outlook.com (2603:10a6:501:81::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 17:14:08 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9520.005; Wed, 28 Jan 2026
 17:14:08 +0000
Date: Wed, 28 Jan 2026 12:13:59 -0500
From: Frank Li <Frank.li@nxp.com>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 3/8] arm64: dts: imx8mp-hummingboard-pulse: fix
 mini-hdmi dsi port reference
Message-ID: <aXpD13sHZYoXGQY7@lizhi-Precision-Tower-5810>
References: <20260128-imx8mp-hb-iiot-v8-0-9646a3025cf4@solid-run.com>
 <20260128-imx8mp-hb-iiot-v8-3-9646a3025cf4@solid-run.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260128-imx8mp-hb-iiot-v8-3-9646a3025cf4@solid-run.com>
X-ClientProxiedBy: PH7P221CA0031.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:33c::26) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|MRWPR04MB12277:EE_
X-MS-Office365-Filtering-Correlation-Id: 43cb7004-daea-460a-ba36-08de5e90a5c2
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|366016|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?xx2qham31sFu8R2LaYfQX35ZmXfbcS+LQ/Yxdfy49E1d31JcWOPy8DKH8JM0?=
 =?us-ascii?Q?1YFy7+Y1s/zuijq0BDZCbwlh5Doe/AqT6dXxDJiFN2ErqYPaygI5opMPxvPh?=
 =?us-ascii?Q?SEd9zpU+qGwoIvSztcsrYgSs3V96sSdPoBVpUHGTmr6bwUQdwi8VU7Pf+bCw?=
 =?us-ascii?Q?hgGkFL6pJ59F2aPu1R7VoEzs2AtDAZIKS3Y311ZKLDnP2+DkHQflJcX32UEl?=
 =?us-ascii?Q?9Nh3pUGprALjXarLtyOkL2kG0+lj9fCSV93mm8xkSDbaLymBtd3rkgPyZ3dI?=
 =?us-ascii?Q?u9hlnaUdBzKBC3bJPBwzTdIO9Q97U4sK/CTvUWfMLGt0w2bMiei3kQMGqGYL?=
 =?us-ascii?Q?Q7/L6oAQD6ltzV0jQCFuiceNP84kPwSgnRujQHKe9Uw2CyXf9uKLytkF8xNV?=
 =?us-ascii?Q?3uRLn0qTbn9NsWf8tVng36pxNS4UzvlLaFaiFKGGoHxizr7cvBr/+bavW2FE?=
 =?us-ascii?Q?3Bx+paYPJekbosl2Rrzj2mFsG32jShb0pRLZ36Z39POua62meAEvuuZrVCPC?=
 =?us-ascii?Q?F4dNFTctCoXGrRMFeCdLeEeUz4HYLh1TowVHmiI2q8A1EZm0dbvs9dZhBWRP?=
 =?us-ascii?Q?ZaCBDowXGPvYJ72BWuPu5ETdMLUz/S8/Ydk8TwveLCwgqg4BwnPDm+I5zfRC?=
 =?us-ascii?Q?1yr57qJcnB0J6UnYXsuD1atee7NCgHwx3RsOxF/7Ff2rxy6E/rgXXBvq3ODU?=
 =?us-ascii?Q?S/KSGrZpweHmitRgelu7jyswcytdUmkE9cPNQriuw1aAlSY+N69h+AMx+lXG?=
 =?us-ascii?Q?hotuJNUGChBjXXPKXSaZG8lR7ZqEfRuwDPR8sCZVzP2rogoF8ztM8azCxUpQ?=
 =?us-ascii?Q?kObpZu1AGIKhXy9uJlsI7jms3cRkOHmb4QQxnXUlzh09VsvnVPUGL2MoXJCF?=
 =?us-ascii?Q?rf+iO5cCj0TveEOANQ4oL8/8HkRjjs7gzpDWJCTG8mzMGfNK33UvFWrNxtnT?=
 =?us-ascii?Q?CMci/u8Zu4KKPVGVJAvAC5EHx47jPyQICkjvbckud39juOocP9kR8JL9baGz?=
 =?us-ascii?Q?JpxW8O2k69Pxe26sxTTXpx2gbgHQguxf3ZtZKdH1jdtjCFU0YqYkOiQrcvcg?=
 =?us-ascii?Q?abwn9iLnZFYpOVz1+7Q153IuJNR0S0DibylgGTyL3rzTx1hys+wTs9HFu1Dp?=
 =?us-ascii?Q?4E9fQZZVSDhIYBLPDr4Tb7SVqDRXP8e8hfQvkx8dvgPw9RO+5qghjqHqyLnw?=
 =?us-ascii?Q?eOVoYtlZs2e/8v/JhkwfofuNlc75aPgQ1Kf6o9ix5ab2l1qdMg6HxgC6qeVz?=
 =?us-ascii?Q?yUFeOjvjwPIRwCVYS86CeAcmpSPMw2S8+UfWmFAi4wR7Zo8bO0yvdxpO9rJP?=
 =?us-ascii?Q?Tcx0MMbYTLVs3CN9g3HA1y3PmEYcgf6xxy3l+zzHm3tMludzP7IpSUth2w/K?=
 =?us-ascii?Q?PfzneY/8OFB+udLL12h+2zRgBnURDDNSzHSYxDYB9fo1zhWFm/rKCAeulkkm?=
 =?us-ascii?Q?2Ky/QjxW+Mgg95Wkfqz1pbnMpDhiqIUZn9TiawMe7X25pa6kCUg9vEhgB5rK?=
 =?us-ascii?Q?HbGKjhrarYqkhXfxEgmxWB/+/YQUw8QScqZkfj6AL3LUFYPgoLjfh/NC+uh5?=
 =?us-ascii?Q?y5ryVAOlCRnwqgsflv9EmoNrtvowOfZ7QxBS1yssYbPx2B5zilgkqwmZcl3p?=
 =?us-ascii?Q?AETEVSLHiSkFQXZwITbwsmk=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?qtThje21PMdqWs8uXWqiP79cHY5K5yYngJkLBFzkYQZl+JcYEC8JLtK5E2xT?=
 =?us-ascii?Q?2oiknRHHoRSpsErrT5V/cDRMf5fvil7rwi/5daC6MpnIvp4duPsAF+EyuzeX?=
 =?us-ascii?Q?XHZVhwIbFXG09GvhtBk2WQRhMwx2aa1WU3RgWU0+bGuSnT28PREW4MeS2qgJ?=
 =?us-ascii?Q?S8pSWbfBjpyQ0+RaouoON7+ecSCDEMja7feoUYb/fQEj8Dlp2e6RM3OSe+59?=
 =?us-ascii?Q?EqqHtt1SuSuurWHAQTMYvGoNcV6STbeOxtF6zU32LueT4bp2hMeigZnoqEVW?=
 =?us-ascii?Q?Q5CFVTSeuHtyxesYMcrikMrzMMc1wxePGidF7tW/iYl6J6SGQgAsXN2b7QJo?=
 =?us-ascii?Q?os7HLEtdj0bS34yyD/rIW+h/HVPp1IkuyGg6La+EoE+k28TLgJLwFfuDtiqk?=
 =?us-ascii?Q?yRMszbwx7n6StGvSaxg4y57qEOlKCZa91nmCLfanUPv1fGd5rpz44LSd31gZ?=
 =?us-ascii?Q?URpLoz4lM+3v3FVJqr4q6Y3pNXtoUzM+ytel0VwnD3TusnGM5YAqRx2xm7FQ?=
 =?us-ascii?Q?Riw0CTfvM4QPuDVWF7lW8xs1yrUwm5cbd3uacbGxDRNvfATZNnQeL6A5PRGM?=
 =?us-ascii?Q?6WNeuV7ipKHLKGgsLEtqcQBD6VBiajyxrnZO5gQ4A9iGIkMEQihm3IC8UCoj?=
 =?us-ascii?Q?f1qdJP5N9vopo8NfggnNVt4W22psAGaa0qrLM2fI4mI3BX3WBexYODAxUf02?=
 =?us-ascii?Q?KM1Ys65b9ODTSiiPQzku+sdvdJIDzkBl84FeKMLYkoCCIONbsGfhqYMbvNZY?=
 =?us-ascii?Q?mz6A+XwV+F600heWojOzu+lh+PWz3O3arkdrtepttGF7dhapvOf3YXmS7P/m?=
 =?us-ascii?Q?7CNueO5pJeE/GIkF7dzBpXLlRDsw9sT1UVW5TLvLrMyH09GA+SCmjUr3/k9L?=
 =?us-ascii?Q?V4mjBRVdHHCLbu6Jm0k7bIx9lQJKX0z4G8vH5tsjbkPbMtMWXYtGoVlM10jk?=
 =?us-ascii?Q?7triTsCSdUkmjI9WLm2xYRV+6oJoWNWS9tXhv42UuWDjtkab3CQT2x6qDBCr?=
 =?us-ascii?Q?SkrY4T5SBB5mE3rhExChjoOP0Itr6T6IJHXBZyiscTz08FbiT9nmvepw7FlV?=
 =?us-ascii?Q?5Bc0G60gIfbjv5Wa6SxxmdSECLbST6ModrBtNNP2u/pJ+9Sg/Ntj9KbNUxHy?=
 =?us-ascii?Q?Mh62Q7io/koULX7BdMqh59pSf2/V0nRbhHTbDO68YzMo6v2veBe6ianZkF/r?=
 =?us-ascii?Q?IKbjpIrYBcrYh5UJVSN9tnNc83XK6PxY90EGT5UmmtP5/Xq4Kd+uabPZi6Mb?=
 =?us-ascii?Q?Vue/Dug6BQnhkUYimaQ63J2HKMm6ej8/jyZXpubbptMTCESUDecBB7TAyTa1?=
 =?us-ascii?Q?vgHihrmp0iEPVdsVTouOfvXtySFzcdZhnKT/pDmchPitGgMYltOnH9nD+KpD?=
 =?us-ascii?Q?DFZAk9O9xgZzOlsCuEfobip815onxAm3T4Iokk0SMbdYzHeg5DMfI3mKfXwP?=
 =?us-ascii?Q?rLtg5/1u5jeGFXC3UsXdPPPEopIaXqXhuD5uo3u9vl3FSwFK+OI3YWTx50q6?=
 =?us-ascii?Q?3RDjzMN92Yu/zyHpwP8nS79e6ITishnnbykfqOoB937mIW+X9penGLxVoXmt?=
 =?us-ascii?Q?/APdWZz2YtFEXeFoqTWSPudrDgETA4Rgb78T0tS2m8U20w5NNvJdUoxz+G4r?=
 =?us-ascii?Q?ur3Uaf4Iih9Dzkk02Oh6Ec+WXhBMxHPfjoJ13cIuFzezcd8J9Qo4w/mv3S3m?=
 =?us-ascii?Q?42fiyZIOj29ZXkx5enBkB/wNM2H8qPP3S3tUG0NMchQ7NOxutF+c0XCP/ozD?=
 =?us-ascii?Q?4rsWbs+naQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43cb7004-daea-460a-ba36-08de5e90a5c2
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 17:14:08.8071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DCYsKJd+7QIANSq2kBcsuvWOVyBgl+82EzPVl1p9Mn7fKMnc9KSdbuVDnBhwZS6x5HdyT+IdG7LnYeAv5erC9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12277

On Wed, Jan 28, 2026 at 06:21:27PM +0200, Josua Mayer wrote:
> imx8mp.dtsi includes a default port@1 node with an empty placeholder
> endpoint intended for linking to a dsi bridge or panel.
>
> HummingBoard Pulse mini-hdmi dtsi added and linked hdmi bridge to yet
> another endpoint.
>
> This duplicate endpoint can cause dsi_attach to fail.

Can you add descript about why duplicate endpoint cause fail?

Frank
>
> Remove the duplicate node and link to the one defined in soc dtsi.
> Further remove the unnecessary attach-bridge property.
>
> Fixes: 2a222aa2bee9 ("arm64: dts: add description for solidrun imx8mp hummingboard variants")
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  .../dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi    | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi
> index 46916ddc0533..0e5f4607c7c1 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi
> @@ -41,7 +41,7 @@ port@0 {
>  				reg = <0>;
>
>  				adv7535_from_dsim: endpoint {
> -					remote-endpoint = <&dsim_to_adv7535>;
> +					remote-endpoint = <&mipi_dsi_out>;
>  				};
>  			};
>
> @@ -71,11 +71,8 @@ &lcdif1 {
>  &mipi_dsi {
>  	samsung,esc-clock-frequency = <10000000>;
>  	status = "okay";
> +};
>
> -	port@1 {
> -		dsim_to_adv7535: endpoint {
> -			remote-endpoint = <&adv7535_from_dsim>;
> -			attach-bridge;
> -		};
> -	};
> +&mipi_dsi_out {
> +	remote-endpoint = <&adv7535_from_dsim>;
>  };
>
> --
> 2.43.0
>
>
