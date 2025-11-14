Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013003.outbound.protection.outlook.com [52.101.83.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C934D32571A
	for <imx@lists.linux.dev>; Fri, 14 Nov 2025 15:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763135425; cv=fail; b=JzkHKpe/1uukFYFKScXxnELHzBD3aKW2jUTXsUYfYWR2nnF+iipRDOE6X3d/jEKpfrjf5XrigBbpQX1PxpHiFjF5kLPc+1+lZSY5jWfH/hzlhgsXMCnqrHGP6o6H2jiwofHFxuvZiE+F/Im8+rJTqPBn88+1LUcOX6PRgzDb8aE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763135425; c=relaxed/simple;
	bh=ylYMehpwodmABGBfuEuG1qdNkimGe0QdT7pbAMnsoSI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=MHcWM6/iaor+NMuc7Fa+VPmAzVWVZCYZZmtkiVv4+lDv0NPjtYrLq/Zr/J9IcgYGk5u/O0jpi9iYhX6EMB97NNEF+9ufoHrisSJUAgdbjmwlMnW2DMcsjdcfXXh4iSFaZdWFJJsq7Tk4KHF3HctYQpWPGKGZq+AZmAfEc6CTouE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fyOk3cz4; arc=fail smtp.client-ip=52.101.83.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fyOk3cz4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KtqB5wFXFvQuoDk656g6TYI6PLdRApSKzViolzxiEaLCBpWhI/isXbTeixBp1FMwcPxX7fzjeKuNEbyLv44xmAVdnN2VhQr6u+4meNTEJ6jygw6vgiAF4iGhA3UGblpe2jAQDtX6tQk/A2lSIn6kuQcwm4N3tV1rDmAxtxlTI08LsFUnvZTNQcbdP4nVoP+m2Zc2u/V+eNaBFRTvB2esotYFPXwnkk7AbU7trtDycSWiP5f6VtsUIkQGBbKPZFS+8zX9Bg3ji5tFSXHDrrK3dzivm4YZt7d+Ad9QhSEByBkMhj6JEy69AtrS9MMh0kO3cPiVJZh5Ofty7sPQbu3S+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSLBkDH9ANF5S0xRj7XgJa99+b7rUYn+w0Z8wMWA58E=;
 b=fx7R2kBeEocNFK2VvlF3eFNocxhk3cl1maHreS3fiwhDvx0e0iVoBECl9LEpfol2+ZGceYoecx04iLycZRM47sg5PaiWX0V0gk1HRsdOethwWi0lO0X/DVLJd2Wr//qG1C0Z02mKM7eOy46OuO7rD3jRsewgTebQKj/Pv9BYeFbp1rznkBV/vNo1x9SvymwNFSD67bj8VoLWAYZZoPzxUkn7uZ37WqnMw4kraW9a0nY3xGbNcVtiXZ637q7TLK0Z3dNjT17ZJc/F6K3ubO8W9Q0zyTAScFnz4dOCLZenZOmcAZcNJ5Hdm+V3Z5205I3HFFXfCa82P0oUhpqA17WZhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSLBkDH9ANF5S0xRj7XgJa99+b7rUYn+w0Z8wMWA58E=;
 b=fyOk3cz4nmc8Ds09oxcWqbVgUoDLUIObLNAY792hFcvdVy6ZdDFcBxlwCoQQkdTEGDn6ix0tq14jzMkXL0m/GbCuZ40aU7MT4O9x3jexFHhv5Rd8pzOFPGyRF97FAmSb1KZPxDW5mPAjfhh4CFD3raaJ1ZQUFNdVwfsFB8B38/ke0n5v9JdGGLePZJ3CXKrkirQreRDIbGWaZAv/z1m6fk1MASN3o70lYBRQ9jltuNl03SXiuh/7nPkyg/mEDCtNkDxrIKRuTQPakm3xGBepK/v7UUuUpLNOO+hBafA8Q82y1ms4Cd6LunwmxwY/FqnhR5OfFsMxIdT2tUtLeMv5Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by DU4PR04MB11816.eurprd04.prod.outlook.com (2603:10a6:10:626::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Fri, 14 Nov
 2025 15:50:19 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 15:50:19 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] arm64: dts: imx8mp-evk: add camera ov5640 and related nodes
Date: Fri, 14 Nov 2025 10:50:01 -0500
Message-Id: <20251114155001.1195702-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0027.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::40) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|DU4PR04MB11816:EE_
X-MS-Office365-Filtering-Correlation-Id: 6554cee6-21c3-4d41-94ac-08de2395836b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|19092799006|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x9p2w+ooeYXWTIlCeCcC4bcoQbnVf6rZcggZ0Uo5A0PeSwp2vkYUXzQoUJne?=
 =?us-ascii?Q?sPiSBF5HjsRnYG2cCLt7fBi9LwvtOeyMQCY4Uv+XVZRQh1UAklGnjSMGpzb4?=
 =?us-ascii?Q?vsSFBvpQnYHMqb9kRkizAp0qWmUouAnjpL85A2hnWJ/idX4yhE2HZA38xEiR?=
 =?us-ascii?Q?0HH8SIEUMryRaksmFMLzRM9gEw3aI9S7cDTwV+tfUSoVUctnaZNyRSyWnJPZ?=
 =?us-ascii?Q?/obW0vMkiSVEEcA+qOPhJ945QCk1hO0Wwq0wpVDnIfrOVazSv0nsLy9Mclu6?=
 =?us-ascii?Q?ffRC7CRZ8n5DmimfcxBIJekV60tGEjhHoiBr/uy0WH9Hu2Nhbtd5+1M8MjbS?=
 =?us-ascii?Q?sR7lmIidhJvyEwU6InJp8WaWKGn4w/w2Sre+645HVp0E5CPFFzB2eW8Cj7yR?=
 =?us-ascii?Q?Z+VMIy4wOjvyTH0wCDrDHGLth/UfU8LXJxFc9bwlg3kmjYeYNjfD4eAwsXDQ?=
 =?us-ascii?Q?OLZNuVH+MUAVMVu3JvEtEnXt4ICHxrTKQMih4qFJl1eDE642CPcn+sEIA0oE?=
 =?us-ascii?Q?traDoMjp0sNJBI1Odp06Lg7UWZhQtDV/wMcczm0UVbHewKCEXAvg97gBn3Fc?=
 =?us-ascii?Q?AQlnRc9Fg0fjMJzBCnvU5ZTi4ex2N/PyW+RVMchUK0Juqx/sfU0Iw8lPetTM?=
 =?us-ascii?Q?+5j2chvdTXhFznOOWtIhdb1UZAwvGAbEXarxy8C1h0G5aWKnJ70DA7L7krVU?=
 =?us-ascii?Q?/WadiGAgCdsASbdeX2qNOlclM4L0zQQCarFzfZ/dynUBdz/9m5Xk1ezQgKIj?=
 =?us-ascii?Q?tejZ2hZI5HZbz/W0vDJjd4nQ8fNAurEzLJB1emxIAOtKTTu5Wk8LpbVLQidm?=
 =?us-ascii?Q?XtXX44aU0rHMWCl8T6oFXtYkjj75X6o0IJsiooxmOON88Q/pfgBnzkfGWWIE?=
 =?us-ascii?Q?TO7BCs8W9tiU/M8GmgqZ3SDhhapF1sT4LiNPFdX71O/Ig7fvLGLUuz2RJaVx?=
 =?us-ascii?Q?pujFo7jz7dXT1XqlJyblR8zCfqq+hDty51pu1DE6zrxq43Cr+Y6Y7eu5ISpi?=
 =?us-ascii?Q?+fobMbkf6jKttvLRlgYNRZMW6qSs3lnv3DgIOYUvTEATuL/uOh5kmosRhT6C?=
 =?us-ascii?Q?BtJQo/gd94ktMGxINvted7h7h4riSGlcE2q+ETkbdThPNVczH2Qgcq4PFWV2?=
 =?us-ascii?Q?IhoUp+QLBloeqX44WzesjCNvGm1KwZ7OtOTlQiW35qPfMAYm9SzVCK2sdJs+?=
 =?us-ascii?Q?3+VUmuWK8LJc9qlmFrrpNkNSQnrPLoqmBKuA1YY5pawdgNHGmmrKyz2SONrx?=
 =?us-ascii?Q?eqOrJ12IPsmvMtPi0FQrRZrauEKceSYUsBXrUTL5XiqlPDm4r08jM8n5q3XA?=
 =?us-ascii?Q?J1OF3pZsXJwFi5H0udZpgNedCkXqlDiz7RlVdLI4nfz8bBGg4NHBo2B3vr74?=
 =?us-ascii?Q?tt32zbmw4xnkXINK6PAC2ddFKLaQAD/aBVnyPhygNgyMjsIEzE1rTqq5MXbe?=
 =?us-ascii?Q?BVmLxZQLQiiNwcKphPdlBHFmUgrZoFtgrhXQcdntEvlurr6FR7Qdzj6Glrsq?=
 =?us-ascii?Q?9VYKgmFmDofCIGuH9IdyCGfdZMR49Ke467PKtoGeFdzlBvsbia0VWhaJ3w?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(19092799006)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8QnwVrU1sZ5oTXTsY0KtkOhX1wcxei8c5zGwbEXfIREuMaBDN2ofDNNKh37I?=
 =?us-ascii?Q?snzE4rE7CGnMIBxhhHwqVjXtjGqd4ciBiGt4xtiDiqvq/hWZhFN7uDbfJJWu?=
 =?us-ascii?Q?MQm7PegjBhiZdvCaidznlU0a+hIpZ+i2uemQUmW3Bg/K7AwYp0uluwH1HMzx?=
 =?us-ascii?Q?bDRU3rFgmIZE/gawXH1uRu1SFjOdk+v6iCbv9qFKU58xTs/yYvbZmwzPgVG/?=
 =?us-ascii?Q?gH3udwFIXtrHjtsGYwOVgkdA0qWAL9lJRUrSlBEMOcJoLeLcZZ3rn7zzl+Fe?=
 =?us-ascii?Q?i8hsRQVDi2DeCF23XanK2/2Tlq0u4ZEx6GZjjF2/XNRN7mtcAmoTnqiuDnJ5?=
 =?us-ascii?Q?EwzcpZbsxNpu+R6VOUcow8XwexZwvh44Eajo8vERaj85OcO3aV2DULHNp/Ch?=
 =?us-ascii?Q?QogaXk05qqUuYdmsCvABnxgqwx0l02GXk7jF1dyo7RUFS7H5WWlWw58UteUJ?=
 =?us-ascii?Q?82T21/uECuRDTnWvKS2nDiksmPSrccDmgCIWSqd7oqys8pQmpy6COmtw8jlT?=
 =?us-ascii?Q?vF0BmQOQz4fOU5tQVpQ6LPj6ByLxiZbfiK+kd9SvIKlYSy/vIcfolc5/3pWy?=
 =?us-ascii?Q?jFjXamjlsH+bsThWYMdlpEABNphl7p2AEKb7LMmOkBDc5cbaP817tgBQzm6y?=
 =?us-ascii?Q?jHgxZwEvrLqZwKjlPBs382lhbdqSc936kXjNvQh/bByMclGFxEKbBYb01J+j?=
 =?us-ascii?Q?+D63mowsopApIjqoXlOl6HnfO9Odn5tGEUxMMCOaSf4WivrIKTearD5Xyefd?=
 =?us-ascii?Q?+gwJsrxh0tkoafxSyFF8cjgJl29mYWLREGox02Qd+bNqPEoR+Bhh08F/agI/?=
 =?us-ascii?Q?aP74lk1WNcE2kbUN6lZTt4gTfRk4V01GL116HMmJsdYpexUXLyOdYv0s3DWo?=
 =?us-ascii?Q?OUXaQ5EW+YjrIfj5euzdW9Suk2Ewi0HhURdGNTG59ZAxU7fw5luOdWbNCdDc?=
 =?us-ascii?Q?XpFFHbW7zHHmRyNZme8HANPxd/bZM4h+fuV8Z1+MPrdUd39yrExuSdksO0Pi?=
 =?us-ascii?Q?nTFpxECUJGKxb3MYxRjRRP5iLj0fVSlu2NanMtDR9ZwKXo0ekoSBY83d0XJP?=
 =?us-ascii?Q?zQla3B0pJMdLbiq6Jqipkx63DiHd981rAs9RPQAmf6qEIIHNg0hocanSWxcz?=
 =?us-ascii?Q?FH9dEDlgC2mQ4vNQBjRTcPnBxNaG41cTAviefQ6NfZZMakLF3Uf8lWoxvOUu?=
 =?us-ascii?Q?y8xBoYj2BuRYQoZCHLTRsNx8+ao733pe3WmhuD3EH49g9YqLihpuTlAw8jBK?=
 =?us-ascii?Q?NoAaGV7gNX1/FqCJC9AdBEhEGApcwRAXDGa1CeZo8DFCeLTWr7gZdybk0+Mj?=
 =?us-ascii?Q?gCnOC5wEhBkKJgRXVjDLPhpK8DgICyzKCO/5R5uKPM1KNtakOeDak3rToo1M?=
 =?us-ascii?Q?vzpZT/jy7helvf/hj3DW2cnR+tVUoHPUGEjvs+fxVmEEclyTVSH4jiG0S5ui?=
 =?us-ascii?Q?0Q+DyR9FoVauTIGBV3DYQm9lU9GL4hvSIjlXyJxB1upG9X3vxBn4BubXTmay?=
 =?us-ascii?Q?Y/G6V1WPhuM3WlRsWn7g09k6DfZg5aCsMzQx+2+ZFvYZvAPxTSvcpoYLOrCn?=
 =?us-ascii?Q?t7rcXxA7O1QvDtoJPHxOvxtjs7ihC3CzmM41ptnS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6554cee6-21c3-4d41-94ac-08de2395836b
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 15:50:19.7298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: flz+10TfvAjxX/zRe2lfPTx0CgI7y6adCWtFzhbOEAHklOzFoJ4vCmIgO56vNBDiKP2hwYJzZ8anTP2jbcx+Kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11816

Add camera ov5640 and related nodes.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 80 ++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
index 3730792daf501..f5c19549acce5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
@@ -74,6 +74,27 @@ pcie0_refclk: pcie0-refclk {
 		clock-frequency = <100000000>;
 	};
 
+	reg_1v5: regulator-1v5 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v5";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+	};
+
+	reg_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v8";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+	};
+
+	reg_2v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "2v8";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+	};
+
 	reg_audio_3v3: regulator-audio-3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "audio-3v3";
@@ -556,6 +577,30 @@ &i2c2 {
 	pinctrl-0 = <&pinctrl_i2c2>;
 	status = "okay";
 
+	camera@3c {
+	       compatible = "ovti,ov5640";
+	       reg = <0x3c>;
+	       pinctrl-names = "default";
+	       pinctrl-0 = <&pinctrl_csi0_pwn>, <&pinctrl_csi0_rst>, <&pinctrl_csi_mclk>;
+	       clocks = <&clk IMX8MP_CLK_IPP_DO_CLKO2>;
+	       clock-names = "xclk";
+	       assigned-clocks = <&clk IMX8MP_CLK_IPP_DO_CLKO2>;
+	       assigned-clock-parents = <&clk IMX8MP_CLK_24M>;
+	       assigned-clock-rates = <24000000>;
+	       powerdown-gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+	       AVDD-supply = <&reg_2v8>;
+	       DVDD-supply = <&reg_1v5>;
+	       DOVDD-supply = <&reg_1v8>;
+	       status = "okay";
+
+	       port {
+		       ov5640_mipi_0_ep: endpoint {
+			       remote-endpoint = <&mipi_csi0_ep>;
+			       data-lanes = <1 2>;
+		       };
+	       };
+	};
+
 	hdmi@3d {
 		compatible = "adi,adv7535";
 		reg = <0x3d>;
@@ -660,6 +705,10 @@ &i2c5 {
 	 */
 };
 
+&isi_0 {
+	status = "okay";
+};
+
 &lcdif1 {
 	status = "okay";
 };
@@ -678,6 +727,19 @@ &micfil {
 	status = "okay";
 };
 
+&mipi_csi_0 {
+	status = "okay";
+
+	ports {
+	       port@0 {
+		       mipi_csi0_ep: endpoint {
+				remote-endpoint = <&ov5640_mipi_0_ep>;
+				data-lanes = <1 2>;
+		       };
+	       };
+	};
+};
+
 &mipi_dsi {
 	samsung,esc-clock-frequency = <10000000>;
 	status = "okay";
@@ -849,6 +911,24 @@ MX8MP_IOMUXC_SAI3_RXC__GPIO4_IO29		0xd6
 		>;
 	};
 
+	pinctrl_csi_mclk: csi_mclk_grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO15__CCM_CLKO2	0x50
+		>;
+	};
+
+	pinctrl_csi0_pwn: csi0_pwn_grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_STROBE__GPIO2_IO11	0x10
+		>;
+	};
+
+	pinctrl_csi0_rst: csi0_rst_grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO06__GPIO1_IO06	0x10
+		>;
+	};
+
 	pinctrl_eqos: eqosgrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x2
-- 
2.34.1

