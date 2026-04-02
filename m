Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011049.outbound.protection.outlook.com [52.101.65.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78362D47F4
	for <imx@lists.linux.dev>; Thu,  2 Apr 2026 13:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775137858; cv=fail; b=O/E36ftla/g05Oyc9SJi92a3jq+9k59QiWzkN+2I/tJImdm5NoKxo0+0VGPQ6aMItOSd1tQyDWQYyNCV9U3KLAkjOY6Wxlv8/v9xFKp6acfLBNHVBmpjSa1q+doCzqEpeMZ9vRLZ2Ns/0UJqtQC5nb92LvqevvkIpQAITU03MR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775137858; c=relaxed/simple;
	bh=OefKBNgOLzLMfBO+IV/MfYcV3YnYtaz99Xa3917qFZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hg1J76G2Qje3lKEu6C18suXWiIv9OOszdI8iKq/r1P/CEfT4EuC7v4k6T3qefJsOGjs6YPoz1n8d557xKSGsdicg2YSfp5m9nA4DteVQVem75RfU8QoC+ZBQGc2e9sNz3XRDJA2VhXap/tjBW//clcQ6W+ivE2e+L23EbExayRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BTFHiNIN; arc=fail smtp.client-ip=52.101.65.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BTFHiNIN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GGhir8IQXTqmHmHdwGWuPJ0h26Uu7DSukXiLQGwbTR1vwUwj3Id4siv13cv/fJj+wcVGjgw7GuUU2WcO9XCkpq0bH2OTnCQiU3V4IZJHsNdY6aYBsuiZQXDtIFm1YvCW7Jkfjf1Uk7h6/kW3jmxrYQ1V0z6I86s8akKv+WO15SeSRqeeMv9yokVvkwcxDK3WQGULkbU01K5SZ9tVGUd74nIn6T6q6OhM5rNnSrrhVQqJJ0ALJGxVXCporzxezkELlWw1W80v+Qd7XtwTlgPyQMz7b2BsduZleqOIpV7nTC6NcIafQv/luREOCVKMaz3XVVQJs4PWdo8LrgZ2/PLrKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=59xCyg2MLDK436UKcNuLsCVRdsXQZdCI3XdoSy49NWE=;
 b=ko905sP4bn+ThcrLYNBQV0r4KC9GkSmoxYXkvcSRlgQ153Idg7UTPFSGmV2RqXcZNWa++VP66H4huevJqQFYcRDuv/dOqDog993fNIj+iCobInpM+dDnzLBGCzncI+DpWMnRQg7iFhRccQieuodBPWBZP8ySO4g3fKs/GtD/ePpCaUB3lFiSZbKiJyCfWHeB1fBTmcibJd+OxOKKGyWdvSG9QTOdfQkl2/s91qTk0hqQ/kscm24Edugp6CDXsR6q5z+Z5b+9YFNU+fomaMzPlZsiLMWpr8lh6BMnboBLUY9YhU8Mr8xm8mD/Ws0HBrd194c8Wm+5tXr5VbkqRSCZ/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59xCyg2MLDK436UKcNuLsCVRdsXQZdCI3XdoSy49NWE=;
 b=BTFHiNINt8WnI1hQU68FtGXuvmLusIn90N5LkRXZ8hm7rOM4EG4x2ZY2me7jlWss0l7rZ0Iz77VDrXr6eWuyKVzG7LJNuTrUToy14q/mEfT2AHzaTeE2uSQbLS9HpjIxtapSt84KEzuO4rAka1PHgZ+7u4zppVQ5n+7mCobx2Jb+NRZraYhxYgY192vLiHGkldgC4Y+xZDvLxyUxKhxywKxmUM0Qm3o1b2Ymj8otWX6pW9dMIwd9IEzuHZPjW3IWf0A2ZkqMNzft+yXkaibSamWmcqBI/SpAWU7AcVeo0av57Gi5ejnD/4jTh3rK0cdKUxlEfKssgCwRYSNedfaxcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8745.eurprd04.prod.outlook.com (2603:10a6:20b:43e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Thu, 2 Apr
 2026 13:50:54 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9769.016; Thu, 2 Apr 2026
 13:50:54 +0000
Date: Thu, 2 Apr 2026 09:50:48 -0400
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
Message-ID: <ac50OHuEApM3tRHq@lizhi-Precision-Tower-5810>
References: <20260402070826.970012-1-florijan.plohl@norik.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402070826.970012-1-florijan.plohl@norik.com>
X-ClientProxiedBy: SN7P222CA0007.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8745:EE_
X-MS-Office365-Filtering-Correlation-Id: 74a8a71a-581d-4c69-7995-08de90bedc09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|1800799024|19092799006|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	rGodIUQJC+uK1sRcOYi0zdGccnczlLvyipEZRu/VMcXIUwnqSJ6btoKKTjHi+cqEfBEcvvIDoEq/WMcvPceL/EtIVcoa2WQRuvw5uvVfCLoOuAYoP81OZLDKl5wVcy7yfPxBxik7UMcAJ3VY9P8i6GHSxVCkwa2QYfL7PoiOObO/KBmSDSRVYRmQYStG8naFllQUS1otN/pWCG1NutSAuuN7rbDBUbcRnU9ceinh9M7DBwJ0pAlpdkYsHhSjUbmIL8g0/sUAZiF43liSXemBKAYSUB8xxwHLzrH3p81yR0NWc9T8Aj6fjUvf0NMWzHX01dLOSwQGboxwhYdmxtLHLvAvHD+d0LgTHTNqCz72xTFHUhAcrtBGEcaGquy4OvofDJvKH4tmbBjZYpRY/I3iDhhomrUXAxMJXT2MbFfGlxvsjpyjzMOrgtu0BjpXZQbPMofoKMctuA6jZnGt02o6lrJrQ5c+YTIpGZJ/JB0wpP71rwElRbv/Uov85iHajr5VklGalXAd6qB2m8jjiYfNFr/3fFWIIsUwzJw3S2301AVYIn4lJyq/1+O2kKfTaleeU5OkWKmWlvKvNEFbssNM3WF8U55Mm6UR9AcUd/mejzgV5KUvyjMbi565zEtSUG0yf9aGYD9BQR9SdAsXaTOq/u4HTAEUff55AWAS4MGJKs4bEO8LcaQhzuGXzjNE7mjwDzW2aXYdPZUGmFbeVmt5Mj/kzlppSBFBnikg953mJkq+wiKav8n/NUW2juoZJ8CsjmLB+yhnPe6MCebKJNZMOpoE1m8Zsra/U9dYpWoP86c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(1800799024)(19092799006)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PZKm89oYAi9Dqn33oa16CLzBbR2rJMsmWN7coW8MnI+hQvPP8hVWW0j7WaSA?=
 =?us-ascii?Q?3EMkIS2PvXK7eEz7S0C6tMqhfVV9D+plXFmHVvOEPcs+/8nFPIkW+mYJ0Yzi?=
 =?us-ascii?Q?hsSPpzOCi31BH4gvEyHMByWllZQBTVr1d4W/y/HPFCg5zi+yJiiQfQYiiLNX?=
 =?us-ascii?Q?j4cLo7gf53eD1VNDN3LQIMMlerROu6xiwMY4YWsS1aiuh4bzcmJ+gNTOzsX+?=
 =?us-ascii?Q?u2WvRt7hmAj19PAtnIAhWzJcl4xX61zsx/BKqmsbm+Rjg+VQLp/JN2xNGlfx?=
 =?us-ascii?Q?h05C5GWokEwRkJwkgZaBb++RXggHPraIhPfHxoXUA0ReGnmCOY+q5Rd4zHIi?=
 =?us-ascii?Q?HxYNwrriHmHYKTnPfKaVBTCa6sOEr4F3zjPg4ZqoqKC14/PN3FZqZAOuOulB?=
 =?us-ascii?Q?gME5rGkA+hXNdlhzuBmX27Bv83PQGnJQcybCgGuaGVVKUTZJnLscoFEQCjLb?=
 =?us-ascii?Q?INMBIlhfSP045bZ6F2sN22vwIGR3Dct2XwXbyLrJiWd+kXwjec6fncb4fDue?=
 =?us-ascii?Q?40xzXlQEkL6DJSMidD9/Dq+kwH79nGTgqEen/SQOZnclvCmQ+35wTXCQ7eSG?=
 =?us-ascii?Q?ZMtAow1iPH/F0hmR1KcvT30HvvOjgzu2ll3Cibtp2MOTiFZhwhJNu3lh0CY1?=
 =?us-ascii?Q?x0K4LEbNZ9UAXa7OlMRAQjCrJvUx41CmtjPUAv3RRhOuIe+uVWU9tJcB4+ud?=
 =?us-ascii?Q?KHua2m6X4/nnLdUMta4fQJUGxPrZPt9BITmghWIXR6IRbUveulYx0//Qf3BO?=
 =?us-ascii?Q?kUhNHeNHjnlUqz1TRsAyI7rRnH0auFZZ0tdyNFZ0mLtYcN28fh7F4ZU8km+L?=
 =?us-ascii?Q?haAiN5fDvs4lv3jo/kuwZLZZuHOP8Z+6STTOf0+adMLXK4zaC5as71iFznXF?=
 =?us-ascii?Q?EsRzQvZm4dcoqk5pisfZS8y7/wGdrVRayEQjhtQ+lcmXmky+q/LGY9V7Jgdi?=
 =?us-ascii?Q?SNABa27UrLkyfeyJk08CRDRw/10hC541fQdMRukOBxiT+gOpyMLFw3xWNoOR?=
 =?us-ascii?Q?6Iz7ucWWDK6FbG7rCugrAvzOnCnKbOzQfHdjFi9+Fy90ZaSjkBFGnc5rHkGO?=
 =?us-ascii?Q?Rd3ZzXjmE5LiRWzD4vl+jP10ZeMWBzOqi+HMUvqW/LqJFbEq0y9d8UGgViRC?=
 =?us-ascii?Q?9iQFF0450MykdhtICXuXXkOgat3TxYvubm3O5TwFqLq3sR0OMEL4Cy9eu3p6?=
 =?us-ascii?Q?N00xaO9FV2i4JiJ1G7XPiwv9pSdSF3+huvg0tA2aLFnJiC3y/PP/Ba9lSzez?=
 =?us-ascii?Q?b+Zr5b2gmdigaP1FVbPKtPB8aelALH7P8MfUM+WW6SOcYOx+owZvN6xciTgN?=
 =?us-ascii?Q?cRFiM3l6MoQUQksAg+sPOXt24AdOxzpoEapYpFekRg/FXhGEVfrm7QKtTByt?=
 =?us-ascii?Q?/w0CaCWIhD9pCqhtJNrBvMmtUGPL3+mMtyHrYTlj9VozDRtsDTyN83kV4KNx?=
 =?us-ascii?Q?XFimCYHVKTkjNkz1///1by6cu/lSUS85qkOwL8XTL6+RRAEr8GoGaU5VBgcS?=
 =?us-ascii?Q?f2ZxAIei6zKJJCsjYiD5JxxjvHXCaNJrPCpYcBY8ZN0x34sbnAWjH3nXJR57?=
 =?us-ascii?Q?C1Z7vCeYyDdXGgJxQrGKWxOiuJwoRC95QLuePNrM0squGbSg8zp3oKAv9VDA?=
 =?us-ascii?Q?FAl95bV1JU+Rvw/YFpm6urm85lXOM9CSOychXDPWu8Yxl8Stl2bsLuMiI54d?=
 =?us-ascii?Q?Hp8r+dr3rupuHhKvR/HBhgYze1frglIEPORY/egV2m993iKU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a8a71a-581d-4c69-7995-08de90bedc09
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2026 13:50:54.4401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X1d9jjOyw4ZDsCIhTDW8JpEsrc8yB3otpbpu2LPEcx40ISZAYqzqV+AsZ+EjICgBmNFASR8r6CTkcys+FPxBJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8745

On Thu, Apr 02, 2026 at 09:08:26AM +0200, Florijan Plohl wrote:
> Add overlay for the PEB-AV-18 adapter on phyBOARD-Segin-i.MX91/93.

what's means PEB-AV-18? Is it random board name?


> The supported LCD is Powertip PH800480T032-ZHC19 panel (AC220).
>
> Signed-off-by: Florijan Plohl <florijan.plohl@norik.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |   4 +
>  .../imx91-phyboard-segin-peb-av-18.dtso       | 142 ++++++++++++++++++
>  .../imx93-phyboard-segin-peb-av-18.dtso       | 142 ++++++++++++++++++

Any difference between 91 and 93, can use one overlay file?

Frank
> --
> 2.43.0
>
