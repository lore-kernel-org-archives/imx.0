Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011017.outbound.protection.outlook.com [52.101.70.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F19B40F8DA
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 15:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772464003; cv=fail; b=jWO9Y+TNgDmTw4QnAHSJzt2RX+4DzYeRZ+VskzstaLnERvBaFgwIYS8Pn3iMHwl/C7IKjN2cOWEluPmlfSju4lwZzItW7LSCJCDyopLgZbt39uwzV5mlN3GbkbDMYCcLf9dw7DXdXcu6YmPC7CKrITOhNhGItVRZMZRtmTH3dvE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772464003; c=relaxed/simple;
	bh=s1gAtU06weceHFlv4eR/aHiBZYsXZRLgwZXwxLL2ALQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=o2HuBGi1urDT3JhmP/R0n2NwhA1tthRYTszJQWnB3nQE6XooPXNDSS6BZrSioNTOVflkmecBCOQKly+2Wh3SZqlYPgnnbt2qnRWUdTOdq6vs+KM6pgzPC7+HH5cxeZQT+p0myGex+wpg4Iw3wKcjL4jqPvvxQditxXdczdFRfAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vwiFfkU0; arc=fail smtp.client-ip=52.101.70.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vwiFfkU0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B11BDMLqk5HzHzjcEO/hpYH/gJbi6Wq/+r4lAu1FStNIOhtXTwlEeqlqIoEi7KDN99MpeVZTvYx95Mctu7F1vwLi8TgZLbp2pjfHkv9JRPbgXjhGyETAwheUwppbEGsTonwAMk+y8/7Vpa+Gi8IfOZ2HRxPjMf2910YxKAqIprXtHlYefxX/I6qhLsqi8TrYGNY+wvjCUpIcW8fvADBEe9sZVld51xZ9S1U5243O9mGE2SyAWE/ZCweoD+6feXRUcENHPmxl/yYbB7VXhM9tF16cPH42yZyFFF0V4UWM1NJOr0EN0cB6FFpe/R/MpD6LF34hduEqqja/cGBOjTuETw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wadq2m+FmgXvrzGESbTc/1jxM8gXxmwbUbtOvbfuNBk=;
 b=kIiEX+bBju0xuYIZRVGJzJyU/dMiDiFGV0+i/2a9vKh7bwf6iA30CQ8EsTd12JIBioswW4+rT/+p5Pzq3S6EffgYv0fNukur++PTj1c882gGoIZit/+nB4nptDQkgT5VZOAvU2/eM2+5fp1/N/cCIf1YX00Ta48x/gVazF5ieSNjKJOlBerR1x2cr/e6F6lzQDcIj0KWIML8SSb9dq+mucKZ3MAZ04e7scljU3H03Y0HVfi6BPMqZ2cEzIRulibQYO13v+XZNt8OEc+b2ibfY2orzPrfHVQXtO7+v37otz6zvEUCXHjrVOECqkfjz/Mnzpf7a38/5cASRiB/VmuaVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wadq2m+FmgXvrzGESbTc/1jxM8gXxmwbUbtOvbfuNBk=;
 b=vwiFfkU09TmaE3/xQVhWe/cUyeo3UErn0N9XeIP4qIX+D8JApEYYjLE01DKBhgBy25DPc7qa++5H1bG858gRI+532CVgoGdpSQItoL6LD1cUDuMhugctJZi5AvOSSeaM8cJhnl8ejYZ6+KaFovT39qpxK9PLT08GNI8Q46GwJ8C/gk+2YzOlZhLrUnyS2gI3a8soufLwchiyEqXRJKEb8WmuY+VroQqkRGc4Bvn67zpXv5vP0XrQs1qnZvkgZNCAYFLWsHjX49k1Cib4w13des1jxU76qVSuFh3x63rR798T5M5KHqnlYSCdMqYkgqh7stDqv08kJtI++lSUe13NSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM0PR04MB6980.eurprd04.prod.outlook.com (2603:10a6:208:17e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 15:06:39 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Mon, 2 Mar 2026
 15:06:39 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 02 Mar 2026 23:07:42 +0800
Subject: [PATCH v3 2/2] ARM: dts: imx7ulp: Add CPU clock and OPP table
 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-imx7ulp-v3-2-26b708aecc59@nxp.com>
References: <20260302-imx7ulp-v3-0-26b708aecc59@nxp.com>
In-Reply-To: <20260302-imx7ulp-v3-0-26b708aecc59@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, "A.s. Dong" <aisheng.dong@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG3P274CA0013.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::25)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM0PR04MB6980:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b162d1a-32ef-45fe-f985-08de786d4e4f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	KPKkKzoRWonBehne4LA2j9sHH+Om4beDCVY19qpVgACiLrfM5Qvgjeiuhj7DPV2bBmnnFbMStosiqTMrqxpVgUeREjjqGcikOa2CrV/X6zgMFPBg+HRyKws/1jXqYCygcgq14oc8WPuWNh0rM4Udg+VCYDAkUDU07NUsNPgJzRIQ7PlvIupWNAT8QjoPgYFuwwJZVa6RUqr8CefX2OvMJQ1Zv5vc9GL8X6RD3FeRs+wQnkLQ2ACeTm4g+nLTAA4EASMF+Ilrgwu7WBj/4GDgAGCrwFiQ/QpRHTzo7hhhwKTYFTkItAR7PtxPlPWDQ1HI7WkmhPwVispDugr4RwD7vypwiQCBswF01eGjS7hPl4ANtJnczOVxkDs2ZA2gSkyX7vLw++Ujt6PyzdoCOpgoI7L1QmnQVcvrMPmGqHEv6tDacG5YSMD6Dfh/c+57rMoGW5I3WNc53jM8R3d6cU9rARy6+zBLGgNYiHyRwubqWQTaEnTqRfFGDlkOeHmNS4ngXdBRSl1iTN9vtCQkivS11GvQHrB6fOW/wL0Pk28nWBO2dS56veI0IYi7ZVq1x9d9i26aA5gL8LBXjEKb2sCG1+7LNHVcrYyLWgvZko+8Py9D5gir4I6bM5uzOT3AhE71KyxgDlfY+IVsxcSWyVSMtHahRG9bN9yCGOyWZANrysGedkidRAEq4lj0ige4B8pUQTRczLbeiOENbA3/xbARGu+3WI4ss5RLEasPJG9kLLJOO5510/Kjv7QYumCOuUjJlP2gbkpgHyzThfk9rphCQwmrWjQEHqqEGf1AfuQBVEE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTd6WFl6RXltbWhhazBNQkZrc2RWZ3BHaXNjL2Y3NzJQMFhsNE81OFA2bUZw?=
 =?utf-8?B?Nk9jeDJxd015UlZXTC84blpuNEZLRnhNQzBnWHNIc0pBb3lQcEdCaXF2YUZM?=
 =?utf-8?B?dWo1M3o1VE5ocm5GOG9XRW81WVpVeVNOc1JDME9ORW9tUk54anY2WmdxYzR5?=
 =?utf-8?B?RE1ta2thU0d5UkthSlkwVDlMMzlKSGQ5UGFvNTFyR0lVRmNGS1dnRlNPOEdJ?=
 =?utf-8?B?eHRrV1V2L1ptaTIrQzBFQmJQK0daa2pBM09KZEZHeWpGbjZVWCs3QkY0ZUY2?=
 =?utf-8?B?aUxXcTB2R0RKeHk4bG5yUjhBQXdSMDlRb0hES2RFbVpyNi92emZ3OWhPeFRM?=
 =?utf-8?B?VFJBYnlkUlR1OUFOWCtwajJlczhqazRQV3MwWXAvL3UvMXQ0bzV1NzkyRHdS?=
 =?utf-8?B?YjU1b3llSFJ2aGc1L0NZSVNYd2NJMmhpV2xGQU1xc0ZlUGpoK3FydlBVcHZJ?=
 =?utf-8?B?QSt1U1ZqeFFXSVFLUUZHUVAxVlVhUkI4bU5VNktWOVhpVUJPUXkzWSs0ZW0v?=
 =?utf-8?B?bGptblJVTDlYVndsWWU5aXFEdmtWd1VhR0tOeiszZ2Y1OFdPNHdHNld4bHJs?=
 =?utf-8?B?UUpuM3lhY056N0lucXRSTTNjQ2NXNitwaHNEQmg0TWQ0cXgySFJ6d05CKy9F?=
 =?utf-8?B?dFBVVlV5WTU1RkN6MWFZSUZyOGRIMGF6b01tT3VOVWQvNmlsWW84YWdoeWJR?=
 =?utf-8?B?MkV4S0FYZ1QyRkxrNml0MDg5VERuRW94aFRGRkdJV3A5MnU3SERPbld4c2d4?=
 =?utf-8?B?MUl5aS9Ca1g0YTcyd2JVSWhieEJLbEdSRHQ1VUllQ2JEZjR1ME1LdHhwcEZW?=
 =?utf-8?B?WksveW51Tk1mdmQ1STcrNXpVbS9KMm9OTnl6M2dKSGNjZW1DRlZRVWs5cGtu?=
 =?utf-8?B?ZngvS1lDYlROKzA2Y0hRYXpLdzJaaXRJSFhVaTVJbUlyQTZNNEx4cUxBV1RG?=
 =?utf-8?B?enhnd2d4S0IyK1lrVDJNREZtQ1RlcEhwL0VGaS9qeWdqQWtYT25ZOXBDWFVU?=
 =?utf-8?B?aUFCSVJIK0lOaGdaRHA2N1JFN1JsMzAzNUFLeXVsMlBONlppUDltcDN2NkJL?=
 =?utf-8?B?NFVoSURBMFI5czFTVEwyK1N3eWJTUCtMcGpNcEgxQmtEWW5QbFZFMWFnQ0F1?=
 =?utf-8?B?MDQ0MWk0NW0ybzBOcmUzVTMrWU5pY2k5SWxuSElwT1hZQnN0UkVackdkUGpZ?=
 =?utf-8?B?ZjVlVFFBQXovWC9rZTZ0RkNKbnczd3I4Z09BUVlBMGYvNFp6TXhZVFpTSVEz?=
 =?utf-8?B?MXRUSEFzWkxzdUU4Q0pnWXJXQi95SVYwblo5R1pYS1JQN1BPeW5aQkRPKzRa?=
 =?utf-8?B?YWd2RlUyWjJsKzFFdytoWXlTVmdpd0Z2bDVMN3VHc1hDU0NobHVuWFF4OFYx?=
 =?utf-8?B?WlZTVHVJalZZOCt3SlYrbEgwNkJTeit2VUpDRW5OemIxN3BEbWJNMHZCOHNT?=
 =?utf-8?B?VHhHZk1uaGQ4SW9aL2VKTTJ3dkxLbGVIcEhLNVh0ZnFtdjZ2cFlza1dYenhu?=
 =?utf-8?B?NG0wVGZqWit0YnB4Q2FlQ3gzaVgrZGhSVkVrd01FSWtqcGkzeW9Pd2x0WFc0?=
 =?utf-8?B?YURZbkxCQUVzNGFrU2JDWmY3RHVNRCtmdzJRWXpNSkVNZWtra3lDSkFqaWJP?=
 =?utf-8?B?UmxKUVd4YXFSVkpDeGl1MWk1QXc3QmpKQ211WXB4ZEJEZnlWV3I3bmZON25j?=
 =?utf-8?B?a3FFaG9CTm9yMkZpeDJTcVJhNkY5ZVZJUms5VHBCQWhKUGlWNzJrMHFHNkE3?=
 =?utf-8?B?bmhDODQ0bXdtczJ6SE5OWGh3eWhyZmxjWFdZRlRhM0JLUEJpRjdvYU1HK3ZS?=
 =?utf-8?B?Y0VoV1BTYmRhVUVHOEhSdzhreGxJVjhhRjBhRnFlcWE3M21EcG1oYXNWeGxF?=
 =?utf-8?B?QWJWaE5vVTE4MTB0amcwL1lvTHpxa0ttTjR6Q3ZaRGVIek1nU3o3YWJNYUh4?=
 =?utf-8?B?cVV0U015N0p2ZWsvMVVOOFZZZUFBZFNzQ0RseWNZQS85NW1PNDZaZnR4SHg1?=
 =?utf-8?B?dWtUay9lMjhDdng0Y2d5KzZLakhJWUovc3VId1dWOVVwaTh2VjYvVlFwdVMz?=
 =?utf-8?B?L2lrN1IwaHFTRE5EdHRweEROVnZEcWJLcWQrR2EzOXlOVlZXdEhJTU42UjZG?=
 =?utf-8?B?VTA4YXhUaFlEd0hCdU5kclpFVkhPYU5TSGM5NENQMjltRVNwYTFWcEFCeXlM?=
 =?utf-8?B?b0d0TUJEdXROSjMrL3RQYUx1U3pwTE5tUlVsZkUzT2RZUHAwZEQ3UFRSS2dw?=
 =?utf-8?B?eTNrYzZNazBBWDdvbjdJZkgrb0IrRlBiRk5CSTNxOUJUWm01Q3Yrc25sdC9H?=
 =?utf-8?B?NWl6VnpjM0QyN3Z3L2g4QnRmSnR2RDV1dU1hVC9vd0YvUUg4Y00vdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b162d1a-32ef-45fe-f985-08de786d4e4f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 15:06:39.5038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i435ze0QLG7ynFadfz2xyBvjAO/NWEphoTI8PxjnYUdfahT6BM2uvlBu2HwN00QjL2EZYUAZ1VRTEtTdQ2ptYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6980

From: Peng Fan <peng.fan@nxp.com>

Add missing CPU clock definitions and operating-points-v2 table for the
Cortex-A7 on i.MX7ULP to enable proper CPU frequency scaling and
integration with the cpufreq/OPP frameworks.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
index 880b9a4f32b0846a773dbf9ad30715c84ac2fda6..1355feda1aa72d88dcf56033dfdeaae631c108f8 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx7ulp.dtsi
@@ -41,6 +41,34 @@ cpu0: cpu@f00 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <0xf00>;
+			clocks = <&smc1 IMX7ULP_CLK_ARM>,
+				 <&scg1 IMX7ULP_CLK_CORE>,
+				 <&scg1 IMX7ULP_CLK_SYS_SEL>,
+				 <&scg1 IMX7ULP_CLK_HSRUN_CORE>,
+				 <&scg1 IMX7ULP_CLK_HSRUN_SYS_SEL>,
+				 <&scg1 IMX7ULP_CLK_FIRC>;
+			clock-names = "arm", "core", "scs_sel",
+				      "hsrun_core", "hsrun_scs_sel",
+				      "firc";
+			operating-points-v2 = <&cpu0_opp_table>;
+		};
+	};
+
+	cpu0_opp_table: opp-table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-500210000 {
+			opp-hz = /bits/ 64 <500210000>;
+			opp-microvolt = <1025000>;
+			clock-latency-ns = <150000>;
+			opp-suspend;
+		};
+
+		opp-720000000 {
+			opp-hz = /bits/ 64 <720000000>;
+			opp-microvolt = <1125000>;
+			clock-latency-ns = <150000>;
 		};
 	};
 

-- 
2.37.1

