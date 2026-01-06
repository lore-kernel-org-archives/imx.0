Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011027.outbound.protection.outlook.com [40.107.130.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322D3313293
	for <imx@lists.linux.dev>; Tue,  6 Jan 2026 14:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767710141; cv=fail; b=faoxsCkha5N5O1Bl+/WcxUlbubqEluFRTTfj7++5nXAoV8DUPOyWafds5ZnMX2RAZ28W+EzvLsLs0Ys7Yw02x94MQzvsVQ2e4Yr32/58TUfbYm3XC1GVbyFzdH4tKlICVUJJaCmDf1U8iJBHnRSawYETmZ+iPKDa4etwq7bQYE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767710141; c=relaxed/simple;
	bh=kV2RI5nwYB8J6Bvfh58hyauIQoAZRI7f9eLqQUNJBMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fq3Leagax5wqw+DDE+PyzU8PwQHd0d61zg+6SCqvVGjvYEhZ5+h+1NP8zxGZuDDQf9omSVgcgpmk53QltREI5jiIpabneVvXULSZOgLs2RiSx5ltZrkDjKHBB5lGERtc9UpLjIr55gBqm9nvvZsEOPrLSBPeTjj8nTCe64GDDOw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ccsqT72Y; arc=fail smtp.client-ip=40.107.130.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ccsqT72Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFevQx2f2DiWlTUEMWIE1clBAWZWV9DdEqZS5mFvKXv7W2XMmCwWdmJX1En5pC+RWcd6W2iDCc3vUENOHXLT7+qT70q84r8CqEffC+R6gR5WZ2hAZtDoFhcXcMMdOpqX1gdJrzcwubOPpVEgaIDX7MyMuRb/1ayBGeZvTFDT4mUN9FsjEnSACCVXvLeXMOU6MTcTwW+z/s8m1WF81hYsd8CvaY4BCGu+X1MX8rV4NlDqU/3eI0t4Z+pwOnJ4b4PjtX7ItbO+Tg8tql0RnTBC6MpBnf49wUf3DdQvTTlmxy1XVPZRyhDP/m9IHcyeAB3MgmolixDG7msGDJhiWaZYnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9NJKNWJTF25wQah2Ftq2H3ukMrDu73jLEuliwlElpXA=;
 b=b+MSlcJ3GYnuQ7Dn4JPaXCjQlXQJsCW+sTtWHASdMSs4zV4SIVvsJIBo0+I/o65wamMJD1QJzjUTVKx540WejmFW86ddl+vkrZvNzQOK8fqTW/PO+PIwRq0IO4wPwMIiCE2LYaPiQ3y07bXDoGZxAt8wVW77w0/uUHuMKunLakIzufbc4tbji2VwaNuUAXSI3HKpxJqKHzXqAXslNCHuLPKcFx939UjxYKHDNMfGIFBcatJaW94ULiQz6JfMHKtwNR2Qm2pz819cw0cNPV/4jV8JXSVMkxm00U4mH7w7SmLTMjGAqQrWT+hVaViW96GCM3P8iBqBeSsR9nIaywaiHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9NJKNWJTF25wQah2Ftq2H3ukMrDu73jLEuliwlElpXA=;
 b=ccsqT72Y1dJAZ3BXdo/jiAintfg8D/5bYAUgJlKO7T/yurZMvxFLdSRoQqT7y03Ni9DpqI0bfalWJtYddzoGOo4R4ustRWuwyvcGXpPRbNpFW7pP99QbJrOu9kibL+sLi5LJh4O3LmhO1/JDtl4fM4YTMiU3SJoWLvD6B5t+XEEzU511S/u5Fg0cToeAz3d6+FBGHNzhvSHjknVHc7HctqyMQN/NTiex2C/OMLMt/uPxF7zmxmBkrm4FB8a+TH7UY8L26VWY4g9aGM4PyKkQ1MEUnUcNed7AoaJSoXdJMRtDQzCq9y0J18PvjnSlIbl8qbKzSD7rSDgeqsgPbDEg/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by MRWPR04MB11287.eurprd04.prod.outlook.com (2603:10a6:501:79::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Tue, 6 Jan
 2026 14:35:33 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 14:35:33 +0000
Date: Tue, 6 Jan 2026 22:37:03 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org, Fedor Ross <fedor.ross@ifm.com>,
	Christian Eggers <ceggers@arri.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Markus Heidelberg <m.heidelberg@cab.de>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 4/4] arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard v1
 and v2
Message-ID: <aV0eD4t5uQeAokUF@shlinux89>
References: <20251230213401.219808-1-marex@nabladev.com>
 <20251230213401.219808-4-marex@nabladev.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230213401.219808-4-marex@nabladev.com>
X-ClientProxiedBy: SI1PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::8) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|MRWPR04MB11287:EE_
X-MS-Office365-Filtering-Correlation-Id: 10a902ff-b8e2-447b-7b1e-08de4d30d93e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|52116014|7416014|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?AjlT/XG8KT8+Dhpottl+W9Gt8jL1qPW90dodLR5vOfE4D1fltEx+qBH9+yrV?=
 =?us-ascii?Q?VrOA2IyG4SvPBo9CWM9oGA2b0QIJIB88gocfUb48csr54iUHyhrKVQzpWmj6?=
 =?us-ascii?Q?u/CZb0SHzFnIXMp2p1xUjyTNdu+j0GvqFNVQWJxia9GS+C+GkrBA+T1MV3LC?=
 =?us-ascii?Q?9GzSA8iAEg+Ac86QZq8uGDhrSYzGKQswpd777Jog823/IJYhdPMhEBjP+ZTT?=
 =?us-ascii?Q?QBfwp8MufgbfX48wwAO/vh03/EOXGwr859Xp7GpseQyZKJIZ5RlJ7+L2P/LT?=
 =?us-ascii?Q?grzk9hSEgMzxd+Sl9sCXt/KC9JP2/TO9ikAww379y3c9edovtWSuCYIBNuhN?=
 =?us-ascii?Q?xBDQQZvKB45YLpKp9ZNvwrgHT/7KtOyMClIZOddKdkduTwDrw8jz9gfABCPY?=
 =?us-ascii?Q?0ClcHLkKNhVZPkvnDK23+E1Iki58nfSbu5dcu5xtlciEFiY5me9pr6vnocVE?=
 =?us-ascii?Q?fPjYwhEuGh0PRlcKMFQuOfDwCKj6C+kkPmHIihuLURbnFqM3swj4l+Sv/IZS?=
 =?us-ascii?Q?u/k5shdHcF7KQW9mtH6Z/RvQ8CEJXajBpm0fPjaNiuZL9tGwHLzfADLvXQ5l?=
 =?us-ascii?Q?B4b2GTWaXFZWMdvp4CgAB501JqTKHH99muYwboHgx5wfA08FvVPxR06PaB6F?=
 =?us-ascii?Q?pNjk5umnlJkR1wvut7w9eTlpHzOzO+dcFa+1MJlnmFYQJjbpipC/BHK6Xxv/?=
 =?us-ascii?Q?vWqdAfN98DyZZcDCabcpOuBcSWT1KyO5btsdqyksy3d+YPjHlvZXLAAQaMC3?=
 =?us-ascii?Q?ExmrEsermtwKDNF6UJTQWWPhfoqBoQ8o9XvQ1X9wKW/0lGBpAISIHZHp/BqY?=
 =?us-ascii?Q?W1nrvbTffGQyblbpit3NyncBJfS6ZDrEfn3QZG5oQSyDUvlHXzFIVoC11JG6?=
 =?us-ascii?Q?926h4B/c2hL7cUxOobMQNHo+2WDEIUSp0sN05dwsdVhvIZMsNxI+1aWBb0u3?=
 =?us-ascii?Q?FtT3MtWtBz2nR8AUch7KaaBtm6OD9+8jY+oBfjQBVU2XsejnJugG5FUzaNIp?=
 =?us-ascii?Q?Cn2AKZn5mgFRlwePznAuY5FEIz6jAmZAY2FAFLb/oXD5iFuKHGFX9Byj6/Xx?=
 =?us-ascii?Q?uKDWz1FqE73N8syj03DlisR4VdfccGo+TyOHyRGMTy0wXUvo3pw2C93Mhahe?=
 =?us-ascii?Q?AnPCVBVlT+jy4uGZSzfTGwmtW0BWaE56BHfD0lvTWmJ1rnLJfZvDCoX3ae/3?=
 =?us-ascii?Q?rdYZ4kLz0XYxvZMXJurVK/gtreN2Ixt0c0nU9/NcE0uGUeLCFolePpOxpsrF?=
 =?us-ascii?Q?yxbrSdd5+uC0U6+MWnK1Djw5eDe1grYFplUKBwNV8tBv3+bO3XzdFlU988Kg?=
 =?us-ascii?Q?bn2ySavbnPJtVG67miQDggUTIOMRtZ54xjFJAXuQrGk3xYKciUI2Zzo9IkPs?=
 =?us-ascii?Q?MwUtciVVqA9cogbpvpVdsAYFUyN6Gaig0kKfoMDTSu86KQg4qRkSS2eqdgja?=
 =?us-ascii?Q?oADvw7WL4wnCOnr1BpR3tqIk2g9u+EdLc126NyoOAc93Y0eBAKpujJb3YlLs?=
 =?us-ascii?Q?GBH1bo2b9Bk2CE7HqCq6rKBi0+SVhlMq/bEd?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(52116014)(7416014)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?vO6QfqcEJucGamwdPpsmpRcA8iqk9o1WxeiOxdsJ3s3QJK3P0EXq9CuN7FeU?=
 =?us-ascii?Q?KZZdthgpSVYi1GBRqGHHbYuD0cSEIiwC+f6EhyQtR0Pt4szPwpl1MVyOjvs9?=
 =?us-ascii?Q?lV30fAdhd7DhmK9Dtz/MQWh5AKz6rit5i8Z45BLbVzBVyVviVuBrkjLAXIYb?=
 =?us-ascii?Q?6BiIIVE7cUzqTAe9k6RAfTaZQdNm64RhsrONLFKSB7tnyZoSm7hbJKbKwvYq?=
 =?us-ascii?Q?3QnIuS4tSAGh6MMaQGV2KKA7iEKdhiJtSR9um/1NXqRVCzFyJ64owpVv+9I/?=
 =?us-ascii?Q?zsTBIsiz2dl+EMOQxvubIKXZJvwVC+OwRfBONW/soI1ssHgjCndY3chGslRf?=
 =?us-ascii?Q?OrWRVe16TdNEmHe9FGFBmLBw9NBFuf+ZgTg96QWqXjjSbEzRdSTQ0J2QQ5Ca?=
 =?us-ascii?Q?PzTe1v2gPz+YScYfA9vpCtZGg0mz8n4I24+8RqMm0f5EhpYl+MGM+XDXrz+T?=
 =?us-ascii?Q?4ir8TU5CX7XGynyEpPJqB6P0CRLJlhW0Yh6TLzSNgIspRxM/YxqcSykf7vFV?=
 =?us-ascii?Q?9VeW6HBY9i8M/Bh658WH8i5GA5zSeBkLV2Fbk2K0siNi5od+l0o3VtufVKpY?=
 =?us-ascii?Q?S5M8E+5X53Q9s7jTb3FC3rMZvMHFtnTNfWUL51gO0TOPQMucPTeh4B+JpwdL?=
 =?us-ascii?Q?Os5zBD8e9MHfHgv/+QMNU4WIbYyG6JrY0ReEEnvFHVmS3PPgnEbViFzQX4R4?=
 =?us-ascii?Q?WFrzfrWiVMfmBNx2ZKTozWFiL0TK6qb/Bn0Dk6Muvy+TKdpfoaBwxM+yPRZ8?=
 =?us-ascii?Q?HV2imVPk9lCsTzGpFDSuaToW3l9cpGw+m0WCSDXx+56o9QTtw2Ua8Z/zTbPS?=
 =?us-ascii?Q?Ck43OrpqX8g+vlBsJGmI6vwpIxLxNa9V8OwfTg/tX0cBsgM1hrTM2g+ZT0IJ?=
 =?us-ascii?Q?DH9MRXLIBgyGAvaZrHdhTjHG97OjFGdOl1QOnT0WQPy9ib4b/uP6muXPa9FK?=
 =?us-ascii?Q?er3jwFNiSgWr6fC2JlUKDu0NhtwqHx6Z7SUqI0cV2RWiqSczbHYsnQkboWcR?=
 =?us-ascii?Q?OEVNSsNo4YQ1o3/s+Pr6lZej9sNeqW+LYMo5Ox/cBRuytsc9mNYQ2bFE/AUt?=
 =?us-ascii?Q?gljP3qXyJhPWQ71ZphXph0gPEI7Kv2TVCDLzgMBF9oqymPJ4boBmiiaeH4M/?=
 =?us-ascii?Q?vmHgRzPOoZKhTiC4aM9+Ilsui3Bqk1wCA0lBqhYtp/4ZUMUlU/PYZF0DnBRu?=
 =?us-ascii?Q?DEM1zmAFdGotwl6FI8RIgmR2bG98vW8MYQ3Z8ybTYzlDdND9iw+yp+l+gnMy?=
 =?us-ascii?Q?32F74hdvWnygAGGTgXtl+5oBLJZhAZgg2fUmt0uzqVkevfZcNV075FnHcesH?=
 =?us-ascii?Q?5+f1tsRVdb+8H9/OEUiEPhEteY7SCPAIqZgeIgR3JjLPgU3zkPsWGKf+cGOz?=
 =?us-ascii?Q?bCbOdVlTaRirHwbc+By7rt3iFFd8xy0OaQUbwI1IQL+wzj835CEIBSSa6YDV?=
 =?us-ascii?Q?nMDZ632BOx1hY5AfoeLBVaJXetsvf9OeWX6ja/Pntb0mugMDcEAWn5FLbKa4?=
 =?us-ascii?Q?x9tNiMvDbDrhvHqJlu+q5dAvdvnqcqVxjScaocrW6yr0q5gjFA/Zrvlomm2B?=
 =?us-ascii?Q?AQxyRQmpyF+2WdNfD/UpCrCeyMKBVlKRJ9Gk2yYT5o15j34ZbvpzY/CaKnFJ?=
 =?us-ascii?Q?mFcIZ2SUm/FaRnt5SdmnZT2sf/FkxTGbKbbWn5uYo95VGr9/KGa1gA3bJbdA?=
 =?us-ascii?Q?CIGzuW6uaXhpGfZ78gi/IrrK7DprgkAyqRueotxgUFpNtgsGMTl879KDuOHu?=
 =?us-ascii?Q?SoqUsuzODw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 10a902ff-b8e2-447b-7b1e-08de4d30d93e
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 14:35:33.3146
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gt4d/MmPIGyd3IqcT9uYwfSCtwOwn7G0T0hyLi8K2qtJd7iTLfTyNgfBv0wfdiKZx+VvS5dQz+OPzWIs0Mk9RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB11287

Hi Marek,


Sorry for jumping in at V4.

On Tue, Dec 30, 2025 at 10:32:34PM +0100, Marek Vasut wrote:
>From: Fedor Ross <fedor.ross@ifm.com>
>
...

>+
>+&ecspi1 {
>+	pinctrl-names = "default", "cs";
>+	pinctrl-0 = <&pinctrl_ecspi1>;
>+	pinctrl-1 = <&pinctrl_ecspi1_cs>;

Not get the point of using a separate pinctrl for "cs",
I not see driver using it, or I may miss someting.

>+	/delete-property/ dmas;
>+	/delete-property/ dma-names;

Why disable DMA here?

>+};
>+
>+&ecspi3 {
>+	pinctrl-names = "default", "cs";
>+	pinctrl-0 = <&pinctrl_ecspi3>;
>+	pinctrl-1 = <&pinctrl_ecspi3_cs>;
>+	/delete-property/ dmas;
>+	/delete-property/ dma-names;

Ditto.

>+};
>+

Regards
Peng
