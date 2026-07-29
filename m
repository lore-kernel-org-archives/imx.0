Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013066.outbound.protection.outlook.com [52.101.83.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A316248D866
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 13:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785330330; cv=fail; b=o2VnvPLNI+EWkL0A48khIugtou5dGUhim3GcheAUxUOTKtV2sKBb/tL6AK/ahiM/oeiXh0YDPPt3rv60UtTXeUehb+tWOOKXKop6cr/2Zv1fb856W0LnONTgcOVapL+OAnXyHN5vFf7K4oCFTEcTPaQihf8IPjwYyw1rPJYA3cQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785330330; c=relaxed/simple;
	bh=jOAbLHVfLxQD7F9mV/buALs7BX/lzufbPouuE6zdNkg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=WkVSp+kBF8d0pHdktvvB1NQcfkR2rb0Y7IYHgAdnCzF2rVjPnP28Yl8IIv3zbiluSXRnp/Zih0U5NDXklBMiPkHdofsaO9f8KweKRKyrZFO/d+m8pi3LpmMZ2UFGDMCGR0PJYjYK8hC6MIpO+tFMPxngTiOFL7ukFp/zYOEPbHQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vLqcxiFc; arc=fail smtp.client-ip=52.101.83.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vLqcxiFc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HLHm/RYllB0bU0KVsNVv6ogGjI2w+1eOsn72bw6MgIzvbB+/0qQo20ptWyXQ1n6j+hv0syp10+XWQzK9XaKce2oWQSThS4p20YnDki750MgJ16+ZZhjstzfBG8NWLdHPxXYyfwmbFJNjvZsCHdGTwCCV67ZqZrW/gn0zn0loobHXkvVaAAtB2zxuPcMt9ZvPphBoIHJtiHsBcU56ocC7cDCb28I+oWTftvsaFDwG0eH8bWdZ8je5NFk0eKSHTdUsBj/X25C2Pm/EzV7gCJ8+e6CrBcz/A3dhZ6J/xYqXgGjUEuteaeCm/cts5rEZy5nbB2X+6TsLjjnq/TZjj/6kjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ng0I01ayQ1UBlWLSSt2O6pFfyrk0Ek9TKEqblBhlwZQ=;
 b=bHqGNA+c4VOBG77MaCqgXrS4c7Cg+BHMZLwz1QqeXEgisrpdzDpjw/rlnI/3Gu34+z/vLbFLWllMbUp1S4BAsWuqquaskRfd0e6Ss9O353MP/m2EzuYwAJdbYORUxotko2irfHjUdiLh996f28kYehhpC+PKkQn0KFdxfQrt2Yd4wRbLckj9GiVTz+PzMmIFqxFh5d7fdXfzWMgvA9fImkAGDIa6QAn9O3ANA1rOGDbd/352Cxl2AdfUhr6GT9QZTaFlMhZ4/0D8s+dQiezM31glSLnWZ3NSwYxakw8LotZ05MnoodFNmQLR91GwEThwVWmqVAlgk8IxRqo5Na6OsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ng0I01ayQ1UBlWLSSt2O6pFfyrk0Ek9TKEqblBhlwZQ=;
 b=vLqcxiFcDqB79Meb40QE3EVobSnQBfLjw1S+YN/VI6+I0CO6u+J2YuU9AuYV2qdLEEhytjFv2LIiprGeOrML6UjT7KpSHs6/ynyyWRpfopxR2yI6jGyBFfqIYyB2WzMZ2wkwDeec12JdWPP5L50R5wggD6GGKLkLw3Pz+iU4bdH4a4fE4SJCbx3Rlq4YF6Y7hG3X+Nv43aS909fyiPh/DuHtMq8vIAaj39sRyLg9WPBDhPYFj5vXEe6oGtLyygDCOvDlJQXK/4nS/BWDJLMKLcYPW/r2yxswKzhX2Br1fPtCBlW3Q3zYPNv+IvQYV8Xsk6/og8C7JMHVR2jCN7XKuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GV2PR04MB12293.eurprd04.prod.outlook.com (2603:10a6:150:32b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 13:05:25 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0245.010; Wed, 29 Jul 2026
 13:05:25 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 29 Jul 2026 21:08:08 +0800
Subject: [PATCH v2 12/12] arm64: dts: imx95-15x15-frdm: fix reserved memory
 node names for remoteproc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-rproc-dts-v2-12-debbe0816202@nxp.com>
References: <20260729-rproc-dts-v2-0-debbe0816202@nxp.com>
In-Reply-To: <20260729-rproc-dts-v2-0-debbe0816202@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Francesco Valla <francesco@valla.it>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, 
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: MA0PR01CA0109.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::8) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GV2PR04MB12293:EE_
X-MS-Office365-Filtering-Correlation-Id: e223ab9e-fa4e-43b1-89bd-08deed720dfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|19092799006|1800799024|23010399003|11063799006|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	rAcqwLDW1UX4TcHoy0omXRlksWvxF8F/1OnlpLUUFrueFpNXgUgUDz5rUbDL+j5+QJ+Id58Cp8OX/brL2+39+ZoLbT0zUAofe0RU5hs73ft5LNTFrbUEDd/SdtKzkw9v/8wK4NfCEgkjJVf3mc4w9R+qzCWbdqSOIjP7fNgOSZ5K2EniUH12JLk9Hd5WqBmT5G31Bc1zyqZ59RMjM1yCYzHWcoEVle9mAEQvr1EQaOYnjELNF08IWv7t5mw1K+6oZZaOE4oqOMu0bERoXTRnXQjG62Rmc5cE2pohXF2232lrekFDqdAR8DjojJKdg0GiTJBujKPmVPZ0aDyx6ahVU7QL4YG03olM2RLBi5Ovi80qbySArK3ChyvvdpYs7d2KLwhzrmji/MIJDvgXthXmG2j3gpJFO9muYYioFQqoYrSKud9yK9tQUWga+DwQwt/T/4t5cbujkcTOtnx2VCAkjcpyv4ZQxrMoSe8dytKVw/dYVf8cGgXNC69sHhDNYML1eeWDpvxw0cQVhqO72kXFIPT8DlXwhVuGP82NJNB5/M0DIl+L9iMhPEVJrzELijXeOSe47vRbZ88yF7kCGk+klj7xEqDhu6EsVvJmBnQ8ru8nbCaP8P+vTBD3Sv2Vow8EFIjOh+t17ISVTvJ/qk4R8JvtLvKhO0mMVjQb0Jzu+/Y=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(19092799006)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VnI3Z1prbkdXNWQrekFzcFRSekI4MG9xaXFRUlJpNWVJeDA2YlRsRnhtQTZF?=
 =?utf-8?B?dnczTE1sZ0tUNnBmWEs1bEUra3EvK3o2U2xSQ3Q1b2p2L3Y4elhlZ0UvMlBo?=
 =?utf-8?B?enhnZ29FY2svRmZsckt3MWJ5L0NIb3FtMDJtUThWSmpWd0xvb3FWOG5iQmk0?=
 =?utf-8?B?bUdGVzczaWQvdkNFOTlXMHY3Nzk1RVZoL1EwUW1XYTlWdDByZFhjNkcwN1dR?=
 =?utf-8?B?eVBNWkJ3eTJ5TVRETkNtY0c2RVVsOFpIZkl4Rk1pY1lRZGk4WDVyNWUrQWs0?=
 =?utf-8?B?OXZZcUtzbjgyeWE1a054NmYwZTVHOHcxRXVnakFqelNMNlU4KzFlZ0FVY0oz?=
 =?utf-8?B?YUI1eExGT1hYdllLTG1GSEhXU2RFak13NWV0NTBENm1GQkRIZmpqUE1QTTdi?=
 =?utf-8?B?SmZ4dDhDK21yeDl0dmtub2l3cGdweTlXSnRJeEdGSjlhcHR3a1M0cVJzbjYy?=
 =?utf-8?B?d0JYc0IzekN5Qm9lZk9xeitWbjd5K2ExLzcvYUp6aEc3YXEyUVlDZnVjY1BI?=
 =?utf-8?B?ZXNibWNNcVg0YUVyaG5QdG1uNkw0QWtFOC9MMFR1aUdiRWMyVzNCR1V4dFk2?=
 =?utf-8?B?RDV4UndrOUNtT0FBelFtOGpGRkx0Q0Z0OHc2bWpMWFY0amJTNVpQdEFvWG9G?=
 =?utf-8?B?b3Y1ekV0Vm9FSWJwTDE2Y05HUTRjK3ozOHJQRzIvSDFZV3VGRWRsaTNvbmth?=
 =?utf-8?B?TExpSDRWTE9meWUrR3BFY2lLcmt4VzlYc2hzV29neitYbkV1QzhHbUhpSGEv?=
 =?utf-8?B?WlV2cno4bDBobUFFVFFxVGdQRlpSV1dFd3k2azV2dUt2VjFtRnNHTk5TMDZR?=
 =?utf-8?B?Q0FUVHBpdi9tQktwT0RlY2JyNjVFM3RmbElOQ3pwQkpGaUM2UXdLdUNsR2JQ?=
 =?utf-8?B?YVdLQk9KMzJqTHA2Q01aTWRGYm5xVTNDYzNoSHdKdzBDcmhsSTFDb3lOQ1lk?=
 =?utf-8?B?MUZrbWlvZ3FmVHdjSTh3SkcrQ0M2WkZ2R09JSVhKVStHNjk0T1hYYUFnRURi?=
 =?utf-8?B?ZzBsOEc0cnd0OHVvNmcyY05aU29KYjVGZnA0UUZhN2J2N2g0M1Z3MG1TSEd3?=
 =?utf-8?B?Q2JVa1Y0dHdiY0tXVGNoTjhCY0xzcTVoTnhUNWRnNmJsa3duYkY0azJRQkxa?=
 =?utf-8?B?MVZzNzA0NXVCOVAvWnFRQUhWcFhvd0NJM2NPV0JDa2xnM1MvOG1GRDd6SWp2?=
 =?utf-8?B?ZlN6em9Kb1oySzJLazdKVm12RVc3aWxHb1dDR3hPVlJPcFZ6K3dYU2FLemNF?=
 =?utf-8?B?ZGlxRGVGdm1FWEZzYnppUHgvZ0tBTkJwZFNaV0pvTnEzVm93U1Y0Snlrd1hO?=
 =?utf-8?B?aHRtUDdWMkV5QVppOTU3NzJhTmhJdzBwMzB5UlpkTGNqbXVvODRudEZxaU9w?=
 =?utf-8?B?eFpBUE91czVLSGk1ejNBdzBYVGlCaVpCcHBBVmJjMjV3Zzg4RG94a25oMHVI?=
 =?utf-8?B?UCtla0k4cWpVcjR0d2E5U2dLRUxwVVBmL1lGemJjOEQyNytZbGZkc1pLN2k3?=
 =?utf-8?B?NWN5OEo5ODExVkxwUmtZNVBKNmJpWGlKNk1XNlNxZW9LYURzR0xLU0p0RjY0?=
 =?utf-8?B?T1lEa0FOVjhxdjhxTTFvaitTOW9aTktTL3B5ZUJIUnBydHRoOHdTcGp6bFNa?=
 =?utf-8?B?cEZpSnZoYUxneTIyU216SWNZcC9JVm9ubkdXVHlROGtZZFcxTXJnb3lBam14?=
 =?utf-8?B?WWJEWmVIUm1iblZKVVhKY2d1d2ZpamlYY292aVJKMmdzZmNqOElTUjBBTFg5?=
 =?utf-8?B?UVlHSnF1Wmt1UVdWRWd4d0R2aW13T3ltWjd3ckowMlMzS0R5OVYyMDNRNC80?=
 =?utf-8?B?bmhYdXZ3MTJvUDl6YXJzVkhEdWZnRTZ6VUlJRXU3Z3NzbVpYSzFIU0hzOGht?=
 =?utf-8?B?MGI3dk15Tk9Vam5ybzVDR09ESHVsdEZUSWJ4bUtyWGtUTmRqd012MUsxZmRN?=
 =?utf-8?B?bjVPSFdVbFBRellLV2hkanh3OFZEVHVLMWEzeUhESWxDYzlwVktKZG1adkRK?=
 =?utf-8?B?K2hvRk1Dc0lxdXVrb1JSeXg3VzM3RWxuK05ZaUF3OUdzMTg2NjNLUHRadTBa?=
 =?utf-8?B?VmNzRkNhbSszeFZpQUJwcHNFQjhqc2wweGVNZHVpZXdhaEFqWUVQQ01GdHl6?=
 =?utf-8?B?OG1GQkcvM1lqMFNERDZ4ZExkWVlmSUYrbmkyNUVicUhYRmFNYVpvQkE0bXMz?=
 =?utf-8?B?S1Y2aTNPdGdDc3BramNXeVUrNDBBbWhqSnJYWVhGbjV2ZUVsTjVNSWtDTk9l?=
 =?utf-8?B?cWJ4azBqdXJzZU1DczRuY3FpN2JTTEFUWDZmZEVuaFUxSEJDcjF2ZjY2ditS?=
 =?utf-8?B?SXVsbCtLWTdYNjZ2UGRBTmxkcFIyanZQQXFyOFJYd2RNKy9aVTN4RXFFamIr?=
 =?utf-8?Q?eaeESIi7YYiGfQ4dQjim8kj2ruyMDHCatt/91?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e223ab9e-fa4e-43b1-89bd-08deed720dfe
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 13:05:25.2741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rRQW/1tBuDywzXdhonJhw+GkzH1A4Pl1QTFR00fRMvr7KxPJ9O/fwewYwzV1qpmQRK24qsiH56ylgd4XvAcKvB7ZtIhzCr1Nc6/SRQqKh+SvdBKBkaFkAgWekHhaJBSk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12293

From: Peng Fan <peng.fan@nxp.com>

The imx_rproc driver uses node names to identify reserved memory regions.
It checks for "vdev0buffer" to skip mapping, "rsc-table" to locate the
resource table, and "vdev" prefix to filter vdev regions.

Rename the reserved memory nodes to use the expected names so the driver
can correctly identify and handle each region.

Fixes: 9bdfeed989b1 ("arm64: dts: freescale: imx95: Add support for i.MX95 15x15 FRDM board")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
index 0f43e3be70589..e17e9b3dfae79 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
@@ -188,33 +188,33 @@ linux_cma: linux,cma {
 			linux,cma-default;
 		};
 
-		vdev0vring0: memory@88000000 {
+		vdev0vring0: vdev0vring0@88000000 {
 			reg = <0 0x88000000 0 0x8000>;
 			no-map;
 		};
 
-		vdev0vring1: memory@88008000 {
+		vdev0vring1: vdev0vring1@88008000 {
 			reg = <0 0x88008000 0 0x8000>;
 			no-map;
 		};
 
-		vdev1vring0: memory@88010000 {
+		vdev1vring0: vdev1vring0@88010000 {
 			reg = <0 0x88010000 0 0x8000>;
 			no-map;
 		};
 
-		vdev1vring1: memory@88018000 {
+		vdev1vring1: vdev1vring1@88018000 {
 			reg = <0 0x88018000 0 0x8000>;
 			no-map;
 		};
 
-		vdevbuffer: memory@88020000 {
+		vdev0buffer: vdev0buffer@88020000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x88020000 0 0x100000>;
 			no-map;
 		};
 
-		rsc_table: memory@88220000 {
+		rsc_table: rsc-table@88220000 {
 			reg = <0 0x88220000 0 0x1000>;
 			no-map;
 		};

-- 
2.34.1

