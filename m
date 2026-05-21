Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011005.outbound.protection.outlook.com [52.101.65.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C9E394EA6
	for <imx@lists.linux.dev>; Thu, 21 May 2026 07:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779348256; cv=fail; b=cUjC8kqlrhPLYHKxnXGKU0l4C+i1TaPof0zRINXwSQb8UFnn1XvydVVU4iMMAg3rXhTalJP2KmN/muTcA3d/etfaa/p+P5FTBi9b8SM9+k6L+9o87XD4nooGeCwsAv8zYZ/LC9jEUVxG51/fNIXYrKLgrJvGB26nh0a0CJI4FMc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779348256; c=relaxed/simple;
	bh=FK4ouRQ4aayn+gqVnSwkiYsOTksjmqn2rhARNcopzhE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=IlZ9ZDwGZjqS9zor/hqyTH8cGqG1iLSpLT+5tEwLYABPa8kXCLkvhQwFxpb5xj8WiHJyjwJp28P+jyI6LMcPa4veUBrAAqHU+OQDvssl+24inZOV2cLBdLpKqsra3a3IvqbKlG1LEWHZNsTw3AamUagMvfokndigJLN87OOtEgw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UCv4I8AC; arc=fail smtp.client-ip=52.101.65.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UCv4I8AC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dxqCgZeHPlbXZ5boOG1sc+uorSTGFsrl6zCZOcC18BPoJV6DgSyE87r58o7hvIqoMCKH7WM4XzPRZZEKAYTM+lJ/Jyir6fVJ1GjFdN92KbdQ6DC8fh3ZMKEz5NV/N0uQPtVJslS5BdhcuWx9wHhvnXJZKSFvt7TOcRuuZNrRbSqmOWoHnG6NsTY/+fF4EpORkx+9DsCgWTFuxW4hUufyUWvyP51Kt800etpf50vYaPCZBWcGlG3a+T6v5TW3q2nIhCdCxMtK2SAis/HxSiLvXhlPStB2Ent1JSxzTeweDD/0C21SVqmCzgq10mwAAsfuWawQiShDb8ytgIKyXgK0kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3YVPhhciJWGNn/AHzgfhwI9bRYs8n4Zq75QrLXfTkVE=;
 b=WGyyqOmzkdGweTMciYcKhhnHYM9MitZDLdWNolAsIllp5TpWHe6IFqifXloxMmWFfOXbVgXZhzYj9SUSjPt/XJzSTzac4Rz/4jJIQ3TF3ggxEbvjQ4uaf1k6RANkAdJWfbDYrxyLUpeOmB+S4ObJcADXGwF7OOacjEdtATzuDZpN8P6LUvaHvRoohBTz/AX2BPYXNXvxb+Z3InPmwzYT9YMVAAvficfPGQcIJJ1sLIK19/wO0YmGZyBogkJhp0HCLLTfn8lXOmgsp0HhHnZO90c1mCaPcEA4Xyk9KKX2PYxmBVw9Psy6wmNoFBQzbZk2Z/BG00fdpAEZBHiWAjkqgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3YVPhhciJWGNn/AHzgfhwI9bRYs8n4Zq75QrLXfTkVE=;
 b=UCv4I8AC5QBF0KLQn04MUFtJUYb4/RT+0raiOoAliBfkcINSyKqKFNxBvVdaNcg+dVnwvmzmN8yLNl4XjXv4OBXgeEUY6efkIQIdoaxC++xcQRiUpGRyKN8GQvTylwoeXczQE7LfgZ4AWDumSBon9CDjLCw18oyQMV4pLYKXdVu2hOWiRyJdplTvl35MXKTM0qaSkjCwyDxPyZqbx93KdbsfYzO3cBTQFxrkKDCwGWbx/X1FOIsPRf6FCVw4obAXywl0w3AnSI/QcyN4YQeU89tBZo3f6oGSi4yHOQ+efPBFNPOIeJHmlD123H13dp5Ue0lys0xifwqdxrqkahZWHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by AS5PR04MB9828.eurprd04.prod.outlook.com (2603:10a6:20b:678::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Thu, 21 May
 2026 07:24:08 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9870.023; Thu, 21 May 2026
 07:24:08 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	shengjiu.wang@nxp.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND v4] ASoC: dt-bindings: imx-card: Complete the full list of supported DAI formats
Date: Thu, 21 May 2026 16:22:36 +0900
Message-ID: <20260521072236.3166710-1-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0095.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bf::15) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|AS5PR04MB9828:EE_
X-MS-Office365-Filtering-Correlation-Id: ee612773-ac5e-4c3c-b1b4-08deb709f291
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|19092799006|366016|38350700014|11063799006|6133799003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Y5FuUq4D9kePE45Kv/tuWx7XvPLauXNv6wYTlnK3Ii8iVsmnfNE9NPmOQWjPBo0WUgEharkfpPAun5L56el2NktCIidNLwGp5+3VCWbUh3l9v1tmkYvPBeC17hT4iMhpd9iL/rPpi9ef9SmC7ZfnROwqVAzBQ6Rym6yOxznPEz2AQhwPVzt/jrXPJ76/vchh/8k2Z3DpElro70cIZsqFrMPLaLZQEt8oI4hzjxasTOO2is7ftVmYx3LhteMzeR6u5utuBBf7G0T3duJARG2Iz+4+yDN/nhnGxTkF7hDL10wpuW9/Q7YBHnnGEtCtQFVbPLgKPmRwohu44jFfjS04H+Z2Stp0W48NJj8AFOQENMgf/JCOZGxx5BSkVpdz4/73pRffjHSgtLldCMZ2JszcQHUZD1xYabR3ecshRh+wc1qeGAMVG9xUZLkNoI7dZH0W8v4r8EDQYsAmMA9XMJ/XGQ8fJgYr++7uEIMXFYmCznnLU8PyEpcWks2kg9f+pTm5OMBgkIGXjr5tw+eZYTJRq9dCL7dF5uyv/V6em8cvOLrqbryyKRR/YgkGcL+4ot3//prNeJM+3Fz1TvUmDtgITVTko60oUJfJkth/u65ndz6CZfsXDku0rm5ra4wGeyhd/Q1OAwAlEkxwpLeFVnsWdQfoVWEnhqaLfhbEJa0xzL7I/G43dRUvaqzAvmCEZoohTKRSlNTE3RVU3jOwFli7c5h1htW9NBLfGKHRoxUNHNougabmuy2ZPh7J9bD8IfxQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(19092799006)(366016)(38350700014)(11063799006)(6133799003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kozwwNf+uJnL+7q6bk+vQheh1BWKUcZ6/2DWLc3WzIjbzgUmrP5UKPaknXPv?=
 =?us-ascii?Q?2JxYGoJNEX6YQMjow/lJwey/5uBokWMdWxju8diySSNvJSeub22PfzHh4BH9?=
 =?us-ascii?Q?FYjU0gkDh06sph4SCX0UmHTmF8pVT/i29rwOzbqxRV3LVaxf6q1ZjS9SB7xl?=
 =?us-ascii?Q?Qa5LwJuXzHOaAso6SvWCH9XGsYSTe4ojgwVlkLLFHklJxk4F9hpqW787YFFi?=
 =?us-ascii?Q?oCTI2HTFbPXqsD2oQBNenxJIgdCYSbpoKNrhRosLKpDNbX7esmEmUVMTDz8Q?=
 =?us-ascii?Q?kEzoBWIDoP+2ZeavkOT406KqzLoR2mhIn3GdwltNRwWERkEsQQ7qMUb6YYnV?=
 =?us-ascii?Q?1XuggV16AuBb6YSoAfocGB5ZqmyhVeu4ceZE2W4YjVuZ6WrUu0TW8SIBIx/C?=
 =?us-ascii?Q?DwPlKuGphYQQdN1RfDNaktuu2iF+mNRcj5z6jB+arxmRynePxMm9cW0N3Qum?=
 =?us-ascii?Q?OMNTIxH3zuaGVVAA011O9PBKtj4sIiAb2CxC+yDgS+8OfjBqZdjM99aTA0pw?=
 =?us-ascii?Q?PCTICKWGdBNxNp1omM+8iyQkdZDX/eBUIU5x2R7KGv+5QOJNpTH+EfPi0d/x?=
 =?us-ascii?Q?AnmYh5KEJ2as2QhOsXdCF439mVbBT/n3DM8wmHY8O6qn3TBhjX5hWwk2o/de?=
 =?us-ascii?Q?YuHtYdbZgTDmYS3udhculIwuu/MWcotahJ+vRh2Lgide+7w3Qov4QzUklWTy?=
 =?us-ascii?Q?EUJf+awfPbvBy6QX2AC2GjvJ2Ll8XybO8XmdoGtog8Zg94RIJvjD9XSxNXdo?=
 =?us-ascii?Q?HMmYxwbx+wgfcuc3m7cJj9F9TZRZ7oixTXnY7Z8WmRjHCd57/WscfLYxzagy?=
 =?us-ascii?Q?pY+3sS+Q51GPy/Iyf4MiXWLyUNkEwPWEamR8vo99029Msjr+Pc8jnGzGRNgV?=
 =?us-ascii?Q?rIIIwFGY+6SNkA0VeBbCUiPObxR2WD3+g4IglnI5LYI7TWDQKPhLV1ziM4us?=
 =?us-ascii?Q?ZCvxHRYieCmQEf+mnnVLnO5rZwweOc/E6LjTuW961sAnsv/z7esn42PXDfcY?=
 =?us-ascii?Q?QB9Q4dVu7wb0IvDGNiZ1xKmS9rtWjz1bcT51a1yVDYYycTn8wwgdRTle5PDL?=
 =?us-ascii?Q?Akn238zbB/AyoFpd8H25Zy9pI0BkrDMRWL+cIilfBCIQPMdCEInzTtV78kTE?=
 =?us-ascii?Q?D6429FYIpGs+zdR1kp9xjv87Or+tjECSTJB/dBrNWN9umA08TokPQ2fRMDH/?=
 =?us-ascii?Q?9H5G5a/famqFh77sBrfWfCg2QNxPPnNVeReZ+PmO0+9Fvba7qTr1aWtE24Rk?=
 =?us-ascii?Q?e/ZDAEJPhj/ozSh1pUxYzm13WgMTT7dHTTzp01Ap8Onrni/7u3+QSVEUEA80?=
 =?us-ascii?Q?RkfBOmtxUYY7MGMrPfB/ajwtxx70ET4oFXMdHpgoMlxxrI8yOqwcDhNKMDKA?=
 =?us-ascii?Q?pyRIQ96m2MvLGtBNbWNYX9pq9bcOCPs1EidxVrNDNF2QCi1bBeB8lIic33+k?=
 =?us-ascii?Q?XNHs7PYiEkGppGxpmhOlzxeLEwMR6ZwEghIU4Tr0ss1wf6HmwSFT1uKYM9et?=
 =?us-ascii?Q?Q2SFRBhntPU5YmoaYEch2I04YG1gdfdm4sd/EneGFuWr1Hkgy+3CaWrywKeM?=
 =?us-ascii?Q?bI1XFDkWBmuSbxOQkkzIeKHY7H1ysTDKwvKVDE9L6afzJvVZ0g6mnhl0t+Kp?=
 =?us-ascii?Q?rzRUV6v2Z76XQa5ZCGVtvbn35PfpBu/AcWVaBngeIpUtVZ8fLGLRjcIPmY2I?=
 =?us-ascii?Q?BXhTB6A2o79sPnGZqrBEF2MWvH1XqXUT1Iwm31b3SfgUaKXOafldF5ixmylO?=
 =?us-ascii?Q?vNVVhnse7w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee612773-ac5e-4c3c-b1b4-08deb709f291
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 07:24:08.7437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /YTUGE3He35q3R788nThbPmEhk7tGRhv/tvWEctpoPmAxvjNOhdDiXiszqsaVuD/yCrtXKTTmlJ4u9Pro4VNcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9828

Currently this binding only lists i2s and dsp_b formats that are used
by existing sound cards. However, DT bindings should describe the full
hardware capabilities rather than only the formats of current usage.

The SAI audio controller of i.MX audio sound card supports multiple DAI
formats, including:
  - i2s
  - left_j
  - right_j
  - dsp_a
  - dsp_b
  - pdm
  - msb
  - lsb

Complete the full list of formats supported by i.MX audio sound card to
ensure the binding correctly describes hardware.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Changes in v4:
- Completed the full list of DAI formats (i2s, left_j, right_j, dsp_a,
dsp_b, pdm, msb, lsb) supported by i.MX sound card.
- Rewrote commit message to focus on describing hardware capability
rather than current usage.

Changes in v3:
- Rewrote commit message completely to describe hardware requirements.
Explicitly documented why only dsp_a is added and why other formats
are not included.
- Rebased on latest code base. No functional changes.

Changes in v2:
- Updated commit message to explain current support for i2s and dsp_b
formats and new support for dsp_a. No code changes.

 Documentation/devicetree/bindings/sound/imx-audio-card.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
index 5424d4f16f52..950e3eab2942 100644
--- a/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
+++ b/Documentation/devicetree/bindings/sound/imx-audio-card.yaml
@@ -37,7 +37,13 @@ patternProperties:
         items:
           enum:
             - i2s
+            - left_j
+            - right_j
+            - dsp_a
             - dsp_b
+            - pdm
+            - msb
+            - lsb

       dai-tdm-slot-num: true

--
2.50.1

