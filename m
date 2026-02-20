Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010021.outbound.protection.outlook.com [52.101.84.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3DDEEBB
	for <imx@lists.linux.dev>; Fri, 20 Feb 2026 15:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771602383; cv=fail; b=t3dDhzFXhQwiv+K9ZsOYaeC3+pHT/hrITPxqsj7hZxC/7pu5MZCkicRXN7eJgBJKDRnbTYAyyJGaMsf+c88QyIzoZ/E1ietw3LojqxaQMY3BmREyZ+DeJfkBuM7EaRn21yzFwQaQRJ3XEF+IFa+Mc/YM1apXC+uVOrf0oiRJ7MA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771602383; c=relaxed/simple;
	bh=rplyqTTLdSQpI8K6IgpVLb4m72yaH/mtRPv9OkrrtcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IXPSQbWo/ilMcpOJFB34gEayv8WHpfit0ZlQwbTFe1fsmz2v035uYLMVj2T9lQBsirHKo1QyH9/0c4myesxS+PsmIIvaLSD13+hELgcWGl4iHcrSyYtvQ+EGkRDnvbf0RotcLzP/IX07tG4SXLKLCo0u7dm38Ealb2CKF/UjlgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=e1h0x/qi; arc=fail smtp.client-ip=52.101.84.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="e1h0x/qi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tPqtEV766MSXom1wwVSUfC+eHXwO2xYfvBhSNaX6DaHEntJ//iTEufXsCqQXMCBH34E14E9Xb5wXbro+SrvvcsmNis8Km3kLQQDS16v74hlyLl+8hcX44Wr7KK1alwS5nTrxWFopQlP/D4ZDei+vEhqwPsF2LIMSh8+1srInJSxsM8WxlpS55cbPZ3DdlyrKUnFfNNMENJ/X4R6PWL3kExQS2IvHxHfV0KL7rej5DwXhaMpEeBpCqiNr8kZw0xyaJFLG+J0UmwcaFoXPMAkY7mqz3BCp6W1W8sx2AD8ZnABaQXalBMKjks5QhB9ce66ia0lrn1kXxCx2dMnL9w6Vkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ULpIIQt0Us+L6xDb4zPbCCBKl6rvLhnbMRNpsqqvDY=;
 b=bEH4l6sy9jShZ70NJNyH0j05B1XcJx0JRtMHMySpSMuB36UCxdoYxyp4BUtCjuW/ef3Ifw/B/OV7FfOidyLikO61IgH5Ovo50uRXQQNqR5BLFOYLKhyg9oS5MTaE8tsiXyRzJdHPTg2rdnGm2psrRamXphVEs800rpXXuaZX+FPrPeB+niJVezcd1JbJ6wiCMEuDuVaTkvAfziZJE3X+PE87S/UYxM3Xbi8hwr+usLKFCNIhKmxx69x8GKQwkHNeG9PaHAQk/XJkELQ9oeK/df7Rw5umN6EGBrZYs0q6GRfP79Ayp1S9zY0GAmwIP1R6JTEnikjp1hcTxyg3syI0jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ULpIIQt0Us+L6xDb4zPbCCBKl6rvLhnbMRNpsqqvDY=;
 b=e1h0x/qiIyGU8YHAs9SlXNs/2d1tHTzkHswF5Ff76bdO8LEAMHrCXi5LHQ4QcDhAuhV1tm0ctyBZGsa408kWuKIjp7m0yZxeFDFrqCuOZuYypRRGaFplOvgK+ef4Vif7aZ+ghgdjNIBbbF1ddE3W3KhSjiFboVTW3INLVMfdz57uZ5uO+ux1/p1FCuKvcvwOu5IsiKsqURzj47Ifb2SVbWk/QNQzF3nEmgKqeU3DHSkJcEmJ70W/5ApyyWxBnb1YgTmwofW1PXDzJsvaqT1RtU8AMNB48t732uC/vD077/i+BIlEYPunhxw1pWk4pghVrcSUlvwQ62fpUgeplh4a1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB10797.eurprd04.prod.outlook.com (2603:10a6:150:20d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 15:46:19 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 15:46:18 +0000
Date: Fri, 20 Feb 2026 10:46:10 -0500
From: Frank Li <Frank.li@nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 0/3] media: v4l: async: add helper API
 v4l2_async_pad_init_and_register_subdev()
Message-ID: <aZiBwmPos318nW9g@lizhi-Precision-Tower-5810>
References: <20260210-v4l2_init_register-v1-0-8fe43f7d349f@nxp.com>
 <fb697f64-1f2f-4a9b-b430-23867f205f12@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb697f64-1f2f-4a9b-b430-23867f205f12@collabora.com>
X-ClientProxiedBy: PH8P222CA0001.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::30) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB10797:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c036d01-ef44-4309-cde7-08de7097303c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nbYlJhXHatnvSkYK9FGFW/NdumwLP/FPuLjTIpJJOiCoI8K5h14q3NSK5/R4?=
 =?us-ascii?Q?xg7A61uBaKugyx5NqYwRVr2vsjVhrKeBBEFT59BCXNJlkO1l4RMXo5PjtqHK?=
 =?us-ascii?Q?ICZ/fU6jzEYEl7UZIsysZZSb4m/hP0pZPD43Qr9C4dUB3SJc0+8l+E6EwOuy?=
 =?us-ascii?Q?Y86DdUxQOYLhBw9snTCiAjWnIxL0iXC60CLjwQLwqkmbaqb78wm5SSRzgXZ4?=
 =?us-ascii?Q?cDTORhFF+5nbWtN8GTWoyqGelKmhH+r8yKQr6dYXvc7G+0Yed159g2zYxdI4?=
 =?us-ascii?Q?/PplgDEqaCLVeLobmuKifwt9w87PS/zyw99Ll0w2rA3mcYQyzAgKExsY3bBU?=
 =?us-ascii?Q?5zm9tEjsyqQRKmen1KANFRuQ+u9g9T7LDtB1fjUp6C6WE7s5rdvJT8bOkxvi?=
 =?us-ascii?Q?istuLEdNzV7pYUcn0YkTeTZ4KC7/6xlDr6CouiIErYI4Qbq4/LTpozTayfzB?=
 =?us-ascii?Q?AJRC0rGLR4c3HRKzmWzFu3GpHdKXaT9PluyCdeV6bWmyEQmarmm5VPVVdXSK?=
 =?us-ascii?Q?t5h8l99CHCYyoCw6twfWBEVbk1ZETd/wgjELSzUXkJcqZBNSy+GbjZmQGX/t?=
 =?us-ascii?Q?wigAusrC0rKd9XFoXAEPxYmLSy3ImyUu8oe4iavwf5Sh5LCvAl4vYeCQipKi?=
 =?us-ascii?Q?HfB1dX7YdfiftoTHfZxEACIy/zyN5Up7I0GtNoVXCVF8lLSmo379iksk/DUg?=
 =?us-ascii?Q?5CVKbj18NzfvWyMaWyWlIYnYOrPYz4z6JKSKdAGnSRgJObzVKrLC+6RByA+b?=
 =?us-ascii?Q?aNDzx6csPzHa0a1PfrxN5WmMaH0kIKBsYSISMe0ogBs2ww6UJtCOmmuuKkO/?=
 =?us-ascii?Q?PtF4D4GT0Gj4gZ/P/8Oqsc63+X29p2AgdetE3M3v8Ea6Dzuxg+T6opyPYpht?=
 =?us-ascii?Q?JquLIBNpTbn+kIEWgLhNNQoGcTbI/aSyhnWfQhGZR4crVTa9PhNomsQM3bJ9?=
 =?us-ascii?Q?mxeHsDRmDmCbjh9vzTWHf16aFIp3Ni+Pyd4PmycGF7MxsXI/TKPK9z7VMGCt?=
 =?us-ascii?Q?GGi79lrg4g1lnnfnzl9KEfDbTVV6CwmhL7jAbAswI6pMETTRjEhsLy4nnt16?=
 =?us-ascii?Q?sb333Pzm5MPq9XZrE0NqprsoeH00faIduClLYS1sGT+5dSNoF12msc+uAZ6j?=
 =?us-ascii?Q?aGNP9VOXzO+GoPLDm9i/6lkD8GtIW0yQ3a7qCbMiuNq6FOdE8khxynuRbQJK?=
 =?us-ascii?Q?8JR1mfrrH1YWJED54kbBlJl4aBATaq5pdPJLo2MLfuDFQHeWHuouEKNG/oML?=
 =?us-ascii?Q?+vbVxSaRxXck7wIKeCOQc+gKqwoOS8nI8/qj0MkeYMg5Uqn15fzOIM4+fhH3?=
 =?us-ascii?Q?p+drwde0s2j1O7zGxGgNoYUCg7qWK99Fbz3YXMIl7WUqzW1hFOCHBYi/ot3v?=
 =?us-ascii?Q?m3fcWpRlE6gLzn9UZWQ3S65VHQoT9O8Nrea6wk16sIdXM4Zth5O4sHsE5zDQ?=
 =?us-ascii?Q?s/1SylYgDYssXDaWBBKM49Jt5ASxhYoAXaeudWKtTT2FFO1OfEflY5QU5kG+?=
 =?us-ascii?Q?9zv5fEdZE4Jz7kGJc+0586VnoM2dMT96FosxBdhJQQeeHhJueiwTeBJA/pJL?=
 =?us-ascii?Q?/pfLO/9TmlAfcJSnU2xcWz/emhnD+7L4udzPb7z8kNfe5tonzmTCumYOxSvb?=
 =?us-ascii?Q?q8XBIXARFJYGomacwqbBHNo=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4ldEPYSSFnjyhBJl02r/uAhT5XJkcqOwTo6Azmzo2zLvT/YMKu0Cd/zvkulX?=
 =?us-ascii?Q?/PBwSUNr9A5uFShvp7Vs4hMEi6UPRU97RWR+2dZkAR0wFcwxKgguDHNZgjrF?=
 =?us-ascii?Q?I9gvonb1HSOuQ6l68Dp+LkKcf5TlFoSSi0Le1JQcNBFfomrdBpigP4C6r6JJ?=
 =?us-ascii?Q?jP1IcNwnPENgqR6VeJMPjoYOcVFmGi8TPDc+VEp/zSiJhzPf9RSfwZ6gSxab?=
 =?us-ascii?Q?Euh+t7VuOtXefexzxv60if2iB/WhD2zB9bNupzzyueryYUNF6jK+mAcxMG2T?=
 =?us-ascii?Q?OB1+5Pe9pbIp1g0HLUgVIwP4ZQcRzp2t1RBFthn8xHfovO195shHj6fV7DvV?=
 =?us-ascii?Q?AjLykaF626VSMHel6FnELj6RwJGGktzFcXxqCSCRjOh59EglhlaLIE58PE5P?=
 =?us-ascii?Q?wrX/wCSZR0zcut7ItgFpCAECf2Uw6twVLqGIhCwj1d74CQPJ0iC+Lovr5pQO?=
 =?us-ascii?Q?1a0wbX8cMo/EcL3jYwbmYrH2aUSyyeegVmoo+A3Po974OkmRDlY4C4t55tGz?=
 =?us-ascii?Q?+fFaJygM85sxZ1trkb2z7DAr+uVuutcr4J+CRm0frtI2PIjKbq5kvuibAFgS?=
 =?us-ascii?Q?9nQaSVkDnK+sFsSDr+z9iZ/5oPa4Zmaz0SpOqaeG3hoxqGcewEJhifE0ZYZj?=
 =?us-ascii?Q?1VEdDkEuwdN8V/eQx8QkrQdFK9MrnEjl2FHtgsoGZ3qfxbZR95ScrRKWs/Be?=
 =?us-ascii?Q?t9vy4+fSu897eMbJ5dXSTXpj35pwGZqONC+lRPwLBYs1Pmzn+DTHHUj2rA9w?=
 =?us-ascii?Q?k2bzzNhT6j6HwwPikBRkcv2V3ixNHocMDuK4LvMdfG0qfcGv2DemXuAMmkS3?=
 =?us-ascii?Q?M2gfg3gWumvw9y6G79Qx6MHVFqSAiI+ZZDjxjFIt4waJix8xFe8SkCsfxH6P?=
 =?us-ascii?Q?cQIkeCK+3af+SgFgNb0Nw2Xi6LCzvP0sSb/mchw6LrSoUNBqR1qdkuav/spC?=
 =?us-ascii?Q?IC5aQz4eVDIyVdCYwI7Hbgfi02wxa1/08HNn0bKfKUxt19zuzm2RHW7jLBRl?=
 =?us-ascii?Q?A0gFDSuJKnHWd1PzY7jb5MW5ftiDHB3q2eNP4F3UCkkyx2ZyIuABFai3FCi/?=
 =?us-ascii?Q?ol8AznM6ZI1Pikx0voJZOIxjbcyKvXCdxYaeDZ8v1qtWnvFz3A9M9LW4fgZL?=
 =?us-ascii?Q?URboDeBguvsiofJErc9M03jTW0Z6/tcu9wgnBwtdohlr0irriK3Wc/PdiK34?=
 =?us-ascii?Q?qXrPK99PJRBtEjZCQG5/RjYVVGSpppgUfXYaBENtOZGI6eQS1NbqYXiJTXx0?=
 =?us-ascii?Q?Oz1550gJP4vlVC+vvU2blNjRGlp521NkRwVfYOJR7NxlLeyXPDxySM4iPISY?=
 =?us-ascii?Q?eJ3i4zidHznHmV2kiaDGc38ZTN5jD+KpNMmF8vat2wolWOAOgkeejlsyduMe?=
 =?us-ascii?Q?okUG4QJ2cNTKzesnNZOWp0BuIGOaVjM/lTzaQg5Jjoa8ymmxvpmkrYxYdRBZ?=
 =?us-ascii?Q?GhUKVN+uWMQtu6Y1sY/YqavpWsXYMHu66WXsfyaoEcLcmTV4l7uog+sE2SbU?=
 =?us-ascii?Q?QBZSOHfxR2x10laOvNtMXYRlhDu3FTZzbw7QFJw+S/2Rl0FfG21NwmMCzOId?=
 =?us-ascii?Q?kN9Yehw7cgZNH1ZFfGXdv1EbeJGClA23wqZ925qT8f8RCCyun0M330PPtmh8?=
 =?us-ascii?Q?EkOE3pyKRNuLdciv569JdwL0MDT8Qcn+6yLctnuFY0N2Kb28A16nU7fC+NFH?=
 =?us-ascii?Q?jp24Z1imapvxUMHtJkVRU49VyIYmhpfJPhiZo+r4rvRYYBsICtBoKtrueiMB?=
 =?us-ascii?Q?bIBtEP9yiw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c036d01-ef44-4309-cde7-08de7097303c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 15:46:18.7765
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xZF77SlfYG3KChEl26jR1JojYtv6w1efP7fasxB3zYDOZzPqLi3okH8lECfNPfu4j0WfwXNKLNDDO6WFR2r/hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10797

On Fri, Feb 20, 2026 at 10:01:01AM +0100, Michael Riesch wrote:
> Hi Frank,
>
> Thanks for your patches.
>
> On 2/10/26 22:42, Frank Li wrote:
> > Add the helper API v4l2_async_pad_init_and_register_subdev(), which
> > combines media_entity_pads_init(), v4l2_subdev_init_finalize(), and
> > v4l2_async_register_subdev() into a single call.
>
> I think this is a good idea, but can you extend that to offer variants
> for v4l2_async_register_subdev_sensor and v4l2_device_register_subdev too?
>
> The function names are awfully long, though. Can we call this
>     media_register_subdev{_async,_sensor,}
> maybe?

How about media_async_register_subdev()? which basic align other API
naming. I want to add more helper APIs.

drivers/media/platform/synopsys/dw-mipi-csi2rx.c have about 600 lines code
but related hardware register codes are below 20 line, only few registers.

I just post this simple version to gather feedback from maintainers and
reviewers on the overall approach.

Frank

>
> Best regards,
> Michael
>
> >
> > Reduce code duplication and simplify error handling in drivers.
> >
> > Only change dwc and cdns. If agree add API, more driver can be simplified.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > Frank Li (3):
> >       media: v4l: async: add helper API v4l2_async_pad_init_and_register_subdev()
> >       media: synopsys: Use v4l2_async_pad_init_and_register_subdev() to simplify code
> >       media: cadence: cdns-csi2rx: Use v4l2_async_pad_init_and_register_subdev() to simplify code
> >
> >  drivers/media/platform/cadence/cdns-csi2rx.c     | 18 ++++----------
> >  drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 15 +++---------
> >  drivers/media/v4l2-core/v4l2-async.c             | 30 ++++++++++++++++++++++++
> >  include/media/v4l2-async.h                       | 18 ++++++++++++++
> >  4 files changed, 55 insertions(+), 26 deletions(-)
> > ---
> > base-commit: bc0bfce7d0f8204e0bbadcee72e87ad9ec105c73
> > change-id: 20260210-v4l2_init_register-0e6d0adcfa21
> >
> > Best regards,
> > --
> > Frank Li <Frank.Li@nxp.com>
> >
>
