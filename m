Received: from AS8PR03CU001.outbound.protection.outlook.com (mail-westeuropeazon11012029.outbound.protection.outlook.com [52.101.71.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6472B244676
	for <imx@lists.linux.dev>; Wed,  4 Jun 2025 14:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.71.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749048840; cv=fail; b=XSTKxHXW3efQNMhJ7Z1RAnqIM+eXQUJLwEViBUQKp7WgdfGWEYZLvIDN9GEOc7Uo37Tx/XtQcg62YwKAXX+itGA/GdB9Sb6zaZxWPBC01viKuoGEJ/MIUr9y8e4cm7NOoR/iBczysv7M73rMVeZ3uJ4wCHvuPEYYgnTxUeHRaNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749048840; c=relaxed/simple;
	bh=p/HshETmmX0Olp7EsMhj7ZXHCQifhKwVbreb5q/5rvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rOfgoIWZlq2fHOPF+bkarjEP8CtQXAemhZoLsIzM1vlMBw1j/k1PiABGKnICPE+Rtv1D7fh4kn3jUZeZoSO5AQzduWCoMIuQFc5S4c7qW2yz5xzD7zXZBWZOm78yP1sfLaR+pH9/hCac2haRssnQMVMgI9NsdwA4zOLf/6ZDjjk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nv1Am7Dm; arc=fail smtp.client-ip=52.101.71.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nv1Am7Dm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qvjdl2/oJ+BwGrMgOstPnX0yCmHt7wQJGu9hQbjs6mCJZcXobwEJvE21gvnzeWsbollNcF4FqeJIrICfUWQQxVY15KMQgZtAENkiI1ReZB7LMRTcV2O1NjZC7HWgDM47NZzaqniG7rEKl4qR9U3YZScn9y2wel36SXzG8aH0qzh8A74ZW/hl3eVkX9VIrbbsVqrgLdjjGlCjo5iqgOI1ED5ZoC1AuuDnDP/BP5u3NHj7Gh1/jT6iXcDHneK1okz/LhkyoGZqu8tFXLPyeISeXAOyfYVc+AtMBZlNTWPp/sZUzEWAcC2U0OKA2zHOJ2+roiwsDFNmlCo9u55qKkG8Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJhFPjIuIw4E9zfVIaZU99sQgfXmJj4Xj4hECzS8Or4=;
 b=X75tsIwjl8yaOcEnh6cC9eWttL+89s4bPSi58HdGHPFSJv3F0Jkz1jkiefz0k/Mf+T7kvN02unsSNjoezp7h5uf02uRzsqBtbWXn5uAtgEAbqBwTIMPPXaMPAFluhL44vhVgr2caGHOOIPPWvCYKw/YsztanyElBO0Hw+OH34mqv7irXoscoRKSArYjcTZEhW2+l9Gs8ENfKhNS+0BMnAfk2wSVVskNiFZPFUrUBYjwrfx1DUCXZXvBeomJdcUMdOToRaTAltC8TChy1ejp6xqfWQXIRqHTHTjFkDF5J0ctTBdRuofycVWgUfQ1RFCEyPFeOQFj04ginwKbLwNYWlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OJhFPjIuIw4E9zfVIaZU99sQgfXmJj4Xj4hECzS8Or4=;
 b=nv1Am7DmAz+oWXhD2ETtMzaC+dNUNIl7Fp+358vYZN07Wjn9a+9jTnWRDbHp1e5kOZoTw51AeCIG1kr6WJxmMi9/urcfBCZM42rZjOhstNjOxeo7MHc2DbxsWpPEICTCMWaGXEXwpgSHrRsiJ/GUze66wj3sFtZr9Q1DK6c0K9+owVBeNrLLZT2DBwHV1IlAxkA4hCUnedZyrKbhnzjsU8F/X13CGXKD0es2IRe8brbHX0S+hsGJhmJsJd6hL2LwNiHuh+t/TvebkLytxWmbPs1Y4erOmBoW7jpvWn1s0OhN948J/85tmDEB/FPwKHjJNMXruvlu6Kr1QIHHTDxoKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DUZPR04MB10015.eurprd04.prod.outlook.com (2603:10a6:10:4d9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Wed, 4 Jun
 2025 14:53:55 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.8769.025; Wed, 4 Jun 2025
 14:53:55 +0000
Date: Wed, 4 Jun 2025 10:53:48 -0400
From: Frank Li <Frank.li@nxp.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	imx@lists.linux.dev, Miquel Raynal <miquel.raynal@bootlin.com>,
	=?utf-8?Q?Przemys=C5=82aw?= Gaj <pgaj@cadence.com>
Subject: Re: [PATCH 0/4] i3c: use adapter timeout value for I2C transfers
Message-ID: <aEBd/FIKADYr/631@lizhi-Precision-Tower-5810>
References: <20250604101831.56585-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604101831.56585-1-wsa+renesas@sang-engineering.com>
X-ClientProxiedBy: SJ0P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::15) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DUZPR04MB10015:EE_
X-MS-Office365-Filtering-Correlation-Id: 3361f97a-c5c1-4b5c-c585-08dda377a0d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qhHFPih1Jk8b2D+dpxqYtMf5sVxmNp53hIHs4nS2kxgTyCWwFwDLWOVVEi3b?=
 =?us-ascii?Q?NI8f6j2WHvmyj6O+1hgnQf60oUuH3m44pazM3xf5V6BloDjHymiUQWQ1iwfq?=
 =?us-ascii?Q?/H/9mDVnHZMj6FkBT1hkZt5yQrITpVjG4gRiwwmt8rSRJEoF/feBWRgusNKa?=
 =?us-ascii?Q?NecJ92b7JaLLpdOri26ucRZJyq90r8y13wweih2KtJy07Ez/5SkIRBm2UpgB?=
 =?us-ascii?Q?Q9s6ctz27deZlZp4/LGgaTj91Fc6IuMcfyedst+WL8I47iJm0lO7xPxgSLQI?=
 =?us-ascii?Q?70sbbf9g3aTT17SHn2D4P8mxzx8B3RtMsqRhTu0uZrJ1d7WKmSXWGfkps9Xv?=
 =?us-ascii?Q?7iEgzNEbdPDL3Lsi5YuB2YTRo1HabzttMoT8zNrjI64uG2gW7zIZBWK5pgkc?=
 =?us-ascii?Q?Fh71gpprNfgxzgdUryld3FPLt/f86BC9g90+Y6Jb+JoeLnLn4me0gBn8Bh1u?=
 =?us-ascii?Q?IZlIdzJL5mrpP7rs3Q5CWyB5T58yh187KGGVqsPtHjkMFQGE0+M6OJdiVx5J?=
 =?us-ascii?Q?Z5214wGnCqGEr/JExeDxBoBNT0UtcB0OPXKS4FJjueMdUSgYXozfpM7pNnYY?=
 =?us-ascii?Q?jl3lsNENv4V5owAKMxFRtelRQYTzBbw+60RpnBVcqI5sSz7apb2yBCcsgFyT?=
 =?us-ascii?Q?oDGQpNWqXoDSnZr1f7yiAHFIumG2Cxi8fSJ4K72dE4Mfx7M7CXap9yEbMm8U?=
 =?us-ascii?Q?K+bY4e3sI1LdNaLSvfq8p07WI6sw1LqdkF7YDEFdCbRBlDf59zGzkU6e796Y?=
 =?us-ascii?Q?vaNgBcYMoNziclUHWSxFdZlUfRmpjXFEP6Wu/yVY8Jp2qLpYIYm9zL7iKXwB?=
 =?us-ascii?Q?97Ar0/hK6yuLVo4G71uZ1sxHEMxWaa6tiw2BM6PAvmv2lZs2GyjS5sMH5CNf?=
 =?us-ascii?Q?xUjol4Wczv6ET73nQxc2uyTXKrvfSjkG6IlSsO6dyJLRAjFKhnlPjiiFvHWR?=
 =?us-ascii?Q?lTPP+3p7svYyirGCBb7ldtdG+A6JsUaa/jfjG+GD9BvhKC0x6F7FG3OpZsk3?=
 =?us-ascii?Q?1/D8Ut991qb+OolunmBZBy7QO6m8+4ufUd+g5hXXmleB+qmkDC+t8IlWomZ6?=
 =?us-ascii?Q?VAYbms+uIQoivRDWY4wb6BPbprs6GdngugYYvXV2zUeD4KrNtPykfQBu5fTl?=
 =?us-ascii?Q?8Ntrc9fh/+dUDSMZjxcwPDWidnTUuP3tqoZNL8DeNCNEeVG13OWCOHrAdpvQ?=
 =?us-ascii?Q?Q9Bwl6LYXebgdtuiFf+EHQGliTKPWLNkl0pj8/QWg+woLMGMuZ3cSzL0hYwP?=
 =?us-ascii?Q?Pyn06Rmo9Bfnr6DgEXIs/VZgvlJu/l6dGDWA+DzNo9nzEUwZW8zNCtdCrif2?=
 =?us-ascii?Q?8Dkp5hukQtYb5FH9fu99rIOhXIJ5ZBitPxjJZZKVcL6qJbYkFfX/1mWzEU+s?=
 =?us-ascii?Q?JDse60huHrno5WYO5PJcwuV+t70qBTfQNlv6IjHiy76f+UjYO9ZRJFnpGSRy?=
 =?us-ascii?Q?ldq/b/ljreA3BXZZh1Z4hPkWmAM3LKCz4u0SBUynZWs71pCsD+Q/kg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t3qMpVMe8aM5uwA8p+XHvWYpeV7vgrlXpXpwzP5vkx4W/UPNXQpqmOoa/zMx?=
 =?us-ascii?Q?egnuEpwnSY2zbBIsWUzcKntT+tSpvfjzjy8KUYEmvfMEhb2MkOBKD1udUlyS?=
 =?us-ascii?Q?aMK+wlvFluOQhbFrhFU/HV3nquX3NVczY06iKsaa9h0PZMcFNisiiHLVQGQn?=
 =?us-ascii?Q?g2r2gw/4O58Pnpl6X+lbDSgB6teWa0E1WvrCXP4VgjbSxIkzt4ZWqhdY0gAl?=
 =?us-ascii?Q?rHmwL10fbIwPu5lfONZ+PBphcs18AIEM0xfJK76sQE6zybsE6DydDatbumVZ?=
 =?us-ascii?Q?zK3PSsOxhMm/77Fu2GQN0HWRxtvLkctvBQD7CqPh1CpQN+cc8284HstsaCJK?=
 =?us-ascii?Q?HYWhiOQFvVTxCNtjxqEEhSYOXhs6FxW0Wzo5s6q5N0VS+AxsDAiN+D2owpfi?=
 =?us-ascii?Q?Dnqmea+V57A1p9NSHkek30KQ+6Ir0nEye3Nwaj9sZNVictPHIVE7rIP88mdW?=
 =?us-ascii?Q?7MFzQCWCyfoEVbCxGQYXyGvsNwPdaobuGBQaj1GmrLejtR/ROqYQlM8D39KE?=
 =?us-ascii?Q?A7TEop6rnQP019EqeBaQEgSX4Q894jFQV5dJR28yZF336K+5KJ8u9kWgnuIh?=
 =?us-ascii?Q?5yB0eT5CRjG26oD+0K3ZOEOfgeSkE8ks/obH1LasfxcauIsAJTaAbD603r9p?=
 =?us-ascii?Q?GIJmUtykzBmjBhXKJZ6cw7CbMrzGyWjfQRBy1fY0zaNy8XKyu7QepRltCER4?=
 =?us-ascii?Q?8vnjs8txAH3oZUz2bAEhSxbIOJHKAm4yk5GegP4ZFKDqKjRAG2qQ3Yxyh+Sv?=
 =?us-ascii?Q?SXi0JhD1BYqyhSHVK/8C48k5FLBehIXm0nKltlHKef8OrhkCd0qEOIyqcW6n?=
 =?us-ascii?Q?SphcLhR+678zAAo81FN3b6Pqm+9z5Rs+DqOFEPZb6GadBZn2YdK1G2ktkQFz?=
 =?us-ascii?Q?yx8z9r8nwrqLC10tgHyaWZhNMXFY/v2qAc1fNCjF6eU3vOZ0txCC5ZH1jF+t?=
 =?us-ascii?Q?GJEfggSoBS0GZImaS/CA5kxJy00QOH7POd5VYBo2X5JdmC1DW41debNs8nEM?=
 =?us-ascii?Q?sHV5Z28SxYEakZM1iHJDYA8FCg6CGxftxWoLfAbyeNMAKpLrytfJVQQyh1vV?=
 =?us-ascii?Q?og0e8NMdjFAp3aoUeE+Od/upNuxHAWu9fkVHKN5W6uzt2odmIe1t7xfi05yK?=
 =?us-ascii?Q?WDni65hhUmAmJzYBuDMOh/y6ec3+VgEsvuDuY2S56VCmVVvll5TSy5S8ViCW?=
 =?us-ascii?Q?ZEh5DJo1nW48H6Tip4qcdcGf11M7w4ITYHNnjyf6/fbS0VIRZjfknyX5ICFX?=
 =?us-ascii?Q?Pjf7nv5vYp6EJ76q4zqaCXcLVwweiYOg7y15Kz2ir6prP5vDIgS6RHigI8bF?=
 =?us-ascii?Q?/zvYW2/thdFyXn3VQkW/l8HRZ9s7cIu1X2/6xJ9XSObXwU0vMIFiebVrB/tl?=
 =?us-ascii?Q?ek9pXIyyGLKg93GYtRYWCpUOl/5ELYXiZKAHqrkCWYbV7CG/1mex+NSu8/a0?=
 =?us-ascii?Q?Vg1rBe8ewbq9bemYwBAyQVaYBDixNOarbIMT5mi6xptlCoROolUtoBPRr+dJ?=
 =?us-ascii?Q?ylwmEJjXiltmSHapPni6aDduaZFM/L7eAxUf6M0618tsbVACC++kmbuVEgsS?=
 =?us-ascii?Q?3aye2OwDu88V11uxCtKkS9ut8xfBa/uC9YQEnNls?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3361f97a-c5c1-4b5c-c585-08dda377a0d7
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 14:53:55.2708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jdIhC+JwzxO3aHPLRr5cUf1qNc3JoXplUM0807CWU0jkN6xlcMhI0YYVpAXcxAEj7ulA31Uslf9Y1JzS2AZgVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10015

On Wed, Jun 04, 2025 at 12:18:26PM +0200, Wolfram Sang wrote:
> All I3C adapters so far use a timeout of 1 second for I2C transfers. I2C
> adapters have their own timeout value which can be changed by userspace
> if desired. Use it for I2C transfers. The default is 1Hz, so the default
> behaviour is unchanged.
>
> Found while finalizing the RFC for the upcoming Renesas I3C driver.
> Looking forward to comments, tests...

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>
> Wolfram Sang (4):
>   i3c: dw: use adapter timeout value for I2C transfers
>   i3c: master: cdns: use adapter timeout value for I2C transfers
>   i3c: mipi-i3c-hci: use adapter timeout value for I2C transfers
>   i3c: master: svc: use adapter timeout value for I2C transfers
>
>  drivers/i3c/master/dw-i3c-master.c     | 2 +-
>  drivers/i3c/master/i3c-master-cdns.c   | 2 +-
>  drivers/i3c/master/mipi-i3c-hci/core.c | 2 +-
>  drivers/i3c/master/svc-i3c-master.c    | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> --
> 2.47.2
>
