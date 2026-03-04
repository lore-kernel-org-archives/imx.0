Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013039.outbound.protection.outlook.com [40.107.162.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E484534A3DC
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 16:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772640489; cv=fail; b=gaiNqjThhg3uGDvyX2LMW72UepLxf9yNj9kf5FYArxeR8bt76f4XlwJoMWNSQUzmnedLCjUdnCGjynHBMDaONA1v6htdKina9vpAH5kCIbOj1ovaelDupYc24p7nKF2XgMz7kSPwx4PpW1OvH5XEjpaOd5w5DwUdCUz5WS0s1TA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772640489; c=relaxed/simple;
	bh=GeuTf80P4T/KWFlRGPmZNlIr9xct7ndxz0hM8msV0ts=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=s9gyUcFazXE2WH9BeaBgH0aacBfgw62/pS/3dNfAqDQ+Iu3I4fboM2HTQIdbVFeEGVqHDs35T9n3lMs+YlPmRIsPblIuOTwQOZhKqEqPiI2cp0zGdPb5QsJ+hdZfwmK1AXTHDlNpr6Q8xxsCxdQUwTPM8zyvs1snhcLCs4vTbo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lQTJ+E3r; arc=fail smtp.client-ip=40.107.162.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lQTJ+E3r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vuR9QgMEuZvqUE5RPr1EJGBHvg0rQO/+aqxNvrwokqA7ijv3yQVaDnMq6yYgteonhkFHTDOSnwZfAbOuGL5y+MUs4WannZfqWJCliGUHs8SeB3zTkOD3i4WpGhE8v3RfmMVfrLnBL0qDPALMAxLnunnxK2WupQPOUeO7MHIAGBJrsW7qgZegcuxaSq7WThQ1VjiRhEupTZ07mQoehkC/qN/OZOxKBOvWTrSI4AYKvwY+PTvIweL1hGwjfLRLt3IXKdo0TNYkSSAyozOcp8MmJtuTFJbWqoV20kU2etj0X3fe53PxNzv1nAj0hdg3W0B0wySoAdjpCang2djBQVfyxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UfWJR6wmFSNLFEfnMJmKvDeYCSJW6QBHid23mpXsXm4=;
 b=V63cQ12Z+7/ecu6NVgmfMYdhBfET3ymURwO3S6e62SfUhmcl0Tzc4iRE5VFcYn6zszlRUiwUvXAUNAYe2/zISOYC0drKzqtkMM/2S0OzdcWhPePa9P4E8CF+UHSsuo159yTuXtHBgGV8VftegyOQfUlg0WzjRYROz5AskrGWYd0ztyEM3o4JL8eUdybqsi7RztI9kJp6NGLAh1hS/MCfug7F4ECbf637aJd8rwQzE2Gp26EeXwH0O6WlTriQqeHLQrg+xm0AtCI9LnNDHInr2IKBAFI6UHqY+be/nNcA8z3ZFWYuSWXsAweloizVBaW28TDCQoWz1UbZzKa12pe+7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UfWJR6wmFSNLFEfnMJmKvDeYCSJW6QBHid23mpXsXm4=;
 b=lQTJ+E3rXcs/AipwS8+RjLQgwu5UdsR/aSKojZJrcC0S1LSJpUChkC8uLlhQU+5a/9FQvtK7glgVx+5DQISx82Cg4nIHI+ELFCVf4n/AWeFT3NSzuB1C6ha07Bx30KB/eoKREuGYjr67YqWECcovMQH8zMfLJl3NYLbbuabqb5x0rw3VdVQ+IGPbrlI9InUQRw/nDEJRDspMRPUcDLuN45Ee0lmjZVxcers01xeEdk5Lxh2p9FkgHExOHh5wTfCoyuAFam95KdlFM7iA5RhkBoKd9JGfKObrcp5U8m8BC3Hf36O4PbQgjye5okbbux9ErFqj8JWHv8qDO5IajD3AhQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 by DU4PR04MB10768.eurprd04.prod.outlook.com (2603:10a6:10:585::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 16:08:01 +0000
Received: from AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed]) by AS8PR04MB8247.eurprd04.prod.outlook.com
 ([fe80::e99:f504:ce75:9bed%3]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 16:08:01 +0000
Message-ID: <00f3e52a-05d1-4b47-8799-2c5250d27c1e@oss.nxp.com>
Date: Wed, 4 Mar 2026 18:11:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: freescale: imx95-toradex-smarc: Support
 Cortex M7
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260303121324.1576841-1-ghidoliemanuele@gmail.com>
 <20260303210131.2966214-14-Frank.Li@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260303210131.2966214-14-Frank.Li@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P192CA0053.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:658::17) To AS8PR04MB8247.eurprd04.prod.outlook.com
 (2603:10a6:20b:3f2::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_|DU4PR04MB10768:EE_
X-MS-Office365-Filtering-Correlation-Id: 133775a0-4c11-47bd-8f80-08de7a083592
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	NTjDkRo+lxhHwsVnNX16HALIjZN8QOGV57SSVuI6cjmmZZY+HjkA0YFCJmNv2gyN6wHMdmyMaofIPFw++shTJUwpZ/7RsAeth/izc6JhwYgC9R/GR2ez7I9iLaRRvAsOzx7ET34O7UeA1W21ugGGgsadLu7ezRdzadIprwBXl+jR1tNUeq79GKK5RXzJn4MkaJw7xkR/QxqIEajosw4I9Bwd0b0myM78C8mD4i+EqysphZBo1NwarnN8B/wkZYf6C4i0sActU1cndu9L6HRKA0m12j7TrUQu68oy6Sy2mHI2btGLvJsj53XszF9RbK3lMkn0IG5atTmz9lV25WbysjOMJjWlO7Ip9JtHjuGF4h1d6qFO6G8vDHS6DH45EHcduVIZzdB6JixXOuIMYUpFkGoHrgzDwenDENFborI4CVPfL2FeaQALOk9+YSSDBwy0qJuQLBJH0sXE7ui9IdML0IJ8Rc7X3/b0u49ZKouiF1B26cix/gXQjfNvwHEaIcE5dqjOukupxzOhpvMFbnQhaCYWo3SvfQz+vm6rEeFZcudx5oJK6k53n++oZvOtLH6IKqQpMi9dbU8hrayTAy7MDmcKYvFHkJRGFqi0YqMj9AJiUBp4iKQd/m4GiZ+Sqdofxm7UZvNLpQlIlZfGdiIAG8pleoj5E2B/Om1Sn6sjWkwqXyYsj+Y3BsiP2TWQ9yLtAxgBisHCNCX5kRWamXKN+O0peVA4iHLtjlPz5s1GwyA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8247.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VHRxT004ZHIyeUNrbC9HVTRHOWtKOWx4QnBUUVZXY09iY3cvM0FTU3BrdjRr?=
 =?utf-8?B?UUxQemJ1WThXSTBJUjYvRlowKzRFUjJjUTQzalNnOVVSZ3pnMDhUOTFZcXhN?=
 =?utf-8?B?ck9FR0pvR3A1R1NiL1J5WCt4OFhHNndxU1BXdERRbU5MOElZanRvTUpXWVY1?=
 =?utf-8?B?QzFaT3doY3UreHNtNE9KUXlVdVc4cldqais5SWluVzBMclhqQlZJUE1xNzlG?=
 =?utf-8?B?VEpjYi9reGRNNmltQlhLOWgybk5LY0ZFakJ4UzU3MzZyQkUyYkU4b3lCbGlV?=
 =?utf-8?B?TXJtN0E1UzRVL3Fzb1VlN2ZVemQ0V3gzMGY1ckZCNm5zSXhycmNkT3dkYXdz?=
 =?utf-8?B?NnlsTmlnRWJqbEhKRHMySEZjVytkODNvRDhXaTZOVmRvdTZSc1ZaakFLd2Jk?=
 =?utf-8?B?TDJtTkpSTE1LK1Z2Vk5TQmJFU0lOMjFOdk00a2lmamszSFowUEZqcEZIcDFm?=
 =?utf-8?B?eEFZb212aWRMZTNpSXlrcGkyNWRWN053QVY4aWNvd09CZ2tyNDkwRUtlcHRW?=
 =?utf-8?B?c0lUbnl4SUNYUzlCZ0dhdzlXOEFoS3VDTCtBVlB6dC9zVGhxN3JTZG0rL0VG?=
 =?utf-8?B?SVhDMHRHSThxbE8wNUpUQU5sZUJxV1g0RThsTDJ5T2dPOU02NVpueHNHUFVD?=
 =?utf-8?B?eUtjMFpGdTFNQnNUejdhTmMrOTh4L2NUZ0hxZkJlOTdYeW9RbnJibEJMVW1O?=
 =?utf-8?B?YTBTdkNidWk0UFMvY1l5dnpkRkxWMEVweVJ5NUt3K0ZJZkxFa3lkK2toMU1X?=
 =?utf-8?B?S1R4eW9xWXdZa3BrWkd0NXpIOG1MVzkyNy96MUNmb29CcEN1RlF0UWkvU0Vz?=
 =?utf-8?B?M0xHaGtZaFkvQWJxSGpLdXpKMEhCNkJIWWlJaDJ1azNlQjg0QWJUWXY0UHBU?=
 =?utf-8?B?eXBoa3JRU2VNdy90REN0L1VVMXlVN2IxOWFkMzFqa0xJUEJkeDlNSGZaVG5y?=
 =?utf-8?B?aGMwbXVjVnhQbXZ1NkJnNnR0VUtqUWNIVThTVEFuZlB3bGg0aXYwZ2F1bjNE?=
 =?utf-8?B?L1JaMDV1eU5hVmhFNWdrQmh4eHZpSktnTXpKanU0ME9CZkg1bW1heHRqeWFi?=
 =?utf-8?B?UVI4Nk16d0MzQmU2NlBNYlg4QWNSNkVRTnlkZmV1akxpdy9MbE1YZlQ4YUNq?=
 =?utf-8?B?cS9FbFhneGljK1EvbGhHYmZUTzhZN3lqamVoamtzRkowUFhQbEhUSmQyNEZy?=
 =?utf-8?B?M0x4c0ptMmFZeGhNRVA5K2REZkNsTlFjMGIvZ3IrN1N3TkV6YkdTTGp0MEo2?=
 =?utf-8?B?L1JkS0lsQk9nVTdvZVRPTHNtdFQ3NDVqM1ZhZ05WRjJwR092SGYvcmZqeElp?=
 =?utf-8?B?dnVzdm52OWxvTHFiclFMU3YxRlJHUHpGVGd6VE9zTzVSWDgvdTRtc0hpb3NC?=
 =?utf-8?B?ZUMrU2M1TzdDU0l2R2s1cE40NHVIM2dUZCs5VVdnR1RObzhGa1RYbExGa0xj?=
 =?utf-8?B?ZmNyUWlwenVVb1pJckdFZzBvZ2FVL2VJWEcxV1FNWXZzUTBRWW5RY1A1aTdW?=
 =?utf-8?B?RkhWTGVWK0FTK3RKQWxNSzVpTVlCTm1FTUEwbWswYUdodmI0YTdXM1BDd3RP?=
 =?utf-8?B?WVI4Unp4djAwUGJVb3lIblIrYXBwRytiZnd4ZGU4YVpLekVubUtkMEdQbHlU?=
 =?utf-8?B?QStCVDZrLzVRTEF5cGdObWxYK1RFVmhnSEZad01GNTRacSthWHFNSTVaTndY?=
 =?utf-8?B?YUNaNlpHeHZRbVNiWWZ1N0x4Mld0Vm1EcndvYlpHcDBXekdER3hhYlE4Tkhu?=
 =?utf-8?B?MlgyTnJPWi9XV1ZvYkpHVmJMTnUyK0FGWGUwem5HNXFZcHRjcENuQ0JhNWta?=
 =?utf-8?B?bENJTDMzR1hNaWZ4Vk5wNVBCaS84c1h1QUpuM0RHS3Arc2E4aWhBdnJBSzVt?=
 =?utf-8?B?YktHVTZoSkVoM0RQSTRUdkROVllaYkFiaUVtTngvQ25Oa3ZlNWJjV2cyWmgy?=
 =?utf-8?B?TkNNZTVSem1Fc1FuVDJZNGhiSjdXVjA1a1ZrNWNLVkVJb0hLRWRxOVRkemdD?=
 =?utf-8?B?ZGM4dS9yaTdwLzNxL2tGa3NOSStVUkZHaS9Wc3hYREhhZTRZblVvRXBIRkFX?=
 =?utf-8?B?ZWhIVnRyNytJSlpvMDdxOURTYzJCcUJTdm4zL1oyUzlWOWQ0bnlzYk40V2Zw?=
 =?utf-8?B?VmtPU0pPeFg3T2dYMkpuYWYwNDc3c0dhZWNZZ1JrK3JYTUpKd0xPckNlUnND?=
 =?utf-8?B?QlJyV21iYi9kd2syUmFZMXB6YXJaVkl1Ulp4MG9rQ0lWamdYMVdhYXFQTlhZ?=
 =?utf-8?B?SC8rSEtreU03NGxFZ0pxSlVwWkJseWhKUTNBRi93MXZLelNuN2lIWE5Kc1cv?=
 =?utf-8?B?UmNpci91SkFUMjlhZDRrc2RNMEVkcEhlbE1PTS9tTzZ3clc2VTZiQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 133775a0-4c11-47bd-8f80-08de7a083592
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8247.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 16:08:01.2732
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3B5jGm5xi/eSEGzIE6iS4BhDB/57Tgq4HqOqe58puZVdef8EC9bLZi2C7IyFQvPc/cAIZIZ+5kk1hwZRUzYivg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10768

On 3/3/26 23:01, Frank Li wrote:
> From: Frank Li (AI-BOT) <frank.li@nxp.com>
>
> AI bot review and may be useless.
>
> ---
>
>> +	cm7: remoteproc-cm7 {
>> +		compatible = "fsl,imx95-cm7";
>> +		mbox-names = "tx", "rx", "rxdb";
>> +		mboxes = <&mu7 0 1
>> +			  &mu7 1 1
>> +			  &mu7 3 1>;
>> +		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
>> +				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
>> +	};
> Line 51 exceeds 80 columns; consider breaking memory-region into
> multiple lines for readability.

Frank please relax your bot!

As of commit bdc48fa11e46f867ea ("checkpatch/coding-style: deprecate 80-column warning")

there is no such requirement for wrapping at 80 chars anymore.

<snip>

>> +&mu7 {
>> +	status = "okay";
>> +};
> Ensure mu7 node is defined elsewhere in the base device tree; this
> patch only enables it without defining its properties.
>
Well it should fail compilation if mu7 was not defined? Sometimes this comments can be confusing so please

review them carefully before replying.


