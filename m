Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010048.outbound.protection.outlook.com [52.101.69.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DB74A02
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 17:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772733101; cv=fail; b=uHiJ/S6VUwChiyoGN0iZEGn8OaGwjnQqf5ufjiL3I8ue4HvukCw40p5P9+s+S1uXbK48zjW63S+V7ZpveDaXutz917fa2kfIoDbb1xYpnBx5NckqCrgkB2O9aZEhZivaet3fs+1JtiROCJuiNHG0m8qCF931j+8xAuCq/i54YWU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772733101; c=relaxed/simple;
	bh=1nD/tOAtL4hU+yaaRTAbT8t6q/zr//1tkiHTJ8Fm29Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZD3iYhs2Xs/eUNnaC74SwiqAo84AWTiqXZwxJDhbcpao6Y2LeR+wrUzEL+uYayLaKF6Y/8AQHu6kjNWdbvjQiZXlnROBL493/b2WFLAjJ2aTFf9S4ht/u1xSh8Ru9oTaM0YkKQOhjoLlVTD2jE4Tvs4DHZ5THAzpVvyoHUcZ3+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gYQLFsXZ; arc=fail smtp.client-ip=52.101.69.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gYQLFsXZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JbbcSUAjID5fL6kxiSdKkSLRhmH0cjFm0epqjmNbNiDFTaTaN9nadyxdvHtjKcnbrg9EVoZqTuPUUUIegSu90wT0XPA5Yd5gFvcwyejiOUJwq//PRJtuRjavwjYBQEp1Q4goJgknNQ/hx/S+FsW6+1jjcIGjdUZiYM3oBXQayRD3biGXaCq51kQq3ywTlY738XdTnJWaF/mfro4hPzs0XMIZc+r+CEZC+yXG7+FcX1U5XT92WVhcowc95yoLUfcOHzBizlXWjJHTchbcefXqPPHhUjcC5IlfqxBPU60mB6jiqz2nOAqMcuBrsZDxxmqQAipkpWO4QWWUJQ779117EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qd25068U3mvjxsTNqDBQEPmWUzBVqNAbRwr+HMsZ5fY=;
 b=oIM0nW3FqZKxyWusSK7zkUwlHtaS4TbQHdtn5a2MIoW/4P5LKW7AWXQnVlJeWbx6VE+KsuBTFCiPo6XvOqKV1qBDfWotAZCqKhNBaZI7Bnf2hy/3RwwlJDooqQgoyle3xQfjRE+xKjhVPMk/5oIYmTbwuo/eMEhJOz1roC4Bm0G3aW2FcuHJtuEVW0pV0nayo+MgqKSTEnKYCrMgEopaVA1wCnMhFq9bsHBGf7qhoPMICWyoGq9sgLOTrorMXcGnRBOYq+BZ9nqgDD3tO7ibbHup/ogq6YqNY3AZwK571u2urvT8U2E1Zsy2uLRmA5BPLfudRg5kZaQmQvUzASAZSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qd25068U3mvjxsTNqDBQEPmWUzBVqNAbRwr+HMsZ5fY=;
 b=gYQLFsXZBy3kjG+E2MxQVQn8P50Tvq3AjilDClHAL6SgXOgkv/bqDOOWQeqwB2hFoOUCmbTvsaAqMx3sMFSYXSVFBaFsTpCoqQLzld7oVE617MAV5KvpiMOpQqgqMNHjgRJFLshioVhLiJnwn4eQfusjC5SzKntAFLQQ+Z59Mf69l1DnmW/6QeJSgsez4ON9GXi7xM8xrijkrvulKJrxRAALTw/V9zcMv3XrsagPJTFPa9kilncrS6bnozU+PzTFuvjbLatXSSCBzNefERUb278Np7K9pPdQP6Wi34EQwPOyPghqvSh3MmBaLGHqGBhgXLn9umw91vJZJkFqB/9vLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA6PR04MB11802.eurprd04.prod.outlook.com (2603:10a6:102:521::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Thu, 5 Mar
 2026 17:51:35 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Thu, 5 Mar 2026
 17:51:35 +0000
Date: Thu, 5 Mar 2026 12:51:26 -0500
From: Frank Li <Frank.li@nxp.com>
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/6] arm64: dts: freescale: Add Verdin iMX95 support
Message-ID: <aanCnv0W9x6K_sQ9@lizhi-Precision-Tower-5810>
References: <20260305-verdin-imx95-upstream-frank-li-base-v1-0-823fad02def9@toradex.com>
 <20260305-verdin-imx95-upstream-frank-li-base-v1-2-823fad02def9@toradex.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305-verdin-imx95-upstream-frank-li-base-v1-2-823fad02def9@toradex.com>
X-ClientProxiedBy: PH8PR15CA0012.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::18) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA6PR04MB11802:EE_
X-MS-Office365-Filtering-Correlation-Id: 87460365-8360-42b1-3806-08de7adfd79f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 uCpl38nONzkbVFtqjqkBQM8yqZEl/xEv4DScvtjV7EBXsholp2KiA0aZOe6jTUaytS/TFwBypIDA9s5lCFgK9ZJReZaPfl48hf+YMjYDUgSWueSk8pfl9lFbXYM8J5XhN3h5a2pIPHMxW8WVCfjbJYgXBwD88HGydkecM1apQm57dS8Q68QzTZLcK+Ak+et3lT8lzShXimYz4o1LVcpfEAzWZe9wPEDoCME5aazitUYAgi4I9o/TXzcQ6I03WdrUQapyC2ShpE6BgYUEXYsOqLZxl0oz1+IIPrEKHmHsC6i3ehWRT9YtVKGFmqXj7p5WFhRt8pnjezSj/b6vonD8iwhps05xkuph/gOJS/sLth6x68TB+2q0vPOJVYhwtru3ShMU8LnZOHkIeq8sotO/a0gQq1vKhVPpxBFyHUX7C6c3wZQmVg/iz8DLFhtqfd84svUhJPPkrN+UpZZLdZpv3LPjosZomXy6VvzoPS1T3Cpz3EnMwfPMEUPsXQIRPTvfaqfa/EN4qb1YvNqyJ4f8FSbbZi8WRe46QlPckcKB2sLXniJf3R8YAFEF1Hy+ko/5xriLfDknMKMmuTtigGXI1zfEalYGjUpoHeiAio79beDwc3dzOifMLhVWeqGG1r87UD/+SgdfM3L1NV51ehl+qcwbfKEtl1FCYGcDmz8y/wmVzckY3vUoVUapMvQbPWJn5moHsyTe/MSAYVwxyY1SdKES3w1YxJZtsM/k/SOcItIpXFzTyW8YdMXckCf8R3ZJcttwn0VKJaL/jpYUa0TYQN6pFIjdrMxC6kC0uB3mnA4=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?uslQGJgxr9LMl74f9oeqftWGdQwF1dw96MMeOUMxoszDKPOcEiQmLF3PvlFt?=
 =?us-ascii?Q?e6UhggA/4XjlXtUmSj8XNSzALaMjlZopmbHzkVk51hHwhojzpcrvl328GErl?=
 =?us-ascii?Q?F8DraGx9hLxq+E/BZiyqHWnpxCh926q4d5pbyvR7P1QlTtG/Z9T/HmddPcPK?=
 =?us-ascii?Q?RUFzdJmmhP++zAmycda7wkQihX9MgW0Y+v3esbSTEQqW2sU1c3FcMFsOMuRj?=
 =?us-ascii?Q?0pQQiij+O3gx7tsRyVb/zc55SFKQouGmdGQX9xmE9bT9aInNG7pyoqwKgElH?=
 =?us-ascii?Q?H75yfyWKlvasUakC8VnCJ8kbJuBNbStn/KBzPDFgsMeVbaaZ0ClC3LohGXbT?=
 =?us-ascii?Q?Y6LdOjBHQNOYtbcR+E3MJek6jQMaEe9I3aSG4s9wR3yCH6k90G565fsIXglG?=
 =?us-ascii?Q?Prcz2s5vQLO5nlWdxeciat9yPeYoYhXakLUorTBFQbpLg5sThkIatmv8cN9C?=
 =?us-ascii?Q?RRoB1VkswxZThuMNFzO49C10wzQJm0kXtPDq70OkpE5llHHBIRDhy/7YLkmA?=
 =?us-ascii?Q?a4ViAt/7CuTj1MlOrSgepThHs63ew61lfB2zTiRYmaZbrX/zRiQr5IENAXRk?=
 =?us-ascii?Q?DgbWb4Ht39e7aRVrsEwFcuxhET0+4Np0wi8hJIp61/o8MYlxyH539cQS+hPx?=
 =?us-ascii?Q?ofexOvhYyqtWnSTCBE50rcgLtTxsSTDTgWZulYgSpNkpgioCAsVh7WQu94T7?=
 =?us-ascii?Q?tT2IzDCI1j4+Yw4iWn86WnGk66UGYh4VFbfJbWA9JkIPfCArXUdyEViJjfdl?=
 =?us-ascii?Q?9IK3/znuttctoqU7PNyfi2yJN457ze9ed8PKL/mSiWrQOYY29iLW27YlLeUZ?=
 =?us-ascii?Q?FFkYUz3gfq/vdBd4v5T91gSnRSmn6yPtl/byY6Xsye5o/Sd4vWq0Cu2BBWLE?=
 =?us-ascii?Q?sv8XujcFGP+9ztV+SU0AakmDPvuGEawJc4SirQXfWniEmPkjAm00WC2isywz?=
 =?us-ascii?Q?f+sWzAmjvvYpZMpQHWAE1+1kh3v2dUSAjLfzSGesqITtBNStQ8fY5PcgBEdl?=
 =?us-ascii?Q?vG2TvyUgLj9WosxvRXkIZiRTZ4Qfo+ouv345OvRwWAkph/HHLYLll0IpoiRq?=
 =?us-ascii?Q?58myaV6wZLeKxNa8kQdmnY9emBT5lnAReYAoD0U/2qYOxhSw1CaHtdaysBuh?=
 =?us-ascii?Q?oRGjbilAMeTTZOnm316Xi8/k8RpDmVhxHEL1QnPbvZ/dZQbTAn1rYUFD1+ZA?=
 =?us-ascii?Q?r4YKmYXG3PZGcr/l7OSXMeNuGwEy+KRsdx80dGxWyPQl5GpFL88t0M9gUcoL?=
 =?us-ascii?Q?6rWvxGfbVjIRJY401GCezlh0V6sDvTg+FVY8VwUsaUd/ef96OnIGVt/iqGE5?=
 =?us-ascii?Q?ob3YC50tF5Iiy00YLbjuUlsuuqiUfAuiQGMk3BuK78b9BFC3WN7ZIUfCJc9D?=
 =?us-ascii?Q?V4uEc1/9rTUpdU5TjE6U6iqh8+iIkkjJUqtmn1xR2lanp6GZVRCpOASbPpKU?=
 =?us-ascii?Q?gZiyG+tF9AAdBQzoM+sfbLnpdjyy856BRTMjH8m2+TxVAPHc9ktTvktYPFpi?=
 =?us-ascii?Q?jnMvK9sZnl0cI29TdsI6GO+S0AwMmZNEofYG+ph86mzX8vSgiI7I6Beweax3?=
 =?us-ascii?Q?ktoCCYuu6TNY//MqH7VzcxEOzojjNYB7imAVCHkn9+ULDKdQB6pDCbkaX6lL?=
 =?us-ascii?Q?jC9wlj/epYHSzs3z7FV1eo0AzeB01U5binzwqdgujotmmImyICTDHFT++ttJ?=
 =?us-ascii?Q?ZYhQMHkEgKZtFuc6QNjR8+mK1y4A9PveRV3He8z079TpaX1Y?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87460365-8360-42b1-3806-08de7adfd79f
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 17:51:34.9432
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GzFiWadvOdto8O645Ob2Ge/dbEAB1JZq8/ZRVUS8rNWLBFIBIjtDKxeTHYtQTJfIb7GvLD6a4r5PyXjcaxPn1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11802

On Thu, Mar 05, 2026 at 06:24:30PM +0100, Ernest Van Hoecke wrote:
> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>
> Add support for the Toradex Verdin iMX95 and its development carrier
> board.
>
> The module consists of an NXP i.MX95 family SoC, up to 16GB LPDDR4x RAM,
> up to 128GB of storage, a USB 3.2 OTG and USB 2.0 Host, a Gigabit
> Ethernet PHY, an I2C EEPROM and Temperature Sensor, an RX8130 RTC, an
> I3C bus, one Quad lane CSI interface, one Quad lane DSI or CSI
> interface, one LVDS interface (one or two channels), and some optional
> addons: TPM 2.0, and a WiFi/BT module.
>
> Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
> Link: https://www.toradex.com/products/carrier-board/verdin-development-board-kit
> Co-developed-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> Co-developed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> ---

...
> +		usb1 = &usb3;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial2:115200n8";
> +	};
> +
> +	cm7: remoteproc-cm7 {
> +		compatible = "fsl,imx95-cm7";
> +		mbox-names = "tx", "rx", "rxdb";
> +		mboxes = <&mu7 0 1
> +			  &mu7 1 1
> +			  &mu7 3 1>;
> +		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
> +				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
> +	};
> +
> +	connector {

Please order by node name instead of label because node-name generally
is fixed and standarded.

Run https://github.com/lznuaa/dt-format for new file so needn't check node
property order manually.

Frank
> +		compatible = "gpio-usb-b-connector", "usb-b-connector";
> +		/* Verdin USB_1_ID (SODIMM 161) */
> +		id-gpios = <&som_gpio_expander 5 GPIO_ACTIVE_HIGH>;
> +		label = "USB_1";
> +		self-powered;
> +		vbus-supply = <&reg_usb1_vbus>;
> +
> +		port {
> +			usb_dr_connector: endpoint {
> +				remote-endpoint = <&usb1_id>;
> +			};
> +		};
> +	};
> +
