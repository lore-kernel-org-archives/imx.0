Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013026.outbound.protection.outlook.com [52.101.72.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1400231C91
	for <imx@lists.linux.dev>; Tue, 25 Aug 2026 21:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787694370; cv=fail; b=kjd+9+wmOK6UPB1l9WHiiEuqc6qDNzt0F5RSPoPG+lOJvZrikcdh0rigCIVHJIBzLMsJ7ZDbpMy5jAFKCFVLRcniKkkKPsjDYCs5Whh1mSWLlUPX3s/k8h8uQmkfzimCZ31eAwfA8iqGlC97zdwmd9NZiORo4mtOej1tWJHCznU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787694370; c=relaxed/simple;
	bh=SmJXWt1j8YoHJKcz1fQnCekkqs3wxi4rRx/+jFsUqPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aTgvBpn8KOlR+x29fdAsfLORsOy9ApZMtVI/Pu6unAKvipB6hrJKfYsOtGoLQoCeL5D+WM6BGla44QY42fGtNqLXMmOEBYv4JdUW5KOcRvbObWPZ/BDLWWVr2oP2kpSd68nsDf9Tec+yLjyKKmxup5VN7B5NA9kw1SCpD5po8sM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=l/BPDW7n; arc=fail smtp.client-ip=52.101.72.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="l/BPDW7n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k5v8ldD4V3qIs1TIz/PGiruNZ3rvg7aV0Y2q7QcU4k4YHPcq+YyGqTLjKdQnmEQ7u5aOZjTnp/8RMP6vNcexrEFo7mXmyosElugIOS38gc/zCAzVlVw/iAH4LtMc0Bi7RzGJvWhimQfYh7wXKGzzVAFwR8P55IuBqgv1/MdmopYtCZk0N4RDk31sP3KcWWwbawEn8Rpz93ihFI16NiCOmKnI3ilYy/KdwPrNVpCnZGgnZlukpN9nVYG1kbnInJjuvDwf2RhANUg7q6rBZS+EZOVk/01bN1jJ78PFpKrdwAthNvEx5DnMHJTALFMI4u2rRQLpu5EYur4tw1E/V3BJng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bP67wmROG0I99gOkkOnKRlpSB9MdSEYX0WVT/VaUJRk=;
 b=w6R+kpJ3WoHsUMx/zGC1TB/aknod1lNqia1NkPJzrQcmGJ/81Sy7xv+4GCLWeCOGvjbsxwoawS3T9OvG1O7jl5Kedkig7P10h1fGsLNzIw429f+lC/sanGH0YWulx1sIheayNL0XNYpjIIHCRRxC1fvElxiTo7VufEa7fhlAUOjburDaKUqu/i/tL9MQc5+ZMl7TsUJiywa0P0cOsHMWVjKdWb1DfoZsTYK1WwAQqhPREzBqsHVqD+E7j+LF4jewr0K2quR1bJeOZh3FGfc5C4cRSgh8Cb8w3hZRsnowgFfaNnCoqQIFFdM0sQF8lzHXHxiTaLKXsteoQwj5IQXeMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bP67wmROG0I99gOkkOnKRlpSB9MdSEYX0WVT/VaUJRk=;
 b=l/BPDW7nFl158GynIRIcTCVOWk5Ji1dW0khEiqZ2N4rl2ByCXc0NH/z9k/Dy8STjvvgafcwbX295YbfWq3fV7IoFIktMf2Ypn//MXAJZngUAq6toWjalrcZZLg4WszANiGSdqgOUVoJK5xSBbmBbb1gzy3g9Sr/+2nUalgT0vNXlzKPq4zZ+E3mMK/1MaSWTaXRmcCDkJuIBSOyseQbT0rTEcXQU0C7nimv8EpB/HNcyxsEFmSJe8CeDV4BBGqpeHbcqUjk2slr1Mt7VC2YnaRkFaV3nxGulJZSsny9Ou+cGExE5H7yTJBlBau4ZGInPKmm2soWpE9EHWJfuvzr21w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8909.eurprd04.prod.outlook.com (2603:10a6:102:20c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 21:46:01 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 21:46:01 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sherry Sun <sherry.sun@nxp.com>
Subject: Re: [PATCH] arm64: dts: imx95-15x15-frdm: Move PCIe PERST# and vpcie supply to Root Port node
Date: Tue, 25 Aug 2026 17:45:54 -0400
Message-ID: <178769432074.2276675.1191318022705051337.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818-imx95_frdm_pcie-v1-1-55ccf1822b1e@nxp.com>
References: <20260818-imx95_frdm_pcie-v1-1-55ccf1822b1e@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR17CA0034.namprd17.prod.outlook.com
 (2603:10b6:510:323::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8909:EE_
X-MS-Office365-Filtering-Correlation-Id: cf47c478-4fbc-4662-3b1b-08df02f24170
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|23010399003|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	juFkLg5zH/FPYO1/z5xaBr7DFUT+M74ZAc2QKOMB9ref1Kuo7OHvZvVALwElk2lTN+MrTWyLdzHibwx+1meOiX48IA3q4YBepgUHuGFoHlIgs64L0Na2EKN/Ea6xnPrJXd4pPdF9ZMDCmTfDZcEb5dOHOzYskkosQ6Xvh1aXRamGbmAtt4LTixQdaAY686jDyuN0BBYooIFTonlLSqbUiErMM27+CLguuKk7EorMmWkeuAUElqKaePe4uomhUVsaHoQw6840gua1BxfvzAtNSlMwarkrX5c7XFZgFX6tmUdW7CXJMOrCBiOsb8Rhx1WruOx+NHoVUzBqbMLhmy8p+CtixrwDqJBCKffWUi5Bs4pAScOABeFEyKXyERCLY87YX9Q5+vH73jq5ylPMytjsYQKP/j0vCl5EaPhg59bYjJz120WOqH1mH6ULpghWI2o7zSSwiDfLQBzFFvdTLi/TpM5827FY0K5G55oSHpRVkRcPFSdKx6NR6Ruwc5VKx5n6MPVkD1UCAnKec/S/yeG4KXshR6saEJ/DUgVIxyq14P4vsj6hhpz/pObqo8I+f/MckjgLmeLas5Ei3Dcp+dwbY+NoKiyXTTT4BHUpoV6YAXpot7/v/n1tUmlryQAnMhIS6G7bOc1t/WVXaXWi22qP1csFLnZoxnOl5YoSePVnWUo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L1ZZZkRpTlc5YytPY1pEQ1pCOTh2QThsdjJRVE9iY3dCU3Z0NE5hOXlmbVp1?=
 =?utf-8?B?QUNDV1JSSC9Gc0crMldzSG15d2ZrRDJsMEtqZEU4c2VVdisvZEhHSlBPQ0ZF?=
 =?utf-8?B?N29pcWZGZ21saWZWSDhHMGhFU2gwZitQelZMV2dQc2pEY0tLbHpjMXNHemNS?=
 =?utf-8?B?QlYwY3dPVHBNS1Y4QWlqZWt2RWlvVzhLYnI3NSs3bHRzZk5PejdmcllRV1lW?=
 =?utf-8?B?WHFDSXpZQkprbjZaVjRONno1b3h1eGRSaDZrR25JZFN1bVZNRk9QWUp4WVVP?=
 =?utf-8?B?N2NqaTRUcm4yMkFxRGNDV2ZEak5KRktQbWJKSk9iWi9xVDc3bkgwdFlNLzhO?=
 =?utf-8?B?SkVxZGxtWDd1V0F0RUZGSFZ5d2N5WEkzclUzem5LTDNvUFlubm5mQ2F1dXRP?=
 =?utf-8?B?Vk1vYUlkdG1MOHZrOENYZUhSM1c0bjBUZkxYN1Z3eTB0amdZQmhYTWJBQ1A0?=
 =?utf-8?B?dDZCYnpKWjdTMDRCbUlseTNqdkZDL3BNekJwN0pNaHJ3NVJFY1RkMmVCUGJT?=
 =?utf-8?B?aWhBQ1BORTByR3h4d3IyTitXNDlVQ0x6bWFpdC8xUlAvOHdlelI0UU5hN0tZ?=
 =?utf-8?B?bzFwYWdPUmhjUGlOajZRUlgyRVRUa0ppZHpDTHRkd2FPYkgvT240WnFXanB0?=
 =?utf-8?B?cFgvKzFRNlZCeEhzdXQzeU5uTU4rOXduSUxpeTlWalA0MmNXTFpRSWxRbzl4?=
 =?utf-8?B?aFhISXdsM1JKV3BodzU2K3BsR1VKRlkxTjhmVkt1NjdJOVJnZDlsZVN0OFdl?=
 =?utf-8?B?bFIwbXpKbTJlQWtzWlFhajY2cFpFYzNHNFFnWE5KQXF2Z2d0RFhDUUtjYzlk?=
 =?utf-8?B?NW9iQjN1elVjRVpWMmlXbndvc3A0bDMyQmlQU252Tmc5c2kvV1gzT1ZzamtL?=
 =?utf-8?B?OXM1YnM5R01KUERtWkZrQTFGelFMMXppZ2NYQ3l1SEoxTWtpOUVQRU1ldVhB?=
 =?utf-8?B?UUJTc3U1dmZRR1NRMmVUR3FEclkyNVVtbHpSR0Vha0ZJTStUSFdyeTRDVUlS?=
 =?utf-8?B?a0xVN2VXOU16VUxGdVdqTmJHTHloYnAzK0hhWWtoWGx5c1dFQVpKR3NWVnB0?=
 =?utf-8?B?aG9vN3FCaEdUNWFXQm9NZGg4VzVBQldjejFWbGRPVHR2TldBWEYyMjVYVFdq?=
 =?utf-8?B?NHdkOGg5Q1dvengzd3RxMnZ3R0pYSWlWL0dCcGVCaDVhemxyVDEyaWtwTklY?=
 =?utf-8?B?TFJndVpyZVU3QmZMMEhHS1VrU2pKaEZOSERVVlJWbDZvTGpBOWtIQk9yR0RM?=
 =?utf-8?B?SnFqRmxpRUd3djE2by9HVjg3ZUZicVVLaEJRb1BrZUltcWNsN291bHFHYWRn?=
 =?utf-8?B?ejdlSy9uTzBSbUxrb0tyNk9zV0l1dmVuL3lDU2NnZmxsTWo3eElVT3lhcWtU?=
 =?utf-8?B?bW9jYVNCQjRpcFZra29ydkl1QWZMb3YrdGVpKzd2c01TQ1JTTVRHRTY5L3Mx?=
 =?utf-8?B?NGw2RXUzVmR2SEJLblNNbG83d1YrZUhBNFZmQVJ1Yi9HVG5hd2N6U294a2FN?=
 =?utf-8?B?ZVFPYjVBVWdCU3B5eW9NcWZnd2krVmhIWjJDWGFsNnFMM0RIa0cxNkNrTjlo?=
 =?utf-8?B?c3orRzlHL3ZRcWNZQkxxeHNsSmlOYTFxbHpTOXNlRnZxK25ENVZYakhobU5K?=
 =?utf-8?B?ejFEcG1rY0VzTFd5a0JPQzZKY3A0WU5RaVArVk5QNXo2cTIwdGUwcTJVcXZR?=
 =?utf-8?B?bWxyRVZOS0pBNmo0QkpTMnM2QTF5QTVlcTlrTi8zVUlCRmJ5KzRzNEdMc1Ro?=
 =?utf-8?B?NlNGbHJhUTRCcE8rVHJOZ0ZWelY4Q2VwQ1ljR21WQ1VVcXNieTJYU0dDSTUx?=
 =?utf-8?B?NVc0VHV2em9USmp6RERmUnp0aCsvSXY2VEhnOXZiUVVaRGZCVk41SlFqdWJw?=
 =?utf-8?B?emVKN2h4YzFJTE84VjBGVTFZNCsvcHVZaWN6WWhNZFcwNVVxN3NVN0FuMnNX?=
 =?utf-8?B?ZmdHMG5pSHpFcXBudVpMdnJOcVA1MWRGS3J4MHZjUm5UeDdjSTJUZ0J6SlhC?=
 =?utf-8?B?RjdMUXk5d3lyTW1sSHJsNXN6RVRFWE4wK2kwYWdYWVI2V2Fmb21uTWUvdFNL?=
 =?utf-8?B?TUdkVmplVlA4aGN2NmZ0Z3I3eGRHSklpcnpQdGowYURFYjMwd2M5SXVySGl1?=
 =?utf-8?B?OUczRkU5NS95NWM2TDNrUVVEZWtQMzU3dHQ1TTFGczN5V1lrOGxGbFdaK1R6?=
 =?utf-8?B?amRlU3JlZ2JPL1ZyWkNFS0FXN3V4OUJNS1dobkVqWHplWFlMSHd3UTdpcU03?=
 =?utf-8?B?d3hIeFd3WkZ0aVRHVVA3MG5SZ3ZGSkJjQm5LaW01QUw0Ums2bWtBQzlsMTg5?=
 =?utf-8?B?NWs0aEpQZWxoQ0ZFUjNmdC9OU3E4a0lHUzhKdUttZDVRZ2s1SFc0Z1F3SXlr?=
 =?utf-8?Q?oQiSMQ7kfCc6hDMfl/bmh69mBQlf+ZNYYWFRY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf47c478-4fbc-4662-3b1b-08df02f24170
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 21:46:01.4568
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UJXgzmFXgT61nWuli+Rduwr9z6qt2H4TLRNHocAJGmkOZo8DpKGumZT0sm1MWsrfjK4CfLUXYQWSYrt/aAvXROFieH49ewnyLmo3CmwYsiw3dVYFxefjMX+wpOUToIml
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8909

From: Frank Li <Frank.Li@nxp.com>


On Tue, 18 Aug 2026 10:55:44 +0800, Sherry Sun (OSS) wrote:
> Describing the PCIe PERST# and vpcie supply properties under the Host
> Bridge node is now deprecated. Add the PERST# (reset-gpios) and the
> power regulator (vpcie3v3-supply) in the pcie0_port0 Root Port node.
>
> Since i.MX95 is the new platform that under development phase, it should
> be fine to simply move the PERST# and power supply properties.
>
> [...]

Applied to imx/dt64-intend, thanks!

[1/1] arm64: dts: imx95-15x15-frdm: Move PCIe PERST# and vpcie supply to Root Port node
      commit: 79d398c23c19fd7be7e8e13080429fb847a8f306

Best regards,
--
Frank Li <Frank.Li@nxp.com>
