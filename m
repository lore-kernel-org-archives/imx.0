Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013035.outbound.protection.outlook.com [52.101.83.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20222C0F62
	for <imx@lists.linux.dev>; Fri, 19 Dec 2025 05:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766121742; cv=fail; b=k9P4zWxokQySm9FWOEq7F1uS7SxolTwTu6u18V4thEoP2Wwn8WAebYV75zSoz9ZmfLMAFcKlvZ8Uoslp7qYoKH4klsuqXgLpTOTm/s+rEWxDHhB4A+NE2/E3ad6nIM4B0CYTSXMKZ1XC4myfR8j3Qgdv3aM8h8Q4wcHf6eYKIy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766121742; c=relaxed/simple;
	bh=C+/byolstUK3qbG2fKo1MZ04D0IETXzzliSh+5Ny0lw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IebjNSzFGnDV2OIXJLdwvaZJG245SvXTRiPXxqu7hw5k9vtiheSICEtEj0HujM/GHT/A19FEqHcMXLMmx/ByNTHa+J4nCeONztukImdEXXd1IfG4mWnDpi4vfgoaky/d3/Moi4P+ULK7b4imWdGMqyULSKXgs3uB5mSe61kAfYs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=NwZai6P2; arc=fail smtp.client-ip=52.101.83.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="NwZai6P2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IMkU6qsSKSW4LtrvJGC4QzGA953FZw3sKHVPz+CBysNaF2sEOf4fsl4CwyKw/BeGMyrmMiafIWbkhw/JyfHd3HjwVvl6wRr168hJfjh7XEQT04Wsww5t2YWRtemAkZ1q4Mf4rmcbIPYuNOM7CPfaJTHcw8OnlIkXDqfleu139eyweFQkxLboivhOcwFbN44uTzFEscM3h375I2s6R/azq6jVArT1cjt+dpVmPFi0sV6YwJ16xSBTZ2Ql+WDz8XIpLP23wZDlFerT2DHUJnb/FxGbM7LlWPRiipAJAWNYTBG/jRP9M5S4AL1HcYp5pWu+QcVYYkH75zgl7YZvFT/ebQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twxCJtmU2KZ98rqCXb/Uh81mNSAdCjdLoHTNJdLz9Gg=;
 b=pdjdKvZbMM86TaOpH03/3REns7Zg9Z6AGMr0Z6sQ2VzqPCxfbSn8N10VWhdSiN3y0sfirJWC1mSsHS5SOYSJnHMq4drQSvZ4xD3m7ja3AjgDWuuVlhQpFl+ZwZLdtqxr63nbir6dOJHqYKDAyTyhDDSJA/XXo9qJALIfsGPGGC8OBLLrnitUwx6Sc6yrNcwoYB2sa2hvRpQl7klncJ0j+//r41WZLR5TImhp+8QACzHY9PlOx2IEX+vHntOqc/uCxsztqxn5OUCf6a2KQ2BvBe/IWKC54sTRxw1AVy/3Of8+95pe6/ncds7l6stRhZH05AWta3tBs9c3uih08mLT0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twxCJtmU2KZ98rqCXb/Uh81mNSAdCjdLoHTNJdLz9Gg=;
 b=NwZai6P2Tz5L2n8CIgkbGkg1VzgzMYoV8Rrgdyy4GQk68Ialnupb9OR1yZNI35kDk5fVdCaob3y7dFf8lUhMndzZzB5UnCKVmFLFPuUdiyu5lDqFBeIZSp+pLZelksFXvOSeXxQLOiWaCi+l+kOfT1J4AHDN78SfCcq1GpLd4cWUgcsLX5dK1GsADlakrjvzuc+l4iggrZT0J7NjKEU43kOQv1bwdc9zb6ef+EuJP9y+oLTlAcrmObfJI71K8m3WlcvspKgUOjwSLrpbVSonfDjEMyG0pANCmcIeOm0Wk2W5YUU0K+N8gG9TilbXghw+5A13PZ7tSz6JIgjwDmfuLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by AS8PR04MB9062.eurprd04.prod.outlook.com (2603:10a6:20b:445::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Fri, 19 Dec
 2025 05:22:17 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%3]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 05:22:17 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Fri, 19 Dec 2025 10:50:45 +0530
Subject: [PATCH v23 7/7] arm64: dts: imx8ulp-evk: add reserved memory
 property
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-imx-se-if-v23-7-5c6773d00318@nxp.com>
References: <20251219-imx-se-if-v23-0-5c6773d00318@nxp.com>
In-Reply-To: <20251219-imx-se-if-v23-0-5c6773d00318@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766121652; l=1279;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=C+/byolstUK3qbG2fKo1MZ04D0IETXzzliSh+5Ny0lw=;
 b=0yz+PK4g7vw0/pdErklxn8H5vWgpJKIjec4rzNNQKUR3fpMHxxjv8KE5IAcCk9cIRTq+bSCcm
 4tWTfMb7hnABMFzrW+DKw+1j3lUbwhJHRjv13wZBMxN0c4BjI7nIXDW
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SG2PR04CA0200.apcprd04.prod.outlook.com
 (2603:1096:4:187::15) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|AS8PR04MB9062:EE_
X-MS-Office365-Filtering-Correlation-Id: 84d03bb6-b6b2-440d-5075-08de3ebe93b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|7416014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WHNuQUtCZ3ZuV1pERm96d3hWNWNJT3ducmtaeW5VVmlDM01KZW42WVp1cVlk?=
 =?utf-8?B?Z1RUYkVVMHhLa0FOSi9SZEJaempaQjNEaEtVL1FEa1FNbEoyc016Vy9QVXBz?=
 =?utf-8?B?bDhPM0Ezei9IZldyVHNTU2ttNytOS1hmM2xxN0F1Nlg1QWtwS3JPZHZGOVBG?=
 =?utf-8?B?eEZQcHpSclRHZlF6WXUvS1Zza2FqWEYrd0RtVmdiQmJUdmZqSHcvRjlTMGdu?=
 =?utf-8?B?T1pCUGJBZFZtcWxXb0gwNDA5eWZiODlUMURtaVdpYko4VUZZempRMUtHSGpO?=
 =?utf-8?B?bzU3UUYwdUZqR1BhS2Y4bHJucjF4aEFIdVRxSStyazB4YzkvQ1pOeXptckJa?=
 =?utf-8?B?VXkvbmJ5RzBBOFJqb1ZnZzBrZ3hpNnZ2dVRSajJnRHNWTkwrRzdVTXFpVDdv?=
 =?utf-8?B?NTV5SXZaM0gyeGtBd1BvUkZDV2VDNzBlT1FKTHM2Tmh6Qk9sYjdEdFNUZkdu?=
 =?utf-8?B?RGtiSlpjc3h1NHlqSHlScUwya1VTbWNKSE01Tk8xT2JBcXFPOEVTVjVsY08w?=
 =?utf-8?B?MUtxQXcrK2hvS2ZmRXRibFJDajdHZGovc0FtVTZBS1JIYzYxUEFqb2VXZXF3?=
 =?utf-8?B?MWozTzZLK3JBaFZ2UVliVzljNC9xUXRucjEvaTF0ODZiclMxMmtqYXdNQkdQ?=
 =?utf-8?B?dWVTNEZyR2tGUjl5K0krRlVYMnVtbkxjTFloRzNlb0ZPQlFuVFdsRUVIUWlN?=
 =?utf-8?B?dnE2QVpKMTA2NFdvK3dRbG1NOVBSOHF4eGVUeGlFcHp3TjlXYVNJNElYTlZx?=
 =?utf-8?B?NzZ5L0RZUTBtdHRxQ3BoSG9hMjdPZzVnWGE4bm1GV01JeU9uajAvS3VweVZG?=
 =?utf-8?B?QUFyNHpZTGhQT3YyWU1wQzE5TTlKNGxTNlBtdkIrc2VoVnBUZ3p6cW1VOWRy?=
 =?utf-8?B?dmc1TWZoZUF6WlJnVlNhOXdyNlFUcFVCNzlEMnlFK08rUUJHZnFMZm5FdmRj?=
 =?utf-8?B?WS8yY1FicFUzK01SaUZ3b2RjY3RxZ2JWNFB2bUlWQXVCWkV0aTUrWnduMWVv?=
 =?utf-8?B?aUp2T2ptYU1NK0xDd1V5M1lNd1NCaTA4Q3RWS1RlTDA3ejVOYWk3Vno2MTRP?=
 =?utf-8?B?K0hJNkY4YkJJZFMwZVBPQ3pkazA1QkZscDBPWUp2SXpLQWxaaXRMR0hTZm9w?=
 =?utf-8?B?NlZVbk4ydmw1RUdFanhZRzlteE5rZTVRaHYvb0JDcnQ2bFNUSEFReWJUWjdN?=
 =?utf-8?B?RnNNVmVObElxc1ArUW00ZklQQ24wSXFRdDRWZE1uWDN5U0xGdVdEaGdFQ1pn?=
 =?utf-8?B?OEJDQmk4cFhtWkRzdWNXdEhUb21CTHFZL0w0TEtwcXQ3OXR6V1N5UHhTKzFk?=
 =?utf-8?B?VUpuc0FpaUJZaWxyK3hTcWRoZDhodjR4dFdTMDVRTDd6bDhyOHZNeGhOZ0Jh?=
 =?utf-8?B?UUpIamdqZWRZVXIzZWFkODlOZk1QUFhTS3kzcHZkNVNFWjZwT0JDZzVtbkN4?=
 =?utf-8?B?cHRGQmtHSjQ5cHIyajFXY2R5aUUxMnNqcGxUNnIxSEJKaGFkZXRCTloyc2R5?=
 =?utf-8?B?NWFpVVJOVVZBOGdCc1EyL0pQdzVYK05DeHUrRXBGSGdJa3FEc3JCUWp5UU9O?=
 =?utf-8?B?emRHeDFkRFBaVzFrL215THM1UzlRUklmSkhaa3ZYMEIvVWE1aXphNDJPa0lO?=
 =?utf-8?B?RWpuTlFqZGk1TkZ1b3NnSXFzQTBETG8yY3hxUk1YalNXSnlKZDNVYUN6Y2Y1?=
 =?utf-8?B?UkFnbFk2S3hCVmdrSHR3aDlDQnVIdDRnTHNyTzhyY09qY3dxTFI1dXM3elI5?=
 =?utf-8?B?WUxOdkZrQUhYb1pJVkZ5Uy9EcnN5YUdqT1FjRTFiVEtBSEtXTzJxZUd1VXhG?=
 =?utf-8?B?WW1qVWk2SGdZSUNKRlYwMFRkU3pxdkphWFRFN25ZQXBjOTM4QVlybUVjbTd2?=
 =?utf-8?B?WXljSExGbDFWRFpISmlmM2kxZEVidDIrY0RBUnV5NE5SOFZYOU5FOGF1a0Z4?=
 =?utf-8?B?UkhzekVpT2Y5czZtdzlDa3J6U3R6S1IxUldPTzJyL3F1NXR3MDU0eFIvL2kv?=
 =?utf-8?B?RjJxZmN6My9UcW5BbUx5amxJTVh5cWRkKzlkT3BmekZPUUxGUndhbVFZRXBO?=
 =?utf-8?Q?aXguvq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(7416014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Uk12MSt4UDhKWTBOMkg5TzdHVk1nUFpUbHByUTU0YkdVMHdpWkNRYWd1QXNy?=
 =?utf-8?B?TVZJekhab0hOSHdjSStPQklyZ0hYczY0bDhDRVhGKzZuMU5NVWdhZWM5TnEv?=
 =?utf-8?B?UEJxMEU1Y3I4dWxyZ2RkMlBsWE1PZFkrMUNjVUxkV1ljODM5a3VucldBS1FR?=
 =?utf-8?B?emE2dnhycDVneXM0WTcyL1FtU2ZKKzVodnF5SS9nSE5GQzZiRW1qckthWisr?=
 =?utf-8?B?VDg3ZmlwWlBLaWZlemk2ODNTRm9EU3dTWEJyOEtiaEs1aHBWY1lqbU9HWktU?=
 =?utf-8?B?SnlEQVN2NHhXcDluS2ZCQXIyc1BKRlpNTC9HMFo5MkFzZWFGQ3BNVU5vckl5?=
 =?utf-8?B?UXdHYVo1bkI3eDZQMVZrSUFrbTRqSDg0YVNiaWtwc3JzOUw0VitmOHFhaGRW?=
 =?utf-8?B?TzF5eER1aVJyTTRTeFArZzVXc3l5cXlhZCs4Qm1wTVUrMDFOTXo0aW5FUzJU?=
 =?utf-8?B?TkMrYkhsS2RwTmFBQml2THQvVmdKN2VuNHEwZ3dBREQreHcrTzJ2MkdBWE5B?=
 =?utf-8?B?bU81SCtnVVlMUm9JaU1sWXhiRTFwTWJBZ1lJQXg4eHh5ZjFZYmp1NjJKKyt1?=
 =?utf-8?B?NmUxSVFRSTZuTXM5L3M1ZksxQnFYRE5rdVpSU0dMWjhoZDZsMXJxVFJnbnl4?=
 =?utf-8?B?ZEhZcWxNUnFGU1F5MTZWQ0hKdG0vWEtuS0Z5dzAvdmUwZDk5NmRpZU9NNW5G?=
 =?utf-8?B?d2xad3kzR2RoRVBzRUF5cmxoZU9KN3hlWUlsWm42Y2xSUzBoMEwvWDN2ZWVS?=
 =?utf-8?B?UVZGaDJtZ3RhcXdvT2dpOVV5WEN3cXRObUpjQjArdmVBVjBHRjBCbDMzd2lS?=
 =?utf-8?B?dVJ3VFJlWE9BTnJVKzlTM05paElvSlNNQzhWQkM1VnVRNm9pOTY4Rm9rMGN5?=
 =?utf-8?B?WE5oVHcvbkFVUi9yczVrZXIydC81LytybmYwOXRDL3k2YUh3cFI2R3hRWTMy?=
 =?utf-8?B?L0NKUkJaN0xHVlBjWGlYSkkyOTg3ekFQcmtkbjNKWjZjVUJ3T242RmlrTSt5?=
 =?utf-8?B?bDZFTytwMHpCS2NuYnZab0VtRFVsTTZ4bm5hdXNzK3cwRUNsWVlUc0YreWZ5?=
 =?utf-8?B?bUo5ME1IVmxPM21SNEFhdUJ4UTY4dVFWSVMvZEdTd2Nvdm9OOTNiazlIOEFR?=
 =?utf-8?B?MzVZbWwzbGlzekV3Nnk3RkFva0Mzdk5ONytxMSsxZGlPRmxCQzJNakhoVGlN?=
 =?utf-8?B?TlRNRTZqL3FOUzRCUFZIM0NZWUI1WXBrSWJYYmRQWXovSFlaNm4vTFdXOEZW?=
 =?utf-8?B?c3hXWlZJeStrNk04RW9yZCs0S0VuTU1zajZJcTl4MU54Wlh2c3BVazFhdE5X?=
 =?utf-8?B?ZGtvaE0vM0JqSlNmQ1l3WW51YUpzcWRzck13RWdwWUlGQ2QzekphdFZWaDRV?=
 =?utf-8?B?UkgzOUsvcGNoeWoyNlR1SFpPUU5MVnU0VTFFRXNLcjVWL0NCSTE2MWlPcUhD?=
 =?utf-8?B?dWRiS3dZWnJLK1ZEL2Q2M2Z2c0s2NDRCeC93OGFSc0VPdms5WURxbVoxOEp6?=
 =?utf-8?B?cUMvMTJSSi9KZjI5UnFyU2I5UWtjWE9uSFpJUW5oZ3BYRFJzMW1HZ1E4NkFZ?=
 =?utf-8?B?TXFjdU83amlGQ3F0aE1BaW0rT2p4MmxoTXRRdDBlVitHUlpnV1RCcGxTbXFl?=
 =?utf-8?B?OWNiQnRMTTcyWnVKdEYvaXZ4WXBCQXpXWTJLQ3I0ZFVUYTdCeURScy85Tmpl?=
 =?utf-8?B?eVMrZGh0UGZLRndTOHZ3UVJ2MDQrZkdzempwV252STJrSjViSDUyZmF5WFkv?=
 =?utf-8?B?bjBJOTQwdWs1VFp5QUx3RlNvNElXc2FFLzJEcWhMMnJnTGlBb09ZL0ZtSm5y?=
 =?utf-8?B?STlNQ2hNS2dENnA1c1NYeWRWMnRXRzBocER4aTBERHRVVHFBRnBna1JZVmoz?=
 =?utf-8?B?akYxdngwUGkvNlpaRGx4cE9iRDEzSVQ3RnFZZk5Qa1B2U2NBYnNRUGQyUWxF?=
 =?utf-8?B?RGpTMC92TEN4NzRQQmEvamhOajJkc2R5WHpkR2M0cGFIVUJVSUxLMlBoYlVz?=
 =?utf-8?B?ZTRSbm9WOW8xRHNkbVdTYnVvenNmdytrZS8wbEw2TUtyYTR2dzBqRHBwSUNn?=
 =?utf-8?B?R2dwNStMOEFZZytmRTdXSmZVMWtYUmtaaWMvOUtGME5ReHN2OWFob3lVT1gz?=
 =?utf-8?Q?qN9yxUvD8elzzC+dR5vCasQtQ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84d03bb6-b6b2-440d-5075-08de3ebe93b8
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 05:22:17.7684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HWVZ/w4t9IODgc+glJfDboqgAjJOYYE4OUEUuGVZSx3V9L5UikjqKNyLEWQUuItcELzfXFb2+TmbK7Zi62EBSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9062

Reserve 1MB of DDR memory region due to EdgeLock Enclave's hardware
limitation restricting access to DDR addresses from 0x80000000
to 0xafffffff.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 290a49bea2f7..10aaf02f8ea7 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 /dts-v1/;
@@ -37,6 +37,12 @@ linux,cma {
 			linux,cma-default;
 		};
 
+		ele_reserved: memory@90000000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x90000000 0 0x100000>;
+			no-map;
+		};
+
 		m33_reserved: noncacheable-section@a8600000 {
 			reg = <0 0xa8600000 0 0x1000000>;
 			no-map;
@@ -259,6 +265,10 @@ &usdhc0 {
 	status = "okay";
 };
 
+&hsm0 {
+	memory-region = <&ele_reserved>;
+};
+
 &fec {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_enet>;

-- 
2.43.0

