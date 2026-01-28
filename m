Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022102.outbound.protection.outlook.com [52.101.66.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58134248881
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 16:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.102
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769617341; cv=fail; b=siTTk8P0tpXRX83iAMUh05qQCq49OFrqU3S58FL/7c76KVAaDd7nuvSfBfQIRJ3CKRXbyGJjCm63v/LIWUR7hH7cpBhKmPsjWR79jRNHfO2LJGszMg+VeqziLeu6Hchr78yY+24qnlhJ41OxYbzeKtJZQ8hIEzHbhMMdsYb36BU=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769617341; c=relaxed/simple;
	bh=vBLIA7bA+eUHo+nyMDJuAcInX0koLSwqukRJKePI5TI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ImQSknBRPIs7/gi+E5JH4i/KIgFwq8HgN0sTcoCb0hiFMZT591r0C54k4p4JwLutb3GC8dCijq9iaFrwaDlJNaCcyTNJmaATCzkYOd3DQopBKTC3RBYBX5D0F4lTW0s9R29PAjfD6FB9uaS2E/+GbPOHadi4+D6atJPk46KYvgw=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=KKsRsa0D; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=KKsRsa0D; arc=fail smtp.client-ip=52.101.66.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="KKsRsa0D";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="KKsRsa0D"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=h1nhtKiGAP7J7K5qXQAIWy9iz+s0IwckUFcF8uvKcvsXqOzuMnbWZcDGjd5AwvV7P6lo4mI24Eu2u+iRaOrvlXccpMzHrXiLhyPeuTPLckJQZeTqempiNaCq4wU+IdhNM6yVTE86Tg1la9gc5bOp9qqIQhfqmJZttc0cdfp5sBY3vFzVwNbV+xBDFqoRqGeG8wcrgAQ3YHkwJ19OERseRrE9ZAwKLaaJk4slyRV4XXzVyaXJjBOqEQQ8zgt8J+9TKiQmOKRwVrlCOzUk1Wd2uLthPLrsvdtAXEKZHEz/SLffXnPG++KRe3tCdODsmTro3WL3L7KFVJ9KZgOksr3r9g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcBzeqs7Y8H/5HRrqPvs5I8vFp/xrRxNiW8xLg3SQL0=;
 b=dgMz3vGSVNxsLWo64OaOXaXWR75ks0v6y6KhdyhFGmEWz7GhPxQFJ0U61yBKO9TsumVgd9jvkcUZc1EQXjD2OZifUE0ap0iOYmbZf8Al/NyjN7bfs4djex20ngRbwwM/voswM32BsfrZs3qB75GoRPTgA4lqWBGTH4oAAF/lr8CjYFI0aAGu0tbLDHhQxPE7Jba/LE7hW8sgkXKaKkE1OV8O/ydv5iavORo4/wQLXrurgVC4rAn4l7CgTw66fjmJPkUN7p7ZP00NqQ+etDSdpuqklwYuIxYOVb/DMgdLiSqA/oBB1X2PdZW0tBYZIpjHEU1OELbuvoS0krM2jqrUzw==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcBzeqs7Y8H/5HRrqPvs5I8vFp/xrRxNiW8xLg3SQL0=;
 b=KKsRsa0DPwAVbCVwDh81bqTJEwwmV4UBVV7QDqNJ19OWgABR3Qheag8fkln7XYVVnb84apeUJb7IpJrF+x+vEd4iRlYKsYd0z2Q6xPulxnFmpKufhXN2vCHc9VAhsq0kbsvUztO6tinE8WAjuPIU/G15AUXkwvGseCvojxGCLRA=
Received: from DB9PR06CA0023.eurprd06.prod.outlook.com (2603:10a6:10:1db::28)
 by AS4PR04MB9242.eurprd04.prod.outlook.com (2603:10a6:20b:4ca::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Wed, 28 Jan
 2026 16:22:16 +0000
Received: from DB1PEPF000509EF.eurprd03.prod.outlook.com
 (2603:10a6:10:1db:cafe::8b) by DB9PR06CA0023.outlook.office365.com
 (2603:10a6:10:1db::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Wed,
 28 Jan 2026 16:22:11 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF000509EF.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Wed, 28 Jan 2026 16:22:16 +0000
Received: from emails-5092366-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-51.eu-west-1.compute.internal [10.20.6.51])
	by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 524DC7FF34;
	Wed, 28 Jan 2026 16:22:16 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1769617336; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=UcBzeqs7Y8H/5HRrqPvs5I8vFp/xrRxNiW8xLg3SQL0=;
 b=oslz0fTwXl1ufYvJVYdgS031EAjegL7QHXblAvS5KmahaFQUj9UGO5W2SwABc9NIpZZzq
 6RQneR13KqIujN8QptyajKD30pWtuMPdLoZxlPkewNckMpP9vtyGnt77ZWX/Rz6qAeHKqUp
 xHjONl18GMr09uxCVGL892tSG71gdsA=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1769617336;
 b=Z3TmEVr7hNwu5U9VbjvVckjPJPqqgXEGLY6CY+GM/JjRHBobPyPZ9T8N7z5ZHrIPDSwbk
 Mz6rPfTgEnaM41FnSxMep+knSxVGWdwj0E4aasYviEsmQEbnIsoaVGHT4hlUf/BsXUPvGnq
 W3CCGOke8kxUJgWnacR79Nxom4O72wY=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AwczMLGZECTCCO6J93Snl9CGPE4s+RGPTGf256VLwgc5yP7qyqNhwjIf7m/t3ItNVCipaIjonHLYD+/LhyJ87YXRsW+5DK2X8HxQICzI6sf6WkPmMuwTgpmtvdSNWB8YOdv1H4t09O355H/a/nKlYOh7RPInql7Fc6DeoutnxPD9pgCBSR0LSqpqGwxpgkkHJYPqudYnKFy7PGRghKgWVRAZWApPeg/My8wGyF71INroOdtfstsa2960LrkxopmDdflFEyZhQ8PHNwSgXGYOkw6svBE2pASD5i5s/kGlHiWWIBpEzceeeoKoIQ7QldsnYo59GX3KQ6bPmRItTkPO0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcBzeqs7Y8H/5HRrqPvs5I8vFp/xrRxNiW8xLg3SQL0=;
 b=NNPuCvgAmCWxDR2glyuObXqNSK9OA1VheGmJ62Kvu9oZjnYT8UKgFVwgNvqicRqJF1Yme2Jhddl4cPwje8ta+3yhTZYF5SRMC0WJ9V1wBqM+q4bvQyrmDgSsxxiHCqsFUJtVQyIX66i1Mn+fkVde1bj/tKTzcwgr7l+BP14R0/UnGsH1JDeKML+M+rR3I81MhM5ie2KCqpn5t3ciR+281GM40SmJyAJVpOZGYgxbQt/GWvW2HI7sSNNIOB1kwGY5kvBao5ONec9HPj6xEzTi0eHhFTJOcHU/Px40TbsuwsYuNvKSID/w3xyfb594BLSB7K+TDnmF1pQmeIfoMrmmmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcBzeqs7Y8H/5HRrqPvs5I8vFp/xrRxNiW8xLg3SQL0=;
 b=KKsRsa0DPwAVbCVwDh81bqTJEwwmV4UBVV7QDqNJ19OWgABR3Qheag8fkln7XYVVnb84apeUJb7IpJrF+x+vEd4iRlYKsYd0z2Q6xPulxnFmpKufhXN2vCHc9VAhsq0kbsvUztO6tinE8WAjuPIU/G15AUXkwvGseCvojxGCLRA=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PAXPR04MB9447.eurprd04.prod.outlook.com (2603:10a6:102:2b2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 16:21:33 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9564.007; Wed, 28 Jan 2026
 16:21:33 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Wed, 28 Jan 2026 18:21:26 +0200
Subject: [PATCH v8 2/8] arm64: dts: imx8mp-hummingboard-pulse/cubox-m: fix
 vmmc gpio polarity
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-imx8mp-hb-iiot-v8-2-9646a3025cf4@solid-run.com>
References: <20260128-imx8mp-hb-iiot-v8-0-9646a3025cf4@solid-run.com>
In-Reply-To: <20260128-imx8mp-hb-iiot-v8-0-9646a3025cf4@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: TLZP290CA0008.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::20) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|PAXPR04MB9447:EE_|DB1PEPF000509EF:EE_|AS4PR04MB9242:EE_
X-MS-Office365-Filtering-Correlation-Id: 18569373-8676-4a8a-2355-08de5e896704
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?S1g0UWgwYjE5dkxBVVozSTk3ZjdjZUM5a0lxMUZJZGpqYTZLdFdMbGpQRXVs?=
 =?utf-8?B?VU9KM1l3OU9VZ0M2dVF6NzN0Zi9DdEtwSUFzSDJsM1hqa1lsZFUvcGg4OXUx?=
 =?utf-8?B?aXNXTEFVTzN2c0FaZUxtdldHY2xDOTUzNDl0N0NUYi8zU3oyM043VjhlcEF4?=
 =?utf-8?B?MDdiMDdYSi9lN1B4MTRWTGlXNEs5dWxLMHFLaFBJRVA3aHZydWtJYW01TEQy?=
 =?utf-8?B?NWh3TS8xWGY1TjU4Mm1jSlRaR3hwL1l0UnJrdDN2cnF6TFRCNDJwR29KWUp3?=
 =?utf-8?B?R0JXSjNYYld1dTVwSWVsak56Vm9wb0pVeWRHNEF2UURwcDBRZHZxdkdZWTZ1?=
 =?utf-8?B?b2lMWDByTnJYdUNoTnRZd28xbGs4RnVNYUxXY0dSVDdkTVM3M2owMmNOTG1k?=
 =?utf-8?B?ZUtWOGpZUk8wdnZBUHNFd0NqUmkvbnJndmVBZndDSzJkaEk1bUJuY1lqb2Zz?=
 =?utf-8?B?M1FuOG5JWG9iaU4zdWhNcS92WjB0UGVqRFlsVmlUbXpQSmF3eTNxVHNvc2U1?=
 =?utf-8?B?R0Z1SUNuM1pOVTVPcjNwSEFVQUh1emdJcDg0Y3lHb09pN2xCeVhlU2RuTlZM?=
 =?utf-8?B?bUdXcERXc1BqQ2RDc0NGN3ZOVkV4bllYblFQMnBZbHZOZ2w5aHI5aHZyMGpU?=
 =?utf-8?B?QnE0WXU0S2IyVENPcWptTWVoUVRFNmlIcVRzKzZyMGxuYlVSRkNMenh0WmJY?=
 =?utf-8?B?OXZxQUorNjVPSTRMTjRyRTYyUDBiYjBWTUtXQ1k3Yld1QWpjazNNUm1xbHl0?=
 =?utf-8?B?ZXd4Ylc1L09EcUJmdU4wL0E3NXppbWNiOFBvTHM3YXRYblZrbkwyNTVJdTFU?=
 =?utf-8?B?RmR3c2paVHNJT1N2dnoxcTBOamZ6TlZLSzBlZjhIMUZVM0NXSGYxTjJsT2dW?=
 =?utf-8?B?SGxPWCs1cWRoOW1ucVNXT2RyaFlFNFhmQXVpa1hEQm9wM205YkZtdmNLem5U?=
 =?utf-8?B?MnhqUjFxOFF1ZXJpS29PelU3U0c2ek1HZGsrNnVoUlNTU3JWdEZpWHA4b08v?=
 =?utf-8?B?R0llTVlUeGFzcVg4d0V3UWNJWERENkdyVjlwT1hET0xCRVhwNEVtLy96MFNm?=
 =?utf-8?B?bE9XRFFBYlFaR1ZsRWJja3o0UFY4aXQ0OE1oelZRT0s3bGlhbktVZVE2STFk?=
 =?utf-8?B?ZFlhV04vbXNCSURTK3JCcEg0Nm02SFM1RWFVSTNxZ2JlVC9WMFE4bS9JdDRs?=
 =?utf-8?B?b1FmUDdYbVNSd3RHdWhLV09EV3Bua2ErN29wN1FZZStwUVovZTRqQm1LcDRv?=
 =?utf-8?B?ZW9tUHRkeVBKNTFISFUva0lKRXh3M28xSXhGa2ltMWRNS1pPZktEQWN3ZlhI?=
 =?utf-8?B?RlFKZTRvY2hkMk5kWjd5VE5yUkI1ZXBzbFM0WmZlSDdXZHFOaE00ck9RUG84?=
 =?utf-8?B?cE5iY2FoUFkyMjBNWjcxVDBodDFPN2FEWUhXSzhmRVZUdVVXZGNBdVR1WWdG?=
 =?utf-8?B?UGZURnpQQTNwMFg4ejg0VnY1OEJKSWRyQVJaOWQxVlNIK2tDNFZqV203NEhK?=
 =?utf-8?B?SGsveTdZUmZUNlhFZ3JDdWdCWFR4Q1lOV3VCOTdNY1VPaGJ5N3dxM1BOVkZt?=
 =?utf-8?B?N0doVU40dHJTbS9DbHF1d0pDWjRBOEZMS3V4TEdMWHo2SWszSVltTjg5WmN0?=
 =?utf-8?B?SjlWMnhtOFdTY1JzaFp0eExWSExZWGlLa2pUTFRFVlZFR21tTWYydm5KVE1s?=
 =?utf-8?B?bUJFSnhPNTdZZXJlSEVHYi9JQncvRHpqcy9DalNvV1ZLWHg2RlRCYXBlL2dI?=
 =?utf-8?B?bVBFQW9FT1MvVU5sS0JrbXpMdmc4dVV2UmtDQTZheWh0U1JRTDg3enZKV2pr?=
 =?utf-8?B?bmZaL0JYaXQxWU1JaG16SW05eU9YYnF1MVdFZE1uYlZRdmFCQmNNUTJNaEMw?=
 =?utf-8?B?WVl6Z3hkRmVCVXpaNCtKRFdSSW4yUG5RcWdvM3lJMEFXUS9tOW9JUkgxcWFY?=
 =?utf-8?B?dGRaVW9JZEpaNDh2SHNva010WEtrVzFrYTdMNEp1SnZINUxaTm9DT0ZMZzFE?=
 =?utf-8?B?NENtb21GTmx2djFBWmZpODJwbGxqRkQ4dDJNSFZER2ZoY0VXRHdrMXZyTjNL?=
 =?utf-8?B?YU1GYlowcXAwcndoTEtndExYTUh3eHlGem1od0J2b0pGL1lZSDAxRzVZUU4x?=
 =?utf-8?B?VysvNEFNbW4yMXNuVUpnandJbU11ODRxWitKQnh0UDhrTllnb012Z0VhaFFE?=
 =?utf-8?Q?UZsAlym9qMZcWimuRkfWk4k=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9447
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 6f70bec7f2b5487a8b7f4c7c8d8c7578:solidrun,office365_emails,sent,inline:32bee9989c3005f395d4e7f8822551d9
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	887158c1-9645-4d75-acc3-08de5e894d74
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|82310400026|1800799024|376014|7416014|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TFZPMi9GcEUvRk1JNzcwQ1I2OW5jZVMydk5PcXU5T0VkSTdrdzB0Z0tsMXVl?=
 =?utf-8?B?Q1lvVTVzQUhCRFdMRDNFNHFsY3UvS01haE9xRG5aTTlTZjFwOWV4YWJQVi90?=
 =?utf-8?B?ekpZSDUxK3dVcC9IWit4d29OcVZFak8wUzBtYW45VEZZZFowcjJ3NUpnbkFB?=
 =?utf-8?B?anVCZlR5Y1FyUWVHNGM0VDYrWk1ZSkFhbzV4QzFxSGV3NnhhVTBMdXR1TlVT?=
 =?utf-8?B?U2NjT1lMNmQzUWdjOG92dU1wZ1lheGVjeEE4STBRMVN5bFNFZkg1VHRJVVFZ?=
 =?utf-8?B?MDdKUGdPZERYSERjVjg4a0VRZXVKZzRRYXBwb3l5R0hhekNqQjl2ajJQeUYx?=
 =?utf-8?B?MkI0R1R0Y2JYSHhNVVpscU1oWnROa0ozazZqSzVKVmZYbVUrbFgwM3BVNHd5?=
 =?utf-8?B?SS9uZHBEQlE2NlJlNmRrNzZYNXQrRFRrNTdOckJ6T2hxL0FrcWRMY1VyTS9L?=
 =?utf-8?B?cXMzdGd6bU1XQjJsRmJlY29SQ3hFVU5FWTh6V3VPOTkxaFFjOEM1WE1aTG5V?=
 =?utf-8?B?MXEweFRHd3pxb01iZ3NyQU5NdUJBcnRVZjJRZEZkUUl1ZHVpZzUrT0JwZVVY?=
 =?utf-8?B?Y2ZnVFNpYzR2QVhqeU0yM1o4NEtmakE0RC9obmVTdTVtNFJKWVN4dGNWSmdp?=
 =?utf-8?B?elBtWFN3VEJVdktMTkxoV0VQOExkSDM1Mkl1Y0MraG1WRDVrR29oazVnNlFw?=
 =?utf-8?B?UzMrQnI4RTZxdlo4cXpodHhlYnhQNFV1QUw3OVBPYlpoV3E5cUtqN1laUk5Q?=
 =?utf-8?B?WE8rUFY2THFSdk9qOVhZSS94OTFwTTRsWXlBenl4V2U2SVRhSC82YmoveFR2?=
 =?utf-8?B?ajB2M0Y4MjlwSUJYeW5DVnBTTXZzNmRMUjM4VkIrZ3VtMzZwMkV2Q2hlazJG?=
 =?utf-8?B?WU9oNU9mandTVTJjU2t1T2Z0OFpwN0krcWVHbDdkMm9SMzJBM1czZWRCVXNG?=
 =?utf-8?B?RStHa3gvYjBQR3VCRlNqZ3JvWk1mUCs3SlpDOUNLakI4VTJqWlZLUytrZGw1?=
 =?utf-8?B?OTIvV0tLcFFHWnREOHZQckc5T2VseXgwd0dEK3BZQ0p1Q25tcGJCdU9xZExy?=
 =?utf-8?B?VXVGRjFmRjk2QjA4QlpuTjFNRncraXlSWmMyL05LaFB2aW1SMUY5UDVLZ2pl?=
 =?utf-8?B?VTJzQm9yWERZNFRPU0tObXdGbFFaYXl3d3JCSzZnV3h2ejE4Yi9CdFFYalM5?=
 =?utf-8?B?T1NramF3T3VJWUxYanhESnYrKzF3ZHhzTElyWHlJeWVTZGRYQ1gwMFEvcHQw?=
 =?utf-8?B?QUs4aTJ5R3lzd1JpNzlmWDFsNE9Xb01xS0gwQWx1Q013U2JienB2eHBRNDU1?=
 =?utf-8?B?K0RBemJTa0dpOVl4Z3cwcWpWU1czamJqT0dwY29Wc3Zhd053T3AwV0Z5VFVU?=
 =?utf-8?B?clQvZ2IrK3hQRWR6THRiaTRXWERONHp3RzhPakpzWlN6RzllWEpHQTEyUGR6?=
 =?utf-8?B?R2hFNTk3M3FoWmJpTzJmS0lwUUJDcjZNOS9JQmhCbGlCa1pOMmRJMFNjbnF0?=
 =?utf-8?B?d2xrL3dOWlQvL2ZCcFZ3V0RGV2RwZzJGazU1NjUwMjZ0L2FJOHE2c0N1c2NO?=
 =?utf-8?B?cnV6YUdJRFZEM2dQYng5dk9PNnJzVGJBb3Zwenc1UUFDTXF2WWJGSTRsY3Ny?=
 =?utf-8?B?WUV1SnNYYWVabXpoMEJkN0xWMmJlV3hiVjZEZjk2M2dIVkl5MWI2MlZQNUtl?=
 =?utf-8?B?V3BFdUZVNXpleHg0bUZaVHlXeG1tamdwQmt1KzJ4N2R4Vlh6eGpqMU9CSEcv?=
 =?utf-8?B?WGhzK09RbXlaZmFncmVTOFZFUXYyekt3TDI0Q0dobVlhVkJPTVFoVUQzT29v?=
 =?utf-8?B?a3RqeFkrMGdPaEY2SnR6T3Zvanc1K2JnaDdJWG4wdml3em5GbGtianZBaU5s?=
 =?utf-8?B?Ny9zRlQxbXRObjJRKy9zaHNFUWw3aldoeExCVnVrUU5PM2xTRmY1VGhYd1ZV?=
 =?utf-8?B?K2pyRFF3NFdCcCtNSjBCSkFMQWVuVmFacjBMVGxScDZJVGdrWVpPMWpXK1RZ?=
 =?utf-8?B?R3BHWUZkbFBmOEdWTjRaU3ZrK29IVWRQUmpMT1RyWHUrS3hvZ0lzbmpCa2tj?=
 =?utf-8?B?cm16MFNzelZTVUl2RXFwY0sxWjY2UzZML0dqSjZSNU5ZQlF5eU5rZWE2cVM4?=
 =?utf-8?B?SytSMjhPRnN5M2N6ZTRhT0lCYXZsVVVITE5JWXN3T0k1T3puK3YxSmxKY2Jz?=
 =?utf-8?B?cnF1d1JVQmkwU3NVYW9zaUJmV0NBekY4R0NHdlZuSVJkSE9lZ3gwTm5GV1Vi?=
 =?utf-8?B?enV4SkJwQTlabWgwbjhNRHF6SE5nPT0=?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(35042699022)(82310400026)(1800799024)(376014)(7416014)(36860700013)(14060799003);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 16:22:16.4615
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18569373-8676-4a8a-2355-08de5e896704
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9242

Fix the polarity in vmmc regulator node for the gpio from active-high to
active-low. This is a cosmetic change as regulator default to active-low
unless property enable-active-high was also specified - ignoring the
flag on gpio handle.

Fixes: a009c0c66ecb ("arm64: dts: add description for solidrun imx8mp som and cubox-m")
Fixes: 2a222aa2bee9 ("arm64: dts: add description for solidrun imx8mp hummingboard variants")
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts                    | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts b/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts
index 8290f187b79f..7bc213499f09 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts
@@ -68,7 +68,7 @@ vmmc: regulator-mmc {
 		regulator-name = "vmmc";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_LOW>;
 		startup-delay-us = <250>;
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi
index 825ad6a2ba14..5b8c8489713c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi
@@ -73,7 +73,7 @@ vmmc: regulator-mmc {
 		regulator-name = "vmmc";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_LOW>;
 		startup-delay-us = <250>;
 	};
 

-- 
2.43.0


