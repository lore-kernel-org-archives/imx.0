Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012018.outbound.protection.outlook.com [52.101.66.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6333A641A
	for <imx@lists.linux.dev>; Thu, 19 Mar 2026 08:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910347; cv=fail; b=EoFs/DZWfTB+X2hNEJ8o2LEVV0BLLd0UGBK5phTlxASMv2+O0MC9YgwoYjYLoR8dOGWXt9cbfee3mjno4w5P3mJaYH2Bo8nulfQ8KFqVW5AsEK7CwUTYhofCji1eKVpDpgvf87AfcrMuEsWulYUGJliRVIMAbBO8HE07Vo9sb2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910347; c=relaxed/simple;
	bh=iKIVDNBkLQynVhtX6pV1nI6I9uhnsMXw7H22WWod5rw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=D0ORddHB0DX5z3sHja5mNPYRaAd2rUTTuCFHfDr/RQh1pZcP5TTEm11P2MjccyNPuDNnSCyVgJhaZnkMO8mSZ7fu6uC1FwYhPLvDYU3iV02WJcw2JxLABmMET5kF0N6h7XmtU0gP1RDfGK6+I6JIehKivgoBsYA+Qubw2OUi/W4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=hMV93FSt; arc=fail smtp.client-ip=52.101.66.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="hMV93FSt"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UHBTRf4REh6K3aYGAHvE76sGdgxtkZYXOQUVQgzx/kpaD6gyekZUPAV01WH2AG9kvMoLpEqRQo1uwKDbM1TqXURznqwEik3AHthSTT7+qzCQtPnYhhYhXxpfLWKD/uviHW/t42mDPsrxeU/5emAJSY4UXDEuWL45SeFTlCDtvElT7+Jj5rwKxjU9CU/gHT/iRxAkWTZO55n6KdWgekQmXXIq9cAPnT55K3JyEogBC2pz5PxCEbmdii/0ggOrqQ2CIICIERksQLGjHVWydUIdPVjnwqmWqEJOybQKkJne8i8PL0mrFzMYoXFsYbo5l/buNKDGqOj8/aiuHNvq6WI+CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iKIVDNBkLQynVhtX6pV1nI6I9uhnsMXw7H22WWod5rw=;
 b=cBkbe5nmPRjiL7YsKMdC4ZAs3xlXLOQgDU8NBawS8SFSr3Z08fbpPYcZeH8R3+4OLCgOBDP0jUW4+tlWEnwkxVtkn9Bs5Xscw6LPLRAcPSGY04dko/couqW/CJ5qDfuEfv1UIBfo6QmZCOKOJkg+61BP5jIV+oDgKfIXGQwZ8R9m33XjGH9KHg8EuWjRspxqqid1cLWNXDKS1gZdkqSP/zZdm/dJBiD3Tl0boreKiF9uySjo20GouqHKz22hQZcy6qh6u183Exu7VW2wRf0R8yNMkaEIrWvLd7RjIugp/S+epuEVqnCtfnyJRvf9wKvbpKzNeUD+b+X2T/lwCwnPdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKIVDNBkLQynVhtX6pV1nI6I9uhnsMXw7H22WWod5rw=;
 b=hMV93FStthp2pgyiMOgrMTKlKaWIW49+rBBvetRBmzhHiXtNzNn7KyDl1pZBz4t/Ptv4RSzcHkG76ELaIEQjkwKKi41RrGsVN8MzKfwr5bBza7OnyiK7X/9mFmTOanvyP7OARbdasG2BZWebVVR2Nd8gd6RLjIDktNfNrxQAXm9MPH3O4X+ntlDo1pm7xx1DBujGMCOfj7ZhD/bnJSo5Y15BgPH0XzTuazEJS0+VQdgFE7ZQcL4fJQSvAKKf4GLmErPizQNby8JPZDgZzDRsGzq4Er1YIaiQvwFVXac/B968c5B9Ibol+umNAB4Ffj1LMGHRBrSHDTPWWqNNh1dm6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by PAWPR04MB11550.eurprd04.prod.outlook.com (2603:10a6:102:50b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 08:52:17 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%6]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 08:52:17 +0000
Message-ID: <f7ee5c1b-d384-4753-9998-d22cb95864e4@oss.nxp.com>
Date: Thu, 19 Mar 2026 10:55:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: freescale: add i.MX91 9x9 QSB basic
 support
To: Joy Zou <joy.zou@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>,
 Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260319-b4-imx91-qsb-dts-v1-0-2eedc01d8af0@nxp.com>
 <20260319-b4-imx91-qsb-dts-v1-2-2eedc01d8af0@nxp.com>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <20260319-b4-imx91-qsb-dts-v1-2-2eedc01d8af0@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0022.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::9) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|PAWPR04MB11550:EE_
X-MS-Office365-Filtering-Correlation-Id: 5830a35d-ea5d-4220-2981-08de8594d306
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|1800799024|366016|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	e8TkuWydx9DaCwXXS3URpe92LJicnmlKRpHHc6VvjfffEef2fEy4rmU/9L7037BrGVbvkBt8IHrTAKNyFX7a6R5CzSt9Q7w4Jt2KMjvVd8/fDQf61LWW9cbUTSafaS3YF2p8fD72gwnamTDPRCRkPYntK1E8kKVh1U/KKPOe3tUuQXZhOXVx0wYpyPjf4tabgKaYnEi+AeLMa0xza6y5XGGH7W+HXyCMNBS0S2b07GWFYr/UC0tqwvfrWXYRD9zTrFAbnzEI0nlKn2YeZWl+iT6eJFCo4r4pZTDUIWcJ6dfT6anISGVKZHUwxBub6QuCeB8SzNoxTW3/HvUOVFh/XncPc1Azv3XJ1R7AQsQGhE/wBC4PpX9R+32e/4oCLPBtO15D8M+d1gd5S+3xxNVUDR3e1xHnJ7444CqGnDpLay34SYhgpFw5+UE8VBY9fDg83VZ16IeOBMy3LIQDkOAW4mA8QkWEBUBr3bmkuEjaOjB2lE9x+vgLh5rzSHBhv61v00cD4yi/1fM3KL+oWVlvRl3H9XeEBnBjCoWIAUxQujm9nicakWDoAtNNQjDiEK8cWuSUQ9qEnlr0/Ya2u9QLJCfodOK2nhDhK6KWfGUCXGaqSWFxHEmkLuP13BHAj7MCFyFoycG3+gfhEmrWBB8K0/EL3BX75l/gdZjyYNLrpt7naZcbdscSrKNcFajUGukizj7PlO8otVObcWBJ+GH1AB3l6sNVpfMBLblZvcSMlC/Cv5juErKbkpNZBPjSKEl/g0tOKxV9BvIpx8D6HDYyQtxKodPGDJTdJRcIAp+GOm8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(1800799024)(366016)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YnJwb3JiTVZHUGUzUDZuL0twbUVVNHJlcUxKNkh1SHkzY2xrVjFrVWRiWWc3?=
 =?utf-8?B?a0QxZ1RZd0I4aTZ1czdhRVZMYTdTOG04RUFoM1dJUW04SThQMmtwYmlud0Va?=
 =?utf-8?B?ZHpmUnF1QmhnYVVyRlQzeWVJejU2Tys0a1BkMEVrVFpBUXk2Rlh3VHRrOTZC?=
 =?utf-8?B?RGF5eldJR2tDc3RBemtPbVlPUkpFeUw2TXR0MG56UGdHUDN6NHkzNDdLQk5D?=
 =?utf-8?B?SjJSK0lNazM3UWFpV3lPRkd6MmtyTVd6M3hvUC9SQlAwRjVZMXI2SUJXYmk1?=
 =?utf-8?B?WE5lVjQ3T3FCWHhFUTFYRURUTFdMbktKSHk0QWZRTzdyTEpNa0pRam9qdDRJ?=
 =?utf-8?B?bG81a1hZTW1OYWZyclQyWWJTbE1NaVR6QTE1R2VrRE1EMS9UZWExMG5Ram8v?=
 =?utf-8?B?aHUrSG1pZnRVNHQvY1V2aHB2aGhobnZaYVRsbXFoVlo2K1dOMDZrNk1qZzMr?=
 =?utf-8?B?YTdQZVJsMEVNeVcxL3BPL0ZYYWthZmdmdG1pK2p3Tk9RcXZBNU51VHBWak9R?=
 =?utf-8?B?UFRBZmx2UTY5RnhOMnlTQTVGd1cvZDlGWUQ1UHc0TndQdlFhSlhFTEphRytS?=
 =?utf-8?B?eFdoVCtzdk83ZDYzYkFIeGJEM3BsaEcvZEJ5RmtOWFFDeVB2K1pqemJZUTZG?=
 =?utf-8?B?YmFKMnIwdkJKSTN6c2Y4cHE3Wk03YmFaY1J1Rm5YSHdvdlNZRzdCZzJaNVE3?=
 =?utf-8?B?V0V1a0pKeTBxUFpNMzNaUzJpQVM0d05sc0ZKeVh5eWpPSFhYeEFRbnpSSU9H?=
 =?utf-8?B?MHNSN3VPY2o0eG5YT0N0MnZkMmJKclV5WStsN3Q0REZNOS9kZ0YwRFNkTTRo?=
 =?utf-8?B?L1BETmpEdk9vaWZvWnFsN24vVlRNOTRFVXBGdzV6ekRPWklsb1d3aDc3Ri9P?=
 =?utf-8?B?L2ZEeTNWODZNSmJmekJCbG5JQ0VWUWF6dU40UUJSUWQxZUtzbmNza1V3RzNp?=
 =?utf-8?B?UENiaURsbkZKQk03Y2FNQTVSNVhWbHg1VFBLWGdhSHZMQXlZTkVRYkZNVEMv?=
 =?utf-8?B?Qmgxa2lKcFpzV3BCdnlaYnJtMzNQdG1KWDZoVjhvMGtybUhRcXJrcWx5OUU2?=
 =?utf-8?B?MDRjME9QWGY4V0FOLzNBRVhHcUQrZkliWUdFNjRvWkNSR3pTVStMSXVkU1Bp?=
 =?utf-8?B?ZysxWjZKNnZiZDZXN0NSV2t5cXB1MHlyQ2dVTGt4TDhRYnpmNk0vUHVzbW1r?=
 =?utf-8?B?UWFOd3VzTFp1ZkUvTzd5aDA5bnJ5VVVQMFU4Zit4TFB5bGJpV0hTcmVTRm1D?=
 =?utf-8?B?WExIdU9nbndBMEF2cGRRQlpuK1RnK1JNVmpZbjNzaGFuZzU2NkxrK25nenNI?=
 =?utf-8?B?d2NpOGdsYXoyYnpXTzJBQ0tVbEkreE84dVd2NUY5dVdxVU91d3R4Q0pHQlVu?=
 =?utf-8?B?b2w0elA4T0Fxejd6R25ONkRtb3NyMDJUQStMcHdKV1p3UEs4UmVEUk5VVUND?=
 =?utf-8?B?NDYwMENHWUxzM2xEeDN0Z2JvUkNGdGFpMHltKzJRamEzU21WNmNKUkZnRzVu?=
 =?utf-8?B?eE8ybzhBd01LYTR5eVdMNVYrTVVGYXQ2cEZmbmhCUXo5VTZ1NWFsWC9MVThQ?=
 =?utf-8?B?RGtRa0d1MEdXUnlDNzlHM2RndGZ6U0xPcG41OFdETXFTeDdOenBBTTVMcTZo?=
 =?utf-8?B?RVd6Q3IydzVTZWFhREQ3ekxVaUFFQkNlcmtRQkp4dEJRSVBObnBySmtWNUxn?=
 =?utf-8?B?TjhsYlFpUmhCYzZ6MmlSQ3RMaE1CUUdscjBHY0VyUk1MMDFQOFBuQ2p6UjJt?=
 =?utf-8?B?ZWJJYzNrMjQ5TXR2dEh1K0NPM29neGdwT3pKK0l2TmxLR1dWalNBaG9kZDV2?=
 =?utf-8?B?bzVZbUFGeTFWVkpsUTBCam1sYjdEemFJT243MVNFZFppZ1JqSzJWY1FNM2VL?=
 =?utf-8?B?VmE2MEhkM3pYWVhaTlM2R0hmMEF5M2NnOW1HbGxFcGZwQTlsNHo4THdrZGh6?=
 =?utf-8?B?UU1mYVVtZS94cmJYb2E1ekVLYi9KVEZNU2FhZkEvZmp0Mm0xZlFtaDZxS0xZ?=
 =?utf-8?B?VEpJcHJ4NkRWZDJycTg1dHVFYmlCQW1OVzEvK0xlQ24wTXJGWXNyQ1o3ZzM0?=
 =?utf-8?B?SUhwbncrSFV0dm51QnpMSmtaNjYxK1kwOFFwN0FBQ0FCUVM1SVM5WERmRm1C?=
 =?utf-8?B?WnRRYlY0VnUxYkRsQ3BQRWdMd21nY2pjRmxDQWlZMzFoVWR6cEpNdlJTN3JC?=
 =?utf-8?B?RjFBdGV3Y1FHU2Jkdm9uWGovN2sxME9iZk9Lb1BmTHVMVlBxYStQbW9IMHha?=
 =?utf-8?B?bXlnaDNEQkRoY1BCTS81R1IyN1lqcmRSMjNjYzNHSmQ3U012VzVoeVVhQm1O?=
 =?utf-8?B?UmNidm1xTTFWRnFUVlJIQkRzb051RGo2czhXSjVQM1ZQVU1Wemhjdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5830a35d-ea5d-4220-2981-08de8594d306
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 08:52:17.7503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lrZrC29qKFJPJC8bVJmG+uHbZfro6IbK2bsZOCcs5G4yMQ8bgIN/6MGnqEase7ruLDdDgFvc8JZgJjHMcEClxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB11550

On 3/19/26 10:18, Joy Zou wrote:
> Add i.MX91 9x9 Quick Start Board support.
> - Enable ADC1.
> - Enable lpuart1.
> - Enable network eqos.
> - Enable I2C bus and children nodes under I2C bus.
> - Enable USB and related nodes.
> - Enable uSDHC1 and uSDHC2.
> - Enable Watchdog3.
>
> The board description can refer to the following link:
> https://www.nxp.com/design/design-center/development-boards-and-designs/IMX91QSB
>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>


