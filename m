Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011025.outbound.protection.outlook.com [40.107.130.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E14B478E5F
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 08:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768985838; cv=fail; b=eNe+KQpedBz+ImaO2hWUPoj8D7fqNpm0DBFNTHxzzBSEyHgEPNchJfjwMh250WTGLujbssFxUzrn61Upm2AzL9TYGYChME4Y55OpbuYn9vkbPYoFxqhoBwxDjo+79dpNyuYfyqJriPP0kW5OSR0OLFiqzDtHh6fZMmyLP2bgIK4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768985838; c=relaxed/simple;
	bh=tOtSXomq2KH+8clEacb9RWYs1iYcwyaRAGNdBtHVSY4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=t0pEFyUKq2jCOembMH5SQSymQidaCFuhENkBnksy0hnENbT74rl/ZdfzG4FViwvCcKvgNjG8ys87CUDXTNK6QvrrhOMuMVnU/rD9Hyrcl8CRLJEenQBZyWnsB1czLO8QDX3pabAQMuL7Xzcxzp9Sl2mvp2J3K8/qrZJ3UlkqK2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=G1Fot3/t; arc=fail smtp.client-ip=40.107.130.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="G1Fot3/t"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MbvqQ2FWFRaxOCFZvoh4noaAs1KMVdrzhizgUagXG4JEo2iRrtVCIptyvdZUF0b83vO4j9Xb/M/3dXT9lqxY5Al+YdZ2K/ON7aY2PgX7DVm/pt0cSferZzm7K+NISVzh3f36jrfbi6WljMAv9XH5W53gqWqND5JgZpiphVAmRFJmiOUSRHkCAUw8a9DaUJd7B+UpgD1R8LsQxgRwKu1qo2UIdeqCP/TPoN86tVk02BFeAvi6BAGQazPFlPCO57IKBZcJ/dCiDmj2LiCXrWwZqjYxQhC8h8BVDa2BOmUUIaFjGhN92Qt8plM6qOtH1euh1qBSTfdVvttudpnAsiZZpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9LQ6U97DJmOvAnP/Hm3/sLsl0YOZft52i2nAtpwopw=;
 b=oPxBxjFtwpjyC6PPvZcmdbeVfvx085NPTwVUsblDUuTPN2x+F8L4qMsG40SwpFrZjYy0D/DLG+0lB8GpWnyHCBklUMdFQc6MoSOinfu/wpg9nvq/u7iGLO1X+JRciYe7a4q49nSosYSi2gcl0ZHXDHhv8O2B/CkiG7mp2mzFzlXWFAHozusrLwjdhxpPl9i2HsOoIgfyoA0+pl8T093g8ScQRBhIiVzvNyiSwjXcGZzIdZm/eQrmFwDBGmkCWA8h83bvahoD4QsIuaRDPbHOTyske87Kpg7ksCyb8Wj8lXcoZogEwKrBiiCCEUG9aeylccrttNB1qHXZ7Vj8pN2/YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9LQ6U97DJmOvAnP/Hm3/sLsl0YOZft52i2nAtpwopw=;
 b=G1Fot3/tIBj+jcd8Cvcrz3uOnH688OU+peP6hwDf6Y6TXIOKvJ+fMM+oC1efFW7TAMn4ULhvOeg6yHUVo9QaTjfdrHpuyteVD6shZJRy1aAc9upUTd8Rup5xituQ9YVXWfV9zcUCdjn/MqjHUvtjSyXWcGmpAsvuK33049kXteWNpbePhpWDLuQ4bwwnGsb/oVZxPs5ZmJ75Y5SZuB6yGD9+E+BNiPbPwXdShEvDNBQqjV7quHAcTZuzRhXEtnoIrYhEE5R5j8vOHkUSGTH3aHXml65wxBtj86fAu16YBAg4zF7xxTl18oy3jVpD1rBxawGWR4MGZi/DZCggg23uHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by AM9PR04MB7492.eurprd04.prod.outlook.com (2603:10a6:20b:282::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Wed, 21 Jan
 2026 08:57:15 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::54cd:4aab:dc5c:6da1]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::54cd:4aab:dc5c:6da1%6]) with mapi id 15.20.9520.003; Wed, 21 Jan 2026
 08:57:15 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Wed, 21 Jan 2026 14:25:33 +0530
Subject: [PATCH v24 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-imx-se-if-v24-2-c5222df51cc2@nxp.com>
References: <20260121-imx-se-if-v24-0-c5222df51cc2@nxp.com>
In-Reply-To: <20260121-imx-se-if-v24-0-c5222df51cc2@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768985744; l=3201;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=tOtSXomq2KH+8clEacb9RWYs1iYcwyaRAGNdBtHVSY4=;
 b=3c67qFzru5C3NhHrKQyESIxM+mDlHhWPu1j5x3C4eggDQDv0CUXbIC9wDbh5L8xQUJ2JS/stp
 hTF3ZtmBvroDo1M4/H6AW3O7eQwfdmhaQnWYRS15xHcqXD3zBT6F2op
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|AM9PR04MB7492:EE_
X-MS-Office365-Filtering-Correlation-Id: f0a05717-1d1d-4f87-d49f-08de58cb12a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QTYzN2VWKzhNRTc4KzY5bUs1ai9OQllpa1pLQWZrWllvN1lVVWdubFl2eWVM?=
 =?utf-8?B?dHpuNlg5KzcyTk90elNHNVRNSEFycDBzSktya1hRM0VpM0RwT2FPQzM3VnJK?=
 =?utf-8?B?Q21VNS8vN2h0TUFIZ2pXQWJueVhyMjBIODlQaWczc0dTRW82dDNIQnlWOEkx?=
 =?utf-8?B?cGlKQW1MQkVCSFRoZFZpS3ZkT0JSUURoV25NWFFqZ0ZOSW9FWXNHb2FEdFJE?=
 =?utf-8?B?UkJiYVJ4L0xrTTdOQ1NscG5HYVpBbURuQkVONU5Ea1F4Yjd1MkdHb2lsd0RR?=
 =?utf-8?B?ZG1wRVFaNitpaGlETTBpT0JUNXYyR3dhSE0xNmFBa3UwdDdsbGd1Q2FOMUFw?=
 =?utf-8?B?T2hCTUgwSGk0aCtQMVI0czloczlQRzdrdk1iL0I5Slk0a3RZa3U0QkY0Nldj?=
 =?utf-8?B?MkVWWGFCNHA5MWYwdVdoOGF4WSsvRW9jbUtxaHVaYkN5M3MzTGRhbFVWOEFp?=
 =?utf-8?B?a1RUbkFlMjNjUWNTWHJ5Nm5tMnlYM3FwSGN5TysxZkhwdHJHL1p5YXkxWFFu?=
 =?utf-8?B?cDgyYXBqbE9aRFNrejNaOFhNc1pGSEtCZTZlRU03dGRSWDdLajBUc3FrM3R0?=
 =?utf-8?B?Q2ZYdnZmSG9mZTdwaWFwWDM3bGNBSUoxUllCaVFqdXI5SXVZZWFaNTg5NGRa?=
 =?utf-8?B?RXlwYk11TzJsSmtOOWU3KzVIWG5wSGU3aHNoWG1nUTcvWDVPcjBLR05lSkFW?=
 =?utf-8?B?WkNXQ202NWVOR3NhRzZmZVRDZWVsSEdVR3M5U2pqVzJxNkg3MG1aNHo5U2cr?=
 =?utf-8?B?MWw0aldqZlUyRDJYTDhSOXZtNzJSazFacm9oYnJhOWVFbElpb3BlOEl1d2pJ?=
 =?utf-8?B?U1RyTGVvbHh3cGsyM3FMT3c5NUtRT3FmcFNtQXdmdVBseHpyczZNUjNrUkkz?=
 =?utf-8?B?QlEwejlsTnBWZ2JTMm9qYVdYY216bHFOaVVPeEl0a3JIVFpzSEo1Mm4wQmM4?=
 =?utf-8?B?MzM5OFR5cGhWd3FyUWFtbzNQdTQyYk1oT1JIQ3J6OVl1dXpHK25NU0xGdTY1?=
 =?utf-8?B?UW5EdlBqTDcwT2hFeUhybFRCZ1pJckVZUmxWVUF2Z3ZyNWpmQXRXTlNnZXJn?=
 =?utf-8?B?MnRUY0p4NWs2ZWFoYWREUittb2pWSEpLejhFMmY1czVxY01WK2F5YVRodjN2?=
 =?utf-8?B?NGxYdmh5ZCtVbENiazRGV1FBNnRsQVhIdjNwZ0FERDluMTBkL282RngrRFBP?=
 =?utf-8?B?V0NHekpWNXJXNitRcC9jblI1YVJvS0I3TXNiSWZXYnBKY1VNK1VzYkgyYnBi?=
 =?utf-8?B?ZkppYU5FUTJXZ1pLd2R3YmlQRk13bnNxT3JZcnFBK3NQZjZVMUcwSUVzRWw1?=
 =?utf-8?B?RDdYTzNtaHVkQ3NWUVlGS2QzSmJXQkxFdERCVTdMY21GaVR3K2s5TnZEY3JL?=
 =?utf-8?B?RHYwZVJXNnB0SWZrNGNQOGp4ajJnaXZac0plL3pMN1V5SWkwOUpFU1dpUVNQ?=
 =?utf-8?B?ZU1oQmpFUE5DdlZwRHZjc3VkN3hIQVJ5cEhuMVpBMTkzcVJmQXlTbjlIRjdr?=
 =?utf-8?B?L015MVk5eG9wTGRwT1U5YllrUlZVUUlRd3lUNlBQVTJDdDFoYU5aQnhrRlVu?=
 =?utf-8?B?QzZqS0lpcEZCS2c5dlg3SWxJRmFUWEQ0azZTSjIyV3krbERGNlpZYmJCK0Ro?=
 =?utf-8?B?OTM5U1V1YWlVR0hWdXVLSDYybG4raHpKM1BOcGhuM2RaVG1uUEdIMGszenNm?=
 =?utf-8?B?aDZIUzJ2czU4dUMwME1URk5FRXV5VGZRaHJOemJIcnZIR3FRYmF3TmYzZjVq?=
 =?utf-8?B?QzJtekVxcW41VFBuQVNuTTRjVWhhVE9CMCtlTWwyRVB2RDRxL0YyZDdxc2Ir?=
 =?utf-8?B?N01KejcvMDdkWk01V28zZWcyVSttTXdsdVFHUUVLMjZSY0NOQTRnWndkSmM2?=
 =?utf-8?B?WmNOTXQ5blNzeDRVcytKQVkxME9HWGZjSDlUem1wK0M1ZXFZcGprTWVyRmlU?=
 =?utf-8?B?bC8rOUswVi9qTjAyWU9OL2F4QllpT0VNb3c2RzIyTzJRTVpGR2dSWTBYMEwx?=
 =?utf-8?B?WUVDdHdTc2pqbUhha2xjSUZ1S3llMS9wVk1LWDZsbGYzNzVQc2ZsV01ldHFp?=
 =?utf-8?B?UGt1YXBuY1lYZUVjMjVJeC83QVFFa20xRVZDL1ZJdVEzVG1ud1g3USsxdVpW?=
 =?utf-8?Q?8wzvTJIV/08+yDSrBQ/3ALVSl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHcxbGI2SXZQdVJZenlqNXprNGc0alRXNDdaNnlBY09ES2tFQ3pza3Uva1o3?=
 =?utf-8?B?akRwUkJRaXc4VklNM0pRK3dTTk5pMnAvNFdKSk5VOWlqZGZjc0R3YnUwUEFj?=
 =?utf-8?B?VzN6TmlITWZVVWpucG92RDB3RU5LQ0p2cVFsbTRuQ08zancvU0ZGUCt6cFB1?=
 =?utf-8?B?ZnRscFltNlE3UTEySTFtenNkZFlOOWVjSW1zeTE3SlhyWEE1R1dBQ1dJeElz?=
 =?utf-8?B?WVJzcXVDZXBVY1BWWWxhenRDUm90c25DSlFGVUZ2TFhkOVdUbml3WGU2dUsv?=
 =?utf-8?B?K01ROXRMS0RxMkt0TzE4VDlDR3diazRYOUpIVG90M1NxYnMvNklLb0dTUkJI?=
 =?utf-8?B?U3dWTi8zOTNiYy9oeDQ1WmRBK3JjK1pTQUxYUG9lSTcrZEpVMUtEMUhWVlJw?=
 =?utf-8?B?U0MwcVpPeiswVGdDVWRoSUg4VlY3ekxHZis4a2t3dXkxZE5JMGdiNm81NmRW?=
 =?utf-8?B?UnRkK0hsSDF1TjViYmYyY29YckZLa1J3Nmc5Z1U5Mm9PNHhFa3I4MmhDam5I?=
 =?utf-8?B?bkVGZkZyaWxnRHo0WXF6Sy9uMHZYYnFyZFRVaFFlL0ZEeFhxb1FCU2xNc0Fr?=
 =?utf-8?B?d21mT0w2ZXlNaTJGZnQzNk1zaFBqQndZMVJoWkdOcEZ5TDNtWldvRGF5ekwy?=
 =?utf-8?B?eDFZMWVHRWh2dEpITm9KNm5GQ2xUbEcxRHhxUk1id2ZRUUNjMXNxM09CbWM2?=
 =?utf-8?B?NDZwQ1h4NnowdXc1eHBTQ1BTOFYxQzJZL1B2SXorVlBlcWxaclQ4Sm0yWmVF?=
 =?utf-8?B?UDRFRHRUT1RpMnpSU2RzMDNpQWRCa2FlSlAvaFVvZkYrbmw2UlA3c2VBcDJF?=
 =?utf-8?B?TWdhZEJ1R3RaSDUvTUtITDBIQ1pleWxoQzZjT0xzRUE0VW5XVVJudG5RckRB?=
 =?utf-8?B?YmRrRVVJTnMrMEdzZEFvdGFvRmcva1RYTVczL1c3VHNxOGliakxYeVZudVpi?=
 =?utf-8?B?dThCcytBSlFlTDV0NmI2RVJqVzdsYU5ZVzJBbmpmdnBZSFNvU255R1EwYWE2?=
 =?utf-8?B?TGNPM1RBSEd0KzV1dFhRWGp1RWVaeDV1Tmg1Sm9ZWS9BblFBY0lrVmxZeEpL?=
 =?utf-8?B?clVTb1RPeXRvYWRVRXBTa3czT3JDaWJmNGxORTdGTlJiTm01QkI0MTFCR0xH?=
 =?utf-8?B?Y2VtV1dsSDZCY2dqaDJxNWNqNm5KZGZZTXRQRTMwR21zRXVCZm9RamVDU3JT?=
 =?utf-8?B?V2lZUFI2U08zb2hmK1U2U3RHMU4wWFNPWElqc3VtWFVJWFBLOW85VnZyUVpj?=
 =?utf-8?B?MDEwbjV1Y28vTnp2YlFHRkVVbTRzTEkvdU9CWXF3VzdwQURNUFVOTWhlckpX?=
 =?utf-8?B?a1B2QkxERnBOQXpsTUFGZjFLRnVxd1Jrb0E1OFNsQ3JraVNIN1hSZVQ4dzNx?=
 =?utf-8?B?RmY2ZHhObS9ZdjdLVkw3NFg0Q25pak9WdDJNaW80ZmpDMGlNU043UlhkemxZ?=
 =?utf-8?B?YWNEcDFPMnhvcWwzSURtK0V4VlF0WGRXUC83NXZpYXBjblA4SHhGK1FsUFRZ?=
 =?utf-8?B?SnpFZnZXREJZYytzRmtLQktQaEhZQjdmR0RscjF3Z2FIZkl6RDN5Qmh3SDJi?=
 =?utf-8?B?Z3k4QThKTjN0WUUrdTUzbnFOMWNCMU0vdmUzdEl3VjdIWGFuc0dFMjV0aklL?=
 =?utf-8?B?NGtKREhKUUdXQ3hqNFR2eDJxOUVrdjh4U3hDckdzLy84WE9RanJzM3BoWTVp?=
 =?utf-8?B?bmJ2L0FoQ3JuQk1reHJhZGF2dkZtVVFUTjVIMXlyU09GUUk5dDJManA3Mklt?=
 =?utf-8?B?SzBwUG94TWVPN1VjeHJIV1I2Mmg1cGEzK0MzZzRCdWlaMXd6dVdPbU4rNDZR?=
 =?utf-8?B?aXdqV21nMkp3c0NtQVJHb3BMdWJZOXN1QVMyK0ZzY0RDZVVldzVDeUM5Q1d0?=
 =?utf-8?B?N3A2TEYrc0EyWGNOdzF2aUdTaDMzU0NtemZycmhSSm1QNWdxcVpXcUhWVFVS?=
 =?utf-8?B?U09YNi9YcHlsd21yRWQ0d1RsOHpwRG5SeWcvS2dRaVpkRnVKZkY4N3dqRnBJ?=
 =?utf-8?B?V21JL2VKRmR4amk5eWdVVW00YnFJOTRGRXNkVFFpMHNwS1NGYUduUEJKMDha?=
 =?utf-8?B?VFlKMFpQaFZwYy9FZU8zSS8zY2xSL0VWMHVhYlhZUmU4Y3NxeDV1c1NyYXZD?=
 =?utf-8?B?V1JVcHEwZThUdGs3R2RoVHRXdW1nZEJYdHFxY2FkOEcyOWxjOUk0cmMrcGY3?=
 =?utf-8?B?OFNSMFpPSFB0eVpXVVh6cTIvdFo5THpUV1hXREpKRE15WFFRTXkvMjgvb0tp?=
 =?utf-8?B?dHBhVzBaZExiT1J6TFY5SzBUQWhyMzZ1akJqZXhDR2cycGJ2dTcxSVRqNDBx?=
 =?utf-8?B?NlZqYUI1NzZUMHVFblA4RHVOR3ZtUUJYVFA3T0lIRVVFdGhuNGVpQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a05717-1d1d-4f87-d49f-08de58cb12a8
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 08:57:15.0730
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p7rGUqGCtNvQi7zw1pxzpfBf6r0jvLLRUFJUUTDYFtUJdVBgU/GmhA8tIF1GBFYi29bG5f/D/GjezSypqU8eQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7492

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

