Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010067.outbound.protection.outlook.com [52.101.84.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67BC40B6D4
	for <imx@lists.linux.dev>; Fri, 14 Aug 2026 07:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692122; cv=fail; b=uEA/JpI5iLvLKZg2lJ5b94x/OHrm9XXg+YIy1GS+dfGpB3QDPn9P6ceNHhpCxP6hYnTexnOlHwSnUBvMuvPph3TV6i9FiNR7WdWkOEO+f3cPzFZHQHaFEeVDz8AKruRmjuCpU8+4EaJpSHUliM2VPfLL5Dq3U9oelnL34aExPsI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692122; c=relaxed/simple;
	bh=XpwhU7qVJBsxhul2MA0RKb64QZSyTlkB0FrZZedUx8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Yi4U2bR243KFhVQooS7jsKGEJoatLlzyocJctwEz5Mk2GM9MijNuK2ZiqDalcFcjoPwQGXstmbH4UBPr/L1RtviGVLtIHS1zKYdiPmduxZD2AKNJ1wV4/SUqjQ7TS3snE0zx/GbMejdWTnn3am7YzkQEHGR+tn3X/BE1Bg//6JU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=B6xgRamr; arc=fail smtp.client-ip=52.101.84.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="B6xgRamr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x8axWsKSlB4GSy4aEjdIftMreUQTaJFenw430VmpajiNmVk1beLkzivBTDQodsiKpmepaDmk45l1VDtmUXmziZtlFGw4hylYQwtViTx6GH/M54qY4rC7LLeFRjEXxyq7KLSDjmCwBHU1XtQxfcsNBRoK37VWt+I96l4574mm5xi7AjkXqnf5Xb9KzycJaF1QTYNA0WuQLNNEP+zYDjrXJ3P2xYf25a9E+Dv7qDpx32py0uh/9XVNCZQ1U7uX+TXvo541mMp6faNegrozqWc40DPq7E+lmGyL36qgKv9BT1aQcdEyfs3TPAdNBHPHUKCeCrHjXEornxhSvypYzZQOjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XdRaZ33/gudCCa0mw8fSJ5zYvszJllH2CtHRgiWlYQ=;
 b=wLT+NEQlGhyAxJFJCiAvbn1FFtda1aZ5ZdrC/lr2E0iOHttyzPLLC3jhQcEcDQvXROpUeSO1TCQMIZ6cD36fZ0ZLhXjSbpKlbw8jAl6j3dargqG39UJaFSNuGNTl2e98DBdKhg7gFmH0yj2lTx/KePyVWC7xltAtZeng+Pombds/K/+fTu3e+titRjyQlYvpy8zAfe+GA2DTvNFavAoMdyXiWZDtxtGMakq9rGn6FocJSyRrX6vC964sEl8CDzD7TyBW71idpvstGwKRkGT48aUwhN53u/GpaT13w1jspYLt8WFAAiVojlNy8k9OURuBrB4XFnRQYuM+sRjF/xKmvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XdRaZ33/gudCCa0mw8fSJ5zYvszJllH2CtHRgiWlYQ=;
 b=B6xgRamrApdvwVvlVqYPvgvYzrVN6j6I2bfJ6Ih/QErKY6d3ibsfiIFDx3PxsAyW9Jv01n//caDOhiCn09kFN8g12vlAUH5N/fSKS/+EkGImTS8GBrNa1lJlLQhYMumwp8Y2zpGXZcdhX5gndgxyj1oHvxQX5MKKLzKBmmT5pUtsvOzNxm/geluCW0o/JeXYdiZ5w3juurjhLNagroI/P8qYd2qnxTNXD+NPDTpEwKZGZrt2qcNUeWW9TZl4mJeI5uhv2445emtaDMDuTrgPOjeanBrsw2h9cuHiw35YjjYQeXqOedgy+hj6J01z5V92pDuUhGzBX+qMGNIiK0Wj7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AMDPR04MB11650.eurprd04.prod.outlook.com
 (2603:10a6:20b:716::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 07:21:58 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 07:21:58 +0000
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
Subject: [PATCH 12/17] arm64: dts: imx95-15x15-evk: Add board muxes to select between PDM and MQS1
Date: Fri, 14 Aug 2026 16:20:16 +0900
Message-ID: <20260814072022.4064009-13-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
References: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0082.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bc::15) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AMDPR04MB11650:EE_
X-MS-Office365-Filtering-Correlation-Id: e708b268-71fe-4401-d977-08def9d4b9eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|19092799006|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ko670IIp8ecWnJKhJhQj4hm3Xn+aDEZ8z5lZFXv/irxu1Lu283IVPjYD+5kDvgR0annmSEPINX4+zr+VRjDHQALusXthsmzaU4++MV0ZEzpLw2qI8CreZYm+QRq+5/4vDb55OI/AuevyFObrMBSVKNKQU+mLxw8NRTGC7rYVLeuztEiK4oRIGHGxHvB9SEl65pczKmi2haAl/XFx3YkBtVrpeq6Jg0yJ7thyiPMwfHXn6Fk1e1COU5YmNj900HK6s+Y0tTMXixyOk/GL29K9etGwmdATL9x+egK7PaOTWtSrpKa3+FSmry+rw/JCFnGl1miU5mfxMIE3q6JfsE4ZQgwKzni11hyiW7g+SY5BtL2qJHdG9CdQHaD5xDG5SUUGUBI2HFNhIZD9v1RYKfrk9HsABMVeR3Ng+mRxRrJri56LlSngG5yjJYqXI6SM+GQ8R8/6xmqtAqqsSoV7O5AAfvzP3Im8Bl4bSrVuT2ao30Z4ZeKX5t1ONEDOh7gVxHtSkCnP1j5d5x7Bwb+KqaZfqMe0th3qEVQhYg0wMbfO41v9zzBWou1lCseGk/nSvnnBORsjQg+TRV6cT78YrJ2zu7h/QDhjkZyo5j+3gFgC8hUbKyw7y9W6a7NKkxWq+jpdXMbk7kRqd2QeWeoAH46eVbwLaJJSzP9/KieCwXxDii4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(19092799006)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ynb/YWYbsqBMud6CASsezFXdGVXYGzu37ONpqjj0+j/V2xyi6XyldiiwU4Y7?=
 =?us-ascii?Q?VRjPqVmwJ922FPVnsTW6FgUK6h4nt8xfAhkQk7s3W6AByK/077vjKmYk9W41?=
 =?us-ascii?Q?9jcW/7vLrbUGTem0n/JOvTL9xvWMdzgwrOkQnYLmXj+MaOpDkpun4yWlsf8e?=
 =?us-ascii?Q?fLeB+B7uc0UUPsjXBmPfG02KMbPZ418IpD/idd9FitApw8dNR7SYVQ47i+GU?=
 =?us-ascii?Q?2Sv0Uo1JLfL9rMx+0B8YFohDXF6ugpmNE5Eib/A2s+VhpZg/l+OjgH7+SbmY?=
 =?us-ascii?Q?rPIiTT6aZ8zynGMcXRuI3rxh1s3iBM6JGAYFnK0QPCvTySb+PGU88Vcw3kY2?=
 =?us-ascii?Q?mgrVNN0GqQcY1TnUYKFKKqrUZyGTfAkM2siMJuMm4ooYj3HDrq6xNKErjdCS?=
 =?us-ascii?Q?i1NltPyKmglY+g9Pru3khE5J1BPONx5L1cudnNpuc2SUAiutAvnLSSYYLH+1?=
 =?us-ascii?Q?rLDjN0SZKV80FcuJ8IZuO6GSXz2yycL2o38JlSuZe9lsPwqk5ZeUfzhfEtM6?=
 =?us-ascii?Q?KOdM9eQAm12j9of277cT+isGgOFNQwXPQG21QCAP/zVungvaOLKtPM06+pyk?=
 =?us-ascii?Q?3vkVdSqnZsuH3xj9obedFHdxKgSVt3IJdZoqeaCHyLOzHxzAXUInZEZW5opB?=
 =?us-ascii?Q?hDAYs4S/3hQdKYntLpXT/3g8dwxH6r2OXEq7S5v246x5P4b19i/7bdpv3qTh?=
 =?us-ascii?Q?+IuPyIMiAVl8hb6a2ePMecRjO3vuC5mHrYygpwOV0aDYK66NO3vGD73zDEbp?=
 =?us-ascii?Q?K8dAzrITuKgxPGKAd2seSg/giJ3+s6By1ZcTs6DHeI6MEXhP4CR1wVjQtF7Q?=
 =?us-ascii?Q?rxzm19apmNS85eIDHKFQaKWMdEpBJy+lk4m4Gu1JPwEU1wx3LVnxlzfyUMJ+?=
 =?us-ascii?Q?tgcxMLBU+7Kv1BQAMgMS5J+wr3rcXLyiVYif+/0YNSN0MdOQ8ww2t9dYqZ5X?=
 =?us-ascii?Q?OK88A513IG9SlvJGbzFx75P+6QTGMEU+v+saGhklbCbUUBQhgCqxJy8ysQSb?=
 =?us-ascii?Q?HT3sRk3KQY3a2tYxUQMXmiGA1jYofFnj2UYpApgxIeBv7l5FV5TuMsDw7zJu?=
 =?us-ascii?Q?j0zMYOK32jONsp5Uxuy+HUWECJMz/6vli5coln5nUbCfHe29Td1AAWMiCpA5?=
 =?us-ascii?Q?Fzj/Xu4T6B0d+/7NQmVn5zM/NAa9bhaqtL+KBPxdL81Cq3DuQJXErwMRK48P?=
 =?us-ascii?Q?+hFiznQKJcv/WXm16s9T54TF8VSLMiioQVRXdoI07ggAzdRk2ywbw8ppsQZt?=
 =?us-ascii?Q?5ZfJpSy5IULQDSKBIshwgtslgpbudQxX1Q4QaPAp1jRvpj0O1o9NGypB+AKJ?=
 =?us-ascii?Q?EDYVG+gMrIjCkg1xNIVrX8WfHsArliusIdtsQ143u85J1MiTtzWZe0kx9oqt?=
 =?us-ascii?Q?hLzaswsiLp2XUgS7nw8y+8iS1aC73rEXetRAu7TBWz1jcXbitRulA6WHWGyi?=
 =?us-ascii?Q?eaOitCZcg/molI4NLuFc0fc1z0UU4k58GwVdSDxfcsW5rPQ8RhgbR3HZ06Xm?=
 =?us-ascii?Q?b8gY3U+ixiHhIhOAxL2EqSmYSbJ6AknEimJ8e7Ol3A2rnGXM2kPiceVkf5xr?=
 =?us-ascii?Q?gRU124XFwK6ktvHLjgVb9fHbe0yJ5IZqLt+mqVIMBOyOzYEahSk+ROpsNyTz?=
 =?us-ascii?Q?LtIByva/ataBQaLFckvnRPwJrhD27VrZZQuiZ6kI3Nwr7TVwgeQoS7P8QUic?=
 =?us-ascii?Q?5jxI36N/PV7iW3stINYwM9MGCAmuTDjPLr67LTjWbiYAB34+PizRF1o4itm/?=
 =?us-ascii?Q?V3qz0hTKSyNIjVwUd/F0Sq7fjzwDQpLWaua/hkClo+IbC4GqdeEZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e708b268-71fe-4401-d977-08def9d4b9eb
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 07:21:58.2364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 57ZO3r92UbGZ60TGK1j2+1GB0pFdnz0Wi5zrlejmj+8S7kHFsV05fEbLfZ+C9gmBIlR+Wb/u1lSEQ0fV1GjgEWlXg/t8CCQGFjACawb31523sqWS7Ek7rOn7StIAdRF9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11650

From: Chancel Liu <chancel.liu@nxp.com>

PDM has pin conflict with MQS1. Add GPIO-controlled board muxes to
route shared signals between PDM and MQS1.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx95-15x15-evk.dts    | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
index 6aedcbbe915a..aaa2608793bf 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
@@ -114,6 +114,25 @@ flexcan2_phy: can-phy {
 		silent-gpios = <&pcal6524 14 GPIO_ACTIVE_HIGH>;
 	};
 
+	pdm_mqs1_mux: mux-controller-0 {
+		compatible = "gpio-mux";
+		#mux-control-cells = <0>;
+		#mux-state-cells = <1>;
+		mux-gpios = <&pcal6524 20 GPIO_ACTIVE_HIGH>;
+	};
+
+	pinctrl-gpiomux {
+		compatible = "pinctrl-multiplexer";
+
+		pdm_fun: pdm-grp {
+			mux-states = <&pdm_mqs1_mux 0>;
+		};
+
+		mqs1_fun: mqs1-grp {
+			mux-states = <&pdm_mqs1_mux 1>;
+		};
+	};
+
 	reg_m2_pwr: regulator-m2-pwr {
 		compatible = "regulator-fixed";
 		regulator-max-microvolt = <3300000>;
@@ -488,7 +507,7 @@ &micfil {
 	assigned-clock-parents = <0>, <0>, <0>, <0>, <&scmi_clk IMX95_CLK_AUDIOPLL1>;
 	assigned-clock-rates = <3932160000>, <3612672000>, <393216000>, <361267200>, <49152000>;
 	#sound-dai-cells = <0>;
-	pinctrl-0 = <&pinctrl_pdm>;
+	pinctrl-0 = <&pinctrl_pdm>, <&pdm_fun>;
 	pinctrl-names = "default";
 	status = "okay";
 };
-- 
2.50.1

