Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011039.outbound.protection.outlook.com [52.101.65.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035D5286897
	for <imx@lists.linux.dev>; Wed,  4 Feb 2026 02:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770171719; cv=fail; b=GicHUW6+UvJMlaS9ebABYibYiQV3nNkFRHjAuceZ36+rKJ6ewr0m3n7gbtawH+lDAIxT7xhXRO6MAQz/GOqjwKVCXiUUc9wczUyQXTXSdBs3soEt66+6aZfdWIKjDp+88RQcbaP4PhlNsep49VqIrEe6iqFRX2bCaLhbamMFieY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770171719; c=relaxed/simple;
	bh=EdGLq9MG7AhVHEIq0Mj1S5KcArbg6XHVEC2Xw8BcgRQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=YGLdB+j3Rxt+ySomQWwN9B4jWzqA2geawq2F7LewKDH9jbn2MCpyKTmGz6eo9BXCd8Man6U0eVv7Zom1pOEmN6C+7jynvfy6QwwG308FoowwXAsXaTjOHtLTLNX10CNm2LVYq7i3rtKCrEiusH3VOHkM/61U/6etRo2unvQLI0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oQ4qF9OX; arc=fail smtp.client-ip=52.101.65.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oQ4qF9OX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CinY4BrrrDx3Wp0f0ZOZB4KQ4UKo+6fqJA8MXgzezdugzlryYl1Ds3vQjTnnExRJrequjAGwD+1Y5a+3FFrK0d4nNQoJubpOU9ZsUxZ5Ci2EXLA+s7ukWluaAyTGVZEpo9KR1sJmazfnlyNQLT+7Jq2Qr1JHsGgA/wo2ro3eQu61HzVWswnIxfZgVctk8PJbQUJSKdJVBFBiMFcCTch5BtndxZZTKAlAlIV2A5xGapUnU2waWPWZqz6lOtJVjlQLiFzWZFX7pDueSBX4uRODNDX0NT++IEdFeqpXk4Yot3auQn1w5DHghSjzMn6zmFYeTC//CogZIJ7MAAlp9HQF9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9cOS8E3b2inM+2biw2aNpALJoTstj951bh8c23IuWSA=;
 b=j5eRaCfr2XVlHE1lhUwmyTb8rPVCpgwe29VScRtj1ovtpzk0mfIYRLAlXh07UbgRR83CUSsPC9t4nItzdQuaWAIFGPhwcqhpwzfwR//s5RbZ03y9nn0FkiPhc/LyQJMGkyDK2YTadvlIkCXYr/ZVaMKopTAUp/dwwp1O16hK929JnHvTKo+Yb02YwAeJ99IHXk0m4VKMr5K9+Zh6Em8qJT8lA4ish5e81MrcSi5Pyg+m/dPAdGEp0rHeWCFgTMz/ZvSO9ccq01AghZ+nFdSI69lvC54msJKm4+IRdxfpOvX0N/dE1wDQKWx5mqmQAl8UsP/cBMRg/kPvx3HFMBA5EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9cOS8E3b2inM+2biw2aNpALJoTstj951bh8c23IuWSA=;
 b=oQ4qF9OX8rXeoLjL/DbspPzeMRXDLzSw1/plb3+LkqW+n8kq65JuIwRlwkANl0ouxbo6/FilJ/sKpj2Udh97q+cLpHqsnES4XnAygirWsLL7noDfkkO+/Y+15ogyk2n1JppTuOcR9TGfN1SWt0HfYm7tfVHYjlA/yss/Q8Kt+gc2J9P96A81kkqem6T5piYFISdKXrFRlwYwqovhcD5QBeo+7tEc9NIU/mlkjKn1UHg7+fLOlaEYrwiFp9bVORs42w8PRTBh+PT3uYCjnam5U2ymWziXiHRTQOd2DoetXLTZk6yiSNhaNXi4latH+wfB+FGEtPcIOpctso7qTHhJkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by GV2PR04MB11833.eurprd04.prod.outlook.com
 (2603:10a6:150:2fc::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Wed, 4 Feb
 2026 02:21:52 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 02:21:52 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH V2] arm64: dts: imx943-evk: add usdhc3 for SDIO WiFi support
Date: Wed,  4 Feb 2026 10:23:06 +0800
Message-Id: <20260204022306.2372889-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0011.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::14) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|GV2PR04MB11833:EE_
X-MS-Office365-Filtering-Correlation-Id: e7cb1785-be83-419d-d572-08de639428e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EvOkObW2SDnn/H+8DLemPcKKjYw1Z1kj5I7LAF807MROk1WNo1oEN+tU0hIj?=
 =?us-ascii?Q?sf8ZOKGTYf9I1/qJBB7r72c4H9oz2fyQSqMxnyestai95akTCI+ET74qW5uL?=
 =?us-ascii?Q?EqXK+XrYYXvvHKMUqu7tg858LJAvdmcHF9KNYQQkgWoWSliJNdu/Mgg4S3bO?=
 =?us-ascii?Q?kf6zf1h4B/HaX4wTmlPPQgOxGKka4UsztKx3x0JFxAuxkOlGRLse/j0RlopS?=
 =?us-ascii?Q?8WXxAP4FGVUAz1D/UHhjcscrwPR5y06W8Tt1z5S6ZlMCqC6xwNP3OfxQzIox?=
 =?us-ascii?Q?SAMaS4NFiibkIdiNOwNm3pBlSMYNS24pZOZq6uPmzw+aDbRG74N4SpUAPgNK?=
 =?us-ascii?Q?52nU21UGp1Q4OkGuPHuTU8154UFgfSNA9Pae6U/qxNhNVFEfLWvcAZCDjmr6?=
 =?us-ascii?Q?19oTx6Agh6j18+E9UQ6lW5gCgeZ+z5Y4kLHsZL7WXOMFK3EE1prpY5RO1ttl?=
 =?us-ascii?Q?T7KxviFcVqCeF33sk/KTJ9x1OpTNmh6xEcVCgHgkI3rrb/Xprt8jwll36X9m?=
 =?us-ascii?Q?Nf+m282rZepjKvC+uc3blyQPjD/Go2K/byMwbYRF28yJGL3XxmfGlYKN9F/A?=
 =?us-ascii?Q?94TKVA0asQjNpjwn2h3U0QuqVDvOolS7CnRgJAtGrCR3CxxNfgMeSMPWQHrZ?=
 =?us-ascii?Q?rfeMeHMMz+eZQ6Hcxqzoj3wAoCxco2UHP0XaXgyUgiAL+Yv4RD4/Yr9URPDO?=
 =?us-ascii?Q?LdLJMhZQ+PKxG8QqTVc0ZXkgx/0yoiIGv3o5M4E3Ie6q2lKYXYnMJUek0MzQ?=
 =?us-ascii?Q?ru1RvDxSJFt7o0+Q2r2ZFzviBYKSSmCT3Z5voJZQZH7l4865e07ufM9doh4E?=
 =?us-ascii?Q?rUGcwgSe6YzN4h17z1eGJ1TPUkK0+duPpCeSZ6rhHJho90syGaqYWa1ao5QK?=
 =?us-ascii?Q?EA/Fft8F9BWwVch+yhYsyC4bkibEkjlMygKRO0iVKX/jsv4eex4lVb0vFFZo?=
 =?us-ascii?Q?c8FAZke1KL7DimyTStQx7MUaMCarvdmEQcjjBJLfR+DCpK336iRYLn7aiR50?=
 =?us-ascii?Q?KcFK852vptxqLxDPUvcHy1rRy9b1shd401BpUBDpXgpzcZ7IkCnr28ZaHg0U?=
 =?us-ascii?Q?eWCuJJ1pZPSMn6eQFiZxMQheLPaCfgIM5C0IYeut78k9ow4PFdCO24fFnwEG?=
 =?us-ascii?Q?M6Hn6SEHPiL8gchiVcUbyYcwoAsDrgzJAaYfb3zRnAzUVNHFrqA1/mLkXPHc?=
 =?us-ascii?Q?WJIJx0K1k7AqVy0W5kiZrmArw3tJA7VePl8cyItvuluPBp4Xz81xEapPu6Z+?=
 =?us-ascii?Q?nK7BSVlNgGUU9t/FJGYHUdCZbxLIXb6Cbf4fgL2JYSmz32KJCb291tLP6JnK?=
 =?us-ascii?Q?q1la96QaTe6NHLtUacbZrTcrCibqHNhvT2CJY2OcAPXaGFvoPjgl81FB/ywA?=
 =?us-ascii?Q?Cz5Muaxo0sy8XXWujfuG9wjUMrUWjki3ksFjgRJEG1t0sBzvegUQCthI2qEN?=
 =?us-ascii?Q?llv3AINZUqcO0GQ+SDUdFcxYc9/tUt+/yYk+Wc+pCsKbXfVaTS8X1xZc3quC?=
 =?us-ascii?Q?Z7Cc2WUVc/Ex0s4TdLv3a6R2RL97JIyBd7s/67D4WaJPCOATSPCzzR9GrSD1?=
 =?us-ascii?Q?jk9l43IWi08LN7jqOSrSqo9w1lXBdqO8IOnLd4G7WOSsxgtaSMrFFpu4Ys5c?=
 =?us-ascii?Q?KEJCFW9fd5cT3/WE4UQ4F/c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uRsAvMRLYWw8Z8cwcsXS/iHh6+kWqWe+QQ5ic1k7Y6Kp580h2hd+pOpnqKzb?=
 =?us-ascii?Q?DyrBvbTjSjGbNtCbvrqGH1FTFWFzWmJQPyZ6ubLXTKp/0eqE2Di1V80hiw71?=
 =?us-ascii?Q?x1gLkxb8M5pmgrFlbqKyl3eyHhlyX75gPtmfPFOod2Hk7+IM4kiob5GecSD/?=
 =?us-ascii?Q?oRdS+HUJO2ZsBojY4qugm7VLVW3y6nnB+5KNKFRiFyt1BAC/jonvnc1c0a77?=
 =?us-ascii?Q?X9Kvc7g4BnBMjzLAJ78bZF+2XIgG4c6JlYTLUMYoWthr8sb+qOS+/dOiyrKx?=
 =?us-ascii?Q?I+br3dWOlPsddb8nks4qWdsJvOcaNBbst9S+5BrBS6mkLy9jAiq3u0648g7G?=
 =?us-ascii?Q?C2kQFFA42FwzEogKg81AFJK5qKpef1sxptJe50liVDYeJW+8fJSClugrh+Qa?=
 =?us-ascii?Q?Z12z/5uwJReDNhq1ncblKNa6yevXYPP0PwtQ3h8lcJQ0Nc8bFugL2YDCEtAv?=
 =?us-ascii?Q?dE2KFtkKSYkh0fCROnCidRYwhvhkck7Uwc/19IDjD/Hwu0Pjae3v97FMYQRr?=
 =?us-ascii?Q?RJEN3HQDR6/w9rp/Ta+TCexkphj2/m7I8a1xCz2sFAQtyJvs7zuJ70wxbEfl?=
 =?us-ascii?Q?HjkgSLlhwMqbeuwYzJOMQ2qOlycGTigQA46qNAzVkzO35h1vOqtbI1vj3BSV?=
 =?us-ascii?Q?icU83czyQz7ZRjf388Ui1uTYXuJj/CazKtmufQRHa+zemc8pKSHbZW4hRoqI?=
 =?us-ascii?Q?SzMgvfA5KrOFQvZe1Pe6k6hh/acVKNdKxseWaDI8IgHnSFKwPDlCjGmDoghe?=
 =?us-ascii?Q?03hGqVYsgHQtSPbE1bW6/Twv5Dp9p9l/WLrxMHXFS21DqD9+0ak64EsGhD29?=
 =?us-ascii?Q?aAk1Ts+3FoCDN+QpJy9jQ3XiZBdwPqNU5Vx65XBGGHeqGP2u9uXyo7oIP+l7?=
 =?us-ascii?Q?Fa2pXNMScqnPMDGqCTMmd6Vyye7BIfCgXu0aBkvrhZpX81cyRq95dU8OlPmg?=
 =?us-ascii?Q?r9l4VKogKgyW02tgu1IMNM/Amh0A+8b3icBEbHSINoYLQ1QdiXS64tm1UL1g?=
 =?us-ascii?Q?jCo5Y2nA2TFd0+9Gs0EegF5M81SGxtELfh7mmsFFspeDPZ/cCxRqB47whsfG?=
 =?us-ascii?Q?rXg1MtksH0lMS6HURSGpKkVA5q9yQAkRhpggN+e3PhEL6b3SivJ2MMyEIZP2?=
 =?us-ascii?Q?4wmet9n4EvHO5DlmmxVRpPW6xvjX9xp9xD2+tjgquRlXTbFhu8PNMKhrROXM?=
 =?us-ascii?Q?y8fA9WQym339QbYESpnzZK3fth9xv/mIU5EhffRnlrA18y+5ZnYuUcKF1IDQ?=
 =?us-ascii?Q?xKCw/NF+qfY3LXmxhSlYHWiOW4lZcEJkcC1iT5SLeVmWqRgsdsRTgAxZ7YPL?=
 =?us-ascii?Q?9R7mWoRM3Y42jpDGi3QBAiaWk4m8fwgpKDv2O/PrVn66Gd/mbQ8LKUgSPHWO?=
 =?us-ascii?Q?j5JxaEuNUsW8IPqjKu9onPoJQ4pY7F0FphvtZusdfDr+Qpg3if7e31GZyY4D?=
 =?us-ascii?Q?ILh812PL5tXRFvevO+Tr6JKAzdXqVLjjFilfoHlGWwpL9rbf1EV6IWy8n0b+?=
 =?us-ascii?Q?pJ+3l7DNidKgYEBA8tySCd3m6SfZVDx4PbnOg2Ft6MaVnGFDZE8vLIebln7c?=
 =?us-ascii?Q?opgTCQzLnoC6W1boLl/mt9JcW2bZlLPBPvj8enMlQZX3O83YKCLM0sDd9TJJ?=
 =?us-ascii?Q?nnqoVnAiAo+wAzM77OfnwzC/MN7TCdh/PlPJGWz2YqWlaDMuvU2ARSPO6+oV?=
 =?us-ascii?Q?BnqyvPDxFIM4hbi8AfEH8HZWVdCBsTRo5hjvXp879tVb8C9uCj3WThv4wkJl?=
 =?us-ascii?Q?iP1l/X35mg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7cb1785-be83-419d-d572-08de639428e2
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 02:21:52.7872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJ/slGcAqJGT7JsrNw+EJMn+ODlC66sWuP3t0HcVh+wTUWHop1rrkHX7BrcAbIpWT+cukF3JmnsyCp7dZdC5vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11833

Add usdhc3 to support M.2 SDIO WiFi on i.MX943 EVK board.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
Changes in V2:
1. Move the usdhc3_pwrseq node before memory@80000000 node.
2. Remove redundant blank lines.
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 61 ++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index f54404c9bfc9..c8ceabe3d923 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -20,6 +20,7 @@ aliases {
 		i2c5 = &lpi2c6;
 		mmc0 = &usdhc1;
 		mmc1 = &usdhc2;
+		mmc2 = &usdhc3;
 		serial0 = &lpuart1;
 		serial5 = &lpuart6;
 	};
@@ -54,6 +55,32 @@ dmic: dmic {
 		#sound-dai-cells = <0>;
 	};
 
+	reg_m2_pwr: regulator-m2-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "M.2-power";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pcal6416_i2c3_u46 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		/*
+		 * M.2 device only can be enabled(W_DISABLE1#) after all Power
+		 * Rails reach their minimum operating voltage (PCI Express M.2
+		 * Specification r5.1 3.1.4 Power-up Timing).
+		 * Set a delay equal to the max value of Tsettle here.
+		 */
+		startup-delay-us = <5000>;
+	};
+
+	reg_m2_wlan: regulator-wlan {
+		compatible = "regulator-fixed";
+		regulator-name = "WLAN_EN";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&reg_m2_pwr>;
+		gpio = <&pcal6416_i2c3_u46 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		off-on-delay-us = <12000>;
@@ -141,6 +168,11 @@ sound-wm8962 {
 		model = "wm8962-audio";
 	};
 
+	usdhc3_pwrseq: usdhc3_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&pcal6416_i2c3_u46 4 GPIO_ACTIVE_LOW>;
+	};
+
 	memory@80000000 {
 		reg = <0x0 0x80000000 0x0 0x80000000>;
 		device_type = "memory";
@@ -760,6 +792,18 @@ IMX94_PAD_SD2_RESET_B__GPIO4_IO27	0x31e
 		>;
 	};
 
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			IMX94_PAD_GPIO_IO48__USDHC3_CLK		0x158e
+			/* Need to config the SION for CMD pad, refer to ERR053138 */
+			IMX94_PAD_GPIO_IO49__USDHC3_CMD		0x4000138e
+			IMX94_PAD_GPIO_IO50__USDHC3_DATA0	0x138e
+			IMX94_PAD_GPIO_IO51__USDHC3_DATA1	0x138e
+			IMX94_PAD_GPIO_IO52__USDHC3_DATA2	0x138e
+			IMX94_PAD_GPIO_IO53__USDHC3_DATA3	0x138e
+		>;
+	};
+
 	pinctrl_xspi1: xspi1grp {
 		fsl,pins = <
 			IMX94_PAD_XSPI1_SCLK__XSPI1_A_SCLK	0x3fe
@@ -802,6 +846,23 @@ &usdhc2 {
 	status = "okay";
 };
 
+&usdhc3 {
+	/*
+	 * Only enable SDIO2.0 mode as the corresponding GPIO pads are 3.3V, the
+	 * max frequency is 50MHz.
+	 */
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	pinctrl-1 = <&pinctrl_usdhc3>;
+	pinctrl-names = "default", "sleep";
+	bus-width = <4>;
+	vmmc-supply = <&reg_m2_wlan>;
+	mmc-pwrseq = <&usdhc3_pwrseq>;
+	keep-power-in-suspend;
+	non-removable;
+	wakeup-source;
+	status = "okay";
+};
+
 &wdog3 {
 	fsl,ext-reset-output;
 	status = "okay";
-- 
2.37.1

