Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011067.outbound.protection.outlook.com [52.101.65.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F01416845
	for <imx@lists.linux.dev>; Thu, 23 Jul 2026 09:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784798004; cv=fail; b=pt8C+W5oHOA3X/IpDMbGPryxF+4fSWl2+4RxuJUcjoUpkXmh24T4ujjL35+zEvu8sT0Fch3OlFrUsLtv4EuOnx0jamiwnK7GhGvYMIYRZgiqmVPhSMoV9ylV7kI7KKSYYp9FchuDJs+2QCrpYizJIKsHd+Dgr/SaD0v9D+JNobI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784798004; c=relaxed/simple;
	bh=7vCwoD8zRU/F2Yx0YQTwIE4S7+I6QlRgpgis7oo0VUs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=RPKovi4k2cas/mc0NrzALBbaIS65AFkHye/Cl+azVUVXmwRbeQKybDnlXC9S0VInrwdfLtgyJlr1uaQn0OtZBZy9p80aH4BZtNNdFHvJ1i6SwpkY4lHVGww8X4Brfi5/A0Fhpvq0DF0zABWberjxz2zkRHwghtA1XZ05CxTdQsk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ty95s2ge; arc=fail smtp.client-ip=52.101.65.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ty95s2ge"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TR06cpuq1K2npEz4ahFMCVBXaPdol09NtV89YkXI/91bKu05Rf3dsoTmMaghmUbUOJn5qSXR75ZzaWCH+Mgeu8NnRB4DW2BoJuSbz7OUVDR10kvx45ej+jgNFtAJ85YTGctt6WWCrWpkj27wrlLdFKDo0iQtry09jf1sKM5+s4YT66BXbncCqypg7+xwhgd6de6Q5BCf8XFFflPexTZo0C7pTmYYMYPG+k9RuyU1ZNFJLlBdsTbQSwxY2/tH3vkhKadh2RTA+wFOJ4RUFSwufUiyodUgQw90m2ikyU1m+M2EKjLTCF90B+c9xAmObZdbq5+726QEFBdgXUq1sJCR1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7aF1/ZWz3Hq66anD9pqpoMeSBzfhmRxhu1+4/n8m1KE=;
 b=MgJqVZVQoOuKO4CT6KmS+ziPV0KeILqkLbEyISM9G8GUdDdbjoBuuy7sdFrHMnfDBuwlE2VgpNhIzk39D2CWprWTYJNO7aws09wGu7NLnut7UvLUtZUECIp/862KGjsiC4Sk8za5uNNfDxqK1BjBygCQG5sKmFm0ychr7WOSsC2y872DfATjl+KyJfu2HWs8E3wRMx3XB02KiCZqZVfX5dtyIVaCwW+qFikmcIYMdccL3zkRuqCc4tXiuY29bZ57N5/EwQ4XAdzzAefbbuGG9GkiqK2Q6SmU6u4wlTNcVT9V1J3WTIgcZbQai3KeFh+z9IRGN2Ymk0wgn1liJxc/Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aF1/ZWz3Hq66anD9pqpoMeSBzfhmRxhu1+4/n8m1KE=;
 b=ty95s2ge/cgT88LVdt6omirM7Ns/LwtnkhqGSJpumFB3TknLx1g1yI0O0BlG1vQNMCVMf8Po12rEb/W1ZLh+MSx/bf3BJ7J19IsGHlvL316pPJWwxigWyxFy1pPNs4s5qbmoQmmTGgcnlWPyQdAZmzLSEMs2sCwjw+XmJa0OZ7G5nOOMhussbe2zgbHXV2v206x577mIU8GpXOl3VIjIh3ezy4dGnljM3FQuQ8+xTxsDSdUuu4D2UqZWkD5jDClS1HKfzGayDWMvCfGdmZ60qlOkyJq5uh8VrlyaR+NZEJ4njc7NVwaX300jlfERB8B2qRs4GjImeRAgIXJq5BQfJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by DB8PR04MB6780.eurprd04.prod.outlook.com (2603:10a6:10:f9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 09:13:18 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 09:13:18 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Thu, 23 Jul 2026 17:16:39 +0800
Subject: [PATCH v3 3/3] media: nxp: imx8-isi: Add additional 32-bit RGB
 format support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-isi-v3-3-594919eae847@oss.nxp.com>
References: <20260723-isi-v3-0-594919eae847@oss.nxp.com>
In-Reply-To: <20260723-isi-v3-0-594919eae847@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784798197; l=3093;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=7vCwoD8zRU/F2Yx0YQTwIE4S7+I6QlRgpgis7oo0VUs=;
 b=yJ+Mdx/i8zI3w1ZmvmlFbyia4cGJr3948zpq1yZkLfyDYn+OITU+oYJxSzhWPUrBoitDrcr+y
 WAD1gISXwuKDEKplvjmY+PQ54xmDqMuC3ykVBK9R1VeDVczCMsbRA5m
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR04CA0203.apcprd04.prod.outlook.com
 (2603:1096:4:187::22) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|DB8PR04MB6780:EE_
X-MS-Office365-Filtering-Correlation-Id: b9736cea-fadc-4f92-069a-08dee89aa278
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|19092799006|921020|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 vd3iSp8LmNfvZ2mdKK3njtOjgmtYy7NJKuzNwUoS7IzTXogXHldgh/6oLu7TEWs0UOevpqvmQO8f/1zLVI+/DmtKvKh0hHQfiNjYKCZKrl927ZOpca4c7llH2NWmp8Gxxdk0r9d3mayidHzjgDkAY+Z20RYqi1yCcLebBZW3lyR7PmC8QfXUTEkcr9uCA+FuiLTpK+nP54S+Hv9zudnXlmR0it6hCG/8PzThw1zRSgqL+ThfEUtj2VC0p/e7KCzUhDhoEqtr4ygKlAFO61r5yR43eC48qgbPt5tALgrnL8geQXt0yYWQUv4J2VlRxPpQDbeD1EIli7ytFd2Q6hkso5VimlPki/OwyMW6vKv+Nw5NbFjonw0JeYBUHMOeFKpGvdyTkDQYhCYv9flk5a2jMl1wlxy7bDWY4fodMNc67VxqAjIqRQ9dOanY7SJobBlANsWmjhR38viWJ46d1ihMGPZyawhoFqAEDDGokX8Bp4m5ugIMFs48MFV3leXTo64e+QFkcgjtuTnIOQtRjc9mntDlFCuC3CYZUNcGJo7t17LQRKQ9lj3Xe/lcZtxoo23ERj1VzZVk7TTyVQDQb78Nc4ln+PB+eoucIrrG5GE8Mzg4+0UsuU6DDNJJrMXOM8iuuwC2U5VPb/p+g0BCkc6EOKTTpc4HPZSKb6N0N/ZcDRKFK15AOkgaELTlNkLkBXUiv5Cu2ZU1a+/euHiGdL7b6w==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(19092799006)(921020)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?Yk1XTWE3TlJMMEVBZk5YN3MzMmx5dVV2MWNHVlIxTWt0S3VYY005RUFoQzZW?=
 =?utf-8?B?a2hlSW9KSG04RTZJTGs3aURnREJKYzZrQzhvaTBsVm5XUWUzeGlHR1Zma3RT?=
 =?utf-8?B?d29CMENXMTRDY0NON0lUWTdqM1I5cXNBSTU1SVZNbTNjRzc0SWtHTks1WkpD?=
 =?utf-8?B?TVoybG8zT0VQbkthVGJ6bjBZRnl3VHNLSUNoRnV0eVRLeDZxVXRRZUdiUlNI?=
 =?utf-8?B?NTQ1M01vdHNwWWg0eTNxQVY3cThsMjM2NkUrRzdOQWczL0xsL0lyVlFsdjUw?=
 =?utf-8?B?OU8rNnBlWVg1aUhuS0RveVpPWFVyUlNNb3dtaEU0M1lpUzVMQ1BPMkNrOVdC?=
 =?utf-8?B?SnBSdEErSnZhQ2pERnlWejZCSGV6SXovcHJCd3YrMUxxR2pSL2g3Qm5PeHln?=
 =?utf-8?B?MWpaNW1Ga1Y2SW1TcUVmRWVZeWtFenEzZEg3UkdBR1BtYStKV21kUC91V0l6?=
 =?utf-8?B?SzJFayt2TGNodVpkQVM4V2pKSm1Ocy8wTVJHU3c2ZG1yQXZuSDlXZ1NZVXNM?=
 =?utf-8?B?czNVc3RDR0xXQzN3bXVQaFEvVyt0dWVFVmJtZTgraCtnUzg5Tlo3WU4xUXM5?=
 =?utf-8?B?T0NNaVpoVFJaam41c2t6aU9FakM5Wk10TTNwVUkxOHFJaU52L2M5VGFpanB5?=
 =?utf-8?B?SXlxbDY2eFROMlBFNkNSV1pjMWNXczhLeWtXRjNGYVcxdHdKS00vOVZiMVFh?=
 =?utf-8?B?K0xwWGtXTjRHNi9WSzJodnJTU0s0TEJPTVNSMjNpbmY1U1NoUmVidlVCOGpW?=
 =?utf-8?B?Z0hnZjhRaUUxRzZaTzFzYVRyeHZqY1hPcGJPMEJSbHRnRVA2Q1B0dGhVaWo1?=
 =?utf-8?B?clVWSjdEdEVLNmhLT2IwUXlKYUl0Um1JSjF1WklhYWJvK2NqM09RaXJxN3JC?=
 =?utf-8?B?QzFnK2FSRVUyTG1TZHZWd3pzbDI4bjVjZHkvMWFEYXVjQTNlZkN5SlRHZ21E?=
 =?utf-8?B?MUhXSUNMZHpnWnkrSnNzd3NRY285ZlFxUy9Sd0ozTkljelR0SERUU0g0TUVZ?=
 =?utf-8?B?SlpVblM0UlZObytLNXJRRnFCQVBRSVVsMkoweGY2WTZQcUxHRU5UKzVIVVU1?=
 =?utf-8?B?OTlJeVJnMXRQWUZSaFpjdjhvaytpd29jc0dnWThXUEg5YStpUHNjMXRBMGNZ?=
 =?utf-8?B?VmpuejVzTit4a2NjSlZLWFh0Smxvc0VMTExXT1RIR082cnRzWE8yMTdxdTFN?=
 =?utf-8?B?SVlkTEhwRGVTbFJlREhNQm1vQXJIOVAxbUNZbHpkNkFNTVNTTDhUcXRlbVdu?=
 =?utf-8?B?b2xaT0ErMHovaGUyZitxVExwOWRkVFR0a0g0ampvcndLbFJoRG13OEVyVkNC?=
 =?utf-8?B?ek5nYTh1SHJ1NXdUVlFQY1JldHRmVDlSN3pxalMwZzQvUmJISFVScGxJdkRM?=
 =?utf-8?B?d2VJbndBbjdobkZWSG9NcjNOYy9MU1RFVTRCc1lOMi9rckxtdnU4cW9CcWpJ?=
 =?utf-8?B?d3o1bUxpZXlJZERXMCtYeDJyS1ArOVVOTGtLbENnZmo4MDRPRE9iWFdQanYx?=
 =?utf-8?B?MnQwL2twSWVNcnJkNHFhOHd6ckpYbk5qS3BmWDk4c3kvd1VZZEowbmNYOTJn?=
 =?utf-8?B?QTlZNUppZ1dZNjZzN0U3Z0lNVWFGbC93RXpzcUZHQTFsZ2VEeGVkdkdTVDlY?=
 =?utf-8?B?QVQrdk1tQmE1T3AyMkgyYWtRWUlWRnowRlcvOHJuT3B6SHNhd3Q5djJLU3RS?=
 =?utf-8?B?U1Y3S0szSVZsWlRGT0VTWDhXSVBBYzVhUHVsYzVlK0tDcGlNM1BVNFJyVHlC?=
 =?utf-8?B?SFRlVGROckRVUHB1NHhTZ25ra05uRzVaZk1ieDg0UlpXL0oyMDBjYVhjMHZr?=
 =?utf-8?B?d1FGVk54MHdIUE5kN3FIYzFjS3hVVGVVcXdGTFFqcnZRaHE1R1RHd0h0eDlE?=
 =?utf-8?B?UXd5YzU5KzN6cWVnWTJXNUJpR2R2TGlaRWJFNGVOWGQrQTA3UEdvME5aaVI5?=
 =?utf-8?B?SEtHVy9DcDVtZ05zckJJcE84U2gwNVhFUWFCaTNXdkZIbHpGT1dsVklwVXJH?=
 =?utf-8?B?QVRTM2VPK2JNZ212aENBbWNtdFdXSTFXb1BsZjA1UHhMak1Wb3VmdmpDWEdm?=
 =?utf-8?B?eGY0WWpkSlNoRHdtOUdabjNmaG9aUHdHT0lXWjlFaWZORkVGQ0srcDB5QmRH?=
 =?utf-8?B?cjF6Sm5wT0R4eFhERDFrbzJmcmJCakJqajhNZjJNVHdRTzFTeGZYQ3pUbklo?=
 =?utf-8?B?ZkZKVHNscmpPK1UzVEdxTy8yeFFGUCsySWtCaTFXTkFpT2ltRnBSS3B0ZGI4?=
 =?utf-8?B?OG85ZGx6Zm5UcTQvUjhmcUZpTXdVTWJxcXMyUFRicW1WbldkY2VycXVHb1E5?=
 =?utf-8?B?cVBSYTgwSUxQdlJyNERuOURKQmw5ZDhQbzNuTTNPbVBib0p2MVIzUkhKQkQ1?=
 =?utf-8?Q?DYg5AeKh900ZRYY8ua6ErXXAzxrmlUTvj+l4F?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9736cea-fadc-4f92-069a-08dee89aa278
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 09:13:18.5848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SBfkGvbnCrRMQkTWrP0VTSVYefifusZV4cIuD1d+40n0E8u6gnK8DwNNp/fmB06u5aHukNRT/NX143+rQq6yyZW8IzXpPcxIs11AZoFoSbt0Xx5i6wXQO16E1lOQKKS+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6780

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

