Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.43.123
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795078830;
	b=uUBfQSYHX4vuciZIRCCUOwKAH5oMeeylP2AOAM1QQ9M6QdUT2Hz4hPPv3uRAPr5LgzHm
	 5E3wyNkRPdAVXI+AAQH2aKdCyuCtIyOm0I6t4mHt2BvkZKBeuh+BKzkFz9cCacN3hapx3
	 /nk/Ce4SfGK3l00ugD7FJNDp+vRmjMaUveFhAPxsC1SNRsRsDx3umzllXfMpIhi2MGPYu
	 VGCKtwRT76KG8aOMV9xFtKn/ah+xRTxDj1LVf2UikQAVlCYaed1DGRwmRaWzYHAG2sjM+
	 7zr02Av79P80WE1t7ZXbNEjZ2i6WgQxxtEzy6lMnAcQxewWTESTake66PWQyekXuy6A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078830;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
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
	bh=jjX2lNkyB1uIQWyjFTPM6OIk7140LB4yEkDDUJ9ROEU=;
	b=CPfNTWcUHuD+7/GP5EvSfuqGPsX7ftmZ2uCG0nibPYZuSUZNLOrVlbrjABmV6Zt7ZdsM
	 TzEa9eB6CbS8EH/BVkKG6iaA3aS9/p3E163GIFQfA4/55+s3y4qy3fDfqzXcESSEkz/99
	 B8YyhRMNoxv91bRR6uZJ2IFnIFdEv9Q5bfRafsrspk700bTEcA8WiQHnGhmX1mNt7fM6S
	 qoFp/bfwkBlH9cEh/kzx3POtB/7SSzsQLRdMNSym812fBUTwUlxvdTiDMpRIpDAMvxIEo
	 XWqaUR65JJhex1fYPXtymwgW2FwbA32BzCfBjpXg84lbzNzN581CUe+0+hm04Sh/7pg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chipsnmedia.com;
	spf=fail smtp.mailfrom=chipsnmedia.com;
	dkim=pass header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=I3ATarAm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.43.123
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022123.outbound.protection.outlook.com [40.107.43.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B97F606A33A
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 09:00:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B97F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=I3ATarAm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kdkKZ98uUIiMM6We2/TWhgzarBxfvRlTPqcH8/l1pufIrfd+afQ+Txwsu+T4M7twS5wO+q1ooYQjE2Wmc7VwsLVBV+22ehhKYJSUBe6diQqTvruDFh3p1BxJBtkgMIjjiZL9vHyB+/ZmnSgEYnRAV7NMBT7/JQF6kywmL4mA5PTKuRUq7i0bfpQwwcTKeBct3BHdgqQQ15AMCY7ydB9IOve1L8u7Z23xY52c5uSPsLljZ2MdYRSUnEPXHie7d0lChw4mOHaWqffCD80QG4/XEt19/pZPs/CV9OkpLr2ojDf2mz59Uq+6pq8myOaZrpcsy6Mx/ziPr8ZZLYIqxCRJpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjX2lNkyB1uIQWyjFTPM6OIk7140LB4yEkDDUJ9ROEU=;
 b=xO5tcm7TlP1TtySisawJOBMvSLrYLd3c8Cp/CnXLDmERJzL2+lFr1/bg9pFTV2ST5rZr/r2jRNpjnWiGsHnMrPFglp1iHVij6yCoeR+KOwRM9Xy7wplLB4HpFThevpFlbniEVJt08RgXKVM3HgFZWLgV+tlEWAe+N+2dyb3vWX4Aymq9PN5XXfDi5I/VWIqxxMht2hWt+R3CijCtJPWkiQt2pXZD1/jbozAt2vHUP5yjkxMz2TBSNCPRyue/nx5cci6KAfOkobhfmqJIebXQ0sFIJTEJ+smWXE2uGXcBHam7wdiSXcPa4MCjD7LbekYP038GUAMoQjCd+dsmjJsj8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjX2lNkyB1uIQWyjFTPM6OIk7140LB4yEkDDUJ9ROEU=;
 b=I3ATarAmcXoB8db4vHDwdP2Y4nbSVNoyzgjphwyhgDBf0pK8uuyLsYxIGlTOfSAAgcvXucB9niPSh7QQhQ2B7EhyXr2TXOc3Xh3SDY75jPcur8S7wNLU7Negb7WSIHc6lGQ3Lhs0iKQCnZqGCRBzEDtENKkjKNoCe7kpzBAunLd4g3zLZ2a4/0ombH9ByMBYkmnm/f3Nneu0Uz5VdoZFWUHBRP5RIQJfwLxeDELeE3nDJwhqAfI3mT+3nMQtnNKa3JJTVGNBE/xebqQcLo/B7HSOz4aLetf+iGaTBlKdhSExn9FShoAtAPu1szNwNf5BeaPjrj+HvJoQxBBz9iMmRQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SE2P216MB360180.KORP216.PROD.OUTLOOK.COM (2603:1096:101:30b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 09:00:23 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 09:00:23 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	festevam@gmail.com,
	kernel@pengutronix.de,
	nicolas.dufresne@collabora.com,
	ming.qian@oss.nxp.com,
	marek.vasut@mailbox.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	Nas Chung <nas.chung@chipsnmedia.com>
Subject: [PATCH v8 04/11] media: chips-media: wave6: Add Wave6 decoder firmware interface
Date: Thu, 19 Nov 2026 17:59:58 +0900
Message-Id: <c246cbe7fe5fdd1affbce30b8c7f7d2987fd308f.1795075580.git.nas.chung@chipsnmedia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1795075577.git.nas.chung@chipsnmedia.com>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0060.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2ba::8) To SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:1b9::8)
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
X-MS-TrafficTypeDiagnostic: SL2P216MB2441:EE_|SE2P216MB360180:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e613ebd-b821-44a9-f38e-08df461b8bdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|52116014|376014|1800799024|366016|22082099003|18002099003|6133799003|3023799007|56012099006|10067099003|261026135527099003|261026140227099003|261026130827099003|261026121527099003|261028144727099003|261021123027099003|261022113327099003|261022105027099003|261021133027099003|261021130227099003|261021135927099003|261021121427099003|261022075727099003|261022115727099003|261009223027099003|261102123227099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	ipAPA26M2AqN5DC05vv42SH+dMtzqtBOJyWHLTkvK6Bq2ojBTSFhJYgvPztGjb1E5oP1v06ceK48OX6miJ62ESKDXcBLvNmA10dwxdRR4lR+TibqNOJbXbXoWDmOCgg0rllVQ6akv2uVXEaTha6A0iouy4o/mC+qxBqAjUwr8GEDFImHUOtFF1Fuv/wh4jX6DQJZ0xecEf6HoHyy6RbRvAo7Ri3v6vwDsnt/OwSIB07PT3Jr6tWMCMIHgj1h/93C34KplsoS/jM/jI8kZuWKEeYeGZJzpLhD6kOt0/zdsyzvq9WGHiv2hHPKqEsfoaCvGOhg/uifuCAZk/xeIMNbdPkUxuj/5VuXRtZCfjJc9hK4KDZT2EraJLfDS8hV9p1PV0Kf2bxpcz36FcMHaSOLycVl30HBjcPBKbXknDkFrKR464oE6F+yRqwxLvRPh2cvrfLb3lJ0TKFZXwNq+dbY05tQBPC22XFYuGmqTob0blDXkWdR8+XSNwAwTcJNogHFbez1GsNcmImr6FKSYIScTKTSAwqoWKLgvX+zi9w6sfQSzAOGOhQtp5R23hoX5qTz0T6fsUmsP36HekEuE+LI2nE2LJmn0sHfpu1J7TIsIvbpE4ETB4AZyS6mOxspNx4zkdW+yfasQ+VR8++aQXkJ9Om+4znWmfU32XpugsYVl7dCEzr8j4sdatIiJzg9F+5tAl/oivIUaY9iWqxHd5owigbu48ryczBbY88oO75XODk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(52116014)(376014)(1800799024)(366016)(22082099003)(18002099003)(6133799003)(3023799007)(56012099006)(10067099003)(261026135527099003)(261026140227099003)(261026130827099003)(261026121527099003)(261028144727099003)(261021123027099003)(261022113327099003)(261022105027099003)(261021133027099003)(261021130227099003)(261021135927099003)(261021121427099003)(261022075727099003)(261022115727099003)(261009223027099003)(261102123227099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lz6YPJIACDBI9OiRn1uiWD9gT6FGaiz7H5Nr0OC7vIaBTmNu5UK2kTh+LXKK?=
 =?us-ascii?Q?flmaTJH1Lb+qWfwCwypaasSChpwRp1gG/rmkEwxpNR8fn3GzP6+SIGIkCNlw?=
 =?us-ascii?Q?Z7XKDVluaVhsdoxNhtWnPxkNB/+oGSQknVQTZsYNpxSnMNwFcsd7933AaH1K?=
 =?us-ascii?Q?30DkhkTQwxsuV5AknYBbA8iem/2WsDtEC81kgYOFkhYmds98okJ3V1sP8Wd7?=
 =?us-ascii?Q?FWLpbU/uYH0GYMBDO8HRvkWvNI6Mo5KRBH1Hx3dr/0ViYjhlHZrzwRjEVMDe?=
 =?us-ascii?Q?D2Lp2xXL6NDO2oNZCTEkfy3KYbfb7KylMwmCqtZenL7L3ERo1kstzoxQ2e/x?=
 =?us-ascii?Q?E8oq46Hx0jvuCYics9vDaNoNC+TUvJKZvynVLm0LCNJH7QAqeCKe9+zTyIv4?=
 =?us-ascii?Q?SBmCxEUHyI3Hm/fMeql2y81VhDAlysnyqHZ5PeSisge3ouwmlAZ70uay945A?=
 =?us-ascii?Q?VrcnlleX9/MEzsm0f4vsx80HmIi7vPBEHNlRqWCzxTVj3ZDowIkknGfXQdJU?=
 =?us-ascii?Q?EEEzni0ieDgNi8G77OWwmlRafgm5TiNEU9u3Ym8x+opEL2JOVYZKAvgyCMRP?=
 =?us-ascii?Q?OKw7ZPh8+I2xgNBGdyGzEdF0kcew6eGNoVkf05G9/L9wRRM14tgiWFkoYmV9?=
 =?us-ascii?Q?7IjVoBKNfbjlE3RbntiadPicTbMfAeh9CrgsFrLyomRrkxX8TWXLvMagzp5y?=
 =?us-ascii?Q?gVSvCxH5IpvyVtFd6wrLj/Jf7p4bQXW62na482aLJAB4DAMiqxHdOHYgAmMY?=
 =?us-ascii?Q?e045RnPh+6Is7KVVacDQpq84FSH8ft6odK50ei68iPQPE0M9Qpemj686kTrJ?=
 =?us-ascii?Q?/CE0yHarRlaUFDdGO53RzvTOJtXjV6LRWyxGCegyktt+Ttw9f3k/ApwHMbBA?=
 =?us-ascii?Q?PUX92zr4ht3bEBflPYUmik544UoNiMZJqzBiLYb+xdc3A78XoiwXEwzsDJzJ?=
 =?us-ascii?Q?S1eoI3ZG+5a2wNkPaCRCCRkrcZj5PDxka95EN88LJiXXml2tLrBu/dJ15fyN?=
 =?us-ascii?Q?ERel5cINKV8cDzqA9xBfNAGRaRrzgH7mAhngpjD+QWI7E/ODKJweiDOUj/E+?=
 =?us-ascii?Q?1iUo+dPJqlmc8xzjWp2DHXJKH6f+KwPKaK65Bz4Ss1ivkrUuS1qDkPqZTJ6E?=
 =?us-ascii?Q?KC1q63rdWkEkJgQF7O1LtE+yvkKJqY4kAMYjgd/+boOuECUGAvxwoZ0QvrFk?=
 =?us-ascii?Q?Cy7BVp1E+0hsGdff796aIhyrRd4dyCEnCAU+cyf+5mfF7/Sk1NvZ5xTAg8iM?=
 =?us-ascii?Q?DSF8/40PBQSPq0hy/qXrGap/VuE5jvhekvYxYElAZ6F64wimiRGFLJTsszR0?=
 =?us-ascii?Q?6VR8u0pFyj55EPOGP8jvhje4ezuzrK52xSGBBrEP/+5/ZSHVIgL8tdlfKTJp?=
 =?us-ascii?Q?Q1gRBEtaiVomIRHD2a1UaYpu5SS+oe1Zb8rdnmamnQBSAIbUruvwYWGNUPrG?=
 =?us-ascii?Q?HO+MRsltYBdbX1S9eLWakAg1GRsii3BfNCa07IdIqCMls7TWO7DB0ASQWGzb?=
 =?us-ascii?Q?iQXhkvyPo1gJx30rjC3pEL3CRSoAR/U6B/HNON7OQgX9CX3iHdh2vl/bgO8i?=
 =?us-ascii?Q?8j+ozx93JH19SG5OBS+5rTWdp02wP6iQhuFTBpiaxkjdfOOtbKgN4dh4Zyn3?=
 =?us-ascii?Q?P6ZKxrimG/KdMW+Fr0EfyC1xH2CCW4KBduq2dD57CRiW3+PHC0IzYMxTds3S?=
 =?us-ascii?Q?mme+2Ru0QTwTJUbVqtoYKCT+MxDoBFvHD3l4vqlEt6+bhWaj3Zjbm6qhCvip?=
 =?us-ascii?Q?EImOZV09ur9FO5rs8/OfX3BW4G9ya28=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e613ebd-b821-44a9-f38e-08df461b8bdf
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 09:00:23.6360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v+hfZCVj0rK8nIxGoybWgcVMltx3eo8c1tGKVyt8t/uwHm/VaoVmCJqrQGcJVmbzTWRCvu57r5IlXM+w5DKfgnQ10UFp5YClUDSKqmBL5gU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB360180

Add an interface layer to manage hardware register configuration
and communication with the Chips&Media Wave6 video codec IP for
video decoding.

The interface provides low-level helper functions used by the
Wave6 core driver to implement video decoding operations.
It handles command submission to the firmware via MMIO registers,
and waits for a response by polling the firmware busy flag.

The decoder commands cover instance creation, flush and destruction,
sequence initialization, frame buffer and display buffer registration,
and picture decoding.

Sequence initialization and picture decoding complete asynchronously:
the interface interrupt reports completion and a query command reads
back the result.

Tested-by: Ming Qian <ming.qian@oss.nxp.com>
Tested-by: Marek Vasut <marek.vasut@mailbox.org>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 .../media/platform/chips-media/wave6/Makefile |   1 +
 .../platform/chips-media/wave6/wave6-hw.c     | 753 ++++++++++++++++++
 .../platform/chips-media/wave6/wave6-hw.h     |  27 +
 .../chips-media/wave6/wave6-regdefine.h       | 219 +++++
 .../platform/chips-media/wave6/wave6-vpuapi.c | 202 +++++
 .../platform/chips-media/wave6/wave6-vpuapi.h | 168 ++++
 .../chips-media/wave6/wave6-vpuconfig.h       |   5 +
 .../chips-media/wave6/wave6-vpuerror.h        | 252 ++++++
 8 files changed, 1627 insertions(+)
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuapi.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuerror.h

diff --git a/drivers/media/platform/chips-media/wave6/Makefile b/drivers/media/platform/chips-media/wave6/Makefile
index 7bfc28ba5523..08f11724b81c 100644
--- a/drivers/media/platform/chips-media/wave6/Makefile
+++ b/drivers/media/platform/chips-media/wave6/Makefile
@@ -3,5 +3,6 @@
 wave6-objs += wave6-vpu.o \
 	      wave6-vpu-core.o \
 	      wave6-vpu-v4l2.o \
+	      wave6-vpuapi.o \
 	      wave6-hw.o
 obj-$(CONFIG_VIDEO_WAVE6_VPU) += wave6.o
diff --git a/drivers/media/platform/chips-media/wave6/wave6-hw.c b/drivers/media/platform/chips-media/wave6/wave6-hw.c
index fcf5be294ef5..872a540df021 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-hw.c
+++ b/drivers/media/platform/chips-media/wave6/wave6-hw.c
@@ -48,6 +48,103 @@ static void _wave6_print_reg_err(struct vpu_core_device *core, u32 fail_reason,
 	dev_err(core->dev, "%s: failure: 0x%x\n", func, fail_reason);
 }
 
+static void wave6_dec_set_display_buffer(struct vpu_instance *inst, struct frame_buffer fb)
+{
+	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
+
+	for (int i = 0; i < WAVE6_MAX_FBS; i++) {
+		if (!p_dec_info->disp_buf[i].buf_y) {
+			p_dec_info->disp_buf[i] = fb;
+			break;
+		}
+	}
+}
+
+static int wave6_dec_get_display_buffer(struct vpu_instance *inst, dma_addr_t addr)
+{
+	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
+
+	for (int i = 0; i < WAVE6_MAX_FBS; i++) {
+		if (p_dec_info->disp_buf[i].buf_y == addr)
+			return i;
+	}
+
+	return -1;
+}
+
+static void wave6_dec_remove_display_buffer(struct vpu_instance *inst,
+					    dma_addr_t addr)
+{
+	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
+
+	for (int i = 0; i < WAVE6_MAX_FBS; i++) {
+		if (p_dec_info->disp_buf[i].buf_y == addr) {
+			p_dec_info->disp_buf[i].buf_y = 0;
+			break;
+		}
+	}
+}
+
+static enum chroma_format_idc get_chroma_format_idc(enum frame_buffer_format fmt)
+{
+	switch (fmt) {
+	case FORMAT_420:
+	case FORMAT_420_P10_16BIT_MSB:
+	case FORMAT_420_P10_16BIT_LSB:
+	case FORMAT_420_P10_32BIT_MSB:
+	case FORMAT_420_P10_32BIT_LSB:
+		return C_FMT_IDC_YUV420;
+	case FORMAT_422:
+	case FORMAT_422_P10_16BIT_MSB:
+	case FORMAT_422_P10_16BIT_LSB:
+	case FORMAT_422_P10_32BIT_MSB:
+	case FORMAT_422_P10_32BIT_LSB:
+	case FORMAT_YUYV:
+	case FORMAT_YVYU:
+	case FORMAT_UYVY:
+	case FORMAT_VYUY:
+	case FORMAT_YUYV_P10_16BIT_MSB:
+	case FORMAT_YVYU_P10_16BIT_MSB:
+	case FORMAT_UYVY_P10_16BIT_MSB:
+	case FORMAT_VYUY_P10_16BIT_MSB:
+	case FORMAT_YUYV_P10_16BIT_LSB:
+	case FORMAT_YVYU_P10_16BIT_LSB:
+	case FORMAT_UYVY_P10_16BIT_LSB:
+	case FORMAT_VYUY_P10_16BIT_LSB:
+	case FORMAT_YUYV_P10_32BIT_MSB:
+	case FORMAT_YVYU_P10_32BIT_MSB:
+	case FORMAT_UYVY_P10_32BIT_MSB:
+	case FORMAT_VYUY_P10_32BIT_MSB:
+	case FORMAT_YUYV_P10_32BIT_LSB:
+	case FORMAT_YVYU_P10_32BIT_LSB:
+	case FORMAT_UYVY_P10_32BIT_LSB:
+	case FORMAT_VYUY_P10_32BIT_LSB:
+		return C_FMT_IDC_YUV422;
+	case FORMAT_444:
+	case FORMAT_444_P10_16BIT_MSB:
+	case FORMAT_444_P10_16BIT_LSB:
+	case FORMAT_444_P10_32BIT_MSB:
+	case FORMAT_444_P10_32BIT_LSB:
+		return C_FMT_IDC_YUV444;
+	case FORMAT_400:
+	case FORMAT_400_P10_16BIT_MSB:
+	case FORMAT_400_P10_16BIT_LSB:
+	case FORMAT_400_P10_32BIT_MSB:
+	case FORMAT_400_P10_32BIT_LSB:
+	case FORMAT_YUV444_24BIT:
+		return C_FMT_IDC_YUV400;
+	case FORMAT_RGB_24BIT_PACKED:
+	case FORMAT_YUV444_24BIT_PACKED:
+	case FORMAT_RGB_32BIT_PACKED:
+	case FORMAT_RGB_P10_32BIT_PACKED:
+	case FORMAT_YUV444_32BIT_PACKED:
+	case FORMAT_YUV444_P10_32BIT_PACKED:
+		return C_FMT_IDC_RGB;
+	default:
+		return C_FMT_IDC_YUV400;
+	}
+}
+
 static int wave6_wait_vpu_busy(struct vpu_core_device *core, unsigned int addr)
 {
 	u32 data;
@@ -179,3 +276,659 @@ int wave6_vpu_get_version(struct vpu_core_device *core)
 
 	return 0;
 }
+
+int wave6_vpu_build_up_dec_param(struct vpu_instance *inst,
+				 struct dec_open_param *param)
+{
+	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
+	u32 reg_val;
+	int ret;
+
+	lockdep_assert_held(&inst->dev->hw_lock);
+
+	p_dec_info->sec_axi.use_dec_ip = true;
+	p_dec_info->sec_axi.use_dec_lf_row = true;
+	switch (inst->std) {
+	case W_HEVC_DEC:
+		p_dec_info->seq_change_mask = SEQ_CHANGE_ENABLE_ALL_HEVC;
+		break;
+	case W_AVC_DEC:
+		p_dec_info->seq_change_mask = SEQ_CHANGE_ENABLE_ALL_AVC;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_CREATE_INST_TEMP_BASE,
+			      param->inst_buffer.temp_base);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_CREATE_INST_TEMP_SIZE,
+			      param->inst_buffer.temp_size);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_CREATE_INST_BS_PARAM, VPU_STREAM_ENDIAN);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_CREATE_INST_ADDR_EXT, param->ext_addr_vcpu);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_CREATE_INST_DISP_MODE, param->disp_mode);
+
+	reg_val = CREATE_INST_CORE_INFO_CQ_DEPTH(COMMAND_QUEUE_DEPTH) |
+		  CREATE_INST_CORE_INFO_CORE_IDC(SINGLE_CORE_IDC) |
+		  CREATE_INST_CORE_INFO_CORE_NUM(SINGLE_CORE);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_CREATE_INST_CORE_INFO, reg_val);
+
+	reg_val = CREATE_INST_PRIORITY_SECURITY_FLAG(param->is_secure_inst) |
+		  CREATE_INST_PRIORITY_VALUE(param->inst_priority);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_CREATE_INST_PRIORITY, reg_val);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_CREATE_INST_TIMEOUT_CYCLE_COUNT,
+			      W6_VPU_TIMEOUT_CYCLE_COUNT);
+
+	wave6_send_command(inst->dev, 0, inst->std, W6_CMD_CREATE_INSTANCE);
+	ret = wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
+	if (ret) {
+		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
+		return ret;
+	}
+
+	if (!vpu_read_reg_relaxed(inst->dev, W6_RET_SUCCESS)) {
+		u32 reason_code = vpu_read_reg_relaxed(inst->dev, W6_RET_FAIL_REASON);
+
+		wave6_print_reg_err(inst->dev, reason_code);
+		return -EIO;
+	}
+
+	inst->id = vpu_read_reg_relaxed(inst->dev, W6_RET_INSTANCE_ID);
+
+	return 0;
+}
+
+int wave6_vpu_dec_issue_seq_init(struct vpu_instance *inst)
+{
+	struct dec_info *p_dec_info;
+	u32 reg_val;
+	int ret;
+
+	guard(mutex)(&inst->dev->hw_lock);
+
+	p_dec_info = &inst->codec_info->dec_info;
+
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_DEC_INIT_SEQ_BS_RD_PTR, p_dec_info->stream_rd_ptr);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_DEC_INIT_SEQ_BS_WR_PTR, p_dec_info->stream_wr_ptr);
+
+	reg_val = DEC_PIC_BS_OPTION_STREAM_END(p_dec_info->stream_end) |
+		  DEC_PIC_BS_OPTION_EXPLICIT_END_ON;
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_DEC_INIT_SEQ_BS_OPTION, reg_val);
+	reg_val = INIT_SEQ_OPTION_MODE(W6_INIT_SEQ_OPT_NORMAL);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_DEC_INIT_SEQ_OPTION, reg_val);
+
+	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_INIT_SEQ);
+	ret = wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
+	if (ret) {
+		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
+		return ret;
+	}
+
+	if (!vpu_read_reg_relaxed(inst->dev, W6_RET_SUCCESS)) {
+		u32 reason_code = vpu_read_reg_relaxed(inst->dev, W6_RET_FAIL_REASON);
+
+		wave6_print_reg_err(inst->dev, reason_code);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static u32 wave6_dec_hevc_profile(u32 profile, u32 profile_comp)
+{
+	if (profile)
+		return profile;
+
+	if ((profile_comp & PROFILE_COMPATIBILITY_MAIN) &&
+	    (profile_comp & PROFILE_COMPATIBILITY_MAIN10))
+		return HEVC_PROFILE_MAIN;
+	if (profile_comp & PROFILE_COMPATIBILITY_MAIN10)
+		return HEVC_PROFILE_MAIN10;
+	if (profile_comp & PROFILE_COMPATIBILITY_STILL_PICTURE)
+		return HEVC_PROFILE_STILLPICTURE;
+
+	return HEVC_PROFILE_MAIN;
+}
+
+static u32 wave6_dec_avc_profile(u32 profile)
+{
+	switch (profile) {
+	case PROFILE_H264_BP:
+		return H264_PROFILE_BP;
+	case PROFILE_H264_HP:
+		return H264_PROFILE_HP;
+	case PROFILE_H264_MP:
+		return H264_PROFILE_MP;
+	case PROFILE_H264_HIGH10:
+		return H264_PROFILE_HIGH10;
+	case PROFILE_H264_EXTENDED:
+		return H264_PROFILE_EXTENDED;
+	default:
+		return H264_PROFILE_BP;
+	}
+}
+
+static void wave6_get_dec_seq_result(struct vpu_instance *inst, struct dec_seq_info *info)
+{
+	u32 profile, profile_comp;
+	u32 reg_val;
+
+	lockdep_assert_held(&inst->dev->hw_lock);
+
+	info->rd_ptr = wave6_vpu_dec_get_rd_ptr(inst);
+
+	reg_val = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_PIC_SIZE);
+	info->pic_width = DEC_PIC_SIZE_WIDTH(reg_val);
+	info->pic_height = DEC_PIC_SIZE_HEIGHT(reg_val);
+
+	info->min_frame_buffer_count = vpu_read_reg_relaxed(inst->dev,
+							    W6_RET_DEC_NUM_REQUIRED_FBC_FB);
+	info->frame_buf_delay = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_NUM_REORDER_DELAY);
+	info->req_mv_buffer_count = vpu_read_reg_relaxed(inst->dev,
+							 W6_RET_DEC_NUM_REQUIRED_COL_BUF);
+
+	reg_val = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_CROP_TOP_BOTTOM);
+	info->pic_crop_rect.top = DEC_CROP_TOP(reg_val);
+	info->pic_crop_rect.bottom = info->pic_height - DEC_CROP_BOTTOM(reg_val);
+
+	reg_val = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_CROP_LEFT_RIGHT);
+	info->pic_crop_rect.left = DEC_CROP_LEFT(reg_val);
+	info->pic_crop_rect.right = info->pic_width - DEC_CROP_RIGHT(reg_val);
+
+	info->f_rate_numerator = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_FRAME_RATE_NR);
+	info->f_rate_denominator = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_FRAME_RATE_DR);
+
+	reg_val = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_COLOR_SAMPLE);
+	info->luma_bit_depth = DEC_COLOR_SAMPLE_L_BIT_DEPTH(reg_val);
+	info->chroma_bit_depth = DEC_COLOR_SAMPLE_C_BIT_DEPTH(reg_val);
+	info->c_fmt_idc = DEC_COLOR_SAMPLE_C_FMT_IDC(reg_val);
+	info->aspect_rate_info = DEC_COLOR_SAMPLE_ASPECT_RATIO_IDC(reg_val);
+	info->is_ext_sar = info->aspect_rate_info == H264_VUI_SAR_IDC_EXTENDED;
+	if (info->is_ext_sar)
+		info->aspect_rate_info = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_ASPECT_RATIO);
+	info->bitrate = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_BIT_RATE);
+
+	reg_val = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_SEQ_PARAM);
+	info->level = DEC_SEQ_PARAM_LEVEL(reg_val);
+	info->tier = DEC_SEQ_PARAM_TIER(reg_val);
+
+	profile = DEC_SEQ_PARAM_PROFILE(reg_val);
+	profile_comp = DEC_SEQ_PARAM_PROFILE_COMPATIBILITY(reg_val);
+	if (inst->std == W_HEVC_DEC)
+		info->profile = wave6_dec_hevc_profile(profile, profile_comp);
+	else if (inst->std == W_AVC_DEC)
+		info->profile = wave6_dec_avc_profile(profile);
+
+	reg_val = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_COLOR_CONFIG);
+	if (reg_val) {
+		info->color.video_signal_type_present = true;
+		info->color.color_description_present = DEC_COLOR_CONFIG_COLOR_PRESENT(reg_val);
+		info->color.color_primaries = DEC_COLOR_CONFIG_COLOR_PRIMARIES(reg_val);
+		info->color.transfer_characteristics = DEC_COLOR_CONFIG_TRANS_CHAR(reg_val);
+		info->color.matrix_coefficients = DEC_COLOR_CONFIG_MATRIX_COEFF(reg_val);
+		info->color.color_range = DEC_COLOR_CONFIG_COLOR_RANGE(reg_val);
+	} else {
+		info->color.video_signal_type_present = false;
+	}
+}
+
+int wave6_vpu_dec_get_seq_info(struct vpu_instance *inst, struct dec_seq_info *info)
+{
+	int ret;
+
+	lockdep_assert_held(&inst->dev->hw_lock);
+
+	ret = wave6_send_query(inst->dev, inst->id, inst->std, W6_QUERY_OPT_GET_RESULT);
+	if (ret)
+		return ret;
+
+	if (vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_DECODING_SUCCESS) != 1) {
+		info->err_reason = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_ERR_INFO);
+		ret = -EIO;
+	} else {
+		info->warn_info = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_WARN_INFO);
+	}
+
+	wave6_get_dec_seq_result(inst, info);
+
+	return ret;
+}
+
+static bool wave6_check_aux_vbuf(struct vpu_instance *inst,
+				 enum aux_buffer_type type, size_t count)
+{
+	for (size_t i = 0; i < count; i++) {
+		if (!inst->aux_vbuf[type][i].daddr)
+			return false;
+	}
+
+	return true;
+}
+
+int wave6_vpu_dec_register_frame_buffer(struct vpu_instance *inst)
+{
+	size_t fbc_remain, mv_remain, fbc_idx = 0, mv_idx = 0;
+	size_t k, group_num, fbc_count, mv_count;
+	struct dec_info *p_dec_info;
+	struct frame_buffer *fb_arr;
+	dma_addr_t fbc_cr_tbl_addr;
+	u32 reg_val;
+	int ret;
+
+	guard(mutex)(&inst->dev->hw_lock);
+
+	p_dec_info = &inst->codec_info->dec_info;
+
+	fb_arr = &inst->frame_buf[0];
+	fbc_count = p_dec_info->seq_info.min_frame_buffer_count;
+	mv_count = p_dec_info->seq_info.req_mv_buffer_count;
+	if (!fbc_count || !mv_count)
+		return -EINVAL;
+
+	if (!wave6_check_aux_vbuf(inst, AUX_BUF_FBC_Y_TBL, fbc_count) ||
+	    !wave6_check_aux_vbuf(inst, AUX_BUF_FBC_C_TBL, fbc_count) ||
+	    !wave6_check_aux_vbuf(inst, AUX_BUF_MV_COL, mv_count))
+		return -EINVAL;
+
+	reg_val = SET_FB_PIC_SIZE_WIDTH(p_dec_info->seq_info.pic_width) |
+		  SET_FB_PIC_SIZE_HEIGHT(p_dec_info->seq_info.pic_height);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_SET_FB_PIC_SIZE, reg_val);
+	reg_val = SET_FB_PIC_INFO_C_FMT_IDC(p_dec_info->seq_info.c_fmt_idc) |
+		  SET_FB_PIC_INFO_L_BIT_DEPTH(p_dec_info->seq_info.luma_bit_depth) |
+		  SET_FB_PIC_INFO_C_BIT_DEPTH(p_dec_info->seq_info.chroma_bit_depth);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_SET_FB_PIC_INFO, reg_val);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_SET_FB_DEFAULT_CDF, 0);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_SET_FB_SEGMAP, 0);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_SET_FB_MV_COL_PRE_ENT, 0);
+
+	fbc_remain = fbc_count;
+	mv_remain = mv_count;
+	group_num = DIV_ROUND_UP(max(fbc_count, mv_count), MAX_SET_FB_GROUP_SIZE);
+
+	for (size_t i = 0; i < group_num; i++) {
+		u32 set_fbc_num = min(fbc_remain, MAX_SET_FB_GROUP_SIZE);
+		u32 set_mv_num = min(mv_remain, MAX_SET_FB_GROUP_SIZE);
+		u32 fbc_start_no = i * MAX_SET_FB_GROUP_SIZE;
+		u32 mv_start_no = i * MAX_SET_FB_GROUP_SIZE;
+		bool last_group = i == group_num - 1;
+		bool first_group = i == 0;
+		u32 fbc_end_no, mv_end_no;
+
+		fbc_end_no = fbc_start_no + set_fbc_num - 1;
+		mv_end_no = mv_start_no + set_mv_num - 1;
+
+		reg_val = SET_FB_OPTION_ENDIAN(VDI_128BIT_BIG_ENDIAN);
+		if (first_group)
+			reg_val |= SET_FB_OPTION_START;
+		if (last_group)
+			reg_val |= SET_FB_OPTION_END;
+		vpu_write_reg_relaxed(inst->dev, W6_CMD_SET_FB_OPTION, reg_val);
+
+		reg_val = SET_FB_NUM_FBC_START_IDX(fbc_start_no) |
+			  SET_FB_NUM_FBC_END_IDX(fbc_end_no) |
+			  SET_FB_NUM_MV_COL_START_IDX(mv_start_no) |
+			  SET_FB_NUM_MV_COL_END_IDX(mv_end_no);
+		vpu_write_reg_relaxed(inst->dev, W6_CMD_SET_FB_NUM, reg_val);
+
+		for (k = 0; k < set_fbc_num; k++) {
+			vpu_write_reg_relaxed(inst->dev, W6_CMD_SET_FB_FBC_Y(k),
+					      fb_arr[fbc_idx].buf_y);
+			vpu_write_reg_relaxed(inst->dev, W6_CMD_SET_FB_FBC_C(k),
+					      fb_arr[fbc_idx].buf_cb);
+			vpu_write_reg_relaxed(inst->dev, W6_CMD_SET_FB_FBC_CR(k),
+					      fb_arr[fbc_idx].buf_cr);
+			vpu_write_reg_relaxed(inst->dev, W6_CMD_SET_FB_FBC_Y_OFFSET(k),
+					      inst->aux_vbuf[AUX_BUF_FBC_Y_TBL][fbc_idx].daddr);
+			vpu_write_reg_relaxed(inst->dev, W6_CMD_SET_FB_FBC_C_OFFSET(k),
+					      inst->aux_vbuf[AUX_BUF_FBC_C_TBL][fbc_idx].daddr);
+			fbc_cr_tbl_addr = inst->aux_vbuf[AUX_BUF_FBC_C_TBL][fbc_idx].daddr +
+					  (inst->aux_vbuf[AUX_BUF_FBC_C_TBL][fbc_idx].size >> 1);
+			vpu_write_reg_relaxed(inst->dev, W6_CMD_SET_FB_FBC_CR_OFFSET(k),
+					      fbc_cr_tbl_addr);
+			fbc_idx++;
+		}
+		fbc_remain -= k;
+
+		for (k = 0; k < set_mv_num; k++) {
+			vpu_write_reg_relaxed(inst->dev, W6_CMD_SET_FB_MV_COL(k),
+					      inst->aux_vbuf[AUX_BUF_MV_COL][mv_idx].daddr);
+			mv_idx++;
+		}
+		mv_remain -= k;
+
+		wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_SET_FB);
+		ret = wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
+		if (ret) {
+			dev_err(inst->dev->dev, "%s: timeout\n", __func__);
+			return ret;
+		}
+
+		if (!vpu_read_reg_relaxed(inst->dev, W6_RET_SUCCESS))
+			return -EIO;
+	}
+
+	return 0;
+}
+
+static u32 wave6_dec_out_fmt(enum frame_buffer_format fmt)
+{
+	return SET_DISP_COMMON_PIC_INFO_C_FMT_IDC(get_chroma_format_idc(fmt)) |
+	       SET_DISP_COMMON_PIC_INFO_OUT_JUSTIFY(WTL_RIGHT_JUSTIFIED) |
+	       SET_DISP_COMMON_PIC_INFO_OUT_PIXEL(WTL_PIXEL_8BIT);
+}
+
+int wave6_vpu_dec_register_display_buffer(struct vpu_instance *inst, struct frame_buffer fb)
+{
+	struct dec_info *p_dec_info;
+	u32 reg_val;
+	int ret;
+
+	guard(mutex)(&inst->dev->hw_lock);
+
+	p_dec_info = &inst->codec_info->dec_info;
+
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_DEC_SET_DISP_SCL_PARAM,
+			      inst->scaler_info.enable);
+	reg_val = SET_DISP_SCL_PIC_SIZE_WIDTH(inst->scaler_info.width) |
+		  SET_DISP_SCL_PIC_SIZE_HEIGHT(inst->scaler_info.height);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_DEC_SET_DISP_SCL_PIC_SIZE, reg_val);
+	reg_val = SET_DISP_PIC_SIZE_WIDTH(p_dec_info->seq_info.pic_width) |
+		  SET_DISP_PIC_SIZE_HEIGHT(p_dec_info->seq_info.pic_height);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_DEC_SET_DISP_PIC_SIZE, reg_val);
+
+	reg_val = SET_DISP_COMMON_PIC_INFO_BWB_ON |
+		  wave6_dec_out_fmt(p_dec_info->out_fmt) |
+		  SET_DISP_COMMON_PIC_INFO_PIXEL_ORDER(PIXEL_ORDER_INCREASING) |
+		  SET_DISP_COMMON_PIC_INFO_CBCR_ORDER(inst->nv21) |
+		  SET_DISP_COMMON_PIC_INFO_2PLANE(inst->cbcr_interleave) |
+		  SET_DISP_COMMON_PIC_INFO_STRIDE(fb.stride);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_DEC_SET_DISP_COMMON_PIC_INFO, reg_val);
+	reg_val = SET_DISP_OPTION_ENDIAN(VDI_128BIT_BIG_ENDIAN);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_DEC_SET_DISP_OPTION, reg_val);
+	reg_val = SET_DISP_PIC_INFO_L_BIT_DEPTH(fb.luma_bit_depth) |
+		  SET_DISP_PIC_INFO_C_BIT_DEPTH(fb.chroma_bit_depth) |
+		  SET_DISP_PIC_INFO_C_FMT_IDC(fb.c_fmt_idc);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_DEC_SET_DISP_PIC_INFO, reg_val);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_DEC_SET_DISP_Y_BASE, fb.buf_y);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_DEC_SET_DISP_CB_BASE, fb.buf_cb);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_DEC_SET_DISP_CR_BASE, fb.buf_cr);
+
+	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_DEC_SET_DISP);
+	ret = wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
+	if (ret) {
+		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
+		return ret;
+	}
+
+	if (!vpu_read_reg_relaxed(inst->dev, W6_RET_SUCCESS))
+		return -EIO;
+
+	wave6_dec_set_display_buffer(inst, fb);
+
+	return 0;
+}
+
+int wave6_vpu_dec_start_one_frame(struct vpu_instance *inst, struct dec_param *param,
+				  u32 *fail_res)
+{
+	struct dec_info *p_dec_info;
+	u32 reg_val;
+	int ret;
+
+	guard(mutex)(&inst->dev->hw_lock);
+
+	p_dec_info = &inst->codec_info->dec_info;
+
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_DEC_PIC_BS_RD_PTR, p_dec_info->stream_rd_ptr);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_DEC_PIC_BS_WR_PTR, p_dec_info->stream_wr_ptr);
+
+	reg_val = DEC_PIC_BS_OPTION_STREAM_END(p_dec_info->stream_end) |
+		  DEC_PIC_BS_OPTION_EXPLICIT_END_ON;
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_DEC_PIC_BS_OPTION, reg_val);
+
+	reg_val = DEC_PIC_SEC_AXI_IP_ENABLE(p_dec_info->sec_axi.use_dec_ip) |
+		  DEC_PIC_SEC_AXI_LF_ENABLE(p_dec_info->sec_axi.use_dec_lf_row);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_DEC_PIC_SEC_AXI, reg_val);
+
+	reg_val = DEC_PIC_OPTION_MODE(W6_DEC_PIC_OPT_NORMAL);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_DEC_PIC_OPTION, reg_val);
+
+	reg_val = DEC_PIC_TEMPORAL_ID_PLUS1_SPATIAL(DECODE_ALL_SPATIAL_LAYERS) |
+		  DEC_PIC_TEMPORAL_ID_PLUS1(DECODE_ALL_TEMPORAL_LAYERS);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_DEC_PIC_TEMPORAL_ID_PLUS1, reg_val);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_DEC_PIC_SEQ_CHANGE_ENABLE_FLAG,
+			      p_dec_info->seq_change_mask);
+	reg_val = lower_32_bits(param->timestamp);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_DEC_PIC_TIMESTAMP_LOW, reg_val);
+	reg_val = upper_32_bits(param->timestamp);
+	vpu_write_reg_relaxed(inst->dev, W6_CMD_DEC_PIC_TIMESTAMP_HIGH, reg_val);
+
+	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_DEC_PIC);
+	ret = wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
+	if (ret) {
+		dev_err(inst->dev->dev, "%s: timeout\n", __func__);
+		return ret;
+	}
+
+	if (!vpu_read_reg_relaxed(inst->dev, W6_RET_SUCCESS)) {
+		*fail_res = vpu_read_reg_relaxed(inst->dev, W6_RET_FAIL_REASON);
+		wave6_print_reg_err(inst->dev, *fail_res);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+int wave6_vpu_dec_get_output_info(struct vpu_instance *inst, struct dec_output_info *info)
+{
+	int decoded_idx = -1, disp_idx = -1;
+	struct dec_info *p_dec_info;
+	unsigned long idc;
+	u32 reg_val, i;
+	int ret;
+
+	if (WARN_ON(!info))
+		return -EINVAL;
+
+	guard(mutex)(&inst->dev->hw_lock);
+
+	p_dec_info = &inst->codec_info->dec_info;
+
+	ret = wave6_send_query(inst->dev, inst->id, inst->std, W6_QUERY_OPT_GET_RESULT);
+	if (ret) {
+		info->rd_ptr = p_dec_info->stream_rd_ptr;
+		info->wr_ptr = p_dec_info->stream_wr_ptr;
+		return ret;
+	}
+
+	info->decoding_success = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_DECODING_SUCCESS);
+	if (!info->decoding_success)
+		info->error_reason = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_ERR_INFO);
+	else
+		info->warn_info = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_WARN_INFO);
+
+	reg_val = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_PIC_TYPE);
+	info->ctu_size = DEC_PIC_TYPE_CTU_SIZE(reg_val);
+	info->nal_type = DEC_PIC_TYPE_NAL_UNIT_TYPE(reg_val);
+
+	if (reg_val & DEC_PIC_TYPE_B)
+		info->pic_type = PIC_TYPE_B;
+	else if (reg_val & DEC_PIC_TYPE_P)
+		info->pic_type = PIC_TYPE_P;
+	else if (reg_val & DEC_PIC_TYPE_I)
+		info->pic_type = PIC_TYPE_I;
+	else
+		info->pic_type = PIC_TYPE_MAX;
+	if (inst->std == W_HEVC_DEC) {
+		if (info->pic_type == PIC_TYPE_I &&
+		    (info->nal_type == H265_NAL_UNIT_TYPE_IDR_W_RADL ||
+		     info->nal_type == H265_NAL_UNIT_TYPE_IDR_N_LP))
+			info->pic_type = PIC_TYPE_IDR;
+	} else if (inst->std == W_AVC_DEC) {
+		if (info->pic_type == PIC_TYPE_I &&
+		    info->nal_type == H264_NAL_UNIT_TYPE_IDR_PICTURE)
+			info->pic_type = PIC_TYPE_IDR;
+	}
+
+	reg_val = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_DECODED_FLAG);
+	if (reg_val) {
+		dma_addr_t addr = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_DECODED_ADDR);
+
+		decoded_idx = wave6_dec_get_display_buffer(inst, addr);
+		info->frame_decoded_addr = addr;
+		info->frame_decoded = true;
+	}
+
+	reg_val = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_DISPLAY_FLAG);
+	if (reg_val) {
+		dma_addr_t addr = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_DISPLAY_ADDR);
+
+		disp_idx = wave6_dec_get_display_buffer(inst, addr);
+		info->frame_display_addr = addr;
+		info->frame_display = true;
+	}
+
+	idc = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_DISP_IDC);
+	for_each_set_bit(i, &idc, WAVE6_MAX_FBS) {
+		dma_addr_t addr;
+
+		addr = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_DISP_LINEAR_ADDR(i));
+
+		info->disp_frame_addr[info->disp_frame_num] = addr;
+		info->disp_frame_num++;
+	}
+
+	idc = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_RELEASE_IDC);
+	for_each_set_bit(i, &idc, WAVE6_MAX_FBS) {
+		dma_addr_t addr;
+
+		addr = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_DISP_LINEAR_ADDR(i));
+
+		wave6_dec_remove_display_buffer(inst, addr);
+		info->release_disp_frame_addr[info->release_disp_frame_num] = addr;
+		info->release_disp_frame_num++;
+	}
+
+	if (inst->std == W_HEVC_DEC) {
+		info->decoded_poc = -1;
+		info->display_poc = -1;
+		if (decoded_idx >= 0)
+			info->decoded_poc = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_PIC_POC);
+	} else if (inst->std == W_AVC_DEC) {
+		info->decoded_poc = -1;
+		info->display_poc = -1;
+		if (decoded_idx >= 0)
+			info->decoded_poc = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_PIC_POC);
+	}
+
+	reg_val = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_PIC_SIZE);
+	info->dec_pic_width = DEC_PIC_SIZE_WIDTH(reg_val);
+	info->dec_pic_height = DEC_PIC_SIZE_HEIGHT(reg_val);
+
+	info->rd_ptr = wave6_vpu_dec_get_rd_ptr(inst);
+	info->wr_ptr = p_dec_info->stream_wr_ptr;
+	info->byte_pos_frame_start = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_AU_START_POS);
+	info->byte_pos_frame_end = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_AU_END_POS);
+	info->stream_end = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_STREAM_END);
+	info->notification_flags = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_NOTIFICATION);
+	info->last_frame_in_au = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_LAST_FRAME_FLAG);
+
+	reg_val = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_TIMESTAMP_LOW);
+	info->timestamp = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_TIMESTAMP_HIGH);
+	info->timestamp = (info->timestamp << 32) | reg_val;
+
+	if (decoded_idx >= 0 && decoded_idx < WAVE6_MAX_FBS)
+		p_dec_info->dec_out_info[decoded_idx].decoded_poc = info->decoded_poc;
+
+	if (disp_idx >= 0 && disp_idx < WAVE6_MAX_FBS) {
+		info->display_poc = p_dec_info->dec_out_info[disp_idx].decoded_poc;
+		info->disp_pic_width = p_dec_info->dec_out_info[disp_idx].dec_pic_width;
+		info->disp_pic_height = p_dec_info->dec_out_info[disp_idx].dec_pic_height;
+	}
+
+	info->sequence_no = p_dec_info->seq_info.sequence_no;
+	if (decoded_idx >= 0 && decoded_idx < WAVE6_MAX_FBS)
+		p_dec_info->dec_out_info[decoded_idx] = *info;
+
+	if (info->notification_flags & DEC_NOTI_FLAG_SEQ_CHANGE) {
+		wave6_get_dec_seq_result(inst, &p_dec_info->seq_info);
+		p_dec_info->seq_info.sequence_no++;
+	}
+
+	return 0;
+}
+
+int wave6_vpu_dec_fini_seq(struct vpu_instance *inst, u32 *fail_res)
+{
+	int ret;
+
+	lockdep_assert_held(&inst->dev->hw_lock);
+
+	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_DESTROY_INSTANCE);
+	ret = wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
+	if (ret)
+		return -ETIMEDOUT;
+
+	if (!vpu_read_reg_relaxed(inst->dev, W6_RET_SUCCESS)) {
+		*fail_res = vpu_read_reg_relaxed(inst->dev, W6_RET_FAIL_REASON);
+		wave6_print_reg_err(inst->dev, *fail_res);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+dma_addr_t wave6_vpu_dec_get_rd_ptr(struct vpu_instance *inst)
+{
+	lockdep_assert_held(&inst->dev->hw_lock);
+
+	return vpu_read_reg(inst->dev, W6_RET_DEC_BS_RD_PTR);
+}
+
+int wave6_vpu_dec_flush_instance(struct vpu_instance *inst)
+{
+	struct dec_info *p_dec_info;
+	unsigned long remove_idc;
+	int ret, index;
+	u32 using_idc;
+
+	guard(mutex)(&inst->dev->hw_lock);
+
+	p_dec_info = &inst->codec_info->dec_info;
+	if (!p_dec_info->seq_info_obtained)
+		return -EINVAL;
+
+	wave6_send_command(inst->dev, inst->id, inst->std, W6_CMD_FLUSH_INSTANCE);
+	ret = wave6_wait_vpu_busy(inst->dev, W6_VPU_BUSY_STATUS);
+	if (ret)
+		return -ETIMEDOUT;
+
+	if (!vpu_read_reg_relaxed(inst->dev, W6_RET_SUCCESS)) {
+		u32 reg_val;
+
+		reg_val = vpu_read_reg_relaxed(inst->dev, W6_RET_FAIL_REASON);
+		wave6_print_reg_err(inst->dev, reg_val);
+		return -EIO;
+	}
+
+	ret = wave6_send_query(inst->dev, inst->id, inst->std, W6_QUERY_OPT_GET_FLUSH_CMD_INFO);
+	if (ret)
+		return ret;
+
+	remove_idc = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_FLUSH_CMD_BUF_STATE_UNUSED_IDC) |
+		     vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_FLUSH_CMD_BUF_STATE_USED_IDC);
+	if (remove_idc)
+		dev_dbg(inst->dev->dev, "%s: remove_idc 0x%lx\n", __func__, remove_idc);
+
+	using_idc = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_FLUSH_CMD_BUF_STATE_USING_IDC);
+	if (using_idc)
+		dev_dbg(inst->dev->dev, "%s: using_idc 0x%x\n", __func__, using_idc);
+
+	for_each_set_bit(index, &remove_idc, WAVE6_MAX_FBS) {
+		dma_addr_t addr;
+
+		addr = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_FLUSH_CMD_DISP_ADDR(index));
+		wave6_dec_remove_display_buffer(inst, addr);
+	}
+
+	return 0;
+}
diff --git a/drivers/media/platform/chips-media/wave6/wave6-hw.h b/drivers/media/platform/chips-media/wave6/wave6-hw.h
index bf8b6dcb54c2..b163c6bb6724 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-hw.h
+++ b/drivers/media/platform/chips-media/wave6/wave6-hw.h
@@ -15,8 +15,35 @@ enum product_id {
 	PRODUCT_ID_NONE,
 };
 
+#define COMMAND_QUEUE_DEPTH		1
+#define SINGLE_CORE_IDC			1
+#define SINGLE_CORE			1
+
+#define MAX_SET_FB_GROUP_SIZE		16
+
+#define DECODE_ALL_TEMPORAL_LAYERS	0
+#define DECODE_ALL_SPATIAL_LAYERS	0
+
+#define PIXEL_ORDER_INCREASING		1
+
+#define WTL_RIGHT_JUSTIFIED		0
+#define WTL_LEFT_JUSTIFIED		1
+#define WTL_PIXEL_8BIT			0
+#define WTL_PIXEL_16BIT			1
+#define WTL_PIXEL_32BIT			2
+
+#define H265_NAL_UNIT_TYPE_IDR_W_RADL	19
+#define H265_NAL_UNIT_TYPE_IDR_N_LP	20
+
+#define H264_NAL_UNIT_TYPE_IDR_PICTURE	5
+
 bool wave6_vpu_is_init(struct vpu_core_device *core);
 int wave6_vpu_get_version(struct vpu_core_device *core);
 void wave6_vpu_enable_interrupt(struct vpu_core_device *core);
 
+int wave6_vpu_build_up_dec_param(struct vpu_instance *inst, struct dec_open_param *param);
+int wave6_vpu_dec_get_seq_info(struct vpu_instance *inst, struct dec_seq_info *info);
+int wave6_vpu_dec_fini_seq(struct vpu_instance *inst, u32 *fail_res);
+dma_addr_t wave6_vpu_dec_get_rd_ptr(struct vpu_instance *inst);
+
 #endif /* __WAVE6_HW_H__ */
diff --git a/drivers/media/platform/chips-media/wave6/wave6-regdefine.h b/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
index aa9b972c82d1..0651f5c1e652 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
+++ b/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
@@ -25,6 +25,18 @@ enum wave6_command {
 	W6_CMD_QUERY		= 0x4000,
 };
 
+enum wave6_init_seq_option {
+	W6_INIT_SEQ_OPT_NORMAL		= 1,
+	W6_INIT_SEQ_OPT_W_THUMBNAIL	= 17,
+};
+
+enum wave6_dec_pic_option {
+	W6_DEC_PIC_OPT_NORMAL		= 0,
+	W6_DEC_PIC_OPT_W_THUMBNAIL	= 16,
+	W6_DEC_PIC_OPT_SKIP_NON_IRAP	= 17,
+	W6_DEC_PIC_OPT_SKIP_NON_REF_PIC	= 19,
+};
+
 enum wave6_query_option {
 	W6_QUERY_OPT_GET_VPU_INFO	= 0,
 	W6_QUERY_OPT_GET_RESULT		= 2,
@@ -111,4 +123,211 @@ enum wave6_interrupt_bit {
 #define W6_RET_FW_API_VERSION				(W6_REG_BASE + 0x32C)
 #define W6_RET_SHA_ID					(W6_REG_BASE + 0x330)
 
+/* COMMON - CREATE_INSTANCE */
+#define W6_CMD_CREATE_INST_BS_PARAM			(W6_REG_BASE + 0x310)
+#define W6_CMD_CREATE_INST_ADDR_EXT			(W6_REG_BASE + 0x318)
+#define W6_CMD_CREATE_INST_DISP_MODE			(W6_REG_BASE + 0x31C)
+#define W6_CMD_CREATE_INST_CORE_INFO			(W6_REG_BASE + 0x330)
+#define		CREATE_INST_CORE_INFO_CQ_DEPTH(x)	FIELD_PREP(GENMASK(10, 8), (x))
+#define		CREATE_INST_CORE_INFO_CORE_IDC(x)	FIELD_PREP(GENMASK(7, 4), (x))
+#define		CREATE_INST_CORE_INFO_CORE_NUM(x)	FIELD_PREP(GENMASK(3, 0), (x))
+#define W6_CMD_CREATE_INST_PRIORITY			(W6_REG_BASE + 0x334)
+#define		CREATE_INST_PRIORITY_SECURITY_FLAG(x)	FIELD_PREP(GENMASK(8, 8), (x))
+#define		CREATE_INST_PRIORITY_VALUE(x)		FIELD_PREP(GENMASK(4, 0), (x))
+#define W6_CMD_CREATE_INST_TEMP_BASE			(W6_REG_BASE + 0x348)
+#define W6_CMD_CREATE_INST_TEMP_SIZE			(W6_REG_BASE + 0x34C)
+#define W6_CMD_CREATE_INST_TIMEOUT_CYCLE_COUNT		(W6_REG_BASE + 0x3A8)
+
+/* COMMON - SET_FB */
+#define W6_CMD_SET_FB_OPTION				(W6_REG_BASE + 0x204)
+#define		SET_FB_OPTION_ENDIAN(x)			FIELD_PREP(GENMASK(19, 16), (x))
+#define		SET_FB_OPTION_END			BIT(4)
+#define		SET_FB_OPTION_START			BIT(3)
+#define W6_CMD_SET_FB_PIC_INFO				(W6_REG_BASE + 0x300)
+#define		SET_FB_PIC_INFO_C_FMT_IDC(x)		FIELD_PREP(GENMASK(26, 25), (x))
+#define		SET_FB_PIC_INFO_L_BIT_DEPTH(x)		FIELD_PREP(GENMASK(24, 21), (x))
+#define		SET_FB_PIC_INFO_C_BIT_DEPTH(x)		FIELD_PREP(GENMASK(20, 17), (x))
+#define W6_CMD_SET_FB_PIC_SIZE				(W6_REG_BASE + 0x304)
+#define		SET_FB_PIC_SIZE_WIDTH(x)		FIELD_PREP(GENMASK(31, 16), (x))
+#define		SET_FB_PIC_SIZE_HEIGHT(x)		FIELD_PREP(GENMASK(15, 0), (x))
+#define W6_CMD_SET_FB_NUM				(W6_REG_BASE + 0x308)
+#define		SET_FB_NUM_FBC_START_IDX(x)		FIELD_PREP(GENMASK(28, 24), (x))
+#define		SET_FB_NUM_FBC_END_IDX(x)		FIELD_PREP(GENMASK(20, 16), (x))
+#define		SET_FB_NUM_MV_COL_START_IDX(x)		FIELD_PREP(GENMASK(9, 5), (x))
+#define		SET_FB_NUM_MV_COL_END_IDX(x)		FIELD_PREP(GENMASK(4, 0), (x))
+
+/* W6_CMD_SET_FB_FBC_Y(x)
+ * Address range: 0x310, 0x328, ..., 0x478 (step = 0x18)
+ */
+#define W6_CMD_SET_FB_FBC_Y(x)				(W6_REG_BASE + 0x310 + ((x) * 0x18))
+
+/* W6_CMD_SET_FB_FBC_C(x)
+ * Address range: 0x314, 0x32C, ..., 0x47C (step = 0x18)
+ */
+#define W6_CMD_SET_FB_FBC_C(x)				(W6_REG_BASE + 0x314 + ((x) * 0x18))
+
+/* W6_CMD_SET_FB_FBC_Y_OFFSET(x)
+ * Address range: 0x318, 0x330, ..., 0x480 (step = 0x18)
+ */
+#define W6_CMD_SET_FB_FBC_Y_OFFSET(x)			(W6_REG_BASE + 0x318 + ((x) * 0x18))
+
+/* W6_CMD_SET_FB_FBC_C_OFFSET(x)
+ * Address range: 0x31C, 0x334, ..., 0x484 (step = 0x18)
+ */
+#define W6_CMD_SET_FB_FBC_C_OFFSET(x)			(W6_REG_BASE + 0x31C + ((x) * 0x18))
+
+/* W6_CMD_SET_FB_MV_COL(x)
+ * Address range: 0x320, 0x338, ..., 0x488 (step = 0x18)
+ */
+#define W6_CMD_SET_FB_MV_COL(x)				(W6_REG_BASE + 0x320 + ((x) * 0x18))
+
+#define W6_CMD_SET_FB_DEFAULT_CDF			(W6_REG_BASE + 0x494)
+#define W6_CMD_SET_FB_SEGMAP				(W6_REG_BASE + 0x498)
+#define W6_CMD_SET_FB_MV_COL_PRE_ENT			(W6_REG_BASE + 0x4DC)
+
+/* W6_CMD_SET_FB_FBC_CR(x)
+ * Address range: 0x4F0, 0x4F8, ..., 0x568 (step = 0x8)
+ */
+#define W6_CMD_SET_FB_FBC_CR(x)				(W6_REG_BASE + 0x4F0 + ((x) * 0x8))
+
+/* W6_CMD_SET_FB_FBC_CR_OFFSET(x)
+ * Address range: 0x4F4, 0x4FC, ..., 0x56C (step = 0x8)
+ */
+#define W6_CMD_SET_FB_FBC_CR_OFFSET(x)			(W6_REG_BASE + 0x4F4 + ((x) * 0x8))
+
+/* DECODER - INIT_SEQ */
+#define W6_CMD_DEC_INIT_SEQ_OPTION			(W6_REG_BASE + 0x204)
+#define		INIT_SEQ_OPTION_MODE(x)			FIELD_PREP(GENMASK(5, 0), (x))
+#define W6_CMD_DEC_INIT_SEQ_BS_RD_PTR			(W6_REG_BASE + 0x300)
+#define W6_CMD_DEC_INIT_SEQ_BS_WR_PTR			(W6_REG_BASE + 0x304)
+#define W6_CMD_DEC_INIT_SEQ_BS_OPTION			(W6_REG_BASE + 0x308)
+
+/* DECODER - SET_DISP */
+#define W6_CMD_DEC_SET_DISP_OPTION			(W6_REG_BASE + 0x204)
+#define		SET_DISP_OPTION_ENDIAN(x)		FIELD_PREP(GENMASK(19, 16), (x))
+#define W6_CMD_DEC_SET_DISP_COMMON_PIC_INFO		(W6_REG_BASE + 0x300)
+#define		SET_DISP_COMMON_PIC_INFO_BWB_ON		BIT(28)
+#define		SET_DISP_COMMON_PIC_INFO_C_FMT_IDC(x)	FIELD_PREP(GENMASK(25, 24), (x))
+#define		SET_DISP_COMMON_PIC_INFO_PIXEL_ORDER(x)	FIELD_PREP(GENMASK(23, 23), (x))
+#define		SET_DISP_COMMON_PIC_INFO_OUT_JUSTIFY(x)	FIELD_PREP(GENMASK(22, 22), (x))
+#define		SET_DISP_COMMON_PIC_INFO_OUT_PIXEL(x)	FIELD_PREP(GENMASK(21, 20), (x))
+#define		SET_DISP_COMMON_PIC_INFO_CBCR_ORDER(x)	FIELD_PREP(GENMASK(17, 17), (x))
+#define		SET_DISP_COMMON_PIC_INFO_2PLANE(x)	FIELD_PREP(GENMASK(16, 16), (x))
+#define		SET_DISP_COMMON_PIC_INFO_STRIDE(x)	FIELD_PREP(GENMASK(15, 0), (x))
+#define W6_CMD_DEC_SET_DISP_PIC_SIZE			(W6_REG_BASE + 0x304)
+#define		SET_DISP_PIC_SIZE_WIDTH(x)		FIELD_PREP(GENMASK(31, 16), (x))
+#define		SET_DISP_PIC_SIZE_HEIGHT(x)		FIELD_PREP(GENMASK(15, 0), (x))
+#define W6_CMD_DEC_SET_DISP_PIC_INFO			(W6_REG_BASE + 0x308)
+#define		SET_DISP_PIC_INFO_L_BIT_DEPTH(x)	FIELD_PREP(GENMASK(25, 22), (x))
+#define		SET_DISP_PIC_INFO_C_BIT_DEPTH(x)	FIELD_PREP(GENMASK(21, 18), (x))
+#define		SET_DISP_PIC_INFO_C_FMT_IDC(x)		FIELD_PREP(GENMASK(17, 16), (x))
+#define W6_CMD_DEC_SET_DISP_Y_BASE			(W6_REG_BASE + 0x30C)
+#define W6_CMD_DEC_SET_DISP_CB_BASE			(W6_REG_BASE + 0x310)
+#define W6_CMD_DEC_SET_DISP_CR_BASE			(W6_REG_BASE + 0x314)
+#define W6_CMD_DEC_SET_DISP_SCL_PARAM			(W6_REG_BASE + 0x318)
+#define W6_CMD_DEC_SET_DISP_SCL_PIC_SIZE		(W6_REG_BASE + 0x31C)
+#define		SET_DISP_SCL_PIC_SIZE_WIDTH(x)		FIELD_PREP(GENMASK(31, 16), (x))
+#define		SET_DISP_SCL_PIC_SIZE_HEIGHT(x)		FIELD_PREP(GENMASK(15, 0), (x))
+
+/* DECODER - DEC_PIC */
+#define W6_CMD_DEC_PIC_OPTION				(W6_REG_BASE + 0x204)
+#define		DEC_PIC_OPTION_MODE(x)			FIELD_PREP(GENMASK(5, 0), (x))
+#define W6_CMD_DEC_PIC_BS_RD_PTR			(W6_REG_BASE + 0x300)
+#define W6_CMD_DEC_PIC_BS_WR_PTR			(W6_REG_BASE + 0x304)
+#define W6_CMD_DEC_PIC_BS_OPTION			(W6_REG_BASE + 0x308)
+#define		DEC_PIC_BS_OPTION_STREAM_END(x)		FIELD_PREP(GENMASK(1, 1), (x))
+#define		DEC_PIC_BS_OPTION_EXPLICIT_END_ON	BIT(0)
+#define W6_CMD_DEC_PIC_SEC_AXI				(W6_REG_BASE + 0x30C)
+#define		DEC_PIC_SEC_AXI_IP_ENABLE(x)		FIELD_PREP(GENMASK(1, 1), (x))
+#define		DEC_PIC_SEC_AXI_LF_ENABLE(x)		FIELD_PREP(GENMASK(0, 0), (x))
+#define W6_CMD_DEC_PIC_SEQ_CHANGE_ENABLE_FLAG		(W6_REG_BASE + 0x310)
+#define W6_CMD_DEC_PIC_TEMPORAL_ID_PLUS1		(W6_REG_BASE + 0x318)
+#define		DEC_PIC_TEMPORAL_ID_PLUS1_SPATIAL(x)	FIELD_PREP(GENMASK(11, 9), (x))
+#define		DEC_PIC_TEMPORAL_ID_PLUS1(x)		FIELD_PREP(GENMASK(7, 0), (x))
+#define W6_CMD_DEC_PIC_TIMESTAMP_LOW			(W6_REG_BASE + 0x354)
+#define W6_CMD_DEC_PIC_TIMESTAMP_HIGH			(W6_REG_BASE + 0x358)
+
+/* DECODER - QUERY : GET_RESULT */
+#define W6_RET_DEC_BS_RD_PTR				(W6_REG_BASE + 0x30C)
+#define W6_RET_DEC_SEQ_PARAM				(W6_REG_BASE + 0x310)
+#define		DEC_SEQ_PARAM_TIER(x)			FIELD_GET(GENMASK(29, 29), (x))
+#define		DEC_SEQ_PARAM_PROFILE(x)		FIELD_GET(GENMASK(28, 24), (x))
+#define		PROFILE_H264_BP				2
+#define		PROFILE_H264_HP				4
+#define		PROFILE_H264_MP				13
+#define		PROFILE_H264_HIGH10			14
+#define		PROFILE_H264_EXTENDED			24
+#define		DEC_SEQ_PARAM_PROFILE_COMPATIBILITY(x)	FIELD_GET(GENMASK(19, 12), (x))
+#define		PROFILE_COMPATIBILITY_MAIN		BIT(1)
+#define		PROFILE_COMPATIBILITY_MAIN10		BIT(2)
+#define		PROFILE_COMPATIBILITY_STILL_PICTURE	BIT(3)
+#define		DEC_SEQ_PARAM_LEVEL(x)			FIELD_GET(GENMASK(7, 0), (x))
+#define W6_RET_DEC_COLOR_SAMPLE				(W6_REG_BASE + 0x314)
+#define		DEC_COLOR_SAMPLE_ASPECT_RATIO_IDC(x)	FIELD_GET(GENMASK(23, 16), (x))
+#define		DEC_COLOR_SAMPLE_C_FMT_IDC(x)		FIELD_GET(GENMASK(11, 8), (x))
+#define		DEC_COLOR_SAMPLE_C_BIT_DEPTH(x)		FIELD_GET(GENMASK(7, 4), (x))
+#define		DEC_COLOR_SAMPLE_L_BIT_DEPTH(x)		FIELD_GET(GENMASK(3, 0), (x))
+#define W6_RET_DEC_ASPECT_RATIO				(W6_REG_BASE + 0x318)
+#define W6_RET_DEC_BIT_RATE				(W6_REG_BASE + 0x31C)
+#define W6_RET_DEC_FRAME_RATE_NR			(W6_REG_BASE + 0x320)
+#define W6_RET_DEC_FRAME_RATE_DR			(W6_REG_BASE + 0x324)
+#define W6_RET_DEC_NUM_REQUIRED_FBC_FB			(W6_REG_BASE + 0x328)
+#define W6_RET_DEC_NUM_REORDER_DELAY			(W6_REG_BASE + 0x32C)
+#define W6_RET_DEC_NOTIFICATION				(W6_REG_BASE + 0x334)
+#define W6_RET_DEC_PIC_SIZE				(W6_REG_BASE + 0x33C)
+#define		DEC_PIC_SIZE_WIDTH(x)			FIELD_GET(GENMASK(31, 16), (x))
+#define		DEC_PIC_SIZE_HEIGHT(x)			FIELD_GET(GENMASK(15, 0), (x))
+#define W6_RET_DEC_CROP_TOP_BOTTOM			(W6_REG_BASE + 0x340)
+#define		DEC_CROP_TOP(x)				FIELD_GET(GENMASK(31, 16), (x))
+#define		DEC_CROP_BOTTOM(x)			FIELD_GET(GENMASK(15, 0), (x))
+#define W6_RET_DEC_CROP_LEFT_RIGHT			(W6_REG_BASE + 0x344)
+#define		DEC_CROP_LEFT(x)			FIELD_GET(GENMASK(31, 16), (x))
+#define		DEC_CROP_RIGHT(x)			FIELD_GET(GENMASK(15, 0), (x))
+#define W6_RET_DEC_AU_START_POS				(W6_REG_BASE + 0x348)
+#define W6_RET_DEC_AU_END_POS				(W6_REG_BASE + 0x34C)
+#define W6_RET_DEC_PIC_TYPE				(W6_REG_BASE + 0x350)
+#define		DEC_PIC_TYPE_CTU_SIZE(x)		(16 << FIELD_GET(GENMASK(11, 10), (x)))
+#define		DEC_PIC_TYPE_NAL_UNIT_TYPE(x)		FIELD_GET(GENMASK(9, 4), (x))
+#define		DEC_PIC_TYPE_B				BIT(2)
+#define		DEC_PIC_TYPE_P				BIT(1)
+#define		DEC_PIC_TYPE_I				BIT(0)
+#define W6_RET_DEC_PIC_POC				(W6_REG_BASE + 0x354)
+#define W6_RET_DEC_RECOVERY_POINT			(W6_REG_BASE + 0x358)
+#define W6_RET_DEC_DECODED_ADDR				(W6_REG_BASE + 0x360)
+#define W6_RET_DEC_DISPLAY_ADDR				(W6_REG_BASE + 0x364)
+#define W6_RET_DEC_ERR_CTB_NUM				(W6_REG_BASE + 0x370)
+#define W6_RET_DEC_DISPLAY_FLAG				(W6_REG_BASE + 0x3A8)
+#define W6_RET_DEC_RELEASE_IDC				(W6_REG_BASE + 0x3AC)
+#define W6_RET_DEC_DISP_IDC				(W6_REG_BASE + 0x3B0)
+#define W6_RET_DEC_STREAM_END				(W6_REG_BASE + 0x3C0)
+#define W6_RET_DEC_DECODED_FLAG				(W6_REG_BASE + 0x3C4)
+#define W6_RET_DEC_WARN_INFO				(W6_REG_BASE + 0x3CC)
+#define W6_RET_DEC_ERR_INFO				(W6_REG_BASE + 0x3D0)
+#define W6_RET_DEC_DECODING_SUCCESS			(W6_REG_BASE + 0x3D4)
+#define W6_RET_DEC_TIMESTAMP_LOW			(W6_REG_BASE + 0x3D8)
+#define W6_RET_DEC_TIMESTAMP_HIGH			(W6_REG_BASE + 0x3DC)
+#define W6_RET_DEC_LAST_FRAME_FLAG			(W6_REG_BASE + 0x3E0)
+#define W6_RET_DEC_NUM_REQUIRED_COL_BUF			(W6_REG_BASE + 0x3E4)
+
+/* W6_RET_DEC_DISP_LINEAR_ADDR(x)
+ * Address range: 0x3E8, 0x3EC, ..., 0x460 (step = 0x4)
+ */
+#define W6_RET_DEC_DISP_LINEAR_ADDR(x)			(W6_REG_BASE + 0x3E8 + ((x) * 0x4))
+#define W6_RET_DEC_COLOR_CONFIG				(W6_REG_BASE + 0x57C)
+#define		DEC_COLOR_CONFIG_COLOR_RANGE(x)		FIELD_GET(GENMASK(25, 25), (x))
+#define		DEC_COLOR_CONFIG_MATRIX_COEFF(x)	FIELD_GET(GENMASK(24, 17), (x))
+#define		DEC_COLOR_CONFIG_TRANS_CHAR(x)		FIELD_GET(GENMASK(16, 9), (x))
+#define		DEC_COLOR_CONFIG_COLOR_PRIMARIES(x)	FIELD_GET(GENMASK(8, 1), (x))
+#define		DEC_COLOR_CONFIG_COLOR_PRESENT(x)	FIELD_GET(GENMASK(0, 0), (x))
+
+/* DECODER - QUERY : GET_FLUSH_CMD_INFO */
+
+/* W6_RET_DEC_FLUSH_CMD_DISP_ADDR(x)
+ * Address range: 0x300, 0x304, ..., 0x378 (step = 0x4)
+ */
+#define W6_RET_DEC_FLUSH_CMD_DISP_ADDR(x)		(W6_REG_BASE + 0x300 + ((x) * 0x4))
+#define W6_RET_DEC_FLUSH_CMD_BUF_STATE_UNUSED_IDC	(W6_REG_BASE + 0x57C)
+#define W6_RET_DEC_FLUSH_CMD_BUF_STATE_USED_IDC		(W6_REG_BASE + 0x580)
+#define W6_RET_DEC_FLUSH_CMD_BUF_STATE_USING_IDC	(W6_REG_BASE + 0x584)
+
 #endif /* __WAVE6_REGDEFINE_H__ */
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuapi.c b/drivers/media/platform/chips-media/wave6/wave6-vpuapi.c
new file mode 100644
index 000000000000..c8d1138334b3
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpuapi.c
@@ -0,0 +1,202 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - wave6 helper interface
+ *
+ * Copyright (C) 2026 CHIPS&MEDIA INC
+ */
+
+#include <linux/bug.h>
+
+#include "wave6-vpuapi.h"
+#include "wave6-hw.h"
+
+int wave6_vpu_dec_open(struct vpu_instance *inst, struct dec_open_param *pop)
+{
+	struct dec_info *p_dec_info;
+	int ret;
+	struct vpu_core_device *core = inst->dev;
+
+	guard(mutex)(&core->hw_lock);
+
+	if (!wave6_vpu_is_init(core))
+		return -ENODEV;
+
+	inst->codec_info = kzalloc_obj(*inst->codec_info);
+	if (!inst->codec_info)
+		return -ENOMEM;
+
+	p_dec_info = &inst->codec_info->dec_info;
+	memcpy(&p_dec_info->open_param, pop, sizeof(struct dec_open_param));
+
+	ret = wave6_vpu_build_up_dec_param(inst, pop);
+	if (ret) {
+		kfree(inst->codec_info);
+		inst->codec_info = NULL;
+	}
+
+	return ret;
+}
+
+int wave6_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res)
+{
+	int ret;
+
+	if (WARN_ON(!inst->codec_info))
+		return -EINVAL;
+
+	guard(mutex)(&inst->dev->hw_lock);
+
+	ret = wave6_vpu_dec_fini_seq(inst, fail_res);
+	if (ret)
+		dev_warn(inst->dev->dev, "dec seq end timed out\n");
+
+	kfree(inst->codec_info);
+	inst->codec_info = NULL;
+
+	return ret;
+}
+
+int wave6_vpu_dec_complete_seq_init(struct vpu_instance *inst,
+				    struct dec_seq_info *info)
+{
+	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
+	int ret;
+
+	guard(mutex)(&inst->dev->hw_lock);
+
+	ret = wave6_vpu_dec_get_seq_info(inst, info);
+	if (!ret)
+		p_dec_info->seq_info_obtained = true;
+
+	info->rd_ptr = wave6_vpu_dec_get_rd_ptr(inst);
+	info->wr_ptr = p_dec_info->stream_wr_ptr;
+
+	p_dec_info->seq_info = *info;
+
+	return ret;
+}
+
+int wave6_vpu_dec_get_aux_buffer_size(struct vpu_instance *inst,
+				      struct aux_buffer_size_info info, u32 *size)
+{
+	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
+	int width = info.width;
+	int height = info.height;
+	int buf_size, twice;
+
+	if (info.type == AUX_BUF_FBC_Y_TBL) {
+		switch (inst->std) {
+		case W_HEVC_DEC:
+		case W_AVC_DEC:
+			buf_size = WAVE6_FBC_LUMA_TABLE_SIZE(width, height);
+			break;
+		default:
+			return -EINVAL;
+		}
+		buf_size = ALIGN(buf_size, 16);
+	} else if (info.type == AUX_BUF_FBC_C_TBL) {
+		if (p_dec_info->seq_info.c_fmt_idc == C_FMT_IDC_YUV422)
+			twice = 2;
+		else if (p_dec_info->seq_info.c_fmt_idc == C_FMT_IDC_YUV444)
+			twice = 4;
+		else
+			twice = 1;
+
+		switch (inst->std) {
+		case W_HEVC_DEC:
+		case W_AVC_DEC:
+			buf_size = WAVE6_FBC_CHROMA_TABLE_SIZE(width, height);
+			break;
+		default:
+			return -EINVAL;
+		}
+		buf_size = buf_size * twice;
+		buf_size = ALIGN(buf_size, 16);
+	} else if (info.type == AUX_BUF_MV_COL) {
+		switch (inst->std) {
+		case W_HEVC_DEC:
+			buf_size = WAVE6_DEC_HEVC_MVCOL_BUF_SIZE(width, height);
+			break;
+		case W_AVC_DEC:
+			buf_size = WAVE6_DEC_AVC_MVCOL_BUF_SIZE(width, height);
+			break;
+		default:
+			return -EINVAL;
+		}
+		buf_size = ALIGN(buf_size, 16);
+	} else {
+		return -EINVAL;
+	}
+
+	*size = buf_size;
+
+	return 0;
+}
+
+void wave6_vpu_dec_get_bitstream_buffer(struct vpu_instance *inst,
+					dma_addr_t *p_rd_ptr,
+					dma_addr_t *p_wr_ptr)
+{
+	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
+	dma_addr_t rd_ptr;
+	dma_addr_t wr_ptr;
+
+	guard(mutex)(&inst->dev->hw_lock);
+
+	rd_ptr = wave6_vpu_dec_get_rd_ptr(inst);
+	wr_ptr = p_dec_info->stream_wr_ptr;
+
+	if (p_rd_ptr)
+		*p_rd_ptr = rd_ptr;
+	if (p_wr_ptr)
+		*p_wr_ptr = wr_ptr;
+}
+
+int wave6_vpu_dec_update_bitstream_buffer(struct vpu_instance *inst, int size)
+{
+	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
+	dma_addr_t wr_ptr;
+	dma_addr_t rd_ptr;
+
+	wr_ptr = p_dec_info->stream_wr_ptr;
+	rd_ptr = p_dec_info->stream_rd_ptr;
+
+	if (size > 0) {
+		if (wr_ptr < rd_ptr && rd_ptr <= wr_ptr + size)
+			return -EINVAL;
+
+		wr_ptr += size;
+
+		p_dec_info->stream_wr_ptr = wr_ptr;
+		p_dec_info->stream_rd_ptr = rd_ptr;
+	}
+
+	p_dec_info->stream_end = size == 0;
+
+	return 0;
+}
+
+void wave6_vpu_dec_set_rd_ptr(struct vpu_instance *inst, dma_addr_t addr,
+			      bool update_wr_ptr)
+{
+	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
+
+	p_dec_info->stream_rd_ptr = addr;
+	if (update_wr_ptr)
+		p_dec_info->stream_wr_ptr = addr;
+}
+
+void wave6_vpu_dec_reset_frame_buffer_info(struct vpu_instance *inst)
+{
+	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
+
+	for (int i = 0; i < WAVE6_MAX_FBS; i++) {
+		wave6_vdi_free_dma(&inst->frame_vbuf[i]);
+		memset(&inst->frame_buf[i], 0, sizeof(struct frame_buffer));
+		memset(&p_dec_info->disp_buf[i], 0, sizeof(struct frame_buffer));
+
+		wave6_vdi_free_dma(&inst->aux_vbuf[AUX_BUF_MV_COL][i]);
+		wave6_vdi_free_dma(&inst->aux_vbuf[AUX_BUF_FBC_Y_TBL][i]);
+		wave6_vdi_free_dma(&inst->aux_vbuf[AUX_BUF_FBC_C_TBL][i]);
+	}
+}
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h b/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
index 62dd4969afaf..7d6a734f64b4 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
@@ -14,6 +14,7 @@
 #include <media/v4l2-mem2mem.h>
 #include <media/v4l2-ctrls.h>
 
+#include "wave6-vpuerror.h"
 #include "wave6-vpuconfig.h"
 #include "wave6-vdi.h"
 #include "wave6-vpu.h"
@@ -47,6 +48,15 @@ enum vpu_instance_state {
 
 #define WAVE6_MAX_FBS 31
 
+#define WAVE6_DEC_HEVC_MVCOL_BUF_SIZE(_w, _h) \
+	((ALIGN((_w), 256) / 16) * (ALIGN((_h), 64) / 16) * 1 * 16)
+#define WAVE6_DEC_AVC_MVCOL_BUF_SIZE(_w, _h) \
+	((ALIGN((_w), 64) / 16) * (ALIGN((_h), 16) / 16) * 5 * 16)
+#define WAVE6_FBC_LUMA_TABLE_SIZE(_w, _h) \
+	(ALIGN((_w), 256) * ALIGN((_h), 64) / 32)
+#define WAVE6_FBC_CHROMA_TABLE_SIZE(_w, _h) \
+	(ALIGN(((_w) / 2), 256) * ALIGN((_h), 64) / 32)
+
 enum codec_std {
 	W_HEVC_DEC	= 0x00,
 	W_HEVC_ENC	= 0x01,
@@ -55,6 +65,36 @@ enum codec_std {
 	STD_UNKNOWN	= 0xFF
 };
 
+#define HEVC_PROFILE_MAIN 1
+#define HEVC_PROFILE_MAIN10 2
+#define HEVC_PROFILE_STILLPICTURE 3
+#define HEVC_PROFILE_MAIN10_STILLPICTURE 2
+
+#define H264_PROFILE_BP 1
+#define H264_PROFILE_MP 2
+#define H264_PROFILE_EXTENDED 3
+#define H264_PROFILE_HP 4
+#define H264_PROFILE_HIGH10 5
+
+#define H264_VUI_SAR_IDC_EXTENDED 255
+
+#define SEQ_CHANGE_ENABLE_PROFILE BIT(5)
+#define SEQ_CHANGE_ENABLE_SIZE BIT(16)
+#define SEQ_CHANGE_ENABLE_BIT_DEPTH BIT(18)
+#define SEQ_CHANGE_ENABLE_DPB_COUNT BIT(19)
+
+#define SEQ_CHANGE_ENABLE_ALL_HEVC (SEQ_CHANGE_ENABLE_PROFILE | \
+		SEQ_CHANGE_ENABLE_SIZE | \
+		SEQ_CHANGE_ENABLE_BIT_DEPTH | \
+		SEQ_CHANGE_ENABLE_DPB_COUNT)
+
+#define SEQ_CHANGE_ENABLE_ALL_AVC (SEQ_CHANGE_ENABLE_SIZE | \
+		SEQ_CHANGE_ENABLE_BIT_DEPTH | \
+		SEQ_CHANGE_ENABLE_DPB_COUNT)
+
+#define DEC_NOTI_FLAG_NO_FB		BIT(1)
+#define DEC_NOTI_FLAG_SEQ_CHANGE	BIT(0)
+
 #define FW_VERSION_MAJOR_MASK	0xFF000000
 #define FW_VERSION_MINOR_MASK	0x00FF0000
 #define FW_VERSION_REL_MASK	0x0000FFFF
@@ -208,12 +248,116 @@ struct instance_buffer {
 	u32 temp_size;
 };
 
+struct color_param {
+	u32 color_range;
+	u32 matrix_coefficients;
+	u32 transfer_characteristics;
+	u32 color_primaries;
+	bool color_description_present;
+	bool video_signal_type_present;
+};
+
+struct sec_axi_info {
+	bool use_dec_ip;
+	bool use_dec_lf_row;
+};
+
+struct aux_buffer_size_info {
+	int width;
+	int height;
+	enum aux_buffer_type type;
+};
+
 struct dec_scaler_info {
 	bool enable;
 	int width;
 	int height;
 };
 
+struct dec_open_param {
+	enum display_mode disp_mode;
+	u32 ext_addr_vcpu: 8;
+	u32 is_secure_inst: 1;
+	u32 inst_priority: 5;
+	struct instance_buffer inst_buffer;
+};
+
+struct dec_seq_info {
+	u32 pic_width;
+	u32 pic_height;
+	u32 f_rate_numerator;
+	u32 f_rate_denominator;
+	struct vpu_rect pic_crop_rect;
+	u32 min_frame_buffer_count: 5;
+	u32 req_mv_buffer_count: 5;
+	u32 frame_buf_delay;
+	u32 profile;
+	u32 level;
+	u32 tier;
+	bool is_ext_sar;
+	u32 aspect_rate_info;
+	u32 bitrate;
+	enum chroma_format_idc c_fmt_idc;
+	u32 luma_bit_depth;
+	u32 chroma_bit_depth;
+	u32 err_reason;
+	int warn_info;
+	dma_addr_t rd_ptr;
+	dma_addr_t wr_ptr;
+	unsigned int sequence_no;
+	struct color_param color;
+};
+
+struct dec_param {
+	u64 timestamp;
+};
+
+struct dec_output_info {
+	int nal_type;
+	int pic_type;
+	int disp_pic_width;
+	int disp_pic_height;
+	int dec_pic_width;
+	int dec_pic_height;
+	int decoded_poc;
+	int display_poc;
+	dma_addr_t rd_ptr;
+	dma_addr_t wr_ptr;
+	dma_addr_t byte_pos_frame_start;
+	dma_addr_t byte_pos_frame_end;
+	dma_addr_t frame_decoded_addr;
+	dma_addr_t frame_display_addr;
+	int error_reason;
+	int warn_info;
+	unsigned int sequence_no;
+	dma_addr_t release_disp_frame_addr[WAVE6_MAX_FBS];
+	dma_addr_t disp_frame_addr[WAVE6_MAX_FBS];
+	u64 timestamp;
+	u32 notification_flags;
+	u32 release_disp_frame_num: 5;
+	u32 disp_frame_num: 5;
+	u32 ctu_size: 2;
+	bool frame_display;
+	bool frame_decoded;
+	bool stream_end;
+	bool last_frame_in_au;
+	bool decoding_success;
+};
+
+struct dec_info {
+	struct dec_open_param open_param;
+	struct dec_seq_info seq_info;
+	dma_addr_t stream_wr_ptr;
+	dma_addr_t stream_rd_ptr;
+	bool stream_end;
+	struct frame_buffer disp_buf[WAVE6_MAX_FBS];
+	bool seq_info_obtained;
+	struct sec_axi_info sec_axi;
+	struct dec_output_info dec_out_info[WAVE6_MAX_FBS];
+	int seq_change_mask;
+	enum frame_buffer_format out_fmt;
+};
+
 /**
  * struct vpu_irq - VPU interrupt information
  * @status:	Value of the VPU interrupt status
@@ -306,6 +450,7 @@ struct vpu_instance_ops {
  * @ops:		Instance operations
  * @std:		Codec standard
  * @id:			Instance id
+ * @codec_info:		Codec-specific information
  * @frame_buf:		Metadata for reference frame buffers
  * @frame_vbuf:		Reference frame buffers
  * @aux_vbuf:		Auxiliary buffers
@@ -355,6 +500,9 @@ struct vpu_instance {
 
 	enum codec_std std;
 	u32 id;
+	union {
+		struct dec_info dec_info;
+	} *codec_info;
 	struct frame_buffer frame_buf[WAVE6_MAX_FBS];
 	struct vpu_buf frame_vbuf[WAVE6_MAX_FBS];
 	struct vpu_buf aux_vbuf[AUX_BUF_TYPE_MAX][WAVE6_MAX_FBS];
@@ -378,4 +526,24 @@ void wave6_vpu_writel_relaxed(struct vpu_core_device *core, u32 addr, u32 data);
 u32 wave6_vpu_readl(struct vpu_core_device *core, u32 addr);
 u32 wave6_vpu_readl_relaxed(struct vpu_core_device *core, u32 addr);
 
+int wave6_vpu_dec_open(struct vpu_instance *inst, struct dec_open_param *pop);
+int wave6_vpu_dec_close(struct vpu_instance *inst, u32 *fail_res);
+int wave6_vpu_dec_issue_seq_init(struct vpu_instance *inst);
+int wave6_vpu_dec_complete_seq_init(struct vpu_instance *inst, struct dec_seq_info *info);
+int wave6_vpu_dec_get_aux_buffer_size(struct vpu_instance *inst,
+				      struct aux_buffer_size_info info, u32 *size);
+int wave6_vpu_dec_register_frame_buffer(struct vpu_instance *inst);
+int wave6_vpu_dec_register_display_buffer(struct vpu_instance *inst, struct frame_buffer fb);
+int wave6_vpu_dec_start_one_frame(struct vpu_instance *inst, struct dec_param *param,
+				  u32 *fail_res);
+int wave6_vpu_dec_get_output_info(struct vpu_instance *inst, struct dec_output_info *info);
+void wave6_vpu_dec_set_rd_ptr(struct vpu_instance *inst, dma_addr_t addr,
+			      bool update_wr_ptr);
+void wave6_vpu_dec_reset_frame_buffer_info(struct vpu_instance *inst);
+void wave6_vpu_dec_get_bitstream_buffer(struct vpu_instance *inst,
+					dma_addr_t *p_rd_ptr,
+					dma_addr_t *p_wr_ptr);
+int wave6_vpu_dec_update_bitstream_buffer(struct vpu_instance *inst, int size);
+int wave6_vpu_dec_flush_instance(struct vpu_instance *inst);
+
 #endif /* __WAVE6_VPUAPI_H__ */
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h b/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
index fccb854a8a8c..d1b53f509dfa 100644
--- a/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
@@ -25,12 +25,17 @@
 #define W6_VPU_POLL_TIMEOUT		300000
 #define W6_BOOT_WAIT_TIMEOUT		10000
 #define W6_VPU_TIMEOUT			6000
+#define W6_VPU_TIMEOUT_CYCLE_COUNT	(8000000 * 4 * 4)
+
+#define HOST_ENDIAN			VDI_128BIT_LITTLE_ENDIAN
+#define VPU_STREAM_ENDIAN		HOST_ENDIAN
 
 #define W6_MAX_REMAP_PAGE_SIZE		(1024 * 1024)
 #define W6_MAX_CODE_BUF_SIZE		(4 * 1024 * 1024)
 #define W6_CODE_BUF_SIZE		(1 * 1024 * 1024)
 #define W6_EXTRA_CODE_BUF_SIZE		(256 * 1024)
 #define W6_TEMPBUF_SIZE			(3 * 1024 * 1024)
+#define W637DEC_WORKBUF_SIZE		(2 * 512 * 1024)
 #define W637DEC_WORKBUF_SIZE_FOR_CQ	(3 * 512 * 1024)
 
 static inline bool wave6_is_product_w_series(u32 code)
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuerror.h b/drivers/media/platform/chips-media/wave6/wave6-vpuerror.h
new file mode 100644
index 000000000000..152a2617182c
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpuerror.h
@@ -0,0 +1,252 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - wave6 vpu error values
+ *
+ * Copyright (C) 2026 CHIPS&MEDIA INC
+ */
+
+#ifndef __WAVE6_VPUERROR_H__
+#define __WAVE6_VPUERROR_H__
+
+#include <linux/bits.h>
+
+/* WAVE6 COMMON SYSTEM ERROR (FAIL_REASON) */
+#define WAVE6_SYSERR_QUEUEING_FAIL			BIT(0)
+#define WAVE6_SYSERR_DECODER_FUSE			BIT(1)
+#define WAVE6_SYSERR_INSTRUCTION_ACCESS_VIOLATION	BIT(2)
+#define WAVE6_SYSERR_PRIVILEGE_VIOLATION		BIT(3)
+#define WAVE6_SYSERR_DATA_ADDR_ALIGNMENT		BIT(4)
+#define WAVE6_SYSERR_DATA_ACCESS_VIOLATION		BIT(5)
+#define WAVE6_SYSERR_ACCESS_VIOLATION_HW		BIT(6)
+#define WAVE6_SYSERR_INSTRUCTION_ADDR_ALIGNMENT		BIT(7)
+#define WAVE6_SYSERR_UNKNOWN				BIT(8)
+#define WAVE6_SYSERR_BUS_ERROR				BIT(9)
+#define WAVE6_SYSERR_DOUBLE_FAULT			BIT(10)
+#define WAVE6_SYSERR_RESULT_NOT_READY			BIT(11)
+#define WAVE6_SYSERR_VPU_STILL_RUNNING			BIT(12)
+#define WAVE6_SYSERR_UNKNOWN_CMD			BIT(13)
+#define WAVE6_SYSERR_UNKNOWN_CODEC_STD			BIT(14)
+#define WAVE6_SYSERR_UNKNOWN_QUERY_OPTION		BIT(15)
+#define WAVE6_SYSERR_WATCHDOG_TIMEOUT			BIT(17)
+#define WAVE6_SYSERR_NOT_SUPPORT			BIT(20)
+#define WAVE6_SYSERR_TEMP_SEC_BUF_OVERFLOW		BIT(21)
+#define WAVE6_SYSERR_NOT_SUPPORT_PROFILE		BIT(22)
+#define WAVE6_SYSERR_TIMEOUT_CODEC_FW			BIT(30)
+
+/* WAVE6 ERROR ON DECODER (ERR_INFO) */
+#define HEVC_SPSERR_SEQ_PARAMETER_SET_ID				0x00001000
+#define HEVC_SPSERR_CHROMA_FORMAT_IDC					0x00001001
+#define HEVC_SPSERR_PIC_WIDTH_IN_LUMA_SAMPLES				0x00001002
+#define HEVC_SPSERR_PIC_HEIGHT_IN_LUMA_SAMPLES				0x00001003
+#define HEVC_SPSERR_CONF_WIN_LEFT_OFFSET				0x00001004
+#define HEVC_SPSERR_CONF_WIN_RIGHT_OFFSET				0x00001005
+#define HEVC_SPSERR_CONF_WIN_TOP_OFFSET					0x00001006
+#define HEVC_SPSERR_CONF_WIN_BOTTOM_OFFSET				0x00001007
+#define HEVC_SPSERR_BIT_DEPTH_LUMA_MINUS8				0x00001008
+#define HEVC_SPSERR_BIT_DEPTH_CHROMA_MINUS8				0x00001009
+#define HEVC_SPSERR_LOG2_MAX_PIC_ORDER_CNT_LSB_MINUS4			0x0000100A
+#define HEVC_SPSERR_SPS_MAX_DEC_PIC_BUFFERING				0x0000100B
+#define HEVC_SPSERR_SPS_MAX_NUM_REORDER_PICS				0x0000100C
+#define HEVC_SPSERR_SPS_MAX_LATENCY_INCREASE				0x0000100D
+#define HEVC_SPSERR_LOG2_MIN_LUMA_CODING_BLOCK_SIZE_MINUS3		0x0000100E
+#define HEVC_SPSERR_LOG2_DIFF_MAX_MIN_LUMA_CODING_BLOCK_SIZE		0x0000100F
+#define HEVC_SPSERR_LOG2_MIN_TRANSFORM_BLOCK_SIZE_MINUS2		0x00001010
+#define HEVC_SPSERR_LOG2_DIFF_MAX_MIN_TRANSFORM_BLOCK_SIZE		0x00001011
+#define HEVC_SPSERR_MAX_TRANSFORM_HIERARCHY_DEPTH_INTER			0x00001012
+#define HEVC_SPSERR_MAX_TRANSFORM_HIERARCHY_DEPTH_INTRA			0x00001013
+#define HEVC_SPSERR_SCALING_LIST					0x00001014
+#define HEVC_SPSERR_LOG2_DIFF_MIN_PCM_LUMA_CODING_BLOCK_SIZE_MINUS3	0x00001015
+#define HEVC_SPSERR_LOG2_DIFF_MAX_MIN_PCM_LUMA_CODING_BLOCK_SIZE	0x00001016
+#define HEVC_SPSERR_NUM_SHORTTERM_REF_PIC_SETS				0x00001017
+#define HEVC_SPSERR_NUM_LONGTERM_REF_PICS_SPS				0x00001018
+#define HEVC_SPSERR_GBU_PARSING_ERROR					0x00001019
+#define HEVC_SPSERR_EXTENSION_FLAG					0x0000101A
+#define HEVC_SPSERR_VUI_ERROR						0x0000101B
+#define HEVC_SPSERR_ACTIVATE_SPS					0x0000101C
+#define HEVC_SPSERR_PROFILE_SPACE					0x0000101D
+#define HEVC_PPSERR_PPS_PIC_PARAMETER_SET_ID				0x00002000
+#define HEVC_PPSERR_PPS_SEQ_PARAMETER_SET_ID				0x00002001
+#define HEVC_PPSERR_NUM_REF_IDX_L0_DEFAULT_ACTIVE_MINUS1		0x00002002
+#define HEVC_PPSERR_NUM_REF_IDX_L1_DEFAULT_ACTIVE_MINUS1		0x00002003
+#define HEVC_PPSERR_INIT_QP_MINUS26					0x00002004
+#define HEVC_PPSERR_DIFF_CU_QP_DELTA_DEPTH				0x00002005
+#define HEVC_PPSERR_PPS_CB_QP_OFFSET					0x00002006
+#define HEVC_PPSERR_PPS_CR_QP_OFFSET					0x00002007
+#define HEVC_PPSERR_NUM_TILE_COLUMNS_MINUS1				0x00002008
+#define HEVC_PPSERR_NUM_TILE_ROWS_MINUS1				0x00002009
+#define HEVC_PPSERR_COLUMN_WIDTH_MINUS1					0x0000200A
+#define HEVC_PPSERR_ROW_HEIGHT_MINUS1					0x0000200B
+#define HEVC_PPSERR_PPS_BETA_OFFSET_DIV2				0x0000200C
+#define HEVC_PPSERR_PPS_TC_OFFSET_DIV2					0x0000200D
+#define HEVC_PPSERR_SCALING_LIST					0x0000200E
+#define HEVC_PPSERR_LOG2_PARALLEL_MERGE_LEVEL_MINUS2			0x0000200F
+#define HEVC_PPSERR_NUM_TILE_COLUMNS_RANGE_OUT				0x00002010
+#define HEVC_PPSERR_NUM_TILE_ROWS_RANGE_OUT				0x00002011
+#define HEVC_PPSERR_MORE_RBSP_DATA_ERROR				0x00002012
+#define HEVC_PPSERR_PPS_PIC_PARAMETER_SET_ID_RANGE_OUT			0x00002013
+#define HEVC_PPSERR_PPS_SEQ_PARAMETER_SET_ID_RANGE_OUT			0x00002014
+#define HEVC_PPSERR_NUM_REF_IDX_L0_DEFAULT_ACTIVE_MINUS1_RANGE_OUT	0x00002015
+#define HEVC_PPSERR_NUM_REF_IDX_L1_DEFAULT_ACTIVE_MINUS1_RANGE_OUT	0x00002016
+#define HEVC_PPSERR_PPS_CB_QP_OFFSET_RANGE_OUT				0x00002017
+#define HEVC_PPSERR_PPS_CR_QP_OFFSET_RANGE_OUT				0x00002018
+#define HEVC_PPSERR_COLUMN_WIDTH_MINUS1_RANGE_OUT			0x00002019
+#define HEVC_PPSERR_ROW_HEIGHT_MINUS1_RANGE_OUT				0x00002020
+#define HEVC_PPSERR_PPS_BETA_OFFSET_DIV2_RANGE_OUT			0x00002021
+#define HEVC_PPSERR_PPS_TC_OFFSET_DIV2_RANGE_OUT			0x00002022
+#define HEVC_SHERR_SLICE_PIC_PARAMETER_SET_ID				0x00003000
+#define HEVC_SHERR_ACTIVATE_PPS						0x00003001
+#define HEVC_SHERR_ACTIVATE_SPS						0x00003002
+#define HEVC_SHERR_SLICE_TYPE						0x00003003
+#define HEVC_SHERR_FIRST_SLICE_IS_DEPENDENT_SLICE			0x00003004
+#define HEVC_SHERR_SHORTTERM_REF_PIC_SET_SPS_FLAG			0x00003005
+#define HEVC_SHERR_SHORTTERM_REF_PIC_SET				0x00003006
+#define HEVC_SHERR_SHORTTERM_REF_PIC_SET_IDX				0x00003007
+#define HEVC_SHERR_NUM_LONGTERM_SPS					0x00003008
+#define HEVC_SHERR_NUM_LONGTERM_PICS					0x00003009
+#define HEVC_SHERR_LT_IDX_SPS_IS_OUT_OF_RANGE				0x0000300A
+#define HEVC_SHERR_DELTA_POC_MSB_CYCLE_LT				0x0000300B
+#define HEVC_SHERR_NUM_REF_IDX_L0_ACTIVE_MINUS1				0x0000300C
+#define HEVC_SHERR_NUM_REF_IDX_L1_ACTIVE_MINUS1				0x0000300D
+#define HEVC_SHERR_COLLOCATED_REF_IDX					0x0000300E
+#define HEVC_SHERR_PRED_WEIGHT_TABLE					0x0000300F
+#define HEVC_SHERR_FIVE_MINUS_MAX_NUM_MERGE_CAND			0x00003010
+#define HEVC_SHERR_SLICE_QP_DELTA					0x00003011
+#define HEVC_SHERR_SLICE_QP_DELTA_IS_OUT_OF_RANGE			0x00003012
+#define HEVC_SHERR_SLICE_CB_QP_OFFSET					0x00003013
+#define HEVC_SHERR_SLICE_CR_QP_OFFSET					0x00003014
+#define HEVC_SHERR_SLICE_BETA_OFFSET_DIV2				0x00003015
+#define HEVC_SHERR_SLICE_TC_OFFSET_DIV2					0x00003016
+#define HEVC_SHERR_NUM_ENTRY_POINT_OFFSETS				0x00003017
+#define HEVC_SHERR_OFFSET_LEN_MINUS1					0x00003018
+#define HEVC_SHERR_SLICE_SEGMENT_HEADER_EXTENSION_LENGTH		0x00003019
+#define HEVC_SHERR_WRONG_POC_IN_STILL_PICTURE_PROFILE			0x0000301A
+#define HEVC_SHERR_SLICE_TYPE_ERROR_IN_STILL_PICTURE_PROFILE		0x0000301B
+#define HEVC_SHERR_PPS_ID_NOT_EQUAL_PREV_VALUE				0x0000301C
+#define HEVC_SPECERR_OVER_PICTURE_WIDTH_SIZE				0x00004000
+#define HEVC_SPECERR_OVER_PICTURE_HEIGHT_SIZE				0x00004001
+#define HEVC_SPECERR_OVER_CHROMA_FORMAT					0x00004002
+#define HEVC_SPECERR_OVER_BIT_DEPTH					0x00004003
+#define HEVC_SPECERR_OVER_BUFFER_OVER_FLOW				0x00004004
+#define HEVC_SPECERR_OVER_WRONG_BUFFER_ACCESS				0x00004005
+#define HEVC_ETCERR_INIT_SEQ_SPS_NOT_FOUND				0x00005000
+#define HEVC_ETCERR_DEC_PIC_VCL_NOT_FOUND				0x00005001
+#define HEVC_ETCERR_NO_VALID_SLICE_IN_AU				0x00005002
+#define HEVC_ETCERR_INPLACE_V						0x0000500F
+
+#define AVC_SPSERR_SEQ_PARAMETER_SET_ID					0x00001000
+#define AVC_SPSERR_CHROMA_FORMAT_IDC					0x00001001
+#define AVC_SPSERR_PIC_WIDTH_IN_LUMA_SAMPLES				0x00001002
+#define AVC_SPSERR_PIC_HEIGHT_IN_LUMA_SAMPLES				0x00001003
+#define AVC_SPSERR_CONF_WIN_LEFT_OFFSET					0x00001004
+#define AVC_SPSERR_CONF_WIN_RIGHT_OFFSET				0x00001005
+#define AVC_SPSERR_CONF_WIN_TOP_OFFSET					0x00001006
+#define AVC_SPSERR_CONF_WIN_BOTTOM_OFFSET				0x00001007
+#define AVC_SPSERR_BIT_DEPTH_LUMA_MINUS8				0x00001008
+#define AVC_SPSERR_BIT_DEPTH_CHROMA_MINUS8				0x00001009
+#define AVC_SPSERR_SPS_MAX_DEC_PIC_BUFFERING				0x0000100B
+#define AVC_SPSERR_SPS_MAX_NUM_REORDER_PICS				0x0000100C
+#define AVC_SPSERR_SCALING_LIST						0x00001014
+#define AVC_SPSERR_GBU_PARSING_ERROR					0x00001019
+#define AVC_SPSERR_VUI_ERROR						0x0000101B
+#define AVC_SPSERR_ACTIVATE_SPS						0x0000101C
+#define AVC_PPSERR_PPS_PIC_PARAMETER_SET_ID				0x00002000
+#define AVC_PPSERR_PPS_SEQ_PARAMETER_SET_ID				0x00002001
+#define AVC_PPSERR_NUM_REF_IDX_L0_DEFAULT_ACTIVE_MINUS1			0x00002002
+#define AVC_PPSERR_NUM_REF_IDX_L1_DEFAULT_ACTIVE_MINUS1			0x00002003
+#define AVC_PPSERR_INIT_QP_MINUS26					0x00002004
+#define AVC_PPSERR_PPS_CB_QP_OFFSET					0x00002006
+#define AVC_PPSERR_PPS_CR_QP_OFFSET					0x00002007
+#define AVC_PPSERR_SCALING_LIST						0x0000200E
+#define AVC_PPSERR_MORE_RBSP_DATA_ERROR					0x00002012
+#define AVC_PPSERR_PPS_PIC_PARAMETER_SET_ID_RANGE_OUT			0x00002013
+#define AVC_PPSERR_PPS_SEQ_PARAMETER_SET_ID_RANGE_OUT			0x00002014
+#define AVC_PPSERR_NUM_REF_IDX_L0_DEFAULT_ACTIVE_MINUS1_RANGE_OUT	0x00002015
+#define AVC_PPSERR_NUM_REF_IDX_L1_DEFAULT_ACTIVE_MINUS1_RANGE_OUT	0x00002016
+#define AVC_PPSERR_PPS_CB_QP_OFFSET_RANGE_OUT				0x00002017
+#define AVC_PPSERR_PPS_CR_QP_OFFSET_RANGE_OUT				0x00002018
+#define AVC_SHERR_SLICE_PIC_PARAMETER_SET_ID				0x00003000
+#define AVC_SHERR_ACTIVATE_PPS						0x00003001
+#define AVC_SHERR_ACTIVATE_SPS						0x00003002
+#define AVC_SHERR_SLICE_TYPE						0x00003003
+#define AVC_SHERR_FIRST_MB_IN_SLICE					0x00003004
+#define AVC_SHERR_RPLM							0x00003006
+#define AVC_SHERR_LT_IDX_SPS_IS_OUT_OF_RANGE				0x0000300A
+#define AVC_SHERR_NUM_REF_IDX_L0_ACTIVE_MINUS1				0x0000300C
+#define AVC_SHERR_NUM_REF_IDX_L1_ACTIVE_MINUS1				0x0000300D
+#define AVC_SHERR_PRED_WEIGHT_TABLE					0x0000300F
+#define AVC_SHERR_SLICE_QP_DELTA					0x00003011
+#define AVC_SHERR_SLICE_BETA_OFFSET_DIV2				0x00003015
+#define AVC_SHERR_SLICE_TC_OFFSET_DIV2					0x00003016
+#define AVC_SHERR_DISABLE_DEBLOCK_FILTER_IDC				0x00003017
+#define AVC_SPECERR_OVER_PICTURE_WIDTH_SIZE				0x00004000
+#define AVC_SPECERR_OVER_PICTURE_HEIGHT_SIZE				0x00004001
+#define AVC_SPECERR_OVER_CHROMA_FORMAT					0x00004002
+#define AVC_SPECERR_OVER_BIT_DEPTH					0x00004003
+#define AVC_SPECERR_OVER_BUFFER_OVER_FLOW				0x00004004
+#define AVC_SPECERR_OVER_WRONG_BUFFER_ACCESS				0x00004005
+#define AVC_ETCERR_INIT_SEQ_SPS_NOT_FOUND				0x00005000
+#define AVC_ETCERR_DEC_PIC_VCL_NOT_FOUND				0x00005001
+#define AVC_ETCERR_NO_VALID_SLICE_IN_AU					0x00005002
+#define AVC_ETCERR_ASO							0x00005004
+#define AVC_ETCERR_FMO							0x00005005
+#define AVC_ETCERR_INPLACE_V						0x0000500F
+
+/* WAVE6 WARNING ON DECODER (WARN_INFO) */
+#define HEVC_SPSWARN_MAX_SUB_LAYERS_MINUS1			0x00000001
+#define HEVC_SPSWARN_GENERAL_RESERVED_ZERO_44BITS		0x00000002
+#define HEVC_SPSWARN_RESERVED_ZERO_2BITS			0x00000004
+#define HEVC_SPSWARN_SUB_LAYER_RESERVED_ZERO_44BITS		0x00000008
+#define HEVC_SPSWARN_GENERAL_LEVEL_IDC				0x00000010
+#define HEVC_SPSWARN_SPS_MAX_DEC_PIC_BUFFERING_VALUE_OVER	0x00000020
+#define HEVC_SPSWARN_RBSP_TRAILING_BITS				0x00000040
+#define HEVC_SPSWARN_ST_RPS_UE_ERROR				0x00000080
+#define HEVC_SPSWARN_EXTENSION_FLAG				0x01000000
+#define HEVC_SPSWARN_REPLACED_WITH_PREV_SPS			0x02000000
+#define HEVC_PPSWARN_RBSP_TRAILING_BITS				0x00000100
+#define HEVC_PPSWARN_REPLACED_WITH_PREV_PPS			0x00000200
+#define HEVC_SHWARN_FIRST_SLICE_SEGMENT_IN_PIC_FLAG		0x00001000
+#define HEVC_SHWARN_NO_OUTPUT_OF_PRIOR_PICS_FLAG		0x00002000
+#define HEVC_SHWARN_PIC_OUTPUT_FLAG				0x00004000
+#define HEVC_SHWARN_DUPLICATED_SLICE_SEGMENT			0x00008000
+#define HEVC_ETCWARN_INIT_SEQ_VCL_NOT_FOUND			0x00010000
+#define HEVC_ETCWARN_MISSING_REFERENCE_PICTURE			0x00020000
+#define HEVC_ETCWARN_WRONG_TEMPORAL_ID				0x00040000
+#define HEVC_ETCWARN_ERROR_PICTURE_IS_REFERENCED		0x00080000
+#define HEVC_SPECWARN_OVER_PROFILE				0x00100000
+#define HEVC_SPECWARN_OVER_LEVEL				0x00200000
+#define HEVC_PRESWARN_PARSING_ERR				0x04000000
+#define HEVC_PRESWARN_MVD_OUT_OF_RANGE				0x08000000
+#define HEVC_PRESWARN_CU_QP_DELTA_VAL_OUT_OF_RANGE		0x09000000
+#define HEVC_PRESWARN_COEFF_LEVEL_REMAINING_OUT_OF_RANGE	0x0A000000
+#define HEVC_PRESWARN_PCM_ERR					0x0B000000
+#define HEVC_PRESWARN_OVERCONSUME				0x0C000000
+#define HEVC_PRESWARN_END_OF_SUBSET_ONE_BIT_ERR			0x10000000
+#define HEVC_PRESWARN_END_OF_SLICE_SEGMENT_FLAG			0x20000000
+
+#define AVC_SPSWARN_RESERVED_ZERO_2BITS				0x00000004
+#define AVC_SPSWARN_GENERAL_LEVEL_IDC				0x00000010
+#define AVC_SPSWARN_RBSP_TRAILING_BITS				0x00000040
+#define AVC_PPSWARN_RBSP_TRAILING_BITS				0x00000100
+#define AVC_SHWARN_NO_OUTPUT_OF_PRIOR_PICS_FLAG			0x00002000
+#define AVC_ETCWARN_INIT_SEQ_VCL_NOT_FOUND			0x00010000
+#define AVC_ETCWARN_MISSING_REFERENCE_PICTURE			0x00020000
+#define AVC_ETCWARN_ERROR_PICTURE_IS_REFERENCED			0x00080000
+#define AVC_SPECWARN_OVER_PROFILE				0x00100000
+#define AVC_SPECWARN_OVER_LEVEL					0x00200000
+#define AVC_PRESWARN_MVD_RANGE_OUT				0x00400000
+#define AVC_PRESWARN_MB_QPD_RANGE_OUT				0x00500000
+#define AVC_PRESWARN_COEFF_RANGE_OUT				0x00600000
+#define AVC_PRESWARN_MV_RANGE_OUT				0x00700000
+#define AVC_PRESWARN_MB_SKIP_RUN_RANGE_OUT			0x00800000
+#define AVC_PRESWARN_MB_TYPE_RANGE_OUT				0x00900000
+#define AVC_PRESWARN_SUB_MB_TYPE_RANGE_OUT			0x00A00000
+#define AVC_PRESWARN_CBP_RANGE_OUT				0x00B00000
+#define AVC_PRESWARN_INTRA_CHROMA_PRED_MODE_RANGE_OUT		0x00C00000
+#define AVC_PRESWARN_REF_IDX_RANGE_OUT				0x00D00000
+#define AVC_PRESWARN_COEFF_TOKEN_RANGE_OUT			0x00E00000
+#define AVC_PRESWARN_TOTAL_ZERO_RANGE_OUT			0x00F00000
+#define AVC_PRESWARN_RUN_BEFORE_RANGE_OUT			0x01000000
+#define AVC_PRESWARN_OVERCONSUME				0x01100000
+#define AVC_PRESWARN_MISSING_SLICE				0x01200000
+
+#endif /* __WAVE6_VPUERROR_H__ */
-- 
2.41.0.windows.3

