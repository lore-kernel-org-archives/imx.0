Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013021.outbound.protection.outlook.com [40.107.159.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561C334C134
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 02:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787538058; cv=fail; b=GllbtHhq/5EJw7pYIzlAW1OAYVSrMV+sGzipkeXn9tkLkn/L1BUq66OALzz+vIBvLegFKqbd7VygoATe3QkUVECZBq2r06XRsUn4DXejSsUVn1MSehkWIDPVX3HCjQT5EmsRX/azdsoXs4fcUdoMEFTWacYb+uut00otOLUcn3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787538058; c=relaxed/simple;
	bh=pLF1Vqd5si+FcNyWt4xY52rVqMa/J/0rgr2KKDZ5DS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bUl+oyB1YRkKauKQStt69xXnlK31bIVl4WdMpVm9mT+7ETlTlLRrLrBgTz8cWMwLfHMeufLKMtIWqJcACiQl7Bn9x4YY0Li90hRpU2avUMtbHoCokJ9F3zn19aYZiaEIBnKMSUPhC6W5O62XvlRd63dkvTPflEOGURHQPVtzDeY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nC4fiQKA; arc=fail smtp.client-ip=40.107.159.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nC4fiQKA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xpRef9D4Ox4puak9ujpzzTWXN9dmg7Jmqj6O4K8cClZ7DKTKBV8TGU+PgpBekG/hSUkqBi9feL6whIAX1uHHWxo2St/FFWuuqxDdngI81MIuRQIsIhs6x/1b1XHU3v6izgV/0dSkwnHSAg9iK63krnZEYFWEygPev1hifZO+zg/FxBR+jGAYfPNBOJqPRmbyHvWX8GanZSM3zPzOdPOaB+1aKcpCmnIOCvS816Zat+fd6UpgM3pd7ABw3CunxEH+Xx4qbcxiAMrP7qrTBDzcaxw3aJx84ffsYqFN1apPaaGe3mCQmaWQzJnuZmpUf0rQXcB7Ir4v3CrPcowaEzBMxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ncu853l6DKLyM3DW1Uy6GM6lOOxPj9Kmr//5fViKwfY=;
 b=rboej7fXIAxyeGdgxPOTlJdl8rmkLsmffJh56B3AreWfp1gzDrQQ/MOMGtaGf6WPdqI3sYBA3dyjV0tXx4AFi6uGiKLoDfe3c6eebGlMUQOlAcpPy77az5wuxWM4Xypa8sYm0di04i6TpzjFUKpqmGAGad4LkVpA+A2AjtbIJg/khjIvk3qpaxXjtYXO5QbAT1/1c+Bk6BaNjbkf16HMvHE3R8WbQ9VpHjAxG4+sjfImGrFTijGva4IwnSqQb33Ih/JgRRVXi00rwVJatwG4UYTEiIzOdOTjJ2ZR6opBR6I08UeLGZjyyA9F/EP4eewmywDW+7rONjTL3zIL8IuspQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ncu853l6DKLyM3DW1Uy6GM6lOOxPj9Kmr//5fViKwfY=;
 b=nC4fiQKAZadADtBSVQEkXse/MUFaS+HBUoyePZTUb1QChSeZZ3VqRqtl9EiAUyYwPqeJYcKMKNx9OeHtj02jao6GVEi4y7mgeJkk+zQfVbN19yNMgfqqPBo2xrNIif4ZKgrcx7G7E2YHjoiZGpb8hw4XmSnh2JQE8NB0GoAaKuu+Wla+6vbbcRfWKTCvxZ0i6h322B42Fl1FM2rAhJVL2HNVx26r8DYoVf2bJgvj9JpFogUm6JwA2BCCuXpAX0FoOZ18e+kCusOSWs0NTgOyqjArBGsviVWHxZVT1JBe3TEIKR4VLkPN323sNrDylZuhHMZdhkQo7fsCf49gd01FMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by VE1PR04MB7360.eurprd04.prod.outlook.com
 (2603:10a6:800:1a3::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 02:20:54 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 02:20:54 +0000
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
Subject: [PATCH v3 04/17] arm64: dts: imx93-11x11-evk: Add board muxes to select between PDM and MQS1
Date: Mon, 24 Aug 2026 11:20:07 +0900
Message-ID: <20260824022020.2812810-5-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
References: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0093.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bf::8) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|VE1PR04MB7360:EE_
X-MS-Office365-Filtering-Correlation-Id: 69afc92d-6127-4e1b-994a-08df018652f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|23010399003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	7f2v7lO9A6hEOgtjd42Q9auciS30x7af1e/0C5jUCdQkC5Yltp15yr0F2K+IDf/DsP/ssTeT+xr96qcmTND9LgxLeMKg58FXAYiSnSO4J7idfCpKhKxwUD017WBJ2xjonPx8hqKyf+wjYjCF7KrelSe0RBD/zWNwTIJfUn0bvD+07yYCsXnOJnX2LJXO4Yhh6Ymzpe39P3SxCcL3ma3OqUOoKdMIu9f0WTHPVGUWjpfx/gGszUMqpY2Ze3hmbQGDC1bd0t78Lhq7BXqeM5gvMLX/zKtISSxNq2D5juAadQ0G/phlIHD/BIbhlUeXlxoeex4MvSCcOoijJtOqLC37T/5Jmf1qvr6vQNELggHmw2oR74CwrerJdIpAu0idc5ezqwqbPtFIkkiMHBkbM3tEyMyJISo6kE1isFP8p5M9Ate+aKsXKqzQtuqAJ8ux1Lcgere4Bwt6NloNWUqFYitPXe5YMQMukuWZcURPhpq0qGNTkSfoB+jECDsMiYosfjzOXgJjMu4rW7yhKSTINe0SPgtlZjAOW+PaPnfqgwPxSaqFbwQTkXIZlp9i3XJH2Ic/2QWo+UM6kSqz4N8jLt/ogYYc8fcGJlDM7Fmu/btu30bAJ6m8kd5w7zMIt5Ph328lh5M7rKDMmorgOqteSd9tYrHseTKfpbb/3Hu5c5F3UD4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vwo7Faf4pyH7ciJrKwocr29HJLcGrd8++mrtGW9a40q3HSfUZJufF2tIJtyS?=
 =?us-ascii?Q?k4i07YwKOVq7/r9KiFetNKzKhLG5Qqn56dII5t1o4npO+maQbOilPJFgic2h?=
 =?us-ascii?Q?RNOQ47sVBfNY5F00wxU/f9wLMCtnh8ZsNmgzi9AXjUydFnjWAxEl1vX7IN0Y?=
 =?us-ascii?Q?kV5hJlMoBOyc8C4pz5kPMnzx9IxRsZceDoUCw1aopDndAbeR35el0NrIGuP7?=
 =?us-ascii?Q?vjMj/MNoycKhZrFsyDpn1S0P0wATuIJ8ll4aCDotkcmUldwdqLBs4/50Os/7?=
 =?us-ascii?Q?j031wjMV8CAbvSmNY9MuA40fzLErP9bI8+ZvZQK/Nma/rb6MpKpT5w9K+e79?=
 =?us-ascii?Q?I+oWYS6Hn85zVzLzvQY2iKus3FwYvro5GPf6kmm2z2p5jMpREmA7LpFxwjJQ?=
 =?us-ascii?Q?VqiEP/BB2GUbLkUKzmO/emuRtcW7+sA5bDy3un7YRijuZHU85P+U5BuOrls8?=
 =?us-ascii?Q?kcsAE+7f3U4fndJTd85RFTV7FL3VDxP+v8LMmMEgsQV1JSzhg5J3Q1xSH5Z4?=
 =?us-ascii?Q?1aVfgc1TUGAfFPm3CI+1YboTXe/1akZU8iJerXzt2YUTQECg7fKB2cD9NHqp?=
 =?us-ascii?Q?fVZPrbJIioW20zXzovf7AcboM+95hl2HN9DzvIQ7mN/6XMPEtZvIswDE8+sm?=
 =?us-ascii?Q?onxd3F8vDf73nHpaOMNlk7uBcDYopAHT5pPekoSc5RF8ZTOn0CmqDtHL92KC?=
 =?us-ascii?Q?D42qgwKicxnsytkGlmiadPbvqd9afXTXgvAV2B4dI3+mGAWEbNpytLlyyhZj?=
 =?us-ascii?Q?lE+7iALUxSGyfGfZQh5zSsbbZmbGWP4bNiSfQHdZqce1m143gG7jcaFIDV8w?=
 =?us-ascii?Q?UxyiFyMJb+xQ32siWmvV3lUu5ViS5vCFR57S8FV2r/lgMok1HJJZEq+0zfFA?=
 =?us-ascii?Q?Hlex+6yqfsClPNioVeFk/fSOZYEZgHG6oeTGzLJ39nZv9Y0Tvhu23/z+IXHY?=
 =?us-ascii?Q?LnJAM3Uz2tox6LFPE5qsvojLFmc/zorrbXbvhanDO8H3L7CFwSsS16mW2wQa?=
 =?us-ascii?Q?NuAy9oa4JaEouBnMQyiN37N/Zo96gWcdBjavRi8TYReat5eCukhsuwYxb5hd?=
 =?us-ascii?Q?e0JcChN1iZnf1dvSVc2cFQ7iXvolfMYO1nN3xylVwePG5beaB9ZtwSBE49+n?=
 =?us-ascii?Q?cELyhK4184i6xHYNTm2tVcT2UKKe9nMtWZnR/wsPYZC2eJgt6PUS+Pb9BX/U?=
 =?us-ascii?Q?GYKHcg02KDfr9AmrpvfCpIOZLKEK8ErYSXKI4Dpf8EYM0Nf+X9/+vQURf9Wu?=
 =?us-ascii?Q?2+cYAGcuK3DLi6KUebiaSpBBT3FVd+u5uabcsKrwou+rmGbuu8wnnQh38VmJ?=
 =?us-ascii?Q?SgogOq7fqscpil2XjxiMheu85cpXwAkvAVwD5Va51cdcUM81GHw0YeLri6is?=
 =?us-ascii?Q?AXD7sMlYGQICg5UBv+sgespubbWoQ7HEskVg0UHvZKvcgdQH42Okop3idpZ5?=
 =?us-ascii?Q?fJpimDPjW3Bm0yANrbaGZR5zNOdJK2It9KdUJitmEaKn7Ro7ngR8+d9ylJbg?=
 =?us-ascii?Q?XOpG2IZiSUMgck49iSqjVbx/JAizKlu3MAAOjFOZLBCu7Iyo7fEzPUmm9u7R?=
 =?us-ascii?Q?vLVBu2gktQP6I+Hw/9oH5bQ7FeeaL4Q4vDxGcoBvs16ObkAecU0fHNThwZzR?=
 =?us-ascii?Q?IYhwqwc6iS1QiKEG7yBgDDGcwFPOZP6Kl8wPeGlqJZ/5KvGX0Eb3PxD+LInA?=
 =?us-ascii?Q?XLpTGzxjHDGUERCWzZQG+Nleo/cF7ySGHbnjURhFgCPifiG4G1MicpuS59yA?=
 =?us-ascii?Q?ZxZxpl13sGzbT/6o6g9DJGFx2Cq+k4LLDfaXikmoXizxlJyd9dkN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69afc92d-6127-4e1b-994a-08df018652f1
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 02:20:54.0287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hcSu3d8mXZo5jIDEadQTLWHkSJKGnsSoqfrMVJzPsjqGogD984Z+QqT0w1OIpkedlxy1qTFpiOYJEdbKyocMVlfw4ycJ3+cr05mKooQHQGy1xylkE5CN5PLTxRr+gaMv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7360

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

