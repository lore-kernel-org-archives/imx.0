Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011055.outbound.protection.outlook.com [40.107.130.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBE236404B
	for <imx@lists.linux.dev>; Wed, 13 May 2026 17:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778691610; cv=fail; b=KwcO/bRtJ8qDpyUNdhHdmLH+C+l2/F9wIqpn1flmFHw9rVVD02EvAXFye8iNjvscS8+Bv0hKI1i8hGKELf6va9zKR+YGbpE7oYSuRtcS6RcVad+axbSwogRqVxqx44RHxeRgycLhpAmWWk0rZGJ9ecNwq9YD1wzEj7nZt+ECHtI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778691610; c=relaxed/simple;
	bh=7Dz1ZIQUIESsB1d0rI+c9hZ+npi2QMktsGcWCauI1mU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KRD4cKruHMm/xtCVJJ2WKYUwy1SUhv5nlBvJsE5KobC0GyltDll92eo+XL6Zp9SlqxxnvHSc8Oq+q+MEPwL0MfCqHdQmOT/VE8nYYWA+2kRfh1WZyWdUPQDUwkbyIrz/1VYVXF+lrA+mwHtbUa/XF3CC9n2/y4p5Rm9gNcFybHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Jmi9LvWP; arc=fail smtp.client-ip=40.107.130.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Jmi9LvWP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y1leFM1VSduADbG6Xa4tbbbpjZjQIC3w7CiNzTNZGowaOjJbHs/6Bg2s42BBnITH9XjtlEqcB4i8/uBPFFQ/SyrfsT0+CD2q+iNh8ZK+BQd0AjHccYkJncbTgwxEyZu3+uehnqHwcz2Sz6BxNCw5OrY0IVCH0TnqJsUgJvNw1mmyb7ZaiKdwagwAsy0+IDWwejXcxLeRqt290KJwPRReQr7cq3vqLIZEbfB0IU2ZY6bnDIQi7tcRVs7gTpEbFQz7PGLWAOno/eXcTRNPYhePcfKCKylayj2ikAUKBncPNzKEQCNC1GmM4JTOSmWJUbF9FYTbNtXZwLX5DEgcHjaA0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kdoe5hTYeTo1qkhwlZalgpm1gRAaWjpAtqefQn1Vouc=;
 b=P59KSQoRHKgP9IMlIyTHiLwgh6NI2D3VAO/TKAAAtNh+1X7MktGrQHDwi62TPYA1Kpz6kgnWiZcwuqPpJ+8V5388bD0QHdZcsSi0UizBWYu/jUKLD+4Flj9jFdk13ZltqQuzSgZN+IlT0eeMtW4CH4wWSsPiX8uYkygZoS7+YVHDXyC/iBSS3U7XksAbv2dBkqR+evcGy6iYQOlW8fZEr72ayDue25hYAMZHLoQwJBFVcg4AYeKnyldDkIDUMEXW8WvoOVr1IRFHTaO91TjpbyS7w4lJ3qvTJUTd6xBLI2tDcpQa+oUmPPdrDrbx6/8G9KsJ2s4PR94efELTTu/4yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kdoe5hTYeTo1qkhwlZalgpm1gRAaWjpAtqefQn1Vouc=;
 b=Jmi9LvWPbghngibQzz8ao8UoYILmCklpkMYViTEZTZf1W2HyVi2mUa5zyIyvw/ictHx75/UleSrinr4KDOCWW75DR2z3prVlEKy516ikbQdWYHonwSYmu/wvG94CoBsRIKF9tBi/r95kOV48i+ey9BHJZOtOZ/Vilbyh4AehtwxlgDYqCd9N6r5SKLiYS8mmgzEBwkq22cu6/wi2q1kFqZv3suJxGQelq48mNu12JqSFfWyRg2AFxJlznOPY74MDyjH4dIgfBdh4jicrLWSy7HDjQXiAAXAP9HRQEct8taAGym0W1i+vf/vevZJTjqwoupAeI4sBVo/JPmwlZQBwDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VE1PR04MB7488.eurprd04.prod.outlook.com (2603:10a6:800:1b0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 17:00:05 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 17:00:05 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	linux-sound@vger.kernel.org (open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v3 1/1] ASoC: dt-bindings: Convert eukrea-tlv320.txt to yaml
Date: Wed, 13 May 2026 12:59:39 -0400
Message-ID: <20260513165942.3742718-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0008.namprd10.prod.outlook.com
 (2603:10b6:a03:255::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VE1PR04MB7488:EE_
X-MS-Office365-Filtering-Correlation-Id: 14129c09-cda1-45ba-8dda-08deb111149b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|366016|1800799024|52116014|38350700014|56012099003|18002099003|4133799003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info:
	5C98+CvOznIboWZaHfe3jgkOhYWtoGyCOxiw/iILKbPThtzyDoEPYNRR9tcqmFl3sbG1f96NsQsRJch2QQzcgd0s/Ro4WE0Dv3Z/9COZhqbQBrJMahkF5xBdXFbJ255yOsgmC57ZIURRAImZKGuni0aKP/WOhiP5Rm6U0DGG2+Hlpw9BNff+hhBaIGEZHU8stM3z11VI2FkDYIHDEMePt386SvA8i7NUJgWd0jNQIjp24KRoPeO4Mvki5achTgO3WHzbvSI8Vf7zUhM/YFnc++ogx66096ACXpKL7oj6Va+xa2YUJTQDoeVDAyVfRU8tWF8YspuIX7cMf1RKXYGFLBFAJwuy+Tl4/oYaVV7iqu8OQDFntoHI+4Wy0jdb6M4puUeTchbDV7sDDNYK/b5Sc9Fiw4MCKRW18ekGXdYDscyph/0TNWu5kdgWKuf1z4EQqRokxvna/K1YU+pK44KokTqTDwB9nYOvRk/fTwaM1ZiC2g6m7KdQyeRJ/pP/uHc+WTtODMiCVfwTW2krzklZ70z9I+nIMWtUFi958zNYdN9yDPAyZhLC7Z1omHHtLPzH98GdUXwSswExjRhXek4rrYmWCjLR6bhxPlX3KkOxQe1ydaFCk/y9p9mRcGB8C99hVmbwSd78gMH50UwH67uc4SuMPkpTxvtWgYgLwfgdC891v6ItDSmGpnlJxKYKeeLzw3Gj0AlrsWB+DSIfNiYUDQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(1800799024)(52116014)(38350700014)(56012099003)(18002099003)(4133799003)(3023799003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eaKz18vd2AIQrllBo3vFqVjuqlPXWxY3X4hY/i8KtOW1uv2zXOUBBSCAz1yj?=
 =?us-ascii?Q?e2G1O7G+HKX8QHJMQXvzpGdSpUeZi4O6pf18nsnZJUQ1XrAFa/KJPqcPsiWT?=
 =?us-ascii?Q?cBssvHjomvmodk35fy9ijVOGrPsoCjR3culeKX3piXgwiejVouTTXoogZLH3?=
 =?us-ascii?Q?xsTvxIaO7+1d0A18VqGjYp+UMMsu38njTFQ8UN7ynYBMPRolQj1T2OMocMPd?=
 =?us-ascii?Q?Fd5S7kvszEXjIPGsPGMvNrVXQ/N3qGvpiRQdPWkImj9jhttP7iNwwjvsI3XC?=
 =?us-ascii?Q?wiB2WxZ9yM4mAdt/4ycRKQm5ab2JfZYbPSjQdvg2/TdIpDtJjX6ZnRKcK5n5?=
 =?us-ascii?Q?yRrqpd6Hrs6eDZfy7Y8DyCEOuWaL6ioCxm2o2QJsBjeqmjh3oxPgBG4ZI2LE?=
 =?us-ascii?Q?9cTAP6oP5Jyz467bk5Q+o7f7qQc+LD13gg7lQOR/XwydbipinH4Nyn4Ppa1m?=
 =?us-ascii?Q?Syh91+hcR2PEF6VRVfrI3W87/rchiuB6bfxHrNKTQ1mqP0iz9xJopRK9iLoB?=
 =?us-ascii?Q?OGP+/5HC1H/F1F79nELdOOI0/hSHnSE/u9QjQS4OiVqo7vXFsWAdrqDlMvuw?=
 =?us-ascii?Q?wuzBnGtwfutH2Mpv3SvP0PNJZG8XWjGlFZ/G6mTHoFFqcvi/XDRCnGJ5MTri?=
 =?us-ascii?Q?LGzOyYzMe4iYhpvvbFtVXzRToGMS486RDGJtdlnM3FszCoFIv7BZdbbwGdyR?=
 =?us-ascii?Q?ww3FwcI+/b0Xb5y1zKXupseKojBQQEfL3E/bwuUpobLiHUir0vtqkyd5qGih?=
 =?us-ascii?Q?W/XZ+T3Jb+a/Vp/m5mlmXha6IvRxdJJREDs7La8pItt4pjSosaHzJfyJhCZO?=
 =?us-ascii?Q?FdBE/PcNaFH1ztuk60lbPXJR3rbAIdqTFdPDkY+xlgIklgcxU2C18KYm23Yt?=
 =?us-ascii?Q?3YB89Jw+JYX2a2QY2YRWwUB9nYWrOi0GbNgVzfvTZuC7jAH4FusqzQWeO3ON?=
 =?us-ascii?Q?/tXoZwGgYyG2gdaQiWgU4QD4zKIRlpDsL+Si3EjIijHrqPCZknnT9byB4Zwj?=
 =?us-ascii?Q?EAJ6W/FDr4kUPfYQdxkwZ6Idq0y7wQReFzXzfMIFJRPeHCPR+EjhVUfwTpXQ?=
 =?us-ascii?Q?WSUTTGqQc3ErCC+onI5KRm4pW99HjCY1uZXoiAXYqs06EZpxWpwQ9a4E1xr7?=
 =?us-ascii?Q?PXQaFbPM2MwlIS9HAkL9phC2P2BYKCq+LUMakyDGKFsFBxVOfyhDD9zrchAG?=
 =?us-ascii?Q?61dANlmuKACiUAohtq4Hst7nEgsuykPYl6MKJ/oslKAfOVjlnfYcaX1Wtw2g?=
 =?us-ascii?Q?JwijbzACrI4KAWo0VjVWJZ9pj3rnN3BZw/SMEJZV78XhqJe8oGFBv6uUf96C?=
 =?us-ascii?Q?34ZKi1Ap5X5J4VPHDZFmxH4D0gwoXCR0GaKwLhpbAKv2q2W4k+PV7T2nqF0m?=
 =?us-ascii?Q?xRbQzbo139CoO6v38szlsPPYS9WA/TpQF+1qbv5Ih8pq+lhmJT//YSusdjnt?=
 =?us-ascii?Q?ezVY9et4elSQInz6HZTQOTeZRiDDWZG0qgJWpDJrO6YPu+4qzWGbzyKvwA3q?=
 =?us-ascii?Q?HNA9iQ533GXQW0hS5kkIzHl0W2gMoHK1Im/cO4itQ9CgJ6zslEFq6/Qrd4Wr?=
 =?us-ascii?Q?3pqpyhexUb/LwK2e3TLz9vIs/ye8whkP34FQJf09rW+QdHYEcOY1hS7YV2Wg?=
 =?us-ascii?Q?zMAr2s6ukRUIBqCHOoByKkFvdk5qzOuyjVdg1I4JBhMqe151ZV6hwwBi6DeJ?=
 =?us-ascii?Q?iIPT/KnSiXGx7Fnbda/5pHn1IcRMHzYWDlWtdxatPIphmDOuZb8tJOHu3QSe?=
 =?us-ascii?Q?bN+FjB+vaA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14129c09-cda1-45ba-8dda-08deb111149b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 17:00:05.3894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1lRfRfH25D+6wkwzseVxnPtaqOBzOE8bgOncOchUD3xMc6BkZRI55hFtGpwqV7jCRJuSLjNS70tSro49r9ZeZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7488

Convert eukrea-tlv320.txt to yaml format.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v3
- add fsl,mux-int-port and fsl,mux-out-port to required
change in v2
- Add comments about "The AUDMUX port numbering should start at 1"
  v1: https://lore.kernel.org/linux-devicetree/CAEnQRZACes8EptdEgg0i0vzdcxgUJwZAfQHU0DEhMnXtA-g01Q@mail.gmail.com/
---
 .../bindings/sound/eukrea,asoc-tlv320.yaml    | 57 +++++++++++++++++++
 .../bindings/sound/eukrea-tlv320.txt          | 26 ---------
 2 files changed, 57 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/eukrea,asoc-tlv320.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/eukrea-tlv320.txt

diff --git a/Documentation/devicetree/bindings/sound/eukrea,asoc-tlv320.yaml b/Documentation/devicetree/bindings/sound/eukrea,asoc-tlv320.yaml
new file mode 100644
index 0000000000000..190c923468cad
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/eukrea,asoc-tlv320.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/eukrea,asoc-tlv320.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Audio complex for Eukrea boards with tlv320aic23 codec.
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    const: eukrea,asoc-tlv320
+
+  eukrea,model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description:
+      The user-visible name of this sound complex.
+
+  ssi-controller:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The phandle of the SSI controller.
+
+  fsl,mux-int-port:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      The internal port of the i.MX audio muxer (AUDMUX).
+      Note: The AUDMUX port numbering should start at 1, which is consistent with
+      hardware manual.
+
+  fsl,mux-ext-port:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      The external port of the i.MX audio muxer.
+      Note: The AUDMUX port numbering should start at 1, which is consistent with
+      hardware manual.
+
+required:
+  - compatible
+  - eukrea,model
+  - ssi-controller
+  - fsl,mux-int-port
+  - fsl,mux-ext-port
+
+additionalProperties: false
+
+examples:
+  - |
+    sound {
+        compatible = "eukrea,asoc-tlv320";
+        eukrea,model = "imx51-eukrea-tlv320aic23";
+        ssi-controller = <&ssi2>;
+        fsl,mux-int-port = <2>;
+        fsl,mux-ext-port = <3>;
+    };
diff --git a/Documentation/devicetree/bindings/sound/eukrea-tlv320.txt b/Documentation/devicetree/bindings/sound/eukrea-tlv320.txt
deleted file mode 100644
index 6dfa88c4dc1e8..0000000000000
--- a/Documentation/devicetree/bindings/sound/eukrea-tlv320.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-Audio complex for Eukrea boards with tlv320aic23 codec.
-
-Required properties:
-
-  - compatible		: "eukrea,asoc-tlv320"
-
-  - eukrea,model	: The user-visible name of this sound complex.
-
-  - ssi-controller	: The phandle of the SSI controller.
-
-  - fsl,mux-int-port	: The internal port of the i.MX audio muxer (AUDMUX).
-
-  - fsl,mux-ext-port	: The external port of the i.MX audio muxer.
-
-Note: The AUDMUX port numbering should start at 1, which is consistent with
-hardware manual.
-
-Example:
-
-	sound {
-		compatible = "eukrea,asoc-tlv320";
-		eukrea,model = "imx51-eukrea-tlv320aic23";
-		ssi-controller = <&ssi2>;
-		fsl,mux-int-port = <2>;
-		fsl,mux-ext-port = <3>;
-	};
-- 
2.43.0

