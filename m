Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011030.outbound.protection.outlook.com [40.107.130.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC76830C629
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 08:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769155994; cv=fail; b=TmJ5DszvGRxDKBr+wMe92bPeg0nnC3KEC2+O8UjlxrXJKATIdZ0cOt5/aPcjV4e01ijmVWDROhOK2vYBkkOgz4Ti9cWWJv/QDUD52IC7c3/zgjPS368x33efE7HpsBhndLdW8MT2RAXtTclllTbRC8I7ysJ2/+o1ZjnO1+kx47I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769155994; c=relaxed/simple;
	bh=0k9yYbqm5AteTtnQCGmDC9Il2OMGOiCggakzD/VmYhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Qe5EkJb9Jq1ngVs0IZqToqRu6ay7CnEqliJXZ/60ww6TL7rO8XrQOMtxSG1HIjGdB6qM85X2DGYY1Zhh+JzF3JUDOsawTcClkEmdHHpi16Lb6R/bBDYF36SIlSmyfDmZv3Lk8iRHp6FccuoPx3bH3jMGI+3QnRokdgH05OwUKkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FyaMpsfP; arc=fail smtp.client-ip=40.107.130.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FyaMpsfP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IjlJgh0JBt9dW9qJdBJcA8eKr23gCZmq4irmL+E6MWGEEXz0Cq/ZEHJ8BOwtvGxWewjQ5tXD1Nu3mx9OPdYmyvZ92ZRkc4fQL5nRwWRiPPdl6erIBnGF+BdMQP4NaFQYZmun4RpUMY0fetIpDOqJvqcb4q1XDwsvIZDAI5JR7WzedOuWM9k/p+3JWDGR06N91s3LMun5gVMj/FKb2ybFbv7zQH8ySrzBjq/mkDCD7VdHlZDXHjun6xvYdkhmY1/C6TcInr3hKRvkwxoQuAgURKokKuC2MDEDVoMKhQ8zoCucTN47rMroUKwZt1FHM079ExUmABYpmekyyF6tNOjUtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QroEcfN4Oeu0CQYLHwFgyZ3OLbGZF3KpIN302CnXCwM=;
 b=DtOVFiHOTa4RPmGjblK0hhvJxF98Xt7HEdiB4XV0BpRuxC3UoiR3op3gt9ASG+f2+p3oAujrel32sVpWMr3GBpWWjaCXFIFb/BswFG+dbA9/Sr9wOY4BHN7tpVuIC0ZvUE3hjlA8zc+FIDnksIPBOZN/5hDli/ibm79EZp19/qbrjytr6VRSSVUZCGsVFT5e06u+HCLETrkPgyo+6adLyHF7l5XFPHjJBpNVsTmaNAkA+0Q0eTkv3wYeY48MYtyk7lCYb+ICIQoAzN04UnTIJKMJXOKuYFUmucsbjZ2O3y8HOb1rD2Z0j8QdSWh23WLYjiStsbnDBvFwtwj42sQetg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QroEcfN4Oeu0CQYLHwFgyZ3OLbGZF3KpIN302CnXCwM=;
 b=FyaMpsfPWsWKrQyuqI1yaHDo4vFRuOki3NbJiBpyNqM+e5tEORzIjFX+9cJW87UY4ghGoHEK2R2UM1mSEtK7RcI3Lol4FIPxrPaPPuHsqN41U/XiU8IYNR7A7UJtNE7HRNeHWl77MzSGFoAqp0EZdzLfUKRtAb7SXHA7mtKBsMpV0tT8HlmZJ6wBhfZ24knjAhqlBqpXowSgUhdFzkg42KQYsRzuQ3K8FQamrOtiMwwmyAMPPYoxIaD1Qd6fF141aq8JR4QFHV2Pk+nPD+7syS+iwvVP1UWzh7r/IJs8/b1rA9rJgQV2W6u0lCpzESDEq2iXJwFzkrHZxYGhi6RvbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by PAWPR04MB10054.eurprd04.prod.outlook.com (2603:10a6:102:38b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 08:13:09 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.9520.003; Fri, 23 Jan 2026
 08:13:08 +0000
Date: Fri, 23 Jan 2026 16:05:48 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Frank Li <Frank.li@nxp.com>, vkoul@kernel.org, 
	neil.armstrong@linaro.org, shawnguo@kernel.org, kernel@pengutronix.de, festevam@gmail.com, 
	jun.li@nxp.com, linux-phy@lists.infradead.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] phy: fsl-imx8mq-usb: add debugfs to access control
 register
Message-ID: <5qogopa335bhootpiprw37f3uhxiftj3rqmouknyvyzrogrsoi@b4wfrxrebpzt>
References: <20260108083641.2119616-1-xu.yang_2@nxp.com>
 <aV/Qha0CQ+LJHo76@lizhi-Precision-Tower-5810>
 <das6ud7gep5hrcdn4bnmoyl2pb7okbxslpnawch2osaezd6xm5@psbizlufjec4>
 <6d27a8b1-1407-40ff-945b-927ef0a39eb1@lunn.ch>
 <fmdje7ftwna5vv5xrzt5e7hpv4juzwjurhvdzzrfeifaeyyblj@givopw2u7vmn>
 <06ae1272-9874-4ce7-9e4f-01d521a5f27f@lunn.ch>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06ae1272-9874-4ce7-9e4f-01d521a5f27f@lunn.ch>
X-ClientProxiedBy: SI2PR06CA0003.apcprd06.prod.outlook.com
 (2603:1096:4:186::14) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|PAWPR04MB10054:EE_
X-MS-Office365-Filtering-Correlation-Id: 49e3bad3-daae-4772-0658-08de5a573e55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xd++BCdogTHVLIuRYhALq7GMJuOhuQMTLQAXrNPnErk+Ri9isfqQ3ZjbwvT0?=
 =?us-ascii?Q?5fwZjhVoQbv+C9hS+HEbms1nxFJo6KCGi7jcVoUD7yX16jK5uKGepMsdi6Hp?=
 =?us-ascii?Q?4uDPjJQOtB3aLIYNcYNgU5++/7eBEUcVzcclXoYSxGKclvtZnzPCn5qpPNDX?=
 =?us-ascii?Q?Hpxk7ovstiEIKB7UunUDRkTcjpDDv3Ti+q/n6pQNoTJNcNEHHodbxpYer0e4?=
 =?us-ascii?Q?4Mlpj5M4tYMwc/XXUpGKKzBVwnYTeYCV3ZGySAbb86rWVo25TKX5v+PJOwvK?=
 =?us-ascii?Q?3AqdP9ms35gSNBbrAHMyJEVTTTgFVy0J4L5sbvpM0Gm+qF0FoYTcxuHietMz?=
 =?us-ascii?Q?lLSZXa84VVY7+Qagk003hVpW8WQ0dZgQygB1G0YGJXVhKyshcI84bc0ebGDE?=
 =?us-ascii?Q?dv6RbZWFR4eVm96jQQbQtaGIGOGMb60wqHx22ciDkhQbm+y9JtpCRNWhfq0e?=
 =?us-ascii?Q?dmuk2kqq0YTaAYceg0ZgqY/Y05QtkOSAQWkC0Vak1L/Pz52PAP7tq1L7Xug2?=
 =?us-ascii?Q?uTXf8guFYZ+4rvhPaMs0N2kBbeGW6znHQamo9dIBjyXiO+r8izt1fVCOp/qp?=
 =?us-ascii?Q?swLSNhhMqXqU+WWBu2wzN5IOz4Dmd5bvwOhiLi5N3V0dD42rS1Jr5SNigCin?=
 =?us-ascii?Q?kZAl7kk5ogJKAYLpJ3cc42gwI3Pb7HzKxtalC9q6Vtwj/bRz1H0kG24jvn0g?=
 =?us-ascii?Q?VuQpAi5yiAzAcmuHxgE5/XMnq5dSQTCqKTazKuca/cYpbfwaztbZuEv5iC1N?=
 =?us-ascii?Q?EZDm14E8F3Ixcu7BezVrvldjkrvjYc03adp/3a5SkG78enHN7AByqCb7ISDQ?=
 =?us-ascii?Q?20Y84C6Lfde5XaOT9d1IgBWPAPHGKdXtNsrM62GSH4BcztvMnjont4Kg9dTp?=
 =?us-ascii?Q?iTsMgZ7wvI5y7VHyxlHHvSmoMAtW0rBfFNNg2sM05ZWVmcfIEmVOFs3x1ko6?=
 =?us-ascii?Q?im7aUdKHNXpr2sVyl5F9cGHIuymAQT1t0cB+/kmBgBckDIdx8kb5LCkGsWLB?=
 =?us-ascii?Q?t4vDV/ucA6a8WwwZwGLjfzJK0SAAqSaVEJoofAitT/2/WbGih0RLAcrtp7ec?=
 =?us-ascii?Q?j7Cv5XIr04XJTgp0WM5bW1Fmhmb9FJJqT/b1yD0PWk4pa7bxs81fao+BMJW+?=
 =?us-ascii?Q?3JQm7Cx80f3QK9K/uspzVjkElvZNoYvYFZvbzmsAO6moCLQG2tOG6sGtKjBs?=
 =?us-ascii?Q?L1Lrt/HtIkbGmL+ftN8ELZnqEXU0Yq/yB368DaHTBYUD3zQheidocrM2tYKa?=
 =?us-ascii?Q?RMnPmEvEOHh31k50xDVTykkbld9QuGYQMMeld5c/BWS2vmxcG4bqquHOCMaS?=
 =?us-ascii?Q?zR/jG41YNbbNMbTVgvJhmLF5e/BxWi+X2XkeKQ7KCIYTWJSn3MJwvUJwDdSb?=
 =?us-ascii?Q?vHG+zMmsQ/MAcozAt07G/4Xsw2VYhl7FIM4n0Z3x76i7bNgNj0xztkMnSfdk?=
 =?us-ascii?Q?66RYueleokQ8zY6JcbBYtRQdfoS2Wo81NFRi1wn/Ziq7Ka114KiPjOrVJbmZ?=
 =?us-ascii?Q?uF2z65bRntPyxIPWcDqgfOo8gcGm3AkytM1JheLeGIOpJBl1P6CrLZWRf1Bm?=
 =?us-ascii?Q?qkfrU04mts1O50ncn+FLxQEu1XAi7S7plhaGCzVy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?+kFX+3K62LJFHlgwonHGCr9FbzDbWtTRlyqZy9iotzYgb1xxtpN1ad9PO5Bs?=
 =?us-ascii?Q?hZVQqtPf1+49afJ5LZAq6BbVhE7rvv2FGOp2YPiXU2im+F5MndhgerRdJjoA?=
 =?us-ascii?Q?4T1lrxSMH7ylpF2nfE21HvZl2Ji8WqKjer/q9WsB/PYLI99JtwFi+i3xvOU9?=
 =?us-ascii?Q?yFnFnzeTiTl25IMckvVoCCM6sFZUjENmYrXr0h2TgaerxC5JJc1M42/4Fo76?=
 =?us-ascii?Q?HPCvHPkJWUzE+jzaFb/kVstDa9YYzkCjNuNErmrvPSKabbcHHnCY+uzImhUh?=
 =?us-ascii?Q?H0ymu6DRWUOo5zjrINGl6bUobOd8JczHCkhZmJS1QWq53p+f9d6POf+Id64b?=
 =?us-ascii?Q?+UvGijSdbbPJ5bfRGUYReXhe7A6wt4BovxececbxjJtY9Bgfn+YxydaLojbE?=
 =?us-ascii?Q?iYXZntK04HDK7QsK4F326fopWVGF4zJFN6SR8dXpqFYpjijLvse1WKGh8s4b?=
 =?us-ascii?Q?2Vd33tvS/pOryCCC4UFzFzDj1mgKIJuAIIzTKxzRM8vVBWBfnVb4rQC7nf4U?=
 =?us-ascii?Q?Wvc1PiEFvONyuovz9MAaqLIs6ceNCTy+QkMsGIuVI2LeoC6Ne5aRpxpi3ZEv?=
 =?us-ascii?Q?qd6D7eUG+k5xxz5BGa9nPyZrN2e9Bbzk0AL0uKLmWvzyGwbtOKHWokYuVfIb?=
 =?us-ascii?Q?E79I0P3o5B2tkp+k7YyKHVzf+f2cn/4nsiFYzktXR3qi6iiasB/cmvdMV3AD?=
 =?us-ascii?Q?bwm74lA1i8C/dpzvt3o91sL+A2+3FxfR+ZfUxHS1PsXL+Qu4kwPIgVHNNBYN?=
 =?us-ascii?Q?bI46v0Iej94xsXqUDjnmjeWACLLxLgAh2ME+Z7ZXBtnxdIKhk5Vx/3eQT3mg?=
 =?us-ascii?Q?Kfup8vQqlfMss4yslnA+ySJsOXaAFhm369OSUwLy/nS75/LU1abeaFHf6dyD?=
 =?us-ascii?Q?PWt/tGGlqVbaqGhVPPmMbGngdNb2p5OTqGQVQZ6p20q2XT5PhHEA3QaGS2/M?=
 =?us-ascii?Q?aEfTB/bAi80GDepHcRB1WcIq0itrUXXL1ZQs5xQtTTfD+DjcVM6ZqlGXwqlA?=
 =?us-ascii?Q?nqdrCL5Rm34Tm7CXyOaG9Zg1SR1fAOEpqjzaZQissTEJcCh9YHdmJ+9HoJy4?=
 =?us-ascii?Q?3VO8ddcerUF9rBvhrDJ4AeI/z63lqnvU9OcMENindUwyUt51/V6OArleAWdO?=
 =?us-ascii?Q?ew5+UtQ8YNsLOQMHjmkXaKn/yggZIe0uPcpSxFIjDyGjPbSDA4aWcW1l+2tN?=
 =?us-ascii?Q?CPQGdFt2UZ47MUKfG1o4cy1E0lQG0r2KMAwyivqoNYC7oYeFer9bkUoAhaxJ?=
 =?us-ascii?Q?xw/9+tsXY37nfPIPktRJo5Paf7GdMv1x1iALriZJEYC/JJJFfZxLGcBSaEKe?=
 =?us-ascii?Q?hBM+BCXF1reV6/tcpZuef0NXymkrNIyIvEZqhYr4E7vbyd4KSXa7MXK470nb?=
 =?us-ascii?Q?72w4W5KOmndponXwmzZDU9FlpVigIMjZ0k3CTMxpy9f4fYH+rWMs6NskR0Tt?=
 =?us-ascii?Q?zJDm0WPggI8kj3xC96rBYPkeJV4QkguYwzgH8oyqyKheWhBz8mg5jKRx0QkA?=
 =?us-ascii?Q?n3S3YmnY78btig9vsPl4krY3K9vJIxAUgCc1+mPknRWqrby14pgQ615y8CKI?=
 =?us-ascii?Q?oOpY2iyycpr7uKh1hHyVhyuvq7QQNwF2YFh/2ziBBtTy3eXdRqME5Fvu2jq7?=
 =?us-ascii?Q?npHbcbjyFdVXbOfJM93INblFOtviiNAs60jj6xBAJKd7KmUy5AevPj/4xziv?=
 =?us-ascii?Q?BiMvG61Cd99zEYLk1fL9ZV8J9td73/wNDWCzWWl1W5dAOpQaSajzMKC/q9zJ?=
 =?us-ascii?Q?VPv903zW3Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49e3bad3-daae-4772-0658-08de5a573e55
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 08:13:08.9279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5kzN7AKqM2xBInUoanTB24yp8tqPvMHBUkFSoeN9qode3Cvzx2LYYblb4olTl7fgN3wAiPrN7c+OaVGqd+d89A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10054

On Tue, Jan 20, 2026 at 02:32:30PM +0100, Andrew Lunn wrote:
> > > Rather than reinvent the wheel, could you use regmap?
> > > 
> > > https://elixir.bootlin.com/linux/v6.12.1/source/drivers/base/regmap/regmap-debugfs.c#L546
> > > 
> > > Regmap should be able to provide a debugfs interface for you, no
> > > driver code needed.
> > > 
> > > This will also help you with the abstraction between the core generic
> > > part of the PHY driver and the SoC integration glue. You pass the
> > > regmap to the core driver, and the funny muxing through two registers
> > > is hidden away from the core. If the next SoC integrated uses plan
> > > MMIO, that SoC glue driver can instantiate an MMIO regmap.
> > > 
> > > Using regmap is a good idea for core generic drivers which can be
> > > integrated into SoCs in different ways. It hides the SoC details
> > > behind a well known API.
> > 
> > Thanks for your suggestion.
> > 
> > Using regmap is generally a good fit for reusable driver and I aggre it
> > helps abstract Soc-specific details.
> > 
> > However, the regmap defbugfs has its own limitations:
> > 1. By default the register is read-only, add write operation require rebuild
> >    the kernel which make it inconvenient to debug the issue on the spot.
> 
> That is somewhat deliberate. We don't want a nice API which can be
> used for user space binary blob drivers. In networking, which is my
> more normal area, we pretty much reject any sort of write interface,
> other than official kernel APIs.

OK.

> 
> >    Refer to: "09c6ecd39410 regmap: Add support for writing to regmap registers
> >               via debugfs"
> > 
> >     # ls /sys/kernel/debug/regmap/2-0050/ -l
> >     total 0
> >     -r-------- 1 root root 0 Jan 20 07:45 access
> >     -r-------- 1 root root 0 Jan 20 07:45 name
> >     -r-------- 1 root root 0 Jan 20 07:45 range
> >     -r-------- 1 root root 0 Jan 20 07:45 registers
> > 
> > 2. It can't randomly read specific one register with common linux commands. Besides,
> >    the read operation is inefficient especially when the range is a bit large because
> >    when you cat the register it always read and output all the registers. 
> 
> You are debugging. Do you need efficient output?
> 
> If you have a specific debug tasks in mind, maybe you should be
> thinking of an official kernel API? In the past, there has been
> interest in getting SERDES eye information out of PHYs, and being able
> to change the configuration parameters of the eye. Could a generic API
> be added for that? Some of these PHYs also support pseudo random bit
> sequence generators, and there has been interest in adding APIs for
> configuring them.

After an internal discussion, we prefer to simply export Soc specific control
register access regmap in debugfs and let usespace read or write internal
registers according to CR port accessing sequence. With this, no needs for
a generic API for now.

Thanks for your comments.

Best Regards,
Xu Yang

