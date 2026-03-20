Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011000.outbound.protection.outlook.com [52.101.70.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C423F3AE706
	for <imx@lists.linux.dev>; Fri, 20 Mar 2026 12:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774009614; cv=fail; b=Grc0I6FVhd5bJCzkt1Iyo9GnnDE3XmxXPoHMfI5x+wntb50+CfgfdowLEmpDo/rdmgj1xm56XHVa5yGkR+jRzphOABfhmGvUUjl519aMYAlatbGVqFgOEOyyTFgdnkJdbSw5trvch/X35qAHwlqiOZDibXamb+22lgUk2TJNygM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774009614; c=relaxed/simple;
	bh=TuBIpYjL1dagwF1AZdk+hUFnY4bDjwzDL+iRS8JhmsY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Kc/B0rc7j7flM+AEUiX+156vH+4lFgIaBKx/FaMjRpxJvRpaFriVy3IIAcsr6LH8kpN3L4A4argVU8fkltTgwGyq1Wr/ph/r6ZnUgA3p8icmwpxPK8ARuB5U0Asj915qXnwd0fmNoA7z7m0b/TdauKc9DCwQCDfmdUcphAnfrDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vfVTJbpG; arc=fail smtp.client-ip=52.101.70.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vfVTJbpG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvmWbOpFPe6n35BKYIe/N8auLVYVVnvNTUxJM3Ahuz7Y/13yS+XZ9wNk1Rc8HEyhvUh9slCIzZTj84faU43OIB6+Zwan9cDmIR+8yjA6RPTjS8SO5i+ROc761W8FRn0HN8lDposhbNj8ftboknNYi6wuBzK7VvTyNezYm6u7Zoo0O22CvE/+0SaUnxew9ay/c6k5C8E/+Sl967OnvRPCCYEQQyf3yPnmUBtbiiTuunjC4tdwr5bZ7pYOlm17MYPQnK8bal83IG+IQnLpHB1b37Y3paTfUNWtffi1Q+p6XxflpS0olzzHcpv9Q4fcKUfSx8qEDyh3QIexdAzhqEEqCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1gVhTlzQzFUEeffgzXNX8iFvH4HpP3vABABab79mn0k=;
 b=sn7xHzwZklEYKA8btkSq5+m2SiuYjd/zrcT2cgBchdwy8/7djH6K7XYlSocyd3GQ7NKP7I/o0g+ie9fQaRGqqoxAhWhR7IQMo+eODhvuyvctNFyF9ieOpOBOFvbw5dnZrGaLIevjSUnlEeUW6Yqn5V8xszyye4wFzf79juF4wZ30LQD940pXuwFIEqP6hX4KilRw2wYlwE9exCs/SoGufVrSoyYU6BaozE6FP9Zczk64wMeoSVLl9Xwp0HBvQSQGsdfOrNdKqE36HFlrKSe4Fib3mXP9bouMkUwEgaTFE2OrAihYJRoK/jx9vSl2YelN9tLdzlnNQ7tOHm0aahvioQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1gVhTlzQzFUEeffgzXNX8iFvH4HpP3vABABab79mn0k=;
 b=vfVTJbpG/WmYwbRg4PPqtpB8/YLhHsmvv6H3ustTsPRukK7qviZjtIMBeEtaI08YGWzqGd6ZrGgNu+8NOj4Yd/t6iNq1rY/Chn4UEjTEQUE3H+D6JIsR7At+KfEzyutIKdpBppwfTPJvOacQURXys9PCvJqZWjiEPW0R2y2KpdWM0qrCQM0nPoHbhkR9zHhqJlSuQ+cTAy+GxRl62yL6DovoX3hg1gVZa2kWmLMMTvgyOiTi1HGRURyieYg3VM/CZNxtek7YlKUxP0cs/4IuxaY4LW8uGYUyV4lzd/9fMagy49V2MUJ+KGAcVMjOdPhRdp6SJc3TGiyzvoAINSUPMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AM8PR04MB7331.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.23; Fri, 20 Mar
 2026 12:26:30 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.018; Fri, 20 Mar 2026
 12:26:46 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 20 Mar 2026 20:27:55 +0800
Subject: [PATCH v2 7/7] arm64: dts: imx943-evk: Add pf09/53 thermal zone
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-imx943-dts-v1-v2-7-e6eba6b3a837@nxp.com>
References: <20260320-imx943-dts-v1-v2-0-e6eba6b3a837@nxp.com>
In-Reply-To: <20260320-imx943-dts-v1-v2-0-e6eba6b3a837@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:4:197::6) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AM8PR04MB7331:EE_
X-MS-Office365-Filtering-Correlation-Id: 23406ce5-922a-4667-e2b8-08de867bf3ae
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|7416014|376014|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hg5n5utwKBkD/c2dc3AvTfB7XdpLJ8ucXx7Bx28k99/QDCL6r9g7iYb9XtmcUjqLzo5lUccm5SJz0qi9Cp2zHNyQKouzte9S/y8ckBSpQA3ni9EREaLx13lnO9oE8g/hP471z3JXm167Fgw262rixlWBsULnL0B3SDpaWEI2D1V6U5ZA/FBWTOp13Ft3L85G7tp9W9Nb3AxilupfVCHEPqtYR3iJvGg2AgskIxtRgCz9JJVphOgPj/oe8iAXk7TktBAwvhTsIE3t58c36X99Xb+6bhTHM6Onk2tjRvtqmKY/qNnIeRLrIWNvYuB395FqZJzLjdOgeLzJ9lMA9mazO4ub2jbqxPDjTy05MWOmPxLEjojwX7HMuzoVB3Z0Q1zglSjLpybf7crILvulKwb1RaR9S39P936RTbiF79ejknMHurz8hPDr83UVwrRb2f/lXU6nPG9Obf+7gWTb2A0GtX2UnKLAq5x+2k2i6FEgUV27PvV3NiVGH+iQE1fr8LCM+UQ9MHWCk0x/2tQcwg0MZ9h+LDIKp9Ci7M7jYw9MZkh1LKRC2YWnjNRIY7mFzoxvEd/KSxWQompjzePLrjD8uizJ5Tkz237ayL1ih1XA2R2RZs3HtfzWM/cQ63H2/3NxYq9FU7uatYIqyj0ZXIxgbOJCmvF23nbvtXKtbfe6mcPfhc/AaB85Z0ggFXFmDCHOW/FYco2VupDzwa5nMy6sWt9ycf06M3sddBR85dYiJNWWKsiLFlwZXdpiDchbMNK1edVpNr0QY2dsFqRr6i7x/UMbM5Xv6yqhfSwOBzUZWNI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(7416014)(376014)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEJ4aHY3clhxc0tzbUorbkhFQUFiZjVyKzA2cURITDlvbkg0dVRvbnVZY3VH?=
 =?utf-8?B?QktoWEYwVk5uZ1RyNUVMQVJUQTNZQlowQTF1MXUwNVVKeFV6WGJpSUpBUURB?=
 =?utf-8?B?NDVpcjRVREdpWFJYcXJEY2Z0WElxTmdZT2QzVldiU0VpZVBPT3ZTYUdWV1lU?=
 =?utf-8?B?cFFQb3AyN1lqbXlTeDgzQ3IxeFN6YkxjZDhDOWRwVExDa0tmRVVySDNXMkdL?=
 =?utf-8?B?UUVTeGY1anA4WUpNS3AvVWIrRCt1VCtMSTcxVjYwcTJ2bzRtL2krMWx2eUFG?=
 =?utf-8?B?bjgzSCtuaWlFWU5Gd09QMGJpRm12d2lQS1hXVzZwTENQRTArdkVJNGxaRkdy?=
 =?utf-8?B?Yi9iaFlucHJUZzQ4MlRuMkYzTWZYa0lKTUFrNjlsNXVUdGE1aFZhYzBhL1NQ?=
 =?utf-8?B?YW12eUdaR3lEWkFicytJMitFWVFXanYzT2dSd0ZWRXl5akpkdHF2UGZjSE9u?=
 =?utf-8?B?cTl1emNrV1J5UFNXNGs0S05kdHZlQkk5dkw2MVVXODIxWEdrdE9mQWZuYUtE?=
 =?utf-8?B?NGZwOG0yTy9pMjJQcEt6aXF4emlFMEtYZ1c4WjJHOTQ5UVM1d0g0d3Y3eEM5?=
 =?utf-8?B?M3VyVHFLQ2ozMG5BOHNrVVJNY2p3MzR5b29TaEpreXpUWWExcGpoamI3alNi?=
 =?utf-8?B?RHRLd0huY09RRGlmWW5UMHRrVndhTXVTcG9YUGwrN2N4cWprRjcyUG9GdHNk?=
 =?utf-8?B?djBESXVBWkdjMDYrUFY1QVJxMWc1L2lXalJqKzVEUkIwcWFTTldqMmNYZHJK?=
 =?utf-8?B?ejREQm9sc05Benl3S3RLeXkwL1RXUmJ4ZW5EL3pBL1VkREJyUFUwdDBtbDd5?=
 =?utf-8?B?Y0hWNFZNNFNrOGZ4eEhIc2NVeG1IWWxjV01XNTk1MXMwdWt3dGNBOVhYbE1r?=
 =?utf-8?B?a0s2cWMwWm9BQ0dpNHQvbzlHVmRrdVcrU0R1amFVNjV5KzRqa0ErQzBQWHRk?=
 =?utf-8?B?SEpMVWIrWDlFQjlXSlRUM0hydENRaHhyYlRQbVppNlFpeS9UUXZUQUNBYmx3?=
 =?utf-8?B?Qk9vOVVXckd6L2FvZUVURThWT1RybHN3TEx3b1BzTUpDUE8vQnpwOUxiRFhm?=
 =?utf-8?B?dXpQOWd0L2ZqcGNldzVJcmRYdE9mbCsrTERFeVVaeDJLbVFDc0NXVUtXMVNh?=
 =?utf-8?B?SGtMUkZ4QzE0cFgwWEhROGpPbkNzMm96V3pld29WNlhwMjJBeVdiQytYNXg1?=
 =?utf-8?B?ZWEzYnhzVUFSTk9nSVFGR05acUs5TWY0TWtOcUlPTWY4QTZSVmpsSXFiWkFu?=
 =?utf-8?B?Rm1qWDNEUE56dTZRdWptM0JOeVhFcDRVUFI5T0xWYWwvSG5MVmJmR1FsbURS?=
 =?utf-8?B?cndiN1pDR2V3bFA1c28vVy9ad3huYXVhL0hyekFEaW50YzBCRzEvRzM1amFs?=
 =?utf-8?B?UmVzcjlQaTFIN21wVFFGdDJDV2NtNHVNQm1ocmErUnJmdm5xR2pENzFLaVdi?=
 =?utf-8?B?eWJsRks1R0l2OFlPVloyZDM1TFJlMklVOTBRTENrcUN5SVYvZ3JDR01PSHlJ?=
 =?utf-8?B?VTUwWDVQUU83ZzhYczdNMU5rWnVzdmJVb3AvNmpsNmxwU2gxTE1YaHlJQ25w?=
 =?utf-8?B?K0ZlaENFNzZhVUpoaXNJcTBXTXZkMCs1eDYzTXVKMDVPVTNNYTJ5Z21tUkd3?=
 =?utf-8?B?cUtBSkQvRnRWUHlKZjlRdVczUTJzb1loVHJkTnB4dzh3Sm95NzRUNFQ0bWJB?=
 =?utf-8?B?RklNU1JhaWlSdDZuTjlkZFJ1cUxPZlZhazdHcnUySGRDOGV3dEx2TytyOW5S?=
 =?utf-8?B?MFVEcDdvbkpZTXllWWVEdDdCd05XTFVzU0FhSnZ0TTVxQUt5OWQ2OHhMN01H?=
 =?utf-8?B?VmZkK0FaRXlhQTk0eWZDS1F3VCtZZ1QvUUhZZFpjb0hXbitwZWgxY1N1b1M0?=
 =?utf-8?B?ajlaZ250NUZFczM0bGdMa2hTOWNmMkd6OHo3TlI2bDM1dEVNL2RldDlmbXZU?=
 =?utf-8?B?ZW43UGQwYVFwNFh2bWQ3cFdhb0d6SVBLd0h3SnZBYnEyS0N0ckJVeVZaN2Q0?=
 =?utf-8?B?NFpZaDh4S2VwQituS2ZuVDc2UURFcThtSkZLT2RBRmY2emVsU05uZm9jNGNP?=
 =?utf-8?B?MEp4M0JWQmFSTmkyNzVYMVc3L0tCQWFHUjAyZTltWDY0N2NSZHprVk93b0F6?=
 =?utf-8?B?UE5yem5VSTR6eFoyZ0dDQ1RzVUhucEJIU2UrN01iT3ZJWlF0bVg1Wjg1eDU3?=
 =?utf-8?B?azBSMHRYcWpvRnR4T2hjSi9SRGtLT3FlN3VmVzY1eldDMmIvTmw0bmlhaHhK?=
 =?utf-8?B?ZUduOUkxODZWeVNRcms4VmxWWEttNVdDUUdnY2FpZFk0ZVM1QS9scmk1Q1kv?=
 =?utf-8?B?SnZjNkhRMkFVNk83ekZqdTI5S0szMk5CVWZDbXArNmFDL3QxRmYyUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23406ce5-922a-4667-e2b8-08de867bf3ae
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 12:26:46.1898
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ahZeoqU1euppNzDtjZ3GYuwMwqVBtALfeHxrxWtUrGIm1gidk2VvtYwO5dcAs2g1IPeKsp+gcJebVsU6WvPCGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7331

From: Peng Fan <peng.fan@nxp.com>

Add PF09 and PF53 thermal nodes.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 38 ++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index 7125c7fc6e32999fd279b9d01af0b210d1ab843d..0fd142f19ed2c99c9d555f4f2b9e6b8259131fb9 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -946,6 +946,44 @@ map3 {
 			};
 		};
 	};
+
+	pf09-thermal {
+		polling-delay-passive = <250>;
+		polling-delay = <2000>;
+		thermal-sensors = <&scmi_sensor 2>;
+		trips {
+			pf09_alert: trip0 {
+				temperature = <140000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+
+			pf09_crit: trip1 {
+				temperature = <155000>;
+				hysteresis = <2000>;
+				type = "critical";
+			};
+		};
+	};
+
+	pf53soc-thermal {
+		polling-delay-passive = <250>;
+		polling-delay = <2000>;
+		thermal-sensors = <&scmi_sensor 3>;
+		trips {
+			pf5302_alert: trip0 {
+				temperature = <140000>;
+				hysteresis = <2000>;
+				type = "passive";
+			};
+
+			pf5302_crit: trip1 {
+				temperature = <155000>;
+				hysteresis = <2000>;
+				type = "critical";
+			};
+		};
+	};
 };
 
 &usb2 {

-- 
2.37.1

