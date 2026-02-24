Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013036.outbound.protection.outlook.com [40.107.159.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2B63ACA7C
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 18:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771956224; cv=fail; b=ZFAlYcA65FrnAT1Jx8hBD4T8f6csWdxsi8DLSwmO1ujCgKTtohLI3LqDycCt6f57IH9o0HR6VY3+IANico9XPTEqTVKJfpALRlads/+0S3OFMGQF7Imc1DRMJ6b4GrjuzebtVqsgPLODr5yDvZ6XdirGAPvI5pK6TUJeYJZOVs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771956224; c=relaxed/simple;
	bh=bhfodBuva6xM+0LY5TE3CrS2Ri7x6UGkD/Vd0yg1f1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jUUVN61lvaULk7doPc+3+nS80ksi5SWJHBClO8uIQABtr4STw1XmgdkPxX/fXBE9LrVT3PSlPguNq2AcDGY5QyPl/M+m+cuTWWvEZr/Q+e3t/r9PLN141D9uTz7UiYrMkWk1LXQ2eAzkpijYSi3O75c/5dC2NjWCF5ZmgznaBls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MiMlNhL+; arc=fail smtp.client-ip=40.107.159.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MiMlNhL+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LurdByU20NQYAHzno2FYexcJyH0dYHqnruxNQ9zil7zs3QrWRkvMkDQzA8m1rnDIHg7tByqPiPSKn8kpa6+U/TiCToNBzyg9pJ+y6ITJoOLuKUi4CJwp5eD0tCV+iX4JtksdmkTPJRLMFQemZA44wowljYTOPEhhRiaasdF/qb+tUMnXdaXtl+OGJ/ZBUCjGmYoRvs3iLwlbtb42F61S7+zaZZi07lCqBVrrQXb2oRfBtzH3wUPfVE8t6NZ2peaTT8x+QnPQakZYh+z3f8uZ9FlgMj26BG2AswNyHh8nA19LtrcP+hL0BFEJjpgNn+CdMlACffgbOTlf9fyh7IIo7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhfodBuva6xM+0LY5TE3CrS2Ri7x6UGkD/Vd0yg1f1M=;
 b=sC456waRsH2cbt+5MD3hQwsasVyZFZ8WDrYzgpIrg0U2ynynwWrYlQDZZ/2YYppdpE1p8rqLtA43OkhZi/CErBMdkwE7YRk4UlxtLQaY7XqTuSIIFscD7bhQWnwJjXd9SYpzgv6jRfKOiI7Q718BJkYfYLIHj/rbc26YbCjbz78MruoWm5G+12Nl+ZlA9QfBZU1uLdsOJjh3wWY7AAH5XW/SQzk6CHngM3fG9sbrw+OrFVw/cBfSjzRIQEVVeYzXmDyt3Idoq9zy+nhYNXW9F3g5KJt4V8t0btjcJRPPk4/htM/xryEW9ak3ov30da+t5VmlZ8kdKFwZdpQ4l7NKyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhfodBuva6xM+0LY5TE3CrS2Ri7x6UGkD/Vd0yg1f1M=;
 b=MiMlNhL+mqVU+lMyt12/rK3v5yYsmEX2qiOYmbhPdND7jPgppkURri+lWSsyUQ84ZcZB832dinAxeLotR/poe19mLCYTSmzJlFpPr0feLAvg8MhzxeKzVebcErz2+xsj26TT9Mle7Z5bTcVBTCjmYAG3KiKYoZmD1y+xCABHo9d3AGQLfTZargY/T8K4Y4OCi4LkGSuBBpPOYoNRPysv9GUQRtedI2fwRtwAvmSZL827umd6Wi/48tCv6NGj72/+trU3X14BxcZeN9Alcy8WsRpMgGHbafi8qSHKbwixRJjyZBqENx93UEgQkDX0A2krZ4DYSToVAYeYE43e9w8aTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB12239.eurprd04.prod.outlook.com (2603:10a6:150:31a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 18:03:38 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 18:03:37 +0000
From: Frank Li <Frank.Li@nxp.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Yannic Moog <y.moog@phytec.de>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v5 0/3] Add support for Variscite DART-MX95 and Sonata board
Date: Tue, 24 Feb 2026 13:03:11 -0500
Message-ID: <177195616274.3032093.15485094966021860893.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260119183604.88192-1-stefano.r@variscite.com>
References: <20260119183604.88192-1-stefano.r@variscite.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR15CA0002.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::29) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB12239:EE_
X-MS-Office365-Filtering-Correlation-Id: db47ea2e-046c-4413-156e-08de73cf0802
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?SnFHMlJ3NkFSbEM3bVhENXFXRzhhM3U2N2s2WVhRQjcySStOTkZZQ1N4bjFJ?=
 =?utf-8?B?bm9tT0lSeFZHM0VqYUZEcmtxR2JkUmFBc054QWg0WVB2MEh0dDRITURKTWlR?=
 =?utf-8?B?S281RE1ZSUFrMjRIUW9hT3NVeXV6ZTZSd3BGZkhPMG1HbTFEclhUYXBjMG94?=
 =?utf-8?B?MmFNWmNOaFhOenAzaHFMd0FnbHdVWGtHK3NCaEMxS3ZNL1ZIVTRkdWUvdVYw?=
 =?utf-8?B?T0NFVlBLU0thZXBFNzBWd2RveDB6K2dlMWlJSU93bjNnV09qM2RjRG9MdlRM?=
 =?utf-8?B?OFV4UnFvRW1qbnhiVHRlaFA1aml0cDFBTUYzcTY0OUhvK1V6MS80aVlCdFJp?=
 =?utf-8?B?OG9NK3VlM1FocVh2MDB6QWgyMTRjTHZkSG52cmFJaWZKbWZTQVFxdGdGOEZM?=
 =?utf-8?B?N2ZYMDBSNGhpZ2ZUNlJmZnBHWGQzd0ZIZ1U4WTg3eUxLRWRMS2RlT3dIZUxr?=
 =?utf-8?B?bk9kejB0SERUbkpmVXdDVmp0cjNwR2E5eGMzaEwxVnBXUkRxOE84dzdRNHcr?=
 =?utf-8?B?cExXcUxuVFVJaW1ZSGt0dGQvYnBrcVB1cEc0THQxckZnK2tRaHBJS0RhN3Ev?=
 =?utf-8?B?S3ZxdDdBYTVVcVdKM3Q3YnU1ZDg5Q3A3ZzBJU0UvS1ZhWEpVc0lhZnFvUlg2?=
 =?utf-8?B?OVd2ZmQ1aVpJamJoZVdlYmFzbGlmQktJNlZsMTFWN09iNFVUVFk0OW1mc1ZU?=
 =?utf-8?B?Z0wrZ290MEtDdXYyYitPSEhjb3lzdDN0RmdoRDlaTFUrbDgxaCtEaWJmM095?=
 =?utf-8?B?WnNMMGF5dHduUElmYTJhc2hCelhiQi9BMXVMbVpqY3B5L3ZZWGNFRHVmVHpq?=
 =?utf-8?B?M1hjWDBEbzdBeCtGU0drazF2dWFHaGdGZVZzZCs0SUZmbjRqMmRSQWZmWmY4?=
 =?utf-8?B?Zlc2Z2VDVS9zZnpJNmRMdXkxeFRwbFBFamlPL0pPK1M5NjRCVmFicnlBVVF3?=
 =?utf-8?B?R2x2WlJudzhlLzFYWnJla1g2NnFKTGk0VkdNWnl1ejkxM1lmZ0d3TWtnNTNB?=
 =?utf-8?B?YmE1TnYxUHV2U0xldlJoUkVnRmsvY3M4ZiswNUptb25TSEQyN1lmVTd2MFJm?=
 =?utf-8?B?V1FVM3pSVUVuRkFhY1FKQTh0RFpKUkxnV0w0cjlpV2JJdWV4SkIxU2hPUE9J?=
 =?utf-8?B?TGdsNStGdm5GWnVOaDBkODZMMUxkd0dTeEQ2OE9RY252NXZ3YmxpUVlZbEFr?=
 =?utf-8?B?MCtXcWtrZlBGa2orRlVCRUpscFV1d2R5c3BNVURHc3ZOUW5pckhTOUl2YlVX?=
 =?utf-8?B?VG4vMDNaR29nSTVhUlFQZEdRWHlVSmw1bnJqOW8rRVd4UzlGa1hOZVhlSzlx?=
 =?utf-8?B?REN1NzUvRWRRNlRaZW1ldmZ1OEI3SDJrSTV0MU5tWk9HWHBBNlpkOHBjbHp4?=
 =?utf-8?B?VTl0eWxKY0VJcnIwd3UvdFVMQWp5UlZxd3Rxd0p0am1nYUorc04xNDRrUFNY?=
 =?utf-8?B?UFBpNXh5OGRWUkdsTm01eHkvTVBKdUJRcDJDcDgvY1Evb2FEWUJ0RUkwb3hZ?=
 =?utf-8?B?SXljL2ZvTVpsRDM5MkZHUEIwSThQR2drUGRGZ2xzbHp2Yno3czhyalJRcmpQ?=
 =?utf-8?B?cHVtZkRTWUFtS1M4aXUrV0N4U1lNS2puU3dkNDlhVmNFN3gxSVBraTA0TEZR?=
 =?utf-8?B?SWNpb2k1Z1ZhOTlyU2IyNnRZZ2p3a1JzQ2UrZ3dtMkJVYi9ZWE9LVUpnb2VO?=
 =?utf-8?B?eVZUa1V4bVdIU2Z1M2JwaFJLd0trSkhmKzQ3QkFwQVJ4NWRud0dMNlhwZDJK?=
 =?utf-8?B?bWRSc0c5U1hpbEJQTzk1Q1N5YVNyVVRXQ01IVk9QWGlrM0ljWGNBZVpUQ1RT?=
 =?utf-8?B?WlVzMkIzQmJ4R0N2VTAwQXN0NFdjVkRTa2lZYVB3cXkyeisxK2w4Q3FVTDAr?=
 =?utf-8?B?SHJzK2ZINWVHZklmSFRtc1lENlN2Zm9BNGNwM2R2cmY5cGdoMHlIdFFjT1Rj?=
 =?utf-8?B?NjZHMVZYYjBQNmtqL1cyOGhuZzVGSkJwdW0vSXJYekgyYXJCd0dwUWNETTJB?=
 =?utf-8?B?TTYxTGxJb29Zd2lEWWcxK3k0WDgrZFMydHlRaDIrVXl3c1BGazlOUWRZZ053?=
 =?utf-8?B?TVNQOWFjKy9BY0UwN3N3VWpVaURLT09OMVl0ekQ5a2VaKzlIY1Q0dXlXWWhw?=
 =?utf-8?B?R3ZPT1JsazF3RVFnRmJzYnU2T1hjSVV4bGEvZ3QxT3BtUm5ITDBzcnZ3dWo5?=
 =?utf-8?Q?EVsRN1tTjW+aj+ZooChKPrE=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?eVFxZFh2YUQyOGZaWE1xMnpzVjEyK3NTb3VXR2lxMnJnaVhvLy9UaVpha3ow?=
 =?utf-8?B?SWcycU9sYSs5L3pJYTMvcXNPWllTMnlIcXd5NzR5MHY5bmpJZSswb3hyNVBG?=
 =?utf-8?B?Q0RIdWR0Uk8vbFhCNFNkMFZSUURnOE9UdzV6MWE3L0VsNFA2dmpZUnJXT250?=
 =?utf-8?B?T0luT1pUQmRYS0hoTnAyV0Q2b2lTZUxBT2htWWNoMjVTQjZEcFNlcEFMdmhs?=
 =?utf-8?B?RHM4S2tad0p1MUhCYVVNQngzK1ZocmhaTUxyc0FIa3JpaVk2V0tpZllvejc0?=
 =?utf-8?B?TUNsOWwvZnRCK1lrdXFvdnlkMkl2L2pNTDZRWHVCaDN3VTZaS1dVc2QwVWkr?=
 =?utf-8?B?aStuUnNYNXE1clVwUFhxMjBWeWlSZitBcjhFYm5BSGlFZGRNWjIyY2tqMGZB?=
 =?utf-8?B?dWdHblNkVGlLbUwyamVxUll6cW9HTm9FVUhVeWVOWGhzb0J5ZjNpSEJDS1la?=
 =?utf-8?B?QzJ5WHZCT1JjTFZEK05OYW9hNmt2VmJRSXRSUUVGTzgrR1BRNE5oNDRlZFZo?=
 =?utf-8?B?UWtlemlnMmE0ZE1kRGtXS0Fla0crdTJCNHpqaVdmb20yUWtDVVk0ZWFBZmVl?=
 =?utf-8?B?Mi85V3d1YzhoUCtDR0ppYkhVNWtOaFB6V0JzcVV2NE5RSzZSbE9PdFlmckhn?=
 =?utf-8?B?L0ZXYnNiMXVROE5VNGVUVnFmTXZwa1ZlY0JJcHJkRXhwa2JmL1NtMThXR2tT?=
 =?utf-8?B?RmxibWlTVlVMVDd3ZS9rNHllRk82c09TOTZwTTNHenQ4V1JIeUIyUmJMY2Fx?=
 =?utf-8?B?eS8rZURDVDRuMlpTNU9uVCt2YTRPRGRGMmdhelhUakRuREJJanN4MElmMWlT?=
 =?utf-8?B?aEJoRUt6M0FDQTRYUHBnaU1kSVBTenh2cTZqM0t6a042ZXlEOW1WeXBXWXor?=
 =?utf-8?B?SjBKVmdER2p5T2lMcW9mMUxNSFBjd1BhWjkyd1dJemM2VXpDMy9NbjBqRDN4?=
 =?utf-8?B?MGxON3hrdU1JREVOL2lXY1RucUhmQ3BFOWtJUW5TTHpwZTh5R3dNTExBbzc4?=
 =?utf-8?B?ZittMVFjSHBnNVZqYVNyOTJjU0dqMHJlLzc5MXh3V2NPTEEzZllrZUM0Zmhr?=
 =?utf-8?B?OTkxSjhrOC8wRmJFL2lpVEJEdEhzdXUrN0hmNXk0RlpNU2lTblR5UjJpbGFH?=
 =?utf-8?B?TG51OVJQRDV2U2tHTWNDWlFjQlFYSE1iSzJXMkNFaG1pNTlGS2Q2RVlBWTB5?=
 =?utf-8?B?dDhNcGd5TjlUV21Kc0pHYnRUV1VqL2tlQURtZVFZMVh5cVFwTmJGZ2lqQlk2?=
 =?utf-8?B?bmNqYkE2UEFseW5sN1VwMDZOcE8vUlVtQU9vUXlJcFlYMDNEd1lESXUvK1VG?=
 =?utf-8?B?VkRjTHNaOERuYVVZZkpVUm8yVkNLS29OWVFKRktpZ2ppa2xOZUZSVERRbEJQ?=
 =?utf-8?B?aExCYzl4SFZpNjJGem43cTJBUENickttTWlQZ09sckJKNWRoKzYyUDg5ZVdX?=
 =?utf-8?B?blpzUWFiRm5oVUFmUngvWXBheFh6SFc5YTNVcXJjdEtGeGdGNkhEZ1Vjc0JT?=
 =?utf-8?B?S2M5Yk16UWNRNEVXUjBiYmtzV2tBd0dHdndjODJzSkNSYXNtMU9zSlcxcG1W?=
 =?utf-8?B?TUZBcDhrMk1Na0ZkeWxjODh0YklrSUVQMVRDSXdPanh1R3FvSElJZGNZQmdU?=
 =?utf-8?B?VXErK1BVVWlkcmlUbmNuc09rbjBDNUoxTWxkZ3pvSS9CT2s3ZmNIRWJwMlRY?=
 =?utf-8?B?N0F4Tkk2cVRaTEdvWUptY1QvdXdQVmM3UVJpMGJFV0c3c3FWaXdpMjRwMTVk?=
 =?utf-8?B?ODVVNUd0ZXZDWW10UkNCVXdSWlZBUit4Mm9kQXBSODBXMmdlQ21UNHFWbjNr?=
 =?utf-8?B?TDl6WnJIc2hrV2JOcEhTdUdUNG5weFBYOHlYcDdsRVFsQTROdVhycW02Vk5h?=
 =?utf-8?B?S2c5RzM5R1Z1TTA0SG93MFdSRjM3RUhmZVdVWFoydjQybDhnWlE3Zm40Y2ZF?=
 =?utf-8?B?QWM5WFhDdDVyS2VOeDNEWE5RbGVkektQbFppMGlGNFczcTZQenF4c01kUWVq?=
 =?utf-8?B?Mm02aFNVUjNhTkRsc0ZpYWQ5TndSd0NFYjVSTHBnZDVuQkpnN3VSTUZjL3NV?=
 =?utf-8?B?cmY1MHpyYkNQVUNydVNzYmhYTkg2K1lKOGpFNEhmWkNqelI1aXphOEpWNldl?=
 =?utf-8?B?RmpzQWpFdkxieVlEa0hoNUFTTTI2MUdnVGNEZEtYSWE4d3l3K2VzaUlCdlcv?=
 =?utf-8?B?K0VXQXdBd0pJeVZQc3djRDZTTUEwQ0FWdUZzSjYxTk5LaGlvcG1BbDJQVjhu?=
 =?utf-8?B?a08rdkFNNFI0anU1bE1ONEorZVlNQWt1R011Y1NsejBMRU5RMm4xNDg1Y2hC?=
 =?utf-8?B?MGprMWpLYnNvWWVlS0VKMVRUN0taQjNzdE8rbk55V2YwT0pKOWdKUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db47ea2e-046c-4413-156e-08de73cf0802
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 18:03:37.0168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z+aE3x/9tJ4upnhLl4EMHGKHbLG+PVTekK7pves7020NWPrsJvQGPis7MT6c++wnEcZ7Gf+fGCpp2hHq8sP8ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12239


On Mon, 19 Jan 2026 19:35:52 +0100, Stefano Radaelli wrote:
> This patch series adds support for the Variscite DART-MX95 system on
> module and the Sonata carrier board.
>
> The series includes:
> - Device tree bindings documentation for both SOM and carrier board
> - SOM device tree with on-module peripherals
> - Sonata carrier board device tree with board-specific features
>
> [...]

Applied, thanks!

[1/3] dt-bindings: arm: fsl: add Variscite DART-MX95 Boards

Best regards,
--
Frank Li <Frank.Li@nxp.com>
