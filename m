Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013050.outbound.protection.outlook.com [40.107.159.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D740E430CDD
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 14:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785508054; cv=fail; b=eRJ2CfRVb10k4peZke/jYm8Lz4D5XT9muWd7QwyAT9LbsOBKhq2MUE/sfYRww+FBhLvRdEbvDlQiw56VIMRP9Cmz2QLUuKLXCKLxFwDMFe5HDP+6Bj7F+PJ4BOcyH+4JQS3glsI1uWzmuoXUskMCi7xhkhLPRhpsxXPnUEyNVqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785508054; c=relaxed/simple;
	bh=Vapo2J0GasTBiJ6rdisy4SuZYCbl0LlPrqgxqkDLK7k=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=L5wUiR0BiHwcwUqvj4Gkz2QeoRXXTvw/QgIcPR4oyxPtMGVvuZgRs5NN8VHEFp3+1HRN/dnlk0g77i3EfB9BPhY7LZjuL6eeQTR/lNV7rPalbmq94Vc2CiYv+YDOUARTzc4Cm5Oln3Hwy2mLcm/iKgA8EorSt0/ZxOOeo1+ZwPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ttzNHw2k; arc=fail smtp.client-ip=40.107.159.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ttzNHw2k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kN6zRN5JDI/5Q57B/O7Upjwg5RwCKKY+L85wZRnKxhX8F2v0aNAepaI7Dc/rKX1NlFtQGzKklkfFgSPjdDPjZi2TYpjzUBZ5OMhJbpnb01PPYNwrIxfGZeGJplRZ82Wd/wfryvRV9rxeaEMzQA3atE2QvvemsOz3TaP+VqkEwz7kzHm0nI98uo2w28aOB55tjJKiq0SbRuK1oKMf2ZU/SPtQ8ci39J142WaL2+vQ/4tSmqC5WCRKat98zgIQQnziAxKqLT7UZ3J7nge2/GaOzq9CpDXG0SLEcNQHcDERm8MmKbGjD5BSl6BctVFJeEaNLWZ+pcsjUTzH2sGDvG/RLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a68r+cGyhBwV/ONp5D52AdaPPxYyM39wh8sYrzLz13g=;
 b=wHAnNsCfRq0+8AQwC0DNDTWmuRQ8oCkk+EjKy6/Bh6Dg9nGp8vc1O1/ORysqKuOsENz/GlJmb5ZAl/CFfk7lHEoqaYTpMA64lLvODWwBGjrylEasn2e9vXUPgToOpU8ITVad4OKNaTNqZPK5QV54SzqoeCaAUWwx/Fd2QcZB7IxlOycaA+Jg4xxiRMmhfLPQabpz9HscawI70QUei5ChQRHo9NRCdzzmLpPkJLltCx1c9OzoDvGzJ2jUARmwWml9w64iCIshsHZaN2Q82k95mejKtLk6E0vQBPX9NFQS0q8denA18va7Dt+xcYOfyl2nh5XH+ouR4eFOzzLImdKd4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a68r+cGyhBwV/ONp5D52AdaPPxYyM39wh8sYrzLz13g=;
 b=ttzNHw2kfb+uvOrt27uap+B1ngUitZikBwydg+lRpqQA289HxHcSI+9LSZ3DR30dySQD4sKFDWUBPKKTaW+Sg+YtYwxHKSPm8jGTz/pCNa1uhRCo909qrdIUloP5p5DTybxtzxLrDCZUzXtpquKOZvFMroABQokYm9UTAR5DwoiWwxSzXILGDanMkHPnXsiU/vLSXCrFaWPfMgkUtS230knWAxP1LS4DE3J5D1rZAzfJ1AzpMJm/oVd3wWUGF6wnEDtqRYTmmQTnQOb/tuqxEdNjE0iRi2VoXNz9+kDDYZGghziBYg1Nkx9SZCEf0niucuSxXZL6m2xiJ/lWvCaG9g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7346.eurprd04.prod.outlook.com (2603:10a6:20b:1d9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Fri, 31 Jul
 2026 14:27:29 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 14:27:29 +0000
From: Frank.Li@oss.nxp.com
To: Hans Verkuil <hans@jjverkuil.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Frank.Li@oss.nxp.com,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev
Subject: [GIT PULL FOR v7.3] i.MX NXP CSI driver for changes
Date: Fri, 31 Jul 2026 10:27:20 -0400
Message-ID: <20260731142723.2484982-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SN7P222CA0015.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7346:EE_
X-MS-Office365-Filtering-Correlation-Id: 82b992f7-83b2-4e5e-1ba5-08deef0fd9e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|23010399003|376014|18002099003|3023799007|11063799006|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	2xXNYWryBS55UQX0pV6S91g/a/RI1Wg2qsN5zCWD3rKQ1xWmG9/Anl+CMQbPuh8vjcMkA3IzsgCjL8HEr00VYwL1uZc1muNqoAr4mBKGxgj0YuHjfeoKroI4O+Vy2g15Xd2xZgKV3UkNiseI7WUpVNOi9gQP2lxZo+DoR4TeOhigjkpcdeT6CG41vT8M8asQiNqDhbL5D0nh6huIGDuqdxQCH6zZVgrNcEdPA2oXSDmx+btWWMMXPxvP7Bq/OIgWtmV5pn/UMrQuL401MhOQjvZqGIQPBXSvHiOYFze3iu1LOzqEZ6kAsdCCir016nlrRPdTmBdi45bcJySLcCLSKn3hxNKldV4SCe4OnEXA2y2w6eQ7UX2efOV66VNL1fx4WbBBaeakr4g3Wl5+he4weG2ga4ZFP07+5Pa4URC84t9330x/a0JbyBxQ7GCwsQX7PjG6MXtHhHhZ0TkUSEBeqHSoowNXRXmiHXw5jQBsaIY2+nslh3UqmbgVc5WXwoiSBh7pxaT4L5qQ5zqS3qBlWX2LcKJi5Zb15R5LyQRiKj1GdWpxQqSYKs1zeCR6Tv4ihrPrNYoPPnqBVj8gxxZPdlNNPHi2FAx8KLA3y9NSfytkQ0GvLNyMWPj67fjvcJpJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(23010399003)(376014)(18002099003)(3023799007)(11063799006)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?OPMEFHTti3lcw6AkP8qboP/jueEghv5ga/6LbiMg2gXxEBZ984N7rWW2ZXL5?=
 =?us-ascii?Q?SbbmSzJkRNCiVgnFGX53w+6bgHg6iBojCTl5/27gVAdZiCoFXrGpkCL2jzYe?=
 =?us-ascii?Q?LfM9BLl3MqixzWwZSN7FTRRX7WXG2JY11LS1hi/PfYJ3GGDz8XH/gI4bNSoP?=
 =?us-ascii?Q?w8bwdZme6NStMc3Q6/sc1TWBwtm3UWPdHqQtfvrpoH9T2x7iEaP0Z7c5+5dM?=
 =?us-ascii?Q?tuBDVA9sBvUF1cz2IcblXAmzSducBoSqaAnwZKw/P3ox2osYcHUs+SA/apvO?=
 =?us-ascii?Q?ZZx4wVz7ZhUFg1wcFCTUw2cQlhQedqLu+3XXZ5dPEScwzer1xOVd9pSpOEIF?=
 =?us-ascii?Q?U08P/Ivq1K3pywjVff+zUUV5ou/KDKCID1fxvTN9NTb818CmtGze8dt8b3WL?=
 =?us-ascii?Q?7+z+9AF85aB2bfh2a+QMRAoXpMjWZjo4vWBy5EnQhZt8cLZCRaT3RpzP3hVb?=
 =?us-ascii?Q?fyjBMhQ1HwPKST8XJvoHSv9AlvkszQ4DG/sG1sVMWyom+YHO4GcvVKKVDlhG?=
 =?us-ascii?Q?KWAVHNVyQbxKqLIRGIkn1pinR2t0P4iiyLO4IohbtZTUsb0WjvsflzAgG8ui?=
 =?us-ascii?Q?zEy9M/LrLVrUi0td6JjOjAWoFIUwQreBXy5STQzmaiRfWX0dc7vOMpX7bDOA?=
 =?us-ascii?Q?UNVs29lO6NEYbOqpe/+IXqaTXrVK2S28AKOIzNUodJIuW4gI3n36R+PVS15e?=
 =?us-ascii?Q?1lYzrW5ySCJOTihWyd/gOcza/UZ1qLftSJDHRKUfAYz63cXT4ZVNqWQh5oZC?=
 =?us-ascii?Q?+xb8bFpN3xns9MIfDKWGhLMZnvyyVQST5AyiiqbxdGaI6kZgWE/xQbAlx0ss?=
 =?us-ascii?Q?+LhOsgDGMjsKvrpRSoh42gYOzFTEnjkNeW58GE+lt/ghtWEtV4gT8Zg5U35i?=
 =?us-ascii?Q?SHaCxy3Pge51TeCuKzNiiHjiSIg5QxUzJaJV3QeiP1wXnJpFfrGWN076vnwo?=
 =?us-ascii?Q?lsyQqqC21qsCC3zXgsTQRoLbgU+Q+LUgW89NfuE9mRv7xguutq5ESKYh0998?=
 =?us-ascii?Q?CvWwSZbs8ODpRsBdwi9dIr6Lu8qT8OYIyEvShzHNjHRjyO3bVRKelILGhlEa?=
 =?us-ascii?Q?gZ+T3hYb8ep1DAc+Gda6Hg7QsApcbnX8q9YGn6lUao4iuEYlJNswGAtcGBPB?=
 =?us-ascii?Q?iNNMEUFJNzzjAgkVdPZv9c3IUykIhuEZ//hetbyuU/SFpWTuR3ZDm467yN/v?=
 =?us-ascii?Q?cJR/9T/BY0hXFot1tMIX/2SGdm0PKW9s7fk/+oJFzoSEutfMXv4reUyBeDrm?=
 =?us-ascii?Q?wvNqK563Vj+6Gpxs8nghWsvCsWZDTwIryDr7+rtB2r+YKjIhU1aJ3MiIIzYA?=
 =?us-ascii?Q?C75sHGoU3TLal59BOQl6LOoJ8qejk2TYLoXIiC2Wzr5lbGY7jkHml6MZ1H3o?=
 =?us-ascii?Q?0YZ9BKlN6/c/W3P0fchlOKw/zbrWOlVBAqdphhfE8teqCoPYDljtYl+THAor?=
 =?us-ascii?Q?d/+knOEifxyr825Ta/UL+lD5Ev2hNpfcpDn1pnWWxHTru0ysjDQiIki2Ub0T?=
 =?us-ascii?Q?ylzqI3RYVd6c8qZKqaXJZNFAt6pNIv3xi6E2tIEKrr8/XoV0fVqcYItzFl8J?=
 =?us-ascii?Q?VdvK72Sv9Ayxh+t/1mMTphF6UN6bNlVcD1IUsxVEy3sqQ0n7BdIGzR58VVFd?=
 =?us-ascii?Q?GJklR9uHhUwMJ/vLfYBGaFmlNGEz7mi3K2y+s5ae+JD6tTSF5rdPmlMy5VKk?=
 =?us-ascii?Q?LP3BuO4mQfMemuylAA2euLILbTw/I/Mmz0h9kCv5A2V0EySiFcNwGMUgb/Qj?=
 =?us-ascii?Q?oRQGMU+k4y5u/RYHvkAdMxnMLyv14HjiURYAkv5b3f4fGjo7j1tI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82b992f7-83b2-4e5e-1ba5-08deef0fd9e0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 14:27:29.4194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KhYyCGjhZMyOXeHsEsOVUdyf0S4mP1h6MBYHMumw2E5Fz/Hi+Q/8B4BIa6QX7sU/POYpAgHKIGzIz0sgwap1x9Xn0vPQ+cbcDXE/T2zMwoaVP+9hlN520utfFOtN201n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7346

The following changes since commit 95f76f51937fdfb0fc1e14cae606b1ef574a56f3:

  media: em28xx: defer audio-only extension registration (2026-07-28 16:48:20 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/linux-media/users/frankl.git tags/media-nxp-20260729

for you to fetch changes up to 5a3dcb7633c873602a8f665524dc21bdb19d980f:

  media: nxp: Add i.MX95 CSI pixel formatter v4l2 driver (2026-07-29 11:11:27 -0400)

----------------------------------------------------------------
NXP i.MX media updates for v7.3

- Add i.MX95 CSI pixel formatter V4L2 driver and DT bindings
- imx-jpeg: fix hang on close and use-after-free on timeout worker (stable)
- MAINTAINERS: add Bryan O'Donoghue as reviewer for imx8mq-mipi-csi2 and rockchip dw-mipi-csi2rx
- dt-bindings: fix endpoint label typo in imx8mq-mipi-csi2 example

----------------------------------------------------------------
Bryan O'Donoghue (2):
      MAINTAINERS: media: imx: imx8mq-mipi-csi2: Add myself as reviewer to imx8mq-mipi-csi2
      MAINTAINERS: media: rockchip: dw-mipi-csi2rx: Add myself to the reviewers list

Fan Wu (2):
      media: imx-jpeg: cancel timeout worker when streaming stops
      media: imx-jpeg: finish the job on device_run() error paths

Guoniu Zhou (3):
      media: dt-bindings: Add CSI Pixel Formatter DT bindings
      dt-bindings: clock: imx95-blk-ctl: Define formatter child node schema
      media: nxp: Add i.MX95 CSI pixel formatter v4l2 driver

Robby Cai (1):
      media: dt-bindings: nxp,imx8mq-mipi-csi2: Fix example endpoint label typo

 .../bindings/clock/nxp,imx95-blk-ctl.yaml          |  71 ++
 .../bindings/media/fsl,imx95-csi-formatter.yaml    |  88 +++
 .../bindings/media/nxp,imx8mq-mipi-csi2.yaml       |   4 +-
 MAINTAINERS                                        |  10 +
 drivers/media/platform/nxp/Kconfig                 |  16 +
 drivers/media/platform/nxp/Makefile                |   1 +
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c     |  23 +-
 drivers/media/platform/nxp/imx95-csi-formatter.c   | 758 +++++++++++++++++++++
 8 files changed, 963 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
 create mode 100644 drivers/media/platform/nxp/imx95-csi-formatter.c
