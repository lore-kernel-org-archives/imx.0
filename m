Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011039.outbound.protection.outlook.com [40.107.130.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7511C433BD6
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 14:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212116; cv=fail; b=nOgJnN/LT3ojCpU2ZDBJoSemLhz0SQWxptRySfEicQLnhR7PAhiG8kEFSKO9KWJDHcLVmsDT5VjwJOHZAdSmNc6yRNT6jkrbmDYN+sckXGNwexxTVnedv2aqIdCzE2DFyuiyQAMhKNOmpcDSLIpIpUlui23FpVzXQuEr6VHik4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212116; c=relaxed/simple;
	bh=iSuOU+DlVghw8zq5ubRLy6/aKXVMPQ+NTCxuwkCV2I8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oeLwbQxBsErpmbD4JPHH742y2/Ed6FSuWQ/tyeI5SXpjVJQp/8ZsaGpuoa/mRWCiPJlTG0I7d3ItZ7uMtKbRIdZxjchFAuh5ISwOOMeTWYp5AfSypB3PZePoPPV/6JfFnzEB/YlHijylUiktbNLiAszDuYIGEgaSBR+UHuSHeIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ra6Q55SV; arc=fail smtp.client-ip=40.107.130.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ra6Q55SV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vu4rSv1z54UoLPlMp5VhpuJMnMOG1PriGmTAN1SYLRyAjPHEs3ZR6rxOmdgJUqf+Hlm119cjfYdJ/9NjX8ZyXfWdYp0uWV3F6K/IoUu0fMZdQ8pog7tbcZASLxrhzqwXVUsMpJ1gE5oRtG5HIoUcJW4MMPaKR3VdyhwCgCqiOKIHsujg6RRJNVjnHiqT62g8Sj361dbtVeAbx/BXDte8KNiwe/b/TwzdhB6uxYzJ3XSjSxaFHw8eugI5+shh+ms7YZv8pomUaoaE1qquQGKYimS9JlhlZVqWBsas+Y0JGHQ42zUEWVUTxVzEwWTHfvqO6IckhCDdGejHRHV3xxgicQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYCAxGGh+Rl2dmb/RT7MiIDoWIPN7JQ99C+D0ZXx0k4=;
 b=iw3LvbKf1L/1sXPG4mRYt/3P3A1WRJnZgdWQVgl7qt+pUjLoSiwOoVeFVyykewrYHh4nAfW433l15FLJy5n26qGGTo2nvfQ+Xoy/qPSxcNY1f8/nQvjmX+oFpP1K/AHqQEhRXS8+vP6WKPa/aajsckuwgXTlluk9wylfpjo+EGzktSDxGu9p8M3ui0RC5Veh19IrnLKPi4RaqPzJJKRT2VgLVMrziJ9SbDUXiafEgGeMOrWDTkWwIiQRt3oWPiS+tjWgqAuTZRZxSV1cr3OZIlYBcHOxMv0MIeozR1AfaRHlv74bybECIg3bDlOD7K7MPBFFeMbo7/Myk59Enq6Q5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYCAxGGh+Rl2dmb/RT7MiIDoWIPN7JQ99C+D0ZXx0k4=;
 b=ra6Q55SViKygEBG8qnnJRHXL3J072e+ox8MOs2JWbQq6i9EY15X09P32F9yOjnhp6UPbJdas07sbhTnCTdUtH6ICRwuKyX7I8hHQv3RJGosagNyVopmPcu1j2/++z29V07YiCSoxrDvPT13qJuGgSicrgZFMc6aZ871E3oLo32VIptMzYUxi3uh4f3Z5CDTEY/tR1y+OkTzq3ZLX+KyWt2o0qBP8s9NPZ8GySC2Twn8LOj8NtOptSRGK6x1oUniffmWDs+tLfV8TNtk04um93so6Q2lZD1+PSKbH9HO8j0uGK/JACICBpTdzVBMmfCaNRlB9SGcBymvkJvQLz1I1ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB8998.eurprd04.prod.outlook.com (2603:10a6:10:2e1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Thu, 16 Jul
 2026 14:28:32 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 14:28:31 +0000
Date: Thu, 16 Jul 2026 09:28:22 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Joy Zou <joy.zou@oss.nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] regulator: pfuze100: add set_suspend_disable for LDO
 ops
Message-ID: <aljqhhhkeqayQ_z7@SMW015318>
References: <20260716-b4-regulator-pf01-v1-0-8c1519d54bd4@oss.nxp.com>
 <20260716-b4-regulator-pf01-v1-2-8c1519d54bd4@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716-b4-regulator-pf01-v1-2-8c1519d54bd4@oss.nxp.com>
X-ClientProxiedBy: SA0PR11CA0147.namprd11.prod.outlook.com
 (2603:10b6:806:131::32) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB8998:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e421857-b1f0-464b-a55d-08dee3468298
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|19092799006|7416014|376014|11063799006|4143699003|56012099006|3023799007|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	AgD82JtY/4yXCmZ1NumcL+2M1sCCvBfYI4MiGkOyKkAjFv9KZ40F6QK8uVK1bEEt7mCD+PMIAU/lIc6CAOFuZWULd0xIyYLQRGrgO0XLfLdz65Hs3xWFCJYlB+kINPOCEFetPgWMf6sjDPo71ItgJJQjGWJtpFMQZ3Lu4P43QKuLTKTvGFeLTY46U/PPCFuMOivWRDVi4t1tYSWNXvJdZGVzUP8OlgRrwrORj5e0gWw02HRyLZ5+ciIVYWyYDHKmwzn5DvimqAH4s+J2TUBzal0CvQWxoWmqYk5Tz6xaCf13z7ryzWtc+MfDhvECKYH7A9ndaqFkX/AD5oBU092yWLYBGDYcfGrh5s82f5FPkGMbGatE/eMwtjbVUF2bic87VJJIZMXB3EathAO+/8GXwHEcrDv5IjnIoohwWl5rWx11ihJXr2tkJm8DPCoODJjaT1AKSAojPDXdCoEm+7abdCmDkeh1ZJEkXi6SEzY+hKPxzYzXlQfZflMSR4A+sHNPXPOalSwrTsIkc4f+S/+MV6hPgWOS6V0UAzBwhyi8cBNbtsGpaMj4K1vsLstObO/91bDMyTegOVCgj0M1WLkNYyVZG1q+oqZ8EtuQ3deVz35KUYhLF33uQ4Jzpqbx7s7n0dAN2VSO/AFgMQM7zin99olqmY8z0k7vRTVolFRRNzs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(19092799006)(7416014)(376014)(11063799006)(4143699003)(56012099006)(3023799007)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JiPMEbO7rGWaQ9ENlir+IM1nZuHYSvOnvbHX8DY+nQ92iBm6oizFmuGCFhWd?=
 =?us-ascii?Q?z+Oks55SkridZQHGpbn5zcYp+lnFI474k08SZa1o4S+xnTF0lD/rVYZgIpmQ?=
 =?us-ascii?Q?hAoGTSyK2dwu9ql3mNFiIcxMaZdJQuOM2KxemyfskMMAZ5b2MwPOH9guHXAu?=
 =?us-ascii?Q?rSPJysVYyHcxMKqeKuEKTzO8+Q9fy3mECgHKcWkC/nimzC6MW7d2twsWFdCQ?=
 =?us-ascii?Q?8PVaWdPghOCtViVYaf1Pd/wVxcAorISuN42cMEmlV8FvyaI1bJJ91r98ifQD?=
 =?us-ascii?Q?JjzG39N7MvBOqMV6awcK6Bw0YYIGJDzWDj1K0NQksRif2tdZ0sD6BAawnlPh?=
 =?us-ascii?Q?VKl+x3kPw1fMqUY3nrr3wwGMMQ5XiOG3u1yJjW7hPvMuLmxIvla7xXqT/zof?=
 =?us-ascii?Q?t/IzBt0wVOueKIf7KwCJLAMjlDaq/UZ+KmpWJdNJ9dLhwfocL3NKejaPjNI8?=
 =?us-ascii?Q?QPsfDiH/rZmhMXbSuxrBoqOVBd9IuubMxoa9Un1oOPOGpkShesEaJYbUs3qx?=
 =?us-ascii?Q?76zdckagSW86C4VKsywJU2oeW6lrtbIMETeRVIH3hJuSV8ZjStCR8uO3BA0q?=
 =?us-ascii?Q?h+86s04dbmS8bnrqef7tLzjL0qaTk6vCLuKfa0eVh6kcit1NKXfzEDkKJLRO?=
 =?us-ascii?Q?LxtD3fRMv0uVw1de3Dy99E98N2d/a3N9ILAhHh0AymvRZLZUhaXtR1GpfkqH?=
 =?us-ascii?Q?kDnj85G+lglDkUzdbLrF/ruWcPGLulJrgt6wfQGzkZbRxdQqdCh7LveXp1t1?=
 =?us-ascii?Q?aRI03j4Dx4Jis+V5n97MdUZ/s3DRmHafIYj1GBJ6JuGBPCoaeX0wxURSOJSH?=
 =?us-ascii?Q?IfQUcjc+Z+DguqfERU/6FxnxgkBu0O5zzSiRzadJHphPxOfF7ww/BklmrWXX?=
 =?us-ascii?Q?+zEJ+VDgFuMUyuvacKxuldYxNWHv616FWIWF5F2BVvUwTwU8QmbgwYGSo7/z?=
 =?us-ascii?Q?0QCTMBnIskxaiL7mCNEokOHIhkyk3t9vkM0xNAmKWZJrn4lVWnX1XmFQ1vHu?=
 =?us-ascii?Q?Lp/kmKZWqdjYcLwoM/qeDL3PDkKZeC1NFbiac595c4/Va5TmRAV1XR/1vXmf?=
 =?us-ascii?Q?MfFW3qsye/ZrhOYkYMiPiNhUrfMwagmbFKxztCyydZDrGWYmUJw3ik7wRMvm?=
 =?us-ascii?Q?DJjrynXdCnxyPwN0TcoKhSYFY/3MMijYasNqcbTnsXkamauVlREQA5A48Opg?=
 =?us-ascii?Q?NTsW1kEKajmCr5ztW6Zufor+M5N5gHhGD4DhR3wUm1tHoR7f0KVd4dMSw7PG?=
 =?us-ascii?Q?bSF6mtR25JAi5AqOfd0Kx2LZAzFMU0qZNrvoNU3e8Dk6QA7BO8HEunbK/pDV?=
 =?us-ascii?Q?1hoMiXtglNAoUYbVJBNNBkUIoLUIcIcV23CmkKNNT9su03sAf9c0Ve5e8Guk?=
 =?us-ascii?Q?FInHqGoPLUgmw9qkEGllEoEhwLZbEF5NOSeNTqEdhF5DNDZ0du5EvJHn7ao7?=
 =?us-ascii?Q?D8gFymOu2w3h2bubJzUtPA/dyvIyLIJB0i1hJMjccixELRO39lkuqvK/qH9O?=
 =?us-ascii?Q?dhrO2O2wF+vGVYnwEnALYsF2z2PLPAaxFQ/sbGZAI2fvmRESHu4GOa9mbaPz?=
 =?us-ascii?Q?LQL0863f/arsWtkzoEoLRopN2n9zjw2Cs2l9GECeqvWFCy1elTyOjDvQWhlR?=
 =?us-ascii?Q?evG+MS20ZC/Qt9XuZp8EXdG0Qc0PU/EKzSuVXh1oJKh57o3ohm9ID388JQ+9?=
 =?us-ascii?Q?0EDc42+ALcLMQvIdBdxBc4gFjthMxZ/xQ+UDspsNHSXd9ba1DU7+OI+hZiAj?=
 =?us-ascii?Q?h4ssxJitXf8FMdihUahadwSIJC4XQrXmGIvgGpjACWsr+ChVyJ/X?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e421857-b1f0-464b-a55d-08dee3468298
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 14:28:31.4779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pcLYQbTbTHCYSY5v3wHMBA+jxoOtKqyNIB42Aj/30EuxvsUjBqs12B8kDN6Hl1V1IbzGTfeO1QfeVWBVa8DMwCwEbwxbG9KtUGf+IOd0405h+6AEv6l0+2FIXNakSWy1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8998

On Thu, Jul 16, 2026 at 11:50:54AM +0800, Joy Zou wrote:
> Add set_suspend_disable callback to pfuze100_ldo_regulator_ops to
> support regulator-off-in-suspend DTS property for VGEN regulators.
> This allows unused LDO regulators to be properly disabled during
> system suspend, reducing power consumption.
>
> Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/regulator/pfuze100-regulator.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/regulator/pfuze100-regulator.c b/drivers/regulator/pfuze100-regulator.c
> index 7d56c22b5e40..e6d3a28baadc 100644
> --- a/drivers/regulator/pfuze100-regulator.c
> +++ b/drivers/regulator/pfuze100-regulator.c
> @@ -158,6 +158,22 @@ static int pfuze100_set_ramp_delay(struct regulator_dev *rdev, int ramp_delay)
>  	return ret;
>  }
>
> +static int pfuze100_set_suspend_disable(struct regulator_dev *rdev)
> +{
> +	struct pfuze_chip *pfuze100 = rdev_get_drvdata(rdev);
> +	int id = rdev_get_id(rdev);
> +
> +	/*
> +	 * Set VGENxSTBY and clear VGENxLPWR so that the LDO output is
> +	 * disabled when the PMIC receives a STANDBY event.
> +	 * EN=1, LPWR=0, STBY=1 results in output Off when STANDBY is asserted.
> +	 */
> +	return regmap_update_bits(pfuze100->regmap,
> +				  pfuze100->regulator_descs[id].stby_reg,
> +				  PFUZE100_VGENxSTBY | PFUZE100_VGENxLPWR,
> +				  PFUZE100_VGENxSTBY);
> +}
> +
>  static const struct regulator_ops pfuze100_ldo_regulator_ops = {
>  	.enable = regulator_enable_regmap,
>  	.disable = regulator_disable_regmap,
> @@ -165,6 +181,7 @@ static const struct regulator_ops pfuze100_ldo_regulator_ops = {
>  	.list_voltage = regulator_list_voltage_linear,
>  	.set_voltage_sel = regulator_set_voltage_sel_regmap,
>  	.get_voltage_sel = regulator_get_voltage_sel_regmap,
> +	.set_suspend_disable = pfuze100_set_suspend_disable,
>  };
>
>  static const struct regulator_ops pfuze100_fixed_regulator_ops = {
>
> --
> 2.34.1
>
>
