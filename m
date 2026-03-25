Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011031.outbound.protection.outlook.com [52.101.70.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3797D29827E
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 03:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774409019; cv=fail; b=KUGD+znpAemqj5khX0MjksRTRC8A9IrpVg5TgNH3QcEucYSrius8XV2BafkIDdDscfvfhGVPRFmGvBk9oGkOfmyTsfDYoxQKBkEeOw/F/7ev9NhxVGsoWvJ25BPzySThkYm+sOHxZLNuUKilxX5ktf3u1bx8vRBNXeSgIvYlIH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774409019; c=relaxed/simple;
	bh=eGmXcKdq9vCSnj4pn1m14M4BCIB/66cl1+8i1sCCky8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=seNtgPIL+dLXYd8ArtXMZHdOOx9/XRVlEYRqEdr59JvLYWslLcbAVUXGStM+VT+UjA99renM/hA+IDdd6gamiGIkuPled2Jq+mn/NyxyAbHhOW1eKrTZrwJbihqD0nt0fGHmEwn8GNU8M++hi6dXqNbUmruk9MBz226VPfqCEaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EfdKTEeS; arc=fail smtp.client-ip=52.101.70.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EfdKTEeS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+7/bo2Z1BSMOKEcZdUM2N6lbjH7RADmxt/WVn8TgQcMb9yaQSCLpdviUr6wg9izWaIt7lG8mptOK3KBNwOACYNyWYsPBT5C3gpzxVRBSeCVtxj0j7YnjV02bTz42V+WU1AnA2wr0d/ZHA3QIpNm2NpY3CM2j85IvEONi81d9P7YVoQw7JYevT5jAruW6hzNS1/xqhFbBIco/udNjrV+mLdXcksU/KqvbPKnZZdMJd1ywBAJksliEc5W+kaEzFkOjGXH3SUrDyHI3DFOhH/FmGBcr4Oqu1QwKJIHZNcfaft2NozMYp2alVPPU1Gp6ubptBscmRqutFAhoMMm3S+m9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lPyCS2V8M7S9x8CPORvrG2blU3HjQhpxaa2uP8UWuKw=;
 b=zJFHosPZoYN6/UfFZX3SemKdwRLG9T+Dbt/YUz9NrTc05hZIOL+HamdLgB65GzsFVJXX1g6D/qKX9E0zle7Nob6fQCqDsfvBTxRyFuNZ+iQk197Xggh7FXRuz5OrAJo5O4ft33S2KZjuHZGxzPrlt9+jCA7ptCKAsY6p35XCt6NCiSS39yuBWc6+3hE+E6wGBDtUz9UCWAL6d8sRZ1bLKW/zhe3YMJxz/69MsMdX4H8uv+c5XhSqz55ZQh/2EQV4FwKZXBs85fLOVpTnTrjKDc2ATMoZRLqeAMVMXU5GCmKuBZf9+mMtQdt4O4QJ8QN1WNNg6bECMS6N9OH/LEGbiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lPyCS2V8M7S9x8CPORvrG2blU3HjQhpxaa2uP8UWuKw=;
 b=EfdKTEeSVoaPJa7rw6HCsWl34Xwvxx9NtjMu6M8VlI7DBaxfDksOIdC0XvP70Du3GH0xyW9PNEyOpjMRlZzaNRRs65EvwmHINhmdOKvXOte4nop35qU+KaNb6WpfNZXhfMju44imoR6Fdx0yesJdYWEpuMVbmKkdNvNHlc30GtdpkwTTJGj9PBwYQddNRWnxyAaBegfanSiXqW3mW0l9WGhOMil1C2k7R3lV/cXEbVyL9klzs+UjfPsqJsalN6187cqig8t+9JfhnpSUTsaubwP+rvkzTuFnHTy/SUJ/55wuulOb5E/nMsCR3olw/kQ63/mCMZFdRFOG2wksyd56ZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB10544.eurprd04.prod.outlook.com (2603:10a6:800:26c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 03:23:35 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%3]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 03:23:34 +0000
Message-ID: <d347ed87-f3b5-416c-bff8-f5da1b0567f7@nxp.com>
Date: Wed, 25 Mar 2026 11:24:49 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: imx8mp-evk: Specify ADV7535 register
 addresses
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260324-imx8mp-evk-adv7535-cec-reg-addr-v1-1-52dbdd63d5a4@nxp.com>
 <acKi8-prXpnl1Js9@lizhi-Precision-Tower-5810>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <acKi8-prXpnl1Js9@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0247.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB10544:EE_
X-MS-Office365-Filtering-Correlation-Id: e832ba0d-56a5-4b2b-2127-08de8a1de5be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|19092799006|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/NabkM8nQxuHoHEItZvn0NXzCPrbMrwNlaNTdsqos/f/cKcFmXkzTyY309VL43S3QiUgek22MMzHgPd/KcdThHDzFWH7Uz5nJn8BoM0rZ/SmwE1okOSs/+gxW8/9G+vxO6DcQSedvoEq6wJVL/VWHQ+La8k1xl6CKegrggYQqho4bQIERc7YziKwAsnK0vDk02NqwN9ysMJrmiI/CyjPP6s/SBylsr6yUIJO8jqDvrL6dLRzZi/79Te2PciEErC8qNeXj/eGvxtSXVokxu4CJ4UTsJPZ0cZftZsgN8n4iO+x7P2WyabDeam/+PnaGk2BDes+6H+mfXlq763/442UrTJJ3uQiXxdK34rEjVUBsx0Fokfx0ZKVxZzZ0PycyqEEkBu/Nk2mwB6DB4nb84/LyY+345tuL5Ku0BGxpDoyFPTXen1ceVGB82nSGvgJTOvlq5RT1SDSVmN7mc+z3HI4j0m/ippr3Y3whD9dTjhBhLD7mdX6uwwY2+LrPchgk02JBaRhvtFTPVomUQYtZhJ9ueCEAv+j+SeYG0rO09AG09AWBuunpcOaHExQ69WQxUdBj+31Riv1PIW1dM0SBmIuNt4YGMry+aJSiGN32Zg48hADcpceTy0PUT+EgWQmJqF/zJijpksxlW9wA8kjfJI/LtGJ5zkXznY/9TB+30SK1Ja1AeIuW0e3urVgxdkfNJLM4v8rH5qqymHU0WALMYfwZF3rw6eSQDwe2TaJoPjGAh4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(19092799006)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFpXcGJFbElMdVEwYmNHSDBoMXE0S2RzcTdqeW05RGd2U1o1bDZ1Z1ArUU53?=
 =?utf-8?B?ZmxLVDZMWEQycDk0NmtodE5mRDRqa3FUQ3NFa2NuZ1g4LzlCR3FpTmQ5RHln?=
 =?utf-8?B?OXZHbFIxMm5Sc3dnRE5keXlqbnVIQTU5OXdibVRoeTBYQkJ1NEwyWHNHSGt6?=
 =?utf-8?B?ZDlCWTUzRndMR0VjRzNORHZhU1diT1crTGtsZmpuZnJ6VXJDcUVENU5oV3dJ?=
 =?utf-8?B?ZXAveFcxWTlhTG5uakNrNUVXVmdOckRWMW0yYkRYRndhbFp3UVNpOEtQYm8x?=
 =?utf-8?B?aWREY2lXZ2lpZ1hWMzYwaWhoajFUVExuMTJQcTJRbndzTTNOZnlzaDRWdi9P?=
 =?utf-8?B?VmhxazhFT0tLaE03Mk9LSHJrcjJXalVQTktMRk4yU3NLOGcxWmhrWFc3aWw5?=
 =?utf-8?B?eW1kQXpHdEJ3U3h1MjVYdE92ZWRBcVpJclpVdFB5OVh2L0wzMzMyTUwxYVYr?=
 =?utf-8?B?emVqUWg2RTVJNmR3aWc3WjBGbmpOV0YyVTlUcjlLTVcxMk9BWmcrTCtLUUlB?=
 =?utf-8?B?TEZEWi9IV053VVdFK0YzS1E1YVovQ0RmUmppK0tYNHBxNEVCVzlGbG5PMm90?=
 =?utf-8?B?REhZelBpMVZIaUhmdnpMd2ZLVThLZiszZUNkcEwwaHNtWXZSYUYzOWR5bkZy?=
 =?utf-8?B?ZUwyMTFBNnZGZ2tNcUtwcHE2NFZGalZ6K09VcSs1MkRyY2s1RjJSa1ZMcndn?=
 =?utf-8?B?c3ZGVUlZL1ZVNVFUVDhOOXkxOTMvWlQwbllJa0I3aWJNQTM4aTB0b2orUlpF?=
 =?utf-8?B?TEJNU0NFWmJDcWhsUjl1anVaZDQrRDdXWGFERHRtdE9hMTBoL2RFTFBoVTdJ?=
 =?utf-8?B?SjE2VTZOUFc5WStZbTdyb09JYVREczU0eXVTNUk4eGR3djFVWVAvY1NqeHNK?=
 =?utf-8?B?YVFBcWk1dGtJMlRCYXNTUSsyUllHNzBGU251WktXMnVxVEFzRy9ndEYwUC9s?=
 =?utf-8?B?eGh3bTQ0WE5tZzRyOXBkUzljbkxpNzI4WDI3VE1qbTFlNUp4akUvUXByakF6?=
 =?utf-8?B?T0JsbFdyY3psWDc1Rm1YTVZMYng0MWloaXNwaGdoL0Q3V0ZhNXlnTzlmU3hq?=
 =?utf-8?B?b25qL2JxZXAyQmE4ampvMlFkVEZUN1JEaHAySmd0ekVFVXRBV3hVdjEzMFlH?=
 =?utf-8?B?RGV5UlQrZWRWdU0vMHdJZ2tCaHJ0WXJLeHhBNmpHTHppemEzOTRCM0dEeW40?=
 =?utf-8?B?Qys3WEt3c2NOYS95cmQ0YVI2U0ZmWTNQMEVaTGExQlBCcXdqTWRkTmVFWEJU?=
 =?utf-8?B?VkVFS2V6RTlOS09BY1hIWjhLODhYcmlmSGlkUjZDVzhscWhFbU9iOE93bkpp?=
 =?utf-8?B?QVRHbWZYbkhLSkovWVFTcWdQQmdyKy8rcGEyWHd0N014b1VlY0RXdXRmVmxR?=
 =?utf-8?B?emJNZTA0MmN0SGhNSGJNOGRMRWk5Mzc0Y0w4dXpjenNFNm5rNHF1VWhJby9y?=
 =?utf-8?B?MDhDdVNsRFlSSnRDZnZtNzh6RDJWZUpmVTVxTVNBcjl1VDFrK3NhdE9OcnV2?=
 =?utf-8?B?SVFnN1U1OTU5RjdqMjIvbkpvdmtDRzZETFcwWG1tMzhHY1U0bitHVHkxenZt?=
 =?utf-8?B?L0pJd3pyR25hRXRlNytITVQrQXJvbGM2MWxMS2hJZlNUdk9NK0NCTjhDbmoy?=
 =?utf-8?B?SzdHc25JVzg3SWJXSSs1d21RY3lpN1BhUFRHNEkvb0NLTUhCbDRTMlNGS04z?=
 =?utf-8?B?UDY5OUFZS1UzRmlpWFNtMTB4SkRFYXF2N1I4d1dmNWtWYzdvUk1pUlFCMFZZ?=
 =?utf-8?B?NXJwaThNU3NZWGxGVTFPWTRyYlJPQmJJZG1jeEtJMWsyTExSZUhpTFdwVFJn?=
 =?utf-8?B?Mi90dkpNK3BLdzJySFljakVGempma3BIS3lrb1kwNy91eGl6cUZvWjJDcGdR?=
 =?utf-8?B?MnRrMkwxZkxFMzZTbUZkQjJ1R0ZyNVdWZk5KVmxKQkU2eUZTc2JWY25uQ1F0?=
 =?utf-8?B?aGZZZUh0eE9DeVR1cERaQzRYdVhUYnVwM3FoOWZGY0s5VXUxSEFqakQ0aitk?=
 =?utf-8?B?WWtJUWlJUmZJOWVKdWtvaS9XditncXBiY2JPdHdYMzJXRThKSVVJcWdKV01H?=
 =?utf-8?B?bGhRbFVtc1JKUkU3UzdHUnU4dkVhcnVsaVpKcVJqbFdhVUQ1RTFUc1FQZGJX?=
 =?utf-8?B?amIyQmhZQk00SWlsUWJrNVZRZlIvNjMrZDhZQ2MwOW9YVWZvNXVSTnJ6RlZV?=
 =?utf-8?B?aGRBcGc2TDVtK3BBOEV3blJwbTdCdkdrZlBtWGVxelpYbzNlcCtPK2ZWRC9T?=
 =?utf-8?B?emVKUVBycWxva3d5SmZkQUI3NVNaeWpDdHdyakp6SFh1dElqd052K1lwQmpr?=
 =?utf-8?B?Q0QyTElrRE9WT3VCSFdNZlFIK2VnbGdrbWRFenRNLzVhVHFEd0VrUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e832ba0d-56a5-4b2b-2127-08de8a1de5be
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 03:23:34.7839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zSj2LzUrHkcaAU8RX6OpqVkS9y9CYln+BLJRbLAkeRpNErI8P4+KjHRdhdsGyWUBGJcHONRUUUMvfPFuie7Z6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10544

Hi Frank,

On Tue, Mar 24, 2026 at 10:42:59AM -0400, Frank Li wrote:
> On Tue, Mar 24, 2026 at 01:52:03PM +0800, Liu Ying wrote:
>> MIPI DSI to HDMI bridge ADV7535 CEC default register address is 0x3c
>> on an I2C bus.  And, OV5640 camera uses the same address on the same
>> I2C bus.  To resolve this conflict, use 0x3b as ADV7535 CEC register
>> address by specifying all ADV7535 register addresses.
> 
> Does cec start address programmable?  generally i2c address is fixed or
> controller by some gpio.

Yes, it's programmable.  Quote adi,adv7533.yaml:

  reg:
    description: |
      I2C slave addresses.

      The ADV7533/35 internal registers are split into four pages
      exposed through different I2C addresses, creating four register
      maps. Each map has it own I2C address and acts as a standard slave
      device on the I2C bus. The main address is mandatory, others are
      optional and revert to defaults if not specified.
    minItems: 1
    maxItems: 4

  reg-names:
    description:
      Names of maps with programmable addresses. It can contain any map
      needing a non-default address.
    minItems: 1
    items:
      - const: main
      - const: edid
      - const: cec
      - const: packet

> 
> Frank
>>
>> Fixes: 6f6c18cba16f ("arm64: dts: imx8mp-evk: add camera ov5640 and related nodes")
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
>> index aedc09937716..d0a2bd975a18 100644
>> --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
>> +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
>> @@ -602,7 +602,8 @@ ov5640_mipi_0_ep: endpoint {
>>
>>  	hdmi@3d {
>>  		compatible = "adi,adv7535";
>> -		reg = <0x3d>;
>> +		reg = <0x3d>, <0x3f>, <0x3b>, <0x38>;
>> +		reg-names = "main", "edid", "cec", "packet";
>>  		interrupt-parent = <&gpio1>;
>>  		interrupts = <9 IRQ_TYPE_EDGE_FALLING>;
>>  		adi,dsi-lanes = <4>;
>>
>> ---
>> base-commit: 09c0f7f1bcdbc3c37a5a760cbec76bf18f278406
>> change-id: 20260324-imx8mp-evk-adv7535-cec-reg-addr-2de67760133a
>>
>> Best regards,
>> --
>> Liu Ying <victor.liu@nxp.com>
>>

-- 
Regards,
Liu Ying
