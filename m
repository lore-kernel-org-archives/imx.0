Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010045.outbound.protection.outlook.com [52.101.69.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985573A5E64
	for <imx@lists.linux.dev>; Tue, 12 May 2026 22:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778625968; cv=fail; b=IGIPnrO//DUnDQQRUozCLNKcfpj5J0j7cp4nG1ggyVnw+dPjZ1QYF8dW2wpzpBLH8sLIN4fwHbOtPbNrhSmSkM3rq8N3E39ldWWTcK3+96siIxJeunSbwpwvbLepQ9CznO+F1t0ZUDPH85lbQXmssysVISZNGxRkkm5/3crkaKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778625968; c=relaxed/simple;
	bh=x0QEtWKCFUf9gCC1LNZh9rGP1ZgA8jvInjBlk95bpn0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=mboRRxvmGzsbE0F0OMMMAYxcSd4+cy1eLhNGhD6PXb4JPVDA3HaYSw9+dkklu5++XXXBuvrkXCsjuJT3oAa65U5SnLpmzLho8fpja6CzigsJZxDfEmMERqJvODmcbipMzHkcvAPlHKyyUaIWtWEDLw89jqGGMCw1g57GMEd22Gc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GbA8Apc8; arc=fail smtp.client-ip=52.101.69.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GbA8Apc8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EQGHE8z0a39zSYLObvoVs9LkMkpns+gLEYcVjFZW8XQfgL+d2VabWIh+A75/8siFtblOvqhQWL9giL8k3lJGt6W1r4yKkcBW0p2Fn/4hck10ifuV83VcmRbsOxjIbzVymJSEwTIobU6GEKQOgTkTKzzQWy/cE3hCemOYGwkmUMsuf8rjk/D9Dw6qqpecsZRJLHkH3IslcEGDFcn4AIUXss19I22XEVR2P71Y+spnP7LwbiAmfERbB5cXFF+Dg8ZEGQYyqXjuvsV97g3YeoFT+t6V/51U9E0mdGQkohSdac+nURzCHN1CtGITJDfIXK1zSYUQzD+vtydV8si72ONbMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mkFvnIKT1rtLPtUq/44zJwaHL81U/rHtNAg51nY2KiU=;
 b=iyToPNLYEwIQ59wMTyfvdQ6+wAIFmG+RU9cZhGjAa2eWPTnouUgWGD8CD3LebjzgWhvOPwzsLrR+htEIGMG96Hz5QPXUqN5d8uIx19R4X4+4jlgC69ex7+aN8I2+VZKu0p38khsCAE/6yJZkgssK4ZXmCXSdca5rZ+bSW3dkJ943na+vN6R2s7CyOb9AfzdJKRcqfY5NADInxjNiVoxv97adIwsIB3rTSRPS41MKRA/M5jfH3nULfRzjXQEYThSwCFCS/+G+uzSdEwx9An3IlbNXBWOj4SPTlOcgXdpzGDcNKJy/ehJNNkjwAxroZ3vJwa5FZdWJJ+qUzCF9PICgpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mkFvnIKT1rtLPtUq/44zJwaHL81U/rHtNAg51nY2KiU=;
 b=GbA8Apc8bjWmPI7cQgCxbw2D9R6tsw9ZDMGjLJ8SBW2pgDmKC5iud7x7E/unxXmt5hwMdV/+uiuEeHU2NlwZfBeBDikbhC4Br96+FNMBqwIP67LbDxbTWGq0PEQn48DSFgtjc8FpBHsGxVvkNXG7oIyXDNcDJB85kuYrbNaEqScmmyDy6O4UVXizsiv9g4DazdsBXa+49op0JQEu/UIhaKG26qLd8wOwKMrdf3d79/GIOezYpKJ46prcOf2dd/qPZV2298iPJv8TbmMZ9qSzgTOuYEHY3410UGxqwgRY8yx35E+Sy9UBPVXGnUyUIm0keMwFLgNt6bmGgc9lpw5+Bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS5PR04MB9922.eurprd04.prod.outlook.com (2603:10a6:20b:67c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 22:46:03 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9913.009; Tue, 12 May 2026
 22:46:03 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org (open list:VOLTAGE AND CURRENT REGULATOR FRAMEWORK),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: regulator: convert ltc3589 to yaml format
Date: Tue, 12 May 2026 18:45:42 -0400
Message-ID: <20260512224544.1223283-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0252.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::17) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS5PR04MB9922:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dd930ee-8223-4781-4d8e-08deb0783edb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|19092799006|366016|1800799024|38350700014|18002099003|56012099003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info:
	U9KihMVS0zgGHHR1jx1twgwxGNIx1XN2ABIDi4ElLeXws5oAmc7YJz//3DcswbkYGRXE4VR7QIqfcLXGd4FsJ8uDhY/hF9McGt3AtO+yGyXYLK+O8BWSMcvKGBSU9ri2GWvQXd3LkvOH/uvoqgj2G8RCpYMqR6KSRRbYxUf0PJygUzLt4CeyqwqA9fInYQ2kU90Iv/sN6/1CA+Woq0+BgPo63z4Ts+TcRRo3CijYcYy96U5Q/OJVCbtU4yyEp5d7by9/esJDlVv3w5g7mMN/kbpqOILXmLAE0aX3ZmpUZ9uwtEXSKyuo/iT0uc2qtBRTO1buz4jdGMIMm4EHSpJVT64Uy47AWIEu/tooa2sqLV0dZ4DnRBjPHl3iP/5aPv4/51nT6lfkorRoCMQoNa8DI8TCOgGWZ38emAqO9JmKjYPSlvUuALFfbrjFCFhdZGoUq2Dkjx+YZJ9ibyXjyUcppoeevGRZWuyMZna1wgzc9rEH43S2FhX3F6Wq4CeMEc7Fq9+yoPfQj2Y26/zXsq3moUkw3zliI4XliW22pfmMjB9VzM5Xh2hwpg+SuWiFkij/HFG1m8qdyUverdiFYp4q1tZu8npS53qyz2cn99f0HkTzBCtHd+5rLk39TU3+Lbm6L6QPX7t+WecRedNGAOusKDhJqO8s9Af0MntE8EJ4tDUWi1/hnnjpFTh/x/dRSp7tke1bLfDWviNq07FGFJCssA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(366016)(1800799024)(38350700014)(18002099003)(56012099003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7gJBCJpx8kWyn1wt4es5GksA9XzM9hy5H6BjrQrgn1jAlmLO+d6Nbn1mEhQs?=
 =?us-ascii?Q?Nus38yOtxACHCls07c3eSvzftjaoPcaXHIylUMyqkgor49q7ABvrALnMrjoO?=
 =?us-ascii?Q?eylGMclP5/+2Ab8UJEQ++/IXWxdVRNkmjzf/2rjy061o6G20PGgtRkzNkpEs?=
 =?us-ascii?Q?N5OwSqLkH5nvPNLeWI7NlKxxpQBhhCaxL8EWwGj20b270NAPDbs+Wg5AX1td?=
 =?us-ascii?Q?YcIt1WQasrnzIQ20YL9z9V/DdK8C6Z+zyywrj372NtUdvkZLKUN/WfRCFLsI?=
 =?us-ascii?Q?iKG0uL+YxhIfaOGBlNYeLQATD7w1CMgdCWPOWXpd8n9VrZBCu7IltXD0fMWI?=
 =?us-ascii?Q?WQIaeU5n+I5V1cIifHZKc+oZuUa5u81yDAmmW8bgIV8ENni0zzJJacrZoW10?=
 =?us-ascii?Q?w2gIdebwPoOiCDwPbiDdwts/PY6ULd5KK1EjVVOmPPdqdM+9wewGivtihe1C?=
 =?us-ascii?Q?fgCpplZH4OZbehrqoDDg4w3Fqmh9HjBysZKUnqX3MH2y6IMc7KfynwgJ4vCJ?=
 =?us-ascii?Q?3VqXKsVRP9i5LwhfqxCMBJff3F1IMNwKUqRLTIHgfYOIxSYPjEZfIe0fo3qw?=
 =?us-ascii?Q?dSEm2czYJhyGk6yiC8DYSfE5RblrYwEdhnWJA88roPD0HVMPVF904eYotb4q?=
 =?us-ascii?Q?80yMyge2QFiVz0Hy12e3z5sHqmLs/hKpkpvPfBRREJJ/+8+N2lb0CqMv73qD?=
 =?us-ascii?Q?T58h7cO3CFs8amN5jwFitkvoHNE+532cAy2p0EgrVwVXHvfuATV+lyLgdhDm?=
 =?us-ascii?Q?8i2PJP5aYX3bUZwrwbJECvXQPEpMPKph7N8DhXdFip7uMLCBYBWV2yolSx/a?=
 =?us-ascii?Q?GoWYryvzOt2lZrvV/ojacC2YcJGePYptyRSx0euIiPeYYDhDSrDpeor6vBPG?=
 =?us-ascii?Q?gdLvlf1x8yhE0haPRIaeBv3LoEccj5Lf/dIQtSHwvK7+9DGlLiP7gKQBSUkl?=
 =?us-ascii?Q?zXzXDBt+8zOb+wsjsMlqXJG9+sBQkXGAM84ZmFyqu50T1MD1hSaJ0U1U0utI?=
 =?us-ascii?Q?M7fWBaXB6wKEbr+Koe8pFz7degtfbetj+9L7ln6i6adCMD/FyA6YkxFZNf+I?=
 =?us-ascii?Q?pFY7rxubWD1eSiFNPnd6Gi4j3zWrSFFGW3w/t8HNC94xF5kGuJ3Sl71KQMpT?=
 =?us-ascii?Q?AOCpoE9rzgCzBjSabopMF8dALvW+Tu2W7UrleptZ8hVV2fL8UdZUKPPMnWlb?=
 =?us-ascii?Q?49qL6nnfIilm1Ez2PEzkOp98qAdkoOJg95MUXtUOK24dX3FmBIrvjJmU58Hr?=
 =?us-ascii?Q?m46iYeeb5daMECwN3dk18hpIsRY1eZh7AqYS/Omw9Dn7Kte+mElYPPIDaWoh?=
 =?us-ascii?Q?w87fRabyZsyhYYU7D7G92sD7U8HoaQaPlwlYoSITAwDzz2BKdreCDw/yINkt?=
 =?us-ascii?Q?TcpVWwFudAzEklRwEW52GrStw4qRx15TcY5ASTGRRMAVwYesSfmj2WKeC8XZ?=
 =?us-ascii?Q?FIOt6HG+XWeJGHh2QTbvG8F4ViAVVrAOQKLgNe9XyVGMZnhMEGVAcoRgXUMh?=
 =?us-ascii?Q?rLC01sYC7HOLZ1oElgrkwWZfR85FbBGqOIYM1bHC5eoGtmTbFKN2uHtlbxMP?=
 =?us-ascii?Q?WmqR9Ioc9mpf9QawTlU66sa9eLYUvWQ0BBV+2ApthcCZLFwuUZu48Y7sNOPi?=
 =?us-ascii?Q?X8nVQG+7KzJG6JjuB54TqPtFM48/OoF2bfNtJWgHuYqU8ikU97HMlx/yfwUR?=
 =?us-ascii?Q?XzC/AvCU3MzheiVAqm4l9cBHfEuT4053zdZEqHU8fryiEMx6?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dd930ee-8223-4781-4d8e-08deb0783edb
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 22:46:03.5109
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ftd0FfJyFmSVmmpPQyIqa/e+ZT/A7WTXQDgcqA+ZuKyoNyL392TnxgG74DxPfgyy4S+WQUCjz4E5ah6Egbpl3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9922

Convert the Linear Technology LTC3589/LTC3589-1/LTC3589-2 regulator
binding from text to yaml format.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/regulator/lltc,ltc3589.yaml      | 147 ++++++++++++++++++
 .../devicetree/bindings/regulator/ltc3589.txt |  99 ------------
 2 files changed, 147 insertions(+), 99 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/lltc,ltc3589.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/ltc3589.txt

diff --git a/Documentation/devicetree/bindings/regulator/lltc,ltc3589.yaml b/Documentation/devicetree/bindings/regulator/lltc,ltc3589.yaml
new file mode 100644
index 0000000000000..f406c2bd252d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/lltc,ltc3589.yaml
@@ -0,0 +1,147 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/lltc,ltc3589.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Linear Technology LTC3589, LTC3589-1, and LTC3589-2 8-output regulators
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description:
+  Regulators sw1, sw2, sw3, and ldo2 can regulate the feedback reference from
+  0.3625 V to 0.75 V in 12.5 mV steps. The output voltage thus ranges between
+  0.3625 * (1 + R1/R2) V and 0.75 * (1 + R1/R2) V. Regulators bb-out and ldo1
+  have a fixed 0.8 V reference and thus output 0.8 * (1 + R1/R2) V. The ldo3
+  regulator is fixed to 1.8 V on LTC3589 and to 2.8 V on LTC3589-1,2. The ldo4
+  regulator can output between 1.8 V and 3.3 V on LTC3589 and between 1.2 V
+  and 3.2 V on LTC3589-1,2 in four steps. The ldo1 standby regulator can not
+  be disabled and thus should have the regulator-always-on property set.
+
+properties:
+  compatible:
+    enum:
+      - lltc,ltc3589
+      - lltc,ltc3589-1
+      - lltc,ltc3589-2
+
+  reg:
+    maxItems: 1
+
+  regulators:
+    type: object
+    description:
+      Contains eight regulator child nodes sw1, sw2, sw3, bb-out,
+      ldo1, ldo2, ldo3, and ldo4.
+
+    patternProperties:
+      "^(sw[1-3]|bb-out|ldo[1-2])$":
+        type: object
+        $ref: regulator.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          lltc,fb-voltage-divider:
+            description:
+              An array of two integers containing the resistor values R1 and R2
+              of the feedback voltage divider in ohms.
+            $ref: /schemas/types.yaml#/definitions/uint32-array
+            items:
+              - description: R1 resistor value in ohms
+              - description: R2 resistor value in ohms
+
+        required:
+          - lltc,fb-voltage-divider
+
+      "^ldo[3-4]$":
+        type: object
+        $ref: regulator.yaml#
+        unevaluatedProperties: false
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@34 {
+            compatible = "lltc,ltc3589-1";
+            reg = <0x34>;
+
+            regulators {
+                sw1 {
+                    regulator-min-microvolt = <591930>;
+                    regulator-max-microvolt = <1224671>;
+                    lltc,fb-voltage-divider = <100000 158000>;
+                    regulator-ramp-delay = <7000>;
+                    regulator-boot-on;
+                    regulator-always-on;
+                };
+
+                sw2 {
+                    regulator-min-microvolt = <704123>;
+                    regulator-max-microvolt = <1456803>;
+                    lltc,fb-voltage-divider = <180000 191000>;
+                    regulator-ramp-delay = <7000>;
+                    regulator-boot-on;
+                    regulator-always-on;
+                };
+
+                sw3 {
+                    regulator-min-microvolt = <1341250>;
+                    regulator-max-microvolt = <2775000>;
+                    lltc,fb-voltage-divider = <270000 100000>;
+                    regulator-ramp-delay = <7000>;
+                    regulator-boot-on;
+                    regulator-always-on;
+                };
+
+                bb-out {
+                    regulator-min-microvolt = <3387341>;
+                    regulator-max-microvolt = <3387341>;
+                    lltc,fb-voltage-divider = <511000 158000>;
+                    regulator-boot-on;
+                    regulator-always-on;
+                };
+
+                ldo1 {
+                    regulator-min-microvolt = <1306329>;
+                    regulator-max-microvolt = <1306329>;
+                    lltc,fb-voltage-divider = <100000 158000>;
+                    regulator-boot-on;
+                    regulator-always-on;
+                };
+
+                ldo2 {
+                    regulator-min-microvolt = <704123>;
+                    regulator-max-microvolt = <1456806>;
+                    lltc,fb-voltage-divider = <180000 191000>;
+                    regulator-ramp-delay = <7000>;
+                    regulator-boot-on;
+                    regulator-always-on;
+                };
+
+                ldo3 {
+                    regulator-min-microvolt = <2800000>;
+                    regulator-max-microvolt = <2800000>;
+                    regulator-boot-on;
+                };
+
+                ldo4 {
+                    regulator-min-microvolt = <1200000>;
+                    regulator-max-microvolt = <3200000>;
+                };
+            };
+        };
+    };
+
diff --git a/Documentation/devicetree/bindings/regulator/ltc3589.txt b/Documentation/devicetree/bindings/regulator/ltc3589.txt
deleted file mode 100644
index 8010530361465..0000000000000
--- a/Documentation/devicetree/bindings/regulator/ltc3589.txt
+++ /dev/null
@@ -1,99 +0,0 @@
-Linear Technology LTC3589, LTC3589-1, and LTC3589-2 8-output regulators
-
-Required properties:
-- compatible: "lltc,ltc3589", "lltc,ltc3589-1" or "lltc,ltc3589-2"
-- reg: I2C slave address
-
-Required child node:
-- regulators: Contains eight regulator child nodes sw1, sw2, sw3, bb-out,
-  ldo1, ldo2, ldo3, and ldo4, specifying the initialization data as
-  documented in Documentation/devicetree/bindings/regulator/regulator.txt.
-
-Each regulator is defined using the standard binding for regulators. The
-nodes for sw1, sw2, sw3, bb-out, ldo1, and ldo2 additionally need to specify
-the resistor values of their external feedback voltage dividers:
-
-Required properties (not on ldo3, ldo4):
-- lltc,fb-voltage-divider: An array of two integers containing the resistor
-  values R1 and R2 of the feedback voltage divider in ohms.
-
-Regulators sw1, sw2, sw3, and ldo2 can regulate the feedback reference from
-0.3625 V to 0.75 V in 12.5 mV steps. The output voltage thus ranges between
-0.3625 * (1 + R1/R2) V and 0.75 * (1 + R1/R2) V. Regulators bb-out and ldo1
-have a fixed 0.8 V reference and thus output 0.8 * (1 + R1/R2) V. The ldo3
-regulator is fixed to 1.8 V on LTC3589 and to 2.8 V on LTC3589-1,2. The ldo4
-regulator can output between 1.8 V and 3.3 V on LTC3589 and between 1.2 V
-and 3.2 V on LTC3589-1,2 in four steps. The ldo1 standby regulator can not
-be disabled and thus should have the regulator-always-on property set.
-
-Example:
-
-	ltc3589: pmic@34 {
-		compatible = "lltc,ltc3589-1";
-		reg = <0x34>;
-
-		regulators {
-			sw1_reg: sw1 {
-				regulator-min-microvolt = <591930>;
-				regulator-max-microvolt = <1224671>;
-				lltc,fb-voltage-divider = <100000 158000>;
-				regulator-ramp-delay = <7000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			sw2_reg: sw2 {
-				regulator-min-microvolt = <704123>;
-				regulator-max-microvolt = <1456803>;
-				lltc,fb-voltage-divider = <180000 191000>;
-				regulator-ramp-delay = <7000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			sw3_reg: sw3 {
-				regulator-min-microvolt = <1341250>;
-				regulator-max-microvolt = <2775000>;
-				lltc,fb-voltage-divider = <270000 100000>;
-				regulator-ramp-delay = <7000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			bb_out_reg: bb-out {
-				regulator-min-microvolt = <3387341>;
-				regulator-max-microvolt = <3387341>;
-				lltc,fb-voltage-divider = <511000 158000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			ldo1_reg: ldo1 {
-				regulator-min-microvolt = <1306329>;
-				regulator-max-microvolt = <1306329>;
-				lltc,fb-voltage-divider = <100000 158000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			ldo2_reg: ldo2 {
-				regulator-min-microvolt = <704123>;
-				regulator-max-microvolt = <1456806>;
-				lltc,fb-voltage-divider = <180000 191000>;
-				regulator-ramp-delay = <7000>;
-				regulator-boot-on;
-				regulator-always-on;
-			};
-
-			ldo3_reg: ldo3 {
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <2800000>;
-				regulator-boot-on;
-			};
-
-			ldo4_reg: ldo4 {
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <3200000>;
-			};
-		};
-	};
-- 
2.43.0

