Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011048.outbound.protection.outlook.com [52.101.65.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968A33F929A
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 12:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784290030; cv=fail; b=c6XACVmZbbr/OUTP5ms5n3y+ZSQcltxqvlR3hEcSrUW45oynW6AzujuXg3RCYsDZ7ZJTJADvUixSF8xND5huCYfJuLfiQ18FEeEjhlPs0eCrc6N0z5R9UTBdYBYa9NWxoMR1BmNJthOHV97TwA/zDFpJN1+v28gUXV0CrchrIk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784290030; c=relaxed/simple;
	bh=Or+IQleNx8+fmMwo8u9VaYKOIg2FQOZimXZvM3f6P7M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tuQ/oPzXKQZZ7jGzLNgHLC9ERb9yT/McmfNzJjVDpZS9G2BDhmqTbgqSvpb7XO2f+uINJ5FSs6LCx7p5nD9FDRNfCO7aoV3IKVgKjnmyiT7sp21PjkzWeqn3QHUNNK5WmscOO7B/KS3bAMD94UXGe+S5UkEcoyIE85Mfdjlhw+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CgXHuHv+; arc=fail smtp.client-ip=52.101.65.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CgXHuHv+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uVvOtiMKBYf1BUuwnNk3U8AcJQNvj2h7PuNNcslOlqmblIHRGt5u7434PLQ2NnPDGDZSBwD+W9VBLBjfGTRrlP5fcz9s0yQeqEqQAr9zIH+/ADaJuFSLTQGLyu6faBIqmGiK0M7DtXE0W+VJDx3Od6W0gZ2Kc9p6prfVoGnuFDqaIpehg+J/zBXGvZ9a5W8gopHAD/PVXOAux+pJWkbxoRb6nAgmiGRgpDcCEB42ojsM15NRO4v+yeqvcW3mULi67F2fz9I7jnZUVpRtQYvcxKKsGSw55QsOb8qZQ+stOjyUKNeYjBfzz4UVqVgzaTOvlqWNN0zyQT9X4A9wfFs/Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NWOt7GoQcFgbc5RBWS6kqXuyJGNAInUUP9WWFlHYlI0=;
 b=tf8WX9QGR88BzoYY8M3k4hAev9MWtlDP2be4Kw7KLdLw2VYBHxnSuuIsynHy2ogAukLRKX7M4jKJjcM02NGMQtxNVzbqd53MholWSTLYWxdYn+9giMV8xEBjknOycb2HV/rYscCMMN3TBNwul8PiLfvNrBe37AKGzflVfoK+f8xv5DbaRd0yVPomoUgs6pdVn3CeFwSjXlCXoxpKzThFkrhhfx09dicFnyDgoNZaiLp6sE+BefMRCsWM/8CfnX37K4O0vD77qkzs0g9AgjcES/B3hzYxeJY3/SRBEPOkwOB222AcUrhNsYS7K/yy8MJOGwLGEY1HI3ECYzW8W2v48A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NWOt7GoQcFgbc5RBWS6kqXuyJGNAInUUP9WWFlHYlI0=;
 b=CgXHuHv+q7O+D2XRFSiHsSWSUtAx8cnUgo6MEF1Ihk1CpVeCHziPRj2rpmkYRqBorzJiT5RSSYmrsoCpCXpZEe+j7OEBJwMB2n+R8m4XBm1PDw9TwwmVCnfViBQrvtuBzXuJI/RLtiTv40w29fcaLGxF4T7H87qpT6EkvNxDEMx2ZQ3lNUxkQdqLsHX8+e12J8M+jtmlJlmGmWeeEFHUcYetWD8K6xeOqq2Ou9vOg/Z/OK2ebJK1Dw37AeGmM0xg4lowHI+t5Xw8EP/SPCi6yH85jm4K3RxYYQ+YBVKURyB6kP9ND0zO73kxAfuuURkzC795PHwRI9uD9shc+oJnTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by PA4PR04MB7645.eurprd04.prod.outlook.com
 (2603:10a6:102:eb::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 12:07:05 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 12:07:05 +0000
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Frank.Li@nxp.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Cc: vladimir.oltean@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux@ew.tq-group.com
Subject: [PATCH v3 08/11] arm64: dts: ls1028a: describe the Lynx 10G SerDes
Date: Fri, 17 Jul 2026 15:06:32 +0300
Message-Id: <20260717120635.2118610-9-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717120635.2118610-1-ioana.ciornei@nxp.com>
References: <20260717120635.2118610-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0094.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::11) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|PA4PR04MB7645:EE_
X-MS-Office365-Filtering-Correlation-Id: dc972f63-50b3-486f-2cf8-08dee3fbeb47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|19092799006|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	KZviIeSB0xMHlgTvYPO0hTEwdX+rcwnP9IS+zxwKLenZDNKpxUYGvXjQUHxjAdN01pAdQQTa/NemK09zJq42ac0oYRKNRhCBkDvHlRmh8qiQVyfK0chbSenxYfQ4Y9k264Unl8FhmxEBFkbuZnLoQMm6Xy3Gce1z30x8J2Y10Ms2pxuOYDFTlQzbLcYdajXinVcZmLTdEJuyMZCl1ltRhx2TK1jL3fVrfglqou7LExpWMMNrIsndAmpH4ooiJ4P3C899RfybAiR7Low2kZTboUAh0NZCX+oxo9qMrrUHzJ28wxpvhDqeYppUmvut8u20YovO4VJhvtTlqW3HW/N2BIrWVIZ97E9qfpumgZrvkIy97yxTP8Xs3VdJTCTnXFBl+TBuVQVMZx6cCRGhxa8dvnz/9579EaZ3An+9jq5u0ajy0MLtWtKnSFevmklvZaIlAlgkuoxKKa5DTzmksmSDm4L/J32cB8bjvCvCtbPC1A4COnVkPFYF1xLPaWp8pjOyHn65vU7Kjz8b+T8bQ8keZY8M8nof49wb0kmNdDGMSqZXShnWq+GrQ256R+50Ewh1rmRgnxB8lVDUdq52/tmKqCFTP2KMTLDaUB1KmanLstPDlmF2YkERLjRIvWopwwhnX81f2K8DhymrmlXtIWXm8PLAcV+xIaGWgCi4nH51mP8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(19092799006)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0zwf6XctIc9KCx7xhqH4y/1Z7RBevFBArdWOyf/zNe3Xs5uIve9WW+h6c/5E?=
 =?us-ascii?Q?J1z12th9oZBgmutwwpe0oXhLA+7fQMwdLPC713GXxYZIyhznyHmOCoAfM4YY?=
 =?us-ascii?Q?d/r55pnT1BdPiijxZJGv6Op2+KOvxbnRFlCXG13mFlS2NFSsjVUA6Gz4PaS1?=
 =?us-ascii?Q?b4NIOCKyQ3bJo+t5DPa1k1mqy3bfXMeNXYRtDSlNAVmkNfWHuVSV7Htj1vaG?=
 =?us-ascii?Q?QSPlQ316QtP4qxSgFvj1R5buEl8QmzU+9ooNWsLl9h5ZWQRoGvxiCfRsvEUy?=
 =?us-ascii?Q?k5ZXsBbKiRoBFjoBMaPXBJwKJYWqblbMrWBDOGwzuHKk6mhkHf5Kj3vhYfj/?=
 =?us-ascii?Q?O4kWptktg1M8UoSihEFx8m9GTEDLG6E0yd+O9ykaUoC0tMOpGZL8yRUEJa9F?=
 =?us-ascii?Q?OshjasY9u7/jwIj/O+uP0YKjuCfQibzUmUp+yUBxQoywHdKEJH/9NU1qxKDR?=
 =?us-ascii?Q?UmaJ+uEoD33G7xjWfVnprGh7HNb6Of7cY8NquWmaB2nsQBniZ/vO/w5WDvC9?=
 =?us-ascii?Q?QQYTjWUf7M2GyTITiN9W0aoJzi2AwnwXA4J08R8A+AtsR8Xr8Sf/zWt0gz4I?=
 =?us-ascii?Q?MYkP4kuu2pZW4+mz8eQu6fWSuJqS163cGze1mhcpvrsWhb+m7WoJ4HzxY1n/?=
 =?us-ascii?Q?/FRbQ5Yrb0C8IkiszkoA3uTcNqc/Wwm1mjjkE2bh60VPpy4Hv1GO5JXlwrTV?=
 =?us-ascii?Q?fOHE2XrZFxGqFfxCug0x8O0eo7s5fAFsDogi7dl5Zuas8qt+yOuM/cybtn1B?=
 =?us-ascii?Q?gQBx6QFbqH3FL00tiatKowdxP9HKhMC5ShcjZR+exfXrqPeRlIbagf1Mldi2?=
 =?us-ascii?Q?9VjKInKreCg7F0HwPOGL4GgwuvFURKcvLO2Ttt+fUbd/4sgPqObZHig3+fTd?=
 =?us-ascii?Q?s/OxDImPeLlT8vHPNp0n8uAFYfnfP6Rucok01eJVDKV0PfWmGPVyNuOLHM2y?=
 =?us-ascii?Q?tBYPpDesCZRTYCGyZsFKAbwmaucQSdnur14lSSWJsYE/NHjO7E7No+1auxgt?=
 =?us-ascii?Q?8GcgG2+JzZGhdgT7SsKLJn00trqTCNJJIsZTYDBNi9CUpFJhK3vPF7Q9pntb?=
 =?us-ascii?Q?ZDFOSd50YaZXSvaxdMGcm18CbiytBYU2cC2irsMPOaVQLaLrWp9YInEZ4GTq?=
 =?us-ascii?Q?xkmGhWgsigN4ZvGS/JeVaJ2inwuYud3rI9e/giXICpDHtSZs/CX5xwwapF7p?=
 =?us-ascii?Q?ygDMhhSguj9iP+1KFbHrwRoTCl1dCBDvaQwBKTNdWbXqAu47r3okl3ZDNI1J?=
 =?us-ascii?Q?YZZ/Q5mA+ipBj6F00AsAI8QZE8bpxSpGV3zI9XYuYR/1p3nzV3HztNRle2VN?=
 =?us-ascii?Q?+wtUGjlhl9KtiwSpBSGs8FNpajMjjzJ38Y3zMlsmUE1PgKb2zvB5ENt6pziD?=
 =?us-ascii?Q?wXo5sQ8HJ3vGZMvMW1MFgnGL3CvI+oA81ITlxK3uGEldInw0x2UbbbLpi35a?=
 =?us-ascii?Q?1vW12ZL/iwyMrnyLwVA3GWBDo3IEHFWy+a20IMdW932nz40PEALaw7EGMpyK?=
 =?us-ascii?Q?EJr25+9o+yMVsT82rRKb4jCR0B1ylDtzGC4EbCly8leUw1N3EAWq6sTWUPQk?=
 =?us-ascii?Q?rCg/YOQEygxvFeHV1CqhgUJnx/4aqLgRNDSH7k6nc7FV+VRCXXIXD8qVSZms?=
 =?us-ascii?Q?LHS0ABMxjHuwbhV9vAU+uPsWR/KuRYL/6KrLv5kKbhZ3re8fVDVGVI+jdTXs?=
 =?us-ascii?Q?1XmdL7i4xWB+a7xCcLEMeM/ulLzH/dvszlm42ONWfq8oLq1AC9txp44jVm9o?=
 =?us-ascii?Q?IWoFqhbm6Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc972f63-50b3-486f-2cf8-08dee3fbeb47
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 12:07:05.7889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r90JowSTqpxpN2ukZSdLfkLHMuFkq4OK9Icz7ZcsLGChsKLSFNs/ZdhNMp32zZ/DFOB8VCnh11yPDrtLxmz+MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7645

From: Vladimir Oltean <vladimir.oltean@nxp.com>

Describe the Lynx 10G SerDes block and its 4 SerDes lanes found on the
LS1028A SoC. The node is left disabled at the SoC level; board DTs will
be expected to enable it once the consumer Ethernet nodes use it.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v3:
- None

Changes in v2:
- Change the size of the region to 0x2000
---
 .../arm64/boot/dts/freescale/fsl-ls1028a.dtsi | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
index f4ba3d16ab86..ef62968590fa 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
@@ -250,6 +250,35 @@ ls1028a_uid: unique-id@1c {
 			};
 		};
 
+		serdes: phy@1ea0000 {
+			compatible = "fsl,ls1028a-serdes";
+			reg = <0x00 0x1ea0000 0x0 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#phy-cells = <1>;
+			status = "disabled";
+
+			serdes_lane_a: phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+
+			serdes_lane_b: phy@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+			};
+
+			serdes_lane_c: phy@2 {
+				reg = <2>;
+				#phy-cells = <0>;
+			};
+
+			serdes_lane_d: phy@3 {
+				reg = <3>;
+				#phy-cells = <0>;
+			};
+		};
+
 		scfg: syscon@1fc0000 {
 			compatible = "fsl,ls1028a-scfg", "syscon";
 			reg = <0x0 0x1fc0000 0x0 0x10000>;
-- 
2.25.1

