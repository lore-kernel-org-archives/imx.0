Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010017.outbound.protection.outlook.com [52.101.84.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45A51A08A3
	for <imx@lists.linux.dev>; Thu, 21 May 2026 19:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779392268; cv=fail; b=TdC7kqz5w0zqvBcnysbFnxYEGhps4mFOpUSpOlFimD9roUpYvbGXN9iL7GeZpZ/DcKvgXTJ3QUUM9xifkcwx6fNxl2AVO98FIs9H1pmHwaPXhTSTsFUNE3/e7kGSakwAAi0OkFfU4Qq2TlMWCBhNeY3fdak49kG7msLoMmM6two=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779392268; c=relaxed/simple;
	bh=5foWuqpoR4KffAYyGyr84OeboshVYWT3RlRZR7mrfF4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ZlVM1uiYTboVMzlJSNlf2l0NQiFUG/TB7IcU/7nNf0UEI9YM8hdVrtVf/AkLNiXKIuJfGStAiM36PzmhFE+b2QzRJKTwcH8e3no/zzn/dMMaZ6wzX/4MqG8B7BbeLmsKeW71K+lrhhKP896z9pUzh3MJjca86pDCs5p/laknQ6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=s6FAR7N9; arc=fail smtp.client-ip=52.101.84.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="s6FAR7N9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jxxngqM5MzQmI2KthUyGtL4j3zCo7BPERg5cBA/JkAPKrKm044CC286AiHHCT4IdeA0FPcGZDX83rS5gR14umNSi8MjIJhk2Zqrjx5sgsQil1T0Kcn6S6U+Q62NyiFPgBPB93VbyDtamZ0JILiC3y6rfHqlHXb3v8d8SzMNCSDttImFtSODQQZ0/0MqkRwyMP5Y50Rkca5WU9KVjfs2z47BpuhtiF1UeLtqNtRc49aYzgl9chdfT6qPVs6731SNpkDJvlt1U1j5EXfO03DLHKfLw1Sq0c1V7PY+PoLbifrqg3C9+DmcxeyVsn8SGvG+n7D2gbgF4loL2oI7CT3bXlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N8zGtXiFYukRVTDLQS2DnB+zJgh/nulPAV/aO8OGDNQ=;
 b=QBUMTiWtVdrbKBqUMCR4inWIgSDpnkRGmzXcaw14P7xjIpjSTO3+eUZ+NoEItPUGqPny9hUoaZ7owUUF0Sc7WNpEGRJ5G7zRcCIdRKi7p3QtApt5HG8HyZizP5aKT4KZosZDnlQ0uN/PIaOzBytkxFo04AxJVBAuTUY6xczOMCE6JgnGdxpo5W8ft0NmXIdYZ+MCHcc/hhF9UeQsSsW1LbabkAQSFixGdO1Yyp+Q8WnJCDvJM4j1vQlKc2mNTyWBLxh15WyudSBOkOgd1Ek9rjRACBS64EDRIrUJcw3tR9RdWVBKydl322guLjV8orRq2gFUgIpUUtIDD0KrhHMhXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N8zGtXiFYukRVTDLQS2DnB+zJgh/nulPAV/aO8OGDNQ=;
 b=s6FAR7N9jm8Ugn/6l/sjfiIizCaXLGSZ8LZlqDMw7sTGu1TScbZS1Id83KeNPAu/Q1NunHNTLcqMqLdl4GaswQLVATw/5JBUQoFJT7IsWI3lplQzXCArt1YpMDkvI5Vz3YDM6UASUatHHK9o1s8L+Op9YqWfOaPrvD5Sz73QmGwd1apZRR1CXIxQliMAjAlLQwN5waHBV19uF8ZPvo/tN2YXGW1cktGh760r3HOGQ8R+mxYYEQqwcULnDquab493gT0HYX6TfFONRjlMXQBO9IIiE5Dvc8PXLZDmDXauH0F4mTOKMrGAexMHvK6v7xVaO7RSH2LkYNiiuZJSW8zw7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB9281.eurprd04.prod.outlook.com (2603:10a6:10:36f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 19:37:41 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 19:37:41 +0000
From: Frank.Li@oss.nxp.com
To: Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR FREESCALE IMX 5/6),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/1] dt-bindings: display: imx: Add television encoder (TVE) for imx53
Date: Thu, 21 May 2026 15:37:32 -0400
Message-ID: <20260521193734.1496372-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA0PR11CA0082.namprd11.prod.outlook.com
 (2603:10b6:806:d2::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB9281:EE_
X-MS-Office365-Filtering-Correlation-Id: ea542d36-5f03-4e29-4adc-08deb7706c3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|366016|1800799024|921020|11063799006|3023799007|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ooNypA5lWbDGZqQ8FZF0t92pL6AQslyVaaY6UpTYUAMBtyrV1dluwHPVkfxo6A/IZue5MfpuEoUhaiYHFKtqr5GRZQxzWTGgFxmsTBRRnMtw/vjJ6mLh5RQgJX7MfgwwxNd+7/VUHMdX2MW8mXwncM8cyxmaYIhbu+QNv9eQIu5L3ADAqxw51iWUFgKSkoewhnU4x4Y/UCVSZQiZgXfoZQCINVemnUazSzCRe0bL//dyJ1aP6thvOZ7VDvP5XYN+cIwlvAAXFJ5oC+D0GB9jmGpXKKemD1TRP2Fd1H7ZYpOkcAb642khozIcb35jgesQGClZ9W3SYOtPKowJBVihl8BHJMhh/qzTaqEY+YC8tAGXHwXPE0wOQZab4wi+6wsJzvTpKBgwc6p/RuTSiSJLSzk+z5wCTMP2Yov3cl4dA9gPizO0zwkLqjwdbQTq7UI1opgzLstj+z/s5Iv07MIQSAyYJBatb2TtmHi3mejGRH980aUbvNU403D3xZCQnJ3fAyOslvrnxzvV/NpXRRSk1Zyq1XJzlxCdmZJbRJUOtRJvgs3ItHFAEjDLyCXHYU9npeaMBN0ifFcpr7TDUu6Oqdh7ZVP1sCexPafV6/RjutmwN/zfLSVyKcSvc0wX/8Bd6B49bHTbXzXJG3KtZeNkClHq/oX7KVuA3dBkuy9BqAanc+AmgTYvlTwyFWcODjoh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(366016)(1800799024)(921020)(11063799006)(3023799007)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cVP1yzWIY+vtUKgqdJquLmn2eI07NuSQ3kkMZjB7EGAVN0oVvgA3gR388MoX?=
 =?us-ascii?Q?fTSSICNJbLsjorm+hDwidV7VIJ1lLp5ALgOxX3QgcJcY9UlvT41qCbN302gW?=
 =?us-ascii?Q?ecHUK6mfVDttp5YNwB/25GdqJaxS7zEIjdsmorYApZQSx4plHujnjgC0ocMK?=
 =?us-ascii?Q?KBcPa9Fpz3UtYwVo8iLJsb4XWrOso++DrLJV6H9cAQvkto9zW9bb3axqkMBu?=
 =?us-ascii?Q?dCQ/119Og3ndKC9sMt1ZTSYo994LkBTOj28C2uNgk9+s55KVkG2zBOf8pYUf?=
 =?us-ascii?Q?bWEIryNZEKrHZL/54GQHNGc/sc/85DenpTQIExXuLZqNufo1HYIZOh+7nSSh?=
 =?us-ascii?Q?+o6H+NAJ7HfG3ddVJoup+gUWSgvb1h/UwoUi4KLlmmeVC2SxrB2t1mrQ098+?=
 =?us-ascii?Q?Amad1dyLTpLUnh1Hvjhl1Gp2pXKM3HlKdIOY8OYxGGMR8ULZlPrffigQSugt?=
 =?us-ascii?Q?Hkx4/LxZRjb5ktD/p57R8QoqtArWVlwTcbEKyXc2uKWO8LEQ6aARmD+3OemK?=
 =?us-ascii?Q?LrPYfRzL0xZh7DkFl/x7/tpdo2Q/UjG9n9beG5dv4+SCDY5wvh0tmgOTwWLD?=
 =?us-ascii?Q?7tPSOijMUMasLv8WlFauTEzdji7nMH78g+w+pm/ZGcxBWD7UIObbcPNUZrhd?=
 =?us-ascii?Q?rPjspKtMeiLEfXcfahZ0CKthqHR5By0UHy0IPwOK347Nbhxaz6UDQHhHpT92?=
 =?us-ascii?Q?hvxWxPwEoa1Ho+BXODWmmli2o+mnKPO59qfrpkgCD3LiH9BfWrPY5xs0ujF/?=
 =?us-ascii?Q?3AVyBpij0faGckghEn001c0MCeBRFNMhW7w5gry5xwNIPIJcKUOO1p0dB3gv?=
 =?us-ascii?Q?vrlY6X9ck5JpMNhTCO4vjhJzpeebkS/ZiCStWILQTrOGLVE6i1J2glHW7+F6?=
 =?us-ascii?Q?lctx0JEcYI5wt1GkFb/Z3nkIMnjN6E91AwOg+BBtI2NDttRqBawtRQcCS/jc?=
 =?us-ascii?Q?1mVWIigueURIezu7kRM2BdzbBChla3IEago++lOX/LBOTxNCSMYQwf0nDpLS?=
 =?us-ascii?Q?s4psO0OyUEwElQXc7eBtcMKVGBGPDNb9Z368Jv9b0sko/lqX3oan1D496C/h?=
 =?us-ascii?Q?ObD0TxTkToP4N+VvrRxri4dTdyemPM0GUdNndLZdb6hwh5/ZsP61p8tD5IIv?=
 =?us-ascii?Q?fi0/mm7KDWnSD1zFIKDPrMbxQHjI/DG7ePMCmjYe/8Q6v3udVDRg+WM9xe8u?=
 =?us-ascii?Q?VfvKHzW8v9TKyAs8KA3YQZar71hECkyD9AGrTe3/ftyJ9pYE4V27wzeX5N1i?=
 =?us-ascii?Q?skJg+TOTaYatVNJ5PXqYWKghmMTy/QQTVU0kKT4YqHQNN6UmUv8YDD1ShbMN?=
 =?us-ascii?Q?aeWe9VQBK4iRK/KUkwsElMjzIXZR+3ZRnwXZTNy+IEt0afSYImnxYxRC6BPs?=
 =?us-ascii?Q?aiN8yqLyKZshUCJhQogpgRorFnyXogBZW5idEDKgamzpwP/QprcvO/7cydZZ?=
 =?us-ascii?Q?71MiD9j454pv8XdurmYEeL80A5mfcg5EIj7eJfEG83UVNwnJj9YWExSkutn+?=
 =?us-ascii?Q?pZnJjt8SgiwBbhFB1YpKg2XMJDxORuwYhC5fr0ffNnFJtP5cABU0fat50nBv?=
 =?us-ascii?Q?J/nBdc2ZctiDwjOMw376/itszsJbRb6k4kdt5e7ymDwcswVxYdOYoY+sMole?=
 =?us-ascii?Q?9RUChLhP0gDfJpIad+hcFtkZNRb7Ot1zj5G1zeav9mtd0mvji+zK6MrMV5Nu?=
 =?us-ascii?Q?JWhDJrKu/5QpQjAFO8+gBX1VmljFGW3kUdcnHetGhyDqcExREiEGIIa93pzi?=
 =?us-ascii?Q?q484Q8TTxMr45/NFJCY4Onuxbpmgco0=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea542d36-5f03-4e29-4adc-08deb7706c3c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 19:37:41.5540
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o7YzQjOGcOd6xEaCTgGvhxcEi8Y55MBv/dAS4CB2lGwH9k/kDgG/IvYRKlss/hWN7j7EGbgggFDT+ylIR6KmqPUzJ29SI7NtmK5ih9BGxrDOkKK9cF8JosB7Vx5R9hGE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9281

From: Frank Li <Frank.Li@nxp.com>

Add television encoder (TVE) for legacy i.MX53 (over 15 years) to fix below
DTB_CHECK warnings:
  arch/arm/boot/dts/nxp/imx/imx53-ard.dtb: /soc/bus@60000000/tve@63ff0000: failed to match any schema with compatible: ['fsl,imx53-tve']

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change in v2
- add Krzysztof Kozlowski's review tag
- move fsl,tve-mode to required list

About cleanup 300 lines warnings for i.MX ARM platformi
---
 .../bindings/display/imx/fsl,imx53-tve.yaml   | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx53-tve.yaml

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx53-tve.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx53-tve.yaml
new file mode 100644
index 0000000000000..2fcf447459122
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx53-tve.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx53-tve.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX53 Television Encoder (TVE)
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  The Television Encoder (TVE) is a hardware block in the i.MX53 SoC that
+  converts digital video data into analog TV signals (NTSC/PAL).
+
+properties:
+  compatible:
+    const: fsl,imx53-tve
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: TVE gate clock
+      - description: Display interface selector clock
+
+  clock-names:
+    items:
+      - const: tve
+      - const: di_sel
+
+  ddc-i2c-bus:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to the I2C bus used for DDC (Display Data Channel) communication
+      to read EDID information from the connected display.
+
+  dac-supply:
+    description:
+      Regulator supply for the TVE DAC (Digital-to-Analog Converter).
+
+  fsl,tve-mode:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      TVE output mode selection.
+    enum:
+      - ntsc
+      - pal
+      - vga
+
+  fsl,hsync-pin:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Pin number for horizontal sync signal in VGA mode.
+    minimum: 0
+    maximum: 8
+
+  fsl,vsync-pin:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Pin number for vertical sync signal in VGA mode.
+    minimum: 0
+    maximum: 8
+
+  port:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Port node with one endpoint connected to the IPU display interface.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+  - fsl,tve-mode
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx5-clock.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    tve@63ff0000 {
+        compatible = "fsl,imx53-tve";
+        reg = <0x63ff0000 0x1000>;
+        interrupts = <92>;
+        clocks = <&clks IMX5_CLK_TVE_GATE>,
+                 <&clks IMX5_CLK_IPU_DI1_SEL>;
+        clock-names = "tve", "di_sel";
+        fsl,tve-mode = "vga";
+
+        port {
+            endpoint {
+                remote-endpoint = <&ipu_di1_tve>;
+            };
+        };
+    };
+
-- 
2.43.0

