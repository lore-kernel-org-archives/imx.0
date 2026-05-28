Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011034.outbound.protection.outlook.com [52.101.65.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D2E1C860A
	for <imx@lists.linux.dev>; Thu, 28 May 2026 02:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779934109; cv=fail; b=tWvJ0UQPpCHgOTHmiDyIXSuVfhkFeuobP67yjC3pIHht+wSwwQ503pZGHqhycTKTmeKdhUl1YJzBp0tt+oFU/S9qamHM7m9DXaKoidOwsa8qoCJZWF9Po176Xf6xzkPkc4wsPJYzEcgW3K204u1L3O7PQ04KiHVm0tHEmXzjWTE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779934109; c=relaxed/simple;
	bh=lGOPyx7U9I+5VAJby7UkROaL0unxDZSrX82/KeGjYRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kMvklcjM0h+Pz05AzQRHAwpFgVcvPPuirEkJ7+oXCHOKIlFUj91j/r4H2pwIZvLUP3iKyV9rj23zk7bEv+e+EClf+FYTEd9FGe9m3fOazTDlsuPOWc7rzX/lryGbqzp3cmX4N9U6JGpP0PgCCJJLswgL/OixSWojLEOW2U24a3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Br4x4v+P; arc=fail smtp.client-ip=52.101.65.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Br4x4v+P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V5MeVDxFRIsol0vuf1bqzLfrbAkZvqKerHrqoQekVwg4VbYfRbYP4p9gUMNFYjlA70d/jveiLS8vat5kyk41VF+OBDa2illI49yK/5jPDayHDqxm4sX7HmEnb9G8T83qII8Q1ZkDj4s2K1x0ALsGH6ZcwdVAD8BwPAdPaOvneaRIrbBRoi1jVRFjHocoT961h+UFXxv1zzUrrwzyR87sQgk5RQbAwpxC9o5YiiKuZS/C4yCA7URIKEGa9z42eQZeUclZRS2UQqM8znm1skXDWRAdM1OQeaPpRRQVNz2dykSX67Jemeu3VQz3ThpI3ttjU3cQtezFB7ZZ1qpgjrEe6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=olseYmrUlFzXDqBp4ktqBVCPqPE1pUd9DeQ058X4Myk=;
 b=NIbGirQRdU8iUuJBZzmlYRMxTw7AfXAASlLcv7tbsRAJAiyH+ik8+/g+v029fJmO+jAlrhFn+iclbOYfpysdZb+wMB5FBcPrXa/885su9bXPt91HCF7xS8HMzpxhoWbCrCYefaWn4xxyKsA+oNJnxluhsDqqBhopA4xwDFHY99NPmRf3e9HdCK+sUJnkiw3W0Bu9loaE0gdSrNgs4r0lT84jO9hsMUL9LXqB4H8BELoy9zylU1yfLSXxVR7Q3WBGK4zMm/V/ltyT16YsHTdFxd8SapQPpwE5WGV7ZgsBTi+IQVnSCMreK1hM6Nf/vrpW3OD4zn1ivcG1/ikIN/2G2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olseYmrUlFzXDqBp4ktqBVCPqPE1pUd9DeQ058X4Myk=;
 b=Br4x4v+PZB5yNLT1WTxgP0d1mHjWgAljXEhdYzD1BVHlqnSiExxcuVurqJLZiy9w5Jn36uNWkSaXIUIa+0kocHPkEXE+VjCrIJH8pSEvqSVAZ17ZGy+b4jvnD0Pv+bX4se7XZ0Iy6N9utTqEEPjJZ6QfZQMfkx7w7uc5ppJyhTuhFhpITGsYfrqLSyLOkV+KqUyrjTAp1pJLzCBkdTsxPkWOKChFe2HOfrCVcbe+SeaPuv8GZGTA/kdl4LDBTh9cZmJrUh5M2c0n9wfHA/R7hyUOWpwid8RnJu9lvPNNclMUFjUBMQO4CdrGaoZ2XiJS89ZubIQmhci+uweafYkwkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by PA1PR04MB10985.eurprd04.prod.outlook.com (2603:10a6:102:48a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 02:08:25 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9870.023; Thu, 28 May 2026
 02:08:25 +0000
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
Subject: [PATCH v2 2/3] ASoC: imx-rpmsg: Support headphone jack detection
Date: Thu, 28 May 2026 11:07:24 +0900
Message-ID: <20260528020725.2265321-3-chancel.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 54c70165-01f2-4808-8ecf-08debc5e0096
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|376014|19092799006|52116014|11063799006|18002099003|22082099003|4143699003|38350700014|56012099006;
X-Microsoft-Antispam-Message-Info:
	ugB1cB5f/z6nCPQZ0kyhEUMmNnR53wwba8yVzU/0fa5KuqJIbqpiHArI7rsOM2lABb5C1z+u9lnxVZF9HqBTQvaQ/2+eM4neHeuOCG6lc9VCPogS6kyMywMsNEv5JGDnw0jubgrH87J2ChGir1KIO+0IA8pzg/dbAV8WwtQ8lh5Rtgjd/ZXgk2bND8hIZCRbksZwnIVeg3Aj+8SxiXtYHqx5vtk/mYuGt7ghS7CosxC9FuXsAcisfUNeQSXvHobhA6NLToqn6dOjI5q56HnRGnIdCAT7OtERdATSo35j0C6b20JVe7H12NOKs07B2x8EtYbawkCBmO0tJau3FycY3zd+i2QtyHRjwLDqMqKn84hXUfHGcroqgne/9+Uaamkv3EgSVnkAjx3kSCUEIdrCcgN3BeZfumkIWYIt6p7HYC7wagBGzun+q1KPgm5N5CBlFjWEtLTEePB0NFs+5l+3JodEEP/rGig5+VfZGcZWCTRvl+N7Ej8T3LLuKgKdULuLF0YtliMDja7uJ6ZwPb6Zy3t+FPJkLaP0T+byCoveRhYbZr7W8tImTVDKox6maZykkPULbtH9J5P2GG4VkULYOmuMYIY0TRWuBGbWq7gom3ZQ6pDquVWGkx6S/L+XmfpW0NuIp4r10QgVCCqwu6KC3bGETcme+EzMiyWIrsKYI9bgzfhaa031N22h0gw2qutu/LrPuOpKIO4O9YRb4DLFscqXApjWKzb/l2lYAb+qmjrlG6QnT95apcXsdCA1ShGa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(19092799006)(52116014)(11063799006)(18002099003)(22082099003)(4143699003)(38350700014)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BLHmB+QgvUY9AshWEH+bm7jrEyD3Kau4Z//A0c9RM6Pb0KQt+JrhqpVgyiXu?=
 =?us-ascii?Q?38CSZMSoLTDgaf9UxMZX2KAvp4qjPBYerrTuvkEAXEukUoPHcIxkmvtqmpP7?=
 =?us-ascii?Q?lQYQGv3RcfrCmuCMfyVb3o9UX0KTgI6gPNDv5ZB0HaMf6lmjww+nmprPjnNF?=
 =?us-ascii?Q?ZZI7m/vVn0E8G0r7NrxXkAbzVs44BfMufwgSvJiKF+gDX5ju2+Ha9N+O/c9u?=
 =?us-ascii?Q?nwj9wmYApQRyTlCYzQ6Dntsef1nU6W9y4y08I7p/dGGgytoywXwr7wCDgE+B?=
 =?us-ascii?Q?9cYOcUXH1KWSpzFnfYk/XtfY9ZD6l5PVfconl008jt+pJ9cebNgi2freC229?=
 =?us-ascii?Q?QOTKeIDXe8bGCsnKz41QRkP2FqvgnWs9DdLpLWIRa/n8npbq4qU4tjnrgS+G?=
 =?us-ascii?Q?0xFr/DdUh0l18yCdplUAywmDE/ZGItKJoeWFjp1MoiVbUzYRtWU6UanYsF+s?=
 =?us-ascii?Q?AvPSGiL1mAYdF338OVSX4ILeO8B4auLDOb7Ze6NooOK+CWUTUmHCNIfRiJLr?=
 =?us-ascii?Q?WGMPsJ8bVjORonfwpew0OvK+plpO6eKrlJS0A+K79K7op6nJYxhIm5VqUWZC?=
 =?us-ascii?Q?/N2nnTWQyEQD+VKz2/XMfkdBxVlARHk0D3ou9lU67ldcQ6V469B5nfg9XqC0?=
 =?us-ascii?Q?1jq9EXu2kElX33FHKhJnqGsUuCN5sjv9HhQJmoCkrOkcqMXyarPCJKBMOeUl?=
 =?us-ascii?Q?K9U0HCzGrRHFOgANN8v7mjsnMHeECcBdVzOm1N7IYCihFW0N6a97j6+zQXaE?=
 =?us-ascii?Q?7JI68Pye0qwkeIYKRLLMFEgzFrNzlJVNVHVH6UzFTDSW1B7+vpVMqds1VXDD?=
 =?us-ascii?Q?H7H2Gm4o4LqYfnnaRNpZXKczpbcx17ui5JNCsuZ4O5Fz5CH7ViHIJFlR0Lfe?=
 =?us-ascii?Q?gU8rWIAeC917jMRzAoKihFg5k6VWr2EIIfzInKA+/8Ie97ThEmH1k672U1RQ?=
 =?us-ascii?Q?xdK9yA/iSyZFZfNDL/fZGj5y+1LFfFnjjoIDsF9Yi0GV3HgNd6KeOApQfFBv?=
 =?us-ascii?Q?1IXEPH53BNwh5nGtbDAEKSu+xX7kU3tmMwET3pCg5OsG38v0Nbcyg9butBAA?=
 =?us-ascii?Q?K3bCFJ0K8mHJApt+a9GDZWIkCDfwvTTHAPDiur4aY/M9y3nocNtKBYSIFmMo?=
 =?us-ascii?Q?6nqdJC77UbNF83WTKh7OGAUo8sMqNs3z0YuKVqn4mOkEIXbTzcXyXEPtD5iS?=
 =?us-ascii?Q?BZ7MbS3jNYmsHlJPmI6TvcVj0Q92G+Nj3kJF3SEaxMMuiSN3XlULEz8YwFqi?=
 =?us-ascii?Q?LV5ggFZgLBGU+HQEZejWmsI5ZajES/PNWC1Tcwu+/ZtIZ1t7xebNhCZOq+ZM?=
 =?us-ascii?Q?/mZ+iRH4raJjNtieVUkESDJEQ74oDSZdaDdLFRrRJBVHu8a8bsVe1lj737QZ?=
 =?us-ascii?Q?Lm1rDmrq5C91P7uxaMkuNq2kz4KuItL1nRXeLWd4964/qOXfebmTeji/WpSZ?=
 =?us-ascii?Q?+Et5BXkNS3g+eHpKMYReFA99lPzd7NJqXuYAhDyWwr9dDUmtaE33PxySax0H?=
 =?us-ascii?Q?M48BKUtlGYlqw4MPpmj0UV72F93jxAAn4Ysg3DIeFltPqlcHUeJ4f3nccOAq?=
 =?us-ascii?Q?juzkmssZ3lL3NhboJRIMjoynYpnVoFDSbmRFfJZs1VydfOrm1/l5BgaM5j8c?=
 =?us-ascii?Q?mTE5IXb/Hpx8RlV7DTKN8EzCgQGleAheAVFQBkLs57bSuo51vCUQPBYLwF+9?=
 =?us-ascii?Q?ktiLydCP0RsgLhkAHwCiVQx5XiJPVxfk5UQqklbMRZ7W9WHckA5maQPLf3a3?=
 =?us-ascii?Q?QX84IvAPWg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54c70165-01f2-4808-8ecf-08debc5e0096
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 02:08:25.6972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1KAk/k6Zd3L/ypZEto6ts5e6S/MAu+In+dAcJWBW3z7kDQFhen/cjN3JBus6XHLBeftJFpt4nXy1VcowXXCwTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10985

Add headphone jack detection support for i.MX RPMSG audio cards.
When the "hp-det-gpios" property is present in the device tree node,
use simple_util_init_jack() from the ASoC simple card utilities to
register a headphone jack with GPIO-based insertion detection.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/Kconfig     |  1 +
 sound/soc/fsl/imx-rpmsg.c | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index ae8774e11873..8ae59c094878 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -358,6 +358,7 @@ config SND_SOC_IMX_RPMSG
 	depends on OF && I2C
 	select SND_SOC_IMX_PCM_RPMSG
 	select SND_SOC_IMX_AUDIO_RPMSG
+	select SND_SIMPLE_CARD_UTILS
 	help
 	  SoC Audio support for i.MX boards with rpmsg.
 	  There should be rpmsg devices defined in other core (M core)
diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index fd4624786b62..48fe471499ba 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -12,6 +12,7 @@
 #include <sound/control.h>
 #include <sound/pcm_params.h>
 #include <sound/soc-dapm.h>
+#include <sound/simple_card_utils.h>
 #include "imx-pcm-rpmsg.h"
 
 struct imx_rpmsg {
@@ -19,6 +20,7 @@ struct imx_rpmsg {
 	struct snd_soc_card card;
 	unsigned long sysclk;
 	bool lpa;
+	struct simple_util_jack hp_jack;
 };
 
 static struct dev_pm_ops lpa_pm;
@@ -86,6 +88,15 @@ static int imx_rpmsg_late_probe(struct snd_soc_card *card)
 	struct device *dev = card->dev;
 	int ret;
 
+	if (of_property_present(card->dev->of_node, "hp-det-gpios")) {
+		ret = simple_util_init_jack(card, &data->hp_jack,
+					    1, NULL, "Headphone Jack");
+		if (ret) {
+			dev_err(dev, "failed to init hp jack\n");
+			return ret;
+		}
+	}
+
 	if (data->lpa) {
 		struct device_node *codec_np;
 		struct device_driver *codec_drv;
-- 
2.50.1

