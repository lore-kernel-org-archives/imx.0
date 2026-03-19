Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011044.outbound.protection.outlook.com [40.107.130.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909683AC0EA
	for <imx@lists.linux.dev>; Thu, 19 Mar 2026 09:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910803; cv=fail; b=WcOPooHKQ0WenpUHaxFS2WbHWXMhyMCj4YzdGMv1Oz9KP9fSCK4y8WR0Wdpq4YToR3s3sgdhQbGugoXkBlkfRVpOI0tssxoH2LRNGCU3/LnmmGj5Jw7qZ8T8Hyp0vaxoNGjW2seDowvRJss6DtPznz4dZlItG/jNCloC9iXoWWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910803; c=relaxed/simple;
	bh=QgsrcosfOW8qXiZEpcPRZuoxQI1YR1/X1lR3K3WVeqE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pyjBFGW9N3B4f09QWUd3DtEP5mqvUU+pTTS1BM+B7nkkINIZD4JiINaXixGNllTrhsSPK4xY89EyKWBtkkebv7MiQQSWSQccn1jr+GYc3HHLKuJgK/pWHDE/Mn5SFAWAttp9KvQrsomgMs7xKuhddRV/2InR1DXHl9iF/M0k9so=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hw8Qrve8; arc=fail smtp.client-ip=40.107.130.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hw8Qrve8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tv9QMULaoSopLXSrhm0GCBTiTj9YpS67OBBPVgqqFWJgi7HzOWJeyFjnaxQ8u60CLtM0zJJe2QnrYzwb9cp3rDqOaYk9X264bESRmgB5bxLG4ssfbTKh66WMHqj+Vdmda3fT1nJd/0CSSuU+PGD3dj23jAP6Ezkw748Jx8kKNH7ocbqv/+JtYPTlbt15Hg4DbtLMaw2TEaQQHZCNqu5rpoSeaguoafVNz0WuZAQkJHLTJlCZRTOluAzyAka3t6ri7CfCb1VRfxXTE65WNDV/kljy2ucSuBIZy4TvA8eOArs2qPvMStDS4dp02UnLUg2HJyKU3dxq9COfrfVcIVOGuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=We+8kZ2CzInc2RFx8MkNk/DSDdoS0Fk4pweZ3RFMUiA=;
 b=qN1CCdcAu6B9Kd8p6eti+35+IKdhzxmlQJJg+csI3qaro6vhP2CqySDBm8sqeKo+FW2OtRtYjeO1wDvn/ZvG6gvHcelkf4Gz9oIP8FzrBwqJH2W7i0gNAVQLi45mqTtWNHw2EVzaKbT0miTPftD8xgZyrBjtlBvhxXv8pX+VDTdHSdxq0zuqQhdAGHGsolXL/5AhgHGRPq6fE99zu7j9D0RvPqUKYO1Q46yT5X4Pc9Rb88sq7l5J5PUgY13km+E3LdljJd09umzZRblBwOB8++/JvOsMRx3uUKjbB3YhQbO04jKOght14ElifHZ2fMTOm8hleovpsC+iQmvyJt6m5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=We+8kZ2CzInc2RFx8MkNk/DSDdoS0Fk4pweZ3RFMUiA=;
 b=hw8Qrve8yzVTnWEj2TmLZzwOO2Hkyk9Mt8wBTT60oU7+ZhndThVgEytKMzCaXVhVtDgQQS89LDOmrUejWK8ohAH90SBElMB/88i5Xre7FGH8se4tcGJL32GYIKHXsnPs4vTARfIzBEfwUDffnJSwUtf4FAwAB3t6p26pslgSOw4U/2Kc+vuaji2DkQoYCGYsrgyO73m3+t78+dle2Jhc3hfwN01lJYTy0g+UJgdUDro2QMwDYOqdF+N6kwbiJpNU2+QxJzJRoktjrk+rd2JGwMT6IT1/1rONe8Hl9tE8rwEDksDGO/yR2HijTMZxMOMVotM+DwHz4KaHGT5BFKwmzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by GV2PR04MB12104.eurprd04.prod.outlook.com (2603:10a6:150:303::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 08:59:56 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 08:59:55 +0000
Message-ID: <a6ae1423-9ddf-4d15-b83c-569333abaf5e@oss.nxp.com>
Date: Thu, 19 Mar 2026 11:02:53 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add i.MX95 19x19 FRDM PRO
 board dts
To: Joseph Guo <qijian.guo@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 xinyu.chen@nxp.com, qijian.guo@oss.nxp.com, justin.jiang@nxp.com
References: <20260318-imx95_frdm_pro-v1-0-8c00e59f0b1b@nxp.com>
 <20260318-imx95_frdm_pro-v1-2-8c00e59f0b1b@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260318-imx95_frdm_pro-v1-2-8c00e59f0b1b@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P191CA0029.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d9::12) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|GV2PR04MB12104:EE_
X-MS-Office365-Filtering-Correlation-Id: ab2fdf86-8194-42f4-2ad8-08de8595e3c0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	pkRiGKkQFvwOVI8vWRmG6BOWu1dcta/1zJGCwqLC3NL7gPw9ZdA5W+3bgO68m9rqht5XFRscKWUNi9fmwcpJqQeHt9/tgGzAgRvtOlE8DYk54tyzGYXlndfbVnn3dEvMBR27OWQXwACYzab0aFNeNEoWcNgN6pbVMTOfxjk0iLln+GoDegO4p84XNNVOSEFN8vQWVVY6bAXUlLU+tr6X53dIUkQPSmw/TD222oEbpFABCPigRS6RKZS74eZ2SZz1EmxxR8sHl6IdXD1B8nH6xkNTef7xN3Om55e5l0EQD8UrdWHhwbKJO/YtGiqoh9jsnWUlrbtx6O8bvYkU9K/RcBAz/ZRcmSjvFQfA3pUdoKEW3E8TOCZsPDPDr0609LqyBonNs3kRPM0/PilnVGX60x6JPSL263c98sRRL5ntdBQT3v8PuTc0TarsDgdp8RhQeoVKlS8W9NNCqD7ZyUUqSAl8ycsP3N8gBD45CX1zUjix+WyhnmTZmBlyWuChHLm7sidOtaiWHd9g2mT/FS0woswAt+AWiJbqro6gZU0F1oovcK5pANyV518tNUNx0KVIqOtO2aUnVM9M2VaIbxArHpVlQDwlWjEqCoCefA0eS5ep7qGVDrThXfovPcUZvQqwzl8W8xfg1U6LOn5vSEuW2ONBScitN8uxbAq8l06z/biTpyOjcIJZFDIBL51LZooIWKge1f/wEb3UaOFISCBdLI6Nl75BjpqXcaI6Jo5V93c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWxoWUpBQmdOdU92RVMvUE1ROUpkNUZLOTdsUVFPNnRKd0o1eVN4cFcwbmt4?=
 =?utf-8?B?MWxGdktiZ2lOUWVCaklxbjk1ZmptM2ljbVFyZEphMlVhUWtNaHB2NGY3a1Nw?=
 =?utf-8?B?anFMalhZbWR5RFA0dmhuSGRTM0pDQ3hHdnhiTjV2dGwwemtpL0dnaVFYUmlj?=
 =?utf-8?B?aHpSc29oNDBFSm92TEl6TUk5Y0JqaW9lYWhDTkRQODVnWUhBckVuNG9XM2Jj?=
 =?utf-8?B?d2V5M3hvVGo3UFI2dEI1Z1dzcDg5b1pYRUQ2bzdRUzc1eG92VmVNK0NvRjRZ?=
 =?utf-8?B?cnh2RW1SKysvMm0vajdoazF1cVdTc1d3UTN6MDA4dE1oRXdOMlA2MUFSWlhU?=
 =?utf-8?B?VVpXYm5oeWRmbFZPRFllaUMzNDFNeU1WUDd4VC9VTzZGSTFNZ0hSdUxpdlNB?=
 =?utf-8?B?VlNqcUhBSFdsbTgrTWx6RWVURDFBTUptR3JlMmR2WUdTOHM1MHhqZC9MRVY4?=
 =?utf-8?B?VVVmdTd1SStNNzdCZUNoRVE0QW0xeHJGUmhxRFBvY1Fwbm8yQXRIMTZaaldC?=
 =?utf-8?B?UkZvMkFIc2hJZndCdG1rUkIwa3BUMlhHZFBGZmV1aVVvTXJUaEJSRys5R3Bx?=
 =?utf-8?B?TXdXMzd0Ykh0S3VpRU0vK0FKcTJDeUpSdmNGT3pYbGs3YysycXhmTEk2YmFx?=
 =?utf-8?B?aTdKSisvUm9YSTB3MHlNd0hwaS9oaTdRUVQ3T0gweE9vc3kybUJzbHBmUXNJ?=
 =?utf-8?B?TE9ibGVtUDBTZDIyUkZMbTdMbDJvV0hYa3JpeWVkUWF0QkMrMmFaSU9mTDFZ?=
 =?utf-8?B?VU5IQXBpNDRNcHZZbC85TTBYL1djTXg4elhRUUtOek8vd05tODN5amQ2R1lR?=
 =?utf-8?B?MlVwVkZObWQ5UVJZQjdyTmZhNTIzODJHaVl4YUk4NXdiRmtVcFVTMlBrU2to?=
 =?utf-8?B?YThBcGxrOEhWWVhJY0pCTU1vVEtBY0dUbjV1V082TTduRWlUcUh1M1dhMndu?=
 =?utf-8?B?c0Jqb3hjMmFuVmN3blRLSmVqZmx6ckFTQTg0N1ZyaFNRc0I1REVhU3JZUmV4?=
 =?utf-8?B?RzVlVktZTUk5aTVlYzNPZEViWGQ0VFVvYzJBbEJiT3B2VUZReGNyZmZERUdC?=
 =?utf-8?B?eHN3czlnWTZoY1JUczZ2TjYxVWwxOXMrQVhYaGZPcjFnemlSTFh6NUptbEJV?=
 =?utf-8?B?NHdReDZpZ0FDWXNaajIxNFZ3cjJTSGYrMEpJdW41K0RFaTZkaGNKbjdTdjdX?=
 =?utf-8?B?Nm9naVFTVnpwZkJGdzFiMG1MS3hTU3ZXdmNZRVFPRmNvbkVsWkl0SUpWUjlU?=
 =?utf-8?B?YVpXcDIzcWJWQkc5NVUyNm0wUkRpeGoxR3NDSFdFakozMU1NRmZJRHROVFpX?=
 =?utf-8?B?V20zWU5sc3F0K0pQWGx1YUcxV1doWHU3a2JFb0JUYXZ6S0czNmh0YUovREd2?=
 =?utf-8?B?WXREcW40RHV4Yk5wSy9FVHFic1VWVmhvZmhtNEt1MWRLUHMzMlB3MGhLYmdJ?=
 =?utf-8?B?RUc4MDlZWGw1bHhndGxPTFdyMW5haE51ZFhweWRHcTdjc0pkOEd4WUpoY2s4?=
 =?utf-8?B?alhlVzF0SVdKenU0ZGYzMzVwczBzT0g3Mmw0U1FKVU5GRUVzYnZkSjJScFNO?=
 =?utf-8?B?UFlXUWV5QlRQSHpXRmUzbkViYXRSUXBWL0hZeGVlQ3RUb2UxU2pnMFVnNnNa?=
 =?utf-8?B?Q0tLck4xdXQ3L09OUkxUcGNVdy9HZGlHZGllcHJqZzcxVTd4TzVOcXdDZnNu?=
 =?utf-8?B?V1dyWHdKOTdIRExLZXR5QWQ1V2FPazFDd3l3NHhDVVZVblVBL0toVjRxS3lx?=
 =?utf-8?B?NEQwbTV2OHdEZUt6bFovcnRZNExwTUlVRStVeDJ2MUxRV3BuSk9PRnhETmJP?=
 =?utf-8?B?ZHpuKzYyZWZyRlJIVGppcGFZMGN3Y1FLZER3cWVHUkxLNm5Zb1BabnMwK280?=
 =?utf-8?B?dDhBdDZUSHY5SkpvSlZGNW1IeGtNc28vdFN4ditsNkN0eEpOaUxMMyt5NFkx?=
 =?utf-8?B?N2FvTTZ6ZS9odzZTSDYwWlA4eWF0MnJ6RksrQWgvb3lGY2lDelZMZGdCNVM0?=
 =?utf-8?B?ejB4WVBEWU8wbW5SUHFQanpNNkZmaG1yU0wwZnVsa3krc2oxNXAyRGJhS3dL?=
 =?utf-8?B?Ujl5ck1nMGJLL0UwRFlLaUdqNHRnb2ZMUmhiUEIvZjhEWVZJY1hLWDFVcHZE?=
 =?utf-8?B?NnNlRlpPSTRPRkhBaitsRW05bWhxVVJ5MDUyNTl4TWVqZjlYWjBMd0RiN01D?=
 =?utf-8?B?RTE2ajlISkd1WTNYWjEyZCtST0craGNpeXBZbWVZNk01cnBWWjhUNWtaQ0hD?=
 =?utf-8?B?NGJ2Q1dhQStxbU1jTTFlaDN2SFFITlB1a0M5SWZLT2ltOVZIZXliZnlJWFY3?=
 =?utf-8?B?azBjbU0vSkoxVEpOVkFCZjlhYjZMTVIwMGJ6VkRtR2NDMzNzV29CZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab2fdf86-8194-42f4-2ad8-08de8595e3c0
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 08:59:55.5158
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3R11aFTLFgVLQKZIUZbxzL5O9ZZCTjW4MdPMzKVMZ/WZb3rM5aQfVthoMIAtTLyucoimfmLuCjIzozIYmFLcVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12104

On 3/18/26 10:04, Joseph Guo wrote:
> [You don't often get email from qijian.guo@nxp.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> NXP i.MX95 19x19 FRDM PRO is cost-effective with extensive
> expansion capabilities based on the i.MX95 19x19 SoC.
>
> Add device tree for this board. Including:
> - LPUART1 and LPUART5
> - NETC
> - USB
> - 2 M-Key M.2 PCIe
> - uSDHC1, uSDHC2 and uSDHC3
> - FlexCAN1 and FlexCAN3
> - LPI2C3, LPI2C4 and their child nodes
> - Watchdog3
> - SAI, MQS, MICFIL
>
> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
>
[..]

> +
> +       sound-bt-sco {
> +               compatible = "simple-audio-card";
> +               simple-audio-card,name = "bt-sco-audio";
> +               simple-audio-card,format = "dsp_a";
> +               simple-audio-card,bitclock-inversion;
> +               simple-audio-card,frame-master = <&btcpu>;
> +               simple-audio-card,bitclock-master = <&btcpu>;
> +
> +               btcpu: simple-audio-card,cpu {
> +                       sound-dai = <&sai5>;
> +                       dai-tdm-slot-num = <2>;
> +                       dai-tdm-slot-width = <16>;
> +               };
> +
> +               simple-audio-card,codec {
> +                       sound-dai = <&bt_sco_codec 1>;
> +               };
> +       };
> +
> +       sound-micfil {
> +               compatible = "fsl,imx-audio-card";

At least for this node we would want to use audio-graph-card2. So you either leave this

out in the next version or switch to audio-graph-card2 as we did for imx95-15x15-frdm.dts


