Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.43.123
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795078827;
	b=XzFblImYic0CGpQ7h5XQ8n0Aq1puZkPZqYx3O2MdgyuEJ3qPIZ31DZDxYKrJOC6ieNLc
	 g68POeQWrc8A4rrVKrvjVYmud0AOW0Le8EtpuNbfsjFCAzZACw2XEXvyQu3DJzAemINej
	 iqdLMYNjHdoAJAmPJiK3RXTRMRlbCSlTxAM7rzEQVLEzWdUS5XbX+2EcIHlPPAZx3HKyO
	 RpW7aKBKLIlReePTnqzQkxxHOhJhoK5erobD56JR6DMZtnMy1UN1AkwVmWw/o625rXgn7
	 tLG1mjxOn+JedyGgvH3Ot0whGvAfwgHkNMTm9BSyVUD7kTKVF5p7HJrE7pg7CkfboWA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795078827;
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
	bh=SoWcBhqkluAZN7JLzURZbyiEw+U0KEQcx+DP0q82m/w=;
	b=Hr9m5D4Ccgkcsyr//54ii8zkQNugUxS2m3l1++mviUyOt46N1BZTFQp7C+20f4jEBBHZ
	 2Urhev5PzXeYdyB75ws+tiAEST3wkwfeFrGUuMdEo2d24dj61R22OLiYk66jKSPn4YBfr
	 vg+vTQZhDPLZAqHB/6huEQSNl9xLRa/JmYpjwHQy6KRur4lj9e/Ts2/M3GKgdIhMHup4D
	 C0Lkn/PlTv99t/EY/m3ZwNNVtDVtAWn4b6IDOHrN53Oqg1A/bne9P6S+273UaQq76daZB
	 yxC/joQ1/cA6/CuKxd7hyQtPUKnR2GmPei207u8HT27hvD84tgKcKLAJbyKUcwPyYMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chipsnmedia.com;
	spf=fail smtp.mailfrom=chipsnmedia.com;
	dkim=pass header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=w+lqZC14;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.43.123
Received: from SEVP216CU002.outbound.protection.outlook.com (mail-koreacentralazon11022123.outbound.protection.outlook.com [40.107.43.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAECB606A335
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 09:00:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAECB606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.a=rsa-sha256 header.s=selector2 header.b=w+lqZC14
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bupCzv6by64eJdmQZ55pD9ZuV624jFIbfgAg8CDUG+g5xszSrcWEoExTrvSXof0siBNeDh9pfLLVwNAteEWtR3bwlI4HruR9ANcyQLNqCaqXDcpaAfYViH3/bOSOEzLiAyG2HOWrjSLofBu6J7MczUbxrVeGld7ZW2VKz2E5CdJCXSSFpXgyUetNkI+40y/EQcdEf9ViRVKyUZgCDn4DS4WoRpTNUWUrOjNRZxO2+r6krKEAY181WG+2zAHQMjmydzfNA7HQfId3i4b3QfWOwUmeojB20JBiOIeTQWkschJu/gULX3njqa6iWEde3A99EG9p6nRIlEmYCHOV8JOZVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SoWcBhqkluAZN7JLzURZbyiEw+U0KEQcx+DP0q82m/w=;
 b=y13quznwRiwJJXnsD10dDC4NxZuX/bZTeRqUJtzcy0Nup7LKcsLv3ipUgpY4Wde3pQBqIuNjnLkEPnQgYvl1kIQ7stauOASCGvOMIfNay/zP7a3pbonSCQ/Htgc7rz20TeyRubPYe9eQe5cbm6M1vyMXdD5oN6wYoqpjNmifVuu4COo1JBwnZjNImXlRtFOhlFLqlu0Liy8F0ggB3wXSiINWwZu8X/H12yTSCDvjlfJqtne//FkmIXFcv2fmFO4ZGKcu2YItbm0Qz4LN0r6gGkrKDz4f0BPi07jr9osyxa7XsyWhD0llOgkITj4ud8foZj6kG49lW7y2XIbokwaZHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SoWcBhqkluAZN7JLzURZbyiEw+U0KEQcx+DP0q82m/w=;
 b=w+lqZC14v/e/mUB8A5RCFUNLASMZQx4xVgdO03ppKRwhSPu5X5gNyDsW1+HjK5lyUxYEeKTBib6f95jXniazjYyuyXomJzOOgm4tXOaQ2dujO3ZUB1xaTUC8scH+tYX1FxFVlfhkBW2lCZHjBs1LBLy07qvG5qqUamRRm6RECw3qxd5ef3gz0wmfLbfK9qd+Rznv4pYWtY2pQPpuYj1STjgOpve//L1IyKxcUiE951UU2pyknIOiN3Bqkdw0f3UTq1Cyta8MEh4f123qYCBCKXyzPOa4qFND0BOGDc9Exl00lwaKK0+gUnUd41V6R5lbdGeuFY7gBQ7GbxmhXn1RNQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SE2P216MB360180.KORP216.PROD.OUTLOOK.COM (2603:1096:101:30b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 09:00:22 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 09:00:22 +0000
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
Subject: [PATCH v8 02/11] media: chips-media: wave6: Add Wave6 control driver
Date: Thu, 19 Nov 2026 17:59:56 +0900
Message-Id: <6b00047b748267a2ff4e18ccbfd573ea92166d34.1795075580.git.nas.chung@chipsnmedia.com>
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
X-MS-Office365-Filtering-Correlation-Id: dd1b475a-70c3-424a-d75d-08df461b8a99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|52116014|376014|1800799024|366016|22082099003|18002099003|6133799003|56012099006|10067099003|261026135527099003|261026140227099003|261026130827099003|261026121527099003|261028144727099003|261021123027099003|261022113327099003|261022105027099003|261021133027099003|261021130227099003|261021135927099003|261021121427099003|261022075727099003|261022115727099003|261009223027099003|261102123227099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	9EiznbNAuv8yaJImPGeyRiRGz8lai+hX0ciMWnXAq9doH+6mlDLnzhrgGTXP/bwduiSruvXqmPkbcbT+9Ft3E6UHa9z+Uu/+al6lw0D6bzY6MR1bjKqKMKfQ9IDb8Y0yABnEdGgdGjmbsn2DbRZ5ytPeylxyn4IcxvOlWTtFeg8hNNbMqezE/GwRQP6zUw3P+e6sTbVoprnUSKHpa38r0jUb0zqIyPBxgWWkP0L71rDwgs+MZ24Kh5aRAeJv6j6w3UgMtqdHdwVHzOnwUk01DoqYPdYwwfEOiYid2VIqoSumHdwG7FfgLhvgOnUUR9jMDdYrbWikkOKUYP0hI4GBmU8kVhq+VqdjkIUIwJWTpJm2YxjopyBIKIRydaDCoU5/EapAuSGcWznfjAzwUBO7zRlINzYhVu8ogbj0n6x+Qr9eeXsJwyRMOh+FbnOAYkz/wgmwjkSZ5PVuDmu2xTfEOjfbIJNPS6sq4jBmiTT29hnxFPWluc2Q00b+68Uf2RK8vGoKJEcKXoOSOnem4t9xsrXIenn8eBOMvyehIaQ76NLzVrwmDLAFzkBybhv5/Det6BQ/SP/loCzHmXUeW1oSC6F3oMwgRO1CsqEx2TogPLXLTrV8LzLoJxq5vcD9KhYLBuz4Y8SPJWO93TyQnYpaW7brpXyQknUkCMB2v36RdeyZnH4CbCRwsF2AWP/mwlnmxxeX2dwYZwHwAa2vmIxTnG5Vi00b3llLEYFLe4nePlk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(52116014)(376014)(1800799024)(366016)(22082099003)(18002099003)(6133799003)(56012099006)(10067099003)(261026135527099003)(261026140227099003)(261026130827099003)(261026121527099003)(261028144727099003)(261021123027099003)(261022113327099003)(261022105027099003)(261021133027099003)(261021130227099003)(261021135927099003)(261021121427099003)(261022075727099003)(261022115727099003)(261009223027099003)(261102123227099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W3isbuAqNi8Ca2X+MT1s2uF7t2Z8ZJBjp5akxey/9nMuRyMe+eXMCEjPFb4U?=
 =?us-ascii?Q?xvvPDHiB7b7b6cnhrw2cxQCHeFHccRvoP8NK9sHHZbQzDwX6HTBLpMEWrcVG?=
 =?us-ascii?Q?8vRI53dbFDnsXWFD00eyBIKVFECIaM7OlN33wsn7t8pUBpl2KsiljAI8FEbW?=
 =?us-ascii?Q?2F1ZCcW57lBTXz1uc4yhowZGI6rE7BW+F7R6i3auFqMG1gdT/TnvvqmT+gT2?=
 =?us-ascii?Q?umHfrsG2SCjd5ZDXpKCTzRDa1MbXSCGS3f9wMkIvaTiir+18C8tEIe9wUn+/?=
 =?us-ascii?Q?R3Kl7LkLN2Sd+WhRw4+SxnXP1GdQRgfYrweDGFUkTkHf92Bzd9WzLYbp8SdL?=
 =?us-ascii?Q?Ou3+r+ZEWaw+CzIkUzvsQt/WBh3j/RBjAnFRhS1dZQadLrBJJJXvb2WHaztm?=
 =?us-ascii?Q?zDSNVXnxw+h97FsrT7auqTR/4JDFBMcskt9Ty9qHimKGcLeJC7sqO2DNoDx3?=
 =?us-ascii?Q?0C6RrIgRCwEIKPwyjaP5eiLmhiRAaRfVZZIqNf4WLCbWd4PZds+AJpQsbQIm?=
 =?us-ascii?Q?E7rwHHo9PwLy/nVIS8gzCLCG6bZx6WrcGhWxJ9DtkS3eEg3FBtWC2VuNdT55?=
 =?us-ascii?Q?yYBxKMoUAluZwc5NfQJrdL4abvTODIG5eH9nR+0tiIXpEV+KF+f+VlidR7y+?=
 =?us-ascii?Q?2RiwZzWvYSmMSUA3sTqmRNoygBkYewfgeukus0mXCyIZBINMGRdzZ4/MI+19?=
 =?us-ascii?Q?PtBBNNrfSTmcV8/KKjjuxtlJ6KveNIyBA8+qTUm+U15tQ2KSp4G5tiXTTQwN?=
 =?us-ascii?Q?HnMo5xI/Fa4QRb86yICqFoe07INFp8juqM6NcIUIzz6PVc1FsMlU+2ElgriK?=
 =?us-ascii?Q?jWNhAiD/D0GRj4vMc5CWOs31T5DBfKh0c6Ca5xQnW91wCVmtQxMQif/ySoUJ?=
 =?us-ascii?Q?+S73Yk2WogXo8pMwUc/MHqSBMFeW0J1S4vOLwuc6qSSyftb6SCqjGUFYCy7g?=
 =?us-ascii?Q?FWwQhY4S4htv7M2eyM90yW+0qWZXB/NDbXwJwstvCvI7xZzT71WGgzLttu/J?=
 =?us-ascii?Q?Z9MUveOuefKgt8ROustFt0NoYGULUJd2v1Ai0oTLQp/g8W12K3GXo82WLIOE?=
 =?us-ascii?Q?6lDdTu5B53nc8eX8Wd69Abuug38P3FsCEnUw+nPlSNBqU/UCCIksn2Kx6JxV?=
 =?us-ascii?Q?WV+6wYluyU75mZSGf+Xm/z3XtylKX8otWv+O3N12qqpT7bV8ILhYcYeyUmGR?=
 =?us-ascii?Q?qUpIQ74M2NRXipyLnTESCKQayLSy5TcG4uHO3/M11tNwwgNqdd+XKFb/CH4u?=
 =?us-ascii?Q?mjHqt1B4casSQFlWetOx/ShquhGMdNv9LnHZLp5juuW5yXfNWgMKV3VZxD1q?=
 =?us-ascii?Q?WpLmkAoH7zIjcaxcx5zExc9x2NKBLP05anOEMatWdaLl1apP0LMtsikXm00f?=
 =?us-ascii?Q?+pTXTJEUqCP3JpmrpMV6xkeLkiD/JZrwFb+ExZIffZ2lD2LvepXj46JY4Ugg?=
 =?us-ascii?Q?sWjiYkraCJQEMve2GzjHp/EgdyEcWLLYpYns2pxmEScxQl2d4+S5BoTv0U9A?=
 =?us-ascii?Q?InDExavivLu0Z7h9zHpSIuyQYPmYPmfH/sAsXIZxATwGb18VdvQHqdZazJHR?=
 =?us-ascii?Q?i+r2gys21Qa0eUNBbNXcEFl2YrcZn+S3DmKo7yGNnjknG5Yac34apeo6DpXe?=
 =?us-ascii?Q?rvXweoSpqXPfqlN2F5zxweWdzBTRdi3JNgYIEZl6CECkCkPS+lGQBEzdhDJG?=
 =?us-ascii?Q?wrJs1QzFFk0tf/NFd+CwpDWx6yTQ3OKSLm3He9/CYio8upHe7IAL+hjl+i6h?=
 =?us-ascii?Q?jyBxkeNjGl2bInF6tteRmkR8FXv5anU=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd1b475a-70c3-424a-d75d-08df461b8a99
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 09:00:22.5340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bHTzDZbFLHLyMwS9FAnJPNKTL5Wl4xIjpEhAJypcabOCGj8SJPR2qv5avQ2AQKGEZ4LxcRdvhBDsUjHtu2yyXkdTKIzcJR5eSgoeWIjDdu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2P216MB360180

Add the control driver for the Chips&Media Wave6 video codec IP.

The hardware contains one control register region and four interface
register regions for a shared video processing engine.

This driver handles the control region and manages shared resources such
as firmware loading, firmware memory allocation, and coordination required
by the interface register regions.

It also instantiates and coordinates with the `wave6-core` child devices
for firmware and power state management.

Tested-by: Ming Qian <ming.qian@oss.nxp.com>
Tested-by: Marek Vasut <marek.vasut@mailbox.org>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 MAINTAINERS                                   |   1 +
 drivers/media/platform/chips-media/Kconfig    |   1 +
 drivers/media/platform/chips-media/Makefile   |   1 +
 .../media/platform/chips-media/wave6/Kconfig  |  13 +
 .../media/platform/chips-media/wave6/Makefile |   4 +
 .../chips-media/wave6/wave6-regdefine.h       |  49 ++
 .../platform/chips-media/wave6/wave6-vdi.h    |  82 ++
 .../platform/chips-media/wave6/wave6-vpu.c    | 780 ++++++++++++++++++
 .../platform/chips-media/wave6/wave6-vpu.h    | 137 +++
 .../chips-media/wave6/wave6-vpuconfig.h       |  37 +
 10 files changed, 1105 insertions(+)
 create mode 100644 drivers/media/platform/chips-media/wave6/Kconfig
 create mode 100644 drivers/media/platform/chips-media/wave6/Makefile
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-regdefine.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vdi.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.c
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpu.h
 create mode 100644 drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h

diff --git a/MAINTAINERS b/MAINTAINERS
index e014d1b1c890..4c472b30f78a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -30132,6 +30132,7 @@ L:	linux-media@vger.kernel.org
 L:	imx@lists.linux.dev
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/nxp,imx95-vpu.yaml
+F:	drivers/media/platform/chips-media/wave6/
 
 WHISKEYCOVE PMIC GPIO DRIVER
 M:	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
diff --git a/drivers/media/platform/chips-media/Kconfig b/drivers/media/platform/chips-media/Kconfig
index ad350eb6b1fc..8ef7fc8029a4 100644
--- a/drivers/media/platform/chips-media/Kconfig
+++ b/drivers/media/platform/chips-media/Kconfig
@@ -4,3 +4,4 @@ comment "Chips&Media media platform drivers"
 
 source "drivers/media/platform/chips-media/coda/Kconfig"
 source "drivers/media/platform/chips-media/wave5/Kconfig"
+source "drivers/media/platform/chips-media/wave6/Kconfig"
diff --git a/drivers/media/platform/chips-media/Makefile b/drivers/media/platform/chips-media/Makefile
index 6b5d99de8b54..b9a07a91c9d6 100644
--- a/drivers/media/platform/chips-media/Makefile
+++ b/drivers/media/platform/chips-media/Makefile
@@ -2,3 +2,4 @@
 
 obj-y += coda/
 obj-y += wave5/
+obj-y += wave6/
diff --git a/drivers/media/platform/chips-media/wave6/Kconfig b/drivers/media/platform/chips-media/wave6/Kconfig
new file mode 100644
index 000000000000..153a46ebdc6b
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0
+
+config VIDEO_WAVE6_VPU
+	tristate "Chips&Media Wave6 Codec Driver"
+	depends on V4L_MEM2MEM_DRIVERS
+	depends on VIDEO_DEV && OF
+	depends on ARCH_MXC || COMPILE_TEST
+	select GENERIC_ALLOCATOR
+	help
+	  Chips&Media Wave6 stateful codec driver.
+	  The wave6 driver manages shared resources such as firmware memory.
+	  To compile this driver as a module, choose M here: the
+	  module will be called wave6.
diff --git a/drivers/media/platform/chips-media/wave6/Makefile b/drivers/media/platform/chips-media/wave6/Makefile
new file mode 100644
index 000000000000..255fc90bc642
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+wave6-objs += wave6-vpu.o
+obj-$(CONFIG_VIDEO_WAVE6_VPU) += wave6.o
diff --git a/drivers/media/platform/chips-media/wave6/wave6-regdefine.h b/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
new file mode 100644
index 000000000000..e879a9743cb3
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - wave6 register definitions
+ *
+ * Copyright (C) 2026 CHIPS&MEDIA INC
+ */
+
+#ifndef __WAVE6_REGDEFINE_H__
+#define __WAVE6_REGDEFINE_H__
+
+#include <linux/bitfield.h>
+
+enum wave6_command {
+	W6_CMD_INIT_VPU		= 0x0001,
+	W6_CMD_WAKEUP_VPU	= 0x0002,
+	W6_CMD_SLEEP_VPU	= 0x0004,
+	W6_CMD_INIT_WORK_BUF	= 0x1000,
+};
+
+#define W6_REG_BASE	0x00000000
+
+#define W6_VPU_VCPU_CUR_PC				(W6_REG_BASE + 0x0004)
+#define W6_VPU_HOST_INT_REQ				(W6_REG_BASE + 0x0038)
+#define		HOST_INT_REQ_ON				BIT(0)
+#define W6_VPU_REMAP_CTRL_GB				(W6_REG_BASE + 0x0060)
+#define		REMAP_CTRL_ON				BIT(31)
+#define		REMAP_CTRL_INDEX(x)			FIELD_PREP(GENMASK(15, 12), (x))
+#define		REMAP_CTRL_PAGE_SIZE_ON			BIT(11)
+#define		REMAP_CTRL_PAGE_SIZE(x)			FIELD_PREP(GENMASK(8, 0), ((x) >> 12))
+#define W6_VPU_REMAP_VADDR_GB				(W6_REG_BASE + 0x0064)
+#define W6_VPU_REMAP_PADDR_GB				(W6_REG_BASE + 0x0068)
+#define W6_VPU_REMAP_CORE_START_GB			(W6_REG_BASE + 0x006C)
+#define		REMAP_CORE_START_ON			BIT(0)
+#define W6_VPU_BUSY_STATUS				(W6_REG_BASE + 0x0070)
+#define		BUSY_STATUS_SET				BIT(0)
+#define W6_VPU_RET_PRODUCT_CODE				(W6_REG_BASE + 0x0094)
+
+/* COMMON */
+#define W6_COMMAND_GB					(W6_REG_BASE + 0x104)
+#define W6_COMMAND					(W6_REG_BASE + 0x200)
+#define W6_CMD_INIT_VPU_SEC_AXI_BASE_CORE0		(W6_REG_BASE + 0x364)
+#define W6_CMD_INIT_VPU_SEC_AXI_SIZE_CORE0		(W6_REG_BASE + 0x368)
+#define W6_CMD_SET_WORK_BUF_ADDR			(W6_REG_BASE + 0x5F0)
+#define W6_CMD_SET_WORK_BUF_SIZE			(W6_REG_BASE + 0x5F4)
+#define		SET_WORK_BUF_SIZE_ACK			0
+#define W6_RET_SUCCESS					(W6_REG_BASE + 0x208)
+#define W6_RET_FAIL_REASON				(W6_REG_BASE + 0x20C)
+
+#endif /* __WAVE6_REGDEFINE_H__ */
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vdi.h b/drivers/media/platform/chips-media/wave6/wave6-vdi.h
new file mode 100644
index 000000000000..69ebf0ebcb13
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vdi.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - low level access interface
+ *
+ * Copyright (C) 2026 CHIPS&MEDIA INC
+ */
+
+#ifndef __WAVE6_VDI_H__
+#define __WAVE6_VDI_H__
+
+#include <linux/string.h>
+#include <linux/device.h>
+#include <linux/dma-mapping.h>
+#include <linux/io.h>
+
+/**
+ * struct vpu_buf - VPU buffer for a coherent DMA buffer
+ * @size:	Buffer size
+ * @daddr:	Mapped address for device access
+ * @vaddr:	Kernel virtual address
+ * @dev:	Device pointer for DMA API
+ *
+ * Represents a buffer allocated via dma_alloc_coherent().
+ */
+struct vpu_buf {
+	size_t size;
+	dma_addr_t daddr;
+	void *vaddr;
+	struct device *dev;
+};
+
+static inline void wave6_vdi_writel(void __iomem *base, u32 addr, u32 data)
+{
+	writel(data, base + addr);
+}
+
+static inline void wave6_vdi_writel_relaxed(void __iomem *base, u32 addr,
+					    u32 data)
+{
+	writel_relaxed(data, base + addr);
+}
+
+static inline unsigned int wave6_vdi_readl(void __iomem *base, u32 addr)
+{
+	return readl(base + addr);
+}
+
+static inline unsigned int wave6_vdi_readl_relaxed(void __iomem *base, u32 addr)
+{
+	return readl_relaxed(base + addr);
+}
+
+static inline int wave6_vdi_alloc_dma(struct device *dev, struct vpu_buf *vb)
+{
+	void *vaddr;
+	dma_addr_t daddr;
+
+	if (!vb || !vb->size)
+		return -EINVAL;
+
+	vaddr = dma_alloc_coherent(dev, vb->size, &daddr, GFP_KERNEL);
+	if (!vaddr)
+		return -ENOMEM;
+
+	vb->vaddr = vaddr;
+	vb->daddr = daddr;
+	vb->dev = dev;
+
+	return 0;
+}
+
+static inline void wave6_vdi_free_dma(struct vpu_buf *vb)
+{
+	if (!vb || !vb->size || !vb->vaddr)
+		return;
+
+	dma_free_coherent(vb->dev, vb->size, vb->vaddr, vb->daddr);
+
+	memset(vb, 0, sizeof(*vb));
+}
+
+#endif /* __WAVE6_VDI_H__ */
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu.c b/drivers/media/platform/chips-media/wave6/wave6-vpu.c
new file mode 100644
index 000000000000..9160ce53062c
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu.c
@@ -0,0 +1,780 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+/*
+ * Wave6 series multi-standard codec IP - wave6 driver
+ *
+ * Copyright (C) 2026 CHIPS&MEDIA INC
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/clk.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/property.h>
+#include <linux/of_irq.h>
+#include <linux/firmware.h>
+#include <linux/interrupt.h>
+#include <linux/pm_runtime.h>
+#include <linux/pm_domain.h>
+#include <linux/dma-mapping.h>
+#include <linux/iopoll.h>
+#include <linux/genalloc.h>
+
+#include "wave6-vpuconfig.h"
+#include "wave6-regdefine.h"
+#include "wave6-vpu.h"
+
+static const struct wave6_vpu_resource wave633c_data = {
+	.fw_name = "cnm/wave633c_imx9_codec_fw.bin",
+	/* For HEVC, AVC, 4096x4096, 8bit */
+	.sram_size = 0x14800,
+};
+
+static const struct wave6_vpu_core_resource wave633c_core_data = {
+	.codec_types = WAVE633_CODEC_TYPE,
+	.compatible_fw_version = WAVE633_COMPATIBLE_FW_VERSION,
+};
+
+static const char *wave6_vpu_state_name(enum wave6_vpu_state state)
+{
+	switch (state) {
+	case WAVE6_VPU_STATE_OFF:
+		return "off";
+	case WAVE6_VPU_STATE_PREPARE:
+		return "prepare";
+	case WAVE6_VPU_STATE_ON:
+		return "on";
+	case WAVE6_VPU_STATE_SLEEP:
+		return "sleep";
+	default:
+		return "unknown";
+	}
+}
+
+static bool wave6_vpu_valid_transition(struct wave6_vpu_device *vpu,
+				       enum wave6_vpu_state next)
+{
+	switch (vpu->state) {
+	case WAVE6_VPU_STATE_OFF:
+		/* to PREPARE: first boot attempt */
+		/* to ON: already booted before, skipping boot */
+		if (next == WAVE6_VPU_STATE_PREPARE ||
+		    next == WAVE6_VPU_STATE_ON)
+			return true;
+		break;
+	case WAVE6_VPU_STATE_PREPARE:
+		/* to OFF: boot failed */
+		/* to ON: boot successful */
+		if (next == WAVE6_VPU_STATE_OFF ||
+		    next == WAVE6_VPU_STATE_ON)
+			return true;
+		break;
+	case WAVE6_VPU_STATE_ON:
+		/* to OFF: sleep failed */
+		/* to SLEEP: sleep successful */
+		if (next == WAVE6_VPU_STATE_OFF ||
+		    next == WAVE6_VPU_STATE_SLEEP)
+			return true;
+		break;
+	case WAVE6_VPU_STATE_SLEEP:
+		/* to OFF: resume failed */
+		/* to ON: resume successful */
+		if (next == WAVE6_VPU_STATE_OFF ||
+		    next == WAVE6_VPU_STATE_ON)
+			return true;
+		break;
+	}
+
+	dev_err(vpu->dev, "invalid transition: %s -> %s\n",
+		wave6_vpu_state_name(vpu->state), wave6_vpu_state_name(next));
+
+	return false;
+}
+
+static void wave6_vpu_set_state(struct wave6_vpu_device *vpu,
+				enum wave6_vpu_state state)
+{
+	if (!wave6_vpu_valid_transition(vpu, state))
+		return;
+
+	dev_dbg(vpu->dev, "set state: %s -> %s\n",
+		wave6_vpu_state_name(vpu->state), wave6_vpu_state_name(state));
+
+	vpu->state = state;
+}
+
+static int wave6_vpu_wait_busy(void __iomem *core_base)
+{
+	u32 val;
+
+	return read_poll_timeout(wave6_vdi_readl, val, !val,
+				 W6_VPU_POLL_DELAY_US, W6_VPU_POLL_TIMEOUT,
+				 false, core_base, W6_VPU_BUSY_STATUS);
+}
+
+static int wave6_vpu_check_result(void __iomem *core_base)
+{
+	if (wave6_vdi_readl(core_base, W6_RET_SUCCESS))
+		return 0;
+
+	return wave6_vdi_readl(core_base, W6_RET_FAIL_REASON);
+}
+
+static u32 wave6_vpu_get_code_buf_size(struct wave6_vpu_device *vpu)
+{
+	return min_t(u32, vpu->code_buf.size, W6_MAX_CODE_BUF_SIZE);
+}
+
+static void wave6_vpu_remap_code_buf(struct wave6_vpu_device *vpu)
+{
+	dma_addr_t code_base = vpu->code_buf.dma_addr;
+	u32 reg_val;
+
+	for (u32 i = 0; i < wave6_vpu_get_code_buf_size(vpu) / W6_MAX_REMAP_PAGE_SIZE; i++) {
+		reg_val = REMAP_CTRL_ON |
+			  REMAP_CTRL_INDEX(i) |
+			  REMAP_CTRL_PAGE_SIZE_ON |
+			  REMAP_CTRL_PAGE_SIZE(W6_MAX_REMAP_PAGE_SIZE);
+		wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_CTRL_GB, reg_val);
+		wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_VADDR_GB,
+				 i * W6_MAX_REMAP_PAGE_SIZE);
+		wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_PADDR_GB,
+				 code_base + i * W6_MAX_REMAP_PAGE_SIZE);
+	}
+}
+
+static int wave6_vpu_init_code_buf(struct wave6_vpu_device *vpu)
+{
+	void *vaddr;
+
+	if (vpu->code_buf.size < W6_CODE_BUF_SIZE)
+		return dev_err_probe(vpu->dev, -EINVAL,
+				     "code buf size (%zu) is too small\n",
+				     vpu->code_buf.size);
+
+	vaddr = devm_memremap(vpu->dev,
+			      vpu->code_buf.phys_addr,
+			      vpu->code_buf.size,
+			      MEMREMAP_WC);
+	if (IS_ERR(vaddr))
+		return dev_err_probe(vpu->dev, PTR_ERR(vaddr),
+				     "failed to map code buf\n");
+
+	vpu->code_buf.dma_addr = dma_map_phys(vpu->dev,
+					      vpu->code_buf.phys_addr,
+					      vpu->code_buf.size,
+					      DMA_BIDIRECTIONAL,
+					      DMA_ATTR_SKIP_CPU_SYNC);
+	if (dma_mapping_error(vpu->dev, vpu->code_buf.dma_addr))
+		return dev_err_probe(vpu->dev, -ENOMEM,
+				     "failed to DMA map code buf\n");
+
+	vpu->code_buf.vaddr = vaddr;
+
+	return 0;
+}
+
+static void wave6_vpu_allocate_work_buffers(struct wave6_vpu_device *vpu)
+{
+	struct vpu_buf *buf;
+
+	for (int i = 0; i < MAX_NUM_INSTANCE; i++) {
+		buf = &vpu->work_buffers[i];
+		buf->size = W637DEC_WORKBUF_SIZE_FOR_CQ;
+
+		if (wave6_vdi_alloc_dma(vpu->dev, buf)) {
+			dev_warn(vpu->dev, "Failed to allocate work_buffers\n");
+			return;
+		}
+
+		vpu->work_buffers_alloc++;
+	}
+}
+
+static void wave6_vpu_free_work_buffers(struct wave6_vpu_device *vpu)
+{
+	for (int i = 0; i < vpu->work_buffers_alloc; i++)
+		wave6_vdi_free_dma(&vpu->work_buffers[i]);
+
+	vpu->work_buffers_alloc = 0;
+	vpu->work_buffers_avail = 0;
+}
+
+static int wave6_vpu_init_work_buf(struct wave6_vpu_device *vpu,
+				   void __iomem *core_base)
+{
+	int ret;
+
+	lockdep_assert_held(&vpu->lock);
+
+	wave6_vdi_writel(core_base, W6_VPU_BUSY_STATUS, BUSY_STATUS_SET);
+	wave6_vdi_writel(core_base, W6_COMMAND, W6_CMD_INIT_WORK_BUF);
+	wave6_vdi_writel(core_base, W6_VPU_HOST_INT_REQ, HOST_INT_REQ_ON);
+
+	ret = wave6_vpu_wait_busy(core_base);
+	if (ret) {
+		dev_err(vpu->dev, "init work buf failed\n");
+		return -EINVAL;
+	}
+
+	ret = wave6_vpu_check_result(core_base);
+	if (ret) {
+		dev_err(vpu->dev, "init work buf failed, reason 0x%x\n", ret);
+		return -EIO;
+	}
+
+	vpu->work_buffers_avail = vpu->work_buffers_alloc;
+
+	return 0;
+}
+
+static int wave6_vpu_init_vpu(struct wave6_vpu_device *vpu,
+			      void __iomem *core_base)
+{
+	int ret;
+
+	lockdep_assert_held(&vpu->lock);
+
+	/* try init directly as firmware is running */
+	if (wave6_vdi_readl(core_base, W6_VPU_VCPU_CUR_PC))
+		goto init_done;
+
+	wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_PREPARE);
+
+	wave6_vpu_remap_code_buf(vpu);
+
+	wave6_vdi_writel(core_base, W6_VPU_BUSY_STATUS, BUSY_STATUS_SET);
+	wave6_vdi_writel(core_base, W6_CMD_INIT_VPU_SEC_AXI_BASE_CORE0,
+			 vpu->sram_buf.dma_addr);
+	wave6_vdi_writel(core_base, W6_CMD_INIT_VPU_SEC_AXI_SIZE_CORE0,
+			 vpu->sram_buf.size);
+	wave6_vdi_writel(vpu->reg_base, W6_COMMAND_GB, W6_CMD_INIT_VPU);
+	wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_CORE_START_GB,
+			 REMAP_CORE_START_ON);
+
+	ret = wave6_vpu_wait_busy(core_base);
+	if (ret) {
+		dev_err(vpu->dev, "init vpu timeout\n");
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return -EINVAL;
+	}
+
+	ret = wave6_vpu_check_result(core_base);
+	if (ret) {
+		dev_err(vpu->dev, "init vpu fail, reason 0x%x\n", ret);
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return -EIO;
+	}
+
+init_done:
+	ret = wave6_vpu_init_work_buf(vpu, core_base);
+	if (ret)
+		return ret;
+
+	wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_ON);
+
+	return 0;
+}
+
+static int wave6_vpu_sleep(struct wave6_vpu_device *vpu,
+			   void __iomem *core_base)
+{
+	int ret;
+
+	lockdep_assert_held(&vpu->lock);
+
+	if (!wave6_vdi_readl(core_base, W6_VPU_VCPU_CUR_PC)) {
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return 0;
+	}
+
+	wave6_vdi_writel(core_base, W6_VPU_BUSY_STATUS, BUSY_STATUS_SET);
+	wave6_vdi_writel(core_base, W6_COMMAND, W6_CMD_SLEEP_VPU);
+	wave6_vdi_writel(core_base, W6_VPU_HOST_INT_REQ, HOST_INT_REQ_ON);
+
+	ret = wave6_vpu_wait_busy(core_base);
+	if (ret) {
+		dev_err(vpu->dev, "sleep vpu timeout\n");
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return -EINVAL;
+	}
+
+	ret = wave6_vpu_check_result(core_base);
+	if (ret) {
+		dev_err(vpu->dev, "sleep vpu fail, reason 0x%x\n", ret);
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return -EIO;
+	}
+
+	wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_SLEEP);
+
+	return 0;
+}
+
+static int wave6_vpu_wakeup(struct wave6_vpu_device *vpu,
+			    void __iomem *core_base)
+{
+	int ret;
+
+	lockdep_assert_held(&vpu->lock);
+
+	/* try wakeup directly as firmware is running */
+	if (wave6_vdi_readl(core_base, W6_VPU_VCPU_CUR_PC))
+		goto wakeup_done;
+
+	wave6_vpu_remap_code_buf(vpu);
+
+	wave6_vdi_writel(core_base, W6_VPU_BUSY_STATUS, BUSY_STATUS_SET);
+	wave6_vdi_writel(core_base, W6_CMD_INIT_VPU_SEC_AXI_BASE_CORE0,
+			 vpu->sram_buf.dma_addr);
+	wave6_vdi_writel(core_base, W6_CMD_INIT_VPU_SEC_AXI_SIZE_CORE0,
+			 vpu->sram_buf.size);
+	wave6_vdi_writel(vpu->reg_base, W6_COMMAND_GB, W6_CMD_WAKEUP_VPU);
+	wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_CORE_START_GB,
+			 REMAP_CORE_START_ON);
+
+	ret = wave6_vpu_wait_busy(core_base);
+	if (ret) {
+		dev_err(vpu->dev, "wakeup vpu timeout\n");
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return -EINVAL;
+	}
+
+	ret = wave6_vpu_check_result(core_base);
+	if (ret) {
+		dev_err(vpu->dev, "wakeup vpu fail, reason 0x%x\n", ret);
+		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
+		return -EIO;
+	}
+
+wakeup_done:
+	wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_ON);
+
+	return 0;
+}
+
+static int wave6_vpu_try_boot(struct wave6_vpu_device *vpu,
+			      void __iomem *core_base)
+{
+	u32 product_code;
+	int ret;
+
+	lockdep_assert_held(&vpu->lock);
+
+	if (vpu->state != WAVE6_VPU_STATE_OFF && vpu->state != WAVE6_VPU_STATE_SLEEP)
+		return 0;
+
+	product_code = wave6_vdi_readl(core_base, W6_VPU_RET_PRODUCT_CODE);
+	if (!wave6_is_product_w_series(product_code)) {
+		dev_err(vpu->dev, "unknown product : %08x\n", product_code);
+		return -EINVAL;
+	}
+
+	if (vpu->state == WAVE6_VPU_STATE_SLEEP) {
+		ret = wave6_vpu_wakeup(vpu, core_base);
+		return ret;
+	}
+
+	ret = wave6_vpu_init_vpu(vpu, core_base);
+
+	return ret;
+}
+
+int wave6_vpu_get(struct wave6_vpu_device *vpu, void __iomem *core_base)
+{
+	int ret;
+
+	guard(mutex)(&vpu->lock);
+
+	/* Only the first core executes boot; others return */
+	if (atomic_inc_return(&vpu->core_count) > 1)
+		return 0;
+
+	ret = pm_runtime_resume_and_get(vpu->dev);
+	if (ret)
+		goto error_pm;
+
+	ret = wave6_vpu_try_boot(vpu, core_base);
+	if (ret)
+		goto error_boot;
+
+	return 0;
+
+error_boot:
+	pm_runtime_put_sync(vpu->dev);
+error_pm:
+	atomic_dec(&vpu->core_count);
+
+	return ret;
+}
+
+void wave6_vpu_put(struct wave6_vpu_device *vpu, void __iomem *core_base)
+{
+	guard(mutex)(&vpu->lock);
+
+	/* Only the last core executes sleep; others return */
+	if (atomic_dec_return(&vpu->core_count) > 0)
+		return;
+
+	wave6_vpu_sleep(vpu, core_base);
+
+	pm_runtime_put_sync(vpu->dev);
+}
+
+void wave6_vpu_require_work_buffer(struct wave6_vpu_device *vpu,
+				   void __iomem *core_base)
+{
+	struct vpu_buf *vb;
+	u32 size;
+
+	size = wave6_vdi_readl(core_base, W6_CMD_SET_WORK_BUF_SIZE);
+	if (!size)
+		return;
+
+	if (WARN_ON(size > W637DEC_WORKBUF_SIZE_FOR_CQ))
+		goto exit;
+
+	if (WARN_ON(vpu->work_buffers_avail == 0))
+		goto exit;
+
+	vpu->work_buffers_avail--;
+	vb = &vpu->work_buffers[vpu->work_buffers_avail];
+
+	wave6_vdi_writel(core_base, W6_CMD_SET_WORK_BUF_ADDR, vb->daddr);
+
+exit:
+	wave6_vdi_writel(core_base, W6_CMD_SET_WORK_BUF_SIZE, SET_WORK_BUF_SIZE_ACK);
+}
+
+static int wave6_vpu_create_cores(struct wave6_vpu_device *vpu)
+{
+	struct device_node *child;
+	int num_cores = 0;
+
+	for_each_available_child_of_node(vpu->dev->of_node, child) {
+		struct platform_device_info info = {};
+		struct platform_device *pdev;
+		struct resource res[2];
+		int irq;
+
+		if (num_cores >= W6_VPU_MAX_NUM_CORE) {
+			of_node_put(child);
+			break;
+		}
+
+		if (of_address_to_resource(child, 0, &res[0])) {
+			dev_warn(vpu->dev, "%pOF: missing reg property\n", child);
+			continue;
+		}
+
+		irq = of_irq_get(child, 0);
+		if (irq < 0) {
+			dev_warn(vpu->dev, "%pOF: missing interrupts property\n", child);
+			continue;
+		}
+		res[1] = DEFINE_RES_IRQ(irq);
+
+		info.fwnode = of_fwnode_handle(child);
+		info.parent = vpu->dev;
+		info.name = WAVE6_VPU_CORE_PLATFORM_DRIVER_NAME;
+		info.id = num_cores;
+		info.dma_mask = DMA_BIT_MASK(32);
+		info.res = res;
+		info.num_res = ARRAY_SIZE(res);
+		info.data = &wave633c_core_data;
+		info.size_data = sizeof(wave633c_core_data);
+
+		pdev = platform_device_register_full(&info);
+		if (IS_ERR(pdev)) {
+			dev_err(vpu->dev, "Failed to register core %d\n",
+				num_cores);
+			continue;
+		}
+
+		vpu->core_pdevs[num_cores] = pdev;
+		num_cores++;
+	}
+
+	return num_cores;
+}
+
+static void wave6_vpu_destroy_cores(struct wave6_vpu_device *vpu)
+{
+	for (int i = 0; i < W6_VPU_MAX_NUM_CORE; i++) {
+		struct platform_device *pdev = vpu->core_pdevs[i];
+
+		if (!pdev)
+			continue;
+
+		platform_device_unregister(pdev);
+		vpu->core_pdevs[i] = NULL;
+	}
+}
+
+static void wave6_vpu_release(struct wave6_vpu_device *vpu)
+{
+	guard(mutex)(&vpu->lock);
+
+	wave6_vpu_destroy_cores(vpu);
+	wave6_vpu_free_work_buffers(vpu);
+	if (vpu->sram_pool && vpu->sram_buf.vaddr) {
+		dma_unmap_resource(vpu->dev,
+				   vpu->sram_buf.dma_addr,
+				   vpu->sram_buf.size,
+				   DMA_BIDIRECTIONAL,
+				   0);
+		gen_pool_free(vpu->sram_pool,
+			      (unsigned long)vpu->sram_buf.vaddr,
+			      vpu->sram_buf.size);
+	}
+	if (vpu->code_buf.dma_addr)
+		dma_unmap_phys(vpu->dev,
+			       vpu->code_buf.dma_addr,
+			       vpu->code_buf.size,
+			       DMA_BIDIRECTIONAL,
+			       DMA_ATTR_SKIP_CPU_SYNC);
+}
+
+static void wave6_vpu_init_firmware(struct wave6_vpu_device *vpu,
+				    const struct firmware *fw)
+{
+	guard(mutex)(&vpu->lock);
+
+	if (!fw || !fw->data) {
+		dev_err(vpu->dev, "No firmware.\n");
+		return;
+	}
+
+	if (fw->size + W6_EXTRA_CODE_BUF_SIZE > wave6_vpu_get_code_buf_size(vpu)) {
+		dev_err(vpu->dev, "firmware size (%zd > %zd) is too big\n",
+			fw->size, vpu->code_buf.size);
+		return;
+	}
+
+	memcpy(vpu->code_buf.vaddr, fw->data, fw->size);
+
+	if (!wave6_vpu_create_cores(vpu))
+		dev_err(vpu->dev, "Failed to create VPU cores\n");
+}
+
+static void wave6_vpu_load_firmware(const struct firmware *fw, void *context)
+{
+	struct wave6_vpu_device *vpu = context;
+
+	wave6_vpu_init_firmware(vpu, fw);
+	release_firmware(fw);
+	complete_all(&vpu->fw_done);
+}
+
+static void wave6_vpu_detach_pm_domains(struct wave6_vpu_device *vpu)
+{
+	if (!vpu->num_pm_domains)
+		return;
+
+	for (int i = 0; i < vpu->num_pm_domains; i++) {
+		struct device *pd_dev = vpu->pd_list->pd_devs[i];
+
+		if (!IS_ERR_OR_NULL(pd_dev) && !pm_runtime_suspended(pd_dev))
+			pm_runtime_force_suspend(pd_dev);
+	}
+
+	dev_pm_domain_detach_list(vpu->pd_list);
+	vpu->pd_list = NULL;
+	vpu->num_pm_domains = 0;
+}
+
+static int wave6_vpu_attach_pm_domains(struct wave6_vpu_device *vpu)
+{
+	int ret;
+
+	vpu->num_pm_domains = of_count_phandle_with_args(vpu->dev->of_node,
+							 "power-domains",
+							 "#power-domain-cells");
+	if (vpu->num_pm_domains < 0) {
+		dev_err(vpu->dev, "No power domains defined for vpu node\n");
+		return vpu->num_pm_domains;
+	}
+
+	if (vpu->num_pm_domains == 1) {
+		/* genpd_dev_pm_attach() attach automatically if count is 1 */
+		vpu->num_pm_domains = 0;
+		return 0;
+	}
+
+	ret = dev_pm_domain_attach_list(vpu->dev, NULL, &vpu->pd_list);
+	if (ret < 0) {
+		dev_err(vpu->dev, "Can't attach pm domains, ret = %d\n", ret);
+		return ret;
+	}
+
+	vpu->num_pm_domains = ret;
+
+	return 0;
+}
+
+static int wave6_vpu_probe(struct platform_device *pdev)
+{
+	struct device_node *np;
+	struct wave6_vpu_device *vpu;
+	const struct wave6_vpu_resource *res;
+	int ret;
+
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret < 0) {
+		dev_err(&pdev->dev, "failed to set DMA mask: %d\n", ret);
+		return ret;
+	}
+
+	res = device_get_match_data(&pdev->dev);
+	if (!res)
+		return -ENODEV;
+
+	vpu = devm_kzalloc(&pdev->dev, sizeof(*vpu), GFP_KERNEL);
+	if (!vpu)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(&pdev->dev, &vpu->lock);
+	if (ret)
+		return ret;
+
+	atomic_set(&vpu->core_count, 0);
+	dev_set_drvdata(&pdev->dev, vpu);
+	vpu->dev = &pdev->dev;
+	vpu->res = res;
+	vpu->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(vpu->reg_base))
+		return PTR_ERR(vpu->reg_base);
+
+	ret = devm_clk_bulk_get_all(&pdev->dev, &vpu->clks);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "failed to get clocks\n");
+
+	vpu->num_clks = ret;
+
+	ret = wave6_vpu_attach_pm_domains(vpu);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to attach pm domains\n");
+
+	np = of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
+	if (np) {
+		struct resource mem;
+
+		ret = of_address_to_resource(np, 0, &mem);
+		of_node_put(np);
+		if (!ret) {
+			vpu->code_buf.phys_addr = mem.start;
+			vpu->code_buf.size = resource_size(&mem);
+			ret = wave6_vpu_init_code_buf(vpu);
+			if (ret)
+				goto error_detach_pm_domains;
+		} else {
+			dev_warn(&pdev->dev, "memory-region is not available.\n");
+		}
+	}
+
+	vpu->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
+	if (vpu->sram_pool) {
+		vpu->sram_buf.size = vpu->res->sram_size;
+		vpu->sram_buf.vaddr = gen_pool_dma_alloc(vpu->sram_pool,
+							 vpu->sram_buf.size,
+							 &vpu->sram_buf.phys_addr);
+		if (!vpu->sram_buf.vaddr) {
+			vpu->sram_buf.size = 0;
+		} else {
+			vpu->sram_buf.dma_addr = dma_map_resource(&pdev->dev,
+								  vpu->sram_buf.phys_addr,
+								  vpu->sram_buf.size,
+								  DMA_BIDIRECTIONAL,
+								  0);
+			if (dma_mapping_error(&pdev->dev, vpu->sram_buf.dma_addr)) {
+				gen_pool_free(vpu->sram_pool,
+					      (unsigned long)vpu->sram_buf.vaddr,
+					      vpu->sram_buf.size);
+				memset(&vpu->sram_buf, 0, sizeof(vpu->sram_buf));
+			}
+		}
+	}
+
+	wave6_vpu_allocate_work_buffers(vpu);
+
+	pm_runtime_enable(&pdev->dev);
+
+	init_completion(&vpu->fw_done);
+	ret = firmware_request_nowait_nowarn(THIS_MODULE,
+					     vpu->res->fw_name,
+					     &pdev->dev,
+					     GFP_KERNEL,
+					     vpu,
+					     wave6_vpu_load_firmware);
+	if (ret) {
+		dev_err(&pdev->dev, "request firmware fail, ret = %d\n", ret);
+		goto error;
+	}
+
+	return 0;
+
+error:
+	wave6_vpu_release(vpu);
+	pm_runtime_disable(&pdev->dev);
+error_detach_pm_domains:
+	wave6_vpu_detach_pm_domains(vpu);
+
+	return ret;
+}
+
+static void wave6_vpu_remove(struct platform_device *pdev)
+{
+	struct wave6_vpu_device *vpu = dev_get_drvdata(&pdev->dev);
+
+	wait_for_completion(&vpu->fw_done);
+	wave6_vpu_release(vpu);
+	pm_runtime_disable(vpu->dev);
+	wave6_vpu_detach_pm_domains(vpu);
+}
+
+static int wave6_vpu_runtime_suspend(struct device *dev)
+{
+	struct wave6_vpu_device *vpu = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(vpu->num_clks, vpu->clks);
+
+	return 0;
+}
+
+static int wave6_vpu_runtime_resume(struct device *dev)
+{
+	struct wave6_vpu_device *vpu = dev_get_drvdata(dev);
+
+	return clk_bulk_prepare_enable(vpu->num_clks, vpu->clks);
+}
+
+static const struct dev_pm_ops wave6_vpu_pm_ops = {
+	RUNTIME_PM_OPS(wave6_vpu_runtime_suspend,
+		       wave6_vpu_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+			    pm_runtime_force_resume)
+};
+
+static const struct of_device_id wave6_vpu_ids[] = {
+	{ .compatible = "nxp,imx95-vpu", .data = &wave633c_data },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, wave6_vpu_ids);
+
+static struct platform_driver wave6_vpu_driver = {
+	.driver = {
+		.name = WAVE6_VPU_PLATFORM_DRIVER_NAME,
+		.of_match_table = wave6_vpu_ids,
+		.pm = pm_ptr(&wave6_vpu_pm_ops),
+		.suppress_bind_attrs = true,
+	},
+	.probe = wave6_vpu_probe,
+	.remove = wave6_vpu_remove,
+};
+
+module_platform_driver(wave6_vpu_driver);
+MODULE_DESCRIPTION("chips&media Wave6 VPU driver");
+MODULE_AUTHOR("CHIPS&MEDIA INC");
+MODULE_FIRMWARE("cnm/wave633c_imx9_codec_fw.bin");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu.h b/drivers/media/platform/chips-media/wave6/wave6-vpu.h
new file mode 100644
index 000000000000..96d67e931e71
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpu.h
@@ -0,0 +1,137 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - wave6 driver
+ *
+ * Copyright (C) 2026 CHIPS&MEDIA INC
+ */
+
+#ifndef __WAVE6_VPU_H__
+#define __WAVE6_VPU_H__
+
+#include <linux/completion.h>
+#include <linux/device.h>
+
+#include "wave6-vpuconfig.h"
+#include "wave6-vdi.h"
+
+#define WAVE6_VPU_PLATFORM_DRIVER_NAME "wave6-vpu"
+#define WAVE6_VPU_CORE_PLATFORM_DRIVER_NAME "wave6-vpu-core"
+
+struct wave6_vpu_device;
+
+/**
+ * enum wave6_vpu_state - VPU states
+ * @WAVE6_VPU_STATE_OFF:	VPU is powered off
+ * @WAVE6_VPU_STATE_PREPARE:	VPU is booting
+ * @WAVE6_VPU_STATE_ON:		VPU is running
+ * @WAVE6_VPU_STATE_SLEEP:	VPU is in a sleep mode
+ */
+enum wave6_vpu_state {
+	WAVE6_VPU_STATE_OFF,
+	WAVE6_VPU_STATE_PREPARE,
+	WAVE6_VPU_STATE_ON,
+	WAVE6_VPU_STATE_SLEEP
+};
+
+/**
+ * struct wave6_vpu_dma_buf - VPU buffer from reserved memory or gen_pool
+ * @size:	Buffer size
+ * @dma_addr:	Mapped address for device access
+ * @vaddr:	Kernel virtual address
+ * @phys_addr:	Physical address of the reserved memory region or gen_pool
+ *
+ * Represents a buffer allocated from pre-reserved device memory regions or
+ * SRAM via gen_pool_dma_alloc(). Used for code and SRAM buffers only.
+ * Managed by the VPU device.
+ */
+struct wave6_vpu_dma_buf {
+	size_t size;
+	dma_addr_t dma_addr;
+	void *vaddr;
+	phys_addr_t phys_addr;
+};
+
+/**
+ * struct wave6_vpu_resource - VPU device compatible data
+ * @fw_name:	Firmware name for the device
+ * @sram_size:	Required SRAM size
+ */
+struct wave6_vpu_resource {
+	const char *fw_name;
+	u32 sram_size;
+};
+
+#define WAVE6_IS_ENC				BIT(0)
+#define WAVE6_IS_DEC				BIT(1)
+
+#define WAVE633_CODEC_TYPE			(WAVE6_IS_ENC | WAVE6_IS_DEC)
+#define WAVE633_COMPATIBLE_FW_VERSION		0x2010000
+
+/**
+ * struct wave6_vpu_core_resource - VPU CORE device compatible data
+ * @codec_types:		Bitmask of supported codec types
+ * @compatible_fw_version:	Firmware version compatible with driver
+ */
+struct wave6_vpu_core_resource {
+	int codec_types;
+	u32 compatible_fw_version;
+};
+
+/**
+ * struct wave6_vpu_device - VPU driver structure
+ * @dev:		Platform device pointer
+ * @reg_base:		Base address of MMIO registers
+ * @clks:		Array of clock handles
+ * @num_clks:		Number of entries in @clks
+ * @state:		Device state
+ * @lock:		Mutex protecting device data, register access
+ * @fw_done:		Completed when the firmware request callback has returned
+ * @res:		Device compatible data
+ * @sram_pool:		Genalloc pool for SRAM allocations
+ * @sram_buf:		Optional SRAM buffer
+ * @code_buf:		Firmware code buffer
+ * @work_buffers:	Array of work buffers
+ * @work_buffers_alloc:	Number of allocated work buffers
+ * @work_buffers_avail:	Number of available work buffers
+ * @core_count:		Number of VPU cores holding a wave6_vpu_get() reference
+ * @num_pm_domains:	Number of attached power domains
+ * @pd_list:		List of attached power domains
+ * @core_pdevs:		VPU core platform devices
+ *
+ * Buffers such as @sram_buf, @code_buf, and @work_buffers are managed
+ * by the VPU device and accessed exclusively by the firmware.
+ */
+struct wave6_vpu_device {
+	struct device *dev;
+	void __iomem *reg_base;
+	struct clk_bulk_data *clks;
+	int num_clks;
+	enum wave6_vpu_state state;
+	struct mutex lock; /* Protects device data, register access */
+
+	struct completion fw_done;
+
+	const struct wave6_vpu_resource *res;
+	struct gen_pool *sram_pool;
+	struct wave6_vpu_dma_buf sram_buf;
+	struct wave6_vpu_dma_buf code_buf;
+
+	/* Allocates per-instance, used for storing instance-specific data. */
+	struct vpu_buf work_buffers[MAX_NUM_INSTANCE];
+	u32 work_buffers_alloc;
+	u32 work_buffers_avail;
+
+	atomic_t core_count;
+
+	int num_pm_domains;
+	struct dev_pm_domain_list *pd_list;
+
+	struct platform_device *core_pdevs[W6_VPU_MAX_NUM_CORE];
+};
+
+int wave6_vpu_get(struct wave6_vpu_device *vpu, void __iomem *core_base);
+void wave6_vpu_put(struct wave6_vpu_device *vpu, void __iomem *core_base);
+void wave6_vpu_require_work_buffer(struct wave6_vpu_device *vpu,
+				   void __iomem *core_base);
+
+#endif /* __WAVE6_VPU_H__ */
diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h b/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
new file mode 100644
index 000000000000..1d4e016c2a58
--- /dev/null
+++ b/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
+/*
+ * Wave6 series multi-standard codec IP - product config definitions
+ *
+ * Copyright (C) 2026 CHIPS&MEDIA INC
+ */
+
+#ifndef __WAVE6_VPUCONFIG_H__
+#define __WAVE6_VPUCONFIG_H__
+
+#define WAVE617_CODE	0x6170
+#define WAVE627_CODE	0x6270
+#define WAVE633_CODE	0x6330
+#define WAVE637_CODE	0x6370
+#define WAVE663_CODE	0x6630
+#define WAVE677_CODE	0x6670
+
+#define W6_VPU_MAX_NUM_CORE		4
+#define MAX_NUM_INSTANCE		32
+
+#define W6_VPU_POLL_DELAY_US		10
+#define W6_VPU_POLL_TIMEOUT		300000
+
+#define W6_MAX_REMAP_PAGE_SIZE		(1024 * 1024)
+#define W6_MAX_CODE_BUF_SIZE		(4 * 1024 * 1024)
+#define W6_CODE_BUF_SIZE		(1 * 1024 * 1024)
+#define W6_EXTRA_CODE_BUF_SIZE		(256 * 1024)
+#define W637DEC_WORKBUF_SIZE_FOR_CQ	(3 * 512 * 1024)
+
+static inline bool wave6_is_product_w_series(u32 code)
+{
+	return code == WAVE617_CODE || code == WAVE627_CODE ||
+	       code == WAVE633_CODE || code == WAVE637_CODE ||
+	       code == WAVE663_CODE || code == WAVE677_CODE;
+}
+
+#endif /* __WAVE6_VPUCONFIG_H__ */
-- 
2.41.0.windows.3

