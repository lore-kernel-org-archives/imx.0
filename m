Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010065.outbound.protection.outlook.com [52.101.84.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3661A5B9E
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 00:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773361552; cv=fail; b=djTc8yivziqgJsCEFYQW8veXKQn9vPIpP+bcrg+k1g7vIl4DGQzy7Dgcms+IqTIB/yfysEALbzIXtGaA2kTB98uRSvhCq/f/uXeSfOBt7dZ0w3eh7FLuULhDxn3TmDpbwzxMidW/MZOihrkNtJHuD7pm4qQk+lqh3nA4RoM3pcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773361552; c=relaxed/simple;
	bh=BSMdPaSMn9Ee2qM9OxWcMwbr/NMuu1cmlNnK5y7WB+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ms2FULlmGoz48QEA5Pn7mSOuDXueWuGdFzi9oKegkUZXjGgDz1ckcpmKJ0krMGlc3SBCz6Zu5cZBnTsK9CXjtIbP83Wav07SX0BeS9xYvN9wtJ/osXRyKJMEdHnaiQFADEe2TDa0UU3+Oz/pJ32QquFOn5pmnh2uqLsUhbep1lk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=UpB0FIsF; arc=fail smtp.client-ip=52.101.84.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="UpB0FIsF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=agz0fQPOpPEY2y+urgwmkaDHkspVT5s48BeHWgGrLVwkOeIsyi9ffjulAPTgQjyq3Blf3XFwZif3N6BL2w3M5MHXh3/nLLpheMIdcjeeSkzFQOJcD/DOEdNv5+wVhhA9FcI1UI9W0ECgmL4x9XFBipE9PMVG3V3grizY0pnVZty5DYBQOcG/DiUC3S70yyBvJNW0WP42tGclWYIDTKXaFKyRwbzu9yWzZcvbUJbeHPEPaC2aQb6gtnxFv820lJyriIrODirtkzdE5hnbMD/HjSR8FKmhv2JJAuz3HHxMDh/axg36l+yAcFVzSpe8TC3TPH7D4s3uF+J8HzupfaitvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnTp1MW9BnJu+Ck3dyNRCmyudfxKNXfUKniYUXeC1Bg=;
 b=TtSLLOa1axSLf0TgGcNwjE+/YBHz3m3cm5Cp9PAmSz7ZoxoE/aSXcyB8Vv7rk3PovMp+Kpz3xR18V3GIL3xw8ADQNqrIH3yx2N8YDvWul4tf7lR45dW91A/gtVEc3ZruYDUdkOjlKo4MjTjlUA7+fyB0Z/2VSJDjbYT6/M5Xdd05dS80BMI3tm7fgh10BClIlR0kqrjrnTJZBTVCbzfeE0Zc+JMC7b1Q9ZyXhiVDKTUtJuJSZlWb0eh4w7tD2y/c6ceGrBJiPjO+s4VvDTSnjlplUBk4ITCcWqypERfzIXHrZQ6vvyJ/xLCN340KL+NnSGIyllLQCuYp91yOeWHwng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnTp1MW9BnJu+Ck3dyNRCmyudfxKNXfUKniYUXeC1Bg=;
 b=UpB0FIsFvkSm/7V+izTrmEn2WV/DOWRL/9oiDvYumjnV1rbwJHM8SMe4XhccTRdNv0eqbsCDd2Y4gFjDmtp0aHEBWNUSjbBJiT2HFdR1z7wWzh2u4Ory4ihCKkMLVGlGwdHL2tpSCdHL3dVxJGg3iH4Q45MS7JyHx/AHlDMEiKMu9H03ribHv2bgxmQ/88vos89Xmgl2GjVih06AHgbCLkcJtQ9VYvtXbKCHPqLfCdnwnCNCNvLpZJMpwUG43t+NKJrUCbikc4N7ufjE6OETVqsr+2gZxFPhP+9yuYWNSEwnt73wkIOPch/DQKv7qy4zH5u3JIjK6udhauiUhwHHgA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com (2603:10a6:102:c5::5)
 by VI0PR04MB10496.eurprd04.prod.outlook.com (2603:10a6:800:21a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Fri, 13 Mar
 2026 00:25:39 +0000
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50]) by PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50%5]) with mapi id 15.20.9700.010; Fri, 13 Mar 2026
 00:25:43 +0000
Date: Fri, 13 Mar 2026 08:27:21 +0800
From: Robby Cai <robby.cai@nxp.com>
To: Mark Brown <broonie@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>, lgirdwood@gmail.com,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] regulator: fp9931: Fix error handling for optional
 regulator
Message-ID: <20260313002721.GB1440672@shlinux88>
References: <20260312040148.GA4007088@shlinux88>
 <20260312185854.75e7a7be@kemnade.info>
 <62d8a4ce-bdf4-4629-8669-5f6c3e07a699@sirena.org.uk>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <62d8a4ce-bdf4-4629-8669-5f6c3e07a699@sirena.org.uk>
X-ClientProxiedBy: SG2PR01CA0163.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::19) To PA4PR04MB7821.eurprd04.prod.outlook.com
 (2603:10a6:102:c5::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7821:EE_|VI0PR04MB10496:EE_
X-MS-Office365-Filtering-Correlation-Id: 921c359f-c54a-4346-c72a-08de80971007
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|56012099003|22082099003|18002099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	0cEvMxKx0fP6z6Qdv+hn0pDJZsVsaV42cuf9MpGFsI1vhkykfusYKHJkM8vHr6Lx676TqMW9DNwG5mho0Yk3DnbSAb7gcBBdlYkd8azxZdlXGL9eGHFWvxaQG2/DZqfBKjZ7B4QDapDiThM6AVGVOPAKk8cxiMJaSfCIq1uxgpMlayPLWQch0m2ciNLG+xFC6T1sn3/iWpO8+w//joEYPLVgBJ/O7DIR9HYOJnik8abagXqoKBKitSXgkr6jows82q4TyOBaejDpz/7HSx4JxHMHOp3RrMaABw8Wzewcro8D4eHnSw0tVrOu4rMFjG4waZcrNFYA0svrKQuCFogsMFwUBWCwbrjTZtlRHzhfkOASTGkfx76wkCPx04R5fe7E5B/+i5QQk3c6rcWcAPyCyz0/tOP3+2riEiOh08ZdncYBh0ueZqaI4vCajef/ENJlCfyM7thN3piD2IB9go5KlZu0awz+q03tlfiKc0fCh4dZYBZ0yFHV7+0NPztiI9stSkb6BpQLFpDyqY6H26hX8p4kFJNwO4NbZGG7AYQL5ZEmC7hlpruUWp1t0JLbLJkAaR0yOX9tv+uJRWp5/Hui+skbIUM32VxnJ/8Z/S2MUZjh+i/ZFTq1gAa4lJA0AEoynIrO5GbpPRT2foWx2DdOY0kimFU3G3cLkR2/NH6yBPy5ejkil0HwN8wuQEXelPlfsZhjVQbA/jDsCat6fJwe8GI8SB3M+H5bmkNkzN1CmarSm97Y1V3nzMZaqzH8fGMOTlQ2F2ZxyYCit1eYI7p95vrE/aE0w3/vBpFKIECez04=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7821.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(56012099003)(22082099003)(18002099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sR5BBZR+YCHHhwz1yHGZAAaVINBpELyf4slHM21+ahDFtRphPASmzIpNFY9u?=
 =?us-ascii?Q?s55HxRrFvkKdo5+c7ojxI/hPf9Z1ny/B520Y9J6anMgmSZC7gtTcq+nJYZEz?=
 =?us-ascii?Q?OyvDAEo9b4lk1dWdVkEPjMA3sIfYMKFFlodWRiAPCYC/no6z2MJ07SpyC2kS?=
 =?us-ascii?Q?qVCsTB7HW5Ihifba14o26aUkx2bPnEt2oOXWCkLRrmTeNdaRrfVAZgq7pG1D?=
 =?us-ascii?Q?lsDZ2HIGxm0TCBo2F8GBePv+ekII2iG5cdUWG21UKHKfbief740BBl7Ni7KV?=
 =?us-ascii?Q?CZQ/tIDnmaVi5aojd64yb2Rzw7bw+Q0vVFzYIMZFiJvlSbBNEIvYrA8KgurJ?=
 =?us-ascii?Q?dLLBagBoMkyX+V30SSWECL8WfUmf585Bi+x00zZ1IbRRExlj3mes42zPL72b?=
 =?us-ascii?Q?bDAUAOc9agwGsanKmKZcXbku0oTt2382OP2FcOWiZ+fsgpRCoRnbbrsPE+AI?=
 =?us-ascii?Q?dXAzGVU0qa3Dn7lig5yJjaVvYlGq4VPgJIEuxOADEx8ftwX4yKisSHX+EGbk?=
 =?us-ascii?Q?lyjCyKW8NpZQLzainph3VaN6vFRtFQO9+ugKsBQ7RHYGfayW2baAFzg+FzGk?=
 =?us-ascii?Q?whUcQwBgMn+N8FLJCl6VwUzvqYn1k2SXUwUvdGLhWr1J7gij4XGTGCueyp7Y?=
 =?us-ascii?Q?x2KwxiIefOUVg+drpJ1nUtU0O1JxFPMeBGFkEwL5mzQm/fd0WJ6Cdj6fxSgO?=
 =?us-ascii?Q?QtlwMnxYhoMzQVgy57lyx0xirT6ddzHQ7PKpftKpeEJ9vog6HWNFkViGWEah?=
 =?us-ascii?Q?k2sbzoXJ6LznA1rAuNQdo4X1G6awHUiKrDGf+fvz/wcqy4Bnw8OG71XrHTbu?=
 =?us-ascii?Q?u/mWtqvGYHWHxzZtOlNHHgtfCUQl+LD3jmlVTymVdo+Zp7yPwNXLicUDbRGk?=
 =?us-ascii?Q?Fm6Pl9eHPrD3OVIantotEKKE9YRzXv0h/lQnhNY4PaStY38CmoLQRXUBkUVk?=
 =?us-ascii?Q?JG11dHyRbwPPsFEGJJ1eoH2YKCNp1JGtPJjnGxIaqGMWz7a9q9G9f5klUyfI?=
 =?us-ascii?Q?AVMKSlaifHPQw3l+q4hmIEsiYkgz17o/OSdx6CJDxHu6YDPCPNUlMS4x7gy7?=
 =?us-ascii?Q?DGy2agUQ7/d67OEqTnRcVC7d+LmGKBbokHdr2Sbocjuf5UEjMLPoPNJ6Om1C?=
 =?us-ascii?Q?aEQaJawz2Cf6iuK3uGFiv7qBrsDddet294yUcpWTL4mkAoka3Q25+H6b69TP?=
 =?us-ascii?Q?pjwlKbbgPXZ3r+6OcVJ3d2oNCKjbuIeUYhFGmDp64nqG56079V9cldFUTSXx?=
 =?us-ascii?Q?z+2eBAvEcWzqzkSNCxaNxdnrXsYVAT0b9hjA4Xr0uS+vWfaFj9dNzqu+Obzv?=
 =?us-ascii?Q?IOrew7+2Bx2WOFh3R+NKt0bOc1hJwTfrk2PTdL0KhrRUCNrDTfL7OSk+CbGJ?=
 =?us-ascii?Q?mqUHxLMTSQX8RnGNxRGStDiCBz7U5K08JkDB/Si8ho6YYdmGviy//Wj7jMld?=
 =?us-ascii?Q?TVF7FtLovFsTCtaL4BsmLdsZB96pQXRxuqSMFrLCYbyRXHdUZXdlZ4QPdrJb?=
 =?us-ascii?Q?CeCQmJdPm3NHm+fBzldYtJN/qaQVoKzciZmfF3pRc8rhJF7MxP1aw+MBWSid?=
 =?us-ascii?Q?VfM9Rf9o7ASnpgKBC60fUJee5s6bmGUpCZiYyaiRQ+qfGoNIGQHLJaPik5Pb?=
 =?us-ascii?Q?6okFCUHXWKipAQTF+1jcMlFGCCk3jLOt7IHLLl8INs7shq5y+KgkFBbdgGIM?=
 =?us-ascii?Q?gubrZklYanhjaL3s+OEUE5D56NKZmTsg9Dfia5UdlTbR/Uf4rlF0h/l3u6N4?=
 =?us-ascii?Q?nO5FnsBxgA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 921c359f-c54a-4346-c72a-08de80971007
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7821.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 00:25:43.1749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4fFmoYI7dkPXLz2xfdIVbmrLkr+J6THsq/InG7pWd9ek4R+3rept6UjmAm2sNA3DYNEuJyTMsX/lviLON0EOwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10496

On Thu, Mar 12, 2026 at 06:00:54PM +0000, Mark Brown wrote:
> On Thu, Mar 12, 2026 at 06:58:54PM +0100, Andreas Kemnade wrote:
> > Robby Cai <robby.cai@nxp.com> wrote:
> 
> > >  	data->vin_reg = devm_regulator_get_optional(&client->dev, "vin");
> 
> > looking at that thing again. I think I have abused the optional api.
> > Of course this chip needs a supply. It may be hardwired so something
> > not switchable. But that needs to be wired to something... So I think
> > rather the _optional is wrong here.
> 
> If it's a mandatory supply that's right, I may have misunderstood what
> the supply was doing when I originally reviewed this.

Thanks for the review. This does make sense. I'll send out patch v2 soon.

Regards,
Robby
