Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012018.outbound.protection.outlook.com [52.101.66.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108E3351C0C
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 02:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787538114; cv=fail; b=IO1jengWsy5vOCN9JeCXbnbCDuiNpo3J55nEAjJGDoni7+TurE1/GLDUmKw9If2wYvcVfXzjZNvFc3G5iLy+KTT6xR/TdZ9OZ2EoWiTB1JQU3uN2vBNSWat29qkgw07YZZFYvdHkbjNEmHWpDCtgyveADc4F822/SnRsOR3E7YA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787538114; c=relaxed/simple;
	bh=XpwhU7qVJBsxhul2MA0RKb64QZSyTlkB0FrZZedUx8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZBsPIasXrNnsR7nMZVz6vsPgjtqQXghBQsxe+gO/5EhV5c0cOCAEG2Peb9asNh5+p8trXhbwqD0LMXEciliPKGT5G1EAofrait8pm2mfMnWrXZTz0nXOGuPAtxYc3B4AfFn8XZe+wyrrTsDKka7vN81y3aRr1GYSJ6WEcPwuBTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jCOmyyAn; arc=fail smtp.client-ip=52.101.66.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jCOmyyAn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XYkgVVXRl1QXPkYOFt9R+EjitwxuA1czmPLfi3vZbOWHUkl4Vh4Sx/ppxN8G0vnjYInEpfD2ccZrRqbIYpWIuK8RvrcLkvADX+8/T1I2TF5YMC2e0rTYS/BLeadGWUgi0hTXfk1szkV5f7f2yPl4IGTpc1bAqmVqwzQ9WC4apMytq7NRvRBjFWDfWULDHYVUEoDj2w3+NiLRGxJFqGbeaglPtuyU8QRXWP9EaE+eCXueYkx3oDoE7vErFzvBZt7ZF95NjnCaDKmZSTZhkw87v5Sd/WNAqozKHZ5yyc153ZU4c9Hfpn8bj43j8DgOmRBwvNWGreyWn6qthZ8jm1GZeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5XdRaZ33/gudCCa0mw8fSJ5zYvszJllH2CtHRgiWlYQ=;
 b=mwMV7E66wgUpH4QdNHMpGcdzXv2bCzKHq36hmqKQvRxKZuwtx6bRcr4Vnb/l9FsTZiyjmTS5ZEB0ENgEqzKAp+bniie3kONSfjXFy7B8z3FguB6iDpSCX+D1tZQ/AcUi+8elLHrBa2uap1XyqK9Xd8WG/f46u5PkwDEjlB054Q6wvZxK9DqheAGb562u2F2p9rPC2j6TncG1avQen3c2vR9mzYI8Tsu12bdsmOVP0FHbHA9JrOmQozNlMeOpc0+fIPFP059+dBfBl4EAx/Am77rsOJo5m6s8FC5Ffg3P5cYetWBCTvr8oUSN82fs84SYuMjJnUFGIJKzb0hr/ZU6FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5XdRaZ33/gudCCa0mw8fSJ5zYvszJllH2CtHRgiWlYQ=;
 b=jCOmyyAneemxwbBQ0JgfY5IKnC+DsCAFrhjEKFXSLUx9TMlWH73uCtvQLhMPmgxbITNUfhtLf82hF2m+hhsg7bYnsj6zS1JlwAAt6BQyzkjt3sYKXJ7M1fmmpMXeCscfWO9ii/Ca6mG5VcpSPx7YH6Rfa9dB/pSAluCYeYnaDshGjhz9J7igSAsUcD+3pGRvV1W6Q4iWqGC9SfK835E5xCJ5zxCJXiCHfQabPtk+BupPoHKHhCVzTOXikrKyDgmZ4SpYhN2jT8fM/eVzaO0Cetx4f5rQIAykosmtAWHwFly3RxGaKkYKZ6WLQwIxcYq81M5bL179qJnhRvk4i1REbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by AS8PR04MB8562.eurprd04.prod.outlook.com
 (2603:10a6:20b:421::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 02:21:50 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 02:21:49 +0000
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
Subject: [PATCH v3 12/17] arm64: dts: imx95-15x15-evk: Add board muxes to select between PDM and MQS1
Date: Mon, 24 Aug 2026 11:20:15 +0900
Message-ID: <20260824022020.2812810-13-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
References: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0170.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2cb::8) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|AS8PR04MB8562:EE_
X-MS-Office365-Filtering-Correlation-Id: ac091fd0-a503-4e83-95db-08df0186741b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|23010399003|366016|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NKsatOKG7XzokLUUDeYOYz644Ch/46sJeGYfqSy6rlnxZq2HuZO0lbjUlSXBL9mfIj0VOxpL/ZjuqaHONrOERqCVrDro4EIzxeCb2QYFuw0vpZlnfDq6uS+/MO2QyU8NBS3uZ2A+CDdH07EfEH74xlfopWpL2K9W30N1f+g6i2RF6hfgD75uOpMojwt8Ql4uLNaXn3wW3S+IW9Vq89tFCqwfH5scy2ER7KrUAemRUrim69bvrrdMp07Oe+P1iq5ljcr/9QsSscN3zbMbmgsOUs2mT7tT2xOkACoa9z+ETDHNA1us2fw5j94JmyDh+j/jlp2MTd6Ry3GDJC8VhJAaIhVYc6bUDCy0ktvHdxt0EcM32uJD/9sBzXmtn/KY3YSpP7qaeipukmZekU5kScbmmMIp40riX6BqpDrXRl+tAW75Cmasp+Poa2qX2jOJNcRqSYHFIzRqHt+9Cini1mKW+Y3DzosBn2aU41z/h5PlnlUYWSS60v1qNFxanyLEWbMqee8nWu7RaD+4MZeO2DMdqwE6oXYihUiMOYuqmUYmDCoz+s+6RrgerDzYzIgCQ8yfwJE58IYii8oq/mgNklyKCfb8RuoIcfeRSlHaBxFyZWJaq55MTlwbDt11kNSW6WP0SpSyeERurgMH/U6xHJNqr5SwGobvTZGFtrKWEPhkeCw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(23010399003)(366016)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Und63+5YYJuxMrhp8sofhr0mFTlhzaVrFqRjlJE/pAwEGwV+R3dA9E2Xmbvi?=
 =?us-ascii?Q?ML/XjV25T279ODLvx4B/gqv4tcqcpP5m9RqOdqlxtYxGqsmav0UQJBRuarJu?=
 =?us-ascii?Q?l7DSbCvbqgY2qvrEAdtrbPzaMIXBvE+PofT+/o2FPmqcl6JsUKSitNtY0jcr?=
 =?us-ascii?Q?Aow/BpSugDAI19dqb8xnt2JZzGJSGELOQr4DDyVL7hiiheYfL8Dogwl0vpKq?=
 =?us-ascii?Q?I7sFcEZALge2wxhoVSLy5lV1EFlhKq2x3oIvTsrJ0c8I1kri5znU2CRwImoJ?=
 =?us-ascii?Q?fY5LTm4Ut5cmSgLWaPYjBMEgjKI8Qu+Tao8mQ3tR2AFhlHWUBf14lGvsDkgb?=
 =?us-ascii?Q?ouT7lqaACZ2r2R5Q7XLfk8yrGnnw3XUAGGQl8qQ5JFjj2ZJgDK9m9fp8AJ+x?=
 =?us-ascii?Q?7vx2+sicgoO9iLioanyTc9ONWTX2eGvZvPLnbDgmd8YP7bUGFL54RwBAvZOg?=
 =?us-ascii?Q?3qLvn6+ZcKZi0TQyfHzQdO0qd1vLa8jPQ8hSApKxK11W3kD4ZC1S5KY2irle?=
 =?us-ascii?Q?OFVX7jORBXr3tpzaeMsaOIbfUkGh89iu8aD7O87qZaSykt459UaT3lszsRfG?=
 =?us-ascii?Q?H/cVPaqnMbN1suHYsGdhx4Qa7gBuCMDMhkksi7dcOJLar0wtCeL65uoPccPy?=
 =?us-ascii?Q?LGk1GZf2rM6qwYrq5l1ZB8TTlp43Q5SD+zd6dXX/3HjKxww/CNgcS00+Xqiv?=
 =?us-ascii?Q?GNJrs1DW8JzmRwlAagIgPi1Cz9rwhL0Bzz8NUN86XCqaXcFtwvjWrGJl0s+/?=
 =?us-ascii?Q?DdwjMEIXQaLQ0hTKIxhhHwmD/uc9519a7kueUJkDUBfPNC+wI69D5jHz8N+r?=
 =?us-ascii?Q?cArjkQRqqu42cYTAG4pT7q2KkDjpt7vwJD9NoKkrb+61E1SZ/0QoI/C0AA00?=
 =?us-ascii?Q?dcqrmhFPJu8zg4HmrFnDnOFWmaG//4viLKoT7eGICfKtl5+TubkFKFrHm8GA?=
 =?us-ascii?Q?8art4o/0UutyhtG+Qvknb4++IzJJYe9re14bdefOVfv9zAgpubtrxWsCBu/D?=
 =?us-ascii?Q?ZuhskdIZ1UMXkx4qDRhlqLpDIlomJUZBdzfU21e7/l89r3CB/2PZFyRPbwD2?=
 =?us-ascii?Q?xn/8XnNd/zuHxg4eDjaSVGb3uB/hGNAO+kPS7t7NTFJzaYiB+BW7YtlzPz6o?=
 =?us-ascii?Q?DM0nmx2CCl9yJqxYuwUHrNjt7gr7IHRHI9UjcnFbvinOtYU6ka/sTE+sKFBu?=
 =?us-ascii?Q?dKIZAO9trtDLuXu/WTAPvNjU1GKnCHaRS+nlJjDnAW4Jz9c94p0G3FP9mqUI?=
 =?us-ascii?Q?ZE06bh06gW8hvmV8LaHLU41DtS4QP3TfUryUtR+dbs5GdtfxziMFqTZoXXik?=
 =?us-ascii?Q?koEJvggKRvalAoxOS761Qo6m/pU6aigG1YfNastNMsvArldhfj/Tjd5aZhrz?=
 =?us-ascii?Q?5AvjM2eXAiHp6+fqUfw3QlAnj/owhEGbzdz/IOXvADUlJcUtIaBfsw0X9GMj?=
 =?us-ascii?Q?yZQikolZQ+qQlfjqDbMsm1vejeLr27cyxu18IA7JPWeF9l9O6vK5UOHn0jyn?=
 =?us-ascii?Q?Qqgkc4w80SqfJWxnsnO9DcqYx/Hn4LLcmXIzf1pnHv6+ZcqObxtcIvN5Z7dp?=
 =?us-ascii?Q?9Vwa3ojzZxtc6XCPAB+VRwdffhY0Tv23SWRVfWmbRvctJkcx5J2O+emR750h?=
 =?us-ascii?Q?JayDkA+iyLaCe9TAEzY1AAzns1HueVDcWQxSRUYeRK5DqXVcAPmEHLnkrpCf?=
 =?us-ascii?Q?eqFqLFcrhfeo3SM0eif4xCrg8yL+3v+EQtn8+FnMtliWZ+njCLulCCL1zwos?=
 =?us-ascii?Q?2dkARvbMcJmugN4F7zZOgThj5WszY5sZsOG96QYQ30npCAKDa7N9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac091fd0-a503-4e83-95db-08df0186741b
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 02:21:49.8676
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rg2P38Lwt22glNSeYXmSSrzJVdMS9NoKHtHAYVAEKH1PWuYBEWvYQ22KyGIjVNWY/5H9wOeC5Fdzv51j0jINYzihU7ABqdUb+C8ceMlGgDixqWTgUcKrFBjpWuQJQ2fc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8562

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

