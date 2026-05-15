Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010061.outbound.protection.outlook.com [52.101.69.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5D748AE1D
	for <imx@lists.linux.dev>; Fri, 15 May 2026 15:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778857629; cv=fail; b=OF7B7KmB/A9UwPTiQBrlGD+4/Vw2RQL/YSMmWrWhTg2iPqsAiK7XX+De1BiWP9WMXoYpTee+umvNuJV1W30oM3rchjPYri2Yki4u7WDx03Pe3vnsjNJS0mOSib69Ik/h1exJ5Wy7GXSSyI37cuCeaovuHh3TsRE9azQsXz4xQxw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778857629; c=relaxed/simple;
	bh=/EMdTJ5+L2gtcwzBXvUd6MQW7XEUHKUD9eJu9BcirH8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=NDAWuqb04NWWd3iXiFsiCQ+Fa8cJ9nS76oh6LUhug9AfFYdyIF1VMR2/dUyqCIEer4maTTOhOaZgoX7ILHOFc6XJpVk4AILD2y6MZkWNi+VG3vilAj8IdHlAKUidKyYPyKnKbsIfRqmuHm4Fwy7zWvXoUVEAfH+64masxdDzc3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tV1Z3hBn; arc=fail smtp.client-ip=52.101.69.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tV1Z3hBn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YiD9UB3nLWJpIyVMB/1BYbWLVsEJLn5oPP/Huj0LnJGBYWiNkePJ6FevoOG/8VCIVZ86FBZP3BZSJ3dSxQwz2i7oQ0bVYPsGyTM7bGKBwUy9cm7zJm/TSjMRuj4WnIogfJCS3Bp5pEE2cephWIkgxYA8BZKSSxbUSr8X5enqN+xkp9NmUIl9ozngLt1XSxin+y9tTXt9Vspl8/obfNFhNHxmW2MyeZFB1aNJw3VRpz8PzytPHj4X9nBicyt4LtzhNBtJcvOGylKy+bF1+I89OKSRdInePWeo4d7oNkGk9GiHCKodagyXTB5BsrJizDfLZYrWZ6K+BESuRjAGG4WE6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fqn98K0Hz8FOz+wY7zW9osg5Zl0v0IpphaDp62qkow=;
 b=gUhxSC0Y2FsrUhi0Os6YHV2/vyMRILkiiYsqsPlBQ2iCg0O/IzOLevCdm0rlZtahh3b4rN88CqsyVI7xcv/TZguxl/mjNQcI8fgnNcjSNyRf5iiV+rKasqcYrX/GJr3NxdPw9clFY4PVqRZPYm1CBFbii/y6SUMfMHV3dmFLL2Mar8xuVCeuu/iVv4wb3RJscBPVwIF8CekqTOhsAnW7vnsk+N8riwTnAuxO06avTt6b5fgNCNpOi2kyvyI39pn5L+DLemKeEPHLcKhXse6E7NcgJcYZnFGD6Bz/DGEsYvtlki22Pw0MQJmkMIgo8ExlHW9Iq1GORQyvaNgQQWvKwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fqn98K0Hz8FOz+wY7zW9osg5Zl0v0IpphaDp62qkow=;
 b=tV1Z3hBnPTnko9l4P/lZJP21/W7efChpytyAcnLNMgdI11m/lS+cmuCwvGQSiHHvWqVtlBfLp3yC/aI31VLwkfKT8dw1gAQDSezXfpn/94Lsyj5kBU6tLNGI+6jqcO2kTZHAxOhDnDZzOvfDefmoIuxwWu2po6jUOgK6vnS6aBm1Rtm/qSELg6J9efihP2hUGyRtkp/AT3lP+MXnIVqDcZSIobxz0ompN49UKqlzFfoZT8zHVQvTjy0yrzIR+e3Crtsx7d6LILEMyq+RNRuUy0i/bgEEVvFOABwHZ524JwBBr73fN3q6dkcNbx5lCjv8k+TbKTfYM6NsdBmx7/+ACg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10512.eurprd04.prod.outlook.com (2603:10a6:800:213::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 15:07:03 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 15:07:03 +0000
From: Frank.Li@oss.nxp.com
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org (open list:VOLTAGE AND CURRENT REGULATOR FRAMEWORK),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] regulator: dt-bindings: convert ltc3589 to yaml format
Date: Fri, 15 May 2026 11:06:54 -0400
Message-ID: <20260515150657.1731008-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1PR02CA0017.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10512:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c8df099-dac0-40b1-7399-08deb2939ef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|19092799006|366016|56012099003|11063799003|3023799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	iNU3lhiS7z0Ejqtd1dYjfc+fp4Iia3o3QQKd7OON3Gz9Ryhjc72U7c1fIMngR/W4VCrS50aji+GnOFXd2IpuGnzk5gVOR2d2lVwUYk7Kc/+hdRCVtjmmb4DttIuDelTxirO5FMobenpCkJgESRGMHOjQfKJgXtkonNPtPgGx070uzde5Y+N5qDyLQw8o2OR/2y/o+pyxOw+E488DUBf7erXmxYumIiiCJlPCKHUrWQZBXoZEzcrCGMBpIO63KpRjJ7zb/LVwsPhRQMipDqw3/QAl7yxZKP8jwUBIKuAeazfS9dFpR2EiI/vwXDdIKWYGKVnD4APy+GAUGG11YY/Umm24LfT0AU5lxuzukwFRxYjnuYlivp08oRDiSc0iRS+88vC7Wp74IqPkziaK0WeuM3aSOm1CjSahgGdfIlhSGmSSti4ykCOS4CicDKvj4Jn54F4ni//NJGe0K1d77BV7iTQcAzKJSLRyxPTB7GFiIZ6mcsN0dVvFPbaNANVOKVm82Yvi66zX9ijL6JeSAkTMtcbvGm3czKtCVsWiV1eEU40VqxBTdhl1F3uxCqYhPV446n4wB9JaKTiNsDOYgZvK8s3qMXoSenZ3CRLpsOfqza6ylZrNelM8JTFS8OOyKqpdjqp7WJyMYsI+P1dZnf7jTg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(19092799006)(366016)(56012099003)(11063799003)(3023799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?CpnbDNu9sJoc+9f9ssdNcEjhI3MmvbbnDf7kkn2GVcGM32lCx6j4KpRtHib1?=
 =?us-ascii?Q?P+Z74L9hr8Q2nV0L1bGoDquf82hBaLOWKOvyXDriAu6xhBbDQgl7QefSN6jb?=
 =?us-ascii?Q?I+OF5uvG3Cs7rCBXCMK6hr2ZQVoQuVnwTYpC05dVWAx4nXqOzqwYATGHGULo?=
 =?us-ascii?Q?x8lC2HGbCP1hnMX0eRcU57WdWOBJAaWWp0S3q5ax5J26mmJkwgk1yL+G/7jO?=
 =?us-ascii?Q?/ikoyj2pPu/Fulhs3nxvHIwduxSCqPtgIUSXXqLkaXlTYeCB/02yHLlQELcV?=
 =?us-ascii?Q?TvfQtp+PocjZvy5Is7pJLDrN2J8Oq7RmYDZiraJKZXjYs5IK6KHwwCC/1mt1?=
 =?us-ascii?Q?Z98fY/DWgPZyaumVIz1soROrKCGsAq0q/0EOUGEc7N+hIlTSYitMlR/IzVyn?=
 =?us-ascii?Q?Fc6WQEq7KOGvrPgFfU7zGfa3XhL2RbK41g+0p6o0lOHL8J+9h+jU+hbLzeuE?=
 =?us-ascii?Q?5MXQPoWBSftQlQ+npnOB4YqDWi22PnNxbN3u9Z3HMTPrVZLvjG8NusWx13OE?=
 =?us-ascii?Q?mGGBb3dngiARDgB+i/TvtUSWdPfOQfQFwiCH2mTIWg+qJEjD/1p4E7cOR5dv?=
 =?us-ascii?Q?6vgMxgEdilLg2PvaXvAgLFzFEXPU0n3JMk7eqS7iU71QSVURJXLwhnPJzi6W?=
 =?us-ascii?Q?bCloGVqlG1ftMTFG4iIg6UOqW6Buq2GGcEo8gV063Z5JH8SJbbSnUi0qtaLM?=
 =?us-ascii?Q?6G17Kr3oYDWTGQ/Z2IiNHxFpjx1nDoVk+4kxglrRbwrv07Uorosy/lZUYk00?=
 =?us-ascii?Q?nl540aJqrh9g0UfoJ4n59vZetQpAKQwCRX0hndVOnH0DX4HZtRkE0dmFDjHd?=
 =?us-ascii?Q?zohxx2XDmo3jx9U1bMU62Jw/VP/wb0BnSGBNov8rpWlPJ40uIjYH3YyU1+vW?=
 =?us-ascii?Q?D9MiZFRPjZIhzzkTKqfracryHHvj/dx0XEJS0jiWUXppxGz+EEgCus3/fIRD?=
 =?us-ascii?Q?T05dvTn0Nh7sZuYKO1IZ4PRhPzZkLIHx0gWPcgqpM1HG2OMqZ3GVEGUvWjuX?=
 =?us-ascii?Q?X+Oi2Um8kORrtt1YrQSm1bK4YdZphAfBA2hzOBLtcB7YOCtCqK7I4xG24xmS?=
 =?us-ascii?Q?hUIU2hlDr27Znh50gfEoiJ+TM2m5uuvjDuuNioVrl5GSqy6Cvc3GKPJJEp+y?=
 =?us-ascii?Q?KCunqYLU6ZqiMam7CilCWl+KU+LfRvPSNORkkVZyK4bCyl+dsGIrDhz4A7DX?=
 =?us-ascii?Q?dyJY8XEJbvjYzQ9yPPOGKugJyLeN8tJ1gBygsxtjOep98x+XGrWy7hz6ikTb?=
 =?us-ascii?Q?oxEWssfjRIVI/p/aKqmCIB8r2upiir9J7ujE30mwT1S8IlFiklmhNu8Raflx?=
 =?us-ascii?Q?fT/juQXo/ewdrQkQok9WpCDDYIEOV1EHujBfWJ/mQv4THUf22l99roL1ZqKD?=
 =?us-ascii?Q?iaCwNM/n7Z2Rba382Mt4RzdrJstOW/z8t+NYlFRWaAtqaNCEZ9tWBNVBzqqc?=
 =?us-ascii?Q?6MMyb2oToIavVonLbO3OcKlLuYtUKn36mgb77N2kJB/W/uLdNse8SyomNuDw?=
 =?us-ascii?Q?bBNm1AvGaBLNMzRXgndmzVZhakZDKk6KM6O84LAQlSP21vRr4WET71Z00CUt?=
 =?us-ascii?Q?MKjUxbcYCy3rfSTvE1iv2ajC8eaYgYt7Z/k2mC3C9E9uWQxqqMUnkftU+6HV?=
 =?us-ascii?Q?PY8lQS1BwsNkCgf0rIbj2j1sZZugjMWdcIAsXzxQzfZrHnHcjjZaOGp6+qJZ?=
 =?us-ascii?Q?dJ7C/V42UIQGRo9WgpVSYz1t7hohAdZ+WlguxaLxK+JRp2Z5D1ydtPH5n0TH?=
 =?us-ascii?Q?AZFFgnoUjpoE5O6pcijNS/FgBGd8WS2weas2t3W+cOZ2cBSLhzny?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c8df099-dac0-40b1-7399-08deb2939ef9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 15:07:03.2067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sFBNyON4cTLoNeNllMEVYKR/3T8Iptq6VwS8dxoxz0U55xUvLqfqp2elEYfIt6AXPoSTbqi8fP/ld/3S1QOVvn0VQtIBldCV+m9OVAYtLUihi/LOSAsE8izw22mX51oU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10512

From: Frank Li <Frank.Li@nxp.com>

Convert the Linear Technology LTC3589/LTC3589-1/LTC3589-2 regulator
binding from text to yaml format.

Additional changes:
- Add existing optional interrupt (drivers/regulator/ltc3589.c).

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- use regulator: dt-bindings:
- add optional interrupt according to sashiko ai result.
---
 .../bindings/regulator/lltc,ltc3589.yaml      | 150 ++++++++++++++++++
 .../devicetree/bindings/regulator/ltc3589.txt |  99 ------------
 2 files changed, 150 insertions(+), 99 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/lltc,ltc3589.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/ltc3589.txt

diff --git a/Documentation/devicetree/bindings/regulator/lltc,ltc3589.yaml b/Documentation/devicetree/bindings/regulator/lltc,ltc3589.yaml
new file mode 100644
index 0000000000000..a95449055bba5
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/lltc,ltc3589.yaml
@@ -0,0 +1,150 @@
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
+  interrupts:
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

