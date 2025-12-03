Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011012.outbound.protection.outlook.com [52.101.70.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E078030275E
	for <imx@lists.linux.dev>; Wed,  3 Dec 2025 20:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764794777; cv=fail; b=fHBeftyThol/6I85DGi72NiwWnntL219m6ukhsdaYM2+/vJ43EX9LGze3zfmYDW6kd7dsl0AviPjTiUeERIsaXt3IEJ2qnRf2SPQnO4KLF6RFuslXPrA/a85iQKAvGEaHuPPj1ReARMHgynLl3kceDXkd2OXAEbirLoMzaGehNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764794777; c=relaxed/simple;
	bh=Y1gZjM0FoTH6orpUSDkHHP7JXPduhUZgjH5gQUzoR30=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=TjV2CUuYkoO/0zF93DDJ1N8IcQECxIOMUuc7N1veo3DAsSnWz9awIdAqBfOc1Gig4ZPV/hzKbXOsrxkaotQxIDyxJGBVCfHLfst7Gq0CiEprlE5xFT5m+NX0MENYIuz0NICUfsgBjkzQsngldUGiGy2NeW098/d+7ZhajyMqGk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZwgfiW8N; arc=fail smtp.client-ip=52.101.70.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZwgfiW8N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ohajSb15NYXtynF4ZMxqwP+/hW40MIZIoTY2Ng0ul/97xCA5nipV8GgK3rBoaoV8W8LLciIuf/K7x0iaBngT8eAThVwt0KVS6kxaRDaZ52y9gjZovwL1GUhNRm4s/ySLxToDh9yKccacTlRFzVSOhEW9c8SnKyZS7FY10WOo1p8BQ1TrIJ+5ke/WFycq25wkbFeeuQwp0aCUdQlnwNbmlAHyCd8zrkLcUI+cclpRFds+pyDt9Wbep+UDoAhGIHH28LyBwHkPwuYCHpopZ5ok3a8J7VJdKnazQFFbj5Gm88JmyWPPW5p9rGLwo2VvgHwnOxgNqqn1P9ZBSTfFCs5m9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gAcnOmbYUiVm0niz1rFULAMluCaXALeftA5U/vsSrI=;
 b=y13KC22RjUZnR8GofnSkRVpD2TDPMIXaFcj0XTyfIu+mqfChEoI/i7oFsgzF7vGp/rJP46QVL2pKRyVtbpkA8ol/espEZ4fIZEJQJBN9o7qOxeatVye/PxwiolAba3/eUo48PL5fL7aIkpAjZQ8GbAYBZfSpUeXUYLXbI/dufsOEoRxqsgMcygKc+gVmlK0HPFxMDKSwneWloEHaL72qzsLoIBb3H/ZzAf8nNmvCMUOelh5CweQ70MjaDX+3BRFFQynkn9EVaAxCJYwnFdjOaiSUYtzWhLQYkaZSGg/9CxdW+6PoHcFdLj8yinoBe7w1re8EQW6sqzbvy2f2NFB9xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gAcnOmbYUiVm0niz1rFULAMluCaXALeftA5U/vsSrI=;
 b=ZwgfiW8NPWgeM0ndmrvQ6Oy5Zl3/qsHrxn7nOxFi/oRoSoNPepcFz3ZHRgp5dF3AuFri1L6CvcgznsfQKiYvFQT09zgEstXTropQqRGFVHKT3eMv9KkdRY3kYvPaIiiHGgkzPj1djfMDq1bqL3jRSxuFL4CcmPl9Uz8CsIiMm8qr7OuP/amPtT30I9+beKg0NZoaPmY4+Lqov+544aTiM1Eg2M0AFsZuVF/4cOBj7QpJy9VAUokOwOCDywSIZN0aNrg/HKt4JvsR3KFP77T7tZyqwLdD0/UL0cvICkvSE+8ZceibNEdVBxFcXyvYgm9drLJVOmz1PqijPjimqDaJbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU2PR04MB8949.eurprd04.prod.outlook.com (2603:10a6:10:2e0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 20:46:09 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 20:46:09 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 03 Dec 2025 15:45:51 -0500
Subject: [PATCH v2 2/2] i3c: master: cleanup callback .priv_xfers()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-i3c_xfer_cleanup_master-v2-2-7dd94d04ee2d@nxp.com>
References: <20251203-i3c_xfer_cleanup_master-v2-0-7dd94d04ee2d@nxp.com>
In-Reply-To: <20251203-i3c_xfer_cleanup_master-v2-0-7dd94d04ee2d@nxp.com>
To: Jorge Marques <jorge.marques@analog.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764794762; l=3123;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=Y1gZjM0FoTH6orpUSDkHHP7JXPduhUZgjH5gQUzoR30=;
 b=xCvCNWHwCkWm3sg+GnYkIc1QzlIHn54+mA9LD72U/wtD4RRmRbPriLHRP4iuIyOSTakDLlVJi
 VjZfZFDL/RHBAGC1xrjTibrV3CU5YRBwz/A39EstmkrWbu+Wh4mzbfa
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR17CA0015.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::28) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU2PR04MB8949:EE_
X-MS-Office365-Filtering-Correlation-Id: f4d1b25e-1dc4-4843-25bb-08de32acfcf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c3djV3RmUFBZVERhOEVMeTVaMDZjT1VGTHpIK2pKUCtqOWxhNzNHU2xkYmZ1?=
 =?utf-8?B?cFhGWno0UFRjeFNVQzJaVVRTODE1TXpIaWsreDVvS1ZTRUxYakhGOWg0L3Vt?=
 =?utf-8?B?Z3gyeGhLV2JQaUhBM0JXaFFoRmlPcCtlQkdlTDdHTDBWRkpCN0xBdS9uQ1Vr?=
 =?utf-8?B?bjhYWXNxWFl4NGdiWmNGNksyN2FaUTdEb3ZXT0o2bzdrelZ3QXk2cjJiQzhH?=
 =?utf-8?B?WERDR01EcUptMjZieGtUeFVBT3dXSHlrU0lxS1dQdmpkb0JGKzQyM3pHUzRV?=
 =?utf-8?B?dE1maW50MVRoRkRucWVKTnkrSmcrZFg1czNGY3h6ZnFvTVdaRGRpL0dCa0NS?=
 =?utf-8?B?ZEZxN3MxNC9wOTZIRXRoekNQU3ZPWFloVW5vZisxREV1N3pSWURNVVkxaE9C?=
 =?utf-8?B?S3FST3c2d29LM3NVdFByS29Uak9vTEF1RitCdDVKTjdiNG1qamw2TEJNdTNY?=
 =?utf-8?B?c2lPU1l1K20xZW5rVS91SjBpaFU0cnc3TFdpQmZOZ0hqNDJCSVdzYzN5SGdY?=
 =?utf-8?B?YWE3U0VFWEVYdEwxcGZQYlZ3NjhNY0xOTFRZT0ZyT0JVNDNuQmFXZk1JOU9V?=
 =?utf-8?B?eDhWVld6d1QwQTgwazI4aTNlMi81R2FoQzEyT3BYTHBsWS9Ld3dxQnVLanJw?=
 =?utf-8?B?RDU0a0hFM3pzU2t6RWZlcnlEQTdCLzVEYkJyOGp5SVJYTWpESndzU1V4aGpR?=
 =?utf-8?B?b2JVS3Q2cTRKVWh6S3UvM2pJZWlHQmszYm04aTlqMGw4UjYwbWUrVFpvcVcv?=
 =?utf-8?B?Y0d6SUEzTnE4bXVmZXQxaFd2R093Ty8zWEc1ZTFsNHRpYVhLa2pMVCt5U2hs?=
 =?utf-8?B?NDNBeVVlMFB2SC90V01sdlJWY0VQSHRHblBHemtyWlkvRnpMSzQ0cWJVYWN1?=
 =?utf-8?B?R1EyYTF0ZmhxT1hWeVNvOEltL1k4VVF5U1l2R2FMcFhJdFEyNTlIdWFGanNL?=
 =?utf-8?B?MHhYOEx2ZGo0OVhNOFVOSWZySk9mRU5mS0JSR1JoZjlTeHpoVVBSTExkdGJ3?=
 =?utf-8?B?TmhHaVpYalFaS2FCc0JnZW53WXVaZ3VHQnZCR0VvTzhKSHMvenA1dlNPYWl2?=
 =?utf-8?B?TGFFQnBIYUt1bzhMeEJveW9JcXZDQTVRRElxL0lHNkY3V1dSaEtzV3FjMWlu?=
 =?utf-8?B?b0JHTmpSOCtSaGZlelhUNEI2YWVwbXZlVmc0RFpoK1plaUZyOHpMOHNmWEZ1?=
 =?utf-8?B?WnhHUFdmclU5YjNmQkZVNzVIZWpBaTViSkI2dGZObHpGU0pxU2MrVWZ4NVJr?=
 =?utf-8?B?SlFiOVRWK1BNRUpodFNiZVlZdi9VZGxRWFk4MC9GOVVxUXBxZDFXYmxwYzhL?=
 =?utf-8?B?V0tLV3RITWEwMHlOaG80bW11SHhvTEprT1pjeTZqN0pJdkRPeVBLSjVuVFNI?=
 =?utf-8?B?Z3d5dXJHUjVBVmRURkJmVVFPTFFFQzdPUmVkSmZWeVQ2UG5KcGd1YUpqTzlu?=
 =?utf-8?B?eFAyUWJQOElEY0laWHNWSXp0cUM0aEM2WCt2ektDSHlKaFlDZjBTUEF0emtZ?=
 =?utf-8?B?aW0xMldIRDV4V1dCM29XZjRaVXo5SlBvbXlNcnkyeVJINzF2NkE0Z2RjOUVl?=
 =?utf-8?B?WHQxb3JVa0RnMFg3UUJZcXIvb2RGTHNnOHFtNlRDT2FEWEt4Ui9lUkpaTjFn?=
 =?utf-8?B?bzh5Qk13TlpCMDZiNDhBTmJTcW9pdGpsQlN1Sno1UHAxNHN0cWcydWV4V0hT?=
 =?utf-8?B?ZStZM3VIY2F5MitIVUVYUTRLMzJOcnNwN3h5NFJzSG5CdEZZUm9ueGFRVCtQ?=
 =?utf-8?B?eXVwYklzUzdnS2NuZFNTTGpZZ2w3cWNybjhKQ2JDRWVqc25MVnFmU29mbUZ5?=
 =?utf-8?B?Y3kyQmd4UC9MNnovWnBrUm1ITkNrdWRsZzV0ektCb0s3SGcveGFsckgzbjFP?=
 =?utf-8?B?VS9tNi9MdWZqbC83c3FZeWp4M0FNbWtXdUFqRHBrbGdJSlg1WmZLUTc4NWli?=
 =?utf-8?B?MjNVTEQwb0ZVdXgwQ2w2a3ppYkZkWWlDVWt5OHprVmxsNlg4eWtmQ1NZVWpN?=
 =?utf-8?B?VE1ydXpxcmFFTWl3VnNoQjB2azAxcGNSK3FlQXJXRkI4K0R5M3Q5VEF1dHZE?=
 =?utf-8?Q?SgpXeM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djFaOE1EVG5GbDFveHdNQTZ2MDBMY0VZcDViZXpkYkdnTHh3ZTZROXZjRHV4?=
 =?utf-8?B?bWVHdVMvQlJBMTFOd3IwdjZldXFkSU1nVUkvN3QyQmw1SWV2N2c5S0FvQWxY?=
 =?utf-8?B?R1Vqa1dBcXU2MUFqWHVhTmJkYmk1cnRHcUVzOXRwbkNteUJ2YndXMDM2eXl0?=
 =?utf-8?B?UUJyREoyUExNOExoYkdRNzFIQnpMSHdQbzBJRi9HS2h1VkVWM2lIMG8vMUFR?=
 =?utf-8?B?ODdiZVk0cHBGZTBqNDkveWlJWWtsVlp5d2ZIZFJ1blh1aGtWY0h4MFN3U2lp?=
 =?utf-8?B?OXBMcm8ycHdSMWdtc0p6VUJhek42NUFwMXR2bzZTYW5ad2dEMG5jVUcreXNC?=
 =?utf-8?B?VmhyQVpycGN0UThQdFNOT1d4M1hlVk9vSU1mTnRsS2Nvc2NzOTUxNEE5YzlN?=
 =?utf-8?B?N3FqRGNLSHJvelZjeVFzZHltOTNDSS93ejBlTkhRRE0rZlY1bG9kODhDekhL?=
 =?utf-8?B?b2dLMHFtK2RKU3VjTWM2Sm81YU9tTFBZSkhldXBsTVUybXRYeFFYWEYvdWJJ?=
 =?utf-8?B?N3M0dm5DSVlCOWwycUhSeHB0MjUrbmpXeDFXbm1sT3hPUTgzK1RPU1gwY0Jz?=
 =?utf-8?B?WUFKQ3A4SEl0U0lweUxMR1RmS3JmY0ROZjhuNFFocXNwUTVBRWlmd0NRQThi?=
 =?utf-8?B?R1ZoZGxZeTRCUEFEcnJlM1JWalBCSEVjRWF3QlJTdVdkNUZmZ0gyRkZvejlX?=
 =?utf-8?B?ZHRtVHJRQmFlc1VkZDVaQVdXK3NlMFl3azFoS0Z2ZWI4U0tyb0trcitQMjdx?=
 =?utf-8?B?S1hsNDlDQzl2Ym1PcWlQS28vSEpoaXF6R0pkTUVUZmdyUWc5QlE5ODYyYXQz?=
 =?utf-8?B?K09JekxUYUZnRFhDc2hzRTc1aVIvNDVmWVQrVlAvaWlhL1JGZWFzTjV2blp6?=
 =?utf-8?B?dWNnSkNBcnpEbE5wcjlVVUF5MWpucEdSa2JpZUx2UXdkeEx2TlNVYUYxZlN5?=
 =?utf-8?B?MS9iaEdGWHBTcWxjRnZFOXkrRmUyRzl4T2hydXVNSm4yTTRpaldVR2FaS1Mw?=
 =?utf-8?B?VHdBUU5xU1EweFRTR2tFOWNMVll5N1V0TjVGUmNGVUVqTDQxZ2lEbUhBN2tN?=
 =?utf-8?B?NGNnK3UwZEx3Y3AzVFJNRHREVUp2TGw0K1ArbWNVVWVyL3R2N0oxSXI3eGhP?=
 =?utf-8?B?TEhlZUx1WUN6ckdIUGcrU3lxZFFRbWRIb1hNS1YxUFdKRForei9BRWo5Q3Zj?=
 =?utf-8?B?WjdOaklxa3VveGc4cHNqRSsxazZzOXY4bEthVVVTOXk1aDA1QnIyV3FCcWRx?=
 =?utf-8?B?NEJYdVpTb1dvZ014MEJDUTlrbEF0c0d6L2xCaGY2MTVla2VmSFlVODZtSGZ4?=
 =?utf-8?B?TXJyaFdkSmNrMS91MmFhOHJ2ZnlvUVNKY05Ma3drTkpOUmpJK05KcTdKeGNK?=
 =?utf-8?B?d3FjUGdoQUNqek9JWTVrRFBkQlpyaU9yQ0RWQVg5UHZqdmdicnNBejlOeGVr?=
 =?utf-8?B?ZnU1MGZjbWx3UmRHbzlXazhZZ2MwMTRLOHIrbDErMnlnRitKTE9icGYyVEZV?=
 =?utf-8?B?SDJCR2xveGtlSzVxVCsxeEI5bFhmWnVFNkRkM1ZDZHJjekdvSGFvek9zTk5h?=
 =?utf-8?B?OExJdmZoTk91Yjl5M3Nrc3FjNFpSREhtWXNzaVlrdEJMRnh4WEk4Rm16azlt?=
 =?utf-8?B?S1BmN20wTElvWjYyMDdjNWxNMnF0amFNZDBwNXY3ZHNzZ29idVdSSUdUOE5S?=
 =?utf-8?B?UGFaZ1RnZ0tTS2p4Zzh3U1lXWHIyK0NnZmdDeTdwcG9WUXhlUFBiTG45UDhO?=
 =?utf-8?B?dlFOWFM0QVdzRzBUMWJoN1phdVpGMk5YMk42ZUR4ZUhRY1hYa1o5RFBNd1Z5?=
 =?utf-8?B?UWNwS0tpR01yVjVOU20rbUFOcXRlbDR0cGZtMExxQlVGVlBJK1NJZ0JlTmxs?=
 =?utf-8?B?WVRYaVJ2S2tYeVdXUm1ZMnpYOVRUWkFYME9ZQ29ubGZweGhzcktYYzdrYW9v?=
 =?utf-8?B?K3V5S2JrbjRQUGgvb2lNSWxnb3ROdVpyc0dtd3BPSVBneXNuSDNVMWVzeThY?=
 =?utf-8?B?TXpsOXdCbVZKTkoxZU8rcmR0bjYyUW54QVorbENTRHlwbURlTGZYdGJmODlt?=
 =?utf-8?B?L3NtRU5BKzdwc2dZM1hnMDhNTU1HMnp4L1ZrV0xPVjFoOU02YVZRaSt0SVVR?=
 =?utf-8?Q?pS5JcNhqMYQNAZk1IS4tLrPps?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4d1b25e-1dc4-4843-25bb-08de32acfcf5
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 20:46:09.3821
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CHbv69jpzCnOsVvLsgViaEHbVDbWw4V5xYkYbuhUbAErpjCT2+/TnWFsPDoGQWYeBMvRgnp1QeU7nz+i+YMP9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8949

Remove the .priv_xfers() callback from the framework after all master
controller drivers have switched to use the new .i3c_xfers() callback.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/i3c/master.c       | 14 ++------------
 include/linux/i3c/master.h | 11 +----------
 2 files changed, 3 insertions(+), 22 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index f88f7e19203ae5a90267b2491f3b13b6205863e8..ea45a519dd68a514fd7fe8314b3fcf2c5604aa64 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2819,14 +2819,10 @@ EXPORT_SYMBOL_GPL(i3c_generic_ibi_recycle_slot);
 
 static int i3c_master_check_ops(const struct i3c_master_controller_ops *ops)
 {
-	if (!ops || !ops->bus_init ||
+	if (!ops || !ops->bus_init || !ops->i3c_xfers ||
 	    !ops->send_ccc_cmd || !ops->do_daa || !ops->i2c_xfers)
 		return -EINVAL;
 
-	/* Must provide one of priv_xfers (SDR only) or i3c_xfers (all modes) */
-	if (!ops->priv_xfers && !ops->i3c_xfers)
-		return -EINVAL;
-
 	if (ops->request_ibi &&
 	    (!ops->enable_ibi || !ops->disable_ibi || !ops->free_ibi ||
 	     !ops->recycle_ibi_slot))
@@ -3031,13 +3027,7 @@ int i3c_dev_do_xfers_locked(struct i3c_dev_desc *dev, struct i3c_xfer *xfers,
 	if (mode != I3C_SDR && !(master->this->info.hdr_cap & BIT(mode)))
 		return -EOPNOTSUPP;
 
-	if (master->ops->i3c_xfers)
-		return master->ops->i3c_xfers(dev, xfers, nxfers, mode);
-
-	if (mode != I3C_SDR)
-		return -EINVAL;
-
-	return master->ops->priv_xfers(dev, xfers, nxfers);
+	return master->ops->i3c_xfers(dev, xfers, nxfers, mode);
 }
 
 int i3c_dev_disable_ibi_locked(struct i3c_dev_desc *dev)
diff --git a/include/linux/i3c/master.h b/include/linux/i3c/master.h
index 2fd850f4678b22f352507f8f55910a196536a1e5..6225ad28f210fa15a8f2d521a565ef06995e2470 100644
--- a/include/linux/i3c/master.h
+++ b/include/linux/i3c/master.h
@@ -417,12 +417,7 @@ struct i3c_bus {
  *		      all CCC commands are supported.
  * @send_ccc_cmd: send a CCC command
  *		  This method is mandatory.
- * @priv_xfers: do one or several private I3C SDR transfers
- *		This method is mandatory when i3c_xfers is not implemented. It
- *		is deprecated.
- * @i3c_xfers: do one or several I3C SDR or HDR transfers
- *	       This method is mandatory when priv_xfers is not implemented but
- *	       should be implemented instead of priv_xfers.
+ * @i3c_xfers: do one or several I3C SDR or HDR transfers.
  * @attach_i2c_dev: called every time an I2C device is attached to the bus.
  *		    This is a good place to attach master controller specific
  *		    data to I2C devices.
@@ -478,10 +473,6 @@ struct i3c_master_controller_ops {
 				 const struct i3c_ccc_cmd *cmd);
 	int (*send_ccc_cmd)(struct i3c_master_controller *master,
 			    struct i3c_ccc_cmd *cmd);
-	/* Deprecated, please use i3c_xfers() */
-	int (*priv_xfers)(struct i3c_dev_desc *dev,
-			  struct i3c_priv_xfer *xfers,
-			  int nxfers);
 	int (*i3c_xfers)(struct i3c_dev_desc *dev,
 			 struct i3c_xfer *xfers,
 			 int nxfers, enum i3c_xfer_mode mode);

-- 
2.34.1

