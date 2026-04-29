Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011045.outbound.protection.outlook.com [52.101.70.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6277237D12D
	for <imx@lists.linux.dev>; Wed, 29 Apr 2026 02:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777428819; cv=fail; b=FHodvC69f3fGZhr/BOvLXrgGKDxhNoBmsX5NL1nWZK0ke/iaLeOXKElzlYNPqd5SGmMCMcpQiSti1r+Q6m5GqcP62pKNAsQbx5ZzQd1o6h7RNQ+lvWxsBe3Yq/Ujwh7WN9pqq96m2QS6OONkDUzDC/GkIOZQZ2jsiiJBzT2fJ5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777428819; c=relaxed/simple;
	bh=/LY8GhXWq7+6mLWWC9OZrTcpgEgYsV8mM6lSLIfcvac=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d4EubjR9DiWlNAWJCmkViNqTB/ZpvMsSCrpcNuAJ8iRB93+rH7wl6X7FPnsEtkKnGnGJc8G+s1q1P6tnTrKSCAaoXcTvpBgsz+4Aad3xagZqdIQ4F6TpLq3AIs8MrOdpUUyYMJyLXtxDxDiRZpw+Yn2a7r9dzy/5fLmbfbXrfIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aS1dynS9; arc=fail smtp.client-ip=52.101.70.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aS1dynS9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ic3S29rW9Xb1OaxaOLmAsvcsTtdV53WWXfm30ru5YQ1emcIXJULKFN9OyMn2zjYPsduGftrx65YVSBQ30hudB7YUV/aBQLC6kFMP3mr/5Cty42MiIbk6MjGzPm8Jpr+Edz7pzu2c7X0oOe0VS1zaBYhcEKcOkG+19pBHTQy9YObaBLM8lInWGrI3yYmZO/zfMynuRUoxr4sjFonI68MvPNNZzca6R2xw0g6U4xA0w1KJK65pz8dp4caeq7SD2o3oMuVrUCFwMtlv+Hk4zgvWXygZ2HDILu1+wfhNFDVf/9qWJUMUbnGQDDdWemaFYW+h+5WLFcSvmlI7Vi1FCFPC2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHJ6nXuQ4SshV/oziQ5Gh1tJp9/USsj3RYqxbBv4csQ=;
 b=qra5pFTD453aVEJN+xfTuvjp2Vnt/1W4oku67y5QDeu4zxKp9A15jgLGyqFz4AANsZiqq5e9FhWho4ysX1f9g6JqGqzMIbUdULeY7GjvEULYWZBd0UE/DFv14pjnvAVm9JGw1ZJVBc0CiJJZ7h4M8q8PZU0KtOmALYZoEf7yzuZanzVEQ+qCLv0Xc5YykhUzQ0pFyf0FucTb6ZQXcV2tCTCxy2IEzJycJVmEbphGMTqjyKqsOLb+M01mOIiCj+yxfXgfaVfA20bK73vTpp09XVAzbdGeU7UPgEaBzy7cb+W/zwDm0aicPL9nisAfNWmcGHPLAInEbxe4jSCDwdm1ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHJ6nXuQ4SshV/oziQ5Gh1tJp9/USsj3RYqxbBv4csQ=;
 b=aS1dynS9DktvH4C5l6yyMNLJoxIS1UQ94Yn42/mL7Lrpjfhsia5xUyMDOOa6L6O3pPekCd02ug7Fqjp3lNilXzYHENReO9bL0Jz0ouaqrFyMpVL0WSYSuO4FbYQt0iq9ADDlOFMB3ctTbGj3l3plStXkba8g6XrH8GKz+C8IRfkX3DE8tvLaeUSnp4Dxz9yarAZXY/8wbyAQaJFgi5G2i7drsl0RkmfpkQ1oxtBpdOYJJhc8uiYt6zlyXQXsyfr8aX6+9+UiyLD9lcGg+YimOONhQm2SZDxJrW7hUKNPx2pD9GTJ+hkUVau7k8FxLUIdNwAg/00FiYL9UaM6ymjNNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by AM9PR04MB8276.eurprd04.prod.outlook.com (2603:10a6:20b:3e7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 02:13:35 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9769.016; Wed, 29 Apr 2026
 02:13:35 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	shumingf@realtek.com,
	rander.wang@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 3/3] ASoC: fsl: imx-rpmsg: Switch to core ignore-suspend-widgets support
Date: Wed, 29 Apr 2026 11:12:52 +0900
Message-ID: <20260429021252.691263-4-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260429021252.691263-1-chancel.liu@nxp.com>
References: <20260429021252.691263-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0139.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c8::11) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|AM9PR04MB8276:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a13ebaf-ab49-4c73-770a-08dea594eb6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|52116014|7416014|376014|366016|921020|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	PSdQDR49WF73s4m25OMoFY03KCcb5JwrDsOItsq74x7IwwWTuRh/zQezwz+iDLlKfwNeUVRZCz95DT8Kxh1LmfKg33i+v1IMXYYQUF7YWRygrY4NVDtbz7m4CRxh7eGZmw7tjKv5pfOFE2zNdr7VxMAGDj8LTooy1RSMyjfxqYOB0mYq2elSoOx5aQFWgw21fIhYKvNORUQYxq42NdixN1y4UdSLqfF56GofFJfT5/0zTMExtmbSN6kfNwh3fFEOs7yB0zBsyidlBewsgcuDUHDiKxHLFsbqGsU3XzyBWGv/2WTUTIDO+LJeCxUoan6g6hHZz5Gu8yfBUG2YLpXygR9jy16A2+TAAteH1bD4QKCLYftr6rG7ABEcNlSASal056ECMqPMgSxpI1/Xtv/64sIXEtYwEjToeoBqsrPywza0YWpySALgtiUzjMaEriHF5e29e2NQOvYvnSNX+gsMPXrcPuR0MUGM4tEmitcJrJSQwIc7IijeWDZZ78NjDpLZZ0+g2vmILZuncJwGrwmiNAbT0seMWkHw37ANrq0FF4j3gXTnmRH1nFgYH+nTD157flWhH28GJsLoNTzalo2mpfwP+QLLg5p2q+niAxE+Tsv/4550FTJ4MUNSNKWGBLA8TpnpfHogAyk3A8b35ljvazxc4LW5t6dR39ouUvCibi5I877EXSL24nBpbFTUVzV4utwfZoI9ZBFZwn29cWxcP0afnv+7i5hp9UXyTHEjijcHFiZDTI4Y6k5rP0hmTMKjjlt0+gstkq9kMjnhGPNWYIfNIxFTgUGYK5pTJHMxhAJs85eHThPxJOZKoee5W2rz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(52116014)(7416014)(376014)(366016)(921020)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5Q1QxSLuGtJfUYTK+zNqRVhQFZjjbkdqWkwdA6X3KOzCJuIh6iwfAnInBSYi?=
 =?us-ascii?Q?6qoMcfUt4JtFtFC6x+Esw5NIE/c1OT6rxMVORRvpri+3ZNdlFxEFnHbOvAdj?=
 =?us-ascii?Q?KoRTIcRcdBWGdZby7yBsN4tQPMxyG0qGEpIm+9689c3nP0uXNhHJ9EYctLuc?=
 =?us-ascii?Q?BKBoW6V93VEHDXN08hfRu6cbd2NLY/1oCocDXET1I6GdrnO55tN5MW9AWmLl?=
 =?us-ascii?Q?+YhvpcylsXIhCXkhUfosWm+gTDVjnr/cvTDye3dhiVtIXWRbkcbG51lzdI5p?=
 =?us-ascii?Q?rYm/cPhOxaYtvKaoEs5RtPCTuKkHXRgsBZ8I4UiQcp4hTRxhA5M3gkx7M5kM?=
 =?us-ascii?Q?TBkFCutAJvVFhlMmRF882qNNIu8l5kEDC/6jaiPqzMvQbyjoa7ZoSvbvKOz5?=
 =?us-ascii?Q?OLn6DWndQ1jrDLhNGbQulkR/IjsgxAuuDKf7NVuVnzL7kU/wzJ8RcXPkpRuc?=
 =?us-ascii?Q?Bpd7sHVlHYJRp9ZxH2fhhupqiVqzyayr5RusT3fhSOYeUC0VUACIf2r2MfpT?=
 =?us-ascii?Q?MW2/QuJLTXyRw6Xmxiz4ytTu+mc+iPxIBRzahMEb5bCs+myakrag+SZvQvaq?=
 =?us-ascii?Q?0XsXaKqoYY8Y/QGqmVniQmRK9hPBxjHbQUr0BYQe6YAbh9PcRgDgJgTu7gOm?=
 =?us-ascii?Q?ewjQkCiEMHVnsuxthgwec4OZBw34OnYQgx9hdY5KTI4gIV4j6Tpn7qMGL4RS?=
 =?us-ascii?Q?57p4VyxDvYKPFXsvn1jjlrTWKG3rQo4D4h485MtIL6UmubQ47Egzh1vDn0O7?=
 =?us-ascii?Q?x218R0Gyt46sf9Z0fih/RxNeefV0Z7AnMQ6I5bmf6kYnJLlr3Lwl9nRzKx4M?=
 =?us-ascii?Q?Uisp2HuoTdyEEoNVZxe/9UCTYvykzuBS6OpKoBei/VyHnzKO5rb4FFnBU2/8?=
 =?us-ascii?Q?JvOnE90oO14xtncdk3+dnaKjHE4l36p8IAEOVxYBVD94mvb8gfqW1Rn+ITp4?=
 =?us-ascii?Q?D/8pXESRgjvTef5SoZJj2yrjQelSmrg40jJ+i8CIUusneg+3soA6101b82PL?=
 =?us-ascii?Q?Grzb+PXk7Fpy7hk41seiPHpcuLpg7+xF2nGv6rhHKgN5P8/lzwqKz7FAnwOJ?=
 =?us-ascii?Q?X7X7fKb5dLu8IkmN+jJEr0mOHp1oRRBriZQSEhgy2U+5Q7b3va2X+aLR0Epa?=
 =?us-ascii?Q?Wfya4fRiHsmvISe9evUjHrZwTaRqYV8VkYpJA4SbyIHzj+dKZstX3M8bjxI4?=
 =?us-ascii?Q?lGt6B3qE5P6FiKvgZe0Xy7gig2+9UkM4drakrsQFcEpimG4JFV5G1pqUbyRx?=
 =?us-ascii?Q?uonPTpt8qLR88ZY8tdZD2vTkkjNdZUu3WZyYeh4I/bM/SUeD7sU6oA2zeCsX?=
 =?us-ascii?Q?XoaYsx2p2Rr9dyLu/Oxd3sj8HRpf3heJ50u2NXA3XsWL/om0gefX9PA+n0NK?=
 =?us-ascii?Q?LO7fXOAk2VlCt2wtljB6j2y4ws3miins6uj2ZfHEjzQDsRxx4Kg+e6+VTN/m?=
 =?us-ascii?Q?9LUHHCYryY6Jl56F+sl+c/FexC4ie8DWFANIgIG/+wJoEuYP4SwkZgtm/muQ?=
 =?us-ascii?Q?PkILBk1SjmUvHjZIiiiFXdoIvFPybKgGBga+WK03KfLqjhg3aFUxfmxrosCo?=
 =?us-ascii?Q?FRg3Ou+JGcgQ53wB3I7iRAG3oAFw+StlRz1ODqxEkinqtMamAWPWiIOlIY3w?=
 =?us-ascii?Q?Dbnj2+sRQOGb9mpt7TJBtGpXOF0fNd/ncc2AlYGTWOlKe4gYFTPtBjXg/Wq1?=
 =?us-ascii?Q?9qbCIemxT+zGPg5J/X7CyHmNocfQF2bct10OYMaVo1Gj9jLVl6gyh9fb8M+p?=
 =?us-ascii?Q?DYu2hd0P2g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a13ebaf-ab49-4c73-770a-08dea594eb6c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 02:13:35.7654
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a2ic4EZyhrauiJMRUA0Kvm5RlI9cmmKZMgwWixPe3phqdpdLnA+kAx8AH/FRt1DyTOb2MbXA4LmMl4eXxu7t/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8276

The imx-rpmsg machine driver currently implements its own logic to
parse ignore-suspend-widgets from Device Tree and manually traverse
DAPM widgets to mark them as ignore_suspend.

It also has a potential issue that some widgets listed in the property
(e.g. "Headphone Jack") belong to card or CPU DAI DAPM context.

Switch to use snd_soc_of_parse_ignore_suspend_widgets() with the
introduction of a generic ignore-suspend-widgets mechanism in the ASoC
core.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/imx-rpmsg.c | 26 +++++++++-----------------
 1 file changed, 9 insertions(+), 17 deletions(-)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index 40e0043cfe15..fd4624786b62 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -87,7 +87,6 @@ static int imx_rpmsg_late_probe(struct snd_soc_card *card)
 	int ret;
 
 	if (data->lpa) {
-		struct snd_soc_component *codec_comp;
 		struct device_node *codec_np;
 		struct device_driver *codec_drv;
 		struct device *codec_dev = NULL;
@@ -107,22 +106,6 @@ static int imx_rpmsg_late_probe(struct snd_soc_card *card)
 			}
 		}
 		if (codec_dev) {
-			codec_comp = snd_soc_lookup_component_nolocked(codec_dev, NULL);
-			if (codec_comp) {
-				int i, num_widgets;
-				const char *widgets;
-				struct snd_soc_dapm_context *dapm;
-
-				num_widgets = of_property_count_strings(data->card.dev->of_node,
-									"ignore-suspend-widgets");
-				for (i = 0; i < num_widgets; i++) {
-					of_property_read_string_index(data->card.dev->of_node,
-								      "ignore-suspend-widgets",
-								      i, &widgets);
-					dapm = snd_soc_component_to_dapm(codec_comp);
-					snd_soc_dapm_ignore_suspend(dapm, widgets);
-				}
-			}
 			codec_drv = codec_dev->driver;
 			if (codec_drv->pm) {
 				memcpy(&lpa_pm, codec_drv->pm, sizeof(lpa_pm));
@@ -274,6 +257,15 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 		}
 	}
 
+	if (data->lpa && of_property_present(np, "ignore-suspend-widgets")) {
+		ret = snd_soc_of_parse_ignore_suspend_widgets(&data->card,
+							      "ignore-suspend-widgets");
+		if (ret) {
+			dev_err(&pdev->dev, "failed to parse ignore-suspend-widgets: %d\n", ret);
+			goto fail;
+		}
+	}
+
 	platform_set_drvdata(pdev, &data->card);
 	snd_soc_card_set_drvdata(&data->card, data);
 	ret = devm_snd_soc_register_card(&pdev->dev, &data->card);
-- 
2.50.1

