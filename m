Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.14
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794821886;
	b=gXM6pvNMGJN3vQyw55G4DjAKJKDegO+exitROXDqdMUT0Y46sGhex7MvnHZ8irK8QwWs
	 LXOXtFqZPduEnDCNTnckUp0NZLT1givjiPAxozzcvHzU/YWv6RYmShZECMaKHhSnEOHav
	 M3oEoqDWZYIw9Jl+kMGS/+hWw1ZuLaq8mnBD4i/Ri8H81Oyl3uiwVFcFGaNTzb0q0XC0w
	 jGP9XtLNYUYyGOxXT5g7yV0DugixwQrsNKg/cOIK3Yoz9R6Y+piimzcpgYjIxTIqjz3XB
	 IxM2hne+y3G7C3f7AGZq8AXC9rekJsUBer2s4qdYFITudzWbnWHvhhUp/8D9xbINWpA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821886;
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
	bh=4u5hRzxLN/KIHR9SqKzlNkbU6kE20q0y3w0HvIaL8PU=;
	b=lf464nFp0bJ/eGCgX1+S9KpeW2KeNVNjpKno5oEoEJWFPYHuoq78zrrBBjB8uo/PPN8p
	 xH/KmpSB0WPhJe1DldlIlR+Pi5G8z7tDPUjU8I+qOenEYXgdDnQzDBz0XHiVcLkXE73Nm
	 yE7p+kI1Ll4X8QjscnaFlULA3xbHtckJd9WVHvhsLASKc6VTDPTaq4ulr+IDozz7NV+dx
	 5cjmmOXorR4uIU3bSZLP/UEy5KqklOzxZyMenu3J3oK7hQl3q82D/OFf4WmK3zuZecil+
	 NIAJoemA0VvBJmE6YtKcaR7xAX0XzFPLhUvBuKWk0Ns9p1PYkdoPv3T8XL+V/4R1VaQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=nogV63Ha;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.14
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011014.outbound.protection.outlook.com [40.107.130.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F24A9606A31C
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 09:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F24A9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=nogV63Ha
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VC3hJnsOqoRm0JEVaD0qeWUkF6dlT9egJRGKLXOQtdJFHiiwgB0h4KUZ6VO5WVwFYyaPJZ9oKo3xrDJSOvN1AHtAuQ8vXeMbWPssZMaFejjslOlUYsKYBBwQDvChvFzyRCZ+/Bz/PddKACiW5Gcg8Wq4LcTBKZUdkRwuqUetVSLrDGyIFXe6Wen5mLhtkc++9JV9y0Cjq/NyZt0iOBPrLK+G47Z7tXiDzXmlFkybbDKmKyY3b8J+LLN5FVXwsI+W8zg0SseaDWmprx3aFKhSE8F6eQilGlI0DBannDkXYmWYhh36lYiXkjQwuBjN4gLXLdDy6poqpYi9Lhg1xpm7zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4u5hRzxLN/KIHR9SqKzlNkbU6kE20q0y3w0HvIaL8PU=;
 b=xIeubaIySheYN+1zOC9k2uTi67kTziThFRgnjZge5OuC5OPe4tl4cbn+qh85PIaNxI4Yb8bGC295eYr6SoAcgaic2xVI/edwKUcovQqvrcBLAKerRmJQcIbCErAWmnvCRWZ0Ojn+2n7WXPNmKrABpUMdmTQd/zBavrNu+Jb4OLIDltk5eqJdkXj494Za/L5ukLRSScKeBMfsww6zotkTNeksUFXdk2D3tRWfX1RJA2REfpecdDYaZwevHCiQdZoBbDf+IDAZqNAZxKM1slmC77ROpbtREa3ez0yTV/U43zGFCD4hOlBEO00EU+DPkgEY1Pc8vd7iT3KagYf2CNid4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4u5hRzxLN/KIHR9SqKzlNkbU6kE20q0y3w0HvIaL8PU=;
 b=nogV63HaBYfk9NNwqq6MITNki4EVlDd83PGqzRBSvFWr/EpJKt21c9EO5N8xUbBi/kNFEhiVsmctmwqIFr5t0Adcb5tQgIbI80WTV7cV2V8u/qLsxSpNvVlWfhlZsTuvhEmW5KuqO5dthiwWbbKGHBFZx1oSiXVBXeiR3kGI+TwIw4tPERYBZ9cGBnQMU7uEySwyBH98DX8nl7h0BfJkWzTWjIMNDqW1maZT8oeIh5P2gxLPtxWh2qzqcYMlsv+UOgxRw4ajTd1pfo0jZ/t38SdxQo9zfD4Pt1bhWrFHII+Xi4OD6O3fkLdWWgzABbBy3huB+FG5aHWVCWN4GzkDmw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4472.eurprd04.prod.outlook.com (2603:10a6:20b:23::20)
 by AS5PR04MB9853.eurprd04.prod.outlook.com (2603:10a6:20b:672::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 09:38:03 +0000
Received: from AM6PR04MB4472.eurprd04.prod.outlook.com
 ([fe80::aed9:e8b9:c352:9ba0]) by AM6PR04MB4472.eurprd04.prod.outlook.com
 ([fe80::aed9:e8b9:c352:9ba0%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 09:38:03 +0000
From: Stefan Ghetu <stefan.ghetu@nxp.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org
Cc: imx@lists.linux.dev,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Stefan Ghetu <stefan.ghetu@nxp.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH v2 5/5] ASoC: fsl_asrc_m2m: allow only one task at a time per stream
Date: Mon, 16 Nov 2026 11:37:51 +0200
Message-ID: <20261116093751.138455-6-stefan.ghetu@nxp.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116093751.138455-1-stefan.ghetu@nxp.com>
References: <20261116093751.138455-1-stefan.ghetu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P192CA0025.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5e1::19) To AM6PR04MB4472.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: a2891c25-4c00-4661-e7d7-08df43c54fe4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|23010399003|22082099003|18002099003|261009223027099003|261022105027099003|261021121427099003|261026140227099003|261028144727099003|56012099006|11063799006|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	QU9hzXBMXUNXoBlh79v4KZXehq6ChZExNVo/uRFceQJRJlBD8tpYsb1V3cahsWmIOxFzrgrJ5/WNI1KAeZk8sTiCHqGcOJxp0B8gD5XeoDO5j1jaxocQWoWCjmLmdcCKqLWxTAFrKD5imcDflwK0N/tDkvGVEZBqERWdQRAFUCr7r1XEUaGDgruFKtmuRqZAfvvXJ+zKkf7xLAOQsiABuRYgShlu50X9xRxetGLdbylsXCAjY1xqT+FHKAuIMeCgjnCB8uFf/EMT5BgxJCZbf5SaqW2r4E8BbucBjY/Cn1TSlUwTe9JhALswYOeRuY4XKDPpcSfhrZMfxhr2KseN0sp0PxevIcr7UVJPuBIv7MOVkZhExDvz+GsLIzy6Agn+RMKksONYIvP3GPSRdRgGIcKxdzPEjeQ4EEH0yKOhHPUHRV0w8uGMtyzWvDdBuH0k7HxrgtpcRO2ZuFJT3vVVXltutWfsNom+zI2xS+IcTAyXtvyBQUUOLBzCJC1tvFzC7BZHJAZuPyC8axuNqtyGNI+y4okK2s8vW+9uEiCJ7Ne1fDO3LHydwETcjJYoxaslTEHNTgKUZGbG8OkEf2hmlu7bWTT5ajUMtAcTfS0aCnQ06TYkQJN9Sv0c3zwlzu2PVuM6kQDOOWqipwmF+me9EGb0Yioo651cLAkGgqp4XDU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4472.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(23010399003)(22082099003)(18002099003)(261009223027099003)(261022105027099003)(261021121427099003)(261026140227099003)(261028144727099003)(56012099006)(11063799006)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4c4NN5rvGUVksHS+9t8LBeMqfZ9tN3u73ZSdc51+lFA5bqqvoHeG78xCZaE+?=
 =?us-ascii?Q?PNEhyq96JzVhbcoIiCr/lqqO5agR7/pzwep8v98mZsE9mhkT/tBWrKG72Fi2?=
 =?us-ascii?Q?HQiIVnYvgex41NONVjdFI4j/Rt7WSq/6E5lSsg+mGezAm9UW1IVLCkiXB+bQ?=
 =?us-ascii?Q?Rq1/kMR+NAEbvbo3qFbjDV5Krh+4tJ0ggYZBeN51fiBA9t7XQ09GdX+i/vaQ?=
 =?us-ascii?Q?4nrrFp4XpALk/ZCfjBHTCmzGbz8o4bE/C/lLSjcVXGswTNKAVbi4gfJQY/kd?=
 =?us-ascii?Q?G+1SYqkfmPrQ6Fh7hC6nc9dtBv9T6KEh1CC1bFtIOBeePzXb5yxNjYfoVRrY?=
 =?us-ascii?Q?tYn5OI+nXhnDpiP4Y11PgsL3dWaalAtAWL+dlBjBBt0+OWEeiZEjtPF9QMzg?=
 =?us-ascii?Q?YY/JmC/r0Ot/kzpV4L6pQj5GUX+U0XON2bjHGKQFpewzbtkfaANq2m2ORDqX?=
 =?us-ascii?Q?XeFCdfZ7hkzbGtmVQZh7PJyQMtIiDkhoH3L6mgQNe92nz/cyxJSl9AusnbAI?=
 =?us-ascii?Q?UMo55yAaQrN/hSW2zHUN82wC5TTLza5WrpXZONRlChaZpPaH1wpqbxXHyG00?=
 =?us-ascii?Q?LOK/FalhnGQfQ1RQoP40CmefxDvKSn5dF5/mvXr7jIJZi3schoGE6uFlULSR?=
 =?us-ascii?Q?O1Di1/x8SdYGWOMjq0qNjnyIWGbV+G5vLfc27lgDGup4tS0dNqlRHLsU871q?=
 =?us-ascii?Q?OLS4iHqS4xyUdQdnwusATqXQnywDcj3NBoIn6WaNtYhMXvjD2Z6gK/BqdP0D?=
 =?us-ascii?Q?Vh7M2hxtgbd6QhhK+rPCiAFiMLy3YH77rpggG30wXHSLaNdbeBjeR9udUf5/?=
 =?us-ascii?Q?dpu+BSAWjHdhMrVEPjmm96KorUZ90z6x2/zVNmnspHXicNnNqHi1LBNXH9/i?=
 =?us-ascii?Q?2wgReMLFOuAINPOP7iJmkgxogTLB5ohEQwj7IyrXArFMgqBySKy+yorhV3q9?=
 =?us-ascii?Q?a6eHvVB+RYWysnq1iXQz8xztKuqAXaSiDo0ANo2GZhtBVp0bnMb3/2CN/lRh?=
 =?us-ascii?Q?DxUZHohgmzibGb3/ST/m2U05RA5Xa6O7RlGFdWfi2QcVg8eL/PpQXntEs/qb?=
 =?us-ascii?Q?951bHyWQBDynM2OetecfDSMqkYZT3RF55amGIzkUsfFPsl9KtnhhTdThj6+N?=
 =?us-ascii?Q?C8W7+LRGWppZiKnnI9eYcWHKupBBYD+FipoPer6zTWSaf0wzXf25LN70Sor4?=
 =?us-ascii?Q?GvmLmBPC6/qOLWE+HYxTVryvxA2LGU/auqEQlhl9M4oSWmEfx6S7bFxTij9U?=
 =?us-ascii?Q?8ZaJ3oEu8FS7nEH2sfTinbtBEZCoJPAHIFtnaEaDlhT08wHCYHlvKi1WsbXy?=
 =?us-ascii?Q?nrbj5Wpyau9XD4nmgCWrH4sR0HeUCXx3Ge7EzTsasrj81MdnWmAzOPSM+Hs6?=
 =?us-ascii?Q?o40iq6T/PW7dcmDPVV+XGwsK+XFgeIK49yk+Ffoch3+bi9WKV88n3nohRO1U?=
 =?us-ascii?Q?3a4T/mn8gKHIqkkuPAsXr6Qdr6yamgtJfcBxuVcgoLHplJ6Grd3MFWGrLDD9?=
 =?us-ascii?Q?Xn9E1WBQl14vshTn6nj4pUK3SMSdsnozJPfht8VJrPAo6/IJFph1dMRZUCF1?=
 =?us-ascii?Q?0E8tdVDNJfdm5gMa59JBFGyy2nAcrIg5/8YeJBj6LLQKdT2TDz1B17BrjoA5?=
 =?us-ascii?Q?QVPm36xpY6gIsF9JwZlHo03wtfAzQvP2rrw+3egYBT3fZqxeHJq4eorS7l2B?=
 =?us-ascii?Q?gwZ1tGCu/S92ytcIHsqlvNHr9f00GEvA8R9mrL857385miTU4bvayxuYsXNW?=
 =?us-ascii?Q?H0Df/+X1ng=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2891c25-4c00-4661-e7d7-08df43c54fe4
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4472.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 09:38:03.8850
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tLfUJ4t9AdMByzCqk/2C5shlgedOEfoPKKqbXmpi0gnog0v4Eg+bNQ9SLB8s/JQFm7dqnnyk5/0JNlJjF2r8Ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9853

All tasks of a stream share one pair and one set of DMA channels, and
get_caps() advertises a single fragment, but the compress core allows
up to 64 tasks. A second task requests the pair again and overwrites the
DMA channels. Freeing both tasks then releases the same channels twice
and leaves a stale asrc->pair[] entry after close.

Return -EBUSY from task_create() while a task exists, and clear the DMA
channel pointers once they are released.

Fixes: 24a01710f627 ("ASoC: fsl_asrc_m2m: Add memory to memory function")
Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>
Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>
---
 sound/soc/fsl/fsl_asrc_m2m.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
index 5e9dc5b956fa..0537a8aff515 100644
--- a/sound/soc/fsl/fsl_asrc_m2m.c
+++ b/sound/soc/fsl/fsl_asrc_m2m.c
@@ -470,6 +470,10 @@ static int fsl_asrc_m2m_comp_task_create(struct snd_compr_stream *stream,
 	struct dma_chan *tmp_chan;
 	int ret;
 
+	/* All tasks share the pair and DMA channels: one task at a time */
+	if (pair->dma_chan[IN])
+		return -EBUSY;
+
 	exp_info_in.ops = &fsl_asrc_m2m_dma_buf_ops;
 	exp_info_in.size = ASRC_M2M_BUFFER_SIZE;
 	exp_info_in.flags = O_RDWR;
@@ -526,6 +530,7 @@ static int fsl_asrc_m2m_comp_task_create(struct snd_compr_stream *stream,
 
 err_dma_channel_out:
 	dma_release_channel(pair->dma_chan[IN]);
+	pair->dma_chan[IN] = NULL;
 err_dma_channel_in:
 	if (asrc->m2m_unprepare)
 		asrc->m2m_unprepare(pair);
@@ -570,6 +575,8 @@ static int fsl_asrc_m2m_comp_task_free(struct snd_compr_stream *stream,
 		dma_release_channel(pair->dma_chan[IN]);
 	if (pair->dma_chan[OUT])
 		dma_release_channel(pair->dma_chan[OUT]);
+	pair->dma_chan[IN] = NULL;
+	pair->dma_chan[OUT] = NULL;
 
 	return 0;
 }
-- 
2.53.0

