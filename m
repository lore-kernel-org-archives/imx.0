Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010009.outbound.protection.outlook.com [52.101.69.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BA83CD8BF
	for <imx@lists.linux.dev>; Fri, 15 May 2026 16:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778863213; cv=fail; b=O29hVm1c3rzNtR6rAR86R7iNOPD2+noDm0s14Vd+uJnhX+/sCYk7I2PfhU+xQ2yE93JlW+XRDJpM3MVkz0sJkJdIlBpeqlwO8DBNo8u5CdT4MlYThzpWcKgD0aH4P7FHQSo74uMg+09rrwalZcMYGQz7t0NA3CThdeMxJoIAx1w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778863213; c=relaxed/simple;
	bh=xTJxTka3RO6ImrEkg88UIk7Mz/4ZJCBhaNi2Tq6lGT4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=i9JD6AK80wPRADBKym4eqEJAL3jmZZ/Sm2iI4BgYJARijBgqfX0HXFXa0eiJSKIwExT27mJY0qBgpM86SQI3nAw0Xh5lv/eJTLL8VXoXLY3LapUFEIo864fiwMwqF7tkRpdvJRj2WaZK2z/Ml3ydIMQK5tjZBXXWur18fhzabI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=R+Y2Ur+C; arc=fail smtp.client-ip=52.101.69.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="R+Y2Ur+C"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=teduholUGWCCfg893ZqLOAZ6+iSkeGWRjaeQhJmcuq1sevjHDZL+jYfTVcKa4z6eiR1u/QOdepOgDZ50gcfgb0v8JAkkoW5ywbbtGf/5CQyTtJO5f0Eu8qzjPSLCqHaoeWMSIbGEpG1gsuBaE7qPAFeq0yTOEv1F/dw57zE0gQRhp6E+d5++A2YCw5DMSj96824WO6C6nTJe2WU+J+wbbfmQDzR6oE7DR+0Eo71MGTi228uc0QKnmsuXExyyuYjR87pY+I1BRGF+ObRthZS+MXocIZRy17kLnuoRT7QbcKUVZaCOBOn1KEbjXbRlaxKckfP0Z7kP4kiZXoaQYdAL4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2RH5AGhkr0zwT+tO6xK015UwTipX6Q9tj0lhikL46qA=;
 b=ykLgX1gv3WFl3zd65i/dqYDyi7u2LYt/ixKRxZrks44IRLALLTcSmbjEE6IW4IDknKunVeGYNO9iNpnCXnTMfNgIdNs7Vnzc5nx5zDsDOHobs1Diuwuz2DSD3Ffnf+BWd5kTVv7QUspjyRCeC/EOVR38n437/BuUIpQJ360km8BrhbZbI5PcA5CqektTXuttrNIgQCnVgfKBW1sA6IeEs7q5Jq0Nf7dC1GJuE7lZw1Ln3jt1j0RTjBuLhxQ7fOUPlgD0zrGoV90G7q5owRveOxulRIEnzopDZsu7IvF+1V4V+itXl2qkYIyT4gkd2Z/K9eFaqcTmfYB9G7i/n2xmJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RH5AGhkr0zwT+tO6xK015UwTipX6Q9tj0lhikL46qA=;
 b=R+Y2Ur+CyUop01Qfaoq5kjCEdKhG3CG5TH03/oEijqGE7iaYWLY9mtMw83yriX/UnUMTnG7TkewcsKrBpdJ6hl0kNT2JSMbqR2okKgNfe6HxAu56uN44A8LqZ074C/dihKcM/MSgHISS4Csf+Ur57Y+K4ECZzSIWnuTKRq5d38brobImiU1Ak20wxXp/1U8Aa2UCDshgeeD7qh743Ae8CxXWXGU0ek/omCuGI5EcpohbG5matCC0SdKgTorlAPb1BeAmSngaFYbTh50a892rbMevPL+KiBXk/U47RDv79B2McqYvoqXLoYtVjsR1DZG+KdXNtX7pFnRY96yAhPEFww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8159.eurprd04.prod.outlook.com (2603:10a6:102:1c1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Fri, 15 May
 2026 16:40:06 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.20.9913.009; Fri, 15 May 2026
 16:40:06 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Frank Li <Frank.Li@nxp.com>,
	Wensheng Wang <wenswang@yeah.net>,
	Brian Chiang <chiang.brian@inventec.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Dixit Parmar <dixitparmar19@gmail.com>,
	Antoni Pokusinski <apokusinski01@gmail.com>,
	Eddie James <eajames@linux.ibm.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: trivial-devices: add fsl,mc1323
Date: Fri, 15 May 2026 12:39:57 -0400
Message-ID: <20260515163959.1948799-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR15CA0004.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8159:EE_
X-MS-Office365-Filtering-Correlation-Id: ba228482-4cdf-4c21-f4ae-08deb2a09ed4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|56012099003|18002099003|921020|11063799003;
X-Microsoft-Antispam-Message-Info:
	zaW2i760U/mv5i06B0/RiUOMxPO2vFovD7Dy8ZT8RNvLwfSZ3ta24FfPx8KT0QmABrvfyILCaouWFADc0/vaJRQnEKdHRGrEptPDbVFgELhOAyU50/POmB0tuJi4ZkV1GkCC0SLcuBAvp7DZqnMDwMTngGXooB6A2qMuFTVyJu5B4Bvf2O0+wt1vr/Yj2tagUy7ovbS4bEQ9himi8DXu8yPvT5WgXK6AWxuQzd+N7PMDQ7OwNxAH+LB/eJw+Zz/8XweHjUYH0kdLcPwB/DI9TeMLeYFJT6CFhRqF71Af1lIF7tX08J08zog5ZBHG76wx4s8PsgI8Hi13CCxos+KrVcbjZhSG+atEWxjRdsr99LdkK35pJXaDr0LpzxO3FSQbn5NTZ/ctN4oFBEufUpZqWU2J07VQcI+dqvVklD7egUN0jIBSQ2Wr6P683AC3ZI+VLnsPyM+gJIaUU5BUNaZq2U3ktp6pGYPAjw/6HziZEC7X0zXZ4jDR0PbAdOfZAdjJ6efzvazrJN2BA3fquVHwqmy6XF+bCGSzEZh5wLo1mrAqlN1oo74X2oc6ZWaL+EhUOxn3NGSHmnANIabmOtN3Bm3juptGZuSNFOA/QR/oxqts8F5LgVvL/rfCblDuSLKCP1oOSYJkH9G/ZCF9jL5gZYsHKgI7pGUfwaQEbTfNhYCcTq5w6wiQl5A4ZFyZPOFbu6ymOXvRirIIfwhda9uSutStrse7/Fyghx+ddjC89io=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(56012099003)(18002099003)(921020)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OWxRQTBOYlRhemFuaW9RTTNDTkx1cGtOWFc4K1R2alJnczBxY3JnZnpNMThi?=
 =?utf-8?B?dmV6Y1N3cnkxUHlGbkhxcVpCUDcrRFlQVisyUXJoS1Blc1FtRjBaMmxvOFY2?=
 =?utf-8?B?V2pxWTlnRE1pY2FTS0NldmNKRk9NdUhYSUVSSkJGVGJEWFZIU3A3MDlpSkRO?=
 =?utf-8?B?QjNoOVE2UWg4a3gzbUdnZTNoRHgzV2l2dEVpU01ZQzNPNDY3ZmxxU0hNc1JI?=
 =?utf-8?B?czJNZTJCU2d0ZElQYzhPK2JaaVIxZHhyVHdEZUFHV082WC9RTXJPeGlPL3lz?=
 =?utf-8?B?MzVpYTUvUDRqQVhEZ2VVVmp1WTRMcDBVc21EYkl5d0wvcVRlZEM5WHR4MWdF?=
 =?utf-8?B?Z1RydXRiM1NRNHViSnB4L1VnNEVtTFd2eWxCbVlwTTRSem5hd3dpdWtKYVg1?=
 =?utf-8?B?Nkg5R1JKREhObkYyR3NEVWNEWTVHdldhTzFYc1p1WnNZL25mVFoyS25sd2tM?=
 =?utf-8?B?MGtxTzNydTVjbUVFMTZYMVhPdGt2ci9PUm8xRjJtc0JIVGxHVTdaQnRmTWFH?=
 =?utf-8?B?SjhjWkRRQjlCc2t4NnJyMzZjWFNhSkVhZ0w0Wkd5U0dmTUpjajVnZkZvaWdw?=
 =?utf-8?B?ZTM2SlNQakFpVFQzQ1F0SkMranVZS21LTW13SDlLVDY0b0pGTzhjZ3UveTVR?=
 =?utf-8?B?dmE2UzR3Y09WN0tES0lnaElvZ1lUZXNGbEllSSs3QXd3Zko1dm9MV0pEVVV5?=
 =?utf-8?B?b3BxSDEwRzZIbzRYcXUxcFNvdkpIYS9lUmJNNkpMZXRDR0VwaWw2TlE2dEF3?=
 =?utf-8?B?UE5memZFSUhRdnJNRnJJTXc4Mk16MUdWdE9vNG0rZ3NYdnVLRnhWQ0FXUG0r?=
 =?utf-8?B?S2xQbzdhak9CT3RKc3EwL1RlcFVnWnRMSmVEMEk3SDFXemh6bVB4WXZsSC85?=
 =?utf-8?B?NXF6NFlsdjVPSWkyOVBnNTdmS3NzWDBvbXlmMTYzejlpT0x1OFEzY0Z0Mnl4?=
 =?utf-8?B?VGo4Wm9pbmdBOXpJdml2SU93ZEcwTjlvMTQxWkJCcU5MNkg0VkYxOEQydGlh?=
 =?utf-8?B?VUdOK0dKd1RiSjlmckVxV3oxdkZKQkxLZkh0YnVySWltM2xXZ0x1bkgzdVEr?=
 =?utf-8?B?L3NySkdqVkZTTXAzeDhSSjVFa2o2U0pmbEJVSk1xVjdOQjBENENtekhvWXZu?=
 =?utf-8?B?QlBmR3ppSXhHc1Z2ZG9jVjVVQ2xkaVM3MzNtYS9paVFVbFI5aURPTVpJQzh0?=
 =?utf-8?B?S0J6NFpQbTlLVEJrU1dmOFV1R29JV0tIcU9oUXp6SmQ2WDZYWHRCKy9TcnAw?=
 =?utf-8?B?Q0VVZnpsRUk0NnVWdFBjVFFJVE9QTDRPVVVoMTN3ckg0Y2NEUHV1dE9MRjBa?=
 =?utf-8?B?cElxdkxzZW8zQ1hXeE5QODFkalY0Wm5XM0taVUw4LzRpRFZUZE9uYXQ3Z2hL?=
 =?utf-8?B?NXUrdUxDZXI5YnRtRStpRjJSYjNOellYemhUMFpEakxwYVhnTFNybm5VcFM0?=
 =?utf-8?B?ZThCVjBrUmJzcThHSy9SR2xLNGF1OU9vRkJlVjhOQk1ST0hyVVBiTEorV2dY?=
 =?utf-8?B?ay9teDA0ZExKVUJBY1gxbkRmMHlIU0dyQkxkb2IxU0g3V1dkbUQ4YTdOK3Zp?=
 =?utf-8?B?a2JIZDRQaG1WTlRlazdPSTVOTVh6MDBscDJTNWcvajA5cURiV0RiekIxRjdO?=
 =?utf-8?B?SEdkS2c0eit0L0JTNHNjM29WVDg0N0FqWEhZQk50R1BIWjdYZDNFVThzR1JJ?=
 =?utf-8?B?cGV4QS9CMzVxMjRTNzcvQ1dsVGVLd0FlRGx5TEo3NEFVYkhIaU04bTVnSm94?=
 =?utf-8?B?bVVPWGNldzN6SndJMGs0ZjVMSDhUcEx3UVBidExITUxjaTc5OXkwRVF1Nldz?=
 =?utf-8?B?VmlsajBEcmxyWmxoM2Q0NEl3ODlHSmZKT1VpNmFkdHZ3dTdjaGQ3aDh2Q3lG?=
 =?utf-8?B?SWU4dHJ1Qi9wNFZpdE5TajE3Q0JDMmM0VXVab1daYkFSU2wwUE9Kajh5SzFk?=
 =?utf-8?B?dUw4NWIyTWJLemtGZ1RZUExQUnRJN3ZQekZNSUozbnhmZENZd0hMSERmRlpP?=
 =?utf-8?B?bEZsZnYveWZEeWJEbXBlQWFYWm5SU3BYckhQeXRrOVlsZ05obGFxRERmRFV4?=
 =?utf-8?B?RXBUYjg4dzA0VkdnN1dlSWtYUjY3OTRZZFozTjB5ODhJZTlKV2FzWDBRaVZ4?=
 =?utf-8?B?MjJaU3BHVTQ5Y2x6cXREcU9EM1ZDTGdLNUsxUTI3NFZ1ejl6Z0UzVWdybGZS?=
 =?utf-8?B?RDRnWWVsVGJHL1hlVFEvUlZOZG05VlBWZ1FrQS9Zc3l0YzU5MnBiRm1Ua0N1?=
 =?utf-8?B?K3grWjJUL3pjdFZtMDdGVytCZTNaR0REK2dSZjFLS1BYVjBQVG9GbEpoalkx?=
 =?utf-8?B?ZmtadGRzTzA3ODB0R1Z0Sk1Ga2VFak1tcEdnYUU2UGtON2ZCenNqNndtazNW?=
 =?utf-8?Q?ITu8ppyPjVHper1c=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba228482-4cdf-4c21-f4ae-08deb2a09ed4
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 16:40:06.4559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 92c+AiWU/GtN77hLr4JmfL5PYTXBtKyEfktF4v9aInk32JmOCMQzIFlArCnd72WW93l40e0PmqtgdZRN5dPN3fn+1tk2Oc8e5eRWZZW7jm946IS7haaWt0uB63Lhgf/y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8159

From: Frank Li <Frank.Li@nxp.com>

Add freescale 2.4 GHz IEEE® 802.15.4/ZigBee mc1323 support.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
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

