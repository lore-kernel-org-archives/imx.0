Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013033.outbound.protection.outlook.com [52.101.83.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D927D3A5E75
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 06:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773297481; cv=fail; b=mUxc4Tih/w5Mdvm4JwBl0rwABZHsRhxRJ6XCleww+9xJasFwG9V+3rJIeBc/Ryn8P2rjc/Qk2OQwVdtDBXAIwg1QHjnGl3sGnXPbxkYuUfNnkimIMVTuTStvTk+fJMXcYyOfefGobsGrr4vtfOwA/Hs9b/BQuRTqnh7ryy3yA7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773297481; c=relaxed/simple;
	bh=S+fHEK8dqtI85VAemhf/IQOo8dO1WuKUc4ZC/+mq/V4=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Jl9lFpLH4NBvzLopkUBtmqWavzr73fZbzB8YlAjf7x+YdJ+Ue3+5xrHlwteD5sQd5BVDw2lGXcM6W/pF7q1ItDv3FG71T71nlWJ6Jmp+gP001DvmMKwaBb4t57/g9xD+6RyTaCeQCt0VmKB+DW89ekMcccKDj7YB7G+408tPm50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WHShETv8; arc=fail smtp.client-ip=52.101.83.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WHShETv8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TzuGB42Bn+C653+SPxUPnjzr+tnDezgvI63LlzpkY17N0JkHALPaYWWExbEsfLpc9wRKnJXhY1gdcOoaIIEpjb2dWXgBthWbz4g1D3Ry1g2uarsTXTsneXZTg4yDamyRQE8n3ITM8RO6XpeqtXMysVWo+xbpejYMxAT6Ps/s1enFPBvVvekVAcMy3WKshFXyu8gNzYUti9Ts0HXHuphLLNJ5VdD/jcuyZyYXIjXcZaCh2C6xxFoy6niTngrXl/+klG7vNvoHwkIKPitXZdR4uSsDG67AGEnE+f2mtJKq3n83a3L9Oid9Pp/XXQcej8cHA22qbalzvrJU7ZsORSasLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TP7FW7AGWZrUTTgKiJEOxRJmY51qdldUMOJ6Rz3bzA=;
 b=p/DAk3s4laC0tVI9F6MImACMLEIEYMkf//Zpv/EmK27aZ+qtsg6BJ3c4DSpLHAJJVbnHfy32GyGaNIDOf/ZVGgYdeB+pONVtOfW1eaLxGOXsTSb1BimpQR/D/mJQeB7DEBfAHOoo8m64XdJe0WwqJI6wy111ZZBuelHyJY6TR4BBoOARIkSAWYa49M7lVZ/G5NAGTmVV7+p0gmysRHza5qmS01mPNIfItsX1yxUJqetuytxDSF1s3r+yYYuglWIm/ixnp93UCQg2xaR1J8a+vVaX6wm1iH/Hc4642EAAFrqqm0RVkTbbaSfZHbo2VLarxngACRCH35q8g1sYjqnH1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1TP7FW7AGWZrUTTgKiJEOxRJmY51qdldUMOJ6Rz3bzA=;
 b=WHShETv8/TlUZOEF7vcEOtdVP8GuTwI99VT5+aj0TDyFBEkroGD1EmlLTViwccPloLLMwbF8OcDuSE9EJAI11R7TtW6MwXj3w+o/Zi7EdSFR3yqvPZVPlmg59Jm+wMXIppiBIK+6RZbIsF723Ckgqd/L9fOg8+2V8uljhJgIh7jxLgIc8Or+/5JJ7juA5LQtlo8JE5W5/HUuBzZcQnJ3DgB4lV9F37QpgUPFVxHex5g5bbg3BLnW/5iBf/rXtw7vjarCBRsqDJhgRFhgM/iPopFrYnUSEyuVpfpL4IYgr72tyBjxxJS5A/el8u091QGnoMIMGrpc37tByGd6qpYhMA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by DU4PR04MB12129.eurprd04.prod.outlook.com (2603:10a6:10:643::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.12; Thu, 12 Mar
 2026 06:37:55 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9700.010; Thu, 12 Mar 2026
 06:37:54 +0000
Message-ID: <af948fb4-4f63-4276-9368-9d41e80c3e7c@oss.nxp.com>
Date: Thu, 12 Mar 2026 08:40:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: imx952: Add audio device nodes
To: Shengjiu Wang <shengjiu.wang@nxp.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260312034912.4007057-1-shengjiu.wang@nxp.com>
 <20260312034912.4007057-2-shengjiu.wang@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260312034912.4007057-2-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4PR09CA0029.eurprd09.prod.outlook.com
 (2603:10a6:20b:5d4::18) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|DU4PR04MB12129:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b0d45cb-0d59-40ff-da5c-08de8001e3c2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|7416014|376014|1800799024|22082099003|56012099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	rC7RNZVqm269KKuD1z/K8viCu0whZG3BaW4LT777SagEpZVhQitcwPd3AY3F4wLCYQ9btMGhybPIVhv8RIWxulNrY7h8lZaZCmho0HDD+1LhdzVpMErLDsOq3XnsQzIOJPdags+Z3+jHv/7ndXEmGhGc4LTyT/IGEoUiD3Xgn0PZzjXBtldy869la2vaH3zOvYtM01u+WfNdke5hfe04PeLoEgBzxdZFz+iJxcJJ5qPROgZT6wYhXN1EmdrY9hyBRaYwgQAXHNsnCM7pSns4PudaMWMfmYphFosJ+mhDjgkEQuyUUYWCCtfkhSJSBFbbhT7JegSo9GyDwVWhNp6Pgp4GZfHSqTDAR7ummZhtCwtnSw91LG54V9yfDEj2YOOPFAEzhrSPkO0cBV3AJz/UontYePxnFBvdfHoJaEpEqJn6umgNrcIvgLiLKhX/H9FWKqJuYuMur7e5bMnilFfSYrO4J990XlJfM1mpDv1Jp0J4R5+F+ch4bVTb/l3R5gL+PW7BfK6bIM+DhG5bT5+JLUuxgIlotdxL+ZMgMKm4S53JjBAKuqNYb+j/5pR3t8TiEXdhGm5QbN9BBg9uAIqmBAuTbaExIk5FFrJtMGL9zFOTVvlhTlBIDPjH3DrSafmMorlrpghEqj28StWaUJkNDGfZ8n5h7uH53CVEYxiWUxCpW/NQmdKv/tQW1qWPvCVT2j+ppFngmbpr/3HLRYvHrZNNaAm5JqcejdtEOKOcwrKCqbdKD9CT+/jfJ/GesREsVxqdyB7j9TFHbNotfI873Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(7416014)(376014)(1800799024)(22082099003)(56012099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUk3YnJ3OTNMeEErR29ya3J1NkFZWWRGSWc1SFBmL3hqdEdVMC8vQms4UVhJ?=
 =?utf-8?B?T3Y5akJmWG9PN29obVBrK1IvMHRuL2puRFhhbTNwRTY0VG15NExDQVJ3K21W?=
 =?utf-8?B?NWN5cXRrT3NVb2YxeVkrQmFtc1hCdmlBbUJOMlJQNjlrWXZGeFJLTzJzak9Y?=
 =?utf-8?B?M3V4REJQL2h6c0ZjaFg5a2hhQjQ3UlN1R1F0dGsxS3R3YXlPZjB1RS9hNTVL?=
 =?utf-8?B?SzJTcnFXL1RseTN0bjdQc2s5d3Z6Q29YbTZUQWdxbGh3MXZwb0tmZnpNMHps?=
 =?utf-8?B?UWZwTGtCVi92a2tBY0tNb3lRTGZEbWI1NTE4VkdrVW0xOHljbnBMeExGMlMx?=
 =?utf-8?B?UU1NY0RMbkc1TFJTRUZlMVk2SUc3Mlk0UkZYS0NxNHRVRTl6aCtCVFNhUHJ1?=
 =?utf-8?B?MGdUaGppREtvSDV2WVRxK0NwSysvbEs1akphZFhpcEozNUF6LzF6NHdxUTU3?=
 =?utf-8?B?YkltVDFXcUVPWVBHSGpFczM3OWZYdEpNSGhIeUs3OTlZRENWQU90MEJ6NzBm?=
 =?utf-8?B?QTY3VDV2VkE5WE1jRVJScEFTeDBEVmp4ajcxSFJXWlFiWmt1a0dGalJoL25E?=
 =?utf-8?B?ZmF5QnVTa210bWI1R3E3MlVIUUd6Q1BydWtOWnpUOXAvNmxNR2RSeWN3c0dh?=
 =?utf-8?B?NTl3c3AxQzA3K3JnaDVGbmtReE1FOGRqa29BME5iemowYXZkUUwwY0ZZeStM?=
 =?utf-8?B?QWxjby9IajVkM0RSeUJiaHE1cVpYN3VNdXE2cFNqUGRtVmJaM0lQbXlidURv?=
 =?utf-8?B?MVZVQ2lRd0tVZlA1K1RiV1ZLUERxVTFObVJXbWdYQURwb2o3cEh0cGJFZ04v?=
 =?utf-8?B?YjNnUGthZ3VkZmpjVERHZlVOdlZnbnM1MkRHNmhHUUtkSzI5SEo0MUZwV05v?=
 =?utf-8?B?cHNmci9pMFVZKzh5V3JZTjVDUWl1dmp4YkJxbGZSakI1dS9QeTQ2MmluSUVS?=
 =?utf-8?B?RCszcW9TNUJzNzV4SlZ0am42blhta0dYTDVueXE5VUtZbCt6RmdqMFd0aVJV?=
 =?utf-8?B?NSt2UjMzaVRBeUQyaXUyQWhHelJ0cDRwZjA2SUhuWGlQTGQ0eUlaWEV1Nlpy?=
 =?utf-8?B?VHF4RERTSmNpSUxhUXpVSzZobUFJTW1IUUlCeUJJRmpTTHBsbGsySlUyM2R0?=
 =?utf-8?B?K0Vva1ZDYjJBWlYvSkt3MXdaY0hVWXhaUDdxSklCZXFUM3JkNkdyMmJEQnlT?=
 =?utf-8?B?WWVJc2dzUVE3YU90YWR2MzZYNWQ4ZGNPU3R5eHROTWM5cVVKK05meUtUbFIv?=
 =?utf-8?B?aUJPbEdIWVdLaFRZdzROMWF4R05YUVZqRkpzL09yYm1xV3NCWkpmTWhobzJW?=
 =?utf-8?B?ajhQUEdaOGZCNUYva1ZNc0l4MWR2OHRmOE9PMi9FUmcwa3hHbnE2cmYyUnNY?=
 =?utf-8?B?OFllQ1lSL3oxU1dFSldEdndRQjBzdnBJdzBETEJkV1JXTHFVT1V5M09VY2FR?=
 =?utf-8?B?RWFWSmtLaVIrV1JSanNJdFMwMy9tbVF3MDBKdStSSCtCU1FCL2NaMjY2YU10?=
 =?utf-8?B?Wm9hUHpXN1c2cGJmaWNBL21MMGppK2txWjZTKzJCcXU3b1d6ZG5aWDhxaks0?=
 =?utf-8?B?VW9ZQU55bCsrUmNGaU5JL01pb25JdUVPbnFOWFdaWmhQSkNHQ3M2eUJ6dTJo?=
 =?utf-8?B?TFBWL01Hem9xUGtzYzVqd29Lb2ZBUzNud1U3OTV2Z0tDMHpxTHVNVWNvTFNl?=
 =?utf-8?B?M1RScGZZTmRCTDBCYVVPS05kaGNXYVpwMHEyM3dQT3NsbVpYTnNPRGtab1ZI?=
 =?utf-8?B?WkZYbFhHRGVBTDhzV2FWWWNHYTR1V0JQR1N2T05nNzQ1Y3diMmcvNWRCYk9a?=
 =?utf-8?B?S0VmWHBQdnU4YmI1bjNZOXpESFJrSkdCTHQvenJ2c3ZyTDMvTlBSUTlobmk4?=
 =?utf-8?B?QzhRWHZ2ZVhGcVQxY0hSRmZENnJMUWIrL1JUbWplQ0NCMWowVitqMUswdHRE?=
 =?utf-8?B?RjJZbE1BZGp3emJOUkxMWnEzVzRqQTRZM3JVSm9SWXh5Nm43amxmYy8rejJR?=
 =?utf-8?B?VVgwQ1pjdm5ySFlUeFdRRDA1WnNkYXp0Y2J6ZHB3N1FXVVRVaEthZ1pvOFh2?=
 =?utf-8?B?eW9mKzRibzdnLysxTDRTSVpVL3VxWFRERjBUT2NnV0hidm9kNmVzUUF5T2gw?=
 =?utf-8?B?NEprMHpFeGwyY1o2bHdsS01FbkxtK2dhaFJUVHpMMjVKK1pPVnBTVmlScUVJ?=
 =?utf-8?B?VGltWVJEM2tubzJFZVBlcTJLWnpXNHhBdTQ0TmNpcXhtUzJXeFNuNm9vUDhV?=
 =?utf-8?B?RnBOZkhZdlpFU3JPQmdvRHJKc1pieENHdTJUUG85L3dxL05iem5rM0NsdUUx?=
 =?utf-8?B?czd1MGVIREZTT1NacGttdDZRWkVNRmY5YThaNmRnZW4xNHRLWUI3dz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b0d45cb-0d59-40ff-da5c-08de8001e3c2
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 06:37:54.0616
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VKldCBU3xbqtn+Q7VZ+sy9IaDDm+hk9tjWFUpR4CYgs6IDw/pp/Ij3vdegBjdtyaBy0rMQ7lrQxXruQNFzSPxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12129

On 3/12/26 05:49, Shengjiu Wang wrote:
> Add audio device nodes, include SAI, MICFIL, ASRC, Audio Mixer.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx952.dtsi | 199 ++++++++++++++++++++++
>  1 file changed, 199 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/boot/dts/freescale/imx952.dtsi
> index 0f86b5626cdd..5787c12e788f 100644
> --- a/arch/arm64/boot/dts/freescale/imx952.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
> @@ -823,6 +823,156 @@ usdhc3: mmc@42c40000 {
>  			};
>  		};
>  
> +		aips5: bus@43000000 {
> +			compatible = "fsl,aips-bus", "simple-bus";
> +			reg = <0 0x43000000 0 0x800000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0x43000000 0x0 0x43000000 0x800000>;
> +
> +			asrc1: asrc@43000000 {
> +				compatible = "fsl,imx952-asrc";
> +				reg = <0x43000000 0x10000>;
> +				interrupts = <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>,
> +					 <&scmi_clk IMX952_CLK_BUSWAKEUP>,
> +					 <&scmi_clk IMX952_CLK_ASRC1>,
> +					 <&scmi_clk IMX952_CLK_ASRC2>,
> +					 <&clk_dummy>,
> +					 <&clk_dummy>,
> +					 <&clk_dummy>,
> +					 <&clk_dummy>,
> +					 <&clk_dummy>,
> +					 <&clk_dummy>,
> +					 <&clk_dummy>,
> +					 <&clk_dummy>,
> +					 <&clk_dummy>,
> +					 <&clk_dummy>,
> +					 <&clk_dummy>,
> +					 <&clk_dummy>,
> +					 <&clk_dummy>,
> +					 <&clk_dummy>,
> +					 <&clk_dummy>;
> +				clock-names = "mem", "ipg",
> +					      "asrck_0", "asrck_1", "asrck_2", "asrck_3",
> +					      "asrck_4", "asrck_5", "asrck_6", "asrck_7",
> +					      "asrck_8", "asrck_9", "asrck_a", "asrck_b",
> +					      "asrck_c", "asrck_d", "asrck_e", "asrck_f",
> +					      "spba";
> +				dmas = <&edma2 97 0 0>, <&edma2 98 0 0>, <&edma2 99 0 0>,
> +				       <&edma2 100 0 1>, <&edma2 101 0 1>, <&edma2 102 0 1>;

For consistency we should use symbolic macros for directions like you did below.
Use FSL_EDMA_RX for rx direction and also introduce FSL_EDMA_TX for tx direction.


> +				dma-names = "rxa", "rxb", "rxc",
> +					    "txa", "txb", "txc";
> +				#sound-dai-cells = <0>;
> +				fsl,asrc-rate  = <8000>;
> +				fsl,asrc-width = <16>;
> +				status = "disabled";
> +			};


[...]

> +			sai3: sai@433e0000 {
> +				compatible = "fsl,imx952-sai", "fsl,imx95-sai";
> +				reg = <0x433e0000 0x10000>;
> +				interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&scmi_clk IMX952_CLK_BUSWAKEUP>, <&clk_dummy>,
> +					 <&scmi_clk IMX952_CLK_SAI3>, <&clk_dummy>,
> +					 <&clk_dummy>;
> +				clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3";
> +				dmas = <&edma2 61 0 FSL_EDMA_RX>, <&edma2 60 0 0>;
As I said we should introduce FSL_EDMA_TX and this will read as:

dmas = <&edma2 61 0 FSL_EDMA_RX>, <&edma2 60 0 FSL_EDMA_TX>;

Otherwise, looks good to me.



