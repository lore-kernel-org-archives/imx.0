Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013051.outbound.protection.outlook.com [52.101.72.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950A933B970
	for <imx@lists.linux.dev>; Sun, 11 Jan 2026 12:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768135275; cv=fail; b=h9KkcbCTF+QLixhUL6jAkgrv0nR4SUsF5F4cRYvG3ccf30R1qfTyt2khU5anvnuK41qwGZNaCaHjJIpZunZNmjNO2zqQkalvmaKWQsxLrOXm+gLkYYPLeEWi71stcWy4zk+msuRufeyoBZX3V+J+GKEc7Ax6OZjFRQPQs8Z8Z38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768135275; c=relaxed/simple;
	bh=bg+6xAngc0aeUydkivRlt4biVpotbTplWkZkZHKW+5E=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Mnm17RQfw5ebAUrh+8D9bpypP+uhT3mtaepa6PqXE346UejQ+0fbO99eLFQgVn2TM/dzQ7lhc1UR24PSX1pxmz1CpfI80XmhuUHxiO2yBWUemCld/Oeh8L7T7tcDsd6lppGaa2ukWhnLZnatUVUsEikOT4Le8ZUpNJ4n7Fv7JX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=jA+TbJep; arc=fail smtp.client-ip=52.101.72.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="jA+TbJep"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X19krrqcPD784RtypB91U+fOKopEfwAZ4v/7IKIP1F3e4Du0mvMaKJhL6iHoqtMkLkiiOC66ggIzUx3XunAHTHFPl3TeOqvtew1G7g4lgSLoP851msOcIYUxPEn5aAWXHT2q2rYkdNW0R1maqSav4kH/n4IW+E9lYS3NlKaNlFGpmg2kUyW7qnQ6Rz1Get0kfhy77xgA+kAjBvvzWzRJSdUkE6ZnfLA0O/jJaFeVu7vfIqHoxn8F2giwzYo2eeIgLKqOH0weK8xu9UsQqx0xinFp1x3nahERP0NE3H25/CeTTlrbK3R+Moishf3VdtByxTx6jvO04kAaXbjSdKij5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3FcvGJKY8PQljSbuFZrdFCygwyvfmF4F9VYWwuQmcOs=;
 b=kpy5JHGm0Kszh2fEvtVZYPFIgioCgIF0PskYLMLhV1Vc28j/11rnfcZ3s02L0KOUYUe2h3ZVuWZvU3s9iqxoabXgNxuzio55098WuOLhugMaRwwg96LyyU5Bt9Cg+1ji+llAh/15puTUTVJZf+5VNDG6Cq+Jt/rAsJ51skxTHEOe7wbeLN8Qs69iwSBM3bbyQIudhtEmf6evQQakVR7cxehvgvEbmBqb3nQJjEfNfP382OPapei19in3h5I9ZHSGM6w6ld5LSq8TGh/2rBuNW7nrhR07Eo6SVvhYHWNpWbdNJ+WkXB2e24E494ICrwzVYobIPK5A6+3ROegoJiI0jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FcvGJKY8PQljSbuFZrdFCygwyvfmF4F9VYWwuQmcOs=;
 b=jA+TbJeptVT6ww42xxNzOepCg2HFNL/kyvgQc2r8dTwl29K6JBl01r9zUZ3D8h1gtKRKiV3LGPmfWeRlO/CLPy6Q3Q+JjnKB4k3/LsWcEMJ2RJxYMCTOMoy4Q+LcIAMagn3t0bIXUSBFMezjKQUp7ozIYqtxb2If1HmkMZ50qqvh9NTtVXn0riVmFibpNfIfukjZ/MyB2AoxvXGFjW+ZflHZwT+R1tZjp0nSSRvwYy56Eml2WbYFKJ2Fmd0tjjS9jsUPPE2Tl6e3rshW8W9JicVWMcZPNkwoQCl/LFx6DTu8MMbSveT1+hFAaaRGjDhM5j9EbOOsDqysJLkSMIW7OA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB11041.eurprd04.prod.outlook.com (2603:10a6:150:218::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Sun, 11 Jan
 2026 12:40:59 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9499.005; Sun, 11 Jan 2026
 12:40:59 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 11 Jan 2026 20:40:11 +0800
Subject: [PATCH v2 05/10] arm64: dts: imx952-evk: Enable SPI7
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-imx952-dts-v2-v2-5-5773fa57e89e@nxp.com>
References: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com>
In-Reply-To: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:196::18) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB11041:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e789096-21b3-48b1-02d3-08de510eac55
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eVlTakhLNExiVE5KbnoyL1UzbGJKcVplRU5HWEpiWmFSQzU4VjE5bFFrVCtv?=
 =?utf-8?B?TGh0YXI2eGtlT2dZVWEraDN3UWMzcjAwNzBpVkZSSGQ0V014bW54RXdTY00y?=
 =?utf-8?B?dG1iQnhwbmhXeTd5d1ZuUEIrdXJsdXkvVTRSUGxkZ2h1bmEvdlFndHZjTndv?=
 =?utf-8?B?eGt4aG1ZTGw2V1Q0UzhpUVdNOTRQSXJza3k4UXBhSXZ1RWNZTUJLOEZoeDM3?=
 =?utf-8?B?RnA2Tis1L1ZuaGs2dzRVT1V1eFdybkRhK09EUnJtSUxvWjhMTkQ1Q0lFYWhO?=
 =?utf-8?B?YmVyZldpYmY1TkJuYWMzOTRYUG1ucHFjMFVXUlNweUIvT0Y2THlMOWpCbS9U?=
 =?utf-8?B?cys1cUxJMjFYdTU3Zi96R2NFKzhFOHNCbGcxNWRNYWFGTnUxVzdqb0sxbVJJ?=
 =?utf-8?B?TFQ0RzgvY091L2UzZnRkWmVOSlVUV2FLdmg2bnA1RHR4bHRlM1hyazhYb1pw?=
 =?utf-8?B?eU90RGVwQXZybkxITnBKRWVvMkdPYmRjNE9RTy9zZDRiQzRQMkM2ZXV5Uk1p?=
 =?utf-8?B?T2ltTzV2R2Z0Z1FnU3hPajFKcXdDMEtXT1oyNzBxWjQyZjhoKzh5Uml5WXM3?=
 =?utf-8?B?YjhsV3l5UW1vT2c4SEdDNTVIME1VdkpQcjA1VGhmWDNiU2JqMkY5SHRtdFJQ?=
 =?utf-8?B?akpHYjFxcDRuTzZ5VXk0dU9zM29NbFFGYnFJUkVwcWp2T3lreHJOOERlZ1Z1?=
 =?utf-8?B?Z1JTRWFoWms4UVNPNHJmQllWdWxocEx5TEo4VFdkWDAxUi9RaExaRkhKL2VG?=
 =?utf-8?B?NlcveWhwZStoMXNCcnNjSXFES1NzSVZRcG1XRSt6alpwMXNhN2RGME5NNGlO?=
 =?utf-8?B?WEFNUHhqRWhVdm5KKzRGOGFnUCtMMm10a2tzYTMxV1Z4ZFhoWTVzaTZRYW9R?=
 =?utf-8?B?b3k1R3piWnBWSGFPMzN0M2FhditZeFNldDVUc1BDdFRQSmpLMXJPa2pqOU9m?=
 =?utf-8?B?WjhNV1VGM3F2V21aQUNzdE1lR3MybG1wdW1tQjNuR0htNmEra3lQNTA1SVE4?=
 =?utf-8?B?bUdYajhJZ1FQNE1BTmRJZEZTWnpVQ00vcE1hRjJURk1Fc3RTRHBwTStVRlJO?=
 =?utf-8?B?V2IzcWFOUGZXT3hMdHFSWlgyRlEyMzJkVlEvdzYxUUVPcUtpQXNQRVdaN1lP?=
 =?utf-8?B?OTF5cHZMTTYraTErOTJMdG5XV3pKNE14VWxnSEFhRnV0RS9yb0krdGZCcU9i?=
 =?utf-8?B?WFRjNzRjd0NjWUJCNGQxelFLcEx3L1VUTjRYaW4zbFh4a0hCYXYxUk10d0hm?=
 =?utf-8?B?a1VieGxpK1p5dW9QUHY2NWtKS3liR040MDJvOUdhcThEZFdPNGFSV2J6dm5Z?=
 =?utf-8?B?bzdQcGVpdjNrYThBaU11TjJLcUZKcERWcGZxbC9sVDNnQ1lsZkVZcDgzbXFY?=
 =?utf-8?B?N1hDWGswd3k5aEtrcm12UUNDbDRiUElOQWRNdzQxZHNPZlplSTk5ZnZWNm9Q?=
 =?utf-8?B?Q1YrWnE3Y3RUbS9SQnhoWFk3TnlmaDQwY3J3cXcvU3V5M1UrbVp0OGRtMVZR?=
 =?utf-8?B?dHBoRWNBcHo5MGJHRlE1aDRQWVRiZGFPVEpORVJXc1NaTkJqbkhiazIva2dM?=
 =?utf-8?B?bDFqT2FPcjZad0huNk4wcDRNNmVTRHliOVlxL2RjYzgvL1hCMjdnQXlNMTJz?=
 =?utf-8?B?RUdMRUFGQXl0OXVSVDNFWEJ3M2ludWo5YWhscVZ0UTZBWW14R1lnbWxORFk1?=
 =?utf-8?B?cWFLSUNZZHc0QkVBcTdnNE1SRTJiSUNBekUzYVUzeUtGVklrNGx5YlJ4ekNZ?=
 =?utf-8?B?V25rRHI4U2lKUUp4TTZsdXlTaEZOQXNoNlJnQnBkTGhST2k4YTl6K2xsU0RS?=
 =?utf-8?B?V3Y3R0JMVFBVWFpObU5PQ1VvTER1b0VpcnRXY2tlWE1JMUpIeUxhR2NkQ0Rt?=
 =?utf-8?B?cDlnakNEMFM5VzVGRDJ1T1JYcUhGS3dqVklYWkF4NTgzT3N2N1ZlbWtWbHdk?=
 =?utf-8?B?MDgxYXA5MVhseTFLZkJSTXFWZDhOYXUwM0NuZUJWb1lSKzZhWk9JUzlvaUtv?=
 =?utf-8?B?b2x0R3hvclA3L3pXWGNlMFMxbUxsYitMWGEwRTRSYXdKeVFaWGx0ckpWV2JM?=
 =?utf-8?Q?xU4TA2?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QW1GQkhydjYwVDF4RWM0WVB6Ry9OTTJUMzBxSVJUcE50cTN5andSU0pUUmJ3?=
 =?utf-8?B?cmREakRTK1lCQXdlcXUvRmJwNVR3azJJQWI3UWhYY3hqaVFDaW15d3RaYkR6?=
 =?utf-8?B?OGNRWkRFcHhoQlM4cWpydUI5T3cwdUs0UkwybWFLT25Uc3hDTnlFb2Z5cmFD?=
 =?utf-8?B?Yko0NWttaHRyUFg4aDg3cDB2N3BhOERYVVNaYW5rTzdaNXNjb0NnRklmSnh6?=
 =?utf-8?B?andZWUJLdG5TZjFXUzJkOWZhcndSNlozUDRwZjRHODNSM3BHdStHUUZGUHZ1?=
 =?utf-8?B?Tm9KdHZmTFlyellnYzhGQ2srczNrdnNVVzlkMmJiZDc4ZGJYVVhVemZpNVlN?=
 =?utf-8?B?K0NUYzgrOTd3aHk2ZUlGV1psR0ZzVG1sN2owV1B2Nm1jNC8vNEF2SEp0M2lG?=
 =?utf-8?B?dHYxcnR0ZEUvNllOdmE3MW5aOHlJdVpBaUhoc3pIbzFuK3pIWkRwSlF1NHVZ?=
 =?utf-8?B?N3BONDIvUjY0cS9RVlkyRTFadUJiNGVSK0hCOWYrLzYrQmJWTEpwZmFtZlhu?=
 =?utf-8?B?WXkvUXJCMyt3ck91MjEweUhSWGRxamhLT1JXa1NXZHZIbExkckNGcDlHK21S?=
 =?utf-8?B?cE9UeXZYdnpnQ1dRR0wrUlhmTXgwQ1Jack1SZ0crL1U3NE1LSDh5R3ppUFJo?=
 =?utf-8?B?ZE5pb0x1cjlwSXFvL1R5SE11bmNPWEQvZWlwMi9PSGkzdDJYQmphSE1sallB?=
 =?utf-8?B?dkdtVUVDZmVQVkZ1cmxGa2hCRUFyL0FUYUFOeHhjcW5xenJHbTlrQ1BtcnBW?=
 =?utf-8?B?aGtHRzBFbTc1Yk5mQkZzVmpHZzJiTExyNU4ydWx0b2p2Y2dMdjcyWEZxcEtJ?=
 =?utf-8?B?OWtwRjlLUFhpc3RQVHR2SDVJbkJZTHkyLzlrL1JFZjF4bDlOS1diS2V1QmEx?=
 =?utf-8?B?eUpUaTRHYURSbld1ZG13SEpnRitmaFh1MVgvMXlrNk9oUG90ZlpaMEp2ZERh?=
 =?utf-8?B?TFNFQndCdytwWlRkTU9JNXhpMlQydTF4VWlsbFpRY2dDeEQxOXhYL3ZLZEpz?=
 =?utf-8?B?Njl5WVlVUTBkVGY1eUFteStUK2E4eGlyZ0JpOVdnNmluVkplWXVXdTk2RzBZ?=
 =?utf-8?B?VXgzNVhGbHNiRnc3eTNKbWRzUHU3VEVERzFPV3FNRjFYNll2d1M5ZW1oWkg1?=
 =?utf-8?B?YnNWL1JVc2VpajRvNW53LzBtSlNJc1ZqRnJoN0d0TkNjdjFudHlrdWtyTFpt?=
 =?utf-8?B?RlZRaDdxWUVwWUhsQ3gxUjZGVnNJYmFzWkJ3R29zUTN0eEtFWXgwVDhTSFNv?=
 =?utf-8?B?TjNVV1FQN0ROazZLbnkxL0NRNGp0blVFRGxIeGRGRzVwRmdpRlBUajNpTGVY?=
 =?utf-8?B?alZXb0xNUGJqMUlWZFMyT2RranVyMmcvdFJDY2daa3JYRktnOC8zVnB0KzBT?=
 =?utf-8?B?eTA1amdreWJxd1RXM2FuUWVJVXF5bFUyUi9vNnNHZnpPRmprdUVaSngwZHJa?=
 =?utf-8?B?YzlvUmxtWjFzdXdab2JuZ21HWGNTN25DbkQ3dUtkQmtWRmdQSWJzZUpHTHRZ?=
 =?utf-8?B?Q0ViQzU4R3pXT1Y2dkt5eGtPZVNTa2NrUTc5VWJvZlNMVCtIT3hXTkFHR0g4?=
 =?utf-8?B?QktzbGtERkw1Nk1wZjRzZWJLZXpVWjRPL1loZVA2a3IrZ0oyRStNVzNBelhP?=
 =?utf-8?B?N0oxNE5CTGJmVHg4MVlBOWNjT1BJVFFZN1dJdEYzZTg5NWthWUR4TGlJRFFC?=
 =?utf-8?B?Sm90WnA0MU5JZTVsOElQOUxGcW1UVU9YVnFVWiswK2NKZnlaRG84WXc5akNo?=
 =?utf-8?B?S3c0d0pkUmk0c3dYYk1WbU5xV1VHYkVmankvQ2J1MkVnMWgwa3RUanA2RG84?=
 =?utf-8?B?TmJhelkySzU2Uit0blRLTmdwVC9qU1dCVC80QXdvUW43SWxtZVNmN2RFSG5k?=
 =?utf-8?B?MWhLWlRmK3VlKytiWVdLKzR6NmpyVG9IWUpjUDBtM1JaQ0R4c0xkRlpaeTJk?=
 =?utf-8?B?Umkrc1ZxQmlyUUJyYWk4S04yaVVnSjJZNEVnb0hTYlFKRXFyQSs3TU16YWJt?=
 =?utf-8?B?dUQyUkxDSVZrMG9xVWlpUDZUOEl5WUhsZHFxUEFJUlkvSFZzRzBGTGFZeXZ4?=
 =?utf-8?B?bGx1UlhZOFB1VnFRRUU5S0t6Mys1UkhzNkhvUVhmMHZVUDBHTEo4S0l2UUJP?=
 =?utf-8?B?eERsMlhnTk9YZjBtMk9pcW9iY3VHZkZPNUYyb2EvcDAvYU1OQTRNcWFLUjNl?=
 =?utf-8?B?QlVuYUhPeEloUnBueGdSZVZaZzk3N0JoMnVzbkJRSDhZR2NEaENpNGgvYThW?=
 =?utf-8?B?OUh4cTcyb0ROUWZHU0JzejE2YTZuc2QzWkJ3TnlmeUhlajJtRXRWdnlrZjIv?=
 =?utf-8?B?akdqK21ULzJLUDcxNzRkK0xrVnNwVWFwNUxmU0gzWnQ4eTVrV3ptZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e789096-21b3-48b1-02d3-08de510eac55
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2026 12:40:59.6755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +8/9oHaLAGwV/6kyrqnIZ3BIAOMOm0ZLm4cRMvQ17JS7b2QWNlAN476+iwKCxu/+5n//fC9pV2zYUuAVo0V6yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11041

From: Peng Fan <peng.fan@nxp.com>

Enable SPI7 for i.MX952-EVK.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952-evk.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index dcc339b766a21b4f39031cf33673a4fdc6be1937..447aea3cfd079f5ac5689e2461913e43b763bf3d 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -29,6 +29,7 @@ aliases {
 		mmc1 = &usdhc2;
 		serial0 = &lpuart1;
 		serial4 = &lpuart5;
+		spi6 = &lpspi7;
 	};
 
 	chosen {
@@ -211,6 +212,13 @@ bluetooth {
 	};
 };
 
+&lpspi7 {
+	cs-gpios = <&gpio2 4 GPIO_ACTIVE_LOW>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi7>;
+	status = "okay";
+};
+
 &usdhc1 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
 	pinctrl-0 = <&pinctrl_usdhc1>;
@@ -278,6 +286,15 @@ IMX952_PAD_GPIO_IO09__WAKEUPMIX_TOP_LPI2C7_SCL		0x40000b9e
 		>;
 	};
 
+	pinctrl_lpspi7: lpspi7grp {
+		fsl,pins = <
+			IMX952_PAD_GPIO_IO04__WAKEUPMIX_TOP_GPIO2_IO_4		0x39e
+			IMX952_PAD_GPIO_IO05__WAKEUPMIX_TOP_LPSPI7_SIN		0x39e
+			IMX952_PAD_GPIO_IO06__WAKEUPMIX_TOP_LPSPI7_SOUT		0x39e
+			IMX952_PAD_GPIO_IO07__WAKEUPMIX_TOP_LPSPI7_SCK		0x39e
+		>;
+	};
+
 	pinctrl_pcal6416: pcal6416grp {
 		fsl,pins = <
 			IMX952_PAD_GPIO_IO10__WAKEUPMIX_TOP_GPIO2_IO_10		0x31e

-- 
2.37.1

