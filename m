Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011011.outbound.protection.outlook.com [52.101.70.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1253033E6
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 07:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784879363; cv=fail; b=c/FSlDfoWyHM5IEXgZ9y5bklURcH7f5xRcd+6TMWLz60FmKWmB5mFmW49Zg/I52h7NBHwc6NQQWUZ58O1Yz+8o9hNKAWV+PDNW7pRyROtk1OhVYG7b0NekROFQPVjqdZOOrVOEDD297Hup3yx4JnOLxFmuFOm/QYbmCDIrL0Cbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784879363; c=relaxed/simple;
	bh=iA4HzD8aJ2uZ+2ojy6MEJ7BzbkYIbw278Od85VM8cQQ=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=KE79Z9q4kjJ8neirSc0is1qn53q+jDLD7o8DZ9PElYLApWkaVqdz1A7yT0q6OfjiEax7rvu/eztqc7vewF3qsyE/0JC+t4/550nwE6e0VxWRWhgceflR/OvuPhV0I8siProqV0I5jGdQwXUW/d1a2M5EdpKJSVL6jc3ehT3oeRk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xM1MJYoe; arc=fail smtp.client-ip=52.101.70.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xM1MJYoe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YgFKEY2kF4Omf9go8wsiWnRCM/1yonF9vwG2BB1OtDFPdP8MAzSE/ZR9hC9VCKG21P1gvRhfUe9+xMsrRoigkRnqbmLEuQ5T/jYjHUuM7wLngQlOWmF4bqAQ4kHqZwV/y43RDJ0OFCCgF7jFXMwqIpUnN8ypFEUzIbMmpUkLZkAF2Lh+WhOcMlQo2IBdlxmeSFynOkTuI6cOfjBR8C7iCY2Bg+wOMCvugCevWSBl4YZbNhZZxQJcMbRyYqdM3gkTb8Z9Y4SJq3XH4yLu1t6OUWIIXmhgNvqp4csxPvtgzfxnfVIjp3HveQZXu8oHrDWbbqryyrSeJp1ldt4lTGKU/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kn968V8ETbRSSq7l0WbBN7aTS/babjszBFIteJQnRes=;
 b=iSmvUABiv1TjJ0XF3s/mRS2U8mBdRF/gqUwjP/v0areCWRODLoDvMwJwlEhqB7zyi/SOVGLf87A+wRgCcyAKNHHjAXi4ZrvIqXtSLn3ez0IS9c2DTnVuSVsiMiO/GyYK2AKQF8mtLAk92UE/N63IC5yUQOzetB3LJu5N6rY9xlV8xKf26f5CtwpIKrisDGJ3gFlAuVj7rxCzBMi9PVZmjT7p+82xN5FDPLcbeE1rs/4S/sBpQ5X7aKRadxdoM76q9tUxOP4ZFdUntHL3jAKFhiJRbFx2qAmyTAe6MvEJORUmrfMnaa4pPmK+Jt6gStITi49QnmxRSgrJtOapc0RpcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kn968V8ETbRSSq7l0WbBN7aTS/babjszBFIteJQnRes=;
 b=xM1MJYoer3l5yFXimozC5k0dlnWajiUU0npndnbMqZ0Mk0HbNdu6rVlFBHVLn4Kv2pvcfXhTwW5cSu6LJol0TUfuU3Vj2PoZB6J8/fPj+u4h7MuSkKgsUw5PTjw2zAcBGXBanAPoxYbFu7DtH0M/o4U/A+jU+rCvSO07ingvZMeMjmbO8jSUMuTMQWR2mXuaIo/gf0ljayaJ7ZCw9acx2YkZSippWlzDt0kyVX/U33WFU+aQEY/2AVlkU/stt835PmhDtMZ1x/unIyWhp47VI/NAyvh3/q+DH5wACOFHwQzzgfi5lU5ZGJuJHTfxniJuvGXKdiz0hDpMElYvrQBB3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com (2603:10a6:150:284::9)
 by VI1PR04MB7023.eurprd04.prod.outlook.com (2603:10a6:800:12f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 07:49:18 +0000
Received: from GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7]) by GV1PR04MB11513.eurprd04.prod.outlook.com
 ([fe80::29e0:98a1:4577:2cc7%3]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 07:49:17 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Subject: [PATCH v4 0/3] imx8-isi: Format support enhancements
Date: Fri, 24 Jul 2026 15:52:55 +0800
Message-Id: <20260724-isi-v4-0-27df7b5f6060@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANcZY2oC/2XM0Q6CIBgF4FdpXIf7QVDpqvdoXYD8JBeJk8Zsz
 ncPda1al+fsfGcmEUePkZwOMxkx+ehDn4M4Hkjb6f6G1NucCQdeQcUrmhcUwIE0IIRuFcnLYUT
 np+3lcs258/ERxud2mtjavr3afGIUqEU0zhpmoDbnEGPRT0PRhjtZHxL/qJrDrnhWQjZCmlZa4
 fS/Kr9VuasyK6mEYgo1NqL+VcuyvACaciHwBAEAAA==
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Christian Hemp <c.hemp@phytec.de>, 
 Stefan Riedmueller <s.riedmueller@phytec.de>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Bryan O'Donoghue <bod@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 linux-media@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Robert Chiras <robert.chiras@nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784879577; l=3901;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=iA4HzD8aJ2uZ+2ojy6MEJ7BzbkYIbw278Od85VM8cQQ=;
 b=8o82gcd/i/+0xD7+rOotmXxvk/Opoza70pbCBv3H8xz6SOfyG7Pj5Q5Oe4XSwNAEv9Iwp33pc
 yvPGkq9HLStCUJYNjspk9CTgpNYW5719zO52H5ntlePOVtreHo0/7vM
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: MA5P287CA0360.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:219::11) To GV1PR04MB11513.eurprd04.prod.outlook.com
 (2603:10a6:150:284::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB11513:EE_|VI1PR04MB7023:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ccc031a-bc30-4acd-ed60-08dee9581085
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|19092799006|23010399003|366016|921020|13003099007|6133799003|18002099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
 1h84FiL9Z+po/n5IyxkpmQ3cGVPIzAJMIhpxNUe64JhAWgq2XuTy37RoMoEP1Oc1+rbucK3nuNj4lIEUSPev89U0yVLS+eYpiOfQLmn1PnH1qjmkaBcoS4EXyyrbdG2OeZKz28NnKAIqP9BkfMEpKDedrF6Xnw+Q6C+M0uGapwqLNYlT8MdSebbwNq64QsrmJwpM8pnHBPcMmkLyYJWdLFpZwWZ9oEEGCMMbgp1/48bX7+byS74JtgLLaKImXNK9pjSRXs09WkuIZSF2my/QbcACCZUXs1/7nW6VlKXUzvHI1HDvyqdQj3lLYhTaO1q44N+1DAM1n/+V9A8oRLdIc8ajQLjHGIzkG4GuZ/EP+a+vzyJxiqn6FR2BWm+TJNFyYtC1e2uIzSFP/zm29+96P5QD0flPwLFDR5yFuYLCj35XAIpfSo9+a8ngERnLDM48971zQs3O2Jt87VU/3fU6fiUvIzn9LkPvq350i8F4FIXdZ18HImZW0DAcJUdjMw9Z7VNiCV9kPf1ZQ/wvYpjmMpUb3YSL70ENCW0/yHl+Asg0WqXEyEPAzjIYRFDxosXG+ueaLJcTqAkeGcCEo9TW+1WThh7Lg0iYjPbgvFyI+J8pjcZ6bKiEOAT8SSJL6WuG7vRf+EV74+h3BcY0iOifhKetQMtLB7XgiHKbes4UnVpWHRFtghVwqUARXE0pIGMRDMDk9AnPRsq+4KmkShxcog==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB11513.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(19092799006)(23010399003)(366016)(921020)(13003099007)(6133799003)(18002099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TSttU2xyd2l4N0F6K2RIWWwrL2tLS2tQVDc3ZytwT2lvY3c2RURLdGpCeTdQ?=
 =?utf-8?B?S0cwZjQxdzFndzR5ZlBNN3Y1SWhTVkg3U0xYUWZMN0Z5dTBhZlpVR0x0U0Zy?=
 =?utf-8?B?OTZ2dHRwMy9wS1FuQkxjSzByQmR3aEJPVldiOEZFL2c2Z2tHWkpzODRNSExW?=
 =?utf-8?B?UkZzY1VGNDluVGR5Z3l5T3k3ZHB1dmNHbWU3SWoraVNiVDAyUSs3K3ltUUlu?=
 =?utf-8?B?MlBKU0MxcDV1dTk1dlBiMmlFYlkzWU96RWtoQStlc2cwZVlGTE9XdDk3cDFi?=
 =?utf-8?B?a2lKdWhUbG45cmVObGZBRC9obm0vZnNqa3JKd25wVFU4R05NTk05MmRJTmlz?=
 =?utf-8?B?MnpUV0dJUHRkTFlTQmhiczl2VGwyNTl3MVFUZENZOGx6RWY5VGRvd0Q1VDdG?=
 =?utf-8?B?c0ZOYU5iWUQxMWp1V2tFVktmU2RaRUFtZ3RMSjhrUW5VbTNZdGhQbjdJbG9J?=
 =?utf-8?B?RUIvYkYrNHhCVi9DRHF4ek40ZEJXN0VZU3VPQTdFUFR2Ymp0a2p3R1RLYUIr?=
 =?utf-8?B?RTZFdElWYUFYbk5WL000MmEwUzRyc2t1bVVvTWtNdlFUU25iaWh6VUF3QmNM?=
 =?utf-8?B?cGZ5MzA3YWh3Z0VGYmwra210QmRDVldLWE5TTnVJUTVrcWk2eTRBaVpxd3U3?=
 =?utf-8?B?OURxNG9rTEIwZE1iQnB2N1phR2orbUNUV2dNeG56dmFNeklSSDAzZzNKVEtF?=
 =?utf-8?B?SXE2aDI2bHYzMnhuZWcrOUlLSVMzMmVDUWRYcWhPeitUWmY1R1kwRWxJdmlV?=
 =?utf-8?B?eVNBUnFLa25qR2VrUU83c2tCdlduaFBEMEpMK0xKMTg3ek9yaXBiWXlPUlJD?=
 =?utf-8?B?ekJLZEpIcWdoWnBlRis2ZEFTejJNRVcxZXNmZDBVMGJYbnZlcEEzZTNYdng2?=
 =?utf-8?B?WDBHUW1wYk9Idmdya0I1dUkyeHM5MlkxR2ZpZ3pwYXB6czZjY3BBcEV0R3B5?=
 =?utf-8?B?TTFOd2NHMG5Ydy9qNDl1bDVjb0VYOWxKckNPamFkVnJkRnBjU21iSVpGNGtq?=
 =?utf-8?B?dXQwcmZPTnZWdGI4MEN2dU0zZ0ZwUEhCWDlaK0xhQm5JbkErMTl3blY0RUJn?=
 =?utf-8?B?SnV6enFPcEtOVlJLSVdHYjN5UXNiL2s0ZzhSWTVNamdmRzM0alM5Uzl3VE9j?=
 =?utf-8?B?andod1RhamhBalhiWmMzSWNTdFd3WlpjSld2RXAvVHBmTnRPbzVxdFgxV01k?=
 =?utf-8?B?YUdDVWV3SDVTSERpN05zTGdOVXFWOTRKVVlacWUyWThVTWhmaDZsL29mREZG?=
 =?utf-8?B?M1FJaGVIbE1oU1A1NXBTU1FMNm82MjlocmJxM3YxcHFnSXhYcnFtUngxT29s?=
 =?utf-8?B?OERURmFwZ2lDSndDOVlEY094eWgrUnEvZE9nRHNkSXF5Z2xMbTByNlNFVUds?=
 =?utf-8?B?NlBiT0FBMWMySVd0YjZOQmJGZ3R2TXJoOU5KWXZhRVdKZHp0Qk00TVkvUG5h?=
 =?utf-8?B?S0JFSVVmWHp2TDd2ckFkOTlTTTVzeEdzK2VkSlhpb0JHcWFUdFRkeWphekMy?=
 =?utf-8?B?aURaY00xU0dHMkNqRGV4SHlPNHZFcGhZK3c4QWM4bXlTWTFFclZzWENoMkZ5?=
 =?utf-8?B?Mi9Rc3dYU01jdVQrOWNEaU80T0hHQ1E1UU90SU5tOEdmUnJ6NmpnQlRGR25i?=
 =?utf-8?B?c3h5WVo2S1FWUkVrZGNjdjd5SWNUNjM2UGZ5K3cvSnR5RDRiMTJnUitpcjBN?=
 =?utf-8?B?a1BtbzR0Qnoxd2tXK0daL3Z3LzAxSEN5YmkyU2t0cmRYb21pNTcyRlo4TU5y?=
 =?utf-8?B?Zk5EN01vUTZFcldQZ2lZYXBZK0x6MnVadEEvZGZVWEpBcGJVRVBFdGZ6cmpl?=
 =?utf-8?B?Y1EwWXMvQTVTQlNyRXhYeVRFSkxJUlVHUGxaaEhJdnJnem9HeGRQWlJUd0Jv?=
 =?utf-8?B?ZGtuZ1QyeC83RnBxOGtlYTlzQTYxVmtSZy9aMnRNN3h1a0ViN0FmQmI1eHE5?=
 =?utf-8?B?WVc5UHc4SFQ2VW0rb05MODZjbTVLdzdXNk03eWVGUlhMQ0l5WU55RGN0K3Jo?=
 =?utf-8?B?czF3WXRIdFM2d2hSUDc0bDlmV3hKVUZDMUdIY3JXUDM2ajFDQk53SEpHQXdZ?=
 =?utf-8?B?RXlpeDRHVDNGbk9pYmppWlBxenpJL25DZkhDaEpsWDRibmdTSHpUOG5lakVp?=
 =?utf-8?B?ckJJY3k2WGRzMXhiV1piTkV2eWFmek5RTmdJYXZLTkpzOHBTcHVaNXB4Q05S?=
 =?utf-8?B?RTZEWFpEYU5xdFp6MFlYb3F3OWJlTmJKdlhrVm1xUlJFMUNDZlo1UTBGOFhi?=
 =?utf-8?B?QmY3R2dVeFBwMG9uVE8wcGpZWUNOVVNFRkhBQWpxOE4xYkc4NkpuSVFQSTcx?=
 =?utf-8?B?dTZwc0l6ajZYcnAzQWtmdkpSTXNCTmFnRm5ld1R3K1pISHJJOURLZHhqOEpF?=
 =?utf-8?Q?fejAJFQJ7Hvv+vhGdp1yqWRLJMN3VZJSq0yuq?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ccc031a-bc30-4acd-ed60-08dee9581085
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB11513.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 07:49:17.8914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hmE2ktleE8TFNLGvqBfafySNcw5FAVe8DIsclI3NP6pfrVR+HRoRZoHmXdpe3j7mTy/jAadKTphrsuHVQD+X1bApXwxRJVLrmjqKNCJz2ARIaV5q4xXWs1120NRO+V07
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7023

This is a follow-up series to the imx8-isi bug fixes and format support
patches [1]. Patches 1/6, 2/6, and 5/6 from v2 have been merged into the
maintainer's branch (pinchart/for-next/media/nxp). This series contains
the remaining 3 patches rebased on top of the merged changes.

Patch 1 implements per-stream reference counting in the crossbar to properly
enable multiple streams from different virtual channels on the same input pad.

Patch 2 adds support for 16-bit raw Bayer formats (SBGGR16, SGBRG16,
SGRBG16, SRGGB16) and Y16 (16-bit monochrome).

Patch 3 extends RGB format support by adding BGRA32, RGBA32, BGRX32, RGBX32,
and ARGB2101010 formats.

[1] https://lore.kernel.org/r/20260720-isi-v2-0-45845bc5d4fa@oss.nxp.com

Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v4:
- [1/3] Make enable/disable symmetric by checking stream_in_use
- [1/3] Add mxc_isi_crossbar_stream_in_use() helper for both paths
- Link to v3: https://lore.kernel.org/r/20260723-isi-v3-0-594919eae847@oss.nxp.com

Changes in v3:
- Rebased on maintainer's branch which already includes v2 patches 1/6,
  2/6, and 5/6 (stream ID validation fixes and color map correction)
- Series reduced from 6 patches to 3 patches (remaining unmerged patches)
- Patch numbering updated: v2 3/6 -> v3 1/3, v2 4/6 -> v3 2/3, v2 6/6 -> v3 3/3
- [1/3] Change from "Fix" to "Implement" as multi-stream support is for newer
  SoCs not present when the driver was merged (Laurent)
- [1/3] Remove Fixes and Cc: stable tags (Laurent)
- [1/3] Store input/input_stream in mxc_isi_pipe instead of using per-stream
  counters array, avoiding arbitrary 64-entry limit (Laurent)
- [1/3] Use UINT_MAX to mark pipe as inactive to distinguish from valid pad 0
- [2/3] Remove "high-end" from description as RAW16 is common now (Laurent)
- [2/3] Add Y16 (16-bit monochrome) format support (Laurent)
- [2/3] Add Reviewed-by tag from Laurent
- [3/3] Drop M2M_OUT for ABGR32/BGRA32/RGBA32 as ISI ignores alpha bits (Laurent)
- [3/3] Remove Android requirements from commit message as alpha formats
  cannot be used as M2M input (Laurent)
- [3/3] Add Tested-by tag from Laurent Pinchart
- Link to v2: https://lore.kernel.org/r/20260720-isi-v2-0-45845bc5d4fa@oss.nxp.com

Changes in v2:
- [1/6] Split v1 patch 1/5 into two patches: this patch fixes the core
  for_each_active_route() bug, next patch adds additional stream
  validation (Frank Li)
- [2/6] New patch split from v1 1/5: adds stream ID validation on top of
  for_each_active_route() fix (Frank Li)
- [2/6] Remove incorrect sink_stream validation
- [3/6] Use fixed-size array for enabled_count instead of dynamic allocation
- [3/6] Use BIT_ULL() macro for u64 bitmask operations
- [3/6] Use MXC_ISI_MAX_STREAMS (64) as loop boundary instead of num_sources
- [3/6] Remove mxc_isi_stream_counters_alloc/free functions
- [4/6] Add Reviewed-by tag from Frank Li
- [5/6] Reword commit description for clarity (Frank Li)
- [6/6] Add Reviewed-by tag from Frank Li
- Link to v1: https://lore.kernel.org/r/20260629-isi-v1-0-deebfdb1b07b@oss.nxp.com

---
Guoniu Zhou (2):
      media: nxp: imx8-isi: Implement per-stream reference counting for multiplexed streams
      media: nxp: imx8-isi: Add additional 32-bit RGB format support

Laurentiu Palcu (1):
      media: nxp: imx8-isi: Add 16-bit raw Bayer format support

 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  5 +-
 .../platform/nxp/imx8-isi/imx8-isi-crossbar.c      | 84 ++++++++++++++-----
 .../media/platform/nxp/imx8-isi/imx8-isi-pipe.c    | 31 +++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 96 ++++++++++++++++++++++
 4 files changed, 193 insertions(+), 23 deletions(-)
---
base-commit: 4d32fbba9d23f50d157ed4a37c9e8fbce61c904a
change-id: 20260626-isi-00f05b044ac9

Best regards,
-- 
Guoniu Zhou <guoniu.zhou@oss.nxp.com>

