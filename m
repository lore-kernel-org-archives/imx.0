Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2070.outbound.protection.outlook.com [40.107.21.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B2E198845
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 17:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734629673; cv=fail; b=jvW4EI6ElCuMHja1d3dQlUxqO4E3Mw3ObQs5vYZHoWGzEZvbCfRuVSlbctwyzbfu5nankU95TFKV0TClKa8egiqkRcDiBnMVj2DKdpMqZ3RJi4L2h956ibHIEGurcqteycOLm6+cG9uTOmLgjGYZF29TT2oxH3QP2eLaSc/584k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734629673; c=relaxed/simple;
	bh=AzfbML3WK0/ZBRjXTxGauMbtZ5WoNr1JWS4NgjchUQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=U2AICgbsw7aoS4Y7N+auG3qh/pav9zmeaGscOMTiqb1TmOi6Tl4SdJ9KlsdJtdEfcI4vIkL/EtjZHPh4v3aSpiNZwWgILzGEQIIbWNs9dzvPXHnnSyUBhWeGo6NyoEqs1C2GoRSPXy60wGreXQYZVyqaN6pZ5dv2rfxYPzn4twk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VLVC3z1a; arc=fail smtp.client-ip=40.107.21.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VLVC3z1a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6tj/w9mRYvwVc1cUocJuFd/vSqhU4xEbLSJEOQlIt2uHNdTcxRWMjyZes5L+Ez3WSVl7XxAQVQeiP4OokCkH70S2d8iPejaYR8Y8DyoNBoJJpu04BC3pd9vDvyPDUkOMsKXNlts4kDEpJKR7b0MepENezdKfIfOAUcUy2h8oa5uesrlXZGaeDCKi3AHeuexokIU/KWSLsAsGL9duc+uq7/D5y5RjN+XVUVcQ+6dcRP7jF9p2h6jimoF6NVgSIPMXCiUaa8VzkG8pR8txCWAeqB0rOtKRiIaQp8jpyLis8nHzoO3m1MToyFBmDXjxxieHPiQEQoBLgaNysI0o9ep2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvY9fMjDoVrIodD3uYfzvQyxyqhk6LiB3Th0WtyQWUw=;
 b=oC8O3EW15tymmwtfp9VcgD5yECwF9zbrHZUrPbNHYLj73GZcJE/TfrpEExSNHjEg1YkSs83OXQoCyjk1bqS4PfIe3xoMCjwVd5xWqAuL+DWgaGy9QHlD8pbRp5YVxQBF28vqm2JX9UbMS59oeoB/zL+k9SdPuhB19L1lVU1kXEaETbh9yTKXuGB0fgaI8f5i5x4752whiFyliDTBzzdQCVoGPyjVZ1GQpsydGXnLzQD2x3566KcABLJaUSqsC0HWQLoceufyHHQRWpiLSQ3RGb1WTwTzXNbtkNr6j6/hhiVG9F7jframGPsVshkCV6r5qcLriQ2AxsYhU6eZdMazQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vvY9fMjDoVrIodD3uYfzvQyxyqhk6LiB3Th0WtyQWUw=;
 b=VLVC3z1aLg00tA1oSLqjqy+rNUdWJ2PFHIiwcTsJ7OkrQ17n3mu0tDOozSsIocYyeO1oBtJywtSsewFfPERUxZnQoINK2VRs/+tD3Vxz6D6rqp7oOqCYT0kdWQZsNLrTBvv7usF7+gx0W4YY2E3BeneOKPcno8QdZPt9K4Zd8W17UJEcvwMUTdYpUK0zLehdrvVUMkfmlIV1D+fkF7HVO6WJwNCE0us3lLud0NzoV7HLKuE5nvITLvwihXM5Lp43ivtYkxRRHdT5L78zelVy8qCajqQO4eEl4PQyS+Lyv6XfYfCagBYoOiLukmYQny3S+4Ebnq+BB/rukLIg3/5vWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DU2PR04MB9194.eurprd04.prod.outlook.com (2603:10a6:10:2f9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.19; Thu, 19 Dec
 2024 17:34:27 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 17:34:27 +0000
Date: Thu, 19 Dec 2024 12:34:19 -0500
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
Subject: Re: [PATCH 03/10] arm64: dts: imx8mp-skov: use I2C5 for DDC
Message-ID: <Z2RZG7pAElG3TGLx@lizhi-Precision-Tower-5810>
References: <20241219-skov-dt-updates-v1-0-38bf80dc22df@pengutronix.de>
 <20241219-skov-dt-updates-v1-3-38bf80dc22df@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-skov-dt-updates-v1-3-38bf80dc22df@pengutronix.de>
X-ClientProxiedBy: SJ0PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::7) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DU2PR04MB9194:EE_
X-MS-Office365-Filtering-Correlation-Id: c0d0de2e-85e0-4f4d-44f1-08dd2053633e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|52116014|1800799024|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?F5KyKDSaP6tLE5S0h5gAk6GtfOVj46NWBn7SHBa+tAWMJeLikuYcfGHYkZ2T?=
 =?us-ascii?Q?CfRL/BvSWbbKQ/4h9JoE3T6x/ogVuqPqmg3u35V5mQ5uJwO5SzHF0NPfVYCG?=
 =?us-ascii?Q?BR8T4sMcVP9Ljyi+2DtRiULPdX/AT/0WRhwAdhYfLa6Mpqh6ORJq2z/ZibAV?=
 =?us-ascii?Q?z2YLdktfhPKxwKWhr3Ess1iPJoIXWJAPLWRHwEdMA+Akhmxjxn/LP/dnY8VY?=
 =?us-ascii?Q?mVwQnrJQTF/VWcK+fchhft/6/sAMZFy22589hFUu1lXzInDKMZGeqn9DWkZL?=
 =?us-ascii?Q?EzvXH5Pfw9Vl7gqaNt7BUW4W5UbuQ/b4wHQ4sUxtKzaCmqXxyouSyQjt4csC?=
 =?us-ascii?Q?jaZMl26gQ+tqVffh8Ip5evdWXhhLWdjPrwDVPHR/s0FE7WUzyu1XUgCheTuk?=
 =?us-ascii?Q?2pBi1mrhT8NRwuEloGEzAP4tdRry8Shm/8o4iwhb6YRb/qfdW78y/4rn8xzB?=
 =?us-ascii?Q?/fUihQ/RuIjWwzGvJydsZzxc69V+gvG5ol57OWd7ztrX3Nqj5l4nVu2Eqnlx?=
 =?us-ascii?Q?f+vemFUaMGprBbqe8XkbU1uOM6htda9aJJfqYONmdsOzRR3suwLz3lFNPNgm?=
 =?us-ascii?Q?vDAefwaRWgn96hOKzw5PmfBxv/358zNpgrUCnWUB1RUuEt7KXmADDtehefDp?=
 =?us-ascii?Q?w+DEccOF0GSGwqp+swepwOJ4EpxTzeIc9QrLTd4D316i3Bf2EIaKvPLg5O75?=
 =?us-ascii?Q?G0Ch0T1bR2e+D78EgTqSzh2+TQpb7C6x6wyCQNK6/rXEnEsmBtO9tH9iWJxY?=
 =?us-ascii?Q?twvFb9K6he86lxG+9TpXsroFhzZ9goLBIfrMAwiHtlh1IcS04479dU04ecQF?=
 =?us-ascii?Q?LgtAuSqeFy5VrbDka9pp0ywYWJdqcKQvdgZkBrmmc79s9v4jnqsZWUFAxQLs?=
 =?us-ascii?Q?qip+LFj57G9S/IPbJ6vup8P+nxYVAXtvtQ/TAwtL85iXhm3NP/mh76v7KmR0?=
 =?us-ascii?Q?gLtTn0d75UBkc7R1tqNbHUVzWTJaj52Jl4LmPUB5Fm7b8pSee0B6sODWpwiE?=
 =?us-ascii?Q?wteKNmoF2v8vU50q4Q62Ll/1TJLfx3sQR39ZArWr4x9NrqXDoVjN5cmyT2PD?=
 =?us-ascii?Q?sP9IlrsLDh0NeErh3snnku0xM+DNNqEvnjDnnjXSGfCojBZZE1wJQUUhpKd7?=
 =?us-ascii?Q?PpxpiHk7LFTPX5Le9TS5ilWzZSf3EeP32CmbipJ1iurc1LfRsvbl9QdJrWcH?=
 =?us-ascii?Q?SGVuvzSq0IS0hgRxkEPadTJpUAs0aTqxIHQa5EIsSPrWZEQM9Sh8HQIRsI5y?=
 =?us-ascii?Q?g5bCtKigp58I9BoZABHAmYPpynOtddFSxcoiTGgvIMHc7uYj7zCoLkna8FJE?=
 =?us-ascii?Q?kPh4doJ5QVczqwyxsjhByQd/a/jJrH57tT7BrTzfjfXHPpv9k/8qRJ7hQBgc?=
 =?us-ascii?Q?QG7PNPX1Ri+tT0tRp1oGZ5Q2h5qE9tExf6qssHTFYTBfUcJ3UJZ8V5ZvEZ2S?=
 =?us-ascii?Q?ao/S7WWpOAA2tMF4HXDXDPLku3FKG8/1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(52116014)(1800799024)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7spRSco1woM5rTtqvnd9pDy7rwzXKpfs2y+uDcm0+HOmdjtRtJqnS8yfu5md?=
 =?us-ascii?Q?10RopXV/bKteIRmj9Q598x3fsUs2F6Lvx0Njb7nyHBwbzVw3k59R/b01jbh3?=
 =?us-ascii?Q?T8hwlui1GtxtGTsmOnMza5/+Xss9BtfArxmKg2W+s765++yp9Dfv1iPEEk9e?=
 =?us-ascii?Q?N1XuSckewIIh+aZSFDT8y2DGI4jVg6XJMGrWgrI7igpRFuSaaOsQaWEUqvL4?=
 =?us-ascii?Q?W0U6U8C9Ie6gMnzAeIKh5TAci7hEdWSR69FdkQ1v2kV6mOeDiQzOGPfqlpQs?=
 =?us-ascii?Q?behGK8u8wfR3dQTCLG3WtaYhNn3o/KzQCnIm70Tfh6AEr1z47v+z9DSRh1Eh?=
 =?us-ascii?Q?tViZhas0tNpOfnBHIMfQfDCiWCh6Bi85Iw4KHh2XOXK9Sewt8mR1Z743Kmvl?=
 =?us-ascii?Q?qgdixjOw4hn7Uvl6Hg7NIjX4YsHBqyCsbUB4GvCpUuj8r7HfiRI6m2mcCizL?=
 =?us-ascii?Q?zwmGaMo7rsBD9S9AV6BYsnS/MQadR58+LuTHkGoxIHuxh0nx/Kmy8KVvyElW?=
 =?us-ascii?Q?zQS60IwQ8Ms4PitW+XC4Bsx7qLtK8ATDpD3jnWwQ+N3K0ZT6gnfFEphqvAuU?=
 =?us-ascii?Q?w/gVds7pNIQ3EtQvUSi14kAkPojEI2wE3GW23ccUjsT/mhHaCyS/Ms0DF+Yw?=
 =?us-ascii?Q?hzD3u11hELsER4xEhysuePmcYhvYx6zCHZ4qjrI0ZnV/+kZMOBmUNgUaQiA+?=
 =?us-ascii?Q?5q2yUmR2ik68SC3Df132YQeWpnduCCiD2nttVThbMR0LduGluH5ydXTlEOTF?=
 =?us-ascii?Q?8dgBgJdx7AkrGZzMqbe84UDfTmZPppgWa43RnDWowsR1AZsgp+lA0BhRfZXU?=
 =?us-ascii?Q?4tZm5Tu4m3OHiao76r9k3oCBGw8DtuyC7ZRPOn5NsB0xFJTnqxbyA/+c3oIv?=
 =?us-ascii?Q?Gv2KXrqTpY3cU/h3wziZWtfjTaCybTO2FYTKJv4N/O3jHjqfvOWhGexhVWVi?=
 =?us-ascii?Q?24ZC/x9OTP6ng9aoxUtl5atYJs9I5R/NIQXNoZTWgI9/taLPLiG0kDUNXChn?=
 =?us-ascii?Q?z/VzN7i/hjOsPd4wQ3oC1V14JdiEML5YcM19u0Ggm+Uh1w9s6HQMm9Qfc9yW?=
 =?us-ascii?Q?pRdpbxxb2GUplmOC4Y/IegqVAvWRfz6CZppOfQVh0jUHcThBSha9An5jdQaE?=
 =?us-ascii?Q?TwRAVWB++nQJV80wnRWWUmJy5/CDm+xTs+jl40kHfy77g/j3uFHTcc3ZGJCX?=
 =?us-ascii?Q?qFMb1ac9stjFuKk80dTmwPPQv6gqdra53G8SWy+9dG9oKE8PWWVwQ9GoWnP4?=
 =?us-ascii?Q?GcGAOBpyej2D6fYKXgmgDOEoAf3z0Vac8Bk5oPpWSwSitEVNFp64ZPl2UCM2?=
 =?us-ascii?Q?Nu3BCwaFcyVK3O3W7kgzmC4cEEvl5JP8YlQih6PI5O9/ZsyOaAElEtGI85ss?=
 =?us-ascii?Q?BZfilx490c3HIU/60n9RLvdkPXxyTNzWft90K2CnCTt/xaJQVr3ILQQg4Ahl?=
 =?us-ascii?Q?r2VCXo8zm4P4nevASApEHUBpH1HOPM6LJcdEJTqkhAB8hB0FKYPaVjhM3vKb?=
 =?us-ascii?Q?6nGf2wSRMAxx0lfofs49upNmxJ5oId7qswhVxFiuLVklvxcQdJVB9kwsB86o?=
 =?us-ascii?Q?yomRZTSvbslUDV3Ny6jucajyGp1KuCxA1yl5OjGZ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d0de2e-85e0-4f4d-44f1-08dd2053633e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 17:34:27.6830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VebW6W40Lfo/U24TNhmDOnEKixQRoYXB9pOmoC1h4iDWUO22aWhhlFbrTtjcOqO+qa6+vC8fGo5Azco+xkulYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9194

On Thu, Dec 19, 2024 at 08:25:27AM +0100, Ahmad Fatoum wrote:
> The HDMI DDC pads can be muxed either to an i.MX I2C controller or
> to a limited I2C controller within the Designware HDMI bridge.
>
> So far we muxed the pads to the HDMI bridge, but the i.MX I2C controller
> is the better choice:

Switch to the i.MX I2C controller because

>
>   - We use DDC/CI commands for display brightness configuration, but the
>     Linux driver refuses[1] transfers to/from address 0x37, because the
>     controller doesn't support multi-byte requests.

      Designware HDMI Limited I2C controller doesn't support multi-byte
requests and display brightness configuration by DDC/CI command need it.

>
>   - The driver doesn't support I2C bus recovery, but we need that,
>     because some HDMI panels used with the board can be flaky.

      Designware HDMI Limited I2C controller doesn't support I2C bus
recovery.

>
> As the i.MX I2C controller doesn't have either of these limitations,
> let's make use of it instead.

Reduntant. can be removed.

Frank
>
> [1]: https://lore.kernel.org/all/20190722181945.244395-1-mka@chromium.org/
>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> ---
>  .../boot/dts/freescale/imx8mp-skov-revb-hdmi.dts   | 26 ++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts
> index c1ca69da3cb8..206116be8166 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-hdmi.dts
> @@ -9,12 +9,34 @@ / {
>  	compatible = "skov,imx8mp-skov-revb-hdmi", "fsl,imx8mp";
>  };
>
> +&i2c5 {
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&pinctrl_i2c5>;
> +	pinctrl-1 = <&pinctrl_i2c5_gpio>;
> +	scl-gpios = <&gpio3 26 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	sda-gpios = <&gpio3 27 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> +	clock-frequency = <100000>;
> +	status = "okay";
> +};
> +
>  &iomuxc {
>  	pinctrl_hdmi: hdmigrp {
>  		fsl,pins = <
> -			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL		0x1c3
> -			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA		0x1c3
>  			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD			0x19
>  		>;
>  	};
> +
> +	pinctrl_i2c5: i2c5grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_HDMI_DDC_SCL__I2C5_SCL			0x400001c2
> +			MX8MP_IOMUXC_HDMI_DDC_SDA__I2C5_SDA			0x400001c2
> +		>;
> +	};
> +
> +	pinctrl_i2c5_gpio: i2c5gpiogrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_HDMI_DDC_SCL__GPIO3_IO26			0x400001c2
> +			MX8MP_IOMUXC_HDMI_DDC_SDA__GPIO3_IO27			0x400001c2
> +		>;
> +	};
>  };
>
> --
> 2.39.5
>
