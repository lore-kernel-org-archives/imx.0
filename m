Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013023.outbound.protection.outlook.com [40.107.159.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6E5390C97
	for <imx@lists.linux.dev>; Wed, 18 Mar 2026 13:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773841379; cv=fail; b=R2POEJJeZMFGrBDN895JAFUBSD0OBgHo4vQMRgC1FCOZioNTQjRI4fLslYlwUS6Zb5kLo4dn62vRtPnSKkCp+cfx9epC3ZmoU42HuU+/FpS9c6hOhN1gMrb4TErpTgnUljvXEcTHZ3DkGGopIqUAxEyFFIuYzD+GDFtHH2D1PoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773841379; c=relaxed/simple;
	bh=Q+m+/VTqBePoGX2kDYcIcNBCydokJ971tfGrh1G+j9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=NsTqoimLQFIz9xOKu+cx3c0HW3MrVfexWOzLcp6dP9+qbugQD6z8G4WZpxlCwxA1f5Zhi/5j8FAoQ2XlI7fUIvbjJhKxReD/TZtkLzFbVVvlkftNNoTvAzNWn/FYvD4QpmwoRKu59qI+SooOdcGiPN0SpjNiu3SuWC1Z/n1qWoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=F9+0YevG; arc=fail smtp.client-ip=40.107.159.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="F9+0YevG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yeC+BPVj4BgpUfUQH+TxAd6a3654gz/2IH9wpwZksUH6hVJHVsNX24S40iJpvUHdrRYHiy21LEbQebpBkjnW/YYiBkYHMSyf3T+Iw3WfFghiDVRjs/7ho4EnKpVl5lokgvfVXgt74gPtp/wEKWp03cFvBF5g3EkRep4rQCkkgJnwrM7gtdUxOT6Cnd71Yq0GgHxrUdAwLggHIud+0Naeef/8UvJNSoucckMKQBxcABJWO6MhxDeVqFOA+XNBiIuZdWsX7swPVUuLqS/KNqSPzjM09Js9h+uEL3BPSQsk4hHav8Z7OKzLBu6shn7WRAQFFKYzXuXieCV+Fw/1fdoHRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4cRTPXIDXeRbA8xSubn1Fj9elMcqaagr0vjKi+iWRA8=;
 b=vpSqAoK0WSt/sp4S49iCwn7k2TRa0urryuYn2yv/kPkAnxT1xIHwDnGmrfvu1BYiRPy/yAEHi64eHQ6L2S+DxzKJQcGYjxVGlWR2y1iVOuNZR9rZtgCqCd8lwHRxB05cq5UdIqX1RDD9UNn3fle3KxQr4KwVwTWzTwjvmXt0geYaE49WOwRTVZYj6v2fPNJcIkqKlbXvkG7tWejg0B1ABT5KQzbhkXPyyPQTfUIX9e/BqyPcPBmgibBHwwkLSYeSP190tuCqlLdkF4dMqx3B9aNigbK0/SKLwHhQP6XK6L9AKahuk0OXRdqIivyYOmrBDzgcMOKHkGH2L0WNSjYJnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4cRTPXIDXeRbA8xSubn1Fj9elMcqaagr0vjKi+iWRA8=;
 b=F9+0YevGg2pc1E3FFyCazBsoaibQf2DQvRYHfEPoIyAqHaE1izWv7abOfiIy0InL9SsQNHQzNhTzedBi2veVQqDMlYPZJq202bl2ejxVwPErq9UfejP0VQakPHu4RDUJWxdDcW4F0o0/evCGSnpAxW/Ufd0tbDMGkYbt4IiL1NHdiWTnqmsZY8tpsZqqftnXJ7rVNqAViiNScCDE0b93PT4VN7ABssY3E6VNVdPNxmQfrCE6r2svGMFQhcgIf3LDbk2GqEfS28ecdAP2VR63hvO+5sZbrTEBCXlALRbESCIgicUSBtrt68RmZC+45pm32GVPjXp2T239+cmOma6KYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB10631.eurprd04.prod.outlook.com (2603:10a6:150:202::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 13:42:50 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9700.021; Wed, 18 Mar 2026
 13:42:53 +0000
Date: Wed, 18 Mar 2026 09:42:45 -0400
From: Frank Li <Frank.li@nxp.com>
To: Joseph Guo <qijian.guo@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, xinyu.chen@nxp.com,
	qijian.guo@oss.nxp.com, justin.jiang@nxp.com
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add i.MX95 19x19 FRDM PRO
 board dts
Message-ID: <abqr1UyYmPGQlL2J@lizhi-Precision-Tower-5810>
References: <20260318-imx95_frdm_pro-v1-0-8c00e59f0b1b@nxp.com>
 <20260318-imx95_frdm_pro-v1-2-8c00e59f0b1b@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260318-imx95_frdm_pro-v1-2-8c00e59f0b1b@nxp.com>
X-ClientProxiedBy: SN7PR04CA0164.namprd04.prod.outlook.com
 (2603:10b6:806:125::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB10631:EE_
X-MS-Office365-Filtering-Correlation-Id: c602821c-336e-4bb0-bf43-08de84f440d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	7/BVp49rWgUflNqGeky7mB4tYiYz463vd4LCof8C4swaMnt7ycllvLCKERvacxbrpE/oIRHJgiN2ifUceegVT56U6hchcLOtxWvBsLjt978byiT1WMY6DU8VF50pH+Lq0FBHTixLCN1kA+Dx0JoLd8iuz2fofr2nZay7/iNnKfFzb9iECT9GXm5L4ywPNKmIh/kLzRveV7JrV1+fb0nh/BAMEx2B3zOLFFHCIahEanolYx0POkBHlOrMKWdiv7feRxepcWKUyCDGOm3daaIi8YLAG8kxFIW/8f97yau9t3f5tynPXahKj0VWl8UbqST8OZF3GtIpvbQLP/yihfe4EKmQs+UxwUmnaO2WKH2VMjYZUvUpZXbUu/dWn1luliLvmfEV5vFR2kixcKmsl5N3MWazs4n/DEsQ6SgILkXB5KIaCMlrs2eaK395OoV0/1jKutBD6fMumKL4AxYzu91LpInZauVoDv3TSIrZVz1KFw02FlvoYUh2F5G47mTHVozVyElz+6UKKcGmj0P+UGP3qmdq4uEn02BDzlIGfiiHmgMXCD15TGLDBk6RpyGx+n3hUtqCIM/er83T74aMn9QjE0ZfMkR1jkb5D4Tz4KrRUfCaIH8C8GM7GmKykyy0zxyFAD7N2g0Jws61JafHADuIze600fw1hRV8X+G8Dk2sMvlpbHa9Sb1pdWN0uEFTeM0wKro51MJbqpatVDDAsVxje/LcHxrjOgI7yWPTnZhVh+hYQpm3QWlR9Z1nyeBjlAAx/7RFwkS7DivIfJI9dUW2oIMNhhbYESlouToEY/N0zt4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rmuW85hQj/0lSoGmydK0Ukh1dnEUSurubGfUYaEWnIZ8m3CSUk9/dCfMo0i0?=
 =?us-ascii?Q?85UfXDz3ohUYAjz2H16RpOAdYrcE9vLdO4NPhl1GBZB2dsVh1dT7mgRyqYXO?=
 =?us-ascii?Q?FOK7OnuWClcveonf+AXHl/S29o8+q3NByiu8LKpYlg1kClZWps0AjGOESDPp?=
 =?us-ascii?Q?3kiPF5VQJVA/72Pfcj+YoBjlgJ5585cFkbycLlNeoQe7cqF7mM1QI0VYwgBz?=
 =?us-ascii?Q?WP9nQ9MQ3qrFJY7oN1SRLVLagluNkIGhsj+tAj41wTm8WLkKFSimqBl/JGHj?=
 =?us-ascii?Q?QGvfT8Uix0MKrK3t+7XZDiMhXI2vFcYnMQeuX8d3AJ9tg1uFwaUOBZtFMINH?=
 =?us-ascii?Q?xJ8DUCax8ELfrm3/kAI8eGT/tc6xtFawDuLSswQULXp5ZWwFBW2OaZYqZwML?=
 =?us-ascii?Q?4/it0fUUeQQIFEAp9/+Ab3MKJf6k5WKjSsTG/zX8gEnjeMkehULtLW5rmlaS?=
 =?us-ascii?Q?f9uXjEcwk6pBPHViBSuuic6Ms0eynfpIUUVm4ZAzB2CE7/DVFcwyO0Ici6aT?=
 =?us-ascii?Q?kjautAeECV6ce314xA/OTpzNQUrBg28Za6rh9E1V/1Qn99Rf6IA6TKiqhBcK?=
 =?us-ascii?Q?INPZg1CiXnMCcZwqCo5PvR8QUrYlGjCmQVQ920xxhPMN1SmDSuWUt7R94tvp?=
 =?us-ascii?Q?7C206fh0hKM4RR6XIr4mmTXvVjdnEKEIK0Kbj9JRrTz4Oxu14o45RHnCfFcZ?=
 =?us-ascii?Q?23W0oMNAxDGWmBEktcW55pqAJ/aV+k3lbs29DsV+mHq2+vQJZ0XFVA748Sw5?=
 =?us-ascii?Q?2kxZ/wNu2B8pZOAA9OzdWGRyw/lj1MuWS/Xk3BIRXW23LXfQcfu+EGWngcni?=
 =?us-ascii?Q?DiBitSw1uEmsmoUzuVAZmyCz3AoO1j7HYYMhdWr7wb8FGIAvlavaCVQD3dgB?=
 =?us-ascii?Q?DxTXP3RuacVqpHx2uLqN4prFFwKGnLWPVyyU0osaeedLQUuy4TPxiRKr23Fk?=
 =?us-ascii?Q?MPEoV/yZvhbklDDigir0XLfrUEjASx/PGFDiUr2Q6X3j3Upi4hRiwkswL11I?=
 =?us-ascii?Q?yptyoyKgIyfuWG9bML+rhB+G0vsB4G0Yk3VK9P2NJ+TXTUnF63I6CuJvYFW8?=
 =?us-ascii?Q?oO/oJ2r3aXrNGWTAM+STRwGjVOW/IQD4Fl5+TBkIefiO6WsYJHrVksBE3c4X?=
 =?us-ascii?Q?4O757OABlu6vfRL3LEvIwDE59f5XSG/frXqk1oaM/WE3YODApvK1Mz992cXK?=
 =?us-ascii?Q?KmvPzmohaDo39pn1HIK/ry6io3/+R2hHOjBfVLKJ4MoDA9baWqe7E5t2lTL1?=
 =?us-ascii?Q?Rjbdw4JJEa+E+KpGk91wFBfUJXwzIM84RUa2Tx1pRcZ4xtMfzGZtwK2nZ44L?=
 =?us-ascii?Q?ZOMCFCuprRI9Jyj9Kr8B0OT4SCNxwBqRm2+3PpkeEzMtMscPnVvUuYv2TPPL?=
 =?us-ascii?Q?BeG3rDrMTFel8+s2uYVkzDzd5K/2xVIFprLtIpd7rxFcSIc9i1i9BmrpT7VC?=
 =?us-ascii?Q?OR5rwrcMG23reBX0ZDcCCiiy5WBeR0eDzEMty6HaJd22LViIlUVTU/atg0sg?=
 =?us-ascii?Q?bywYVG4rJGanV+XLFNnSbKDNwLbDHQenm5a0yJvho1HYh/tEkhZZJE7XnPda?=
 =?us-ascii?Q?VLYgw58uPiaXHq3pJHhvNBocQ0gn7MJljCF5HmW/zVI09FrxI87a+CrgMyo1?=
 =?us-ascii?Q?LA+LrYo7MvUcWwQGEmmj+aRQ/iH1VY6MaYQ99ZEvmujGwy4mdFIk5fIShu40?=
 =?us-ascii?Q?mHk53QARsnp2ypnlpEL9Ebggq3fOrMxtgFbqauU+ZOKMc92wsp4aylrOE2mf?=
 =?us-ascii?Q?ApTyBmehVQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c602821c-336e-4bb0-bf43-08de84f440d0
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 13:42:53.0373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 02Zdq2eL9muWywQXEvXtU6FfmChibnIuy1LfJPnW2P3elgvGzf/x23DLKU8FYmD0fxfVho7XX3VefyxImF+nuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10631

On Wed, Mar 18, 2026 at 05:04:03PM +0900, Joseph Guo wrote:
> NXP i.MX95 19x19 FRDM PRO is cost-effective with extensive
> expansion capabilities based on the i.MX95 19x19 SoC.
>
> Add device tree for this board. Including:
> - LPUART1 and LPUART5
> - NETC
> - USB
> - 2 M-Key M.2 PCIe
> - uSDHC1, uSDHC2 and uSDHC3
> - FlexCAN1 and FlexCAN3
> - LPI2C3, LPI2C4 and their child nodes
> - Watchdog3
> - SAI, MQS, MICFIL
>
> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
> ---
>  .../boot/dts/freescale/imx95-19x19-frdm-pro.dts    | 1012 ++++++++++++++++++++
>  1 file changed, 1012 insertions(+)
>
> +
> +	reg_usb_vbus: regulator-vbus {
> +		compatible = "regulator-fixed";
> +		regulator-name = "USB_VBUS";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&i2c4_gpio_expander_22 0 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
> +	usdhc3_pwrseq: usdhc3_pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&i2c4_gpio_expander_22 9 GPIO_ACTIVE_LOW>;
> +	};

Please run https://github.com/lznuaa/dt-format for new dts file to keep
node nice order.

Frank
> +
> +	reg_usdhc3_vmmc: regulator-usdhc3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "WLAN_EN";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&reg_m2_ekey_pwr>;
> +		gpio = <&i2c4_gpio_expander_22 8 GPIO_ACTIVE_HIGH>;
> +		/*
> +		 * IW612 wifi chip needs more delay than other wifi chips to complete
> +		 * the host interface initialization after power up, otherwise the
> +		 * internal state of IW612 may be unstable, resulting in the failure of
> +		 * the SDIO3.0 switch voltage.
> +		 */
> +		startup-delay-us = <20000>;
> +		enable-active-high;
> +	};
> +
> +	reg_m2_ekey_pwr: regulator-m2-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "M.2-power-ekey";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&i2c4_gpio_expander_22 7 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
> +	reg_m2_mkey_1_pwr: regulator-m2-mkey-1-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "M.2-power-mkey-1";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&i2c3_gpio_expander_20 4 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
> +	reg_m2_mkey_2_pwr: regulator-m2-mkey-2-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "M.2-power-mkey-2";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&i2c3_gpio_expander_20 6 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		regulator-always-on;
> +	};
> +
> +	sound-bt-sco {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,name = "bt-sco-audio";
> +		simple-audio-card,format = "dsp_a";
> +		simple-audio-card,bitclock-inversion;
> +		simple-audio-card,frame-master = <&btcpu>;
> +		simple-audio-card,bitclock-master = <&btcpu>;
> +
> +		btcpu: simple-audio-card,cpu {
> +			sound-dai = <&sai5>;
> +			dai-tdm-slot-num = <2>;
> +			dai-tdm-slot-width = <16>;
> +		};
> +
> +		simple-audio-card,codec {
> +			sound-dai = <&bt_sco_codec 1>;
> +		};
> +	};
> +
> +	sound-micfil {
> +		compatible = "fsl,imx-audio-card";
> +		model = "micfil-audio";
> +		pri-dai-link {
> +			link-name = "micfil hifi";
> +			format = "i2s";
> +			cpu {
> +				sound-dai = <&micfil>;
> +			};
> +		};
> +	};
> +
> +	sound-mqs {
> +		compatible = "fsl,imx-audio-mqs";
> +		model = "mqs-audio";
> +		audio-cpu = <&sai1>;
> +		audio-codec = <&mqs1>;
> +	};
> +};
> +
> +&adc1 {
> +	vref-supply = <&reg_vref_1v8>;
> +	status = "okay";
> +};
> +
> +&enetc_port0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_enetc0>;
> +	phy-handle = <&ethphy0>;
> +	phy-mode = "rgmii-id";
> +	status = "okay";
> +};
> +
> +&enetc_port1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_enetc1>;
> +	phy-handle = <&ethphy1>;
> +	phy-mode = "rgmii-id";
> +	status = "okay";
> +};
> +
> +&flexcan1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexcan1>;
> +	phys = <&flexcan1_phy>;
> +	status = "disabled";
> +};
> +
> +&flexcan3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_flexcan3>;
> +	phys = <&flexcan3_phy>;
> +	status = "okay";
> +};
> +
> +&lpi2c3 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lpi2c3>;
> +	status = "okay";
> +
> +	i2c3_gpio_expander_20: i2c3-gpio-expander@20 {
> +		compatible = "nxp,pcal6416";
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		reg = <0x20>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		interrupt-parent = <&gpio5>;
> +		interrupts = <14 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_pcal6416>;
> +	};
> +
> +	ptn5110: tcpc@50 {
> +		compatible = "nxp,ptn5110", "tcpci";
> +		reg = <0x50>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_ptn5110>;
> +		interrupt-parent = <&gpio5>;
> +		interrupts = <8 IRQ_TYPE_LEVEL_LOW>;
> +
> +		typec_con: connector {
> +			compatible = "usb-c-connector";
> +			label = "USB-C";
> +			power-role = "dual";
> +			data-role = "dual";
> +			try-power-role = "sink";
> +			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> +			sink-pdos = <PDO_FIXED(5000, 0, PDO_FIXED_USB_COMM)>;
> +			op-sink-microwatt = <0>;
> +			self-powered;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +
> +					typec_con_hs: endpoint {
> +						remote-endpoint = <&usb3_data_hs>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					typec_con_ss: endpoint {
> +						remote-endpoint = <&usb3_data_ss>;
> +					};
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&lpi2c4 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_lpi2c4>;
> +	status = "okay";
> +
> +	i2c4_gpio_expander_22: i2c4-gpio-expander@22 {
> +		compatible = "nxp,pcal6524";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_pcal6524>;
> +		reg = <0x22>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		gpio-line-names = "USB2 Power Enable",
> +				  "DCDC5V Enable",
> +				  "",
> +				  "SE Enable",
> +				  "",
> +				  "EXP 5V Enable",
> +				  "EXP 3V3 Enable",
> +				  "WIFI Power Enable",
> +				  "M2 DIS1 B",
> +				  "WIFI SD3 Reset",
> +				  "EXP 1V8 Enable",
> +				  "CAN1 Standby",
> +				  "M2 DIS2",
> +				  "CAN2 Standby",
> +				  "ETH 10G IO4",
> +				  "ETH 10G IO3",
> +				  "SPI3/GPIO select",
> +				  "EXP 12V Enable",
> +				  "DCDC 3V3 Enable",
> +				  "PCIE1 Reset",
> +				  "",
> +				  "ETH 10G CLK Enable",
> +				  "LVDS to HDMI converter IT6263 reset",
> +				  "";
> +
> +		/* When low, select lpspi; When high, select gpio. */
> +		lpspi-gpio-sel-hog {
> +			gpio-hog;
> +			gpios = <16 GPIO_ACTIVE_HIGH>;
> +			output-low;
> +		};
> +	};
> +};
> +
> +&lpuart1 {
> +	/* console */
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart1>;
> +	status = "okay";
> +};
> +
> +&lpuart5 {
> +	/* BT */
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart5>;
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "nxp,88w8987-bt";
> +	};
> +};
> +
> +&micfil {
> +	#sound-dai-cells = <0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_pdm>;
> +	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
> +			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
> +			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
> +			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
> +			  <&scmi_clk IMX95_CLK_PDM>;
> +	assigned-clock-parents = <0>, <0>, <0>, <0>,
> +				 <&scmi_clk IMX95_CLK_AUDIOPLL1>;
> +	assigned-clock-rates = <3932160000>,
> +			       <3612672000>, <393216000>,
> +			       <361267200>, <49152000>;
> +	status = "okay";
> +};
> +
> +&mqs1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_mqs1>;
> +	clocks = <&scmi_clk IMX95_CLK_SAI1>;
> +	clock-names = "mclk";
> +	status = "okay";
> +};
> +
> +&netcmix_blk_ctrl {
> +	status = "okay";
> +};
> +
> +&netc_emdio {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_emdio>;
> +	status = "okay";
> +
> +	ethphy0: ethernet-phy@1 {
> +		reg = <1>;
> +		reset-gpios = <&i2c3_gpio_expander_20 1 GPIO_ACTIVE_LOW>;
> +		reset-assert-us = <10000>;
> +		reset-deassert-us = <80000>;
> +	};
> +
> +	ethphy1: ethernet-phy@2 {
> +		reg = <2>;
> +		reset-gpios = <&i2c3_gpio_expander_20 2 GPIO_ACTIVE_LOW>;
> +		reset-assert-us = <10000>;
> +		reset-deassert-us = <80000>;
> +	};
> +};
> +
> +&netc_timer {
> +	status = "okay";
> +};
> +
> +&pcie0 {
> +	pinctrl-0 = <&pinctrl_pcie0>;
> +	pinctrl-names = "default";
> +	reset-gpio = <&i2c4_gpio_expander_22 19 GPIO_ACTIVE_LOW>;
> +	vpcie-supply = <&reg_m2_mkey_1_pwr>;
> +	status = "okay";
> +};
> +
> +&pcie1 {
> +	pinctrl-0 = <&pinctrl_pcie1>;
> +	pinctrl-names = "default";
> +	reset-gpio = <&i2c3_gpio_expander_20 9 GPIO_ACTIVE_LOW>;
> +	vpcie-supply = <&reg_m2_mkey_2_pwr>;
> +	status = "okay";
> +};
> +
> +&sai1 {
> +	#sound-dai-cells = <0>;
> +	clocks = <&scmi_clk IMX95_CLK_BUSAON>, <&dummy>,
> +		 <&scmi_clk IMX95_CLK_SAI1>, <&dummy>,
> +		 <&dummy>, <&scmi_clk IMX95_CLK_AUDIOPLL1>,
> +		 <&scmi_clk IMX95_CLK_AUDIOPLL2>;
> +	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pll11k";
> +	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
> +			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
> +			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
> +			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
> +			  <&scmi_clk IMX95_CLK_SAI1>;
> +	assigned-clock-parents = <0>, <0>, <0>, <0>,
> +				 <&scmi_clk IMX95_CLK_AUDIOPLL1>;
> +	assigned-clock-rates = <3932160000>,
> +			       <3612672000>, <393216000>,
> +			       <361267200>, <24576000>;
> +	fsl,sai-mclk-direction-output;
> +	status = "okay";
> +};
> +
> +&sai5 {
> +	#sound-dai-cells = <0>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_sai5>;
> +	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
> +			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
> +			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
> +			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
> +			  <&scmi_clk IMX95_CLK_SAI5>;
> +	assigned-clock-parents = <0>, <0>, <0>, <0>,
> +				 <&scmi_clk IMX95_CLK_AUDIOPLL1>;
> +	assigned-clock-rates = <3932160000>,
> +			       <3612672000>, <393216000>,
> +			       <361267200>, <12288000>;
> +	fsl,sai-mclk-direction-output;
> +	status = "okay";
> +};
> +
> +&scmi_misc {
> +	nxp,ctrl-ids = <BRD_SM_CTRL_SD3_WAKE		1
> +			BRD_SM_CTRL_PCIE1_WAKE		1
> +			BRD_SM_CTRL_BT_WAKE		1
> +			BRD_SM_CTRL_PCIE2_WAKE		1
> +			BRD_SM_CTRL_BUTTON		1>;
> +};
> +
> +&scmi_iomuxc {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_hog>;
> +
> +	pinctrl_enetc0: enetc0grp {
> +		fsl,pins = <
> +			IMX95_PAD_ENET1_TD3__NETCMIX_TOP_ETH0_RGMII_TD3		0x50e
> +			IMX95_PAD_ENET1_TD2__NETCMIX_TOP_ETH0_RGMII_TD2		0x50e
> +			IMX95_PAD_ENET1_TD1__NETCMIX_TOP_ETH0_RGMII_TD1		0x50e
> +			IMX95_PAD_ENET1_TD0__NETCMIX_TOP_ETH0_RGMII_TD0		0x50e
> +			IMX95_PAD_ENET1_TX_CTL__NETCMIX_TOP_ETH0_RGMII_TX_CTL	0x57e
> +			IMX95_PAD_ENET1_TXC__NETCMIX_TOP_ETH0_RGMII_TX_CLK	0x58e
> +			IMX95_PAD_ENET1_RX_CTL__NETCMIX_TOP_ETH0_RGMII_RX_CTL	0x57e
> +			IMX95_PAD_ENET1_RXC__NETCMIX_TOP_ETH0_RGMII_RX_CLK	0x58e
> +			IMX95_PAD_ENET1_RD0__NETCMIX_TOP_ETH0_RGMII_RD0		0x57e
> +			IMX95_PAD_ENET1_RD1__NETCMIX_TOP_ETH0_RGMII_RD1		0x57e
> +			IMX95_PAD_ENET1_RD2__NETCMIX_TOP_ETH0_RGMII_RD2		0x57e
> +			IMX95_PAD_ENET1_RD3__NETCMIX_TOP_ETH0_RGMII_RD3		0x57e
> +		>;
> +	};
> +
> +	pinctrl_enetc1: enetc1grp {
> +		fsl,pins = <
> +			IMX95_PAD_ENET2_TD3__NETCMIX_TOP_ETH1_RGMII_TD3		0x50e
> +			IMX95_PAD_ENET2_TD2__NETCMIX_TOP_ETH1_RGMII_TD2		0x50e
> +			IMX95_PAD_ENET2_TD1__NETCMIX_TOP_ETH1_RGMII_TD1		0x50e
> +			IMX95_PAD_ENET2_TD0__NETCMIX_TOP_ETH1_RGMII_TD0		0x50e
> +			IMX95_PAD_ENET2_TX_CTL__NETCMIX_TOP_ETH1_RGMII_TX_CTL	0x57e
> +			IMX95_PAD_ENET2_TXC__NETCMIX_TOP_ETH1_RGMII_TX_CLK	0x58e
> +			IMX95_PAD_ENET2_RX_CTL__NETCMIX_TOP_ETH1_RGMII_RX_CTL	0x57e
> +			IMX95_PAD_ENET2_RXC__NETCMIX_TOP_ETH1_RGMII_RX_CLK	0x58e
> +			IMX95_PAD_ENET2_RD0__NETCMIX_TOP_ETH1_RGMII_RD0		0x57e
> +			IMX95_PAD_ENET2_RD1__NETCMIX_TOP_ETH1_RGMII_RD1		0x57e
> +			IMX95_PAD_ENET2_RD2__NETCMIX_TOP_ETH1_RGMII_RD2		0x57e
> +			IMX95_PAD_ENET2_RD3__NETCMIX_TOP_ETH1_RGMII_RD3		0x57e
> +		>;
> +	};
> +
> +	pinctrl_flexcan1: flexcan1grp {
> +		fsl,pins = <
> +			IMX95_PAD_SAI1_TXD0__AONMIX_TOP_CAN1_TX		0x39e
> +			IMX95_PAD_SAI1_TXC__AONMIX_TOP_CAN1_RX		0x39e
> +		>;
> +	};
> +
> +	pinctrl_flexcan3: flexcan3grp {
> +		fsl,pins = <
> +			IMX95_PAD_CCM_CLKO3__CAN3_TX			0x39e
> +			IMX95_PAD_CCM_CLKO4__CAN3_RX			0x39e
> +		>;
> +	};
> +
> +	pinctrl_emdio: emdiogrp {
> +		fsl,pins = <
> +			IMX95_PAD_ENET2_MDC__NETCMIX_TOP_NETC_MDC		0x50e
> +			IMX95_PAD_ENET2_MDIO__NETCMIX_TOP_NETC_MDIO		0x90e
> +		>;
> +	};
> +
> +	pinctrl_hog: hoggrp {
> +		fsl,pins = <
> +			IMX95_PAD_XSPI1_SS1_B__GPIO5_IO_BIT11		0x31e
> +		>;
> +	};
> +
> +	pinctrl_lpi2c1: lpi2c1grp {
> +		fsl,pins = <
> +			IMX95_PAD_I2C1_SCL__AONMIX_TOP_LPI2C1_SCL	0x40000b9e
> +			IMX95_PAD_I2C1_SDA__AONMIX_TOP_LPI2C1_SDA	0x40000b9e
> +		>;
> +	};
> +
> +	pinctrl_lpi2c2: lpi2c2grp {
> +		fsl,pins = <
> +			IMX95_PAD_I2C2_SCL__AONMIX_TOP_LPI2C2_SCL	0x40000b9e
> +			IMX95_PAD_I2C2_SDA__AONMIX_TOP_LPI2C2_SDA	0x40000b9e
> +		>;
> +	};
> +
> +	pinctrl_lpi2c3: lpi2c3grp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO28__LPI2C3_SDA			0x40000b9e
> +			IMX95_PAD_GPIO_IO29__LPI2C3_SCL			0x40000b9e
> +		>;
> +	};
> +
> +	pinctrl_lpi2c4: lpi2c4grp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO30__LPI2C4_SDA			0x40000b9e
> +			IMX95_PAD_GPIO_IO31__LPI2C4_SCL			0x40000b9e
> +		>;
> +	};
> +
> +	pinctrl_mipi_dsi_csi: mipidsigrp {
> +		fsl,pins = <
> +			IMX95_PAD_XSPI1_DATA6__GPIO5_IO_BIT6			0x31e
> +		>;
> +	};
> +
> +	pinctrl_mqs1: mqs1grp {
> +		fsl,pins = <
> +			IMX95_PAD_SAI1_TXFS__AONMIX_TOP_MQS1_LEFT		0x31e
> +			IMX95_PAD_SAI1_RXD0__AONMIX_TOP_MQS1_RIGHT		0x31e
> +		>;
> +	};
> +
> +	pinctrl_pcal6416: pcal6416grp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO34__GPIO5_IO_BIT14			0x31
> +		>;
> +	};
> +
> +	pinctrl_pcal6524: pcal6524grp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO34__GPIO5_IO_BIT14		0x31e
> +		>;
> +	};
> +
> +	pinctrl_pcie0: pcie0grp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO32__HSIOMIX_TOP_PCIE1_CLKREQ_B		0x4000031e
> +		>;
> +	};
> +
> +	pinctrl_pcie1: pcie1grp {
> +		fsl,pins = <
> +			IMX95_PAD_GPIO_IO35__HSIOMIX_TOP_PCIE2_CLKREQ_B     0x4000031e
> +		>;
> +	};
> +
> +	pinctrl_pdm: pdmgrp {
> +		fsl,pins = <
> +			IMX95_PAD_PDM_CLK__AONMIX_TOP_PDM_CLK				0x31e
> +			IMX95_PAD_PDM_BIT_STREAM0__AONMIX_TOP_PDM_BIT_STREAM_BIT0	0x31e
> +		>;
> +	};
> +
> +	pinctrl_ptn5110: ptn5110grp {
> +		fsl,pins = <
> +			IMX95_PAD_XSPI1_DQS__GPIO5_IO_BIT8			0x31e
> +		>;
> +	};
> +
> +	pinctrl_uart1: uart1grp {
> +		fsl,pins = <
> +			IMX95_PAD_UART1_RXD__AONMIX_TOP_LPUART1_RX      0x31e
> +			IMX95_PAD_UART1_TXD__AONMIX_TOP_LPUART1_TX      0x31e
> +		>;
> +	};
> +
> +	pinctrl_uart5: uart5grp {
> +		fsl,pins = <
> +			IMX95_PAD_DAP_TDO_TRACESWO__LPUART5_TX			0x31e
> +			IMX95_PAD_DAP_TDI__LPUART5_RX				0x31e
> +			IMX95_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B			0x31e
> +			IMX95_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B			0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc1: usdhc1grp {
> +		fsl,pins = <
> +			IMX95_PAD_SD1_CLK__USDHC1_CLK				0x158e
> +			IMX95_PAD_SD1_CMD__USDHC1_CMD				0x138e
> +			IMX95_PAD_SD1_DATA0__USDHC1_DATA0			0x138e
> +			IMX95_PAD_SD1_DATA1__USDHC1_DATA1			0x138e
> +			IMX95_PAD_SD1_DATA2__USDHC1_DATA2			0x138e
> +			IMX95_PAD_SD1_DATA3__USDHC1_DATA3			0x138e
> +			IMX95_PAD_SD1_DATA4__USDHC1_DATA4			0x138e
> +			IMX95_PAD_SD1_DATA5__USDHC1_DATA5			0x138e
> +			IMX95_PAD_SD1_DATA6__USDHC1_DATA6			0x138e
> +			IMX95_PAD_SD1_DATA7__USDHC1_DATA7			0x138e
> +			IMX95_PAD_SD1_STROBE__USDHC1_STROBE			0x158e
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> +		fsl,pins = <
> +			IMX95_PAD_SD1_CLK__USDHC1_CLK				0x158e
> +			IMX95_PAD_SD1_CMD__USDHC1_CMD				0x138e
> +			IMX95_PAD_SD1_DATA0__USDHC1_DATA0			0x138e
> +			IMX95_PAD_SD1_DATA1__USDHC1_DATA1			0x138e
> +			IMX95_PAD_SD1_DATA2__USDHC1_DATA2			0x138e
> +			IMX95_PAD_SD1_DATA3__USDHC1_DATA3			0x138e
> +			IMX95_PAD_SD1_DATA4__USDHC1_DATA4			0x138e
> +			IMX95_PAD_SD1_DATA5__USDHC1_DATA5			0x138e
> +			IMX95_PAD_SD1_DATA6__USDHC1_DATA6			0x138e
> +			IMX95_PAD_SD1_DATA7__USDHC1_DATA7			0x138e
> +			IMX95_PAD_SD1_STROBE__USDHC1_STROBE			0x158e
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> +		fsl,pins = <
> +			IMX95_PAD_SD1_CLK__USDHC1_CLK				0x15fe
> +			IMX95_PAD_SD1_CMD__USDHC1_CMD				0x13fe
> +			IMX95_PAD_SD1_DATA0__USDHC1_DATA0			0x13fe
> +			IMX95_PAD_SD1_DATA1__USDHC1_DATA1			0x13fe
> +			IMX95_PAD_SD1_DATA2__USDHC1_DATA2			0x13fe
> +			IMX95_PAD_SD1_DATA3__USDHC1_DATA3			0x13fe
> +			IMX95_PAD_SD1_DATA4__USDHC1_DATA4			0x13fe
> +			IMX95_PAD_SD1_DATA5__USDHC1_DATA5			0x13fe
> +			IMX95_PAD_SD1_DATA6__USDHC1_DATA6			0x13fe
> +			IMX95_PAD_SD1_DATA7__USDHC1_DATA7			0x13fe
> +			IMX95_PAD_SD1_STROBE__USDHC1_STROBE			0x15fe
> +		>;
> +	};
> +
> +	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
> +		fsl,pins = <
> +			IMX95_PAD_SD2_RESET_B__GPIO3_IO_BIT7			0x31e
> +		>;
> +	};
> +
> +	pinctrl_sai5: sai5grp {
> +		fsl,pins = <
> +			IMX95_PAD_XSPI1_DATA7__SAI5_RX_DATA_BIT0		0x31e
> +			IMX95_PAD_XSPI1_DATA6__SAI5_TX_BCLK			0x31e
> +			IMX95_PAD_XSPI1_DATA5__SAI5_TX_SYNC			0x31e
> +			IMX95_PAD_XSPI1_DATA4__SAI5_TX_DATA_BIT0		0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_gpio: usdhc2gpiogrp {
> +		fsl,pins = <
> +			IMX95_PAD_SD2_CD_B__GPIO3_IO_BIT0			0x31e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2: usdhc2grp {
> +		fsl,pins = <
> +			IMX95_PAD_SD2_CLK__USDHC2_CLK				0x158e
> +			IMX95_PAD_SD2_CMD__USDHC2_CMD				0x138e
> +			IMX95_PAD_SD2_DATA0__USDHC2_DATA0			0x138e
> +			IMX95_PAD_SD2_DATA1__USDHC2_DATA1			0x138e
> +			IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x138e
> +			IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x138e
> +			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT			0x51e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> +		fsl,pins = <
> +			IMX95_PAD_SD2_CLK__USDHC2_CLK				0x158e
> +			IMX95_PAD_SD2_CMD__USDHC2_CMD				0x138e
> +			IMX95_PAD_SD2_DATA0__USDHC2_DATA0			0x138e
> +			IMX95_PAD_SD2_DATA1__USDHC2_DATA1			0x138e
> +			IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x138e
> +			IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x138e
> +			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT			0x51e
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> +		fsl,pins = <
> +			IMX95_PAD_SD2_CLK__USDHC2_CLK				0x158e
> +			IMX95_PAD_SD2_CMD__USDHC2_CMD				0x138e
> +			IMX95_PAD_SD2_DATA0__USDHC2_DATA0			0x138e
> +			IMX95_PAD_SD2_DATA1__USDHC2_DATA1			0x138e
> +			IMX95_PAD_SD2_DATA2__USDHC2_DATA2			0x138e
> +			IMX95_PAD_SD2_DATA3__USDHC2_DATA3			0x138e
> +			IMX95_PAD_SD2_VSELECT__USDHC2_VSELECT			0x51e
> +		>;
> +	};
> +
> +	pinctrl_usdhc3: usdhc3grp {
> +		fsl,pins = <
> +			IMX95_PAD_SD3_CLK__USDHC3_CLK				0x158e
> +			IMX95_PAD_SD3_CMD__USDHC3_CMD				0x138e
> +			IMX95_PAD_SD3_DATA0__USDHC3_DATA0			0x138e
> +			IMX95_PAD_SD3_DATA1__USDHC3_DATA1			0x138e
> +			IMX95_PAD_SD3_DATA2__USDHC3_DATA2			0x138e
> +			IMX95_PAD_SD3_DATA3__USDHC3_DATA3			0x138e
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> +		fsl,pins = <
> +			IMX95_PAD_SD3_CLK__USDHC3_CLK				0x158e
> +			IMX95_PAD_SD3_CMD__USDHC3_CMD				0x138e
> +			IMX95_PAD_SD3_DATA0__USDHC3_DATA0			0x138e
> +			IMX95_PAD_SD3_DATA1__USDHC3_DATA1			0x138e
> +			IMX95_PAD_SD3_DATA2__USDHC3_DATA2			0x138e
> +			IMX95_PAD_SD3_DATA3__USDHC3_DATA3			0x138e
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> +		fsl,pins = <
> +			IMX95_PAD_SD3_CLK__USDHC3_CLK				0x15fe
> +			IMX95_PAD_SD3_CMD__USDHC3_CMD				0x13fe
> +			IMX95_PAD_SD3_DATA0__USDHC3_DATA0			0x13fe
> +			IMX95_PAD_SD3_DATA1__USDHC3_DATA1			0x13fe
> +			IMX95_PAD_SD3_DATA2__USDHC3_DATA2			0x13fe
> +			IMX95_PAD_SD3_DATA3__USDHC3_DATA3			0x13fe
> +		>;
> +	};
> +};
> +
> +&thermal_zones {
> +	pf09-thermal {
> +		polling-delay = <2000>;
> +		polling-delay-passive = <250>;
> +		thermal-sensors = <&scmi_sensor 2>;
> +
> +		trips {
> +			pf09_alert: trip0 {
> +				hysteresis = <2000>;
> +				temperature = <140000>;
> +				type = "passive";
> +			};
> +
> +			pf09_crit: trip1 {
> +				hysteresis = <2000>;
> +				temperature = <155000>;
> +				type = "critical";
> +			};
> +		};
> +	};
> +
> +	pf53arm-thermal {
> +		polling-delay = <2000>;
> +		polling-delay-passive = <250>;
> +		thermal-sensors = <&scmi_sensor 4>;
> +
> +		cooling-maps {
> +			map0 {
> +				trip = <&pf5301_alert>;
> +				cooling-device =
> +					<&A55_0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					<&A55_1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					<&A55_2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					<&A55_3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					<&A55_4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +					<&A55_5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +			};
> +		};
> +
> +		trips {
> +			pf5301_alert: trip0 {
> +				hysteresis = <2000>;
> +				temperature = <140000>;
> +				type = "passive";
> +			};
> +
> +			pf5301_crit: trip1 {
> +				hysteresis = <2000>;
> +				temperature = <155000>;
> +				type = "critical";
> +			};
> +		};
> +	};
> +
> +	pf53soc-thermal {
> +		polling-delay = <2000>;
> +		polling-delay-passive = <250>;
> +		thermal-sensors = <&scmi_sensor 3>;
> +
> +		trips {
> +			pf5302_alert: trip0 {
> +				hysteresis = <2000>;
> +				temperature = <140000>;
> +				type = "passive";
> +			};
> +
> +			pf5302_crit: trip1 {
> +				hysteresis = <2000>;
> +				temperature = <155000>;
> +				type = "critical";
> +			};
> +		};
> +	};
> +};
> +
> +&usb2 {
> +	dr_mode = "host";
> +	vbus-supply = <&reg_usb_vbus>;
> +	disable-over-current;
> +	status = "okay";
> +};
> +
> +&usb3 {
> +	status = "okay";
> +};
> +
> +&usb3_dwc3 {
> +	dr_mode = "otg";
> +	hnp-disable;
> +	srp-disable;
> +	adp-disable;
> +	usb-role-switch;
> +	role-switch-default-mode = "peripheral";
> +	snps,dis-u1-entry-quirk;
> +	snps,dis-u2-entry-quirk;
> +	status = "okay";
> +
> +	port {
> +		usb3_data_hs: endpoint {
> +			remote-endpoint = <&typec_con_hs>;
> +		};
> +	};
> +};
> +
> +&usb3_phy {
> +	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <17>;
> +	fsl,phy-pcs-tx-swing-full-percent = <100>;
> +	fsl,phy-tx-preemp-amp-tune-microamp = <600>;
> +	fsl,phy-tx-vboost-level-microvolt = <1156>;
> +	fsl,phy-tx-vref-tune-percent = <100>;
> +	orientation-switch;
> +	status = "okay";
> +
> +	port {
> +		usb3_data_ss: endpoint {
> +			remote-endpoint = <&typec_con_ss>;
> +		};
> +	};
> +};
> +
> +&usdhc1 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> +	pinctrl-0 = <&pinctrl_usdhc1>;
> +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
> +	pinctrl-3 = <&pinctrl_usdhc1>;
> +	bus-width = <8>;
> +	non-removable;
> +	no-sdio;
> +	no-sd;
> +	status = "okay";
> +};
> +
> +&usdhc2 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> +	pinctrl-0 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-1 = <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-3 = <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	cd-gpios = <&gpio3 00 GPIO_ACTIVE_LOW>;
> +	vmmc-supply = <&reg_usdhc2_vmmc>;
> +	bus-width = <4>;
> +	status = "okay";
> +};
> +
> +&usdhc3 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> +	pinctrl-0 = <&pinctrl_usdhc3>;
> +	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
> +	pinctrl-3 = <&pinctrl_usdhc3>;
> +	mmc-pwrseq = <&usdhc3_pwrseq>;
> +	vmmc-supply = <&reg_usdhc3_vmmc>;
> +	bus-width = <4>;
> +	keep-power-in-suspend;
> +	non-removable;
> +	wakeup-source;
> +	status = "okay";
> +};
> +
> +&wdog3 {
> +	status = "okay";
> +};
>
> --
> 2.34.1
>
