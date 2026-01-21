Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011014.outbound.protection.outlook.com [52.101.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD98442A80
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 20:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769028006; cv=fail; b=BavHovEKhprmsxKe1nvFW7uCYsJdsmWu2eD0lS/CKLsqQK7ohmg2oaYQtIGbwKkcpB3/yqHZwqu1TFBWiBMA+nJDzPMZVR+U54lKABf3rSbMHljyo1MjqcDhoGjteXqEji8OEmH5YBzjvXywxWgf04CPl8lZcCUa2qFkmkEcuSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769028006; c=relaxed/simple;
	bh=UAS1/7zlUt1qf9x3a7QzZKHJDaP4GAJ6jx20HjBt9bU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=tYJSiIE7aPfLFnl4omKEz2bGen0LvPFOk88C5xIvfC9n2Jekig1oUNkRlFovVdCI9thZMAOGZNz/DFTMSHFfbPg72BNhjtEQs8ZsuDdvGg1zDnw5E4f4TI7GGU1SJlhDI7JsIZ3PvqF0AIOaUW0i6s1df1vsFC3CwOoVpG8FPvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=JUMIbtJa; arc=fail smtp.client-ip=52.101.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="JUMIbtJa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mcJ7Rx+wWU0slsmb3BJGrbtOujQD7Q71DsgsgpcwlVX9cWeziD+f4nbaApWRiLypfrKqFYaIIy49xDYQUlqlxjsxuFnMwSs7tijC1YZh006+s0TtSiFhElGkHogajQtmHSqVU3MjmWzsYXThCfMErzJYWLYs9+kgVobqF7lmlyyrmvgNnaxqgEN4+c1py3hiM0sD22vTWkDpkcXxBO8htG76T2jsa/u8MhN1H4/edhtEg1Mi/Sq7NNPJF2O3CDeDFlthaDZJp2oJI0UYIEnUyAUZLaiJ8IprX5lqacdIy0oRQOKU+p2dH0q0iIzdY4+P3bW9iWkCOJ8Ch68QxVN02Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZfYJul572MPEuk36qmWSzebOa/GmC80kbDiI2E1h98=;
 b=SqahufEnKUBimn4EoSSMxtzGWYdG6bsrdgmc3mC2aWmNKUnmUK5C9qc3ychMiSFOdsesKLmtU06qHpFOoj3t57FWQEgD2DYprsJB4mcCHzfP+/pVJ0TbZyVyJBserYc6B9Nl0+THPNsN7LUOXZvtfiluWv9TYUWLOwtYzjQXVzGmB4smzwxMhOls5l31MlMbN8zbMkNHPmUYYK8QJC0CC05sjrFEa0tnGfntbCo/AvokgCisXuFPNlsihLdOIktwwy2gsqMbEHy33jw7isR/X7ZnAGVZIkjZJiYAWS9unjY3U2qtdDaX7FVSot0YgL3kpDfnUAPWglOeH5mH/vttPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZfYJul572MPEuk36qmWSzebOa/GmC80kbDiI2E1h98=;
 b=JUMIbtJaZbynC+aKUCOdIdrLMgYUzfGFvr0OcUhVp7Z4CXLaczB8z2RBO5C4rcVdu073/p71b+tJUT0CQ7JWlcAgOJQkWQ/8w1nHCbWuTrwSg80IqMUzaTruzJqr1sOS6cECpvY2SjHmEzOCOMNbQqc0oz5yRa3MTAT7OaS03tHk9kO0aSe3cEcXZ7f8kbFGVukGq/d+9RnQW8uu0/pouFipsIxncWGdi2md4h9JLeTGY1vovt7QB/0G+lfbY8sQJlF9PFxRf5Xx97m1wrYHR6eLRWaC8hcmYlpMCfVB4MOBlNXo+l6JoN6bcZkEYBDXsTILkdFSZJrIdh9GRzuZlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by AM0PR04MB7010.eurprd04.prod.outlook.com (2603:10a6:208:199::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Wed, 21 Jan
 2026 20:39:57 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9520.011; Wed, 21 Jan 2026
 20:39:57 +0000
Date: Wed, 21 Jan 2026 15:39:48 -0500
From: Frank Li <Frank.li@nxp.com>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 5/8] arm64: dts: add description for solidrun imx8mp
 hummingboard-iiot
Message-ID: <aXE5lImvUBOb8hqS@lizhi-Precision-Tower-5810>
References: <20260118-imx8mp-hb-iiot-v7-0-ef1176119a8e@solid-run.com>
 <20260118-imx8mp-hb-iiot-v7-5-ef1176119a8e@solid-run.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260118-imx8mp-hb-iiot-v7-5-ef1176119a8e@solid-run.com>
X-ClientProxiedBy: SJ0PR05CA0207.namprd05.prod.outlook.com
 (2603:10b6:a03:330::32) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|AM0PR04MB7010:EE_
X-MS-Office365-Filtering-Correlation-Id: d888bde9-f8a5-4e98-7ae8-08de592d3d6a
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|1800799024|376014|19092799006|366016|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?Mm3OHI+fUcpYOwwnU7uGCfOzUBT0uzPn/v2ny4/JDv3rzicv2j4PI0BHp+t0?=
 =?us-ascii?Q?4GtzcIFw3eSLMI5OSgqWQ3jgRvDh6XujhnDKezzwQRWKZ2qRpel07bXjn/Tv?=
 =?us-ascii?Q?H3LL/Q6+9b2ZkcH+yWwB7Q+LyvGgXV3n0W3TgBhUnoj2ufz+YIXeXn1t2wFS?=
 =?us-ascii?Q?ZjqQ68+I6/fPm9tC2uGv5ja21cAxEwHTiHDQdDaSykYbuC6lk1+aS/6m4Ax9?=
 =?us-ascii?Q?I10NF/WeqEqXWRy3SBwmUL6ma1iSMofwuhdkZboPj9ZQOrtWt9srpZe6OWcq?=
 =?us-ascii?Q?S+mvHJOsTHW2rspx8reVnC2Kl/B2pZ0YAjWJrweoFMc/AIPKQQdfA4Qdv6BI?=
 =?us-ascii?Q?2D41e1gubF2Oyouz+UgLduO/Fe0Q298qu32YJqX5leRPLODq1eju9YfqVRkt?=
 =?us-ascii?Q?Pcx20CxaU5Rfo1awJfvHjoQexsD85ddWC3BTHIgf5SfzJ+T069+cX4Dg7h87?=
 =?us-ascii?Q?zjHMUoxZPtRuUU2yEH5OnOIXR+mBREBPJftv4PR6nCEtdJzmXpplu+iDUAiu?=
 =?us-ascii?Q?QFYL6PckIzUKpvQn38fK0RXpbVCv5WbQ7l+2eWcvrLiCnjNQh7xK0JxLW2iQ?=
 =?us-ascii?Q?O84Qh5884gvUXOke6daTAbLS7kYKyPe6z2CebvQG+qNd0Rr4YYuUYIt6ymD+?=
 =?us-ascii?Q?4ohrRdaQGE7taE3dz2mJf/DGYxG/ug86FXnDMx16VYms799/UAYobghTpa7o?=
 =?us-ascii?Q?OJPXxJhxAOUXzWC7sQ1x6hTXOJ6TZE81Od3SF8/IDVoelAR+n4pDh3PS7zBH?=
 =?us-ascii?Q?XJyacr7yP9IxpiMzqvdePpnoG64ZMOm8/CI/PoDK9eysiDX8f/mV1cZlXPFR?=
 =?us-ascii?Q?IPjzmgOJTxdVAhcWcD/ZyHYXHVPm5npXc0U61b+t1vn27/1fdzEYgXdelvC8?=
 =?us-ascii?Q?KbJDZRgkUgQGruRUcN/oU18NsMh2W1Mt1kKJH0v7yLpB6zH8Cc9qXINIyn95?=
 =?us-ascii?Q?P7KZQqEfHv41Ej8oZ/sXqSrrML6Oag1a2Kw15WyvvKGTy6FWPqsq9zBVF9Bc?=
 =?us-ascii?Q?qgX9Qx9pEerrmIAOomvWRXdc583TX4o6kCHSzEe2Ua5LBYQv49PwAFWRPsGe?=
 =?us-ascii?Q?NtpTJeD1yufvgCJ7RGe5K99b7UwL/D0J2D9TYihGwxjCRj/drRtakicw5jKR?=
 =?us-ascii?Q?HuGHU9uqhK9v6ZIp06evnGxCr6OXCdn7YO5TPv+eQwXp31gLxV/+jildpD16?=
 =?us-ascii?Q?qRiduY+Vbl9gjuFqStzOAxc8BgavSfqltEnCts05o8/tZOBjguoIOgE6/75Q?=
 =?us-ascii?Q?mDhHIrf17s89MK4IveMW/j+V+/OYtqEhhvJLUjWmrwB5+bgWlcmEcbLL3kxe?=
 =?us-ascii?Q?aShfj5NLcohrimUgqcApiAKj4dYbeoT6RVp92TWF0lOHMTt9olrhFu5jBkoe?=
 =?us-ascii?Q?sukkNysFZb/O5IObM+5EOXtlOkSrGXZMEl96YMdmc5K9CvyzQ74oggFBEIB2?=
 =?us-ascii?Q?5nz1IqJsv7M3UDKTY5yUAREB4Vt2i7t7gqzbIQ3KXtNu/Uxmtc1SDuD2rBo5?=
 =?us-ascii?Q?dDMktfEUH3BAye4KtFkX3uXVwpC9cSACLatBR1RbCxwFaN7kW/zZ4zjyLovG?=
 =?us-ascii?Q?oAjwkHTs8WqsFA6z/1ej7h7AQGdF0v0b9BLdryZ2Z7p9bSV/BoiaM3gssx3o?=
 =?us-ascii?Q?+xHjcBGjigjKikl09exOG5c=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(1800799024)(376014)(19092799006)(366016)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?zOpE7i+vzr8aOCGz5Zzkhvt057oK2QahJDPVKbb25q/AVTmdK6cwvCQWoKQm?=
 =?us-ascii?Q?prhLjX3tWn0emnzIoT1H3Qgf2Z6XRkqP9imXfvaclXAednnswuzt/W0e/1eT?=
 =?us-ascii?Q?o/d281W8ClOai8iEbMPZ/ouNRbx5jfVBhqrsOx9eZg+qUtSmT2e1X/eWWvVO?=
 =?us-ascii?Q?Mbvo0ei8CwUCMhs/p4vfUFgm18hxkRWquqINO3G2PzayrqP/X8hCbemYsHMc?=
 =?us-ascii?Q?bqq3IAlM0Zdm+BcAHZjyUfB14F7ZHuw8FlxzFAMldikEI8AwiTDoDLieovuD?=
 =?us-ascii?Q?roGRE830VaWGol4nr0b4ODYnfsPEdqSV0GIQFif/gKcmYTNwYP50NNEpE2el?=
 =?us-ascii?Q?SKdv0KAAFi44AzXezpoa/yTRgXaKA9q3WujDmkOkZOSEQr1k+0r6gQFWR28D?=
 =?us-ascii?Q?uXDKgy9VmBdGrtwPE3jFq71FvETvEZV4pMNblihCmK83yA9hJiajJoMaF+um?=
 =?us-ascii?Q?45P1KKBXiaCxNg3XNii6YVgiE5y+3hdI58claPbf02DR1x8AqzxvNGTfLmYn?=
 =?us-ascii?Q?4QRaPxl6D5WgS2+wNqk+FBD/fYOv0HxWtVXQySXOgQLHWqIfJS0v4mkGKe3A?=
 =?us-ascii?Q?EM7FeBsC/c2g2yW9HJu9optNv2O0yBBBqsLJmWPytmAA0A9yWM8eCNKCjuS4?=
 =?us-ascii?Q?TSM/vI/4C5YutQ37l+w6tLvvy7xEIjd8lXC/bspNxIdXmHblK4oVL+jlyjaR?=
 =?us-ascii?Q?JzrRkag9X1iLSEg/6O5YLW0IHQoPsjWeRhFYjBHaO0jObMVxH8PZdVzWbnhf?=
 =?us-ascii?Q?uEfoGmeWjLMH7CiPlKmomgZXIp7PcjDrPvK/St5uwgqjyd7UzghRbf3sb9vt?=
 =?us-ascii?Q?RC0zlSVxR8/NP9HJGR0hLpV2I/o4/iRIPgKx7rAVHiAhjRaap8BxIRDdW8dG?=
 =?us-ascii?Q?NOQNxME4Ogtu6bNBoefqulqpYBtr7Shd3A8zt7jaWnN1lZEZMbS4jIeG83M7?=
 =?us-ascii?Q?qd8doarBghNsHKsORWunP+EK6kn+cVMOeNqXKpMEEJUoP49vufNOYRcY59dB?=
 =?us-ascii?Q?wFaf1d9gIo2sJWHIWGxPOdLfNO4EJPNNWIx8qPnYGSGeKf2xFA6Fx4a3WgUB?=
 =?us-ascii?Q?ZTEV805XO6veVJDP6SJXA8P/fDHWgGJbl52QihRuDIAs525m/+xRoekgRqg4?=
 =?us-ascii?Q?hk4yPPrFh9G5bqh3lxUaG7Ka/sNCkHJ3Rn4C0DG20h9erSJDjk128uRZHU52?=
 =?us-ascii?Q?vsm7NVSCU4PPq1GrPR+Uj7GfzvGTOn97ZfwUQOcsE0S3b7qkN1pbj02n7wiR?=
 =?us-ascii?Q?w0mx+/D1r9esnYc/ZebW4nMsVPN0B0/R8GZl47XyIsPiv7bp5N/GyhYV4UU5?=
 =?us-ascii?Q?iC+jonciWdxXrweFnsf0CwO0f3+Kspmx2uCMT4heYwBLTBShCvA6LvqtmDEP?=
 =?us-ascii?Q?6VuO98y7v1AzuT6/aeJRLupznSF4Rm1aZTZ8ao2Pc1zJZwZMVZl/BhywcOPP?=
 =?us-ascii?Q?l0KJPjU3p+HHeQxvOAJKI4/yh7Cc8RWKGhsyOlgaUhzL7S1IDPnBH+Bjrm2q?=
 =?us-ascii?Q?are72Q//99AE9eGhUz5QY/DbfoRIv0aULZVatc43c9h1nl1Zsk22ZZp/hEpj?=
 =?us-ascii?Q?GaBqCTiQqiQCYvqdTQs7GsQRp6pMtfgti+uMo/tDjPShBcgyRMQBJ4ipbXvj?=
 =?us-ascii?Q?Qd4KbOFqWj1i0uR+Eevi1ZPet6gIvN1dnHWXqYa+UCaeBgWXe95QNBh2dp+9?=
 =?us-ascii?Q?netCvPT9QVzSSXffSYCmv022/QUtlwfCNxNYB1uE0/NJhiAn?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d888bde9-f8a5-4e98-7ae8-08de592d3d6a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 20:39:57.8124
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qu+m+42lZYD5xfCvOQ5DVW+0y9p51POPFpmfSOWurnux+pbK2uCFAPpVdUVhVqoEzcoQ6VCa2otnpwIMzVEA9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7010

On Sun, Jan 18, 2026 at 02:51:42PM +0200, Josua Mayer wrote:
> Add description for the SolidRun i.MX8MP HummingBoard IIoT.
> The board is a new design around the i.MX8MP System on Module, not
> sharing much with previous HummingBoards.

suggested commit message

add support for SolidRun i.MX8MP HummingBoard IIoT

Introduce support for the SolidRun i.MX8MP HummingBoard IIoT platform.
This board is a new design based on the i.MX8MP System on Module and
does not share much hardware with previous HummingBoard variants.

>
> It comes with some common features:
> - 3x USB-3.0 Type A connector
> - 2x 1Gbps RJ45 Ethernet
> - USB Type-C Console Port
> - microSD connector
> - RTC with backup battery
> - RGB Status LED
> - 1x M.2 M-Key connector with PCI-E Gen. 3 x1
> - 1x M.2 B-Key connector with USB-2.0/3.0 + SIM card holder
> - 1x LVDS Display Connector
> - 1x DSI Display Connector
> - GPIO header
> - 2x RS232/RS485 ports (configurable)
> - 2x CAN
>
> In addition there is a board-to-board expansion connector to support
> custom daughter boards with access to SPI, a range of GPIOs and -
> notably - CAN and UART. Both 2x CAN and 2x UART can be muxed either
> to this b2b connector, or a termianl block connector on the base board.
>
> The routing choice for UART and CAN is expressed through gpio
> mux-controllers in DT and can be changed by applying dtb addons.

s/addons/overlay

>
> Signed-off-by: Josua Mayer <josua@solid-run.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile             |   2 +
>  .../dts/freescale/imx8mp-hummingboard-iiot.dts     | 719 +++++++++++++++++++++
>  2 files changed, 721 insertions(+)
>
...
> +
> +	uart3_rs_232_485_mux: mux-controller-4 {
> +		compatible = "gpio-mux";
> +		#mux-control-cells = <0>;
> +		/*
> +		 * Mux switches uart3 tx/rx between rs232 and rs485
> +		 * transceivers. using one GPIO: 0 = rs232; 1 = rs485.
> +		 */
> +		mux-gpios = <&tca6416_u20 1 GPIO_ACTIVE_HIGH>;
> +		/* default rs232 */
> +		idle-state = <0>;
> +	};
> +
> +	uart4_rs_232_485_mux: mux-controller-5 {
> +		compatible = "gpio-mux";
> +		#mux-control-cells = <0>;
> +		/*
> +		 * Mux switches uart4 tx/rx between rs232 and rs485
> +		 * transceivers. using one GPIO: 0 = rs232; 1 = rs485.
> +		 */
> +		mux-gpios = <&tca6416_u20 2 GPIO_ACTIVE_HIGH>;
> +		/* default rs232 */
> +		idle-state = <0>;
> +	};
> +
> +	gpio-keys {

please order as node name. suggest use
https://github.com/lznuaa/dt-format
to reorder it.

> +		compatible = "gpio-keys";
> +
> +		wakeup-event {
> +			label = "m2-m-wakeup";
> +			interrupts-extended = <&tca6416_u21 11 IRQ_TYPE_EDGE_FALLING>;
> +			linux,code = <KEY_WAKEUP>;
> +			wakeup-source;
> +		};
> +	};
> +};
> +
...
> +
> +&i2c2 {
> +	i2c-mux@70 {
> +		compatible = "nxp,pca9546";
> +		reg = <0x70>;
> +		/*
> +		 * This reset is open drain,
> +		 * but reset core does not support GPIO_OPEN_DRAIN flag.
> +		 */
> +		reset-gpios = <&tca6416_u21 2 GPIO_ACTIVE_LOW>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* channel 0 routed to expansion connector (J22) */
> +		i2c_exp: i2c@0 {
> +			reg = <0>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		/* channel 1 routed to mipi-csi connector (J23) */
> +		i2c_csi: i2c@1 {
> +			reg = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		/* channel 2 routed to mipi-dsi connector (J25) */
> +		i2c_dsi: i2c@2 {
> +			reg = <2>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			tca6408_u48: gpio@21 {
> +				compatible = "ti,tca6408";
> +				reg = <0x21>;
> +				/*
> +				 * reset shared between U37 and U48, to be
> +				 * supported once gpio-pca953x switches to
> +				 * reset framework.
> +				 *
> +				 * reset-gpios = <&tca6416_u21 4 (GPIO_ACTIVE_LOW|GPIO_PULL_UP|GPIO_OPEN_DRAIN)>;

dose checkpatch report error? line width over 100

Frank
> +				 */
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				gpio-line-names = "CAM_RST#", "DSI_RESET",
> +						  "DSI_STBYB", "DSI_PWM_BL",
> +						  "DSI_L/R", "DSI_U/D",
> +						  "DSI_CTP_/RST", "CAM_TRIG";
> +			};
> +		};
> +
> +		/* channel 2 routed to lvds connector (J24) */
> +		i2c_lvds: i2c@3 {
> +			reg = <3>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			tca6408_u37: gpio@20 {
> +				compatible = "ti,tca6408";
> +				reg = <0x20>;
> +				/*
> +				 * reset shared between U37 and U48, to be
> +				 * supported once gpio-pca953x switches to
> +				 * reset framework.
> +				 *
> +				 * reset-gpios = <&tca6416_u21 4 (GPIO_ACTIVE_LOW|GPIO_PULL_UP|GPIO_OPEN_DRAIN)>;
> +				 */
> +				gpio-controller;
> +				#gpio-cells = <2>;
> +				gpio-line-names = "SELB", "LVDS_RESET",
> +						  "LVDS_STBYB", "LVDS_PWM_BL",
> +						  "LVDS_L/R", "LVDS_U/D",
> +						  "LVDS_CTP_/RST", "";
> +			};
> +		};
> +	};
> +};
> +
> +&i2c3 {
> +	/* highest i2c clock supported by all peripherals is 400kHz */
> +	clock-frequency = <400000>;
> +
> +	tca6416_u20: gpio@20 {
> +		/*
> +		 * This is a TI TCAL6416 using same programming model as
> +		 * NXP PCAL6416, not to be confused with TI TCA6416.
> +		 */
> +		compatible = "nxp,pcal6416";
> +		reg = <0x20>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		gpio-line-names = "TCA_INT/EXT_UART", "TCA_UARTA_232/485",
> +				  "TCA_UARTB_232/485", "TCA_INT/EXT_CAN",
> +				  "TCA_NXP/REN", "TCA_M.2B_3V3_EN",
> +				  "TCA_M.2M_3V3_EN", "TCA_M.2M_RESET#",
> +				  "TCA_M.2B_RESET#", "TCA_M.2B_W_DIS#",
> +				  "TCA_M.2B_GPS_EN#", "TCA_USB-HUB_RST#",
> +				  "TCA_USB_HUB3_PWR_EN", "TCA_USB_HUB4_PWR_EN",
> +				  "TCA_USB1_PWR_EN", "TCA_VIDEO_PWR_EN";
> +
> +		m2-b-reset-hog {
> +			gpio-hog;
> +			gpios = <8 GPIO_ACTIVE_LOW>;
> +			output-low;
> +			line-name = "m2-b-reset";
> +		};
> +	};
> +
> +	tca6416_u21: gpio@21 {
> +		/*
> +		 * This is a TI TCAL6416 using same programming model as
> +		 * NXP PCAL6416, not to be confused with TI TCA6416.
> +		 */
> +		compatible = "nxp,pcal6416";
> +		reg = <0x21>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&tca6416_u21_int_pins>;
> +		interrupts-extended = <&gpio1 15 IRQ_TYPE_EDGE_FALLING>;
> +		gpio-line-names = "TCA_SPI_TPM/EXT", "TCA_TPM_RST#",
> +				  "TCA_I2C_RST", "TCA_RS232_SHTD#",
> +				  "TCA_LCD_I2C_RST", "TCA_DIG_OUT1",
> +				  "TCA_bDIG_IN1", "TCA_SENS_INT",
> +				  "TCA_ALERT#", "TCA_TPM_PIRQ#",
> +				  "TCA_RTC_INT", "TCA_M.2M_WAKW_ON_LAN",
> +				  "TCA_M.2M_CLKREQ#", "TCA_LVDS_INT#",
> +				  "", "TCA_POE_AT";
> +
> +		rs232_shutdown: rs232-shutdown-hog {
> +			gpio-hog;
> +			gpios = <3 GPIO_ACTIVE_LOW>;
> +			output-low;
> +			line-name = "rs232-shutdown";
> +		};
> +
> +		lcd-i2c-reset-hog {
> +			/*
> +			 * reset shared between U37 and U48, to be
> +			 * supported once gpio-pca953x switches to
> +			 * reset framework.
> +			 */
> +			gpio-hog;
> +			gpios = <4 (GPIO_ACTIVE_LOW|GPIO_PULL_UP|GPIO_OPEN_DRAIN)>;
> +			output-low;
> +			line-name = "lcd-i2c-reset";
> +		};
> +
> +		m2-m-clkreq-hog {
> +			gpio-hog;
> +			gpios = <12 GPIO_ACTIVE_LOW>;
> +			input;
> +			line-name = "m2-m-clkreq";
> +		};
> +	};
> +
> +	led-controller@30 {
> +		compatible = "ti,lp5562";
> +		reg = <0x30>;
> +		/* use internal clock, could use external generated by rtc */
> +		clock-mode = /bits/ 8 <1>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		multi-led@0 {
> +			reg = <0x0>;
> +			label = "D7";
> +			color = <LED_COLOR_ID_RGB>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			led@0 {
> +				reg = <0x0>;
> +				color = <LED_COLOR_ID_RED>;
> +				led-cur = /bits/ 8 <0x32>;
> +				max-cur = /bits/ 8 <0x64>;
> +			};
> +
> +			led@1 {
> +				reg = <0x1>;
> +				color = <LED_COLOR_ID_GREEN>;
> +				led-cur = /bits/ 8 <0x19>;
> +				max-cur = /bits/ 8 <0x32>;
> +			};
> +
> +			led@2 {
> +				reg = <0x2>;
> +				color = <LED_COLOR_ID_BLUE>;
> +				led-cur = /bits/ 8 <0x19>;
> +				max-cur = /bits/ 8 <0x32>;
> +			};
> +		};
> +
> +		led@3 {
> +			reg = <0x3>;
> +			chan-name = "D8";
> +			label = "D8";
> +			color = <LED_COLOR_ID_GREEN>;
> +			led-cur = /bits/ 8 <0x19>;
> +			max-cur = /bits/ 8 <0x64>;
> +		};
> +	};
> +
> +	light-sensor@44 {
> +		compatible = "isil,isl29023";
> +		reg = <0x44>;
> +		/* IRQ shared between accelerometer, light-sensor and Tamper input (J5007) */
> +		interrupts-extended = <&tca6416_u21 7 IRQ_TYPE_EDGE_FALLING>;
> +	};
> +
> +	accelerometer@53 {
> +		compatible = "adi,adxl345";
> +		reg = <0x53>;
> +		/* IRQ shared between accelerometer, light-sensor and Tamper input (J5007) */
> +		interrupt-names = "INT1";
> +		interrupts-extended = <&tca6416_u21 7 IRQ_TYPE_EDGE_FALLING>;
> +	};
> +
> +	carrier_eeprom: eeprom@57{
> +		compatible = "atmel,24c02";
> +		reg = <0x57>;
> +		pagesize = <8>;
> +	};
> +
> +	carrier_rtc: rtc@69 {
> +		compatible = "abracon,ab1805";
> +		reg = <0x69>;
> +		abracon,tc-diode = "schottky";
> +		abracon,tc-resistor = <3>;
> +		/*
> +		 * AM1805 RTC used on this board has only nTIRQ pins wired,
> +		 * which is for countdown timer irqs only.
> +		 * Driver does not support this, disable for now.
> +		 *
> +		 * interrupts-extended = <&tca6416_u21 10 IRQ_TYPE_EDGE_FALLING>;
> +		 */
> +	};
> +};
> +
> +&iomuxc {
> +	can1_pins: pinctrl-can1-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SPDIF_RX__CAN1_RX			0x154
> +			MX8MP_IOMUXC_SPDIF_TX__CAN1_TX			0x154
> +		>;
> +	};
> +
> +	can2_pins: pinctrl-can2-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SAI5_MCLK__CAN2_RX			0x154
> +			MX8MP_IOMUXC_SAI5_RXD3__CAN2_TX			0x154
> +		>;
> +	};
> +
> +	ecspi2_pins: pinctrl-ecspi2-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK		0x140
> +			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI		0x140
> +			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO		0x140
> +			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13		0x140
> +		>;
> +	};
> +
> +	tca6416_u21_int_pins: pinctrl-tca6416-u21-int-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO15__GPIO1_IO15		0x0
> +		>;
> +	};
> +
> +	/* UARTA */
> +	uart3_pins: pinctrl-uart3-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ECSPI1_SCLK__UART3_DCE_RX		0x140
> +			MX8MP_IOMUXC_ECSPI1_MOSI__UART3_DCE_TX		0x140
> +			MX8MP_IOMUXC_ECSPI1_SS0__GPIO5_IO09		0x140
> +		>;
> +	};
> +
> +	/* UARTB */
> +	uart4_pins: pinctrl-uart4-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_UART4_RXD__UART4_DCE_RX		0x140
> +			MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX		0x140
> +			MX8MP_IOMUXC_ECSPI1_MISO__GPIO5_IO08		0x140
> +		>;
> +	};
> +
> +	usdhc2_pins: pinctrl-usdhc2-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x190
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d0
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d0
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d0
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d0
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d0
> +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x140
> +			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B		0x140
> +		>;
> +	};
> +
> +	usdhc2_100mhz_pins: pinctrl-usdhc2-100mhz-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x194
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d4
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d4
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d4
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d4
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d4
> +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x140
> +			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B		0x140
> +		>;
> +	};
> +
> +	usdhc2_200mhz_pins: pinctrl-usdhc2-200mhz-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK		0x196
> +			MX8MP_IOMUXC_SD2_CMD__USDHC2_CMD		0x1d6
> +			MX8MP_IOMUXC_SD2_DATA0__USDHC2_DATA0		0x1d6
> +			MX8MP_IOMUXC_SD2_DATA1__USDHC2_DATA1		0x1d6
> +			MX8MP_IOMUXC_SD2_DATA2__USDHC2_DATA2		0x1d6
> +			MX8MP_IOMUXC_SD2_DATA3__USDHC2_DATA3		0x1d6
> +			MX8MP_IOMUXC_GPIO1_IO04__USDHC2_VSELECT		0x140
> +			MX8MP_IOMUXC_SD2_CD_B__USDHC2_CD_B		0x140
> +		>;
> +	};
> +
> +	vmmc_pins: pinctrl-vmmc-grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19		0x0
> +		>;
> +	};
> +};
> +
> +&pcie {
> +	reset-gpio = <&tca6416_u20 7 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +};
> +
> +/* M.2 M-Key (J4) */
> +&pcie_phy {
> +	clocks = <&hsio_blk_ctrl>;
> +	clock-names = "ref";
> +	fsl,clkreq-unsupported;
> +	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_OUTPUT>;
> +	status = "okay";
> +};
> +
> +&phy0 {
> +	leds {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* ADIN1300 LED_0 pin */
> +		led@0 {
> +			reg = <0>;
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_LAN;
> +			default-state = "keep";
> +		};
> +	};
> +};
> +
> +&phy1 {
> +	leds {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		/* ADIN1300 LED_0 pin */
> +		led@0 {
> +			reg = <0>;
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_LAN;
> +			default-state = "keep";
> +		};
> +	};
> +};
> +
> +&uart3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart3_pins>;
> +	rts-gpios = <&gpio5 9 GPIO_ACTIVE_HIGH>;
> +	/* select 80MHz parent clock to support maximum baudrate 4Mbps */
> +	assigned-clocks = <&clk IMX8MP_CLK_UART3>;
> +	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
> +	status = "okay";
> +};
> +
> +&uart4 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart4_pins>;
> +	rts-gpios = <&gpio5 8 GPIO_ACTIVE_HIGH>;
> +	/* select 80MHz parent clock to support maximum baudrate 4Mbps */
> +	assigned-clocks = <&clk IMX8MP_CLK_UART4>;
> +	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
> +	status = "okay";
> +};
> +
> +&usb3_phy0 {
> +	fsl,phy-tx-preemp-amp-tune-microamp = <1200>;
> +	vbus-supply = <&vbus1>;
> +	status = "okay";
> +};
> +
> +&usb3_0 {
> +	status = "okay";
> +};
> +
> +&usb3_phy1 {
> +	status = "okay";
> +};
> +
> +&usb3_1 {
> +	status = "okay";
> +};
> +
> +&usb_dwc3_0 {
> +	dr_mode = "host";
> +};
> +
> +&usb_dwc3_1 {
> +	dr_mode = "host";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	hub_2_0: hub@1 {
> +		compatible = "usb4b4,6502", "usb4b4,6506";
> +		reg = <1>;
> +		peer-hub = <&hub_3_0>;
> +		reset-gpios = <&tca6416_u20 11 GPIO_ACTIVE_LOW>;
> +		vdd-supply = <&v_1_2>;
> +		vdd2-supply = <&v_3_3>;
> +	};
> +
> +	hub_3_0: hub@2 {
> +		compatible = "usb4b4,6500", "usb4b4,6504";
> +		reg = <2>;
> +		peer-hub = <&hub_2_0>;
> +		reset-gpios = <&tca6416_u20 11 GPIO_ACTIVE_LOW>;
> +		vdd-supply = <&v_1_2>;
> +		vdd2-supply = <&v_3_3>;
> +	};
> +};
> +
> +&usdhc2 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&usdhc2_pins>;
> +	pinctrl-1 = <&usdhc2_100mhz_pins>;
> +	pinctrl-2 = <&usdhc2_200mhz_pins>;
> +	vmmc-supply = <&vmmc>;
> +	bus-width = <4>;
> +	cap-power-off-card;
> +	full-pwr-cycle;
> +	status = "okay";
> +};
>
> --
> 2.43.0
>
>
