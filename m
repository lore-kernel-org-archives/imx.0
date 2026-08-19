Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013000.outbound.protection.outlook.com [40.107.162.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CD83932CD
	for <imx@lists.linux.dev>; Wed, 19 Aug 2026 14:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787149415; cv=fail; b=iczQgIJXiYwUodmY5EBFMXgJoQma+zAM88MLO2n3y92wrOBLIgMoFKqxhMncIHjEHQaOrijXvC7q5J22wcQsKFhXyI0DnbRvG764nUgG6y4+9H4sOsJ4sD3EttaEPoE8bfn8Mu7EVVcCf6uMQ+ZeN5YkCW0gyI9gEx39s3ssCXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787149415; c=relaxed/simple;
	bh=7cwi/3/IoA9gh0+RkWxOz6D08BIdao5+VhlpWlkVsO0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=teOF69ia/1UjJFOYmQjiQL8gguRPmlhfxwMbDeSajA4wjAsyXrJvj9qVJCFHqTbd91DwmvPzeIyCK00VMFvNtnCHcuCMn+4hZYr0WcEEmVwvcIhy83iIIt6QNT2GWDmTznEnNaX9pipAtzPDZzW+RnBbrq1tOXRwBvwJZbqgbDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xrGrOYtY; arc=fail smtp.client-ip=40.107.162.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xrGrOYtY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SyVfDxJEFJICN66K6W9uInuvVV/40GLlZSFwzcXxuojrTxrDlM/meO0Qo6QtIijg+xppImoUJFT+1iIEtyyWgttJzFwtiwFGqmdWJHsSovNDkSRvM/10kKjvr+0ES3s7GQ0BL+J9k2NltNwodXuJYoUaso1xqjsCFhJepB5JdhA5Xv57AyRZGpcOK3Gw7N4cGpC/0EKBchiWGqN60yZTTvW1gJFXKpoJoxwkIjTp9QpH2eNPb79VvjpkJzKaRyUzFDyk+GyQYKIslTFSZgewR+PMhiQieuKfWj44U1XEEB7S28ms2suoMiqkpRi9w8wK7tpLpFbltyKCMG1/tw13Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jN/aVt4/RUk+rr7AapsJxJCx1opqdGclATUCuJJbznc=;
 b=aBmvGTS/PuqcSItArbb2LNF22zTfqize7wNfidKv/nHoM2E32xy3EZFQxOz7O6d0GGZndbV5CAFfQN4cKOiUtgL8FHbH6YQv+MBkmdT7MTCHv0fbHuG0Wapl5mydxcqU/b8hhakH3z9S5NLJkq/0mxM+VrKTK5fa/UIUy50Z+Kny3IRyPNby69lVHEDc8iflZHK7Cu3hS8FSduwMNoGgTgvmAPW20EIR5oazoHU2hi8LdkT9Cso+OvKI4TrPNo2sgxNdXTdZjh3XlWcoFRmzG9wBvtNyFJm8hG36gcnn09wmQ/FnewSe0Ekqf5Be4XwXK80yI0Kge0hPnsieKNm6Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jN/aVt4/RUk+rr7AapsJxJCx1opqdGclATUCuJJbznc=;
 b=xrGrOYtYZQ4XwfYQwEd8weV1THzTLTbj2uEFfyq9Vx+ELseBOnnrEUIGYgA/2kirSjM1JL31PubEfvvUex9g+z6AGM9cg4yzItalNVvtyzSyn2SuHH38QxqSeRGnkO3qL+/liuQAeviZAUvucWeHCVf40pdyr+DaBRCTQNsQlrOQwC7fGWtwpfQvA75ICaydNuMvaiLnj0IxoO5kftasm/r+xkdzIiUH7jio+9gDONsv24cPCuhHp5+dyM0GzqIWUAamZldtNZzpfbBS+FQQUvPJoYsLTMBHC5T9CwCNBRJTp5lFvGaQQAUBucWAe4F8kVuBvHCnM2hJ47Lq4qk92A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10246.eurprd04.prod.outlook.com (2603:10a6:150:1be::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 14:23:28 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 14:23:28 +0000
Date: Wed, 19 Aug 2026 09:23:19 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Zhipeng.wang_1@oss.nxp.com
Cc: Thomas Gleixner <tglx@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jindong Yue <jindong.yue@nxp.com>, xuegang.liu@nxp.com,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/5] genirq/irqdomain: Add
 devm_irq_domain_create_linear()
Message-ID: <aoW8V84mQ7UZhpaC@SMW015318>
References: <20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com>
 <20260819090543.585131-2-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819090543.585131-2-Zhipeng.wang_1@oss.nxp.com>
X-ClientProxiedBy: PH8PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10246:EE_
X-MS-Office365-Filtering-Correlation-Id: 9070dad3-a33b-435e-dd22-08defdfd6fb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|1800799024|23010399003|10067099003|56012099006|4143699003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	OjCbS5tWSlS7eNmDMnTT+FNPYp/z30ffZq2EL92uF7dkIZFvuaatTvNtb/9QT3kQerGuXanGVT19yEqcdWCgx7hMNVLrEKn1JU4B4o1sdRq1R+1Wp3YUGd30zYTu3gE0eT8p1URDdvdmU2lPVPThiypdIY1/Sfd8S1KTYAzKet6Z3vonNq0YuCrrNhw6PVfUSHszuZ/GOgK20E35I2lk2RUOxRRqnLG8/Z2a56tfoWQOLRar2HCVepvfF8ae8J6DBuWNwCDGWwAOxoOZj+ne2ysscQj85xEV+rt7SnqYlxD4z52/Jv5zM/6Y0DNZ/ju2V9RfeLPU/dA47BCDdfZuDHfNHj19MxCiwBx7tb2YvEvqWKeQw2OlvwKwKBFXtsQ7sYnKtfqxn5kEJgJfTVKe7UuuYDShuEV3CjD4rOORa5C/9qbJvrjUssznbujSImfW4NCtW8AXfBUMSRGGpF+DTBvrPc3AeblM/pCy+Rn0M/du3rDB1jCFyxntp8fbR9FC2NiFWxnRKed2757jMAGOR1cKTRNmmVHrjQ7qsEwod8fQpz1JtwnGhGZa+DhZIdGNVQqnZrBIA/lVw3oZp83tDmAkHAKhobKHhC3zNpdIv0cy5/Gx5GH6MZkGouG+UD5bbp5Z6yKCanVPhA50LXWjJLyGqd5w4UQ6xTr7zYSNUBs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fhKbb5YLw8MfdYsdPmQV0DrfAETefoRqQPUb/FP00Vp70LWcXov400L9fwVQ?=
 =?us-ascii?Q?YUKxpVHmEY122zubk8MEHfS8mkITDE7di8VKWN17x/CEqVwRwYFppwYmwRmG?=
 =?us-ascii?Q?IufVxPSpehYsKZtjmZZcpua8slwpbAEOKjnXr9vspuhinuIXvNOlOm+9rlln?=
 =?us-ascii?Q?Fp3uiu7pErD6PyKGBViPy/F8R5+Bc2Ogw8lZgcS7Aprq1NZkErI7OIMKrrJK?=
 =?us-ascii?Q?UHqYfFes1+rP3m8q+EWO3A2gzMXbnQb+qZRM4RqpE0FFuQf+3OxCplhq+XI7?=
 =?us-ascii?Q?KZd4aiDPxbegQG97NtxXcxNn7wXX1+La01Cx33yyNwnf60WXBY940ao17osc?=
 =?us-ascii?Q?R3tvbq3tNBFMZR2RmoO2Pq4mecj6ZBC5WOyzzXiYTIDdoHAtbj6jq/mgKrGn?=
 =?us-ascii?Q?ZrJxC/GUkt/6w44cMBlufgJrj4N/XADsjjH1Fhgpy0RwRStU2rg9G/e1pJdp?=
 =?us-ascii?Q?Ck4Ena/mbCeLTwJFDwUX0h6ljwdw5hGTc1xQZO8hGYnoq1SDxFviMoL/e5HF?=
 =?us-ascii?Q?g+16roYGGN+5sXPvNMO2NBxBz5hZesEIPK/CzggNXzQmip7tEkbSdNTD6w01?=
 =?us-ascii?Q?zW2ZKO1CsHmnYxl4jAX2BhvNmdGsJYraA3yzx9ZyVXwdVvgqEk9b2hiz+twF?=
 =?us-ascii?Q?7P6ViZtACx7bpzprmB/JRjXwcbr+p9Br8lWxbIw4acRtoCOj29YlqX9nf8r3?=
 =?us-ascii?Q?9hPRp63eNsqCHkZJSGk8cWOYVOn/5EodLpZbWkMDhXhNUyyfGH68aYQ1tQkD?=
 =?us-ascii?Q?oKYvqqZLLZCeqJaBv+oDBMOqFK0V3a/UQrEMZMw7bD7BfIX6RO2h7o+iBpfR?=
 =?us-ascii?Q?47dKd8sSF/LgBbe1P+zMBBnFjdV45XvrmR9GrgTDpQYkhX8wiUwYBNR37Kzb?=
 =?us-ascii?Q?OmGtCOppjsN4FID1KzYV4NmfMTJlhm/Qaxi99iODMd9q0QPLlMg14dv4hsiI?=
 =?us-ascii?Q?61yNXx06+8ALN1akR6s2ANGe7ZigMksv9DxRC9xA61XyoYrDT3ZbjH5+QQpx?=
 =?us-ascii?Q?bv+q7Y3NJSGSGi0Zr1QWl2AigGt2/fe9DODw/7nLlHLY7nc897cml5nJ+q/A?=
 =?us-ascii?Q?PyR/KQRTXUKTdl6iGvpFOoBOvzNlvw+lCgXks0dsH3yiDcWZ2YdStilEU2C1?=
 =?us-ascii?Q?rzVDDn8meMaNrY26yjT31OWqxxTsu3Hm6DDoCyTcNlashf9EYRuXLZ74nxUP?=
 =?us-ascii?Q?vHU6eU/7MkJlDzfwsxTVmjhzE1Lvemi09DTKQL2is7Fbxl+JLOvMXNtRqOiC?=
 =?us-ascii?Q?xhEbMrjMHmvAexpCemk2lWq6qIOwZBU3+4qToAfaxLXRRvzE3kp75mCu3weD?=
 =?us-ascii?Q?B86KWY5an0qxb8x/njiJ7L9iQVC1gt3YR+kQBw3z3bQQfvzU4G2qpW4zie+S?=
 =?us-ascii?Q?siQmw7STE4puKHZpaKeZ4Xb9eyXRGhf2z2VkGUHKQkT+X6RN2hzHDBHEk4xV?=
 =?us-ascii?Q?DCLfeESgCWtsh2padGXIi7CHN/7MEaZYouz409Gl1AvBY0K9+5HMP3xNpBoN?=
 =?us-ascii?Q?u/kqJEoEa+uX1Nh8e9+0laVhDwXgxr+HRHM4/Lc1x+gzKRijeJWBqByZMxHX?=
 =?us-ascii?Q?BM0KyDM0+o/rHSmS+LVZTdTfEKtbZ/MKLjd4Cj/95HFyt44zXOud6bk3NjTj?=
 =?us-ascii?Q?IXHpMgiSUPkVKEWcOxt9tvjR5WDgnZri/8ke4eWcpIHrOfT/1faDEmgvJQFW?=
 =?us-ascii?Q?lr8xDa0/iZ9I4lQZdQvKJsIcRJsWABlkcnp6zmuEZlAYYerix3MG4lSDzrMf?=
 =?us-ascii?Q?+xRVecy+uVYLC44kIOt6L5ruGuPoV6x79KaWyo22CoNRwkVRKhPF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9070dad3-a33b-435e-dd22-08defdfd6fb3
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 14:23:27.9371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P58fQ660t7P0wJK+q4jyDQ3MYr1McSRFWuQ9Ul6PHnJlBJ27+7rd7HBwqun9VURQfPV2SSvUCcYgAHQwd3rBapa76/Af3UKPslO8rFWiHpQSi+oW+qlqjPvtjVoTVPc1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10246

On Wed, Aug 19, 2026 at 06:05:39PM +0900, Zhipeng.wang_1@oss.nxp.com wrote:
> From: Zhipeng Wang <zhipeng.wang_1@nxp.com>
>
> irq_domain_create_linear() has no devres-managed counterpart, so every
> driver that wants the domain torn down automatically on unbind has to
> either open-code an irq_domain_info and call
> devm_irq_domain_instantiate() directly, or register a manual devm action.
>
> Add devm_irq_domain_create_linear() as the devres sibling of
> irq_domain_create_linear(): it builds the same linear-revmap
> irq_domain_info and hands it to devm_irq_domain_instantiate(), so the
> domain is removed when the owning device is unbound. The return
> convention matches irq_domain_create_linear() (NULL on failure) so
> existing callers can switch over without changing their error checks.
>
> Suggested-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Zhipeng Wang <zhipeng.wang_1@nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  include/linux/irqdomain.h | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
> index 73c25d40846c..b6b360cb6525 100644
> --- a/include/linux/irqdomain.h
> +++ b/include/linux/irqdomain.h
> @@ -457,6 +457,36 @@ static inline struct irq_domain *irq_domain_create_linear(struct fwnode_handle *
>  	return IS_ERR(d) ? NULL : d;
>  }
>
> +/**
> + * devm_irq_domain_create_linear - Allocate and register a linear revmap
> + *				   irq_domain tied to the device lifetime.
> + * @dev:	Device that owns the domain. The domain is removed via devres
> + *		when the device is unbound.
> + * @fwnode:	pointer to interrupt controller's FW node.
> + * @size:	Number of interrupts in the domain.
> + * @ops:	map/unmap domain callbacks
> + * @host_data:	Controller private data pointer
> + *
> + * Returns: Newly created irq_domain, or NULL on failure.
> + */
> +static inline struct irq_domain *devm_irq_domain_create_linear(struct device *dev,
> +							       struct fwnode_handle *fwnode,
> +							       unsigned int size,
> +							       const struct irq_domain_ops *ops,
> +							       void *host_data)
> +{
> +	const struct irq_domain_info info = {
> +		.fwnode		= fwnode,
> +		.size		= size,
> +		.hwirq_max	= size,
> +		.ops		= ops,
> +		.host_data	= host_data,
> +	};
> +	struct irq_domain *d = devm_irq_domain_instantiate(dev, &info);
> +
> +	return IS_ERR(d) ? NULL : d;
> +}
> +
>  static inline struct irq_domain *irq_domain_create_tree(struct fwnode_handle *fwnode,
>  							const struct irq_domain_ops *ops,
>  							void *host_data)
> --
> 2.34.1
>
>
