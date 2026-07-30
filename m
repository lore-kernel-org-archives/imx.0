Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013050.outbound.protection.outlook.com [40.107.159.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A556943E4B5
	for <imx@lists.linux.dev>; Thu, 30 Jul 2026 14:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785422632; cv=fail; b=s865/EI4aGCdshRLBI8XBhEDRB6BJuRgujFHZmmLVSUu/obMJIXgWYcqJEdXDg3u2EZjIJYpgniAD0mEDFR5D7/XnDmvmkYn+kZ+je0aEpZPD8VyqkUyNEWJEBqm2HHSIoljZxk/o3zO4cL/+pUrC1vBa1ly9Wzpq2kfQ7aq96Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785422632; c=relaxed/simple;
	bh=9YI6zK7d25BjqGEuCBBw0tYas/CDuopH5qJ+tLKK43w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IzIlBEHPZmgGFW2KOCPrMFFz0rKFK64sO40fDRCRHyMUliW8fSIzxMcavq5blXnkaMBUH1a+yvkEo6HfFJGggPG3r2gVEFtjDhW6cLLwpAI/jrzVIFsYVuuFC4272mH4jY3pgmS/6ymRV687ycappsZmN9+cmElaOVbv6lycrx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mZKhXz0k; arc=fail smtp.client-ip=40.107.159.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mZKhXz0k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q4GUVG4H8trSivl607VSNFNjHHPCPDJqt/nt1C9bm/uF5Q1dtJdkGMsKFHA8IqHxhJlCpgpqe+uPU7KX8DybVb9mGrLKUNtAYmssnWBjectVZhYYQLIeyc4vQkfbpPX+5ArF5NKyS12w7kX5QGGg5n2SqmaNRHKhd5hzqy0+ndJzWwTGqhZ98GcrNgn70axCExLWC/7REm8bMOlz+ff8zdKoVLNay6ez5VNktCdIZX+neVrU5l0n8gE3aSgpC1fqxsmzZvKRQdx9OZHxz/mtS6bqx3Mb1wRDf+8Xv4UC/IdaIVE+Kbbo6UW/vT1UgP7zbru03cAugVYs4LHWyFSorQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjWELmHh2pOC8c61+gjgituRO6wV/gzwHDn1xr5BjfY=;
 b=Wux14klIlWjk6KDCEGeuvj/Eee9nO0LHCH+KnOqt+Ph4TRzTqNTrXGf3VbI+b96O/mdYtxjSJWFukLq1WtQNTUZmLZ85ZHnut5ypU0eBc9cwhel0PrxTanZ/CVT8wtnQ3C9+qTu52MflfHXFRbfPMfGQAKms1weVV3l0GLHIJQFmMTpn9FcwAoj33gmPykVJ0DglepSsybSr9+yimnfB3Y2ZotNCXumxtfXnKhp0FF9ktY3QzkoRleMRKRkpBCanBYB91AbDJQnbYT2eV93yqHrjEhAYEP/hZ4o3YR9nUvuK0O21BUAZZG4ms4w7Vt0mOyG0t7PB1F4E9jJ9RCZkiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjWELmHh2pOC8c61+gjgituRO6wV/gzwHDn1xr5BjfY=;
 b=mZKhXz0ksfHfqECK64s70CptalLFNPwV8etu0bHTxT2OXhuqTVN7EZ4cSeswU1jy9Q+967kp3tuJEXpoavmc8Ty0oTO3H4TIbnEAI8BLmzR+pbxFQ26JMqVaTbxVu/wy1yCZ+y9UAuLDX6yH/QmRpb0ptQpRp2x9z7J8LQog9hBJ58M++KeB8ngohdO4Ny+wIwbyjUk03UMdlJ74tRMzXQCFDHf/SPzGDFkwT1K1Z8LZYOmmJgzs+aL7/QmayFtzeSy5TwrDC7L+qg83plMBKljsTx8lp1HX0wA/HgvsjaBjdKw94YOjN57AQcj1ND3Cl51U26dEK6Gf6PzOqymVPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB9141.eurprd04.prod.outlook.com (2603:10a6:20b:448::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.14; Thu, 30 Jul
 2026 14:43:46 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 14:43:46 +0000
Date: Thu, 30 Jul 2026 09:43:37 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: soc@kernel.org, arm <arm@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	dbgh9129@gmail.com, geoffreyhe2@gmail.com, griffin@kroah.com,
	lijun01@kylinos.cn, Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: i.MX SoC Changes for v7.3
Message-ID: <amtjGe75KC1RoEvZ@SMW015318>
References: <20260729193402.533533-1-Frank.Li@oss.nxp.com>
 <8723f44e-fb43-49ef-b7eb-64267216f53e@app.fastmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8723f44e-fb43-49ef-b7eb-64267216f53e@app.fastmail.com>
X-ClientProxiedBy: SA1PR02CA0009.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB9141:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bfd29da-b8b8-4c57-ad72-08deee48f5e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|23010399003|10067099003|4143699003|11063799006|6133799003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Sopw8wOs951HqVCbAnOEds0xLbkVI6ytyLgzFRKQnSua2j/udTwm+XKuTWgyr05SWWr/8XVYmV/y0LTi2uIkSPsJlyErZZNW5RHO2fHt1Co5VaVzIH0ljWGO4sRTDDx7sswwD13GH7bcJ0t6phSi3MhkThJ6okXCgLrZEVqFEdCD40RpoLquKdOS1Ed44DMorwKVBI1fnhXc9zhf/DDZNvx6ZmmWEaSPXanbXeNfiN4YtBg7mZLWfH9IOOowdqSBPqrFflGlTMaWWNKE9xYlK8e4PcNS18ftuXs23d3KFp+0xlEvZlVm6VD0V2KcWcjqOSpnpduziE+gX/O65XE4qRLae1Rm+I7Fuhtr7aJDUIC+PUAy5ctBvJdEBo7vJObZmK/ue3mQo5+6/llL8+OCcYeZIRE7jxBC28uNT9jzK2ItbLK1Aa0ElzI/QRu2hOafV3pe/qGYve/Tap++4FFqMNCZehSEzbuJCR+FhS1VGoFTKRXU7Hz3oUmiZ0ECO18Z3Fub1VeTkpGZff15oUdpp2+5aL9dKxC8nZjPZPbpYoTBydGqkBM8prLjwDPPH9imwk1tM9AJIzuVCpbL2u3gA1MRhqj6md4FGSaSi0SQ5aGcDs+Ui1LE924xoeJOcgvG0Ix+SK84dmxCGU3plCHHqjoIqtIe5AekQTMZC/qU14A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(23010399003)(10067099003)(4143699003)(11063799006)(6133799003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Isqo7S71BvJUHo3WDAEsmNuIlRDUF/MVcg1LMwB1WGSVKOsX96+M/4SfGJhK?=
 =?us-ascii?Q?vusgkkbdWlCJUqQa5H+w73t52lqsVBriDN17NGlHJTfyC9d2i/GmnhvlWsRv?=
 =?us-ascii?Q?Qkd53k1ewHulafXGw5wtp7zVGISaZCWB4s4DcfRfXOGBqAIqdu3nFBqm9xnm?=
 =?us-ascii?Q?zkY2HvfTZufEBwKkH2zTMMYw1whJvbZBHrpSfYJRFSOW6R022ZvSlCLOb1KK?=
 =?us-ascii?Q?n3WCevp1TpSvMJNdEaUBdhbxAdWIH1JR854wughPIvfFJFPsmhTRPex+XLXm?=
 =?us-ascii?Q?gyXoRONvHrqiLLf+Jhqg6V45QQtDv+lCsmu5nyDW7Dt3/S+R/MsDo/IJn/Bz?=
 =?us-ascii?Q?hJKnm3VWActCQfkw9wHQ8fnrBXbHMVuoJmZ5lUXV0LhkSe3vSQRA3aOG14OQ?=
 =?us-ascii?Q?vIdwxEgiouph40L5p3I7rQt9LuoML+VezeXZD7fgKUSgrWRzD/GSmmiHWNym?=
 =?us-ascii?Q?XRIzmXjJ4ygoTEzYicMewpeBJRw1lwsiZuB7KRHRlFB9QqWSf31whfpGIxrl?=
 =?us-ascii?Q?Brp+iN72P5QxskXCqD6g72nHyNBqhpjKOq19AOybJWv5MC8MnB2xmNBzYz69?=
 =?us-ascii?Q?YcGpBSFhH7I3RcmLEP3yrMwCCXXZQhSkDTfw7nHfkqGo5igSH7gSE07GUUuA?=
 =?us-ascii?Q?Owjj92gv0eE4GP1sBgn1/MZLT0mz+7t6ztb0htFDmqssy/SEw+UdZ8b7bGFx?=
 =?us-ascii?Q?UAm58HBuJUgGeyiyznOeE9VIx6QGSJhxFZE8zQyAl0yZ7DKC8C6EXxWLYn0x?=
 =?us-ascii?Q?CiER66yUhb7t+USEaW6vqoaFvZ6pUY0DuD4kxVybnhNFzc0gul39Q08fFr8F?=
 =?us-ascii?Q?sqpMAG+5tSD8ek1zs/bYgwqiRF0ylIITFDgkEuzBPhCHlITg0rxAIdDMBfGn?=
 =?us-ascii?Q?nEL3WGyT1Vm3a1MzzFuKXVsA1YXpaoGjTqzI9QtO7+FChKVHXYMw5Bi8lggs?=
 =?us-ascii?Q?EMCz1fiInvFrfzaTXcJHpiC+j+1nRW6i3VGOw9CmzJ6e4Mt7RRtW0XecBT/i?=
 =?us-ascii?Q?Vj1J08BAzJGKpwDhjbjbU5AFxxXaUq11g6fMbbESojJ8gCtENgb/MgIUNcCU?=
 =?us-ascii?Q?bkuH83d7H4BrkLS8W3/IX1RbGOIvCX659MvXuOojPNrl/AvEiTzdVExElvdA?=
 =?us-ascii?Q?1o2ZCd9Z54Zo9cHR6+OvSkqOjAw15JlA8d0ZmwJOUkcWupOtKvIZI+Hp+aLS?=
 =?us-ascii?Q?gDoSfyax8+SRS25o+uNN84elN67yAMZlxC8pHM7zfm4RFMSlnSnMTI0YdlJz?=
 =?us-ascii?Q?gLKlqHCa2k3FOb5Y/miyOKUiuBNXQUReb9YIn+W7VDHJwAS5FGxWmtoPO8o+?=
 =?us-ascii?Q?WB1ZdivcPfgsqdEBVk5vOMLzI9wUPDWVgjPtXXHGNkTPUrHlewOljA3+Nelq?=
 =?us-ascii?Q?2TD/HR2w1Aqs/NzaPZRCmliWALPLNe8gBVQUe02n/FW7/qV0jOW2cL072yxD?=
 =?us-ascii?Q?GvVTdUu0DCBZl+VRtO4DD3YFhy/BG/eJ7TqPZEjWOcer8wOLhotF/mh5i3H/?=
 =?us-ascii?Q?TwW5OPqmqH1y5MvZn+wZrUjL3WO6GCmGhS9KTtyIhpLfh3ZEl7MlvhMgdYod?=
 =?us-ascii?Q?fM3j3ppmCKqSX+IBmxazOPCt9lMyU0WHu+qnE9hwffIpqEWfBb6bIMPCm636?=
 =?us-ascii?Q?VdoMauLE8ZOWg9stlKse7FqzcHZL7T/dQmN7jW6uPt/hC4lp6NlPQgk97lrZ?=
 =?us-ascii?Q?VIdGPy6Kn28x8H+puUvBB8p38jrhW9y/ChFTU7TJO97E1Rm0LUITJRSVyhQ9?=
 =?us-ascii?Q?SVncg2A8lWdY0Aub4BSUqbTTn3Q4z1Z6j0b8z5ObJsXk8Q/daWhw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bfd29da-b8b8-4c57-ad72-08deee48f5e8
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2026 14:43:46.6706
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XEVqPLO54Dn8gD7ha9QgsPYAGuXIXbiUZtKaCf8i8GssH+UhY/AiaNK3kaYOidRA/TWBpTwuvOax6ud5FYyQxM5ukJk3/NQ2rLref5b0N3sbBmVwulRPi/FuDwZZRbkZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9141

On Thu, Jul 30, 2026 at 12:28:53PM +0200, Arnd Bergmann wrote:
> On Wed, Jul 29, 2026, at 21:33, Frank.Li@oss.nxp.com wrote:
> >
> > ----------------------------------------------------------------
> > i.MX SoC Changes for v7.3
> >
> > - Fix OF/device_node reference count leaks in imx_src_init(),
> >   imx7_src_init(), and the AVIC interrupt controller driver
> > - Drop obsolete/unused declarations from `arch/arm/mach-imx/common.h`
> > - firmware: imx: scu: Refactor mailbox channel management to use a
> >   per-instance handle instead of a global one
> > - firmware: imx: sm-misc: Add NULL check for `kmalloc` return value in
> >   syslog_show
> > - soc: imx9: Add error handling for `devm_kasprintf` return value
> >
>
> Hi Frank,
>
> I pulled this and the other two branches you sent yesterday,
> the contents all look good. A few minor points:
>
> - The soc@kernel.org and arm@kernel.org addresses both forward
>   to soc@lists.linux.dev these days, so just use that one
>   directly.
>
> - please split the arch/arm/ code changes from the drivers/*
>   branches, since we have separate branches for upstream as well.
>   The changes here were fairly small, so I'm not asking you
>   to resend them for that here.
>
> - It looks like the automated patchwork bot messages again did
>   not work here. The git://git.kernel.org URLs failed to work
>   recently and I added a .gitconfig insteadOf rule for it, which
>   I think makes the pwbot fail to match the URL and not run
>   its maintenance scripts that update patchwork and send the
>   email. I've removed the rule again as both now work, but
>   you might want to send https:// URLs instead of git://

I will update my script to fix these.

Frank
>
>      Arnd
