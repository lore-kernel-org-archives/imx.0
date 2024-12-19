Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2041.outbound.protection.outlook.com [40.107.22.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3E11AAA0E
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 19:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734636304; cv=fail; b=rIguwz0qOnT7BRZkXr5zWOUy10E1yJDjivuAEcfkjv7mSKmpCDH830hI1rH//7UtZFJquNMlJ1iqBA8h/fMvsyECg4KyBtnqbVhuBLXtR+o7mO6UkkZ5mwz6rgLwWTaXzhw1i56pPIulZs1jl7Gf1yFtpAjhF8avvfrRDh02gnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734636304; c=relaxed/simple;
	bh=BXGiV6EFnAl3eHZBYfbVJF4ErnRIZLe81Ko9/uWCpHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qyCCL7QuMyIdT7QVW+Fe9Pvai947cKoewy6vwdfVWpDtNmCjZXTFQMM8FawYJJniHFdwD+MLYlN6Dz/yjP/7QFYStHuP0cMsF5SCR5AwqcWs9WuO0GAsv1LrqRe2NbOZGYOkuKYZQok65VIyt4FdiFrkNIqlqTu3MmJ37NgGlDQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XQd0nXqR; arc=fail smtp.client-ip=40.107.22.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XQd0nXqR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gs2W6jFEqP+mkFpzveIZOLdcB/9zSm9Qmf6TP23+G67BVitruvB+d1rKOniBtRgvt274stPfz+TRYN+H9f/Nh6P6Y6donW9uzUudkYz42kmSbzf7oI7fa5o2xXWg5g3WSbUIF8yIfymeGxtwkATp5gnnv8h57TCm8aDMsY0e/SlVuVuBIJNh/r6vn/KdSgp/1z0fX9m/HrD98QS7Vw/wRG+lBSVlr6Xcn/AXeac97IXAXCSgW/S0yVLMqvfryhfBf64wxkye442O2pBE2bbdHvycLYj0CCtEwc0IbkimBKSJwOSrBcmI0SLVxpR2Yw06opxUkmpO5s7xFZkeA0E/EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0uAu7myzttaXtOAMFJqbdzvSDpY4zEacOZ2wPa7zsss=;
 b=HjjyYEED0qKDVC0KyXIYqVD/qH1RaGpx8hYEcZXOxM2mx7c0wRu8G+VfuW67Qs9MPn7XwnEjLacmYEC4MFDNsmKZmYH0YePh/Cm1Z8IM5BbVHF3x0cR2XKhNadlMFafBcGT40irWUUu53C7K0uXeQzKlY8Ti92qbDcAtrcz16sbBSpw1V+99bx0x8JRaznmDVyNOEzbKD5KLMp9ww25x3AwBQNhWn6NdGL3yC19yjOSlds4Fo9AtlW2bpw5LdA55VwxcvMkJbGE9ZJ1ghNg0DrSCbTA7tmzx+JX/dMJnt9RxPzJtqn1DlBJy5I3IKGTrjfeZe/YVcBfn6t0w+sOuFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0uAu7myzttaXtOAMFJqbdzvSDpY4zEacOZ2wPa7zsss=;
 b=XQd0nXqRxCzgnVtOFaJHoIS7OA0VsC5l3YZgfNBeRHIR+O7oDCCFQX88bURfa0L7Ji3usQyi/tzpHQ4wilXONcbYzwM9mL68v8W2aS4tZnI/+aczQUn1ElpHbW8/dSVIz4jVmjS2PYGR9ejl5NK5Yq6o4uIDkygh7e6LLu3NPUsoPDEIf9TI+BfmT4EieA5o3O3nucfA1chOMEekSC9VZ4UMehZUDQsxDea8pXSHFCnfEcrOHCgTTi+eBbHmlYl+FJ/W1fCEW0oHrR+ERzOA1tJMH1slaE8nphvkXa8MHN+J/slon5djVv4BNTj+uowTBDB20SG0sXnEtMCGgeb01w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS1PR04MB9453.eurprd04.prod.outlook.com (2603:10a6:20b:4da::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 19:24:59 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 19:24:58 +0000
Date: Thu, 19 Dec 2024 14:24:51 -0500
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
Subject: Re: [PATCH 06/10] arm64: dts: imx8mp-skov: describe LVDS display
 pipeline
Message-ID: <Z2RzA5S/ch1YDdUD@lizhi-Precision-Tower-5810>
References: <20241219-skov-dt-updates-v1-0-38bf80dc22df@pengutronix.de>
 <20241219-skov-dt-updates-v1-6-38bf80dc22df@pengutronix.de>
 <Z2RZ1o6AWGRe0ww9@lizhi-Precision-Tower-5810>
 <1b5236db-9a2c-475c-825c-3feae22ea32e@pengutronix.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b5236db-9a2c-475c-825c-3feae22ea32e@pengutronix.de>
X-ClientProxiedBy: BYAPR11CA0039.namprd11.prod.outlook.com
 (2603:10b6:a03:80::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS1PR04MB9453:EE_
X-MS-Office365-Filtering-Correlation-Id: 183be262-ebc0-409b-03cd-08dd2062d3bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|52116014|366016|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dU91XwlzkmsyslCeLT0ZprRgO5q5YMq2c8h0vAcwUFTG4ndgpSKSwilvfEOi?=
 =?us-ascii?Q?I3qc25mN0JcRkrKCtHSyiWojCNq7h728p5d/vZWokuZ8MrOPpmtzHAwGitPu?=
 =?us-ascii?Q?XFuixV07BgaZNsmIluDNIeBjX5xq9GbWMDu+IaDlu6wBNsNLegvKEXbhhNtc?=
 =?us-ascii?Q?PzQawaVxiszqH2q8LRee8jWZQ25yViYjyvDX34PsWSDy8DO/h7jjycStoFuD?=
 =?us-ascii?Q?+YnS8thg9uVEq/n9lNR3eP/+HK6iS5r9kc87uicZZkH459IjNXvsAtFOSM04?=
 =?us-ascii?Q?v6nWILswyeU6SCNe6Cz+OyHi7I8m5a5Urci+Vmm4ZD0xvIpp9z1q8yY2Rfqo?=
 =?us-ascii?Q?HCYoPF5HtWeT5Lekex/Yrtx5G6dRdmafb9mSM1e0yeq/n0Xw5js3tophc1ax?=
 =?us-ascii?Q?B/g8LSRX0stkjFxljwksl1cm9uwKWEsP6RGY7MEiPECM7U+w4jhBhd2upB7O?=
 =?us-ascii?Q?6Fyn3be0VgQUiJBENgirBv+zY5vDaXJExGnYnoT5589ygN1oI7GKyEM7lWDO?=
 =?us-ascii?Q?HZdvPEpU9KJM3xfJc111+s9mieheg6dm6MZv6DU6Evzck0KZvdiinpVI5G9i?=
 =?us-ascii?Q?wxqRESA5fkql8Ak5cZb3Uf45kzVUJtxO7GbiQrSi98RBAoVwFbvtK0Kv0Kxa?=
 =?us-ascii?Q?TfmU+wCisobbIv0EdRfzN74D9sEK220/XhauLWM4Zv8m/J1dILdN97hdHX1s?=
 =?us-ascii?Q?cJ+pvj4M0gAfdVIy6gUCS9AD7T6e0rFlCVayVs2JTeiJK1OnWBpCouY6PNG+?=
 =?us-ascii?Q?Cj2lMUbVPKtdJZFbcBPZGuLoQGZ7jYMHPWFbzlt7C5zltVGQFaxMaimBjhbh?=
 =?us-ascii?Q?2dTGydCDq7amHP50FS0ejrfwS8W5hDr4sfpNXSW2MxTX/fsWOMQBVD7c6sC/?=
 =?us-ascii?Q?99A7YCu+0MsK3ujm/lwbzK5sltjY3nUrHUIYBiz25qlLJpLXlzV+oti9zi0H?=
 =?us-ascii?Q?PcJmvyr55iS5iqQ+UuHGyEjqD9sq7wKtBdGCMkc59i8iwvEyqn/EXJjmS2hR?=
 =?us-ascii?Q?d7LUnSL+LLYJ9KVN9asg5fxVtUYRDUJnOs4Hed36OD76nvu+qqut7ztuw//s?=
 =?us-ascii?Q?FqS4+RTIEyxSm1FmFFQ4wZtIV+Xl5hFUJpNA77D7F165XgS4hGQeg+Lccpo7?=
 =?us-ascii?Q?lFFb9Zmr6kJdn+TxpVZA/eLIlCeuqaCZHMR8RoLeaca2FHonKT0rf9Vwdnsg?=
 =?us-ascii?Q?Sg/HllSPPCWqr0X1SlHAzjGbzb5DFzBiGquvqnc6VCveCYZtzzeWvoB8wQiD?=
 =?us-ascii?Q?4yP6guTbSmOkVC+EjOFrHuNYaBi9nFnNrE8h34A/kc80iodlZlQtJq8DNq+B?=
 =?us-ascii?Q?3fuNiEkPOrGg7Vx+499c0kB7/3jYhzklaswsTGv/KbGdV6MKRpjd3INsMsgZ?=
 =?us-ascii?Q?MJYTCMTNvI2crLl79qjvULpMGyR9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(52116014)(366016)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6WE3ycl5yO+aHGNT2Tjb9wW1t7Tcu1Zwt8s/O/Csv0i3pQNRg5j1aOTT1yNi?=
 =?us-ascii?Q?WvtcT4oWcvLvBnlP06F9GSdkwcoj5qzv3ZSuNCkfDh6U86CQdql/BBtL5bcO?=
 =?us-ascii?Q?Ivarn4tLjDxpdByvD4mufYpQG7fYLLe8G9acV6XHY6xt0pl/v+UwDJ2agwge?=
 =?us-ascii?Q?M3/wKq+6UeNgfMpHZtLHciwWq7OUEUd56OYugf4oNRLUEXPm2yGEPBCdanT1?=
 =?us-ascii?Q?46xkYAeIH7hLkCe4i/OsNaGnLmRud1nWEIsHRtljPplp/Q+dMusMzc2HcB+W?=
 =?us-ascii?Q?JfT8sD4E+5TAZucGUGfVxCFHsTIcaROoBLn6SrcZE4Db2RPkj5RIjwj9pdKo?=
 =?us-ascii?Q?BgxKWPRN4jW3pguxJ3tQpWhqAzUD8kT36UbENgfkA/eVAo7ZiJP1xMi5Y+Wg?=
 =?us-ascii?Q?6t2anJhdHgT5h4yLX0JDdt3lfJup/KsdHYC3nPMVKAbCt0n/vWuMC2/9HSQI?=
 =?us-ascii?Q?sGJZY6ZTJZ4oaTzeK9Dw6C2qABIiaaoczoktvgDhkqV3qy9esNTQvh7U0PgH?=
 =?us-ascii?Q?uyh1GRkv4j3hPAQzVmfgapoZ7NCuDb8RGC6F/51v5bVFL6HbWUQGwMM3XDGv?=
 =?us-ascii?Q?LvLizM4voto7EOkmrCRHEBlYWcmduMEvH5YEqUrF6nrNwX9aCbkYtCEhMvcb?=
 =?us-ascii?Q?oYh6VtXfXC8OPr1XHZMGEW53UPWbv5S2Bu7TqrqfVcqYnPTHgAaf3G8Xz/kl?=
 =?us-ascii?Q?Q3lkykZtkp0cPKgD8o2O/d2CYZg032WZXQRW5cVqg/be/wlE49G3Scgb6X+0?=
 =?us-ascii?Q?m4jsU4FLqKVbFnoLtVtuU7397GvNeJR9wMOyubDwPxBsNvQlbujg+ohsOGCH?=
 =?us-ascii?Q?+JoUvlAosV3iun/dg1IkKe9AzjoPG9nkIGcFKB+D4KQ7e6/6vUPLSEWCLNJu?=
 =?us-ascii?Q?8Kps6eip5fMmcdFymykB72UxtV+JsWIjXAzHSOUmJQN+J6LIh2bceNCp+ZsG?=
 =?us-ascii?Q?rxUBYOGEkqFV2WN85akvc/Vr61bIELC1mgVDuCsyr+tqK8X0GcLWAkL496KG?=
 =?us-ascii?Q?9NNAMTkSxM4nXce2qK5UIDQsoIZbbNRNO++HEj8uiC9tvALP4XILKzErqADq?=
 =?us-ascii?Q?NFOJEX4gHczEfxJu1E6+l2aJ7X4bD0pXSKp5gxkaLye4zIOTMG7yYi1WhfMV?=
 =?us-ascii?Q?5vM1tcLhGwMm1ILYuxanvMvxV6NLJjmpfpRJJ5MGi5zIsKplLwzCrwKY6cjU?=
 =?us-ascii?Q?J4ciKla4mU4MmpPRji6pcN5lkPursqDKLlkvoFTwklAF5uyoUNShPbP+MZql?=
 =?us-ascii?Q?GePnUVQy0/8l0NLZq8U1AjVzk2EAEykd6uciqkXJLq6XEDN4S7nrHCk6bn5Q?=
 =?us-ascii?Q?rUzKCqH3sUPYHsDB6RWXJOgmq5S+qqIzldf77OnS2J777JALO+lb+E/z5lfC?=
 =?us-ascii?Q?LzKG1AalFbgxPhJAMUq4uI1e41kp1UrJmvGHeENee/n+VMRB6ZqylWxLKujm?=
 =?us-ascii?Q?ttoLDKKS9iYCNN/BSUdZpbUJvwCd0YanCLasqTAUUXCRjbof8sJHW+NLz0Vm?=
 =?us-ascii?Q?ncsXPt0Cno2QhMULOX82VsjBNxX+kTgpR8hMJyT4CC7HHQLgQybf4d+NFEH7?=
 =?us-ascii?Q?5hFrgTSF88Yxdr4WFYkaU28Yy4CwDRveLQG9H0+l?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 183be262-ebc0-409b-03cd-08dd2062d3bd
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 19:24:58.8637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qI/2qclrGW3seWDASnQHFznOLeGFN0OfkqbpnxE2gFjmz6c/J1R897rt7ijWB9dnKFiGH6coEDRxiYIbOaL0vA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9453

On Thu, Dec 19, 2024 at 06:45:24PM +0100, Ahmad Fatoum wrote:
> On 19.12.24 18:37, Frank Li wrote:
> > On Thu, Dec 19, 2024 at 08:25:30AM +0100, Ahmad Fatoum wrote:
> >> From: Oleksij Rempel <o.rempel@pengutronix.de>
> >>
> >> The Skov i.MX8MP LT6 device tree so far described the touch screen, but
> >> didn't describe the screen itself. Fill out these missing pieces.
> >
> > Add "ti,sn65lvds822" touch screen description for i.MX8MP LT6 board.
>
> This is not what this patch does. Touch screen was already described
> and now the remainder is being added, just like what my message said.

My main means, use below order to descript commit message

Add ... for ...

Frank

>
> Thanks,
> Ahmad
>
> >
> > Frank
> >
> >> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> >> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
> >> ---
> >>  .../boot/dts/freescale/imx8mp-skov-revb-lt6.dts    | 60 ++++++++++++++++++++++
> >>  1 file changed, 60 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dts
> >> index ccbd3abedd69..baecf768a2ee 100644
> >> --- a/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dts
> >> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revb-lt6.dts
> >> @@ -8,6 +8,45 @@ / {
> >>  	model = "SKOV IMX8MP CPU revB - LT6";
> >>  	compatible = "skov,imx8mp-skov-revb-lt6", "fsl,imx8mp";
> >>
> >> +	lvds-decoder {
> >> +		compatible = "ti,sn65lvds822", "lvds-decoder";
> >> +		power-supply = <&reg_3v3>;
> >> +
> >> +		ports {
> >> +			#address-cells = <1>;
> >> +			#size-cells = <0>;
> >> +
> >> +			port@0 {
> >> +				reg = <0>;
> >> +
> >> +				in_lvds1: endpoint {
> >> +					data-mapping = "vesa-24";
> >> +					remote-endpoint = <&ldb_lvds_ch1>;
> >> +				};
> >> +			};
> >> +
> >> +			port@1 {
> >> +				reg = <1>;
> >> +
> >> +				lvds_decoder_out: endpoint {
> >> +					remote-endpoint = <&panel_in>;
> >> +				};
> >> +			};
> >> +		};
> >> +	};
> >> +
> >> +	panel {
> >> +		compatible = "logictechno,lttd800480070-l6wh-rt";
> >> +		backlight = <&backlight>;
> >> +		power-supply = <&reg_tft_vcom>;
> >> +
> >> +		port {
> >> +			panel_in: endpoint {
> >> +				remote-endpoint = <&lvds_decoder_out>;
> >> +			};
> >> +		};
> >> +	};
> >> +
> >>  	touchscreen {
> >>  		compatible = "resistive-adc-touch";
> >>  		io-channels = <&adc_ts 1>, <&adc_ts 3>, <&adc_ts 4>, <&adc_ts 5>;
> >> @@ -78,6 +117,27 @@ channel@5 {
> >>  	};
> >>  };
> >>
> >> +&lcdif2 {
> >> +	status = "okay";
> >> +};
> >> +
> >> +&lvds_bridge {
> >> +	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
> >> +				 <&clk IMX8MP_VIDEO_PLL1>;
> >> +	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
> >> +	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 2 * 7 */
> >> +	assigned-clock-rates = <0>, <462000000>;
> >> +	status = "okay";
> >> +
> >> +	ports {
> >> +		port@2 {
> >> +			ldb_lvds_ch1: endpoint {
> >> +				remote-endpoint = <&in_lvds1>;
> >> +			};
> >> +		};
> >> +	};
> >> +};
> >> +
> >>  &pwm1 {
> >>  	status = "okay";
> >>  };
> >>
> >> --
> >> 2.39.5
> >>
> >
>
>
> --
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
