Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010000.outbound.protection.outlook.com [52.101.84.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768301C860A
	for <imx@lists.linux.dev>; Thu, 28 May 2026 02:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779934116; cv=fail; b=pNW11VbNkrtGs13Y8DLh2Ta4eS/DgkLo5HTpRXWRGRB/B3tvn6EtBp8E8FdCbmkysOf3/cKY20btjzbYoafWAcLaojOd4HrwqwiZXbg4of92NkaOyruEVjdRntRhte/ew3ZHLJMNyLE4lAOCrrqJ2dBuPPBD3HKtkP3OWHaw9tY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779934116; c=relaxed/simple;
	bh=jVFaUoRUGxjdqFN77kVNU7n09StxsRHAYCyWcDsiqgA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TMXyJIbNcGIVYpai6jZlpGMkeRmRCVvT2x17ofFr1YJBciwetpQN5HSa3424XbXLCdBL7plXisXAvtlaoeBY3dviDDVh/+hW7xPzd9ANFHSNuNWSxIciEPPfjj53HF/scSdDyDER8otk+DTtuS69YmMcCRQRLgTaWqdcXnTB/4w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MHfQVk86; arc=fail smtp.client-ip=52.101.84.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MHfQVk86"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nhyelSBe2Nw8VwqsvLx0BPqpdfQsrwaEsvsfzNH0G5Nq130BQhZ7sRAzCwRalppaZUXAK68xGKBRZo0swdPcSHp2vN5veIbt7qaj07WuwUvqGcZNsFSsVCMdWzizKMrs3LQqH6dCaH5fdzcZ0byzcsZ6O8vpOKpNJzB0P59YMiVJMtCFh7CDXv1hAi+Zf5055UPgj9rf713b6bn6oIDNrRSbGkG1F912iUCfJTQkrBltSULqBN0hdqMoc0i26ytsDxfCvD6bVIUzSNWNn3BpQL9N+QnJRi+1k1hpkwEJ321TUYxqo4zIejb2esIiXmaXow5BbXJj2VD+rCEIIS7EXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SDq07b3tX0vuqUHK7mPjoFBpiD/RbMSMi1Nv/hScHI=;
 b=JipLZLc9cAh7N0v64VfT+fNyumKvut+sID831+mddLkdlZGmb+jvxtxQmqaz3uOn01DRTabI/N91liznX/Y880pzBQeXhrV7AocrnzAgPi196Iu95zqkKwEWbomf5JBLjnIs0NobudJMxYmyKXbb3CKGM1BZN9EsD4cGavCTaEzAUecGDqmJoy6Rb89+9agwu3xqPtK4wocYcZaECz6S609xvG/TXz4+XWfDkdMgDz5xEpAxPfivUH3IUIZfWHQpoBFzdoHTbLmv1kor7m058ar1d7C1SfUD5F7olOq/rFJUrM0az8yx2l2CyJTXTP2u/CEdhBlIfPah0rvOAuThgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SDq07b3tX0vuqUHK7mPjoFBpiD/RbMSMi1Nv/hScHI=;
 b=MHfQVk868wYhi1dghwmIu+ThTysRHDBYJLu89KdZ10w2eMkRAmVz5RunuLzKgZ+cmqNCSbn41b4v2tqroE3S7uVEKegBE08CP3QkESD2ldtUVCrxQyzssOV+sVQjU7O+Wr3gSL0RRzq5iKsFlrLgLMCTZnf/CssSpgLXubBUC4mecdXi4ys5AnLL89RJtpV/1mrgmFUR4WbJFVd79YTyv4TGmbxlCl639Ea6BO27x5JYZW4vlTJP1yfwGBwUJBVkzOWgHSDIlBAmLaSIVvo6RrM0BhF/N9Inf5VQjJHHZHBUpr4bWlotdDKHft5fPlDCJw7gocIQhMlA7kVkuc3HWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by PA1PR04MB10985.eurprd04.prod.outlook.com (2603:10a6:102:48a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 02:08:31 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9870.023; Thu, 28 May 2026
 02:08:31 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: shengjiu.wang@nxp.com,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] ASoC: imx-rpmsg: Set driver_name for snd_soc_card
Date: Thu, 28 May 2026 11:07:25 +0900
Message-ID: <20260528020725.2265321-4-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260528020725.2265321-1-chancel.liu@nxp.com>
References: <20260526053815.140008-1-chancel.liu@nxp.com>
 <20260528020725.2265321-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0122.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c9::9) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|PA1PR04MB10985:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d8edf52-d5b2-4769-3070-08debc5e03f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|19092799006|52116014|11063799006|6133799003|18002099003|22082099003|4143699003|38350700014|56012099006;
X-Microsoft-Antispam-Message-Info:
	vyr6BGX9vFNo75Ia65Sy9PhLt+l4dAffWew7puIlhQWt+6P5agmmfAL74E6P9+7UfMIZdLM1EQ3AhPGFlyTKVzwVB8zkrtKwd5BXiDZtV1Qob1N1R/7haRVb8UVaR4nmW1JhNOc4a0KUpy2yaBphUhWrzkT2AR1fPMoM8ZuXw2VaEjOCLK1HrxdFUTB/UFPQ9+zplBFsn2AG4sliScjmvzaTFnEMBFMMYPlHwVSaK/uc1BeAfRuXr0hyz92j2Ro25Vt+7cZAwE0BRfOZsxnSYn8cNEC8rL4bRs4/Tl6ZerAZcND8Mash9FMsYpwDCveaVrm1L0f8mie7I4TWE4eVH3PY5JrxKbA3LCZ1TGsWPC8uVbx0LwLv1z4CDD3T/crmQBie67bUp6g/DZ1h6SIyoE45h/BMPOgurkMRfA7Y4VtIT4UBX4YH0cS8gpJHn2r5aipHkJXKGl9r+YNf5k8U8LYuQ7i5aCP4GD85zJdwO4zZ1MySeQn2LjAIq0fvMDDV8qztG+VaQZyE+1t2b13fUSknU6fbOo/2A098H/yNkjFMI1/z3ikzfNvGgQUSlU6RPwpKykN0PXfruCbwvsmOzp18Wy5llPR67o6H83Ll5DHjfftQEv0rGtnbb7OJhFnO/nrUq6HJm58v/v3YT5n6/eW4Q6cCC861nh2OUSdMvCYcgsflybQ/SwgK76Sz3ZeOVx2vCEN29Rz93nW5I24eFL1H2HjGa2w5XLEZCSYVvFEfB57wg7bB9SY1dHWZQRvR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19092799006)(52116014)(11063799006)(6133799003)(18002099003)(22082099003)(4143699003)(38350700014)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?R/jLYIbe+WaznGg0BWAVUzumTQ1OQtL/NSpI5hg7ItTEtEda+VCK0cPFnWqd?=
 =?us-ascii?Q?oQMMCKhGPDDvW2x5HfS+TzJ/NcrHUFyzN+55rmaImiBFD1LAA9ePN5w1AyvN?=
 =?us-ascii?Q?kjo4bXo8tTx7o456faM685F3dphBLFtEB4pYh8e/7phi0MlR2e9PINrCU6Bi?=
 =?us-ascii?Q?Vzeo3YHFPWjMEin9kKJLN+4xeOfoeSUg0OXt94BNcgbSo1WOwGmu9RUPS8rZ?=
 =?us-ascii?Q?L9xg7EyN52MbUBqr15dcano3aUTkMcnbs4V4ihFCvO0vr9fqRtwpxEX5pUmV?=
 =?us-ascii?Q?ms4oxcrn1WGhz9j1fjhDHYL4ABwPmS1Pjc1VfdZQmgByVQ9qF3yTZ62BgWeW?=
 =?us-ascii?Q?sZiZd880xjIiGKPgOKwSAthUjSbvv7t30mY7sLb/ZOa9EIR7shhJMbK94+Z8?=
 =?us-ascii?Q?PPMfevsdmDIiS2XVeMGuHLPhposdTjfuflhvmHvsCjXXAw94s6e/mVngI232?=
 =?us-ascii?Q?EN4gx3JUPwG8IBJAp/UzsMS3Wz3Ej21CmjcImSdCJrFK4YEQayDV0XhL0fau?=
 =?us-ascii?Q?W7dtCwFapTE0YwvKD0zwWR6niXySnOosYD5U4dGYLaxdPFehQB8ntP4Laq/y?=
 =?us-ascii?Q?uPjbziEXc/XShFEXyqIENRGSMNFmtuoWTZ01HQ0atnR3JVTVzwlfgQDxAExF?=
 =?us-ascii?Q?NRY9GsRd2TP6cSDcgkAv45VME0F5qzkaBrnIeaoSiKGirlp80JfXkyupTCjM?=
 =?us-ascii?Q?MnF4ingOIQvCfqeDOFlOEE4D7tj/DBSA1iZugIa+sD/oMeXBO9KXT1DzlxJT?=
 =?us-ascii?Q?fWQmouzFueFtFUvfPDmO9BNRlfI7k6t/R/V4eG4ijW83WVSW1bqHJNhmTA0U?=
 =?us-ascii?Q?xmLG5KOCCGr7z17/vTMI1PsXH1sdXOIipJeM4vL2plxEhhyHhmqZk+S1U7rF?=
 =?us-ascii?Q?iw0KEjm41VIImdL1EgqpaHp5LZcIYN4VNkzPIfpDbPL+Bd6vE+OW0ililnzY?=
 =?us-ascii?Q?JONBX6JU/zJWjVEAvgkxF+HOR2LCB1MlZXOxIN+3Xaj61F0Pu0ejpqhQaEch?=
 =?us-ascii?Q?z7p86dP0dTtjp+kv2fXWRH91nV57DzTVGgeyg1jU5jTLMWfA3lMksXi6Dj0I?=
 =?us-ascii?Q?wk6XWN2LQggrR/mbBUKzMmbBhEocdiy49KOO/a30ARGiD4FR4+K8c9qP+COw?=
 =?us-ascii?Q?hC598mrx6TX3PEnUom7Bt+P+P/+nwfS/ZPGt/rKAyPTA/nRDlgPjVfb7FkWV?=
 =?us-ascii?Q?iXIVXAfgvEpnNluBu+NjUBQr+gXIbLc3R8+HAKVXoSO+lIHVztC9gSdi55x4?=
 =?us-ascii?Q?mxHwfgkZIbM2wHi5aZmBU1a+rSHTMy2WI4x5RwloQRVG6+WMihy4rZs/7rU4?=
 =?us-ascii?Q?H2SURHUeofn9AQ9TFVXj1tTIZnnHKGPRyWI+T0JqYO+VgUyYKua9Y8lPcRs1?=
 =?us-ascii?Q?cmXRm8zHDUlysrPErk+hKWyHdOrh33RoiB3X+hUjHqtbVpdK1e0yNvsx2zsY?=
 =?us-ascii?Q?GP/Ik+xWSuU2To/wp/ipIjvm/EbBP+a5esqorvB9+7gwKWffovyiNP5W6J1N?=
 =?us-ascii?Q?wE7gaCEybSlNt4Wcl/nkIPPwz8l1kJ1jVMdIdYmcd9ydbticNxTBM4TmImoZ?=
 =?us-ascii?Q?F8S/7bHpdbKeV7AVWEg+Cr65sPItTdk4sEjGWpB4hSd1hQQ42cYxqypvK0fo?=
 =?us-ascii?Q?9bRlK11jXuIGnLYTaOTWUJKfUe2pmiR01hfjaD30icgBE9KupncGb+HtS/5h?=
 =?us-ascii?Q?MFXDJ/8OKDirQaphXYCE3pHjGg5wdAevir1lw+QnpKUagFmi6yb8DwXfoq0A?=
 =?us-ascii?Q?wGcCGmtpPQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d8edf52-d5b2-4769-3070-08debc5e03f2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 02:08:31.6231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WsSFzo2Z9qIBJSrob65oTxD6p1p9kZEOpeRg4kCgN3DuVCxnwwV5DH/uZ6lNIChDhxrJ6heElsD0pYItfBsjiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10985

Set driver_name to "imx-audio-rpmsg" for the i.MX RPMSG sound card.
This allows userspace audio configuration tools (e.g., UCM) to match
the card by driver name independently of the card name, which may vary
across board configurations.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/imx-rpmsg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index 48fe471499ba..5f1af258caf2 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -250,6 +250,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 	data->card.dapm_widgets = imx_rpmsg_dapm_widgets;
 	data->card.num_dapm_widgets = ARRAY_SIZE(imx_rpmsg_dapm_widgets);
 	data->card.late_probe = imx_rpmsg_late_probe;
+	data->card.driver_name = "imx-audio-rpmsg";
 	/*
 	 * Inoder to use common api to get card name and audio routing.
 	 * Use parent of_node for this device, revert it after finishing using
-- 
2.50.1

