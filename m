Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011070.outbound.protection.outlook.com [52.101.65.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B693E3845C7
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 21:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772487353; cv=fail; b=Zor95hF3L5X0VqpINmRQrdcupM/Fz6ghJntwnUJ6rkAjHHInw4OE0dX2mpR2MhPLz6uBFYjx8FpIhBOouvfWDKkKVZ9sX+HYyKMSC/bAb1Aq6xzCV3qlhaqPxjZeE/igmG7Ded1MPeTsz3Xp59YWecjqqYqbOK3eEv52jr9NAgg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772487353; c=relaxed/simple;
	bh=Y2RSGMwuHnwIju2EY5ns/q7ffQfPFB/vBAF+Nqa2SIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XmhYS7SWV9h1wC5RUFsazcHdNpT8hGqjyiDo/p1OWD4UTgWWEurHB/y17wtS8XQK4f/2/z3xQZXBXbCi0XDd69cjMRc6i7gFD6L1hDD49g5a08xzjd+8iL4NUsSORPvKL9uEXZyvNbcGm7/PSiqWciLrw7tbJxYEeaNVWM0plfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FVBnYxBj; arc=fail smtp.client-ip=52.101.65.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FVBnYxBj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vH0XFVeImLungl9pUAG0G/ZKSIHhsT2DlCDCdEdfhmhZE+dryQMvRIqsWNaJ6VfHXgysctBbN6mO5CND6hUIIYzU2ttp1Lkyk+NAYVBuNqJOTMEJzhfvIIex+RAkoKfptX8x3iEG+t1lWlrO6zmQsh9qk/FSebi9lU+ZfTOEDtmMC4XANeapLaopmRbcbGs43xps7Wu4prNVEgEJdM8fqjByI6fmjzdFeHd78tPrIanTN2bzBWLcBiDX4AHmpT53kKNumnETlZvnf9MR9TSTe6hBGhEtlGjE/xfaFyiy91uV7lgxLzMzl+6ogjaE05a9UPOPaKp+iSyYCDzTRTjJVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y2RSGMwuHnwIju2EY5ns/q7ffQfPFB/vBAF+Nqa2SIc=;
 b=RkX0uFhCqaX8995RaVDnOIOthg+ltERLJ074apbShx37Akltd5ZgleD1Z8wOhkARtEYBZsI2JzBlVQbqqwbgW99o4vShC6cXUwfzliNDh5wu1EfsjBNEq4dBubNH/VPOcu/33PUdKSZ9mOvL8nBOpnk5NTg2LN+730K27ior835hVMIQsTii3GjnFGmHrqD1jcwb1DovdMks31O+QEfWWM0nC5DifhoqscKdf3Pi+1aPRwqw3AriQQIWlClENaO2Csd1mhTlXoy7h5m6+tVS8kGhZto9/UJaho90Mg5s4cQ1DAgesGXsgsbqp9Vu/1yuXzRwNsVnhhqGwM134tpRSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2RSGMwuHnwIju2EY5ns/q7ffQfPFB/vBAF+Nqa2SIc=;
 b=FVBnYxBjNAA08PZTnd7VuG4Bk4MR029hNh1y1CHzY3u/6Xq0zCOmyuILjIHkHKHntA8RgAdxS4KAMPvmgrAWGE7WVAiSQ5sWJTp7kDrwlE5MoGVW8VTddpK/oUcJoHPqnkdUHkUrXRcqo2XZkzEIlkzhSGS4sTb3JEI47UHinJsVbo0bEMEoJGNEgtIDhufu3QJ5uv7oc2xER+z+WQWoPD6fi+Us8sPJmIH6ZAv2apYUjvSTIuA8X/JyoNCDH2vJTnBi+ShhGc4kQFsYFyEPEHPISZ+ez6/7X42R3N0RXt1Q7fWCexSZyxqqjxiNQsg1q7YyrvZGpwAYYBB26uVnLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB7666.eurprd04.prod.outlook.com (2603:10a6:20b:287::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 21:35:48 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 21:35:48 +0000
Date: Mon, 2 Mar 2026 16:35:39 -0500
From: Frank Li <Frank.li@nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
	festevam@gmail.com, alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com, primoz.fiser@norik.com,
	Markus.Niebel@tq-group.com, y.moog@phytec.de, josua@solid-run.com,
	francesco.dolcini@toradex.com, maudspierings@gocontroll.com,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>
Subject: Re: [PATCH v2 2/3] arm64: dts: freescale: Add support for Variscite
 DART-MX91
Message-ID: <aaYCq-H0NSuyjFJJ@lizhi-Precision-Tower-5810>
References: <20260205100125.9095-1-stefano.r@variscite.com>
 <20260205100125.9095-3-stefano.r@variscite.com>
 <aYSzgRRGewX6uSlc@lizhi-Precision-Tower-5810>
 <aaW7EpLmhxk3elmd@lizhi-Precision-Tower-5810>
 <aaXCkswynHreRURk@Lord-Beerus.station>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaXCkswynHreRURk@Lord-Beerus.station>
X-ClientProxiedBy: PH8P220CA0061.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::12) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB7666:EE_
X-MS-Office365-Filtering-Correlation-Id: 2458fe56-5613-46e7-8d96-08de78a3ab55
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
 9WwgWxWbyqTqrhpd5A1SPVINNuIEcihT3pQhUvOzJRI0tI3kFv6SfYuglz0cQCmH/s68jUiGqqZBdY5xwcLUC3QIg2BXg8AJMni8arD+IQOVJLThMS15w85TdED4NS7PCgIFaMNwrEasvQr0DkNWPm8/oAS9PlNyl9+H4+h681VgXAMjWAroaXBrXHMiKybTja3hdEi5zvBKiNKyCB90mskYbwqjubRjGKWKutDsv1WDtCvPZXJcED/Pl4Y9uB1SKuiEMpH9zWi4/Bo0j8pJhqX05Yx5NiD6d7UvTDFYXWNwj73+3fCK+BjvkvGzVTwTnQTE+a0bc3hqIB0lDDddbtP0KroDRLLHRIOkUE7qRNT1n58xmWlUeoU/cZDaUr+r5m+S1Pif+Qw+wXQ9K8rQbNqDrsHeUwVTmAEyz4lSNLbEWqRzII+9IhyG0jcll99JYOJ1SrocCwf1+Def0vVYVnMYJaMbt7N7OPG0EjcOA2sxrUxpPHVRTgaD4pVBkON06z6Nj8uzQndsWrUuNMtMkHZYVbKgyd+slNR6xhR8mD02hNYofNYwrScEVgKURZaB8uv0PlitLaKwGjJpVId2/PRgC9Yy0WVbWVc4XfyP6Cx8PWSAxp8M6YETbFIkDIynPmzO835Tlx5vBOUcOQ40tqSAMii4XRAw8Yjt/FhVYAE2TMoU6SMjiDkfQSIaZEEIet27p9eaYAzUbORZrH8kfwuHZ/1YDFbLh1dGYpvdhipbqeedDM8RgMJI2xPsxqs52PdvxhfdrsxMQ8EsG4Qka76QGEzTv9nJ5uKf8KqKSKo=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?jubIYnv1228CJLqKlOCnfn3oCos9LZAEQ47ScP62asoBRZPbNUyDYwUzCNPF?=
 =?us-ascii?Q?quA1L/Bp7jYHi/QEpOmcsYB032MadKNGcvVf+Db6XXd3pgPvSUERGcX+m0rr?=
 =?us-ascii?Q?kZP+ehTvx2svtmIQo1iIFHfrxuhzjl/2ISm+eK8elg7EwO9/uYpyo3/HSsOT?=
 =?us-ascii?Q?MX6d+/jtgF9l9bOfHMdwToDG94UeJPXKsjZjZyovhT2j+pvkx1mUvGYQWJPt?=
 =?us-ascii?Q?xfL+6RoHGxIVJ7GLjx1jjnh9lUdmazz/DjiMlZ9OQGZ1Tv0fHSqP7vCIYRy2?=
 =?us-ascii?Q?MJRp1mf73J1c3eWio3ysHXjDGl40SlVg8bMc1JA1+jkhL9qYs7sCyQnL2hdD?=
 =?us-ascii?Q?qfjhW58jJu1+bVBgBGjfQ6cV+IekB/Zkbf4/iUgDuc0Y6DkseAr20yYdITp/?=
 =?us-ascii?Q?TmS9WwPBBl4Dc1tEFtqtGKKOxjU61HahEVecSNl9Ww0o/mB0qus+i6saOfWc?=
 =?us-ascii?Q?mlya3bOw3r+PhTh7Hu06NI0WNAKkiSePVrjg4UX7skQyyFBRRmE2lDsb6Qov?=
 =?us-ascii?Q?3FQdpFDAECjox/7qCXAz+AP+NGVc4/doufyD2RBMJbCk1a2QujmungoOzh7s?=
 =?us-ascii?Q?l3u2Pqa7XZABpvERFIJIg5ml4SJxl8MqV8oy2nHz09eKSv/i7WhUPQFAqCik?=
 =?us-ascii?Q?KILRjhDifqhHjuebTko8z7CTrxjxpke8zAGR90m7y/Xx39cxLUCQKAk+O+se?=
 =?us-ascii?Q?2k7g7Y5CpLeI2b2KbnM/vXJX0tk5FG2ub2jg9WFcz94dB7MNkq2ojL2E1oCB?=
 =?us-ascii?Q?qNTTKdAYPuhhvIb2ySzFH5/RDveEbKw8RpuLgr4UQn4DABU+ySHyNWJM5q7Q?=
 =?us-ascii?Q?lyH7NzDqIJV3ccfZ13Ex5jhOHOWcL9u+5i/Pm6JsxjsdhkshhjxCJ0ONhimo?=
 =?us-ascii?Q?6J8681rLHa8qXnJ4u4EGsgSETuw/oVImwz3nyx4y621ZVn3RfWcOnX6+M1IQ?=
 =?us-ascii?Q?fYn5xvYfdKX8o5QdZxf6RilZvhM7Qc0PsH87I+y7ARM8Jt37wRwQDL9z5HL8?=
 =?us-ascii?Q?SKg8yvqaAWsRj70aqA0cRcqx9HnMm4qMAcFJrWL/sqhxDiJphYEHc45zJgEH?=
 =?us-ascii?Q?knIKZvL8UKgXPl7gLO+ivw35D1Swq3koefgGv1dNMsMMqqxTspnH/XlAQqNO?=
 =?us-ascii?Q?B/hMT+/4RKWIr/x8FwvNVJ6oXwJ6u1CN8hADtOs0mhSiK3ZJCs/dw8yUAQcu?=
 =?us-ascii?Q?vWdaHETooHmsQJwsvxoUCwqPLBeTJapOueGoPTISGd24yP8hr0q3HIikMvb1?=
 =?us-ascii?Q?mhzpudJAViUB7ec1VWLlMmpG4o/HDn3L/BQAX7QHAshHxoxlnuosLbxu0mzm?=
 =?us-ascii?Q?Dd80SqxPCW3eMJdc6DkfBedK3X+5lPrn2yAFLdgOCO12Sk4nL2eq3EnYaIbS?=
 =?us-ascii?Q?RbfRNTeNHYEZZwThRogayJyUczR++E4267MbnTpiP4vDqE2OvTUVRPkomGC5?=
 =?us-ascii?Q?XNR9INAqWinfzNMum33290QV8OnzQ1ByWyPnzK5Pd7KAIjKSOu5Vyn40vIyD?=
 =?us-ascii?Q?PXlzmBZkPjxATivI6cKsTYMpAIZ4h7Lnw3xvSBsSHVurdiKq5yrQFxeF8G2K?=
 =?us-ascii?Q?auy/wC+SM9d5Amg3qQWbQLeBmXrbxmKlX0ArF6t9tcSLCWQVnzKNm01Nlqey?=
 =?us-ascii?Q?uIjFjSxKTJrrDG0i1J9lKpYIGDe6Or+5LUWTRTQb7gYDkyoAWjnJEdvOx7jG?=
 =?us-ascii?Q?/bIahXt0Br033b6Omqd9SvLC6XKz41LdufuIAc+6Nk1rE3MCHDYDmd5urhGO?=
 =?us-ascii?Q?eBHGeFnR0g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2458fe56-5613-46e7-8d96-08de78a3ab55
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 21:35:48.3951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JiqyLMpka4LpfT87gxSU+xJkd/Y30rM+e5/nC20XIQ3h70uW4vOi83UDO0mV7TktjTCejztlbLRq5KN4+MWZvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7666

On Mon, Mar 02, 2026 at 06:02:10PM +0100, Stefano Radaelli wrote:
> Hi Frank
>
> On Mon, Mar 02, 2026 at 11:30:10AM -0500, Frank Li wrote:
> >
> > dts part can't apply, please rebase.
> >
>
> Thanks for the feedback.
>
> I rebased the series on top of the current mainline (Linux master tree) and
> it applies cleanly on my side.
>
> Could you please let me know which specific tree/branch I should rebase
> onto for the DTS changes? I will respin the series accordingly.

https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git/log/?h=imx/dt64

Frank
>
> Best regards,
> Stefano
