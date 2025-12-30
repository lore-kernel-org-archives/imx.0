Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011012.outbound.protection.outlook.com [52.101.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1477B2367A2
	for <imx@lists.linux.dev>; Tue, 30 Dec 2025 02:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767063327; cv=fail; b=PXFx9Ef+hSjQuHtXQIcEOlyNmf0uvFTJAGbM3pbcS8diCXLGbS0uDEF5e0UpHN9pk9YLo1yxTHo1eqamPwRHhNKWZgQmLQ8AUMtWglk205cY9Gw6Y0pp02XJpeooz4pFiwluCCocFNlK5ARdSOq+QsJE1F8Wsq23k6vwlbw5SRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767063327; c=relaxed/simple;
	bh=r8b5OFg86HO9OTHrCNpDBFpMs3+vQ8vTC0iZXlitfNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=p/9mFOokWrCorCIeDPtAjUKFaBgf8ar9XQW70S+LoswjvJf8BM89qhYcDFh3RQc3vuis1QTbPp/8l0HXBhevMMoYdqQeSZ0vu0QFjGf2OymsYZ61F+IOqwwmcnLbQ7BEpykOpDkVwx5PyCHnUedSwVuIyGmuFwboMtAGoRjkXDY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BrpgUBQX; arc=fail smtp.client-ip=52.101.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BrpgUBQX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U/DbFOkp8OPNkvFEWxJuOP2vP2NUMCWCWMq/BTIdPvemhiupiuX3Ve+0uHU9yAQWEeO0xzhraZJskue3EkFjpgZQEf1An/UI+oxiPTNOYk84q3ZS1Zh9a9ZXbcI/cEiGpNd48rZ3SXPo0slynw8O/7Vd0x6A3JYlJM3sNYX6RfZrZQ9PLy9T1jX7CPyS8iy0M6WZWQWF4wXMrKBotg5MLiSZy0K6kIi+gG3AKSEjwgJCqDreiND0k6oNIuDQ8wIRQ/OeYVHQNo6YekJiaofMZcOAxm4T8u+laefjPFx1CDlRwwwyE5AB/XALK73UaoI6vmX3ss1mNvwtreLwhy2l7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9ShJo+EIXedlMIYbJ9y7NHvWirDrb49Yq7xIyk36u/0=;
 b=y77fo7ma937WAwZYD8mpXB4W2hE0/u9/PS43dBQsljXqpd74Wpc/HwXUOVr5t/HW1lOHL5KXJYP1oB9AhrBTsAH3vHRszEymj6XIlGIijZ8R4AAw098uMu1cQ4bIzB0f488Qu3EjfIBeoymMTC8eb6aNXtGmMyGYeS1yvghBfoXLq7UdGjGCqfTk4YMKS2QKCLI7rQ5aJnm1AGMkiaeppiJ8IQgONYl/j5sks9+QMhSDuVdbfLriKj/bFw1s7oASjrYffaVfri6C7kgkg1nHW21JN3raNgi1L7Ki5eD62gTFVO+/zTHvgJPIrkwjJ4Z+muUfYKnupQvP8uyFfJzKsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ShJo+EIXedlMIYbJ9y7NHvWirDrb49Yq7xIyk36u/0=;
 b=BrpgUBQX4MrZNz9IfUt2JxKHIkMZDohfT+y3DcffORuUy/1iL0STo20/nJlHr1YBnnzxc6mjDgPsrY4x1od4FarqGNbiFB3Nm3FOcwmjqReK39XTkmynLVhw7/4uAftOmxhXUECrC4K34mug5R6ZOZEIoZEB8LNgP7byWo5d4/gB1O399PTkuBNexashzM1OaRixH4VpMxusSvWz97F23+9mkJh/A7i1teV/YPNNkrzFqDsC+/VQw+bD+iZksJFHQAsZ/ceFnHNPQi1OVPOW/R9HLGVYMj8+vf005rqzuTGrhGTmX39bJga3vpyG5zXRNfb9YCD8tmnUoaVV/QSIfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by VE1PR04MB7213.eurprd04.prod.outlook.com (2603:10a6:800:1b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Tue, 30 Dec
 2025 02:55:20 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%6]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 02:55:20 +0000
Date: Tue, 30 Dec 2025 10:53:50 +0800
From: Rain Yang <jiyu.yang@oss.nxp.com>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Frank.li@nxp.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
	festevam@gmail.com, imx@lists.linux.dev, jiyu.yang@oss.nxp.com,
	kernel@pengutronix.de, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
	robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org
Subject: Re: [PATCH] arm64: dts: imx95: Use GPU_CGC as core clock for GPU
Message-ID: <aVM-mSkSubMPd7Du@oss.nxp.com>
References: <aS-lEibp3zTsaR6T@oss.nxp.com>
 <c6e0e55a-06da-4665-972e-e9b5b8c08bf7@mailbox.org>
 <aTACuRjC_Zpf8IOU@oss.nxp.com>
 <de36091e-c890-4897-b3e3-2a7575029a5d@mailbox.org>
 <aTD5np-HGaJqhzkD@oss.nxp.com>
 <5944d872-01a3-47e9-977b-029f3be4fd83@mailbox.org>
 <aTKVMAMQ6v_BwD6R@oss.nxp.com>
 <9b593731-898f-46a7-8ee5-68f8c170351c@mailbox.org>
 <aTYxm_dfMwF4H0_b@oss.nxp.com>
 <53ea529f-3538-4ab5-aa99-0caa6729b4cd@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <53ea529f-3538-4ab5-aa99-0caa6729b4cd@mailbox.org>
X-ClientProxiedBy: SI2PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:196::12) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|VE1PR04MB7213:EE_
X-MS-Office365-Filtering-Correlation-Id: 42f9703f-8b91-4861-1641-08de474eded9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bHQzTWZwME5qOHBlVFVkeFMrU1MzZER4ZVNKSmJuekNmREZoYTN2ZDl3SVB4?=
 =?utf-8?B?TzJmeFhMWWc2WVQyYVJmSTNXZnBicDdxZVNHazVtSkhiclUya01RZ04xd3px?=
 =?utf-8?B?aFJabk5TRGdIOGQ0RmdxbnJ5azdYVkdoMlBRdWxBczExY3ViQmtZRkZMcHJl?=
 =?utf-8?B?Yi9veERGN0F6aUZkL0RFZlJrRWtCemVFQ1NJMXRpbjIzV3N1WEFlTWJlY1c0?=
 =?utf-8?B?NVFnVnVEamk3UU55QURGcWNIT3Q5WlpZTlhkVjkwT2xjNmo3eGkvZGVBUkFM?=
 =?utf-8?B?a09FVXZPcDVtVUZidHp5Y3RZUGpLN3B3ekYwWVVEV0M5NVl4TzdCN1ZzTzkr?=
 =?utf-8?B?WFhnelYzMjZadjB0Z2t6L3Y1K2VWeUU3KzREUjhkL1FPZ0VEamFBMVN3eWVr?=
 =?utf-8?B?MDZJNElUek9neGl3VnlCT1B5Um5WT2hsSlVPMGg0WVN0cGxiUmNoNFJHQ1Yz?=
 =?utf-8?B?RWR0aEdtM3RXemdHOWgxQlI4TExDc3R2YWptaDhrZnd2T3pBTTdVUlRJaGdW?=
 =?utf-8?B?MElWaTMwR1JETG1IUEZGUjZVL0xmSGJqeVh3VWk0UDhiUmdBbW00RmdRbk54?=
 =?utf-8?B?clR4b0h6SE5WTVM4N3lVMEFFQ2lRNVNHRS9hMlpVYU00dXRVeitLV1d5eTBt?=
 =?utf-8?B?SE5LTlo0bW1melNRemhNVi84bFRNdzNUbVA4SlBObUE5RzdvSndnMnVGS2hk?=
 =?utf-8?B?czZnNEpkZG5RaTl3bkNzc2VybDcxSnByVktNZVljZEdkZXhudjBlVUV3THlh?=
 =?utf-8?B?YnhSV2RMbW02UWw1dUtPSHZpMFNMOEFLd2habUd1QkJ3ODJvcVEvZ0ZENEcv?=
 =?utf-8?B?bnJSd3I4M0tReG82b1A3bHdXbVFabUNUQjFOcWpCVlpPUDZZWGdCaUFrQXBI?=
 =?utf-8?B?TEZZQjdEOWJZSHNRSUhQS3VIUGZxMm1qeG1LemRjZ0lVRDUvZWUwblk2ZG1P?=
 =?utf-8?B?TzN5aVNoRkhKV016Y0FuUnF2WHoySGhZTHIvMHl5ZW1nMGVncWtRcDUvOHVs?=
 =?utf-8?B?ZmZRZUpMSFErZkZBREw0OWtxMkw2VUU4SW42V2gwcjNQS0ViaXdPdWVQYmJP?=
 =?utf-8?B?KzQzZFoxNzJMNXBuaGo1RGpqNEdYbDByczBzUlpXWXhYMDhCSllmS3hSWDFy?=
 =?utf-8?B?TGY3YnhNcG14RGZ3SmU3Nk5sYXlnUTVhWFk3V21NZ294UjJMS0xTWHZ2dmZ0?=
 =?utf-8?B?djBTY29QWmg3eTJtWXZtTWd2Rlhvcjl5YVlxeFg2MzRzNkgyVGhvK1E4Vjlm?=
 =?utf-8?B?ZDZVdnowOWc5bVRwdGtCMHRmMXVGWUdPRXhiVnBvMlk4YVE5WEdiMHVURktz?=
 =?utf-8?B?TkY0ZkdTcUJMMXdpT0FEVTE2c0VpVExSVTl1Zy9GYTVsdjVaV3pQNkRQTFA2?=
 =?utf-8?B?aWJzNnNYVDRiblcrelFTTEVIRlVUQkNSanQ1dHRqUG5SVnh6NDZvdHpBdEI3?=
 =?utf-8?B?S0JFa1crUlJyQ1I4WW1sOGplZVZIQVV0R2tReHVndGI1ZysrdmRsYUNXNE1K?=
 =?utf-8?B?YmxUbkEwMmdNL2NOVUZqWkg1enZCMDBMNHNnUyt1NWZBVFh4Sjl6V0phK1Jv?=
 =?utf-8?B?V3Z3RUFsZXBzSW1rbFVmakZES1pCZFBmNEgxRjJHR1c0NzlwU05WRVJuVFc3?=
 =?utf-8?B?b2lNcWxyUnQzenVjeDRpRzBWNmFZMWM0bFRvaHF3Wnl4a2VhaUZ0MDJRV3VR?=
 =?utf-8?B?Ym4zaEgrQW1DT09Ic0x1dTFWV0VJZHFwci9UZ0tpQTd1WDY0Q3JhNGUxYVRG?=
 =?utf-8?B?aWQ5WkxRcGQvbEM4bWorL2JsSm9HOFlnenpXbUE2WWpzc2E5NGJTakJOUWRt?=
 =?utf-8?B?Q1lTL0tEWW5XTjNFTjlzYVpXa09HTjdOUjR5MkZyc3BJTzdSRGNhTUtySCtj?=
 =?utf-8?B?d3JEQ3NxV1dyKzZkbklIMk9yU3hZcmdVb3BmNUZqT3lXMHVFN0M3RHZMUG5v?=
 =?utf-8?B?eWo0Y0pNdVAwUGZzL1lBVjNqbW5ZejlrTmU1OW9KZ29DcXVuYlhLclFYMmoz?=
 =?utf-8?B?a3FPc0tCRTJ6Z1pSUnl5UUpOaUllS2dKU3dvMmFHc2wrVmlZYmV6L2dTeGNI?=
 =?utf-8?Q?T1oPWi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZTRTSTVSWjlmMmxUYTNKK05SYkhTaTJwbk44VExqTnFUWXlRbGxubmxacWZS?=
 =?utf-8?B?L1puVm5wOUhBMm1GSDNrYmZtY2dxWVEvd2Rlb1h3R2x2SWZ4bWFoaklsRTNj?=
 =?utf-8?B?aGlqZVdoSGxTUkcydGlmSEI5KzUxdEVoeGMrT00wemswUWtXVWRpZzJHRWV0?=
 =?utf-8?B?U0VqRjk3SGVPdDROczloWTdIajdiOHFZbnFLSnVJQk9ZR0Y0UmE5NUZ1REpV?=
 =?utf-8?B?RmJVdGRkaTBaVitGaWlHTTd6eGkyUTJSdUpIdGdIazRmWUhaQW9rMXFKT045?=
 =?utf-8?B?eVBHYmZFa25OTXlNQWpHeStuMDFHNTczTjRNMmtvMElvbWR4bzlnektvM0Fa?=
 =?utf-8?B?bzF5QzRHY2c4WkFvVGNxUVdtb3hMb01tMVRPYXpEb0M5K2pSMWQzanpid29l?=
 =?utf-8?B?SGxGV0dJd0dMQXlVcVBFeVNjMnI0aXJxckcxeXM4V1MyU0MyQUpYMkdidVE2?=
 =?utf-8?B?K0p1eGluUStCMEJnSlJ4V0EyeVNyV0M5RGZZcFk4dUNveWxlTE9XTlBJdDR1?=
 =?utf-8?B?Vk5McUJjTm5SdVBGMWJrV1VnQkZ4TmRhNGVrZlVGMGdxTUdwbG9oRVFYMFJR?=
 =?utf-8?B?RDVuSjh5NHRKNDM4SS9CNTh3YzRYTnZaL0djeHJ2VHBibFU1VmFQaGxUaDNB?=
 =?utf-8?B?Ri9DckY1Rnp2OGpQZFNyQmdvNmlMM0lLSkNoOWUwNVJPekFjdGFrcTBMZ0lU?=
 =?utf-8?B?OHZvZnZSMDJQN0J0Q05OWXJjb09PNmovZUhsenFoZnVMVWhBSEUrU054WnFs?=
 =?utf-8?B?Wk5BdnIyTUdid1prVFpMdThPZkQ2TFNqYy9INHA2L0ZLQnFPN2FJd21YdVRR?=
 =?utf-8?B?Y0svUnBoREpLbmpZY2ZhSkhMeUUvQTBNaEd3UXZyYzY3alFQYUdUaE90VUFm?=
 =?utf-8?B?YVZLbVc3Y1pBeGNzVzNXZ1IxTkV1ZXVHallaaEpXNmVHVW9CcE1oamdObEVC?=
 =?utf-8?B?UTdKVzNlOWNXOXEza2syZzJqSFZuYlJWZXlxODdwMXNuZW5HdDFia2V0QkZI?=
 =?utf-8?B?UGJkeVpKUE5CNTVMZXZpNW9ZZU53bExGSTgvQVUzdjkrZkxBTkdtNE9vU214?=
 =?utf-8?B?V2RNU2syRFlmYTFOK2JhaDR3TWU3ZEFybWNST1lDR0hOampCQ2lJRDUzV2dL?=
 =?utf-8?B?WVBJcEN2VnNpd3c4UnRYakZmVkJJZmQ2ZHZpVnBrQ3V4NTRZVkVIT0VwWHhY?=
 =?utf-8?B?amJhUnc5R3RpdGdVV3o0THUwZmpHZndhTm1iS09qMXN5UXp1R2xqcHNib0d6?=
 =?utf-8?B?d1dmME8zY1dPTEJjUTlicFE0dmEzL3cySnR2RGh6Ri9aSGRKR1VodHRCenFt?=
 =?utf-8?B?b29FbVFzMVRpTmNKYVd0ZW5FOE5oWDZDUlNZbzhPbllQK2tERnZaV0N0UlpF?=
 =?utf-8?B?OTgreDgxb0Q3SlEzU3YwYzd6NFFkRUJXK0xRYWh4RU1TT2lEbzFDL3lWaEl0?=
 =?utf-8?B?ZDlvaFdRc25MT3RiUjh3WDZnUnZGRlR1NXEzcDFZbS90UDlPQ0ppYVZzbWJQ?=
 =?utf-8?B?MDhMazViTUI5VE0raXQ2azU1SUovcmhQeE5VeU94VVplUDA0UndMZWFGQ1BX?=
 =?utf-8?B?U2VKNEMxZWJkRXhRRGpaYW9YTXgzWm1vLzhvQitacFBFd3dCZFozVVlRODRn?=
 =?utf-8?B?ZVpuaVp1Y0tLTUF6Z2JITVRBR3h3bWFOYXhSL0ltTC9mQnFIY2JnSXpoR05O?=
 =?utf-8?B?TkFIVnhQc29UZ2xmTWdSenVlSnM3eXhsVCthcGdkMmxZSTl6T0Y3ZFFmZkx0?=
 =?utf-8?B?azdqeFo0MTNmdW5SdFJLanFoSFlRVmJLVmh2ODlnZ3NCdG55ZGFEY0RtNFNu?=
 =?utf-8?B?ZGN0Q1Q4RWJQUXZwMklVT0ZKb2Z3L3VKeWNQY3hpa2VqQ2grWDlSRDVrUHZF?=
 =?utf-8?B?MllvR0xOZUtqM29JSTczcDlvd2VzSldxTlVhSTd0Q3piWmtuK21Odm56d1RF?=
 =?utf-8?B?NzN5VVZTVkdpMjVQYzBHWk9Eek5oNkplSEdWU2I4Z1diR0pPcWtYTjhIOWlv?=
 =?utf-8?B?Z3E0cGpJb05xaXdTRzFMMnlQRG5UNzlKVWZ4aTdPYURPd2FqL28xN1NLL1Vv?=
 =?utf-8?B?L1F4ZXRnUkJGaXpUSlNHWllLRzBhTDlIaUFxTUx3Qm5PWVlTMTYvNTdlSmhm?=
 =?utf-8?B?SCt2S0E1dVhDeGE2Z3drS3gwNllCbmg4NS9nZWkrOGhhYlRyRUVocTh0U2Vn?=
 =?utf-8?B?cmRyUWI1TitRYWg3RzVsZ3JxTXpsSFhuU1YwMHZtckFJdEhBYTJFWjIvQnpn?=
 =?utf-8?B?VmRrQ3lhemV5MUJjaElzSlRRVk1WNEZuOVk0Z2s0aXIrYUNjSzZmeklVUDFW?=
 =?utf-8?B?NUhsV1pFQUJDaDZic2dVWUxycFYxbzNXVC8rdVdzTjA4U2RZZk55UT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42f9703f-8b91-4861-1641-08de474eded9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 02:55:20.7498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eZ/SCqR8ua1v4gUy/nSgErNL3iqskQSE41aunTeNSJsczUyNY7CWtbEFj8UXvLH8EG1o1qTthnLyFugBaVTzVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7213

On Tue, Dec 30, 2025 at 02:53:38AM +0100, Marek Vasut wrote:
>On 12/8/25 3:02 AM, Rain Yang wrote:
>
>> > > Okay, I’ll submit a patch later.
>> > > The commit message should reflect that only CLK_GPU_CGC is enabled.
>> > 
>> > The commit message , and this change , is unrelated to GPUAPB clock.
>> The commit message is ambiguous. Could you clarify which parent clock
>> you are referring to, and whether it can be enabled by CLK_GPU_CGC?
>> If it was CLK_GPU, CLK_GPU_CGC can't be able to control it.
>
>The commit message clearly states "These new GPU_CGC clock
>gate the existing GPU clock." and "GPU_CGC as well as its parent GPU clock."
>, I don't perceive any ambiguity, sorry.
>
>Frankly, the whole GPUAPB discussion is entirely unrelated and it only stalls
>application of this bugfix and keeps upstream broken. This is not helping.
>
>So unless there is anything in particular that is on-topic and prevents this
>patch from being applied, it would be good to apply it, otherwise the GPU on
>MX95 in mainline Linux is not working.
Hi Marek,

I’m not opposed to this patch being merged into mainline, but the commit
message needs to be accurate. the parent CLK_GPU cannot be enabled or
disabled externally. The last sentence should clearly state:

When the panthor driver enables the GPU core clock, it enables the GPU_CGC.

This ensures the description reflects the actual hardware behavior and
avoids confusion for future maintainers.
Thanks for addressing this issue — once the commit message is corrected,
I’m fine with this going in.
