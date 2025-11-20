Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011030.outbound.protection.outlook.com [52.101.70.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F302EFD86
	for <imx@lists.linux.dev>; Thu, 20 Nov 2025 21:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763675650; cv=fail; b=Pw5IlYgmATmzOMutrlaV3kUtpprJVT2GwUB6q/rksRhwKl45MoQmQoDbbVzEfsVCv+fDuynyH58t0kxLxXy/nQ3KQix4nFXIGViW2ahGg8qFkfPdeEo0BJAjUgScn7fraS1HDPjlQTlFzklBNnGvx1x+QvddUoBC8gJ6v3xLaSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763675650; c=relaxed/simple;
	bh=u8YQ3xnWAldbvB7OPesv79RXOFCOv56MDzGD+SEZCsE=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=jPVlQPCAepcxUCfHmj2yCXizi4NYRJ9tHINsCAxGfIgLx80Lk5nP4CWw3dXVuYSC9hTVrdQ+fe+dbYp9SWKMQ0b+76ijOYJ2BTA3SweKNo1jdcb2YQU1W21FhcXbMCM+IRClf2jZ4g1v0q7onFhD2lmQtdqy8uesghuLdbdSAnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MicLmE+w; arc=fail smtp.client-ip=52.101.70.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MicLmE+w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BUBe7NTMzsWJuxnXVfOKFRghoI8RuAe8p93HcFFAw3455G32w7Xu+1etnGqYtWBUe21Rg4gRHlvfoC4kYRhYSRjK4yb2pCIqgwDnc8+3SyKXnqdTNdldqw0oelQ3qZbAks6vGWko0wCfW8pC7/c21bERiQoZtDMHV5jG2QgP43nLxyTg5Ry8ZNc9oXgfr7r+KVVOSBDtcmwG0Xf8iPiijYMtQlFu1FzrXfhAb2CgE6JVk5qT8Ht6OxqZ+nTmC6mE198NVYBffC6raptDSiEAkm04FpYtWVQcF0M1RlZu5QM+WwNzPHEaE5wOwCLWScU6S7q3E517A7TvMmLtLkP/rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uzoiyMqG4wBdXF6UicjYvhkzsI5avv2EYijMGIMWnDQ=;
 b=ULPEvTwv/8j971+ROIFwIcIfyLaz1yzoJhspuj+M//iicaueV/ljppKwZJcjLwFh3LQd6hZItJRWGoTfvckVLzf87CLWP0Yh7cMrm9StZwhbW9AkORA3RwOMl3d7yPyUdin7CORjXMG0Z1LOtiiQMWGD8KwVctJ8AmXOyt6ipR8Xl+v7XcS4Z9Wco0ClgNl2rzWI23Be9T5a2Y/cc1rTYl1mAe3Ze9oEyNcsdyQO++p2POcGQhZnWPzO4aIUuROCkn+VjHD97cYqgzSdQQeNDW3KFDkaMjzwKV8MuOjCDjg9UwfG8NIx2ukZUxbbPcP+x3SkgjSrKbdE3ZNyuY2zQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uzoiyMqG4wBdXF6UicjYvhkzsI5avv2EYijMGIMWnDQ=;
 b=MicLmE+wTlKoSXHxQ9hCkvy5VXngibkzAMi4D+1ud+fNQEzEDIzK35BxBdPocVDnGOSy4Pnsqa79gX9rkyYnfb7oWm77orxyK4U0efcZ/Uj8rDSfJu83jvuFoS0AkikT73zxn/IIU7WGi8s2CevTJioAuhRVVgI7tnA5iBDSIh+woqwVubDpnQaJ8gZ8PlK6/FZgeZYS097rgZN6qTh2o+ledfLn1ygJgi7cZ0IHIxQ1mLtyq/JwYZ4NWT8m/ACc6qSYx4MMS2kpZcyLRMkPxFIN1eFCcknQD40G1+QyZKOC9zNyGovEReeod7HXQb7FB126baa/adI0YY0VW5D6eQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by GVXPR04MB10972.eurprd04.prod.outlook.com (2603:10a6:150:224::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Thu, 20 Nov
 2025 21:54:04 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::55ef:fa41:b021:b5dd%4]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 21:54:04 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] arm64: dts: imx8qxp-mek: Add sensors under i2c1 bus
Date: Thu, 20 Nov 2025 16:53:50 -0500
Message-Id: <20251120215350.352117-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN6PR01CA0015.prod.exchangelabs.com (2603:10b6:805:b6::28)
 To DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|GVXPR04MB10972:EE_
X-MS-Office365-Filtering-Correlation-Id: 979d4dcb-3614-47e4-de59-08de287f525b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|52116014|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tYO3QzM4WL1NqJaD0BnNvbemC821VShwDu3BsV4qRJuAyK8cXbtZbDTKoJI0?=
 =?us-ascii?Q?V43lD8l9OZrz92rJBeZDq3zcVJ6EU5dFJweBje0Nt901kzdXIgJEtWg4WZOa?=
 =?us-ascii?Q?Hxr2CjSZbhvrgPvhKqf0+wVORqLM8Nuu/NOybtBSsRSrVoo5cKlO7ukRRIpM?=
 =?us-ascii?Q?4ennERp0o84C10TiUqhZ3zQaECy70Fe0c2lZPrFSIXIFjTN6zKpiOZOaZh6d?=
 =?us-ascii?Q?5vPppx03osARna+qpOFL9kup5OzVKGaY79Z8N5QGRYfJsCgjzik25FP+Vnld?=
 =?us-ascii?Q?0tl2WADBIQjmb3cRgBl7lrtl0PMgKklrZLRBL88ZlpnHPXiV4wwDdrBgZzbD?=
 =?us-ascii?Q?5q5nPwWPRT4gbIUJ1FaGXTDvJjBp6IDdejAnBnJPadEURJI+bFqU6JtE5f3E?=
 =?us-ascii?Q?OD8sbayKGELXhURMxxw4o7Y12u7uHJySHI/0S+h/KjnEpCKXW714WZa4w+/H?=
 =?us-ascii?Q?wcIaQFzuG820sSFM3tGAhT7zyeUJwNeAe/at1JkpFHveuNx7YozboDOqESj/?=
 =?us-ascii?Q?UZb9OxRWY3Buxqo9dOVBUkwy/BoLo8KIWI32lKnrVVAWnDfF22owcfsmfXHM?=
 =?us-ascii?Q?RB6NSvOZ0h/vL0TacimRFcMT3sGaJHEMFo7RIOetmhTKdvxw04nHjl66p200?=
 =?us-ascii?Q?HH04B97Y4SgQYyaSDLwn2lhWzCz6O1mfk2kO6Z0H2oqfgFFNxmWFPqgMMDhL?=
 =?us-ascii?Q?QmF6zrUW8LwdcXg789cBBCSMueE/HSIifKb5CSga0ecdx9uSpf1TwpGsJwsC?=
 =?us-ascii?Q?4tVKvkPHIUqnXM2bbwEsEDadGr5EkfudvDq+KriwdS6m5rILgzEgiGJbOW0U?=
 =?us-ascii?Q?fUxCzyolwM+5lk/Lq33BOEDRM2qPF0vscDbCitVRvwR7CSEwukevd3gX38jc?=
 =?us-ascii?Q?2sYekYhsxEcJInnruXeXgegbLcoyegFZnP8TSA0q3Gnd7xVp6+HD3Bb1GAeJ?=
 =?us-ascii?Q?/9lBD0WQA0vEJ6bEA8BFNNJ1vsqd85pA+oZmSi2jDchEf9IdLVZRDzv3HMX+?=
 =?us-ascii?Q?PlwRthOyJhXrxLNDw9b3gNE26dUomCHfLL+TtdTQT3H5+B42T9RFuBdJTCtt?=
 =?us-ascii?Q?GieoqAc08iJZypS/1vx4rbl8+I+0uPdEIVkynY118b4eJs2TaZ+oDs5lAv+6?=
 =?us-ascii?Q?FW876kSWUuZBPcCwQs9phG1Du294pmWkPLe68tFyNM8eNKmOQ9XLf6uyb3Ni?=
 =?us-ascii?Q?JUxhz9ePEG4M9tuexeufBPjhOXib4cIZ9VWBZSWP+Rdd780IedZxZjWx/CGF?=
 =?us-ascii?Q?WPDw5dV8NLXuhLEcBYCTbjCYKyW/dMUhGVdnMZd0cGnJd7DwCe4H2hNVXFkc?=
 =?us-ascii?Q?/ZWYc6LZRDKftyF7c5Mj/ZaX9yTf9d77iOUzhhcwwbslB6ZEQlag3so0uPhY?=
 =?us-ascii?Q?uuuo4AM91awrGdxDIxk7vCqvVOYxcjBgxfP7My0kE3mGiOVgkobQdUci2Qt2?=
 =?us-ascii?Q?U3AVTBfcH6mKGU8T4oK5mlKBjZKcpeuBO5/9WwLQe94BNmih2oYVYtQByklB?=
 =?us-ascii?Q?jUpKnvdrmloUURzRcrsMEIPPB/4is52jF4NdbnJr/pLOTkjze/kjgKhjxQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(52116014)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Q/51uEHkL/HpzqrM9gDt879gUNUH8ZlPSnmSsFxQZGzunx02oqULkjxTk8a2?=
 =?us-ascii?Q?KB2GtLw4/EenIqs5WxoktIeEc/Ofd0UUlZkw4LhiuQZGDsEXQVkYenwV8OKR?=
 =?us-ascii?Q?nby3L2xqXuDWFWSzmqYSIE/VerIrNiAhvLUVEEUMvuOrEgmhuk0YENLdCRq+?=
 =?us-ascii?Q?u3NR7iRFa65RLRUdCOPa/4Vpjk3WRpuvAyYLt4gw2bwhlfaD8JgmZx4wg94m?=
 =?us-ascii?Q?WUv4PgDULrIYhIOlYkX/azrGKvjdFzFQ7ZbSXjBNufTYCXfDH+E/LiHGnKpa?=
 =?us-ascii?Q?YmQ/hYJI6PqS+BLG/aalFau8HLjWW29XrFOoshfzbuOjYB2sqiTJBZDvhUdV?=
 =?us-ascii?Q?fFnRKR8uZVvOk8orshxxnAVX3VKHbDlI5U/YMt0mhpI50LA43qpl+GD44+a0?=
 =?us-ascii?Q?VSswLy4OEr6178QJA6pFSFX6SJYLi8oHdiNqYoXTDMkGBB6vHzanhf0sX7PE?=
 =?us-ascii?Q?QOw3BoQ7q6P4QgD3nKN1bymU28nUETBvu5GZLE8x41lLQK76miHPM05pc9PK?=
 =?us-ascii?Q?9zKVDKY3Ikvup0yu3Rqms4f8NW3ILBdqZ1k6G3fmsGhkC2d2VXsUzLDzbM4P?=
 =?us-ascii?Q?VgpQMQohFE4Ve9K8i2xw1aRwMlB6Vm09Oah76Ih4Uj16H30VHe0Jxpag9i6W?=
 =?us-ascii?Q?ONWo5irVuFqJTIvcUQEAnb0Y2GaaPEteLnH7Qn2ssQWO4eSJXNGuxKlw9kl4?=
 =?us-ascii?Q?8khpovJFte7dIBM+dSC0019X4y9icK1G357HCnxoZUAHolpvuwnpHHnZSqat?=
 =?us-ascii?Q?ADw8wxfmd9QO6BlVd/3MzU7nqWtHnGzXtsLYP5Itgvkc9cEyf4kPiHbxZHmW?=
 =?us-ascii?Q?U9TYMs8x2254PXrvRtVLLmmFe54vElVjRH+yvgWKU/L0vkOeAhaLc+bG27nB?=
 =?us-ascii?Q?tiYR1mZWpK7j2ONASl6oQgyBSmattKerG56pAabur16EOF7CW1RoYJT2Zjb+?=
 =?us-ascii?Q?C+xrC8PXtxHOgXdw55uehvpaBmN0Q/FFIS2QxyHhgZ2VfK23NZztk70UIXdd?=
 =?us-ascii?Q?oCgaKaR4UzcpoUahNr2tuhuhwrtBDwv242Wzn146tRCExGkY8/Cp2dpoAnn+?=
 =?us-ascii?Q?J/779mw1URgWi9J4pIAfN0HkC2Qg+x3WYf1FGeMQkouTIikOVorieZMId3Br?=
 =?us-ascii?Q?FhkH3DQ+0lH3TUK9n8teqbUFXo5zvSJ5MFQ68Cpfu+F35nIo1U+yFcCEy+SP?=
 =?us-ascii?Q?AS1D7PtP3idY/ObDfUSfy9xfviFS5JkKTYmNafbmO+SLZJ138t4znjAvVvmK?=
 =?us-ascii?Q?0cVR3nB4qKmnG1ikCfw8A6y3ogSfcLnvJma6MqdWDosQYz1xIAX5g0zjuVNb?=
 =?us-ascii?Q?c8bEKkFpVgBrvIYzD74HUlYJ2jblR96apb37ytf5Gr8VIzTna/4gSV8XB5Zz?=
 =?us-ascii?Q?dBBgb4LxNcdRL3sd+mAg/O7+6LJ7DSsUNDo9Tu4JMm1oidSzVEFAw4067sb0?=
 =?us-ascii?Q?VyzxP56DswDwWSaAE6TrpRpXtEl8nzM4Dzbl3lGIeQQ8ThAVvKc/djruar6D?=
 =?us-ascii?Q?1JsKWR4kli3W8vaz2qqqWAX/PDmPcK625Dk6LT8NJxV2bhNzXRO9e9c9L9CF?=
 =?us-ascii?Q?fobTVoX9TwM2kLiMEbA=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 979d4dcb-3614-47e4-de59-08de287f525b
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 21:54:04.4434
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wYJAMlT8BSd2sU14I5sYfv1inlLzZeZ4kbS2Ah7TfZQfObFyRDf+rrigAfuDobR6zcPBRYPVkhdkh3myGltwzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10972

Add sensors under i2c1 bus.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- keep order as address
---
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index 523f48896b6b8..50a97c0297c72 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -485,12 +485,38 @@ i2c@2 {
 			#size-cells = <0>;
 			reg = <2>;
 
+			accelerometer@1e {
+				compatible = "nxp,fxos8700";
+				reg = <0x1e>;
+			};
+
+			gyroscope@21 {
+				compatible = "nxp,fxas21002c";
+				reg = <0x21>;
+			};
+
 			pressure-sensor@60 {
 				compatible = "fsl,mpl3115";
 				reg = <0x60>;
 				vdd-supply = <&reg_3v3>;
 				vddio-supply = <&reg_3v3>;
 			};
+
+			/* Ref SCH-54536 */
+			inertial-meter@68 {
+				compatible = "invensense,icm20602";
+				reg = <0x68>;
+			};
+
+			inertial-meter@69 {
+				compatible = "invensense,iam20380";
+				reg = <0x69>;
+			};
+
+			pressure-sensor@77 {
+				compatible = "meas,ms5611";
+				reg = <0x77>;
+			};
 		};
 
 		i2c@3 {
@@ -520,6 +546,12 @@ light-sensor@44 {
 				interrupt-parent = <&lsio_gpio1>;
 				interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
 			};
+
+			/* Ref SCH-54536 */
+			light-sensort@60 {
+				compatible = "vishay,vcnl4035";
+				reg = <0x60>;
+			};
 		};
 	};
 
-- 
2.34.1

