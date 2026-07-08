Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011019.outbound.protection.outlook.com [40.107.130.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB33B3C1969
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 19:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783538805; cv=fail; b=DKqfooxqDyVChzoydz3swnPSXgDoynsahm9hZd6UInNTgr6fBaawjkkG3JCiSIaEefBa9+4UOco5kRgG9z2v1aLy7azxPQb/ANOO+sqBbGyO9z4iWlepFs9PAw/tSzO+3WhleifCqwErpnVbgQIgVJ8i/DCQTkcQDw5C/eH1mus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783538805; c=relaxed/simple;
	bh=WMPrjpkRUU82vLkPwzAkDcTZ71YDhrH0A7S+q7SlWpA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BAEweKocxxXQnkvkj0hyD9nvBwXyooLDvnZ7yeDnUdsJjLfEhFF0RjyxSYm/heXpCPchf8aYsodhszfZGHGeCnwn/B+M4gPQSzb1VMj7n5BbeMnEXa6NH3NzDG8yg1+3RPns4GJ18VJSIlJ0e2n2paWYoeI9b+baXvQPaENPlBQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gXu0gcrk; arc=fail smtp.client-ip=40.107.130.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gXu0gcrk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U4G1elNSAfkD/Mo1QvAcGAg+7763OKyWnrdMoW7AJsf73s4rX5CDdog9Oq9FDU1XzeSEB51eIhNpfEvPvxIroJoR/OvYuh1YsxzJywe5Lxw/dzhuiMDcIcdZ6PtExkwZZCEJ1vL4W9qVT3JFqKcWMsdBvMqP+JBzIP81c3L1AugQYRYYm7wBaVppz9neeFz67GkI68AVr8eXXdzzpywGRfRwKkSpdH2easGwxWiYPevbdeoo/1U5pKc/gBJvdRrdbNw3QuPdNJbgk9g5d1V0kgC0v8m/40UIX0eqH02+hHlYqbDGVIc3fNV4BWaHSBcAiWqs0dGNEfQzBPl64evzeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pKpFGvVmyPUfHRFQ+NYXsspU+xgfkOPzvfpowTSJ9tM=;
 b=IvollYWLsdZyemguGU0nQVkYww5/bG0q3niTHjIzEt6BJoxwtyTJkx8xG/2s4Ij0blqZrFAT7h6hpNsRI3vTsJF+pQP2h6UXqzo1ZEBLmfj6Whr6+fcYXzzNCMPfZrzNTEqe0tM1nbmSxY2TYxKKmScu0WpmWpYpYiTKAv1mX9WKK+kAcRxQ8Ey4TFzIrEhLSdy6IGv1SCf1fD8lbKzxArPxOH8hlBHu3AFVEb9Zp5LiYGI/X144lDOqoHO3QULMAajVHlL0cpFHseHJhXWN/dLY6qYdYx9cTgvziAONPfkHlEk8GHXBTiQHZhgMDiWo3Gd6BxAh/2RULaTwjgz2lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pKpFGvVmyPUfHRFQ+NYXsspU+xgfkOPzvfpowTSJ9tM=;
 b=gXu0gcrktJFUDb0Uu1RetgP0dXWxwfcaFhBKYCikVKX46JxGJQ+YAKhbeKSPOgdDuhJg/VXLQ21o+3ksaJnjuH28KzPoUKOTiDHGPvuhr7MrHHGMryujAzP9UVzE1p7LBFGLOOoUFhOpO4l00sFfObDAW4jMV5HNyETx6Cx0AeXUKwZowGPhoyRajHARIn/sQlF2zgPkkkwAejGacUPF2yYnGlxRjZ958qnyU5Z9ualGvV79e8yMeSlPJ/vSda4zYnDSQy0ysLjFgTNpJK7VpeJG+VX+sUOUMRuFjOREOgoVdX7uKkFoVMqAihvdqyr7tGZ+lhfJZxO2kMcEPhQqfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB12342.eurprd04.prod.outlook.com (2603:10a6:150:31a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 19:26:40 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 19:26:40 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 08 Jul 2026 15:26:12 -0400
Subject: [PATCH 4/5] ARM: dts: ls1021a-moxa-uc-8410a: replace
 spansion,s25fl164k with jedec,spi-nor
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-ls-dts-warning-v1-4-5daa24061c31@nxp.com>
References: <20260708-ls-dts-warning-v1-0-5daa24061c31@nxp.com>
In-Reply-To: <20260708-ls-dts-warning-v1-0-5daa24061c31@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ioana.ciornei@nxp.com, vladimir.oltean@nxp.com, SZ Lin <sz.lin@moxa.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783538774; l=1311;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=7PQ4h0jKWgDtHzYijitZaBjC/EsDHorkYZK29KLuHQA=;
 b=q6EPlyGG/CyTVWJNcWM3PmZ9+I/B1ao4skRiQbaddUdp+0dm17nqKsnGb5AhtovqTNC/C4hB1
 59+eMqfwlDaBhHi1UJifLfFOXwJpnKUMraht4kJf1C1Gyk898K9pFm0
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SN7PR04CA0018.namprd04.prod.outlook.com
 (2603:10b6:806:f2::23) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB12342:EE_
X-MS-Office365-Filtering-Correlation-Id: d058a677-b059-4e2f-a44c-08dedd26d615
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|7416014|366016|23010399003|1800799024|18002099003|11063799006|22082099003|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info:
	A2A3S5Cr21wo9+j3xecgXR+nvQxH4o9QRegq8yrwJGgx5kOEcclFZP4ouY9JGSEw8OehKcljk4njG4MR79bTjiri6bnIL872YtsdznRGJJSxb2cszWRHiT5VIzFemyrIC5FbD/wE/2gtrbhKKBs8p7sd+FY/CLlaC7eGw2ysHP+UZ0Mh1kHDEmqAP4kwTur9bAqSNjVDFKnFfYGNnUTN7aW/396+2hyfjTEDI94KUz74EMpek0uMUVrEkBRypBylCvd2MZEO3KUWaEEbeYQY2J6Ci4YwQThGOiY819JfKxsRfky7gkrdPfCR8BzV3GniXTAjMfquh8cMTgj0ditRK2fK/PfoFrrPLCmaA25d4PuMo8MZaXnBHoE4OzZfMo3MJvx2HHEU/OKZFemTkiLmjBR1pLi6/IyXdkHozvMYj4XbDFOMIfw8ONMvHsWKWbD6+8IYIYUmjYI7xBfFTIyvHKGGonMGeV+SXfKE7BAyWpCcGjGq8/SAOE12q9JKUc2+QZHRu7asVemBzrZunwSsKUvmVdWhfLUSZs+HnZAB5Iskjc8E4V+xcyvgnNqnK2zRHk65CzhV2VtHXX6HQo2w1jjVqlMkR5ojjcRDegbyrznoU+VYZeh+JiF1KOKhle3WhgcJkT3Fr8E1O2kVeqP/tyVUie5UjreAwBAnJIPlwIw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(7416014)(366016)(23010399003)(1800799024)(18002099003)(11063799006)(22082099003)(3023799007)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UnRoTFY5by9JQWQ1SU94UmJuZDUyNFRWbnphdUM4ZDNwTUQxQ2h3SWhoTlJC?=
 =?utf-8?B?bWR3VUVBVTFYdWhxRENpQ2k1SFBiQUs4R1VCdjhPUnpzRGZKa0puZy9LbDJD?=
 =?utf-8?B?RXhZNkJoT2ZzTFpPb210Q0dxS2RyMHl2eHROVUI1WENrZlgxdEh6U0kwRW1Q?=
 =?utf-8?B?WFU0QU9hY3lQR0t2eGw4TWJyTmJYaXlHMWJEa2Z6ZUpRUmYvUkJaK0FZSDZm?=
 =?utf-8?B?dTRmMXF4NjJVSUU3WDVwQzRtRnBDaGx6c1ZZVDFOc0daakpuaFVrZ2Q5OGxp?=
 =?utf-8?B?RGFkMTZrcEcwYkRoZVJxYktXN1BSSUJHRWppWlU5TGNwWWE5RnFnckl1OGZm?=
 =?utf-8?B?T1d2azJLWGZnM0gzcjlYS2o1aHZxdjNvNStoKysrVDJscXV1REFRWGUrSFBU?=
 =?utf-8?B?Y1U4UDlkUHRneEFWSXYyT1pHbnRoVVlTSDg0NmFBVDdpcytCaDR1dTZFOE9D?=
 =?utf-8?B?RmVZYVEwUmQvdy9qVHJtNmJ0WHUrK2YxcnN0MkxNN0greFc2ZTZ3QVd3eERh?=
 =?utf-8?B?b0hQZUN6S2NPUW40c1lVVUUzdUlvcWlqeUdVZnk1M2h5RFlsYWFYZDdzaXpO?=
 =?utf-8?B?Q0RVbDNwc0tsaG1nVU12RHRrcmZZQkJVeVh4bFQrM2hIUWFMNVhhYWpvQjJL?=
 =?utf-8?B?b3NsbEFuZmFKQnNaTFQvbVd3UGMxenZpT2lwVDBxclFyNzd0QWVJOXF0aVhS?=
 =?utf-8?B?VGpFM1FRZDF2VVVkSXVsUkFNYS9ySWE1b3Z5eERweXBrS0wzNm1lTTZtOHdE?=
 =?utf-8?B?emE4cWJERDlRREg1dStlclRTSUtSeUh5MzU3RjR1eVF1Q09OY2hNRVJBZzd6?=
 =?utf-8?B?N2w5SHlBRnNkOWI3TW9GYmdVZ2NWWWlKb1FxK0pEekp0ZjhnTk9RaUNDY2xY?=
 =?utf-8?B?OUJtclE4bzlMK3M0aS9lZVg2cW9vL0t2WUxQQzJxb1BLWFI5dEY3TkVrQTJ1?=
 =?utf-8?B?ZGEwNkt6UVExTG0rMWV4Qks5YkdpZ3phWWxYeGxGeW1rOUhFeGl4cEJZQVBU?=
 =?utf-8?B?QjlVdHI5TzVOdGlPL2djRVFKcm1xRWREaUkvdFdmN1Q2a0tTWVIwaldncHdu?=
 =?utf-8?B?S0ZJUjhTWFdrTWVzcFppenQ2M0ZnODdUUTVyMEZnL1ZMcnFkMHhFQnJhZmlh?=
 =?utf-8?B?WWVya1UzWk45amFMSkp0SWxOdkliWG5kWWx3WERJOCt0bWlhSTQ3UVdpTTQx?=
 =?utf-8?B?L3VpdXg1Uzd0THArSWNtVzROSXcyRXB1SDBZcHUzUVVJeEU2VStRMFRyRVZy?=
 =?utf-8?B?VTJLTVhvSy9SVlpGV0dWTTZzT2VjVGh2cGpqQlk1WmFWQmxDSzNabmZsMTc0?=
 =?utf-8?B?N3VBY2dEMDNkWEt3OHhudWIwRnp4eHNxWGs4cE1WbjZsTVh6V0NkTVowK1dy?=
 =?utf-8?B?VUtwUkVnVGE0Qk0yUy9XaDN3SXc1dklmWWZhY3RJcTBHYmRKWlg3bnkzdUFl?=
 =?utf-8?B?WjdiSGUzTVR2Sm0rYUlLV1VKSlZ0UGRUaXFPcWlSZUxGaHUvYlE3QmRyMWpl?=
 =?utf-8?B?ZmZzWjFMWkFubnZGZHhWVnBSc3lzOFRiMlY3NjBLQ0huUWZHVXhyaHZIOUt5?=
 =?utf-8?B?OVBXQTZrdkVrQldQY2RET1ZlU1NxOHA4VlNOTktUcGN5cUxDWXp6S015Tkpo?=
 =?utf-8?B?cmRPSDNnQXhWY3lWOHJRUEhsaVlCVEt1NTF0SGFLUGNwWDZCZUJYNUxhZFVp?=
 =?utf-8?B?S1ZIMnNCTUZXNXNzNTE5eWIwMmhpTnk0eVFWZyt2UlBaUmlRQTNNaUxjSXBy?=
 =?utf-8?B?UzRBYVZiOEFheHYyZlVDbUtJTmdXamZzNk1yWDB3N3ZBcnJPTlRxVnkzS3Nk?=
 =?utf-8?B?NS9hcmF1Vy9lZE1UcGE5N1RaWHlxSGFDVG1kVGIzSTBpODhlQTBqSHN2cERD?=
 =?utf-8?B?OExOWCt2WkJOQkFHditROWcxbEdFTUNjTlhpYzZVQ3I4eW1DNVhjWkR6Vzc3?=
 =?utf-8?B?TVJiZThySEZBQ0E3VHQyMWxrRmlkUmV4bHFHaUtsQUYxVFo3RVFqeGoxbXV3?=
 =?utf-8?B?QzFlYzRJelFUU3dKVzBJOVRZM2FKRk0xZEJmR3oyQ0RnQnVPMWVwVXBhTVBl?=
 =?utf-8?B?N3N4S2JyMGdVWDg3ZmNPL2tYdklldVpPdEdTQVY0emxVQnBCSk5ZbGFyVEZw?=
 =?utf-8?B?Wm0rU0krbkdDWnAvRlVnSHdrQU1Cb3RSZ0N2NU00R3AxalY0R0FKSUhQOG05?=
 =?utf-8?B?R05UeUpzSVhBcnZlbjViR2NldElndm1PR0h0N0ZHVG9hc3BaeUdGQm53RGlp?=
 =?utf-8?B?aGpudkc2TUJUV0JRQ3pnbEIrWElCaVJ5OUJ2WW1qT2ZzOXI4T05iQTFycmMr?=
 =?utf-8?B?VnZxRHhOVXVML1FSQ09FMDdSMzhsUURIQWViMUpUdjBPRmdpcENTWXZIWDFq?=
 =?utf-8?Q?YkFBUzPZWW/+6mGuesgK2axzCoT76ZZzdN48f?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d058a677-b059-4e2f-a44c-08dedd26d615
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 19:26:40.6122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9j9M8MirmQ1kz1e8OeyotzuqIem9FnQA6Dzfs1vs0SWtynfv7vkD0kwgb+VnrZEdl8pAbVT7cV60WgLcq06KW16nN0WH8sPSoy/+qsg1vRIqIhKvycH21hQloKM8bmFz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12342

From: Frank Li <Frank.Li@nxp.com>

spansion,s25fl164k (drivers/mtd/spi-nor/spansion.c) can be identified with
the READ ID opcode (0x9F).

Replace spansion,s25fl164k with jedec,spi-nor to fix below CHECK_DTBS
warnings:
  arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: /soc/spi@1550000/flash@0: failed to match any schema with compatible: ['spansion,s25fl064l', 'spansion,s25fl164k']

So no other known DTB user this dts file and it is fine to broken potential
back compatibility since spansion,s25fl164k already support by use
jedec,spi-nor since 2015 commit 413780d7d7040 ("mtd: spi-nor: Add support
for Spansion S25FL164K")

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dts b/arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dts
index 5b652a45bb9a4..b2a87ef23c8e8 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dts
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dts
@@ -204,7 +204,7 @@ &qspi {
 	status = "okay";
 
 	flash: flash@0 {
-		compatible = "spansion,s25fl064l", "spansion,s25fl164k";
+		compatible = "jedec,spi-nor";
 		#address-cells = <1>;
 		#size-cells = <1>;
 		spi-max-frequency = <20000000>;

-- 
2.43.0

