Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011041.outbound.protection.outlook.com [40.107.130.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7562929D29C
	for <imx@lists.linux.dev>; Mon,  5 Jan 2026 19:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767643010; cv=fail; b=PSgjENUM3aLy200d+pGlb3GIkq9KwqUinlP6nDhP/b1rQJg6qdz86NYKDa1CwYypVT1hOyjEEF4lTnxAouos0Nevm9tGwI7FA4OCgC21rwI2hxDsUDn+1mNd6I5jC+tkgQQt1H7uOZrj4geTDyyGyhVwwNgWZZh3uYnnrHXkgBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767643010; c=relaxed/simple;
	bh=aqjFLucvQDlar/gS0snLe2iCszdPt29QCxbJtYSRAJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VryqiB/ToW+qiQHoX/YxJpn3os82OF9wsjWa5quSo3baQEw4gq4IFOGRWlepCGMrcnefkMHvG0/5nC/CnWNd4MyzDNZjINRqsS37vfYkswQ6G9rJpBwqwTfTn4N8UHnXfkNQUfr91307u7Fui2bQhvkEJQdMbiejFjsT3z0M17A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=fHZDeoBS; arc=fail smtp.client-ip=40.107.130.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="fHZDeoBS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ghc0i9ZbnXthXGv5ehhbMARplyIXWKaEAm9zCIyi17hNribHD/o8/3n7xc0ElYYULbWblgVF0Ahgao4hTEse4xu+nWs2TvFdFhP5q6PpKoKNIM4c2sJiHluDUAsbEyM4L4rHC2DphQG1A33M4RxtmrEZLA9Ei3AZA3vrr3+2LN343NNS7UCm4G+pIlvUvoM6wCCulnrXDJQzG2FKkbwtu6ePVVveLmIcwlHChysiyS5uIx7lLsZaDfDRrPyYWhYTYveBBRt/R1nLasKaSt7kMdy5ykZF8tdjM7ZY4PI0ElUg1lkxp0cfKXvYaGhGZtrgvZldMAW21l5VqZP029kAvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SsMWRGysGmlJeqqidXmOpRIwPjT5+nAivgMIxnsw5FA=;
 b=TG+RLMGHGLMzH2OO8Tc8l4sXwnT5dw7S1GO17Wbi5MIktILHtuUjZ1xFoDzZ5V1HR3vIrRc3HTuikiB4i2cCPzOozY7uXzsBenkbsTI5cb/Bg+0+1nvF9lLgVv2USCDcuvMNTkqLNJdPg4wsXaYlhfxl41dBvnhFEaYmWe8C+FyaAxrv30749QnNjQJdU6vfJgw9gjXo5mQsEuEDpaTiYURG+txExgFrmvr4zkPCYdGPM1U146X7OIOwW14/6eMTyAaKrPYV5Huh0FQpUMXVoPS8PH6z362HKho+rxKPXKcb9SY1UHQ79Kjb8gGPq0Q9ri44z3XxoozsKKotwvyraA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SsMWRGysGmlJeqqidXmOpRIwPjT5+nAivgMIxnsw5FA=;
 b=fHZDeoBSZmUH/pSOux3nKzwvlkPHgXowzSHuSxmKart5rtNwBhmH7rWxTg0mdFBZ+7vcoxhCd7aXS9PX/KybgeNLvRYXtRXICr3y2wUD1fhYkVZl5gaBzWjm/n+xy6bk7Rjtwg6ea9q7N8SYOPlDnwM+CyX3u+5O4wKmJkj9+kgNbOANiCu79CDvZ3HrK90DMTJ7HjKOfKcLBdE1MP6v+EMYOQvBmbOWoqu1xawy6L6HalYXDZeDgUEyOfLXfY9Sc5bipkzvrjn8oSdo6PH0WAOCg8EoHhYEhkXdWSbG9nREcpUAWRaCvOVEcfxzIFzcFugcAcWGfItC4VWIcTsMYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PAXPR04MB8607.eurprd04.prod.outlook.com (2603:10a6:102:21a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 19:56:45 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 19:56:45 +0000
Date: Mon, 5 Jan 2026 14:56:37 -0500
From: Frank Li <Frank.li@nxp.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] ARM: dts: imx: cleanup most gpmi related CHECK_DTB
 warning
Message-ID: <aVwXdU3yEqkFBIHh@lizhi-Precision-Tower-5810>
References: <20251104-gpmi_dts-v1-0-886865393d0f@nxp.com>
 <aQqxXuOei/wtOBar@shlinux89>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQqxXuOei/wtOBar@shlinux89>
X-ClientProxiedBy: SJ0PR05CA0143.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::28) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PAXPR04MB8607:EE_
X-MS-Office365-Filtering-Correlation-Id: 11a58bc1-3f7b-4ac4-108c-08de4c948dfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|366016|376014|19092799006|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?908LfdF8jcSIkwbVmvcE9ReeTJBZFh3dfWSssSKJdsZwtD79OEYkxdQc9XRo?=
 =?us-ascii?Q?M3Hx270vbOciNwgy/6MhPe6HtHVXwjA53ifM0hz3BF8fABPb0b1Cubc1xxu7?=
 =?us-ascii?Q?KlLUxL0Y42lURC2IVaW5kKw15vXK4GJ4ZFPh6qB71CgodQ0G8oemLO5k8Ni6?=
 =?us-ascii?Q?75um12CS1TC9F8qRJYvRAUywxTMlPQ+fhHwoUQ99UBchTG6/aTVr0nb0qW2a?=
 =?us-ascii?Q?jGQL0ntMzIvD4v5huMdpT51GsmlNr+a70ulfD2lQ3q2mVbA/6LpBUILFu58g?=
 =?us-ascii?Q?FfsCuhuPuxXcb/zJAkNNhCfiBESuDJZ1XYAKDzNFDeSYTBc8NC6O4j/wQnyg?=
 =?us-ascii?Q?vaP7IBYYIOGrYMjLKSR0x7HinZQLFp3ycE2bR6v7iUn82pfUFOGGnZimCRV8?=
 =?us-ascii?Q?8qp8bSiT/ssYZ10+jyg3Ea3LizLYkvr6qv7sbdSeiBNjy6TpRtO19ifSe1LS?=
 =?us-ascii?Q?P2MVYYrNXmU+kIqbBx0EFlswzf3b4fs2Af9PQ+08RD9fLye+eXoQTlJU6xQc?=
 =?us-ascii?Q?I1j73MFicFGfIyHOUAXL9+p+etCdp+8UUlHonMQILs+Y9p21NklcoPa/774w?=
 =?us-ascii?Q?FYv2SgK3fsDfx/GDOs1N+HjOk8sv5S0J2CpTuMV+PqA7nYq4/71+v/GzEpAV?=
 =?us-ascii?Q?7ideDGYfwa1jwoulRdlrwhkzNSTeTLTXOTzTL59aWTXsxcjh8fpnI+K/bJ5+?=
 =?us-ascii?Q?WwpyTtL8u20p4z+0ZN+AmyqrJO62DO6cBpAhAm8rXCcRpYKSeTw2uPxfeeNG?=
 =?us-ascii?Q?4zfwL9PCmR5r+4/e/Cqzo+fLq+e44nHRQAHBwh/AugEHsS3Xb+rhV/7cN0wg?=
 =?us-ascii?Q?RFcKD4Veo175WOpeZuBo1WNsGCRQdsw37969Bosv9jkT10gLgUtb1iZJ/qlX?=
 =?us-ascii?Q?PoF5UK7Jwiu8ykAgADjy+mjPEcQ7VTVXzrX6efVAFlZx8wtib57vt1EbhZaf?=
 =?us-ascii?Q?ypDAXvlHUee/VsMcLABYewBO/yp0D5k0D6nMVtgXSigJILXR3C3eKTcxZGqt?=
 =?us-ascii?Q?yetGp2kGvgXArmSbOLaWru0JilUj6/pRVLuCpwVthACB1mhqQm0Q/qPYcVWQ?=
 =?us-ascii?Q?EIWhjWuK0eJJks2PVZvgU/FrzLCqB2hgYVcTWgbUvYbQmwC+hjoXBEHoCpK0?=
 =?us-ascii?Q?bWdTuPZxpGRBPGNIua5OCS1AfFVvqOzpiG79BejvUnoU1bocBQxJIxhGHvii?=
 =?us-ascii?Q?teTp6UnxgNvROr12IPrGIktAqzuVrzPiJJiCSrgH0C47L3P4eaNNskis/FOy?=
 =?us-ascii?Q?sgGSvJzCxAtQET7RhQV1qjSEmKKiA1rofgV4aoKq8vBaC2k5LInz50v4STIi?=
 =?us-ascii?Q?oE6awNJleRaRDrvZX7j/T4l3hGS1I8DJh+pje/yQYocQBfkOTtzmfauDz8Gc?=
 =?us-ascii?Q?XU4qaTtYrS6jaWx6Sn6P8emKHNqI5TmtALe3qi8eSxVx81F5B2Q1myweNOA9?=
 =?us-ascii?Q?VwOkb6ZQPMkHXbIIuIe3jH5zMJIqwe1oM8WZwO1cnc2QxKex659N4uLTU8pY?=
 =?us-ascii?Q?BhsfMC3uX6dBoYFHw01Usxn27ZasnTXY++FO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(19092799006)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fZbBzPiVmZjcNwEaGt1DnYLR5YqeT8u2iQNtOvuVIrjpcpUBX33c9F7o/VoB?=
 =?us-ascii?Q?uGCUqgQJZZL9c3bTFyWWqEXkVN4TsBuO1OftjpWHXy3C+ElLHN7PfQ3kvV4h?=
 =?us-ascii?Q?ymOQ2ANPPiGNgQK69OGDZALklloZ5B2QqCiWnWt/jzEOM1BR2gXyHVjoYe3P?=
 =?us-ascii?Q?Xr3dsJtSL7iM4qPOFqb66Rms3pcAUQ5TPmkinX7CNP9A9rFxjj2VnXtoPeth?=
 =?us-ascii?Q?ePe/NVkgsfU/6CFFnzjSJHi4PPI5qp1yXPidWvoY7H6IM18aaK/1R6qlujMs?=
 =?us-ascii?Q?gOO6e+00xIIkEi3tDz0Rw9IYtvMWTnquMQbLL6MaJuk0sqL06D33kHxrs8cG?=
 =?us-ascii?Q?DZKirMAT/2Sp/B0o/pqoEJDnek5ph7+HsN5ZUtXj2mitVLsZvDKKNM1dzQEd?=
 =?us-ascii?Q?XexHcmxpet4JiClOC/J3B5PbgRG/LubnAFC3VQGCGIVEXazELBSaZIgiTR9s?=
 =?us-ascii?Q?4nwaV2K/1uK1Rb5HgyG7583/9xjO5E92NpjKTKkL9Z/Q0HEaUomdBCGGTVu3?=
 =?us-ascii?Q?0UW7HrnZa+1gIOgg+W4MXumXHc/rBHCVd0UD3ZsdFe3mbIAu+EHBslgfx/LW?=
 =?us-ascii?Q?iJodOv0RSqyRzLxVvorTDwyInrr6eyvhFOSBoqlrZALzU67CYHxXERJBUpH8?=
 =?us-ascii?Q?RFAvhrsL6JqYf1ZM/e0n1jBOwO0nnWp7SlqCcQ5Qgi9sjmz217dEknzycNxT?=
 =?us-ascii?Q?bwCkjeshquwCZkUsinGfjczfKwUz0DQfB9ej4d/FhgvDB2W7jsrG1DM7Pefw?=
 =?us-ascii?Q?oFUAQj5+8oa+UKYzaghi9NypY95zj0j6JvA1vpTYvxLLqwKQeKlr4pRSqTcd?=
 =?us-ascii?Q?DjOeU82t2ajgAalDTpHxEDN4rOazQ9fXrBFfhmzJeqtVk6l1H5y8UqUnvCST?=
 =?us-ascii?Q?aJZLxkDGZxXRXO1PgwvWGL9k8womWJzgoUvPuqshTFkYjciH9HGIPAJ1AZLW?=
 =?us-ascii?Q?cq8wVsZosz91vmjEvLKm7JIUxWm/voyQlb0mgRm3fAwyWUSRfRdiTPcal/tt?=
 =?us-ascii?Q?Cq27aMaXSm/5y4etdKgONXKBs0NHdf0pErhPuyMPA7x1ea6MBdSJC3Mwt/KM?=
 =?us-ascii?Q?9l2/VNmaBJxd2cgLmcgkdqGezOkY/cKtL+fuBHFgxl/iOE2Ab4oRMNsvHkJw?=
 =?us-ascii?Q?+y5BHD21Avw8NcDyAGhSLdznS3fCwW4OOKAu5MzYwT/RhdHvhBaqAys0JVFi?=
 =?us-ascii?Q?sNu8DM/n9C8+bEc7GyT1FwnEJSBPvt3UXwMJRqB1kyDHTOnr2FfkHXeo+BI7?=
 =?us-ascii?Q?SkWOGa5MVPiSDZ3qUsunosxBbPWBAhXbtkr2f2tECg8Yu3/VSnq/eEl696yG?=
 =?us-ascii?Q?MU/ZhZs6NAQ8QzpTKsh28tk7dawNJxiXTOnEwSZxv1E4NsXp/rDZBZrKSGAT?=
 =?us-ascii?Q?jDh3kuq7sLzoYsLG631pcRAsKxl4fnyz+TQOQpG4edXGloMOPiU1X0FCyvjY?=
 =?us-ascii?Q?EeTyyomfW+0j31mWGwz/QU+BRKxJCMmjkkWuhw0+XtOPr3WKuvIJ9OV8xtTa?=
 =?us-ascii?Q?EqMiUeIPiFmzZuNS7uxax/iOb8CtHyQrQTkVl8eF1ccgsqzqz7oHL34DFVwg?=
 =?us-ascii?Q?t2JpWAuE1jF8uVigBA5taLBpKVqEv218VJCAmAj+++gPK4+uJcpELpR0ZnaP?=
 =?us-ascii?Q?T163xDCza/69heOT5xlqXvyeY7s1ObPWw/0sLQwPvY7NN3OpzfYIQA5doLLT?=
 =?us-ascii?Q?eDiy1kxjwqeikDboJ3AjAqSIjpUvLczthdJ/cQWpbo2beC62?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a58bc1-3f7b-4ac4-108c-08de4c948dfa
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 19:56:45.5013
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cfLDJXjolu9d1A5gCxw5CdGex6ce6obtx+GzST8CcaX3Rfa0vHMLD9St8nq3jZj8ymp5N4sGZTrcr53Dtds4Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8607

On Wed, Nov 05, 2025 at 10:07:26AM +0800, Peng Fan wrote:
> On Tue, Nov 04, 2025 at 05:27:11PM -0500, Frank Li wrote:
> >Only few warning left because original data is wrong
> >arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): nand@0:nand-ecc-step-size: 0 is less than the minimum of 1
> >
> >driver will leave default value when these value is 0, but binding require
> >start from 1.
> >
> >Since 2019 year, commit
> >        (212e496935929 dt-bindings: mtd: Add YAML schemas for the generic NAND options)
> >        NAND related property is preferred located under nand@<n> even though only
> >        one NAND chip supported.
> >
> >NAND related property should be located under nand@0. This format already
> >support quite long time, so it should be safe to switch to modern format.
> >
> >Signed-off-by: Frank Li <Frank.Li@nxp.com>
> >---
> >Frank Li (3):
> >      ARM: dts: imx6qdl: add '#address-cells' and '#size-cells' for gpmi-nand
> >      ARM: dts: imx6sx: update gpmi #size-cells to 0
> >      ARM: dts: imx: move nand related property under nand@0
> >
>

Shawn:
	Do you have chance to check this?

Frank

> Reviewed-by: Peng Fan <peng.fan@nxp.com>
