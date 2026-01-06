Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013047.outbound.protection.outlook.com [52.101.83.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA43C2DA76C
	for <imx@lists.linux.dev>; Tue,  6 Jan 2026 09:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767692081; cv=fail; b=rRDbZcDsGHjMmy90xEz9UgQO4p19pTn2hKpaZ4AHq4HKBkMNuRjwLxCXthFGw4KFszyYL0ok5W1TsO1SGL/abY5vhbPC5yR+7OZPNQL3u3FBVVnmmi7Gk6/bhGNnhd/18p1BNTv09bP+IAmBzYv7IuOOQIRYO+5oZ+mobKXALuE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767692081; c=relaxed/simple;
	bh=0avpby8JqsKl4k1MJErgh4KxE/NE+ypyid0BMUkmRRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YRkqqcQbVwWOfbSCCCT4lIpxzT/gfizJDCI//Vk42qfu/Sl82wpi6/dP5Ue++QEi3n6hDHVHPmIMkhK8Ur+WWlOqr8X35Tx6hB+GbXpf+MxLXWgo+6EyGG38nYz4/rjOAREpIuC0ERMSyvekgZ9x4xHlpxIgPL4A9qaMq3JcM8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gf3nElXi; arc=fail smtp.client-ip=52.101.83.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gf3nElXi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WtZaPfp8N3tseg/Y05AL9ks8c6r7n1GFTOshV544yo8gexKyJIH6yRkcDtFY0YWZ0GDNQq+YKR3Rg5U/K5tgrAd44rxUL0ViPwb8hzg0Ws7Xll10f7zPUxZwijkK/2xQTSEzCbO0YWq0/udfQRODoSrSZnNAQEQoeTPzYqiZheDz1MvNzjw9xifU5NhzLn86W3MwIXM7gT3nmWfMuJ4pB5Hr7W+Xec6Yc5dJ+9B5n7EG5HuqyKsEwNQhc2bPHYFtHLfKmwDhzAHNv0sb/N25b7jvrHUp70ttV3b/UyvMD8O2dsXWLxwidqdLQPLIf/n1imyj/U/n4Q6XU8FrlCgXeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0avpby8JqsKl4k1MJErgh4KxE/NE+ypyid0BMUkmRRI=;
 b=xi/Rfq2OKexypsgbN1L3af8m71rhTXMe9MB+QFQdEiMVCGLSQfu0WQCoMAkAPuODRjWPGMtigs2D+M/40GZBoStsChcuiiVzAYldEdKRN+s3ItmX4Npha3znOiGFtXpBE8O2z7e7tXBOPZx3I55zR/u4qLuoXG7WLiWum962Gu6+cRRGRdD9L2OvC/Qhv1ChS25RSQE6crAaLcRJZaU/TPm+fKISTwOjfkf+4VIBPq1QxCmERv1Ne5+WNfe+N4C04YBG2IZ3IAdy4wm2/FM6abP1LqVE3ewGR+E2tyMGP1HQUoCF6dMnmFFs9pbavenX5ZhEkGnCFHvawH7aZMM9FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0avpby8JqsKl4k1MJErgh4KxE/NE+ypyid0BMUkmRRI=;
 b=gf3nElXiqXOz3c3WsPKXYac1r4N6pCJ+jmNxT7eUz6ULZ+VToCWrtZf/+k5iCGvTxyN6lDMia+hTH/ySNJTqyNUHq6Hhmo0acqjtPzi8aeNKlDtFPSkIkKrDhumcBH4CENVrbCznlY+SiMPvvmsH+jzVs+LQMYq8C6BAS9aIWrhRbBXsqowGg6qoMD8kd1YzP46C1l1z6GWz9BUXFf9cEaO7+PhBQcS6JMzV7E9BqRMFbNIATvwHiTW9ZYQQ2Mzi3nqUJABVJsfMG8ONFBUvQfMdv24kzb3Zb/rRCPzbo2s0USw7ziQE1KK6vsJvhCEzqoJXXmZ8YBRhw3R4p28TGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by GV1PR04MB10655.eurprd04.prod.outlook.com (2603:10a6:150:207::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 09:34:34 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 09:34:34 +0000
Date: Tue, 6 Jan 2026 17:35:57 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: sebastian.krzyszkowiak@puri.sm
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel@puri.sm,
	Denis Sergeevich <galilley@gmail.com>
Subject: Re: [PATCH 1/6] arm64: dts: imx8mq-librem5: Enable I2C recovery
Message-ID: <aVzXfQtNRRTkISC4@shlinux89>
References: <20260105-l5-dtb-fixes-v1-0-f491881a7fe7@puri.sm>
 <20260105-l5-dtb-fixes-v1-1-f491881a7fe7@puri.sm>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105-l5-dtb-fixes-v1-1-f491881a7fe7@puri.sm>
X-ClientProxiedBy: SG2PR02CA0082.apcprd02.prod.outlook.com
 (2603:1096:4:90::22) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|GV1PR04MB10655:EE_
X-MS-Office365-Filtering-Correlation-Id: fa3810f3-7c2e-41f8-f0d4-08de4d06cd6d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|7416014|376014|52116014|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JOOE+yXwoa7SPTWeS4XeSw8ekmE0QyZylL66qMFgvd2j1oQVCkZ+klQBCDYi?=
 =?us-ascii?Q?TeuYw2YQbxNZhyqwj8R2m+k8Y4I2I8Q5donSv7OXmQP6+q4He7cRv80u1YE1?=
 =?us-ascii?Q?uXOvAVmFN+INzJ3WHgXZpPv+p49vGF7Xm7uXHxhxdu2ThX/aifh7RG86S08W?=
 =?us-ascii?Q?TbhnhwfKfZQ78DK/d7QarEzE3ED/nYxThiOiqDe/FRKlzmaxZ9gKhW5Uxk1Q?=
 =?us-ascii?Q?QFdU+YCwS9t3TvaVWEgTQdcZxgUQ8cTAaPwQJ8ou6f4/fq/pNz3o4ZbXFTPv?=
 =?us-ascii?Q?b3yC9Nz03hjVm47J95aAwT0vvrIfTpeKN0n/G3kxeb047bfY4sFkbPJPxOaR?=
 =?us-ascii?Q?45JPmMa3IbWhrtGQdHJlfRpvPrbH+WvxqmZiZz0dI1TrnnVc7YA/IQfNDDfo?=
 =?us-ascii?Q?Wx5Wweu/uV95sJmoMEhD4O4/pv5U/NnWhEfdZJUqIGg8qoCSerjltlXng6sA?=
 =?us-ascii?Q?mMlfHNSGHIEK7Ev9Y5zS+MYd0D2tRVWd+sG3wlqMopkKqZHEu/L71x1Q5c6b?=
 =?us-ascii?Q?B3XG5EuB1Y+Zp5lwK2USVtLXXqJFYaYREmRsDDXoEyOzardSGJsr8qOhTv8s?=
 =?us-ascii?Q?7LkoC0aExYqrkWfAuszzoupdqwzjxtVe7yMR4XT7j4U9E6+/7keT4zKA8XYJ?=
 =?us-ascii?Q?ldneJmdrNkfvZ16Imxiv5u/mbUEwCl/C3cynDMnHVyBhLh++E8quXiY9Eb2R?=
 =?us-ascii?Q?I7GlDiWtvEyIveGU1Gdp79YAHcRXmxoA1fa9j8XVzsNbkndaOmoLUlStXcll?=
 =?us-ascii?Q?WfrBQ6R0TPkkv8sMRXm2Q2HHqB5wzj5QnnsxJ54QQmMWs2Rjl7yfSn+sdktO?=
 =?us-ascii?Q?ajks6KFm9DfVshFoJE3Uk5TG+8rFSZN0sZuPcaSHH5oXQQrz2UuPRz84eJH1?=
 =?us-ascii?Q?FkiAOYM60Fe1S+av/R2YWqIuXTP620Xg2ZeQFLPoicQaTSwfFb79rfx06uyw?=
 =?us-ascii?Q?vyBPxSf0pIKw+65E6e9WHPbsrKmwSuSmz0Vsaf8CGxaGqNmTGIk1jitfFBsc?=
 =?us-ascii?Q?5ppdumSVp3vOnXnl1nqgU7Uir8WU5j0WsP4Q18GoBiXdUpfYZsg2V+zorfrk?=
 =?us-ascii?Q?aDOBEQjjbjG/jUHYbmwpT1XS74I2g9MIZ8HYykuDNEJsMyEwDOczeJnLAA1A?=
 =?us-ascii?Q?52dGtGuXMADCK3UDd3jY/gGkDTVHVW/eCowbnmEmtU4xaQo6A/9Z2Z9VFfxr?=
 =?us-ascii?Q?RcyKxD8b0WLRohAhgaNVYhacwQLFINLnrQeOjGScaQC3FYHOVtb+daNTZJZX?=
 =?us-ascii?Q?AozofrSfkluqyfI32fnGpbKriUhFZ80fTbcuKS+tcNUa2eX67ZCmIhenMLtu?=
 =?us-ascii?Q?BTLPUQVSL4fYD0I4ncl1su0IBCNnEnzGo0Okk1fFGfVZeJOYWF6Rq2qvfE7y?=
 =?us-ascii?Q?yXZyEP17dpiDxGB5jIHcYNllgM6kF9QROJ56EPkVdZNQnquWTZdx6LhaMqOE?=
 =?us-ascii?Q?IB3y6p2jviNQjWyUzvCtYf9ukx4YOH1IWhgg8DoqlYd1jtOKYwxo/UaBLnZC?=
 =?us-ascii?Q?WJc3YudBVGziMGC93Lmtga/IwgmdcrnjWbUf?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(7416014)(376014)(52116014)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1awu3EnuQN6AjncPgtT+nOvHnNpNKMZLD8Kymmtj/qLqm9Ob3adPY9sR8s8I?=
 =?us-ascii?Q?UY7oT7Cqd//yLrBnSG9JCVp5lJcc6JficXngb7+Tpzwqs0skW54pIo9YxjUd?=
 =?us-ascii?Q?eFvwFOu9EGlnZ6pwvk6LhzcJL+75K7Lm3lWBmLQ7ewjvlrhAg6A5ZssDNhu+?=
 =?us-ascii?Q?qAQ0wyVlMG5lmIRxT+WYsxLboDVNE9SMszLKmzdB38bsT7FtMooMe4VqB6ER?=
 =?us-ascii?Q?1D2yUY68zPOC+D/X0TnOTHQDu0rpXp+XMcEwrM3qVAZOpunjiBu/Iwd6zjz2?=
 =?us-ascii?Q?muLjSOmGf/N8zSZcxRQATdr4SAIsaIkKItL0o0grHaWg2inofDwbrKR7h6s7?=
 =?us-ascii?Q?c0dIOp2ihGt0heSHFoySGIyzGsK4rIRaodq+0tFtGIGafL4gekpPvun+BBBU?=
 =?us-ascii?Q?CWWSXw26YzTULFpGgrhK6wwHqSPZAyw1ZurnWWLNOuqCuydwgHRcMx8bmPK/?=
 =?us-ascii?Q?Q6fLvU20zouVtwKtSAQ4uspA43DJ9SKE3cKw05NAqcqIzJCoUoebCqZx3zyQ?=
 =?us-ascii?Q?x0Chsk5G4BamEVitS0+cj38Sw4tOK0EJtvLlTzt8u6gHYilNZVcsQfrAqqWf?=
 =?us-ascii?Q?/KfVsXosG1Phh3mnbifQDFPqYUWmInc52C+wY2EF/9550vFcGRHpPy/IwNoG?=
 =?us-ascii?Q?RXWYsuYQ85FCew0KEjU72sBNtdvodmzPF4wEjMCIFmCHZhLmTSCpBsiaeciI?=
 =?us-ascii?Q?3FqO4NkNMpJlqUZaRobB1UEQQ3Fhi2AN7USwnxOTa+MOC+iwuvOp3XorFAV6?=
 =?us-ascii?Q?YyHhYnwkUMRqaI4/t5wKVS+tNUiLxQ6lMxBlQo/NiFp0N6hVH9V7KuWY7bdZ?=
 =?us-ascii?Q?an4WkquyEvUYeF2sQOoy5YZz5F8GhwvORjf0Z3kqXCZUsTQVsnzmBDBp1XnQ?=
 =?us-ascii?Q?hDIrViBF336N2PfQCVE9674eKGK2fpOoyj82+ovL12XgwIPRT00Itoe5jyCs?=
 =?us-ascii?Q?QCKZaGAERF4FOH0kBvDEL9+Vk2A3xKrm/q0bRPMxNBkXcWWtCkv6uS11uD0K?=
 =?us-ascii?Q?XHn8W0FM4N201Nn37r35sgcNR4jA3LTMm7V+Vmhd3w2ZAtKvbuEC/XKkmZpw?=
 =?us-ascii?Q?rTbdjCIVnIeypc2YlG666bnDh1m8EzUvJjEYJG4IgVFjdT2hBlOou6da4Wpx?=
 =?us-ascii?Q?icfDVih0+NDhHv0LzzV2BzhmJJjGdA2S8egcMTDKto+ZqXjJU3y7v7lMWmH1?=
 =?us-ascii?Q?AmL+FU/3Y6drvDZSPamNjIZFHXV5vI2LfcxF97UqsLm2hWZnKEbUu6qFjmK+?=
 =?us-ascii?Q?svoEt6tqEQ4hN748ddbjiKdwpYpHak6+dVjCDYXhwZBLZ2/FPEX9R1p8RePE?=
 =?us-ascii?Q?3vWO6OspNXAQH7ssu8JQ0Cqhir78ufCk3ZJWf1FyH0ypN7H64XyaCGIspnAx?=
 =?us-ascii?Q?VBzB2Gj2EJFayFkXU1iAMkQZ4G+QrlAVeynkkbt56bHMnnlifPzlTyEI61Xb?=
 =?us-ascii?Q?ToA6ZmLSkCKzFiDrRtGnwNp4q6jQNkCHPhufHMh0PcJ/DFTzCiafaScPgYl+?=
 =?us-ascii?Q?Lwi/X68RnOXorIOGUZlqa1QYzq3EZ2SHBZ28rQGwZCa67gSMLsVEB3TYPMb2?=
 =?us-ascii?Q?Kvxb2tAd9t0PK9E8SD9UT0Lg0lzfVC8IJdnMQcRfvMLO8kRhgFnhlqnxBGkT?=
 =?us-ascii?Q?KnuOklQuO2hy1vPbbhqzDyA202cCxOQMSWvK+OQ8V2YEqJd2Gfa0n6b3sSkm?=
 =?us-ascii?Q?NzEgHb/H8fu52/n1vwSMd3WxDVXd3KE1idEDYry1THpsSiN73VRF8dQCOsbL?=
 =?us-ascii?Q?dGIe2P+Bkg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa3810f3-7c2e-41f8-f0d4-08de4d06cd6d
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 09:34:34.7586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z7V0iA8IxnQa7fGGwoBqH8x4T8aPTF5MTLylPfBlOddTmKW6HXH1aBC/obdJI+/AwxFFzA/yfyjqmn5fgA3gtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10655

On Mon, Jan 05, 2026 at 09:39:38PM +0100, Sebastian Krzyszkowiak via B4 Relay wrote:
>From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
>
>i2c-imx can perform bus recovery by temporarily switching I2C pins
>into GPIO mode. To do so, it needs GPIO and pinctrl handles to be
>provided in the device tree.
>
>Suggested-by: Denis Sergeevich <galilley@gmail.com>
>Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
