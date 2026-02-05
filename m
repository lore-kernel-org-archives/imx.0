Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010036.outbound.protection.outlook.com [52.101.84.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24D93A4F58
	for <imx@lists.linux.dev>; Thu,  5 Feb 2026 10:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770285936; cv=fail; b=YMRA6eDUleagzn+YCb3Elc356g5TzT73eENWrAZq9bl9UK62tdj5JYZBrHzzd0YMls/Mp22EpyJ4QmenS2cpes/k2VH08YoO+RlbnA4T810U7DGF1fi9Mrm+ehGkVL+w0AVQkUMh66J+uElaxo0YrxyO7MRyRL64+FXej0AGwr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770285936; c=relaxed/simple;
	bh=UdV/UJa+y0/jdOYgGSDgocJo45hS02jQlmAHxwjJnnQ=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=pCTAkvGdHb7/twoYLjq6rnoAg0vOPxBFz4EYA1lGEItD44kBBhWBRZ/CDIiC/KuXBRQPq16YXkkQRzLjH+bjupvFLVOCxHZ0hPlWDR2ZW0/PADep+wdFb2mwutIyfILXhQ5u1uQFysBqialXfsRjq5P41WXS3dCuUhq93WrgJjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BTSWbG+Q; arc=fail smtp.client-ip=52.101.84.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BTSWbG+Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R+Us/brmKCEkAlUtf0vPQdnBSAKdkjHTcA04w+nvYWfFf0PmoWiDRMg6gD6MtILNdyGWtsjEoSkgtNyvs8m9vDb1W+EPAFU02dhMPD9AToyHQBtLfjxyYwUMPc48UHabyxtcTHtwecLkQBn9T3rKsWd9FBqSfm+eJH2Ao10dgXWc1F7q62XCS0rs9EV7tx1tB0rjmcxEuWDschmlhfV3ZdJg2BbejXz6O6xEISY2w+EcqFU4/UqewS4Cko19f2Jsg/lqn36FwKsv1PygJG24uKQVB9aEgUwHo1vxR/151u9WaRAwgS2Wppu0l+cAl8cSdCXkW3/OWIPPJ++3hID5tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sT33VbGygedwV2iG0PCPDcwTShNdj1VWC1P/C6HB09Y=;
 b=IvVig0mc8xDj3EpbEmeRN35QLJafWX44/sVF6BXS4k/b4BtDqdRGtgAoGEEY2xMQSj4HV8GgPGahzjKXFLtQw64X/6qrbCCy6xmcr7onwW+wuJVLzo4Y2vjO4thWMHsIxGGwG8C8NFUwj4UBjcPmXUbV0LRnN24dQi5bhz+QdWt89ADBptParlDZ43s0TqpcHSLLGT9Ic8DkLDWeL5OMolEEgxs6sf3OuqO/dsByKPpFTEsx8r/DO2Cqot2/epo8v579qDkrb3YxLN/1KPhTXzdeFVZQUCKKQ6PF09II17QCOfrxQjWuuw05jNXcsw3+0/2twtKDOmxxEXCOwmKkVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sT33VbGygedwV2iG0PCPDcwTShNdj1VWC1P/C6HB09Y=;
 b=BTSWbG+QQkOBW0RZps273g3nPxg67U/suc497sdJLOQzZrPsvDYwD3+L3zDRVX5m87EPn4q9P45g0rgOsoeBdJrS7DC/Th8IPjKhca7CJ6Zu0NB7DyH8lZPNVDWYB9gXMmkd0euebqQZVILWt9pwZWB1UMi43oHlnhZSMzx/YpbxNVAeRROT45pfY1wvlvnmgtYlJM6EXj9rUeHG5HF0a3ekkAOpSO0PlofkqSc26c6qS7iCaPVbIuAFEEJQifPQgK/+3wwkOR/QKKKoRd16ptkUZw3UU8phmoGJaZAxA5iKkOuOer0G9vDsf6kKl/KQSMwdVdydGpVHsuXyYuUBlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AM8PR04MB7745.eurprd04.prod.outlook.com
 (2603:10a6:20b:234::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 10:05:32 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::feda:fd0e:147f:f994%5]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 10:05:32 +0000
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
Subject: [PATCH] arm64: dts: imx91-11x11-evk: Add usdhc3 for SDIO WiFi support
Date: Thu,  5 Feb 2026 18:06:47 +0800
Message-Id: <20260205100647.3745669-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0063.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::14) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|AM8PR04MB7745:EE_
X-MS-Office365-Filtering-Correlation-Id: a5dad2e0-6d8c-4333-0d07-08de649e18e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rbbN89+ZShJ2GIV1e7EI+t84D6M6a2IpnQJpTVxtWKYoCuUvTKQ33GKudBoG?=
 =?us-ascii?Q?lsWT++Rfg0gfyCSgDQZp4gF7tPjTcx2L3oYBlGnYOhXB/saAnXBa1Zs5QlB4?=
 =?us-ascii?Q?uaQw7XFvjzVmnrx+a0ktNDoTMCKNDEvUyLNTGLGSSV2YrngvBvcpBDCcbSD4?=
 =?us-ascii?Q?b4KdI6VSg2+zj1O2Cis+w2LenvYuCqq4CJAPk7JlvpT4QC18xyjpa9a3KxY+?=
 =?us-ascii?Q?si3BgCIcprG6tnsM3k2d3oTSVi3HApnuwDuGQU7SsjMA32hP/GnLJlAPp/zm?=
 =?us-ascii?Q?+aWAXGxgSStzswSFNiNIXEfAUaAERIgu2etsDiSssXiCJjZSFcOkdRW+Z5jB?=
 =?us-ascii?Q?Hnf7fBVIckDaCJSXqgoeLe4875EI2kHywv4kUtgs5VgcdhYtmoY7lWUwvECS?=
 =?us-ascii?Q?fWSjxMTyjVSQarYyCTXzcZhskPYrQ4UYZeDXb35grGE9otlLg5e1SNxqmcdg?=
 =?us-ascii?Q?c+KZcwGURG6NsGOuvDTxNjdlyOJWIUZ9+DrK4tZ0O52Hky+2MBYpAUF8VAZa?=
 =?us-ascii?Q?fCQ8aKcFEyRykpqD9VX1/kx/gsocx9tHV7K/qrDZcUg8Gyl+cjIdXaJWIizA?=
 =?us-ascii?Q?duKoogfzG9OOed1CaQVXfbSQzwegwWKb00yDS4C12larLn9wWTP396aHcLCT?=
 =?us-ascii?Q?k6CfZi1xBTDgvO/4CAABmu0Au7rP8AauHidjnTaQSoHHNGdGVa8XLQWjPeC6?=
 =?us-ascii?Q?D7dlxIpGhXynko8GwTfcvSxcTzYEZNrTqNUSePb0/x0cyaC+BlsoeX0ruZN4?=
 =?us-ascii?Q?9Svc6VMqOORky/uwJbZtcpMvogBkhggDdh3U7zJU+e98AN/5WNNcx5H7lvEA?=
 =?us-ascii?Q?UlN3U/uKWETL5bYKc7KlnPbu7DRu+mZD/iLeCqTtkcZa2RpD3YKIpfnB9Z1W?=
 =?us-ascii?Q?jJXhvMH9WYs+0eupGzoCnRTAu5Pt8q+2BwpodHTw9O/Ud6DsoM64MKBaJdqY?=
 =?us-ascii?Q?3h2CsXqbyDG/dAedcRBACEiZ6ZHUFBEZA/AtTySqSxNOWArRpsl/WRykt+7L?=
 =?us-ascii?Q?FU1qJJ1xZl4mdltpPydciIUT/ZJC+5gH8RbZMIRdNUnE4O+CMzCwt/qIRBeG?=
 =?us-ascii?Q?g1aIgz77k/pN+hJRlamtYoaQoy802j9pOku71Xldvl3/WMiDf9rpnqph5fZg?=
 =?us-ascii?Q?vDFfOSKDtJ2roS7jA3u9LCLL3ygDh9nOxgEe1b4oh6PJEZ9ZO/MGOWHSb2rF?=
 =?us-ascii?Q?6OVAM+1ifxcbcvhOAhICsFdHsItQvgNeFVYsQCk9fvgmdRvNXyaDV1DNkoCa?=
 =?us-ascii?Q?YzZ1Xe0e5BrehCj3fJ5H7uqJZsAUC3UtbaAMmdF2sb1wIZniowiqMO58tyXM?=
 =?us-ascii?Q?AIFJHxHP53rYiGUZ1PttAr+bremYs0JVcJwFS32hKXVhosEdUNKYVxcpZeUE?=
 =?us-ascii?Q?YZsWv/J/Zk92wPfB+FfuYoWXOvIcJ4JuchXpBMKlGxFmy4EOi3OfeSAITgrs?=
 =?us-ascii?Q?xtz8LAOdedvhuWvWYio3kAuWEsAhMseb/a73ICyNW2VhpEMTO04tHgwVDQLK?=
 =?us-ascii?Q?/eeE4a2Q3IZKDjyIT8tNb1PrXC62PoEgT2EMnbhzEcjPhrQ421XGqMuezEJx?=
 =?us-ascii?Q?d28KBdo9p1ycYmeMYAiJcPWb08TuqcKyHZssv6pIILzNfCk3Lc+1Ee730rbs?=
 =?us-ascii?Q?2krrJqEPqK/9EtpDMwjV3CU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WctvFQDXpt58YJW1kQnDhAavrdNA7c/cUVsyMS5NSFktfIPqtIIONXnz9zVs?=
 =?us-ascii?Q?IvwQvP8XsL+5HAh0VEmSgwLJQBAO9QSXIQGhdn4yMYmJfE33qEUZDLaRSDDR?=
 =?us-ascii?Q?zf9Z8H4X7u1w1+IfIOVPkO18//l5fM95FiKKG3BEckIS4OqR3BPfHG69oPh0?=
 =?us-ascii?Q?W13FPe0D8RfR8HOJDfuB7nuGMviS6Pcc6N/2isPgkQEwQ3teuzPeSwWbGcuD?=
 =?us-ascii?Q?3Hjnhm4NqKjbK7kIptlq4cdibBBgdqhcgBcolsx7bCCy0IfjNUFTFKiTttKr?=
 =?us-ascii?Q?/zd8H7x5lAqVTat9g4HC2/cNopQvfVQK6R0uHUC5TGz+kymnfhASX8k4TPCd?=
 =?us-ascii?Q?axPGtBcoARc0O5GruqHo+SxCHK/7QfJJnQVgmfuF69vKkrOFiAVxXuxPSUTK?=
 =?us-ascii?Q?Zy6sSc9no9LytP6M2OyopqpEXrp8vag/9VY9lzlg9qQ3+pS2eoq08VcVHoDE?=
 =?us-ascii?Q?SEv7+uZV/j68Lfyiy9SXDJj0w8QZLRAwWVd5UQsGTUEahAEvdcaZ2p+tNMU4?=
 =?us-ascii?Q?iL9jBS4NQkuWgfR1ymd5Oxhkla23JbXrrWGZyFkfRKOi8+7de8hXwrWKRPyn?=
 =?us-ascii?Q?SyVPvr/rh3PlN29mcLaTyFVOTbWbohyciHmX+jtegmqzDeWxxiQs2piALPXy?=
 =?us-ascii?Q?NrcIc0UzARsLR4PgE+ENf7E0sywJKmdGnrEhArKuuuNXEAymruY342xUe8/a?=
 =?us-ascii?Q?gWsL2VYjg3GU3vx5okUDvE+DCQ3EJqbFTR1yBiqBc29cTDH3kD572oIZJBdf?=
 =?us-ascii?Q?cAeoL0Qp9qCGQ0N7v7sFRSUeYxzvo3MJH+9yj/xjWTpyY/v/GemKxtt4pqNc?=
 =?us-ascii?Q?rzoBExQU5RM1qcyQhiTiNXw5S3UhGGRbCIFCYK4uPVzQkdGq+X+bt5+P/zcO?=
 =?us-ascii?Q?5y4qUNW84LT3cz5iE2YcBu4P0KHclI/5OTUQXOor8zwkNSPDyYDm/tVl9zI+?=
 =?us-ascii?Q?v9WM7R1kAWtgoaOqX9FH+dETDxXED7iGJ5bnP8fkiN12uVtcu+iIaOqwaK2l?=
 =?us-ascii?Q?ZttNyka9hLNUs6ykYyZd3aI3eXzubcLvRaZpZyrbG9/x6HIYxXIMza7T4+iK?=
 =?us-ascii?Q?DR3JVMgAo9+mnDdabF2k0IxFI+7MhaJ3Muq+HAFs4Ptgd/reTJZ5rBTQxL5j?=
 =?us-ascii?Q?vDZxaH9nGSaqX8TdvksxhYtPdUltWuqyrJ3J30U/QSdzogQuBcel5Teu1ZBE?=
 =?us-ascii?Q?tl3eX400mqZTftYoevSHnHIgfIWX6dPNROnK80wiJXYLEb6jF7noYLI/NfT3?=
 =?us-ascii?Q?w21hwAx9Bfc1sJsgSswDwFYe0WkeAUSuVuDqDM1RATH6iFUrvP0tU6CeBsEd?=
 =?us-ascii?Q?Kna+9Ep5kSjp7BP4jrY1WnTvn1rw7tb9K5JwNfVdDujQlUhGHmCggLoe433G?=
 =?us-ascii?Q?nYUqNGuVRqMa8O8zDxFCpIi7vn7DjUGRc6fzbM36K9HecOfYdCK4cSB9fcn3?=
 =?us-ascii?Q?h389Hddqs/82XjqCzOOClkMs7/TOec4apSSkGlERk4n6PMI1PVw7rnOvXp/S?=
 =?us-ascii?Q?/pp88caGtBmYgW0p+jf01PlO0uw2w9Ys1MHkLkfRgvlKpdc9kRSFXWvFCnuh?=
 =?us-ascii?Q?piyyNOpug4BZ1G1f++/Cpf/IQM0AVCLpd6QFFdTDrZxJubOmWLGIpxM/5gqC?=
 =?us-ascii?Q?yKiGqNDCaq62gU5If9RIYHix3i+lPW7KaEVzXuo2N8Y6qziEB8BGyBBQBhFS?=
 =?us-ascii?Q?G0BBY9HTsyggGn0vH96NaQHPZBZ7Ci5ZZGHLCWGW0jxEjnYLGAt+k4HtNMeP?=
 =?us-ascii?Q?vXw7HzGi0w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5dad2e0-6d8c-4333-0d07-08de649e18e8
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 10:05:32.0501
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZgAlvwvFrIvQhDZeFozwF/3c0KhKq5AfHLjFNqlrx22oGW+vY/nXpBxCdWMfJneAfhfW9zAMjzxWkeco3Pi/Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7745

Add usdhc3 to support M.2 SDIO WiFi on i.MX91 11x11 EVK board.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
 .../boot/dts/freescale/imx91-11x11-evk.dts    | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
index 03f460d62f7a..3a4a809b5e76 100644
--- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
@@ -23,6 +23,7 @@ aliases {
 		i2c2 = &lpi2c3;
 		mmc0 = &usdhc1;
 		mmc1 = &usdhc2;
+		mmc2 = &usdhc3;
 		rtc0 = &bbnsm_rtc;
 		serial0 = &lpuart1;
 		serial1 = &lpuart2;
@@ -57,6 +58,15 @@ reg_audio_pwr: regulator-audio-pwr {
 		enable-active-high;
 	};
 
+	reg_m2_pwr: regulator-m2-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "M.2-power";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pcal6524 13 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		off-on-delay-us = <12000>;
@@ -69,6 +79,23 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 		enable-active-high;
 	};
 
+	reg_usdhc3_vmmc: regulator-usdhc3 {
+		compatible = "regulator-fixed";
+		regulator-name = "WLAN_EN";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&reg_m2_pwr>;
+		gpio = <&pcal6524 20 GPIO_ACTIVE_HIGH>;
+		/*
+		 * IW612 wifi chip needs more delay than other wifi chips to complete
+		 * the host interface initialization after power up, otherwise the
+		 * internal state of IW612 may be unstable, resulting in the failure of
+		 * the SDIO3.0 switch voltage.
+		 */
+		startup-delay-us = <20000>;
+		enable-active-high;
+	};
+
 	reserved-memory {
 		ranges;
 		#address-cells = <2>;
@@ -144,6 +171,11 @@ cpu {
 			};
 		};
 	};
+
+	usdhc3_pwrseq: usdhc3_pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&pcal6524 12 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &adc1 {
@@ -246,6 +278,12 @@ pcal6524: gpio@22 {
 		interrupt-parent = <&gpio3>;
 		pinctrl-0 = <&pinctrl_pcal6524>;
 		pinctrl-names = "default";
+
+		m2-pcm-level-shifter-hog {
+			gpio-hog;
+			gpios = <19 GPIO_ACTIVE_HIGH>;
+			output-high;
+		};
 	};
 
 	pmic@25 {
@@ -531,6 +569,21 @@ &usdhc2 {
 	status = "okay";
 };
 
+&usdhc3 {
+	bus-width = <4>;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&usdhc3_pwrseq>;
+	non-removable;
+	pinctrl-0 = <&pinctrl_usdhc3>;
+	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
+	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
+	pinctrl-3 = <&pinctrl_usdhc3_sleep>;
+	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
+	vmmc-supply = <&reg_usdhc3_vmmc>;
+	wakeup-source;
+	status = "okay";
+};
+
 &wdog3 {
 	fsl,ext-reset-output;
 	status = "okay";
@@ -850,4 +903,47 @@ MX91_PAD_SD2_VSELECT__GPIO3_IO19                        0x51e
 		>;
 	};
 
+	pinctrl_usdhc3: usdhc3grp {
+		fsl,pins = <
+			MX91_PAD_SD3_CLK__USDHC3_CLK                            0x1582
+			MX91_PAD_SD3_CMD__USDHC3_CMD                            0x1382
+			MX91_PAD_SD3_DATA0__USDHC3_DATA0                        0x1382
+			MX91_PAD_SD3_DATA1__USDHC3_DATA1                        0x1382
+			MX91_PAD_SD3_DATA2__USDHC3_DATA2                        0x1382
+			MX91_PAD_SD3_DATA3__USDHC3_DATA3                        0x1382
+		>;
+	};
+
+	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD3_CLK__USDHC3_CLK                            0x158e
+			MX91_PAD_SD3_CMD__USDHC3_CMD                            0x138e
+			MX91_PAD_SD3_DATA0__USDHC3_DATA0                        0x138e
+			MX91_PAD_SD3_DATA1__USDHC3_DATA1                        0x138e
+			MX91_PAD_SD3_DATA2__USDHC3_DATA2                        0x138e
+			MX91_PAD_SD3_DATA3__USDHC3_DATA3                        0x138e
+		>;
+	};
+
+	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
+		fsl,pins = <
+			MX91_PAD_SD3_CLK__USDHC3_CLK                            0x15fe
+			MX91_PAD_SD3_CMD__USDHC3_CMD                            0x13fe
+			MX91_PAD_SD3_DATA0__USDHC3_DATA0                        0x13fe
+			MX91_PAD_SD3_DATA1__USDHC3_DATA1                        0x13fe
+			MX91_PAD_SD3_DATA2__USDHC3_DATA2                        0x13fe
+			MX91_PAD_SD3_DATA3__USDHC3_DATA3                        0x13fe
+		>;
+	};
+
+	pinctrl_usdhc3_sleep: usdhc3grpsleep {
+		fsl,pins = <
+			MX91_PAD_SD3_CLK__GPIO3_IO20                             0x31e
+			MX91_PAD_SD3_CMD__GPIO3_IO21                             0x31e
+			MX91_PAD_SD3_DATA0__GPIO3_IO22                           0x31e
+			MX91_PAD_SD3_DATA1__GPIO3_IO23                           0x31e
+			MX91_PAD_SD3_DATA2__GPIO3_IO24                           0x31e
+			MX91_PAD_SD3_DATA3__GPIO3_IO25                           0x31e
+		>;
+	};
 };
-- 
2.37.1

