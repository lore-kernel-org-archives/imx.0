Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013044.outbound.protection.outlook.com [40.107.159.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BF43BED70
	for <imx@lists.linux.dev>; Wed, 29 Apr 2026 09:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777455003; cv=fail; b=t/F2zdmbJmXq9M+6/8b+KQv3VFDa+kyge3oA0xCNTrHX9qFiX97PIIvK3SPxczLtfmzRn/OxEaCC6nLGXZvWvWNqXoDa0g1fgdCju2+LUGKFOmpSyiTmStx1OV2V7Sdh8oDkVElOyosRti5juYGdIgn/GCJYMsSgNjRDuShleIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777455003; c=relaxed/simple;
	bh=QAi8FswAmRsH9R82ObM3JsymBFCegHxrZpRwDZz4vks=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Rke34O9656zkXEmrYTz41BmaZa4O2Xq0DsBtDbC4iTsKKf1CsBw7k2Au8bOxLL96CIAYWqI1uCwYQF0i1oZAfw9eCnlmFpLJHKvV1ir5wZe9gEa7PiicwSF/QxkvCfkz4jE6ca7GKyz+m+DSnXOmzDI9q5LsTIcPt2IkHlU1nYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=b5t0gB0O; arc=fail smtp.client-ip=40.107.159.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="b5t0gB0O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k6+JtasMF8GqRJIYFp2icd0iku2ndfvoPdRkBJWBxpN4htAlQ6PheeNtb2WoU6fvANWN2cC8NQzNgBBB5CZ7+7y6gwSsDG9W6IWbeDnfng4R9tcO1CYWD8jyNzmz3gwSe71lxCwjPe13OB7UtihKIfhyVX8cNZD+i47AijU9JsXbwJG00jas7OWyMly6Dn5GoQT+kocD8dWuu7UgSR+P96oS8ZD0PwnoPwupCS3uVpO4/dFakKU5Evd7mYhJD4+F6AjcDapIH37qteW/+eTKJ19XwsVOnPkmJQoOCa3XI67acvjF6oldtgq0pRsmm+PlUx20eXX5owPp+eNc//iinA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pfn/vN1s03AKEptwEimVi61IE+URmi6A5zNLtSewv74=;
 b=rPNT8kAkueOIReWDaU6UN7LkuVRLbkYhmrv/FNuluGTybxiP3XiwN/wpa0KctZKeYV9l8asAY0u+Jif4qFLegLf4P/1tqhdWWArKAZ94Xu3jyOXMijjnwOYt9POKSbXRnX04JH7my5q4Fs4KVxjdDt/qfpC2vQgOKPAkZadAm/RVh2DlPlW4dvk4sUxdZXKUGAgMARgjjtUQXpBS0nXZe6ErpBjoJO7AMAh0yU6pycena++QfHPSONpYbcgyCSe8gliumxZ0nEmKIAc1kgS40YkZ5Vbhwq2Tqv7u216wIx5Ghm6yIh8Is/JqWlk+eH9/DNOCvklm4r8H7b1RNG0wtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pfn/vN1s03AKEptwEimVi61IE+URmi6A5zNLtSewv74=;
 b=b5t0gB0O04hAgUTJCcWPiy4uz8Q9NE1j6yvm1FBDdq523WCponE90piylRjS5ND096WF9+PQaxal975443IJSrA8jXH1YE4yaqmbVwc8fU0oUWQiiaDNHvSkZcwvvr3NGpEebWsaKfVvphsOlXcYoHzdrkNxZuPwa1JT9nZsdW7xL4t9r3ie5IuU1TlcqcDdUnz7e4FFw501NiGMdZM/IZUpavsgFT3zSIU9RgtZu/bl1OMJt8O0w69I6Fj/0Vail6BMi3MEqcbBnd+KG/41uPWv4K2bQF3kRl0R+QPxu06NrqH40lU6oCsTh2E6npAL1K8r2jTf7bIZBhfj3qqhNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com (2603:10a6:501:97::14)
 by PA2PR04MB10424.eurprd04.prod.outlook.com (2603:10a6:102:419::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 29 Apr
 2026 09:29:52 +0000
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43]) by MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43%6]) with mapi id 15.20.9846.025; Wed, 29 Apr 2026
 09:29:52 +0000
Message-ID: <484067f8-aaa4-4d05-9e35-be9ecb0de41d@oss.nxp.com>
Date: Wed, 29 Apr 2026 17:29:43 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: freescale: add i.MX95 19x19 FRDM PRO
 board dts
To: Daniel Baluta <daniel.baluta@oss.nxp.com>, Joseph Guo
 <qijian.guo@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 xinyu.chen@nxp.com, justin.jiang@nxp.com
References: <20260428-imx95_frdm_pro-v2-0-434240b652f4@nxp.com>
 <20260428-imx95_frdm_pro-v2-2-434240b652f4@nxp.com>
 <d0dc01c7-dba1-4f25-88ea-a0840559cf38@oss.nxp.com>
 <bde82660-0550-4614-80a2-bf4f49b92063@oss.nxp.com>
 <f7257d2d-61d8-42e1-b589-874da203d851@oss.nxp.com>
Content-Language: en-US
From: "Joseph Guo (OSS)" <qijian.guo@oss.nxp.com>
In-Reply-To: <f7257d2d-61d8-42e1-b589-874da203d851@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::19) To MRWPR04MB12117.eurprd04.prod.outlook.com
 (2603:10a6:501:97::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12117:EE_|PA2PR04MB10424:EE_
X-MS-Office365-Filtering-Correlation-Id: d3ea232d-bd06-4ad0-e304-08dea5d1dde3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|7416014|19092799006|1800799024|56012099003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	YPO+PAQDl55jIY4ijUxcL45PVupFQn4T/a5aPwigfKO7f2/y0jQeT4YxYTNvqeZLizno9NHVSdNgOoYZDaTavkIlz6ETfNbqmD1rnUZe+FjAVTGQbQYJaUhYvXWF8dw/9pQN/7yAWSJOGvOvAqsPz18nZi2ROilAJXCud6+xVAH788XYg94+HM2UbqUosUMyjtFXjN62v92qDcIBefDAscYJPIuYM6M1XwvgjVqps+CgxE4deuRBjfV5DHrquN9k55y1I3p1zyfr+NW+pO5cxyo4mp677bWzIn4WCbNiZYMeLSYoj28mJg60k2uUwOQdPINiwyAB9R/2DTRcQqt/RELCMPQuwnketfJ4SPjMl8RukWBmEJer+cJPkeBHp0VxmzRNpHZS3pm9kYnX/5WcTM4v9scOzsELmIfzDo4dE6mUT6yMRaIXlXdLcYn21JG/VguUYYrt4PrBlkve0QYkLnwIghXgMepGJGoI6McpGRzLFw85/1rqXBsQ6oHoiUzBssEadTSUQhW1NpmY22aCscJa1brxH3Wrp7IGVIwulamHttRwMMjjktIvJVeqzdWaK5Sh65ow/p2xeFvdvHdzxy8ZOfSdysVojKuRFUbvIkpS8mkx2cH/c9zH8gnB5CIRllsOCPYAgnijL8POrt4GFpw4qLjZQIa1tPP0dFnP9I7Ac1tI3d82Mmgp+kDMCknvllYSdkC8U6ozAKf5zi2X1lUUo8G+fmZlZ8JoNlA4oJOnDVoFaDgB/+fZ1qsIhg8VlkUAIB+ynCb+L+xtAbUxNg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12117.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(19092799006)(1800799024)(56012099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFR5T2xxQWlqUkFtamNpRzhKWlpmcnNSZHlzRjVoQVdKVnlISWNNZStXdW9n?=
 =?utf-8?B?dnBuMStGMFQ5OGFiWlBPVGhVYWtuM1c3emVtWjhLNHVnek10aEEwdHoyZnRW?=
 =?utf-8?B?TTlHNk1OR1JuZGNxcTYvS0w0TWxpaU5wdFhkN1pJUldpNjJPbUNxcVhsRGx2?=
 =?utf-8?B?UjNBYmNKWXVzbDAvZUxScGFQNGNuMWxhN1o1UFhoTzBxMU12TS9CbGkxTWZm?=
 =?utf-8?B?NEN4bFQ3d253S1lCN0J0aXB1NjFPSVFjcU1mMzZPZmNKQlhjR3JtSDNsa2hO?=
 =?utf-8?B?MWpkMVBWV1dyUm9uTjFnQTdwaU13ZWhNTEJTUFRwbFlyOEk5bGpiUER5bXJx?=
 =?utf-8?B?UjZhY1ZOb3RndFpKRERUdjcyaWt3KzBoeE5nVmUzNG5xbUNxa3o5bU1FWC9v?=
 =?utf-8?B?TGZwRTJEOWo5MG85cEJQQjZPbnlJWVAwTDlLcHlSSWZHcXFFc3RBQVZkcFpk?=
 =?utf-8?B?UE5GSHFaSU40RTJWdTJ0clRyNzNJYjZYTG9RdERJa1lJYWRaZlQ3ZnRIV3hu?=
 =?utf-8?B?UU10ZE5ZOFJzZ3hQalExZEl4cW1NSkFqSE5FSXI2VXByUXVhczhnSTF1aW5O?=
 =?utf-8?B?YThaYll6MjYwNGwzRkpUUjIyVkd3L2hhQzBIcG9DeVpnTWJjeTh1T2hnTDlo?=
 =?utf-8?B?b1l4UVB2Nko0aVVLclg0RHZhc2pnZ2xqOG5kSVQ5ZEdITWlua1QrbklDSmFD?=
 =?utf-8?B?SHJlYWF3ZnJMeGRoVHNVcFRxYmdPUFFOb3c3ckJBVU1ySGhHZFY3SmpXWmk2?=
 =?utf-8?B?TDBkZ3pSKzc5OXFVOWpFK3RNQ092ZUQxWlBMaXh4R3VMbkY2R1V3MDdRQUJM?=
 =?utf-8?B?RjVyOC9MRWZ4dHlFTFlBdWZ5b3FLdlA1TXk3RnFXUExHblNnVUVya0crVTFa?=
 =?utf-8?B?V1RjazN4M0J2UUVzREZONTBJNk12VnJQQlllR2taUXNWTHhzek1qMWl3Yitk?=
 =?utf-8?B?ZHpJVDB2UWdwMFB3eFFma2NrUUtibS95UGJ3Qk83bUx0SlBtSFl1eU9Jcm5R?=
 =?utf-8?B?Nk85cFBWY09MVHNEdXFoK3FDZWh3bm5IMldaVDFEaldNR1RXQ0tZSDFTZ0sz?=
 =?utf-8?B?V3hscDVKeXdaZnc4MTZuTzhWU3gxMFVOejF2ei9CNXdobCt6VXpTTTBjRWlM?=
 =?utf-8?B?cUgrdXVUS3lMZHFocTZoZGg2RWd4SDVmNDdweEtMV0NhY1Q4TTlycHU2TmJQ?=
 =?utf-8?B?cTBOZGdyMHl3aUwyS0VvMGRHaTRJNndGSlVMOWRTVllNeDJ6MUxKM080cHBx?=
 =?utf-8?B?TkF0Qm8ydkNyQTNUTVJrWElxUkF5bXdpL2ljSUd6VTVZTkt2Z0s0ZGJLdFhG?=
 =?utf-8?B?RzRBS2toelZzMzZJejhaRVNsaG81STVneEZuRW80T0t3WkUxL0JoL1QvZlNY?=
 =?utf-8?B?b1VaclRlUHJBZTJUbU1NTEZUZjVPelFWY1BkNU41VDhmK012UE9ZWDBNNU5R?=
 =?utf-8?B?VE04cWNIMFpkM1pCck1ubEtsWGlqUXpMTXYvdUwrTlNPZEtBNnhKUnVOb1Nz?=
 =?utf-8?B?ZGg2U2g4M1B6bmZVNVpzRzhwa2hzN3hVbVNSZ2IycnhlakV1eVQwUVBKYSts?=
 =?utf-8?B?YVpJUHZ0cmF1WVd5NnZtVVh3Vy9sOElkaDZSMHc5NDZZTWVKY2hndU9rOUU1?=
 =?utf-8?B?REhyRUhwN1pWenVPV3owRDNNcjQxUy9zQUUvKytyMm1VRUhTMG1qOGdJUmJW?=
 =?utf-8?B?cVkvS0RUOCs5TVRiaDdWTGF5d2JOWGZFM3VsOGltSVJqRVZPb3EwVDNIWmJs?=
 =?utf-8?B?bVZVcTZCeHdIRXZKK3JKUndobVB0b1VxUm5FNnpsbzI5aVdoSyt1M1JrRGM3?=
 =?utf-8?B?ZDV5MnhVS2tGRG5idVk1TW1CR0U4cGFuY3lqU0c0WDIwWTUvWWo1Wk1YVVRh?=
 =?utf-8?B?d1NFTkRNM1ZWT1JEOUw2elM4UC94WFBpWENSWUcreXQyVklSeE9Bd2xmTHNG?=
 =?utf-8?B?TkpYOVZSVUwzSXhNekRPZVZmYU1rKzN4b05lZTBnMmFDb0I0aFpXWW5raXF3?=
 =?utf-8?B?NG4zYWlVN0dYQ1pIMmhkZHpUaklzdGYwVUtuNTU0UmljL3piVVEzS0d6ZTc3?=
 =?utf-8?B?UmlGUUFIZDh2T2JMdlZhY1ZNOWt0djNnNG1hdWV3UDJ6YTFscFdjUXphc1Vy?=
 =?utf-8?B?UEZwMW4xeTFUbU8wdTlvWEFwN2ZDbEhmQ0FidkNzSjNMakJsa1gwcGNxd0l0?=
 =?utf-8?B?a01Md0ltc25iZ2daMC90UGE1bS9DQUdRNHAwZm5lZmlveFM2ZjYvR2RCMkNu?=
 =?utf-8?B?WktWaWlvSHJGRXA5RWZFS3laaE00S213WTU4YWovcGJMM1cyM2F6eVJPSnlF?=
 =?utf-8?B?aFNQcDFLMXRsdnNhZ0k5MTFPSWhzdFZxa2xPdmlQRDlsRkZIWmVodz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3ea232d-bd06-4ad0-e304-08dea5d1dde3
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12117.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 09:29:52.5162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O5i2CYDqNvZ8IvClPiSUnq8wC9Vguan1p2wWjTSYEejM9OEontLquFCV8WqLOmzD5xEby7GQijKu9t5qn5dFsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10424

On 4/29/2026 5:31 PM, Daniel Baluta wrote:
> On 4/29/26 12:26, Joseph Guo (OSS) wrote:
>> On 4/29/2026 5:26 PM, Daniel Baluta wrote:
>>> [snip]
>>>
>>>> +
>>>> +&flexcan1 {
>>>> +	phys = <&flexcan1_phy>;
>>>> +	pinctrl-0 = <&pinctrl_flexcan1>;
>>>> +	pinctrl-names = "default";
>>>> +	status = "disabled";
>>>> +};
>>>
>>> Why add this if it is disabled?
>>
>> Hi Daniel,
>>
>> The resource of flexcan1 in System Manager is assign to M7 by default. But it is useful if we assign the resource back to A55.
>> The board hardware have the output pin of flexcan1, so I keep the node here but set it disabled by default.
> 
> Well then at least add a comment above to explain this. 

Thanks to point out this. Will add comment in next version.

Regards,
Joseph
