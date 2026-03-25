Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011051.outbound.protection.outlook.com [52.101.70.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556183DC4A5
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 15:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774453081; cv=fail; b=uvu291znz8ag0HCr3hQlqQa0eHOruKC1JH90BjgcN3lEXrHLLSqGgCe2UBQKVr9e2zLkZQrP5ObXKsZCA/iKSfLG1QE3X3Y1H745U/bqcqqFp+iDDZQz5tkhRLuFYXz4xovfqWva+glgp8Lf4gz/wa5aPtt6oSr4IwLz1oTg0y8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774453081; c=relaxed/simple;
	bh=WLjlZ8xCbgBjwaG4GkjB1WoReU9aeVsZ4WjYcPws06Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=pPeOiD7KnHbwzybh2CVhQTvi9trg/tGXk9LzRHEE1G2xF6UysziNN67kwiBnWcdmWomAAqqsNtnovBu/AwIkfIzfyBBHApCGTfJbrOe05fr9pfKV8k2dWdwI9A5izvH7Zvu0eRmlaeUH8FC/ltvMFp1qIiDrS93yNv0pdaeEzjs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CijOQIHh; arc=fail smtp.client-ip=52.101.70.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CijOQIHh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=reTYpVbKjgrrdNRV3NcfRyOtGovqQ+xJN4xOz7ZlHst59+o/e2P6qUGAweKL8ibCPztQaDH/ENezEJJwId6TGa6nm5RJDqv9/hROp61jyJy0RHlPf2/5nlb605kVo8QaSQzw/dWZ6rm7obp8J5IeW+rpnAVr6dUkb/kK5qfEXCbFzw12uZ9IJHkKcnObk12VvgY3wbZlGnxTtMILEw7NburgBkErBlGpplw7J55v6LqpVT/dbK7/PDU5Z//G4apJGOKQus/c8EH3n0bPzgqaewTeKTlbB09Ly2W24eYRJMQ4Z/6lxxwSlqKzzOE8E1Rf2MPXreIy0x58SvDUb8cj1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjct+LNUZDsP0dc5qe/mFsOnoyIuzaIz23fd4qOy8zE=;
 b=YjX6G4hc4McMwrmkMb6KnrpSjenxXHpWEBGsrRitwY8Jhi06q32qHfL1b89J1Bo+BtCJSg4eDoTT9PIG/tX5kqPgKrmiEu6ztn16/A+OhFF6zssjo5zN9Fzzd0HNSuNL+6/FN5Ys0/ztuK5oCoKDD1Y9y5wYH/eJ7GTO/JME+vU1WhrzKJ/q824Vkb9dXwdASu3qQWip0hYWfiqU0IK2YStZePuTrRhvs5Yj8sZ120T+CZXzZltigwx8B2v+x7nwbApnW7Lb2mKXmSn4qrS3zznbQ9ELSTKEmwTn8lxS76BgWiSVvEZ04bECGWzxxnRQzPrbtx8mJle8anjU1R+k7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjct+LNUZDsP0dc5qe/mFsOnoyIuzaIz23fd4qOy8zE=;
 b=CijOQIHhuFg+Wtc+lqnfFaR3jAXY9SPvNPmjYTXs2VDFjq1wEbXj9JzpkNgshdiEcX9KHxOgV4t25cWXqh7zQWAF+885RiM26i5pjgAbv7yojMUyW8CMDqiPpzQT2AWRpI6C0zMzSZj6YOF4GGQu76J4Nh0/hlpf2fAqQkWH8iRbTd2PglmXjzZ42197e/R1UWcm/rze9FLeV/AMhfQenLyJwok5zshsHxEaiEEWBRpXiVwv/uE0KQJj/cMBJN9uvecYxEAp4LANJZ5KNmLtPocdUORfrGRIdczCkHbht6HUEpQL0cRcomuvc1nutZQ+R5F9YBxK4cpLIPlu8nZhkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AMBPR04MB12229.eurprd04.prod.outlook.com (2603:10a6:20b:757::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 15:37:56 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 15:37:56 +0000
Date: Wed, 25 Mar 2026 11:37:48 -0400
From: Frank Li <Frank.li@nxp.com>
To: Fabian Pfitzner <f.pfitzner@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: imx8mp-frdm: add sd, ethernet, wifi, usb
 and hdmi support
Message-ID: <acQBTJHtBSmFlkoB@lizhi-Precision-Tower-5810>
References: <20260316-fpf-imx8mp-frdm-v2-1-e2e8aadecb2f@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316-fpf-imx8mp-frdm-v2-1-e2e8aadecb2f@pengutronix.de>
X-ClientProxiedBy: PH7PR02CA0030.namprd02.prod.outlook.com
 (2603:10b6:510:33d::24) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AMBPR04MB12229:EE_
X-MS-Office365-Filtering-Correlation-Id: 5848963d-82dd-4d33-2f67-08de8a847c0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|38350700014|7053199007|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	zzEIyFjZ97iVG5XuobvjXWoT+e93JBJDPJL+XkzETpKwmf9sr3VrOg/dbUf4yapHVAyDDm2hQIn/8dzkkFy1ny9t3xL6xT2XjaTBl3L0ro2l1nZx6crMR3XgFxzeKBViBPmnbE0+c/9s4AwMLPAs6QNoajXMEVZp6swn5Ee920kFrzZjRjiSS9mxtXn44WlCDnl24rYXsHfpBmDUAB3Y7mKtVFjg/9wVGpVNhkJbyNYrye6Y3NuUzczZa+JnnrB2+JCJfrfanJjzTagKxdnO4kwgsWjcOyss63TlWypvHFAfBhrkJSAVp2kXeo9iKGwNA66PZrV1BkTjQfgt1gAKgpFny5fE5mEA2OPqRTxP15fLVVLEVZE0xBiAZ4Xu3spequaaW6jBFPg1lbZZ5pZrRdes1zL7JrVBPK0vdkvL5WflEouS52qV/imU2P6N/XItFCUlW8V0OVkB9k6DRXS2bBkrwRlt4ZbD/wHKJdJvKQQeqqeL7qaPQLZLwZ+VWiXI6aRy2v4QQYtNKiilmGxGFAtlcxxhbxrxTEoHsW1LiQK3Bwx/pKALDoizcFOlywLcS0U9t7H0KDrOR43uX+FwTigydTiGNrtQWY/Y+liqwJMaUFuw0IbaoyJyQaoVlDh/809rYbNN4kgV1CEdDQ7jf3uKXlG5u0vE0kk61BSB5/QBQ86OnF3dfCeCBopJ3gdgN2sfIJ/y2Tc5xenEmpqDDgoNFpuh0sCN+r1q3/m8NaOfv7woQ2zYmwCjmlAUhqeHh6jkRKCSHKQ9h/1UI+px4i6csg4QfQof4w7j3EbopP8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(38350700014)(7053199007)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wmfsXrvnEv7wLsZXj3wUNN6XnY1OCMHDUUan6D7OTJQSDV2dpUm9mEldh1Mq?=
 =?us-ascii?Q?XIRgVcs5ynyAfJ9hO3Pi5g9IJAJhJo9CQAoTB8FHlxrti+jLXiPYq0Dw//MF?=
 =?us-ascii?Q?QVGhJLPdq8Elbqr5zYIUQunRjTn664qoJwNyJIayCzVVl64hbmcNNCRMSw5C?=
 =?us-ascii?Q?XNa30nSz2gsmGuVygYs12lHi63QXm92Q5Ghih965kI+AABNvneXpblDK/o3m?=
 =?us-ascii?Q?O9fkzlF3cQZVUJP7mG/VoZW9chNlmxuxoTwvb0UgZ4OMHryDh2l4dzqnrJRh?=
 =?us-ascii?Q?8w79Iz6laa/GYOIaAexAf6aA7KfuMP9gijYTC8NgcyLBm7RPdYVctZWXNTbC?=
 =?us-ascii?Q?Rj9YoGj98q04nQAWuGoPF9OJExZ+cDnMwcHr0dk4EiEmWFRP7zYv/r8XGzdh?=
 =?us-ascii?Q?ndI2x4d59DKMWf8/F1isYYiivZ0hcZYNWnjg9vlyieNA1d2d2JYbN4MHasF0?=
 =?us-ascii?Q?ZDjwBPrHA1YBpFX3IbVJMY1n8yXkRK5eu6gxYjCTPEVysyhNQ4ZocoFPjvYk?=
 =?us-ascii?Q?l8mSE6pRndomgvp2hYP1DcXmy6WuOfIzKAwPWQeUHMYefZs26oq5TU9nsED9?=
 =?us-ascii?Q?z+euuFYLG8D4PjPeDQWNTFxlxClCpDDwzaMjtffrO2o6ddtZ/WF3T0kz7e0I?=
 =?us-ascii?Q?cvs0D7nAApdVFCjE3v+lj7MfZdH0AyiQinUfuZLWXqLpo2/W3pqhQqS+3eU2?=
 =?us-ascii?Q?G/UuZDddtE9JCzsOheE7lgHrR9zA1VkjZoY07w9o1lMNer1J35hGqRFF6C95?=
 =?us-ascii?Q?GhpjR+5GWVrKVjkP6r4GIrIkUCf+p5BdezBThSB4Aanrg6iS6O+uMjS0/4Zb?=
 =?us-ascii?Q?itmjdlvBylyo0RX34e0+baUr51UiLKvINoMQhyJZch+S9vz76R/2v3y3YQqj?=
 =?us-ascii?Q?icEMFxxYsnnEhQxl26oFjzzBeQfMEpb+zEuVT0qKwLetiEYT1lJ9wxPMMWLb?=
 =?us-ascii?Q?m0FwnCOgh0zCU5jnpmAdVoEi09j4cS7atzoPZSuPp6JpYxrlejq0xbF9YbaN?=
 =?us-ascii?Q?mB5sq+H5vZkbAB9Wgy79peTOp6t+Iof0Vgy8jVNRYBygGLed7d46S/6iEIr4?=
 =?us-ascii?Q?0Cv2jcfD2QB64ttRDEnWLT1D4xlCq76euRv1ZxTJ89j6qiJeuWiZi98nRQ79?=
 =?us-ascii?Q?3isaz1+DhyC0yMXR/1E8DZUb5zVzltmKLxjpAi13bwldAeTYtzyqTEhSAX4f?=
 =?us-ascii?Q?109/pSAiXneiaJ2R/QbTf/DJI1XAy9WgIL+2fMXjitbdrvvzWwrQR/fmPMEP?=
 =?us-ascii?Q?dGPNO4JoctAWJQgaEnl8yIEcNS4Di77h0A22Yuoko7UeMRy6mnBKC7eVRPuv?=
 =?us-ascii?Q?boHtzS9l4PnELjDVCpXxXSy4fIdBgRCnwPETdwji/E2r3JJFEEjz3SN3MjYu?=
 =?us-ascii?Q?J2nZqzxKK1yijirnEiha4BZHwh6aEQ9UPa+IY5zmAPFeEYtZKBWXFyP2L22x?=
 =?us-ascii?Q?CgNaWWgcQuTdwlUuP5Qf4dSEi0FR1mJQcByXfIDqFPKres2Bk6Bw8mrErPCJ?=
 =?us-ascii?Q?fDGLf1UhOYH4vqAaV3dD3Ih35c1rFK23Hx0AQ0TcAcwMBeBXOOLLNOnt6xpn?=
 =?us-ascii?Q?u55QWZ7BohotwoVfsgr9qxSAk0gW/xeFFoviZZ7VUDk7fVVZ8kzUMuyRA4Dc?=
 =?us-ascii?Q?LCf+DUMwq4T4RswSrOJIbkUvQtDUn8EhON5SBGYYzZf4a/mGm0Nc6wWCIXIs?=
 =?us-ascii?Q?0y9kEubvR48lmn5wHNABvHUo3ZRj+y8oQCjXgVXuhBmT2yVRmJeXid/OfRQf?=
 =?us-ascii?Q?mxNyHvuGmQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5848963d-82dd-4d33-2f67-08de8a847c0e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 15:37:56.0581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HFKc6RuF8bSe73Y86rE03HbuCpVEkDawPzfG+0qbb3kPLE4DG+JGojpbr0OVxUqf+IEj01ohAEGW6laXC38qgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12229

On Mon, Mar 16, 2026 at 10:25:04AM +0100, Fabian Pfitzner wrote:
> Add support for the following new features:
>
> - SD Card
> - Ethernet (FEC + EQOS)
> - Wifi
> - USB
> - HDMI
>
> The imx8mp-evk dt and the NXP downstream imx8mp-frdm dts were
> taken as a reference.
>
> Signed-off-by: Fabian Pfitzner <f.pfitzner@pengutronix.de>
> ---

Please rebase to https://git.kernel.org/pub/scm/linux/kernel/git/frank.li/linux.git/log/?h=for-next

Frank

> Changes in v2:
> - Reorder nodes by name
> - Remove unused "realtek,clkout-disable" property
> - Link to v1: https://lore.kernel.org/r/20260224-fpf-imx8mp-frdm-v1-1-d7f3b57c18e0@pengutronix.de
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-frdm.dts | 407 ++++++++++++++++++++++++++
>  1 file changed, 407 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
> index 55690f5e53d7e1fbf7eae8a1f31eb064465ccb6c..c3691887bb8456c56de27af2e8432657ae2d77e6 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
> @@ -42,6 +42,67 @@ memory@40000000 {
>  		reg = <0x0 0x40000000 0 0xc0000000>,
>  		      <0x1 0x00000000 0 0x40000000>;
>  	};
> +
> +	native-hdmi-connector {
> +		compatible = "hdmi-connector";
> +		label = "HDMI OUT";
> +		type = "a";
> +
> +		port {
> +			hdmi_in: endpoint {
> +				remote-endpoint = <&hdmi_tx_out>;
> +			};
> +		};
> +	};
> +
> +	reg_usdhc2_vmmc: regulator-sd {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_reg_usdhc2_vmmc>;
> +		regulator-name = "VSD_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reg_usb_vbus: regulator-vbus {
> +		compatible = "regulator-fixed";
> +		regulator-name = "USB_VBUS";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&pcal6416_1 5 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	reg_usdhc1_vmmc: regulator-wifi-vmmc {
> +		compatible = "regulator-fixed";
> +		regulator-name = "WLAN_EN";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&pcal6416_1 10 GPIO_ACTIVE_HIGH>;
> +		/*
> +		 * IW612 wifi chip needs more delay than other wifi chips to complete
> +		 * the host interface initialization after power up, otherwise the
> +		 * internal state of IW612 may be unstable, resulting in the failure of
> +		 * the SDIO3.0 switch voltage.
> +		 */
> +		enable-active-high;
> +		startup-delay-us = <20000>;
> +	};
> +
> +	reg_usdhc1_vqmmc: regulator-wifi-vqmmc {
> +		compatible = "regulator-fixed";
> +		regulator-name = "regulator-wifi-vqmmc";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		enable-active-high;
> +	};
> +
> +	sdio_pwrseq: usdhc1-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
> +	};
>  };
>
>  &A53_0 {
> @@ -60,6 +121,147 @@ &A53_3 {
>  	cpu-supply = <&reg_arm>;
>  };
>
> +&eqos {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_eqos>;
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy0>;
> +	snps,force_thresh_dma_mode;
> +	snps,mtl-tx-config = <&mtl_tx_setup>;
> +	snps,mtl-rx-config = <&mtl_rx_setup>;
> +	status = "okay";
> +
> +	mdio {
> +		compatible = "snps,dwmac-mdio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy0: ethernet-phy@2 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <2>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pinctrl_eqos_phy>;
> +			reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <10000>;
> +			reset-deassert-us = <80000>;
> +		};
> +	};
> +
> +	mtl_tx_setup: tx-queues-config {
> +		snps,tx-queues-to-use = <5>;
> +
> +		queue0 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x1>;
> +		};
> +
> +		queue1 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x2>;
> +		};
> +
> +		queue2 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x4>;
> +		};
> +
> +		queue3 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x8>;
> +		};
> +
> +		queue4 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0xf0>;
> +		};
> +	};
> +
> +	mtl_rx_setup: rx-queues-config {
> +		snps,rx-queues-to-use = <5>;
> +		snps,rx-sched-sp;
> +
> +		queue0 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x1>;
> +			snps,map-to-dma-channel = <0>;
> +		};
> +
> +		queue1 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x2>;
> +			snps,map-to-dma-channel = <1>;
> +		};
> +
> +		queue2 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x4>;
> +			snps,map-to-dma-channel = <2>;
> +		};
> +
> +		queue3 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0x8>;
> +			snps,map-to-dma-channel = <3>;
> +		};
> +
> +		queue4 {
> +			snps,dcb-algorithm;
> +			snps,priority = <0xf0>;
> +			snps,map-to-dma-channel = <4>;
> +		};
> +	};
> +};
> +
> +&fec {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_fec>;
> +	phy-mode = "rgmii-id";
> +	phy-handle = <&ethphy1>;
> +	fsl,magic-packet;
> +	status = "okay";
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy1: ethernet-phy@1 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <1>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&pinctrl_fec_phy>;
> +			eee-broken-1000t;
> +			reset-gpios = <&gpio4 2 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <10000>;
> +			reset-deassert-us = <80000>;
> +			realtek,aldps-enable;
> +			realtek,clkout-disable;
> +		};
> +	};
> +};
> +
> +
> +&hdmi_pvi {
> +	status = "okay";
> +};
> +
> +&hdmi_tx {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_hdmi>;
> +	status = "okay";
> +
> +	ports {
> +		port@1 {
> +			hdmi_tx_out: endpoint {
> +				remote-endpoint = <&hdmi_in>;
> +			};
> +		};
> +	};
> +};
> +
> +&hdmi_tx_phy {
> +	status = "okay";
> +};
> +
>  &i2c1 {
>  	clock-frequency = <400000>;
>  	pinctrl-names = "default";
> @@ -218,6 +420,32 @@ &i2c3 {
>  	status = "okay";
>  };
>
> +&lcdif3 {
> +	status = "okay";
> +};
> +
> +&usb3_0 {
> +	status = "okay";
> +};
> +
> +&usb3_1 {
> +	status = "okay";
> +};
> +
> +&usb3_phy0 {
> +	status = "okay";
> +};
> +
> +&usb3_phy1 {
> +	vbus-supply = <&reg_usb_vbus>;
> +	status = "okay";
> +};
> +
> +&usb_dwc3_1 {
> +	dr_mode = "host";
> +	status = "okay";
> +};
> +
>  &snvs_pwrkey {
>  	status = "okay";
>  };
> @@ -237,6 +465,36 @@ &uart3 {
>  	status = "okay";
>  };
>
> +&usdhc1 {
> +	assigned-clocks = <&clk IMX8MP_CLK_USDHC1>;
> +	assigned-clock-rates = <200000000>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc1>;
> +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
> +	mmc-pwrseq = <&sdio_pwrseq>;
> +	vmmc-supply = <&reg_usdhc1_vmmc>;
> +	vqmmc-supply = <&reg_usdhc1_vqmmc>;
> +	bus-width = <4>;
> +	non-removable;
> +	no-sd;
> +	no-mmc;
> +	status = "okay";
> +};
> +
> +&usdhc2 {
> +	assigned-clocks = <&clk IMX8MP_CLK_USDHC2>;
> +	assigned-clock-rates = <400000000>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> +	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
> +	vmmc-supply = <&reg_usdhc2_vmmc>;
> +	bus-width = <4>;
> +	status = "okay";
> +};
> +
>  &usdhc3 {
>  	assigned-clocks = <&clk IMX8MP_CLK_USDHC3>;
>  	assigned-clock-rates = <400000000>;
> @@ -250,6 +508,74 @@ &usdhc3 {
>  };
>
>  &iomuxc {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_hog>;
> +
> +	pinctrl_eqos: eqosgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x2
> +			MX8MP_IOMUXC_ENET_MDIO__ENET_QOS_MDIO				0x2
> +			MX8MP_IOMUXC_ENET_RD0__ENET_QOS_RGMII_RD0			0x90
> +			MX8MP_IOMUXC_ENET_RD1__ENET_QOS_RGMII_RD1			0x90
> +			MX8MP_IOMUXC_ENET_RD2__ENET_QOS_RGMII_RD2			0x90
> +			MX8MP_IOMUXC_ENET_RD3__ENET_QOS_RGMII_RD3			0x90
> +			MX8MP_IOMUXC_ENET_RXC__CCM_ENET_QOS_CLOCK_GENERATE_RX_CLK	0x90
> +			MX8MP_IOMUXC_ENET_RX_CTL__ENET_QOS_RGMII_RX_CTL			0x90
> +			MX8MP_IOMUXC_ENET_TD0__ENET_QOS_RGMII_TD0			0x16
> +			MX8MP_IOMUXC_ENET_TD1__ENET_QOS_RGMII_TD1			0x16
> +			MX8MP_IOMUXC_ENET_TD2__ENET_QOS_RGMII_TD2			0x16
> +			MX8MP_IOMUXC_ENET_TD3__ENET_QOS_RGMII_TD3			0x16
> +			MX8MP_IOMUXC_ENET_TX_CTL__ENET_QOS_RGMII_TX_CTL			0x16
> +			MX8MP_IOMUXC_ENET_TXC__CCM_ENET_QOS_CLOCK_GENERATE_TX_CLK	0x16
> +		>;
> +	};
> +
> +	pinctrl_eqos_phy: eqosphygrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI2_RXC__GPIO4_IO22				0x10
> +		>;
> +	};
> +
> +	pinctrl_fec: fecgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI1_RXD2__ENET1_MDC		0x2
> +			MX8MP_IOMUXC_SAI1_RXD3__ENET1_MDIO		0x2
> +			MX8MP_IOMUXC_SAI1_RXD4__ENET1_RGMII_RD0		0x90
> +			MX8MP_IOMUXC_SAI1_RXD5__ENET1_RGMII_RD1		0x90
> +			MX8MP_IOMUXC_SAI1_RXD6__ENET1_RGMII_RD2		0x90
> +			MX8MP_IOMUXC_SAI1_RXD7__ENET1_RGMII_RD3		0x90
> +			MX8MP_IOMUXC_SAI1_TXC__ENET1_RGMII_RXC		0x90
> +			MX8MP_IOMUXC_SAI1_TXFS__ENET1_RGMII_RX_CTL	0x90
> +			MX8MP_IOMUXC_SAI1_TXD0__ENET1_RGMII_TD0		0x16
> +			MX8MP_IOMUXC_SAI1_TXD1__ENET1_RGMII_TD1		0x16
> +			MX8MP_IOMUXC_SAI1_TXD2__ENET1_RGMII_TD2		0x16
> +			MX8MP_IOMUXC_SAI1_TXD3__ENET1_RGMII_TD3		0x16
> +			MX8MP_IOMUXC_SAI1_TXD4__ENET1_RGMII_TX_CTL	0x16
> +			MX8MP_IOMUXC_SAI1_TXD5__ENET1_RGMII_TXC		0x16
> +		>;
> +	};
> +
> +	pinctrl_fec_phy: fecphygrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI1_RXD0__GPIO4_IO02		0x10
> +		>;
> +	};
> +
> +	pinctrl_hdmi: hdmigrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC		0x10
> +		>;
> +	};
> +
> +	pinctrl_hog: hoggrp {
> +		fsl,pins = <
> +			/* Pin might be required by multiple drivers
> +			 * (e. g. HDMI Audio and HDMI TX)
> +			 */
> +			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD		0x40000010
> +		>;
> +	};
> +
>  	pinctrl_i2c1: i2c1grp {
>  		fsl,pins = <
>  			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL	0x400001c2
> @@ -289,6 +615,12 @@ MX8MP_IOMUXC_SD1_STROBE__GPIO2_IO11	0x146
>  		>;
>  	};
>
> +	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19	0x40
> +		>;
> +	};
> +
>  	pinctrl_uart2: uart2grp {
>  		fsl,pins = <
>  			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX	0x140
> @@ -305,6 +637,81 @@ MX8MP_IOMUXC_ECSPI1_MISO__UART3_DCE_CTS	0x140
>  		>;
>  	};
>
> +	pinctrl_usdhc1: usdhc1grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x190
> +			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d0
> +			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d0
> +			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d0
> +			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d0
> +			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d0
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x194
> +			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d4
> +			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d4
> +			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d4
> +			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d4
> +			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d4
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x196
> +			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d6
> +			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d6
> +			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d6
> +			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d6
> +			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d6
> +		>;
> +	};
> +
> +	pinctrl_usdhc2: usdhc2grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x190
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d0
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d0
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d0
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d0
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d0
> +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT	0xc0
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x194
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d4
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d4
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d4
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d4
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d4
> +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT 0xc0
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x196
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD	0x1d6
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0	0x1d6
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1	0x1d6
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2	0x1d6
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3	0x1d6
> +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT 0xc0
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CD_B__GPIO2_IO12	0x1c4
> +		>;
> +	};
> +
>  	pinctrl_usdhc3: usdhc3grp {
>  		fsl,pins = <
>  			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x190
>
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260224-fpf-imx8mp-frdm-402c4df06302
>
> Best regards,
> --
> Fabian Pfitzner <f.pfitzner@pengutronix.de>
>
