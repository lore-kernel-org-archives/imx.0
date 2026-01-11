Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013051.outbound.protection.outlook.com [52.101.72.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D8D33C1A5
	for <imx@lists.linux.dev>; Sun, 11 Jan 2026 12:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768135291; cv=fail; b=RZ/eSLec8FOsOO91j0CjXVuDcbD3OCVcSsTRxhD+zsie6hF6v0dRt79RSw0Xf1Io5ALlTqDB7dms8ka4+RxxHGMgwI9lsOyCFKFfz1zosBd0bBmLagrr15v0dWCwkwxYk1wHWQIlWOOpLnZJN5sohQ8io6rAOEXm9O+gKT/2f3I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768135291; c=relaxed/simple;
	bh=hr/E3j46F+UM1KE2s9qMkWTyKBWbTQjZhmEDkg0Eij4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=RWyDxDXi9f4pbDEecOoIf8xnCV5Xc0AS0sTlXOr0FTFTQPuzfDsk/PXpyD+tbD+6669GKgZ+/xeA5JcgCY2DZ+TQa4VOLnkplqXia735UEsfAkyG+cEdy0uLJmKV+MYNl/8PDhPPdqHfAPDEfdclCkvU9wgLrZr3UNf8xFjM/WM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=EkQvgSEK; arc=fail smtp.client-ip=52.101.72.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="EkQvgSEK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rcKZljspLAPoFsgd8FsVTAMAEtM/Mh6AZJsQFyGjeHYak9DhZcVhFmDNzPXUP36hFFXU8gJcBmcNxklR7IIVh/1BT0XBIFejk6mhr2ynFjU19qLX8AfoHTGXktqQi0IEi5lXG8Y3goT9Lpy4jD8gJ37qeiEftS5aYI9u5ebHl0TvE5mh+p4tdh89Sol3v140bLxER0WhlP7/Gf482VHdThc1ubJ8FIgASwx+RjdQp+qWQSjZVW4GFy9ItsExlq1PH3jtNxofT1KBcL9npf9vxsC8xVZdvXQ97Qy4ZzleJCVqVJxO1f701ogdalufzP/AGBLXSjUYpRE24ekvI14nBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PdnrkIl2s8pRVOFE7FjLQB3Um6lUMcHSd++Z3ZnzR+E=;
 b=myaD62eWkla8Ltn1M4nrRlCxe7tWFyRTL10Vfv1JvXGFEjY4ULB+XAFufraAJP92dWHsDa4iZds9S07nYimrQ248fq2VEG9v/R6AXOAZkxMQUOOKhKM9dqh4llPTgNUpkHXbWEojojmpK0gfWdtFXEtNUBks24ezHZus/T7qDk91ZSFuKUyLUK0U/x638jBXjarg00v7F8jZCXpgEAA448qxOD8oKzFFufpw6NtQeT8lQHY+ZWlBq8g/2AgkpLcr5YBnprex6mceiP2kpDJOKYIxolYOXywhfCoIi7V5yU8LLWeW5eKi9K5hOJWHOO67L9XLdzKYvMySTE9kR2Vbkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdnrkIl2s8pRVOFE7FjLQB3Um6lUMcHSd++Z3ZnzR+E=;
 b=EkQvgSEKEZNUG2gGPW0Z2E2bBfgzYG5ciKFXQq0Zj2q2i+ZDsNRHHJXLpgJKTp+owF88NE8g2/TXV2iOgVWfviFy9dIu/jtbI85WjKkrpv0jt9JqA5XUZEJQcLFuZggGp101HybZ4spV2sTQDhA9O8brV8GkJT2hu55pbm4Do3/7w2OPKW9vmKOnFWx0NYOMJN84xnNLoe2ZvqfZ9VpFSCGgarevzSsS2L2bHblpV0+Ig/lLQ/Ll2aEBsaxI3KNITTBRGSEA7upqGan+eZ+xVmzzza1E9kNvLL6EHJebNR8OC9G48kYSH1txC+yBZdpC8qbk3LHQiafH9dGxKSQz8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB11041.eurprd04.prod.outlook.com (2603:10a6:150:218::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Sun, 11 Jan
 2026 12:41:17 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9499.005; Sun, 11 Jan 2026
 12:41:17 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 11 Jan 2026 20:40:16 +0800
Subject: [PATCH v2 10/10] arm64: dts: imx952-evk: Add nxp,ctrl-ids for scmi
 misc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-imx952-dts-v2-v2-10-5773fa57e89e@nxp.com>
References: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com>
In-Reply-To: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:196::18) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB11041:EE_
X-MS-Office365-Filtering-Correlation-Id: d14b36a4-59c5-4078-ed8a-08de510eb70d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NWRPeGVobXBDdGRKNWJmL2x6RmxUVTIzZlU3QnJOekdnWFducktMMEd2NFBF?=
 =?utf-8?B?UDB0SjJMUUR5QW0xekdCYW1XakRJYmNjazlUamZ5ZFpYSjU2Ump1ZzVPSXIy?=
 =?utf-8?B?TUxnR3FZQ21NS3lYNXpPRFZlamdxT011SFBQRW1mNTNBUnlZR29NTE5mdG1l?=
 =?utf-8?B?dXJUenpGekpvd25GRHZqZEFJZmM2NmpiSkhPdndudm1Ja1RMU1o4MVdGaU1M?=
 =?utf-8?B?Q215WFNIZlYwZFF4ZXlpaVlsZTVsM0g2OWs4bENWMGFJUzhsMkJoNFZNQXh4?=
 =?utf-8?B?aGJMTHFjZE9Pb1Jrc0pUNkFYZ0pVeS9kaGRxWkZrTUprR0lCRlM1YWNtbW1o?=
 =?utf-8?B?d0RuOVlyY05WbnppWE1kTjdaTlhMekVvWjhTUjNkU3lIeE5uSlkyb1p6cU42?=
 =?utf-8?B?S1E0czlIQnZ0dmNRT3M5RkpleGFMdTZUcHJCTHpQNXh0MldHUGZndmFaYlNn?=
 =?utf-8?B?WHJoQkZSNjJ3Rm1iQ0pWK2pEd2lYbXE4bTlOcFBDNm4rQkZkYTRPK3ZpbDdl?=
 =?utf-8?B?RUt0OVh4VCtQUjZVMnNVN2FkamZTZUR1ZXlHWjE4WEFNUFl6cEdaUzZNaE1M?=
 =?utf-8?B?U2tKZHNKMmg4ei9sd1Nna1crT2ZUSXNrUEtxcDV1VjhDaXBvUnVMUEN4bTNF?=
 =?utf-8?B?YlVkZm1NalpLR2Mva3RFdXpyS2V5SXl0dElWZ3gxMVh4TFZtbTA0WHZNcEYr?=
 =?utf-8?B?bFU2WFJkWXBYYk1nRHlSaXR1MDI2aTBhM0JxeVN6cHRZMHBKTVlqazhVckw4?=
 =?utf-8?B?Vk1zVUUycFFsN2Q3b25HUW9iYkpYUFZ5WTZKVzFabjkvMVREY2RtSzBzbXhD?=
 =?utf-8?B?Vy9mTU4yblFZbm1DSGNFU08rWnNUdzRjdVFVV2UyU0JxMG5XcUl6Ylg2dTU2?=
 =?utf-8?B?RTJyS0t5ekxqOGFtTDVYdEtJOTQ4UWxwdHFjelJ2ak9CeFBWNEZxTjFlVUdP?=
 =?utf-8?B?Y25sdDNwMVBHMzZFcXdXN1FYR2FMQzFxTkRqZi9vTmxhZXNROXozbTRWMzVx?=
 =?utf-8?B?OFFUcklpZmxoL0U0UTh1My9hRk5nUUFEVGwwK0VtMjlIaDIvNExKNkl2am9a?=
 =?utf-8?B?L2Vxa1hFWTFpM08yYkQ4QUQ5b3R0MzRiaXAzdU9kR1UrT1FRUVhOMzlXYnFr?=
 =?utf-8?B?RlpDYXNXc09tajVGakZSQXAwY2xveloycDJIU3RYK0t6WnBCeGp0UEkvVEdt?=
 =?utf-8?B?WnVYbUViZGVvZitSTm4xeFEwcFJJcE5iWW1Uc1NzOHhXVnp4L0xJaXo5bVBV?=
 =?utf-8?B?SGI0cGFOUXRSQVlKRjNKbjBRa3MzdUYyMGhGQmdvWkVBT1NVTUFzNFhXQWJt?=
 =?utf-8?B?b1JveWVxci93UmdyaStNQVRLVlNtWEFoNVFPYlpvWmNNa1J5elNDeUx6Q0t4?=
 =?utf-8?B?OStqdkJPRDBheld3WW10M21ZUmRLS0R2dEpiUE1sUkJWZkhrZVR4MkhCS2pl?=
 =?utf-8?B?WVpGbHY2RFlqTEdVeUFrTURQbWJNZTBiZjRBV3k5NG9NTCtzVlloRVZ0elhv?=
 =?utf-8?B?SmsvWW9EbHdYUVpsdm81ZXF6Z2lEajAzRDlXeENkbm9Ud1pXalBObWFJMnhy?=
 =?utf-8?B?eEFvNDZFbnN3ZitkQVJoaEJoSktucG1TWFIwWXBsT2txU1BqOEtjUm5KcTZh?=
 =?utf-8?B?U24yZ1hzVVpMdWhVUUdsMzRla2M0YTNqMTVqNWNrMlJMUkVRZWEwcEpLS3h0?=
 =?utf-8?B?YkZqTXdjRVhxWWorLzhmMzI0S2NWenZNZjNsMVhzdzAvQ1pvQ05NMU44WnZN?=
 =?utf-8?B?MXVoS0RlcTc5SmNGWkQ5U0VTYVE5NWlzeC9iOHpWRFFpeGswVlJ5ZjEyRzFp?=
 =?utf-8?B?TnZLeVBESTRwVlVGK2YxSXZ5RjBiNEgzNmVHS04ya2dTQ3NoL0dnQWY1MGYr?=
 =?utf-8?B?M2ZudGRmM2tsSm40MEduNnVYSnpPN0NhRy93UnpsMy9ra2U5MXRJTTNGM0wz?=
 =?utf-8?B?U0hDRjJjTWhxajlPd1pNTWtTdUt5Mno5c0JNemgwTURjMTdIZHZTUEFhWE1y?=
 =?utf-8?B?VkcvM3BWK29DSmJXbjlweDJQVlU2NXhuVWU0ZmhLY3RrbjBPRFg5bTRNdmtU?=
 =?utf-8?Q?nuYiSZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTllMmZhNFYvbW9mcm1mMlFaeGtWdEQ0TmlWbDVrbE4yRVpoZ1lWelE1ZjVo?=
 =?utf-8?B?VzAwMmpmQXIyY2w3RVcxM1UrbG5kT25zWXpjSW5HcmkyMmc1WitUOENuMmVX?=
 =?utf-8?B?UnB1VXh0TjNHRldaOGpNMEcvaDVUNDJRblNhd1pkRWNQUVZRMERLaWZFUFgz?=
 =?utf-8?B?OUgwOTg2Zno3aGRBYXUrUWdnMVROcEM1UW1Db210dkprSlJpd0xlbDJPNjVy?=
 =?utf-8?B?aVZQV3NmSzVoVVhDbUNCcEo2ZTNxNDllbWV0c3YwRGZ5ckVjNU9LS0hMc003?=
 =?utf-8?B?SUNGcnNnUXhzQ1Fpc2hHdlNwVTZHajc2bnA4ZXljSUdqWHB2VWQ1cEZ5MVUx?=
 =?utf-8?B?SmsyWWNISEdzUklocWlyV0htbzRmRkRQeCs4NXJFNWxKTk13UmtlZ0xEN21U?=
 =?utf-8?B?QnF6UWhFeXdLSHhHVlJDSWpYRkppOE4rL1VmUlA5eTZsbEplLzBpSzBpQmk5?=
 =?utf-8?B?eVpoVlJ2b1ZBRGNMZkJGUzZ4NVA5RE1uUEdaTUhYVlB6c0hQUmN5anZadXRq?=
 =?utf-8?B?d1l6bkp0bCtqSk0wSHZVT1pDa1ZpK0g4YklVRVN0Y2lsblExWGJrbjdodjY0?=
 =?utf-8?B?Rm1nWnNScGc4dGt5dHBQN3VkTDBYeDl1REI5QjNTMHNlak5wYXdNUkZWVFc4?=
 =?utf-8?B?eEx4T1ZWTnZXb2JWdGVvZHlDOXFoRndnNXhYd1R1QTBiMFRtaFN2U04za0RR?=
 =?utf-8?B?K3RHb29pc3l2OTYzVWNjYldLUWFwVDlyUGFRTmFmQjhvZ29zUmRPdnBpekdS?=
 =?utf-8?B?czhWUGJuVUx2TnZ2WHpyMzFVcHBNaG8rVHFSdmZEN2EyVHpnbWtaWUh0K2FF?=
 =?utf-8?B?bVVkRWhWWGRVc3QzSXNPdDJFU3JUVklxWm9wOW5OZFBwQVJCRllrYUFUZ3dl?=
 =?utf-8?B?SHhDTldEZzZHc29wTUZGeDRyaU5lTTVndzBWbnpwZlMyYWY4V280WWxhVzJH?=
 =?utf-8?B?NVRaN2JETFRBdXk0d2g5d0RBak0zeUJaRW9NMkhpaWIrenZaNHlncldXY3N2?=
 =?utf-8?B?SjBxbkloamdvUmpyaEt3bFBHdzkyZkR3K2xHWkE0Rm8xeU9oNUdPeEhjbXVu?=
 =?utf-8?B?ZFFtSk53YTY4QVluT1I4TWlMRkRwL2dLMjVKWXIyaGt1dENhQll2R2FNeWdR?=
 =?utf-8?B?dlRvVi9lbVhTTjRSR3dSZis4ejdPZ3l6MXRxUmhMaFRsWnRyaVI5OHBWYkNm?=
 =?utf-8?B?ZldzYWhBUFFZNG5KL3NFMi9pbThwWSs0MTFRWDdmMExNSHlsb085eWptVWFY?=
 =?utf-8?B?alN6OHYydzNCdDJBb25HVWFhNW5JM1c0OEw0YkVmQnVlLzI4LzhrbVYwM2Zp?=
 =?utf-8?B?eW1mQ29kbG1nS3VHak5meXRWYjlwcWMvaEw1R2ZyTWJoY0pVT2VZV2dhTFpX?=
 =?utf-8?B?TlR5M0FpMnR5amlkK3hGTUNmRWVGaVdUQS9jV2daY3ZKWHNTVnNlRC9NdzVj?=
 =?utf-8?B?M1k5K0tLNXdEUk90YlUrWkhBWHNQejRzOFBaMFVPa1lBN0JvcUFzd3UzaVBx?=
 =?utf-8?B?cTlObEhlNG1QZityL3EybjZaNGN2YU9WeEZlUUpWMngySnpIS3BxODhqNzBi?=
 =?utf-8?B?SE5iKy84RWF5bjFGa1BjWGgrdk1ZZm1KbHZybmJBOTk3cFJ1SXNIV2E0SkdW?=
 =?utf-8?B?YlR0TmlOcUZEbGk5VFh4dnEzL2Mvc295UEtyK1gyTUdXVTcydEo4Z3dxM08x?=
 =?utf-8?B?QWVCL3BGYXZwTEFPWWkwS3JXL3ZDWW9pRS9PTXdWakhlTzZCTmZibCt2d1la?=
 =?utf-8?B?UENVLzdUaEpOR0o2cmN0TzR1NjBUWFdVQlVnUHZickIxOHFoaStnZGhwV1Rx?=
 =?utf-8?B?REd1K3dING9rcit1YkM5UGpHclVnUDV3Mmo5STY2RlVVWEliQm9qTGp5RmNa?=
 =?utf-8?B?NndGT0hXY3FzdUQyUTVpZjE1SXRBRjc0di85Z3ZlYklUdSswaEZsUmM1OURQ?=
 =?utf-8?B?ME96YVJNRzROZEJ6MVlsVms3dlF3RGV3cTNWNTdYQlEzSGlvZkdhSTVrWENF?=
 =?utf-8?B?Ky9uQXYvQ2IwWHVZRkQ4UG52UTZlVThseUdpUmV0OHh1K3ZSRHFDZzNZWERi?=
 =?utf-8?B?MU1aUEVKNXhyaDhvUVJxUnF3RlFRLzRndXZTY2o4M0dHTGV1MExOc1BDNWRs?=
 =?utf-8?B?T2piU2lhZ1M0bVloRHBIVFQrRnVNemVkTVM0d3dYdmVZeHFJN2FJZzRaK0tR?=
 =?utf-8?B?bUUvdDJ6QmRDOGxWVDBRTUl5VmNnZ2oxSFg1ZnkxVG9uUVkxcGpRUEo0SVUz?=
 =?utf-8?B?VUpxU2JYVEdyVnFLZUh1aGxjcEpTWFptQXUxTFc3REc1NTk5bUgvN3FKRS8x?=
 =?utf-8?B?Y0pReGhGQmM1NU85bnZQeGRjNEVlSUxwWHZpeVRadkZEcEVjSm4xdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d14b36a4-59c5-4078-ed8a-08de510eb70d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2026 12:41:17.6681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: byhEplYR4gMuS+Z+eVg/IQxaa9gwNT11HtxSZQ7IyZWUnZ3ieXOScVHGEeBYcyqdlznJH3OSsJZrIBMBpIAO3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11041

From: Peng Fan <peng.fan@nxp.com>

Add nxp,ctrl-ids in scmi_misc node for wakeup notification.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952-evk.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index bae7b88f8229babc42952b7abbeb912cbefc10fd..b838323468d4109fa1cec8cff53baf432408ba9d 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -9,6 +9,15 @@
 #include <dt-bindings/usb/pd.h>
 #include "imx952.dtsi"
 
+#define FALLING_EDGE		BIT(0)
+#define RISING_EDGE		BIT(1)
+
+#define BRD_SM_CTRL_SD3_WAKE		0x8000U /*!< PCAL6408A-0 */
+#define BRD_SM_CTRL_M2E_WAKE		0x8001U /*!< PCAL6408A-4 */
+#define BRD_SM_CTRL_BT_WAKE		0x8002U /*!< PCAL6408A-5 */
+#define BRD_SM_CTRL_M2M_WAKE		0x8003U /*!< PCAL6408A-6 */
+#define BRD_SM_CTRL_BUTTON		0x8004U /*!< PCAL6408A-7 */
+
 / {
 	model = "NXP i.MX952 EVK board";
 	compatible = "fsl,imx952-evk", "fsl,imx952";
@@ -303,6 +312,14 @@ &lpspi7 {
 	status = "okay";
 };
 
+&scmi_misc {
+	nxp,ctrl-ids = <BRD_SM_CTRL_SD3_WAKE		1
+			BRD_SM_CTRL_M2E_WAKE		1
+			BRD_SM_CTRL_BT_WAKE		1
+			BRD_SM_CTRL_M2M_WAKE		1
+			BRD_SM_CTRL_BUTTON		1>;
+};
+
 &tpm3 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_tpm3>;

-- 
2.37.1

