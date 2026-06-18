Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022085.outbound.protection.outlook.com [52.101.66.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CF52F39B5
	for <imx@lists.linux.dev>; Thu, 18 Jun 2026 05:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781761945; cv=fail; b=BcYeNxS7yTg+GiW+mC/+5FcDk9LRWoyxTkZc8+dPRZODdxoAXVG+XiEI8pQeJ7RjSRVdXYjubzMyqvQMYFax2aZjQu4dr021yapmX3/0rrDvs10opIBK7E4sPBVwE/EefniPBlLpEAWCtP20Zy1HHwJlWI0OKMN7L65/JQ0XRlI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781761945; c=relaxed/simple;
	bh=lehm46luom0r5k8HWWuKaCLiI2uotS4n8KQoGB7PUAs=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EAQYfTArpKSkS+ZaoGkc65taHFVppX8raC8ZoVRmJsMLQRFdU0kVSNMi11P3mk7nk9cY9K+ugb4+u5qCXv/6Y2nJNCcgynw5xWCzcErHjxZ7s8bbc1j/x6yhvgT/gqCSSAkeL1FzntOIdcQT7wQMcC/1rEvUvMBUcShIBXhaLKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de; spf=pass smtp.mailfrom=kontron.de; dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b=oqYhEW8Q; arc=fail smtp.client-ip=52.101.66.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b="oqYhEW8Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GcYvolMq0JVORvh4TqNvgwwEUOxzQi5ZuAEgK70iEpQCKU9/fMUP1Toy1fiwz7dz7RhktuoPETNQj/b9iMx1AHGNs/+MdCBC1Bm3/wzN1HEjoQ6uyGzDUG/P3/KxfrCPQHNrXwy9Bk/vACHfhnGfbQhz6VTw+u9crkuFgBJ5dNdH6rT3piitRe2lT6nViUL/y536oMjUqFFD5eV5mmTnQoIm1CLa7tFNA2ufkZbO+/kSMGSqFmN/q3J6WOKEY9Uc5nZqn2L/RiwRBqREbQ6kLSCs6st25oZf2ACD5S1fS0JzD2r7aTBXzJ+OvVsuaZSvPr5JSn6HsOwd84DYzCSWHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjczLWXE833rbbPpNh30t1ymlBhuFluiJCou0f/nxFo=;
 b=ie+VDuuNZHy4IYz5xUXcd4fsA5r2JFpAUDoKqYOhpuBlzWwEr8lHGd5rRScLa/meiU1i0ieBthrC4xxP5s+YBjBTddXuvj2DoHdaxT7yOcgQAF2n52/qdFnO7y4NIEQWWiiu91bpifmSP52ppfyYHUUrpsp7W0cfMH9RXSKInxW6Qw1HlAemfGzviR69TARiO1MuPyWD5Ywxp56zac7ivG9c+fizd4lBCuTQfI8ru8+2nNgcvCxMpWL5BzVNuWrOsRALsLMrKVNCEGJXQYx2/QaCpOyx7k75FNk4cFLpx8VoK1acquUTyx71VInUi1t3RFjYlFR4JtPqfO0T0F1woQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjczLWXE833rbbPpNh30t1ymlBhuFluiJCou0f/nxFo=;
 b=oqYhEW8Qy4aH9j7XVfDGgEmNGfn0/J2g0Ra1K8BskkgUUU/lmNHGLHZioeHJzlNUGDtNIiniOibp13HvS/7K0FFC/q2P5ijtuct3CUGkRMTqxIjNcQH5DZ/ZLoEH+n9mlajiKzbw5mK6zSoM4XV0vlvH3mGf9eSYrOIEQk+YONaK7/HdepcnXNH2e5cUq1JnhNbFI0VgVJzgix0XEQqUG0UnDiUv82qSrvuCUVhoTFjRVADCSixmaqknveph6XwPEYrtBNFeRy0gXSmEqxd6sj8M90OaRZYxvaYMMqLjS7udReYA9+pZaUjQLBvSVUWIJN4oZUtjdT2Cm+uE79as8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by VI0PR10MB9303.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:2b4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.13; Thu, 18 Jun
 2026 05:52:17 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%3]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 05:52:17 +0000
Message-ID: <4f4cc156-7534-4f11-8a45-e4caf083c865@kontron.de>
Date: Thu, 18 Jun 2026 07:52:16 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] firmware: imx: ele: Add API functions for OCOTP fuse
 access
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Pankaj Gupta <pankaj.gupta@nxp.com>, "Peng Fan (OSS)"
 <peng.fan@oss.nxp.com>, Frieder Schrempf <frieder@fris.de>,
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de>
 <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-3-cb7f3698c3e6@kontron.de>
 <ajFtkysqxuLV8GgF@SMW015318>
 <cea74ed4-1003-419e-8da3-1c62b1ace726@kontron.de>
 <ajGsiglUUbDTIxTh@SMW015318>
 <9c1d34ec-0b96-471e-8b60-6b4c852878bf@kontron.de>
 <ajL7-OqjYuQHyZOI@SMW015318>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <ajL7-OqjYuQHyZOI@SMW015318>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0077.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::17) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|VI0PR10MB9303:EE_
X-MS-Office365-Filtering-Correlation-Id: 9128ae76-dcd5-47ea-9803-08deccfdc121
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|23010399003|366016|56012099006|11063799006|6133799003|18002099003|22082099003|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info:
	bvChkqqu/65BrPSwR7PfDAfyePEWFJPc89d05JOndsTiyDkt5jDtsRsUoB8NjFknuHi0xwU/Pg3zfcXkdcoT4mITdTNAqAxvpVkznu6hh5gnoiiFDyQZWZyqw1SF4r2NBWtLscjS5cKMQWJG6zgoJPXOapG+0J5Mp/qDTRcMmrHq8vz9VmGnefWgP6EYtn3gBaX/l7/foEb8Dz8qNt+zhYlHrWprdtDUFB8+UzTx8m8yvifmDoa7IkAc4ZhiD6Cgez+4kT5ajOjrtne1wi4XeKRcRmTJbZLpuCWhjjhRMFz9UIEckL6v9KKcGtrGnqY/ZAHVxX1DdiJc3/7KonQuM3/lRJHlgLfV+RG7LyvXBEp5CZhE5lgqvWVk55BTVJklaeX3G0iFDBd5SgkNBkcuB8H2pWmS2NmaAKsXzezlZEfzDT7z6dp4e5zy4TZghJICazhjL2O+p23HDFp8fTxL8JozUXCLsfndlLsi+kJy6ZOKWXNdB0F+J5HwUBqWZOugA6n7A2hOdDOzj0SpzNmpZHFqqA9D6q+fWmPOeZHxOL9Ak2FF9P2Xew+yzMaKlMefIeqnppK6DTV9EO3pEgCTK8Ikmz6At3QuMk8GHOF1cVT1uQ7PH5jKjf0SvVDbBtrB7HXWV/DRXTuywWY27pMyn7I4rUnjUQK4/vHiG7O/rlCQKj1CKHeIv5yBpV/CxqMj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(23010399003)(366016)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003)(3023799007)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFhJbmZ3SG5mZm5Fc3lxR1dKbk1Jbm1tMVZycGhTb0pKaUpRaU9MeERVVGxE?=
 =?utf-8?B?WmZkSzBDK3l1aUFrNlBVRlczSTNMa0ZsUEVhUjZoWXZXSFNrSXlPODRyNURH?=
 =?utf-8?B?cjMrcnI3NDFDckh3KzdPaExoYUFoMkttTXYyR2FRZmlnZGZvS1U3Q0Z3Q3Zi?=
 =?utf-8?B?YlVSRWR6ajNIT1dwYlVpS29UbDdRQWd1SE1URHRXR0RNWGlmMWMvNWNKaGtD?=
 =?utf-8?B?RDRpWSsrZHltZUhmcGVXZ01xY2FwNU5nS0UxMFpZZ2t2UkdIMEg5V1lxT3Bo?=
 =?utf-8?B?QTVoVUorNVJuWHB0UGUvUS9UT0QrUGxwMG5yWHBySUtoNTdtZVZnR0RUSGdD?=
 =?utf-8?B?d1BtRzFVMUYxcTUrS0lhdjBybjJaTjRKanlPa2FtWUZVVWtvSURQUGVRejVM?=
 =?utf-8?B?bFBUV2JUR3haMDJTN0xicm0rSzRtTEhIcFBJaitXRUVwYzBFekdrdjBWNm5Z?=
 =?utf-8?B?SGFISWNLbTFobXBXMHNpTExJTUlzQkRlcDlWR2RQUysrMEhkdFprOHJSaGtn?=
 =?utf-8?B?bXlsMGxXeWxyTW9NcDVCVEZvdWN2Ym1PMk1idjhqZ3lxd1lEc3JCeGtkNnNJ?=
 =?utf-8?B?QnVkQ0lhWjhWNlhDQ1lLT3JsTitVdXhwUnVCeGNYVnZLblIyYVRNcGlXV2Ez?=
 =?utf-8?B?WFVQQ3lnMFNPOVVNVzlIc0s0NVNGYXpybnZEY0RiQWhkRldvbkJVSmV2QjJW?=
 =?utf-8?B?RytsYWVMTkhFdCtpMXBMbkN6dU83NU1zRmMxc2puSmN6NWFtNVBvN1FCa3Zn?=
 =?utf-8?B?bmtrZWpMd3ZhTG5GMUdMM1poOFlxMXdZZ0JEOE0rbHlpWkJYVUFsUkc1OHo1?=
 =?utf-8?B?MStNK2JzaXNUbzUvdmhYaEFWcTZnS3ltQ0JzdXhnV05KWEdBbnR6YVpGSHQw?=
 =?utf-8?B?RnRtdDIyRnJwTm5xNVY3UHVTQzZkL0duYlBKd3dzM29Fc214OFdpZG9iaGdK?=
 =?utf-8?B?bWNpRmpkdW9NWXVOc0l3UmZTZ0gxWE1PTHN6SWNSd3pTUmY2Z2VUclFSTjZJ?=
 =?utf-8?B?SWoxTkFpTWFERFljVGswWmg1SXVIb1pQRXZEMy9seUM2Rms2RVVmYlJWc0J1?=
 =?utf-8?B?NlRuZWtQLzN6VnNVMXhNRGQ0eVl5Q2tTd01IUUVNb1cyQ3FqRm1TSFQwZ1FT?=
 =?utf-8?B?cFlMTFBOMFh4WFBpVHMxZXNmSVJmRVI1YVZGRSsrL1hOSnpocGhUWU8wdEc5?=
 =?utf-8?B?a3VkYmpadERXY2h1TjdSZXB4YXliTXlRbTFpa1p5Z3BHZ2JNbHdZOTZOWXRQ?=
 =?utf-8?B?NlF6eFhmbDZ4TlFsaEFTRmlwU2l5SHFma2hsM3llYzBBdlRidHA0V2hvZHlC?=
 =?utf-8?B?OThCQytDWXlpb05ReFQ4cmgvcWVER1IrZ2E4TTVoYjF1aENuc1BGWko0a2Nm?=
 =?utf-8?B?MWRUWjlnMVpTZXRwb0NDcHppa1AvVHBPTWg3TXloTkh3NjN3NEowNGpla3hJ?=
 =?utf-8?B?ZVlHcUZJOGQrRENGOFJYMFM5cDJxV3J4RnRwOU9jOWxDcDk4TzVLaDlQK0R1?=
 =?utf-8?B?UDZjbXpLYjJGSU5NdERZeHArZjMydm1hNlFpSDgrOU5vcDVDNHFqdzYvTDZJ?=
 =?utf-8?B?dHJ2cVZLSWE0bUk5Ri9ab2ltUkd6N0ZyM3krTGVFTklKdHdrMmwzby8vYUJN?=
 =?utf-8?B?Q3Rhc1l5ZlZnRGxKWCtXN2VkMDVQR2pERWxDUlR1d0lGaWFOZG1CUG9sMzVU?=
 =?utf-8?B?VFdoZFRQdzNMZWs0eUNaeEtFQS9zNFMvdnRlUDJ1K3NJZ01IdkxvM3NZUlQx?=
 =?utf-8?B?TUlWZXlrdnpXQWtQTlVrMFh6OWoyZzNLc3pubUFUc2ZLcnZ2NVo3WXdEblpu?=
 =?utf-8?B?d3VYZDhLaHlIM0ZJZVA5S3pOc3NaZnRUaExQVlZVNkVuN1pZdUpjTm5vQjB0?=
 =?utf-8?B?SlR4OGJYK3Y1YXpRMEhWbnBnbWMvOURsTmhCYUdDSzVibVFqVzJMeWRvQXZj?=
 =?utf-8?B?OVFSU2VlT2hMUnQ1TENkeXFxZ2tpODU5dGI4ayt2WWh2S3RzSUZWaHZzYzRM?=
 =?utf-8?B?Z00xRXNYVTJtMmJ3K3ZKQUhFN3JlWWhKVlFnaWZ5ZjlTZW96ODh4bDlRdmlZ?=
 =?utf-8?B?a0pZblZ2ZHpiMkM1SnBLMSs1aVNneXlMNzNSQk1tanNPVWQ2cjFVSDZJSVZ0?=
 =?utf-8?B?SWh1K1RDMDJhMS8wZ2puT0pjM3NQTThsWlBFLzJNL3ZwcHp2N0lOYlpUSHVN?=
 =?utf-8?B?K2RZNDVHUlh4M3g3VUhHVWliRWl6ZUo2cEpnODA4SzdtcFRqbENzd3JhRzdU?=
 =?utf-8?B?bVRka0VPcUQzMFE3aTJvSTZsS3FEb09yNDBFYlBwQ3pGQWUrK0FoM3djbys4?=
 =?utf-8?B?UFlnRjl4Rk45bXBiTW44dFY1bXFpZngybWRpR3d4aEErR09ka0xucjZRUTFZ?=
 =?utf-8?Q?oziPQD0jSGzqTa8I=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9128ae76-dcd5-47ea-9803-08deccfdc121
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 05:52:17.3508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LliGq/DQTQpOq2uJqGWG5MQrCj+qi8+AIQ2eMINpWv5o0ISxrllMncq2+cSv/4c4mnhy9DO2wJLTif+fd4r1cuQvqVyVWp3DF2OXOSyyD/I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9303

On 17.06.26 21:56, Frank Li wrote:
> On Wed, Jun 17, 2026 at 08:54:35AM +0200, Frieder Schrempf wrote:
>> On 16.06.26 22:05, Frank Li wrote:
>>> On Tue, Jun 16, 2026 at 07:59:54PM +0200, Frieder Schrempf wrote:
>>>> On 16.06.26 17:36, Frank Li wrote:
>>>>> On Tue, Jun 16, 2026 at 01:52:18PM +0200, Frieder Schrempf wrote:
>>>>>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>>>>>>
>>>>>> The ELE S400 API provides read and write access to the OCOTP fuse
>>>>>> registers. This adds the necessary API functions imx_se_read_fuse()
>>>>>> and imx_se_write_fuse() to be used by other drivers such as the
>>>>>> OCOTP S400 NVMEM driver.
>>>>>>
>>>>>> This is ported from the downstream vendor kernel.
>>>>>>
>>>>>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>>>>>> ---
>>>>>>  drivers/firmware/imx/ele_base_msg.c | 122 ++++++++++++++++++++++++++++++++++++
>>>>>>  drivers/firmware/imx/ele_base_msg.h |   6 ++
>>>>>>  include/linux/firmware/imx/se_api.h |   3 +
>>>>>>  3 files changed, 131 insertions(+)
>>>>>>
>>>>> ...
>>>>>> +++ b/include/linux/firmware/imx/se_api.h
>>>>>> @@ -11,4 +11,7 @@
>>>>>>  #define SOC_ID_OF_IMX8ULP		0x084d
>>>>>>  #define SOC_ID_OF_IMX93			0x9300
>>>>>>
>>>>>> +int imx_se_read_fuse(void *se_if_data, uint16_t fuse_id, u32 *value);
>>>>>> +int imx_se_write_fuse(void *se_if_data, uint16_t fuse_id, u32 value);
>>>>>> +
>>>>>
>>>>> This API should implement in fuse drivers. Other consume should use standard
>>>>> fuse API to get value. If put here, it may bypass fuse driver.
>>>>
>>>> The reason this is here, is the downstream implementation in linux-imx
>>>> and the current code organization.
>>>
>>> Downstream may not good enough, sometime, it is quick solution.
>>
>> Ok, but the code structure and API design has been upstreamed like this
>> and the refactoring could have been done before, if downstream is known
>> to not be well organized.
>>
>>>
>>>> I thought there is some good reason
>>>> to have shared functions and it looks like Pankaj structured it like
>>>> this so all API functions live in ele_base_msg.c and the internal
>>>> structs and defines in ele_base_msg.h and se_ctrl.h are not exposed to
>>>> other drivers.
>>>>
>>>> If I would move this into imx-ocotp-ele.c, then I would also need to
>>>> change how the code is organized and make the internal se_api functions
>>>> exposed to other drivers. I don't know if that is really a good idea.
>>>>
>>>> I get your point but it looks like this contradicts the intention of
>>>> having a clean API in the firmware driver.
>>>
>>> You can refer imx-ocotp-scu.c, structure should be similar, only difference
>>> is that lower transfer APIs.
>> Ok, this would mean that I expose the generic SE functions and structs
>> required for fuse handling. In practice, I would remove
>> imx_se_read_fuse() and imx_se_write_fuse() from se_api.h and instead add
>> the following:
>>
>> struct se_msg_hdr { ... };
>> struct se_api_msg { ... };
>> struct se_if_priv;
>> se_fill_cmd_msg_hdr( ... );
>> se_msg_send_rcv( ... );
>> se_val_rsp_hdr_n_status( ... );
>>
>> Then I would export the functions in ele_common.c and put the fuse
>> read/write functions in the NVMEM driver.
>>
>> Is that what you want me to do?
> 
> Yes, Idealy, it should be children device under ele, ELE like a bus, which
> previous lower level data transfer, ocotp should be base on top then it.
> like spi/i2c, which provide low level data transfer.

Ok, please also see the discussion with Krzysztof on the bindings patch.
The problem is that this driver uses both, MMIO and firmware interface.
Therefore putting a child node in the ELE device node is probably not
correct, either!?

In general I think it's a good idea as the fuses actually live inside
the ELE block so this would properly describe the hardware, but again
this would create a hard dependency on the closed source ELE firmware
which I don't like that much.
