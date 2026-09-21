Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011026.outbound.protection.outlook.com [52.101.70.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7607E331ED7
	for <imx@lists.linux.dev>; Mon, 21 Sep 2026 16:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790006429; cv=fail; b=XsyTEXmH/lBc5/qZ/O/TFkmr+/wTw7zy+8XuYkUttkCV8yr8idTW5xAD5gBipmTPXDIKtek7AyIWwEwuAXd1xlU9MANVAF95stReWpwq8G+hn9EdsmvL5Iww+bjY2xkBbxx0xVRZNrQf30DyjFR6pGLtGZPLEwHmUp/q6SNqAKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790006429; c=relaxed/simple;
	bh=oYjmNv3T0bZgXLOE1AGjI60vAvfxUWUNQVm3Y0Hn6tQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Lm/8wr3cYdEGT+LiXo8eiZmGDNeEKF+0yMsofxsLulCI1kmBgLVv+TNH49qksG1ds++olmLUy7kR9THYQC6xnqJXDoGT2uPFHatdjwSOKeRYiB/XwqYlp8b93eQ1KV1qzKgvGcdDLRCv9me5uBvONDj07CFLRt5M301hHXGKEi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=X7+LDYdt; arc=fail smtp.client-ip=52.101.70.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="X7+LDYdt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dG9DXPe3BVGrA+EVBVvPkytrfcLdlQn81MqLX/nzwVKuWf0yVnhOK+aqXIRzNEEzGUY27wHOoL1a+rw9ki5sWbNZ/uD5ERy0kmYW1vWqs3G8ai7FRdEaG3uOFr5qqcz7AmlZj/N7Vy3GgFVsKCxjoNdVRbtKEWdqegQ0w7CTzhRaDhhJtzhnJvq4tKZwH4o2ECQ0k4WUwyLyiuqCSu6hu3YLNt1e06zk9xITQUrSCZcHsgm+MMMQVl4SV4zJg65H376gEUY80k5/5f0YaR+4ZapPU7qR+nWnB8SVFO0jwzoY6506Wx6nNOTy2cF5epk2Cwa9yswJIrEZf2frQkyUGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTTTQ2aEG8BsqiqOc/RBkfVQL9UmenrVK0u4N4oTs4I=;
 b=CH+TgyrLX2k4rPFJLqMyZwIXoXKU0CV6qjWUnUxSMpieKfsPE0TJsYUKtsZeVzjY4aBbDSJJgHrG0GAhc0rBTS5ZmV9Kju5c1VeU/bnlAdGE0fMiripIyNMs92uu2IrotWl0kcbHbABwWqCCnGBJPpRIcGiPSQuXdwr5l2I64PghqWCvkGZzuBct8YB/7nThH/fP2N+jMbtCtbFkWTt4LpoT1XwrhIk8jGU5JFjK32EBXlAFM8MPE/ArYySsSUhaMGPz++ODoxu3vR8igM2pfb+Wn2T+KnwzKvKru/Vl1HZvteTVEq0hrrAiXxDJPgoIGEFp3dhs1ooWlBjR7UAhIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTTTQ2aEG8BsqiqOc/RBkfVQL9UmenrVK0u4N4oTs4I=;
 b=X7+LDYdtLWYdrbtZa/kpGvTI/UxSKDjFd/YhmFV6w5dtTEC8vMiHEMSt86gakQs/wOowZx0kS66CE9s3Dle8UCcUGPxKCQWSeh8RA4ROd0k4qiPYLSlaziIcOlN2M1NOeVZYb4aVNaUe4EysfKU+i3qPEAbNlCuAWTld+CayDTuc9yAmFyLUP4cajD7dh9oI/v7qquDQejywIA28LRsVdoFo9mvZsQfA0NjewDhcSrwG8ln4Vu/NH/oUy3ovL9qTBPt+Mq7ZzxOsLaQ8T+Swk4eZdM/ycUTFUGCkOn/G1hTyd13eNvwtYZUiZ9jwBRp54ODEqeN6zgPXBOsrHrwaFw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB12052.eurprd04.prod.outlook.com (2603:10a6:20b:745::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 16:00:24 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 16:00:24 +0000
From: Frank.Li@oss.nxp.com
To: soc@kernel.org
Cc: Frank.Li@nxp.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	stefano.r@variscite.com,
	vjardin@free.fr
Subject: [GIT PULL] iMX fixes for 7.2
Date: Mon, 21 Sep 2026 12:00:14 -0400
Message-ID: <20260921160016.1139490-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR22CA0068.namprd22.prod.outlook.com
 (2603:10b6:930:80::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB12052:EE_
X-MS-Office365-Filtering-Correlation-Id: d2c8cdd5-326d-4286-dfb9-08df17f97234
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|376014|366016|11063799006|56012099006|10067099003|18002099003|41080700001;
X-Microsoft-Antispam-Message-Info:
	MzMobg7Jl9lXbooAaE697qSSwjoqNe7L9HpW//ot0s+Drnm2JDtHKFwJzx3Li9EHDOo/+ESRgDyDhl0fyo0W8JOIP8yW56D4weMBA/Zll+agwlpeuh7WY0EFPfas5SU9lWme/6qMuKkYh4b9E453LmajxVJ+QfiTkMnPYyKT8JEB+flkTiC+UIT19jw62tv+grIDQcFIv1IYUeBP/VE10gF0ddgu/yl/iUi7N9P30iLCZped/JMy89fxt06RZE6K9baB2YjpG/++laKXJoGdtjj5NAMTPwWdhOGVFXEQtsFL+0Mvz4dzauKqNz+hfzYZYiIrEw3hKLtnNuNqeqC9rrziCGJi+aMCV8sZ2fIXBKLuI7s7XrFEMQUJbsDXNL5yZNDEvtbqSi9Q+XvKZHaiafoR6beHEw/odG4Bqo8VbKLi44S8UkA26XYdwziBx7KD061fJAaFkgoFCrM3U1tCW4iNtSMDjYu0sG7bbZXuq4nXYaxI0Ewxa/zZf1CMbMz/tsckINABxdIZoJceHRN+mHfnCAGaS1Oe6/BosuluE1pt4+2qmIxYJ41en+mVN4ahFONLfgd40iLpx3e2e0tKYlkKwkEPEkUCUTYW5iKU/v0r1NEr7jYvpHpQpE801kpm7bHkjSvWfKgGfyb4wfAbb5HAsEfqk6nBbM5GR5Hw0ZU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(376014)(366016)(11063799006)(56012099006)(10067099003)(18002099003)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hoEvy5kPHWJ6G1i9LGxllTW8gncN11xEhZC4KoyHfihPNF0dafibBs94is2m?=
 =?us-ascii?Q?XUtOHB+iSHSUwCLoaPFX5ckBcAi8Wn2xo6k/gfjff4IRKQzQHv+kZwYsCQGu?=
 =?us-ascii?Q?bEtphMvn9POuGbgvgzGfTrw5iDW+Vyub6bLHbinoMeOGsk9h3VKeQ7G8uHG2?=
 =?us-ascii?Q?1ZMLPrZdRoAO0vdzJBiraZMRE8kDTCFuMtAFz+45rZeZAOWzKWgRC8JkICDS?=
 =?us-ascii?Q?EaqB96xahqPrqWQ77HZJhNGaUQDvntm2R2P0J6T/1mmS+OpcyKvMdwt32jBp?=
 =?us-ascii?Q?JFMFzJtP8ddGn4PD8JtiPZAqc3sjBOFrc0psUBLuIAqf2NdJ2YjbbAQ0FyHD?=
 =?us-ascii?Q?9kJQXUtHfy71PKRqbLNSIemu705Hmjo6pjyu/Gwz02NSggAbob0MbcBYx4W/?=
 =?us-ascii?Q?q/QZtYQdFiu/Km6rLVLHHFUS7okPzoaNsCvJhQvyOPtl1Rg+qw2vQo9evy+k?=
 =?us-ascii?Q?NCpoY0OQAAr8YPXyTGDWPgLoV4FcDDX8CUejHvrTxLvuG0ofefpBxAdnSxnZ?=
 =?us-ascii?Q?YdXoN8al55HmUq942T+ChlDwp7jA7UATfVUYe4ziFODwP4y0wDZK9ML4KpSW?=
 =?us-ascii?Q?IjE6AgxPCorO287CbDMVPr7EGsCBKfgIaw7S4gSYodRz+Qr11yZC12Ngnery?=
 =?us-ascii?Q?4J8qDU3NczqLzWaETBF945iyGu6TgDohj/+ls2ogq4T1e30bgonv5BYVotCc?=
 =?us-ascii?Q?MKJTMW2HWmnuCOIF3K5Y6fEG/1Ha7mKjsG2240X1TiAQhQN0RsdPUS4AXZd4?=
 =?us-ascii?Q?Yr+UP9/AyR6w1C43NqEPvR/PPs55k731U2VrM1QS5gSjdgCsus0rzW8xfDS/?=
 =?us-ascii?Q?lDzeCgRRF8XsoOtydKyp2e7zfCeH+ACc5H+m2HQHpfH2Bz+WkHBhWvNrA9Ry?=
 =?us-ascii?Q?zARvMeGRFm2+ea3M0PLgBqthFQuHSXTkQyLqnEecc9ZXzmCsSvZbjWrgK65L?=
 =?us-ascii?Q?OUsuvaVyw1k2tDivPLYzGKVdhqf4rYz2Orp8ZBbtVcol8yowLCaqPzOdzwid?=
 =?us-ascii?Q?3xBkE8iGoQm6vNnD0BNLNLvywyrJ7dJ2IGw0ufkG02XDDK4przMPusOR4kV9?=
 =?us-ascii?Q?55IAUJU3POEJrxdoEUZm60eESY8iMCf94RFo2cMsaFXbZj/Y0+y9ugkuZfh1?=
 =?us-ascii?Q?gJDn4PV+lbCHgaIzKevOO9TkNBqMjoKVZ7fntT7bykvyORpv9zhggN3eWHNI?=
 =?us-ascii?Q?ZiD4HQVWa5p/2nl7SAPLZEPPc+m51TdBjfw4wVlo/fQs9m1UzrslAKZq/dNc?=
 =?us-ascii?Q?yZjN5YHZVCwUPEEhXG2YxQw692W1nKLEErHhoT7crTuP0yB7zLE1ksoNmpEw?=
 =?us-ascii?Q?GbpJiS9nLqZ3Ha1blQgdIhIeI4+InsedO9L3dvT+EbZA1tc9fsAZBCOLHm8Q?=
 =?us-ascii?Q?ggGlLLm3LGCU8cifb1IS+SJuRw6KJtEnvOBOwLaIMDlfo5VD+zPS+gvX8FW5?=
 =?us-ascii?Q?QWzvxBeJ468YuZ7VbxtM3avn0YPg8z6C8S/J/Sq2QDblA0Gx68zWbs6RUO2X?=
 =?us-ascii?Q?glaJKc0LZ4QDoW7hEDV0lqBiFI+wB5CC+Yvbb5QDCaY7xMWArRUEYFvn0SRQ?=
 =?us-ascii?Q?oAcBSAC0Ost3RCx4k2LhJi/VDraPuW1ch9JpihxfOByVz4LQSutlAFdqgypv?=
 =?us-ascii?Q?QdBDR+8QC0W7djTFsrbaZ/Co7/iykRfwHnI/fx0ZwwSKw42cYwo/2q+bINO+?=
 =?us-ascii?Q?tn6t7LsCeapq3vhLpyXb2vpBA9H9c/ABWrZ59M1qZ50BvXYarZYroSp1CNGK?=
 =?us-ascii?Q?4THMmfmoAplVTzUm0fxdYpHHv0WQQWA9mptKv60cRevfDQJKdML7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2c8cdd5-326d-4286-dfb9-08df17f97234
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 16:00:24.3357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ww07Uk66TafhHruVR4aGyTdRLPnJmf8uqA6sHZq1ZLMlot5vd0deY7JRWa91v0NdFquNFATP732gA4+RH0dTBDAN7T+csmgAQ/SEk145ZC2zUE2iciXZrrC5xBb95/Io
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12052

From: Frank.Li@nxp.com

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-fixes-7.2

for you to fetch changes up to 7ba5290db6bf365e46fb70bf13dc2a47048165ea:

  arm64: dts: imx8mp-var-dart-sonata: Fix Sonata SD I/O supply (2026-09-11 14:50:09 -0400)

----------------------------------------------------------------
iMX fixes for 7.2

- Fix incorrect pinmux values for LX2160A.
- Fix Sonata SD I/O supply to avoid filesystem I/O errors because the kernel
  was disabling LDO5 during late init.

----------------------------------------------------------------
Stefano Radaelli (1):
      arm64: dts: imx8mp-var-dart-sonata: Fix Sonata SD I/O supply

Vincent Jardin (3):
      arm64: dts: lx2160a: fix incorrect pinmux
      arm64: dts: lx2160a: fix IIC1 pinmux submask rejected by pinctrl-single
      arm64: dts: lx2160a: fix the iic5 spi3 pinmux offset and value

 arch/arm64/boot/dts/freescale/fsl-lx216x.dtsi         | 19 +++++++++++++------
 .../boot/dts/freescale/imx8mp-var-dart-sonata.dts     |  1 +
 2 files changed, 14 insertions(+), 6 deletions(-)
