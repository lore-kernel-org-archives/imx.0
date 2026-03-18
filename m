Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013052.outbound.protection.outlook.com [52.101.83.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F751C84B8
	for <imx@lists.linux.dev>; Wed, 18 Mar 2026 02:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773801937; cv=fail; b=eTPAlxllIlumxgM35Qf6/TItAQxbOiONUeWNT4Ir5lH6JggmxY/2Dlz78wW8JFwIC0v3QutIpJ9MGgqA+LfZhU7nOldbVO4tmw++XXgWYgjkwue+xkCdtm+L5un/NP8kGlWQVg1u0fDcB+S4j80RAh8DkcOZeV3Vsuk45L4srkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773801937; c=relaxed/simple;
	bh=5qY5d+yscJBEYmyetPXp/hEcUFUYfps53VAxzPgW2Ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LWf49PtGDZXMWdFmT11ZJB2L6x0u86++Is50shP/egGFinDW0pf++QKqV1eFOfmg32qWeXpBurkwmmM6SMelQMhM4aTzCqFSs+WsbDdgrq9GC7vZa0iZ5tl9WXRa0+ISirT3L4/eRYx7RUQNzx8iXFCby/LmwI6B9OxyBRPZA1Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hlxiV352; arc=fail smtp.client-ip=52.101.83.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hlxiV352"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fGzrOETqRGMxGyTQH3lrSSr4A5TsXyLVIEpSzdVorQMxrYXzw3nV0ykQOvuE+LKTuQSF1bT+ZLULZtg14+MWaCFn0ulD/1RYcwmzMFFSnyibQSWhRSKuVeO1QDPBDZiea9/IX7/4imuVwYjxB9gbwc+eQEi+jq/1dNS0v9+RQSRJxh37nGa3OVJwCRCcOkY5Evq2BQUQTezdt3uWmGorwbtqxY9aYzFiS6ggCiFM9m14Sr+CZbx3/Zj1O17gUHF2lkP1fURXowD7yrN+K44SxIT86VW8Krc3j6LfxVcNU7sjVwzuC5WWsf9AhbLPf55lGDCf8ndiIddmqqo22oM8AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fASpA2FbSgTsNgABNnmEb5MP0OXJYgJk9uFlkL2sJak=;
 b=vebgJGJFifbFFRZSjJNcH7dnX/aNuYbIOeLs7Ca1BacGLPNRc1e1Hvo5sBo1v7ltNAt8heUjzV2GxKDrz33yLfGR2rusqf6N5SCXeCCOTjWZEVM4hrqi7rz4bJ846vXiBFXD2pxLICBkZbWL3NlEmQXeNFngBEVIjeWiNRZyc0b6GaMLREItF2014GKCL8LxheJHqNcbQQsctwHJl3UukEVeEoErr5Uqan+TQI4CfS1gBX125jyLXzga3caHmWly6yWj5ipe73NcfsiyvtQd56hJHRZ94lE//UVnXTHNx7oGfTUkcv/2S8mxxgrG2/llymnHepCTXv7VTVYs4e4v/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fASpA2FbSgTsNgABNnmEb5MP0OXJYgJk9uFlkL2sJak=;
 b=hlxiV352BQdlxHNAqlJk2dpBZZA6erka9co1DQA9Qdit17JM6OmN++0EZR0eVodYYGeCYekanJ4/IEryyYXaOJei/xKrfqv+vNLdHIBOrd6TmiKCMlTQpkMRFWnMqqh3tqbJmCC0vp9QQHpLyfZnP/J0c7ITdhLny/acqxTAhcMyPGIfFSYYm4XAzNEyY2rB+Zv+bF7fiduvEmdCMX2SmUa/4PdyDtDwM6a/WVK/5PX+3PEA3nJoP2TH8byOBrn4IKCQ1rlgnFAWzwcwG7QUQg4wENsZI4sYmLbR0TgN7kD82RtkdljbyFfomX9zeeDFkzI/5f/QNRlkuCWf1nH1PA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB8PR04MB6956.eurprd04.prod.outlook.com (2603:10a6:10:11b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 02:45:31 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.021; Wed, 18 Mar 2026
 02:45:31 +0000
Date: Tue, 17 Mar 2026 22:45:24 -0400
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: soc@kernel.org, arm@kernel.org, Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [GIT PULL] i.MX fixes for 7.0
Message-ID: <aboRxPOgk2wJLoS6@lizhi-Precision-Tower-5810>
References: <20260312153557.3338430-1-Frank.Li@nxp.com>
 <20260317-jumping-corgi-of-defense-038bcd@quoll>
 <ablgRERiHQ1Tm2i6@lizhi-Precision-Tower-5810>
 <67fc1526-c32a-4e74-ac37-8f8c2c0df46a@kernel.org>
 <0274107a-90a3-4d15-b5ab-f5d420accb9a@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0274107a-90a3-4d15-b5ab-f5d420accb9a@kernel.org>
X-ClientProxiedBy: SN6PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:805:de::35) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB8PR04MB6956:EE_
X-MS-Office365-Filtering-Correlation-Id: c9d8850d-191c-4e0d-f493-08de84986bfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|19092799006|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	CeHGFTOJUHCMUE3O/2s+0B3xLHl4wsTknGAwuZtRhJyni/IvthHmsTMzp0aC++ufRBAji6o11VBpZlTe+5ozpCSBqFlR9ltXfqRlkZf2KjBDufkKhSgcb6jSNEtekDPnXPOFS+ierN9sahZ2MYQNZeJZU/6yV/C6wXPOaARfR4ExPX9lFYGNrf/ACe2Q2iSkq0DW1O/ZeeH9unHzQYNrt0sp4Vit7PbvAO9C/iOQXj4JQ90N9fvkeUZyFaC1VV5Gv2WE2ErPq/E06bvC9FL16Um55kn2/6byl6pQ8SslSSSqvztX9Byu8p28EEkvjljNlP0xEumMWAL2YQuGKWtaYZ4YCQ6xONSh547m8rWbc7bVe+6ESnZTMCFA1caMdb5+VEZkyhCxXU1nOPE7jPgpeKGbs99C9v8YLxdLRCLpaer8xfP8G0uQOQu1Vis1vwxwdc/T3av1DYSqS2w2PuT8kXdEkSo1FaumX7zMidx2FexgtPs3vhIymTi27TqEUVrMg6U1wOZ+Iu8r1a1SqOOX1FOXWbPWzkkGG4IJj6Vi3g1YipsPZhWwx7GZ+k8Z70B//C73k5dZ991g7gqAnqIqiaZXRTodUp0qeZxbzUQjhYiwTOuLQZD0TgCt+EBPkqqNtsD2+4jKJw9N3zOfAXW1Wnk+USvUoltwL/FXncSEHv1dMYVOJLJ+SG/CzkjRoob6hB+hGrfqjSNHHKwHZ7GzU60ApcIpn3mGSRLtYWWTAZyUAKL20hHZgWa4gWwkuiSA
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(19092799006)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ofehfwOIxIGvT5pUtq2uuu7rFcbJw/umd+++45K8hBFvpaTF+RvD2+RQYgEY?=
 =?us-ascii?Q?33Evy3Af0tzvop2CrOXm8nFJ3GqzHO+wdOpouniIC0xda5EQmu14MVlWJjvv?=
 =?us-ascii?Q?CEce598pxWprT1h5CvMN5Jpow8CPBTolneT0w8h6tbJRcKU6rEWp7oo3hlsG?=
 =?us-ascii?Q?FCVbR/0i8zxEKkR6t9C6ZR63SVtHK1Xo+hmd15Jw2hs41wq41x4UlizjNp8G?=
 =?us-ascii?Q?cSexwhSyV940AGBQitxE4UiiHVxyRWdNQXUDAkHNUyBAFBLxaFHYJz63dmMc?=
 =?us-ascii?Q?3n7kYyEsl38cq6uCpm3PbcNx2Sda8GZzXDLiMNkOy3O2NAfoC7vlYu7+7z19?=
 =?us-ascii?Q?DAPzP1lyOHkMxHSpj0kgvWGOovVff8w9yhpFkt5HHoRoKUu4o3H6DKlFZjNB?=
 =?us-ascii?Q?cSV08prPUYOScXU6+gC4m55BSJQkDFxG9PaEISWnTpfdP+2A89Zyd6yg1sAI?=
 =?us-ascii?Q?BM/Dae0lKMyIXYu3sPfR8n0FcJ175mgCL650ZvH6m9BTjy3vW7e7cg8SY0OL?=
 =?us-ascii?Q?5rCFxb/xpJ+Q2TwrX7xFCt1NQlHqyafb+++QqHUH3bgy2zwm/3KE+Ych789z?=
 =?us-ascii?Q?yhyjVNjKsNgOKXxXUXprrEjAiDVTOuNRVaj/3WdNv92r0eli2HsJNeGciYyF?=
 =?us-ascii?Q?A8ZtvzIzI2tWNX4PRBIRVUKjOCO+jEAedggz0xdZ7EfTUd1I/pdXBLDl7u9s?=
 =?us-ascii?Q?vibO+hmHIC9/dKw6bTxOH+QPA50wCF+gA/KOzaSKDrS0/7EeBeC6iAut5MCk?=
 =?us-ascii?Q?6RKFEQvHNkfBMuFjN8icJfwdnlgsr1u8ndHKYv0RVoudhdEzr+X870UprXnf?=
 =?us-ascii?Q?kO2sdDFTQHedrmwV0zbaUIZwxyLFVBxgdy3+ta1rYLjdW6ZdY5avjmsLkTYW?=
 =?us-ascii?Q?V2R0fXcWsCLC1q+Mt2jP3Hhe51A3UENcRFNPHj4X/7F40Rx8D7AVTZQV+gcQ?=
 =?us-ascii?Q?FCb+mRD6MNj8Qwqhzlbwxj4fGP1qgVIeRAWgF1/bLGYDrZVZpSoBR7LlpbNw?=
 =?us-ascii?Q?ewr9NhKg0Z4HqV1B39oxkh/FKRkBaDWHexzlr7wHKM0jQEGDSJv4WVb+oNY8?=
 =?us-ascii?Q?IjUqy6IjVQ2j2CAKW6+/vKAq/XyVB00oO1JPL7loPYok8tWgh4aAI0/9kiK8?=
 =?us-ascii?Q?dN8f1cw+jaMb1vjQrJYTrC78Nvd+sRsWbx/aHo7Y1dT9+gzV3YISWAOoszBn?=
 =?us-ascii?Q?6JZvcXbleoDtDzK0HneJZ2wefL+z7NHe1PecAU6wtw2QgYa0xeCJZR/8DHe9?=
 =?us-ascii?Q?BAUhJiacdSaCCJuV52WAADdwhlSvvq7ONQeqlAcYdZXjnucQn0ehH3OBo47s?=
 =?us-ascii?Q?ymwuuAQAto6xWFbyE/GLjUaC5K1zNWoJ9OkCQZJzQKnP+TMMTyM7S5rS3+FA?=
 =?us-ascii?Q?6lVTIw7g3wmyTaJqVQ8iFReO1WG1WbTd1PZobEm6E5RsYGmsw9VeG0AZ8gXr?=
 =?us-ascii?Q?zSVJCqssuJ9WfcG8oPnkm/p2I4d74lCoC9rkjmpmY9L9mseDgrgqYDJmC87d?=
 =?us-ascii?Q?uRYSe4Un44MaSApU7WwTTb8Vji08SIriBhM65KnXSu0U0cln7Vx6Mbv9Rr6m?=
 =?us-ascii?Q?U169ENAtdg6O3S+3ZwMLlhSzmhMjfj1r4sivss6ZDOzyyD8Wqm5SAlUJ1vio?=
 =?us-ascii?Q?OVO9Nv78dOQXga3sRoLS6qKTAfh+85btMcpnJluyuY0wBbAnxDF4j/29hlPR?=
 =?us-ascii?Q?mm0M5K+rBgIiJPrUVFXWURQnzbj6mPzHIoh8DPOVgX5JbriBRyo5nptSodWI?=
 =?us-ascii?Q?fgnU3iZKIA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9d8850d-191c-4e0d-f493-08de84986bfa
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 02:45:31.6480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /LKFrK7fEI8Gz8bSL8fpQldPgtuJdu51IZp0Q2em5BYAcxdgkXDpbuzV/1aDuRBg3UkbUVeKGfXw4JEg44o5xQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6956

On Tue, Mar 17, 2026 at 03:57:38PM +0100, Krzysztof Kozlowski wrote:
> On 17/03/2026 15:44, Krzysztof Kozlowski wrote:
> > On 17/03/2026 15:08, Frank Li wrote:
> >> On Tue, Mar 17, 2026 at 09:03:19AM +0100, Krzysztof Kozlowski wrote:
> >>> On Thu, Mar 12, 2026 at 11:35:54AM -0400, Frank Li wrote:
> >>>> From: Frank Li <Frank.li@nxp.com>
> >>>>
> >>>> The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:
> >>>>
> >>>>   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> >>>>
> >>>> are available in the Git repository at:
> >>>>
> >>>>   git://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git tags/imx-fixes-7.0
> >>>>
> >>>> for you to fetch changes up to 04d00f57c168153758d2c6a2395d20aadc785e3e:
> >>>>
> >>>>   arm64: dts: imx8mq-librem5: Bump BUCK1 suspend voltage up to 0.85V (2026-03-06 11:19:41 -0500)
> >>>
> >>> Hooks fail.
> >>>
> >>> Commit 587096ada520 ("Revert "ARM: dts: imx: move nand related property under nand@0"")
> >>> 	committer Signed-off-by missing
> >>>
> >>
> >> Sorry, I will update it.
> >>
> >>> Please implement basic checks from beginnners maintainer guide (LPC
> >>> 2023).
> >>
> >> Suppose this one?
> >> https://lpc.events/event/17/contributions/1498/attachments/1155/2452/Maintainer's%20toolbox%20-%20Linux%20Plumbers%202023%20-%20Krzysztof%20Kozlowski.pdf
> >>
> >
> > Yes, although I am moving hooks to soc-tools repo
> >
> > https://web.git.kernel.org/pub/scm/linux/kernel/git/soc/soc-tools.git
>
> And second problem is that why you did not fix it after report from Mark
> on next? Patches you sent for current cycle must stay for at least one
> day in the next, prior sending, so you receive at least some feedback.
> Only then you send the pull request.

Sorry. I missed mark's email since email filter wrong move to wrong folder.
and have not cc imx mail list.

Frank

>
> Best regards,
> Krzysztof
