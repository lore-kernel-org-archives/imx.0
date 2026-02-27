Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013054.outbound.protection.outlook.com [52.101.83.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DCE43635E
	for <imx@lists.linux.dev>; Fri, 27 Feb 2026 15:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772204957; cv=fail; b=HfX45JSo67WO9L8Y7gk/h6u1f/anYgWasGvDaFaWwn+FTDKPCFu1terb3ex1AqjRQbAoUMO5kiCMb5IUA0zR/ppD2gEq1kd1QTVzqMeDf3d8B+JnxLmo2pybpHK3eaZlhyr27cx1kQd0j1Z4Xi4uLKeEJ/6vuEJHWme6Gs4C9AY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772204957; c=relaxed/simple;
	bh=d5ynbrEhuPhVjxA01XoOSe8J06lrY0j1vJerIH1eG/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=s7fhgcs5zp/dCt9DZW7kDE759HNKgsQJk9VtiUYCIn9ndmR3QMQDddctWZp/YlFCAlxAAdwP/subkUhuiiS07J7vzJbq+1lDweuHlTC7Z4D6pml4JGLRltjayeSvsSedszfLn/ALHv6y4YdpAh6BiF8AfnD8PPAPyiwVzSon18k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=YU2gaWEv; arc=fail smtp.client-ip=52.101.83.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="YU2gaWEv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MtWKHqVEd1x2h7vtVdTh3I+h/1QPz7AlbYGBQkx4p+gPx8rtYpVnDoqsCb3cdO7VuTtlE3B5piXnKZLpZuOSYIK9u7WNUFhZXSa9wkp/9DcUQYkYXmZ1FxaOjhHF21PJFBTd0H9tzoV0SPORPaVzzttupP94ULTBE6NSryIJQfpFOiT1aaFbu8jW2Cf0m6e9E/ZddEPiZ8vZG+GarQ7cJHrZGCljSCrypmx0rBOcxb3IFUoK+TE8CSzGlXiGjtuoCZhA1y0uAyRl7SjHVyLthTg+Itj7DCU76n3tmm5A/t07S0+ipzfF02M48fljI9M7QnMk3F/gwaU16eWfEwt0Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rMf7laHOqNWDPt4rr3SrdDEULQ82MKX1c2G0yAWVCmw=;
 b=lHmNlcv5SwOWkO6Z4ED9Vp4AVOeujwuplsLWWQZesF66xxLl/FD0L+suX7i0WLFF/I/QgKPiU3s+xgBz9loHshTd0GwkL8xIDSFwpaBUA6/GEpZL1pVl5VrKWym2QYncVUKXkkl1SyDL9+0HGbyOD75teT8FYUCQNEGnL77vk3LrHyFOqYcE/B1yVZhUIxb4O6DbIGq8+bHX+qMAY8HJ9R/aK18QHG/jTfn3ahnng1A4NnQ2BMJhBOffpifn5QfvL/7VxBxlvTEbzihqlr8pewK92zsw39ACt2fI6KMFTJla4gvufMsXMWY5UZchrc9EvH/dmMaJdiCL9lYWMxSTHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMf7laHOqNWDPt4rr3SrdDEULQ82MKX1c2G0yAWVCmw=;
 b=YU2gaWEvfVeh62JheeKHBzOGRPItuhNIGyMePRXhGjEbexK3BrGUOMvJK5bwJSdi0+ymDwUPPOdsa1Xo3KiOUsH6VbwZZCr5o8AW3Dubwzhxo9vRsEitPp59gnEFdCRD7MWH/n4X2QzRXz5Owja7FsxlW+FSVhcmay4txq7o5pPnKTxcBE3ZCYyH3fmE3zI1LfRex2Q+pINn1RgCK9SJ/iQBU7x89XZO8e2aBTpzcTV8rGt9jK3KI78D3ZtpLCFALFnsfeJQafOkrEAtrF8PDQDb3qtG7FOa9TdfBRXtJSsiGnXVzElztb7B3VNJX+NpTb0ec7ef2YWdOi8jsDvU8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by AS4PR04MB9715.eurprd04.prod.outlook.com (2603:10a6:20b:4f9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 15:09:12 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9654.014; Fri, 27 Feb 2026
 15:09:12 +0000
Date: Fri, 27 Feb 2026 10:09:03 -0500
From: Frank Li <Frank.li@nxp.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	maudspierings@gocontroll.com
Subject: Re: [RFC PATCH 2/2] arm64: dts: imx8mp-frdm: Use symbolic macros for
 IOMUXC_SW_PAD_CTL_PAD
Message-ID: <aaGzj11fjemaKLrQ@lizhi-Precision-Tower-5810>
References: <20260227130242.1702329-1-daniel.baluta@nxp.com>
 <20260227130242.1702329-3-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227130242.1702329-3-daniel.baluta@nxp.com>
X-ClientProxiedBy: BY3PR10CA0020.namprd10.prod.outlook.com
 (2603:10b6:a03:255::25) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|AS4PR04MB9715:EE_
X-MS-Office365-Filtering-Correlation-Id: 6262efc8-731c-4be8-e047-08de76122a34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|52116014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	mXSTnagKZPbwn/G/r8tgCzsZfqJSiM7XaZr7iZNMMxzZ4rE+X4UVGKX+WsKJxbs6bL5V8lne67X+UduROi/5xdIz/ILeW9r5yDvhEe85OsgwFr66YjpnxuvSgPTl5Zb9O29jHwDN9rtoYxXJxiJrMatIoSEiKuD5ZZGAukYJx4iEMBgykj4nv8ioBsXaRyVu/VhJiEKtRh6/HZjIR2pI7r1k4irvSaDYp4T8mx9ssbM2rvn5Q9C9JADDhoJbGtJ2FkfbWUl5vcAJjBJ1fBUACuzIRcLD1h2OyWfKeZC3X3e0SoXBlpDGmV+UEA3GgilPdOkFTdxRKl5IBr4idnbDwgxOqC6M3gsZWjnZt66sVpQZUpeT2oCRznQov7C6yXsrI9Z5lP/nC39TG45ewRlt8mdQxERnKRyA2u/PNcPz3HkybmtRBV2ggJpTfK9WSC+BukFjUPio+5pHAYYPZ+VF0eaFfOozjWaRi0htMftyeRps05TH26XwzwPhFznCaB9qW7STgdbdlDP/9I94RHANNfla5ycSL50r/zHcH+yEXyXsvk+MGR6Mx7HnVXhPR49tsDvGqWv4mr9LznS8wMEC76mrHw6D0qpRGwv7/Qg6iYfxPjL1+ONCy8lv/jDfY5HWikGHJg7d76cJfFinb3bOZKL85Z7VcMsBzTBSYiQfDLdaWYZKpX6scs7/FZnluuIVRlcjnOYcfh2VC2UncGN7Ru6pZgJ5DYcDL3iZCJaxx8jh3c0AuiI+m4MFE9pI77vTB98SKwHm21CR5R42w7ujl0Joi0gyyYE3X+v7E6YNT/M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(52116014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZD2oOinpenq3FGQm4U3VDfCWZFnl2Qh0OXcxuJPCTOLOEq9qn3mpy0Q4OhEZ?=
 =?us-ascii?Q?10M8O1ScufrP+GVlAsnmXOhufPXsaF3pgQxlV+9nIHI4D3OqlEbveaxOmI2G?=
 =?us-ascii?Q?3QAorzKb5G8WJH9LjspqnGAHzRAfB+z+WRaOnL+/LViUrfd7oPrJ7+ZQOCfi?=
 =?us-ascii?Q?MejryLrraX2xxTfOzMaJmq7Ge0tiPRH3z8nMdyXThaUEXLHmxSL2dIa5NE4y?=
 =?us-ascii?Q?R+If7UEcmZaaM6aF6c0zi0jNd4cy1Ih71IGx7tp2OFXVUUp0D0BFTql7z7I6?=
 =?us-ascii?Q?QGq9ptMdtwkH/LwmDBx+pXPcYsYrlbPXOx1PMf621AEVv2DEiFYCy5wsDIU2?=
 =?us-ascii?Q?Wv2HgG9ilyA+v9ufcIqtggVYZD56hrf0MUZO1q9EyRL4PJ58lvuo0fI/9TH7?=
 =?us-ascii?Q?2TaaU8MMRagSZKwCmM6CFz5h1n+4vSZV/Jb3Sn3BpX0qaOko20MaGPIxwbJI?=
 =?us-ascii?Q?zz1UDmpuiUDC0rN+tkagIPx6LekKPwg/V48/9gMBpXr97Lc5JbrUnWqvCoC1?=
 =?us-ascii?Q?SXgnVchI4nbIhGIuF9b1nc2kfy1ERTxvhSSAmsFrx3fo3AzTwzYJQ4lhCcbp?=
 =?us-ascii?Q?vo9AgMOXG7Ri0/Zyj+qwdWVBRHriLReYDSlvGCXmOa5+U3R/HXCvKCfgzX/C?=
 =?us-ascii?Q?34GV0MARuioAKKVWLjKauJ4ABpM194U7z9mvqsUAynVBrbCO1akVwCELU8k/?=
 =?us-ascii?Q?WegjeeV9/IP9AqI6NpYfAfZCLVSFaBOWeBErHO5vBJR+ERoHPozo9ees3wCD?=
 =?us-ascii?Q?f/TdLjsCsS2DuEZXSJvE5VJV5IDKy+C1YnpAbwH5dTfINt2674thgHs7IjoM?=
 =?us-ascii?Q?N5fG8imjvLwwGIfxIpXwMaOWSq79uRD/ZpdZc+IbXYL6CgiVfb7fKBmStAGg?=
 =?us-ascii?Q?IzPkbZWma2kIYbOVM1Qo7kFa4WdHXt6ROLbJhfTZ01pcIOEa3DbXQSAQfeNl?=
 =?us-ascii?Q?huQ6iOefQgmy8pGcu/Fqdyo3UZIrvTIh+u0gRxOOqwiufRnfgU4y5NYycf5y?=
 =?us-ascii?Q?Ptfvb7N/ZoBhPo4fqngbckHGZXS1Wx5nCj9KP5vykFYEH+Tq0S0RgWXKRr3D?=
 =?us-ascii?Q?cxDbvS+pt6q2IBtnxV8zTV6FbRHK82kUOKonoWF1KB7IBXFs5+2zwvOs5tyD?=
 =?us-ascii?Q?rG+co30qneMMeMsTV6Kwj8mZCh9gtUWVr6Z+C4b0Nuv0Q/gRyPb4bFVQafzm?=
 =?us-ascii?Q?F5y0WSjVJQiSf6Xs7YpxG+x31mM/E2J4F9NCstT3B5SrrmNqYEBaYCkX36KO?=
 =?us-ascii?Q?iOsH/tdgFtSlVlGmGfOIcUnTR4WQjvNiFj+0nSMArB72u3cEUPZb3nhewX0k?=
 =?us-ascii?Q?VSpn9JIp9GhYZIb+2H7fJVHjcX0cr1ZxSE+lg3gHeEX0vYfX7flormr8Kop+?=
 =?us-ascii?Q?5EggW65tVuO265qB+iwt9K62Rojs4WEPduIW4hdIA5b1IAslgQhBlTlExNfi?=
 =?us-ascii?Q?AnO44QLoIwIftx6dXe3Xzk/bbWA/6k7ALPmT00dukQDgyBtdOH02U4mve9/f?=
 =?us-ascii?Q?LSxcjrEC7ebZ5FMaZxLPlAqa1tT+gBH7I81rEsEzfx9rXw09EweAYBK/j0ra?=
 =?us-ascii?Q?l2HDfASn/+/PtFcmWgBOa/2O+0uLl7jYcSplVIBKYOKtktFP56pEsXthHrGX?=
 =?us-ascii?Q?z500cNz/LXwg7n23F4IOu1Nh9f7rK9KIX1T5tk86Zg0dg+OM6tRKzqX5iyce?=
 =?us-ascii?Q?3PMEfz2EwqdZkwIxbKLBpakjj2MNdwstLUzc/WgeVAxmaqcz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6262efc8-731c-4be8-e047-08de76122a34
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 15:09:12.4330
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jE5pfo91OriTsmojx+FcRSCqIfLJrxfL7zrL2rsG5DloqPy0bbn3qBX8tFCbNbr/2BgaWgaD3H2iqmS5YVs0/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9715

On Fri, Feb 27, 2026 at 03:02:42PM +0200, Daniel Baluta wrote:
> Currently, in order to configure IOMUXC_SW_PAD_CTL_PAD a magic raw value
> is written in this register. This makes code not obvious to read and
> modify.
>
> So, to help with code readability instead of the magic values use
> symbolic macros.

Use symbolic macros instead of the magic values to improve code readability.

>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-frdm.dts | 132 +++++++++++-------
>  .../arm64/boot/dts/freescale/imx8mp-pinfunc.h |   2 +
>  2 files changed, 86 insertions(+), 48 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
> index 55690f5e53d7e..206c8d939796e 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
> @@ -252,104 +252,140 @@ &usdhc3 {
...
>  		>;
>  	};
>  };
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> index 26e7a9428c4c7..c963913e3c626 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-pinfunc.h
> @@ -38,6 +38,8 @@
>  				  MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)
>  #define MX8MP_I2C_DEFAULT (MX8MP_PULL_UP | MX8MP_HYS_SCHMITT | \
>  			   MX8MP_PULL_ENABLE | MX8MP_SION)
> +#define MX8MP_NAND_DATA_DEFAULT (MX8MP_FSEL_FAST | MX8MP_PULL_UP | \
> +				 MX8MP_HYS_SCHMITT | MX8MP_PULL_ENABLE)

It is not NAND, should be
	MX8MP_USDHC_DATA_DEFAULT

Frank
>
>  /*
>   * The pin function ID is a tuple of
> --
> 2.45.2
>
