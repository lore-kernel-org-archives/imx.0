Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010003.outbound.protection.outlook.com [52.101.69.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900903FD13C
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 19:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772479730; cv=fail; b=TiCu6+6xeF182yzY5AlLNrz+8T7D02bBJVq2lk+l2G1MFtq6UnoUBVtYi8TkeO38xSghhyKH1dCTVO1NTAwcY4u6FGKFOD9iODFdW7uFQOQBelFzOJLBRas1n++tiWAbYploN2PKLBDNGAAPxC7mK95nbmD5/XtpNK4QWef6RLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772479730; c=relaxed/simple;
	bh=DbgcPw3FFTnAZCNrneXs1BnBrFjZe68WrbYTE1Uopwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=N5oEkW6f7Mx8HPuI9gaOvcCeKhcszoJJhrx0bXL41BJP7vDi/c86TSpnHdZJqt3cbuLLaCWBj5BCajJjzxDJ7yz+xZXzsaZ05hcb6I6mBnflOo/xEzbYJQFjRfgM5diAUjrOr3WwUPbi6Barh0VEzTWTwtLzL8ojpgU6x8SkpBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oXJ2tjTq; arc=fail smtp.client-ip=52.101.69.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oXJ2tjTq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T0EeUrRa07mxn5TcSTzgKLFX38NFKsjyDYhef+UoIA4WoCwUV4QEvunIu+iSE6qYDgUxXjo2ml+EKN9LzvE1V6AWnq6Uif7PJrlok6OfoGWCtz9urfBHzA3YNqnmVCTkSYcxVt/fAltRNEjab78LdqNfyvHRt2973PSk9hUBoW/9yBZgC5S8cRUFeSfnDuAeqBX/IbrNCxpR3sgHZ0C2y0gl+x8T4MfAGQOGJnqipjMcqseqYk4x1IGBVmkEFSdm4sSZojN5Yh3T3S4pvKP7lmWvvzIOEsu76tZbze6vme87h0USjbHgUGN5JcYEw6elwGyqDVS5K3USkomQc6BlAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uDohizxYP9zySoO8gLptzKpamw/c8kui/s58xhY6FNY=;
 b=nMphTTIVQ3eT16J/VfqzCzq78Qn5KDMuaCz++AFsE44AaL41HHwln3HvJ/pzj3acDedvvrArhDzNx19VqSRNdwiS0VGoQibRgtSPx+fSXVIyQrB5+EwAckrb31VzJVH07QlCzLW6wR8vQP4bjkQldk42SOk16tS9aZESHghGJyOZuzokxqgSd/Puz5aHMmfEIWQxCL08UkhBH+E+BPeyciT/EqR9oGLGQ/tkBDAqLN9y39D6nDzXcEhI9+Bhtsf3GmhdKWEOHcexV9ngKVVY/92CQFFL9i+1nmAsbbEO8YgmkLKcTnYV+vaX4QvGBRM7VJ6C3Nzmy2p414/6KvLhsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uDohizxYP9zySoO8gLptzKpamw/c8kui/s58xhY6FNY=;
 b=oXJ2tjTqvMMPIUmKti/rZA6RFWZYR3bHIwpb70pWM+oIORUSuV1djo8RegM9DWCB8WP1EMKiY6eY+3ooWMVKwYD5ZEfRxydY5sRi/3BFzLSi814eOyv6svWNAflBUZBBLNtiAb1IF1uf8XgDBpLA778VFPSHwpDpb1ZpOmYtB6ydH4M8aZr17nHfGRks5qcFq+bs3jOh7iU6KNd7whee6AmKmIg6khUPtkA0W9sffTMHjX0cVHK04JTTT6u7Eb6ssuFHJNkEDQ/cr1pUw7RKVoF/YoSLAGc0Etl6Ly4bH4a9dmlfam+vX0YrwHXREix6fcwsKdTxbDhEEo9nXFdLXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB6798.eurprd04.prod.outlook.com (2603:10a6:803:131::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 19:28:41 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 19:28:41 +0000
Date: Mon, 2 Mar 2026 14:28:34 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V2 2/2] arm64: dts: imx8mp-evk: Add usdhc1 for SDIO WiFi
 support
Message-ID: <aaXk4pdYZG92jHVc@lizhi-Precision-Tower-5810>
References: <20260205073454.3709673-1-sherry.sun@nxp.com>
 <20260205073454.3709673-3-sherry.sun@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205073454.3709673-3-sherry.sun@nxp.com>
X-ClientProxiedBy: SN7PR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:806:f2::28) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB6798:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b355baa-9686-47d5-854c-08de7891e920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	vF8O3ozNNNrO2gOzWpj27cSqta2Rq+t/Hdp8ksCLLIjPhDYglmskAqUxUyb8FVyZRcPz1p1lY1cDkaX+7+8Zd7krm8M3xpIDLE8d6cDawojvCOAGTo9UtZOTW1uQUbVdfmU9HRu9fbuQV/lYnTDBNGuJdc2r4pEVQuVRJbPcO8LxA4ycIcL26B6/MZ22i3DW/WrYioVSHJM1z+Bncnhhu/I6Bmov4SAmReI2YI52Eum9pyCfICwUGmbEI45r3JzFv8DVzyuXGxb2JcLE5+F3Wii4Z7V+UwXySK+aEiM7W/DVFCV9HaqaJ2hCz1B0a+fwIfJm95QUcV/70y+KEzXUv9iO53b304BtauWxw+lAZzGVwPEYu/s9UU5wtiwLvgp60pM//c4bH3I8mTY9CDaRaCZ9lZSfdfiUPxXN7kh2pIBeC+tasH0SkukOuxz4jd6eXOFs9BgCPnQ22D50snNauH1irV1a5Fl4OEhdFk4kWoEfSGZji7yC2pxRqan0G+iaeMVp5Qh1UgTNGcgOO8LttPC9O4w/ozRT92/6/1wc09s5XXGXC3UwTn4bEfls4s+JESv+2NEABGXpXDxk41b6sZMQ8dGCAIUajLxMnhQYF7t8n1U3JAzr/itiDz7rL0h5aIZD/gWcQtXqfhQiQ1W5eSmkZvKuL3LlgfflNHMM8U1FSCfG4L+RKutNRpKz+hft16KGLRovvA+rwcCstP3CvX0zWDXEkG+bOrSzFAZqDrP9ffL6i7yUxkJJdQx44Kc8bVlWJBCtt6UpPiG9niGHP/eJfTassRFtpn7KzBga60U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uuGjmJkpjibCi5Zo803GUBDEePCUC9fEwZNvBuDjWiZOFGJp+Eo4qWOp2YbC?=
 =?us-ascii?Q?iVu4n+1spHTjcvi9VxbhloijwCrmqVnqEwho1ITZJLG0KsN8Rtx8VbXAXJly?=
 =?us-ascii?Q?MR1t/g6wlCFvMKOkQnrw+xOgaqQMMwqpNJvvEw/LMVjXcNd3bXc6lYawb5fx?=
 =?us-ascii?Q?BtrOslELn35YYp/QGMneSW+iYT6BkbBexKwvg2xL2pjkz3F+BJjb1sidqFRK?=
 =?us-ascii?Q?0ag3ig2u7HXTb5NldLy3xNxHiTMDLido/6ZTjrwMUZpbIeyafkNVlVQ6+YfC?=
 =?us-ascii?Q?bhPCtSTZi8L84BgrUOFQr9a6KbcRK00OTrzIn7RrxSiDzCdyD6C8sjWtH2/T?=
 =?us-ascii?Q?5KETjJUkE89LdF17NVozsW9odTLXvVIv+MNH6UiYFEYVm1TZcXeFUfAjbLC2?=
 =?us-ascii?Q?RQZVhAqoLn4v3+uzdlt1cf/6lkjZqM1IZJuAOue5DYSQmJMWobodIHBnSRQV?=
 =?us-ascii?Q?KaqXAmhgQ0S87+bX3Vd+DSKtRbV9Jf26tjn/XaykVKv4r9pzkX8QeG5opdpE?=
 =?us-ascii?Q?myoy8ry2BZ8ooBhK0LUZ+8uqIM9Kq93sFOgXr0gx/02B8bC7ghDez2y/xwWk?=
 =?us-ascii?Q?HcFuxfcLQiG2p0ag0pcpYIYt2+ZzGixlxGSbHM0wO3JEOCneSS2aPq8ZpAva?=
 =?us-ascii?Q?0u4GpLX0MrZLxA4Z/hNzFwwaSI09SJARz3QTjeZ5o6HAKWhmB2wAFkmDQrUU?=
 =?us-ascii?Q?rkb37JiB2aEj1kNKslNM6P/57h/gq3lR5vjxNnnTHLfmCB7wqAWgUTCYea+5?=
 =?us-ascii?Q?yAZyAk1r93G3RtcNgWaoWcp7U8FmbN4Sxi4SJACk8jMfMh96kOqM6p0iD8Ff?=
 =?us-ascii?Q?XSKyaz2uLL6BpRc1ZGxMMPjsxQA9iUWxIr9WBUbSEKHpFQqPkaTW7EkY2w4F?=
 =?us-ascii?Q?9t894MYXJyLlxaDq1Z/Jts/ixlAFbHbQivikMjzQCqI0uNYc83byFVNet0/y?=
 =?us-ascii?Q?MHT2nrvnKGytlw/mnVdf1N0Yeg0RxrKiiaaUQFw5Lk/ZDOD0B7Zi1+cNR8h8?=
 =?us-ascii?Q?2NYWgQoGFI0e60nMFKbozGDyJDWCWaXDb9+FFRlMo8w52DEUHiLOlSDW3xRX?=
 =?us-ascii?Q?OhQzWXfVglqR/uTwe7mZjpDBDGkunGzTtKfCAAJTg75ecYfxzMsXufOjGKFT?=
 =?us-ascii?Q?oLmoHj/JGZ8qW4lZA264phZ0mkDAdsC85ic9ROGtfdUWQa9bXAMshygw0zia?=
 =?us-ascii?Q?No8/NBv522YbiRz1jci7ydzHBiZvxSxCXK1BOJgj5mjIaKsxkYyoDIkoU2JD?=
 =?us-ascii?Q?Fq/3ck383PMr6l35A7dfpgGIH1zPSvl6dfh2ZJF/tl+qHYJgNCSm4CTvO3jX?=
 =?us-ascii?Q?vTZcGzr9Ezm91fz0IjZ+QlrpSOQ8PvBw1ZRIOqb0qOTpDq223sZtD1RksP2u?=
 =?us-ascii?Q?qnl0/4Y+STCO7M3kmanAd+9YnmR/vn7cU549eY0S+WUnkm4BGOh7oZsn32Sg?=
 =?us-ascii?Q?bxY6Izux4QI5xBNtHULPii8rnI92+cBdXOhc8DrhNSpfm0tz06OGbOE35wWX?=
 =?us-ascii?Q?naEISManS/33+06PH7QjOHkVU+sSTAcXIuVV5v9TcVBnkuY46+WjCYXcD0/7?=
 =?us-ascii?Q?5ew7kAKwRPGwLXVl1oHROzo9v3uhMjBFgade2etItxtNNkZ7pUMDhSge5+2y?=
 =?us-ascii?Q?tKvLEQGi6VAThqql1vRyWcax0hPVEmZKItoAhDHWlI7sOEg4aFnYsZ6m1IuG?=
 =?us-ascii?Q?xsGDCwQ+4rLmPrj+nYH6kXVXD1/b10OKtfPjVGq4Amm3Jd5up0UQ/qoWQSlO?=
 =?us-ascii?Q?Qox/sHQkkA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b355baa-9686-47d5-854c-08de7891e920
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 19:28:41.2858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E2uOdlY+Jx46ln5zilY053hlZRJzqHySJrltdA1GhYM2E9OnSELXc+72rbSs24cpO+JDWe6eAHOWi1kEh5OIHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6798

On Thu, Feb 05, 2026 at 03:34:54PM +0800, Sherry Sun wrote:
> Add usdhc1 to support M.2 SDIO WiFi on i.MX8MP EVK board.
>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 61 +++++++++++++++++++-
>  1 file changed, 60 insertions(+), 1 deletion(-)
>
...
> +
> +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x196
> +			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d6
> +			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d6
> +			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d6
> +			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d6
> +			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d6
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_pwrseq: usdhc1pwrseq {

replace usdhc1pwrseq with usdhc1pwrseqgrp. Please run CHECK_DTBS before
post patch next time.

Frank
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD1_RESET_B__GPIO2_IO10	0x140
> +		>;
> +	};
> +
>  	pinctrl_usdhc2: usdhc2grp {
>  		fsl,pins = <
>  			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x190
> --
> 2.37.1
>
