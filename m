Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2052.outbound.protection.outlook.com [40.107.21.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3741C4617
	for <imx@lists.linux.dev>; Mon, 13 Jan 2025 18:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736791355; cv=fail; b=uL2vsOD1Kl4T6+/a6XaxVGXuN4ScVr/+IO/mzUXV7pTyGvhe4/jw9pFA1Df5f5Q+s6buQdUAro2PJxt7d731fwmQ3r1w6LyVkoczfE0Sy+tMi72iWai0JovjSEWcAuR9DlxiYsh3qgYqxuaGHN5UO33AK/7OOovBqSClz0ZKUTA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736791355; c=relaxed/simple;
	bh=jXYHYmPl19jXYojLzXNGE34gMOyMmkAoiqp6CPMxh5k=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ht82GFrq+a8LyrF3AWCf7K0kzMNyrLWr66FQEgBtBGO4kWGxvFnB9lxdyO/j5fECmikKwAhI/wmQ677d4zkXFeGBEt2Lti2+EHuSu5WcrWwz1kgsAkGReDcM087uv95Ia8bCTLOYUdq5/zwFNqg30vhYv+kf6pOgrVAAhIOhb94=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ibmNUvHL; arc=fail smtp.client-ip=40.107.21.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ibmNUvHL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I46MFGDsEtaoZD8GeezZFAM93HUVTVLKMm/BL9gGaBbxTMnh/0IyW4qykbNBKZVD/aBy5IEjWNN2oBm1nuh7E5qLafQbZaQDfW3Y771cb5qk2NL6RoBWBJnu2PDhBA9+ubzVNN8jk6oiSHEeWApCZY5SKegcjkiaQMaZ0pJKtIfmZO37pKBGJxJlx8VQRURR9IkuJN14EN5lzZo8kl8vRxdAEXGBN/GgqOuSc8ELMtboUevuuQpyswLG/UTqkZBZNnINRw22NbDtQlmObQgT32qC9z2nOMeCuUPQYV4VOMlWSyhZVqVw3Ja95cAbM1C9Jz+tP5LE70QgVwbQQpyROQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5tDeG36IqD3nJeLXKNXy+PCm263s+64zlgeNuAkiXI=;
 b=hlnrWPePLfvpFEMTJxcTmn/zpoo3XMCUr3EeAAl5Ff4kfsPc0pyWs7Cz6m6/Nzd8rIB3yBvBj1dMAw0+IDee0JB376zkcfjN6PRf500MlIaoG5vRRgO8/AeEzPhULbo1SZn9G7A3oSt3PT2PsKa+TLngymSioaJlMaFAqTr4AV1mh9YH8P2lHFBy8hvZdzked9HlW3s5HKxXWuJbkblPwJBXxHQVrrDShciByiSvoA0BgxVJ84gcFq6cv7TX2OzH/N9qRSuCowpZ35TmWwVCo4Pj/GH/18mkDJWRtEOCc4FOMWjVUx9oH2xTNaczrI2l0x/eyszJ70m8PUN8ZyJlGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5tDeG36IqD3nJeLXKNXy+PCm263s+64zlgeNuAkiXI=;
 b=ibmNUvHLaznCJcspjbY0GrtbaFddabGMz6r7iG9CbzSske3jVeW55QaajSWfxe/cW5DJe1XuzTXflAGGSKaSszbU5JZpS+RfdEDObMpyn8TvDDwJxG5ilU8LmndngNGB/B2mXcqjsDXoSTLGgjGBZ4WdQY8xGbI7iHg3KeOCX+3u4ouHbsELDSe19B/f+kYZkZhMQEQt7GrVuhX/XaMFh/slCXSD5kLpePrT3yXnRB/+Sa4g/zpCUsogZPfl09hYLG/G5UVhYm/imUQDwXDpy/1YAe2IaEnnAML+vgo1winETW1LNoNhdeZ1CYCmhBBw89BYetGoSYH2QFUnlqJk2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by GV1PR04MB10774.eurprd04.prod.outlook.com (2603:10a6:150:205::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 18:02:30 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 18:02:30 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 13 Jan 2025 13:02:00 -0500
Subject: [PATCH 2/4] arm64: dts: imx95: Add #io-channel-cells = <1> for adc
 node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250113-imx95_15x15-v1-2-8c20cbaab9ed@nxp.com>
References: <20250113-imx95_15x15-v1-0-8c20cbaab9ed@nxp.com>
In-Reply-To: <20250113-imx95_15x15-v1-0-8c20cbaab9ed@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736791340; l=659;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=jXYHYmPl19jXYojLzXNGE34gMOyMmkAoiqp6CPMxh5k=;
 b=vd0yyxIYZjC5blhtt3dYS7pKR7T5DVaJsTk1jTosi+iubSMYmLQ52KiMMTVSQ+2x0dOXQvL1a
 H1Wkh3CHFiJCZ2JtFHuyFU4Oe/mR+sv9rAJ9VdZG482a8FM8lspjKnl
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR17CA0005.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::18) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|GV1PR04MB10774:EE_
X-MS-Office365-Filtering-Correlation-Id: 0115ddea-c4be-4bbd-24b2-08dd33fc72ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z09BMDZRQzgzNE94U0xtbGZVMUlBdWNHdDZwYi9tM3Izb0VmZURyZmNEQVhx?=
 =?utf-8?B?a09LMkw1WkNQaFVQYkRmcURqUEVJOGpuZ2taR1hwOUhGSUgzWnFZcTlOajlT?=
 =?utf-8?B?Y1orajFici8zMFVlaWZlU0xHczBhZWE2UVRHbGtDbXk0UVVDUHRWZE42Qisr?=
 =?utf-8?B?NythZFhiWGwveStHZHU5YjB3V0pUTTNidU55L2FIRy9PYUlnbCtleWVEdGds?=
 =?utf-8?B?cnF0eGt3MlpmbXJ6WTZnQmxhS3lQczR0ZzhCeTl0UWtjcFhpMzZ6YkF6RUlk?=
 =?utf-8?B?VGphaGhvSVlsZmNjUHRiN1k1cVJIalYycXhJWEFPbDZNUndjcSsrZHNsWEZo?=
 =?utf-8?B?OFBISEZlekZSZTN5elFiVUFkckJsUzd1OTJ0NnZLUExWNzRKZ0JaNkY3MEhk?=
 =?utf-8?B?cFYveE5wKzdYK2tOTGdzcUpNRWk4UHpFK0Vvcy9TNTFIeUk2QWhzK01lRjIw?=
 =?utf-8?B?VDhveHN6V0EwdVJQeEx5dFlUK1VLaXlId2NPOFo1UFdKN0gvME16L0hDeHpV?=
 =?utf-8?B?S2x4aVNUUndzdWdtY1d3WUc3cXladWNaNUFrSm90UEJ5TnNROW0yb0lHM29h?=
 =?utf-8?B?YTdpVkNxOVp4RzlpM3k4eWpFR3BQODgwRUxFT211cG53T21PR0o2TWd6TW9u?=
 =?utf-8?B?eFovY2pBMHUwUFU2bFVta0NSVkVlYVBCWWtQYWxPMzFuaEM4cWd0blhwK2Rz?=
 =?utf-8?B?dkhadnA2Vlg4OGI5VlptYkhUc09ncU1rSk9lUTlnQWRLekhwKzRIWXh2Q0Vq?=
 =?utf-8?B?cENxSjRWZ1pKY3h0anZtdmE5Y1ZZeVRMNFp3T3VmaittSlR6QkxndXcyK25F?=
 =?utf-8?B?UGwxUkdUYUY0M3dwTTI0SXExeVpPZktPUS83d0hKV0JNcHRXVDVHRHVDUlNH?=
 =?utf-8?B?ZlNtZWdyRjZ2a1NhY3o4VWI4YzlDSEd0M2wwa3JTekxURkozVWcwS0E0aFA1?=
 =?utf-8?B?cnpmQWpOWHBURG41MTJTUEVQYjB2LzUvVGgvQ0FaQ0VPUVkxQXRLUjlGZmhD?=
 =?utf-8?B?Q0ZDbGlJaFlQS3h5N3NTRXZZYTVhRGk1Z0xFVUhwSE1FYkdLWExpUHNYN2FH?=
 =?utf-8?B?dERoQ3Z5M1hzZ3g3alJnTS9HTzNMOEtEYWJldGdpK1RZa0xyWUcwVGo4Mm1v?=
 =?utf-8?B?SzEyUWhuU2JsNDdqRWQ0d3VMSncwbXIzaG5wT2FnL3hITVVRTVN1ZGZ6cU5Z?=
 =?utf-8?B?L3EvU0FXeEdseUFGVXBtNjlsUnZyZVFtazIrQ1JrUGdBWSsvQW1QYVdkSmlR?=
 =?utf-8?B?enozVUZldDNOV1l2eFh2d1o3eUNTNG41cENvUzUycko0U05BZHlhSEZKNlRK?=
 =?utf-8?B?dnFTT2xXMHNuTVVCczNVVTliNDhVb3d3K2VMaUJEdHdIRUk1SXErVUpFL0N2?=
 =?utf-8?B?akFQeFZYS28vVlMrMlN4MkVnZmwwQWFPT1hTZmZFSXAxODh5WTdJZDhvaGJ5?=
 =?utf-8?B?dkI2d3pCNUVrNEgvcFYrYUl0MExaQlBCeXNqSU5JM1RMYWRJWStpQkVNOFhr?=
 =?utf-8?B?VEdITVg1Z1I3WVNyWTB1WEhocjhyenBnb0MwVEZzQmFNRGV1b1IxQW92cDBX?=
 =?utf-8?B?TnpwODBKbHNsQ1RubHhVNk9qSm1aeWZJT3FLa0wvLzN5ZmFBdVlkVjhzNUpT?=
 =?utf-8?B?VXRGTklHZkFicDFlbnhZQzJnZUlWblExdnZsN3FTMmVZRzFCWnN3MTZvSmVD?=
 =?utf-8?B?Z3JvaGpHYzhuRGUwcGZUaEJGUUxqUCtqd01OV0RZOGVoL0FucU85ZnIrbXJr?=
 =?utf-8?B?czVta25NQ0RlMDRVZkZjVEVMZ29kUkNhTjB5MUM2Qko1NVNJT1NBdndtT1M0?=
 =?utf-8?B?ZkVWYmQwQTFiMzVUZVNRQmlReVpwS1lnYVVRMXdyaytFUnA1STkyREVOdmQy?=
 =?utf-8?B?dExmSHNYTmpEYWVCUG96UXZnaDZIL0ZwVVd0M1pQWUZpY1RDVVpvdVhHZGh1?=
 =?utf-8?Q?b9pH3m5tJhEy/xabIPl0GhECUoLLlHGy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnpROU9CYWJlSHVxbzNqangrbFNETXVaUEs0MlVscGZGYlQ1dW5vSjVxMEhX?=
 =?utf-8?B?SThCL0VjWVhZb3ZaRFNVcmIxT0NQR1QyaXJnNTdSclRjcWlWUGFMbm5MYWN0?=
 =?utf-8?B?MDQwWUwwZWdRc0M3WXpVRk1GODEyTkh6ZlpnV253Tm95enE1QTRhTzNGc2VK?=
 =?utf-8?B?ZC9QcWVIaFFMYW5jM2I4TUNzUEkrZEZQMTIwTEdkMnRPVmVYTXFvRVdIaDNB?=
 =?utf-8?B?QmQrSDdmZ2FBOEk5ejEzUzlRVDJDNEt6Z3pDNTYwbzFsME1SYVY1SVJpQWM4?=
 =?utf-8?B?aVdLZHd2enJUSXVrYVF6bmdMdHhURkpDWVBoUHZRTzdrUjliS2duSXN0WDQy?=
 =?utf-8?B?MzdLNjU4QkVoUHB3WWFSU29taGRnanVScE10TGVUWnRqZWsvdzhQdVBUSTF6?=
 =?utf-8?B?RlhZSExkbzZEaTZPN2x5a0IrUVVuWkFrUjFvbzRrSGpuazRoK3d4MkJodHBS?=
 =?utf-8?B?N3ZjQ1B3TXFYZ0FxQ1lGQkhKc3RiWVQrU1FnMzJVQmZpVlV3bGZFY2R1Qlk2?=
 =?utf-8?B?RVQxRzNYNkNTaXJIYWM2dGt1YlBXOXNpdFkraS9WNjFzNE1ucXcvaEoyUkdO?=
 =?utf-8?B?eVQ1djMwZEdwNDdlY05FamZ4NTBHbkNjU3JvUjc3UmdZbTVYRFZDMytkL2Jx?=
 =?utf-8?B?aFB0RFhzVm96R20yekthbkg4Y2ZaS2RZcUN2Yk9LcVRDNW1XbVo0QXBtYjhN?=
 =?utf-8?B?QXFRQ1pkNFVxTnFldlhxdWZVNmVJa0wrRjNQM2w0OGxwc1I1TjQweHJhN0Z3?=
 =?utf-8?B?Q01ZUXcrcVhOeHRkTm5KQ0tSTEYxWk9uQjNxK0ZYT25YcUFuMDM2TTk5UEdX?=
 =?utf-8?B?UjU3TGI1aUEzVXJoTUZZZk0yNGJmM2VwRHRXZFcvVzJLWlkrc01JMEhPVktU?=
 =?utf-8?B?MHBOaFN2MTA3QU4vMEtPcm83WGE3YlMvSkF2VDNyZjF4ekJSZjZiakxHN25t?=
 =?utf-8?B?UmJ6WDNtaXU0NGpjNzRieER5S0c0SVllNjZWYlBOTEExSkZWOUtZc05FSUxp?=
 =?utf-8?B?YjdFbTh2aTEyM3NTOXJTdmxhUWlYaUZuTXArTUEwTDBaZDRkenZHcE9GbGtO?=
 =?utf-8?B?WTJyQzFFcWlRbkgvUjR2MXlPMWJwNi9KQXdvZWpGb1RSV3BxdktBMWFLeGQx?=
 =?utf-8?B?SHRZUnBqRmhxU0xKMVBnVThUUWNoMjVzQTdhajRmR0Rxc281bVA4VjA1WmNE?=
 =?utf-8?B?dnlpYXdnVGsxbDNYdCtwd3JsWUlGUjh0dEl2WTdsUnpUNVJpQVBma2J6eFVy?=
 =?utf-8?B?bVVxRklpbmpnb3lXMkpPamJqaWFXRXlZRjJ5SVcvOHAxUmNXcmpSZHp1S25P?=
 =?utf-8?B?V2lEbHlldUdTL1JIdkM2ZmF4dE9JMW5VcUFCelpHeTFxc0ErQWFMVEp4dnFz?=
 =?utf-8?B?MDFaWHpwMC9RK0JRREp6Y3BUK2VteWNuZTRrcmF1ZExUN296TE5jcmhBNUFM?=
 =?utf-8?B?QW0xaHZscVFXbDRZRk1RVVV6bys0RWNrNHRaS0ZVZU1KZm5yVHJ3UFZQcUVH?=
 =?utf-8?B?S2VmZEdFdmdvdVdoQzlwVkg3R0EwL1dIa2pnRngvaUpCM05wUzg3b0xOaHcz?=
 =?utf-8?B?UjlPOU8xV3grYXR1ZEN6bmtGNVRURlJuM0tpbTgvWWhhL0pOUXRSYTFmdXJu?=
 =?utf-8?B?QXV2VTF0NHlKOG5CdW9GeG1uNjVXMW5sWlIzamRkY1FVUTZuTVNZNTNBWkxx?=
 =?utf-8?B?N2tXb2FMeHU1Tk82NXZEYUsycG8xTUVBM1FBTDRNa3Yrall4VlRQSTE5anhx?=
 =?utf-8?B?M3R1WUdwUCtaL3d5djFMam1FWUlpc0ZhNkdkOHNIUHpPUUFYakU2OEcwQnFB?=
 =?utf-8?B?YlhDbFh5ZnRtd0w5aC9ubHRZTUFzOHIxMUxybnFmOFFISWpqUEwwVE5mNjdp?=
 =?utf-8?B?YTJOZ2IyN1IzSVk1TDJQUnRicEM4M3pnVkJyQnNiQ3oyYms3OVJ0NEtjNXJ4?=
 =?utf-8?B?emswVE9kWVg2cDdjVU12WG90eksxSmpVY0hSaVVxNFhtWlJZMUxDSnVVT1NO?=
 =?utf-8?B?UGZxV01weWJBbFQvQUd3OUtBd0ZycFBxUlNpRTBVbmk0bUFDUllHSmZKa3RK?=
 =?utf-8?B?cEx1ci9leXVWeU1xQzRrdEl4OGh2UlFQM3dVM2EyVGwrY0lhZm0wT2szNWNs?=
 =?utf-8?Q?W4kzYg5Q48xmGaovBMvCuIvBz?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0115ddea-c4be-4bbd-24b2-08dd33fc72ab
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 18:02:30.5858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T70TcZ9T4mIaknaS/XTPov9yxjhFsNVQ97KLxQX0nbb+IG00tYsU4tFaNxODKExNYIgRTJMf7oE/k6Mkh5O03Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10774

Add #io-channel-cells = <1> for adc node.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 6b8470cb3461a..06c50369aa2a7 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -1379,6 +1379,7 @@ adc1: adc@44530000 {
 					     <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&scmi_clk IMX95_CLK_ADC>;
 				clock-names = "ipg";
+				#io-channel-cells = <1>;
 				status = "disabled";
 			};
 

-- 
2.34.1

