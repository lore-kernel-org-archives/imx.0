Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011004.outbound.protection.outlook.com [52.101.70.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1586F3FBEC4
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 12:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784290040; cv=fail; b=C9VcxfJ7HYSH9VpSmQ07lR0vsVqJomEgkxy4eaLP7pHaht1u9nuUOeSmhv/0E85VceS38koWwB3dD56MtggmumIYhkFE6cQX9yTDkD5BpAW23kRBlk0X2Fd0Nz1lOh+0dwFOymJ7lZQwRx1iGgLm61xwB0W40+5/DEi0WTh0BZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784290040; c=relaxed/simple;
	bh=nn791W721i3vt2+jIdukfv1VSRwGBXnkZO174K+onO4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A9Wi4TR2KKXisAoXvrwRPHFlE6tgSOm1zsAQIbNCV4CWYBK1fnDfZYkGy9KdpRH0gVKV4lyCv3W6Un0vDDo+7OOlGnDDpSghvqaWC7ehb6UAEdSmtmYq77MtGePIkP66SSNTAGv9lQi+IBwiI0jbOCZv2E1fcK5tmzOF0/Za1uA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YDcbduHz; arc=fail smtp.client-ip=52.101.70.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YDcbduHz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AwATj1PrF4so0b7r6zuO9/2Ylbxy2jVpBonPl8kxBFCApi1ilqBr8qBw2NXeAPhh8g8XsvR59oag3h2bKkLB0udpK0502+zzVIRu8UdgQUtAP5br/vPGTH5S/bEhD3oJJrjDqQkfUbjR/EVFqTcAI2wd6wGVrEBoq1Vioa/xPagzu50MLTQy1QBdcyB/kFZ/oJYNdKXb8vdGufce+qGYEK6Y4b+Pu23MBoRvk5LFpuYM01SPGq7kYoJ0wDOFhVifnBSLlAwKQkW0kJGYx2pI/r65OHcefYpEYjl0BdSd2DoAow52cIgokATHHekFxGnFeiTe5ZR7Yu7Ut2mj450KsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qY74PMr7Ej8FS7JKC+pqz56p2bf6PRAl30xrHdHTtFY=;
 b=QsDTwrvQRBB+5v+qI+C0ItrUeeaxYBWnBczYioN44FM9pQKW1tuRfNk90C0y/JJDrRwJYeeEp21GLShATl1RwJj3wUNFBhtbHn0h4GPvMO7whNOVfh0sbjTrKNtUYYR6MYglJmXEhqi9mJMd4Z9DrRnTbcWnDtY+yMoU6CLL1++u5YXFr3NrHTmsOnl4vYLSz8wSoVn0LuI6BSvGBP+OUiLa7PLddB77AVOjsp1iq1t7dDjK2e4O5qODKzXWKl1++I1aCtbn8y4sknBauuaOzLu4N/oyQQKjKMMlTl5TZQEBolufOpId05HlAsgNSIM22S2nC4cw00axnAddh0qYkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qY74PMr7Ej8FS7JKC+pqz56p2bf6PRAl30xrHdHTtFY=;
 b=YDcbduHzfWxHNaUbV0ym2wJbqAohdC5N460xtv9qGaaStltK0cpToGYxHls3V1zctrFjkxF06xWRcdJhAIhF5EhOYDm/BdyNkiOt9aK3yYhFmfnOmyaiDKaAwTSTMoZRdCU7nWAWQ8ZQpOu3FCvz/b/rDvGEkr1SvMySilx9SYmEgSI9D+A3vxRTAviFTW3FhV+S1CpowilYdWBc/FIAqCkZ0DrV0HPU1j2fTuAi81tmEqwOxta3hqZ2qZwdUu8QEaAviq0LB1Qmi3P19A5fP0Brvwr5+FzkMTM0E9SBcZv44p0+m+IdpBImGDfmm7K1eUp3sIsCVPgx/B2IPzt+aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13) by GV2PR04MB11863.eurprd04.prod.outlook.com
 (2603:10a6:150:2f9::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.10; Fri, 17 Jul
 2026 12:07:13 +0000
Received: from GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd]) by GVXPR04MB12290.eurprd04.prod.outlook.com
 ([fe80::1739:3404:2175:33dd%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 12:07:13 +0000
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
Subject: [PATCH v3 11/11] arm64: dts: ls1088a: describe the Lynx 10G SerDes blocks
Date: Fri, 17 Jul 2026 15:06:35 +0300
Message-Id: <20260717120635.2118610-12-ioana.ciornei@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717120635.2118610-1-ioana.ciornei@nxp.com>
References: <20260717120635.2118610-1-ioana.ciornei@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0269.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::16) To GVXPR04MB12290.eurprd04.prod.outlook.com
 (2603:10a6:150:319::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12290:EE_|GV2PR04MB11863:EE_
X-MS-Office365-Filtering-Correlation-Id: 033129fa-381f-4f19-444c-08dee3fbefc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|1800799024|23010399003|366016|10067099003|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	xmqUfHIzRs8nVK/byV+2SFrQdigP+uxMvHVNU+GvWUHkEVByWlsLJU9s7ewQFETGjoqr081Na9Th3X1sjAfkqo9ON4vxP31mt0IaB2wRZWU3KxIPJ3NtE1zWSbtmLqhLlOQbAs1SL+WtF7vhUyuVXB4VXiJ5UWCkWJpwobnodxVTmFS+qRrNk/IMuCmjlGvc6sHkl4SSDmuLkM0yHZYH6hh59e1W9/6npcTaUDCUoc7QFrMRd8MHsKxfGPYU4iiJJn8KiNgVSitO+6PbzVngDzZO0ZhwprkVV1yuSQwVcSA9yaPbIiH2yEyE4qElhHWkhg4jJIJeCbqdEnrvLzsfH9XsN8Exze1eKgJgl4mKK6B6QqwgSd8cQDXtbBQmjtJ4936fxkuKl156vNK3Kh0EL5mb3BaYDrm51kw8NKoNI9PVIzRI5rUHI/o545FROX2azM/L/xH9lwW/xa2/2vFoZViO1kPfcqL+zvJpneCuGdgxGuA5PaDhPjNnwQXBf51lMRA+/deWHqKvTjoYC3tDAGzDBMa0HrEdVgFw8hATzSS8GRFNqmJdPDrV8c1hg0VKhu1ilaxuhU5aTivJUuouebqFLF3SahnfNbGLKYr2aXP9WoJIxQzaBRQPOi51VuWCS4eLEmn+C5v6mEwBSLR5K9Ys41xCHVsFciEt7x/+VVU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12290.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(1800799024)(23010399003)(366016)(10067099003)(56012099006)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?T4WhKTfiC4cHMElMZHXU2NKdLspywThGVwtNJ3pzWen2DPgIT6S9Oepfr8GD?=
 =?us-ascii?Q?D9B7x49PJAyWPdjXFDqSYcyYqq+PUP/zzL1mj8xezkm71OTXnGcEPVagiAW3?=
 =?us-ascii?Q?D1OWisoLYx32M962QSh+pe2/sCe8BiqvnRrDr/g/Ih6SfDlI/ztZSaYw5H+E?=
 =?us-ascii?Q?Y/Wlo4/AKjRm6Iyn+Ua1Q3uorf8C8A9yE2NQX0UFP5N7v9gDVtS8Z9UIptwp?=
 =?us-ascii?Q?Ti/hAWzZ2gk5FBcPyWS5Lq2eIiu+ABALyRzBxuh2qVw1jXijFdRQvPWv75Hb?=
 =?us-ascii?Q?9N6rnd+U7dvDC8y65MamwJ96OJO5gVjUS1Icvd6LWlftdx877CFvE1CyLbWn?=
 =?us-ascii?Q?+cyS+xb/YmLp5oTKK6j/nFMu5W2krlwxJMTd0+pcDr2omPAmTNIsciK5pwS5?=
 =?us-ascii?Q?gX0z0x5rikwmrVMPc3KzlOTNb1ExnkZ81ccccogD36456hc7WVlWkBtpN0Di?=
 =?us-ascii?Q?twXhUzJZ/gPbRKeviyui6DAWYjhRHFm/yZpaZfoLmsF6GkZ5jB7bQLbZOFQO?=
 =?us-ascii?Q?SqRaHIoAGoTqQhV9inQBQh4TpeC3HWkkrxWp2A1vTY6JAN3rUA3cBCx08Mqu?=
 =?us-ascii?Q?vlir0eW8aJWbupUeWpB70N3ylKdtP9tEe2FdOiNaU/sAXVWHbJvHZSnBAe1x?=
 =?us-ascii?Q?CKzsq2GP1ZJhtyxcmnCq6d+620H90Y6yvcIHywBctDW83qbPr2XOmN7rXRYe?=
 =?us-ascii?Q?xrNaoMbVkPLStJSHriIGbJIYCwXoNjx/YNuNYJQPJHdOBydZVHYEdjSVab7s?=
 =?us-ascii?Q?RUPTQzTnrjoao5gObXTqiQOpD9NakRqLi1fqgr4GkScR84/29Y/Ku+KnNmW8?=
 =?us-ascii?Q?VE2OaJpO8FCMZvIlhvDltWt9rfx8c/sakhEr1S/3O5P+5Hoxf0W0sRDDSxd6?=
 =?us-ascii?Q?bcoQjZd9ffkQ87MhhUHzsAeyVuLfPATVicqWfryJeZEzwHPBX4wyJXNYHh6A?=
 =?us-ascii?Q?dcOZB3+/qcsE1BzzRpO6bBj+KLqWiGV1jvPzY7cRyD0zdt/KaK6mZnK+4t21?=
 =?us-ascii?Q?GUimLdUPW8IoIp/DTdhgXbrNbLf3v6yYUa+ysekEyAzctAFvTDsaTCwGKxs1?=
 =?us-ascii?Q?DImftT5QhriR/6fkgGU0laFhSZsxjPx0R++SXCmqye6lkjQdDR6KFyKbGBPY?=
 =?us-ascii?Q?WTJCcKb82HGV1mKDbEGj0Ba82kqySHTupKpGtwMhRKA1V+KMXAIq78wTdEHP?=
 =?us-ascii?Q?rFNbrjJux5NzJyyW6TdH7W73lDizM+TkeHVNnuBBZoPb2ACJN8Pvz0ZWD3ey?=
 =?us-ascii?Q?WTDHzOE+XnI3Ht3aYUqCJqBhAadCoOmC7gx9qKMK+a7DaWmD3eVLCJ0Gs5Ci?=
 =?us-ascii?Q?TMAAgcYjT7bG+Un5IcmPWDM0yWeQVLXMukjaTPjwc0BL3R/1unJsJxAryoaA?=
 =?us-ascii?Q?HQ4+L08+HHFomJHG47wWgJKLrO5SUhw4BRQrTCfTIKyNzBj6CpN4NBg+Lw79?=
 =?us-ascii?Q?s5O1Q6qx/jXATjgKR+CD/Q3yTi86+yRC1KGkSqSiwmtW3OlJWWgzqRq7SM8P?=
 =?us-ascii?Q?DLpVuBJG4O3RKS2Ax1lNqzeXLpKZ5VWwqThFtY71K4VUnPt6368zUnT4KsVe?=
 =?us-ascii?Q?r8vWoYIb23hRFBDjg8trXjeV/v/+CXcCRramtrEi6WDAl2nFX0cjFq0fekME?=
 =?us-ascii?Q?JvAdMEIYKXt1uNVYO/wekpU+mIjxCTePt243bqneijPcaHFCHGBbCOWMCV9G?=
 =?us-ascii?Q?5uepgsbXm0dfbWMant1WA3xObmeamOKhn2dPuXXS6ZaXj3uJegChHS5cmYly?=
 =?us-ascii?Q?Xe2LK0Xtaw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 033129fa-381f-4f19-444c-08dee3fbefc9
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12290.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 12:07:13.4636
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3LV87vBWbiBk6MBlRL8bQgBBPJ5eF0JYVztP951WDW/NMNSQT7ZBG92XQk2+QALpJSmj5nIwR/cWm4s0NF/hqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11863

Describe the two Lynx 10G SerDes blocks and their associated lanes found
on the LS1088A SoC. The nodes are left disabled at the SoC level; board
DTs will enable them once there are consumers.

Note that the SerDes block #2 is non-networking, meaning that it will
not get probed by the Lynx10G SerDes PHY driver and it's only added for
a complete hardware description.

Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
Changes in v3:
- None

Changes in v2:
- Change the size of the region to 0x2000
---
 .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index 99016768b73f..e02f34329988 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -239,6 +239,64 @@ reset: syscon@1e60000 {
 			reg = <0x0 0x1e60000 0x0 0x10000>;
 		};
 
+		serdes1: phy@1ea0000 {
+			compatible = "fsl,ls1088a-serdes1";
+			reg = <0x00 0x1ea0000 0x0 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#phy-cells = <1>;
+			status = "disabled";
+
+			serdes1_lane_a: phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_b: phy@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_c: phy@2 {
+				reg = <2>;
+				#phy-cells = <0>;
+			};
+
+			serdes1_lane_d: phy@3 {
+				reg = <3>;
+				#phy-cells = <0>;
+			};
+		};
+
+		serdes2: phy@1eb0000 {
+			compatible = "fsl,ls1088a-serdes2";
+			reg = <0x00 0x1eb0000 0x0 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#phy-cells = <1>;
+			status = "disabled";
+
+			serdes2_lane_a: phy@0 {
+				reg = <0>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_b: phy@1 {
+				reg = <1>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_c: phy@2 {
+				reg = <2>;
+				#phy-cells = <0>;
+			};
+
+			serdes2_lane_d: phy@3 {
+				reg = <3>;
+				#phy-cells = <0>;
+			};
+		};
+
 		isc: syscon@1f70000 {
 			compatible = "fsl,ls1088a-isc", "syscon";
 			reg = <0x0 0x1f70000 0x0 0x10000>;
-- 
2.25.1

