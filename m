Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2076.outbound.protection.outlook.com [40.107.21.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0366FAD22
	for <imx@lists.linux.dev>; Fri,  4 Nov 2022 19:22:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IEXFVRMWOrWp1wNJgJxS2XhiPidiBFb4OqjHNtJuMEaY2CIwqQbBhRpSS6bT71iOLAHvSh9c+D9IFXY0AwpZscrihS8yXxpA6ecGF3kT5xAESuN4RgVoFKngOob8TWCpAftIxLdS+m8wW3Yi73VqudLmDLMQztCMbBAQWudqr7n3ufZirXemrw8C9M1osO40jsqYDWzFLb2bEiEflL/PvQep+7C/QzvHEqrcgDTBdPu61Aa4/w2alK4SWcO2znz2kWO5kxRc6gYQdAJRndeAQRKdA5SM0knmpSR8oDvqOhaof2wePxCHQ2hpkTPmJ6oEWW+CebMzUul0Lpgd2isTTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=piF7hnOxrB8+5TeYFyGERmInGGiIugoxuFzkPnNEm1w=;
 b=Z53YecX2fpJxYWCn7lJq1JIv87oowAsGdKsTZUIS6N45jpqTS7r9/ql/CK8n2g6YQj9T9AIWFY4efFtqkAoos/ZqngS+TAcDoLMEALaPEaDWGgXyXqJJfV53pHkfdrGSCk1kcJbZgmuRlbx+DfHvOD/XVj5MR5PJ7F4bYfJ8Vy0wuFUYSOS4TKm4aGXNPde03pvLzHQUiWck5nGi2MoXsz6KTEoAb9YVUS1UKfz6U0656NCzrYqkbl8lqxQzYExj75FYsNQNbuEQ1eneUV5AKwlK7vGHLYAdY7u0lOC62aqexH8GQhlXutMgoppGapeTHotCSmEV6ej4eiKWbSl8MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=piF7hnOxrB8+5TeYFyGERmInGGiIugoxuFzkPnNEm1w=;
 b=aupJ91CXMzzrF32q59YDWtOQt7c5yKaP3kyeS+NIRMDTy/DKBaJHkoapKpupdaieE2hIsBINuxZjhBOpUui57eeIgL5e3V8U1BduGJusGOT1MZ+JdTErmJ4XTzpETauz2FvmR735gBuLNyn7y5zTCIziOAFYfyYr1qQp5Z4De8A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from HE1PR0401MB2331.eurprd04.prod.outlook.com (2603:10a6:3:24::22)
 by AS8PR04MB9110.eurprd04.prod.outlook.com (2603:10a6:20b:449::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Fri, 4 Nov
 2022 19:22:45 +0000
Received: from HE1PR0401MB2331.eurprd04.prod.outlook.com
 ([fe80::a405:3557:91bc:9230]) by HE1PR0401MB2331.eurprd04.prod.outlook.com
 ([fe80::a405:3557:91bc:9230%11]) with mapi id 15.20.5791.022; Fri, 4 Nov 2022
 19:22:45 +0000
From: Frank Li <Frank.Li@nxp.com>
To: han.xu@nxp.com
Cc: imx@lists.linux.dev
Subject: [PATCH 0/3] add adc0 flexspi lpspi to 8dxl evk board dts
Date: Fri,  4 Nov 2022 15:21:28 -0400
Message-Id: <20221104192135.1661541-4-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221104192135.1661541-1-Frank.Li@nxp.com>
References: <20221104192135.1661541-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: DM6PR01CA0004.prod.exchangelabs.com (2603:10b6:5:296::9) To
 HE1PR0401MB2331.eurprd04.prod.outlook.com (2603:10a6:3:24::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1PR0401MB2331:EE_|AS8PR04MB9110:EE_
X-MS-Office365-Filtering-Correlation-Id: 03340169-60dc-4558-b4a6-08dabe99f394
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vQppQXnXhncIHrO4TiZQmCd5e1ltk7eulRQmCfzf9yvwj+OfYM9+2zL+DulLZVMkzmAN7FzmPsUqbdsPZ20p0OUsiG/R+zmTIgcGxnXQqc8B+U0vRz2HY320ZUIQkh4ck3XW1mjmKDBcwS0xwavBMiuRE+Q+rd78ZE0XrMXo5743vCFyjR20IswOW/CZjbuwZRw1y2Uhos7n70/e+e3yVjMFpFeGhsuKn/6MD9XDmdfHfGpjFXKOVm8FR69oOjle0AJE2zxGbEmmJIiEqnxfa0VJ5FggQy5dfUc+eYCoTj61FPDdMRnKBjP206LYQhKQiaFOWrUrs4z8Vd9+gLVa96DOtxEnZJNhUxmZTKwaZrWAZv9g82u4q9iBy3dY18zehMC8sW9H+d1qXs0okeTmhkNNcvKdq4peSzwsLc6yBgEmeVwxEsEZEOR7OLAWVtzHgM0JC41mEl7ZNgSjlvtpwedvIzw85wAzCDZksEMHRriiFDt43fUvdp0QRhlMklQ5L53PWxv0LT46gYYxUWQqAZf030FK2+zhzt/U8zTf1sUv+slXMs2e6gqux1ZWy3BTkPvO77lffXB/AHul0kHIKAYnM6elgOgFj4nfPaHpQdsvjgibNejfoNrI++TYEINokmc8cW70YewJiy0OacMix9eWEksWCNrojWwVwhvWa7+7/MeiiGWurgTdLLaIwQuIsygDDqVbpY0gR1tqoNACpn0mnf0wCUNKotlbVcCJDr8sJyU0nTjPH9iW8p0hUeMj/AGrp4EBzBXvl94yW2t1tA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HE1PR0401MB2331.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(39860400002)(376002)(366004)(396003)(451199015)(36756003)(478600001)(2906002)(4744005)(83380400001)(5660300002)(86362001)(38350700002)(6512007)(8676002)(38100700002)(316002)(2616005)(186003)(6486002)(6636002)(1076003)(37006003)(26005)(34206002)(66556008)(66476007)(41300700001)(66946007)(8936002)(6666004)(4326008)(6506007)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?nZ07Z1aTd8vAAhe7wkD1V/UD0HM0IhtzNn2Re83bTlxhDAwOG92a2TO4JutG?=
 =?us-ascii?Q?rmwtqlVScszSJga8HBAbJfWIMj1Kyeh2pVTgGwbmL13eLcrhROiaxk57aLgw?=
 =?us-ascii?Q?l/doSjH9Gwl+xV9x+IV53s9MH/YehDO+fNViMWwIReg9bTISOzlZMzT5OaTA?=
 =?us-ascii?Q?AJD/VpPiU6wAtvjmvKahUu0ldCJAVUmw4DOx27l8x436lHgnyydE+eTekC5E?=
 =?us-ascii?Q?RitQi041w6sgjNjiGHuL133RHE9zf6Nc7Yn/7Ae7NCWSk6h3vlaBUyDGlDpC?=
 =?us-ascii?Q?ivurxbGRJixUeu5eFJB7JjPv3DSvrhh0jt8ErATXqUY+IAhLe/z3yFhgnFpk?=
 =?us-ascii?Q?Gkz4pURcU5t93H1Y3vScxMEtMhGr54Gv/YlxmCnwEqK83PgjSDHUELm4nkzo?=
 =?us-ascii?Q?oO6v4nBPYjgrTdAyP915wRX0Pftm1q+4JakqV03h8u2qv9xO2E0tV2gvwcFE?=
 =?us-ascii?Q?EnAllMNQiHcpWiH2jJB7Bmv9vqA/aIrNeaD5+BPf2kaGeTVC6sIETw9HIIZV?=
 =?us-ascii?Q?A20Gdn2HdNd5rkvUiUtsDodT29RaJafGQ89B8fYC+1+z6MbXlc+vki09jNsX?=
 =?us-ascii?Q?me5C+/kHyYaIo4eZ/jVHpZO+SPHhR7CXP0onDkerQWib9ZNqz5emiC72PJ2k?=
 =?us-ascii?Q?XSeDfFqtXpBBhRZXsxc889GFFyPdf3NX+doAQgySqAdatAH+GpsIJ3cCpK7Q?=
 =?us-ascii?Q?WQ9mwXCMS1YbOJJjQyRbynTiTPw4gPEWYVJS+djCGqokA5SuxWrkfinXuDlP?=
 =?us-ascii?Q?iXRMvIOlLRY43yfG+PXn00HtdPzVrQsgWte263PPB5IDYQ5dWA1sUmCyneSr?=
 =?us-ascii?Q?Ln9gzdmZZ0x8y7srxHC+Bk9RC/WO5i6a2WLpzdGm2K/dxO7KaxCr8jDLPe4E?=
 =?us-ascii?Q?/xWmSu7A8v7hQun17ez57MYrK7cvgSLEc53AW+/zkgJjMv0kNdNerb7S6lJH?=
 =?us-ascii?Q?/zBVpYaEUzpUVjTzpWPnV5F/xf048BQY6Sr/eVhKDEDfTPy/ktgzezKlK/af?=
 =?us-ascii?Q?fXjbc9zzvHudfBi5kRUYmJGv5epVkPCF1XZ41PZouHcCfI9PH9GDy/ca9Pmx?=
 =?us-ascii?Q?RpwWgdlCYQ5Zu3PtfLF94X4CmKXTIRgvQKlEyxrr8cSnYpJjnUbFfyl8KCaf?=
 =?us-ascii?Q?mLI1xLQcyzT0ZxNIi+k+IOjMlGuvK4aHyb1OvEv1M/cRMPsaj5kkC83F2JaE?=
 =?us-ascii?Q?+tarB2J4ukkoQP8Pi4Ul47Lh19wv8LdBjC/mrHs0qhMUMhgZl7hksvVeCFvH?=
 =?us-ascii?Q?gEt3CUzQKqTE/lBt50M2h9Loy+C08d1XkbyRtguk/XUlzgq3qVGXEyAj+jQ3?=
 =?us-ascii?Q?ZU53YqPNrQd9aJN5mm0aSWSgEOgZ3J3fKTgYvWmtlR1lNp06dwqTHOJqNVqA?=
 =?us-ascii?Q?uoZwg4cFZjTtYMfPMyY5KqlAqaSVtNyK8EOB/gGovaZW2gwHaycEiPf8Mlpx?=
 =?us-ascii?Q?a56ckX0iUhkiR8Di7lD6SGcBobhI6zxI0pa8lGU4WJ7A+quFoYH0Z0Xo+cNH?=
 =?us-ascii?Q?85CcEVKrRt2PBfzfiPCds5fWKul7VwPyYaebwdGisdjp4eG9pmzAe6OCm3Ji?=
 =?us-ascii?Q?PpH8pklsPXDhmE/UF/VODZii9JY7u1dkEqe9LnTS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03340169-60dc-4558-b4a6-08dabe99f394
X-MS-Exchange-CrossTenant-AuthSource: HE1PR0401MB2331.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2022 19:22:45.5607
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KFloAEuOgpfYKIbwXDYwfP8HhxEalf25N9DGs1quMrL19G5g53GIKsjj27vJyUdVMhK/WyCilzbNLPhGTMVs/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9110

Add adc0 flexspi lpspi and adc to 8dxl evk board dts

Frank Li (3):
  arm64: dts: imx8dxl: add adc0 and adc1 support
  arm64: dts: imx8dxl: add flexspi support
  arm64: dts: imx8dxl: add lpspi support

 .../arm64/boot/dts/freescale/imx8-ss-dma.dtsi | 164 ++++++++++++++++++
 .../boot/dts/freescale/imx8-ss-lsio.dtsi      |  17 +-
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts |  63 +++++++
 .../boot/dts/freescale/imx8dxl-ss-adma.dtsi   |   4 +
 .../boot/dts/freescale/imx8dxl-ss-lsio.dtsi   |   5 +
 5 files changed, 252 insertions(+), 1 deletion(-)

-- 
2.34.1

