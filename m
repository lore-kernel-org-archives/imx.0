Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010004.outbound.protection.outlook.com [52.101.84.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFEE36C5B3
	for <imx@lists.linux.dev>; Fri, 15 May 2026 14:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778856749; cv=fail; b=OXCzibB/snnJRfOL9jskyp0HbkaZCiZbvuBaOjkbkoeETHoYeuZWNSM8tcDVUT2r6FhLBat8CU58oaqEkiEIq17pcVBzlklfHCUO2876k2o7mCnRtTlno4LJIuuKYoFx0/XRL9TW3cfPEup+e83a0EmjdgdYt5ZvydF4DTjR2a4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778856749; c=relaxed/simple;
	bh=OY7wuodj85PDNZox5JfCfuleGN3jyhtKd3kZCwhyp2A=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=pCUM/MTVyxD9fNfKc7Pu/xktLWnYpRn+DiZHSgab7NWgIVqQwsbaxH/XMXlXdG8XbhuNMOMm2Sb1FlODLyLBAL2oOnCDWURn3W75WdAB8t8Sstr2ssUXcOKLxYvq1lwzFk6nVP5zW+qWjsyWBbBattvioy+tnSMrAzbtItZowS0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EAWYO+cn; arc=fail smtp.client-ip=52.101.84.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EAWYO+cn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OPXLemDYDJA9/LsRVnxf6kPFs26+5XMLLIX/jxB1Y6yHqYXE7iyZNzWBY4MLA328oyxj33R9/Ra/4FFHOQdnI88fQsSFM+T3ZeOk71X+vwzTZ28cfwHTJIsXE1eux1dtB7U/eBHXx8ahG8tklpDk6b5S0b6xmbAbHFuxuLAMyEV4IlC22usGxbLIod/b5+xEkBCRcCzNv8Yd2dsSntMQi3M8fHNHXtHWvPAetpiONEE9hvsKcajL8FV9b7EM/NskwXHwbrtrZ5G/csUsiEVrj8bs2GXg4c5E8nkI1ruNrCsM6l/OdZSrwxRD72gkA2ELTL7Zu7AWevouuUkDSyCYdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oeki5v86GUXOt1phRY5JmI6qGi9qy5KEusHP+V/RARI=;
 b=I25kgxTpT1fqgbh4X+NjRqYhmLoJJPrdJLkhzufuNF8TwhDHAv/wIUCrQQ4qULvbvpcH8rIH+tu1llIlZxqnxDRHCgdnwsKZe3xH4r4FbYrdABUnQFz06OMdaDGQXo78cC/hcwiE56IbZnQwZCxYW4EeAiQPidtj1sA7t3ol3sPtf3r7mOnDGTuFJCVKx5sGQpBU5uuL39/+LRnajWB7VfBd7EIG/9rpo2wR0hfaWG+LI4ZD6My5hFWk0ep1Y2nuUILVP7u1j3MscB6ZOZS83BZPvvuWbZhLD8S+SXECEN0RRKE2rN+8nblx5NejrQiIgkf1UCjOa2HC2Bjp4nQvsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oeki5v86GUXOt1phRY5JmI6qGi9qy5KEusHP+V/RARI=;
 b=EAWYO+cnS95XHWc3MHQoCrrKPitqMIJSPgajiI2qsGWZr/NDnAdBBPTcJKlFWoVH+uiGEusoSTTD810BBXBuxc7w0+MglCJt7QN8hdxL+u+ZghBp5hW/jnNFbXH7de+jIAJiWMAHEBahziEqqOPfnFEvJzcGEI3RVKP04+9Lav6zepxBA8BfkDkQ2/1bOs3XStv0EMBBlTseJzPR920vqVYA2M4BZBZMmFHqOdLCkV/3otmvQz7eQGLxUp7aT4YdNiwoo9MViHZuE6V3MU/q19GYQOlN8zoga0D8FoU2/qf7g/RFpWJsEfGktQy/hE4vL4XN2LQWyWEn/H210xUsfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB11016.eurprd04.prod.outlook.com (2603:10a6:150:206::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Fri, 15 May
 2026 14:52:11 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 14:52:11 +0000
From: Frank.Li@oss.nxp.com
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
Subject: [PATCH v4 1/1] ASoC: dt-bindings: Convert eukrea-tlv320.txt to yaml
Date: Fri, 15 May 2026 10:52:03 -0400
Message-ID: <20260515145205.1696584-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1PR05CA0016.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::25) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB11016:EE_
X-MS-Office365-Filtering-Correlation-Id: 12391271-d2d1-47f6-1006-08deb2918b3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|19092799006|11063799003|56012099003|18002099003|4133799003|3023799003;
X-Microsoft-Antispam-Message-Info:
	YRmFmXwWVUpnMOjvYqjChs8u4OPg3zdgFREmlevFqdmPtAUxD3Z6lB7k/XTo3Dxx9vlUjwkFYli/Xr7F2JWVUAsjswft161SGe2F9lzv+tHFQlLwVjyDJcLT3HL8Z9nMbEDItTF8tjN40m2M+DvKOqtioe/ODrsIbcbUxdVq5moeUrpOK8fFe6TUgJp9nL9URihyPBdXKiq5qvnmQAwk94hzE1JI9cNnnyglbhyUEXHgKnPtZdvuA1QYeeR6xLS+rI55VL+0vTIvIfHVodq9aWXz+BCzuvXkVzWsLaVV18EEFGgwGErdM6ZRew28ecoNPujdlR+6GjCA8gexYN6Pp5DJgs7xh/IBvrSk1yemu1g+wbn3Tik87S0vdNhKjt1sIDDgNFnfr+E5wXOLMD3Z9mZhVmhx4wSopB0nMEopF9sLJUNweMOCRjNKRPiA1xlLUHvXQgF6cy9+RozNHBcFHmLIB6xD/TbGZOdvUYUHsslXme9iEsbshFjoBnyzaKABer1nq/PPpTKWHvMt/56ERKwKRaLa22N9hA3uz4iwUtWq6OwZVuWLNsEtyZgDGx1s2so0wLZK4q28opnNjZDv/+FCBDr250UdbwHyQgueetyfrTqjMLY8rfy6oHkwi5mq+Ah/rUY8+vsXzhCZHRDzkw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(19092799006)(11063799003)(56012099003)(18002099003)(4133799003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?czDnQOmqA9GQi7fJobLAOLwimq23d8ssgFb7Gx9ZZTuRKPUz0IE4LhD94ZNg?=
 =?us-ascii?Q?vSqziJyRHxfwU/N4y/e9qi430yDeX6va8QcjfogB90ZMPEOcOjdwx+/fwujH?=
 =?us-ascii?Q?WBsIQF41NSfg4fXv7j27IUvWvAOSVs4z5/vzxyHgZtuEfUBaarluLZXCurVX?=
 =?us-ascii?Q?MnNsI8ks05hdJWupdPl022HLsf1/N3JLT/qRTKmOEr73K/hEMfN1VcnNFv7E?=
 =?us-ascii?Q?bMK+TyRpTM6QjlXzsCkY1U70mHcK4Ub+7A2f3oqQXfzE99qISqtn9ifJnvor?=
 =?us-ascii?Q?hRPMXoCdl8VaWFyD97cGcTmPtqrTynqk+DfyYVUUOuf+c/X/oXGeXAMszCHr?=
 =?us-ascii?Q?WfuzpxJmCif42nFGVnGoSPshInUitJ1aULTNNWIU0PvrRRSAB3fy/pa24tBQ?=
 =?us-ascii?Q?k2o02x6k86maD5ILServ0WoDnJcA9puim1lmi+jFgggNJ3h2vn3YS/35tT/Q?=
 =?us-ascii?Q?X6ikaIxU1YWc6Stq1IMLTmMNo2rvASvSJwCCKopm0ZTEvRPvYHmCr/UbnzLZ?=
 =?us-ascii?Q?Qk6LgJNOo1P5nVqQy/e778zffR0tGLn6tpXTFbqahNvZRiTZeffFSt21Fkxw?=
 =?us-ascii?Q?o/7YJS9LVreemP/BMdmmBh9s4mpbF4PXviszmjcZAyUqc0grxV2ZnuGZFyem?=
 =?us-ascii?Q?4r84wjOvJ85i40XPRiTjIuxfrIDC+fCDaCUv329PCJ0DbBCldWTA8+bXzRSl?=
 =?us-ascii?Q?8W+cpY46BSxkiLWj4llNrECcUCIX/IeG+MulL4P4MjlUGCiXXNrmI1l1mgt9?=
 =?us-ascii?Q?nijP9c83FyEjFJcvClJNFlV/3YmlHipDlHY4Qnj2Wc+eHA/HQGoATsI+fv9b?=
 =?us-ascii?Q?8oY1UHyDZmfW3WGgFN7Hl5+lcmlv/jaKZRchP5kNxHP///8nIOhNBW8QWGB1?=
 =?us-ascii?Q?0gOJDnbDkqyzfn5H3hkk1k4Fv2/+uGonxKJlSHwK4kBk3RlyYELEfIqxBW+v?=
 =?us-ascii?Q?MNoVBIKdjhMxr7buGSSRwDuZ8ZN6+Tknctuacj7E8YS6WW/5WA+hVsy2mQWx?=
 =?us-ascii?Q?1G9YmOcFZLBj9gF7Zd2M74wtyD9Xf7e6dr8H+pqbp3Cq5Rc6uxAyocBsp4wK?=
 =?us-ascii?Q?UDjjmbBVtyq+pZ/bWEjWZGZaT8/bYDF+VG3gqpnURsUPJcsAN02QQi5AbP9S?=
 =?us-ascii?Q?hQ2eo8ra8HdLP6bTFA9XfJJuv/R2W/pdVx1tPjftXWALBoNhVh3GEJysgkZU?=
 =?us-ascii?Q?gavZSFPu1DTRwA3bFXy9QXBmtKh/J37e9ziuQQWvfQ4gSrkni73hBc/TUMIc?=
 =?us-ascii?Q?XEkjeEMPrsk7aFpNuJCOC61kvG0B8FwXhUZyXa0PcmbywwxReo/c/VCnLLqD?=
 =?us-ascii?Q?Ywj4HAXsE8cTG9Q+zhEj9RUBZyIiB4ceSLMPspmD++0/lsHo+bdzNB0cQacE?=
 =?us-ascii?Q?ocVoxZPWvaUEEyYxj6xevAmfxoH+RIF0A1+NV1tCJ938DjK20aewLeW0gy/v?=
 =?us-ascii?Q?Nlw5lrkZYQ+j64ALTMGAviWWypdL+4EL80Ba3gWL9Kx4PFYy4dBr/QvWNntR?=
 =?us-ascii?Q?j+qES3AYcWi9lltucIc/a0f/il7mpdDu3V1wR5tW1lFn//IfKd/0BKxkuTAk?=
 =?us-ascii?Q?wuKZw5/WUGuwqZPgSCRhMBGytPmunnEe3FfipTLo45foYTjGCZl+VbDCoN+8?=
 =?us-ascii?Q?LLF+gFRbulBxjpy05xsFnB+yaVnUSpSCu76ppbtvcjhG1i0LXFN8Ru41ZWYO?=
 =?us-ascii?Q?IT+YkQj8avH/H4sP5fZz8OJTMhU/nfnnqKUG32I+W9eTsmgxVM0GdkE8f25A?=
 =?us-ascii?Q?C73H24Wh8y/9hwylcqwfQ6xVcZ29/rI=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12391271-d2d1-47f6-1006-08deb2918b3e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 14:52:11.2813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UO700xdtSPQRD7D3O+FhOtfb9HsIJGfmaFX844xh8ck01DgMYV0luN7l6/u55SjBHjawFeI1aSzqZpqWkLAWGWbtafTbzWGTtrRJKISiWtYjwT0nczk2bvwx/oxbaPCr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11016

From: Frank Li <Frank.Li@nxp.com>

Convert eukrea-tlv320.txt to yaml format.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change in v4
- add minimum and maximum for fsl,mux-int-port and fsl,mux-out-port.
change in v3
- add fsl,mux-int-port and fsl,mux-out-port to required
change in v2
- Add comments about "The AUDMUX port numbering should start at 1"
  v1: https://lore.kernel.org/linux-devicetree/CAEnQRZACes8EptdEgg0i0vzdcxgUJwZAfQHU0DEhMnXtA-g01Q@mail.gmail.com/
---
 .../bindings/sound/eukrea,asoc-tlv320.yaml    | 61 +++++++++++++++++++
 .../bindings/sound/eukrea-tlv320.txt          | 26 --------
 2 files changed, 61 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/eukrea,asoc-tlv320.yaml
 delete mode 100644 Documentation/devicetree/bindings/sound/eukrea-tlv320.txt

diff --git a/Documentation/devicetree/bindings/sound/eukrea,asoc-tlv320.yaml b/Documentation/devicetree/bindings/sound/eukrea,asoc-tlv320.yaml
new file mode 100644
index 0000000000000..24b793feb02df
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/eukrea,asoc-tlv320.yaml
@@ -0,0 +1,61 @@
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
+    minimum: 1
+    maximum: 8
+
+  fsl,mux-ext-port:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      The external port of the i.MX audio muxer.
+      Note: The AUDMUX port numbering should start at 1, which is consistent with
+      hardware manual.
+    minimum: 1
+    maximum: 8
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

