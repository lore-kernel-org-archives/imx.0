Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012053.outbound.protection.outlook.com [52.101.66.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0E13CC9E6
	for <imx@lists.linux.dev>; Wed, 15 Apr 2026 08:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776241249; cv=fail; b=iCXfOfxxgHSSbvGLbwnbI35wOe6cNUdxUtVsbEjqlC6pNipR6+99qG6sGp42G0TrbJYyCjUh/2qj+IBUCKObhS7zkdSNSrg962TlbjYiHTTAVsYchFuIv9jcFIiV5LvEJpA/MQt+crOQ72bMk1bFKqlnEi/M0AFgv6rA75xsZ5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776241249; c=relaxed/simple;
	bh=eGVc2yundK8VrC6HbTUusDVOFXHAI6ElO0oXxA0lNG0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k5+JVurbnnSnT5AYx2oMySVGj6iHIY+rBoVSgg0QVMn2EHSkmfPX5RQZEk4yNN5cobOsuxSKChOyBNoDk7wZ0jlMzsBdxHpu7VQuF7H0e958k/g35mxcf55ObdUXNDwIRzhf1HnfEXtvRkANTTnqDbx4EIKlFW4ZCulITIV5+x4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NcTJpiBt; arc=fail smtp.client-ip=52.101.66.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NcTJpiBt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQUcLhaAs2+mex+huKwN9ckoLlJEQo7T4gBUApf6hKoZb4A0hUQDbc8X4qu+Qm5RMz2A4F7d5N99yOetmXwTuhRovsEmCviiXhKB5qzBwo7VdSruKhnxpNQ0IRmDu3/MT6cSAvBUPp6h8zp+5zmxHOAaauqVIYIlFsJKUh6fDfkVW/vW1gehqI/06ANMRYFSNZ0gMhSYLk+/hvDM9sKXmHSQ65slYCnwp0iOnIp7YZLgNJpca+//sNyv6g7SdEsFtDpO1gi9PD+/txjBA15HtQTv7JoFb98Hdp2hbwK4Cstu/FCTkluEM1UrZJN4hchccILeQQ7b0jL3Jm6ed/Sbvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sd2aKbnCBThznzimZ4M2gAErRAKa9CNEGS5VQgBO6Lw=;
 b=TxLzDcgWw4uDAvdZCtUy9E9Lwv0FRxb5Edbgqlx908cB+tSWhkNirVvWAk3ikdRqs4ihPR0bjMdh5oNn+fdvDZxpim6mL7c34dnlSa4QO/INqSaEBS3q3lWs70o3SFLzKik2TEVm9x4AqJNvj+BRGvH4dyLuiQh8pUii3zDRvr69tjfgVrblz8ixu1sRSpq/kPJ4a9aI6RGNJFaMeBgFOczUDTurxHKG4EFW6+4CvsqlwxQjWm95qM/qdtcXLbQw9ZyQQUpgxUrGm54kjglTaCHRHgiksZux18dZ2YbcZiWOEKJu0p6q/99WLghQI10eP4RV759vEjM9laYfqjf4mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sd2aKbnCBThznzimZ4M2gAErRAKa9CNEGS5VQgBO6Lw=;
 b=NcTJpiBtvmxgk+rts5uFVskvnD7vZbZMQEuKMJESI3SSTY8bhvJgC+PmkM61nTZsivpxs6JBijv1YaMUvRIjLDiQF7lNrZu5uodeZj+f6XVDpHa0oBF4vYUV5wDtAzgAR4ANvmSMaYFnsY8J3NvzVu88I9PYi74374wSJoyLh2hJfYJUvBXkFlAG5IV+LNT/y8yRdxLcIg23Msgw7NKlSEbzxuPn8LvsVQkr0yIkE1W4WsQN7HcOjHbBX09I7z601CHVtZeswloVra+0i3yJomtdJ+zCtgMFiPMt6e9V1ZiH+NjBBFGUTqKZILXe2gs8h5IjTxcBujpCq+06gE7uJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by DU2PR04MB8600.eurprd04.prod.outlook.com (2603:10a6:10:2db::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 08:20:45 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9769.016; Wed, 15 Apr 2026
 08:20:45 +0000
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
Subject: [PATCH v2 3/3] ASoC: fsl: imx-rpmsg: Switch to core ignore-suspend-widgets support
Date: Wed, 15 Apr 2026 17:19:42 +0900
Message-ID: <20260415081942.4183108-4-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260415081942.4183108-1-chancel.liu@nxp.com>
References: <20260415081942.4183108-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0029.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:114::6) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|DU2PR04MB8600:EE_
X-MS-Office365-Filtering-Correlation-Id: f1392efa-7cdc-41e3-e8d0-08de9ac7e432
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|7416014|376014|52116014|366016|18002099003|22082099003|56012099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	N27unedSc7Go5k/kcEVPaAn/yXpYimR9edqR+l+AID5+10T7QNE4Gue10pK6xY6xDuac5kmNLQrzEEdcs2GAD50K2Le3saFDjkgcm+13eVPDDCYX6a1gebMShsE5ryypIWU8hoo90wRCndOtsntxEAOEE/zx+Np/8p2uqEF/fTkaMluJNNWTIJzsMr41iCQQsklLipryLD0yzEUB3PchnnTXup1XJ42tpcnc8c9Xn+U3C6deRxcMMwN8LcIQBpeIVvRvQB+FxS1Mzxh+pPFY25a+p7SjluZwvHaRW90d7UuP+IFxkiOhVs7RKJGNlyCvntAclxkZbZX1uW6V0u0MiCQ3Y1YXM42vzy/knYlmUUdfoxmCoo0m03a1KlM/oz8sDNUKO5V7ViSets2sUo4phqzrBGOwUrQathP3ggRU9gwG/AZKb1prFWeZugAGp+dIa438R1G6ym+gvBaV6KAbU/rCfPKX1LmqI4ILHVMoCe9NC9fBe4uJCtsXQ1hG/jGjSkD40JKKIKI83xS+5/4wQhbCecXCZSuwA7SOxkC21ra1jruUHn9u+APCnjGg3MW9ztf4A1cq1ebIZJqolrtyb6ZnOd987vvJlheLOD9OxqbcP/x/P4C+iAJRIXTLDLQUwBCvR4DG5RKtWe9lT2sGvpYQ7YlCNvUEXQEfxrQJshotBssika+07cssa6Qlu9bkUizyZsrYeXe3ehZaBS5y5bknhkkbgeltIPHcKGW0m5/72qVJewSanFCzWMsx2wSaJ88LRW65VTXNaXAh7DDipfped2VU3gef3e+yDnwOLUpyLKQDvFnIONBES/kVnvXd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(7416014)(376014)(52116014)(366016)(18002099003)(22082099003)(56012099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GaZ4sNHOEwnrzGaqoIA+1z19M1OnYFE9N6NwZvSStTlwy/Yd579rhLuvVzxi?=
 =?us-ascii?Q?CVzw55eP30xotwo3yQYyYx6DxciPasH1Cl+1lMweFYp5PpW5HIFxAx3aRAQe?=
 =?us-ascii?Q?ZAmzngff7xvypEDCcHuzqyncjtJyWic7Wzc1goQ6p7koafmqs5IIw4BsmgjM?=
 =?us-ascii?Q?5IHyq9DMyVaCqsczpzrePpHtYnBlK6/tQZAO5wAv0mBiB7njhxDshmKFxavJ?=
 =?us-ascii?Q?6mbQS0XnkGgNN08nI63R5EUx9TGCJM5iP2iVJGg/gL7+4yaObIk6eqa48eZf?=
 =?us-ascii?Q?gNYQToYHCoT/1WV7uSwAQXvckIiiWvp8KX3qp95GSNcouG4qL8ep7ZZjg9mO?=
 =?us-ascii?Q?pLaz1iPTOYf469rc9ZTn1AQpcbktyunmDoy7bL78LzcpM7HYaRk6jW1nI+Qu?=
 =?us-ascii?Q?XeWJ95tWcV2/DjT73N0mMtJiVuJWGEzcNAvqd8GXPHavxi+/eZ1spB5pqthw?=
 =?us-ascii?Q?a2TvkWsLNhE3g4mAKUq8d1rFk8S/clQ6t9BQPGSM/DZDbiXNgrPvnqsdxq5r?=
 =?us-ascii?Q?Aq1aJyxvTlwJ15IadtpTEbpkZ6aPhh7/XhCt2kYV0z4WR1NhepWnmy0UuRhT?=
 =?us-ascii?Q?/QEw23IACegvYwwpnoxUZiikKtO+fgJgZEEvKdAmrN48mYH58MM/g4Qmo/TC?=
 =?us-ascii?Q?XnDaSNRrb7kA1lPjz0csCVO+9EreDC7XBaVZvuLky4yGL5/n3gjCdExh7kEH?=
 =?us-ascii?Q?zWJFw+tG4tMr9Na4FfJK3iAHTiiVdldu7RIkX0W65TOVY/ujAD4zOibmUDz6?=
 =?us-ascii?Q?EPq3hc6nKL8lp03UIYujgX5cQxEP4LlZpUC1DTlc2BylwLSHgg69ieyI8s8x?=
 =?us-ascii?Q?dZJEBZwbCcdW8n8PmApH+st6ZWZ4Bxv4tq4jbOoD2hZ5VyMatY6FGqASMrkf?=
 =?us-ascii?Q?VWXhuyfJMjZf1AB4qWPqz1yYd7aM/+MCZVUX2+qy6E2UuxqQsyOaXry4/Ub7?=
 =?us-ascii?Q?ncj6OUitk2MmBNaJQminZPxpKLv8QI0yF20Z/xf2gHXwilKpnsQXdoRtKbeg?=
 =?us-ascii?Q?qZsF7ZLi0iupkn85/CkQUJOltm7ausHszEl85Ubr22/Epv5Jyt1j7ReFNi8s?=
 =?us-ascii?Q?ihZUQfj5lpx5Hbl3XotIfBxp9wXcLigIHowKm8ZEu8HC5ZNgJJaexc3OrtvJ?=
 =?us-ascii?Q?tQH5xL46K+ZKmUL+1nebqXtGYmYon8j4gDjr3oEGMyKtK1NBK/nedBvQUwvy?=
 =?us-ascii?Q?lG1vqCn2BNZmx6ZCDK/n9l+PlXCYTapdgOmpBo+7FYB/E5bussCrTa9sNhaZ?=
 =?us-ascii?Q?QSXvLVvtKacPgnvIJW/92nTSptbdqn962SddMVbgWHz5XOxAXJvZ5X8PR+Rj?=
 =?us-ascii?Q?l3RzDp3sLuk1gTQKujnu9pUhaEmACZQ35F+VQI8vGHhpo6A37tzkB7FTujLg?=
 =?us-ascii?Q?BibxOuc1b+9afpaupKqxoGnRjdfKxh4Msp5ToOqfVy92yhriDv85acG9Xr47?=
 =?us-ascii?Q?ONuy9iJ/jsW5swUMDIUcUAH1Xx+hJbWLBR7aHhGMIWFRhmLKMUG1QnSHEpLs?=
 =?us-ascii?Q?W5FPRHtSSyl8qKjM/L9dLlQjubLxGpIAdm7EhxUUUCiXn3GX0T2r1BJvCrYN?=
 =?us-ascii?Q?k1SyfkJwnfsXIdZaa33Rm4Uxn7ywX01k0yRYmNmMReynFtTXJotjziADngSZ?=
 =?us-ascii?Q?2OCX0A3j7SUt+TXaxIDZn91v62f6cbHDQjsiZnNbdCDjXwgPyeldOqNuFvbJ?=
 =?us-ascii?Q?1MBnsxvK3QaE7i/LP8JmijAJbKqxCpFCIZl1iHr5x1nnlodihydR+NUKnIuM?=
 =?us-ascii?Q?S1rTbEN2TA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1392efa-7cdc-41e3-e8d0-08de9ac7e432
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 08:20:45.1849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lBElHox3rYHltQiLkzwaXWufWRQPSD6zdSiMFlWurnLCOHE81L2CUEny+TjK1YiC/u9oSW8oKmepWhLOXEooFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8600

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
index 40e0043cfe15..15b0733f1524 100644
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
+			return ret;
+		}
+	}
+
 	platform_set_drvdata(pdev, &data->card);
 	snd_soc_card_set_drvdata(&data->card, data);
 	ret = devm_snd_soc_register_card(&pdev->dev, &data->card);
-- 
2.50.1

