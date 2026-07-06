Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010022.outbound.protection.outlook.com [52.101.84.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5967536F8EB
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 13:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783343170; cv=fail; b=Tn4K2dCz0S6rNRbHOS/g4xLsiJm8vfqtnVdazmzixMOv18SJiWfuBdwRcLZ+/E6vYeKff7Nx6gzgUVcLUMZersjRpBMRg7lZ+gu8g3bG5OUP/5JaFUXYOB1KoyU+6fzJhsw+sn5l+JcqYUztKTvErsIH86jZJa6cPYuvG9Ju+ls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783343170; c=relaxed/simple;
	bh=Bg1AwOYGE1FdBiigxq/uhPkmnma5T7XZrPOC3uokbD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oGSMyUobZv1nsin1cTsmfU9arGEkQnN6iPCccY5AV5BIhFoa8tsEndWW6vsyZFqP5D0Wm8iFQKPR7i1AR9aLW54LwyEmSg/FFYi/579uc3TVTKgnPwoNcUZqK/+BSAecxccM0yRwpn/q/mhkBUnwbH2q+npXJrWUltEbxQ1Nc8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QgLepE99; arc=fail smtp.client-ip=52.101.84.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QgLepE99"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V0TC0s06e6Rb7aR2dzQFuJf6dVik7YMTKy3/xILIpDVag6C2SgaEoo19/2zVYRgLbODT79wH6ZDVKXWIr27/UoxFn6jaxJIzqCW8izUmNT9xDiwAQSsIT3A0tybmjh2Z/sUdChFlLTlGRp2Uo7Vj6Rol/zWJTFOE1Ro63Z9W6JJpVPrHUg/IurtiyOkz8sAISuzSmLZSI+mhcxNYZvjkRil4hlnpxkibyOGpnO8FQs4n2dddYNEFYhgO7cFxkgp1Us3BS7cHl3TtNfLmuh7V/L0f9amFjIryuLbTZfBZnOv7BGDOy5sNsIunG4IgkiSU5R/2ulW1HkvJvLt0FBx/tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O5/L25n9FP+m+oT1N+VydWdWyhGTVg8wr3a4U7gYKPk=;
 b=W435UzJWzp6PsJyxGWf0pBpFh6BzRjEpSEMOfR4oa/dCSHGU20O3MGeolZT/V4bMIYZpJDO3ANkyKuHZAv3HDauYrNTl+TcchjAzqqB19+KFRgYJafAZ2lafRG7D9bg4/9RnszzpDNk+6jTY7juCm4tmV0LQtfi75Lhof+OXg12LG6lhnrFhDHoDLLLdWbmjFcpnAUTri/MvHKJe5hsti3SYsMRdVs3RaQtzKEXvYM+NgsI9/SR4Nyjp4deBp3/OX28besO0QMl3jDomwVQ2czEJXuKyn4GP7iCNqeIgaBV7nAT0ZN0TLIsM664YiAwIHuYSUTdD68Y4n8p3xDbAPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O5/L25n9FP+m+oT1N+VydWdWyhGTVg8wr3a4U7gYKPk=;
 b=QgLepE99saw+SoGr67vqvyJjKPm2NR2D7ivk9Q2kuQESQeeWRtNxp176GgXUXVeTu0lMMHG0Gnto33gWpRXnsWh0cISTArnxod7jstJTCD2Zpfvo61uX+jDOfGqpdUXE018irWnxFD1M9o4ophdJJIm4Ycd2fBxe1TgdwZYSXbIRYW3vEYLwsWK/FmzT0jmhsFMUQD6PYC/yOZ0Py0h2nuWeV8i/gWUJHcFtGZ52JoOpdZCFo6bc340qjVx0kKYdIci4Fth2J93TBRxtU5UwKjTm/sXzMsTH2KeXdONyimgDNKYD6N2+4Lv0Muure/whqZEpeSjorgZ/ftP3gydygQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AMDPR04MB11553.eurprd04.prod.outlook.com (2603:10a6:20b:719::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Mon, 6 Jul
 2026 13:06:05 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%3]) with mapi id 15.21.0181.012; Mon, 6 Jul 2026
 13:06:05 +0000
Date: Mon, 6 Jul 2026 21:09:33 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 3/3] arm64: dts: imx8mp-skov: support new 7inch panel
 board
Message-ID: <akupDXc1QA4uKfR6@shlinux89>
References: <20260706-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v4-0-dfc0c8827c02@pengutronix.de>
 <20260706-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v4-3-dfc0c8827c02@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v4-3-dfc0c8827c02@pengutronix.de>
X-ClientProxiedBy: MA5PR01CA0081.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ad::10) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AMDPR04MB11553:EE_
X-MS-Office365-Filtering-Correlation-Id: eeccc581-9595-4210-17e6-08dedb5f56a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|19092799006|366016|56012099006|18002099003|11063799006|4143699003|22082099003;
X-Microsoft-Antispam-Message-Info:
	udsP5fwK/oHWKVp94Uw7vrOEAT7l6SmhzNtdB8LbSyDqIZ+qRJA2Or2R18SLbv1NKDgLRUZpZ3HWnkLiMr860AuWKlvG2LXV6/KBKfjvBR6V8Su27HcPQJBHPc56ZRXvjWe/te2xUZTe0D06q0XeLAdkF2ViSoSVnlFhdemrOAhBiSd7q/XjgwFxA5i0gnyPjvG/duzC95F2VLd4DJG30lCUr0ojTjj4VXw17aQuE4uhbYw46Vkxn8AX5z6++PqWtJbEQl9A23pVrly6ZAtWwOjqEsPyE1Lj1lisqrVjjZSOkcVA7cDEx7BQYhA4i8LH3mcd5cmMTF6hqkiwPZUYL4zj0XtTi0SjsJQy02pu7VKuB8nb7KiL/82PPtX5Y/3vhQP0Ls/rQLY6y/fPzHcwRMmcvmsiDm+bHLyX98jPaGeL5PLyb+pTmnE8LmadDISbc/UsxM/8vxeNThx3ifcZNX8l28a48Of/w28GDKglU5fYjOGOpmKK8tLay7ArVVKBLgltpQzTIZ+FizqTHVn20VgkVKV/XnAmWnvs4jgU1eSnwWWh5wvnIUV0wLia2UMzpvkFNirrwyrxTgKJxQoYDkjaCta+rR4mCas+jbE2+N071P+5MxM+f9MyhP52d1YqOiI+dl6ataKAMETGYzSq2hbqIzH9KsMqwuAG24RFUOE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(19092799006)(366016)(56012099006)(18002099003)(11063799006)(4143699003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o0j9AmEmlOkeQ34AjAx8OGI9TlLtq9PglfGSuuYEQaNMlvv7xWjzOux+gXAJ?=
 =?us-ascii?Q?RYDJYziVZG0YsFvCdAyyQ35EBe+xOUJsG4ZmUPPjHPh0VhjPR2dR9aZ7HuEm?=
 =?us-ascii?Q?6pUCSh20fUONXvjOz1Dx4QVP/VzbGuELdRrUkQ4kGfhgI9yzIfh+enlvIKtz?=
 =?us-ascii?Q?WY7UziYc6+X9RFf64YD5WEm0Q+kimDf2arDGg4uo9xSulQrBRYtiPF6+aIYf?=
 =?us-ascii?Q?MiQbFkyqJpjXQY0aUOQFTFPy/AkJKNxK/6ool3UMo1boo3FPWh4c8KjjVFKg?=
 =?us-ascii?Q?3wmQa8g5svPIqZFCpI/+gU5IqfNzGHbVOycDqmv3GWRDwwgaIEhHFaHRSWK1?=
 =?us-ascii?Q?/QRBKS8stDFk+TeMTADK3K30wHT6dZl0ndWJL75e/eJ5/BkfdTnJLeIwJOyt?=
 =?us-ascii?Q?CwwnS2M8gjdP3RCQph6OGKTjcNk3RA0DYxEN8bpFs1O5JMEOVMqxBlpJgT+U?=
 =?us-ascii?Q?jRUWEwmFJXC4WfD2BqQoVuYp0WizTbS0vm6N5e1BN12C5ekxICet+OHzCAuz?=
 =?us-ascii?Q?STauTYenYbbmKkFf84nIhT1F2Fe2zUtdMbQwRIpfRhaqNaLsmEb7mFGPhagN?=
 =?us-ascii?Q?p4b+zD1P87ApF3SpUoARf+wjs66hk+i5NJ146IrzVwUnQGllxwivr89WRf3+?=
 =?us-ascii?Q?1dSK8L/xx2E6r3HJETUXypFsdU3NZysiXlpZCt0lZsLEKmg0koRlrC0GXnH5?=
 =?us-ascii?Q?+2cY8LQEb4NYCWyzQDAI1Jtjbu7xl7dxT9cr+kLAZbXzsQYCRJgR3E9tP8q4?=
 =?us-ascii?Q?TtcJ55/soNKKt6nUTdP8oY66YVoslYPZ4CTFMF/IxAz7FR8E5VCHUeZVUnVa?=
 =?us-ascii?Q?rc9vVe+7jb4TBIGRsH5U6uwJkaEqWs9mcTCkpo2y1oKpxW0/zBIpOwGrmqCf?=
 =?us-ascii?Q?MmMaqsE7CYUTtrfx5mu8L3SXbVYLsNsIezEYc8e589xegvo5f0+9g476dlg0?=
 =?us-ascii?Q?0QJRp+z/unVMy3YS6r/ZcgPHkLTEjnEWv+jf6fOtkbcnm7VWuj5wzO0hWRds?=
 =?us-ascii?Q?z4LiUkzsrDMUtNlZEKtVj2BFzVnrH1vn9japQ9fOcRz+T43/E6DLGwZhBSfY?=
 =?us-ascii?Q?jEjudYoWhUptiZJBxGRZnWTVvyjpPgQTidI/7GotuHZvrb5hP0F2q33Wa3mK?=
 =?us-ascii?Q?bhHBQrDYb1I76fDiu1RPbfwYtMEE50JS1z5jcywYHQRlFfU4zMYIPDU9ZNjR?=
 =?us-ascii?Q?OqFKwJHnNYe+tkD1Xk74dcEtRvVRM/4e78JZ2/6NeAlkV6iitHCCTRzmdjzw?=
 =?us-ascii?Q?tHyJ7djyrZMD3+lea11Z2bSarOfoa2oiTSXREfb/rWKxb85ryFVh/keS6zcg?=
 =?us-ascii?Q?9/aMnu+p+5y3TK+2SLT9fbDZNTt40imb6X/9s2G/YzLNY1Ejs5gyBomD5CQJ?=
 =?us-ascii?Q?5q+e+d80xhii9nyQzLcpVRygY9+PSHFmW61IikHKMWTB4MUsd/bX/39ZDRKF?=
 =?us-ascii?Q?LreogndUX4KB4kvJoC06nNZYmqjnBBKKZYHAvn32rVAa6BAFMttTGXxJQEf5?=
 =?us-ascii?Q?DygRpDlaNeu9g5QllzkMP7WZ8P8gi9mfAfYAiVD7wBdPJ+oFhcZByY9BSxZs?=
 =?us-ascii?Q?3VzVwk/G+RBmKdIsaacP7gyKQNOXcKB9VghGBsugfkHH+UFGpjmrXWoE5cBy?=
 =?us-ascii?Q?78LOIGQsb+LTencMHRJrIb2v+QRVhAOHNxKGTdogJ9aFRk/p+nJ3gO52JCz+?=
 =?us-ascii?Q?jRgC1q/nRi9hKWHrfdFXF2H0e4ILHL/lp9TNfJ+DkiMqPYot8bt/cJB8Q4jw?=
 =?us-ascii?Q?9e0albDFB4EK7O0WRGWALR5MiYIFhuB1Ht4dC+9qwc1+GOkG1+71?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eeccc581-9595-4210-17e6-08dedb5f56a3
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 13:06:05.6218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b+kgQaEDjPQBrggB5YlzINR5yRUgopNYD8HkHbBGJiwOT+XKGqq23n1ejH9bw3YpVzccv8dnBYNs/hbwnIf7GTNVTFJztv0TsyqRG5+V2Cb4dLqkdDo4pxdJFXQ69fTa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR04MB11553

On Mon, Jul 06, 2026 at 09:17:57AM +0200, Steffen Trumtrar wrote:
>This board is similar to the already upstream
>imx8mp-skov-revc-tian-g07017.dts but uses a different 7" panel with a
>different touch controller.
>
>Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
>---
> arch/arm64/boot/dts/freescale/Makefile             |  1 +
> .../imx8mp-skov-revc-jutouch-jt070tm041.dts        | 79 ++++++++++++++++++++++

Sorry to jump in at v4.

Compared with imx8mp-skov-revc-tian-g07017.dts, the differences are mainly
in panel and touch.

Have ever considered using overlay?

Regards
Peng
