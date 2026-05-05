Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012025.outbound.protection.outlook.com [52.101.66.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEEB93BF679
	for <imx@lists.linux.dev>; Tue,  5 May 2026 18:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778006514; cv=fail; b=IKrYp2aY/2dJ458QQNuv7fKmUqxV3yW3QSfD79BFelIgLI8PqCPO5gfEM/KqlwPl81Lmv4L/N6eeuaI16oD2v9+thk7PM3OJztygL/oE6pGTS+AkBr1qPuJO6cbKbSln1gVEjIsZjtlsZHJ66zxGBNfHw6YOhjnnSq0lhIskibU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778006514; c=relaxed/simple;
	bh=OWfHiMuyDYTsWjesvkQu3hM+JtHCQaf9mBmyC5MhfrE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=Z5butszzCPb1Bhf2DxVJHtJczOZ5xIkuhC2mc8K7b4ZTppuzzUidumBn2KjcccbRKhBWZFOjqQ3Azt3Mqs507kd4n7DMUMeMQp1gbycwp9/deJCWcVs51VVBFLJo1ax6vW43Xvyee2OHD4BcWyRM37jFW38ZAIPjJ4WeBX5wr+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DHTNgBIa; arc=fail smtp.client-ip=52.101.66.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DHTNgBIa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XhMjRr1Z0T6Ntr6s04L8UTObQ5zZAoDtqhTQDIbuhet7hiP4e9V9XuXEGwZ/dS0sbNJ1bSNBikH/613cEwVapvdnnAbDZZeTjX+a6jJzmQIzu0SxgZwvuFVUTqqvJ2k3K7SGeEC2cF4FAtOLZHusg4ZBwNj3Zm7l2e6m2nJLZUNw3PX19mUdv6R3QuPGO9/lvvLF/TbQ5kIKTcE4PWFVU9cpZJ3FaZHzK4tE575t5ipaNdCRwuc2DktWQLue8jVl51di91k+25xQ2PnscyXjnknkKaJs8+RIJBf4KpH1ZmvzSBedVkOxv22JjjUHndWOy2XU92RLjRY+6Q+L3lZggg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FiC203IXw9EjSFFzWwfb+H+jm7VpOLOeZ32R5xxKd/k=;
 b=r+GLnYN+F+vQjCjqx8SBVR0KevmZgIB1MDh1Cjy7pWFnlc1oAEb2vUtkaHqr8I53koniio/h7COYPqd3gM5iD/7XBGWnDAQoFoa4M5RdabzDUEzTLfwkXSZ/bARewBO3DhyKvH45iHUuegB/FL7hvTS9CMCPD3CuQWThg2H1OfLb9XuT3OmDplDkMCNgaMPSpg9FOPGBY77OgjG00FGHY1eMVBGPv1u72+hd2byX/QFRkkoMtEDkG19qZFfuhKmTkHJ3styZ/N/uZWpb9jlanEzYGSv7GGB9TJgFWheYkq5myM+t3sP4w8VlVjb3zbDaZmc0oBUuO2jQMCVs1yvU8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FiC203IXw9EjSFFzWwfb+H+jm7VpOLOeZ32R5xxKd/k=;
 b=DHTNgBIa7yH1KzD2jkW/DmhZxdsZlvuCzxTdc0gaNX5SMuskQjkkPgMKmo5paXrxpm6ZOj2/lX/SVL3fcLdfpH5zLy5fnmqOCmKwZxUQcGksp5eX8q7w6Yez7Y/K4Qz7u70nBhZkNJvDkZj58n3hMrX7cxAQXrVf3aTVMJnxdPF3mozgLR7i6nd42z0U5ym26okqMWln7R5p2L2dSwjf1hwZWrzHoYLdd/oSGM3Es7tse9xVJ3GCbNYj7cajBlqiOT/yh0h0VRfCjaQvsOXb5pYQrkOCrCX4bi8dF9ZJh982ptT62EzwG7r7I2obkqTnBduBjs/lj6EXSlEtTT8IQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GV1PR04MB9070.eurprd04.prod.outlook.com (2603:10a6:150:21::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Tue, 5 May
 2026 18:41:47 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9870.023; Tue, 5 May 2026
 18:41:47 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Philippe Schenker <philippe.schenker@toradex.com>, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
In-Reply-To: <20260401-imx8-fix-v1-1-cb27398a6aaf@nxp.com>
References: <20260401-imx8-fix-v1-1-cb27398a6aaf@nxp.com>
Subject: Re: [PATCH] arm64: dts: imx8x-colibri: Correct SODIMM PAD settings
Message-Id: <177800650456.1827675.4579678304080415998.b4-ty@nxp.com>
Date: Tue, 05 May 2026 14:41:44 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SA0PR12CA0027.namprd12.prod.outlook.com
 (2603:10b6:806:6f::32) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GV1PR04MB9070:EE_
X-MS-Office365-Filtering-Correlation-Id: 695f6041-7e36-4870-9d6e-08deaad5f640
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|19092799006|7416014|376014|38350700014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5tuR4IMdxgAbyWAD+qYwYibytgqDiPVP5J46FRqJL8z/u7SgkGm9woKPnxM2IfNn2iuY5XIfGb9lV29GcBr7QW4H4lBgfNIf4TdnEvWmUo2K6f/QRdZ7r681mbbdSv8ZijwT5bOip/V4p079DCVeEHNROMicYFUel82CrQS6h/+emnBQHEde3kjcedM1Jm2+AMa4doDmvNUuANohXlVTJBfqwd4mZUL7Y1RkF1wJ7yLTmdF+x2neUR1TwYJhNwiIE8dykmsGwHpoLpUOhNiWPVOjv1hkH2diJs4HxDfB3akBDEU6dd9fAiHZgR1yFi7Yi1eOV+iLyc+2b6ZLw5OVwlVQytUk8LvRafnMipwCgyRdJ4ThMIxSKDWgZynTZXLI3NyFQnSIHDYlFl8VvSCQbsj0Y1XZk7+xG0sg3bW4f7jPC43G6uYF/r2ssduh/tapUKis1YWn9/jFzBXhDQZbNMMAObBdcwIcBdQX7YCsi+mLpsSXfMe45Ynskh/FATuVfuP12qPjMOIo5KbCARM+U2BQAlcy6dBsaUcjGHe9MNV6QdgdvsnPHDQzywSFMZ3cCBuXHyKL6mTjgsF9XVdi7OkF5GIhXFyNaPG5/SGOivw5Cuj7+XhXoKBGSTJNY5xqKyPpnXfjpSIqzQK0FiR8vg40Fp6aM3YClFqrJfk//Jam7zvAXifgoInK7IVmk7jrwMnQnksdwRXQ6YH+0QHTeEcI05+Pyy6Uf53eyjJAd+qiLj+A8mTzXcCygtMB02+H
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(19092799006)(7416014)(376014)(38350700014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHFZNFdlNlA0Vk5KRFlmSmUyU0J2VHlaZU5NUGRhOUZoRzV3VElhU3VkL21Z?=
 =?utf-8?B?a3NwM2NjSFAzTzRkUitqQ0c4Z1NBSGwrVDF1VktuajFoQkU1NXFDQnBhYzJ5?=
 =?utf-8?B?M2w4RVIzbURGVWMyUGx4ZVlUeGh3Ym9RS3F4aHJDcG9IRzVBckRtZ3BIOElZ?=
 =?utf-8?B?Qi9ZeXlTNTNKbDZJRWR0NnBacVI1RDE2Y21YNUVtWjkrM1EzS1IrYk9BUDE5?=
 =?utf-8?B?WlJZQkNudWlXNEc2THVCUy9xUFhhREo2ejZwZzZhalEvZW56WE0yRk9Jamhl?=
 =?utf-8?B?OWVRaVZTYjFHQ2V2RWs3dHpqQlFzNWdPaUJiOFhNR3JZMk1SVWFXVk81Q3hl?=
 =?utf-8?B?andPUWd0UzdsYU01WW5NWGxnbXo0cWFOc3dYZ3N5S1BVWEw2QmgyQWY2dmdP?=
 =?utf-8?B?eUEvcmVFNk9NZllaMFQ0WDZvc0hsT0ZjMXp4eXJnM1kya3E4Ym1UNm03akVJ?=
 =?utf-8?B?cmVHeXlhOFR3TkIrT1hjYjR5MXBBWloxQ1BRUWM1cVk1LzY5b3dURFBia0k3?=
 =?utf-8?B?VGl4cjNpSlZCQUxlUWpSeUo5aitVVmN1Q3VCNDIxMUtCRFpZTWM1MGRPZkw3?=
 =?utf-8?B?NGxtODFxVVVSeUtCUjE0WGVrSlR5SDNXWkRhbHh2VytiT0xmMkFFM3V6YWlp?=
 =?utf-8?B?eWVnS1hiU1dLUWErZTUvNXdzYzVCRmtSY00yY3VMZXhoUFRpc0NIMkhzUG5j?=
 =?utf-8?B?Lzl4bHhLdVhKUWt6RkRpUUg0bWoxajJyamJNMm90NjRKN0dabS9IaDhTNFJF?=
 =?utf-8?B?bHc2NmttZVFYODhrUGtzVlNhc29aT3FrNXFnR1hLZ1FuMEtHa2dTUHNUVzJK?=
 =?utf-8?B?RFpUTjJMRGZnZFVSYjJtSFphcXlQUHZ1VU9NOVZlNVIxQWdVSE82eTVzTERB?=
 =?utf-8?B?c1NWUks3dlF2RXpkUlc5cVBYQmdCeklDTEtOWkxrZmRSc2dBVG9jaFpHS2FW?=
 =?utf-8?B?bmVNa0hQOElGcFQ3Mm5vTVJmUnVUazQzR1Z5dHkwWWExTVRQUFZaQ2Nya1py?=
 =?utf-8?B?UVY4UGd3UjlZU091NGNmK1hjQ21hMy9BZUdxWUlreHFlSkdzRC9heXZyU01U?=
 =?utf-8?B?RU51ZHhObzBsbzNIaWFXQ1NZL0FqbGkvSml0NkdYVmNEV3ByREJ1NFhLeWJK?=
 =?utf-8?B?L1N6MEJ6eXF4OXFuMUJTWGFZUWNHaFh0cWp5b1FNa1JERU9jTitZMk84TllZ?=
 =?utf-8?B?N29mTUhlSkFkWDQ4Nk1CODJzUE5oR1ZxcTNBWUZPYUpZVmVQUnlaNzdIWVhR?=
 =?utf-8?B?S1VkcGttQnlCVDNzVzZqeGlxdis0M1Vjd29qajVBMElrZlBNTzJVak50S0ZO?=
 =?utf-8?B?L2t2R0NhTDZGUE5MVk5ldzBmU0xjdGtBTTdYei95dGw4ODZmU0hwNTNlYUwy?=
 =?utf-8?B?YTRhWG9DZDNUclh6b1lVTGpVWkRBOE9sWG13cHJIdDhQQlFSOVQyT0lMbDZa?=
 =?utf-8?B?dEJuTnNoc2RveHB1Z2hhRXRwZS8yUC81NFNRQVlzZkpOZ2JaeU8ydXZJS2p4?=
 =?utf-8?B?S09LNDdXRWtHNGRGQVRtY1ZzK0wwK3gzUnZ6N3JmaVZ2blZTMWMvb2szMFI4?=
 =?utf-8?B?d2lJUGJWTC80RTZOWHAydFE0MllpMzN6dDd3b1Mzd3pISGJLUG5WSHNRWDhn?=
 =?utf-8?B?R1pncE1JSE9SMlQ5SWxFMjJwdUcyNlRFSFloa1h6Y1ZEQzNBeEZrZHgrMGJE?=
 =?utf-8?B?YXBJbTlteEV0NEtFdC9SenVrWkRrRlhheExYc0M2QnlFTms1NWRlc1JVV0RB?=
 =?utf-8?B?VXhkOGJPMDYxT3Fqd1dvL3NqOWpqVXd3VHArcnlxOFNTWktESkRYbjk1dmdX?=
 =?utf-8?B?RWlwMmx4cFNWV0hka20xTkFvNUNXMzRaejE1ZE9kNWlVcU5EVG5HTFZnVHdB?=
 =?utf-8?B?Z3JMS0ZDa0JlSGZZM2NUVWJOdGt3VW9RTUFISExRamlEbDFXYjBUVmtSQXd4?=
 =?utf-8?B?QjIrMElxVjRENkx0U0RlRG5kdEIyd1VlcEs3bTVGcG9nY2V4UGtXVzlxL0tV?=
 =?utf-8?B?QzZ2MWxVeDYwSm9QQWpoYWlVZU95SnVxb2N3dEx4U1VKTnRYZnYxS1dIZGxW?=
 =?utf-8?B?RnhadjJNN1QvdUtOcTRlOGk2ZGMrRkx5VVQyUDJGVjhyRUZWdkw1dm5pK1gy?=
 =?utf-8?B?R2FJZFpsbkNKbUYzRjdjTUVWbmx0eDFZcmtHTUhrVlNreXpOV3ZqNUltckp6?=
 =?utf-8?B?d0c0ZVBTRDByUzF0NWR0VFFRUm1ybDRGK3lhdG85Ukt6UEJQeEpaZERaQ3ZB?=
 =?utf-8?B?OTJmTlc5cjNkVStkT2Y5azRDWHcyK1VMVkRMV0Q4bFhTN21zV1VJMEtLMi9x?=
 =?utf-8?B?RkdsSmhsMER1SGpHQ3R4eS9qR3pwWENSQnRxNTJHa3pGMUx6cndnZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 695f6041-7e36-4870-9d6e-08deaad5f640
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 18:41:47.2564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: naQWj9i7mFMOx3gWV3E30F3zlhFki47qC2kszxmDxoOLosZNX/gnIQXR2C/gwZyj5LRtUswhxorT9C3TRTPLxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9070


On Wed, 01 Apr 2026 14:40:56 +0800, Peng Fan (OSS) wrote:
> SION is BIT(30), not BIT(26). Correct it.
> 
> 

Applied, thanks!

[1/1] arm64: dts: imx8x-colibri: Correct SODIMM PAD settings
      commit: 0a03ee38a262cab0d9754e9947d565e089a9f7a5

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

