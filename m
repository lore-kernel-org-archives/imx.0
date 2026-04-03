Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013064.outbound.protection.outlook.com [40.107.162.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8AF39B4B9
	for <imx@lists.linux.dev>; Fri,  3 Apr 2026 09:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775210149; cv=fail; b=Ys8nMDpMMyo3gBp45sZAI+QKHhDmXgh/WaVwLnlEVMQrh8wrAxoTamU/VRIHZUZRzvb8DJVFGUks7ercuvisUmj2jNl3Xqpvs35AfEKELAhiZV/DMA15tWT8+uCLBVI3fWQdSdOB3hwYPmnwPKsQFySzykks+dOWfJoesIKmbxo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775210149; c=relaxed/simple;
	bh=fk7mOiZDd12YrvvTgozha2uxavh8OzfKPgHa4zTCk0Q=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=RAmfN5v0bIoNOqj+DnScksi3oBYkSU9xwT8X8M6CHvg7npdA5yRzCkNezvMc5QlRpy7HeeQWZiBrrl+SAKJ8zcDM2QhEOZExQUlFj7vz1Opx6i08tXsqv+sJEXWg8mOKPEo+3KX1TV6P5qffYeSv473BHwqAtmj8WPg+74D/xXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jjy5HcW6; arc=fail smtp.client-ip=40.107.162.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jjy5HcW6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bHNhrD96FwTXrbPoz2/mC6Id6HGhm41VvomTgI8++ekphhMseeSWyFsx/gbBwIVkoRrZ6EpSDk1HO8yEaPZL5NuCk4cfhS/fe5GHmX25HjMwQPn15oj4XyTQA4DLdJmq940RGL5/boLBPnntejddi0fapNwL0ZLF1KhshNVnZ8fDH/DeE6dsLCeFXeFOj+9lY7K9qwjUsFF3GZlDBDlDDT+9Dtf5Cdc2RbQYmsUBpqa+cesd4LWylijm6tOBcPJnDijcDZq2olwOAAS3in+W8U/8/1VXLD6P7iIJWqDk7fGcz7U7bhyApGHkH/bke3NGw5q3RmXkXr4/M1e8wq0fzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSvBjCP99wpq+tmPYINsRMCXz9AmIBdr+rFaVRaEBfY=;
 b=Urn34a3EYC/7YaLfEAJgScQq36LWsS5AL57lw0sTqaaL5YYrYUUfChIxr3TBu7jPvkBopaPiVb7l57awfqH+yHD2qEq14p9CJApe4Ed79o5Nnw4fw8k0Xv8tJtX3zBMa37MdLQIhhAYTVsDHEQjYtQgZ8fOJ7O3vajymheG3YsqNTF2tCO8W1gJBKNLktf81KEx0CUyLb+SX1FvszbaM4L4Sz3pLtNXYPay1AdKG7IxNJEzrOBYEd2Wbw8YgKLfYIw0ZoUq/tN2taOjTqJGVHjY1myZ/C0svaxOLR0HKz5G4PUbh9+pihUahZ/+QJbYK0/AsVqXMZ+ebPcGfthnTKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSvBjCP99wpq+tmPYINsRMCXz9AmIBdr+rFaVRaEBfY=;
 b=jjy5HcW6BDXeV/hab07bjwUWLv66j6G+WBmJXiK26Ft/N1XW9crNbCU+l12EDGrNRF4vzePflo76EsEpFD3iajevZdhdzg80uyWSeUeAXW4/pVeeI+LCnFavFmfD6JsQ9oVPfYeelkJdjYaycYizEFLYmYKJN1oSz0V1ldwn6pE5EG8Jt1humtDToHcRKlng48fMQZwRnoDg2BmIt0+3YUNIXvxwCdp95hfGSdd7GC8Bbo+K1IOO/wJcbeijZBMGGYBNWoLmsCLbHooTiJYDVvl975lA7wfcrZO7jkcTI4zde0z5rJyTrEDCBhq3d7kOqixE5e4lNxZhve62Vy9mNQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV4PR04MB11972.eurprd04.prod.outlook.com (2603:10a6:150:2e9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Fri, 3 Apr
 2026 09:55:36 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Fri, 3 Apr 2026
 09:55:36 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 03 Apr 2026 17:57:01 +0800
Subject: [PATCH v2 1/2] Revert "arm64: dts: imx8mm-kontron: Add support for
 reading SD_VSEL signal"
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-imx8m-ldo5-v2-1-53bb33d6b810@nxp.com>
References: <20260403-imx8m-ldo5-v2-0-53bb33d6b810@nxp.com>
In-Reply-To: <20260403-imx8m-ldo5-v2-0-53bb33d6b810@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: MA5P287CA0086.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d8::18) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV4PR04MB11972:EE_
X-MS-Office365-Filtering-Correlation-Id: e3d3c004-63af-4d7a-3280-08de91672763
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|19092799006|52116014|376014|56012099003|18002099003|38350700014|22082099003;
X-Microsoft-Antispam-Message-Info:
	Z2Eu+fTFDEVSyJVIqwA75dJzVR7ds8C+iPsAWm8tu0eeLPQF0aANdzrsjVFhljr+kXiEyFwDoCrbphloM+CKG15orA2zjFQdaSR0GO5aUlr3zGWt3XuGC29pwPe8b4ifb0x510rZJrSoI4wmePLj9ndidAq5e7ESAU7hYR48NBJhH0AtmFprRSLr0kV2J/N/HWCwqPfR32qc/6zVnDPjtXdK9fq9V3S/7DgbNX+DuX6+9+Qu6KITGJYV5lNIZ+39l1cftuqfKAFguDnlPSzE81JipAESzOj6jQRQ18VWSLOroBpcoIhrKM0uVT8QF2TVtoEhi3kdp0jnUis3DP1mD0TPqB1+iWzySbT0d1RjVJdEr+ekm1YVr+N78SpEKfLedIEafdOV994oN3bWSPAPmTUw+XKsO3R0TQoaVj4GHoCa95LMHGQ1FYj77m58m0bg5jdt/Z/cAymQdZOZTJnxB7+JI3onWoMVWMvLSJXhSGNa4omZm52tz5ZyjZkMgChX4PAiX+aNZRXl2D0iXEQCtuABuWe9grwxN+Ou8l3BB1Cz0QALxKvV3uQovXSVbm2xee4//Q+uU+3ILKN6dmeKyz1UIX8OUg+F+MBYYz/pp0Jhx6Vtkr9dk42or+Ak0qtih+hRWsRmJJAhXK246IoEIsElyKbsi2jbLZH7zx0mBXBzu2R7BG8Arge00m8qGtX+6lC1mw+uISMvS2CvaEpRjz9NezAuaKiCFXJFNxi9gaOBGdnRCF4YjJA/6/Mse0W5Mqp23CnXLz1iIyuJs/EHnwv4J/1KJ9zRh40yEQQstg8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(19092799006)(52116014)(376014)(56012099003)(18002099003)(38350700014)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnhtQ1JEbnBXMHdTNXduNDY3Y0FJc2NsNkVpWEdSZjJzS2FHRkVOWE1kNkhH?=
 =?utf-8?B?TVpieER1dE9Sa1ZEeWhQZzd4bE9ZVUVzRWdDVkdrTmtkb2paOHhwTEtwM2xq?=
 =?utf-8?B?R25Xb2tYVUtQTE9OcDlob3VldVhUK1JXWU8wRFUzazZqTlRWdm5hVE8wbWRs?=
 =?utf-8?B?cWVhb0xCNmhBVjI0UTdaR1E1em9GUE9qalh1Q3c0cmxLMTlLclM5bXNaMS84?=
 =?utf-8?B?U2VGZUMzQjFuclZUUmdJSEVvRndHZjNUaFVoQzNkc3FOdmVBSUh4clhseGZa?=
 =?utf-8?B?VjdyZjdXUUJhZDkwVlp3MG0rMUdwQURTZitSOW1xMVprTGlDSFFlTzFNV09P?=
 =?utf-8?B?WnBzaTMyUnNIMXgvY3E1a3RiNXU5eU9KamhKOEJoZ3ZyRHRpanQxWHBkVkNR?=
 =?utf-8?B?K1VXM2lHRjdNK3BsenhUUWR1OTE3blFxSzFHTzQ4Q1Y3WlZsNzdQT3pxb0NY?=
 =?utf-8?B?ODhYS3B5N0g4ZHBwUlV5VWFIN1ZabmlJK1BHOW1GbGRYM3YrYklFazNnTlNR?=
 =?utf-8?B?b2trY3g2RnNZenJaeU13WmJtaGdVaWQ5b2FERVFqcEJPOHJYZE9NQzZHUmJC?=
 =?utf-8?B?V3ptNWNDMFZydVB5emQ0WDJJcUpMVk5mOGFFd3RvZ2g2eVpQeENOVHhjeXgx?=
 =?utf-8?B?Q216UHBrait2WktCL3FIYTNmSmJPSCtsM1Q2OXpnSE9rYmxqaWhGck1QVllU?=
 =?utf-8?B?UEYyVEE5Z2RXaFVTazZDZUpkancyeEF2WWUzVUlYVno1LzlqUysrcmJpN0JH?=
 =?utf-8?B?ZGFCQWREeFB1UEhtcU84WUdNUUwzbXNvMWtFUU1jRGZqOTBiRlRKckprWDJw?=
 =?utf-8?B?NXJHZHpEZDZ4WDhkMWVSMCtKdEVpL2xHZTAreC8yTmx2Zy84L2VHYWM4S2dH?=
 =?utf-8?B?T29qNDBERVpRalYydUdBTjRtai91bHJyOUJJd3o2eU1PbWJZcVpkbWpreDll?=
 =?utf-8?B?ZlVaK1VCWDhsd05kTDhuV3Bwb3ovK2k5RnNtZmJQWGNJdUJrYXc4RTU4ZEhh?=
 =?utf-8?B?aVV6Z2JTcmtoNHc4UHZpcEJGSUVjb25McGwxaFA5WERjK1N3b3pCMU10S3hR?=
 =?utf-8?B?c1Z0VXRVUFh6L0w1YjFUVWc3TENzbzZlTnAwcStnci8xNHhaUm5xSUk1VjZp?=
 =?utf-8?B?VXRUN3BWNXF1clJCNm1mc2EwZmdyNzJFTEU1OWREMlovdFJkaVhzU2tJVXBk?=
 =?utf-8?B?aS9PZXJiczJOaFVGZmtiWW05N3hwYURFN0JhTXhyQldxVTRuNTdKdm8zcnNk?=
 =?utf-8?B?MFJrVFQ4MDYzVjVienFZNTlEUHk4YnFjK0FPYjdqYUY0YURsVXlkRHl0b3l2?=
 =?utf-8?B?NnFGZmFQeW5jUDNOd1hUZGFvVXJXMlB0YS9xbW5HZzk3R1pxWE9VdDAyMmlU?=
 =?utf-8?B?aCs3WmpMRkV3dmtKNU1zRHdJcVpwSUtvODA3REFkWTQyMktnNW1KS2grL3ZK?=
 =?utf-8?B?WlJLcnRXdUttaFJmNWdTS3FsUEY2WHc4M21aclA0c0V6QW9ocGJXczBUczgy?=
 =?utf-8?B?ZEl6LzcrS1Urayt6Tnl0MWxxQmhBMmpReUFSNU9vZ3F4d2pvVllja2RGRmJt?=
 =?utf-8?B?ejUyZEgxMUdEQjJiQ0tLNXJ0eHFWYUkyYVhrTlUvU0lqODAzb3NxQTliS0sw?=
 =?utf-8?B?cEluN1I4V2tYdnZsTytvdHQvVjl3d0JhNGw5QmZRbWQ3UXllbjFUOGdmR29j?=
 =?utf-8?B?VHJoRHYyTDQzdFhxakJoUVZpbmJQdFFvc3VoTXhTS3FCRE5OOG1UVU43K3dr?=
 =?utf-8?B?SElrVjBaM0xud25jL3BERFkzZkQ3SnQ1THJVZHNveDBVUC85MkU3NGNubGRR?=
 =?utf-8?B?Tk9jNWFOaitpb2xKbDFWRElab0QyUFFCaEdzNi94cUNvVElFZUU1eStEWW9r?=
 =?utf-8?B?WlYyS2JGdmFYY0Q5blJnMHdodDNsUy9oV0JCTkY4TmRSdHY5STdTSUtuamhR?=
 =?utf-8?B?cE5mZ09qL1d6b1V1M0sxbFJ2RUFOUW1BYks1QWxRSmZiVnBGeDBISFRvUjdK?=
 =?utf-8?B?UXlzN2lxcXEwSTZzakZLN2c3elFtY0VmVERGZi9TViswem9qamV5Y1kxVzFG?=
 =?utf-8?B?R0pra1E0V3RTbnRJeDZISHJGeXdWNEhocjlrVmcvV25JcUFFQmRNalhZN3hx?=
 =?utf-8?B?d09IeTA1OFdGa2FRcEorOVRkS1c3Vk52Y3JyRk1nejRZenF3WTNVWjdKNmJG?=
 =?utf-8?B?NWh2YlN5OE5Na3lGSzJOWGt6QWFBTTVSU3NreTd6QnBLbVhUQlpzbE5FLzVM?=
 =?utf-8?B?RFRzVmszemgwTFdGMWw5ZGtKNERMTjYyTGw3eTMxZEdRMVNjMndxb25GWDJh?=
 =?utf-8?B?aU1EQXgrOG40OTFrM2ZlYUIzNktxUWIwOFo4UVU4MVJtb0tIM21uZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3d3c004-63af-4d7a-3280-08de91672763
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 09:55:36.3367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zwAcloKcM5+v3IiXgxfADKP1IddttIpfWEVkVuJMNpC4vRnGfzyKvAyCoXY7Rf9wHAtHL4fDpaVsbyfhqpFx2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11972

From: Peng Fan <peng.fan@nxp.com>

This reverts commit 8472751c4d96b558d60d0f6aede6b24b64bcb3c9.

The board uses SDHC VSELECT to automatically switch between 1.8v and
3.3v. It does not use GPIO to control the PMIC SD_VSEL signal.
The original commit intends to read back SD_VSEL value from GPIO,
but it is wrong. When MUX is configured as SDHC VSELECT, it is
impossible to read back the value from GPIO controller. Setting SION
could only enable the input path for the mux function. It could not
redirect the input to GPIO.

And value "0x40000d0" is wrong, SION is BIT30, not BIT26.

Fixes: 8472751c4d96b ("arm64: dts: imx8mm-kontron: Add support for reading SD_VSEL signal")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts     | 10 +++-------
 arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi |  7 +++----
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
index e756fe5db56b6a19c309fcbb94475629e5f2b2a0..dd59af0ebaae55ede743d4187b1165041d655cf2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
@@ -254,10 +254,6 @@ &pwm2 {
 	status = "okay";
 };
 
-&reg_nvcc_sd {
-	sd-vsel-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
-};
-
 &uart1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_uart1>;
@@ -466,7 +462,7 @@ MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d0
 			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d0
 			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d0
 			MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12		0x19
-			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x40000d0
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0xd0
 		>;
 	};
 
@@ -479,7 +475,7 @@ MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d4
 			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d4
 			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4
 			MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12		0x19
-			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x40000d0
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0xd0
 		>;
 	};
 
@@ -492,7 +488,7 @@ MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d6
 			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d6
 			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d6
 			MX8MM_IOMUXC_SD2_CD_B_GPIO2_IO12		0x19
-			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x40000d0
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0xd0
 		>;
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
index 96987910609f1b0083f5ae0c957f0baf10bfa826..4fb13d8ecfd45a8587e169b7d0a08e811745b5a9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-osm-s.dtsi
@@ -342,7 +342,6 @@ reg_nvcc_sd: LDO5 {
 				regulator-name = "NVCC_SD (LDO5)";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <3300000>;
-				sd-vsel-gpios = <&gpio1 4 GPIO_ACTIVE_HIGH>;
 			};
 		};
 	};
@@ -795,7 +794,7 @@ MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d0 /* SDIO_A_D1 */
 			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d0 /* SDIO_A_D2 */
 			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d0 /* SDIO_A_D3 */
 			MX8MM_IOMUXC_SD2_WP_USDHC2_WP			0x400000d6 /* SDIO_A_WP */
-			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x40000090
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x90
 		>;
 	};
 
@@ -808,7 +807,7 @@ MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d4 /* SDIO_A_D1 */
 			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d4 /* SDIO_A_D2 */
 			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d4 /* SDIO_A_D3 */
 			MX8MM_IOMUXC_SD2_WP_USDHC2_WP			0x400000d6 /* SDIO_A_WP */
-			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x40000090
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x90
 		>;
 	};
 
@@ -821,7 +820,7 @@ MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1		0x1d6 /* SDIO_A_D1 */
 			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2		0x1d6 /* SDIO_A_D2 */
 			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3		0x1d6 /* SDIO_A_D3 */
 			MX8MM_IOMUXC_SD2_WP_USDHC2_WP			0x400000d6 /* SDIO_A_WP */
-			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x40000090
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT		0x90
 		>;
 	};
 

-- 
2.37.1

