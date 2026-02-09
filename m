Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010052.outbound.protection.outlook.com [52.101.84.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32ED12FB997
	for <imx@lists.linux.dev>; Mon,  9 Feb 2026 19:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770664636; cv=fail; b=QGOJbuWATlSlN4DgboLO7M6kdD6kMO3TKK9Dfe6qt4wYjqYFQ4R6PeLHO9koUIhWHyiNXl2+Emq0KYHfd0kDFoSJviyJsDrkmjqCrfBfw7ZS7KAn5FWdCZ7nscCffbDqJorvngqA0bubd+O+Wenjpt0s6JUvAYAq871OlpCA45w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770664636; c=relaxed/simple;
	bh=/T11KR+yBmJEeTbXJTjoWa52Iv7zRp4h1vs+gqvwZ18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=jzJdYC2qwtUQI30eUSQHE8vpCH7n8McURhwW0aLl+Uzan0dsPPtsLRbMFPT1dfi04ZfPoqo/bsoDcG2+jJSgUYyKf7I9glW5Js8WUSPoL9qJWAf0DV2iQlGYbU7eE5yGXSWP2d+8tQqQvg8cwcke30DwK10MKFSgfsQoj93zJaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IzvOFnQq; arc=fail smtp.client-ip=52.101.84.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IzvOFnQq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k++LTpDBhu4ZiS+t5A+uNX2twQs7F/kB5SCDCYSXTwL3aZbIiJnoWVhmOXOpKoFWu/x83bjBN/jiuHvvxEaVVtL70rHV8Anhu3OZxZFbIV24eRzCfNnYSz/OGsnZkpcYzStEARFRcAm2sXsc8eJGagZnrWWNsiGSsJ+larMJTshoH+PHzU93lkyXnpPKK4k+Th+lwyc3TjKat3w/NfsapB+6z06WEZOKaL4zptaOIWXSSX4ssmQWjsdAVPgdz39pHRwV4QI4DYYlES+H971TZ6ZpnM8z4ZlUreha88A9pqfeZPEMTM2foIGqfRnjykPBunEivrEay4W+1nax7HgWvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6a4HF4DHwTRy7WwkMOg8PVUee0yJhBV+rZo3mW19Puw=;
 b=Pkh86RYjz5M34V1k3IanILCOQzac9m9WchuL2iiLlw8hCqI4jL+BW5rai2JV4S5BZnJrpVgfYMyCkwiSV7IzG8vLw3DFJO/i6ZlW+RqOnZ+n9w+Ldb7fAnCwpa2e7s8XzuVdoCsPp9wmC7dPT9tfNjsvLv4t3znpozJ3usvEoQdi6x5XP+/MA+lSYNSAeRBVeZKFXB+fin9G/O2sf1OATSU3w+7ukJHQvqORyM3sc39euLyoQE85B+xlev3q1Jaa8GeAVaTP4PckoTpKo3GEe2gJfUTzsObN3TE/ZHetaT0RO2neeXGH6nx01Y6o5RYe50BUORgVrYTeZ7rwtm4G0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6a4HF4DHwTRy7WwkMOg8PVUee0yJhBV+rZo3mW19Puw=;
 b=IzvOFnQqdr6dDZOkQlobrXnk7FUEkAUO2mCQg9kT+cXUf6AuurWmfUuPfb3Ok+Rg5x66S6Jcvbdqfd2ht3EyRIaP8XVIwqzTdTNMeBvUjilDyozMLemT0VWNhqS16iCRiRMLxfdhoP8DA6S2SDgrT94TrT7PQLqWjX0jFm5/D+Q3e75pFzmxGs+BPRsLJRy/z3OTEQsuGp2v8VnqB8CRkkpuUcKHvgURluH2O6fBSRlePVou6lyku97DrLA2S+rfUc/7ige0XicArQXg3HeXsNq1SPsYnFxTLVZj1thJ6ByS7xn7yZd+LNN+uRVxl57vMNFXhCdggGd2HiYQt5hETA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU0PR04MB9495.eurprd04.prod.outlook.com (2603:10a6:10:32f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 19:17:12 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Mon, 9 Feb 2026
 19:17:11 +0000
Date: Mon, 9 Feb 2026 14:17:02 -0500
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: imx6ull-dhcor: Handle both 1DX and 1YN WiFi on
 i.MX6ULL DHCOR
Message-ID: <aYoyrqV2lSJetls5@lizhi-Precision-Tower-5810>
References: <20260209170739.22379-1-marex@nabladev.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209170739.22379-1-marex@nabladev.com>
X-ClientProxiedBy: BY3PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::30) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU0PR04MB9495:EE_
X-MS-Office365-Filtering-Correlation-Id: 3264c264-01f4-4772-9ddf-08de680fd381
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|7416014|52116014|376014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dj8h61gpSTfdr7pSPf9NF2cg7DNDUj4pUcKNduaiPpZtziVpe/Ay+LEWm4lU?=
 =?us-ascii?Q?OW+igqFLgOzOGck0Y4lAkm3WKfCnf448E9PYjjGHfFxqbpLG497in5GhFc1C?=
 =?us-ascii?Q?Tix2wY+VlBFvJ+k98v8ss5ZZS6/fKsZrRIshdnzzVAm7q8fq/cwJhEuCnZ1S?=
 =?us-ascii?Q?YmIJr1jEedcjeaDJ+3ffL3SRqmGYJUeL4wL0kwWDgJSzzNuHADRt+Jd+uf1H?=
 =?us-ascii?Q?BdByeN8YYn+6OvC4ZT/HfUom3odscGw85WMIsX4uo3D41bUBVM7CCA4SFB0D?=
 =?us-ascii?Q?Jx6k+QLDGyeTNQGr88DODhPkgWBhIXeY7RwPQzmxyE7aEhRz8cyeER9Vaof8?=
 =?us-ascii?Q?CWDmWUFlAeanzRdQpkKYR3IJWJdOsTWR0v51/vTx+UxqElpFC6K3F5dre4Mi?=
 =?us-ascii?Q?Qcu1+M08mQQOTUavZ2qD4COzlQ7pW+hLUgsCEQmdJaL2vZmhbA8NjQhqVBs5?=
 =?us-ascii?Q?t4hvCFwZVlDwwalUBQuOYjpG29GNCsqINbYvdQgXv7BnZsTJb/atn5HFoLsH?=
 =?us-ascii?Q?32VU7CytBeP0tJpJVehQhW9U2ExjJrCLS3iOLYXYY3kOj6CHYMj65T9LyrmQ?=
 =?us-ascii?Q?UIFkB7xHfhfL972HNny4Euaq1paFI09KZYozsM4LRlyp39wepBlGz51nxptB?=
 =?us-ascii?Q?EYhxj+rhVmZkGXZ2VaH3fuBKUH5BiGYBJUP6irugS4lbdF5HOyAMFpdRAcjW?=
 =?us-ascii?Q?H5qgzZQsBETEceOC/ipG4QCuhl06JC+0rOa7cZdTnU7kbCWgLBuhqdWL2BXO?=
 =?us-ascii?Q?9/jfT4viy9+8cGLSuBLJDqZLQUBNm0F1t1OsVEE8bCwKhX2aFMz7LdO7Ekwh?=
 =?us-ascii?Q?hoXtQU4U51QF1Ku+vDc6r1dW4GwsS7ctRX4+aQYZdUtdgFl4SAzN2sEQILbC?=
 =?us-ascii?Q?Ad8Y/ZXdtYWS8cgz3qNs44KT4CpUNNtuGnpqs90rOWhxGdu3HBBwvIqxrCCQ?=
 =?us-ascii?Q?UYu/C4luMDny1mdUQPIHYLldkdfbTshl5Gt/xVGizGPnAPevPwr4NquVxiIG?=
 =?us-ascii?Q?ggFQxUHBiFtR1w/lyx2zkLJTVxdLfbKawCohzomFYgOjfsdQe8zwHwfh2BLi?=
 =?us-ascii?Q?WJVIINQUUEx9nIWDu/21rDJSPov148ikrrbrzQL00HeIcbVPNOzbBQQJTRN6?=
 =?us-ascii?Q?JKr5c4O19VEOHhuk5le0vM2H8MZCaH6C6RT+89rVT3ucAaumVTUkkjg3o+2c?=
 =?us-ascii?Q?yuCv0hqsCqAy+RqMhVI+rFr5D1C+nkbkdME6m0iYPhI/e6DDW4n/NyDbS10X?=
 =?us-ascii?Q?LkEEfuxgrVFNP4tolXmN3Q1/V0GTc1TW5TuqSTlAsx1bDB4QnHqdszM1/sha?=
 =?us-ascii?Q?44HmGWNZYH6r4VLqbXDHZzUdDuq2V/8VXHDySr5S9ASqk2CwrJv+49qu0PP2?=
 =?us-ascii?Q?T9NKCpiszttGDGMnNNh+mbROug0cjA1AzInwhfu/msW9xRZuosBjHV1xoMa4?=
 =?us-ascii?Q?dSrLsOggKYfdbpWfZaUeilSqjOiYch1v8je8zQ8N3pvHPwvgA0bJAkCz+rdR?=
 =?us-ascii?Q?JXL4tFUqrqXYxTClb5YKXc7fkNKq6EPvvKfdZJnJeS6WllUhzjDn6bJ49/Jw?=
 =?us-ascii?Q?3rQuvNqKx9iRDIONnZi7HwW90ufwd06JKn3ysBToXJoIVMHzPLU2NV9wknsp?=
 =?us-ascii?Q?jwyaJY+QgGJZOlQSDNu5NXc=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(52116014)(376014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8MGIA4/YYPmAv8VLnKNy5n45HAHtuaq9d+VO8VWvsWafPc/sYUUFwjUfByxl?=
 =?us-ascii?Q?3rXp0qq/1JwiOKkdnMTWtTWmz86E04t/SO2qqsXV/bUAp8/bwTiVd+MFmMb5?=
 =?us-ascii?Q?6DO52BHFQ31MJAkTs0linkW5Qbx2UDDmaM4X+kUc7RQOXaMLSkzGgk5foLZ6?=
 =?us-ascii?Q?8tb5eEPz/fhYZ1iqR6IlK4Qb9tnl6hUh71ErgnJJaivNr8rvtHuiXiS+PFd0?=
 =?us-ascii?Q?Ws3BFXsMecm42uBrT3ZyS2s+7vbWwnCRxXoNU3T9K/yML7Z9pxLw/CCABDJ5?=
 =?us-ascii?Q?5/s83TV56bNrjZKXcQHauazphQzx3sfP0Rn5SZzZx3G3n6PKOs9U5OyaHIvY?=
 =?us-ascii?Q?8H+y/hAtoIAx2PfGWmevOkNyF3jIjSPSb1Pl9c1nHteWcpT/V/rkX6fbVDsy?=
 =?us-ascii?Q?syyUNH5XUVYj0PQHi2/jGXD2GZv4DW/21Udwlp2dHtO8R8IvOUH1v19nQMm5?=
 =?us-ascii?Q?SuEjxrtqCks0aC9ETlz1Jux1RuTGxs1A0s/tzwtXuw6fz0jNZo4Mogkdq2tt?=
 =?us-ascii?Q?V+0Z0lG3aU1ydc+cW2P+HVEzcOEf1nFLAX/WhiwPRbRApiJe6/Qh7gbs+OA7?=
 =?us-ascii?Q?G5X8ELnTG18+t87xIBbD0oHgg6KCmqt6OFn7scv1hw9lrabFn4Qgem57HDlq?=
 =?us-ascii?Q?NyhR1GJzYXAhSPNuIN0znPzJwABOdxnADmfPaQpm3zv2tsRoXmsyYJDs+8wK?=
 =?us-ascii?Q?y9VBglCd7SEC/u5Yjb67hsG0If22bB4DEczOwEPT6okFZ2ES/j+ypVbd48bO?=
 =?us-ascii?Q?3Sc11vW6wLczR2uPwJBb4DQQL+xTG2vMmxiDRwYREdYqeDFiI4A5zehfp2vW?=
 =?us-ascii?Q?A8vhPPpogl2e0ME2C6waOrFwDAvsejoOGiTxpZdVipXtKeW0dO0iDIMAFGLC?=
 =?us-ascii?Q?GXKVF636UC0WCRQrYyRgcUFUf2q8IO4MOdrvC60Lx6deLyhRroxmDrfNABDw?=
 =?us-ascii?Q?11rVMmsjdFr1yD9jCWl+LFtw/pJ3spXMLhrTXzBnuJBdXMfybdOqpE3PGl2C?=
 =?us-ascii?Q?0lBWoXdm2Yr1YXr/LFaPUtWyVNxTZCG9lpkeumUeBBgqs4SB1WLhk4eP5u3N?=
 =?us-ascii?Q?pKegr2K1jBEedFfu8ijOIqdqSehwkCh2q4iR42qhTpH0rInwOFL9EZvTyW5L?=
 =?us-ascii?Q?k9DGr98VN4qAy5oyjso5Mh7ThfI2MpgojVYwekMcDZremnbYOjJAcIPYzqgS?=
 =?us-ascii?Q?dUc7hRLahZaY23RJzDiU/GNILUyLifCvnZLjIs6fzkYBBt+Bx0mUCkVBEynn?=
 =?us-ascii?Q?qiBNIWeCjDs2HgkaTBKnOTzfNZtGAmY+n/Non0hKzKKzjrHOZaF4LoI+jSK7?=
 =?us-ascii?Q?i9uLazfEWhFycWm4LRz7jUNZ3BWkGl8WpadasXfgZsus2/IwQjvePD3MrE+f?=
 =?us-ascii?Q?JLN0RHcgx26pYSdJQztXPeWASX1NCcClvopgokyFqVjtxA6fThhpi72/nclF?=
 =?us-ascii?Q?/OPiUeysmtDVynZAjhhSMjBKZ99AQ/UV+dIDW32AjnBklamEf6o/sR50+Tf7?=
 =?us-ascii?Q?Cy/cMYDfryPbYtrt4F5KPcobUrOaA+QsXq/Sg0Qr00CFBkFVwYZRVGt6eHK+?=
 =?us-ascii?Q?acWw5FZCPF1Ui0pfwZ8jjdC8HGs2h+7DEVGCJEupZOecqB5bDHNDHrJaP8mC?=
 =?us-ascii?Q?kgv46HyY3lOULNzxzPVZ3vufodSLfEWSeCGbyVuvno6vm4p3ooYVcZOuqDzf?=
 =?us-ascii?Q?PtHoxE4vKD8yDMkCVDXb/Ic2ZtKyTa5Usg/CjDZf9ktwRQwt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3264c264-01f4-4772-9ddf-08de680fd381
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 19:17:11.7972
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fLsH8zV4G23pxHagEq5EiTvcwcpX9OI9XJ4p5I3OysRjcdp6Zo3WgYLgBOmft6vqLt0EZivrav4GPfqbQ4SaqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9495

On Mon, Feb 09, 2026 at 06:07:04PM +0100, Marek Vasut wrote:
> The muRata 1DX WiFi/BT chip is mounted on the DHCOM i.MX6ULL. This chip
> has been discontinued and replaced by the muRata 1YN chip. The new chip
> is a drop-in replacement of the old chip. To support both chips for the
> i.MX6ULL DHCOR, drop the more specific compatible string and let the
> driver auto-detect the chip type. Currently, there are no known quirks
> that would apply only to one or the other chip.
>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi
> index 75486e1b0c15f..a0adcd3fe1229 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi
> @@ -201,7 +201,7 @@ &uart2 {
>  	 * the speed can be increased accordingly.
>  	 */
>  	bluetooth: bluetooth {
> -		compatible = "brcm,bcm43430a1-bt"; /* muRata 1DX */
> +		compatible = "brcm,bcm4329-bt"; /* muRata 1DX or 1YN */

in driver, brcm,bcm43430a1-bt and brcm,bcm4329-bt should be the same.

>  		max-speed = <3000000>;
>  		vbat-supply = <&vcc_3v3>;
>  		vddio-supply = <&vcc_3v3>;
> @@ -222,7 +222,7 @@ &usdhc1 {
>  	status = "okay";
>
>  	brcmf: wifi@1 {
> -		compatible = "brcm,bcm43430a1-fmac", "brcm,bcm4329-fmac"; /* muRata 1DX */
> +		compatible = "brcm,bcm4329-fmac"; /* muRata 1DX or 1YN */

driver have not check "brcm,bcm43430a1-fmac".

Look like driver can work for both CHIP without modify dts.

Frank
>  		reg = <1>;
>  	};
>  };
> --
> 2.51.0
>
