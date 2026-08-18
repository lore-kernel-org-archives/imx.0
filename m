Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011060.outbound.protection.outlook.com [52.101.65.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359DB3612FE
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 03:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787022181; cv=fail; b=Gw2HonKSykcArCdIdSI2GC6n/SbPt1k3zHMuEaEnx3G+Iwe92TOfu59mTYW/H8WqIRDE2gQ7npwmKGghV3QIw8tQIlx/FQAGKrxt2UuACLR/7W7Jd0NdCHSUOy3hvOLSiR7j6OdtbmVDY+zH41s+8YbbTc1cupKCOdf1KOTjFiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787022181; c=relaxed/simple;
	bh=pLF1Vqd5si+FcNyWt4xY52rVqMa/J/0rgr2KKDZ5DS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D4tMCoqfn/IuyxHjV7ED2wb30Xa9cmzxWQR5vtr7uBs/jCuVRDzuTht40DqCUPcbNgM0CLWYG1BlryWRawdJ1icQvwzwSUO9Nn6PHUEAN37UmE053+5YlcyO5u9o7yBj2ZJyxJHNO+O9X5KNnrvNMcopmq6tvQNCWiYO18xDTb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=INQa1yy5; arc=fail smtp.client-ip=52.101.65.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="INQa1yy5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p5Bca7svRNP7cUJfo4P1Iy+6IR148R403zqINCpDQL47I4AGNQkLelq8VkCUCwlN5cyrfKqMmnQ4IMqG7F927gUrz1USaxm0K6i6EL8Xd9wazLBSvVm9EQO87m+XiSYaqGePAdKP+Jc/kFMVJKuHS1Nv+YSHkHKENjQfkYdXmt0K/fNSoRS5J7t53aE2h3gHc38+CpPpo8a5xrp6NpS7K1y1401z05VFIkNGTXlnvHYpF6J+8MdelbBCB03x9UnGgRBmikVswW/BBU+S+V9l3PE7ZsZ57dFT2N0g83lCAkNUBA+tOh1rAt3ZT19gyW9TACdxfsYzK+e0m93fHlStwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ncu853l6DKLyM3DW1Uy6GM6lOOxPj9Kmr//5fViKwfY=;
 b=PKWTs3oDEVRJiFlGsZFCt5VjZ4hDHjwHL4KmO0xJYTcfnjOJtleXSWMpDkHXQKn05inR1PbCScp9J28QaIOWhzbNoIRWyhZnDE1OPStqkxD64W3kDqh30i401pZZ9ZnmM5F4lmwDAG5pSs7JJDWLnzC6vAXMQjqGCu0vEIDro7MagvzGSDvFoFJ/NCFwaeg4ZCocqlkmuGoeDizeM6oCcc2v3VEdWFebUjnKavKekw/A+uZZnK3zBg6aROlfQTg5vdvGz97r/GMTL8fY24/Dzdkl6Wbexr5avnno2qzl68lH9iXosrPFSdnjrJFKYBBhgDMmy4eOWbooRfXuC/++oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ncu853l6DKLyM3DW1Uy6GM6lOOxPj9Kmr//5fViKwfY=;
 b=INQa1yy5rxOtMmUmhppH6Bozf1U5T+m+YVuPbMDBVT1KmRwt0mxpEnXP7TI6xE7EEopkFutlufjm0kNmgSZhEjJ/GL8jQzOn0cGBk+p2HsU5PGJ5OyWmQYeCzcXVBqkveCyr3tIsHmtGWofc0HgilzQBXUUA9mVl9gTR/ONMse8PZhbnLY3T08fjuvi6K+SGHJ5By1hjce5+fu1dmE4ySKnzQpk7TnzwVyQjipawRbc8qKdexPZEWPyaxQx8qnMGbK/bBGAjea2b1C2stBOT61Elpl+fD9g45eng0VqPwgc3GDN8fgKQNfXQLdtT6p5lMWzgoIX8jbMf6Y3rTbD/JQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM0PR04MB12144.eurprd04.prod.outlook.com
 (2603:10a6:20b:744::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 18 Aug
 2026 03:02:44 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 03:02:44 +0000
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
Subject: [PATCH v2 04/17] arm64: dts: imx93-11x11-evk: Add board muxes to select between PDM and MQS1
Date: Tue, 18 Aug 2026 12:01:58 +0900
Message-ID: <20260818030211.3141710-5-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
References: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0113.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::14) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM0PR04MB12144:EE_
X-MS-Office365-Filtering-Correlation-Id: 557bb53f-aef7-4ad7-2f03-08defcd52c79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|23010399003|1800799024|7416014|10067099003|18002099003|56012099006|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	Q5Y6epy2Z9CenFYGxi2+k299QTaecd6r9VZx3tVlUTIolyXWZ3LBaYrUGvztD7+L5VHpR2BOSaIAZlLdZBQWXJDwGuPOgfRy2vlreGNo0KLLXiozNZyJsCJQxh3S4YiqEZdMoNpHxO6IpIBTfBKcMs+QsvCZGJeFRkxJJCQQIrAaVy8HxArsLNk6LHkUxWOie9GXHnOIQEEwiM8iALH+PwW82ZIRsiVq9i2VZ0w78PxrAqGlBQXSnRWS3iC/ygkgTuhuKStBei5UV0tXBg+X8roTW+oEZA18UgkeVktz4fMZyRAaFYPUujHFx4WcwORMcr6ZtyAQkGI2XRdFEUXJJKky4vT01jd/rh/Yp2CpBrJTT5tmVzznSfP5cFwC5sHKde/MPBQfNq1F0GSTlkZdFJ9oWGAkITadCNKzsGRCtOfakvpznfJUmhk2JOy3UFy0WkMgVWn//CeRhSYx5X1UbXnLUJapchncxXxwhwqudqKqHitvgubmzi+MksvjWKuNu7C6/NyJ88U2TMBbuJnF+KVqiRXCr7mtnbHBVMHqAhRbxFWHUZNSTAsKJ9yasWSySet70q433drvrnLtwMUSNWyUntq5UxfgwBRmU4CvjQIXmXU9VD2WrA3PmxNGpcbMAIvahSLB1K7qLBpVsz2Abe3Ujfoclr+vZnRal3xSZpo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(23010399003)(1800799024)(7416014)(10067099003)(18002099003)(56012099006)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4Ysbz2w/vJfbzYaB+fFalmiwGT1wvuDtmGX3WPGJv5CEfl1s131QU4tnGUYc?=
 =?us-ascii?Q?Q8uBYm/mjhP3pyBRUi1ZUhcfeIip+MB38xwMKbPUT/C+DSwlK0zMX04i++K1?=
 =?us-ascii?Q?VjBKJ3IXg7cys/7E0wUl5PeS8CTIWNU7OypQDjrYZ+QpuWIZ7jh0+Ev/6ok4?=
 =?us-ascii?Q?iPi34Y3qMOYrjrAR6Gi2H9tbtVVC6cavjzGS5DRXqPckwKyITGStVTLjBkgI?=
 =?us-ascii?Q?qNkG38BITNHPjUsCFka7yd6uSrlFMpkA7xICev0VCskDtXCtFXE0TTN23wvG?=
 =?us-ascii?Q?CNFbNV4kOQRL70BFZmtIo0H44ZSJuB2nHX6d3g6FOa2TKHRkaaPqtMOenIzZ?=
 =?us-ascii?Q?zYV8yEDUVwsYr7qahqmH3ALxLI3DsH0ZXuafx6rTT/71KmkVHTg/Cnn0emzM?=
 =?us-ascii?Q?IOKbDdwM4q5JLlMiGrSfJxmwL6qgGjuT+z1l2HINHvZKUd75QSCVokPHB/1v?=
 =?us-ascii?Q?7RXdtrZgjX1c0G0zbAjv/4sAXZAG6cnjODAxfbrbS0oV0QQIj0LOQYaw0do7?=
 =?us-ascii?Q?erKjPQxweOFLB4ti43fAxtJ+cshFk4qtB34LzubCJO2UU5g3s1OPL6wtVLqe?=
 =?us-ascii?Q?zoIL5ufm0J591a/Q4R7tR9fCuS0PG4MuhPyJqpGYEdZw+AW/O0al8FY455ud?=
 =?us-ascii?Q?aah/JEESHIt4MurhscM1jPNwRyjytrpCie8T9/q1Lf1sPoNfQ87HsAIun4qY?=
 =?us-ascii?Q?s1P/IH/5qLxzT7+/oe9giRdPMCjY9UAplAOIHa1KJpkU1p/bkis63UvUgEi4?=
 =?us-ascii?Q?LOnwdLoGppL4xX/0+8JCiD3Ip1C4za+zQWo0P3q6XiCBYWaBaZKO0zYZWMWp?=
 =?us-ascii?Q?g9FAqO59ShZkha/M0sHM1aKHbQtFQGD7tjFCrnecJaotPwB0NokG18GS1hjQ?=
 =?us-ascii?Q?2zPr+EmmIeG3/j1/JAOO4ThTg+aZG0vYwWjcCNpUWHI3XvQgAXtf6awsTstg?=
 =?us-ascii?Q?ExF8LbV5FOGMwAWQ6jeSKHppRHz9DbyM4j+JxjMbnnEwSs4czeb4sMo5s0qi?=
 =?us-ascii?Q?sj/wLLjsy8Ifl03Q46ft2N9IZxIuO9Lp+rAbtbpC7fygKx/jZcn6DkTR+6i2?=
 =?us-ascii?Q?odKuFNZY5LpbrCs7ytp9kbgBEZVsUNBe+MfQOfegcrwFvtzgS9nnRUgI0wsE?=
 =?us-ascii?Q?Gijv0AtrVAfJ7eiJY5hXYyFxz+Ep0AiIasABTPtOxIew66UNqcAHeob10U+t?=
 =?us-ascii?Q?sQOm+PUOgXsGTYEK5X2uG+wWRp09giNFZVPcfN0jeBDnaIIrnJGRhZ2uPWgt?=
 =?us-ascii?Q?7muTN5M4M1Yh/ZKQGE18tAFBJMrRVOAdVSi+bdvK3VXK8iiNUcrxyqg0ZV2s?=
 =?us-ascii?Q?DAJTcfUa+jnimM+st7QD7wXNfcjpPEOyRGBtD+nYVV+DZVeNyQb5Ur7TmEXw?=
 =?us-ascii?Q?FiQHwsZzSl5qF5+XlfW6s3Cg3CHg6zj+WZbAP9YZ7xVOqw/+sRn3c9rF/OiZ?=
 =?us-ascii?Q?OllKSUapUy8lZCCzOSglhDke/6vnZBW7w+Zad2VS0Kq1ouGHkKX/rJt7Kmh4?=
 =?us-ascii?Q?QZGx26MeJ5H0XkQlICtotvRILpD+/PQN/26XJdcn6wSn3ptzbBviaB6TyeB/?=
 =?us-ascii?Q?IuRIke4opzPZbe+U+8povf6HYTOcsBlpd6o8wgl+iV2Y6QW1IEza3oRewkQh?=
 =?us-ascii?Q?qIQHO52E1sd4R80scjMqByMovLpvUMjsxUDHhnEzZxDACQbZH6nMsqnMcFFb?=
 =?us-ascii?Q?5jY6j6XPksEOyPg4zqemL7KK9Lsonpwk+1U5GnQW7PHm9BQ6QG78/AXzg9W8?=
 =?us-ascii?Q?0a/J0+BUJuKUFxVAD4wf4yHZLH/26X831FX7e/fnpBZcl4o1M/Kd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 557bb53f-aef7-4ad7-2f03-08defcd52c79
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 03:02:43.9044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cbUAylSyfB65JqwXZNEZJADlDYTrqYkFs12srFFT7dGcyTaioari4Ey4GE/L9ADzN3bYV28hskCeXCcCNi09koXWab8XJXGcTvmmknc2Lc80f7kpZ69tjIhlBnI4i7fs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12144

From: Chancel Liu <chancel.liu@nxp.com>

PDM has pin conflict with MQS1. Add GPIO-controlled board muxes to
route shared signals between PDM and MQS1.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx93-11x11-evk.dts    | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index c6db9c85f2ac..4418fc6a0901 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -16,6 +16,25 @@ aliases {
 		mmc2 = &usdhc3;
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
 	reg_m2_pwr: regulator-m2-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "M.2-power";
@@ -88,7 +107,7 @@ cpu {
 
 &micfil {
 	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&pinctrl_pdm>;
+	pinctrl-0 = <&pinctrl_pdm>, <&pdm_fun>;
 	pinctrl-1 = <&pinctrl_pdm_sleep>;
 	assigned-clocks = <&clk IMX93_CLK_PDM>;
 	assigned-clock-parents = <&clk IMX93_CLK_AUDIO_PLL>;
-- 
2.50.1

