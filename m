Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013062.outbound.protection.outlook.com [52.101.72.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD503DD85E
	for <imx@lists.linux.dev>; Wed, 10 Jun 2026 09:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781083510; cv=fail; b=L1HP172ApWF5xtUXPjOmHFNjWy6ygF+pGy+9x+TMK7YPDCE4pygEBSyqWXYx7Gz9AodWLB7M68NxI/Dlxas5207aYb/UZ/m1B+MxoM+hKj5gB70Kb3h6CgtnsMUf2utW/18U07HybxEG4qVWfzvK1bddDzt3V5k+Wfgxg1LNcv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781083510; c=relaxed/simple;
	bh=iC/s8kAf6F3QTBn4dmaC/NCRG1rgIb0sANX4Vbk7loA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jCeA4JFC69cCXvxyWu369xkbasYpeqz5EmAmogkZg5sys8N5jTnqKimw9lJdH+v13/zGeFtbQUmmLNXxxETu3u51+GCh6E4epZra3E2hZ1JsS9nUBXEbrJ88B/ChewYvTwW21AFvTNTiqPAFg2BgWdDk3fFrEySL0ca2TN6G6zE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=cvfnvxPJ; arc=fail smtp.client-ip=52.101.72.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="cvfnvxPJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qPGwUZyoLMnofkki9TV1A6f2RRwRB+OiNUD/UDvxuBY4ubB7qkOGPm6cHq9y6Ook5fqj5c3yO/u94aEVRvb8ODxEHEUdfaEYiI0ECA2/p6gdStRb7+yXeWDX3WfXRvj8DzAEf8UemDQJu8qbrHratJaLQpWp1RN3vkIKV2fbe+1QGMOQRebzu+9Vb3y9Vw3F2vvoMsOu5dSEhxX65/O5/FpCrk5OO6sf2htDuF2V5cs1PLLrTLesZJsj0N65AGi/rFa96tUp423UTAfJdHHMfwnN7nIyHHCIb047rUFtJF6cuwUoRP2PaqhFOmFFvHPr+htKMRvZNBXm2+c0RkNeWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDwdC5c2ilwEqnyXwrlkcFEK0whwF9HlO69VC3Me+lY=;
 b=cCvruaNoCiLSCXy3vGLFrY+4WdzwKnuB/lIawvIwAgiGpUW3xSeSE9IVBaHkhCBUPzdjlhJoaGuy+sfAEQhO+T+htnfC7hkYLkGFMzMbBRWRat6dvtHt1zmvvYyXqawHWC0cJ4+BJvb8rdwHXFXU7lmexMLW6Cj6a5v1L0MCyzi+iwC/IEBl5yDU87S0aVEiXz/sLjVE33fiw4ngwl/OXcyTTIOARUK3979HoR/bWPeX+3Eaq7swtGhHrUZFAgjvJ86reXrKoodEzd9HPAewlhnXde/kXN2Ia9mo/HD5amGpNxMjvtdCcPspNLbIFB1hUkIjEIMRf5RnCp8CvKnYKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDwdC5c2ilwEqnyXwrlkcFEK0whwF9HlO69VC3Me+lY=;
 b=cvfnvxPJiBYGiOQWFVIW6rXahNwhjDiygoBgdzHn1FwVE1OexkgR1xqkkqX0r9m846UMoJVL9qHYT2MKpaVZci5zEcyaTYPS84KGnwxcRl1OpzbSrWql+9c72nxYL7OOkqlThcracZFrwAE7/4zWWq1NabI5ZAmN0zdDKnrRu0cIac/69fe2z8QtzxNhiv0a178YAg9sFE1DGmQR/9n4vbEg6XA+h8MgxMQAcMaq5UgH/n8U+Y4uo42aTZo6xhovsSmhczq/dkqsjCosWwSp3byTyR9CkqtU02oHqg2G+wNc/P9TpGAw/mLL2WI3TJuZ3JRi2YByUZb7T2Q9Ax7CRg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com (2603:10a6:20b:4dd::8)
 by AM9PR04MB8860.eurprd04.prod.outlook.com (2603:10a6:20b:40b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 09:25:02 +0000
Received: from AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c]) by AS1PR04MB9287.eurprd04.prod.outlook.com
 ([fe80::6f30:763d:17d2:b79c%3]) with mapi id 15.21.0113.011; Wed, 10 Jun 2026
 09:25:01 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Wed, 10 Jun 2026 17:26:21 +0800
Subject: [PATCH v3 1/3] dt-bindings: soc: imx: fsl,imx93-media-blk-ctrl:
 Allow LVDS Display Bridge child node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-imx93-ldb-v3-1-c9b65d742753@nxp.com>
References: <20260610-imx93-ldb-v3-0-c9b65d742753@nxp.com>
In-Reply-To: <20260610-imx93-ldb-v3-0-c9b65d742753@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marco Felsch <m.felsch@pengutronix.de>, Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI2PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:196::9) To AS1PR04MB9287.eurprd04.prod.outlook.com
 (2603:10a6:20b:4dd::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS1PR04MB9287:EE_|AM9PR04MB8860:EE_
X-MS-Office365-Filtering-Correlation-Id: 42065cf3-262e-4741-0e14-08dec6d22602
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|19092799006|376014|366016|1800799024|22082099003|3023799007|11063799006|18002099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	1mMau4IdAsbThWiuDZJOf2IQLCEXQshjQA/neoByDM+xriKr8oGkDJhhvZj2uEaCjAeJMErWa681YRfjoiZvQw3ggSpKNhSRvZBbUJXvVTtyrYI8xmjHV53Lqxzx8rDpom1kEtEPMkMdyJINtVXn/SL//nUYrxD671+bR9kOWnND47xuqzkdr3KjpJQc/spXNamwcdbnpKI83I0CrGyhlgc98gybUvIkDqbG0qUuptzE95taj5B5nrXqthuBdBgsE3LQSoLEJGAeXFY7bcfb8rkGg1wBFTZICdoXHqG46kY5dRtj6Wol8RVR5WCfaHynF7hGOI9fW+tBubP+Ri2IrKbs4go5XYD4u0h1Ku5naOxtM85VvYXXSqTAQD/CqDwgQNRbWf6EmWSl6iucgI4WMISGL6Cep9dc7NzwAr6+u5KWXJgB68vh6wPix2B7MUgIJBHLzMRgoSEyVMzYjcssjy4FoA1QMuy4cNso19Zhpsznx9UZ7R3MjiJ392HWM6qHrSqB0OOSkWvvunFD5qN+bRFXZY3Eo/VWdMKyZxZgFtKrOH+1mdo/tRBv+AEci3MQWppKW07xBdljWLDLHgnesTUN7nAWzolA+SV+6bB+AgTevOZ7xEQVJw/yXUdp6tr9tEx3I9sIMAxJJw8RflIaWoqf+wLDGq4HKZx7MytS8I7j7gKJHX9YXOzVWrwWIHMc7sJq+UbC7JOkP5ryBbzMeA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR04MB9287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(19092799006)(376014)(366016)(1800799024)(22082099003)(3023799007)(11063799006)(18002099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1RxbU5Xd0NRVllaN3BzWVVlS3hESlU0dHZnVHlXOEZDN0kwY08vajNzdFlU?=
 =?utf-8?B?dldQMDdNc2pndkp1cEpYSDE5RzJGNHJQWHFUcUorOExRREFaUHoyNGt5RERO?=
 =?utf-8?B?enZISk9RRURkek5FbWp3SVJGKythU2w3UjNQcmp4ZHp4MUdHUytic1ZjVjZ3?=
 =?utf-8?B?aXFEa0FoblRuVTV0ZkFuYWhHUVJqb21UVnBUaWZPS3JEaUZTT28zdGFraXlS?=
 =?utf-8?B?N3dGVnBFMWcrMjA1UlJ1Y0hsNTgxdjVvb3FOZml3MlRTdGdpTVBOZWg2WStP?=
 =?utf-8?B?Ly8wb1MzdUQya0s3VmtuSVcrSlJhRUVHRnRjUE91Z1JkYVNGN1h3ZStwWE1p?=
 =?utf-8?B?MnJxb283TmhVbUJIWndhZ1BuTnIvRVp5QW50WUlJcThaa1BBc2NlNGkxcWk3?=
 =?utf-8?B?TlhWd3ZjNGJadlZyTzNSck5CeDZXR3F2V2RVbGtkSGdGNkdudkhJZzNBemlO?=
 =?utf-8?B?OEpRdHRSQXdoZS9sSHh1d0tCN1ZBcllxR1V1TWJxa3ZWa0grY1ZubEhYdk1S?=
 =?utf-8?B?Zk5XdTBzNTRCekt1YmpZNXBBcitLOWZNcDM2K1dzWE9KenM1QkxXZHhiR0Y3?=
 =?utf-8?B?R0VkamplNWxEQjdHNzJuZG9SQkRhNEJaQmt3ZGVwS1NrQlEwTnZXZUtXVnZY?=
 =?utf-8?B?OXpQK082aUR5SDhYbzNRTkd1K1EvL1lzQmJzYnl1M0I0ZmNBWkVEcE9jeHNI?=
 =?utf-8?B?Z1A1M213cXRTR0pHeTRQSm02TFRkMzFkenV6azdGNmw0QWJLYUYwMk4rNGFn?=
 =?utf-8?B?bTFtcFN3WjdNRURnc3Z3RkFES0tacXp1OXhWV3NCalJiZlNSTk5lQWcwaGpk?=
 =?utf-8?B?VjNtMkNweno3SklmOXV3M1NjRksxc3BNRjErSGIwOXFjQUFIWXpwM0luYUsw?=
 =?utf-8?B?SGhJbjhONGZBK3ZrUUNYQ0t5QjJQb016QXozSnZWS0N1ZEVCYWg1U3QxbzVF?=
 =?utf-8?B?bjZQc2prTllXUVpmWHhEWjkvWUtCM2dKcHBraTJJWnRtdlh0WGd1dVBVRFNn?=
 =?utf-8?B?alhob1R0TmRkdVJZN0VKcDJ1S2xoNHFKUUUwVnhZOHh2SFJvREtuTjdjaUpQ?=
 =?utf-8?B?eGIxRS9qcEtwRDRIVjNOUm9EYk1neU5vSDAzaVZES1NHRE1UenIzaVg1ODVl?=
 =?utf-8?B?c0NGREpwWm9Vd0FqR1Jxb3duU2JHTGxKMDl6Umg5Qm9jcE1pcUdqVnkxQzFr?=
 =?utf-8?B?TmQyWW9HbFJMdUFsQmhvUWV2eHdmVVp3c3V4d2hOSUw5cGNJdlpQZzA2ekor?=
 =?utf-8?B?UG1GRkJwOFZCUVNSdTdmcmkrcmVSUldIRjVzdmF3dHNuemozWGk2ZHFwRFJp?=
 =?utf-8?B?UXljQnZ3anZUTzZySTVuY1Y2UEtnWEFsU3hqNWNVNnlPTFg5UDM0Z2Z1NVlG?=
 =?utf-8?B?RkhaZzJLeE9uY1BOZk94bmlCbk9kSk14eStnbElFdlV3SGZyRUlVNTMwa2lD?=
 =?utf-8?B?RTJORUpNNGVjYjlVb1BWM2kwTUp1ZTR3ZVBQUXVlQklISGtNT0VXdFZMQnI2?=
 =?utf-8?B?RU5HT1Faek1RLzlpQTdBL25KRnpUZWl3Y2JQeHBUb1dHWkJHT2U2OUdOZ2Rn?=
 =?utf-8?B?V0IxclM2V2JlRSsycXljcnNHVHRhYndoYVc3MlBYenFHT3hCbHVNcW5TT1lv?=
 =?utf-8?B?NTQ5cm5aSTN0ekMra25HUVo5UStCQ3EwZHQ4VHUrQXhJWWsxaFFCNTRoR2Fl?=
 =?utf-8?B?L2hNck15c2ZhbGZkV2VoQWQvNU5JT1A4NEdoRnFpR3Q2UjhHaWZna25DTUp2?=
 =?utf-8?B?WDdDNy9ha0lhQ2V5S1ArNFl3UTc2SjhHbEQwNDBCYVFtdDI4NWxiZGpDR0RB?=
 =?utf-8?B?RHVoVEJBL3N3YU80ZTFaY2JVM3dqN2FqdVp3N0ljL05aMlFRUFJPNFlUbXVT?=
 =?utf-8?B?NzZ3UXJubDAzY1FUUFRhajJPS3NkcWwwV2NTTXptVmxnY3NWcUlxWGxtRU1a?=
 =?utf-8?B?Vzl2cy96SVFrR0FpTXhlSTRtYk5TRitUd3N1RmxJRDh4WktMZE1PQTF0QVVv?=
 =?utf-8?B?Uk1ZZjZ2V096RDYyTVZ2Q0FyanBORStVUXJIZGlNakZOb1l6aS9VZWZicE0v?=
 =?utf-8?B?RldaMWluRkpyekplazRVSDRhbXBId2tLT2ZkWDJ3bmNWYjhWZjIvenhHL0pM?=
 =?utf-8?B?MVcyU24xRUF1WWZ1ZDgzQ1VnYlAvamlkYUxORGJOdDB3eG40VzNZd0ZLN1Fv?=
 =?utf-8?B?M04vYU90enRSaGtkYU1RVjdiaWxxU1JEejlLaVZiRU5pMzcyTUdSblVCb01B?=
 =?utf-8?B?MSt6ZlhYMHEvYktVeDVxK1lHY0lNK2k5YWdNMmc0MmtYMjJNOUJSZjBjTk5o?=
 =?utf-8?B?Ym84WENTUnJaeUFqYlV4MUJtK1d6RG5QYnZ5QzVRWnFtMTMxZ01DZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42065cf3-262e-4741-0e14-08dec6d22602
X-MS-Exchange-CrossTenant-AuthSource: AS1PR04MB9287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 09:25:01.8905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y0FzzxuOvsqPoOmqH/NA0dKym14b6whmbBoupWdCCaP6z7z4+AOmsUrn/5ex+ITiBI91WUpBbAm9zIqqQGq39g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8860

i.MX93 SoC mediamix blk-ctrl contains one LDB_CTRL register and one LVDS
register which control video output through a LVDS interface.  Allow the
LVDS Display Bridge(LDB) child node and add the child node to example.

i.MX93 LDB child node(bridge@20) is an addressable node, while i.MX93
Parallel Display Format Configuration(PDFC) child node(dpi-bridge) is a
non-addressable node.  Mixing the addressable and non-addressable child
nodes is allowed according to discussion [1].

Link: https://lore.kernel.org/all/n6akxiayi3g6gxcqhreb4iaohmeokoalnqup6h5r2fwdt4zijt@u2wyps55ayqm/ [1]
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
index d828c2e82965..124f5c206ee3 100644
--- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
@@ -26,6 +26,12 @@ properties:
   reg:
     maxItems: 1
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
   '#power-domain-cells':
     const: 1
 
@@ -92,6 +98,11 @@ properties:
       - compatible
       - ports
 
+  bridge@20:
+    type: object
+    $ref: /schemas/display/bridge/fsl,ldb.yaml#
+    unevaluatedProperties: false
+
 allOf:
   - if:
       properties:
@@ -112,6 +123,7 @@ allOf:
             - const: lcdif
             - const: isi
             - const: csi
+        bridge@20: false
   - if:
       properties:
         compatible:
@@ -163,6 +175,8 @@ examples:
                <&clk IMX93_CLK_MIPI_DSI_GATE>;
                clock-names = "apb", "axi", "nic", "disp", "cam",
                              "pxp", "lcdif", "isi", "csi", "dsi";
+      #address-cells = <1>;
+      #size-cells = <1>;
       #power-domain-cells = <1>;
 
       dpi-bridge {
@@ -190,4 +204,29 @@ examples:
           };
         };
       };
+
+      bridge@20 {
+        compatible = "fsl,imx93-ldb";
+        reg = <0x20 0x4>, <0x24 0x4>;
+        reg-names = "ldb", "lvds";
+        clocks = <&clk IMX93_CLK_LVDS_GATE>;
+        clock-names = "ldb";
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+
+            endpoint {
+              remote-endpoint = <&lcdif_to_ldb>;
+            };
+          };
+
+          port@1 {
+            reg = <1>;
+          };
+        };
+      };
     };

-- 
2.43.0

