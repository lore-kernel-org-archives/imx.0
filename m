Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011064.outbound.protection.outlook.com [52.101.70.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FB136B06B
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 09:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772531099; cv=fail; b=HfyxwlBs2Teh5XUBUNsN69/yLur98wraGm5ad4UU1HpWahc1XJh+RVzPFgzPCQx3Olj4G+ahp5ixrMPbiYae+ilE0mVjZbKXIe3I5AHDX2ygHnrENLaJsc+cRI6LV6OUebn9fAjdu4Cu0Aefc0+RlfuFFaK3MtR/7PF6Iu71V5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772531099; c=relaxed/simple;
	bh=N8NtjipBeJFoj+fxpORXqJsv9V3aoKP/KfSDXEFkhgw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=BI+DFAZu0V7sJucxfUl/Wkt0s7APIIK6gUsDyWoi2rDEqNzn7uAAE5EXSd431sk/dX4Hpf1qgGd96OY+W1dya4/cmn0cppKMfGhwKvrYCz4snBc44yKun+EfGLLdL1vB1a1PANNaVwGNiwT20HhxBI7Bz/w428GUX49sRm9iNIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=EvdmgJSC; arc=fail smtp.client-ip=52.101.70.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="EvdmgJSC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RAjRVhLzMmxxUw9+yFEvMQ0GYC22SA5XmtrkaL79AEQlFr584nzde4FGHbiY0oy5SRwhbuQ8w/cAalRLj4ewi59GXPow6uIKCPI+AxXJ9UCef5aMnfO8l7oT+qf7ggH5gdz7tZ+k0EoXg0C6UKpOfYHLMYJSDskFw2SCCLHbTbf68J0ERzDp59MAJcdqYJ/JXWO7s16qnrsfVP4a56HRZa9sxlDDJJBYtzq1AeNMr5hXw92W4YyP34mdO/H4aD+xTHa67jibzQwLCZ7VHO8G0Hn4LhbKthkuUKo1nTE5/DbgsPoIZ0vKppS5zVP3A34S3+e5PW6aBVEKstPQ223MIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pDYJBG7jmhjliTPrMBvjeMwuimbYyI2vv4k0WphLWxs=;
 b=hNlXTyVfftjEOISupiqoofcNkrYqNxf8yhS97nuihM/fFPI4vaMzcKM8cEXDjWJrJxwrlgEb4/VOFQTA/Dlz8xd7FYLA4UB2uJa3qFDuUYan9Z6lCz2H8l5d/WVgBeNrfVMaAE+1UNOEQHKs2pqpAuXwenePNUL73g2UcVaTCmWipTQ+2Uy76Vhp2E98U6qedQ6riwYoX1WSan70+hSFc94XjMQsGjjCWwJvDDDccq4iL0CWT2oHbLf3/An+mUMKSQ5VIoZ7TBmV7WlZ0PuPWVH3ZKt6+0tQQsgu7kElXxz/3UW9dzhRTzLpg5B5JmQyow9WUB9uRkuFIf1AvNJ09Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pDYJBG7jmhjliTPrMBvjeMwuimbYyI2vv4k0WphLWxs=;
 b=EvdmgJSC96EW42bL7Hm37d5XH/drTpWSRixFajXU9tJ5izw3fuBr6lyzf6b4tmi///QRHUtE5FWeGKQomv3dJEoiScFlCFAcGETroR9Or51KU6BoEw2E5Ok+O4AadhJNmHe765rRplNnZr7Gcyz3Mbvur83KFMxGf62XofdNogNwvpb0BzyG8t/f2OsG7QJsPnVHgv7vXOV93887RAGV7MEuJ3lyDSMKsdsKagaiaWPFk7ZCAlc9EOnn5WFl8y2vxuiwiOIb08PXnwWTMkLolWiZ5YOqFjMlkVtwEo8Mjxg5fjBpE7X7gvaGZKGaRVd+JCmUavELvEESwFviss0FSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB8PR04MB7051.eurprd04.prod.outlook.com (2603:10a6:10:fd::20)
 by VI1PR04MB7007.eurprd04.prod.outlook.com (2603:10a6:803:13e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 09:44:54 +0000
Received: from DB8PR04MB7051.eurprd04.prod.outlook.com
 ([fe80::a5a4:c92e:b316:aba0]) by DB8PR04MB7051.eurprd04.prod.outlook.com
 ([fe80::a5a4:c92e:b316:aba0%5]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 09:44:54 +0000
Message-ID: <f3f6ba3b-3253-4945-adf5-40147fe751bb@nxp.com>
Date: Tue, 3 Mar 2026 17:45:57 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC
 subnode to schema and example
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 luca.ceresoli@bootlin.com, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, frank.li@nxp.com
References: <20260302-v6-18-topic-imx93-parallel-display-v10-0-634fe2778c7a@pengutronix.de>
 <20260302-v6-18-topic-imx93-parallel-display-v10-1-634fe2778c7a@pengutronix.de>
 <7d708ede-a576-4eae-b319-ebd54dbc5163@nxp.com>
 <4sofljffovrorpxe2os3jl745qfjoglvl54oqf3v7r5bk5f6aq@6y3jwn4abiqy>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <4sofljffovrorpxe2os3jl745qfjoglvl54oqf3v7r5bk5f6aq@6y3jwn4abiqy>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI1PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::8) To DB8PR04MB7051.eurprd04.prod.outlook.com
 (2603:10a6:10:fd::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB8PR04MB7051:EE_|VI1PR04MB7007:EE_
X-MS-Office365-Filtering-Correlation-Id: f4c99abe-b45b-4de8-3275-08de79098594
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|366016|19092799006|7053199007;
X-Microsoft-Antispam-Message-Info:
 cjHPqve2sfCAqv8x9DkjAuzyxVFK+SJDSj9lHRt1WtblZ8P0GP4gWWroSIlIwMIPKodzxtBpYHonEIA4rK40XdN0lIDRbnttz9UeYHT3utNxKA90HJSx4xOIigfjlxxkl9w7UKE/zv7vJsSFXCDkqz9opxUsrYBd6sRBwUQgeE5DPPBbPwkA/ZB4Pp3GrGcwgS2Emf2aUucz2yspZp2JMSvI8SczIskLHNODNans+AcUuOCbqAsyXzr2R2QvQIiMhmfukfAranQ+yL0EdzhE691xA8d3fSW2gW+nqODVph5AiJxSOBtwskhbUbv+qM8VD1T/x3fDsad0px6dRS4ASjpkbyJv36cXmgZrdpdNbiSfP8E5jdoQSHE9z8KHUI/lF3VN8E62g60/BjaTsChHwzDbW9a/ZMXXV+JmpJ7NAwfGq4JE837yDrn/+54J6bBM1tkRz6gqQbnLQJn5VV7qoeqsAXAKpcbzw1IWXMOkL7H5fiNYghLXCFWiP9OvpAlITDqDor/HdGFKQpl8fYIq+piKaUrGfv+LAGK3Ke1Tz7cXE06gZLgLIcO2tMLACEPGx8qskuBtMA46PjYk6DVTFKFB/4T6kLMjXDQW4Ti0WaVsIPEWFeuUzFDmXav00ZIsJpBkpnpXgtm+RuDah9aaIEFlsGbc3B9MCIiqzOipo6tXGilb9mQFQSaGRJF9e7p3EgwD89+1O69re7n3PG+grzePmQGyAgg5FryFytJ6eKM=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR04MB7051.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(19092799006)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?QWpGa0VpbWYrdmJjLzU2RDZLb2FhSVc4ZWY4azB5TnlyQUQ3Qk1sTkI4U2VE?=
 =?utf-8?B?V01MSWFpcHpvbVc2MDhpUG8wNWZSWTMzZHpmRTR2cDJJS09aajd1UXJLY3F2?=
 =?utf-8?B?VzY5RFdZY3JqMmZtZzlpUVJMTmRBL0w1b1UwMDJiS3J5UEliYlRBeEJLVzNy?=
 =?utf-8?B?Y2NNV0lYZ1FsMlNhc1VSSzQ2aWFtZ0JoYm1GbnJiLzljNG5EWFJaWk1sMlpJ?=
 =?utf-8?B?dzFDOXkvT1kreExiOU44cEVhWGtSTVNDVnVjcUd5Y3pnTnpDQ0diL2xUQ01C?=
 =?utf-8?B?Q0tyUHh5UFVidkg3QUpOOCt0UldnTVpNWTJDZ21iQzh1SnV6UnVUMmdMTlhN?=
 =?utf-8?B?T3NVbjQxN1RqTlJ2d3UrRlJXb0xxTkt2TDNmUUNTOWxjdnYvM0lKTytUUk1C?=
 =?utf-8?B?SEc1YU1LWEZ4QXI2SVNBVXdYdWVGN2NXUTZCTml5WCtMaXF4SDFJRFNxSXpJ?=
 =?utf-8?B?NGN1Wms2UWNoWTQxK0xkMU5CZDZwdXhHcVdCQmkvdkNyZWM2RDEvbkdXbjVQ?=
 =?utf-8?B?Y1hEQjFqOHo4Y1pqY1lQUnllWFRpdnFnQlo2a3VOc2I4R0YrSGo3OEFLTUUy?=
 =?utf-8?B?a3lSWUE2V1Q3M09MYk9OUmJjcmoyRHh0UklvaTRjaWZuN2RPcndSMElHL3Q2?=
 =?utf-8?B?Q1VyaldhRUxMTHh6UWF0NGp6bkdRZ2ZjRlVHeDhnVWdSdDRtME9zSDhHcnJM?=
 =?utf-8?B?U21sdk5SeFc1Y3JOeHlUYjNHNzJuRVVnNWFzOHFGTVN3ekt6VmF3Qm5YRkJ4?=
 =?utf-8?B?UEVIZy92TUhkTkFtNmZLM0E4MkM3Vi8xeHVjSlRtVy9zN1Fmc3NSS2hvc2pR?=
 =?utf-8?B?UHI5dE5yMlJ2RW1CeU5PaTAyUDdOVlRzYVhlNmU2YjhJWXFSK3NsTzJ1S3k5?=
 =?utf-8?B?Zm5iTEh2WXd0WWZldWtlQVVLZXV0MFNmVFNJTnU4SHhZeG9KZUppR29aUDc1?=
 =?utf-8?B?Y0Fja3lhVnF0Rk1kYThsZnJGR0w5R2EraWI1b2Vxa2Z4eUVBYUM0YndKaThH?=
 =?utf-8?B?RENDWlBKWUdXd2UrVVdIS2x2dkQrUkVjSUIwbFhHbVQvY3pWdzJrUXBIZlhx?=
 =?utf-8?B?VEJmKzA3NFBNV3dWWXN3aWdvRnBFZzBteXZMNGd5MVY2M3BhWkkzK0RJYlk3?=
 =?utf-8?B?RThaVjNuZzFDUFNiQnNmc1JSbWZEampKR3Ntakh6SW43UlZyOWZKYnltVmFk?=
 =?utf-8?B?dHhGaHZhMUxmcFNVejVlSHU4d1BqU1ptTVE4UE1GWnlBQzlNaXpkOU0rWkpQ?=
 =?utf-8?B?cmZNdEpMSlN2M1pITXAzcDVkQnhCekppRXdScStESlNKeGhLRlNCRTZFaDh0?=
 =?utf-8?B?WXVmRUJBbFFWSE92QUc5QmprK2wxWHhLZkprQ1RScDJkaVpBb0ZJclErYjN3?=
 =?utf-8?B?RjlrcUg3VExBQk5FeXVsU2J2SEEyNGpDTUhSeVhuUjNiVzNrNWFyWmN5U211?=
 =?utf-8?B?bmhpdkZOVnlUVHZzRm9QbUFzMlR0cnFnUXhPQVZUVzhNK0pTUnpnUk5hdzNW?=
 =?utf-8?B?RndSR0orOW5wWG1EQURZMXdBa09FbERlczh0QStVTFlJa2RwNFNZME8yTEsy?=
 =?utf-8?B?L2Z3T3lGbXlCdm43dTFVTXlEQ0xwVVpKVk9lbzFHQm10ZUZ3WFovWm1DblRS?=
 =?utf-8?B?cnNzN3VLRnRJcGhjMloxMjFudzhScVBkRWxlc21ZTGVmQWtURXdMWU5xOGoy?=
 =?utf-8?B?VFN6Q3VORGNrQzJsY3BrOWVUR0ZFWmh2djZhWFVjOE1MYWRzdHlLUUlrS3ho?=
 =?utf-8?B?VFkxUFBLVFhoNW9qSFhjUTFTMlVYRW5QamNqd0ZtQTR5KzVRVGhzWUQrVDNk?=
 =?utf-8?B?eWl4aGsweDhlYmNvUG9JTC9nNFRqaHV0RVRRTmRuUklWZ3ZCUG9Deit6QXA0?=
 =?utf-8?B?cUdxZGlkTkNuWkp4V2w3OWx2ZWM3SnhKcUdpdkQrYUQrbVkxUlJFbG9UZW92?=
 =?utf-8?B?bWxTOEJ1TXloRkhBUWRURTd2MjNWOG5FdGF3NE9VVkNUTktCaGZjdklBY2k5?=
 =?utf-8?B?TUxNT29CU1UxUm1uRkU2NUc1bW5ndmE2anliRnZmZlYxTktYS0dSL1FLRHRh?=
 =?utf-8?B?WTJNbWljc2o2UFRGSzNrM053Z1VsakdyTDRkcWpyaDlib3ovN0JxRFA5dC9K?=
 =?utf-8?B?Q2ltYXpxUUttbzhqN0lvWURmdkQraU5CTjRqVlRZU3BUc3o2bDk2QXQwNlk0?=
 =?utf-8?B?dDZDbTRrNFFUUDR3YmZpWHZ4R0lFWmh6WUFCWmprWXdHc0JaZy9FS0ZFY2ZP?=
 =?utf-8?B?SjZzemYxOUhBSHYrNmVDNVkwNDc1YzVpK3RzNnVMSThHRlRsUEMxSUlpeUxv?=
 =?utf-8?B?ZG5HQjNKci8waC8raGRqVmNHTlZLdFRBOHRWMFI4SVZ0VURXLzVOQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c99abe-b45b-4de8-3275-08de79098594
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7051.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 09:44:54.0136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xLLXECxA7GPjReO3a/zNylGLd6xbNxfyTfr/uykEyPFe0ga7wAN6RvTH8qKNir/2j3paVMEw4HLucjk6izw54Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7007

On Tue, Mar 03, 2026 at 08:59:58AM +0100, Marco Felsch wrote:
> On 26-03-03, Liu Ying wrote:
>> On Mon, Mar 02, 2026 at 05:10:40PM +0100, Marco Felsch wrote:
>>> From: Liu Ying <victor.liu@nxp.com>
>>>
>>> i.MX93 SoC mediamix blk-ctrl contains one DISPLAY_MUX register which
>>> configures parallel display format by using the "PARALLEL_DISP_FORMAT"
>>> field. Document the Parallel Display Format Configuration(PDFC) subnode
>>> and add the subnode to example.
>>>
>>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>> [m.felsch@pengutronix.de: port to v7.0-rc1]
>>> [m.felsch@pengutronix.de: add bus-width]
>>> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
>>> ---
>>>  .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 78 ++++++++++++++++++++++
>>>  1 file changed, 78 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>>> index 34aea58094e55365a2f9c86092f637e533f954ff..d828c2e82965c7a4cd69a67136047d83c96b0a35 100644
>>> --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>>> +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
>>> @@ -40,6 +40,58 @@ properties:
>>>      minItems: 8
>>>      maxItems: 10
>>>  
>>> +  dpi-bridge:
>>
>> Cc'ing Frank.
>>
>> fsl,ldb.yaml documents fsl,imx6sx-ldb, fsl,imx8mp-ldb and fsl,imx93-ldb
>> with a reg property.  Since all of them are child devices of either GPR
>> or BLK_CTRL and this dpi-bridge is a child device of BLK_CTRL without a
>> reg property, how can we handle the inconsistency?  At least, with this
>> patch and the current fsl,ldb.yaml, we cannot add an i.MX93 LDB child
>> node.
> 
> This reg property was longly discussed and there should be no reg
> because this 'reg' covers not only the PDFC register fields. Please see
> the discussion:
> 
> - https://lore.kernel.org/all/PAXPR04MB84599D676EC1E3879694579688B2A@PAXPR04MB8459.eurprd04.prod.outlook.com/
> 
> The LDB node shouldn't have a reg property in the first place. There are
> a few registers within BLK-CTRL which belong to only one "IP" like the
> LDB. But these are the exception rather than the rule. To make it
> possible to abstract _all_ sub-devices within the BLK control you need
> to drop the reg property. The subdevice drivers need to handle the
> offsets within the BLK-CTRL accordingly, like the LDB driver already
> does. So removing the reg property from the LDB dt-bindings is the
> correct fix.

Hmm, reg property was added intentionally by the below commit.  But,
I'm not saying removing the reg property is not a correct fix.  Just
feel embarrassing to see that it was added and then to be removed.

16c8d76abe83 dt-bindings: display: bridge: ldb: Fill in reg property

Can you contribute patches to get this done if you think it's a correct
fix?

> 
> Regards,
>   Marco
> 
>>> +    type: object
>>> +    additionalProperties: false
>>> +
>>> +    properties:
>>> +      compatible:
>>> +        enum:
>>> +          - nxp,imx91-pdfc
>>> +          - nxp,imx93-pdfc
>>> +
>>> +      ports:
>>> +        $ref: /schemas/graph.yaml#/properties/ports
>>> +
>>> +        properties:
>>> +          port@0:
>>> +            $ref: /schemas/graph.yaml#/properties/port
>>> +            description: Input port node to receive pixel data.
>>> +
>>> +          port@1:
>>> +            $ref: /schemas/graph.yaml#/$defs/port-base
>>> +            unevaluatedProperties: false
>>> +            description: Output port node to downstream pixel data receivers.
>>> +
>>> +            properties:
>>> +              endpoint:
>>> +                $ref: /schemas/media/video-interfaces.yaml#
>>> +                unevaluatedProperties: false
>>> +
>>> +                properties:
>>> +                  bus-width:
>>> +                    enum: [ 16, 18, 24 ]
>>> +                    description:
>>> +                      Specify the physical parallel bus width.
>>> +
>>> +                      This property is optional if the display bus-width
>>> +                      matches the SoC bus-width, e.g. a 18-bit RGB666 (display)
>>> +                      is connected and all 18-bit data lines are muxed to the
>>> +                      parallel-output pads.
>>> +
>>> +                      This property must be set to 18 to cut only the LSBs
>>> +                      instead of the MSBs in case a 24-bit RGB888 display is
>>> +                      connected and only the lower 18-bit data lanes are muxed
>>> +                      to the parallel-output pads.
>>> +
>>> +        required:
>>> +          - port@0
>>> +          - port@1
>>> +
>>> +    required:
>>> +      - compatible
>>> +      - ports
>>> +
>>>  allOf:
>>>    - if:
>>>        properties:
>>> @@ -112,4 +164,30 @@ examples:
>>>                 clock-names = "apb", "axi", "nic", "disp", "cam",
>>>                               "pxp", "lcdif", "isi", "csi", "dsi";
>>>        #power-domain-cells = <1>;
>>> +
>>> +      dpi-bridge {
>>> +        compatible = "nxp,imx93-pdfc";
>>> +
>>> +        ports {
>>> +          #address-cells = <1>;
>>> +          #size-cells = <0>;
>>> +
>>> +          port@0 {
>>> +            reg = <0>;
>>> +
>>> +            pdfc_from_lcdif: endpoint {
>>> +              remote-endpoint = <&lcdif_to_pdfc>;
>>> +            };
>>> +          };
>>> +
>>> +          port@1 {
>>> +            reg = <1>;
>>> +
>>> +            pdfc_to_panel: endpoint {
>>> +              remote-endpoint = <&panel_from_pdfc>;
>>> +              bus-width = <18>;
>>> +            };
>>> +          };
>>> +        };
>>> +      };
>>>      };
>>>
>>
>> -- 
>> Regards,
>> Liu Ying
>>
> 

-- 
Regards,
Liu Ying
