Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011029.outbound.protection.outlook.com [52.101.65.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240643C7DE1
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 06:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785221753; cv=fail; b=ZBdZHcR00IskLDyDXOQEcr5kgjhvDK0GLy/jI6aQhQCoRPn/4/5HNtZjWLtsYLmxbb4u+usVb2e4DQDu8aJPBpgBmhxQDNh0xoN04qI4oO0ni51+IEGBJ0W+TJj6iYy6PXL/cGgKxgrSwXPGdj3SMseWABZZMm+yVB9nQ15Krcc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785221753; c=relaxed/simple;
	bh=7vCwoD8zRU/F2Yx0YQTwIE4S7+I6QlRgpgis7oo0VUs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=t/Ezq2mjw89zQVYFV9Y3L7c1dW/RiKp1qW4OL1niaaUyY6TNQ//QvWWm8ohJZUFYTCfSd+SXB6u6jmvBl0aByRwtSAhltkzW+I1eRwWhuyIyahNvyUU4ZFTTsiRgu2wluQdyeLqLs3p/7c/RMcjUXaYtFLQ/Obxp40wtmPfqwcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=alQmYly0; arc=fail smtp.client-ip=52.101.65.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="alQmYly0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bLId9663AAXx8LYu16MxFqokg0W+R1qyVN6pfWYU08p9+8aHUC92Is5zpLCUUDEIiQyhFovIV/s6DTJaqqgvuseQH6emJtZyoP4ceUpL2eKWLgRk9j9SNw1Rv0nndyc6hqOoIypr/cDU3cKX43kbB0CFBEsM4ZZTah8PKZQhbGyp3uqLoYIycr5VXDj+LA30+dGdqCPxZgRo9ngVbCV3704HDZT/XXSiVYZvcCyNbObzogIFbPivwotYByOgplVO673RXPGWylCI5kdU3DavA+s/2lIMTIbg50n1Xp6S4yFj9tnpGnP0Appr5GpvzE1B7WGyJs9RkY15lYcCzVqCKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7aF1/ZWz3Hq66anD9pqpoMeSBzfhmRxhu1+4/n8m1KE=;
 b=lBRkPkFZvOeAcsmj29vJu0JKm6EJFm12fbBHeFVzKZ/rhtdR+SBbVCIka2N3F8NK+ITI9zR5Y4nqI+FADQUovMlbXUre+GsQPzufruBCI9FsLy0jTrTDLPosbLZaGi30YHo+IOwWMyu7kcqlOcZfrAnjfPdk62eyVk1uOrqzAKMBhqkXgGxKWfoTZyq3FJRUVSkTYXgBjd4b8oRYT9STcsaYCw+TI5lrOm0aXL0GY4rCwRN4igLFsnDdKxJfPrShxcn2zC+Jc5qEN3RJtskRurhTBco3N+HrAJJEUIYM2rSx3kXfSTlzH9GcxsgA0E7Io5TsK35+bDXiMlxZDJRxPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aF1/ZWz3Hq66anD9pqpoMeSBzfhmRxhu1+4/n8m1KE=;
 b=alQmYly045tRtJsbObXOPN6dqWDARslunK8dNMU8k+tCOvmdskrLu+iy+vdG7Qt0UlY0cJtDzJBMygAmhbD3fDMOOFZJa0YCz2hzl9W5izCOfdBIUVYzM9Vm1B2TX9d3CL+PMDSj1yKMkDf5SZTfE9g1P//qBVheGXfUGz2JFr/wG0NK4InhBasAaazXukp1CEoRXaHMkAl7APjNfyEzgC4lq47QSC1OHO6dRyvcn88uDwx+0aOtMTJwnPvNYw9SgjQ9kqinjmF8udveXLQ50Auir2BZCKT7zY9JHit1hizmUVFdwJ9ZEitoBBT8l8kybdr0V+22JhOm1i/WjYqAHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by PA4PR04MB7807.eurprd04.prod.outlook.com (2603:10a6:102:b8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 06:55:47 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 06:55:47 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Tue, 28 Jul 2026 14:58:59 +0800
Subject: [PATCH v5 4/4] media: nxp: imx8-isi: Add additional 32-bit RGB
 format support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-isi-v5-4-1d22ab91602a@oss.nxp.com>
References: <20260728-isi-v5-0-1d22ab91602a@oss.nxp.com>
In-Reply-To: <20260728-isi-v5-0-1d22ab91602a@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Christian Hemp <c.hemp@phytec.de>, 
 Stefan Riedmueller <s.riedmueller@phytec.de>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Robert Chiras <robert.chiras@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785221945; l=3093;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=7vCwoD8zRU/F2Yx0YQTwIE4S7+I6QlRgpgis7oo0VUs=;
 b=UAxoTSuJmFf2/o5oYbvIvNj9/5oyiZM0DouowGY9SoeaNkYbUL3LZu/EeaDAIIR65kBxbJiKY
 2xtWPelcPezAGg9PGVuAiCanebgdeIWbd7tSY3rCPCrgzBmFMXRJ3IA
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2P153CA0024.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::11)
 To GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|PA4PR04MB7807:EE_
X-MS-Office365-Filtering-Correlation-Id: cd5f51fc-ad8f-401d-793d-08deec7540c3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|23010399003|1800799024|19092799006|366016|376014|18002099003|56012099006|22082099003|10067099003|11063799006|921020;
X-Microsoft-Antispam-Message-Info:
 mL4kfE5En7JD9R4FX97iNKwvs1H6qftxNf/82tu8KpB4UOCrIMa+XYFYrH/Ok3svfCqQWMEwQWC8Zxjh7o/3GsVabZ6iT4tEdhK1KIqz2ANjWaFTQfVAU0DfbYMwgXV18dRPyt+BSi6JI8ipUtoUMQgNGMnawcQiypWicw9xChXLpcPjBg+P2XBqnZvp1zGvVBYw9quX2Jdkg5phAdlt1m5eh5HZMJFwzQjnM6BxRPBRSTwyS2lijp51fCMP7CCETRk9lCTWxQ0TkiLXAUZm/AO1kp6+wydOdYx1BvkC/Do7z04xirEs6qE7Z2W5jPQH9sunFWvTA7+MFOHo4BAGWDlxfkv0AksZWKU1Y/kWAzgJBEspCR4/N1oe/YqfrVRTkhQ23oWFW5P03SslVuEWUNTLSHB6go5FAJLzE1qvPGy6ERWH21f20k8TCE4MF9aSDW7C56YK+8yjdTphvaHgHwGlcEOZpK7bsmSaJEstxKgdnZd1YAnFR+Zv/9F7CWRwYu32rH92I8Xe1NVM2ioQrCO9R6avfsv2be+yxhJSLWU/Y1bqM69P8iBlXXmBD+RCL3zNjRX6KLcJ82WZWPee6Zo28G5rfFTn5HCOJRME5V+bHuHmojvwxTGBsTtjOicRn+QbmcIojrSIv1KSg/byrBXzCMrgpXvvO1F23W9lmpjMDVAfRy0wHYDR45PV/NVSwKqLInwgLrCSMAcrTNyRYA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(1800799024)(19092799006)(366016)(376014)(18002099003)(56012099006)(22082099003)(10067099003)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?U2ovNytCbDRPMmxQNnQ0TmhYUHNUNWNyYSszcmN5NGIwZHJlZ3g3SExjZFh3?=
 =?utf-8?B?d2xCRDg1Z1FmMXdPSEdkQW5VcmdzSFdSbDZ3a0FPMkRkVkZRY0lzRXZMYTJt?=
 =?utf-8?B?ZDNnNHVRODFLTnVhTkUxVWZhUElCMjRFUWVEaTlWUTlST0E4TVc4N2s5VVhn?=
 =?utf-8?B?di80TlBVTmQyeXVxYXhhNmJyQWNqTFpTeDFrTjZoRXhZNzJxSFBzbjVMUnd1?=
 =?utf-8?B?UzMrVllTbG1YMDZCYUVVMmN3cFp6OHltSkF1UVRWbmVIWWJIY3ZuQ0Jrdmxi?=
 =?utf-8?B?VGdoSHQ5MC9BTnpyWFRzQ0NZb2t4VzMrcGpaeWJ6VlliZFEzSlNpZW9OQVVx?=
 =?utf-8?B?QjVnME5reDYyK1g0RndoTElPd3d6UzYxZ3ZNaHF5UVNvTFFWNktZaHR3QVVz?=
 =?utf-8?B?YWJDd1ZnbFAzejlLSWNGRkRkc0FxZ0EwcjhHTkpNTkJwNTRlUStRZEdiSnlr?=
 =?utf-8?B?bHl5QllMOE1IR2FEMFBha0xwb1k4WXpaL1plQnRseFBSUDFwVG5BengvUzY2?=
 =?utf-8?B?eWtONytiZXpWNHd6T3RSdWx0SWFBV2krTXpxeDNRWWI0Tzd6L1k3cURkaGUy?=
 =?utf-8?B?SFc1bDU5QkxGd3ZJM0wxYk5YdkNDWW9yRXgxdGIwRU0veDVkRCtkR2o5ckNi?=
 =?utf-8?B?ckRXYmMrSWJ4RzVDSGQzS1BiYTJaSnBZWUkwTmZXQzl1NlFJVUNDMURVZTRF?=
 =?utf-8?B?bFU5YUFqc0MzMHh0VksvSElTWVpDdzJRVzNjTFJUODFXR0p1YmozWnlEMXRJ?=
 =?utf-8?B?UndqVEE2NXEvN1kraWhKV3cvL3p3NVEzTGZxYzJWSzljZ1RaZlFEdFpkTkVY?=
 =?utf-8?B?bHhxS3FrdHF3ZjNGTDRQbU9nZGIzK1NVMGkyVUoxUkVlWjFvT0FIeXZFSHdL?=
 =?utf-8?B?VGE3K0Q5dXhOc1FjbEU5bGVFRTE1c0JrQUhJaG16QkgvcEd1VFk3VGhMaFd4?=
 =?utf-8?B?Sjh3MXZMN1ZFNG1wM2ZsUVZNUGFlMlU5bS9zUWNTZS9nWnlnTGpSdzdhbUJu?=
 =?utf-8?B?OWhSajlMZkFIUTVPd0VMWEtTc0lxbkVJRWU4VGJoTTV5QldwelpScTU1WExm?=
 =?utf-8?B?VGt4NFFDWmxCUUxXdE5qRk5Fb2o4TlBtY1VHMFFzYUsyZUdOSUlqRWVFczkx?=
 =?utf-8?B?SGtOODROSU5wVVZuLy84ZWVaMjY2THJmbHRweVRDcmNLVzZRTmYxOFk4TEVH?=
 =?utf-8?B?cWM4NFlZazVIV1dUNllkSjJCdld6b2RLcmxRZjg4TUcraUFKMERJbmtLblZ3?=
 =?utf-8?B?eGNuU2gya3RHUzFLOVU5VFFSbDFybjZoTk13QXFQRk5zVTgwbUwzOVJuRDdO?=
 =?utf-8?B?NzhQZWJvMlB5RDNMUCtPWmlVZmh4WjFiQWdTSDdOZW92Q2l1ZGk4cG92SWJM?=
 =?utf-8?B?Mk1zK3pERkp6WFNMclp6S0FDc3ZrT2l5Skx3QjRaSUtnMlhrVDBaVHFBa3Rk?=
 =?utf-8?B?L00wdXJibWgzUVNScW1aK0VXRXcyQWgxTUgzQ3Y0MEUwcHk1TWg5bHh6TjFJ?=
 =?utf-8?B?V29laTRPUDIrWEJValBsUGRxSEYxZ0VJU2M3d21pRHVFOVpaWEw3VktRZUF6?=
 =?utf-8?B?RjVvZmNTeCtqUGl6U3BaRXpUWWlRL2JXdk4xLzh1VGt0QjNxeWs5S2pQRngr?=
 =?utf-8?B?SFRJOUp3c0dUai8vQURESHUxRGVRR0ZNbk5nTHNZUnF3KzhEbFlnSkZaOGs3?=
 =?utf-8?B?UXNsbXhySWo3aG85dUlxNjVHQjQrcmg1ZFVrdnlIRjVFS2dGOEx4Smg1dkxl?=
 =?utf-8?B?R01Dd0NVR2dvVDhITkVGOVE0TitkRWYxUHdQbXdVOUhieFBmdjJid1pUOGpW?=
 =?utf-8?B?V1Faa2t0bFYyaWRIMUxnVnhSS3Q2NWc2cGxQK25LQ0ViaWtkTG03SFU3czB6?=
 =?utf-8?B?cHBiVEI3a3VrMkxTUDMxTXdNNTN3VDU4RVVnMVUxZTZ1b0l0N1I1Y1krV1NU?=
 =?utf-8?B?ZTAzeHpheW9BM3hUZlBCOGdUQU1CR1RDZkh0WlJMcnRXMWlZYVVWdC9xTi84?=
 =?utf-8?B?RWszenBkajFpZzEyaml5U0txYjI5OFNLSDRQMzVxMTNLSTllbDFVTDJUL2Jx?=
 =?utf-8?B?MUY1cWcwWTFqWUdHQzU2M0pOaVVQdStaUmxVYmpRNGN4d3I1elNKUnVrdTR3?=
 =?utf-8?B?eEc2V3dXa01yZ3Y0dW5NSFE1MU52THBCNjJ1NnBhMDBmbDhtNUoyUEprY0hI?=
 =?utf-8?B?Z3RCdHJZYlVobG1tMk1oUXZpQ2VERHVvQmFGQ3hKZ0p6K3F6djRWYyt5Tjhj?=
 =?utf-8?B?WGVhZ253UjNrczZQb215L29SUTJIdEdjemRRN0VJMFVCa0lUR21ZN2xPWUt2?=
 =?utf-8?B?U09ya3MyNmxraUx4Sk1uelF3NFRobnpQYTlUczNCYyt5M3BSUVdvQkNtZEd3?=
 =?utf-8?Q?1rqjw+LmDMJYVdsudDF/gFISStB/NW6ESWw9d?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd5f51fc-ad8f-401d-793d-08deec7540c3
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 06:55:47.6819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tuSjUIwNGUF7U5xAMc+wOhbRi3HVG5dVLeThS93gd8Ro/DVK1OwSUCNIeEx7w+56XHiJ6gL8bk8Wuu2KRBkIbAeT1zy7bTphQavz82B7jvIBR8A4jhp3kKnaFqwB0QSM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7807

Add support for additional 32-bit RGB pixel formats (BGRA32, RGBA32,
BGRX32, RGBX32, ARGB2101010).

Formats with alpha channel (BGRA32, RGBA32) only support capture as
ISI ignores alpha bits when reading from memory.

Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v3:
- Drop M2M_OUT for ABGR32/BGRA32/RGBA32 as ISI ignores alpha bits (Laurent)
- Remove Android requirements from commit message as alpha formats
  cannot be used as M2M input (Laurent)
- Add Tested-by tag from Laurent Pinchart

Changes in v2:
- Add Reviewed-by tag from Frank Li
---
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index a6e044056762..f45c2aae59ce 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -166,6 +166,57 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.color_planes	= 1,
 		.depth		= { 32 },
 		.encoding	= MXC_ISI_ENC_RGB,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
+		.fourcc		= V4L2_PIX_FMT_BGRA32,
+		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RGBA8888,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 32 },
+		.encoding	= MXC_ISI_ENC_RGB,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
+		.fourcc		= V4L2_PIX_FMT_RGBA32,
+		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_ABGR8888,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 32 },
+		.encoding	= MXC_ISI_ENC_RGB,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
+		.fourcc		= V4L2_PIX_FMT_BGRX32,
+		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
+				| MXC_ISI_VIDEO_M2M_CAP,
+		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_RGBX8,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RGBX888,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 32 },
+		.encoding	= MXC_ISI_ENC_RGB,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
+		.fourcc		= V4L2_PIX_FMT_RGBX32,
+		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
+				| MXC_ISI_VIDEO_M2M_CAP,
+		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_XBGR8,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_XBGR888,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 32 },
+		.encoding	= MXC_ISI_ENC_RGB,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
+		.fourcc		= V4L2_PIX_FMT_ARGB2101010,
+		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
+				| MXC_ISI_VIDEO_M2M_CAP,
+		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_A2RGB10,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_A2RGB10,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 32 },
+		.encoding	= MXC_ISI_ENC_RGB,
 	},
 	/*
 	 * RAW formats

-- 
2.34.1

