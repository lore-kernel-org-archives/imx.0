Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010063.outbound.protection.outlook.com [52.101.69.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DD71A9FBA
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 18:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774465134; cv=fail; b=ZuNl+W0bquSndbjINuMWWU8vT32lCV/mMYMWiP0U97qLFoifMUM79byATr74qAsk+W8TTporC+1dBrBgQ4I/qK2xig9ZCQGLSU9HgpMIkXW0mNCNDx8De3JlLJioXdsxyVWogvqyrK0Q3KjXsAaaoFrIqBuvyaPuUyUako0sELY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774465134; c=relaxed/simple;
	bh=FH7VG5C/81eXq34g0QngkLWpzL4yNonIikIG/WFLLgk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=o5p+dU3fuPK7V31HNvcS+LXgLvkjqtgazXxErzfaou5H4FNj9nsSUM43aCDMrbSjw7iIf4UYhVKnes3U0h8oRgUw3PPqbjGhZ3K2q1jh3ZxkiIhELqOzEFFdAWZIpZKIEusjOPpNnf4nLvmm+I5mJpdoUXediMlbNncRG4FQL60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ApHAwOup; arc=fail smtp.client-ip=52.101.69.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ApHAwOup"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ieRbIrPzSnZaJc+JoQYvhTP1teiUWhXjpZ5/tSkXszU6q8d94hImKorhk4UTyFutuNVU5pkf9U6egY9++cwCwrMzHa3H//egfbfVbAgMgQxBC8Z4kCCZm7zPCwygHNEj36KjnkeCKX+mqcnr9iKJ2hrhRYtxuuDD9thrdJH8C3AzCTi1vcyFUwXtlETmxqUtshvbJCtmfwprGnf6vBEtE7ltJIY7oMgNAF7ngkYL4LTlYjiPXSPO0ayNkY7qW/xftnL74nEGsvKMyuwPKehqH/G9555zwjMXdLco7YHZrVlqG/wAiMIQjfCoSpIB6V8SeuAOx3/m0YzObRQ+1Ux6Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FH7VG5C/81eXq34g0QngkLWpzL4yNonIikIG/WFLLgk=;
 b=xgDEp4iKHZ8fMVR+DRHLpxmVdVGC9dBFQg9HlHNFpf677B9Di2DP1Db4B9O1Ox+Hcv+9JQ7c7R32us3iPFlyQRnaJ08HVUfPlPbc0nZUVzqomU1UCitaZbcWAnuT/wAFXABMDxn3Yb5mOdDVYbLRy51DxTQ4NxSZzOHNJgZD4ECrG91piFLpqaI4ZofV43AQiIu40qKRj0QUxcoWYc3tPkl0dR/ygS7QtuLmLliLmdjTXhj/VdzKNriQf6jX+l0v3oJssZJdmohNqKTllUSLe75q1i/dv9BYCOkkarmDqMoWQc0speKBZFpjRCrqtzmeNxatcfI55fXzKnfd9QLP0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FH7VG5C/81eXq34g0QngkLWpzL4yNonIikIG/WFLLgk=;
 b=ApHAwOupfHSBiiEo1FHVm5pFXwm0dxpHz8RLkjg+k6uNVZCvRo4N+07YjbrU9+a1BKxq+IJUBec4hrUJ2gAGixpXfu6lqmmtySPWUYYufwW17nYUqEuDInkWpDi4CE74LGCEco1hVW0VY4FK7418OdzrKqjZMrWy85dNZ032461OFrnM9G0PS8jFE1HvlEgY0xilsqokjuUY8Gl0jJ7T2bV8Tqec82bj2L7xSvItBuX7ftvJIww6sCzVR3JwFZYoT8vQFRHg86pFQQzw7ZObI1OVeyMCArC4q4QN1bdzjylta5zTifuepdP9GOYPNoLXNySxLDvaKKKFYA5bPUQXSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by PA4PR04MB7997.eurprd04.prod.outlook.com (2603:10a6:102:c9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 25 Mar
 2026 18:58:48 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 18:58:48 +0000
Date: Wed, 25 Mar 2026 14:58:41 -0400
From: Frank Li <Frank.li@nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Franz Schnyder <fra.schnyder@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Franz Schnyder <franz.schnyder@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: freescale: imx95-toradex-smarc: Use
 gpio-hog for WIFI_UART_EN
Message-ID: <acQwYY2mHC3-d7kd@lizhi-Precision-Tower-5810>
References: <20260325-mainline-update-imx95-v1-0-b5ebe976655b@toradex.com>
 <20260325115513.707914-1-fra.schnyder@gmail.com>
 <acP3NiGvRCc1SgjE@lizhi-Precision-Tower-5810>
 <20260325181057.GB2972@francesco-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325181057.GB2972@francesco-nb>
X-ClientProxiedBy: PH7P220CA0036.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32b::35) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|PA4PR04MB7997:EE_
X-MS-Office365-Filtering-Correlation-Id: bfade74f-f632-4536-6097-08de8aa08c28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|1800799024|52116014|366016|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	cLpfb1NjeELqgbUm5U7x9JYaM3bBG/GRm7XKpVbs1NqHw36vFmLwJ3S+BHKsaQSFy3W0KHs641rgtHAN+xlcuKiFpUOmuZlBofTHwFB/pQXCdD1bubvYdtylqlmoj0HDE4OLLPq+YbRRgnBeV9BGJvUqROH0n0lDOyyJu2GXkEilB5acYOuH8EsAZeHiWfzFp6ymrLlIuraReGNmWrvz8JhX7Etqmj9D0kSPdLaXWVpHvs5o7ZwbdJ50v5e3KH05ivudngBCUqrQ+bxsztlLBdvImWE26vxwJbe/upfHsGrFl3Sg74b+H4bInWBcRKzblaXS+gIS/RkjGd4sDYT7jVgSR2Q+Lq93CmmIev+cXB9bVNReS3g8FZExpNRPhGaoi3W1UB+/W7BTAY2BiFOFa/MDeNdz87xQm/OZxgwHhIJNmGiK5MmBb8R/V9fvYnmbqfGppNHgAjMqLQhSVdc1dDxp06z5VUJIysqfgLhO+0biVygkyUYgmPTUbcKH4ivfoaJzBZKcWhuUmubWyZw0qMqVMqCPKjfEdzUDGXTrUl3bPxoPeJaIJKCaRkQr3xiKPFjYCLmUQqtcQJujzJrczKYtyo0JBW4StUMSSWboeZ8X7iB4cHqUpv4oe2iDPqRXrm+NE9pRL/rRxh2ORR+Pop+WV3kdc78IWHngQUszV5oTz417Ccl9GseDhAz36fFJtyLCpRY75rC/gfjZGLMMjAWOkMQ0KV+YRbaqBv+9fm5Za3r1OQy931jlLHi5l7kDSnDVlrxUwyhSlohjb3F2FFNI6tb436mhA6qHMMHkb0I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(1800799024)(52116014)(366016)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZR+dUFO7GsTkEoYvMtqiPwsIU4i+FyQyv8qfHxIk6jjUQsJ7cCUDh3D8t9Ou?=
 =?us-ascii?Q?BWjDCgi0oyVIK1/fGrUUlaEfuCcK/U+zJxxAVjnMAf3o7UgMahTo/AzTl5oi?=
 =?us-ascii?Q?Sco/NLDTven1EvDwZK/ilf4N7LHNBxf7adi52cYF1NbHxIt+8wR+ZWBTxnfe?=
 =?us-ascii?Q?OyyCZg3UVC9LBT60iqyabbfk9W0OOnBBv1QnxZQUciLvmdTPnc2Sbt8XgFpz?=
 =?us-ascii?Q?DXsCp1JwGQ809hpUs3gF1hmV7QGrYNbF+D6tAx+Y9PUJ+ILIxw/pJtgqd32O?=
 =?us-ascii?Q?azzktLpIe0VENAlu7tqU1nu4cUSWTaZ8we7bLxEL2ZPecoDPtCyki4Q+DJ5j?=
 =?us-ascii?Q?c893n9w+xEDOJE3dyRioNTiVXeVuzW9ccT8Y8rvMkkt0CsqMS+a654d0WQ6t?=
 =?us-ascii?Q?aXJhtiPspueRazQgUD5UI+Rv9D01QPaRWZiuhGQRNP5UqfsVzdShQMOIZcq4?=
 =?us-ascii?Q?4NVuAoeY8MWuPSYa4bjtoJetEjSDNWZlqIaRU+MusEEWkHg1mP2X28c8LrTa?=
 =?us-ascii?Q?sAbOYa6rHfe5dl8nNZFP0Ye1hPJhMWMFZqxEiPIxnW38ALWrTI7exR6zscNz?=
 =?us-ascii?Q?X2uqMuqE+YrbXsosjjRDiI5KDKELJDrzXYVx1hA6VRMyzIPzxxA9ZFmoe7Mv?=
 =?us-ascii?Q?rGXZt7HTljvZFduJso4r2SAaoJXb9/ky59RMCvd61RyAK3ZNj08uUt8u/1M7?=
 =?us-ascii?Q?URlqhiKtipcvHpr0bZuyUJrqbHL/h6cPx+6eOalOUJPQXDT6V32J3TxEx/Mx?=
 =?us-ascii?Q?a9EeDLChyQRK1ly171jdqNTky1kgB0EobiOzMdqSTEyhdpqdxs8muiSCK0E2?=
 =?us-ascii?Q?yKBPt2Lhr94g+1MdsZS00D1RUnooYBAA61f3E/G4cUCM+Zx6qKZ2jS/t+A4Q?=
 =?us-ascii?Q?lXlWqsjgD3zhUBlVKd/GOIRpt0VoD9Oxx/pgrxzdYdOjgjO24H+7+48UJjt8?=
 =?us-ascii?Q?GCFaxumuk5S9eWaVv56XtTvY8yBq8g/KKRHpYYhi4rp/ssM0YM4gPhfGZUv7?=
 =?us-ascii?Q?oq3R0F7rZOkUNB+u6m9Z3O6MxFkYtPHD3+vcdHoRfHMIpmzuduPehmdfL4Lt?=
 =?us-ascii?Q?EnDWBE2BPeeTB7xTvxr2veSTzW1UaJkrC4vPtCd4kZ3OKe1pAELuvbXgoMAk?=
 =?us-ascii?Q?o6K6bndjihg6dRdq3o2QaGLCNWJsELJDsprb+7yYj8BHPGG3lepdeelsFGqU?=
 =?us-ascii?Q?Jsz05S0owZoKmXGQJ/qkLGqYVDE7er8J77QVZrW1f5Pq29vXfaq2KbJybOnV?=
 =?us-ascii?Q?GgHwc1Gdy+ZxedhLQmNb83iOj/so0I1XIKNr1z+QUNRXq/J4rBJ/nHIQo3Mj?=
 =?us-ascii?Q?y5aR3Mxez1RyQD7EX4uWuVnrJppqgIMrFjf2GDFHOUZPn5o8OoMmCPy9+TmZ?=
 =?us-ascii?Q?6c62W+0PgF6BaF7d6CiPq9YxSSXweeYVs8q0sUAhGBsszLqFItDDKUHgXR9q?=
 =?us-ascii?Q?08SO21d7qvIJCSKTMJnCo09Y7SRhfbNObWnm7fgxQ4nML3WXlo9fmdciWfH6?=
 =?us-ascii?Q?GcUTLeWXU5bktl0QjHygh0O2j6k2VhSF3tG9VCMEP+YRTzj/WHuAwmcqML/O?=
 =?us-ascii?Q?WsV3QYZGseguyyZ/nm3l9gRu6o0803oaix/CSD5kKrJ63R2Az3XSyD4MJuE4?=
 =?us-ascii?Q?tlx444ZcetgRtzlxTdb4C6Z3PYdqnPt4PlG47INramOLnxRhRea4xzTLzIyd?=
 =?us-ascii?Q?lABZs4CwbPYoHYvVI1q9ijm+m7FfpPrVHxGeCq3mnNH3gp8i?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfade74f-f632-4536-6097-08de8aa08c28
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 18:58:48.5702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LTNzcjxmSx6JywX2ylKlY1OVvpWGll9NlQagXdJ/7N+zK5WFXeq/cbCuPNyxdqAHGKtCFTqr0GBW9AgMXzZLfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7997

On Wed, Mar 25, 2026 at 07:10:57PM +0100, Francesco Dolcini wrote:
> On Wed, Mar 25, 2026 at 10:54:46AM -0400, Frank Li wrote:
> > On Wed, Mar 25, 2026 at 12:55:11PM +0100, Franz Schnyder wrote:
> > > From: Franz Schnyder <franz.schnyder@toradex.com>
> > >
> > > On the Toradex SMARC iMX95, the WiFi UART signals are shared with the
> > > JTAG. The WIFI_UART_EN signal is used to select between these
> > > two functions.
> > >
> > > Configure the signal as gpio-hog and drive it high to select the UART
> > > function by default. Add a label to override the hog in derived
> > > device trees.
> >
> > gpio hog have problem about probe order, are you sure gpio device probe
> > before pcie?
>
> This is not about PCIe, we are talking about UART here. Specifically the
> module is a combo Wi-Fi/BT device, with Wi-Fi over SDIO, and BT over
> UART from NXP.
>
> In any case, this DT is going to be used also by the boot firmware that will
> configure the GPIO hog way before the Linux driver probes.

Commit message need show it is safe.

Frank

>
> The DT files from the Linux kernel are used also by other projects.
>
> > I have not seen any place refer to wifi_uart_en.
>
> There is none (as of now). This is there to make it easier for a user
> that needs access to debug to adjust this node enabling the JTAG
> functionality.
>
> Francesco
>
