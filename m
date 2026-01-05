Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011008.outbound.protection.outlook.com [52.101.70.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EB3326944
	for <imx@lists.linux.dev>; Mon,  5 Jan 2026 11:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767613765; cv=fail; b=nYTQHEq4sG1+aSX2DmOInfEbFuR6udIVgh+nwSoPICX7UMU2SbzdUkvWYKQ5QBnBwlNBaOnVCqvXGc3scDp04Si+IYhdlOE8+09YuTiCBLSQex6z5YXgdyybNXY2mxua7svC+ii/jCtGuCdt8/fmEArbuzO9N84mk3v42gAXMHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767613765; c=relaxed/simple;
	bh=egDDytwOKCRvcUzLjao8SiuOyr97bkZQRosqmvuYJRk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kjuczV7o8u2i22RnDO54qhBiNILT+ahBN6Rvzv5ikLFdE9RN+7jso+klbBnZAmAUGIowDEulQPbWAXjsWYK54vSNyA8U4ZJsRYsrOdejuySPpc/mk3qn/BvEnB6K3FYBxIdLeDc0E55J0dbpFX53eGydEGt10jLOvwHgmEwxXLE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Bcqtf2fA; arc=fail smtp.client-ip=52.101.70.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Bcqtf2fA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ItLYF9i/xTehXdSYMHsSxHU9nZX3Bmt7S8o5FO/lAQ4tyACrU7VaPJrFt4IiyslHG5iu8q5E5GQy146Kjf5FAJ5V5sTqPkdZrUC/+4CwVZLj493btIUdwBtmuv1ITVBCD0yeGTjJFuGVG7S4OSmk6ukYjDM3MRJ9BSRU6ukI98YndUd9s8Oeo4zEPZbiiZy+hAWbfAVy7o093gxZhtEAlXvgGGqOy2UWnCn9Y5glSEjOtcDy0UPYAcGDBi6RBVK3R5eLBLMyTYteX65oPFsZp32UbUK4G6OqO46yV1Z5kv4VI2QS8+N+rF1pfegC0xwAqLnaSpJqasMawXcidGmJ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7qPWsv2I1ZyPHdGhat+On2lQgN8OvYYPkM+7Uqw0ks=;
 b=YwDKH7GoI3rAqsDY2fV3r4VLhRe/x0Cj4aQUxQwOIQFV3CaDMtNT61HnUNxAvxlrDL6B+SxTJiz/F12QVihyIRWK6ycca29AgmJTKdn9IX5ZdyL4TV2631bDua1mneYqjLiOIUZLIlDywme8D1CoFqgqHNrKpxVa6NnDLkM8nL3wsh9dqlKDyKjJwGQaNcVLim1GBoR+qSjw/GjOT3nAfye2qzkjmBomXpYIG9XrnCVzdpnzcux+XpPodCUqglTo9VXyFcPxatrVplRycNA58pTOPHHwAQs4qUdB1bs/xg2c9EXB7JJgv07GyhQfmyRxccXfhb7adCes8oAcsEd1xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T7qPWsv2I1ZyPHdGhat+On2lQgN8OvYYPkM+7Uqw0ks=;
 b=Bcqtf2fAIJxiJeY0HSaaKoTDiqljtPnOAapTRk9XVyF0FXFQUQ2yYDA+67wKBJlYc6YVcOgCkvKjJxFmPZmhaqLvP/bwBZb5NDGkOL8dv/Su9bIb6tb3AU3Gks8LfqfHn4O0LkP8hPAOH0a4M9Vshe8wXjQjb8Ald/UKyKYYCednxUQxbKRt7V0Fvpep7i0T/prWjhKAmoBGtVgnoKAqV3Dnzjf3Tjhmv8mXu6QLU/MVl2Dnqu2wFAJUSpeB3rrvwwX7fzwTSePox5t+CdpmzWr9RZ83Yc+yqqSIxmQ4svvtYja3aQWT66k5waWmUoVd+6Z6Z+ocqS2yiUPgnjna/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB9878.eurprd04.prod.outlook.com (2603:10a6:150:116::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 11:49:21 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9478.004; Mon, 5 Jan 2026
 11:49:21 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 05 Jan 2026 19:48:44 +0800
Subject: [PATCH 5/7] arm64: dts: imx952-evk: Enable USB[1,2]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-imx952-dts-v1-5-68b5a4d69710@nxp.com>
References: <20260105-imx952-dts-v1-0-68b5a4d69710@nxp.com>
In-Reply-To: <20260105-imx952-dts-v1-0-68b5a4d69710@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB9878:EE_
X-MS-Office365-Filtering-Correlation-Id: 910bab61-567e-4faa-296c-08de4c507722
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YTFTS3ZYbzhuTnFZRWtRalNGNThkWEMvME5UYVovakkwQnVRa3lrSjdrb2Fk?=
 =?utf-8?B?ZE00MFY2MkZCLzMxOUhXcGZZMzZMdUt2bTVVZjdSL0thS2JiaXVyTEJyTUo0?=
 =?utf-8?B?dk1tRHBnL1daYmtpb0R0SjBVWTR5cjI1VXZnVElpdWZxV3h3NThJWDZDRzNq?=
 =?utf-8?B?cmo3ME41VkJzNjlseTE5Z3V1Y3ZrR2NpQWtaSmVIMzZwZ21IQUl6NzFVcjY4?=
 =?utf-8?B?Wkh4Zk5OdVQwM01mekc5YnM3K0lleEdncTErMDdsU0o4TEdmK1FPYVJjcHJt?=
 =?utf-8?B?YjdrV1QxVld6ZFoxbEN4QW93R1RVREF3Rkl1elIyVTI3U2hmU2JYUDA0U0Qw?=
 =?utf-8?B?NHp3azZKbUxLWFkyNWpVZE1GenphMGt3Ri9uc1dJdTBGN1NxTmU1M05tRE1X?=
 =?utf-8?B?eG9SeEdRd0tEcTlHTFowN1VoL1JBdVVpeEhPTWk1dTZkSXZ6dG5BR0QzTnV6?=
 =?utf-8?B?T1NRamVmVTN3QUh5aEgyWjNZNmdSbUFTbXUvU0lnU0FyNXJka1BiMVpnemZ2?=
 =?utf-8?B?R2tiUWVwTzh5WkZmYUxyajM5Y3I2RlVhU2hyOHlRNEJoUDl0YW9JZkZrenNW?=
 =?utf-8?B?eGxibjNvSkN1ajJuaUZXZFZUeWxFL2NONGRsOFVwVDIySWJjTGpRL2Q5QUhx?=
 =?utf-8?B?Y0lyVXFGUHdEem1GU0ozWlVIT1Q4YTRtMVJjcE5EZ2IwbnhKWDMyZ1NCSE1k?=
 =?utf-8?B?M1UwbGowUjM1bVc3N3ZHZmNPVDdVeDR1L3ArcWNaT0d5MXRYeis1TTcwSDZ1?=
 =?utf-8?B?K0tydzVhbk9HSUxOTkt4bHpUb2hwZ0pLYjQvelJXQ0NSTFpncVpBRFFIYU9h?=
 =?utf-8?B?MEZSZlZqcFp1b3J6SWx4ajM3dmREWlJFd1AyNnVyL0NpK3ZqZ0FVVWZVVjA1?=
 =?utf-8?B?T3FucnNob3E5TU9LUTY1VGRIZE12eHhvMnVQUjVPeEJoQlBtajdGV2VHS0pL?=
 =?utf-8?B?Y1FtTG9WcDNKVE4zVGNwNTdlWk1TNDUwdEpRaGlyZXBSaWJDK2xNUlhyZllI?=
 =?utf-8?B?a0RmcERrTWVWQ2FwS1YxaVdDS3NOUXRqZkthS1dPT1ZuRTQwU20yYXhQR3ph?=
 =?utf-8?B?RG5RSnlsNm1zOCtDT3dNdzhCRWRJS0c4N3J4cVpXbTFwQUM3aDFpN2lmSG9x?=
 =?utf-8?B?MG1Tc0l6R1N2TnMxenpzVy9sZnpieUc5OG5ydmNZbmlwUTdIYzVjR0lVbnJJ?=
 =?utf-8?B?cnhmY0l4NTN4Tm04VGt6cHBHQWJFcFdoODZvTWNYaDFlR1ZrZG4rZG1mTm5X?=
 =?utf-8?B?Q2F6ZFRnZjF5NzY2ZFIzTzUxSVc3Mkc5TUQ0L0RvV2lsdUpOd2c4YjlBUjB6?=
 =?utf-8?B?UWtNWU11SFRLRVlnUXNBRE8rN0R2UnNPalVUTStsMDBLNmxFb1VXTXFsUWNO?=
 =?utf-8?B?b3ZqSnkwUmo1SVJPQ0FBMnNlTzU2UWJyTUhTL3dpTjI5NklDRHN2L0NIRFhv?=
 =?utf-8?B?TTZRdUxpOHlGZWJPcHhDWkRmZGYwSW9lZHZZYmhQa0VFWHVXUTBFR1FBS0My?=
 =?utf-8?B?NW51WHN6MXBZQ2grZUEvUzg0VTk0NXBwcHE0dkZRVGtoeUVJb2FPVXVPN0Jq?=
 =?utf-8?B?TjBrZXdIRHlyVEJoR0N2SmtpZ0N5RjFwZTRScXpMeTBqRFZJazNpakV5RHdy?=
 =?utf-8?B?b2tUUE9jbVVueVpmeUowVEtxRGlVa212VDRRZVNpL0RkVmU3SFdVUWdQWVl3?=
 =?utf-8?B?Y3FTcW16ZVZNM3puK24yQVlhWk1YeUdaUzNzZFVlU2gwaTl0aW9lUVJrc1ZC?=
 =?utf-8?B?MlIxRHY2TENGaVg0N1Z0UnZRU3JkUUx4eVpjRll5K29DYmZHVnZOV3JRSEdh?=
 =?utf-8?B?enVGbzRxOGlvbUlESjRNMitabkRLeHJPcGxuWEQ1UGRFWXNsRHl5bTdmeEFK?=
 =?utf-8?B?Y2RPRHlYKzBDR3Qrc3JHVUJwTC9xTkFsd2U2c1IxZlhmaGh1YWcwdUNnQ2x4?=
 =?utf-8?B?T3ZjcS9jS01SdUUrclVOdk53c3o5Mlc4UzhLN3E0NTdWSVBXZVpuVjNXQUlj?=
 =?utf-8?B?cEwzNk14M3QxYVhsTnFTbUs4WUJtUytZb0J4VWJ5bFNwS0c1azEydnVmN2JD?=
 =?utf-8?Q?pOif5z?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bVVnZzViV0h6UnFWZVJmRWdsbDVLNXNLaVVGSVJOc3RNTXNiV2YvcFlwdUg2?=
 =?utf-8?B?UXpMOCtMa1o4eUlFakRpWW1oUHdpZ2FtS1had2dBbWJUNGNSSXAxYkh3SHIz?=
 =?utf-8?B?V1dWeFFudlJNd2Nrb2ozNjI3aVgydFJ2R2daT0ljaEh1MlNvTFhqcTd6Z0ZX?=
 =?utf-8?B?cksvRFVyS08zblNqQmUzRGJaeFpzVE4wTmQvU0xGNGE5eVh0SlJDV0ZqVGlu?=
 =?utf-8?B?ZWdwTHY1MjFXeTY5eEVMb0gwWmZwNnIzZ29xVmlkQ0Zxb3Bhb1ZHeUYvT1lp?=
 =?utf-8?B?dzhJS0lmOUtDUFQ4OHAxT2FhOUhIdlRVbXZKc1JLdmI3dEdzekt0eXJMcmJn?=
 =?utf-8?B?ZDJmTEl1QlpnRjV6anZFbWNTaHRNeXlaaFY2dEtCRnNCNmx5ZGJvT0JyUys2?=
 =?utf-8?B?L2lBSnNjZkF6bjQzK0J1R1k3bXgxR0pkSC9LNkRmYUg1UUxFUTZ5eGZzL0U2?=
 =?utf-8?B?d1ZwelUyM28vL3cybWdpWUdWKzQvbUR3K216VjFoVndGb3hGVExraDN5aUVr?=
 =?utf-8?B?ZHNuTE9Xb254dlh2NjlKdUNpY09jZUZQK3M0N2pzazB0OFBTd0dseGc5L2Jy?=
 =?utf-8?B?UFNqa2hWdlNUckdtY1pqOEFKMWxQd2FwTVFrTStJS25lWGFSZ3I3SHpDUmJk?=
 =?utf-8?B?SDBQb2R1TVNoS0xCQkNCM1FQYlRHSTl6T2lUdjAzeHNqWmdPZjdlN0xjT1RE?=
 =?utf-8?B?bzkwRnhmWmFhZGpQUzV0TmZ0M2xNYjBrMFVyWTZvVkt1bkdOTCtXOGtaTGQ1?=
 =?utf-8?B?Wi9DV3UvRW82Q2MxTm93N1B4cHVmdEkzRWs3UU9Yb3JjSXBPSWE4VjVNWkVI?=
 =?utf-8?B?bmpYaUxMMkEyeXlreGV4aGthQWtGa1d6MmRQTHJwZHR6blR5c3phdVYyQnNE?=
 =?utf-8?B?alJSUHZRek9NRnFYODFVSHdoMXlXVDZ4N2M5Sy9UTVVKTzRMVkVkQkU1eTU2?=
 =?utf-8?B?emtCVUtxQkZQbFhFSUU1STk1V29zazM1NTJwcWYrcjdSRGU1Q3VpTE5uQjlh?=
 =?utf-8?B?SDlPNk9rYW9VdkdReDM1QTFyTldTZGYwMlJsT2RuOG02L3VTQWJ4dytZbVhv?=
 =?utf-8?B?R1hhRlpRR0orblFWcXY0cGRzSFZZSFpHM2ZyVDFMN0poT2ZyZFpVZ3dkMldq?=
 =?utf-8?B?WCs2UUtWNy9RVEJxVmRFYWtUR0RFZkNVaDIzdU9mL0tIWUtsWitwRzhLemVS?=
 =?utf-8?B?YTkxVHgyU3gxejhwSmFaOVFOb3dUVlNNS0JuZGVzbnFJeUtPZGNra1RiNUNh?=
 =?utf-8?B?NTFxem4rRHRVTXN5QVl6L0tNYzYxV3ExZTZaVDQ0SzRSUjJLUldEdE43Sm1l?=
 =?utf-8?B?SmVuMmRXdSswTEtvNUFGNkVzNWwrVGQzSmQ2aTAvZXBHb2h5MXpmWXoxVW9i?=
 =?utf-8?B?WmN4QUl6RTdOWkVMeFhSekxKL1U2Nk9qVVBJUmNTdnpsbEJTOXN0UXdlTlN0?=
 =?utf-8?B?S2JPVG5yT3ZVSHZJWDdnVWdyN2h6ekFaSG5oNDBzY0VONk5qbGM3ZlFWV1Fw?=
 =?utf-8?B?ZE5xUE0xU2RNT0pndm11V3prU3lhSXVzbHA3bUtLVGczNHNvVmYyMnoyK2Zy?=
 =?utf-8?B?TWNwbFAvYlJ5djJqdFlIV3h5cllSQWY3TEJ2MDVTaGlLUTA4RmZaMkk5M1lN?=
 =?utf-8?B?aTFGeFAxY21ZT0ZHOWNnMG5wUjk2ZURxS3RkS1UxMmpLb21uM1lQVkFKUm54?=
 =?utf-8?B?MjVPWnlKVDRrSWpHNEw5YTlIbXN4cklYNGtqMC9haHYzUnc2cnBJNnRhUWZq?=
 =?utf-8?B?dDczdU83QklyNUNBeisrUms3YlFqVk9qUUtjaW52Vzd0b2Y2WVpJUW1veUo2?=
 =?utf-8?B?ZE9vQXFjVUZ4aDZ6ZG9kSjlIYTl4eFJmaHNValBKRVhMR1FJVm9uVnFucm96?=
 =?utf-8?B?em9VcThwdmJDd09RUGtXZGFDT0tOSEQveWZ2YUZReGhzN3ZrQjJJYk12T0ow?=
 =?utf-8?B?VHVwNW05ak5KOW5QSWJBcFRSSTFpV1lGWkI2dFlKbFl4NDJjcmg0TlhzZUcy?=
 =?utf-8?B?ZFYwUG5jTEVlMXlVMEYxVzBITVFWbHZyZk44bGZudHZYZDJta0hKeTRzbHNX?=
 =?utf-8?B?VElOMTFlY0VyZlRFNFJndWszUzNEYnNyYTVXZFg3a3VYaTIrZ2M2QjJjNXN6?=
 =?utf-8?B?b29GdkdZRmIvMnY3RHV4MjdsOEtoL2tQeWNNbE5QWm5DOTJIWkJtelUwUENu?=
 =?utf-8?B?Q1F2U3BOWDA4WmVlTVdPMG9hWnpyVTdMcXZpK0xPdkJLNTJKR3dheVNlRzZP?=
 =?utf-8?B?LytjajdOZVlNSXRmeTh2Q0k4MDRzNWlIcjNpSnVoNVZlbjM1RWQ0dHlQWjU3?=
 =?utf-8?B?ZTJFTUIwTGJucXZuYzRxa09WNzRPNUVLTzZoUXU3SlpXNkV0SmtNUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 910bab61-567e-4faa-296c-08de4c507722
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 11:49:21.4401
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IfNfq0dMaKFfPxMOaUyRqb7aWNgYrH8zn3v+hA1WGhjYtoRWo6DHZlyQKA5cBf0aAywQ+StlBPkV2jrv1+2sUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9878

From: Peng Fan <peng.fan@nxp.com>

Enable USB[1,2] and add ptn5110 connected to USB1.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952-evk.dts | 76 ++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index 3b5b345ef6fea037ad8b98366527d1c13415a269..d90b8b512f0106253d9c0c58e4fa0e468ed1ea0e 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/usb/pd.h>
 #include "imx952.dtsi"
 
 / {
@@ -87,6 +88,16 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
 		enable-active-high;
 		off-on-delay-us = <12000>;
 	};
+
+	reg_usb_vbus: regulator-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USB_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&pcal6524 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 };
 
 &lpi2c2 {
@@ -192,6 +203,40 @@ pcal6524: gpio@22 {
 		interrupt-parent = <&gpio5>;
 		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
 	};
+
+	ptn5110: tcpc@50 {
+		compatible = "nxp,ptn5110", "tcpci";
+		reg = <0x50>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <14 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ptn5110>;
+
+		typec_con: connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			sink-pdos = <PDO_FIXED(5000, 0, PDO_FIXED_USB_COMM)>;
+			op-sink-microwatt = <0>;
+			self-powered;
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					typec1_dr_sw: endpoint {
+						remote-endpoint = <&usb1_drd_sw>;
+					};
+				};
+			};
+		};
+	};
 };
 
 &lpuart1 {
@@ -219,6 +264,31 @@ &lpspi7 {
 	status = "okay";
 };
 
+&usb1 {
+	dr_mode = "otg";
+	hnp-disable;
+	srp-disable;
+	adp-disable;
+	usb-role-switch;
+	disable-over-current;
+	samsung,picophy-pre-emp-curr-control = <3>;
+	samsung,picophy-dc-vol-level-adjust = <7>;
+	status = "okay";
+
+	port {
+		usb1_drd_sw: endpoint {
+			remote-endpoint = <&typec1_dr_sw>;
+		};
+	};
+};
+
+&usb2 {
+	dr_mode = "host";
+	disable-over-current;
+	vbus-supply = <&reg_usb_vbus>;
+	status = "okay";
+};
+
 &usdhc1 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
 	pinctrl-0 = <&pinctrl_usdhc1>;
@@ -307,6 +377,12 @@ IMX952_PAD_GPIO_IO36__WAKEUPMIX_TOP_GPIO5_IO_16		0x31e
 		>;
 	};
 
+	pinctrl_ptn5110: ptn5110grp {
+		fsl,pins = <
+			IMX952_PAD_GPIO_IO34__WAKEUPMIX_TOP_GPIO5_IO_14		     0x31e
+		>;
+	};
+
 	pinctrl_reg_usdhc2_vmmc: regusdhc2vmmcgrp {
 		fsl,pins = <
 			IMX952_PAD_SD2_RESET_B__WAKEUPMIX_TOP_GPIO3_IO_7	0x31e

-- 
2.37.1

