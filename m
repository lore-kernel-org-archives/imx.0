Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010043.outbound.protection.outlook.com [52.101.84.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7AF3E559B
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 18:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780337471; cv=fail; b=XKYG/WzIWoY+gsMvR7sHCcAHm04uYxLtBqTxkhz8+ia7+XM2yw4OpcLootP68LxCx9jA+yitxvLeDPyRon/LjIcCS7tU2hrA4elZfRufXAGygK9r6FKzNlXXpZaSdcoiPoEqgYg5+z7ucl7OwxdQ+ONt+8gl7l0sav2/dDLFkt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780337471; c=relaxed/simple;
	bh=GUG/BdnxowNLoB5MJ5ItLNx4EKGRdpLHrM+GKZbigsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rfUydwCPqe2Balsgw7N7whOiByWbX5Vi/rUUgE6X10dYoxyt4h+dG0FZLPLMV2xgp0XJ6iQsRM7ruC3PwD1BggO0id3o+Luj9u4xQa09CRvBeyzuYlpoaNR+vrPl3n2rxArIaIl0b4PjfKffvAFh7Y5iY9pVK6qUnGi79iv68oQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CX6FmHit; arc=fail smtp.client-ip=52.101.84.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CX6FmHit"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sZDbPM7fVtBH0AOtmM2nWMKT0zA6b3d4Lz8x64qv7zi3FRQ/TwbaK4t4grsDAOEIl+HYLfsfI867p5VWWRzYILNqDzaO9+i/vfckQ60ZIm0SrXAepyXGcA5t+KHqKf+aL0EkPwU/i9tEFIV92yjUG/ZhRUwZT0bJd4lddKBflVAJdsOfejLah4wgS0xVwDTa+XI2OZUEUc1suuVcqJIyUr8GyzraROttMGz6pswwiOet6BJT7MT78hEKFAJHkpOWgKKGMWUVmnsnCay74lRKZiKN6iirTwja0VjEZrgZTAevHrrwb43T/JXS1GeeuX6OCW9vEkvpS008596CWjQ2Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+yq/G6RDEpEEXzgBVEXVFWB2UadqfOuAVLpLY13evM=;
 b=wjLtu0Puer4SBlQs2S1dBG7Z3ztvF/UiHe0hY/tfIols8zgtLQp31yGtBm6KdHID8oBWRCT1zP3G4PsnpgimoiuXdyXVDOkxkWokAgki89voEC3VyeHCA6ABonpcp3QU6nNBXH2ULg6WNr/FQ/5TT6wnpSSj92IGOu/DlcA/4Xco2W0JX127f7mORM1UfqzCCWPU21QWap1Icd6psheaM6ds4xL32+SLObHUj00Hu8y7qSAKCvru4wIGoz2Qz9h5DjVO7KXZR3f3XcrI1hkqrnBqejqah4vVmvdBNrZvL7dzf4QexdPhheAwcU7unlwOiglC+reAQGD2GC0eZ3yFvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+yq/G6RDEpEEXzgBVEXVFWB2UadqfOuAVLpLY13evM=;
 b=CX6FmHitsVAU3iuprDcMl/fkGrc/riU8cSjjB8Set+tDne+6N7tESIVwTjoczy5oC/IHhJwtx1sDj+lCIKnS00/K84lEht2YPCSMjuZ1qbsmO/V1DLSb7LpJAGw+HQanPY+1S3HFzmJN8D0qVoA2A38ColI5mSgw8Xzi2gX+5s5UDt257TWrkT/8qk/ELkefTrevkZHJReh0+hbMi9t+I3SeizCVQKbRqPvLDwUPBpeZtAhCC//za4cwgaIU81JRJT74VRy03Fkthsm0ZYujuPoq5/OE3WBlDzzSVY1Ipaxt/twpECNADfMYDMqlFfLX/6DdbwH8lT+V+V3WHyAxlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB11662.eurprd04.prod.outlook.com (2603:10a6:10:60e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Mon, 1 Jun 2026
 18:11:05 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0071.014; Mon, 1 Jun 2026
 18:11:05 +0000
From: Frank.Li@oss.nxp.com
To: s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hongxing.zhu@nxp.com,
	"Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx943-evk: Fix PCIe EP vpcie-supply
Date: Mon,  1 Jun 2026 14:10:56 -0400
Message-ID: <178033738931.182320.8991467833458902504.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260519055431.249960-1-sherry.sun@oss.nxp.com>
References: <20260519055431.249960-1-sherry.sun@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH1PEPF000132EE.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::36) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB11662:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f1fdc42-b3ac-4c42-b1e5-08dec009256b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|366016|1800799024|56012099006|18002099003|11063799006|22082099003;
X-Microsoft-Antispam-Message-Info:
	Uzal2Na+madR8Lb2XXR3ID7rcNvU0jJ6oNhkzkojr7XUkN5hxgrr1vRaSy0d3NUXa3N0GtZnvLEIn4wtOW1q3OhhR3FtINojH7Yo6HW2lhMh+WO2VaqTzpOvJbAwmVt/cX9NTjKqPUdgrMOiXBPDdvvb37mPP/9py4kDuEoavs92jmylPYh1vc2atR4WPTALK/5BoEylzELP8L/5jPW+J7l+q52V6nqWxoJCchbIgFLpAWjevYDkMcHmyW1s9JMQ9TriuS9uL0TpGP0HvdOrCvVeQytyD/0o+HXG0HHgm8FmIfFR/o1V/RxY2QArcldrRjqRS89cQdZdfKUZI6T1/NGkir/xrW236qTobocP6JswLUXB7g4f+ftdOb3Y757eanYyNrwO8jDyGuMfefvG25nd6Y24t7rwywRcYM1/U8IlgPtGzj3Tk1/ONifZgZj0kbxfhIWqP2G2fNUDjzr6xvrXtyXUtvSvw5jsWFZABXj3iHle+/vU12KP81Nbwn+UXSSc60hxu3LRAryeWZrXqRPPAqx+fATjT+oeslMlmlQ7KteGOMb5mo/qDVlGUDTBvcbFZSaB/8XA8SSPL9pcnnVFfF+viAGyDvaatfwazRG31sk+uvpkvGrlkTN+Td9t4/uznADyxlGHt/mlAHKvWU+52CUL+qJBIEUYeNS9vC0y7DOMAM1IoX2zRN6zGODr
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(366016)(1800799024)(56012099006)(18002099003)(11063799006)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVJJcEszR25vR3NWMW9HR1gveXZUa0pacjZ3SDFqWU1nbWZJdzU1NHgxdFlQ?=
 =?utf-8?B?bzhobTBrUUNNV1VMV3BMVFBOY2U5elBLRGxXaTdaVVNiZEIxTXpYZlpIc0Zp?=
 =?utf-8?B?NHNzdEswTDlqdEhOanNIejZHWW15WTZsd3VsMFYybytvOHdweFpVTU42UmU5?=
 =?utf-8?B?YzlSWlFON2FDSnVEclo0Z09iZUcwZFBGMnkxdHBEckJQRjJ2akV2RFJONW1U?=
 =?utf-8?B?YWNoRjBxbkE4amZ5T2QvbWl0U09jNEo5aEsrWmlYUzRJenFTUE9Iekh3M1kx?=
 =?utf-8?B?S01HM0Z3MHhwRm0yNGhweEtKS3FVTlJLV0pUTnEwS1g2aVFHMXFOMnlnUzcy?=
 =?utf-8?B?NzBvMDFzb25LTEp3REp6L2tNM3Nxdy8rZUVSTXhRamY0S045Ym80blNNcEVG?=
 =?utf-8?B?UjYwemZ4Um1yTWg3cDVRbFV6WVNIQnJyNmpzdVNnVEhZdlF0TEFaS2FlekRu?=
 =?utf-8?B?ZEZJZVVaUGZ4ZUxOeVlaQ05ocndULzVLbExYWlJ2N0JROElMeEJIbTJmVkx3?=
 =?utf-8?B?YmhDRmhtYTBIS1pkUjZISGI2RlBKUWlKNUlVZ1dPYlBuMHNVanpleGNVME5z?=
 =?utf-8?B?N3NuZGEvK3R1YVdLTnRXTGNVTm9ua1FBcWE0OTREc1BrWXFqcEJlMDFUK1VO?=
 =?utf-8?B?M3RKd0QvQm55MEdvTVlwWmJyT1JMcWUrTjc3a3lHUjlJQkdkazR0VmRaYWNn?=
 =?utf-8?B?UGN0UTdWNVQ4c29jTC9HZVdKSFRFSGtXV1pUZHF6bEpvZnpFOGZSUHo1M0hi?=
 =?utf-8?B?Y1dITDMyemtvT2ZDTVcvblZGU2Z2Ti8yYmNxckRMU3ZxNUl2UXlNV3BKZ3BO?=
 =?utf-8?B?ZmVrejhGaUZER0xXS3p5NVZEbHRjWTRlYzZGTVlDeDQ5L3pIVFhLWW56bDlO?=
 =?utf-8?B?QmVVeDZPeUZwR1Z0TVpFdHA5Y1A2TmYrSWIvY2M3VGI5dVBnbDRkOHpHcUQ2?=
 =?utf-8?B?TVNtQllXc241d3AyVG1hdUR0TSt5QXBsS3ZyczE2bVYxcHJKYW52N3dJY0hr?=
 =?utf-8?B?MGhBSG14NEphVitqVzRyUjUvWG1RU2FBNnY3M1RsbWtkOG9ndkZTd0xqczBp?=
 =?utf-8?B?TmdyYzg2YjVLVWZmU3N5bFlWUktma0xoOVpLZ0lJdW8wNi9ISHVSUlRqR3lP?=
 =?utf-8?B?OXdFc1ZYOFlvbjM1QXJQeTU5TjU1U0hIcytucGEwWCtmcXI4eDBTWlF3QWFh?=
 =?utf-8?B?S2xzZVlvbmhJVVZwZzZXOXJHYk1KdGpaL3dXYURwTVJtekVuSkhtZktlVk4r?=
 =?utf-8?B?bDdhclhvRmdSTm9DMFZpYXdPSE54Y2xNLzBTL3pTZ0xHU3JKdElXazloZ3h5?=
 =?utf-8?B?bmFsejg1MEl2bURYWnRLUTAzbkhFTGVLcjlnbjljSldvOUVrWFlsYXprM1Iy?=
 =?utf-8?B?VlJBSjRzRVlncUJudTlJOFFGVVkxNzNkM1NjQ0IwSzlSTStoS041ZDF5UUpX?=
 =?utf-8?B?bDI4VjlRTkNOWHZQUVdlNk5VWHFRSUtWRDFUQlVVZENCbzNwWUUxakxHNUdp?=
 =?utf-8?B?WVhqc3dqNTZRK0QxVCtIdjJ3RDVmTWFXS09hSEJoaWZVNnc2THYveUNtdnl6?=
 =?utf-8?B?eEl0MnlDTURiL2pVdDZzcGNyckxTTWwzTEhyRWFESUU4RVdGZ1FNTDQ1enFS?=
 =?utf-8?B?Rm93WkxtSnJwSWFrclhEMW1ZVVJwZmNHeDhSS1dVZkFidTdHanZnYy90Yi8z?=
 =?utf-8?B?blhCa0VCZStuOEhjRUpUTjJReTIybjVNZ05vZjlFQVI0M2dvNkhEYklhNVR2?=
 =?utf-8?B?aGxCMjdGV2Rzd3VoN05TNXdtcnJCSzdoRkhWZGFRanc3L2F4UzcxSkpCNkhX?=
 =?utf-8?B?R0hVdERBQnY5Wkg3YnZDcnQzV0x1aVZtS0xNNVRHSlZpSlFvQ1ZxNWVScVBT?=
 =?utf-8?B?MThyTVFteEJKNXQ3eENLaTM3TWFobnJTUUtwbW03UnlNbW55UCtBUGF6N21t?=
 =?utf-8?B?QXQyTWtTZzN0L1NlakRYK3kwWVBaMThndk1TVHgyazh0TU5oUE92eFhDdnZy?=
 =?utf-8?B?dHNYOGtsUEoyZnE4V3hTSFd4a1V5bUovcjZ6bkVYNFBJMDJlenNqL3FsTUVz?=
 =?utf-8?B?dDNCcU9MMjFNUGNPOXRvcWZyYmUxWk5pTU5ka0VZKzVQTDJTeGdoVzRMdEt4?=
 =?utf-8?B?ckE1bUlHWlZXSkZOb3JEZDA1U2g4cHJOLzBrYW1KN2ZUeDAwWGZ2djNIMjRi?=
 =?utf-8?B?WmV5WTRBTGo1V0NoSVBlZWZ2NFVZUWo0UzYyRzJZaFJESWY3bEJOSllidEtK?=
 =?utf-8?B?V3VWVnVTL1BRRWhibnNPT2RaZEFnN0pVRmZ5UTYvcHJOTERqK2Z5RDhlVmxv?=
 =?utf-8?B?Uk91ekszUXcxaWJ0UWlrZ2lkTjFXaU5aZGpvM0ZFVEgvZERPZ1NmQ3JvdHlE?=
 =?utf-8?Q?KVnhn/KauMDE3/onHBvlsTLVb7bQEXDdhu4zQ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f1fdc42-b3ac-4c42-b1e5-08dec009256b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 18:11:05.0881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zxY6zIudGiZ1FMehf+XVU8tdL7LLgMBvCcRctZoLz65W9grgwNZ1At3Ajg3VCfv2KgrpbLFodwInb5U8DXXETG2W3UIOiitKMRs2fTNUmhdC0FgVHo0xepo30sadqyXi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11662

From: Frank Li <Frank.Li@nxp.com>


On Tue, 19 May 2026 13:54:31 +0800, Sherry Sun (OSS) wrote:
> The vpcie-supply property should reference the regulator that controls
> the actual M.2 power supply, not the W_DISABLE1# signal.
> On imx943-evk:
> - reg_m2_wlan controls M.2 W_DISABLE1# signal
> - reg_m2_pwr controls the actual M.2 power supply
> 
> Fix the vpcie-supply to use reg_m2_pwr for proper power control in
> PCIe endpoint mode.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: imx943-evk: Fix PCIe EP vpcie-supply
      commit: e76fd0257772ee54f9ca4e594ed5d4c2277e4a03

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
