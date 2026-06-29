Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010007.outbound.protection.outlook.com [52.101.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BF292C236B
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 22:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782771842; cv=fail; b=Dafo5kgk4RYoDeqCqtHclqgKOrqY19Vwu/Y5GlgCgYj5pYOLB64xDnpwv2khbLaFCMb31QOFBjbEGif1ztfFwymUlniGOA4HXYD/BiXxOt8NQ9zhoKJ86O9+KUmjLfIL6v6yR0hMrElWJVf9eVAzoCOBxi2Qm6OQxXSctFNrNdE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782771842; c=relaxed/simple;
	bh=KMv5eg/TZ70J1nIzVLCKCIUDro11/NjAOtGN5CVMwzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EhzqD4eOIPpdk77QA25jDT8VqNqh2n8L29V5zqi1cQt9Q6o+jgPBDqNLqMSScq6PnzjJh9MQAThLYVW/xcRNswqu51VQ06vRSIuTiNEBqjguchaKADvUf9XeIxzmQmqXylp5FWaskh993/IcnoazeuwzBNRIe7jRtNLF9FWWLnU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=temsb8YL reason="signature verification failed"; arc=fail smtp.client-ip=52.101.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="temsb8YL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VgGQ3gxYAuWqVn0rdRCs7WZHmK0XKwt5vVNTdpmkNv0B42y0lv2z8FuWUX0hz39Tewo6uBe4A9INVI5L6OG5ovhqU0WzE2G80aWsV+8nUJ7zgSIO/uZW/Cec/MGlhb1iHEu4k9tbXTk71GyUZJnP2n0NVxDRJ9zW/SeJtphArF4oem1l57QMZXR4OTIZv45RbtdaZY/EwQbn+s7H1Dwc4RFByjKXEhJ7RZJOkjxsyjhg+CruKiBAbC/rdRDk+DjetLSipyF7cHLnXwbFjrmppHwjugZd7FCVtc8TwWpIqH/714/Ygf9W2lqjHhE4gP/FzTkw3XNbPV8yfrz9K02dvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6sVhf6WjP8FdRwhwRB+Khh0xvkHN9jlQeeTHKEgu41Y=;
 b=Ujnr1xa6f81bwj+6VrsDB2EbKb84xjldZ88z8mOr/nz9EHXfwCvzhwjaI0A9Nr4lkuSRqry/Da5SpwbPLs9SQbSz9iMI09cvjDRnR4VvHtukRiEGh8a08CDHpzfbPMfpNVONYROtRLLtz4Sg8dYLQ+bCDrIzCyevG7ld5jHbkWUyRHJDBCYnyiNPhj+JeMCyd8253CNlZP7J1z5gnjPlu7amcMs4Go/XoBap/yzyV2855BrGYis7TWuuhMRkTEDu4tmZZaMjuXLXNJiuqsy1d5zWjzL3BYfn3C+zzHsM5sNF9UihmONdr6dSkmsXcy78OjSblSksLE3TSWOi5IM4zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6sVhf6WjP8FdRwhwRB+Khh0xvkHN9jlQeeTHKEgu41Y=;
 b=temsb8YLt96lL7pAbgUs6BIUqA6cXE3vBs0zlBZ99h6GDnhg+QkgNHrPtlyyXZEOz3bMPo43VOulVHvgbZHKzRonSxDwLvZP6qzMp5ZZHlZ8xTgIGwEI9+oQONVN67pVAEjqQ3p/ybkv1uFpkqS1r/TyE2719MiiGEGGxB/eNwY4HyMeAbHYrx/0p5pdWRJwyM6fOpdJsDQ2T1v+LWIKPP0QbWXjTTHx0ivs0a6NT1mJWB2Mhf3srtVlUM18gHYxTgDURGACiK59imu1o6+s9GwcLsd4Gck4+ninEMg2kf61CWv5OHd08NNyj3mWuy0+p8MjHWtZCTiDpEX75xGLeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMBPR04MB12311.eurprd04.prod.outlook.com (2603:10a6:20b:723::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 22:23:58 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 22:23:58 +0000
Date: Mon, 29 Jun 2026 17:23:48 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH] ARM: imx: Drop obsolte stuff from common.h
Message-ID: <akLwdOwaE2bev3P5@SMW015318>
References: <20260623104557.1801727-2-u.kleine-koenig@baylibre.com>
 <178276752372.2498119.8965955961315145259.b4-ty@b4>
 <akLlvHMcVpXDsS9l@monoceros>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <akLlvHMcVpXDsS9l@monoceros>
X-ClientProxiedBy: SA1P222CA0069.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMBPR04MB12311:EE_
X-MS-Office365-Filtering-Correlation-Id: 57095062-9c50-4cad-dd8c-08ded62d1d2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|23010399003|1800799024|22082099003|18002099003|4143699003|6133799003|56012099006|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info:
	8maimJ1S4ie6TSbyLKS90Nh4i1WLnVf1UGM12slfuf0Yg7ag8bASUgh9JOq8J+pCYKgZ9LIVts5kF4K9gEVeT3zLR8e3g3jNE6Oackax6jmfCNGhg9oosdnq0LyFHhhrXTmwvOohUO9uZwpgkaXcPmIUHQBX1woCdL4Xf5n85UqmjvBZNQRj62YQadNc5eh1qZOClolUonNqcnuIwr1Bw421tg22b/ZC75/BUS8eoRXktP1vCtmWX6EvTjdPYofdGF1BP2CbQHy2SHRU7qolTSj8GEzhveF6b2jpmKkrJTUPJZPEuEdwOC994hi2ZZg2wp3xULA7pzXPpcieb2yFgKaiHKSGexRiTNxzOo32+ATLE2E+qgJ3LxZUxr2oitvyrG0B3XBBhYeawLd4OEZF9i72BHr7CRBSObsvfG3zAuONXD6NUsBN25APWghSuODHqur+B1qV2FE5tsrEf26Pnk+OvK+1KynBBlYwTzRjbg3sYUCNZYax5o7CUjxT3+g+CBs1gxncrLbfTQothtt27i4tkJE9f5wuJd9CefbfOL0cLbzSiduktgyyDZidKLrqjFJpLLN1N6UG/6NYeKaIjKCff1Vkrdj58eBvUHZLQbMlB2p34PdcGMAY1syNhkZKVFksZuMHq7GVpLL+ztwNW7YMR/SSUcEWa0r3A6OiTtE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(4143699003)(6133799003)(56012099006)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?3JCMAE9/i6hUhzaUhMirGysHyWGSpFLEnfV499v5k79raBq3yNsev6GN6x?=
 =?iso-8859-1?Q?eBhUyFle0h6mdgfOVBnjVPwsPMg7A35pUhDFwgoaACjW8znB8DxmZawlpY?=
 =?iso-8859-1?Q?lN94M8rm8WfJrtGt6WjhSo76Pnw5peB9vQ1UIv032qGv+uPRsZSjC95KQQ?=
 =?iso-8859-1?Q?2wki+2NNa8pHfASWz9TyLjoKsRB9QmGj7LgmHex/1Q0XzGylqayrLiS06J?=
 =?iso-8859-1?Q?p414BZdQQjkJk7j8GUrgn0BIBtRvyJ2eXgrJMARvThNUb8ILFPc7wdzXeg?=
 =?iso-8859-1?Q?MSTy8Z06YvWyYBm5gYuCtWFsRiFALSqRJOcoBmZittqIAfdNhKozBaoajW?=
 =?iso-8859-1?Q?lJTwYRdgau9U9vTLZ9ZtwqRl9z2Xb+J879DRqW9398dGQheeq+AX5ZBNhP?=
 =?iso-8859-1?Q?2Zq6h19/W9OPV//kvqV0JfmMbHoRPj98TDfm+EZ6/PybSIQuyAUelaGqEo?=
 =?iso-8859-1?Q?zRc8YVpIvCffBPvuk134sLvvw4aY4+UdfwQMg3Qf4Al5hLh6ph7C39u05K?=
 =?iso-8859-1?Q?NdAM+LXqyLW4FM8EqIeoqezbQ7tNaO3XWduMwHj3Y6lWJqTpHyX1vasmro?=
 =?iso-8859-1?Q?s+quHS8QOYHV9KUdAUlPPdW9C7wBeTWG+p3SyKJD8kSe+7e/38251i6r5W?=
 =?iso-8859-1?Q?GCXJgwJPuvyjwLPuFpiRN+tJAk+nSGElbLVgVz6CYRRy9acUl6SDpWyBHs?=
 =?iso-8859-1?Q?En6645Ck6JJeFdt0eHJ2nMOXHOxfi8pwAUtSnTQNS3WBEfO9b65KasDJae?=
 =?iso-8859-1?Q?h+0LUzaMrYX/Y7ZcjDDRqVg3SCek7Wsg0nNK0snefl5nctZ0O1NG1TJgz/?=
 =?iso-8859-1?Q?0klMD3wahU1MreQlvvQoef1rnzSbp7TMVROfoHIJE/7L0HB3BOOCIbXKn2?=
 =?iso-8859-1?Q?ynFoKlKWWFE1mZWnMJspSt2/GVw8xd3XLwgGTPb+8fXYNiLY9KvPPiOQuG?=
 =?iso-8859-1?Q?srxafFIWLzfOgMzF8PYWrD+KPKTcs4pU3UXSTH9PIyDBAi5a/y8fEgdQ4F?=
 =?iso-8859-1?Q?PFXkPfZSmQ+hHkYfVrPU/Ht49J/c+1OFkRxwQQ1+Z1iRw6ThbkdXRcq8fZ?=
 =?iso-8859-1?Q?hatSYT22neA5XBN5yEW0JXTfFELv/I/D1XOo0bNc7Czj0bXJGX0CxAvjM3?=
 =?iso-8859-1?Q?is2twFp5e2X9mKvN0w2DbwHch1qVFSjd49v9BJFDyxmSCwU62ufXEdzrsu?=
 =?iso-8859-1?Q?1B2XYDrgieeDITdvq9qf1xmtr0yZaijL88KHwRAcKz7r2Fil1mV8jNoPYK?=
 =?iso-8859-1?Q?IcrMFAeGIGaZoCNH5/u86cxh0U/EihOtlU6VfiEY7w6vVkzaY7aaSwFUZl?=
 =?iso-8859-1?Q?bcE4Yfc2SnVJnBfCBT3R8vahlfkxa/KEMtYbt1Kia5D0ltn/61KocmgY3d?=
 =?iso-8859-1?Q?nrEkvE2XlSfgmYWEWn6vqSd1leIroFfV1kfnMjAGH28OuQMzztVRVrRurD?=
 =?iso-8859-1?Q?6u5NbfPOYztQhy5EG+McoxHR8FUX6jFJx6uXBosIV4gqZMHws+r9XzV2Y3?=
 =?iso-8859-1?Q?h5fvAzz+6pFT0nt6VC8cgcpT/cpuL6/zNP0TwcG5Re6psQmZSNOA19k6l1?=
 =?iso-8859-1?Q?2v+qDHi4s6hAXYhVJGYx6mOt3PgJcIh+APoFfHjfuIKRFuvI1fmgZWhR2W?=
 =?iso-8859-1?Q?lUUCRnmKZWQHHuFH/Vj4w2UusutDTYYTM2yS9heFYDU0XeIfy8MX0b0+Uf?=
 =?iso-8859-1?Q?TLNE9nmE79Ebw+8whwPssYgNOxbl2YnD0Di9eQu4nR6FROrC/QHyO5xJuM?=
 =?iso-8859-1?Q?9IoucxXSyYM9DzZD2b5mGPmeB/p7Diby0JSG54R6rsfnseI3o1yc2qbbi+?=
 =?iso-8859-1?Q?l1YP0LcvTeb2a7MDWwBduXpnYaymzrs6Qzek1JRnRg8dxu+S1Mon?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57095062-9c50-4cad-dd8c-08ded62d1d2b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 22:23:58.7126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7f68amrQ7/DG6vSb/QP83V0Z3LforSLbNf50qSK8jLjDs3TmgVtjtTegf+w/EwAQCOeunkdRmXkkLqL4rYNLZkbw2vwGH/2BZlxNJlYTYDnnvsVaXXTZ4Irg+oqTVvCj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12311

On Mon, Jun 29, 2026 at 11:39:39PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> Hello Frank,
>
> On Mon, Jun 29, 2026 at 05:12:07PM -0400, Frank.Li@oss.nxp.com wrote:
> > From: Frank Li <Frank.Li@nxp.com>
> >
> > On Tue, 23 Jun 2026 12:45:57 +0200, Uwe Kleine-König (The Capable Hub) wrote:
> > > i.MX21 (and thus imx21_init_early()) is gone since v5.10-rc1 (commit
> > > 4b563a066611 ("ARM: imx: Remove imx21 support")).
> > >
> > > The init_irq() functions are gone since v5.12-rc5 (commit e2c1b0ff38c9
> > > ("ARM: imx: avic: Convert to using IRQCHIP_DECLARE")).
> > >
> > > And mxc_device_init() was removed for v5.10-rc1 (in commit 8485adf17a15
> > > ("ARM: imx: Remove imx device directory")).
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [1/1] ARM: imx: Drop obsolte stuff from common.h
>                            ^
> There is an 'e' missing ---'  (i.e. s/obsolte/obsolete/).
>
> If you want to fix-up that's great, if not, I can live with the shame
> :-)

Fixed it.

Frank
>
> Best regards
> Uwe


