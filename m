Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013069.outbound.protection.outlook.com [40.107.159.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AD628A3F2
	for <imx@lists.linux.dev>; Thu, 19 Feb 2026 19:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771530133; cv=fail; b=VSLCbjchB0EU8Tu0HIcGdekpICMHpFCDt5kXHxHVWnH7f3kK2Zfkh3QQSqWiARDizkc8xjTXwyW6174Bf0TYWG7v/SgAkX/dnWuNduUpP6Il34YS8xf5FGT8Tvl4tPs4M7hcVJdrJnTBfl9MtAckqYbq20zFNRG4SFzer9WoZMU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771530133; c=relaxed/simple;
	bh=Rqp4o3xFp/AOTMm7NDy5y5ddZNtnvEsbrae4o2NVabE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=J4bqedyB3Q1xOlnARskx3YtcCndvQ+itt8Jr/hCp8fxnoJYxrK4wkNN3pU1fgl2YiubDB8oLYGnOV4zuTwUgGFYmrtUiKgwbbrEJq1XPvTW9rbWai3KoFKVdHq8ha2U0DPKMa/8tjElOjqfTa6gh03USN6nCRaHUdZHcdz+7iLw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Kk341M7w; arc=fail smtp.client-ip=40.107.159.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Kk341M7w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FopH9mOOFI7D2wVucef27UqJyQXjyTQlrK2fFthLiYeVfntlTntbDaKtPyg4RttjV9J3GyVHZKJ+hV7GjqtKAYMKeIZweuKCFAOTuHedIL/WXDnWG7kDyJ6N75vb1/Cc+ZfYCCjpYqOHuVuD36zGPAellKMEhQH7ZdW8cVKXlIevjC7+99+xB+emHv/8TVosqCbihPD8d6ln05xO5lvOZDZJYfrmHfDgQR1PN97lxjDg1E08ZTIiUZQyfC/ICpIpVHgC6YYrNWyLfPKSzBmMzsDl8YGOkHPKxw4QBXajgtSc7xInw3hGIgbFqlAMmbEE/l55Pl+OrT9kE+qt9Cpoow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qQCkTpNyRRNIsVsw0afle76sml9SZPE6N/Qqn6QmsIw=;
 b=G3TkKw8OD5cRwqii7DPiFe0DUc6lGBYh/yeGWOah4kJc5u/kGhI75wHFFmJAWquKKQpu83CCQMA1z6BdATBKvIvpu3Nq3Ybb6ASPKELiqdKm/2GeIvjJJmEhAhUFl8X9p53NOcZ9TzUGsyQqwNyMjqN/nzkGlT742gl9Rdpwqju2TlYfsrNqO57Iwvge4r38G2enp/5YCRLnjWMZM0UNLOB0tmX/asPSlDNhg2MdYZ0c8IGEilx2GOAQZRmAmUk/Y5PB1l8hwotayGPB5KwmP/4/Ib5YojnQO3lRcsLJ0Uau/qOhxBIsXJD9MrnrkpMClo1we8+/NzpjXr4dGSTr2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qQCkTpNyRRNIsVsw0afle76sml9SZPE6N/Qqn6QmsIw=;
 b=Kk341M7whZf0ctZzg+V4RGtb9fixoY42Wb6As7dLMYX8QMQ6K8MnvLE6mzZ03k6POq8RlUizpbpNudDzBKozbH4sz5viI0A1mm+3PKkrDlqrr6umgnHetFbS0eUya0ts2qpohu5vcLmg6YfBADwRBSi1q4Bi/0H621KDSGjYKDwlVhgGO4tiamblSByK6hm6c6JwOH8TA5TpZ69bDleC50Zy+EbGVI4+HZCaJ1+6uG0EC4yHA2C/vr5wkOyxB5gtsluI/uEuxn369bT200x2dkfnofHnBPZHkCHsdKvO3Ke7xHr79MJs85ffb6gEeSvuGXdcBsENb2j7uRCF/0LjrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS4PR04MB9716.eurprd04.prod.outlook.com (2603:10a6:20b:4fa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Thu, 19 Feb
 2026 19:42:07 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 19:42:07 +0000
Date: Thu, 19 Feb 2026 14:41:58 -0500
From: Frank Li <Frank.li@nxp.com>
To: Max Krummenacher <max.oss.09@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Max Krummenacher <max.krummenacher@toradex.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "ARM: dts: imx: move nand related property under
 nand@0"
Message-ID: <aZdnhv2QC1szMCVl@lizhi-Precision-Tower-5810>
References: <20260219151157.2549198-1-max.oss.09@gmail.com>
 <aZcz1vRg4KtAKUd_@lizhi-Precision-Tower-5810>
 <aZdDF6BObEu_C4KJ@toolbox>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aZdDF6BObEu_C4KJ@toolbox>
X-ClientProxiedBy: SJ0PR05CA0159.namprd05.prod.outlook.com
 (2603:10b6:a03:339::14) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS4PR04MB9716:EE_
X-MS-Office365-Filtering-Correlation-Id: 42c73cd3-c1d0-4158-71e3-08de6feef703
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|376014|19092799006|1800799024|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?IaXLJmvp4TZ0bCV1WohwHLWaz3ZsYYuUo6+vbtCYssdc/Ts3oknbbmxg1Gd3?=
 =?us-ascii?Q?dLB00qo1yaqsaT6cBA1nnokrYO0roXQjphYLfRV9axxsfzprMY+l99jp8XMG?=
 =?us-ascii?Q?MzxMTE6xOnNz1fwMW57dcZ85p3e8LB1DVsrbXawIZBnOMRozw0xalHLboWJI?=
 =?us-ascii?Q?/Bb1UJJPNt8VK28bii1VW3wtLU/fY9zmabSDf3Ht7FLXCfCk8Fi1/Ls0i/yn?=
 =?us-ascii?Q?tjWVTMa54p3ilI7f4NRKhcjcM/Xrx7RhJqIYe7Qrk86Xp70415CMO0sVE4Co?=
 =?us-ascii?Q?1Q/4EJL46JZ3cwqM/WeBan0GmMxe6oozT1rHeHFjP7vxg3Mjb7yGmBW7n9b0?=
 =?us-ascii?Q?Z3ps9GEIrH9SN3gqhph2oukL8TAroUVNn+YpPlBb1Zx3jP3u+t2xur2h+187?=
 =?us-ascii?Q?3z9/YLpG7asZQnuMoglsFvK2C/YWevG1TzLBN+9km6NaftOpNnyGYGnFQttH?=
 =?us-ascii?Q?0DIZcWmGlWHf6+UqPl+DLimkv6SG2nItmEMoz0TeRuB8ipUvT+SBT9zBtV5C?=
 =?us-ascii?Q?lHLJ6m4ySTTa2DD2hHPLbV5bfin7Efn1K2V0ZI9pxZeXPQo4J8eciIaFDF0X?=
 =?us-ascii?Q?WwUZXVM95jKqzZwJlYPbFOIsl1KV6+sL/756YY0sbPg8KNS0+F2qdln8g3jO?=
 =?us-ascii?Q?er/UBmeoh6JD2fCfvr4e7hGdlk7Flp4w2SBfidbGywD/78p5epDWi8lCjM9v?=
 =?us-ascii?Q?Y/JgkFg+FAYXaSUQ2zfPgzk9AMwMVNN4gvjm2yaUD3N/lp0B0tDrntSeh44p?=
 =?us-ascii?Q?2/BzbWk8+yjiKULqM9DElhxoPzlxRWlqNcAwuEYFndQy0Sr5Ne4Wae/z9xqa?=
 =?us-ascii?Q?EqI/KOza//eukoOeoA8UTmmZVHtc+gsBXsqFM67YCvRtwMw5IPWLXNMrk0ne?=
 =?us-ascii?Q?li6eIdX1ptIY4+Lu4I3iQLhBpGj/+dn6VZERF2vtmWSHuF704DOnIZF0xahO?=
 =?us-ascii?Q?zyiwKy7zBVveugFv2/ANoZHlx2BOUO4gd+Qq3OIV1QEY7K30jwROODU4DMKh?=
 =?us-ascii?Q?i+cbfAaNEjxcAb/PgKD+mPrzQC5DKFmAEhSoA7bSWaQxhvTvNN8zWkMMzL1O?=
 =?us-ascii?Q?TsTRb2M0RDEB8mZl8+gsgK27Sv0zqQ4lsTO0H0e+ALq77i3MFzvmD/Frn+el?=
 =?us-ascii?Q?E9sbxQzS5l+nx2IPdSmqEaOa7ilRQxiXHVxKjhlD/IG2MFx7IZ/tyFuz+FDQ?=
 =?us-ascii?Q?gDmFhsogFM6s+vRIa5zztEI86dCGiUv93TBeHWFjVGW6hxQOuV+n7ZbEOSf2?=
 =?us-ascii?Q?b3pSK4wS5ld0MwChHgTExNH0webZTYZ03f/pX+dMDxHoz4jH782TzNFc7h5l?=
 =?us-ascii?Q?OGOhGBdh5PyAMKkrrQv7tc+LeLFnRt23W0iZotvz8M0iZYAZhQjrQ4vpVPk6?=
 =?us-ascii?Q?XMP7cdhLeTdxe/S7FRq2ZFyN5XxzAFpx6o2voYS1zGrHWIMJgUGwgbj9/4sf?=
 =?us-ascii?Q?0PDHdWkPE9hZiecxxeQ2niRYvphilOJ5P1vKKWIB8qN2HEl5CvtdFtSX7oRp?=
 =?us-ascii?Q?9uYqA4SyKWemhCO1Sunm/oB4lTfwbekajiU9bH82gd4t++NjskDPVRZj2vuo?=
 =?us-ascii?Q?d9v8WYpu0kR9GchwhrBBrxWgFFNiVyAq/k1X7ONBfzqvscCE97Q1oQm+AcZS?=
 =?us-ascii?Q?8E1gr84+J7D49eQ8EUA1QSE=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(19092799006)(1800799024)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?yVxZSjc2c+xQyL71jzKYNs+0VNqKhuqBNG22oUQ/3q4sm1Kz9RWGX7m/XmvS?=
 =?us-ascii?Q?TkkI1BhNJHhcyw7uJvSXWuJLK3G7NItxDel9byRO+3OUw0TZKqFmQ6qaQVxB?=
 =?us-ascii?Q?Pala4umiqETcZ45y9fbBlNjWBAsNod6S9848PEDG3KfvzNoDLV+5wG1F2MpD?=
 =?us-ascii?Q?ONhwFjvvSrBv5+AGvbxdRtPQ3qd7mQ2jJZ/EtY4M/23fSVVY5soayFOHsCC1?=
 =?us-ascii?Q?4I6BE19aFM8KM05mau8oUcbjoBXSbLNT6b5/roFld6AV3mKOoatT9FS2ulv4?=
 =?us-ascii?Q?Y25cYNTBp/0sgCgSUKefGaaj53e4xIGc3e0k44eBDOutWmUgAziJUzOEIiZO?=
 =?us-ascii?Q?sCe6gBcraL5jy28nUEeAQRGqHRUPcxgEbPyZGbIiCersHIi/3T8b+iQQWREd?=
 =?us-ascii?Q?YshvyCZMjh0A9mjGZvDgvdov1nIYQrYzF6hCakBUT0GeXzRCASPTi5x0J/vn?=
 =?us-ascii?Q?acZIsK04U++ANjAv7Q6CxzBaTIWru/nTMiJR7Da2q31nBaf44JqnoRXGnPwc?=
 =?us-ascii?Q?iOWQBBLeYNa5y1SubuzGzc7+aKcr7a/yUpSZholrF0X9nl4fJSBEXFLNeIKg?=
 =?us-ascii?Q?blgeYBhsWFdHlSB2j4xIHJkRqT7Uy9S0SBoetd8bl07n7qbb50Pm8QQ6pwbk?=
 =?us-ascii?Q?UYbSAzUDmLiprith3kDCBuANdICvF5p2JOjRZqJ6e85lHHCAWW5l+d5o5SYx?=
 =?us-ascii?Q?Ze59XScK3VMC8pSQd8bggPgjNsu6cyNM2U3UZ3i6bJ06NuZ1GHaauNATniXW?=
 =?us-ascii?Q?boeOtC0Q74u0llO5lEOitqBla2py9nOOYP9ZZ6r+FyjacpMFneLVCsMd5NdR?=
 =?us-ascii?Q?ohan53TEiT31u8J68HU5PuENtwSKQt5R2JteO5nPcC96FizYTgPSfWEmfehE?=
 =?us-ascii?Q?nbR4z4wAuzVMTjkTBz7K2Fb/GfBVJ93pEsWDcgMd/dAf5S0VkpWyF1AmA5T9?=
 =?us-ascii?Q?yr+1YR+SultJZm1gifdS8sSTq1FxHht2r2yK8GwJZJFpfmfMaZUGy6vDKiCD?=
 =?us-ascii?Q?K1372EXccz5epgTiDb0dmRRd49z/PKf/YPa0zsL+Eu6me7SAXnKcEt+mPUmB?=
 =?us-ascii?Q?5UJreBd9ABhiIwnnsEpMAkX8vyFhLOn+1V6ohELHN49e4x3uFnoOisrf/KDq?=
 =?us-ascii?Q?9/nkuIALjms0S16jyGMQYH3GE+vZIhxULEULw2FblhsGOd1p7N0Z9vQ8AGtR?=
 =?us-ascii?Q?EaGkzOTCIBBisokqo6pRaOgs3B9YWcZq3K18I0q7Bd+6Oob+QXSwbKoCMsbP?=
 =?us-ascii?Q?w/Se693mlNQ93GTVlH0ncVPWq+oxz7ICJmfn7d20HVXjerSLsKXyhBk6x6iY?=
 =?us-ascii?Q?qpTNq4eUCV7JotBLicksf4xWzejyX1d71sTfMLbmwpLj1uQ6TEUlKCA2Ku/S?=
 =?us-ascii?Q?FF5jKN0x1KakXcpSAvNjTEZl6bzT0Br/fSmDh6XSLUsVPLnnTc0iWRtPREIN?=
 =?us-ascii?Q?LUAJhim39vJZhUZEwUv4ltwk4med+b/m0Cn6idNLDRtQnqAdH8/N6177ssAo?=
 =?us-ascii?Q?COTZKQr2qiOjYZIU8CFYvLO1FfRVuMp4LVJCvE33Ml81whT3aZmh5AqSXe4D?=
 =?us-ascii?Q?SGs4JB4CZOftLJ3+sLMRWu0ldgkC5EOE8uMXUXKEVzLn6fBuz+IAgcN0CdEU?=
 =?us-ascii?Q?kzvra4QBATItpYNp+T1WwBLUCwGtliKERNMHuX25qO4et+KTpJGulIxYm48t?=
 =?us-ascii?Q?c2n2OO3I6XrVCvQEi/TrA5zftGIJv29jOUGG2N1FBW497U5y?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42c73cd3-c1d0-4158-71e3-08de6feef703
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 19:42:07.2511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GIvZ4WMaxvXIipAu/6xVkMt/1EIXVuH0qNhtXyXxyYKdeVVg9wpDGI0jZgSydSz6a3gY1bkwWO0yfyyEydsV7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9716

On Thu, Feb 19, 2026 at 06:06:31PM +0100, Max Krummenacher wrote:
> Hi Frank
>
> On Thu, Feb 19, 2026 at 11:01:26AM -0500, Frank Li wrote:
> > On Thu, Feb 19, 2026 at 04:11:49PM +0100, max.oss.09@gmail.com wrote:
> > > From: Max Krummenacher <max.krummenacher@toradex.com>
> > >
> > > This reverts commit 8124b4a4a96b57d6cc3705a9df9623c52baa047b.
> > >
> > > The change introduced a regression: at least Colibri iMX6ULL and
> > > Colibri iMX7 no longer boot with that commit applied, while they boot
> > > again after reverting it.
> > >
> > > Although this has only been verified on these two modules, the issue
> > > is expected to affect all device trees using the gpmi-nand driver.
> > >
> > > [    0.876938] Creating 5 MTD partitions on "gpmi-nand":
> > > [    0.876974] 0x000000000000-0x000000080000 : "mx7-bcb"
> > > [    0.879860] 0x000000080000-0x000000200000 : "u-boot1"
> > > [    0.884761] 0x000000200000-0x000000380000 : "u-boot2"
> > > [    0.886993] 0x000000380000-0x000000400000 : "u-boot-env"
> > > [    0.894686] 0x000000400000-0x000020000000 : "ubi"
> > > [    0.899054] gpmi-nand 33002000.nand-controller: driver registered.
> > > ...
> > > [    0.960443] ubi0: default fastmap pool size: 200
> > > [    0.960476] ubi0: default fastmap WL pool size: 100
> > > [    0.960500] ubi0: attaching mtd4
> > > [    1.636355] ubi0 error: scan_peb: bad image sequence number 1588722158 in PEB 4060, expected 1574791632
> > > ...
> > > [    1.649889] ubi0 error: ubi_attach_mtd_dev: failed to attach mtd4, error -22
> > > [    1.650029] UBI error: cannot attach mtd4
> > > ...
> > > [    1.670262] Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block(0,253)
> >
> > Can you help found the real reason why not boot?
> > nand@0 is preferred format for MTD raw nand.
> >
> > Frank
>
> I guess the root cause is that the driver for gpmi-nand predates the
> update of the binding rules which want the nand device described in
> a child node 'nand@0' also for nand controllers which only can
> control one nand chip.
>
> While it is possible to update the driver in the same patch set as
> changing the device tree to understand the new dtb rules, maybe even
> falling back to the old definitions this likely breaks other users,
> most notable U-Boot.

GPMI is widely used, include i.MX8 still use GPMI. Does below patch fix
boot problem?

diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
index 51f595fbc834e..fb126a7c4a61e 100644
--- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
+++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
@@ -2680,6 +2680,7 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)
 {
        struct nand_chip *chip = &this->nand;
        struct mtd_info  *mtd = nand_to_mtd(chip);
+       struct device_node *np;
        int ret;

        /* init the MTD data structures */
@@ -2688,7 +2689,10 @@ static int gpmi_nand_init(struct gpmi_nand_data *this)

        /* init the nand_chip{}, we don't support a 16-bit NAND Flash bus. */
        nand_set_controller_data(chip, this);
-       nand_set_flash_node(chip, this->pdev->dev.of_node);
+       np = of_get_next_child(this->pdev->dev.of_node, NULL);
+       if (!np)
+               np = this->pdev->dev.of_node;
+       nand_set_flash_node(chip, np);
        chip->legacy.block_markbad = gpmi_block_markbad;
        chip->badblock_pattern  = &gpmi_bbt_descr;
        chip->options           |= NAND_NO_SUBPAGE_WRITE;

Frank
>
>
> So I don't see a quick fix other than reverting and living with the
> dtb_check warning.
>
> Regards,
> Max
>
> > >
> > > Fixes: 8124b4a4a96b ("ARM: dts: imx: move nand related property under nand@0")
> > > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > >
> > > ---
> > >
> > >  arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi      |  6 +-----
> > >  arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi         |  6 +-----
> > >  arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi |  6 +-----
> > >  .../boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi |  6 +-----
> > >  arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi      |  6 +-----
> > >  arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi           |  6 +-----
> > >  arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts            |  6 +-----
> > >  arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi          |  6 +-----
> > >  .../boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi  |  6 +-----
> > >  arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi          |  6 +-----
> > >  arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi       | 12 ++++--------
> > >  .../boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi   | 12 ++++--------
> > >  arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi |  6 +-----
> > >  arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts     |  6 +-----
> > >  arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi          |  8 ++------
> > >  15 files changed, 22 insertions(+), 82 deletions(-)
> > >
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
> > > index f452764fae00..547fb141ec0c 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-som.dtsi
> > > @@ -36,12 +36,8 @@ &clks {
> > >  &gpmi {
> > >  	pinctrl-names = "default";
> > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > +	nand-on-flash-bbt;
> > >  	status = "okay";
> > > -
> > > -	nand@0 {
> > > -		reg = <0>;
> > > -		nand-on-flash-bbt;
> > > -	};
> > >  };
> > >
> > >  &i2c3 {
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
> > > index 58ecdb87c6d4..9975b6ee433d 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-icore.dtsi
> > > @@ -172,12 +172,8 @@ eth_phy: ethernet-phy@0 {
> > >  &gpmi {
> > >  	pinctrl-names = "default";
> > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > +	nand-on-flash-bbt;
> > >  	status = "okay";
> > > -
> > > -	nand@0 {
> > > -		reg = <0>;
> > > -		nand-on-flash-bbt;
> > > -	};
> > >  };
> > >
> > >  &i2c1 {
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> > > index 6f3becd33a5b..aa9a442852f4 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-pfla02.dtsi
> > > @@ -102,12 +102,8 @@ ethphy: ethernet-phy@0 {
> > >  &gpmi {
> > >  	pinctrl-names = "default";
> > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > +	nand-on-flash-bbt;
> > >  	status = "okay";
> > > -
> > > -	nand@0 {
> > > -		reg = <0>;
> > > -		nand-on-flash-bbt;
> > > -	};
> > >  };
> > >
> > >  &i2c1 {
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
> > > index f2140dd8525f..85e278eb2016 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi
> > > @@ -73,12 +73,8 @@ ethphy: ethernet-phy@3 {
> > >  &gpmi {
> > >  	pinctrl-names = "default";
> > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > +	nand-on-flash-bbt;
> > >  	status = "disabled";
> > > -
> > > -	nand@0 {
> > > -		reg = <0>;
> > > -		nand-on-flash-bbt;
> > > -	};
> > >  };
> > >
> > >  &i2c3 {
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> > > index 131a3428ddb8..c93dbc595ef6 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-skov-cpu.dtsi
> > > @@ -260,14 +260,10 @@ fixed-link {
> > >  &gpmi {
> > >  	pinctrl-names = "default";
> > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > +	nand-on-flash-bbt;
> > >  	#address-cells = <1>;
> > >  	#size-cells = <0>;
> > >  	status = "okay";
> > > -
> > > -	nand@0 {
> > > -		reg = <0>;
> > > -		nand-on-flash-bbt;
> > > -	};
> > >  };
> > >
> > >  &i2c3 {
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> > > index d29adfef5fdb..57297d6521cf 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tx6.dtsi
> > > @@ -252,13 +252,9 @@ etnphy: ethernet-phy@0 {
> > >  &gpmi {
> > >  	pinctrl-names = "default";
> > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > +	nand-on-flash-bbt;
> > >  	fsl,no-blockmark-swap;
> > >  	status = "okay";
> > > -
> > > -	nand@0 {
> > > -		reg = <0>;
> > > -		nand-on-flash-bbt;
> > > -	};
> > >  };
> > >
> > >  &i2c1 {
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> > > index 40d530c1dc29..2a6bb5ff808a 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> > > @@ -133,12 +133,8 @@ ethphy1: ethernet-phy@1 {
> > >  &gpmi {
> > >  	pinctrl-names = "default";
> > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > +	nand-on-flash-bbt;
> > >  	status = "okay";
> > > -
> > > -	nand@0 {
> > > -		reg = <0>;
> > > -		nand-on-flash-bbt;
> > > -	};
> > >  };
> > >
> > >  &i2c1 {
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> > > index 776f6f78ee46..e34c8cbe36ae 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-isiot.dtsi
> > > @@ -101,12 +101,8 @@ ethphy0: ethernet-phy@0 {
> > >  &gpmi {
> > >  	pinctrl-names = "default";
> > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > +	nand-on-flash-bbt;
> > >  	status = "disabled";
> > > -
> > > -	nand@0 {
> > > -		reg = <0>;
> > > -		nand-on-flash-bbt;
> > > -	};
> > >  };
> > >
> > >  &i2c1 {
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
> > > index 27e4d2aec137..a3ea1b208462 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-phytec-phycore-som.dtsi
> > > @@ -63,12 +63,8 @@ ethphy1: ethernet-phy@1 {
> > >  &gpmi {
> > >  	pinctrl-names = "default";
> > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > +	nand-on-flash-bbt;
> > >  	status = "disabled";
> > > -
> > > -	nand@0 {
> > > -		reg = <0>;
> > > -		nand-on-flash-bbt;
> > > -	};
> > >  };
> > >
> > >  &i2c1 {
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> > > index dc53f9286ffe..1992dfb53b45 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-tx6ul.dtsi
> > > @@ -296,13 +296,9 @@ &fec2 {
> > >  &gpmi {
> > >  	pinctrl-names = "default";
> > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > +	nand-on-flash-bbt;
> > >  	fsl,no-blockmark-swap;
> > >  	status = "okay";
> > > -
> > > -	nand@0 {
> > > -		reg = <0>;
> > > -		nand-on-flash-bbt;
> > > -	};
> > >  };
> > >
> > >  &i2c2 {
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > > index eaed2cbf0c82..ec3c1e7301f4 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-colibri.dtsi
> > > @@ -160,15 +160,11 @@ &gpmi {
> > >  	pinctrl-names = "default";
> > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > >  	fsl,use-minimum-ecc;
> > > +	nand-on-flash-bbt;
> > > +	nand-ecc-mode = "hw";
> > > +	nand-ecc-strength = <8>;
> > > +	nand-ecc-step-size = <512>;
> > >  	status = "okay";
> > > -
> > > -	nand@0 {
> > > -		reg = <0>;
> > > -		nand-on-flash-bbt;
> > > -		nand-ecc-mode = "hw";
> > > -		nand-ecc-strength = <8>;
> > > -		nand-ecc-step-size = <512>;
> > > -	};
> > >  };
> > >
> > >  /* I2C3_SDA/SCL on SODIMM 194/196 (e.g. RTC on carrier board) */
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> > > index 3dfd43b32055..43518bf07602 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> > > @@ -43,15 +43,11 @@ ethphy0: ethernet-phy@0 {
> > >  &gpmi {
> > >  	pinctrl-names = "default";
> > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > +	nand-ecc-mode = "hw";
> > > +	nand-ecc-strength = <0>;
> > > +	nand-ecc-step-size = <0>;
> > > +	nand-on-flash-bbt;
> > >  	status = "okay";
> > > -
> > > -	nand@0 {
> > > -		reg = <0>;
> > > -		nand-ecc-mode = "hw";
> > > -		nand-ecc-strength = <0>;
> > > -		nand-ecc-step-size = <0>;
> > > -		nand-on-flash-bbt;
> > > -	};
> > >  };
> > >
> > >  &iomuxc {
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
> > > index fc298f57bfff..83b9de17cee2 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-myir-mys-6ulx.dtsi
> > > @@ -60,12 +60,8 @@ ethphy0: ethernet-phy@0 {
> > >  &gpmi {
> > >  	pinctrl-names = "default";
> > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > +	nand-on-flash-bbt;
> > >  	status = "disabled";
> > > -
> > > -	nand@0 {
> > > -		reg = <0>;
> > > -		nand-on-flash-bbt;
> > > -	};
> > >  };
> > >
> > >  &uart1 {
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> > > index 8ec18eae98a4..2d9f495660c9 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts
> > > @@ -25,12 +25,8 @@ usdhc2_pwrseq: usdhc2-pwrseq {
> > >  &gpmi {
> > >  	pinctrl-names = "default";
> > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > +	nand-on-flash-bbt;
> > >  	status = "okay";
> > > -
> > > -	nand@0 {
> > > -		reg = <0>;
> > > -		nand-on-flash-bbt;
> > > -	};
> > >  };
> > >
> > >  &snvs_poweroff {
> > > diff --git a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
> > > index a41dc4edfc0d..8666dcd7fe97 100644
> > > --- a/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
> > > +++ b/arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi
> > > @@ -375,14 +375,10 @@ &gpio7 {
> > >  /* NAND on such SKUs */
> > >  &gpmi {
> > >  	fsl,use-minimum-ecc;
> > > +	nand-ecc-mode = "hw";
> > > +	nand-on-flash-bbt;
> > >  	pinctrl-names = "default";
> > >  	pinctrl-0 = <&pinctrl_gpmi_nand>;
> > > -
> > > -	nand@0 {
> > > -		reg = <0>;
> > > -		nand-ecc-mode = "hw";
> > > -		nand-on-flash-bbt;
> > > -	};
> > >  };
> > >
> > >  /* On-module Power I2C */
> > > --
> > > 2.42.0
> > >
