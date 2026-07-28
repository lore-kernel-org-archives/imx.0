Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011038.outbound.protection.outlook.com [52.101.70.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96CCD3BFAFB
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 06:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785221747; cv=fail; b=M49UZIBj99ZqYzCN9baoVsMHwa43VFkmhRWxTn7PBwYVoQRIYoMDQmjuEdgQggmnSgIU90NO5MPVd2QfQGmc3P6Zs9lFFM+FzvrWc6/LlcE8/wYnkGyDnFzcCsm/SCp7uK7h/rECOZKSrs0QrYhNt6tx/tZR2bZ2P7WxRXCNLMg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785221747; c=relaxed/simple;
	bh=FBqKnSHGUfWOqMSzkV840/+1q3AtfMVyJLpE/l2zjEg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=AKj/C7YQqzE6a3wdvvX6TH7eKnrAk0b0QAiGUbvQi39VcYX2bHhN16ET/t7ZtpBfzp3xCtgm8/gZLW/hzZex0jShhpHjZKsQuOqzcGLRE6Yc3Pv+P3JnGzgrdjYeWkdXdWKIfQHVCDr7Wu9xaIeyHGK2T1PaEyeobFYrMiI6WUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QjWHRKuD; arc=fail smtp.client-ip=52.101.70.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QjWHRKuD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gIorb6aTNk1/eWXDuZobpiO01m9ctQ3UkHRjJZQ+X9ItcB+q2HWDglDMnIinagJ2tW0U2H5ErDccb0u0aY0hsWKBb+r651BdyLQ6isY2ChAhpdtPtQiG/OT5y5bmTEHT1WQXPWvrf61s8o/ZYMm/CK9mn/cKSkiefCTDg6ZA4dVXjYaPeTZ6v6PXI/pBCnuClMc2itSpA7VV5Uxr7i1Lamcess0e6WwlXB9IiJet+ownC7OOndoxfcompSVjkJWATnC4R5Vm7BY0UJFRiC0a8HAjtkFdAe/9Wz5a14Wv9SeulRn7A4bZG8oilkCSLLcCPT/7LKd9FH+Ij+0PybfIQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F/KyVCtY7F4WUAmqcTHdYeVb2be16vEeFYi+wrYA6do=;
 b=k7n8u7Is8yPtWn8sDYWG0znb1nmyTgoeZI1xk4/P4RPYxxNB+woyntbEJMGCGx9IWHFgr0nvjFtyMinBFN0jnw0OpFAxxEOAl3g8MzTk0DQ/WNJ394wPvdx9BbapMMfFlDcamfGt5aVbhcuKANp2uoPGR7VAM9m09NkqRC8VrUWrv4KhujyLsTagEfrhGhwTGdbJ71UXOtV1fOdaJI3nJa5Xsu38L/Cu8lfHh3P2wE+f/IDWyBIoyqxvO3MEekUxKguD4nuGELuNauXA9QudAAYWiKWTCzzt+iDkQP9HPql76cS847b87836uIrO4C1pLKyuZKJ4barb8QKIkeU2AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/KyVCtY7F4WUAmqcTHdYeVb2be16vEeFYi+wrYA6do=;
 b=QjWHRKuDinhEqp0hKK4ibKTFM2zundQV7xMZtt3BDMETr86lo6ca4x4Pau/QUIQtUXegBEda7M3rh0/aM18S7MY3C9KjhFZKG++Zz/sLFl2BJ/ZbfEcHNSbg4fKDpB1I29CM4g69x5igogfFJlRa9BgEtfGKCCec6hBeGi/SFKbyamyB8K+eNLAH8zx4g0XyH7pcZLEIP7MaRpKpO2wRPwi+NaGRNUvBhl/CAZF25C/66qZAj1GSm5TaZGNCAH/IIpthZ7jy2+lC7jNKc+4Cnn0I92PHuzDA9/9Jh3EO6pWu6Mc8bfr9dvJLqCAo0remlgki4RLNudwy0b1NTB1RKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by PA4PR04MB7807.eurprd04.prod.outlook.com (2603:10a6:102:b8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 06:55:41 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0245.012; Tue, 28 Jul 2026
 06:55:41 +0000
From: guoniu.zhou@oss.nxp.com
Date: Tue, 28 Jul 2026 14:58:58 +0800
Subject: [PATCH v5 3/4] media: nxp: imx8-isi: Add 16-bit raw Bayer format
 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-isi-v5-3-1d22ab91602a@oss.nxp.com>
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
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785221945; l=4848;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=6aW5Gxspe2hmQsP07FnJdw4wxhOn0r0RgT67abG/4xo=;
 b=zVVbGL5NeAdjFs1YgZHZeN6rE+9/RcJxuHP9FS3OIs72uvkSbwH1hfkPUZ8AvXC1fMTFnXKd0
 bdou8TeKZauAl7NMnCPUJRObLKyQ/tVG0BNg5ozuOKYyA58tRoGLIrO
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2P153CA0020.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::7)
 To GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|PA4PR04MB7807:EE_
X-MS-Office365-Filtering-Correlation-Id: f52958f9-a98a-4514-46db-08deec753cd7
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|23010399003|1800799024|19092799006|366016|376014|18002099003|56012099006|22082099003|10067099003|11063799006|3023799007|921020;
X-Microsoft-Antispam-Message-Info:
 2g9yJ8c+zqPJmOJ0Zq0DzLFGQK2CZzTn+52f4hfxNZLZ3uZx7EodBbLjL3eq/Smau02QWBik1fCNMUG0blg2iIsNTszog5zG3GB0wvfDIvwaToEeCguHMsVwQbiVu867aTNiO/tgYZE9RwIPy2ILacyrDyevPEo+FZqU+13nVNxqWS/nI+vA+LxD2H0qI3ex+noFnPxmpRaydx6hrs4ueF5i9qpJoHLj4xFhnWYraTV1YxtFUGq9apZP32bDQWPsMlUvyFrcVvW+i5U0XhxU9anZ6gts5TBPhf6A9CDXky8JtGMlyRnDpWFE+frwX/W0wHqPcj7yO8Vt08kTsRngEL4ejjGgYqmia+1ANE4p7jHnqY3EBjCzN6qxWN02oVgf/vn2KNR5A2jKsnKU9HaPlO9Zi/EfDGzaA2KKlKQYOj1JhKRL75OewtZDOrtnW81GvYiYGAQUFpP34Mni0uWkiJk6tra7qiJ6Wq5RZYXFN9k0aZFwCWsYWfG2btnD4UVYGNqG9fqVoxiOVl2wETqgjDWHxLBHZbR1oCDwhVNEpf6RP6yBPFUtYpiPjqrQP3E5m3QlqWqwpEJiRxeEWhmCABfXN82aYuIMsNoYtFjzFgmq4T1HTBuWySQEtjgNBwdH/A8bKFSxEzJW2PnwATp79NoWQKoOwnbLa4dmb3elFAyb6v1vtUcxsS/rnR7oOlMONdVx1yHiIVbHBUYN/wP66A==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(23010399003)(1800799024)(19092799006)(366016)(376014)(18002099003)(56012099006)(22082099003)(10067099003)(11063799006)(3023799007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?RzNrYUtCN2YrOWpWeXRjVExUS3pyc0daTTQvY3F2TW9oWEtYQzJ5dG1vNVY5?=
 =?utf-8?B?Y1d2K3o2eHpNZkxRdkwzU3dLU0FUOG5zVjRiTy8ybFVtK0h0ckZMNFAwd1Rs?=
 =?utf-8?B?NEpRSUVCMmpmby9aRlYrVG1PTHpDYTVFRjRXVXRzNFl3QnlsTUFFdTYwdVla?=
 =?utf-8?B?NlhxMVdsS3FkODRJWlVYOWN4WWNlUWUvTFdSZmFubjFocWdpRHY3aTVQeFFN?=
 =?utf-8?B?cGlHR1VUVDJVNC9XSWpOelh6MFR4ZTBDVHBBYzhaOTllY2NzTVJFaDRlWm1Z?=
 =?utf-8?B?VXNYSEVTMm1JdVJ4Y0xUaUMvVTMwS2t0MTRITkhHenBpaktZZDFYMFlFV05v?=
 =?utf-8?B?akdVVWZCczNtemNCcm5TRVBtT09zVldDSU1BelluaTZMU2VKN2lIQ0NqeGNa?=
 =?utf-8?B?Z0hTM0VhakxWZXZRYUN0V0cxbXo2UnlBNStyajZJVmg5M3RWTE0rMndtK1h4?=
 =?utf-8?B?TWV5bEYrdTVmOW5majRWUlB4OXR3RmsvMitnVWtCZjg2LzRYOXdyUnJ0Zmcz?=
 =?utf-8?B?WGRiaEFxWmd6VFRkN2JuMnlCRFd6dGhRYjZVaXBXVzdCaVc1UVhNMXNKMXhU?=
 =?utf-8?B?QXlUQTVmRVFKTU1oTE5nb0FSWHRlMngxQklCemNzb1hMN0pKOXZ6TTd0L2NZ?=
 =?utf-8?B?UkxQbzZ3QVlYWTZVRmprSWQwN0ZHOG51Qmo0Z0YySlBLVXM1REtMZUIraEYv?=
 =?utf-8?B?UlZ1TUxaRnJSM2JnNEJoZjU4eCsxWlB5enZxMmRJampNUGlMNEI0U0xLc3Jq?=
 =?utf-8?B?VndiRkV6cXhMRTRlVHhpL3dIaWdEQVl5ZGoveG5IRVhGUXJRTy9mSzVyYmRL?=
 =?utf-8?B?cWM2WjE2Y3FHS0JVTWJ6L09BR2RXNjN4SU5mWjhtQWJPQjJQbmhad2RiZlJB?=
 =?utf-8?B?VDNDenFlb2I2L3lIaFhzNEUrYlk3cng4S3Q1ZE9URGFnWFlmai9xOTlkOU9R?=
 =?utf-8?B?bVFycjNmVkVuYW9ValpENC9BUVgrMGgwS1krRlNXeDduYStuR1RsekxkTldN?=
 =?utf-8?B?MkdxaGZHVFFaTVhEaW1XNGZaUGU2RlhMZ0QyYlJiYklJV1B0TDVwU3Ryakda?=
 =?utf-8?B?MWlZUFVtQm91dXV4YStsNDQ2NGs5VmlsL2wraDVxOHdYSDlreSsyTzNJbFV3?=
 =?utf-8?B?UlZBZGRmYXVwb2FXczZHK29TLytBcUw5a0MyWXJJb2VVdDZ2aTJlNFp3V0NS?=
 =?utf-8?B?aEw3RFdwc0ExeUFCUFFxWmdTRG9ZQ1NCcmo1MkZPdUdiYlNjcXJDdGtMa1ZF?=
 =?utf-8?B?SCtXTnMzcmZPaGNMaVlHTXFXM2svSklRNmFVbi9WT0tWTDVVRGpnTGFHaXo0?=
 =?utf-8?B?K0JnU0tZN2dFMW9BR1NoT1JTdFV1K2VLeWFoMkFNMGIwWXZ0N1docUdUOEZl?=
 =?utf-8?B?alNyWmEyVTVSRWd4TXhuYXA1a0Z2dGZyQzRNL3lQTXVNTmhOYjM3VXVRUEg1?=
 =?utf-8?B?RHBuNVltZ0ltcjVSMXFnS1JGVHVUSGpRZUVXQ0JVaGlTTnBiVVZxMnpvYWhG?=
 =?utf-8?B?ZTlJM3FWbHI0R2RIb1V2aGZQMmZmYkRUUFBqNmdHaWJlL0F5YTM5Q3ZQTHAz?=
 =?utf-8?B?NGRlYkZHSHhZL0xnamt4blBUWWxmVHN4bXM4MjlPQzY3dVF6bW1EY2lydCt1?=
 =?utf-8?B?M1M1alhSdTN6Mkl0dUFnclpPeHU4VGl2eFFtelQ3ZElZRERvUHhBVWlJYjlr?=
 =?utf-8?B?Y0lXSkE1VDBZS2IvelZvV1dHMW1XSzU5QUZ1TGlIVFIwVS9HMFROdS9qd1RJ?=
 =?utf-8?B?NHc2L0dJVXVQSWJSWXloS29PbjNzK1l3VEd4WXhuSUJUTkVzYnllN01mL3hM?=
 =?utf-8?B?NTNodnNibGJ0VmNxS3p4SnEwbm40SXArYmtyRG9RemN6SzNPajJ0Vnp1ZWVa?=
 =?utf-8?B?MnYwS25JSElyd3FmbWtmTW5zRjdROEprMFZLb0lLbFB0TGhsc3lLSVZCVnBq?=
 =?utf-8?B?Qm9Sai9kZUVRdUVHSWJYQkNYRnRqT2ZZM1U3MG5LaHNjR25FVlc3NFRtMUIw?=
 =?utf-8?B?RmdPNzFuTnJSWjdhYXUrak5tVlQ2MGU3ekd4UG4vT1h3VThsVVQ2eGgxVTIy?=
 =?utf-8?B?eGErZzBYaWVjd2lrUHMyYU85ZU56WWVvWDVCWkRZR3YraUtQUGo4VGxwVkZG?=
 =?utf-8?B?Y0xwb1BEbTRhUFNiNWZZQTlYYkpsYjNiOWNkWlRzV01Pb2JyMzY5MjE2VGxQ?=
 =?utf-8?B?Qml5YmNGWTRxVHg5WlduTGlTWVF6RXFHM05uekV3NU1hL2pZNVFTUEpkeW0z?=
 =?utf-8?B?Q0ZGZWZWOVg0YkdwTU50UkZYM2JBWDRzMDdpcHExV0lWVklzTUU5cVU0Smx1?=
 =?utf-8?B?L2dFVjg3L1JOajBKN0tGb0l2YXpaa0o4di80YWJaYUxIUXZ0RGl4M2lidlVo?=
 =?utf-8?Q?idweryQTx17mcbokgPYfz2WBipjFhzI77VkDR?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f52958f9-a98a-4514-46db-08deec753cd7
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 06:55:41.4017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sYUfdLQlzaFIevMNs2C19NIwXPf3zM85raZ46bVmVZTTK4KQTVO086NDkW8RT1kFtQfwZl9cCxvSRO2p5qsQUnGZFjtCo0UAKZDijHU6aIoFbLNQ4j8eQlQGkpI3Bj9v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7807

From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Add support for 16-bit raw Bayer formats (SBGGR16, SGBRG16, SGRBG16,
SRGGB16) to both the pipeline subdev and video capture interface.

These formats are used by image sensors that output 16-bit raw data,
enabling the ISI to capture full dynamic range from such sensors.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v3:
- Remove "high-end" from description as RAW16 is common now (Laurent)
- Add Y16 (16-bit monochrome) format support (Laurent)
- Add Reviewed-by tag from Laurent

Changes in v2:
- Add Reviewed-by tag from Frank Li
---
 .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    | 30 +++++++++++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 45 ++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
index c0ec59856374..934f7b356258 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
@@ -83,6 +83,12 @@ static const struct mxc_isi_bus_format_info mxc_isi_bus_formats[] = {
 		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
 				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
 		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_Y16_1X16,
+		.output		= MEDIA_BUS_FMT_Y16_1X16,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR8_1X8,
 		.output		= MEDIA_BUS_FMT_SBGGR8_1X8,
@@ -179,6 +185,30 @@ static const struct mxc_isi_bus_format_info mxc_isi_bus_formats[] = {
 		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
 				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
 		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR16_1X16,
+		.output		= MEDIA_BUS_FMT_SBGGR16_1X16,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG16_1X16,
+		.output		= MEDIA_BUS_FMT_SGBRG16_1X16,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG16_1X16,
+		.output		= MEDIA_BUS_FMT_SGRBG16_1X16,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB16_1X16,
+		.output		= MEDIA_BUS_FMT_SRGGB16_1X16,
+		.pads		= BIT(MXC_ISI_PIPE_PAD_SINK)
+				| BIT(MXC_ISI_PIPE_PAD_SOURCE),
+		.encoding	= MXC_ISI_ENC_RAW,
 	},
 	/* JPEG */
 	{
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index 056603055c81..a6e044056762 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -212,6 +212,15 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.color_planes	= 1,
 		.depth		= { 16 },
 		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_Y16_1X16,
+		.fourcc		= V4L2_PIX_FMT_Y16,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR8_1X8,
 		.fourcc		= V4L2_PIX_FMT_SBGGR8,
@@ -356,6 +365,42 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
 		.color_planes	= 1,
 		.depth		= { 16 },
 		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SBGGR16_1X16,
+		.fourcc		= V4L2_PIX_FMT_SBGGR16,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGBRG16_1X16,
+		.fourcc		= V4L2_PIX_FMT_SGBRG16,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SGRBG16_1X16,
+		.fourcc		= V4L2_PIX_FMT_SGRBG16,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
+	}, {
+		.mbus_code	= MEDIA_BUS_FMT_SRGGB16_1X16,
+		.fourcc		= V4L2_PIX_FMT_SRGGB16,
+		.type		= MXC_ISI_VIDEO_CAP,
+		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RAW16,
+		.mem_planes	= 1,
+		.color_planes	= 1,
+		.depth		= { 16 },
+		.encoding	= MXC_ISI_ENC_RAW,
 	},
 	/* JPEG */
 	{

-- 
2.34.1

