Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013061.outbound.protection.outlook.com [40.107.159.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF0039DBE3
	for <imx@lists.linux.dev>; Thu, 19 Mar 2026 08:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773908323; cv=fail; b=ZdyZmP7mxOuSj4cYFNUVXpC8x2XZAVaI5ND1+Fzc38e1aZQ8/8zO+6jFxtdd9XpqNEoU9niNHiHbFwiyjZU7RY5dAfiOqjlXQ8uZC0t1QhLPmhsKVqDKza7Lk+VywFB4us0Y+eYnwUVtS+ZdqpISSApsOIGloa1UDJBmX3w9A00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773908323; c=relaxed/simple;
	bh=MvUN/J0apKa1rxwKDD7PHpWHu1MOH+2SZmhm6MT3BOk=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=ibJwbeqZKCPW11gO8tzAx26+kX3W+M9BnKsG+IzRkHBqoZHIayDOFMVYdut03+LCGYADmjbL38MEg43SLFb4Cx6+vIaCheHDxTiku6eQCG2VNMion773JuyUsgKGw0Gkx3eaz1nJR2Ous8Zghj1EewrRtoF/3ViWVBnqL7pf3eo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=QSlaybSr; arc=fail smtp.client-ip=40.107.159.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="QSlaybSr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rEjrtsV/Yvh91hxsGwt/yk6HjYU6nLO14UCjvjC/rk82OHJLPdVHolI9sn6RQMYoqklW4tk/C1gs+zj3Njab+bNjgB4N739i5cVNxOyzgrHBYWlmP/8VGAHeabhctszI8phKipXvvAkUIuOtCfRS1Vt0E4NtxRy3CznIPSSfkJG6oVIOPKVwGCeQZCvfmTEOdjUghI2dUIEO7aBGzAM2bpF3+BHrg2Avnd8um4mkG78pCops4f7gY30hArjId4UZATvny47PmjnUnumerJOk9zFTTQG64XL9e5l41J+BT0Ahds7/VEG4FNDmD26Xrq2qWCSVPhOJ6EH7aaJiAPcWqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wRRp63JDpyoCD+LSm90Xqp3hM18f4pZc+11ONlWFmc0=;
 b=AX+FRGMPj8M0VXN4Q7fRHuVoyS8LVRP3uMRdo6ob7ENlndaUaPCJ+u+Jl7oU9tKo5dx/aw4OLm8g4DZakYY+0jnlr85cm2YnU07rF6MckqACS5tP6Na2l/zcwznvs5kjBqK3mBFUu29VjuGSLqjTx0Wz+s7924gi1O6XXStuUskzI+mKyWaSphJRTuR03KyXRIMlK85Sy9212MgzUE/ib8B2R8eQz/aLu4aQRlOKby6Mp0eygBocKcDneT6s1AK3zIUeDvVLtbOuVUroo1mc/XhX+jO4R9YMq2mpsjhqsHPkkn5VX4zYeJkRcDrqqYP8r5MzLhUVu/DFXvoxm+mvfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRRp63JDpyoCD+LSm90Xqp3hM18f4pZc+11ONlWFmc0=;
 b=QSlaybSr3WjxrlDfXzmYg1b/PdjE6yOCxwsUt6rPjld6WQxRRJD39qDObbBcAo60L1txZXL79KABatYr21Uy761GGiQrAYCrrCqYbVy+s3ZSu2ywCPJCfiKo/SPadV2VBAM//8d1Tgd8qAADfaxNGXOqzBUP0VZBESy9uRr+jTK21giukByYpVC70pq3pZkHTnLcJPAuvO0TYJsprtQ9beY1JiPhbvvc2WcrPd2PWOPKypy/3GEscceB3jzyQwxpwhmnQmf/PybcFZRwsANFh16AK0iCFNPIO5Q4K6m7ueREsln5avn7Kuc8xQazwHw1yD9jJdPrhKJ6nyryfNbM5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by GV1PR04MB11516.eurprd04.prod.outlook.com (2603:10a6:150:284::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 08:18:33 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::1fdb:9c8f:5400:8bdb]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::1fdb:9c8f:5400:8bdb%4]) with mapi id 15.20.9723.018; Thu, 19 Mar 2026
 08:18:30 +0000
From: Joy Zou <joy.zou@nxp.com>
Subject: [PATCH 0/2] Add i.MX91 9x9 QSB basic support
Date: Thu, 19 Mar 2026 16:18:48 +0800
Message-Id: <20260319-b4-imx91-qsb-dts-v1-0-2eedc01d8af0@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGixu2kC/32NQQ6DIBBFr2Jm3WkAbYWueo/GBSLUWQgKxtgY7
 l7qAbp8L/nvH5BsJJvgUR0Q7UaJgi/ALxWYUfu3RRoKg2DizmqusG+Qpl1xXFKPw5rQWCaV64W
 sbzWU2Ryto/1MvrrCI6U1xM/5sPGf/RPbODJUrmmN1tK0Qj79Pl9NmKDLOX8Bq8EDgK4AAAA=
X-Change-ID: 20260319-b4-imx91-qsb-dts-ce089fb28353
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Joy Zou <joy.zou@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SGXP274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::16)
 To AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|GV1PR04MB11516:EE_
X-MS-Office365-Filtering-Correlation-Id: 39701a92-065a-4c92-ff12-08de85901ac1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|52116014|376014|1800799024|7416014|18002099003|56012099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	Z9RMRkjDouD7LWS8ujBj1UazPOvnLVi96XxO7E0aLKqpg3JB1KoPRUU9qoj5gqxUkVwjuJ3xbtO8drClAWDX9TLD0VAwtCOV4vO7iXhQBnWwqLcL0aV8ibixamRGYuJrcBQAu41fszPBPOwsTDqdCPQLjL6GDSAI4hiMREvwcdKBipYJ4FNGUNCcweaWqScXXxkkiCOan2srZv0yyo202FbO+1BTUAAm7yDJNIlHG7jjGrUM8M1I+QM1PI40YBYqYhncq9D3FGwrLq5A+V1wVKx99kLcYtErFqTfzUSbLiMQWX+gRKxLK+XXdUPTKXAZcXhrtYwGYvCkRTwMlCWeZtQ9IS47E9hN4AsnlvB62qZty7bnanhPNUWcBSwS+bBTtaR8OXhiHad2GeR1PVki6zDUJF3Y9fhAT5r5IjL8NOq9Z+/3tRHTaVqahaDjGhVIs3G7BE2KandYJI3nmCpGtsG7RFtkDxIDUAh3pNY3zY+XY77ZWTvucW73CrdGU76NviubRb1+0I01qQSALIy3hrJ3rTqObqdMoZwQOFcnsaf28zSkYVD8Gsc/QDltamzkw8kxWzvRLKQUK4BqBllCZOD5eKqQuWWCDjpuMdCYg7J4HeLOELRStOqwVBgGcIeNQUl9IwI9gHbMJH/JjrorP94/7bMdZs5HYo9TbIA8gdRtDIh2KU+6+3RMEFVIfD5nUfUw6MHWasbKY2bl52E7/lLbIWOMuArwNZ0MIPG1l8wsEfcIJSoyg/zPEvMLLZfpSyXfD6/whtp0ae11WHgTvcLj3sds/EeffO6/NtRkSfPod408fEctKkhwQ0cJc+Rc
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(52116014)(376014)(1800799024)(7416014)(18002099003)(56012099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlFVWmZBU2RCdmJYb0pVclp0RWN2bmdnOE40RkQzc3o4MUc0eUFLZWhvU1Vw?=
 =?utf-8?B?QVV0RXljUkNscWdoOTFaOHdvdEZEaGQzQURVS0JNcU9ZQllqRHFlSHJDdmt6?=
 =?utf-8?B?M0loaEFYZThkQ1BVYjFQaHNRWWtLNVVYd25pMXpZK29ZS29Hb0JRUWJ2TWhx?=
 =?utf-8?B?eElJSXIyT3VRRDNsQ0F2KzduazAyaTViWVRxMkFRTzhyVmsxVjBzem12WHpP?=
 =?utf-8?B?c0s0RUp3Mmh6c0xCVTBiVEluRmVkSWd0Rnc2dHBZWkd2TGg0R3Jna3JFK1lv?=
 =?utf-8?B?Q25ZSy9RMWt6enBkN2R1bTgwTEZka0tUTktoSzBuVnFBZXpxaFpJWWttbjg2?=
 =?utf-8?B?eCsrS01IZmt0YkFuWDljcHM4VHVGRnpmUmpQMUZpQ3RZTWpDcXh6aFQ1M2J2?=
 =?utf-8?B?WlVVKzhJTjFHM09lKzVJcXExQW5IL1V6cFNzTjRPUUttYk5YU1ZZbzd6MVVD?=
 =?utf-8?B?Nk9ncSs0WkFDZFBTNFdEL21DWEJsMWN0SHVTVjB2QUQ2M2p3cDF5SWw5WExz?=
 =?utf-8?B?aDNRVm96R0J1QlZJay80YW94VjZtUzVFR3NEcHRwOCtxUS9uaml1eVZERFBM?=
 =?utf-8?B?OUZiQXE1TnQ4VmcxMVFOeS9CbE9PS0Z2VlZkWG5tcnBzSXFWejZrKy9uMjhW?=
 =?utf-8?B?THZMKzFEeHhIczRZV29IMmZPUldlZ1k1L3A1bERncXg2UnNMMks2S1psTTd2?=
 =?utf-8?B?UkYxd3NJUDhCU2F5UVdDSVZXTTRuaG1LZzhHYnE1U2x1ZmZXS1Vyb2gzdElk?=
 =?utf-8?B?QzhRUTFTY1pLdXJESmM1RXJTamRsUDE5R2dITGM4dWV4Mnd6OGI1YUdPUUg2?=
 =?utf-8?B?NHRGekQvVVR2d1hJeGRzMEd4Y2ZMdm1QLzRCSWg1MmhiTHRBdlNNcnRidUhh?=
 =?utf-8?B?MzlvelF3aUxmNmpIdXVFMjgxbVVFZWQzVDlHTkpyM3FwWmJ0NFZJVFhNZ1Yr?=
 =?utf-8?B?R0dWVkZtSFMvei94UkxXOHpCc1JwQWJQRXNHNC9PVVBUWTRWT3c0NFBSV1RN?=
 =?utf-8?B?TkhGb0luMlgrMXdQMUxFMElMN2tRYUlWZUhhSkh5bWNnTWFUdmVjSjZuN0NJ?=
 =?utf-8?B?QUVlK0xac3czOFhjWlgzWnlSS3FUbTY1c29hRnVqTWhid0lsYVZkMk5tMGNY?=
 =?utf-8?B?ZnpnNmRnQ09wS1BxU3dPNEJOR0FJNUtiMWswRWJDeW1VQTJJOWtyRUZYR05Y?=
 =?utf-8?B?My96UXhkZ2FCTmRNYmlncG00bkpxWWZSeWU4ZDFVd1BQa0VpU1ZxYUdKR3cv?=
 =?utf-8?B?Nm53a1c1d1pmOEtFbG5mQlp5dHpoVUZaRkxMbjFTQjZTYnNQMy8wVGN1Q1Rj?=
 =?utf-8?B?TUM5aFhqMHRvZ2hwKzNFblQvcm5RMlpJdUxaWTYyVUtJbENlb2dkNXRjQnhE?=
 =?utf-8?B?YkxBQzZ2SHMzVjk5RCs1QnQzQU15WUNCSm5WNVpyclVpZCtVQUNKa25iU09y?=
 =?utf-8?B?ZXNmMWFkTVdzN2oyQUY3RkRWZUlweUcrNVBDWjFxY3J3YnljTHkra2dOb2wx?=
 =?utf-8?B?U0xmaTZvQ3pWYWtPRmRrbmFkOVdIMXRQWkxpaEhmeFJiUnZINGc3REJnTGlG?=
 =?utf-8?B?dzMvZFdUOXVJZlZQR3NiVm1PZ3lDcGt2Z2J2VkNuc0JjQzczaUNwS0xsZVkr?=
 =?utf-8?B?VUUxRHBHTDd5MlU2MkpFVWtTeSt6Nitrem5XZmNQOSt5RWNmZzBIK0NpMkNn?=
 =?utf-8?B?UkFpL2dmMFdtdDdJWW5zRGQ3Zm5UQUdIRVlBM1ZycWlvQW5ndDhpdjFKTkY0?=
 =?utf-8?B?VXdUSEMvdzJ0OVlkbStTSVRqY0ZCeDJYMnJVMlVlZXE2OGhGMzZ5Wk4zblpQ?=
 =?utf-8?B?Zk0xTFFUckxCeTdCMER2WURDc3RXK3crSXFTaWEzTjZNcmsyU0NzRldVR3RN?=
 =?utf-8?B?QzRMYjYvNXB0b1ZQUmJsK2cvaWxKbEdzKzNpRVFSV0tZOThUZkw3dU9RcEx0?=
 =?utf-8?B?MDhyZlFnWHlvVEZtbmpmbll4MFNhbFR5Vk9lTzBHa3JkdWVkNHVWU0pkM1Nm?=
 =?utf-8?B?TWgrRno1eGw1OXN5c25MVG1KMnBoWHV6MEFQWURWQjdMU2VVZGZhZXFyVTds?=
 =?utf-8?B?MTZCNDBmRlYveTM1N2k3dDlJYjRYTUhVRFZpcURlRG9seDdrbGNURW5SSGFi?=
 =?utf-8?B?eGlGTVA4aTgvSFNzbHU0bURGTTNTaXhZS29mVTdEdGRYeXdzdWpNTitwZEx4?=
 =?utf-8?B?RG5VYWZWVXBvVUQ5ZjFma2xkU0JtZTk4RG9Gb0NPMy9ZZ3FWSkpUaGh0VktP?=
 =?utf-8?B?aVlGcDIvN1dnZ0ZaQ0VjRVZVdS8yK1dBSWsyUC8xS05FQ0tnV0dMcmh0UEdo?=
 =?utf-8?B?OEIyUWRvRThvbzBsRVFrMGxwRExTakxsOG9rTmNQdWlHYXpzcVFXZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39701a92-065a-4c92-ff12-08de85901ac1
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 08:18:30.5278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+z5wg0EmNYFQe+Zpx0vASGEHubGzWgbSyVCfCZkueHX75YqHrqjWsUMT6B4VY9i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11516

Add i.MX91 9x9 QSB basic support.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
Joy Zou (2):
      dt-bindings: arm: fsl: add i.MX91 9x9 QSB board
      arm64: dts: freescale: add i.MX91 9x9 QSB basic support

 Documentation/devicetree/bindings/arm/fsl.yaml  |   1 +
 arch/arm64/boot/dts/freescale/Makefile          |   1 +
 arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts | 425 ++++++++++++++++++++++++
 3 files changed, 427 insertions(+)
---
base-commit: 8e42d2514a7e8eb8d740d0ba82339dd6c0b6463f
change-id: 20260319-b4-imx91-qsb-dts-ce089fb28353

Best regards,
-- 
Joy Zou <joy.zou@nxp.com>

