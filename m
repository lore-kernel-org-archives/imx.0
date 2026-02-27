Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013002.outbound.protection.outlook.com [40.107.162.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759CA2DA749
	for <imx@lists.linux.dev>; Fri, 27 Feb 2026 22:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772232223; cv=fail; b=bqB8bMY5zsrBB+GELWTLmi62GE+d9MbqkWVeM0EnLgmvUCeBUjlo3wbHFyGgtE9E/H4tlTimJL7XzK6O4qk7KO47p2Ih2JX8cYakTz5GuRud7ZIu3FNkZKcQ6PhRUQa1q5rCrByjdCN2ZuCzc/mwkwHFQciUxPrc2lDFvvJzz4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772232223; c=relaxed/simple;
	bh=MHw2Wnilxmw8+qGDY2ezClfQ4H2p3lA00W2cGRPcBJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sK1ZT9Sj1ABK1PtUo1HubZHoJoUG63p7thbGshc8B4gpNoXzw9skA0KPaz12xlDJNXfVVg/CGm2RTEnST8Y/9YFP1Dxu1J0MK1mAz7ZtQBi+ZIwGDjV0agfZVXj01HPpIU4S9gRIGZcnQRvVxUcG/pxylHSQ0HP43dMldBIJsTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=TiRZoUxA; arc=fail smtp.client-ip=40.107.162.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="TiRZoUxA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIhyGGNgrp4W4h5jS+hG1HgBLbU6ul8f4qHWK3CzodeSt/WEaQKQQqg/96H6Q0X3m1+HE8MeK9gJdk+JLF2V/q7X3OzGP2e0nyvH16QCFDq0SOeMxdFOjajmyC56GecTZGjDU4RbxYDhFeJLiofFHKeJO2DI5+s8+6tDLFTwYyo6xf9PGf47uSGHudb1hWHxzFB39w9byWAg+S8Y4gZlBybv7M1weCDmNA7FOGzFB9IMneBHjpiuCzYv5sOH9N+2otp6R6Gz5Esy4TzfNAxpLVaBddJF/RKEin/nftPVXMgcZqA1XXZ1lj8wB+g8UUlDT5c5Gn0AOeJbCpd++sQ9iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWFZMsGsnYs54bs1vqqsuSdHQPe/T31Uj40QKtniRGc=;
 b=I7MdWPzC9xuQJ6AceNP2kw+l24xRd93snZAhGxAJspg6zNkwQ1ZGNI7yITTns5eRVYSYDhEy0m5L5jXAiMN1sNRoCWC5rcojxwLTdfNH7MUUZ61DaFqjt9nS8mFqTCNVmx/SvvbFiD8TWYmL5S/tUj4dWV4fp+ePmgqQLO4QDM8bWRg5oD7DGTER+fkXYqsitxh52buZORuxKCLw2kDt8EDnKHKRqRD74LJ9bFq7Uo7d3PnoXJaE1xxWz/nab3g441S3HqpGZFXl87PTlBImc9PpJ9XPfmSCbIHjXsd67nzzqeTi2OAXwBs+fM7lbYWyeFP2hpxbFpW4gVBVVaozcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWFZMsGsnYs54bs1vqqsuSdHQPe/T31Uj40QKtniRGc=;
 b=TiRZoUxAUekJm+G/rsSeEqqc2JLA5Xq2os7AbgZCeBXHJqxp1dSoHhGCx8n16z0ATTbkdqt+4TlnfE0gis2S8a005K8XUQ7Mz4rUx6tgSElASKNh0ggl7SQSk3w2LYqGTv065RHQ2WO3+eF2RR114M0AZqdCs7yUitDoV/snWinmSnjteVchu+gdvp4qSSRRoPCxxzqv7ONYo7r6/utCMt44uJfL2VIgyNSSoyE1AFkkePpiIK2qu0hfsw7zEbeAgumaHP8ogA/m9bFkV4yiIL/DlyBWtHW/Vlx085Fq74P8Ci7npsmOOiLKjflEF1OxQS/Xxs9jRdUCDBs98IJ4XQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU4PR04MB12010.eurprd04.prod.outlook.com (2603:10a6:10:640::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Fri, 27 Feb
 2026 22:43:40 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.015; Fri, 27 Feb 2026
 22:43:39 +0000
Date: Fri, 27 Feb 2026 17:43:31 -0500
From: Frank Li <Frank.li@nxp.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Robin van der Gracht <robin@protonic.nl>,
	Andy Shevchenko <andy@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: auxdisplay: Use
 unevaluatedProperties to fix common property warning
Message-ID: <aaIeEy3uc7nYBy9k@lizhi-Precision-Tower-5810>
References: <20260227165836.3445577-1-Frank.Li@nxp.com>
 <aaHXZtFWpyW8Pn2l@ashevche-desk.local>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaHXZtFWpyW8Pn2l@ashevche-desk.local>
X-ClientProxiedBy: PH8PR15CA0005.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::12) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU4PR04MB12010:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d3de347-5559-4f7e-1f7b-08de7651a69d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|376014|7416014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	4XfrjqQORWkmLknoBot+8pRFcURXxC8eAGDjRkuOsvk6jiD9ayj6OQH2ZOFEcJ110oRuQXwI8+7wKjiqLdT/YekWRwE1d0uvWPyWyI9MFFhPKfXCcnLc04/XPanZqKyqCTZtrjVVq291B7p8yCdzt4TUhSj513DUu312fQEEfbbbiJeYdPalsWFaQna7iDgC2m6MGyEBwTgLJ7XmKoTh6E2DEJSu9oRVsllMPxdfdDOL6EV/8b8iYlX5JDBG8YMM86wMThrT7P6QP0FNQahT7ESGMve6WfoV5I/XPi9MOIJ5lKGK4OPJO2R2boXDGNj6GKdMRtgPrFDH3zhnzvo7/b/zbhTDUYeDGl+2txBIpqyD4mnKWP/cZpWEyRreBkq417BT/RQPBV93UBh3yWlfOaeyWjHLY7G3XYWB+TWANoDJK6N2gNXRMxkV1IG2L8/G9I6Snbz+YXtuXp+/sqtPM0KurUCWRT+hooWGBME6ZgoaeqvpRYZRBLyllGYDHXaq6PRLTBKgmV9FwrzRb8VB5qm4el4yuPUnOuPffw1MJd8u2HGyUwJMbatRVcBpZbDdLw2jpMldIzqzDvxZtAZZ8WJBCzXZPkvYC6kiKKLI5eA2R5qpwsxMzlrrK0FuWzcRCH5ezEPlLZCWPT5pkD4GkPbkAW3wS9UPLbvVfnJe4Yo6EASk4D7uirW5sds2oPYOIUjp6XpCQ3yP2OcJhpgtDwvOtHByZ/VhtdN1SAT675e9KvD0mGCe+Fp5gHDC7VcO
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(7416014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2hadFCqbqyAlQnEQyRbPGCeohNivQHwPhvmk/cUaxLIMT00bc4y3RgOVyfg1?=
 =?us-ascii?Q?M7y7e4H512YVQVkUjwuq5dfKNvHnK8cXse17eKpDIutTbX4TbYRnfuucEM3N?=
 =?us-ascii?Q?uTxXsa26rRyLxB2EqkpDMX0b26N1po9rqBrCWkZin/FbFWYK8nTNWXVe9TSC?=
 =?us-ascii?Q?1D2eexedjv1XRbw42hoEpHK8JIsGU81b1jXwfMmOb06NVV1PF3NaRm7aNaBP?=
 =?us-ascii?Q?AZRNsfr35bGsgGA6Vp3rifI0+dCPT0Jy5THSYGY3ZKWEeCTYJWxhtDdIXl8l?=
 =?us-ascii?Q?BLBSV36lT7gHSm1tLA5MEojIEGQmJYhGEkqUTIbho7NFQWrESNfYa54hlDUS?=
 =?us-ascii?Q?2TkuVyhFcGqMsHcOC/bzVVCapJzukNnxdLgijuXS4QWG3M6K5BIqNNu6r0Io?=
 =?us-ascii?Q?Py48Z7LzS0eiy81QvVKfDk2Gm8R6iqkLOXoItsRZvZOXNwmZ1QXgGF3i6img?=
 =?us-ascii?Q?P89Sd9Z5nmv1SqEb+Pi6PrHCeHjxxAzjHV/HKRsKxW0GwU7oms5KAKTNItBz?=
 =?us-ascii?Q?sNfYD1njpKUZB/dLP6CgwzAi9oXpxE1FeE0lPV/mYj94wVmdr63G24DHzQ4J?=
 =?us-ascii?Q?vUxbUS7F3KTOOxryeQWXAW7IZCtg5yb3ntbL5AVTWA0JQ8SxfsbE9VIten2E?=
 =?us-ascii?Q?7mt606IYwYx9uP2Qwd/Sebu+vnAvz0g1J5b2ebue8UI5E7bpNfS93iFAHtGG?=
 =?us-ascii?Q?EFp50nHvHFsQ9HiuOh5KAq8gOJhxV3e9LOLOzFMBrdIU+yugpsGyAarXEbKw?=
 =?us-ascii?Q?BYFa1f0uzfCrhqnnpBoUpmp7YM1lWRaOPjwGfZD644x+TQ94cW/M3ObHhrfo?=
 =?us-ascii?Q?XC6W4I4VGazk9I7reCjwlA452JEMdHEbBQe9oEySJ+yieDdR2kj9KL67m9qJ?=
 =?us-ascii?Q?5YdhrrRCzdGWcpbb/XNuvZ3QHJ3qD6umC0Z6nunoUr3J9lStscin5025wQd5?=
 =?us-ascii?Q?HuS0nX0hEfWucyTp1HxDC4eUW2/QwvQ5wuhm3TY9I+EPC/haqnvpQrOHBe5W?=
 =?us-ascii?Q?mmjZvIPJeAiqQDjJcfYrR95ICsGe2YbmaStTGQGXbFbIRgw3jhOTfAvxNK7+?=
 =?us-ascii?Q?1MsnoMql94rlnbKIhF72F1yvuuIdzre9jx8jYOGTxTKVGuVsRWzdj/paBPnd?=
 =?us-ascii?Q?DDERLOP6lfqErn/hN5hk2guJ/Y3IvgNGCiYjaj95jthuhKLJDyTe7MrdEe7t?=
 =?us-ascii?Q?VLtvd72p97j2Bpq3t1kvyFx2LE0Ub0e9uPDk8upjOHHvXTFHmofnzmL6PKK6?=
 =?us-ascii?Q?HwjK0X2/P9/ntjVlxBNHyJr//NlyVOHkSBdCvOQtG7Jh8NTVxEyRGAjOKXSk?=
 =?us-ascii?Q?6xaM9DTQfRPk4djAVICNKpE6ShtWB2+scu3rU3imcj5DLaE/3Nk5iqk+30qD?=
 =?us-ascii?Q?vZ/mjsyZGhOQ5M27t2mP+d/BKLng4beZwiwFVzoytiASOkRb/XTv8j3Gkv88?=
 =?us-ascii?Q?Lv+TQE/vAurZ51g06JFVP9wP0MZ7haCGJXkUNVwZbclggDMpxTmBY2yhbYPM?=
 =?us-ascii?Q?ul+JcI9sKNfnOc+lRdh4PFJUtSuWbNOkP9voy9LLaBdqF6gCHnB4TDUbmN7x?=
 =?us-ascii?Q?xUazT/8LrG2qFM2P/4MTGd5fmlEgfi8ptVd9a6W+lOah9QfNlGMzNDRegI5i?=
 =?us-ascii?Q?IyPBmd5zeTx/I2RESVgU9lox146/HuLYl89wrj+0uLunFvjhhj7iz19MkKjm?=
 =?us-ascii?Q?dERiVSDZ4FHNCmtAhWBGLHr5+suKTVzwr0UJr4cO4X4T86Ng?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d3de347-5559-4f7e-1f7b-08de7651a69d
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 22:43:39.6895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cr9YrPh4qUW/AaiwLQ6dpnBdOkZglGjmILjfXhR4QI3QRlBvgNq4M48fpOKyzGYFJfvDGbNWZyeg91vZzPhwow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12010

On Fri, Feb 27, 2026 at 07:41:58PM +0200, Andy Shevchenko wrote:
> On Fri, Feb 27, 2026 at 11:58:34AM -0500, Frank Li wrote:
> > Change additionalProperties to unevaluatedProperties because it refs to
> > /schemas/input/matrix-keymap.yaml.
> >
> > Fix below CHECK_DTBS warnings:
> > arch/arm/boot/dts/nxp/imx/imx6dl-victgo.dtb: keypad@70 (holtek,ht16k33): 'keypad,num-columns', 'keypad,num-rows' do not match any of the regexes: '^pinctrl-[0-9]+$'
> >         from schema $id: http://devicetree.org/schemas/auxdisplay/holtek,ht16k33.yaml#
> >
> > Fixes: f12b457c6b25c ("dt-bindings: auxdisplay: ht16k33: Convert to json-schema")
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> > Change in v2
> > 	- Add Acked-by: Rob Herring (Arm) <robh@kernel.org>
> > 	- Add fixes tags
> >
> > Resend include Rob's Ack tag:
> > 	Acked-by: Rob Herring (Arm) <robh@kernel.org>
>
> Independently on `b4` and its functionality this is incorrect way to put tags.
> This has to be done in the same way as SoB above, for example.
> I've just explained this already second time.

Sorry mess up during debug something.

Frank
>
> > Rob's Acked at
> > https://lore.kernel.org/imx/175796984570.3379405.7210704746413204244.robh@kernel.org/
>
> No need to resend _this_ this time.
> Thanks!
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
