Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010034.outbound.protection.outlook.com [52.101.84.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBAB51C5D59
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 17:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780333906; cv=fail; b=uF/beNu18BK4AcHieboSvD63QohOQPxDghcdUjdO3DHu80aX3W01tqwIzyxQuCvFFBaFZaI5RzB6ly86CQefJkiHJtYrCaD+AArz//gW6G4XQYrhv3KMwCsv1oT/nWSK4hVp3rEclthPqY73RCoXexWkFPP2ktR/Niu9lKn198E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780333906; c=relaxed/simple;
	bh=3YWSrumirrYczTUwN8uBs4dTfQbLwNapbK3lih0Q4FE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KoZWXM0lMYuCqmdIJ8YIMDzHGCLXoO79/QX4cUycFW64W2S/byhJNQYOCm6nd6DLI2DrmUiJkN2QhQVkItPxOp2oGDBSihx9cwzul8MTbaOhRpddk7ayTRv/jhfi8+f73Uc9/a59VHWQP72Raf/BGbvhEyCbC41zv54yJFxI3OA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XY3dm83O; arc=fail smtp.client-ip=52.101.84.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XY3dm83O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f7wv+mxVjC5JzMxMC4LbsWuP4jA8nr3uFqlo+0IF3Eun1soEzAkycXhmwRlUg+elQqefZv8uSgkN3VDXRqAyenjFAb1EIY890zTw62MDMv2ftzTEjD0ASatoLj9yiaR5sKY+zAKl3YcURy4R93PBcdj8OzBWeonR9/gUGlfu+fuRAxDkL754qdblHXb+PJ7Yr+eWXZ8tX8Wa0DK0ZjvY7+Ct9dDartiZ+x+t1IQl+YEi3A+WBuUY7RbRNajqBlA6UH0N75ljqjQYQu0DOm+1mZf1fj/OlCs8bDeLBJsD7L19bRPyzTNOJaIY4JGOKDMb2fIlq3OxvKijjBiOpch7EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++kqqwUGRuzuDV17oRUe+jZS3mI5pYuxMV/bU49FRSI=;
 b=sDxbrqy2gII2Q0zzb842B3KiJqULUWwFUJgbySIIzk+kZa7uptDGXcdQXGphad4hKOQiXkfNE5KMKlLs9lpN/eTec/mJEeT+k8DZqGezbZ6Qyx0ayden4fmX/nN9JiL2kg2LPee/sAVIE659e+7fNV5hfJC2PhRnm7QzXNBVNhvJeZS01Mxfs4wplnoCialEsTDnaQR5dTuqKsgLERGf+/gBwJOuJeBQYwYihwfUJDbfCzb5Nmp0PlSLRsPQsFhl+b+b2KJJqirASGT7dLOqL/KQWCZhvoFLQBtkAdkLY9jU5kGnWMHSi3IRAk10tiZKq0YyXVnljVHkBmcfWOGUew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=++kqqwUGRuzuDV17oRUe+jZS3mI5pYuxMV/bU49FRSI=;
 b=XY3dm83Op4KjX0+afvfRLNW068moTdvDfwXCf2pJn4hJXa8aF11MdJ8hFSP/B1NDrj7FRZufMXeDfCwGJkPCRdK3fwdvqUwOWYv23NXqiT4YA9ORgufvtQUOGwIXpF8/JjLMizEyxHrasfQ2jgCp9VJjaCw+IemafWigpieNDMxk61L9OmsWb2fXkI77QZJKt54HDt3lHW1+2O6MWlBGGsLR/Q1hDBfUA0ZiWgmq3RNGvix/CVq+dTc/w+Mj57sidXzmccu2BSfFWV8cJ9SVCtDGdp6haOmu9fewkUJspWSXOsse3h17701GcI5sTKf/8+4iPNF/UK7lvxZt+HjITQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8226.eurprd04.prod.outlook.com (2603:10a6:20b:3ea::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 17:11:40 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 17:11:40 +0000
Date: Mon, 1 Jun 2026 13:11:33 -0400
From: Frank Li <Frank.li@nxp.com>
To: "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx943-evk-sdwifi: add a new dtso to support
 SDIW612 WiFi
Message-ID: <ah29RV8eZEScKixA@lizhi-Precision-Tower-5810>
References: <20260519053942.249129-1-sherry.sun@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260519053942.249129-1-sherry.sun@oss.nxp.com>
X-ClientProxiedBy: PH0P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::28) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: f5e90d92-e05e-40f9-a570-08dec000d8c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|52116014|18002099003|22082099003|6133799003|11063799006|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	pnY+zpfDTsjyazZyYjL7huFencJtJAS1VSEWAI3ZGFXRpoet0tbs3XEo4EFlcYAX07JYvrGlP/xutM3OV6y5DUihRNMbI6BdCGCgEZeDKbavjcmP4+gKYhcYClh6t0IxmgN1DaiqsmKf4YN6da3urq1miEOpa5NQL4p0SSabC1GDlYapIAQz1kP4k8t87xOsCDio52sD/l2V0QLnOCxtzJJzoIfYuESud8pWY5HoEFcxe3jpVnhCc4HOMYOMsXblQKh8EuL/OvsrnCqBjixCt1kHrda9HpaSmGXlNGhcja5pyr6v+WPuLC++VCh68Tpt8W2H4IlVW+5aCSJIsAJ+Gja7NXkgnTL2258xXjKHPsvf1nFThrKJl2k5hH5W8+TQPJBBXltZOlYIN5rK9x80QxhL5nl02Gg8+f3viMSHBF/QmM8wHj0QgrzD2sTPGZORF+EBe6O8oBvE+sabIia3Zpn9aZtWo0uFKsEy0jsA3qSziNehU2GDsm+KzrC3+ZEGk05pTFJL7i+EgiWFdlacgwMETwvlSopWLvUK+DYw30IDee//DCEclJWUtCDt51WGBeDFM2ocvxUxrLyOAvyTfib4m0OTlYxPkUZlgWKf6Mg4Y78icTpaUnlBU877jOWQbsKFoWjkys9NoOapVAdIcrwWTh9pk/Q7hgcpi+FNQ72zjrFlfwVulcSXopYZxNtyqAT1/wr2O7CEx8rjz2BA9pgIhf15XDRMVxMWmO9a24XKk2DLhiY+3316/JmSzDZz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(52116014)(18002099003)(22082099003)(6133799003)(11063799006)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1F+riYHp3zLcwFiNNvGS3luhEfXbJXED1MyEHgh0u4Cee4ZHUVWZQ/+qI05W?=
 =?us-ascii?Q?etmSkC2YCNOODvOsIfprMG8sW31V/wNJkTt89cDYmHa7Pi81N/Eue5+daElh?=
 =?us-ascii?Q?vky5ZU6jNNxEDy0VVg9XvE+mSQFj5R4sCHyFaZI2JKg0dDUdGQ9w1WMOQRKZ?=
 =?us-ascii?Q?gvRMckK5dxdR6mSp0aTI5Fcsn26FQSwENocSF20ITp2Z+8H+HU07/ndaTHo2?=
 =?us-ascii?Q?Nxjj76RENxvYjT+/s4R8wIRdRv3uMt1t6c/NCGeML/loCNyIhBLCZogfr4Yh?=
 =?us-ascii?Q?CWK/crbL45ZW4Xv+m0VObtjhxF2HQHvkOHEkOVp9oml+DD5xYdmBJhs+BKbM?=
 =?us-ascii?Q?dEfcgeOr4Xok3hH7fV7rbF1qvPs5MlXXxZTFwWJWsXrTeawtl1f1+GQ0zztx?=
 =?us-ascii?Q?oFj3jAuu2j1p1WfivYVac9rjtBk1CKq4n1MHVwS16UlXZnOMNYcLn1DDUdsu?=
 =?us-ascii?Q?OyH8RYbRy1YwEto9zSf15zC/Qa/mBKT/cZqsP3Zo073MX4dwigeLoU+GYtBy?=
 =?us-ascii?Q?9eibxGQ4Kx65GtINZ73ByvbfIOkUXIs+onowFiZ+ynVAJVLxfkjaGSH8ix1V?=
 =?us-ascii?Q?wasA13byyqm45vFjW7lsaa7hdtJDQBxMx8JOeBfpOFtkNFAJUpGsTaHrYTDu?=
 =?us-ascii?Q?WS/CwLSNdyIYCj/Zkt3UmAlLRBzqSAgql4f9qNxQN4Vf0NYZ4dxkiiXJiDW/?=
 =?us-ascii?Q?IffCK920/G/JniFJn2j6b2Z3EsYDWPOL/Jpsrc0Sn6eCJ1U8w2Er4RQvZayq?=
 =?us-ascii?Q?kCRN5LyGORnxmeMslh8Ap6Rgo8YWsZ2gXw0BqMxOrOL8pVh2AXtjfaMHuDZV?=
 =?us-ascii?Q?BMa/1S2dfH2c7Vzeb7XHuO0MwWa7wiNQahlUYRuqBkD2HPn8m2TR/daLLcCB?=
 =?us-ascii?Q?esmiABi17rRUtEWWvbb/IkDApsHfgKuIlyrT3nnOm9Mt+Eh7TA5Dky550sWI?=
 =?us-ascii?Q?JPxaIyLOQPIGTrYl5TJAfls8triqoALKkZZfY3Wk043BX8dm93n0etD9/9s7?=
 =?us-ascii?Q?CB9Qt+N4dfqmlCokhWOcsoX1RlAunxO9VLOlHSO+cuFksNP/grAGmGATGRTq?=
 =?us-ascii?Q?jfWK1TTNZ1cWgS0AcCZbeO7Jrmf4YMviLOdk0wmHvCpJ5FNZk0naIbNLTc6k?=
 =?us-ascii?Q?wiZv30ru0EimK6qMDyT6V9ZVOFZdyHOPvjeXYnkemmi2DDhng42vnThN5XZJ?=
 =?us-ascii?Q?JlIunC+qwd7vOdE6WdCLAoUQm5tdFLzB1F+rIM/ckXv7YVu9oGG98B4z0jVS?=
 =?us-ascii?Q?DQdpvdz9MJtxK8fIBpKQ/QKd6B1L7FzQC1EieyFN2MpWTm78m0jQNKc/B+5Z?=
 =?us-ascii?Q?2Nhri8dzt6d089gIayJcRbQb5aElOilJDVI4L5XNsf01BaH+9KkNdlCm1PoA?=
 =?us-ascii?Q?jS6yEfX89smE9azISMX7Nwlvz/bYdXubWuUtd4agP+1WJ9yDnJSgNlMwdSsa?=
 =?us-ascii?Q?Hk6pTQnUbqTV3sqt8eM4/NtJTRvQxFlNUKEfWzDBVsnNPexpjhVH6ZbSjX8e?=
 =?us-ascii?Q?i1TzkQmpX7nB9PpTaAeCrlSjUtM6jYjbMIW6cIvsCQHY5bgrlw7ys0Utzt0B?=
 =?us-ascii?Q?/ukP2jiLW66XxTn0eqUUm1nuPAb9h3TnPZOw+peVgf5AAyadkq5KCtUmLLCA?=
 =?us-ascii?Q?zGnSCIoaP3lCq/pliZatkbzfwhvsD/F++RatDaaWsnmArhN/mJaFxdcloOWb?=
 =?us-ascii?Q?fFL3ftZxeSuoyS99ecygBZm3VqjStTP54N7OQJCgNlqDzG5bCNYSPxFphRqT?=
 =?us-ascii?Q?xYPxsJnqAQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5e90d92-e05e-40f9-a570-08dec000d8c8
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 17:11:40.4493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 70J7wEBrPZzNHZauUVKDTIbm/JiuYG9w89jr6A7X/ilUG0bgM1j8NLDbzSCYaxH/v7uEzMlwPIOtnyh6U/vFcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8226

On Tue, May 19, 2026 at 01:39:42PM +0800, Sherry Sun (OSS) wrote:
> From: Sherry Sun <sherry.sun@nxp.com>
>
> Add a new imx943-evk-sdwifi.dtso to support SDIW612 WiFi chip on
> imx943-evk board, the default imx943-evk.dtb is used to support PCIE
> AW693 WiFi.
>
> Use separate dts for SDIW612 and PCIe AW693 WiFi to avoid the shared
> regulator between SDIO and PCIe buses, the random probe order between
> the two buses may break the PCIe initialization sequence which cause
> AW693 has probability of failing to detect.

Mani said M.2 Key E patch already applied. Dose use M.2 Key E fix this
problem?

Frank

>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile            |  3 +++
>  .../boot/dts/freescale/imx943-evk-sdwifi.dtso     | 15 +++++++++++++++
>  arch/arm64/boot/dts/freescale/imx943-evk.dts      |  2 +-
>  3 files changed, 19 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx943-evk-sdwifi.dtso
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 0a4dabac5de4..657e0915ca69 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -516,6 +516,9 @@ imx943-evk-pcie0-ep-dtbs += imx943-evk.dtb imx-pcie0-ep.dtbo
>  imx943-evk-pcie1-ep-dtbs += imx943-evk.dtb imx-pcie1-ep.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx943-evk-pcie0-ep.dtb imx943-evk-pcie1-ep.dtb
>
> +imx943-evk-sdwifi-dtbs := imx943-evk.dtb imx943-evk-sdwifi.dtbo
> +dtb-$(CONFIG_ARCH_MXC) += imx943-evk-sdwifi.dtb
> +
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-ab2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx943-evk-sdwifi.dtso b/arch/arm64/boot/dts/freescale/imx943-evk-sdwifi.dtso
> new file mode 100644
> index 000000000000..59cc1c27b9b9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx943-evk-sdwifi.dtso
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2026 NXP
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&pcie0 {
> +	status = "disabled";
> +};
> +
> +&usdhc3 {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> index fe4fc512d95d..1346a6a56883 100644
> --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> @@ -1153,7 +1153,7 @@ &usdhc3 {
>  	keep-power-in-suspend;
>  	non-removable;
>  	wakeup-source;
> -	status = "okay";
> +	status = "disabled";
>  };
>
>  &wdog3 {
>
> base-commit: 5f9e9f83aee0fa8f2124c6f192505de2cdf7c5dc
> --
> 2.37.1
>
