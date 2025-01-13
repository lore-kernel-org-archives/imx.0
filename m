Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2069.outbound.protection.outlook.com [40.107.20.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBC61FDA9D
	for <imx@lists.linux.dev>; Mon, 13 Jan 2025 09:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736762397; cv=fail; b=ppczeHSoz6mcbm9NareJex1EuK5jF2PLUHx/SnirL8Sj7Biom7F72rtgZq/FGff8yFOOUTsV1RN/YhQpSuffLDgUIRmTQyP+V1Rx9GC05KmU8NgAsM46N+DDb2+0PRsnpaotI2eT+3GBnLXGNnikvRYHADwbrbrQLq8dxz9/3HU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736762397; c=relaxed/simple;
	bh=z+1E3cpHHkZyVRqkc7eOeEykTX68vZh4dSyChe9dWhQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gyQ/q6DHW23UpQhTHPKFwEwsiPBGEeqajMoXsUVk81nZOkBKjVyHWtm0Khe3Wq8n/zVNTUwM7X4PhmBw96ouVjspBvtZ6vxIG9ZinJAIHDiQ/scnvTQOqRTtUCD0DQfN+rMIyWS9QHFBx68qB9Gie2/QdRwgaJYfNIJxQj2wb6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bPLiSVeV; arc=fail smtp.client-ip=40.107.20.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bPLiSVeV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L8yL0nXWPdyRUGEzgceFaZGiVvuIamb9Z5nvzlI1qAvI5rbHYS0B0wETo+m/DXXNhxrY1m34YER/1cs2rgTTl0qMp+yKdSEkf4llNhFt9rcS7nR3S9rfAo26LMYzRVhMcESMac4GtJJekVMvi7sWqCxhfNGMm/I1f2LhrnzxY+gv0CmZzGsmPJDgQ/4u/qnnLJKntRfrK2Et+weSHuUnu3iWzgrbAoMzStKyJcRM5PuhBBb/z5rni+4jUNlM2Oh9SkGZCNBe0voHVK6FgX4CNSyu4u8ySgSzL544y2ZvVRHa2ywyuupm4LkGu0bukWzw3z1BZkkD8b8VhCefHFQSQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sC78zOLb3EqoTlIktVC/wGswCqA7u1rQ8lzCIlhJdC4=;
 b=KnZW4EdnVMMNnROu/lnWp5evCev/aJKgptqRnmRv57CoQ0EaYIU/x7pVQijyHJn2yNYfTd/oh0XluDlNMGoKo8givinErX+hCc+MS98mMQEzHq0eRkeDb4u5oIGPplioR9lg3epf+3Mm2rg/L6K7WiPSuiFU9KnRoLrzV80Xq7ta7SzzA+6YPfEHYIwkiRXsjw72QLIncwng/gGpDyfhjVDxekt4msfrwZva8jaWOM8r9CvslLEo9amk3HXUE0I0FVNcpAp59+3NPqrAI+8vzlzrLTm0Zop9k0n9JB4li97FcD/aAg8xh0yok62HbVBteUNyRyyu4ZK5T0iy9lt26w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sC78zOLb3EqoTlIktVC/wGswCqA7u1rQ8lzCIlhJdC4=;
 b=bPLiSVeVfcL9bvXcMVjKd33IamLEQyWOaTuhSANP9t9MKWeYsEfxiJcur2AGW0Xsai0tO7cCyAvWrFGORsf4lFZ/hHJwAvQ+JtnU0U9Sult6AO6gJK4+5tKNbXf0E9NnfnODVu/IBvPDQKcMfvNn6mRWsNozSZe2Kx8ByGj7mjsEP23klNSz2p4b29S1yer3at4KoTnF7n+P2ypfsZ+GS+3nX07pWgZP9BnlV2uZ9+wvmPQHg89Yy5eykWe8+ecjPPtI/HRwivSsT2gg1NbYA2DrUd55n1QI6VNr74syR/ZjY6L0EEqfyYHTazze7ZZdKfLjHiaWGlvDvNAc4y+FmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PAWPR04MB9814.eurprd04.prod.outlook.com (2603:10a6:102:37f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 09:59:52 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 09:59:52 +0000
Message-ID: <8d76d86f-ff49-4ce2-a004-d100967b4e0c@oss.nxp.com>
Date: Mon, 13 Jan 2025 11:59:48 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: s32g399a-rdb3: Add INA231 sensor entry
 over I2C4
To: Frank Li <Frank.li@nxp.com>
Cc: Chester Lin <chester62515@gmail.com>, Matthias Brugger
 <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
 Alberto Ruiz <aruizrui@redhat.com>, Enric Balletbo <eballetb@redhat.com>
References: <20241220123916.1452582-1-ciprianmarian.costea@oss.nxp.com>
 <20241220123916.1452582-5-ciprianmarian.costea@oss.nxp.com>
 <Z2WTjETLunBr83AN@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
In-Reply-To: <Z2WTjETLunBr83AN@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM4PR0302CA0028.eurprd03.prod.outlook.com
 (2603:10a6:205:2::41) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PAWPR04MB9814:EE_
X-MS-Office365-Filtering-Correlation-Id: a4844a26-6f17-47e5-78f8-08dd33b90631
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WGViTFZ4dTM4elVLY3RhQVNvS3J1bmRVK1FLY045Vk13aHJVS0h6N25XVkRP?=
 =?utf-8?B?Rk54bHptcWZ2NkVDU0FWN3FKSUs3eDBMYU11OVFDdUFxZEFtTjB0eUJHcDdl?=
 =?utf-8?B?ZWhaclR5WTJleXBadEFtOVBpMEkrVVppbEVGc0twUFBZSnFKTHVrNjVCeTZs?=
 =?utf-8?B?RlhZZFhZUkZ0eEhQOHdNaHhzVHc4RjJiY1p5MFI1TW1KaWhKaDcxWXo2TzJq?=
 =?utf-8?B?b2x6MkU4cXBKQkJ5MTJnWG5ocnN3YjV6ZGV2d1pVODR3QmxsQzZLM1NDaXY4?=
 =?utf-8?B?VzVXQVNnK1Q5dmRwd3Q3MEpUZkMzQnM3amtRZ3V0ak9rSkhLSjNFa3V2a2Z5?=
 =?utf-8?B?UWZXSlQxaTJkbUkzSWpIMjFLV3NzZ3VMSTRrblFhZ3VTbWJyaTV2cHVXUGZR?=
 =?utf-8?B?NTFYdVUwK01KNVM4N3k1a0Y1Nkd4eVZBWGNUZ01ZaGtYZm13Y3k3SGRpOGxn?=
 =?utf-8?B?MUJ2RW8zQW5YektmVnBqNVE3MmFjeEFXd1YrRXgwVVpLVlVwRGd5ZjdBbEcr?=
 =?utf-8?B?S1JLSGFIbTB1RUpZakRMZDJ3ZzhQeUhlMzdDOGhNTWJBQ3VQUlpneTk0RCsw?=
 =?utf-8?B?VHNOdWViMFZ2bmZlWTBNTlBFN0p2MzFSbEVueGJURlk5a3c5SWNsamt5aDBE?=
 =?utf-8?B?Y2FEV2QxbHZFU3ZySS9RaTFKYittNGwxRmJRejRxbG81OVVTbGEybFNtblBu?=
 =?utf-8?B?c0thZzl5dHBvL2pib0lqYzlNRUtSYVJvRFkyejRudUVVcGorQzJFdmwzOEJP?=
 =?utf-8?B?Qy9ISnNnRTRuRmQxajJBditNSEtZbUQzSm1FM1ozaUgyU1FienBBVkRuRk5S?=
 =?utf-8?B?QlBORjl6MlNhaTdKWThzVkJ6bEZGb0Q1Mlg0ay9vcWRQU0ZjZFlabE9Xbi9H?=
 =?utf-8?B?M00vdUZHUmQzaDMvOEZJdlA0L2RVMHFHRDFkQjUzRnFLRDJoNWs5Vkp3L3Bj?=
 =?utf-8?B?SnM5d0xSSU16T0RLd1FyNDA0SlBhNGhrbUNXZ0NRL1pHeXR1SjhPTXN4T2Rs?=
 =?utf-8?B?UElxV3NqUHRHZzVDQVJBMzhteDU3SktDMnlMRUZmblZXakNDVWxjUFRZaVFS?=
 =?utf-8?B?clJneXhTYkNBTkVSbmc1ZEhrcnN6SEFDaWFHQVlDNElRaUk2aVczL0xxaGlU?=
 =?utf-8?B?bSthRm05bWVQMC9EVWNEM240TDFpc2RUOWZPTk1uS3FpbzNsL0NlY2Vvc0J5?=
 =?utf-8?B?Umt6cHhCL0VuQ0VjbEdZM0dyOFNNTUlhV2g5d1ptNXZQeVFqb05MVmRCVzBV?=
 =?utf-8?B?NzlvSVRxSVArY2hZQWcwRk84ZmVVSlYrMG9ZWE9aZlpvWnZUUUFsMWRsbUNO?=
 =?utf-8?B?d3R2SDhlVHJSSlJZa0V1THF2cVdZWlAxV3AwN2Vzd3VyVHZ2cXFIL1hjYW5Q?=
 =?utf-8?B?ZXlockZORWlZaURvSGptaFRZdEhsYTVzWEpqMEE0c1lCOVk3SDFEbWU5V2Nx?=
 =?utf-8?B?dGhySXIvYmR3WkRCWU91ZVJCZmRLanBEbnZuajg0cE1DV1p0S09ickZacENU?=
 =?utf-8?B?c3F0OGZXMkQ2NTFYOURCMVlVUUFveE1IeWpLdmZIeStwNUlnZDhJU3FCVU5i?=
 =?utf-8?B?bDd3dVE0TlA3Vi9samM2TkF5OVIvbERUNUVVbU5BTlhCNVZ0WnNocjJuNGNs?=
 =?utf-8?B?MFhaLzFvbnBYdmxtMTlPY3FGbVRXNWRYdWJ5SGxvRmRON0Y1cHByZUtpU2Qv?=
 =?utf-8?B?RnZIUDlvMW50RUVkMXJxWG51c1MyZ1ZKbTRyVDdpWUNkSVc4MEFlYVhhZGFm?=
 =?utf-8?B?Vk9YWW10aERKUW1JZCs0VlI0V3R0U1pQTXhkeUU4WEJrbXZhODM3R1EvdGZG?=
 =?utf-8?B?WHQ0OHpuUG04SnUyMkFNZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDh1MENDcWZ1MlczaDFaeFJCbnZHSVYwb1hJNThhY2ZlQkpMeE5yc1FTL1dY?=
 =?utf-8?B?TzM2NERqNkhEWldHcmxueHgyNXpEcE5ndVhWS1cxcFg2a3NmdmQvZzFEK01O?=
 =?utf-8?B?c2hjcVQxYU9QYXZHWXRsbFR6N3Q2Tno3ZHBuZTZCQXY3dzZmYVA1SGpkeDlv?=
 =?utf-8?B?Ky9JeUpPTXA0SSsweGMvYTVTVGNoT1NUNVcyQ1A5eGlNSU5reTdSWHRJcWtX?=
 =?utf-8?B?anRydTJUY1JYMGdrNEtpME9TNkI5bndiTWNCTjBSaUt4L2txdWEyMTVERjhB?=
 =?utf-8?B?QWdjaVY1Q2FTNERiR3gxZmJEc3VHZS9PbFZhZUV1T0xReVF1VEpLZm1BdW5G?=
 =?utf-8?B?L0lkSjVma3hIZDVNRVFpYWxwREIxdjQ2eCsyc2Vhcldzb09kR3V2b2VLMmxZ?=
 =?utf-8?B?cjFzbUx0UGdmczFCM2pubGhaVll6Ky9ObW1yWTM2T0d6Z1RuY1BBM1BrOTE4?=
 =?utf-8?B?RjMrYWZaV25NUmRvOWw1U0txRnVveTNYK09KU0p0OFpQK1VISnJmREVzMW8r?=
 =?utf-8?B?Y3VWMnlRRFlXMnFUUERPT2NlWDFMNExRU2pGT2c3dHFZaTEvVzQzMVlzdXR2?=
 =?utf-8?B?dWFyaVlzV0JyUEp6M1dNdFZpUmpkTzZIeFY4MldIelJBVG1PMEp6Ymo1aXU2?=
 =?utf-8?B?U3VQbHBSUUtoZy9vYkdNRTBrd1BXQ1BlWVRYZFRZbjZjSXNvZVp0Wk9INDhi?=
 =?utf-8?B?bTVGSTBvMldZNWloZklTdUdnMktkYzBJQTJDREhURVdXZXFQeDFyQ2w1NDlX?=
 =?utf-8?B?azgvdHFQMU0zMkFNYU1JTi9RYTR2RmVHVjBpcUg0VEEyUklsTmRFdzZXb0p3?=
 =?utf-8?B?V3Y3RUo2d0xrU2pEVk9UVGt5aTMrMUpzbUtNMXJhRDFkU2JBOEVpQmRSK21O?=
 =?utf-8?B?OVg3WDhhRW82Z0NLbTlGMVdPRXNrbUN1K2VkY0N2ckxXRE51Z3pJbXZEWXdH?=
 =?utf-8?B?Kyt6N2wrK2NlZXFsaml1VHByb2dGTVNLZHB4ZXpNNGNPV2o4WDk3UzVBV0t0?=
 =?utf-8?B?bHZzbVQ0dTh1ajNSOHlKN0FuQUdnTWpBR3l2OUR0M1B3VDRYeVFVcks3RU9O?=
 =?utf-8?B?YzZ0K1IvK2ZuanVnYk1FNWczS2t2ZUY4eWJ4MENCRHVXMVFIcWxzRUdNOVhV?=
 =?utf-8?B?QUhjVzE0YmxDNzlJV2pQNXlVc2MydGJPT1JxNS9iYVp3azhVRUVpNUIzUHJG?=
 =?utf-8?B?SXVnS01JUnlWcUVXUFdlYldqOHVlMHF6QmdKN25GcVB1OUV0TVpNK05rRllj?=
 =?utf-8?B?NEtQMzE4ajlPMjc1LzE4MHNOaEdLU3pUWXdxQUI2STY3WU51Nzlzcjh4bHpP?=
 =?utf-8?B?UlB1RnVNRTdrbVN3TmYxMnhuQXJrTVVqTUtacnZ6eWwzb3Z3ZHlTOWdVZzVR?=
 =?utf-8?B?cW0weU9PQWdwc2V3RHZUY29LVTJJbURsSGtVTjlybUc4dC9Kc0ZPN2lldkNM?=
 =?utf-8?B?M1J1c1BXOUdoZGlaYTVOMmpDSlVvV0djSGI2d0tWYUdGYUJOUWE4eDVyTERN?=
 =?utf-8?B?SXFZMG9QT1QzdVFXNkI3T3VacTFUbXl3c25zWTBHRnc0a1Exc21MVU50Wkw5?=
 =?utf-8?B?UUlDM0tndTFsd2JIOXgwNEJWaUdUU3ZZaFZrSml2WlM3MS9hVlhYZjBYdEww?=
 =?utf-8?B?R1k5eklkYzNQMU1iK1NHWDFkRTMvRTdZTGJTeFg4S2lyYyt4cGlmTnR6dE13?=
 =?utf-8?B?dnJ3QjhiNkxCWGZTbkFWN1ltekU2NkZKZ2NrOCt3S2ZDVEExMy8yRGh0YitK?=
 =?utf-8?B?ck9ZQkFDcGFTcUNjSmZaa2pQNzV0bXgwblRFc1dUTzNnc2VaYVp4bHpXWHlT?=
 =?utf-8?B?by9mdnc4MlBtQ05GRStMaTBsbG5iOVo5VmdESCs4c1VwZlljekRaOEJyL0V6?=
 =?utf-8?B?UGpoT1RLVTNIQWUwZXVwSWM1RG9NZkplUTBGMUd5OEVYS2lIcCtFNm9HWW9U?=
 =?utf-8?B?eFdMRllPUnNxSHlvUG9GL0RLWW0xajFqbnB2K3htZ2l4YnRHdTdXR2d4eXBx?=
 =?utf-8?B?bUt5a3JiVE5vQ1RsT3ZXaEc0R09LYnh6NEZzM0VtSTdWWlhGcnNzSCtDUVhp?=
 =?utf-8?B?eGUrang0K0pYYjR5NzlqU1lYV1lXZ0ZZK0pqaXNtc3FNN3l0RGJnMHVudUJl?=
 =?utf-8?B?OWt6M3FRZXVBZUZkUnl3SWgyS3JaYlZxQ0Q2YVhXYmFmZkNWNzRaMmRsWm4w?=
 =?utf-8?Q?TRCfYE1lcBY/GBT8FsFtZg4=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4844a26-6f17-47e5-78f8-08dd33b90631
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 09:59:52.6521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oav3efZ4ms0nmsOj1E9eODZG5GcdxJXo9epTA34wjpYAPSEUhDm4zbxs5x+txhigd6x0SoZc13u3VaOfO6FyueaWT3pjeZhnoBTTx0tJSg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9814

On 12/20/2024 5:55 PM, Frank Li wrote:
> On Fri, Dec 20, 2024 at 02:39:16PM +0200, Ciprian Costea wrote:
>> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>>
>> On S32G399A-RDB3 boards, an INA231 current sensor is connected over
>> I2C4 bus.
> 
> Add INA231 current sensor for S32G399A-RDB3 boards.
> 
>>
>> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>> ---
>>   arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
>> index 94f531be4017..5f8739c068c6 100644
>> --- a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
>> +++ b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
>> @@ -40,6 +40,14 @@ &uart1 {
>>   	status = "okay";
>>   };
>>
>> +&i2c4 {
>> +	ina231@40 {
> 
> Need use general node name:
> https://devicetree-specification.readthedocs.io/en/v0.3/devicetree-basics.html#node-names
> 
> look like should be current-sensor
> 
> Frank
> 

Thanks. I will update in V5.

Ciprian

>> +		compatible = "ti,ina231";
>> +		reg = <0x40>;
>> +		shunt-resistor = <1000>;
>> +	};
>> +};
>> +
>>   &usdhc0 {
>>   	pinctrl-names = "default", "state_100mhz", "state_200mhz";
>>   	pinctrl-0 = <&pinctrl_usdhc0>;
>> --
>> 2.45.2
>>

