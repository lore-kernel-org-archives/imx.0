Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013068.outbound.protection.outlook.com [52.101.67.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF8D64A
	for <imx@lists.linux.dev>; Mon, 26 Aug 2024 22:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724709699; cv=fail; b=AZdO1oyDS11/YigxYvmA4d8uxgHMm9QujLenmBKwTr2r1SdfC5nD47jJt/FOuu5z7tqBU4Oc+/hlppQt9kD31EmYtRNHbluQjC5uuSHO1dhQJz2XkmgHwoEd/jiKnkOd4USI2RRXGrS+Z6xU1i8qLFvipUmLGLSgmTVNkubr90U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724709699; c=relaxed/simple;
	bh=aVrDHDKuO2CgF9WU2o/O20muxpq6cbgC8vY3aQS+Haw=;
	h=Date:From:To:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=GMUwJ7OuVwGuuRvA/Og7FHHykf8Vgk6RA+k+94JNkoDggfeep9aco3yMcQwB3+EzIcQCANrijCYWbE+yWMUiT4Cm2az9oYbIbifO3YIpQFYlVAGms6KSPz33XmMtJSsFw/b91+LW0pARjEiRLJegp+NqIwR5zTdAr0TXaE490/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nNyb0Io2; arc=fail smtp.client-ip=52.101.67.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nNyb0Io2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N+k2W8hJu8E9jPDmnrlXBHUk0A9fh/LiMF2tRGrCmKGCF09RAzrCf0eXDsjHwTmBKlXP4IbAeSEAux2EporPnxAzU2gm/B1INTHAO0+w6uvbQq3o1eok5rmQgFdZXFQKfJqNn6B8F4xv3jjXY17MCxbvjFNNktDnidsDxG940eZFJr5nx699/s5l4nYVIQz07KqP6rAC0t09YsEVXcMtAO86FSAZVU0QJmcW2AQZscBz7p88nGTGnH2KfO46dHbBVkZfua3jfzu5Ctyrv+OUNarecMVsndjvNcaq5+AiM+oliConQas4P3WwomhHzV5277LVs2nwa2ObPSRP8FhFQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVrDHDKuO2CgF9WU2o/O20muxpq6cbgC8vY3aQS+Haw=;
 b=GwNaBXLSDkGBcPph9lA3y+2RoBnAYQK70NdR0UOLzpS6P4tCb6r0kd1Z/jzj8SWVICyDpCItgkWQg7Rtw/pAP61cXEEhspt8P9lKOQ7GbHQocTTaSE8TgcTxCXHJtl5fw0Zk5fxqkBKqRh2nanOvAE3+vwipMoGlhrwUOM7X32WH5FIzsQ/+suGWJ1v3KZhs4vW5S2EvRxZpwPx1pBz4M6gcA4DBMTDwwk+i4pnnc+X+bBhzivYgA0ZW+9isoINcB99myA9wo12FKvwvApbEGmvSsuleUPQFCfs7yQK/stCJmPxrfJkQvikl+9TbAmfFRiVh7aTNJUoKOmGX2+rQNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVrDHDKuO2CgF9WU2o/O20muxpq6cbgC8vY3aQS+Haw=;
 b=nNyb0Io2nOoy1xCaJYA0bh5pzMqQ5+nXs/kMh8n5FZtqXhDCr+suK8vSphXEbfCPqEnkasFp83btqYaO0msxW7O89GIpU9sVfSQdlSz079xZbAmoAyR6Y8Q3KQ76r9Uh3QHdiavcHnAE0CZ1G84ZZ44TQuFqTO8roOyop/AmKAZyRUUpgDybxa+avgkq7BmtX/657IZhjgY0IjTzEgCYbS/ZKnCSYUiNmPHhQYMqMdqyuo+dAFEoYe3GnQMYcHyh6hTz0aHrYDGzJUd6pmtH4hMCpnDphYCKRChVoP85Oms/Xkz9HkI7WJxW/u0s9zau4sNPlPf8A2JtJ6U5oI/z7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7882.eurprd04.prod.outlook.com (2603:10a6:10:1e7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Mon, 26 Aug
 2024 22:01:35 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7875.019; Mon, 26 Aug 2024
 22:01:34 +0000
Date: Mon, 26 Aug 2024 18:01:28 -0400
From: Frank Li <Frank.li@nxp.com>
To: gregor.herburger@ew.tq-group.com, alexander.stein@ew.tq-group.com,
	imx@lists.linux.dev
Subject: About fsl-lx2160a-tqmlx2160a
Message-ID: <Zsz7OMOUpiC1vi9l@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: BYAPR07CA0059.namprd07.prod.outlook.com
 (2603:10b6:a03:60::36) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7882:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b464c21-6e3e-45dd-556f-08dcc61aa6b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JhdsDCw8gpl1sDGL1fLwi/370fQXUbS7pFaGjL9boc7SDfmjv3tBH+97I1Ld?=
 =?us-ascii?Q?FbMFk10uk0POD2PuZfRbsuCzWqCQ6TYJpomqPlebOdOg4KaEiNnYC9X23/6K?=
 =?us-ascii?Q?cgBwLbfswWkVL99lHO18A5u5ZJ+cG2zn5pNqIr6z5GF2iL66ISkD4swuknO+?=
 =?us-ascii?Q?GuwuAWVcbrk+EN7b1eQrIzfM2rDRDQp8ftkJ+bamWawFGxG3ItHrF/3K3qv2?=
 =?us-ascii?Q?9gARHrKPevVw8ccth7h6DpgZmOL9DH3kzyLixnXrKhHsY9wNsWG1kWx/03VT?=
 =?us-ascii?Q?EUh+3kOzQil4pGKCSLHqBEVQWhDWCnD4reWvILwjYRja65I+pjxXgJBpbfSU?=
 =?us-ascii?Q?5F5PahkvW1llF34zHglgi3PufZrQS+QO5waUFpZu2ilHce7EvlY3gQgkIc1C?=
 =?us-ascii?Q?kKRBF8Eg07JjMXZL7eiD/L7CRjMPDptS1Zk47LldSrDZepj9eTnPLVW9DRZu?=
 =?us-ascii?Q?YlELOMFjevU6fR5epN6FSdp2uGyTG2CmvsYdBbWnST6GqW6+veqXbAiTzSAm?=
 =?us-ascii?Q?ySgqHuDFZzKjq38PtsgHvcct98Dn2iZ8TZ0buhsZ32tYwuDsDlRiV0RYRfsM?=
 =?us-ascii?Q?iY0nDR9jhoUThf/uvQixSGoRFUmFcTpAYTo7QbB4H1Scnf96TW7jo53UwVH7?=
 =?us-ascii?Q?+BaT3QP2svRKQVf+oUIefWYYly3KmyReUSKok3Tixte+AZmcHNTkaY4Fp+Zp?=
 =?us-ascii?Q?G+HisrAx7c5C8UuPE+cCPPTitoWHYLQXi688xdiV+pgi7SXDNtr3Wr9Q5chi?=
 =?us-ascii?Q?/ON/D9wDAv5uUjqqpuFDSKkrGdnWfJjYt8HZtSsCaVKU5I7nXhthQ175Zgfz?=
 =?us-ascii?Q?FnCvClsX7L1JYMTWb30QsHuL2WizQSe2d5c5YX/kT8UeVrN4OMHzlIdE0Fmg?=
 =?us-ascii?Q?ESdVcKHX47Up0beidoH9EWSFvOV/y4FXlYv7sdbhaPIb76+k68Dn7IAUZyA2?=
 =?us-ascii?Q?/fSWO/1lGo982eZVc4iWC7qjJnOV+PxFoFRD0HoAKGsJFp7YrBVOjWXQEA5J?=
 =?us-ascii?Q?U+V1ZhWBN/dhgbYzE5oZSCkrNOYN0xh4abSm9kJ/5sLUkXfa1R+gTyMmZtBi?=
 =?us-ascii?Q?Ghj7dccnGl0RWPYK7fDlExrlppYyhuaN/MGXC6KnugylP9ztvyP6OKSW7fQM?=
 =?us-ascii?Q?CGxZOQcgTJrdDJVyfeCJyg87GUSmJZZTlnj2bbR4/qyWYSuAMqI7EY2cmGul?=
 =?us-ascii?Q?8wU7siJtOhQ66BmDq3Fnpmhlpf/me+Bipy3hsLIyFpiy++65OQEl2sn1aDve?=
 =?us-ascii?Q?UT4yHe9mxa2lq0VKOve82MqaogrwvEmw+c0EFxIB7pIJ0GyZL1rSgoZyoEXj?=
 =?us-ascii?Q?PfeXsAHIINif7InVQGoft1GUbWRkOGUDI2ZKXMwZvTiH6dy4wvyIV2w54CWx?=
 =?us-ascii?Q?XfPG7xg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q6gIFeb8tuWwnwHXNTtZdsoZL6lCrUnwP2HamJeybBJ1VowwY3TEoEC1E1qy?=
 =?us-ascii?Q?DkjSZJWLVFyktl5wDHnJdgxmpriBJiQzeHbFi6ciQz+Hu8tEi8P7yXeMs+ap?=
 =?us-ascii?Q?P41Eh2zLnwQNJQAyMZ1uRHzCgzIPHV7qOilSpYlSCfS9n4IRTo+66OWKNha/?=
 =?us-ascii?Q?mf9wIRERxNyn49lIS67gEf7xcPsDCtYYKfU5yXviVHnWQcIHAvO7FVu2ce0M?=
 =?us-ascii?Q?wT4o0jOAQtWYHNnATJbMyub3WSxJ5zk1ghAU5WeTyZWVCX6u1ReBQjf/C5C3?=
 =?us-ascii?Q?5Vh+55aLMqdgR+FNxUGnqMy0dlzOT/p8QlzzTsXBksEabqulW5tjoozd7kEe?=
 =?us-ascii?Q?+rFUQYyZv+VwOtCRO3F29a+137qqB7dZWptB7mc9x9OKM9i7AJfzmfpWU6zw?=
 =?us-ascii?Q?zIHT3hEFj/a9tLPMGppKjd6Qq6CPokHFdA8+XPoxA7U0L5Q0TQd2agFYyRfr?=
 =?us-ascii?Q?06yJxfe5WCDGwYe+iXL8/SmL/nU234AuowanmkbWo+o1t1o1Xc1I2Aw5mnEp?=
 =?us-ascii?Q?PwGdMbMubuNEqvEFf2gRI2VloVARrOEn84awGuikGGM32sD/ugD84CRU1IPB?=
 =?us-ascii?Q?E8sflNeaBSBCxnxbh0UpnsGwz8M072v0X1kR8oCIzjvJh5ub/26b9XP5ueje?=
 =?us-ascii?Q?qtvZtuHWXGumSegDjmb4wDeLA1QpAPA94zqsdM3fI5dGK7F1Fq/4nFNFWLZU?=
 =?us-ascii?Q?GR9VRSkyhj1kJ02IwZIxhG77s5oLFblkfgmKXhNf8fu2EX3JCsXIZgLmMB4K?=
 =?us-ascii?Q?ts+gGLigD+Pv2DXhSs1JOTOEAPFNg0S+RJAoO1hR67tMku+qvmfxA9Zo60w6?=
 =?us-ascii?Q?c74TJrRESVArjWABnhk/htxm1LhlMbo5DOMyxsMNwn6esOWd6IHjVyhBYvnx?=
 =?us-ascii?Q?sRE/yEP1MLcKJevOGuG/1tMGteau99j1P6cbPgqmuGVaTrNzdCQPYjwI5P1R?=
 =?us-ascii?Q?4kE10cZyXcjd7OowNUXniN3pnNiJEpDq/qhdH8ftjMw/RI67ZuAQJPee9gh+?=
 =?us-ascii?Q?sDo2sA5pfUO2TA6UtdYtX+ohFgdal/czmrmhIWtgRVnUmlGDQnFaexDIPRe1?=
 =?us-ascii?Q?4ZGgJfu5CUZf7xuHtH9iZXmxIc1WnfaiRvVWHiwhmMKczKV77ekVwvn1Oc/H?=
 =?us-ascii?Q?78vm1IFsrLFcYPqrxy8eCkhTuVrafCs5oQjCi8BmjYjd8xNmLE8ED3IJEYSq?=
 =?us-ascii?Q?im2Wpjt3taOQZWm/uTQYsNwQWbCDRhTMFyp53MzJ+vfPQNps68fL8ngcRPk8?=
 =?us-ascii?Q?VyOZ+5qB+JmgKMygCvviTdUaaBn5FriVLlBArqiDahgk4g3G5i4q1lzkExfm?=
 =?us-ascii?Q?6vqESYCiEIzGHBhIjdCX69PCdpLjqZALoKUvDqvepWadMsrlu4I08A13ykp6?=
 =?us-ascii?Q?ppCf29YgVdPqq2EOmzk9pi12bSi69aNmS+0UejvTF5rju3kuROVpIWKerYs4?=
 =?us-ascii?Q?PuIRJ/gtZ6xsqUkInPiPTopvy+t6aF5C4IAClcs7tRIrT59DEnLp1ZqkdAE8?=
 =?us-ascii?Q?1J4bMDPrkD/+X30XAIC/T8w3WzlHLho1DU3rz/zcav22rLtNufg8zmyGGVvZ?=
 =?us-ascii?Q?Xv5h/Ea/9KooS1t65rLnFSJR0ZQGuliyhIfcuiP7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b464c21-6e3e-45dd-556f-08dcc61aa6b1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 22:01:34.8867
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3W7FOM91Onlrf/1zKcBqEF4uYx3hiEgxgMO1RuPMr7lyElINwLRLU/2bUsQdsOqpozgk1iVbXjI+v3vUgg9F7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7882

In https://lore.kernel.org/imx/20240826-2160r2-v1-2-106340d538d6@nxp.com/#R

I try correct lx2160 pci for Rev2 chip. I saw fsl-lx2160a-tqmlx2160a.dtsi
added at 2023, I supposed you use lx2160 Rev2 chips because Rev1 chip only
was sent out for evaulation at very beginning phase.

Can you help confirm you use rev2 chip?

Frank
