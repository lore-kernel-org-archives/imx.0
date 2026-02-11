Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013071.outbound.protection.outlook.com [52.101.72.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2A92248BE
	for <imx@lists.linux.dev>; Wed, 11 Feb 2026 21:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770846422; cv=fail; b=Ro6GXHktthm8PZFEwn8xbeYM5vJPPKwb9JjmMQr1xWC9CJY35YBnU0BEDd0jIpQdP4AmkyzSWKlqBrMXqo1vVSCkt8hU74EjqSJqtagxSzDhekXtKhYWyfEB22boIvioeSDKEokqiBp0cKyUp6poQSJC+7ViONroz6cpYIclq+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770846422; c=relaxed/simple;
	bh=VlYw6tf0XKkmK443vHBTlY0/pXu75gWzf4fKg3+xSGg=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=X8NoMky5+d1KFh4hF7WUlKIkdSpvvIVK7VgtMgGR7GDaGsFqdV1U9bLNup1fsT5tt8zOg27ojKFB7uIeuZwPaOXq4w0F/7qCR5YWyfrz18buNjSkRab66Dsouq1Si96iwncyXBI6xj9X9MNcANHadUB2xWktl0Upen/1TYznzRc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=T8Yw/D2v; arc=fail smtp.client-ip=52.101.72.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="T8Yw/D2v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=slPoGfyjGVGGY5qXxbzKtFLXXiUUs9P7wPQyO6J/uPdhGlTnFQviSX0+EOOlC/FeQx6DFNj2ywRNGCY47gRkhUZxsq8rUjtqfEUN9SRZFnj2Y7SGrjCSP2+BBDOniay7FD3yLS1se9k3PdKlx+hCpsqN+y7/Zv03wTB1nZ7TJ4dx7Ggcga3WvZ2hVPGmLTZm0Fkw5z4kx/4YgFzZgZ9Ln+YRZSkocZDT6pIHlehmWvbcTjIYGNvD3QoTpg5D8MEmSOElPt+JjjieZjgMzgXCZYHcNJrnKsCzhWwCflIALi1FWhlGCBP0HamB8YyaIK4BzUeY24ZFk/r8a5aSXEmwbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rN4KaEhThXioE9dQjbzS7DbIV6p2C+9uotseuYfb4zg=;
 b=JNFSORC5B8AI7kAIxtcss/Pkn4VbkqfRnbwttsTvrbRgN03/8+Aosiiv0rd/MEx0Qr4ircVID3TY57Qe4K3jeZXtJ7RuKKfbpJTgjNXdtUTtzmvR+U+6ZUZQ9olqyKdsZNDxSk9SUD5NzmnO6CWSkbdot5Ypd3XLhxbRZZIZRZIUtSvExNBPiBHe1To/o/pnq+uKRmkX0BzG2Ks1y1Y0jyhM9sJPzpcGgcdF0+/PusHT9hNSDlgK1iTni2R6th/uDpUy/K7xwMlz+DlMAEE3REovkLNhB2w+KQrF0ZVnwCHZSayGXH+hq0ru4q9e3+KMIzx6Bc0f+b5Q4aFbHbBZwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rN4KaEhThXioE9dQjbzS7DbIV6p2C+9uotseuYfb4zg=;
 b=T8Yw/D2vIGuaP2Rw2teItEat8WRbsnGtJdJqjJCT0ef0YC1Rmsuj9YGw9aQr99iU1IyxjCSXk4upPIv+vCchQ/rU2yls0Zy7AG+QlJe9L6rmZafdQGuqXENZB5I7eBAvPQvCWePgeTT4MHz0dH4FgoYR4UsVYycw4YdZ/QoDfEDa5dpNN6XpCLJ1HDFWq6wJrlHbFZcGYgsNlv9GU3r+iP88np2gUHQpja+iOY++D0xKqKSTSM/ilr1QfXYeTYlsdrDBa4jRkgRpwXRIHksGlvKmg9CmPI4lNLJ8tiqVEvSl2gk2mW5Flud21wHQHAF+/KPnwMqVejydPadrRWyicg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU4PR04MB10717.eurprd04.prod.outlook.com (2603:10a6:10:584::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 21:46:58 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 11 Feb 2026
 21:46:58 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-sound@vger.kernel.org (open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM...),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] ASoC: dt-bindings: Convert eukrea-tlv320.txt to yaml
Date: Wed, 11 Feb 2026 16:46:44 -0500
Message-ID: <20260211214646.3700533-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0027.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::18) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU4PR04MB10717:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e5794b2-0a01-4f76-00b5-08de69b714d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?l/g1b8BQTx8CeJBBDhXudEqdqUTLyOEBq7ulig2PFYQfa7iuL1dFM3yqEiwd?=
 =?us-ascii?Q?sIuaUE6jGflUYmtrEGr4y7MFJY48pf4i4nF3ds0zH1PIeXQlgA3Sf3E2S5Uc?=
 =?us-ascii?Q?YwaPXiJb8tQCe2wlKuRen/w4lCOFmU04tC5pA9AppfSe/EokjoVGaygBgg/W?=
 =?us-ascii?Q?q87bAe+RCKz0Qa+N6f4UyTfqXabgZX2yrE4+9xiGnVdIcEBlsNMj9i9wkvtQ?=
 =?us-ascii?Q?tnB/PR1/vRBxF0r+oUGdks/Dq6rMuKoEAhYG2KxK3l7V+5AOmpvf5HeyZ4PJ?=
 =?us-ascii?Q?GmBV8QXVraov21XSUYC00npdyPqauQkHpHhMitjOWnoPbTVSGhm60+Mn6hHk?=
 =?us-ascii?Q?LdYRqXXP7CPUbrlQmjE7mhhSlhq/RKpbxhZdBtvFCI0VW9RLT/G5lmqSTsem?=
 =?us-ascii?Q?AOqgwr28VWvyNuEb9hXT17uWsKfR27FajPgIjNtXghBvDcU4AXI+Zqu25dx+?=
 =?us-ascii?Q?pYYJPoQMWtirQ0SDsDzklylRD4ap157fmORlzd19+WSl9HQGoFjBfSvU7JyU?=
 =?us-ascii?Q?zO8WQczEC0sbYs/p3HOHE0rQ5Dwbzm/Jr9rHWRToqhHc7TfM/8XhW9lAxSh0?=
 =?us-ascii?Q?9rNKLGOUqHhXZARzVRvkrG0DupnuYzRMfgQPM6Sw4xvwDYq9kb3W+mGKyW11?=
 =?us-ascii?Q?Q7yhJgIkJ8u+n44tbTcEaVkN/8yXHZWvRMV+qrIsEV5SGoO+6zuBrVaDeJdR?=
 =?us-ascii?Q?jHgE9rAQEZo1yfQl92rvA9gMV4twyGCvPu3iXbpO/nyElxqMKaA3DhRw/RiE?=
 =?us-ascii?Q?oixteI1me1MhXrHLeZsXQuW179sGk0k+5XEi6QKwsDBw069IZ4hdemx7K27e?=
 =?us-ascii?Q?MWSLVETxJ3pQCVb73e+RWaQl5jD2bKvhM8HrB638fC6VIiJy1z7gfx/V1FQS?=
 =?us-ascii?Q?P7A5eI6eWPfm+H2RKhTmgtbqN242pJi1xGVS+645ZoY/XXlUI32lUCK0wY2V?=
 =?us-ascii?Q?vRZ4ls2DnKyRuCaudnJ19lX84GzlxpaDtdVrS5SosFBbJdjOcaavtj4bo+gG?=
 =?us-ascii?Q?IZl6kZldFT3Unr7LaIdK3wH1fPI5t889zy9luoNS+3awTKb4feyWoh1XoL7Q?=
 =?us-ascii?Q?Qdfj6xaS9O3Mm5vfEg6RkORShX7xx0DX6IXq3AXBsewpwJ7BGwkj1I4GuBK7?=
 =?us-ascii?Q?Uk4rNlQxV6rHVabIkS5ab6zQwlC/FICVUo8yJguRuEggwWnejSZCd3EsZAhl?=
 =?us-ascii?Q?L58smfV17sxM3higVaZ17Ov+5z2AvZ17OIr9xVf/hjEAdVTOjoi1703h32x3?=
 =?us-ascii?Q?s/ANX+iLAuHa6V92DliXxzyTdnrnF8p9Byocn0+34QMhTKKcN69b1EVfPTpR?=
 =?us-ascii?Q?vObcAW6AiCDcvVf/LJsKj3W6CG9Q8DQJViYnUVgPfNPhhKOsvuKmtuoUgHuu?=
 =?us-ascii?Q?et0OLBBqgiBjOj3QBuW63YCVBnXTW7996mrB9reL4nFRHLiVaCMYCO0+fnFx?=
 =?us-ascii?Q?6ov+OPJSSSsVaD8jpTxrtJYY/zWEpDPDs0R6qATNgsN731RpODog8kqlO5kQ?=
 =?us-ascii?Q?/JyHPbhBOTvfA0Y/PMs6J3JMK7pc4kRuN1E+AxjiO16EZVHWVHLIigNBPNEG?=
 =?us-ascii?Q?WldLsHSWds5bR6DEw5PnUKgAQleSpCaKfHUePAa3?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fJOwQ/ZivOKLpVFkbq4fb8NAztQDkqRHBNMxsPTcA+ey5/JXvJ+ygZb4Wq9I?=
 =?us-ascii?Q?djr8vOExSghnStSFNqL1EFDtIFCR7b02s4N9OZIucZm9SzjhFSnApuVrNCRm?=
 =?us-ascii?Q?XjiAtVRpotN/IaHMT84LnI1LauaY2iSSAOgDu7Sp53bJ6dk6vBuEC4O1eEHg?=
 =?us-ascii?Q?NCiny3XOmFEuTui3xmLTRFFUWFaD6apdI1UeUBXc98Jn5TMhViSB5dzh0uwD?=
 =?us-ascii?Q?wdZpiq/dJipHqrPjJqfJ7RpPr+EbAe+wuDq35gZk7gSsShwrTK0qmVcAhDvT?=
 =?us-ascii?Q?VS807p0ZW2k36DQdZIMROSW1RRITDrVmPtIUogrLblv21db9izhM19FjulgN?=
 =?us-ascii?Q?k/vWHPNwg5TXV81w+S9zj8cdtl3ld2iTmcgr7eyP3FD7GZO/Q3UdetZ1kk/6?=
 =?us-ascii?Q?QfWEqalV16/MXa7vqn/UuLZ/119pDfBOrYuJ8bXkk32tRHkE8w55143SyKkO?=
 =?us-ascii?Q?GOHozpefhhQ0gzRhttHn1hEJhFRSUYHvKo5WDR5TaZ7wXPZKrCGBNfqxLpi5?=
 =?us-ascii?Q?kvebIeq00L4Pu7WpL2LDo420DG4RnWwSnbALRTA+/3SbBQ+n+PGrgs6aHC8J?=
 =?us-ascii?Q?dM5RYkWwFghzoShCchJakQcvIs7L/+73nngMXCHuYuN+pII2EsbJDzBYPThr?=
 =?us-ascii?Q?uZZ185N1XDyk8qwxTIplNkhnA1YOavV5DCvBi35BNA7NUvQFcBskBqzALMyM?=
 =?us-ascii?Q?JF/byNipfpjH1hx8Z9Qn7unUPwatKshdu1XpEYzamHmm246IF0PTTNv6nVgr?=
 =?us-ascii?Q?5CoHCNQgzhCIX2eOhH2SEZzlgZv3tyN+0hkNhsh+hWo390g1V80gTOQ+eNiy?=
 =?us-ascii?Q?lCR1xKjsbtxPQ6Rvs/cUxH9l4kgWzSKxMD+B+jR7UlecxYUq+t0tI+at8EmW?=
 =?us-ascii?Q?aji2Cpsks/70w6zE2qvvLsNhU44Z8xnxJWiLpg4IPna0A57ccv7oPoo8B3fj?=
 =?us-ascii?Q?Ew9r4WDwORncLAyb8J1G99U7vHFGMHFqFZlg8LawwNgu5oLmJeBEl4kn1l0D?=
 =?us-ascii?Q?A+TtQ/yZAM/RzrtK1uCvuuYv+7fOayfaFG4JG54689qGmO701iDuZfriYpsR?=
 =?us-ascii?Q?5p7iQiLm1Trvt1b8XD6Z1lKiI4kxM3a53eVmuG673ag9di+IzOQBc9zs8CRg?=
 =?us-ascii?Q?kFjp6DylAYxM+1tx41rlOdoJQtUP5vltCrGZA5Z1xwGzUV18kbt/kUFcFUDI?=
 =?us-ascii?Q?W99HJXMcwCnBjS+sBoWmgnyvlsDDytvIB74cwN30o5XyRNLTEkEqWyaZ5URo?=
 =?us-ascii?Q?sa6l2W/oSBNuvcI+fw85gZh7JgNlKXxiqKbD6vD9q9xHJ/M3mtqql2CjIliP?=
 =?us-ascii?Q?WNXMXPK2EUICm5KShkpepxrELYL6Zq9MzdzXIhJ/27veWxPD1I+nTH1LcNhM?=
 =?us-ascii?Q?BCoZzqkJT6tWPKVh5rF6oDg0St1uYn0c8nMtkgRAT7vZeloOr71bKhWaia72?=
 =?us-ascii?Q?wY0ezYxO+VScedTUyo2N7wvfphfbAZ/3jHZeqdLI4OCrBVL+SnUUDAv9/gQX?=
 =?us-ascii?Q?0vrIFIZElkL43k1UXewvyZunuRzqRy9iy2/UC1BYlvHC+Z7nEtSLVnmk2ttQ?=
 =?us-ascii?Q?PhaskC2CJdXMPRcCX6OxDo9LkxCh5rvu42/JrqTuv9ZVw5jbdku6SpQhqTir?=
 =?us-ascii?Q?94AwsCfHKAAVTx03yNzujwyycF9D0dBqV18RwW3HGkLfwkuEfzuLINfgXFs6?=
 =?us-ascii?Q?cAHgV5sdMeXLGQlOXPaMyrG5mLaouzLrakEMDFCS95t65GIW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e5794b2-0a01-4f76-00b5-08de69b714d8
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 21:46:58.4585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /zegvvyuDZOFh67OYQAs8+ij1rtPZooHbmldPUx1Yti8nvLsNR8tmnC3hUNIBG/bGDH72I+61FnyRo/mt4737A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10717

Convert eukrea-tlv320.txt to yaml format.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/sound/eukrea,asoc-tlv320.yaml    | 53 +++++++++++++++++++
 .../bindings/sound/eukrea-tlv320.txt          | 26 ---------
 2 files changed, 53 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/eukrea,asoc-tlv320.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/eukrea-tlv320.txt

diff --git a/Documentation/devicetree/bindings/sound/eukrea,asoc-tlv320.yaml b/Documentation/devicetree/bindings/sound/eukrea,asoc-tlv320.yaml
new file mode 100644
index 0000000000000..483507fa77937
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/eukrea,asoc-tlv320.yaml
@@ -0,0 +1,53 @@
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
+    description:
+      The internal port of the i.MX audio muxer (AUDMUX).
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

