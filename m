Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013030.outbound.protection.outlook.com [52.101.72.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9161740FDB9
	for <imx@lists.linux.dev>; Fri, 31 Jul 2026 10:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785493130; cv=fail; b=bITIPnq4MhFaD052plUb2l5cHPGXL96JMhJ5gGRuR/nqSi+goupClAUYU79zGfSFLIvDZA1OqsveHD07jgv43ig1v4yXOPryy4QxKbmJC901cczIZ1pcyVlr5Ltk4hRcWR67xNa8jDNpFykPNXQd8597efheKX9vCuBmX1qUtnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785493130; c=relaxed/simple;
	bh=Sc8pDPMOI1Bo9vBRoIk04q7gb+MCmLrg79dQNBNe7H0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=iY/1KrZBHa+9oWeMlbBmmJyPdR4qyj+xDkMiptmsBg0b9AnI8dH4sZ1cUwcu+DCl9f0iOIbzoK9WYzyJlwPwmWI7mzWwbigkD3btRV3WQ6ixzKHA750K2a3sm9+bN50Gcj5X8DaM7cmmV0IRj5HRTTEtssKDbJeV1ZjedLft0UY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QQAK/sgg; arc=fail smtp.client-ip=52.101.72.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QQAK/sgg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xm4Dsq1utjzofhkvE54S3CbZleA7WEiy2+H313S1tqWUoLKQU7R3AaAfp1HLANOYAArrDi+wsNZoEfeYRztB6JTKm/NaYowqs7NKUZmH5hPEctqtWH5VJSf+8Es5uSOOHsC23FZDEi+ej6y6AwOfwzBjhDVAFoA4NxL9I52vMCA5R7ZNZqvkhzyObtGC88wCBWPH57kXZm83MDUXl64xilfWHLjCQFaKVY0I9OPkE1zPvjBetOAFS0iuofnKkN7OfkaDQFtjX5QMI+1X4dJdvYhvNDxc5HzyMroQCYlBgR8rnfcEXeu5B0dWNbZHNDfXll+396W0QK0fe4CxVOUrxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=To26xpiXsl7xNPrRJHvA8xa8f6Px7ityV/3/+uHGRiA=;
 b=ujZrlzmHmDZhN4AxozbKRmcUfEHhUEGammuIjLtYhFXi1I5ohTV79aY9fyZULL0YmIwaM9qLuGmpGId/lQjIgOc7gvVa11p0F1e/2MaNNXD1A01ucTJL4FQ4OGN68pBHqURKPrvT84QnNVclGxKJwoEcMxYXBiCIgAgmgJe30IaOq+zgrz7B/vVzryBtf/mVrfXCXWj1vwRPh3ueMhVcStITVzTiyoA6cOX0mzAsDSGAo7w4p2QR9vITmIsweaMtHNgj2iJ8+54DklPmOaYSGk1dXv6aT+4zoav+R69TB0nJWV5ediiqeCJGuO4yllUHpjEt+7dWhiRAOe1oMfJw7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=To26xpiXsl7xNPrRJHvA8xa8f6Px7ityV/3/+uHGRiA=;
 b=QQAK/sggIfMA809uCk9CGKYmYm/osud2pcguTAh3KWiP2UIXf+s7BL3r9WR0r0iRcFoafHPXZZr8kEAUJnZT1xsBiIj18AZB1DokyTb6IFVxXYgLZXXnx+up9uk3OtPskXhbjz12WGao3RFRKsIVp0JD9YK4y3azi8ES8QqM7EH4gSGh/lph36E2nApYcMTBG8eqH/28f4REpTbVxj31U5CZODtngkI1AEi4YBUDmCMXIIn0UCPxqXjxMtfS8dYYrBaozL5OYwANnNP0bRBVGfVDv0qHvyFxyznzGfIrrmdIK4S/ZQfWcRHw9INp5Kwz6tf1hF9+Binz2xX5Q10xbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by PA1PR04MB10179.eurprd04.prod.outlook.com (2603:10a6:102:460::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 10:18:24 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%4]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 10:18:24 +0000
From: Joy Zou <joy.zou@oss.nxp.com>
Date: Fri, 31 Jul 2026 18:21:44 +0800
Subject: [PATCH v2 2/3] regulator: pfuze100: add set_suspend_disable for
 LDO ops
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-b4-regulator-pf01-v2-2-a406c8737fdb@oss.nxp.com>
References: <20260731-b4-regulator-pf01-v2-0-a406c8737fdb@oss.nxp.com>
In-Reply-To: <20260731-b4-regulator-pf01-v2-0-a406c8737fdb@oss.nxp.com>
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
X-ClientProxiedBy: SI2PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:196::9) To VI1PR04MB5807.eurprd04.prod.outlook.com
 (2603:10a6:803:ec::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:EE_|PA1PR04MB10179:EE_
X-MS-Office365-Filtering-Correlation-Id: 37750d48-f498-4bb2-6692-08deeeed0deb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|19092799006|23010399003|7416014|376014|18002099003|22082099003|56012099006|11063799006|3023799007|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	oi2CIhGv134jtV7FdrXC6jVxhoekOnQUxauZ/DncPkXRIzFzidWkEG48anaifxpu7QORNP3psYHQ+uHFAXyHEaNlszgf86wOlageM9YQ6ZRHgLGIA3653nCcvhIXC5pxno/wS2m0FqUAtD+kGmFzNCZ6eFclKLZrl3fJsVSEWFcJa37F85SPFwbqFWhC92v3dDwT2n39bkAN3B3LZLHkWaSaSVRCOI4Surt/P594+w1rHg/sjt8eIg+4C2Spz/6qcKo0db9Y+Mqr55yTbJH8nMmVVGLdoLSdAHgBRqoevrUR4l5P1TnB+VE+QUDT2M3Bc2ejf4srhLs5/RfoqezbsfBXFrY8hL3/B21iljHuV0tBujs/P7TKRcoNsN1e1JY4tt+PGYYnxhJ2qQNQhUk6qWOKOn9BYb3VyGpZomc971oiEfjEaOt15h4fcQVKiY+lNa1s7EhLruQ97V2KsS4u/4yQOUTrWZE16BCjR5cSuojxZecfE5PI4NtQ/Cn+kM8maCrYF1x44VY85XImMeYS06zFOvY23oql1Sip5b4NXyQvGgPDqHJZP5mfLTVajuORqsVTGb3v+t+EqKw+fDNTg+KjFc6rRo+RDuy7sQe2huXoeW3zDnMlPFolK/dDf5Ke9i6DId7T+Y3HrN0epvvL8dvr28f8snMDTRYXpdVrl2o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(23010399003)(7416014)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(3023799007)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R09ibTRDczFlTW9uSzNxZEpmT2FpRzY5SGcvcmw4QTF1NWlSZmZYVHloT1lz?=
 =?utf-8?B?VXdBK215enl3Y1B3dUNINDRPTkRUTE9xMVhBcjd1czF0ZmhmdmZYbjh5TUJz?=
 =?utf-8?B?aTdEMkdkRFZjY3FaNG5pemU0VWl5bThpd3BSQ0l2TnVvRzh0eUpldzU4STFV?=
 =?utf-8?B?eVE4K2xOcmpsckFKODkyYXg5MkptdDFQNUF5dGtzak91SFN3enhUSjY2R0lr?=
 =?utf-8?B?MWdHdlNacTM1bWVQRlJmS1JQZ2doYzhCa2Y5NDBSZ1dSZkdHbjZSclQ0Y2pq?=
 =?utf-8?B?U2I5aGgrbkIyZkRjU2JqZ25ZbEhpbjNrSmpMVFBuMkdVNzNvejM0ZWsyaUxL?=
 =?utf-8?B?T2NYWmhoOTE2ekZoTE9sQlBFRTB1VkN5dU8wQVBtZDNUVnBQVEJlZWNFRFVI?=
 =?utf-8?B?dm9GbkxVNkdhMVJwNGRyS2NWTDJ6bE1UUVBIWXZrQmttN1ZIaTEwRWFCT1R3?=
 =?utf-8?B?RWZGcFVkL1UxbjMvK0IxaVhFYTMrQmx3YVNIMVNCczlaQTNOSDdNajgrRno4?=
 =?utf-8?B?STh5U0ZmY2V2SlBQT3dMbTJ0cGhaRDRhc1pwSTNmMHhlWXh4a3ZZWmp1cHky?=
 =?utf-8?B?TjhqQnIralFoMldjVnMxZzdlK3pCQVNDRHRKSms3TTNNa25oQ2tnT0k4b1hG?=
 =?utf-8?B?dFA1RDBHK3JBNmloeXVrVmxOYVp3OE14aFhxSWRLYWwydForRCs2NGQreEpM?=
 =?utf-8?B?bWJvSzJJejNaVkkzeDhYL1JJZjhzcDVvTEpqampFeExwcTBKcmR3M0xCZk0z?=
 =?utf-8?B?SHNyQzZDQmV0RHE1b2JTRU5WanZXSndXWlRucG9nVDNwYjRGL09wWXJFelpx?=
 =?utf-8?B?NmNLcmg1ZXVFekhnRTExUlQzc2NvSnhWWDZ2VDNTQ3NrNGxpNG1JdisyaTJF?=
 =?utf-8?B?YXlsZFZUbGd3eEtTMGZjdklkVGg1NEgvWDVKaVhtNzB1RXBRMFBSeThKU3g2?=
 =?utf-8?B?a3RtK3JZb3paZVROcmRhQ2EreXhxTktJOTQ2VGNkcks5azE0c053Uk43VTkv?=
 =?utf-8?B?QzF3bmd0d1UzL1VkRXdpVnpaNTFzdG5BU0pSejJZOFJ4NFRsMjFEWXkvZjJC?=
 =?utf-8?B?cFgyTXBiT1V6OGNDdFBiTXdlcXVCWXMyQm03cjhTTkN2aWM0TUZ5RzVjTlQz?=
 =?utf-8?B?UTJqbnRNK0xNNmVSMTE5UVlMTUljb05wYU5GYVVJZVAyNUtuYkljcC9vd2xr?=
 =?utf-8?B?M0NvdkFQdU4rV3picG5iZlp2RXFoMXBOa0kwNHJrZTgrYVdhcnRNQldGSFNQ?=
 =?utf-8?B?cTBWaHZGdTVRdkpOSS9TUXViOTF5Qk91QWhza1VTS2RJbWZjckphRjE1bE9N?=
 =?utf-8?B?TDVaeEU2eWt1MnVRbU1DOUpNUWM2SGliTDRjRGRERm9aWXZ1TE1vVy9TQ2lw?=
 =?utf-8?B?eWEzMFJpc0FZYzdXUktUOVVmQ04yazBnbmlCNTBlZnRBUHRvV1ArT2ZsMWhD?=
 =?utf-8?B?MlpnR0RlTnJneGEzTTQ0V1M4ZVFYRkwwbUVha2JlWWgyQWU1WUdib3hzK1hs?=
 =?utf-8?B?RC8wWjVHTHVLcWFXdWFOcHBMb1BGUlZ3elp0TGxtblpIdUFCdUkzbmFHODJV?=
 =?utf-8?B?Q3VRbS83a0JpZ2xHUHFEVC9ROFVsRW9RV2pnVnFZa0xMdUxVWVl5YzA5Q0FN?=
 =?utf-8?B?d3libnloMDBxNlVtYkd2MVQyQys5RlJ3ckQ5RXZzMTRLSlpudEhvd0hUR01D?=
 =?utf-8?B?cGtuT1E2SVNwN1JjK2haNmdIRlR3U0ZOdm9zdUxMVms3cjBHb0czckk3N3dD?=
 =?utf-8?B?OUJDN1A0WDJYUU51NE5mRHd3dnBNQ3BaeHNFN1A3NTlDOFY2NTdaWVdoVlFL?=
 =?utf-8?B?dEgycloxNFRjNHhZazFFSER5YmxEbWNZNWF4ckdxMVZvZnQ4UVF4TTVCbGF0?=
 =?utf-8?B?MjFYdnpvQjdjQWJsQzhoWElZSzUzWEtRTnFKSUgzalVpYUx2dmV5SXJNNmdm?=
 =?utf-8?B?Vi9ocUVWL01vbzNDcG85c2xyTWx5RHZPaGVIbVE0WHNlNDNYTWM0aU10Z3lT?=
 =?utf-8?B?NnFFUnFGWHBqQ1dWMnJNalFaNU13c2UrZnlOKzFVcEVOT3oyN0hodU9jYUNi?=
 =?utf-8?B?OFpSUldkeGR6Tmo1VU1xZFhrZDBDN0VabE9TTDUwaGVGVUVtUFcvdGEwQlFM?=
 =?utf-8?B?RTJRK3dzN0kyaWp0SUdqazdIYkxlcG93VGgxbUlQSERBZVlYZ0dWV2J0cUJP?=
 =?utf-8?B?Q3BXckR3M2o1ZW13SmZIWWYyM1lDZ1pvQmpleTN3b1FMcmxDbWtzRG9MMmxS?=
 =?utf-8?B?cW1ObEJTc1lBVjB4a2ZZUlFhQmpmWHcvWkRTd2V0Qy8rNTYwdFo2M3JISDgy?=
 =?utf-8?B?VnBKb2xXbkpjblpFamt5S2VJSGlIcm5EQ1FzSC9lc1dEaXFUZ3F1bCtEQy9O?=
 =?utf-8?Q?cJxALKrZA9G9JVS7iN59xJARgDMVrCILBAG7A?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37750d48-f498-4bb2-6692-08deeeed0deb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 10:18:24.4544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W3BHejSjfVeKurR/t7491blnw63Nxb3+dU27cUs4LRfc25R9RfaCwUw6/trnUVMVz6X+Mj5YfDfbbReiQcfSw6ckLUH6AIoyEu//Oa0FAo1AQe+n35fqcSEbJOJxOMSA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10179

Add a set_suspend_disable callback to pfuze100_ldo_regulator_ops to
support the regulator-off-in-suspend DTS property for the VGEN LDO
regulators. This allows unused LDO regulators to be properly disabled
during system suspend, reducing power consumption.

The callback is only used by the LDO ops, so name it accordingly:
pfuze100_ldo_set_suspend_disable. It uses the per-regulator
stby_reg/stby_mask that already describe the standby control for
each LDO, so it works for every LDO covered by these ops.

Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes in v2:
- Rename the callback to pfuze100_ldo_set_suspend_disable since it is
  only wired into the LDO ops.
- Use the per-regulator stby_reg/stby_mask instead of a hardcoded
  VGENxSTBY/VGENxLPWR bit.
- Link to v1: https://patch.msgid.link/20260716-b4-regulator-pf01-v1-0-8c1519d54bd4@oss.nxp.com
---
 drivers/regulator/pfuze100-regulator.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/regulator/pfuze100-regulator.c b/drivers/regulator/pfuze100-regulator.c
index 7d56c22b5e40..d3a0e2505524 100644
--- a/drivers/regulator/pfuze100-regulator.c
+++ b/drivers/regulator/pfuze100-regulator.c
@@ -158,6 +158,25 @@ static int pfuze100_set_ramp_delay(struct regulator_dev *rdev, int ramp_delay)
 	return ret;
 }
 
+static int pfuze100_ldo_set_suspend_disable(struct regulator_dev *rdev)
+{
+	struct pfuze_chip *pfuze100 = rdev_get_drvdata(rdev);
+	int id = rdev_get_id(rdev);
+	struct pfuze_regulator *desc = &pfuze100->regulator_descs[id];
+
+	/*
+	 * Set the standby bit so the LDO output is turned off when the PMIC
+	 * receives a STANDBY event, using the per-regulator stby_reg/stby_mask
+	 * that describe the standby control for each LDO.
+	 *
+	 * The stby_mask only covers the VGENxSTBY bit. The VGENxLPWR stays at
+	 * its reset value of 0, so the LDO is switched off rather than put
+	 * into low-power mode.
+	 */
+	return regmap_update_bits(pfuze100->regmap, desc->stby_reg,
+				  desc->stby_mask, desc->stby_mask);
+}
+
 static const struct regulator_ops pfuze100_ldo_regulator_ops = {
 	.enable = regulator_enable_regmap,
 	.disable = regulator_disable_regmap,
@@ -165,6 +184,7 @@ static const struct regulator_ops pfuze100_ldo_regulator_ops = {
 	.list_voltage = regulator_list_voltage_linear,
 	.set_voltage_sel = regulator_set_voltage_sel_regmap,
 	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_suspend_disable = pfuze100_ldo_set_suspend_disable,
 };
 
 static const struct regulator_ops pfuze100_fixed_regulator_ops = {

-- 
2.34.1

