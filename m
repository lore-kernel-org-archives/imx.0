Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2067.outbound.protection.outlook.com [40.107.249.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA2386348
	for <imx@lists.linux.dev>; Wed, 15 Jan 2025 15:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736954920; cv=fail; b=jRCZiOWgxB4n80jwF+QitkmJS1nld35U05fqhjcAgBDSP7p0rAo4VDmNhFa8g8oPUjljNn8n2kq6pIS+3PQkSxdKaR0nyJd8GAj4h+RWiqSg/+CEGUsyJKZBCpkbC/335CdjAvuWO0CIy8mSr+xcR171UHB1IQ6ab0PhEdyy3u4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736954920; c=relaxed/simple;
	bh=I+s64oXVStohPwAUPp+Ykig85kiSQrUmUgP/rkRRoqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WKoFUhStNVuhBlbR1fzRfkAWDl2PGJQDQQ0l5vxeFf/MjsTSJqAQbI7J+B7MUUpsgnmvrMzETjf1thrpY2pjFtVp9D+nbh70orlr59zakZCY51r/14MU6tQDCQ1JW6h55/Fg2T3KxbTQ2n9CdvHFADMgOuR/Od+z90Ngi3xFG1g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eVpLsQ2x; arc=fail smtp.client-ip=40.107.249.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eVpLsQ2x"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vtMUyOr990qHNdDEEX7RLAFgFSKvKC2j/VT5hHKsDySqw+xKsXl1k0Fhg6aZQjeDgsza8O9h1bij1FN/dX1NvPXuqU1JP2jGig4X3j+MAz8p95JpJGxLbcJ0BBqhkLLMttVnlZRWwjElRuBfbqYFnvhHigW0ICFOBWF2dRtfeDHJJj9rsguIxQLazS3lk5FxnAv1Bc1Mz5y4t6EUlUC1EA4HEREOajsIRodE7JjuLC/8CeMVGEuPwe80+uRP8oJv/MtMUpdN/ZhJYW1mThnjVb5i7oZvTmH9f1rcOoPpLx/qOH1RKPXdbLpB6iFBwQIcPYKRtZlLNE5AZNAKrwHC4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtisqT7/3AV1gkaVn9oJgIVv9XDKMTf4Sf2L0X1bovo=;
 b=An3qJbEU8ojgGn4nOpI2z8MTgMzqkz9W/aLsOn04G5vhEomzHmmN5OPHiD6Z2gF51imBI6OKT2BIeFnmAihm2xvjJRTWZU3EJRICuIojh7df/TZTO73gJ1RMD76LPWl3KfJZP9tEGpkrG8LrwxPFAZInE5snMsTHgxCfViCZZOnYzmTJY+/YAFhleI9836dVuajOdxpLgLhTg3SnNs8jTJnCT1QnsgKSDOrKoRIlpofJv5QCZpxVBoiWge+M26zSj11bce3iLPFKU6KLbrR9UQPMFFrpM2h99d0Wr7agIxs+V+cuYkgboNEVi2fv2S8KZmH88sNHsjhki+Xz/fYH+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtisqT7/3AV1gkaVn9oJgIVv9XDKMTf4Sf2L0X1bovo=;
 b=eVpLsQ2xDpzUa+eAd2cn0HjcG0FsA1stSwcdRAolVAYWhxUoxX/fnw0eVDj+Sl1Ao/kzcG7YZBEbkj6WRMapjZwq1QqZgcqDh+aPAqwlg6+P9HvUHhyy/dZ3IqQ9oMlLAukRgGj/4IwvqpxFcMQsE9hBDuuAhItHBemn4nYzePN2m8jLsj+wI3n5y1jOUvyz8jWZUIwFXm9ttRAK/jpijBINjl13MnoReJeYK7nc9D3ci5sv3WG6vHMskxy9FRX3I1xy4+mzQZEToN0zs1Zw9pODTgGardisKo8DlG1LRqjWMdl7ua+SloEGG/lSbb66B0tPRgxCq97DGJD4qqV24Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU0PR04MB9393.eurprd04.prod.outlook.com (2603:10a6:10:358::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.12; Wed, 15 Jan
 2025 15:28:35 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 15:28:35 +0000
Date: Wed, 15 Jan 2025 10:28:26 -0500
From: Frank Li <Frank.li@nxp.com>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: Re: [PATCH v5 1/3] arm64: dts: s32g: add I2C[0..2] support for s32g2
 and s32g3
Message-ID: <Z4fUGoC4COf0S6Ru@lizhi-Precision-Tower-5810>
References: <20250113110512.506007-1-ciprianmarian.costea@oss.nxp.com>
 <20250113110512.506007-2-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113110512.506007-2-ciprianmarian.costea@oss.nxp.com>
X-ClientProxiedBy: SJ0PR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::19) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU0PR04MB9393:EE_
X-MS-Office365-Filtering-Correlation-Id: d61c0538-1e36-4041-2c0c-08dd357946fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g2fjrPw3ATMJM+mAHrW9dQ0VinJLMkjVNcnwR0TkxCxzgM88xyv+3OZrGcMx?=
 =?us-ascii?Q?v3BEwMYdQNayDQ7kz1HU918sTZ2KT1hrD/oE3EKtKoYvsU+WawmgyV8kWtUq?=
 =?us-ascii?Q?zbsJmkLRQUsKBTc0JFVpgFqKg68p4Edb76teC+PYoDK2xIEtuEG/pYBuP3HP?=
 =?us-ascii?Q?JEa74jea/0AJaL74XiDe+U81M9ZZPg+yvrqoV98YpDkRMkkBwKcc9hnXlvsT?=
 =?us-ascii?Q?Z7ZFPdBIqN/984s+1ZY+aOyBuFrH05SCZRkf6qww0MUhGbQb90cmsr4DB7vI?=
 =?us-ascii?Q?irwn32xn0AqzopeYKQGy7R+OlPXWLcYqgF6gWMN+4iLpZf9VADIMdgQJalRo?=
 =?us-ascii?Q?rtlTtnxYUd48f/IbSzMK9Y7eOlkW0QwaOnYQ0oyaZsjsMCfPiQ1byPPorOZq?=
 =?us-ascii?Q?bhHlv/SRhx4gGu7zKjpbtKqhWfuluQv5PMKQskl7nCxRf4guFcULxJ2s+xk2?=
 =?us-ascii?Q?P2BqsIEPHbUcVb+OHZfKa4KTYAgzezBp8r1JCeymdZF0PsMjch0JGcZ0Mhy6?=
 =?us-ascii?Q?+EUAeoqOUAytuFmKpYa3P5YAnXzE3LNUZqAAHOfG4ALufv1ANR1UTA/No9Rj?=
 =?us-ascii?Q?Lctv9JptGsfTN0onZIHwbbtl74UMvA1gvQpfVhsVhA4Whb13sLpgvEb5v97E?=
 =?us-ascii?Q?8Ec1U3FExqUPo3t78oVlIsoiSK06V0u7SAWNjlO7wi729XZWrx442VAegXWP?=
 =?us-ascii?Q?W7de6z/S5aNdACzOg1kuGNUaBqBMZ/dxyDkzEksuZMZmdexONvPs+D0jbfSK?=
 =?us-ascii?Q?jVa3KyQS1mseDXEkVZ0ay9tNg+cQVl+tQyM4SqYDuIpRR9fxjilFQlmA/OBp?=
 =?us-ascii?Q?j7bCvun+pGsLVdw9HbV1aoVK79Xz8YKxyI5u84lhJsx8UOq+x8Z5O0sEh8v/?=
 =?us-ascii?Q?TX+Gf6LRlixq8fwoW75Fc6HuYfZNtfXeAm2qapb0YxuI/1mw4bdg8yWV5bB9?=
 =?us-ascii?Q?LbBjFzS7fcP2QgGMqyDP6AvB/mw9/LpnjhKPpBSnh6VV0XZMNwRHjXLXJiiK?=
 =?us-ascii?Q?Q/c8frhLPer4SqTN3Ql4QkoCgjlGtCL2nbcMtQIu2UtAl4LH7W4bGHJTH7JP?=
 =?us-ascii?Q?cbwJ6M3LtwDrchLwHZc9WzmTFBc2Bs35Gu3+JJYYICSHYD4JNUXAHRTLuN5Z?=
 =?us-ascii?Q?ceYn5bTIq44o/AotTAjv90g71ORffLf3PuBE+yRtUhjaNm+QHu4ciHBHdet3?=
 =?us-ascii?Q?kYhBqgS75SobVHZeTMFejECbNR0eS8DZbReEa75y3zWh3YLiBwxY4k8QVxo6?=
 =?us-ascii?Q?cccHIxqwIjJ583cCHRu3Appl+lzt5f1ArxgHEyhzz6QogaDEpLluR/0Wfbkr?=
 =?us-ascii?Q?8Hx5EIpDfuA6TZHQEB9sJeaeGaRpJmEELNCKyV88VxPCFQZOkwsh/j/p79HT?=
 =?us-ascii?Q?WnzC0m4dqdGsogzdyLBPwkvfwcKMJpZsoXIz5I0ElucoVyMYd7taCau8tetm?=
 =?us-ascii?Q?vNe6zeoAq3rBFmbBXeZ141lYP5N9QhHG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Zb2n5uQvrVNsRtx1y6s7HD3h+h3Lqg9obJU2ac0z79fLmNVBLofXT2nt0hn1?=
 =?us-ascii?Q?Doj0qhdlqubAELwXuBXgnQqEdZd8xas2y4pMSa41yshNqwVdEZNZJFpj/X8Z?=
 =?us-ascii?Q?pUte1iqSG9/O2cU2i2+wxBzou5C9KTbhuUkJNkUpz6MjA1uTTnsLhefkdI49?=
 =?us-ascii?Q?n6K1Sc2Pm1mNiefJP9ctJOPreGCkHhNvkrvsVNL/3a5LwkKPBL2MeVGdmSly?=
 =?us-ascii?Q?smWcSZj1X7p/TbnDE02094z1z+vvUWMVBSu5AYF185BTUhr4KGUkHjXk3WsO?=
 =?us-ascii?Q?JU6Yee5WURBsJJhn3CEWxfY1nN0Mx35Ve/wd+yeMzshpDslHIxgmnOAlX7da?=
 =?us-ascii?Q?ljFNONvAfT1ckRaqCTvol4W2+shr40nn9KNxPhh8ET1dvuLKXuRy0t6AdXp1?=
 =?us-ascii?Q?iyDXR8mba/gHPUahIxpSrx2ZrJ7O/2cYCyLIj7RockHHU7SMhZcRjFwQdJME?=
 =?us-ascii?Q?CQAJmAVtxxdZ5rfQeLSTgxuGk+rybnp2A+h1jineeEHV2oRQVSDI+bp1vqRG?=
 =?us-ascii?Q?c38Mz91jWYtMV0mQdyNcYW9cpHgCExejBEEKsip5XynO2O2xzLt4DMj0a55Z?=
 =?us-ascii?Q?wkG7itDWaJNERFIbLc2i6Nxj2jIxq4iLhXRBWW8AhooHKtSbNa/ias6ilwDT?=
 =?us-ascii?Q?X3RtLp4TMzklsrNcKkWJNyp8Ckjv+TiyM3HaYrmdgzQ/JgjNdqV0/oyF/Odg?=
 =?us-ascii?Q?wheAfsNOy8pyP+1f7pJ9jkYLTa6K4MMEyTY4UsXy/y4RIDOwns4hG11CLOQG?=
 =?us-ascii?Q?XrwNVRldkWI7uX8aiB3KjsW3DmfyU+OxtupJQ2i2AgmGvt57fVpXd/7Ost/S?=
 =?us-ascii?Q?mtmEXlTiqs4N0ogqaxgRtSR/lN4Hww4utgoTBC1A5eKeDTVz897b7M2D77bT?=
 =?us-ascii?Q?wfibrZUP4mvgxiIbbdo8TeMKg9cWheVzgv9D3jv5krm6UVsCdF6FcrXUoZ0C?=
 =?us-ascii?Q?dAJkCpJeF3Vuqbu9+fQB2e+sIJfvk7vJOvJHFI91Ld+4yM9ZWO+eTpM2yOY3?=
 =?us-ascii?Q?o1y2aMWQ+1ntJ/4wv1sHkeEQpeo1uTsaDVtlraKcrTZrWjb+TGbhAgWcCFnV?=
 =?us-ascii?Q?XTc2XjtComvro0EFBsc6jt2PMKCsp54xytcOhuYcA9H5tk4gmKfqayKDE8iy?=
 =?us-ascii?Q?0v4X+h8MjF2OPFlMgn+mdBz6mvirB9MJKUa1lxyjKTlHBIsV1gKVA+5tlZJ3?=
 =?us-ascii?Q?+czTvV+Ey2BXvVa1nHXYfU3PfFPvz1iXNmxervC0qRJ7npLWEsZEDafTBJ3m?=
 =?us-ascii?Q?NN7DZsKvhoAbRFEgkw5yMCWL1TJAmu9++DjA78+rOUdM96cszULWH68ToBlZ?=
 =?us-ascii?Q?kT6b+EIcKZwj7VT3uzHeaJHBWArpy9GjxIg6UPSlW7eEgc/1GMzTOCsZIZTC?=
 =?us-ascii?Q?X59nuT65r6hWkvgw7vWP1my0W0uqfqe4WkbQVYNavET6jwHvYK0BYCm8FJC1?=
 =?us-ascii?Q?QklZCSSAk/oHR0KBrPvidz4Hsnl+ads8Q30M2b3/BTt7uof4EsEi0X1gX1VM?=
 =?us-ascii?Q?Y9gsFpv4s8KjJdFjQO00K4SHeUzmUEoAIv02t+n+tZWz0X0Zav8CF/VyU81s?=
 =?us-ascii?Q?a+1MOvnsq/VTM2uFHs0fqstfgkh2QRNSoR2INZMW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d61c0538-1e36-4041-2c0c-08dd357946fc
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 15:28:35.7318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: azy4Wn4PbZHrajnjdAuB/zeEui5KfDO/9vwVed4uU5I6p3DnOcIiuAhh7YyULw7RhsgJh9Qe23bY6fKdbET1ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9393

On Mon, Jan 13, 2025 at 01:05:10PM +0200, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> Add I2C[0..2] for S32G2 and S32G3 SoCs.
>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  arch/arm64/boot/dts/freescale/s32g2.dtsi | 55 ++++++++++++++++++++++
>  arch/arm64/boot/dts/freescale/s32g3.dtsi | 60 ++++++++++++++++++++++++
>  2 files changed, 115 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> index 7be430b78c83..beae4d5cf54e 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -333,6 +333,39 @@ uart1: serial@401cc000 {
>  			status = "disabled";
>  		};
>
> +		i2c0: i2c@401e4000 {
> +			compatible = "nxp,s32g2-i2c";
> +			reg = <0x401e4000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
> +		i2c1: i2c@401e8000 {
> +			compatible = "nxp,s32g2-i2c";
> +			reg = <0x401e8000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
> +		i2c2: i2c@401ec000 {
> +			compatible = "nxp,s32g2-i2c";
> +			reg = <0x401ec000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
>  		uart2: serial@402bc000 {
>  			compatible = "nxp,s32g2-linflexuart",
>  				     "fsl,s32v234-linflexuart";
> @@ -341,6 +374,28 @@ uart2: serial@402bc000 {
>  			status = "disabled";
>  		};
>
> +		i2c3: i2c@402d8000 {
> +			compatible = "nxp,s32g2-i2c";
> +			reg = <0x402d8000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
> +		i2c4: i2c@402dc000 {
> +			compatible = "nxp,s32g2-i2c";
> +			reg = <0x402dc000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
>  		usdhc0: mmc@402f0000 {
>  			compatible = "nxp,s32g2-usdhc";
>  			reg = <0x402f0000 0x1000>;
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> index 6c572ffe37ca..79b38cd8b142 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -390,6 +390,42 @@ uart1: serial@401cc000 {
>  			status = "disabled";
>  		};
>
> +		i2c0: i2c@401e4000 {
> +			compatible = "nxp,s32g3-i2c",
> +				     "nxp,s32g2-i2c";
> +			reg = <0x401e4000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
> +		i2c1: i2c@401e8000 {
> +			compatible = "nxp,s32g3-i2c",
> +				     "nxp,s32g2-i2c";
> +			reg = <0x401e8000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
> +		i2c2: i2c@401ec000 {
> +			compatible = "nxp,s32g3-i2c",
> +				     "nxp,s32g2-i2c";
> +			reg = <0x401ec000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
>  		uart2: serial@402bc000 {
>  			compatible = "nxp,s32g3-linflexuart",
>  				     "fsl,s32v234-linflexuart";
> @@ -398,6 +434,30 @@ uart2: serial@402bc000 {
>  			status = "disabled";
>  		};
>
> +		i2c3: i2c@402d8000 {
> +			compatible = "nxp,s32g3-i2c",
> +				     "nxp,s32g2-i2c";
> +			reg = <0x402d8000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
> +		i2c4: i2c@402dc000 {
> +			compatible = "nxp,s32g3-i2c",
> +				     "nxp,s32g2-i2c";
> +			reg = <0x402dc000 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks 40>;
> +			clock-names = "ipg";
> +			status = "disabled";
> +		};
> +
>  		usdhc0: mmc@402f0000 {
>  			compatible = "nxp,s32g3-usdhc",
>  				     "nxp,s32g2-usdhc";
> --
> 2.45.2
>
