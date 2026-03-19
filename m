Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013001.outbound.protection.outlook.com [40.107.159.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 791703BD647
	for <imx@lists.linux.dev>; Thu, 19 Mar 2026 10:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773914697; cv=fail; b=eNssr7Ts/HVU/S2rRCJhiMb5tiCmsBvlXf3k3bum40d3GeOyyVbzp4HiWNtL64xBV1rYTtEC8/4nh7zDC2VCol1Y/HPNneNpKQs0QcpOoB0+Au/OVZ+rnWxGmQsiv5O63O1mE62RNd0Upka0zP/hfHCbY5+i/KhBBZCoRRr/FrA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773914697; c=relaxed/simple;
	bh=doawZEMRMTkrlbjepjC4qaE63JnuUmoGqz2iGXonHPY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=QyzWe7rtwoqTZkgemzKXKxkNqz9Pog6Zqfv310hecCwhEHicFxjAwgdLK+GSe0Z3myXumodUmPOWO+Ee0/4Xzerg2EpWGCEJh8kG9Ii5E/2KY8fC0uFxkYt2YMs7qQVVlRmVGwQ2uHnMRvECt0agyzwi8PYLOBkuB+9+1Zsav54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=nNgZn6b7; arc=fail smtp.client-ip=40.107.159.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="nNgZn6b7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e782hT/fxN2TRSmIZ9pgU9uD9f3oaTW6n3UcBs8OEJKBQiwRNnkgNl3zivSMdjROQszWZ1rr2aDrbyOOQoWJXOLIEEidtsx2n0pFYOGWZU7DLHLLDqlnVuE+P22LdRHrHeTCj3KdRqx5Y213fWXhFlH4WyS0Ka7nLdkkHz2bk7Ty4YcQqfTvLwZTgwznpzsIwmXlixFY2LKCOySjXA5m/BJgLgFMZR/3adqYGAsszVkQ+Yrhg6cq6YjZlz6jLxeDdTV92NtBnchC6ApuemZX2cgbt8DJSlOBwf2QCoaujwiRRBaU2cjiIw1R/M1/YjW+VhZaKGN83ydf8N5GM2gB1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CzbzwHsZr4gKjMzJLi7QV8gQg+P6Q0le0KXtVqHnxn4=;
 b=GVo/WRlYH/Kn4TVNYtF3wd+iJCn0NlxXQjBXmWKAUi60eqeZIPYQ0kcw/gfu9ueFNC6M/hdJoyrgk6bEhCzO4/vmufkWdSA/VoFl8i85Tyb2S1ey1eTqILz7LFUsOC0bZq7TWZCoeed7Y/dZT9zw+a/gCXrC/hl/PTScFVyz6qF2ArwWv1h35gvFpFj0Lc1qw65wIoWPKEJf+Aw6zs5BlKTvLg7ICK3YimKp6m7oi7U0uXZp9rb+uxU1snt3zOQsA+weoAhX283EsJ9/G3CzQ/Xnx6H8i7YiWknYWiBpyQ4IwQCtDWdIUjtP1yhHTJupfasj0JN56SeNpEDJhFC+EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CzbzwHsZr4gKjMzJLi7QV8gQg+P6Q0le0KXtVqHnxn4=;
 b=nNgZn6b7K8R0V96Y4+zIOjGwkpW3hGDvM5ykoyhF3TjBgi8ToYZk5mkgHIOb4SjQxY3puFk97VL2TyoqnWn8ZeN04JahcWhTA/SuTwsOYmUyJm1i/dS3VBJEFJc30LiBLp0ONndbIBiIM+mUyt+CTyY7r904QFSWDqgJbW88N6lqgZZrsuMrqyJT+PY16rqZJR0iRnq9tW/ArVpD95RBnhF0qqNY3kY0RigrzeEKB3lRevFUa+AUnJQCNUA6XIKvOMASQOdXox3O1pggadJ7tqD0q/EDCTbKbbyHaPREYNMBAIlr9gDTILDVF14TmVpB8+JUfSTrideWsyNg8GfqOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com (2603:10a6:501:97::14)
 by AM8PR04MB7873.eurprd04.prod.outlook.com (2603:10a6:20b:247::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.25; Thu, 19 Mar
 2026 10:04:52 +0000
Received: from MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43]) by MRWPR04MB12117.eurprd04.prod.outlook.com
 ([fe80::9a10:5b39:708:7f43%6]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 10:04:49 +0000
Message-ID: <2d78ba6b-2054-4a78-aa00-03d377d20f95@oss.nxp.com>
Date: Thu, 19 Mar 2026 18:04:35 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add i.MX95 19x19 FRDM PRO
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
References: <20260318-imx95_frdm_pro-v1-0-8c00e59f0b1b@nxp.com>
 <20260318-imx95_frdm_pro-v1-2-8c00e59f0b1b@nxp.com>
 <a6ae1423-9ddf-4d15-b83c-569333abaf5e@oss.nxp.com>
 <9a7979de-1977-46df-b2fe-66b81dc935e9@oss.nxp.com>
Content-Language: en-US
From: "Joseph Guo (OSS)" <qijian.guo@oss.nxp.com>
In-Reply-To: <9a7979de-1977-46df-b2fe-66b81dc935e9@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:194::10) To MRWPR04MB12117.eurprd04.prod.outlook.com
 (2603:10a6:501:97::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MRWPR04MB12117:EE_|AM8PR04MB7873:EE_
X-MS-Office365-Filtering-Correlation-Id: f7d8f9e9-31dc-4942-c9f9-08de859ef492
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|366016|7416014|18002099003|56012099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	yArce39VcMC1ie1MUolEXpIP+aR6G9b+2wKjCvHejURLVywmix+pWVUQLoEfocv67EqpmI8e7Yox+epYIw/+Z0fLss9yJa08QGBL8/oCyaAmHtSO8PiMqm4jslEuat5oDh1SnPx02SWgv+HaHbHrT/bREyQbK72YA16r3lxyBXuqI1/f5RioFpqz14A/DZKQJT2Vh8aKlVqhwEH/DMp/w/X+T5XufQbsf6ZkerX5ZYSFYYWu5A6/Sk4wIkcmsFnCSr6WePseuefzdMs76BrmgewrHldgGkDi68d2gR+1zjeOZbG3Z55Ymj8hWQtiGmDP0hVV1LUzwLLzCxTqYqMAN3UcWWi6ZbFChyqotDzIsyoNp4Dh275Yb0p5/S5KKmYfv/Ioatg08h9TtLWaBRJu4Zk+yiZM0bYtTkV3AbV5cEtYGnYXZ2SMx1XHKk1r7WSLTcLlw/9aeDjLKT4oZ2TF00a04ne8ypHnWk8wTRt4ZFUYMf3Gyhzqbd9U16U45fxeDiLhZNbqTr6aIbroe2YavXTzlAd9Al9ZbqWFpNQLJKvUXuYSNPqOkYEockvQ6zTYH7Afwi2hE3JVMYEnnAGiR1mIGS1ylU1qhfhi1VJ3DJopfSWj5pMvwziqEvsAFwLOu0y0QCmMPB0/wJ5MJYOSwNv//W9ibAvA3K3P+3h1uSOFp0t5u5Fny5rAGvYO8JpjnoxkidiCTUZPrtdmKSjzK8ahEVkSgrULmQ0rzGiSUszWWOk/HhtUKJr9WJiZGJJa8WizFBOcd8Ratb82dOCVMA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRWPR04MB12117.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(366016)(7416014)(18002099003)(56012099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SUZqV3F0WEpuV0VTcEFLOGcvalJZTFNjOWFKcXJ3TFdrb1FCNmxIZHczWS9s?=
 =?utf-8?B?cTh4YVliUEh1dFdHMzFxRzVNZDEvOHByUS9lWWZBblNjNG0vNHRURWJnSC9U?=
 =?utf-8?B?QU01K01KckY5RThwbEY5UVZWR3UwaXRmbTIwa29uVHRKMW8yaGUrUWNwbVp1?=
 =?utf-8?B?VFpwRDc4SlIzSzcwTkduUzg2NFVnRGs3c0dicXh5VitmclNLNU9lL2pFN0tw?=
 =?utf-8?B?YldjWFdUZ0daclV2YnRIekxxUUhQTUNmcUZQdG1NTkNmZUFvSzZ0SXZIaXpQ?=
 =?utf-8?B?TU8ycWMvYUwwT2hxRldHTHM4WUpjb3pOeVBjYUFJNk4wdFRSUWpPTUJZKzdP?=
 =?utf-8?B?aTB0WHlhRG9ac1FyellMV1FFWnFwT3I1Sy83ejlrVEhCN1lxeUZyQ2cxMVlR?=
 =?utf-8?B?aVlmbGM3eGdwQXFEM0FHSE0vb2ZJVmM0V0J1MkFhRG11R3pEbmIxWlFEay9v?=
 =?utf-8?B?aUZFRllVZHk3VFp1aEp6Mjh5R04xUGNxdXFPMmhzMXNsRDIwaU1TL3lrVVRj?=
 =?utf-8?B?UUhQSXArTDNuT2ZYZ09FbXUzYk8vV2tsSjRiYnBqVHZFTTFiSFMydUwzbGNH?=
 =?utf-8?B?c2pjMTJONlFGaHNDNC9HaGNEV2RyS3hJMlArVW9WRDREb3l1amp6clpIbWpN?=
 =?utf-8?B?VzllYmdlU2lLeFNPMjdnMXAwTkZrQlkzN1NkeENSQkFWSndHWmNTbkhpN09G?=
 =?utf-8?B?OHJRWTBmQlZEY3prV0F2VUd0MGMweWgyUWpsRUN2SDE0Y2FnZmRtVlNkdnBR?=
 =?utf-8?B?ZHdoT2pvR0NmMG81ekRlZU4xUkptcThXbkx5aUh5aDlJSEk5WjFBRFg4Y2NL?=
 =?utf-8?B?NzlCUmh0NlRWUU1VQW9LbC9XbDhSU1NPalpHYnlQNXgyeForWGM0cUppK0FY?=
 =?utf-8?B?VHVIZkxMS2hhQnpNaW5ybG1qRVdvL29QNU9xTURySE40RExHaDJ0b1J3bmNm?=
 =?utf-8?B?Tm15QzhvSmlvV3RLZTBjaTNEUDg0WS9MN0ZvcCtocldRZ29QY0JkZjFROEJt?=
 =?utf-8?B?WWk5ZHlRbDUwaENCMmduTW55Y1VIVFBVQ2NyR3Z2R2V1bHlsZlhmK1M0SnNB?=
 =?utf-8?B?ZmZFR0c4NGNaZSttWUMyd2ExcnlTUXk5WkdESXBxOW5Va0VRdHFDb2ZWMlBG?=
 =?utf-8?B?cnFmaHo5YWxmeDV0ZnIvcnhvUUxBVjZVNzkxaU9NNW9ZdFBhR3pzSnJranlS?=
 =?utf-8?B?Nmx2VmlyaDBGMTVHUnFsZlM0dno1WnlqeUpDcWF3QjBBQkpUK0ZFUkd5TTBS?=
 =?utf-8?B?TlVwdmw5ZDZxd1JYcGE1bmJ2NHFma2lOK1FBcnlSaldMemZvaEF3Tm9DU3lx?=
 =?utf-8?B?UmJsOFhqQ2VMMWJYa3R0cUszV2hPZGpQc0QwWHBETk8xaHR3UVFzYUpVMStH?=
 =?utf-8?B?STdzbUZlRUxTamhUcmZOVm15cVlEZXFoelE1a1E0dXRUenQ2cVpIc0taUHNl?=
 =?utf-8?B?SGNPZkFRRmRWZ1MrUkR0Y2JFNmM2b3RjUEpCcmF1dS9DcDdCUTRLT2RCWnlq?=
 =?utf-8?B?YUVWK0J2eGJyZUlIM0lVUHQ2amdPSlZpWkhBR0lXaDV2bkROK28xekJmK3lw?=
 =?utf-8?B?Qmo2ZzNjbTVOTis5V0hMOXlaTTI2T05EazJBUGhmRzhOaDBLOU9HR2lydDJ0?=
 =?utf-8?B?SjlOSi9UU2ZDejd3QW9Ba1l4ZFRxWUVkVWt0c3UxeVR6Ty9iL1crR1BhV1hv?=
 =?utf-8?B?Z2pTV2VNU28zbVhNNFh5UG9mTmlBR2g4R09hZWRzeitFcnJPVjZFSkl1ZGFj?=
 =?utf-8?B?aTZGTVkwWDNlWU9XN0poNUdWRXJ6TWpObWV4TUgxS00xYVJZeXRpRmlzc0py?=
 =?utf-8?B?UG16SlBTRmJvUUNnWC9HanBLaDJZOFA4MGxLY3A4MGJleGZmZDA0d2s1d3Qy?=
 =?utf-8?B?U21JbjNlRysvZ2NsbVRSdXZLdmFQOG5lZ0dKY2tkN0hGZUM5SnFBeTJCbExo?=
 =?utf-8?B?aXFnTGlseTNESjlsb2RTOEpQblpCckwyaTFEbThBREhNWGhMY2xTVTM4cUVL?=
 =?utf-8?B?UXF4UlFRR2FzcEYyRU42eGRWV3JqeTNVZlFRMmJCams4OHU1cnh1dU85Z25Y?=
 =?utf-8?B?MTVXR0hIQ2czTkJIZmtxaEhGaFNvV1Q2M2pZK1NXWWNEdDRDbFlOdjRBS3Zt?=
 =?utf-8?B?YUxIWEZERWtaSVpZdlZjOVVhS2U3VllqZEtSYlFING5nZFNzNHhPWDg2WHdl?=
 =?utf-8?B?dndWZlg3OW1wWG9FN0hDc1dNTU1FeTBkQWpQM1NvQkpuUFBlNmtCK3lHaFRm?=
 =?utf-8?B?SWQrY1NDRnB3OFlVN2tLQ0hnOEs0T0N2RVdOb2RqVmNzcHA3VzhSZUsxdjJn?=
 =?utf-8?B?ME9XRXh4ZWI1bXVuVmVYSGY3aVVOdndJT2pFZ2wxNW1xZDYvOVIydz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7d8f9e9-31dc-4942-c9f9-08de859ef492
X-MS-Exchange-CrossTenant-AuthSource: MRWPR04MB12117.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 10:04:49.0488
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ev8SN6RnHjWD7xWPcqn7sSStedA45G1FIRs2taMDHuBtpry2wJ2esFGjd5lpGs8LSY/OPCsqs9MZHC/WIh/IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7873

On 3/19/2026 5:10 PM, Daniel Baluta wrote:
> On 3/19/26 11:02, Daniel Baluta wrote:
>> On 3/18/26 10:04, Joseph Guo wrote:
>>> [You don't often get email from qijian.guo@nxp.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> NXP i.MX95 19x19 FRDM PRO is cost-effective with extensive
>>> expansion capabilities based on the i.MX95 19x19 SoC.
>>>
>>> Add device tree for this board. Including:
>>> - LPUART1 and LPUART5
>>> - NETC
>>> - USB
>>> - 2 M-Key M.2 PCIe
>>> - uSDHC1, uSDHC2 and uSDHC3
>>> - FlexCAN1 and FlexCAN3
>>> - LPI2C3, LPI2C4 and their child nodes
>>> - Watchdog3
>>> - SAI, MQS, MICFIL
>>>
>>> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
>>>
>> [..]
>>
>>> +
>>> +       sound-bt-sco {
>>> +               compatible = "simple-audio-card";
>>> +               simple-audio-card,name = "bt-sco-audio";
>>> +               simple-audio-card,format = "dsp_a";
>>> +               simple-audio-card,bitclock-inversion;
>>> +               simple-audio-card,frame-master = <&btcpu>;
>>> +               simple-audio-card,bitclock-master = <&btcpu>;
>>> +
>>> +               btcpu: simple-audio-card,cpu {
>>> +                       sound-dai = <&sai5>;
>>> +                       dai-tdm-slot-num = <2>;
>>> +                       dai-tdm-slot-width = <16>;
>>> +               };
>>> +
>>> +               simple-audio-card,codec {
>>> +                       sound-dai = <&bt_sco_codec 1>;
>>> +               };
>>> +       };
>>> +
>>> +       sound-micfil {
>>> +               compatible = "fsl,imx-audio-card";
>> At least for this node we would want to use audio-graph-card2. So you either leave this
>>
>> out in the next version or switch to audio-graph-card2 as we did for imx95-15x15-frdm.dts
>>
> Sorry, the node I was aiming the comment above for is this one:
> 
> +       sound-mqs {
> +               compatible = "fsl,imx-audio-mqs";
> +               model = "mqs-audio";
> +               audio-cpu = <&sai1>;
> +               audio-codec = <&mqs1>;
> +       };
> 

Hi Daniel,

Thanks for your comment.I will change the compatible of mqs to 'audio-graph-card2' in v2.

Regards,
Joseph

