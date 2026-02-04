Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013070.outbound.protection.outlook.com [40.107.159.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E2A41C30F
	for <imx@lists.linux.dev>; Wed,  4 Feb 2026 15:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770219526; cv=fail; b=D9skAJ2Na0uMgyUo1tIL8qokdxX41iqvO58hwc1fN70LlIRIvmXeYeVsQTB4ziohV9Jkvq5CWwtMbWa4DtncICFggFrp0rxfpzMq+XTuExmWzQup3bSNPaqhCFFP2RG0SXPytbGuONniOxWjClxSNR9yRjf6SS8TWW/+3/Goqao=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770219526; c=relaxed/simple;
	bh=eZhytJAeVxk/p+IqzrFwAovmeh8IzjQRV6a1Cy4Kx2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FUmKwPJYHV7SX6+3QvuWJespwoDWiyvLsPKzM1Cd/dk3jEWpzUPG/DnkfHWmLdWyjUP0MRDRVn+X6tUvsaPgGAiGWCnSirWsbRtemWCiVmHQJew60gCn389sUpIdkuTZsdQu/dAApAGNmdSp5pOg/kUUE07WgU1mPsm9S8I3ExY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hCPLJcZW; arc=fail smtp.client-ip=40.107.159.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hCPLJcZW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Liw6nUrfZnyU//Rccw0F1GCT1tbn/mq3WH9T/OYvdXIRmpzgKrTu5fEINZZ7JjgIkQyzgvVYaSd7Vf4HIN26UtC0Qh0DPxg5sZ5YgSGN8E2E1RU3m17+p1UmkqvcjoV3fftQcb+wW7l/6/cXTLoy5JWs8LmHEFbpjvorzc9kdM7YAr/+zbXcNb1fORtWurIrSLr/1dgY4fmU6CTlfvX8HrNqPBchYrOMFAiRbvwkdqpzEm320xgw3ntSWx583kbpMFQHcB/JpKFfOOkquXD0u8c1fLXVXSa+6FG4+yOCbn7Zm/GHSKKZnyTF3n+rWDSJjPW8dqArRU/Q4YGIxZJ3nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rKANhosh9sRHTQadxRKLAYiJXbkDdlkSGB9ZPq/L98U=;
 b=W6/qr58mmo+YT7LbmXpEW/CoOdyuJ5NBGLwTGz6Vw8Yz8bOSny8DWPnq8aKpgZ20B0xZIfaj5FwH6asY0xGVzHmDho22WCOZKQkbbU77ZEKp6LIGolURqlMftBdzuIc6swlK+HTPmB5SY64dSJN1gyU3OBvEo1UInLff+JzbmEAHLnbdrGMXqXutJouSjIgJhWD7VX9jv7Y+kbQ4yAdUf6WMUOf7ajKMBCo9kPKQLtl/c2/R1qB37MDUayd8byJg+tm/NuQiVy7ZuZ8FTQT/I3zMxpTOA3VoVW5/XRttcYRcqAJB0hp9m6eOa9JJYIvOtQB9ynGe2SVxUCDcZhykWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rKANhosh9sRHTQadxRKLAYiJXbkDdlkSGB9ZPq/L98U=;
 b=hCPLJcZWOZhw9xbot0cZD9DP9xrkCkJhJMzscsllKhEjV1cnWnQkKlf6/dfG87BG8Z45Ixeynbj7Sfu8k6tVs5I3ozZWQoillj34OJAVNFJR8yU21/NP+Jhb/D6WC6MU4nPKYElJdAIho8gsMr0ICEvbw/Lay5YWJ92pSNnaPJPV0eqdrjZa7MtMaMBrlc8G27vdvZltjELySYwBHloTtSdSNaPc6sPkYK+ay/qBhRhy2PevkT/8Y267PrlyyoNzumyeDCLVK6VeKRtvv5SqhzBuANMP4xoCRJi+YbBJNYLCO8hg9oqmtoaImb0U1o6qs3Hjvo3hf2voTO6XOTP8Rw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB9779.eurprd04.prod.outlook.com (2603:10a6:150:111::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 15:38:43 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 15:38:42 +0000
Date: Wed, 4 Feb 2026 10:38:35 -0500
From: Frank Li <Frank.li@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	kernel@pengutronix.de, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] arm64: dts: imx8mp-evk: Add usdhc1 for SDIO WiFi
 support
Message-ID: <aYNn4UjvqPy_N-zF@lizhi-Precision-Tower-5810>
References: <20260204023204.2382433-1-sherry.sun@nxp.com>
 <20260204023204.2382433-4-sherry.sun@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204023204.2382433-4-sherry.sun@nxp.com>
X-ClientProxiedBy: BYAPR05CA0087.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::28) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB9779:EE_
X-MS-Office365-Filtering-Correlation-Id: 53aaf35f-579a-4b92-e6a8-08de640379fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nbdfO1HYA0nikXE6Pz5n+R7tch7EHC80YiQkAiM1Ff4qC1uZiOXDkiVVSRYL?=
 =?us-ascii?Q?na4KmPQPVMEOdLZ6P/Lqfy2YLhqx0AnyaFeIxiSatnRJfjUqI1Zbq1fjcrAZ?=
 =?us-ascii?Q?oIVyb8I6BZ7bjy/Sw2tWx6vXet7K2zCSoKStlY1f7y4ZMIjWbevIQO5yL8GU?=
 =?us-ascii?Q?32n0rW+jRFlW4o8xjMOczkoob8gth565VMHR4zrSvpBmMaefMkJerFyMSKcw?=
 =?us-ascii?Q?GQorY3TBFe9Nq2FlCCd6ArzR3hZiM/2nB/SKvo2lNa97kPihD2PdPdc0/ooJ?=
 =?us-ascii?Q?oSfKnNMnk+155lxHCCVAGtpybh6iTVbMi9lxbYVlKqytj2FqvSffOaqYlmxa?=
 =?us-ascii?Q?kEH39ualv56TkHFW2Meizx0xB0zr31XRtNdS6Qgu8x/rUEoVQg4vFMeLF4qx?=
 =?us-ascii?Q?OV3rt7+LzLe33JT240IBGnsKa2+yc3gYfhw6A6+kA+229fDjKXQY8h83wc5t?=
 =?us-ascii?Q?6azI/aC3t+w/JFkywvVFMJO3o/FFXoA3w37PmHT1gJ+3KzLMlhDpprZzIst3?=
 =?us-ascii?Q?Kf+FNFByAzRQS8KvYe4a4QR54mW2RvqpLX36ywuY5ldiVmC7mUgojxkNg00S?=
 =?us-ascii?Q?usxek37azQTM/B+gqNg7LHgSnrUhRGDBwsCIr9lzbGEq9eoUldgt4yvuJ5Si?=
 =?us-ascii?Q?dkDLhGuRpJC/JWYa3u/9AZcXPwgoG5ka+nCCshGV4d+7EGo+JdIplTKz36Vd?=
 =?us-ascii?Q?vd0OwlQgP9PpRw0LH29pUc4Zcng0upHhwTQ8xp/YZYq2OW5ZM8fQYUSy/G5D?=
 =?us-ascii?Q?xlUhxDbIa+F4iEvBDXp/4NvFqLJEs1kDhUS9+BH5MxD+Sx/EM/C5IXFKz32D?=
 =?us-ascii?Q?m2xGoNW7oKA6L8JvM536lrjAQjDoVB/S3V/MSGhPdqsaE97SP/u+Gj+F+NpE?=
 =?us-ascii?Q?1cqcsZSTgTH5C62stq5KUsbllHzeQ5P5xED4kXTZwBXPB4mLBbkuT9J2T/Qp?=
 =?us-ascii?Q?ZUqxiduFroXr1/+Edtz6VYU93b9dvjeWI492g206iFnb8IQWbhpCcyQTkTk1?=
 =?us-ascii?Q?FarpkHO26XPJJJxSaRUMgWcE0XUBFRKe4iqnx9VG+3lMgDVh2yPhChGub50x?=
 =?us-ascii?Q?UClC/hyijEkt0gxS1FglbzEl9paLBtP3HFNtMvqb+mk+QKUkFz425CffMPCv?=
 =?us-ascii?Q?q015VLP4byvC+QyBs6LjOXm+SE7faNK71s4McSwMW5yhbc5ShAquwtQmVDjV?=
 =?us-ascii?Q?4ce/CRv+sKiSLmjHaF4gnfF7jXtgMtoqc8gGYyYoTNWqo9301JxRhq8MGCDg?=
 =?us-ascii?Q?jdnIT/DUcQ9xmsGq7OhgISSDwoGvIZk7Cd5sdGG/q+8y7yqW0vtvrW8ypvw8?=
 =?us-ascii?Q?BQ45qCe/prJs9ejKdG+ldED0/DPkMFfh8m9Tg6PCWpaEmTwyFsQVZRCd6Yqq?=
 =?us-ascii?Q?BD/fEBC6eUDwRGv1ysMS04S4mpqU5aJ92UaK/nreP6gjpFVy7BfVB15zwhZr?=
 =?us-ascii?Q?Qz7x8KXH0RWeX8NW2LWtQ9XzlDCiRk24Vmsc8s24PP4DrwQlGLGstgsPyKg6?=
 =?us-ascii?Q?/VlsZDkHzUHJ1sa7Srq3OzMTZ97CKYgo722/LjwQfTsgAZU55tC0tH3krqFA?=
 =?us-ascii?Q?4NArfUgyg+qMQINPw8EmkDGbdwNvYVPqblTLqs6YT0Tmz8M9P18nwA/PfuO0?=
 =?us-ascii?Q?oHAkL0rNgPL0ET7Il6NA/0c=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cIKFxSp4WZTQeW6pInWmhXmpixvQ1sKDyJ8Taon3Kw438IDwQ+V9/VB0g0B/?=
 =?us-ascii?Q?UdvdDlME6Mw1hWbrAkfngOmB4CcslLLAVDC4jZSwEqHa//o9hSec8wGNBz/8?=
 =?us-ascii?Q?88NkqgV2urvlLgHhCmKMbYmA5KQP9djRvGzp61GjjNiyi/ArinGlNGhx2kz+?=
 =?us-ascii?Q?9p6DwtfRn2xXQnwHgGUZ0VGi+qMa7dnp6sic91zuHaGvFFrv0a2j90NiWqSz?=
 =?us-ascii?Q?z9XMBDsZy4jBgyoyq8q7XjrHKBh0qnhPsWEi8DijwHjm7wFZuKRXudmz8ghl?=
 =?us-ascii?Q?1jA6c5VpVIEngzYkvhOXw5xhTnZgS8+8oPHT7w1TFCbJcL/kbL11Qvy5Xlo4?=
 =?us-ascii?Q?Mq9eo8waiTLDemZsl9+a0pQQXMvrmJDczWOJJ3211MYESfn7paMb8fs3MTpx?=
 =?us-ascii?Q?mIzv0nQxG7WAUUWDbp68iLUdSMVEHYyMIWE5lwzsB03f/qqKmi5YIKwhnzzB?=
 =?us-ascii?Q?U+jIa23Gusvb/N1GDsUWCqqP8QILJMZyU7ilwFfhlYRXpPTpaGP555A7ebBa?=
 =?us-ascii?Q?prisWBJDnw8k8hnDj28wTAXRWvp9+VWMD3myMQuhiV2VUp5IED2y9tPHYZON?=
 =?us-ascii?Q?V/1stVRDLhDLX44TGCc7ZqKDqKjU7y3fako+KSbHNI9Ji+9m7xIha/UWjvSt?=
 =?us-ascii?Q?1DO1Y+DtWwkyjCljER1ue9gQS/HUwUJCYMBfEGoUbSxUdGytBY1Fg6B08CAx?=
 =?us-ascii?Q?dOUIru3u+8Bj4Ed/DVX5Vyo61ZwI93OSDbGKCWtcDzGV7IEZH+wvr/sRH2Ex?=
 =?us-ascii?Q?+LunGbc8IRut7cQDMouYFstOPGkdivxbBX12oaNqtX2Q5GoLHBjGAz/7fGda?=
 =?us-ascii?Q?zaaAiJIXIy5nq8WkO2QKQlXWVlB0o+x+u4k6k+2jQ3pJ8kLMfWn2HoVw60Wx?=
 =?us-ascii?Q?9q6oDaPUiFDoZ/it8Shnk2OoVvBDApDd3GYDt9vxvo13YmORV+CuR4SD04eY?=
 =?us-ascii?Q?WtZmKkCyqAKUtKFi/UVQQgyEi5Jpg7WiKZy8bSPk6tWgEBru7AU51HA8HrzB?=
 =?us-ascii?Q?fsYvWIemUL0orTwMB3GFNaFfXbRoUmLJa1wfTdfwunkAmOwhlxYEDNjU9X98?=
 =?us-ascii?Q?7X23AUxXewCb8nqckKAVx/yn7Mb0m/iALtlDDAooFyhNcuPp32Y6Bwy5t54M?=
 =?us-ascii?Q?/twpc8/j/oM2XDm3u5J18xNoQMVXZVXMQh4O6mbj2aTtXYIMQ0TotJntum9h?=
 =?us-ascii?Q?8aKMchn963CW/y3dqIOUl0igVmT/4SihHyFUd42M7fx3G1Yma+BNQ956u/yB?=
 =?us-ascii?Q?Oiz2GWNPD0htOZp+4S6GYRkkJP0Ji8GE80uablg9TKaggi4RRkyMh+S6/wqf?=
 =?us-ascii?Q?uh3FA8NAKhdngqn7jamtKRbGq9aLncDn6bsQxJkhnlzrhsjWzsjcBiDKlWGu?=
 =?us-ascii?Q?yyVULPGTP1JFVf4K1OPoKrKvA6eGTUwfiz6AERDHx603+t6r8uAzUIeRwaLb?=
 =?us-ascii?Q?ylHbfEZ0RoOTVksonDjEvFQVUeixwtrXRbEUQin7PVYXcNkmXimk1kuXYvmr?=
 =?us-ascii?Q?OhW6DLIsQ47mffKI8OVqR3PbGx9/iKW3Z0pcNpuahHs7qGOScsn19B2D1BJ+?=
 =?us-ascii?Q?TFJWwpc2UW7+pbrkEgu67RHscXudfP4sOEm4ndpwE5UpC9EvUsr619cnVKNO?=
 =?us-ascii?Q?MaV4r7dRpoRxRbM+c7dLHFIQlXHtHfcoPScrrM9YgqRpar6sG/4HLUoilKPQ?=
 =?us-ascii?Q?CMxS5xmnslfDxCrgsf1aw+uvrqRzTjAEP6KPq+YZGGX04DVz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53aaf35f-579a-4b92-e6a8-08de640379fa
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 15:38:42.8779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WQ9ftEJUNuAbXf+vL/1czSD0Fw+hblub8tgLHJ2+R58h25dDlT6ri21yvBYxIasb502N/EYBnVqH+Yp3IwqT4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9779

On Wed, Feb 04, 2026 at 10:32:04AM +0800, Sherry Sun wrote:
> Add usdhc1 to support M.2 SDIO WiFi on i.MX8MP EVK board.
>
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> ---

If prevous patch just add label, reg_m2_wlan, you can squash to this one.

Frank
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 59 ++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> index f86d6b428a47..0b45ff73a5a9 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> @@ -250,6 +250,13 @@ cpu {
>  		};
>  	};
>
> +	usdhc1_pwrseq: usdhc1_pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_usdhc1_pwrseq>;
> +		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
> +	};
> +
>  	reserved-memory {
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> @@ -863,6 +870,19 @@ &uart3 {
>  	status = "okay";
>  };
>
> +&usdhc1 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc1>;
> +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>;
> +	keep-power-in-suspend;
> +	non-removable;
> +	wakeup-source;
> +	mmc-pwrseq = <&usdhc1_pwrseq>;
> +	vmmc-supply = <&reg_m2_wlan>;
> +	status = "okay";
> +};
> +
>  &usdhc2 {
>  	assigned-clocks = <&clk IMX8MP_CLK_USDHC2>;
>  	assigned-clock-rates = <400000000>;
> @@ -1169,6 +1189,45 @@ MX8MP_IOMUXC_ECSPI1_MISO__UART3_DCE_CTS		0x140
>  		>;
>  	};
>
> +	pinctrl_usdhc1: usdhc1grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x190
> +			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d0
> +			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d0
> +			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d0
> +			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d0
> +			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d0
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x194
> +			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d4
> +			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d4
> +			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d4
> +			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d4
> +			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d4
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK	0x196
> +			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD	0x1d6
> +			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0	0x1d6
> +			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1	0x1d6
> +			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2	0x1d6
> +			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3	0x1d6
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_pwrseq: usdhc1pwrseq {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD1_RESET_B__GPIO2_IO10	0x140
> +		>;
> +	};
> +
>  	pinctrl_usdhc2: usdhc2grp {
>  		fsl,pins = <
>  			MX8MP_IOMUXC_SD2_CLK__USDHC2_CLK	0x190
> --
> 2.37.1
>
