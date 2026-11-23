Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.55
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795469686;
	b=O+mwJDRq3AN+DEowsfiM2RaKm0zqMWxtqb8LWBM2A1Sy82omFgU05JI4sMqrVUE8Stmt
	 fjcUlLVnomRKAM4o8hX+eWX1SknZnPePgudWGzUoXjhZ+p1qXYZcs0gI8YATcmSD5pYXf
	 UXPtMBFKBaqWj25s72UQyIflhAyFo6o9Dsf0Ye+y73YnvklQYNyxmWvbZ41bzYY6SD4bL
	 FYvGJ+e0kNzdqj1yZHRsX8DGkuFvQFB3HYSBloYkwfm5zG3uSTMLdzbkTo/u/KYyWr3Pg
	 SGJRJ0CPD8qmqDHPhUDklkHP80K5vvgqKieJKkm2GhOlosQof2dXDW5fwnlni52E2Ww==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469686;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=cuzRwxmF586+nXRSiJZ6v6PoIb4ECDNrQNP5RVNdUUk=;
	b=SLtU0c3QKfRLYsq4TWBgNh4BlYB2sVJuwYriNYkYBXUvFOxIJ4YUyn2yLRNUtUzWRAfo
	 YKvTsWPtRZP9aZBGBVYug/NhE0+R+ctpd5iDiuasRzV0u58Gv3llei7upsCQvVftLEmwL
	 jfA0bIIv2W1M9wnW/SPUPV23y40cH+EsVyjNpOfNgMnwnp3Tn8kZeADYE4qpakno+40/+
	 PW1A4kDfIz8TnlBsqj7hDkehfjF/S32x7V07Ew9AQnGiJOSWM3yLOTgohA2/xPcdan+WC
	 j99nYoXuwCT+W4b7fdrFdUHqfhNydf80LuA+AWfS2U5mCVIZBfYrMT4kxuwB05RLeSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=a2gq6HSS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.55
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011055.outbound.protection.outlook.com [52.101.65.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB4A606A326
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 21:34:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBB4A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=a2gq6HSS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cMoigdUpDGX0pGE7C1aqA8HtsVF2f3Nsus92P/zTW7JxUr0CIhoOd5aDxUO9R1neWroMGnSox5JMGZu2j4+RtbHio93eGTpCh0lVgNzVqN4AJs1kZ6Ss36UwZlIlMw8bTruzk3YqU+zHs23eNfKQLPEY7Bsgt8U+aOPq1pyh9lQ6WZ4QduZMNcmf+GzZGXm7V2hjCcQKWJfMj/zHDgUMv/676DrkYTl46Ao6thYdDNSb7M9p2hIUQHLzGXD6Svsl/XWqJOlAd5ETGgxh95HdCT0VlZYo3JsbKfyvjpmf/zzEiWdge66JuJXFZsRlnx/INw8U4Wd5WqPsmx3YZml6Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cuzRwxmF586+nXRSiJZ6v6PoIb4ECDNrQNP5RVNdUUk=;
 b=sLyugc23HClGe+EZN4QfI3BKcZQsu1CMIlE4HMxYBb+e7/HL2ipwsAWscAS9eDhxtPGbKDr4GX4B0bUe3fJLV/MK3E4Fy+Pht1vxmKTjlQkNBWFvSAXssu63rZASExr3yAKyT+2/s3IIYr8cHUQU69Spy3Z8ys9dheSYEOmd7QqHlPthNgSXp+Q67mo9G80rsNzHWjdmuJ7vhYu4JwxBHOWp3wplnATkU14DXfOe2edwX1T2m9uIKYSuwYzpvlkOxeu497AjqDxwswQltUs2xKkhdVtufWejUawwyQSgRyw+uY33+Ldtd91N9J96tVApV/Yr1gO1RBP8v4ukDZ4iVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cuzRwxmF586+nXRSiJZ6v6PoIb4ECDNrQNP5RVNdUUk=;
 b=a2gq6HSSbuEEgyvpIODu4m4hf+9dRt0V4aUDYqfbxGZmXa4IS5rAwrTMWFjdP6OG5pE8bAOU3zsZwwuC0039SQW3iPfS4914ouYzE1WyvEgFBI5103jytwFXNal7xQU4IyeqFAQ1ztMg37UG1qgHIQy8bIbeVnuux0J7M5EAbSgmUxOwj8Wj1l3CdHq4MuDr4dX2l3R558CLCQnAAr+qjiuZiTzkfezLlxjwAukqaJBqKmO94NWSrTLWMADKVeiY0ge9A7CpGhTQmrRC5o0du1oabnnzhRI8wpkUBoKysQ2BGDcGQuJBVuxQfVZueQfeVJQTSZIyFTRr556VleYrmw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DB9PR04MB9750.eurprd04.prod.outlook.com (2603:10a6:10:4c5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 21:34:41 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 21:34:41 +0000
From: Frank.Li@oss.nxp.com
To: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vitor Soares <ivitro@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Vitor Soares <vitor.soares@toradex.com>,
	linux-bsp@toradex.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ath12k@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: freescale: imx95-aquila: Add ath12k calibration variant
Date: Mon, 23 Nov 2026 16:34:34 -0500
Message-ID: <179546967140.2966585.2831171429960186619.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118123837.651915-2-ivitro@gmail.com>
References: <20261118123837.651915-2-ivitro@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH3PEPF0000409C.namprd05.prod.outlook.com
 (2603:10b6:518:1::48) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DB9PR04MB9750:EE_
X-MS-Office365-Filtering-Correlation-Id: fb381494-1634-4332-1cad-08df49a9958c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|19092799006|23010399003|1800799024|366016|22082099003|6133799003|18002099003|261009223027099003|11063799006|261028144727099003|56012099006|261021121427099003|261102123227099003|261022105027099003|261026121527099003|261022075727099003|261026140227099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	igchNHxEngZB+fcvdGgC3Iehr/PyMn3b7/P02kP/aokUbccMHWx7pUF/X0jKWWw1NW2e5ZyoLSj3yAuawcII03TscJP5asldUkwIUFO3XO39kFuDeiHClhaO7nLf83kcqJsxXl/DPv3xyooDu5cfQ7AB2Tq2kbgZ9jx0SQt57x2W4o3bgpjEaC283ZwCXn1ahRK8r+x37EWd9SaLwLTtw04sN7qDHtuy2YETps2wIUCegZAYDOPA6LCp8aOvzCkW3qY03yEqdUtLEgB6wxRXYyXylpXQHX/Sqp/n+WqD92KKI1C4WDzW6pUqtPChudK90lklg0ZBa3A/VhiFWwlZ8nAKNe0JR+yV+XtzJPy/EbJ6i6qQA9DWjwRvA5LhJRwvPywBY5pSP54N8+zNKhGioRZq2fBlQvVIEq8Dy5Lvd34maavboWM3rb+se1CZ9KIxsAt2xfM55Ja8n2r51Pluwm3Hk2uyc09uIAW7G+llncLtpeY0DyPyW7dZHdwXGuP5dTDfVJIYlc3Gw2aA2cmi/7vn3bk7gJYht8p9HE8ON7NxYu+n3UBdS8t3AGVqxkr8rq+mEYjsVFJXJkdn8PxLqHPUSYGQPcCl6vfPma3bxv7aRwyfVhhZsXooVrIIZY+hjvWeUKt3Ll8eYhIdtPzjlytd/h9KJ/Rzn0uRnmT0x48=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(23010399003)(1800799024)(366016)(22082099003)(6133799003)(18002099003)(261009223027099003)(11063799006)(261028144727099003)(56012099006)(261021121427099003)(261102123227099003)(261022105027099003)(261026121527099003)(261022075727099003)(261026140227099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFY4N1UwVElYZXN4TmlLWVVTcjZUSktwbGJFcWJlbkU2YktPNEYrYnhPZnpR?=
 =?utf-8?B?TWU5ZDZheFRuMUZvWmlJU1RvVmlKRmtBRkY3NTFLVWdOWW9rQWtiYTZ0V3R4?=
 =?utf-8?B?azU5amgwWEFZQnRhWnlQK01DT2xMZlFSK2E5QXdUdHlmWGV6ZEVhOTFSUTMw?=
 =?utf-8?B?b2ViS3RJVTJzaDFrZkJ0QVZXL3RZZk9CdE01aVpVS1l1WHZ6UnkzZGJVcHNX?=
 =?utf-8?B?OTZaRG9EVXZxR0VIaXk1RFNaVDEreFBUdWt4ZDd5ejhPVjNtT0RzZWJxVGFo?=
 =?utf-8?B?UFJZckZ0QkVqdWJNMHEyS3pXeFhPZ04zSHg2RDlxSWJabU9HUjVjeWVweVFE?=
 =?utf-8?B?RUF3MHdJUmwrN2w3VzZQcDB5QkowbGJXaGZsdFhiUjY2OFhVMTRJUDNhbTI2?=
 =?utf-8?B?MStiTk9kVlFtRGpCeFF1Y3M2dTJheTI4eGpFN0dBUkU0aGVuS0I2L0ZFT1BW?=
 =?utf-8?B?T0Rwb1A2bmx4a0NqQ3dTeHFOdTdxVkRSYUpmWjdvMXZiYWtvUk92Z0Z0RHdU?=
 =?utf-8?B?b0V0d3hTM2gzOE5VRjRpd1hsUFR5emZTMDFwL01PSWs5YS9DMVJ5VWNmbWZQ?=
 =?utf-8?B?Y1kySStiaGtkbi9tRzVZTEV6aTJ6ck8xMTEzRzFDOWRvTnZtZ2o0bWxtWHNV?=
 =?utf-8?B?VlR5YVRZaE1nV0h6NHEwZXVUSHg4dFBXZU1vdFZXTDZ5N3AwNUVSZGNabEx3?=
 =?utf-8?B?K0hkRU8xK1pJbUM1MHdsWVJKWVZEeWRySzk5alQ2eG8xQVZhNVUySnNMdEoy?=
 =?utf-8?B?VnJLcXlIS1AxRjZtUERDWWFyeXpJc3E0OGF1V0ZHcVdxU1pobjlZTi8yd29R?=
 =?utf-8?B?cEF5YkFha1JCQ2w3ZkwyWHBCMGJ5NjdjVHMyQStDTzRXMy9aMG5XcC9yMjc1?=
 =?utf-8?B?eVBqUDZoZmNuR1pEdlJieGswLzhwb3orQ1pQMlM0c1MvOFFpYkRqVmovNWpJ?=
 =?utf-8?B?Nk9IQUYrS1R5OWdtOU9ZbzIyc0QxL1dGK3ZSdktVeUUrSXlkR1dhVHhsRkt1?=
 =?utf-8?B?QnVxWnA4ZTVuMlZYUWdlVURTaTNXOExOVnlkU2UxblVDRkIzMFI2Rm5tUkI3?=
 =?utf-8?B?VEU1VGRJSkxudzFreU9IYzJXV2liMW9JeDhmNngvZEszUndTS0VRRFRqZERS?=
 =?utf-8?B?VW5ON1BaMU51amdJVXp4d1dRT3REb1ZvcnY5SVhEZTdLcitzR1hjRnZ6bTY4?=
 =?utf-8?B?NXMzZ2x1YUE5Wi94cVNPeVRZWDhEZUNNVk56cVZRdVBmdnhlaGdFRXcydERC?=
 =?utf-8?B?R0ZwSkJ5TGZDVm5wb05Qd0xCWGxuS0kzMk5qTFN1RUtsTUR4THpacm9EbDZO?=
 =?utf-8?B?ZlgzWnl6RGg3ZWxvZFR6cDA4Y0xJUHVjdC9aTW1JQzlXUHhLYmdpYjNYQTY3?=
 =?utf-8?B?WUtVdGNvS3hIR21DSjI4aFllVTluVHQ3NkphWVJyVlJMQU5aaGZCRDdONzBi?=
 =?utf-8?B?TGNpVTNtdHYvUWx3ZnZwL3V3SlJYcFlONnlEYWN6NVQyUmFIMTNHNjc2bXZO?=
 =?utf-8?B?OC9xdHdTNndGM3Q0YnMyZE50QWl1QzlYUUpSMmt3M3hQMEZJRCtWQ3JhV25q?=
 =?utf-8?B?VDROM09aZmx2Y3N6TmVKKzN1Mmd2UzJpYlFrMkhWWmw5M1Z4dTlPd1kxc3Jx?=
 =?utf-8?B?ZmlwTDZlS3N0bXpEWWdMcTBNc3dIUGV2Y1Y5QVFUdU5SYjNwRnpVK1h1NUNv?=
 =?utf-8?B?M0NFV3Y1WTVmaWxPVTRIZS9GdENQT09mbUN4NHJ0VC9oVEd2ZVNSQUgrbHlW?=
 =?utf-8?B?RnpDY2lqQzJERWZ0Z245VlVnYTJCZFZJZDhIUmVnWHVJa3NWNEZVQWZIMHVr?=
 =?utf-8?B?OTVlWERiNS9QWEt6bGNkeE9ZV2VQeTYrbkQ4eWlReHV1clFySm9OYXpqbDRo?=
 =?utf-8?B?L3lReGFlOUtwM280Mk9XTU9Kb0ZJL2xGWWZSeEhGUU41emlCWmxDZzRBZ2k0?=
 =?utf-8?B?dWtMcG5ZdjczMlQ0Rlo1ZDNwdXQrRlBaL2N5OEpCcWFrTVAwelhKVm5vSXh0?=
 =?utf-8?B?L3hwekRvTTJwMVZvNzNWUEdRUzY5OG91SlBOYTdIeWQwNGdqVUF3NXY2Yk9D?=
 =?utf-8?B?TTdEV1Z0SUNzOHkzQTFnNHQyeHE1eVdHQjUvUHRnVitlYkJPMFRDTDVheHFI?=
 =?utf-8?B?OHdsa3RBdHdsVG5JTFBzbzZPemZHZ1NPV3FwbWRocUorSEpFUzE1M3o0WFpq?=
 =?utf-8?B?RlBpbmkzcVFSaGd3SW9PdEsyTjB6YVJ5elJlM1A1L1NIR01rQ3Z0U1NoMmlL?=
 =?utf-8?B?aWVTTWpxZG5idnlFYTNTOTFOL0JiSldxYjl0dW1IN295ckpheDNrQXRVVzZa?=
 =?utf-8?B?YlYrOWk3WklQdmRNb2psR0VzL1hPN2piQjBqdWg0ZGNBelRBMHRBcW16Z25D?=
 =?utf-8?Q?b9v6/Om22QW+wIJYy6Ca6FYFaGXHP34zfMyiO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb381494-1634-4332-1cad-08df49a9958c
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 21:34:41.7950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D8KAwpj2Ue+xhMoiB+OMgh5Ep3CLHnuQ1/rGq++EwqHepChP/jcc6XX660M52Z4qHBg9T93PBEM3knD/J3Wldc7VOmVPOdIz1iKWHKuvUz7/n3EoEvfp3OZeIFcM72AO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9750

From: Frank Li <Frank.Li@nxp.com>


On Wed, 18 Nov 2026 12:38:37 +0000, Vitor Soares wrote:
> The Aquila iMX95 has a Silex SX-PCEBE Wi-Fi module (WCN7850). The
> module reports the same PCI and QMI IDs as other WCN7850 designs, and
> its board data also comes in variants for different regulatory domains
> (US/EU/JP, UK/CA low and high). The IDs alone therefore cannot identify
> the right board data.
> 
> Describe the Wi-Fi device behind the PCIe1 root port and set
> qcom,calibration-variant to the US/EU/JP board data.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: freescale: imx95-aquila: Add ath12k calibration variant
      commit: 8a03967da41f55b803d31a6c5b5052bc35346eb6

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
