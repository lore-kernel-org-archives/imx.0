Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010046.outbound.protection.outlook.com [52.101.69.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A532175A75
	for <imx@lists.linux.dev>; Tue,  7 Jul 2026 21:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783458991; cv=fail; b=uXhznhVyDAfFnjFWoZKbDutf9JnEVwcTUGpovuaJC7d6HP+lpoV15WwxighGo/I+eRB7Dz14OJhat97vDlQRAF15Iw4DU1gjWK5vKRPe1E4aMD9QtkwRj/LtCqmY2F0kI8HOGoto/n0iqswRSSSpspbV4OoUsOAjnu/kXoZTrV4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783458991; c=relaxed/simple;
	bh=zRUhrEg4zritCA6lczZHyfqE5filPp3qn24QDVoSf6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=cZVSVkoEZboMbwTamhgr3wxRYJFvofBaKRvrBWV13QByX1hv7/6FgmX/v4KGTDxH8RmbDNVL81qXrzSgP/SYWOjdsubz9BySutVNAT9HQMxRMtZ8FqCRLxDapko1YLKIzzb/2E3ElPdujOxJGcWQmZ66XttqEc92ZqY3WMboPt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bQNp3CB4; arc=fail smtp.client-ip=52.101.69.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bQNp3CB4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJn3qKYkOdT3aKBfjU8BArSNqNBihe8DO/Mm3nVSaFZzIvp7hVCtFgxsXMtZEDrzuKGgNul/xr46NsJXPIg20jm4kazTOAbsvXrEVVSjuo7CyirEjJ7ZKJCfTPddFVBySwZ/4C5uWauptIGNOmOh0b+l6+OCfNCRMuI7JAei+VT9SfgfKhhn5rG0q4Sf7loq9YJtjoUxLcd3eP6UL/EoKJTx5cOLdgbKzsXjLF6lyYdOFbo/pkz01c9f9pakXHmrwFPyuUNsEshcWzw1u4PTHY7c4ONSSO+jklImsK4KkwUoAWQJAbJWwfcbCFTpwtj+U2+jwEFzEU+LWIR6l0Lj3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RFvMePG8Oh+Lrkprz4/C5WyBmkpKf8UIf0Tqy/dQaXE=;
 b=XGHJx7lBpw4Pso4pU/2gXai7/5hEkCuBN2sGmWffpxLU86jm3vi6r/0sRe2xGIlTVGs5+oAlGmBXmg7gz3s3AfwN1MFHzJNxe5745zbaW2LZexFJLytuD3kl/yH/I2Qird2NWrjWRdRIsh+WsrpdnsznAqp3k5SzuIi9byvsvOWAyy1Z435J7wUM2MCg+ZHMOwOGW+pAhtCAnL5Pg85zQUfpdxOcUbCPIr7PTqWjN4gWybUUZNDmS+x921GTG1HVHj5rlGtwwFVYSigm2m7S+jABYPIOitVVSVXmTlYwgBPzxZk4whFyNvNY57sm1PQtwFdwYYmIn1poM4OsHBMWYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RFvMePG8Oh+Lrkprz4/C5WyBmkpKf8UIf0Tqy/dQaXE=;
 b=bQNp3CB4GZTVUTN+0nrVV/vOYxbz+de/XBAKxm/8PFedEg5vFKEKNMAtiK/QM3h9gmYuOLAK9nP2NiGFwudI8YULKcyORVvwA73trPi7OXxgc6cjhbyA2bAQtH9KMB4aY4f5J/RI1OG36ONgeYE28PeE4EQgVjBWFmU+7gXSTs6PaWeVyXuZ4RaokiiUVD6LJbKJPylOP8JdW0eX37L2o1PhHYpRRQssy8ISc7Mp1b2I1CzknRj+ebA9e2yk/7zYrEMwVj8v+hsP3wKsyqNfCWI5fF6FSNcbopkkLhMnvrKlnxrWpUsXYFXx64368zwJ8bQ8wYgn+j3QlNkB2s6TyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB11573.eurprd04.prod.outlook.com (2603:10a6:800:2fe::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Tue, 7 Jul
 2026 21:16:23 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Tue, 7 Jul 2026
 21:16:23 +0000
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
Subject: [PATCH 1/1] regulator: dt-bindings: Convert ltc3589.txt to yaml format
Date: Tue,  7 Jul 2026 17:16:09 -0400
Message-ID: <20260707211612.2757349-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR02CA0031.namprd02.prod.outlook.com
 (2603:10b6:510:2da::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB11573:EE_
X-MS-Office365-Filtering-Correlation-Id: 299f1745-c997-41aa-c638-08dedc6cff44
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|23010399003|11063799006|56012099006|3023799007|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	65ctWZjnPdDDIT6Acs/7e4RKUBdnFjQ6De7UqKH0UxoZtoKrTyE5IJwLt5a/7YcwfBNU2t4JFJgREK39Oir8o/UsXS0uuwu3MKVlq1i5nTJLDg/g1WKETy4W2b4jv5oQ0XvmlVt/dPnGKp1Ttg8D/P/2KXi6o383fR5DHxufg1vtFI1hdnJ18abMU4xyrslU5lZUDkY7BVopD5x01EtCAt3tewngch5SXWsiNAIJLDRX/1SwKrPBr3p+nCuoDr79uUpW3J3XCK23U61YZT2dh/PPn3zmAi2r9XaSrwCBZ+8pLgqvSqboC1s+Z0uKTEAMFa2ABPnMbGw1kWhnOC9Dm1G6HzzsTvNBwtTexkptXWWe+QcMWK611QHwBydVPz0Dse2uB2rHXrZJrXfDfChNlqtWzHU/Rw661R5t8wZO1ERfoQH7e58s2Sm1GTZR8CxvQSQ+Upqn24oh+gCmRHmuObvwrp2x23hJla+48vuLMvG4HYAfYKahm2As0uqHs4nEzvK5LiEvoD+5iHRGSDE+aFKg2YvbqUxpucwmMRsw5QukaIYyFK876gMlCGRnfWgXKmUPR2ISf7adWSCDkIAUqqKbVaFHH534RYIk+yYgXZo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(23010399003)(11063799006)(56012099006)(3023799007)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XZXLj1GNfv/GlAWeyzwQEv2+5zA9YDLgxfyfwrbtL3Oe7WOWJFzTuaNtL7/u?=
 =?us-ascii?Q?Uu3j3kowBLzHVxB17l3Grmp0q54tUas7LV1RoEbeKJRuCtsLQVTOIK8wjrXJ?=
 =?us-ascii?Q?aqmDHz+cSPFig/Sn8MJA9G0kBfRX3/vkfgSFeEcrgKYDjr1RnjpIZwlWE0Z5?=
 =?us-ascii?Q?nGHcxz8LEUjmqdBzpN+dgbZFt5LlAqw15aixUn9aRoahPlfAT2zDG16IWmUB?=
 =?us-ascii?Q?3DaOQd+NaXPWL1yV9LR6mhN3BIxix4wCeA6Leuhd5HfTx40ok9uSUNk11vbK?=
 =?us-ascii?Q?Gu8vxalTXOFxnnykaLF5QNOaPuJWmQHuGZ/9W8n0vs6cxHFfbIp7uOGZzXUu?=
 =?us-ascii?Q?z1t9KbP5Oi9vNACCgTjqQTUUQluRoeNbd1xRHVSZUOJjG6XVZpwMr23J9xpv?=
 =?us-ascii?Q?HjGOPjKfAkx1ZLnLZL3xhIso6MCuTaj/7BsdbANOoBoUa7XzrH5lv/vVkHCu?=
 =?us-ascii?Q?6oCxrwfIaffYTi65RQdAdIEAnEI1ZYWnEpJfvE6J0tnLVsPUi919PboCGoVn?=
 =?us-ascii?Q?dKuY5RKH0ehyg61WULPmLpHOTmo3qyD8S7k2cjwDZVkVLLmUUAftQE1lWRkZ?=
 =?us-ascii?Q?WSPFV/zfflTUpA1pHoGGU6O/e1raN6h5xNj4J9ATpRny9Y6E8tgLYLSNgHQd?=
 =?us-ascii?Q?boG9avcebfI/QY2sR5oZiOnc4AqZ/lHUt+5vqVlRcFDaANwnWbHv+zX6o/MW?=
 =?us-ascii?Q?nkiMJMJNkVbUDBVYH5TBkj9BDZZW+xgsHYqsv4wxFG2SoDixXDxSUeuSoEIv?=
 =?us-ascii?Q?HyIMN1BgZL8+HeOI3aV1LYYZGXj1KyPr1tof9XyRWm3lmn+oysC7gsOU8WYv?=
 =?us-ascii?Q?bJPsiiijR1X8REx+SDndfFlVA9h+7ppK3G36oSNdFssqbJ8xKo1Gt/V81ynf?=
 =?us-ascii?Q?tXTIJl85jc8j27c6QK75dnyI8I3lqeEegYQByHiGmjfeQo3MkxTDDqRoyR3w?=
 =?us-ascii?Q?OgOdF84TEevutXaXh/uXdgjC7iFQBCLoG7mtvC8bMIQoQuuqtYh9rXLFzHLs?=
 =?us-ascii?Q?Jmbe2AwCOVnMtrj2cCsADIjEaFfB2GCnpMjwikbFm6i/LFoukcyG3j948RA/?=
 =?us-ascii?Q?8PN4bKqSvoLSkltjy9cXGhIcd/7neL27TuqGxsKiqnI0udgCukI3psNVDVAI?=
 =?us-ascii?Q?2M3pH3JHtGov/HBE4ElPu+2YTb6S/A48hchvt7KaE1Fv88vxJk0RGnfoQSyf?=
 =?us-ascii?Q?oowX5FexQiTPN2gOyhibDUn53TX4PbA4gyyQCdAxETLskOAhbNJpsM69gwGv?=
 =?us-ascii?Q?vFwxPHDHqoG+kLKDeNxHtaVIS5RwDUn5DnH3X6m3AUIp9kpi91J/kC6x0eF0?=
 =?us-ascii?Q?CaUPJdmC+qYsO65B2Ix+IiblwBF1EV86vm+mMRwSKVpBrnUb3iwT+1qbG5Py?=
 =?us-ascii?Q?eFjKQN2sjtqRI8KAlycaScCNUkqYRZQVEIf0YtjvOeA5MKVO48hafi3d/94z?=
 =?us-ascii?Q?GEpJ28wHam316YrK4TjNLKNXmV69M9qwYns7e/AMpokxV2AevaMmuVKFjGsX?=
 =?us-ascii?Q?1x2eh23rTJq9L0LNcyTkH5l6kVgjUe26FVrZPekGoEUR5Qyr758/yomRIYu5?=
 =?us-ascii?Q?h77nfCBvov5Viey/stQQVhoNQ8LGjSGHQDmvQdJd0D2ifJdQJHbYSiQ2OB+T?=
 =?us-ascii?Q?TYpsfg81h8VlXKNUD3D5nDN9KaEsfiCwDyOraizAkKIgGnM4UOLuhbudJmtV?=
 =?us-ascii?Q?8NJMoynqoVk6fsp+972XBIWXy4Es8kZ1peAyOWM4Xs7in6CaM8nCS4yXtvhW?=
 =?us-ascii?Q?jVudWt73RLfyD0OmwL4Qw0duI5BSjZ8=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 299f1745-c997-41aa-c638-08dedc6cff44
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 21:16:23.5010
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nhr1IgJ8G4a/qqrSm/dMhzpYy8KWuIEfp+oYwpYaplDmaZg0GY/yVdvDgsrQiyHGuqx2/zC9Hf3WvDkH4qJW90YZae6R2HY1wvTcp7yfzC/P50hES01gOmY1C0Whgvj8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11573

From: Frank Li <Frank.Li@nxp.com>

Convert ltc3589.txt to yaml format.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/regulator/lltc,ltc3589.yaml      | 143 ++++++++++++++++++
 .../devicetree/bindings/regulator/ltc3589.txt |  99 ------------
 2 files changed, 143 insertions(+), 99 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/lltc,ltc3589.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/ltc3589.txt

diff --git a/Documentation/devicetree/bindings/regulator/lltc,ltc3589.yaml b/Documentation/devicetree/bindings/regulator/lltc,ltc3589.yaml
new file mode 100644
index 0000000000000..3bf44fbe321bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/lltc,ltc3589.yaml
@@ -0,0 +1,143 @@
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

