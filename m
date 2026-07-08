Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010034.outbound.protection.outlook.com [52.101.69.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F543E5EC2
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 20:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783541356; cv=fail; b=ts+tTRm2s4H9b80ZvlcQVk7VlUeBJfWs47yBgSJA346kz7cPQDiJbOSo5Vmci42/QOTsHer2ztoiqGjbTRfqPkWMCHoKLUE6pP/PSrYQy+lI1k5R7RY+mXts4PussUb98faWK2DzEZtKrkLOss7rCpRnWads3d5MV4d4uW08ygg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783541356; c=relaxed/simple;
	bh=HUOf4qDlHDgtbSy6+XGd9oH7kj76/EyUXN0BnIJc7Sg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Dgu08uVr09S8rD+xcgqNqQgSBE6BfAQWVeUQy8p4UFDFmL4Kec+4M8t6XItCtFYd5OuQcjWIn4Tv27TAuLG/Cp8IJTzPUmc8Cl4lzE1tbvcCeQf9bsspOzbT73Cp57GcHdcWTBWiNItwzCrmmRXLEO1Mp/vrPaG2rxsA7Ywb7xo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dwnIDUob; arc=fail smtp.client-ip=52.101.69.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dwnIDUob"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aK2LeDU127sheKGVBtFH4ZrCJOpjWY5dXvhphSHGgZ0dc4TC415vn2JVpm0iFGU4VGLHwhDoCaPfEuiAlo6H+PW4Vkbq+sE6Dx9YTPBnbTPFnCcYGzBPmQHYdrPzRpG0tX0D/sCh+570sqb2BiLd/Jb51cTMhSFNEmLRfZ6690ZfD5FjSKaUGgckFYl3F1PQAFs/rGydKnITw+Co1QVtPH4hmt7nTyLhvmmxo6qnmhmyGJDzX7Hk2jP9rMsmmLonF0u+AORs/hkRunq3vR6p7VGXNUBlO0y3nh9xDKkNVpNr7XpqCJZv2axf/qmwWovjCnKVukuvxet5tTGPb/fBYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6DB05XKuwt8A1AXkYLm1sD1yHyG1qFnPHRhnF60WZ0=;
 b=y45n8awdnyWhIGcbVLBthh00q0n14ttQHKZNoQj6N/qoZQToMmzL6mu+E4IduFTTEwHjb5t635HEbenCM4qasj1l/USx/K9nE5DtTXWLhTK9dLShD7m4fQo+g7AzSzi6olOM/sQ4C4Pv3mrdOx+9X0ojWXZG0yx6Srb0g27qu5VwRBoEKzgerPwcf6/5KWXd22ZS1UG2ocBNTdXC57tDkruioeBo7WSfE/1NHjF06VY4biXnBL5NvK8nMj2HazqDKKASgcdxF5HmAETTlLGyUDBs1iPyIs7I18dxPw7ga/rROztr1mjEhZvR1gLu0GE869Zt8Uf2he7DOOIxAcStBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6DB05XKuwt8A1AXkYLm1sD1yHyG1qFnPHRhnF60WZ0=;
 b=dwnIDUobrgSumghe4EVI8b35ZjwOsXB6yXVodghUckoHvI4ZsGWoFXQL4HvgFq5D/fJe+WmlXNs19R388uYBDLokgvIe9Pyi8Zj9DMZm/YfpKAJJIU6MtMqH4VvnCvvJ8iiwiNhLQyRGompV4bwHssHc5OXMA7hUC1zV+r44qsPY7mFv7+N/sRAuWLGjTUULTFXIjsoocXnIZJVodNoyB0+YjjXv34UdhudiOHV33dwiHgGK8GEMIh2NQ4xej6zVGY4O8ztYA0Lq5RaYxLrAmbYcvVL1SyVWsdTW5/3FCxZHkUrXysolUTyffpQaa0gfAM0pPYyEhI+CBpi/SMuUSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB7571.eurprd04.prod.outlook.com (2603:10a6:20b:2dd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Wed, 8 Jul
 2026 20:09:09 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 20:09:09 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 08 Jul 2026 16:08:31 -0400
Subject: [PATCH 2/4] ARM: dts: imx53-smd: remove undocument property
 clock-names of ovti,ov5642
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-arm_dts_mini-v1-2-11b88825fd1c@nxp.com>
References: <20260708-arm_dts_mini-v1-0-11b88825fd1c@nxp.com>
In-Reply-To: <20260708-arm_dts_mini-v1-0-11b88825fd1c@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783541314; l=980;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=DbkHaNI6rWHdI1v+hQKv2Fysx7UKt3r2TM5W5tymNdA=;
 b=MSrcGj8YGuiDVVDACarRHcQGgp1JRiRMcvMh0DcBCag2jFSu0ZQTGyWYjFZfnh7VPRMAIctTM
 XD+WtJyiSUoAtvNQ5xxpU/AoM4q+RlxUJ/wVukb8r/GU2qJf49MEKbI
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7PR17CA0029.namprd17.prod.outlook.com
 (2603:10b6:510:323::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB7571:EE_
X-MS-Office365-Filtering-Correlation-Id: 67335fe2-b8fe-491c-792b-08dedd2cb9be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|23010399003|22082099003|18002099003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	okFQd9FIg388IgrDRaFrPVgvc9WIX9JkNnbt7Gm6tBaxUTMKhvbKe0dOhC+HAe6htf11+mxP4KKZmt9HMokIiKge0w5GkSii0tPyMocgxJEJWrfF+UrFeRmtL86QLcEfbAPOgT8lJp0rJaOBgO8rzl+cS4pAOLYSUJvRHjM3WGiSWDGSP01cTzG8axQolPvrIGFSRSdIkfn7BNlCRjLsK6QUSEJaMbLV2r6JxYH3uAch/KRyhxGRIgeDLPqw+hYVdEHfbmAjhLGpfTPseTzU60BXUE5dYIoSNygIQIbR2bd7PC59SiUNWQPPETdCoxLfqb70KCP512KonVQFBOFNwfa7tXn+NJCdzSsgoJ1scB8oO4+llsFqBAYf9UnY7YJPFrlfn0Jfv9LedWbiaxSs4wEtHAX7TopXRZwog/ZdTHJby4zsXnXe64zbtFsBbaRj/3yPRW3/+ye3PQXQyqITlHpGh71HKs9w+6aPbIc88gSffLIPuvglG956nhxIunzAbTi9vNg63ZJMwb2UGwMjpR9rb004Rz9ff6Suh+bzZ5ebfmW8ZqoE9/uDAks3BfiiedRBmX14tLpcarqplPu6OjoHQwkkv20edisIfmEQSNH19AcJQ4XJ2auGGPK6qQooG3RmbT8BUTcTgN0XFjwrZ99u9NhoifdG13WyURZTbPI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(23010399003)(22082099003)(18002099003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVhsSjQrTGZXVVFicFFjSDBmZTBhSjB0MFc4SW5RZG1RdW9aTWNxY2pBS1hC?=
 =?utf-8?B?Vy9LRFlLYmx1RjVyWDNrOXFLdkpSa1BtOTh6RE1sRktwUG41VG9NemZ0bXA1?=
 =?utf-8?B?bDJrT01VQTlPTkFKaW5ETURTTmYrN0dGbEhaM3M4UjAwbFFKbnNQamFHWUc2?=
 =?utf-8?B?TFRKZ1ZyU3BMNFBoNHZnVHpRU2hQT3BoL1lmM2xpeklYVGNqNWFoQ2g2eWVK?=
 =?utf-8?B?cHhjem1SbTlRdEtRV2ZKOEhWb0NmNzlORytKVzNBZmVLc0xTSFUzN2FCY1Ji?=
 =?utf-8?B?b1BLdllFeFJPcnBKR1hPWk1RMjR3cHRpdWJGb05lT3c3ZjdHRER6cUJpMEpR?=
 =?utf-8?B?RlFOVXZDcmFlN3hMYlNYbzk3ck1BN25jSTltQUwzVDlOeEZ3a2E5T2JPeHV0?=
 =?utf-8?B?Sm9IUW5XZWhQZEgrVDNJUXQ5RDg3b1BjQzdMbTZ2V1E3eFc4K2M3M1phWEw3?=
 =?utf-8?B?blZUemErNHhyNm44eWZLZGZOTCtiL3RFa0ptSkpyMVhvbGJNaFlTaXlVUlpa?=
 =?utf-8?B?R0VCQXlkSStwK0Z4VVllNVM2UFVBcHd3Ti8rUXJab2hUYU5uRTl1WGhUNlM5?=
 =?utf-8?B?MlJ1T0V5cGhjRXVxUzhtaW1VbnZTMVJPSkREMTRtUEVmTU9xQ1RjSjZCa3pB?=
 =?utf-8?B?Mm5YZXZ0cDU1V2ExSWpVUmEvSU1JaHBnZDh4eXdHRVZDZ3phNzk5ZFBhMDhF?=
 =?utf-8?B?ZDRNQmw1bllETG10ZFJzK3J2cjJ6R2p0RmFQcTNObVVUTWozdWJGSHErVS9a?=
 =?utf-8?B?Zy85bW96SmhrbjMybi9nRmQ5RlovU1VBdUFLRGF6ZW9QRHlGOFdpMi9jZFky?=
 =?utf-8?B?Sk5MK1B0V1pmRDhqcURQN0FtWGJOUkdGbDNKWDlWT0kxNlBjMGxDS2g0Rncx?=
 =?utf-8?B?Vmo5TWR5VDd3QjNLMndocU0yTGd0OWdrbjVnanhJMHFzcU8zaFl5WjZaUFBH?=
 =?utf-8?B?WjJ0S092bjJjODVJZmwzNCtGaC9GRklKb2plUlc0RVRZRzIzK1BTR1dkNllE?=
 =?utf-8?B?WmQ3ZG1oQnplOFJIZDdzcUZCa2dJQUphb2pGekYxRlFEMk9CcERJaUI1N3Ry?=
 =?utf-8?B?WjJ1UFU0a01kSTF4SmR2QUo2OU16My9WRlM2RmlFaWp5S25zMmYySlMrL0tu?=
 =?utf-8?B?L25FK3VCNW00eXV0NmsvaXNOWW9RZEtXa3BpZk1XWnNPd3BvamF1eVF3VFZl?=
 =?utf-8?B?anh4MjV6a0V3Rzg2SWo5UGExczROd3MvdFlXeUhzNytmNURkalBKMWhDZDUv?=
 =?utf-8?B?ZzBxK1YwZWloa2V0NTBZTm5tMnBYdDIybXUwd1FYRFdIOGhsbG5SLzNKSE00?=
 =?utf-8?B?SW5PcGM0S244Skt2WVVVMTk5aDc4amlJRHBsYVNHV2c3MEw0bkU3MTkvdHZu?=
 =?utf-8?B?bk5maWxWTXpEWWdYUm9SSFVrZXNmMzdXZzFMYVNtdTF3Nk5VUjF4RWF0OEtp?=
 =?utf-8?B?NDFpRVE4Y3I4OHVCYzgxdk4wQjc1VnlDUDVmK0JJcHRJczk5VExlbkVibXE3?=
 =?utf-8?B?UnRpblpYdkZiSnJGZXVoelpTWTFpbVJobkJqU2dPN1NieXdpUUZHaW5oTkdW?=
 =?utf-8?B?TnFwOW12U0I2eE1pQ2ZXS2ZmSks5RzhUa2R3TFFLSXdyck54YkcvQ3ZZM2Rj?=
 =?utf-8?B?Z3pacHo3RFhrbEdCbGdlK2JQS0RBOVZWNnppeXdRWnBjOGhjK3FIZWJKN0tq?=
 =?utf-8?B?VGUzTUswYlFiS3haRU01elErTWNkWm1HRnlSRndhYnc2cUdweGdlT2xaWUdD?=
 =?utf-8?B?bm8vK1lpamlTNWZhNnJpeFBwbWpJWXhTSFBFbEpwZXB6Y3VqdjdTZXl0cmh5?=
 =?utf-8?B?WEo4RGFhcXBQbmdNaERCSE95eUdPSk1sL25VTlFsSGU2UG1uNDVyMUFhQ3RV?=
 =?utf-8?B?T0pqajBvUzZUOWdYSnNxenpIUmxGSnBwWG1lZGpXYlp1REp5azNzSFVlc1Fn?=
 =?utf-8?B?NEFtSkR4dHJNbWNlOHFmVHk3VDZnQ0ZhRFpuVmRJREhWc3I5TUx0SmQxZ01j?=
 =?utf-8?B?Q1AvTkNJT1VzcXZ1YW1oMG1sb0w0SWE4TTk2cm03S3RKbzFLVDBsN0VOZTFO?=
 =?utf-8?B?MFZwSTd3T2dtM2htcDljY2tFd1dlNStFdFNodVNrQWlILzJHRnJVWEJNczdQ?=
 =?utf-8?B?dzNkd3FvTUdmTjFvd2FtNmZTS2tPOHJyMHpDZmZXK1Nla09DNURMZjV0Zkpp?=
 =?utf-8?B?V0lZTlREakoraitmbVBzRWowSkFiQThHYTR2QTcyQzJnZkVmT2g5SWZlWkZm?=
 =?utf-8?B?WnJSaUtLSnAwQkMzV3d6V1R2UnBXUk9JV1FGemtwcS9uRDZMVms0eFRCR0hG?=
 =?utf-8?B?S1NVdVIxeFU3ZnBoS1VvOTdNVkVqcU9RWXhpYUFNRkZKQ3hOK1F4Q2k5empp?=
 =?utf-8?Q?opd39KTaKxnCXZ7wJ4+XtUzvtJ2NW3nOwWxmf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67335fe2-b8fe-491c-792b-08dedd2cb9be
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 20:09:09.2337
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0SiDlB7KRMOxiu0ItMXfBGhjb0jvAAqz9LAnNZHhdQIm6BjMf9NcaRFilAVkZCPfCyECr0PM7y2bn1r3xFcbe+XUTBZpDbWkZ0ytJa3dgQeviaMcNMxwAOgxtcCoGZny
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7571

From: Frank Li <Frank.Li@nxp.com>

Remove undocument properties ovti,ov5642 to fix below CHECK_DTBS warnings:
 arch/arm/boot/dts/nxp/imx/imx53-smd.dtb: ov5642@3c (ovti,ov5642): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
        from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov5642.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx53-smd.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx53-smd.dts b/arch/arm/boot/dts/nxp/imx/imx53-smd.dts
index 8c02731c7ba9d..29d38484cd386 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53-smd.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx53-smd.dts
@@ -306,7 +306,6 @@ camera: ov5642@3c {
 					 <&clks IMX5_CLK_SSI_EXT1_PODF>;
 		assigned-clock-rates = <0>, <24000000>;
 		clocks = <&clks IMX5_CLK_SSI_EXT1_GATE>;
-		clock-names = "xclk";
 		DVDD-supply = <&ldo9_reg>;
 		AVDD-supply = <&ldo7_reg>;
 		reset-gpios = <&gpio6 9 GPIO_ACTIVE_LOW>;

-- 
2.43.0

