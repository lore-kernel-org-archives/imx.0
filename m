Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2042.outbound.protection.outlook.com [40.107.249.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E221862
	for <imx@lists.linux.dev>; Fri, 16 May 2025 02:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747363829; cv=fail; b=fY3zEX9eG88N3FBNmPoiKCh4ONgfraCOcqV84xvhR4JK1lAP2S2aha4V/8/auejvuE4HkyrJmEudQLp3Sl1jOVs10bpQoKPtFSEgI9UWlQiFYBWUnwsk5vIT+JQ3Kcrsn+3sHOFomBcI6UjATHeJY2KsMygCF5g44OAWSdRa/fw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747363829; c=relaxed/simple;
	bh=5I8G3jL9NlN++5uc92Y2H8eXKjHFFHF9LYvngHzGBn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Eck9jkn+HXMu3nsEAP1PzQuDKtwN8WdsaD7iItR3yID7hVht/DT3PgH1sj7UJC3hgj+f5r8bPIYnsk8pVC9KyOOQlutJkwfpYDmfAWNGaPtHSG7cjCh/4wdwf3LPVFdpyEUA5mfaaZbgCwyHzQ4pBY9S/sgeyB7k6dxnZh+3JE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ExJIO/ab; arc=fail smtp.client-ip=40.107.249.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ExJIO/ab"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gBVedWhCkoqQ7VFkOUfCYaNiq8iRGusR1IiBJZcpq3imOOWRx9GGgso/exzQZ3Vn782GYZPJdGemGjqkhqWCQZ9cT6OZK1UurvpbF95rUPmcAu/h20YLxzcIxcRaAFGh4FVKozoPEXmFKBrXAIK1csgtdI7k3PqLIWJVlHx+DddZG2kiaapHHa7UcplifTPzKKAyGE3Fj8Elm5N3eINKDYLNzr6lsBvCnbSWiI1qyNeq92lzfTGHNDZFfe91Z3eKl/vTolVnt1Xd91gV3PghwCRDvelbn5vKa7CeaHEvhi9DU+6+hFEH6fj1ju0h7o9WvAXNwVFPw1pJe5USt2eOxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DmrXXZjRpatxxHCR59yDRrNOrJGDnA8GKoYHZevF7dI=;
 b=bOtymAZ/4VSv03PFk+BPPFAja1pPQ2dX1JTCNPLJ3RQT1ikfRYU6SOW3QumOKui5iv7+gLGUE2sx0Rjn8vsQHQlcE1LsnuT7c0PfpEQopvSY6CsExbbHcR+mHJ6lCJIKhQioU0ajYbN+L+cp/JSaDwTaA1tGSZ7eie+yGdzpEPAQoP3pfqbzNBy/hh+4kQhHa/HUHjsdQwufnpAOl1X7snSHXiNUnsX8WGcVuRU0Sll2N/J6A9ue3FoFVwmH6nKG6zZkrjvLb8sUJKX4yho1nIUJQ8n85un3vIjYN1dF6sJHPVcJRtpwOX3O2muIx+k/vnwYIfC5YujzvALt++qF0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DmrXXZjRpatxxHCR59yDRrNOrJGDnA8GKoYHZevF7dI=;
 b=ExJIO/abvLjwlsIiqVh9JhpNwwQNJ1zrQ68qreuWcQox3Zx2dC0V6KO8QnwRodymUveBaYyai57cSqY4NFi1rCGL6pi1GYzfNcyy/UmnGgU/rksrBvTeldNd+mCu2nKbIo9KmjOvQQbduowERbDtpKlLIOEUJIR2es6G+fh6kHfkAu1cwE3H2vi6+bWflyMkZ+SKIc9ebZ9inIDyfLmRJwErkdN2IE00wziN+y4FVw1giTzKKNU8ptsfS+tMFCCEbi2PLiEMQu3aVkrf9c+bsN69QcB0TJ/Ji1//qD9ZmwLQtax5W2V1EDZXFF01eJCvh9xVsR60YOmUCYVlI1om/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAXPR04MB9074.eurprd04.prod.outlook.com (2603:10a6:102:227::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 02:50:22 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 02:50:22 +0000
Date: Fri, 16 May 2025 11:59:04 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Yuanjun Gong <ruc_gongyuanjun@163.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Shawn Guo <shawnguo@kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] Add check to ida_alloc()
Message-ID: <20250516035904.GA28759@nxa18884-linux>
References: <20250513123705.3041311-1-ruc_gongyuanjun@163.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513123705.3041311-1-ruc_gongyuanjun@163.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI1PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAXPR04MB9074:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f6bf165-a9f0-42a4-6e23-08dd942466c9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bHfjIveINheM+qet+NJ7AgviVtO2HSfYErhJZuy9iLMDcwuPUgM7dcSWT7m4?=
 =?us-ascii?Q?IEVZgpZGZttmCP8Gir/ST/W2y8QflsX3kOHVA/d2YANEn9RkLr62Ek7m1j73?=
 =?us-ascii?Q?RCIxlUaf9Imw+/iBQQwMboK5Ll4cpD0Qu157jN8JEdj79w/RlO1KL6OiZJjJ?=
 =?us-ascii?Q?zqEoxzNGrm0qCQaJw7gaxVFIQu6ZIYOYdc2JGTD/v8rpell6zSG1T65y3eaY?=
 =?us-ascii?Q?3l+Lj8xr8CKfwT4CnLsVd1dsUoar/SZUQkE3G/A8vl+mCBJmfnJMu7aSLQQx?=
 =?us-ascii?Q?0iCt/4LPUMrvFPfZQJhYH1PFYlph/K+jMI0DkfPOnBAMwAK3G3nkyFnDnMYK?=
 =?us-ascii?Q?QtQeQMMjNvgfTNxaTt5rFymH3gXe4FKLm5oLTERe3Cfni0WSJa2KXmkWswjj?=
 =?us-ascii?Q?GzMUq8h9ga3/5r1GL6puVzxU9YbBpyi0Xdww19WAZ8nhDMO7TMHNjDJE2izj?=
 =?us-ascii?Q?Ohc6EZcUmTpNxoP0l7qtnPF7rT0tPPHvvYf9iEXf8RsWIvrNh4C1SNmtjWJS?=
 =?us-ascii?Q?D7/04bmsYMyFMS+8mKT1HekiHp7MNEclZCvorj33k2bhr7SMkm2jzcQD9epN?=
 =?us-ascii?Q?00rvHEAIARcUkeZj2JpMAfNQdzLW4puWOB9dOC7eCzt22KPNqWu/KeUcJqCh?=
 =?us-ascii?Q?3aQXwo0swWRrD1o5KK75rU3wmhhgjPrO2DzK57ukLM2rLvRr/JLsCsQo9s1N?=
 =?us-ascii?Q?6VUeCq3rYhV4YT6YEZ96j40OkCDqnhoE6JQtOU5aTw4mpDRtvbVF7WacmCWd?=
 =?us-ascii?Q?oOx5zYucwDzL63i1XlB75Ipzk6FpGhDayafG7ekmGolN+1Zu3xxZoweMVVXm?=
 =?us-ascii?Q?4W2xzf0To2pSEPHG5Lx6EU4+kkhZaHoTSNHAuzyBfy6AO80w/0FTearcUTwu?=
 =?us-ascii?Q?68obFDXveXrWJGGq2RZGWAMPIHWgH4htqNQCrW9muwRm+KB5Vlgih1Mlhx3Q?=
 =?us-ascii?Q?hoC1NFAywSAOLR9arJlC67oq9dna19NUi+3yImgdEI21Ct4D6lQOE3nMzxJN?=
 =?us-ascii?Q?2d4K+T2aXg7VTUG5mb+NVwU7WOjZBjg0sELPkVvySGgUP1RNpa8Cfn3+0lKs?=
 =?us-ascii?Q?3YxrBjREdAJEvjHa3xsPJ0JngpuqLSqFDwFC8pPuicheFEpPHSQIdN9XD+g9?=
 =?us-ascii?Q?c2lNhAk6LQ53ylPlmKV7tONCLKMNEB6pUA3xwwOBMSD0Xx9Y5+DLhComib6+?=
 =?us-ascii?Q?mPX/vhEJ+BiAS+Mk8BTu1aRswAlRJRxj1ys4XUu4ELbKwDPBe3S+KgWbBzTM?=
 =?us-ascii?Q?/Eaca0wXGKkq/GfjZ+mB+YIpF0ZFq44jbWvx+FLWj5AAKaViCNFk3uKG1stm?=
 =?us-ascii?Q?cE4SueSC857y3Dz99PMKvHBlu2XpDVAG+y60d23d31wSxX9TwKP85r8oYEGU?=
 =?us-ascii?Q?XPm5qwFeYfbHiGF63kHsehbH2GyiEmg3767jC5vId/y2Jv48nt41AnnS8CH8?=
 =?us-ascii?Q?PauvbMhiCEd37E1jsqgWmYL/vvD+5i4e4HTtjlhni0meAsf7No71Ng=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yUtRoo0ELeK4yWTE+bRAetwgngaiFjBol9jVPLdD/k59dv8XtnGtYQlZpb4H?=
 =?us-ascii?Q?n8UYklS3EubKdI32lpVwusWpXTDP7DLvudNof47LieCVT7c7vvlvUVXpzJEF?=
 =?us-ascii?Q?wdVebTndlnQqdz40yAU1JWECO8ntyl34LtZtlS1AOY3AToqOKiBKuN8u5YEr?=
 =?us-ascii?Q?e+wSk+pRGrrLamxzjMAeFTZJcPxxRsMSLO3StopRl42XH4bcPK093m/1Dg4K?=
 =?us-ascii?Q?jpK5jBu/dkTiM/NxLIWwCVibcK8H8hr+Coje3NloRxQbnhE051OHnfBOWrGs?=
 =?us-ascii?Q?0fo36kuswdbziPH1KDYKXkfrqW67gSEEE9YjlW4r4zRRU94yPWzCuBzzmzGs?=
 =?us-ascii?Q?4xyVIGODHwNt7GQioFwwJDJMsLp8u9/I0ZkGVWvHs4CTC5t/bHxp0oH9QTFN?=
 =?us-ascii?Q?J2IKSSO/rNmUL5pyKFcdHngdC/d2nsjFbPFdycj1GrlnT9gPREOZcPZLnqxA?=
 =?us-ascii?Q?Bh/v/zprbumcacboMXFbsTOJhSRcl2o9C0nNHqXpuwCTaRMU3IQtlsDTyhfl?=
 =?us-ascii?Q?sBexp+d66XsNMd8vlay3Adqzbnn05HnphXmglCDF3FSCFjzHN7zvkGIeofhk?=
 =?us-ascii?Q?UpGQ+RkLItRcs1ovg4G1F02sE3BYrmJcNqNacBO2ci4nTB1zJV94puMls88E?=
 =?us-ascii?Q?1SgXUSaIqR3KfV9+998PcwmRaVDxN8JasrndrTuYAvxTJAahAcEM9h/ITq8B?=
 =?us-ascii?Q?l2QgzwFYqaU2oIUlsg1zFilkh7C37WeNSTSAVSP//rHkJ05JGFtlNe0WnKga?=
 =?us-ascii?Q?6O+WWPLKQ+MWrcsShCFKH7Nh0MvMxLdh4VqhL2c/pyrGP0yCHVl/YXotMc12?=
 =?us-ascii?Q?vN6QH3jatqknLG3Y17IYbEEFG85HvMEmG+Qjcjwl1mLfV34EwRrZeUvHcuQR?=
 =?us-ascii?Q?zhhem7Gws42cAxwmrbNiv8EXIIOIJPnyCOIzyMcQmV2QzLmngp6mMzuQQkJE?=
 =?us-ascii?Q?5CLJJVeN0onxg38sOVsSDu3RNRj/vIWcW19LdL5HyDY0ctQm8uVNpmXQJZPt?=
 =?us-ascii?Q?82KoM4m95LlvdUxiBH8BVXyYgg1zj7iTuVf6YfE2+PKqAdts5SdpO7Z/fkU7?=
 =?us-ascii?Q?tD5wrEn14KW1F98xo4weKPmawCyUV/MUqnzacTECFVT9J3p69PPbsAVZIn8Z?=
 =?us-ascii?Q?7XyFI21NNa125pSSad6/XbPYizI+oLg02J+L1qMRK5e2kY4ORCmi77KaqpVf?=
 =?us-ascii?Q?YtxCgKn58fjPLUk1mgGgdf6azptWvNk8dK8TUQ0IM/RvMMmB9xJZuczFnzG6?=
 =?us-ascii?Q?4Ej9Mbkr2AV5vte4GSOj9rbDGocHs0H7utDpwnQCV24729k9w5r/Luv+lCWd?=
 =?us-ascii?Q?MXZMmE3r/CxCYhKuglUIRqO/EJ4O9P8THK6l251UMxlpqR9Zh+xLMA5Y6v0Q?=
 =?us-ascii?Q?Eq9S1ncX9gnAGae1YbDYgeFuQPmfn99/iVrjBja/AkK9e2BYI9GZ49GKLNPe?=
 =?us-ascii?Q?DRietTAbDx1EoMslXhkTwyptjsM8ituIn1CSA5zHvrAFnDSrRNPPtDuGVIyK?=
 =?us-ascii?Q?pUrc9gDfxYCtcqUv5tUEFJ/c+I4fR+tkTCI0VcHdHn2zojLt3FoIckg3leMG?=
 =?us-ascii?Q?uSr6ckD49gJbzb2UpXwZElwk5WNYOjZTKZQksvDe?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f6bf165-a9f0-42a4-6e23-08dd942466c9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 02:50:22.4006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nkhRAP8WnnNsdyTn0xPgK2ayu1KqIQVrQWnur8N38n+mQGGonVsF5/fJCLJDPiGmhyqDve8HoF9A6AZKPk6RRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9074

On Tue, May 13, 2025 at 08:37:05PM +0800, Yuanjun Gong wrote:
>Check the return value of ida_alloc() in case it fails.
>This is found by a static checker.
>
>Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
>---
> drivers/perf/fsl_imx9_ddr_perf.c | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/drivers/perf/fsl_imx9_ddr_perf.c b/drivers/perf/fsl_imx9_ddr_perf.c
>index 843f163e6c33..86da027405cf 100644
>--- a/drivers/perf/fsl_imx9_ddr_perf.c
>+++ b/drivers/perf/fsl_imx9_ddr_perf.c
>@@ -790,6 +790,9 @@ static int ddr_perf_probe(struct platform_device *pdev)
> 	platform_set_drvdata(pdev, pmu);
> 
> 	pmu->id = ida_alloc(&ddr_ida, GFP_KERNEL);
>+	if (pmu->id < 0)
>+		return -ENOMEM;

I would write this as:
ret = ida_alloc(&ddr_ida, GFP_KERNEL);
if (ret < 0)
    return ret;

pmu->id = ret;

Regards,
Peng

>+
> 	name = devm_kasprintf(&pdev->dev, GFP_KERNEL, DDR_PERF_DEV_NAME "%d", pmu->id);
> 	if (!name) {
> 		ret = -ENOMEM;
>-- 
>2.25.1
>
