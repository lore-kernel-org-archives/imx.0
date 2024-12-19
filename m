Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2081.outbound.protection.outlook.com [40.107.104.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 023B8222D6B
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 14:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734618354; cv=fail; b=VnzUGAssHQdH4i+8ImzW2iGcjwhNvy24SlQhDtDyV+IqaKxSp0oNM7MxqzXzLllYWiooRE2+x/QYQp8ax/K59ni3V/8FmFmsXmjBaOPnao4EW0UuAIbaZljo/P8/i4yWWcLndKnE9rxtReIgERFfa9idAIkkY6IGUzSsE/Xj4ZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734618354; c=relaxed/simple;
	bh=0GQrZe6HNWbn7RJu9FBiIh8HYZRLm/OirKtagERSiQk=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=s4ydFi8T/dTS9muWj9/TPEU3Vzu4JWmGahBUov60P+G4pIB0w9z4Exm/6t4IsjBQSKBSYJneJpqeLwkQItJlD0PNAY35RSdVA1zLeu2+kRDbwC4+zYPaFQu8894nLresebqB1UP7/LYcAIG09XOUmzC4+VqPAwrgkwD9bTIu+EA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pWjy9Zxk; arc=fail smtp.client-ip=40.107.104.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pWjy9Zxk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H0bKrSmlhfKu0/yycmayoBDUeyetMR62QOkxhmZ0yoAo5vHlMrlQbmPs50ug3Fju/gUq15LeMxbhB3eIPx7wh6ZCJplVqwcHuHwgW07ZfQoWXCJM1FBAD7TCYztPwGuVoIu6ULFAsQHkxHQOTD4BtSbASbgpOxOBnBMpPBTAB80qNDs02Mycb8QqkSKk7WZjHC5RfVBdwE+NnCRvG4QPnmzZMuEE4p1brPFiJnR1IrH8VdwhPdfNEHMIJQD/+CzXDUbKmDzGpaDappegoTyordJ0uC9lPJq94R9jrcdeJEvOWGieNJu8LKRfQ+pYFychp1J4lSFypQRoY6ut/5YuXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7Z60RgDa/a2gj95a/zvtoiqKycskB/G54sm0Qv9tPI=;
 b=aSgUZ6BCAQXgZBRkCRHywLQx+1xCpXbxmg1lhUlqkVVmE/m6rEnFcl3yL/us4W/aeFpy9gNPUBORR8Y2pxKHToGSzyLfbtbFCeBsmazvTIVr35XR13gxUwRnvOOxA1KlUKZRsohauE3lAnLG+FbN99aCey3pc3EJ7PTzXhEyP19JXr7dUASPmUdgAsyjX6VgA5T3iKGdn9ov2SdkX7K+NMTabwyu1foUc3Y7xGzxibELdAhhPALdpPtgLdD1zMdIKGd8UjTU0yP31/RiLTTn/JXQ8B/2JcMitPYKfx8eNtr2feX0rYU0ufFaEpCZVbPO9FXaLBGnZunZt1bAEqwumw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7Z60RgDa/a2gj95a/zvtoiqKycskB/G54sm0Qv9tPI=;
 b=pWjy9ZxkDaTN4AgwNIlW+/B7YiwQ95wXfkkxKX1QIICTL9wa3FrJWNjM3k8zjou+vE+hyleo66DlT2bkzt3Q4IvlRKPvEoBF3SsJLhCnNFrSda8iYwzQERSH4S0c1wGtyBkMm5eE9H5o0ftwFJ+EbI/mS+DEnEXebgfMRmo5yxycPkCCGP58ShmmMTd0GAOdSgUSJgMdGAi129mMTZroNhWJrrfSGDHN7x/zftzLGvO08czLdhr39Q+zV35+B0AVTBcd0RC5W6/r7IWVncnMxDTV+4Rj7v6CHrAFPJgUSOILKN8Fkdj6XV0cRQvbmP+Nf/BtnaCj+pHSHmaaITHy0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU2PR04MB8950.eurprd04.prod.outlook.com (2603:10a6:10:2e1::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 14:25:49 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 14:25:48 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH v3 0/2] Make i.MX9 OCOTP work as accessing controller
Date: Thu, 19 Dec 2024 22:25:16 +0800
Message-Id: <20241219-imx-ocotp-v3-0-b22371098071@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMwsZGcC/22MQQ6CMBBFr0JmbU2nVERX3sO4aGtHZgElLWkwh
 Ltb2OjC5fv57y2QfGSf4FotEH3mxGEoUB8qcJ0ZXl7wszAoqTQqVIL7WQQXplE466mWGrWkE5T
 /GD3xvLfuj8IdpynE957OuK3/KhmFFHhprZWG2sbI2zCPRxd62BpZ/XrnX08VryZjGmeJNNqvt
 67rBzf3LvDYAAAA
X-Change-ID: 20241212-imx-ocotp-cbef304140f5
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734618328; l=2294;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=0GQrZe6HNWbn7RJu9FBiIh8HYZRLm/OirKtagERSiQk=;
 b=oBzaFkLgEA3wVxZG+QAIrpnDQ1iJyee5r2mHdHxOxS+3tfAUOazapdM+BcssyP9EXpq0Nla9F
 XJHGCaAahAdBryyMY1iVzVPob55LEskt+7cjKORQbpD3IPwa8gM6YuX
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI1PR02CA0054.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU2PR04MB8950:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d3644af-8ec9-4561-5314-08dd20390888
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RHF4YUFRdFpzZGV0WjBEQ0h2T3h2OGdneUc3VnFmdnkwL0p6MS9sQm9tMEsz?=
 =?utf-8?B?MlZBNS9EMzhNMnl1Wkx0bU1oWkQ1bkNwdEpEdzluUzBGVnR6Y3c3bytSNDVW?=
 =?utf-8?B?OEFKT2NuKzVwblVDMUk1VExqTW9FRDR6SnVEL3N6UHcxU1FLcW5FaGw5b3RX?=
 =?utf-8?B?L0NBOFEwdTRqbmI2aU1zQUNMSFdpcHJlc24rdzlhb25XMUdWZkZBNXRrZ203?=
 =?utf-8?B?SjFYOUIxKzJqTm1HRE5lSDlpZlNFVVoxd3lENG85WDRWWUt0bmNuVm9SaEpZ?=
 =?utf-8?B?TG1nQkcxdUdQWExZdWZKaGFobS9GMEVUNmVIZmV2dXZ3SmRNUExIU25vNmRr?=
 =?utf-8?B?M3lmZlBLRzZXTFJ1Zi9mMnczbWpraHNUdHNxT0hLM2lqVWVtYWJ4LzhBVjVU?=
 =?utf-8?B?WXZFdGVGTWs5bWZsKzV3a0xibkhESWtPZFJuTkZhSXJsUm0wVk4yN2g2VWIy?=
 =?utf-8?B?bFg0bFRvR0JxamNPWTJWNnJLWSs5aDNkZFY4OU9VbTVvMGhEMUJVbGVWeWRO?=
 =?utf-8?B?KzJva0VLYStVMmozSjBVUVNZdGo0akJsTmpCNmQwc2MyZzVMdnRocDJET1lv?=
 =?utf-8?B?S25sYUdLeWU1ckZZZXlWb2R5S3F6VWZub3JRTG1BZEYwQXp1VmNGdk5kdHdW?=
 =?utf-8?B?U2N0UFZSVFZPakp2VGRRUmw4SDJPcEJCUm5pRGwrN0ZIWGdQUythWEg5NzI5?=
 =?utf-8?B?VDZtMU8wTm15QUJQczA2WUlvanpNVFc3a2EzY3RhZ2U0THBOWllwc2FtdWV2?=
 =?utf-8?B?YThYSlhyUjNTUWo3eXJoSUo0UUlNTmJEWFUzcUd5SjBBOUhjd0JuQnFQOG1z?=
 =?utf-8?B?YnIxSDVqUHFhY0RWTnBZUkZIZk0zd0gvZUg5ejZjdDUxOWJjenpPZFNXWlBj?=
 =?utf-8?B?RU1YTWVYUE1wZnArakhqaWN1TnNmV1paamttdzNVRXFzRTRUT3lsSFlhb1VW?=
 =?utf-8?B?S0pJVE1jdStVUWRnVlgvSFJ5bEVqRFFEMm12SzV6MCtvcEVBVG92NWMwTGpH?=
 =?utf-8?B?aFZVMENwMXBGUHJaSHdKMER1VVJNQjlEbzIzQkI3VVNPN2tWcWFjOTFKcWhB?=
 =?utf-8?B?RjNDVC9oVEpaNVBaY01Tbis2NmlmVmpvUDFkZkR2WWk3NUtaQjhpTFdkUk1I?=
 =?utf-8?B?OTljSXNzeFlNdzdiRVdDalpxSUgwZnl4V3laRWFrbi8zNTAxMWlKclA3TnJB?=
 =?utf-8?B?V2RIZVhBeGJhRlZWdTF5ZEhheDY5cGVCdmsvdk4xeFNDV2crVGZKK2tFcTFN?=
 =?utf-8?B?bFRSNTRzclhiVnVReDVHSVJrUzRESms2MENpNis1TDBmQk1rWHUzRGp3WWVO?=
 =?utf-8?B?Q1hwK0JOa1JBNTY4eWJTSTlPcXMyQVpYd3NaUzZQN0FkaEtwbkJza2RHeFJK?=
 =?utf-8?B?TnFxckladXBaODBzRktrdnB1bWVlazVRSHdVVjFkWjE5dksvRU1hRFp2Wk5z?=
 =?utf-8?B?dklEbldrU1ZTN0JxTkdJSStoWVg3Mzh0T252WksyMUY2QXJaRmFFdFN4QStJ?=
 =?utf-8?B?L2hzVWRPT29kSHZBRkplM094NGlOeEVGZzY2bkJ3bklDYTI3d250YzhnTFYz?=
 =?utf-8?B?ZDVleDFpekprOXV2UHQxTzVJckJTaE4xaHNKWmEzcXFnZmpXbU5sK1p1VkJx?=
 =?utf-8?B?Yy9YVVR5WEhWb292cTNkdnBMUDExWkFlVWdyTFJFeWpJZUEyM2Q3RXVER1Z2?=
 =?utf-8?B?eGo0bGY0QUY1eUtrNnR4SnBvMmJ5RHBOakYwQ0hhL202M25XcE9iOHJnMUFY?=
 =?utf-8?B?b2g0NFBLcEp5UG1Yek56dVFxV2gvMnJDaHV0MVVpTEFuVlRibGREMytIb29p?=
 =?utf-8?B?L0xBVExCOTc2MjV2QW9MSGQyMlR2bVhzZWxjd0NhOWxPZzhlL1ZkVnIxYzRs?=
 =?utf-8?B?MWtERFFDeElJM0pVZTZ6ZjVKbG9XZDhSVmtGN2VqMjhhMEJzaGJqakduK2ZQ?=
 =?utf-8?B?RkEvd0dNQytnMVZjYklGc085Y3VXOGVtb21YNGczeURwYzJ0Si83TkxOSjRr?=
 =?utf-8?B?eVZJdG1ZRXN3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dTJDNmdxZ0dpMkhKbzRwK3RhTzNOSU1rRTNQelppUWR1cDUvcVVJSnFFWkw0?=
 =?utf-8?B?Q2VSUE9TZGVRL21wUzh0UGlsQVRjdER4SXNWK1IrMklEWUxPc1dpWmJuZ1dV?=
 =?utf-8?B?TmVLZ0VlWGZVNWZBbExYOTh1Q0F3OHZ6d0hGS0sxbG5pdVYzY1ovMjZnbzhL?=
 =?utf-8?B?bEhBaFVHRFN0TndaSTBTZW5kempkeUJLeWkzSFF1U2xHajFIYlpNaGRUOWkw?=
 =?utf-8?B?L3E3b3dVdU5VRHI2NlU5TU9uWmt0b1pkWHdDd0hEMGpGU1pOUWZVd01lTFZB?=
 =?utf-8?B?NGxZRm5iNDlKT2FZZ0FzS1JIUWV3Qm5rRm5FeWo4MUV0eGNyTG0vMVlETUgz?=
 =?utf-8?B?NXNqcmZvUkRaNEE1V201MU1ua1g5NUJ2eHp6bjU4TDBPemlHdjY1aTB0OWhp?=
 =?utf-8?B?b2RYcEpKZy9FVWwrdTQvVG5vTlV0RThkY2VvZEtmck9iT1V6M0tnN0ZRZHhY?=
 =?utf-8?B?dE5iZFZSUGdmaW9uSWhqRUZsWDk0ekIvVWtCTWwvMUN1LzMvZDRYTEticFFI?=
 =?utf-8?B?MlA5cW1UVWVvSnp1TiszaE9rMys0YmF4N09ialdYU3J3N2QrazV2cWpabnpw?=
 =?utf-8?B?Y2dCbTV3MDFPSHU0RFVwZ1RoUUVjcWpYa0kxMVhzZlpzWWpnZDNUZUNseHY4?=
 =?utf-8?B?YjJiVW1rYXU3VWZWRldPS3NQY2FyRWR4dzk3TGpOZWhsRFo4dUxrKzFNcVlJ?=
 =?utf-8?B?UWRWZWUyTFViRFY1bHl2c2J3Qm9JU1RiQldWcnFaUFh4MXRhcWlHWHAyM3d1?=
 =?utf-8?B?Wkk3ZkNyWnhZRnhrVFQ0Q29MTUlJQXVFenJCNmVaTXdkY0Z2alhjWXByb2Yr?=
 =?utf-8?B?TkpadHlzWkpUVEhxTE85TlpDb0VKUWxKRi9BdGErSDMxN295L3NCVWRUWUVS?=
 =?utf-8?B?TEcxZXhMZ0xKK08wTERCTkZ3aTVnSkN2OGo2SzlGQUN1REk2cUJCZnhzaThY?=
 =?utf-8?B?UVZ3K1ZRamtEMVlxYlVhT2gwTnA5MXd2RlRPVkdHMFRYVVRuUlNkOFJyWnlH?=
 =?utf-8?B?NzN2YTNFWnRaNm1qZlU3VVpvMU9FUjc2d2huZmZDVW96bjZtQnNuZm5yUndr?=
 =?utf-8?B?TVlPQWVmM1BWMkl1aldNMTFVVTJTWkZmSExHd09uZ0I4S1ZXWjNsbm0zL3Qr?=
 =?utf-8?B?OEpadTNoaG0xTldPQWhFQ1JoNUhMV0ZEb2V2RDhLTHllVEN6NGtxcnhhaklB?=
 =?utf-8?B?L3dVQ01TSEM3elMreGpiK0FidkNwZ0Qya25sZ1huZnFrVlU4YitPRnN2cGRK?=
 =?utf-8?B?alRQMTQvKzhZVjBPRE12bmVRKzhZTWJWcVd0eWFUSDBlWEZ0SXVLMlZRUy81?=
 =?utf-8?B?K0JOemgzNzNBQkNRYVFuTEJRcnhWOFN2S1ZaNFcyK2dWUzBScVZubGNlY2oz?=
 =?utf-8?B?MnZ2MG5xejR1VzZPRFJxZStyL3RCTVl6Z1VEMTVhWXgvS1c4cHdRM2RZaXpS?=
 =?utf-8?B?YlFHcFlIbVh6VUFybUpVMWZxc3l3U2J2UEFoMzJoK0FTRzJGYVNoWmRYaDdm?=
 =?utf-8?B?Zm8vb28yaDBPSmVScjVmeUF0Z1VoOElzMlRZSGdSYzN6ZERrWGxRc0RmWVdK?=
 =?utf-8?B?ekxGS28zWlhMbVBPT2lFWllpQ1ZKMGg1VjFCSFh4SzE2Tko4V3cyWS9VdFpF?=
 =?utf-8?B?ZWRaTE9wcnIxYWRpTFdrNXZkWXhmbTFXSUVXWncwREdpN0FkR2l0MHQxQWdZ?=
 =?utf-8?B?SkxkZy9VNS9BYWI2bWs1b0dLeGZ3dzFuZkV5Z3R5OVFhQm1HQ1o3bnpYcjYz?=
 =?utf-8?B?Y0VYREwvbHo0bXZIa1ZxRjE4aUdGYmVURklPRFI0RkYrQVJkK0ZtRko4UXdF?=
 =?utf-8?B?L0FOdklSVms4S3E2RzZWYTlPVm0zbHUxcmlCaXNkeXlYOUkxT1g0b2tpbzZ4?=
 =?utf-8?B?Wng0SkliVWNLMWRBLzRjYkFxbTN4Nlg4TTQ0OVlmWGcwdXhIUHcyOTdnRWhD?=
 =?utf-8?B?dHc3WkJhYjZBTkhKbEYvZjlqYkxXbFZJWFhIVlhLK3BiUkZuZFcxcVp2TTd4?=
 =?utf-8?B?dGVaNzUrVGJBWFBPTE1wYnpBMkZYTENxdTZJdThpK1R5cWZyd2lDeGpLM2hx?=
 =?utf-8?B?cnFqNmxqNXdxZndxek5aMUJiaGVid2RDelUvREVyeG9OUnl5RXBQNnJhbmNw?=
 =?utf-8?Q?DKgx9eL5gOhCxtRsGZ+goQ21j?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d3644af-8ec9-4561-5314-08dd20390888
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 14:25:48.6747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YCLNDlnAgNJO/4hlzFzj9MFUGcOIi6eEGe2m6QJwJx1yD8xjIMhzTL/lAzU+e7A27J6Yd1MTcY1ANdPCpwk7RQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8950

Previously there was discussion on using "feature-controller" or
adding a specific node to group the fuse information for U-Boot to
parse and update node. But rejected by DT maintainer(Rob).

Since the STM32 engineers added access controller concept and landed
the support in Linux Kernel, reuse the concept for i.MX.

i.MX OCOTP eFuse has some bits to indicate a specific periphral or
function is avaiable for current chip, for example i.MX93 has variants
that not have NPU. So introduce '#access-controller-cells' for OCOTP,
and add "#access-controllers = <&ocotp [gate_index]>" for periphrals
that needs accessing control checking.

In OCOTP driver, the nodes under "/" will be iterated, and checked
if property "#access-controllers" exsits. If not allow access, detach
the node.

In the end, cpu nodes should still be handled by bootloader.
And I may also update i.MX8M to use same method to support variants
if this patchset is good.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v3:
- Add A-b for patch 1
- Use scoped API when iterate nodes and address build warning in patch 2
- I am also thinking that to drop patch 2 to let
 bootloader to iterate the nodes that have access-controllers property and
 update the nodes before booting the kernel. Then just need patch 1 for
 the binding updates. Anyway, comments are welcomed.
- Link to v2: https://lore.kernel.org/r/20241217-imx-ocotp-v2-0-3faa6cbff41b@nxp.com

Changes in v2:
- Add R-b for patch 1
- Use '/' root node instead of '/soc' or '/soc@0' for patch 2
- Link to v1: https://lore.kernel.org/r/20241212-imx-ocotp-v1-0-198bb0af86a0@nxp.com

---
Peng Fan (2):
      dt-bindings: nvmem: imx-ocotp: Introduce #access-controller-cells
      nvmem: imx-ocotp-ele: Support accessing controller for i.MX9

 .../devicetree/bindings/nvmem/imx-ocotp.yaml       |   5 +
 drivers/nvmem/imx-ocotp-ele.c                      | 183 ++++++++++++++++++++-
 include/dt-bindings/nvmem/fsl,imx93-ocotp.h        |  24 +++
 include/dt-bindings/nvmem/fsl,imx95-ocotp.h        |  43 +++++
 4 files changed, 254 insertions(+), 1 deletion(-)
---
base-commit: 6d13015b67d58ddba56631c56e0a6f376ade0867
change-id: 20241212-imx-ocotp-cbef304140f5

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

