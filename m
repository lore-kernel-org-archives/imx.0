Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010045.outbound.protection.outlook.com [52.101.84.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CCCA32D425
	for <imx@lists.linux.dev>; Mon,  1 Dec 2025 16:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764607340; cv=fail; b=eFazd0vnWkPYmVkwvXp7vbQm4CQ/4N6SaUnbAiaErT8yw38vo0YraGWJVOgWHfjgraAYz2/BiALZqOKB5ina35Ii+Vn5nQEc7LM2UzDkW4K8Jn7f7TNxpUIU3jc18S+eoesY8ltXUKcCvLa3GlqUjd/0TUZNUipgLLs9KifHqEc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764607340; c=relaxed/simple;
	bh=Et5/meyqkhVGd3c4GUhJ/2FS2dhXQo+5/uTiugxKBko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WqpItNBwXsM0prKmMB1ePREpHLvGcsmquM2Gm6UjIPb1PQB/CcOufBDtSl6hEVpqq4py1rFQ+PbcQPgUPsIZfNn2t+5RMx7WdQ/t2h3mw+7Mx0M/u5M+tjuoeVsOO5sNz6p2BeeoeZ/5cm1hINYTFntJnyzMbl9G3ljTrQHWcYc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FYQxDX/B; arc=fail smtp.client-ip=52.101.84.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FYQxDX/B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c8jcnKAfqRtdYZTfSSMnWOIRrKFHjolpysU/KANdgRqLDIcgCZX/wesdCqWcLr1khPiJ5rfEjZOCSSYJKPzmjPmb5+NRJLjqb7TcuG30RlSZD3rjXfYBMYDd3J0hDL7ZhFxLZziObEma29m0A7fTfF2yOYIZf82i/+N7SsJCHhwJXbuxMoRc70o4Cq73qBl//y5T1FAJ15D+iNEC7aTGaS2lLaMv/p22Ci1E+X9kRqGQvlLnPtd6EmP7MIhYOgdHJS1O/F/6KF7iqpcz8r69sbQ+wgLXBbueVvMszKONJjxPAweF9RAqCBa23R/wU8XW93ef/T2eOklYTlj8JBp99A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BE1VqdNp1jjs17o0eVkkTGkTqd17L0SUA4CtkmNfNhQ=;
 b=D+R+UrcevYRDyoD4QONhtF4PGpyZBfaCaYM/cy8nX1CBl62Nhpai0fYIY+5IUhtH82F6BsVjXjoldt5Krk39rRuBEKGld6KYCRUlzI9wWov3jOQJp4hP2qB/Vzo9uhnfgKrEO0inJ0f/V2pIOcwSIIqh2EGVPrkHBDSjzkVwLtw8aSzyYVsw4xEonrAw75SdiHszCliGfNrM5DcMKacQRSmJI8FBo3WARdl3dKwQmY/GTvY0D5FriF9+ZLgDF/D4eNy2qPMC+2GYKN2p2s6zQneje4/xVrDaB/t1JGBIKLcvJfeaoyXLk0SJRQvHUf76kCEkXPkTGNkRvgw6YPbz1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BE1VqdNp1jjs17o0eVkkTGkTqd17L0SUA4CtkmNfNhQ=;
 b=FYQxDX/BVqk3TumKI77HIbrwPZKkBt8vL+LHn3hfhIEdr0kOMJUOwMGTTc0OnsaiypVyeqGWCAtrXOvOyq/vt3LxTZyhoYJxxjvsjU6aiA2lmXnOZpYHoZWsIaJwCra9P4ftnuK5QamofgeLnDSMwXw+zwuUxwodItdF47hsbX34/R35fS6FwS4K+UNgmxyFI5K+mI9oNlBrmCpllGftzh0nhy0V/e5rcSR6lkrkjKGK8czX2UAeT2+XdhK2x7JUbv1yRZa1bMjYpeqQl86X6NPJ605irK+opJuU3M9NCRAv1cz9kFUcJAKSm3u4A1fWVUd8a8qm/nzUMpcpLnUlcg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by VI1PR04MB10076.eurprd04.prod.outlook.com (2603:10a6:800:1e0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 16:42:13 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 16:42:12 +0000
Date: Mon, 1 Dec 2025 11:42:00 -0500
From: Frank Li <Frank.li@nxp.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linaro-s32@linaro.org
Subject: Re: [PATCH 4/4] dts: s32g: Add GPR syscon region
Message-ID: <aS3FWLWQ1g4YQjFi@lizhi-Precision-Tower-5810>
References: <cover.1764592300.git.dan.carpenter@linaro.org>
 <c8302f53fcbb5cb5afe42cdb15aba7e2e6ed7338.1764592300.git.dan.carpenter@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c8302f53fcbb5cb5afe42cdb15aba7e2e6ed7338.1764592300.git.dan.carpenter@linaro.org>
X-ClientProxiedBy: SJ0PR13CA0037.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::12) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|VI1PR04MB10076:EE_
X-MS-Office365-Filtering-Correlation-Id: 8df44ce4-7d71-475d-cf06-08de30f893c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|52116014|7416014|376014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?owuT0K2+at8xYFvbJ1Y2aLQKc444M9bqinnADeSPhyIlB0qCrYxKfCmiI3Oc?=
 =?us-ascii?Q?qXlLBA0dVBFU6oIzd64eMym7K5Uao7ovh56rxg/x6xd6ShloKJS/w64R+3mQ?=
 =?us-ascii?Q?MO4WCwtgolksMqE6F5yzNojMYcOlJg5useOrwdK6E0OUR02go41KTnW48Hol?=
 =?us-ascii?Q?cWz+xDD/cs83AiU9VhTs5h57ChEAU4oiR8vkzUbKIvEh4mVfuyfBsGSIi9PU?=
 =?us-ascii?Q?LjTw//q9Zj6ribi8l4CIDAahSylDhRfm2c7z674BdaJcEt+j80yqQIiyO/rk?=
 =?us-ascii?Q?NRfNd71PJEK/IJircOrNA3hPMo+twHdCHcqo2WcTKe4TjCBuO4Few5b8MN3a?=
 =?us-ascii?Q?yhYfkQParg17R4qcoSZtu4mjvS26/RScWV2JuVaNOehLx7ce3CVJw7jW2HYB?=
 =?us-ascii?Q?D8fHMJJ3JDRDTxlYkuCMzNGDae9UrniF7P5OpYoS/STiBSipegxZtvrlTamU?=
 =?us-ascii?Q?+qHO1+X0YDSjMfqSdhkFOE1T29Dw0EDHXG585G64DPyw/6cuH1p+mB6PQ2bP?=
 =?us-ascii?Q?M3ry5duTpwSp27nq7hHNC4nx68XBhC4+C9TkqLTUpoXkTTsOQg6GAF3NwR0v?=
 =?us-ascii?Q?gGp1CqX0JRI715SUuwJrgXHCdjVRxq1NSmXusGpFnJT5LUrs+jg608ENASRN?=
 =?us-ascii?Q?v1rVUHNISI6oM22i7oPHcWk2uLqGIgKtv5ksp9BJ85j67YIDFjUinB0Z5l82?=
 =?us-ascii?Q?SM0xsATignfJQx9AqMmL8p+/mRyJoMH51mwK6J4/u+bCmAUqqDUVygZMTm3X?=
 =?us-ascii?Q?6mwQBq/PnPQlKH+MRcybbYjZtgHqybhqehEmh8PdflgwbY64siR1xPyrseJY?=
 =?us-ascii?Q?MODl1HTKtNqiNldDmxuZ0aaSTS+s4g+oG5qvoF24idtpLH6wDZySEU5WI043?=
 =?us-ascii?Q?UWmkQMkiJgClpDCAFDFhPq5Ya4TwaQ0XBzueMbKTF+NB++BTocjXpxIfGuOE?=
 =?us-ascii?Q?zh2gvca2Abhpm+YbeSakKujI7J1ZoRJiT/v6LUciHBIPrCUipOE4dr50Vi4F?=
 =?us-ascii?Q?flQ5mIyq/Fe+pYTW/wzK8oISLqWz82xFhAeUf+AYlZQX3fpiR22XsrOoHIyc?=
 =?us-ascii?Q?4ok/t7KJ9qz5DrE2R0/YLcNz7hecC776fcuXo2a9MsDgWuKzerBEdwo/P5bf?=
 =?us-ascii?Q?C86ZhxrdvEPXpyo/8ddAN11chtGxkWQcF0VDisszLdwk/iBm60sFfPbl5v9e?=
 =?us-ascii?Q?wRoEQRvP1AzeRxf4mN8v0oIKcuvzUYdwYY/3z/Fu4Qgmi/aitJkN6sdTqCpy?=
 =?us-ascii?Q?7EpkQReMVhgaD/vHXNetWQ0jH2jCrBtRnGDmDgHxDVdLcEw6bxtj1OO5uoVP?=
 =?us-ascii?Q?iF9jVRgXGFpEGk6B1WVTvK0+O2y5736gv+RgzaQB13cnDCgggzSDNRAMlCa8?=
 =?us-ascii?Q?S3gtUlxW/nUNQLFY5ODqWrdRPlpQjh4CLUqTHt/dZJlUyyo3BQiuaU3+8Neu?=
 =?us-ascii?Q?3YroMgt+GQpRP22MoYK4n8aZ2ARrjTQMCoutFkN+R+Vhx1PK/nU6GvUwez8M?=
 =?us-ascii?Q?GgFp1LhxdkvD9xUnz1oDoaiQCOtXLBzuRUHr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?la3RZD3MQnU0qYs21a/i6bxSz7cIlDd4hUgdDJ8PkSs4VMG4/e4ot5hltJZb?=
 =?us-ascii?Q?nhsmtIa2Eh2KpAvMhPlSCghETwZKgrIBkAg8cWoLC8ha1MHvbdOZvG0xCTHx?=
 =?us-ascii?Q?z1KmzciBePY0kATbijJO4fmrGw8GEUf9Tq2fvZO+fKLUpAOckL14W8LbuQew?=
 =?us-ascii?Q?KFM5GPx5ly9ThrxYTRXS3EJryoqOpiM0eHnrh6FCY4P5zvApfaJw+Y32rSUP?=
 =?us-ascii?Q?dQosb7svK3V/GZ264iTxA/3RfjA3UG7G6F6L7Xq4K91oEMxxPBugyJ0Psm7d?=
 =?us-ascii?Q?rQNZYXd3+U5kWyxIhdyrSuunDJ/URAeaazJRW270n1Xoi/SXgz18PA5AtP9j?=
 =?us-ascii?Q?DleZj6zRi6l0B+Yk85PVq8Cyd1b6xnDQAShQ5idfEDUndaOGyWTonaZIQeGg?=
 =?us-ascii?Q?+slMf++/hPob0u0J0e6mTWbTGYyGrKBf+5aTJE+q98tSZkX7dA9yabEnC9Kn?=
 =?us-ascii?Q?F8jp/amSsUDhHRzPyEytS0M5fgKkZ6CN8z6XiQ/+9RA08JvTdyaebuJ37+c+?=
 =?us-ascii?Q?A8jvCL4U7xzcgVZjuM2BM+IgrzUVjQqx8JwMkLfTPbMxVokPgAr2VzIKUMmf?=
 =?us-ascii?Q?ewm2hzAfeFs5ctWjHPqrJB+I8MagYq/UQqzkjgrplcwIFLd8o0egHPfdnNzq?=
 =?us-ascii?Q?xtL8mHxKJomDKKZQe7o7oc8fJMblIlNw5e1D6dIobeoSELQktfMj+3R8ivJ9?=
 =?us-ascii?Q?Uty6t9TT23Tg9peD0v+VAisAF9hgthpb6HvMwd/RPi0Z7hMREIWBcJffbvig?=
 =?us-ascii?Q?LLtby0mBxNu4c3IlXnvVW3c5psZ7mU4Lw1A0uvgU7kTEFS1V+HEjYeoMPnow?=
 =?us-ascii?Q?Oq7kTQ7wV8CwfIquS0FatbbxJwePBWfabtwfnB+FielsKR6SnL53iVfTiqLm?=
 =?us-ascii?Q?PNfQ3zklV5bc8ovxbWIXH/DPTEV4nYfoplHerOqXjyKyIrBhVPotc3uI2im/?=
 =?us-ascii?Q?sSXtxISbqA6DvdHI/vHvhPQU9lPMGVZ1CPF4gRECXz3b/Q/sA9sFtkC7udjk?=
 =?us-ascii?Q?GMLbKtKO/IRItY4Vsu1WRsBBLh2YLyTY8peRgdKMw7yQxGBdK/8Ijk5h19Mb?=
 =?us-ascii?Q?Rx/0xGYv7/APfW0juVtSOzKm5CG3kEQpuRfXS7p9NSamaBYZLzDCUJeNyNCg?=
 =?us-ascii?Q?S0jBL4JE8sflzUHzvwvJnUum80/AXyrLjqdXRybyqFSxMLFhkqbtdO+48sRN?=
 =?us-ascii?Q?PV8Imz1sPi8w80sSRcuALxErwH6wl6S+MWKrZE2tWW9nQCjYkAHjIMhYdxjB?=
 =?us-ascii?Q?UdoByTggCq+MW5QC9RTF7Y3Tp+1hInmwG6EYwPDUNl/JOSKzcr4bwqkzuLxa?=
 =?us-ascii?Q?U6wCZ8igIWZ3sXXLyBDqvKgJEkMLRy64P19xprcI+22yMs/FwJgN6KnOCCrL?=
 =?us-ascii?Q?MzS2Ypm1JDfOqRq+Hnu88EiIi6kC3uvXGcaBKZlB8uI7cjcusR8IPYLgKd+5?=
 =?us-ascii?Q?XSUwjqI9Si21zR3nRQ0OgGMyqk/WWYUZ/HvS9QGMdFy5NBBnmUVIJ5/1Gy2Q?=
 =?us-ascii?Q?Lr6I31bzE12J78aXG0/VgBDd+TGmqmc7HFDYFCxemvlZEJqRCPGpVblCXy7Z?=
 =?us-ascii?Q?nP3t7+pmCvobCNVm26Y=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8df44ce4-7d71-475d-cf06-08de30f893c1
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 16:42:12.5748
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0rdZLdY9R1vaBVdcOb50QicE3m/MLzucIOCOKEo1zYZ1Kvqi6WXkZkLgSlHp3kizLguUw2tDrYMEaBGUm55Lgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10076

On Mon, Dec 01, 2025 at 04:08:33PM +0300, Dan Carpenter wrote:
> Add the GPR syscon region for the s32 chipset.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  arch/arm64/boot/dts/freescale/s32g2.dtsi | 8 ++++++++
>  arch/arm64/boot/dts/freescale/s32g3.dtsi | 8 ++++++++
>  2 files changed, 16 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> index 51d00dac12de..3c9472f6c174 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -325,6 +325,13 @@ usdhc0-200mhz-grp4 {
>  			};
>  		};
>
> +		gpr: syscon@4007c000 {
> +			compatible = "nxp,s32-gpr", "syscon";
> +			reg = <0x4007c000 0x3000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +		};
> +

Please cc whole thread to imx@lists.linux.dev.

I think it is not good method by using syscon here.

Suppose using standard phy interface or mux controller interface.

Frank

>  		ocotp: nvmem@400a4000 {
>  			compatible = "nxp,s32g2-ocotp";
>  			reg = <0x400a4000 0x400>;
> @@ -731,6 +738,7 @@ gmac0: ethernet@4033c000 {
>  			compatible = "nxp,s32g2-dwmac";
>  			reg = <0x4033c000 0x2000>, /* gmac IP */
>  			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
> +			phy-sel = <&gpr 0x4>;
>  			interrupt-parent = <&gic>;
>  			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "macirq";
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> index eff7673e7f34..0ceca3caf133 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -383,6 +383,13 @@ usdhc0-200mhz-grp4 {
>  			};
>  		};
>
> +		gpr: syscon@4007c000 {
> +			compatible = "nxp,s32-gpr", "syscon";
> +			reg = <0x4007c000 0x3000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +		};
> +
>  		ocotp: nvmem@400a4000 {
>  			compatible = "nxp,s32g3-ocotp", "nxp,s32g2-ocotp";
>  			reg = <0x400a4000 0x400>;
> @@ -808,6 +815,7 @@ gmac0: ethernet@4033c000 {
>  			compatible = "nxp,s32g2-dwmac";
>  			reg = <0x4033c000 0x2000>, /* gmac IP */
>  			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
> +			phy-sel = <&gpr 0x4>;
>  			interrupt-parent = <&gic>;
>  			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "macirq";
> --
> 2.51.0
>
