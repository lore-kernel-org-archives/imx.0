Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010015.outbound.protection.outlook.com [52.101.69.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2AA34D4DC
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 07:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774511506; cv=fail; b=iHIo96qZP4neKU3XepE4bfHkpYO/vPeEIXtlDnUeijeZqhH5U2F8vd7Ka/JDzvtlqRrWga3bmnMl2ipLLKY0p6+e5qRbjJv9u1l1it5+ThGZ50nhSfIxpTvI4Rpa1JO3OIfX4R0apEvLEtBW7lSN4HYPPvFL/UArZP/2k2Eohgo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774511506; c=relaxed/simple;
	bh=vIgI9U3zoW97p+E3yavb4b96W3amMZ58psPnQmxI0pI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=NaaByZK8ZPwOC8YVDBs+rhsR1EuyPHbCahnu/A92hy7m/chWzkVOV9u5foCvSBU8se/XCPnyahoETAemvVCeZJEsQQUxA5m3Oz6CmMuMGGzSytYurX5Fz+fr+EeHEME4xhebHoJHt60uJoWht69S/aAYr5DQTC6FyJzplzOFV9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mD1oeJW+; arc=fail smtp.client-ip=52.101.69.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mD1oeJW+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LFnSHv6W6q/IUu43/qafe2n1nF1/rzjDwAq6Yaz9T2jjDrqzPNUBTiPMQdK9gl/IjaDOux3j9aiAVxN58wOEKwUxQSE5BDDsw/yXvU/wohLuqs6BOsTZ7EI7GiXUKx1yRvBTWL3cc5Pv9DyA2ytcXk/Ak1JIWY2BFjIMYCwa0DVcXFTjJ7/30dGJGXS0W0eJQf6Ojl0IAdDa9iXl2GwEQhswGXJ/SVackDjV8sM2irgDauEagWnprd5IgJrNzCERgo0Us3SoXIMInXt82ebKJAgLXEbACRUvY1RkLo98lFRTVeGSlzgV0txocnHZBlQZ5SZRubD2tKOauVwPcuQs+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dd7csQyH/aH2+sb7iKjs4ENlq41JmubBEBQUeActs78=;
 b=yj0qs+IRr46IqCqMhBT5biDLOtDMxnLekjtKQ8AZHH8zXU7pMPYWSVYEoJjmC7YbU0zmjOdxyoKtzyCHfvYXcwjeNpvqh4C94ap7MCt7ab1Gp+awzdWTH31oxHCKOJgZ3pq57xe5+aDB2SL+uDglf3witeLHWJOs5r2oW80kpQux+AvJLaEHBpuxqEovpMWHqR9gBX3gVm3Y034Ip7Cd0R+rvUQ7YK6k+oKTyZcNP9Gn31MqMATByQ6eC2ljZlOaNkpqG69OW99KpE4WUt3eGbR3e0mglTF05riJoUnJcPybrQ4kabnjSpjjW2YqYPwsp5HT9vqpsr7CJaoSobhqEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dd7csQyH/aH2+sb7iKjs4ENlq41JmubBEBQUeActs78=;
 b=mD1oeJW+055BW/KnvVrEafMCEu9WUHnd4JVfk8kDXQWAroBRqk/sNUnX3/KDHmKlVsMnMi5GM9QcsRfUSqw049xO2W+iPJMR8/p8nxrjLwwk3zmsNvfihPbJo+eHBz03f0gdP01mxKISbc3BB77TQf8CrRh+M0jz38waB0PLHlExctKRC6u7G2lwlWAJkakovhZakn7CEuG1HPTiwkZ71+4NC84WECBUxQxmd9ORC0AokolYMrVp5c30aeLmgKUG5XtTfUg04jLG0sfOFkYQ6vrx8y8SNSJXJt+JSUc/VJFE/H0fWIDCKsJnT9rGHaHHn7qpXwAjcHRmtOdmfIf9TQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by AM9PR04MB8413.eurprd04.prod.outlook.com (2603:10a6:20b:3ec::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 07:51:40 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::1fdb:9c8f:5400:8bdb]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::1fdb:9c8f:5400:8bdb%4]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 07:51:40 +0000
From: Joy Zou <joy.zou@nxp.com>
Date: Thu, 26 Mar 2026 15:51:40 +0800
Subject: [PATCH v2 4/5] arm64: dts: imx93-9x9-qsb: remove unused property
 clock-frequency from mdio node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-b4-imx91-qsb-dts-v2-4-b991b81639e6@nxp.com>
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
 Joy Zou <joy.zou@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: d0dc29df-ca43-4435-ed43-08de8b0c8424
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|7416014|376014|366016|1800799024|18002099003|22082099003|56012099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	mUSGsaPNlKK+Otll9UwONjAb9/Eb7GA8LVWQj6Act4ekcYSoRehCJikIahEtQSakJGjc8W+OspHRL83YEVhB/1GOIE1TMD7MRkVJyuzBZpLH+G08dwjBb4LwfoHOSqrYOWORE5EDY0qAc6H97XIz/B/YVChasyCvSffUxyEqqzNjLTyx/3NFhJ4bBrGRvyOKjVVkgeucS60CGKjj1vc3PDR0II7QLMkziRxPcaK8WxmsnyFDRcLdR2E+ba4iL3p3PkXe3BUO6igHD/IUCkV/1HBJ90ZftkTH8AfIMAWRQqjMBI7Ywb7mXAOcip6oCn2kvMEWwDNFahuQGOpAuchr7PaqsfMjtxUjaj9fwmXtSQzYXiK6r2FALmk+hBMWV9xGfjvS6Jj+PSdo5lEjtOj7JpqIYJ/IMuL9ai6Qt6l5+/5+BRVDddMkTL/dpHGQjjyboTdPGiusKRKpNZviYjrPrqYq2i8c+sVY+p0BC4FHu1lORKYbRcVeCa5NebGslhTB7rmgI+PaC8s04CTRYYeK5XMB8KKyc7q+MFfUKziZ4+vKsrelhiFhclWRtsUrrqAPR5pNYL+SzIUuhqrV373z9JJAs51hIVEz4WBepR5U0k28RSh9f/atzqKcULIGxcTzds5gL84o/oUFAX9n3DJXnEvQ9YONqv+gMa1xIIGnAlFJX7/FSEAEzbfJbSdTozz1VlszFC9zh91ljFgOBcbhlCgWTLoqYhC7W0eXZ1cx2JgNl69lzIa/r+yjs2uiYZAgZy1QbZhiagBXyOOb7h8xXdyooLiLTszcf1LbdiAdOmc88md05OIdLWbk2IlsHHej
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(7416014)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TG8zTDZDUnZud1h4a2Z1VTBnL1ZjRzlUMFZCTTZXOWJ5dlNYMkxzV0hBQUlp?=
 =?utf-8?B?ZnhpdDYxeEhXZjE3RGdjMXJ1WWtoMk9PSTM0WUJxV290TFplSXZ0Mjk2RnlT?=
 =?utf-8?B?eXdZdzZJVlRkazJwYnlFeDRrN0hyN0l3ODhrVHRHWUVvSDN5RitTVVV0bVFl?=
 =?utf-8?B?N2xpWHIvZzc3cVhqbFpQL245QzgyWUx1aHlSNklMUFVqeUt3Y0xFMkV4cHNP?=
 =?utf-8?B?dFNndWZ4U2dBZDIrV2I0RDMwYkNnNmZhbnJudzRBUC9qc2RIMnU4UjdkZWhB?=
 =?utf-8?B?WGtyQi9yMnByWFV1ZnJSVkFhd2pZNWl0ejdxeGVtQ2U4UGNkRlRqUDc2NGtV?=
 =?utf-8?B?bzNTKzhhR1doNURMZjNtY204a0ptUlRvWGV2VXg3a0Qwa1BmcGloemU4a3Vy?=
 =?utf-8?B?MTNWQTlzcE00Ti9neUZ3aW5zSWUraWRTZk5GaEI4VVZZNWtEbTZlejUxclpQ?=
 =?utf-8?B?UnhtaEszT3JHbVp2SVVLRVI2aUZwTzFyY2Nsbnpwc1dSUjcwVU5CcFlsc1ZK?=
 =?utf-8?B?cjdjdHBvL2liaENqS3pWdmlJUFBpb2FmYndSd2tMckhvSW1Fd0FSclhFWS9Y?=
 =?utf-8?B?Vlg5ZGxQeER5bG5hZUt1dndiQU8rYkw1czlCVHdPQURwb1p2U0dSYnRtRjky?=
 =?utf-8?B?UklDTnVRZlZ3K2VEK0lkUmY1Y09jbTdYemJrUDBzN2llZC9meFdPWnl5RkxS?=
 =?utf-8?B?cnlaWTBkU0Z1aUJRRDJRaGxwMVFFeWJtSzI5UTk5MTFKRzd6bDVRajlORVIw?=
 =?utf-8?B?RkdLc3lUL0wreFdXRU0raG9zOXlDTDNtdDU5SHNZbVlPcEVoUmdXZmw2WU5s?=
 =?utf-8?B?ZGxuTWFQcEJOSzJ0SVI2NnFaWmpoVjhKL2E5TDZsVVc2dDh3eHpkZnozVzhx?=
 =?utf-8?B?c2dsSlZ2eHlKV0hDSXNwRXdrTXZDcXZhK2s3cUJCUWh2MmFvSnIwMHhaMEZh?=
 =?utf-8?B?VUJpVDJ5b0lPamZFdjNRT0VzYXlCR2JwclRld0U5dkJhVHNQTnJCbFJOZmdp?=
 =?utf-8?B?WC9kdU5idWRtd3ZWVFdrVEFiZkRwc2dNVm51bklXMzNLUk1ySkEwaTlRRjBI?=
 =?utf-8?B?NHVjZXVQRG42Uzg0VThSTWlRbXAvWDBPOUh3TjNyTzh5N0laREYzdzVROC9B?=
 =?utf-8?B?THZURlAwa2pMVE9KOEMxcGJSWlFoK1crYjBBWUhyRDlyWTl0bXQ2N0hFMFk1?=
 =?utf-8?B?clNKbXhzRmFEbWc5STA5bTdOU2tZSytVSXJ6MmZLUXJnMzRzM3RnRXhXRVk4?=
 =?utf-8?B?dmhUcFNOWE96dGdKQjVCTk1uZGpycW43UTlFRlVDS3h0aWk4bnNKNnNHZ3F4?=
 =?utf-8?B?YTdBbHRqcUplSFJ5QnJZc2NUWFlqWG16NFc0RVl3WmVKWEZnM0NNb0orSDkv?=
 =?utf-8?B?ZlN1MnRySHhsZ2FmUlBUL2dTMlZzeWFvajVOMTc2bndOTmN2L2dwOUNabnRx?=
 =?utf-8?B?d0Y1cFhrYTJibm1WbzlvOUVHUnJRZW5pdnNYeEl4TWU2ckxzUnNQcHJQQ2FU?=
 =?utf-8?B?c2RWNlNRTm1DcXNjNDJLdEsrbHAveWVWUHRhL1NsdnJ1YVhIWTBaR05icXNE?=
 =?utf-8?B?aXA3UzErQktaRDdyVFF6R2VyM0VhUDJMTkQrUjZPZHUzdDU0czE1TUZXcS9C?=
 =?utf-8?B?MXV6VjZTNVovcXdYcHhhMUxyTDdxMEtUdVFWdHM5dnFWb2tFL2tTeWxsMHgz?=
 =?utf-8?B?UG53SnR2bks0cjBTZTd4VVNvS1l2ajlzUjhhVExaSDdZaEgycXlnSVFTbEdX?=
 =?utf-8?B?SkIrT2RiRjB5UGREQW45a2dnR3ZJMUgxSHlXbndOWWpZZzk4elZkWFI1Szhl?=
 =?utf-8?B?S3A2eEZwRUkvdE9xT3Q2N1hiOGhaZE1rZ3RNVG81bnBWU1lvNEZ1SS96Z1pM?=
 =?utf-8?B?cGIrK0lVT3dlUENsSzV5Qjd2WGJHbDY5RnFKc0QxdHdXNWNneGhwVkpEN2da?=
 =?utf-8?B?YTFPdWxaRXNzVGxLTjJXSmEwSEN0RXhad2hKVkVNR3UreHFCRE1YSkk3WXB6?=
 =?utf-8?B?RloySmxKcFB2djR4cGJaVVNPaTZxcGNVSzRpNVhVd0dRdldSeGJpSU9tQnJ0?=
 =?utf-8?B?UXNZZDhES0I2V2pBdi85NTBjdFkxUVFmT25YNkRqRHFocnJ4bno3eTNVYUN5?=
 =?utf-8?B?RGVxNUt0c2oxWWpYd0FPTVVnY01UVXVaQk5hVjdXKzBsUVp3TVdobkZJSE9k?=
 =?utf-8?B?aEtpWnRHQ1ZkYUNnVFB4UGNPaUJieXZORGs3U1FLNWoybWpHZUxuS3pSODdt?=
 =?utf-8?B?VmdKbGpRbmo5S1VHSGsvR3JSOHA1c3REZUtyVWppUWNxbWFnRmRLbFZPUHQv?=
 =?utf-8?B?dVNvNDlWN3lBVlVMS0NwVGZXamd2RUdzY2Vwa0FNRTFwMjFRb0NtQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0dc29df-ca43-4435-ed43-08de8b0c8424
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 07:51:40.7438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ziq8jTNS8A7GdBZXzu3xGo6wOssSO+zWp1P+Nz3fda2TDPEdrLss0Fv27ZKOi2QN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8413

The clock-frequency property is not implemented. Remove it to clean up the
device tree.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
index 7bcebd702106343bde0f084dec6c38d53a985357..01c11c517986a0642d0fedf79a11889c2bf23ae5 100644
--- a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
@@ -228,7 +228,6 @@ mdio {
 		compatible = "snps,dwmac-mdio";
 		#address-cells = <1>;
 		#size-cells = <0>;
-		clock-frequency = <5000000>;
 
 		ethphy1: ethernet-phy@1 {
 			compatible = "ethernet-phy-ieee802.3-c22";

-- 
2.37.1

