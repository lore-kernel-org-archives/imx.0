Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011046.outbound.protection.outlook.com [52.101.70.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921CA366079
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 07:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782719289; cv=fail; b=RzrIUrScx43tWOBpedut7+IZ5f9wmt9lY4fyBBnUp6ts39NzKDiTL7MUvXO7avB4cjUhvyLQlhdVVcyti5RrYiMi+iE9O/ajiAA6c5joVk6bbiGa+pwfWW9Xmd9uh76tL7Td7nEfxO7qj9G6ZYHwKzJD0UeUTPQF/F0YWGT91GU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782719289; c=relaxed/simple;
	bh=FW4xFhpkFDkcmn0x7MdgIlptFN3W+e7p7Wr4z6ziQ+0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O3dOGJmV8FJJ6d1fCeFZ36sPwWcCblTaQPsZrIkWBPk2001WgIVkYm+wtaXNQa508AJxhQCyhWyuIY10iWgC+RWrqITPb8tSFdSh1Rjk6071hdfwPBLKVa8e1eKECE87kiRjdac7CkGdbn3fSXl5zQOzO1yi0MQExuLJYshEYeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WJIB3Avz; arc=fail smtp.client-ip=52.101.70.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WJIB3Avz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gIGk1GP88V+anqWtUfy4FR1ShPrHcThZvV+RvTki6nMKzR+QNmhEu9jE7vdjRRjLTZlSpLZh/eH2a5wt5GBbNVQk4EBBTQEV1qZ38zfo6GyWyaY3OqQzyMDmgQKQyb46P2MTTuQc44IvxgYDO7OjZxns0K9Kr4WNEzBV+1xPNI0MlgCLPQRnMgtAyZB6UP8Rx4WLTOBcYlQ1mvaKAR9z+uUq7gPXuBgSmjq2VOnr33AEW5YKKI+X5kI7o768r3e/kqyE+vPg8wQkWvRrxINFANtqzbu37ZVaqwnr17TmJjaAwvNbyAaFCLgsVG9mag2y0RHe3rFulbSe4d2OWIMj8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nOw43kKUT5h1+J9abZ9+i442zZzAUBWSZSek5YXpuWM=;
 b=Tt2kWjWE6Bs1GRNm6cDjNGmXBWqFBE8cqx1wZnKN5Kk/KOuYOzrteMlNhrhkVfcz6upvF55XD3oSfkKEHCQ4e/1oCuTBeEIcTwt33rRzCIe/yxsH/JSq0ZVJRacNs5nZ6ZceQm3AK2zMImM5HhCO1VMF+FqWo3jT7pJJS1qK0LeMAbbBDo8thq7EHnwncRBdVzTQ+LOFIIJGSq0Y7LtNcNKSiX+rggZgVlXy/0sPv3fbWlhSiAZt9COHF7IrrQ/Z2nCFnBZ58xouiRKwzZr6fw+6QFzNi7r+mT1Cshpt0iwm78A7UxL+Obg4XbzwjSzlnrpuQ8W3W9/yfxCe74a9oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOw43kKUT5h1+J9abZ9+i442zZzAUBWSZSek5YXpuWM=;
 b=WJIB3AvzKhTiZoNIGzoXbFcFS+lsjNIHbo4m3DyGhdPKOef+FeLyJbSGOyICDdZHaMFckO/xzr7q7gs6BvP8MRM8VlHqUW0OpNEwap+r7T8E4j+EOHNWXo2QYysr8yD0xkuzLlQYwYkDLJyhtHRm7+TxqM6kUHclOR+4qFeGf/PSWiPPUn4ygUAuTd0ez8EZ0zlV47v4B+fWmMiGivAjBtnnWz9asA0lLIRoZhsdIB79lg8PMVuvnPgR3aFGUlfuUkDPUUf27yv96bvyxbDSinXnfH5VWUa/JUMK647URbcrKHhJFtAg2mSgEvmPsFQG0qnYkiUX4VqghUG5mttn3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by PA1PR04MB10553.eurprd04.prod.outlook.com
 (2603:10a6:102:485::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 07:47:48 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 07:47:48 +0000
From: chancel.liu@oss.nxp.com
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/4] dt-bindings: connector: Add fsl,aud-io-slot binding
Date: Mon, 29 Jun 2026 16:47:31 +0900
Message-ID: <20260629074734.3643227-2-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260629074734.3643227-1-chancel.liu@oss.nxp.com>
References: <20260629074734.3643227-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0130.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c0::8) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|PA1PR04MB10553:EE_
X-MS-Office365-Filtering-Correlation-Id: e965ca6c-b2c4-49e0-aafc-08ded5b2b6c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|7416014|19092799006|376014|6133799003|56012099006|11063799006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5/Du5J7kA8uBOD/HQofBqApxlv5E5g1gnFmpUPL974FRtW50Lx45b7CaV1B3h3z1Y2c43S9kPJGml+QQ6ZoXHHeQS97ASwGgQdSE+045EkJgRw8Pk6W0edp5en/S5swafj78gFfvGBKwSo5gVf/u0gwviAwzDqcj3qXwkABPOmx5Dhkbxl+yJMVK3cmqfw+aNoX77qteQUuEvNftpiHbdr2pjb1xVGcOmHyQiXpyOvQK+A/QxcC6RHwoPIHoKi3wgD4kNiuH++b6LbK9Vb32sErSjw0k8V5A7PZtSrrCOYGJ4pyGRa3mTpCU36ePCt2zcUvc2x9+apqe/JPZ45qEt8KvSb+csgb33OIfAuIFeQfTvs5U0UCUNrGMvsXN1yeUswLul2VcXykMIGjGa9/dNUO8+6gzoQePCdSqf8CcuF2YZO4cEBgh5yExU1ymVcQHcHuUmipk6fHOGCV3oANnBcEPLOm8d7xVPuwpGxxsj/l7KGnt8D+WQrWxtWrl8S5cQnvMYl5NA+TQ5MFZCAJrfg/h9PiEBsejF+GdJsD4ZoCvTyz6+FvR/QSM7XbC4/9LfconcAHndHWrBJCEzxjPsWKrgdVYDC7anYio0pCW4/ccsHcG0hGK0kbxV0SHuIum
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(7416014)(19092799006)(376014)(6133799003)(56012099006)(11063799006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6Wz6BvPySW+1RnBo4sa9IT1O0yykaxHsY0rLTYeoDZoSrsLLSzOvbiafql2l?=
 =?us-ascii?Q?M2fcIOJVpxSyZi/Dn0eyh/euBsZl4lj4ft2ezlPfdWHDXpUcFwV1/T5+iYqj?=
 =?us-ascii?Q?xsPnb8W0NpmsbETIHOnPQYVaS85/pYIiHqeldXdgYWkQ5po3dfIUszzc9EtQ?=
 =?us-ascii?Q?jRmSlfewmcfLbx5bKXDu1KvDBFlB0ZZgyOM4fn+UWAOmb/6A3HlrAx4Yeu5D?=
 =?us-ascii?Q?yTc43I0W3YPIYpTPyhnqsuuFWHM3AE7B/SJttbGxfBjjXFr0ZIeeHX147LMj?=
 =?us-ascii?Q?54s/aepfkTPoe9hbVpDP6b6n9fDwhMQxQdvq73YIebW7TznD99M4RrRn8NgI?=
 =?us-ascii?Q?oGCFtBgRrnGE2+s/7VaoM/Xvnl+OpyJUy2u+5gLyhumTipH2XOVQh0U2wtXv?=
 =?us-ascii?Q?RE/iPlOWN/qrbSyR1r6s/guRQlZmPQlvNESwEzMianeGd+qgjERWAVJ2swrF?=
 =?us-ascii?Q?TBSSZf5cxFxeKRpGmWzB9aXuj97r/EZGbUMgOA+X+q69P7fy1hAP/9vZGyK2?=
 =?us-ascii?Q?z71CVwWaH54Ia7AawasM/Zc764BxV76LtvVmh/z/P1XkqGUwxMTv6QZdAA8N?=
 =?us-ascii?Q?drTOuAYS//L/cLbvevmtkgIX8GSXNsGjI31mr0Fv6jdEs3rPFlDzurBVovSl?=
 =?us-ascii?Q?A6jZ/DPtLQ4+LieOeUgaoSMJArm5FlllqbzwB1uEM4mXTbXl5uqKF1LMs7S4?=
 =?us-ascii?Q?k21o/TPhZTunRZ+U3Q5Xo2RCwezjlkaeI54Ku/7C8d0qxdnOAq2ugR40K+P4?=
 =?us-ascii?Q?SHPDRELgiEKaEHi4rePHWK+7g8nPjywkrfIjidJcp/+xjmtd1GZsvxXnao9u?=
 =?us-ascii?Q?QUdaEWWkeZbhCepbkIQNMTurFW6DhpO3JKMCCC6quqo/7YCVxKTgBbvJ8o/z?=
 =?us-ascii?Q?TflgoH15iyDx+Fr5CavHNXNEAGWh+tuBDgCEfbLzN/fhIgH/8yrUHfCdAHv6?=
 =?us-ascii?Q?NZIN+WTYIjV9RoKWGxu2x3iAHWKK/HgjvnsT+Hj6G5jraEgeWzhnmYDui5U5?=
 =?us-ascii?Q?0vAE/AsF5bu2js03mxDTNIKHZfGBXH3fPB4EV5H2jlcW/WKjS4M5ooa1lK2x?=
 =?us-ascii?Q?5/jVBSVio6N5YKQ3S+rrTu5iPvf0utq9OnCQHl2Zj7NgAtathiBQJh5+2Mc3?=
 =?us-ascii?Q?hRTYbDxuK2vTtxBm65QbDPzRRthYtbIXxrWveh/ZOpjvYtCM0g43K5k4L3iY?=
 =?us-ascii?Q?xezfzW0Cnz1vlDeV6imUufd1Zluk62ds+aoPm5i12JG9e1PQq2QNLMAQ5abx?=
 =?us-ascii?Q?pf08YaMmZ5FE+hRH1MwFv/S8Hn+Gb90+7aVi4D90IMHshqKFparF+Wgdn9fJ?=
 =?us-ascii?Q?+J5T8AGww3DJa6c8C01Y5ComTsycNq54QrgedU+MQgTEcwqD3J0R3ihyuqwY?=
 =?us-ascii?Q?N+Knjb65futeJ3gaAtl/TkE76biEt1RJOJjejoB3ODKqWyfWP9CnpGIXv2Rw?=
 =?us-ascii?Q?9VecyOB2oLN0tmQy+Rwtlqk8ewLZ00lua53194ru1Pq4wZMHTqEiGUR1Awpz?=
 =?us-ascii?Q?WxBsCCWMZkVXfURxcaGkt7PqjnJ4migqmxqV4l8eWhF+dPtZJaQI6H49KPPV?=
 =?us-ascii?Q?nmImY8zKffp9kyJ0G9+zJlkNbJq1KeFazhP/Myu9CwLuhXBIRQ59H2D1EyLg?=
 =?us-ascii?Q?L5hf4+0cU2b8yGuNBramS6K3uTatrtgjBzVjjIF3cgvqb0NZAyekUziq08p5?=
 =?us-ascii?Q?OPt6r6VIuOCVGtdL+L5i9En3lzN5QJNROF9y63cOf17pxvp9e1r6tA3ley/M?=
 =?us-ascii?Q?gNWBNS9WJhr2dMjPF7Re6rznXoYzvu8QMBcENGy/qRxtj/P2pZao?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e965ca6c-b2c4-49e0-aafc-08ded5b2b6c3
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 07:47:48.2142
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lB6btP64uJTX5vX823ofOmQU3pbOFPBPHNCkq0sSYP3AFn7wbjN+GJKko6LeoTp9HSgM9wc/hY4TiNXrP5aob8IgWIRqvrhk0sVY3pjbPaqTp3q47aU88TnTau9aOwTz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10553

From: Chancel Liu <chancel.liu@nxp.com>

The NXP AUD-IO slot represents a physically present I/O connector on
the base board. It acts as a nexus that exposes a constrained set of
I/O resources, such as GPIOs, clocks and interrupts, through fixed
electrical wiring. All actual hardware providers reside on the base
board. The connector node only defines index-based mappings to those
providers.

This connector type is present on i.MX95 19x19 EVK and i.MX952 EVK,
where it is used to attach the IMX-AUD-IO audio expansion card[1]. The
same add-on board can be reused across different base boards that carry
this connector.

[1]https://www.nxp.com/part/IMX-AUD-IO

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../bindings/connector/fsl,aud-io-slot.yaml   | 113 ++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml

diff --git a/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml b/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml
new file mode 100644
index 000000000000..5085574d221b
--- /dev/null
+++ b/Documentation/devicetree/bindings/connector/fsl,aud-io-slot.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/connector/fsl,aud-io-slot.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP AUD-IO Slot
+
+maintainers:
+  - Frank Li <Frank.li@nxp.com>
+  - Chancel Liu <chancel.liu@nxp.com>
+
+description:
+  The NXP AUD-IO slot represents a physically present I/O connector on
+  the base board. It acts as a nexus that exposes a constrained set of
+  I/O resources, such as GPIOs, clocks and interrupts, through fixed
+  electrical wiring. All actual hardware providers reside on the base
+  board. The connector node only defines index-based mappings to those
+  providers. This connector type is present on i.MX95 19x19 EVK and
+  i.MX952 EVK, where it is used to attach the IMX-AUD-IO expansion card.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - fsl,imx952-evk-aud-io
+          - const: fsl,imx95-19x19-evk-aud-io
+      - const: fsl,imx95-19x19-evk-aud-io
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+  gpio-map:
+    minItems: 1
+    maxItems: 32
+
+  gpio-map-mask:
+    items:
+      - const: 0xffff
+      - const: 0x0
+
+  gpio-map-pass-thru:
+    items:
+      - const: 0x0
+      - const: 0x1
+
+  '#clock-cells':
+    const: 1
+
+  clock-map:
+    minItems: 1
+    maxItems: 16
+
+  clock-map-mask:
+    items:
+      - const: 0xff
+
+  clock-map-pass-thru: true
+
+  '#address-cells':
+    const: 0
+
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 2
+
+  interrupt-map:
+    minItems: 1
+    maxItems: 32
+
+  interrupt-map-mask:
+    items:
+      - const: 0xffff
+      - const: 0x0
+
+allOf:
+  - $ref: /schemas/gpio/gpio-nexus-node.yaml#
+  - $ref: /schemas/clock/clock-nexus-node.yaml#
+
+required:
+  - compatible
+  - gpio-controller
+  - '#gpio-cells'
+  - gpio-map
+  - gpio-map-mask
+  - gpio-map-pass-thru
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    connector {
+      compatible = "fsl,imx95-19x19-evk-aud-io";
+      gpio-controller;
+      #gpio-cells = <2>;
+      gpio-map = <0 0 &gpio1 8 1>;
+      gpio-map-mask = <0xffff 0x0>;
+      gpio-map-pass-thru = <0x0 0x1>;
+      #clock-cells = <1>;
+      clock-map = <0 &clk 1>;
+      clock-map-mask = <0xff>;
+      #address-cells = <0>;
+      interrupt-controller;
+      #interrupt-cells = <2>;
+      interrupt-map-mask = <0xffff 0x0>;
+      interrupt-map = <0 0 &gpio2 27 IRQ_TYPE_LEVEL_LOW>;
+    };
-- 
2.50.1

