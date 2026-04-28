Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013029.outbound.protection.outlook.com [52.101.83.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E3B402B8B
	for <imx@lists.linux.dev>; Tue, 28 Apr 2026 13:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777383970; cv=fail; b=CbYqsvsdltdpRvByfbMYLRFD47keni3y0wVVyNqcSLCG1zyY6DrtpnpQI8rIthP/I2tkY+UJqnGvWXO8rcnjcFBmKIs24cbIT+G7FH5nhvJk4jwl0hnypeIY06SO6CEEbp0xaWWZ09r6tjTQJ9fKSyKbqUTtWWtQZCJHphM5d8g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777383970; c=relaxed/simple;
	bh=K+BB3NL89Yn2KejYYY7+Nx5trYhBXt6fURv8LmDBlbU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MHN2EGXbbbFu8EdVcciPKTt2UJTlIfd7sd3YKR3CUaJ8Ql0xS+TzL+edr61aVSafmuLg9LaWWBZEVvg6nroWP/H/0lZo0MQREgG/x8vOim+/JW1Pkdjvyirv9AHluq48w39NgVmjrEJHpTzZQxs476HBBhcPENlMz3SaA2k24+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=avH70yta; arc=fail smtp.client-ip=52.101.83.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="avH70yta"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=APNDG/3Y12uPaE9qkUq+ao2CFWjTMNclLA3whmzShCHeUIhv9gwI+M0ZhzBOQNEAPEQOpaj/Uhe+YIjyHUXhZLAmRHR945QyX7Ode6XHeXuITBE5Dyj6lsDZQXREMStZSnQzzrQlkN1kWTjBRFh1tryJK0jN0ntG9YwSZWOznid+4oOSrTkl8zg94I7SVIlmtPixDssSVDtvmTDPyK1cpOxzIQhI4PsmMP6n6aqGOgv8VPu+kODwQObZlnwqUsVKGlY6+9G8nLJFCdJUtP20y8JTHifRUq640U2MEnMALOn+eWNU1jy1l0h7yvhi9Ygikr6XIH8HNUHQJe+NixX52g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s/BbR1sgh93yDXEabIBXbN60lFNHSry52ZI7x94pCZ4=;
 b=u0vWdrOFJVke5ZkHirSu1ejc9EmIAIImD1Psfo+1n3gdfH0EYXhCwc+EMLoPWubpOA/bo+9u47Z8Fy3AqDIULTQfgwm+4KclRKxcojop0mpf698GLJBPtcMbGpb3hUPYn1Lpv7qPnAmyFsELchRm8btnPrjLzhm/qOVzjP9AhhwSoobzFgB39OK5gmEHyoMlBJ/6DI6SI7p3f9TLnVRTfRbdiBMwjqC4Zd2+FLMk736fWgDdf/bLMjX0ulhi3JKMTgm4Bo36bqsLpMHHmCrEd7tKifjkS7BqfLwWkDsWMzLmtj0t7AdikPEpBUnLaBS3C0fF8DS4M0XDTsfQhJe+gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s/BbR1sgh93yDXEabIBXbN60lFNHSry52ZI7x94pCZ4=;
 b=avH70ytaNQkWyBcU6P3E0msBbTXidiHiYOUf2KRV9mOpB5fOrvVbUyeBiHcl/i9khMuuAmkvPIIo9j2s7LMsbAotbXx3XlI3gf/Kcn8mJxf1Ti6Q3H0PcTtTqAhP5L8VZtb1R1Qojqw90tSPAok/eWnFgpFCqMFbl49cVI3d9B6HLaE/lboRLTMnrxzYmHTxXzcwKgHeuU556GsStbr3L68m7V0oy9dvLE646y7REaH7J9Nw0uUmCjFyUyfXkN3tSYCOHmVDN2BxQXBov4vKVOiNDAge/8XJ8nVFA1bbdvETay35pF9uXj4ddq65d6G2NzTM+ZIASJLw0pn87BMwVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by PR3PR04MB7308.eurprd04.prod.outlook.com (2603:10a6:102:80::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.46; Tue, 28 Apr
 2026 13:46:03 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9846.025; Tue, 28 Apr 2026
 13:46:03 +0000
Message-ID: <dfc04c5d-253f-470c-b32c-2da080e91139@oss.nxp.com>
Date: Tue, 28 Apr 2026 16:49:17 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drivers: remoteproc: imx: add autoboot support for
 A-core remoteproc
To: Jiafei Pan <Jiafei.Pan@nxp.com>, andersson@kernel.org,
 mathieu.poirier@linaro.org, peng.fan@nxp.com, Frank.Li@nxp.com,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Zhiqiang.Hou@nxp.com, mingkai.hu@nxp.com
References: <20260428090819.17761-1-Jiafei.Pan@nxp.com>
 <20260428090819.17761-4-Jiafei.Pan@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260428090819.17761-4-Jiafei.Pan@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::8) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|PR3PR04MB7308:EE_
X-MS-Office365-Filtering-Correlation-Id: 24974c79-aaf9-4d1e-23e0-08dea52c7d7d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|19092799006|1800799024|921020|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	L/oumAJUX88lNriSuyY1d9lnCxBp1mAwxqqEL6ZO9nXyMvRmvfLa6epO0kUKVsXU+Xd24eAq4VPQnGWupm+F6aUIRni2jcV3TG5PLJvBKW9yWlFvgdM9+T+/xr725IK7dXZjNPb7wOcHjzMEutLjbYwMLqDRW0OuiC0urbl+5hxnR+gL6sE6YGqoJ8iJLnjjaJXY2C+UuAJcLU5hte9GRIgt0euT1YBWDLfYcO4UVTxKBSZyUuYB/bwaH87UE1GZqmwN6dXKs/8vYio6JH2xKCwnxHu4IY+/0eKDjC66/e+be3+hRebVyoSSRfbAXRDk0OzSprHYa0cyIyEW3kXyqImJlIgr7XmoejXanKawct1yAN54QWq/tjbtilbhGbcYQTuF5GWJgg/vjVRLmnyfB2ni6rL1fpB3qAJOutzPMJ/51lvMzhIrHAlrC8dH3HHXEF/MOPzDoPR5DvqG0VKlBCu4igEIbOZ5OsGnxj+LJOnnqiBAou81B+zGnHpXW/9hS2LURLY5miChKqTNN/FO8tw/GjpUCp4ukBX9/1ybIGLto3PTddwQSe5m0CBzheaWxaKOx/AZU7LtaAPPxvsG/YAYzMYr+Y3oprp4OqaROhYa90jBydftnAcYYH/GlhMIZajNdhf8OGtQh1cqoDfNet/CsAau2gXekb8KwZ4QsmmAz9Cw56VAnFTSOVzXLjieY3VHnciqyjdJ4dA0Oq/KZwJUcMWoajWmuCVEzxc55KI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(19092799006)(1800799024)(921020)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MmlIZ2pLYXlMdnVMWXZkUktBSk1tVytDR0JXcHpXTGRYYXk4SGJmMVF6WW9w?=
 =?utf-8?B?VnVSSlpWb2o2THNpemxUTlAvaGt2NDZiMWZDUXMxWWtUQ1hReEZ1NXBBVjVa?=
 =?utf-8?B?VFo1Vm5BczREU1FUcFdIZGt5eXFNZXpDQUNjTUdoZmM5ZkFnSGIxVEdZeGtP?=
 =?utf-8?B?KzRPOVc0bzRUQ2JLNUF4NzZyVEZBZlRjSGFlM2tqZlRNTFJZdUFndlNMemFq?=
 =?utf-8?B?VjFvK3EzRzI1UDB3djAzMVArV25ybkxyaGoxNW9sRXQ4TXBMUnF6em1HWmxM?=
 =?utf-8?B?dFFOL21jSTBoL3J2bmNtYnRpTEhzYW1TbzFXaEJrbktaaDlmQWVLUjl0WmRY?=
 =?utf-8?B?Z0lWbWwwbktuR0JHM2ZUL3Vlc2tkZndoOUdiY1pEQkI2QW0xL1ZHcWtpY09P?=
 =?utf-8?B?UWVPSnYrYjdxcHkvZklRWkNIWWdHL0NweFpEbzJDSVdvZkczd05FQnV0RytR?=
 =?utf-8?B?cDYrVnpHOVorUExZSEx4RFFuY3drMGVybFU2dmlFWDArQld6Sm84VkdocWk3?=
 =?utf-8?B?SmtBYVBZN0dOSTJuM25ZVG9MdUNxL2t0YzRmNnMwSG4xYXpWL09wTjRYcWpF?=
 =?utf-8?B?Vm5RbXRyUUROdmNuVzZwSjdrc0JvYm5wVTVjdklHcTZqam9hS2pMOGFwbW8y?=
 =?utf-8?B?WFBlRWFIR0JsNzk4bkd5NjlNcFpqcFk2dE1oTWlpZ3hrT21maHMyVUx2SWFv?=
 =?utf-8?B?RkJsUFYrOFl5dmluZHFGOE50dmxhRVBJZ2h1Tk1wVU42b0VHdzJtdHlKNmpL?=
 =?utf-8?B?M0trNDhtbm82TytUajBhSC9vTmhwVnFTUldKYVFHUGV4RWdoVDdEeXZEZDU3?=
 =?utf-8?B?WDJ5SXA5bUNHTUw4N2xxYTZLcnpGbEdibXFLZ3FVaCtWT1ZsZFVaRG55dXM4?=
 =?utf-8?B?TDM3SzN1dzBXZkxjdGlyMlhoTFZxZEora1F6LzdrVG9uWTc5UGY5Q3FSVVhz?=
 =?utf-8?B?dEJYRWREK2w0TXNnMFoyOXhjNERSNkVjSXliWm50a2NhQU1ON2JTZ0FOUTB2?=
 =?utf-8?B?R1lYWDF4dGJCRWM5YkpQNitIYlFQb1ZkMUhrallMSFAvZUdiQy9oZXpnZmdx?=
 =?utf-8?B?b1gxMjZqbkdsbjZVYWkyNW9tVEg2RFNtMGlzeDV3QllFK2tsclV4bDc3b3A2?=
 =?utf-8?B?VHpDUThKaUFjc21QazBiYTY5SHVreCtuWjJPb005QWZKeEF4UVRoS2h6STYr?=
 =?utf-8?B?TXFpY2RFanZqdlhZcVRoM3c5c1gwbG5SWXhoNkI0TURSVDl2WUVRaVVCWVQx?=
 =?utf-8?B?WEZuQlY5Rk9Ua2I2Y3BJcFdNT3JFZVg2UnhpdmtXZXlmODhtMkxic1pEV2s1?=
 =?utf-8?B?ZEgyTXFsV205RDQxckMvVmxvZk9KTERQWnRQY0wxRHZBLzFITWErTHVESjZC?=
 =?utf-8?B?cGxobklkMlFKYWY4N1E5MUREZCtKMEZTUDF6cTVUVExqWk4vZE51QzlXT3Vn?=
 =?utf-8?B?UWltaHJJbEQ2MmVHME1pMVhHYnlJRkdiaVNTODFNbTk1ZzJIRUN5Snk0U29E?=
 =?utf-8?B?WHEwelh1RUgxN3VWL3RGT3o3eHNWMG91TW9BSHE0bUZScURoVDFHN1psYzZw?=
 =?utf-8?B?dTdTVjkxS1NzT1pSb1lTUVJDNWhoNU5JVTlTYzBma09yZDRwcFg4UDdyOFZ3?=
 =?utf-8?B?bTQxOGRLSWk2VHVVL2F0RHRDbVREelVsMG9mTzRjSURWK1A3cm05ajBKN1J0?=
 =?utf-8?B?SFQzZy9LOGVXZVErZEJpNlZUNWNZckY0aENzUXlqUVVNbmVlc21vQUtBYTVh?=
 =?utf-8?B?QmFmNm42WXFLSjUwRHJZYmdlRWJaNjZYbzdMSkFNVEgzbktkSnp6V1prZ2h3?=
 =?utf-8?B?bElOREh1Sy9nckNpL01YbUVYVXBqWCtwNU5XQUlTY3MyeS9FNzhqblJ4VGVT?=
 =?utf-8?B?YmRaZzhPTWs2eVIraDllb1YzbHpQeXRzdlVwU09EUkwzRVp1d2VOUTFYRGNv?=
 =?utf-8?B?UHBhdGFBOVQ0NXRucFp6eVpwQnM3bFpTSmNmUS9lWlNGTTQrNFpMREQzc2t4?=
 =?utf-8?B?ZkVxK1BFZll3Q05iNmJjUDhmWUdnZEhBMU41S2lrNFpuRmhBWlFjY0taOTRZ?=
 =?utf-8?B?MXUxTFRSREdmc1hCa2gzY2g4bTJqWS9rbDZDMTVSR1U4RjhWdlMycy9lTnR5?=
 =?utf-8?B?ZU91amI3QXJsOWNpU1hXRThER2NhYlhSeGNHNkQ0MHJneUN0NlJmUFlkdm9s?=
 =?utf-8?B?UWhuM3ZVVHcrbnUwbThmUGF0T0JPY0s0ak9lNEZnM1F2a2M3Nzk3dnV3ZzZS?=
 =?utf-8?B?L0NzNHJoMjM4cXI2R1p4dHJMcld0ZjFoaHN0d1NaZnlnd0dpNDFwbk9NN2lr?=
 =?utf-8?B?TzEycXFSVGFobE9RSWtFNDVqdHZLTlFCR21uME81OFZRbmkrOXIrQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24974c79-aaf9-4d1e-23e0-08dea52c7d7d
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2026 13:46:03.7509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5tguW/wIhktjWivc5GiA8unxIkXa3hJDwBUTnP8UVqsTEiA5SLvMY7cwUO4Bk12GHzGrsIAWKk6SuQ4HNdjXiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7308

On 4/28/26 12:08, Jiafei Pan wrote:
> [You don't often get email from jiafei.pan@nxp.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> 
> Add autoboot support for Cortex-A Core remoteproc.
> 
> Signed-off-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>

Please also add your Signed-off-by tag here.

See: https://developercertificate.org/
