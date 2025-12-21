Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021142.outbound.protection.outlook.com [52.101.70.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23775296BC2
	for <imx@lists.linux.dev>; Sun, 21 Dec 2025 11:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.142
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766316559; cv=fail; b=eVisOQ+4YEm32bS9SrYYEHaJJB4OwVtT1sD0yXzMNnXJ9lQ4u2KWfcVGSXmoPZ5NSsw8jXeMpsAz3bo4Qlj7V/XA5BKDJ9eKm0ZymkihqQVR2gLkTFxP2VnqHtq3Egzo0IeDHDe6rPVlgCtgbXWS0FckV3cwyrBlJx3rq+YgqSY=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766316559; c=relaxed/simple;
	bh=bJv6czjD9oU1spij3uamTG1DONEIfDuHnHxl46Pgnu4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=oxrUfPmV/cGKGZ33J2aNGp5gbD1zjXX1Zp8hyxOzuqIAQhhTHnif17etRJqszGkUXLW08saLgU3xPokKvJ/djJXpXlV5/acUTB8PtBGT7MufjIJdMEtadwMeahg+E23395Y2FP08DZ+n3PxH51NSHnP4RNTR4J7ScsTseA6WGRQ=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=SJkGpSeq; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=SJkGpSeq; arc=fail smtp.client-ip=52.101.70.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="SJkGpSeq";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="SJkGpSeq"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=jbZ4/vV9/udhUp/K6E2u/r4psKlsbvni5ZZXaiHsxdMb2vPV2JQzltb4fAU2kXiJEzILvHOYovHBojQte3rlCArDdsbzIhco7JEyR0KtqU2jIXV3vIsmCjk1uBISki9baPetGVp5qQB2HZP7gw0rTOPwf8HVvKrM+hmyHMcYjG4uFKWKEcnWKfgDYML2uFm2Y8EjSi2M4CNcJh6EtsOjJO9OJHPXpTrB42PXXjHl6mbIJkn07kVFXTg4urUag2PYW3mI0QX556iu53v/3BmgvDfAiQX2RkwjKiGfnNDnVWg0HPvycM7MjNh9+cCueJk2029xXChY5a+/SqAvlrdrRA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIh1nuC5KAQLZQe/bSQW9XebN/sjX1iFRKyUrL81Xxw=;
 b=pXPTICX8FeJvz/ZTuX591ZgXE+qyxwqyEXRcXCAr4rB+1kUTVqMpt+2phMwdig/O6VQO9BrwBL5+g2kLvqSmlLoW7QMHQw46YnU3uK7oNZ4LFhHEq2tIfVV2kJj+htHzGvJ+fiGhkZc66QiUPRTTkALzxVOr/eZ3wkNVzBRBJJemMM5q6CAGBzy7/lKi9TBHFkIKUXNe3og21Jhmw2mGsZw25Uahfq7W8k2OJNnCdZtEyXGr0SWMp/NtqybQP2xib8EcA7kzzWxWNvh+b20kFA/x1XHxPJxBHDOsr9KADICVxNhTfXkS9zpKQm8qVYI8uQ0UPcylEJrZsVxygicFhA==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIh1nuC5KAQLZQe/bSQW9XebN/sjX1iFRKyUrL81Xxw=;
 b=SJkGpSeqjvLcwQ4RtJtmsk5eSH695GdfQrlrgKJBKgbEzD/svoDJ0oxL2lfzQ+XbpQ50aB6cTmF5wSPn1u3t1BF7Fv5ptU3nBKUe6vbb5KD0iGNvhw9KvIXsa9Ngn8rvcmzEABFAcyvg1iGqtspHqUda9YyM6H025tsIYcz3/ao=
Received: from DUZPR01CA0132.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::22) by PA4PR04MB7646.eurprd04.prod.outlook.com
 (2603:10a6:102:f3::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.10; Sun, 21 Dec
 2025 11:29:14 +0000
Received: from DB1PEPF000509FB.eurprd03.prod.outlook.com
 (2603:10a6:10:4bc:cafe::c6) by DUZPR01CA0132.outlook.office365.com
 (2603:10a6:10:4bc::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.11 via Frontend Transport; Sun,
 21 Dec 2025 11:29:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF000509FB.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.9
 via Frontend Transport; Sun, 21 Dec 2025 11:29:13 +0000
Received: from emails-7568379-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-236.eu-west-1.compute.internal [10.20.5.236])
	by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id B363D80118;
	Sun, 21 Dec 2025 11:29:13 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1766316553; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=GIh1nuC5KAQLZQe/bSQW9XebN/sjX1iFRKyUrL81Xxw=;
 b=qgETlGsljUUY/+N317ZAeBKEf4goT9Pev7vGqiJ5aGBy1m+7MvWUHTiYBuQOqfenqaYhA
 oZLP/xX+AWbtk78m10u2dfWKe2qXZGDFFVjmWaM5GXg9tbhKfGU6LvHMk0YvZRoyTZeBp1J
 ldDA7wO21iIxKobYH7HSNdLs5870Q6I=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1766316553;
 b=a3Ku5phK2APRQFIBze0F9zSn4R4jl/BinBuD4a8XgGfqcqpjdDT7TNnLF4PSGpmDfTcNg
 3h6UInYIZ68r2snUm0SpYbyZsOKIm4Y69JkF4UXq2UpTAO+QGTT+W04AT+RkDYAwx6GfAkg
 ASO4bqE3crGwvGu9BUXers3FsPMWoc8=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gjN1KSvwJXtV8dlFBpBPps4w/JlY5JkgyMjrPkYQ7Ln4lLUQ8J1JYMHpzhbWWAxWQnEJkwZ7MghfKaxv3eaSxTfBxFEPkRU3JdzmGkc9NLRK167kdr2tZb8o7mGyF5uFH9ORYT5YdRE3Tf8JUY2x04nIDR7tRK+ibhk7nCab5qZacspAw/DioYlGNRV9Cng2CNUka0jgHr340b6/WlJMTCCkCpDdoZo+7++em9N0h11sY4Mpw3gFP5rSD/11x5KyjQ37C6a+xTa9s0hU5qiBNsoRGkwDIa+m5BXmXPLDG3YgLa1GFILcsoqqqR21MwkVDeygCR7EoeqgnVsJd9rY1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIh1nuC5KAQLZQe/bSQW9XebN/sjX1iFRKyUrL81Xxw=;
 b=GRwsb+/aahfK5iThQDXs+I1/BORpJ03xO+XX5yyY0aQGxgfjFt6XF79A4Bm2xHeOijsOw/TRzGXNt9SkmgwXUdSBfP0ENwXHkiKzGHvgDWfCWdru9Ecy2JWPvfiSP4L2+AREdUga1Ff1q7GzgmZkJeRD6nhi8GbJSJ+YJ9o53KJslkuLQG5kfBPLEngw4YNUuALoeU22ncnYNh003IcoVsd2+9HmGTq0jGNBl6d5YfSPie7zOCarFTa84un13ojN9O9puUF6mwLtQtq6meEqJxeCPhJgToJHv8SoTHK+6Nm2KM21zJ+dhBMCGd0/qaGrM1AzoQ3sxcK1mtyfsdfNCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIh1nuC5KAQLZQe/bSQW9XebN/sjX1iFRKyUrL81Xxw=;
 b=SJkGpSeqjvLcwQ4RtJtmsk5eSH695GdfQrlrgKJBKgbEzD/svoDJ0oxL2lfzQ+XbpQ50aB6cTmF5wSPn1u3t1BF7Fv5ptU3nBKUe6vbb5KD0iGNvhw9KvIXsa9Ngn8rvcmzEABFAcyvg1iGqtspHqUda9YyM6H025tsIYcz3/ao=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by GV1PR04MB11037.eurprd04.prod.outlook.com (2603:10a6:150:212::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Sun, 21 Dec
 2025 11:28:56 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9434.009; Sun, 21 Dec 2025
 11:28:56 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 21 Dec 2025 12:28:51 +0100
Subject: [PATCH v5 2/7] arm64: dts: imx8mp-hummingboard-pulse/cubox-m: fix
 vmmc gpio polarity
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251221-imx8mp-hb-iiot-v5-2-4a4dad916348@solid-run.com>
References: <20251221-imx8mp-hb-iiot-v5-0-4a4dad916348@solid-run.com>
In-Reply-To: <20251221-imx8mp-hb-iiot-v5-0-4a4dad916348@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0433.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::15) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|GV1PR04MB11037:EE_|DB1PEPF000509FB:EE_|PA4PR04MB7646:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ac7ead2-f8a5-4775-ad75-08de40842b3b
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?SGV0VDdyYnBmcTlUOExGRUk2dHc1bzNLRjdyd0FBOXRRL1BkcllkTGUwSFBX?=
 =?utf-8?B?TU9qQlB1V0tFQU9KSmJlUXgrRzkvbUpQSFpkZ2dTY2JQS0ZneDRzYTlocjRv?=
 =?utf-8?B?NEJCeWg5NFh3dUxQRmlQYWs5dE5IREhpaEZjWjV3M1ZjaUMzUkFvMnc1dWxS?=
 =?utf-8?B?SmEyT0xiT2Y2MmhlaDFHenZqSS9VS2pJQzhVWm1GSy9NRjNUQ0RISEY4QlVT?=
 =?utf-8?B?UUdVZmd4SjBPNXZPcGNhSUxRRGRQRU9TOE0xbk9sS1Jsem1GSkpseXVFeXAr?=
 =?utf-8?B?Tm9DRTVmZEpRYTBmbUsrbHlmNlNQZS9HMU9HWUpPeENvUWRFM3YyVjFJNmNE?=
 =?utf-8?B?aExwWmlzMGx5SlV1S01FY0pKNVNaYWRkbEJtTTZ5d25RREpaTnJSZkZUcmQ5?=
 =?utf-8?B?eVlwdEFCbUZFdzBhcUFIM05SQ2lUVjc3alVkTDZHWEE2NmN1SXZ4bGs4aExj?=
 =?utf-8?B?Z3UvVnVwS09WdHpZcnVEek85aE9mVEhDMG5hT0owTWlaV0trdEVrS2lWOXhN?=
 =?utf-8?B?WW9VT091aUEvZEpUa3EvNjcrbGZEOWgyL0Jpd01MYkFkeFUraEErblI0aUh5?=
 =?utf-8?B?dXZqemRKL1lNVSs5R3NBbXdGZ2hvbGhEMjZreFk4SlFIWUdLSGU1U0NmT2tW?=
 =?utf-8?B?eW1rbmM4aDhLd2gxR3pJQWV6eVBBOHFhbFpKMFF0SDdwQmpoVHFMcHNDVFg0?=
 =?utf-8?B?VXNjUGo0Tk9kbko2Tm5sb1JhZFBGMFVuQUc1VG0yMFJpMUMvUWpjSXlNVCsv?=
 =?utf-8?B?MGVDVGpqNDJSNXgwbnZBY0p3NWpTOHFhVC9LV2tmYUJJa3JwU2NJMVZJdk8w?=
 =?utf-8?B?cVFBQ29RVlVuMGtVV3pzUTRwdVRJRW8rZk1wSEhYR1RvRjJiOFE1SThyWFli?=
 =?utf-8?B?b1RNTC9HN0pOM3QvQTFCamgydXFFVnFOVFRXSzltdGZDWWxPZ0hUNXVjTGpn?=
 =?utf-8?B?WTBSMGFGVzFXK3BjK3pxN3dtMGcySmFZeFpnM0NTWG00cnMzM0t2d1BsRkdt?=
 =?utf-8?B?OUlwQTd2T0Q2T2VIbmJ3a3pNK2lCUVo2bUJEU1VqMjVKZitWSVA4NlAwbEpp?=
 =?utf-8?B?TWxhU0lndkZ5SEc1UWR5UndrR0V4LzF1YlFnanpURy9qR1hhc3BoWG14KzJR?=
 =?utf-8?B?d1ZqaG5FZGxSbUNvY2ppNG9ROFkxTWxJWTNWV2owbnIwNFBlM1NWV0ZSU2JY?=
 =?utf-8?B?bGtsMldhTWJxY3Ewcm5GR2hqTnlzYjBXVjlZUGJkQS93dzZxd2JFeGF5MHlw?=
 =?utf-8?B?eFVnblBqTWJPckp3MndNUG9hNWRteEg5Mmo3Ry9YeVNMTkVHMXRvaVFXbHQy?=
 =?utf-8?B?dXFMczVXczgzTzQxcnUvbXlxUENJSEtXTDJsSlJ4YlhzNEVEdklXanpmY0VZ?=
 =?utf-8?B?bllMa0x5R2VyQnlsYVFNSzhkWGN1cjU4cmprUHNUR1dhNDI2VFhkd1pwY1Ft?=
 =?utf-8?B?TlZUN3VzK1FJSktRUytkSUM0ZCtDc1p4dHp5RGJjY1VvTmlOV1l0cDZSRTMv?=
 =?utf-8?B?Q3RPWGVjazExRWQzSkdGZUhmQ1pUSkNhVnM5bWVNM296b3NlUkNZNXhNRHc5?=
 =?utf-8?B?M2ozWGZoT3pyUW5HRUk1NEthbDZjdVkyb0lWbUcxeHNQczBYU1VZMWpkeGRk?=
 =?utf-8?B?QVBUai85RW1GS29Ha2xWM2FxNHRFVENBR0FFbDF0Z091OXlaYlhycktGTnd6?=
 =?utf-8?B?ZGFHSmJkWTJzSXk0WUwvTm1qVllkd1F6a2lDdFVZNVZjZWZNVWJmTzAyNlFD?=
 =?utf-8?B?Z3piNHVGMVdUcTZnTCtxSjFCV05YejRRcHhnYkR3WnFlTmZLM2V2cjIrTGlT?=
 =?utf-8?B?MDhQbU8zczJqRjNxempHb3ZpWjVnbXAyUXhyNHo4S3JtSnk3am9adVJPYlJM?=
 =?utf-8?B?eFMyOWk3a3JpWVh5MUdIUnJxUDR6OSs1MUJmeWJtOWdWNURWNEtnWWFMcitY?=
 =?utf-8?B?RFhYck5iV2NEdzhIaGorc3EwS1k5ZTNNMVNrZWtFSjFkNlI1UkZPZkJFTis0?=
 =?utf-8?B?RXJ3K2NKVkExR0VOK2tJTTlOVEIxOE5Qd0NDQjFsYUFxd0p0KzZWa2Nxc1hS?=
 =?utf-8?Q?Nnr1H7?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11037
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: e0a9a3d8852a4fcf9436a265f2901eb9:solidrun,office365_emails,sent,inline:496ecece1675cc50818f13340f6c7d29
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	accdf492-c32a-4fce-60bb-08de40842064
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700013|376014|7416014|35042699022|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OUN1QVlDKzRjZEY4RWZOWEYyRGxJaHZEUHZBaU5LQ0hqMlNURTRVZ0laTktm?=
 =?utf-8?B?YlNNMTFFOEtFOWl2d0k2ZlNaZ0RQWFl3SUwwYlM4U0JNZDRCZDZXcTB4eUNq?=
 =?utf-8?B?a3JYRWVCSFN0TUZUL2R2Zm1icWl5ZW0rdFA1WDR6ZlI1d3ZnSW4wNzI5WHQx?=
 =?utf-8?B?SXRpbjIreDN2bDlMTFVGRzBKQ3oyL2d1enpMNHZoM0puR2NWbnBnQVJYTnc3?=
 =?utf-8?B?MmxYaUJEUHl5UUZuUjhhVWVKM1RuTzlBcFBVY3VTRUdGaXhGR05TWlVxbE1t?=
 =?utf-8?B?VGpRcHlnaGQreTVqdE5kMGlPUnUrK01yR2VveXJWV0tpU093YnlJUnZxT25M?=
 =?utf-8?B?bCt5U1N3cnJ6cGhuY2hSaGY2ZVRvdkozck1RRm5LWGxka1ZMYzZLdXp5NXh6?=
 =?utf-8?B?WUROUmI0cFk0cmlyM2RRZGd5VHpidGtnU0pxV0ZDOG5GaFZySVZjU3ZucDhF?=
 =?utf-8?B?SnJVT0szSmEwSTJmMm5yMGQ1SEpoM1hJdFRTRjhiMTNmVnZUR2FKWnZ3Vk1Q?=
 =?utf-8?B?aDhqbzdoUW41a3BzTXVpUDEzRG0xckNXYXdGTmdYZVQ1RktnUlBSUUVsWWlo?=
 =?utf-8?B?TGpiWnc0L1NEVExIVGNyMjREay9lcW5qYUE1SkFuc0dTUUI5RkhVN2J4UGk1?=
 =?utf-8?B?V2swWDhDRlZsc01GVmVtWWl0eTlMUlNQQjVQWXd6Njh1NzAzaHl0cmJIbWI3?=
 =?utf-8?B?SVo5TXZTT1pPYU84Y3VpR3JJTEx2Qmt3Mjl5QUkreXA3Z1hrN3dqUFpYWXFH?=
 =?utf-8?B?a0l2UmdjWDhDZjk1M3laeUc4cEVNNHRTYTF6K2ZqOFZGVGh2UFA1MTFtQVZ5?=
 =?utf-8?B?bEJyMWRTYy9CYzU3VXU1SldBai9qR2hSN0IvS3poZ0tFbWt5TnVYT1IxaFZV?=
 =?utf-8?B?TmY4Y3RjMEdNWVY0OXNicU5zQWNIL2o3RENXb0J2em85eHJEa01YT2tuaGpq?=
 =?utf-8?B?M0dqTUM4VXV4VU4xYTZlNWxmY0tMRDUyQmd0bngrVURaeTUwNnFkL2l0Z240?=
 =?utf-8?B?b0ZVbVBNYjA4ejgxMDVmcTkxemhSQmdOZnVYWG5kNmFXWkpsemRuQ0YwSGFG?=
 =?utf-8?B?RmZaZTdwVzlkWkxrSE56REQ1MXpRY3ByZ0cvclkwZjlsYU1ZRzRVc3NlNmk1?=
 =?utf-8?B?M2wySWh0QW4wZXUvMHBxWWlqTlR1VFVrdy9ONlJkb2x6SWdaV01ibERZUkJO?=
 =?utf-8?B?S1lObnQ3MFlxaDd2RlJUc1JGR0N0MDBQYkczb2hBcDFCcVNVZHJ3T09NMTV4?=
 =?utf-8?B?SlMxcVgzKzJET1ZrMDY1NnpOQzhWekpnR1h5MDNLUGVXeW1nQk1YMC9FMWx2?=
 =?utf-8?B?TkxjdlpYdFZyajhoZnp6ZGxPKzhVOUJweCtqWGZMbmsrdFRPMkxMeFNFYnBo?=
 =?utf-8?B?WFRCZlB4TEpIVEQwU0hiQ0RZK3VXbEtXSlovM0xhZkFQRGVWMUpJc1d2K2du?=
 =?utf-8?B?aTZUMkU4NUlhbEJmamdGZWE4eFl5My9McmVwQTYwSHRucEYzQnBGL2ZyNkkw?=
 =?utf-8?B?eVU3TVdwSUJHYzVLUkhLLzRkckpERk0waXhjWmJJbzVrQWwyaFlXMFp0OGJa?=
 =?utf-8?B?WkxVRFhwOTd1S3Mzem5jSU9KMTcwaTgweG90TkhQZDBudTgxbmhmRjJ5ck93?=
 =?utf-8?B?VkttQXM5TVlIY1ZiY3BucllIcm9mM1dqUW1nU0gzUXdvdFFYc3dYNWNMamZv?=
 =?utf-8?B?SzlzcWo5akNVNG8rMzcrSkxNSGZ6RWxKanErYTZ0NkJmVldGaDNobER3emxy?=
 =?utf-8?B?UFpveWlOY2NaUXVjNmpVUW5jY0Q0ck5Dd210a2p3VXFHdnpQTjVCbVhiZ29H?=
 =?utf-8?B?YjN3bDZ3MEM0MjNuY3dVTUJFM2NEQWhRU0IrQVpyVkhEa1RGOXFKOXROdjdB?=
 =?utf-8?B?aSthQk5XQlBReWVidU5LamZkdWFyNDZ3V243bStQTmVObGM5R2I2Mkhjajdn?=
 =?utf-8?B?Slg1TnlSd0R0ZTQ5SUw4b0hUWWo2MnlBY3ZSK0Ixd3BSa2NUeS9FY1dvaVZp?=
 =?utf-8?B?eVdublJCU0U3elozT25OeVJybFNReVNVNGkrbjJxb3Y0UkJBaXkycndjck9S?=
 =?utf-8?B?d2VBR1NZeXYzRGNvTndydDBaV0R0VFVBQWF1RDVpM1RFZTQ4bVFETHZhR0hB?=
 =?utf-8?Q?ObrE=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(36860700013)(376014)(7416014)(35042699022)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2025 11:29:13.7957
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac7ead2-f8a5-4775-ad75-08de40842b3b
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FB.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7646

Fix the polarity in vmmc regulator node for the gpio from active-high to
active-low. This is a cosmetic change as regulator default to active-low
unless property enable-active-high was also specified - ignoring the
flag on gpio handle.

Fixes: a009c0c66ecb ("arm64: dts: add description for solidrun imx8mp som and cubox-m")
Fixes: 2a222aa2bee9 ("arm64: dts: add description for solidrun imx8mp hummingboard variants")
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts                    | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts b/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts
index 8290f187b79fd..7bc213499f094 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts
@@ -68,7 +68,7 @@ vmmc: regulator-mmc {
 		regulator-name = "vmmc";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_LOW>;
 		startup-delay-us = <250>;
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi
index 825ad6a2ba14e..5b8c8489713c4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi
@@ -73,7 +73,7 @@ vmmc: regulator-mmc {
 		regulator-name = "vmmc";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_LOW>;
 		startup-delay-us = <250>;
 	};
 

-- 
2.51.0


