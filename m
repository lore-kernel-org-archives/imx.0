Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012012.outbound.protection.outlook.com [52.101.66.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677A23101A7
	for <imx@lists.linux.dev>; Fri,  8 May 2026 20:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778271603; cv=fail; b=UhtLQ7Clk6w7V+zgjfNcXgpel7+d60/8xn9qV/uQ+reBgk7sLGXYZV5yZaz4mZaqKx4s47vYRjvVXjJMg7k/eHr9A+cIVUc6lYKnu/BE2n66a/mmJLvneOECr6/L9vFZ9E/5Zp2eeu6gUeFuCmt9jMvfFFNaRz6FMC38yj5+4kM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778271603; c=relaxed/simple;
	bh=A6Q85klPLZtWkuJd2y7objv5loORFV9inf8tSX9nzlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AColLwTBI16iML5fJbZQ9MrjVdq+RrYZv07besglo1+OnOjTF4XjGxAyzehD7VWal5LAdn13ALx5uI5AXOULFOAwKhfZymdLSMwDSv58IBMQHiDn+RoKPIjS4Q3I34kai8Xukpq0ilKKB9wnE1grrKb1AmBBcelDr7959X58AnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=b0iapbGd; arc=fail smtp.client-ip=52.101.66.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="b0iapbGd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UGRYx4qMYFJlWpH22NMLcPbAYnnaRPFurfnAqsBC/jNsPZ/fg51T0a+ktDB22oirGnDgLlM4CIf0R3IhtUxLwOS8sIG/a1v203MrYDrza+qTKa3vNQfDYhXu0meUx5QY7pt31m3fBYPgQK6opK0W0sivlxpp/pZlVIyLKbh91E2tMvHxDHhCSl3rh3rn/6b4X9NiIMx6Od77GgfKDaZHIsPRwDEOlf+8YnCmPagnuPpoU0aU0oc53IBSH6RR44Ljva7vKcxiwsDRp8k8wmV+td66cd+CRk/Y/dTDUkNg86uKgKd4tZTR3QrlV9K+A7AxRHP2raL+KjjmSc7C4msI/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q0SuYrnkVeN/JvsPlQGsw5bC/lQUDwNwYyuISA5/3MY=;
 b=CtD7c0ZoujqyCGmFsQyJhIbJsyprr1ot12XKkyeyuG6+GIcrUQH+raCGe2Qd/mJiKMwWwxBeEjN4DjER+JGfMpv0c/IPHkZlTgLCmr9zXulldir8cXgRDPevo+3EBv0enzgQa9QPXZGZlTWPinvhzBsh1DlI6S+Wl9BwATNY6tbc69qiSbqxZTQbIVjijdjaNDH1IVIVKwG9VY3DD1U9hbudp2N93q+DFPEyDgWQwS57JjiEy2K6LFSa+m7dufuCxPr3kimrA1MXfNNqt0bkILjd1BCfctxbL+P0o3cjcmGB1UNfeTM//fIW+Q1nPr6SA3qz+JS7JGu+SBU9mILlWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q0SuYrnkVeN/JvsPlQGsw5bC/lQUDwNwYyuISA5/3MY=;
 b=b0iapbGdo/WUNROsUn7C7Phir7BKSSC1QmbDr8FdL/Cpsrdqb9W20pUNw5gcLShSc4TZWfPpUcaK0KfQbzPaQNW1sdr5j4dx4p8PMK2i3HCHKbIghzswEwC3kXQ8A/qvkjGcJUzENBj5UEhkkuNamVgS2W2z7BtPUFTppnLrrR7BpqtzWf0sagfSlN6F1sSMOq5853THphTGL0NeqIUO/SQScmxvDwhje5BVr1ItWMljs0WwDb6ihIj/ckQ2+6Pz3yRCqF9oTlfBLyQ54fg/CzDpbPA+Gg8Zv96X0yEx6VlWC3Pck8JObcTlV2CGL4UheQLzqnmsjddPuPEIhcg1Lw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS1PR04MB9559.eurprd04.prod.outlook.com (2603:10a6:20b:483::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 20:19:58 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%3]) with mapi id 15.20.9891.019; Fri, 8 May 2026
 20:19:58 +0000
Date: Fri, 8 May 2026 16:19:52 -0400
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: imx8mp: Add DT overlays for DH i.MX8M
 Plus DHCOM SoM and boards
Message-ID: <af5FaAfB-xxNfKDw@lizhi-Precision-Tower-5810>
References: <20260326044411.222907-1-marex@nabladev.com>
 <65e27834-03b8-41a6-a418-126959bb64da@nabladev.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65e27834-03b8-41a6-a418-126959bb64da@nabladev.com>
X-ClientProxiedBy: SA1P222CA0075.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::22) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS1PR04MB9559:EE_
X-MS-Office365-Filtering-Correlation-Id: 398365f6-7b3a-4ac5-01e3-08dead3f2cf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|18002099003|38350700014|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	1x5wCkK4xoS7ndudZVUxdyUTORNflOaZSJyPsQwwZmBliZA51mU4iWW8W0eH7Gwf9lLXnJ8p0VpSVv4/6aZPmHM5QQhw7XyZhgoY5raSbJjgLX2HlLdRBLFpTO/4H7fRx4VpWweBku29wwHl059LgBY8kJ8wDISzjUeCQclnvpz6U/NMNkCk3zfXkvlVKX4UfqrkzP+RnjwJ7p8EaHGQVQo1AlstACDwfc5O7dR1iFGCjDl9IdkbKbY6fDjWrpps0FSB/oK+eEqqpkcFf9MPQ4OZ8+Ba6jNX+E0Leq3oi6dFrXY085YC9t0Ij2btFMlF7R3zORpm3swUz9DAf2oz/8mVG0/klpfkT+kJJUF3EArDVct6WDhsoO0vK/bo69quSpNfvgoOdQUnQDVVzc2lxC9EvpMUAhrx4dDefAimEGJQFtIpwPL2XUib7dpX40E1QsWMPxT3NhMZGzaiiMGGhjEGMB/KZ2CNwrQ5RPIEhCJMaW3xRRjrN7gG5nAW61SPVzxMxFtzMwyPWS+idngFu68PE1Ij2vQweUTJwajVCKB5zqrpumre/BlHIOiRDZddvCwjH5fHlQHe5+tSyPVBHyO9bEyJbD/VyRCS5Kl0CAKJrhNxtXehpHzBmKH006iRIU96P/cdOAUT9qiBAP336p5Jhh7C3RJYbKfWYf+I4eh1n7dt4TaLY44p3aaRGthxEyuCQ4GE6kMMtgiOXPKfLHUZDzsiUyTDgEuEjDPaJODOk5kPxd8AqIET1qfJzZuX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(18002099003)(38350700014)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dmP0lTlRVb5qByeWrDPypnVSZspGk7d+YNxRTXnB5k8fXPZ3OQYfvfHoAfN/?=
 =?us-ascii?Q?1p3ouRtyBT+EIah9MaCwA8mSZV4+c8+yB23WODBx8XESxXmz63UNupYotg2z?=
 =?us-ascii?Q?ICpu3zQ8tO+fRIFCytcGqOOZ8y/5gNojQjog98xSamSB+aFnlwPC9gx4VpOF?=
 =?us-ascii?Q?sSs9qbnSyVrNREdii+LNOT9CLdDAQQ/kTxwUUKPFyswUmgMFYm6y+7LH93iw?=
 =?us-ascii?Q?OEHU55eMQwpaL7xOqrJ3ANumQH9ZFHeMVnMSOIUIkHqUU7Zg/L6XfhCHRNOk?=
 =?us-ascii?Q?bNdHoNXVBchkYPgSTmKoiKIIn9POHatJ89BvesnMoTWmjHE3mYCZ+/sOdn1r?=
 =?us-ascii?Q?wqgrkX/4xXw979jdMoHUvQ4yhAA2fiq3QG0JFI84RId5zeQRFWiM7C5q+AmN?=
 =?us-ascii?Q?2Yyq47qiqticuSc3s0Io3hveSI+M7cyu0is8l8fiGR1y56BZUBAi+G2XlUZS?=
 =?us-ascii?Q?U+rAXuXCnjUDbSUypP+lAQm28MyLi1J7pH3wyLkmOtj4wZb/VwGqgQi2Noa9?=
 =?us-ascii?Q?EogbIN9sL1N+j6kRFdjQVkpI6Rw59Hsuyha2LHb96hlMYHg++mmZvPmguz2y?=
 =?us-ascii?Q?afWIakmHssyd2gPEX+3hjdKbzyMp1sFd5WfnMdgEFLYV7VNrjPIqN40GngoG?=
 =?us-ascii?Q?ioGKAx7WUh56Y8wkqBGIUD+P6OKcVJZXSwBmrOY55+t6j73sYI5Kyo8kSwXW?=
 =?us-ascii?Q?Ttpxqktqzl7GxJv9HVbrz9DPz5Z2FLn8RHQi46gkG0ebssx/Pimfna0qW7R1?=
 =?us-ascii?Q?oq1vYEK06FQaE+s1Egq8PvP5z6k5i5DU/CIBEcQu88MaPfFS4TNaEzzV0c7x?=
 =?us-ascii?Q?NP3wtqBhYpeqR8zkmW0QpbUxLIYb+3rL0aUu7oX3ieeF16WPIEK3qfweX/yT?=
 =?us-ascii?Q?MspSLUYCXmyVI+o1i37qeJzR02LNFAVKPUFUQDo2d1vKGthxsIBBhLdXttH3?=
 =?us-ascii?Q?HHo78emMftHy6ttKio3+OgbJSZ0rR1J2KHv/tv+1WUBlyc4FSOGNtpzYG7Ue?=
 =?us-ascii?Q?nk88j81tYpKaz8Sy0xr2K+FQUWazIGwFUqDUxQrcGWDM89NGEoPIQQDnx+ET?=
 =?us-ascii?Q?DwFjSOKEEs181W8dXACqItptvxmESBh62JtUVEs3blcvTTM6O4xa0Kau3izf?=
 =?us-ascii?Q?+b+JGoTwAROXIKMB3MzYx7CbrQnax7QeGidOw9jbSP+hv+8XBE2u0rNXym/o?=
 =?us-ascii?Q?T3jalZ/SoaImzozL9lMQBSTd4in2Yj/Ksfp6l/Y9RmMfY2ykEexKv/1gi7Yz?=
 =?us-ascii?Q?5I7Jfw7BypQKYIEmjnmhLr9Gtzdg2Ss5xnS9BloJOXpvTMdm8Ucspu8fpK7p?=
 =?us-ascii?Q?YG0LRhxF/cHgoKlxj/LbfkJ6CgglyAYXxNCHawA9BTiGMvLIKwi+e8s3rY6B?=
 =?us-ascii?Q?Ddj75Wz9DSlR89kxT72vVeJ5UjzHHkSXSuEFm+w4zH7GauZ5wzLV/6nHLa/m?=
 =?us-ascii?Q?KxmIkhIXxAw6jSNTw2gpElNmeimVnuuFM3MzgO8xQubgBoaLBj7plJ6pBuU0?=
 =?us-ascii?Q?aLxN8WeyHJTOR8drEDNsFGlCQ1TI7gayAAO1eiQ2rFr2BTz0bPfXCNuxQpmb?=
 =?us-ascii?Q?dUjKz2xr5aoNBWRPgOWjVdYt8EfiqPq/3biwF9gAQtoBkbdzoIgGfZ09i1RG?=
 =?us-ascii?Q?YZ/mc3NG3Z/f6A6JyavWk91k0mTXIHFg2xz9NueqNMhqU4LAMnSxtErrL4Jy?=
 =?us-ascii?Q?9K/CGFgSaNoqtYQSqMBKp6HAVUsZbRx2amLJhOmuBrVNxjpj90Wkw3Qw+iiq?=
 =?us-ascii?Q?merEGzfnKw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 398365f6-7b3a-4ac5-01e3-08dead3f2cf3
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 20:19:58.3607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SE3c9bqdGJ2bSwDW7ciGiTl60TocnzAgBdZM0FII2K3vV/2s98esdD4Mar0CL11+7itPq8RTTXzatt7kWtXpug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9559

On Fri, May 08, 2026 at 06:11:23PM +0200, Marek Vasut wrote:
> On 3/26/26 5:43 AM, Marek Vasut wrote:
> > Add DT overlays to support DH i.MX8M Plus DHCOM SoM variants and carrier
> > board expansion modules. The following DT overlays are implemented:
> > - SoM:
> >    - DH 660-x00 SoM with 1xRMII PHY
> >    - DH 660-x00 SoM with 2xRMII PHY
> > - PDK2:
> >    - DH 505-200 Display board in edge connector X12 via direct LVDS
> >    - DH 531-100 SPI/I2C board in header X21
> >    - DH 531-200 SPI/I2C board in header X22
> >    - DH 560-200 Display board in edge connector X12
> > - PDK3:
> >    - DH 505-200 Display board in edge connector X36 via direct LVDS
> >    - DH 531-100 SPI/I2C board in header X40
> >    - DH 531-200 SPI/I2C board in header X41
> >    - DH 560-300 Display board in edge connector X36
> >    - EA muRata 2AE M.2 A/E-Key card in connector X20
> >    - NXP SPF-29853-C1 MINISASTOCSI with OV5640 sensor in connector X31
> >    - NXP SPF-29853-C1 MINISASTOCSI with OV5640 sensor in connector X29
> > - PicoITX:
> >    - DH 626-100 Display board in edge connector X2
> Hello Frank,
>
> how can we proceed with this patch ?
>
> I hope all the feedback has been addressed ?

It is similar case of dtso for adaptor, which more complex because there
two similar slot x21 and x22.

let us wait for a little bit while.

Frank
