Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013071.outbound.protection.outlook.com [52.101.83.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E260030B536
	for <imx@lists.linux.dev>; Thu, 12 Feb 2026 16:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770913218; cv=fail; b=AQn/D0oWtnn8bx3F80zIzuzOHJMZE3b7jPm0TFwCONCHZuW81RQAolSBbLAwc0/eFhnof+ydrN6z5B1dYjCGlR23tqbBzV5zOKM8ticsMrSqubGl1g0peo08Fs6ozXmaZo3oknJjxFTEPII1AHgtwQ8h+A/ZzPnUBBAoaLsBL/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770913218; c=relaxed/simple;
	bh=fpwzW97b8DRfvV/zWplGEkudKnPK/XFW4tbIO/SdHks=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=CBdltUDRLwQbAW6hdA20BX3U+dboKYofmQ2OqJJeS53yqH9M7MvtVAfTieXR7Pybiun/NGgG3yd418NJTTlz5NFpy12CWuyIDACiCGoW0eVuFJKkNhdxtrtw3gmqQQ1bfxAIdxE/V6Xv97Qpge2DzIqcJXdNrXz9GkIKQyFcwhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Tpd7kNfH; arc=fail smtp.client-ip=52.101.83.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Tpd7kNfH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wtg9u3kb5gq4T0yckHVt1fDDj5DmLcB9SJvRRJFLuq8bYvexdCbv2AfZv+FZ4h7yMSrbkT8cL3MaBjB6VD7I0VFuIso0A5Qg5KtIl6Uj0yHPbdkmR2LPovL092v9hQNRE+OXzK1Ssj22S+QJAYfp9IczHocq2Rz3qe5A7g2At2tGIQvpmI2r/h+RYgRepsyWnEV0+qnHHxgfzwl0R8Pqfs+VJ3ZDDz1UtfDfNOHftBNdcb2UuroUjG+Q9+nb8mWQGWV8TqMbD3mVeDRpWrZBzYjDPXbFCCyjzqcRNAZfGnBc85YpOwfvp1vl/OtWsdTYlXNnlRHLAPjmSDoip8hqPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3l5NL+kYZAnXdtNZOPyClZTAvthM2j5hNFmlyqzbRDE=;
 b=Ox1ZWJFoCHoTNNOTX1+zeXkH5PFHf+R79+6FjIhgJi9FzkCc1h2GXx80JyXkPVSBZ8c06kUBmOKMIdsL50R5flh8vxa4hTHkjhUmveyux3iwOQoBiKpAJnuMIZ9a8i+BupjcdIz2DVKauWbvQn1zkpQNoCCyMcs+4UfH/WI3TzuVnE7kWRPeM+pyc0qvCsk4+pwLXu1/EByg9d9z7/5SJ9HnKYsyhXIA6MnLoc0WS3xBPGwyAt99y+vXn+fY3YFhNS/WxZpfxH5VfMg8xINiLaIyfuukSebIKbIAiodqMUsXurMpxVq6aUQ4kXGO1PifKB1GY9cMQUlfWxZXsAMxFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3l5NL+kYZAnXdtNZOPyClZTAvthM2j5hNFmlyqzbRDE=;
 b=Tpd7kNfHQlZ71Jpgy7P7igGKiA6ZR7bBP+rwOuJk2UGqtFz9bU+M0NG58Nf4cHM30hkJXsZK1XpD2mLKqmdwkG7f7B3lpGuSwOi/6qBsZKSjaU24cB9Ouu6ztsNG/RyKlgxPJrksc52cBAUmNYmxDBxumymNYINvlK/LSoPhkEz98qGGq63onj7gT7Mjj3kcRW76QgepD2sgGZhVTuV1ZrOrKCoZjYdg8RIySlSxC9M7RcaBp/n+SXWRfHAZle2RuRaR7qoEw5qJwDoK5foSEn2+UlAUkEnXfVOSQa1DLbKM4MW2D6FtTbs1G7HrIpSo/KPghJTmkCFw3tWJKA/s/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB9704.eurprd04.prod.outlook.com (2603:10a6:10:303::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 16:20:13 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Thu, 12 Feb 2026
 16:20:13 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 12 Feb 2026 11:19:45 -0500
Subject: [PATCH 3/8] ARM: dts: imx23: fix interrupt names for
 dma-controller@80024000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-imx28_dtb_warning-v1-3-696bcf1a992a@nxp.com>
References: <20260212-imx28_dtb_warning-v1-0-696bcf1a992a@nxp.com>
In-Reply-To: <20260212-imx28_dtb_warning-v1-0-696bcf1a992a@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770913203; l=1319;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=fpwzW97b8DRfvV/zWplGEkudKnPK/XFW4tbIO/SdHks=;
 b=+D5Vwu/cZY7y599hkVNkuQFR5Nhuxif4Q1TMLCZ27WWv6fowkJ3pFHQlJdL/fBwMUv5K41vjp
 jUKWVP+bLEoAmLFRhKfv+HvJBkRRRUYG+n6yG7oKkD+fl0IwtM0hFpn
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SN6PR2101CA0011.namprd21.prod.outlook.com
 (2603:10b6:805:106::21) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB9704:EE_
X-MS-Office365-Filtering-Correlation-Id: e586ffb6-25ac-4399-3a4a-08de6a529981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VmpwTmcwUm56RzBCNUJpVWpuUllLK045UWJ3bURLano5QWg5a1ZoOXoxaDJF?=
 =?utf-8?B?UWZIeThqN0VEUHZkSFljS0lsYWxGSEpYQ0ltcWtVWURxRWthUXlFc1RqcTky?=
 =?utf-8?B?WEJVcTdKT3BGcHA4R3VvZURhSW1zR3VpMnI0aDVxY3lTS1RkU21BbmcyeVRr?=
 =?utf-8?B?SGhsZ2dWVENqSFU0TkJFRXdINmUvdmlDWDZMRzJNdDJkamhSRlkweXhDT3F4?=
 =?utf-8?B?R05lWFRGck1jclpUdEMrNWhJbU8yem85VEwzczRtMlQwS2IzMSthcWEvNjMw?=
 =?utf-8?B?RW1hT2RqUXd4a0pxZWIyZzBVK1ZJUVJnblFPWUl3VTV1Qk04aXQzNFdraEZw?=
 =?utf-8?B?dGtoQ08zZUo3NDYzbWVMOXQ0dndpSUVrZi9mY3ZMTXc4SFROQzh3Ti9tTEdO?=
 =?utf-8?B?UGNVcEhXL3VPRzZnZjdUWElya0VlV0dBWk4vSGozY0lVbk1NL3hQUEw0R1NN?=
 =?utf-8?B?eEpLbnExWVJ4MmJ1dVpUbVBDNzhZcXpuazcva3FBa2ZyN2RBeWl6eEI2Vito?=
 =?utf-8?B?WFV0KzViOTVVYWExM0VQWURrdFhYVFE5S3FkWlJ4di92UXdtN2VuQmU5d0U1?=
 =?utf-8?B?VGg3dUdFaXc4Z0FwTEtLZVZ4UStyQkkzbjZGbFRvVUx6ckEzaDZFR2NJZ0tz?=
 =?utf-8?B?MzBHTFJ5aHRLV3ExRW13akdoSTFnQnBMTnpJNWJuTElzNFVBYVZCbVdXeEVr?=
 =?utf-8?B?aERDbmlpREFVME13WmJIakVwcVE4VlRaWVJOOTJUbkJkWXF6M3dhVDUxdENt?=
 =?utf-8?B?b0tYYW5MbXh0TjhkSWJHTmMwYXIrVGVLS3RDb0xzODN5bGRXWHBFMzBFa3li?=
 =?utf-8?B?UUpNdHlNSFd5aWQwYy9vOWRrVXdJb3dEcyswclJOcEh4TlB0OU8rSkRFSzR4?=
 =?utf-8?B?RWlpV0xvMVpYYmV6VXB2NXlZVml1M1d6dnkraHNMWUtOTTdHTU1TNGVCcTRK?=
 =?utf-8?B?bEZLOWxpRlZRYld4dGRZQmp5eUp6S0J0dWk4UVQ5YUo2UndObTFPbXlKTDNo?=
 =?utf-8?B?cDd1RlJNTjNKS2lHREhMaUVxay9vNk55K0xQdUM3WFJiVVE2SG14aU9udEVu?=
 =?utf-8?B?QUdTdzBtZER4Qy8zZW5JRnQ1Ujc5WGxEenJ3R2pFSnZ2RFczMVRKcjllM29n?=
 =?utf-8?B?QmFuNkNHbkx1Q21Fa2QxQjBRRzJxZnpwSm00VUI4enJLK0hyUkFiTEdTbEhy?=
 =?utf-8?B?bFo3am9NVHpDdUpnM2J5M0ZGVmpZMVNvckFrUmlXbE1tWmxUK1N3cE1XemFZ?=
 =?utf-8?B?R1QxM3N1aGJOWlZTQTJ3cS92QTlFN3NuRjJPcVZUU0hJTXM4S3grNE9CcXhu?=
 =?utf-8?B?bWg1blQxdGl1U1E3aFF5TjZxcndaMFhJdEVqcW54SXdCMSswSGE5MmZJV0lG?=
 =?utf-8?B?dTJ4V1p2YjIxSURoL2lhRFYrZHRlSkJxOWdqendTSzByUndDUTFoY3Bwb3lm?=
 =?utf-8?B?NzJKMmxKZm5XajJLZkVoRHA0aWYrQk1SZkpxa2ZxTGZxUDJQZU1RRHA1Z29J?=
 =?utf-8?B?ZEVrQmViTzlocWxqaDZTR0ttbTFneGErb1JyNGVTSFM1S2tSZUtSUysxUVFR?=
 =?utf-8?B?VWpvZ2VES2ZzaDZrZHZocEJZR0xaMEVWN0YyRzgvTi95UkFGR1FRTW9iRnJN?=
 =?utf-8?B?Szl1cnZkaTVwSi9OakJxd2c3KzY4UjZpSkQ2TGlKaDNES3k3dnNQR2NvWTB4?=
 =?utf-8?B?ZjdLRUU3TWVnTTBCYjRWUVU4dHFPSSs4Mm9rYVNhMEVPekQrdG1scmVuUjFJ?=
 =?utf-8?B?cDlPUDh6N2gyZjluRkZ2em5jZkd6WkFEY2hOM0w4WkNFTHZkMTV0d25ZcHRv?=
 =?utf-8?B?OVBKTDdBZzhDK0h0d0ExVVlUVTJYb0JvL1EyOTlYMmFoWjU3WHZWU2NqNDVI?=
 =?utf-8?B?bjd4My85d2xvSk15V1JSOEJId09UTzRHUUtSQ0x0QkZkZ0IySlFzUUhtVTBh?=
 =?utf-8?B?VkE2UE10M09MWGdDeE9uOWNLNDVqUHJsNTR0ajkzd2h4YmR5U0o2MTJKS0pD?=
 =?utf-8?B?M0tCRnRTOWFRcFFlazNYcFNnWTlvY2lWdEkyYXBONUxwOEg0MHlGR3R2c1cr?=
 =?utf-8?B?dlB5Q2VFWk1NYkw1OVd4SHlTZVFYUi9wdDlDYlJ4dFZ0c2dMQzFGbWlSYlVH?=
 =?utf-8?B?bWw2cVQ4OXp3TldEZFpwc0xNNytoTmZVY2JRTHZuTzlXa25xM2lWRnpQUjJT?=
 =?utf-8?Q?zLHLl3XozmMX7+nRLO0Xjbs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2hPcjlPek40b2ZrLy8wOEJNaElJQVNOUzFPMG9WbkZyc1paenlaUm9IaFJS?=
 =?utf-8?B?RkhLczhQcnRzRjBndDVRTjNXaFJNam9TYzBNcFUrTHdRaWROSzJIc3VUdHYw?=
 =?utf-8?B?c2F3bEk5RUU2RmtFY2ZKdVB1Z0hIVTg3ejk2VmpZY01LSUFrYXhVMisvZXRh?=
 =?utf-8?B?ZTNXQnA4QXVKenZneDlJMkdza3RyTmtMVXVmVzF5RXNrL04rV2pieHR3VVZR?=
 =?utf-8?B?WXQ4K3d0WmFHVEo2Y0IwNUZtdGhlNWhqZ1hkbVZtdEE0bDVLY1UyMm5Ba2NX?=
 =?utf-8?B?MFhLLzRid3ZCN0F1aHorV2ZqSlpMVVBZbDBCM1ArMnBxclU5b2lsTDQxMldm?=
 =?utf-8?B?L2NyVDdxQ0NFVUFDN25pNUZva3dpY0JWM1pxaFJzcWVONEVsM0c1UWx2MnVv?=
 =?utf-8?B?ZnljK2hwWjRZQS9haXBDSDBmY3RKaUVuKy9HOUcyUzFnMVp4YWZVQnNrdUpG?=
 =?utf-8?B?c0VnOE43c3RrUHhzVDFQSTdrTlQ2SDZiN1hXbVNJNmNCb2RjY29ueU03RHNK?=
 =?utf-8?B?WHhMYUhLRk5MVEliNTdaTzBaRUFyS3JQWE5zdGRPa2pZTmhsV2JGbDlIYXdK?=
 =?utf-8?B?SndPSUJVK1p4cHlIQlJMMU5WaEI0K2tLTlRXMGxLSGlhOHdrVTY4T3NPRzM5?=
 =?utf-8?B?MmgzT0FJZ0tkRE1xaFlLRWJEVHovTS9nKzdRNG1JNGErZ3lUTEpMMXQyNFpD?=
 =?utf-8?B?SFJocktkWW00cWUzdG9VeWZtODYwRWFLZGxSS2Q4VFl0MWdtVHVxZE0yQXQ4?=
 =?utf-8?B?VzllTjRUTHp2NFVsVldsMUFnMEs0dTg0R1VPT3hSSnNCYVp4ZHdLQlAyVnpL?=
 =?utf-8?B?VlZYMDcrR0xacjVDeHdsTDZhdnE1RktBREU4VXY0Tk5uZkh0Y3VBL3BhSFhL?=
 =?utf-8?B?VFZyY2EvTzFOQ3JlOUlOemI1cGFOM1hEM2lzVm1SakY3Ui9kMU1Ca3JYNklW?=
 =?utf-8?B?MEtSRGFPY0lYRHZvVkdOY1JwWVJ6TmM1SFdHaEFvN0hNUWEwYktwTVpQYlUw?=
 =?utf-8?B?alYvditGcUJMSjM3L0s0N2cyc0VrWjAzWG1VSStleDdnYUp6aE9odlhLU2lU?=
 =?utf-8?B?YkRRT2ZEM1o4TURoeHFPUlRDWUxaMXNiRmRFUk9PcTluYXBnQTc3elJuM0oy?=
 =?utf-8?B?RStubFduWnl4UXhQcFp3OXk3WVo2azBUVFdPQUw5QmZjdjJwaFlhME0vQ3hB?=
 =?utf-8?B?clNlWkJBdlJmakxyS2F3U25Ic0o4eG9aRDhrcUN4Q0pta0NNTEF5Z3ArYzdJ?=
 =?utf-8?B?eFVxc3I5ZW5ZS1d1SGtpTlhLRVY3dkhiWG1MdGxkeGI1MittUXBPQjZZY25I?=
 =?utf-8?B?d1dXVUl1aHdaeWhLQlppL1RuSmtPVlRmYWFTVXVvQ2tERURxVTlNb1lxcVN1?=
 =?utf-8?B?UGcwOG1DZFBET3BZM2FvaVhPb3BhTUNkUVJZV0hJc0J4MHFmdE5QV0ZKc2xG?=
 =?utf-8?B?U2JNWFhtRGlrdmh5MkxiYmlqTjFlUjFYSHM1SStLak9wU2RidDhjTVgxRWV5?=
 =?utf-8?B?aTA1d3ZHMVBVeEpMa1AwaGtmM0tDM0Y1ellORzFWbUYvN1FsNVRQY29INUJt?=
 =?utf-8?B?T0FVRU9DZFB0OS9zeldLdEQ3amx5eXJhaUVaNU1BS3dqZkZZUEx0KzFTOGZJ?=
 =?utf-8?B?SUNiVU0wK2RUcitzL0NvTmNMSGFHZnpYWG90MFpHL1dWNi9EdHhrcmlRSDc2?=
 =?utf-8?B?NmZaQm5yZGUvOGlVVXFKS2QwSGpDV3BPbXZ5K0c0eHY2NTRUZm5EdE8zZm0w?=
 =?utf-8?B?VDh4NVk2Q3Q3VnVqY1dnMlJzdWpkSkJuTnhLNWlYMVJTMmFjSWxuZ2pNK0oy?=
 =?utf-8?B?dlpxVXA3STU2WHZTRTN5U2VDQ25odjhHVGFlUGkrb1lvSk9vaG1NaTQ2WGpT?=
 =?utf-8?B?L0ZjQXZtOVFSRnQvbDR0V1d5bVR2ZzI2TGFoTnJBcTdsV3JndGttRUdyMHJF?=
 =?utf-8?B?WXZzRTYvWnhyVU1INmdvL2FsMXB2eWM1SlNmRzNlcitJZDdsMjJTR3F1RER6?=
 =?utf-8?B?aGtsOWFzNE5PVlRGL3NvbVBPalJVR3BoTmlNL1ZndWo3WHp0U0lDRElWa2JS?=
 =?utf-8?B?RHh5akhMSnh0VlA2cy9DaFBKcFZqT0ptejN6TzdFSHZncWVZZjRXMFVqYVpQ?=
 =?utf-8?B?RlRJeEN1eXFSbVowVFJGZ0tVUkZqNkpmaVowTFUyQUZPdS82MFZtdWp0UDUv?=
 =?utf-8?B?RHJ5SGdSaEVrbUJmeklBaWpQR3lnTUtnUzhaWWNoZldWS0J0dzFndjNnOTJk?=
 =?utf-8?B?RmovOGx5NlNORHZ1b2RqMDgzS0tJTlJVT21JcFlNQVNkeUxKUVp1S3lCaENo?=
 =?utf-8?Q?EqyQ6MMg1790LlGiLB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e586ffb6-25ac-4399-3a4a-08de6a529981
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 16:20:12.9574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QOs5GnaL0/KAOqK0IAfOW4V8YA4owDlk0G12sAW68d/c/88tYIMDaopOIYBAeaU1ghGz9YlgOt3e3ip/W+5qpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9704

There are duplicate "empty" entries in the interrupt-names property of
the DMA controller. Rename them to "empty<n>" to fix below CHECK_DTBS
warnings.
  arch/arm/boot/dts/nxp/mxs/imx23-olinuxino.dtb: dma-controller@80024000 (fsl,imx23-dma-apbx): interrupt-names:15: 'empty5' was expected

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/mxs/imx23.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx23.dtsi b/arch/arm/boot/dts/nxp/mxs/imx23.dtsi
index 368ba94d8a20b2f2c240dfbfc053985c19f4b643..a16cb00332d69edb286745c3db7e7c2684dbb1c2 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx23.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx23.dtsi
@@ -420,9 +420,9 @@ dma_apbx: dma-controller@80024000 {
 					     <60>, <58>, <9>, <0>,
 					     <0>, <0>, <0>, <0>;
 				interrupt-names = "audio-adc", "audio-dac", "spdif-tx", "i2c",
-						  "saif0", "empty", "auart0-rx", "auart0-tx",
-						  "auart1-rx", "auart1-tx", "saif1", "empty",
-						  "empty", "empty", "empty", "empty";
+						  "saif0", "empty0", "auart0-rx", "auart0-tx",
+						  "auart1-rx", "auart1-tx", "saif1", "empty1",
+						  "empty2", "empty3", "empty4", "empty5";
 				#dma-cells = <1>;
 				dma-channels = <16>;
 				clocks = <&clks 16>;

-- 
2.43.0

