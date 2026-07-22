Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021125.outbound.protection.outlook.com [40.107.130.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579FF3A63FB
	for <imx@lists.linux.dev>; Wed, 22 Jul 2026 15:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784734041; cv=fail; b=EBnQmWTXZSZf0YzkyLG0vUx2ePbeLu9Ey8cf9aDzA4PNrcKb1IcJWVtyYQ5RGkElGEg5FzGFZwzvUMVhh+qlcAy7K0skynHpTU1KIbGe+Qq4t9/e5JDAiUbxCZLY8EDlmti3Iyervlvpp0zjHQzEHEBvlgkNmgcfLu3KpYKnTs0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784734041; c=relaxed/simple;
	bh=HFQei7muYTAeGa1Ve7BZz/K+lxs0QA2z6NP5gK+Xk4I=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=C9JkgBzCUp6XPnXh2Up8/ap2LTrx+5q9jsXhU69grs3vBHFN5JeaN5GFRi0Xb4+T/xtb50DwMBebtDEuTkHqJOUHUfGAwPJvQgoV1OGyn360HKRZPvtBE5h5jB8Th/b/Lf6QKQE2p2e30/pw/c0NKspvZCptm1WxcNnMqK3uFrI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de; spf=pass smtp.mailfrom=kontron.de; dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b=WwoJjI71; arc=fail smtp.client-ip=40.107.130.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b="WwoJjI71"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I2tPSCVEUrODKnpLhlVDhe7UJC3ijGbqAs918Usi4I7CEML+ENGe6zTd4EK35RS2N1llLweKa9buFPAj80da4DeXnXoGDzKCiFP1od0Tk0JxLUrwyfS7VK1IlCCEGXeAYkiQpsnz7HbN1lO6HBf7XllYk7V9hTm3g7wFiNTJPlGPyG+5vgGotmsM0n5Iaryl4vO2kr5204AmZtbNdm7GyMh63dNkXMPLAisKXhaTuKCUQz9Pb0N2kAS+ADad0+ZeVqtBpF4Hl/crIaCZ69UkUxNnOYY7ZWzdS2bMTf5Oo7L3K7UHmu/sjRcxj3WcGtExG7dlP1rSPgXLhlg0vBTCRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFRVJGykRzaNCMBGOZWpOnBCzRB1NIhPbLZUWYQH1/A=;
 b=mf4+8CRaXCtRswdFdc3mbU/uTltYo2YAkvfpgpy42lXSPxT1QKYuh+EexqCegt8YPCHn/PfyCu7j7qoOUOmFpxPudAfc+686bwskzItWoto/qN4i4mDthQZ9G3Rt7cHOJUUonzilRZzmUZrDYqMqCrbr7L2tzr5jqvYc07/X68zQlybrQcsSIu0JngMBFfMPaAdkMlMYKL9O+R16j5grSrBVyRQ8N/zV1habvkWfU/+q6YuGGNS6FNvdhWqdtkj8Gm5Y6WRHvKJ1Z4e8tniBAs8ZxQaBSxYveJ8Zo0RDYXeXJl92kSeMCmXQTLH6d840L40NpOrYwayXiCLp3H9ABw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFRVJGykRzaNCMBGOZWpOnBCzRB1NIhPbLZUWYQH1/A=;
 b=WwoJjI71rTGYjyAZpK+rHDxtSm9nob7/ScxPLuoKytmWXafxkM+mzGAg+iCRuGYlev9QIbzkhSdac4r9S4XVkZ2FLFxgtlRFjNDs1MA8ZpqCYm6dq0v8Tvq8HUcUo9HaUY+y3uZ5MkyuXGd68Wm8Eqa9jWn4eDbyVVs+YhAsumyRBmsuUi/8nehSaZedWi/QnOXi7VJZZZ8+4PgiOLw2OTEcnLPBH3gaf201UtNlVV2IaGamrSBnoor2C6PoxxFWZggwz0pql/eIU/TybCmbc/O9zyXaNujd+xmFty1+/AZnh26zpvNn7+/XJxiE9h8fAESSK3GgEkqXOeR9F5eDHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by AS1PR10MB7958.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:47f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 15:27:02 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 15:27:02 +0000
Message-ID: <88bb9b8b-a04a-4a15-b738-0ef39c368bd8@kontron.de>
Date: Wed, 22 Jul 2026 17:27:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] arm64: dts: imx93-kontron: Enable ELE firmware
 driver
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Francesco Dolcini <francesco@dolcini.it>
Cc: linux-arm-kernel@lists.infradead.org, Frieder Schrempf <frieder@fris.de>,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Pankaj Gupta <pankaj.gupta@nxp.com>, "Peng Fan (OSS)"
 <peng.fan@oss.nxp.com>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260713-upstreaming-next-20260609-imx-ocotp-ele-v2-0-b8266d93514b@kontron.de>
 <3056369.e9J7NaK4W3@steina-w>
 <9ceb5fb9-edd0-408f-8f7f-74d5145ae81f@kontron.de>
 <6611405.mvXUDI8C0e@steina-w>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <6611405.mvXUDI8C0e@steina-w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0319.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:eb::17) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|AS1PR10MB7958:EE_
X-MS-Office365-Filtering-Correlation-Id: 273bdb14-a43f-4704-ffcf-08dee805adb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|7416014|56012099006|11063799006|10067099003|4143699003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	mLCwHU4h4Y3X0GQU8AgWJb63hyi9WTH6HCSS2hUT14r0ZaRkJ3ZxrJBb6pExt528xutF6x3E8K1gXzwSgCcz2woMFDlDbo/AeC1b44bd4u2N2+X8g1SdsrzOHHvQwjqAizwFbv/1B1JjTm85+oL4kozhOm+EvdVHZ+FoLnVJYnAfgXA5E+NzU1rjvGYF2Il5l8DTxqiBQoVncxo0y0x9Fs+b5/rTjnxLQKgN1pjDrGY/txWI//xDphvuzfFUNyOfrGIpzLiOOrQAFFnYa6Kz20s0hJ3kS+VDjAOiQp4I9HN7NSn531nUQtTWh/vsK0qYE/9qd5huN0x6RFky8g45RPkDafFhgPKm/y+rwZ1fZewRtyb/1gqCoEcwJwYF0UXofoPTeNvXrbnUCH0Syx+IgABIg3t17RY21rrKQZDJSzJpHzpzI5KIA0f7xm71S3/LaJyFAIbyjiRBor6PHO7M49forE1rCJzwbUF5rOZIF2379T+utjiQyzKUw+SFQq2gNxY3/yY99E6Swf8QW/yYsnvgqvtT/Kuah55pcAvWM6W93sXz5wC968BvNpi26IcxxVrHT1b/tDAbl7CAk1vV5CgoVr0G7g1DrdaR4luCEULRUZcmYzmx0dZMVZpIvWBZVKYVs/LASVaon6H57gmineMTpc+uMgOCn5vQwhz/CHY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(7416014)(56012099006)(11063799006)(10067099003)(4143699003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?akYzNEY0ZWloYjJST2s4aGt2b3RTUGU2KzU4OWdoRFZMdklNQjlFeEp0d2NR?=
 =?utf-8?B?ODFmSjFEeExIRVdOTTl5bVhhaVo2Nm55dWVjTXFxMDBrdnNHb0U1QnV5Q2VI?=
 =?utf-8?B?M2FtNEYyUFVwb0tvdVVTNk1PNWlmTUptaUs1bVhMS1RyODR5VGhzalIyM1Rv?=
 =?utf-8?B?TEl5UDdDVThCYy9TTDN2blVwODMzaU15S1FxeHdzVGdQQmc2MUtndUw4clUr?=
 =?utf-8?B?OXJTWjYvcllRTkdNZmxCU2ViSjQvUUt3Z1JpTS9JRlgvTmNsUm1mMlhMNjU5?=
 =?utf-8?B?T3FOZkFBUGhOZFVpYy9lbHpDNXJ4c2dHWlliaGJQekZFbTErckVCdlBtQll1?=
 =?utf-8?B?eUpJRjYyc1FvODhMS3NiYWlDaDRzTmpqTGQzbjdHWE43Q0g3YUlFOWtXY1lw?=
 =?utf-8?B?L2ljWnFpUGtOcnY2ZkgxQ1VUVjYveVNkS05TWlcwYnU4dng2TmovM054OWNh?=
 =?utf-8?B?eS8zRG5aNHoyQlM4dW4vNTZVYkk0TnNNT2lDL2dmcXkwdFFJRVo5NTVNemhF?=
 =?utf-8?B?R2xMdFV1Yyt2Z2laYXlvM3QzdFZTTWJpU0RORDB5ZTNtSTM2M25uem43bnVx?=
 =?utf-8?B?N3dVMFhHSEYyRnNyVEpTcC81aSsxYnV2MzZOK3hRL2h1L2YyeGRCQ3M5ejZl?=
 =?utf-8?B?b3NDLzhlekVTMWxiZVUzK0t0UGs5WFA3U1E4YWlRK2QwY0pWR0dQb2lTTnps?=
 =?utf-8?B?RTZPYVU3d0tNcFBxZWNIdWt1UjBLNHlkamwxN2s4TStMZFJKdUxVYXlHRnZD?=
 =?utf-8?B?eFUvUW5MYnQzUEcySmNIMmc2bkQ0a1JrRlAwQlAwS3dLTVVSUi9sdU1QZU1z?=
 =?utf-8?B?blhES0oxQkw5S0FwSS8vY3oxOVVsdDZkOXp1Y2gxMUo1S1FaZWQ1WFRCVDRL?=
 =?utf-8?B?RkdhR2dnYnFXcUp6UGNQUDFZVUtLcUtUYklwKzVSVTAyTDRJdS9VUlZaOXI1?=
 =?utf-8?B?bGY2VXF2UEYvZmJZYU1jWE14R094MlR4M3k2b01CVzdHSXhabjZmMjFWMjlX?=
 =?utf-8?B?TDhWTFdNTldPazBoWkpkVHR6WXFFcGN6K3pZWDJiNkllZHJocG1qbk0vaytE?=
 =?utf-8?B?R281R3dFNjlEc1FVMmFoMGpYTGwzMDROYmpEOW9XV2l1RG9yMFNSa0pycmtp?=
 =?utf-8?B?TWN1ZW1tSnp5MFVmbjVXUXZmTGludm9TdVl2MkM0ZTJqNkQvdWlYNlhTc1c2?=
 =?utf-8?B?MHh3Z2tXNXI3SmsxZEJqdkt2eTR0UEI1eGoySXNrVUM3MnBrUElaMHV0VWZU?=
 =?utf-8?B?K0RYMXh5L2VyM25aaWo3NU1jNlF5cEgvOTg2MEdUUkh6c3dDV2lhNm5md1VK?=
 =?utf-8?B?T3lndnowa3lWckJydXk0MVBMVGc4emxwM0xLQytLeUl3KysreGJFMERjVlBk?=
 =?utf-8?B?ME5nbEFuK0lUNVdWQTdBYy9LVU81NU5QdW5JQlNhajFxQlNhYzhnWm0xQWpa?=
 =?utf-8?B?ZE5VdUF6bTN4TzFmdzhJbWZ1TmtoMmR4ZmdUUDNMQm1hay95UDBRbm5JdTJn?=
 =?utf-8?B?RkR3azg0NExJOGhMZXhoVkVFekZpVWpVSURrazZPay9CaWd6Q0I0Rm1ueU9T?=
 =?utf-8?B?VGRXOVRYeGFRWnJ2VThCQm04c1JYWEZld3ZZQjRsdTJjdENuQkF1K2NkVUc0?=
 =?utf-8?B?a2FZQ1F0d0RmYnExMlBYRmxVbnFpMmw0bmRQS2lEemhCaksyUDlPUjVqQkhz?=
 =?utf-8?B?a3B2VlFPeXdLcXFMK0xMaUdIQi9ROVgrdFQvRTFReUQ2VU9OZll0dnlnMVBT?=
 =?utf-8?B?MlFYQjI5ZU10MTlKYWhSTFViL3NoMkludm5RUGJPYUU0dTh2R2ptMFZrSm5y?=
 =?utf-8?B?MXBZSDJLSFBrVml4UUxFRUFyVktabGVndVZYYXI4WDNMaFNlUXFDRVdIRmNR?=
 =?utf-8?B?UDViYW9CbHJKWTJaRUFpQm4vdFcrOHB2R3BKeDFJWmQxNXB2MThrblhxZWVK?=
 =?utf-8?B?aVNnOGpzclVhQ21MRlNNSVJpWmxvVXU2SWU0aXBDMXRwU2JHUzJXUzZ3WWhT?=
 =?utf-8?B?VWdyWnUycDNzd3VNUFNsUHJiWThvM1hYZlNmOTRPZjloeTA4dWhMQzhTNFRP?=
 =?utf-8?B?bFVOY0d5NVQwN1JkYm94dkpDMmhWUUlCOVJOSXBlbGhrSEhtdS95QlgwVTVl?=
 =?utf-8?B?ci9VakRkbXF0bWg3Ynhsb0VLbWhVK0xUQ25ibUxhRFVqdUY5eWJkMTNMWjF2?=
 =?utf-8?B?bDVnb0R4K0JlNVNSaXpST3c0cDJ4M3hWMWQ4c3FrOW4rYWcvcEZlK1I5K2c5?=
 =?utf-8?B?dExCcWJsaHlZWUpjekRrbzdsY3EwRWdTL1cyeG53MmUrdzROaVlTQThpbkZQ?=
 =?utf-8?B?SzY4bzhNSkMzLzBIV3Q2cHUwK0xGaWRadVRsdG5Hcm9oTWcrWUt6Y3ArSjVM?=
 =?utf-8?Q?BM17EDj9wQgtD1vA=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 273bdb14-a43f-4704-ffcf-08dee805adb2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 15:27:02.2047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L1ieOIxeM7MKGg+pRNunNVR4rWKGS57JDBvyH89YwWygEUxVf85e3siONPkAQCjh5OtCkwp5wXg6kEozFFML4GGPqubzoXToSeuZQk3iYR8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB7958

On 22.07.26 17:09, Alexander Stein wrote:
> Am Mittwoch, 22. Juli 2026, 16:49:10 CEST schrieb Frieder Schrempf:
>> On 14.07.26 14:37, Alexander Stein wrote:
>>> Am Dienstag, 14. Juli 2026, 14:33:50 CEST schrieb Francesco Dolcini:
>>>> On Tue, Jul 14, 2026 at 02:06:38PM +0200, Alexander Stein wrote:
>>>>> Am Dienstag, 14. Juli 2026, 11:33:54 CEST schrieb Francesco Dolcini:
>>>>>> On Tue, Jul 14, 2026 at 10:43:56AM +0200, Frieder Schrempf wrote:
>>>>>>> On 14.07.26 10:32, Francesco Dolcini wrote:
>>>>>>>> On Tue, Jul 14, 2026 at 10:09:11AM +0200, Frieder Schrempf wrote:
>>>>>>>>> Hi Francesco,
>>>>>>>>>
>>>>>>>>> On 14.07.26 08:59, Francesco Dolcini wrote:
>>>>>>>>>> Hello Frieder,
>>>>>>>>>>
>>>>>>>>>> On Mon, Jul 13, 2026 at 04:53:46PM +0200, Frieder Schrempf wrote:
>>>>>>>>>>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>>>>>>>>>>>
>>>>>>>>>>> Add the ELE firmware API node and pass its handle to the OCOTP
>>>>>>>>>>> driver. This allows us to gain read/write access to the OTP fuses.
>>>>>>>>>>
>>>>>>>>>> This seems something we should have in the soc dtsi (imx93/imx91), it
>>>>>>>>>> does not seems board specific.
>>>>>>>>>
>>>>>>>>> My original intention was to move as much as possible into the SoC dtsi.
>>>>>>>>> The problem is that the memory node is somewhat board specific due to
>>>>>>>>> the DDR. And I can't move the firmware node into the SoC dtsi and assign
>>>>>>>>> the memory node in the board dts as the checks for all boards not
>>>>>>>>> specifying a memory node would fail then.
>>>>>>>>
>>>>>>>> What is the reason to have this memory address different on various
>>>>>>>> boards? Can we have a default in the soc dtsi, and allow the board to
>>>>>>>> override the address if needed?
>>>>>>>
>>>>>>> There is no real point in having different addresses on different
>>>>>>> boards. But the node describes memory that is physically on the board
>>>>>>> and not on the SoC. And I think that is why DT maintainers want to have
>>>>>>> it in the board DT. It's the same with the memory nodes for the
>>>>>>> remoteproc drivers to communicate with the Cortex M-Cores in the i.MX.
>>>>>>> But maybe I'm wrong and if there is a possibility to move this to the
>>>>>>> SoC DT I will definitely take it.
>>>>>
>>>>> We are talking about reserved memory, so this is highly board-specific.
>>>>> So for different hardware variants with different amount of RAM you have to
>>>>> go for the minimum anyway.
>>>>>
>>>>>>>>
>>>>>>>> Or can't you add the address in all the boards, and keep everything else
>>>>>>>> in the soc dtsi?
>>>>>>> This could be a possible way, yes. In that case maybe we could even
>>>>>>> create a generic dtsi to contain such defaults for all boards.
>>>>>>
>>>>>> I would go for this solution, we could have something like
>>>>>> `k3-am62-ti-ipc-firmware.dtsi`, include it from all the boards, have a
>>>>>> sane default memory address, and have an easy way to override the memory
>>>>>> address from the board dts, if needed.
>>>>>
>>>>> So what is a sane default? At the end of the minimal possible RAM?
>>>>> I'm not really fond of something you have to make sure matches to your
>>>>> hardware, but won't raise an error if you forgot.
>>>>>
>>>>> How about providing defaults for the SoC part and users have to provide their
>>>>> memory on board-level? Similar to the VPU nodes on imx8qm/imx8qxp. There you
>>>>> have to specify memory-region in your board.
>>>>
>>>> I am personally ok with both solution.
>>>>
>>>> I think it is easy to have a sane default in this case. You cannot have
>>>> less than 256MiB in practice, and this is just about the offset, is not
>>>> that you are going to want more memory reserved if the board has more
>>>> memory available.
>>>>
>>>> At the same time, having the memory range in the board dts is also ok to
>>>> me.
>>>
>>> I'm just saying, because we had lots of problem with assumed offsets/length
>>> in code/DT for NXP boards. They usually come with big/huge amount of RAM.
>>> This breaks for all hardware using a small amount of RAM.
>>> So it's better to not have a default than silently breaking things because
>>> the default doesn't match.
>> I'm revisiting this now and think about how to do it. I would like to
>> put a default memory node in the dtsi that dynamically puts the buffer
>> somewhere in the first 256MB. I would include the dtsi in all
>> i.MX91/i.MX93 boards. I think this should work for all boards.
>>
>> If I put everything, but the memory node in the default dtsi, as
>> Alexander proposed, I think I will run into DT validation errors if not
>> all boards provide a memory node, as the property is mandatory.
>>
>> Is there anything I might be missing?
> 
> Mh, isn't that exactly the situation you want to catch as a DT author?
> Raise errors early if something is missing in the DT.
> I would go that way that for all currently existing boards an corresponding
> memory node could be added, no? All coming boards will need to provide it..
> 
Ok, but what would be the benefit compared to putting the node in the
common dtsi and including that for all existing boards? People adding
new boards would just copy the memory node from some other board anyway.
This way we could at least avoid the duplication.

And as I don't know all the details for the existing boards, I can't
provide anything better than a default memory node.
