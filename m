Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010037.outbound.protection.outlook.com [52.101.84.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8893033F5AB
	for <imx@lists.linux.dev>; Tue,  5 May 2026 16:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777999823; cv=fail; b=Z5lEpeZCx6Yb4AoSONdEM/q9cfdnafXhdnCCx83+7T1Od3UL9XuMu7JihSepPUQfItaTUFq+Iw7mEhRA0C9C/E9Z9aSws8Vled8RuTZZGexKAjYh+lApqRpPIlatnwGpJAREzLzGkdr/xPufqnJRBMVdxymzK5r14/LiKHUjXdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777999823; c=relaxed/simple;
	bh=v9BmK5U16nUtQwc9gbEf+G+1FOhJRghNfYi84feXFpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eSwDP+LSqF9fJL3VyuAWwHayrlNl3OnSWtzU47x69oP7OId8wlWol1Gz/KcB8iquXdKt2HDb2+EX7LmtQE6/pU97+hkn7ytL+Vc1hk1w6kFn2xYg9aA3mxnCK7ihIK5tIrxdTBWBEd1e5e69bUYhQBOcZud+2gSCZIngNq4xQtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=emBHeNGf; arc=fail smtp.client-ip=52.101.84.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="emBHeNGf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDDS2nceXXjkelIFcIRgoXKNntfH3QjfNOHS6nn6jsGE7E2GTBO7s39X8wYdM3f6bN8J4aVNxGnzLVlkpoddQwWlD6UJJ1A6EzcCXe+Do5vLBPa2fh5Wh3lQg5GO9vS79CMbOzbCz7HVEgG0wsaUmLa8TRj8DoBUq1GjCP1ITmCTAQcTDamGO2hXOW9Ji0OeOy2NUQWPUHCEb2tOkhTByOx1KAJHG7wrODek7vtlgrPoJYcF197Bf+uOiK3q+IanA2KdGCeP9SUAZwQDyb94FN5guczbMTiMyWilY49g0eo4qJ1+eOcqY5ym31AIpy5m9zXg4ATJl5wsiROqTuIxnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9iUaHOQIWsUUj00K9YHUDLQ+SltEZ04hxSkIAGt/CXI=;
 b=McF02MT1Ju6vhAiGrlMIilKAPz35ynjH58XCI62yGQQtSDrmGkz8ufHViP5qyHPvpINho29m8a3TGzfo6EPbvldZUu//Y6jbsi6qqwkdEpqzQbqFuNcjfH+UI9NDWCjJEMvGdOhkoR2Y8ZGh/h/boYOpbPc6ilAYHO4zLpBv+OFvdoj4/W2eEtA57dCpHX/3mmvBNtIwWmO+v/LoxkxkziMLiMCOZEdDYDPE+cvr2fi9yVswa2mZX+x/gVW/fog+HrlmU3x4oTXmNbSzZu9bDd8AycehmPnyoqdO1fxrwAa1v9vRW1qUpAtimvacFlE7B/1ouSoDvxGc09PAQe41aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9iUaHOQIWsUUj00K9YHUDLQ+SltEZ04hxSkIAGt/CXI=;
 b=emBHeNGf0zkUVAhveHqNhEEWkB27yIXHifYSMtzs1chYu7SVLQiIoWjfC1ADrXsFa3oKr1LfYH6r/IKgSJVt5y/vBq7UkdLepaxE7XZlXOHEojkiXQDGL7eB1CV+L70oMFmwaCDa2AcGe5x661kOlX+zRQevk9L1qfWfUgz2zpG0oCj+qgsKbBmnq8gcPnzjsuZGeMjPZcKI1/mIY4hRi16CJUjD3Yw/LwNkpT9MmjT4aBqKLSb7vX4cKa1r0c0fzafEDM8rWLQ5u0aU7EXHwJjlAtiUIuzaDwWp1yFzmsEeuXizsqn8oUR3H7fEoT/TU85RUdmG0mN2mfo6VE4k6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAWPR04MB9912.eurprd04.prod.outlook.com (2603:10a6:102:387::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 16:50:13 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 16:50:13 +0000
Date: Tue, 5 May 2026 12:50:07 -0400
From: Frank Li <Frank.li@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	hongxing.zhu@nxp.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V3 3/3] arm64: dts: imx: Add common imx-m2-pcie.dtso to
 enable PCIe on M.2 connector
Message-ID: <afofv3GjEpS67ayb@lizhi-Precision-Tower-5810>
References: <20260325083201.2637520-1-sherry.sun@nxp.com>
 <20260325083201.2637520-4-sherry.sun@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325083201.2637520-4-sherry.sun@nxp.com>
X-ClientProxiedBy: SA1P222CA0009.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:22c::25) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAWPR04MB9912:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e2a337f-985f-417e-e1f6-08deaac66062
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	pAW3vjHjDcSdOF8OPmmj1zabLtylskBL5u9Cv0Oi/Yqj87z8DgVwuYd7opl1e+RM80KvOXlBbG5+ZTb9YovriFsUbG9ZOr73kAsOTVMZBfsOsf73wLP2HNqz1uu6Gqbp5F60LH8sr5Hi6LoYV4icmlyjFro7yy53dfsj2dDwSbSL3waWLnZuP+Ynpu0iHJPEdRfkZQLuHEHRhOUNLI+FEmXWTIGY7YRc5L/hUmUN/q28rg6SzcCagHP0QIT4H23Tds2XA+d2YYDEQVuTKBsOBOiyQAsyJlrdRyarmswmGjkRA8Cmd8WtaJ15K9vqT7zRQJTVTKQc3qT0qJIbKWBEXF+7I7OvMzQmgWjQ2KFudZmG1Zl1E9TwCjXxyKr1Gj75BG+0SLE4TZJ/pc1bRPEYG68EqxNmGvDnewoj6Y5IZpoPV+yloiNvwcYKIFrrF/SuhpzstIAKaLhDNFFZquTHUzPYsT8Bdr821BRLXOiaXFxKYwQYb6XJOL5/t5DBjMmvkohefCNqjGFBJpmhRyBH9gAcqOta/h3Pe/YE2smgJL4Im6vUCcAB7K5NjXAaHoqu1ndP8bvyp96YwAfG3IrrCJZZtoeEwznx+gJP3L0PZqOIViwjuc/Cr2zYTAZzt9DGCLLPKCjKjSn5QrdMIyfQe2l0WC7R6uSp2Y+9giaD4dhTS26OLdsAr+896Q5ElkNIKjKioGGrPUWw3qpLuSS9mpCof5T1AXVSw7118jw+u/HH/HBz4Hpe+ncqxX7nJ8Xv
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WA3LlEriBySzL4PiLfVJX2XSzthhzdWg4zGol8m46PQNJTc8i6Vtu2ZdNz51?=
 =?us-ascii?Q?VYVdNoKdGHLjl6trljl/FCHvWrU/zoBEXsVhI55nQGR1t46/nvxRrAGEb+Wc?=
 =?us-ascii?Q?2Xvi51PGf8o2FwagaczTwJvYiup49FSa8OUEtjdTeVFMGeMT1edzTtRqrWo1?=
 =?us-ascii?Q?1eg09EkzqCD93Jj3VAi7sDHCaJrtBCOvM2iRki8KMPLRgA/zAeN/0/6t3102?=
 =?us-ascii?Q?tw9vuAzv31qBFIsOqKkuyf2QlFxD8hHxUz6cKHYyWPTt+UNhNE/94iM7sYrq?=
 =?us-ascii?Q?Rl5EGDr9HT9+bsD3LLw8WYaMCC6qEGwr6jXAyKnU/TZ9KWse81qHOlXlzqEy?=
 =?us-ascii?Q?kfRqerCqL7tkT5Oo+FvzCrKBXGv8vMAz7r99alhhIlowfRpzggs5O2IUSMoO?=
 =?us-ascii?Q?vtzQ/rXiJoWJnqD+GXez0hTntGcBKCG7w/CjYFZR+icyEGg6T1gGwBRSTqMu?=
 =?us-ascii?Q?lYMmnI+CxYW+yOTXsXcH+wRT/3hQXuQwX4daDCGL7O4uej94ZlN19v6ygeXv?=
 =?us-ascii?Q?3mdud2v6yxzDCdoPdsnPNu9l9GHjzMoW+tkwjlybVmWU6uoXq0NEeDMGjpRX?=
 =?us-ascii?Q?OByiBUHjbBKCfLvqJTRjFcrO5V9rz2Phrq/Z+8BdNacz+uBnmMdhqEHbWceo?=
 =?us-ascii?Q?C1HArebNd+iEoN91pcxThnWXEmKZZS2/hDvMSU1TnwNq5MQUmr+GiZft5lHi?=
 =?us-ascii?Q?cQEPIDZvls4xaufd8lW3JlrWGsk7c+/BIgqoxeRV5SyN42yysFQlfn8TC0rw?=
 =?us-ascii?Q?9MsIiK3RkdSR+1CC5C9PdTwuHMyg2SCK67adYbvqZIGI74yeanul2i6q4Qfc?=
 =?us-ascii?Q?7yDWa45ZEfryuz9ykSgEG8E3bo9uE/HiuY0rJ0LmkCFeJZ6Rizmw9qbrZ8S6?=
 =?us-ascii?Q?Y6wNYTtCPzUZ7GpFRDklxQdByYrAXOwj1MhKKcWXhnu3FgEVJ3S20AkUECgH?=
 =?us-ascii?Q?h3eVrd91urUn+iA+fFk4x9FD7MkR/wuiNiE/acbG0eSxxAErO1Xg/khqaEnv?=
 =?us-ascii?Q?Gdq82D8HccyeGgLpRtg4t2aDqu5Y0CxV50KSxtgbYwLbTdUWbHtcPiSxHuzv?=
 =?us-ascii?Q?5C6aVV5lyK7BdbxQsE7asUkoFwiFWjMclKQ/ZQ+FEajaHx7wdqmwXHcaAPB/?=
 =?us-ascii?Q?ItNJPHvfZnk8Kx5S/QigSEgg/eZXt5eENj69NNRm6gFqsnbPsP3RmuerwV4P?=
 =?us-ascii?Q?Zwu3rlPvc4Kjvkpprw9e9z4npyIvb3xrkURfHPbKkxhweSFFCYSulf4G8a09?=
 =?us-ascii?Q?O3yK/Qq9qi0rVcRACv0B3ZMOGkR/P3PtimAyxHr1R7WBzit8Zbv337UxEHnZ?=
 =?us-ascii?Q?U5X0ipgjHrY6FYT18YwtNMQmLu3d/s5IW0GQvfpaKqOknTyEFv9WQQsZtJIS?=
 =?us-ascii?Q?/l2Mq2zGl5H8qpvO5v3h27L7uoQxmqMPoFkJ6IR2kLuhrthu0vIunsmsbObe?=
 =?us-ascii?Q?jumJnrbXs/xpVNtidEYwhCYNra+FjUCOziu1ojV/l6IXgRVKr4SfyWqRQ4vj?=
 =?us-ascii?Q?OKlwqNBPUTWViBlDC6/ktJwpNtmmaD2Wx1mbrs6BnR/lkfDQ0CkfaE27SgtZ?=
 =?us-ascii?Q?XEcM4C5sYsq8WUmBNsXZFaYP4dsyfyRakQ3S0eU+I31+RkZHT3zrs9Ue0vO8?=
 =?us-ascii?Q?aRcEtxIIE4Hm0fvsBj2dtUuHnDKhU2waMvfwSrnCxjnA2xk1eBSm5hT6VtjZ?=
 =?us-ascii?Q?cTRSHxgAlJ5LGz2TSoHjxoIAstmf5yaaGSTYI5UaEI4v/p4v?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e2a337f-985f-417e-e1f6-08deaac66062
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 16:50:13.2479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NsQS92zhUVMCs/ERjIKhQrex4GTf487RGj4Mp5N6eoVHVed3vdr2MVdJIU4UYtrgiEX6CYb4gw3LBSRLQx7zlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9912

On Wed, Mar 25, 2026 at 04:32:01PM +0800, Sherry Sun wrote:
> Some i.MX boards (i.MX8MP EVK and i.MX95-15x15 EVK) have M.2 connectors
> that are physically wired to both USDHC and PCIe controllers. The
> default device tree enables USDHC for SDIO WiFi modules and disables
> PCIe to avoid regulator conflicts.
>
> Add a common imx-m2-pcie.dtso that can be applied to enable PCIe and
> disable USDHC when a PCIe module is installed in the M.2 connector.
>
> This creates the following DTB files:
> - imx8mp-evk-pcie.dtb: i.MX8MP EVK with PCIe enabled
> - imx95-15x15-evk-pcie.dtb: i.MX95-15x15 EVK with PCIe enabled
>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---

Please rebase it to imx/dt64, and prefer use b4 or provide base-commit
information. ref
https://people.kernel.org/monsieuricon/all-patches-must-include-base-commit-info

Frank

>  arch/arm64/boot/dts/freescale/Makefile         |  9 +++++++--
>  arch/arm64/boot/dts/freescale/imx-m2-pcie.dtso | 15 +++++++++++++++
>  2 files changed, 22 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx-m2-pcie.dtso
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 155213c45319..1f542324b4fc 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -333,12 +333,14 @@ imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-
>  imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtbo
>  imx8mp-evk-lvds1-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb imx8mp-evk-lvds1-imx-lvds-hdmi.dtbo
>  imx8mp-evk-mx8-dlvds-lcd1-dtbs += imx8mp-evk.dtb imx8mp-evk-mx8-dlvds-lcd1.dtbo
> -imx8mp-evk-pcie-ep-dtbs += imx8mp-evk.dtb imx-pcie0-ep.dtbo
> +imx8mp-evk-pcie-dtbs += imx8mp-evk.dtb imx-m2-pcie.dtbo
> +imx8mp-evk-pcie-ep-dtbs += imx8mp-evk-pcie.dtb imx-pcie0-ep.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds0-imx-lvds-hdmi.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds1-imx-lvds-hdmi.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-mx8-dlvds-lcd1.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-pcie.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-pcie-ep.dtb
>
>  imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33-dtbs += imx8mp-tqma8mpql-mba8mpxl.dtb imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtbo
> @@ -481,7 +483,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
>
> -imx95-15x15-evk-pcie0-ep-dtbs = imx95-15x15-evk.dtb imx-pcie0-ep.dtbo
> +imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
> +dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
> +
> +imx95-15x15-evk-pcie0-ep-dtbs = imx95-15x15-evk-pcie.dtb imx-pcie0-ep.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie0-ep.dtb
>  imx95-19x19-evk-pcie0-ep-dtbs += imx95-19x19-evk.dtb imx-pcie0-ep.dtbo
>  imx95-19x19-evk-pcie1-ep-dtbs += imx95-19x19-evk.dtb imx-pcie1-ep.dtbo
> diff --git a/arch/arm64/boot/dts/freescale/imx-m2-pcie.dtso b/arch/arm64/boot/dts/freescale/imx-m2-pcie.dtso
> new file mode 100644
> index 000000000000..1930de058a08
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx-m2-pcie.dtso
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
> +	status = "okay";
> +};
> +
> +&m2_usdhc {
> +	status = "disabled";
> +};
> --
> 2.37.1
>
