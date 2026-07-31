Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013030.outbound.protection.outlook.com [52.101.72.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64603EBF3B
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 10:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785493106; cv=fail; b=BdtJkFxue5PZ7HViGh7xfsDt23KuIHheKK1ZCd9Fr39dW1IbbeyiYntzGnhHiFcnbsFDHOmqVzdB20qG2cRKp6ctHU4mdTx808HVtRfVBX0HcOn7OVX/cDRYSiM8LJJVMDhbAm3wOqeWWoI42dQx1G34L5LOCfGSim5AcKTAz5M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785493106; c=relaxed/simple;
	bh=JLRsnlhn/sukVVwNrFEnK8UaTCT3trCLtpUtOdWJiu4=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=sAW6C9KI+QibseAQy6Vt8LRikXYDnQl84/eLG2FR91DS1IppOby0xehCkB242fzgKnLzTflSJQ/76gtz8mEm8Ju6weT08sL2c3jjUdx5qIjZ2oiEDIAzr9YyN3wcBZmLpYvm56COkFnS5JfXG3jDamNtBiTb8rkaPupBA6nTKlw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=AGJuwW9g; arc=fail smtp.client-ip=52.101.72.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="AGJuwW9g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lFdbiGWwRFCfwM9+RsMfjrmSTVtCYThOUlPam4KdJ13uMGrjMTBAIoIKxSxSZ1OjqUkczVhL0xm7Ed1JQAd4OG2lx6146SZDfkUA1gk63q/hf5XUxJthAmmQaXEPhlmSd+ujmdLLWZXpcfbndBhxMGbJSdNA5Ws8EKEzlPgYoFUIif5irluznRGXiFmm8qDy6xOl+RNp+f/ObSdzIitp2ROvF6aIk9V1ufZWKdylH1oFJehAcFIZz+ZKOc81WB4/Ta+5zqPtMw63Lf33HzNKHxezSlgrnjva3yzik86mYsKyWWsJrD091H+j9GvmGFxlLZ3iSLny5co4ZBsutcZFnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHXFSP/lve8sZOngtO/VzaKSOf7ASXU1MZK7Sae5pf8=;
 b=HxygFbpUTsib3ACbeIA9mDBAtcMFOBG9Rc9NhD+VdLN3cm7JIxN0Fij7Yuh71JfbnAMKoGO46oKHodV9LdQ4mNVMg/YUdBwm13bgW6XVsZkK/OoWpf47cjIu6G+bDrTgs3XdOUbIJsGlM0TXMIyCl1p4BR55r97qXVqFfwgvU+Qs8Bbh2dPA4jHMkogoKQWDWlCfPoObk0TGJAkKvWZbWbwIu/LbxjPQZA8TAuet9cQ/Zf6qOEZdZWAkEXGktRCuD4zl49B++UG9JBD6wcCtJntWunX5aDf7XrIlBdC+MPrMVxumw4Jqw7H9HujdbHgj2fZv08usEQktU+gdR34V1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EHXFSP/lve8sZOngtO/VzaKSOf7ASXU1MZK7Sae5pf8=;
 b=AGJuwW9gGNbhJPcdNBRxdRjDDbaNzsombapvXrHEOPUnq074tSO5RCUD7xQusIzTHKDEzlHbbPxWY88JqrmpBda4zA2uGakJ12W4UrwDpSp3cgbS9NiZcavMDWddRCGpHGTphtL84cfiZofvNaCQBEL5Vj9Uhsr0DUXyXeI3f/syIrGgQvL1E2C46UzeB4VA73+Y1VI4MnWeJmPPLRSr3MZOWj7O4aieLWoqqZI/4+XHKyYvvMGLJWLtuQ6weGC/gPqBKnR3sPw2ZkieuxDZYZPZfyBg6sNzuGzQD133spn5+bLsSfthhQFMcFymMsi73aCBFBnQEi+e2HvOFUNyXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by PA1PR04MB10179.eurprd04.prod.outlook.com (2603:10a6:102:460::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 10:18:12 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%4]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 10:18:12 +0000
From: Joy Zou <joy.zou@oss.nxp.com>
Subject: [PATCH v2 0/3] regulator: handle regulator late cleanup race with
 PM suspend
Date: Fri, 31 Jul 2026 18:21:42 +0800
Message-Id: <20260731-b4-regulator-pf01-v2-0-a406c8737fdb@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADZ3bGoC/32Nyw6CMBBFf4V07ZC2FhRX/odh0ccANUpJBwiG8
 O8W3Ls8ybnnrowweiR2y1YWcfbkQ59AnjJmO923CN4lZpLLkl9ECUZBxHZ66TFEGBouoHCGnxu
 jla4kS7shYuOXo/mof0yTeaId99BudJ7S+nOczmL3/vVnARyuVhSicoUyTt0DUd4vQ27Dm9Xbt
 n0BcF1uQsYAAAA=
X-Change-ID: 20260716-b4-regulator-pf01-5db03fba4a92
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Joy Zou <joy.zou@oss.nxp.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: SI2PR01CA0036.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::22) To VI1PR04MB5807.eurprd04.prod.outlook.com
 (2603:10a6:803:ec::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:EE_|PA1PR04MB10179:EE_
X-MS-Office365-Filtering-Correlation-Id: e7d0fce6-1735-489b-ca67-08deeeed06b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|7416014|376014|18002099003|56012099006|11063799006|6133799003|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	8UAIeRgoqG518QVViwXwYRchXhHEMKfzK4ebnP+3zEOfjmUguXlljq5kMvNeBIYab+jHLp7MWd3msIYU3x+oV3M0Ne+eflzup15Az/vpIfcF7drr6oDYifLDDhEAj9tgYesuDBAeTItkzdinhJgmur5/9qUdKvJ11h/qaAUu0iEJ+Gsj30e2awJK0tnxgoCdB+6/lts7td6JfNB0vJzytBBs8S+Pu1P1GJIoavQstEFl7DgYZqYH0zxrDnLkesWAyiJk1sBmq93IWlLHmiVUYboveBarCrxezEayBrRzMUoGIRcWME2MVE7iLDlSDZW5w539Rr9ACC2/qYJzPi0ntCUvzaQxSdxSmWq10gLEaMiSBEQORYvFucvnoUCR3/pnKvG8UOXTBVYXwTmjIp6LeAee6xPZ3kxis/145kitZGtSyiHXvYCBPUkMn+A3NidP9PV9nLqzBv3GaAw0bTJqU502NLYkOm56Pcm3vdEutjVshSV6gYIOqJRF1tfUDpgM7nyPa5VU1CZQIrJexSSs5fbd4IEpo4llsVFD6GrdxO9e76HuRTXdGlZQT2IjSQ/mHQoQqYhO7RCmlOxWyIyTtVixFS7+d3QN26DgQZ8wZISI/kmpd0bXU2DEXtEQMimVRkPEeeR3IEagLkicwlRBFilLOBxNhhj4SVK6pGE91Fo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(7416014)(376014)(18002099003)(56012099006)(11063799006)(6133799003)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q0pJUUdEb1lwbE5SODd1a0tuM1h2NTN4Q3Y0alhKQW5QRkRoWkF6ZVFVZ2hL?=
 =?utf-8?B?MG9DTXRyYitkcnVvUm9JUXhhNUdYNGNId2pscGMyRGtBMXVLZFJqZmFHS29I?=
 =?utf-8?B?SXRiVkYxSy84eURVdVZRYkwzTWJDMnpJSjNJaittODVmd3BmQ1ZMV1QrTEFL?=
 =?utf-8?B?b1ZucGdQUlJzYk8zcXhMQ0l3VnNLMW9xRE1TQjFpZkJvN1BVTDNvcS9HUnhT?=
 =?utf-8?B?b1NMU2cxM0ZTak5PRmUvdWtTWWdqcS9ZWXd4UHpWdWc4YUVBTUtsdmVGbGFK?=
 =?utf-8?B?YnZyWFdsWHAxVWtvaHBESlJsdHV4elV2cVg0eTF4OHlUSEVtc1RMN3hDd09m?=
 =?utf-8?B?a2lNc3VRdkRwTTFaejFGRkpqQ1VGb2RlbDBSa3ZaUDRWazJKYWVtT3NBNExP?=
 =?utf-8?B?TllYTGl2anJ5Wk9mU3JxZWFvKzVvS0ZUUzhaejNBN0tIN1RwVEsycjI2V3Iy?=
 =?utf-8?B?MXFiaWgwYTNJa2RPU2trQ1p0UWlEZnNrYkV0OVpKc0txbVZtUnRkN3VLdmxX?=
 =?utf-8?B?ZmJ1aXNNMTBRVzZoRVkxL3VYMU41TkFsSFd4V2RaS2R4Tk42WEJYYzhyK1NK?=
 =?utf-8?B?bklSdk41T0E1aFVVWGtXcDBXeE4rUHhWYzBQOTdwdXV2Q3VTUDlBL08rbHo4?=
 =?utf-8?B?S21ZTlFPMWxxbUNRdmFOVzFwUFlxSDNaVERGOXRxQlJGSC9ueHpEdkQ5SFNv?=
 =?utf-8?B?Z0diWWZOOXFYMmFoYnVmTlhXY1YzTlN2QkhpQnBudXdOM05PaWxBa29Fa3Y5?=
 =?utf-8?B?V29mcjh4UUg5MjNUUVFUK0RkcDFpWDFxQ0hMZThKeDUzcFhwSmhEWTVIN2Jo?=
 =?utf-8?B?NFJKM3VuYlZJcnNMU2Q1ZlRLc2NpN3NLSGVsUXFaNlE4TWQ4UEhIZ1E2ZWZE?=
 =?utf-8?B?T1dHWURUSGxpUE1MWDM1bXZKTGExR1QyeEVyWWROZDAwdTI5WlVadGdMaS9H?=
 =?utf-8?B?RmUyaHdGVHJqaTM2b2xLN1FiVWx6cU92ZkJtUE1kUis3T2ZxMUNxVmM5VEZw?=
 =?utf-8?B?aEFSTkpDL2tOdWcwRTlJOFhYeTRDMFJ5MmxmbVh5QWFCRHNpY1lTSVQ0ZTVH?=
 =?utf-8?B?bVZrZ09lTG5oQ0RDdzZITCt6THdObVNDYVQ0WDR1ZkdmOFl0OVo0L2VjS3da?=
 =?utf-8?B?MlBiOHdMdjdNWlYwdzJoaDRWZkhQUVNvRGU1VW90aW9ONXBLNUJZZGxhK1Z3?=
 =?utf-8?B?QWlWZzF3cmhNeWxOTWlMbkFVbS9QR294dVBWSG1VMXpTZDZjNGRzMktRSzJF?=
 =?utf-8?B?clE1NjlacGxFb0xVcWdGeHhkMzQ3T3A3cDJ1Tm1oNFlSTHU1YlRPMGlGSVpM?=
 =?utf-8?B?eHl3aHdHVmk4Nk54TGZoVTdSWEtSbWVUMHVPcWVLQXBiTkRFUk5GS2lqMHI4?=
 =?utf-8?B?aTQ3TkFwQjhJN2VzSFBUNXFscmNQT3h4WG5iS1g3d0RRaW5FbXU2ZWtMSTFX?=
 =?utf-8?B?MlNySjdYaFdIMTBjQVNNRFJoTGM2WnF4ckZyellSZWM1dzdjVTllZXZoTXVX?=
 =?utf-8?B?cFpldUU4QXFrb05oaHJFdENCRzlaeTZMV24zc1hjV1paUzRZdHZrTmd3akl3?=
 =?utf-8?B?alE2cGd0eGVETGloSFNadUlIWktYeEs5MmxqV0E4eWMxSTk1Z2xvNFpIbU1V?=
 =?utf-8?B?enZWQlNtS3pXVTNxZFFNQlB0YVMxZWxRYXI3Z1A2bW9nVnFVRzJYVE9Kd1dX?=
 =?utf-8?B?ODdmZk13QUM5MXA1c3FmeUlyeFJDZVhMQUJ4YTg0WUJRWHVROTRCY1FjZlM0?=
 =?utf-8?B?c2NqVFI1THpQcDl6N1dlc0toV253Q3gyYk5BcWNIcnhWK1VFOXFncTdKcFp1?=
 =?utf-8?B?dTEwZUQ2dkdsNkhwaXhHanptWDdaNkNrMS8wdDdMMXo3bHZHUzRvWGw0OThq?=
 =?utf-8?B?VWJPaFRKS2p5aUswdjZmbTFlUS9mci93QVN5Z1NtMzJKNHZOMTU1Ymg5OFN0?=
 =?utf-8?B?T1JtK1Voand2M3hGWnR4dWc2TVFENGQ5NkVVckNMblBrTzFWL2tmc1BoTHNR?=
 =?utf-8?B?YVhHTENoekRRRXRpRFp5eGVNMldNV0xwZk9URHdFdnc3OXUwTUkzNWhkQm5F?=
 =?utf-8?B?cVFnY2dmZXY5M2NjMDdrU1NRUXRGbjJobDVGYUVrS0xWWXdUTW9PMExycUhF?=
 =?utf-8?B?VzJyMFZTN3dpTE45VlhRQ0xBUEtvRmdLMk9lWFg3QWJIV3EwUVZYdDBQUTNN?=
 =?utf-8?B?MjZhSWIzdkNzVEN6S2k4MEpmYjZ6RXEwZVVkalVzbW1NenE0NEF3UGxXMmZJ?=
 =?utf-8?B?RmhDN1M1QlBLMldlUlA1SU53U0tMNUxoU1VPM3pWUUZXMmhYc3FOQmU0Tmx5?=
 =?utf-8?B?N1FoK042by9yR2tKNlNmTzkrRjIxclN3aE1sQm8xckxjVzE4ZDdGM3FuNVNT?=
 =?utf-8?Q?1sZqmPEhyLApbwyOOnITyK81/eQJNGdKwIOO/?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d0fce6-1735-489b-ca67-08deeeed06b0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 10:18:12.3967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wlvko/SsQwG38ZYWQWy3ZwgaIJSWYWUjhM6HFWmXSZWNd0ahPtFQhwDRQLg8e29DUYA14wQPCZhrZWJ9aWeYnp29ABpYht1O+3uyfXMfmmwF5ZiD7ALqGIcEAPAe4t7P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10179

The regulator_init_complete_work fires ~30s after boot to disable
unused regulators via I2C. When this work races with PM suspend, the
I2C adapter may already be suspended, causing a -ESHUTDOWN warning
dump.

This series addresses the race and adds proper suspend power
management for unused LDO regulators.

Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>
---
Changes in v2:
- trim the oversized register dump from the backtrace in the commit
  message, keeping only the relevant call trace.
- rename the callback to pfuze100_ldo_set_suspend_disable since it is
  only wired into the LDO ops.
- use the per-regulator stby_reg/stby_mask instead of a hardcoded
  VGENxSTBY/VGENxLPWR bit.
- clarify that the change targets suspend power reduction and remove the
  redundant race-condition wording so the commit message is clearer.
- Link to v1: https://patch.msgid.link/20260716-b4-regulator-pf01-v1-0-8c1519d54bd4@oss.nxp.com

---
Joy Zou (3):
      regulator: core: use system_freezable_wq for init complete work
      regulator: pfuze100: add set_suspend_disable for LDO ops
      arm64: dts: imx8mq-evk: add regulator-off-in-suspend for VGEN1/VGEN6

 arch/arm64/boot/dts/freescale/imx8mq-evk.dts |  6 ++++++
 drivers/regulator/core.c                     |  6 ++++--
 drivers/regulator/pfuze100-regulator.c       | 20 ++++++++++++++++++++
 3 files changed, 30 insertions(+), 2 deletions(-)
---
base-commit: 34cf6dafc47441dfb6b356a095b89c3585a93714
change-id: 20260716-b4-regulator-pf01-5db03fba4a92

Best regards,
--  
Joy Zou <joy.zou@oss.nxp.com>

