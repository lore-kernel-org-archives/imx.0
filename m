Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010064.outbound.protection.outlook.com [52.101.69.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C212D2397
	for <imx@lists.linux.dev>; Fri,  2 Jan 2026 10:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767350376; cv=fail; b=SlgllpNQTeTx0tSdUn12SCypbgBPeAaFGnRTAPy3FCtpXgwg3t9ZpDKHilKhvCCJDjh2j9kZ3iua1BN74VUqs4/qb43liXZLvPoZz0UvYZutgb4Qi74xo+muKiGWq9gamKGZC/RZTn64gGhsb4LcP0WzBKfIFqgaEKhj9FLumd4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767350376; c=relaxed/simple;
	bh=/GVV3lMhDcoey6HeMwkj1wgPmqJG4slvR+DxtXGF8Ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=n/JTFJEtbyfYWnh1uZnZ8XurMdrjnwhSvNQon05ZXQldJsEPbxlYw8NkmUmTenr11myumzC0WnBUyOuk+6BXmfz0AAgR4fVnqTUjQDcYIovcOdVQUPLDMLOcAtTEtqhNV63aSclSh0pfeucUa027iKND/EYqdd/ZT7kC9xce7rk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=DHgvTd4e; arc=fail smtp.client-ip=52.101.69.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="DHgvTd4e"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ByD7uDqd2UwXyKoQCNa7VtjFA3vD57Y+LDCjjtp4wjdr/kit2pDgtwqU86riPMd2TNP71Ma1nuHjbpqANpd0dvSEkH2kLLIC0PhCY8xMQHhH++1wXxZjprg66ks+y/+RKZWLRvPT2u248dII4GZNViuw393j4PYYulItC1/Dv2VQsD9ycRzZ7rjqQ9XlRa/uUObsbpGUC8LDaRKlTiUYe2Q4FWoBJPyBcVHhd8xDCwyNz7EW2V6tu7bC8jwFEHK6B3vEvLFemlEdjMWai4y1/EGGzTWarBYwjnOOsariB+LPJCPZFF6iOvcfyj8/91rcctQGSHVyusAOej/vcO0nvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UF621uhy7+HoJb/pJV8qcpBBnR1omX2LJmV7wcD1Nr4=;
 b=VdJh0A1YkSv9/GXX3DklKGy8PWXY7su81ZX6qy471v4wD9qd1tCtq9mmxTb1AMHU0uBOZfbbO+mDnsZtayeLgQVPnptchi1+3SgpsRerKJl1fL5mT6XNFU7iEvuvQHe8cElBN6hqbpfozhl//XZSjYXxe2Wfx1iIpfQgcWXAoFuXCiab7qESCKBLdUz4IEc9XkVSS/RuyJA6WxE/hgte+VL7x1LzaFAmWfKrzbg3husDMTvn0C2MLhVI3jtFTI0m2YmenI4WVrSbSR0jf7J4/dsMgWluHCDSaVdNZH0oGwmMt1Bau23cKHimKaPC/Br7nxr6iur5Jspl93dfxFZO3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UF621uhy7+HoJb/pJV8qcpBBnR1omX2LJmV7wcD1Nr4=;
 b=DHgvTd4eRYBcTtw5iNTX34XoT5CLh6ErGFHc4z96y2uIuMMV7rXaAcDPHouTW6BweSxGoIGx9CUOi8Rajsg3EXGQxnmjwoAqf5trnJVpMqkEBq/M3VXiPqfwkR7wS6pHoV6qsDIgNB+jOZwCEuDglaiGRRcpbhoTWSnnEUCvdlVFt2y5kQ66YxTXpRr2l4eU3SXMnrlXGbM+5FqCwwnyu/H+qJS995akYZ5LaaMyJYQ7uGxrtVgWnNjfuAr4nV15IDJ9ColZJ3r8EODMXPjzFSvqr/xQU3QpTNS/Ml6mdL8LUvswdwbV8m7S/nske/jQJ71w8geDQregJNJQeFh2aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PA4PR04MB7805.eurprd04.prod.outlook.com (2603:10a6:102:c2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 2 Jan
 2026 10:39:31 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.9478.004; Fri, 2 Jan 2026
 10:39:30 +0000
Date: Fri, 2 Jan 2026 18:37:54 +0800
From: Rain Yang <jiyu.yang@oss.nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Frank.Li@nxp.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
	festevam@gmail.com, imx@lists.linux.dev, jiyu.yang@nxp.com,
	kernel@pengutronix.de, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	liviu.dudau@arm.com, marek.vasut@mailbox.org, robh@kernel.org,
	s.hauer@pengutronix.de, shawnguo@kernel.org
Subject: Re: [PATCH] arm64: dts: imx95: remove CLK_GPUAPB
Message-ID: <aVegAt002L20oBGf@oss.nxp.com>
References: <20251231031915.752262-1-jiyu.yang@oss.nxp.com>
 <37489cb7-820d-46cd-a7ea-0f9097604895@mailbox.org>
 <aVXByNiEfC66RDG0@oss.nxp.com>
 <b2dd2109-c2d9-412e-9b11-5851485acf04@mailbox.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2dd2109-c2d9-412e-9b11-5851485acf04@mailbox.org>
X-ClientProxiedBy: SG2PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:4:54::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PA4PR04MB7805:EE_
X-MS-Office365-Filtering-Correlation-Id: 57cdcc48-7f97-4706-7d14-08de49eb35f6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ppLfTqsFLFY4kO94x64XVnyITvd0c2e18tB918U5A0+3QY2kiWU34Eb32Uod?=
 =?us-ascii?Q?pXHCNy2wcPviuKxA+gnbafB/2RoHDc+hq9WvAaiqte4eepHlU2c9PAAnY0Oq?=
 =?us-ascii?Q?vrhItfe7o1LrnfAgNtazmCr8VBPThxHJmTGwgzV0ebRDrOu3fr0019V5gwOl?=
 =?us-ascii?Q?nHhpOQCxAhEev15oeMp9oPUrKrSP9e9Iy2BYtR+fQEzOsJHuNuP749gfqefh?=
 =?us-ascii?Q?Fx1Mck7LaWMiOCQ8rm+xUe2sPMrmiIDQfA2gxb1NgnNRAYXiJEK7Xg4E7Ve5?=
 =?us-ascii?Q?1RgVM2AqDqrGya5KjfdRLCSDT+rFlaSH6Fwgs+tEdKu0eqlCAdCd570/8r9P?=
 =?us-ascii?Q?UTQkJRduMER5WT7u5OME321B1sHXD84Is3DnB68iz0wrcfNQG7ZSpot2AM4M?=
 =?us-ascii?Q?OuCNWcC/pg2qC/aRiLpBuPaCua3zMssT236/u1DQfCN/urv5v9/poRlD/Ts3?=
 =?us-ascii?Q?vIwBoJAOFMvAe0zUemFjTEvdObmbBLL9VGdwXIRyH7QINw0Tpp+6QVTXfXx+?=
 =?us-ascii?Q?tEfN7V7UDsxLeruKX0PA/GCDJsAIjNb7EfusA4X5ogbyz38HjLzRoQ0O73bX?=
 =?us-ascii?Q?EPO++TQw2Ky521s6QjffAp44oi/xuef3M9CLbxYg61O7eevq93Jd61BjLTyi?=
 =?us-ascii?Q?UgbpqZEhT8O0t/vQKeBcywfL6wtjZCbHB40BW5NRzmg+RzFH5zuvIxZK277a?=
 =?us-ascii?Q?1PJZ9mM01j/VUYoTzonPIzIeazdepwx5xHq5NGiQSliowMYUO/6R/Xv0ChEb?=
 =?us-ascii?Q?HdwmCY4ORIuLDr2vmcVOLhzI2jTOCyS4LVrc6mYFL1xxC2mL8aWTofZVxVlt?=
 =?us-ascii?Q?xHn+EbTggtDkL+JDhx5HwgJaJH674hvMvrzjEuKgMABEKNH9DIOc0aTxr304?=
 =?us-ascii?Q?XgSxvC8WALp21ywpKBMgl7XbU6FcNlXvuJIifgncj8JWMt90O9H92S/Gnujm?=
 =?us-ascii?Q?/FH9fO7uiG6tQuS3j6lNyVtExczckxx4Ozgb5UB5N3OQK311b8+zknh7POfE?=
 =?us-ascii?Q?qBcVZL4oUJUxKe+WS+bIwtSZjzSG8vG+Yz2BDBwyRiSzMoF8dr4s5tpV5X3o?=
 =?us-ascii?Q?Bhk4S8pPbl2W8J9LglS2z6yZ01l9j72sEY6clQxJ7BiVb3UMs5oivF85m3FW?=
 =?us-ascii?Q?WRFHO07vYqasdT9vDUfNCJ9Csa3OoibldYh6UiIrwrvc9wP4EVnBXqglGX5z?=
 =?us-ascii?Q?tJE6OKdastbJoPKAE53Dtra7WtJSmnxRxzgc6CnH6UFhS5FlUv10M4iPPpa2?=
 =?us-ascii?Q?hAXVKQV8a7Mlv74paZE5IeL17JieXVgNT2qDawLXiR1LDMizD/hvOVdjZDZW?=
 =?us-ascii?Q?hS09g+daxSm98vs+AtIbmLWwlj/UOL0R8nbpCUfZkDEJOWaIIudO9c3onM+s?=
 =?us-ascii?Q?xqs/g2QD96th3yenJkviA6p+gTQeYB+WA7yLj8hUXNoi+s535SnnSUmar4oy?=
 =?us-ascii?Q?S/AEA8jvqc09z0DhH+4Ea7IO7xRWpCFIGK/CGSKjCh8w38fe/l8HYY4peKwp?=
 =?us-ascii?Q?SLnW3riCMR2XJd0doL2AAbSEy5mCtlEXyTtO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NlVr7NfL4U9PQjA/pwXse0tPMhtE5P7qCuTyocgsdLYS3eYOEYG2Nn4q8F3c?=
 =?us-ascii?Q?F24eUOg6YnFcgTn1ysTnE+TgA7vmrhEbAxs196qHXWuHfaMxjAOS0fOudHNW?=
 =?us-ascii?Q?cK2KM7XtA8lV5kwu8ARY7PMT2uVSAws+gL7zwhd2VuJEDj79kpZ5JdodP9Zr?=
 =?us-ascii?Q?ekt2PsV1TnYo1j2MPcWrKMKcSBxwr7tzVOXj0CUWUpY2UhCGX1umCVBZLNFh?=
 =?us-ascii?Q?Zbh+kHPTxQnxgdoPh7NDdPPho4sF0h7zMgbWUWcA4/T/GPS6BVOWmwwzaluL?=
 =?us-ascii?Q?f/x9SJ9WIzwS4nWxzaI5We1fIMYEsqn7NaD1Taggz1a3wHeGGWgWRr45dgsg?=
 =?us-ascii?Q?Nj2AUMa/w2bnJAyoTRdpg1/e8DWcJUzog8oXERxrKS2Fieli98msEUexVXfm?=
 =?us-ascii?Q?3AytYVRvnV29/4qfkiCWT2IblnygbwwBecaX+YE6r7PP/+FoV0JbqJjOWM3I?=
 =?us-ascii?Q?hHBJfeEWfJEGu0H76ESg1IsSVDp/HyXdceH/BAAyQF1I/VOn0fb19ZH2LzBO?=
 =?us-ascii?Q?d15V4l97BNGUpqJ9LyAGWWARrp7nsKHkAVE5i7KryYL1AHLAFNL37oSuJDBB?=
 =?us-ascii?Q?A9uKPWFfQFkEaJz7LMChvtLNho1zNYepIgmh2Su204Z/jyMriq7oXPYLugRQ?=
 =?us-ascii?Q?llfVO5egIHHGOhmJTUbNwp0LYrN6A3U0EV6rTNWcPDdxqEuqydYFAgkyrBml?=
 =?us-ascii?Q?xbuGoxKdq7SRItSfHjADR6OLJ5ZDj8HLl3F7Hmo+u+Z5g8WGW0GAi1LI1CyR?=
 =?us-ascii?Q?Ci/PJboyeLionOH99k/PRe4Hdj9LacachieNvhcO/awLIwCakOaatRvJTSEb?=
 =?us-ascii?Q?IFfto6obqz/D6SKEkP6TqU7Ig+usb1hIZoEBrcaKmtHIWCnSx0V2HqcLhoHT?=
 =?us-ascii?Q?POXfkXnTxXCPF1d6IoxP42HeLYU9NKDcvZZssqZJAx+4Mk9e4Lfpq8h84t3U?=
 =?us-ascii?Q?eypgbBUpRdRSbUfDAIeYIKB6q6AHbIJo72Vsei62GiEnuf1qc9+iXTMDyk6W?=
 =?us-ascii?Q?+OnxIqDn6WCzR2r+FAe79JlIxCQ/7v2mBWaJtKMzJ7KUp3ky6b3imavrF9hH?=
 =?us-ascii?Q?XFskHU0IhG3j1EIC75/pjxCv02BzpBuf9sy0hYzZG+rpq1SQGILd/cE/8rKG?=
 =?us-ascii?Q?BZZtIOUizV20QrL8FDYr4r96aOhz9CChVF5Fd5Dyt1y6VyPZ2Mc93UPpuznH?=
 =?us-ascii?Q?6p3poqX6pGAGluR2klCy+j73dCY49gl4r6c209PHQfOpzBeWIG52VVXrKGnU?=
 =?us-ascii?Q?qVlVqjyQQQbTiYM6mywz7PVYexRrbi6S+z7h2mZldnEu43SRJLkJB6aGIWhS?=
 =?us-ascii?Q?YoD5wHyiUSyoq6hadk5w2N345CgNwqb8AjR0Ou/cGrCCWfQPl4eFlpPMdhdl?=
 =?us-ascii?Q?qI5xJm/IPFG7/xJSpy/1mqNBh0NScvc35pqjKekj9gQiaHZqTzmkwESalBz4?=
 =?us-ascii?Q?qR8sl+JEnIxKTlgDTA9gRiEm7b0v3AnTgew3w9J64oWg9C2/YpE3uRcGXT8m?=
 =?us-ascii?Q?diX17xdOA4TGI96rkRSDAAUiI5ohbdNMkBGUsAdY1LdWWdGsmC3+HkCjceP+?=
 =?us-ascii?Q?jIcbYSaqCO90eTeCglxmmt9MyB6C4SkavycoIV1Cve2JwPhhJhRGaW4qvflO?=
 =?us-ascii?Q?J4CGUg8IgoHhEPDhuNUzog1ahTJUFebohK3viaDkIb6W8p7vNLzxPUdxzSWt?=
 =?us-ascii?Q?apqvudhaYLrKhA3s3m8+zq+KckIbJQ6pGNXqhw2Q0yAoK+mv5L8r97pwRsth?=
 =?us-ascii?Q?jZNh5PoLsw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57cdcc48-7f97-4706-7d14-08de49eb35f6
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2026 10:39:30.8958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mQ0qncD+Sk5K3KTIbM7695G4etL2RNe1JCfV6ekkES4TvwscDdakM2CXlx9miHEMI8F+SXqnml4uv5ndyV7G7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7805

On Thu, Jan 01, 2026 at 05:51:12PM +0100, Marek Vasut wrote:
>On 1/1/26 1:37 AM, Rain Yang wrote:
>> On Wed, Dec 31, 2025 at 03:11:21PM +0100, Marek Vasut wrote:
>> > On 12/31/25 4:19 AM, Rain Yang wrote:
>> > > From: Rain Yang <jiyu.yang@nxp.com>
>> > > 
>> > > Dropping CLK_GPUAPB simplifies OPP handling and avoids unnecessary
>> > > complexity.
>> > > 
>> > > Fixes: 67934f248e64 ("arm64: dts: imx95: Describe Mali G310 GPU")
>> > > Signed-off-by: Rain Yang <jiyu.yang@nxp.com>
>> > > ---
>> > >    arch/arm64/boot/dts/freescale/imx95.dtsi | 4 ++--
>> > >    1 file changed, 2 insertions(+), 2 deletions(-)
>> > > 
>> > > diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> > > index 88bde59e61b2..ab446aa6f73c 100644
>> > > --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
>> > > +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
>> > > @@ -2164,8 +2164,8 @@ netc_emdio: mdio@0,0 {
>> > >    		gpu: gpu@4d900000 {
>> > >    			compatible = "nxp,imx95-mali", "arm,mali-valhall-csf";
>> > >    			reg = <0 0x4d900000 0 0x480000>;
>> > > -			clocks = <&scmi_clk IMX95_CLK_GPU_CGC>, <&scmi_clk IMX95_CLK_GPUAPB>;
>> > > -			clock-names = "core", "coregroup";
>> > > +			clocks = <&scmi_clk IMX95_CLK_GPU_CGC>;
>> > > +			clock-names = "core";
>> > 
>> > I don't think this is correct, SM can disable the GPUAPB clock from the SM
>> > monitor:
>> > 
>> > > $ clock.w gpuapb off
>> > 
>> > Linux has to make sure the GPUAPB clock are enabled to access the GPU
>> > register, hence the clock have to be described in DT.
>> Hi Marek,
>
>Hello Jiyu,
>
>> CLK_GPU and CLK_GPUAPB can only be controlled internally by the SM, not by Linux.
>> CLK_GPUAPB always runs at a fixed frequency, does not require dynamic adjustment,
>> and is practically always on.
>> Additionally, CLK_GPUAPB's frequency is absent from all OPP entries. Removing it
>> could simplify OPP handling logic and reduce unnecessary complexity.
>
>But the SM can turn the GPUAPB clock off, correct ?
>
>Linux has to be able to turn GPUAPB clock on, therefore the GPUAPB clock have
>to be described in DT, correct ?

Yes, CLK_GPUAPB can be turned off by the SM, but by default it remains on, just like
CLK_GPU. AFAIK, there is no scenario where either of these clocks could or would be
disabled in both SM and Linux.

If enabling or disabling CLK_GPUAPB in Linux was wanted, the same shall apply to CLK_GPU
to make this approach reasonable.
Also, OPP framework shall be adjusted to meet these changes too.
