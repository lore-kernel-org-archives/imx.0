Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794821880;
	b=MFLfeLMAIz5RUuneZru+rkrAV1ypkYOftgyu37DGvlzUUIsf8rT2wjv97/Kx5kJ5qj5O
	 MGIzgxBiY18pHoLwxrfsDPeBBG39rPBXPJj9I4dxAEXjhyP0oKfaKOvth5kfkAQtORBy/
	 jlIJx+p0S44aF9kDnLz8KARh9rsrF9Yxn3hbh6wsBbaHKKSG/pVs971m8GuPbLeZ6eWn2
	 NYEIuinypG3nrojERh/8GeJLY7xU34+zTrVMYfUoWQemSpF++yjuuYsoG7Cr1IxwvC4Uo
	 H+b+FKkhqQ6R8dnWtCFwzrwXBXujr4JpUJH3KTa8mklxBFi3RWMaJlQmxVEQoiGvLHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821880;
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
	bh=WdTMBVNbHPe+tehxhbA472AAFU/F4uTXusg952+qCeY=;
	b=OqvAjkmr+r8QrVUZ4U/o8oPC/j4AoCoWudyMVBrt2v+kE5ADEwlUxLqp6XXnqxfRCwOP
	 yftEMluDWKhYumXRn7yD1LJEDN4ukB07i4e0/F4IxlGXweRWanQszgDQisnlmRYJ/ZVf0
	 B92Ed/GmS+XnDfzRdyc2DZHPgaSmkwXQkOnt7UUu6LgNL2+1VsZBXRjylrEkJSwBpchHj
	 xmaJzlktn+1hyrsPOXqS+LTcUGS5gPJdV/63BGc/q4rnxSjN1Plmv+gnJoc3THMCHoB0e
	 TZP5tzwHz7Iul4AYpqf86WxC+lfcmYVX5foDw4xyEGxjvhO9OvkuZK99A0SiE5eyXEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=bV26l4Q1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.49
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011049.outbound.protection.outlook.com [40.107.130.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90A5606A335
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 09:37:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E90A5606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=bV26l4Q1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hpSP6n9EJSsLFJcOp76Mg33nHPGWA1XV1wNdIn7QVlTccGq4cPoNpEaqInJVW4bq0YMtGuJfR3N5wAT1r+rEqHPmcktHzCGpqmoPrqxUWLJn68kqsFFSvW+kaCbNYHCfC0nBbaKH5mKVmvu56R9Xa4fk6RzrcWcAtGFkMU0jiDWzIl0Q4PlFRz+Kqll/MlnBDCT8pvsvDlkQi2ypQoEti6PooWaxmiRQbFbfVg2QOWWQdC2uUULNgk5I327mlzcJyoWNhDDV4tx1M7Z6yL1alEoGVSHv9RQhGRw1HBN/KY5b2eHOH1SDMQpXvdRIV7EGyrocY0antjbVuZPMOYZFuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdTMBVNbHPe+tehxhbA472AAFU/F4uTXusg952+qCeY=;
 b=y0lT9DrVbpk0K6bttQJ1g9UZ5ARvvtr8D92ri49Fy7uWUL6yns5QrptjUzE7Qijrm8nw4O6vUub8tfPxcO5t55mhMVAgEoka/RNPZYflR4+bOE8IkDM+gWi7qjWY5eN7EK4AGBz7aIKx/U6bLMYYol3QJ1y5ubHXDPAfqoFMuuCBQIINnuNyFnMFkvafGbvFUbzCo8UScqmJHp+WACpAV535RKOPVxFgwcmSMDOaeZ6BrzqEoW7CEmlrsxUmOcsofcKCrUGYASPWPNwJFuiQ5OQMa6e+F+MXqelvwLnLGvoTjR4exXvLQcUlyXCymQb1mcrzJY6u3yYhsUXXCwvdjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdTMBVNbHPe+tehxhbA472AAFU/F4uTXusg952+qCeY=;
 b=bV26l4Q17LbzoOFPOogx6hCrFaSM7O2fb8DFQW6ea4xpn9iw86qOINhmzntgFaqEZ2pN4oZ17D6TGC/xJIQbA+N51Y9MoF5CTVCByMRm2AqzFDXohV4hBrwgOLW3kje/RY8iF9vmcMMXqxNdnQhL4okfcyeqpyGfGOrpsdBh4X3ZR04gtQsdU1dBB996Ds3CXnQimRtiRRHyyJuPdBwKlha1v9vi/2Sg0Zl15lvLnZTebj/kDw/Ob+8Uu3UMV+DNJO5kKSM3MWmwPgFWSSc03aUS3AH+YLJ4TO3AqoUc++X1iZMOCQHsx95WAdoCGi1agoms/VO/GPRpl6tTX3spzQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4472.eurprd04.prod.outlook.com (2603:10a6:20b:23::20)
 by AS5PR04MB9853.eurprd04.prod.outlook.com (2603:10a6:20b:672::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 09:37:56 +0000
Received: from AM6PR04MB4472.eurprd04.prod.outlook.com
 ([fe80::aed9:e8b9:c352:9ba0]) by AM6PR04MB4472.eurprd04.prod.outlook.com
 ([fe80::aed9:e8b9:c352:9ba0%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 09:37:56 +0000
From: Stefan Ghetu <stefan.ghetu@nxp.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org
Cc: imx@lists.linux.dev,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Stefan Ghetu <stefan.ghetu@nxp.com>
Subject: [PATCH v2 1/5] ASoC: fsl_asrc_m2m: fix out-of-bounds write when draining the output FIFO
Date: Mon, 16 Nov 2026 11:37:47 +0200
Message-ID: <20261116093751.138455-2-stefan.ghetu@nxp.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116093751.138455-1-stefan.ghetu@nxp.com>
References: <20261116093751.138455-1-stefan.ghetu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0029.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::19) To AM6PR04MB4472.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 5c38389f-1f52-488e-fb02-08df43c54b7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|23010399003|22082099003|18002099003|261009223027099003|3023799007|261022105027099003|261021123027099003|261021121427099003|261026140227099003|261028144727099003|56012099006|11063799006|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	oVW2SORhPuaYADnROAc6K8VlYZiOzBE9bWUucRNPQhVameBR+IGCMvkv7Fxm83hDO9MjMuLEA6EDH4RQmhDzrGgrz8jjV7BYLnZS6lnujnQ6HnWyVf9rvRyUIQk/0rsPKmQ4n9ArbIlNqhhMMBTK769y3FNSJdPwt80kqFf20G71QaONF6p6NEP8rO6C13cS1rZ7qHxWVej179lSaO1i3ijddFO0kF849LpLFX2LONkAouICGCgBiwcH/YxieZ/HN1sxEX0eOvyDrcA8DWXM7cNtAjd3Ys0jyfz94xF7nq+B/ukUc9GTDXj33LSyho/uDkL3h8J+arlJPQ6oyEkvm549lv/uMn3UMsUj92V49bdBMVGr6M9BBSOBevLxWbhsHBInBJKtFPLLhLisGBN7xz3VONoZzePtMrjMQeELcW75eZQgrMoM9euB2aF2GKyqjwAD1QQFlJOdpq4JUuHEkxy2u/0Yx6Aj6u0udY4zZV3oNnCEi3pUH+KxJ3Se8GVk0AuysqEdzoxK3arK0Jkw3cHd2VSQ3Rk5kmB69Uf3IFBmvMc5pBWIDH/kmPDnJc9pOJJIAXqGX/Ch/NGxggr3mbErr7+Uej7dsPdzcx2jgvUc6pu0UojLtEB7C+WzhaYJ1HoD0ObNkQrfWHNT9e1AwOpliqE74RVWYszHrVjYtKg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4472.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(23010399003)(22082099003)(18002099003)(261009223027099003)(3023799007)(261022105027099003)(261021123027099003)(261021121427099003)(261026140227099003)(261028144727099003)(56012099006)(11063799006)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HGWeeR2LDxkCeiAej6TIj6GXP40pfLlrqxHtm9q6yzlxhCxT9AxpTX2EfR/R?=
 =?us-ascii?Q?XsCxxoDpQOUapkQw+5vXnOO82E7nYQG9sCTc4cy6V2+ZQoV+hAAYBqfoer0p?=
 =?us-ascii?Q?MnrvZtFMyT7OUQh0LQRrzV5M5q9gceU3HCQhyFwTLG4rYCoj+s2OBEpJ06BU?=
 =?us-ascii?Q?wcsjKpohUMc6++u+6w9Xn2TQZJuvR2n03C7pi+fpD+gopA5myPCLKVTZ+Bp1?=
 =?us-ascii?Q?NqE01LmV1WGdtMBZejI3Me/RtIpljn4yScmxno/r2fiXHHuwB+DXgw5Zh1bj?=
 =?us-ascii?Q?5BE6rd+LlrhXhZ46jt7LlO/7BDpe8lpqjAEPKlQgDoQZUkXATWSiBrGMkH8c?=
 =?us-ascii?Q?8cHS69INjXa2HdNylVvnYVLtF9c+AuAAhv3Ai6AG9U6/OBvecGeLSgJt3kD5?=
 =?us-ascii?Q?wOSJBPTwd56Ad1kfJq7ApEUvXDgCr1HjhDqEsxc622M0dZEt5z77sP1HHQJX?=
 =?us-ascii?Q?O/TG7YcpWceYbwYD64ahdifpxehK/BAbjn57RfwpZUDyMd6iLGj5zZzRJr3N?=
 =?us-ascii?Q?JcG4eabz4zsckh6yYwrKTl/ptBDQAWfa0nf61QWtgSruqd6oUee4vXkBHxaJ?=
 =?us-ascii?Q?mS1FBWwYqgaye7s/28bvshMNsRg5xwnZI55QBWIq2xqxzOO+l2zoCBdGfen2?=
 =?us-ascii?Q?3Mi3XX/f9MUVNI5toYRjElybK745wMoKpzNbtM9J7OCDakbxlB/19rPq+kLB?=
 =?us-ascii?Q?7EOZsHxMz3hDNGvUXUwfEyGmKhrH14Gy/sAUviP/XeNowMiJXxWYcdlVTOQW?=
 =?us-ascii?Q?ke53O31cF7TwdpkONOoRt8qObsKzGkMPHDsa57n8WaxQ1EEUIf2+qFXhlhRw?=
 =?us-ascii?Q?sKiBfNGQH2/kzJJRVGATkej7pHifrBg1Ha63leeU1Kl3Zkjcw8MTDm+si0EC?=
 =?us-ascii?Q?IlGq9vX+05LQOyPpWxHNxg7OMaZLN9beEgxJkCy66VGWWgMgg0ikf21VmIH+?=
 =?us-ascii?Q?j46jvnXqA5ojXow2koGPFG1WPA3Zu0/YQqVQznn5EIxDUsP+XqZ94YA6QODA?=
 =?us-ascii?Q?OXg4A57jtXhn3EfD1xtmazAQK6vvZJ4uWujKVbpx+CNF7tzGqUkZg6u+pxUw?=
 =?us-ascii?Q?XeB7K+3aIR8dmko40wqR1MUnpdZzimjm9nqC+U6qOc4QL/GQkyszIb59uxsN?=
 =?us-ascii?Q?E9G49H6GysbvJrmIBa8aVsBKho3Ci+CbmVCWeMvru42xPmYK/bxCnDnILexJ?=
 =?us-ascii?Q?sPq/ObUvyv8ESHwh5nEYQj+VGj2fHLT9puDC8Xt1PHen3wrZ8qFiw8benJkg?=
 =?us-ascii?Q?LOkcCMqrylElOgfO4oZC6PlnBjM0QAgWw49Y75dfc65whMNa5Qj5FFWX95ng?=
 =?us-ascii?Q?vvQtOEyVf+GP9rhIx9xlyzctKQXxhgPsrwNsoU3Cg3jMjAYTJQpSbqM153LX?=
 =?us-ascii?Q?+M7HXkvDNg8+yS6Ovelx13mMt0rEpgH4IzAbt8rrp2PgMfM+ddebpM9jpgNM?=
 =?us-ascii?Q?dx1OLIbKmH3ZUA5kNJlMKFmpGCvKu7yyj3Vb7AaSyLbxjc/AFV5/VVI5im7l?=
 =?us-ascii?Q?oqcJ+1p4/zqY4sPOjdrVhNPg1aOd4C7uCzG1NcRvb3kJFZNOiMeQm/hXGJUK?=
 =?us-ascii?Q?uH0lMhNunsKcVJKICNoZ3wDbL8hjlcHDHVjBKEvZCpEgp2BAg7kvuRaV1ULL?=
 =?us-ascii?Q?bZQCVHQ2xWT5dxQ9Q9AH+OijeWGZtvL6eQtqYYb0OmRkWF9zC7/vYOx4E/6H?=
 =?us-ascii?Q?BJT0Ewx6IH9sYuNuqK3xwqpAl37Nio0xcTIwZwNIkqyAh494bqLSE+KKB/7m?=
 =?us-ascii?Q?aTJex8oeag=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c38389f-1f52-488e-fb02-08df43c54b7e
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4472.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 09:37:56.5034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJCoD8bGZCQxLiDEB0soJxaybiyZaKfPzAvf1fkv/FYLfYEBxn+rJzKV8AwEJbjIi0oybL8pXVa6YRhVwETcKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9853

asrc_read_last_fifo() checks the FIFO fill level, a number of frames,
against a length in bytes, and ignores the frames already drained by
previous iterations of its retry loop. With an output length close to
the 512 KiB buffer size, which userspace controls through the task input
size and formats, the drain writes past the end of the output buffer:
312 bytes for 10 channels of S24_LE with 8 frames left in the FIFO.

Check the space needed by all drained frames in bytes.

Fixes: 24a01710f627 ("ASoC: fsl_asrc_m2m: Add memory to memory function")
Signed-off-by: Stefan Ghetu <stefan.ghetu@nxp.com>
---
 sound/soc/fsl/fsl_asrc_m2m.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc_m2m.c b/sound/soc/fsl/fsl_asrc_m2m.c
index 21e5cafaf823..5e9dc5b956fa 100644
--- a/sound/soc/fsl/fsl_asrc_m2m.c
+++ b/sound/soc/fsl/fsl_asrc_m2m.c
@@ -53,21 +53,27 @@ static void asrc_read_last_fifo(struct fsl_asrc_pair *pair, void *dma_vaddr, u32
 {
 	struct fsl_asrc *asrc = pair->asrc;
 	enum asrc_pair_index index = pair->index;
-	u32 i, reg, size, t_size = 0, width;
+	u32 i, reg, size, t_size = 0, width, sample_bytes, frame_bytes;
 	u32 *reg32 = NULL;
 	u16 *reg16 = NULL;
 	u8  *reg24 = NULL;
 
 	width = snd_pcm_format_physical_width(pair->sample_format[OUT]);
-	if (width == 32)
+	if (width == 32) {
 		reg32 = dma_vaddr + *length;
-	else if (width == 16)
+		sample_bytes = 4;
+	} else if (width == 16) {
 		reg16 = dma_vaddr + *length;
-	else
+		sample_bytes = 2;
+	} else {
 		reg24 = dma_vaddr + *length;
+		sample_bytes = 3;
+	}
+
+	frame_bytes = pair->channels * sample_bytes;
 retry:
 	size = asrc->get_output_fifo_size(pair);
-	if (size + *length > ASRC_M2M_BUFFER_SIZE)
+	if (*length + (t_size + size) * frame_bytes > ASRC_M2M_BUFFER_SIZE)
 		goto end;
 
 	for (i = 0; i < size * pair->channels; i++) {
@@ -89,12 +95,7 @@ static void asrc_read_last_fifo(struct fsl_asrc_pair *pair, void *dma_vaddr, u32
 		goto retry;
 end:
 	/* Update payload length */
-	if (reg32)
-		*length += t_size * pair->channels * 4;
-	else if (reg16)
-		*length += t_size * pair->channels * 2;
-	else
-		*length += t_size * pair->channels * 3;
+	*length += t_size * frame_bytes;
 }
 
 /* config dma channel */
-- 
2.53.0

