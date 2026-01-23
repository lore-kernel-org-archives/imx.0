Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013008.outbound.protection.outlook.com [40.107.162.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2696928BA83
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 15:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769181412; cv=fail; b=Uxz11klpIFEYEkoeo5T4sRLaycxDfkebOcWmvPjJA6iWVLbtClRRezYCHmZX/FWbsLyp8BTPUsv+/VphuQ3u7FVoUTeMl7AZ4ty3yFniXFAGgtXDBMfaIkJu1YJbJ1MoI/qaIhzdBKK1ne0rW3EjkTTA299OZygy/f9WkVFRNr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769181412; c=relaxed/simple;
	bh=bM5aApxfRgtKoW8H/K5ude4NnAzMdKh3y5ObXuO+jJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=a16fbAq1mzYqA4KOwe1Y85Xa/smctws80kOeCdJjjVwnvhZ3e0cobTBtI4Gf7VoMBUNh+B2QAnqmt/7XYBn6ganwPJGIeTEwLKDGfVpzOaXEacli6QCg0tvAJYFcH9Np1ZPaLe135jXvNMM2YeHOGXlrMHTYTnQuJl7JpTiDSZU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kOVcrvEN; arc=fail smtp.client-ip=40.107.162.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kOVcrvEN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pQdOebm5Qoi+kZMWM9qEnISMwnUeVct8m5khC96iRQGb1EBcitlNzC+63SB4aq/6B650EvXEJ7ySi9ZX9nVFB3X0Ssbls9NNfOG47R+8zCM97LE6NW1XmQN5NOAFJbDTL0XUZx9+x0aoAhFQ9ItF0xyd8M+SsNtdNv0QmLGR3RZ75CdwmxdNovVXop5jEsIlB7Ml/1cWzUwrSKfQnf+QkLQ/NxXl5SWUXhsy5nF2gkOlnp41AZrSrauViiS5bsdgzxO4/1/dA/1j4oEX3MM/sXQlajp+IoNClNAUbRijgSHQIDPHH8NyS45p2qpwhmlXVeP5M5Vz6zLvCuNvEH6SGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fSH0m5oEunR0wl79LyIcOu/dCRrnMjFrZLCnZVA7NHI=;
 b=XKTF8JOb1PT1igf/bu0YMdlVRLEjNj43N+Xfbot3L+0vXXLPtdf9jInvFbUxvyIfZbKFYld3QUnn0SEASStcCNYCBgsFuqCNC95fkcYj81IA3VgdQYAk5VOYpzK+XoXupSxoArwxHEZPB1+as3Muy5RA0OFwrs+QLvP6AQ19YGm+W6Xo0MWCH6wWFmIxd11uKQDZ7tCoC+Co2wXTaqSzf3MH0F37hO9CQ2IA1ie2fJ48PGm2xGDI5hRIWRahjnISYIuwhZnn7nEeFBpH771XA30akyG30JVAKRy1Z05eIegzC1ym29simtJx3RttX1JELLdw+1HpLB0kFoUy0nlPvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fSH0m5oEunR0wl79LyIcOu/dCRrnMjFrZLCnZVA7NHI=;
 b=kOVcrvENC1gKXBfKFwDas5wMmlB0Dyzvm3QkMHRl79QB5CkkIoR8iE0fsujFZ12ad342OyT1P+x/5mth1ZMfoyMrNx3FwVNFyEbIz7iovQz/n5/lN23GHc7cwjNUb+Za56N5O04ui7PW1l6ur1LH4d/qh/Dqz/ga6PjT0ZZXlZsgJqKwE6KZjAjMxBWr8TRMoa1Vzdz+PCv6UB2bO4h8afERG59aDfi/3kRUZgn647APqzyNOety5XkrJZkH6gRUB3z21yCtniul7bfH+BOio75kjS5XOZmJY8QWFb7dTkMs2GPCTs7pPGk/lCAHEGksqV2bEQdKbtszinyy0xdRlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com (2603:10a6:102:20c::5)
 by DB8PR04MB7051.eurprd04.prod.outlook.com (2603:10a6:10:fd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 15:16:46 +0000
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5]) by PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5%3]) with mapi id 15.20.9499.005; Fri, 23 Jan 2026
 15:16:46 +0000
Date: Fri, 23 Jan 2026 10:16:36 -0500
From: Frank Li <Frank.li@nxp.com>
To: maudspierings@gocontroll.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/5] arm64: dts: imx8mm: Add pinctrl config definitions
Message-ID: <aXOQ1JggvrDKbaez@lizhi-Precision-Tower-5810>
References: <20260123-mini_iv-v5-0-29bef040f236@gocontroll.com>
 <20260123-mini_iv-v5-2-29bef040f236@gocontroll.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123-mini_iv-v5-2-29bef040f236@gocontroll.com>
X-ClientProxiedBy: BYAPR06CA0047.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::24) To PAXPR04MB8957.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::5)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8957:EE_|DB8PR04MB7051:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bab96bd-382a-4523-e42b-08de5a926c1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yzZaIplfv2UgK89elOpvOp0ONhaxu+6kk55u3WpM8LmG7mc4qr2SAslnrFfX?=
 =?us-ascii?Q?o3FB5D5GBeMTSKFnMNObjkpdKXZGd2vStWd4B1Bjyflw4LgYrLvi9yhKjNMt?=
 =?us-ascii?Q?oYGgTrleP61CS2OM7xXTLP+WFTDJ2//cpJRY9Nb0QCqXbwppdwS9ikogQx1q?=
 =?us-ascii?Q?5eIaCBfGbN2cnb4OcI6zLCFwhC3Yo0uLbWFBxi0N3O8cB7gBG5nsCDufCGWJ?=
 =?us-ascii?Q?RMhu400gfavwPCV6Rx/87N2TkgQ6t3iFd3JkQyPvSwjCw87aCm9ivJfxuPC7?=
 =?us-ascii?Q?9wpbF7+CvxAwm+snuGVBQWmUkPVx/JdIyVhVy5vA/dQokTri/7YZnsbd3v3H?=
 =?us-ascii?Q?tFhhObbOI+rHZOWiuoBbcLUZq/3FlJKY0xyf8L+sba5OIq0vEBh1c+6B3Ocy?=
 =?us-ascii?Q?4zr7NZt5VgBvK1PHzDiFkT4SoVJGJ1ILUt4ihQxpPW36EfVT7EhCK3Ja5VHR?=
 =?us-ascii?Q?7Vtphr/O4CNZUoipAGHHtbLNf2oMoxU6UqSpWhDjKm/oMXNRVsyPzS/iDRQl?=
 =?us-ascii?Q?pleiylHLHE1RGf+nC0nUAjqQ0AWIniByxIM1P+VEot3wCznrW7ZHX6CII4CW?=
 =?us-ascii?Q?Gh9DDolCnfTR2CdOXZ71tEyTNkuTNHEg3qLLGcBulcw7JBvHlYis1GlIGDeu?=
 =?us-ascii?Q?wSZkr2anfAnJ8wMW8TmAzdZFz9VTftFJjIBhz8eVaZb1M3skwruDTrbJNOsU?=
 =?us-ascii?Q?YZa80gINIbpL4Va8402D2uNWeQ4ATHAcNGCJySvnsolkArVHknvDTreJr3iQ?=
 =?us-ascii?Q?W40tu2HQmuL/3Ab+KWZ27wA6cwT3rZVPM0mwzr3OU6vnccfAvvqw1WHcrQ9A?=
 =?us-ascii?Q?6Ff0sBzWvql60Jt5t5H/ODw8DTGdY5TwftjWKN5Fcs++5y2Ie2yp0khLV1WU?=
 =?us-ascii?Q?6N2HxqapOFg3x/kMPK0uo305vpx4G3S1dd4m5oAicwni/4N9ZNOblHgaYPEh?=
 =?us-ascii?Q?K6IwM643+noXDzFL03lWg6SjhGYj9uqBUgArj12qL1dIagxYIeEUOZAS2Vav?=
 =?us-ascii?Q?gWUdWjWKezK0TfJPzZAPlqjWA0URfoZVCRdpERtOdDE1H4PzbH5k1dVyjDOf?=
 =?us-ascii?Q?WNYAXdxnU5kDOL1SR4TQvDNYyU4MgZtzkJlUCd6k+e10PZ/eRJJgef8ihgpO?=
 =?us-ascii?Q?UXRQcAJcMPmFKacQKGmFJhXUhvZ7anRkV3HgvDSC1QkbD1MXCaPMI8PyDuq+?=
 =?us-ascii?Q?Q6Q+SxbadZ/j4zKcnFCppvYk8PWEGO7auAL4qln1QHzntZa1eeoOouCPjwup?=
 =?us-ascii?Q?sRQVXfX0LMLrg3JsqAmbfPW6U4Vy3VPrK0JUbU+Nkk4rkhNCLj1Jd6fSAWj4?=
 =?us-ascii?Q?YSMx47XmXe/X33+db1pdGJDxAWC2x4JrGX6eUdTlyWL3b96xWEdpHN6I2WEQ?=
 =?us-ascii?Q?ddAJLDAnfK4ykVMeHYLWSsMcNupXul3x8sRMGpdXkZDF+bMxbbM3dXxiucdR?=
 =?us-ascii?Q?0GGwSCmddjzOGI0WJa4KERdZEAIY9ha/kZKwOc/aqob7xfFTt/7XZnMf/7ca?=
 =?us-ascii?Q?XSJzy3eZCSZLFF34V4Epwnx46uS5gfs/dzm4tvS+yYee+aesnZZpEMlykboL?=
 =?us-ascii?Q?oXcPlbGnR0dzS5UgL5mko6jQmWo1e7TpQfzshIT28A8+aZdwoVVIMDV7/82G?=
 =?us-ascii?Q?CcS3xPqfG7MN47aByzKtfY0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8957.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cVpe7cFa8QyjgqZajSMsBwfHADTVXFQh//MwW+eNJBg/UrTNQBJjjy6mRvYn?=
 =?us-ascii?Q?1Fss3MLqJkTXWO13gQA/wRvx7cJ34f2PPtltpy4UzuVI+JB0zBdz/czsbvuV?=
 =?us-ascii?Q?FhpkGu6c5zbLMiLEXoOvDw++R905DmsXyV//tV1For565AmfTkdpEzS/QcZ2?=
 =?us-ascii?Q?Qu0YFeRW9FHz9T4i9a02aMnyjtxEyAqn1tAUWxfY3N/mfWUejvQ6Z5Rzfpmv?=
 =?us-ascii?Q?bZw5+ajIVR0fzkYyHf5+8ExZGK9E8vNIoAHZHVvJxuoPnAkNQMQ021qfstAw?=
 =?us-ascii?Q?7tiOxkjdXf+w8ULoR5pMYET+fMYc0x6wreLzLd4ikhFyyiHngG9FPtKP6nTg?=
 =?us-ascii?Q?yKuQY5ObMQ5s7JYvn1NJ1IZxvk2xmKQ+JdjoNTAzhStUDMPxqgOs/m1ppy1/?=
 =?us-ascii?Q?WvPnNnanw9DknFntVhAeoRT4nAE03Kam+8nIL4wDJ81vgNhY11hye9f8n/2O?=
 =?us-ascii?Q?7c0OnZdryYABd6TgZNPnlXvUmh8XFZFHvDd03qfAwEHO+bomoRVPh2rPywB4?=
 =?us-ascii?Q?cLbeIGeRtJaA8YXpdYTUDguQ8I9Q5vVfXVYOA1FR/yCCEdBn4KkuN0VViBdi?=
 =?us-ascii?Q?4ez+TA5/fBZoZkbSvmZ3NBtzmVT8CQ/2W2yKegWph8GKy9SRMeYqaFy8VRKy?=
 =?us-ascii?Q?NbMW73oxxbX56ygrssux2FY3cMItkTrskyQ0MA+83nmABAxZFxdmqBjNgdAv?=
 =?us-ascii?Q?rRhRdwvEQ482o+BdsWjPJ/xJ3iWDlLSFf2F3Xvg1QlNZ03YAWgs5orurN/TH?=
 =?us-ascii?Q?qMstg8D9NJPbbHmuHZ1Q+rtNXnPeE23Ta8dRNoOmR/+P82TnWUxi9oBaFSu2?=
 =?us-ascii?Q?919U40I36qqRPkwKeWhqpkquWanD3vBn0GXcMHH+4pwJt61ZC4VmewEo+8pn?=
 =?us-ascii?Q?XkCHVwFZYtw1At1C1w/7865HEwUqpmc7ykC2dKanUN5LTT5g8dLFesmsaAM1?=
 =?us-ascii?Q?BikyfLpiyihjEVSRj7rck6y3wMgVSDNpfNKD1TIrzpMvLCyAGUqcddCbSVTV?=
 =?us-ascii?Q?oR4hHPI5+OcvuA7/h/9ck+DIEkV5WxKZgLgET3cKfYVu3UdIg40IaoUUErXU?=
 =?us-ascii?Q?eqHbfUkzokUe/DfcaO0kmLPEO/5n4AAwLNr/83rPlYc1tQQJaN0KLqUrHXhA?=
 =?us-ascii?Q?9tg+xmKa0eaUDeUj7TnXBbA5TNfvp2GiS03PrQfQnhkqlclwqiVMvNxIFcdL?=
 =?us-ascii?Q?4f1QJ3eNd218rnwCDYTQ/6ev5Qdo1mVHswXBLd7IXoRqjR1/1sofjsRHyakn?=
 =?us-ascii?Q?twEOBOdS27BstRHOhi7XPjq+3D1wfwoZquSMchBt/rw8p2EeGo+aaCDBLXM9?=
 =?us-ascii?Q?nDRTY22petaG0X2w+g1qH2Mck4Xk7Rh7VgBfSQwSGo2rB6IylUs6NsLUuUHd?=
 =?us-ascii?Q?jQbR9bOs7UOm7H5/1KJ80av6hM/rV3T+iar2CjkYvLjJzDWQs68+piSQUXfG?=
 =?us-ascii?Q?bV9YrY0u+4e68oORuFoYW77ilKnfWHKIoxcO5zs38h0bAiQ5CFTcZwTkIxpp?=
 =?us-ascii?Q?ZaRKpuZI3OFVGKkm42dgZAYLlAAEiI/ej4MvKwLqoq/C/I/rDbQQNlgCGq/9?=
 =?us-ascii?Q?wFWv8ihzDSEFgDdmCSYk/7YhvEHUUVhVZ7vRBJcASk65osIQyE4pRiz/YEod?=
 =?us-ascii?Q?csojOpnGTuSW/6nyHTf+5dd+o4dBXtwVTPSqqUp7kgJtp95/0Zr/9VplsGsc?=
 =?us-ascii?Q?NZfrRQU+wpb0nogeZWBBsFju4INVsjQHfHvCdiLaOFlPZmxx?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bab96bd-382a-4523-e42b-08de5a926c1e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8957.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 15:16:46.4321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OefZyWP6MsQttHnpzG8GKSu6ymWUPbvNjTyYODrGaYWlL5WC7UHpiHRciqGpnvkjArTPSkSeHilx6RvOoKF/IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7051

On Fri, Jan 23, 2026 at 09:30:29AM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maudspierings@gocontroll.com>
>
> Currently to configure each IOMUXC_SW_PAD_CTL_PAD the raw value of this
> register is written in the dts, these values are not obvious. Add defines
> which describe the fields of this register which can be or-ed together to
> produce readable settings.
>
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h | 33 ++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h b/arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h
> index b1f11098d248..31557b7b9ccc 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-pinfunc.h
> @@ -6,6 +6,39 @@
>  #ifndef __DTS_IMX8MM_PINFUNC_H
>  #define __DTS_IMX8MM_PINFUNC_H
>
> +/* Drive Strength */
> +#define MX8MM_DSE_X1		0x0
> +#define MX8MM_DSE_X2		0x4
> +#define MX8MM_DSE_X4		0x2
> +#define MX8MM_DSE_X6		0x6
> +
> +/* Slew Rate */
> +#define MX8MM_FSEL_FAST		0x10
> +#define MX8MM_FSEL_SLOW		0x0
> +
> +/* Open Drain */
> +#define MX8MM_ODE_ENABLE	0x20
> +#define MX8MM_ODE_DISABLE	0x0
> +
> +#define MX8MM_PULL_DOWN		0x0
> +#define MX8MM_PULL_UP		0x40
> +
> +/* Hysteresis */
> +#define MX8MM_HYS_CMOS		0x0
> +#define MX8MM_HYS_SCHMITT	0x80
> +
> +#define MX8MM_PULL_ENABLE	0x100
> +#define MX8MM_PULL_DISABLE	0x0
> +
> +/* SION force input mode */
> +#define MX8MM_SION		0x40000000
> +
> +/* long defaults */
> +#define MX8MM_USDHC_DATA_DEFAULT (MX8MM_FSEL_FAST | MX8MM_PULL_UP | \
> +				  MX8MM_HYS_SCHMITT | MX8MM_PULL_ENABLE)
> +#define MX8MM_I2C_DEFAULT (MX8MM_DSE_X6 | MX8MM_PULL_UP | MX8MM_HYS_SCHMITT | \
> +			   MX8MM_PULL_ENABLE | MX8MM_SION)
> +
>  /*
>   * The pin function ID is a tuple of
>   * <mux_reg conf_reg input_reg mux_mode input_val>
>
> --
> 2.52.0
>
>
