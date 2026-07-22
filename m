Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021119.outbound.protection.outlook.com [40.107.130.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84BD1238C16
	for <imx@lists.linux.dev>; Wed, 22 Jul 2026 14:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784731761; cv=fail; b=VdjvrGEgIKs1sdrTm6CyiF+b6jP35yGwpIahT2Kkh2ajdpd/BEPyjMxTNtHk79EdNU9ehv8vNOqNBHIaiyCWAvvDZITf27GZVttBbsSE4vHsdJR/ecBOzQ1hWnH4mWAfs5Atq6fnkj1wFCkM1WfYglqT4OENezjXjNclJ24jDC4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784731761; c=relaxed/simple;
	bh=mN/TJ5MFeWVKmv6eK4m8/riz3tOzO9WYwSH5Ra4eASg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=M5rV+90UDqV2E48VhTmvZqIfu2OHZ0g12+pZ7LNfdJRdTKlys98CFdN8FycF18pV8Pd+fYhoUyKTblV8B1nZH2Lgn4p5dfSrz7SnZQ+oHtyLvnDOqlWh+7+hOrh+MkdpLHPTUicPQEIuYxzZW7+XDtEnztRtHewPOkWXvZ66sL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de; spf=pass smtp.mailfrom=kontron.de; dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b=BJwlyeg7; arc=fail smtp.client-ip=40.107.130.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b="BJwlyeg7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YlnHJG8j3hFCsBjXi7shSZ3/QfBseyyGHatzJ+xXylxWGL7u1BSVF5WAPnHQFHuYIdswDfPNAco/Pnk3BOEsoPX6xsaoemM8oaBkbgfsaZYF8l+Y8blLlfO43xGMfRSJRIWruVOL/IfPYKWELnGqXj7QJvibdvJo8NqAC66WYvUWHE+DUynSafCVFy0nKdk7eH7k7sfXYOFtvJp2edKH0FG1VlmW0SwECoJtakjU1Dt1LUNwZdG6sja7ZoQYkWiRw4NlSOeHia0krPc/pqUTn97YVoRwEw293eVEgc3le9i5g8lU33GEIBjAoTQ979XlDnFIa3PwUITG6M24q7e+4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQ73H3bGQoaeEYC19ljWf7vTqmYu0YeC6DqeoEq6l/8=;
 b=N3IoashRaXyAVfzOulV0vfVJqis2cATMtQI3VcUQXWTMo3KQ4ysg7ZFQWMNGuOngzlL65TAXsktEmmu8GSOPVhR4WENJjpPGBePxwO0e590mPOcwCg4GyfujmVSmsOsFICULQj33xsfLil8bxPMKkcmU8TqtAad6Jo9If1ZYEB/26D5pRP7ZOpyZZa7nvAnyeruh09sXbfnnCDSrsSMkQKZb5itp5l8+KdUhMBtcl8pobmTeQALuHnmgkpy8mZQaHQKcv2KkITgryH/W0LPJ993zdlhARs/w/DDGn6T+9/5aC5nXIgdvQajM2PVjIUV9Yv1nZXZIrjmEX2tpYdxoYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cQ73H3bGQoaeEYC19ljWf7vTqmYu0YeC6DqeoEq6l/8=;
 b=BJwlyeg7u2FJpQULS71hAmO3Dyz01l7F6lMS7Q1MAr6ApjY4M+WEg5fdjM2Bv893wHVkpdGyZOWQh3u457oHNVtSzG8KFfUq5sHTCSlUJvF6i+sTgAxdhhDESpMRRmIG5Pk9uba108XPCDVYK6axL9kTzJX+/GF54UF4u3YfgmLITXqKnh1nMlxlla0b8Rm35n6iRrT97qfRIj0nNYMjBW3KFbo/qSsg/W03SzgbLe5XykG4wznNBQOZ4XEoYZs/m7USD2rVE4rayZlEB8WVx6Hsf927K/KOiUqH/FxInoJNx7ObyKXmvrmma/1dHRquTg31ANoCniQ8/5H2hmgIeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by GVXPR10MB8742.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:1e8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 14:49:12 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 14:49:12 +0000
Message-ID: <9ceb5fb9-edd0-408f-8f7f-74d5145ae81f@kontron.de>
Date: Wed, 22 Jul 2026 16:49:10 +0200
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
 <2420855.ElGaqSPkdT@steina-w> <20260714123350.GD22086@francesco-nb>
 <3056369.e9J7NaK4W3@steina-w>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <3056369.e9J7NaK4W3@steina-w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0210.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::11) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|GVXPR10MB8742:EE_
X-MS-Office365-Filtering-Correlation-Id: 85c07f8f-6bb0-4300-13b1-08dee80064dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	ejo6blgO6OOlLsOb7c7tqWwUIi5RF04j0oB5p1Ssy+7dt+v7j4UobJaj0LIiKJ9UfUbQ1Tiu2iswwkpZ2spYI76lojeuthZdGgGujpbCUzvmbtbvKdD4/ou5g9gR9emo6BrwnLukH+2h+7qYtnPQthwDmiVWhUiyhn9Zzs4MitN+0i8RVnxe2QrG9JN6KcKnvCpVyhn8iMgC7BzdtEzkd8Rz6M+gd5wCgQf7seMwJONWYIrDmhsVnqlw5u075Pj/IfBnrR03W/GxWEBJszzN93JywPpxmlvgQwkslsd/tFUG7kIlEpI/fJ1MOqCyXbCKXKLZuntU84/e8RxgJsQ0Su9WMDpOnvH96kJu9AmxNCu5pjxYSzEQ3nBcdm6SgIEsyR8J5VJIJCi8jj5f7yLcVEq0DWSAVNNgkC+9z6UpPNc/qrYYtuemTKsj01LVPxRGxau4+2EIh+kVxt3Whxmi0E8kYrJuAOBI9MX4FIcI/2MweWpUNMBaAkEJ9cUi0zL/AJZnDqLlLdCpqod/lNrCfEfQIl3rQNn2oOm17gQFO8+Ih3K/OmG0O3sXFdomFJFZtbQKumMRUbgGAOjmOkFZpp13E5OFgZa1qtBG9wTay/kALUfHa//kizD45wD0yfq+FUhsa5y5f8NoY2XENeVUErJ3CWytxjFprRCDSL/Qo6k=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SjM4eTBESExQSC9ERkZQRlZ2N3JjU3owNElWcXY2UUhGVVZuK2xqenErQ2tI?=
 =?utf-8?B?UmFncXhOZkZLb0diaUtwNGhxVk5LSkZuQk1xQWxDdW5aVVViVStQMHZHWlN1?=
 =?utf-8?B?OXp0ZEdmYmdNTmpkMzdZa1NIZlgxVklWL2hKS1V4WFd3VFZyUTMzWmdZb0pH?=
 =?utf-8?B?d2I4bHFPUnJtaEZ3a09wUTNCelF0aWR5QlNZYmk3NzJ5RWMxYzk0T0FyY3Jz?=
 =?utf-8?B?cFdyRjNJRGhiV2hjQ2p0RFE4VncwUTg4WURacmFXcmd3SnJMWG1lcW81Zkdo?=
 =?utf-8?B?ZWxjNFhIYWZsWnhtN1g2L044T3hhb3dXQkVsN1dJcHphZDluYTZ3eGZUdGx2?=
 =?utf-8?B?WkkvbFNXQ1E3K0UxNHdtZU1XaWk3NjNnN041cS9tY2I1U1B4dlVzMGd6WE93?=
 =?utf-8?B?Q1NoL01tRWI0ZVVLaUtwMXVzMDdwMVVaazVnNDVFQVB3SG5CZkRGSTBKeUJ4?=
 =?utf-8?B?NWdmUGoxRVUzTk5TSzNjRkVFVm0vUXlLQlBNU0l2UVYrSzNOM2xXaFZpWmhS?=
 =?utf-8?B?UUl2MlVqcWxSWmVSWERHc29FcVBRVDVWVkZyTDY3Q2JCckhJS1JaZGtXSUxJ?=
 =?utf-8?B?V3hLQ1VEdVRFYTNNYm04cXdabkozYk1IQjRNRktsZFRqMTB3aVYyb0VIZDBr?=
 =?utf-8?B?SEVtNnVuV3hzSGc2eHlLNDRxRm1MaFNGK29LVDZObUNZVXk3MGVMdENFQ0tH?=
 =?utf-8?B?dWxUZS9vNVhyeG9jbkY3OXp2S25hU3ZDQVlYbWs2MzcwUDFnaytpQVJmYzNs?=
 =?utf-8?B?NjV6eXVJbDZReG8wNStFUTJndE04ZmlmWXF1STBYMmhtdCtja1UrMGw2TUZ6?=
 =?utf-8?B?U2dBczAzTExyYVN4bnRtVnYrTE5yaFBCelVPWmUwV2RYUFpkbWx3NUtjNTVp?=
 =?utf-8?B?L001Wll4cHFHOFhGUUM0Q0RIT1hCK0R0d0hiRG5WbEVCOVA5UXVWYlVWV2NI?=
 =?utf-8?B?eTN4REdDUEp1VWdpYkQwbG5aV0g4S01CSGdoQ0F3RmNOKzczZXJsRzFEMTBs?=
 =?utf-8?B?M2xBa3FzZmRaNGdjbG5RTWRVM3BvTmRqR0RWcnFLdjdhV3R6cjlONlYwZGlk?=
 =?utf-8?B?d0Q1NDhVcEp6MHlyb1pnWWd1WDhzZWU4UXBxTi9GNU9pTjkrdlcwRUhYK0lm?=
 =?utf-8?B?bXJQUnlFQWRYWERVMEpJNUpIWWxLVloyWi9rS2Vob3lZc1NEdWtEemVxV0Zw?=
 =?utf-8?B?RHljU2U4RWQxU1dYcFJhWUI2NUF5bEVmQnVaWlplbkNxWldINmpGalZMdmQ1?=
 =?utf-8?B?QysrVTR5aW5VajlocHNpYU0xR2ViazhlMGhqOS9Md01CTHdKTjZRSjR4djZq?=
 =?utf-8?B?RDduTUtseWQ3VDhZaDZwbXlNSUF6bVM0MVZXZk5Lc2l3R3l2ZGZNZ1R1Z0Yx?=
 =?utf-8?B?RFhZT2tCbU5sTDNnTWFWT1UwYnJCQmluaFpIU0RKd1poUVRiS2p1cGNueUhy?=
 =?utf-8?B?dmtXdEJXeUNYcnM3QktBb3cvU240RmVqZFJyWFM5OFgveGRlVXNDK3JjSkIr?=
 =?utf-8?B?RDZPbVlhd05LcXE5dlFwRHhLcUZUVWlZb2tSWldTRWF3OGxhek9BTFNFTTNV?=
 =?utf-8?B?SktxNXBJVGFRR3dyTlNHN29zamlPRG5Ua2lTTGxOelBEMVJNclhZN2taVTN2?=
 =?utf-8?B?S2VJTnlZUzVUTVE2alNFcncxOHc1b0RwdGRJaVhUUEVPbnViQlpMTTFlcjNx?=
 =?utf-8?B?UytkTWs4WEs1NW1ramNWQTRrSzZndmNZb29qT3dhcG5obWFyZThtb1N3Rm5T?=
 =?utf-8?B?T09hY2tvU3VITDIxR1VIaW5UaGxBcWpsRWJEM3pReEwvYTlzaXg2Y28rdDAw?=
 =?utf-8?B?U2Z1L3lRTjJ3eDY0cUNBVjJsbzlOREpIb0FSSFR4TjErbERvUWlCaDl0YVlr?=
 =?utf-8?B?cTU0aG1YZHNTQXFxOHp2NkdkOUR2eVZzMjVCMVZPNGxtb3ltOWVUTWVPcndF?=
 =?utf-8?B?YS9XSFdTazRGTUlYbGVXT2xWTElUQklNTi8zY253dGIrQTBNTExZVDFQR0NN?=
 =?utf-8?B?Z1dMb08zelk0UUZJSmVVZmpjVk02NkxOZ052RlFXQkdoZW16UzdDQTU1WCs1?=
 =?utf-8?B?ZUJuU0ttNFBIUEFIZ0c3UkpuN013QTk2MmdsdmxKM2NXVEYrL3owT1ZuNmhx?=
 =?utf-8?B?UDUxdi9kVzMrMEVZSFZaMVJoN0JKUjdzZU1kS25scW5mTzQvNkUyb1Jxd3hG?=
 =?utf-8?B?Ry8ySWN4d2Nad3lIZUkzeDhpd3h6aG8wYUxFeVFrN09UNEF5Q21zTEthUFhC?=
 =?utf-8?B?OEtjVmZrTFAxa0tCbzFYNkhYTkdwRVpxSElpaDE5aCtlelhoTy9MdXczSEFk?=
 =?utf-8?B?dXliRHkxYzNiS1FBWGVHbUNxUWdMQVNaajk0WlpQR1JFaWh5Zyt3WWQzcXR1?=
 =?utf-8?Q?qaH/6Oc+AtFaucrc=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c07f8f-6bb0-4300-13b1-08dee80064dc
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 14:49:12.3849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9RZ+awgI832DJVDRUmThUte8eaam9Niwr3ZCQuKOHdYewhTkA4rWt8e7OtKoRariKcGB/5tQtr9HJsDZHAiBiMfU6W7/mOyWF7ZuRLtd6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8742

On 14.07.26 14:37, Alexander Stein wrote:
> Am Dienstag, 14. Juli 2026, 14:33:50 CEST schrieb Francesco Dolcini:
>> On Tue, Jul 14, 2026 at 02:06:38PM +0200, Alexander Stein wrote:
>>> Am Dienstag, 14. Juli 2026, 11:33:54 CEST schrieb Francesco Dolcini:
>>>> On Tue, Jul 14, 2026 at 10:43:56AM +0200, Frieder Schrempf wrote:
>>>>> On 14.07.26 10:32, Francesco Dolcini wrote:
>>>>>> On Tue, Jul 14, 2026 at 10:09:11AM +0200, Frieder Schrempf wrote:
>>>>>>> Hi Francesco,
>>>>>>>
>>>>>>> On 14.07.26 08:59, Francesco Dolcini wrote:
>>>>>>>> Hello Frieder,
>>>>>>>>
>>>>>>>> On Mon, Jul 13, 2026 at 04:53:46PM +0200, Frieder Schrempf wrote:
>>>>>>>>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>>>>>>>>>
>>>>>>>>> Add the ELE firmware API node and pass its handle to the OCOTP
>>>>>>>>> driver. This allows us to gain read/write access to the OTP fuses.
>>>>>>>>
>>>>>>>> This seems something we should have in the soc dtsi (imx93/imx91), it
>>>>>>>> does not seems board specific.
>>>>>>>
>>>>>>> My original intention was to move as much as possible into the SoC dtsi.
>>>>>>> The problem is that the memory node is somewhat board specific due to
>>>>>>> the DDR. And I can't move the firmware node into the SoC dtsi and assign
>>>>>>> the memory node in the board dts as the checks for all boards not
>>>>>>> specifying a memory node would fail then.
>>>>>>
>>>>>> What is the reason to have this memory address different on various
>>>>>> boards? Can we have a default in the soc dtsi, and allow the board to
>>>>>> override the address if needed?
>>>>>
>>>>> There is no real point in having different addresses on different
>>>>> boards. But the node describes memory that is physically on the board
>>>>> and not on the SoC. And I think that is why DT maintainers want to have
>>>>> it in the board DT. It's the same with the memory nodes for the
>>>>> remoteproc drivers to communicate with the Cortex M-Cores in the i.MX.
>>>>> But maybe I'm wrong and if there is a possibility to move this to the
>>>>> SoC DT I will definitely take it.
>>>
>>> We are talking about reserved memory, so this is highly board-specific.
>>> So for different hardware variants with different amount of RAM you have to
>>> go for the minimum anyway.
>>>
>>>>>>
>>>>>> Or can't you add the address in all the boards, and keep everything else
>>>>>> in the soc dtsi?
>>>>> This could be a possible way, yes. In that case maybe we could even
>>>>> create a generic dtsi to contain such defaults for all boards.
>>>>
>>>> I would go for this solution, we could have something like
>>>> `k3-am62-ti-ipc-firmware.dtsi`, include it from all the boards, have a
>>>> sane default memory address, and have an easy way to override the memory
>>>> address from the board dts, if needed.
>>>
>>> So what is a sane default? At the end of the minimal possible RAM?
>>> I'm not really fond of something you have to make sure matches to your
>>> hardware, but won't raise an error if you forgot.
>>>
>>> How about providing defaults for the SoC part and users have to provide their
>>> memory on board-level? Similar to the VPU nodes on imx8qm/imx8qxp. There you
>>> have to specify memory-region in your board.
>>
>> I am personally ok with both solution.
>>
>> I think it is easy to have a sane default in this case. You cannot have
>> less than 256MiB in practice, and this is just about the offset, is not
>> that you are going to want more memory reserved if the board has more
>> memory available.
>>
>> At the same time, having the memory range in the board dts is also ok to
>> me.
> 
> I'm just saying, because we had lots of problem with assumed offsets/length
> in code/DT for NXP boards. They usually come with big/huge amount of RAM.
> This breaks for all hardware using a small amount of RAM.
> So it's better to not have a default than silently breaking things because
> the default doesn't match.
I'm revisiting this now and think about how to do it. I would like to
put a default memory node in the dtsi that dynamically puts the buffer
somewhere in the first 256MB. I would include the dtsi in all
i.MX91/i.MX93 boards. I think this should work for all boards.

If I put everything, but the memory node in the default dtsi, as
Alexander proposed, I think I will run into DT validation errors if not
all boards provide a memory node, as the property is mandatory.

Is there anything I might be missing?

Thanks for your feedback!
