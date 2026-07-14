Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011003.outbound.protection.outlook.com [40.107.130.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CCC4ADD86
	for <imx@lists.linux.dev>; Tue, 14 Jul 2026 16:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784044928; cv=fail; b=I3AIg4f/inb/VPlIDB2r/sgR4r1ESgQqum4mfDLAMoq+kTHrONkkxXuwm2Efccnrbd6SwCgjwDoTJWO3wDjn4xK7H92vwOFNOyhk9e04TLuqQ7NALXfW6E+lOd80ahgKDXB2SKLx8cVgri3AVyYg+2WK24ZTySq5i3IoYWkk0qs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784044928; c=relaxed/simple;
	bh=kxaO5ggiMCJWop2JOyQ0skuunkOSZ0UiQaUZYGlECQw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=r3R2Rc5N3V4M2IcSi6w1gFddiYP8sCk0kNH3r3xphigzA15uBejkprRs/TZ69fALw+t+PZWbWQkA2nfeqA/R+iIB9cI7lk7DjTrmIWB8xjt8ujMQaH6XPuRzD79ViOJMujWCds898+nhphj/7xfvArNTULmNfPsD5nUgP5gdUpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ay2sOErr; arc=fail smtp.client-ip=40.107.130.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ay2sOErr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yrkq/lf4fPMSRLm5FNxqqONN0Z0cN/0lb8amSDrsElvP8wFBISi92qsSo93TCy93nAd7hHzOxW/SyORyCJhgXjWDAtyd6Tb9WbEL7+SoiQBBucC/SlW1wO1zxWK1yGuKYATz/4l7cKyJyupBFEYSdSwRqsoWA2KozJMdjtNQhCklvwWiK33Ea9FggqOOCwSTgjiVRaW1tRjIYZ8XHvgeXjGjA61opsIKbAcmIjAP/rlpH3xRNyeHXFe2DRMKFuvzYjOstDxP3pnMpAG9FNPUro0pXba+lt4pZKhUWcA27BnvJ8w5TMiyZY1RPuRRcL2qTyV95w1WR0nVzdNUgW7KXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rY0gqXq/eTgE5y5KJ3FBHVZfY1b+7JYut9w/uTh+x2Q=;
 b=x1/cR08LEqBuVIAqZFYOy2mRsN62ZCfMdt5gz7YIzkF1XU0zykAJG6nxo6px9+ubF+3o1yKfIfW24U6kLvbjDcXIuU9JePpmFjtba2xhveOd0vzIvMvWlCmXHTaE4B0T9jLLEwjEGahODCIjg7vAN96KvHN3DZ6JUvwuYj7vY/yXHJ3dy2kYSe4cNBu6WuPS144H1MjCZYZ/vq3Xl5DqVdg8o/Xdeydz6nlt02JeM+9/6DNQrTSGRxLIcCDWiMuD82Se+atC53dNZmPyj7K5pUphLeqAxegfx88JlRz0IBn2gDSTiV6IoTVziVeOiGIocKfVtkmw/avi9NEhIgm6GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rY0gqXq/eTgE5y5KJ3FBHVZfY1b+7JYut9w/uTh+x2Q=;
 b=ay2sOErr/m6MtOJVj0NVoytUE0wf2wvLeOKagocuv4uo6xDmQXLmSQIpJAFdZsmRjjaUhoHJ31Lzq1cCJ1gktgGopvb6Ji7gGtd3tJDyIgwtw7DQDCRjqXEn5L9FFb3AayOnV62UaQERUUwCO8EiCrxN79lxMErY+75Cm/vVY162NtKjdknp5ht6d+4uSNu/d1xR6kEkg4X8x49tK/BZWhpFNW1yH8jPIPmwMQ0iZDYleSQIXQdzXfHXK1auBTF+JzELEhrulHhC/I43tacQmLMN4TpAQgsJecEb234ep/PX4D1KvqtsWLmYzNq+dREcdE/pqyO4XTdSQ+pZ11waAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB9787.eurprd04.prod.outlook.com (2603:10a6:800:1d8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Tue, 14 Jul
 2026 16:02:01 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0202.018; Tue, 14 Jul 2026
 16:02:01 +0000
From: Frank.Li@oss.nxp.com
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.li@kernel.org>,
	linux-kernel@vger.kernel.org (open list:VOLTAGE AND CURRENT REGULATOR FRAMEWORK),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Cc: imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 1/1] regulator: dt-bindings: Convert ltc3589.txt to yaml format
Date: Tue, 14 Jul 2026 12:01:45 -0400
Message-ID: <20260714160147.1641379-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR02CA0025.namprd02.prod.outlook.com
 (2603:10b6:510:33d::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB9787:EE_
X-MS-Office365-Filtering-Correlation-Id: 8dacca66-7b8f-4e02-c7e9-08dee1c13dd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|19092799006|18002099003|3023799007|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	UeCbAqioBwgKIDNL2KqVp5dX4MkTx8XOUN/GIK+N+U994iASksz0EMK7q3Zwz7805McI0x1qggbrP8M1GP+FaVS52ixa5Qy5pnuEwLlm6LcQqL1pV3cK23SFXfE7uFf4vMGHNVX3H/kXMnwPSOoUngFjPlPqrns8Jj9lm31DF78OqTCr/iNKwOKP7K+TwHFwo/fmvcOIqHvNv2gymv6nresFdkHeLEGCX/8UdQaZbmwvRgdzTOCzMhdYU22Ykq1Yd/omc1phnd+/kzalSfnzBWuQpU9qgQBOqbLm6pA1+oG74oIZ+Hxm4XX9haBK4PZ/PPXhoXhVk8lD5cKVtexIU12m27dRkF13IZfCy68zHcIKpOnOHt+XJfFUKZnwSZfCnGY5Pm2Dn008DmEcdF1UBPlcx7dNfaOHmw+MEHh/syrL+Bmye17IStIc8Oaj3X99cwNTQN+USTCHIyAPlGw9mZDrssTnGAYGKilmSDSscnO2mmuwX1ZB9lG64Onst792O2ML8lk83RvOF5KHp2+EgkKcGUv0d36TtoyZu1cYBayCTgH6lqZC/IiXfKLtLeN0RjpNAIj8SlT1wDXxFuvLI50FwiwDVR+fAaSEeMpbI6By2lTki7VwvIayJmUKcNnN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(19092799006)(18002099003)(3023799007)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?u0N03dbjkDhYA0r4IZgGPGkA1YJ1v/xOy696sLx/U2Xue55LYKRd+OV+1Kgf?=
 =?us-ascii?Q?hGklCiqEPuYJeu6Gv2Elze+mKXV6qqQzexpR4cDbWbKW38VAzvovu+zGreKG?=
 =?us-ascii?Q?Z8dwU/xid2gNjZhImZYicb3UeGwi7B+4kCUJoWmBaTduFksPWaVojEve7QeY?=
 =?us-ascii?Q?HTlQYCtieiqY137BJAHWI8eIHpQrvsvJZPDmdUdPZ0wLo7DjMgJhMleHVjFg?=
 =?us-ascii?Q?dkTqVvrB4nxXq/BZ7TrHywKlUl+7P8uWXeEd7dPB+Uf30qXa12zBvtsn6jAe?=
 =?us-ascii?Q?3zrfJ/CGKRTDLcuvRuiKSU9NTeCpLlEUidcDBh0PPi0tAGVJ4ml+X3LHUJaf?=
 =?us-ascii?Q?y05sr2/NELK+1AZVOZvj46VzD2m9pj0X2js/3HompmT3oxnj0KatgIxo6rSv?=
 =?us-ascii?Q?yxKCd8avjYTDXN79CibKgW9hMT34m36QNqWI9sBIZJsMa0vkA3y0iAm4+H4t?=
 =?us-ascii?Q?RxJMoYuqRBrKGhixDsbAMvUw9ipUulaQqUPIai9JLsR8erZKtDmhUDcsdV8i?=
 =?us-ascii?Q?BdM4gA4JxWVH02bfhSW+wY7Nqj/znVGCqxtrczTIqZeES4HMhUNER93J0h2A?=
 =?us-ascii?Q?q3RlT03zhW3ZOMUViiTd/wjlDBRIsRfjJzVd0SP+yQMw/gBJc4WHthR2Ryse?=
 =?us-ascii?Q?OavFpala48qJ0hTQy+cFrQwf5JhC9vlqhQ2aNLiXhA0KbpZK/N5PBncR59+s?=
 =?us-ascii?Q?Y+nWUEnHQLpP7QhJGBVC7HMuUXNxeQr0tmJEOnzs/k5f6fDCVCQALHFSQKI0?=
 =?us-ascii?Q?YuY+rtdi15i89Y8GTckSfsdGlZ0UQkmNkHwAPVcY5tc1uzbv0G5fr2GLwiQP?=
 =?us-ascii?Q?jiszCXEPDdDq9itsvuARn0GTShgEQeCmgihL3g9Zo0CbyJ4DvEfODGsW11Wo?=
 =?us-ascii?Q?TJvgEyBN4Na179jXiamBVoXQzfsmu1YgHRN5rAcn70JFF1wRpOfCFIsbtxEI?=
 =?us-ascii?Q?JKqlm/p4ZaDbzkXaKsIePeSXmQ3k9lFEjEukDsLg13cUMbvaVPzcXqtuuGiJ?=
 =?us-ascii?Q?4JpjW9j0ejnFAkJxYQnph5bKy1qkQxKUw4XgzUqeZv7Yjqnocz3/nbd/6qiQ?=
 =?us-ascii?Q?SqVnxy8n4JGaTp7LRBDb90+RCNlr3udIe5+9u3Kk6OjCldmPKdTY+VXoXFd7?=
 =?us-ascii?Q?86h5Xn+zDAcNsdO00Q5s3GCx8YRxgnlXuQIy/9+Uly2R9Nc9gI2jsdxwv3b4?=
 =?us-ascii?Q?mk8Q+AzsUfYb2isAhGHxnzoAh3otVyClL7b8X/hUb7xVr5nwr3KKK8rasIWi?=
 =?us-ascii?Q?oOjyF/Cxj3qlV8davt28runb4pYLVlHmlw3IGJfGek/0Teyt1ov+p+9W7x8N?=
 =?us-ascii?Q?RroA6Pv0pEML4I87KICR+6hqdExRrS3vef6DVY183YEL8jL/PXIroABeb5Gc?=
 =?us-ascii?Q?VZHdJn42qs1MPv/p3WqYkfxSH2Zr6UdAOA0tjkf2pbYF1V+rA3UkYMJHzvKS?=
 =?us-ascii?Q?SBEf0IF94JaSn3oGtN7BZdK7hMQNq8gq33S8G7d8qtZtu35ABz40u+F3UIZC?=
 =?us-ascii?Q?LvI4X5uNqhcOcopF8i36Ps2W2w2aN1JQmFD7LlleS0XRncRIZGtJPMoINWE0?=
 =?us-ascii?Q?k3/rhziVoFbG5u7T68mAOTJzQlYfWBSsa7sJKzF3R4l6L7U5D+NhWwjtD9g7?=
 =?us-ascii?Q?q/d2Z9zaj7CExK2XQEQCfD88Ynf/Es3WSwYduziR0P5ZEe542innNQC96NDr?=
 =?us-ascii?Q?5dpmWd3YhFPEokxYa+Q33nxiroePgiGEAtN5V4CKKmjojNITpBc6+jebMUjY?=
 =?us-ascii?Q?fh3YEqTpsgi6u1YXF0MW1temDpVAiH7eY0U+OauEtS8UNw8x7COY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dacca66-7b8f-4e02-c7e9-08dee1c13dd5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 16:02:01.7685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R070YeW7J7aGmdHawPsH/IazuyXEtzifBQEKhAn1MOfDBat1x2LsWnAjLAizyPk8BlkLc+3Lru/5x72tJRAUKcQfpebsk+FBJfcdg8RjxxIaSNvt2tMSaCHoMVGAG0G1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9787

From: Frank Li <Frank.Li@nxp.com>

Convert ltc3589.txt to yaml format.

Additional changes:
- Add interrupts to match driver code
- Require lltc,fb-voltage-divider property ^(sw1|sw2|sw3|bb-out|ldo1|ldo2)$

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- Add interrupts to match driver code (report by sashiko)
- Require lltc,fb-voltage-divider property ^(sw1|sw2|sw3|bb-out|ldo1|ldo2)$
(report by sashiko)
---
 .../bindings/regulator/lltc,ltc3589.yaml      | 149 ++++++++++++++++++
 .../devicetree/bindings/regulator/ltc3589.txt |  99 ------------
 2 files changed, 149 insertions(+), 99 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/lltc,ltc3589.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/ltc3589.txt

diff --git a/Documentation/devicetree/bindings/regulator/lltc,ltc3589.yaml b/Documentation/devicetree/bindings/regulator/lltc,ltc3589.yaml
new file mode 100644
index 0000000000000..2c2755bb84ebd
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/lltc,ltc3589.yaml
@@ -0,0 +1,149 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/lltc,ltc3589.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Linear Technology LTC3589 PMIC
+
+maintainers:
+  - Frank Li <Frank.li@kernel.org>
+
+description:
+  Linear Technology LTC3589, LTC3589-1 and LTC3589-2 are PMICs
+  containing three buck regulators, one boost regulator and four
+  LDO regulators.
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
+    additionalProperties: false
+
+    patternProperties:
+      "^(sw1|sw2|sw3|bb-out|ldo1|ldo2)$":
+        type: object
+        unevaluatedProperties: false
+        $ref: regulator.yaml#
+
+        properties:
+          lltc,fb-voltage-divider:
+            description:
+              Feedback voltage divider resistor values (R1, R2) in ohms.
+              Regulators sw1, sw2, sw3, and ldo2 can regulate the feedback
+              reference from 0.3625 V to 0.75 V in 12.5 mV steps. The output
+              voltage thus ranges between 0.3625 * (1 + R1/R2) V and
+              0.75 * (1 + R1/R2) V. Regulators bb-out and ldo1 have a fixed
+              0.8 V reference and thus output 0.8 * (1 + R1/R2) V. The ldo3
+              regulator is fixed to 1.8 V on LTC3589 and to 2.8 V on
+              LTC3589-1,2. The ldo4 regulator can output between 1.8 V and
+              3.3 V on LTC3589 and between 1.2 V and 3.2 V on LTC3589-1,2 in
+              four steps. The ldo1 standby regulator can not be disabled and
+              thus should have the regulator-always-on property set.
+            $ref: /schemas/types.yaml#/definitions/uint32-array
+            items:
+              - description: R1 in ohms
+              - description: R2 in ohms.
+
+        required:
+          - lltc,fb-voltage-divider
+
+      "^(ldo3|ldo4)$":
+        type: object
+        unevaluatedProperties: false
+        $ref: regulator.yaml#
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

