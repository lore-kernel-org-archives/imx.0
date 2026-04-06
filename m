Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013042.outbound.protection.outlook.com [52.101.72.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B591E5B88
	for <imx@lists.linux.dev>; Mon,  6 Apr 2026 02:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775444233; cv=fail; b=No/7CvnH2IJ2B5Wb7bzy462Vivu0gn9axG5Jb+AfobCaxT4ElFZzPpiBIi8rDRcUZJ3yu1GGyu17jK1OcFYgp1OaPyjI4GsLTAWOpH/k/yES0cPs/l29ps37cjZic2bDAD9zD03BVo9F6Y41oZJtNQuGuFxjs8a6U9cSIGIkuzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775444233; c=relaxed/simple;
	bh=c/uzCoW4XwWfSOZepdj9J4lWgcrL8vv0nXeUFaXDQY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XihzHcbmA9eTIdIDTGZPxYavOrvkoSPUZuY4QDKXK7Ex1M7XhMRex+sxvhViHv2c0aKo1Mf/G/N2w7pUIZsSacc6Zjddj99RD5iMAQ2CdhgNkWR3VFPX8OWfVi1ni6/K/JBRhM34l5Xh9cItObGa518PO+SgVHRQbZS53m+O21g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=lTTlzjxz; arc=fail smtp.client-ip=52.101.72.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="lTTlzjxz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fx9/omm6F04WPKX6mJSd2f550OkDOyLfVuXlRp7GwrLJitv13Tfn3Y8J2R0Ckc5JSD8Nu3vM4bjT0/6+/0LgfdSM+xi1PsmQROXyz676/SKao/gWqD8BFcUksfF0/feq1xbijKu0s4r7RRWTCKM3sFjk9xHKwjACW42cPW86ez1tccjZoXEsZDczN8uT1IKqawbGQnJKtbu+KVa4R+0H55TMD+JYsP6Lpkr7wNX7ysx5X+yp8jmaRFFNK1moDyn2M0OEd+z790nMlhp+0Vc8xkKstaecPDbqEwA66LSiiJqns9KN4hkzxkpurQjRGz7LzZHFgYX+Y3mPGOWwriiAYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qk8d6uAQPFrqL7e/FPfRYs5LaraysuRQi8+fvb7+ncQ=;
 b=MSeHcwUXB42G5QATpBsF/Y4ufMczwaZfbgrVjK1jRyJs6ZVH0OA5o9E1INB7rR2FOOK9F7n6tT03kP939PGTf2dLH9tqHfhgzgZqjY9b9dW59BoefdgP0vcVTDtiaz5jGe9/VkHW9BQKzY9/GXI4mQd+Ahh6vd6TIPobFbBU/qzl6wNcuOSvCRMJF9jrgeWCtb4KF+JgfjwdaMAO1SYdh5Nxg0rAi7WfDerJUZgN6zK3Kv2OcW6YFDFnkh848NM1zxPAj6ULluNsYpuQu6DktYgLh6gd7ebwft3vUbfyRa77NUmrNGlvg2YSA1L2AeFl1HyOosY+N1z4usjHufLsxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qk8d6uAQPFrqL7e/FPfRYs5LaraysuRQi8+fvb7+ncQ=;
 b=lTTlzjxzjosx3kOpBtPPEJyJDHkQgqkjuCiNKv/dBD/8/RZQjtvXjvcA0O8tcnDQUBsdw4Iq5UieKYXUJ69U4D99n7U0nsB4Wj3WshS9ZaTiqbt/61dLt9V0kXO7feg1E8t3z2TrI+OLts1RIyVt8fti/BN892GiAe4CTR9UF1eoxUx5BIPKY9e3avhzYhxl3kjcDKeQM4P4Sistka+TalngIkJUvb0QEKigONdRICL/BY5vpij4PJAceSb0xn2Pe4+S/FaLtAYCx3s25dEt+YrV+9BTpnwNlrvAuQ4ufpkp/kXR8KfwlNg8kFkbPgqeHPbu2/e2IyGzC+aUAJqTwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM7PR04MB6791.eurprd04.prod.outlook.com (2603:10a6:20b:103::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Mon, 6 Apr
 2026 02:56:55 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.018; Mon, 6 Apr 2026
 02:56:55 +0000
Date: Sun, 5 Apr 2026 22:56:47 -0400
From: Frank Li <Frank.li@nxp.com>
To: Florijan Plohl <florijan.plohl@norik.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH] arm64: dts: imx{91,93}-phyboard-segin: Add peb-av-18
 overlay
Message-ID: <adMg762HH4gcuWyq@lizhi-Precision-Tower-5810>
References: <20260402070826.970012-1-florijan.plohl@norik.com>
 <ac50OHuEApM3tRHq@lizhi-Precision-Tower-5810>
 <56b9e133-74b9-4e59-a40c-c7637c080fd8@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56b9e133-74b9-4e59-a40c-c7637c080fd8@norik.com>
X-ClientProxiedBy: PH7PR17CA0016.namprd17.prod.outlook.com
 (2603:10b6:510:324::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM7PR04MB6791:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f10970c-0165-4e2b-ddda-08de9388291c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|19092799006|1800799024|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	g180neoEUHB0f0TFMQVKtwkhENQdOw3Jy+vtLbbTbL/PmfLGx4XEdoCor3jOQW74lpeFvLW8LUs75jNthZPoPmfTgiqYFa/cO9QZItXE5iR27CJbkXhXG3ZQCDugd67SmekIAcLEvZIW0xOBCvIfbqsPAetmrEUHWGv09QWEIrfmCegYnO75oUJgMnyCTzFs+jakIDE1F3MzI6GHlIofzgPaG4bpTfU55Dufx6tG6KEiOK/95U3/O0tPI6iUu0yThNkxBtUxlKV6gLB4yqeS5/2aceMRJlgVItNZr9OJqK/azBviU+d0nx9lbeUxS7+3j3is2/QcqTJKaRPZoPpU+D7wtG7lSp+xiUfd4Z6YNqO/WWVRy77gr1KZ344zK52YMSJp+eUleXKfvSVJhzgzmito2ZsAv0IlSFCyL9suzYUJQUrS8fpbpHQ3UJg8PKoYoRM1DZHzjIDJXX2mtZS1Q0MMcmKX/VZriJv5/III/zVGcLm/Zev/ow+XGmdDWWYKySQiGvr4fwcFzTqaQTgBb15YR0ksirLgqP+21EA8JOioKCWjzw8WGO/UAQH6hD5x31N1v1rIOBnQ15kZjyAPHpNExk4sMGyBefXfk5vsuFxOf1GIJPdE7NcGrpvIoL5NXOiY7HO/l/llp+7oHedXJJzoh/WuC01s3DXX/3+Ct2QsVj6wbruMNYDCXKbKxgp1CDTMr89ilyEiyZUuBMTGoSYzygmJfvqeDtBLJb5MbuH6j9qVcxZQSO04WFYSSsW2fkxP02kJJ8s89I758ZjdhTohIwCy+i7svZ3tmVoYO7g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(19092799006)(1800799024)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wlzc6/p+Na7THsl6J3Ltr5k+eZGOInflukXgA44SI9zYKbUSGzz5zKV8Je4O?=
 =?us-ascii?Q?P7P58QndQDH/YzzSFBPMSAGcxXLTlLUa7E6caXcVVRTy9xeexEeF0ky76kG3?=
 =?us-ascii?Q?HU/Lm7umExpzIFkA34s+Ws+l2JZ20L/dmRe/cyy7sw4sRI45c12rZuzRuDxV?=
 =?us-ascii?Q?Kklmep08njwAeu63jyeeKVSyVflYAGgRGlX3AoXFqR6KMR7UiV8zqOJN59bh?=
 =?us-ascii?Q?Viq8NrR8Gz3TCJhW/Avt/tOZJgpUNQjhAMvyg85JchbRb+lVYxFuIBRLfg2y?=
 =?us-ascii?Q?dvROvD8PVS2MjCypvH3yglMkk6J1NlNFyQkxduEKuwk2N/pVHeCfDJZHakVA?=
 =?us-ascii?Q?Kgn5LTV+8BdvVzT7C2v2IQuvMo+TfM9fbYvOlGIzv7g6dmokswp+IUJesyM/?=
 =?us-ascii?Q?BJ0bKzCsjIGkKaDXINSsts0DASugn69GW00zcJMqar7+QUyBQviJvNDa6fsJ?=
 =?us-ascii?Q?cLxZewjsHMOTj0Zlt2puViIl+eVQ31Vw1oiwvjLNjdtr7LhkCYEpFrIgkNwm?=
 =?us-ascii?Q?a0N9b4TOSLDC+uZCcsqlB6S5HSt/inu1sLFq3XctHStGoqqXC3vUM+HbU1cO?=
 =?us-ascii?Q?ulE096HT/mwx8aFxApdoVtRnWkZLdK4DBtejkYGcHy27mJWmcY0MuIaXHIVI?=
 =?us-ascii?Q?MPDhnB6LDGn9WrjLTGbllpPxxcYbBl/vv5/7FSKjQmak2Spr9Ei0oenT5Ken?=
 =?us-ascii?Q?xfrspqTJ0Q4P3zVcBJUqdd17pwdGVTjl/dyuwaAaLFPdNowAhVVEBCMYKu8w?=
 =?us-ascii?Q?HzF+CB9Kcwk/gQtRviJiOAAhdTuLhaiN/qcuVlReobPOsdVi3IFJInLO+0I+?=
 =?us-ascii?Q?ZsmPnXaPq68So9x27BMEVLf/iBUBoRwOAUbSfCrrvApg8wPYERptP8F8vGEA?=
 =?us-ascii?Q?lB/OquJeuWGmCoLGY6kMNbgq77WTiCwHp30lCJcnclYNZB+w/0H2QxLLIl1U?=
 =?us-ascii?Q?dq8LWoxsvJOTINrblxJFSh6MprTjh721WS2yHaZhfw1MW7J+jcFj2q9a3YeN?=
 =?us-ascii?Q?y46ifD93We4mxEZmbGpSMDTVHnc362cW9smA5wIZ1C6q8DzMM20VVbxFGiJI?=
 =?us-ascii?Q?h6vXB31uP5+J1/tdb1EMfngH2FQswsdqvjYngXBtAYUSgB+u9d1iR2o63Dz0?=
 =?us-ascii?Q?B+1yPBWvIbAAT6uC6uDLAtOrNdEOwXgVfz0z1RKVXsRVHCEFPce+pAg6oyU7?=
 =?us-ascii?Q?bQlxhL5PDSyIP1MM8RDtfdycIuIyloUbcOse9IWyLM7LBIQ9fJwuV1Df7HtU?=
 =?us-ascii?Q?IyjYizL0dU1uVh0tNOM8nXE32ZV0MujYR6CkYP1+yu3uooT2+S6M6iVQVTaJ?=
 =?us-ascii?Q?5IKU8eBwR0U6T9FAqRl2VRd6MtqFFOFzsn5Axggeq8qqIlwh8Z7RuwSoIXDt?=
 =?us-ascii?Q?80EAG0VoGR1fCwySsH2AOP5UNdSedKrG8rXszG3YSZjabpQLeLz5zePMg9Nb?=
 =?us-ascii?Q?cCPv/AjN3upbohEVdTGDl0zw2GyGxTmTai3zmhbDO+TRV4OiItgZYoPKSQwa?=
 =?us-ascii?Q?xW26yL6p2wx9WH8P9D+HgTMGgNdr3nOPi6s0pXRP3yHsUrhVgYC35w2YjoUq?=
 =?us-ascii?Q?HD70jcQPbSMo7I4Fn8/wBzzpLoGizPQv11ZWZkTdtwFnZvhdDanrNG3otHD7?=
 =?us-ascii?Q?UNKrvf3ML4WurcH7XmKxGqoHyuXrAZsx2eP6SH3YVUAK7QWZT+12I4QyMFqx?=
 =?us-ascii?Q?SLYbK0lP+kfDF5HQgTa+zBf7ZnjD/HN2L2wYGZ9Cl/aOMMpv?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f10970c-0165-4e2b-ddda-08de9388291c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 02:56:54.9473
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eTH4UmfDnyO5keesJkRtYrM1QuxiP+zlZOl1NMtzDaFV0MCICNNamHOlxW8IvjmFtd6fl8oh1k6JNtdcP+/o6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6791

On Fri, Apr 03, 2026 at 10:29:00AM +0200, Florijan Plohl wrote:
> Hello,
>
> On 4/2/26 15:50, Frank Li wrote:
> > On Thu, Apr 02, 2026 at 09:08:26AM +0200, Florijan Plohl wrote:
> > > Add overlay for the PEB-AV-18 adapter on phyBOARD-Segin-i.MX91/93.
> > what's means PEB-AV-18? Is it random board name?
> The PEB-AV-18 is PHYTEC designation for Audio/Video adapter modules that can
> be used to connect displays on their boards.
>
> I will improve commit message to add more such information in v2.
>
> >
> >
> > > The supported LCD is Powertip PH800480T032-ZHC19 panel (AC220).
> > >
> > > Signed-off-by: Florijan Plohl <florijan.plohl@norik.com>
> > > ---
> > >   arch/arm64/boot/dts/freescale/Makefile        |   4 +
> > >   .../imx91-phyboard-segin-peb-av-18.dtso       | 142 ++++++++++++++++++
> > >   .../imx93-phyboard-segin-peb-av-18.dtso       | 142 ++++++++++++++++++
> > Any difference between 91 and 93, can use one overlay file?
> >
> > Frank
>
> Can you suggest how to do so?
>
> There are imx93-pinfunc.h and imx91-pinfunc.h which are not unified
> between imx91 and imx93.

I suggest move pinmux setting to mainboard's dts files, which provide
plug adaptor header, signal should be descripted in mainboard's dts file,
which provide an unified label to overlay file.

Frank

>
> So we can only create common dtsi like so:
>
> imx91-93-phyboard-segin-peb-av-18.dtsi
>
> and still use separate dtsos:
>
> imx91-phyboard-segin-peb-av-18.dtso
> imx93-phyboard-segin-peb-av-18.dtso
>
> Is that your idea?
>
> BR,
>
> Florijan Plohl
>
> > > --
> > > 2.43.0
> > >
