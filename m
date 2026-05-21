Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012018.outbound.protection.outlook.com [52.101.66.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5610D37F726
	for <imx@lists.linux.dev>; Thu, 21 May 2026 19:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779393166; cv=fail; b=qfvNCPergJiRvrvXp7tf3s2K8C6PMisD8YCKyW8LyQ0cYRCl9ucoQV/tIN2ADjIzfy+Od6+6ytV7sTLuMaz9iQissgwkBgdEmw6J8kM5Wp6L0bAwFS4tp2YSeUOcfdLbgJb9gre9fTMWK3r8Y3g4idrbS1o9qm3MzS9gz4+gcEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779393166; c=relaxed/simple;
	bh=Ob6q0QTvYQtt5BqTac/MLp/WTX3Bhf0TMh1dV7PHCLI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=sajflrRA3K8DnlxYIl+pN5gRZFmMybejcsj/Dh7Xy5rH8rvRBMjcQ0I97tURgG9k0MnywE1up6bOFdTR7YU+ILLzn7lVGeHCYRxtr/eXbQNvlMzVCEQG5+QKOgjredaARkV+W+4spScIovb2Dg0TjjryZWwzLWskAayo/qyi2r4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=V5SWxvWx; arc=fail smtp.client-ip=52.101.66.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="V5SWxvWx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KTiHH2OBjVVoSYMnjrNAbtvqg77LXKSErskdDgfLYAZvLgez20Wr39dHab/f8Uxujb3Q7rB8W+dKaPKLeUqXs84H/qeES/FqxfIrkPetsZrmV595jb+yHeqL+ZlDrMcyYoX1gtXVRLZkfd4PdyTJHGn9OQQ0vA97q8to4grJ+aMsDIStIfzEYdIzL7EOoHFA5jovqGPw4Snz+oP3fdsQrKdbYUQ+R7fmSIMWKE3KuCQVMlOCdRN3wiq8gFnt5HNpirq9cyoojk4ipR+dYZv8nbSQrUNsEznC6t/q9fNM4p9Ny1CHJ+DrPonhkqK9wNnt+1S/pKQk+LpxGP3HMd66hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLvikEqUuLsBTKmNmxgcq3CoCcd6KT1ubemu67o85gA=;
 b=jCP+O51G7BTCD0vsoNjFvzSNvO5lWAEeofahaJL++0ovyLwGUizT25trHXVt1Cuk6CaO9Da9q9llF2381eHl6kkzw7/oyc3+D7y47PrTkCVi8Tqb+Synd0drArGaywpdACFY1I2Yt/GW068hF7Fd37ZNmoIABcMVt+x0KGNAYqPyfOXZs+cz4sABLHs4nAc4qfbLSWZHWYGmAKbq4Z+yrBp3QHRCrH6gykFtiTpTFz9nylAekUfyNCMT7w6EwLDcU0p22TtB/bO9OFPxKSo+jBQRtG+i2qOQNAIjdS7uvCuds79c5QulVWTShBptjxB/aVlFmr5oC3rT/RGcQ5cIYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLvikEqUuLsBTKmNmxgcq3CoCcd6KT1ubemu67o85gA=;
 b=V5SWxvWxoktKQr1GigO8Gl76K1jqrtRPS2/dzqoOi5M46x3X+jeLTB8y5UTjkExwH74vzjE4o3l6ec8BJW/9VKkTFdbCNwHR5m6IzpXunSZ6ntgZXUSXhS94se2m6BN9pq0vXK/gui+OkBg2pr1k8RScZKqsmvFzv9y7Lw5h96XQaiJ5FyBOnhPIa5f39GGHL1eNN6c1oRpIj7IFc/5vE9SBmOAdz6CbKRP81Y/gwNxPhDnBlmq728oig6Dv5G8wP2s/o2jOmpmzKrRe4L+Own/d5WK6qlKXZlYa2O3IMduNE3OcDq/7SMhc0cOxC6kNWdn+pYA4uRgax966q9A/Ag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV2PR04MB11922.eurprd04.prod.outlook.com (2603:10a6:150:2f9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 19:52:39 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 19:52:39 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Frank Li <Frank.Li@nxp.com>,
	Wensheng Wang <wenswang@yeah.net>,
	Cosmo Chou <chou.cosmo@gmail.com>,
	Brian Chiang <chiang.brian@inventec.com>,
	Eddie James <eajames@linux.ibm.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: trivial-devices: add fsl,mc1323
Date: Thu, 21 May 2026 15:52:31 -0400
Message-ID: <20260521195233.1532852-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR12CA0025.namprd12.prod.outlook.com
 (2603:10b6:806:6f::30) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV2PR04MB11922:EE_
X-MS-Office365-Filtering-Correlation-Id: a7de02f3-4a96-49f2-e521-08deb772837c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|56012099003|18002099003|921020|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info:
	Z7u4fu8ob922JkKRoAenulXVMCttRoAcXK9FFNo8TFVdZtcXLLMkPChSsgfZsv8GLbBoQl09TEbTAOZHwR61zYTCsxGIIyIf4c/aCDFlX9Cp0PKhbef7yencGuMrv6VNaPFEgIfznlL6UT0XbxjoXJX2Ci0HpisAWM9+EWM2CuFoq9fpugGnXJUS1ICvCOyDr+8ig7BVLwiA4bm3jMTgsXEovE0nMm0LOUWV1F4WOZuZu/yz9qkddh2YNSiPQH5mIejDXdcdGROd+Ru2+wjU8yL3ZaUT09xNFpyjDbFfclhp20O/k3lUSlo3j4JSdACiMznWi9zo6jKYnTKb+37vd4vmWicPOrDRG5yOKSMHRGX0CZP1I5YRcH0eBMdATY+A18Qdd5bN4Boz5sBzaGCPiKgEiB0nKNl01YIgvevBjuD5GQLHuNnhowkr3HGQzjcFr2JYei6Ud6FFZfp7/sKHdyeWx9g+Dp2GpSDMqQiMk2ZZe4UMoKYxvEMXhYyuS6o1E8uENLNqQ8bsGa76ZhMO3Vf+ldu7NBcTz0+tHrUbYJQxGLwi6afgoy4ED3tpwbE/xa+1sQY0FJpl7KyfpaPtkX6eMgG4Fkn4QJ4a9ejybGsUgcTNOuDV9N9R8iHlY7Zd4x5vXy/ud2NOOvh15gLITt7IFV4fRF+mUAKNSvUEAUFze5a7Ph3GhjyJ7J+zfiMdIKfm4lgwAsZxsr+jlfv/MzxMVqKGCD3rr8rU8DDsKQk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(56012099003)(18002099003)(921020)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cTg5SnpVdVdFWVBDL1FhMjd1UGVSV05nRldrajBnbC93NTN4d3pTWGhYQXBr?=
 =?utf-8?B?RGFiU3FDS1hwRk5hRHVYR1ZtQmpyOVNBeTFUUXJZdVZBMUd0UGJlbENpd1Np?=
 =?utf-8?B?b2ZNS0N6OEhpNTZwcWJ0bllwMzhZbDJHcWs0elN0SUM2QUo0MFRZdFRPTDk1?=
 =?utf-8?B?ZmN3ak91ZHZPOEtQcjMwbG5IcGtETWhTN1N4ZEUzcnpIc3Y5d1M1aXNnTlpq?=
 =?utf-8?B?alZkdG1pKzBRUDBvSE1CY29JZ0ozR1RpaTNyekRHZGxhUnZHNUFuVXdGd3RN?=
 =?utf-8?B?ZUZnNnpkcXk4RzVlMzk1TG85b2tYNzh1QnBHRElKVkJlU3hZdGVaRy9ydTBa?=
 =?utf-8?B?Q09sOEJ1WnY1U0lrSHNtTm1LVFp3Rmp6dWJoWnRnaGZ5YXRFVlpTYmFEODFL?=
 =?utf-8?B?d3VzMktBc1ZqQUdzRUwvUDFQQlVmRmxOWFdDSW9lRFlXYUpZV2pRSjZGc0pn?=
 =?utf-8?B?aXJnQXF4Um4rWWhEQzhsS3VqR0NlM0s2TEJjdStZK1FVc0RHYm9QZkJmQXdP?=
 =?utf-8?B?MHpMNUlCaCtCV1FTT0hlbndTbVJhQ1VEQjJjb2VWaG55MU5IcTdmQS9Gc1pn?=
 =?utf-8?B?UVdDaUhRL1Q1alRVYVR5NFlXSGxFZHkrSi9QbmR4T2NXbzBKbWgxVU5EbkVO?=
 =?utf-8?B?SGZGcjFKdU9KUGlrWkFyKzB0aDVMQ3hjdkZtS0NWZTEwRURGQnIxTWFjRExY?=
 =?utf-8?B?a3pHaEVmSTNjamVNQjVWK2ROK1BITEV3dnVLYWxuR1d3ak1hOENUaEdZZ2lV?=
 =?utf-8?B?eTlzcllBRVJNWDc5RU9FbEZCeDNDdVRMZ1JBNWdFTDBJSEdNUlBaYnRLTFlz?=
 =?utf-8?B?TjNPVWdTbmdxYkxlNi9kNTU2dG9GdlFEWEk4YTBrbjhGUTdrRUtlWGtzTGh4?=
 =?utf-8?B?NEx3MG91NTY2eWhLZjhLUEI1QW9RMVJqZ1c2U3RsVUJCNm15NjVOZ1M4VUFH?=
 =?utf-8?B?bmhhbDFPWHhvVUJad1NOSEVWVnAwMERGYmVCZzRPZjQwM1ZZQUJwdzFrSXNJ?=
 =?utf-8?B?dWVDUUM4aitCU2xPWDJwdm1KVUlJaXJKMGE2ZGlVRGp6d2Z6akd0KzkwK2dZ?=
 =?utf-8?B?ZG8rakQrYXNVbzdvSFFkakpJd2NBOTRGT2U0VDhZRUN4dWlhQXhZRzR2VHZu?=
 =?utf-8?B?ek4ycDF5VjNpeTZRcVA5b1RhU25uR2M0TlhXMHJpbWxsbXZhdGVQYWRVUjMr?=
 =?utf-8?B?c3JyN1RmVnNjaUNCQUcyU3dCem1xU3ZFMnREMlJtSlBBb3BhdjdTQ2crd3Fj?=
 =?utf-8?B?UnZOdzV6Y3pwVGJKL3dCSW9wNEdqLytWSU1SYTgvSmY0eWk4QnNldTlOMkhO?=
 =?utf-8?B?VEJ5M2xIM3VHbjRVemF6TEtlZ29Bd2IzWVFQeVJWV1pPbUU2Ym15cXZBNG9S?=
 =?utf-8?B?a05vOVNCMU1SZS9PcStFQzU3c250K2ZaSjdOQ2t3blVDVVh5VVNyK0RHOWRq?=
 =?utf-8?B?T3ViblgzVzRqNWx2ZkNUNzFsR0M2RzZ3UVQrK0FvaHB1ZnpSVE8rd3F4R2dx?=
 =?utf-8?B?QWZWeW1kQzZuRUN5dm5qS3ZPcGdqR3VsWDNFRjJlZDRVZjVCS1htV2FUekRx?=
 =?utf-8?B?NVJBaWJaM2daTnRJTnRWUlhsQVlKd2tEK0lpYzV5NkZrckJLaVdEdHBkZmVh?=
 =?utf-8?B?cjd4TVdrTnBvS0FOOFQrYTVMOXVycGEvVmV3ZjZDNnNrS2hNaDEwRE9mbldV?=
 =?utf-8?B?L1F4ZUNkNWJtd0d2NEZHTTVXdlo3SGRhOXM1eE9lK3V5TUp4Y1hxaVMvUUVi?=
 =?utf-8?B?R2hWN3A1QkgrQ2F1aFZkNEZUZlNqWGliVWJPY2dvT3J5VlZMSENTZHJSYS9J?=
 =?utf-8?B?SGZkS1ZCaytHOUdOcE9TcEtjWWpmRldZTEFwYkVsWllmNHlES3c0bnlRU2hX?=
 =?utf-8?B?R2F6S3l1ejM2dVhMZk9IYU5Ga2REcks4WlZuanFkUU11REdZNEtUYW0vQzZI?=
 =?utf-8?B?YlFUNVdxN2xLOTdCV0VMTDJzcUFEM2wrUkdiR0RpOFU3eVB4aXJPSUhXWCtH?=
 =?utf-8?B?aGl1Q2ZXZVdkNmtGRWxZNFhlK0FtdW1iL2FzUjl4Qk9KVVpOMGp6bHZiTWFz?=
 =?utf-8?B?RHptci8xU3QrZGQ5ZW9zWk9JYVZsNlZPakR6ODUycWp0NVdWUXZPOVQ5MExE?=
 =?utf-8?B?dDZiZzBoc2lacUUwQlo3cjZBa2tNOWZJUmZWQjBjVVprRG1tN2hXSXN2bjBR?=
 =?utf-8?B?QnBvQ3Bva0J4SGRrREMvcWpia01reXBZWFFKMDlCbWJDQXlTclFqQk1lekEv?=
 =?utf-8?B?T3Q4UFg0NzRhMllvdU9raC8raHhQK0lLczJ1VU1ZT0JMdmNzMG9TamExVWp4?=
 =?utf-8?B?bzZvalhXVm9OK0VFY1AzN0xLblptcHVVUG9RbkhKbWJoSTNKSEpqZTR5UzQz?=
 =?utf-8?Q?rVy6NWbtamkLe928=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7de02f3-4a96-49f2-e521-08deb772837c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 19:52:39.5371
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i18+/fBdx3JVRBnHegzP6GqcLbCdU+Qr+/Ahd7p4Pce7Gu7xbgGUoTuM42zWVB+sBwFnmXsN/Jj/49WB+h2CpoX3yrvxURYmgBVnMpHaI8nhf7iUqMowixHfFpyZu8w+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB11922

From: Frank Li <Frank.Li@nxp.com>

Add freescale 2.4 GHz IEEE® 802.15.4/ZigBee mc1323 to fix the below
CHECK_DTBS warnings.
  arch/arm/boot/dts/nxp/imx/imx53-smd.dtb: /soc/bus@60000000/tve@63ff0000: failed to match any schema with compatible: ['fsl,imx53-tve']

Since the i.MX53 platform is more than 20 years old, it is difficult to
find detailed information about how the MC1323 was used on the i.MX53 SMD
board, as the functionality depended on firmware.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- add descript about reason in commit message
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 46a4dca50c485..6ff96e10d0785 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -127,6 +127,8 @@ properties:
           - domintech,dmard09
             # DMARD10: 3-axis Accelerometer
           - domintech,dmard10
+            # Freescale 2.4 GHz IEEE® 802.15.4/ZigBee
+          - fsl,mc1323
             # MMA7660FC: 3-Axis Orientation/Motion Detection Sensor
           - fsl,mma7660
             # MMA8450Q: Xtrinsic Low-power, 3-axis Xtrinsic Accelerometer
-- 
2.43.0

