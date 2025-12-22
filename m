Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011041.outbound.protection.outlook.com [40.107.130.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD882FF657
	for <imx@lists.linux.dev>; Mon, 22 Dec 2025 02:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766372144; cv=fail; b=EaobE/gm+aos8d1njPBZgzIJmc91mcTt2qA4oKkhJ/0sZwxfvqijl11zzGnUDGcqKjJ5MPZSF3ZEulhTahnTFow0MGCYDYDDu78f6v0/vpqxv/21tXpU8ES6KF7Z28JMV2InvUSuusrB3hGJezhOGAGymYewwgZV6339q9U1a+U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766372144; c=relaxed/simple;
	bh=XjStqnpQqrccjRtKgi6zwhbtFaTKPrqYA6dFl3FrpJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Mirb3Sremty+n0R5NVQNBDQWIWJP1IdCwoQ9Day9hQdWc3Bb0L2NH/HYe27oI4EIdYwbGsdaGgt/1TJVuJLPEzaiLI5otPIhml84YbrX3zXPHcydmdraew/KYD6DMehLqGeZh0r2uFCPAzDmgJjmRBH1KVG6rdcuXCVJYITSWwg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=OhHGfOvU; arc=fail smtp.client-ip=40.107.130.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="OhHGfOvU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V08zY2lozEdN5nVljkkP9hxMaGBh147D4lnkShTGoeZMBzv9Fr1gIRJ7ig9ZA5izvmoEjnyedXJfWrE5axfqG3jJBMUid6RXGr/RdSxVHe+hF9h6dR+H92K67Fd9XbIDSfWp1ntKauJMNccQDPLTJbXkL59BTwhy3TYD+O1sWsm9a3dvp6/Sb/53/tXXFMQiia9bES3DMi/+519ZOv2AHm07bPvqXls9a5n3BQFG7JiAdsy1P3/MNIp4OgInDbY37IOixJM++qn/FB466/Q7PovtYjd3Y1/cccSyks4BaCwRtQs2BkGPP8QHYcIMeLzXwO1AvuuaIkoAwfLlskJ58w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wwue8fHFKDA8MLJIDacdWg7byTXo8CWghuyC9hAK7LA=;
 b=PKw1U58bk667uSZ0Nn1yEFWHy+wKMecjdwWks7fZ0tk7LZNJAXOSiJ7I6cAN9paApr++Cr1yHluYag97g3n5vSWm4YKq/37cViDLIbZi4+7BZCylsP+f+ZFzcTkrB3vh+1VWJmcFsMvpo8phGHE46Vko1YgzHso2IR4W/MciL1cYpw8sIOkVsxZreTkAc5WNYO7TyBFyonivIcvAr42HrPADrlrN6n3pa2Ieayow4ZMa/KNZouPZrDtfKwWzhwUPAc7eNII2/2z6TjeNwwLWsuPWOqX10rW+7RXAO+/z+wY2xR7tqUc5eECqT7g2xrar/89Xv0gAf3QDmrWii++BhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wwue8fHFKDA8MLJIDacdWg7byTXo8CWghuyC9hAK7LA=;
 b=OhHGfOvUKTd62UqMkBcY1ZHdx3mwzEn1jFhsTx+UjULkFrUyBPxWsHKKbUDbgjcwQh/puto6UxDNJuIMi+1x5ukajVWPcoqyrOSvOb1fmB7VwEE9VDAc9Q8s0o0wbVCG91btphj4j0idYajI3gVZ3ZfyKniwUb0A6LCRvP8lguFLUlOtYeayCG0equw6ZYlpIsuJOwjV4a43XduyXGNIHooLWrCUh367udsLlE1gu5IRPESWqziKWzNcmuQadGsdtqGYrjC1FomhVJoWopnTCCI6+yZD17kxUmv7GyY+U1RB8utKqrNMvzKzgG5Jx8UnL23sArPi/JuruSfm29bQ4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GV2PR04MB12018.eurprd04.prod.outlook.com (2603:10a6:150:30d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 02:55:37 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 02:55:36 +0000
Date: Mon, 22 Dec 2025 10:48:32 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Frank Li <Frank.li@nxp.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, shawnguo@kernel.org, 
	kernel@pengutronix.de, festevam@gmail.com, jun.li@nxp.com, 
	linux-phy@lists.infradead.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: fsl-imx8mq-usb: enable RxTermination_override_sel
Message-ID: <iik2dnzkw7fxqm3qlzt3vegyoabgefveopdmwzxwejof2ytrho@dbnq2xj5suaw>
References: <20251219083004.3883898-1-xu.yang_2@nxp.com>
 <aUV0vn2VPWKAh5f7@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aUV0vn2VPWKAh5f7@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SI2PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:194::20) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GV2PR04MB12018:EE_
X-MS-Office365-Filtering-Correlation-Id: 41fc8a56-5083-4e36-1f95-08de410594de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d2mx8ZKBE4Mxzt0Q88PWHKvaLCGAMKQPEVolBAAuk1otquYPeRC9f0K4+gpc?=
 =?us-ascii?Q?xL7Jmz3zkd+697PqNbFxEstbF0K6JnJpshbCCPyzIsoY2I2lSgxYpMiTvQHP?=
 =?us-ascii?Q?DiY7IImpn8Gz1EYep14kqGvVZQqfoottYZSHeVE3f+YHuHl4aHENPAZNSS4c?=
 =?us-ascii?Q?qUk4O4r4J/5O3NzzHkMTpH+YhW7l0PyJL9WQgkBuChN/dDICAz+XEkqrLBdr?=
 =?us-ascii?Q?Fc/lw6bXJsByoWim6jjSdkdVITJIJKLfWlBMGfU1cJ2W4hkASYJ+dypsHeTe?=
 =?us-ascii?Q?4L9cBObBVAO+0ujbRvMk4dfqW7m3cBLcY0OI8WNgpP3ibhVA1bENVI0HqkvV?=
 =?us-ascii?Q?JgnuvJ9JF96lvfGpHEqQs0cBj9azCxEfu8CbzoVykT+UU+1x3yU6TSlUrW4/?=
 =?us-ascii?Q?01lDR0ex1FfpPSqZADsmErWlzo1lym2zSyNxHstn4TZtHp67kIKECfTq+ZqK?=
 =?us-ascii?Q?O60aqIt9P3PhRIxSPRkpVTXoeSQWa55gWAyHn+qup1g90Vjjio2kYrIbxBbx?=
 =?us-ascii?Q?du7tORlXSoAK/3bDf37OMoNFkPeep+CiQYNhLwPduoIYEx9vZ6yvSinvyFVW?=
 =?us-ascii?Q?YMX3Y70inyrlFrvXz4unjLF46lvUmIgaJs6TS2Wc2ixWUDvO5c/lfkkuGqY9?=
 =?us-ascii?Q?goC6ufGCDcdFGx/SwbfMA7T1EU/Yj61qmtnWAlK2ObIdm1k+Tr6ZFbYfaiSa?=
 =?us-ascii?Q?YEKk4SVtARnZUP4HNtZ5uQyT4M/iUAQ6Z8MzzsDU3KG7iU4lvZiD4JIOvhCL?=
 =?us-ascii?Q?MXXCcu0dddvlDwlRbAPzewhxjhXVcEa5+au6ONHA/cUuBw232s+FnEmoa2UN?=
 =?us-ascii?Q?6gV7Vl3R5tAWe69PSPW/IfM+ca6gHh0SPXL1Ul0MD5NtenEdrS/kATq5rdMX?=
 =?us-ascii?Q?RVRadwj6dzzrk1WntmFZJVvt5F5NmLdJ0g7a58nWwBaq7Ag47Daa1kklOsbt?=
 =?us-ascii?Q?n4c1Xn7cNxqSmHdvDGQ5mkqeZVkA0xLh/VRX7aKZ5bRxH7fzXgYTwW/39j/V?=
 =?us-ascii?Q?7hz2pLAYrYffHDmU+6Dw3uY3m3+zo8Hx8lIGi4j98Xev3YacRQ5rxBPtzeun?=
 =?us-ascii?Q?WA0OVYhtUf7FFuYS7xJF40RfeFcJ8DO/WgHOitDl8y6zDd1BIe+VoS7zLCxW?=
 =?us-ascii?Q?2x8gw5dG5KyXOaeJV70KCKoqDSyUEzO8GjwBS+TNzkoY2Dq1ryA4fhrG+ywu?=
 =?us-ascii?Q?yH/eHPR9WQGau7dFT2zgrH53Uht+cAog0oRQQAhhLUhY8GHVRibJTr9q01A8?=
 =?us-ascii?Q?7vT4S4H+pjr53JdvbmlFYiDfSB34XEY4V0dzjAw2yhVN1UuWGMLu6vOGOVxx?=
 =?us-ascii?Q?qPjX5IhAXknNjBZoiwvg5/017UpCeD0jKTifPnZFGVjcFvfmTQg1ri6eKz4l?=
 =?us-ascii?Q?Xni9izYpkXqSEVckm+HXYx6c5JN4uexoZFzoVrPGZWqIvbvLWUMAadUsH5jl?=
 =?us-ascii?Q?X06dYpHzGVpgQuSD6agyODgiotmoUDG6YapvCy4x3JFQoWZ4BK+GZYaqB+0c?=
 =?us-ascii?Q?8szBcnL24scSKyLTQwzazGaoSKMZfgqB7zle?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cPO5fruQq0QwfDUl7cStgpggGF4wFc5ojBT4GQTaggVkqfJsY4APCF6W0v1Y?=
 =?us-ascii?Q?g3jK/W/QnuDQbjn8/pd3dF4R6914vIlqGYbSUOifKXwrdqQ1Q6KAhMKfdLN9?=
 =?us-ascii?Q?g1jQMSKO5rg4QyjchJph2tOSze6g1kxcrmWq28g1H4/DJQYuJDW2XBllhszX?=
 =?us-ascii?Q?p5iM65RQI2UVXz5LhsgKoWrlty44D67fUPIJsJ7c/ElJ3w7Spd1chaBa8lNp?=
 =?us-ascii?Q?S0GnC8jqTprNDSwW1eEJK8BvXK5QF1pkJZ6XwVuWbT5IEC74/ADDzg3Hbqm+?=
 =?us-ascii?Q?KSoOZBUhdvtIQydU3+1kbKib2QOeT7yh2UANeko1ZRBZn1QU/DY+17Br9WDN?=
 =?us-ascii?Q?FVRz4YQWLyrlw082U3xTuNpNR0TwU1Q016KnI6E4t6VyAzfbR/8oZBVjcuXU?=
 =?us-ascii?Q?tHVnJF/n4RHtJvR4Dpkiq8IITY6LK+dzGxInO+BSMAdKP5DLgVEmNFKLkLMg?=
 =?us-ascii?Q?MkY01U2ZNq06xDJ2dzFQ6mnEbPbTafIE4yqWqG1eNjBYk7SIOC1SNa3ONROa?=
 =?us-ascii?Q?zWYWTNr8zDtKICi/6Sx1Q+zmku7NlLuaVVI0hHJya4mfOBGYkgbKdjB3x6gD?=
 =?us-ascii?Q?rsyWCNity/qSwcepbzXPwW+Mb6xSvYEjEVG0wGSOPp+yvL3cpsoEF+ONV4xx?=
 =?us-ascii?Q?X5aopocL1IGunCTqpKgISUBFURK+l46s6Jb7D9hvg7TYwJu/L9CNFKRLcpI3?=
 =?us-ascii?Q?UdZylLVNedPvtlemmNz6OD22/15Ex1LuBhglTplDh08bMQ8R+OuKs/3padT5?=
 =?us-ascii?Q?b13enxvbDTLcjEJdLWf9TsGPJFHoxvCvK2XVTqj4ifa/1g8l2DQywv7uDI++?=
 =?us-ascii?Q?tXX5hlz7/ymXm3gmanP5JH0ZYadFgRlO26s9B0koOOO35tjzK9XoXfJOJixA?=
 =?us-ascii?Q?pu63gKccI1OKQ4VRoFXJ8mXSPy9EfIpsCzr72pWW4IiW/CADNqEERCFs0m12?=
 =?us-ascii?Q?YTnn5PPCve74+qXaY8W6i6Dwy5uWFLCd2NaWzFbi6z9Qt8c6Os/TWO2QyG3V?=
 =?us-ascii?Q?ZSzIKHaN9ictbfdcb35o2h43HUWGBZ/5lF6K+PuXpYj5SWqyUZdf4b9X7Gxb?=
 =?us-ascii?Q?eSceAlJ/vi5pWa1DImofpo19p8Or7QXmV2E5ZH9AI/McrDMwktsVUXrfm+Dc?=
 =?us-ascii?Q?Y2UwJd22kexUS4Wo9YXZPQJMf/MZAcpNdeeMz27H8tXBBL+3NluwQF2RS0b7?=
 =?us-ascii?Q?OXPsFxPra2iQAsMUkIiX6iqZl5vzdPWdM5xXEFXVjRzhZaeWJyNnPKey1ciX?=
 =?us-ascii?Q?NkkhYCSW4DM1FZNzmndV5535fZWxvGBJfnq7IHNUvhQnE2d+1Wk1CCkM4/yv?=
 =?us-ascii?Q?6SrkrDAyS6vsyQCkGFGYcw7e65AKZg1B233KA6QHm1cbD7+xt/UvtRHJmbWH?=
 =?us-ascii?Q?Kmt9V0f6x7bTqFhLh2387/bYaCSl5ngCsoWFeILt0vgzUghUdBEKoMOVx8Bs?=
 =?us-ascii?Q?lYCGLL8wmS9VbSLlzeVjIa/JDKb92t1opjZAdwpqK5JpkNc4oxXXew8XKN4v?=
 =?us-ascii?Q?N9U+QhIyFqggJu0kR/l+iQY4Ny9xIAPylhX0J+AborKcI0dUFfxpyvNZ9XWV?=
 =?us-ascii?Q?XvhjXZGkYrHbLALKZHx7PI9SszSdXY9mzbTL6ZWxQTRKFOCzWKimLFEjWuqD?=
 =?us-ascii?Q?0Kik/8vSSHtJ7hUvrrt4AIfVh9WlXjdgSr9FZy1gSBehPwLjDjw4crXlxR4g?=
 =?us-ascii?Q?zNYbZx/r80Xm7y3kbiwvktVgn13h+FplTuFJ78lqlvq6LaHwPKxiQSQNrDQ9?=
 =?us-ascii?Q?5t9TjC6bxw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41fc8a56-5083-4e36-1f95-08de410594de
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 02:55:36.2819
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OYsnkn6WpoOG4R0FStSlUT5Lx8kOhLjOWhTCB2I9Wr2Y2HHydQ9xO0kBmFQ8X/9iQfpy9wjA7uUnEna9vMo0Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12018

On Fri, Dec 19, 2025 at 10:52:30AM -0500, Frank Li wrote:
> On Fri, Dec 19, 2025 at 04:30:04PM +0800, Xu Yang wrote:
> > This is to resolve the problem of wakeup system by USB3 device
> > insertion if HSIOMIX on, in that case, the USB3 device detects
> 
> Do you means USB3 device wrong regconized as USB2?

No. This patch is to support wakeup by connecting an usb3 device.

If the HSIOMIX power is OFF during the system suspend, the USB3 device
will downgrade to High-speed because the link training does not
happen at all. Then DPDM wakeup can be triggered. 
Otherwise, the USB3 device will still work at SuperSpeed, but the connect
wakeup (different one from DPDM) can't be triggered because the 24MHz OSC
clock is required to be on. Therefore the system can't be waken up.

> 
> > RX term on so doesn't downgrade to USB2, so DP/DM wakeup can't
> > happen, with this override bit we can force the RX term off when
> > enters system suspend, and disable the override after system resume.
> 
> Enable RxTermination_override_sel to resolve the problem, which wrong
> regongized as USB 2.0 device if USB3 device plug-in when HSIOMIX ON.
> 
> No clear why force RX term Off can resolve problem. Please rephrase it.

Force RX term off will force the USB3 device works at high-speed from the
beginning. Then it will switch to super-speed when the host reset it after
system resume. OK, I will rephrase it.

Thanks,
Xu Yang

> 
> Frank
> 
> >
> > Signed-off-by: Li Jun <jun.li@nxp.com>
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > index 02d9af409b08..0831ed465775 100644
> > --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > @@ -52,6 +52,7 @@
> >  #define PHY_CTRL5_PCS_TX_SWING_FULL_MASK	GENMASK(6, 0)
> >
> >  #define PHY_CTRL6			0x18
> > +#define PHY_CTRL6_RXTERM_OVERRIDE_SEL	BIT(29)
> >  #define PHY_CTRL6_ALT_CLK_EN		BIT(1)
> >  #define PHY_CTRL6_ALT_CLK_SEL		BIT(0)
> >
> > @@ -847,6 +848,7 @@ static int imx8mp_usb_phy_init(struct phy *phy)
> >  static int imx8mq_phy_power_on(struct phy *phy)
> >  {
> >  	struct imx8mq_usb_phy *imx_phy = phy_get_drvdata(phy);
> > +	u32 value;
> >  	int ret;
> >
> >  	ret = regulator_enable(imx_phy->vbus);
> > @@ -863,12 +865,23 @@ static int imx8mq_phy_power_on(struct phy *phy)
> >  		return ret;
> >  	}
> >
> > -	return ret;
> > +	/* Disable rx term override */
> > +	value = readl(imx_phy->base + PHY_CTRL6);
> > +	value &= ~PHY_CTRL6_RXTERM_OVERRIDE_SEL;
> > +	writel(value, imx_phy->base + PHY_CTRL6);
> > +
> > +	return 0;
> >  }
> >
> >  static int imx8mq_phy_power_off(struct phy *phy)
> >  {
> >  	struct imx8mq_usb_phy *imx_phy = phy_get_drvdata(phy);
> > +	u32 value;
> > +
> > +	/* Override rx term to be 0 */
> > +	value = readl(imx_phy->base + PHY_CTRL6);
> > +	value |= PHY_CTRL6_RXTERM_OVERRIDE_SEL;
> > +	writel(value, imx_phy->base + PHY_CTRL6);
> >
> >  	clk_disable_unprepare(imx_phy->alt_clk);
> >  	clk_disable_unprepare(imx_phy->clk);
> > --
> > 2.34.1
> >
