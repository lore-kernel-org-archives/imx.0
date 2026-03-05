Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010064.outbound.protection.outlook.com [52.101.69.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7E23B5317
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 17:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772732651; cv=fail; b=uhUEDpI6TOvmyFJWR2NOHx3zRlOlT/KMgbn2NUDnk4EOnB2TRyIb8h/AAUBu8FxalU4Zud1wmfkDZtuMJkjWt2izN5ftKhTYbpSphKX6VIhwOU306JhpBlBFLPUyO9wKDvRNeMS9oEekRFIBvqQxMA359wldQP7z91eCZUQlw1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772732651; c=relaxed/simple;
	bh=AMPsz3U/kbf4mleyjJxljdgyPVeHubobyYbVTHwGctA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=EwjLDIM+5tg8mc+DmJMkztE++ICMPSgIw3l/xZOjUkVLEhCR/2d2Zze/3+YEUCc7Z4VCv3Ymy5ZYuWv+AvKMg/5/G1q2AJAuRVCyD9DzuyJHwYwN72CHmxiKmdP6oNs3rnqYeT15ZDGweyPlZ3vRBhyqjtO0hvX/GEJgYQ+5h6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QohLkZ2Q; arc=fail smtp.client-ip=52.101.69.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QohLkZ2Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yx/bBBZPtqiOB26DjvvdkI/zdE2U1BxsBagiiOdRRH6cJIf/9Qlj73hdc5IkCXIeKeyoc514D7/wNM7/LG6DyrtbeeFvIzQBHmCIBSmr9qOYmF+Qz89HhlEhNtfW82WgksMW+k9NRoq3mG6qDX8i6oCWkjNINOWraUUnNMxxPfuZESDKNQ01LGOTATHef3fOCKF5+kCamTYAV0OnB178VkLeUEEQLiVtXcGunjgu7RJA3jPX+gOsL/o7k3zWBzusGtAEeMFOg7LjtJVno8nxVvG232jhgE2dR7heTFmzKgKIDzWnRCDlgAMk0Iv3TlnyPnM+lcL3L/e+nz5hp9cK+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2mKkCnhsTpe9tnPeISzvMfW6pppENv0GPA0kShDcbJ8=;
 b=MU8d3+WddIVqAph6VMfhWDmPocIH8Wz7AfTURP4XFi+GCgBPIrn6HFN81baMy8fn9s7HVpCFrfDOSSZciY6B8eWgx4d8bszf2FW0oVRVEMkUJycG0e576aioWWf74XZPKZj7LT2gn+Gm48kWGQhhLZy2r6atUMrUdYsYeGfQgRIqxE6k3JzQkPQ2bHpW3Vz8FTEcGmfex9P4bykGPrQ10fbVCVvcK/2z6VxkBJdAbILU54Kl9RIH3deT4R9Du19wMKoYE6kH9igD+q17Mpt2uX5RuudmwTpvG3nDTDzRZnxLEydKX4ZzeRfw7NgIc47BrtGct4JTj0ZuxgtEHZSVnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2mKkCnhsTpe9tnPeISzvMfW6pppENv0GPA0kShDcbJ8=;
 b=QohLkZ2Qil4wgCyHp1bjCJjf7OJXdPpnsUyOahAN20KMN1YwXw+nI8BCL+Fm6dh39mHmdKApRu31Xtia+d9Su6takEWt6nxH9Y1tnJKiOWAIzxZO5WRRFXcSdtxKNcTvnwJTD/gW9DcfjNJbY+giZLsYkPZCHF6+i0qPLQekoYvdUmy2tN4O66CJbz8P8LupKhwTfbcjx4ptyfXTjHV/tXfNIlaXdctAJP8J+Uk3yafg0tm+cx7qz4eIs4LUzt5Rnyl9IA1D5kXGOTM8GdHCDRKckhAqdsT9bR7XCaY6rwJD2W1yw6R048olp1uE1VrqanQACafbg0kGUov+gv6SLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB8PR04MB7034.eurprd04.prod.outlook.com (2603:10a6:10:128::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 17:44:07 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Thu, 5 Mar 2026
 17:44:07 +0000
Date: Thu, 5 Mar 2026 12:43:59 -0500
From: Frank Li <Frank.li@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: imx91: Fix TMU reference
Message-ID: <aanA32O9PTRkRFAc@lizhi-Precision-Tower-5810>
References: <20260305164223.2650908-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305164223.2650908-1-alexander.stein@ew.tq-group.com>
X-ClientProxiedBy: PH8P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB8PR04MB7034:EE_
X-MS-Office365-Filtering-Correlation-Id: d1aed5fd-edf9-4350-acb4-08de7adeccbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|19092799006|366016|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	K2AOohYSPfweL8yk8/GWNz5b36siEmft8LBiCzbszTwusqq1C+yPwYpejXCNK71k4MxW5VTBcrJomaphCdGJC9pKVDM6Icn8kd6AgP2jWr5V5de7+mSWX8Cf2FG6orqlQXjta9gowWUzuU04Zqq+O3B9Y1ZJvN+7tVhQI69l9M+iIDElRaNNJGXa8jrvRYmsimOLJpL/gnjBOqLlsh8rQrBF4ox8Ich1E8MvqAJRQg1aIyVCou2RKj4MsGkb2vpi1hh9Mom18WzjTbskWCMDzdRroqNkv3Iz9aPoE+rFSIXgmMXTEQBadRe8Ab4/fBd1gvIgmmJJEMh1qAcutQZ4jXy1Vk0AhwjsOMU/e3G4SFR0xEm02K9UdeESaO4GZ64yqzddkPDOEIdbG5lyMGVodIPwtWVTQ2uuKDJ43q7vS4MV2xvxIlEdDlVu3rK7VA9HgFoyQDEx3j4Z+rZKT2FVrb7ZUSpzWMHhNGQwv/O/yc3CL3OiqxsL42/7WsP63EfVclg8q/fIHP9GjuuD3w4ZcqqGKy6I0opM1KvxpMxkAAx0Re2Iq5HDXudLvab9ZqQGGoWbajh3XWVTOIF10V+c9nLnNf2jHOKqDcYLfi2GqaBXoNinR2KyXkPHT1k0SvyO97uyFvDN+7HuAaEAzB4ya80Od5iV6U1hPENqKuC5VvEQr02F7hmIrlCc7+yAU6D2rcyJlWuRgujZSQq0+jWhPDhjaoT6dd0RYkvMT5AvoX1kkiptk2nEMl4KuY4iFRJpKcGiH117KznFLPWD8wtjcCGK3mhXP1NWea7DQOa1xi4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(19092799006)(366016)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Uvm2q/MXvGAjeOL4JYdPWvNK+QP2r5YzUCc/mvspQ4tJywrW7SP/sBfM6dQ3?=
 =?us-ascii?Q?+cShF+0XYNF3oeR+1mQQV5FLhfyIoyLYiR6qkO8SeqVecM8IQ7rr9TfQRjVt?=
 =?us-ascii?Q?jRv0iss450w3CTM6PR2J23mDxoG+aiWKbkk5ZFQfNdSwa5HAoaF6esL03ase?=
 =?us-ascii?Q?dJyT1xZEhWZeSatrwE+TNHbACH1k23Do5qWpzECy541b/qqaWQZg7uT+9hU2?=
 =?us-ascii?Q?PA+LuGKApy6ulKkkx/8Jf8U+9L7+ZXB9sgz1asBiOTkwOTuGJbrw0NyaKTak?=
 =?us-ascii?Q?NgajgtqTxnasHt5d4pOzUFBq4JaL4lXwEZbM9bdO4V7ZN39s8U175vnEgy3k?=
 =?us-ascii?Q?2Oga0fOa/Gakdlc73aQ7n75BT2LLomRGvA4/5NbU5N6RmQSSidyFdZN8/lwA?=
 =?us-ascii?Q?FSniCWJu2XIZDVIbGHdt9kwliVm5itUrU5jKQRvVaI0S0lokSGex7IBIlynq?=
 =?us-ascii?Q?zfNb5g1olz1oS7yIXQiwk0Y570TxELhl/GltSoMuuNRH4XRZtR8fU08pjRSQ?=
 =?us-ascii?Q?RFepR8GD7xk5RB+Z2jOC88ModQHBkedkR7DjAUYJa1cPKh6fB6JArgfkhBV/?=
 =?us-ascii?Q?0VRjJ6IeHq/VTqGzdctpnlhH1fIDEwNNdHP1WrQ1hVU/vcwA8jYhBTYlpDwS?=
 =?us-ascii?Q?VhaiegKnwz2ESm5wYO/y7vYM8DsbcjDJmZONjs0K6wb/Gk40ZpURwgcLox1v?=
 =?us-ascii?Q?q3O3g+t+CCGAhNU2EPZMoT+PC0NBE/7RuoFP5uoLrRzPLZ49pE4WwNhLZahu?=
 =?us-ascii?Q?2jK5ZfSMwuH8rVv2jopZA5odJP2VJXpJ4IbpkjA+eHf8itK6qxQI7uprwQ5t?=
 =?us-ascii?Q?0yNkdx5F/6z0p/fnacTz1vgRiQrCVtBUKBjbv1vRp872DjrXjbCWX9QrENBP?=
 =?us-ascii?Q?wywwZZD8VQ8dXyCyJDt0dXn2GAYObx7aUEx8BsVReta3OUu4j76zxdUmaiov?=
 =?us-ascii?Q?iqgk0bgbJS4sSbeho7p/uLXJPGo9Zvu4Pb0KlZIK3x7E7IARFzz+t8sc5K4U?=
 =?us-ascii?Q?8Lzv1khJtOnWh7mOiuobxsqSGMsYTmxm+CStVXhTBNUzFNAVa4r6lOwb3d4T?=
 =?us-ascii?Q?VW9wt4K9QJK0TF4tFhwxFPojNczENlhdtkrO+W9vDOmv1owffMTnGNUYFauU?=
 =?us-ascii?Q?K3SlHp7eJJcs3us5j2ZwPYiVF9nH8dZZ4irSywxtNkwHXwP3zRj2gcAAydMM?=
 =?us-ascii?Q?00V7p0fNuvlyJ1lvh3ztg1djmeHgruTiKZnpPBPLJFXL3/SVZW/QaKQmMxOt?=
 =?us-ascii?Q?6jsFyUFOZcfkOERNZIe3ouwsNDb8UZ88tSKh9Bl28u3cjcqfgTXmZqRHU20k?=
 =?us-ascii?Q?46DDIAO3+GTxOeaLpjxp+DEy2ngytVeaMiWetH6P5z6/vC2YRbf1eWeLjUvj?=
 =?us-ascii?Q?l3S/K0nB0yNG4MgDo9ZfxlV0uKPhiPklO6OgvZu1mmydF9SoLjCaHxeNQekT?=
 =?us-ascii?Q?96dhPU7jijrXZK/SIeCJyFEj3CCooL4up41xxs8rTtqiXxDJpHXGDZXM4S38?=
 =?us-ascii?Q?JTJZSL8ScF+XbXIr06Zdf5Mh5ZiIRtbrg0pmEJBA+js/WAhTgK0c/dyYjc2Z?=
 =?us-ascii?Q?uyN9FJL1/gQcD8PGE7gJEK+XCFcjdS6dhUNqm3SN/2mS17yG/hdzrtPF3H8w?=
 =?us-ascii?Q?1z7VkZVk46q2zxFwEMHW9gUshv5SMNNUcEGCRCTx124xUeDg+dZFYwV2fhml?=
 =?us-ascii?Q?bb2D2usyyZ/yx/E2bmN2kT+RdniTfhhSEGL46szwAEZzTZNU2knCNVV9NXE8?=
 =?us-ascii?Q?M9Yz/QIepw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1aed5fd-edf9-4350-acb4-08de7adeccbd
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 17:44:07.2119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GBiXnz2/ynYKNUwe6V26C2OZWX0kE/n3nYSwoMj6QdwXA9YQSZC8Soyt6wWEUQOT8ARJcPmq4LZHoLc3dgnMJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7034

On Thu, Mar 05, 2026 at 05:42:22PM +0100, Alexander Stein wrote:

subject: Remove TMU's superfluous sensor ID

Frank
> Currently a sensor ID is added to the reference, but
> thermal-sensor@44482000 has #thermal-sensor-cells = <0>, so parsing fails.
> This also has the effect that other hwmon sensors (jc42) fail to probe.
> Fix this by removing the superfluous sensor ID.
>
> Fixes: f0ed0e844452 ("arm64: dts: imx91: Add thermal-sensor and thermal-zone support")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  arch/arm64/boot/dts/freescale/imx91.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx91.dtsi b/arch/arm64/boot/dts/freescale/imx91.dtsi
> index f075592bfc01f..d63569b39bbc5 100644
> --- a/arch/arm64/boot/dts/freescale/imx91.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx91.dtsi
> @@ -11,7 +11,7 @@ thermal-zones {
>  		cpu-thermal {
>  			polling-delay-passive = <250>;
>  			polling-delay = <2000>;
> -			thermal-sensors = <&tmu 0>;
> +			thermal-sensors = <&tmu>;
>
>  			trips {
>  				cpu_alert: cpu-alert {
> --
> 2.43.0
>
