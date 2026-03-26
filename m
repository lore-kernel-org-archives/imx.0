Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013023.outbound.protection.outlook.com [40.107.162.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8102FF17A
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 07:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774511491; cv=fail; b=I/ti0OkcWphVuO27WKyoIjrs1IjGueBlMguF2ZfVbexeNSDLCH/aS/GV/YcEAgKI1Z3KvN2gCZEeqt4xRoQOuI9c4KXUyOFSmY4eVE7N7l+wLlYPGOYMUWrKQC735kWK4vcmXl8g+NL+AWtHFtDApm1RoAmlx4akPmq8cxRc7kw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774511491; c=relaxed/simple;
	bh=GSzjxsOasNqThy9J0ZFKz4TJAwlcff47WFCDB0c7vIY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fAh7m14DMZnih0rV3U/F+9Y3EzFGrSO5Yq3Dx2E5TWJpIXHl2sTiw54vSX1jaqvw6d5WqJBNbmhthqyUqof6z3iADon0qsAKoP9x/HObiZ6c6DOGIk0P+xjEPbPnMdmInk6FFy7008a4tE19k1rakt5YrcFH8xTY2Yr8hjiWfGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZsWkWBHl; arc=fail smtp.client-ip=40.107.162.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZsWkWBHl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w1Gcdpyn0MveyqW0EGNSnLEFvDd+hT71+mlS5jEFiTiTaZE0iXmBPQmYS3x5CvLuRF9CfHQh0X6kU+6YIzs42XYfMCnVquwRRDyv8AP3QeoRbWlAy6VUyhmQcohKc4BI3mZ/DHTHbS+Dl6tpw5TtxxlinkPBx4mHJTTRDOdFJn52fnxxONprbpeLvHWfBWhJGuIRRU/wL7bYLYPRrTlQFL1ltfdCoMnZN/A6mvC1Ph/NV6dNDC/0RW+J9jNBh+e+UYq8Pdm5ptj2LdW82Gl4DkSL7fRgHREgPyG0xgwOSqAc+YfKPXZO7en02HCNnAOILzZ9QJEylsTsgiE+M5+AaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KLqmIfhXO4a3GvVxx8Nj84KKdkByl8QNdpYmDhCQ1s=;
 b=BTvdV1VNIY8NH9ix59XIB2NHfg7NMlZGsCdOJmQeJZ2OeTaWq0b8P7y9gV3ynW/WmeR8eh0GqD21O3bBFefb7dQpFuPA7NK3vtWaPdjim12WgImaMUck2S0rvYUcl8iuLD/0mdB7ShTAxiYCu1GGHiZ4roBsGwemThgYka8lO45SlFsTCwTIwENU+juT0o8qQxKVkeDU6XUWAt3V8mMQXBnDHoQV38PBF7yhsXQXdUAXD/kfDGTnVT5lR3CtLG1AmjJGVepCU7DZm4MRq0m6nIQ1F2p2EVkBjZ0yIume7Y18zm0b+u5B3ilVVDIu1Ni4FgC/RP5rxxWqjAYTgyZ9og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0KLqmIfhXO4a3GvVxx8Nj84KKdkByl8QNdpYmDhCQ1s=;
 b=ZsWkWBHlV6u1lWaBDwZNlvR/ZQ0oV4+u6EHgPEvwOFx8jocs3ng+/g/4DPrJFgc3Z/Twe43cRdjDjQxUvpCGrbpDdhxvDJWsU+s24087TvSqIqf26VnrDN3YRW0do5sguwiSlRV+Y7C/PMM7OAqyI5/eKmfV1WCENMZQqcHNgfU0JoIcGX8/BHLT/DasRs2AkMEr+CyN2Z6z4djxkw0Qh9utKH83xlTRUPv6BpRHBbj33kDSUu6KRYnai/UTdhdKWpmUED+1F5VPzNVAETiw7YlQzNMMR0jtRltiP2Mk1zmft7IX/aWLv/YJRb0bjA5YNVXQHsqNpHGKPkcAVTx5Ww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by AM9PR04MB8413.eurprd04.prod.outlook.com (2603:10a6:20b:3ec::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 07:51:23 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::1fdb:9c8f:5400:8bdb]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::1fdb:9c8f:5400:8bdb%4]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 07:51:23 +0000
From: Joy Zou <joy.zou@nxp.com>
Date: Thu, 26 Mar 2026 15:51:37 +0800
Subject: [PATCH v2 1/5] dt-bindings: arm: fsl: add i.MX91 9x9 QSB board
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-b4-imx91-qsb-dts-v2-1-b991b81639e6@nxp.com>
References: <20260326-b4-imx91-qsb-dts-v2-0-b991b81639e6@nxp.com>
In-Reply-To: <20260326-b4-imx91-qsb-dts-v2-0-b991b81639e6@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Joy Zou <joy.zou@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2P153CA0045.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::14)
 To AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9386:EE_|AM9PR04MB8413:EE_
X-MS-Office365-Filtering-Correlation-Id: 57cdc1ea-1836-469e-a1bf-08de8b0c79f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|7416014|376014|366016|1800799024|18002099003|22082099003|56012099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	VT9ryW5gIvywvhg2nksqa4W+ySUZyKsIZMC9KPXRibjNrHImj6sAS5Oa9oManb/x1Plu5uvn6hNX8wN0Si06vW3dtJVfUIvG+M1Te4AaA7CGLzoOiWnVMlcr3Sf/85GKDXIA/iL8ooGXlDerBL93bwVCBagwfF4I0g+LqrO8FxnP/6IlkyyqJ+zHf2hMpQ2SUUZcpe2LssFLXlw7P8sHyVS2lPaMvXgFHw4VFL+otgACS/onILGuJ2yRKsrqZQs46g62jx69bujpker55kjpblRPu/c3wSRkuzZ4WjLf78aCQcPqfhbdpZhlBv902FrwElBO48tt0h4xqxPWuH/Y7YDxStgrXg7eafnRoZqYqjxxQjlgWzbLIsBKHDNREV03CIB3PUL0GImwBGkOBwJBqiRAjOFe3K+rwxZVh1/FGhn0QzZwCy05aZPN6vgv/iMLOaqQGJn4Vnyw7pkkW2Y4jcQujrApCaKzqAtkr2FETjdqXKYq8lt8QiMYnRBeKZ/YMOSfW2Zat71puWjlV22Zpty6VyyX0gctXzpX6t5LzEyLieeI8zjg0AbxKaMe9VpmvF4X8npDHgPyYCKwyT4iNN/9Qy1en6MnsUGlIwgApHMH9+O5wuzoznzdb665aEL9qddXSLnXOyiBdZJZqOaGrZe1fURjRGkhDfwNSFc/0zn3ZStmPNhaESvRMGUY7cVJ7Bs22JYZdccNapwJmPa0cfa9gUDA3+Q4LIljoiH2CUpod3M3Rqmo2+EDcK2Md8Qmrfp6i6s7/EhVVNpgHUa4kxcUzrD5+wsDvrpvOpEVbuT6OPsx+ZarvC+ayjQXl7vp
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(7416014)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVZzN1ptUG5vMkdKellIQ29rWm9pMkJzOVlzWWNzb1p2S0R1WHlPeTM3VjR2?=
 =?utf-8?B?ekRlWXordEEyYXhSZG5qYjB4TnM5NDNOT3RPWmxCaXdSY1VzdUY0R01rREl6?=
 =?utf-8?B?bnZqVDRvcVpwZlNSb0ZoVVJqYkZuMFJZNnRJeHpMWmZhUjFVOVMxRXpKOURh?=
 =?utf-8?B?dERsdHdyejVmRXh3bTNhNk5vVHV4SnhZTzRXK29yU0N6elZibzMwMkdvME5k?=
 =?utf-8?B?VE1XeFVNbVZ4WXNzREE0ZHBpNGZ4WkNrc2IrYzJGc2hkTWY4UmhwakZWR1hu?=
 =?utf-8?B?NnN2MzNjTXREQ1FjK09tNVZSeUpYR3dZU2pUcHpXRVdpMW1XdHdRQmJqRkt6?=
 =?utf-8?B?cEJtRVJ6NmhsUC9NN2dycjdtcUswd3RiMFh3RE13WFc2eTB4cUIwZmI3SHBj?=
 =?utf-8?B?aTI4cFVML0kwa2l0czUvd1RzMmZPOWVxSkFKVUdlY1FraXNLQjRrVktZRTM1?=
 =?utf-8?B?dW01TjVoSkcrd0QxbkhzeTVpZSs3NEhFQnBjcHAyejhkc0hpaHlZbDJuVjRj?=
 =?utf-8?B?ZURvblkwb2VZcUFka2dud0IrS25lR1JWbGs5dFloT1NlL29MWFJvbnQxeVlN?=
 =?utf-8?B?NDBTS093bkN2ZDdDRERjZTZoM0pTRy85QVFjcTRMRThweWx6UjZ1TlNNbWFF?=
 =?utf-8?B?MllJT29HR1JMVjNwaDkwVzNtRjZlMkRMVkhPUm5XZkhEcytCbmk4bmRyY3Jr?=
 =?utf-8?B?cElvbzNheUF2YU8rRjBBalpYL1J4OXUrQmNhK2plRnNzcE9WK29VQkJ1bXhK?=
 =?utf-8?B?TytVNzU4cGlrM0I2NkJNM3B5M25DeXRPZjVYL05WL1Ric1NmOG44TVVYYVFl?=
 =?utf-8?B?OUtkdzcvNDdjZ2EwdjNtTUp4RVUxM3NRamtTeHVxdzVhWFh2SkpZTlB5R2I3?=
 =?utf-8?B?WlQwSUZuYXNPN3QrclpNTHhjSG56bjYrZ3NPVjhYUzFub0MzcnhFajlIR1ZI?=
 =?utf-8?B?V3Z1US9oR2o3V3dTWGtES0RGc3lpTjRrQ296dlZrcGN1MGdUUHNVL3JxU05y?=
 =?utf-8?B?MnVWVFFCWHdaQklCb1VTaEN5M0F0NStLclR0S1dKVzFHT3BOVTcrWXRaaVdh?=
 =?utf-8?B?Z2pkQ0hCbU0xQU5CWTBiV3pIS0p4cjkvQStqNmVVVVljeE4wYkwvYllZS2kx?=
 =?utf-8?B?QWsxNllyZTdoWThDSlNkYU1aTzVoTUtKaytoaWZPWEVieHROc2RVZUY4TjV2?=
 =?utf-8?B?cU1yWDBTcUNyK3I5R0E4dHpXTFliMGVFZk42N3ZyZ3ZxZWpzRHJBVGVsdHJJ?=
 =?utf-8?B?SFpBNTF2OGkrbVZjV3hYK281NjBjbjhTY0EzNTZxOVNTVk9tNUxtbEZIbHht?=
 =?utf-8?B?N3VDSHhWZWt0SHl1VlBPVjVIMnNOYnJrdjdJNFlOWHpQWDBnQWxzeE9Tekpu?=
 =?utf-8?B?THJHMHp6UzNHUTdJRW9zVkduOUYvOWR5N0xOai9NV3phNlNmc0dOaUZrVWpz?=
 =?utf-8?B?M0IxNGRBMkR2a3Q3ZVduV3N0eUEzL1A3cWZlNDdJbjQ5WU9XRVlJb09aN0tJ?=
 =?utf-8?B?S0JkMDNiZkVCdktGTnRrdEpvWEFxWmpNQ1pSZnFrQmZFMG10M1d2UmgzZEZH?=
 =?utf-8?B?Y1VDZ3JQNWxmSklHOWdsSzRqRi9kaUUrVDhNSGIyNUQzWWhQbWVOQjYyZjAx?=
 =?utf-8?B?R3dIM1p4SzE2Y0M5OElrTXlURFV6dklDT0NDV2hwaHlTdXo2QURlYk1IbU1z?=
 =?utf-8?B?VHdRNU5ERVVRQ3grUWFrNEtONHVjVUZaNG8veElKZEg5OW1MVUEyNE04KzhJ?=
 =?utf-8?B?bVVheVM3RzlGdzBLeUJsdHVsS2tBa2w2cVRNYUxZRnR6dTVnaWFEcnFncTRS?=
 =?utf-8?B?alBWclh2YXRpQVI3WlZIcDFRaEZob1NYVUlQSkk4cXQ1YkxadFJneHIveEZO?=
 =?utf-8?B?aUdjdHJxV2xGTTdlZEYvZVRjT0Vkd2FjTzE5QmtTZFcxalBDY004REJXQnlp?=
 =?utf-8?B?Q085aWFSZVAwK0xSdE1welZNOHFoRUNnaUxWaGJPZlRHVklId0RSQzVMbkta?=
 =?utf-8?B?Q01LSHlKejM4bG85V090T1NDbjgwdmtOREkyTDBCRmxjNWlBd2plbkwweit6?=
 =?utf-8?B?YjJ3YVpXVEt3N3h0MDVNdVdNdTNSN3hVa2p0cHo5WVh1akJPOGpiKytzS3V2?=
 =?utf-8?B?S1dkdlQzZzFzUG56MFpXOFFSdGRVSS9KR09ieGRWOWw4emltcitWcXZGTlZ2?=
 =?utf-8?B?Y0tVcU1VL3VXbVZhM1F4eGdTMHc5dTNkYWdNTDRWOGdiSm4wSlNDRnI2SEc3?=
 =?utf-8?B?bkZRTjNYUzYzRFhZVmlkZlduSi9lbVdqNUppOHo0NnRBLzQrb0NrU0VsM1ln?=
 =?utf-8?B?NzczVlFObGw4QmhaeDB1L0U2Q3dNTDRJak5JN0hVaGs4RGU5OCs4QT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57cdc1ea-1836-469e-a1bf-08de8b0c79f8
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 07:51:23.6882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8VFN6lcPtToHWZ6lIAQjfk7qwwjahosgwtCrU0xjWsJCRIC23UKFCcPevD96yY1K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8413

Add compatible string for i.MX91 9x9 Quick Start Board.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v2:
1. add Reviewed-by and Acked-by tag.
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index da2be7114f6417317b3bc904cc5c1953e64e21ea..6a94e0201f704f87df8b5bae0fcae9b2d9133f91 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1458,6 +1458,7 @@ properties:
       - description: i.MX91 based Boards
         items:
           - enum:
+              - fsl,imx91-9x9-qsb         # i.MX91 9x9 QSB Board
               - fsl,imx91-11x11-evk       # i.MX91 11x11 EVK Board
               - fsl,imx91-11x11-frdm      # FRDM i.MX91 Development Board
               - fsl,imx91-11x11-frdm-s    # FRDM i.MX91S Development Board

-- 
2.37.1

