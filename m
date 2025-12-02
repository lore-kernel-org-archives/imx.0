Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010053.outbound.protection.outlook.com [52.101.84.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68E11F1534
	for <imx@lists.linux.dev>; Tue,  2 Dec 2025 15:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764688097; cv=fail; b=JJKRQ6XoLooQxaUVTu5RxPilvcC508NuzrDbf0pht9cEItCAWB31J05HwT9Ieki3jjYKncFibMZSxL9BAu8S4eX25sam1+/RgJhRPGgSF5LEpoc/1OInhaQXcwPIn6zxOG02JH+mEqUBx0Od1ovJie0wtuTn+YToLvDP5xEXAgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764688097; c=relaxed/simple;
	bh=tH2eQ5VHz7lNoFa36jNj7LTzAPl1N7lb+kXEagDJ5Ec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AUKfBuUDKMOO1lEM9iQKzTSbP8DPMk60HVa6w/kuaj7f+L5XOb12bzk8Rq8zh/qXMLjkzU2UZk2oHhBNvEvQpn0bGj7Df7g4YyoQxC94D7CaN05AyJS97ZPPvEYEXSjf5oZ3/4+qlOPazqnS18yIzniNEuqaad8mQtAc/m1wLx4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JupYVmSN; arc=fail smtp.client-ip=52.101.84.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JupYVmSN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FYaaxGJJd5Yr0kxss4vF7H2c7G9pSBWRN/v+hEAjtCkvyW0IThbxAe+n7FsIn+kuHlh6OEdyz6FcVRRzO9o0Y8b0ktdd1CqLVCgMgM/f9cEjBTu/qEJ4KKeQfnyJ236mA2fGDztGCzHE7jglva0WNxQS3aSnU5uLJjkMorISWMO4j/jPboPG5oZAH5gq0gY/DJF2+anJpZHPpLwCswzAm9L8y9EZFgd63NCStzshPhqzr4grkUl1PVLjM9fhYXfX/s8jSmEod+k3eJbOp/gpp4kwNVnJRlWSw+IAa3g2EHC5UUTYpjD21nAXiA0BepPEj6AERVTDOoP+ltSt7sPHdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/cW3XUl9Gxg9zs6fTagy6EMCHFpcnNf7OGrU3rkfmo=;
 b=tm3zFUFxoKkS0iyKabKBp0VBZSsuYZRuVWWAcDG9ooBR9MHkMUAHpiyE7keydTTPNvYMmuMEMenK3Ikk13z59rga4YntnxfKmrv3GrNNdVPwByKVkFtZ36/eS4GODJ+gwDm/BAR5lHghqGkpriBueCkxsG7KQ1PZbUL1vqWvX4sF7VsqEalDu09QFnGS1+DDXCBoLBlA3RL4wJoltRfpyZrOjYWiVY2kK9C5ttQG8yMwzXJCvag+KCa7FvgJ4vqstU4+3by5qPgkbZRlHoiJzcpeV+K4IHndcIasGvjg7tXGn7HT2Zau/40Xcy5P+IqXsBDbLLDkTHmgP5UyZWL8pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/cW3XUl9Gxg9zs6fTagy6EMCHFpcnNf7OGrU3rkfmo=;
 b=JupYVmSNfQK92b2kkwimXq9VnONORXsMCZKexRyoj+QzlNqBGK1UUv2SLi+9bsGK+fI0QmWHowbEkDVSMwfMgCwhp9C9wZLLd67t+6Q4q2abPOLrfSZKygrlpK20jXLhz2GOHlyW/HXMPmYs4JlRWt5W/12Ve9cch5+i7Mrf8aOaISVztl45PWgPiL9/Yzqc0b1HUM3fH2paUiCGZN5BU5EqWzcnqnaxwDCy0bPEkchRgY7OGCHUmPWDi45OveRq4noc8Fw+IxYuxXh2mzIVP3See3RFYK/ALPSyQbwhfdi4I8jYCvJb6vwFuyxqZtVkzHfaejkNsS9vXzgu9IIIog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU2PR04MB9113.eurprd04.prod.outlook.com (2603:10a6:10:2f4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 15:08:12 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 15:08:11 +0000
Date: Tue, 2 Dec 2025 10:08:04 -0500
From: Frank Li <Frank.li@nxp.com>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: imx93-9x9-qsb: add CAN support overlay
 file
Message-ID: <aS8A1B6/XTgYb+aO@lizhi-Precision-Tower-5810>
References: <20251202-b4-9391-can-dts-v2-1-edab562615a7@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202-b4-9391-can-dts-v2-1-edab562615a7@nxp.com>
X-ClientProxiedBy: BYAPR06CA0001.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::14) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU2PR04MB9113:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c912ac4-9b6c-4dc9-c221-08de31b49c0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kWW9wnEKX2N7XvCGqonJXsIysfdR5nbOGeJxt+xUeDEqxBuOQ0cPVrv+toht?=
 =?us-ascii?Q?4edRuhIbx0t/h+GTsYkumvMsCcy5xOMxjMLRsrgVOhTfwjjTdaEwYz0YnPil?=
 =?us-ascii?Q?lVwcZDLrCQzVH2Zsk5p8XHHK0XAaWPrU+Qy+U1RD8btFFp9dV36QrlZSN5zO?=
 =?us-ascii?Q?7gOd2owyo4fzjVJxw+9FoDj7XSHxt4JjPx9/IOFWbVFdkVuVBzKNvUH6/uNc?=
 =?us-ascii?Q?FYNE1Qhub8rbBnb8Nan3OJVPHUwSXyPFMbjMowDwxONbtbdBx7cTldL3PXGV?=
 =?us-ascii?Q?jksD7Ef+VfN9kee6c67IYXQGndWIFO2XVwYx6q3WdJvUEqTtFv7w5JvlXWXx?=
 =?us-ascii?Q?rWxn/FpNMAf2TC0PsOydQS/L775XlTOUzgVVUA4QqLitMb3ADLJpmVUm/dFQ?=
 =?us-ascii?Q?Txw6jdohzTwC6kR3k7Njl0J8xwz4Q9m2MkzLYfpbTkoxXb5Qf790U4gWtxU8?=
 =?us-ascii?Q?fNcVrJlT2oeoBTjLwZFBEdlqrVwygcQ5dZRoUHoifp9c3pTI3ImX3F+YHOgl?=
 =?us-ascii?Q?NHH3minONUJCD92gX4w4/ZoJrRp0zF/jgqlrCkExwZwZ60wP/Up8uJldieIR?=
 =?us-ascii?Q?qYSQ3aAqv9Df+tZweFnykCA9DhE8Cu2FsrXFZ4mPr3BiEL0+L/kVD/K5Zdkr?=
 =?us-ascii?Q?SkBGulzagO5/DqYnwuD9mudOaqrRBD+hQtUCDpJreMrIU5y1O+zXPQ4wLN6c?=
 =?us-ascii?Q?XKWeS8mhQbRDv+JARPDN19q3NOznbco1129WSaDRSm42TfFOTrade0BSVyAi?=
 =?us-ascii?Q?K3Tkx7lWpDkoohgWhxvSN7z7hZkDO6FDs2bWB85+lM43Dp0sBar7Ep93eL2Y?=
 =?us-ascii?Q?1MNYY35Eopgz1YaaMxHGCwcSg9EkEalPYronoCul7NXWDsfQ8zob/THgloZX?=
 =?us-ascii?Q?NkGRVQp6qLIDSubw8GwMYvELXxdo6XwcoSM0h2NTBpU5CVu6uzBMo6sHBcVm?=
 =?us-ascii?Q?6hUZQZGmQTH0Jzw18A1VpdB25CaDnBql2/d2C7WN8nlRLvyLYmWgmQPJsmrT?=
 =?us-ascii?Q?GZ9G9yOCRdjEOjmCiXBJuvDD3mGlnFa+CY9DkfZB61Sh4DIdMlp8Zq3awIyo?=
 =?us-ascii?Q?9cV3SECh88OKYN1JxrPa7QaOJnWB9afGz0CfWlY4MlwaqEM02YCNRdmgih4z?=
 =?us-ascii?Q?ooXiK3t/vtMKiFQNbiNJWFwH7q0ul4TmPUfIG3vLp3U5YLlFXkWtm9zL5I4P?=
 =?us-ascii?Q?zKGS5AksuZGVfMyNhs/fJKIQUuytS6Il3BCgAUfe/+Gow0Ui8o4sTSh4gUSA?=
 =?us-ascii?Q?yVUfhFQRXV/J5mqy3JS66YSGBq6ulqyH4+SEsHus+9Ci6BS8co2cttDcZlDX?=
 =?us-ascii?Q?caXyhX4cbVRYEekLNplhPekQEtgVDZcDDD71GeBVwW/AFUeWKGhlLEld5XDw?=
 =?us-ascii?Q?xiwO1IdehzAP7G67hCiIxniWimfQH5Fh5fPgK3v3mZliABlydQJyonNWrnTR?=
 =?us-ascii?Q?HWbOewe0DUUNVv0VrzDa5ngSl5CnF3Ti1lmQqfy3FIg3upBbOVaId1uOnOkd?=
 =?us-ascii?Q?Hi61DuwCyTLIt6ADV5rC3bWOT/B9gr+YLIqn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s6TPcwWx1vF/emQ7m8NMmvm7R3bgY5PCNFpEl9nZf7lQgkdETrcHLZ/Wi4TR?=
 =?us-ascii?Q?0NkKwL7lgIA5DV6N95DQjOWTLAyDMoECjx+ykcBYWbrlD+Xq8r6EOyEqbXAV?=
 =?us-ascii?Q?5RnNE/ArnxiTybyHYMCiFEgLuFOkvKfI9ovhonZptiClhnVldzeJwZp/4FNP?=
 =?us-ascii?Q?EW75wJXax0m/Ll3tALB5IPE/Iy+umlLFEiKQAW2k4x8BNRHBuT5yJZacpEs8?=
 =?us-ascii?Q?WSLx6GELm3/w+5xDf1Xu5sqJzpuO0pB+i2cmh/9/nrQfWs/wIAchry//3uAr?=
 =?us-ascii?Q?/u9b/miU2mbQ7sRZGJeyWTT72hhl+FzT5F1MSYuxqb0ye5TAFJqkx4GQtiy7?=
 =?us-ascii?Q?BoCnAjJUNXlyvXkr7zDv/1ctbjlKOs7lBO2Kyv3ntBTPjVthD4C+94nT7LH2?=
 =?us-ascii?Q?m6PlVh7Wn2jpRJVBpI3/dvuF1XIMnFRHgygWwq49cdQjKuAjzWcy9/HNPZ2F?=
 =?us-ascii?Q?+FNEzxTx3O7KzcHcaOU5Kk0zpnUE+GToXons0u/mK0TkBdYHd6SqVjILHGB8?=
 =?us-ascii?Q?j5C4uKiuYAf2zV0iKWJIrnn9wX+L3LiTdqqVwLHypaFgnUZ/ymi8QFiVQBUV?=
 =?us-ascii?Q?O43CFZMimmvEfAnFEdpcJHIDhmW6rCG8GS6M5go6aiy93mnP6f4pHuaARu9j?=
 =?us-ascii?Q?pBuNzr7CwMH1a6KI1+MySFMjbE3gGWWl5qz0UqO8xGTt5UHgCxsL+WePgy8O?=
 =?us-ascii?Q?Sudv0a9H8DXbEvsGByOmQKiDpjMxZPZi0vLwx009vEqQH4C57pjnOwNK1V1g?=
 =?us-ascii?Q?OxzDVHI+VqsqKG1mq9ZUO9NCzL+/A8NjFXbrOiSDH0KNtZ79F3ueo6YXNdAz?=
 =?us-ascii?Q?01yEqu9hed/+C0BslU99dIkeTYcf+WZIfmFPw2k/eZ+DyzB23jlw9Co5ju3f?=
 =?us-ascii?Q?zefDbCH+KV9cV2zYRp+aI+pdVricSpA6+X6IgtDsFYtJ2w1AW5EHuvsKvzv6?=
 =?us-ascii?Q?xRSNQFx5LP8FSI6PlUkpcHFovelc52vXIUqJCh+L+kiaMYl6aW4F9qWsTcd/?=
 =?us-ascii?Q?2UNk1k+lgG/4IYz4AcRB8+EdBhFDliZCnEEemniJQrE0zPj/CAPqM+wSeoLP?=
 =?us-ascii?Q?2Crw1QzZaWuqh/Mfg15r/3dLjyobHUhCC+PicyyUOjRJ+bT7MIKKXhUMBgVz?=
 =?us-ascii?Q?jna0LL6V7iwGWFP9gMGkvJ+iBIcCKSI3dwdUSOceAqXbcrF+toRaD6SPO46R?=
 =?us-ascii?Q?ic9DPyN/nXK+TTEFeGDDCF24FtnWFFycuCISSuIpwBIHj+GO6jX5oUPhbQ9S?=
 =?us-ascii?Q?gp4g5aaPqHIIX2zoXKJdFcZ049FH3m3p/dAjT4Gj/KXLiMeBKZ+mNzZhUMQJ?=
 =?us-ascii?Q?K346t4Gt70/cFZbMRdxmfeaLp8UveBDYc517FKItNFXOtBExd4yIwuir3MeH?=
 =?us-ascii?Q?VZbVtfabPc0gA5AoqubCgrCvbjb5M4hHU2Tci3BtTi9luW7w86PqFR4QBQKF?=
 =?us-ascii?Q?IBB0I5tXiQIQS3BeJGGH3YANH82z+wozLhuszIG3TjJas+6lizwJOVV4Fklp?=
 =?us-ascii?Q?awZATKb4UGLToLPoA5O6jBOQd9m0qJSw6skwlo5Gj1GCef5X4xle0HqCoWEC?=
 =?us-ascii?Q?851cuPK1wvGoC/zMOGAXQAbNrkK7Mz2/HKKwHgAw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c912ac4-9b6c-4dc9-c221-08de31b49c0b
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 15:08:11.6122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kh4Ly75j5ckGmgAlP17eB0i140CHSGf0uvIIqwuypmn7ud+ZE9ag2cfscTg4EwNlmCpAa8RZBa6I3ibab9Wzyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9113

On Tue, Dec 02, 2025 at 02:04:33PM +0800, Haibo Chen wrote:
> CAN1 and Micfil share pins on imx93-9x9-qsb board, use TMUX1574RSVR
> to control the connection: put sel to high, select CAN1, put sel to
> low, select Micfil. In default, sel keep low.
>
> To support CAN1, need to put the sel to high. Besides, CAN1 use phy
> TJA1057GT/3.
>
> ---
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v2:
> - change commit title
> - Keep order by alphabet in Makefile
> - Link to v1: https://lore.kernel.org/r/20251126-b4-9391-can-dts-v1-1-c23145f0d2db@nxp.com
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |  2 +
>  .../boot/dts/freescale/imx93-9x9-qsb-can1.dtso     | 63 ++++++++++++++++++++++
>  2 files changed, 65 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index f30d3fd724d0ce6b38f7bef10e3970ac34f70f4a..e15a7b216c5c6753c39ab02801d82f23255b8e63 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -372,7 +372,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx91-phyboard-segin.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx91-tqma9131-mba91xxca.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
>
> +imx93-9x9-qsb-can1-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-can1.dtbo
>  imx93-9x9-qsb-i3c-dtbs += imx93-9x9-qsb.dtb imx93-9x9-qsb-i3c.dtbo
> +dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-can1.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb-i3c.dtb
>
>  dtb-$(CONFIG_ARCH_MXC) += imx93-11x11-evk.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-can1.dtso b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-can1.dtso
> new file mode 100644
> index 0000000000000000000000000000000000000000..0bf1e9d4bad2ec540d71470fcebc64a82072b41d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb-can1.dtso
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2025 NXP
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include "imx93-pinfunc.h"
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +	flexcan_phy: can-phy {
> +		compatible = "nxp,tja1057";
> +		#phy-cells = <0>;
> +		max-bitrate = <5000000>;
> +		silent-gpios = <&pcal6524 23 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +
> +&flexcan1 {
> +	phys = <&flexcan_phy>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexcan1>;
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl_flexcan1: flexcan1grp {
> +		fsl,pins = <
> +			MX93_PAD_PDM_CLK__CAN1_TX		0x139e
> +			MX93_PAD_PDM_BIT_STREAM0__CAN1_RX	0x139e
> +		>;
> +	};
> +};
> +
> +/* micfi1 use the A port, conflict with can1 */
> +&micfil {
> +	status = "disabled";
> +};
> +
> +&pcal6524 {
> +	/*
> +	 * mic-can-sel-hog have property 'output-low', dt overlay don't
> +	 * support /delete-property/. Both 'output-low' and 'output-high'
> +	 * will be exist under hog nodes if overlay file set 'output-high'.
> +	 * Workaround is disable this hog and create new hog with
> +	 * 'output-high'.
> +	 */
> +	mic-can-sel-hog {
> +		status = "disabled";
> +	};
> +
> +	/*
> +	 * Config the MIC/CAN_SEL to high, chose B
> +	 * port, connect to CAN.
> +	 */
> +	mic-can-high-sel-hog {
> +		gpio-hog;
> +		gpios = <0x11 0x00>;
> +		output-high;
> +	};
> +};
>
> ---
> base-commit: 422f3140bbcb657e1b86c484296972ab76f6d1ff
> change-id: 20251125-b4-9391-can-dts-2f4849978fc2
>
> Best regards,
> --
> Haibo Chen <haibo.chen@nxp.com>
>
