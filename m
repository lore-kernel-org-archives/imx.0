Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011023.outbound.protection.outlook.com [52.101.70.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1F7346E40
	for <imx@lists.linux.dev>; Wed,  3 Dec 2025 16:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764781193; cv=fail; b=PPmu4vFjxEp7q86CHSHjc/+mEcbLdWJE/dssfQgnPBh7KIxU6wBTCAe0JMpimSLzpYPgQNyaoiqjS3DEFGxu0xLDptyuvoiMnfl5rj3gfZ7KUQYE219ZulVY7WvI48g0uQjK7pWizMFA0wxmWrHzAjSd24Cxoi2MM223k5mKa6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764781193; c=relaxed/simple;
	bh=nOfC+t+h1frzSEwYZCSAJmMCUSsZr4vR4otNrYaJmLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Yf0JpxSma1MtAfphGoYioRd3KoVLBtEhtcDabgx9IQIsWvOIERnKgrigQHTXUHJTP4bZ7kmQ/bxYnZvDb30yGwZXsZuTHyTosiJvCxmZZFxFODYfk7Aq88clI6ZjilAcni4AUakOmJ7ihh0ie6rZyhCcpAk/RtTO0MGD6Dze9nQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ApXxy3hJ; arc=fail smtp.client-ip=52.101.70.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ApXxy3hJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=imakeSCcoX1JoWRF2ZWba6Ch+lxo6ogRN5AszwwDIuvX6CDvP5flhSrbtcZ7uc6oeeBP4fjOTise5c6yuL0VWZ63G9OGtdKkCIPQQITwYF+ymWhDrkymTUpvCOjTPgx6WFAmm+Sc49azU7XTWyZXVkaKspwGG1veeG12VoQUs3ExK6nYO5k+ve75s31/UccxXsdoaJr269+HUJqSgk4ur6M7UfvjqGsG/lu1CxquM4Vvy91MMRwM6/hr4L7BzjK1AvhT6xfLlQwMJIFKqj4O/T/AWVgP2iDicTFkg/XFm0McWdn8/j7h3iZRnUQozvlrBC47tUMrhoojlKZaqUjwXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7bFEI1FkgGwLfSUdSuZ9AYPmDLhMqaH5vCIWEuRaKoU=;
 b=XIo67cgM0DUlVHGRwdOagZLZPiGawAIC0tgBZibPbgUv/5+S2NGp8+RKiwazS2ArBPPGzPRuD6aXnnDgYNBnKqxnd9v22O6x08OtuG5QshCmM8liYRLBLtR1uAhwhTcez4Y31KY0amFPNyGn/q6DVgg2lGpO4Ms7DKpHf+EX/3pxOBhzDEeemAKVBCk31AlA5WI5gvUAI5y/Wbiopr+T8Bk/ZfNj3bV9Jw/0foXQrITN/VOnaDsJk5mu/EZE1l+ehDqFW2DPNdkJ+IjGsq1R0HFF5sa+hhLZVIzLNj0AWsZcWOlAILQChCvtUj0yYNhi7v2fMBIgnFUZNHWi+teIZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7bFEI1FkgGwLfSUdSuZ9AYPmDLhMqaH5vCIWEuRaKoU=;
 b=ApXxy3hJgHMJqcPQUjlzaJjobtLFR6M9J+IQwMM70snR1IG6b/44TXpy4X0aOKoVjSMUdPdCrbYdIdzG55kkPAj32Uv+TwHS9AR22/l99o+l4hu6TRoVYPiUpe2aOBheCQecmnVObUaxtyglcUAd7kQIPmOCVpIoG46eJho8a2aGG5HsRDP8X4jnV9yiE7susvAw9D60f8LeftSJBCVqPqDfVK+kngYiFy7cvESH1a/JNuo3guM2y+my8FwKq0P6zDKlIGPGWcV9a+hJWBcw+g5eHm0bMlRMlpZhPt7CZW3EW0atTGYUEgLu5m+E2C2gyxY4A9yWzIG/xwWSFiydzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DB9PR04MB9776.eurprd04.prod.outlook.com (2603:10a6:10:4f0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 16:59:42 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 16:59:42 +0000
Date: Wed, 3 Dec 2025 11:59:33 -0500
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Pankaj Gupta <pankaj.gupta@nxp.com>, Jonathan Corbet <corbet@lwn.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v20 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Message-ID: <aTBsdW0lpZSCVsgp@lizhi-Precision-Tower-5810>
References: <20251203-imx-se-if-v20-0-a04a25c4255f@nxp.com>
 <20251203-imx-se-if-v20-3-a04a25c4255f@nxp.com>
 <1ee383c7-ccbc-4c90-adf3-bfbe87fb6765@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ee383c7-ccbc-4c90-adf3-bfbe87fb6765@kernel.org>
X-ClientProxiedBy: PH7P221CA0026.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::21) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DB9PR04MB9776:EE_
X-MS-Office365-Filtering-Correlation-Id: e7c1797e-e973-48a1-1337-08de328d5a36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|1800799024|19092799006|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hVLuQ+HFGLRzD8X4pc3xhwhDfcm5k4I1HtauY7GzDpVGh9oPfWM0tseJqGLo?=
 =?us-ascii?Q?r6XrG7YxW5nThtY9kkB0+sRE341UlWeB53pzaL+AAtEDmFCayWLIw/pS8vBD?=
 =?us-ascii?Q?FpOg+TK+W9GHZIUGKfnjoh+/m6TSnUih5OqHT+oeUToCSpAnmGXq91sNaSjK?=
 =?us-ascii?Q?V1tejpXNxeljE+rC9iDgXARgWZTGCfbpePPUK/lt7JRv4U5Qy2AZcBSwevIb?=
 =?us-ascii?Q?jwd1Z6o0/3d6dE0t7pqQW8R9yQQgYhd+cvaIo+kDumfeGxOPwFq3XbCkGnzn?=
 =?us-ascii?Q?4qPCNeygTBNVR+1qdQMjwCqHb+BDyIDNwVbovNGHCZXTC2kSHPpcI8O2hIaL?=
 =?us-ascii?Q?TeKosMaeQ3RHleqUE44+xFZQF049umGyqaC/h/VM3DGmdpdcG9R8Dy39guw/?=
 =?us-ascii?Q?vxxuxGTsOZjHMDE2JVe1o2BtpmcC1iQkl+g45p903r1pZfE6I3jOCKQwn8vV?=
 =?us-ascii?Q?kl26/alT0JUBP9vFODLUwZiaNiUcOItn3jf/1GhLnOUUkYWGy9b9upi7Denk?=
 =?us-ascii?Q?R0J6WROjwqzxHdAW/BiwrdTC7zzP+xh/J0X8/t3lEQoJzj0vC+MKU6+dQxdP?=
 =?us-ascii?Q?5/4XJ73FFZupzxVDzEpey0WY3nRe8X2vHqAJVcbvUjQqA6cSs9cMyTxE81sl?=
 =?us-ascii?Q?kSw4TgdhuZlLd1DejSFFDKfl1S0dkGjcVwLowNpqYS7dmnMJlKpNMAdcBeNO?=
 =?us-ascii?Q?Z3HEqtrCNYrPSkwfDBayAKw8JOc8cYFWJb9pofhfszAlr1bQogHAJg1dMdou?=
 =?us-ascii?Q?BFH6j83kJp9sxylWaA+lRt/p52lMpTlwWRXHRKP2a8iZCz5e8LzbHSIkTCff?=
 =?us-ascii?Q?kAQ9dvVuxuG1jUZ+IHkZ+c4kVvm4qoKTZk2MXGI2SlYBqYHnkbxirVdgX75e?=
 =?us-ascii?Q?DUDUpC2E6qCVqtmn3UxXy+2QWMo3QRBbkNqfc3ECZIRgm9+yVoR3na1FKX21?=
 =?us-ascii?Q?oNWdytJfvDe5/OxxpbwGu90rnADDN4GoediCkp0Sv3n23wI5oqw5j2eAFO+/?=
 =?us-ascii?Q?dN4hU2mB0xUXejaSNTzaH8sp3tAQKL1FYT5+SsYxalaDpDJUNB6kAYRHm7Rx?=
 =?us-ascii?Q?A8AGO37TVfrrNLXLLuo0tFptEuTqVyRTCLVY5/KCq1siCPWkkTC6SQAjSOiB?=
 =?us-ascii?Q?8hjpPGa4VX8mM28PJHELgjhn60fmLd8DmaWBHhDf3fE55r92G3sXyzy8MGIq?=
 =?us-ascii?Q?QBm1pzhiP3Z3zJ+O0rGEX2fpSVpigQTXOGz57oE4HsIWS7toh1uPkToSj4Ab?=
 =?us-ascii?Q?cliXg4uQ93DFhmvcRgcos7A/mcKwersNiMbJOvqJOJbcqNlfQam6RDysCA8V?=
 =?us-ascii?Q?g4sHeI7t7JyJIYPdmw25jpHSRbbapT3fzo9p3inhtRjlObP5pUnNQswcpma+?=
 =?us-ascii?Q?7FPQ6xZFkHebsb8YH13ICyml0KwuiqIBe10eyT6v9Ph+xbJYZcsVlT0owkQ5?=
 =?us-ascii?Q?RrelEWe/sRfj+Fl1ev9mk4ioIAud2fSpWstHCKbQcne9kzoPSLjaSc0yLSYd?=
 =?us-ascii?Q?Bj5N7hmEDlJm1ozhQQElOQXO5k/Z9qmC1vj2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(19092799006)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0KNj2D9xd6w1Elwc7DuF/KNTT+VmD3hQkFsHDHG79dfz3kVN9+Sy9Og8mq83?=
 =?us-ascii?Q?agVt3WQmTZTrzyupQrUVKsUMFPxtDaDmKpqrr+pv/WOLa+U9fIrUiwDWA4GG?=
 =?us-ascii?Q?X10NkMhnEeDVq9Ruh9rf3C2uvigK5y3g9GnUdPdBqOjp+ZhvlA1Qi1znf4sA?=
 =?us-ascii?Q?HvifsH+y90dMpZn02wwiQ5lpnHJY0pMxTmkrPZM1yZYJut8loiCTO35YMp9u?=
 =?us-ascii?Q?yLpIn+QxGuy7BDWz1+y5jHIflLxc2kzilO4dw3wAJCNy9f9vBPB+ouHhLCiz?=
 =?us-ascii?Q?PUivolJ3co8jQwQ5trIc89XOZruStvHPA3xJAXAcBF0ufQF5rqikspJMKo5a?=
 =?us-ascii?Q?FDcIioLiUu22G4tAIB0MQVW38NxRCFTrTBlxsHxwxDTHuzokJQGpjvuY3LrQ?=
 =?us-ascii?Q?c4LPIwbQ6Hi1Bo6e0rblLcCLOw0NKO4CiGJlHRqmLXqKgsu+kqf6wTiVTvdl?=
 =?us-ascii?Q?UWwYS+Aqnp3plBL9znbt4PfbDPnOxniCvBbAOMmrXe42mxJDcHG0p6cKLpEw?=
 =?us-ascii?Q?kSSK2xAbgYdl1J05KNxoEe/PJ8L9Z7nge9Q3J6dQMr+cFC9lcRyf22mneJTf?=
 =?us-ascii?Q?2Ftn7HcwmOHWoDXoT2m0BIJa4ezx/8ChF41h6lebIZvN3mVB47doQ9efZZrV?=
 =?us-ascii?Q?MUNOQZV2mhmHo/Av9Q1UiueGJ936C7B43L1YNOElSoRM7865WcaQXXO+HWpG?=
 =?us-ascii?Q?IedgBgxONeuJs2Q9CjUyQ2NIQSZBEoFh07AYISD8utQwLjiaXzcnImpxByD2?=
 =?us-ascii?Q?nn6l8imEvL033ZKmNG6WgSKC2Gk6f1bSENcSXnNkdVSnhJIV2kAMmMBHLuQW?=
 =?us-ascii?Q?5C8GbpjoIy0ZtF02l4+2hieZdYjqg7YDSSRgXnjkKUBg9aaK5/1CWcdJhgmJ?=
 =?us-ascii?Q?ZKVpKNqBxualE0j00UBzEDpkAYXJJhbsM5f48YZWZS1699Z44mtS4w6ThJxd?=
 =?us-ascii?Q?mSfzdEvAOv7ThE1QS+BSAyeTywQUDeyvHh9r8ziFz01tHYLByg1nCAAS8IMP?=
 =?us-ascii?Q?xvWkqzkyw8xGs/eGgk6ke5yVik3H+ZyrYGTMoB+mklmoMI6FuNOUzDFhCh09?=
 =?us-ascii?Q?8rCyRclCxupvQCxtJyz7aDHBWDynuNBEUtPs1z2tMoqbinAzx3hxJCfSM1ja?=
 =?us-ascii?Q?gw35cNt3zZmY5qiWNs60+o9ZjK5ml2gB3dmczm/oUapTueVeWGppa1iPA0dj?=
 =?us-ascii?Q?jwjkb3dQl6/N3iNXVYoyWg2v7Gbun5PbCICq3jDONwREMePDVzYMFWG8x5Kd?=
 =?us-ascii?Q?eIZ158c4Xj0b5jrWaCN5gA0AH/W8Yn8yck1iEdb9z8uwtmnTU52xCh5rXbJV?=
 =?us-ascii?Q?U0aNnTe4WweY3cBTEzUknsLfVc18MZMPGPJYdTaD37I59+MFTZ9CwucQLUb6?=
 =?us-ascii?Q?ZFWZU/Tl99AzBP1sOQ3GJjVIWKiQ/Eaoevw6/E8FkG2XK2BujWxAIfty0R4A?=
 =?us-ascii?Q?T+coxLfpJzXzSb9kKq5Q/HTBJV7Fudh6i6scg0pPalnXT0iyj19Xtu9A4Oyv?=
 =?us-ascii?Q?16Q8tg109cC37EluALh2uYtrebsz1z+iMF1v8+4FjoafvLv+25urcmkOCSz5?=
 =?us-ascii?Q?qBzhBbcGmoRWigF1HZX/iKJ4tDjDQceMl9O1Zxix?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c1797e-e973-48a1-1337-08de328d5a36
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 16:59:42.0526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +yC3LUajxKHhlFqz3uoxKsZnRtvbgutUT5uZ1bD3yHAeOsFNDTAxR/cFyDd23TK1m1aXkTPKIvJPh+5CNzaoNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9776

On Wed, Dec 03, 2025 at 08:20:50AM +0100, Krzysztof Kozlowski wrote:
> On 03/12/2025 07:48, Pankaj Gupta wrote:
> > Add driver for enabling MU based communication interface to secure-enclave.
> >
> > NXP hardware IP(s) for secure-enclaves like Edgelock Enclave(ELE), are
> > embedded in the SoC to support the features like HSM, SHE & V2X, using
> > message based communication interface.
> >
> > The secure enclave FW communicates with Linux over single or multiple
> > dedicated messaging unit(MU) based interface(s).
> > Exists on i.MX SoC(s) like i.MX8ULP, i.MX93, i.MX95 etc.
> >
> > For i.MX9x SoC(s) there is at least one dedicated ELE MU(s) for each
> > world - Linux(one or more) and OPTEE-OS (one or more).
> >
> > Other dependent kernel drivers will be:
> > - NVMEM: that supports non-volatile devices like EFUSES,
> >          managed by NXP's secure-enclave.
> >
> > Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  drivers/firmware/imx/Kconfig        |  13 ++
> >  drivers/firmware/imx/Makefile       |   2 +
> >  drivers/firmware/imx/ele_base_msg.c | 269 ++++++++++++++++++++++++
> >  drivers/firmware/imx/ele_base_msg.h |  95 +++++++++
> >  drivers/firmware/imx/ele_common.c   | 333 ++++++++++++++++++++++++++++++
> >  drivers/firmware/imx/ele_common.h   |  45 ++++
> >  drivers/firmware/imx/se_ctrl.c      | 401 ++++++++++++++++++++++++++++++++++++
> >  drivers/firmware/imx/se_ctrl.h      |  86 ++++++++
> >  include/linux/firmware/imx/se_api.h |  14 ++
> >  9 files changed, 1258 insertions(+)
> >
> > diff --git a/drivers/firmware/imx/Kconfig b/drivers/firmware/imx/Kconfig
> > index 127ad752acf8..5fe96299b704 100644
> > --- a/drivers/firmware/imx/Kconfig
> > +++ b/drivers/firmware/imx/Kconfig
> > @@ -55,3 +55,16 @@ config IMX_SCMI_MISC_DRV
> >  	  core that could provide misc functions such as board control.
> >
> >  	  This driver can also be built as a module.
> > +
> > +config IMX_SEC_ENCLAVE
> > +	tristate "i.MX Embedded Secure Enclave - EdgeLock Enclave Firmware driver."
> > +	depends on IMX_MBOX && ARCH_MXC && ARM64
> > +	select FW_LOADER
> > +	default m if ARCH_MXC
> > +
> > +	help
> > +	  Exposes APIs supported by the iMX Secure Enclave HW IP called:
> > +	  - EdgeLock Enclave Firmware (for i.MX8ULP, i.MX93),
> > +	    like base, HSM, V2X & SHE using the SAB protocol via the shared Messaging
> > +	    Unit. This driver exposes these interfaces via a set of file descriptors
> > +	    allowing to configure shared memory, send and receive messages.
> > diff --git a/drivers/firmware/imx/Makefile b/drivers/firmware/imx/Makefile
> > index 3bbaffa6e347..4412b15846b1 100644
> > --- a/drivers/firmware/imx/Makefile
> > +++ b/drivers/firmware/imx/Makefile
> > @@ -4,3 +4,5 @@ obj-$(CONFIG_IMX_SCU)		+= imx-scu.o misc.o imx-scu-irq.o rm.o imx-scu-soc.o
> >  obj-${CONFIG_IMX_SCMI_CPU_DRV}	+= sm-cpu.o
> >  obj-${CONFIG_IMX_SCMI_MISC_DRV}	+= sm-misc.o
> >  obj-${CONFIG_IMX_SCMI_LMM_DRV}	+= sm-lmm.o
> > +sec_enclave-objs		= se_ctrl.o ele_common.o ele_base_msg.o
> > +obj-${CONFIG_IMX_SEC_ENCLAVE}	+= sec_enclave.o
> > diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
> > new file mode 100644
> > index 000000000000..a070acbd895c
> > --- /dev/null
> > +++ b/drivers/firmware/imx/ele_base_msg.c
> > @@ -0,0 +1,269 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright 2025 NXP
> > + */
> > +
> > +#include <linux/types.h>
> > +
> > +#include <linux/completion.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/genalloc.h>
> > +
> > +#include "ele_base_msg.h"
> > +#include "ele_common.h"
> > +
> > +#define FW_DBG_DUMP_FIXED_STR		"ELE"
> > +
> > +int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
> > +{
> > +	struct se_api_msg *tx_msg __free(kfree) = NULL;
> > +	struct se_api_msg *rx_msg __free(kfree) = NULL;
>
> No, don't use this syntax. This is explicitly discouraged.
>
> NAK

Add link for reference.

https://lore.kernel.org/all/CAHk-=whPZoi03ZwphxiW6cuWPtC3nyKYS8_BThgztCdgPWP1WA@mail.gmail.com/

Frank
>
> Best regards,
> Krzysztof
