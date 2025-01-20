Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011028.outbound.protection.outlook.com [52.101.70.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375E91DF248
	for <imx@lists.linux.dev>; Mon, 20 Jan 2025 11:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737372512; cv=fail; b=QyXHtUG7Y+F44Qi2m27OnAMxbRUhvY7Zk2A/Q/OmZA+qFFW0lNkJVMqzh+yq18TfnW8uRV1wvIjwD4jR5nJBS93AiQnerJ7srTWFNX6lU7Mjboymb8nIc9OW9qqUCM8kdniGu8YP1fZPWD2vDBoMc8PLSg6V0FZcLjfwtcqMg64=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737372512; c=relaxed/simple;
	bh=8bCTvi7AgU4MQ5HET0AOHmcMvn388Mh4NN86zRFZhtg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=daaYUIBKPNoENm+0Zzh5XazAP9mwIA0Hnu/DrHfKUmk2YWX65cQT1KrGNiwnRpp1MH/8/Pf4Kd+Tfg93Q36mKbET33hNZVxPaJlL2Kk0m+nWXUdGWYFhj4ANVtHliBRtEqiR8MCJ5wothGi6+m6ZqlbXZNa858DRq8FzV/VJM3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ac0OM9FJ; arc=fail smtp.client-ip=52.101.70.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ac0OM9FJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EDZKHDk8ho5hr0nOMfRhWHBMNvdH+2NzNNx1gXLPZiMBN4RkS2dzQxJkelgvV2t9Pv4r9rzElagvnBRn4+yHUu41fFOWw0SOtPqrdCW/fEpuZewgbBx02IXISDgYkNKXPmFTw54q7SFdubtCEvUM0svx/Y8Ht2ySI1OvPz6P23Gjp+qCC3HIRboMELoyjvlVMzJup7Vp6lW35RRYwRLyOMKnq4aW8U4toRc1B1P62UzPp7V5WtwJ8Oqm21VwhMW9YoHXtxvhb2OKXyMLp6rK3+x9a0COa1mh9+QqOk3wTt7L1ymrhh8+4/DHO+4rC5wkWK6YvThLFIvcUr2iBgVeDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZoRgTn45yJn+Pnp3LFTUwhkGYSMYn5cLf7fH4YbYkY=;
 b=LAYpsVfxuXoL1JP8HkdC6I17ZF756D46B29jZV65W+BV/5jFxur+RpWBDMx/0+zlGg6R+Mso3i18FGZmML02UnOs07R+VH2Nd68USuz9ChlwP3KAxxh/1zvkRFE6Y9Zy9sxOT0mQpzSlPV6n+YvvHEQscrf1mttJa65E1AAVAZrdafEf12NSDSwkFcqW7suYs2EJwvVEMDePCVDA3JLl2LwjmndJIHGxMNeEtb3g1J9aSnFOp04egIQlvva5F9yYE1646iZtTAizIkWWgNbiivpE6i5AuvPCyre1ibRcLgtczELpGaA+s+554seIzsRfzSZXxWtizC2h7ICjfMt08g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZoRgTn45yJn+Pnp3LFTUwhkGYSMYn5cLf7fH4YbYkY=;
 b=ac0OM9FJlNHVu1tCs5SI2I9Bnb9DVz2ksNmj86g96qTxLqG0c4wuyqPi9Ca3NGAO3qaR7ztot4cUyXPMOe4mJ5/8YMd9Ma312odZ0RkuipWA8Z8lCYi19tnyqmXGYBb28kvLfVVDEQmMb9gJUMtHGF+3ixk1uId59DYTV+1eAjzdn/g2/GgbLcHvJvFxM5yEutmtfq4J64qkNeChQMmS8zH1NNPefjxA47C+zqDOMKWijGaf5DW0whrYej7y6Kz4gUaOgYLzRHPU7Opdp8TgBWdLEnM/WMkT5Zv5l0oRR8OMzbI5Fmu/qTkrAgUCVxjjElQf5kkqqm6QH7euVoUHww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by AS4PR04MB9551.eurprd04.prod.outlook.com (2603:10a6:20b:4fa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.18; Mon, 20 Jan
 2025 11:28:27 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 11:28:27 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Mon, 20 Jan 2025 22:22:20 +0530
Subject: [PATCH v12 2/5] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-imx-se-if-v12-2-c5ec9754570c@nxp.com>
References: <20250120-imx-se-if-v12-0-c5ec9754570c@nxp.com>
In-Reply-To: <20250120-imx-se-if-v12-0-c5ec9754570c@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737391948; l=3191;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=8bCTvi7AgU4MQ5HET0AOHmcMvn388Mh4NN86zRFZhtg=;
 b=ubQoKppsK5ymS9Sb5CdJWU6nI3nYqjnzveKJlgZapAm+aQTIfLMQQ4krkMcJyTy2FHIM1GvIj
 5/fAfUnkrvUB8o2Uyag7gHWs5/6oVtclLCCoi3x4KsypG7NEvBj0jXi
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|AS4PR04MB9551:EE_
X-MS-Office365-Filtering-Correlation-Id: d8b60deb-3961-4d40-a893-08dd39458ee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MTBwN3RFRlNmRSs1c0tTV2lrQm9Td3NOWTlRMmN3L1Mva1RqQm5ML203M1BK?=
 =?utf-8?B?WmNEZzUrdkhoeG84eUpIcW5LYW1LNFFZV080eFE0ZHFpcUhid1JsUk1FS2tK?=
 =?utf-8?B?WXFjN202bnJ0Rm54d2RnN1hKOVlubGlqTWQ5QjlydzdveG5sUlZyNFQ2K3VB?=
 =?utf-8?B?OXVCSjAvbldvanVoWEQ1U3czZ0xlMkFWQ0FMZHc3VVgzS09PQjFMenQyR2ZI?=
 =?utf-8?B?MG9FVXFlOWtrUHhUVGFDMUd2VWtEMm5XQVNWZjZJcVlCZGVTNzRuRzFWekQx?=
 =?utf-8?B?UmZhREtqc2Y2WGpQWTRJSTFhNGpsV0padzJlbnFXRDNzNVN4a3JUdXBhanV3?=
 =?utf-8?B?cnRNNmFqT1RKRDZaODZXVFhuM3ZsM0RFSzBBNFJubFBXUTlDZlpFck5WWWxU?=
 =?utf-8?B?YUJDTms2TjJWMGhaeHdSdFdvRU03VTBlZHZvZGhDYjZGejZocEdBU2kycEta?=
 =?utf-8?B?dTAzK0R5cFI3cUJwcVU1c0lvTHhkRjBZd2RNbjBuclhKY01KZXpJb091b0VS?=
 =?utf-8?B?OHpaK3QrMEYya1h5a3Q1cGx0emdiS1BabnphbDV6YUM3NUN6QnVVaEJ3Z0kw?=
 =?utf-8?B?a2FOcGVWbTNiZEdMUnVkWUFMNEM2V0RBbEQxa0Q5WFFvQ1k5Z0lNeENJL3lv?=
 =?utf-8?B?WndGL0Vhc3EwRVl1MzRKeElodVBUK2piZnlOZm9SL09Td1lOV0cvSFdNdnhh?=
 =?utf-8?B?YTlacE5SOHhYOTl4ZFlWbkkzZjJmU2x1cGgxY1Q0aVZ4K1laa3YvOGh3Slhy?=
 =?utf-8?B?WXd0T2xkQWpBWWZRVm52M0VTZ3lVeE12Y3RxTHMydFZkL1lEZXJMZkFaQkNB?=
 =?utf-8?B?aUs0bUF5MDJmMEhJRGNrUmE0VXlZSEtYblZRcUV5WG8ycFJxU2N4ZWhxWFNP?=
 =?utf-8?B?cUNtR2k0RzBlYlFtVm5zSzlvK0F6d1lnSEZRM0NEQXQ0NjdQYnh0QkUwaXJC?=
 =?utf-8?B?ZjVETHYvdFA3YWVYd2lsL2t4SU1XajhTcGx3VjdSVXFLNytvcWZGeUpGK29o?=
 =?utf-8?B?bHZnb3hRbjY1WFhnMkh4MFd3TGp6OEJENDJhQVVpaXJNWEUvWkluaGJkOE56?=
 =?utf-8?B?eXNXQmxRanpPbEVQWHZsQWwzNUlYNnhMOUVlWFNkQVdENDZvL1creHBDZmNB?=
 =?utf-8?B?UWFMRzFMSjBmcVRmN0ppaVg0VlRQOWFHblFaWVJ0SzgwaFN0M2Z6MzIwUmJw?=
 =?utf-8?B?KzBjNm1RczFVT0JGZlFGT1V2RGU0VEI0czhtUzl5Y29OOUlVbXRFOG8rUnli?=
 =?utf-8?B?dVNDWEZycUo3NU50bEdGMURpMVJFZVltYXZjbnN1a3VCd2I1ZlJBRVV1aVA2?=
 =?utf-8?B?Z3k0dm5VdEdjM3VEc09MMmRLRHY1SEVVeXZiYXZmMC9zT1ZXVnRhZkphY1Bj?=
 =?utf-8?B?NmxHVmtqWTlpSmh3aDlsTVI5NzZWdE5ScVVKY0dqWFJ0SWJUdmsycC9TY3Ur?=
 =?utf-8?B?Rm9iTVZ4cHNSUTdCdDEzY1BGTlRJdG5yN0NneGpIaEtTVVV5UENJbFBYRjBl?=
 =?utf-8?B?MXFnZHdEMHIzbFY2MWwzbnNnQ295T2d1a3NncVUzSUpncTVyeTRURy9CNEtL?=
 =?utf-8?B?SyszQ0g0MFMxSFNGNmpCYTg1SUtYejZlM0QrekhWNlgva1hzS0pPVll1am12?=
 =?utf-8?B?Qk92dS90SUdMUGZQRllTSjI5bEhzc1FWMUozS29wMmJqNjZnMUhoOWhabGZr?=
 =?utf-8?B?YW9SM2w3dWs2SHN0L3I3Zmg4djBBUTZlQm1VZkFSZ0s0UEZXdlVmYS9HU0Vs?=
 =?utf-8?B?NWZOZmhYaXNNN0JPTVAzU3pmdEpYaWloSjc1Skd3NCs2NjB0TFRCS3BtV0V2?=
 =?utf-8?B?UUd4bGdBUEZWM2lEN0JJU3JQUDg5SzAvUE1maHFjRjMwZjlHdnk4K0RLN1JL?=
 =?utf-8?Q?b9XOEeRw3AfZz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MktGc2pUSGxiSmhjVHloVmlhQVRPaTlXbEx3Q0dPRm1ZSE14MVVxVW1tdkdj?=
 =?utf-8?B?cUVGUDZ6SVBxQllUWnZxaVM2UGZGcmg0TlpqZ2svK0RMaEF5N2JDbFFVcUtI?=
 =?utf-8?B?L1RCcVhnYndxRWFGUFcrU3o1cEw4dWkyNGRYYVJjVHZFVTFqQ2R4c2hlb0ZI?=
 =?utf-8?B?a1J1V3FHTkVLZ2NpVUVSd0VTQXZXRGxUWXlydERUbUNCaDVGSGJYeTFmOHc3?=
 =?utf-8?B?YzY0M0UwMExVK2VERHMvUSt0eC9sM2E1MlNOUDJ1bEl3TGo0L0h6WCs5RHVn?=
 =?utf-8?B?V3NzbndnNHpNcGhkRi9RSE92c2pONjdLQll6S0ZzTENQWEhhNFdQVkNnc05N?=
 =?utf-8?B?SFduaEdHZnJXRGRjdDNid3pmaTgxRFNiVVAxK3Z6dXZTU3ZLYVd5UlBJcFdN?=
 =?utf-8?B?d3lpSG9wK0d0NWdCV2tPQWU5UERYNWhWYVhTS0hFZ0Y1NnVYZnVFY1ZjdDh1?=
 =?utf-8?B?RlJRbkhXeXR3dUxIRjJOcXhJRFdKTHNrd1NuTmJMSEJMd2UzV3VCdmF6ekp0?=
 =?utf-8?B?aG5WS3pOdXBhNjNhL2YzR21BRHBpbVhBMGc0d051NXVHK0ZkK0p2d1dFNFBJ?=
 =?utf-8?B?SnN6SkF2MjF3ZGtEdTd5MlpscjYrVVNPczIvcGNtYmFnM3RWVG0rOUFzVTVP?=
 =?utf-8?B?aWF6NHlNempFU1ZlaXh3ZTJGMGhCY3ExWlVMaXlrVElJSkNHeWVSaG5EK2k0?=
 =?utf-8?B?d290RjArd2VqTjVwYmNmTytiOWVxaHhrRmQ0SVY1N3dEV1ZyNzM3VUtJSTNn?=
 =?utf-8?B?TVpGTkNDMFJnME5lak9rRGExMCtlditYZEFZelU4clNNWDBhQ3ZQZk9aVVFl?=
 =?utf-8?B?R1RkOWNZdWMyekxjclYwRWNGNitxK3BWVDRsRDhaVkJsK1Q4SU9yYjg2U1Bq?=
 =?utf-8?B?TDdZbFREaWRzaXBTQ0F5SlFGUyt4OGNFY1ZPT3kyQmw5NmduTkF0Ulg1SjRv?=
 =?utf-8?B?Q3doMTNrZlRpVzFhZGRGbmQ0cjZRR3RESlYzeDUxeC9pQVpybzNIMkxMMk9S?=
 =?utf-8?B?NFZxUEwxWHRZUTMyWUp0YTc4QjRRYmRpTGRwZEhJSG1GSW9CUEdUVXNFVVVo?=
 =?utf-8?B?emxKSktmTG5lVDI2azdVc2ZvK3lIZy9aZjNnVkRRRHZJMmdRL1FvUXR6cjlQ?=
 =?utf-8?B?bytIcFQ5RVdkQVoyS0FESDBkeGZQNHZPUVNWQ01oMDJwdG5UanFMSXJML0hp?=
 =?utf-8?B?OVBUajdwYnlGajBYRi93SEpVMDBVa2o1MTlNYzRjcHM4aUdDUG85QVl0SjdW?=
 =?utf-8?B?Y2krNDBsOVIyNHFEcEpmT2dlQTZUNGU1SFYwNGVBbXZKM241d3NvVmxsYmI5?=
 =?utf-8?B?NGtYNHVLR1Y0dnM5VlVBOFpWTEVSU1hpZCs1bWVMMGEzQVV4WjhhN0lGS3hE?=
 =?utf-8?B?TEprS05DeWFJK3ltc0NDdCtaN2dhc092S3lkZzA5ajhaU0JhNFY1ZlhPVVRR?=
 =?utf-8?B?V2MyQ0lob1I1c2Uwdjd5bUYxNzBrWTNISkVXdEU1bXBnVmIzTFNCeW9JVlda?=
 =?utf-8?B?Z04vNUp6QXlSRU93TG9vNHovWExndWZVMWlZaEV5QmlEQldTZU5kTXRwSEdU?=
 =?utf-8?B?RnVISHZGVlpHMWVoNStxTk5lMjJhSHpodG84NG01MkRja2JScXFyV0N3WGRk?=
 =?utf-8?B?elkrblkvTURDWitjRW52UXFHSGRoQ1pRRlRlOVZEOCt5NmFrNVVTSzl3LzBP?=
 =?utf-8?B?ZCsvZGZHcjJuWm1tSEMvVkdna3R3eUVHejRPSlFCVzVQV1J6Z3ZxRUJhZEQv?=
 =?utf-8?B?M3dtcHlaZDQzczVCRkZhRHlYbDg4bE1ZV2pXd1hhN1dSN08rMXZ5dW1FblNK?=
 =?utf-8?B?Z2orR0xzN1l1VGVuODhpV3oxN3oyWGYrUWh6U3JmcVZQc1lwVHZXNzg0Ukpl?=
 =?utf-8?B?NldVcUdlUURid3oreGVSRU9TRGt5b2taNktzK0RENUdNazNjclBEM2dqQ000?=
 =?utf-8?B?NytDU1hzOXdYanhDL0QvemJOcWJOQjREbTBiL3RjVVZ5bmFvQXoxeWtzTm9v?=
 =?utf-8?B?ZkZ4TjB2UTdjZGtwaHBYb3pLTW5sbVRXbEJleDF5bWJ0UEk4bXVEbGJNb2Jz?=
 =?utf-8?B?VVdMbG9JTWVYUjNtVXIwQmxuZ1JjWDFqb3NZQ1J4WmxhZGhxaE1uOTBFMGhr?=
 =?utf-8?Q?5zWQGQaqlSLMtDsZAqtvMehnc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b60deb-3961-4d40-a893-08dd39458ee1
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 11:28:27.0658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uNbksYlVMW/qo5VlW9yEd0PjjJKFM0uPurWEPHzbJ10ciQFtdSB9GR24tNCY7G8diCtYEriJT5LOqPCaOzsngA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9551

The NXP security hardware IP(s) like: i.MX EdgeLock Enclave, V2X etc.,
creates an embedded secure enclave within the SoC boundary to enable
features like:
- HSM
- SHE
- V2X

Secure-Enclave(s) communication interface are typically via message
unit, i.e., based on mailbox linux kernel driver. This driver enables
communication ensuring well defined message sequence protocol between
Application Core and enclave's firmware.

Driver configures multiple misc-device on the MU, for multiple
user-space applications, to be able to communicate over single MU.

It exists on some i.MX processors. e.g. i.MX8ULP, i.MX93 etc.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Conor Dooley <conor@kernel.org>
---
 .../devicetree/bindings/firmware/fsl,imx-se.yaml   | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
new file mode 100644
index 000000000000..0b617f61640f
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/fsl,imx-se.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX HW Secure Enclave(s) EdgeLock Enclave
+
+maintainers:
+  - Pankaj Gupta <pankaj.gupta@nxp.com>
+
+description: |
+  NXP's SoC may contain one or multiple embedded secure-enclave HW
+  IP(s) like i.MX EdgeLock Enclave, V2X etc. These NXP's HW IP(s)
+  enables features like
+    - Hardware Security Module (HSM),
+    - Security Hardware Extension (SHE), and
+    - Vehicular to Anything (V2X)
+
+  Communication interface to the secure-enclaves(se) is based on the
+  messaging unit(s).
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8ulp-se
+      - fsl,imx93-se
+      - fsl,imx95-se
+
+  mboxes:
+    items:
+      - description: mailbox phandle to send message to se firmware
+      - description: mailbox phandle to receive message from se firmware
+
+  mbox-names:
+    items:
+      - const: tx
+      - const: rx
+
+  memory-region:
+    maxItems: 1
+
+  sram:
+    maxItems: 1
+
+required:
+  - compatible
+  - mboxes
+  - mbox-names
+
+allOf:
+  # memory-region
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se
+              - fsl,imx93-se
+    then:
+      required:
+        - memory-region
+    else:
+      properties:
+        memory-region: false
+
+  # sram
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se
+    then:
+      required:
+        - sram
+
+    else:
+      properties:
+        sram: false
+
+additionalProperties: false
+
+examples:
+  - |
+    secure-enclave {
+      compatible = "fsl,imx95-se";
+      mboxes = <&ele_mu0 0 0>, <&ele_mu0 1 0>;
+      mbox-names = "tx", "rx";
+    };
+...

-- 
2.34.1

