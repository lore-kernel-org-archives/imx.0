Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011043.outbound.protection.outlook.com [52.101.70.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001BB367286
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 21:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780349653; cv=fail; b=aiPOg6vAj04z85x72ZkWLxM6BQvzsXqip2SKq/4H1DIHje2WMBnomk94/xtzThOr5ft/C9Q3AH4yFmCYy6EO7D/ocFtrP3OczB4/MCj2mz7IzvckUIwJ5E6f0gyx88kiIBuqtRlwiz7LFaZjIX4/a1Nt+VCg52dswa8t1T7sKcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780349653; c=relaxed/simple;
	bh=ppZ4lB5Web6e9VTZOZO6/e1/M/Rnra3fikp55t24EDs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nBXCERzEjFuszeKwzmsAhVt0jLRZHsZ/ch7tj4KMp5Bn5hzCDrYd4OjClVQxiaItSea0/6EiQt5lQx3sUG9E1XEO4b71aXOB5PTT5GT+nq4qiNHamyVSLptFHpLOsjRboETM5qg5NpKvYThuZgm4jDq3q3BdLXQ68I+j6tRJvVE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kJevP9gs; arc=fail smtp.client-ip=52.101.70.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kJevP9gs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VVg2WABruRYTHAFGqAvdv4e2Mk4c+jsPPOWiDqAEtBvwi/4C7crvs8lqShq806atsT8fwU23gFpGWhTRn7RB83QK2qOXVZfdaEBBu7nNzBDuRZP3qB+KKGbLBcSntmXLtH10uTBQDmJa45Xs3SmqA8gzVZMsjRyEjcCN8gZbNq2CWlOIqJ3bGjxDrFA2MsVIuf+3Z6tfF7rW7VMtF0b2Er5I+JZ2hOQ3zCckP52sL3y6Pndl874BHNMim4e65QQv5/U4SzE2Sc+ISwalWmIJsn38+B2D1gjfneBG4Ft6lWWrmrGTFgKDBWgL203rG0MPHGnSH4dNBbdTYKfxbar5vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/HkwPLV1CJ2MbHXR1zu4HwNIm3wcQE1ETRLHxWUWDE=;
 b=ZsH+qolK9PX9slfXUoJ8BniLDWNd29Go4N4UPSNlKOLvN7sEYmjcpkU21eSX4BgXCHKx46Txjgjb7VdBSzMcTXuAa6dNNcivNBXp/xcdvPYaOJdwnKMibMXdjXLYQHPAavUKdsyoT7vKozJPLNSB4wX8Rn7lfFuxagCZOGLR9PRZ5vK6F8inD6Dc6Fu3gErJpCx7Ym7XPBM9/iqwws1uFxs9t8TNfLp/RcwGpwS1yAfy3YSKw1aPrjI+20UwFxt0lrFrzc1V276P85E+K5FvuTbv3zanfzVhMPlKS9JYywtr1IiTZj/q6erXsJzoYd4KyvdS1/m7baI5tgDl9Pv/5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/HkwPLV1CJ2MbHXR1zu4HwNIm3wcQE1ETRLHxWUWDE=;
 b=kJevP9gsoVFnI426wN7FyINxCK9NGU24yZankyzLXWesDrbVJVBcya9dubgMB6HF38zim6zDytHDbmkSbMco3yDHisAQohecFIvnzeM4SfJEImsj/OsaWMQ/OQX8IDrCn4O5u1mGWsxK9cE3pVdf77L7/Mj1Vkmo4r2DVN94R5rPSdvEKT35N1OntSpK16AHP/uYGfsfj/0Wt5gKUWos+fVDi8jT7R04p95V9Xw0w4pAUwHhijoZ4/HVlfpmZSorXqeuu80oXZE2bA5FjlAlanVew13RtYWE2xnBCQDCza1XrabTJLOtTMTEXJBuWdW9SAq/xgUAFbWLwe8tvGDA+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV2PR04MB11303.eurprd04.prod.outlook.com (2603:10a6:150:2a3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 21:34:03 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.21.0071.015; Mon, 1 Jun 2026
 21:34:03 +0000
Date: Mon, 1 Jun 2026 17:33:57 -0400
From: Frank Li <Frank.li@nxp.com>
To: Florijan Plohl <florijan.plohl@norik.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v2] arm64: dts: imx{91,93}-phyboard-segin: Add peb-av-18
 overlays
Message-ID: <ah36xZRtedh5A_DL@lizhi-Precision-Tower-5810>
References: <20260409090432.130489-1-florijan.plohl@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409090432.130489-1-florijan.plohl@norik.com>
X-ClientProxiedBy: SA9PR13CA0039.namprd13.prod.outlook.com
 (2603:10b6:806:22::14) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV2PR04MB11303:EE_
X-MS-Office365-Filtering-Correlation-Id: fe9c4cba-a584-4d22-704f-08dec0258078
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|7416014|52116014|1800799024|38350700014|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	FPPEmskSmC6UoeayQWUxlNiEyjvo3KsAPOeIWCcpaOMxJySmAqJw398dONeKfv7jFF/6HsRm9WJo9EB0XLqBKJeCYepo+rEiQkHoUwMJ+AbOvDvSpm0mdCOY0hHjwEG9gEStD24YdMN8ocWHKtRVtEAf5d6cQa/UpoX9bO3vv+etmA4GMYPeMNjG7IBCbrXrEpcLLGbFQLJ8LuyzT5UpVorVgVYIIGYuY36k/g0qnlBSL4zbQgGnZry1x/Y8720R1wjYo29etqtkPFnyxqNc3zmf/vi9KCZYlyfSf938bw6gAUUvg30JySKzLXnrNiFuMao3PD5PY7NNjj3bu9PR139dBjP9GU8/jOdZ9+gK+irMazLAJnWXGtvPK0+oWK+6OsOLtEst+XAZoNffQ3ZL9WEH3LmB13b+gEPnsf52zw3tqHJiXxeczZECFoXViFAA9oDdGenGlEPfvOyTgO/6QvBwpgZ6Rx0qVSpaWPvV33GTbA40DXSX0xvHavv0raBJle8cNEvjSfAX7m7DMHUnc+OxhSNZHTvBUFclu7XJFhk9/l6PZ1et5IIszpl7+wgfObNkkf1IfE4el0QsEAyM0eJiAWuHwLPCaKaImRj3hE+uMErlEHykm5xgHC/dqkLlqaFyccYxsTgqs61oT07qLW3kozwEFschJVV1tHnMOGDIf5nvLcjZWxIMdvgRFwRfUXbvzFVW7plhrEl/CzEQJz81PRuk5+/7h8HtD+AQj6Tp+83i376Mw+nDPna10+mF
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(52116014)(1800799024)(38350700014)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KxkZs+rrREYsZOi/n4fWOUI2A+jqFoFreMQ4IZm/bxECUmZM/nEu8eF5X3xC?=
 =?us-ascii?Q?7f2ZG/PF79U7oBqM+uQd4s1CfWmrGWqNmKJ2BB1NzotGqVXH+FQhixaqIIdW?=
 =?us-ascii?Q?Eyj53EEncGgPPPuVSCJ3jdVc3kUQ03Czk+ISQqcLlYyrxOUcMwqLN4/YaQSZ?=
 =?us-ascii?Q?zM410IR4nxKYTIxSJC8CJ2TN+idOlPO9NBKuMRW/WnTC0VNnvOCX9EMeCcU3?=
 =?us-ascii?Q?40nJCMrDT79p+y4NvKKoLNcpnpPj7GLs66KTQWOPgd6WI6p+gWJhi4+jTmsL?=
 =?us-ascii?Q?2eVYHm2ycUuoWLLNZUhcDJ+kGR+U0ZHcDgsN1PI5IJZ3cbUbiqtxzjjsOKfE?=
 =?us-ascii?Q?KpP9BFTcEC0tDuZG+8ItTcUYq+set5T3wdBegOCEVe6DHMK/Ac9r/ANtcFoo?=
 =?us-ascii?Q?JTIPOPOqxvPpKLE6vO+kcSIRiNHROuteRCV+p9+OJlWGLDAPJoGF3hRaaVMF?=
 =?us-ascii?Q?4mTHQMD7FaX6HflnEhkDkp+NCAcm5j6ljVINrpHnAwCdCgARtpEhxu3wHQjU?=
 =?us-ascii?Q?mssDVzpD6utwq+1Li4UK5/swOc/FU5+m8NeoCjHVDZB1IaFdBlvXI0I58w0u?=
 =?us-ascii?Q?O1O/u61iB9AEQIiy7uUMHrCA2ndz9wERxGsdrcfaZ1tmRgfCBxdoPPDxUujI?=
 =?us-ascii?Q?UsUQabuheKqgYi9g2o15fXvf3lWKHnHHiLcZ4ycSeEi7RoytHspc/JAqnx1V?=
 =?us-ascii?Q?XVt1k9k3tVKcKP8CbaE2z4zRflUUc+ahdlq8MIzevDu1TlxpRi2rGkZER7Ja?=
 =?us-ascii?Q?mM9cRMPAPeGzaaTEZBF9cnOzSZTRT1bHx98tbl3Tf7WbQPMFtOrFgbQYGcdY?=
 =?us-ascii?Q?KXXSD8naybKIrraUfSW31myFG8a0FfUr0VPF6iKjW/sg5qp2aTk9wE7nW4HO?=
 =?us-ascii?Q?qju4P/GziuFr5rJ9Ira/9wIo6d2Unv/uaq8eLbY2JnVytesh1bPcOi7uyYJz?=
 =?us-ascii?Q?cM7wPJKsSuLCOxSbIjC3x75JycucXVJ3uz3Im4RdJdpaxiRtgXicq/gD+U/4?=
 =?us-ascii?Q?lFN5/9EU/SltTwOrQPMQUpB8RXB9YtSookssQXV4t0wnoNcGtcGevdVv5ff7?=
 =?us-ascii?Q?V/Z28o8XRLQfbMjKlxvl0PLY40DX/4+zbYbeNlUyadhLx6paXUPZtEZjspuD?=
 =?us-ascii?Q?pqsPvTWbOtvXNa7fVnmJaldnutKMS9gakA1ON652y+sYasQTysI0ZCdGxmUs?=
 =?us-ascii?Q?m/nM56oiMK3maF6H9AUmpQ5DmlHMopXp3GuERpBKCzgpl0DBKoYWaBb1FDl5?=
 =?us-ascii?Q?LVnkDLzq6Uge3eegmZqQT3jtL0vJFZocDhqH3RytSFMcK7kKBtzwc14l5Geh?=
 =?us-ascii?Q?CGKknQnkSv6lZkg/Ri9B5ykwV4cXj1/L3HjgG0OT/ia7vslVKZq2jmvHbGYT?=
 =?us-ascii?Q?kpEmbcBmgIpctp0Za6pE4ZoUcwUcuiQ1OHcCXktm0pyVlBtfzWShtz7TLVwH?=
 =?us-ascii?Q?GA0RNlJERdexmu9p2HguLfSj/bZsLR4nQLtTqHstQbMDilg+HZxykoOY0tT5?=
 =?us-ascii?Q?8T7+jwRofbchbH0r8AyxXiEPJjOdK/XQRYIZfxyds6IdhZKejaqVcnsNG4WM?=
 =?us-ascii?Q?p838RBRerHY8ElNhAG5ytJfGJP2Y2lAE/mkHmi8Er1geXnccSiymblfCHKEa?=
 =?us-ascii?Q?WtrcVzryeiIbhEs7ugPkP+RPQX+pEHgkXHmYGuE2uLBUU6Nl6l3FzOZd06lg?=
 =?us-ascii?Q?s9iRZdMOcZ9sHi97mR5witt+FEiQISSHQW2hQtPXHJ4siBg+?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe9c4cba-a584-4d22-704f-08dec0258078
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 21:34:03.6533
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t4mkOVJZRtoNmRYHUkJ18QXJAc4ILjTMhcUyJc+k8c4BEC2OB4GuwxrKI+M5khZT/wyCGxyEQAP0fnPzqs7KhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11303

On Thu, Apr 09, 2026 at 11:01:25AM +0200, Florijan Plohl wrote:
> Add overlay for the PHYTEC Audio/Video adapter module PEB-AV-18 on
> phyBOARD-Segin-i.MX91/93 boards. The supported AC220 display is
> Powertip PH800480T032-ZHC19 panel with a backlight and Ilitek
> touch-screen controller.
>
> Signed-off-by: Florijan Plohl <florijan.plohl@norik.com>
> ---

Can you rebase it or provide base commit id?

Frank

> Changes in v2:
> - Link to v1: https://lore.kernel.org/all/20260402070826.970012-1-florijan.plohl@norik.com/
> - Improve commit message to clarify what PEB-AV-18 is
> - Move imx91-phyboard-segin-peb-av-18 dtb entry next to
>   the other imx91 phyboard-segin definition in Makefile
> - Introduce common imx91-93-phyboard-segin-peb-av-18.dtsi
> - Adjust drive-strength values
>
>  arch/arm64/boot/dts/freescale/Makefile        |  6 ++
>  .../imx91-93-phyboard-segin-peb-av-18.dtsi    | 93 +++++++++++++++++++
>  .../imx91-phyboard-segin-peb-av-18.dtso       | 57 ++++++++++++
>  .../imx93-phyboard-segin-peb-av-18.dtso       | 57 ++++++++++++
>  4 files changed, 213 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-93-phyboard-segin-peb-av-18.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-phyboard-segin-peb-av-18.dtso
>  create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-18.dtso
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index bae24b53bce6..574960280744 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -416,6 +416,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-frdm.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx91-11x11-frdm-s.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx91-phyboard-segin.dtb
> +
> +imx91-phyboard-segin-peb-av-18-dtbs += imx91-phyboard-segin.dtb imx91-phyboard-segin-peb-av-18.dtbo
> +dtb-$(CONFIG_ARCH_MXC) += imx91-phyboard-segin-peb-av-18.dtb
> +
>  dtb-$(CONFIG_ARCH_MXC) += imx91-tqma9131-mba91xxca.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-9x9-qsb.dtb
>
> @@ -441,6 +445,7 @@ imx93-phyboard-nash-jtag-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-jta
>  imx93-phyboard-nash-peb-wlbt-07-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-peb-wlbt-07.dtbo
>  imx93-phyboard-nash-pwm-fan-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-nash-pwm-fan.dtbo
>  imx93-phyboard-segin-peb-av-02-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-av-02.dtbo
> +imx93-phyboard-segin-peb-av-18-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-av-18.dtbo
>  imx93-phyboard-segin-peb-eval-01-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-eval-01.dtbo
>  imx93-phyboard-segin-peb-wlbt-05-dtbs += imx93-phyboard-segin.dtb imx93-phyboard-segin-peb-wlbt-05.dtbo
>  imx93-phycore-rpmsg-dtbs += imx93-phyboard-nash.dtb imx93-phyboard-segin.dtb imx93-phycore-rpmsg.dtbo
> @@ -448,6 +453,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-jtag.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-peb-wlbt-07.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-nash-pwm-fan.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-av-02.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-av-18.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-eval-01.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phyboard-segin-peb-wlbt-05.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx93-phycore-rpmsg.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx91-93-phyboard-segin-peb-av-18.dtsi b/arch/arm64/boot/dts/freescale/imx91-93-phyboard-segin-peb-av-18.dtsi
> new file mode 100644
> index 000000000000..53d5cbcd798b
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx91-93-phyboard-segin-peb-av-18.dtsi
> @@ -0,0 +1,93 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2026 PHYTEC Messtechnik GmbH
> + *
> + * Author: Florijan Plohl <florijan.plohl@norik.com>
> + */
> +
> +#include <dt-bindings/clock/imx93-clock.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		brightness-levels = <0 4 8 16 32 64 128 255>;
> +		default-brightness-level = <5>;
> +		power-supply = <&reg_vcc_3v3_con>;
> +		pwms = <&pwm7 0 5000000 0>;
> +	};
> +
> +	panel {
> +		compatible = "powertip,ph800480t032-zhc19";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_panel>;
> +
> +		backlight = <&backlight>;
> +		enable-gpios = <&gpio4 29 GPIO_ACTIVE_HIGH>;
> +		power-supply = <&reg_vcc_3v3_con>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&dpi_to_panel>;
> +			};
> +		};
> +	};
> +
> +	pwm7: pwm-7 {
> +		compatible = "pwm-gpio";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_pwm7>;
> +		gpios = <&gpio4 28 GPIO_ACTIVE_HIGH>;
> +		#pwm-cells = <3>;
> +	};
> +
> +	reg_vcc_3v3_con: regulator-vcc-3v3-con {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VCC3V3_CON";
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +	};
> +};
> +
> +&dpi_bridge {
> +	status = "okay";
> +};
> +
> +&dpi_to_panel {
> +	remote-endpoint = <&panel_in>;
> +	bus-width = <18>;
> +};
> +
> +&lcdif {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lcdif>;
> +	assigned-clocks = <&clk IMX93_CLK_VIDEO_PLL>;
> +	assigned-clock-rates = <27272728>;
> +	status = "okay";
> +};
> +
> +&lpi2c2 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	touchscreen@41 {
> +		compatible = "ilitek,ili2130";
> +		reg = <0x41>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_touchscreen>;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&gpio4 1 GPIO_ACTIVE_LOW>;
> +		touchscreen-size-x = <800>;
> +		touchscreen-size-y = <480>;
> +		wakeup-source;
> +	};
> +};
> +
> +&media_blk_ctrl {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx91-phyboard-segin-peb-av-18.dtso b/arch/arm64/boot/dts/freescale/imx91-phyboard-segin-peb-av-18.dtso
> new file mode 100644
> index 000000000000..35edf9b0fb0f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx91-phyboard-segin-peb-av-18.dtso
> @@ -0,0 +1,57 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2026 PHYTEC Messtechnik GmbH
> + *
> + * Author: Florijan Plohl <florijan.plohl@norik.com>
> + */
> +
> +#include "imx91-pinfunc.h"
> +#include "imx91-93-phyboard-segin-peb-av-18.dtsi"
> +
> +&iomuxc {
> +	pinctrl_lcdif: lcdifgrp {
> +		fsl,pins = <
> +			MX91_PAD_GPIO_IO00__MEDIAMIX_DISP_CLK		0x57e
> +			MX91_PAD_GPIO_IO01__MEDIAMIX_DISP_DE		0x51e
> +			MX91_PAD_GPIO_IO02__MEDIAMIX_DISP_VSYNC		0x51e
> +			MX91_PAD_GPIO_IO03__MEDIAMIX_DISP_HSYNC		0x51e
> +			MX91_PAD_GPIO_IO04__MEDIAMIX_DISP_DATA0 	0x51e
> +			MX91_PAD_GPIO_IO05__MEDIAMIX_DISP_DATA1		0x51e
> +			MX91_PAD_GPIO_IO06__MEDIAMIX_DISP_DATA2		0x51e
> +			MX91_PAD_GPIO_IO07__MEDIAMIX_DISP_DATA3		0x51e
> +			MX91_PAD_GPIO_IO08__MEDIAMIX_DISP_DATA4		0x51e
> +			MX91_PAD_GPIO_IO09__MEDIAMIX_DISP_DATA5		0x51e
> +			MX91_PAD_GPIO_IO10__MEDIAMIX_DISP_DATA6		0x51e
> +			MX91_PAD_GPIO_IO11__MEDIAMIX_DISP_DATA7		0x51e
> +			MX91_PAD_GPIO_IO12__MEDIAMIX_DISP_DATA8		0x51e
> +			MX91_PAD_GPIO_IO13__MEDIAMIX_DISP_DATA9		0x51e
> +			MX91_PAD_GPIO_IO14__MEDIAMIX_DISP_DATA10	0x51e
> +			MX91_PAD_GPIO_IO15__MEDIAMIX_DISP_DATA11	0x51e
> +			MX91_PAD_GPIO_IO16__MEDIAMIX_DISP_DATA12	0x51e
> +			MX91_PAD_GPIO_IO17__MEDIAMIX_DISP_DATA13	0x51e
> +			MX91_PAD_GPIO_IO18__MEDIAMIX_DISP_DATA14	0x51e
> +			MX91_PAD_GPIO_IO19__MEDIAMIX_DISP_DATA15	0x51e
> +			MX91_PAD_GPIO_IO20__MEDIAMIX_DISP_DATA16	0x51e
> +			MX91_PAD_GPIO_IO21__MEDIAMIX_DISP_DATA17	0x51e
> +		>;
> +	};
> +
> +	pinctrl_panel: panelgrp {
> +		fsl,pins = <
> +			MX91_PAD_CCM_CLKO4__GPIO4_IO29			0x1133e
> +		>;
> +	};
> +
> +	pinctrl_pwm7: pwm7grp {
> +		fsl,pins = <
> +			MX91_PAD_CCM_CLKO3__GPIO4_IO28			0x1133e
> +		>;
> +	};
> +
> +	pinctrl_touchscreen: touchscreengrp {
> +		fsl,pins = <
> +			MX91_PAD_ENET1_MDIO__GPIO4_IO1			0x11e
> +			MX91_PAD_ENET1_RD2__GPIO4_IO12			0x1133e
> +		>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-18.dtso b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-18.dtso
> new file mode 100644
> index 000000000000..11f7d7502be4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-av-18.dtso
> @@ -0,0 +1,57 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2026 PHYTEC Messtechnik GmbH
> + *
> + * Author: Florijan Plohl <florijan.plohl@norik.com>
> + */
> +
> +#include "imx93-pinfunc.h"
> +#include "imx91-93-phyboard-segin-peb-av-18.dtsi"
> +
> +&iomuxc {
> +	pinctrl_lcdif: lcdifgrp {
> +		fsl,pins = <
> +			MX93_PAD_GPIO_IO00__MEDIAMIX_DISP_CLK		0x57e
> +			MX93_PAD_GPIO_IO02__MEDIAMIX_DISP_VSYNC		0x51e
> +			MX93_PAD_GPIO_IO01__MEDIAMIX_DISP_DE		0x51e
> +			MX93_PAD_GPIO_IO03__MEDIAMIX_DISP_HSYNC		0x51e
> +			MX93_PAD_GPIO_IO04__MEDIAMIX_DISP_DATA00	0x51e
> +			MX93_PAD_GPIO_IO05__MEDIAMIX_DISP_DATA01	0x51e
> +			MX93_PAD_GPIO_IO06__MEDIAMIX_DISP_DATA02	0x51e
> +			MX93_PAD_GPIO_IO07__MEDIAMIX_DISP_DATA03	0x51e
> +			MX93_PAD_GPIO_IO08__MEDIAMIX_DISP_DATA04	0x51e
> +			MX93_PAD_GPIO_IO09__MEDIAMIX_DISP_DATA05	0x51e
> +			MX93_PAD_GPIO_IO10__MEDIAMIX_DISP_DATA06	0x51e
> +			MX93_PAD_GPIO_IO11__MEDIAMIX_DISP_DATA07	0x51e
> +			MX93_PAD_GPIO_IO12__MEDIAMIX_DISP_DATA08	0x51e
> +			MX93_PAD_GPIO_IO13__MEDIAMIX_DISP_DATA09	0x51e
> +			MX93_PAD_GPIO_IO14__MEDIAMIX_DISP_DATA10	0x51e
> +			MX93_PAD_GPIO_IO15__MEDIAMIX_DISP_DATA11	0x51e
> +			MX93_PAD_GPIO_IO16__MEDIAMIX_DISP_DATA12	0x51e
> +			MX93_PAD_GPIO_IO17__MEDIAMIX_DISP_DATA13	0x51e
> +			MX93_PAD_GPIO_IO18__MEDIAMIX_DISP_DATA14	0x51e
> +			MX93_PAD_GPIO_IO19__MEDIAMIX_DISP_DATA15	0x51e
> +			MX93_PAD_GPIO_IO20__MEDIAMIX_DISP_DATA16	0x51e
> +			MX93_PAD_GPIO_IO21__MEDIAMIX_DISP_DATA17	0x51e
> +		>;
> +	};
> +
> +	pinctrl_panel: panelgrp {
> +		fsl,pins = <
> +			MX93_PAD_CCM_CLKO4__GPIO4_IO29			0x1133e
> +		>;
> +	};
> +
> +	pinctrl_pwm7: pwm7grp {
> +		fsl,pins = <
> +			MX93_PAD_CCM_CLKO3__GPIO4_IO28			0x1133e
> +		>;
> +	};
> +
> +	pinctrl_touchscreen: touchscreengrp {
> +		fsl,pins = <
> +			MX93_PAD_ENET1_MDIO__GPIO4_IO01			0x11e
> +			MX93_PAD_ENET1_RD2__GPIO4_IO12			0x1133e
> +		>;
> +	};
> +};
> --
> 2.43.0
>
