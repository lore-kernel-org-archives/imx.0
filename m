Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013037.outbound.protection.outlook.com [40.107.162.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DC018DF62
	for <imx@lists.linux.dev>; Mon,  7 Jul 2025 09:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751879130; cv=fail; b=iDum0oSvWM48VXW43pIIA+zYfUyHmBVtSsGCxpyMA+nln/jq9dXR6R/+PdxgIq/Fkyxx2rwmcMRX7Xi4GuLZME0PHvMs5oNWXn3CuWVNzIlUKEAvPXPsFnyAreb52K77aEeIzm7XeOeDu5R7dZVi5MijFb6k+fB/9f3Sf/1PpbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751879130; c=relaxed/simple;
	bh=bzeXVq/ClbbCdafCIwbYN8wTIfHi2LDCFZZL/3JCjIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qg+tzmgB6IcPpYuRa6h5R42rusetZxwiP+Sqrv5Ji3vLzvLkJQ6q0f+kNyfhVYR4vN26ZqXbt44onRBDUTtt9+6XZrg0sDmrTIVWLvJI2xr5kOscJW4CuyujT8sxuwH/NxhpkyGUbtvwaY2DasJxTDwGEJr2KQhRhGKpKhwh5Gg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BPbUQEZb; arc=fail smtp.client-ip=40.107.162.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BPbUQEZb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ou/i5O6BAdL+STDl/S617fiBq3UvZoDTxMEeSCfGH8tZAPZuzj3XjMt0ya5Oktnc8N7GOz0RRAPzZI6knx9k/sVRLolIQTOLYQt4Ac/SfcYeGgXDwefuMrzpQuSAcm3dP5WWHLH479h9LjVxiOVs4V1zRuyx/xc5ywpKz/LJefklf+sYU1WIi20hFYNNs+ggCs5oq7DHxaSf66IDC2LaACGe9HczrUr+LF2T4vgEhCaYYhTs5HXeact06UihS1WVE/4b9Tv6oTHh05SWcQ63cUX9oRxl9Y3tcsHOWrXZWqqKgHsV22SXKbDyi6+0qL3QZTo3/XF6fOWweoGHC6GQ4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/kmQuUsYTJ+9sdGYqj5sCjXVtIqCTYOrNselRGah+H8=;
 b=qcdIPZ5u9WKgSPsNDogOr2mH1wKCkt0cef3FCZShZfqiraCtp1Mo+ZPbXHx17rK0HRe0gC2BPox9GjaI8MfvnSLtDv2stFeEOyxjTYjodMp3eskl407w1UM9ZfOf/g4Mv6/eI5r6Ex9AFniKnFlePil52geWHs5tyuYLFKAKLaCThHNFLAnVPd3tfpuzDc1jBmdIGf2qe4ykOHedSOnKV7VKkp/tiS0/P/NprE0XxSWgJHfluMvzYsJHLia6uMqrjtJMgmcNhgXrJclFbfeE5p3nKuOF1N0QtQopyxIrEHAJFUJyvRO6vN6KjxnbVhsbJNjCJxN9W2Q8aPbq26prqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/kmQuUsYTJ+9sdGYqj5sCjXVtIqCTYOrNselRGah+H8=;
 b=BPbUQEZbeFxCwX0yQU7k4j2s8xaJiU+WLzYi8OJkEz+8zmGGOioghdH3wPp4Psu9jmM0zZvvEkPh1KgyLtBAkkWRw6NY5/mLwzfjqvkh5nmSALkf1jkS2RXkPGtY1zp0lzZtSth/Hc5CzyzcYZwxClQGOrHA9wuQPAmSOkxpgiewoarC3fQddjqawgatvEE/f6jFpQIGTG/GcQDfnxpq/XkWKVcjz+KYoRgYPOqJjgRbgKaE+cIA99Af6wJE0S56ooT4Wi/jC/TImD7RqXm6j1GlR//briX9sF9Do6obpbzur4bQGuul5mvrTFbWVFRTMQlj0zRFe8dwMcTg+5hjXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by AS8PR04MB7653.eurprd04.prod.outlook.com (2603:10a6:20b:299::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Mon, 7 Jul
 2025 09:05:21 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::4e24:c2c7:bd58:c5c7%6]) with mapi id 15.20.8901.024; Mon, 7 Jul 2025
 09:05:21 +0000
Date: Mon, 7 Jul 2025 17:00:15 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Shawn Guo <shawnguo2@yeah.net>
Cc: Frank Li <Frank.Li@nxp.com>, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, jun.li@nxp.com
Subject: Re: [PATCH] arm64: dts: imx95: add some USB3 PHY tuning properties
Message-ID: <hmnhzrelczmxe2veyxabugppxcgokmz4f7bhhwxl4j5e4j2wt2@swmandploh72>
References: <20250627031348.3455547-1-xu.yang_2@nxp.com>
 <aGuDbE1_9Sbug-NH@dragon>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGuDbE1_9Sbug-NH@dragon>
X-ClientProxiedBy: MA1P287CA0023.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::28) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|AS8PR04MB7653:EE_
X-MS-Office365-Filtering-Correlation-Id: f35fcb62-93c3-49a2-e8ee-08ddbd3566b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wPXF5vXWg+MOFKHFkS1Wa49rKkyAD4C9cdQ7Wu/HIu+p3nPZ8490DfTBVBgE?=
 =?us-ascii?Q?Zv7xMqkTkSh2NdAVRgbuaNL5jNleCeWR/C03MnOdfQcHc9R9l2nfDEH7rPW3?=
 =?us-ascii?Q?HkcfVaPGkASK/1dWDE96zsA8jy9lFl8P7pVzPKevH2R+alEUOdYTTUP68Zei?=
 =?us-ascii?Q?1jVU+R/jJs9q4Al3rfc1JvsTm335MlP+0VkpqygrFHeEkzHHGr0FM1fW2wQ/?=
 =?us-ascii?Q?Rurq9Hd76vXiWDVnbmel9hDzspTatWHzofgRdG+JW1dIMwu9nTNzlgTlryAL?=
 =?us-ascii?Q?yWSnLPP0AlrWpe54BfpqFEO+4ogz2IgISQ4+Y6Nwf7DRW81/VEz9/j0l/d2Z?=
 =?us-ascii?Q?++u9ZGP0mUINivjiMA3CCD5ifLk9znydZzP6s/qArF0VcQekj7ItqF5k+iYk?=
 =?us-ascii?Q?50MBDdjU0LAXf7rG6go9mkODGGNlaY19bfaVnbZ1SVRcIgjP7NzUg09wZYZ9?=
 =?us-ascii?Q?eEo00qYsXe7LxpAZBdWWExtiquMsWB3W8xdC5ZrG8Z4Ugw36kUahrOMejRUH?=
 =?us-ascii?Q?9iD0X9vaIRqGGQZ/jA/JXRP2cmKo8swLadjGWjNMfH3Pz0/MGyeFoktA7fvx?=
 =?us-ascii?Q?OqRkQ4mOvduDZFh3DiNb57mo73fbfo00Jbi4WxKnK0QSVbjUUqV7ttVzP89W?=
 =?us-ascii?Q?Puoo32nXYXRzlXhZTgtWQNTVHO2glExFKNZyF96KnsiHokKciZ+eve5ONBJO?=
 =?us-ascii?Q?OcJLz3N39vzi6SXjTdOx9IvRkroRV3ko6WGGG+228NdBmIsm87sol7mATcaz?=
 =?us-ascii?Q?x/35fifgTXHujpxKQVrLFIrLQHi1F7YQZ0lfK5uCb57AgQAkAWBecxUbXspi?=
 =?us-ascii?Q?ksEusCM2YwJ85qo1/CdoyAOws4U2GDCpE50XrkeepB4giuW3CvUI9VWHgMwg?=
 =?us-ascii?Q?i4A75ZAlgEuoYaWwNrc89enDw8MAbcsbjFKjBF4Qc/NCbcHoV7yvsu/ZshzP?=
 =?us-ascii?Q?rH7VyWJ3lVmF/uibLzwIGpS+JmV5saogcggWKFNh+PRRoDIXaA98J+TpPofe?=
 =?us-ascii?Q?i1ZMNmT4NzuwRRW1xmwZNxrO42H1Ug1qErWLhznioh8NRgkk95505+pU4JVo?=
 =?us-ascii?Q?UoOlhX4TwmPgB/RrsAUdvcW/x1w6ZXgEDlFgilBUCMoEmMfTJ615r4u0WSxL?=
 =?us-ascii?Q?+7H/W2HcxNqT1mIEjiUKnzEGWQqdN/V88HoiMneSzeEYLo8/kvtroegvnCwX?=
 =?us-ascii?Q?GRnqNxqYVfoDkkb3wF25uCG+NOdTpe5NuBttSxsJDHA2hd3yZuMTAwZ8ICUk?=
 =?us-ascii?Q?JzBbtEe4rOU8gz5GdE2JD3XiBQuWkv4ugcOD4qAkvpM4Fxf1DtRHP+rldYP7?=
 =?us-ascii?Q?1BtI63b8lENg8//ZvMtkg/I242JD65WGlsS5GePt4KOS88q+5wNxwUjFFEiX?=
 =?us-ascii?Q?6l35DDf9pLVaxLMnMP6THl1PcONjLQJDQCC/ppr4dTfeuRzNePgzrL04v2Av?=
 =?us-ascii?Q?WpGa1Hos+31HtZzevCkuDivgcNRRhH06LLAgdpAl3NF+eCd601e/caPBfRgs?=
 =?us-ascii?Q?9mxMmIZ8J7ZebaM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GoubZnBhNTECuRkeZ08fjVZoWekW6t2nu6rQ2tfuokdTbNoW6vx4J3p2XdPF?=
 =?us-ascii?Q?sYtdNsQm7BDHOSQ/nzQfWLPWW6gBsxh8B9xO4rSlnuXkhjMvsAZUrlk4s4i/?=
 =?us-ascii?Q?UFRmcSlG9PYW679Ced2Q+F89UeeXu/Ht1e6K0OBrAIXiAC3N3hj1JgdXjEkP?=
 =?us-ascii?Q?NGxF7j0nfVvccZebD5qwBWK474/ECAvcKriLbx0EnVOrjq2dIil30EdjELm2?=
 =?us-ascii?Q?LA4AwVJLxBVYqKEFX+X2R99T1SToBJI3hTqQFSSTBI7UORnGh0SKitJTCSaX?=
 =?us-ascii?Q?JnJ8oeJtcRukCn2jXbaufWPSUzymskZFRtWKnCWHW9+aXEFmxZ6JvmJlVuwW?=
 =?us-ascii?Q?HSOyDuOtsY7g6+XzyJyu5h/Dy2HNMMRe6B/AC+VgZQfu0h03dudvbbqbXvQt?=
 =?us-ascii?Q?2Cr3bY247W+g11G4JqyRc0pv/jdp8tDwoQfjZ1GuV2T5TQCa1UGVU9S6Iwcl?=
 =?us-ascii?Q?It8hiakzjDIDoEYOGh8ZIKq/kVIIl9lBy7/D1E+NOJ8PRDWEY8xyu9hxhNQf?=
 =?us-ascii?Q?xqKriarPXcHxiB/dgfIOdqs7ALYrLIeH4c9p3/RqYR4kjBzGmiwvoGGRlBio?=
 =?us-ascii?Q?VYhypTbJC0/hAoiQ1soeUcG+pdp7LBUZ156WlW2R4G+96bi9cpAnLka9Ggzu?=
 =?us-ascii?Q?RA7FIHJJJ0bA8CAkM3riJ4kiz86bNCnyF3CbWwSnh13pOxLdVzkJ0gumIIhg?=
 =?us-ascii?Q?wy8gveeHHdnzn4Y3woR9VgpLSHGx1BTx+IcuXQmn05KMqrEuXjCiuuVqCP3s?=
 =?us-ascii?Q?NFq2r5E8cUsKTtGDt8Xv1nVlRbUyZ3ACcYcpTfc7wMDTJLZpWVH7naN1h+FR?=
 =?us-ascii?Q?STftqAX2RF2P5FWIQxmIKHJpvDLQbyg5kApvvmq6P7iw3dRII6yXm/SmcA62?=
 =?us-ascii?Q?eNUkyYF5Ktbfs0WOW+k8V2kZ8b0awDJ87mhaMdmVbQKwgeIJfW7gjykxdwcd?=
 =?us-ascii?Q?/cjAR19erEufHidOvF2CuYbTOg++f8nsIHlpQaKlPDvpvUwl9d/YDT71ip/C?=
 =?us-ascii?Q?QY2WH1/2zXVd1HFGRWkngtjYqSsFwPHq59u9OJYs8/ZhYWMH17ECpKVkeAcj?=
 =?us-ascii?Q?Sqle6jVkNuhH7+DfghIm2KF9BLc8yR76xLQzKtcoxu2J9o9D41Z6r47RZ8nq?=
 =?us-ascii?Q?pdzUwuRiBb20wJXk1Qvr9n0qsb2FnimZFignj+vtseEK1oJOHCil0xiMi0yC?=
 =?us-ascii?Q?S+PdVsFBMmhlUFGcJ1kpQ/q7ufYFNofTBI8As3uTg/IYfmLt4WqExMEPoOLS?=
 =?us-ascii?Q?H9nua72s9WR3TPKRJIzgPJScEnCFQ4lylND+G18ZHVIpJySmlYFhKhjc+7AJ?=
 =?us-ascii?Q?3p41LkwSmzsajPPpC+6mRnVBBGd7gGuP9dDTc3gYCQqtbbFH3IuEv4RqS6wC?=
 =?us-ascii?Q?VWhvONW5RDEN+6+xhwONxqubkdaP9ZIujvBMLQ2/mXF/wI5JFD7EhgXdizrK?=
 =?us-ascii?Q?7xTUdjsrjJnx0CVpbfqxH+VEMT8CoseSRel6n2h1DzcHikUUNNUbJ/htgN23?=
 =?us-ascii?Q?xW598dqUvn/HnO2Hl7tCNbdi7LCyM1c+h4pd1t5QyvTen0X8Z6ppg09jqQSd?=
 =?us-ascii?Q?CjjAvFGBZm5kfYQQJWmftx6Eexid1d2bZHSRti1U?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f35fcb62-93c3-49a2-e8ee-08ddbd3566b8
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 09:05:21.4487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IN2qq3rvsQXJE1lJt2Xa3NXAk8YbNMYgQwuM447HNflXeX5m2RcrMzkScCpinB0TmkvsZx/ALY/xnZ002TDtmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7653

On Mon, Jul 07, 2025 at 04:21:00PM +0800, Shawn Guo wrote:
> On Fri, Jun 27, 2025 at 11:13:48AM +0800, Xu Yang wrote:
> > Add some USB3 PHY tuning properties to imx95-15x15-evk and
> > imx95-19x19-evk boards to improve USB signal quality.
> > 
> > Reviewed-by: Jun Li <jun.li@nxp.com>
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts | 6 +++++-
> >  arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts | 4 ++++
> >  2 files changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> > index 6c47f4b47356..b26e9db7832a 100644
> > --- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> > @@ -1069,8 +1069,12 @@ usb3_data_hs: endpoint {
> >  };
> >  
> >  &usb3_phy {
> > -	orientation-switch;
> > +	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <17>;
> > +	fsl,phy-pcs-tx-swing-full-percent = <100>;
> >  	fsl,phy-tx-preemp-amp-tune-microamp = <600>;
> > +	fsl,phy-tx-vboost-level-microvolt = <1156>;
> > +	fsl,phy-tx-vref-tune-percent = <100>;
> > +	orientation-switch;
> >  	status = "okay";
> 
> It conflicts with what I applied from Frank [1].
> 
> Shawn
> 
> [1] https://lkml.org/lkml/2025/6/6/920

Well, my bad. I should rebase my tree firstly. I will send another one later.

Thanks,
Xu Yang

> 
> >  
> >  	port {
> > diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> > index 6886ea766655..e212f12f869a 100644
> > --- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> > @@ -514,7 +514,11 @@ usb3_data_hs: endpoint {
> >  };
> >  
> >  &usb3_phy {
> > +	fsl,phy-pcs-tx-deemph-3p5db-attenuation-db = <17>;
> > +	fsl,phy-pcs-tx-swing-full-percent = <100>;
> >  	fsl,phy-tx-preemp-amp-tune-microamp = <600>;
> > +	fsl,phy-tx-vboost-level-microvolt = <1156>;
> > +	fsl,phy-tx-vref-tune-percent = <100>;
> >  	orientation-switch;
> >  	status = "okay";
> >  
> > -- 
> > 2.34.1
> > 
> 
