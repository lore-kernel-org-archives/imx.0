Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2078.outbound.protection.outlook.com [40.107.21.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FCE1D6DB6
	for <imx@lists.linux.dev>; Tue, 24 Dec 2024 12:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735043670; cv=fail; b=pv77VmcyummFoUXs+igcrcPwk6Hd8yogiDKXKB2Ml1qEFfvkCs628mHu24sFZiaiG+tRUMVHvcJboHgN34K7zndQzkG+MYqoUQmSPGCK5g8RqosoOV1arlzvggSBvlpai8gBfS4p3pRlC0bD3rVG07QRE0qLqBOiseTkmutPwcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735043670; c=relaxed/simple;
	bh=P9La18hIFymTwcU8ubSs1RclJvHJhWhMjzgbdq5NzDI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=nwS/WtnhYU9lI0GRlGd6vuTaxhwoWg4EW0Xd/Gn8Coum6AJVCt/fBJbErkuqyMVOC1prKWML2477JePeiaj/h7fDFT//AWt4UASezGw6+axerKrfAeP6ONljrLHTWxJRmjyLbHv9sY//saMZs8AZbveJTRcJjTUzcyKo19QtARo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=r4Rl5rJg; arc=fail smtp.client-ip=40.107.21.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="r4Rl5rJg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ljyfEcsd851fMjPnT/faHD8vng/6/u4pCQDBjUIX1jk+4asvLPr0BKlLiwc36HRnDTZJQbdtbhSzTWsYDlzMzZFY1zZV4prjNlA/xpzWFJbXicsPubIPev695eBYZ3R5K+zTRBM0GDwe+w4RgRCK/fl5UuF7RLhpa9QR+pmnmEtWciQexwgK2bTADQwoIseMFv6t0ssmbWxCVqeeX2PVNjfyvIx2aC1QrQmi38QEyUSam3/aHjAtCqjWiC5d2umLnTown9L9AuQyfXu5uQHcOaAk/i2AxtoOt7hB8KOrqOhaMampni6EqGn3fQurrADr7srZ7esFHd70GWR0VHiHKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZRCk2Ip1aIO8f+jfN/uHcsoL/NvRduZ1RSZERIqOEZk=;
 b=prTETPOmXJ1FINVJivChCQgvCM+MyZ/fpIpCl23BE7s4LpBC7TbPonMKw1efKq3FHsrDDA+rT0YDFRO4Yk+C1NljaTXUD2Lz1nf8oVjXdHQ0p7VosVak0ygFhCeDYbBFpgJa8CkB8oMOttYcKtsjCVqG9pSM+/74obHJfAc9gmK9426Le5JDA/fi3A9uw3cVWfUk7gJSLaIUcmrA56w/LSVYj+H3qY7KdcXmlCyL3u1OV5RdZh70TZxB1bC0MiudpxfgtIhTwIWmPTzYLCmmFY7E4+bRWI4UiL/8zMykF5Xl9KF+wn9CyXejnB4d5+2ntGc+42agoNALdCXc064Rkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZRCk2Ip1aIO8f+jfN/uHcsoL/NvRduZ1RSZERIqOEZk=;
 b=r4Rl5rJgpOmcwI5XLoeay8QpRS8vEN1gIO50Hud1fzhglvV6AE/H9o/WDw+/3H+vWl8d7zugdE86lUJcOKUrpQq0pEIsMqJ2HMav+KviuO0Oxcjzfv4g6ITqYd87LZ5zDIe3n2k1HP25MgE7usTmDB+FLGgaF3FJ1adw7xWu3EWc0eQjnABRmj8dcIz6frE/4RsrxahOAdQgFM7G7Y981YXLwp4As8uSCFLVSXdEROxPVwiPJlPsuJco6MRc7VAirPN7DrF+zHmKw1Y5qKryI2/Wn4EvujGHC8battaOwqPwR0K7vZfE5TDTy9uDSZosgwyujltpe7iKAF0uQPtk8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB7973.eurprd04.prod.outlook.com (2603:10a6:20b:28b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.21; Tue, 24 Dec
 2024 12:34:20 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8272.013; Tue, 24 Dec 2024
 12:34:20 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 24 Dec 2024 20:33:38 +0800
Subject: [PATCH v2 3/3] arm64: dts: freescale: imx93-9x9-qsb: enable
 fsl,ext-reset-output for wdog3
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-imx93-wdog-v2-3-622709cb63f6@nxp.com>
References: <20241224-imx93-wdog-v2-0-622709cb63f6@nxp.com>
In-Reply-To: <20241224-imx93-wdog-v2-0-622709cb63f6@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735043627; l=994;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=S2elL4+GDkr5kj/7+KsDHhiSR9ULnH1VIrYMPxU7P+g=;
 b=8yVOJk+zHi9xm5fD+IcPzLn6+j3mMbZD9jmm1RP49FSVSdhGBci/YIjPO9KnYVH4WKard9LN/
 OPyNa0SqlzfDpc5OkmG33XGzgd6FRWs09qNNc4Ry4UGkw6n3j5zg/oV
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: JH0PR01CA0093.apcprd01.prod.exchangelabs.com
 (2603:1096:990:58::6) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB7973:EE_
X-MS-Office365-Filtering-Correlation-Id: 52b1a653-104f-46db-9929-08dd241749d9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OHZERVBxRE5wNm5qbklkNU5iQ3lZQkltSEJqZWdkdFJ4MC9ZWXNIR0lTdlJ5?=
 =?utf-8?B?dVFaQnN6V3R2OFJsTUgxdDZLSHpNQjRGcnRzK3BzV0hiNXpJTTdiZHlwWWll?=
 =?utf-8?B?RnB2VGZUWnJHdHBJM2ltWnJHQXlJUVVHdkRkNEpzZWo5YkFJR2phNGx3T2FV?=
 =?utf-8?B?UGgxNnRBbzdMZ0N2WDAvSUJJSExWVWdGTU9XQ0FaYnNqY2d2VThiM2RpYUhj?=
 =?utf-8?B?a2RscGlobytqd1JjRGd4SnBPWSs3QmpQdndrQ3pkV09OK0wvc2lqQ2dpbWF4?=
 =?utf-8?B?MmRZTFd3YTJRcy8xREw1ZzN6UUFvanlaR2NXcjZ0MXppWGNKUlFmeFFKSFlo?=
 =?utf-8?B?UXRKYkVuWWRpMlgrc2l4bWNFdDVuWmxXNEUzZzlSRm1QQXlUUVZNUVowUDkw?=
 =?utf-8?B?dVhGa2N6TVB3M3MzVktvUFYwRmtZTmg3NWdJUWR5VEpEUkJIZ2N5TVlYYkhQ?=
 =?utf-8?B?TEdQZXM5d054Yk9QakdLRmhRZkpIRW0wdmlBNjMyV2dpdDBMNnpJdTVwTkx1?=
 =?utf-8?B?T1Q0RmcxZ1UzM1BnaFdrTGJUaWdubW82ZjRFc2Q0a2c1ak0vVDdwdkhCNVdP?=
 =?utf-8?B?VHNPLzVsUU5uOXMzR0NzMkxGYjFLeS9ZS3JCU2x2MVlnbEJIVmdabkVoMzZB?=
 =?utf-8?B?d0R1VS9xTVJlT1JlRGFYNUZNQXBGYVJ0aUhKd0pIMHZucWNrbm51c1dVaFk4?=
 =?utf-8?B?RlRWVzhZR3J0bFlrdXQ1dHREbk05YlZDZk9aU0t1bUVqNWV3bU9oYkVsT2h4?=
 =?utf-8?B?N2VyVTNUd0FpRHUxSzd5QnVSSXBPak5nNmRJNklaT2ljSXRyd3pMWENkMm93?=
 =?utf-8?B?WTBVUDY3ejVpN1hHZnhiODB4R2NjSWUzWHZhendKVGM2Q0pyeGF0bitsRWlJ?=
 =?utf-8?B?aTdia3BzWFE5R0llOHluWDh3cWxqVG5WMkhOS1FrK2RLaCtrR3RaK29SRUtG?=
 =?utf-8?B?Q3l4c3lySHBzUTlzZmt3d2lsMWZoL0IrK25ucVpuNUVnZnNzUFpEZTlMbzla?=
 =?utf-8?B?STBSZnhYNXN3SVpJSktCUmxKMUlzNDFaVkgyalIzQlBBenlXOENzbmdXMnQ1?=
 =?utf-8?B?UlJ6cUtzK294MEk0Y0txdEYveXNuaXg1SWlsTTZIZVE4Q3JmVDF1UzNhUU9y?=
 =?utf-8?B?aGJMMGhURjI5d3d1ay9rNytnZE5jelMwcW1rM25kdEdOcjJMalU1TlVJRThh?=
 =?utf-8?B?b2M1U1h5Q05TVzdzMFBmM2VPb2dRcmlMdFVZc0pwN0d4STVmQ3hZZ2JVM3Vw?=
 =?utf-8?B?OVlXd2s4R2FES2k3NEdhbTllLzZpKzkzQVRyK09oT1pMaGk3K25hWmorY25R?=
 =?utf-8?B?ZUxlUXE4WGlCYW1yVzFXVFAxUlpuRUlCVFZsM2VPcVpBOGZaTDRUdHVjOVVj?=
 =?utf-8?B?YnJnSDl2TmRjWWZkOVJCTWJYTFl5QnlLSlVNeWtIVUNSME5YYlVMVHc4bXIz?=
 =?utf-8?B?eVBPK1M0Q3BzOUNvV0dMcjh5bHpIK1k3MW1PaE12UmQ2QjZWczg0S0pSRjRj?=
 =?utf-8?B?enpGKy9rVlpRMXJvZ0I1NWFoOE5mS1h5L2VscWJUTzlWUDR2YnplWUxZZndq?=
 =?utf-8?B?N2hQMlR2WTFrRzhMN2dlNGduT2lmRDNKZnFic25YREZNbmZ5U3ExRzhFZVFO?=
 =?utf-8?B?ekpIS3MvS0NaS1JHMW1hckRvUTgzdzlEV3JESzRMNVRyK3VKM3Q5VDRXc1Z4?=
 =?utf-8?B?NnBzQlYzbjJwUGhBdDNFZEF5Yk95YVRUcWF6SUpXcGFzRDdGNlYwRkNyL21Q?=
 =?utf-8?B?dEdIOFpOUWcwUnUyVXoxdFN5Y0J3VDNlRVlMSE5BMUxUMmxDT3FBYjk1d3hS?=
 =?utf-8?B?YmJXQTFvK3pJOXpUN1kxQTBmcVlHNmk5SFV0czcvSms3T2cxYkVERFB5VFZx?=
 =?utf-8?B?V2VUOUNJMXNCeS9BaDFPbkkvRVljd2xaM3JDSWkybk5Dc3IzbXhYaGFoSnla?=
 =?utf-8?Q?c/oiRslQGG/GLFsc8UYi734W410Dftph?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFNjYUV2TzJiUEN3dHlzUXJOWEQrVCtmVzdaSzBZanJSR1FDRkxmMzdsV2U0?=
 =?utf-8?B?M01Lb1lBUXVadzJpQnhWYlB1Q01EZVBUNkRvUUZoTGFZTjBuVDBTcjVsQkVG?=
 =?utf-8?B?dWNOZHN3TTlmeUhia0hxblIxYVVSQ1lTaDk5MmpQSVZZSlJ4MVVqWFRUTDVL?=
 =?utf-8?B?Z1dwL0FLcnRZMjBaTmlBZXZHanVaY2o2dmFGOFcyZGdTKzh6QUpXRGZoN044?=
 =?utf-8?B?R0J1N01paGwvUWgydnoyeVd2NWhxNEZIeGd4Qk04T0hFdTJPOWxraHFnVC9v?=
 =?utf-8?B?Q21Ya2Fyb1VwZnNpc3dwZmZad3NQd3JmZHFFTU1FcDRQWWREZjJVZVBBRHhB?=
 =?utf-8?B?ZE5wUURpZUVrcFgzQmJrNlV2YjdlK3YrYWhpTGF2N3hndWdjNlNxUmxFZDll?=
 =?utf-8?B?WHlKVGE1cldXVFdXQUZiYmYyZXV5R0RFUmxUTmZieTQ0N3JqdFdqMlFHUGNO?=
 =?utf-8?B?THgzTDM2ZUpwOVI3OEhnT1E5RE9JMnUzZTJmdWxoZUFVeEFoZ2ExZXlTR1dm?=
 =?utf-8?B?VVB0dWNRYzFrYXZpWWQ0N1FtOW9QRTBqZEVydXdMT0czV2RQZEloTFN4UmYv?=
 =?utf-8?B?b2dmbDZ5MjhrNFNZTmZqQVZHc2ZHdnVGMzBJdW8ycXI3aGJoTkhjdFhMWVNF?=
 =?utf-8?B?TEtCc1FCbzErN21LRmNUTTNPS0orWTJPTUtCNXZ1ekJhaFRSWm00MGJuSEYz?=
 =?utf-8?B?czM3OEdBdkFQZTFEbmRsU3dYK1hDckxOM0VtSGhNNWtOeXRHc0VFR1oweUJT?=
 =?utf-8?B?QkxyYlJXZlBUOWFWTzNDTHBHWm9qQmZCZ1g2K1pqWXRkRjR3dTJxVURUYWlk?=
 =?utf-8?B?QlNYRjJSeFdaMkRqZG9nTXZMZmlOSjdtcWVGdVlheUlRV2dDdlBrOTUzL2FR?=
 =?utf-8?B?dEpjZTBkWnZUUE92UlFOaXRTY1R6S3d3RWM1N1FiRE11M2hyWU5DWnBwQXRS?=
 =?utf-8?B?Z0wvVGNiaXQzaGgzSUxKOHBobyt6b0ROS294M0t5Ni9FYnVOeGxiSG15TkUz?=
 =?utf-8?B?SStCUlVHTEJEUCszcEpPTGhJZ2hERnRJdTR6TWg2Q1JMa2M5QUpMUDJQMjV1?=
 =?utf-8?B?UDlTdUJ3QVROREE5OCtaU3hPeUw5cGxxVGN3OTIybnU0K2FDOHhqblk0bWl3?=
 =?utf-8?B?OG4wQ3NvY3NDNHhpWWpzM2tMczJuVUZRRUlpd0pqNWRkSjBMY1lTS1VsOW1C?=
 =?utf-8?B?bHpBSXBFa3kxQ3AyMTl2TmdVbTcxNzhCbG10S1BBU1VYWHhaZlVHelZSZFVB?=
 =?utf-8?B?c1V5b3VNSE9HYXJybkVvY2xBMnZCU1QwbEVGMHVISllCbXNUZXBpaElRc0h3?=
 =?utf-8?B?UjlDT0RjQzNpY1VGaUtSMkdYeHRsOTF4ajVDK0ZYcGoraDVqL2poaHdHUzhP?=
 =?utf-8?B?ZVdheVh0WDBobSt6TnJwRmdrSGorWWlvK0l5d1YxU2U5U1cvVXQ0NnR0d3NX?=
 =?utf-8?B?ZGdBM0NQeFNlMkdicEJzSE92RGp5a1lpUEhHaGRmVHRVa2RPRzJGZ09MUUI3?=
 =?utf-8?B?QVNIa0xKRUd0bTdybHlYNWJHS2h4eEJ6ZUNSRTF0WmFlWVl2M3NiQWdwRnVO?=
 =?utf-8?B?THpmZ21iaUtia0lNNGNMS0FsZG4vc2s5SklzM25GZ2lVVDFKR29FVVlLOG1p?=
 =?utf-8?B?MS9jWTBoMTcrdE9GUkZsK1NNay9uZ0kxeG9OWTVtR0lnUGYrWk44d3FRVzIz?=
 =?utf-8?B?MmJwZjhvbjA5T0pVVFIyMzB6WHBrS1hpN3JGcXYxMzk3aHl3YlpGV3RwNitD?=
 =?utf-8?B?QWFsVFY5MmFiN29KUVQ2ZFVEWGdIRDVXcUI5a1lvNStHZlVHSVdvREZqZW9z?=
 =?utf-8?B?VktobEl5UlgzVVlGSk5RSFdHWmJMNWsvSTh5MGppZkJ1UGk0cjIwN3ExREN4?=
 =?utf-8?B?RjJ0SU5iRTBhZm11SEZyRHBYOEhtcE9OWTZ0K1V6eDZZc3VtMFBXOFA4SDls?=
 =?utf-8?B?U1l0VjZKVGZlYitPc2VoUUpGZGhFNElUL3lucFEwMThVM0pFTHEzQVlkY1FR?=
 =?utf-8?B?eHM4ZUFVdGF4dU9ZcTVzWUNwbW50eFpOWEYxKzN4NTJ0djVmbjJDQW93QmVz?=
 =?utf-8?B?UjU4R0o2SzV0WFRRRXRIVDdNSnplYXdYa1I5emZrelZ6SUk1MU82MmlZM0s0?=
 =?utf-8?Q?mQTAHHoS/v8gXs7hVEg66JrhD?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52b1a653-104f-46db-9929-08dd241749d9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2024 12:34:19.9225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /jbMpL80jVYbAeVJC11m+CccFEJBEcKtaKDT53zQWG0Mf/CScMDgNi11jo9Gj4YMDmMbR0EfV1mKi3CHdkW40g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7973

From: Peng Fan <peng.fan@nxp.com>

The WDOG_B is connected to external PMIC, so set "fsl,ext-reset-output"
to enable triggering PMIC reset.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
index 36f2995acbe297b3eec4059d0b06461e3985db67..75e67115d52f95dc2a04b30c95a9db0d4ebb12b3 100644
--- a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
@@ -459,6 +459,9 @@ &usdhc2 {
 };
 
 &wdog3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wdog>;
+	fsl,ext-reset-output;
 	status = "okay";
 };
 
@@ -646,4 +649,10 @@ MX93_PAD_SD2_DATA3__USDHC2_DATA3	0x400013fe
 			MX93_PAD_SD2_VSELECT__USDHC2_VSELECT	0x51e
 		>;
 	};
+
+	pinctrl_wdog: wdoggrp {
+		fsl,pins = <
+			MX93_PAD_WDOG_ANY__WDOG1_WDOG_ANY	0x31e
+		>;
+	};
 };

-- 
2.37.1

