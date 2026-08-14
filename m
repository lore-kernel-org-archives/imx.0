Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013004.outbound.protection.outlook.com [40.107.159.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD923F926F
	for <imx@lists.linux.dev>; Fri, 14 Aug 2026 07:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692048; cv=fail; b=eB6NDZXlbptJpYVs8niYQXtwaNQS0+/JcsGSG/xoqpGBlIlLymaE/mlmt6G0LKUm6ERBdyyp169F9X2OAPcSi7O4G+469io2f6UnonZd+ECJfiFIXZCPI4KhTylaOwMFFvlRo3qS+TkrHpXJm+qzVgqkiybbmNU5sKhhJRBHrjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692048; c=relaxed/simple;
	bh=lO6+8JP/5itsQwgcnohkZClbise7bAlm6teP+wj1Tag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Gl3EBGcupWGskQTq1jrNKGClOH22Z7VSa0yI6EVQO9DrvB7fIr6Qx5VAAmyac0T5Qeo9//+S1zlGXccKDVZD0FAlvDMgzGCTPuimaJnu9FM9HD1NnXeCszBcvnkYFnV60YZP/AJcp14b21K/wn2GQFmJAv+jqj34oYD3EDAnvJo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bxwTCOY+; arc=fail smtp.client-ip=40.107.159.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bxwTCOY+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JeCUY/45lUar2wlwi8NNHiEEnE1s8oz0kIQaLl4XwXwMBgPHidW1IgJa4C+LiQ2p/nYwLiJRktLug6ZTskYVQ4Xw+mig+W60diQR4g7eQEnnqEgAZ6Ru11+lGcfkG90sMcNWxax4YAsM9IbVygE8zy9RjNPtm+W5yPSfmTo/uDzWbpvcxHLeciGS+bae/49P/tgSX/ZnIDl0HHlSRLdrCzsupdSx0uWfznMmfvxeYd2FbUjwctbpJ2VQ8zg38SlL6l1IihiR1ae2J0m6l9+wlX7rgEPetEHmFDXCDlPqVcu4kHzO6EJIddAERlw+Iwn2w0ZspMcrsWe3jxhoMBvxHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D+q5vVy3/mHMMRg8yJeHxHFAos4TmuZ4TO7+Jg4SLdw=;
 b=C6+XxEuKUkbeFATrMSlHAMV8Y7N3pydyCEyYNwzk+ttyPYIupsalOXinBqaIF7/gyadNO+QuoTpoUKqUVhdw80CA7hiIB618nKRg0BOi2OK9lbTRjCfuwvroEZjukt/JpCmuh87E62SVVlCg3tLbuUffBN+6W8XZ2OsBFF/2t4uJYLdsAQC35hxRg9K+rS4CyVHWp3i2rA59s7+vIQ9h37jKu4xmwRIO0UQ0IW0JzA3mxVtqcMZFLi4YaFl/Rs1b5pGI+CPzxkz7ZNI7XOP2gKT9nCvDUQcz1qnjK3+UyF8TsIEDQrchEoPXb4FUpqRUXGMiMGQYBnbzY+Zd8SWEpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D+q5vVy3/mHMMRg8yJeHxHFAos4TmuZ4TO7+Jg4SLdw=;
 b=bxwTCOY+i5UCR5Tryc0Vn9cvXKLUOcpQ13/X3sjFRBrSNU+mi33HxRCvsMpibD0ApV6wqWh62FR4x1ZMjxNe+2FaDOc7S9Aig7nzvnoNaZCFgE/sW/xYBvGAieG8CHiJtFG6YcEznJ6GRZuugDeZEqZqCUMmVXCRX9pV63jSYAP3LeIRsVrS9J4PEY1kQhh6UPquZMdPC8J+KRo08ChIrbjJLMBfrc34T6wZAtaHbLBS7s8rHWrKNEScOdCPGHEVY3QXDmdgz+GGuD4GuQfUQ18qAcywiqJxIxtUQKGiSCzIf99KkZJ2Id5IUzG8qEnlak+6O1xGqX+ckCXL7lymCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AMDPR04MB11650.eurprd04.prod.outlook.com
 (2603:10a6:20b:716::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 07:20:44 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 07:20:44 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	imx@lists.linux.dev
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/17] arm64: dts: imx91-11x11-evk: Add board muxes to select between PDM and MQS1
Date: Fri, 14 Aug 2026 16:20:06 +0900
Message-ID: <20260814072022.4064009-3-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
References: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0068.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ba::7) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AMDPR04MB11650:EE_
X-MS-Office365-Filtering-Correlation-Id: f53a4ff2-853e-4b49-7f73-08def9d48db1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|19092799006|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	JHntb8SlMbcyE08KlLtOlv/AfBzrjfrQVqPIVsjbDbJrLMBUksMuzZOP1yo324S2RCoP9PuAnqroVsmw94fqbioIjVo/O/jQO2DQnPvAcCvbpkUH488CgC2YMJC0+i4Yk8zZNr9iFfW8nKAD1UDDvf9sW5WLJhYFzadpOVPIB9+Yr4iQQye4/GYr2J+WsV0V1av6tfpD+xtz+Wl+hh9zkL1DZtRub7IF4b7LhonsvwoNoOef0NXqvwdwaNBxUEihKbIuvpSMpC8CwFln0hyhSVKGsDBLbzTADRcIvmmBJZvKXVTBWV8Bt1LwokRSjdgO/yiqxHFpYZZUYZSXq/8AwcCmlDNLTq/CiBHYgUPDWw+8WRD8P63hzSPExEqU57cmeCPl42emTFL81HaRVZYtzHAqzfErDbSMWpR+T5Ckl8NvLDmauWdfi+EQHvd6NTIgWaGAXZoHyLlHLcfHmg18AOHJVXf0/4elj+lb6mSdIrVSfD9dsFciYUcBwIqDE95tlsyxE3cbyUDXDF5ziMhCQy0QVP3XtSB4bSNYXoUIikwfIzT9+1M0kUAluKMBz31xDAF9aeqWJrbGnAcvz6xXpOpuKWbncJOVDoJMhexCc77W1XbaUAKa7IipooEPvFjND5WljbWycnuiBIrOc9pQgwOjd/gkfOHd68EwUFQiH0M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(19092799006)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KmPEaNab/uZMC7ccvutNCzi/KGERFU9KWVK9w5dWgCHkLOpnOCDv8a3X9gqc?=
 =?us-ascii?Q?Is2PERaFs/xesk6Y+XsizJxB0syzIsxqF2vRmkU4jcddArVWs0m3FQhBRDQf?=
 =?us-ascii?Q?DucdGl7c2Jys21MmoccHL0ZfVXcq91R3rfpTSRKxJWgdji0vt8CyZwx9CBM7?=
 =?us-ascii?Q?UkEidiqNhyZIUJ9mXZ5tud1Fk1WgG5d76dYtfn7uehfqpk3O+rmmBObzBkwV?=
 =?us-ascii?Q?BBwSjrZ0qXM+I/J330NolIahk3sfV95Q/c7kui4YEZfAaUiX38XqireUSxNz?=
 =?us-ascii?Q?nJvflf1pJq8dacQmhab69vhaf1j5k/wDVNGqcoitL+fW9Rf+Vy8cXMyOEPVO?=
 =?us-ascii?Q?4OSdQSEO5FLTZ2x0mmVUyQmMSYmeIrfGKs22RpaUc6dZxhIBtKUZXnF+UUCk?=
 =?us-ascii?Q?mPrAebiYjmA+ux+mnF0tAxPU3mR3ql4vUDOI7fjWcjF/pja2e7D0MVofTH/i?=
 =?us-ascii?Q?JVn4sK5zs1q1KVvjNpbLwTXFT2BeHqaiufXjinQkLgy1zEWxxvOD1No+YSXw?=
 =?us-ascii?Q?WqPLE5+DXv870vzAeO9nfYzQotAgNMPQq35kn+NPQ9s3sBlZEWCrfObkwoAO?=
 =?us-ascii?Q?27ieqw4/JE6jG8hroqinATl5lL3qkzcRndEeHvJ0G0gC4Djit8q9Jq7RAkMY?=
 =?us-ascii?Q?x83zz0pe9ccWdBXDNMh6R3PIp3nrxuk2NhgSxDNXr5H4lbTKKa1Ibq0iCTGU?=
 =?us-ascii?Q?Fg+oHMkVDmQx0q3thZA9kjXNEsiLhXWkgZ9elukepKXEHu1xZzom053GljQe?=
 =?us-ascii?Q?RZ0ZMaproJoXBnE+YFcGim/U9DmgvoCCTKDT1JsQ3fXs67a4vbKpmfoeXC6L?=
 =?us-ascii?Q?WRDFEHjgAeKmLdSyukxiiq+v9bYVkZSei25tuac5YJJ4Nn5JciTZc/kuVb3j?=
 =?us-ascii?Q?K9A9+Ki9vlvzgnfuGuLg4HGDufPyadGaKcEHA+8Q2wdL8Ye+cHSHukPQNs7X?=
 =?us-ascii?Q?t9nAZ2711kEI3KCIqxZCD6gEiCJvs4VWc/tmB9R6N/1pQMPNF5jJgel471u8?=
 =?us-ascii?Q?U2mveO/7SPcdTTpAoqHApaIjx3kOpGpIK/t7kgqMezO6Mu8IhN3miHItN9II?=
 =?us-ascii?Q?ggpzmcz2ofSBvjDDyaMYwn3x0xB61iLgLVoF6ngezqzOU7HRJjfg1eZFDtvI?=
 =?us-ascii?Q?lv5oeFiVL83YZqQ7+xs/b8Z08Buye6kksD1WNGj9zYnS7GG6NlQGwTAa32aG?=
 =?us-ascii?Q?WPsDcCBNZMeQm0SFX6d5Wrs6Tt7zzWgMKV6v0K4y+iblPDMNk/eFEB8kgZmD?=
 =?us-ascii?Q?Xfu+F3kotjhBP+QseS+5newh1GKWpRWTDLr4txk4JVkbrYTmfTOh0sM+j0Lq?=
 =?us-ascii?Q?Q2K1GNm1ujY3kNmCdN0aSbnm/XmJ5B97TYTpXfjeAhtuusmAr1Nq83o2jixo?=
 =?us-ascii?Q?0PDEpDxFTyiwC9AY7gPUafSbY8NVVYWdEF2rTZjJVpKksUaopshz9e0AUUMa?=
 =?us-ascii?Q?QB35dbUwFP/Qw5uqaCuRx9enVGBsQA8sL36Ncso9eMiiBhN8hfY7LfVZ6w81?=
 =?us-ascii?Q?xez11jC1NkObNH98qG9kR35NBFbVl91fcTwXZ5TAfYjdzocAqsQcfBN5kbJa?=
 =?us-ascii?Q?Ah4BEKtvKEjsu9zdO2pGdTQ5rWQNCuSiFa4FqHsR4FcwhHYmk3gur15Fg1ZX?=
 =?us-ascii?Q?C808JXlTuR/2LxrWohtHUYk6NAMo/CYgOIUOEHzUXkh//EFClF8wC5Nc9ptW?=
 =?us-ascii?Q?xdCfGWNbcobMQkcPaJrWxUv4bfSn5BOm6GV2DxGIPPtaWyaz1bIFY4Q/Y8Vb?=
 =?us-ascii?Q?SUwe1HU55MUeprlArWR7DRdEKcmRuPUcv53tdj0byom46OgRV8Sv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f53a4ff2-853e-4b49-7f73-08def9d48db1
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 07:20:44.0733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1R5hG/r2zNQXwJrJVAMRPKMQ6HVWYKUgzFqC9ZLyKMI2N2eX2EZ5e6IcZVsoFn8Ig1mKQLhEZYZ9dc2Udfe8U36JSpBRVJktBy7DPPtGBvnwiIG5WMrJkB2KWOL4q9wh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11650

From: Chancel Liu <chancel.liu@nxp.com>

PDM has pin conflict with MQS1. Add GPIO-controlled board muxes to
route shared signals between PDM and MQS1.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx91-11x11-evk.dts    | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
index 5716febb5a50..4d1ada6a3942 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
@@ -41,6 +41,25 @@ chosen {
 		stdout-path = &lpuart1;
 	};
 
+	pdm_mqs1_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&adp5585 2 GPIO_ACTIVE_HIGH>;
+	};
+
+	pinctrl-gpiomux {
+		compatible = "pinctrl-multiplexer";
+
+		mqs1_fun: mqs1-grp {
+			mux-states = <&pdm_mqs1_mux 1>;
+		};
+
+		pdm_fun: pdm-grp {
+			mux-states = <&pdm_mqs1_mux 0>;
+		};
+	};
+
 	reg_vref_1v8: regulator-adc-vref {
 		compatible = "regulator-fixed";
 		regulator-max-microvolt = <1800000>;
@@ -484,7 +503,7 @@ bluetooth {
 
 &micfil {
 	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&pinctrl_pdm>;
+	pinctrl-0 = <&pinctrl_pdm>, <&pdm_fun>;
 	pinctrl-1 = <&pinctrl_pdm_sleep>;
 	assigned-clocks = <&clk IMX93_CLK_PDM>;
 	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
-- 
2.50.1

