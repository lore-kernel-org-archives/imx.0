Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010043.outbound.protection.outlook.com [52.101.69.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884F83D9052
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 19:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783366186; cv=fail; b=GB/xDoFjIKBmPDczJIRlO52waEPFhCXyOXtBVn0HehgqaBNW1p86pqrbEAs12QGxqxe+GI+n4AnKBfbts/51FMr2UpFLsqqpCNKnEitZWc7+Jt+TyJHGAOgMsBHkxpERmKeEkYe2+9uLsMITG+KGTKQ4kW54z9k9MEsoqNlSidU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783366186; c=relaxed/simple;
	bh=8d/ibULLXK0PxEgLp8IGC5MM8xfEP7NXa6HMKqeRGOI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=R4fUr+lJ+zOcvuczfMp2o2Yx9/Gxzpjrkelttz+xmlE7flrhv3S5JAIbwZ2zkYDAvl4D30jeFxauV8A5cWAx0Z1b4a+zOjn0bm7Hg6guKelSBDVnlKXY+ue6Knd6RXyoHoTzPGDnngbwbIMPOGb7DMt+eH4nd7IULo5WdFiErog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=m6Ae9ilR; arc=fail smtp.client-ip=52.101.69.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="m6Ae9ilR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vlq7sqCWYGkEGbwDN5lScNJ4qi2B2fv9QyiBbz2X+p2tKBaqjXqA7Syk84hadgkvJDqzmsoTRoB67XonkKNqvwYQou3Hnc6oC9GGAFwiNHldZTMggdebr3K0Qw9JSZsc8QeDW6ajSLz3g9TE1peCTZViSg5NsvxhajYukxYxtwAe4KBNQB/nmD5l4G60tDzyabu43GCvzU/jtgX+dI2DJPGQ+kBFEcn25AteyI+fLaIEyZrM73Cf7RYm3oYF5b8lRtRbrILBg7aUHlZqXAhbWcakP7WND8KN/97zw2BYHdGhacpDCBF6mBliPyrYU0E3CxM9he56INOa3Fj9bk6w7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hr2NPUTo7WR2HUFRKWBr6+C1/10nbPAmkGq80diRQC8=;
 b=a0iLWhx/Op/Ny2ba/LsNQ2C/F7vLqoehETibuAfqagcSMLebJ2dDy2AMj7PVbo45I8wFLCUZeVnYgWXtW3JjgMQTz52N+stMiBFBFtVPhUjiNFZK4mkrgQJDwTu2lNKOhteOWqhGsBoMhdkZkYoabl6n+EbkXsWB3+A/UG/owUHHWq8PGReYBfs0CjyJjHwcN9FdvDoFcu5ZLXqz87jvBx7E5Y0dnebP+kEkdkSrVxygzqaKTpNohzL7isAZwUaIl5q2v+Gx1S3OqFfE51abU6KFz/UKnAMpkBgVK1NKqzMOox82BWMUXd/jRijGlem2A5/Yw0iBkCjrN211cr4UrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hr2NPUTo7WR2HUFRKWBr6+C1/10nbPAmkGq80diRQC8=;
 b=m6Ae9ilRNfQ9jlEJZK7+s4YDsrL1JZjseKawD8lVHmbM2EdCmu2tU0A46NWMXsrBj+pak7cGPsAGobV+5/sDjrLJkN3xd51FsfwwViIjFJLmQPZPd0EwSQdD9fDLALkQMwnGr6WMjnlU5+XxxyshGGOypaRGns1tpTdoZlsis35TNm1TKyy6BdPDQ6XZMQRMkvkbPmX5anFebhyp8qYays59S7OJIBk4hSkbUK3ssvQhR/mHS8rWND3i4RwMeI9i2O9gMk56ab/MPRkYaY4hLjwZuI1PmY7oFXKnCaX7TKIVEC+JRuS9Wzx/U0NSwEqLL9yo12dSvV+32Jiw+n7PCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI0PR04MB10832.eurprd04.prod.outlook.com (2603:10a6:800:267::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 19:29:40 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 6 Jul 2026
 19:29:40 +0000
From: Frank.Li@oss.nxp.com
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Linus Walleij <linusw@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v3 1/1] dt-bindings: mfd: st,stmpe: fix typo st,stmpe601 (should be st,stmpe610)
Date: Mon,  6 Jul 2026 15:29:32 -0400
Message-ID: <20260706192932.1573584-1-Frank.Li@oss.nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH1PEPF0001330D.namprd07.prod.outlook.com
 (2603:10b6:518:1::1c) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI0PR04MB10832:EE_
X-MS-Office365-Filtering-Correlation-Id: ffd667e7-f4ce-4bdc-5fbb-08dedb94ec46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|7416014|1800799024|366016|18002099003|56012099006|3023799007|11063799006|921020;
X-Microsoft-Antispam-Message-Info:
	bFaWm3eJ9vMwJkorrFlysTWa4kZBcO1lErJE/POUPCk+GyPLZoynPlX48t/cf2Ef4wmbyBl8pjrUn9pcS75ec+hjXZhnwbXQyUQ9Pym9eWOFPPVXyyT0BnHJ2axmO35NoWoipKaUvhVaXgH93fiHvkKeSxBu0EBC+aBqU5QHfub2n1L91jEDv1tHUrVoLD4rEME2W12Q/OIwNtN1S6JP+boyV4ACNM2BSgOhpKfScEGe5VrE8xX93pWRf7CtRC5qHPST7Lm1rwJwDJNKBh0xkwgH3ORJtf1Lare1VDb4y10Xwxft6PNdHAdUaMjD0Uh104vr06ZiMWxdgiffeFywjVEpgHqJsijUte2yvf5hc/0iN7jmvaKugB0HzVnI05OMPKUmRGp7K4Y9P8mMByNmkYF9+wOX5fz1D4lCINnVS90laApFG4b01RblUotvHwzavyzQ+lyBkIRsTzX9zWX6Gr7879LbEZkb7UEhJsMS6AgjiQ8yayXJahw34fsf3EXUO50vNK5x6/7oM9l9N1km/jFvxIKQ5genkigxkDWfXEMkZJLAcYpbPePe86CxA5wTgRMXrETAQ0VkJFthOvXJJcmgIPzP6k7fIrCn3YqGdDkx4vLDngeMGY+KLA+nHGyfpj7w5t8PFMakAKkYAVUUonGTsAIsi2oWxV1WiRaIsIkvnt4qXt5+TCm0gsDLtwDDtwrXqnazInAYwNT/5+agQA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(7416014)(1800799024)(366016)(18002099003)(56012099006)(3023799007)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6KWsn5DBMUryfFF8eR0woaWBBI6WufXLq4sUNnkrM6wxzebFlx9452c6b2la?=
 =?us-ascii?Q?WBsJxObPowmMMwdIWrH6ShxMCiLpE4fIQJIJ6vfKhCxz59xDJa7lEN8ArBOb?=
 =?us-ascii?Q?ab6CvDmELfzPvsL4xQb9mkYtSwLbjZsVQjRwZFzC8DrdHne9onL+xc7DEeon?=
 =?us-ascii?Q?Z2ZZOyi2+LfRD9xfEKjd3RAJuApzt+xK+6C3wR5RBlmKU4dHceJirqQZ8zWI?=
 =?us-ascii?Q?fVwR0PN3gDapIcV+Y2bRopd2lj59G8Vj4qyq5E9Qr3bMoXVicHbKnEzVLTaH?=
 =?us-ascii?Q?Wmvn8osiFJbTB8SexNgRFtbelu9bHHf2cYFxBPMjNs/jim5zGZoJ2R1+PKPh?=
 =?us-ascii?Q?xMhj0biFyQ61E3iH9lxolrTbIWjZDyeb/PMtG1P2eC9aE2rL9eOu31GJ9RJQ?=
 =?us-ascii?Q?bMUCQGmiDfZ4YDwFi2Htm5kMbhc+sdmJ6Fjsq6rlzc7zUPl2sS8VNbg6gUv1?=
 =?us-ascii?Q?kugYW4YgB9IdW/mH0H4nAmOmoInsQvaFTka1LqauSoUtnUbty6ngOiP4h3Mq?=
 =?us-ascii?Q?gnL9E+9gcOUEq/HPLEKx1clWX1876khueMgeoCtN5NxdNZ1WOHxBm4qnUFqe?=
 =?us-ascii?Q?Re3d3bx/IjjI0NXUyWLeUf4j+SrNbzLAdONXGFrzGbyw1PXM8n0bjia9wVGV?=
 =?us-ascii?Q?f0gaoU9eeyFqMFLekxlNatk4u0LZcCwZ0fxSEUqAWXD+iPtmFGPlxvYWnEPw?=
 =?us-ascii?Q?j45ZtvYguiWAgbjwPvHzPOr6RuhOKXfiHiNtETglYTojneha5XiehMbTcUE/?=
 =?us-ascii?Q?VQqxbj3NKwMQDGq6Dn1/Bf/9gtBCF/Dwt+FB8sYeaVtXA5Xg8BBTW6xw6Ma2?=
 =?us-ascii?Q?hUiu47kiO3ovZZwp9vSXAlb5DLH8nYh0Kq2ZhlaaotS6R4mA1HiWPG8Kyarj?=
 =?us-ascii?Q?ZBcQoCrLe0xZzx7diz2xVEyttJFgMU1gQ3AAoSyap7F6r1C8HtHKXRZ3uBKA?=
 =?us-ascii?Q?FVovLl6EmydVnvkbFiXsVUlcvBDOfBjyj1o3AaqXwDsLT+brFoCT6oPhsBSi?=
 =?us-ascii?Q?r1nlLn8SMBQ+biC6mronrqQFttpOTQuUG6xb3Wyog7VebzyTc47f5Nxqzdzu?=
 =?us-ascii?Q?JZ5Gg6JCypbMETYMvhoxCeVBFtPAAm4mHNNxkT5k8S0FpZ/GxlB3vX1YkfaG?=
 =?us-ascii?Q?tf/Zhe5nJy1mZQsWBxU8P9NU21qNNluiJkkcyWEMfFLtlBOc4Y9G8BvBLgk/?=
 =?us-ascii?Q?IQVujA+LQfEoSk6Fy9kYekf6KbCZqSYfVN+O5/5yyahMJ/Af00EIBj949H2S?=
 =?us-ascii?Q?KXoeLkovc4FHBQRxg/uN4jGsbY+utTityxY7SQOsu5eTGAhLR9ICJaFyoR5D?=
 =?us-ascii?Q?cWzJZ2qEarEfP1ugQ1vjP1Wwfpu0265l6QE09faMVzYfnEt0OS8/NLCEQBj1?=
 =?us-ascii?Q?KOeYvMYcGDMm85/N5khF1q34EnI+H1tok1IKAYNTX5by+sqDSvWuwo9p06cr?=
 =?us-ascii?Q?gpQcNhZ812XRGr4oSkxHnbTSAxuc4C28ZAhJ/s1YADzmTv3SoNF8LsCLqHqU?=
 =?us-ascii?Q?xKFBitSRMDf9YijighEjY/FZDTkuX6ur8sCCSnBSSGI8JG5OHun+RYzTzOFt?=
 =?us-ascii?Q?l9ZC9ooDGfiHPcmHFCa7RlNQ31erw2wen17jUR4ijMz5I63KMP5TxFRzRDVr?=
 =?us-ascii?Q?l4mgJU4+cjxInwFCCcwTUANYlDIVqmyqP6B50OmnWhrgJLSbiIAgof+4ayTG?=
 =?us-ascii?Q?4AwZHlLLxpxkI11+bkoViX2dsBCZiu4pcavsf44n6LTqMD3hFmCScGsvpveH?=
 =?us-ascii?Q?X2z4TziocnYC993Kha+S7RFGoJQTKnt7MEKhm9IZg6ivC4GK3Cqk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd667e7-f4ce-4bdc-5fbb-08dedb94ec46
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 19:29:40.0919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EA2CVOdwo7TTAipXryCw0UlKnAZXH6tHmTyaqyQNgEr5jzVCB8s1eG/UjCBOEx8xq0Gqeq54wx6Nxtakj2VgtkLe1eiCRg7i5xQ5mALZJogUzq9QDc2xPRYjca1STLEG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10832

From: Frank Li <Frank.Li@nxp.com>

The compatible string "st,stmpe601" is a typo and does not correspond to
any existing STMPE device in either the driver or DTS files. The correct
compatible string is "st,stmpe610".

Fix the typo to ensure proper schema matching and eliminate the
following CHECK_DTBS warning:
  imx53-m53evk.dtb: /soc/bus@60000000/i2c@63fc4000/touchscreen@41: failed to match any schema with compatible: ['st,stmpe610']

Fixes: e10038ce1ba9 ("dt-bindings: mfd: Convert STMPE to YAML schema")
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
changes in v3
- add fixes tag
- add Linus Walleij review tags

changes in v2
- fix typo st,stmpe601
---
 Documentation/devicetree/bindings/mfd/st,stmpe.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/st,stmpe.yaml b/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
index 4bb05d544901c..ddb27ae64ba37 100644
--- a/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
@@ -20,7 +20,7 @@ allOf:
 properties:
   compatible:
     enum:
-      - st,stmpe601
+      - st,stmpe610
       - st,stmpe801
       - st,stmpe811
       - st,stmpe1600
-- 
2.43.0

