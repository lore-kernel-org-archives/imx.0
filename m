Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012053.outbound.protection.outlook.com [52.101.66.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530D033EAF3
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 16:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768927297; cv=fail; b=LbjQrf4Y8jeBrWNWH1yRa9D9F9HhpFbaVvDk90r2M6p/ui/5Pwslt/5s0g1sOAfcE7aed4Pp8CkBvU7LfIchsnIhRblbzzrZrcRCg3wfZOAfy43T7jHBkhc+YyazdDCQjc6MOy11guNUTOw4F2OINjnBAfGdIbY+HDfTgBAeR9s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768927297; c=relaxed/simple;
	bh=TgH70aNQ1bKmkq9oIaK4L8DGfH/rG5a0FwsHqGdwwoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TCsfqiY2S0k+dFbVZGbNEJCtaUBvnTEnmrxoFVteymb/L3xaBl5CtcDo0DmcNlKIANb3QIFzOK3O6sR40gWG9S4zJNi5OI/4VGx3zZuIzVOfgD9vc7rx4GW9WZQT3b7hSXOafQEFZpL+Lx0C7IaKD6YBJqxn7ftrghZb+JM9bzE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ectu4SeW; arc=fail smtp.client-ip=52.101.66.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ectu4SeW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lFQQ/X5hMwT8kktUrrXVp6RtHPWN17js750a2QT1Peu+kcGPbVa98ziYWvbOExi4GBIPNm+/DV4BqiioNMS29FThTSpYa6Q1lC61zkG/8ibnxBBplXTTny6e6eH62xIA3u2BzngO6COsBJei60J3JKr4lny/j/CfY6VcWht5Jqby40D/NlvDKawYzknHsRQwT5e+rl84xRl7t4KCKegQeMoBoOHGehlsLRxZw8yNad2mFukxkZUmsEPTyefayoEZhSmecdvh+qMI8P4e4s5uirZ3DnrVXcP/1b/+Zh+EHrjNh4pxMwPEaSRLLVqgawBVSMWFSUOkMopPvQbXa1peYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8HhkKaNdLXR7/1AOzjpYU9EV5Ko6lv9Q/zCT6PjDBm8=;
 b=GQ319wz98DTkQLtcfbvj51wcfPTwhTbhbUWtD7B4su3msehPHbEiYuYCja7vrAkQPyKGFqJRkBM8og1bB0ezRKWjUD9M6xz/uQXspxFEKeGu7Tj6C+C3b4795EGF4tGfG/lADBGWX7MJCw19Q3dYoNFYswF0kiHEb8HSmsgA7zOgpDQi5YqIToBVQPfJCa6NQYY/4mKA8ESMOgvRYKo3Ct2sTZSmY7cjuyXK6u6I2gY5UZkjSAn4FB6uGBVs8phC2X3cY/a3Zk4DMnbt/HQsyVIuPdGSckCOMpwSjRrD9URCSEIoOzgnoMPQEds+fcoK9JP5rzvYnPSb7jK9oEM2cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8HhkKaNdLXR7/1AOzjpYU9EV5Ko6lv9Q/zCT6PjDBm8=;
 b=ectu4SeW62sixR3L3K0ojammdR91FhLSKk2yxBOjov/buCxBObIqlG8EDdoUUiVrp7Qu9Jy03pt74v7F+Ywmltox1qndhJ2n3RDVEMVrWx7PZ8IqNaEVhSVLOxZm2+U3giLj57tZuy3Zp/FnFJ3mvUUee2gPI3beCu3jv/u5sN9JbSycO4q4uErh/h+x239kSx9P4VMC5ChhGZVMIdqlMaZWrKPy+DMCnQVKFax8aZ8ZX4lUFVx7FVzFQcEA/B0SD4GbIWUoqaIhSIQpDqGYXZeHlI0BwgAzUJznYq7rHEfzm+Ia4JgRQvJqmTQuzHIYMaPBZOU9nUuFMF08t4VtHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PA4PR04MB9390.eurprd04.prod.outlook.com (2603:10a6:102:2a9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Tue, 20 Jan
 2026 16:41:30 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 16:41:30 +0000
Date: Tue, 20 Jan 2026 11:41:23 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	kernel@pengutronix.de, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx93-evk/qsb: add m2-pcm-level-shifter-hog
 to enable BT HFP
Message-ID: <aW+wM9iEQiO+NmyJ@lizhi-Precision-Tower-5810>
References: <20260120083233.1899272-1-sherry.sun@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120083233.1899272-1-sherry.sun@nxp.com>
X-ClientProxiedBy: PH0P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::21) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PA4PR04MB9390:EE_
X-MS-Office365-Filtering-Correlation-Id: eec75429-7cd1-460f-ac2e-08de5842c391
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|366016|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qHol4PY4ODhYIFj/rhRvkSDzObBIwC0sKMrNcB6C+ElYXV0kGp62QOF+vCls?=
 =?us-ascii?Q?TelEIyVlsa/Q3vIGzFnpglhaX+nSMNfmhnDyDHYv8zrDDG/6yhUc9dZ0ZZ4d?=
 =?us-ascii?Q?RfHN4qPUSAnVVEL+GtdPcTVrURaO0KlZ/SQLzScAdgYvsCr5KcgG6t1sQt+d?=
 =?us-ascii?Q?BclC6QbqAqeCwLk/41o84d8dHHeSy5ODyIgyv5o2BpYrkiqYwyJEMIY3UDtJ?=
 =?us-ascii?Q?bq8J7Hr5rko039uQLaRn+76w9CSccEhspyVR9iU/86vGf5nn3oeZBnmbQdjB?=
 =?us-ascii?Q?3qhtitUGFnk0RgitUvHXXbEc+Lb/31ldGcTSi4YMjZinJ+uxmnTHMjNAKxKw?=
 =?us-ascii?Q?TWZNl6juSi/DdFfEM6TGgO9wHqV5qBgdYVAR+SbEBbLfAB+EIFXGnO5UhPqZ?=
 =?us-ascii?Q?WIuAsXvlwSIGw45qlk/gZx80DlMp65nVtohzc3JEhQWoOrpWe1zMYPoHpy0Z?=
 =?us-ascii?Q?R6j1xCDgykoAFPbJodDkaXLnXzpbDqG0RySydSQO52pRpHPDcz3RhCCEziJi?=
 =?us-ascii?Q?a/OzMCYOUCTOEE16Mj23/8I8H3Tncm7R/ioRW5dJ4/jeADaqDGwzuKkrh4iw?=
 =?us-ascii?Q?g5MjrV2GUFHrxMrtEw0KxB8C2CY+BOs0lVN/qBOMnb6flp/qTil/eIRhmBG1?=
 =?us-ascii?Q?BD7nHzQUWHzr5S3gdSbWcICz7i4vIEgni34Z+qymYeBZVbIeQI8kmSetaY9c?=
 =?us-ascii?Q?ZbtIxMjE98L0DI9h9VH6HqR7MNsDICtcQl8gVPRSOfui6vS+mDnyeqxRE3K1?=
 =?us-ascii?Q?UY7TFDY1efX4AsnABYcKUMBto9uhvumeRtDpstMsQItf5aOt4JdAwyUua3Bq?=
 =?us-ascii?Q?PX56UGHFDqKr0OcsouxwJs/eb3Kwa63LhfmU5Y77wbSJbkOAVZrRNCU7Gfet?=
 =?us-ascii?Q?wt9K9muMhh0GsUFT21qzY4zLbTg3QQQPvQJYv69glbQTek/Dr08ZAsdgJu+x?=
 =?us-ascii?Q?ZD5IxcfUj/hWsZumMCHGu41pF6yhVrA/447vs9FlpN+Mhu6xYkI1GuhRUkaj?=
 =?us-ascii?Q?Tb/ymLWF8Ieq9ivVMeDm1vpuX94MMoF02jHSqoZT93Szg8TkZkde/LRiMBjY?=
 =?us-ascii?Q?La3/Ca2Dkl9BUfGPtHDVd4kTx5TIJ8gNiWlKq2YtU6T+MShLvrZI9Dz0iMku?=
 =?us-ascii?Q?bh9Mq2xNVFhjndtbtmCV9WIRugn7FZ436GhqgpLJ/amGZvV8vED0tsN/Uf54?=
 =?us-ascii?Q?dXd4Dea8KohoZksSnLEZxkU3krTxx2T5fxqSCmluXvYiECJ/Fc4/Hv0guf1w?=
 =?us-ascii?Q?rhg7cO1LMzW9sjyxahHhHkRSHpQ95qAI+y1F+IiidRU56vBBp3Ffj9mz2Rfw?=
 =?us-ascii?Q?GOchR3765sAnpof6SFhU2jn6hkonsE2URegKvq77Uc0TZuD9El43YBcuIz4d?=
 =?us-ascii?Q?MNIJwHZUlCMnw9XLm3lid5HpwpVQIKo5PRWayjfQxKQQTWR6T6KRfbI3ddu1?=
 =?us-ascii?Q?4shIHdOaNqH+1ETHE1D6CoSuUDZGs/TaXvOPp9shzKlaiZC9SHFN8aQMNJgw?=
 =?us-ascii?Q?vkeGfTTnKPutGt/GFny2VJRrk6r/rMlDiPkBs49y3qtv0CWP118J1lMQGFNd?=
 =?us-ascii?Q?Lnh4UNwNx/XOO0lU7jCZ16r4KPiVkeTTQP0Foej/v+oNIQ1cX8mMr6VlmJTL?=
 =?us-ascii?Q?Y2UXfwWA/XD/r/gJzF9tDFA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(366016)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i4idSXvSFSBW++CHjvTBbCS1n4ygki3Q40AWI1HoyMnipqS5FuAGE41dLntF?=
 =?us-ascii?Q?iQ2LjNDRuMm4Awy3R2uhXyxlEI5wY9sgLSlGPbvnfyyOKr52sjiJP1Gy4kHU?=
 =?us-ascii?Q?ZA7H6FKdqaFmqUSAuNE3140eJ35WJTxjd/1AMf7YLD8xfhYkpj4pU4XYJiVh?=
 =?us-ascii?Q?25LTfdGdvisAS+Aiudta6ovWslkSNQPbPDsSKz/pltM/Qt6xtfFZlWmAUTxY?=
 =?us-ascii?Q?wVwd2tmV53erjth4pqDI39q/CZ/e2QHdlJs51uWpApeJDjcX5R4GM0lNQJyn?=
 =?us-ascii?Q?tJWsay1SxTfxOZbZ4Y+5qavaLVrHF5kuqLmgX+gn+qimPMSYaYdVo+3XpQdj?=
 =?us-ascii?Q?ihkB5hRoAIIuDGdB2DgsICwlsBsDCLwhhYvLkQR/87lj66jtVqvLzIQFUs6h?=
 =?us-ascii?Q?V2MNJ+b7GZuO3/gylNgdQG9tGZnXPwCjd6/CtyPNJHNOKI3OvOoiQNCwwSHQ?=
 =?us-ascii?Q?EiapA3Q0UA37rINUBlh2gRMV6X/HE6dU+BrNsLjoJAfkt5fsIqKnNzl8ky7f?=
 =?us-ascii?Q?HkscZz9pd9dHIkZ7dfase79V/HLScVBPqwViYPH/sbtb5WoSegI8Yl2ShxOP?=
 =?us-ascii?Q?6vIwUu1clSXFKLpiFT82V9f4D5N2hyEzbKIQu/8md5Gz7vWlUlSXAa0nDXUe?=
 =?us-ascii?Q?i5s9EDnkI/NssPrirtQEnLDlTLTB97xZWpnwfJ8+rihGvaSgaraCBF+zRzIf?=
 =?us-ascii?Q?XcjcvUTw7dSjUCdLfNQSENLesW/JQVDH2RqrpWnezmuQc2IPKZMOcNVOSBDF?=
 =?us-ascii?Q?lGG5KsjZbbi9ypV+dCwa9mBGAss/K6EEwFuz1NbIrzfsKGkcrJx3/Fec+H69?=
 =?us-ascii?Q?BuHRkvf5RPuyflN+PanJVPyQ++pJsm+Dbe1246wgEqpSaiKrHtA+R+KDIiyY?=
 =?us-ascii?Q?bXUtAQyDlr1g4LK3kdSHBA4SOsq5Y9j464/ULXdNVEVKFhg1IhkhmOWzoRrE?=
 =?us-ascii?Q?umZ0ViWFv3/+IJfVSxKYy3VfoyCCI6DCpdlhjQbfOZzRR2zTMsgT6gHYa8gB?=
 =?us-ascii?Q?+41PwpS21D6rjWqldATvpSJTsPvl/PZhwLSVRIe+qpKLlnbQlw+QLz8Ioryh?=
 =?us-ascii?Q?9J0XiXq9X9W6ipuuzN7/Y98czoM1dTFEwlXw6XWXKjYm21eFMGv+F6NuHgrV?=
 =?us-ascii?Q?DWKxwmjUobA7ZSqXAB0gIdBXkKlncjKmVmwPrYj+0lCcx0om+MQaMA74G4c2?=
 =?us-ascii?Q?mabuLjqHiLrK2pm4dzS0I7o8mi5BkSQtMB7ubxWCIppCSTvfi3HhfUnVaAQK?=
 =?us-ascii?Q?YBmelhl3XvT6sbgSzIBff5KdpMKwY+k3M3b5YBTXwiX3F+25jPIrNd4n+aTU?=
 =?us-ascii?Q?vVQSzwYXMtHMCAS2iN8ZizRQt8OEShzDFKQmBtpwJEp4Z9ObXOP2Z6rTR4Nq?=
 =?us-ascii?Q?v6UYB8z0gJktu2myRh/XDskwJ0UpGBGq6JqvZDXufFZ39junejDA0DNOZDIj?=
 =?us-ascii?Q?2ASZbkDnajmgGaMkbC+kqoOUbzQo1R2gyaZ6+3jvBJHjJDoM/Xn6XHKJ32/8?=
 =?us-ascii?Q?QMOpiCGu3EuG7kZ5VBtMgsnnsQQWDneCi0naiMy/XdLyhJ3qlbP8UDHxl5RU?=
 =?us-ascii?Q?d8HLUhH1RgjsNj9HsH0p4x3lf2R+iLeDBshKq2ubrcmKBlAUZ7FTV0jGiEdB?=
 =?us-ascii?Q?h2TMD2TizHcqH1NhFHH0WFdyayjJiZnTY420AgJ1ZXWt1HRA6h0nJjxsuGpi?=
 =?us-ascii?Q?HDtWcSXe74BJ4eEJRZEVYalJ89NdWPifGM4t/7DW0FO9RtAYKFmjnWej1Xwq?=
 =?us-ascii?Q?ExSF87OwgA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eec75429-7cd1-460f-ac2e-08de5842c391
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 16:41:30.6983
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CxbMhUtWgLpOUhSDLe8T+K7ml5KrJqLbR2Q4KmPtclQS8Sam9jaqilHvWeydDhGiD40DHX95njPRV2Uwo83APg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9390

On Tue, Jan 20, 2026 at 04:32:33PM +0800, Sherry Sun wrote:
> For i.MX93 11x11 EVK and 9x9 QSB boards, add the gpio-hog to enable the
> M.2 PCM pins level shifter connected between soc sai1 interface and M.2
> PCM pins so that HFP feature can be supported.

Does sai1 have any refer to pcal6524? sai may probe before pcal6524, so
m2-pcm-level-shifter-hog may not set when sai probe.

Frank
>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts | 6 ++++++
>  arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts   | 6 ++++++
>  2 files changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> index 8dd5340e8141..acb160d3186c 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> @@ -356,6 +356,12 @@ pcal6524: gpio@22 {
>  		#interrupt-cells = <2>;
>  		interrupt-parent = <&gpio3>;
>  		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
> +
> +		m2-pcm-level-shifter-hog {
> +			gpio-hog;
> +			gpios = <19 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +		};
>  	};
>
>  	pmic@25 {
> diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
> index 0852067eab2c..11e08673083b 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
> @@ -349,6 +349,12 @@ mic-can-sel-hog {
>  			gpios = <17 GPIO_ACTIVE_HIGH>;
>  			output-low;
>  		};
> +
> +		m2-pcm-level-shifter-hog {
> +			gpio-hog;
> +			gpios = <19 GPIO_ACTIVE_HIGH>;
> +			output-high;
> +		};
>  	};
>
>  	pmic@25 {
> --
> 2.37.1
>
