Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011061.outbound.protection.outlook.com [52.101.65.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F410E34D926
	for <imx@lists.linux.dev>; Wed, 26 Aug 2026 04:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787719941; cv=fail; b=lqpLNlqYOaCWwt4F9JgwrDbGuIgNj35hbg+6NkMw8nDfjPEXGie/etXEOck82cA0RZHJSfi0dBBPXcWnhItVE2oX32+b0nlxiUesDa8Gfa9WYAGKRWCuYNVZsvgsxYgVypHyPFi2vUqXA9hhqPygFuha9kZLHo0ulR6QWKQM3f8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787719941; c=relaxed/simple;
	bh=LVnVtKOSdRb5BW1G0BYM6val/Nb/ngVB7R7RjVl3vgc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Z8FeoaFatNnAEGusA3pUI+gQrc7lO390wfAJ4xpGzkEIznlyisBi+UTNOH9dVDp/s1bxtoz2IiDt3GmF8XR6JbvjIubQEuGAmN147Jf4xguCXvrUSGMbR5mKJnv7iHMR4A5VRBseZjJdD5ud7VX81kqlcoFcX0vnjOZfcZHq18w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LHWjcDxr; arc=fail smtp.client-ip=52.101.65.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LHWjcDxr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wcIhgWCBpjTXwzceCU3ylG+A9zl/OkFSM+vdxpZQ0cygeAk8tKgxY3zBASBsumhnWf82ux+wfWp7lX/NX78NVkHTHDRZdu1nF0pqjeXB7i4Y434ZjvVtp7uzBUCoICYqyc3a4csZ60f4TEXadt7PJGIHVVd4HKTQ4wBpnB5qxIMPsfEw+MpWF9bj7Lz0SQ/vaCsOJ7AOYjpFHTEpJUanW0F8OM0MH0pGSqnGXUpwjjGTH3PRxq4mq1z4bV0IAOY9wSBIFUhFqbQlwCym3IpcO28c8+ukTFidtvMV3y+9atsMsFBVsmrvH7HIjsFjXioyy/kl/hGQ4BsKuP32/BiJ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gbt5W9hxSgjwtiIXPqmkzNtnxrm5QLtqKYqFQx7L7lQ=;
 b=Fx1DJkz8s6zdEOoyj3txGTUafp/Ds1gFB80wMLKaMKf96hDLcCCO1BsBrdKw4i2IK1D5Hv5+aO8Jj1sErphh07T+BygautV5nPwU8hQPI43KJFf4no2nkx7ODH/VwpTB7Me+SrqajcVvte7efKe6gFQOBnU9vXPA3n4PGuI9CZTmkaFFErcuxjL8IcOAKFLFT2RIqgTHLksK9Zn6sCvdaV1ajelb/EL4WI5m2QSuh7nuxMxEZbHvBOWAWtUHPr3xHZXI4nnvywFrhnMh6HJ3xNcQeLppmQp4g9OEjPqSvCPxzGDxWPQYfJn69gtDlSuzOmTLKFQtpfp5F2QqDnUL2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gbt5W9hxSgjwtiIXPqmkzNtnxrm5QLtqKYqFQx7L7lQ=;
 b=LHWjcDxri0cYcNroi8kc1G7mp7fNu0crWHNT6nWqnpu7SPAr830Z/kFd7M+DdwMfisllH4VNh6FuzLnkUJOJyKqsDbpDn+UHInmoWmPcQEMd19fmMYsnXh50FBxWADuQ83fdE0XBqLtKD2lnTYhGmAS0A3zOPxRa8olVNSttIw3LEz0uzxx+fZaW5vhGJcANOChY3y3d9HXAn5ScI9zfEe6oNyI3hqIyDw1Bj4+4bAM9ptv9Whs2RCOXurKZxpTPOMIafO39Hcl+R+48QracazuxCxUWyzPZEyKZiEBbc4QozsW2cXZKio76oPmVBsg58KsOiB4aDmXR8spXa71Tvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by DU2PR04MB8853.eurprd04.prod.outlook.com (2603:10a6:10:2e0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.8; Wed, 26 Aug
 2026 04:52:12 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0360.006; Wed, 26 Aug 2026
 04:52:12 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Wed, 26 Aug 2026 12:55:44 +0800
Subject: [PATCH 3/5] media: dt-bindings: nxp,imx8-isi: Add i.MX952 ISI
 compatible string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-isi_imx952-v1-3-cbfaaa3f0000@oss.nxp.com>
References: <20260826-isi_imx952-v1-0-cbfaaa3f0000@oss.nxp.com>
In-Reply-To: <20260826-isi_imx952-v1-0-cbfaaa3f0000@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787720155; l=1151;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=LVnVtKOSdRb5BW1G0BYM6val/Nb/ngVB7R7RjVl3vgc=;
 b=EpKI2UB6/cGu76hZSvSvQr2oneKJtwe/19jwQslCI1XCoL5kLCm94PJ68+/dbxHa829nkB+04
 OQrymm3cleWDwANJiqdb8JO0HVZRJN2NvMN0kAke4RXm4rvH7VArn4p
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI1PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::14) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|DU2PR04MB8853:EE_
X-MS-Office365-Filtering-Correlation-Id: c308bb01-6fd0-4b85-db1d-08df032dcaca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|19092799006|1800799024|366016|3023799007|10067099003|56012099006|11063799006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	JY5WW9j+7KM+V0iMYIqmCeW/0jwZqMS48C54F/9RA5/alY8Ecx6E9EeLDSEcP0Pd/zkJ8L37ybErdZ6ipRkJgtO3SEszkcuUWwvWuD5xGRtilPBqp61dhbw2Ys0td3JOzND1Suylm6IGg3EIqrnk0/hpTX5D9oElgh5F094AVojUDroaMF4V2KC9YNCKcarRnplYpzq1rACfYCwHZDRrFOUECKiyEjMOBivCJ3lKlCmU/XE0V8fTlN5YsrDaY+2x4o4pbTmFMxYIOdv9kNNekmdAk/ApkcG5Sse6gEmlm1DCzEWlXAT1JoevHM8Dxkkd6iTAfNoRoBLP0bFu6wEwU6TPOGlb/+ZaLdk45KECaZNlTiWvuZTvGsmTN2sBZm++Ii5IiGabxUKph3+JLqKpNy8cQ2//H4LlNZeg3hw8Rjn0R2TfDkOwESvGMEcQVE3xpDxR+7LSo/teNwcIlgIfrYZMeVvLjo3KY63IN4ztehp6td+xV0ZP9QokUtoL15bqqVaYbNpR1nxe+MzjieuqW5OT7Bz0lJyvcF9TrVubS+2o+c5HsJo+KxDKXk+pW0n1Mpmx/9Eyj0e7gJ+ErxXyHKZvRLeYjKOGIe8QuinxZQMosd8FMuRlGTCMZ/bh+UXsPZfJCmj2eaUjKs5CNftkWMcr4dQNC62yC0/0aa3tPgCl8B1iPlxezWyXsCOGmxtmF/U2NQbv1+05oZ9RsWPCAQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(19092799006)(1800799024)(366016)(3023799007)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aWxGT0NSbWhFczh2VTJKRGtsSWEzNVc2WkJjRnhERlNpNkphVnZuQWJBMkp6?=
 =?utf-8?B?TXltV2QyNG9Pc1ZIcXdQd0ZlZmptL0tkVG9vL3pWYXo0SzVhMDNNdEpWYXdI?=
 =?utf-8?B?MEJ6b1JSSlNTR0ptZGNrYWJqcWZNTXBIb3VHcHBhQ0NwMkFydHhkMmpIc3Jt?=
 =?utf-8?B?WDNMNVRKTW9CUzVCNk5Ld2swOHNnWUt2dVBWNzQybjFONXZEd0lXN0ViNURX?=
 =?utf-8?B?K09JaXQ1dGhVZkRwc3cxa1hhS0dBVWFkNTVHbHdUcTU2VXk4R3ArQlltTFpI?=
 =?utf-8?B?T1JxMkJFQ1JFMUN2SThidzVhU2k2K1prWXA0QlB3eXFLYjFtcWIvdHdUaHhv?=
 =?utf-8?B?N0V3eUVzaVdmd1FkcW9scUxFaEFjbWxydjJjVEVFbnlCRExFRWtrdWsrd2hj?=
 =?utf-8?B?dDFZd2pFb1NxMVJSYStNMEh3eS9SUkE3T3o4NFgvWDZZam5iMmg0Um1TeHM5?=
 =?utf-8?B?Wm1QVitsL24wRzcyYW1PNkp6d281RzQzb0ZoRS9rdnpOTHRBQlh1T1BYVHNV?=
 =?utf-8?B?U0ZYZHFJNE9WSGlGbzlJRVNYYjNUWmdZRFlDbnBGb3IrS3Jna0NNWjlUV0ls?=
 =?utf-8?B?SHljZmY2THh3NHkxNERpcmdNUmE3Mzc0bmpndm1ab3RoS2lWWDdUSXJZQk9P?=
 =?utf-8?B?aG5saEd1S09qYVk5d1J0M05NdXJVdEtGaEg2NjBpcXZneHRxWEZJZW1nYmVl?=
 =?utf-8?B?MXZLUnJURjRtcGxvOFVMRlB6blpOTFdBWmJnSGJMT0dqNWRXeTRwdEJndUll?=
 =?utf-8?B?NkJtdnRQQm9TeUFNSk1yY00waVlRNUxRc3dwSFV2bHNlSHAvKzBPOS9wekUz?=
 =?utf-8?B?MS96bzg4S2s2L1JwNm5DTy9US3RCSUlCNGNUV1ljT1BWRGNSZENhMlY5Tko5?=
 =?utf-8?B?ZmNNZy9lZklLZnp1VFBsdytKMmhaSFBJRnBrZ3FJcC95Q0xsRWxGZVg2OE9i?=
 =?utf-8?B?Q2NKSUt4ZjhrSGdkWFNwUXRNUUxsOHMwdFNNM2luenRUUDZLMzVoOTR1TU1k?=
 =?utf-8?B?UHZaa01DejFnMWI5a2RkQ3ZSR0F5cTA1Ukt2Q3p1OTdwN2E3Mnowd29NcGdW?=
 =?utf-8?B?UDRhQTBKUkpyWDFUSi9vb0dYT0puUGVQQldrRVNFeGZyeXZuUGFnU1JRMjEy?=
 =?utf-8?B?NjhaYVc0VU5TN0FJUWVhdm1mTGpwcGo3NUVYYXdVaTA0blZLYU00UHFwdmxZ?=
 =?utf-8?B?MUVoOUpGUDh1YWMydUlhSHU4NVd3dHVnYnR1d21sZzR0cE4zaWFDeWsrYUk3?=
 =?utf-8?B?aWRaWmlkQW9RNFBQZ2puN3RSSTRVUGh6UTBuWnc3OStxR3RLZTI4aGVMWCt4?=
 =?utf-8?B?MzZQZHNuUXBHNUMxRmJWRnkyejQ1UzhQWlljWld6eWl6dzd1R1czRm5ZbzlY?=
 =?utf-8?B?ZjNjNDVnYjYycTFTYU9VRjV3eGx6aU5mMlpnb3lyZ2RRV1JId2thTm1SUVhT?=
 =?utf-8?B?Y1pDWllBUTA0ajNtWUU4eXhQZHFCQThSQmhjR1NTNjhrcklmUUtlR291WUlu?=
 =?utf-8?B?OUhYdmllNDdZdFhjM0xhVDBySG5zbnMyYldnajRzL3NBUms2WWV6eFBtMHZ0?=
 =?utf-8?B?dXNRNmcvc283NU5hYWVKY0RqNk1DcklUZktoRDhMTmx1cmVMS3ZORE9iT2JF?=
 =?utf-8?B?V29tSHM3dThnaUVuVHQ5Ny9lbTRBdjlkb3E5dTJEVTFRL1lZK21nL3JTUnJx?=
 =?utf-8?B?ZzExL21zci9jVWlPYXBGWnpsam1rMi9YUWp6RjlTR0s5QUYrVzVncHF5aml0?=
 =?utf-8?B?Z2YrMmJsTENZLy9sUlA3NXY2Z0xOQWFIeDF6V1VJVytkTk83dms0QkZVOW9z?=
 =?utf-8?B?ZnpGTEE0SWgyUEdMb2N0TW53RWpINnhvcXBaeVVLMW92emFtWTlUZUdjZFdF?=
 =?utf-8?B?aklEeFMxNlhtYXc5VjlGOFJMeXA4YjFFWGY2eU9Sa20yMlZBNGVFZ3FwU2Rz?=
 =?utf-8?B?eTVqTXNNb0VOa0d0Zm16SXpLelI0Z29EZXRNeVNTTGc4azc5VTR6TE5kWDFM?=
 =?utf-8?B?S0ZoQkN4VmRTK3IzZE5lakdYcy8xajY3VXNaaDVpdEl4ZDNaTUJjdUJ6L3VP?=
 =?utf-8?B?cm1LcTZndGYzRDZucXYxQUx4RC9VQ0VzQ0NHUGVSWXBRYlhLMm56elJRSC9z?=
 =?utf-8?B?OU9xNFkxdFNncmpHeFptancvc0FnNHAvV1FmTUVHVytFMjlXY2lZWmlLc1o0?=
 =?utf-8?B?MzVuMzNrVjY4aUovT1Y4ZzZZa255TWFEZU9nMkFibStXdGdKUWdOOHBOOWt3?=
 =?utf-8?B?aUdLY2tXQk9QWkNUc3BKRlpsTjZjTzBMZGZpZ01ydlFyWkFxNFJoSGt4Rkp2?=
 =?utf-8?B?akpPd3lzK0lkRzhaMklxTklHby9ocGR1QnJ6bnpQaHl5cEU3dVorR0FKMS9x?=
 =?utf-8?Q?YKuu2mVviH/d0z2k4r3k++uarwXiVdsE84AU0?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c308bb01-6fd0-4b85-db1d-08df032dcaca
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2026 04:52:12.2011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: naniAzN4G3VW857C5xTMeNtgj3S8Bq8TN3hyb1apbkJPEPrP6jAYRY/arfEXVuoDFKcHx9kL4Qv3zDTciEzPLk4OIdQ6WwmxV+LUGl1U9PfywNsneTFQKonlGJfvUdI3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8853

The i.MX952 ISI is a minor silicon revision of the i.MX95 ISI,
primarily addressing RAW data alignment. The core functionality
remains identical, so the i.MX952 ISI shares the same DT binding
constraints as the i.MX95 ISI.

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
 Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
index 279c9cd3034a..313e27d2b039 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
@@ -25,6 +25,7 @@ properties:
       - fsl,imx91-isi
       - fsl,imx93-isi
       - fsl,imx95-isi
+      - fsl,imx952-isi
 
   reg:
     maxItems: 1
@@ -128,7 +129,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: fsl,imx95-isi
+            enum:
+              - fsl,imx95-isi
+              - fsl,imx952-isi
     then:
       properties:
         interrupts:

-- 
2.34.1

