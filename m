Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011034.outbound.protection.outlook.com [52.101.65.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D14492196
	for <imx@lists.linux.dev>; Tue, 19 May 2026 11:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189232; cv=fail; b=b9Mfed9f5ad7l1XMs8IYmIIYLQj0olYAe8YvQdKYWA84Ro65UjmKF/95yt/1d0hWcs32aXyezlidOhBj+18PpBPM4dDhrOYFGAJQlkm+oV4nUuMaCWYIhhgvClzMxAsW3jCrwphgmtsVDsH4ceiW1mfGAs9gE+jeSW6kp5HIfb0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189232; c=relaxed/simple;
	bh=1SrsUPBGY5C+5Qvc4xd1sjLfT+8O445h9JUU+OIoLro=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=jaCIGoLdcg1EUKdxUANUxTYauSiJGUrz6z3uxfGUirjhN7Vc0AnlfyyvqP78GhcrlcAeOP5s0yjPRCka1JKB6UCC98xhMB2Tf8zi6HNg7JqE3whJnpfAjCzZVttZu4j0F/aIH6kxZyGvhZad6SwCy5V6IVtwz3zW65Q3CDT8/AQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MIDjFPdP; arc=fail smtp.client-ip=52.101.65.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MIDjFPdP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q3kcPssitj372sGDMB+/SREeFX4LC3p6FyjxSoRZSvDc9dEfL12S7Xya+3gUYPVDmJ/c3cp08Dlc8tQdnkET8fu2vNZuZUEWTWlHEQbZT0iSJvGMWY/r6/8ZyVQpN0pdmSR5xDBU2cjsEri8Xh966oZ7tETkpu8eLT/P/33Er48HBcImxUgxURCN0ePW/bP84sjuPxkh7m/lrOGv6vGZX1eIeJ4jetV9/LMPp3RaXDPafxXJmESD46BLxhXZFkMcuns22zfkzo16w5kMEGj86AUt5S/xwh6TnqcU7Kt0GIFliC1xdZeSG+LC18FNNwLJI+En2EAi2negH1QgdiTIiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HY9Qp6olJ8r9QlSVW8oAZlvOR2SqJus3qzj1J8TRYmg=;
 b=q7Bqxso0DTr/qZEmYpbxP8EdPkrBgBTsEb0++ZrxkTa5ceczbOsaID3JZeqL7TrhDLnKV4D7c9HNxOu/nlonj4Zve+yEnaCWYXTIEbu3ECOmF9l4yRD6psp+9g4iwOArQ4dyF2Nd6i3HC8oZv0uPeqhEZD3h59FjC7Bk+lgccqSYpC5CwWjNqKWCttiFe2C75FHwr0nc1Sf15hUEfIGHy1WCP2xMwHe8Soc2HrNiUCburkPTBj1sTi7qoJ1NJIXrPXyD6jxr2rqBTFN7Pi/j/0Cm0ecbTvIs8FC9+VP2UBR7sCD3e6g+h/kf2z36U5FN+aMgycXZbmVFSLiRQX/9Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HY9Qp6olJ8r9QlSVW8oAZlvOR2SqJus3qzj1J8TRYmg=;
 b=MIDjFPdPRWwei4JkAWRKD6Gh3wQaeL0oPGXHdDBMujMfZQNjHUgXyNO1LGB0qw40gKObRrbRSgK3n5zMod5TRwRCht0LPNiKGRz0JndDOE5WWQ+YEReYrv6y60xE1DdNFCE8VAQM5n4C6Kypwc+1TsVrWz+3KBegUP3vtygVITCXh6in26ICDaUH0iLkQ27lnnxhqwY/L/fJzURaBGVCpE2/yPhHKsTbDEjQbfTdwO1KBOG55g4e/FqMU6LpU1wbYCwFrNYwlPfoCZ5at9zUVRbaCXuWKhdWy1lnl/S14UslrNf2sZyFczotBFQET2atMCkUbWmTr8e81YPG26v4KA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM6PR04MB5765.eurprd04.prod.outlook.com (2603:10a6:20b:ae::26)
 by DB9PR04MB10009.eurprd04.prod.outlook.com (2603:10a6:10:4ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 11:13:48 +0000
Received: from AM6PR04MB5765.eurprd04.prod.outlook.com
 ([fe80::bc76:f507:9b83:9d69]) by AM6PR04MB5765.eurprd04.prod.outlook.com
 ([fe80::bc76:f507:9b83:9d69%5]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 11:13:48 +0000
From: Joy Zou <joy.zou@nxp.com>
Date: Tue, 19 May 2026 19:15:15 +0800
Subject: [PATCH 1/5] arm64: dts: imx91-9x9-qsb: remove unused property
 clock-frequency from mdio node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-b4-imx91-qsb-opt-v1-1-9b416d2dc224@nxp.com>
References: <20260519-b4-imx91-qsb-opt-v1-0-9b416d2dc224@nxp.com>
In-Reply-To: <20260519-b4-imx91-qsb-opt-v1-0-9b416d2dc224@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Ye Li <ye.li@nxp.com>, 
 Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Joy Zou <joy.zou@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA5P287CA0352.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::16) To AM6PR04MB5765.eurprd04.prod.outlook.com
 (2603:10a6:20b:ae::26)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5765:EE_|DB9PR04MB10009:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cf1c0cc-439f-41be-1b5e-08deb597b309
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|7416014|52116014|1800799024|22082099003|18002099003|56012099003|11063799006|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	KnYS/eIz9318epbpM4srs/E4iDW+MeuGwrpCYbw08UmOmCFh0uVvtJl17tF5WZAN1eN5A3xfBC3M8ODkMU1QqXnb+8UtExipLO74jMVIpVXC/aVP6sbDr2O6AlnnbJty6GV/pc7vQmuR8U0ObDWj2YQJ0ME9gLwzM3C9dYSCdwZlgvbRBD83xpmNssdbOvcS2G59bdD34tFNFG46qaIU3M4nJPPuf+rCQR1m67uROHNtFBytjpQKhepI7Caqwx6pG5vVRouw6xx/h+TGjkmi2hOr1GbV+KtlpTsSJ4nZ6Zgq44FyEJvTpOb2CYn0+6tyAyLoGvvO/QP7EfCDbhdshYMclIBBHPESI9fpCFykFGU0g1SqpSpdd/aW2dNEWh0y7+VeYsTDbyqJA/idWBklrc4zu0aMhTatV9CTaPmoJxVPLP0doOhh2meGqnDs7pIcMW/bdX2mNn9zGIxS/QfzfabYpqZCIeaVAWSL3eMoP1qeEu6Qfd9wZYNv3J3yJeg4Q+BE4F1ElZ979/nodcueMTSRMI16ady92Nau0u5nmxFSw6VENyEznNcasrfuASVMBCPF33HkbnBsK/44Yu1Vb2kQgSIrC17k+PFeXxNLFV4bncw5dFaTRJqX2MBN2LCBjeBgsnVYGAqtETH1pFRZarBMeLlJUqlcA/kUQjCb1IDUlt6ULeFOfSOKSipnq+aszhkc2aJyCTGe/idLIxo2SDc358ptt999oKSpby8J5bIKETnF59y1sg7mb4fZE4+E6pFkrUE+xOMle3ZHQqm5Zw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5765.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(7416014)(52116014)(1800799024)(22082099003)(18002099003)(56012099003)(11063799006)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NklBdkF1N245cHdaeHN3anh4aVZicVQ1aHJsQ0xXM250NWJiMjNNc3J4bWZl?=
 =?utf-8?B?ZXFQWEhXVDRKT3dZK085Ry90VnFUTmFtUGFKZDdnNTJTaHpDYkZvOC9UTmFx?=
 =?utf-8?B?RTlaTjJMc3JkV1B0UnAvNlEwZ0xtUVgyajNDUW5kN044ZE9oanFGckVWbWdu?=
 =?utf-8?B?MHFxT1dtK1hTY0RkVDI1bHpzMDgwNDBvTThpSU9OOXJEUWpYREpSOEJ1OE5w?=
 =?utf-8?B?dUxpLzRBZExDNUJjN3N0bEUvRzN3UWZsU2RlUkZmK0xKai9Hc1gwRnE3bWtU?=
 =?utf-8?B?aCtHS0lQbGlEL1BLa1cyNytkY0FuU3BMY251dWg1eGphMHgrRHZod0VwL3d5?=
 =?utf-8?B?RVZySTFwSWk5d2xFUnh3bExLdUZ5b3p3UHJCdTRSRmZIbFNnbmcycTNTZ3lX?=
 =?utf-8?B?UFZ5Zk9RSE9nU0VSOWhINlNWL1dpeERTSmhoQmFkOENCT0lobmdwQ0d3VEtT?=
 =?utf-8?B?eis1c2RRcmRxekdDY002TWVlVGtPRm9SSmp4N2lvemhuQVAvWDNvdWl3aWtU?=
 =?utf-8?B?NTVGWklKc2lFQ3pEVGROZUJSa0ZTZTVhRnZRTlphTERGMU9jdU9rLzdsd0Z1?=
 =?utf-8?B?UnZ4a2hRaERWTlJvU3F0Z3RSVVNIOCtQbERRZTFrbDBlVE8xYUd6OVIzZnMr?=
 =?utf-8?B?MnVteXdEWmc5ZjRVclZZRXE0YWk4OVlmbkcwYk1VVmowQ1p3eC9EKzBLRWsr?=
 =?utf-8?B?akdQNzk2TklYSjFrNXF2dWRJcURlbXNlMXd6eWFzV0VGNEwrWWlScURQVzdO?=
 =?utf-8?B?Y1VMLzVBeUZoQjFHZERUSkhxTFVBTG1FR0N4dEJYdlFkRGFobzliQUYyZ0p1?=
 =?utf-8?B?SHgybDJpNlJaV1ByT2pxSlB3eEFTSE1tbnVaR2szb3pFOFA3K0NxbUsvYVlD?=
 =?utf-8?B?TXJvd2tqVjFuMVIvaDB0YktRdXcxclNrL0xHUjZkbG0zOFF6UVh0eTQ2a1ZY?=
 =?utf-8?B?OWhlTzF4TWFSdDdBRktuTEFYc0RLTHM1L01iTE4vN3pGTXlXS3lvWWlGSDkv?=
 =?utf-8?B?MlUrSFlpU0o3SVhBTHg3a01ScGx0VlgxRFZHOTRaMnovU3BLaEw2MlJEaEZk?=
 =?utf-8?B?Rm5WQjZuUjJ4YWI5MDludFY0Zk9RK3JzMXNwU3owRTd5YlRKRjRmM3Zta3Rw?=
 =?utf-8?B?eGZpRDNoOXdiUlhVemZXaGpOckcxV254MEx5WE10NEt2aW5QWVNXdjYwK2No?=
 =?utf-8?B?OVVMRmNoUncvT05OM1FhTkNyb1AvcU0yRVY5UWJTZVVMcnNkMHZwekw5RVBs?=
 =?utf-8?B?ckJQTnY0WGhsaEpTTjhicFJNVFI2bzJTTWhDSENFZCtNSUVRZ3VkWVNqa3ZN?=
 =?utf-8?B?TE9vaHdiVHFzKzZLbUkxYjFxZ1hoS2NxQ3hHMU5aWWl1ZUZZQTVJOWRNWW1w?=
 =?utf-8?B?NjRIWlJGR0Q4ek0yeS9WYXJudy9zSkxPajZqMUZMYXVpZWVlR1R4MzNuUldx?=
 =?utf-8?B?UXh1N3BCL1FRTGExOVZ1UHdiaE5hc3FBOFNLSFRBWGJPaDdic3RwMFM2M2pX?=
 =?utf-8?B?V3Q0WWkrOFJqRldiMDFZU3pDcUxMaWdSQm45clVHOG5hMEFFanVKdVBZb0Vk?=
 =?utf-8?B?ODl5Rjl0T3Rsc3g5dkRCNVlIQkNHV1IvbHNmdUJ6NzZtbEY4RXJJZmZNQ2hh?=
 =?utf-8?B?VVBsZVFwZHdiV2N3MmltVEVyaXZ1UG9xUXZWeldqZ3drSWxXOGIySnpqcGdJ?=
 =?utf-8?B?c3cxTDZsUXB4bCt4ckdLQnp3SmJ0QkpobW1lMVBwNDZ3Mit6bkIvS0JsN3lT?=
 =?utf-8?B?MjE5YU5lZEhLUmtPUlNCTkFWcEgwbDhjeXh5bk01K1NTV25EUzFQV2hKY3dU?=
 =?utf-8?B?TEpqT2xyYlhWMXJhWWM2VFpxZkRQYXJ4ZEhvSDhqcXJFTnVoNWlXaU1kUjNp?=
 =?utf-8?B?L0pOTXlBNnlBODVBNFNTZEpJY0Q5T0tpaWljcFJlazRaejlkMmhSOHUwTmhu?=
 =?utf-8?B?dk9ON0lKc3pmQVBIeFNJa2FnbHBMNmVkMVZaQ1hkTElWM0Q4SHBob2VYVEVv?=
 =?utf-8?B?THBUdUl3cGwxTkg5c2lTd1FUZW9LVUswTkkrUWxXM2pzSHhvM0puSjlpMXho?=
 =?utf-8?B?K0xoaVNHVU5QNzE0alhKM2tDMWFHWlo4ZklCVWhXZUcveW5Rdkw2REZwOUo0?=
 =?utf-8?B?cUo0SFNJakFrZlFpK3BqdnZNbmcrQ1djeGFsZjFUWVN2VWdhRFQ0YUdkN0J1?=
 =?utf-8?B?aHlSeVRkS09XMTZCaHNMV3Zodk1LbUNwQ1Y3bW9XWlVXV1BIeGQrMklkV2FB?=
 =?utf-8?B?N1phTk8zNmZPbEkrOVYzZDZBcU40K1U0SGt2dlk5VHI3cDVaN0NDRWo0emxV?=
 =?utf-8?Q?53i+RuHUgQ+PFHdez7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf1c0cc-439f-41be-1b5e-08deb597b309
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5765.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 11:13:48.2633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SXDMg/yeTaTr/5XOQtEq7+gxVfaMiNoKiXyfatOe1h2upnnB/CpcuOstzMShkgGj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10009

The clock-frequency property is not implemented. Remove it to clean up the
device tree.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
index 1239bbf579da44ab3f4be2dc566c53a1e5db6c05..9cbfe57be2d3c37208611dfba5acd428f0b58c3e 100644
--- a/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts
@@ -79,7 +79,6 @@ mdio {
 		compatible = "snps,dwmac-mdio";
 		#address-cells = <1>;
 		#size-cells = <0>;
-		clock-frequency = <5000000>;
 
 		ethphy1: ethernet-phy@1 {
 			compatible = "ethernet-phy-ieee802.3-c22";

-- 
2.37.1

