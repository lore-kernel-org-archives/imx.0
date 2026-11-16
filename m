Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794821878;
	b=PDfmm6VTvT4i/9wnC/1dmRfuR/trQjvk5ALbG4yNr/wwkAQpVDb71Gl5Xqk8CD2HHgX8
	 r5TMQ3CU7+gA9zgCIRK9BQIkEWPeQJcy/kXxL0Q7EYTpzSai8PiV80rEPx/L4ePRbHoPy
	 FFU83uKdOgh8j2X26JPmTeVuvwESPi/CJWRJwF4jDF50J7gxHNxj4CW7rlqSR/BpA/brJ
	 xKyMzj9hGSmAqUdNXOQiNa1CivRx3ErIWx7u4CEjyd1x7E6Cn+DCOF1IGnwG3Yq6ITv+y
	 JmUEtXhwoOS6AoxU3eqvFAGyMnTpp3u/MpxDxCgjcvYKCxp86/7RQdCh9RAJCi06uyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794821878;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=w0v6Q/UoO8JI/j9G6VKwneSd0+bhLW52GqMpABJTY+s=;
	b=GCFKSOkIgbuA9RgZYVPav1MSDpk+vlW8LxgIuskqrlZ6zmdX8QTvzLERck/qARrk22tR
	 5fn98z7loaoodQKFKHY9NmpNOHNA3tRSZMB5R3HKImaQGg06EMSsUqP9SU8eJYcTXzaBR
	 tqzQ9Y6ta9iCdFCX59XqhBL+WZpIeAkPUxbnjP1iSWDzQrYd1jtLhwAhPROm+q7uWugdP
	 khwtLw3BEYaJYdmHcL5s7jHGgY9dTxVgXH54klpzQ+iqA/XQwP01eA6b/XZ8++s+STWIi
	 r0B0qVqrOE6zl+WiesDV1r6l+ngumifAATmggWwAIhk+DfNbRGMPMIpsSSsK0FxzU4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=aTnEqm7n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.49
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011049.outbound.protection.outlook.com [40.107.130.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6E5606A335
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 09:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A6E5606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=aTnEqm7n
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yD17jb02VNRnas5shtdMex43zbZwDcKBUZzWmO7AJcyMQMU3HmU+35mCvL68PyWboVcXWIGGc0pyG1RSbAb3LooDDw85jOtfoWt5Fa091LOORY36V4RgjOhcHw2N2t4xf8phlgcYkGPQV4+4SaelDgbSLMmoNEgqn5qZor62cPGnDkXeM7adyl1i5pYCZHeBRpe43KVyPLYTXsXML5XFRoSMQJ6fy3EZBY/e4nYmqEBVzvS/MtEuB4gGAw/LuazqYraVO+PTef3qiJNGd9SqlfUb3sDQ64SZey/aTrRW1e7X/hWRYiWwN3pRshKBhsRtP7HRL3hf1K6T01qK4LFPuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w0v6Q/UoO8JI/j9G6VKwneSd0+bhLW52GqMpABJTY+s=;
 b=GCHWtf6i/XeWVNN/1c4gYjfWTZlf+OT+Uty12wUaQVdteN1txIT6VSNtQjATp76fI5AR+scFrM9vG1zlcx3rAov+M04E0lVvxsHMUeSOxcxK/Bl/pYx6SH0QuWKgtMii0dcFFsXLptiR3tKpzn4zsySSwN5WaMwQuNfV3mQAlLFR0J+V5A+uG94Eh2VRluXcdoC8qMJbUs1jA13NOb178Srhaez39YoYYZYBHuWB8+pl6ZodU2afm8U9KQ4WgwL/40EICmI3E3ZTXV8Rpqy4rA87W8yvx+eRpQBkMRd0+r640f/xlXTTqztWhMg3MZ29F6KMkW9B4sYWAd5h/kftTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w0v6Q/UoO8JI/j9G6VKwneSd0+bhLW52GqMpABJTY+s=;
 b=aTnEqm7ns++caTbXmLLNivSj1Uo+OWCX81u1plBHnTxDhod3iw9OspprUWTMqmpW7oLdWUzCZjr6XJBihGDbWfwm1mem1lsI8QVBzb2S7+R/jmGVM1CONUwB6vTuZMaCEOlTodwDGc4iwZFMbweXVvmdlEWuCsn4hAgi70nTY3psWEzs9jhfaL837f9jz/p/82Yzp1imMIkQq1HNTal8sHPWp8RtOkcsy842qGWrGwKdqz7e9PwS9C8hNZk/3pBjeZQYG/GVgDTQrZfeXJAXF0crie9AfsOKAxyrV1MBhyySJ3NE5i/dds4y5zjXbOuC/SgntpCejgcQNCyPUoTcZg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB4472.eurprd04.prod.outlook.com (2603:10a6:20b:23::20)
 by AS5PR04MB9853.eurprd04.prod.outlook.com (2603:10a6:20b:672::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 09:37:53 +0000
Received: from AM6PR04MB4472.eurprd04.prod.outlook.com
 ([fe80::aed9:e8b9:c352:9ba0]) by AM6PR04MB4472.eurprd04.prod.outlook.com
 ([fe80::aed9:e8b9:c352:9ba0%6]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 09:37:53 +0000
From: Stefan Ghetu <stefan.ghetu@nxp.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org
Cc: imx@lists.linux.dev,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Stefan Ghetu <stefan.ghetu@nxp.com>
Subject: [PATCH v2 0/5] ASoC: fsl_asrc/fsl_easrc: fix memory safety issues
Date: Mon, 16 Nov 2026 11:37:46 +0200
Message-ID: <20261116093751.138455-1-stefan.ghetu@nxp.com>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS4P190CA0028.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::17) To AM6PR04MB4472.eurprd04.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 3e590304-af00-43f1-506c-08df43c549df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|23010399003|6133799003|18002099003|261009223027099003|3023799007|261022075727099003|261022105027099003|261021123027099003|261021121427099003|261026121527099003|261026140227099003|261028144727099003|56012099006|11063799006|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	KAWzOStty/Fv522ZZR2VOfVeqZfWespJ0PU04nD9Cr5VHqVbJHf2Y98FBWFmFmKo5eSC2O3euOKZDHrh2EvaAeEWSe1XQ4p66rncC4Y13zTOsNIMX3+bHIe+8q8BBkF47+QrfQltuynJ+SejfHPe76BakW8/JCXMwlEMCnFUz3qOkFqNsc9mw4rXdG6sg60STu9C4hB2JEL/sc+843Kw30Q1Hc7qxmmCKzkGqheytXFDXq8YWvfOA/uXSgEaQCZQpPsPJZDQ2deqXIlDF01aWeqk+jZYEltEBl92qWF9iY9ofYoVReezKXbhAkC3d3tFree0xIvpgetOFhpY0m5doVS6QKQK2oOonErSmmYm3G4oXcWXA+/9ud8XsLX+NiloVGmMUFQDeak3Ec9UO7eb97hbc8JvOVjjnu0VvGWXEyguf5l/vhkkGp9i9otLCahzIDQMgqPB7bJoriTIpX0mnIjD53h6XI0BsFto2Ngz213qTXjrXK1IcFLCufEI2ucPKKmW6oS0O4UeVKwSYK+U0fRhqjIGQrf/WkyhSeKi3c7DPiNPEx3lAfBWrUwl895+Gb+9MairP3+seZ7XtOon/vUQuRpvLLaEvWSLZVf+pegUBXsOq6qi5z+ZJPwPAwyg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB4472.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(23010399003)(6133799003)(18002099003)(261009223027099003)(3023799007)(261022075727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261028144727099003)(56012099006)(11063799006)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tzWH7A6gmjtXPvKYMuNHm/xMNTrWmXByuHEBk31DIeFPAbdQ+gxW7Vb9v1Z4?=
 =?us-ascii?Q?XTDCguECdpFoMeNmnq7Md2megTdGTHJxvChe7orCfC/v9jtubGeTPdmy1PMr?=
 =?us-ascii?Q?YjBNdT1iLel04JXqnY1p7nQA5jDDFoXqhN4GGqSNbWNSXuGOL2YRBupG5wta?=
 =?us-ascii?Q?pwXVylTN4Im1ubu0Ppr0QJpfw8ZcyxQBsu16icfqAt8r9FQg28my1hrBFQcq?=
 =?us-ascii?Q?AJzuAPXcr2yhBo1xLLQUvia6dv+usGa3pTMEwpf0aHVIYdd8uzyF/HwkcRN1?=
 =?us-ascii?Q?Kxaljs3RNWItgqgL7Cvjw6bEuuU+46Z3DRUhz2gSUOl/8IDhVFDpbQrXkYV8?=
 =?us-ascii?Q?e6hoxm7i4YiPambmi+QnJTjLel8vSVyr/t7QlpZso5fQ3nmq45wfTHL6y+u8?=
 =?us-ascii?Q?6tOyiSw9MI9wr6rd/GXhyP50PPu8EjgjJrb6kbU03q4mTum65E1iZkepx93i?=
 =?us-ascii?Q?epvAfpo2mWnki+jR4dzj4e5EzkYB+1EhvA2YpijuE1XRuJ9REJ0UY+547qAF?=
 =?us-ascii?Q?ZLr4ppealvjah8LOKq6N5RS+suLGo6D9EMhy1IdK+lM1MPRDWYd2j13Y7aju?=
 =?us-ascii?Q?LWwSz6uGguHM3s8v7GlmEJ8Ri5zMpaOzZpeRTXms/EKa3kbLkrF1imJgI14W?=
 =?us-ascii?Q?gXMaIqlNPCTq0BkZEkj4F7aWq0Cs1hRcMp6aLG0WD7XBk7JMX/ktiZbpIcv4?=
 =?us-ascii?Q?OCNOgiiQyLT00NSf8LISu7jLDnK1vbk8wv96+m52QzTP3Yep1A5jHATyuqbz?=
 =?us-ascii?Q?sydwcKeruo8EqP4zK4adBr2uJ5I7Dlpy+avMUSAo+qfI5v+sjGfrGRWpZRZ0?=
 =?us-ascii?Q?ioTqeBte1+gvTby/6ZwUCLUNppbIy74r6U+wFRBAkuzMs12D5b+QU/nqA3FR?=
 =?us-ascii?Q?FeY7uEjmCrkzyUwDfGLSA1XHyGz/Scacm5UF0HcwcwcXHZR78o9DHIRXPhCo?=
 =?us-ascii?Q?Xn+gFUU7Z4w/9KUwFTDxQm0KKbs550O9ZBcvej1xZCWhwlPqqolYh9i/O/CS?=
 =?us-ascii?Q?9lgoPwiWlY7twSR+iUUoGyHcRBPruKr+AhHXEQ6d3isETYktzjIRZrrn0B53?=
 =?us-ascii?Q?x0Faaw+YoDA0qUktRpfr+QP9/7be5PBWrcLGzGgGYTh6Hs9U4t/UCALUL7RV?=
 =?us-ascii?Q?Z5V2tVTv4x+kPtXKJsAWYDKiT8kQWhrrv7+WeW72PhuXbNqEyu107Usc71qO?=
 =?us-ascii?Q?dS25pUo6MNWG3mmzu5pjTM8Xc+hfduHXOLd085hKi+Q09sr+JmbhGl5P/odv?=
 =?us-ascii?Q?qlcHk6T+3p8GRaebH93fY+t1dA+ghDKEFOx/BByutCG8iS82de8aXwfUcBwX?=
 =?us-ascii?Q?eG9KSM76Nj3fANRkpfb5fRQo0vjC8b7hHvTAzF32tuDkjukH+y1ttHkLAQ4U?=
 =?us-ascii?Q?h1tP5qxN9Zp5cb9N5/JYQWpC9qZ5ixY8j9QWdMy0n8r4cOA4ydolKXj29ub0?=
 =?us-ascii?Q?x6aK289zJJ9nHbs0ZPYZMz82GGrnAlylobzZjfUu0PYNW55qTzMTyFt19BWH?=
 =?us-ascii?Q?ZJ1Pz/rjhTrvXokTtilCyh6UFkv1yosbVcGrawBcS/VaVTQtBQUjXG1CRf98?=
 =?us-ascii?Q?6VASS9UIOlaD8WDHasivm0Z/0WDLG62HUkmIBu2cbKZAdnRxKEUST8PR46VC?=
 =?us-ascii?Q?gOUtuTdK3vuHEsVJHNfV7Vy6ULtagpwPbZ8QEMorxzrPRzkWcvfaRGtgh7AN?=
 =?us-ascii?Q?wxxGSPAZpGtTkltMHc1/paALaCVhUprh5/OMaQWd/EGUKXxts8EOeyj0NiaW?=
 =?us-ascii?Q?AWLrX9b2bw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e590304-af00-43f1-506c-08df43c549df
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB4472.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 09:37:53.7930
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ngggk/B+MGBofx1oiQA8kysRTDshqkwnGAu8TJrvKJasOEfgZw5Y/2vO5O7thi5sMgW6yctXQzcoXLIo7P3SUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9853

This series fixes memory safety issues in the ASRC and EASRC drivers
that can be triggered by a user with access to their PCM or compress
devices:

1. fsl_asrc_m2m: the output FIFO drain can write past the end of the
   output buffer.
2. fsl_asrc: a repeated hw_params() leaves a stale asrc->pair[] entry
   that points to freed memory after close, and hw_free() after a
   failed hw_params() can release the pair of another stream.
3. fsl_asrc_dma: DMA channels are leaked on a repeated hw_params(), and
   released twice after a Back-End configuration error.
4. fsl_easrc: the same repeated hw_params() issue for EASRC contexts.
5. fsl_asrc_m2m: more than one task per compress stream leads to double
   DMA channel release and a stale pair entry.

Patches 2 and 4 make the pair/context release ownership-checked; patch
5 relies on them. Please apply in order.

Validated on i.MX8MP (EASRC) and i.MX8QM (ASRC).

Changes since v1:
- Patch 1: drop the 8-bit output path, ASRC does not support 8-bit
  output (Shengjiu Wang).
- Patches 2-5: add Reviewed-by tags, no code changes.

v1: https://lore.kernel.org/linux-sound/20261110120743.6301-1-stefan.ghetu@nxp.com/T/

Stefan Ghetu (5):
  ASoC: fsl_asrc_m2m: fix out-of-bounds write when draining the output
    FIFO
  ASoC: fsl_asrc: fix pair ownership on repeated or failed hw_params
  ASoC: fsl_asrc_dma: release DMA channels on repeated hw_params
  ASoC: fsl_easrc: fix context ownership on repeated hw_params
  ASoC: fsl_asrc_m2m: allow only one task at a time per stream

 sound/soc/fsl/fsl_asrc.c     | 22 ++++++++++++++++++++++
 sound/soc/fsl/fsl_asrc_dma.c | 27 ++++++++++++++++++---------
 sound/soc/fsl/fsl_asrc_m2m.c | 30 +++++++++++++++++++-----------
 sound/soc/fsl/fsl_easrc.c    | 10 ++++++++++
 4 files changed, 69 insertions(+), 20 deletions(-)

-- 
2.53.0

