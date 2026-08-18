Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011060.outbound.protection.outlook.com [52.101.65.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C033A7F62
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 03:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787022235; cv=fail; b=A+mR7HMunnmxnJ1ruhzlkYMi8bZWGZs+fJXmaE+3J6h0X48YMKw1yf5O2Bz5DxO7zL0N65nebl/c/uLRaLT+kUPHYZ2CuqemFW5coE1Kj5v1V8HaMmMNx+cO51ZsM1ZBfMoNpMR3ABuxliVOPKBGAywXgfei8fRceI3yPEI2gag=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787022235; c=relaxed/simple;
	bh=UueXP9kdyQeuWK1nBBzDlOxYV4V69EKPmdyAoyC9y8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q9nNmVXPUlUJBprLiP5dx/vBF6YbiP0fjWsHemDG3GpV8JRCb6LPuseF3QI8NErfUZUK2LIoQiWsADTr3qqXQN8S8WqDhN6Y5ErgNGX4xQlliWXdn/LxOySEUb2BKO3iAV75DKoqOLZhKBtLNV9gjytmap15dVcM/gk7XMumxwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WP0eImlK; arc=fail smtp.client-ip=52.101.65.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WP0eImlK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KUuEr5BoDQMVSaWlmSIsKQq4Iruh3XqvZQNJ1OAurrsjK8+wjE78Ba28a6fNWmzWbuKlSgx6j+NL1JpAcrs0WITMjgloIf+GyTu3LG/8MK+mfZ1uhrNOKNIDWdBYrDha2IqQtnF8OnuT+b7aDiPPtM73RM9Cufh1YaPDRlNMsTAs6TvAUWY73s41SbZqjYhN5cUNgyAv0suSgaZlgNWbZidjVbXCWoDwBf87FmAX8WaOFaoayzy+iJxcT+Y5w6lK7fa8rxYOKGsHbRdWZd9XzYrE095r2FejHpnt7oqPXuOZ3wVSkDfwx8LsBRezP0Tpz3Ai9thmriYzrKjsV3QxNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oVvw27lj2MNH4Xbpx/tPfQSZ20ijWJ53dNpeHX2Y5qg=;
 b=kNytgkPR/bO96Yv5kOzx3CBhfC2/JaCbMjGQnBBI3L506zlHksJS2xW+bvg9jLWi9GkHk/lN7zCN6Jo6R8gMMdbWoPStlgqb1x3UemUHGwIUXV5oEXbNizfyCDN0GrAaoeuYu1qHzQS1Hl1C5Ub0IzFFPpN37qNlMeP/ArW6+fNt8K3ggyLDU64jpbr/s0YAQi40rtNs+3tCSyqoRR+uvCuLamdOsRFRcoa401E9vR5lb7b6pl6uIR4AnoGOg6xEHw18DE8RtoBUrceZImNgS6+l5jClB9AllJIYJ4rSxUreZhMLsFmjNEzziwwG6iu1Oow7NJOAyhySTJch6k9MYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVvw27lj2MNH4Xbpx/tPfQSZ20ijWJ53dNpeHX2Y5qg=;
 b=WP0eImlKyny5r6CXxJXtQjJcm/ZeAjBdDkSBUSKvNkCOP1ixnn9zwqBiL5b6ih85nMr3oD1+B/d4MhzSwy9jwapLoeaN7i+T6Nu0EhdlmdxCP2otkojis0B21mbDg6XoJasj7sK39HtLyJRKx65yS78E4s20jjcWaeXzm2lYWjCkMldx5so8FxOk9CIl+XwfwG12EF1pACvUi0ASSgTIcRH98fIS+akWnKTXYgsi88T5ekQdyBepYGm2Sjzogltd+jxDGSTZsQlXoI6Cz5AuqvaUXGqhHsucX8cW+ZMJHdrhFOPRvX6hnKKF0h0BtWDaiQk8u03fbERueBcyLG+aow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AM0PR04MB12144.eurprd04.prod.outlook.com
 (2603:10a6:20b:744::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Tue, 18 Aug
 2026 03:03:29 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 03:03:29 +0000
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
Subject: [PATCH v2 11/17] arm64: dts: imx95: Add clock and sound-dai-cells properties for MQS1
Date: Tue, 18 Aug 2026 12:02:05 +0900
Message-ID: <20260818030211.3141710-12-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
References: <20260818030211.3141710-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0147.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2be::14) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AM0PR04MB12144:EE_
X-MS-Office365-Filtering-Correlation-Id: db07c78a-7bea-4878-c459-08defcd547bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|23010399003|1800799024|7416014|10067099003|18002099003|56012099006|11063799006|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info:
	lWclyT7yoPmSZSoU9xtNmeHQHteLcV3H8s2P8fyXw/FATg6tL2nUOaYrHNuI/ICnPc0mqnzW6ubBcbOQWWRUIyRbss5x/RLW7Sg4/rJjwnuyyVkdPyDKYs1GtC/08gswBWV2j2xL25O86a08jpKWBhnyNr9oUqR7Z25EMQiPbMuubC9SQ/GJyj8ANC7m9/i0Q2dATjHmx3A39rTMZfyTjB0h8SPRi0WvCEZRxRyMR4nmtdPNcu2Pug0qtfIcK+YzrDEjHlSBpdxo3xWvvro79FnOFVEzrGHzzX2bFcVNwblKzvVQ1DMWVUWtD+3I4Go9rI1mHdlJWWXeEZOa6+KmyLuymf9ZMLi10MNVXD/wZ3QxEdBvIyiV4OAETEgbe6Dqb/8epC/fLs0/rw7Ap+r/jOjVs9CnpitaodaHq7lnrPs8eRSw5J8BPP3TCdL7AIf/tteJb0gFnyUIwZpMo2A9xJIftMs/Jq+RrU96y+2GVKnwymSkeecZflZQH7FYo4xZde9cEuROUZ2s3jIf7nesmL/765r1Z2t/h4zokLABxmOSMRvF5ivWqbBR5MCoRbQfxmMTkZuA+dnS+H58SsGLTqOtRsWkts9UxCz/7bZPoXoh4kfuhii7a8BrooxEGYkv4dq+S8EMAfyRb2MLRPn4/gHw5HiUgCleIlfPr14x7X4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(23010399003)(1800799024)(7416014)(10067099003)(18002099003)(56012099006)(11063799006)(3023799007)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d99itMBkr6zw+oseRJKD3pFbYaiEwC6+c95VbUKYLdNGbHFy5g18JJVStsFO?=
 =?us-ascii?Q?YWD5GHUIqB+dqzxwifZV2azb6pgswiDTFT+7wwqTMKPf5mYDAyHKkEL4zTM/?=
 =?us-ascii?Q?VvMVB+r1mzuz7dsUGf8EjpyEcVstJ/QmVCDGm3UXzov8uCyUmqlccNbvGOHK?=
 =?us-ascii?Q?YUsiz/Hh6WXx6rLRlRMhluf5LQhPcn+0zTwIR9shgliG/cPKeyMjZk4Y6U4u?=
 =?us-ascii?Q?CQymlx2JDfSbW3vA0M/JZ04qSa4Y/gOYXl49sbR4w3LWvg+OoGA5MAjZ9930?=
 =?us-ascii?Q?DCloy8Mr6F48LkKvulLt9lEGrQT0sAItan+V5V5MC94xAtV25o82BML4sS7T?=
 =?us-ascii?Q?TDw1HaGVQgSkaFi1kZgN1bDt6buu6FSMZ7xxBGJ0uVtpYaSiAr0SlTv6zhPF?=
 =?us-ascii?Q?yNr9LKGDPqtHwd14Txg38OmsFGlvd1YLbOoZM6TRPsxTX+cQ8JmK5pVZPlQ4?=
 =?us-ascii?Q?pP0mc191mSEQRgxFWT7WOczmZvntfOQsP4/H2WWJUKXKP8BF0gdsl6cYL2Vw?=
 =?us-ascii?Q?MiFCiIAqrGEzjhONJJdHnakcowZXYJdkej9RbsuexVSaeK+yigSildpQkHqw?=
 =?us-ascii?Q?USsaOCrrkOH/gY0KbuBKCV0xVUZPbRc0dCk35e40nE7ymz3FE5sMjgOBZx4A?=
 =?us-ascii?Q?y43QIIItB/PrOSjl4ODiW8y0SDlQJUOU6d0TOGgfcDW0lFZVIhaRpEIMT+n2?=
 =?us-ascii?Q?2/mZONpf/R4uI4CdIEJ/i52ZoKwvSSIoyiG8RkmYQ10Xz/gxlYYbaIRDcMm6?=
 =?us-ascii?Q?esvv/w6j7OpnnR5z0tk9BLix4LvqU22q0WuNM44BGBTlisTpcCvpMCgk2XQf?=
 =?us-ascii?Q?XdLgFDEOS7rnYeQDEv8IQJ2ToZVRsfC4wBa7Z/urMoh+3hOYO/lBCScrvCY8?=
 =?us-ascii?Q?M80pIpRzpxy38Gv3NOFZ7KeYw7GE4Zu0FaHa3pId3GO5QSzuEkkpXNee8jEh?=
 =?us-ascii?Q?ufSgzDfXyi8uK2KnP1rkFv/RJG4Oguts2xzjmCWeCNKi16EvcMJZ7VBALkXU?=
 =?us-ascii?Q?NCX3QG5XdOxCnZHFEXWKqgUC52bMD5uaaQ0FLxaZCpyDbIjd+Veh0nV0zu2V?=
 =?us-ascii?Q?6cmAL526ZKaXY2TyujWnnkuEUA9k0xEGNqpK4hm5+ODIhbccyD+vWMCyNxkc?=
 =?us-ascii?Q?dHvgULyiLmrdLfmLtewYt4n1nEjGpohYPywA5UkXf4YSeMMOermc9t1Alu6Z?=
 =?us-ascii?Q?lrqURmTZkeuShdPX2wRbCvCIqzx+HWiRs3VYkXrjmeextWAaZAQ2V5X0kqtQ?=
 =?us-ascii?Q?9fvy6o/mQmDD4U0BqIi4YDRI7siYLfC1HaqlsVtvJE45jGhVO9a1AoNZEreh?=
 =?us-ascii?Q?Yyx9sVmKHo7ppqQacLMnKG2X7BDoyHAAbtbxHKzHZSfS9tt7bkzvyr+SDBob?=
 =?us-ascii?Q?ZnpIjpbVhlexPE4KDSac5RhOPlM+w5hKP97icM/3sxVPMFoU2R4be2ZmyWVM?=
 =?us-ascii?Q?BCsaVpG2eg3I+8S1Lhi54hN3I2Q+JU8AhNOw/nN7jPLpmjcuI60GkLqDCWez?=
 =?us-ascii?Q?AauyS5c7fruBpD1wVNudeUgZz744UGdIZpgxZ4Y08+POgj8/nmHH8bj3kz7J?=
 =?us-ascii?Q?tMc+MPMSgQZR+M1fsLscLwmHeZmGUCHZwimNoF8RvOBJy7Qw1WEu4r/ou8FV?=
 =?us-ascii?Q?SQAdcqjizLBSzfDCcELhtN4OJXvNVio+YxSUhhOcg4iJBtOqjPJnxZeAsWdj?=
 =?us-ascii?Q?4Rt/NfebDBatnX2FcsRx1Z1tI/2QyWol0rL4kOfCmTmZGQj4cK61b7CzJPs2?=
 =?us-ascii?Q?4iqwuo/GD9cD9ghD10Zmd86CAC6N7JRFllsd1Mpc8NVN6y9KClR7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db07c78a-7bea-4878-c459-08defcd547bf
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 03:03:29.6491
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Q+7Fp/8ZxLOiDE4uaiRGSkezWJVy8zZeXoEdI+cRmTqwhcY+VGafAUoi6a02E/PHJEiamfR8vFlkauTMQ8rO260rTLgSPehdEII2TP9VHX0ydkQrop4p1yVySl8cXSp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12144

From: Chancel Liu <chancel.liu@nxp.com>

MQS1 MCLK input is driven from the respective SAI1 MCLK output, and
sound-dai-cells describes the node as an ASoC DAI provider. Both are
fixed SoC integration properties rather than board specific, so add them
here in the common dtsi instead of duplicating them in each board dts.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts     | 2 --
 arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts | 2 --
 arch/arm64/boot/dts/freescale/imx95.dtsi               | 3 +++
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
index 0f43e3be7058..0a1646ae5b00 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
@@ -480,8 +480,6 @@ &mu7 {
 };
 
 &mqs1 {
-	clocks = <&scmi_clk IMX95_CLK_SAI1>;
-	clock-names = "mclk";
 	pinctrl-0 = <&pinctrl_mqs1>;
 	pinctrl-names = "default";
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts
index b87a26b0d7fc..1f62d729a5e7 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts
@@ -450,8 +450,6 @@ &micfil {
 };
 
 &mqs1 {
-	clocks = <&scmi_clk IMX95_CLK_SAI1>;
-	clock-names = "mclk";
 	pinctrl-0 = <&pinctrl_mqs1>;
 	pinctrl-names = "default";
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 38fc47024841..7bc74307d9ae 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -439,6 +439,9 @@ hugo_funnel_out_port0: endpoint {
 
 	mqs1: mqs-1 {
 		compatible = "fsl,imx95-aonmix-mqs";
+		clocks = <&scmi_clk IMX95_CLK_SAI1>;
+		clock-names = "mclk";
+		#sound-dai-cells = <0>;
 		status = "disabled";
 	};
 
-- 
2.50.1

