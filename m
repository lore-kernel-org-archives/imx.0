Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011003.outbound.protection.outlook.com [40.107.130.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571303BE174
	for <imx@lists.linux.dev>; Tue, 26 May 2026 05:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779773967; cv=fail; b=k7ikL3HltQZoTC/aO/8Kyvr/l+vo5YbhhgRyV9SFUUE3+Rj0qPLI4dEu5Y8w1jYl9Jdg1UqRgbVVS1tCfbc51S5bCzqIVvpix9V5+dK6HbGsVcGiW5k/oxmM/31yLOABVnWRX8A/MNns4jvmcOK1BjQqUCPWGttPylz5cP2SfhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779773967; c=relaxed/simple;
	bh=eWXrqgK9gRmH7gp7mL1ZiI3ripjPjVAy594wKlG5D+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SDw0b75SOUumceBi9Ge3f4WZWZhcrSITjcrEArf8Dwu/9wupDORWTt3Hbxl7GGGCaS9XgJ22MG57xHMHgPwk4fYJOSkeJGwI0++3BZBlRdrI1apbelw1xZrOdZ+rQVaT51G7opKqoFzH+Kb2mdoQNxqZZAZ9dQgmo6FYBWAPL8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TSBIQtOM; arc=fail smtp.client-ip=40.107.130.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TSBIQtOM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LaxjjjHDftIqSiZ/buGMh/CpNhHCtwClR2N+W4y0IuZQLBQkv7FhUq3DDuLqJ/bC66P8BPYlg1uxr893346MCmnGobhYxdgAKgFSIPjBP/1leS4lo7VL9/tK7Gx5/AKRyO9e4Xcwh/r2o8SSdH0SfFYRC7qUvrxS7XTUuvVeI7fDzF0P4k0/u9TSI+jSrdNZ8EjCnX3FX8MV1qswHoYHXZDkiCisuyosulFK+tjVcGVEJfzeGSFF3W4rmKBctXflpieKVctTfDExV6NlWjxMV6AIIBa1Dua6IU9ALePwG1FwdIbFZmDDJCl2H5ezz55sJ+vqMMmSQjFrI9sj92DTNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNUO4LSI266OI3D3ob+rXVP0ldFw3uWAHokXER1Bnkg=;
 b=EFx//bLxryjuPLZ7gnX0O7x19d6vCZkZ+0ZPHdxEbmBUBsd+COJR5cvpC+u/sXxB5il+t7+CJuo+YgeaqdXZURQcoRReqVI/i5miMNcBzSsXHmgfQdlMsbcVqp7C70YfwMUc4/7ZkW/u4vY16YFmejrRvV66sN/cwQ7ldhZVJXlH/Wn9aZ2SDhuR7ncZrZKRW/Kd/Jsc9k1PYRRB8lCQTucSz7fnzZGvIQryBzSppvsliAsAGdlqmen3KxHXZuaOi6z2JQ00cYJp9yd3O3dF7ZqKiV4ud8I0VFLFntmbYPoJoi1qIknwfmH21VkZTPI8Utg3A3hNu8ODLKk8rPZX4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNUO4LSI266OI3D3ob+rXVP0ldFw3uWAHokXER1Bnkg=;
 b=TSBIQtOMCAYUJ3g9TZ2Ubej7847SVPugtt9jKhjEUFaz6zmN0rcMJqEen5UMFE/0Lm4moRs8PTcAPjehIaZMbKJV6zHWqARNz9e1QqjTTRD11vXXXBFiPpo/LeHqJpNGwg0MkHGaSDIQH1vh9c2wvgRAdOEgRRTNwVcUD8ZQiC4onUgk8Gtm8AWk720LwfMmuYo0q4BQ5V2ppP1ibmJANLNEWufJXwWuJrjZ58SSOstp2XifxJMrUCaIaxNFhb0TnCAn51WNYo+eAVfzbQnVudszQ5W+vcJmNrzB45eSF7JCUmlyF65kRPGjcBO95smrcCZo9lhtUJlZ+teEn9/a8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by PAXPR04MB9708.eurprd04.prod.outlook.com (2603:10a6:102:24e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.20; Tue, 26 May
 2026 05:39:22 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9870.023; Tue, 26 May 2026
 05:39:22 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: broonie@kernel.org,
	lgirdwood@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: shengjiu.wang@gmail.com,
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
Subject: [PATCH 2/3] ASoC: imx-rpmsg: Support headphone jack detection
Date: Tue, 26 May 2026 14:38:14 +0900
Message-ID: <20260526053815.140008-3-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260526053815.140008-1-chancel.liu@nxp.com>
References: <20260526053815.140008-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0082.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2::15) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|PAXPR04MB9708:EE_
X-MS-Office365-Filtering-Correlation-Id: 33c4f801-937b-470d-38fb-08debae923d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|7416014|52116014|38350700014|22082099003|18002099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	sDno9bFmjf0fnKZ78rsoVRxkB2PFrOkLVgIqzHvFc1KLNtzqhzQCp+3/1qdbDPhJNiq1VWT/jN9vB4Ck/L7UTA2XXIvcgEuPe0UgsRrKuY9IpOMNtBJhiWRRjsnYGBCwSLBvKL+ItdesIVdhkGsK7g9nrOJXRjzkZ54qyUg3qPtebQdO8VNQAwIPT4DIYnMVwOeaCeWjY9n2rRx2Dig+5NgxGPMZgpFRCDYgpWbMKc5usZCTinfOWllSuAz6RnBuNZIBxBscjNzOSua9A76KzyXx8Zp0M96qhIc3QCGnWh3dDJIF/I/5draQoMr6osodWAZnhpF6KRb/OVgqmKAYvrvgdkSC+3AGiGTQRMsjvH/930aEo7fQta1if18nKLvF8xGRpPgzZOLNIsA/2uOLiH4Xb9beAALOPruj7MpEMJXzdd/fD09PAHulLzZ4n2fY+OX6q3QohVjoRVad3A1F6s0VLKLGZ2mnO2LQA0q5oa9A0g6jQUfKUpsPjnMjD6xWqFELKIP6eyMRWqgLF+PDZ6Xpyz23PqtiEHdrbGHqbkUkALuYnyg+JoU4JwwVrY/IVn99L+2ibmbqe/+KbVKyfr4F7JWu6lq1ThseYga2tHW+uYtuwXTQkjZMAI0kcosayC53ain4EJueQaE9cS+r09Zb99ft/KD6SqPsK47Cja6baQKCaDD3FBEIO8BAPseFOWIIxWJYzuq0vktemVTlCQ+XM8gQbauYa2xGUpsKlk/qtu2ltJCpYdQWLk0CBgAA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014)(22082099003)(18002099003)(56012099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oMJ0aiGNWJbG8EOYvw3IYzAOhRpmNBNJviUsY1pMbUvmCC7E4HZwr1PxNIM6?=
 =?us-ascii?Q?nRiQ1Q1sxzrrJPZ8sqDE31c+6Ha9c/bZ7kPJ5/hsXVugGcigfgA0NrGDHdV6?=
 =?us-ascii?Q?KlCAfh2MZdh/RxRlaHGJ3GadEVcgh3VSDEtNwk8m5j1nddySnt6gwg4/0Eeq?=
 =?us-ascii?Q?K0fEtIqWjqSsW4cCuCLuwYaNLEiS1Z1kiOUP86SnDQI0A9hL/5QatOoPTn16?=
 =?us-ascii?Q?kh1VdD59+IwqXkmK64nlEHBWj/fWtt4cGJ699Mjc6smkSwudD6dP6ufkiLM5?=
 =?us-ascii?Q?kPZELBIZyU87YrYU6/X3YGx9/7m8EcsjzfcVYGS6h2NIgLiUGR+dOnfxC3A2?=
 =?us-ascii?Q?v9N6ZwOMVijCRoEajirGIGnsgwb/YyHnr6RqJJSxr+GcbMgUIUCHxF3IvkBF?=
 =?us-ascii?Q?qKHJw96v+cAeIAG+pVEmxG51iFMp/Gbetlk7S/0DtKvsC+mdKQSr10ewpnQ0?=
 =?us-ascii?Q?mjQZ+EAkgodS6SdSRQmyfTzO6emOHEneeOJSklSzwSqC0yYN93N365vsSp2Q?=
 =?us-ascii?Q?gWurr8fhyK8EyM8SRfHH1w47q5VryVOv7hHiQwIF2mUSyXcSMlbkhMPQ9PJo?=
 =?us-ascii?Q?YUkyzt6Z7Abz7e+y0sTO43e4qSYHMHU0NtcVYAyXx8EpTdCS2Ij4yAbVzkdx?=
 =?us-ascii?Q?LU0tI3okRHNPiUJsN/R0ddhDd21YLnKjTA2cbOwTW+oo/jy1rOlvQAmWBxSz?=
 =?us-ascii?Q?FUEHGYbiIet2aOnmIEhPOZzdp0OQckh6wSw71F1S8DCYGOIiWSgzRG5nDJW5?=
 =?us-ascii?Q?PhyAI0rJGP1R4BMh0P/h1faMR8vkm++89AyXiV/jt5MJJgwYpbCsprBRAaJJ?=
 =?us-ascii?Q?o44XGTMtAKBpEFYRM1f+5iEfrfSHjYyyAGyGqS4QzMC8FgzrAfvi3sVxbqsU?=
 =?us-ascii?Q?sJCzdSSHk8g3lyOOZ6LIOkNJ7cjt8PIZsMqF/qn6m3Vn/a0jYRatFNq6A1q9?=
 =?us-ascii?Q?884RWrJfkBAWtInET4ImhcNpkhGFRWoNT5+Xubd6v8GHIeere04GVvc6aKuP?=
 =?us-ascii?Q?FEV6IEYIbZpp/VuYNZ0IvwKaVANgSwyYFSJLo4KHnp2JJ7X7iOT+Sp6dlL+x?=
 =?us-ascii?Q?qHuQYVp1c/su7bAh19jn9cq+c5lss+h1EV64wYw5WkFGphK9KOh/upFvfLyq?=
 =?us-ascii?Q?43UYON/KY9qp2LXiy6r5hsW7oXGHwtgrynnhQ4gUvbYvJ4D1BWkbvpbeABcf?=
 =?us-ascii?Q?ov538QkYgLiLr6jlzHW6tBmGpJOp1aJC3rkdVnjIOy2DsANFSwWr5bIrlKZA?=
 =?us-ascii?Q?5c5xnNcbpgwz38SD9hSlziBxYr3xUrExWyj6gMtN05BhEFEaNLyiQUrpAxXm?=
 =?us-ascii?Q?vfVA0pGEFqUqPxmM9Xq16twQRu9SKKNakfZdx7xMSl+ZOzigSQVqh/wHPHEu?=
 =?us-ascii?Q?nW1E3JOua+M6gevsIP9DIWuzK0KGGEayRH7pcjsiXsoD1o+VHA/B66XoCPGF?=
 =?us-ascii?Q?3dqStuUmMnoNUve6cZaM7espe+pkzG/0NmAafJV5LO0wTY+fImKCptjQKoMY?=
 =?us-ascii?Q?FARSZ6JS+hjPkTJDIdkK1747KoRY4XWZCbYXIf2Bg0DEQ0IAN8iekwDRDyJH?=
 =?us-ascii?Q?DMNV1Pb/xLFQg/bcdR+nRcn+PwvWK+HxtlOeex64mOzxrWMBIxlLoS4vsj91?=
 =?us-ascii?Q?/I7CsDDq/0FNNbl3RgcI83uWlwHFtx2HevI0oMg0+U6ZqIb/gLJv4pxnOiTe?=
 =?us-ascii?Q?cASaEAfGGz67Rm6WaM01G3ZTrLMOG/VFkp7FSElkRC6HdEuN9vOC+cqG4gxm?=
 =?us-ascii?Q?ekEuBJgWzg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c4f801-937b-470d-38fb-08debae923d1
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2026 05:39:22.7893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CLnmvNwHtvS+QkDO9lw3GBdTyybfZIzToOP9hKDz07Pg2XBWtZqnALc6Oz5kqsh3Fkzpl9IhghSOVSnBDH79nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9708

Add headphone jack detection support for i.MX RPMSG audio cards.
When the "hp-det-gpios" property is present in the device tree node,
use simple_util_init_jack() from the ASoC simple card utilities to
register a headphone jack with GPIO-based insertion detection.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/imx-rpmsg.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index fd4624786b62..e93ca31e75da 100644
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
@@ -274,6 +276,12 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 		goto fail;
 	}
 
+	if (of_property_present(np, "hp-det-gpios")) {
+		ret = simple_util_init_jack(&data->card, &data->hp_jack,
+					    1, NULL, "Headphone Jack");
+		if (ret)
+			goto fail;
+	}
 fail:
 	pdev->dev.of_node = NULL;
 	return ret;
-- 
2.50.1

