Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013066.outbound.protection.outlook.com [52.101.72.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405CF1E7C23
	for <imx@lists.linux.dev>; Wed, 18 Mar 2026 14:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844225; cv=fail; b=XxYFgLriJbOBMANvdVJg2Nf8LMPOPy2tqxryakiS1FqUXeRfIeBP+OjVd1kiJorDoN76Nxl/v6SHsK5eTR1fH1hpmDYTcwLUHFhwDb/ih0uDWItnbsx1Jhk9znvqjBRmpodxFWCRz/x4tx+aGiNGt9Y4OhUGSzfJXFblwQQFnYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844225; c=relaxed/simple;
	bh=BLW1eywEFvzpaviL7T5xtRe4yTjlNbfeXxQmx8jNDdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kOQkDP7Kh012TbrSPs7PvIubp6YjxJaRclfy+/JFyTxMfGdizud4maP66F/REiUULlJLaaPob4/nNdrP9WRS/Fi1IAsiJhW+RveNdqhYlSe07DXDKToGXO+5wFa/7w1otDUv67Ahq93AyPSAV38VYtxLUXKbSF5TWaRChlwtUNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bFBhqPot; arc=fail smtp.client-ip=52.101.72.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bFBhqPot"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GiW3AUpRFC36SJTGOYMabMM1Tise43slDmuTBZOrfRtVXk3X0PvYSQ+5cpOBILEl6vzorDdG6ZgMYEQG45AAsllMLL9xVQcNFpbL7ISYvklVIF8eMENUvqBLr/lJSvfjKy+C4qrOMV+OG9ivFrMdUfzCIcyrZ35tcmXEVJ2p/wb7y7tvVUZdDJZAMwTHPID0NpsFHSZBPtWmVL33BJzoROgXvOGPhZdhxEdKq+kvx8tmQ1nQ8bp1yHLLxQXaOn3pqv/MsUivA6HH0b7drRlXa0EXZKPoP0HcH18PqqHB6c623VEH41doZIQha9eCFfh99yqbSUyXDO+Afzt4pWqnyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ZL41iJBPbs9Wy97ZOvYimlPOH4hHVHpe1cvl2eXAaE=;
 b=dpn3NF04trBJbIDkbh5GxM8AeA0vSaA9fkj/nsMSeFAklgwrATBAvN8Of9E5z49/GvhtyJX91xbx7R/4wty+WrqvUPxQT2Dxmdm2E92T80l3VwFnL2y3DSdJn/+9IIaNwCb+QBdK2nqwYTkaUIG+KDWdLugH/jGOTw9STYU8xSqrTBIwAVTb3hDBXrEIP9Dkbn5hZ1qISNkvGpMO82V+MJXYLwAU2gjnm0y+dS/K5Usop6S1xKQoob5t6O6L+TfkVerMWB/Nq8UQlxTdbArogvSTbVJtNzfzaKmoyiGN1TkevwB5QQyrKm5LFG/hNoA1mr0SyPaUG6bO1ic7ZLPzAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ZL41iJBPbs9Wy97ZOvYimlPOH4hHVHpe1cvl2eXAaE=;
 b=bFBhqPotxvZU6IUxUST6R+BVW0SNRUHmaEAnei036ieYAo0Wt3rZ40MjoX6AcTz+y+U9l7dXuhVz8c54T4YZpmcraVW90F2JaGrcLlJjUPNgPgF5eqr4AczNrU0gsQb0rT2TRkt8DojhnmZSNlorfHB90tt1sAurMP1uJhxZ6c5oYTlMt7aCzZPjAxxdSt9uPVnL0/1HcTAYChXNvWwEsy1uoTJCMxYKTRcEdq1Qick2JdY3vq4SOXbfaLAaQZGMI03TBKI/AkHt60jhcJR3DXGjjkGA6b5y7pXa0eh8TvCM4/poYv8c4gvVMSQRR6mJJNEnEd0xE5Kqpavt7qYtZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB10383.eurprd04.prod.outlook.com (2603:10a6:150:1df::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 14:30:17 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.021; Wed, 18 Mar 2026
 14:30:18 +0000
Date: Wed, 18 Mar 2026 10:30:11 -0400
From: Frank Li <Frank.li@nxp.com>
To: Haoyu Lu <hechushiguitu666@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-i3c@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: fix missing newline in dev_err messages
Message-ID: <abq282jISZd1xfp9@lizhi-Precision-Tower-5810>
References: <20260317034015.638-1-hechushiguitu666@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317034015.638-1-hechushiguitu666@gmail.com>
X-ClientProxiedBy: SJ0PR03CA0156.namprd03.prod.outlook.com
 (2603:10b6:a03:338::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB10383:EE_
X-MS-Office365-Filtering-Correlation-Id: af8c0f62-8c9a-4936-be56-08de84fae10c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|52116014|1800799024|18002099003|22082099003|56012099003|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	sKpFiZ7Mo2Ze51VQLK4F9In8FH2YjzmrR3+SRrbEaLw6EvLXNHxO5l54kj7c0YQ0pUNOib4l2I4uc471gqhrgunP81HDG8XUgF1jn8B/MsdCFUSuCv+4KkebLylUA+RdheXzZtiEcjs7aBVSgUF1ep+d8cS/kS44QwsJfW+CjFYHcRiFAg9a9l60PLqzYeV6RmLJk+w7DU1kyxyHFS/Uqkj3gX4HvzECGdxPYCuhFCRBSayPJaCuWbd2cgmwYOmmVY5yLLwUNXMWqFvve5Ju+qdyzTTiP2RCqrKy7X8MEmECMlXjCZmQCmWzg0xWzLMfFahd9hJGw0pTz2j8bDf8koZwf5GnK16VaOwMRLEtepUKi+KDOANgMsbIkY87nYM3xseTssjseK4MbcL4xJBnsHA+CAGbHEub6d6TRrXPjhg2lqCsChlVnW4nke1vIqsiI4vIR2DXQ5UZOwZB0xwkD0KKmHN3QJgiAjnYoTquYhBy2VP2Xv6DIza1kbx/Txe3hI/lYEgf2V85hdRnV237C9P4i/fS/MV4M6gqmFFNU78rOXwXQU6moRnV5PchYpL3IqXA3qFq14DqqRPkHlXL5YFUAfbjnf0utL7NBfE+SdGFgrAneC3PIL76gwQcHxdO8SkVRRj2RVLzHlEFGOCQxc4b+dwiP8GnhDi5narRBEMWSOcEByN+LJyjb7X7MNzK5sEA17yj0bdkqrQBs8lpPeLtFijyK1hpaZKqwHtf9qD4Tg0tCoTkd6Xo10FkPxpwX5c7m52V1z9AisR2luhcCAwGd2oFgbxH3LmEglTmXpI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(52116014)(1800799024)(18002099003)(22082099003)(56012099003)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?V3ubUkFmozmwlzPJeZkof2HODPiriQVNVagc+qU+LCDjTBNPKbcrMrI7oPxY?=
 =?us-ascii?Q?ljjUxKnQZJOn2lAPyGMOUrAsgjytnl13y4yMb03d2yY9/ES0gvxQC1owdx1R?=
 =?us-ascii?Q?yBuWgVFTwnSILSkizts8vLlceQgZiJpNZup/Pt7XmGN+Qw4iACsr7auqyyz4?=
 =?us-ascii?Q?j+5ZU/TNjCiOqZBQngU0iYvUWg4ZD9Zw0VUG+swv+MSsze00nJe2iAR1kCOO?=
 =?us-ascii?Q?K7deX8FANDLspBYtwAKC9geGml6OgKAMhK8ZHkqxwGF2buyk49+L0TkRos2b?=
 =?us-ascii?Q?oBT3DRUDNvwwGiI4HtA96IFjcGThTgex4WvLZR31PrbIrmHECI6WZRoocQeM?=
 =?us-ascii?Q?nvcUMRKKGWFsRNaZZqjGfrw/fOA5Rs7EJ4YXe7cwC1QGedPoIDI4N+pBmv44?=
 =?us-ascii?Q?RSLb4xbBAOWOaXloTzHUsHYUxYZMBft3DXKLLXIG3DUfm/tOu3IZeoMVEwDz?=
 =?us-ascii?Q?jbugZOUyfRDMIk53JTUmx33s1NfNeZGsB5Y7GSVu+h4D06QGxUl6dM/lsoys?=
 =?us-ascii?Q?sL9RcbSL5UlZ2K4d93jTBwswjc/smpzzAVTqFNArQ78C/SG1olds6NWKiqw4?=
 =?us-ascii?Q?TVaa9HdX5xnNv3zHQMo99hSsb259yDDUkXgUnB4zLY1fY0dyPsWwU0lXOmaT?=
 =?us-ascii?Q?xhUYgI/4/cGRxJc89lkTF1ZcOKBU8qfpEs6ffDE0/x/f75k3UJMjjh9XWj6s?=
 =?us-ascii?Q?r7fYin2dJWZDACDgyD7V9T6bbv89aoy7A9vBdc/7a5VCKdr8r+XqiTMEkTES?=
 =?us-ascii?Q?t2M2Pny5fASC8znT7rd/n+tW3RVZ6x1iatqcwsZHzu7tjgo8K3Nssubw4x+w?=
 =?us-ascii?Q?hElmMlFu9fUdDctF/lR33clC2FmFF/jc05siudW0Z7n23BCdLy69qMyh0oHT?=
 =?us-ascii?Q?Fhj/wLQHdNPf/SlM4smB+gJtlFGTLnvJx7a40ty6SsIRFFzeJTVAtEy5G0+T?=
 =?us-ascii?Q?pd9L2MmonJbBzfrzRO5qAGsf1D4k8Ej1hDhb++i0IHj/p+mVrte0z+bMlsWg?=
 =?us-ascii?Q?si9UQ59dY11i4LPDB1leyyqlQglJW+wjILn3U49NFLITZCibefkGm+7QulYI?=
 =?us-ascii?Q?RUCXUSeEfOmjlsQbnMA2Q/1VDpjxYzRUOsstpcQBkpRbldG0Xkkpokz+Lf97?=
 =?us-ascii?Q?6NUEOK3048lpsLEgtpUWq6wP6An25BNYvyKCy+S4ei2CO9X7FKRw0MYBt3YV?=
 =?us-ascii?Q?qM024lOOm32WmE/K7bnf0N4t7gg5dBcZFjmvxUOBcNEZNv7XIkQCMDce7rck?=
 =?us-ascii?Q?JOm55IQqjza+jDO66kv6RRpRMfGqQN5aW/dY+A5bI0lf7cTCWRbravNTag1m?=
 =?us-ascii?Q?w/qB1mc+9+zxl6Pl6d/Cxg5NJAcdOPBvGSjx+qQ7DySt4VNpTNxCsZZASx4m?=
 =?us-ascii?Q?ijjjL5KW77ZEY4Hg8hX9k5B7UbHnnYwHFwgeFoQzDwx/BmKdXYdwALY/hdIQ?=
 =?us-ascii?Q?2cQTreNIpBE1+vr/QcgTHyOWHzeKLab/umhigmrwbQNTgK+tqq13QhjsiAyl?=
 =?us-ascii?Q?P5h07Ub5KE3G8dvUJhQCHWaMfia9lD3hCG7S1Vi+/WlVbtUpd8+RYa5OeA9X?=
 =?us-ascii?Q?fWKMTVHHH8R7yyXlewlmcWJ78bXqzzsnZ68cPRatSIWN3Ywd3aX2BoPVWeVQ?=
 =?us-ascii?Q?suZ4arMbDFkzcCSmJjw6pKpr70USdthsgxqEyDV0CCf1KMhwAO7m7HwYkGhv?=
 =?us-ascii?Q?wn02PVzNA50S1pFBifs4BNBZh76Zw9qh0lKNnndqJA5ODfwt?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af8c0f62-8c9a-4936-be56-08de84fae10c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 14:30:18.6947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A+68V7+f3usN38S9ZGOynWrGEo+764qc20G2eAzHQmWMdUK/wp6+xREHT4ytKVf7QDBCYT533huxY7Mk4pKY1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10383

On Tue, Mar 17, 2026 at 11:40:15AM +0800, Haoyu Lu wrote:
> From: "haoyu.lu" <hechushiguitu666@gmail.com>
>
> Add missing newline to dev_err messages in:
> - drivers/i3c/master.c
> - drivers/i3c/master/svc-i3c-master.c
>
> Signed-off-by: haoyu.lu <hechushiguitu666@gmail.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/i3c/master.c                | 2 +-
>  drivers/i3c/master/svc-i3c-master.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> index 9e6be49bebb2..27e93fcf2eba 100644
> --- a/drivers/i3c/master.c
> +++ b/drivers/i3c/master.c
> @@ -2396,7 +2396,7 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
>  	 * DEFSLVS command.
>  	 */
>  	if (boardinfo->base.flags & I2C_CLIENT_TEN) {
> -		dev_err(dev, "I2C device with 10 bit address not supported.");
> +		dev_err(dev, "I2C device with 10 bit address not supported.\n");
>  		return -EOPNOTSUPP;
>  	}
>
> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
> index b84b324e4111..e09a6218bf34 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c
> @@ -1268,7 +1268,7 @@ static int svc_i3c_master_do_daa(struct i3c_master_controller *m)
>  	/* Configure IBI auto-rules */
>  	ret = svc_i3c_update_ibirules(master);
>  	if (ret)
> -		dev_err(master->dev, "Cannot handle such a list of devices");
> +		dev_err(master->dev, "Cannot handle such a list of devices\n");
>
>  rpm_out:
>  	pm_runtime_put_autosuspend(master->dev);
> --
> 2.53.0.windows.1
>
