Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010029.outbound.protection.outlook.com [52.101.84.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FAD296BC1
	for <imx@lists.linux.dev>; Fri, 19 Dec 2025 06:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766126146; cv=fail; b=N3Tt+Ud8O4t8tZid0Tj991JJwvXMoQwZ/ZdiLSPbcHYsxuVxizMr03A9JbhjbMhtFRfmzlTsGcnoVfoKOZU7/PCA3en8vV4vUgUcyJ0B284FkbQrTh9zeyjd8iu6j83mfquF5vu6rwwlgn3ab0cA2m1jMjyoWOR5Dijb9PaXMQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766126146; c=relaxed/simple;
	bh=gvVj+Ka5fn4UdgT+dS5LJk8Ba0JTuK1wp5X87lXFGCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NLp4vEegSN/ynMkGjRM8tqLckL2AmVAgny8DrF1zyh5kOgTbVAg4cFSt5SL841uQFTbgDIooH77BKDk53aarJrJ/SNWen8gt4kI4pXEfEpzwjnC2THLpbttrYVdmNIdmt+ro0DEeI4L/2Ew1HZcJEf+psLqNjtT5cfM93PyMrKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=issiJqG9; arc=fail smtp.client-ip=52.101.84.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="issiJqG9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mD9cWYodxM+YiX5ITHf15MenZh9yZ65b+7g3Rcuvd/cXbHoMYki8wQWtVd5ETC8YxeaENexRpxPXhvjaRjfs0ri5Z37AMqXOnNZRzuWFbqtMejLyogHodxDN4aZvBbUvqlc//DTZro05+qYlUUksV67a7+TKxb6iU43MhY85hk1OCqIcBURQfFbp0AQppJmQKZNspu5MHwxkhwVGroNBFBgneYYDbnqMkeUwqZZQrmk4tfQLjjHnAWmPR+lZiePZshDKDux+0E4LXig6BtmpD72+34Rpvclyxcxp9gGqsLc+pYjQwvu+rkLTCZJpsPNFI0ReU+P36lAQN7n2529gmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MzecqinKIGMvOs9fsCuNiHV3v0TYa7Dj0rnyxkN/uNQ=;
 b=Nq78Jsrgcw5pg8rmqnJf3eZWdjbWoCLdeEx3kILKnHxfIv6NSmb7vpTGkl428GpZeUYFyxK+AjLEPYAJ0RUkogDbkuNaoOxN/4Mwc8drBN01ixwjPRqYB1WUkMauje3znUl6dnv7KfuevVroiJJIgWU2Xrkf5RkZKDn+VM34ajR4LHH3Dw5jjidmkpqIjjWkoIFOk+D/njjfTnvryKKvVk8KQxG8MygyoJ4NJd0sMlUxL7kKaHj4i9iBdWOO7oecfmAN0EXSmuNCEINHgw4p/GZPxD5TdbOE1LoSBnkwZifNs4IrVS+DPZ9tbWqUCJF59HoNoWdI+wOQmhNK8F3rnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MzecqinKIGMvOs9fsCuNiHV3v0TYa7Dj0rnyxkN/uNQ=;
 b=issiJqG95s10Ifs0lNNwObq/DSSaC+VVDDIpALKLap9eCEmsM/Gv4aZtXwRHBKcUq5VAWv7zSI/ejzcHiofWkdwZMD9R6BYhy/g40ZONkRPhRIF8w/HBRHpiNJKWMFsGlw9vLVajw3gSWhsX7XA+crOUIJgzhjUeTkQq6LaabgbUBTjeMS0NW0XMKk6VBm3UNmQ5sz9RkVKwzy2OqnFK8dRl8Q+JOmHwKWMN1V5MutioVuv6gW5kjzVC6H0kaj6Gao/aj1AQjZMTLFJumi1CM+oWoVufup/fTqeomOblmrkMMDk6Dsy75lzWDRt0kYHVF6e4N1WoT9KAfe0nR0Tofg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB10077.eurprd04.prod.outlook.com (2603:10a6:150:1a5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 06:35:37 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9434.009; Fri, 19 Dec 2025
 06:35:37 +0000
Date: Fri, 19 Dec 2025 14:36:48 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v23 0/7] firmware: imx: driver for NXP secure-enclave
Message-ID: <aUTybpjIEoFFOC3o@shlinux89>
References: <20251219-imx-se-if-v23-0-5c6773d00318@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-imx-se-if-v23-0-5c6773d00318@nxp.com>
X-ClientProxiedBy: SI1PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB10077:EE_
X-MS-Office365-Filtering-Correlation-Id: 85b918c1-f179-4884-610a-08de3ec8d23c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|19092799006|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iL2z89vID4242XAug0qW3JgRpOwqtmK/j2uQJchMIBnOHhh42xr/wPMdeYn7?=
 =?us-ascii?Q?EVt0Vsm1ky2SjbeGT2deT0FT1dsb1GnVhK1onucr6cLn+0Oe5ZaM4dfgkd+W?=
 =?us-ascii?Q?1FWVAEkO3wK3Vc18cKzQ8QmtoGuRE15Uo23B/IQVGLAFqLSbxXAbSjJvjUEH?=
 =?us-ascii?Q?dXJyIPjJNZTefahgTQUVEnQdru1mpJBH+eC5s+UoBXj8N8VhpmOLTDAvCVRI?=
 =?us-ascii?Q?IcV2x/4zYxGZ6RKCd1cwok2eoC87KXwq7HdjDHxEASMOLTk3GuDYfj6bIhv8?=
 =?us-ascii?Q?65ggwZYvSRjIp2bfHV5pfiuOFJcorPcW49y7pMshrCzuNWqZWHgyDAq3IVAw?=
 =?us-ascii?Q?CIGx23jz6RZSQn0MCTQvxD6TNypG3zuXwh53Xvh3RGYud7UDSzwNp/tQ18Hh?=
 =?us-ascii?Q?5J4JNCU3xQWctG9AXbaGuccSI5CkKsvbITriRq1+dduDviI6J7wvwgLS+hKi?=
 =?us-ascii?Q?OMyZVkZ5J5EU3Kw26EbZoTqdh9+n1xZlKBvQP4ZwXNZrinrG+5DLAaBYW913?=
 =?us-ascii?Q?przSe1a8wVqU99gj0G+jFvf2vf24NG9ly+och4MV2MDesCYI7ULJFsuX53Ye?=
 =?us-ascii?Q?wfVGoAA1WuCOns7f9zWtK8DWy5Xn1BOuer2+gpOfA4zhLWrteAt0L/75pAsJ?=
 =?us-ascii?Q?/4BfS5NCqj1v5JRTORDyBRde9ea7tipaOy+jR4vI0RAbfkCIi5vDz3tckIGQ?=
 =?us-ascii?Q?88qdocZDCcilRnp7QdrcdkDPPnkJfiIDAaA5ZSh/su3WkKVJhChb7rQju6th?=
 =?us-ascii?Q?PG8nm7Phfg0uPL0cfWvI6xacjdmgkD81RMCnY4vV14v6WgIvk+byPCFGIKvc?=
 =?us-ascii?Q?2iJ/gscl7Cbmj6JflJ3tPjen6iOmCEz5sGh6IWYILXxWSZbnXo3eRrCWQDSp?=
 =?us-ascii?Q?6rFQh6b6BA07pSCW+fPEMvHIGCpauMkgVG/tug48VLQNbfigfhVszfOdBWRi?=
 =?us-ascii?Q?QDX7p/31R3aB6yBmkAhjUE4HCpf6EuIZYKEC7qZF2rCQjvWnGKPJFAXv+JXS?=
 =?us-ascii?Q?60GhmmZY3lobpM6NfJgXlVPCsMtAUkvYRWe5Gweg12KBNA8Vfuq/WsxaG5tz?=
 =?us-ascii?Q?/9lavzAdNsVmKs1B4ms2H2yssA/XMwWtxrvXV96nNZtXay8QPVTpjqupuxsp?=
 =?us-ascii?Q?oC0XDIr6WGDEvP4nAoE2TUvXx7aZkkAPt3NKJ37pnb4ptCVpmMPxHF6tSDMc?=
 =?us-ascii?Q?RFUnke6sw1VOYefxN0zbJ3PUlM41hoWaKbOi/0KbPDtt4Kv6/BZ/UF4/3Jxx?=
 =?us-ascii?Q?aZ+xUpIbrcnExTQorOPc5KkX2tfxQJFMLy5gg/51pOTYiKm1i6lRjfGY3N+x?=
 =?us-ascii?Q?WTEEKOOfuZiqFU2vYd1gMTF/wlw9ppr2RzDPoddv1GvM2tdl2dB7lsa8Gzln?=
 =?us-ascii?Q?BRrOmgC88l6ZPcg2jE5OAE5ZcyNgMfx22Rzslcy4xcN6AdLG03DGwqUJvPc6?=
 =?us-ascii?Q?ImfpYvz85QidQI6NkWngx+NkIJO2Mr/rKSlrRZA3W+hAZ/r+/9i9gtRM849A?=
 =?us-ascii?Q?9x7+fOPTFkNaI7pnog459A/LwC8ADNKhvfRT?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(19092799006)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ie4E+rhWrAurqUBvdhMV83FIiX21xrbo3yGUqajOvAQkZtnKlin6eV7jqGt1?=
 =?us-ascii?Q?h6an+G75/a3cS++OKH294t6wwfiwI8MghqJ/ffyy0sFwZWDmYjoB++cYYemR?=
 =?us-ascii?Q?HiAprY3+s9peOaHV88XIPw3TJkuQ9IJYHqLRRtCD6msz1VVGek1mG/KDOSEQ?=
 =?us-ascii?Q?EoEQJ1UD03mjmxh71bXjvtms+DMlMRAjwSJ30/qyes3cpO5qOKOujoPPYPX2?=
 =?us-ascii?Q?3z6N1npxKOmf61iSpS7+mvRED4IA+vP1v1qupUnMiWhi3klIC2V2du8KR3L5?=
 =?us-ascii?Q?I+9DFnKfEKpB0OY1eYRSUD2+F2wkKxvsW8edVWn3RnttapuI4tVN4YGn9IIo?=
 =?us-ascii?Q?Ftfg84GNbEec4fQskCJp2sl00Ujz9MsFDrVdfXuBE8PbtoVaercOIN4HClrX?=
 =?us-ascii?Q?0INTRxBqnZsT2lhPRg++KYVgHKr/pkPEFaW1cf2CIhStUnin/MGBE1Oduw2R?=
 =?us-ascii?Q?l6/FTESbjOgjvaqMX19zuCM+IicJUpvHvVs7Ag9KOUqcwRQo7NQ1mDEKiqfO?=
 =?us-ascii?Q?FNiBWj9vgYcWQA1WEBO7TVPWOK0NG+lDbwvEdeB1F5T9zrl1jSiQbkTgIw2r?=
 =?us-ascii?Q?5XvF6atrR1H7LmHZXsMPYCp1RE5pEJHKOnRCvPFA6cnB/4O9iebQNLqIJnVz?=
 =?us-ascii?Q?TQRAgI5xX9B3I0kBMGADqoEBjZ0QfEpV6VkN98oE1UeMO5T78+KghVKSiJJA?=
 =?us-ascii?Q?iPNq3Arr6ekNeDCZ3EfkSRKclYW2KD936JHzWOSTDK3EQQZVE29C3Haac5MK?=
 =?us-ascii?Q?m49iSxTLU3Iwl7dim1YXhfzEsYFawe7hPS5PBMquRaBqRT8HoRMRSPSXG9lu?=
 =?us-ascii?Q?NGFR5KnB8R51Tpiu9ZLahHBvJKZEqMIFbDEKIEQDchuW7ls//dgqgnsrH8UV?=
 =?us-ascii?Q?NKt8QTHx2Y7/4B5jOHFRUiLbq5MMbRcgvZnKHOoimgdNVHSti1pFqe4M8VY1?=
 =?us-ascii?Q?MedRsqjzWUliESukat7QkFY1p/mCV2bdlghEwoaPQU0itcdHvIBWWQ7eWeVO?=
 =?us-ascii?Q?CYeUi3+uvFQFjM/+kfFdWbhItNMqpSHym3hJ4KR3CZnI3Mac3C+uNfjRJwtD?=
 =?us-ascii?Q?z5g15d2hfYZNIuUKMglAhsBbo3r1RyRbvuCSSP7SVBO5sCyktjS55putP6wp?=
 =?us-ascii?Q?f8MO148DsR6FgNCKZ9F5IMI5s3SQ8UKbXYDv+RsZu6h4iu5EvdJ62ZKXS4qz?=
 =?us-ascii?Q?nmDSue/cYXh+wTzoMRRgrMt9MQFJ5HVmRBiEDEPiZzlkgTOPJz6v4xN9zTX0?=
 =?us-ascii?Q?i0funhHpeOGUoDPQYoSGJ1uh0VeOpLIi1niFm52LELbKdi/HXRDMjdSbX3Wz?=
 =?us-ascii?Q?cutqFyHIvJka3rfp624ppGStiBfg4PrcBJd4sWCmd/A+5cbocRuXSiyTSfT+?=
 =?us-ascii?Q?J4r9rdqrvg84/at71A7VE1ghVdC4Sn6biM1CoQ7lGoU6kp5ZUY+bRvKBsPzD?=
 =?us-ascii?Q?Yygs48fBP198IGXCZEitXgcmBp5kJTHVDkpSTHLCHCAR3ageC73NpCNQWzqX?=
 =?us-ascii?Q?ZEXNESK4clQEfZcqtd60YD71/2rjc1n1AfoWkga2iSZ6TeIECCMMItvZMStO?=
 =?us-ascii?Q?3ccTuOYuXHKqaTqgTAus0yM0pj7KnFYzZgQDpMmD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b918c1-f179-4884-610a-08de3ec8d23c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 06:35:37.7204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMYSE62jUA+q6Pz7LK+szfC0/VOBD+tVS2Z5l9Ax9gDu/zi/pAefyZGerAIfphZiOY8ifdDEI/JLMrRMqjAinQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10077

>Pankaj Gupta (7):
>      Documentation/firmware: add imx/se to other_interfaces
>      dt-bindings: arm: fsl: add imx-se-fw binding doc
>      firmware: imx: add driver for NXP EdgeLock Enclave
>      firmware: imx: device context dedicated to priv
>      firmware: drivers: imx: adds miscdev
>      arm64: dts: imx8ulp: add secure enclave node
>      arm64: dts: imx8ulp-evk: add reserved memory property
>

Tested-by: Peng Fan <peng.fan@nxp.com> #i.MX8ULP-EVK

Regards
Peng.
