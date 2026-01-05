Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013017.outbound.protection.outlook.com [40.107.159.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC43E14F9D6
	for <imx@lists.linux.dev>; Mon,  5 Jan 2026 11:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767613770; cv=fail; b=cdAfPfQ+qaWR3ok93o6Ufu/e8+nY2JHpr62obE+7m8GpIIQuxQAO3qGsR2IzXxaDu8pCJSAVWUIEK7t/yhLM5zaDON68cw2VTFW2RZty0Ijzt9WZeXK8uU4HU6L4G3+Zmgj3BM4nRN/R2OhRPbr4onXMCYLRvwgzsLoBKgEoHn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767613770; c=relaxed/simple;
	bh=zUCgiyHrf1xZX38xM0orx350sL2sWtKXeh2xYLuhHxQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=bQvH8vOXQ/AVpie3bPeaIKMB+uPqEgTat7F0l6bMoULZLZ+RKHKdT0nA+4zxh7/aAXLMJilJApz2Z9tzBZyf5vhNUtG+PwoC0DZHx3dgVyevYVWfV5xjyF+tl4sY3xRjvfxPbAXaU53fZ/y+UmUFZEneG8lAZc++0FFLICiCzyU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QTRpbPIO; arc=fail smtp.client-ip=40.107.159.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QTRpbPIO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SskYBmTOMUMj9StyClGXT4VyEHjC5V/jU05/4e5c9aGCuDz6PAdwvIi4J2/LDdOgCEBgpyiywHeIYE9qSW4psbpkypajzuH+c4vcsXn0LRizsDlAocyEU69LQu3t8ehb+pwoKQia0DMo9F6JNYO+IshNzmF4mOBWPub+uprdoEpclJXGXOSdl6iDzhaEz7e5tHpWeLqEeML1iKF8KguNBMaLQ6Ni627KOcbOMo8ZewxBtHxsnT66YQU6q1D3UXWkIBkrfwV/7saXznk/rHHsNcYwPrxiVAzaiMy818B7BvhLV5zsQ/M5KP5lfMXmvjb95PTeHgSnW30XmqJ/cpYdoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAmVrhN4ImHTz04tc2m6Xm73OuDi8VVkRS8ap/ovFyo=;
 b=Y3/xsMOaumqxWfH8Ni9RdMn3HRH4YWiJGvsMGNjXYMpVzZGKzZFqn3k1DdETdMQEDJnTL/8bAXaeRMTznB5Y9I60ATONGwNFxUaL7h7IcYrRzM780A+5fYPPVDylNOwB8TYPu3P0sslO5Hfxba8rxDuSo5T8HMKx3lHTiWFKMmi8euzNKuffvYQs232RDywiFH4xCUtFuOCbX+fH7i0gvSm4eeEyCMWldYYL47PQyQ4HRmvGtDZOeuqvU75lOISbmtQFkBHTdCREekgXtjtAcVKR3xARZTwLerkP0MvFMA0oaxRJER7Wjyz9mj5amVMEli/7tKrA8i3CFBXIvifRHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAmVrhN4ImHTz04tc2m6Xm73OuDi8VVkRS8ap/ovFyo=;
 b=QTRpbPIORPuKYcb1t0rFzCsdVUhEAgAM+BmQl56u1bO0bSZM6hQAEtCW+MSTiClysZPTHYrQ+Hxk1XsXUy4f3arwomjT7/8n/XaoO3hZfWeC4c1RG6ySpUpRasqeoFQlt7BlVhaIWt+/sVWal1SHcCdK+ePNZF9W4BNX6FglSntm4vAP0Ml/8TxkqyKuS0bs20Crk740qUM+nwUK9koi7dxIwJPUDj8/1O6I9+6DC5KWhLE9TJIeRLCpFjQxea1Rp2GssSw9OVgL/tL17VSJyg2ntCoyTnVdW3hL1y2Fa/70Sf/NVI+/FNBEsM3W4fXr5XG4OEdc7fjWxHJZImWvQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI0PR04MB10299.eurprd04.prod.outlook.com (2603:10a6:800:238::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 11:49:25 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 11:49:25 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 05 Jan 2026 19:48:45 +0800
Subject: [PATCH 6/7] arm64: dts: imx952-evk: Enable wdog3
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-imx952-dts-v1-6-68b5a4d69710@nxp.com>
References: <20260105-imx952-dts-v1-0-68b5a4d69710@nxp.com>
In-Reply-To: <20260105-imx952-dts-v1-0-68b5a4d69710@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI0PR04MB10299:EE_
X-MS-Office365-Filtering-Correlation-Id: e44e3c42-da43-450f-14c0-08de4c50794f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|376014|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a3JuUm5jc2Vyd1lwM3FMSG1XRFdZMnVYam90ZVVpQ0hVTTNpa0NhNEJrS3U4?=
 =?utf-8?B?b3lhaGNvWU1WMDhZeVBnVyt1UkF1Y3dHNk0zWDFaUWs2ZFBnVzRNdHVsUGtz?=
 =?utf-8?B?c2hBUU56MDliM1hSeDZoTzc4eURRaXV0TG40S1hpL1RieWhDT0czTi9KM2Fi?=
 =?utf-8?B?NHRwc1RWVmxoaEo2UUlzeEpadzJrK1dVWDVzQWNrcEhyU2RZVjY3WEY4Umwr?=
 =?utf-8?B?VUZSMWFad0JJaitRNXB4R09IT1NQdlRPc1JUV0RNNVBFN1Q3OGdZalRBcTYv?=
 =?utf-8?B?K3VsR0dEaFVQVlBiMkk1bytzbnhNb0gwRHZFVk1lNm55eVJscE9CQ3JPMnpJ?=
 =?utf-8?B?Q3FyT1orZW5kYnA3aS94clBvYXRETXB5dXdlbW8rY1JydW1XR1VBK3ZCcDE0?=
 =?utf-8?B?NDJ1cHFycVV3bWFLWkZkRzV5UHA2c2NuUU9JWFI0eldsQzgxbFR2Z1FUbHZG?=
 =?utf-8?B?MW5MNXplL0ZoSzJNMElHUjErNmhncHQxcGEzQ3ZTcHFLaWhMeXZQWXNxdnlJ?=
 =?utf-8?B?TEMxUVhuUWlLUlBwNDc2SXV5b0NBbFVRRk9pVmNER1Y1STBkTFJkU2pUSlBM?=
 =?utf-8?B?cE9zdmdaM3Y5ZGg3aVdnVEdRYUZHZmVxTFd4U0N3anJsbGhVVC9pN3NQQkVF?=
 =?utf-8?B?SGExVnB4L0NHRHlOUldFZno4bGZmc3FJZzJkc1UvS2VNNzU5V3ZaMXRxcmhr?=
 =?utf-8?B?NXpYRmhqS1NieXk4UmxCRzVkMlhzbW9HZDhqS2VzaEd3QmpnYU9EVnpsY3BP?=
 =?utf-8?B?bnljQkFwRmgrUGRFRklrdzY5V0pZb0NiTlpNaEMycTZwQnNCRVFHV1Q3YUpU?=
 =?utf-8?B?RDBxOWpJcW1YSlpSaVhKUlpvU3FZbzB2ekpqUGVweVNBVTlWMVBrbFRJZ2ZH?=
 =?utf-8?B?cHVTWjh6eXVOMWRCNzFGNW5Ibm8rc0U5MTZ6cWZxZHRJTHJRaTNjSGs2eEhU?=
 =?utf-8?B?Slp5OExGYitWSkZrMXFRYy9OZ3lNdFp2TnFxekR0ZnFScVkwRjJzN0pSS0l0?=
 =?utf-8?B?L0dzMHhWcFcyUG5ZOURmdDRNQnlDNElIem43SXZuV24wU1ZQRlNGZFNEemJt?=
 =?utf-8?B?Wk9RNTl5bG55SFVFanhqcFdJQzFOY1ZpR1lRdHAzaThURG5BZnhVVXl1ZnZY?=
 =?utf-8?B?bkRaWEd1N3RCUXJEZU00KzlXOVJaeWNZRTFKTUJBaHRTSWpVenBoQXBybnhE?=
 =?utf-8?B?WTFnbXlVM3B0cTh3RTRNTk8zMnNiZmNzNWZoUEdRWWcxMmRpM2FoS3VqZEVP?=
 =?utf-8?B?MWxra2ZtdmlRMlF1YWNOQjZjcnhPdWE3U1hnVWwrb1JTQS8xZ3JpaDJWb3FF?=
 =?utf-8?B?MnUzaDAwTGh5TkRKeTBxRUVnQ2ViQmNIY0VJbEVYcFNyNWVtMXRsMnNEQlgz?=
 =?utf-8?B?L3E3a3doZmZyRENEVXJoUGd5OFNQdDJ2RWtTYysxL0V1K1llUU5sSHVLOTZR?=
 =?utf-8?B?MnFNK2laQXhCc3lXcmw1YVpBZDBLOUlhbmFIaVBiZXY3SHFlbXNVK3YrakFH?=
 =?utf-8?B?c1hjaUpURUJJdGJPWmZqNlRYNHlCWEVnSG5scUJvaHZpck9za01LSy9jeFlS?=
 =?utf-8?B?TC9BZU05OVpWTkxTN0xUamJtQzA0elBpRCtUMXBYVWh4bVZYVFFLTG9vUGtJ?=
 =?utf-8?B?U3dTT3dwZ1JoSk1HemliUVhZZzZabVl1WkFVK0pDVkM3OG0yNStIYURYVHNO?=
 =?utf-8?B?WGo4UVpBUytUK3prOWJWRG4wYnMxSGgyT1Y1SVM3allTWG5jbDJqYzYyL1JH?=
 =?utf-8?B?T0pRTXlkY0xyczJ2QnczdFdTc0FLQXh6SkxiTUNvd1lvYVVDeU5IZWpNVlA3?=
 =?utf-8?B?M3pjbTJmUE5VRndLekNlNFNSMWxWaHZvOEh1ajcvWi85MUVBYXBDRDJRbm5z?=
 =?utf-8?B?Uks2VTJRSWkvY0dRV21jbG12a2VBc0pQSk0wUW52YmN1V0dqeXpCczR6c09l?=
 =?utf-8?B?d3pHeHpjd3J1UXhrQlRhRXM4U3l5Nk1QanJjeW15dTNQZE1jaTljTmlSNWxJ?=
 =?utf-8?B?VFY5WlhncW5FTFBLM1BHRnFBWDdvQlZRR0tXNUZmNEZ2c1V4MnR6UWNYYTN3?=
 =?utf-8?Q?X7iALW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(376014)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OFh6OFpjNTF0YzhxbFEyb21SN3dscnZHYmthMkx2cVNLZkRrN3dWcU5vRVpE?=
 =?utf-8?B?bm1sWTVFMFoyNzdPb3M3K3NqQWEvbG1VWXNwNlR1NHZGYWtIVGNLejRmTysr?=
 =?utf-8?B?UGJVYVhRaUozKzl0QUV1dnNqeUR6NURsVEIwR3M0MDJmdmF1MFRFK3k1L3Yx?=
 =?utf-8?B?NHU5V3I3d2hvSGNRR3VVdDlqaFRIUWZ6QnlKQ0VOdmprMndnajVWR1EvZGZD?=
 =?utf-8?B?cGhWbGJjSnF0N0RkeEE0YW5ydFVmblkzUk9Mc2FHMDViSmkyY3RvbWZSSUFn?=
 =?utf-8?B?OFpVdHBKVlhkMytQalUyTjlPakNRNGNUdGxrd1dqSVRWTGphby9waGt1UzlL?=
 =?utf-8?B?WU9TZVVtN0ZtQmNPaUNoQ1lTVXJXRk1hbUJCdzk2YUlzNnFnWGdZKzIwSC8y?=
 =?utf-8?B?WitaMEhkNEZWNFFwZy9SQ1drU3RWWnEzb3ArdXJ2R205cG1Sc3pCc3AxbTQz?=
 =?utf-8?B?LytkRDJ1ZUdOKytXeWZFeEhja1dPOXErUnF3dWE0cXVVQVpwR1g4UVJOS0J0?=
 =?utf-8?B?RmF2ZFVySHpQV1JhQnJHMmtRNGlCUlFWUTVKOGJydUp0OVFweUU1TWpqd2Zn?=
 =?utf-8?B?d2puZ2RWb25BaUJQRTRzZU9OM1lIck5yMFc5MW14b3JxSFE1cnlvZjNybGVy?=
 =?utf-8?B?YW42L1hHbU5XR0ZkNys2U3VkUHNQZHlCSTM3Z1FqSnBlWEpwbzNyY2kySWc5?=
 =?utf-8?B?cnBCbGc4MHV0WlA1UHVOZFZ5ODJlU2Q1ZWYxUlc1cytOenBGK0ZOWWJEVE9y?=
 =?utf-8?B?QkkvTGhuWENZSEpnSG15Y2JaZlQwM1RnS1U1VXVwUXpXV2RaSTdDTUNWYzNp?=
 =?utf-8?B?b1FrWjE0cWhOcHJsRVZKUEFtaFhPMWJlOGk1SkhGZXpLaE40d25hOXl1djMw?=
 =?utf-8?B?ZXB5ZGtTQmh4T2xKS1h1bzJVSjA5TmxKVVV5alZsbDhrdW4ranFhR2FacVcy?=
 =?utf-8?B?TXlPV1ZDc3RZenhGaU9td3JHcWdtV29rWU5odVVlUFhuTmZlaW9KeXN1VHpS?=
 =?utf-8?B?SUd4VVdYWWNmREN4MFM0NWZabkcyekdtZVVOaGNFNGdZZEV3R1J4azY1aVEx?=
 =?utf-8?B?NlJsZ2ZveFZ3eHJzNVFNOHFMU2FFRDZyYVZWWG1QVVFxMXdGRHJYYnNTSmt6?=
 =?utf-8?B?SWxjOWpLRTNnYmx0ZGM0Kzh5U2R0aFJtVWJvNGQ2TU1oNjBvZ0pub1Q1WVAr?=
 =?utf-8?B?VXBJSE8xRFNjWnYxKzhhNVV0NHZMVmU0Mmh1RThJT2FjRisvYjR6V2RIY0tS?=
 =?utf-8?B?NG1JakRjdjRRU0J1SWM5MzRIc1VISmZ5KzBOVVY2WHVvVnN0Vm4yQVNJOVNw?=
 =?utf-8?B?dFVZRUdEN1o2R21wZjRQTmo5dmFwV1lPa3FNbU55QWxibVdmUmhRZ0NudVpK?=
 =?utf-8?B?ZHE3K1ZqV1hBZlNRZUdkOGZ2RWljdnZRZnFrRngzMGgzcGJzSWkwVURCMnNB?=
 =?utf-8?B?WHZzRkpZT0lvNlJiMEIwc3Z4OHhRejFYYzBWVS91V2hRV0ZKQnNjQVRkYzA0?=
 =?utf-8?B?OUl4MGQ4V1FJOVNFRSt6Nnc2MzhWYktSQ3VkNDVVYlo3MTc0YnEwYlE0b2Jq?=
 =?utf-8?B?bmU1OHBHQ0JpZnZxYnpSTG9wRVdhZE5razBWd0ljc010Sms0aWNrelZaR3JL?=
 =?utf-8?B?QUFhc1c2Y2JjbnpDNzI4czFLRXBELzhVZ1dkYVp4Zlp2U0l1eXhOSGhyTURj?=
 =?utf-8?B?dkpUdTU4dTBKL3d5Mm1pTm5LU0R2RkNmdGVtRVVJTk5aQW1JUXZJRGpOTTRX?=
 =?utf-8?B?UmxOSkdtendzV0g4cEVBZkdmbFVremUzR2tkc0tPSVgyRlljU25VMFBQeHNY?=
 =?utf-8?B?d3hrT1ZMbXN3Y2RqZXErRmdSZ3h6eE9sdjNsUzhKQi8vN1k3dnhwMUVtN0hL?=
 =?utf-8?B?NTEvNHZpaFZMSGJFbjNKbG9XME1KK1N6KzlUeXJGSjk3T3FFWm1wWk5mNVRm?=
 =?utf-8?B?TDIvK2lueWZ5NGpkUGJuclRDeTA3bTZmMVYrLzFIU0JKM1gxcmtVOGV4aXd5?=
 =?utf-8?B?Vmlxb1hYcnpuMTJ4Z2FCRS9jM1crUHpxY1ZoUGRtejhEaURlSkh2OHp3R0tO?=
 =?utf-8?B?WGJBbFBrM2VTREozKzFFbGVXTXRpM0Z5b3BreFF0eUtwWDNjUjBNSi9WVStU?=
 =?utf-8?B?QzVtZUxGb3lnV3ZydFBhNHNhVTBIZ3ZUdXVQSXlGdERkcUZ1dG5BampFcEdU?=
 =?utf-8?B?QkYxNTdQeWxQZkZKSUtMRUdDL3B1Z244eGJ5dW04aGNsWllqaTRtai9JWEZ2?=
 =?utf-8?B?UnhlbDlXN3doR1VWcWVOTFZDWjlWMlJKYnMvVlZIS0c0RG03SFl2KytpTnhw?=
 =?utf-8?B?Rld2NlBNeitGcjh1enBFaUY0ZWNNM2l0UFE4c1hONG1jMDRTK3BmQT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e44e3c42-da43-450f-14c0-08de4c50794f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 11:49:25.0813
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 99HjJOGnkU0iWFmhekJiX9xpHC0BfVhptDOwMB54CO7zckK8z/fwHxdMFsmo5jJVf5SjrgEWbfOYSPJ0KqGq8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10299

From: Peng Fan <peng.fan@nxp.com>

Enable wdog3 to allow System manager reset Linux.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952-evk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index d90b8b512f0106253d9c0c58e4fa0e468ed1ea0e..04de63e63faa35eeb8dba57a8adddde471b0b7e1 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -314,6 +314,11 @@ &usdhc2 {
 	status = "okay";
 };
 
+&wdog3 {
+	fsl,ext-reset-output;
+	status = "okay";
+};
+
 &scmi_iomuxc {
 	pinctrl_lpi2c2: lpi2c2grp {
 		fsl,pins = <

-- 
2.37.1

