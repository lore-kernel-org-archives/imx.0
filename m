Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010029.outbound.protection.outlook.com [52.101.84.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B353F333729
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 20:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771963925; cv=fail; b=cmY2Saewo3DKOrSmn50oTIAmsVuuBxVDffnaqYQx6gif9kzwSQ8SUPy6p31FEhRI2v29dAU3cNYz/QKJ/CdXg1z0Aevb9W333SLxEfip6yHJmh/7tpJJbq7L7nUvDBvx54Lwk74qBBWUXGe+DN4c/gpte8pURIYLWi+eZra/juE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771963925; c=relaxed/simple;
	bh=SG1xDy/salNS38JFEYTRstB2LGXmxT7lf4WJbLbI75U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b4k6CMJXbvMjU9IRhKAeE0yWPpHgwBrOw9bZDtxARouxt0lDOC9pWht4BT0WWMRy5KVbdHQ2c6NkdLurhkraCeWZ1vb0KsffqFgfnh/v5maFrqmaqkYi6nqpvIaVEWC7Cf2de6QqoOhegcHX1Q8JR/oIA1tAo9HkCloHsn0nRiQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=BikwRzAD; arc=fail smtp.client-ip=52.101.84.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="BikwRzAD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=joMaTFkaLy3mpEuHJOKlL/IcTmLnxZnb+JSMHEaNgL8fYjTCRNA+WTtkcwVbLyBA8in8XryB7Cs6t7206ytYvfjbVsTJqtUg6xVTZOH7Ib9hqrDgWouKrRxv5N63uOwRE/2HIpxggvfG8GwOPcn/s/QaD5URWfJMVqv5jQ2JW3cb344o9jb0IRebEE164FEyNXP7/HCxtae/dulJdb9IzUi0uKQ6JAYaiWYCmanOcZtDklWsLHrD1Wht6bZ53MIz44iTGK8st+sOo3a9CyKw87z932G5zoPbCMXlRKkmUNgqXSt9+ZNmIC3+ewbUBL3u81KBqa1Yz2llaEo0M++/YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ccos0ZDbUYV0KrJ1/b0MTVaiZY0hFiVRWppwpr1oLTg=;
 b=UHGpmPGt3/7o2J8ScV2bE61vPXnDRK+niyMzReGm0Jo74EqlH566t1qgHPsyVhNgjDRr5d1gVdXxFVLA4gX6gQvvMFlfgaDaaWLa9uib683P0rIbwCFbWBMFpDt8YIaKPjIihMZw0ez67FnnaQZlMx1C/VE7QlW7c84bgv+FXti7V/C7XGyqSRUZ4jqVwlWeSH7g2Vdmis+C0TaEI+DPtbFG5JH0DI216fq9egL3TbzlX8us2muRNYUsGP5PBiUTvycPN4vNonyVvy5TuryiXZ2xiS55OK7LGm+YermIOrZDcBxB7xfbRuH1yMq9Gwl1hGlKNbwuX3QTdGnQNIPOzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ccos0ZDbUYV0KrJ1/b0MTVaiZY0hFiVRWppwpr1oLTg=;
 b=BikwRzADKRFMw1eBOKsq6/dfSRr8CGeLps766Gia1YNwm9ijYFoi22uw+4cm0sxKNDNbNmc2fW+eKPfyg44j3H7Ht2LhqPzLlyYtuaGOuBV2T3msxC/uEn0WBLagCubTp8GQgP6WiF0A3jdQMGdu/MpO1A9rcNhSRMOHRxr+8oEaIHPi0iO35xYiQeZWQBVTS8VKKUOdk6EuzXrYBnOzkNjhstxFUTO7wT0L1akvMgb7RgQnRvSyunTF9STeHa6cAMumDTJbocF5Jw7pwROAz2mG6+1QzgFRakYX10MdXw41p7pGU1vROjiU2QS50EOa8hjruJACluosC8UL5uzMng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU6PR04MB11159.eurprd04.prod.outlook.com (2603:10a6:10:5c4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Tue, 24 Feb
 2026 20:12:00 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 20:12:00 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH v3 0/2] Enable AONMIX MQS for IMX95-15x15-FRDM board
Date: Tue, 24 Feb 2026 15:11:41 -0500
Message-ID: <177196389534.3265729.1581691241903955876.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203100332.915-1-laurentiumihalcea111@gmail.com>
References: <20260203100332.915-1-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:a03:254::7) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU6PR04MB11159:EE_
X-MS-Office365-Filtering-Correlation-Id: 2edf7d3d-81f5-487c-f085-08de73e0f7d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?anZVRkxicTUxSUttYmp4cjEya0t1bTA1cVlUeFUwQnhWcGNIbW5laWpSNWg4?=
 =?utf-8?B?SGJlS1ZDeXZRa3M1VGtERmQ3TU82ZHViTG0vUXQvamVkZEJiV0JlTEovNzNJ?=
 =?utf-8?B?YkpYdXEzS0RGaEpmeloxT2REQnh1Z2t6UWlyYjRyQTBjdVA1L2wyajloSWhl?=
 =?utf-8?B?NmJBUEcyT0pXcmhSZWpia2prR0U1c2gwNHFEdFZTNGY2ZnV6TGswbTBsZlBq?=
 =?utf-8?B?QzdrNE45Kzd6b09XWXZ4WjJwWmRJdU5LSUQwTFRYQzkvOGdxMWZ4K3NyNGRl?=
 =?utf-8?B?bTc2WmxaYjhvNFdRWFcrbGJxNXJSc2IyNllVWkU3YjdRbjhBYjBZUmthVU0r?=
 =?utf-8?B?YkYxZTU5UE5MTWErdHIyMWUvNlowcTUrYWtmWWRnVkRVc2FJNksyMUFXVjNO?=
 =?utf-8?B?SmdZNmNvUXkwZVBteFlIczFRVnhiY1BtOXhTL05MV0FYUHVzWTY3OUxaS2JH?=
 =?utf-8?B?L1JMYW81Y2VzYkU3Vk9QMGZ0R3RRbEtNSDVhYzJQdUJHL3kxQnhGZTB4Z0ND?=
 =?utf-8?B?M3FUbk1FbEEwR2Fac1BVSU1vb2FzUWwxbW05YXBML1BCeEdrVklDUkZBWC9y?=
 =?utf-8?B?TE1nQVNVNjdHM3kyU0pMQWd2NmI0WWZadkJGUkthWnBLRCtEbU80QTIxcUJN?=
 =?utf-8?B?MjM4L01pV3d6bnJKcmJMTnU1dmpabFVNYjNDdDJOMFVsZWQwekRQV1hldmpS?=
 =?utf-8?B?Y05qVGd3dmVNVW1QOTFlNEI1eGVpRU9NMEZ2VmFWNlJZUXVrYlhkazZtVFYr?=
 =?utf-8?B?RjRnSkZHQ1gvWHJqOUVka09sUHdXbGhueXVQSmlnZUVoTWpyUzAwQUp0TEdr?=
 =?utf-8?B?SWpMRVIvVXJ4VnJNbzFhL1BXY1h3dmk2NjloUmxjVXJ0UnJvN2lmbjQ3a0U1?=
 =?utf-8?B?d0Z1bE80VHZFcThNRExOa1pJTjVhZ0t2SHBVdnE2ZnQ2OUVzNCswck1kcGZ5?=
 =?utf-8?B?ZVZMeDRIWktuUkxsVW9rOEk4ZCt3VHhsa3dCVmw4SExtWVREaE1mNDR6eGQ2?=
 =?utf-8?B?L005K2xmTWpjMFl5TmlOU3Z2cmxsYVh1dGxPMGZpb25WQTFZM3VQUWZoV2Js?=
 =?utf-8?B?Y2lSSXp5MGg3ZWlhdjBZZHA0d081cWtwOUh6SHBSL2l5NndtOXlYbThjOHZJ?=
 =?utf-8?B?d2R5cWhmZCt6cUhGSjAwd2RLVHhJckc4SndOdnJObWp1c21RdVdXbjE0ZnV3?=
 =?utf-8?B?VlJFUkNMQVVZZzRla2w4ak9iYXpUSlBPcndRaWoxWmtOUzNITEZoWm9mUUR3?=
 =?utf-8?B?V1NKY2FYL1lIR05JQ2J6dDgxRkNiY0NpMmNvd21ySkFIa0ZXTE4zSUJydjY1?=
 =?utf-8?B?RjBvQjZZbTgwY1NBOWFTMzlPUUg2SlpGLy9vLzZWUElyTit6WmlXM1dOUGxx?=
 =?utf-8?B?RW5TMmQ3RWNpNkhqUVBXOUUza25jb0xuajRHcmJNNWhJdGloUjJremo4czBJ?=
 =?utf-8?B?U3ZvcFpxdlcxeFkxVS8zT3d1WU9LSmcxbC93azJFRlN4bWttcUJFaWZVTDRR?=
 =?utf-8?B?Zk9FNEt4MlhOcVk0V1dBZmh2VDhBcWIvMklRM0ZYTHM2U3pOWFF0ODgvWm5P?=
 =?utf-8?B?WUFJR0RMZ2lkRUdXbVdDdHhXZVFaeThBYTk1b3VGalNCUzAwa3B0Z1hWMmhC?=
 =?utf-8?B?VVMvYnBxMElhWjgrMm9iQmw4SkNETEl6OVJGSy90ZUFlejRVWEsyMDRnYlV4?=
 =?utf-8?B?WGx4azIyU3h2QkR1Nm4wNER6cytYT21zMk91TEh4UHNkRjhsc21nVDBYWXJB?=
 =?utf-8?B?NlNqV1hTZ1pYSDFNMldqVWtGM1JoQlZWQ2tieCtyUGh3TEd4Njc5b1lCeGF4?=
 =?utf-8?B?dlRLUFQyMTJtbDhiQm1rM3U3OEt4cTdXckxmZmxJU3hIa2FTRklKYUdTL2Jo?=
 =?utf-8?B?Q1JsL2ZGSHBtR0NLd2VTcVNieHM2RzNoTXlTQVFsOUZzRXNEQytZMTdsb2FD?=
 =?utf-8?B?dGZ4cWZjRjVEUVdseUVJMFBXcUlGZXh0YWZOVDlHSTJyWFBTR1p6TFZnUjQr?=
 =?utf-8?B?VlgzTm5UNVhOc0wvVlJJOHl5UG1DZUZZRk5IbEtjVEdDWjExUGd3ZTdCOHZM?=
 =?utf-8?B?UlFuOW1yaVc2NkFOZ2dMNXpYYkc3dHRySlhoVndXZFJHcW9OSlVhTGhwZmZz?=
 =?utf-8?B?MDZCVWtSZmxpVllnY0xqODlaeldqaXBveGdZZjNvVHFNSVN2cHUwS1VsdFV0?=
 =?utf-8?Q?0g6aSJvPuSjYGy3sHHw9X8k=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dnUwejJ4dDdhdks0dzJIK2xTM3Z0WW81L2tqbUVlSE5jOVJxOGpuTVNYajRp?=
 =?utf-8?B?TmFqRjl3ZjVmdXFIa2tGZnVCZ1QrUDFieVlCLzBnZU5lZm01bVhLcVNKSFo2?=
 =?utf-8?B?YlpTV3Qra0tVRE9Qa1RCZTJudWpydTFDcS8rVVZ1Q3JZRW1RVkhtYVlYdmRv?=
 =?utf-8?B?SGU5cGZ2WWVZbjkwdW1PdStMVkxCdlRtMER5RE5aQmZJMSsrY1pJWHJhc0Rj?=
 =?utf-8?B?dXFKY2ZsSFRMd2xwcVBia1l0b3pVeG1OenRmR09YR21nVklhR0FtVzFlR1pv?=
 =?utf-8?B?dUQ0ekhITVo1NUNOVTRkVjAxVjE4RmZmV09Yd25uK0RnVEVRNHE3WWsrOGI0?=
 =?utf-8?B?ZkV4Z2pjVFJQSFpNNWN4NDFTZW8vazBMUEVidTYwVUppN2dqdjZ0MXFIaUpI?=
 =?utf-8?B?cnZNS21oblFPL0hRYU16dzVoODBBMTBqTldQdEhXbXZXbXppM3hjTHltenBS?=
 =?utf-8?B?b1pyaktkOGg2b0FmYlZTM0w0VWtHWUlhM0NGc2FaTFdlempUanYvSjhyMDBY?=
 =?utf-8?B?NkYzbUdhaitZZDhtd3VZTUtuOTNqelZObVpDbkpwOHYzUlRhSnNZSHJGdDA3?=
 =?utf-8?B?V0dzR0N3b3A5eXlBRmVBVE5xZFI2bzUrKzU5dzFLQ2xoUisrc0ZMYlJncktV?=
 =?utf-8?B?dkdKdndlMjJoRG9KYnJYbm81SHlrVnhROVVieWl3NmFRd1ZiT2s2Z0doMGt1?=
 =?utf-8?B?d2RZU05FRWY1VGJzWlN2NFBCSkZWTUdQMS82akNLWmFwendaK0prdGg1d0l3?=
 =?utf-8?B?ZEk1dktqTmtqZHBibUNyb29VTFBtV0NEMFVzeHlCcGw2UzBJMy9HUzlqNEFs?=
 =?utf-8?B?MVNqN0NQU04zaGhSZy8zN2VHWmw4c0hRTGhJaWh4QThPK0FnUHNxMUV1bVZL?=
 =?utf-8?B?T1BGZHlOVERJV0c0S1N2S2JESThjWCtvTFVvdWpCL2o1eEgzZHVtcUU5dkpw?=
 =?utf-8?B?aSs2amF1UWVWcExubzhYMHBZV1ptbGtGNnhpQ01ZWFRxbTcwVlk2aE82Ky9m?=
 =?utf-8?B?NlRKb1hzNWVSaTVwSUwvbjYwMzVlbjR0NitoU09maEdiMUlhRi96Y1l0djNL?=
 =?utf-8?B?L3loVkdqcVNnUTBUYm9CVGRDUzNzMjkzUkJwODZFc2NUMHdrV2F0bHdvWmlj?=
 =?utf-8?B?dVJaTU1DbmpjQTU2VGxoWlN1UDBkay9rODVPdVh1a0pyUUx0TXd0eGFJVGJW?=
 =?utf-8?B?ZEo2UEUvTlJmQzlLRW1tMmNMZnVSdGhOZFM1cGx3ek0rL0NDeGxycnE0MHIz?=
 =?utf-8?B?bGlvSUpKWVNURFhMK3drQXNwMzlQanR6VWsvZjdOQmFOOStZd2ZUQ3FiQjRk?=
 =?utf-8?B?bE5xVWFSNEJkV281bnVQaElqTTZkQ0VYUFFuRVFSQ3E0U1F1WFIxbEltenda?=
 =?utf-8?B?dCtpczBENXRXVG1ybnVuSEZ1NXFOUlZ3NFMrOE82OU43RThLRmlLa2h3OS9K?=
 =?utf-8?B?cnEwbGltVmQ0d0tFRnorVVJySjJKK2pXSjNsQUExZVk5dWZRV0R2K1Y4Qzk3?=
 =?utf-8?B?MkZITTg3Y2FndnUxMm43b1QxTUttUnU2ZzlwUnhIb2lzOTZoVzI5NUpBTTZM?=
 =?utf-8?B?UmovYzQ0aERJT1N3b2lqajRsT0hhTEMzZVFDMW53Z0xQQjBielNYd3NpcXNT?=
 =?utf-8?B?VkN1aThxdlM0QjR3OFZtdlI0cExkdnJqWDVxTGx6Y202MkNjUmxqZEhhMVBB?=
 =?utf-8?B?ai93WU4wREhQMFF3d1YxaVljU0JQMDJuTE5PNXdvZWwxSDhnbCs4NzlOSWZX?=
 =?utf-8?B?T1h0RTVYT3RmVXR3bHRXOElmOFd4RTV6WXhmTThHc0VXbGxPVThqd3Q4UVRP?=
 =?utf-8?B?TVc3NTE5Ynhvc2phV3lxbFpvSGxaT3NIQVN0eURLY0tUQjVwYTlvZXVFcWpo?=
 =?utf-8?B?RG1OTE85Qk1zQnNobkJ2RTU5bVRDQ0ZtQ3EwS0t5TSt2NmFPRUhZd2R3YThE?=
 =?utf-8?B?VUw1dFFib1hwMG53WTVqaVVIVkFDbDAzUU9xNHhSTmVYNGhCMDB6YVowckJZ?=
 =?utf-8?B?WjJ2T2NkbEw0SGhUZE96S3NCaU43L2k2QW5HV0t2RVNoTEJ6UTBPaGFURmQw?=
 =?utf-8?B?SXRiLzF2cnlUVW85RVNTM1dENHVJNzVrQ2YyZk42Y29XQnR2TzF5dGkwM0lU?=
 =?utf-8?B?dXAvQTBMVmh2Vm95eWZPdFd3Z3dIQWY1SDF6cCtEMTUvdVJlTFVIdkFpL2I3?=
 =?utf-8?B?VFdFSENFdyt0bHBMMURITG9YOXVuSTJuN085SCtpZVJ1c0JaT08xZ0VLSGUx?=
 =?utf-8?B?NHJremFXZy9rdUh6UExlTmdlQzdGSjJEVnp2SmlqQ2pZaUc5b25IQmZHTG52?=
 =?utf-8?Q?eqUBEon5xJCzcPmZQc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2edf7d3d-81f5-487c-f085-08de73e0f7d1
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 20:12:00.4630
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CQr8LqnZArHkwh3TiZ5AfX8pIrW0pyh+xAP8DE7Kf6XyobW9NiewKBdDEoVgO+7g5eqcxx5fi36SR4HC5/Nhfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11159


On Tue, 03 Feb 2026 02:03:30 -0800, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> This series enables AONMIX MQS (i.e. MQS1) for the IMX95-15x15-FRDM board.
> 

Applied, thanks!

[1/2] arm64: dts: imx95: add AONMIX MQS node
      (no commit info)
[2/2] arm64: dts: imx95-15x15-frdm: support AONMIX MQS
      (no commit info)

Best regards,
--
Frank Li <Frank.Li@nxp.com>
