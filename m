Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2075.outbound.protection.outlook.com [40.107.20.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3991714A4FF
	for <imx@lists.linux.dev>; Thu,  9 Jan 2025 01:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736386087; cv=fail; b=hyErTBTu/QFmF61bFVZsb9CRMj7I9hvo6lv96uPwGp0vT6ffIMpZnfoDiziwgxQ4pzP5xWchS8olU/WYdKpFpXv2lVJS/eewWQXhKYu4jl/2VFg8fw715PprptpRAdisIO0ftdjsWkVhSPLr9wnOzvS9LFAqU20yg5PUoVA6O2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736386087; c=relaxed/simple;
	bh=MEx8w4Fq0ZkFgqv3G6XeKNZ6xqsAEgdw2VpZeRbSXoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d0fN/Wz+AOkE7/dUfdoACylk+JtcpDhMCMiaiY/9/RS2MzoIJoIaO80L3wIwcdXQ7CNDS+Vz8wfrsf0hXltk6obmoqQF+coSQJpdpockbnteeWGoujU0gYZt4++PivLV8lJpNgJpEkYvIMk+GGbtbYqqZAirX7Hd3cCshLQrcEs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=j4eSlAli; arc=fail smtp.client-ip=40.107.20.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="j4eSlAli"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iaVe/jM4qenJ3HWigiBOnu0RCtVjn86SPS9Yau8axssQoiDT32QYYNfy1VG4GD2GUkxlVcJmybWY3sbl33UAkG/9Nhwa/hLHOs/iJxEyGAFCqX07W2wyrQuiH2WYKsB4avn7TZHHyeiYVIyE1CmdeZ3cIPWQAdbbImHW1UOTLA3lOfExS5MRtkWp4GzfRKgT4OvVKbLCoWhYALBio4d2ZWK63SHkAufCry+awK5dewwZDctNtgyQODZNQ1DGsv2Wn1GNyt2aQLaq8iZw/1HqczyhTBFcWLTVadhELQ/5XizNVCDcc1BaPvdKzXfe//fl2z+8+gnvR+Do2L6SHs9hxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3IXxew9Hx8fonLLsOWvbvUJeViQJp77xfZwO12x8+0w=;
 b=ljhFEvA1KYl4O5AWKz5UGHlVcR1dtduY8DaDQMx9lTvcCm5/NIZAYKUZ14Zylonq5nbntMxcpKRYn4MAr0SJduUDxsEW6lYh2g8IAOIRdlhWjWIakxk2lzXMmHbQ2CYLoAYATDpWuho8OHjMeyBfoREOJbXZtqhU4ecvFU2sVU9o+P/4vsFLY5xsdnREd8tf1kgFgDGvw6aZWg9zVdrlQ/eSzV++pJEaC5Z/4tcr6gcLBK2S2qQGTO6IQTRWujv4PjwOZL+113qxSUkVG/EFXlaLe7WAm3jhwqvnC2FMKKKYyBLyBU+nZMeuHrnksKuImtC6EGtrPOtM0YThCF8xJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3IXxew9Hx8fonLLsOWvbvUJeViQJp77xfZwO12x8+0w=;
 b=j4eSlAliACE8i9HpuNUnwBKZ95bh04PXF7zbmc//bEq6C4mWO4rerMMGwWvCFYPjQP1fM8GsaZc12cZ+OCjkHsGoDnOivrbnaR5tbJP1uU0MaTooohIWpvRPvG8677x9Bb17vfGY7bJvLbvHM+MiSIJbThfcSXd3hMm3M4ZSYIscYxfu4nUIWuFoa6M/6eEa4YAmsjUOvjBrivC8v3yTwEW+xBbBCNJIuc0W/ImY3l4KU4VcjX0u3EWUqTpPiHyuefvBlFaM7N6aZ+yN9vj5iwLpaBV+AXoK6qnIu1eJQkWKufgfbpn9hnQFDGvdJcoNnIk4iwYIFqGhiQieb0cdQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by AM9PR04MB7668.eurprd04.prod.outlook.com (2603:10a6:20b:2dd::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.12; Thu, 9 Jan
 2025 01:28:03 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::24fa:6f9:8247:c5dc%4]) with mapi id 15.20.8314.015; Thu, 9 Jan 2025
 01:28:03 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: shengjiu.wang@gmail.com
Subject: [PATCH 6/6] ARM: dts: imx7d-sdb: Complete WM8960 power supplies
Date: Thu,  9 Jan 2025 10:27:18 +0900
Message-ID: <20250109012718.328692-7-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109012718.328692-1-chancel.liu@nxp.com>
References: <20250109012718.328692-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0046.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::18) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|AM9PR04MB7668:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fbac816-176c-4f72-220f-08dd304cdc9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tWqA+vNYtZbVBSoqv4yPi11HsvbYfjxdv0hTs6alZwftxtSOEzDbiZKH2Rqf?=
 =?us-ascii?Q?WGqPoX01Ff9nA7nL6SDBF0WLYA7UA03QHe1dba07Dx51Cxj95XZUKZe1TvzG?=
 =?us-ascii?Q?BIGpzPf7eg8EjsJstEIq3Ksj0NoqdD8mvdkrhxGgwCAYgs1hM7RhdmBny4SR?=
 =?us-ascii?Q?sMsWyX5T94nDeGQI8kvww5k0YOcjnehZH7HFvJce8k/IsFlgOiNzYbQh0BtH?=
 =?us-ascii?Q?GtT4EoOKdgoYXB3qQzdYskf2FKH1kYfY8ZFUoMJNsYl8rhUqpBjMFfu39rSm?=
 =?us-ascii?Q?ocZi2wztPeXU5dfmKrUhO7tKo9mNTkT/qZJKovrYyOK3SvcqKs0q5dxFt2To?=
 =?us-ascii?Q?2TA59rOf/T+dPkPWGWY6KjIxjTdp72hWGlTjEYUbDypJGuFfuYkitwPkXEVN?=
 =?us-ascii?Q?duRjIMLch0AEnZVtreFoeM4tpcSiGuRmPu/kOqFwzuOIa65Q2icC48C8rUdA?=
 =?us-ascii?Q?XtvaqMr2lXO9HdI9yrgPn5jvBjImk4v5glmBgfHnsI+7ev+Q2Vde8uw/QBGM?=
 =?us-ascii?Q?RhcLA3X9aMLGPPJfKYAgJXaJi06uCyo03gbxfA+1s9gasQSkNvOmC6li7TSK?=
 =?us-ascii?Q?lYboftDlhVtFUl/HT8THqKn4Xg1uhOeCi572GZMNwlVANfZl+YTJoRQ02Qxw?=
 =?us-ascii?Q?6yQkhWKLi1uxEgN4s5+qfglCbBGXphtIwg7JYmIm6rjz+/5ewmPwvgHY69Jd?=
 =?us-ascii?Q?wtE7wmMU/ZnVOQ+kLzcMb2+FdCei6+16bk87+Qfc4yS48C2Ca1UeY1k884JK?=
 =?us-ascii?Q?yEqzcsFcpbonYrOWkJVMGGwyZg49v4nCo//J71ZSuIQ4rg0u6UHCKDR8BsK4?=
 =?us-ascii?Q?M7o3Ar3BObS7czh/0TkPv58zI3pc9cUhky2KhClt5GzxdZzsNVC9vOIIzweb?=
 =?us-ascii?Q?jXBOog7RSZ8rLSMNFPwwKzYEffMNFkhLdyDGIEtRY53Slz3qKkS16Uhx+N+N?=
 =?us-ascii?Q?SejkVw/nlTwx4C1x3xZsJVDIyEpQKaaMcTsHEKKoOvScUTCoMefhGxSSoo8D?=
 =?us-ascii?Q?BcbnD+6IPfM2STPs7bgOrnE1Vr3QSaLv6J9uEzKN2cKPWoaAEUDrmMn45Z70?=
 =?us-ascii?Q?kU3KhCrE9oU3llCYee1tvMKdOoVtb6KKphvXsTvGuACp1+VCBvknvZXD1jv3?=
 =?us-ascii?Q?5PBzsmTl/qX9yqh59ApNw0mz5iVFeUC7JhWlm13etqUct1UlyN/Rq5Q9DLCv?=
 =?us-ascii?Q?TlGw1h94iG4wsCUiSFQeZ6UtZSwerlZQ5EQ6N/bArA+j9krH7jPAdI8TFtbJ?=
 =?us-ascii?Q?6ZqcUAzbkNOfVKfCZf1VZ6QtkF0zg/XG9niWVm5q87u4/5VXxvxwrsXbcGoL?=
 =?us-ascii?Q?PzWkb1soHBYf5YJ430ATIBTLHvpzni6BSABLLkev1rOhtbz8WtQ5OV00bCZW?=
 =?us-ascii?Q?6U862+b2mH3/kAxyU1xSyAAbQmtbr5NejRMg5noGXviE+WZ8naMsKUYGatyT?=
 =?us-ascii?Q?/EUIEjC7ePbrQCxRxLSzelCNhTRlQBgy3zATUSNwZQrSorU8IiaObQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HuZ9Tha3XlHHOvNKm769A68B7CXbxl61E2Vlw+aEaWLCXXhGs0/Ve7HT+3C4?=
 =?us-ascii?Q?lItluD3pMLFTW71xQz6ivxwWNIMAqNTDRk3sMrVGZgIhGPxrYDPeAfn9HP0O?=
 =?us-ascii?Q?XooQA/Xes5TVFIU4HRL1PFYFvt/8MwHqR8ECCRLMVcQk8hZ0/tniganhzZiE?=
 =?us-ascii?Q?yYevG1xKxdtbskJYSatu5VJIEZJUfjxwig6pfFaS/qrEquwwyT7u9mJv/xHa?=
 =?us-ascii?Q?NkOPucCTrZYC8KpDUhMW0BFv65Lz0S987qprkF9W9rDbKago0m5HlyMl/Dod?=
 =?us-ascii?Q?bXUYUce2/q9Z0d/wrUH/ajpyLEqOcXaabG3ualLNtoyc+GS8jWmTmmXqUd+6?=
 =?us-ascii?Q?8+kMcmtIfisJywkwhmS6wKbokq2k62GpRVSVIzi/EnCXTWsU/hKDogFgjvEs?=
 =?us-ascii?Q?vD/iAM/bNFKIvCJZ3Ufx05bfz83xxmVLmC29hqk8dHjCEJIErI72WPbGdyB4?=
 =?us-ascii?Q?0eU3jifWTOiY02r8XtHWiJqDrO08ejyLOH/V91DW+jim75YMB7y4OElwAmF/?=
 =?us-ascii?Q?7eOQ9xy4VEO9UKHN4KZtjEDEfEIykXckZCvaKIU0FOp/ze53VRcZpZ7eyCiv?=
 =?us-ascii?Q?NU+DgWOipbKt9jcwY5NKHDQ6Wtf0cmkwe4wA7IHMRggSEn+Su9Rtb0SOu49J?=
 =?us-ascii?Q?rre4ur+6XTWnoDPWnJjJxX9A8/PgVeAPnmONY+UR9XHX7xCPVNUjZUKr/ff3?=
 =?us-ascii?Q?OhKutJsOw6P+dem1jai3993crRB+TpzB1UiS6eqAKJ4zOfKZOIqrm+Ttisn0?=
 =?us-ascii?Q?To0ZSWyehF4SejKkaPfaNjzhjkFJRC84S6qks4VtbrCQdpOKe6r+4HXpFYZv?=
 =?us-ascii?Q?5bUeNna6bGwzCIyydq+xFalb59esvshevHIVTmhH0deEPqcz6lgcQGaBjK8z?=
 =?us-ascii?Q?mMWjcdoekyqazyfiV1A9/lCRse8woGnZYgigEfIZ7zMDgM1eG67sTa4DsFK7?=
 =?us-ascii?Q?XbggKdGaF8OjnruamJjI6VH4ESoMp/WXXRl5ykSgbvVhtmdIDbnHOdWoSU1N?=
 =?us-ascii?Q?UVD4cx/p9hvyfEhE1k9rqaoO0bu+LTnkAiTrgVVvVWSusNm/rNs1tCBKYbDW?=
 =?us-ascii?Q?nLSRy1kecuZHLIiO+AX0ZjWAlaTW5XR7t5LYc4IRaC0AkbwH0FNO7EXCZUoC?=
 =?us-ascii?Q?v+NYRmi01bteqzkL70VPeh/z7sax3rHsSlTFoSYa7ikvVbXJrb1D97HN/JKD?=
 =?us-ascii?Q?bYxAXS3WbbR/p34BfmXKuOz0nfJpTKmcqomx6PasOf1pelrjBdKaq9iMH3/F?=
 =?us-ascii?Q?nh9/gsnSbfiy6isom2blAtrkzojT4mjTRmQuQxqy8r16mtYHUfRvFTDq+q+p?=
 =?us-ascii?Q?xKFilYdNm7z7CGR1otMkvsTo15Hi6RhtkoqDP4DD8Vz/4ANa1NQPtVHQ9QUm?=
 =?us-ascii?Q?DeNOpS+48m9M2mlXTnsMU2bdww7/L6SihKDX3aXYwPFbH2wXjJL13p5Rnxfa?=
 =?us-ascii?Q?PEOiIwm88iQtvMZcwQCVM0CZkY1IhgI7WTEmvKfejQ3nO6YNSvDSjBf54c6Z?=
 =?us-ascii?Q?etlaUrO8YYDKBmpIcGDu0ZPAPcdVE+/4MZ5c05kMfx3K3m/rZyPPfP7B3oYO?=
 =?us-ascii?Q?3+2nxfvqIMR31WUzdixoxtEiAGtY+X0mj4D4nFwb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fbac816-176c-4f72-220f-08dd304cdc9f
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 01:28:03.5246
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7XsBlc5ess/K1/NQc8N9DvfcDFKd3vJ9I1dX9Nno0gDbV4Dth1fuNFiWy4Rr7ptYc9aHof4ZkS3HJDLuahJlHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7668

WM8960 has the following power supplies:
- AVDD
- DBVDD
- DCVDD
- SPKVDD1
- SPKVDD2

Add new audio regulators to reflect the schematic and complete missed
power supplies.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts | 32 +++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts b/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
index 6cde84636900..17236f90ab33 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts
@@ -143,6 +143,33 @@ reg_fec2_3v3: regulator-fec2-3v3 {
 		gpio = <&gpio1 4 GPIO_ACTIVE_LOW>;
 	};
 
+	reg_audio_5v: regulator-audio-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "audio-5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	reg_audio_3v3: regulator-audio-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "audio-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	reg_audio_1v8: regulator-audio-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "audio-1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	backlight: backlight {
 		compatible = "pwm-backlight";
 		pwms = <&pwm1 0 5000000 0>;
@@ -406,6 +433,11 @@ codec: wm8960@1a {
 				  <&clks IMX7D_AUDIO_MCLK_ROOT_DIV>;
 		assigned-clock-parents = <&clks IMX7D_PLL_AUDIO_POST_DIV>;
 		assigned-clock-rates = <0>, <884736000>, <12288000>;
+		AVDD-supply = <&reg_audio_3v3>;
+		DBVDD-supply = <&reg_audio_1v8>;
+		DCVDD-supply = <&reg_audio_1v8>;
+		SPKVDD1-supply = <&reg_audio_5v>;
+		SPKVDD2-supply = <&reg_audio_5v>;
 	};
 };
 
-- 
2.47.1

