Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010048.outbound.protection.outlook.com [52.101.69.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEFB36657E
	for <imx@lists.linux.dev>; Mon,  9 Mar 2026 20:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773086681; cv=fail; b=rE9f6td5owbY/S0kqf0RNnDGOmA9neCDjxoFi9dVTuZgVu2wNGATQpdAHQyEMqB8JdCR5uCh1jK4nm9vKNfDL79/vl3pP/e0vZ/IAcE5fwtgeGq6K0u18UGJJiAiScvrSTxCkjtHhkzpvfK/x6bPFiuXE/yYX15HU18iOR9HTdU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773086681; c=relaxed/simple;
	bh=/H8nEeFLYGmOmrTDAgvFuWwwhLXNB9qY/UmMxM3s7D8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JQIGtptysKq8wWPyPCxc8MGCXTZGrcavWsP1zreNwmBtoAxN0/HAbU7wmzEj+h8J13v5voiaqQv4/5LFdBEpUconSQeVGf1R5sP0EmQTNk+eUaEQEgbrK8RzGUnMeZ+rx3E3ouGMd0lDUQorbhPPzrFw19VCsU0EMdrcmb3YO6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=elb5z1ex; arc=fail smtp.client-ip=52.101.69.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="elb5z1ex"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T4fMgWLqsKJOKHNhR+Goz+7Y1dEINpK86+S76Ctc6IowSb0uPbsT1y5CKHayAwMm0LoKsgg8P1Y7wJfMFQSjqpcP+Y5y5AWa7UncZ1zrY34QaWloUxZVXiqrVb/6HErepAU74Nj3VvNJ+nCpCf66EAPbwOufgkmH0NWt2uMT+SczoGHw4J4qKZn09VIr3CBKiaQPQ/h1DrOLfNvD0AGBKrVAMsIepeIHcV5zbuCH0xS0BW5yZ95ISxpOjBY3PtvvDcoBzowPa3apfPVXbnhpF/RbdG65UreJc/qDR+ufi67IEIQZCgIg7I4kU+sRL9yV8cj/TiobvqKJBOEtRZU4ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xLz+JdaK1h7LNsrboNwLyQvHuNruttFneXvlMhaazd4=;
 b=q9N9tj2bKBxLUOVO5GdBciuSPaw9+HU/ya2tRrkoVK6JIXfNPR9JQYBdm658S/mYrh+LekZaiZaLgONTgn1QlktiJGg0hOZlBqveSEKByNC1U7grEHB8Qx9DMrdz+XeHUobuL47mxQRQQ8g2uKcW9rfyinXkKsFpVU8FtebID+x4PWNzFoTr35UZqpELwEdMUt8jDUydg89dZQihy29XII0rvvGzmPO6fGPRY4Ua/pVe9f6pH9Y2mU37gQKTnyxQCJM4i9dTQxOnfCedx1J3VW5l6uSE2RH5PAuf96RhW6Kq1X3N7RGy4fR6PUM7M1Qr+Ruhvpckiyvx5gEKDdJxqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xLz+JdaK1h7LNsrboNwLyQvHuNruttFneXvlMhaazd4=;
 b=elb5z1ex1+O+TADDqmI3ZL44GlT65gNEeI7KKE0z9zgIqv0j3Da5EwU7BKCLSJ09vb1IiWNwXORJVBn382CVaI697k6MTm4pl3A/km1zWmhBNA6t3SoCGea5s9Ng0fa92W8vR1nc2P/RE+oc58qGGcnf7bJP1sIEjKnET98/ycq0uuxi+eWmtuFOGYwG6bbCSXwCVqnBN3gZtZWow80IqvMJILLPKhx7fCqhwcGmmGRSiFDx+ZRHqM2YMjsf5J4Nh2Jq3cQswJw0YUfZksUPoh3IZn8M9b3x/ulyUv6m+ykK2l/dH7IDpAgvBcCHc6980Ba7ZCA7luaq37MFHr5gxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by GV2PR04MB11934.eurprd04.prod.outlook.com (2603:10a6:150:2f3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.22; Mon, 9 Mar
 2026 20:04:36 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9678.020; Mon, 9 Mar 2026
 20:04:32 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-mtd@lists.infradead.org (open list:MEMORY TECHNOLOGY DEVICES (MTD)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 3/3] dt-bindings: mtd: mxc-nand: add missing compatible string and ref to nand-controller-legacy.yaml
Date: Mon,  9 Mar 2026 16:03:44 -0400
Message-ID: <20260309200351.1791162-3-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309200351.1791162-1-Frank.Li@nxp.com>
References: <20260309200351.1791162-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0220.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::15) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|GV2PR04MB11934:EE_
X-MS-Office365-Filtering-Correlation-Id: 086bab13-b7f8-47c1-dec4-08de7e17164c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|52116014|366016|376014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	pNoDnaB3f/6HnHQNryQqqVkm039X/Ar9MI8xriNyfdDyG3daLsNVz+wbu0A7Rlbhpx0x8skLsKzIfjRNDvi7N97yqY5Y8wiPQp7fm7PYHy83jC7c1/fGPkneN51E+dCY6FfmtiU8veZrEgannHlZE/IZTh9JF4DAsLjzd6etBLzcN/XWXkBkMIFcK/z/B0Srmw6HpI+6zTHi+xgMmJzoXbmTtZrNrkqkG70rusWHmrIvTAid46Neg/X+w9CEm3BIAm4cOOdST16z7fFqQf4oPKIlVqUboM8g01diwPu6Y85Gk7CsrxpE0ta2Kh08Cv6gPBn2JPaCnGWFOeTNZ/nJJ5TdkyEy1FiFw1iAGVev9AI4XL+gHwtG38czV4jM5W8u8wAXwjW3FenYuNxbLgiNrULFAUGFGBS8sgH/h/x73DC4+3CIt28pleNAND8Sy4tu7LvAlNVkGnCi7Ao4m9a2TZWK9JrW9ppzTNwaQfnxLDjqPh09C2STU5EYqU405FKjHBi2qp+nAfuYKk0s1ymojCUB5oNvTT9snCUQ9v/OCxMkKF5FARaWOEnWLp/ZuHxVsM3HE3EbIHCdd74ppCEA/OD6agG/JotnrbbOtBS92KC+sb096krsLQhhnGadNCTs0A9YKoEsAE1DWkV6AqF9YDB1H9hnpB+13g/9PkmYt8Sw5OOuq9CRtsIfioKgC79pMVtvFQwezwWoZ7FIzd0dkkdCqqm3rBUnxYzpg8TbI9QE9+cHjdeE/C01XTD8eLoaAYistEPTPIyJIH/hcbHOeTxm9IlG72Zg6n+lpQj0hIrDnj/6OoYBMH4mxOgUn10A
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(52116014)(366016)(376014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SklLajV3MnowWTRHWFA3OEthem90WVNWL0JOb0VNRmtXaWVUVU9RS2VSdTk4?=
 =?utf-8?B?bnpxSGpxU3RFTVB3NlhGTE5GVFBpUVR6Ny9EY2UzcFEzaDJjYjYrTW9LcmFR?=
 =?utf-8?B?MFpDUlQxQUR3Nk9iZWZFclBrRWtQQUFac1Y5RXdDa1FOSUo0ZFRyU3lVbEtU?=
 =?utf-8?B?MkJzWk8rYytBeXpOazR0Zk1ObEI0dmk3Z3U3TVQ4a1d1ditPL3dDSjFQaXJS?=
 =?utf-8?B?ZHVIQWJRUVdnWWxqRStMM3R1aFdCVFp0cHdDbEY3OWxSaUZCc3NsNHFUOEFF?=
 =?utf-8?B?QVRLaXlIeEhiS1BlaEhYTWJsMXJhZ0ZoUGhLaWlxaE9rc0ZjNnBycUFIa2g0?=
 =?utf-8?B?aXFFaDdjeFNOblB0QUNldG1WbEFQUktCZ0pFYStDK3BhVzM1akl3Q3JQblMx?=
 =?utf-8?B?dWdEOXpMcFFyeStVanprRWpldVJET1RTQXJ1ZWRiVjl6VUJxeVJqZlE3OUpV?=
 =?utf-8?B?aGxXZ09DT2g5OVB3eHZsbG0zVUh4UHU5SENQc3lsTndsckNSVjlIZ0c0Y3Zz?=
 =?utf-8?B?b1FhZG5wWW9RNFZaUENGUEJPOEdnb3VhSGZySXc3U1diYUFpdUpYRy9wUmha?=
 =?utf-8?B?d2svTXRGbE1xT0FqdHdvSE5Lcm5LOUhmcDVtZnlrcHUrUkpoQnFFQkVVQzl2?=
 =?utf-8?B?Rm15cThzakpWOVBQQ2FyY1lsK2VVYnNxRGFncUVyRTNkSzE4WG5ib1VtVHZq?=
 =?utf-8?B?L3JuV3dKUVdYUXNVbW1SamVGUHcrcCtmd284NE9CR1N0OXVnUFl1eG1vb2JN?=
 =?utf-8?B?YUZDMXAwSG1Obm1GRlVlNXFINzM3NFdBTVoxa3ZYTXRDblJjSlVvYVR4a2U4?=
 =?utf-8?B?azZmNUdXazdZcFlrWXg1OFBReWpWS3pMRlM0Y0hBNXhlVVZzWmMvcDNIZjRw?=
 =?utf-8?B?a05qME9HbWkzMkJVUXBoSHdqelMrVDNwOEFVUnA5NnpJTWJkSU5xUVB0bERX?=
 =?utf-8?B?aVUyaUVzUTU3YzBOeWthQXk0ZmVMZFBZVFUrWEJzdWZNdlZFSjI2czByTHp1?=
 =?utf-8?B?aW5oWUJmZ0c5TkZmMUJlVUtHcGtrWktkTXIvZS90SWQwU3psb0ZnSkpjdmo3?=
 =?utf-8?B?R1h0cTRxWWVjWUdEcm9FWHpRSWpVeWllWEt2ZnlhWEpEZGM0b0ptbG1MZit6?=
 =?utf-8?B?SFNKZ1Z6U0VjbGdJejEzSklsVFIvVnR4eWN0OVhHNzBSRjEvbGp6K3ZUaW5u?=
 =?utf-8?B?eGp0OUo3K2dqa29UdkNQd25kejIxN3dkSUE5UzZYclAxRS90MDlPSW5wNUlm?=
 =?utf-8?B?WkdXWTE5SU1MbXhOZEwxck41WnRrS29FUDJmd2Iva2dlTlZyb0Mzc2JXMUNt?=
 =?utf-8?B?UkNMeVRUVWVWRVo5WmNsTkZ5YTNndVo1NTBiS2F1Z1RXVGVEcGlNK2hCbkJB?=
 =?utf-8?B?QXVIRHNzZ3ZMU0ZmU3BvMnI4UUU1VFB0NC90UFhaREtjc3NFY2RhejIvaXNU?=
 =?utf-8?B?cGNQVFVkNVdkdVp5cDZNdzRHc1YvMFlmSU1tODlKN0ZtYlhyTEtKY3NMSjFL?=
 =?utf-8?B?dEdvVXczbklpNUlOZTBwaUlxNWhzdHYxUGFRSnFncVFNaUtkVnQ2UlFxb08w?=
 =?utf-8?B?alNibG4rZktvYisycVJkZWpCekI3NVhwR21kRFlWc1FWam1EdGNUTS94OVVm?=
 =?utf-8?B?SCtKeFIvcHh6N3l5N3doSmdtcE1aWUJGZnNTMzhuVW1zem5JUFQrQVhGN0JG?=
 =?utf-8?B?UUd4UDlKNDc2cGhlZEc3SjZndklHK1pyMUFDbk00L09RQ2J4M0N3dThZSGVy?=
 =?utf-8?B?SmFaOGVEbWNCWFZzRms4Ui9BVEFSVnJjejRwbkc2RnBwWS9PRWQ4QTkrdEsw?=
 =?utf-8?B?YzN6L2hxeVZjclVxajZMVDRrSlZTWUR6L25WNW9Zb0tkTSt3bW5MbkpmdE4w?=
 =?utf-8?B?d0N4WTR0YXQzczV4dkExY3dBT1JJak52WHJXaXBLdTZ3eFVzeDV6WjRTeEJ6?=
 =?utf-8?B?SkdqZXMzVUdNWnZyckZLSE95YUxHbjR6TzdBUHkreFdLQUJuTkdaME4ydWhR?=
 =?utf-8?B?MDR0NFN1NFZFZkNVMWEvcDZhcWxtVThsL3FONHEzbE9CWDYwQkoyR09uRjNm?=
 =?utf-8?B?eXh4OGpUbThoN051T2dYRExudUI5Vy9YeEJ6akc4Z2R3dThBWEJNUmMwakNJ?=
 =?utf-8?B?QTM2ODl3WkFGM1B2RFp3bFlQd2tsSlJtZ1ZNS1d1K1d0QTlNZDUxQ0M4d1Qz?=
 =?utf-8?B?anh5Mzg1dXYyM1NZK0UxL3lDTUVXSHpZT2szQndBMXV0NndlMTNuVXlSTXpm?=
 =?utf-8?B?dXZmbzRtUlFIdGFOMm43M0hTUUZ6bm1JRnJwVGdLcGc4WGZJMDR6VitGZkJ6?=
 =?utf-8?B?Z1NBRTJ5bjMrOEhCWUJwWnZaQWdEN05WT2hMUHFFWnBzV2Fzb3ZyUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 086bab13-b7f8-47c1-dec4-08de7e17164c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 20:04:32.3821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V0LXa6BbsFaMUKoCF4zlP4uXcWyg9Yj/h3mgV8WCiBf8jOGt2S4EXIoZtZL52pVnF2Kq+fnOI9GLNZYx6gUx1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11934

Add compatible string fsl,imx51-nand, fsl,imx53-nand and fsl,imx35-nand.

Add missinge properties dmas and dma-names.

Change reg's maxItems to 2 because i.MX53 have addition NAND flash internal
buffer space.

Change ref to nand-controller-legacy.yaml allow legacy DT layout.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- use items for regs.
---
 .../devicetree/bindings/mtd/mxc-nand.yaml     | 20 +++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/mxc-nand.yaml b/Documentation/devicetree/bindings/mtd/mxc-nand.yaml
index 433ae5727ad85..fbaff7d3eda85 100644
--- a/Documentation/devicetree/bindings/mtd/mxc-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/mxc-nand.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
 
 allOf:
-  - $ref: nand-controller.yaml
+  - $ref: nand-controller-legacy.yaml
 
 properties:
   compatible:
@@ -18,12 +18,21 @@ properties:
       - enum:
           - fsl,imx25-nand
           - fsl,imx27-nand
+          - fsl,imx51-nand
+          - fsl,imx53-nand
+      - items:
+          - enum:
+              - fsl,imx35-nand
+          - const: fsl,imx25-nand
       - items:
           - enum:
               - fsl,imx31-nand
           - const: fsl,imx27-nand
   reg:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: IP register space
+      - description: Nand flash internal buffer space
 
   interrupts:
     maxItems: 1
@@ -31,6 +40,13 @@ properties:
   clocks:
     maxItems: 1
 
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    items:
+      - const: rx-tx
+
 required:
   - compatible
   - reg
-- 
2.43.0

