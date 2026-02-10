Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013036.outbound.protection.outlook.com [40.107.162.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F12329E5E
	for <imx@lists.linux.dev>; Tue, 10 Feb 2026 22:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770761556; cv=fail; b=u2FiVD7qGhZbl+/bUfVvS//WCw0heN4GYXRncWTZsle5fHNmJx8Tox7I3MrR33Tkg7sCSpmY7akSEA/NqD6QpJS4zuO+4HpqQqkj5GTjptIKuJI65VRBHxYQ/qCNe/MX8uAdx2qbElRvBuDO7NNrB2Jm1O1ZJuHid2ntIzD8zv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770761556; c=relaxed/simple;
	bh=Urc5bu5VoVtYZBmKEdxEpYwwFCk8SaqUAfJqwL6tEJE=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Tly/OxmU+pRWfjANu9xclLXlxU20p8byfIPJmVUMfd6oW13CzucTuXYVeGqP2q9eblFfdbuC9cojGa2UxBVLQPT2Sz7WsLv3Wm5ucnGDu8ERRL0wdaPwTfWKeg/Yi8otimAAAjjF4Dm6xdtX13ScaKJxGWUYOKqXGw3l2L1J+NM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Qefi4rV+; arc=fail smtp.client-ip=40.107.162.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Qefi4rV+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZbQKrncg2sim/cmXQtT9CEfw3cgRzeej137dhbyKwX30qmiiWdNo6n6GMVPnP89c8rggrUobCQ2x3lUABVNqjff5GzT7d84S6FojCebJTiOJuHOLMQfVAMOh74Jg5OhkOATPnEd7cY09uZkRJ8zO0J6F4gsIk+QB+NLc1Hf81JarKPi5+khTNJ98EeRxTd/UcIEmE2xiLoOwK1xwVXmbkhQTnGeWeRpmoDXH0yQesur2+4JGFk2S4iUpbb/N7q0sdH31RXWCy/TdRKEloE5HyIotU0HAVaLDf4KWXxdMuni6DdhvH0+iLUSRjmg8MKQbVBJn5zzYQaAeew8KuxqAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5bLLdYSo3D2hpRITWpSIW8EgDwtVwAu4zKNXP8YWQE=;
 b=mmHPsJ5+PsXn01IGac49ZrXNlz78vG2Hy+YBTmbkNQWA13bK+8CDKe/Jzyxyx2QaFx+rH/jsJAm7A7KWTYAWTOheH+6rgJm6SmR9u3zOpJOjFeigUZfGXmMifzzU7HxuU1dwimR0vfI22LOaWDhWpkUNSK/TG15GkObQs9FD9a+x2OdY0uDcCcj4o8f3qK94cVzuyFO5bBLCl42NZuUwpzY4SEbnZ+f0NZdW4aPVJHUPzepY8IHUwsvZu9DPxY0YLhVSU3o5feJ3ZNiFTSORoiyik5LXGVCfjGIeOITwEt0OzpgI5SiX6MtbM/TqI5V5egPP7l9RB2gIM6e0CG8Y9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5bLLdYSo3D2hpRITWpSIW8EgDwtVwAu4zKNXP8YWQE=;
 b=Qefi4rV+j3/kDlRfVqk0bXgZIPMTY3JsUJiKmuAPORLAX2mM81F1hyeaTrFRjVEwPbqJgpxBQ/a+LmZ8yvLzwKmELAWtAcLoJNOxRbte0JgebJ78mIAL8tSAeSZFMjkhK3d18J/fr7yqeG3VzGBXWLSLlLhIO0cN+oNQkhaxjA1sbi1VaIK9DIieQze3SBcTCR1eOese8k8MYq9uopW4aUPCmyFaYy322Pu9iMry+CnEj0MwFzvEbLg4FrH6/kM2Lvp4B+/+5TKyFn9Y/MJsxU6slUxTV/RPAcnd0RjiIIcOXKiyKgpoKGqKwAUm9Lts4K2mED4d6yskE9wACX3vCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PA1PR04MB11261.eurprd04.prod.outlook.com (2603:10a6:102:4eb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.17; Tue, 10 Feb
 2026 22:12:30 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Tue, 10 Feb 2026
 22:12:30 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org (open list:IRQCHIP DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: interrupt-controller: Add compatiblie string fsl,imx(1|25|27|31|35)-avic
Date: Tue, 10 Feb 2026 17:12:14 -0500
Message-ID: <20260210221215.1575844-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8P220CA0043.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:2d9::13) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PA1PR04MB11261:EE_
X-MS-Office365-Filtering-Correlation-Id: 2be5c3c4-3ecf-44d7-d817-08de68f17b79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lxrnYZm/M7MYAFDF1Y942uNGSdO1QZEpAoJHnXhocxPvKpu6qeTyCKrLp2MY?=
 =?us-ascii?Q?8RBAklrhp1I037P3AlIOxm/I3kNcU4p4gerVPH/7wDNPPrMpt4Wcp1abqooH?=
 =?us-ascii?Q?URi6LCmBhXLOdtZjsuT/oVKeeJm1ViCHd52iGazVJU+edVQjBES3JyWfUNu0?=
 =?us-ascii?Q?BI8firwJ/RJvVpI2Rw+4VLnCC82vm1BW5r8cPxK3Nhd+GI35/qZb4cVGVc1f?=
 =?us-ascii?Q?/VliZAninpvAHrQdFGyIpsHfurJ2kS7sIMsfvVN/DcCwrAaqlH4HwPgpBTvT?=
 =?us-ascii?Q?ERGlPeEDAcMRkbUPpJRorrDYYb8X4/QrdtBbruxUEF64vk7RULthdHbB4L52?=
 =?us-ascii?Q?sr3a1drotzEGK5YenuVjlHYOrw+UekmxS1D6BlVhRx06kWoQl20GNomMRf/W?=
 =?us-ascii?Q?sTufXEPIzOSHr1O8rvU7dAbyyYo2rhWuvAihBHjkWOTgtmQ9vYvTs84n4nwc?=
 =?us-ascii?Q?KNfDHvLyzrZh4rmh2yL+miWf2b8WD03YG8QoqR8vLrFcz2ZKIGPKK66kKEXI?=
 =?us-ascii?Q?kwDdnS11trTVwn0UqEVg2kAYO77vxZthTuMIwzVh6GBCsa8F2yQmdkk2T+PD?=
 =?us-ascii?Q?0QRFP2zGkw+8d/cMFPyOmf3kkzqMli8rhUwfOdjCJIlT9XE5hf+ezyt+epp+?=
 =?us-ascii?Q?WTo7aHd/PkRenZxuUiDDkqbIJbCTl83F5hcLGwGm7M5gYdhjRGfD5q7i5FfT?=
 =?us-ascii?Q?GgYzk9xUkXUMkaG0p1ruhKtIwe2z/myCfcv7I7UUvSJB2FIrUe8dpy7sAHNH?=
 =?us-ascii?Q?Qz5gt6SJ38YAxvwJ3WAp4/ld++7x+CtKElXsA5zB+83Jxx22V5P9DbF4HOVM?=
 =?us-ascii?Q?8siq+USisghs9kV5hLk0qkZLKiszosCKXvOiZ69qec3J5cdzj6gVurLwfJ8V?=
 =?us-ascii?Q?WdRXsqBteCetsF+T+dF4m/LGaRoV1qtlPFgcnwo8Hg+0IbjSyGtxsaPuN06y?=
 =?us-ascii?Q?bgQ0HYAFFYmbr/V6dwoAF3wN7sjBQJwxx+rHxbEYkJDIQp7d+kV1lk6rV8Z/?=
 =?us-ascii?Q?f1XR7TEzE7z4j5GePGuTwc5idAUPCyx51B/3hg3ktadQcHTJ/Ir+O+G3A6VK?=
 =?us-ascii?Q?9t8XiOyOku3188NqI5PhyG0GTGZsImnCtZRkBfsl7NOx/ou+/EFvXvoTLoHZ?=
 =?us-ascii?Q?68sip1O1diKvMpBdz8fCAnRsNzEhsl0fK1AOKwjyRMlJAjcRtYcI0qKrq4V0?=
 =?us-ascii?Q?9j2321yYHkuwi5bNOv4omtvMq6cWfxM5mzPNnO+vzPvXTa692HZZSELfRvSf?=
 =?us-ascii?Q?BRcTMvkwU1zKLrC083Bl2Z1BDHfXpW2kpJdTiVxoV0ObcKYOZb34CqglysVL?=
 =?us-ascii?Q?dVdGRGWGNeuJCRC7GhlPjWAFLiRUbyRkKGatVWuSYpDE2+s6P2liZhLh0BOw?=
 =?us-ascii?Q?eV7l90gmkRWBCdvKGKzkMUPJ53zfYhmkh6STjViGhxOc1rBtzHmNkktd/I36?=
 =?us-ascii?Q?Q4wJDBrm/p2YHL17EmXWIYarJgWLuEVlqtBrMSg7fYmEmgEJafNNifYYYWMM?=
 =?us-ascii?Q?6H8aOEf/D8ZPw4FJGclN6hi/aLIU3RfdOKMo3crmxhfqYCLD5FkmtCUDuZgA?=
 =?us-ascii?Q?zbLoWnBSyqyukOpABU2PUNTNa13wW8FQmd9NJJOkGyfoehmc1QIca+7q93bY?=
 =?us-ascii?Q?E3vlSBDxf7SA//p8yGG12VU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9DvqCIYH9ZVwLsxPgC9Xs2s7WMUrAU4dA+RVn7hL+DiXGYzlh1w5q4YL5C0g?=
 =?us-ascii?Q?NsyPlt4hJ7canzpo8clRYBdDpmQtLEYMgmbsOY4oHkRnbpyZ1vaHyGC1HMTC?=
 =?us-ascii?Q?y9ij6+EB/soQ1ZO5J+ZFowVmee8H5O5fAC4QTNaNBf5IreMMhVRjLaKGtvUz?=
 =?us-ascii?Q?7A9H2YbHjrt+GzWcYALzWIwNY8KSmkAPVuMAG0ABWn3RUpHIj3bAmtK5fmOq?=
 =?us-ascii?Q?vBYLrVoL3S36ZQEYS39m+3f2i/S7LQenU0Twk/U0tmMWpbKxTlTJrcpDGsno?=
 =?us-ascii?Q?JrZFCmO8YXDGP8NSBo6tChQrelEKwLJllD1WImD9pa2g8PQqQvLf+2QbjrYf?=
 =?us-ascii?Q?nLOE+3dv9/Mhd+G5dkzUOdQ54mvb62eQrL+3lonsu45vfXTWLFaGX4BHtaDE?=
 =?us-ascii?Q?j+0esUqKkyc0+2J4e11oki+wFUBw5ASRxbHEepyorf7x7Qv1IgOgMxwh5ztp?=
 =?us-ascii?Q?Ees6hv5jH7O1CLHf0wiriK1VA/Q9kTZxMLzOo2AVETjJ7DkvhxaheyLOkwBW?=
 =?us-ascii?Q?WDt+qcgveSI3Guh6NywFO2L5xnNslMwsoJe4rDt2dVaxGdJ10Ru59R/oxjjl?=
 =?us-ascii?Q?DhNd7X858lJizOTvzAvt5Nx2EhLpwHVzwcv+wYPLq5xcpzdIkVwC0Kkus2s0?=
 =?us-ascii?Q?nkbCMJR/1H8HaLgZkl57WmaafQ1q+IFwMzyZcP1bV/DoBCq7IcrcW1/n0uzp?=
 =?us-ascii?Q?I5sse6UJt/dvAKmvMgCQwgu9zUaM917LrKnK7/5L5rtOPBMKV/1exUiJiPzc?=
 =?us-ascii?Q?pAdkw8d4B/ncPemGQYMk2H0BMND7P7zyqgLjVqpL41V2t6eh1OgrSeS8Q9Hc?=
 =?us-ascii?Q?MFdo1K6hfEutwGxFBtFjPDoS4d+H6V4GwWKKba+IFTsMLPK9embn5/95SLf+?=
 =?us-ascii?Q?vAFElCI+mlPFSeR1NU2urKJpfQGAPDNBifeRHxxvRWsKtnRogdMyG5pNEmDS?=
 =?us-ascii?Q?k9wE1xPjXUDTP7UHw+RBG6j/YJ4P7qf/Sy4lsIVx8sb3g+jdJ4j1SyP0gv9m?=
 =?us-ascii?Q?zpyolp6/QrgOKaDJxzYyaOeLykQ0/CI1QDfu2WTjZvbjkGHBy/8+Y0jkwvKo?=
 =?us-ascii?Q?Bux8tWo/MHfpD163IWLWcFEL2l7j29ciCphhEnBMvZ05hbh7DscXo98CF/lj?=
 =?us-ascii?Q?Yrxuxa9JrCpI+wT+VZlooQmcUAyynCnx9jOgLq1xZkYjustINtI/J7Nqwzbf?=
 =?us-ascii?Q?+fllucVzRb/1FQQ1bWaBOv7UFQ8ot7W7WLRDZ43wNf3kzSB4XF9SOHImpBLC?=
 =?us-ascii?Q?CNMoP10cQCNrKR7oBszqvdkQnmdf7V73D0QcZ1gkC0+Kyoe8XEpxIKyzwi+V?=
 =?us-ascii?Q?hbVEXu5ZGhGDbJU4fCjQt32OR8vYDQ0JMS4T68+VguFT32LTeTxhWPJz1oKH?=
 =?us-ascii?Q?l/7rOK7Vmr7rWfquzbPXqlgcPRHS/C23a3YU4ym2f2/4JCqJlMUZDAOliZ4S?=
 =?us-ascii?Q?o/E3deTzPaVt+dWf7uW8FKlEmYXjwy1tBPU/KiubqfZFFws9AVGPCDIXc9Lg?=
 =?us-ascii?Q?IjZI9ZMu6EnBRN7/qshg7Shpbih2fc+5JJkuiBmWTXtj+UJU0r+MokXifrSL?=
 =?us-ascii?Q?H405MtSbZ/sC6kaXB6RshBoQWBQ5GuqZHnFdbVp9VpXoKt48BLg/r52CZt3c?=
 =?us-ascii?Q?A/yYGoiGkiobABMv6Q5et4XsHlVUwzz1Sli12CgqDTjOzySaVglf3CIGGPIM?=
 =?us-ascii?Q?mt2eHLcJJTBZhmHUYvs57M8VWWJiLotYy3z1Ef6g1TvT6GIq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be5c3c4-3ecf-44d7-d817-08de68f17b79
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 22:12:30.4018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P/lDktHnDooym96/kPjAnwoe8V1wB8JWke4XPvefFUU4+myNz42cr0pE4TBZGmeF4LoYXgLi6UuZEZa3uTNCRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11261

Add compatiblie string fsl,imx(1|25|27|31|35)-avic for i.MX3 SoCs (over 15
years old).

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- add imx1, 25, 27
---
 .../bindings/interrupt-controller/fsl,tzic.yaml           | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,tzic.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,tzic.yaml
index 5f2c8761a31de..e4674a9cc2c1c 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/fsl,tzic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,tzic.yaml
@@ -12,6 +12,14 @@ maintainers:
 properties:
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - fsl,imx1-aitc
+              - fsl,imx25-asic
+              - fsl,imx27-aitc
+              - fsl,imx31-avic
+              - fsl,imx35-avic
+          - const: fsl,avic
       - items:
           - enum:
               - fsl,imx51-tzic
-- 
2.43.0

