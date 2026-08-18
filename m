Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011030.outbound.protection.outlook.com [52.101.70.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5C036B92D
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 19:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787081490; cv=fail; b=J1RPWU6YDHrnErmXOqnWiOlJCSqrEiYMbiRI04TJatajnPNTCqftUSPXyYAoewxnH323G4s/Yudu14+PnYtbHB0++TpjxVU6QRDWAaXEOnnh+sWFwC0s8Dvz0oUFD4udtTGvQfYzeXJ6kYhZqlZ1l8xS2nVfKW4lG1iijAMTB00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787081490; c=relaxed/simple;
	bh=ZNnlaZbgLfMNOFx/EEBBtVIJnUmrZEWRlky554dCJb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cf34dxKZ5GGGw5rpg8l12W7mgESW4LiSfDS/rCNYIQt9wp0dPwR6EkWqpsbWnfih9d4Sa2X1whPwy2NCltz8OsAIv3Svh0yS43cByiNn90UhloT+9wJqnNVi9b/SxTojVUkepHBkqEPoKnOUC5nvOFzxJ0qswec/F9oN870Z1jA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=n9b2fO8r; arc=fail smtp.client-ip=52.101.70.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="n9b2fO8r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZEIyW71VDYYNYpGNY00EdFAaqdox5smEPmCDcbEEoN6AT7mbxCentUECoQMvVaJXG9VI+yglz905kwoNub84bVc9dkZddioCmF03sjP43d95oJ3UM54hXctNpTfSljFchBKnqbhKo3hwD/fqgglgzgwBWi5y1EyrTMSqbZDiX/vSXUzlrMiuWJJsZpMi3egsf5xUwqHhBx32tTGT4uNOmFJYiL86VxuY1FQ7wDEn8cB/fb2gC2YZFpgn1kMn/rbALYXWW6/0nFhBQwsB63uTA2LWgsm5MIvRjwhQ+gfA4vumM3E9jBfkn5hEbgaaEUEUuGAehQEVGnk7YNRQ2wkMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PX37JWAblSscd3ykM1y9c7WD1gkwuSlXLek9rOfYlX0=;
 b=GRVwNZJsoHUu2RTzpTicuqyVE6lwl+uFfiON3iQdDLUx4t0te7WmF+cjKNtDBiDxD2N+GDFpJsBqwWbhM70P+areWZDCT2lVW8LS62DPlQf7N0kkd0Q/xI1m5iAUjKnKZLZGbpqymCEagSnn6GZgxM4MRcPlBT6LscwJ9/SnxPDvvQNHuOP6W3sMsgpNq116ftOkkGh+/hQigMxRTD8dMp+YnniANNAuwL44FGEfWDrUTtXhiYsTOInACLUjgHyX40MedUtSgTKlRehzo0Er0C5qEodPDdo+Q0KuOisHIHbDeF6oTUWiJwv7fGfoHIcJkdGBUrGLMv1pkr3wNJ/NGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PX37JWAblSscd3ykM1y9c7WD1gkwuSlXLek9rOfYlX0=;
 b=n9b2fO8r3WYn3jhKkcswC9BfczCiAcLAaOSdMD0knBJN3bIfxhN6d+cUAnaBqCTSBYkKwimXJEYrccA+mNnO3T+UQlCX3lG+7ij97IgUFWPLvDxqG1WiwbAAuPnAKLpxLvajaclA/DeMKttLZvaGnWOTgSMLtkt5h/35l32C4bNh3l0vmInmbTjOE2dsg41OBfTj3WFIi7xOESurH+B8h61EvH6ZJLnHANHjQiboVBG+iBAprGk06NEzQxz4ieNQSAhmYXN8gfLblzU5TvCVb2T1f07AVqy9DONcsblsLFQiI6T4p4Y4jpbQOEQ3MWfiZrdd8Ivf7RM0YHrdr+iPSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by DU2PR04MB8535.eurprd04.prod.outlook.com (2603:10a6:10:2d6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Tue, 18 Aug
 2026 19:31:26 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 19:31:26 +0000
Date: Tue, 18 Aug 2026 14:31:19 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: broonie@kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	Fabio Estevam <festevam@nabladev.com>
Subject: Re: [PATCH v2 1/2] regulator: pca9450: Use LDO5 low-control enable
 mask
Message-ID: <aoSzB-_AuwMdJmDP@SMW015318>
References: <20260818014059.351152-1-festevam@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260818014059.351152-1-festevam@gmail.com>
X-ClientProxiedBy: SN7PR04CA0015.namprd04.prod.outlook.com
 (2603:10b6:806:f2::20) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|DU2PR04MB8535:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d7e12dc-3f5c-448e-a015-08defd5f4b3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|366016|1800799024|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NtrAu0QYVrd9AeNgfrf0TqwZrAG0excEQrZlStbD1c9rkk97/sQSGEkjBUYcpeLIUyNFILB6rp8e3O5QAtRytBEgnyRjWqjx26kApypiLmGQFdJbcCe7eekGwp7POjZhX+S6lLMoKPDX86t/WtKwh5Vxq3+dDxOqhSZ0pvRY8zleyZmo+CWR5x8ma2UmzNZEre5Zo+PpnZJfpm4C/0SAGZnTTdM2cD9e9nD7mKavp3Z7wW+8aGvqmS9LbuFiVUn00q3nulOgCBMPjsoZ5QhS1UAxfYo2pqMYwpQ84XIuYHaeL1+ig/lccQvaLsRMX71LXmVzb3+16M45DaxywYqkEolgWaovZKdUHARRZm1x2IAkCkOpTEbSRmuSFR2soTW7APXiw6JzRDVQQug1v5pYyOxCG4A88FX6GboacxKWGU+Y8zlwx0O+jLqEe8t9CyDH4xBfziZjY1FiquNHC09SzXkln8Lf+uGf5lSvMdwIC7h08oN63G+vXlI+834hx6vW/lavLioEbqbJqqco78zBvIHosYxDzXjFU56FHliPkjhf7Q9ydLns2CFIcdIg0YbLmIb9PxRq9q/tmELxXYicKWy9OokJ3VEvOz+t5upaAPmJSV+2CTZaJNDtlz3EOzVOeJtjsMbGy1CNC5Cui+FBz97ZSQnx6LxlMtFqVcIjCnw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(366016)(1800799024)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gZap7+VO+x2miz+MJ1RsJ19gxvDTv9gpsFqU7RXB7Yxo/RRwy5b7vWstlc3q?=
 =?us-ascii?Q?CAGykiFQIcMwFin6AJngd3nSMrhKExATsy+QkUgOPzCP8Jw0tMJma6VX1fr/?=
 =?us-ascii?Q?EOMOssteUO/jFGYFmQ5yUwQQOe1Hh8q0chEhXHYmysW2+fbK8Dz63kerijC/?=
 =?us-ascii?Q?7DT743owBm6eZXmXEAe7Fx//bguEjpm+n8oDyJZbZppUtCq0bcGrDhhnRiPl?=
 =?us-ascii?Q?/tN3KclTEpONDZgSSZiZuwMFmCfOER8wJlcE+5qKe4uXozB5apanvAoCOTZ/?=
 =?us-ascii?Q?i9nNfKqubOzmTV5jwyV7Y4VrWPU8kPuimgIO2UsaXTWMm1jIhiik/q0frMca?=
 =?us-ascii?Q?ZC+8BNJ3aOtsVaiC63vcOKo8sjvNMzU8YMP68+CmXUhov77luEvKrncT9FWs?=
 =?us-ascii?Q?F3XkxMRffu2G/7dGrPWNOfQVqxr7VX7QS9/t0UDH4IWB/jrrCHmnej+w//Pa?=
 =?us-ascii?Q?8zZ1DYt/P2s73YNZiHWia+ouFfUyblHhryGB0mU14sRJ8F0+p0SbJKEVvKxk?=
 =?us-ascii?Q?nO75jDlvEfrucqOZeExwmJ0+Lghv0AN1Aluqf+MASwJWr70J/WgGRIRvmM09?=
 =?us-ascii?Q?Ped+KEwjxaz36nRNAQSaUkIny+snJBLTx61mK4vKFOtxCSTsB4l2uzCVZRqO?=
 =?us-ascii?Q?TYD2eG0CCGVM4l1yS6NWM5hV8TQ1rWLFyVjKIGLW3YilgK03dioC0leDWZeB?=
 =?us-ascii?Q?9w2eLphqh5ZgLM8GRfQLX6xrNbdzidtDqysoNO4AYTCvh7jobtguJMyClf1Y?=
 =?us-ascii?Q?6vKVXudImZElaaitQ8G5K+kaW+u+bIY1LKYN5A27lmAge0zORUH3gnQzUW8V?=
 =?us-ascii?Q?UK8205tuj0Ht9FM4gN/O/+mMxWWmhoL4a0ErASB1yE6wZH31WlH5LHQEvQ99?=
 =?us-ascii?Q?Nwg5pZRwR5IIWZF3AOdkGDJhxyMvyxTkNkDG8tKQ8sq/4tTzr1/k7o3vlP9X?=
 =?us-ascii?Q?JFK3i0lvAAqq9i38WrfdauJdo1Kc4IsFembOTwJiKOjzSoOQfSQyougYJrMK?=
 =?us-ascii?Q?pSGrFz+qEPunb7Gs62WzIIk4DWnHwiAObltMaWC18qridoe2rxH5Lp6XvqV1?=
 =?us-ascii?Q?5/S37yQjxpwD26twST+ilLuepiy/1xZldFlb+kWdXMC86oFvDLTSxWGo7uV9?=
 =?us-ascii?Q?P9N+MsHupyFw14zC31fTRUZF5aBmVLjRvtISzVbyAbqoWh1lu1K+GqmoYMIp?=
 =?us-ascii?Q?HiESpFzwcIsvY4twlyed49NrA9EXaJzCqJykzq5dMQc6c9i/YSxzJiqfE4Id?=
 =?us-ascii?Q?lr+nLeU+Y3RjgKCNCKT30JJRbDUpsly8xCjVBU7lZFGCbjp7xLJkCYd7S51E?=
 =?us-ascii?Q?QU6yDzqswUqV+J1IAOS02+DgZuoze7g2wIC5LGQivc/JMYSfjnUEia7XZ/FZ?=
 =?us-ascii?Q?ceoRWvDMaTDB6oHZOBceAO+28gb6wXB/5Tt/r00gyHWDmwnIWclc4rWlPX4F?=
 =?us-ascii?Q?CxfKMSlFbacyyVsvWpdpKpQst5n3U/AlIKRRFykKWL+CkI/or5Rmyeweo+Id?=
 =?us-ascii?Q?ktfpXJrpXzR8Lvb61hocZY0vStHoCMWKqw41LEpdM4da0NWnwhSccKgZWomU?=
 =?us-ascii?Q?jKGxAIxmU6/KjJJQ4zl9ocN/blN6VIiFM0uTIH9Y6bcpYtvl5R6yE89KzuER?=
 =?us-ascii?Q?jpvmuEMoUlEK8mBUER2zy/A+1tL4HcHgou9XrnYHB9Z5deorD1gEW0nVsR28?=
 =?us-ascii?Q?YP3VyidrCFKMoojqm9lxfgtTAHCqp6qIutlL/1HASOQbKVfcd3YCyBzlCX8Z?=
 =?us-ascii?Q?eY0kkV3UfpCMoNVkbK2oEiEb2bE8k+Tx6fuxpfEafdbDRaQPdZCE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d7e12dc-3f5c-448e-a015-08defd5f4b3f
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 19:31:26.2591
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tggw+XHIY4QgOtEja4J/ro/ZJgM3GUdQBb1wciBPmHgrBBIgNLPTrYj+FkF7HGHYeqtHQpvk50n8MImWFv666UURhJoOGt63y6EqhPxk1DxjTzNLpT9Z4m90xDWuTBAM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8535

On Mon, Aug 17, 2026 at 10:40:58PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@nabladev.com>
>
> LDO5 has voltage-selection fields in both LDO5CTRL_L and LDO5CTRL_H,
> selected by the SD_VSEL pin. Its ENMODE field, however, is only in
> LDO5CTRL_L.
>
> The regulator descriptors correctly use LDO5CTRL_L as enable_reg, but
> use the misleading LDO5H_EN_MASK name for enable_mask. Both mask
> definitions have the same value, so this causes no functional problem.
>
> Use LDO5L_EN_MASK in all LDO5 descriptors and remove the unused
> LDO5H_EN_MASK definition.
>
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes since v1:
> - New patch clarifying that the LDO5 ENMODE field is in LDO5CTRL_L.
>
>  drivers/regulator/pca9450-regulator.c | 6 +++---
>  include/linux/regulator/pca9450.h     | 1 -
>  2 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/regulator/pca9450-regulator.c b/drivers/regulator/pca9450-regulator.c
> index c41db70fa052..93d0af7f7eda 100644
> --- a/drivers/regulator/pca9450-regulator.c
> +++ b/drivers/regulator/pca9450-regulator.c
> @@ -621,7 +621,7 @@ static struct pca9450_regulator_desc pca9450a_regulators[] = {
>  			.vsel_reg = PCA9450_REG_LDO5CTRL_H,
>  			.vsel_mask = LDO5HOUT_MASK,
>  			.enable_reg = PCA9450_REG_LDO5CTRL_L,
> -			.enable_mask = LDO5H_EN_MASK,
> +			.enable_mask = LDO5L_EN_MASK,
>  			.owner = THIS_MODULE,
>  		},
>  	},
> @@ -866,7 +866,7 @@ static struct pca9450_regulator_desc pca9450bc_regulators[] = {
>  			.vsel_reg = PCA9450_REG_LDO5CTRL_H,
>  			.vsel_mask = LDO5HOUT_MASK,
>  			.enable_reg = PCA9450_REG_LDO5CTRL_L,
> -			.enable_mask = LDO5H_EN_MASK,
> +			.enable_mask = LDO5L_EN_MASK,
>  			.owner = THIS_MODULE,
>  		},
>  	},
> @@ -1086,7 +1086,7 @@ static struct pca9450_regulator_desc pca9451a_regulators[] = {
>  			.vsel_reg = PCA9450_REG_LDO5CTRL_H,
>  			.vsel_mask = LDO5HOUT_MASK,
>  			.enable_reg = PCA9450_REG_LDO5CTRL_L,
> -			.enable_mask = LDO5H_EN_MASK,
> +			.enable_mask = LDO5L_EN_MASK,
>  			.owner = THIS_MODULE,
>  		},
>  	},
> diff --git a/include/linux/regulator/pca9450.h b/include/linux/regulator/pca9450.h
> index 0df8b3c48082..2aa73624d0b8 100644
> --- a/include/linux/regulator/pca9450.h
> +++ b/include/linux/regulator/pca9450.h
> @@ -210,7 +210,6 @@ enum {
>  #define LDO5L_EN_MASK			0xC0
>  #define LDO5LOUT_MASK			0x0F
>
> -#define LDO5H_EN_MASK			0xC0
>  #define LDO5HOUT_MASK			0x0F
>
>  /* PCA9450_REG_IRQ bits */
> --
> 2.43.0
>
>
