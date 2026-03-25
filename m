Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013014.outbound.protection.outlook.com [52.101.72.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BF53E0251
	for <imx@lists.linux.dev>; Wed, 25 Mar 2026 15:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774452770; cv=fail; b=TpaISPyr+125QQ4VkF0PFk29Up8llAWHvBk4jtktzGT+q/Liq3/fGhT2aF9ThX4Lmtqwfbo9Izj5AoSUgHo6yp3O1EAlgu1+1MyH3I31507czhW3CjU9GM6MMEt183jUGapXZniGo6DVZnWQzwHtAqlT32AUVbA/VS2RlEEC+3w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774452770; c=relaxed/simple;
	bh=g49AycMd59LeVmU8TmVRQaqEkNFRP8weR1ljyGZPQOI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 Content-Type:MIME-Version; b=TojRgSnUVa8azJOkXzykYUw9uRURXFQtqrZw4bfeJdFiVXDmHeDrp725wDrNZ+wQPzSBSp2PoxSfsCVnuZRqe3NpPiqgC6qIWKVLzBi5vUsQGEbRUX8RcVQWCN4ZT8b2NpnWfJMwaKTBkERVNoLBrBOOTqNypj5U2sYbqwmKH0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=M/432cjb; arc=fail smtp.client-ip=52.101.72.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="M/432cjb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xiwZfAQuw5pmDbXbthQ/EushQPnXZTuXQ2Om2IbFzhzOPSZmMd1npnKenNJt/qWkRKP4SB7kvHe7nC5+XkNILLi4+OhW3szHzvOthiMavQN139AtwX03SI8A3fQUGSqpyiqSRpZTrodEWS4w5lkiFMGTJQgTbSmv+xRMTn/biI0E7m9NdWANiaVLjI5pw8mipoKVOMJr9ntsKqc1frVA29aiPSrKyX/yzoGYiEsWbHoIDj0NaiIh5A8S+r6t7+07V1ALqLjh8JbKuoHRj1lSpsRjusJ7EPZAT2GNcDUzSoU/c5UABoUlaygPhHVmgigi6Gu0FqXggOyCGDzCRziTWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0Mz6d6QYLDmrSX9iPoyUI5858+yaRNZKSLswZz0zSA=;
 b=KJANncdUdQqgpgWlZNi87wxr7DyUVTptffYlx/f+5A7Xon77GOHGQT6C81mc0Rh+Tnb7ik1u1xkdzmyeAybUW7UMhNEJhiHXw/ng2/uWzDWuEqcr52kpWjyWARRHGFyNwSG8YPH7VERPyJuW/sIrxNrHViY3vxLXVM6EFZ9iBHDOD9+6zJX64gGFEvXIjWVF4Xv1cwGHCW/rrdUSMRI/vzeb24E+MNTFzwWWJZClZ9npWCQMPjsmiH+yR1br6xpuIzNrWChbEnNM4YflnjDgccMzN9UTyic94k+SROVXmVMKAERtaZqSsMRM9ZNlN//pFY+J7Q9E04g4HE/HoITVtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0Mz6d6QYLDmrSX9iPoyUI5858+yaRNZKSLswZz0zSA=;
 b=M/432cjbDUTDCFKVn/KJcxsFlrT2tjvJ4NnAeyiEFHCKJgnSSl0d01Z0oYSsjuTRWr+74ZXjXUZPkOa9LLPgXQdOE1aelgSjQxrPHlxf3G1sW/4vBVITsDaEBKJhZCo12kdN2DQxYQgI///Sil0dWnKwD7n+3UKGKwb6lEKD7h+ct9zdwkNKh5v8DiuVYd2564APHRZEYtgfsY5RG8FNegSRiGOqyzyhY9ZF3bs5ay99ZbT1tVILQBg3AxDU61goJk+sZnA6t8dQTj+AEJhuc6TLl02bLu4TF3aemwyLhenOzw27DERONwgBlecQXkQc7h7Jd7QvPw/Uc48c8gxWBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB11455.eurprd04.prod.outlook.com (2603:10a6:102:4f0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 15:32:45 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Wed, 25 Mar 2026
 15:32:45 +0000
From: Frank Li <Frank.Li@nxp.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
 hongxing.zhu@nxp.com, Sherry Sun <sherry.sun@nxp.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260317030418.441824-1-sherry.sun@nxp.com>
References: <20260317030418.441824-1-sherry.sun@nxp.com>
Subject: Re: [PATCH] arm64: dts: imx95-15x15-evk: remove
 regulator-always-on for reg_m2_pwr
Message-Id: <177445276211.3102605.4412259627854755642.b4-ty@nxp.com>
Date: Wed, 25 Mar 2026 11:32:42 -0400
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SJ0PR13CA0196.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::21) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB11455:EE_
X-MS-Office365-Filtering-Correlation-Id: 771c24ea-f86f-4e60-c5b6-08de8a83c2f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|52116014|376014|7416014|38350700014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	btyFQLCbReL7cR3upuVKZEuKrirajYJN7Db25xrdWGuMiEM3DSh5rSzMXHIk8uTRxnAk9uBGNSIkqsnNQxSCgxEYFKrw4nDi96rVTVRCsHQZ306CvQejHl0u2o1+cQKEQO+9GAQ6tZrIbxkLVvaA1/V0JnE83U7nU4IAhHDbRucF+MLEm0+d3LCaXsnAVQ4pyubT5pe4ALr6UG8QDbTUL2GVY2rNopsNOoO7NMNuCm6I9BQMErKPXE/4sK0Wd1Wmf6aX4gsLpTh/yaPzWw3gwpkBRqyK0ZUvgg8e41OmSnr0QJqZ6p4C1t6prExclYB6i5dRGd7ry1heYN3ZNgJGN5IPqtuK/qVe7v8P/otsSOCS0RnShaReMGL7wz2zdQXypc93x8OxxALs1Q00pHE1FM16/PHM+EeUz85G59xnxGRv/xgKVzKl6XRXZ67wgc3FOw6sGvT2eNMu0h0Z7fg+GcoL4QpmGqkcJo30QFkUG/a4TDHO1ISPkAD1JefjZNbVwliLGKOBdJP7yPHzROYRdv7/ypQcGDkCY0zLSIC2CtghkJM+Z2U5aZ8ZXsGPCWSqC7DQEnTIAyJst9MJCapnP24lmSb/IYrkshdtxN5sbK/wyglyTY8P7yxLxys6HJVwYgBd1SeX3d2mpw7jFh9OH7WSfPM90KDRBfkK+sj2Bf9KeGsmCFj2Pheu8byncGWDROVFmTV3Ge9cQvCetQ5a2fd00HRnuHI6IF0WNpM4L6sk/BeFUMQ2zs1oI81A+Ox8xzXZZ1lg63Li+2BjivyY9BDSQ9RS2dGL5gMpXIba3fg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(52116014)(376014)(7416014)(38350700014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TUtBY2diWkpIUnJPWTdieEM2cW03eld2OVJEY1FHZ2pReVhCVGU2SytHOE85?=
 =?utf-8?B?TkVIMTE2N2lXK3daNHFCSjZFNE5nc1I1MXNGTVFScTRoNEZXNDdvZ2xPMG5q?=
 =?utf-8?B?SGIxQ0RsOVBBeWlTaWRlbVFmNU9CUUtyVEtHNU5mSXJ6d3dqTVdqZ2xEWlZ5?=
 =?utf-8?B?alo3SWRJMTgrZDcyczg2S2piVSsvWjFkVEw2TXVCQ1BoczZGb2NPM1VxK0N0?=
 =?utf-8?B?a0RGRHVHSGZQUStmc0hXMC93ZDdneGVYb01ZTER2ZGVSZXZOa05wMHM0TWwz?=
 =?utf-8?B?SkNKWDFoN1kzUC9mNlU0WEhYOTNaR1Z3eDVLbFp3R0k0cWZVN0FMdk1YWmRF?=
 =?utf-8?B?R1BwamZlc0E4UmZtWjh5eGVaOW1BRGI1WDJwcThwVVduMEtNdldlODZOTUY0?=
 =?utf-8?B?UWlYb1UzbjBrbXl3bDRYeG02Y1ZMdTdjK1FxRld4Tm82eVYxSkNldlBxUUZI?=
 =?utf-8?B?djVNQWJPb01CME9MTERESGo1ZytNZHJyNWFUWDhJdHJYYVhBcDkyNEthdEM1?=
 =?utf-8?B?QjFmOVVCTUptZFJ3cHl1U24rUzFlcGNIVHZJNHA2TXYxSFNHK1ZLaDl6UG84?=
 =?utf-8?B?SFBNTXo0eWJCTW9hUW03YlVCMjRZTm9KNUJLQ09rOWRVeUVJSks5eU5vV2tE?=
 =?utf-8?B?Mlg2WUZTWVhLRlFRUGZRS3hOenFzOTBOOE5oRUZGYUhSck5PK1NQcDFLN2dF?=
 =?utf-8?B?UkFKTXJjVXA2WEFFbUFQYlg2V25IVWZBZDZhRlFoQ2ZZcHExRmV3aDdaR0Zk?=
 =?utf-8?B?azZQQzM4VHROWGJydUI2TytwQmtuZEhhWWtwcnd0dDhLWk1jNktZQk9YU3pW?=
 =?utf-8?B?TXhqZjQ1NVE3ZkFjWGxDZFA5WHJ4VXNjVndoRG1DdzBtUEN2ZFYvZ1pPdnA3?=
 =?utf-8?B?S0t6Tkk3YWJhU2J1Zjh2eCs5dnY3Z21xdUVSRytjYU41Mll6L1RvY0h5Rjc5?=
 =?utf-8?B?RVlCZ202L05WM3B2eDZWZ3JmK3BJcUJUZDRMeFZpS0QySHB1WTc2SlFGamZh?=
 =?utf-8?B?TkNVRFIrWW1mdmVCdTVNSkZMdUNnZCtnbXJveHZuRWp2YnpGWEhYTGhwZzE0?=
 =?utf-8?B?Wmo0YjR4dUhWZ3hvTW1KOHpQZHhoYVQ2NkNOWFIyZHN1V21SdE1aVXU4Tyth?=
 =?utf-8?B?dVMydVpxd1pOdlpxR1V4ZkZveW9vTHhkZ3VFeEdma0NReTF1Wm4zOXlIbEdt?=
 =?utf-8?B?RmJXc2ZYUmcwMEZTSmdBamwxUVpiZnNYaVZqWTVMQ01oa2k5bkpEMGplM1Fj?=
 =?utf-8?B?aGh1Sms3WndBNEo3cUFRVHo3Tm1ORDRQMStsM1ZwNkhCY1B0K29LU0VtQmZD?=
 =?utf-8?B?ZXI2c0lScXBnOVcwTkN0NnE2RmY5RFhiS1hYK1lrS29MSnlydU4rTEF0QktN?=
 =?utf-8?B?b3dNV0kveVlZeEw0OHB4TFg2VUFxaVhweWR1bEdiMzdGb1BRZzNjZXFuOHZU?=
 =?utf-8?B?VzN1cTVHUlQ4UzBGYWNGamd1S1lNS2JMNE9EYVlsMzVvdFVBYUN6RGZMZFRO?=
 =?utf-8?B?elFtQ3FDUExUKzFma25zckI1ZXQ0UDNydVh1R3BLT1ZzNzdPZHlJNzMvMjM2?=
 =?utf-8?B?eXo1b0FyeFVFSWZtam95ZXFDeUdLc0tvdUNIdzBZMW4xSWJ2ZjdZU1lLWktV?=
 =?utf-8?B?L1NtR2IyaGRNYnNhRHhrUHRRUXFQaExMZGpiUlhPWUVKdlpGWG5lOVFRNENE?=
 =?utf-8?B?SytGUFNURExNK1Z4c0JXa0EzdEh3ZEVUdmpZcTlndGtqTS9Wcmp3ZmdxYnl3?=
 =?utf-8?B?dFlMWGRDMkJ5YmFuM3dza1VpNFNkZDlvajBHTGFmYjdLUXJrS3IrZlVJOHI5?=
 =?utf-8?B?MnlUOTFQa1crK2s5MEtnTEl5dkt1RHNQNlB5Z05VT0txNFF5dzI3Q1RzR3hs?=
 =?utf-8?B?TGEvR2wzK0MyOU90UWlYQWpiNm94N3hqU01pbUw4RXJkbGErYitqTHhhWDlI?=
 =?utf-8?B?OEZxZmhLTnRjaDJRNXFXODc5UFl2R3FxZnFqMTJ5TmtjbUwyMC9wdUdMb1F3?=
 =?utf-8?B?dFI0blZ6U3ZnV0lBcGI5aDdKSEZJUkhUWmlXODBvUFFud0JOQ2VOcEdNb0xZ?=
 =?utf-8?B?RXFHaDZBOG1zSVEwU3o1QXN2MUpLaUp4dXY0RHU2NFpIcDRINWxTYzIyTzVJ?=
 =?utf-8?B?SDNBdFc2WWlxMUJhcjBldzFpUDNheTFJUmR5ZEFRTmh4ald3Vm82c1F1Q253?=
 =?utf-8?B?eXZXcDltQ0ZvQnV3S1JYeG5NaXV6QlltVXRCenAxWUlQVXBtRkZka0kxaTcr?=
 =?utf-8?B?ZDZpQlZQSDY0a0hwSDZUaXFCbE5FTW51ZjE0elYvNEZZUzN6Q053T25TeFF3?=
 =?utf-8?Q?2I6IgnSisMmHds7xaJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 771c24ea-f86f-4e60-c5b6-08de8a83c2f6
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 15:32:45.2312
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KA8x1YQQPXRWH1H7paL5irVR3BC0iYRbmtA5gVz1JR1uFDMnUrAMQSDuKVCPPR67dA0d8lPAevZvZpbbduJDCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11455


On Tue, 17 Mar 2026 11:04:18 +0800, Sherry Sun wrote:
> Now we use vpcie3v3aux-supply to keep 3.3Vaux supply enabled for the
> entire PCIe controller lifecycle, no need regulator-always-on property.
> 
> 

Applied, thanks!

[1/1] arm64: dts: imx95-15x15-evk: remove regulator-always-on for reg_m2_pwr
      commit: 66df8383703f78ea6fd935e8b986802117d396dd

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

