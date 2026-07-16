Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013064.outbound.protection.outlook.com [40.107.159.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FBB2F3C3E
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 03:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784173683; cv=fail; b=h3g0rl3F2cH7g0ZjLpnB/dV5Jgivw971vgXPFH5Y1T4kYciSP7HnoRs4vsZsXLXsh9RSYrfanuMaqnVuBZVq9jPBLeSa/B2xcjNgdCCTTkFM5au0HlAtOEydFupQOMNBnO+QpfaypA+C+Gx9xrhoUX+bOEJBVeUrjGIVienXIH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784173683; c=relaxed/simple;
	bh=eVY0ypbiP8fVdbzrIh0uu9bSMiQY/RPHPFUm+ZtXWLs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZT8viqxn08Y5sIajRYoPzAqGVS/rRZ+isYp0lI+hgrMI4t8I5WOxlwB8sDzPsEHsykr22fTNEXIJALCbgWRWnspLit0k+eIFIn9Ja8rbAklyAla5mu/JDBV/ZQ/g181LRLv8r+UVqUu1u8UOVX1xD+hgyr+cQeLTVP+mhQP52bE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tivvBnFD; arc=fail smtp.client-ip=40.107.159.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tivvBnFD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tUNLRp18W2ryy9kEX4AinCJ09GA5xXwkGBzIJhK3faqqibI9mv4jHQnmEPXDEhm51WSPGwn6EkNPPGsdpBy0Egsp6DvNio6+3q4pn+uI94exXhinpGFPUUxpLfuoONzkD/j/Zxzoxrq+wzMhYjg5GrCOSz6G1XExMkO6/MEhNJDfQyq4XYy8MYMokH79I06pn8WL+uKPTm/DY7ygb0yuYbASWCrFXRrFXyugkTrnLtdOx3CMYFQRWF0RRXM7i5lahkS5+h4xvy6JEZmak5kscVB1Ad3rhYBVKHT1aDwk+nsBt7bIwKMqL/JZPK7+8/82fyHFFztzkJtdaQevIzlaxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gogdPxZ7g8+qcZ32vvBq5WR6IelYjb2CztIqerIzE0w=;
 b=lcZDUeuPFQ+L/jIMPIBkBkzT9rnqPtWxtRqtpKCO2es0dU649QdKz45JBesVpXUPBkgkL+nvqI7JhuITfjuwGUS6fDu44KMuZ11gJHFeXQm4eDQnsaTyQHKzms+ElkODgFVTI8Cgd5ykfLiXqmGG1bbF1NUTIqwrokfnCvNJ6VNc2EXQY0bvO1c/plH59hewzBkafGvMtVK88rLfETmEpkE+/rvEtPS4RzM1i7XhaQ7EiWJp+0AbRKOZXPTnVXePtTa8bzcoyOejHjzKwg9tlkvaIObHSV1S4yXvvzEOIHxCSfnTZJdWjkQ5GTLQCMzgVvIhhRBJprHjX226NDKVYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gogdPxZ7g8+qcZ32vvBq5WR6IelYjb2CztIqerIzE0w=;
 b=tivvBnFDPtAKx9h7Fr611kdDvwAnrF95jXw4QTgFRC8SywojkItOFjQP/jA3eC98Nb/almn+GMO72zUWJ1hAxWiSUWNGBRMGmMnfkriksslERlQ3+K/gUrbDke5tjhXiYhZLSEaoKkgYGXVsV5Q/bODdAzJc8h7W8oETsinXC1fZ7h2shSLK27UyLDMXN1ozenk+6U6Amhm9WzSw2i/7nRRgMJGPv9yRzbZnsxPqQ+C+vr1xtxGYlOYRZLU4v0YXSL9pgdMUPB70mTj8EoQuI8XSwyOnI3vnvddKUp41U2Kl7V+zE+6pZnPXiqH8TiRO7bk3P8Azh1YZWpzX00z+zQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by DB9PR04MB9645.eurprd04.prod.outlook.com (2603:10a6:10:309::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 03:47:59 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%4]) with mapi id 15.21.0223.008; Thu, 16 Jul 2026
 03:47:59 +0000
From: Joy Zou <joy.zou@oss.nxp.com>
Date: Thu, 16 Jul 2026 11:50:54 +0800
Subject: [PATCH 2/3] regulator: pfuze100: add set_suspend_disable for LDO
 ops
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-b4-regulator-pf01-v1-2-8c1519d54bd4@oss.nxp.com>
References: <20260716-b4-regulator-pf01-v1-0-8c1519d54bd4@oss.nxp.com>
In-Reply-To: <20260716-b4-regulator-pf01-v1-0-8c1519d54bd4@oss.nxp.com>
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
X-ClientProxiedBy: MA5PR01CA0310.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:220::16) To VI1PR04MB5807.eurprd04.prod.outlook.com
 (2603:10a6:803:ec::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:EE_|DB9PR04MB9645:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bc79701-1ea2-4b05-24a7-08dee2ed0722
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|366016|23010399003|1800799024|10067099003|921020|11063799006|56012099006|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	dt5DrbXs4hb2gsYpBLgv1PecHin3g6uCIe+frmdaYz7hl2mfUz1kwqbVJ3S7HehVbkSLk0mulaMbOgfVHo9EjtNeWR6RBTjVA/prM6YuvmcVfCvwsX6JR5amohsNQeEwws4Zz08XSPtBJEA0axqW7VLySO8373/vWSqNb3Tcox9IBYlnP5DfkmdbTtYw7d4G8WCwh4SvTV4fiTU/dZINYt/fRsJV+CrQUOumtaufl0bgpLH7WO3NqXAIMaZAqT1UHpO70xRUOe+3QoO1XMeAm281EWsDTNKYy3EePdw7+RD56KE/azmrXUe8e7uEMpbxofxmro+z283I4zCyeYdViPS5YtswGq3DRndn2YWRwFqe63PDIm3XOqZwim7l3lwl2lnSH+mu4c2vG7nvSYXirJ9gbXRq70ev0HJeHDGyDjozW5ysU+Fm+qyokVYs0E8UW8iyZFg0nZ80T9vtJ6qAWIvkq+vCra9Il2GPl+5/w/ZLqwyQeLBqijkmm2C/rlpAhLp+oYtWQpoRSU9WdHaY5OdYVwLzwlgTw8HhwM8YaIhz/zL9d7K8Y49nRXQFuUy17u63qx+eV6ohFKbGWMTmTBtHUo1hcNi6jpKmmgUxZdk5nOZ3OWhEZdaC7TnYxykMPBie5ZgmuvS/K6AOtiIQ+OyF4Pwf4ihCN9QIqLRtkgpiPQ3DaLu5IL8VHfYRYYEOxw7nbtHcBWikIoQu1Nrdgg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(366016)(23010399003)(1800799024)(10067099003)(921020)(11063799006)(56012099006)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2I3UU5rZ1kvUHNWRnk1eXFKMDNFakFTWWNPKzJWV01zSFoyUkdOVmJqUWZE?=
 =?utf-8?B?aXREUjQwbWJoQ0dwcUpiOGFmMVRLTjVGOU5LWUNvYXRaRzZHT1dCaFpYWkpT?=
 =?utf-8?B?NHpvU3JlWGlWb2s5OEdka29QYTJHYVVEZmpSS1lRTzFJM2R3eU9FQmlBcUo2?=
 =?utf-8?B?SitUR2ZhU1MzNWZCZWt1TituaHpWSzltbGtVQ1NvTkFPUzVkZVE4YlFOZDNP?=
 =?utf-8?B?L214cFRxT2tySnB5Uk5idGxpajc1UFBGTmUxb0Rkc1JaVzhNTkFsa0NlMnFV?=
 =?utf-8?B?SnNRV3U2MVYzM0Y3YkFiTU5kcXpZQUZBNEswZmNseDNpWHhUTHpzVmdMKzJ0?=
 =?utf-8?B?c1JtMUo4dllxVFI1Q2l4YzI5cXpVbmpUbnpoVUxweHd6bVRaR3dHSTZNTjVS?=
 =?utf-8?B?TlorcFRYVTBScG9lcnFkNzVKRW1CSWFLVU9UZG5QUVJSamh1NE10SndVSUVL?=
 =?utf-8?B?eEU4NUdHY2VEelJ3djJzN2UxVktMSGh3SHZUd1ZyZk5rSGtLemNqajA2Y3FO?=
 =?utf-8?B?Z0NaNjNJYnd0KzBoNDNGeTFxOHB0ekN2eXo5NksvNnlaZksydjdCU3NhY3BV?=
 =?utf-8?B?SHdyYTFwaTBIZEZ3MzA5R3RRRnpsdUpEZVBtYnhyQmFIZkNyaFJmMDZlc2Y4?=
 =?utf-8?B?R0d6TVFnQzVrb214KzgzbzlsVC9kVkV1TXhmQjFSbnNKSDg1V1RlYzdYQjFE?=
 =?utf-8?B?QzVsTkdGMlFjaUZEOHgxTGl0TmxCWWNHc2x3c3ZkblF4UWwxemd1UzhxTytK?=
 =?utf-8?B?bXlRUlpHUllTa2ZIQVRzVUtYZHZRQVdCYzl2VklOTmJRRzdJNGc3MzVDSVNO?=
 =?utf-8?B?R2FUeWJFRHRid2trTlhSUmhWN0EvSHFNdlhOR1NLZTRSSUNmM25YQ1E3bTNj?=
 =?utf-8?B?R0h3Rk5UU08yTHE0aTlySzkxMjVXcjQrY2xDVU00Wlo3Smh3eTZ0ZFVTRkxE?=
 =?utf-8?B?WmRVeDhMam40MnNsbERNL0FTMW1xYTNXOS9UN3Y5Ulh2eTNmTGJrbC9Fci9z?=
 =?utf-8?B?QzJrSDVVeUZTQlM5U1pmVGpiUFpmV2hCRHlkK2twRHZmakVmaDZsVVNBQnNu?=
 =?utf-8?B?c1BRU2d4bFVoY2xld2NqaTRrUEhhTldzbEFYSkdhRDBHU01NakNlR2FET1l1?=
 =?utf-8?B?SXhEVVFSMUhUUW5GdG5pSjNsYVJ1KzZnUm1hSUVSaGMzWllCTWNjeXpDeldx?=
 =?utf-8?B?WjVuT3JyYmM5b0NEY3Zma21SRW5RVmdwUU8rak9QeEtiWURpdW9VbXVCMEZj?=
 =?utf-8?B?RW9wRU5SWXBlU1NJdVZ1NklCQmpIVktLVy81VzBBK29PRG9SczN0bTJML2RW?=
 =?utf-8?B?YzdJRjRQSC8rRkVWaklDZG42eFhtRjl5QkV0SUdQNjlvU1IyblFIQktUTUtU?=
 =?utf-8?B?VmhxNTZDTlR5ZmErMTBDRnpCcVFKQmRoZ2lSRUZJQVFjNTRJU0srdElmeGdv?=
 =?utf-8?B?V2djTU1UMnRrK080MUU4QkZhMlg2eDlpNWFhaHlqbTcrNDhwYlFPM0VMdEJn?=
 =?utf-8?B?OU9hczNLSTZFUTZjd08vemxWSjJza0YxL2NFZnEwejc5d2wxQVl0Y0p0NWZF?=
 =?utf-8?B?dVo1WTljU1NJQ3ZvTzRieGRVS0NmR1BMNU43ZzJaU0syRlg1SkkzQm0rNmIz?=
 =?utf-8?B?bm5PNm1aUGQ0QTVqb3p2MnZKY2lPUnpyNGppTlZCSTJoZ3JoYytWYzhrb3ow?=
 =?utf-8?B?WGxUejIrOHRBWVExR25CODFDR1F2cUhYbUlHMmdmMG5XcngxNlJ4Y3AwL3d3?=
 =?utf-8?B?WDBNODJ4RjAyRVlNUER5Z3ZvamFGdS9GOWVDd1VhL1dBbDFIVU5oWjQ0WUlH?=
 =?utf-8?B?THBtOXZHM01pMVBGaG91bUZRQmQzNDMyb0JwVHEyWFdiRFNlQ24zbFprMzZX?=
 =?utf-8?B?ZVQ2cEtMUFpoUUMwMXUxeE9HNGlwTmNWUC9tYU9jZ3E4Qm5RcUljVGFSNCt5?=
 =?utf-8?B?Y09xdHpETHQyMExMYUNNd0xaL1JSSE8wbS9ReXNhSTR0MlE5b2phQVA3Y2Ey?=
 =?utf-8?B?elFvWDdVTkFIc2NyaFg4dEZOeU9LNDlpN01QUDNWbjgyemFLSjFwWk5LM1pZ?=
 =?utf-8?B?S1pUbWF1WURWUnliYmJXTVhaSTUzOUdZUFRlaVZnRDMwSHRRUm5PL1pnUXBt?=
 =?utf-8?B?V2RianE0YWZIdmVtL3RaSXhDeXRkVGdMQnQrTUZwaC9lcTNDRjE2aEtRMG41?=
 =?utf-8?B?MmUxTkd5c3RQNlFHOTJhTGFLQVl6Q3NKeHJtd21Nc3FCWUJiMno2Nm5MSnFK?=
 =?utf-8?B?YWtFV1lVUjdMWGdXZnlBRTVVY21YUkwrSmlyNjhxeERaTVEyRVZocVQzWjNk?=
 =?utf-8?B?ZjV1UDRtMmlHY21icUJOemtzR3EwSUJBNW8vMFE3eE5JOWhvNDNpTkFnTmU3?=
 =?utf-8?Q?punu0TDt7PVlmCJlypa/c5ZUHEN4VYw7jUkk3?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bc79701-1ea2-4b05-24a7-08dee2ed0722
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5807.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 03:47:59.0865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NT19ss3yHQmH5cBFXKEackdD3Cgje3yjKCH6LLV6P5WwKMOfbtGHHacN+efTI28kCuOrlDBFwKe+vCeng+bw2DnXnCC57zx5/Nf1Uv5rCz7XZkObwz1BElT6mZqmp04I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9645

Add set_suspend_disable callback to pfuze100_ldo_regulator_ops to
support regulator-off-in-suspend DTS property for VGEN regulators.
This allows unused LDO regulators to be properly disabled during
system suspend, reducing power consumption.

Signed-off-by: Joy Zou <joy.zou@oss.nxp.com>
---
 drivers/regulator/pfuze100-regulator.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/regulator/pfuze100-regulator.c b/drivers/regulator/pfuze100-regulator.c
index 7d56c22b5e40..e6d3a28baadc 100644
--- a/drivers/regulator/pfuze100-regulator.c
+++ b/drivers/regulator/pfuze100-regulator.c
@@ -158,6 +158,22 @@ static int pfuze100_set_ramp_delay(struct regulator_dev *rdev, int ramp_delay)
 	return ret;
 }
 
+static int pfuze100_set_suspend_disable(struct regulator_dev *rdev)
+{
+	struct pfuze_chip *pfuze100 = rdev_get_drvdata(rdev);
+	int id = rdev_get_id(rdev);
+
+	/*
+	 * Set VGENxSTBY and clear VGENxLPWR so that the LDO output is
+	 * disabled when the PMIC receives a STANDBY event.
+	 * EN=1, LPWR=0, STBY=1 results in output Off when STANDBY is asserted.
+	 */
+	return regmap_update_bits(pfuze100->regmap,
+				  pfuze100->regulator_descs[id].stby_reg,
+				  PFUZE100_VGENxSTBY | PFUZE100_VGENxLPWR,
+				  PFUZE100_VGENxSTBY);
+}
+
 static const struct regulator_ops pfuze100_ldo_regulator_ops = {
 	.enable = regulator_enable_regmap,
 	.disable = regulator_disable_regmap,
@@ -165,6 +181,7 @@ static const struct regulator_ops pfuze100_ldo_regulator_ops = {
 	.list_voltage = regulator_list_voltage_linear,
 	.set_voltage_sel = regulator_set_voltage_sel_regmap,
 	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_suspend_disable = pfuze100_set_suspend_disable,
 };
 
 static const struct regulator_ops pfuze100_fixed_regulator_ops = {

-- 
2.34.1

