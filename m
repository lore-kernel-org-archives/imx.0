Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2052.outbound.protection.outlook.com [40.107.249.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A8A194A60
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 17:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734630348; cv=fail; b=C/ZLrDiGOzWu9dz89C1NRX2fZVVxan9JqaOLivhMVPFkQfZe7+YF3PKByt/QwIkSqK42b7YGLpFYh1wUzkYFwIgkJm2S5sSw01fUcxJkEQhYZVVukuGh9gDlQntRt8kYkXUD6wQBeH+2S9lp1uaFyqB4uDvtqiSv2ibnLW3pxwg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734630348; c=relaxed/simple;
	bh=9Xv696z7z4Xvb8Q1hjJYY9QL8sj4XYfIGSE1q/G+Y9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=PzMSeUazBnCvSKZJeqcaJmvQJBs9uqGeyyJ/SZgPQKZ6ALaL8O2HHNlt+NueZ7publlqT6vB+/eaZtcgnIcq9M+82qSx0DDJShgJZyWb+O9qjwoqJ3yjwSaW2wj7hITBrR3eLVbSDz/boQBHBhsrCdQLYdLAPu8CdrtrJ0pBC+A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BrHDkNed; arc=fail smtp.client-ip=40.107.249.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BrHDkNed"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O8cyBb8hhMZZW4EJD6bV8O+TQDFJ73/rxEB8mGWWhthQgpVy1A5xGnGQgWgcF8+1ii21dPA7rWnKQnONUtsq2JLXtrHb7Gx6t7XG/RSEZdxBOOW2llv6SwFOc2Oc18FGT/PYE73cI4dP8MnGhaW39yoSYxdzRfV4NDXB9bGrGdIA0Vsh8rSJzPH305lOF4Puw3eqLsAQbkeeVnu/oZKeg3zhLpkyWloiziJl4/BlOfVBxDWmns8M1AQbmElmVOmICHFLYqmCWBkwj2lgN+BKdbL/Ft4hQcs0J3zkGsUlLWnxwbIF3SmUuVZCZoemyYOD3wu4b23qVlPupQ2OynFmCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X98fB0/48m5DlEVzc8CCdzHu4GiXuwt4Wol26QBg+Mw=;
 b=Jxt5YmLRXBXOtKv5N+1AIMtgizC8I0pTg7OesGWygpp6S7UcYVVtLBG4l06Ld+XOlgOPqhG/nJS2beEpYbMTmjq2frqpN8+r8Oudf2f5hVxzz+qJ+T40PEdBra2zSZZCCSec02TWgQhv8FWcUejeosC9a6E5sVwYBQ7s4/LzMXLbUiK7g9eEUbUp/YPg70oNHujzmzYiw/DMK11+aq11lOkQMobtiAhTqpygmC/X6JUyXqmC9py6zLCbKmRV/S/bXRXg7DEgOJPpMHBqpdmZ9uZ6OhVlSJiXeCsxpZntua2VZ3kTbtD+3Z+y/ODnMKMomBsehuGtBN0LeKMqDZNSbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X98fB0/48m5DlEVzc8CCdzHu4GiXuwt4Wol26QBg+Mw=;
 b=BrHDkNedztM2VqpjfkeXLKeOnwZysA3yQwahjpKBF5e/hyY2JeNCqvoPCPPk8wLYmX83Byxt2KUCmYx6/Cb0RXfVo2FQixR9+oZjxEblKVIBpAxx5es7iKutY0GQFZKnuHk6049bseNPJj99aRDb9uN83ywyOM6MWsaohezhCCojFXVnUjxDbSHrVfIaH1x1qyKoRPpEe0HSlJQomGPKzs+HdUPL5BhF9hio1G8Bzyxs8Je3p9hsArYQggSYG6tloDm3KrR2wxfRf4vVOygaVu/f3eIDS5mSUNDittFn9QarF8JQuSpx7yq6upVPbCa9MYDhDva3CjaifLHeiL+cLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7756.eurprd04.prod.outlook.com (2603:10a6:10:1e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Thu, 19 Dec
 2024 17:45:44 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 17:45:44 +0000
Date: Thu, 19 Dec 2024 12:45:36 -0500
From: Frank Li <Frank.li@nxp.com>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 09/10] arm64: dts: imx8mp-skov: fix phy-mode
Message-ID: <Z2RbwCt2zX2GyK8O@lizhi-Precision-Tower-5810>
References: <20241219-skov-dt-updates-v1-0-38bf80dc22df@pengutronix.de>
 <20241219-skov-dt-updates-v1-9-38bf80dc22df@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-skov-dt-updates-v1-9-38bf80dc22df@pengutronix.de>
X-ClientProxiedBy: SJ0PR03CA0251.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7756:EE_
X-MS-Office365-Filtering-Correlation-Id: 731ff5f1-f437-4cc1-5be0-08dd2054f64d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DNHlzbuIvisPPzUbfxLI16s8Ro55Ixg3kkN7apQSmMH/Kvd1FdASeH0YfMKP?=
 =?us-ascii?Q?+mYtK8sr/mt/x9Nbj03G2UfB8Ym7PQAQ6W3HQQ1uT36swoCg9vJtU+ErsQfI?=
 =?us-ascii?Q?bLLAFuClMYWmHNL34Kp+1PlIucZPgvPjmpofmFo/hFz7Jc1YEv5YcCXY0R7i?=
 =?us-ascii?Q?1hZSVNAoaahJAo1xfEesClguLDRoXW1McJWkeqLsJjJzHZrM2ZAygAY8yS+h?=
 =?us-ascii?Q?6oMRs3LNFrrT1HmmryT/Mtq1Y5npD8hWeQoIVe3rIHZZgMNNjq5pxtpe4waD?=
 =?us-ascii?Q?BlMphpJbJ3S7PCAxJflz43r3RQ6Qiy3BdEB7K4Ywwql46bVDKnNDrrk/4Vn+?=
 =?us-ascii?Q?rPPWTMsthqSuq5c8e9GaggKNR8C4EhRgV5+pGcH01Cl6neqFuhWnJycXJddE?=
 =?us-ascii?Q?bjrNpbQvlI5Fd61GKJG16hrjk5hmeFJxTg95K29/623ENISKbLOVN4CW6XcS?=
 =?us-ascii?Q?pGhqWPSZInj5k0WNq6lGZzx/WltZrtn/aK9tWQD3Nw4LvklqyWr87QCm/VJh?=
 =?us-ascii?Q?+OSgS2d2x7V2mPutZOkE/jRXiH9nWdvCrhKnykhJ+tdPNO/R8pesNeBZ1FJm?=
 =?us-ascii?Q?yOQlRG/Q++/ZsKl7z4FadB4Y0aC7F6xg8N4Sc2WE9/zNGOxHr1fTozTga3gm?=
 =?us-ascii?Q?I/EzlIGMG/uQmcWRO1V6jfkPyZcc6CRe0AbAf7HhRM+uLUDEiyCzpuRIr25e?=
 =?us-ascii?Q?AHSS0MCpoDksAGPtOoRzIKPB/0IADY5VOGAhjvOuFndcdNboGarFXNAnCLZr?=
 =?us-ascii?Q?Z40XfMKGDfvHz7BgevzS81/Fbir1AgmPgqeJrh8w/Y8e7SiptFV0OE4Q7pep?=
 =?us-ascii?Q?o8uVNXmHDl8FUeFZlthARXBWM0dYke3gvj6WbqYfGf+cDZoCGdSTnmuTOe3e?=
 =?us-ascii?Q?0Q5009d50KmsqpGtga95qpAXWC4Z73LYq/7CIOcZ1DZSC41/dnkUE2QVCkx1?=
 =?us-ascii?Q?Ssfk5BuIPvQfa+DUB3iurq5QizYU/dtqYmeHhMpMqcxoXqhUXmY18CyQZAQ5?=
 =?us-ascii?Q?9epSVj26dk2mws+QdpMkrEZVE6QkwSLjUb7vtFzduOA5BwTd3KLpHQEbQ6QK?=
 =?us-ascii?Q?tia5+onqRclWQQ4MdIXaUWltLX90Vh62JV1OBk4Ez0TQFQHZ6N076I67j300?=
 =?us-ascii?Q?V3sq0vqX4blHI4sGxeludsAkWLP0nXuUPjco2ci5OOs0vazaOyA/gbkU1Sl2?=
 =?us-ascii?Q?OSNzcZJgDKu8pniexl7Gj5hMPBGYxJgbfGPur6eXmFmtTui4RQgYWG9KWsKj?=
 =?us-ascii?Q?EsY+p1NaPv2sV4kNZBGXyhGu/K0dAhbJ9QNNsL1PLlyzDiZcjQ8e59SuLAoT?=
 =?us-ascii?Q?VgrwTth6Uv/X4CGVsq2Zi6zqNpgwOrD/UDQNOlwAt9KvOUu+C+jvLWJaZ0If?=
 =?us-ascii?Q?vdvQUphABMdjfFdm32ek4q3k7hZh5oD+A7LvVSo+1ZUpkdKAcdGVCspPeMUR?=
 =?us-ascii?Q?osLLl8bPmyLoVg6fpuofp/Ila3YAGMYb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RFt4NyDmL1UbIkW6LT1tfFqg4ecEdfNXTMLxGSMc/77EJrsEmdB2EEWzcbcB?=
 =?us-ascii?Q?Z6OmwQsxxbbjqiBr4mNwqxModCuQ8vtqTPjU+N8n7UEDo2sq8mhynmIjKqnb?=
 =?us-ascii?Q?Kn+q3XFxRNDTpNdZA0uIAh917Jk4qCSgTBYdd+RSR8AKBpmkDiM73N2K1aG9?=
 =?us-ascii?Q?UUr1+ZuVL42OAaE6pE2oLA4uwYN3inhzZ/fbfXiI169IwnTmmE+deMVAGGvl?=
 =?us-ascii?Q?tAo0njPHzzLcN/aCIYMtj6WMYPcrV9cHaKyl+MGsIUMh82zrRjDeIQrZHhGy?=
 =?us-ascii?Q?sPHLVkdDqj/b5a8QZpCap2dnL4Hb+/zZcW5AtGLi+IeGVqMc3XZBTLStXCo1?=
 =?us-ascii?Q?Sw6xl8NO4W5W7nzu3T9U1/B8A72+3YDxdY8VlvyLHgCqSz8nEYgJmquNEXvh?=
 =?us-ascii?Q?JHwCN9BXmeUluyV6LPW7DyCtG8G/072QGkDjsdmqG/K6+wRyJnIIO4onUxeI?=
 =?us-ascii?Q?qL+YjO/V4wFmb9W9GEAdlfPgf0ORuEF/8qOODQ9AB5AWY5NUozfjkeXVbyVs?=
 =?us-ascii?Q?wv1XHYmjxe60pK13RNhupay7bo3Gy+ybndAUsvNbBNnf+WQGNdZ/QpjGStke?=
 =?us-ascii?Q?3WRyioMNtW44YceuzoBQwa5f7YtM89UqCvrJyWqf9ooH7WGMEY/UjaO6U0QK?=
 =?us-ascii?Q?wynh9bxrR3PbRZXk7c/yiH0Ub66jXvHZK4Z4bLXhU/E42xqtrJOiPgpzZ9+h?=
 =?us-ascii?Q?GhlXmyU28ZUT+c/EMMTBjNExmmkFfaAVdqHdb4DmfuWEaK/28lIUBKgZypr8?=
 =?us-ascii?Q?8zEGqk2pzgKRzFDl2ebOmDVMag3ZQ3rMTtddTI3Bk/h10lCC4Z2DNPH2rpfd?=
 =?us-ascii?Q?FjNjky2czI5D9yR3ffIciyaQts8gy+b/Zbh6AiOZ2nTW+2CMYbEK4+W8hVbv?=
 =?us-ascii?Q?HXzxfc0aAykoYx7sQPoCiCSiHzLgnzJJ9J6g+xBF3VgbM82T6tasmQy5JGlF?=
 =?us-ascii?Q?jr3jpRSGXAZFzYHBLvrUCC43kG39w0K75l3FcYW9p55XqqZrXvU/vJQMoaIQ?=
 =?us-ascii?Q?3AuOf6RzcwoHre6UmZbqFvNAjDt3dqS7gY+lWhWK9ioiJPoZXX/rVyyioJp2?=
 =?us-ascii?Q?5tmWINrQkFDWCV9zOwrSrkyGuEwrCGCl+CN69tNsIDWuhVXmee6eReGqdhVA?=
 =?us-ascii?Q?zqZ7prAquL/MMQziMIcGVWa6eGcX6Mwv/ebPjMpASkbrfNZHrDfKgVe/CtXG?=
 =?us-ascii?Q?iVR87mdw0xt3kFa21/P+sv+KyAwvrF1h89mDZL8UIapmKQsHK5HhuRNN2i7W?=
 =?us-ascii?Q?ppjUfseGT+Iheq/rONbcY8gRPsuQ7ov6xjHl3nGZuv+nFUh2DjFFbNehoqwE?=
 =?us-ascii?Q?mZACG1TP/EwZqJExV+d//R6B9d5mAfrXS00dZDNqcTOguysyAKofmTCG3fz3?=
 =?us-ascii?Q?3VLM871JwTbFhO1D7CvAB7XLQkDEJ4W07jMckP2VV3JcGe9T4b6yAyCL3Fg6?=
 =?us-ascii?Q?OBcpcBAFsMBonENEf69AIAQl/xEH46vDgGyVCVWcUo+oXgKJ3l/4v7E6XjZ/?=
 =?us-ascii?Q?QFTG3iM0/FeErxweL58oDDZtkrVU3LODsfOM2go0fE5TQNW7gOdGnf/W9w6Q?=
 =?us-ascii?Q?3Oj5YaKJn3V6hTDZ9aZIId+VT5HEoqUgqd+Pz+kJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 731ff5f1-f437-4cc1-5be0-08dd2054f64d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 17:45:44.0786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L6jc+s+Qc5SlABXcpJihRxNgc4GCuazIiChjfp8QQ6yRBtc5dXTrAXSaFTaz4Gi4fgvtqBuGPQ6qpVJP/LIVgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7756

On Thu, Dec 19, 2024 at 08:25:33AM +0100, Ahmad Fatoum wrote:
> From: Oleksij Rempel <o.rempel@pengutronix.de>
>
> Use rgmii-rxid instead of rgmii-txid. It should have no effect here,
> but rxid is the correct value in our case.

Use rgmii-rxid instead of rgmii-txid because ...

Frank

>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
> index 80d212acc0c3..a683f46fcbab 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
> @@ -215,7 +215,7 @@ adc: adc@0 {
>  &eqos {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_eqos>;
> -	phy-mode = "rgmii-txid";
> +	phy-mode = "rgmii-rxid";
>  	status = "okay";
>
>  	fixed-link {
>
> --
> 2.39.5
>
