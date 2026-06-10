Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013008.outbound.protection.outlook.com [40.107.159.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38240413612
	for <imx@lists.linux.dev>; Wed, 10 Jun 2026 15:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106013; cv=fail; b=GplByolW7iStTm+mKBbb8X99TlKcnHPm9HFu3yhAeYjQCsY6/h+ynnxThmQYq76Phh5vQuAsimsoXfS5lzvM8kt+sCtVrp1ajNIlUFn0u56ELETaPSu9tb8O7UEqJqm1qiUNTu9IM585dP3AnhZ8OndWbvasJrPW60/FBMtLpkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106013; c=relaxed/simple;
	bh=5PYgh45jt0jK2cVNOvj3h67EdtjbsxWd2LQYD0wXlzc=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=AEJzwYoYBPPrIXM7uD2ulmkgz5GX3I9UVuUqPWv68zs95KGCGafHzBhv1Tkghg9hYaA72xfRQhbKzNHwB5PyUXRO1Ismkod4upeoh1seRehIqfIy7WQsht/yScJM8aWED5hCyfybg2fAgJce0DwYKSEL+4dMhjkEwGuj1wtNjK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NyethTdT; arc=fail smtp.client-ip=40.107.159.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NyethTdT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKU8ro+ttZ2qWnj94yPEz1GclpIxVqsvH+TQKHOAC935rax70W3wsfgE7xLI07qJavifIXONdtEdjV8ODjdhFFPYVcWl/nRFrSPTv1Ey9Xv94MfRB14kn5Gh93LLi0fvuhdRgy0pf8kjUcum6OEuzZb5QX5/TQkFtQvhaR0rPi6TR1K10st8QmvhVGib2bLUdQwdnkrKVuG1kGCx+RJ7jHS9ngln3V2bHYxElo6bTxWj0E55PHe8//WkHb9cP9QKp2g8CiljPWaupLxCXmUtBi7PycklajadRfy/sm3MNkHo2M9SzHoxajoRqBpbpJyndVs5Co8GBIbUZ4pJatMxtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x6pIY1veyqKT2UbbF3agroG5DuxaisRiyeZTX4Howvk=;
 b=fkQUcS5X+GgmMhBlcD2Jbl4O7aV78hjoQieBdJKF8lqmvqXeuZuI32E9e+qpkAqZ1W1LTg1pS0wKcWigYa8UWZpscX761DhenPLFFuj+NmDSRtmYa1JoMZ7O1FTYE8yZl03d4fdfx2wKR2bQTcpDvrqtoBuvH0fKTd69C/0EV69vlkcT68H47xi1/RNDesoC4R+lK4CxfpeC5XNnLhQv6YTJwKXn2A2btuX9zJpejRXKo8cw0ADeQJpDlDN9EWR4WmMFWMIcAVvlBoHu+e9NJluIUCHUHP+wdXlwV0rkuqaIVmnFOiaXaAFdPFNNNE2GMZQ9hviBlxfsGSS3Ik5SfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x6pIY1veyqKT2UbbF3agroG5DuxaisRiyeZTX4Howvk=;
 b=NyethTdTYRyj6OogQVuB0CXGpihpeXznfbkEcZcv8opSahm43GDhOtnJXmljHlOY/2xYPpZALDIYhWRWFKW/QsZfJdk97UZYoRzjLMhX++WdfhWnoDieDBZiaKg2l/4F+WPruAIG2KkTbAXCPR2sArw+5GwcmkEOnuCSglXRunRNpYvUDQMSClu2Yc9uzHbz5EwMiWW+396tDAJlq6FRbHgpWs0gwTepITg7Mc+xuAuZIGiwps9SygQvGJlA2u/Ayb2ri1mM3Ua60HEkCOwFD+k+VO6KyTwFk/YwNYC/R+pq/hJ7i8D+tU6qsdwprw2lqB3G3z0kciWFSPQKp/bmeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10951.eurprd04.prod.outlook.com (2603:10a6:800:25c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Wed, 10 Jun
 2026 15:40:07 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 15:40:07 +0000
From: Frank.Li@oss.nxp.com
To: soc@kernel.org,
	arm@kernel.org
Cc: Frank.Li@nxp.com,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX arm64 device tree changes for v7.2 (part2)
Date: Wed, 10 Jun 2026 11:39:59 -0400
Message-ID: <20260610154001.609755-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0171.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10951:EE_
X-MS-Office365-Filtering-Correlation-Id: 292e2976-34e0-432e-0113-08dec7068c50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|376014|1800799024|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	jIdqLQEaZwooOXeL/NUpUBDl+vFc6LU1VhokI4eGmFsbqzL7t/VVNwTO2P+DNFku5GA+nKIlJ3FSaLgmZw2FqtORdmPEE4xnMzVWQo7PXMSWjC1TRmHxz6cpp8NZpxERdYLDtU29UacSeVAbK+i3Mbc6l1YOMoytVnJg356Yvy36DYpBV0YOxUnBiXoxT2p1GjXraEjMzcHhCP+k2fekqz8leTD+KRj61RqZisA6xgJFLP2ZxmjodKLzzxD8br5GxaeliKiZY4PiHckWMh4zfpa5NQIbXzL1OyeEXiupgVaOHhz+I1sTSJiBNUSVWgH38+PR6SeS8NqUgttjnvM7bRsetREeWQOouzyVvltYb1SfZLhtjsgetha/ZKDmfrwXf0wkNYEhOEGPdOey8fE1ybeELrLDThpxgJhd7aewgFftdfVENd2jXLBqmfB5ks4dkp4EUqAqwgSUhYLUbSV5FxOUyxFPhdd3MKxxJtGEomvWRF53aNq8a9rhACHwVSeiU9d4Pj4NLTyyQGEphPpBRdkAfUrp3FzTyzKQYLWfbCooe4i1T4Bo0JJWH/fwf3EqgZjjn/y5pBKpA/cgW/O726PSi853SXyYrLkSXT8uuWUseXXQt4zx8Mye2/qu6Zc4qIssKHX/knUcsnTf1DQxEsO8hniuDL7qi591vl2KHd4sTJpg9AqCIeLSqcPqspH2
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(376014)(1800799024)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NrVd1HlDADUHAZ6oiCs003e5M/9J7+srdB+ODT2KLhuJFgVSzfVAOpVKsV8u?=
 =?us-ascii?Q?dwxH+/NRn96ZUd4kNOA5XvRglff2ZKuz0LiEOa6G1FJkDtCrzYkDXAJS0qK5?=
 =?us-ascii?Q?kE+1qICFbvkSR6jTG54MzcLFniuj0MmAIRCxF0dJ18r2kMKAHYLo7e0wm6d7?=
 =?us-ascii?Q?ReSWilUB4OsutMGL45S0ycBHNiydTfKRlqHqfllw+7474vySLc0LkOv0EPvw?=
 =?us-ascii?Q?q0WHN4B3UrQUWPZCYsNi3h9gNT0U97KP5TgAZ8RMPrmJBi0b6ByQipPI6pP6?=
 =?us-ascii?Q?pMF0BYieto38AgbbK2FCN1feWcJTrXOybMXb/MX9+lTkMLCou/8b0yZO41l8?=
 =?us-ascii?Q?YHHg3dgz/v8WFtX09vWSkgFuH6i8zNitddWIDFSsXZ+2bM0Ii1+X/LZDTvId?=
 =?us-ascii?Q?ghfPvLcOKLNFbCoGJXesJ0/y/LH5CT33QJ3x2tICwwDVRY1FBmqWN0Bg7FQ6?=
 =?us-ascii?Q?yicLYGNyT597aLGooGEY/REZjWoR5GKUOUaRRmhu9tMChrLhAu0Kw6qU/gsz?=
 =?us-ascii?Q?L4KWS0pN7v8ST7uFe9stDbKK+idJ7nmUB1xKYbNj57nvThRmsqN2IORiLQEJ?=
 =?us-ascii?Q?MvKowtm8AfBZrEJoE0j9EOdCUQVogJMg0NlEvXU+Qi1ULPOnhLTuGztdtg6s?=
 =?us-ascii?Q?jCoPVjhx05lw4Zj7g22TVQrbkEO87BVwDf/vokZjABBF5wRNKiZ7CKjgxUeH?=
 =?us-ascii?Q?uxO6PGTXAEXQr7kkxDOFa6bUiPTIP+KFAFisWeQmt68w7IHBsho6Gf+yDu67?=
 =?us-ascii?Q?iaTFa/g1Cpg5/IabwMa8+ZnFikS0edXQh5SdWtSUCLyu3FT35rT/wfznEeQJ?=
 =?us-ascii?Q?wcAA86PBEomkViACqB2slq85r10gPXaQW/zprPU4nvJBnUQS+tLKOTUoHH31?=
 =?us-ascii?Q?A7901sgXDwB0phCARoRjCs41sIlN+FKw4yS20K52icfZxaStRoIcjMTSJi/L?=
 =?us-ascii?Q?P8c1ZbBcpDOVJTOirW4ynhOOg8ggNlrA/iTEFzAJy02G53Bvwpz6oUqmlENj?=
 =?us-ascii?Q?l4MG6Rr3QwIxjdYBkxM/1hR5V92FYR8zN5XABqfQ+8y0XwzERRlXtw54DXlz?=
 =?us-ascii?Q?m7of9jzwdhV9GlJ090RycHrpDlb3zBgZyV5k4ZtEPRoN+IQo7zoFJ3vfvy6u?=
 =?us-ascii?Q?563R1kJPmUim/vP2jUDTEcnvDV503cfGasocpqUDUDFG0LTcU5lyUdzaYCl7?=
 =?us-ascii?Q?J7s50jnlYV/r5N2WFTXlYKaHD2YoBVcqTHJM300Nodmx771sJYR8UeUwkghM?=
 =?us-ascii?Q?/3bjF9Pp3C+W0VFq9zx6yyRpV+1CY7ZgsLID+DLOM7BSkYvKnZsCMhrOaYUQ?=
 =?us-ascii?Q?D8yM2J8LDsM/XlkJryxp+vnaMx0zHSm3m1cT8llBfRpQVSuSJqkN+MlD/wxq?=
 =?us-ascii?Q?XPBY71QOndDcc4CRHpgUStxx0U2CD5jsMoehsL30LVJ9S8w81+duKS/J7MNG?=
 =?us-ascii?Q?ItIbfj0cN+kxwOrxel5qj9r1fwUj2zKN/SvBABGcvmYfwVXxFYmNHH0l3EkK?=
 =?us-ascii?Q?StdYxEn+qurthslQ4PuYLotyY85rpzy403n/W1fmB9RqAwRV5CFBuNHedE8G?=
 =?us-ascii?Q?NZOnOoqnhi4d7sF3BdHNQypiPC/+GFOmSEHQZ1DhmLCbvTOoIlCdp03RSX2p?=
 =?us-ascii?Q?hxIUZ6GDYZLPjQ4H5vPcJPFiE3XAhQ8pL0QOpEtDlWWPFiL6Y6zOvTMwHhKa?=
 =?us-ascii?Q?EgpBDBuBey8uHqTL+iXnntjq97nXlefn5StMJtjnaLuPhPCOSveLpU1nlKH2?=
 =?us-ascii?Q?K8jz0WjLzQtAMTH2vVWpSvErtML1dLsMVLksuZ8AAbMvAETVDa//?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 292e2976-34e0-432e-0113-08dec7068c50
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 15:40:07.3933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6X7z49ddT4bKefhZys/47VSpbAdnPFDiz4jWCdS9J1y56Ek2DsWUL8kcsT8BaxqfeBEpaX4mEKFOdIkrz2C1ZpabyTSQDXbCUC+VbcAxMVIWuEXPMSeNVgwEBBWS6CAv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10951

From: Frank.Li@nxp.com

The following changes since commit c10cfc952215644956284a42fa7b7860dfbcb5f5:

  arm64: dts: imx{91,93}-phyboard-segin: Add peb-av-18 overlays (2026-06-05 13:21:22 -0400)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-dt64-7.2-part2

for you to fetch changes up to de8c602d5a2180c737e55dcd3dbcbf9dcc4af292:

  arm64: dts: lx2160a-rev2: avoid 32-bit pcie window system ram overlap (2026-06-10 11:27:22 -0400)

----------------------------------------------------------------
i.MX arm64 device tree changes for v7.2 (part2)

- Revert the 32-bit non-prefetchable PCIe window from 3 GiB back to 1 GiB
to prevent overlap between inbound DMA address space and low system RAM.
Such overlap can cause DMA transactions to be routed to a BAR on the same
host bridge instead of system memory.

----------------------------------------------------------------
Josua Mayer (1):
      arm64: dts: lx2160a-rev2: avoid 32-bit pcie window system ram overlap

 arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
