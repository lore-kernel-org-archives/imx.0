Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023088.outbound.protection.outlook.com [40.107.162.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CB43016F3
	for <imx@lists.linux.dev>; Wed, 10 Dec 2025 15:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765380014; cv=fail; b=hOlBpTkF9ze9mIpy1Lwr49K9dKlnWN/7oI1XAFlcxRD2Fz/Cq+OHX0GuZQf1oIHMoMP+aHSusYRCD0oGq3G3XO/zaHQNzGLi+qYbsnxy3IRUDuhe51q91IQwohKNi8svSDgIeElmN8RG0iftu0VereQlOEzPI0so9hlo7Lzhnyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765380014; c=relaxed/simple;
	bh=T2R8AecZSWeqohXPaOd8XvX1rVPwHS+5VVrLObw6hNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QtlaAYEpWQkbQf5i+nGfc8I9pCROUTpvHWiebHKI3t/d0wRvnO/U+1GF5Yx8XSwqPLmjo4WZ9jM4PdTU7ErPZkGUo9GUgwCRpVTIIetKBlQ030wtBzfVqgF5tBi2IqaxFO7RBcfDiuehA0Fih+Xj+X/WBUdRzdRHs90fiyzW9V4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=variscite.com; spf=pass smtp.mailfrom=variscite.com; dkim=pass (2048-bit key) header.d=variscite.com header.i=@variscite.com header.b=J0Wu0mNr; arc=fail smtp.client-ip=40.107.162.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=variscite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=variscite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=variscite.com header.i=@variscite.com header.b="J0Wu0mNr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wmwv+c8Osmq1p+/x9//a0h+Nhr8P7Ft+A1AEdKZntaackOMQxMUj7qS5P5Yb8PAvbdlZvIPfzK2aLEYHI3ULpBEbmmMv9QdQxqnABcpbaSlvebpNRs19zlQtnbc9BtMPnePM+gLZmbBqowRL5266B+aLWpEeGbSACJbr80UIT5LXUa84pEvJhXITXjFxFVZ9tQRfPnh+fu1q+/3MPoY7dfxxy4u37UYImRSy6/31P6llk+d71uAZolIYOiFzMMomS/ZWLk69qbRMnt34TdsOgncoa5vS++DT3AdaoOCNEgh8fQE9Q69TN/Tcghugq+J8eFteV2b0OeudQ4FKvKf/gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=npHnAipIjYA8BTdjqXjyOhx6s+mRvPR9CRaM7jOMkls=;
 b=s7bayjwddenmGGR6F/cDyimGicz3jStAN9A71eWi9FK5oUwEmJqpe/xh01LZUQf65C327zRTWOAhEIbzWFLsTO8nXj6obzlzPlOF4CXbczHFa1LX92VY8AiaMPaTqWSW0WxOCMEBfMAfiOuC4cSwsmjWXRZ/LT0lXP10EyQlZ8crwPIbqIHBw0g7PrSAsmY6HvfY1v3tTAskmFVuJUwkJgdCMhZgfrHutMZt71smcwUitczT7Vis0g5lJu0sdWNKJieJ02zzuswxurqEGlQetxZBXZIn1JBba1i53wcyUz5SBdcvq68Hlf6qEkEFsbwi2fXp03QM8fG6PoZGUvxk4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=variscite.com; dmarc=pass action=none
 header.from=variscite.com; dkim=pass header.d=variscite.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=variscite.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=npHnAipIjYA8BTdjqXjyOhx6s+mRvPR9CRaM7jOMkls=;
 b=J0Wu0mNr3nlH1F3XMLdmLQtIDK33Mi0Sm8hLn8OuagRsbk4DvjKPbZG4gJsGIsoXOiaufdUToOnouF0mWdQhRvu37EB6JQLLvVrN8yN4qB04sPfW/S5SeVNYDavzXsImT5j5Y+XBRqgyEaveYh+5RmLs93AZqP0F0GxSRiakKejRZvX1Zd+4spBGooD85nNadVGSEOuOUnSpGUzNRZ/zXEPfpFjxr55vnxiCizfH/YBt/zdnV127TW1tQlalhpN16DayNQ8uA49MvxI4OEp7WhMjvvyI5Tf0PsOKNaldCLZuMwYPfC8mH/0wj/hAmZxuLL6s+3YLIcpZ2ym+dV9Nvg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=variscite.com;
Received: from DB4PR08MB10341.eurprd08.prod.outlook.com (2603:10a6:10:3ff::18)
 by DU0PR08MB8347.eurprd08.prod.outlook.com (2603:10a6:10:409::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Wed, 10 Dec
 2025 15:20:06 +0000
Received: from DB4PR08MB10341.eurprd08.prod.outlook.com
 ([fe80::24bb:a230:6690:f824]) by DB4PR08MB10341.eurprd08.prod.outlook.com
 ([fe80::24bb:a230:6690:f824%6]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 15:20:05 +0000
From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 1/6] arm64: dts: imx8mp-var-som: Remove USDHC2 controller and related signals
Date: Wed, 10 Dec 2025 16:19:53 +0100
Message-ID: <20251210152000.42265-2-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251210152000.42265-1-stefano.r@variscite.com>
References: <20251210152000.42265-1-stefano.r@variscite.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0067.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::18) To DB4PR08MB10341.eurprd08.prod.outlook.com
 (2603:10a6:10:3ff::18)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB4PR08MB10341:EE_|DU0PR08MB8347:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f60005c-1ecd-4a0e-43ca-08de37ff98af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rNdHFHbaXJulQVKtIciOxfjfWNIazDFcljTAPCODYXwFWTBcTRvrEBnszmRC?=
 =?us-ascii?Q?Y9L1sQwubAiRWn9OHPC8Di/FNtiCnILghNTU9QzjDwTvE193vRJATcFdnBF0?=
 =?us-ascii?Q?+cv6Q2oQiHWAkI2FLq8qDhp+6gHnhyZsntDPDXQA8cSSfef2rhSW+MnER3KY?=
 =?us-ascii?Q?XnGGHdcfE73YBwbj3EsAoNQl/aCL21NtVxVlGl5Z8AWgxYcftAulEKfSV2l7?=
 =?us-ascii?Q?42OCRyGpG7pO1ef6odL8rMHqfSRG83mLxfSHimhtmI+tKZSFCaL4CCE+YZpJ?=
 =?us-ascii?Q?7xTFxydx9z75ldtqTOIk6sLOAJypVNPBcdTHs/ruMaSfMFE4o7d12ITCHkOE?=
 =?us-ascii?Q?kcC4J1/ks0tOPKWjTu9BBXwMYAfGspMs30cht/cKYD0+DQYmYjNlxZla6JD5?=
 =?us-ascii?Q?IuQ/eBDoT5NA4qAla+oAPF5WYrHRi8qi9sUwiAiQX/bsRr5Vq+vIdUyabcHM?=
 =?us-ascii?Q?hOg8QUIHLmunXrd/Vsj/wE97lfLkyAhxmXA7p/xVxrVtZdn9rQAC/NHgeqeA?=
 =?us-ascii?Q?fVLk0TLG7jHJ3kLjddJWGH2lxAczmEyyxZqeVvPHcE5uxCW5C4L5V2zfbvEa?=
 =?us-ascii?Q?NAOJ8EW6djZHDiEL4yL1lBS3bu9rJI2z0biXvl2SMUOR6MpQGvUW6OGuRDOh?=
 =?us-ascii?Q?HEABT6tq/Xq90DOOksXDelUZwqH4DMkNNSVZvrIxxzynPSvNFmalP//+p95c?=
 =?us-ascii?Q?5YTAhAIYOF6R+5Q93isQjjZlX0xseJA5PGP0dPYa+Z+XY1A1ATeXKBl6LiDn?=
 =?us-ascii?Q?03wuvRBp5NVZb9rYaYK2sF92BxfitQkUq7aQm8VQkts0DNfLw9AgzYquZxhF?=
 =?us-ascii?Q?kQlOwNqYH+pvOzNK1h8QuY9fatuNoqMefvtk1ssIB4JP6ysM0qVim44ylkhm?=
 =?us-ascii?Q?GcrjK4BNN/IoCvf9SAo/pf7xSi74nIqOcKVHBs5slYdKGI0T1SMpeuMGpbGL?=
 =?us-ascii?Q?k6wcqImldGue/6ghr0W97ycPUIvUuYd4/IL4E7XhHtR/NkHyoocNXcxMXU+C?=
 =?us-ascii?Q?7gdajW7x212pqbMW2nKrEKc3XmBMGU1hLRvnGCQ/LsWnfDH6ejpBEaT0I/ED?=
 =?us-ascii?Q?AyUsHRvQ8iL9wbrQeZUJwgqq79RKc8baHsYZmNi3V/kOu4PmKqNdrewjsE8p?=
 =?us-ascii?Q?huH0QIQIsu/xUAuedO9wz1R6yPbHsr+ER1MbZ0ytKLXxdanbYApAaFhOKN+m?=
 =?us-ascii?Q?NaQUNE8mG8IBZD5rUIIrZL7EuQmDEuY5U+GaHjAu7ks6EVvFGVi2BpENt/1F?=
 =?us-ascii?Q?7hpWlH5bsdatLWKmx5kQ5trebvCbuqighwcCv7cIPucX3gD2Q2tnzX2kR/5a?=
 =?us-ascii?Q?ZCfFM1VqAiARjbO1bvpw+JQ4rrMQ5D/YIe3MAHq1H/g+WqrQcoc9rO4JJLPY?=
 =?us-ascii?Q?v5SFfKxkJquAWmPv5GpN1kv4ipVOGYF/AfmpEad52+5w+cMDWP4667RrqEgL?=
 =?us-ascii?Q?OKT4g8KEpfXu7QT1qp+FvIYDcUvgiTtP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR08MB10341.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TrczB5fuF2W9+iMONpi9s3aI7+KiVcboZ07cdLXABFkfSKaHYG2Nbrl5jw+M?=
 =?us-ascii?Q?M4NVhATcKWbB1F/HG0uJrhlxVf9p5FxvH+OzYMLG/35CMx3nnALI6oS7KNdt?=
 =?us-ascii?Q?RZBfvxQJPwmGJFeVBafH+DO3ptwxURO7BflQNvZ9R1ucsoK2mCFKjD5L60Zg?=
 =?us-ascii?Q?O4wGjsJafMIvZs5ugKD/7+JzfNSueIcoDT9EDYXZ3d8rphrzyHf6QsBWlkYI?=
 =?us-ascii?Q?BVZRs0mcD5aq/Qlp5OGrTXDT/l3MWtMXLyPZ8t2A3eUqmH4WHNq9bu8mqWPq?=
 =?us-ascii?Q?jB3Q5Ni3VfQRoD90di8z1rqmwY1kbzXPBfe0B788iTCvr8t4fsQyxaaNKEFk?=
 =?us-ascii?Q?731KHfxVxyDl6jId6dkd7WL05d/0VLxuJnFRh8ODL8gyE8xHl2wmGjzEdsIA?=
 =?us-ascii?Q?wGiNXziXmig1iojGIPCOuiYnl5AJiIvZqyTbrz1Zgh/u0alTahQ+QwYVNp0y?=
 =?us-ascii?Q?n3/dnnpZxfSsX5/uiLRR7U+PpViNkft30PNH0dOTlEdwZyGG0lUQlTlwb33Q?=
 =?us-ascii?Q?5QhXqwOacWeD0YHByTYyEOi7mBGlcY9/bqh5DCqj5/U23BGGwGlsPOAd23xQ?=
 =?us-ascii?Q?paKMEEEbnN6w55uWAcoh6bPuiXHoqKFQNArX9rIv+zzm/LAnYta4kP4zJn8N?=
 =?us-ascii?Q?uWa90RQE6M2wfRsdqBkIh98ZlapuIBbqY9dE4ZiC/JPBdAWeKkVcKGU2Zbse?=
 =?us-ascii?Q?MTGwlDEk2QaXh7G5mJX6Wr53WSgYe6BswyISJtPr3zHlDK7S8JCaiztEg16W?=
 =?us-ascii?Q?AW1NSvzKaf2BssL9n7u3fhNRhyPGZcr8E7+foCwNnco9jrhIPdJhZl9QJF2r?=
 =?us-ascii?Q?0dyYsUJPSSPAvpUYD4dn2a2rrXrXOgmoHXBrxMAXt6IGkZvUR7dh6xLGds7q?=
 =?us-ascii?Q?C8cYaWz+JygXCf/3dStqKjRv/DirzlNF1jgJVPiP95dXh2yAF3yRYGu82f67?=
 =?us-ascii?Q?ar0fef5tRz+3yB7lTJ1X3uUVGSq6aNl2DWQaKne4CbfMhRIsJ4PJvz03i2Sb?=
 =?us-ascii?Q?Cc5Vj2df/YjqkIK3fXkSircFHV49jcOJsanwa/VmtfHuBhgjncvG6xqZ0KSv?=
 =?us-ascii?Q?dZlmAJY0YbMhUkN7+1yW6vcalkB3WiYLikGfn0rhqxi7bMBU6MK6MZ06ZtlU?=
 =?us-ascii?Q?thI080TTzLW2XeK1vCwFREPTWT5+xGB273c16lIjEB/BJpsRvhYTD5pQRHNW?=
 =?us-ascii?Q?GoIYBXyt1hT+Fd33haysBRxQ7GFvAUwuCck5jlM7lhhWF8ga5I+FBGqyOXiS?=
 =?us-ascii?Q?Gx+zUaY6FkBQSjHQNd97EftuSLyQSqTokqqb5BifJvBexl+WJi1KrvIFDx/p?=
 =?us-ascii?Q?fc5h6pQD/xym20EgWcIPblfGT6kVUcDcfAagpqd269EZCHlT2AsljMPns69b?=
 =?us-ascii?Q?P6dTxrj52y2OAezsG+JxV0S1Zd1UIVbIhEnMmPBfN/yp1hCpsB8kZ30svZ/t?=
 =?us-ascii?Q?bWw+W0wVIHm6+oyAKpIzTc3S3auBZPaVvFMFzpXnaaNXrpMsTIrVURFVMZra?=
 =?us-ascii?Q?oqYkuLe0b25/WoWcENOdDhZV+ML5MHkwMo5uTwMSCcdDaP6q4vk5VlE/WuCJ?=
 =?us-ascii?Q?/obO3VzjQTah6raS84jhyTC602mJ5/vdlfrrsB1h?=
X-OriginatorOrg: variscite.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f60005c-1ecd-4a0e-43ca-08de37ff98af
X-MS-Exchange-CrossTenant-AuthSource: DB4PR08MB10341.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 15:20:05.1867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 399ae6ac-38f4-4ef0-94a8-440b0ad581de
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nr1T27vlvPxcbLGaM5z8qq3Cw1rxeRgUv+RnO/EWgCHMTheK8w6iDYLmDI93K6gkBqSc6ijbuCYLJr2PRIOXVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8347

The VAR-SOM-MX8MP does not include any microSD slot connected to USDHC2.
The USDHC2 interface is instead available only on the Symphony carrier
board, and customers may optionally route it on their custom carrier
boards.

Since USDHC2 is not populated on the SOM, drop the USDHC2 node together
with its regulators, pinctrl groups and GPIOs from the SOM device tree.

This avoids exposing non-existing hardware and prevents misleading DT
descriptions for boards that do not implement USDHC2.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mp-var-som.dtsi    | 75 -------------------
 1 file changed, 75 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
index 29f080904482..949d9878f395 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som.dtsi
@@ -35,27 +35,6 @@ memory@40000000 {
 		      <0x1 0x00000000 0 0xc0000000>;
 	};
 
-	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
-	        compatible = "regulator-fixed";
-	        regulator-name = "VSD_3V3";
-	        regulator-min-microvolt = <3300000>;
-	        regulator-max-microvolt = <3300000>;
-	        gpios = <&gpio4 22 GPIO_ACTIVE_HIGH>;
-	        enable-active-high;
-	        startup-delay-us = <100>;
-	        off-on-delay-us = <12000>;
-	};
-
-	reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
-		compatible = "regulator-gpio";
-		regulator-name = "VSD_VSEL";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <3300000>;
-		gpios = <&gpio2 12 GPIO_ACTIVE_HIGH>;
-		states = <3300000 0x0 1800000 0x1>;
-		vin-supply = <&ldo5>;
-	};
-
 	reg_phy_supply: regulator-phy-supply {
 		compatible = "regulator-fixed";
 		regulator-name = "phy-supply";
@@ -271,19 +250,6 @@ &uart2 {
         status = "okay";
 };
 
-/* SD-card */
-&usdhc2 {
-        pinctrl-names = "default", "state_100mhz", "state_200mhz";
-        pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
-        pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
-        pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
-        cd-gpios = <&gpio1 14 GPIO_ACTIVE_LOW>;
-        vmmc-supply = <&reg_usdhc2_vmmc>;
-	vqmmc-supply = <&reg_usdhc2_vqmmc>;
-        bus-width = <4>;
-        status = "okay";
-};
-
 /* eMMC */
 &usdhc3 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
@@ -358,47 +324,6 @@ MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX                            0x40
 		>;
 	};
 
-	pinctrl_usdhc2_gpio: usdhc2-gpiogrp {
-	        fsl,pins = <
-	                MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14                             0x1c4
-	                MX8MP_IOMUXC_SAI2_RXC__GPIO4_IO22                               0x10
-	                MX8MP_IOMUXC_SD2_CD_B__GPIO2_IO12                               0xc0
-	        >;
-	};
-
-	pinctrl_usdhc2: usdhc2grp {
-	        fsl,pins = <
-	                MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK                                0x190
-	                MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD                                0x1d0
-	                MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0                            0x1d0
-	                MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1                            0x1d0
-	                MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2                            0x1d0
-	                MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3                            0x1d0
-	        >;
-	};
-
-	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
-	        fsl,pins = <
-	                MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK                                0x194
-	                MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD                                0x1d4
-	                MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0                            0x1d4
-	                MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1                            0x1d4
-	                MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2                            0x1d4
-	                MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3                            0x1d4
-	        >;
-	};
-
-	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
-	        fsl,pins = <
-	                MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK                                0x196
-	                MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD                                0x1d6
-	                MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0                            0x1d6
-	                MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1                            0x1d6
-	                MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2                            0x1d6
-	                MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3                            0x1d6
-	        >;
-	};
-
 	pinctrl_usdhc3: usdhc3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK				0x190
-- 
2.47.3

