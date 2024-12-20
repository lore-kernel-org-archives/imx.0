Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013047.outbound.protection.outlook.com [52.101.67.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC99218AD6
	for <imx@lists.linux.dev>; Fri, 20 Dec 2024 15:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734710172; cv=fail; b=eoPDyAflZXCoUDB+Egd4kJRpn1z/CwfNTNUS8hZLCnGoYZlpK6MBPoaHkzQcUqxaDiusPUFyD9NGx8/T6BwyZ/nWPkZ2WgY39uVeroS2p/e0JrctwUQIrYrYRDJYXdQ1kF1O+RPegbEru++vbuhBA1r8ZRkIhc0sa4jSPRpMro8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734710172; c=relaxed/simple;
	bh=1HA2GVa7v8FQemoN8E9sG2BjuQ3Db6CdjAnLZbBMuoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=sqXOJHROSKjijRUoaiWtejCq6x/7dLkBew+VZoz3VEjzkJ9/AoGzWFztm9TfPErzt1JV3CMzG8cSSx9BTB1ZPGgglouSXgY7IbXLYQIr030fg18QYHBP8iJXphncQPQczptnnHvoVQ6E6Nslrte5y367N5AbgbNjG038kKwlNgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=npEi7c6F; arc=fail smtp.client-ip=52.101.67.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="npEi7c6F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nronWCA+VTIhwdno5qtZaHcAAW13yjFnfBEdyjo9rXE89DCgN7xPt5SWaojNiEG94pSU4eDHhPXLLopaeC+xbd3/rf7yOdK31Ax0iu9qec59qKbhEe1cYhRgzR4bY++vOC5DIgTPmk7rxk3MsfVpP59jBieeF5ZI4Ek9YkN5aUDI3N64m8MzA7Ec0p9QRjPIM7+9jpw8w2brTd1fc0SEuaB5oSJ1u/Ed2OdNcus+qw5IIXJKcPoXv8TSOlzloRhoNTg3XUSe4U8EGDcTVdp1oomAEY7o8kyFCrheNvMmDzZUZJebKb3Iv3Nj4gUOtw4HkoAb0nzyDsP0ShFuhrQr3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPVQYCovU+v/lk/3/Yre/GzsLEcZkJkMQDfl3IrlKsY=;
 b=KYlNhkVhamMtmSEViDAx0vn42NkW+Tn6L9EQ4cZL4KuUuIjBb55F54DEKKTiGzDKYpNuboMgcIKI537ErLC9vAfWbdbMWyJ0N88Reso9JADLF6jk0b/Ps5mziPbYFZ23k5uZHk8wAfVTykEd9zvUcgvqbEdD/EH7spJDiDCcLajkkj5iL2UdRV2VA+JuBp7y5SoWLaZU1VGuVw0KlEXlmm5e/Xv4ao1tMjcdAQ3Fx56JJxE4uJHU9jFNVhzvR29+RG/jS/2LtMKLiqGXavs6u6roiwjhqqQOLZO49SUD3noDX/8EabofugAXFoPkra1JJLAvm4z8vPEXYBJuhvi/Bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TPVQYCovU+v/lk/3/Yre/GzsLEcZkJkMQDfl3IrlKsY=;
 b=npEi7c6F0giQtbZNUQ8lGddkS7/al+wvELZeS8xKYrqsMEIZ3x9uykroUPW9qVO9r6o2oBLKGiV9KiY4aiOnzs/n+RuvZ+WmdfNM1BeNFinuf83EZKaAT3jhU8GK++yxo3FWwYDGpLY+Q1bKuNQuKBsymredF/qCVrmUDOKNhduRoUF4J/DeZ9bK5POMKPp9uUl2VKySMEnZsSqv12RBxTd9k3RvjfPuHgpPawUWzvT6RmInTEFTjX/khdCD8OR9aNGGTUOsTZBjB1q4Tw8nJRWAf2QxUP7eg8CDxbgquuIqSi/u1aMzpK16Kufk/iY1DcSFEnKXtkcjykpfCOByhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB7830.eurprd04.prod.outlook.com (2603:10a6:20b:2ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.17; Fri, 20 Dec
 2024 15:56:02 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 15:56:02 +0000
Date: Fri, 20 Dec 2024 10:55:56 -0500
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
Subject: Re: [PATCH v4 4/4] arm64: dts: s32g399a-rdb3: Add INA231 sensor
 entry over I2C4
Message-ID: <Z2WTjETLunBr83AN@lizhi-Precision-Tower-5810>
References: <20241220123916.1452582-1-ciprianmarian.costea@oss.nxp.com>
 <20241220123916.1452582-5-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241220123916.1452582-5-ciprianmarian.costea@oss.nxp.com>
X-ClientProxiedBy: SA0PR11CA0043.namprd11.prod.outlook.com
 (2603:10b6:806:d0::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB7830:EE_
X-MS-Office365-Filtering-Correlation-Id: 919a6bb4-9fe0-405c-e900-08dd210ecdf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|7416014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tOrIZX6hs/zIwsOh2RX5rMoJeQ27t0VbLitVYBEs6BOLu68Ux0XHPQ32akTB?=
 =?us-ascii?Q?kqimj5USDctOFeGORjA7SPuBYGu43OilZDDeJSkfoHn2DFthXT5XkBm2wwJc?=
 =?us-ascii?Q?rZz3SJHa2KYNR4BF6eQXLhcL7Sx0Y3z6ZG7w7D5Ym3TtKY162sbK0XieeG8Y?=
 =?us-ascii?Q?nSYnUUcS7iwYxtcxjbMNiY8JBD5/YtXFZfvxgCmYJnN3KhYN1wZxcizMUAvP?=
 =?us-ascii?Q?T1/IDhT00KHTm51LcdO4wSFeoasc0EHvRwRBjitmw0zg5LylN0MZuhwpv8KW?=
 =?us-ascii?Q?ghPuuiH4OkktC4O3zKW34VoUrGCLpjDQbes2HiqOGwZ40kzn7ReA0QHLyM5d?=
 =?us-ascii?Q?jDVvgXCyZSy20sQPmoiEjECNsU3tWz4Ch/H+JU/3OGvHfkEu1RMXG9ZzhHnK?=
 =?us-ascii?Q?1+2TyHvw5T+XmdtIkcFWPLbcS/DU2N/f36nQmj4FLBH43HhZBHIUMUDe1tgh?=
 =?us-ascii?Q?ToKhTtYXgbzGzPnOm7CiqxnHmzHoNwZl9FuWcoYSOmcb/Vju/eC6rxbhaRzL?=
 =?us-ascii?Q?ax6+q+jbbMdkgU80NnWXoAY//buj77Zsxm5xAdLnlJp7RJbkyh6RIMpq7maH?=
 =?us-ascii?Q?9xJ1LQ34AkIIdL26NvWw8GP60h2PFbd31T4EN6eXZLnIlkwpU+xhkw2+Cpfd?=
 =?us-ascii?Q?rW5vUXYE3KwhyxnSWApH3/fSQwU0rlOwR4J397Tns4dowh34OmeTLvUruJlc?=
 =?us-ascii?Q?f95IZ6T5sRCM9q0ULkHllNdaTXBP/a3/iVhQdj7hEU9WV1L9TVQu9wHonrC6?=
 =?us-ascii?Q?jrA7LEkXDrpg0UIJ3tjTVjaJq3eKumMEEjEDu4HQp2cCu7UPO0uzb/fVKQHW?=
 =?us-ascii?Q?hXc2Ld6SN5tz9CDyF/zFJ9xWqo0jtis43nLoWLemid0OTKdEcNIvYUVWOuAZ?=
 =?us-ascii?Q?tnXj6am/IVsEHp+Xtfm6WLXJ4ugRicMbAZaaPvAaCmRcgKPiqvJxIj2WClqM?=
 =?us-ascii?Q?uwJLZyiY9ckc+9DZHms3s7tb60dShiA/DXDYgyezflv1vdLEZW2eseGv0LCj?=
 =?us-ascii?Q?oGUGyMe3cw171RdpLldUbEmc/+xAtqRX6Y2h9zcXy0iKDeMdtqHX2GO3hIt6?=
 =?us-ascii?Q?5819YPQ5AM9JQjvRU5KXI/c5ZRwXw5fPu0m2F/ab12jlLkyLtEqz2s0Cevbe?=
 =?us-ascii?Q?94k6DQfnsi2a5As+vp57AO1EJXduS1O1PGR34JAZOl83s290p+sNMt+LunLN?=
 =?us-ascii?Q?XQyqrE1uVng9G+SM0mOU3Dg8jTX0LYxjMwy0HvMGLqk95aZcmDbiD4KHpm52?=
 =?us-ascii?Q?7BJLiYYmB9JW4cUc6BbEaR36Mofl4eExEvG/Qn1k7a4ZmHlCuofVA0x1EcZS?=
 =?us-ascii?Q?qsLU+qRs35zH6sg9n7f0UQulpIzdTwHhfmh1Adq3CL7IzS4bsuknCKubOXii?=
 =?us-ascii?Q?epwkQoPtzSmy7MlB/X23deC+YRKe?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(7416014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ue9Jr2u6KKNrtly5GtXVD4DZa56mcBCAgR3ontmyGHZCNEAedtMZVGGBOSMu?=
 =?us-ascii?Q?jz+EVJyubLGXKpQeY7r2ia2Onqhy1Z1+OVNW3AuF1vBYlkvgGCDGgwTGSSQX?=
 =?us-ascii?Q?J9S4zTPnSgt2eA5bHjnV9BNQ+7OjRlTVptWSf/iDa9RNdNc2YqbAK0xi1i5I?=
 =?us-ascii?Q?CLyM+O3m2jDpDP1DJu0fOyhmws0dLt0Zhh23zv2Tdq2zZVZmPIHRJX8KjcDH?=
 =?us-ascii?Q?BFHDUdwmQirys9KcmxWsX2hs4ImqohByaSPVpAgLIVDJpM2uBhi8tCPx4jfk?=
 =?us-ascii?Q?IzRCcvvVu6PDeW+jttda0mDkmdxSA0bfUhEPy7ZYgCpYwpDsUXdrH/MC4sc6?=
 =?us-ascii?Q?7wj1BijhwQZZFrQtikD26Yqiedazkq4z2xe93vujCyPsoP5u8nes3qwo2tYK?=
 =?us-ascii?Q?upgh3bm0+QY5U+SnQ1eYK4Uksne4PB/3OuPd/ZdQqYwOZEjavo4f4pXDCYkA?=
 =?us-ascii?Q?mjZ0nD8IBSdyqZkw3ncZZnHDRmzOvXktCoBfyyL+WRcJ+FphJ8b/LkBeI7mm?=
 =?us-ascii?Q?QZ1bxUMLy0qTroUdMJ/BXQgc9K4pC3isG48lfFztfi4V9mAqELzgIBE583A/?=
 =?us-ascii?Q?asA/vP1EgURGcwK/rOkkT5GrEmXSXnUcc08+ag4WEn956AZOc/G8H191vH1f?=
 =?us-ascii?Q?RXIdSzx3iWGN/KfauNtTFrpI7wrKb6VK3zojPrjLm/PZP3U0eREPGtLMD6Mn?=
 =?us-ascii?Q?MxgM9sqZML+llNE4XDYQXT40nE0XyPalpX+KntrW3TJRBciMm8eg0M0SjaMG?=
 =?us-ascii?Q?VrondHNxS3PMryBXaEm+TgE9AxN3IBV2pdn1nOU3lKz9mDJZbz7OCzDIyNis?=
 =?us-ascii?Q?QSjiZmhPl4/sSO7a4mOzIinHs3DAudnRbQhW5Q2qavwhZxjTqrSFlnonnQk1?=
 =?us-ascii?Q?kf/9mcPa7TG4zE1Cw3Zvv6/CHRm7I5bF9+cIwrIeUklcFgipynPzgMn1eI1a?=
 =?us-ascii?Q?i5l8l/7AhRfIYTI2+pAoLjUqH9ZVJIocnK7IiYIbG+OFM0TKyGvVviEeAJYH?=
 =?us-ascii?Q?95HgrEgFwPLeTB7KPvceelV3fiD7KdNB/uiDeo6PC/03Nw1q+UDN+8MP4iVs?=
 =?us-ascii?Q?Pi16vXGoV4g3sb9JDOSfATyCLTaEY+T9ahK5/w0BJ64TBJ25TIihsS2Mz/cY?=
 =?us-ascii?Q?WIUAAYrUUx5c1s0ZDSs7fxqRzOAMoUZ1MjeaZ1EYpmyDp2qk74Y4kTU8sbAa?=
 =?us-ascii?Q?DpB8vAhZFPy8LLpxza6pZlRkbkJGn8Yqd0hYYMqRk/cMiPHPNC0HUc9yiGAk?=
 =?us-ascii?Q?dSX+Wp1hXLkM3zO4+2I8mqgf2ezFVdkIRLwbXk55saETAsXh/JE2iFfeE0bH?=
 =?us-ascii?Q?FLLXsLt21GSO6ovmeoWNzdMnN+5pfQm87Ze5yM5CaTQHnv9ZtLL72rT6kGp6?=
 =?us-ascii?Q?bYtDbMM2tzfYZ0acdGWhFg6rQGai7HgSFDM3cXe355xzEUuz3I2x09hliVT7?=
 =?us-ascii?Q?opUGJnL22BMraF/ljpLIKscYkjahmIJjsRz6Rvj6hSLkAUDlfy5iVp5bbqO5?=
 =?us-ascii?Q?UE5WkE8UTAVmtrG5QTiEKKkmXBQaH6ZfOaDjvhi3FsXW5gBNq2qhpIEIb+t/?=
 =?us-ascii?Q?jQGNJmWvthaV0N/PJPXkW09R/eHXCVO69XyoxuSi?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 919a6bb4-9fe0-405c-e900-08dd210ecdf3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 15:56:02.6120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hNRkOU36Uvbuox0RbHw6P0B2bj5CvbePn4XztKreHDmekBdXAmD/0bxBS/vP67qpnYdCgQJWcvWLfTxX/eAysg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7830

On Fri, Dec 20, 2024 at 02:39:16PM +0200, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> On S32G399A-RDB3 boards, an INA231 current sensor is connected over
> I2C4 bus.

Add INA231 current sensor for S32G399A-RDB3 boards.

>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
> index 94f531be4017..5f8739c068c6 100644
> --- a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
> +++ b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
> @@ -40,6 +40,14 @@ &uart1 {
>  	status = "okay";
>  };
>
> +&i2c4 {
> +	ina231@40 {

Need use general node name:
https://devicetree-specification.readthedocs.io/en/v0.3/devicetree-basics.html#node-names

look like should be current-sensor

Frank

> +		compatible = "ti,ina231";
> +		reg = <0x40>;
> +		shunt-resistor = <1000>;
> +	};
> +};
> +
>  &usdhc0 {
>  	pinctrl-names = "default", "state_100mhz", "state_200mhz";
>  	pinctrl-0 = <&pinctrl_usdhc0>;
> --
> 2.45.2
>
