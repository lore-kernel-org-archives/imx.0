Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013039.outbound.protection.outlook.com [52.101.83.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20067421EE8
	for <imx@lists.linux.dev>; Thu,  5 Feb 2026 15:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770304161; cv=fail; b=Nhc/xvXnuznqJVdisif9Fem4PQaICokVRnr9nGvu0scsravapOCqJq89PagZkyzRkBdGvR2CUO3+XK/Vv3hv8nc+c03szK1hqkPylPc1KDuAQCwsrK9kT6O0xLFkGHIAl+U0rIha13Chkk4xUUnC9iUjIAp4FvxGXVY7wtF0obk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770304161; c=relaxed/simple;
	bh=NoCM9ERWbyPzaLgpf2tODBFZ9f6g/4LVNsBT8gTwZ+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=N8nGaHcKpCjxZ1cjrZsv/XMBCac56RcBj8uEoW+rSMzariGapVAmYyMzoEMTNHavU9iABzPE6tS0xPyLfLEf7prn32EuuF0KefnnbuqOOjsOU6ngYY0kuLEzkkvKR9EmRs2rnNhYIiqji4XibfWeJTOo4cvzWNgIt0Wig8DwIsM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DcfN7efL; arc=fail smtp.client-ip=52.101.83.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DcfN7efL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ahGhHGB4TRmTNSj1k78di3z+hOBZL+xqaiit6L7qJESS1mYPXzIrRZgQqUcX1iINoF7k/do2tyo0MFF3VFQvJuL6nYu8HTtJhkokPVOH4gSHnKI/jOhYClCMVVnecidLQYAw8Hk/RBmLP4t2FgloRA+WnQwWiJf3x5WJqhIm+8eNfwOg3UKIFSZ7gudFDJjZnq4xnQl7OGt6r45UUZU5qOAzTk/qKRCwf82XlpW81kpIxTQQAsRtIvK1/SKlROOudLsA9YZyl/kcx01FVS8AfYC/t/olJcretdnW0c5ssjzLv78cjrQfIsQgc4kOS2SWFmVwgX937XIYZScJob0Muw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4j8iCW7UYeXpn+tGuXG04C+0JWWlLQYe7UpXbVD/R8=;
 b=V4kwDckS/TJvpqRsWeFqapzrQeKE6xEfJW0pqqt35TXKP40lWSKkiDl/xV7LCzIte6nN3faX0ggsZwCWi0d1S9FIKqrZhT+W7fdz6h4mm3iuKO+jQWxvMKGmgXirZrFMWK+wjunu6AOd3bH/JqqqKPX1dHGiZBhF0UxQefbfNzV9Wqtwp4JWZC1r1geoSYRHfr00nykJEKs1Zm1uLmXhBWdWkYE219PTwRz5hJUBbIugavgE0DQS+MMjRmV/kwcpQU/GAy8cEaTBjY9a8GAAB1VIEJHdnEOKNXdyN/eJBF3yjfbvwwKrGYaCsbGx3LNTlP2fUcwHP0EuceS+Sz9EGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4j8iCW7UYeXpn+tGuXG04C+0JWWlLQYe7UpXbVD/R8=;
 b=DcfN7efL+xpDlqkar46kwDN92OhVmKJkv+GyPoi79/40P/YWgIUHdvO6L7RWCHGUpk2BEKC3CDiPkIJ9j5b4y1NGvakQ4bLLo0sSNZv7uw0DQd23EhHcduvowKZ4LLvrAPjix55AXc3dEWsCIeQMgdhYhbC6x7f5+O6YnuDifsnV98EIsgeD2NYo7r024tm85WD6PioxApF5yiNEHf80OigmC2Df51k08PBKCqH0h/aoLCAmrUvpC8KVVgLnNdG0qSm8Itpk98w+K04SlogjCpPMx1j18+mmSvzHqJLXUsXjNawf8YoompDwqPPvmb/dZmVsRNSHYHGJOOKRkgfIcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB10393.eurprd04.prod.outlook.com (2603:10a6:150:1c9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Thu, 5 Feb
 2026 15:09:16 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 15:09:16 +0000
Date: Thu, 5 Feb 2026 10:09:06 -0500
From: Frank Li <Frank.li@nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
	festevam@gmail.com, alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com, primoz.fiser@norik.com,
	Markus.Niebel@tq-group.com, y.moog@phytec.de, josua@solid-run.com,
	francesco.dolcini@toradex.com, maudspierings@gocontroll.com,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>
Subject: Re: [PATCH v2 0/3] Add support for Variscite DART-MX91 and Sonata
 board
Message-ID: <aYSykvmfuYrJhsR5@lizhi-Precision-Tower-5810>
References: <20260205100125.9095-1-stefano.r@variscite.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205100125.9095-1-stefano.r@variscite.com>
X-ClientProxiedBy: PH8PR15CA0003.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::25) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB10393:EE_
X-MS-Office365-Filtering-Correlation-Id: ee017e63-62c0-4571-c307-08de64c8874c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?BvlVe6x9LA21XCiNbrvabFhmIGVl/qDNpozxnK1qCOyE8IpY/V90y66dx7HW?=
 =?us-ascii?Q?9lCg9KHGvbF53IdNW5u9GYCkh4mQjhi8do2tfF0xMLHrFQCeURWBmVi/qzlV?=
 =?us-ascii?Q?OYNxlaSNK1hIcNphd5s45jYLIsh4VzIulCtLV8azfdTBdR2M7gdQYuFAKvtQ?=
 =?us-ascii?Q?eKW4gAQBu/c0w60mGidJnedJwy4n8WacJRDpLY3pDLXjA+ERCWw9KY9SCfv7?=
 =?us-ascii?Q?fCn1jSf08XQBOAL3rzSey6Puz51wJww2qMac5VzzQc4WvDKYwKdpshoUu/R7?=
 =?us-ascii?Q?wb17qeQ3lx0Qcg8Gu0RtDmql+Th3bSVazcepiLUlLNBjE6DuLpjhCGMEp0tZ?=
 =?us-ascii?Q?xY7vZ1rXLZYdf1vYxANg1zIvRDD8JUu6wMzcqbPlg3+AxDagszI1/nZgcTxZ?=
 =?us-ascii?Q?5pqaw6AYzAX9AXHNBlFzcYV6kFTyfu0lqVTNkqew8MVjMwW2RKohdQqFP9Io?=
 =?us-ascii?Q?64x8QVuUDKQdCuWoO64NOZ0iwn/lMpE7cwjhFLTb7/xzA0QiS5WNA2JnbWGo?=
 =?us-ascii?Q?XLvAT6mojiGP/fkthiYnssNShymXY8JCAXxV8xdZ1KLZfciTFDpErgIwTMwT?=
 =?us-ascii?Q?ijcdTE7nI1zM4ampMGAOozXEEsMIhNJ6kir90ooVnwjG7JJH9uDWJXQ8uNxD?=
 =?us-ascii?Q?IAYf2IIIGYKiXvWhliB2LNDfhtS1o5KVpopS8MS2gJZq/O84ZvWz7fs5X37f?=
 =?us-ascii?Q?EJ0A7inOgA+9C8hfoZMnA/EX6HNwxSq3Vi11pDRN4TyqKShIqv4W7tvd1ds1?=
 =?us-ascii?Q?yJ3URO2UuDQS+daIjUFGEMmwnVS4+paLffTxq6aaYq4qzzp13ocFYZZ4DsJm?=
 =?us-ascii?Q?1259pNURn1S5NmUfv/q7oI8nG6dF7ah5g7StnKKX4/CnPjB/pRgW3WsrCMkZ?=
 =?us-ascii?Q?MsmSI6IwCuugczQv63HGgHl1juzsTNuPGM7TPS9t6PAzj54V4BdJ5jll2Vho?=
 =?us-ascii?Q?DlgO4Eyd4bDTHUbx4w3X5gFPXVeGxQioNmoue3lV+d3ksIaf7sJ1rk7OEy5e?=
 =?us-ascii?Q?HqEWlcoTePmI29vo5JaDaDFNn8CSYHJBqO4f2OtQ0ewKNiXOymjX6edtWmv1?=
 =?us-ascii?Q?khsLJqCCx8vlp+A9NE7nxiNDCuIghT5gHxdhluPbcBfgemzffdl8AK2Z8DHA?=
 =?us-ascii?Q?aBt6HghKKcVox+RBecg27fUTMBQdcvOuXsf0J4K+VCrH0mXxMd6M1hyBlfqP?=
 =?us-ascii?Q?cAScKLa0WheuYLTIPPBMcpQwpbwlXKpKy3434RHb4Spt7S+H9R6tY5J52u/O?=
 =?us-ascii?Q?Hg/+ms7Z46oOdQ5lKfmNwTZzw7ph9wMzfxDFr1XPDo65T3oT1Vt11/ob1pnp?=
 =?us-ascii?Q?Wz29BDNQS6ED7XyJOyn5MPFH1QwUDFkLwq6fNWLUYaXV5WVl1iHloTKVTQe4?=
 =?us-ascii?Q?ZlmNTpXn5VD8ENSpASK3BJR8qizuqP3nIt2DIFRA/JzchRlc6pQriCBWK5n9?=
 =?us-ascii?Q?NgqcpRjqzKfYYVyS9ZZuFFPjTqWBJhk7zHw1CGe/5QbeQx9XFJnieOZBFfLG?=
 =?us-ascii?Q?fuV8ywvdwoz8jghjqOFbUR2FqFemL0TlZJxzTl7YsluKWoTRyYZM8twFFYz4?=
 =?us-ascii?Q?46szPvcuBvSU3TqRypuwQZHGj9A4NQABsh388TY1aqfqCkIoGMnPjF2/ksy0?=
 =?us-ascii?Q?/uIhp3e0GWPLf1jDb6Uva6k=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?W1unKbi9MyLnz+Ia6/fVmZS5MjTyLRHvXr8FK66czNPeaLt8EG1rDgwYOwd0?=
 =?us-ascii?Q?a9xe/dSLEnQlQ6TPKsFzvPtzhCftG9Oa98my9M+GO7KQ+5pdMSmEX55stZw3?=
 =?us-ascii?Q?UJoDFoVqLTNKIjGeT/du3V7xqEb4UEFqxtYQAMyLbh5xy0Q3UTQepk+Rfkwk?=
 =?us-ascii?Q?YJAr/Iitkzh5JTkkJ7WAzDe59MDbpneJbDFdHQG+MH8BwiP0MHNWhlHjHLyy?=
 =?us-ascii?Q?nnsZCAat2YSR2tRh66NWG2c+rxje89RM0/O4Hb7K+fGvcV1SYs4/FzZN/ZBx?=
 =?us-ascii?Q?kZBXuP0GSdajX80RpxWk7wbSkgtjXg0gc6PDsSMomj14/1Ek74iLF6EmYd7h?=
 =?us-ascii?Q?oej41Tw8fclxb0Gs6YERPyYCSDP5CG02lgBnQvZX/oz34vhZMhminjYwicIL?=
 =?us-ascii?Q?Yap/+oDObOyULOic8BrJ5Ajt+aaRj/6NYVku9451dwbyyfIgxqKwFmhxfy9/?=
 =?us-ascii?Q?BZ+vcYkncTtXyJlNPlND/FCp2OP1dAanssza2H31ctrDDpMnvDpkRq3PazdW?=
 =?us-ascii?Q?c1X738Mxn1Q6mRNlkz0fiamI8gDgRkUvN3lW3Wi4CZkVTcFftKGjrRjMX4k7?=
 =?us-ascii?Q?+/jskKBLEHE/GU3OVgDFgmKQ9cNzbXHOaOkjEBwo0iAzCfAWoCu1EFS/PLfU?=
 =?us-ascii?Q?T0k9SP1dDg9u95aUorzHdP3H97nkX9wNibLgcLS+YUytKjvfLVRoB3U3geB8?=
 =?us-ascii?Q?oJ24YBGt3J261QssxxCFk9QC/+Y2ApcVAtd9iibuFXrPL+KpU69hb5jfovY/?=
 =?us-ascii?Q?ZNDuZJ/cbtHbepiOHq63DgcAua0HKDxPlRVrOx3kNvM2NvSIZyVYzpQlL8O8?=
 =?us-ascii?Q?swMOm2w+zOky662KQb6yi5MhBPgM1G1l+GwOhfhQBj9kqNBqzpWvg0zZFYCc?=
 =?us-ascii?Q?WHPoDohRZ7ObtfauSTHNh+/kseHvSCvzzoWxyvKHGD1Llut0u+PnDc9DCwPm?=
 =?us-ascii?Q?pqQUqJn5lPtb1dzCoQkX7ImJ9S43etRZdG7oOfF4uEVWDC9nI/a9m9E8Aa5U?=
 =?us-ascii?Q?dUNMt4FMzE1rR+m4scoSqm02Z95X8kt+A1c2IiwoDvy4qN+/CgvugyOlaTSB?=
 =?us-ascii?Q?Tnrb1has08dDLDnRfyePo9tycMwod9ETudQF+Gm4HKM3N1Ad5TKAg0DDASIj?=
 =?us-ascii?Q?WD4wD1WxnBZxRzrMsGwn4ptXNQEgmKFYgrnJSR0pMntNpihoRpKf8nr0G6Vh?=
 =?us-ascii?Q?+j6TBX+oq1xXjWlwp0eTLSzdZ/RS/CSm5x3KLe6zOv5+yQipMsLase35FQXB?=
 =?us-ascii?Q?TnLqLid1XqeYmPDVexnfnWlVbTs42M5EpFQuyQhfu7llfSn7aZUX8P2ZyLFp?=
 =?us-ascii?Q?G3DU9wtRc+19PPhFY854aTFyFVk1xhVVOYQfIo21cBCKk1rpytifWSq5o9NN?=
 =?us-ascii?Q?iOFoNqv11h0BJtpKF5sAQOPh1oG8J8/wFzlkUEU835UV3EWGNVR8Nw+Iv6u3?=
 =?us-ascii?Q?H2QQhTIcEIYmZ+U8kCNpLH8qmzTyXREbEJgHt9CzljlCzCjHXCuNkXs++uYF?=
 =?us-ascii?Q?T5a5WHUvLIYskX0Kx1klsZy1AEnOztxEMCa6QyeczGKU1zHWmyfwyenptqtz?=
 =?us-ascii?Q?XBQC8NjqIqKmbzGK583QnXc5+Ne0hKA3M6Usl7BGlz9X6uQVQlJ9uq9xWKwn?=
 =?us-ascii?Q?71O7gkAgbJn5/PxN6uu2MjLUVJwYGcxp68+ZLwBf/vLL2OjrMG2dF3+yF594?=
 =?us-ascii?Q?2kjBvLEoLZ27jtC3GwXiQEbO/S5Er9+2TO74HlBOjdh+JjSk/1Komx3jyTTV?=
 =?us-ascii?Q?RdiIcTQg+Q=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee017e63-62c0-4571-c307-08de64c8874c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 15:09:16.2874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: idQZsQ7TZBRoVPW+Y/798DqEoHp2my30A9ghSECKPVNBiNquTlD2Gg4Wdf5o0erEO6+/CEpbw1U67rmKd/4ApA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10393

On Thu, Feb 05, 2026 at 11:01:22AM +0100, Stefano Radaelli wrote:
> This patch series adds support for the Variscite DART-MX91 system on
> module and the Sonata carrier board.
>
> The series includes:
> - Device tree bindings documentation for both SOM and carrier board
> - SOM device tree with on-module peripherals
> - Sonata carrier board device tree with board-specific features
>
> The implementation follows the standard SOM + carrier board pattern
> where the SOM dtsi contains only peripherals mounted on the module,
> while carrier-specific interfaces are enabled in the board dts.
>
> Stefano Radaelli (3):
>   dt-bindings: arm: fsl: add Variscite DART-MX91 Boards
>   arm64: dts: freescale: Add support for Variscite DART-MX91
>   arm64: dts: imx91-var-dart: Add support for Variscite Sonata board
>
>  .../devicetree/bindings/arm/fsl.yaml          |   6 +
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../dts/freescale/imx91-var-dart-sonata.dts   | 498 ++++++++++++++++++
>  .../boot/dts/freescale/imx91-var-dart.dtsi    | 468 ++++++++++++++++
>  4 files changed, 973 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-var-dart.dtsi

where your v2 change log?

Frank
>
>
> base-commit: 18f7fcd5e69a04df57b563360b88be72471d6b62
> --
> 2.47.3
>
