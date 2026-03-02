Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013064.outbound.protection.outlook.com [40.107.159.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF8732F5328
	for <imx@lists.linux.dev>; Mon,  2 Mar 2026 16:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772469353; cv=fail; b=VCy50qJIybb7IbHDs2UbFJVVfvyjsqUydJac2s8cRbKYXV2J84Lnv7PgM6UdQMhfdcM/pITzKEIDhQHMxigYOFLAzzUnhWq6S81DZie+6uq3l5UOZbF0dLF45k+bQbul5eLilpEpb0hmc8LslSclIudJfRhBah58fMKJYIAvnvo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772469353; c=relaxed/simple;
	bh=VBVLPnA4rqBsPShFPg3qCfJb0RIo8TK1n8W9ZC2BODg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=th9xAbGGEoMamtgUWf4Us0db8xRv8fFaG3DY23rtsHKucJwyGQdoRuxbAbCfJvIFGzjDcbTFEngxNYHLXrwBwZOvyhJ2TQ0hZ4P2t4lsIdv3d/5xT+yLibtvSgQTo+Z5D5Wr2en5VP9J5BUN92K5vjvW83MvKaHrfhuK8tiagdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=LVGBmyz8; arc=fail smtp.client-ip=40.107.159.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="LVGBmyz8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V8UbNon7lx3gVmAOU7k4woCvUD5W/uT3a2K20utaVXC+tDyGzt/Scs7o8m7SborQ9CNbtRxL3IRgdg9PNqbxcrPVlznE9286zGd5aQeGWskEXYwC3SA7f4RA9foQefOBrXteM/JW9QQR1Sh59vWX3/hzPfVGchMmnkZLDwtoC9PDXu55wkD+8WDCZFvBgFKt5kSSDFHOtzig6bDN9ZKg5KqJYxhYfnG6xcusKECF4lSTWla58Cj8DWfq/0zAGumlieZR0/ASNdPTPya5lFRxgrELhhyRIHbBucZ73CrNlPFX3JM2s0UWfcyw20DVLvdrZLhSCKt0W7cYdYg0NOgyoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q8ZrzXA0dmpam0BhzcadAFjj9EqbxqTOiT3Xo0cMBrI=;
 b=vuZIROwlrjfwKqzJ5ENeRMi8Haae6YS1NrR+GTZ89Hm9NEP5QFnRqvXZwdogF12nZnrhvIOuYYULYEOeyhJQV+4RXzT9pkQXapgfMrevYtYrYJ0unCcBDPfkAFYTZkZO/W1sSefEAM7vwCFZAnDBtycDuWjkOGQXliQB3AYozq15IKxBkSFLCoaZ8VB38/gSPpYRqnz35USb84PA5V/+rKryNi3m0Lx0L8Vu9T8kZEii4RU0kY5Yqh+1iNkGnPxc9/iA4Wc+uLGJAjObKdmHDjAUGKd2VHIOenJNNaMdg8y+ifKWoAAkpZW/lD/87z1x53KehGYXLPigqzxSBaYaUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q8ZrzXA0dmpam0BhzcadAFjj9EqbxqTOiT3Xo0cMBrI=;
 b=LVGBmyz8GOuG8lGrhkdIS4r2/2mBVkiu4ISsQIYf4rkYCtqndafhEhqUxjgOM2ggx86CdH27p/pemNSdtgFSlfzcTkZti+p9GZWDZMqphfcpuqBb7ccZAo/bymHS95tTfrYBkvIAlrl5Kjbv85F4pFD/PcCFwLueHd3jYNU2KDzSh4EJej7jNDJcuuYNJhUGFEJhbGeZLojg3+gux4GVXKyoh8Jzt6zK9xfyuKoOT58ZO6H810cWzdoi+S+IlWyT56J8RrFyE0Hy4pZ/lUmuN9lEzlraA3ZeOrIbswYz3O5ZJasPLxebljAHikh3IyZK6bkBqhqXG8/715sdf9fCRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI0PR04MB12253.eurprd04.prod.outlook.com (2603:10a6:800:30d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Mon, 2 Mar
 2026 16:35:47 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 16:35:47 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Yanan Yang <yanan.yang@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 qijian.guo@nxp.com, justin.jiang@nxp.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, Lei Xu <lei.xu@nxp.com>, 
 Xiaofeng Wei <xiaofeng.wei@nxp.com>
In-Reply-To: <20260210-imx91s-frdm-v5-0-b3e9a67d2285@nxp.com>
References: <20260210-imx91s-frdm-v5-0-b3e9a67d2285@nxp.com>
Subject: Re: (subset) [PATCH v5 0/2] Add NXP FRDM-IMX91S board support
Message-Id: <177246934478.2087968.5103466983284218507.b4-ty@nxp.com>
Date: Mon, 02 Mar 2026 11:35:44 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SN7PR04CA0117.namprd04.prod.outlook.com
 (2603:10b6:806:122::32) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI0PR04MB12253:EE_
X-MS-Office365-Filtering-Correlation-Id: 641a0726-6dcf-4ddf-8eef-08de7879c21a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|52116014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	EIrDxS1d+PQQ5asSgQJ7GdarShB3rBFYT9K5aHfakr60t4cBN7t5QGiYCoThrLh8U5S+jR3oKpqd8otlq6GJ/Cz0eMeXBnQBEh9ixxGAMn3mVztQrQ1X4NDHpEXOQmlCPq3RKP4K3xTTzl5pgrcZIDYeG+YT6a01CPB4aPxjSnIOhts00AmwL+y2ql7GAIVz47dKJzw6Yl/Lcj4yN6lTWflxRK8oFvVw2UJHgk32d2k+V2bS4kgfUcxuZivB2Q1gFJ7uveu7Fea+NR67N4SDXhB3CWggSSZwp3l8WDibOm2ZhB5OcdFTafTt/wWpmOsf/iQ6qmw+BliykV0N032yFZAu+OAHR4VHOPXB+UleWe11r4XMZJ/v9Oyk23sd6yHzcb/RFxikvqbriRv0gsns6Ajes2GP5FEPZOxwRENt+OzsUmKhbV4HU/+wrZn0ZXKGBTsOl6KV5AmE03MgezBhxc2p776hGDmlk1A8E6tX4SakO2jbGRlFFBLFU1flxSeK7HKEpef3IjpsIhxA1rz8vZvgFMA4itTNM/gKAd3BXpJZuJkrWSgyT4QAkOXWtjFdBq8RaFIYHPk59KQIVOkmyH9nyJY5uhr+1VGUp2sMKp/QOk4Hj21tIN9RFdmGLJfSYSdsGKFBlrGobVW4oAPV3UPTGMdyIlajoE4Eu4hOQr+v1HJPtYKj8wB7BXAbF8QrKhoLooRqv8UxhRetW3UV9Q5TW4wAbMLgeIWc2AaViSsxWQd2wMfYdlDDZ7LsRdSA2y0QFypWGOO8zq4LVIvSpp/jb41ZFaAD55zbXYPI1Xc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(52116014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGFNMElIUFAycUdKRHZUcENUUzlScGJqbVJzMEZnUGduV3FnRmt6Znlmd1Y5?=
 =?utf-8?B?NFpsWTEyR3VRaWpPS0N2b1V6OWVFbTIvTld6bC91emRiaU1LYUw3aUlzUFd3?=
 =?utf-8?B?QTh3UkY2NUNTSXd1YncvK25MWUFuNDJyTm4zeGVMcVVqMURFbm1yVjZUYVJI?=
 =?utf-8?B?WHBlYXJpczBpNjRTTzRYQTNhQmdkV0FVT21OVFVuTnh3MXN5cGpIbXpueGha?=
 =?utf-8?B?UC82dDRLZHRxZE9xdmtFZFZoaUFuR0xBV3BRN2pKMUtUdkFUOXMySDZlOThl?=
 =?utf-8?B?UFVRak1zck56NDBoWVhyaEdGTVV1L1QyMUtwNzVyVzJnZ2RDMEllZjFCMzNh?=
 =?utf-8?B?cFhIUjBlTXkxTm5vbEk0UGdKME50cFVJejFjVWdXbjF4cWdOZGllYk1Cb2hC?=
 =?utf-8?B?RFUxTW1oMEw3QS9VUVFjRE1ESnhvUEN4YU9BdENZdG5zTC92SkhybzBVYXhw?=
 =?utf-8?B?U1ZUMlhoejcrTFVOMmIzR0N0aXl6dURaZ2M1ejJDQlRobnQ4OERhQlhYYWpD?=
 =?utf-8?B?N2FhQUhZVHNLRXd4aXl2allYRGlTaEVPUFB1eWpoWktGUlpWTXp4allRQWpU?=
 =?utf-8?B?R0JyYmkrcENLSUUvRkRHejI2YlJBc0U0ZDdlWFp6MVlqUXYzOTZ4Nlg3Skdk?=
 =?utf-8?B?a21odmU4RWFZSlUveTVmRUx1NHdGZnZ2ZUZMUHMwRTdqbzE3ampIY3NtY1A4?=
 =?utf-8?B?b01pd2xOR1ZlYzhrd1VPMTduNHhKeGtxalhIaXQxNWVTU2w0dlcvcys1QlRG?=
 =?utf-8?B?Q3pvS2c0cndKL2Z3VDVWMURSdEJjQkcyM09yUGZkOGVXVTc4ZFBQVkx2UkZj?=
 =?utf-8?B?bUR0dU16c2xNOVBQWlhteFk4Q3kzYmdpUURqaGs4R2xadEZ5c2ZkcTl2dVBw?=
 =?utf-8?B?VWdFVHNrV01KQ3JZdVRWWENSK081NmRIaDc5eUNmUkdHVXI5dXlsWnZaK2hX?=
 =?utf-8?B?bmR4Mnlvd0Fxd3p6UlRScGYxS2hSWXJneVZaTmwzVXpaOCtTNXVPU3VBNjN1?=
 =?utf-8?B?VG1ES1RFeVJmZm9RZDczd0tKRjFSbytKQVVpUVc0MHROamd0VnkyM1Q1bGNF?=
 =?utf-8?B?dmhDbDVYYnB3anE1WFpSTVNmb2NCSm5UQzBWOW5tTHQyZlppUTE0WmlGcy9V?=
 =?utf-8?B?MHNpU1RUOGNIS3JncHQ5NWRQWFFsOHZCZ25obE52b1dUOHJrM0RYRkhFOXhx?=
 =?utf-8?B?c3l1U2FxSm1JdVpReUJhZXdXQ3ByeHB6N0NyK1lzbDJFK09YaG1Rend1MWV4?=
 =?utf-8?B?MnRuSlkxbWdCMXhwYStIMklSSG1Jbkw0MDZHbUs5b2t2VVZyMm9zQTBueXQy?=
 =?utf-8?B?djB1NVd5T3RNYzhxNG5vbm95Q2hvM1lIRlhqRnUvVjFlR1hmZGNnaXRsZ1VW?=
 =?utf-8?B?OVZVUlgxWnRzNDVVTHlLL0doWVFwN25oMFRSSWZ6R0QxcjJBa3ZzWDk5UnBH?=
 =?utf-8?B?a3BzNUxCa21VNkJxZkNTZ3VKaXp5aG5OMHU4NWRNcWc4K1YvZUV4Mk5tU3VF?=
 =?utf-8?B?L3lETWVJL0NvZmNrYk4xQS80NFB5K2hPdTdidktiUTg4YXBwSUxyQkxrVHRp?=
 =?utf-8?B?SXAxbzRTU1pJeHNBc1YySFdqaC9vNDBDS1hwVno3bFI1dm5GZ2NFNWV6V1Z6?=
 =?utf-8?B?d2laMWN5QUUxVWdVTm9lVG51V0xwMi9mN1pxcmM0TnFuS016OTluLzRBbVRv?=
 =?utf-8?B?bWErbmd1SDgreFdIdmhaT1h0dFJjZGFXdlQ0MjJRZVFlWFIwSHYxZlMyWlVi?=
 =?utf-8?B?TGlVeG92WjMwN3NJQUY1VXhCKy9MUFZqQjlkejYyb2x3YnpmWjhJUUQyZVhV?=
 =?utf-8?B?emZGTlo2SHJDdEl3aEZrZkUxaFNPT013SmtOZS92SGt1YlJGOUt1ek1vbzI1?=
 =?utf-8?B?Snd1RGREazd3ZDI4Sk1IMzdKcnhicEhDcVY0WVBoazJuaUZNRjZXMGlsbG1J?=
 =?utf-8?B?NjdKZFAxd01qVmd5akNJV1Yrb3BOYXRBRkZOeDRlbG1HQnVsTHZHbHNjQ0N4?=
 =?utf-8?B?ODE2akVTNnFUQXVoc3Jtakl1d0NMeFUrdkZ4eFplR3pQazZOc3YxRUdxN0JR?=
 =?utf-8?B?dkdXNlZWMXBURFRSMmhwM2RKMTZHcXZ0a25JMlVIVFYzS01EM2owTVNXbmha?=
 =?utf-8?B?S0kwTVFuVGRLN1MyM0J0d2s4U2ZEaUdOR3dGSFR6RlhUSG5leTVkWUtsa2xT?=
 =?utf-8?B?dFhvbnNpalNsUnA5NmVmUEZNcnFjVTA0a1pPU2dFeTA3ckZhWFFDNmJtZEZu?=
 =?utf-8?B?aTduVkVHNDZEVFdtcVNhdUMzMzY2c0tlcnhVeDZUT25udktLSTN2eG0rdUpj?=
 =?utf-8?B?Q3pGY1grZkNyZDZRbEZpUlkvdDQyOVRrMjkrZ2gzTksyZHlzckdIQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 641a0726-6dcf-4ddf-8eef-08de7879c21a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 16:35:47.7719
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qD4bx43QFYfNyl3J/AhAWZxRyCDo2lukjo7HCAWTTTybGYICZHKyzeA4+tQfeD/vImdjuJUqLAFC4nWU1LMYHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB12253


On Tue, 10 Feb 2026 19:47:53 +0900, Yanan Yang wrote:
> This patch set introduces DeviceTree support for the NXP FRDM-IMX91S
> development board based on the i.MX91 SoC. FRDM-IMX91S is a cost-optimized
> variant of FRDM-IMX91 and differs in several hardware aspects:
> 
> - 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
> - 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
> - Single GbE port (FRDM-IMX91 has dual GbE)
> - PMIC PF9453 (FRDM-IMX91 uses PCA9451A)
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: fsl: Add FRDM-IMX91S board
      (no commit info)

Best regards,
--
Frank Li <Frank.Li@nxp.com>

