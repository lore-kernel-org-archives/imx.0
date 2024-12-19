Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2043.outbound.protection.outlook.com [40.107.104.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C88D225783
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 14:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734618360; cv=fail; b=SBj9752xKF9jZkAWuqgyGdiyrd3mmfHcbfHSEQt6qrukVMRzx1isdrntWf1vzZTXogBIdCjYD5jIWuI+MRIoYRnmxeNZHnGsTBTcWMCdTqVgLQnRRTO6Pfv9Mx2s8NsvbwXykop1XhDMpprUUYN1w/2F3QdRucZM+l1W8sLCoYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734618360; c=relaxed/simple;
	bh=j9W1QmsiL4ZM5YYJDPTXeoKJGBgXw/CDksoKJm0NaX0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=iAdgcM2KQW22fllGXMlSwNU41LYVZvrl3CJHdGT6kIVfKMe+64/xiQMHj6F0yy/rndKUws11pnhaGC0vnKGLUXdgI91LMh49D06EsBmg/9/3YZUK5/8ICej4NlUlbeZ9Ii/Ssc40gpuDOn6VBj8Z5G991RrX0+9pwWCaXKZmZ0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=V7e4VJou; arc=fail smtp.client-ip=40.107.104.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="V7e4VJou"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=InDROwyA3vglPME+j4+yw5p2jHdxl0eODRGdEHch9lj94hXSCK+1t/Za2sRIZ+52jLv74QEq0/wrFfJ9E4w+ZB5NPSQTXxJUDi+qaVdU/lSxtaHO0zolpgPuMzaRqvt22Fbww7F4sKm4a18NvpUGC7d4fYulAQqBiDH9hhaubkrrNlTbcw4Q2PVLDjKKtDB9+vP2u7NY7h2tvz8PgC9cFHFXJ/A6YQIQwmqVnpH5lC4lu49o7eWhyZP/V72to2Y3agHfFpVQwRFAprTKMVLoAMm4q5Qb1NT3GxQvhSnABzjwIUvmNKEVcuqk1Z24v5qZNFsi16ku1Of1TgYYkPBYJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsEDvNEYhF3R8DXfZgJKKwqLRbmEeD16rDVIKjmLYLA=;
 b=l8ceU/gFv8UjLDFZ2OQKGL8eUaDKDCYhAi5WuF71lgvq5DpMAXE7bdaFS37USUcd8nDk1UNuO0RwdllCu7Gg4FJUFgVR4ex0RHbx/M8Lu0QM2sAY9gG0jAo6VbFJcfg7L2UfoSeVh0Zhp6/it9Ss2WZl4C4LnsvGV4MeJp6zW85nN0pGc6IaqxVuSMqz/CjiIPvxiEaW6T4CqwZ8ws+mCQgs0MSlHQjkfkRvkJmWmXzzqIPzIlVSnrrVNVIITQkgY6VNcjFy9gyARgS7DX7nYmhNpXlcwYsKXHsVWGKwMySjbzCFuarN9FT46kDzEbkTh6ULMH1VVK6BEzV3O3W3Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsEDvNEYhF3R8DXfZgJKKwqLRbmEeD16rDVIKjmLYLA=;
 b=V7e4VJou1WX5BJvmi3hshad6Puo60C2DQ+G1pGgWxXhL8QKHY4D2L92YO3RB/BQR3qLk3h9orbHiP9jQqCum7Ym4sdEOiR990cufuCluwW2swMxbyCb/PMXg9yPGohMSIsovkHcOF57ocauSZpA0OXGTPmBZ/2WFpYB9bDcEDDxu4/kzB0S+Swbzxc7dDB5Cgca756KzPFu6iuesmutBiyIF3PXUSc0wLuA6BiGWs7Ap3A+l2HK6Bjo/iy3Yzgk9N4ayDOI411msNk5MjbLDmP/LdkRaMAMqzHiQDTApcGqY++DHGNYRZXDpJ81NXAMB5bdmlPnUNJZhKKm72LksGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB8950.eurprd04.prod.outlook.com (2603:10a6:10:2e1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 14:25:53 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 14:25:53 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Thu, 19 Dec 2024 22:25:17 +0800
Subject: [PATCH v3 1/2] dt-bindings: nvmem: imx-ocotp: Introduce
 #access-controller-cells
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-imx-ocotp-v3-1-b22371098071@nxp.com>
References: <20241219-imx-ocotp-v3-0-b22371098071@nxp.com>
In-Reply-To: <20241219-imx-ocotp-v3-0-b22371098071@nxp.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734618328; l=4068;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=4MXzYq4oLyYtlA95EQap1UQZ2xOM248M5j3t6NvUUFI=;
 b=2n8SYklS6e19QSV0YXimnalu4mvhdBKEWo+LWHeSrGAMu7d620ZxT2ZxADDrPexqVKAAd/RtX
 vPFJyN1cdejCfHuiCbwv+tgRQcKmtar8io57DHImLU/BJCsjxz/sr3b
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU2PR04MB8950:EE_
X-MS-Office365-Filtering-Correlation-Id: de0963aa-0795-4189-9182-08dd20390ba1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c1JIVzBmUE02RnVDcjhSUC9QRmo3Qm00TWxOTnh3cERyKzdKcWs3ZVU3bS9x?=
 =?utf-8?B?UXVKbk50bjYrbVNOSWNTdHR3REt3dDNhSVdqa2Q2akJYQ2pObHNGdFJMS0hN?=
 =?utf-8?B?VmZNZXlhUmNNZTJzdjZEVTN2SkpSdmgyRC9zWmZrRVE1RDJsNHhKaXBLWWla?=
 =?utf-8?B?YVpIQ2FScExEL2F6YUlwOHdYNW9vTUNjenlLOHd2UHdDSnVXL0JaUUswMUE5?=
 =?utf-8?B?K1FWdEdvckdteFh5SS9XaW9IMUEwcDVabmtXL2xKOE0ybGlLZUVxSUVFYjNC?=
 =?utf-8?B?TFhXUGdiMWx4UXFJenJsRFBPV1dtaDhMS3dqOXdwaWhxbDIraXRlZTJLOEs3?=
 =?utf-8?B?VC9RcU1SUjFQNkxmQVVzMytDalZuSVFENGVhZWVLREdCUXB6Qy9kV3k0emR0?=
 =?utf-8?B?bDVTcXdISmtnSlVhNXlMb2hITTI1NHo3cEd2S0NLT05NWHJWSE5rRUF3Qmpo?=
 =?utf-8?B?SnNSUFBZRUtWUGkwMjI2ejJTR1hmNjA2Q01BOUtjOVJPKzA1REhINXFNY2Fp?=
 =?utf-8?B?elB5NXQwbEx0SHYvQnNkbklZT0hmY3VWMHRMOUlSUU5jZktMcmxnL21DNXZI?=
 =?utf-8?B?RjZvTlBVVDhuWmE0bXdEOG1tSFhSUFZHanBWVWk2T2lrTFdRSFJOVkpFTE9w?=
 =?utf-8?B?QUtWcnpqUGh6UEdVR0JMMUhqNzRDMFl6WG5TRTR6V01KVG45U2crMVdJVVZ2?=
 =?utf-8?B?MS8zZ0ljQmRkdCsxR0U0WEFMbk5GYjc3Vm91UmU5NHhHWERwV2wxR1lHQWVQ?=
 =?utf-8?B?QUM2d3doVi9mVzM5Q1A4RE9EMSt3OVVHSURUU3BPVGtROXE4T0hqclpQdmZo?=
 =?utf-8?B?eWhwRDZveDY0V2gwWnZjaUF3aUVBL0JEVm53QjVWVjZ1djNEMmFBd21DM3d5?=
 =?utf-8?B?TDNlYlpSYzdlVlJqRlJESjFTU0duSGhZNVZVOHBheVZPZ1F0WE5Tc2UrNHNz?=
 =?utf-8?B?bFBKM0xhRitPbk9GZEtXeWNnN2xNTXkxZTk1STFLcm5QSzU1NXRMYXhIcEND?=
 =?utf-8?B?eUI1bXNzbllIRFg5T0hDUGl2Yi9keEp3b0xHdFFLUm56SldRaFRnOW1zRFRu?=
 =?utf-8?B?eEwyM3F3RmxTK1BPZkQ1NUVXb1RYZXFiVUFwNTRBSG1BUlNxRnJtNFRTdkYw?=
 =?utf-8?B?c2tOeWJtRXphWDZlSHBMYS8vZjc2NG15Q2pzcVQxZXk4dS9QekdwNWhwYklF?=
 =?utf-8?B?Y3FRUk1UWEtZMTVHeXh4R09HczBTUmNJOTlRNUgxZS9nRnhOWm9CRXA1bXRQ?=
 =?utf-8?B?QXFYR1Z3cHNNL2ZCRDRneTdlMEFJSzhzT1Q0MFVob2pJU0p1RmlUWXB1eEY0?=
 =?utf-8?B?dlUveW10aXpaQTJ3VGVkV3JxTS94NWRtWXplRG1GVzU5TXpFSWVRWGxEeWJ0?=
 =?utf-8?B?TGVFMUFDdVJzdEowREJaUjAvUGZESTNLbzBZTFVHM2xsNjE2enRqRXg3Y3lG?=
 =?utf-8?B?WlFvWW9sbkNOV2xlWXN0VmFRVjN3c2U0UFBaZlB4WktiemxmcWRDaE5KbmVV?=
 =?utf-8?B?QVcweTBPVXdYZFljYXg4WFhmM3BLNVNuZGxPRXFjejRDM2RmK29SNmIyQi82?=
 =?utf-8?B?dkFtbDlqMUx0b2FqcEtCOGtUbk1kWXlQYUhoM0p1MERtV0JER0xtd2dGZ3Y1?=
 =?utf-8?B?VXp3dGVBVUtXeVNpZHhrcTh6UU1BY09FZXIxQ09EYWFIYkFKQVhaQnVKalU4?=
 =?utf-8?B?QjJNVjFXMVkrUXZXNGs1THdSMXdTUmNMaUlybnNJUDQ4U0ExcTRBd0VXNlRp?=
 =?utf-8?B?Mk1MTU9rZW44TXF1VHdNMTBTSk9jRXcyRzd1Zi93WERGYzY0TzR0NWtUT1JU?=
 =?utf-8?B?eVFyaFZBcnFZeVp0WUNZUHQzVU4rTnp6V09Bd3RVNkp3RE91b1N4UXNCOUhL?=
 =?utf-8?B?OG53dHFEb3ZrVWxtL051ZTJqN2xCZy8zK3FZTWZKRTNlUDJjakx1bG51akFv?=
 =?utf-8?Q?yv++zAH3nxtNY68witZUp2Aa6KCDuGHO?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHJheWYrandLMlhYUDNYaE04TVhyellybjZoTFJpb21FL3NXb1ArSnZiT0w3?=
 =?utf-8?B?djdFc0tFb1g3VkRIUitickZCRHhKdXh6Z3FVdGFhRXUyVi9mVFpPaTRBZWdI?=
 =?utf-8?B?OFNZR3YvcUFkbnphNnMwRGdkMWxnc0IvcG5zZ20rZTFPNTgzVTV0VkVMcjcv?=
 =?utf-8?B?YkFhakZhSmYwS0tsTXZBaUV2c3U3R08yMUNsOUNJWG5EZ1RQaStXaW4ycFU3?=
 =?utf-8?B?dmk4TmNpK0wyYU5OTm1yUW9OM3ZhNjlVdStJcThOdisvYjZST0NhTnozTUZa?=
 =?utf-8?B?dnpLMlU0YVhINkZGZWNCWTNIUkJCM0pNOTlQcng2aXZENHFkcnU1SWNRQkJX?=
 =?utf-8?B?eGV0SUhhZk8yOGRnd3puckVDc2tpeExrNXFZRmdLM2g4eitmSkluV3lWRVo1?=
 =?utf-8?B?K0Y0QU5DV2VsU1VBM2h2Smtac2ZwdC9yZU1GNDB1a1Y3bEM2dS9vTmJHeHgv?=
 =?utf-8?B?ajRldHJUSVlhNXBDZ1dPbkZFQ0RNYzV5U0pVYWx5QXI0ZytOMi9rV2Y2TkJh?=
 =?utf-8?B?UGRWTTBvOGZMV1VUTTFCQkUyVUxVVXVHcFhSZWdibk8ycG9IQlRCVTJ2TTRr?=
 =?utf-8?B?RndyaTk1TGFwd21NWkRpbGtYQjRJL2V4SE1vOGxVZWloUVlXVVE3WTFkVEc0?=
 =?utf-8?B?ZGR1bXExd2l4TlpzR2VhUUcwSXNOSjdzbGhaVDNjN3BGczV0S1JwMi82QVpI?=
 =?utf-8?B?L0grQlE3czRFdjYwTENxOE9LdHNnamxHQnhSdWpvZEJJTkJXMzgwNjExV1lm?=
 =?utf-8?B?bTdyWFdEU0VOSmZwRzJqNXdIZ1NBNzYvdEtOcVNXanlibE50M3BUYk5hZ1hE?=
 =?utf-8?B?T1pIRmh3Y2VTMHA2NHVHekNheUZ2cHNTblY2ZENzb3hhWFZrTUlKcnY3Q0sx?=
 =?utf-8?B?WWNWVTAzdjJiN2NaWEl4bVo3SW5EaWFEanpMclBxT3JVVi9JYk5nS0dUV0o2?=
 =?utf-8?B?RnF1cEFrZkRKeDdENVczdVlhLzc1Q29NZkN2NE5kSWFIc0RPWWVkOVBoZU5p?=
 =?utf-8?B?SzJtVzBGNEFzT25PR2JPemM0QkRZZVV4bHlUNUpvNW0wS0RxbzhMY2Zyelh5?=
 =?utf-8?B?bE53bTl0Ym5acGNmcEZqVktHMFVFYlNMWEEzaUUxZ3h0dy9WdmdibGpuby90?=
 =?utf-8?B?OEd6VGhudzB2ZXAwNGtySSszOEhMM1Y3VXM2QTdSdjVWbnErbTZzRzlKNnM0?=
 =?utf-8?B?WTBsMjBQcXdaYldqTmJwTTFlVVc1WGxNSjc4dVdOQmgyV2xNU1FMMWtrV3Q2?=
 =?utf-8?B?YlBNb01FbHc1ZkVWK2FKdG85R1JWTEVpb1NncFFxZXZLbHl0SGdtU1N2Lzkr?=
 =?utf-8?B?eElVVE1YMFJCYkhUOEJNS21kVjZCK0NPZitiUkdtcjkxa0dxR0JORmRwTmoy?=
 =?utf-8?B?Q2hNcmo1ODlPZHBSU2VVVWVObDZHWUhwSk1kaHNreXpPeFo5Z0RTRXFzSmg0?=
 =?utf-8?B?cm5sMHZveCtTN2kvWVM5TlNKaFE2SGpEYXpleElSS2FhT0NwMkNJdkRYcDZS?=
 =?utf-8?B?TkFycGF5L3NtdjJUVTFuY2dUSG5SdTBlQXlYeWJvRkNnVzVLMWwzYjRzY0xW?=
 =?utf-8?B?UzlKTng2RzBhOWRRRnpNS1I2ZWFEQUl5UEFROGU4RlZMcVVKZHh4WUx0NCtV?=
 =?utf-8?B?MlZtbkdpc25oc0M3MDl2VTA3N0lDaURoVWEzWmFyQi9jcmlDUUhlNjNlUFNs?=
 =?utf-8?B?bEI4R0gvcno5VHdEcTlON0pwKy9VWW9LVnZuK2FsaFdSSEltMFR0OHAveFRI?=
 =?utf-8?B?dUxvakU5Zk1QTW5lTzcrSktlSjFkWkcwYXlQeUlQVzJvTE8xb0owNkg3cGpv?=
 =?utf-8?B?QTFTWGVVTkFTckNCR0hCb1VmSklKYThRRE9PL0s3bmJnWEdWdUx0YkdvNDd4?=
 =?utf-8?B?UUNjNGpXckFhZHY3Znp3U3pQV2lqdi9lbUdLYk00NnhsamxIS1EwTzU2TGtt?=
 =?utf-8?B?S1F3c0MrUkx0dmFhcWhSaU51ZTF5UFMzK3VUdHlqQ3RxN2NxQkd1clFWczAv?=
 =?utf-8?B?ZzNzS1NpMU0vUmVnNmpPZklXcEZNSUxmRGtRMFFCS2FVT2hNNHFsNnRiZU5h?=
 =?utf-8?B?VHFJdHZrb2l2UXZUNTEyYks1SVpCaVE2TWFrR0FoVXdzZjFCL0tlU2tLc1Ba?=
 =?utf-8?Q?JGxCIRNCsIiOAZ2uM8lXucR2V?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de0963aa-0795-4189-9182-08dd20390ba1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 14:25:53.8101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c34K/InTy97fdJFJP78N8RWAhzJ7BD/WcuMmNPlzNxJz3HzXqXiRIP54X3vHgnfjMzy8rUutI+N/lhhTwu5oFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8950

From: Peng Fan <peng.fan@nxp.com>

Introduce "#access-controller-cells" to make OCOTP be an accessing
controller, because i.MX Family OCOTP supports a specific peripheral
or function being fused which means being disabled.

Add the i.MX[95,93] OCOTP gate index.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../devicetree/bindings/nvmem/imx-ocotp.yaml       |  5 +++
 include/dt-bindings/nvmem/fsl,imx93-ocotp.h        | 24 ++++++++++++
 include/dt-bindings/nvmem/fsl,imx95-ocotp.h        | 43 ++++++++++++++++++++++
 3 files changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
index b2cb76cf9053a883a158acaf5eaa108895818afc..c78e202ced22f1c278f7be827b71ba434832d2a7 100644
--- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
@@ -54,6 +54,11 @@ properties:
   clocks:
     maxItems: 1
 
+  "#access-controller-cells":
+    const: 1
+    description:
+      Contains the gate ID associated to the peripheral.
+
 required:
   - "#address-cells"
   - "#size-cells"
diff --git a/include/dt-bindings/nvmem/fsl,imx93-ocotp.h b/include/dt-bindings/nvmem/fsl,imx93-ocotp.h
new file mode 100644
index 0000000000000000000000000000000000000000..6ef525173845fd4ee0e847cf5a17e53a14f71362
--- /dev/null
+++ b/include/dt-bindings/nvmem/fsl,imx93-ocotp.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+
+#ifndef _DT_BINDINGS_NVMEM_IMX93_OTPC_H
+#define _DT_BINDINGS_NVMEM_IMX93_OTPC_H
+
+#define IMX93_OCOTP_NPU_GATE		0
+#define IMX93_OCOTP_A550_GATE		1
+#define IMX93_OCOTP_A551_GATE		2
+#define IMX93_OCOTP_M33_GATE		3
+#define IMX93_OCOTP_CAN1_FD_GATE	4
+#define IMX93_OCOTP_CAN2_FD_GATE	5
+#define IMX93_OCOTP_CAN1_GATE		6
+#define IMX93_OCOTP_CAN2_GATE		7
+#define IMX93_OCOTP_USB1_GATE		8
+#define IMX93_OCOTP_USB2_GATE		9
+#define IMX93_OCOTP_ENET1_GATE		10
+#define IMX93_OCOTP_ENET2_GATE		11
+#define IMX93_OCOTP_PXP_GATE		12
+#define IMX93_OCOTP_MIPI_CSI1_GATE	13
+#define IMX93_OCOTP_MIPI_DSI1_GATE	14
+#define IMX93_OCOTP_LVDS1_GATE		15
+#define IMX93_OCOTP_ADC1_GATE		16
+
+#endif
diff --git a/include/dt-bindings/nvmem/fsl,imx95-ocotp.h b/include/dt-bindings/nvmem/fsl,imx95-ocotp.h
new file mode 100644
index 0000000000000000000000000000000000000000..2d21d1f690974d0215c71352168378a150f489af
--- /dev/null
+++ b/include/dt-bindings/nvmem/fsl,imx95-ocotp.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+
+#ifndef _DT_BINDINGS_NVMEM_IMX95_OTPC_H
+#define _DT_BINDINGS_NVMEM_IMX95_OTPC_H
+
+#define IMX95_OCOTP_CANFD1_GATE		0
+#define IMX95_OCOTP_CANFD2_GATE		1
+#define IMX95_OCOTP_CANFD3_GATE		2
+#define IMX95_OCOTP_CANFD4_GATE		3
+#define IMX95_OCOTP_CANFD5_GATE		4
+#define IMX95_OCOTP_CAN1_GATE		5
+#define IMX95_OCOTP_CAN2_GATE		6
+#define IMX95_OCOTP_CAN3_GATE		7
+#define IMX95_OCOTP_CAN4_GATE		8
+#define IMX95_OCOTP_CAN5_GATE		9
+#define IMX95_OCOTP_NPU_GATE		10
+#define IMX95_OCOTP_A550_GATE		11
+#define IMX95_OCOTP_A551_GATE		12
+#define IMX95_OCOTP_A552_GATE		13
+#define IMX95_OCOTP_A553_GATE		14
+#define IMX95_OCOTP_A554_GATE		15
+#define IMX95_OCOTP_A555_GATE		16
+#define IMX95_OCOTP_M7_GATE		17
+#define IMX95_OCOTP_DCSS_GATE		18
+#define IMX95_OCOTP_LVDS1_GATE		19
+#define IMX95_OCOTP_ISP_GATE		20
+#define IMX95_OCOTP_USB1_GATE		21
+#define IMX95_OCOTP_USB2_GATE		22
+#define IMX95_OCOTP_NETC_GATE		23
+#define IMX95_OCOTP_PCIE1_GATE		24
+#define IMX95_OCOTP_PCIE2_GATE		25
+#define IMX95_OCOTP_ADC1_GATE		26
+#define IMX95_OCOTP_EARC_RX_GATE	27
+#define IMX95_OCOTP_GPU3D_GATE		28
+#define IMX95_OCOTP_VPU_GATE		29
+#define IMX95_OCOTP_JPEG_ENC_GATE	30
+#define IMX95_OCOTP_JPEG_DEC_GATE	31
+#define IMX95_OCOTP_MIPI_CSI1_GATE	32
+#define IMX95_OCOTP_MIPI_CSI2_GATE	33
+#define IMX95_OCOTP_MIPI_DSI1_GATE	34
+#define IMX95_OCOTP_V2X_GATE		35
+
+#endif

-- 
2.37.1

