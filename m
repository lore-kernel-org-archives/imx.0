Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010054.outbound.protection.outlook.com [52.101.84.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4723EFD23
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 15:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774450889; cv=fail; b=KN0M7AtYUlHu7KrGLAVfkwKwp/xXihtsKPPMJH7DL9Tus2jqb3L48pxTuvJUOJMXi8cYzXe4MsCs6yChw9HO+rl9ewSwQbo/gToXf4I/n3MAw5uoVleOH/wLBUKSEgYKfKCtPga3Spkiy3L6i2apUJ8yjeBwB5lf11GGQlmKsNQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774450889; c=relaxed/simple;
	bh=nSvlUjXG8Jfj+aJLo+ZZSbGklX0OoppZDCspvkTLIMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ffBVFIa11nTRm8ERyPEHCfuT6Lff8FcVqy9iyEhp0w1zoIztPO1vragSBZVudDpV54JtkQN+UUiX2IcyQDBZlLJgoINu+EKbOMAFgn3yzvlK2p8NM5UEioUCKYIur5zDlI353Ogx8XlfybmyxZWVfPcMK2okhAyLNbXrxZp0XKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ALcwvNFr; arc=fail smtp.client-ip=52.101.84.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ALcwvNFr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VxCcgkrqGRtEhTQB6Uq+qnANG8BuX6OZeYoCz2YrmAXUw0spHem0xjlKz/hm1S7zkbqDg3ESuLp4kyxoZyzYExr30pIC5LGfwBLwlqKilqtq03bcZGzdHDCUDZHdiY0X6NQ7g8HNVhWUf9xrBwWpV4HM6Ux+awlFPYC+Oeqz501qcmW1sBPy3FbRVXcmGpDcqo//dC69HRvdMCH6/V3vP2q+Yasq026xNgApOCNZRPOEIuYtSH5AgJ7IxEv6661MVeCI25YH/2r4d1VsuK2FlpISTV8OuuQrP63PxVc7TPd7v6EgZDOzbNNCAFxB20oIUZKz+z0Ga2y3uJpz9db/6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gv9HNQ5MoPLy+t0XbwaCPyA2iytsG9rMYXRd60f/DWc=;
 b=Wl7FT47M/DE5Dmh7tzGHBA2ZDt5GsT+STR1JfZc3jmesrv+pJHmj7SxRTTS+U7BIUk9/teKB7lpxysG52oA2/HB2XZaLeV7CXHHYdKGpyouAtfFdGqbI9XrhxmUXbl3J5Al6XmU0M/n6kjmCckWG4BHntne5p13nRTXERWeveZAyhoVM01pRwd+2NREqz1j2emkiq6q7Y/ulYGNc44jdDJ3yMyLGQuKdLgmcWujbSV2j4LvECRsJfxLyJspBp3PDQxgyCCU2EyXzPUPlnuEqUYIfqRPAkCH73gr9VLc6DI3bv1Q9Zie9H3dLS/kDlwx7wi14e4OOg/vL7LgEEqzAwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gv9HNQ5MoPLy+t0XbwaCPyA2iytsG9rMYXRd60f/DWc=;
 b=ALcwvNFr/UYmkODwYglgxxTVfyeuzA7XvUylQR7YKjPnuw6b5aG7wIBUrnzn1mEnWhnNc69hUsS7D0XNK8bLnUxIRQwn/TGS00wnxoFJUgT+KgxrXANGlFjLuqwq4D+/fzUulH+WOMpyeIQ20fvORYjeqX4g33s7ytBBQw+sh/HqM5+QYZNXrG2RmcVlYWjGGGcf30AMdgye4GgXlReVis8nFCuLASIGwDwAcTqoL9h9ytay/xe11PLVowQxqq5t3frYpRzVvbLkYQIwFhkWvsWYbaldCoPzX5UJfEz2mBGiFWnHuu/+TR06voVlIcOPP1mWFA3w3eUFzGk5NBr7Mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU0PR04MB9322.eurprd04.prod.outlook.com (2603:10a6:10:355::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 15:01:25 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 15:01:24 +0000
Date: Wed, 25 Mar 2026 11:01:15 -0400
From: Frank Li <Frank.li@nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Ernest Van Hoecke <ernestvanhoecke@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/6] arm64: dts: freescale: Add Verdin iMX95 support
Message-ID: <acP4u5VWZzhFcw_b@lizhi-Precision-Tower-5810>
References: <20260313-verdin-imx95-upstream-frank-li-base-v2-0-bd488be7c699@toradex.com>
 <20260313-verdin-imx95-upstream-frank-li-base-v2-2-bd488be7c699@toradex.com>
 <acK4awcokUyCHrG5@lizhi-Precision-Tower-5810>
 <20260325112724.GA7964@francesco-nb>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325112724.GA7964@francesco-nb>
X-ClientProxiedBy: PH7PR17CA0027.namprd17.prod.outlook.com
 (2603:10b6:510:323::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU0PR04MB9322:EE_
X-MS-Office365-Filtering-Correlation-Id: a0de4e03-430b-49b0-bcf9-08de8a7f620b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|19092799006|366016|52116014|7416014|376014|1800799024|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 4YABHRx9eSTXqYNXpi+ASKc0129YV4wi2sA0B5OSabQvwugYGIQjz4QwGzbiZT9cHwLaKLCofX3Xfb1sKtoTk6wXfXXm8Ho2kkKzMvjvZ1mQn0z5VvFlobs2xx9+RQx6GoATemz7oOPECQaTfezGdDkMiIVFR//jT19jjAiV41RNwSrehwuSlVb1028DtWGb9ds1zJJGwKbBH6/rlDoyJu9Vk4jJZqAe63M/BeQqwzJ8QdikbaCg0pBD5P6HotsXyzyBMYc9/qwnBxoVgZlbyCX2dnZj1c+m0kTMWqLHonVW53rCRzwD91pSiTirW24ljrwy/rq23OKNjExSm7LULbG7eeOnRyLip4u2n9D0uoKUMKhdwO2KupgaWfE5tKXqutU/bQPBdDGCJQKnGQezcYIbK+6lPmUgCiSkrNL2Zec+H+qhp1TwZnftEVRv58SELNyx9w3oS5z/XtLNIdy90Eah0eDh9SflEJ9YiYmjLhFMrZgUewUQrqX5ISfkhXZxWhqKx7B7uF7MsjetyLAnL1XhYRHlqfFXMtf9OiN7NyM1WcROAUShB2TXlvCjid7/YGKOkt+yqHrQMlBjf7VXig+u4LOewGm1FlKR/OWGyRVnYHTJsD5FYBIQ5YzxHpGbWCYERlOgGNaBu5qqzVX2Ioqsobd3DwjjDRD3Ep962D4crIVSnJCcYYgbL/e1rBUdZhmENKT1p72wplxTwRNEYEdjxtM3tn04Z32kIOdJh2nR4tr6sJ5TMaXz5XK7P5zNakxZRzi9302qfphAsv6oJlsUR4guXAz3z3Bxck3KiOY=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?WI7tf3MCyOUbeD5FqaZPp+EtnVu/BY1GAd47AvygoCRdpBBu6s+LLZMQymWN?=
 =?us-ascii?Q?8LcjB5nujG9OZQBf75j57WmKh/1avpL9mFhDoaHZWqRLv75Q9lZZzxuBKtBK?=
 =?us-ascii?Q?Cxvg/IflLEWf4HWxLBwcz/qit9McFxWk1d66+sZAffdYQ+5TVwjmJK2auW24?=
 =?us-ascii?Q?bo4q6jOpXAuxb1pxjzvv2Y0wN/PArpgflx3yKlgzDNPCJ7GvXFs3oIwOzsiO?=
 =?us-ascii?Q?BmxqcTfF53IBsY4XDGDbFy5c+leFXPQS/dQdL+gSOJSo3OmB5cY8L51R7Q3t?=
 =?us-ascii?Q?Q4lzsKYNXxyimr8OC3UtBb8pHc7WPsATnW1ZdjeZrG/+NtLO/whGP2MjvSS6?=
 =?us-ascii?Q?NFr1ownhj4a/txRxHSCL7DiieFYlroZbX68WrfHvxQpFIHShg6dg77cIQR5d?=
 =?us-ascii?Q?n0kmOMWnNpPdSYo6KrOVTR/f9FYhsJctNuY/iTZaJlES73IantK5NRsVxE0R?=
 =?us-ascii?Q?pPeHU37qhoMvTQdQ7zrbi3724EThExN4D5c1ajfEcxqkN/A8pKTl3eo43Nrs?=
 =?us-ascii?Q?WNNMC2yca6LHCbAUU4v3c6zYmahX57TOgYmEMY5k0ZMpFLWVqz69SJvEaoQz?=
 =?us-ascii?Q?eV4k3rYIC4DGIbvQsQMt9YKcGIiVfpRK4tH/fxT+9F4MjRhv5SHydMtgI8pK?=
 =?us-ascii?Q?Y/AiFtLs7LehNgcVVdIjhBMZ36II53uK2sor56royW78ieKxCDOzTEafJzRH?=
 =?us-ascii?Q?6h7/w53r8X2gttqIjttJU4Cn1iMB2DZucEQ7BK75GN2bEO2+vZtHZFhqtLqu?=
 =?us-ascii?Q?jqDrBbS/TkRxBNWJBBi3CfYxEWqRK4dpIpu45hy2U0gvKpmwP200iHLhtj3p?=
 =?us-ascii?Q?ixQcPPpAZiTpuawgqxJ19AI/g7iK9hSo06ZcIWFJs1Vw1B5SbPoVIlM2/iYy?=
 =?us-ascii?Q?zu3Ebv5LcEfq4dHHynHuA+h3yQfQu1pvnWkNjWr+y05ljEWz4+rmd1Pf3Epp?=
 =?us-ascii?Q?rDu9bjqbJjd4yMfJ+JUEXoA9lZGNXpkk/OsanwUiOEYnRfA5F4W+HC8Mi78t?=
 =?us-ascii?Q?FRAg8zJfe/bJMiYDQT96M4ebQ3WNq6ZUqkI30UCe2TuPcqQCxGBtvZY7jDI7?=
 =?us-ascii?Q?qWWuT6v+qN7LrFtx/Jp7ZPGxwBJMI9XOPnLLqQkoeXUfFiY+UNz35pG6+M+B?=
 =?us-ascii?Q?Wa16v5bQBM760PYUK9imrw4GuHdgFmHPemxlTrH1Q7GehlCHp1e5LgHltErJ?=
 =?us-ascii?Q?cI0TI/Gq8lbGHNqsZsn0GFpJwaY0D9RHaJYF80HnmoUz4B8Imo+nCBYMEb7T?=
 =?us-ascii?Q?JmMyFExwmKnbnFmk24iIVksQs7ZnTVsKh0pC5yr8Iuo+/26BKnkP0ub1lzUa?=
 =?us-ascii?Q?OAtrZkujOJayxMvJSjw6M4ISUtHvzC78XmaHsnzFryWe1bucNbNyqdudg8n9?=
 =?us-ascii?Q?myLyVIASWlXwc5AOysweWq4P4aViYG8pIh4NIDElvuZ3fOVy4WdTlH+m5wDf?=
 =?us-ascii?Q?co9AtlWzd9c9BWOwQ5DxJkBOp51mB+jtA2GaVlHU2sqb56JfBjn6IJjhN/EJ?=
 =?us-ascii?Q?1zDvt9qGwfg5Ht4LFsDR91UvL0JcsaRgyeMTGLOkZ8CRr5Y9StOjstjfoEAO?=
 =?us-ascii?Q?2spztuVmID7nnmr97E6L7VfKW3D7RRostaAg7LqhNvfnikZfQC6jamkNwVsW?=
 =?us-ascii?Q?4GtODHQAJQG6+TuuUAyUWEa5TRFCQXU37LEh5gofTPAqnpJ65V8RPTXs+lQY?=
 =?us-ascii?Q?SVrtFPgPM4cazSiq5l2MqEvZYGaHBd+bY5RA0RQ+Ef4WH0CXOKhdMFeE4WPU?=
 =?us-ascii?Q?8+4fBpUUnw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0de4e03-430b-49b0-bcf9-08de8a7f620b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 15:01:24.6510
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uVc7GukBZ9oYDnZGY6+jpCqHgHnarsUB7GWqekRnw/9TrveUdIoPHAtgY3f90aZC5l1XAeubN8AfVvDYSiBCsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9322

On Wed, Mar 25, 2026 at 12:27:24PM +0100, Francesco Dolcini wrote:
> On Tue, Mar 24, 2026 at 12:14:35PM -0400, Frank Li wrote:
> > On Fri, Mar 13, 2026 at 09:57:43AM +0100, Ernest Van Hoecke wrote:
> > > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > >
> > > Add support for the Toradex Verdin iMX95 and its development carrier
> > > board.
> > >
> > > The module consists of an NXP i.MX95 family SoC, up to 16GB LPDDR4x RAM,
> > > up to 128GB of storage, a USB 3.2 OTG and USB 2.0 Host, a Gigabit
> > > Ethernet PHY, an I2C EEPROM and Temperature Sensor, an RX8130 RTC, an
> > > I3C bus, one Quad lane CSI interface, one Quad lane DSI or CSI
> > > interface, one LVDS interface (one or two channels), and some optional
> > > addons: TPM 2.0, and a WiFi/BT module.
> > >
> > > Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
> > > Link: https://www.toradex.com/products/carrier-board/verdin-development-board-kit
> > > Co-developed-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > > Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
> > > Co-developed-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > > ---
> > > v2: Reordered nodes alphanumerically by node name
> > > v1: https://lore.kernel.org/all/20260305-verdin-imx95-upstream-frank-li-base-v1-2-823fad02def9@toradex.com/
> > > ---
> > > +
> > > +/* Verdin UART_1, connector X50 through RS485 transceiver */
> > > +&lpuart7 {
> > > +	rs485-rts-active-low;
> > > +	rs485-rx-during-tx;
> > > +	linux,rs485-enabled-at-boot-time;
> > > +
> >
> > Nit: needn't empty line between status and other property, suggest run
> > https://github.com/lznuaa/dt-format to speed up process.
>
> Please review Documentation/devicetree/bindings/dts-coding-style.rst.
>
> Quoting from there
>  > "status" (if applicable), preceded by a blank line if there is content before the property
>
> I would be careful on taking every detail of such a style guide literally,
> but your comment here is not correct and it's not helping anyone.

Thank you point out,  there are not extra empty line in existing dts.
git grep -r -a3 "status =" arch/arm64/boot/dts/

I think it should update dts-coding-style.rst to match most existing one.

Frank

>
> Francesco
>
