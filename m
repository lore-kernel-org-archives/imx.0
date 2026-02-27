Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012031.outbound.protection.outlook.com [52.101.66.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EB02C86D
	for <imx@lists.linux.dev>; Fri, 27 Feb 2026 16:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772211542; cv=fail; b=rCjzvsepnEmoj8P3cFV7nE/4AkZ9FlLe9T9DSo1JFAY4WUHUdB2j8Z/OD6ptBzIrCL5CK8DMxoj5xj2QwBIJr0ajL6reEmlf26lQ7zUq3ySA0BO+qVZoBgEbcpsNAMYvQoeUl6QZGu6+XV89Gl44glUqqhrro5TZwA4kOza/ddY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772211542; c=relaxed/simple;
	bh=kKPWPRY4TE3lNb6aQ2vXxbon5ZylFd1HJ7HO1klf6ds=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=pKIJLTYWLbdt59W4ZG7XSbTSXPt9J7LHsH4y0SsNTAvS5NfSMZ29kfmkzOmfBNoD5OngTsfjWHyv+UZigEZNY3MCnmLTpjfdRBAT+g8RFG13/tr7RROaHwVT9iScZb7Zr1gf3xZirrjwkCi3kLlRetIt93MGFW8YXuLKggF7Yd4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NtH9KKuw; arc=fail smtp.client-ip=52.101.66.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NtH9KKuw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sIiYXM7VFu42mFCUnwlMnWDVsT/rGQXfPoBZNhUWT2MZCgnYXqdo8ifllJA9rEqJnALqlmnOQGe4ur5cxw9VOXWRQfuuAAw1fdNj3itJPn4wVmW3gmoDH6MWznpPRyvLxlHfagUJYB5B1/hxTD4v+bIKlgeTOxnN2DdONt5/0mDyBb2rADUVx6R/Dl4CWhz80itrGzteBaAul+r99GlIoKoxjgQ126h5MQy4u3sRJ+ng4JaSskA+D+E//qHnEAt9tVbcfoDMWTKRQ+dKHEXTosTZ1DZlF0OXZWEIgxy8ulFPWltbzYTAdumEVOjCwMyD2jnveHL96jCx7vpPCz5g6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f45aZtpy3cTeVT1UQXxlzhxfsH0SvbAoPnonEW3BDkE=;
 b=PGx2kdnYej0B06ljxDnKpjpdIxhP5n/hRXFSjcw+AVwr7aVxD7ZspNnHnrm/v0GXPQnyiCLbxclu2e2QOp5zOkns50xRRUvP9SmF5l1jdp2fHQsHKO9c14fqjgMJiI5zZO7BLN1lfKy6MrLdUvXXmIhCMxC88OoRvOKmG5CyEC9n1tj/7eFQs9U+Qo5qh5FHKFDt+Nb8f8CjxDm1exBOJIImIEBN2dKtptZ06PkW/yvqfaNKccTvhYQ5jqp4MCD+E/o095jclqZLeMA+2n0MbPka8FncvpIWV/4Amf09RXJhjy6bh7IC6inJ5zo461ooY0TVIKS/O2q/RyqQLQRPaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f45aZtpy3cTeVT1UQXxlzhxfsH0SvbAoPnonEW3BDkE=;
 b=NtH9KKuwHCJjgfwo+1/4C33hWfc7hAVAIS3gRsyjO/vqM7y6XSUnU2fs+i6tCfBGAv9dJgw+SgSWX4p3Gsn2nTbGPUU7BDymEC8fI+Hf0WCiOD5QM7jMTIwUskWv556ricBKqtPzv8sOhJyVZAJV2V5zLTb2ja2IhdbGKABG6d/sg9ylEoHxllXLPHxNwFp8dgAt4apz6M0Ndtq+mUnuoDoz+/Bu9FavyM+1nR9eULR2MT5cwxGuGNfPsBcsgW/7aQV5uLVdEEjkOdjHz4EpEGS2b9iv+S1vhdsrGxl4/0sPxZnKkYUytb0kx4lDqpw9XGQXBVdEOqVNrO2LEqq7Wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by VI2PR04MB10148.eurprd04.prod.outlook.com (2603:10a6:800:224::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Fri, 27 Feb
 2026 16:58:56 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 16:58:56 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Robin van der Gracht <robin@protonic.nl>,
	Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v2 1/1] dt-bindings: auxdisplay: Use unevaluatedProperties to fix common property warning
Date: Fri, 27 Feb 2026 11:58:34 -0500
Message-ID: <20260227165836.3445577-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0044.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::19) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|VI2PR04MB10148:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b7590a9-86a8-473d-9d5f-08de76217e96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|19092799006|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	4ynDJBTCdID6D8Omr34CH5ATZzU+eO6UhDDJQLOf7UrZPlKy77uCl1OMerwufmqZs8nHMvSsb1ZYBNSK+4csQtiFuzFCx8esvR4g5OQV57Wa36+6iqlvoE1gxN4WxlMPmTrUfAwyX9xU1Cjjhtpd2twz/bilFK1fs2l4XVFz7f1EMfr9w3mgMKDKlKKzDKlXhZaRXB2fGynTL9pQdZY6n8d+npZHX3WQNVKolqlibVr9+7i+Q9B71raU6lGVxB4dmlPUBWFKm2lSzsqN5DbeqBBlT3UdNgHHxBXGuqQoiBxYHrQrE1mzTaUPckZIRC45H4pnTEg4oeQOOlpWBJmwt9xfiXCaXFA9dRkQNbfTDKD5EBLrMZRURcgV4KtfU/jIiZyTtTSXXqZhNnxK2GGJbs2/FMVerQjctWCII9aSvtr/7nmCp6+gJ9T/CLthXrWclbbqYSdIqO+SIjoReMttOlpNk3b3QAcAb8p/kPGgpO4y47a5jajmq0uOc9nnP+h0wj9Iocm1/nHpIjNnXtKLHXkwlujYvhp+DQBeCk3VtoV2nX7CBwlNspam+q3ratv4vBqjLTuZgmQb4p8m7fehgmMsUZXHgNJAR6ZWJ5nb5I4EttZwfTZ6SB4Q++FImjCvVXXfdB9SUDC2sYgXbHnvo4CO5t5ygft/XTy0/pUkZ29JIQbLUsWtw+Phg9htprTDhm1aSdOuyLuwuC3GLpjCaJeogaKbj0nCxvrQp9fzt1/DBhdBGIPs9CWIw35qkUgi
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XrM4bHEmLWTFBYGXk9e9CRlRwniZbFO95qzybqFu6ri3SaYA73u7/QmVCoSx?=
 =?us-ascii?Q?YVf5LuGTNopAUS3+Q/DXxWL+QxM5vg+81MpjdHB3oZ7XLu9pmwmBSVm86qr+?=
 =?us-ascii?Q?pT9SeetqN6r+XRxs6xz3NdpiQIyqNcWuOnj5fQYsIzqAuruZ/An0JqBVs5Oe?=
 =?us-ascii?Q?oMjBYg54EnbaCaCzZvG20MxbJ/LPO+p9Yz5r7oGLKws05GlmDWB6/AXOPbNu?=
 =?us-ascii?Q?WIx5XdMxVzTSOOy3v4bzgldWHVniGTZJg/dKfASvg56cWYmDFCyUAOuH881Q?=
 =?us-ascii?Q?vn5a0JcOC/aC5jEkkujZkJ/5nxNZ/8zQ01EzfeqYDG76XEbW49tyfhJNFlvv?=
 =?us-ascii?Q?sn6tOPN0RME49n5jeMkg8hr8kkxvbwXxe73GdtuLqkfM+bAhfn2oS/sAwpCt?=
 =?us-ascii?Q?2FtQFdmDRfiPMZ2mSYQJhP19zQQJdP2eq4gzlYMfQ86bp0kLuYiSSKtRIRNt?=
 =?us-ascii?Q?q2ta7cR1gq80DxVDk741kCz6LTnZHju7Ynske3DThzcwr0dcSeQbTd3DBb1Y?=
 =?us-ascii?Q?kSaBrlXaVby+vseehmTTbNeVJ9sPORdPGEkEdfLMq6BdniAZJF5wDPVnTM0+?=
 =?us-ascii?Q?0fMO35sTBhPeVJDvH5XAvrx2YgOwOx4GKP63/fK2Suom/AVDyICvfJvCSvuZ?=
 =?us-ascii?Q?qhH0jjh5VVafNqbqeXQBTE+vqrWugOyRniV4QhDxDYUg9PHzYasHux8DBIsq?=
 =?us-ascii?Q?Sgi9vJnQhw7o6XQtvtAp9pV0zqmuPql04+boMYyxAtw10yfpM7yTWmBrHuRF?=
 =?us-ascii?Q?S1tv7f6mMbHnQ4sYlAl/4qBYw9g3KEhHt98oRU2lg8LAhlT3y1MqHEt2m99w?=
 =?us-ascii?Q?fZPIKVdx9mwPhusrGapJK/MNLT/P3dGEut6FGyRXUCMOzAOtw0CwvgidOJ9c?=
 =?us-ascii?Q?cTKVntlbrW7uc77xACX3OXy6W0lbcZV08PzHX5E1cTrJFyJeyoHnJuZXNzq9?=
 =?us-ascii?Q?pHragEDFlOWv+8vCwg2DlImThdx44u5zSsMCPGjOEyRQBBHsK3Xg4ITYre0L?=
 =?us-ascii?Q?gtxQOdj/MlT/pSvBjdl37/iY1t/mZPUy08a8I3d3C2mj0YEwa4kWAAXgBCpL?=
 =?us-ascii?Q?0rK4e2X2hMJA+56t3kGqoXQJYu60x+7lGvq6LmMiGwwjh5DF2/NX4PeItI+L?=
 =?us-ascii?Q?trVVEeLcRyfz9QdHil5KWDd5043E6LLMNBHkUiyi052TozRMqdsJRjZcHPtz?=
 =?us-ascii?Q?Ye4NAz9lisQi1cyyCLauV4jEmHle0vxj12mH9fY93qY+9CgWFIaNrNnJGUHh?=
 =?us-ascii?Q?FWaOkrtRFaFXdulXAQpxdxPs5B9xKCqKzyEZr1UauKacxqrok83yW4RNnZLC?=
 =?us-ascii?Q?xHd6WLRiirOkevWadCNMr8MxbLhWsso9kv3i3v4Vr1439P7xZAUJX/nA2AjY?=
 =?us-ascii?Q?qNG6EUgrFTvmnXNiN/VjfPhrtaODb0zvGIrcvxzYOPINNwRmUca+al8mINMh?=
 =?us-ascii?Q?FUQ2INvMtQqj/FRyVGAL+erxWq0Y00KCXHJVjywEsIv8Hn5SHY6yPPiWC/PO?=
 =?us-ascii?Q?EQ7dYWqgINynY3AP4OceDzs9nMyK21I+7twqjtPRSdl+JcUzR1bFR4Hz930v?=
 =?us-ascii?Q?2NNODmuv/TGTmPBU5FJq1FVkIL5o/wt3AzqlQWVzYGJiBvqLU6+jsiVg0vLg?=
 =?us-ascii?Q?rMJASDK21nNTI1uILzREGTLSmGg076vq0yKkH2xFMfvbk6l4TxfRZNv/v7ov?=
 =?us-ascii?Q?6FwAYsdxsIp1MlczOJdbKQBWnnPH7hBBzYy51J6i96d9sn9C?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b7590a9-86a8-473d-9d5f-08de76217e96
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 16:58:56.5699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SEJp2e+aAFoUk8klXIky40de4v435CgCSFHG7iMzN9kfIL7IAcn8UBbqV51UhDhzmWC+4KbOAHFBU5PwMGjiFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10148

Change additionalProperties to unevaluatedProperties because it refs to
/schemas/input/matrix-keymap.yaml.

Fix below CHECK_DTBS warnings:
arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dtb: keypad@70 (holtek,ht16k33): 'keypad,num-columns', 'keypad,num-rows' do not match any of the regexes: '^pinctrl-[0-9]+$'
        from schema $id: http://devicetree.org/schemas/auxdisplay/holtek,ht16k33.yaml#

Fixes: f12b457c6b25c ("dt-bindings: auxdisplay: ht16k33: Convert to json-schema")
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Change in v2
	- Add Acked-by: Rob Herring (Arm) <robh@kernel.org>
	- Add fixes tags

Resend include Rob's Ack tag:
	Acked-by: Rob Herring (Arm) <robh@kernel.org>
Rob's Acked at
https://lore.kernel.org/imx/175796984570.3379405.7210704746413204244.robh@kernel.org/
---
 .../devicetree/bindings/auxdisplay/holtek,ht16k33.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml b/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
index b90eec2077b4b..fe1272e86467e 100644
--- a/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
+++ b/Documentation/devicetree/bindings/auxdisplay/holtek,ht16k33.yaml
@@ -66,7 +66,7 @@ then:
   required:
     - refresh-rate-hz

-additionalProperties: false
+unevaluatedProperties: false

 examples:
   - |
--
2.43.0

