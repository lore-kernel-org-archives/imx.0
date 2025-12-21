Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021074.outbound.protection.outlook.com [40.107.130.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E94529993A
	for <imx@lists.linux.dev>; Sun, 21 Dec 2025 11:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.74
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766316563; cv=fail; b=d9sZPjc4dEP0ueHXoA0xUnzIPz4/Ip1RSSYWn0OSu6Ydik/HGsSMHtxqiBS9N9Lo/TM32eqb/ZPHEFKpl7qbLdyqViJCe/piC5UwNkx6JbRbAIdVFGz6VTBvnyXncrfUQsfy9t1QzY3J9Q2eTbo8b3CW0n4VXU0Yj5Opys57AEE=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766316563; c=relaxed/simple;
	bh=mYgI42/DnAlOoMERNuO+kWMgb9cdHTN5DuUZoZuJiDQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=A5hpDd5olwuj0XkgwWThkaguo5APBJr0rPY8YbrYgu6hjGZA4lF8hkBJ7X3q0yzZEvVrLO2/b1eRrBgqPQZhQPiPZ9aClMKawYoHLPqVEg60haYwu9qKx51ZkWAGBZy9aaNUrqN+fDN8EA4HlmCiDOcWPcYUgbFWVl2dezeXOHI=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=NObQ1SMk; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=NObQ1SMk; arc=fail smtp.client-ip=40.107.130.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="NObQ1SMk";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="NObQ1SMk"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OWLzDFtpDTFT7W4XWY93Sbq5w5YgaoLjgaoxSNuez9GsyYqTW4H5qp2vzoknhnTVkVmkG9EBAbWPk1POQLJTTaKzJbXS/MYIfIWHovTwDCXR+ILsP4vLdvk80b6U7xKaIjc4eAN2v8N4KHYnBhea6rCP7MfrqRzM5L0NHohRz2Ns1vEykKTEpq1oFwvTLPJb7yBL0+hT7Qe8sfZhSWMq/RVzSGdmfBI1wpLx9ZGHNcg30jIjk/cJZbpZ60v2yXg2vI/1o7qys9BP7XsZidYl38GWpOaAgTFxK/eh2PHfThMl80hERGSirgn9fxPD3r/uRWAk659Jx9S+oJ2eo8JCHA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkv/mx3jclnN4mwL/gMxXvSs7+d+beRjqn9SsevuW2A=;
 b=iFDomWRrQb1Ved6QZ6XcjkQDPibvCPVXT1MDLIm37l0NS4FWItM6A3E0J1ss/CuCxAiuCWi4dXMQMebO+J7RCUtTkA65+r3TI2EzM1w37qaPUto5eskdJ6sFKOsdfjrpxNal8UHr9KyepnmpSEE7dqs4H5M1lh4KMi+z99yk4aqSRGP9zNwA8j33MqNSgKx0A3F0UjPL/RNgT7akkYgK10FUGl06peuA9uH28aM1d1794M6Oly7d+aG1X+1e8v1D4TEit1z99ZyxvBHIhthCxwyYpjqUbumMvaTrOHLChdSfGI2IN/Rh/UUGU2DZvaB38n4pPk8adCVf2/JcFfpGWA==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkv/mx3jclnN4mwL/gMxXvSs7+d+beRjqn9SsevuW2A=;
 b=NObQ1SMkLtEkum9LlAe4wChkVEbvgIoVO/rnwz3XtTC3bIg2qu7GYIldsb1aKtu8djENyH9oDrfHuapbaOUYDQ3XO4yRoIo7tCGy+S3DshS9ONJWm1EiwEmSo/e2q29R+gNvqlN4HEf5KnRLpb19/UPwFsVBJDc1tG9G+IUc5Qc=
Received: from AM9P193CA0002.EURP193.PROD.OUTLOOK.COM (2603:10a6:20b:21e::7)
 by OSKPR04MB11365.eurprd04.prod.outlook.com (2603:10a6:e10:95::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Sun, 21 Dec
 2025 11:29:16 +0000
Received: from AM3PEPF00009BA0.eurprd04.prod.outlook.com
 (2603:10a6:20b:21e:cafe::5f) by AM9P193CA0002.outlook.office365.com
 (2603:10a6:20b:21e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.10 via Frontend Transport; Sun,
 21 Dec 2025 11:29:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM3PEPF00009BA0.mail.protection.outlook.com (10.167.16.25) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.9
 via Frontend Transport; Sun, 21 Dec 2025 11:29:16 +0000
Received: from emails-7568379-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-236.eu-west-1.compute.internal [10.20.5.236])
	by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id D538080117;
	Sun, 21 Dec 2025 11:29:15 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1766316555; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=gkv/mx3jclnN4mwL/gMxXvSs7+d+beRjqn9SsevuW2A=;
 b=S1QxNF3a8GMQaS5upSOlyxKdgd5m+5JMCqcKevzWhs+QZXlGFvjEYwqgqMsV+5GGF+fNY
 uXg8uJ0TWWjybnVOwWeF1l/BSe8/1CluSAOEX1UAU7bGb07yz4DM9A3hXmLd9k725XpWLHF
 j4B0jTzF/pX51eA/hN+TVGlZGV/rhFQ=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1766316555;
 b=gmsWHjLy4XEaBYJ3HTRqMqg3Rg/fkH6giZ8SpJVsvznTy/bHppEKvjNJ5SQt8z+I2/k08
 K8JPzUBzPGPhyVUfR/pYPmbaQ+sM8VaIBR4EzKfuBaFDwCzhDq0cb7UJuNyL0dY/aonmaid
 RM0eo+9qJUDPRwkyDtLSi5C3tXylA6c=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yC5jZf6ccJogsWX6MO7BPPdFGQBbuMyuIpc4/tciQdQIsR0GFEoUoTEjuhs/uBhW7Kz1LumIwCawAGYlvWy4teIppzKbPB36rM1TypmIf19xLOb3ioFzpQ/wm9ytPqL7lk6DMelEc8FdAQ0t03iBFfVPkejP89E/XZ+r7xdnqsSv9+VxoSB3o9lpJrFbDUv9o/tJbIdaxbhfO7Sv483W9vMpZ04H5mPinp9BwoTEoGGJTs+Xb18vPrQ0TrzWlB4y5JW0jWffixCHIkcDO2Q2M95ZlSYXPv9x/bh/4UVW9PNo0dWCEEbiBkutldxQ3OE9GBkvzhvakW9SP/Oy7WUqag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gkv/mx3jclnN4mwL/gMxXvSs7+d+beRjqn9SsevuW2A=;
 b=NT96aNf5739/R5OAmznPSrega8bhDno8QP6whGb+L0S1OdUvvAVJ3JL4LhWtBQZTrB+JBP0MBBRhNuBGgJk0LVKTPInpWIu/k5Da1wjf3Hv0K4h94bhQaXQ1eacz6+YznQ8wdXlNBExlREvSbZm973+CgSDDqWYzHSESbSKMhgS76w16d7KYbkyaKhnUXKKpxgMfCmkxgZ8Kjx0pssXMJ0UqEXkK95Hti8FCjqCZSoZmADfapAE5VAsW5reHgbo3sH0nVU3FJzAcRUHFC4w9eacBbUUfz0u2/gdw7TQkqOZD9CJaUi6PHaZ+YUg848TbNLOKwJhjVNc7w/ZNimyfGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gkv/mx3jclnN4mwL/gMxXvSs7+d+beRjqn9SsevuW2A=;
 b=NObQ1SMkLtEkum9LlAe4wChkVEbvgIoVO/rnwz3XtTC3bIg2qu7GYIldsb1aKtu8djENyH9oDrfHuapbaOUYDQ3XO4yRoIo7tCGy+S3DshS9ONJWm1EiwEmSo/e2q29R+gNvqlN4HEf5KnRLpb19/UPwFsVBJDc1tG9G+IUc5Qc=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by GV1PR04MB11037.eurprd04.prod.outlook.com (2603:10a6:150:212::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Sun, 21 Dec
 2025 11:28:59 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9434.009; Sun, 21 Dec 2025
 11:28:59 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 21 Dec 2025 12:28:56 +0100
Subject: [PATCH v5 7/7] arm64: dts: add description for solidrun i.mx8mm
 som and evb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251221-imx8mp-hb-iiot-v5-7-4a4dad916348@solid-run.com>
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
	PAXPR04MB8749:EE_|GV1PR04MB11037:EE_|AM3PEPF00009BA0:EE_|OSKPR04MB11365:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c39ff88-9949-4739-f181-08de40842cb0
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?cER2UW1VYzJ4UlRmOWNXV0F0U0JkeG1yR0tiSXRSMmJHV0sycEV4TUIxbkI4?=
 =?utf-8?B?YnRDNGU5WURuSDcrNGgrUDdlbHJndFZMdXFLMGZrL2lpa2JmVEg0d2ZDVnBz?=
 =?utf-8?B?SVF5UnM3QjBsaHVqOWZWK05GdDJiK09nQ05EQkcyWWJ5MlR1R1VLK01iR0FJ?=
 =?utf-8?B?UVZLYXJTc25QRlBSSWZWRVZabEFNc0JnOVhZMFBTTUtkWFFGWG1Ubi9QTW14?=
 =?utf-8?B?Q1AxcEQxeGtJMVFQcEdteG11N1pKT1J5RjNtRVBBOUw2TmtIcy9CUStuZm5v?=
 =?utf-8?B?UmlyOGFKRjdYenhtbmlhanEvblZsajQ3WVNsV20zRmhBSnNERG1LSWNuK3VX?=
 =?utf-8?B?dTZ4Y3ZiaXluRzdoWS9lN1lueGlVZkhJbTViTWQ2aGw3dXhnYjVJR00xTFV3?=
 =?utf-8?B?ZWNUMks3WTM2RDhOZ2ZvTzdNR0EzWStQN2pEdnRYektMMzRCU05LamVIcU0z?=
 =?utf-8?B?VFY5TlpzZFJxQVd4YUJpSFdDVFpyK3lVaUwzWVRyTzZLcEhka2dvQU5tVWFZ?=
 =?utf-8?B?RFdHRFBIK2ZCZGNrZVo4YkRKRFdTcDE3MnBiTjN1bjJUNWt0ZXlOazFYOHk0?=
 =?utf-8?B?Q3AvSWdSMW9EVlF2TDBRRkJVRy95WTJoV3BEME1WVWFsbkRiQysxajA0b21L?=
 =?utf-8?B?N0E2RVNCZzJOVEcwNnFRK0libTd5MHVJa1dKNm1OQ2hPaEQycUg3NlIwVENP?=
 =?utf-8?B?RnR2T0hMdEM5dlIvSW83c3dGZzJ6Y0hTUmowdFh5SmtadjZiWlFZU2Q0cUpV?=
 =?utf-8?B?S0ZsWHpBdVVjb1VXK2RNV1NJb3UwTjIyaWthTkdyT040bmVzUWg0aUNCOGJn?=
 =?utf-8?B?aEFSWEZaeFhWVzRJQ0UwQ3lNbStaU3ZNMWlncWVUZEgwNGZpcjdGaDVLZDhl?=
 =?utf-8?B?eWFUZTRFbVlKeEk0d3ZFbGFycGF6U2tEaUxkaTlrazFMaTNlUXFWcm5MVHRl?=
 =?utf-8?B?SHp6djNvelJ6MTkzN3BvNGlacFhJejc2SzhIV0sycGVFTlJSakdGS0Z3RzZK?=
 =?utf-8?B?YnRRWjlseEplLyt1a24rZllWTjNnaWJyS2E1RnlkMWVUOExRMGh2OFhSS0d0?=
 =?utf-8?B?aUlQSTc2cCtyWG85WnEwd2ZkdkllZ1k5QWVFVWdwcWNSdnBudmlBRUpZNWlW?=
 =?utf-8?B?bVVON1Jwc3djSENPWmsvQ043YXJvakZ6VytsdHdtRFVqbWtBOVVTQkhwM09n?=
 =?utf-8?B?WldUL0tTR2hYaTNXcGo3RU9sU1hYMXlxdjQrc2ZqaWpiZHdLYXhMY05rbW5S?=
 =?utf-8?B?L0N1WjhDTjd1MkZWYTdlRmRBVjhhc21RZUh6SjhYT2J3aitiejlzQVczMGxa?=
 =?utf-8?B?RlZpVkY5S1Y3TStyMVpaT3Axc2owY0cyVUZjK2hBNVo2Tmt6UmgxcTJndUl3?=
 =?utf-8?B?dWhmRnZzTyt4dGRZNkQyVFJLbG5iSTdVM1BnbGZBNHZMMjBZb0hxekNCc2x3?=
 =?utf-8?B?TzJROExocGVjREtCYlllZXBMcURzaHFkcVV0WFNDQS8reTZWRTVxaWlrVG5O?=
 =?utf-8?B?VVBXQ2tMbFg3RUVTUURQNmZNQmlrdkI3eVpjK2dNUDhYdzROS05nMTBJUXFH?=
 =?utf-8?B?Ym0wbjYzS1FZZ21sai8ydVNidVpnOElwYW9QK1RlQTJhWTYyY3dqc3dzSDJC?=
 =?utf-8?B?bjVHenhkWERpYkFnaitITTdRN3dXRTlQcFZKbkM5UUU5YTFseXRta1g2VEsy?=
 =?utf-8?B?OXh5VDN1ODlWRjRVajBVSGZoc2pXVGNoNU44TFIvMytvMHhDRi92aHpHb1kw?=
 =?utf-8?B?bCtXQnRFcEhlM0N4Wml4Nmw0SkhpMTVKeTlLSTZPaGt2dzhEUGlzQS9HcUZH?=
 =?utf-8?B?eU1uYVoxYXpRdFlPUzdCZ1FPM04wQ1VJS2ZhN0ZjTmVsbFNhbVNFc2p0UTk1?=
 =?utf-8?B?emZ1dXM5YVpvUVdsVXA3YXlhQmo3N2Q4T3JsRWpmS1ZDc21EMFZYSEpuYUR2?=
 =?utf-8?B?ZXdXSlM0Z0VjRkFXaElpN3F0MlhnTnYyeVZlVy92SDBaV1FST0ZGR0JTeUVn?=
 =?utf-8?B?S01FU00xb0Ywa2ZKVWpsRHFCNExnam9DbStaWE44Nlo1Vm9MMDVEZXJaV3Bk?=
 =?utf-8?Q?h9tn77?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11037
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: b68cd8b0243e4eed8662566239320ab8:solidrun,office365_emails,sent,inline:496ecece1675cc50818f13340f6c7d29
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a9a97426-48b9-4c1d-6f0f-08de4084224b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|36860700013|82310400026|1800799024|7416014|376014|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cHlDOFh5QlJwNzFZZm53ZE9oWFpDYmd3NTlpelQ4OXN0aU05TWw0K3R6Ujds?=
 =?utf-8?B?aXFUZnVzOFJRc3YzMmhudzVwcEpUbVplcWR4SkkxVUJmQnF5OHk1VUVHYXJM?=
 =?utf-8?B?aGt4MXd0RmpZZVRUWnF3Y3RiYlR3QTJPUlFoWU9rT1IycU1RQlZqS2pmUStC?=
 =?utf-8?B?aDlGbTU4RjVraU0vZ1FrUG5HUm9ITEZxN1BldmNoQXpYb0hDd1BPQWlITnFl?=
 =?utf-8?B?b3drb1lrOGhnR2tYKzVRaG5rWjhlUjIyalZaZzNSTnIzT2x3WERiSVNqVElB?=
 =?utf-8?B?WjlXZk50bHU0YlRkR0UrbVZtUkJvYkE5SEMwcjFlUWI3cEhqekJpTkdsdmwy?=
 =?utf-8?B?YjkzS3RFTzE0VkQwd0sxeVFaUGNtZllTME9Wd1pORVhpb0UxVWdaamU0V3RK?=
 =?utf-8?B?VDR4Umg1RE5LUjNDQTFscFBZNnRWZ0pBb21rMmRESDNQbm42SkRMOE1Za2da?=
 =?utf-8?B?MlFheDdqc09IRUVyN1I5MURhRWVYaWdoeldXQzRkV1RoTUpaalpkU3dCb1Nj?=
 =?utf-8?B?anBkNmMvSVVlcGZOTjlSWjhuVjc2Z1ZUYkZTSVd2TkdiUk1wcGd5RWVRL1lC?=
 =?utf-8?B?b1RRL3RvbDg4cHdVSncxZi8wQ3ZIV1FPYkNic1k1ZVRhU1ZJKzZLcDRYY3N1?=
 =?utf-8?B?c1VuR0g1dGlpaVV2SlpycEozcklYK1J6WEpLZlk2ZGo5TkFCaTM0REdCd2Q3?=
 =?utf-8?B?ejNPenIzVGFndkVwTjNvNzhZdE5DOENrTVRROTEwa1JlbDUrNi9ydzVoVHJh?=
 =?utf-8?B?THNPYzF5a21jc1R6VGl3NlZmdjM2cllMR2llbE1TRFRwTlBvdEhGaXI0WWJy?=
 =?utf-8?B?ak5QSUlpaG9XMzdqQ3RpZ3dsaERxU0tCVVpUdGRIOEU5SnQrZDAwN0MzNVFr?=
 =?utf-8?B?dFBzYUFJQUVsSktzcTZWaWVjUE9HdWNzQXpzUXZ4OWJKcnhxWkhFWlMrSVdS?=
 =?utf-8?B?Q0l0TjhNekErTDJaTnV3NDZDdnBTbmRqaEZXc0xMYkw3emRmYW9MZWJqVlZy?=
 =?utf-8?B?KzB2enBNelhJcS90YVArUEdWSjZja2R5TFNPaGEybVdPUTloQXdlQlRvcjlk?=
 =?utf-8?B?aTI1d2RFeWwyaXhvWG5IQjRBYjExb0s5cEl4OFJ4RHI3MW1pOGJJMVRMQVFv?=
 =?utf-8?B?eXE2bUo5T2hicEUvRFhRM0dYUjdSa3hZL1czSFJkT1I1NkxsYitlaW1NZ2xW?=
 =?utf-8?B?V1F2M0RUSDVnSXY5MWF4VkhaU1RlbHF4SnZsZU1pT1RXaW1FcWJnNEwyTkps?=
 =?utf-8?B?MVZGQlYzN1Jvek9nb3l1RE9idllQKzVOM3RMOXEwblFDMTBTcjA4VXpiNjhi?=
 =?utf-8?B?aGZsOUNhVWtkNm1FUVB5eEpNMU8wTU1WNWpHdC9uNFVUWkZZaVpqbUJkc0cy?=
 =?utf-8?B?ZzIrd1hJZXlVV3c5ZmdvaEY3eThKdWVpZXlocDNyajAyUzhXTStiRzRCdWpY?=
 =?utf-8?B?aE1tcjFlSlFEUGo2QXhJcjkvdk5iZ1JHekxFejdwVmpEeStDRnpGeTV6TVBY?=
 =?utf-8?B?R0xQUkViWTUvVkNlRU1RcjZnUGFncGpud2prM1JrUDdYUUt6dlVPeWY3OWpq?=
 =?utf-8?B?ZDdpdldjMGpTSitTYXlTa0tMemhTSjhyQ3c5dXBFbGhFV3c5SVFWTW5mOFhN?=
 =?utf-8?B?Q2RuK0l5M3hLelV1RWdLTi9FTnVvNGEzd3MyMm1NdjByRjZIMS9FQmdROUNo?=
 =?utf-8?B?d0tZNkF3dlRDQXMzUzJVWW0zNWV5ZVFrMVhTNzhHdU9JZlJhU3NFQkVJcXAr?=
 =?utf-8?B?dGhhODZpT2NYY1dGazZJQkJoSGgyZXFkMUxpUFcraEE0M0duZmY0K0s4MGF6?=
 =?utf-8?B?OHlvSHVYMWQ3UmhGTnBmay9tZGZzSjdnVzJKcndEYXZoeXhLMmYySjJKTnZL?=
 =?utf-8?B?T1JIZjVqZTZ4ZWQyc25aM1doSEp6Y3Rtci91RUxKVmhESFhWSGYvdFNINk50?=
 =?utf-8?B?cDVKd3NvVlZyejBSNThvMUU0NU5hRmU4TDhuZGNIWXhVK29VekxYaUhCTTg5?=
 =?utf-8?B?VWhDbWRyUEQ0UmVhMGR5SkVLblRLUlBnRGl2WGduMndWMUc3bWNrWDRwR1Z6?=
 =?utf-8?B?U2NxcG1rWVJqeU1nRTZITUFsNDhhM0hsY0E5bVZTNWdrSzFHeTRRdk0rNmZY?=
 =?utf-8?Q?fpGI=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(35042699022)(36860700013)(82310400026)(1800799024)(7416014)(376014)(14060799003);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2025 11:29:16.1774
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c39ff88-9949-4739-f181-08de40842cb0
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM3PEPF00009BA0.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11365

Add description for the SolidRun i.MX8M Mini SoM on HummingBoard Ripple.

The SoM features:
- 1Gbps Ethernet with PHY
- eMMC
- 1/2GB DDR
- NPU (assembly option)
- WiFi + Bluetooth

The HummingBoard Ripple features:
- 2x USB-2.0 Type-A connector
- 1Gbps RJ45 Ethernet with PoE
- microSD connector
- microHDMI connector
- mpcie connector with USB-2.0 interface + SIM card holder
- microUSB connector for console (using fdtdi chip)
- RTC with backup battery

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../dts/freescale/imx8mm-hummingboard-ripple.dts   | 335 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi   | 394 +++++++++++++++++++++
 3 files changed, 731 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 73c3d234149cd..6be7de1f0e1c4 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -124,6 +124,8 @@ imx8mm-evk-pcie-ep-dtbs += imx8mm-evk.dtb imx-pcie0-ep.dtbo
 imx8mm-evkb-pcie-ep-dtbs += imx8mm-evkb.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-evk-pcie-ep.dtb imx8mm-evkb-pcie-ep.dtb
 
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-hummingboard-ripple.dtb
+DTC_FLAGS_imx8mm-hummingboard-ripple += -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-icore-mx8mm-ctouch2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-icore-mx8mm-edimm2.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-iot-gateway.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-hummingboard-ripple.dts b/arch/arm64/boot/dts/freescale/imx8mm-hummingboard-ripple.dts
new file mode 100644
index 0000000000000..110e7ff1ff135
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-hummingboard-ripple.dts
@@ -0,0 +1,335 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+
+#include "imx8mm-sr-som.dtsi"
+
+/ {
+	model = "SolidRun i.MX8MM HummingBoard Ripple";
+	compatible = "solidrun,imx8mm-hummingboard-ripple",
+		     "solidrun,imx8mm-sr-som", "fsl,imx8mm";
+
+	aliases {
+		rtc0 = &carrier_rtc;
+		rtc1 = &snvs_rtc;
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "c";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&adv7535_out>;
+			};
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_pins>;
+
+		led-0 {
+			label = "D30";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio5 29 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		led-1 {
+			label = "D31";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		led-2 {
+			label = "D32";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio5 8 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		led-3 {
+			label = "D33";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio5 7 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		led-4 {
+			label = "D34";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio5 6 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+	};
+
+	rfkill-mpcie-wifi {
+		compatible = "rfkill-gpio";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pcie_rfkill_pins>;
+		label = "mpcie WiFi";
+		radio-type = "wlan";
+		/* rfkill-gpio inverts internally */
+		shutdown-gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>;
+	};
+
+	vmmc: regulator-mmc {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&vmmc_pins>;
+		regulator-name = "vmmc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_LOW>;
+		startup-delay-us = <250>;
+	};
+
+	vbus1: regulator-vbus-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus1";
+		gpio = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vbus1_pins>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	vbus2: regulator-vbus-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus2";
+		gpio = <&gpio4 21 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vbus2_pins>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	v_1_2: regulator-1-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+	};
+};
+
+&i2c3 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pins>;
+	status = "okay";
+
+	carrier_rtc: rtc@69 {
+		compatible = "abracon,ab1805";
+		reg = <0x69>;
+		abracon,tc-diode = "schottky";
+		abracon,tc-resistor = <3>;
+	};
+
+	carrier_eeprom: eeprom@57{
+		compatible = "st,24c02", "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+
+	hdmi@3d {
+		compatible = "adi,adv7535";
+		reg = <0x3d>, <0x3f>, <0x3c>, <0x38>;
+		reg-names = "main", "edid", "cec", "packet";
+		adi,dsi-lanes = <4>;
+		avdd-supply = <&v_1_8>;
+		dvdd-supply = <&v_1_8>;
+		pvdd-supply = <&v_1_8>;
+		a2vdd-supply = <&v_1_8>;
+		v3p3-supply = <&v_3_3>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&hdmi_pins>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <7 IRQ_TYPE_EDGE_FALLING>;
+		pd-gpios = <&gpio3 22 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				adv7535_from_dsim: endpoint {
+					remote-endpoint = <&mipi_dsi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				adv7535_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
+
+&iomuxc {
+	hdmi_pins: pinctrl-hdmi-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO07_GPIO1_IO7	0x0
+			MX8MM_IOMUXC_SAI5_RXD1_GPIO3_IO22	0x0
+		>;
+	};
+
+	i2c3_pins: pinctrl-i2c3-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C3_SCL_I2C3_SCL		0x400001c3
+			MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA		0x400001c3
+		>;
+	};
+
+	led_pins: pinctrl-led-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART4_TXD_GPIO5_IO29	0x0
+			MX8MM_IOMUXC_ECSPI1_SS0_GPIO5_IO9	0x0
+			MX8MM_IOMUXC_ECSPI1_MISO_GPIO5_IO8	0x0
+			MX8MM_IOMUXC_ECSPI1_MOSI_GPIO5_IO7	0x0
+			MX8MM_IOMUXC_ECSPI1_SCLK_GPIO5_IO6	0x0
+		>;
+	};
+
+	pcie_rfkill_pins: pinctrl-pcie-rfkill-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_WP_GPIO2_IO20		0x0
+		>;
+	};
+
+	usb_hub_pins: pinctrl-usb-hub-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI3_RXD_GPIO4_IO30	0x0
+		>;
+	};
+
+	usdhc2_pins: pinctrl-usdhc2-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x190
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d0
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d0
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d0
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d0
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d0
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
+			MX8MM_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
+		>;
+	};
+
+	usdhc2_100mhz_pins: pinctrl-usdhc2-100mhz-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d4
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d4
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d4
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d4
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
+			MX8MM_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
+		>;
+	};
+
+	usdhc2_200mhz_pins: pinctrl-usdhc2-100mhz-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d6
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d6
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d6
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d6
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
+			MX8MM_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
+		>;
+	};
+
+	vbus1_pins: pinctrl-vbus-1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD1_STROBE_GPIO2_IO11	0x20
+		>;
+	};
+
+	vbus2_pins: pinctrl-vbus-2-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI2_RXFS_GPIO4_IO21	0x20
+		>;
+	};
+
+	vmmc_pins: pinctrl-vmmc-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x41
+		>;
+	};
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&mipi_dsi {
+	samsung,esc-clock-frequency = <10000000>;
+	status = "okay";
+};
+
+&mipi_dsi_out {
+	remote-endpoint = <&adv7535_from_dsim>;
+};
+
+&usbotg1 {
+	dr_mode = "host";
+	vbus-supply = <&vbus2>;
+	status = "okay";
+};
+
+&usbotg2 {
+	status = "okay";
+	dr_mode = "host";
+	vbus-supply = <&vbus1>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb_hub_pins>;
+
+	hub_2_0: hub@1 {
+		compatible = "usb4b4,6502", "usb4b4,6506";
+		reg = <1>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&v_1_2>;
+		vdd2-supply = <&v_3_3>;
+	};
+
+	/* this device is not visible because host supports 2.0 only */
+	hub_3_0: hub@2 {
+		compatible = "usb4b4,6500", "usb4b4,6504";
+		reg = <2>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&v_1_2>;
+		vdd2-supply = <&v_3_3>;
+	};
+};
+
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&usdhc2_pins>;
+	pinctrl-1 = <&usdhc2_100mhz_pins>;
+	pinctrl-2 = <&usdhc2_200mhz_pins>;
+	vmmc-supply = <&vmmc>;
+	bus-width = <4>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi
new file mode 100644
index 0000000000000..0bc1b6fa8e994
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi
@@ -0,0 +1,394 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+#include <dt-bindings/phy/phy-imx8-pcie.h>
+
+#include "imx8mm.dtsi"
+
+/ {
+	model = "SolidRun i.MX8MM SoM";
+	compatible = "solidrun,imx8mm-sr-som", "fsl,imx8mm";
+
+	chosen {
+		bootargs = "earlycon=ec_imx6q,0x30890000,115200";
+		stdout-path = &uart2;
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x0 0x40000000 0 0x80000000>;
+	};
+
+	usdhc1_pwrseq: usdhc1-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+	};
+
+	v_1_8: regulator-1-8 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	v_3_3: regulator-3-3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+};
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&fec1_pins>;
+	phy-mode = "rgmii-id";
+	phy = <&phy0>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy0: ethernet-phy@4 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0x4>;
+			reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
+			phy-reset-duration = <10>;
+			qca,smarteee-tw-us-1g = <24>;
+			vddio-supply = <&vddio>;
+
+			vddio: vddio-regulator {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+		};
+	};
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+	status = "okay";
+
+	som_eeprom: eeprom@50{
+		compatible = "st,24c01", "atmel,24c01";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+
+	pmic@4b {
+		compatible = "rohm,bd71847";
+		reg = <0x4b>;
+		pinctrl-0 = <&pmic_pins>;
+		pinctrl-names = "default";
+		interrupt-parent = <&gpio1>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+		rohm,reset-snvs-powered;
+
+		#clock-cells = <0>;
+		clocks = <&osc_32k>;
+		clock-output-names = "clk-32k-out";
+
+		regulators {
+			buck1_reg: BUCK1 {
+				regulator-name = "buck1";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <1250>;
+			};
+
+			buck2_reg: BUCK2 {
+				regulator-name = "buck2";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <1250>;
+				rohm,dvs-run-voltage = <1000000>;
+				rohm,dvs-idle-voltage = <900000>;
+			};
+
+			buck3_reg: BUCK3 {
+				// BUCK5 in datasheet
+				regulator-name = "buck3";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck4_reg: BUCK4 {
+				// BUCK6 in datasheet
+				regulator-name = "buck4";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck5_reg: BUCK5 {
+				// BUCK7 in datasheet
+				regulator-name = "buck5";
+				regulator-min-microvolt = <1605000>;
+				regulator-max-microvolt = <1995000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck6_reg: BUCK6 {
+				// BUCK8 in datasheet
+				regulator-name = "buck6";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo1_reg: LDO1 {
+				regulator-name = "ldo1";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo2_reg: LDO2 {
+				regulator-name = "ldo2";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <900000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo3_reg: LDO3 {
+				regulator-name = "ldo3";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo4_reg: LDO4 {
+				regulator-name = "ldo4";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo6_reg: LDO6 {
+				regulator-name = "ldo6";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&iomuxc {
+	fec1_pins: pinctrl-fec1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_ENET_MDC_ENET1_MDC			0x3
+			MX8MM_IOMUXC_ENET_MDIO_ENET1_MDIO		0x3
+			MX8MM_IOMUXC_ENET_TD3_ENET1_RGMII_TD3		0x1f
+			MX8MM_IOMUXC_ENET_TD2_ENET1_RGMII_TD2		0x1f
+			MX8MM_IOMUXC_ENET_TD1_ENET1_RGMII_TD1		0x1f
+			MX8MM_IOMUXC_ENET_TD0_ENET1_RGMII_TD0		0x1f
+			MX8MM_IOMUXC_ENET_RD3_ENET1_RGMII_RD3		0x91
+			MX8MM_IOMUXC_ENET_RD2_ENET1_RGMII_RD2		0x91
+			MX8MM_IOMUXC_ENET_RD1_ENET1_RGMII_RD1		0x91
+			MX8MM_IOMUXC_ENET_RD0_ENET1_RGMII_RD0		0x91
+			MX8MM_IOMUXC_ENET_TXC_ENET1_RGMII_TXC		0x1f
+			MX8MM_IOMUXC_ENET_RXC_ENET1_RGMII_RXC		0x91
+			MX8MM_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x91
+			MX8MM_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x1f
+			MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22		0x19
+		>;
+	};
+
+	i2c1_pins: pinctrl-i2c1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C1_SCL_I2C1_SCL			0x400001c3
+			MX8MM_IOMUXC_I2C1_SDA_I2C1_SDA			0x400001c3
+		>;
+	};
+
+	pcie_pins: pinctrl-pcie-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO15_GPIO1_IO15		0x0
+		>;
+	};
+
+	pmic_pins: pinctrl-pmic-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x140
+		>;
+	};
+
+	uart1_pins: pinctrl-uart1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART1_RXD_UART1_DCE_RX	0x140
+			MX8MM_IOMUXC_UART1_TXD_UART1_DCE_TX	0x140
+			MX8MM_IOMUXC_UART3_RXD_UART1_DCE_CTS_B	0x140
+			MX8MM_IOMUXC_UART3_TXD_UART1_DCE_RTS_B	0x140
+			/* BT_REG_ON */
+			MX8MM_IOMUXC_SD1_DATA4_GPIO2_IO6	0x0
+			/* BT_WAKE_DEV */
+			MX8MM_IOMUXC_SD1_DATA5_GPIO2_IO7	0x0
+			/* BT_WAKE_HOST */
+			MX8MM_IOMUXC_SD1_DATA6_GPIO2_IO8	0x100
+		>;
+	};
+
+	uart2_pins: pinctrl-uart2-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART2_RXD_UART2_DCE_RX		0x140
+			MX8MM_IOMUXC_UART2_TXD_UART2_DCE_TX		0x140
+		>;
+	};
+
+	usdhc1_pins: pinctrl-usdhc1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK			0x190
+			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD			0x1d0
+			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0		0x1d0
+			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1		0x1d0
+			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2		0x1d0
+			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3		0x1d0
+			/* wifi refclk */
+			MX8MM_IOMUXC_GPIO1_IO00_ANAMIX_REF_CLK_32K	0x0
+			/* WL_REG_ON */
+			MX8MM_IOMUXC_SD1_RESET_B_GPIO2_IO10		0x0
+			/* WL_WAKE_HOST */
+			MX8MM_IOMUXC_SD1_DATA7_GPIO2_IO9		0x100
+		>;
+	};
+
+	usdhc3_pins: pinctrl-usdhc3-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x190
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d0
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d0
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d0
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d0
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d0
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d0
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d0
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d0
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d0
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x190
+		>;
+	};
+
+	usdhc3_100mhz_pins: pinctrl-usdhc3-100mhz-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x194
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d4
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d4
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d4
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d4
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d4
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d4
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d4
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d4
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d4
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x194
+		>;
+	};
+
+	usdhc3_200mhz_pins: pinctrl-usdhc3-200mhz-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x196
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d6
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d6
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d6
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d6
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d6
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d6
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d6
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d6
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d6
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x196
+		>;
+	};
+
+	wdog1_pins: pinctrl-wdog1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B	0x140
+		>;
+	};
+};
+
+&pcie_phy {
+	fsl,clkreq-unsupported;
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_OUTPUT>;
+	status = "okay";
+};
+
+/* assembly-option for AI accelerator on SoM, otherwise routed to carrier */
+&pcie0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie_pins>;
+	reset-gpios = <&gpio1 15 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>;
+	uart-has-rtscts;
+	/* select 80MHz parent clock to support maximum baudrate 4Mbps */
+	assigned-clocks = <&clk IMX8MM_CLK_UART1>;
+	assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_80M>;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm4330-bt";
+		device-wakeup-gpios = <&gpio2 7 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>;
+		max-speed = <3000000>;
+	};
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins>;
+	status = "okay";
+};
+
+&usdhc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usdhc1_pins>;
+	vmmc-supply = <&v_3_3>;
+	vqmmc-supply = <&v_1_8>;
+	bus-width = <4>;
+	mmc-pwrseq = <&usdhc1_pwrseq>;
+	status = "okay";
+};
+
+&usdhc3 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&usdhc3_pins>;
+	pinctrl-1 = <&usdhc3_100mhz_pins>;
+	pinctrl-2 = <&usdhc3_200mhz_pins>;
+	vmmc-supply = <&v_3_3>;
+	vqmmc-supply = <&v_1_8>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
+
+&wdog1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&wdog1_pins>;
+	status = "okay";
+};

-- 
2.51.0


