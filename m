Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011035.outbound.protection.outlook.com [40.107.130.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B97D3262A6
	for <imx@lists.linux.dev>; Wed,  1 Apr 2026 02:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775009031; cv=fail; b=Hk0vhyg4JgYpyLNXgsm8qYhr3HTDPWUqIFeog1mixY7512uhhbK4Gc8H7kEJeK/3s4rHNuPDPaqhaJYs24hIN9xieBjyt4CLxFtRGD2fJ4og16jmqwtRJ9QAWi8jVThpoyhmOB6pY3CILk349QcR5neN+9aix9PSm3zXF0KPGAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775009031; c=relaxed/simple;
	bh=NqOYgFgdEcawAb09wIKNozfYuWo5UffzbYz6feqONSE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Q8aErzcOrR7Qi4tzwSePqH6DQhWlXesiAYPXhFuhHSAqUfEO6YsWj57qdEmis6IOpYZSq1HymToxXX9w037Cpee0DM5R1wkrSSLsfaw+A4zHKxYdtXY1A8YSnWeC1VxXQo7iq2uOoMZI+T63mdntSXm8vxJjR18rI2RpP7nR/P8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=rq3LrzKC; arc=fail smtp.client-ip=40.107.130.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rq3LrzKC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l+1FvSzJ7nuWCtAOFBDKW+T83jOvcQLSEluQ32JfB00SQIyr1eeI6XYm829isPabQiTW/wO7/Z8XasaabyVuqirdzzzna4gnt+eyHUfu0mQ+GLxs4X3Tyz7YmUZchZopjiOpLy8ERh2bgTv3+KOaXPKQt/tcQs5kYPTP3PRH1HDkfWfuUjsgyFTlp8dNOkDYX9X4ThEFKUIuq7fbOS69HTgPdePve1PdtHRm3W6PpfmeimPNkLi0W2bbjQE1fYD0C35xc2RfYJWHIHj77pgOCDL1+3z6Kzm4cROMzqdaTce7oHYXAJv8Ece72EASeQz14Qfunxamf7ZSWKrabQJwUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u/whkIVqSjcYrWG36XEVO3QSEm8zVwKeP/lONBFOIHg=;
 b=rf66GMYFZ/RsN6BlxGZ/wjOj4cRJ9jzChdlnPRBDB2Q18Tld8lAZIUFEJbZZfcWpqhPb5MZ1mtiqW7WLnnLUnr1AcyapiMnIzZB7jXTTtmLIvyxB6tqbQhafn6QdQZ0oJ8xLI38GCsUaAcZOHRLetjBKLPrnmgjfFw15nBkuLdAOn4KL5Zz8ZKRoUwMtvnb5/3IUjvdCcJSv53xK4i0PyVHEKqnQ6QfIFgiv6y3julaPzGSUKAn4H5zdVh5BV4unqAHhWhqfgLVK9XGC68YXp0z7saP01X4exWqUdi15o2f6VGpNXi5d85qnAI2J25zdq1z+FROSznt3nixMTbhKIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/whkIVqSjcYrWG36XEVO3QSEm8zVwKeP/lONBFOIHg=;
 b=rq3LrzKC4x5+AQYvHLEiM9gDKnVLGj9QmoO4nc8PVjKiXTbVJaiVskIj3uMuKtoFVbPukkYpqSZoYMDaUiEmTI92/RPKTAHAmrNFs7TKPdsV9ZErZwoMV280mam9iUE6OkwedgmO+N/MWbZbEAkLtMc7qgE+JcVjXzBTWg4TyV6TsyeyBIRHJgbtbKWfqOWbyLjM3j6dsFJip3KbbBtWzzPHBKY0R+byH8lzRMiHsfT0JBFi7+7gbqdWc0vSx5b2zndR4LexeT2fGUyqX4MEtWopgO8KnDWAAKYg1uQyEt61VPgjPIjqSqnJ43tneI2lmUzpybRSXAnC9kBaOsD+LA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB10762.eurprd04.prod.outlook.com (2603:10a6:800:26e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Wed, 1 Apr
 2026 02:03:46 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%3]) with mapi id 15.20.9723.030; Wed, 1 Apr 2026
 02:03:13 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 01 Apr 2026 10:05:08 +0800
Subject: [PATCH 1/2] Revert "arm64: dts: imx8mm-kontron: Add support for
 reading SD_VSEL signal"
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-imx8m-ldo5-v1-1-1b1c1381babd@nxp.com>
References: <20260401-imx8m-ldo5-v1-0-1b1c1381babd@nxp.com>
In-Reply-To: <20260401-imx8m-ldo5-v1-0-1b1c1381babd@nxp.com>
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
X-ClientProxiedBy: MA5P287CA0167.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::14) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI2PR04MB10762:EE_
X-MS-Office365-Filtering-Correlation-Id: c17ff75f-8858-4f7c-bd63-08de8f92d4d0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|19092799006|366016|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	SC/JdoBKhTLKIyUik9tu8rY3s/UrA2tEGi+atbX/kfGwBFlxiMlRJJu60zNJO3oew0T5sh/uy7/GeYDk5BidlEt2fSRqNLWBNYz/aOVyqhLJXZmR3CfZu+tvG+Y49JtW2kpedqYnmqnLTLtFj2y+fss2dhh02hdpkMmURzRjnBmRJ4dyw3al5CaQkxFHtusTh2MiM3uc98JGEN7CtQZLtmB3/FSkazpR+jMw2f8Dlv24Ig7RdE7uo/KRASl9ASWDZ3LL9S9kDAVVotIH537CGPwi19mtx8PyDs3PEuVULWujs9ahG8TiUM4EcCWESXlzg+K1y1vCNxZ3X8LT6txhZcYSn+Cu2hQfcfcqzOZBP7DNBH3J5OzzYl1lpoiYxzOdZl6RQTB9uwZSv9zR1DkaMwCSuFvZQO9HYJ4oslDGFYWPy7xvv7lQ6iZ/0JR2V1fhWdsSP5s54YUIN9Fpdy+wXVR4/sz7n8Ca9DhQK390KkkyvQ8kgqaplrAtXrdQIaxj/qGyCHCGng9JhxFbKUj9qwUEkjR44/H0Skd3qk/JTvr0FDOlRE165CHIptV93Z+BKCl+InI0YcpLCOMMGCvgXGWO849oxUpOMq1c2kLqDYa9oqKGEJfpJJ7inIPuPfVJNK8MxtsctbtAhE9esk+u8NSI3MXK5GOeDUZdPhTD/wrW+TMIKkBF2QFPaIQOcfV0CfDx+vH/B9dgIvm4VDgYiYFaKea32bWkWbJRxKWGFVW0EK7pQU2keWf6fEuIO8cq9fQD00D62RJ1WrmifBNFTPShNHluAkQePt5k1Bj+7qY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(19092799006)(366016)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UXNQTy94OTFoMFhBU2hGdTJ4SyttdnhVYndockR1MEM4VXl3aE12cnJ6VjVP?=
 =?utf-8?B?UTk2UnkydENOM25wbmFjdHJQSms4akQ5YzhjN25MZzNnbVA5VFVqdllhSkVF?=
 =?utf-8?B?VDArMTdKRlRHUi9vdExSQnBRdGlwZzR5a3llNlozTHJlQ2tmeFhJUmNoQXk5?=
 =?utf-8?B?RDgrZXlQQTJIOU4xRnpJNkhCUGhVcjNHSUkwMlNXWFpTN1oxaXV1ckRCK2NY?=
 =?utf-8?B?a3htcjBLU0VkNUNtRGVaNEoydE8wcnlvRUVPYVhnR2g4Sm12RlBrTFczR2x3?=
 =?utf-8?B?dE1jU3dQN1o3eTFLc1FuOStLT2RKclF5YTRENThMY1lXL2ZvUVNVcDlDc1Bv?=
 =?utf-8?B?ZHVFMWhNTWRrYnBjSVhJZml4R1I4cGQ5OUxvN25hekR1YTJVS2xNK25jQ1VQ?=
 =?utf-8?B?a2ExL09tdGZjYmlqNFpXdnZRM05INzJWYWxROG5mZEZ5clh6QThkWDFBQnhX?=
 =?utf-8?B?emlGOElHVG0wSWVoWDNIUkZzMXZORURGM01yZ0FpTTA1Tk50NExXdm4zRWJt?=
 =?utf-8?B?RVpOSlRNRzVTYTdacVdhUjl1L0o2ZkpLR3FwSmorU1FQWmlCSWhWSzVNNmtO?=
 =?utf-8?B?RU41RzVZQmNJdFV0NU5BS2JpNjdZVTNGSm40NlBlNThrMGkrbkE3dXlSTWJ4?=
 =?utf-8?B?V3Z6U0NjcVpKeFhPQTVmelVwVDY0aEVTNnBBaUxUZUt0MHFJUlRaTEljR3BJ?=
 =?utf-8?B?RUF1UWFLQ0FGbEMzWWVFWWU1ZFNSVUVkMFYxZlpQUGdHUGd6Tm4rRkJzY0pP?=
 =?utf-8?B?UkxlVGlFN09zekFFME54dCt1YlVxNDZtV3FOSFpIZzhuOFJISEpzWjN5TWxX?=
 =?utf-8?B?RWd2a1pBRkl2ZkJNMmtxYVJndE9MWDhjN082TXBwaFZ3UWY2WXlkc0lNYWdj?=
 =?utf-8?B?ZTM4bDNwSHgrNTN6TnFhTjBZc2lkL3VtNllTa0ZUSEhNR0YwUFlwMHp3TVJD?=
 =?utf-8?B?RlRDYmxGR0dJMUtXdjBTS00yUmEvZU52OExRa2RIZitNQmJnb3pPdDhtYTFQ?=
 =?utf-8?B?Unh2aSs5S2F3MnVKN21qankwYUkrY1o1VFRBRzd2NVhlckRTRjVPYUFEMFlE?=
 =?utf-8?B?dmR6VWpZZGlMMXFCRW9PdlhpOE1PSjQ1aDQ4M3RvSG0vZy9Bd0hSTkQ5YVF2?=
 =?utf-8?B?dU1rZzR6eG1xdkNjeGhhb2pWcmhNNEM2M1B4NGRoOEpJbS9rTjVURjdSRE9n?=
 =?utf-8?B?STJrTEpENzVNSW1YdGZHSXUxWnQ4N2VrVy9hYVJ2RTY3MHlrdVEzdWhPdzlw?=
 =?utf-8?B?T3FoSWdjVGtCb25kT2xwdk1yc0dZV0FtNWc3U09KU24zUlRVSmdOYTlUTXNm?=
 =?utf-8?B?Q0tPci84dVZGTWNrSEU0eDVVQXlMN05wRmtSc1ZDK0RFcTBMYlp0RXZOZmVr?=
 =?utf-8?B?K2xmVzNKemNENmZISlViQzVIaWorTkp6Zk1OWDU3TG9hTkpGbDFhT2pmbUdE?=
 =?utf-8?B?c3hLb1RMblVXaEFoT05wdnozSGYzM2hXL2pXMFF2enZWTGJVZEhEdnNYN0Ni?=
 =?utf-8?B?MS9JMlpJWVhiVUlROTJ4ejlKYXpycTRnRVhMb01SSkR0eFNYeCthYklMdEd1?=
 =?utf-8?B?dWRSbG9zNk1VdXlDM0hPZnlpY3cyN2ZmOG5vQXBEdXFzNzdTWStHN3RjZWdr?=
 =?utf-8?B?QXB1M3EydVJMRWZXMkFkUS9VUGZzQXkzR1Q4dWFtTWYwdStlVVFuZldPaVZi?=
 =?utf-8?B?TE9sckF6ZklzY24rR3piclJGTEUzT3NSdVZhQTdkMlBQTklscWlCMGxCZlVQ?=
 =?utf-8?B?WHRBNm0wSlJ4ZDdIZE5hYlpscUVZWWlhUzVQVmljYmJXREU4cFFibDZvbE9t?=
 =?utf-8?B?YllOQlErdUZBd1RWb21Gc25iS0VtQVc3dVI3akE0Q3V1aFRib2JnRUJBWjlQ?=
 =?utf-8?B?UDJUM0lxYU0vZXFPUmdvVnpDa0NYUGxqT2ZHRXl6V1FEWVkvOGlrQlJIanlF?=
 =?utf-8?B?Z2J2Ui9IQ215MmhzNTlaNXR6UU9tcHBBeTZTczlHb1hsSkxkckRGREZXS1du?=
 =?utf-8?B?bEpaODFIeHhLWTFrbVl2YUtvdkxjdTh5UUhKTy9SVjVrQjVLZVdldGY5dEhj?=
 =?utf-8?B?SE14Tmt1VldWMmEyWG1aQnFxUElXL0FERVM5RTV3R3RScGVHaTJ6UWplNmc5?=
 =?utf-8?B?RnlpN2RmbWtENDQ4NFdiK2R3K2JGZWl6MzRwbGZGMjR6STNteVhGems4L3hE?=
 =?utf-8?B?RTc3SnFpTTBGOVZ2alVKbHpGL1FFTnVsN1kvbVJkaVpsVnZlcnRuV3g1dlRu?=
 =?utf-8?B?NTJmRkpPQnFQQndpdVZYcHhHV1pQNnBET3BJTVBLYjJwRFJiS2VKWC82WWpS?=
 =?utf-8?B?c3FOVXhBbnkyVFFGVmdBM3crZ2hXWGUvZTVDbkJnVHVHa25JeTVHUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c17ff75f-8858-4f7c-bd63-08de8f92d4d0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2026 02:03:13.3996
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SDr1PHME8SB+JYkCEaeFRU4jaeXanTzj5UXkgyXokhsdB367+syjLKq3nKQcwhOFpLGg21H9WPVbcpGDp/3rYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10762

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

