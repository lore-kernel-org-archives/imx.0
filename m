Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010015.outbound.protection.outlook.com [52.101.84.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D54226CFE
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 19:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772824806; cv=fail; b=ENeTGgJAccDXYnkvkpzjf45T26mno2lS1vDbUzFgeXL8HA5aNwqCxdn2kscJC0mvypaUSGG9lsvrzzn1f70/oDnC4i5T1dGZDfb4uE8D9WpioboxXROv5ViOsokc1KaH8t8UwQ65/MPJCwRrDcXmCnAgDR1w8KOns+IuHPixHTk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772824806; c=relaxed/simple;
	bh=5J+EVX6pDXNyaHecUREsU2zMwb1vUAfqsKgle9UnFXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TUXCIz4YsJV/srOYkmjHQXtw4Nj2lnAFHjDQiP0kV8DD9J8n5syb4CmmuVTeZmYb8XqcA+9bLwhUHFbM1ubK5eYIlZ1HsAEXqYJlISWSuLehDqMiLgAaA5qM1aK6VrV65yMg17n+TFcoFWr1jKWWymdiI9A/IhoTvwHUUDB6ADE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Hk8nbDYP; arc=fail smtp.client-ip=52.101.84.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Hk8nbDYP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pJ1ygBhQAR24aFebuKHX06hAYFuFB8V7qG12y4jnr0UjUOKvEefO/a6BcDDPOvUst+bfTPmlavNbeFpbOHViQBi5izX/0UjykNZOUAzK4R3+EosVLZ0xSVDjwWsRU9nL+fNd9cxxRj9VEpyWdF4sCxtG0jKtOl7CUi60s0iT+oM5Ug5/h2O0JDZSBNX5gg7UdzoTUtZze138H9KhsPDss9SwGgeY93ng9FCn1AutQjWcM2YXI5jfqyypCOK3Fw1H28SNtpq/7ar2UBrrgrh6mA/WkuslgTL+Ne7FmN3bD5wraCI4O2miiWGbRNM3o2jNffMq/WicujfFURhNd0RUZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oE50GJpHZ5XNtL+cx2jvgfBFPMFvG6iY6gN+BcM/8gU=;
 b=UNN9U1VZy7B5rbOOfLwsqMmJSimBSIVMnndTboX8Ldi1cQJD0t032yuIxdTK3R+VjpsaUro58lK9JJ4pcMsBBGXmE806tgP8CUo7ZR1hK72NzZQG++HgQ7ZVsbwfPhoY6qQrefWlXvHmL2QbqWvuLJLYH8R7tMgP3ZV41o5fDOG7U9j9vQtl1DKXK2KRJcpAjrBKJfSwSs8+PL1A6NUjyTMEDDMbd/e8yalOImIRDjLLd2bg4LoXHexzhTsGMKdnLpnuBLg/XFQZEkurP0QY15XcF2wlbSUlajeQtZLdKO6LCFq+GqU2+69yzvC0bp1Y73RVF97DBJCSG8xFUNGPlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oE50GJpHZ5XNtL+cx2jvgfBFPMFvG6iY6gN+BcM/8gU=;
 b=Hk8nbDYPutZ7kdnnt7BEpgR9Ux2yPvGBzqgw78MXShK+pBHgeWT5BX7LPaIhdeBEEgMT80n8cvzYeHoNGNsmyrFmffZkQmz71ZSpNwIBmUpSKtoAt8P+wdQeGneLp/mmM+kuBZ4lOM2Rrug24voQlkdEZa32N3tfrzpwe+CkjX6vVAEhvbZUO4T1fE1PZF0ispjlSBYRCCO8eO9fPW6TfOmtyLzgd+qKQ/j7/Dso03WSS+ihxOn0x+/LjShF7VBjx9zUTiBQU20WROAVtfwGTTqy8qsZxqJoD63CzzNTjY3W2/0gQsXYyo6tLDtDiX/OIK+btebO7Hz9MQAsFj5x9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com (2603:10a6:10:35b::7)
 by AM9PR04MB8809.eurprd04.prod.outlook.com (2603:10a6:20b:408::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.20; Fri, 6 Mar
 2026 19:20:01 +0000
Received: from DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4]) by DU0PR04MB9372.eurprd04.prod.outlook.com
 ([fe80::4f6:1e57:c3b9:62b4%4]) with mapi id 15.20.9654.022; Fri, 6 Mar 2026
 19:20:01 +0000
Date: Fri, 6 Mar 2026 14:19:54 -0500
From: Frank Li <Frank.li@nxp.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	jun.li@nxp.com
Subject: Re: [PATCH v2 1/2] arm64: dts: imx94: add USB nodes
Message-ID: <aaso2mdxgYIJzB0i@lizhi-Precision-Tower-5810>
References: <20260306102837.2648955-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306102837.2648955-1-xu.yang_2@nxp.com>
X-ClientProxiedBy: SN7P220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::10) To DU0PR04MB9372.eurprd04.prod.outlook.com
 (2603:10a6:10:35b::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9372:EE_|AM9PR04MB8809:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e346449-ee20-4003-e696-08de7bb55cd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	IstEImoL3WhkCj/tW3KFzKnoT7Uf82Y1834fn+lCqEGmzfzOml+9Jccgx0xD0T5My+oiL8wIZSH0VNZT0fR58AiAFr2qxbs6JKecDgjttHnSuGxlOOnAMW8O2JQxb/pPxbj1etWed4lSgx0cITTC5SFxQKtAhDyyP9eJ73XWs3ugql14xV9DYDBXV81DbMKToizHGRqkCbrmj3g0isTX2wpmni3JmnlpfGiBgtJjfgaAT2+B9jRplIRP8utio9wX2N95G7slq0pUGBNFzAhh5WvxzLEZCq45cA00BhVpyD1zWsZJA9Jduk7frzNP+duYPMhKyByxtn41TwgQVWpQpLFbz2uPZms6ya24kL7JKckaeBTA7r2oj8aItIdMo35PeMEa/l+zFdP1XpoTEpMJ9J2vXuOEFMStm1e7ZTOcS9YfEdMZ8gsJ582BQzkmF+Lm09kEyq6KesMMDMok3KLLDOtr9GAgiICcVrXZwCytqeF099emDec58/Ka41NmGvUTxjdqSTMRciyoj1HHXOpmJrhQoQ3V0nIPJ07d6TiV22CymnQt1UInDwCxiNdqqcDhzVDxOOX0dNqnGjyykV8omgpt7vtGPkkiJqrOkL27eY/vsdqlyqKV30NaYBGMRsGazI1oLeNvShtR4OvA8eGT3XQn+yiORdp5F8AK38Y6HDkBg9a0o9cnk45rJXVpGDM7OL7Xk9uIf6RYUuT33eUd6X6qXhS6Xi8RGXds3eQ+HtM1GPHmIl5hOKYCn292HJ0bh6FXpnPs1PAiMl5Yg1FJrdQvPbibINVsvx+O5053sOU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9372.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8Wk+fIu2Fiz4AiG2yb7DjgDn6/4NgRc3KtM/i5bzZqgbeazQT47lBA8u5u0X?=
 =?us-ascii?Q?YX1BcCTvIIwX2/fB2UsVgPzIBiV2E3dpnBBB7mWascar0M6/1RJ/MuYKHj9x?=
 =?us-ascii?Q?1J/TD7A8sMBZt07zQQ8L0IhLgKEJRwDxijIj/cyddOSec7azQsNkQ8z8nZov?=
 =?us-ascii?Q?dnucSshIYBVNkgEAzum5nQsKn88y8reXDJCW6SKgv9mo4xywtHO4lTx9BFcx?=
 =?us-ascii?Q?zdOnsaU5912vw+haecpowNRC8F/QY/RRH2nfLeXhOgNwVqEkgJbADPOYeCag?=
 =?us-ascii?Q?RxZNJLNf1UEWG7iVP+b05ACOP4tgpL69kHrWisw8wKuP1ZV/jeL7FJUvdc/j?=
 =?us-ascii?Q?yGlXqiLjxUd9KzEB0RPyB6hFb4g5YG8s0KtSKB79q+aNS/yYPM1Yso6ZhpWa?=
 =?us-ascii?Q?E+9Mgc5HXHDCDOlMBTSsadZiyTv95qC4zJQd9pcNh5DelAb20YnT3ziCVyZI?=
 =?us-ascii?Q?nkEbZj4Jutl9Oy0nwnDPNIG7Pu76VpacFmjDjPFd7prQzJeeC5Ew8b+ZUsNa?=
 =?us-ascii?Q?s1oWWC6sovujup4xz3XAf7iKwzIZLUL8KkV6OpPsw8CJ6fT6RYAr3YwCO30z?=
 =?us-ascii?Q?IavSc01b7A3gZq9Z/ibPM5upCew95gEjRJqWfgwZ3gO+fof9onj6Gqrtj0UD?=
 =?us-ascii?Q?kFBUgGe8wyNOzGW6vURly1qW19cl58joJy7Tn12EdL8M3bg8TMsnFmXD9mIA?=
 =?us-ascii?Q?7rPYSApHAQoctW2ZMaWd0fEdYyul3FFY5zqXZv4BRZZIG7v5FFNvHKjAaznI?=
 =?us-ascii?Q?drq9bscYmmsqGuGwHoMcfXC+gmGNn9qggXJK7nG5UZIyxZc8tXnUFkTlXmai?=
 =?us-ascii?Q?qIwMzm6N7z3++paRcQBhQJLBB2zcbUv2LGcBkNUYNeHlsHcoPgi5GLbXE8z4?=
 =?us-ascii?Q?fJKjExT9TkhRJU13JVSjLscPmQsgDh9k5VpbGZP/wpq8mlnAGOcqLpsCaU7w?=
 =?us-ascii?Q?wIVNPiQtijUS9kLAID7fvcWtajeOiVS5raHNFEfpKnNBvwZoUuwLKeSQiFkf?=
 =?us-ascii?Q?3h1h4QoFJ4W8PdRUtzTqyX1Bo+DdR5wAo4rZjyx4dt0IePkhEbxmrmvNnJdB?=
 =?us-ascii?Q?cnYixJhmhN5nQgYuvzdpjsZsR9luqIDxt6GgvzZALthEhf+PcqRTTHiX4tnT?=
 =?us-ascii?Q?t8qIkkCqhFKWdfuOrP///59r2JpKzJH739Xc11C3qU60RMXq3du9uW4LXcIb?=
 =?us-ascii?Q?qpvcqRls7QmBlp1GgbjYZYYfxFLcsDb0JnUzAlvB27Puku7kyhrP3mbi49gW?=
 =?us-ascii?Q?cuLk6bl1E0Trr0z3ToDB1N09bJfWWho7i8UC9nmN6G4YCpycI6qytmDhzqiz?=
 =?us-ascii?Q?q+1mc/zO6K2Lmi6SHtZCS5pxq9qcQDgJXMMI3eugBZ/tFlm3cOCbXn0i2JAd?=
 =?us-ascii?Q?6yKR0SSlaaIGar7kfRAQiqrkR9Jctq4jUhntI9q1WRg3U8PdUKlaS78HdVvN?=
 =?us-ascii?Q?dNeBSszeVeVX+sLZPamCq+X3bfo39Xe4SKdvFl6v4UTUidIcV+NtMGMAn+zh?=
 =?us-ascii?Q?de1U12HK1p0Lb/xau1a0wJUffvWeR9ISrW3cSaQ9sshe42MvTHIfnhLZhZ9N?=
 =?us-ascii?Q?ZdJOqy+0eV6zEGSoOeOlySC6DThz8HUttal9vfYPpBLb9HC/rdKYqPYWmFwe?=
 =?us-ascii?Q?YChyvi4ksfCU5U8SCQTjMvbPdPWDqj34EYKsJw40Syk2MBnG62+cvbLIzk+0?=
 =?us-ascii?Q?hhELkmV4b8wVNYUbOQbK6jmCZOLdP/ngkITP+ylUmqhz0evm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e346449-ee20-4003-e696-08de7bb55cd6
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9372.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 19:20:01.1374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fm8LVOsIfjFMFKbzMZkJXY7+xGstzNnDxzd0xKd6/RwXLXHEKryEAv4tMrTE19g7SL8LRXbacgmt2JuRisaTeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8809

On Fri, Mar 06, 2026 at 06:28:36PM +0800, Xu Yang wrote:
> add USB2.0, USB3.0 controller and USB phy nodes.
>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>
> ---
> Changes in v2:
>  - move usbphynop behind of clock-sai4-mclk1
> ---
>  arch/arm64/boot/dts/freescale/imx94.dtsi | 61 ++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
> index d2f31c8caf6e..2a367764f7fe 100644
> --- a/arch/arm64/boot/dts/freescale/imx94.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
> @@ -66,6 +66,13 @@ sai4_mclk: clock-sai4-mclk1 {
>  		clock-output-names = "sai4_mclk";
>  	};
>
> +	usbphynop: usbphynop {
> +		compatible = "usb-nop-xceiv";
> +		clocks = <&scmi_clk IMX94_CLK_HSIO>;
> +		clock-names = "main_clk";
> +		#phy-cells = <0>;
> +	};
> +

Sorry, position still wrong, please order by node name usbphynop,

before, interrupt-controller's pos is wrong,

no @hex at first, order by node name.
have @hex at last, order by hex value.

gic: interrupt-controller@48000000

Frank

>  	firmware {
>  		scmi {
>  			compatible = "arm,scmi";
> @@ -1223,6 +1230,60 @@ wdog3: watchdog@49220000 {
>  			};
>  		};
>
> +		usb3: usb@4c100000 {
> +			compatible = "nxp,imx94-dwc3", "nxp,imx8mp-dwc3";
> +			reg = <0x0 0x4c100000 0x0 0x10000>,
> +			      <0x0 0x4c010010 0x0 0x04>,
> +			      <0x0 0x4c1f0000 0x0 0x20>;
> +			reg-names = "core", "blkctl", "glue";
> +			clocks = <&scmi_clk IMX94_CLK_HSIO>,
> +				 <&scmi_clk IMX94_CLK_HSIO>,
> +				 <&scmi_clk IMX94_CLK_24M>,
> +				 <&scmi_clk IMX94_CLK_32K>;
> +			clock-names = "hsio", "bus_early", "ref", "suspend";
> +			interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "dwc_usb3", "wakeup";
> +			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
> +			phys = <&usb3_phy>, <&usb3_phy>;
> +			phy-names = "usb2-phy", "usb3-phy";
> +			snps,gfladj-refclk-lpm-sel-quirk;
> +			snps,parkmode-disable-ss-quirk;
> +			status = "disabled";
> +		};
> +
> +		usb3_phy: phy@4c1f0040 {
> +			compatible = "fsl,imx95-usb-phy", "fsl,imx8mp-usb-phy";
> +			reg = <0x0 0x4c1f0040 0x0 0x40>,
> +			      <0x0 0x4c1fc000 0x0 0x100>;
> +			clocks = <&scmi_clk IMX94_CLK_HSIO>;
> +			clock-names = "phy";
> +			#phy-cells = <0>;
> +			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
> +			status = "disabled";
> +		};
> +
> +		usb2: usb@4c200000 {
> +			compatible = "fsl,imx95-usb", "fsl,imx7d-usb", "fsl,imx27-usb";
> +			reg = <0x0 0x4c200000 0x0 0x200>;
> +			interrupts = <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&scmi_clk IMX94_CLK_HSIO>,
> +				 <&scmi_clk IMX94_CLK_32K>;
> +			clock-names = "usb_ctrl_root", "usb_wakeup";
> +			power-domains = <&scmi_devpd IMX94_PD_HSIO_TOP>;
> +			phys = <&usbphynop>;
> +			fsl,usbmisc = <&usbmisc 0>;
> +			status = "disabled";
> +		};
> +
> +		usbmisc: usbmisc@4c200200 {
> +			compatible = "fsl,imx95-usbmisc", "fsl,imx7d-usbmisc", "fsl,imx6q-usbmisc";
> +			reg = <0x0 0x4c200200 0x0 0x200>,
> +			      <0x0 0x4c010014 0x0 0x04>;
> +			#index-cells = <1>;
> +		};
> +
>  		netc_blk_ctrl: system-controller@4ceb0000 {
>  			compatible = "nxp,imx94-netc-blk-ctrl";
>  			reg = <0x0 0x4ceb0000 0x0 0x10000>,
> --
> 2.34.1
>
