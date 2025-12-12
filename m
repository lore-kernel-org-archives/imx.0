Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011008.outbound.protection.outlook.com [40.107.130.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA79E311940
	for <imx@lists.linux.dev>; Fri, 12 Dec 2025 09:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765530957; cv=fail; b=RcTAUKXVgBzpmIB44xL/65m4q67DKHIIoEfUjAuflypLaW70EFWOVhatYSms9WVROetahSP635D98jOPQhuz2/2Lczc8CNQ+OYxSJoRT1H7zn9CV/yPgqDMrnU8up/MbOHhXNMoyudX2HVPzX5iFbcTDvbElQNPLonxDneNvmh0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765530957; c=relaxed/simple;
	bh=tOtSXomq2KH+8clEacb9RWYs1iYcwyaRAGNdBtHVSY4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=e2ew12ch7D5uAWVTaztjEQQBFPmkFiVNy6ow5y3BFgijiAP102PUtO1LI3a2j0FWgwfE5McsbPUl++BJHahRtiXQ72kiOJFc7LD576mbEh/EQtkJssKnsg37XBOZhzEAJFAbF5zb99EH39/ykaWOEmn4oeXCDbtip30KtV975u0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FoAh4yCD; arc=fail smtp.client-ip=40.107.130.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FoAh4yCD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SIQCP5x8tz+BDydQf6AVzSbnn2UQOAK+tGTJIdgdP1pA8HRSlRUlBMmVF+Qp30XU2cMNHHmBSxUg3Y3xDtf3uy1JODJiQ0R/R+Z7/dakxYmV+G4BwmhSZu/2F/jmu7SlPoZQvQuczG54wsvX9dc354wcJetC8/YgagXySX5NFYT5nD0t6qEIO/uvgvSkTxmdWYhJOQyXU0ZSFkMnNih0xmJ2T4XhW1YfbRxc3fqPviJNa4GkyvAllgsgRocnI5bvVir4EvKYpYyEjSfJg54/D3P+vRflcPhPoyoD3dIlVL9nSMt7Od0KI7DaxeLF9D2Ry5+5UjqYYu4KCkQ6O4cUdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9LQ6U97DJmOvAnP/Hm3/sLsl0YOZft52i2nAtpwopw=;
 b=giJB6ZInBELBdfBcs7xzEuRaKggGIG77uie/xFj0JnOKxYU/QoJ3NbDQIyA/CO9HbFHeA0r2Jgbd5k6qBHQ+ULNhmsiROUKzJzWaRpQ1DR/C+PyoyXhc3+S0vxOvhmFxULNEB/zpz+97cAkbkl8p/3iPG3eTIKIBM+nlDTq8sHNBwftv9wdDQZ5rq6WjMixnGIq9crGs2FTNjc1L6WDUOgDm+ncfMc7akI02zNIAK8hNs0Aq6KbignAM/lLHsKNBV2/oYLUraqRREO2pPI0p2toSISS6rQzWO6XvMDfh8EEXhC3gkQCN4gDRQ8Ky3lCZu0zCrbXg0hOXMn/udUvxfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9LQ6U97DJmOvAnP/Hm3/sLsl0YOZft52i2nAtpwopw=;
 b=FoAh4yCD7r4FbvWcFvsujlpMNOSddYZAa0uSMKK7Ijc7C4RK1C7e4XPLjUBjtCS6J0O1GTIPr2VdzQWb41ldljerv+w/7ZbybvzlBJSnb2OHGknKnUt60MwaaG5nULekH42fSLFLYVOU+kbGgwgY90vSB/Z29HDEv7Mk/u+K1mg/oQ8CNdycW0PFzffwJjJklXqkUGh40SUIBPvtrvaI0aeJf3fKCPCsF9jOU3O53eHmaOrSBW96t7bqVfN/fKwjBeEjiftcnyqyoAzN+YV6uwZ6knsjf/kgPnwODRTfGqJtxB3Z+4Z9Yd1TNXP7guOdgmExGDHC1rPlZZIo1iozSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by PAXPR04MB8735.eurprd04.prod.outlook.com (2603:10a6:102:21f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 09:15:53 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%3]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 09:15:53 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Fri, 12 Dec 2025 14:44:13 +0530
Subject: [PATCH v21 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251212-imx-se-if-v21-2-ee7d6052d848@nxp.com>
References: <20251212-imx-se-if-v21-0-ee7d6052d848@nxp.com>
In-Reply-To: <20251212-imx-se-if-v21-0-ee7d6052d848@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765530894; l=3201;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=tOtSXomq2KH+8clEacb9RWYs1iYcwyaRAGNdBtHVSY4=;
 b=8cBESD8UHfitf4duE1cI01/Fwhjy+ZLc5mL/48ujJXFG551DccKIyoK94Hr3e23QlObCMZg02
 JjlhRH/tI/kCBwMNHvzQMgQgsK9TVUoiJ4YGUIIq6ER4ZCKL2QUqUm/
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI1PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::17) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|PAXPR04MB8735:EE_
X-MS-Office365-Filtering-Correlation-Id: d919aa42-c3f3-427f-977e-08de395f0bb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YWozbUVTZjVtQmVrL0x1KzN5UWZLL2h1R2xRbHBrR1VFUkh3aSt5L2FDeGpM?=
 =?utf-8?B?MHh1WUJZcnZyK25EUnBibUNacXVhWjV6eVkzeEVuYjU0eCtQRkZ1YVZNV2Zt?=
 =?utf-8?B?WnMxWGxqaDhFK3pPZEc5NTMxbU1jTGRERzY0STBaRnExMlhoUUZUNC9ZaytU?=
 =?utf-8?B?bTVhVWN5WVR4dG1kbXZpTjRhbGswUjdnbVd4SWdhWFBDWHVzUnJjOGk4TzlS?=
 =?utf-8?B?K3dpRy9LblBYN3RwVTdMbXphZ2dwcFJXN25RUDdWUVRrT0YzL3lxTytwZXJw?=
 =?utf-8?B?WFptY0p2QlMyN3BTRzJ0Qm5sT2h2cnUyMUg3TmNCSzM4NHhmK2JHaG1aeWpp?=
 =?utf-8?B?QWtXOUZSd0dOakpnOW9sWGYwOEs5RjhBd2xoNGx3Y2wzNVRpNVFUOGRBa3dz?=
 =?utf-8?B?VG9yOHI5S1NldmFnZW5xUFVwVWhmL1AyYytoUE5ESWsxaFRMSENNcDRMUlVC?=
 =?utf-8?B?Z2pwVHM4dENwdW1mOWFEYnkwZXdGbU9zTlgyZmVWazQ5ZHVuczJhZ3Z5RkR4?=
 =?utf-8?B?aGRzTHl1dFoyUGVtWEFUSDY4d2R3RjBiY3VHSnR2ZE5vNVJvSFhneG9UbU5E?=
 =?utf-8?B?eFZHWGVibFZKblZRZEh4cG1DSU56S3hxUnRYY1phWEVvWnZ1MXV2d3VydkVV?=
 =?utf-8?B?aGN2K1o1bTRtRlQzcnZ0STJqNFdUdUJKVUxlNXhjeFpZMm0yMVJrUVFFUUVu?=
 =?utf-8?B?a0pkUSswM3plWEVKNDJCT05ORlZ4TXpMaitlYVhhR1VsWGx0UTQyUFJkUWN0?=
 =?utf-8?B?Ri94Q1BOT1MwSm1NUG9nWjFnZFR2SkVSelMwLzVDTzZEcXNQem13SDRFQ04v?=
 =?utf-8?B?eWVpZXRGcGFISGE0SnZjbGRoaFRpSk5yT2FnWmZrc2FGaXIwenk3N3VaKzkr?=
 =?utf-8?B?K0MrYno5UnZCWnQxTzVENHdFM1VZdzdlemhqRVBEZzJDM0pZd0pzTUQzNkl4?=
 =?utf-8?B?bHZrSnBiK3p1b1ZnSGtJVU5tcjRFUms0aTZaVDhwb3BJUEdWbnBIcXlkSlZj?=
 =?utf-8?B?QU85REUxMWIzelJ3WWd6bXFOSFJZL1ZtczFocHhXcXJPcG5nRGVyKzg3d0VK?=
 =?utf-8?B?THBldFZxbWMvQmdqLzhEQjdjSHNla2RtT1ZEMG9XUUoxdGZneCs0anJvQTBY?=
 =?utf-8?B?bXI3YnRvQ2t0TFlkR25od1kreTJmSU1obVdSaTZiRnF0NkVMa2ZKaHdRU0N4?=
 =?utf-8?B?Q2xtanRTZkxxRWhRT0dHekJ6RlpnVCtLdEFmSDdMSVEyV0Ezelc5RW91Slpp?=
 =?utf-8?B?S2hLZFJzYWtHZXJvY0kwYTRWVVdvM3lqb2VnUkR6UzFDZlRlcmtJeHNKdzI5?=
 =?utf-8?B?a3I2SnVpb29JSEpIWmsyNVNnTi85MjdvODFXL1o5Z0lqTUJrWWdRbWdDaUFJ?=
 =?utf-8?B?MTlNSUdPTlRjcjdVbmlUanJDMGpPN0JiWjR4S3BRRGRTVk4vTTI4dHVjd2pk?=
 =?utf-8?B?MzBIZGszQ005UjFibGJibEE0a2VlMkkyOWJkTmxsVXp3Z3JMVU4xVVkvTC9n?=
 =?utf-8?B?Ynh0bDJHQ0VDVlVOODh0VHdySTVvYzJnaHA4cFQ5ZWVWc2w2SHd0Q0RRS0Zk?=
 =?utf-8?B?MjdGOEhSdFdjZUVESUpndUtDWGxTd0MrU29aZkhBN1g3U1Q5OWEwd2Foemo2?=
 =?utf-8?B?ZmZlWWxVNWxob1BKY044UTJJeHB2MmRMbmROUHpkUzYrSFYzM29ZWlhDTkRv?=
 =?utf-8?B?d0U2VHNvNkUrZXZHNlRnWndaaEw0QitCMVp2NmZ5dUVYTUpwckl0SkRkbGdM?=
 =?utf-8?B?TzEvYlZvdXdERDhDZWlUK1ZOUHpjeXNXNnY1c0JiV05aLzJnNWVKcm9iaWM2?=
 =?utf-8?B?aTNTUkRkSmRrU2tFRS84dHd1bWg2S3dyS256blBHZVFSaUJvdXZaZFJabWZv?=
 =?utf-8?B?ektPS3R6aEo1SEpva1NvTmFlZjhZZHdFeElkVFZ3aWFidUF6cnRJZmNnQ2NI?=
 =?utf-8?B?UW11TTgrSTVpbjdNcm5MMEJpN3JPOCtJK3Z0RHRiQ2JQVTNIUWhFZjZLRXpP?=
 =?utf-8?B?MlQxL2o2VGl3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnZzbjV6ZWpMQkJ6SmlxRWdvbEo5a0xiQVFwMDQ4M3g4WTV4amlNdVpvejBR?=
 =?utf-8?B?VDJnUlVnbnhaRGdzYXV4M0hGcitSWjhxTjd6NVBkZ3NXdGlYYUorMmZTUjhp?=
 =?utf-8?B?ZTNndzNjbGdPN2xHMk55NCtzV0xHQUdvQTlIU1RtWUMvZ2lWYlMwSnhkL0R6?=
 =?utf-8?B?RndLaDlFOVJlbHQyMHVYTEtxUkd1c1lJVjQxQUpuZFNqbUo2eE9KWG5vQzgv?=
 =?utf-8?B?bm1GdmpQNDd3a0pYcmxqSFNMVTM3VVFzWWJwRkJEb01zdEJYb0lUTnN5aCt0?=
 =?utf-8?B?WCtsNWFaRHV2V3NGMkloeWh3TlloMVFYWFlPT3FKZTBMZmdvMFN3Z0dhcVdo?=
 =?utf-8?B?TFg2T0Z2dlFrRVZQbTJ5WlVXSG9nTFBxN3JtcVdwclU5L0JGdTU3OS9oV0po?=
 =?utf-8?B?QWplcGVqOWlrTkk4WGxUUUoxRE1SYnhtRk91NC9ZSTgvM0xLWWJLdEdNSlpW?=
 =?utf-8?B?b0FYdkREMG9xbnhKUW92KzYwU2dUMytuL3Q4bG5ISGtSQ1poajJub1FlTFBw?=
 =?utf-8?B?QWNZUDNCdGp2VVR0ajZwZHRialM2Sm4rNFR3aE4rRGd3TEQxaGdVWjdxUzNP?=
 =?utf-8?B?d3VwU08zU21LUW1VWHN4Q2pTSGxvMElJaUdzcjIwMTYyeG42QW9pSVhvMnl4?=
 =?utf-8?B?anUvcVVvaFlIaUhVc3h1ODdNczdyN0pqanJEelBEeGl6VitNNGJtL3U4YmQx?=
 =?utf-8?B?S3Exam9pS0M4WHZGaTVhV1ZBdmNyVGpoUVZKT0J6ZjFHd3BlNHIwYkk3RDRT?=
 =?utf-8?B?cUt2NTNQUC9xUVFqOEd0RXljOXoyY1ZXT2Y4dDRGU3RkWmRmTm9DdkNiMWxJ?=
 =?utf-8?B?SlNFZ1NnbG5jN3FnZTFCZ25CZGxnSUtVZ1pSaGVlYnNaYnlOdlJKeThtekIw?=
 =?utf-8?B?QjZPd0FYVHFtM3gyRjRpblBydjJJYnJGb3JVbEJMYWtkMmxEMzdxbTN6TnB4?=
 =?utf-8?B?aEdaMzVucWxUdCtsRVlOM05XNkNuMm1zRzRqK1ZndG9GdnpoM0hVYzd0bjNj?=
 =?utf-8?B?MDBIcFVMejJzeHVRUmVlSjZGV3lRSFllVlE2YjUyQzBUMGtqVWhHVmtFSUYv?=
 =?utf-8?B?ZlB6U0dpVHA0ZEhNTnRpUmh0QmhGbWw1VDg2cDNzVHdkR0ZTc013NzA5NW9U?=
 =?utf-8?B?V01DSGo2SVRzeGJ4MDJFbjVtbm9VT0tMQW1Lc1J0bThQWWQ1RmpRRFdRb2Nn?=
 =?utf-8?B?cjNBUTdJNXdrUy9Tb1BKamx2S3FsRmdKSm5UWTB6ZU1QaXBaOU1EQ3pRcUpH?=
 =?utf-8?B?WURJMSt4YnFFSEdWZ05zOENGNW9MM0wyUVJkYWZQZUtnOVpReEV0dTdKK2NE?=
 =?utf-8?B?NjNRS0ZEdHMxa29pSXRmWmpSU1l3N04zbG5KTDdqSkJzSlZlSzhVMzhyc3Fp?=
 =?utf-8?B?dTJHdUtjRWhNTFV6ZVVhdXFpS0NlUVJXOWdkbE1lNTd5NkxmSDc3ZHdSMHBo?=
 =?utf-8?B?dnJIMnlOMmdxSUxQcTYzZ0pBNGVRVTNXM2RCTHZOOHk0QVprUC9kR0ZtS1Rl?=
 =?utf-8?B?ckI1dE54djE0ZmJaM0tZcEs3NWFYVkticzUzTFVMdU5HZzFIODdzaXJjL0JT?=
 =?utf-8?B?TVdSVzZOQXNVbTI0OGxmNXBBRHdqS1RPdzdFREdVc1BMVWpRa3ZKVjA5R1FB?=
 =?utf-8?B?UDdjc2pXY01SOGNncUVuYURzdW14R1FxU2l6K25URFhudDYvdDJvL1MzeTFw?=
 =?utf-8?B?cWw2d0tXeWxhT0R4bVdxZllqVG03cU5lQ0QxL2ZhN2dmRVF4UHArenZpcGJF?=
 =?utf-8?B?QkdISGdCSTZXMGhyYWcxeUplaHEvLyt1akxOU2l2S1c2cDJHOHY0K2RaSGcx?=
 =?utf-8?B?QjkyUVd6UE80SDVoZDJ4eU03SGpTQWFaaGFZczQ4Zm1QOHVBaUc0V3pDVExm?=
 =?utf-8?B?UjVzWVFaSU4vK2lsMmgwd3YvQUhMVFdvMy9ScHJTc2JjM0RCYTlqOXl0UldQ?=
 =?utf-8?B?Ym5VeHdEVFY5SHpWUU44YjQxSGdGcmdZTS9CWEVIWjIrVnQwbThVUlgzSURG?=
 =?utf-8?B?VDRSNC9zMkFRaUExbVBXcU1ncDhNWCttYlBoZ3F0UG1xRTdLSTBQcFZwaUJG?=
 =?utf-8?B?UVBPRWZubWU2ZXBzUGk1TzVUSllNY29FOG1wV3dzTjJKR09ia1dxQklOajhx?=
 =?utf-8?Q?Zygkz8ahVdrKUD3XP8SqikuVl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d919aa42-c3f3-427f-977e-08de395f0bb2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 09:15:53.0589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XP8l/XQi4+aOEf3sxZs5TLO8hr3am0UxaDEdTJ5cmZ8Ph6Ajg3GP84sS8tNdr/aye/X/WnPtLstNXLpd095bhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8735

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
---
 .../devicetree/bindings/firmware/fsl,imx-se.yaml   | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
new file mode 100644
index 000000000000..fa81adbf9b80
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
+      - fsl,imx8ulp-se-ele-hsm
+      - fsl,imx93-se-ele-hsm
+      - fsl,imx95-se-ele-hsm
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
+              - fsl,imx8ulp-se-ele-hsm
+              - fsl,imx93-se-ele-hsm
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
+              - fsl,imx8ulp-se-ele-hsm
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
+      compatible = "fsl,imx95-se-ele-hsm";
+      mboxes = <&ele_mu0 0 0>, <&ele_mu0 1 0>;
+      mbox-names = "tx", "rx";
+    };
+...

-- 
2.43.0

