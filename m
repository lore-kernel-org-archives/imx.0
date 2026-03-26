Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013038.outbound.protection.outlook.com [52.101.83.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9948314B8F
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 07:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774511483; cv=fail; b=K67x16Kq4x0bvyWu7mKG5agCWEjzx+LT91/1m6ikKPjgsbvrEcRAncY+SacAlsa+GT5zIogwyphe+ciSEL/Xvs14i/wSSsXXsIScO3mEWEjGOKW0fVGr8F2Bu2EeUHCVdps3LuM77zDshDH/51W0NFd+lQNpqIkmAvQDdrouw0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774511483; c=relaxed/simple;
	bh=VZP/2HhwspoOT99qx+g9n259jC6TBAgP3NKn7QERbTs=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=WRtqKH1VCPN7tmrmGvCq3cUmPNPLhecwJuJ01wRzotybJ/ELbe3GNl95fm2dYrcPB+haE1k4R5899ISD0upZhuw+e0Wjf1B8hPcbgVt6SZAdan/ZGsc3B3EZD98Wta+eKNWAEyD5t+oP/CYEZxBGpkdjYPfz2Kn7grZBALfsg2I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MJIPdLs1; arc=fail smtp.client-ip=52.101.83.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MJIPdLs1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XeWG9zw8xvs9UpbXHrpLc59rda8caieWD8a5zK5IxCjGNBwaTI7CALAdFrrIZH2zaK88OZcoPElWvm7FvP4TdBKPyo1c61EFDZR+opi9uTerIdocNc9yHgqPqpmDdGdbu1VSpMKuoCkLnLLgYZCx0aJdgJJpTKBN+KojnepBej8tSW7qRlI/DmLaLTalzok4bg7JX2jAPCPGWEeOV05hSvECt35SJv8nU8P+jCAbo2xXJrlXLkC4HikPU9a5NS7wxQwD7K4j7JqUYr4JoPw4MdTLZ00nWYkuEWgMowWVJ12kZE6aksYSQ1LyaVWHTqR57Bmul0KsrsRS23CB5IK8Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QBK8KwsIy0F2HoCtnDFyZegZu0RZVNu9ia73vOztE+Q=;
 b=hrGIJF65RW+qIm1Ec5eH1w2vzucMmn4ZdeUVc28WQUYyyWHMNb+ZLZS8I83j36UnGgmQ7++g5JQW0uLtSTNUPARI7yWnaCkdtICqpt7rIGO7kSkyE/albL/7yczg64rORlkkR0wn2khbdAVwMfM909fhF0MF73SeSqK9R9JtbADPT8L3KlSqv/Q0OT5dOpMethvrFLSSgzgulpC5MIX/8OdDSaS6j8LpAvPRvKjHySjWsOyI0kD2ALF9HNVpoTyVpzRuMmw101aSA34K9+J+RhP2dz+E4kO9Et1IvcHbpFVWrxifGiTkwEJ+dLxZM0vXWwXpY4MaOZ/xaYHpiCbsKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QBK8KwsIy0F2HoCtnDFyZegZu0RZVNu9ia73vOztE+Q=;
 b=MJIPdLs1M/rqOt4qPSwoaoWzE+qH3ulUj3V5UMznzRL4Hnk8C8tP8l5IHImtxlMb8/aIOFQ+s9tlLf78OJ6AVnvXmbZJmqmJDCv/8G7M3U59t+F1rsXFMMGj2Mc3fkPGX4agZF5vu/4NaQPufFHIXxs7CKVRmcqPenm7LqOF2YcnyLprow/B/eUrRMA9sCylgEF9DiZEG1iSCpjJmKWOOgfJ9zicrCsV0B6QENunpO3s65nK8a41c7wDa/6yCya2Mp6Uz65wTkucDC/FRPvflAfHAHM93GMhPEY3tfzOw3T/dUGsfr/vGK12exNPhkV/7ddFr67tA4LThQ1l+wjGBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com (2603:10a6:20b:4e9::8)
 by AM9PR04MB8413.eurprd04.prod.outlook.com (2603:10a6:20b:3ec::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 07:51:17 +0000
Received: from AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::1fdb:9c8f:5400:8bdb]) by AS4PR04MB9386.eurprd04.prod.outlook.com
 ([fe80::1fdb:9c8f:5400:8bdb%4]) with mapi id 15.20.9745.019; Thu, 26 Mar 2026
 07:51:17 +0000
From: Joy Zou <joy.zou@nxp.com>
Subject: [PATCH v2 0/5] Add i.MX91 9x9 QSB basic support
Date: Thu, 26 Mar 2026 15:51:36 +0800
Message-Id: <20260326-b4-imx91-qsb-dts-v2-0-b991b81639e6@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIjlxGkC/4WNvQ6CMBRGX4V09pq2oLROvodhKO2t3IEfW9JgC
 O9uYXDU8XzJOd/KIgbCyG7FygImijQOGeSpYLYzwxOBXGYmubzyUmhoK6B+0QJesQU3R7DIlfa
 tVOWlZFmbAnpajuSjydxRnMfwPh6S2NcfsSSAg/ZVbY1RtpbqPizT2Y79Xv6jSURnuXDKeP7Vm
 m3bPrC1zWDlAAAA
X-Change-ID: 20260319-b4-imx91-qsb-dts-ce089fb28353
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
X-MS-Office365-Filtering-Correlation-Id: d5bc9cc0-69d1-4bc1-0ca6-08de8b0c7640
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|7416014|376014|366016|1800799024|18002099003|56012099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	IfBxO8OoO4pnx3Yeiz/5YKfVkMW3goZgPqPW6F8KSGHDvRt5YDx37Cj5FZit9BdHgQbnWwWzOoFdIRzEAnw7kNt0ErImDcpywTzCj6t+vb99oUgS2EQZ6AXe3Vjch9vLQw59kqAHyF7ZSMam8Lj3b4qGzsNLX9sZQVcQcV8jdT1iQYlsNgim4UQF7FqjgQacBxzkKRzthj0KRpzz4fn8+8GFDq/WePS3w3RMRVpOpvtCCqDQr69gK6YxYaeG9BujYwbmFQ7U+ZVLUfqRx33k/LTgto6TOgpkp6bqUia7QKyLqZjOOnwJQJxQpGnrM5hWSY1KuiAzhEAlkYwOm+03wlLm1yQhX73anBFFt3HtL+W/b6x1ZyBwyUlTKmZ78TSzGvMUEJgWG8HRYSimVHt0NlTShRzz6BPsuhUpeSRDCEOGpqmUwYNS2NFvQsqFqK1/H14Qgw9KpXSokRz3jBSKJSKd477S/TJP+tIq0x7W8WSTBqCVzUubI7OCktEuB8s6gddqJdSSPYw0v+yw4co1fG42M2JS4aCM6PUfPEGOv/r0K747ZEDL+kYqqx2lA+nrD4LIHfKBBqQnUOuLMc4m3UrzPaDd6G/8kQiGsXxSFlI3VUy1DtEXm3Ln9t6NQwJGvJ9afw+rCKYeW76ZJq/KnHwUucslSvTkoEpdC1SOfZjXfzBDjShldxthwYqr275Uss87sJTDV6u0ZYpmH29heC8aXR6DHzh5q6yA8D/FZBRbgCljmJZobamy/9LBcNyeiBpcRXqVzkbT7u9FOoX6zP/t8eju/di9OD2S5JuhLACr4l/gYc53bsBjM4HFUqz+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9386.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(7416014)(376014)(366016)(1800799024)(18002099003)(56012099003)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGdISVRUNzZ2U2huMUxoQUNhK1Y2MEVRb0xCMVVYWFBkMTh0M1ZtOFF6UUtj?=
 =?utf-8?B?ekhkZTlkdXRGVHFGNC90TFIwSnJzNnh4ck5OendoaXhyblVKOE1menpvcDVM?=
 =?utf-8?B?UXA5Rk1lYjVBOVhrd0p2TmpmNE82dzY5V1hDTUZ6MEJWMDYyVEptRy8wMGFM?=
 =?utf-8?B?WldmOFA1N1E5aGxtRCtScnl4OVVlTmhKd0JFZU5GanBmRjRaeHpOWUkzNTVY?=
 =?utf-8?B?RG4wWWpISEhDZDRrMDF0bkx2ZExzYUh2M0xqOGJ4OTB4UXZDZmYrQ0J5ajIw?=
 =?utf-8?B?eW5wc3Z5azFneTNyemx2R283VzdXMWZyMzM3Si9lNXhCbVNIODVOaFFVamI2?=
 =?utf-8?B?c0VPejROS09iZmhZSjRjd3NvbDNIcEFvYXU2T2FwWHI3UkI0TFNWVXc2eEFa?=
 =?utf-8?B?T3grTFR5bStwc0tJNUxpa1ZTZEpWLzNGSkxXRk1ZOWExdGtGb2dQUXBoUndZ?=
 =?utf-8?B?YW44TXpnSlZBWmRpanpiWTRsMy9taWtmSjlKSnlZUWhsbW1JZEp1cE9VQ21I?=
 =?utf-8?B?V1pNOG5RWitRMGhQYnpqdENyUDBTMThRVnZic1JQc2dvMldSeDVSVEpWeDVm?=
 =?utf-8?B?V3hmQWRvdlMrUmpSdUlGaFV3R1ljNHA5OXhiNUJiZnVhK0h0cmVOanNuK1o3?=
 =?utf-8?B?RTJrQWVFeXA5YnF5bFd3UnB3VHNmNGE2Zngxc21aRzl5a0h4MmNkemVDbVcx?=
 =?utf-8?B?a1ZXejd2Q0sxcVBCVjhJbGJuUFhOcGlRMGZWUnJVMmJHVTFWc21NM3k4dEdy?=
 =?utf-8?B?RWNDak5FNlVJK3hoclhTTEZLeXQrRU1GWjhGUnR2K2NkOVdjNFRZZkk2dVZ6?=
 =?utf-8?B?ZlU0REdlVjBKR1pyR3hOZVpEak0xMmd2elQwZk9EMU5FT2FaOFpmbUR6aFpR?=
 =?utf-8?B?d3NncElKbmhkRWZrbmNmc0MvR0FIOG1KTFYxZjVxNXo5ZEtVUTFBTlpQaytY?=
 =?utf-8?B?czZsdkNqd1V3MFREWFlaTmtrU253d1YxV3pTMnZNdzJ0dmpFMk4wbFNtYnlm?=
 =?utf-8?B?M0VwMHBHcjBXcE93ZmZaZHhjMi9ncGlYTXpLUnBkcmcwUUxIWnRGWm5PZld2?=
 =?utf-8?B?U2VYMzFMS0MvbzdKbDZUbXhGZ0VYdVNPTy85NGhLSnlXcERhSkRMNVRUVTdM?=
 =?utf-8?B?Rzh4RHlhUVpteVZHQjlNZU53ZlJqL2xDa1RreE83d1cxcjE5Y240c05XaTcv?=
 =?utf-8?B?RTUvWjBIYy90aGdpcmJtTUJ2NGZpMHVqQjFYejBhcnRDb0lwN3g5S3RCVXpZ?=
 =?utf-8?B?WDI0QlZCWWdmQ0JQeXVONkZtQUNwUVQxNWNQLzBQMHdIeHdzWDlraTBpM1dt?=
 =?utf-8?B?QnRFRmdaMVZTZFljYXJ6UjlBbjAreTFNL0s5K3BNMktFQjJZaW5PeVZmSkFa?=
 =?utf-8?B?TEQ4VUg4YTRZV1huNkhUNXAzVGxsbmhTcVAvdUpTb3BWb0xySC85c1JWSzRT?=
 =?utf-8?B?cTVBSVQ5VkllMjJnT3k1ZXdKVlpac3IydlZod0ZXbk5hNE9RcUdqNnBmaXRn?=
 =?utf-8?B?TERPd0VseitybTFWbEhKUWlRZ3gzblcrcFdGNEJmRzA5RDFNRHR0RjZXWVd4?=
 =?utf-8?B?V1pKMVdZaHpvQmFoeThSWUkzMk1JTmdlUjJCdjNWaUp0OVY3dGprelU4bTNM?=
 =?utf-8?B?MFZxVVV5b3I4RlZyS1BwRzNpaXcrQjFFNlRFbXVjZlFhMXNoakhmMzFRNnZx?=
 =?utf-8?B?MFBXTlhDS1hVbURZNzUya1R3aGhQRXFIWDRiS0paanlFSDFWUUJnSk9CODhv?=
 =?utf-8?B?VFE0SHc4eWNIYXNpMjRqTHliVm1qM0FIa1BuYzZZSDRSc0hLbTV6MGpZQlBz?=
 =?utf-8?B?RlpESmkraHlpL0xvKzRiVW5iYU9hanFrYVdNSVMwTElKWnFjS0pMYldHbWtv?=
 =?utf-8?B?aGZRTmZCK1RaVVlPRml0V3M2N0JsYTF4T3AwV3lIYWlVWkFTU0hYclNlZGtt?=
 =?utf-8?B?Tk5BTHh6QkUyWG1IRWVESERaOUtXbXZjNVZzWjZmQmpDWUh4emJ2UnZHNEJF?=
 =?utf-8?B?eHZnU1hhQld3S1c4aWc5dENNMkNFbkF0TVgydHB4SXBUakFBVkhZWU1VaS9S?=
 =?utf-8?B?SVFTWEh3Ny92Um5uMXdEaDgyZVMzRkFoL2lzak80b3c2Sm9GcWRDWTN4YjVH?=
 =?utf-8?B?cmFZc255N3kxeXpLaHlRalJvNzFZTWhCWk83dHRxUi8wYkJwdEJxMHQ2a1NM?=
 =?utf-8?B?KzliamQwNFcweC9IUkFBVGxnNFpua1ZPSnBJbGdNQ2p1SjlEOHE0RkZETTNX?=
 =?utf-8?B?aHo0S1VsZmlieDhoRDMrcndBV3czNzgwcXhiZjVybXZpTElmNXU5ZGM4VnUw?=
 =?utf-8?B?RGhMWklRNXN3UW1pWnIzVVQrVlZIUVh4bjB0UXE3aFdBcUFtNUk2Zz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5bc9cc0-69d1-4bc1-0ca6-08de8b0c7640
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9386.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 07:51:17.4548
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +HplfnXAjVgaLE8oSZGcrGJr5XaT4K/Gd89KdC2zHFt/mnbvDSNZW8Q09SgK/GWn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8413

Add i.MX91 9x9 QSB basic support.

Signed-off-by: Joy Zou <joy.zou@nxp.com>
---
Changes in v2:
- Add three new patches to remove the clock-frequency property from mdio node.
- Remove the clock-frequency property from mdio node for patch #5.
- Correct GPIO pin number typo: <&gpio3 00 GPIO_ACTIVE_LOW> to <&gpio3 0 GPIO_ACTIVE_LOW> for patch #5.
- Add whitespace before brace in BUCK4 node for patch #5.
- Remove one level of indentation for rtc node for patch #5.
- Add Acked-by and Reviewed-by tag for patch #1.
- Add Reviewed-by tag for patch #5.
- Link to v1: https://lore.kernel.org/r/20260319-b4-imx91-qsb-dts-v1-0-2eedc01d8af0@nxp.com

---
Joy Zou (5):
      dt-bindings: arm: fsl: add i.MX91 9x9 QSB board
      arm64: dts: imx91-11x11-evk: remove unused property clock-frequency from mdio node
      arm64: dts: imx93-11x11-evk: remove unused property clock-frequency from mdio node
      arm64: dts: imx93-9x9-qsb: remove unused property clock-frequency from mdio node
      arm64: dts: freescale: add i.MX91 9x9 QSB basic support

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts  |   1 -
 arch/arm64/boot/dts/freescale/imx91-9x9-qsb.dts    | 425 +++++++++++++++++++++
 .../boot/dts/freescale/imx93-11x11-evk-common.dtsi |   1 -
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts    |   1 -
 6 files changed, 427 insertions(+), 3 deletions(-)
---
base-commit: 8e42d2514a7e8eb8d740d0ba82339dd6c0b6463f
change-id: 20260319-b4-imx91-qsb-dts-ce089fb28353

Best regards,
-- 
Joy Zou <joy.zou@nxp.com>

