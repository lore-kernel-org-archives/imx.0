Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013037.outbound.protection.outlook.com [52.101.83.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E341E9B12
	for <imx@lists.linux.dev>; Fri, 20 Mar 2026 13:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774011665; cv=fail; b=iA1kvooXBPpQWKTDSSRs/SpB2pHzmFcXJ3Pbilq8n/qTecqoQiEo4p8L66tl4LULFKrGt8IXObl1M4CUMXAnfVmt1LgUeofdVqizi68SNmKWyYY5//ffv+8llw7raWQ+jXdQaHyZZs7A2mR+UoEi8DqxhKCv9nwbKflHZOhXnYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774011665; c=relaxed/simple;
	bh=nFMrVzK6qn1ekUBu8ZjzvKygbt6ry/sEoGTuwQydAVY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=nYvCuU8JOOvhMz3ceiqev//TQhwmn61xs+xDsc6bomafT3aeilNm++n4E5bJzOIOg7zePzxwOgbyLD6uaRFfjm6aFVWDAa68pnPQ1duVqWoKKwXlg1CNkdwBARGqhdq4/zCPSKrAkpxZPZ/Zbnv/66tN68WgWez8bXEJzZ+zbuU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NwTPJR9T; arc=fail smtp.client-ip=52.101.83.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NwTPJR9T"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENecOAbrTsM4i+FssvbHuyJRpfFBygcSx3yBfZqqA3SF/jmw5IwqvPIpMClxx8ZYA3fHHaNRId1nwh2yDw6j10i34fjhHpmL3qy2IYldKr+03LHie1dejAoNoD2lc7UFMJ9FdfLiXkf/6gxZNiUfdnarU2kpKiwZRIbbF9Iu7Wu6EVH7N7h6EG05GKdLJGuwImsVAw+0qXgFubxi9muQ7Ybt+un9W3gieB5a4xqkX6DXOYZEs/iDpFM9xZybkg28y3uUIE8YeR1F6PjuFrcSzb5WQrNI9Y4ZHHfrWnSIl3U8yBTLF9MFTVtH1ygr8C2wNO+iyIA+viDLXicxppOSWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UoNC4CJsza5ptXCJjp7O5Yszr79DtrZNdCoKdxMOt4I=;
 b=MkLOjnkN+4rfdfV18tUo/MhlphN/Mj4FM4hCMpJZWtHu2L6HtjpNN1tDGc7s4K/zkjgsKiYCxQCO188I16xc0JE6nE0ncgKZmOYUd6KUP4X2FE+dzXL+FDxD59+i51p6fqtyFA+AgGskbvHMuhZTJpF8l7ZKVpdBHxP9fINmvSjP5NlbXfGjbBFCGxnihbv79Ofh5ASUsDHdgDbPUgNrSpkBrGV4p692STlW5YxS9dsYFTdCgT1JXy5t8OWAvRZg9WuZyv9K0hKwWyDX7KtbIRtqTLxXdIL5NwJ5f44ZeDt1cvMXb44kR+DD0CJ3z3o8QNowsNaciWdxO/VTY4LunA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UoNC4CJsza5ptXCJjp7O5Yszr79DtrZNdCoKdxMOt4I=;
 b=NwTPJR9Txst8FYarRTeMHVf+6gDwJcjiIu5QyJrXWwUI0yQ/lkj+8q4C4yg9XfKTEPw7lqj6gmlHrcwBI7vlLsPGx7Mx54RbBLeZZj46DXKUE1/9g4xi1xUkq/AR2woZ+fm2x30fnHphc/zAWMINN7VotLaDJt5qVCZHB97j3CJ4CT9JZSVgJKRh39EkWiCORDeDayidKJ6j2FNsMNi2Xelh854MsO5xm58oyohNAZX8p4rWUOUC7ClIAsb4iW9/ojukN1fhwOmEYk6bZOhK2UhvC9qOajCBSJoatY/IKci9jqG4EusdihDxhzdVUj1Jnhd8Fg0DKw0cwlw3Jh776A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by DB9PR04MB8330.eurprd04.prod.outlook.com (2603:10a6:10:241::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Fri, 20 Mar
 2026 13:00:51 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9723.018; Fri, 20 Mar 2026
 13:00:56 +0000
Message-ID: <56679eb6-98eb-4a1c-9179-2bd617877fca@oss.nxp.com>
Date: Fri, 20 Mar 2026 15:03:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] arm64: dts: imx94: Add SCMI sensor/lmm/cpu nodes
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>
References: <20260320-imx943-dts-v1-v2-0-e6eba6b3a837@nxp.com>
 <20260320-imx943-dts-v1-v2-3-e6eba6b3a837@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260320-imx943-dts-v1-v2-3-e6eba6b3a837@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0227.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::8) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|DB9PR04MB8330:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b10da04-57a6-4ade-3c0f-08de8680b9b0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|19092799006|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	xw0SOepYxsT+rJCheUHhO09dos3QZmxVx04jWoPxDR05NL919ndjD8Wc5ltgzAdnKCom8CL4JaU9GT6kfIxbC5X3Tf+9N60OqdqOI2lD98vcDAzf00o7AswswAsZdtzpLfM67syi84C7mH9r5/dDWoPRsh+tiQtEunAgLIMnbS9tkQQ6fISIBy/Rgh5PndYvoVcZhILIEy7ezWRettIhRKpLnog7SRohUTurOwV6VEbowKIEKYta2xOL/JOqiSUWecTYn9/+5rWPHEIWGxEXusQpM/X730wVfvtaUYQxDBNjBbH+DSI0OwG8EnRxSrdU3aFXrD6OUm+Oj2OYCBIB9jPXOGMuSBZmVqeYE99Pu8i17ETN4547ZfrdWV9Is+tlZr6B2mJWyH9sUW/9m0iZ2mjq+4HcbxJKQJRWUfkG1vUBJz3+OWW+ZLTIAX8rMvRIkt5pnePlOPS0XqkyQSr7vs4sP842GXkq8NalklnZs1yNVUNGqROwGwDNLzroRPopxhEb6Np3MiFkH9YmGvduehmE5in6RomEHQw8aIP9izmlgJMlAD/Mp9IRDeBZPA0MBKTOYnxZOtTshGDyzu2WHFw78P8zj3J7/MAlXXL7kgN7ZhhdBJhKdwOP5rt65Xut2FRF56ScEWiv8dxF4dJh2NNNae8V+se+wcYjVOmi4UJHb8tO3cefi8jEW1wiuenOLjKMmIzZP/sLAEgY7pPPmOMppyBOJqAXHkhN2I5KyU4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(19092799006)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?em1FS3V4VUFlSGFLYVgrenQ3cVBMVE5adGFESWI5Y0dQS0pZRVE1cnROU3l5?=
 =?utf-8?B?Y1dLNksxSHBsUHlqbkJnZThxaklWMThKRnhDT2QrVjJzdzI5RVpyTldQR3ln?=
 =?utf-8?B?WEdwOEszM1RYNUdtL0JFQ21iaUs1dnJ5a3VGblUrVjZtZ1BzZ0VKRllBd1R2?=
 =?utf-8?B?dHJWOGFNT05PNmJTc0h5U3VwL1o0NW9Na0pEUFVkeUIzS2YybTZpT3lwaFRR?=
 =?utf-8?B?MFEzK3laaElJNzNldG1tMCtmTWE2d09DOUZWazUwdEJTbFg2cjN3WklhdDND?=
 =?utf-8?B?RGdBRXZZVFMvckE0aWh1TDNsNGlkN2Zqam8yS3FjaGlhaDFrcmNZMUcweWxv?=
 =?utf-8?B?dDU2QTArRnc3blk5Yy9BbTdoOTFBK0E5dGNQQklVQzVmT0VxL1lISTNMWXNh?=
 =?utf-8?B?Si9PNlI5cWRYQzVlclRzYmN1dHg2ZVd5aGs4bk9nVUlGajhBRWRqcGZONGFN?=
 =?utf-8?B?QVpjRGhTak1XRlBidmtpNnMyeURDa0pRUjdpTzZRZG9yNFdLMGJrQmJTR3py?=
 =?utf-8?B?RytSOUQyTWNaVWFoTGo1N1JGRHk5eklhblM2K2pvb1JlQjA3SmxPQjczS3dL?=
 =?utf-8?B?L1hydXczRTFPQUFVZEszZC9aaW5Kd0NSNVVNMy9lb3VNQ1dqb1k1eVdLY1F0?=
 =?utf-8?B?dC8vZ1MzdkxudGpDZ3U4NERYclRyaFZHNHJmajZTN3BvdzlvaThmcjNvdGlC?=
 =?utf-8?B?TituUW4xWWZ0VTVWL09EeUZFbFJPR1gzOWRXdDVmcUxQRkNVZHo0dEIyeTQz?=
 =?utf-8?B?SU9FdUtWd1l2djYvWjhIY3R0YU1jSTN1cUtzQnk4Q0FHVXd0c3JMd29VYzBl?=
 =?utf-8?B?Z0Rua0N2WWc0ZHBDSVh3UDZwNis0RmJCVWtxSGZFeDF6VzEwd0lKMFk1SzRx?=
 =?utf-8?B?UVdWdmFKclJwQ3pNWkhaM0lyUDdsT1F5UzJRaXp4VkV3OVJQQmF2eVdWMldU?=
 =?utf-8?B?czV2QW10VHcrbVp0TldxUCtIRlFXYklMWGRKY0xkTDVha3RmeGhBTzR2TzRp?=
 =?utf-8?B?NGNlTVJRNGp4OGFsdW5lTjUrdk85VE9DcVY2dUZyY0xtTm4xb3MyQmZsak1T?=
 =?utf-8?B?alg5NWlEMU45L2I2aGQxRmN0ZjI0ZXJjSUVYcW43QWRXTkRQWmJMUFBaR3Yv?=
 =?utf-8?B?WDVQWVNlUmhUTFI0ZTFtekZCQkU4cG00ZFRmNmozUkU3VWdsWGxWK2YyOHMx?=
 =?utf-8?B?QkNlUk9tUHF5aytrcEgrdWp5Wkx1YnpUTjBKY3FBVXhWclN2d0NZcXpXS0xW?=
 =?utf-8?B?dENaQ1hLQmtLWHhhK3lHR21lVkRLWkl4dXJLeDRIbXdnRW0vbkF4UTVBd1Qr?=
 =?utf-8?B?VFdGZWxJRkZad0Rha0IzV1pIYkNneHVuM1FyZWpzMVpDRFU4VUtjbTFWcll5?=
 =?utf-8?B?NkExR3loTVpLaW9EcWFpUVJIcTlJbWxsYnlSOUxQVkI4NkVqMjF5UWV0Y1oy?=
 =?utf-8?B?K1VPOGJtOHpMc05JNkdTQmduWU5qVlBqa2RJM1BjVEZXTjFyZmxwNmFQTUFF?=
 =?utf-8?B?ZEV3eEZnSzNhcXAwUDg5Q1lVNjQxUi9kWFFtR3AzakwvaG1TK0FETE93NnFQ?=
 =?utf-8?B?OWxNTXlNWlVPRlBZR1RidnNIc2lhQnA3UDJFUGY0aUN1S216c1JObU5wb2pC?=
 =?utf-8?B?eVZFRDZlMGZRMnp2Z1BOV29mZXViTjRVWkgrZjR5V3JBRXhEYnhYSXJpWXRl?=
 =?utf-8?B?VVowTWFCR3A4MnZSa0Z4dmhTbUsxVUpvTGVwd1lFa1lnd3dyZ0d0UUlyZzB2?=
 =?utf-8?B?bHFqM1pMSGp6cFg3V2VrLzFwc056YzdoeFhLb0hHZi95eldGTE5seE81em02?=
 =?utf-8?B?SWFYZldMbVFHZTJFWjRvbWwxNEVPZzBTTmtWZzhiVUtGRTdYSXFrZmI3NW9D?=
 =?utf-8?B?MFJZSWFDSGhuSGVUdDQybm1ITW5LQVNobjZidlBnMW9Rb3FYdkdNNW5rb3o3?=
 =?utf-8?B?aUdKb20xUFA0TDFaa21jU2EwZ2R0UlRzNlJjRTJFaVhpR24vWW1aTjYwek5T?=
 =?utf-8?B?VFd6R0VCa0JacEROZEV1NXhPM3o3VDdXZGYrTlZBUVJlUXArUGsvTERXcG9a?=
 =?utf-8?B?YUhQZ3hNdnB3bjdseHlnM3hPd0s4UWdaaHM5cVNFYzY0TEE2SmltelFVWnRS?=
 =?utf-8?B?dTF5cFJpR1k3emZwbFlyUzh0K2xSZUU5RXpxRVYxcVdHNGhXUk9UeWxwRGQ5?=
 =?utf-8?B?RCthZzlWR01yOTJqVjlINGk5cTR1UDlqanhwTFAzZFpuaEJxWXptMzBoV09l?=
 =?utf-8?B?aDVnVjMyRUE1MStGNzhlci90KzZMNW14Z3Q1QUgrSnhHVkg5WGdaQnZCajJS?=
 =?utf-8?B?YXQ5SlhCdXJSODE1L21sQmVjdzExNm5yM2czTUU4VHQxcGoyZUtiQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b10da04-57a6-4ade-3c0f-08de8680b9b0
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 13:00:56.4177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HjK2CsY8DBsyvskPD9w6J5y9GX78RJvcwebFUJxZvQ4CkLUi0SPK0OZ/M/vreJ+M7o6mXbU0iNQKwti2Gz/P+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8330

On 3/20/26 14:27, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Add SCMI sensor/lmm/cpu nodes to allow Linux use thermal, i.MX System
> Manager Logical Machine API and CPU API
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx94.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx94.dtsi b/arch/arm64/boot/dts/freescale/imx94.dtsi
> index 69ede676fc04ede23faceb8f24cf740697e40d7e..117cf2bcada44aeabd82af064f19d2377e96402c 100644
> --- a/arch/arm64/boot/dts/freescale/imx94.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx94.dtsi
> @@ -94,14 +94,27 @@ scmi_clk: protocol@14 {
>  				#clock-cells = <1>;
>  			};
>  
> +			scmi_sensor: protocol@15 {
> +				reg = <0x15>;
> +				#thermal-sensor-cells = <1>;
> +			};
> +
>  			scmi_iomuxc: protocol@19 {
>  				reg = <0x19>;
>  			};
>  
> +			smic_lmm: protocol@80 {
> +				reg = <0x80>;
> +			};


s/smic/smci?

> +
>  			scmi_bbm: protocol@81 {
>  				reg = <0x81>;
>  			};
>  
> +			smic_cpu: protocol@82 {
> +				reg = <0x82>;
> +			};
> +
>  			scmi_misc: protocol@84 {
>  				reg = <0x84>;
>  			};
>

