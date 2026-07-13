Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010008.outbound.protection.outlook.com [52.101.84.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9669625B0AA
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 16:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783959605; cv=fail; b=FRpmE0LnWgVFmvvIwyN965Yit1HF1oKPv+knh6KPAdSG++qWlzhdJSq4uYokZV9I0DJ6i/sHYPb8U/eVtP2t+BHj/bVa7LHCIxtkL9R03Rl7nLp6UfC9GTnaOv2zAt0ONlB3dL2UqUY8LR/joo621QjfPdizrItZEYctYgzw91E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783959605; c=relaxed/simple;
	bh=fPT4OwQrUT3Z8Wua8rdYfrNw2qYsZx8org1zFZmhAdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KWqxQYhwhdZx2JwTgxtDphmG+cr2LplrgYReBxJb49lRLnNOU+nlrq03+VnFfoM/Gfj3wH1c7/hlzUhZBorBCOFFLh1N8MVZaZi7hDrXeLRlh3SAf2Le70/tGuVwA6AFQ/v1n0f2sSbo5FVhwR5i/JS93QRi1vt8ZwaFBLVPGe8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=X+UmvYLp; arc=fail smtp.client-ip=52.101.84.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="X+UmvYLp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WrbbzqHzRiX5qkGrNHKLFiWCNKzr5j3Iw4TVG0hGyT3SXZ5nqTltAzR74NjF7CfXARoWcv9t/6CsgDfiKlLF20axgE9+0d/aqCkHkJPDPoobim1hqt+lH81xPPFp4uyCUIMwO4wDglxbOhnDaADLhLjKzaW9tzjlwbdpoYsZjIfPQ5wE5hMobQv+os3WblqKUrHZJguyx4n4+sCReaWJmy0ZWchL0lkzP9TSDlHYsgvlDqvgbZCK79kk/LC5XJiBQZUdE6gxaJ2Ml6RwOR6gTyumVKh52ss1iT6j2A2tqr3B80vPBLDOMOUyF0qXN/sUdTGnlcXDvB+7fUazedatMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRdFE0+82g+ldhm+xUIEGRq+zU7xoFrkKqbyK7Hz7hE=;
 b=W5KawJm72N8gbx4Gns5W/zQRHw96EscWuaYdw80F9srxC9HbQVeGsnjr2SYAgnZEJmDUT08SGy4eSInmhSOTDxgyFpmy6cNJNDGTnoM/wMOYpxCUsE3LGaFOk3h22nwgE9K9Mx1gBHsjjtNQW6opIK6xOJyC/+tD1Lu8NLMGsS+ClFvaJDXVFGSTQaJLilpJIRzaZ0kx/pMPJv+8EOga08x9kxiXfudN70xAgUpr388UXAOOBqkIlXWCcr4PQQVET7xY7+R5z6GZ0vk/Ty/HCUoYzvj97HqVPSRt7Ne/rNn5Fe37tTNpDfOLVAwOOGDFem0gi1fkH4tM5IpmIMA7lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRdFE0+82g+ldhm+xUIEGRq+zU7xoFrkKqbyK7Hz7hE=;
 b=X+UmvYLpsNXdIPflmQ4IkTljzFHdTWY2M9ls+qrgCsWJn0gHchEag7LpT5b+vYwPyqnCjIaRZAtr8QV4xFdJrtlAzE12V6/JuqeRgIzN/9k0pXH0/SQSwEMRm0jb7Mzwto3qF5GrW3qpV3VwzICvFYWPJLQRwj/CT/5oHaE6Ijsjb3CbnlYFCcnj40aq+e1RQrYRe0Y3Gd7ykOhNqP5LgCR89TUTXfqGZxPOHtEZIkbAWfSAZDriDMc0AnpJOa1NYcikFp+SOcdN+xDaEwtcOM5lGNJ7lLwa/JP3RwdEyPqkJ3VMEQrWBohZ4TGRHphyNbzHaQJOFKRkStW10mJ+ow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB9701.eurprd04.prod.outlook.com (2603:10a6:10:300::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Mon, 13 Jul
 2026 16:20:00 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0181.019; Mon, 13 Jul 2026
 16:20:00 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: imx8mp: add missing #sound-dai-cells to xcvr
Date: Mon, 13 Jul 2026 12:19:53 -0400
Message-ID: <178395959083.446484.9227242187559554573.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707094126.1738410-1-alexander.stein@ew.tq-group.com>
References: <20260707094126.1738410-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0199.namprd04.prod.outlook.com
 (2603:10b6:806:126::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB9701:EE_
X-MS-Office365-Filtering-Correlation-Id: d7838d7e-43bc-4dda-b40f-08dee0fa965a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|366016|7416014|376014|1800799024|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Zya5Gpfy0ftb2+bKjhYNCUeDADzQdH7WV96o8jTZIlQjNU6VqPqsjEdQv3bQV1cHezZ/PTzpteYOWpmgID8t39bUuzylWdKe7rMyvkTGHHb0Rv6nt6Y+k59KTSUzkRFNxXbfZz7Tnxb2qGqW1pxEIY9DoeJXiolhnpjyGjb7wYfyAEcUXS6oEaxZ0MfwPVVAMreLyXCoby9rV0OLli9Un+H9k0EKauM4UGOWtYh2Rf1ELXYzsoejH8p7EinJVHYY5mToCp0FF93j9/ueyPCUB5eZBxGN/bbBXp4ZV6LjWEdnUbmPxk5W4ilA4l3dP+ISTbzf7Q9QGhIwsDZcmqpMQAFgkxt1Um6KAZe/ko/mqvOqCcqFiZ8itTUWJ1y+HziUIxx+LYhJK9FceWHINy0LejYifqHC2kREhLSs8TmAAMSnlUd3oO2U77STLRs6IahHVGpTD/Gj8FSUHSf7mi0HOxFGxQ3IvbxlDW0jSama0KWM+ZikIwRN7XKIX50BdVuJo7Y3HZnKqv3Q7x3OTTYHYE0O/NgQ3BPhfPiVM0MAebTAtNqZI7cum4LQSogFpiw1RCzDpRXzoODkqBQF6uEdkStytTGhYCs9iL8GsHHGqW/WPPcDoomXLh/EvZB69p8QMBAK9brm1pHkkmQ3Iz3Z9X8tzFcpcLFy0vl1Lg6HYrM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(366016)(7416014)(376014)(1800799024)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzJRSGZaSGFtVTdRRGdyWVF2SmpPMlVVQ1RvOUxKK0FmVTVMZGZwL2Z0bWov?=
 =?utf-8?B?Ly8zSDBkeDlLM2E3cUdXVExiNlh2c2c5eDNOMEJseFZaUmRVdE5BeDNEa1dw?=
 =?utf-8?B?SVA2WXZ4WU8rOGNQMy81K2RPOTJKTTd4b2RMRjcwa2piUElVd0VqMkV3ZURI?=
 =?utf-8?B?L0dwRFBlUlVRK011cklxRmRBNzRvZzNpU01nNU01TU5kL3lqZmNPZ2NYcTRQ?=
 =?utf-8?B?OG1ZZFd0MVkwMzRNaWYwY041Q1A1cThaVmdSeFBHQlh0N1k4T25xbm51NVkx?=
 =?utf-8?B?bWZwdzY3LzRlaFh6R1VUNXdBNkh2SHRnMFNiNDZ1bkJTMklZS1E5aWFLVDhq?=
 =?utf-8?B?TkNnalVjQnFyMjJHeXVmaktOR0JwUFpUc1o5eE5aQXZOOTdockd1bzBndThQ?=
 =?utf-8?B?U0N1d1czNlh2N2N4bUdvWkJnK051TytYYXljNWhTTWxQMHk1WkhaZ1RwSURw?=
 =?utf-8?B?Zi9oaS8ySWtZNUhZUXNDTktwOTdLczdyWDVpclNYeENhcTk0S2c4d0lHb2lC?=
 =?utf-8?B?SFpGaEJ5NHBBU25aZnhFUjgwamRTNUlJUmNiWnppVVNmMkNSYjVFUS9FTVRq?=
 =?utf-8?B?bnFIdWZhZGxGZWIrN1RNcDdtRDVhVE5ncGRYdkU3N1h4d3VDb3lCV0R2ZEt6?=
 =?utf-8?B?SS95NFEraFp1QTNiUlFXK1AyN0VPSWRCTVVjcW4ydjAwVVl5ZUVxeWdmR0ZQ?=
 =?utf-8?B?UkswVVl6NzRjb3c3Y0ljNkNmYnJDMEV1R2NPUkg1NmxiamNEelY3ZU5YRTlp?=
 =?utf-8?B?QmtWTDA4OW9FbG5RaEtHOWp2OFM0aHUrakZUQUJpUjNJbDBwL1p0Mmxya1lk?=
 =?utf-8?B?S1dHUnBmMnFHYmRKTkwxaVdPRTBQMDRsRllFWk5RcjJwd0xad2czWkF2M1BF?=
 =?utf-8?B?dDVIU2s5b3JXVHNyenVrQmRXUzA1cmlleFlGc05ybDVmQ3FGNlJtYVhVUWNj?=
 =?utf-8?B?bDc2MWNEd1ozZE5Rc0UwZXdWOCtCWFN2S08rbm5MaHBZRk5ySm1MTE85aFJK?=
 =?utf-8?B?OWpyanlJZVJMRlN4aVRIdG5jSktWUE50dnlNbGNpMFkzVnp6dW84RVNwRnln?=
 =?utf-8?B?UVdmdmdJaW00QXpwOGx0SER3RUIveEZ1S2dLaS91dkFmSlYxYkpPaEVzSUxE?=
 =?utf-8?B?T1Z5dUNsMEdwbW1SVDdTOWVNYVZsUXFSZStjaC9oZTBjc1V4Z0xjMld2RjhJ?=
 =?utf-8?B?VnJFRms3eXl3Tk5QMFlWOVVJUTcxRDk4djByb0NrY0xvYkZYNzVGUGFmeHpN?=
 =?utf-8?B?WXErNS9TN1JWZ3FRUjJWOGtrTllhdWJndjVRMFlMU0RWUExSTTdnRGJsRTh4?=
 =?utf-8?B?bTREeUwyNGJEcGoyMHhMWWl0dWM2QUJFeEg0VlltZUNqUDAyQXFiYlJuYXBF?=
 =?utf-8?B?Yk5mYWduYXpjUU8wOHRTUkNFOEJwYk9KRXNTQ1A4Z1NpZ3RiWDRRbTQzYXQw?=
 =?utf-8?B?aUsyK213akkzRVFSYjAyTlROaktyWWVQemc0Zmp4VWNzR2J5dDA1K1dIVHUv?=
 =?utf-8?B?cmJWUUpndk9PaUVna2h6NkFEakNLenRQSW8rMTJHeWZHS0VoVmZBNGR2MUJI?=
 =?utf-8?B?WXRkdFlJUFFVQUlZSUhlNktSZTRkOHcweUpkOFI0TTdudlpndmgra3phRm16?=
 =?utf-8?B?b3VnSStpVWRXVGZiL0swU2VoTXlDN2p3eFBReXQ2N01MdlFvZXRBQ3p4NE9M?=
 =?utf-8?B?L29Cc2xKaUJVdkxYUUwzdS9hUjZXVnVpc3krMzFzb1FZL0pmZis2c0Z3amZt?=
 =?utf-8?B?OWE5QTNtWDZhb0lPV1E1TlA0Q3h4bit3THkwWHNmd1N3ZWhyYXYwTENsUDd2?=
 =?utf-8?B?dm5zbkhxcXcvMG43RVVLb09TdE95ZFh1Rklqa2Z6NmFlL0VPY0dzMFJrSUFr?=
 =?utf-8?B?K1pkNHM3Nk9rWThtR3ZsbUpPQTVmaDNhRWtEWGxZbC9USFFYOFZIVVYrMG5H?=
 =?utf-8?B?SnF0d3FPMDlYK3JtUjVhUDR4c3R1TEFGV0FyKzg3eWF6ZTNkNGU4VWFuZkVk?=
 =?utf-8?B?REFNd3ZPWHZHaGszQTcvWGtMTU5DNCszakpGWFQ0a0dSMXBaT3pCZGZBLzJu?=
 =?utf-8?B?djdWaDVNLzBKZk9ldUhVajgzc1JVUTliSStZMERWMHEwc1pMZTFMVkNIakxW?=
 =?utf-8?B?UERBcmc3Uzh4WG5tZGVZOEx4NWpvRDMwdENDZmhrbU5GK1BzL2txSnhjV01z?=
 =?utf-8?B?SWFMV0lCOW1yRzFNQUozalE1bmVLYk1MQzRQVWFhb09nb0x1dkd4WFJTUnUx?=
 =?utf-8?B?SHZScm81TVBmL3IycnErcS9ITFRqSGFmc3phVFdVeXUyc0liWlU2VVhoL1hm?=
 =?utf-8?B?cGwwUmJCVW1YNy9ydDN4Z1d3ZGE1ZEVjVDZiSXFqaCt5UllIayttNUhUclNK?=
 =?utf-8?Q?6EQW5JChG+ae8jWU6Gx7kEgWp2Ng54SVZUCRY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7838d7e-43bc-4dda-b40f-08dee0fa965a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 16:20:00.4131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x80bf0pVYOMXBUsRln9uTQSYmCitwweiTZnPyKQj2m0L+319ymyD6xEYmCJNZUyNgKRTrMwDUMC95AG+roJvF+do/TKM5xHJRh6iWkfepMYzZ1ycmS3dpN9W2nUTBl+X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9701

From: Frank Li <Frank.Li@nxp.com>


On Tue, 07 Jul 2026 11:41:25 +0200, Alexander Stein wrote:
> This device is used for 'sound-dai' and needs #sound-dai-cells. dtbs_check
> raises a warning regarding sound_dai_property.

Applied, thanks!

[1/1] arm64: dts: imx8mp: add missing #sound-dai-cells to xcvr
      commit: 4b407eaff92dbac9f31a61040e40ef05a82eb3a5

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
