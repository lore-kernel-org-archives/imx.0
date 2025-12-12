Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011002.outbound.protection.outlook.com [52.101.65.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A172DC772
	for <imx@lists.linux.dev>; Fri, 12 Dec 2025 10:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765533880; cv=fail; b=sZhZcvtvb0Eu61aVX21pgn5BcOMqtsF/kAzPP7QNURfvNJv4ymdayBW7LBMpMgXck1Cx9vMFHF79OgxHHUmIHxLSm/4NQAA54lkFHZ7LncBG1hcjTBDpE8KjNyxZXiD2Dt0WcodkCifsS9/5BZlE6QexjiQAknqdfn4ucErmJy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765533880; c=relaxed/simple;
	bh=VB63zEnh5YolKxJFdI/gSWaMbc0xCQ58Zmv1/Hrjr+o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=sV9QR0Uc8i4IQNfcvQ0FUGSF6KlKIVteIUWmS23lj2h60UD2zctyc0jl4L+LbCpIEVOnZFAJmwhhP0QZDLot+FxCr+4QEK/T/V8v89GyNPOJjuVUX4R4c2pmoyMfin06tThcSex7C+8YO+fCGqBPDFYulUSwI2s7knRD/8I0T0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=kAInuFob; arc=fail smtp.client-ip=52.101.65.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="kAInuFob"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TX11WQtWo/knaDj0m6li8h04oAHZrPSCZLV2Uh5GPRzQC1n15CtlVKdm3wFhB2TzcyCZcXmxAndUKJ679OlGX6wkPz7g8MqL6gv3U403w7WQjt7G7SmC6txVwIoFTkITDkAPstRUrrvwomm0Fs7TpPfwgZbnBX7UGFhltOgCZwo78kHQ53jYelh/pVYSYUu5tA2MR9UYjFScVBbcHg3NZEKCTXKGyrlL1udIe2LDOG+QxIWifOByBLNTGHH2S6VsgCOYsoc8djgS6fz/t4FjanPqCt0ciiM2Q7+ZKx0zTB3A3bMQz/t9sWrCXAw8eEcmNHSVKtnycUvemWc6IiUXBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VB63zEnh5YolKxJFdI/gSWaMbc0xCQ58Zmv1/Hrjr+o=;
 b=KOffQ/hwDTNGZdZon7g+jbxGXFfZxD4wWsS1CHd8uljuDt89KZb74tFZnEmOxgEpr3ee7p37NuZ74A3B4kt6Uz7yPPypNGm69+zQPxL2lWAMGTi+lPON9eG+UXkhLlJRlxZ92JSPhHxqzOWJACNDlmDuHlJwS6NAfkb+t/yfpluVtrTzL8x5NALFSkDPAnXBN/nPGWa95+RdMkw8UNprGAc7VZ2pGTWoF3694VXnU6ZB5FyJd2hiDW+W1GoC8oITUgXKJsRw+aXKpUJfdtqO/rb88kZLV63POWJA6+W8eP5F5CaKkcKJ2B7UZQIPLvwaqDlRKVR0M1yUEpABzVRsxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VB63zEnh5YolKxJFdI/gSWaMbc0xCQ58Zmv1/Hrjr+o=;
 b=kAInuFobA50erKRg9W6ZbrRjRujavcWe/sePjiyCIMM7yq/fACn93vSiDOwctSNNjM+0jAtO1H0xxuj3YUVBjh/8DLy1mWGnCaC9oAqNukSrD0jrz4ipzZ7Pab/Ae5ThuLCVq9YYG3SOBPH466XmR1PhGS8GMajlu2spctAUzSu3Rd/TH4BvB8QLvpjJdgB0UDaHbChJYc52Sz3FDbLr6x8Yxt/xVxdTsG2J5TNWnJBOnrdo9mTIiXxxCdxPPDYQR7ZHOZPYyoSLYTtxHPgxqnm6aVJQlPlClM/AYiDhSs5/jQnPeU7MbTsIQvdTirVEIUwTgYYqOfNblcmTAbo/Eg==
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com (2603:10a6:10:32d::19)
 by AS8PR04MB9048.eurprd04.prod.outlook.com (2603:10a6:20b:443::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 10:04:34 +0000
Received: from DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33]) by DU0PR04MB9496.eurprd04.prod.outlook.com
 ([fe80::868b:3935:5e0f:6a33%6]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 10:04:33 +0000
From: Bough Chen <haibo.chen@nxp.com>
To: Michael Walle <mwalle@kernel.org>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Pratyush Yadav <pratyush@kernel.org>, Miquel
 Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Han Xu
	<han.xu@nxp.com>, "open list:NXP i.MX 7D/6SX/6UL/93 AND VF610 ADC DRIVER"
	<imx@lists.linux.dev>
Subject: RE: [PATCH] Revert "mtd: spi-nor: micron-st: use SFDP of
 mt35xu512aba"
Thread-Topic: [PATCH] Revert "mtd: spi-nor: micron-st: use SFDP of
 mt35xu512aba"
Thread-Index: AQHca0FxCEaUmSyCeUy+98b5FduawbUdrc6AgAAAbHCAAA3TAIAACRMg
Date: Fri, 12 Dec 2025 10:04:33 +0000
Message-ID:
 <DU0PR04MB9496F2D42FA025CEEA1B822390AEA@DU0PR04MB9496.eurprd04.prod.outlook.com>
References: <20251212-nor-v1-1-20a5a381979c@nxp.com>
 <DEW3M3BQEGIW.3AFGPPSCBGI16@kernel.org>
 <DU0PR04MB94960504A809674A265689D690AEA@DU0PR04MB9496.eurprd04.prod.outlook.com>
 <DEW4P4X1DBYG.1Q3T05DX2784P@kernel.org>
In-Reply-To: <DEW4P4X1DBYG.1Q3T05DX2784P@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9496:EE_|AS8PR04MB9048:EE_
x-ms-office365-filtering-correlation-id: dd967090-d087-4335-8ba3-08de3965d99c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|19092799006|376014|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZW1PM0d4VGJTUXpSK1RSdUJXL1k5UmZIME44aUJVT1VTTXRYM2NIQ3lkb3Jx?=
 =?utf-8?B?UFA5NUlDTDdKVmpPcmNJYzFuMUJGTGQ3NlJTUjRWdlZKcEFZcWFmc2tKM1ZH?=
 =?utf-8?B?MGdNUWtSYVJVMXVZOWxYSExlZ25mZm5FRE1jd3ZHR0swRzZiaWhYQXVLY3Q2?=
 =?utf-8?B?MXRBSDJVcWw0TzhDR0hCOG1rUEFQQWR4UHhPcW5UYkVEZjBlRm9iVGM2dHJ1?=
 =?utf-8?B?Rk1FRVJzWjVwKzlQd1Y5SUVybUJ1c3NPTkhoODhjbWNIbGN2RWpmRHZRaDRi?=
 =?utf-8?B?SUQrNWxES24xOGhTTkRCb25pOHpCWDk1QUdBSG5teVpZRTZ0T3drY1VEMEN6?=
 =?utf-8?B?djAxTFpNSk04eTdacU40Y253RmhYbGpQQUtMRHF0cG80WXU0UjN4Uk5qclRG?=
 =?utf-8?B?am5lbE5CdHBJQzZjK201WVNrVWl5RE93aWhqVVRnVW9MQWpHVFc4dzFRajhY?=
 =?utf-8?B?U0p6Z3ROaUxTNU4wenk4YW5vUFJERk5SZnMzWUJMQ3YrWlROVXZOWVMxdjhz?=
 =?utf-8?B?QkVHYklaU3RJbFIrWkVGbkdJRHVLYjJ5OCtoQUJML291TjZKSjhDaUY3REFI?=
 =?utf-8?B?Sks4M0x5Q3hDWXpPdW42TC9ZU2ZEM2VwVXNPNG9Zbzl1L2s2Wm5wL0xyKzk5?=
 =?utf-8?B?QlRXVjlJQlRoS0g4ZEpyZ1V5Sk5ZWko0WU9NaGZXQklBNUZqTXoveVhESTNC?=
 =?utf-8?B?V3NNY0E1NWp6YzJkWDcveDdodGRlMjFtaGJsNW9WMTl1SXRldk9ONlV2a2lz?=
 =?utf-8?B?SXNwUE04Qmh6eW0wU3I4ZGlHKzFqOUg4V3d0Y0lhbVV5eTRYbm8xYk1aSmh0?=
 =?utf-8?B?TlJvNkhDbEErc3ZLVXd2Wmc4enp4elYzQ2Z0YXJheGNHR3E5aExqV1oyR1pK?=
 =?utf-8?B?NVBsSzBuS1E2YjVLdlB4ZXoveEpaZTRXT3dhV3UwdkcxR29rSERhdFFlaGhU?=
 =?utf-8?B?S1VqRTNTeE5ubDg3V3kwMEdlQzBqQnZUbjVGRnBreWFDaXZNN2RZdkV4NFpD?=
 =?utf-8?B?cjd6SW5ZNVdmTEVLNGpxbkgwSm44dnJ0bjY2V2toNWlVOWRQbzg5cnpyZVBN?=
 =?utf-8?B?UyszZnhrMkp2b1RuM3hKY1dLaHdYOEpCdHdETnFKVHIrQzd6M1h0WlZ2Wmpj?=
 =?utf-8?B?UHRTaFR0QUNJR1dqMHo3a1hVN2VDdHFMNzNLRzZxbUFuWUJJUzQ3dyswdGxw?=
 =?utf-8?B?ZVJ4Z2hlT0xTL1JkQjI2VXBXNXF0OEJqaFBiUlE1dHRvMkVyR2tmUkFIQ200?=
 =?utf-8?B?WlpsQmpsQThqTUg1NjFEUmVYWVFGK2lVMmFLUjA1UVRPS1ZsakRneFJpbnFY?=
 =?utf-8?B?cysrL0xvczhVQ0ZLdzI1SU5EZHZ2Sjd2aG5SM3dSYVBCaURiSlVKWmhCUHlh?=
 =?utf-8?B?ZnNqUXZYVUNEQXhjdXJqMGZzajZFZHFlZUNtNjl5TlhMTW5DaGN6aCtSTitD?=
 =?utf-8?B?bEJsT3d4bEwzdFhxQlR3bTExNkRjUEFpU3F5SjFzWVl5MkE3aVZucmNyRE9M?=
 =?utf-8?B?R1o4WHRXSlRpaEZoYktidlovSjlnekl1MC9ZK2Y2OVpUMTZxV3MvYStvVkgy?=
 =?utf-8?B?ME81eDVydXZLbWlzbkU1eGR5ZitoUFA2N3hTMEhUUmI4UTZSMG56SEs1cm1V?=
 =?utf-8?B?MGlxSnFPSzlreFlrcEp1OGRSL1pLZjZGaC9mbmV2d3FWVmRKOTkvemtKcngr?=
 =?utf-8?B?WWRjVlBuNCt1M2dSZUpzVXh2SkRickNuczRzSjZsamlhNTg5TFk0aU8xWTNO?=
 =?utf-8?B?YXIzQ0pIUkFVQTFkSWlNYnRWK0tmRmluOEN5Tys1RXBwQVNReFZPQ1hQemZ5?=
 =?utf-8?B?UWdEVDQ3R0ZCRlRPcGJ0TC9aNGpPMUd2QjJoZ3RqSWQ4d3ZJTU5RNWx4S3Zm?=
 =?utf-8?B?MzJycmFvT0lWTnpFYS9jQnlKck53Rm9oWU9kWnJtOFQ1QTcrWTBxKzQ0N3ZU?=
 =?utf-8?B?K2J0SytLOVVEb0Z2bU1oVUk0MjNGYnBNekt1NklpK1U2VitlUThpdWx2V1ZX?=
 =?utf-8?B?LzUrT2dLQTJHK1YrQ3NCMjlZeDErdVlBSjdvelF2Ti9FMmEvN2VxQkZoUmV0?=
 =?utf-8?Q?56CqRv?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9496.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NWNGMXhFYmxiSnpxOXZhY1VzQ09samNKOFdMYndhYi9DNXNIc2JrK0NuYnho?=
 =?utf-8?B?VXhDRUIrUERreGZlWCtVSGpocXdXOVlqZFA5OXhDUFFyVGF4Z2cvd1JOTzE2?=
 =?utf-8?B?YTVQRmV5R3dtV2xFdVdwU0tRWmJwNEhBaERIa2RlNXl0M3JITE9BR0FyOFFO?=
 =?utf-8?B?QkRkQnBhR0JxM2h6VjE0cmtpK2lDd3BJYm4vMzRmbU12S200VXBhU3J0MXdH?=
 =?utf-8?B?VHphZzFIdE9uUWtuUlBGUWZDSk9OMFNXZmU2b0pHcHJXdWJHNnEzRkcxS0V2?=
 =?utf-8?B?YUU0ZFQ4cXkwOGlZdFZTL0pud0NCOWU5VkVySzgwZ3M3aWRwdlZtVnVYcUU5?=
 =?utf-8?B?d2RiWG8rM3lNbExTRXhCeE0vcFFnNHpEdW1ldXhqQjRPK2daZ2FGbldRNGFs?=
 =?utf-8?B?RFRLV2liVkJmTk8rNkp1dittY2RyOHk3RDFGZmcxR0dXMFQyVy9IOU0ydFU1?=
 =?utf-8?B?MndCZ2FmNTJnRWpibExtWFNCSGtFR1VvRDJqM3ZUWlArbEdvZWdWaEZzckg4?=
 =?utf-8?B?aWh3bkdjVVA3Mm92L0xOdGpaaUg2ZlNMODlRdjJTaWV3ZVlBRmZCQXN4SDdT?=
 =?utf-8?B?cHhaZS9QNUQxTmNQVlBiZjZ2aWE0T01sVHlIWnpxcFl2Yjh1eTEwUjJYeW0r?=
 =?utf-8?B?elpUSkpBQ08yUCs3S2R1RlBaYnY4MGlXekR6dHd3d0E5aXc3Sm9LQWpSNHNh?=
 =?utf-8?B?MFpqalgvZFVEdG90VktpR2srZ3BiNHBMR2VTSGtTaEU1WEZVTDQwc205djJ3?=
 =?utf-8?B?NW0wTWpiNjJPdGFQU0VCellGMEFwRTJRVGcveTFmck5BN0twRHhpMGRZL2h5?=
 =?utf-8?B?UGZyZzc1SDIvTlMvZkRGWFpScCthSXIralZBYklQbGtqdDV5b2ZEVHMzLzVP?=
 =?utf-8?B?T2oxNjFlalowUnZSbllMeTZTaGtzaWNxdHJ4T25XeDVvTFJ0cHdIRlZueGdW?=
 =?utf-8?B?QTFQTk1aQnYyWVVZSmpEQ0ZiY3hwbVFJaStiaFRxdXNWQVR2am8wWU9SRHM1?=
 =?utf-8?B?dzM2S254Y2RwUHVsNzBDRGdVQ3dBS2VXYWU3M2NNalUyQXliWk5ubG9KbFdh?=
 =?utf-8?B?ZU9uUWFDUG5DYVZGa1pabHl0T2V5dDlrMFlTcWxkVGpveWJ5SmkrZngvSUpQ?=
 =?utf-8?B?OFpaM1pzN0lraitURjF3TmRnbjZpekFtaXVESWxjNGxjZjdUakE5K09ySnZL?=
 =?utf-8?B?TFdIRDBLYkw2OXZEZUpvWXh1VWpSUWI2dHE5NGJCb1Jlam5HbmFLZk91c2RD?=
 =?utf-8?B?UkJWcGhHc0JqRHNyWWowV1pzNU9MYjRuL2hWOXl2akNlYTVkUkcrcHVsMWF1?=
 =?utf-8?B?VmZpQW83SE9sQ2t0bVIzUzJsQjJXblIrWTFzVW92bS9uOWlpa04ya2lITHdY?=
 =?utf-8?B?M0Z4bUtHYVZ5dktSaGpIVDM3MUhaUTZXdnZ0dTMrVE5xa1o0Y3FsdzZvTTd0?=
 =?utf-8?B?Vm1UeGdmai9TYzA3enl0VjVCcWF6bTNtK0tFR2I1K252NlMrOHhydk1OcFI5?=
 =?utf-8?B?VUFLZEw1dUN0Nm14V0h2TUFCNWx6ZmdmZm04RkNQNkQ0VlZkeHRKRzBCbmZE?=
 =?utf-8?B?Lyt5SHZ2Y3JQaU9EaS9KUFBuS1pqTTdqbEk3MnRmRXBSczRDcXN5UUcrN2VP?=
 =?utf-8?B?T1A2VnZGV3B5am15blZWMzY0NnBoM2hicitkUzlGTEdTWTJ5TkJyS1A2c2g4?=
 =?utf-8?B?dGRBblRHckxmbDM2bW4xdGRjcWYyNEhlSyt2S0ZTbkZoUktMK0dDcDdWUE9s?=
 =?utf-8?B?NUk4L2JjdkxlYWxNTkUybXh4L0pqcE11SGYvaTgvaEZqYVJCWFIrVkFRSlRE?=
 =?utf-8?B?U3krTTRvZGhQN2VEVGdpUDUzMGpCd09QNTkrRW5CWnpPT3lybjJ2ZnBhbUts?=
 =?utf-8?B?cTlWeFFoWXZWdVR5aURFZEpWN0dTRFBsaVpveFJxZ3pIeTdDSGsxTzFnWnFi?=
 =?utf-8?B?ME15WHdZcXNPbmwxUXB3cm9aK29Lb2w0ZHM3ZVpwMEVNTkFBM1dhSG4wM1My?=
 =?utf-8?B?T0F4QXZnMm4rWVNXMjVzOERNMmFpbjNMTkYrNDFvVlAzRGY2K0dvcitZdXNr?=
 =?utf-8?B?ZWhpQTFNeDNNWi9aMDgzZysyU1dLZEhaQklUaGIyd2g3YXF2ckR3SjlnUkZ2?=
 =?utf-8?Q?a2fE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9496.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd967090-d087-4335-8ba3-08de3965d99c
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2025 10:04:33.8380
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FlyuRhMgYkkMspAkda44wEJBhMfrahQV2ByLmSoNPZ0sjV4Pwn4bnTejQvZwTa/U+EIKf2LWhVYxWmNFWzE3iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9048

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNaWNoYWVsIFdhbGxlIDxtd2Fs
bGVAa2VybmVsLm9yZz4NCj4gU2VudDogMjAyNeW5tDEy5pyIMTLml6UgMTc6MjYNCj4gVG86IEJv
dWdoIENoZW4gPGhhaWJvLmNoZW5AbnhwLmNvbT47IFR1ZG9yIEFtYmFydXMNCj4gPHR1ZG9yLmFt
YmFydXNAbGluYXJvLm9yZz47IFByYXR5dXNoIFlhZGF2IDxwcmF0eXVzaEBrZXJuZWwub3JnPjsg
TWlxdWVsDQo+IFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNvbT47IFJpY2hhcmQgV2Vp
bmJlcmdlciA8cmljaGFyZEBub2QuYXQ+Ow0KPiBWaWduZXNoIFJhZ2hhdmVuZHJhIDx2aWduZXNo
ckB0aS5jb20+DQo+IENjOiBsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZzsgSGFuIFh1DQo+IDxoYW4ueHVAbnhwLmNvbT47IG9wZW4gbGlz
dDpOWFAgaS5NWCA3RC82U1gvNlVMLzkzIEFORCBWRjYxMCBBREMNCj4gRFJJVkVSIDxpbXhAbGlz
dHMubGludXguZGV2Pg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBSZXZlcnQgIm10ZDogc3BpLW5v
cjogbWljcm9uLXN0OiB1c2UgU0ZEUCBvZg0KPiBtdDM1eHU1MTJhYmEiDQo+IA0KPiBIaSwNCj4g
DQo+ID4+ID4gRmluZCB0d28gYmF0Y2hlcyBtdDM1eHU1MTJhYmEgaGFzIGRpZmZlcmVudCBTRkRQ
IGJ1dCB3aXRoIHNhbWUNCj4gPj4gPiBqZWRlYyBJRC4gVG8gbWFrZSBhbGwgYmF0Y2hlcyBvZiBt
dDM1eHU1MTJhYmEgd29yayB3ZWxsIGFuZCBzdXBwb3J0DQo+ID4+ID4gT0NUIERUUiBtb2RlLCBi
YWNrIHRvIGhhcmRjb2RlIHRoZSBmbGFncy4NCj4gPj4NCj4gPj4gV2hhdCBhcmUgImJhdGNoZXMi
IGluIHRoaXMgY2FzZT8gQSBuZXcgcmV2aXNpb24gb2YgdGhlIHNhbWUgZmxhc2gNCj4gPj4gY2hp
cD8gV2h5IHdvdWxkIHRoZXkgdXNlIGEgZGlmZmVyZW50IElEIHRoZW4uDQo+ID4NCj4gPiBIaSBN
aWNoYWVsLA0KPiA+DQo+ID4gWWVzLCBzZWVtcyBhIG5ldyByZXZpc2lvbiBvZiB0aGUgc2FtZSBm
bGFzaCBjaGlwLiBBbnlvbmUgZnJvbSBNaWNyb24gY2FuDQo+IGNvbmZpcm0gdGhpcz8NCj4gPg0K
PiA+IFdoYXQncyB0aGUgbm9ybWFsIHdheSBmb3IgdmVuZG9ycyB0byB1cGRhdGUgdGhlIFNGRFA/
IFNlZW1zIGFsc28gbmVlZCB0bw0KPiB1cGRhdGUvY2hhbmdlIHRoZSBJRC4NCj4gDQo+IE5vIHdo
eSB3b3VsZCB0aGV5PyBJdCdzIHRoZSBzYW1lIGZsYXNoLCBidXQgd2l0aCBuZXcvZml4ZWQgU0ZE
UC4NCg0KT2gsIEnigJltIHN0dWNrIGluIGEgZml4ZWQgbWluZHNldC4gRm9yIHRoaXMgY2FzZSwg
ZGVmYXVsdCB1c2UgbmV3IFNGRFAsIGFuZCBjYW4gdXNlIGZpeHVwIGZvciB0aGUgb2xkIFNGRFAu
DQooMERBMTUgUlczMDMgaXMgb2xkIG9uZSkNCg0KPiANCj4gPj4gV2hhdCdzIHdyb25nIHdpdGgg
dGhlIHBhcnNlZCBmbGFncz8gQm90aCBzdXBwb3J0IFNGRFAsIHNvIGlmIHlvdQ0KPiA+PiByZWFs
bHkgbmVlZCB0byBmaXh1cCBhbnkgZmxhZ3MsIHBsZWFzZSB1c2UgYSBmaXh1cCBjYWxsYmFjayB0
bw0KPiA+PiBhY3R1YWxseSBmaXggdGhlbS4gQnV0IGZpcnN0LCB3aGF0IHdpbGwgZ28gd3Jvbmc/
DQo+ID4NCj4gPiBZZXMsIHNvcnJ5IHRvIGxhY2sgdGhpcyBpbmZvcm1hdGlvbi4NCj4gPg0KPiA+
IEZvciBtdDM1eHU1MTJhYmEgY2hpcCB3aXRoIGxhYmVsIDBEQTE1IFJXMzAzLCB0aGUgU0ZEUCBk
byBub3Qgc3VwcG9ydA0KPiA+IE9DVCBEVFIgcmVhZC93cml0ZSBvcGVyYXRpb24sIGJ1dCBzdGls
bCBoYXMgb25lIC5maXh1cHMgPQ0KPiA+ICZtdDM1eHU1MTJhYmFfZml4dXBzLCBpbiB0aGlzIGZp
eCB1cCwgaXQgY29uZmlnIHRoZSBPQ1QgRFRSIHJlYWQNCj4gPiBvcGVyYXRpb24sIHNvIGZpbmFs
bHkgcmVhZF9wcm90byA9PSBTTk9SX1BST1RPXzhfOF84X0RUUiwgYnV0DQo+ID4gbm9yLT53cml0
ZV9wcm90byA9PSBTTk9SX1BST1RPXzFfMV8xLCB0aGVuIGhhcyBubyBjaGFuY2UgdG8gY2FsbA0K
PiBtaWNyb25fc3Rfbm9yX29jdGFsX2R0cl9lbigpLCB3aGVuIHRoZXJlIGlzIHJlYWQgb3BlcmF0
aW9uLCB1c2UgT0NUIERUUiByZWFkDQo+IGNvbW1hbmQgbWVldCBpc3N1ZS4NCj4gPg0KPiA+IFdp
dGggdGhpcyByZXZlcnQgcGF0Y2gsIEkgdGVzdCBtdDM1eHU1MTJhYmEgY2hpcCB3aXRoIGxhYmVs
IDBEQTE1IFJXMzAzLA0KPiBPQ1QgRFRSIG1vZGUgY2FuIHdvcmsgd2VsbC4NCj4gPiBBbHNvIHRl
c3QgbXQzNXh1NTEyYWJhIGNoaXAgd2l0aCBsYWJlbCA0S0ExNyBSVzMwMywgT0NUIERUUiBtb2Rl
IHdvcmsNCj4gZmluZCB0b28uDQo+IA0KPiBTbyBib3RoIHN1cHBvcnQgYWN0dWFsIG9jdGFsIG1v
ZGUuIFRoZW4gcGxlYXNlIGZpeCBtdDM1eHU1MTJhYmFfZml4dXBzLiBJSVVDLA0KPiB5b3UgY2Fu
IGp1c3QgdXNlDQo+IHNwaV9ub3Jfc2V0X3BwX3NldHRpbmdzKCkgdGhlcmUsIHRvIGZpeHVwIHRo
ZSBzdXBwb3J0ZWQgUFAgbW9kZS4gQnV0IHBsZWFzZQ0KPiBhZGQgaXQgd2l0aCBhIGNvbW1lbnQg
ZGVzY3JpYmUgKndoeSogd2UgbmVlZCB0aGF0IGZpeHVwLg0KDQpZZXMsIHJlYWxseSBnb29kIHN1
Z2dlc3Rpb24sIEkgd2lsbCBoYXZlIGEgdHJ5Lg0KDQpSZWdhcmRzDQpIYWlibyBDaGVuDQo+IA0K
PiAtbWljaGFlbA0K
