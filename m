Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795712525;
	b=Tf33cDoJEpkR7N5B8/5/ZG36xBhLYKTquuK4s5n1H5ssBmbCygU9FnGRtNOkeZrmRQnr
	 xENBEC+0uZw47xsplqWnwJm53PMTotZfluUMrrxyg1m1OuSYXhIi1cEGEjEARJxi6KURg
	 mVH/+QwLdp4KBrCHqqKolvKoBSMcU0zzP3spcYVJxkiPJKIJSY+E66yPjBYarI9WRNdjV
	 h9kun104XEncJu607+SIu/DyS24odxgt1vu9xIhOSkP5htmsnqRFbOkswvVKzgaxgbtmd
	 v6398FIMe0r45rwpw6Ju5CulMhPfpJFGpxW4hYkfYt7ykesr5liuYk6rzJicFVAnmNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712525;
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
	bh=AXNr0yO+ATQIFVWPGb3Il43sHL4L6co5sizpt2ll2LE=;
	b=KBLf7ZqfLfMyqZB0ad6ZmZ32wrJE5yFYYHL1hnrDL34e2iLEq+qWXH9Y+7LzAYMtFWBA
	 TPdS7fO5PtheanGbXHBMM8W08QR2HI8VRxDsnyBwiI/nmsSEFNo0fcsee5qDQpGLu7o/y
	 U4T7tiFFB/+nxMdYyUNjgNXhNvflBOVV8Jbcdl3q47GEHnISkYHcviKBW6MDp12LMTjrr
	 kzJdKy+AQGLmYhpQmq5ceqEWzxS3t2eQzlygSO96NwzulPpC0SmV8jcBea4YjpCa/QmzZ
	 ZRaG4Tz5KNuw0j8ldySnh6PjFUXEfS0vShxF52sL7xeS84i/0Lu3u60nDkzjzeeaubA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ImFjfkDT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.36
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011036.outbound.protection.outlook.com [52.101.65.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BE3606A31E
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 17:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36BE3606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ImFjfkDT
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VMU3mvssOPuKjTPn0VjJzezfChlazL+XFJoB1DumNvNx/v6XqIUhViOMbQdb+7LbqC3JBLtMS5DdNP4CyNpyL5Y7Dr2wcw0PtnMNzrz8YcK59uvhrVA3LG/rZM/OkD2ef+KEiARFPigN0c15FI8alRXxOMLZXTWmxLHsK91ASgQC0BUDy+QlQQ0wzQA5lNfWxzv/rELbTqQp/acaatW/4HhgFatSD8R3P9C8HrJFccQZqZ/GfAk4o+Pht1V7uE0FdGbsqZwTg+CVfZvIojli5dEu1w7d75NdR0SeMOLLOMzgiKQUeXVjuaG/IdRJkvgNAKZ8Fkvz9KCEhE5R5INXTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AXNr0yO+ATQIFVWPGb3Il43sHL4L6co5sizpt2ll2LE=;
 b=XsVYVAgrldZ3vGM+FaCEGfUsqR7B9pN/nUUVnQmpGGcYeRU9JfHSgBXZ+tUZ5Bi7pyVIZdKsUxMUiF6BT+fR3bygkzeY/8jvTjFs119/1K1kANid88ry56t75KFQhAJHfReTOv4owzuyUZp+vuxStcncxCgQEeX9lnINPqQj+9QiazcZxtXcQjsd2fgAB3fWJIujw0S67yFTqxEz0koBsA/RXqj2AWsdn7mZ/CQaT71m7tU439LDAvnk1UiKfUZ2I97mRDfw2jHoTznPVc9LxUPFMgdtc3X5Qs9jBGELJIexk+hU+ANrrS2YEz4Z9IiT7mSEhSlxhcbeTbXl4TAPmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AXNr0yO+ATQIFVWPGb3Il43sHL4L6co5sizpt2ll2LE=;
 b=ImFjfkDTN9SXqRO7og4CLea3T4VzBDxwiv/akxQn+LejO1LIX0NLqVXvIxffK57W53hw3ZdvpnDI06TZDOwL4bY91/rsJ6nfpkDspfPczYsYWj6CuLUTh2KNNXruXAxlrkUTcDT8l7NBX7AgKGAuSh6wsbPCUmjaIMSA99fp99j9YrFduNkfHsjDljrvi6dSgNsit0s6ajMpTjhIDnSFUD/zZ3uT7hk+Yh9NxQVWp/wsARTRchio2NoxpLbatr1ehohRFcMIRUv+2rwMC0dU1AG+dcU0Rugo6QfyIfmjZqC3EsW1DP4nnZ5GcrU5oa9HDyiQGAdnfRRtDPoycECyjw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU4PR04MB10340.eurprd04.prod.outlook.com (2603:10a6:10:564::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Thu, 26 Nov
 2026 17:02:01 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0662.004; Thu, 26 Nov 2026
 17:02:00 +0000
Date: Thu, 26 Nov 2026 11:01:47 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux@yoavmoshe.com
Subject: Re: [PATCH v2 0/3] ARM: imx: Add a more agressive idle mode on
 i.MX6SLL
Message-ID: <awhl-wsYhZlC_VD4@SMW015318>
References: <20261126-imx6-idlestop-v2-0-c6987e7a392f@kemnade.info>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261126-imx6-idlestop-v2-0-c6987e7a392f@kemnade.info>
X-ClientProxiedBy: PH8PR05CA0003.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::24) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DU4PR04MB10340:EE_
X-MS-Office365-Filtering-Correlation-Id: 989131f7-6387-4861-d1c5-08df4bdefce5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|7416014|23010399003|261009223027099003|22082099003|18002099003|10067099003|5023799004|11063799006|56012099006|261022075727099003|261021135927099003|261022105027099003|261028144727099003|261026140227099003|261021123027099003|261021121427099003|261026121527099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	oi7N/lH9Gb78TEuojSKBqqyuaY4pq6VOshwRJYp5bUVHAMHKCS9sTwSTOOzIzdkt3IkWCy17FOvcIpclPboNtj8oiHSKZR3SjcOPXW+3VNA3JqRSIms4zchUdKEk4D5Of7sr1oxqR3goq7w29p8UB/Qb4UOJYXOzLbil88OSeUvB2nZGkuU1Nen83eP0ZqAAKRztoRuNecTC0MzQG79l98/esGimmH7E9VTzqPtsGLzARFFac/2TBHj2LEQlJycuuIBEMGtgVZXLoAXCxokP5EmL3MJVXO5vqbQTQ90nsix8cxD+a4mgjcdfeP2IU73j2x4v1jF1Evovj/Q1NFUXS5t0X7DDIKZMrSPcHXc2iZGikYDvIuVab/VzfyjpLXYEWLGUjDN9AN9TdP5+cDjDZ4SPMwwe59OZZFzy5/I43ufrhGw6Sk99uJhgJrbykrblqnMZWVIyoQmtrbnvoGACngiYsbNA1fkw5cqlkD6sp+zlPwuLlzFcPSKRHYWW+P6d/LGvHwlE7MTiy0ccFfC8gDvZLu5QnfqQgEZRTcS7tzjaFjBHEDsDfeX6FtDrezzvwXpsb4KixgFcWiYytHNdencSKQqTSJgjsbshJdvsh5qkroXbqjIz8H9Si/5jzcbu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(7416014)(23010399003)(261009223027099003)(22082099003)(18002099003)(10067099003)(5023799004)(11063799006)(56012099006)(261022075727099003)(261021135927099003)(261022105027099003)(261028144727099003)(261026140227099003)(261021123027099003)(261021121427099003)(261026121527099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZImMYJ3ri2pIT7CmmwmJIbV1WvDjfkl87WwaTiXkX6Nmt8DgjwNy9cFKT+1z?=
 =?us-ascii?Q?P7Uopr3rPGSmqTAXgJpR3DTj4CBdciA5oDm53dy4itag11oWnW4FZEg5s14L?=
 =?us-ascii?Q?4Ad1+Wf2sjHUdmAo896etfmcpRWavjgei8IcfPnNQ6t0HW6Pc+cEF1lofdkU?=
 =?us-ascii?Q?5sQByWfBH94GroWz4zMH7cU1L5DNTuI8mVvlKt+rCJFGCPNAcCHc8Xw52t1X?=
 =?us-ascii?Q?Jv7rehbHY+Oi+g6+qByIFag6U14Y2ViHlc8ivmlV6Mi4Wge8zCZlTmeHyQch?=
 =?us-ascii?Q?CGhTwypniLCilgOlZNJeZi4T3Pg5OxeMWOKZ92wWrle/Dn6Nm6Gi5Fx/QXdU?=
 =?us-ascii?Q?801pbtCvz1mPHygxAReEBrgB3VhAZUmw8ZbnA1F1PNRuVtGbCFrdPBeO4glm?=
 =?us-ascii?Q?dYX7amGC2Bg5SDK9yaQkkiMMTaU20Tr5IsWpcXjfhGdo9tL9DxpuHU7sVwj8?=
 =?us-ascii?Q?2VdN2KIgSiTbH+x7kevDL7VpHABwbBnZ6c6hAisCEDdFRXmn/zw40RGxRF63?=
 =?us-ascii?Q?ZSZhgGQJlQfTCDlHj3Buk4VTGNC9pj83PAU/oNALKH1+DFcV2Sl+jPBJWQfb?=
 =?us-ascii?Q?WAbAXdzs2fZwhRBZ6ERSpnmFiry0XACqMZsJRuia0/pEH8QCk8Z2l5mDhZBv?=
 =?us-ascii?Q?phaz39gcAzmZ082YQUf+l7dc4ugnzbez9Pj1kihqrpk7aLRXCQQtEaFZ53Gf?=
 =?us-ascii?Q?hakHVFFoZlsIvSMqTVvnO+iNk74dwFU2LZMTz2aBviFkc7YZtbIqvRQFsezd?=
 =?us-ascii?Q?/5FU4wxoL0HhSkqaAKgUHPS1ThwYRbYmEs/RE6LthY3J94xec8wRt+MLTMYc?=
 =?us-ascii?Q?6gKUB5keeH49EJt+wqGhWoO1xirXaJcdAgRYFjpmnuW+280/JpU8oYiEN8Qw?=
 =?us-ascii?Q?E4UKh7Xj/aRNc/HxVmeqH76u1h9dHLMdqNkIk/jwU7fM1I9xwsOVMj6j3ebv?=
 =?us-ascii?Q?0lH/jKIbmDPyhAzvLMOPLMLUT5ucyznb4gds+cwUxDc3xjk02BKC6OK4ZUN6?=
 =?us-ascii?Q?2XFowF0bfYqjkMobnCpxxWGZFjkESiVcZ4pKSqukPw8pAsO8iuNB/JSUEP8m?=
 =?us-ascii?Q?kb+HOKyUA9YyWcpkHCCR4kg0SG8ZFaX+O7naI6Je+WWbykfVG3wMhdKwR1gu?=
 =?us-ascii?Q?Ipsf/YVs2dprcmNSmY6SNfv8BM1qRyTXp7apbVBlXfHmV4KAJg43DiYqZ250?=
 =?us-ascii?Q?NGvsyhD4Klq39rFKu1htp0H/eDAF03L50bEV+14cyqXU0jemjz26XpnZnW0L?=
 =?us-ascii?Q?ZJwyWCyOVY3nTKGtro2DsMXJuhUgSccNx/kg62wjL7k8Iw1GsKcPFoQNCvlN?=
 =?us-ascii?Q?tBoNjPt5tjCexLsO8yxi6kWtWZAo44FxvaQEPRVTyz7FsKkAkiDRrQGmrwWf?=
 =?us-ascii?Q?i3TtArP9difXBGvu5SspKWfpKXtUEDYZbcQxpxqrIxMVVYTQfPdtf2dUjTNx?=
 =?us-ascii?Q?0bm2D83xHs9+YugNEzofMLMzgRrxVrXXLu1fzduGMxrcZZoPnHgW7R3Y9R9Z?=
 =?us-ascii?Q?d1rDE3zsOHkmtq1Rfz+e/x1DLg2VrzygSwJ3E0xoX1mpzpIDMPTd7VukQnJ7?=
 =?us-ascii?Q?LF73booAYZDHlYR4BYJh6hjFXQC5QUBN1aBvFf5O/rn6f89gb0B0+59AQKTR?=
 =?us-ascii?Q?4SCl93rWDWG94+Pm5Jb1ju2GrqJtXqcd7kMUOU3IdmlpbRyxOYiGovTzPG1/?=
 =?us-ascii?Q?yWViO/5u3QO7dSbPg10R7E0stEczMfll1GKE48zXQtbP3QKtkijkmdRk8ivc?=
 =?us-ascii?Q?2KPyDroZL5d0zjXGOjFwi3KQP8Vrok5yE9fOwmssZQgUmlM8nYlD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 989131f7-6387-4861-d1c5-08df4bdefce5
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2026 17:02:00.9694
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OvWIlPPX9os3ZP3OfCnrC+SL2cpubY10CvnlJIS+YwwWGy0DCdCCaHmQnAhj/6pZCjQ7vyzdO/4XaS17qXqW6239HdYi4FnFasE7owkK4DN48O6IAWQPKDNfybbKry8A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10340

On Thu, Nov 26, 2026 at 12:00:53PM +0100, Andreas Kemnade wrote:
> On Ebook readers there are often situations in which the system waits
> only for some GPIO IRQs and no module is active, all the clock system
> is using most of the power, not every clock gets disabled via RPM,
> esp. those are marked as CLK_IS_CRITICAL.
> A usual he situation might be mainly wating for touchscreen input.
> Since nothing needs to be sent to the display continously, clocks
> are not in use. Maybe some frontlight is consuming power, but if it
> is not used in maximum brightness mode, the clock system is still
> using a significant portion of power.
>
> In contrast to suspend state, that is not forcefully turning things of
> and wake up only on selected important things when the device is not used.
> E.g. you might still want to have frontlight enabled.
> Vendor kernel work around this by adding an extended suspend mode in
> which more things are disabled, e.g. the touchscreen.
>
> So rather add another idle state, which is only conditionally used
> depending on clock usage.
>
> System timekeeping is currently using a high speed clock, which is a
> major blocker for this idle state.
> Use 32K clock for the timer and the clock source to avoid that
> dependency and allow the timer to be used in stop mode if that low
> power clock source is used.
>
> Other things preventing entering that idle state:
> - imx-thermal driver: probaly needs some notifier block called by
>   cpu_cluster_pm_enter to avoid false alarms like ti-bandgap does
> - PXP and DCP drivers are missing RPM, so they keep clocks enabled.
> - serial console: needs to be unbound
>
> With these patches are applied (and the not-yet-upstreamed EPDC driver)
> I can run a loop displaying the current consumption in every 20 seconds
> for about one week. Power saving is around 70% in such
> situations.

Nice feature, but how to make sure don't cause regression?

Frank

>
> Patch 1 and 2 can go in independently,  patch 3 should go in afterwards
> since it will break things if the timer driver is not prepared.
>
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
> Changes in v2:
> - honor disabled idle states when rejecting the new state
> - remove redundant imx6_set_int_mem_clk_lpm
> - more comments
> - do not show new idle state on other cpus and when thermal driver is
>   enabled. The latter to avoid misreadings until things are fixed
> - block new idle state on dcp activity
> - adapt min_delta for clocksource if 32K clock is used
>
> - Link to v1: https://patch.msgid.link/20261123-imx6-idlestop-v1-0-e32f1f44e46f@kemnade.info
>
> ---
> Andreas Kemnade (3):
>       ARM: imx: enable STOP-ON mode in idle if wakeup requirements permit
>       timer-imx-gpt: Allow 32K clock to be used as a clock source
>       ARM: dts: imx: kobo-clarahd: Use 32K clock for the timer
>
>  arch/arm/boot/dts/nxp/imx/imx6sll-kobo-clarahd.dts |  5 ++
>  arch/arm/mach-imx/common.h                         |  1 +
>  arch/arm/mach-imx/cpuidle-imx6sx.c                 | 54 +++++++++++++++++++++-
>  arch/arm/mach-imx/pm-imx6.c                        | 31 +++++++++++++
>  drivers/clocksource/timer-imx-gpt.c                | 17 +++++--
>  5 files changed, 102 insertions(+), 6 deletions(-)
> ---
> base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
> base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> change-id: 20261123-imx6-idlestop-b14454a91e67
>
> Best regards,
> --
> Andreas Kemnade <andreas@kemnade.info>
>
>
