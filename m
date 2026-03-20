Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011048.outbound.protection.outlook.com [40.107.130.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B673AD530
	for <imx@lists.linux.dev>; Fri, 20 Mar 2026 12:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774009603; cv=fail; b=W9xBH2IqVu3dTSN+Kp/bRohZ/miVt6SBiGy1NUqMUcfuozbIwjHcp0kiHLdhhenL9chS4xBb7BOVXMuuLAsiqZaimRlDm1bfaO0yIUyW2L29+wYSrTe26FHa8U2qo5kCU42+Si00+iFbOMt92qhliawVcUDpLMxeDPGrnZIfWkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774009603; c=relaxed/simple;
	bh=dVi3gDdHuJ8gTdG5nonJDjUYUD8bvQfRXhVfYI2+tTA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=C1WXqbcnczpBzvy2tm2I4fCOdAHHfCW/cVr7zJUiywZu/a5MqezhjvP73G2n5UzZAOAt7pwmSH9kq7M1n3lNC4nmj9VOM1GQLe9gnVkRcFojgos3Tp6408cYi8YfC1JrfnXmtdnbJ4Ag2IGQC6ZQw/sJl+38uHMbbhMHOusRSJk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=XhsGdQ40; arc=fail smtp.client-ip=40.107.130.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="XhsGdQ40"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sihs4G2Cfp+B07dXe3iwIzYJoJ1vXhcY+fvRtVEugynW1k4vzjFgSCfDDCY/57rAUYMU5AktZXKynHgXSzccLgz6JhEfcjKohYrP2FK5LgqIdX1ZhoiiN8eQtwSvRpCph1QzCh2ay+2MGgGF8xRj8oa9i6ld2xhGiZw4wj0gekKGvylgrtkV/oq7vsInY8wbFO1n5pqAm9Em9+YzNx2Gf9n9LD+unAXwmIELYz2C8mAv0zLhn4jl8O3hsMl9jO6NA3/S4Q4MmW+/kKRiFmgpyEXSpHItqxcEox2rV19hz168MHUYPV6I8cykwnrVqUM+eUSfO5lI91XmTiN0SWvZSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Nc6E3mG+rE1fvszz9FScqbUbxTNzNN9C9yLN7nYMkQ=;
 b=CGaJvgWHnMd+WJ1dxpcVQAJUfR9MYIZfgMG7eDWDM2PCwhiQwj+gCy79TPdvKviDrGKicyOHiyKJ5w30k2/UpgcJXamJocMX8NSracQBFUd0rZkefxJqSlY3ZMn3DjqasNp38z1BtSFefBmF2XbaVT0jPRbbgl+DNIL7T/Tg0HZ2/JQ4oEvHBFfRfEVHCMrdE6U/hHg68fJDQIepYFgOs+mewba7zeY1dCNXsPxv4F6CrmXgoMYqrslWM/PUp2rN0qhwp1VgMq3PO1OvqneuEIzeJMWcHW7tdgOW/7pPIhxGv0PdwLC7LwDKwSH0Y9VIPfMD2gMEXiQ1NaWWXF8r0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Nc6E3mG+rE1fvszz9FScqbUbxTNzNN9C9yLN7nYMkQ=;
 b=XhsGdQ40ntHXNoJdZwsd092hBzglLe6v+I4M5Tp4I5IZ4LimVPB/XjrOOxI05nnJZtliHr8QPL7IjCSa3V4P2ehLCb9EtJ+wI2AWJ+fio/EsHXlgq+45XqLgsZIteR4WsLSy7nHjpIqNjCDzUc/i8P3NiqdI6WZ3HS7JQ0JSmvo0nAsauPiUsvh1THQK8slyjBfxXS1s8dICLyDsCLgiFhxbRZYrkCtWcWzydsGGnDHC2/IHRA+VX+6apxbwtOamKqAoHvGtAt2ZV74SyoqfWjHuKm97odwoIUc5VcKEnLu0rEgaArmErv/GdPEk89YdOpOZTULRFqXe5y9UBgl1lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA6PR04MB11869.eurprd04.prod.outlook.com (2603:10a6:102:518::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.27; Fri, 20 Mar
 2026 12:26:38 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.018; Fri, 20 Mar 2026
 12:26:34 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 20 Mar 2026 20:27:52 +0800
Subject: [PATCH v2 4/7] arm64: dts: imx943: Add thermal support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-imx943-dts-v1-v2-4-e6eba6b3a837@nxp.com>
References: <20260320-imx943-dts-v1-v2-0-e6eba6b3a837@nxp.com>
In-Reply-To: <20260320-imx943-dts-v1-v2-0-e6eba6b3a837@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Joy Zou <joy.zou@nxp.com>
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
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA6PR04MB11869:EE_
X-MS-Office365-Filtering-Correlation-Id: 1102daad-f8d6-468d-6024-08de867becdc
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|52116014|1800799024|7416014|18002099003|22082099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	ssnS2aaUH/a3t/7998oUtQsG/GUXWzQECBz+/vOveQbSEPAnMOfMHE4OtULP31dCvK3VOQY5urqCbo9R92ldWnuFukhIOocF/ESWl1MsKIt8FBhk2AB/JfeRzl9tw0uiTyHCJJXFudNs2ycass8EINk+HVhxyaShTslHoWbihx6PtGfi95LSL9m6Igl1gJTVqGUOevTNqJQHbreVawu6rIgFKSlbbxwusH5ef2RDz0nUHOzSO1ojJsbQXRpHOJr1yBACQjQmLs9p3M8kic7fLlQT/HFtIwjKpFElFwNf4EyWu2J1ulQTJqxLt78mYxwIrLGScaGHJBxG1/U+pTmst2ijD7wGAb+w0dt+edazGK9KqDH5N61wWnOrn40VbsO7c6q5U2rNjiIGf5jET2PP6EcO8AgRZrd3jqAzyna6gezXOX8o8Z0aIBTfxZC7twpGbxMLaIeGhIQjprYiyOtcH2K7tBXWcaD79vV3BWaTNKX3mgO3mfI1o1D2Y0CKPRd2slg/fImL+FPx9+AI2QcQWuTkgiooPhLYi21NR6QgISv6LGjBQLf1TvPs818+5s9cGYmRMiDHlzCZy/gbCpPsYFkstM9dnwgVP3sy7ZhwEDNJVQlmIX52uo9TRnUZBgP8+1r4NkxpIv1gI6NcTd9402qqZfeyEiI2Tz3rEwl2JFgAkkyJqTjpzh7hob4wbmUf4RXq+pTa3eLW9oXU7dCnIVMfNNoaplkfCsenzAIpUAZ9L1PbdVwH0fzZdWSEX3yN+yRxgb/bOp4pdYR5GTP6kjEXI5iJVStmZBOip+XsE0A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(52116014)(1800799024)(7416014)(18002099003)(22082099003)(56012099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmFLNTBzZmNCYnJSbXI2OVZSMkd6QWpNd1VxQTF2WUd3Nk92U0MxT2lqN2FX?=
 =?utf-8?B?N0Z6M3IxTFhhdlhTMktFWUh0SVhKYmN1T2xBOFU0QVdWSHdiYnBrYk5pcG40?=
 =?utf-8?B?eTNZaHhRaXJobFJNK3RRSkpKbTgxQzJScUV2RnFyK2QwVEZ6SGJ1WmkweVp3?=
 =?utf-8?B?dXZ6VUVDWVlOMk44T1NKVmtFSHF0UGhZY1J4WXNQbnNuTXUyTDg4emZ0MlRi?=
 =?utf-8?B?Q1gwZWc2Y2xsQVBzTytOc1IvdWdsOTd6UWFQWmpDY3RhQmVnMmY3QXkwNE9W?=
 =?utf-8?B?ZTJVREFaaERJREl5ZzEra3J1S1NNSUhncDYwc1BLRnVsUUFpbmZFN3pZOWJk?=
 =?utf-8?B?K0FqNDlsMEZpKzJOMUhDaDVxeTlLeUcxY0lJOVRua3VjNUZlMlJUcnphVFZ5?=
 =?utf-8?B?bnd5TEZXY1lBVFF0aU9JU3NBSlRIMUEvUmJNeVREa1BsVXJ6a2Z5R2xGWmZZ?=
 =?utf-8?B?cW1WRzdrL09Xam93ZmZPaGJSSExVa0J3c05Wbi9KNHRUcVlpQ1JRcXRpR2tv?=
 =?utf-8?B?NE9uY0h5N0pKbUx6Q0xwV1lkUHZNSEZhYVZFeTFwMTlXYTJ5NkZITnpCWnBs?=
 =?utf-8?B?bG9ER3QveU1oVWZkS3NUV0VUU1U2Y0tja0haNDlUR1Q2NWRjQkpsVFpGRDhU?=
 =?utf-8?B?dXZac2lWZnZKdUdFMUZjMjJ0VjBkWGVWRFVralc4ZkZGcFBHaUVVVjRsNHZB?=
 =?utf-8?B?a0xXV3lnRjM4N2JLeFN1UE5IeWJPSnIyS0dVNlpBMVVvU0c3U2RQZWFPTGQy?=
 =?utf-8?B?OXd4YWtRT25zSWtWRzFoRkwzYnJONXkyVFdUSElaSmFtRks1RGtiVlcvUnl6?=
 =?utf-8?B?OGFDaU9rRHIweGJKK1dyU3BmVm0vRUordVZWMDdtMURQV2J6aERsUFM0Ti9L?=
 =?utf-8?B?R3ZNRCtPWGhVcHA5aEs4YkxHOHpJMkhkb0RsamVGaDdvMjBLRHZDU1VqditJ?=
 =?utf-8?B?QUhDSFd2K0d3WENjSHNLaVUxb2w4TGdaclN1aDFFQVQ2UlZTQ2RUMnA2dkd0?=
 =?utf-8?B?VHpEa0VXRjZvMXdOQi9UNVN6ODRjeEdqcEFqbUdtaGZ2dXJMdzFjR3QzMDJj?=
 =?utf-8?B?b2U3SXlxWlRJeXBiQm5FWnZabHdXc1NYd3FRTjBVWVNETzZKUlVqSHBFZGZz?=
 =?utf-8?B?c1A0NmRSa1dHYXZ1Uzh3ZGwvdEx3aXUwdXNvNjZwYzZTZUpuVEpZMGcwVjk5?=
 =?utf-8?B?bzRrYjJnWWQxTk9FT2Y2eUEzNDFXZWVpUHY3WHBXY2YwWXhVWDFpeWwrTjAz?=
 =?utf-8?B?Y0hSaXB3cXJDK3kweUxYWVE4aGJvTElKaEtBZUdFRm9sUXVBU1ZNVUtwNERP?=
 =?utf-8?B?d1B1c0dXZE5qYTR6QkNybFpVMm1qaWg0bUhZbWsxQVNQejlJV213dENIZXk1?=
 =?utf-8?B?L1BlcDEvNXJlU09KTW9kMUF3Uld1S2I3TWwweUlHREpSTUZob2tkblliUFlJ?=
 =?utf-8?B?MFNOTHZzd1VTVWQvTWRWTm9TU2JNV2lWdFhTVjc1TjhPaHVZU0V3MzlkVE5G?=
 =?utf-8?B?dzFPV0NRMnNpeEF1S3ZnZVoyT2lNdnlOZDRhc3h5RHowZThhUlB1WS9MN3c4?=
 =?utf-8?B?R1ZtYnFRT2VSVVJ3cUdNanIzM0hoZ0xTRnljMC9MaVV2eHlQaVNaOXZlTUJw?=
 =?utf-8?B?RXFjMWdmWjlZaUNYUU5pRENJVzRqTmlHYUFvMmp5ZWYxcXNuOTZpWlVhMGs5?=
 =?utf-8?B?cTBZejgrSzI2UG94TGU3MjZUNm5jQTlHMkphUHhmUTFka0pVSHJpRnQ0Z3cy?=
 =?utf-8?B?QXpmZDlqRXduUDRWcjlaUzk1OHJsaS80NHdpVmJZM3A1YnUwU0Myd3h3R29J?=
 =?utf-8?B?Z0tGMnY4Vm5UQW9UMDA1dlBCYk9mNjRGemFxNHVoL1MxUnpaZk9iSGRzZ2Mz?=
 =?utf-8?B?TmxrdHJ0eTBkTGgvc1pzalRjTGpqUlhaZC9lTkgzcllqY2hFZWJPMUl6Zk5Q?=
 =?utf-8?B?VEI2cGc1K0NYZ1NsRmoxWDlRenpKUW9RU1I2Y0NOZXdna21OTWhuZkZzQXBv?=
 =?utf-8?B?aTdOVExZWlVDQVNMVlNwOThXajduZUhMYVFoTmxSelE1ZkZqOFVpUndnWlYv?=
 =?utf-8?B?cVJ0MW9uTW9lWHJQR0tSOFAwYUI4MVpMS1BlblhtczQ1eitxN1dweFFWUHNC?=
 =?utf-8?B?ektZQTRPdlI5Q29UQUtDQ0hiUjhoNW1EaHdJQm5rYzIrM0ZSZFhCR29WWWJ0?=
 =?utf-8?B?Z2Z6R1FxR3hLOGVXV1pMcG1xTTd2K0xPb2FmYjk5TFo5ejV0cGl5bW84d24x?=
 =?utf-8?B?TGZGeGRvUjlkaGpqdmk1dkYyRVlkbmNsZlMyM0VWdWhPY2xrTXI4SFNjbVV1?=
 =?utf-8?B?Z0NpV0k4aHNucWhJTDg5Q1F1K29hQ28yYVFqU2NQTSsyUHhaSmF2QT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1102daad-f8d6-468d-6024-08de867becdc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 12:26:34.7380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dxhk4eECsYjeFQcxVcHBpnFMmL9m+BP5orQHF+Y2VmGiS8knbxDxQqKZRjY4TTOSrLkSGdM+4q8ZMOegf02oIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11869

From: Joy Zou <joy.zou@nxp.com>

Add A55 and ANA thermal including cooling-maps.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx94.dtsi  |  1 +
 arch/arm64/boot/dts/freescale/imx943.dtsi | 62 +++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
index 117cf2bcada44aeabd82af064f19d2377e96402c..3ba9fce2c819053c2a7b1ff71e28a9f949ed73a2 100644
--- a/arch/arm64/boot/dts/freescale/imx94.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/thermal/thermal.h>
 
 #include "imx94-clock.h"
 #include "imx94-pinfunc.h"
diff --git a/arch/arm64/boot/dts/freescale/imx943.dtsi b/arch/arm64/boot/dts/freescale/imx943.dtsi
index 45b8da758e87771c0775eb799ce2da3aac37c060..5091a5c3d5815d88b7ae94b7e1776de7403b9c00 100644
--- a/arch/arm64/boot/dts/freescale/imx943.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx943.dtsi
@@ -145,4 +145,66 @@ l3_cache: l3-cache {
 			cache-unified;
 		};
 	};
+
+	thermal_zones: thermal-zones {
+		a55-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <2000>;
+			thermal-sensors = <&scmi_sensor 1>;
+			trips {
+				cpu_alert0: trip0 {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cpu_crit0: trip1 {
+					temperature = <125000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&cpu_alert0>;
+					cooling-device =
+						<&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		ana-thermal {
+			polling-delay-passive = <250>;
+			polling-delay = <2000>;
+			thermal-sensors = <&scmi_sensor 0>;
+			trips {
+				ana_alert: trip0 {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				ana_crit0: trip1 {
+					temperature = <125000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				map0 {
+					trip = <&ana_alert>;
+					cooling-device =
+						<&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
+						<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+	};
 };

-- 
2.37.1

