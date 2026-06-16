Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020093.outbound.protection.outlook.com [52.101.84.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DF147A0B0
	for <imx@lists.linux.dev>; Tue, 16 Jun 2026 18:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781632803; cv=fail; b=ZM2oZK3ZpzSfjidNVMjRWCnx3QwpBRnzpWFVzcj2Q7MtGrUFMoFMYuOz4jhXZHkg+Bru0MR+s7Oncyx8EaqkK3rxmQrQL+gvHY9+CrDB2GrhTm7xPCt/zQ1772l43MvlVX/YSuM1FyZnLh+YkaSBw2TaHYSU3nHRvLsyy4ZjSgY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781632803; c=relaxed/simple;
	bh=Wr+WUi0fmj9/DTcY6W3ONf/Ps4ynuoe5xqzD7w3pwEQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=r1SP4qh9vKII7MRZRJP466WVpZUMBPR1DnGkZ4lWfKWHcTsPTiPEdml8pAmPpQtGsEehdcYorPFb024uqR4oPikrM7XgBXbq81a82QwqZllDAIcDqqAybec71rtjgJaoYKq9D6DUevV+xO8sWG5aA5QU9hyKFsvgo6I+o2lu+Xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de; spf=pass smtp.mailfrom=kontron.de; dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b=nHSM6l86; arc=fail smtp.client-ip=52.101.84.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b="nHSM6l86"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SJr5pPNjPmauKvwu/F/Jp5wi14G5f0xCH3eZwG8f9Xalw4RDhMpneZYWJsY6B/Xhy6LIBuhmY0zAPwifM+WlEO9f5DbdSNWt5gJWjm/k/u0dl4aBbTMu9HfPB5wgZxR8ov4fZ4ENCNmgdi6P5f2LURkxku36vFFtuqCiR1PxQiDp6NdOX4DQrlZJEZdR4sITbORjx9cCOn2Hiwftv6EtmzzLgw4i9mCiaTkOBvoW5Q9cPnNopxqWrUw1ZBujOpGQr0/y+lmmS3a1forKMqTAQKXlR0Av/dAExrBVFXNcQ6+QnvHeAJm66w+1sQR3hxWy2pXTXTr1AMz6O5PCSR3+sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=354EhyoiTyVH+TQ3lhrEiNN941P3hTTXkPMo0SVqlOo=;
 b=ny9slTJAJwp2NqTnRFWP3SZZpvuEjNVd4zJ7qGaVw0yWLA0QqFtWEoYqqyYlOOIkgGGPJl+tZr/wh+sxizQp6m3Bx0g1Kg7j+xjp6BJgCNJu+mKGMXhxn5R/3Vt1idM3DLgyNBjfSLQBYmX7gj2UcxW4d6eymGwA5AxQFvNAY380bSZnIlP0r8/JNjrIanmE6nB98O4OaWw9suICcoszYHOorgCiCW8JwIKmeaA1+LFqU/AxiQeuwxdrfb+yHBif1kQpEw3ELNr98v3xch/Pt81ISKdf2BMkrTAoxNXjM0V/O1k1N9XLxH9KsaWM7W9YWTW6BkKC/4a6XiHaE8XnmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=354EhyoiTyVH+TQ3lhrEiNN941P3hTTXkPMo0SVqlOo=;
 b=nHSM6l863olJOeO0MsmHatILkWyAb4FKUJxsSkxF613FpSsFOv4NDUnWASeyTWLv5QkncbIcjg07bLh6vA5/ohICQF9avzJM1VOpP5aN8xfqLdyRP0rbsm0CaaMWaDF0BCFfuXsyBAp5WQ1jZNV/nOqJKOXLkhBqDsEhOeLib/93fs2L/uZyVpauFZoBs8sHaV90AJpt0ZAiiJtmtZsM397OVDrGizwXAQrcnTgdwkIzXL/+7xTjlvHRDmnpWg5hkR/PGeRqUkJ6Kth3OyqaMMapCbn1F0nNQ2eRGdM9DPZ2AaZhpowqAsvbsNqImpuzwlLVus17l+megrf9EqNf6g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1fb::23)
 by DU4PR10MB8890.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:56c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 17:59:57 +0000
Received: from AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22]) by AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::a276:4ad7:962:da22%3]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 17:59:56 +0000
Message-ID: <cea74ed4-1003-419e-8da3-1c62b1ace726@kontron.de>
Date: Tue, 16 Jun 2026 19:59:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] firmware: imx: ele: Add API functions for OCOTP fuse
 access
To: Frank Li <Frank.li@oss.nxp.com>, Frieder Schrempf <frieder@fris.de>,
 Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
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
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <ajFtkysqxuLV8GgF@SMW015318>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::20) To AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:1fb::23)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR10MB4277:EE_|DU4PR10MB8890:EE_
X-MS-Office365-Filtering-Correlation-Id: 2541f6e5-a6f9-4c34-3fd3-08decbd112ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|23010399003|376014|18002099003|22082099003|56012099006|4143699003|3023799007|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	Lqi2URoJhhH9uTywSObW6uGs4VcQ71CU9Z5anti1RxMh3627XI26bBGf0cXEWdRtrPc+GF5QhE4udZDW49ovHkmnpjyHCY/vsPLK1xM61k3q+BfVumK40mqK8yBo+QKtZXewsT+XqB8fge31Z64yYXaafLGF5P7UqOEnjweJkTq3fAO86hC427pR69CHOGWy9u8my+ljSK6uK8SRIFQW4/rXk6OY6mpy4U41UZ2y+LYFbJs2Y07dF5hWLPwAmc0w89YwF7kzgRPmdPtimb3X8pAHEBuuswIe3g8mjpUd/BAsd5VVr57qxIupDvEzzEDCsfX9jBN6/wR271hzGedaWZ+vHs6pnl6QopSivMmJkne/GJAn+6Y+OERrCRFR1f8m+e4mpQCokhzcv9wyIcsgTALsCZ2Rq8MEc53Tfe5e3Hw+s1taDbRWTm5gfZARvaPCpxVJbgHSvk4sTE4I3DSrB+IW0IyRV/FHSOGwweF6sqk5LaPfDTYmHNzCXb5kWqR8NCfrnA+kK7k72nr4eqwNyKJbFHuFSdRWL4rbyhyM/JT6H7lQadZasME4zCRzF2TMw4ckjLoEqPalOuN0abaKRBispaSkcAdOVX0EHl7BJrsjHJqwHXfDHbizJcb6RHho9Cifz0xdIkTnEpeLj+pjhyLysNF2aOYJ8VtsbMO/mwf7ATqlrSX1JZCkZRsnVCde
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(4143699003)(3023799007)(11063799006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXNkOHRmRXMrUXdMTGl1TE5RZUJuejJZWmQzU3J4d3B6Kzh3M0dkMXNNcE5W?=
 =?utf-8?B?MXVDNXk1c0FPVGE5RFNRV01EOFluNmVKeVlGcU1zT21PdmV2OVdyVWJMQWhz?=
 =?utf-8?B?T0pGaWJybnVXN1dqVXgxUnRiWkd6R3VYcmRXakVudWtxaEdhV3ZMaW9OSEhT?=
 =?utf-8?B?LzFtUHh1QitrRVNYelBBaTA5bUMvOXBmdHEvNFM2QmpJOWVZYWJUSDFvN0p4?=
 =?utf-8?B?K2R6OGFRdnNoV1hrQi9pMmNOaWN4SGgxa3c1U05rbFdUeEtVcVd0ekVzYU40?=
 =?utf-8?B?SmFhSWJueEt0cEtNVDg4NE9vank2QUxoR2U1RHlxRS9tbklDUUZPYXVPa0Fi?=
 =?utf-8?B?TU5ZeGVCQ0VRaFRYUU0wdHRYMDI0YnlnYkdQc0FSeVkwSmUwaHM2aGxFbFFD?=
 =?utf-8?B?cWtPMjVEK0xvWHVWOGM3ZGkxSDZLMDgzMURQOFhhR0FpblkvTUp3UWhpQ0I0?=
 =?utf-8?B?akdWSjc2bFNpSUw2VlRrNGI5cEFxYjkyYTJTaXkwQ3FzU2t2ZGpmMER4Q2Vo?=
 =?utf-8?B?WnVyOGlMc2JQYUpnNjdzRXc0NS9pVEVRUHB0SXd0VkU5cnpFOVVzY3NGVVRy?=
 =?utf-8?B?YmM0WnZ3ZmcwdENreFZPaFp0QXlEWDlCMVNabHJSRmJocmZTQms3djhQODAx?=
 =?utf-8?B?NHVycFRsMCtJTkMwZ0FtdnBvWHRsUE5UOExTczA1bzJuRlFwRjc0bWV6VW9y?=
 =?utf-8?B?TjUxNTFVWE5MTGpRRXRjTWwvWjFjQ0NtQ2FkUEdIVDRsSEIzQ3dNQmFvRERN?=
 =?utf-8?B?eFA4Ny9CNnZHdHdEd25PRXlySGR4RWxRTDI2a1gzT294aG95cHpoMkFPdmhM?=
 =?utf-8?B?dFRxc2pIVG1udDE5SFBUREx0eEFUdmJZU3VhVkhTMVViTVVRaGZpRE04VDk0?=
 =?utf-8?B?bGM2SENYd3RUVytuZUc5dWdUUDJ6VHNCLzYwLzlDbTdRVHFkWk52MTc2NEth?=
 =?utf-8?B?c3I1SlhPSnEvZ09wUEZ0bE5IM3VOMHl6Z2wvVjRrNE1uWWc5M2lMNXZSU3Fi?=
 =?utf-8?B?Y0RIcDhEZnF2TDBlU3RLT1lGcHJRaVQ2WFBUdk56dUQ4QlpWTERhS0pOYllm?=
 =?utf-8?B?YVpnamRjYUZWUnFFS1VoLy9TZFE4aG1jQWppV1FCODZQb3hBRExEVUZVNlRz?=
 =?utf-8?B?T2dJZkJNSk5xZjRQTS9zdXhOWkR6U1BOWE45dUxzNlQ0WWFYYmUyc1loTHJC?=
 =?utf-8?B?aFFhNjB5bXhwZE9RSjFYekxQMnRVLzM5U0JyMzZPWVd0bkdZcU9qMXRhVVht?=
 =?utf-8?B?RnpWSytwSWZXN3o1SWUxQmN6a2hIV3RXK1lWTkVncnRRRGx6V0U4bUxpVzZV?=
 =?utf-8?B?TCtYcCtpWTVROU5ndFNBcGxlWUNZQ2I5cVdtUkE0MFFsOUZaZnV2Ri9tdHFJ?=
 =?utf-8?B?c1Vmbjk4TWd0RnFkVG9Xb1E5dldOdnBJVFhVRjhlSXYwUUhwekNjMVUzSWNw?=
 =?utf-8?B?ajNIQytQNC9kMXVsb3JBYzRhMm5lNzVhVG40RGdSRWV3VTJJcFU4Kys3K3Ir?=
 =?utf-8?B?UTdoVkhuZVFObUVTQ2ZkcnpBY3BXSnhuVHNSMlg5eVUvZGN2ZnlxdzdlOUZK?=
 =?utf-8?B?MXA5QlBYcEZxd0ozeUdQZVkxTzYzSTRoZHJzU0dndjhEek5Bd0xYMHpyc0hz?=
 =?utf-8?B?N2FkSTEzbnBlMkpoRG5xcnU0RlpvelZQUURiUzBLTTc1R1VXUkkxcEs3cHcv?=
 =?utf-8?B?dkRhb25JTkhwd1k5TWsvby9rRHZ4cThFOXFxaGQ4Qk5aek92T096cGlPUmJa?=
 =?utf-8?B?czkrMEhBV0ltL3BkUlU0amlLRWw4NTdDQ0lJN1VyVGJnTThDc2EwQmFEWDVK?=
 =?utf-8?B?WEY2MkxGbi8rMW9WMkF1RDFnTlZIKzVjLzM5Zk5MVVFrTHJRQ1dVYXZkVjk5?=
 =?utf-8?B?dUpiNkRMVXJNQWJqYVhOSjkvUC9QbWJXc1Q5V1hpb0wyeVZKeTBCUytvQ2sx?=
 =?utf-8?B?U3pMbVhoQitwVWRCU25FVUovMEE0c0lvcEIvTnBIWkViRlVLaEgxMDM3alJk?=
 =?utf-8?B?M1FqY2poYTQ1WVRNSU9yVGtGTEsvcTRKK093VWFaWDRQc05PZVY2WUw4Sy9u?=
 =?utf-8?B?UW1HMEFlYVRsQStpbXdnWjBRR0RZNXFMTGp4bHBpbU9ad296czRYWlFVNTJC?=
 =?utf-8?B?NURxd2RDbjZFL2w4WFBsWEFoWW5nZ3FZS0YxVjQrcXRyU1hlU01JcnlROEJQ?=
 =?utf-8?B?N042VDRWNEFsS1UwcWJzU2lOSnNOZ3B4RHh1bmNYZHVjY2xuSFErZmI3YWgw?=
 =?utf-8?B?Qk0zNnA1MXJsblJJV2loeEFPQkZjYzlubUF5a0F6b0ovMDJNQ1JTU3NvcmZy?=
 =?utf-8?B?eVNRTlhVTDBlbG5RUzNoUmhWS0pQY1UvZ2I5NkdvMkprK1NCdlllZTROQ0xC?=
 =?utf-8?Q?Yua7SaVCTJIDlE7Q=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2541f6e5-a6f9-4c34-3fd3-08decbd112ca
X-MS-Exchange-CrossTenant-AuthSource: AM9PR10MB4277.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 17:59:56.7147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: czrlW9bZpKUNMD/2YogO8JDWBYib66Tul3UpwXTpa3FUqexFvQfZ13UvfXw1D/9fQucbiDHVaY9pcs0gEqPiLPQ7kwR2s/7zbFw/uolqmnM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8890

On 16.06.26 17:36, Frank Li wrote:
> On Tue, Jun 16, 2026 at 01:52:18PM +0200, Frieder Schrempf wrote:
>> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>>
>> The ELE S400 API provides read and write access to the OCOTP fuse
>> registers. This adds the necessary API functions imx_se_read_fuse()
>> and imx_se_write_fuse() to be used by other drivers such as the
>> OCOTP S400 NVMEM driver.
>>
>> This is ported from the downstream vendor kernel.
>>
>> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>> ---
>>  drivers/firmware/imx/ele_base_msg.c | 122 ++++++++++++++++++++++++++++++++++++
>>  drivers/firmware/imx/ele_base_msg.h |   6 ++
>>  include/linux/firmware/imx/se_api.h |   3 +
>>  3 files changed, 131 insertions(+)
>>
> ...
>> +++ b/include/linux/firmware/imx/se_api.h
>> @@ -11,4 +11,7 @@
>>  #define SOC_ID_OF_IMX8ULP		0x084d
>>  #define SOC_ID_OF_IMX93			0x9300
>>
>> +int imx_se_read_fuse(void *se_if_data, uint16_t fuse_id, u32 *value);
>> +int imx_se_write_fuse(void *se_if_data, uint16_t fuse_id, u32 value);
>> +
> 
> This API should implement in fuse drivers. Other consume should use standard
> fuse API to get value. If put here, it may bypass fuse driver.

The reason this is here, is the downstream implementation in linux-imx
and the current code organization. I thought there is some good reason
to have shared functions and it looks like Pankaj structured it like
this so all API functions live in ele_base_msg.c and the internal
structs and defines in ele_base_msg.h and se_ctrl.h are not exposed to
other drivers.

If I would move this into imx-ocotp-ele.c, then I would also need to
change how the code is organized and make the internal se_api functions
exposed to other drivers. I don't know if that is really a good idea.

I get your point but it looks like this contradicts the intention of
having a clean API in the firmware driver.
