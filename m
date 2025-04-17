Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011034.outbound.protection.outlook.com [52.101.65.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F055A2517AF
	for <imx@lists.linux.dev>; Thu, 17 Apr 2025 14:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744900498; cv=fail; b=pyv7g4zUQi0XOC6+q1SBrkv/wjWWwBcrvONrECKtoNAbdOPxsrqejlEH4gZ+4YapataUf7vxSHuHoULJFg/W/p+eZ3cTN8cKnKErqO/usqaTororKM8QifK5a53MR2t+zV6ep/eHGrWCxjD9f3pg/MLoJ9+0EXuGC8jVKGvQjbQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744900498; c=relaxed/simple;
	bh=Bh0oUZZR0POx7rOboLUAPwbonaYmoGBUcALP7Y7lWgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NRvCNN71GghcgTcqXfWpBOH/CcjqAxR/pJNDOA0SReaRxL62eNafIErNeAaSRZBMewHfn4Ur12WoADLGJssol7gpkKJ04DSqTshgaKcFcNLHkAWBHKAOelGOPuIdWA0SmaX+vPYlFamfaJSbkrDCfxrYzJ37BFdbj1jqS3BzXSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XO//srzp; arc=fail smtp.client-ip=52.101.65.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XO//srzp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aPfdirz8qbUI9XyESj+7QLCmsvlOvW5aO6nvcay8S7jWd5nz+lMxedd43kIbEDBl/Gr8qi48xx6Oi/l2Xz/IpwuxY8+pK2uNQC2wPlKnNo7d6WOYzwDjay4wfvsmYexrjOXOTKl+YZsBhbhCACHrv+MFrynfwn9bwGudSSeDkq0xsulzg13YzTmqAQMFxRP4cpUB7hFKLsN/hGRQCvCmQM0CEpA7mfAhX2bM2F9iE2avgZV2kzCDwQK2PduPH9TxVlHwzkXRYzyKjHzcjJo+W0x65t5tBdTV/ob6pFGWskY3znv3OVg4Y327xDtHUIy7diY3fCnV2DMhUxQf7wXkFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3VqH9nJmNo43nEMVjY+bMHhsvgmToCf4+KLk3SlVjVc=;
 b=gLqGs1prqWP75hdGATwYhypFbT6152bAnpFuyl278KBExi4xu/waprirQ8CeD7u2IJ23ZeiLmwaOZqsaWMvxbUKWChedrfWJSblvJTWKHRoJ3XgcQ8xlfS5cx1cbWn3Ec7azJSvpjECZ06D5vQ/j8LIU+u9DZSpZZEW7icZNcF1vbpqDmDoANYP7HQXNmv8wESFxc6W0Xx3rVPPTlUtOdL0AX5uFEu7syEwYAlBdUr+YahYhxE5W9h/9s1aQO6uCMZyGuHnqSuEisibpW+H07pAU/0r7+8KQPjU3oh9xtiIIuSriFRtejXeVa//ry+1osnvp7R3JlAIlIVQtk1j4zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3VqH9nJmNo43nEMVjY+bMHhsvgmToCf4+KLk3SlVjVc=;
 b=XO//srzpFKYzYIrPuEEcyuQpTbbIQW/i0QS3YgLO7/lBPVJajzUuEs72AXJq1tVV8ld3+2mqvUsqIHFIAR7YtM2P4pOZqfClUr/Je1UJxL4K7w4o7S0hwCnMWJONcszJqCKX7yG5RQD5/vc87WGnnaqpdxdSoU3Bzegkj8TgNzxtxeIOejjZGqrtUjeqiPFUTKoSwsyUcDJ2oUOxq+1PCdmi2ydjipd30v5H0AeKYRbPWOSa0VxgS3m3KwkvKlkrgxcnEQEwvfhD83/v/YsMPNQ8q2YQmfqvGBbuq/GIuhmQom0sKXWsbSK8XRXU9aaAHpgLPkNXeydQxaCYbH2nlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9277.eurprd04.prod.outlook.com (2603:10a6:102:2b9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Thu, 17 Apr
 2025 14:34:51 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%2]) with mapi id 15.20.8632.035; Thu, 17 Apr 2025
 14:34:51 +0000
Date: Thu, 17 Apr 2025 10:34:44 -0400
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: krzk@kernel.org, myungjoo.ham@samsung.com, cw00.choi@samsung.com,
	robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH 3/3] extcon: ptn5150: Try to get usb role switch from
 connector fwnode
Message-ID: <aAERhCLo7etmiHzV@lizhi-Precision-Tower-5810>
References: <20250416105940.1572672-1-xu.yang_2@nxp.com>
 <20250416105940.1572672-3-xu.yang_2@nxp.com>
 <Z//AtayeLP6zRGBT@lizhi-Precision-Tower-5810>
 <20250417022436.xxv66vo5vfrbgqdn@hippo>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250417022436.xxv66vo5vfrbgqdn@hippo>
X-ClientProxiedBy: SJ0PR03CA0149.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::34) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9277:EE_
X-MS-Office365-Filtering-Correlation-Id: 4367e1b5-60bb-4d3a-5acd-08dd7dbd0350
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZynKfbrrQCQRa0vW+CgZ/WsmqZZ0mSvV6FAz4XX0jVm+VIb56GDu8k1WROD2?=
 =?us-ascii?Q?pFBMdLzuioy0HWvTC4PZD2Mcx5YGsYFYi3DaLIImaqoiAt+D5vYXEQeqBBn9?=
 =?us-ascii?Q?FP0WtcgQ3Z+14UbvQ6KRfGPsK8x5dv8ykrYm0wttpfYVGW5+LKCoGYt7fBmq?=
 =?us-ascii?Q?1j2qTHtS9k+hggDhWPIOKLMF6WQ0H1VVoj3PGMNkbGL66J6Y/rN/RbkRdzHL?=
 =?us-ascii?Q?+7xykdeGyx+ITAXG5fVozDnYuiDLQ2ryJfPr75LrhY/6hfiYR6I2qUNamFGi?=
 =?us-ascii?Q?3EXOxxC4KgcxY2WLsQNbLHTrbhH9FGgkueJIXMzXZPg1cWoDX1U9CosfMpr0?=
 =?us-ascii?Q?l1PzutZToSOcsJzAMsHP5KRPGtEh3/y0AdA6ReV/3kWxd3cWwmhawXThXFf0?=
 =?us-ascii?Q?byr2bszl01xfzJD6Z+Jj2XLt9qG6Yp3tDPQ4f9u/jSBmRGqMdsXWguGVnLi2?=
 =?us-ascii?Q?kDUr4xmnO7yKBwrhU7V64q7wGK07+m7dCJV+C6ne7M18IjMpEmiNXIAbfwfD?=
 =?us-ascii?Q?EaSnrAEQL+4it+RLT9brhDjuqVi1RaURn9CGCHNXbjduT9LXaYGRLCZneLt0?=
 =?us-ascii?Q?NX85s0Z+0UhiscxqFV4jWDAqTJV49JaIWo5E+TIvdIx2XHYUHrvQfqG7+CkM?=
 =?us-ascii?Q?tohsMFhh/t9gqJEuUfslWZGAAerBm0OFYRY3Q/dQ4ItuiJUbAsaJKUSLe/UP?=
 =?us-ascii?Q?EAFwv4D9ph54AsiQncYW0aIqc69Mp7AngkDSYh6K2mxicC47/D2IkgdZl4t7?=
 =?us-ascii?Q?KAj4GGl+ADQktpXlQCX5SVs6KNxoNOPxyypgeKAZExAoyld3MnfnhrVPpsxx?=
 =?us-ascii?Q?lB2oTfOONWeMi/zbc/OgsHmtIjyxEimZevF0EArdK45iCThx6+nqpm2goYhZ?=
 =?us-ascii?Q?010huaU2kceWb/sjPqqgdNh+Dyhn89V+p5xugTHhs4V5tSVBlYgNbfbsd5Io?=
 =?us-ascii?Q?87NlfCqkZxLWjYv5MvH03uD95qfMf4TuFMTZfpyxSQNWjJqRRT3h3Cak4DCF?=
 =?us-ascii?Q?iZbVfdaDOQ0amz54f3bDix/6vJfP8q1VsN0pwnqrJXR7R2j8cAAN2+8rCrMY?=
 =?us-ascii?Q?6CPyg/EGdLo8Y/mHB4d3TBCSql8usDLt/RjuIkUxjcxbAZob5c+OVFohrMsp?=
 =?us-ascii?Q?/EzWhkQfEGwsudoyBB4OUbkJmFlnlhh1dxumeopUKiJdEzWizJ/mstyYGWcV?=
 =?us-ascii?Q?3ebyx78V7kPllr3Nyur2wTynNFZlHL16UNbNZj5MNhgn/7Rj9VhopR3drZWM?=
 =?us-ascii?Q?75ANkLM23Gz+u/CzCo73Vk+92El+nvWAUBudyAnG8MTWXJOGcXvbIp76c2R0?=
 =?us-ascii?Q?ZlsmfUP68/I3r7KW5QsoI9Vwz6b/Y9CSIDYlAXOOWE0A4I2Npkflw7tlIoVz?=
 =?us-ascii?Q?wBFaye6hKSs3DPZE+wTOY52LJuihrH12TH3KUnX5ZGLhUeqw/1catpRhawcM?=
 =?us-ascii?Q?y0n4+JrakB8FQBmfwoicW5esBUH1OcVTfSVI6+MES1l6HQAh8xk1vg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?phDHJamerwZnzcErXxNdXyiFaCMZ1jj2FLk2fTmZyseikdznBfgGLYcfgUcA?=
 =?us-ascii?Q?xYyEc43QDsjCoQ0MykjBjOmGXKNVI0PnfSOs9Vm7WDwk3QNv5V9IcmwKaPjm?=
 =?us-ascii?Q?NLUGYSESvrrHR5hDwv7/PwINegF98QwoKrEdXeNbcBadXQM2BHS9OBW0qggO?=
 =?us-ascii?Q?JjCX5bHvpA7rBx/jNhqmb1ipB+rsDyUKHMp5U1ZFOlI6pV6unOyM2PvgD4ud?=
 =?us-ascii?Q?O7hV/AbH1KZMKpn1FI7duO3f0lmNKt5PviN2PsPgjJr5xbkG8xHm69rwawvQ?=
 =?us-ascii?Q?r05SHFYC99HAC5kFb5bAsePRRjRWNCj/YZnwpyv/oPGfaWbMawIMvQyyLCX+?=
 =?us-ascii?Q?k7EMYXb6Skj8i2RRda+p0bZ7CUNOBiQC4S3IvwqGavBJn69S6Rje2Jnwyuv7?=
 =?us-ascii?Q?LvcKRrVOZ/Nzy0+mMTsezqTuvz9LYRmNS6UhWZu6LDTnmunpuWpUMT0CZWxw?=
 =?us-ascii?Q?FObzWsUJYXTRVhxs6MCHDyfVc+CbGOXsDPU1AqysopbJqNWL3pKoD+2NiKVM?=
 =?us-ascii?Q?KInAL+8mIB1yrvvmueKa+Mqsc7Hwp1UkfuFdKYWAi77gufLlz9HVFqm/ruiD?=
 =?us-ascii?Q?T/KvhZe4FUSFuXUt3i6OWIh4Hs8uNcuOoFG32GWNblqYt5L+G5B62wxPwqnk?=
 =?us-ascii?Q?Y3xYOZzk2+hOOS8AptWjfcUyYquRjdZHOPqCFyw37Y47CS/Fq/SIX6kbk/3Q?=
 =?us-ascii?Q?ZIq1+liM20g27OhM4MuvVqnr6pgPmOhSRaZcGfSq3ds1XRJTvzPtxcPy4cex?=
 =?us-ascii?Q?4gfd31Cg6zK4i9Xm61o8Dm0DiAQw1V4Y3civzRiU+bSea7x19iSiyxK41IaJ?=
 =?us-ascii?Q?wSoRpQSPPryaA2arsOSvQy7mgSurBYv9p9cay2/ZXtsn5OmOuY28KgRpPWTL?=
 =?us-ascii?Q?Fc9g9+oU1jB+Dg36ZtDpPFYPTfLw1H7ynMNahPKZLD8MNEgMaRwtOSlHRKKw?=
 =?us-ascii?Q?FXzRJx9BzYbWLxOaHq9CamdqPc8UUZaN5RwjGHq/XLJ5+XRgxd9jx6E+FtQK?=
 =?us-ascii?Q?baVIbdO/lFWGpvKxG5JFSod5yyIcTdlwk0zjd7Fj5MisuAzM6IkPT4tOOyTz?=
 =?us-ascii?Q?VWiSBVtwAwQOEjxi+cDJjBYW0YIbEpxVlhMk7fkiflpks6Bb/7ixtbsYVRn+?=
 =?us-ascii?Q?EY5HveWpnKjwlDJyeFJWy03zbIesCnWmVcyf5ccnK3TD/ugO2mwmGBFTT9FI?=
 =?us-ascii?Q?RT2k5/4PzUFod76P0PDx5rlKHSosBVT9OQytiUCoz4ZdkpSk1iWi68gUolNK?=
 =?us-ascii?Q?CaSmS963fmd6tdYB/r1vZ8YOecBjN9hPMfROblPBDX0AeeLEdvGImiMwfmKE?=
 =?us-ascii?Q?dnYy9dRc4JhcL8PnPZbxonBtvjlrJxd9GrQyJwQfFkXeZGfmYwAA/qCi9yEs?=
 =?us-ascii?Q?5GoK4IfktoRwJnzUlYpioTgWD/+I1dTOens0/49lQ0/Zg9wVxeqMvi1kAZvQ?=
 =?us-ascii?Q?/bxuNnnE0i4ux1Tn54UdBJrlRBu98m7wtnB3+pz9WkpXMoSgltoVjJhdxIb3?=
 =?us-ascii?Q?/US2K9Ooi51bfX1+6Z72v+wEWNotMVm1ieoN54F/SNNxaWUWyj8VfqBIyrei?=
 =?us-ascii?Q?16uJZZ/rabQjh+EzvrKr8vSHSEhl6tl8922//3KV?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4367e1b5-60bb-4d3a-5acd-08dd7dbd0350
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 14:34:51.6861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2r3XZg8EbrE/Dk+vLcB6231pme+sUFb/0WZZNpdb51vNOcHcCAsM17hGv3kA8Bx5R/lF5QN2o0FHFMTpiXfK9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9277

On Thu, Apr 17, 2025 at 10:24:36AM +0800, Xu Yang wrote:
> On Wed, Apr 16, 2025 at 10:37:41AM -0400, Frank Li wrote:
> > On Wed, Apr 16, 2025 at 06:59:40PM +0800, Xu Yang wrote:
> > > Since PTN5150 is a Type-C chip, we normally need to describe some
> > > properties under connector node. Due to this, the port node will
> > > locate at connector node in the future. To support it, we need to
> > > get usb role switch via connector fwnode. For compatibility, this
> > > will not remove usb_role_switch_get() function.
> >
> > Your patch 2 already return error if there not connector, which already
> > broken compatibility.
> >
> > You should handle compatibility in patch 2 or before patch 2.
>
> Since connector is not a required node, so patch2 doesn't return error if
> connector node doesn't exist. It only handle orientation switch thing. This
> will not break compatibility of usb role switch (eg: port node is outside of
> connector node).

You are right.

suggest commit message:

usb: typec: ptn5150: Support USB role switch via connector fwnode

Since the PTN5150 is a Type-C chip, it's common to describe related
properties under the connector node. To align with this, the port
node will be located under the connector node in the future.

To support this layout, retrieve the USB role switch using the
connector's fwnode. For compatibility with existing device trees,
keep the usb_role_switch_get() function.

Frank
>
> Thanks,
> Xu Yang
>
> >
> > Frank
> > >
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > ---
> > >  drivers/extcon/extcon-ptn5150.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/drivers/extcon/extcon-ptn5150.c b/drivers/extcon/extcon-ptn5150.c
> > > index b7e05d921c79..160998e163f0 100644
> > > --- a/drivers/extcon/extcon-ptn5150.c
> > > +++ b/drivers/extcon/extcon-ptn5150.c
> > > @@ -352,6 +352,8 @@ static int ptn5150_i2c_probe(struct i2c_client *i2c)
> > >  	}
> > >
> > >  	info->role_sw = usb_role_switch_get(info->dev);
> > > +	if (!info->role_sw && connector)
> > > +		info->role_sw = fwnode_usb_role_switch_get(connector);
> > >  	if (IS_ERR(info->role_sw))
> > >  		return dev_err_probe(info->dev, PTR_ERR(info->role_sw),
> > >  				     "failed to get role switch\n");
> > > --
> > > 2.34.1
> > >
