Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013008.outbound.protection.outlook.com [40.107.162.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0DB3A2576
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 19:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783538795; cv=fail; b=jkiJj9QXyvxSPS3FgBG6NmF788Oiq/MUOerHDTBmj0lyf3QimoyI4/zajnjZWnGpLAPCSh1Bc+rbCANBfO0SAB52UrvgCHW2MN8++BYOj7/gf89X+ZziW53Htx6jC3ez6RFTQJwalQ9FSZObJEvPU2rbW3vUneEc280WNekEG+w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783538795; c=relaxed/simple;
	bh=OFLXZCoAqtdf3jzW/xvOXRNcmCoURggP/rJWLAeYH7A=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=MTpVZJyu37F8kjWrkmN5PsXHRQ9a4/pWaL2ZAofARnd9n747IRoCxhp5STprQrCFrPyPFPiREj30PQ2U2nIJTClrMV+Tbve9thLY8J5foMKoWgV+p++kmSZaRIK6mWxzIA1aw4HkSgHgSvaj8pL2Fxdq/DSPpWllgeTXHKeNxqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Q3lB4MjP; arc=fail smtp.client-ip=40.107.162.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Q3lB4MjP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YMG1gBt6K5Ak6DOz6jMu7ZONSYohRlYTKLWqS84hlIFefIrY9jrWjDR2bKT1w6i8OejlK9xmbHTHOdMv5uPtndYrIVNsRw61oIHU9cO89W69IpavuOkQXI/gy/+GngLExVvGQDWPC/FT860cDWRC0BBrA7lw0EPyKe+wbWbpIeMjfFErp/rrE/3axo9sEmL4e3JRHqsKh3d+FbhJy28cwkuOS6K4bO9IHQM7WbmfdIfOkaL7lsmjFOcZbyrSMxWQ3N+jnuf8aTL1Fs68HJ6yKMb/BjfHJqabFvgtP6FttpZytqXJDblSA/iM4rnJpTv9h5Ed+8m+Bil6Vn7H0VNDQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+nuaJzSwgHPvQLJogYsbTWKAzGiFLAcbEH/Ec5jMJMM=;
 b=qCOHaEuhMEbQuuevx+fNWdBMRGMoEbZt6NrBXMcVjS9P4//xg2YopQSzuxPNaaTOIGNA35o0shXKO4PwV0gXv1iKTFd3c2p6ky5Vii54M4jzbmN74mKr5G693/cOv3yFyPzUlOAhiJg0KsoDPPfdyblXDGts/ZXVrgw7HhSu+OGvpEzXX7SwZx+9lJ3i+E7Z4n17veh2MnABm/eKJDvyZho0yGQaidPixKgaGMpEnhnaAQryGef6xSDBZhiECL55cwsmUN34bMn1XBnibCUtlYWv6Qo/dTQdl7tqi/AOHX1u0jCqC92gvDJlAsRB++WA6E6UeAuhmgFCmDAq/MlOPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+nuaJzSwgHPvQLJogYsbTWKAzGiFLAcbEH/Ec5jMJMM=;
 b=Q3lB4MjP7O1gGEmmO+e9tbMZvP/SZzFXUK2m5Pi7N6ImrtbDD7xSZpkoWCby85PTCtZgVCxXr2sFGliNQFeT6YmBm93YYHfB+mzZ67ajsbDACg1HbY1JU6G6kqdWHnkDCiUGUbYcJhAs/EH965G5bQ3BdQCCm22C37Gj3LZHnvHnOWEfOJzsZPmthwHZHmHdxoMwuMTASsjI9jM4OOsp41aEsN/KsAHPvFLx6IR+5B50rd7RERgYDOB/ZSuK4qJB3poHuw+1ICBuWG+I4kvMpYmLS6EI14A33IWSGTtgOrYBpCjxEgVNDYdCzMAeMNXW+shmt6D7vA3cRnADXZB5Jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB12342.eurprd04.prod.outlook.com (2603:10a6:150:31a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 19:26:31 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 8 Jul 2026
 19:26:31 +0000
From: Frank.Li@oss.nxp.com
Date: Wed, 08 Jul 2026 15:26:10 -0400
Subject: [PATCH 2/5] ARM: dts: ls1021a-twr: add power-supply for lcd panel
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260708-ls-dts-warning-v1-2-5daa24061c31@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783538774; l=741;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=AjWUxARSPLz5Jmgu9TAhwQ1/Wx/4e9j/BhKT/uSKIEE=;
 b=YFu6bvgA3ZmBhvr/JmDlQG1l7xnj2yyMYNMBbzjVBsxO2UUQEjbsVRZObgfXM+gRGGgyjy/S6
 SVvOUhMZJPdDK5mLCphy1r/Q4pscE+iiXDrara/qtP4Bd84CLjinulj
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SA1PR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB12342:EE_
X-MS-Office365-Filtering-Correlation-Id: c05ac3bd-73a5-49f6-b7d5-08dedd26d03d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|7416014|366016|23010399003|1800799024|18002099003|11063799006|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	4clgaZxr6FPOU3E19gucfMDLEZIMD/FZoqavw7iJg3f5Vv71+qYc1W4j2wfd3HSr4q6Tfjbiqhh/abQeuJJin0IlIr0NTzEU+jhMNDjdboenr8Vg5D3aw14wq7E6yWOM002vtz3r1Zn5da43yApRtTPPbE701Woxb2ohZOj8ESxaI7bp90t7OaCrR1kMPWUyKg5AdQ1Xw7OY+oC+mglnVJNJktiiNJVqfRIagqR2ILOCgbXos/O2BrxdXmp+4ycniXq92TxdJ8TBoWWdpCRtAbGIzsQ5ATN257x5uLVk6LIZ5eCYhRsPgfWIX11zWJu4iSDgRB6PCRCfa3cPuODeWb5xgAi938RGjQ9VgssDApOMbQETcEza/HBYAjrkiEkZW4jsT62dmVfhVnavrUgqmKO/BY2MnSz7zPsujn3EL8cHQe7LmRwWUgonFxcpsYMZruGJ+mlE4wslNTjR3/FU2949hxdxDuyHq/AoWjMu+O1dl0M82B6eZlzBrGlmhTstvjnRJiKpBM9rSlIWIjGfsStFMxeO7k1DADY3Pj8w/tJKDIpk51zxlgHeWSEvLIUWR2CNa+p7jKkJ6qTgmiqWjMThmyi0uuva1T3Eplt9aO/Br4tVPvHaKsHfo9DNm3ktIanVL6ltNvkeLIhXcpTcChBQXEo8g8Mxdl9xEX0DuHA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(7416014)(366016)(23010399003)(1800799024)(18002099003)(11063799006)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkhPQVVOMVBqTzRETkVtdS85OWpVT2FKM3hYRHZFZHQ5cDZ3TXhkc21sTldL?=
 =?utf-8?B?L3M1ak44YS9iT2pXWmw2M2pOc0YyZDlCMmVXYUFXQW5aME5VTTlIOGxwQ0hQ?=
 =?utf-8?B?cTRGUWhqZjdBSlJMSDR3RXVzOHlTd25FYU5SbERDSW1CaURZV3hkcUMybm5X?=
 =?utf-8?B?dC90Wld3TmVUSFFLM1BCamlLQlNwYnBtcThPaUlMWUJkNCs5U1o2aHNmZDBZ?=
 =?utf-8?B?dkNFRWZBVU5seFRYUGdJTDh5ZThTMzRpQkExMUp3c01xV3FObUJ3MnB6SjBE?=
 =?utf-8?B?ODlVTnQxS01RQ1lHUFhBQ09Ba1pQMGgyN25xeG9xSjBZSVJhTjVVNUl0d1Q5?=
 =?utf-8?B?OWVHV1hVVDNNN25Ta3lMYkFuNGNwSGkzVXQyUjJQODB0YUNubVNldC9SMXY5?=
 =?utf-8?B?bm9tYlBDTzlqYm85MnFVZ2VlS1BQSGVvMTBsd1BWbklNUUREa1FIMlBESzIz?=
 =?utf-8?B?ckFFaTVIVVJmUmZqVVRhSmZGaW10QzhhaTBvQVhvdGM0dnh0cFY0M0pwVW5a?=
 =?utf-8?B?T0JwVG1lbGl6UWdSYUEzdEgwMkp0TytuR1lKNFM4d1RXenZzdnNHKzM5TlhJ?=
 =?utf-8?B?eWw2cjBmSlRGeWJ6Vi83N09XU1ZJZHl5KzBObk5mUE5RNFJUR2JhMDNHb1da?=
 =?utf-8?B?Zlh5K1YvUEk3YmJoNVJ6YmgxTUZBMDBVS2RCSUFidHg3YkNKeEVsQjZQWjQ3?=
 =?utf-8?B?dUVWdU5uMDh1NjhSNDgrcHo5d2VncDU2Y1hBWC9mMEIrQ3hycFlFQldVNUN3?=
 =?utf-8?B?VTkrVTB2NzB6NzhDYXpmZlRabUhqSFN2OTBtUE5XRkRyVG9jNE8xam9majQ4?=
 =?utf-8?B?R0s3RGZCV0IzLytXbkljVmd5UHh3MVdkcWMwUjVONW1xU1hyNDNRM283RDlU?=
 =?utf-8?B?VWkzSU9kaWFPY25kZ3Rzai9HbU94a2FjejIrY3hsVE82ZGhEdFNnM3BMZGpx?=
 =?utf-8?B?eEpxdWd5ZWJTRUlVeGwvYWlkeDdWUmFZRmt0NDYvQm8yWlo0VXB6R3VqNS82?=
 =?utf-8?B?RHpJeGVzK2k2eGordXA0aFRsRTVEd2EvcWF4ZmgwejFUK3d4bFJ0eFF2MEYr?=
 =?utf-8?B?dEJCMmxMNW8yV0c2UlBXOXJRWW5TWDVGR1hBNldMZ3RZRVowV21BSk1qTFlh?=
 =?utf-8?B?V3dyVXpranNMQVJ1ZmRqbXVDbmFqd1RzakovVUxHc0lUdXVwQ3gyRDlSNVJY?=
 =?utf-8?B?c0hodVJKZ2tsU0hhMTZuZm9uQnZqVTBHblo3YmhPWUQ1QXpVbloySkdqRDdj?=
 =?utf-8?B?a0NrNTBMYlhUejFiZjYrYVVqMXFwbVlzWmlxU3pWaFE0UmF1S0ZYWHpLZWw2?=
 =?utf-8?B?VG4yMlQ0RDN5RzMvZFdvZkVvWVhKVHJCQ2RDaUdnaEQyQ2VueDRXdkhOL1Ra?=
 =?utf-8?B?M2RuODUxUXdvMUp4Uk9kQm1HVjQyQnZOQWtMNFJrK2FNRDdCMEZIU0s3U2c4?=
 =?utf-8?B?cW9NMXdlRko2N2xwOTZ2NGxiRXdvYUNqS0JoVXZBNFU4V2YyQytka0MxR0Vk?=
 =?utf-8?B?QStEWTZLUytCMEIxSThrK2VxZGp0a1RDMUJ6Ui9qK05OWDR3MCtBQ2Nva3pp?=
 =?utf-8?B?OEhibE5NMDFvS3FOait2dklEL1JnaEd4SHRrZDNrTGpBVUl3cmRJcWl1R2Rx?=
 =?utf-8?B?WUpHQ2VndDlOa2M4VEhKMDEzZWFtc0xiTWZvTmoxbFZoL09mNHRVcyt0Rzdm?=
 =?utf-8?B?ektXQTJvcXp5ZDJ0cVVFd2xUSWFOVDFKdmc0Mm5Sc2NDVDAyYlVZK0ZSazZm?=
 =?utf-8?B?TFc1WjZxckprbnNwdkdwcDNIWXNORVFaU1N6WFVtME4yNFdscEFWdFY1dURG?=
 =?utf-8?B?d2MvYVYzcDVZVmhZNjdCOFNYbXA3ZEZLOC9Dc3lBZ3Z1YVduSTQ2OXNjQlBW?=
 =?utf-8?B?NndFeTJ0bGx2QWR2Vnh5Wkk4WW00SHpLRk9HRzg0Qmh1Y29aSTRwSGM4dC8r?=
 =?utf-8?B?bWZ3bGRXd2huaU85TEVZQW9Jdi9rK3g4cGhQc1FrUjVXKzBMaGpJdnRjUy80?=
 =?utf-8?B?YXFBTWsyTDluY01UWUZuWlA3azlBVG52OUNnU2hyVU4rQjNYYU9iOTBCU2ZK?=
 =?utf-8?B?b0s0dzRDSjZIendwd040cDZoTjZUaXRPUjQ4YVd0VkE3S3pGei9EdmtLRk4r?=
 =?utf-8?B?bU1Jc3pRUzIzaCt3OGNkMVIvYkJlUlQ4dS95Skw0dmNCTUwzL05BNXR3bVdK?=
 =?utf-8?B?bm5LaWdBcXNGMG1PRmVyT25iVktZV0FCQkRtcFJkT2d5V1A3YlR6ekNSRUVL?=
 =?utf-8?B?VkpsVXVZWGdVQVFWQzI1YUUvMXk0UDhpZ1hlQnc3TWFzM0cwRDNaS0kwcDlr?=
 =?utf-8?B?Mmh4QytjOVZRek14c2F0b29wbDZwdmxQYzltWjJuMEIxUStJK2ZGUmNXYlhz?=
 =?utf-8?Q?6eBPPQDctOzTWxFIJwj7VhSqpMdh1ykLldssV?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c05ac3bd-73a5-49f6-b7d5-08dedd26d03d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 19:26:30.9665
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cg2umFJsS1EkMS9S0b4gxEhPUoOv1Xzap9u8qCG5jOOY0IuQYwJyl/Ro8qBM86tLS4ABnC5xVu5Heb4OuKah17YohYkVl/5FRitLQMXy36r/ci86IweY3Vn18mN3vaN9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12342

From: Frank Li <Frank.Li@nxp.com>

Add power-supply for lcd panel to fix below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/ls/ls1021a-twr.dtb: panel (nec,nl4827hc19-05b): 'power-supply' is a required property

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts b/arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts
index 38281b904301d..d9957dae4ea13 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts
@@ -61,6 +61,7 @@ simple-audio-card,codec {
 
 	panel: panel {
 		compatible = "nec,nl4827hc19-05b";
+		power-supply = <&reg_3p3v>;
 
 		port {
 			panel_in: endpoint {

-- 
2.43.0

