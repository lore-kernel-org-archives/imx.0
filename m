Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010005.outbound.protection.outlook.com [52.101.69.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDD7355F42
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 05:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780895682; cv=fail; b=clK2J2dTc3iKAOezNrvHtb5COWpM/032/lmMTwTmoJc8hFR1pCdFhk6Q+3XUbPkbFTQqrQHFgBcIJgT3Ha0a2m93BNl2tFzRXkmB8SZJMhh6mjjQ/LqfoQDkCffFhukuTR3dmGJRlPYtyHqY/dmsUUqPnHw999ONGy+nEVwpJO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780895682; c=relaxed/simple;
	bh=v6npz3ZmfzqMyptUlE6Syv/7oDIC0lrNhSNVEeuRyzI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dEKz466pmrHh94Wu2cSaMpRND+bINB8kaTsNDXl7w0O10G7JvmkYGjcIS7Mi3voHvjWKBCE58Ltc3sRMqCoYNV6My+bnG1JGgvUGXIP6qV2t3PtsCZqm7uGx0jat/L1dMRHwktTnIJJvY31MZqQVIy9d3UHKZGxfrgUErVR1hk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NSr74SmY; arc=fail smtp.client-ip=52.101.69.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NSr74SmY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gksC/pKBKXk4FzOR1rgvVN7LOqeJUNA7twckBOc2D/27KM/fI3x1jc8kZS8ShW1lJq3feVcXQlRYsaG8MSaW6zNdHtS6ePzkqp03jNNfQfv+adA8H+kawKo0eXuoe4wN/UjxwToKn3fdNjjOUxlzn75rSk4Q3B52XsjajQ7zBpl6MqzGWXCbvdmu98NIkTJdQOs9BfX6aEL6BCjRwGA+25SjL4kUDIy70CqoaUbG7QTMN7qB5lktt8YYN+Y5DjK+ZDLE/9DnIcNVnotK/oB99ucDoslCm37+umZqeJTWJT2NoGuqP5iSqL+lmotr/JyOBd80C3DP5N2RmmTlbXA8/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aXOk2szXVcVOG4CPjZyskleVcAylpVSUONzHXjDlirU=;
 b=TJn4EHRiKgQVb9nB8UhcVMWS9o1bapQ4rRQ7gFSn/hOYMVmSFHgbFnJp8Zj7i2aH8jOcpSKpmH/9t3p4I/B8d8eN1NSKN9NLBhAMdFoccka4wcpX8hwAOOf/eJUUOLZHukyUoGpWR35rytOgUj6lMjXyxF0kte3AEvb0h5F1qFDYa5c+oXyGnPMYQiVXmBOlVkVx+2ZLhvhMTusiC70HFXwWHVgk4Vtr1pI9NDHNMVful43hc8kpcVj4mOcNat2Noo2CB6St63PklS/UoQSPgjLxn00ErgfPo8xdPHyxoKHlVayAY3pajOY7uhNzLxPXD6qZ4bjsDit0NPtvGZmt3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aXOk2szXVcVOG4CPjZyskleVcAylpVSUONzHXjDlirU=;
 b=NSr74SmYg7MuSDax2V7xsYMXqCONAvQcBuiFQ0d9PsHMVglp1obJRmIjj9j7LUEbCHgpHg4YdJikbscln4BKLQAIgMA4105CxIZ496WPJC5RMkqDNcYpVnXtOMRKC3QQ+N/8/CBqCfQistW16NEenQmo1AxD4FQoP2UgTXHIoeiQgOacki9guGPl54pWVO8vjXrY3mYyfAf9wDZuJu+S2Xhuv9TrAhlstOC1j8D3p/G8hQ0FgBE31pAYKhunR7Q0l7kA8vVgctSs6JUIZdY6HvfqDM62T8R2sWLLSwPXSblTaTXx+rngDR7N6FlE1AIHM7wnab8lpIBA17ZMo7HNEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com (2603:10a6:501:97::14)
 by PAXPR04MB8542.eurprd04.prod.outlook.com (2603:10a6:102:215::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 05:14:38 +0000
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43]) by MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 05:14:38 +0000
Message-ID: <db95fec5-d8ac-4d52-ad2a-75e5593f99ef@nxp.com>
Date: Mon, 8 Jun 2026 13:14:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: [PATCH] arm64: dts: imx93-11x11-frdm: enable additional
 devices
To: Francesco Valla <francesco@valla.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 steven.yang@nxp.com
References: <20260115-imx93_devices-v1-1-b2c840cafa2e@valla.it>
 <aiKP3EgdrCbqtUH0@lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com>
 <_j4Ik3AsS5yfKb4Y7cSB1w@valla.it>
Content-Language: en-US
From: Joseph Guo <qijian.guo@nxp.com>
In-Reply-To: <_j4Ik3AsS5yfKb4Y7cSB1w@valla.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI1PR02CA0051.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::6) To MRWPR04MB12117.eurprd04.prod.outlook.com
 (2603:10a6:501:97::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12117:EE_|PAXPR04MB8542:EE_
X-MS-Office365-Filtering-Correlation-Id: e7d7f31a-bf9a-4330-7239-08dec51cd63c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|7416014|376014|366016|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	SU9A7xMyDYnSOdR5zitAMedbJscQa+MN0KI1V1wa3WiAW0dvRzRCZcVnGYuM/86Ygjf22ObV/usC8EYBoDV6B2hUCmoo/kkzl2DB9+ttRzTfFnkKZdZwNu3pINACJwViLMKl0HTuN7C+/gNAztHxXhtZxL6DcCx71H7/ZGpiaR/RxhT5qwCYTpvKp2WjVjXUIYdPBsPgDlwB74T4IyPyr5lfEG5iNEXKG6R83CsK1LmnYHKCb5nbzfIMqx5L+KRVyiYbLlhfi9mWr+tqWZUqdCLSLlU1fvy0HJ/dhFMqZsavFH00GEWoZqM0laN688KQ4Y9ynosRjmHOAp+bMKZfVK+Hrx8Z3dK780jxjWEMITowQd2meOQ1uKi5qTg37r3NimfcFT886e3k40Ey/8IY+r5LZ7r1SdiIFeOlPGMsJhzuDsN/cee2f9+YL421QR+7SB64WXBv/paGx8cUa+EYZ9A2yhy+gqiS4wIwpVDXKYZjrH3k9gISQCjJIQHdzidQexhqcMIcnrkmPmtqPTqTNp71VfaRKYEPd7/RrD6+2Zi/6K5Iyub4zS40e7VTyawHv/0cfHRX1AnMj0KckcOq056i8rAYFg6OjqDWIFfODQfi5AOnVbpkCe6KCyqDGmGWZcUjUD6agHdi644iDunxwm1+kOvw7fBcMXkGuThIaNtHsQEn0YDAPj0Hq1pGyPyW
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12117.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(7416014)(376014)(366016)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEtWeE50NmpXN2dzNFR3UXZZS01CbUVWc1RsUERDQ0FqSERHYThoNk8yano3?=
 =?utf-8?B?akhmaDVnTGdiQkpXd0VHNnRLWi91ZGtEelpDV3BkRlYxS3Fjd0VHd1ZCRDRo?=
 =?utf-8?B?UzMzZWZLZUM1T0FsLzdUNGZ1NnM0bVl3NC8rNElSemxVYVZrK2FzdzZONE85?=
 =?utf-8?B?UUlNcmh2eDZrMnk4bEV5MUhMV2ZuWWpiSjJtY1J4SVdUbmRyQ1BHNXNLd2Fu?=
 =?utf-8?B?aEZaUkhyanpvTTJTdDNMSHVhRDdVMlFFUVpKd2c4WkhPcGR1b1FtZzZ2azVr?=
 =?utf-8?B?U0VLdjhTWFNmSHBZQlJPVU50VUgzRGpMdmZDM0FzS0tqODNKVW9PWHNCNi9x?=
 =?utf-8?B?ZEcvcUxyT0tXaEZ0MEJCOUJ2M1lSYWw1NytKTVFLWEFmSGwrMUFHd3JEK0Uy?=
 =?utf-8?B?V2tCWFlVSUxtSWNKOC8wRloyYWtWY2RKWE1rTUs4aGF2ZmJyMXB6MGdqQ2ZD?=
 =?utf-8?B?OXdoTUhzVlE0cUhpWmNjYWxoOWdseWlpSlpNcGc4QVFzbDNRTUpDeGNLTUJI?=
 =?utf-8?B?U2FqYjdvbDFJM0NHcTVzR1AzSnJodzNTdU9RaG1maUltTkpzcXZQVzhlVU1n?=
 =?utf-8?B?YytBMndneUEyUEZjNzJCQmZzVThqMVN2QmpCS1dTUU5hcXZKdnBXcUwzK3Q4?=
 =?utf-8?B?bm12eHZaMGF5TjBjck9mMnFwUHNxUXBvV2hEUkUyaTNHZVdOSEtoTm9Ya3FR?=
 =?utf-8?B?aVltQnNvN0xsTldkMnJRWlFMQjNLTm1pbHdmNUxscERUb0JUSmJyUVg1ZFJn?=
 =?utf-8?B?OFhTYmpqbWlPdGVhQ3J2QVdCeWFLeTZMSWFIQ0xybU1BN252eUhaVlRTZEJj?=
 =?utf-8?B?aVJlMVh0emlJcDZlRUw4UlVHMWxQV0QyNEJqWEZmNHdVNzhYSmpoY0Y3aEFn?=
 =?utf-8?B?bTJETXFab3M0bGswSVh4TEJzeGp1SStZNHZEVm9ZUzkvamN6YjE5LzArR0tv?=
 =?utf-8?B?MVBqK0lqeUVWL25yWlcrNzdCNUxQUmRGUm10S0JOZnQ3YTYzOHZvMndvWHM3?=
 =?utf-8?B?enEvdjJnUDh2VDBpOVhqbVBadXVDbW02bUhSL1liRkFtaURnNUZMamdhN2ll?=
 =?utf-8?B?VUpXdkZ4Vks1TllCcmt2U05xU1RlSVVLQlRVMXhPYzNqdUVsblcyQk1mWUVn?=
 =?utf-8?B?Qmtxb1Fpa084NnBJTVlIdldobzJiWi9nWHpEVXZhTnNEaVM5WG9vYXJKRW9W?=
 =?utf-8?B?SW0xRGZmRklaN2t0eTcwQmhhdVdydVFXTlowYy83b1VIV245RGYrZndERUxG?=
 =?utf-8?B?enk3M0Vjd29BZ3FPWlBYOHdUdmZVampramgyMFk1V3VkUGVMcFRQcTdBaWk5?=
 =?utf-8?B?UlRNZlNkbkh2Kytrd2JCWHdObDdPbXV2VkxwQkhLVnNlNEF6SE95UnhNaWRj?=
 =?utf-8?B?Y1V0Ym5kOXZnNXd6R29GenVGMU9kN3d4Q0lhdldMa2VaZlkxeWFxalRqSktU?=
 =?utf-8?B?Yit4Z05lUkJBOVJwcnVER0F4bm5kbDc0dUFoSkdRcVpOKytHN3BCUmU4RVhz?=
 =?utf-8?B?alNQUlNBM3VUL214eUhXMmJsRmhjWW5VazF1UUJKR3lNbnNMUTlZQ0NidVZB?=
 =?utf-8?B?blZGTnZHQ3MzamVMRXovSXBvSXJRY1NmZkNnaHZaWE5BbzFwaGZIaytURkdv?=
 =?utf-8?B?ditsMlJCc1U2ckZ6OFpzdm44Y0t0KzgvK1FSWnk3RkMzU1UyUmNYdk9Zc2w2?=
 =?utf-8?B?ckNSUktrUFJyUXNWbEowSVJPOWxoYStyS1V3V3RNbmVvRndYSmVSYzcvaVpw?=
 =?utf-8?B?bWhpOFBBT2ZTRklkTHNmTExrVmpNbVorQU5aaHR6dkEzSS9pK2hqYlgyd0Ri?=
 =?utf-8?B?U0owbWlzMUgzekgwQUVBbkdYZFYzS0NmQ0FlcEJoMzJ5UjJxMmRGZktMWElQ?=
 =?utf-8?B?VnI2V3drWExrYmV0STcvNVh0WjlrSzRLdHRqUktESEtsRkR6MTZ5ejVubmMw?=
 =?utf-8?B?S0RjVmwxeE8zVjh6dUdsYkhuajNieWRkWVJlaWxLelczUUtGTFVqcmloWjFC?=
 =?utf-8?B?UGZVOGw3WWc5WGhQdXUweG1ROFhBbnpzVGRzMlFYZ2pKMWFKT0NvZGtWUnZq?=
 =?utf-8?B?TDNPQkZYekkyR2hJOVVyQWFKa2l3bjVJeGJzRTlvcFhyRE5peUxGcnV1T3VG?=
 =?utf-8?B?MFRzK0d4dU9TcDJnSWd4eUk5U0h4NW1yUGtzTm1WbVQxQmhpd1UxNTAwbjdT?=
 =?utf-8?B?MGRzS3BwMVUxdFQxRElOQktKd1lBV0VERWVweTltVVpYVW9iOGFDTUJhdEZl?=
 =?utf-8?B?ZEYzM01yZnQ5bitVRXZYUk9sVFBWdXl1aWZOLzhKeFNReWdrdkd4Y2RlV00y?=
 =?utf-8?B?UlAvTnpScXEvbUU0dVQ0NDQwLzM2U1p0NHU3R2o0dEdORHJENmJwQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d7f31a-bf9a-4330-7239-08dec51cd63c
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12117.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 05:14:37.9605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0LV4O1yCwsw+Zow6r0hN9ZPCghMlRLds85FKRj7PQigmDwUCuwxOBW2jKwDaxm90A7rDIM3ToEHPDjVSmfgUGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8542

On 6/5/2026 7:36 PM, Francesco Valla wrote:
> Caution: This is an external email. Please take care when clicking links or opening attachments. When in doubt, report the message using the 'Report this email' button
> 
> 
> Hi Joseph,
> 
> On venerdì 5 giugno 2026 10:59:08 Ora legale dell’Europa centrale Joseph Guo
> wrote:
>> On Thu, Jan 15, 2026 at 06:11:34PM +0100, Francesco Valla wrote:
>>> Enable additional devices on the i.MX93 FRDM board:
>>>   - CAN port and associated transceiver
>>>   - Bluetooth portion of the IW612 chipset
>>>   - WiFi SDIO port
>>>   - user buttons
>>>
>>> The WiFi portion of the on-board IW612 chipset is still not supported
>>> upstream, but since SDIO is a discoverable bus it will be probed once it
>>> is.
>>>
>>> Signed-off-by: Francesco Valla <francesco@valla.it>
>>> ---
> [...]
> 
>>
>> Hi Francesco,
>>
>> Do you ever tried bluetooth feature? The bluetooth failed to scan with
>> 'device-wakeup-gpios' property.
>>
>> Regards,
>> Joseph
>>
> 
> Yes, Bluetooth was tested using bluetoothctl, I just briefly re-tested it
> with latest master branch (7.1.0-rc6).
> 
> Can you clarify what you mean with "The bluetooth failed to scan
> with 'device-wakeup-gpios' property."?
> 

Hi Francesco,

If 'device-wakeup-gpios' property is set. The bluetoothctl can work, but errors will show up if try to scan the bluetooth devices.

[bluetoothctl]> scan on
SetDiscoveryFilter success
Failed to start discovery: org.bluez.Error.InProgress
hci0 class of device changed: 0x000000
hci0 new_settings: bondable ssp br/edr le secure-conn cis-central cis-peripheral iso-broadcaster sync-receiver ll-privacy past-sender past-receiver
[CHG] Controller 20:BA:36:5C:B0:D8 Class: 0x00000000 (0)
[CHG] Controller 20:BA:36:5C:B0:D8 Powered: no
[CHG] Controller 20:BA:36:5C:B0:D8 Discovering: no
[CHG] Controller 20:BA:36:5C:B0:D8 PowerState: on
[bluetoothctl]> discoverable on
Failed to set discoverable on: org.bluez.Error.Failed

After remove the 'device-wakeup-gpios' node. The bluetooth can work normally.

> Thank you
> 
> Regards,
> 
> Francesco
> 
> 

-- 
Best Regards,
Joseph
