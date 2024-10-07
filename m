Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2089.outbound.protection.outlook.com [40.107.20.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93C014AD17
	for <imx@lists.linux.dev>; Mon,  7 Oct 2024 13:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.89
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728308674; cv=fail; b=mXkDWZKjfXm6U0LLso3f8Mx3F7krLT7DjhzB1dlXO5TzsV1L1gqf/VoMZNaAWwTQOS/Cnt94OnaFI+ECD8bx72V+4r+2xSRZGqQOrD6r8eim9UV2plM5nynE0k+hAIH6SU3k+8qUiLONTSZT+KA4DglPwPqldPTUcG+1s2BF1QU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728308674; c=relaxed/simple;
	bh=zupFJ8wfa+/IFXdpa/AXC6qDDDnI8PDChzrzyD6TA6k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=TiS0rBxRu5uxHITz1vnL9NYUJbiVdT7xGFgUvgzKViclEclinBQmRmUZnsb92hV+INWeNI4FmjFtCYExASVPopslaUXEKZVg6HkL7IkOXqWIzwn8X57fPbSLPT0rRCkfihPQw4wkYygdZvyPpd2iAownnY6iAf4O5JueoSULMRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=UK6dH9ad; arc=fail smtp.client-ip=40.107.20.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="UK6dH9ad"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qWGHodDPJur6oAzvfiaM4vpitiUDwK/eLZDg6cRhva4bedlpigpMMvN6PYSqyveJOO/LxGFVUbX0XAg/T+kHwm0A8JtwjFzaE8NmzcxK3rU8oS1kGMqIphBgCbZYnKwG+Iwj47FeVkW/rdnSkt5sBiNVqDLNmy1yEpYQLMAb8/BOKNRbR1JEZeiUEVbJOi1JoBV4HvZjvMBx0kpLdbm2BfjNXHKU9m9uVvUZ4oAeLeDifoamp8zsj2dN0fPzZSDRccPX3GOmkSxt8i0HnMI7INS+2/KSRLc6lEOhTiquq5RVHRDvuIcCy48hVLgzsMWuW/UB+Q/NCZGDCWAuoO2ZwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+fU6G3+5GFgUiaUylVlZ8udTBxmuBU8bJvLHgkFwDI=;
 b=giFAiNmXsw3Bsqtf+3lubhCPiyBd5G78iFBsOCaw8LGAjSMDdRyOz3Zpr7LlZW6v9wHIqqewZiiaST0yhLrSqHEUvhyW8yr7teRAOqvaZFXQWq4ic/ylPN8pXW0lRPyVP58oTyEDd8go7YNuvHGx1A01iH/g3kwP1UNupo54CFTFCazQpOy2OGljDmwEuVmxVpMoBi0l60qsNlBL2Bm3Ky+4/y2mdy+R7mlA6CHqDl0hfXgOQOItoGdYBMRFvZ3/ecPte4ADhd6RTx/kjpvoBziBO2jH4SEYmW5DqRN5cGuXCIl4mer1zzyAL6IS58ufxOxiSp3AAdD46IqH+H4eBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+fU6G3+5GFgUiaUylVlZ8udTBxmuBU8bJvLHgkFwDI=;
 b=UK6dH9adRWt8gsGTdgtbLD6ubCxoFnsrWla1p5mRRVYgTkbObQJg1iOwmMG03/OgyzhdcuR78ENfurs8ZNYqbocjuMPxgCww6DPSllu65+7Mg+kqm0AvkzZqVRPxxXVp0taToGMryiICCnmxxFEKosSf4jeqrIU+UX5g8cl3jy4=
Received: from DU2PR04CA0247.eurprd04.prod.outlook.com (2603:10a6:10:28e::12)
 by AM8PR06MB7363.eurprd06.prod.outlook.com (2603:10a6:20b:361::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 13:44:29 +0000
Received: from DB5PEPF00014B8F.eurprd02.prod.outlook.com
 (2603:10a6:10:28e:cafe::74) by DU2PR04CA0247.outlook.office365.com
 (2603:10a6:10:28e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23 via Frontend
 Transport; Mon, 7 Oct 2024 13:44:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DB5PEPF00014B8F.mail.protection.outlook.com (10.167.8.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.13 via Frontend Transport; Mon, 7 Oct 2024 13:44:28 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 7 Oct 2024 15:44:28 +0200
From: Catalin Popescu <catalin.popescu@leica-geosystems.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	m.felsch@pengutronix.de,
	bsp-development.geo@leica-geosystems.com,
	Catalin Popescu <catalin.popescu@leica-geosystems.com>
Subject: [PATCH] arm64: dts: imx8mp: add cpuidle state "cpu-pd-wait"
Date: Mon,  7 Oct 2024 15:44:24 +0200
Message-Id: <20241007134424.859467-1-catalin.popescu@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 07 Oct 2024 13:44:28.0399 (UTC) FILETIME=[07AA67F0:01DB18BF]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8F:EE_|AM8PR06MB7363:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: aa6c3ac0-bdff-423a-da0d-08dce6d62a52
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iK3Az+PRfLzCr3ZKIzYPYrHiqlZ+pZe7yWlcWfL6alNTW67BdhuDFsnNKU2N?=
 =?us-ascii?Q?Y4EUdhMRzxD7iEZjp03moyhwAD1Ps9+eqaquhnE0m5BjcG311NH/j+97QYX5?=
 =?us-ascii?Q?ti30wvMiud3zqEa4U1ym4PLTVGfvjZqyIwWC2Wt9RXSB70EwYnoNzguVc0t0?=
 =?us-ascii?Q?+NQnRRDazzBMmoFeqjVEHVpZPtotaFxqAM0MyXWTHY+hDXclWoQ4M3ZvygDR?=
 =?us-ascii?Q?l0p3XNLLihOT1dyIspdeH+sO3kU6FN+6h8GHNlO4J7VKr/A/rqkhZTwgTTP9?=
 =?us-ascii?Q?lzpq+GEIRmhC38fbnudwcs+4zxIrUcBI9b1/Fo+jZTqjZ6Kk6m1f0XiBR+Co?=
 =?us-ascii?Q?pna9qIaRCyW8ca2pWRrFy8iyp2xdjd5HqalN0axSdN5ofRgKCdjezdf/thle?=
 =?us-ascii?Q?4VouwynOtNEbMx72VlepJ9JtfsDpz4qd9OGnRVzKTe/XsG7HERUdmQfEJ0L4?=
 =?us-ascii?Q?bXM2pU6dos7VaGaAO7CfcdyMO7RPZfJySp7QqDwNdJLSq/Qg58zuNmbDtrFm?=
 =?us-ascii?Q?VLPn+Q4AZe1l+dsgnwUeyZHfkzI0FjCApv3J9xPadSXZBDoaD1bc3T9ep0T4?=
 =?us-ascii?Q?MvUfAlOU4ylWncw/eBSBN1mTDFl9k7SbGKi2WPHATM3IHBEtI1lKUB26z/xy?=
 =?us-ascii?Q?5UA7l37O1gXFCCB/eXVg+hIVhOPlUUcrQD5xEyELhoyfrfvx2MZjrOxJokm0?=
 =?us-ascii?Q?k2RAvazE1CNcdmOMyKRfTwmhj6gyc5ArKfsvKDYrdqJolz6a8HT43D2viGI2?=
 =?us-ascii?Q?j0L8QX4zNUg15O4+QEzebCW8O+v0ebdMO/OJB+nhohLypqfeEXKP7+rX1Qvy?=
 =?us-ascii?Q?ewS9E78Ohe7Hi63D8DXKAKqxkX83bE68+E43XOy7ukZUsuumOxibB3HX2CCC?=
 =?us-ascii?Q?oeKyqwgRteevRPhq5hS95iScEV/Ws2c+VsQ1adfg/5OZRp5mcEvWOiSoi2mB?=
 =?us-ascii?Q?ldFYArdVN+G/jujdonCEvNlmxTqmose3TN1IqslnnivlsTh4dfqF4rclZeEJ?=
 =?us-ascii?Q?jcxDSb7VgcCzfyigBx6pvmfEnLIz97zYRUpHYE1eZWBhsQjUdh2B5O0LKm3x?=
 =?us-ascii?Q?tE/NfEKKbmH2m8kfUH0tUgufhJsvPoF6NE8Rdq2GIrcmXnRBpac4tBTwVAqR?=
 =?us-ascii?Q?yQwR/FM17lB7dMcJqCyHcm2c6J6HS0IfUOjgdFllj6RdfdjfuWOk3zPP7KOi?=
 =?us-ascii?Q?92PLT5z4twCy4tedlwGcUOaZLRZzqtOXn4rREs6PZFE9HfUbsUMkoGgTb6Qk?=
 =?us-ascii?Q?tm6T5l975EaNXPKm7aR7AHsf++e3JhmAqXBIhPdlm631QQXz4kQ5tdGh3r+A?=
 =?us-ascii?Q?X+8uVMXeSdtdPkYN1nd+0fMb65B83OQLD7JtMm+I3OnNG5g5/a/ghWsXUlqb?=
 =?us-ascii?Q?1RECVCTr9/gSNNujOs4Kp1X6OtAV?=
X-Forefront-Antispam-Report:
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 13:44:28.6605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa6c3ac0-bdff-423a-da0d-08dce6d62a52
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR06MB7363

So far, only WFI is supported on i.MX8mp platform. Add support for
deeper cpuidle state "cpu-pd-wait" that would allow for better power
usage during runtime. This is a port from NXP downstream kernel.

Signed-off-by: Catalin Popescu <catalin.popescu@leica-geosystems.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index f3531cfb0d79..8b1e0ca248d1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -47,6 +47,20 @@ cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		idle-states {
+			entry-method = "psci";
+
+			cpu_pd_wait: cpu-pd-wait {
+				compatible = "arm,idle-state";
+				arm,psci-suspend-param = <0x0010033>;
+				local-timer-stop;
+				entry-latency-us = <1000>;
+				exit-latency-us = <700>;
+				min-residency-us = <2700>;
+				wakeup-latency-us = <1500>;
+			};
+		};
+
 		A53_0: cpu@0 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53";
@@ -65,6 +79,7 @@ A53_0: cpu@0 {
 			nvmem-cell-names = "speed_grade";
 			operating-points-v2 = <&a53_opp_table>;
 			#cooling-cells = <2>;
+			cpu-idle-states = <&cpu_pd_wait>;
 		};
 
 		A53_1: cpu@1 {
@@ -83,6 +98,7 @@ A53_1: cpu@1 {
 			next-level-cache = <&A53_L2>;
 			operating-points-v2 = <&a53_opp_table>;
 			#cooling-cells = <2>;
+			cpu-idle-states = <&cpu_pd_wait>;
 		};
 
 		A53_2: cpu@2 {
@@ -101,6 +117,7 @@ A53_2: cpu@2 {
 			next-level-cache = <&A53_L2>;
 			operating-points-v2 = <&a53_opp_table>;
 			#cooling-cells = <2>;
+			cpu-idle-states = <&cpu_pd_wait>;
 		};
 
 		A53_3: cpu@3 {
@@ -119,6 +136,7 @@ A53_3: cpu@3 {
 			next-level-cache = <&A53_L2>;
 			operating-points-v2 = <&a53_opp_table>;
 			#cooling-cells = <2>;
+			cpu-idle-states = <&cpu_pd_wait>;
 		};
 
 		A53_L2: l2-cache0 {

base-commit: 58ca61c1a866bfdaa5e19fb19a2416764f847d75
prerequisite-patch-id: 0000000000000000000000000000000000000000
-- 
2.34.1

