Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011028.outbound.protection.outlook.com [52.101.70.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295233FAE0E
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 14:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774362757; cv=fail; b=NBVUX+51VePnqHOpRZp/7/hZTduZBVtP0QqGwOhYuWMuNgDirUlWc8df35vtyY1p56e1GrN3n8RIg1DmwpiLQHOh85HVxLnoHhREu2yHhNK8Ho7IGIhCXw0VUnVs+88J9NFCwF/WLbY05VNobyDuiWd/oP7MmKBxDLVH0UaG5u8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774362757; c=relaxed/simple;
	bh=esefpwAfx9KFBs8077bTNyWbW/KhiRt9rfApUg71BsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RdgNEcy1ZQs5aQIdl8fvcwA7rpX+NJSXvAievTDk0MQwVnh5Ve62GpP3p2bxa4lwScECK55Sts3a3cG8yEdr4yF9PKU2SUFdUukrHSfHawMebbBypwQcdzqheLO6lSQsRatnC/HuLAMEaCYT9MEgd0I8PIjMrs5QR4QI4YFojjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=G2hCzRMF; arc=fail smtp.client-ip=52.101.70.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="G2hCzRMF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fLV/BM3av3yM4a8UusO0BxoTJikTR7vHY20RJ27bz1gotLqf5ErCB9vlh5bG/JVhhRCdtAqw5LWcvmKcShdnAydppj+4hVOO4gYJ6+stXeZE7WHTFlg/EDLO0jZcgtDEGWvWpj3wnGCp1RBzBPzrmoVhSmfUXGhXecp4GoU/ACxlpdM4EKgTIus0vrVZzAIeAcX2Rm6v2mc9yp4zDyZ8G+kyb25Guejurtr/BZ//ZH6VWg8SI+unZJgrS5PgCw1KryW4Gl9UXh9xbdnL7yuDdGqP/cInvtLFNpErx6D+wsevsGSEDB1xtHHzPElXPKNQ+bVOlEB5dUbFlxC2S9V+kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjOlnVVlh0qkmgGNtWgMrzi/OQJFpTO6whWe3Yiny0Q=;
 b=hdvhbBDD/hyhUkQoRzXmmHQ9nTRhHZ4bXaU7NhW8ikGfzea8RpVVdSQNRutoSaXa+rlbK+o7sWhDk+SW7Qbacvolc+4UrPdiAbXjebEJaLgp3f7gPdlyMN3vMa+FquvtQcjerhqCtBqrRNaUbO30MNEC+WeziiHd72EpdnkJY9Igx185+Yhh+U/ngVDbDJFT3DAIoE93VoLbcfpSzUNG8S5jfr9uKDDuRKNr9qSjJavxixPOYvbD4B9FCdf4TUkpcxZs+XKjdCXLQZVDuWjl+v8UbCky4b67usMv0a5uUOFSoII738UvNpd0irFB3fbXGnkthB8BhvOyXYbsBe4bZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjOlnVVlh0qkmgGNtWgMrzi/OQJFpTO6whWe3Yiny0Q=;
 b=G2hCzRMF2RYgKkL3/zDfYeOEUpJOKu3ruKau5PJcoSmbYXXRN2wzRuqUxsMPP4E4u1vcqG2iQU7csM/LCwdWlY3Relg3wSjnld6Z+Z1XqYMKYx11tK+UEDRHqD+fX9kPkW4iqPRksUm0S8qUXb1lMfYGB+9ku0/4Kv29DqV7TL+kEX27IWNKiPQkv6e40DJI6x/A5yFnO7eR+hXrpQjp082CK+8fEmbjEuINlbWlK3UTCjGw2JULL8DNDoOyz+cErf6d5GlohiaSA7ea0tN5Pa0KnBOWmMpdXWU/HStLV1zDv1/tSW48bg55LLq27H0En2LqLQrcuD5L3m9ZjwoBBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB10750.eurprd04.prod.outlook.com (2603:10a6:150:212::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Tue, 24 Mar
 2026 14:32:30 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 14:32:22 +0000
Date: Tue, 24 Mar 2026 10:32:19 -0400
From: Frank Li <Frank.li@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Correct PAD settings
 for pmicirqgrp
Message-ID: <acKgc2uzGCCatKQ7@lizhi-Precision-Tower-5810>
References: <20260324-imx8mp-dts-fix-v1-1-df0eb2f62543@nxp.com>
 <20260324093850.GA2351719@killaraus.ideasonboard.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324093850.GA2351719@killaraus.ideasonboard.com>
X-ClientProxiedBy: BY3PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:a03:254::26) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB10750:EE_
X-MS-Office365-Filtering-Correlation-Id: 772857b2-9a99-446a-a7f3-08de89b228ca
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|52116014|19092799006|366016|1800799024|38350700014|18002099003|7053199007|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 gJ0xd6raUH9X6A1W/H7AkVUFvZ3kZnv9RDvRDa7uJyg4j59AiKmrb2wuHL2foLHD6vx7f8e+8iPdsBfm8Q598am02Uew6rD4oOORSOwaVbZX05Z5TZItmXkDUoEl3OD6NKL7BXDVz0ke8+affpz22I91VTvn68uyFgbssGnq4YIq3dfqStnyolG/48yZSASwc0e0nwCZ4PcWHDw/D6l2RfOWoLVj3XLh3ywSLHYbRQ9+YIYFSaC6VGyYK3fVEBV6P+bXJJHdmrAcin57kgL1Ks9SfXqVSGrqVudkAaM25OxG6t01bu0WVUUpJnJwyKDXbCXLzrZK/Oa/tjfjTACRHEDz0lAviTubY5/3SZ2aON2vEm4Ih/uqnyhEbDzT3ZuLRxU2+ci/UXx97P+qnzYUPYrExZB9hD+f08091ycLfNesEOz+sEb43jR7igw3KU7g52VqO1HRBhZrop5uCJGxU1kqdENKs30yFIHBJsVDRjxIEjKDr8OM4ua3rlpLWo3jG/GCkXVKq6QyZZZnmBbr/0hMNul9Qq1ch6j45ujoUpTYaiJ+ar9Z88KjT6bQAe9tOotjXsuZDMbfiFTQYesQFJqPbuJ3+LWEoq08qHJF+brRr+mFzS0KEuGbf8jyxvxRLxj5wrAAC7WDmBI/0q8xj8BxvorCi1qdskQ6fq33DnmqRcQx35LLUPTAd/Dq0BZurDqkaDGCdeiEmkmKhfioPTG6sR/J/zEOPKYFOusKSg/jrb9UmzaCf2iJAiQqj2xW7QNQYMZ70LzBS47yAq6p3T4ldXUUEbUWCzJPaV1Lq2g=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(19092799006)(366016)(1800799024)(38350700014)(18002099003)(7053199007)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?WL2S3e81Q1QtSzX3fMZs7HXSUMQH01vpSIGax2ryc5Epzt3HdQkuG/jQPWQY?=
 =?us-ascii?Q?oG/hbTLWoAwmB13Ksbz79d/LZ+r+KVBZepAhcxzUZJX7O9kZQ6NCtQ7nDo6m?=
 =?us-ascii?Q?yJaBvAFMU8i3hg8pT33/N1QRKF5hBmIuCoySlycApFS5qbmdi8uO2iixYafk?=
 =?us-ascii?Q?Q7TPHAgm/v8XWctRRwSuF0FgwNF4zd9YnCqcbYqkN9PgspJLF5PQn85LGXin?=
 =?us-ascii?Q?rnfWfub0ujEoeVTc0vaekb05sWsLCqzI7FCLDt5V0ZXH2qJ04fT71aqOXX/1?=
 =?us-ascii?Q?NNGro3jqVn26ktEofrWDIiY0pVnLbbhQuvqHksCa06BwTK6TJ/g5X8bPler8?=
 =?us-ascii?Q?uPdIgRsb1jyMqaaehmjl4/FU1VxcB8iQlrPkdFSwdWE5i/5mHC7MPPjOdulp?=
 =?us-ascii?Q?Db2X9mH3V0IktlWkbM5VjtnmEsBHcQGWnrq3U+Tv/FowQ/dvnTbWHQD10KsF?=
 =?us-ascii?Q?FabHDUjRXh59eTuRCfedqwaQbBjt6IFsG+zVupT/dIQbP+PTbFrDa1ZEiD5/?=
 =?us-ascii?Q?cUk+V+dMY+ViX0wrW8+5XMMcMy3yjadJ8v3d6Vwuf3cy9k/9S91wX+OrNNaO?=
 =?us-ascii?Q?z5Eo9Zu6Pm03F/QGdrrfs2fZ/99QdimvFaNnTLzGXpEUoq2qGIbXFEwHcTZX?=
 =?us-ascii?Q?wNV2DN3vSRx0/7yV4Je6LaoHjmuHADe0ohAg46Dl0ZjfdTOgEZZ0OV3at6tk?=
 =?us-ascii?Q?aiKa8p55R+6t8kJx4SQFFfLZe4ARhr8Kv5zKDExYC4tWqKaXAgBDF/+PrNUR?=
 =?us-ascii?Q?v45QaGgasoEmPkPiTCWHF1mT9fKTDl3RCZpD+iX8v6KTqbeQlbNAMnbQRPz4?=
 =?us-ascii?Q?doD9ikVgUlEKjy2wXvR2QU9ixbKZNI4PsTMEiVkQ9/Efy+SvZkYZeluqEJpa?=
 =?us-ascii?Q?KKhEAn70hSahhs5z5gcVGxhlu7k9L6rTtaNhjTfjbnKAu3MBOpQh3dM5mp4K?=
 =?us-ascii?Q?zVpawQ1K1E2AiZZSiywMFly7PydriXpFTMPSKmgapXO4QimLMa9jnye11dTH?=
 =?us-ascii?Q?byFvH2lJoJm/kBW6Q8OL/3R/MCmegZQhrHtgnfiUbv2fT9sKbDlDce6hFp3/?=
 =?us-ascii?Q?qlrjv3SAM9xO10C7zqjMsFiXEnm7GltXYlSmD6yEB9s9IDsGPtdNtSCaoYGG?=
 =?us-ascii?Q?A27wsbHtFBgqIhKoRqniqe2c0J8yUmnQ1gJP1X129jYW/TmU1FWc2nkfuAvZ?=
 =?us-ascii?Q?xTMazRPmfGwxyopadiwXvBejFDbw3LgBMVMTkHH363jqOg0VwAlbaVxDPPvq?=
 =?us-ascii?Q?Fewn2FCAaI3cZ2hyh3VGZLdrZEub2X01ds0B/f9NtNvRXLrXRzdAIagJ/xFh?=
 =?us-ascii?Q?w/GvsFREv3Pi/WnecUs9Wlz/AugaQN3wu8OznRsBiE21A44vVsvbGNCApCcQ?=
 =?us-ascii?Q?D+oIpwdpdWEnTRVVO2be0Q9dJuAA29jVwgRwdIZhcR/e6XJvuOsGibY4jK4r?=
 =?us-ascii?Q?KOcq3dmUToE9RrNX9rjHm8P5u/zl72gXTZRGLukB3rx+jBo32ZamAvKS1fcp?=
 =?us-ascii?Q?aigmBWWP5rHHqKI9T+XF8ig+/WVin2ZcwgGTJb+vnxWIUecZZKfnESHCAJ+G?=
 =?us-ascii?Q?RRZsveovpYj5t+L4TLyobnsC8qXD5KEkefjk1gXy93WUa+kpb9vECZ+4ddOb?=
 =?us-ascii?Q?tAsF1umyO4nFqBUKnN71qHuQAe56+76w5fDIpoPF8rDcMklwlFlnjS71DI2U?=
 =?us-ascii?Q?/XJsM0rgmT2HKZ0YTlASBLSWxhD57m4So5mOdSQ8OTsB02sPlQlu4v9/WXm3?=
 =?us-ascii?Q?6UfiKoq2qw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 772857b2-9a99-446a-a7f3-08de89b228ca
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 14:32:22.1116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2QuPJRdgF7rZVd6apcorKyAx2XBO6VKIgEg7TKHNhtBUBVw+Xxf6flgieg/+UT1XnMUQ6QUaW0kIDAXuqq7eHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10750

On Tue, Mar 24, 2026 at 11:38:50AM +0200, Laurent Pinchart wrote:
> Hi Peng,
>
> Thank you for the patch.
>
> On Tue, Mar 24, 2026 at 11:16:13AM +0800, Peng Fan (OSS) wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > With commit 5d0efaf47ee90 ("regulator: pca9450: Correct interrupt type"),
> > there is interrupt storm for i.MX8MP DEBIX Model A. Per schematic, there
> > is no on board PULL-UP resistors for GPIO1_IO03, so need to set PAD
> > PUE and PU together to make pull up work properly.
> >
> > Fixes: c86d350aae68e ("arm64: dts: Add device tree for the Debix Model A Board")
> > Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Closes: https://lore.kernel.org/all/20260323105858.GA2185714@killaraus.ideasonboard.com/
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> Frank, would you be able to handle this as a v7.0 regression fix ?

I just sent out fix pull request for v7.0. Wait for few days for
Dan, Kieran, Stefa's confirm.

Frank

>
> I think the same is needed for imx8mp-debix-som-a.dtsi, but I can't
> confirm it as I don't have the schematics for the SoM, neither do I have
> access to the board.
>
> Dan, Kieran, Stefan, could one of you check if you get an interrupt
> storm from the PMIC on v7.0 ?
>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> > index 9422beee30b29c5a551b08476c80fbff96af3439..df7489587e48ed0c678f11291f6f2b77082ade95 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
> > @@ -440,7 +440,7 @@ MX8MP_IOMUXC_SAI5_RXC__I2C6_SDA					0x400001c3
> >
> >  	pinctrl_pmic: pmicirqgrp {
> >  		fsl,pins = <
> > -			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03				0x41
> > +			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03				0x000001c0
> >  		>;
> >  	};
> >
> >
> > ---
> > base-commit: 09c0f7f1bcdbc3c37a5a760cbec76bf18f278406
> > change-id: 20260324-imx8mp-dts-fix-512530fe4dcd
>
> --
> Regards,
>
> Laurent Pinchart
