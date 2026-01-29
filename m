Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012046.outbound.protection.outlook.com [52.101.66.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17EA2BEFFB
	for <imx@lists.linux.dev>; Thu, 29 Jan 2026 08:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769676215; cv=fail; b=tj69AI1uz1tCo32/6EStyQ1Md0c1RwXRkwlWUD32d30Fyv3tGOpkXo+rn5DVKB531AG9T+6VenkOVQbjDc0RvkmP8r+3PlclaIrvYyOGdeya68SGHxTLuBDr/rfN+0h4EGAvj2mRQPsAl/M6CgSg91NAVmv5k7SoEQTaBMdEtYw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769676215; c=relaxed/simple;
	bh=UitfLjVp7Uzy7kZxNJy5R/1F+SHWfs4pvNZDXtAfvdI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=HyEDOAdBeB1x/TvKKAVjr2lIb0h0DjjHQlbpYmFGh21omHKYYPhWus5T2kp/QQgcNDw3IhwbQgUZBH99Fb/OgjIIWJHmos/znmuUO8j0rONUy0AyLgv1qap8Unx+Ym6V5XOFRvUIbn1wvVRe1A8eBEl9bBCcJpOg3Bv8f1JaC3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=d+1iUX0L; arc=fail smtp.client-ip=52.101.66.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="d+1iUX0L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LlLttxTioAb16JdX3sGyosMwlI2JG3dGZ/P6Ca4ExrCRefG1beD4GofPLMNqtUC3ETfMQlGPvRdN+yGTZ3+gr8tFui045QNG021sPH1+ndcAkeJyMbSek+suOHD0XWHl6ez7WtxYG9FRiP1qasnPcHIvVYeDklFl7MKrQf27KYB457+WNEcOpRzr4dmTDsECPDRMezvN5+3P5sVIj3NtPIxVQ004Tpj2iUQMksG/Opj2juKsQczeFqfmXYa6/lf4GC4Yb3DnojmPZ8ra3s4Edo/7UBrCkJx9d480JRJxVrTB/sEir9Uz4xlQFa3lbNIqa/AuZKuuw8rOszKnvQTc2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HCn9mkC1oxF8H4oD5P0qb64afoErL4ruX9TIP8+UttM=;
 b=OgtHutyLTwH/D/BrVVEqGCmd3wVarb2v2yP3UurdwAXe0rxeaFnV59EEGSEtPU2j3ZGiRbkVaUoOSXyxsgsuk5IuPUPH3jRfyF3wDZ9m83BiFm8PYZx3oL6pAnoAiUqnRE4KWIaWLxVc5eM0MHUgKlKXTp2/1GuoTmzCfe7Gms1z1uVftlZn3zxbkbEKz7QDgTlmJP8tMdIX79pP5/HghI7Jjs9rg4SIc/d4sN5i0Nt1q43qptj/UDBFMKPzXecsYLTzLUmETDMad1JHk4o7fLUeXhyDjnhyK6CyTMSuTZAoSFEs8FvKYd+ZsCqiFuyuCKuA1FBoowOuhPMm6af69g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HCn9mkC1oxF8H4oD5P0qb64afoErL4ruX9TIP8+UttM=;
 b=d+1iUX0LiI3mtFAr65EIbsFA1WYKqYn5z34IFG9nE7B0tHfVSivkrXOqoxs6xJFyDCG6K6ZyavUZ3ByrUUzG4sSBnS/PyxOSKozpIHD1XInrrBnz70roeg6F96/eq87rEv7rNKmWuq2LItShrVKpsiLklLAVdRv3CUsK86ClM9j374rrL5V9KtAMYYfT+8cTq4XljoXDE7sBCswNHi4D0ob81Ps2F34Z7lqwKM8xVpXw+G6XuQJXz4JD7wXM/8Zkqt38JwCyuE9ahssLn0wfwt168YzbGnFTSK1976oBBxLnnc6ErvIC/mdMO2I0PargtL9qD0Vnt9t49SQtKWUpLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by DB9PR04MB9674.eurprd04.prod.outlook.com
 (2603:10a6:10:306::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Thu, 29 Jan
 2026 08:43:27 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 08:43:27 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	frank.li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	daniel.baluta@nxp.com,
	dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com,
	Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com,
	y.moog@phytec.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V4 0/4] arm64: dts: imx93: Add i.MX93 Wireless EVK and refactor common parts
Date: Thu, 29 Jan 2026 16:42:45 +0800
Message-Id: <20260129084249.3079432-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::17) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|DB9PR04MB9674:EE_
X-MS-Office365-Filtering-Correlation-Id: 336747e6-8e48-4d00-d3e6-08de5f1278c0
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?z3U10OSxO8/nxpjBvzT6RbGyMug0b+nlOUj4iuZBjvB+N2zwb+5JGm77MpJ3?=
 =?us-ascii?Q?G8cIquNFYxDjGvkC94XM06jMx0IHlTIIczr4b59tqKBurcsTp+AepxdoVFfB?=
 =?us-ascii?Q?/eHszG1cBRgBX2IwtshrFOWymAK1/ETK1NLmBklYs4KwipkxnPz4joO7kOML?=
 =?us-ascii?Q?777+HHLD/Hhz9SSmGSTAO2lP/LJyMMAA1BThfg5h2wRpcZI2+lVVqzhBWxqn?=
 =?us-ascii?Q?0o+Ug/u4Fgn5+iHnyxHYKZtxgxzTaXDNmOi7VLKVKQbqGCRmvl8pFcd8WGrK?=
 =?us-ascii?Q?Gd2gPFGkGl9EXsA6V7jiHr8/TVbrqX1r5lZTeAx/wTbGPDIC6ksbh7H2d5DU?=
 =?us-ascii?Q?knm4if4zfAdvmzthCnTB1NBjU5l9657VXwEwBMvl6Hg1DdhaIok/g/nnaxRU?=
 =?us-ascii?Q?pOIOA9ApNV44DeZiyB/E2rojIK/1hEB80AjFaVPNP22aagd8/Icvdj/yYpRk?=
 =?us-ascii?Q?hsiMLoSmf9Ose9F1B4C6EL00K6P+UtKdam2P9pZo7EHARExRNDJrSgHt1GyC?=
 =?us-ascii?Q?cVbRXyERz9UAjOG0O9BnukYz8fV2UYTxkYtZVbeU46dyk/D6DK9uqAyC+STz?=
 =?us-ascii?Q?/Jk+2oQVFVdqZd76ZWciPK91ea9UMVytFbx10fpEOeoDQ1ZIkVPNCNhimAlU?=
 =?us-ascii?Q?Nqn2WaJjvAnpMd8U4sKYJvgHeEiRLy2WVIZRzmUgLBRyZYFuMiPa/ZBrVjxS?=
 =?us-ascii?Q?TtZt76eO/aUaTpIdO8Nv70RMnnPX1sWkAjeTK1mj5MJO+GCvqAY6j1Q+u3Z9?=
 =?us-ascii?Q?0Uk8yVDXGTeAVRSFBwFpH0qoHf3l9xUcSqyVOe1zB9Z86mlckraKL/FhG7df?=
 =?us-ascii?Q?wKarie+1XpvRZ1n8fous8fsH4jdZuBCvQ01JohSUcLeBFozNMWyLCnwgHCUj?=
 =?us-ascii?Q?TDcUgjUyQHT/VY3aDM1/vx8dZw9tZwaco5FsQN8aJ0bLtvNqJrIPKyEUR+Ah?=
 =?us-ascii?Q?Id/XjDxCBmmr9HOAwhsD9T9hvq4w4FFtFWd2ncyVG4u2edX+vvyxl/8kJiyf?=
 =?us-ascii?Q?+IurTj6AIj4Io9EkyHOG3en8fwlS+yDgcX82ukgejI+PRwuURr1nlIX669iq?=
 =?us-ascii?Q?abssg5IVlF8YfyjbFqhThAORzvaPmwzPUBNt+0blaELk8Ifsy37+o47dKk5e?=
 =?us-ascii?Q?3vQqM4OJ33ozJ6gj44ps8GvU4VB7kWAXS0zk0lF0QCaMd33rOU3B0L8RGE+9?=
 =?us-ascii?Q?VUdzM8on07YxLuac9QAqv83IJ01lC9N67Q07MlulFFk49CDQAqbbJ/DebTGV?=
 =?us-ascii?Q?UtDORsxhQOJuyNbcUyqnlXKFxKRP9V1cb2Z1981TuSynVEmVVmidylCRQFlR?=
 =?us-ascii?Q?wZNKuaTklrMcwshjGhXqsHmymRCZ8b+XL5PhAcF7ndDVpcPRxiGjh7FhMFKq?=
 =?us-ascii?Q?KAdspad+2UWpa01VIBESsCUV1L59LMUxfgxJJCSZlikSvyphfqIXq0G0FSM7?=
 =?us-ascii?Q?IvvbgvtViiASjBmQfKCNDOu3ZbCPRgzFdW5mPi9T0CtmlQUjb4ZLp+3NIGzt?=
 =?us-ascii?Q?q907H5xGYRPvqtWDiETDEZcWo9iu2FIXskax2dAIQ+iJrPo6XzjL8ns2V1Y/?=
 =?us-ascii?Q?PVO+clAk5l8FQQteY75J2b/JpbvbvxYKX4gqC0KVQJp4KKRXsaMXlRdr/sjO?=
 =?us-ascii?Q?DrsZ8fyTGN2VJ01RRLwZcZPRh4SycegM3wRe0TvnnbMx?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?rilKOT0q6eKUjp5F+GHaI32EdqNY8gyWMXXhAho45yI2rAuv11+RLJ1GebfN?=
 =?us-ascii?Q?yLpIzZ1zFSu32/bjUIc3Ki/eBwf73X9r7KRAAPbHPYDXy0Hf6IYpZzRX2yFA?=
 =?us-ascii?Q?qT+6teV6QGe4P8pRwHgtw9HAve5lmk0iH+j81BSj2yyqAvvwyxP2FeJloJ4Y?=
 =?us-ascii?Q?JQKun5JwSNZlPKrzFXY3+RZpR5t3Fo+wur0aDtVWH7bHrF1PG4tu44If0vmN?=
 =?us-ascii?Q?paHPZ1VawyRwQRccQ0aCfOH28i/eTg5YilOwKe3GGzrsjtyETh62qJtvZARt?=
 =?us-ascii?Q?iH42sdjvzQ3THk9G2s6UKglboWRwwUTkKnhiAmADjfWESTEfisakp6ZLoiLT?=
 =?us-ascii?Q?cff0zEcBWDuHwTjKw/vd0vdkFGFEqXQsFqIEZgzyozs2h+hLptUsljiNZjGo?=
 =?us-ascii?Q?6B0BIk/xEdG8hBczSvZmCCt2vXPwYYYM9RNWMObfBt/cMm+tO3N9r01BPbPe?=
 =?us-ascii?Q?AmxFl6oNws9UumYMtAu2EASARc6cliHCjLw1NuZiOt1U29goluoQfB32hDDE?=
 =?us-ascii?Q?wvpn6YBIoo7TsqPwE4/BveoFDIqFmTzCR9q5n+k/ZYQ1xGPBTniV3cEi/ZG1?=
 =?us-ascii?Q?FNDudogS7dpI4We9Abb0grX/DO0czkDgoOO+8Q4t4Rw72WVPDsaZ8Ow/bRr9?=
 =?us-ascii?Q?XG369OFBbF00VdxNmYB4PkmYJ4vkEW9+F1K+zo3uuJj4Zf/ESSMX26B9sEPx?=
 =?us-ascii?Q?RDt0dS0Q1EUG8xm6GlZpT2YwSiW/OVmbEr0GLijGjcUVelBcvUInWjKXVttn?=
 =?us-ascii?Q?uLxlY4qKwN6MnXyok5kRNBp3n+9IKRbnG7EHGok2S5vhxoZuFLNQ+2abAf62?=
 =?us-ascii?Q?oKMWkiO2bDb1L2U5LLBllqOvYfNeFqfGWq/C31kNgp0ntW4Q4+IMjNtpUQ0V?=
 =?us-ascii?Q?ed7xI4+mEEQR0yDpnhNqiuvzGMlQIKTW56TLbwSSD83joO0SrvRf6miW0wor?=
 =?us-ascii?Q?Jt074pX0DzHhxORka4AtrvAqIxqpFDeLz5Fgv1j1/yHAZ+QEJ6rMZO3lHKpU?=
 =?us-ascii?Q?+ORMj/iHvB6eB60TkIl+TfUDTkMOi4+HQsQBTc8GDQLuBBbSqKPFKanh1mSb?=
 =?us-ascii?Q?yZl9uDC7UDUUQV4UNNPrtjHOAjTe4QuM/S8d7RT6pzr3q9zdtALiSHM+c/RM?=
 =?us-ascii?Q?UFjQKxw3ql1Nkn6+e+lWzTR+44rvILlc3X53kKbbvBmEFXG205g09/gZpx6X?=
 =?us-ascii?Q?RsdfwqhxnccAvJj1XegOYWuPyId5MPA0b++VmgS6E5zyqb/KP4r/4p1mkQ4o?=
 =?us-ascii?Q?ri0KylD8ESyIfBR61wok4qEza6aYnN2stcwtyQP8S2CPaYDK7A/QR+a+0FBs?=
 =?us-ascii?Q?Szp3hl3wLPAjUil+XZeTbyKmHNFSH4/49v6NwyY2CdFxjCxq+nZ8j31ECEls?=
 =?us-ascii?Q?S1nrWNYlsPWrmwYIhCFuUn+i+C9vmR/ieHNd/3e/9JiSapPB8rnbk+/Ak2OI?=
 =?us-ascii?Q?MIzGLCYOa8m0oxl1NkDc0sIyx8o6kDftZ7ZkIuYXDhmyVH4OttOT+4NqbVIt?=
 =?us-ascii?Q?8k2wJFVHGVeEqVLUweo20ICilBAMeZuctfe8hEvO3D95tVmoU6f+UOj8WWpu?=
 =?us-ascii?Q?+ymgU7mcyaZg6G0y9TaLLJ2BgPnZPc6o0uO9jtCnv7bl/9CiWwPnXQb3y5Ii?=
 =?us-ascii?Q?L2vUtmP52wZbFS+bXQ9ynt9yRnA31Prdzedm81Zf4ybTvopF5Ywk5dzTlkWQ?=
 =?us-ascii?Q?q/x1SJH5+7/PryicUIvCRB2ajR7n91mKvOcJQe2Jk7wqu8w1ci1UUXd4atbK?=
 =?us-ascii?Q?+PSJ8HZ7gA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 336747e6-8e48-4d00-d3e6-08de5f1278c0
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 08:43:27.4189
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I8Llp8ClI+40DGzG/QOYgDaKgAsPUETYOHHdttWjjbXLdu4plqyPP2Z83JpymZu/3i9Kz0Hs6Ya96nzKXo/iTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9674

This patch set adds support for the NXP i.MX93 Wireless EVK and refactors
the existing i.MX93 11x11 EVK DTS to share the common parts via a new
imx93-evk-common.dtsi. The Wireless EVK integrates i.MX93 with an IW610
(WiFi + BLE + 802.15.4) SiP and reuses most of the 11x11 EVK design with
minor functional and pin connection differences.

Also introduce imx93w.dtsi to describe the new NXP i.MX93 Wireless SiP so
that can be reused by multiple boards adopting the i.MX93 Wireless SiP.

---
Changes in V4:
1. Add imx93w.dtsi to describe the new NXP i.MX93 Wireless SiP in patch#3 as
Frank suggested.
2. Modify imx93w-evk.dts to include the imx93w.dtsi in patch#4.

Changes in V3:
1. Delete unnecessary parts in patch#1 commit message as Krzysztof suggested.
2. Add Acked-by tag.
3. Add patch#2 to extract the common parts of 11x11 EVK into
   imx93-evk-common.dtsi.

Changes in V2:
1. Rename the compatible string to fsl,imx93-wireless-evk which is more
   clearer and better aligned with the naming convention used on previous
   NXP boards.
2. Impreove the patch#1 commit message to add more info. 
---

Sherry Sun (4):
  dt-bindings: arm: fsl: Add i.MX93 Wireless EVK board
  arm64: dts: imx93: Extract common parts of 11x11 EVK into
    imx93-evk-common.dtsi
  arm64: dts: imx93: Add imx93w.dtsi for i.MX93 Wireless SiP
  arm64: dts: imx93: Add i.MX93 Wireless EVK board support

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx93-11x11-evk.dts    | 861 +-----------------
 ...93-11x11-evk.dts => imx93-evk-common.dtsi} | 207 +----
 arch/arm64/boot/dts/freescale/imx93w-evk.dts  |  23 +
 arch/arm64/boot/dts/freescale/imx93w.dtsi     | 102 +++
 6 files changed, 136 insertions(+), 1059 deletions(-)
 copy arch/arm64/boot/dts/freescale/{imx93-11x11-evk.dts => imx93-evk-common.dtsi} (79%)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93w-evk.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx93w.dtsi

-- 
2.37.1

