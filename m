Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794821884;
	b=d/qfDDJW6iVrnAMgLEVU2KDZnQG/USvtrNtY93VIcBZj8gCVFGAa6M5DP/Jn35iy6Nc9
	 mire7i3SyEn2d520lEQ8btaT810ZS1atRCNxHS6i/A7HblAXOLnYSOf372nHjYeFbPMma
	 32gUzcEzZhAuMsU1WSfAbmnVPpPwTTSxpM4ZS/FF8CYBw6ixP2AqIRptR61T5t3e7Roxk
	 twET1qttSqEEN12Lfzh/CWPcCltorZ0769vmcqcJzEO+XMLBVxf387nc403pTtKmhfz6X
	 Fi0bFU8O9mei744mhM9JMgA7oI0RY4349+ba+M+Sz1AXr+HTuFBrWZ4NT7oKsfjL7AA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821884;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=CmNpvKO3Je/974UcXOMmVQEgJXyC5EpoHXvakKkkK9I=;
	b=mVbDHVuqOLuFm2jeNjxxZMMV3tBxAlJ+EwDk1cuLJgySOqBol11ek4a+7Lha1DiG/bVK
	 0VgU3Mm2ATwK5FiCYHLyh8IlAe7bTvvetNPa9LYBzhD1LM08aQtsypyKJ0AI1jwuo49ze
	 y/ayzlBv/EyXImAieipt8uMy1edn4AKcrmV8wAFEtQbxZnGfWqR9c2x2UV/umVwctXDGZ
	 RiZgD8OKRqA9qX4aRzk8FY44jL0E4/ypE/7Q75Vn72UQWotqUcS2FcFagfYhhJZoSL2Tt
	 T/1kvD6gsS6FsMEf4YaVp9KATEl47KcnAjT2iUjf0o311svysT9qHkWUPpxbhe5mKHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=nJymTJz9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.14
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011014.outbound.protection.outlook.com [40.107.130.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56176606A31C
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 09:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56176606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=nJymTJz9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YDZpN7hXOelWoyDsHz7GNMZCeAmsDJtpn/MfC3dPS8PSPmxxpC6GnDuoMMaePW1yGscNc4I4wXaqEpj13wtoRccPYcSqVHLhm3UlR8SZtZiOhNCU0wfnvOPhnPk2IJpVGAB6pDccYSfpoXTXxnFFJUSNE6JpaNS8ohrjrzoX9f6jgXHU++fywoSwfiLHBkVALqse3l645YaF8TZHlUt447EPEt7dMzOl1hfP6SyMAKC53lUrRS4DXWGzpufj6TmC+VBxnTfcJG+R1ZSWFGfRX4Dh4QgdtFa7AAJjCwTVWBke4KZzN0ZmBz83zUgOwfcQCD+9KJRqRIpc2Ua6Nvcckw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CmNpvKO3Je/974UcXOMmVQEgJXyC5EpoHXvakKkkK9I=;
 b=QjBS0b5mwZFpIwbO32tOMfCsxfhyyXJqFdo/6M3C5o8f3z9uNsB8IZweWbMh7XiqA2FZqqYYewHe8KQUYnwdH8ezEBslfXQdRrzbvyXK9fgy0UiYOF4qhs4BWHcG50O0M7w/7oAnlca/YFdlbuGJq01RlPxink1g4ZZgmmZT0Ul5/EKG1HzlZwNIOZasPzhu4ZbWD4YTUnnz/yajPjgDcESCqXXwpTOj2QFbuipFjryFFBACW7OEsjkhiPwf+VnqRJkoCk//LvId6+ryQmDX7Amrzy44LZ+2QYMVV6zRogLv68S/4YrzuvuKTXN3GR8/k24nOTtntWYyKZ0tR+kzcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmNpvKO3Je/974UcXOMmVQEgJXyC5EpoHXvakKkkK9I=;
 b=nJymTJz9RebTIHLdINuTiIep8byORb5oGVg7VmrFvcpf+ZRE8M9/mOCdjPW+ugERZHtu1GO+lEAX1I2A1Rr+eIsLktQ8+pez/W4tu+MzYZWJaG/sa/yW1aL9AcLTo1/NS8dciMLsJWeI4Fjb+jKwIs+fy6ZvlHMiSpT1VLICOU0tNxJkVYK7VTHXwCC+vCksCdSS+KIcU7cCKkpVp3ul/l0MR29UcwAA5eoAlj/sjNQzS74DPiH9IRO6i8x4HqZuMBdyE4eLVY7/UuH9MV6pURnSgXEw9+RuGgCphT3it0RdaywIyeIsucN+NJIkR2ZGK7XVHbl3TjfbqOHxs+mrgw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4472.eurprd04.prod.outlook.com (2603:10a6:20b:23::20)
 by AS5PR04MB9853.eurprd04.prod.outlook.com (2603:10a6:20b:672::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 09:38:00 +0000
Received: from AM6PR04MB4472.eurprd04.prod.outlook.com
 ([fe80::aed9:e8b9:c352:9ba0]) by AM6PR04MB4472.eurprd04.prod.outlook.com
 ([fe80::aed9:e8b9:c352:9ba0%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 09:38:00 +0000
From: Stefan Ghetu <stefan.ghetu@nxp.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org
Cc: imx@lists.linux.dev,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Stefan Ghetu <stefan.ghetu@nxp.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH v2 3/5] ASoC: fsl_asrc_dma: release DMA channels on repeated hw_params
Date: Mon, 16 Nov 2026 11:37:49 +0200
Message-ID: <20261116093751.138455-4-stefan.ghetu@nxp.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116093751.138455-1-stefan.ghetu@nxp.com>
References: <20261116093751.138455-1-stefan.ghetu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0019.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::18) To AM6PR04MB4472.eurprd04.prod.outlook.com
 (2603:10a6:20b:23::20)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB4472:EE_|AS5PR04MB9853:EE_
X-MS-Office365-Filtering-Correlation-Id: 592e8895-faa7-4842-fb4d-08df43c54de4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|23010399003|6133799003|22082099003|18002099003|261009223027099003|261022105027099003|261021123027099003|261021121427099003|261026140227099003|261028144727099003|56012099006|11063799006|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	Bx2Km26RTh0LGcLNgkhreqmAVf2Mr33PRjZOb+fqRwPHzebt4N3/LsySXIIuUXPL3e41HvLQi0J1B7q39+CMEQcTvKu8L4IJrACKbgpsUZCYRAuwBdrguU/AkHLkIqZphZYaoo+KpqbTDrehEO4r5lIjNMZ//XvpgM09Ji2Ye+jGkPiozWC3gZDd0tOVZ4lNknjrori3q2/6N357KuuL+sfejEajYnm5I0Jf+vNNWUZGD9W3mjo0JClTYTfNsRB/tjX2bBfggifSh6YjPSo8mM356sPwAmaDC9iciMn7HEroWoiGF2KvrAq0RJbQe6TrgSoh3CRiHIzsl/xLpFdXCYofPnF5XzTjFwprXBeuaQQZ3Q14WufrFwHCPQnxh1zt6VVsgqub/6GV6+KYrB+Fbv/fLxVwzg3mCxh55T7X8SlaHswLhrnuekwNXSXlmQizjv7hzxYm/BAs46ZcJFpoFDf/xOaGrJxX8SkulnlImOCFwFH+UfluWRxC8dC+jR+i+bz7gLHC/qPsgiZGH4/YxI2nae5QSakSG6tigFrjNLpqzjbfLpeTzNSi2PBvYa9MO55pmczdZHLHSiF+oL4LHkOpRtqvqDbLWpeT4sAfIEE9yQc5NrSTPKY58Ff3BgWF4+WRT+qyZkzFrt80FrYtNGsyEZkJlD9Ti0yjcZ6vB0c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4472.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(23010399003)(6133799003)(22082099003)(18002099003)(261009223027099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026140227099003)(261028144727099003)(56012099006)(11063799006)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7uti+nY/gGH27Hct9xpQM4SPflackBuflEIzZq3wIcXykQ67VYUbj9SFOpI7?=
 =?us-ascii?Q?AmIM+5uz5fGHmUDpaXDA/sisP9t1egnEcfdVe4uXAasJctCENDeUSX2l8CzY?=
 =?us-ascii?Q?w5601ptR09hgW8KnQj7Mx1BVsHCYk6UHLMK9ZyzTb/96LisrP5a3uP0klFO3?=
 =?us-ascii?Q?7z8TTShbM0QsGMdEA9c8F/efOTZgPU49H9WMVei02VjBAOBXS2ORB5SrysHT?=
 =?us-ascii?Q?ljhLs80Nc2T10qJvng+GvVDotuU5WrwkyY+VvKH1KdbsawycaVaVAP/dfv6M?=
 =?us-ascii?Q?P+NGRS8/PCeb25VwEnI7Q6MIcmN9PmxBpcLdWhQM90u0AUr3vBdSOoaQuMRH?=
 =?us-ascii?Q?dqdMi5f3T7d9JBvVvGLK6DSfuLvyAcQhJC6BuqbbQLttFi5wk4qG4qrC52RC?=
 =?us-ascii?Q?0OoDtyVgsnAx+WdKjNaWDIMF1lp1aSNuIarN6dwAfR2+o0OG2BQAhch4gwbu?=
 =?us-ascii?Q?QQKEh8CxniYg0mEUr8aUXJ36opT1f3VgzhK28K802MQ+6y6LKEB6T8IruvRI?=
 =?us-ascii?Q?pJi1Jlmq1nkJ9mJCTmHhZDPNAjeiW54Cb2zGRlBYsK4oUcd6f1sYoizw7WGy?=
 =?us-ascii?Q?XWG2CNUUjyhQaGEySS1gl5F+1X/Z5VYxJgZ/VTXzM5nWDeMvXI5ilQ4MIzta?=
 =?us-ascii?Q?yDE34YhVWPd5P/K8dRFGM281PXVgf6VISUV638s8YneCGMWM9Gc/fcszwjqT?=
 =?us-ascii?Q?flenW44id0IcxJH/mqpMCnj8ttJq/4U5asSZH6yP6h3xPmno/r3p5Gd6Z+9X?=
 =?us-ascii?Q?/CGXqYth9kVRRS2/92MGsmT8xBve7zhGAu5Csj+DII5280Cb3WXG//CTU8HR?=
 =?us-ascii?Q?r7dm6XKrzVPR4PSwFyAGrJxnvOWUTiIKP5rmjiWE2xBvNO1i437XVNS/sgN6?=
 =?us-ascii?Q?Dwuy+9KW5nl8P5fay27BlOVn4zPOSTqPrMLfDyoCgocOIRJkq5NuDxjglaY5?=
 =?us-ascii?Q?BT4fSj3MVqdjVmtEUJ/bidDXItQv/FRVeeBp/h0sQ2l56J0z82W5qsND7bTx?=
 =?us-ascii?Q?Hp0tHTtGmD5MtslvNuk9Dhdt5e4J5KSPA42pt9dsFwuA1bID18upN74aelQ0?=
 =?us-ascii?Q?dBwoiSsZVs/6atRv1Xklh+rypDDUZZthmGR3+qunUCgJ3FVwaWwVEyA0Dlhf?=
 =?us-ascii?Q?eVHzD4NtjpYNB0RrHOPNgRDv/nZT7YRDkh++1/48PXV4rdJ0VNt5NXksdlhb?=
 =?us-ascii?Q?1XHwMt3TQqAxs+vKXq7dJqHqQvMHNfrHB9wTRdLk+q6QLauRDNZ10iBdcjfQ?=
 =?us-ascii?Q?Hswnk2ngxwsCEjD9qJFTk8dM29TH4q+giA85TVJFMNQJGN8Lm3UIQg4Wn+7N?=
 =?us-ascii?Q?oxWUVxnMlq9RHwV6yf22luFa1UCYs0Y4hu6rVBH/Q3HJ5PjE03F5TKD7bW5c?=
 =?us-ascii?Q?3BQJpJQ1VG/9tkHQTNpJKqZissoM1RXR2qJ4ivTNYNHrshs+315Jng3iHyDt?=
 =?us-ascii?Q?XwFZk7FwdrL2bEFPyK4wsUgKV9Ek45q8Mj6ZfroXRFdpWm9FeMbxLYzOwdrB?=
 =?us-ascii?Q?cTtZn3rKanyvxyNUI0TazWLPPYzF+YumXLohokjhZsnSPN9AZy5txvpCVKU2?=
 =?us-ascii?Q?G5Vy31+cHvsRNJ1R3J06m2ekKL5VefLoGyjml2rbevByda0mdy7gEl4RU/pt?=
 =?us-ascii?Q?aZaA6uAieNV2MBXkxs3gZ7WThH++LXe4UiXR/dF6ScC/lTqeIXaVvITf6LO2?=
 =?us-ascii?Q?naJ3ePknIvdb14pac9TEZeS86rxUwrHKEmmc75bBASGWzzUdWZyRYevRBeom?=
 =?us-ascii?Q?BqMIey5jpg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 592e8895-faa7-4842-fb4d-08df43c54de4
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4472.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 09:38:00.5619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YH8A33wlNMZFe2e3SkrOo+yEJdieNsPkkn5XIZu0mLxW6tpM1Gi0X5npYrJfByLAy6g/ex9JvdRX37SOrO80pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9853

fsl_asrc_dma_hw_params() requests new DMA channels on every call and
overwrites the previous ones, which are leaked when hw_params() is
called again without hw_free(). Its Back-End error path also releases a
channel without clearing the pointer, so the following hw_free()
releases it a second time.

Release the channels of a previous call first, and clear the pointer in
the error path.

Fixes: 3117bb3109dc ("ASoC: fsl_asrc: Add ASRC ASoC CPU DAI and platform drivers")
Fixes: 36124fb19f1a ("ASoC: fsl_asrc_dma: Fix dma_chan leak when config DMA channel failed")
Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>
---
 sound/soc/fsl/fsl_asrc_dma.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index b417de6abebe..5ba4bdeff019 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -124,6 +124,19 @@ static int fsl_asrc_dma_trigger(struct snd_soc_component *component,
 	return 0;
 }
 
+static void fsl_asrc_dma_release_chans(struct fsl_asrc_pair *pair, u8 dir)
+{
+	if (pair->dma_chan[!dir])
+		dma_release_channel(pair->dma_chan[!dir]);
+
+	/* release dev_to_dev chan if we aren't reusing the Back-End one */
+	if (pair->dma_chan[dir] && pair->req_dma_chan)
+		dma_release_channel(pair->dma_chan[dir]);
+
+	pair->dma_chan[!dir] = NULL;
+	pair->dma_chan[dir] = NULL;
+}
+
 static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 				  struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params *params)
@@ -190,6 +203,9 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 	dma_params_fe->addr = asrc->paddr + asrc->get_fifo_addr(!dir, index);
 	dma_params_fe->maxburst = dma_params_be->maxburst;
 
+	/* hw_params() may be called again without hw_free() in between */
+	fsl_asrc_dma_release_chans(pair, dir);
+
 	tmp_chan = asrc->get_dma_channel(pair, !dir);
 	if (IS_ERR(tmp_chan)) {
 		dev_err(dev, "failed to request DMA channel\n");
@@ -342,6 +358,7 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
 		dev_err(dev, "failed to config DMA channel for Back-End\n");
 		if (pair->req_dma_chan)
 			dma_release_channel(pair->dma_chan[dir]);
+		pair->dma_chan[dir] = NULL;
 		return ret;
 	}
 
@@ -356,15 +373,7 @@ static int fsl_asrc_dma_hw_free(struct snd_soc_component *component,
 	struct fsl_asrc_pair *pair = runtime->private_data;
 	u8 dir = tx ? OUT : IN;
 
-	if (pair->dma_chan[!dir])
-		dma_release_channel(pair->dma_chan[!dir]);
-
-	/* release dev_to_dev chan if we aren't reusing the Back-End one */
-	if (pair->dma_chan[dir] && pair->req_dma_chan)
-		dma_release_channel(pair->dma_chan[dir]);
-
-	pair->dma_chan[!dir] = NULL;
-	pair->dma_chan[dir] = NULL;
+	fsl_asrc_dma_release_chans(pair, dir);
 
 	return 0;
 }
-- 
2.53.0

