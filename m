Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013014.outbound.protection.outlook.com [40.107.162.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAFD333438
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 11:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772103780; cv=fail; b=NJe+aFhO3DC58N+KPj4+jU9RgyFdVPioHghalm/8iH1173D55VWHURk2bcYcvUDblRjPxsGmuVGi2MHtVn8SEMWXwjm3dOwlU3V+6KzWLi124S2kFa7L7o5Q5NE+zLlgpJNH13jGT7DftpnNNHvk7FEBJW1Aqr17aXLvLCD09Mw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772103780; c=relaxed/simple;
	bh=eWJC55Fbbn831KfeRacuqauSpOJUNoPtdtb1YpHqGM4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lZBANZr0+wpDtctsgzhbQRDr2E6SQBeU1Xu6vRsPVAaPTG8Mva+X72PbPH9jwtwuv5xLsAZL2xtp0yDOEDFD4TFDm0XyF+xFoJIydmllwOTjZ/N3zdDvJhbzlckJzfRxL7EWclO/qxeZJaSQtQVqaGBsckijAxK64F1UOLE1E+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GvwOPZHF; arc=fail smtp.client-ip=40.107.162.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GvwOPZHF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IiCtdVhF44N0ov1V5Am1z3lY9gKIn3h0pXGRqGgCTAeWXiZWiGqStcEAhCqWXNcb6CElbAOTxT3aSrYeDstRpR4OqeXFGNjaWNBj4fTwN4T+IIelLjdedriwpbG0pCZdIBavyw6cVd4/c/97J3kW+K9oUvF8XEzn3IU4rFwDHpuTYkzsppHw/8HciRwnaWUp9srSIRRhAFjfN5pmsNURFUM/RYdyq11HcEVbl5Xhu1g57KrKcz+p/ScpwPaPY11y9ciKbdxLoZC8/kYSVCa8CYewYf5JwBwbUf5lvZJ513t0JU4JMzG0f4/V63R1majO7os93GJ/Bp7dsiF26PwaVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqPQ9zP1g7VNZAOK7xVL7rCkd6RggFEkXPtcy8dOI+U=;
 b=nzzbY7SNk2FyMkCQpFHNz10N7yvQbx8lQgMAK3JYbwS6GX3u4Qz1wO7a4FVzju+B6lsUsGj1EZcxxey2azxzuTIQmF1rfRL5EMrQBPVg594Vvcw4mr8C2ktRp83FVSr2oggahSRfMalIRN1geDBmD53BonOT/IP63lHc6GrIY+/1vUPDaSAZmREgKUG4ZHraOn6okAFRSvoCeV6bhleTzEqwTmgWdkhJjcTaatG2r0fBRDzNosqu2oI3mq557fqJ9mbE15OWzHQt9BPV6hwVhVpnzcj4bLQVM7WZkA8JTpxpBh89eLaPSiqKKa52ZzkWDWEB6niXkKwBWxyvXWFCzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqPQ9zP1g7VNZAOK7xVL7rCkd6RggFEkXPtcy8dOI+U=;
 b=GvwOPZHFPLmypzevguNOQ8ZqEUnJ+GuB4YOrDsxt66p1KckKYrMG33W4W32LfVwv/KoVF70VY/YiV/wg6WbiyoJgGOPWpraj5ov2Dd80n7gOwzNl9f4dUL7HzYK6wbbDCC4Ea/zf0CYy5AUQvduXyJTfxUK0ItBFn5J8LGm2FvmzGP0LAgdzTu36vY/a8IG93vFzx7kyC5/D9GqXXjyYBh5TSXW2vV3/2IJTDOMr/iY4lso0T3jepoyYD0iQuXm7Pn9Z5KDjKJH9p7Wpr37zGYCdZ2wO3ay/R4aqvxtd9AASCZWjbMg03fwGhTGPemca5tG60rB/FefK9CfxErmnfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA6PR04MB11830.eurprd04.prod.outlook.com (2603:10a6:102:521::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Thu, 26 Feb
 2026 11:02:55 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%7]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 11:02:55 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 26 Feb 2026 19:04:15 +0800
Subject: [PATCH 1/2] dt-bindings: fsl: fsl,imx7ulp-smc1: Add #clock-cells
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-imx7ulp-v1-1-3fd611ceb346@nxp.com>
References: <20260226-imx7ulp-v1-0-3fd611ceb346@nxp.com>
In-Reply-To: <20260226-imx7ulp-v1-0-3fd611ceb346@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, "A.s. Dong" <aisheng.dong@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA6PR04MB11830:EE_
X-MS-Office365-Filtering-Correlation-Id: 139f5f68-a63e-423d-d927-08de752697c6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	pTEf9pRGR2UoKu/vklvQ/L68m8KN0DXyPB7xqVA0WD4+DEBTdZob31X67aT7+6DFPo0CZTRJyMg2yxKNbx09Pf6W2rPZREwXEjLYJUZV4gb4BaOMTYZoIzRJWr5obMi78dhD05urOGQjYUdixMCtjAcvkd9+pZ+1YD9kkVNXb8/WxOjimdPBLgaC4pDhGppTnY5mZtJTuQWTCMhqbU/AkvrqvLk8hKgQdQSp69H5+gCkVCoRB8lWbjxLvzxrfmUwDItuUn8j+ZigJS7e0EBc1Z6yI4ftd48CToy+eJ7CKN32YmSIT5YhHbYPby4nQA9GVXEdA7uPrwyDJU/qCVF3YIfoVjFsx+viSa+kmouDlsW21Znq5BlsTJzePZiO4iSsN74yOFooSBkXaYcDrHvuprx8TAFzhZlcyNBZE4gJZ3E4ySlxECKgApFIZcGWUOimmfnGG7Gm5ES59bfQaqdWMCNNOqdQsjO018x161I8rCNM0+lu3URxl+yb0D5jQjSRhYOYD3hzoyYAnEN5k/JSKeprjCVOcCh3ol1pTfasAMhbO9r8szgDfmmZ3KAKt8/RvY8PEUiIcsZAY0ok+n70YqSQv/IfdCvIQD+BISLv09pfgyB/fwzChtExzIwRTh0czB/ItpxA8f2XXQMgVDIXSlXzA4F+cUsMxfZGcZYDmHQ4P9IVvRnRgfkee1mtFO2IyB38qE7Ng+QkCwgVh7HveoR4C5GHe9BG4fUAcbYzq+8WdoXrcvCY5QuaCL7C9X+owoGHb/+O7apNgBvhEGhHWi9XpdciogcFl4u0qP8D8X8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmNUZ0Nqd1VaU2c0QzNHaVNXNlZNT3hmQ0dpejhxbzlaQXk5UGNXMDEvOWRk?=
 =?utf-8?B?OGZqME45c3BmWVlpTStkL0tBK05FVWtUKzRvRytwc043UVp1aXgrc2tyTGxx?=
 =?utf-8?B?NkJNdExxelFVL0JTT0VLMFI2SzlLT0kxcCtFSG83U1RYUWNvUG16amwxRjNv?=
 =?utf-8?B?Y1FBRHlxd0tYS2FxN2JmZTlLTHliSEM3NjJyaS9CdDNNemN1ellWdlNodTJR?=
 =?utf-8?B?cHN6dXhpUE9ISFFqQ09pak5temJ2ZEFrcGMweTNtZGxyRU9tVDZFeXRKaU1Y?=
 =?utf-8?B?T00wMEtYTURWa3FkMWJSRHFLZTRvZHJhVGdjOG5zc3RRN0h3Q2N0c2lhbEJr?=
 =?utf-8?B?QW9jMnRCMTk5YXRhcmRaYzJYVjVaZXZBOVpjWUFjc0wvNjcxaHVQVitJOWdV?=
 =?utf-8?B?N0FhR284NU9QclVScUI5dGEwWTlNemU1NDgvSHlDU3dJNm9VcEFVTjVSZ0g5?=
 =?utf-8?B?RlVEbHd0STNlaTQrQXNMT3V3M1hzVDk0NjdxZEZlT0NzakdoK0hGeDZXcm81?=
 =?utf-8?B?MjYyWkliMVBwcWNUS1RTdnhTdnBsaHp6c1JsVERjUCtBSGhsZ1Ywc2NVaUx3?=
 =?utf-8?B?bkNLTERYVnc3di9KREpRQVFBeG9Xa1cvQm5oYWZJOEwyRXZxanR3MWdpVVZE?=
 =?utf-8?B?ZVBiR0ZmbndjN3Y4REdQaWJtYTNWUTZLckhoRmoyQjBWTm9DeUJWc3czY25v?=
 =?utf-8?B?b1Z2cE1HbEN5YnlnYnpoVFh6bSsxcG5UMDRMaHU5M05NTkdKOXM2aVluYXkw?=
 =?utf-8?B?WTk2N25ybExWbndqY1hJMGM2WjFrcmNERmQrMUFGSy9UUy8rZC9QYnI4dDM3?=
 =?utf-8?B?TkpCU0hDWnk0YmtmalZSK0Vzbm1HY05yYnpGNk1JclFkQjJaSzh1RGNDNTFz?=
 =?utf-8?B?SWZJY3ArdHlhOEJ4UnFsL0dvd0ppczVPRlA3OEpqUTU1MjlwYllvY1Z6S2Fo?=
 =?utf-8?B?UVRXa0tLcmZUdFN6dE4yVHhiQnFGZmRTNHhoK3U4Zjd0MzQ4VFpsSXo2UlFV?=
 =?utf-8?B?Zks5aHBKRFlsdUl2cmREZFBmMXNuMHZkK0hYT3lhRWk3aDVQVlZmeEhneGxS?=
 =?utf-8?B?UTgySkszOVpidkRoa0NSNmtFUGpyUS9YZGZWbm9VMDRaNHFMWE0vaW5SWTBl?=
 =?utf-8?B?bGdxMFNGQzRicGdwZURVZmpzK1ppaUhuOExOWm12TTY3eVRDeW9SRkFRK0JO?=
 =?utf-8?B?bFZYSEJvY3U1UVEyRmdSdmRyaHBBZ25ORUNUei9OSzdhSVhkSzZTWWNlaTQ0?=
 =?utf-8?B?b1E3RVNEaEo0eUxpMUNEZEp2MUJhZXdBNklsWWtRcUhqR0lFOVFNR2ZOZitx?=
 =?utf-8?B?OTZiTVExenJYTFJXQ0pCOXhraDdEVzZGaHMvNG9WMlNsV0xjSVFmVng3SE5o?=
 =?utf-8?B?TytxcGJyYTRvcVpWY1RZQitwdTZkU2czRW41TndLaDI4alEydTRyZW1PMW9r?=
 =?utf-8?B?OUlRb1NEVzVHK0dodkRySzdkOGlYOXREWmdlWVZhOUZwUmdFM3Vic1ZqMCtq?=
 =?utf-8?B?YWQxU1VCN09nV3hFdmRlRmE2RS8vUjYxbHNTWkVoMVAxMHJOcjFoN0F3L3Vp?=
 =?utf-8?B?NFRJY0VlVWxvQXdkYmlOait4QmVvZDd3Wmp0RG5DZUNoNjdQbGlCTlRMUVpi?=
 =?utf-8?B?QlRRbFhIMU40UnJHZU8rUGhTbHVwcFZDRkNmUjkvUFV3WG9oRko4T1B1SFZq?=
 =?utf-8?B?Y3hCYUZxYU5mM2daWXA5ZjdmYnVZbFJpV3ZCdlNaV1VtcFowbGVvdm1qVzJp?=
 =?utf-8?B?MXRVWCtJenB4NU5pK2RvS0pzZzQ5VlQ2d3orQ0o4dSthVHdXalZBL0JVQUc1?=
 =?utf-8?B?Y2lEVHJoRjNmWjhPQ3ZWS3ZPWFZrZEZsVkNRZWk0NlptQk9zZG5RaUFvenFB?=
 =?utf-8?B?cUdTYTB0WXQwRGRDTEVESFdvcUFpUHhHUTZ3V0ducG4zQlhJL0NqajhITzNa?=
 =?utf-8?B?anRseVNJTmpnc1ZRY2FHOWF6b1Z2Um8xR3ZNYUptUnNpdzk4b2lZbjhqQUVy?=
 =?utf-8?B?Wnh4MFhsT29POVBCZE8rV0hpVVNlSitxQW01Y29pYW9hYXNIOEtEVE82K01N?=
 =?utf-8?B?bGxFMzZjQ2trWlJFWi9vWHdzV3RuMHlheTJsZTl5d215czFrdUhkdmtkcUcx?=
 =?utf-8?B?MndqK0UxcW9UNmZwakNwK1IrWHpBdUI4cXpyMU82RVJqMTJidCtNelZmK0pP?=
 =?utf-8?B?UzZzcW9zRm1sU0VtMW11V2s0UW5OZ3ErS2xRQzcrK09DckNrV0UwSDg5TzhP?=
 =?utf-8?B?U0o1Szlod3Z6ZllxWGQ5Y3AwUGl5T0wxdUI0VzNYbEVQSGY0SCt4M0NiYmpn?=
 =?utf-8?B?MDN2QUFKSXAwV0hlcEJ0bGNCSHBHZnEzMEZRU01rRFJzSHhuSEtwZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 139f5f68-a63e-423d-d927-08de752697c6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 11:02:55.1227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4J0vOk/KiI7wDh9rTMKb/T8hy2HGCc0ghEU0sfjTjMrKxBY23y7mJHwaXvv50L7ZosxS6vDmNS8T5mSvhkSLXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11830

From: Peng Fan <peng.fan@nxp.com>

Add missing #clock-cells to make it work as a clock controller.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-pm.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-pm.yaml b/Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-pm.yaml
index 9d377e193c123c7de0ec4db4d4a649ed966b2d9a..7ad470260c0d08bd1e7146ef49e5f60dd6c6d4d7 100644
--- a/Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-pm.yaml
+++ b/Documentation/devicetree/bindings/arm/freescale/fsl,imx7ulp-pm.yaml
@@ -28,6 +28,9 @@ properties:
   reg:
     maxItems: 1
 
+  '#clock-cells':
+    const: 1
+
   clocks:
     maxItems: 2
 
@@ -39,6 +42,7 @@ properties:
 required:
   - compatible
   - reg
+  - '#clock-cells'
 
 additionalProperties: false
 
@@ -47,4 +51,5 @@ examples:
     smc1@40410000 {
         compatible = "fsl,imx7ulp-smc1";
         reg = <0x40410000 0x1000>;
+        #clock-cells = <1>;
     };

-- 
2.37.1

