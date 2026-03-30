Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013049.outbound.protection.outlook.com [40.107.159.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E6D2EA731
	for <imx@lists.linux.dev>; Mon, 30 Mar 2026 14:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774881638; cv=fail; b=BOBGqfkfNqYfVQyTpoOHDsXVzcnvqHdcU+HEXytBIlAna/2wEKv6NgYWRCPlc3WRMXTYfCX0Px7tNBkqqsKiNzR3OaqU+shjq6+Qcwl9i8hudNH+icIyE65U5YO6q37xu/RUK0jATSJ+MiwIovV00/Qyu8SaDjVqoISDR259xs4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774881638; c=relaxed/simple;
	bh=JWXKsznQ/dbMLtWha4sleum8O3lni9dmz3+BnNeC6J8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sSOq288xO30Ejo50hGyDhCA8QZcK4Evx8e+xfNtIUCOLoqwm6tuYdIxu/SU8LbsEHRJIM2tuPNDA2Gpn0Yo9Z7+kmqwIT+o6ZqMt1icRbqhrCv1oxUm5x5t4CWPU8O/Z6+QO+olUnTUA321OWSL8LdCqpoIbmXkj9IJNrUSH+XE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=KI4JI/4z; arc=fail smtp.client-ip=40.107.159.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="KI4JI/4z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kxJ8Qe6+Pb/LFKdkeoe9WRWACQpfSQlffw1EZIHJPSmUBqnxhrbUHljoVCwZ2fPfdVEGAmqx8iJ32pPfal4UJvOVk1OfYAFD1ev0jrwkSQnWN/MsfEcuxjtqaZS1EbCL+6QcADnxH0M6Hx916vVbj6Zkx3a1OFS9QFrbeBvOFzj8TMcLOGDNgzsW++lDrpIijXCBBQgMOaWLYB0Y4zhre1okiqn/KbRwqLJg5kjrQpf8LdorP0stAcf04VbXsvJxBg0SUEJlL8+OxLijysYgOOScS6jncO2/2M5UuXdySg4rCKhHwGn5ZHtIqNbkMW+JJyk+yhm+XlegQyhIxtZbUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JWXKsznQ/dbMLtWha4sleum8O3lni9dmz3+BnNeC6J8=;
 b=WGW5OZRsQ4poCF4E7zIkooGCN54bUBCtqZKKQlW+Jz2oxuiTAJ2JD4hFl1w1gD8qvVFtsdaUd++JwgHLmx7EeGvN3FE4Z3i1JoQsuUldBYUQ/Wwe0/Zjieurkq3kENwNwWcTPw1JMUuxE0jtjMDmER6vgDuHMBDSE+R06npeNTa4LEnzoCI/m/lkBMCkGJHVTUeVSRJS/8AWfLt1F8BXJW43NAuF7Lw6sThn7ho88k3unbNnRXHbQFxVO5idfmvGzUHDEP6ubOYpi0WtIK6wGITszlnxg2DU5CQ/jMV01Uy4opavx2YZnjHQPxHyF6tTqQXYZAhuG6wwhDaa1UoSqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JWXKsznQ/dbMLtWha4sleum8O3lni9dmz3+BnNeC6J8=;
 b=KI4JI/4zTshKX5RVlb8mvTGKim/KNQkaiDhKCZvRk39Lv1kgHAXjY5QGvBMVkbWDC6TyMKj1WSXi1Cc/Imai3YhAm/JGrxLiDOoOpZ4XjiGhx5fUVIH6lArZrcj6xlg04oLf/c2RrEYDpzLjHuuyF0VAuHxa6i6wWUhQoS4OJpVxaNFUiEP/7bAnEzelvGAAd4zqWxffVqRRO1GDELW4khW1lrDrWqeTDaNt7+lp0Bc4LpwpPeKiINrsmleigrykxRRZXHwrbxm3wJPByvlnW6oJIqT9rb9WLaB14EuHoAJ+ExSikfwJf4YrUBhz0eF8dtjPmGslYFOOc8SLXhg4dQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU0PR04MB9696.eurprd04.prod.outlook.com (2603:10a6:10:314::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Mon, 30 Mar
 2026 14:40:33 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.027; Mon, 30 Mar 2026
 14:40:33 +0000
Date: Mon, 30 Mar 2026 10:40:26 -0400
From: Frank Li <Frank.li@nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx91-var-dart-sonata: add RGB select
 supply for PCA6408
Message-ID: <acqLWgY1_G7e0qOI@lizhi-Precision-Tower-5810>
References: <20260327163243.17334-1-stefano.r@variscite.com>
 <aca1jdx0DjmmHqFk@lizhi-Precision-Tower-5810>
 <aca7ckVY9ure8Cwe@Lord-Beerus.station>
 <acbPUTPpGIJoqTn3@lizhi-Precision-Tower-5810>
 <acoxJ3KUVHqIR1yQ@Lord-Beerus.station>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acoxJ3KUVHqIR1yQ@Lord-Beerus.station>
X-ClientProxiedBy: SA9PR10CA0019.namprd10.prod.outlook.com
 (2603:10b6:806:a7::24) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU0PR04MB9696:EE_
X-MS-Office365-Filtering-Correlation-Id: 28e06752-14d7-46ba-bef4-08de8e6a4c25
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|7416014|376014|52116014|366016|1800799024|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
 0AC1+aPr8u0SBzy8usY5/bvbOJMm0SUcI2vyEXDhuWhmdRQGpV7wVmCL5Zx5UCQiNJwcuW6N985wGR3nNbp9k5ujcePmNKK0YVjvCKXEQgDSpD1IOpjwMZqXhoF8A3W9wYZMEvaRok7MKnhp9bxZnuJfs9NHQZyoV35VkECRmn8GxURvnHXmRdoZuvEt/QSWDZklup97OfnZuV++rZstCIYcrOIS3jeRXNGZ4HINpqil9oVUusV8FX0sTIAckfxZRpaNAto9dH3JmvAYR2VZ0reJXCsisNru8LOWA9a6KdBYgwfms7bPe09q3n2fxR2wnFBKAY4V7NCVJv9AU5mcT7na1gn0TKE8gbBjsJceCCO/ks58Gsnj8gENdMeon/prI5+MHn/9DB7GnBt4Okj5+Nk97pZ3B4EWAMPpUiBdEKZ0212aZ1/c7vkkcpxY8J82fftUlCy8Ij9NBdIGt/t8XtJusLPyR2tWeWtOxiZWKqPArxSgbJW5ITZk+NZK9J2sUvzswv7I47Ot7ZGUcdHFXZZjP4TtbgcA0aMYvrom7urKS55GK8ubEAjEd+didTOzJi5qqDM98m/bginJG8R1fkjLiSZbzQ8bWco/qjR1DuOfU8T09tVJaFabiAv3XrNaM37C4MAPa2yLwntMkNkRtCZ46SIpBp6m9i3f6tdOnU7fb4Si2IH49do2P9dgfc+XtLet90VHfIyTx+ckKrMxjrdMJ05gDuJfvJ++dtDcUGC17Gg1Qhb+lJEP8oIwf4PfvaK0LrnN/5r7HB4QDf2ijltA+y9FTm7a6LTI9AN1+ao=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?QVJ+/d9d1CZH9BtvfxtdnNBa2TS3K2wm4Pi6kRc+0wOFEk6n+ZbeC1d9NFam?=
 =?us-ascii?Q?trTeqWY6MwFtRmBkHEMmTMPsNY4VtTCYoA9tocm3BK0TRofXzhB+35GGHEFs?=
 =?us-ascii?Q?tiLbXuTBMVqS/Gt7StrcAB6tyH4NuyIWwuyKfPcZoGG1SSHgoeFwQH5qyE0v?=
 =?us-ascii?Q?5jGBPdFiCUHHsaXRPDH4/znz4TYufhZJiNQ3f167FuSA0VaiO7VRJCOQCrSR?=
 =?us-ascii?Q?1i9Vtbqv6pgZrjNtBKLkz2UHGWpF/BvaN/3/EKyIjL2AwEiQeWSBBgDdfM/z?=
 =?us-ascii?Q?GpuT2bu/j9wo6JQY6M3NOQ1N69KHHKcEL9AJvUNYTa2kwBgw1IQuVHZxXZYe?=
 =?us-ascii?Q?bGev1ZVf92zGAZRrhXw7ZuKR6BG7JWOi/ZGeBm6HNo+q6MyQr7uwNl5HofqV?=
 =?us-ascii?Q?U1aqH/uvFbliRLtBcMeVzyFvRX2v88HA56sOEQsnerHe/FHsKGNjDqykWX9N?=
 =?us-ascii?Q?hjdyJCUQJHAkor7KaMNsmWRhf9ka8MdYnf+1ImlNvDG65Uj4PAfd6fNT17Yu?=
 =?us-ascii?Q?uGmYvw4KewYj6/taMALEMtJq6AyjrvCUzddNqb9mgqBb2etx54ZAhcAhQCNs?=
 =?us-ascii?Q?jyFwkNe326lJm5v2UHf+WYOpOrvsPAt3dSIKXBP170ztJaXiSP5AuXMLi7Hf?=
 =?us-ascii?Q?EP4Bnh5LYS40If3N3QZlmdFy9X4FOIg1MXJpAJzSUKybOOsOK4ZCvEtN2/MI?=
 =?us-ascii?Q?X7myxQOzcf0ajzSj91zQoXQymuJ8OKZgAt8e7269O00CvdumS4QC480LwPZc?=
 =?us-ascii?Q?XECbKmmc29yelruTKHMiXu9c3qSo3P0FSs/o5JWNvn3nwU+deq8QKmX/6Zu4?=
 =?us-ascii?Q?R7Ie03zgqko8oa9L69IRvDd0Q1PdodSG2FmhDuiC3bKwRD85LaoO4dr+e2na?=
 =?us-ascii?Q?59dTREXAzQwfkiAe5KtWPisHUnYQ34zpnvb9ROgQU7p6LmOtfoTU5eEsyMTE?=
 =?us-ascii?Q?rCpNgxMXA4+gzPjPYJwE2c9i99ebjzozfTsQvEY5up/5xjyYo1vLLHvaeL7B?=
 =?us-ascii?Q?/0yDzb4K57VBiGu2hzXc/b42TPBDwlepgqxNNBDMAsKzp6cZ9PlQEYJse+p8?=
 =?us-ascii?Q?m8nLD3LEvVc9w6X9I4pgQ9WpGj3zSB63QdabdM1RuBVHGujHN8vwUiZyywu9?=
 =?us-ascii?Q?hYMeKV0otwI+wOOQeXoy9KeCRV66Dfw2C9DOGx/6QkUMTYRMnI659Bgg4llL?=
 =?us-ascii?Q?FDsHh+3zyizz4v4luMuIEA8BndqXuyijR3hmwhKGHdiOUz3VHCPhndjZeYLh?=
 =?us-ascii?Q?V8tjI6ufS/bNDhtKKvIxDW2GnmJBqdhQgGo/eTKFhEeqvsAJ5OEDgc6rLOno?=
 =?us-ascii?Q?UOrIICyqEKY7/hP4/5dZAIgEFpDyz6lkE2oBTtEULHmP0+VmWqjRaQGt/krZ?=
 =?us-ascii?Q?FmD2FEbxjabA8QgspgGXOkUvARxQgKCza1YojXGB5qQg7KSkFp0umf0iBVVc?=
 =?us-ascii?Q?24BNMeyCUetDKHQWUBugR6Ezzt3y2Hj42ohdYq0BtpIteaz6cPZwc/4KsFfV?=
 =?us-ascii?Q?CXCqV464yWkISMyieUsAV8Zk1X6RNcW1Iym0ZukJUUfYgiQ0HTyXrL9NxZPN?=
 =?us-ascii?Q?9sTSTv5H7Yvl/J3eoTVTP9k1QUvykJZyV07x5zKgIIxvpF6Y3fYi1lQpsiC/?=
 =?us-ascii?Q?xbjwEVfNnCgVERQMekNKX69YDyqtk58lk9H+cQTXs1Sf2YnfM90FxXsnTcX/?=
 =?us-ascii?Q?6jhtz1qX0+Q/EZWWbFTfLB66aZAkj6+WG5Yjnq580WOybf+hzIKdS+zxmAMx?=
 =?us-ascii?Q?nYn4tC/b4g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28e06752-14d7-46ba-bef4-08de8e6a4c25
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 14:40:33.1367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: omuy8YWKbYIAePau2TjZIO/WAQwjtBdrKj3FzvTV8qOLR7pCSmUDwOPGfhbICYuzbs37rpZV00f/IHTNvlnWng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9696

On Mon, Mar 30, 2026 at 10:15:35AM +0200, Stefano Radaelli wrote:
> Hi Frank,
>
> On Fri, Mar 27, 2026 at 02:41:21PM -0400, Frank Li wrote:
> >
> > Accroding to signal name, it is MUX chip select signal. Of couse it may
> > connect to a buffer's EN pin. I have not checked your schematic.
> >
> > If it connect to MUX chip or some select signal, it should use above method,
> > even though it is permanently asserted when access PCA6408.
> >
> > If it connect to EN pin of buffer, regualtor should be good.
> >
>
> Yes, it is exactly the second case!
> It's just an EN pin, that enables a buffer to route RGB signals used on
> the DART-MX91 som only.
> That's why I think regulator is the right way for this case.

Okay, it'd better to emphrase it in commit message because _SEL is miss
leasing.

Frank
>
> Best Regards,
> Stefano
