Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013041.outbound.protection.outlook.com [40.107.162.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3A23264EF
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 14:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774363389; cv=fail; b=UkzfekpalfCDilKV17k+Sw9PvoVmj3zp8t0XSYBqEGKGPxG4uwPz5lrqy92206vsXI8S0tzjwsbihZI7fa+DG6HtCTjTw9d48J+U1Wj31dV93IPlqpWYh8Ja6D2CUdYwLpEevXIiYC85+qv4q+Ygk49jvEqfeCJbqmLKq1CTxew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774363389; c=relaxed/simple;
	bh=6Jc2IblPuIeFFS5t6KoDzG2jltElQQ69Pxez1oI22zA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=bYUhx0RkLgR/EGOYx9FV2+oRVYuQISad6a54ly7yX4h8dsBgn3y/gE0D+QQJrun/w+mNuheZC6exWPBZ5Hgp/dnd+l77+fcy9jK/FyamPeKMAayknbAV027DMxicQymVQa4fNQAbcA+DqHacQCFiaT1eS5eF0CrtH0w56M8RgEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GkSoX6Oe; arc=fail smtp.client-ip=40.107.162.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GkSoX6Oe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yestOT4lFuePFoor0My9vFUcXUGUEQxVcabnzM9WzM72seYFgo2p48deGPoCx15iBZvPUMQuSQLVTupHIDiSb5PlWIv35B5ZCx+8dfYGBjZdbAiDHiMQW4sskVBep2PeDYOOpzxrGaMnq5ZgodRudU94I2JzCI1xWpV+uEa5Q6puwISa4pk/IDjOK9fSQRASeqbcvlpIZ7f8PKmBKto511FBbiKtGsfyFNetAH9R4Di21IzOqQcIhOT9iL/u1OASsLZUretKcmLdmsrZ5yXLismAUnOt8SSKfxIFAWDuxliwvfed3qaRjIwGxoJszOWOJM4cpe1KzN2NHqDqgm9CWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUOFvlX7qSSEHr6HIxHusGpTzeCrBJveFBNkC1fNdus=;
 b=aM5hGdzZT+Qq3IAVtnZmWVUlt975AzonGB3HjAPvIvN6MExZ531QxSjcCCISgxOrLgk6/TEN1hPhye3O2+GsKxDTcHJJrHlswTdD2SQpYECJqwbK2oa98NA7t7pfxMnP96SEQEGGcalU3mTxuRPBknOw4+q2Pfsp2t7RSmt7Pzn4HhwM1on2ZbXPjpvGKofkk8mVYo9r9AWND850IQWYroS/ESMqwOeqlRqmUd1wj7WHIZfJaF4/sLX7B7S4zxb4ktik1Qeszjakv1OMF9vIETv2elq2XCP6rGnDiXaZdTAcpCRNg0uXaBpoqKTZv3qtIi13JONlRtFukGI8NhenqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUOFvlX7qSSEHr6HIxHusGpTzeCrBJveFBNkC1fNdus=;
 b=GkSoX6OeAtXiPfwee395oGuMAUrt0OBwHNS7UeIBDtTMy3z87ag3noNRWHtyqrjPQ3hiZSOJ3RCKf1vEN4sBzJH8fQFV2SqJ8geWd6kJVMrqc2Z9pDnc9QNayxRMa9v6N8Blumk/ijUg443hilXpOffpfaMiG5yfk/v8NnbAQBspHLRwOmgHmSWmkRLST/h41C4LED7lcKtH8crRwEXi+nFeWFEs3t/CxyYDZJYDFaG8w3KCLv4cYs5h6liv8cm4cb2CerlYOkbqkYx08lfJS6+6iMQMBCV4feBhrFpwz5iQSOzvTOe0lfTXwC9AO9bbQ2e+cPIabbpu/B16+usT/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM0PR04MB12144.eurprd04.prod.outlook.com (2603:10a6:20b:744::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 14:42:59 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 14:42:57 +0000
Date: Tue, 24 Mar 2026 10:42:59 -0400
From: Frank Li <Frank.li@nxp.com>
To: Liu Ying <victor.liu@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp-evk: Specify ADV7535 register
 addresses
Message-ID: <acKi8-prXpnl1Js9@lizhi-Precision-Tower-5810>
References: <20260324-imx8mp-evk-adv7535-cec-reg-addr-v1-1-52dbdd63d5a4@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324-imx8mp-evk-adv7535-cec-reg-addr-v1-1-52dbdd63d5a4@nxp.com>
X-ClientProxiedBy: SA0PR11CA0111.namprd11.prod.outlook.com
 (2603:10b6:806:d1::26) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM0PR04MB12144:EE_
X-MS-Office365-Filtering-Correlation-Id: cbe90190-2ae2-4eb1-a60d-08de89b3a3b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|52116014|7416014|1800799024|366016|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	KgVCEt24HKzOqnRIq2yxtLM74dCyu5vBHnh+gk0nmxTEFa0AVrAmxFNa669lBihsvPysYLB3vr3WhFSwrKRdPGKk+5RbWikI9ntyE1EToAgoTaL7+JrG1XUs3J4kyUAdTNcDoJ/xPdcYzc/BkZeOeEW//8K8g9Y2QKUdV+R5ShUvM38SJDFxk9evq/44n3JMdXhbMLQ1cJBqwXDlfLKbWtY5yncKO3XiU7gdz7Czz6jBydk1zVAsCjKRBsjpqCkh4iheMpO0aC/KxzEoKfK56EkXB+AaW1siIRQenh1ZHWHk57Az6VrT/uw/PBRqlAfKd1RjcN7BPZRI8UsCKdwRU0ZG04omBHszgjLBrVFxvY/MYJSU5DLNvQhrPQNDMYd7yBk66cOIn+8LdrNGEUngKgMbaw+KRnZ+F3e6GAODBFJo9o09MUUtsVaa5MdjklcCh0WF9+AU8BOmXUvk4vnubRI5Ec3AM38SMuS5/TujRr3NF144X4zXJ/b7AiIJWQwfVicyLjk3a/+GkbMURPxEi2RkDqe4sozY3hcjJtzh28SFZS5osw3KRpehps2yEwjFL4++7DslWNLSn2IZDqqqn1E6X+3ZbGyaqfllHXJiv8zPKFqyosymMxp96Z8u4mAPF2trkOsDkxgj23puGRf5EPj6FnEX/t2c1XOEFQ7gc3ocmaE06G3NUc4kRLxt12g9U/7FnQ6MEuOV7PJw4/6iLxqNe9Cy+PVCaePhJvO0kTKD87vgf9eCoq4ukiZfmQ+5tYqeSTzP1vqBZ5zvSGtwzHDq8nZxSkIrM6p2sNA3Zog=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(52116014)(7416014)(1800799024)(366016)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XkuedmZ0ifDhJ26FM/k+DXEE8Q5RyVgtbMasnFQog+ZXp0xQLJJRM4vxTTxq?=
 =?us-ascii?Q?PuXbgYIqGsQw2V7V/jhvKe4iG6uo7P/lEbTDqrX22UDYKbrcHcUrHkVr6I75?=
 =?us-ascii?Q?YB16KLMuaX0PfZnw223kLnQm6/3Z9g2GCdAY1wogW/XHnQ/dTGoIys33snpS?=
 =?us-ascii?Q?wDlkdnY8BQIRXGBPqaf1ncA/0BxOravrAIJvS7a4CkUTiEFNFsQqS+vcGHD7?=
 =?us-ascii?Q?bS1ssMxcTMYiXHmeLMjdRPWtSOrcmZbj19qYV84/ae2YnpPJC4DojxXaRpyO?=
 =?us-ascii?Q?6Y7jG2ph16qyTuagZ/xpshVItyKwk28pdwXDehDCzj0FQw4bEcgimTBx7qof?=
 =?us-ascii?Q?K2fkQDWk2leoAHCrGZsHhQ2C3WPQ2OlgcBJce4nWduUtX9NX+066Cj8ns/Qi?=
 =?us-ascii?Q?9g9SUZZb2VXmHXEkMivFMlGp4pje5powkdiCGlct6E6XffYwArtRdK4cgdyQ?=
 =?us-ascii?Q?60UHsQMGUbC8y2RQ3SDxM59GgkFZRrW8Fkc27/sni5hGqaVfEjN5dMIYOWbJ?=
 =?us-ascii?Q?f1rM1BiG+nBfAzYZlpzuSrfQGX7g6xbwhRgWYP/BjA0+1Las4WVhcjr7MtHC?=
 =?us-ascii?Q?1O4aQc4pywxO+jv3/S1ehZJQXfb3ckSoBu9JaQhjdLLgAeW/QJXFPSQDSI8o?=
 =?us-ascii?Q?XoRvNBUv7qCpK0KpRJsZ3d08DR0mER8hDvpmXPHend3ApYjBZt7oyootPkLV?=
 =?us-ascii?Q?NNA5Z1Zr+yykN5cqgYwNuOSCNAVvvCH7D33QGnO2ER70CmpcxrkN4p4ZBNGJ?=
 =?us-ascii?Q?C7u57kgp2rfGhAMiWHrrUTTT/fDRdXjMV5b670YLETTh2EqB3Nj6ttvaEinm?=
 =?us-ascii?Q?lMIvuHFlATjgSn4yMUDDj1HEOzs7a2IEvkj56JiK8R0bJRAJlMveWsIVJocp?=
 =?us-ascii?Q?/Ysx3tXFS7HkONIXIgoy54/hNYmHTEydy7YZWfdPUlbvj5xenuYqHh+aWMnd?=
 =?us-ascii?Q?Jl77VPjJ18EHWJSMsKlAp2aneMzNJ4IZKKE8AqnvSxdGdExsD/Vm1w+uPSlh?=
 =?us-ascii?Q?iaYqYZxVcGezkVAQFCmW1r0X9ktmTT+61AmtwB+IEjqTOmQgLNpu5ZtfPw6G?=
 =?us-ascii?Q?rHvr1P6FXqxJud71Yl1Cm/orF8XGx6RkA9X7RrnIgTWOhMPrlNfZQLXjcMfH?=
 =?us-ascii?Q?FPC3U+as2T0i0AyUOsgQKsOfoVko/IN0mgsOoLVTenOMZeh8eBsNcEcuZjW7?=
 =?us-ascii?Q?rfQkko7Wcznwnf84k1z5p6i7he94C0n3nOgzgySvf60gzRkshPuentAsc7XN?=
 =?us-ascii?Q?onSPJC+F7G1ayRPO8iblU61knqgWkqO5R0NqC2RidsrZXtuWuevoeyoJW4Ht?=
 =?us-ascii?Q?UvW/wJFlJ6xzhGsFqLwbzW9cvm2sl3gtCIujbXUaJHJk4Pn1pft8JtmThe1d?=
 =?us-ascii?Q?3uVRCOMQOn/NdhkSZDdQ553k6y/CiHUuyHaqSTrKiaNzL7nXfm0DxY75MbCs?=
 =?us-ascii?Q?LvdTm15F+W18zkn/3HMWzCyISjN/KCupky0qQfBPLwPt9wq6I2lCWyRp52yP?=
 =?us-ascii?Q?2r5ZOnLXyp9syoBXb5EspBZ4snO5OyTCu4Q7UC6T1Zcxw0TGzO1YeMNpyvaS?=
 =?us-ascii?Q?b2l5DTj7rllBbtk1GSGmtE3pRfbtIx0Ev/PJOhfEc6SSHL7a2wskdmrB5ECS?=
 =?us-ascii?Q?4ewS2k+yj3R/ewc+GeLGi2P9raLmCYKXi97Gzrj+qq+uSaM0A80ErOgd4Lvp?=
 =?us-ascii?Q?bVb0K+rZWapLVXkGQIVT6zUQ7WnoW+f2h05pqhANskL0Ax56?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbe90190-2ae2-4eb1-a60d-08de89b3a3b9
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 14:42:57.3738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gb4RsK2mb0fgmtwvVd7ZyPW0H4UXH1eiCWxwqLPRHpPKugjrsJ/fVS+sTUCZmPM1oscTS5sBZkpby9ivLEUHCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12144

On Tue, Mar 24, 2026 at 01:52:03PM +0800, Liu Ying wrote:
> MIPI DSI to HDMI bridge ADV7535 CEC default register address is 0x3c
> on an I2C bus.  And, OV5640 camera uses the same address on the same
> I2C bus.  To resolve this conflict, use 0x3b as ADV7535 CEC register
> address by specifying all ADV7535 register addresses.

Does cec start address programmable?  generally i2c address is fixed or
controller by some gpio.

Frank
>
> Fixes: 6f6c18cba16f ("arm64: dts: imx8mp-evk: add camera ov5640 and related nodes")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> index aedc09937716..d0a2bd975a18 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> @@ -602,7 +602,8 @@ ov5640_mipi_0_ep: endpoint {
>
>  	hdmi@3d {
>  		compatible = "adi,adv7535";
> -		reg = <0x3d>;
> +		reg = <0x3d>, <0x3f>, <0x3b>, <0x38>;
> +		reg-names = "main", "edid", "cec", "packet";
>  		interrupt-parent = <&gpio1>;
>  		interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
>  		adi,dsi-lanes = <4>;
>
> ---
> base-commit: 09c0f7f1bcdbc3c37a5a760cbec76bf18f278406
> change-id: 20260324-imx8mp-evk-adv7535-cec-reg-addr-2de67760133a
>
> Best regards,
> --
> Liu Ying <victor.liu@nxp.com>
>
