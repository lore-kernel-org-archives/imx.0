Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010028.outbound.protection.outlook.com [52.101.84.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 850783F54AD
	for <imx@lists.linux.dev>; Tue,  2 Jun 2026 17:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780421600; cv=fail; b=IvMwYSqXYzsHcW92cqFfvBk9D4yX5Rpei5+hEHzD+qIEv8R9ZH50uHFm5MeI7y3DUABj6tfB4vRNaARQcSwsCnQ/skY42hbmNeZuH7C58IQCJT16PErNWUuXYRHKQcU0TMyDTIg2a4C+4aVP2qD2yXERXCAOXJi20uLp7VIndo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780421600; c=relaxed/simple;
	bh=Xk3yqf/MNG+q2WuRSrt+8fEEI6aZeZ3HOOp642RwVNo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ApVDLu8rR+JE5Gtpkwo7hnb5G/ZM0fWrACvBZRr0TQZQauxLjw/rL4pB+afkMd8KCcSr6qnGZEufhOZUM4MdWc5WxUztVmH/EL8fKQKduaF5OkWnAe3ytkpkpjgnBNoiHIVROKyknouRHcPVndJrU+0V4lh1W/5q1cKwDao1oKw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RbjjI4MC; arc=fail smtp.client-ip=52.101.84.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RbjjI4MC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tDW9b9+ZdEWk1BeZsMg4D9dr9Bztrmpeps66xjnb5i5J8hhXjCdqUP3S5o9U9a9KwHPrQ3U5lpF23z4RUU3Q2b1ZHK+lq+1fGhN7utHAlfEG3RTcxWv7Wgn+POc19A5JeuyRav2NK7DGtCX1QsLqH904EDGxnyzghsUEDfobagw8VsjJ4D37ydUTwlRmOVFV/hnGsNZwJXlz4zfpENaF82dTNSLHvozMYQZCxItEFFLBS7C1p0XbzqO5bh0CeXWTaIHhocbCz/4PPjRYDZ5orUhgCjZ95vJjyKDMQLLUCxdfLHSFeTQqKqvMuZYiL8/zXBk76G02snfL6g9mid2A2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mu5r+GmauDHww3Mv1+p3Ap6bKzNEdRhjnYkB5cul/S0=;
 b=l2l9HNWYUFk/xRz3g0SjTjZlewgspQMcby7EV7S74Sk9O2ir+T3yGQGJd6AID98HZU7yYaiVJn8tb4vUNU7Li+a7LwT1tT/BpUxxb7NsC1La0WmoDO2/HUeKqw4T7uTnDEm+pbWanW/a5S62u1pdbiESTCBNLDU5FHfUUW1oRn/2BNxDaW2dNz7wiQVbO85p9iWp588fSQOwAHhc4RiED95j1n9jYHPdhHnt3OWkaPb76zKjmcVYFORgznRol0QBVm//8sv5Omh8Uw71m2gE+2InLTWy98KvHz7U70d0DMGEKSnlPvU6yjsvZ7mSEI7cxvdcnBnHZGQ9rqaVvzLg5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mu5r+GmauDHww3Mv1+p3Ap6bKzNEdRhjnYkB5cul/S0=;
 b=RbjjI4MCfqm8j8oIMOl+Kv1kXyEp2o1XRMgHjLsrSL4JZ/bBE3oIFsPu8AI2OLhdZJ2fr3k9ROH9EtIwxaeOqRjXj0lfbPvHXRlXmX5TWil1gc4DuaC5eewIRSHjf0u4k/RP83FvhM6Z7RmyjtMCx/i2lk7mH+JK8krcM6Ww3wupUeYeOHcbvF0PjgSwAhWueffHZcy4Gf07jUVCIoGqTSLFGL/tznugR+Yqybs7qazeZuDEUjnKcyCAMFlehYnH1VHizBqhspwAhRsMXb/m5aLHBnXxrr1YXltYFd0eHLH2De12zI5vW0Va/fPimFn7AhFa16hWBGu1Lajsl2F1xQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8338.eurprd04.prod.outlook.com (2603:10a6:20b:3ec::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Tue, 2 Jun 2026
 17:33:14 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 17:33:14 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Franz Schnyder <fra.schnyder@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Franz Schnyder <franz.schnyder@toradex.com>,
	=?UTF-8?q?Jo=C3=A3o=20Paulo=20Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Francesco Dolcini <francesco@dolcini.it>,
	Antoine Gouby <antoine.gouby@toradex.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH 0/3] arm64: dts: freescale: add Toradex Aquila iMX95
Date: Tue,  2 Jun 2026 13:33:06 -0400
Message-ID: <178042156153.3430605.18319197410717578526.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260506-add-aquila-imx95-v1-0-69c8ee1c5413@toradex.com>
References: <20260506-add-aquila-imx95-v1-0-69c8ee1c5413@toradex.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0125.namprd11.prod.outlook.com
 (2603:10b6:806:131::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8338:EE_
X-MS-Office365-Filtering-Correlation-Id: 21a3e509-365c-4749-9a54-08dec0cd0668
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|7416014|376014|366016|1800799024|56012099006|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	+r55PXdBXA5yBNKUEJ1/Xs58l4+OSlX1wz0ELVfatvBgUI8BgpCiKPDz5OLjbTQx3YRo96seytpRZHhCeWP2N4QXMqUl7DBd+6YCn8caSazGfPVVpjdrb1uUv+nqdO30B8/daeJ0CSCwYPCndUTY2GjCuco9WJFcySuMdEOwBr2BwXECTG9DHsh6HQ23nNqbUOPQ2GQOhAfKpK59NZ4nRPX8otyUQiLWhO7W8AUZsJtZmpAEb8AAzaUn1oeiW9EzNnxYIzFxMPnR6oy/vwWkjMG0KOLhsejeR39y0m+wAV2qShPP7Cwk7u5s9kKAYs6jKiipyCegW1JHZQbUZ5yyVShLijJJMPuSLIEtQWnIr0SmerLuncC341ZlzDWwwKcnArtkpe/PJ02PDhnhVKln0DzKPYuB4eHxAm14mFz6dpZ0m/WSAOYQkSoUtrwnq7CMU05zSPLxmPMDetfMwy+Wk4FTbP8VY29t6tMVt3+ChORbC7q8MSDENWr+JyUZCaMh2VIrDmxGteNyPmAa6dnmVi93sJMQjyccDyJ/Xu07NosOl0uv0aYZrRwUc6/DZA5qnLHUxH1uUjpjiKG0YRKNwkpkN3manP5MqGEsn+tMeY0xEyvzMCkuDd0zt/fV2K2wOV2JwwjC4aE+xO7p8U+y+mBmvR5pcaU1tzNSZsPYj6jZEYWH0lTbxMaMG+4qmPpM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(7416014)(376014)(366016)(1800799024)(56012099006)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGMvODdhMDVrRTlUM0xvRWoxUmF1VjFSZVltdzRYR01xY1BzQStqbDBtWGtk?=
 =?utf-8?B?NWg3Z0RmNWFReHM2cDhRSHRZOGdiMnQ2Z0ozaDdaVFdHU1o1UHVVVkhaSjRj?=
 =?utf-8?B?eUJrUTNOdkdTSnY2Y0hhVm9nVlVpblZzVERUYWYzcVArcmkxV0paUkNmTUo5?=
 =?utf-8?B?SzdhOUxFRDcxblFieVZ0RkJpa3NURGllRG9xRVNwNjd2d1FMazdRRE9mMmpW?=
 =?utf-8?B?dlpPZGtCNzVNdFZIUlF5QmJ6SkovbjZEKzEzRHFZcE1IcHRZdUNEV3BXZ3l5?=
 =?utf-8?B?QklFVytzem9sdlA5QXU0cGUxbThMK1Q1Lzloc1FZYk1LeDlvTmprdnpmbmhM?=
 =?utf-8?B?aC9Ic3dVeE5LMWVTODFBK0lmVWxENFBIcTR6cVZ0Y1FiNEFWb2pWTE44cmFw?=
 =?utf-8?B?bTBLdTZ5SG9zUDJHeTMrRVQ4Z05iT1loZ3NRQU5yR1VNaURYTFROR3RUcEV6?=
 =?utf-8?B?OUxzNTJqTUJ4R05OVjNON1JMdmptZlJvZTM0WXIveTBKK0ttK1B1NU1RazY5?=
 =?utf-8?B?MjZWa1JyaWRLMXlxUDAxbEJKYWorV3QrWkE0VWQ1RFIvT2Z6NXl1VXNzZE8v?=
 =?utf-8?B?SUExVEhqTUhCdURyMjVPVVVmdUFxNFlaOVQ3UVlKcWFBTnZXS2JaTmFUSnkz?=
 =?utf-8?B?SnRLSzFDWTkxby9tajJxK0RuVW54cytPRGNRUTFBbWN4ekkxd1g4em1CR2lE?=
 =?utf-8?B?T01DSVVZTEpoZGlPQjgxSk5GTndxZXVHdDd4bFllWklKaURtbjhRSDhLSGxL?=
 =?utf-8?B?N0lTRTNyVXB4SEFMTWN1SkoveVgxdHYrazZMWkx1bVVMWXg2SWtxOGhINHFK?=
 =?utf-8?B?RFBkSTA4eTBneXpoVXh5Qkw1NkV5U3pnMUs3U0dkUldiaGhmWitHTWlmQ0lN?=
 =?utf-8?B?Q1FiaFp4a0dXTENzL21RZ0tIQkt1Qmt2anc3emwxOGVqK1A3TmpQMmx1SXdp?=
 =?utf-8?B?RmlIc045blZXeGZZVG14MWd5Z0EzYVhkcmdRa01xak9aZE5YN3A0UFUwYW5a?=
 =?utf-8?B?c09STzlVMmhUaGdTQ2xiRUVjR2Q5YUhQell5SGlQaHdyZW1JLytRWitYOUpw?=
 =?utf-8?B?ZktwK3doc2tUTVM5Wm94eU1LSUNRcFNnNnVsVFFEZXZrampZRjExRG55emw5?=
 =?utf-8?B?S0twMDlRYmhRaVZqSDUrSllDYWpjbkFvVjNQcTNkRUVaempCZG5PSUphZEFt?=
 =?utf-8?B?ZEVjUzEvdTV0SUh3c2djeXNHRFVueE0rZG1aeEpkVnhhVTlXYmJqT0FrZkM5?=
 =?utf-8?B?cmhzdEQwUFNHRE84WFFnWGRPcnpGTFhTKzN4YVlKSjQyYkp4YUlJRFhaUkZD?=
 =?utf-8?B?M08ybUlYRDl3VklYaE9odkUraTJJSmxQMW5XNitJbnhseGZIdTZzbVVhVkU1?=
 =?utf-8?B?aTVwUmNsdHYvV213YytiRVB6dzFNejBwZmNqSGxlS00xTStFdEF6enZvSHI1?=
 =?utf-8?B?b2d2M255c1JKMkFIY3N5dWszTmxmdHNyeStHZEJVa20rQnZBQTU5a3I3Wldw?=
 =?utf-8?B?elY0dWhDeS9VWWUxTHVON2lRRitBUEp1aVZZUzJGMnIyejdqbTNxaHNRNm9v?=
 =?utf-8?B?dG83L2VhTW95K0VXUjExanZZSTZ2blpydVcrUnlyck9YdjJTL2NGdGNveUVK?=
 =?utf-8?B?YnNVVGo4VmpBOUdvVTQxQjJUQ052UitLU2FNM094anZmMFlyWldEQUptNGxO?=
 =?utf-8?B?b1JJdmtONGxRbmNZN3ZZVHlsVHV0STl5eENJNmZQSkcrbmxmQzZzcTJNNTN4?=
 =?utf-8?B?ZnRESkxQVTdjVXBJaWJ5Tkg0SVJST00ycFBGOWxIcU9tWmw0dmdVVCtRTXhl?=
 =?utf-8?B?VC9KVEdEeGZsWU9WWlRyZjFuVjR0MVFIL00rUmZDU2FUVGRlQ3FEV2pBRmJx?=
 =?utf-8?B?cVdaRk9wQ1dCQ2NuS3N3L1FjQWpYaG1FbTA4V2F0dDdtMTljR2ZxWGRyQnlJ?=
 =?utf-8?B?Vm54bnRCbDN2TDFVQ21ZdFJrWFNtcVViZjEySy95TjVxdlFZZlY2WUVpQUR3?=
 =?utf-8?B?Q25RMm5uU0RHQUttZTFHN0ErdjFQUVRPV1RmeEorbHBZTHJJUmJ1Qm9uTXdn?=
 =?utf-8?B?dlJLcmloUkIrTzRPN251c0pDaGJCaUFyR0dlTWlKRExXQkRhTUwydVZpNndq?=
 =?utf-8?B?REtmeXo2NTB1OVlsSUx6ZU80WUozQ2x1N2pYUzc0d05uTlQ3T2s2NzRIZ0hq?=
 =?utf-8?B?VXNDRlhBbVVZb2FGYlBxZ1FtSnRvTkxPTzFCQVQ3S0lOWHJXNEJOZE0xR0Vl?=
 =?utf-8?B?UzhtMFliVzQzWUZtblNQMmNyTnlzSVFlRlB5bzhITENxVFpNVG9iemF6VkdM?=
 =?utf-8?B?WUZsK0hvYy9teGtna1JzTXdiV1NzS0ZXT0U5NVlDMmhQZUh0V0RXWnZGcnhq?=
 =?utf-8?Q?5T+6w7bsCFavTQxgchk+KK0g4vUuevIaOITUF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a3e509-365c-4749-9a54-08dec0cd0668
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 17:33:14.3586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OI/8joaxmpJnlb876Qdh7MLgbYb+dhol1eRlQQOgxTApG93ugHwLyT4WCXorb++rHz9vutauQtUeYMXxmtW4jmfeOi4tmcEQQ9uOU5CHw9A1+mYIyskPR16Xt9QjfXtR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8338

From: Frank Li <Frank.Li@nxp.com>


On Wed, 06 May 2026 15:01:54 +0200, Franz Schnyder wrote:
> This patch series adds support for the Toradex Aquila i.MX95 SoM and its
> currently available carrier boards: the Aquila Development Board and the
> Clover carrier board.
> 
> The module consists of an NXP i.MX95 family SoC, up to 16GB LPDDR5 RAM,
> up to 128GB of storage, a USB 3.2 OTG and USB 2.0 Host, a Gigabit
> Ethernet PHY, a 10 Gigabit Ethernet interface, an I2C EEPROM and
> Temperature Sensor, an RX8130 RTC, one Quad lane CSI interface, one Quad
> lane DSI or CSI interface, one LVDS interface (one or two channels), and
> some optional addons: DisplayPort (through a DSI-DP bridge), TPM 2.0,
> and a WiFi/BT module.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: fsl: add Aquila iMX95
      commit: 4d0c0b7fcf59b1410fdeb18e2837d0c1e9ec14ba
[2/3] arm64: dts: freescale: add Aquila iMX95 support
      commit: 5daa24ec08a8f57a7f41a16cac140a69db813bba
[3/3] arm64: dts: freescale: imx95-aquila: Add Clover carrier board
      commit: 802cee9b535163f66fa635888c2922c760d5d526

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
