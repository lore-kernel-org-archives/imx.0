Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795121787;
	b=zopEJQUolnV3Idn47a1pH2Vxgi9+uEbHUZYfBBEXK6Jm68gmjp4o3ppcWTpYoX6nm5Jw
	 ezb2TQuOxdD3LvKyUtd3Yk8G+ayJUCb0xFBiJ7j75fFcOCCfAN4yhK5LUY/2Bn8cJm0oV
	 6EdP02Iq8DrkLqsKT1Fh7RNpQeNeaAjip1wnf2nIYzmwIeBdknOKxEdx2e6tWw6bjTJxf
	 x0zwDoSq0PtDJq3f21Fy85INjcPCDMLtpPmiblIU+nADtngKNiJnbxtmWfEPhtvyyAz46
	 wF1dw5HQidHl5ntjGAO+LEkeU7ueIYv5gbcUTwPsPSpywiqyi95xmmWiU3ZCltHjUuQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795121787;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	bh=V4+PiIeG5/bLdipdjMLApbjcKRw/lqcCxUTJGVmUrcM=;
	b=RShzHWxL2kJkb24KVSvIYe9UszyY8kZb3NB6gJm+2+wBxVzeUAL5OzbJgYGx9WRkDVQu
	 hSDGU99xthv1hFoYE+nZztLbAYfOa+9H1Z2gVy+cnlp2Ofb8+TpR1rRvTqfZo2dL363/I
	 FdwZGnHpN7eaX8hk9giAxJbGY8Hm76Ud2q1Flh8X5ZGAuxCLhzpOGcRk4vX3crTgf6dtM
	 ZXb0Y5ZuWdq9OSHbC8SL1K0A6ZGD36xJjuGXcjy6b3210LUdMsqL0e7+jRkfBAuDKeZH1
	 RDO/V4QHYjxjm/Afhc18Vm9kE/AIL4hjTtFnvBOAY/pPJSc7ARCY7BSclEHeQgrBS6g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=H7yQa6ho;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.36
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012036.outbound.protection.outlook.com [52.101.66.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB1C606A324
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 20:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FB1C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=H7yQa6ho
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v2I5J9xtJKtr2sz9I6+T0NwLE/sCylOiQuE9V0oIZ894K1B8/dBi7lKpfm/2+qaXZtU41eeenJXaQu186snFK0DaXrN7VcSNOAwx8/8jeuKMt65VOAHhZuAuHPU/223cCbgg+ygoSt1Fkf/57gva1l/tcpUHwka/bixOBAVInSmy+BSHvpW5lDQb2x6PV01l4z7KJC9GFwQjUDywGZWqQ+k9kyY0bkvcwA/T38FOBThig+Ag2eQtRYuHZBG0tDkH2MpsxWxduOKnanyvL4kOsw+CX7EnGH3d3a1RwjP9hBg+yukl8kd+LyeonjNKRKWEH0gdUuntAEUZdA3lRNEGlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V4+PiIeG5/bLdipdjMLApbjcKRw/lqcCxUTJGVmUrcM=;
 b=Cx5W7zHbwPzRNgcfKWINc9c0GU8f01FcUCb6nZwh4mjGGWW4DaYp4ZfELVCeXwmsGwsEpTb72xWigiQ74tf/rZqJw3kmgA2qPR1tirQrtDZBA0Nk9cY/4CGH/78/9OtmU9jXGZZwL0oQpvVYr1xiT1PNVge33SGmmcgQp7mHCXYPYP32WQWwd72kVrEJpvwvILxCPBSykyJlYizwb2q0m4AXwKacCr5y6D9IfZbToqKDtjCvgrGngUNLkeXmUKkiDiwVWrmW9fYuxo2hro9s9WXroLgc12eYwJtWKYtFE7RKIpgIZ4fQn++VsIzq87APmxocb6EoP3hGz0iBjtBLDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V4+PiIeG5/bLdipdjMLApbjcKRw/lqcCxUTJGVmUrcM=;
 b=H7yQa6hoLHHQfFuRVTsIluZEceKR9qKqZ5Vz2zE4GqXsZGEgfAnc2EtGWlryxhGLpKN8ShnC7MGuMgbBVe1E1o9K1kvV97f8ASJWxIszb6SqtWzPtOZRrsM1KvcHlAz9/qz6fNcj67oZmQjTfxh506Yxe0EgDyp/kHMI+4z5dcV/xAwKh65qTb51lyZtk4BkXAXP1GJV/bDSJSeWn+DXsGV8LlZYO47wO17E3ROg8o47S1+klTRQDYwpROSFmhV5FU7PqNhBxM5zMAJhrrndvFbZlx2cVyMP/v+KKvukhqRmmdz7OI4WI48IiZYRI4i68CSuh7NlPiGv/gQHPChdRg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by FRWPR04MB11224.eurprd04.prod.outlook.com (2603:10a6:d10:173::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 20:56:19 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 20:56:19 +0000
Date: Thu, 19 Nov 2026 14:56:09 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: mchehab@kernel.org, hverkuil@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	festevam@gmail.com, kernel@pengutronix.de,
	nicolas.dufresne@collabora.com, ming.qian@oss.nxp.com,
	marek.vasut@mailbox.org, jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com
Subject: Re: [PATCH v8 09/11] media: chips-media: wave6: Add performance
 profiling
Message-ID: <av9iadpXveXGb0R0@SMW015318>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
 <5702baa6ed97eb30dec14bddba2919252ec8f3c8.1795075582.git.nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5702baa6ed97eb30dec14bddba2919252ec8f3c8.1795075582.git.nas.chung@chipsnmedia.com>
X-ClientProxiedBy: PH8P220CA0032.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::10) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|FRWPR04MB11224:EE_
X-MS-Office365-Filtering-Correlation-Id: c2551468-0e88-4f09-dbc7-08df467f8f48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|23010399003|19092799006|261022105027099003|261026140227099003|261028144727099003|261021123027099003|261022115727099003|56012099006|11063799006|4143699003|261021121427099003|10067099003|261009223027099003|261022075727099003|261102123227099003|22082099003|18002099003|261026121527099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	a9qirIaHKlhuQkGxeuvkjfGTHUajlTddJV8CNn/J+XH7+RyRnafp4jnPekjAHJx6PMtTlsaxLyi4KGtvJwlFPplN8nXH0RQqYtehjplKBq+Vs3T/Jn2mFsZZSaRvrtXzqeNrJ4Fg/TyG/qB+3Eg00L3Q2e+n/LgX5o24tOS3bsNSI29uc2gkdWtdKd4u8vlUIAAZ9zejfBtTK/+hUy2oMx93HqLn655SOfaH/QUgRdFCf+Qdayt7nzdrYAM9jYak3xoTm9CZ94ZVwWxIScdo96CrLavvxFXIj2T1cR5OUcuym1tNWqQbFywApvgaVY7JD/43KKDFwtFWmQjiLCmFGpmExHWf2cfaEcGArsftlNSuPr96fIfKWMuWyGERPd213ez/FCMQrI9AQj6ig/8/ptHzIhGLuAuYQss9zp5iabDEU6zfRoD55536hoFHVwVEGheevtHzCFwmAvQNd3T5V9fa3F9MZEftovnb7MwN7ztubgoms39/lsbumQIcc1y/22QNsJJ9+ZKXUIrZS9UEkZuCYQidvD0uK3Rmri6COVJRo0B+lAqjUeYfpAThatTb6pbMlflGsda6P8hgw7RZDSCftmOMkGbAscDd8aPJ7Zfqhk97nrRzgwVVv1B9CK0I/n2LBO94SvMieZE219tBTn6m/GLTZBCO7m4C+QEg+6s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(23010399003)(19092799006)(261022105027099003)(261026140227099003)(261028144727099003)(261021123027099003)(261022115727099003)(56012099006)(11063799006)(4143699003)(261021121427099003)(10067099003)(261009223027099003)(261022075727099003)(261102123227099003)(22082099003)(18002099003)(261026121527099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j1YB60v5xdtgdNVKjMVS+wmmgatOuPB1pvHTN3bAupbq8e6UcGGli6AzOqNL?=
 =?us-ascii?Q?sEiHt8bFB5P/pmMwrrCDdb3RbTD/1cIkBaXbB0oLl942eGJw7JK1eZI3aPjz?=
 =?us-ascii?Q?C0mb8QjKVYjSyrwniCvZh1gmZdTitcCfr4Pcx02S21p/1RW3R18DAZx7FJun?=
 =?us-ascii?Q?UNqcmPs67AfMrPMCoOuh0Nw4xYv3z1r1PSnhkQsRwx4Q5FM2WqoePn5dl3dI?=
 =?us-ascii?Q?20GjIVda3pAqSXG8Jizk54dXSaWlo/WA49IrS+INeXi8eWSmjamAUhsYKWir?=
 =?us-ascii?Q?HuWw+YicKG3ACI/o35VieH/S/pRQeUDSIiyXlyR/D93wCGNgHw3rSHjv6r7/?=
 =?us-ascii?Q?IPiSxoJjZOcjHw8P2y7g4OHmDxpYn3gwj1/XeLp7ZW72lgkSLPtI64nkJ05I?=
 =?us-ascii?Q?G6YfCqYjyNjiKUe9gV25pQTkNaxlkfwVOEMvG8+6LOJTPWFCIkuJc92axmYy?=
 =?us-ascii?Q?j5/UgcTY9L9vd7oPufpnJqeK44K88O2dzIMZgN4GH9nZ0lViNX9eA9Fxn3FX?=
 =?us-ascii?Q?Xi2IbhfT2lH3AF4UnTZdHCS5qCxBentsFXFezvGjT7djnx7TA+TYHaIEVA6O?=
 =?us-ascii?Q?keNuELxf2xPZ9Pw2mVt1EIPl5w3IrBmAaIlHCvuz8TQHh6WGCg8q+Nk2GcfG?=
 =?us-ascii?Q?G2IrMqI2iVQPVVM4e1gHxvpnPDyowm3+KKIFXeGsxftN2sT3Tj8N1SCAcnge?=
 =?us-ascii?Q?JkKCf/Q6ol6cBTA3EKmR1vgnEJ9Aa+jfx8ouubos871Tra0IuE2JyDrqIxDo?=
 =?us-ascii?Q?A3ClB5uV3jQtF0GlEk37K49P1NPsCDEloO/w1AmFSnxT5VsvdWsTyQGr72Fn?=
 =?us-ascii?Q?ffKw5ZIh0k9sNx/uKS6eMGtuqnllwEQ6Ry5lQolALy/2uDcaeK82DdL58Noq?=
 =?us-ascii?Q?ct75rTJrBayQpc19AfgNcYhsd/BKC9T84FRDX9o+HHNQoqNWJj3QPZSeNnC9?=
 =?us-ascii?Q?PFfzVyn1ZwQ4kezrJnk+UT8TnqcDJar6n1jb3Z3BKpb3uYY4DsiVByOvYhF1?=
 =?us-ascii?Q?ZWY9J2mNUtiT+loybP2IKvvHk9gGiuUd9Ip1aqSta3KW5Nso8bYbtXufA10/?=
 =?us-ascii?Q?I1kNq1x/gnZbrtEiF4o1FcCEblUNxfx4hHKpD59H3qClYNfDYbbXvlONl926?=
 =?us-ascii?Q?920uE9iOjsPnOfcruL+dypKcm9SRDNkM62JeG6rR4ry52RdLAb4jRBzfdvdc?=
 =?us-ascii?Q?YPpl3paSnCnEhne2f5ozmn/D9gF1Q19P0KVmMM+CHPENTVtJqZiIvBWjvoAf?=
 =?us-ascii?Q?kIpBFq6hL2DR0ApUUuDcbT1rQfunOY57D/ZeN5d6TbHdoT9itrbzrK6WzCgh?=
 =?us-ascii?Q?4ilYzIy0OeBvS1wVQHkvxy/FDYPmk68Zj9iJsiJxRxpF3pcXFl3Bmaulox7S?=
 =?us-ascii?Q?PpvI5TIUX1XtPrsbz+9pZRJ9OKd6ws0Htf32P0gpkILZ84BSr1vzWLYdvDau?=
 =?us-ascii?Q?gxqDzH/lbkg06Ay/rWTW4+DNvTv0+Uz0NslZYO4mbTHKtw+vYyGIScFd6TGx?=
 =?us-ascii?Q?PD9mvdbxeYgMXs9cujPCE9GtQxs8HAxBZfAQHln/QO6piPtHxm2DK5a24glq?=
 =?us-ascii?Q?TzSKP/fAttBNr28xGSNRClgQt8kxUPu09G0Ee4MExd2hi1cC0Iv3JnPICoUn?=
 =?us-ascii?Q?l9PpHeLp6R61PXPQWKOE5P1E1/fH0IIsUWd+syyUcKOnIRRQv66h5FocFrkI?=
 =?us-ascii?Q?3AYoLq5mFk4wKsBxeYephndMDMP3w1WrmEVv2jxBhtUYvVGdrGcgCjPjP67D?=
 =?us-ascii?Q?GYrANoQe2ZIHTo7jDtg83sW1aSf0LINYZ2d21lyl83c8kIS9wgyM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2551468-0e88-4f09-dbc7-08df467f8f48
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 20:56:19.0160
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XksY2dfx1lJmTDUjoFooe+tak0HLLGT12XY9qgMqLChKY2LC9ZkG3JqNd/PycOhHhGMrtNsqJFHJtnJPkSBzqDMuy41z9uzbDzNnCc2JL4Pfmw6pyzaBWeT5qNjKejP8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRWPR04MB11224

On Thu, Nov 19, 2026 at 06:00:03PM +0900, Nas Chung wrote:
> Add per-instance performance profiling to help identify whether a
> throughput problem comes from the firmware or from the host side.

why not register as perf interface?

Frank

>
> Record per-frame timestamps and the firmware-reported processing time,
> and report the frame rates and latencies in the per-instance debugfs
> file.
>
> Tested-by: Ming Qian <ming.qian@oss.nxp.com>
> Tested-by: Marek Vasut <marek.vasut@mailbox.org>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
>  .../platform/chips-media/wave6/wave6-hw.c     | 28 ++++++
>  .../platform/chips-media/wave6/wave6-hw.h     |  2 +
>  .../chips-media/wave6/wave6-regdefine.h       |  6 ++
>  .../chips-media/wave6/wave6-vpu-core.h        | 10 ++
>  .../chips-media/wave6/wave6-vpu-dbg.c         | 36 ++++++++
>  .../chips-media/wave6/wave6-vpu-dec.c         | 15 +++
>  .../chips-media/wave6/wave6-vpu-enc.c         | 13 +++
>  .../chips-media/wave6/wave6-vpu-v4l2.c        | 91 +++++++++++++++++++
>  .../platform/chips-media/wave6/wave6-vpuapi.h | 28 ++++++
>  9 files changed, 229 insertions(+)
>
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-hw.c b/drivers/media/platform/chips-media/wave6/wave6-hw.c
> index a53a87745366..8d590d8e74e4 100644
> --- a/drivers/media/platform/chips-media/wave6/wave6-hw.c
> +++ b/drivers/media/platform/chips-media/wave6/wave6-hw.c
> @@ -872,6 +872,20 @@ int wave6_vpu_dec_get_output_info(struct vpu_instance *inst, struct dec_output_i
>  	info->timestamp = vpu_read_reg_relaxed(inst->dev, W6_RET_DEC_TIMESTAMP_HIGH);
>  	info->timestamp = (info->timestamp << 32) | reg_val;
>
> +	info->cycle.host_cmd_s = vpu_read_reg_relaxed(inst->dev, W6_RET_CQ_IN_TICK);
> +	info->cycle.host_cmd_e = vpu_read_reg_relaxed(inst->dev, W6_RET_RQ_OUT_TICK);
> +	info->cycle.proc_s = vpu_read_reg_relaxed(inst->dev, W6_RET_HW_RUN_TICK);
> +	info->cycle.proc_e = vpu_read_reg_relaxed(inst->dev, W6_RET_HW_DONE_TICK);
> +	info->cycle.vpu_s = vpu_read_reg_relaxed(inst->dev, W6_RET_FW_RUN_TICK);
> +	info->cycle.vpu_e = vpu_read_reg_relaxed(inst->dev, W6_RET_FW_DONE_TICK);
> +	info->cycle.frame_cycle = (info->cycle.vpu_e - info->cycle.host_cmd_s) *
> +				  CYCLE_PER_TICK_VALUE;
> +	info->cycle.proc_cycle = (info->cycle.proc_e - info->cycle.proc_s) *
> +				 CYCLE_PER_TICK_VALUE;
> +	info->cycle.vpu_cycle = ((info->cycle.vpu_e - info->cycle.vpu_s) -
> +				 (info->cycle.proc_e - info->cycle.proc_s)) *
> +				 CYCLE_PER_TICK_VALUE;
> +
>  	if (decoded_idx >= 0 && decoded_idx < WAVE6_MAX_FBS)
>  		p_dec_info->dec_out_info[decoded_idx].decoded_poc = info->decoded_poc;
>
> @@ -1882,6 +1896,20 @@ int wave6_vpu_enc_get_output_info(struct vpu_instance *inst, struct enc_output_i
>  	info->timestamp = vpu_read_reg_relaxed(inst->dev, W6_RET_ENC_TIMESTAMP_HIGH);
>  	info->timestamp = (info->timestamp << 32) | reg_val;
>
> +	info->cycle.host_cmd_s = vpu_read_reg_relaxed(inst->dev, W6_RET_CQ_IN_TICK);
> +	info->cycle.host_cmd_e = vpu_read_reg_relaxed(inst->dev, W6_RET_RQ_OUT_TICK);
> +	info->cycle.proc_s = vpu_read_reg_relaxed(inst->dev, W6_RET_HW_RUN_TICK);
> +	info->cycle.proc_e = vpu_read_reg_relaxed(inst->dev, W6_RET_HW_DONE_TICK);
> +	info->cycle.vpu_s = vpu_read_reg_relaxed(inst->dev, W6_RET_FW_RUN_TICK);
> +	info->cycle.vpu_e = vpu_read_reg_relaxed(inst->dev, W6_RET_FW_DONE_TICK);
> +	info->cycle.frame_cycle = (info->cycle.vpu_e - info->cycle.host_cmd_s) *
> +				  CYCLE_PER_TICK_VALUE;
> +	info->cycle.proc_cycle = (info->cycle.proc_e - info->cycle.proc_s) *
> +				 CYCLE_PER_TICK_VALUE;
> +	info->cycle.vpu_cycle = ((info->cycle.vpu_e - info->cycle.vpu_s) -
> +				 (info->cycle.proc_e - info->cycle.proc_s)) *
> +				 CYCLE_PER_TICK_VALUE;
> +
>  	return 0;
>  }
>
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-hw.h b/drivers/media/platform/chips-media/wave6/wave6-hw.h
> index 7adb0a07390e..fe2a09ec4c0f 100644
> --- a/drivers/media/platform/chips-media/wave6/wave6-hw.h
> +++ b/drivers/media/platform/chips-media/wave6/wave6-hw.h
> @@ -34,6 +34,8 @@ enum product_id {
>
>  #define MAX_CSC_COEFF_NUM		4
>
> +#define CYCLE_PER_TICK_VALUE		256
> +
>  #define H265_NAL_UNIT_TYPE_IDR_W_RADL	19
>  #define H265_NAL_UNIT_TYPE_IDR_N_LP	20
>
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-regdefine.h b/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
> index 1038b87b2ff9..55395d3fa4a4 100644
> --- a/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
> +++ b/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
> @@ -110,6 +110,12 @@ enum wave6_interrupt_bit {
>  #define W6_RET_INT_INSTANCE_INFO			(W6_REG_BASE + 0x21C)
>  #define		INT_INSTANCE_INFO_CLEAR			0
>  #define W6_RET_INSTANCE_ID				(W6_REG_BASE + 0x220)
> +#define W6_RET_CQ_IN_TICK				(W6_REG_BASE + 0x23C)
> +#define W6_RET_FW_RUN_TICK				(W6_REG_BASE + 0x240)
> +#define W6_RET_HW_RUN_TICK				(W6_REG_BASE + 0x244)
> +#define W6_RET_HW_DONE_TICK				(W6_REG_BASE + 0x248)
> +#define W6_RET_FW_DONE_TICK				(W6_REG_BASE + 0x24C)
> +#define W6_RET_RQ_OUT_TICK				(W6_REG_BASE + 0x250)
>
>  /* COMMON - QUERY : GET_VPU_INFO */
>  #define W6_RET_FW_VERSION				(W6_REG_BASE + 0x300)
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
> index dc0b9867ca37..1c352016a688 100644
> --- a/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-core.h
> @@ -32,6 +32,11 @@ struct vpu_buffer {
>  	u32 force_i_frame_qp;
>  	u32 force_p_frame_qp;
>  	u32 force_b_frame_qp;
> +	ktime_t ts_input;
> +	ktime_t ts_start;
> +	ktime_t ts_finish;
> +	ktime_t ts_output;
> +	u64 hw_time;
>  	u32 average_qp;
>  };
>
> @@ -101,6 +106,7 @@ enum codec_std wave6_to_codec_std(enum vpu_instance_type type, unsigned int v4l2
>  const char *wave6_vpu_instance_state_name(enum vpu_instance_state state);
>  void wave6_vpu_set_instance_state(struct vpu_instance *inst,
>  				  enum vpu_instance_state state);
> +u64 wave6_vpu_cycle_to_ns(struct vpu_core_device *core, u64 cycle);
>  int wave6_vpu_wait_interrupt(struct vpu_instance *inst, unsigned int timeout);
>  int wave6_vpu_dec_register_device(struct vpu_core_device *core);
>  void wave6_vpu_dec_unregister_device(struct vpu_core_device *core);
> @@ -108,6 +114,10 @@ int wave6_vpu_enc_register_device(struct vpu_core_device *core);
>  void wave6_vpu_enc_unregister_device(struct vpu_core_device *core);
>  void wave6_vpu_device_run_timeout(struct work_struct *work);
>  void wave6_vpu_finish_job(struct vpu_instance *inst);
> +void wave6_vpu_record_performance_timestamps(struct vpu_instance *inst);
> +void wave6_vpu_handle_performance(struct vpu_instance *inst,
> +				  struct vpu_buffer *vpu_buf);
> +void wave6_vpu_reset_performance(struct vpu_instance *inst);
>  int wave6_vpu_init_m2m_dev(struct vpu_core_device *core);
>  void wave6_vpu_release_m2m_dev(struct vpu_core_device *core);
>  int wave6_vpu_subscribe_event(struct v4l2_fh *fh,
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
> index 525e047ecebf..be1061b2b39f 100644
> --- a/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-dbg.c
> @@ -15,7 +15,13 @@
>  static int wave6_vpu_dbg_instance(struct seq_file *s, void *data)
>  {
>  	struct vpu_instance *inst = s->private;
> +	struct vpu_performance_info *perf = &inst->performance;
>  	struct vb2_queue *vq;
> +	s64 tmp;
> +	s64 fps;
> +	s64 duration;
> +	s64 ms[3];
> +	s32 ns[3];
>
>  	if (!inst->v4l2_fh.m2m_ctx)
>  		return 0;
> @@ -77,6 +83,36 @@ static int wave6_vpu_dbg_instance(struct seq_file *s, void *data)
>  		   inst->error_buf_num,
>  		   v4l2_m2m_has_stopped(inst->v4l2_fh.m2m_ctx));
>
> +	seq_puts(s, "fps");
> +	tmp = MSEC_PER_SEC * inst->processed_buf_num;
> +	if (perf->ts_last > perf->ts_first + NSEC_PER_MSEC) {
> +		duration = ktime_ms_delta(perf->ts_last, perf->ts_first);
> +		fps = DIV64_U64_ROUND_CLOSEST(tmp, duration);
> +		seq_printf(s, " actual: %lld;", fps);
> +	}
> +	duration = div_u64(perf->total_sw_time, NSEC_PER_MSEC);
> +	if (duration > 0) {
> +		fps = DIV64_U64_ROUND_CLOSEST(tmp, duration);
> +		seq_printf(s, " sw: %lld;", fps);
> +	}
> +	duration = div_u64(perf->total_hw_time, NSEC_PER_MSEC);
> +	if (duration > 0) {
> +		fps = DIV64_U64_ROUND_CLOSEST(tmp, duration);
> +		seq_printf(s, " hw: %lld", fps);
> +	}
> +	seq_putc(s, '\n');
> +
> +	ms[0] = div_s64_rem(perf->latency_first, NSEC_PER_MSEC, &ns[0]);
> +	ms[1] = div_s64_rem(perf->latency_max, NSEC_PER_MSEC, &ns[1]);
> +	ms[2] = div_s64_rem(ktime_sub(perf->ts_first, perf->ts_start), NSEC_PER_MSEC, &ns[2]);
> +	seq_printf(s, "latency(ms) first: %lld.%06d, max %lld.%06d, setup %lld.%06d\n",
> +		   ms[0], ns[0], ms[1], ns[1], ms[2], ns[2]);
> +
> +	ms[0] = div_s64_rem(perf->min_process_time, NSEC_PER_MSEC, &ns[0]);
> +	ms[1] = div_s64_rem(perf->max_process_time, NSEC_PER_MSEC, &ns[1]);
> +	seq_printf(s, "process frame time(ms) min: %lld.%06d, max %lld.%06d\n",
> +		   ms[0], ns[0], ms[1], ns[1]);
> +
>  	if (inst->type == VPU_INST_TYPE_DEC) {
>  		seq_printf(s, "%s order\n",
>  			   inst->disp_mode == DISP_MODE_DISP_ORDER ? "display" : "decode");
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
> index 7eab283ec9e7..4fa4371545f9 100644
> --- a/drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-dec.c
> @@ -181,6 +181,7 @@ static void wave6_handle_bitstream_buffer(struct vpu_instance *inst,
>  			return;
>  		}
>
> +		vpu_buf->ts_start = ktime_get_raw();
>  		vpu_buf->consumed = true;
>  		wave6_vpu_dec_set_rd_ptr(inst, rd_ptr, true);
>
> @@ -304,6 +305,8 @@ static int wave6_vpu_dec_prepare_fb(struct vpu_instance *inst)
>
>  	wave6_vpu_set_instance_state(inst, VPU_INST_STATE_PIC_RUN);
>
> +	wave6_vpu_record_performance_timestamps(inst);
> +
>  	return 0;
>
>  error:
> @@ -606,6 +609,10 @@ static void wave6_handle_decoded_frame(struct vpu_instance *inst,
>  		dst_vpu_buf->used = true;
>  		if (state == VB2_BUF_STATE_ERROR)
>  			dst_vpu_buf->error = true;
> +		dst_vpu_buf->ts_input = vpu_buf->ts_input;
> +		dst_vpu_buf->ts_start = vpu_buf->ts_start;
> +		dst_vpu_buf->ts_finish = ktime_get_raw();
> +		dst_vpu_buf->hw_time = wave6_vpu_cycle_to_ns(inst->dev, info->cycle.frame_cycle);
>  	}
>
>  	if (state == VB2_BUF_STATE_ERROR) {
> @@ -658,6 +665,9 @@ static void wave6_handle_display_frame(struct vpu_instance *inst,
>  		vb2_set_plane_payload(&dst_buf->vb2_buf, i,
>  				      inst->dst_fmt.plane_fmt[i].sizeimage);
>
> +	vpu_buf->ts_output = ktime_get_raw();
> +	wave6_vpu_handle_performance(inst, vpu_buf);
> +
>  	if (vpu_buf->error)
>  		state = VB2_BUF_STATE_ERROR;
>  	dst_buf->sequence = inst->sequence++;
> @@ -1404,6 +1414,8 @@ static int wave6_vpu_dec_create_instance(struct vpu_instance *inst)
>
>  	memset(&open_param, 0, sizeof(struct dec_open_param));
>
> +	wave6_vpu_record_performance_timestamps(inst);
> +
>  	wave6_vpu_core_activate(inst->dev);
>  	ret = pm_runtime_resume_and_get(inst->dev->dev);
>  	if (ret) {
> @@ -1567,6 +1579,7 @@ static int wave6_vpu_dec_prepare_decode(struct vpu_instance *inst)
>  static void wave6_vpu_dec_buf_queue_src(struct vb2_buffer *vb)
>  {
>  	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
> +	struct vpu_buffer *vpu_buf = wave6_to_vpu_buf(vbuf);
>  	struct vpu_instance *inst = vb2_get_drv_priv(vb->vb2_queue);
>
>  	dev_dbg(inst->dev->dev, "type %4d index %4d size[0] %4ld size[1] : %4ld | size[2] : %4ld\n",
> @@ -1574,6 +1587,7 @@ static void wave6_vpu_dec_buf_queue_src(struct vb2_buffer *vb)
>  		vb2_plane_size(&vbuf->vb2_buf, 1), vb2_plane_size(&vbuf->vb2_buf, 2));
>
>  	vbuf->sequence = inst->queued_src_buf_num++;
> +	vpu_buf->ts_input = ktime_get_raw();
>
>  	v4l2_m2m_buf_queue(inst->v4l2_fh.m2m_ctx, vbuf);
>  }
> @@ -1670,6 +1684,7 @@ static void wave6_vpu_dec_stop_streaming(struct vb2_queue *q)
>  		goto exit;
>
>  	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
> +		wave6_vpu_reset_performance(inst);
>  		inst->queued_src_buf_num = 0;
>  		inst->processed_buf_num = 0;
>  		inst->error_buf_num = 0;
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
> index 4a0739033d1a..ca2d4051f9ad 100644
> --- a/drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-enc.c
> @@ -791,6 +791,7 @@ static int wave6_vpu_enc_start_encode(struct vpu_instance *inst)
>
>  	src_vbuf = wave6_to_vpu_buf(src_buf);
>  	src_vbuf->consumed = true;
> +	src_vbuf->ts_start = ktime_get_raw();
>  	if (inst->src_fmt.num_planes == 1) {
>  		frame_buf.buf_y = wave6_get_dma_addr(src_buf, 0);
>  		frame_buf.buf_cb = frame_buf.buf_y + luma_size;
> @@ -887,6 +888,12 @@ static void wave6_handle_encoded_frame(struct vpu_instance *inst,
>  	dst_vpu_buf = wave6_to_vpu_buf(dst_buf);
>
>  	dst_vpu_buf->average_qp = info->avg_ctu_qp;
> +	dst_vpu_buf->ts_input = vpu_buf->ts_input;
> +	dst_vpu_buf->ts_start = vpu_buf->ts_start;
> +	dst_vpu_buf->ts_finish = ktime_get_raw();
> +	dst_vpu_buf->hw_time = wave6_vpu_cycle_to_ns(inst->dev, info->cycle.frame_cycle);
> +	dst_vpu_buf->ts_output = ktime_get_raw();
> +	wave6_vpu_handle_performance(inst, dst_vpu_buf);
>
>  	if (v4l2_m2m_is_last_draining_src_buf(inst->v4l2_fh.m2m_ctx, src_buf)) {
>  		dst_buf->flags |= V4L2_BUF_FLAG_LAST;
> @@ -2023,6 +2030,8 @@ static int wave6_vpu_enc_create_instance(struct vpu_instance *inst)
>
>  	memset(&open_param, 0, sizeof(struct enc_open_param));
>
> +	wave6_vpu_record_performance_timestamps(inst);
> +
>  	wave6_vpu_core_activate(inst->dev);
>  	ret = pm_runtime_resume_and_get(inst->dev->dev);
>  	if (ret) {
> @@ -2179,6 +2188,8 @@ static int wave6_vpu_enc_prepare_fb(struct vpu_instance *inst)
>
>  	wave6_vpu_set_instance_state(inst, VPU_INST_STATE_PIC_RUN);
>
> +	wave6_vpu_record_performance_timestamps(inst);
> +
>  	return 0;
>
>  error:
> @@ -2267,6 +2278,7 @@ static void wave6_vpu_enc_buf_queue(struct vb2_buffer *vb)
>  	if (V4L2_TYPE_IS_OUTPUT(vb->type)) {
>  		vbuf->sequence = inst->queued_src_buf_num++;
>
> +		vpu_buf->ts_input = ktime_get_raw();
>  		vpu_buf->force_key_frame = inst->enc_ctrls.force_key_frame;
>  		inst->enc_ctrls.force_key_frame = false;
>  		vpu_buf->force_frame_qp = !inst->enc_ctrls.frame_rc_enable;
> @@ -2363,6 +2375,7 @@ static void wave6_vpu_enc_stop_streaming(struct vb2_queue *q)
>  		goto exit;
>
>  	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
> +		wave6_vpu_reset_performance(inst);
>  		inst->queued_src_buf_num = 0;
>  		inst->processed_buf_num = 0;
>  		inst->error_buf_num = 0;
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c b/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
> index 6980b126dee5..3ec01ec867df 100644
> --- a/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu-v4l2.c
> @@ -5,6 +5,9 @@
>   * Copyright (C) 2026 CHIPS&MEDIA INC
>   */
>
> +#include <linux/clk.h>
> +#include <linux/math64.h>
> +
>  #include "wave6-vpu.h"
>  #include "wave6-vpu-core.h"
>  #include "wave6-trace.h"
> @@ -228,6 +231,20 @@ void wave6_vpu_set_instance_state(struct vpu_instance *inst,
>  	inst->state = state;
>  }
>
> +u64 wave6_vpu_cycle_to_ns(struct vpu_core_device *core, u64 cycle)
> +{
> +	unsigned long rate;
> +
> +	if (!core->num_clks || !core->clks)
> +		return 0;
> +
> +	rate = clk_get_rate(core->clks[0].clk);
> +	if (!rate)
> +		return 0;
> +
> +	return div64_ul(cycle * NSEC_PER_SEC, rate);
> +}
> +
>  int wave6_vpu_wait_interrupt(struct vpu_instance *inst, unsigned int timeout)
>  {
>  	int ret;
> @@ -387,6 +404,80 @@ void wave6_vpu_finish_job(struct vpu_instance *inst)
>  	v4l2_m2m_job_finish(inst->dev->m2m_dev, inst->v4l2_fh.m2m_ctx);
>  }
>
> +void wave6_vpu_record_performance_timestamps(struct vpu_instance *inst)
> +{
> +	if (WARN_ON(!inst))
> +		return;
> +
> +	if (inst->state == VPU_INST_STATE_NONE &&
> +	    !inst->performance.ts_start)
> +		inst->performance.ts_start = ktime_get_raw();
> +
> +	if (inst->state == VPU_INST_STATE_PIC_RUN &&
> +	    !inst->performance.ts_first)
> +		inst->performance.ts_first = ktime_get_raw();
> +}
> +
> +void wave6_vpu_handle_performance(struct vpu_instance *inst, struct vpu_buffer *vpu_buf)
> +{
> +	s64 latency, time_spent;
> +
> +	if (WARN_ON(!inst || !vpu_buf))
> +		return;
> +
> +	inst->performance.ts_last = vpu_buf->ts_output;
> +
> +	latency = vpu_buf->ts_output - vpu_buf->ts_input;
> +	time_spent = vpu_buf->ts_finish - vpu_buf->ts_start;
> +
> +	if (!inst->performance.latency_first)
> +		inst->performance.latency_first = latency;
> +	inst->performance.latency_max = max_t(s64, latency, inst->performance.latency_max);
> +
> +	if (!inst->performance.min_process_time)
> +		inst->performance.min_process_time = time_spent;
> +	else if (inst->performance.min_process_time > time_spent)
> +		inst->performance.min_process_time = time_spent;
> +
> +	if (inst->performance.max_process_time < time_spent)
> +		inst->performance.max_process_time = time_spent;
> +
> +	inst->performance.total_sw_time += time_spent;
> +	inst->performance.total_hw_time += vpu_buf->hw_time;
> +}
> +
> +void wave6_vpu_reset_performance(struct vpu_instance *inst)
> +{
> +	if (WARN_ON(!inst))
> +		return;
> +
> +	if (inst->processed_buf_num) {
> +		s64 tmp;
> +		s64 fps_act = 0, fps_sw = 0, fps_hw = 0;
> +		s64 duration;
> +		s64 latency_ms;
> +		s32 latency_ns;
> +		struct vpu_performance_info *perf = &inst->performance;
> +
> +		tmp = MSEC_PER_SEC * inst->processed_buf_num;
> +		duration = ktime_ms_delta(perf->ts_last, perf->ts_first);
> +		if (duration > 0)
> +			fps_act = DIV64_U64_ROUND_CLOSEST(tmp, duration);
> +		duration = div_u64(perf->total_sw_time, NSEC_PER_MSEC);
> +		if (duration > 0)
> +			fps_sw = DIV64_U64_ROUND_CLOSEST(tmp, duration);
> +		duration = div_u64(perf->total_hw_time, NSEC_PER_MSEC);
> +		if (duration)
> +			fps_hw = DIV64_U64_ROUND_CLOSEST(tmp, duration);
> +		latency_ms = div_s64_rem(perf->latency_first, NSEC_PER_MSEC, &latency_ns);
> +		dev_dbg(inst->dev->dev,
> +			"[%d] fps actual: %lld, sw: %lld, hw: %lld, latency(ms) %lld.%06d\n",
> +			inst->id, fps_act, fps_sw, fps_hw, latency_ms, latency_ns);
> +	}
> +
> +	memset(&inst->performance, 0, sizeof(inst->performance));
> +}
> +
>  static const struct v4l2_m2m_ops wave6_vpu_m2m_ops = {
>  	.device_run = wave6_vpu_device_run,
>  	.job_ready = wave6_vpu_job_ready,
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h b/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
> index bc3d7e192904..00596504c3f5 100644
> --- a/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpuapi.h
> @@ -339,6 +339,18 @@ struct instance_buffer {
>  	dma_addr_t ar_base;
>  };
>
> +struct report_cycle {
> +	u32 host_cmd_s;
> +	u32 host_cmd_e;
> +	u32 proc_s;
> +	u32 proc_e;
> +	u32 vpu_s;
> +	u32 vpu_e;
> +	u32 frame_cycle;
> +	u32 proc_cycle;
> +	u32 vpu_cycle;
> +};
> +
>  struct color_param {
>  	u32 color_range;
>  	u32 matrix_coefficients;
> @@ -423,6 +435,7 @@ struct dec_output_info {
>  	int error_reason;
>  	int warn_info;
>  	unsigned int sequence_no;
> +	struct report_cycle cycle;
>  	dma_addr_t release_disp_frame_addr[WAVE6_MAX_FBS];
>  	dma_addr_t disp_frame_addr[WAVE6_MAX_FBS];
>  	u64 timestamp;
> @@ -671,6 +684,7 @@ struct enc_output_info {
>  	bool encoding_success;
>  	struct enc_report_fme_sum fme_sum;
>  	struct enc_report_mv_histo mv_histo;
> +	struct report_cycle cycle;
>  	u64 timestamp;
>  	dma_addr_t src_y_addr;
>  	dma_addr_t custom_map_addr;
> @@ -839,6 +853,18 @@ struct vpu_instance_ops {
>  	void (*finish_process)(struct vpu_instance *inst, bool error);
>  };
>
> +struct vpu_performance_info {
> +	ktime_t ts_start;
> +	ktime_t ts_first;
> +	ktime_t ts_last;
> +	s64 latency_first;
> +	s64 latency_max;
> +	s64 min_process_time;
> +	s64 max_process_time;
> +	u64 total_sw_time;
> +	u64 total_hw_time;
> +};
> +
>  /**
>   * struct vpu_instance - VPU instance structure
>   * @list:		List head for VPU core device instance list
> @@ -883,6 +909,7 @@ struct vpu_instance_ops {
>   * @error_recovery:	Error recovery flag
>   * @disp_mode:		Display mode for decoder V4L2 control
>   * @enc_ctrls:		Encoder V4L2 control and streaming parameters
> + * @performance:	Performance information
>   * @debugfs:		Debugfs entry
>   */
>  struct vpu_instance {
> @@ -943,6 +970,7 @@ struct vpu_instance {
>  	enum display_mode disp_mode;
>  	struct enc_controls enc_ctrls;
>
> +	struct vpu_performance_info performance;
>  	struct dentry *debugfs;
>  };
>
> --
> 2.41.0.windows.3
>
>
