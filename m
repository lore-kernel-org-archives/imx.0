Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010005.outbound.protection.outlook.com [52.101.69.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C53E1A23B1
	for <imx@lists.linux.dev>; Thu,  9 Apr 2026 03:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775705447; cv=fail; b=JbJqFZ+OhPk6qfGHm/xwHHUjSRVLetzkeIx4KJ4EmWk2pShDYmSmAb5QQ74DeEyCRX4FCRxXIo98vKBtHKiOsp7hWRXRax5/C8in8ejxd2PgCmKjww1K7OA1j0Q9pdGYZqpzoMUHWSqlyETmy9FQIAlCboouzlKmmNVWBK1huh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775705447; c=relaxed/simple;
	bh=R0G1DSQAUwopmmV1BUA09Mi/kuYmw1W6VOYb5jj8lBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GJb27/5OKj5f5h1XKjX5SvxDDTdFqMpwe2wa7jqZiDqYO4hiLkRgiWLUnqV9Ay2ShGdV3wKKQBTNpIvw0o6LW9fBWeGWAg3jBpo0vrn4JPfHeGpOfpyZgvLbiymXBpaa5DKcXmbZhrPOFGVBO5yUxU0YCGxzZOY4fSPyK91bqW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GCUKcslr; arc=fail smtp.client-ip=52.101.69.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GCUKcslr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j94Ajec7597SRjwHzqSiuEgmkobhmSJJsV06MRVEiLUV9Qu50pz6uGaAkvJTLhxc/2cgCpiMizUCRmB3ct+Beoyhywh1IO9gKhgje+hHaMovF0VgKvPlcd7hWJ8scILQkz7sSCsBYweo90KQXUsreQQ2u4GT1HvRHEcN0iWSzjYxIkEQt3fdOwldC8hY5hhBMPhBw3ExsoAa3bJ5VmW63jSY4MMd4DdxCtWm15UhsccM6gvxgX4QPuziBWOSg8JFhcrVVKnYQpuoMCtyeC9ii2Hc6s7ouzU4F7zskdC3Sm4VTn2kBvrl1/Om3E43aKdhwVOussWY18PALKDUVrgFTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uuJZGIv9YfoaKx/+t6xkCf+JcNeo+OBU+92ZVEbGQZQ=;
 b=hVcuLTyttMg6I8FS+ZAqtliJhsLfvfYfkLe0uTDvJC3t2fpbeyL+LmtTE/cYtP7zVyZJtY/GxGZ5aY5170nLxGOpmZlgabA2ita6DUmk0qE/zZLItRwSa9NxCxT/mbGoUtRrNHKts6uv3vJRNaROlYflRnoIFJYQMhagNYD2kdNnTHbpYAtT5UX3m7VuKJ0HSJff/U+IoYY12A95hWSxiq11HgeutVMvUo21sla8wcAJPA15xqyrDuwkOfd6hKufgTElMNNrKPCbN3Pyu2cuTznD5wvjSItKOPLeVEh+6x3VoN8fIrPkT6S7rOTrJFEiYgQZwFFFb+otV6Nb/DBUwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uuJZGIv9YfoaKx/+t6xkCf+JcNeo+OBU+92ZVEbGQZQ=;
 b=GCUKcslrqgX8J0lIQTV+HtKc3xtw7ZDDq2Vh3RuFs+AV68Hu9/FEt5NCHUEhoOJf5x4bXeBUGeP+UBaZ1+YFSZt+VJAu4VCFGBTbDMLDBmGOWfruhvR5Cq4CU4te1+biJTU3AHEt0stFoj0Lyae3pHdWkQ3bgl+GKRKHfNaqbmBWjektuifwhkU01iS6n4fgporB7+mXleq1MRzAS+FDBKAHF76oIVN+vYBdpYP+vngGL0wr5TQxvsHcJH+bhiPJo2QEKrX4xoVSjFsVfCDcAbx1v7T9j24nh1L3FiDRyQ4z30jr3QatKy+FRqY5QF1asXpPGS7WXSy5qKTHh0nwuA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8766.eurprd04.prod.outlook.com (2603:10a6:102:20d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Thu, 9 Apr
 2026 03:30:41 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Thu, 9 Apr 2026
 03:30:41 +0000
Date: Wed, 8 Apr 2026 23:30:33 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Primoz Fiser <primoz.fiser@norik.com>
Subject: Re: [PATCH v1 2/3] arm64: dts: freescale: Add support for Variscite
 VAR-SOM-MX91
Message-ID: <adcdWdTcVR2T2F5c@lizhi-Precision-Tower-5810>
References: <cover.1775669847.git.stefano.r@variscite.com>
 <1ed7e2100e3feb74c9f0006d5b88e1bba1ad4339.1775669847.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ed7e2100e3feb74c9f0006d5b88e1bba1ad4339.1775669847.git.stefano.r@variscite.com>
X-ClientProxiedBy: SA1P222CA0164.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::29) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8766:EE_
X-MS-Office365-Filtering-Correlation-Id: 389dce22-6774-4abd-a798-08de95e8602d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|1800799024|52116014|7416014|366016|19092799006|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
 ayMeOHOSAJ3Ok7aTwxPJ1o+D3KJ8LxNwMUxFVA5cpl5Qaw1CRZLQCG3dTNYjW0ZWZuvFQc2BtKAKKzz4BQGPqXzGQ6ISz2QvIpZBDF+uj8BmVuRaEYYD31yS6n1pj7JAHFmWenZmUw8zGkt/SHCIe2KjfJSRXnpVQfkW06mTzD/laAo2iWMThewCcdeOUfGdE3QGU0ngck6kqiJHleLh3zR218hcMlcms+dinZP1R4XqTvwlgQmCArQohdLs+Dy6pGVZZyJ1GlkBNpk0NhOci8I55C47FWnuKxs64u0X5M1zjZFKaXWw1wJ1hsyOFLJMQGdmclNoIolbRZQAVjySjglsIAcxPakk7JJvVfl9TViIJ0Wt8nNaAmUZzEbk+/1OvX37IFcn4DWhDbKi8hGEJrv6opElUT8VTNTVk1QraresT0jHCycbAu7cbwmVyfK92gUluiG6nmeBUV/CNPJyqt0ZW1GSaHHxzXNnLU4bFF8Q4xHTOmqDzScaGWdVBf2GAmzQhC335Js4L49ozWgeVP80E7ryYfsbuM01POwqjeyed8cwElOZCjCz3CHCfPbkNuLiNIPOS5wKqQAA1I7KmZVJL7uL7feihsUqa658pAvkJ7QoQY8CmB9IJakba7LWR8H7d8HRZtGS0ZisfTAiocffEZY7Enpkw8xHuzuhcYdoECsDf60uArAGoTAqaTfqIEDQ63t4JvBCzngRdPpM6AOSFMXNSbik5b02kmeQbGhEVgd0TBTUmVqDMJnFszlj0qoU+oRbOYivHNu9FXCdlrYaSVJdVCY3PBPmb7wY/hk=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(7416014)(366016)(19092799006)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?O5RyQxJuaCzj3t4Jg0X02Rg2kT435Khhej2QdnuIoig84il87pDfHVnOvzwl?=
 =?us-ascii?Q?9FNNGqbRjpv9IBHnk0Oy+725CrkCC32tUrTU3N3dfTl3J+8c66AjWC0N6Wg7?=
 =?us-ascii?Q?eI+gzY2fSI4+yuDlQhw0n7ebSFJNt81Us7zSx9Pexf2b2YbdFJyhaeSMu8cK?=
 =?us-ascii?Q?jhhfRUwnSJ5u9ea7V/S+MT5jVSvXX6cp4wT7oKvYdVu+KhQM6cR2weZwXHBo?=
 =?us-ascii?Q?jEU4TtskS8WR1SNugR+I5p3EDM9p36HfMOL6mDE3uenHhyYa3Ose6JDgiTUx?=
 =?us-ascii?Q?15KJlb20jKu0i4VtzxzwHUxTb4kMGe3mzkpMEKBjHwm8yRjPHIVyflfHR9D1?=
 =?us-ascii?Q?7n2qR033nyJGU1fRPobTh/NIoEcYkPVK2bpvfLmA8cgIthA47Jlq2KBo9tHd?=
 =?us-ascii?Q?qhLQDLnYGROPUUpzVlRd2dbI/9+xC6boMRJVLj4DJbJH8LwCmLng9+d5XmKz?=
 =?us-ascii?Q?pxNkasaxqxCpA8o38JbF+sTSey+ZlsqPHJUxWtn2Dgr1nWfZiPQn3Cwon5gr?=
 =?us-ascii?Q?YJwweieSfAKhSAd1bCByO7xgJIRYNMAR0EnEqDzAZ7UCcJ+vmQL99GRB+RbU?=
 =?us-ascii?Q?aov7AzXVrSCXCda2KZcslHn24oDDt1oPc5tOtIW/NyBNyMTjcp3xAePUfVe3?=
 =?us-ascii?Q?HzjQl4K1sbIJ5qwSFtst0cNo45SwaSYFtly6UIWabPZBZpf2NT9zBMSjwZ0a?=
 =?us-ascii?Q?HSNqiP36yM/N5xzy7b4fm1HpP80oysdxAhg1G2VQCY1rmo00n+6jCq13OS+B?=
 =?us-ascii?Q?lNJ06B492kvxNdXTG2Io4DbMo5GfToorZ3Ao9TqxorNYGyujfyLZwUMBTRg2?=
 =?us-ascii?Q?uQ5iuBBGj6RDuXo6318XDtUD6mXiLtGiBp9HwRza6W3oouR44DKxJWG26A+I?=
 =?us-ascii?Q?GZtzVskH9VK1X0qF9zR796/phDmKRcKfIEdxu26Twa4P4C32509AROc9wkRh?=
 =?us-ascii?Q?EQpeshH6gcO2x41g04Xic5o/bQZZdDDkTiP9hIwYjhp2ZLFY5EPT+35f4bk2?=
 =?us-ascii?Q?v6UnrrqdeLPm3+xUt21r4GNIDIZiv5mE85hgSDYv57TQdJyzsMolQ47AVksh?=
 =?us-ascii?Q?GkE4kZmPiGuQ5pZ4c0d1Rlw6kOrH0SW4mWsRjpM2ZDUHYNx0CK7csQunKytY?=
 =?us-ascii?Q?0/P+Z+DnYUlejnASmOieRHOTrr76F9Ned6rD5+e0XY8U4i0z7TM1HiSYsm/B?=
 =?us-ascii?Q?0dw06I2BZGXL45mPXiLmWLPLDHXe0oBBEHz5YHNt4SIfdwx+7pQ1ge61ZhdL?=
 =?us-ascii?Q?AXZNoqcE+SZZYXKRtLiFyegNjQEhHEPgJGD16knAGAjPqodJ+Sy0/3vSFUDn?=
 =?us-ascii?Q?6r2scltTXLdioM0WLefppbWM1kGs0zpFnaZsFn5X2AjJ+o2DY8HQRmqQagu8?=
 =?us-ascii?Q?J505PzianS3qHLimY0eOvkrGvuRoFd8/edStidQCBaMnm40vYiNFMhMm3wdC?=
 =?us-ascii?Q?bJVBvnnD8O6UvC2RDHBij/pl+EyYziNEbamOsAW9MQPxKmlawgIrm5ZwnprM?=
 =?us-ascii?Q?uUdjpZcdIuOzO0EwldfzZOOFj/9bcNdecFXcxzux4UjW5u/qCThux5XRWBcu?=
 =?us-ascii?Q?R8wTHfsbtAGQwWnMILW1fJllhsDL8HCGMkULo8gBISmrFrowOXzHhn1m6zoC?=
 =?us-ascii?Q?Zo/E5mTA+ldUTuc3h8bJuwZJ4ib0xn4LPcUoLmBPSrfuYQMVV+5GL3Xq5CxR?=
 =?us-ascii?Q?LEIVSD9+2t//iOzQFWHLTCqyzCD5KEJMfKLFtgVMEsXu7hq54oOoa1gyJTaN?=
 =?us-ascii?Q?q2xgT6LilA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 389dce22-6774-4abd-a798-08de95e8602d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 03:30:41.3909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lQAEa0tusQJyTXWvZta9Ga+wFHREGmrb1re0QnhAelFAJlffQEQezNnI2OloOcVk2BKutVQcRdoczTpXPXH8xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8766

On Wed, Apr 08, 2026 at 07:39:45PM +0200, Stefano Radaelli wrote:
> From: Stefano Radaelli <stefano.r@variscite.com>
>
> Add device tree support for the Variscite VAR-SOM-MX91 system on module.
> This SOM is designed to be used with various carrier boards.
>
> The module includes:
> - NXP i.MX91 MPU processor
> - Up to 2GB of LPDDR4 memory
> - Up to 128GB of eMMC storage memory
> - Integrated 10/100/1000 Mbps Ethernet Transceiver
> - Codec audio WM8904
> - WIFI6 dual-band 802.11ax/ac/a/b/g/n with optional 802.15.4 and Bluetooth
>
> Only SOM-specific peripherals are enabled by default. Carrier board
> specific interfaces are left disabled to be enabled in the respective
> carrier board device trees.
>
> Link: https://variscite.com/system-on-module-som/i-mx-9/i-mx-91/var-som-mx91/
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
>  .../boot/dts/freescale/imx91-var-som.dtsi     | 456 ++++++++++++++++++

what' difference with imx93-var-som ? Can you reuse it?

Frank

>
