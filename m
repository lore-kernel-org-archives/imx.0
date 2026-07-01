Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013020.outbound.protection.outlook.com [40.107.159.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF64D47F2C6
	for <imx@lists.linux.dev>; Wed,  1 Jul 2026 11:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782906687; cv=fail; b=IgAIcBdI0fReHSnbHa6ky5K7Rq+3nO7BMs/Ko4skca7C3gI7nEaS6iHjt/EzVd841oxHgtLtRCp21n92ZL7gzxoWlYq+VSxZM9XEqkVSZgO6XIFriXXbEv7/TaCIQQulYN5cHV5hGuJDh3FDxBb4vjJ2Qs7zX9YAQ8iVDW9tyws=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782906687; c=relaxed/simple;
	bh=eZCGJspOZ9Q5+Ji4bziLYfqebpERV9f49eu+4uENzTw=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=OfdIHf7mwRHbPKwqaBimoYdBrrsZJxGYa4mJnAZ2IZBcVYKvaCMQvbiC4kaQp0Wb4/3WZyaab10LSqcA7sP6IoYQ/uvCbCbZKCty0e8w3Ra5sskDpwq1Zc6SoDl0Uw1YWVEynPSf8i/oac6wS0gE3hwjPO0t4of5+I2sZkNR5Bw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BC8dPSrx; arc=fail smtp.client-ip=40.107.159.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BC8dPSrx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZN+qTmjo5qUGCq2lDB2Z+3zoMQ00NA/i1X/UXZwft8CUsySHYCyNE8aZpfLb3Dp6OxmoyODO41p+2n52PacmSC/drQMpYW4NRej0m3o3ndFND1mEykNcVb58+/mGjsq16Q4sCXBLKu/jL4twTh5aN1TCrkLqxAolwcN2692xZQSm/UunUsiE3QGz4TJIS49zwKRY807uZDiSKk2SrL9S2Jg5iGyRQXFFC2NMwCYhUGFs0x/WTqfNWbU7ccaNVIwXqVBihj9oCH7f8S9wK00QabbZlFRkkZxl3prsGToHpw4iyTFYH88folzq8G3AkBwqRlvnr4NojbVCkLnWybPMwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DFsQDb2xtrQQv0exzeYaMq3CsjbQs9Q2hZ96oskW8W4=;
 b=IkRBNGAZj+ZkXH+epLB1kt9DnNuIRTPuX/3w2SX1n9F5voX2Db6deF3mBF/V1DOVeKAHj3AsHUr1DpZ4QuVp2gxNIIqmmdHFpp8JpTVRlxmw0AXRPmux6CttoFS4tlEnFQ1KJnmuj5hH0IpTxg38AvcYggli+J8pXd7yRXZAlbuD3GnrR5lr/CF8j6/m56PjYx0vC5E2dh7iCi+mrbpjkGJwMJvlzzUpcBQapV5UNc7edZAFMiKE9cANkvqE7/YULQwH+cuTOSGbxX03E3CljHkW8q1FRbZUQISqtzC2qXFVEmI75SSq0K4tebDOsj8sOQgI0mLQuofARmd+LYjDvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DFsQDb2xtrQQv0exzeYaMq3CsjbQs9Q2hZ96oskW8W4=;
 b=BC8dPSrxmn30cI7nH0Z+KTIGfJMbeRRb429HZ8TXI9KaC3eMcxKPcCJYqci3WF9X8yIZXAVKm1z6PX8A6RmfzGvF9g96bPyXjEue1NQZ0DKPSUf2epHVEXkqzXLg83L1pH6TVYFc9L+R81qcz+kBucwMWTCB7e+N3WIwwsWw4ko0lzzeZtYOX4r2BXNOGWfN7vZ4xwMEOQ5AaJW7z1jc72CTUKeNK7foZtI7NlO1uXhqtI9FlEERijRX/izB0VGgOgI/GzHxqr/VXuwCBTaMU6yH8GvBQMnl5szCktEGJblsN2nHnaJ/5BikDTDVrH5aHe9y7IX1ow18x4O9gsscTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::20)
 by DBBPR04MB8012.eurprd04.prod.outlook.com (2603:10a6:10:1e6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 11:51:22 +0000
Received: from AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85]) by AM9PR04MB8179.eurprd04.prod.outlook.com
 ([fe80::a551:cde0:6730:1d85%5]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 11:51:22 +0000
From: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: [PATCH 0/1] describe GPIO and EIRQ resources in SIUL2 pinctrl node for S32G2/S32G3 SoCs
Date: Wed,  1 Jul 2026 13:51:19 +0200
Message-Id: <20260701115120.1115494-1-khristineandreea.barbulescu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P192CA0012.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:20b:5da::20) To AM9PR04MB8179.eurprd04.prod.outlook.com
 (2603:10a6:20b:3b5::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8179:EE_|DBBPR04MB8012:EE_
X-MS-Office365-Filtering-Correlation-Id: f5bb882c-55cf-47e5-45d2-08ded7671249
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|23010399003|19092799006|1800799024|366016|376014|7416014|921020|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
 lxJl6Gp1CE5h4YGTFTmP31yxdm6OvasV7LNOJycWb0GdEC2W+dtvHuR3iHj0vqBvluPGBxaeYIWAczsbSWHW3234EjOYMikT9oiKjY622xJVPl7zm4oqCrljG2rOEkXubfxMqWT0kRCg6/Sk2m49CRVWp7mfvOK7NRsT+gJQXQqQ1H0CK7H2VXrcMKw0XOVmgCCTOpGe3YcZiXzt9/UQa4sFac8bhh9Nl4CCI5hxlPUY8OuCZPjGfaZuuDKW2ZYQhKmzugfyfa5SNvcb6K9TcJCAm7hznL4LnZ6QqtbFtqJIl7egkoCzIZiC8bA/b6vEQ0ImOLVfPSw9fhsquLVd5XpgDYoG3BRYOoCIFdMFTUkKLojYFBgE5L1hhCq4KxzQaVh7LL6aoDfj6dhcnYTCk2HP9ABeB13UnMgn0g4aVR9+/o6B2ESAJ7jE9C4onoxjZ9Moi2NYJkUFK8wVWuhw0YXmUxrfgKOo7Zkqq38fkQFGasvErCochlQhf08vuZ2NGUWecDNlYl/fw82OF/Dd3jfjvIdqSGXeLVDtJDj4xJPm9vBTOV6QRglYXOgCXr3n/ZpfN987iHiafnogSwLmkyAi+1cWc7vF3Cf5r5d0ejFwKCKc24b5Z3drijrE/fpJufAz9KsVblhZkMW6mkqaSBJAcgw8fgUL+XU0FVi/C+vSqB5xGHKW5o+Gbl8GFEgZr9VIrEcmYs1rxC0KoygxQQ==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8179.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(366016)(376014)(7416014)(921020)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?amdsZUlIcFhUM0tGQ0Z0Qkc4am1YenpsY2NRTVhyQ2lqQ3lBYXBsOUtab3pO?=
 =?utf-8?B?dGY4UUZZM0ZVd1BsRWFsZjIrZU9pZEZCUVZxQ2Nna3o4bzloSDlMdlZZTm1o?=
 =?utf-8?B?bnBmWGhiRW1taFVPbkxEa1RtYXZkZ01RVXFSZXNXTTM1Z05IWllhRDJlMUxa?=
 =?utf-8?B?S1h1LzF4eEkzNGpabjNOVHgwaldMTDhQZmRTMTlzWUdlREhPWnFaVzVjSWQ0?=
 =?utf-8?B?aU1xd3NQRDJhUzlCdFRYK3B3OW9SdUdiYnVxSEd6emx0YVplM25UZVdTTkUv?=
 =?utf-8?B?NmZOeXVtVHpIS1R3MXh5UjJtY2tEdzgvVEVFVU9IVHQyMjJLZ01iYlZqdjNt?=
 =?utf-8?B?UXNXQjVXdU16QXBwR2F1VjJFN3ZxU3pINEx3RjJ3d0NmK0hVNm14UU40dWQ1?=
 =?utf-8?B?eUhzQ0dneDBKWFdjaDFGdmtYZDdJWlhKN1ErSHd6aTBiUU51VXV1SFpSeStj?=
 =?utf-8?B?cmk4RUN2dkVvR2tIdWRvZmdPeHRmZXJhUk5VeTdwaDBrYU1VeTRKaUUxZDQ0?=
 =?utf-8?B?d0dQQTIyNEVDejBySUhsM21nWmgzaGhZTWxheU5OSmJyc0E5SmhZZER3djJR?=
 =?utf-8?B?MWwrT2xGcTBDSnJMTkFESzN3ZmFQMStoajhKVE12OHhBamt5UzlycDRWZ0g4?=
 =?utf-8?B?OHh6VTZ0c2pOMFlObWdvNkRtdFlva1VjSGdVTXNoRkNiYzlKVmhlTjR4VW1Q?=
 =?utf-8?B?QzM3SVRkV29qb0orRkpmL0ZRNnpGcS9JRTlFYnIrL1AzOFFJeXRWYzR6ZEJL?=
 =?utf-8?B?Rm1wdDJQOGx4TnQrUDdUdTdOdkduNTNGMzZKN1pmQjhVMldIaEdJSTQrZ0xt?=
 =?utf-8?B?cUZTSHJsMDFIVUtBUlJHa1k1dTJKRkpTRWthZVRxV1VsWVdDaUJFeWRNeDg0?=
 =?utf-8?B?YjgvWUVNbzQ4OTExMDZaZllzV0xVb1VIYkFvR3ZqaG0zZUVNR1QxcmxsOTZL?=
 =?utf-8?B?T1FWNXRHdGFUOGtPdnkvS1FPdnVtZW1xT0VKVXdOK2k0OFcwdzB4WmZicjAv?=
 =?utf-8?B?NXJ2dklhYXpGUmVTYmVpN3FIWlQ3dmRqNklhTXZRcWZodmV0RWlYZ2FqekVw?=
 =?utf-8?B?cWY5RkV4cFJmb2Z4QVZ5SFdwYWh4MFhyNW5Bb0srUnV0QnVlQnRObWhWVndN?=
 =?utf-8?B?QWxhWEI4eS9FWHZiQ1gxVkFxOENLblJid0ptaUNwTDlRcFhsTFJxd0RLY01G?=
 =?utf-8?B?N1JoRDBZZWgwb2RqdlR4WVZCblVUQlNIQzc3Z3pnWHJYdEVOZ1REbmdiMGlF?=
 =?utf-8?B?aWRkWVZtQlR6VWlwc0lUVFZsei85ZEk0ZUtuWFNuM0FzcjYwK3JUbzRTOFhU?=
 =?utf-8?B?ZSsyRG5ITGtCZURrMXF0VDNVSHhwaXBtVjhJaVhvYkZTTi9VOU1YQXFVMm9j?=
 =?utf-8?B?dFFYTEhDOVpWckFTOXl2YzErM3pLTElpdlliWEhOV0ZtOUVONTNuUi9aN2hV?=
 =?utf-8?B?RE84TFZib0JCQVZWVkZlN050ZVpBYmxOeUZSVFg4NG5BYjF5RWRMWWkxZE81?=
 =?utf-8?B?YUtFUEl1M1I1UU9BWFZnQ1dCNjk1amtMcnUyT3dIMExTVTZ3eDFqUGdQRkxO?=
 =?utf-8?B?LzloR2dJcUdxamE1NTB3WXkwOVpYNDRpYUkycnNNdlVmc0FhTll6cW0wVzRp?=
 =?utf-8?B?N21QTHFXWE0vdVovcStBdkNkRllOWDJSN0gvbGM5UmM4TWVIYVQ3T3M1OG1l?=
 =?utf-8?B?d1FlT1ZDbThVK0VYa1cxUnVsU1ZHOUlJa1lXVXZaRFZkS2hGeXVYV2N1OU5o?=
 =?utf-8?B?Qm1PK3lxT1FrRnI3RDVuMXlqUFJYZE5CUGQ1Qll5cW1EQ04zTE4xNDRlaExm?=
 =?utf-8?B?b2NaSC9DNmhUY1dRTXN6a0hJdEhQOVU1UTFNM2x6Tnp3dUdWTkJ4QlNaRjZX?=
 =?utf-8?B?SWRXVkxqTzBaSXdIV3duQnhkTjJGZ25Od01Ba2NvTnJsOHhuZEdSVkpWUnk4?=
 =?utf-8?B?Rzk4dU0xUTNrM3YwZ3VQRXlGKzhYSHJUY2k0dTNGNFRPdFVRazRZV1hYUUR6?=
 =?utf-8?B?L3QrRlZoVHNIbEU2cWduRnFKbksrZUFlNVpsQWJMV01iQ1o0eXB6RkNpK0RG?=
 =?utf-8?B?Zk1hb2ljdjZpMDBYZWlEOFZzbHZJQUVHYVVad3FOcFBHa1dGVnFGbDVHNHBC?=
 =?utf-8?B?V1VRSWdGTWdUYUluRXYwTzByb2Foa0xSVnc1NFZPNkg0R1Z6dDlGS1RUUEdR?=
 =?utf-8?B?ZkNtMHRlU1FWWlVtWnpKcXZYdkIwTHF6ekYwMWt2aFdpMFBtVE9VS05OT1Fi?=
 =?utf-8?B?YWJTd1NabWk4WlREaFJjbzcrTkltdVh3NVFmQ0FpbVJ3Ty9PN3dyd3gzNUVo?=
 =?utf-8?B?ZlJyRTFrUCt2Vm1kakprNGhMZlZLT3R3dHBXakRvNGtzSHpIV0NWYmY2dkNO?=
 =?utf-8?Q?1mihEXi7uf93H7ssxQ636wcTDST4CC9nuMLI7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5bb882c-55cf-47e5-45d2-08ded7671249
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8179.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 11:51:22.3723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZINn8tRziHCcGPQq8g1+mV3QQ1dUEdKSEk+aHCQTeW7Dh535pOXPXHqaeAGe56KERzz0i4OTH7PLhGM+sHPRb9yu69p+HoUmZd39OV9ankwWl4Dh0SzXUKLgly6pS9y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8012

This patch describes the GPIO and EIRQ resources in the SIUL2 pinctrl
node for the S32G2 and S32G3 SoCs.

The rest of the changes from the series - the device tree bindings and
the pinctrl driver changes adding GPIO support - have been applied to
the pin control tree. This patch contains the remaining device tree changes.

Khristine Andreea Barbulescu (1):
  arm64: dts: s32g: describe GPIO and EIRQ resources in SIUL2 pinctrl
    node

 arch/arm64/boot/dts/freescale/s32g2.dtsi | 21 ++++++++++++++++++++-
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 21 ++++++++++++++++++++-
 2 files changed, 40 insertions(+), 2 deletions(-)

-- 
2.34.1

