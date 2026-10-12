Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013008.outbound.protection.outlook.com [52.101.83.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943BB3C3F42
	for <imx@lists.linux.dev>; Mon, 12 Oct 2026 18:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791831592; cv=fail; b=nI5OBZoyoHLv6nQ5YSvt4+1Y7v0CnqC8RCR5yEtvnlVN1zvYY5D6JhFepurdaACanRm5OPEmlK1zUeL7ylx49MepWq5AkZYTAmiRcWKiFOOniOZljMU5rGvVy/MccU2b/X5cYsfIBeHOEwQduXqBeSKDOLv1Xo009Nxv248dcR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791831592; c=relaxed/simple;
	bh=73MFIe1MXrWoGNzZx7UadsZ1x8qvRqrxe8VApk6j2K0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PEE/0PgamIoSZvYTs2UcIBjcDACF511tHWNmDp7yyQ6vTI2hwRdX45iTuMjKpnK2JOprbVMXh1uUbEf4H2xkq8GFVqBxhydIl6OBAl0KFn7oww7y0xV+YyujfjbLKDog43XGgzcUDxLjUq91C/HLy0OFyxoT54MZQ4ofQs80yuQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UOlk+bkN; arc=fail smtp.client-ip=52.101.83.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UOlk+bkN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ETVRuAPO8KqSkouJQVyOY1g1Bu5+yQaiVKBOL7JDdEfS/hrrhgW4RWfYJ24tdtCgCPeSXGNdRjnvJvBPxSrLl+67Q/ZpZ73yVAkuw76CVMWkWzKMlkvAAhqw7s2/9R5wa7BXUZVgwmlnzBGH29TsweYZN703cRDvfPcVNDqog2apQqTe4Oig3qZKRsE0r5KxCok74AqAySeR2eBuXgiXYnvZz7rLGNPuP42DR3OGLBIPE5V7FuJUcjeDOt7rBKcf/Oblo3bQjbyBEjTHApUEkpaQqAiY9oxuez1vcrMVSwMEa/1tZ1Muw6I2w9mtcu7RdNfYDR6IxK0fRg9gK22ERw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1stCwJishCR00UFT9++IrdkwnmnpwDle1Z2By/KLZc=;
 b=N07OOqK2rkUInISl1Zt0wnh3F9N5j2drRPUuPp1Ja4Bpy37gA0EB+RrksWwzKy9RyvbYx7Nf35JcS0Tpk3kUO3aq7cg9Bk0/1Zz+ysZIpKvPsmrslm76YwbkBw6Nr5gcDIkPrL1R1Qrsrf/JldQLs25qLYbBhjT8fZKn/7ux1BegQvTh0RpgL6PVLbtFSEzP3BD0LmPTUzH5dGHb7JGV6389rV3Usjbn4ClweCGh5whIWbjUxr6lUWeAnBpXw8kjG/eIhU3RRyOX/UiDPwku3zLp6POMfBUdFawJ2EWM5BtzV8Nhzy/L3uynkDgdfhnq8pKEV6ZmugqznlaqiaZIog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h1stCwJishCR00UFT9++IrdkwnmnpwDle1Z2By/KLZc=;
 b=UOlk+bkNh85volsws78BZ7osBlJ4l9PvT+YzPgG67LgI5wKNLL85Yq80G78wGKsXtIh37UV0S28rMm9pxZFuN9EA0UatwupAM0+19TiNNHRLPJnOW+2/Hkyqw2GihdeMTah8UNdhINgfcuQETSeo2PvgwtgbQphZ6twVy4JdxvXdyuRDg3XtDlx7vaSF1HnIJamY91ZdMx81Cb6uAcZg104eQkfCAyIlTl8+Xsb2ZRMCwbG2oVtRvTGSNVX5qfVZata1+yQDa5BUFd/Jiqb886qvoobFOQTPF76CYXLYRk/GsuBG4XcEuoXZB9RYwa7PQbkoRiLPxD3azshdinyrGg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB9788.eurprd04.prod.outlook.com (2603:10a6:800:1d4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.18; Mon, 12 Oct
 2026 18:59:46 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0496.021; Mon, 12 Oct 2026
 18:59:46 +0000
Date: Mon, 12 Oct 2026 13:59:38 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Avi Weiss <thnkslprpt@gmail.com>
Cc: Mirela Rabulea <mirela.rabulea@nxp.com>, linux-media@vger.kernel.org,
	Ming Qian <ming.qian@nxp.com>, Hans Verkuil <hverkuil@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH] media: imx-jpeg: propagate encoder command errors
Message-ID: <as0uGtw28KYy_Tzo@SMW015318>
References: <20261012141824.497906-1-thnkslprpt@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012141824.497906-1-thnkslprpt@gmail.com>
X-ClientProxiedBy: CY5PR15CA0015.namprd15.prod.outlook.com
 (2603:10b6:930:14::29) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB9788:EE_
X-MS-Office365-Filtering-Correlation-Id: ea6921ad-3fe1-4bbb-c1ba-08df2892fb66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|366016|1800799024|261009223027099003|11063799006|56012099006|260925022911599003|260925021911599003|260925021311599003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OKdLuynpCASzFgWFFP4/a3OcOMYKTFbwmlf6SRG/c+64kcHoG+U5fbKtFaJf0XQGEOiaJbANYAbjcGHiYqq2JeVK1QEUFdBaohg2amhhpCniHiZvbvnHSDOd7rRIwP7wNmUnMJjr/juS+4MORuENtsd73al3xy371JqVK8Wzl/ogKLV9mmaikLsBOhrekYpqxOERoE/L/M/yaEvjYtxgHucR6a6iawmPtBZ3lVdgHASmrQarjf0R11J2Jzkk3uMxA0yzmOP66A/2/1HyFO3Ix3mb672dOzYZr88npzk608s9YAHA0OC+BfEBnaal9YY8M/ZbJOqDbMP+p654i2XJc4qiUiLtr52CPCTc4f+s120qIsiA1UMRr/tP1gJV7QJWc+hZZbaoDP+YmvXr05AioSATkdzMJW5RMuhyqekzpD18egIOwjIM2Rw1jzd7sZFMbMcoQrcszUPR8OMm5cXNfjy0vMXW/xOqOrZbAC38Hm6LHlZ2INvKbD4fQnWFyIm/4wYkRJxrMgSwDzykvBsU1jcSLlCBE3zVUvNAkbwGNMHCZTYgfp2i/T0lNuE6zVwqd4NNafkQVVgA1Cg+HfA+EjM18fND8gc4l988qpdsEuvVBSW/LzDxr8/xjH/4v5sp3+99DocTWoltCT/55kYdoErwzzqwAs6eq5ocaReX0cE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(366016)(1800799024)(261009223027099003)(11063799006)(56012099006)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hb2IeKCWoWsgqMgq5runi79ZRX8VF2FLSZB1jWJ2Gc7tQiV3DQr9Ibempm07?=
 =?us-ascii?Q?qYHPP4DEtgdJFxn74FXv6SuwIxw9X3iVy6SJ/rMQZ/vuHx+Hew5sKAQIuBQq?=
 =?us-ascii?Q?rJr2ctqTaZugiYU1a9BbnYE4QBs9KB4+h02obmrGV9Ft3Fk49BHMOeB81gzi?=
 =?us-ascii?Q?VV0hOCXQZbV0FWrZ4LyGwe21Sr265gVS2nmkfdanl90B9J+LcjWP1i5g79sa?=
 =?us-ascii?Q?vZnqTZMM9cyrL9d2Y7C83LeQOFthwZO0ph/9kLqy9aS+dyrUlEy0B9HiNJnf?=
 =?us-ascii?Q?3TEoXrygTTRllVLTq+0fkic2qAy7NdOR/8d8jRGEqzgHxZxkf29ZGHS0LZ8H?=
 =?us-ascii?Q?+qOjIo03+SPJUAdO7LTyeWLR17ovwAfWbOkxlCW904GFazigqBBD5aPS5EVm?=
 =?us-ascii?Q?G/X5/lY3pq573kShh9mSKyNb9XXMiRCo9dyD2Q3ho5maX5Ff6UP1ZSOvEwOZ?=
 =?us-ascii?Q?Ax4SdfaR+j6Vq9T0Np80k70nqhDSWtQSpRhTJKW4SveY+RtF0R2SjsAkcVJw?=
 =?us-ascii?Q?Tea//Jx3alNthd8wm8vfTtxb+uBt8fujBr8WBrnpOuehwd0a/WqtNEIc/b75?=
 =?us-ascii?Q?qiuf8wllG5HJtg/LguP+0OpZxsD/6Du5TxorauTelTrEuBeHsr/frfSC4Ivq?=
 =?us-ascii?Q?LseydqsQSqsbbzrLr7dbfZDgAP5x+SYPHZhzbs1T7j+KP51XDdUvMhffxgjU?=
 =?us-ascii?Q?LUi+TGLEGEx5WuQJbFxoB9HpxoWGYTjDfbCIr17hglY+LTOkmEAYcPfhTgx3?=
 =?us-ascii?Q?F4N1p/RKcOlyiZS7A905v+dvcW47gHKcXvbPnGStj2XUHpW4gGxvSWghfgh4?=
 =?us-ascii?Q?bSz7yxH+3ItvfJjA8aXcr0mzWvGPwl+AyJW8NdJluJUyheRBIFf26q3RVrRD?=
 =?us-ascii?Q?7gbBM+SNNAmJKdvkNrdbqfSlu4C7uaGW5YsihaPfXjDFh1SFcgURUGeKnR0N?=
 =?us-ascii?Q?Pv/9leS8uZ8ORpOsD1gs6n2cUOOM0toJKx/VbU8kkVn4WTYRcN86Nl97BHil?=
 =?us-ascii?Q?zsiAD9+GburBqxIyDjV+DZagnVrUu5eHjyMBcAekZ9OFfSF1K8YivqWGTlxS?=
 =?us-ascii?Q?F7W/YfpZu03rbfnMCfC6mWjgyOhxfzl7KEfRwEzBE2727D6b5dwIoQYspH5D?=
 =?us-ascii?Q?nXwh/9OM9uosVfqKiPCXbjb8VMeCm3r0sjXJ6n3h3FB5saJ5/ng525doyeq2?=
 =?us-ascii?Q?z29JQ6KzVhNmfjEoPTx/+G2jyJKCrcW7r/pCZJlShKrs1kJDL52IIxe0BRvz?=
 =?us-ascii?Q?ugz+EHujvarFfOExVSAvxgmF5vGpkuhzDsg9SpDBPeOr8xCEX1anBNX5IaUM?=
 =?us-ascii?Q?uY97OGeBVOFcNevr8uNncJTmu4HdkDgICZM30A1UhESG5SneFKEYXuG4EjUV?=
 =?us-ascii?Q?z+Kshjg+4RqWhUilKgtZrJkwHwZUc+NM/IqQF5SFEnlIWsHEq1ZQMHaOTvZM?=
 =?us-ascii?Q?Xaygbl5Kvpw3aDPv+ZJQGVhDrvyrEDfbHryKeuoRFuaduJuwyy9cNxYzlCVY?=
 =?us-ascii?Q?uItHeWPHvCXxk9LbCLbYs0PYoeouOFK6TCFEFuMBvI0ZV51T+3gUfMrnzCcH?=
 =?us-ascii?Q?r4v+NCASbAKB40zPhDNKgwNW1HdqjVEf9WPvldI0u7NT5FlaSptPPsci8xST?=
 =?us-ascii?Q?6CBYh2CegyyK0fKyhZIJKUBl8XLZB8Qu1xiMjB0r0hHGbecF6AwcVPT4o5MI?=
 =?us-ascii?Q?XPhQOguPMsUM8VPUZg/Rhv1WqU4w1WkLYzrMRSp3etIeOfY3qpsFQFjNANzH?=
 =?us-ascii?Q?4TDh47xx24QCJ+S6EX39Y8THLOjUcMamV4TA0tFPCuFECrYa1BXe?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea6921ad-3fe1-4bbb-c1ba-08df2892fb66
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 18:59:46.7351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wNawhBiopFhugPQq02HOKhMLvWtB4IY9VrWWw6sHFItS8G8x0/fmbpSAspTglXUjPCiaOdgu7KOHUitCtPYlaaDiHyjAjAJ0QZjNNrFKIhtZ9EExz4gsBDdJv825bT3c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9788

On Mon, Oct 12, 2026 at 05:18:24PM +0300, Avi Weiss wrote:
> [You don't often get email from thnkslprpt@gmail.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> mxc_jpeg_encoder_cmd() returns success when
> v4l2_m2m_ioctl_encoder_cmd() fails. When an encoder command is issued
> while the mem2mem context is draining, the helper returns -EBUSY,
> but userspace sees success.
>
> Return the helper error, as mxc_jpeg_decoder_cmd() already does.
> No obvious reason to clobber the error here.
>
> Fixes: 4911c5acf935 ("media: imx-jpeg: Implement drain using v4l2-mem2mem helpers")
> Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> index e17085935435..5e466ea65a92 100644
> --- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> +++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
> @@ -1726,7 +1726,7 @@ static int mxc_jpeg_encoder_cmd(struct file *file, void *priv,
>         ret = v4l2_m2m_ioctl_encoder_cmd(file, fh, cmd);
>         spin_unlock_irqrestore(&ctx->mxc_jpeg->hw_lock, flags);
>         if (ret < 0)
> -               return 0;
> +               return ret;
>
>         if (cmd->cmd == V4L2_ENC_CMD_STOP &&
>             v4l2_m2m_has_stopped(fh->m2m_ctx))
>
> base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
> --
> 2.43.0
>
>
