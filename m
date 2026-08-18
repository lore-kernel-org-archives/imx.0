Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013010.outbound.protection.outlook.com [40.107.162.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D567942903C
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 16:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787070297; cv=fail; b=iyZTXf6mTmpGj7djnmpCnEizgLbj/3FDB3Ni+OZ8mCKq4WFvzt0bD4B5eaYm8OEZW4a9PVZtfJRR51tm+yibwWAivZmbvW6xVQPK3fr6gKIiTn4e9Reo0+q6RGZWxngR6fdrZwR/WKY0NG4o5CNVhxZPbIi3eorq+srxc6jCcbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787070297; c=relaxed/simple;
	bh=xJSzavOH6SfabRZpp0bj9LAAwLXvNi1/y2hP2a+icjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OfH++u0VRUE9iua+tMxdP2VxNBFN99PZHTo/o1S9SR5zgL+knjpQ/tzs/+zoD3GY9mgk8qzg8avUswtqc18MRvh39+tGLE40CE0yabNAE/x4zLjEQwsMx0tssyYILsxaBed/THRtDZ9WGBwuSLm5VmGCsK82PvPXP35/b++GB7k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=K4NBqjWq; arc=fail smtp.client-ip=40.107.162.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="K4NBqjWq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CaSUtE8kAeJeOz1pPsXojkWrKsjW1Us8mAa1zww+4mqM5Eu1cbXM+4obfRUYwhqqvLJXV1G4JU/zQ6ls2fB317qNm0FTPldR+FpaCUsp0V4YZRzl+6/KVnoFB1R2SAZJH+jbdaNzboAxYDEmWaDJd4BXtDfZtbUHgni+7hEQDVrc47ihJltLdfoyDpVK07WNGNQD+RGElmcmp6MgILxV83pr2MFovIsYnMZEYKSGTH8KDE/qsO1+gcGvyOCLlkg8pgEZDajrsdYevVO6wkZg/UbWV/CTiqR0uckjvfuvcLzTBsTEdnTPXlVndYiiV8m6zdY+jhvE0dZ09aRxf43xSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWOh8RTHXjkPqP/CHlYEZ+S/aDn4KEimDkU8VaXgG18=;
 b=gN9CXhl4ijDXeKvXC5b47VVEqhGxDNQnY7NWmE3Hc83VJtkpxCwjAnrJhrPtBIgP7C6l9L4oeaB6eBk0lEFbjRXpqcIO/kg5bMStAiBJ+oJiCAPnYvms80tSU53bplgv7nGfeJ03JddxX6VduOY5eI1euWATvEiFXuSUZOdIy3fNdR39LbGak9le3O5J1ZbcMx4I+JkWDHBErKtd00tmU4LkSKvyc2yDsGCLHDUN+2QqB+fzuY+sSUDhyLbXLrLAiGcI3lGzBwEuc5sFI08fzJn1qObmV5D/NDxUpHUFiJ9vbA90OSfvYQMFNDDtohwYSnFCS8bYx2d5Yx0C+Zz4hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWOh8RTHXjkPqP/CHlYEZ+S/aDn4KEimDkU8VaXgG18=;
 b=K4NBqjWqd4wlpq0GWV5gaSC7ClDkvWqs0pXgU9MI8H61BwBhxFEqCX041N16+cF1v7Y+NVotW48Evz9qecZ/y/YJ5j4gv+ypj+G8nL57yFqZGVAvyyRxmpQ+elpRymu7PjLQ26Ul2YRUN+RjTdkMohex2dwoF7REr9vaRl6q2RZvFsGk/9qkUv88k7CMAPWQ+oZFubT+RnXV/QzeIGtyHO3CLS8YIWBjZ0xggfAHkVqu7mp6yVnfVHLmZGUztCcBc6up0rxLbg6WKd68pg/PeHt21xWBYjiyFB4HuXOaKMvPSHrKyLVwtsftUPMINR6FEXhjpxqGJAtAlruZxvC6XA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB9055.eurprd04.prod.outlook.com (2603:10a6:150:1e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 16:24:50 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.016; Tue, 18 Aug 2026
 16:24:50 +0000
Date: Tue, 18 Aug 2026 11:24:43 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Jiawen Liu <1298662399@qq.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] irqchip: irq-imx-intmux: fix runtime PM cleanup
Message-ID: <aoSHS7OwvNt9-6Ew@SMW015318>
References: <tencent_62C095FCF52245E6900FBA2E4E008042BF08@qq.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_62C095FCF52245E6900FBA2E4E008042BF08@qq.com>
X-ClientProxiedBy: PH8P221CA0049.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB9055:EE_
X-MS-Office365-Filtering-Correlation-Id: 140f7895-75df-4be5-694e-08defd453a28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|376014|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8kxAN10HT+jmP96dJwy9bQ9KlyNhtWjdynKxtnZWFQBYezJ4Y1Bx53KFhKI+WnJr0XqtI9zmxkJnJzbNLLiV5XCTqIMrYYXIjT3wU9GEMk6jjfW1H+KYJPOnPI8s5lrCLMAFuKVQNlzUj5hWhhm6sfvbLSRGzQwTtO+pC5z21PgVF5N/Sc5meWQhERPEqOnt+8beCUV1S8P/Q5JKtH5P0GDHM7Kh3DZ2cpKv8F/fu0GedUAogr18rkzKYr1i+8aywbtUuC5V8RaHNN2dzDSEjfCKgcqbCkHGiQHuuA5pYiHzqrHe4yhc79CzKyqpn1eHYnSQRqjctkrg7cssq14URmZyUfhZvuc5jvS+hDbyF98vq7Ym1+aWbqI0mdgsVz9F9hQgsPb680Ui+vvXPfhLT5i73p3B9btQQNggv3R4invPMGr3Mo3pskPyXI038Tify5jGHyxbqpFK7n/R3AXiLQHljYtutNqK1mkWQ8wAWHxcu/dlFV0bYzdMgAS/dULZX1lLaJkadntTi9a91x5/FDXCqaXV4gFn8uPh72Q+y9fe5tYelbS/aj9UepYWtI3/GDwaj476Jw1oCD+l7lkDsESCG5zg6bBZlmYCjuArheZmkdzKW+qHDwuLBVpDnRIw199cgordkjN9qEKgeC2Dq9w6bR5MViNaJpbfEcPYiQA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(376014)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aQ+OshI7t1iU4h4ZN2fcVUoj38M3LnzpEBbM0i2SvorVeirKyOQnlM/Wqxpq?=
 =?us-ascii?Q?gSGSg0mWrrxfyXHXTMrmKbeZ4NRqp7fUjXFN1AMvzEhd0SXwDusg/t/Jov6f?=
 =?us-ascii?Q?mVj45RxhVR/Xc9kGFBdbjkavHRUokICf3gCp4iL5xkd+XZty06+LJVp+c109?=
 =?us-ascii?Q?fcIx6CdpMYJhDeGwMYx0PPWsiXOapz6E7qUIO29b7DEtLVAd7O1B4Il9uszA?=
 =?us-ascii?Q?4M1R4ZqGbiXPPEJjUFmrUZqcI290vT9DTun6fUr3hjS6afjbnfcuR/qajpCJ?=
 =?us-ascii?Q?Q3oeOTm1x7Gb/ZSPMEKLXVZ5Xqi7nVr/jKOeGVrVnmXPT9G6XCPLpBMVx2FW?=
 =?us-ascii?Q?n3L4IaXs4ZpTu+UjGcP/ighP1b36yTceAWn1JP8zUzjdpgGdmu8kO5Q6XCrv?=
 =?us-ascii?Q?mRy5KCK+gSppj8Ti/At1PV634cO3I7yLGyuZZucNyyy/YaKspY+IccPZgf/v?=
 =?us-ascii?Q?z2RuBpZvk3aGLnUkSusfOxtQ6kpMzdx2ykzLolTUYRPXvGXhF3hI0wVnd7Gh?=
 =?us-ascii?Q?MIcu0k+cCtZMzomERTvENhFF4vQfk/ThIg6kVT1EJCQda+x+BDxmb2m0Ii1Y?=
 =?us-ascii?Q?dOX7AVDVNKRGnmUejvgGuGcR6OSsQybe+vh0Y686938ypkh+1OGMq0SZu64m?=
 =?us-ascii?Q?7v/nBYGG2pWzus8HyF2zI3DSXwqa91t+3u1WG4bcNWYiLJ5jzLZ46z3K4Nrn?=
 =?us-ascii?Q?Jw2PxTeIfPS6KzbxavsQfS+9nmbFF2zfXoTuhwSB2Co6kntXCAqpDtTEKL8J?=
 =?us-ascii?Q?7N+wWih/vOppyAjnPWSuMkFLnZFt+MFp644aACndPJoc1ZW6RCElCvS3TaV9?=
 =?us-ascii?Q?jLXb9r+p9Vf16I5pj+3EOe3QfWMhcEGe8EE1lUOxGXOBRz5RYQ1GFYTW/tnz?=
 =?us-ascii?Q?XzLiiZ4AguIB4c6G3V4/e2lbsfrlmxKkyoDkDI1OnphKH74qrshwFvJS+Kal?=
 =?us-ascii?Q?oJ4pa2xK640tPK99X1jF7FxF+VG7jtWhJ7Qv3AeP6EaaqBe+adSWs1LeMYQI?=
 =?us-ascii?Q?OqBHrlaPmpiCo8kIPQgmS9ZzKBzg8/tOoPASFJgn1pHwVmlg1ibz74wf9G2q?=
 =?us-ascii?Q?MMDB5ASbBlKj1Zy484ayhVcNwwgAGfjnVf6y96p7WuDLyNXT2G94kl3EyZx6?=
 =?us-ascii?Q?unknC+qXZSJIJ+dVF3ii92M1rjS3BKRMZQgAg4DMcaefa1Y5W2pc3zScEu5G?=
 =?us-ascii?Q?RSU3wnk9Q1nsYsgfks8fN0jVnEmZ2OQYU2aGgpOGKmUz3jjwhuRSiLvI5iNz?=
 =?us-ascii?Q?PJN0F66Amm7bEjw+ER/ZZGpZVZyXq1+q4PaCTjmIUyJj7bKUwiih4UbNVfYb?=
 =?us-ascii?Q?aEEAG/Uh5VNbCwVfIdMu8fg/VjjmO/UegoD0YvCIj7UJ+nVHkYpUa1cEcIlE?=
 =?us-ascii?Q?OUoBQA/wcHb9HeDxY/T4UlOB1CwMQI4YO10z6JMNQ8VK+Koodais4+IF7wFL?=
 =?us-ascii?Q?0KJeUGRhyeRJRhmQ7i0YS1a3iP6st+lAbQcE6IqzSRAGZDtqS5QYfYFbzPzU?=
 =?us-ascii?Q?bL3VsURWIV7r6Tg+Qo+Tbaden6dEei9WBu3q8wIVPRmNH7r/NmvH6a+NNYmM?=
 =?us-ascii?Q?GpDtWQxaKWI6dsjlSIic1nqtsB75nKE2h8cjDA6ADBJK9Z9FNFLjWmETQeY2?=
 =?us-ascii?Q?7cXnIYTT2c6wjjeiQQAM8+DYCeNuW0lp/v7enMUueDnk6wvzcPj9C9prhr2J?=
 =?us-ascii?Q?/PZnflz+lfrPuITnfIF5KHDRWkoG0VwrYCNU3C1A1+KGbg9z07ZA2YZW1RC0?=
 =?us-ascii?Q?FpnkEsS3HJSbahdRGSOINZcgQd/vetst4pGpuRhMDENlyNmyTZvW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 140f7895-75df-4be5-694e-08defd453a28
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 16:24:50.6348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dZqp3AW6kUi4PmKUQa+ooyLRFNguXM5a7akv0VQekJParVUrsqv3rjGFuzR/GVSU3R1prVziI5w2UM975RpZJxVAxcMV464tDASqHNJRzgZUc5SfLSHoEkvyzUSrU0gk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9055

On Tue, Aug 18, 2026 at 05:21:08PM +0400, Jiawen Liu wrote:
> Fix imx_intmux_probe lifecycle error path.
>
> Probe enables runtime PM and clock. Failures after clock enable only
> disable clock and leak PM runtime reference/enable. Clk cleanup is
> incomplete because PM runtime state is left enabled/ref held on later
> probe failures.
>
> Balance runtime PM setup on imx-intmux probe failures in
> imx_intmux_probe.
>
> Signed-off-by: jiawen <1298662399@qq.com>
> ---
> diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-intmux.c
> --- a/drivers/irqchip/irq-imx-intmux.c
> +++ b/drivers/irqchip/irq-imx-intmux.c
> @@ -240,6 +240,8 @@
>  	ret = clk_prepare_enable(data->ipg_clk);
>  	if (ret) {
>  		dev_err(&pdev->dev, "failed to enable ipg clk: %d\n", ret);
> +		pm_runtime_put_noidle(&pdev->dev);
> +		pm_runtime_disable(&pdev->dev);


use devm_pm_runtime_enable() to fix this problem.

Frank

>  		return ret;
>  	}
>
> @@ -282,6 +284,8 @@
>  	return 0;
>  out:
>  	clk_disable_unprepare(data->ipg_clk);
> +	pm_runtime_put_noidle(&pdev->dev);
> +	pm_runtime_disable(&pdev->dev);
>  	return ret;
>  }
>
>
>
