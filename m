Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013055.outbound.protection.outlook.com [52.101.83.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B2B394477
	for <imx@lists.linux.dev>; Wed,  4 Feb 2026 08:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770194125; cv=fail; b=iKfDow4i4vro3iVUy6ZMEel9d2oNYEikq5yLMWb2ccphHfh4of076EgQYAst1aGVMekmYYgZtwW3HwRf5byDCD0qDkInVbAYy9ozOqVGkTpt1/Yjur+4GlvJKsnX0IWDK6LfoBsujAYm+jK4yH9OdpkloAz+hiMYVd2Fn2uzZus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770194125; c=relaxed/simple;
	bh=dg8WIIe9QYbkSmOjv26CwbQupTK/HN//gQ+xIR6+fJE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dhrzNB6rcKbaJI6MG23708QHo3SKpyo4IWtlPtK9Ie4ow03h58uMKO7VemQ8EPf1b8SqIliP8XZ1RwZWcfsALUgRD+L/hBKS4xkrh8b6SLyQgYWv/jGNtFLMf+ZLeP7plR/UulYx+cc1scs7MsyqHGrHk/GekOu3Es/ZRvjx2hM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZARYi5oJ; arc=fail smtp.client-ip=52.101.83.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZARYi5oJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T7g2y6SF+qHnHaAUqU3iw+wkEZTpPyCGyLu0q/RPaFV0YAPxjgwTSz/OOieZQ6kjinOHKA3w/klwTbYUW7GfSh8441LkHrz/63r4J2nKrlHrEZADXD2b8+MGeRVAhNw3QWGme6LY4bTJAmagHhQVPN7h1cx4I4qRFckof6VZqWbx6XSoxRz1cuIxHkWbvef/Hgb57GyFRAi3ksBJGEY6j9Sbwm7r1gmaUQpwJHx5ulMMpdISKnrzqqMZAiz54RGKNtmrf0KmARQFdEkvZTmwFUHJy/2+HJyyHcTqG+3mbuYRblgz9eOdynpFB6JtrX3AcNQvDUbLH3D3UKNu4SRZyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NiYJSAwCHQyP5hfAcuvdxIOeny/syGT6SCxxQ62MdNI=;
 b=O0RumiKO3+o6JM1Lyq92KLuMBDAGeXqa39gFziBpjJ+9Ah35hGeuK3hnS31Ivn8od1Dp8WyXK6OAuNfT4AcRRfU8Ko/4vADB0gc2QVCzmhN0ITOWipb6eqt91mmWP0e46NelNIa5csX6ws7CB3z7P2z9IOsxCehGpHMEgwteRvBxSDDRJFn5SEpnXxuvneehkxPSCj1E8Iz3Eu7OvlXsU9Fe1h4oIjeaoGfw99pa2k93jOwp24bTz/FRU7SekGDNnInVjCDpDk5CluAKeX14VQl2m8ndYDgR15WHFiVrz3CpFVelRPpTkiXhskJIX2O3g9/SQS3VLjMuMNppdGsaTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NiYJSAwCHQyP5hfAcuvdxIOeny/syGT6SCxxQ62MdNI=;
 b=ZARYi5oJCdECM9YxCkN3bpeqSkwBQ+FMFlKLNLE6Qt/y47F/3cP9EK6iea6dTvV5OxqWdj42FbVzfh6LT/wafY8qOro1jNHcYt3/fq5UTj5MggU2ADDqMgEsgFe5FuKymzyY04xaf9NHKhpPnZNovyvzCZ5pbBzr1KPYr7P8H9DkXYsjLFDfB9ckQIpeFFe0bcts3Y/NvYkIDoTg+PysKxfvkZeQgCynYKDURRnOIfzd4V5Q0OXzvLVeKPZR+ENkhRkdSBBOXMI7QF+gqeri+XXSm5FOViDuec/NKaaNJJIN7/JWqvqrxalehbHMjJ0IvL5tKg6lDTfpAj7Cn0AYJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by PA4PR04MB9245.eurprd04.prod.outlook.com
 (2603:10a6:102:2a0::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 08:35:20 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 08:35:20 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	daniel.baluta@nxp.com,
	dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com,
	Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com,
	y.moog@phytec.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com
Cc: imx@lists.linux.dev,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH V6 4/5] arm64: dts: imx93: Add imx93w.dtsi for i.MX93 Wireless SiP
Date: Wed,  4 Feb 2026 16:35:50 +0800
Message-Id: <20260204083551.2867263-5-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260204083551.2867263-1-sherry.sun@nxp.com>
References: <20260204083551.2867263-1-sherry.sun@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:4:197::7) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|PA4PR04MB9245:EE_
X-MS-Office365-Filtering-Correlation-Id: 366a17ca-94b0-44d2-dadb-08de63c854d4
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|7416014|376014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?q5cWD8nLsXgfjCsSRtHrZTKtfes9Z6VvceBmm4f5a8GlLTsQGBi6/QgTyIyP?=
 =?us-ascii?Q?JU98HCsO4bSlz2xOcjVg1T/9W3auI8RndbhLRJq2CCO9LyZ0TRrP0iXhDanh?=
 =?us-ascii?Q?Fi+wT6lo8UriFD3qV1MoEKve9anklCxV8XhI+TX3SGJ3nCxLnL9fNcyrqFtx?=
 =?us-ascii?Q?dGz5EKS7TA4kAdzElCfDIx0Kd6Poi/CCrooTuJ0TMk/2OInzdxllrymq64lB?=
 =?us-ascii?Q?CawufzuHIHhNTtbaOSVrP6gJ/FnCh7VUyIzlh8Jt/n5x/xeL+HFEtbiiN4Ev?=
 =?us-ascii?Q?WnDjbSGlvdoRaSE/82uS+ZdlTuClqVcAt19WCVsSL7dy5TvAJfaYyxslv28g?=
 =?us-ascii?Q?QYtqWOZWVDMYOHAPWSsNnBuubnR/I6ZtARY+wzEuyOKHNf2eQpuBl2hPr6uB?=
 =?us-ascii?Q?7wmmZFkXDc/WWHyFPCrKNyu403DiEWZqQooZfwGcJrPDiWdf8eascXRnxlJR?=
 =?us-ascii?Q?OKifkTHELA7L4e2OM+mPNM2RhktpgOSJehpzM/tRMIN9DiMBjnBe3dXQycpw?=
 =?us-ascii?Q?TGf5CFM8rqnL0RdzS1KTmrY7GpblCGWOAM0H5hhs3B48PGrE3cA4y1krfU2h?=
 =?us-ascii?Q?UArc3HEre49CXIzdrk3GGRHW/aTuXFXR8riXiaWRTHObDbMzwAMqugammSql?=
 =?us-ascii?Q?+s+W475HJtj+Y5swmfTQwCnzI3elENWs85nHe6EBK5dn5wn07Tx9f2tjS9Tt?=
 =?us-ascii?Q?AKT3KLFqWF2/nbxllGtg1hf52yj70MCs4KXzYydRM74pZBzPwdDGbQ7rdS/s?=
 =?us-ascii?Q?iWjJinLyk05OVo3x/qfoqDvEMLsbbEw6LioEElW+eke10sF3AiHctdwIZg7A?=
 =?us-ascii?Q?henDNjTCWlQOhbhgBWi+fpSoMXS8bDhxU3CetuuqqquSpBf1v9EqAF4RWiux?=
 =?us-ascii?Q?nRX98bvuWcHsPRxFuU7Mlxb4G5VsAEbVrSJ8hoAN5Dlq3BRJem/bYdUKI/tV?=
 =?us-ascii?Q?/fqu7rUOIpnArht0jTPZzcB3qx41fKzUO3OtvOufuiay831hnXfA+5CGz3TW?=
 =?us-ascii?Q?NE0eJfG64fH5Rvv2jNx8yVres2kd6jiztwxIqNhgRoEllNFiDkUiWLBhlL+w?=
 =?us-ascii?Q?mO431n2Z6m1kdWVp21iwNkhJoJSUjKuXlRKa99npU1nZ7ktL9tQBBfFy+hb8?=
 =?us-ascii?Q?0lxKpVOkW/24EwjYPH3o7BunfStzdi1F3OHfuzWTjfJEt7uyvJjDhXndsVdu?=
 =?us-ascii?Q?IjNkChOVDAnlK5IKO3vAM0Y+bXVlusKLoMBD33RjO3TEPeo6sj0+LuAh5Pkj?=
 =?us-ascii?Q?m8QvkUvfOsMhJ8PSHrLx1/V7VLBdaY8yyCEPNX0973B6EQcwShyHn87HNB2Q?=
 =?us-ascii?Q?yIyxQWBlW9IJqwJ5HNeWQ/iV25GMc4r7cDn1lcM81NdF4TS97la7CEvjC2MQ?=
 =?us-ascii?Q?XE7Bsfsl/c94Vadl0Xp0+g7ME9bgPFp0O4yHtpGrEl3erAJDoPE4kCuN9MTx?=
 =?us-ascii?Q?r+X+I9FHSgL1x6XWIjwNsEcEZXYoIoZQCUJgfswvj8kuU9tHO+pzvhI238nB?=
 =?us-ascii?Q?Cy5UC9yKZG6Q2a1WDn1M1E1VDK9K2WPCtkXVXftQm5GI5yZXsAynPfcLkoPj?=
 =?us-ascii?Q?6DyyTJiFueMx+NCO8BcN1LIOjc9wNRrDQSMpwC2ODAmxJAkDRC2OZ+nYLzS3?=
 =?us-ascii?Q?4P646Co/rGmDmKMl+1ieBrIo9pGujZz8jOOFREIZHxkN?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(7416014)(376014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?1YF9CMQJDY7lVBzpPSHNjlUuIlZNgYnHYrNChhGsho1pUUNaJPy+szPKkBEX?=
 =?us-ascii?Q?9lje213jiVPGlUCnDaHBzQ4LjllAeYZUbqS4GHfaSf/7j9wRlllh8sUQPdOb?=
 =?us-ascii?Q?7PFJFDJxK8f50hACndTYcf2kY+wQjn/cr9IcX8L7SDEzqKya+zThAhVMNfhK?=
 =?us-ascii?Q?gXsjoLIubtpW/5uQjPKKAeOXB0E/VPPa73F2+RlbmOWqWtAK1uAgjwazE5FY?=
 =?us-ascii?Q?sCKNenV98Gz8sd4HOsDSgLpCBSWz25D/7N/zir9gdpZXQnlXL5LRDX7JCPOl?=
 =?us-ascii?Q?35cUKO2hkQLdZX7/vtQ/EW9otjbhyJyvcOf+hRm0D+q9DnUDlRb4LzgTh2hP?=
 =?us-ascii?Q?UC/nUmuAWi7bu/TlIq2NPOv64xw/9j6UbFe1dP71osPSHPO2o46cgkYe7VuT?=
 =?us-ascii?Q?vdzikmV/K6KJJuNem3tDcA+VWo9yFq4OwerxXmSRAZX0AFn4d6MlqgJWFK/N?=
 =?us-ascii?Q?Sq69GABRHTmyBlKrZCnGun6KcYCN8I/YysbRNc28tbEIMKJoP7yUI61BK/Da?=
 =?us-ascii?Q?DZFkpxpJaQ36Qa65hv9rHcrAtOFMa8AsZrKRhuaeykRzpIPqjy+czqbMooha?=
 =?us-ascii?Q?XcBqwjpQW5WdO5aY1N7wzsYM+c7uEGd0WVynbA7rLTG1OZy662oZhBkU4CRp?=
 =?us-ascii?Q?thv30d53jONbD6Sp0/xqOYA7OxV113U/lhNU0kZ7Cetq0DHl042RNccJBMfN?=
 =?us-ascii?Q?LWERyEp0iAJIaPf7htphPv2oxrt40eefAPKNpKSJhrDNoLvIrpE1x4fczyia?=
 =?us-ascii?Q?BQlfHEdVRLDg0sM8TLtMz2xVLiC7fv7M8EO8qtBM0oGhrna6Re1QywSTLRNk?=
 =?us-ascii?Q?2cYmnBM01LQoEST8ettKq9xpQUcl6UUpPllwnNm3yob1wyFONg6cwge+zcKG?=
 =?us-ascii?Q?FA2zQGCi8MEnaN2Rdp3NwAv32GgG34jUzZTMp+uWJ8+LoEqkYTjenRo+WAyK?=
 =?us-ascii?Q?FKwTLYfmjIWgo68GoJSi9oP+cikzdEDvT4MfnxT0ifC8ZUq4ZNC1DO8XnmZk?=
 =?us-ascii?Q?rxtPFxiiUBpJznq2h4d9cDKGDlXLLM5fT3GXbvSKcEDECCIlJh1ZdR23eiXH?=
 =?us-ascii?Q?j5HZ6QdqSv86HYycoyP1e5Uwd1ignqaPdCR78S0e8iNKROh32Nugo5OE/biG?=
 =?us-ascii?Q?DZ+bGOBWJYOgTrXRvziSzcHyjFhQMaMpFBTe5hO+dfL/b0eOlIAregxJjWXc?=
 =?us-ascii?Q?QHMAQ3N+t9NljwaYhwqwI+UBPa3Z78dSF9iSoOXL6tV53hRwx0JwQa1FEmRd?=
 =?us-ascii?Q?AwJpiTfxpFtUgdthnCpRw5wyfgf2DWCjGvzsZMiM//HBEE1yAZ/0EmjrDG2/?=
 =?us-ascii?Q?XLi0Y2JsisnV27NGATNWNUr3d6bwkZzK1pMykgFOBTdMkxWoyVRX0AWnEAYh?=
 =?us-ascii?Q?jWGzlieTmBUhAjSdmK2UQuPGOMi/22DBqsVJsxx3b0XXusWJtG8QKVxcmJbj?=
 =?us-ascii?Q?2pi5dAjy1IB1ULUkp1+56S2goNVvp1FYK4tSFoUagTdiyardBqsXd05zmt7Q?=
 =?us-ascii?Q?kW6UfB3BLUIHd+dyjB7ybtY2q0EkCgFVHp78nvQUHp2Rr2kPSAXqiIo2WnuH?=
 =?us-ascii?Q?Kp7foJVQyyMc/0J3Ww8JanmrTNYKPWlsUWC2s+OBiVC+eO1KvGFw6Jh+ZYk4?=
 =?us-ascii?Q?E8ITzm1QQqHEfnmngr5kcxTmJidV5nKYs+J5f5Sv8gxTQ99ATifk1sC+qWxd?=
 =?us-ascii?Q?E468biOmAENmolvekvgSRRYE1/WoQTuogQv70iGVImZKrTrMb2AG1kcqASTm?=
 =?us-ascii?Q?i9KLapu43w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 366a17ca-94b0-44d2-dadb-08de63c854d4
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 08:35:20.3404
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XnbU+4I/gbuUObTFb1Uku6fYEeZaXYi0mFnE/yLwbdsab+yUjCOhlrTCilGg7SwwMEjdGYPiWX0d4qAPobpThQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9245

Introduce imx93w.dtsi to describe the new NXP i.MX93 Wireless SiP, which
integrates the i.MX93 application processor with the NXP IW610 WLCSP
(Wi-Fi + Bluetooth LE + 802.15.4) connectivity device.

The new imx93w.dtsi is based on imx93.dtsi and adds the pieces required
for the internal connection between i.MX93 and IW610 inside the SiP.
This includes USDHC3 which is used as the host interface to the IW610
and the required GPIO settings(e.g. WL_RST, WL_REG_ON, etc.).

These nodes reflect internal SiP wiring and are not board specific, so
they are placed in a dedicated imx93w.dtsi file that can be reused by
multiple boards adopting the i.MX93 Wireless SiP.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93w.dtsi | 110 ++++++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93w.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx93w.dtsi b/arch/arm64/boot/dts/freescale/imx93w.dtsi
new file mode 100644
index 000000000000..95fb025c3949
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93w.dtsi
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ */
+
+#include "imx93.dtsi"
+
+/ {
+	aliases {
+		mmc2 = &usdhc3;
+	};
+
+	reg_usdhc3_vmmc: regulator-usdhc3 {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_reg_usdhc3_vmmc>;
+		regulator-name = "WLAN_EN";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio2 29 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	usdhc3_pwrseq: usdhc3_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_usdhc3_pwrseq>;
+		reset-gpios = <&gpio1 10 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&usdhc3 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
+	pinctrl-3 = <&pinctrl_usdhc3_sleep>;
+	mmc-pwrseq = <&usdhc3_pwrseq>;
+	vmmc-supply = <&reg_usdhc3_vmmc>;
+	bus-width = <4>;
+	keep-power-in-suspend;
+	non-removable;
+	wakeup-source;
+	status = "okay";
+};
+
+&iomuxc {
+	pinctrl_reg_usdhc3_vmmc: regusdhc3vmmcgrp {
+		fsl,pins = <
+			/*
+			 * Enable open drain and internal pull-up to allow the IW610 JTAG
+			 * connector to control the PDn status.
+			 */
+			MX93_PAD_GPIO_IO29__GPIO2_IO29			0xb9e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x1582
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x40001382
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x40001382
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x40001382
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x40001382
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x40001382
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x158e
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x4000138e
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x4000138e
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x4000138e
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x4000138e
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x4000138e
+		>;
+	};
+
+	/* need to config the SION for data and cmd pad, refer to ERR052021 */
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__USDHC3_CLK		0x15fe
+			MX93_PAD_SD3_CMD__USDHC3_CMD		0x400013fe
+			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x400013fe
+			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x400013fe
+			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x400013fe
+			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x400013fe
+		>;
+	};
+
+	pinctrl_usdhc3_sleep: usdhc3grpsleepgrp {
+		fsl,pins = <
+			MX93_PAD_SD3_CLK__GPIO3_IO20		0x31e
+			MX93_PAD_SD3_CMD__GPIO3_IO21		0x31e
+			MX93_PAD_SD3_DATA0__GPIO3_IO22		0x31e
+			MX93_PAD_SD3_DATA1__GPIO3_IO23		0x31e
+			MX93_PAD_SD3_DATA2__GPIO3_IO24		0x31e
+			MX93_PAD_SD3_DATA3__GPIO3_IO25		0x31e
+		>;
+	};
+
+	pinctrl_usdhc3_pwrseq: usdhc3pwrseqgrp {
+		fsl,pins = <
+			MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10		0x39e
+		>;
+	};
+};
-- 
2.37.1

