Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011069.outbound.protection.outlook.com [52.101.70.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A1C3D9023
	for <imx@lists.linux.dev>; Mon, 20 Jul 2026 09:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784541088; cv=fail; b=c+6rw38UrJJ8PnpS+MEHeHV4OXKumNJfzITy0yKgbPx0bP07OWHyYCHX2OA7kkVCTCyQJeJfQqhMoJ27BmsVk4PNwaDOdRNLTJYN1TBMPgF/lV8DKnahUwpBxaAQsbja1z8E7PKN/KBhl/OesWBRS5iCMuI5IGoTDYuKxnw6T2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784541088; c=relaxed/simple;
	bh=1NsBCQAqGwFV5Gf+tIgYGuWx5UPDMOlCNsldA20m30k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZvDiQPk+2uDan9O8iu+wew9XIOdpvNmoWArM4+2s08tfEQlUzwh19PAOR57L/sDsHKv1BtZNRQdypVJz2eM61KcHXsFAjfWoZVWGWv/EFVwH1W0U2anhbvsdoAt/B3O2FwE6PXz6NhkRkjJ0KaV15/eEqMS8YE1eKbNhlCi28Gg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=n4MicVnj; arc=fail smtp.client-ip=52.101.70.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="n4MicVnj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kg19FMNsidyXrhHlzwWaRRJN8SUiYgwYEYpyYETFaqSM+FNlfG8rMfyfHPPdLNaCaICtyNrtptL0clr0zWWq5YXXeSvnKfQkvfcN699JaUrJ5tC+SVUCfc8NWUWwxPExSqzgo3p0YQRIZRBzI/LTzVJlgLeoE/7eKUTG5Mtil4ZmC4y3VLCAplYffC91jopf/joCQg+vkDbA7inerVOaxw4Ea2PlBJGhfHsBNUxOUzGbwYAiKYbBnUiKd+edLr+eC/kJcWHa+Tv/cJlZMoKxHwvq9oCuhVqDNpgS+mzTGmpBuSQDOszZdbJ6wt6YYhC5ndkeOD9Wn3Abi2G9TjDwVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nq4F3MaGRn/DaeU3jIZAhTgBKUzqqKJpm4+TJ0TT8Vc=;
 b=rPc0RuE5qq3Z4l1mtBiSCcIJig5f6+IVuIys5l+0KHCF/8jCd7lG18xI7CU852GwGv+Xte5CFvb+FI59klD5jsvVn+KgCBhXZ7JOQVuJw4kVgzRNNhLkUhABwquLaUJIHQ8aZnYzClN7pRuIejQvJLssQkeqkX4Jgo0f88oFBTl/xLLpSGTBlAU/kceqLFlC8sIiD13v8h1D5d5kyacLrNrWowBhnrxY9DxMTe5FpJ2dry5A+I+dPpZ3qsCPAlhjh2cYmexgn0zkA3m7DAa9TFz6HlKGsiesLSg+Qrvbbv+bgFklyiq2XxxS57FKh0LoTUHaEBsAqhgMe/ALSpeCGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nq4F3MaGRn/DaeU3jIZAhTgBKUzqqKJpm4+TJ0TT8Vc=;
 b=n4MicVnjJ9rQVhD0MbEaFHDVgWm6Vu7CK56SNcuhOm33A2E5Q9BrIthml3BgCcjCNDyHP/XOZCbWkNB4qaId7Ok3fbCvWmfs1NDUpd3Q7qt62Fhj+o/W0ekbQRWXFvIrNxErrU4KpDwovfgrYzxG132A4QBvJLtefQ1F0FSWRrB4Y5lxVK1r5lXLM6fzQTKW6wtHXFAQ7nZsF/65eaBnUJ0scuy1NPJekzC624opN4DRoJvOShQ3oyn68xMj7Llsrg54Nv2vHgt7OJlRVH7V30jq+3yJ84xeoHmX531gNswhYGdPmdfcpWkoQnJydRWwF4J4CG6BjCBNMfu3keEiCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com (2603:10a6:102:2b6::17)
 by AM8PR04MB7284.eurprd04.prod.outlook.com (2603:10a6:20b:1dc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 09:51:23 +0000
Received: from PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa]) by PAXPR04MB9351.eurprd04.prod.outlook.com
 ([fe80::1058:a430:52c1:5aa%6]) with mapi id 15.21.0202.023; Mon, 20 Jul 2026
 09:51:23 +0000
From: shengjiu.wang@oss.nxp.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linuxppc-dev@lists.ozlabs.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: [PATCH 2/4] dt-bindings: sound: fsl,easrc: add ports binding for multiple contexts
Date: Mon, 20 Jul 2026 17:54:48 +0800
Message-Id: <20260720095450.1618747-3-shengjiu.wang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720095450.1618747-1-shengjiu.wang@oss.nxp.com>
References: <20260720095450.1618747-1-shengjiu.wang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MA5P287CA0253.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::7) To PAXPR04MB9351.eurprd04.prod.outlook.com
 (2603:10a6:102:2b6::17)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9351:EE_|AM8PR04MB7284:EE_
X-MS-Office365-Filtering-Correlation-Id: 41ab9293-50e1-4c60-b7dd-08dee64474c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|7416014|376014|1800799024|3023799007|56012099006|11063799006|10067099003|921020|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	cCY8wF48QjCX9ag14kiPxr1EguL6rxb6ghPJwBrMihyvXHJEmY+T1jE4Xl7TCdAxo6//6tCDjUF5kRr6iDufI0UZ2Rqg9Wf3O37aJ7niHMqfxPELY5U62M3VTZl3D3VDqv4x0NBot942ssKig36nPrxfewGLHLUaasJaZKnhvsLjyqobtwNN1gJk/E9tk0fbMdPjylYtWEvmYyrbROcK5NnJZN3/vpLs4v7yavgUW15YUsointq7FB0l00IiqytQgzSYHAhgQnkKBUHZ60tTWUeLrhr4cVcvRnfw+wBQvFdVGA5S+e1JviH2op3pDzxbS9PzuuhQAp2Eii55RSFaRTLsetrmG8j/phaBaBJ8U9MuzyeuhY2Zzf1DAkd+yktzOmy4zK1lBaNKF/DA1A1U/oqHb6OkVZX/dg0/SvF4PPX4Lv0mQtZAeMywcNREY9h+VFkNQQRFW4zWSPqSnbI7LqcSBKQkMt5Bf5Znp1Q4fALxDRRN/HlZFmaS9wbz5iILmPFE37+nlrTKXMFOxql6+GF26dgO7wKE/TNRWEfXNKmIhHLw+RAx2sWCiGncbdprwOLHVEdDbvivNy/VrX2MpZHqRZX86lXaPNMEMafPl9Hkv+kbt/OCATsVrFphgrbBxXXGrcI0oAyqDxCt/j08gvLY89KLBglnnhbA8wXnAn2dL6l+Zeytau0GjEul0ps4OSLh09EpGdLSmFXaz3Chdw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9351.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(7416014)(376014)(1800799024)(3023799007)(56012099006)(11063799006)(10067099003)(921020)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?N32dgHqOjhz6eXP3hISexpXzTuWgn2zPQ68/aa2IuaKaH2EyPI1rBfJJ7Djh?=
 =?us-ascii?Q?8M4d5YnZgVy0HULrQOmVEHCBb86TFXeDssbR/inCd5vUKi9wPR92q8RaeGAb?=
 =?us-ascii?Q?+S0t70GryBJSZEBPuo4SGhltabnM4sU37IrP5ay+fXzlKUGnPcPi/1TcG5pJ?=
 =?us-ascii?Q?CszBlhy1KiqTT+EM6uxNg0hQ5r2dCcg6F1Oye+0ndSW/5E3zXviK3f6n7qtS?=
 =?us-ascii?Q?6MSYTzIODkD4mKrxtpvPiicJG/SZL4SCA2Fr8CbRPv0PzhL6ilIWayBlQ1jG?=
 =?us-ascii?Q?GU7ZBf+j3EaGRvwWSBZjRhNMxf7+1pfbQWc2bViWpFqAUDUyStyqkKPVtPoR?=
 =?us-ascii?Q?1FBRMxQqc9gLSYslvDbkGCCe2qCJDJH/MZK/n2UXDuX5CvrEPNAl9cckblxt?=
 =?us-ascii?Q?Bjw3UFBtQHfzqW+1H5QWuNvlBrHikvHikwyDvsOuMjdldho6zDh9Y8bPG+ts?=
 =?us-ascii?Q?7ZEd7ZUzk1H/Wk4ZUpNGyE6nADyQh4en2WZS8sGtiQuI1ySex7m3mZnCyp4r?=
 =?us-ascii?Q?LyWZi9/xFa+KV3YEDw0aAA6mjxgK7U4gUAnoF8b9GwOOsPlS1it8wzIWMjNv?=
 =?us-ascii?Q?V3jS8T8h/0cXdffCqapkBj1lfLFJFubOFjw4xp0iBm/rxEtHs5kLLC0RMiX5?=
 =?us-ascii?Q?7dTRaWUIK7b1IpDT5Xcv8nfAn+6458UVabE+6Srv16AEOoBgTKrnL5sjExYO?=
 =?us-ascii?Q?SkvSCROrita9rqtxRd5PiIiy9QxHmVcD1xQxEjaUQsyxfsUzl/6y5bAMkCEW?=
 =?us-ascii?Q?OeLTDssYtmf0L96j3fRpnEL1bNFG9FmWEsuAMs44c4Tbw2WCpjbAvWMBXw/H?=
 =?us-ascii?Q?aAIOoR9Okh/5R9VJPyTJdg0qKiZiqD8D4qdZLl04DNkrCfCyGP1coZvuYdqO?=
 =?us-ascii?Q?2keo6Caj430aFylMgZywz5rJaXHuicLPMzCvjaCTOMXAqmoFl9dhwbzv4Ptb?=
 =?us-ascii?Q?6/dKI095syOLlMFOGk78j+mblTXlpLhL2E5VKLJ1ys9gOxltQvNNqDBV8uwT?=
 =?us-ascii?Q?N0hsbXcSVfsh7bZJVLFINvm+pifnf6f1BTaId2CxjV7EBEzkcrw7f+BVCW5U?=
 =?us-ascii?Q?/iXN7mznzvXqo3qEo9S3l8ohEDtZ9FowGGHWFo/yJTXpVwwMNAsVCFmIw/4l?=
 =?us-ascii?Q?TLNJT0Cl+k69YMiOBibc6hIYHwFS6Zi/UNu28gl3mm3+c/iNOEMksbhpAACL?=
 =?us-ascii?Q?PIE+vSmPbSZQvrfcnBTpwWtogcnGIGVFeQBTYdu5hSnBWplnDsseqYla1m37?=
 =?us-ascii?Q?NzqgHuNdeFowxLWDFs+ZV59X4JYFEAnBb5lZMQcKMr3cABhFX4FsM4TpxvoA?=
 =?us-ascii?Q?oIZ5t4vxEhhH43VopTBRnov3DBFOApIrqGjSCo8srnjCEuBJ3wYmZi7cLoN4?=
 =?us-ascii?Q?OjQLGsXh9gI5X73hVEkXthlGU6MBlmbNzvBTg2zDP4OG9azpjE7G5i2QqTdI?=
 =?us-ascii?Q?bqGNlhpgVZBx6h+/s2x85+40/T700+fWfavzIRXD7Z82GDgytZvfk49rHAW4?=
 =?us-ascii?Q?YUyd7qcUpLQr5n+ueTKxv1ZySCO18T/+FHVqtADZIoewJIcOgJijeMrkX8+4?=
 =?us-ascii?Q?GAzxdAcCmej3uUnbvdI0UiLxlNPk6s8/2GNMXxV2+Vl7T42ibcCg96DyLuli?=
 =?us-ascii?Q?YlH4p4+C4ozPX2RAEi7D9iazPym2vkUqm2wAYVOUcVZ8yIX0Miu/vItcPXZ6?=
 =?us-ascii?Q?Dj6AwWAEX7wcdLLQUQjwWgDPzt6ri/BPSlZouN/+SBQH69iHgkOmdD5wTjWK?=
 =?us-ascii?Q?xKRzGnOczy1ERzvLxbifXQJXKgvPHJRkbeaWrhNai5EDrQNgFILN?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ab9293-50e1-4c60-b7dd-08dee64474c0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9351.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 09:51:23.0039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A3lcmCvT5fi7CtpSo/i6Xhz1lvVaPk7v5EMcU8RSHwst0HI+/uWcdgFNdY/yUvQI1UR0aapp+yKywxCCjCdcPWkpJ1ThtgQe1Tzzxaa/CaCvhceZd7nKpW5QZ0pZLKnz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7284

From: Shengjiu Wang <shengjiu.wang@nxp.com>

The i.MX EASRC hardware supports up to four conversion contexts
(A, B, C, D). Add a ports container property to the binding to allow
each context to be represented as an individual audio-graph port:

  port@0 -- context A
  port@1 -- context B
  port@2 -- context C
  port@3 -- context D

Each sub-port references audio-graph-port.yaml and follows the standard
audio-graph binding conventions.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../devicetree/bindings/sound/fsl,easrc.yaml  | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
index d5727f8bfb0b..0f579870110d 100644
--- a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
@@ -55,6 +55,29 @@ properties:
       - const: imx/easrc/easrc-imx8mn.bin
     description: The coefficient table for the filters
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
+        description: port for context A
+
+      port@1:
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
+        description: port for context B
+
+      port@2:
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
+        description: port for context C
+
+      port@3:
+        $ref: audio-graph-port.yaml#
+        unevaluatedProperties: false
+        description: port for context D
+
   fsl,asrc-rate:
     $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 8000
@@ -107,3 +130,59 @@ examples:
         fsl,asrc-rate = <8000>;
         fsl,asrc-format = <2>;
     };
+
+  - |
+    #include <dt-bindings/clock/imx8mn-clock.h>
+
+    easrc1: easrc@300c0000 {
+        compatible = "fsl,imx8mn-easrc";
+        reg = <0x300c0000 0x10000>;
+        interrupts = <0x0 122 0x4>;
+        clocks = <&clk IMX8MN_CLK_ASRC_ROOT>;
+        clock-names = "mem";
+        dmas = <&sdma2 16 23 0> , <&sdma2 17 23 0>,
+               <&sdma2 18 23 0> , <&sdma2 19 23 0>,
+               <&sdma2 20 23 0> , <&sdma2 21 23 0>,
+               <&sdma2 22 23 0> , <&sdma2 23 23 0>;
+        dma-names = "ctx0_rx", "ctx0_tx",
+                    "ctx1_rx", "ctx1_tx",
+                    "ctx2_rx", "ctx2_tx",
+                    "ctx3_rx", "ctx3_tx";
+        firmware-name = "imx/easrc/easrc-imx8mn.bin";
+        fsl,asrc-rate = <8000>;
+        fsl,asrc-format = <2>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                playback-only;
+                easrc1_endpoint0: endpoint {
+                    remote-endpoint = <&fe00_ep>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                capture-only;
+                easrc1_endpoint1: endpoint {
+                };
+            };
+
+            port@2 {
+                reg = <2>;
+                capture-only;
+                easrc1_endpoint2: endpoint {
+                };
+            };
+
+            port@3 {
+                reg = <3>;
+                capture-only;
+                easrc1_endpoint3: endpoint {
+                };
+            };
+        };
+    };
-- 
2.34.1

