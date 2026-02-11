Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013016.outbound.protection.outlook.com [52.101.83.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19089357704
	for <imx@lists.linux.dev>; Wed, 11 Feb 2026 23:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770851594; cv=fail; b=K1P4eE7lo4ZHNHVKu3YUgiJLfotxYTVCIRq7ayxK4U2rqxAqx6y0bmGIdPBI97ojD/2IXjrumypAF6XpyxUMa2k4n8qab+fIZ+2xLRtwcxpHNRDgxxBK/fA3vPWYtAYJHrx5fIjJo9nA/+oDm4Ev1tSiQUKpbAbPa6K4QR5jMD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770851594; c=relaxed/simple;
	bh=ZuSNol2SYMNV/0K//bBSfgnu6B8EFaGW9AhbgRwcCeo=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=m5UrmdpVe0W/bbGklKJgKvJMTp/H1GqgKJrnFr7YgsGOAjo/4jf4kx0WzWqEs0huIDZ3+od/zEnMRx1vBtYGlXzlM+VYqsvz5U2ire1Jyt0SxNLn+ckQkT6ogzkSSBT0Dvonrjmpa2q/OqvccEw/bEbG/P2Ah1HR2XLJFALYtXY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=MLFOW+3P; arc=fail smtp.client-ip=52.101.83.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="MLFOW+3P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ua9i9h13bdfFW1TZOMZVKcVdvBWz2QzBDVdomO008OXjWy+FBLVPMadrS1+QKaUQ7YjX0lzMQp9HHV73c8EgFCpLBNrK2Jqudb3EoLxhqibopgv4kkfHeRwMcIZre50cZSSPLMq88pCv2AvcUi//p049OpK/Oczm6O+VxckR4m1vm0AMt7Mi0Q31OxUXDi/758O//fdovky1E1iv4BI833hW5jHJWqdsmU50h+2m4t9w36vPNVItFqEU7tt8cqb4HeE00mQinmJCYE6x7tmMaTd8V6yqw9TD8v1mGqFx43G5a5LMC/iT29WWoRrCB4cnFA5rfciGm1XluZ8Ljg0vgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ga9Ini35q/LTz0dh2h1ttPBtPnBpOxq2SjGUO8d6ihI=;
 b=Z/o92XrsbtdVUPo/ndPdEK5KR1v89gN+5JRbocFFoi8m48qGl9BpuJc2bIGB77Ax+yN2rJ09Pq/Xxdgx5eBbVjxPH1ZOS62Z7nLEt6TcPvYwIqfYZSypwGIjd0XxM9bOX2MdA9A6dY94RlSN9io0g3yfNB1/tcW7ajwdT5aT2Y5zgTjH4aX8oTLaPsmscCCngxkfxUXYWqm+UMwd7CryRI7uQNJeMNhEcLLgsXzjJXGJVAWjXK2XZEATWxwzYw3OOBAzrNrqCCvUVWHD+fnJl9GAp+35HSMkFZEVYiYEgtKZH+TqaQLILq8XTxuQa5acwF70TU7bS5tHJtGhVpMsYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ga9Ini35q/LTz0dh2h1ttPBtPnBpOxq2SjGUO8d6ihI=;
 b=MLFOW+3PUOQVpp4kbtlM0RsQGF+d+lnl6xRU2Szx+F4d4AJmpvWINr0m2IL4QtatBRhpiwW4ZFhmGRP7fXwaXrFK/oQ+lzX/jYqAsxdXlGxxV9mj5+KbSO6GzuFoquu1HEoePLmKvCeIPIPuRIrKQrt5xKaQPmpZTmJVFsexMYotuWY5+0/JxGnzvvkopQu1qofOqlWJTG8+FS+hI/qvuLTuR3c+Qn6kHEPcpck0dt3t8KNmqMoRxxWv+7KE7q/aXjbeg7SKSSqEu6CXQ/X6g0vPq/wqOaWO/AHHu2mlXWAfiZtBNXAKF6oSJu6itfE8tKr4AuFgtHDRLUmHArCf0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8558.eurprd04.prod.outlook.com (2603:10a6:102:215::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Wed, 11 Feb
 2026 23:13:10 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 11 Feb 2026
 23:13:09 +0000
From: Frank Li <Frank.Li@nxp.com>
Subject: [PATCH 0/3] ARM: dts: imx: collect some simple fix for imx2*
Date: Wed, 11 Feb 2026 18:12:54 -0500
Message-Id: <20260211-imx25_dts_simple_warning-v1-0-7b40e1acca27@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPYMjWkC/x3M0QpAMBSA4VfRubbaxiSvIq2xg1OMdoSSd7dcf
 hf//wBjJGRosgcinsS0hQSVZzDMLkwoyCeDlrqSWilB662N9QdbpnVf0F4uBgqT8KZHWZjSybq
 ElO8RR7r/ddu97wfzpuWGagAAAA==
X-Change-ID: 20260211-imx25_dts_simple_warning-d5be0354a084
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Alexander Shiyan <shc_work@mail.ru>, 
 Shawn Guo <shawn.guo@freescale.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770851586; l=849;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=ZuSNol2SYMNV/0K//bBSfgnu6B8EFaGW9AhbgRwcCeo=;
 b=zhbsOpi1rWTWOjSeh3aRQJtvCTWGQ2Lgajiogyq3Ln/gfK1XqCVrTgp6lpxwSuoecyvA5SjiL
 mYhvc3/wn8kDW4/GUCexSwjzjXgZ8M3ZaCJI/lIcIZG75jzhc+VIVxB
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8558:EE_
X-MS-Office365-Filtering-Correlation-Id: 92fc7708-dd30-4004-2c1a-08de69c31f34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Ri9NazkvMmQ3R0tUZ1dlQWJod2pock4xR3JsQzJLS2l4a0RQaENMQlRQNEww?=
 =?utf-8?B?QVdVL1Q1ZkFvYWZzSjJCdUJKQ0RSdWZmOENXMk01NXBuTS9XVmpnOHBxYUJF?=
 =?utf-8?B?QXpkWWlodUdGTzVaWXpnYTNLYUFKaFM4UHdIaDZLL3NWQ0dtNk4yajdVWmJP?=
 =?utf-8?B?QnVjZ3ZQOVQwQldiTVN6ejc1YVBucUtzZGg3UTQ5ZWZTalhVR1Z1OW81UGd1?=
 =?utf-8?B?bTJ5QUhPWTRaYStFZW0ySk1PejMyWlp6a2FsdnIzR0hBRDBxVnIvcjlkQmkv?=
 =?utf-8?B?VFdYK2FjcmJsOWJ4MFpSNy9Td0tvTW1Gbmk0SjhuMVdNMXdpdnU2U2g2UDl0?=
 =?utf-8?B?aWVqblFDaFRCa2RFRG9tbVYyY3paRHZ1L0FGQWEzR1MzSm9kOCtvZW1ZMTlj?=
 =?utf-8?B?aGdsKzdvV1B3bW9LbGFNM3pQbFRPU0ZkZVBGeWV6SFMyckN4QzJIZkcwVVFI?=
 =?utf-8?B?TkV2NUN5S0lnTFJLaWEzNUp2L0VIamtDQ0dOcEt6T3pxWHJOaUJEU2NnQVpC?=
 =?utf-8?B?U1ZQZTlCWm96aUhLZHUxTlBYNjhpbysvVkdpbmJoN2F5cm5ENkYxTmtSeHFJ?=
 =?utf-8?B?Mk1XWHlBMUdmZmUrNlErWUN0SU1YcEZxSFdrbDNObTV5azAvTFpVSDNQb2pI?=
 =?utf-8?B?YVNPUlhoMDJ3TEI2YXNCVTJySXUwb1RQU0s1aEgwcEpZSHJ1WnhwUU1vWU41?=
 =?utf-8?B?RWJJWjhqMmpnbFU0VDVMSVN1MTlxSHRMOEhmNzJmMGFPOEpPdEpQOUY2TDNH?=
 =?utf-8?B?cS9VZWZmY1V3aHcrTFNyUkpvT1R5bG56NW1NS0xhKzh5S1ppM1F3Yk13YU9p?=
 =?utf-8?B?SnBzQUhlVzNVTmpmWUNYSytQQW1nVkJtVWxkZG5oTDU5MWZ4bmtsdysyTEdx?=
 =?utf-8?B?ZmlFRHlMZ1ZwRjZ5ZHpNTWZYa1VVOVBsTFN6MW42UlhIaTlmNk1aRmpVVWZa?=
 =?utf-8?B?ZVZDOWpGcTNpbXhsSjFLa0QwbHhXdFZ4NTNyNElXTk1qcnRnRnIzSndFdFBJ?=
 =?utf-8?B?REVJZi9IUXYzMTZ1dUp3NzNwb3hqZU1hNjA5SGRLcyt0UzBycDRTUGZqVUJB?=
 =?utf-8?B?UWZuOVVnVlc2S0lBNmNzb05vV3pSbUNhUXF4QTdycDZEOUxYL1BWaGZlbmQ5?=
 =?utf-8?B?cys0NU9YNHZjUmpWOTFvTzlGNzU2MnQySXA0bWQ0VTVBVG5RL0hONXVkeEJB?=
 =?utf-8?B?b05Hd1lUdXo3akpxTjFoWTVpNjl5RnlFMmZlc3pqUlV1U2JsMVB2R2VKUW5Z?=
 =?utf-8?B?bmdva0o5c3VNQVNtSkZuTlloT3FSMmdFQmtUeWtvS3NGRGVBSXlldzkxU0tW?=
 =?utf-8?B?MW5LT05udTRJSWlwbVE1emMvYkRhUTUrVCtKeTNpbU1sV0FUbFNJS1VqUy8r?=
 =?utf-8?B?eXV3ZFowQU9KcGxxOHE1cVNOL3VjWkRQSmM4T2ZURENsdUNOV0lqc1hRbFBh?=
 =?utf-8?B?aisyN205QTN5ekczTko1SE5UYnBodWZyMk42UXVpK2h6Uy9GVW1SeUNYaUxt?=
 =?utf-8?B?OWFvT3RFLzdFc1YrdHg1Z01nRFlxSjdJeXBIM2VlSkVZeTB3WHp5ZmUzcndE?=
 =?utf-8?B?RnJaSEYyOVJQOFNuTlJZTVBQSWdUakh2OHhTZjgxd1I4SmwwYXZ6ck5sWmdK?=
 =?utf-8?B?UlZrVnQ5RnlBYXVYcnByMnZoSEp2RHJDSnp1c1NGUkk1Sk9taVhhcDZLRjhh?=
 =?utf-8?B?T3BUOFI3bnNEYS9jL1AvMlAvZDczR1NjM29BaFVJT09nbG5lc2JXSzBVWXg3?=
 =?utf-8?B?VkxZU3FtN1RhY2QwMmY2YzBtbG8ySVhwQ1VTN3dialUrMW1KckZQbGxkSDZQ?=
 =?utf-8?B?L2trd3IzR1YyZStMODhaOC9YaXduRnZrdWFyUDBGSnpUUDI0bDh1cU9MVHFu?=
 =?utf-8?B?dXNYdDBJQ0JKbW9iQVU0dUcyb2ViQjNxMVdicUJ1UG9XclRNNWNPWjg4eGlx?=
 =?utf-8?B?d3MrdGtqSmhNT1ZYZ0lnRXhnZllJY0FFOU45WXg2dHExS2hiU3oveEZnYUlY?=
 =?utf-8?B?eGpianJnWnhtMXhmN09yemUvOWhSNHdQZHVneS9pNXJKbjVrTHB2ZnBDaWlL?=
 =?utf-8?B?ZGV3NXpoTzlRWHd3eHBNeXdxMUZaWTVEeDZxSjBLQ24xTllmUnRWSmI3eGo0?=
 =?utf-8?B?RjVnZk5jVFl2L2FHN0JmV09sZTdpN1YyN3Nid1E4KzhBSEV1Z0wvV3Q0WEhV?=
 =?utf-8?Q?epwE9H3C+ZEe2HJa5lLeo0Y=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QmErZ1V0VDFGaFlSaHhpYTVBaGQyb1UvU0JKblJUTDhpRWk2M0RUVzh6cUY5?=
 =?utf-8?B?SEo2VkpiZ3I3Nzg5a0xpZFlaVFFjMzFhVUtNMDgwajRTd2QrODlBZzd0THda?=
 =?utf-8?B?VURMTXN2elNiazJpQ2pBamtlOCt4UFlmeUxuRUlseFBLN3BVZTZCc2hVeXdD?=
 =?utf-8?B?ckVta1F2c1dRcytoVzZHZVBoaXRvWm1KSHBhWlRYRW9BTFdXbmtNKzZTOGV3?=
 =?utf-8?B?L3Z1bFcva0dDbnoyQzJiMFNlVndLQVNoejR0Snc2dDFaS2M0MGJHTjFyN2JD?=
 =?utf-8?B?d2pJeTE2aWVuZnU4SEs5ajJnRUkzZi9wbWo0cnJwbHRPTUtyclUyNm1QNHcv?=
 =?utf-8?B?SzFoRDN6U3hScFNDb2tya0ZzNDgrYytmd0Z2QzhCZ2FqRmxscmlYeTJsL2tx?=
 =?utf-8?B?b2xTYmx6aTNONEFOUVExZVFkdHhZSWJOa3o1TW5RT1owK3BqeVp1TFg3UkFN?=
 =?utf-8?B?bkVickFoUE96RlMyZVR2OWdWaXhaa3FnWExtK3hucjBjdVFWSmRCRnAvMytx?=
 =?utf-8?B?TXRlWTNNRTFkT0NqMkZSV2hRNUdtSDg1ZmlmVWs2MDZ1SlJTUHhOUEFjcDdr?=
 =?utf-8?B?WmJweUpnOENkT3I2b1Q0aFhXZ0lSTG9iMUxjQXBMNlNBNEN5Tk45dGJMaTZ6?=
 =?utf-8?B?eEZFM2F0Sis2NkdGM3ArYTlxK3daQldNaCtESGpIOHc2SkJ5OXd6d3BndFB5?=
 =?utf-8?B?WUcyOWZwanY5NE83Zm9KOWg4Tzd6c3daWmlLTXpBRWdiZ3krbytpTVhlZlo3?=
 =?utf-8?B?NlcxcHZsR2hrNjZvMk43R29zRGpuMXlpZjlIMHJvVFlWNWtPK2JZRjVjZWFE?=
 =?utf-8?B?WDZ3SGd1b3BZTWN0ZElNbVN1alpwUFY2dm5LRXhoTGYvdFJLNVcybU1NTEM1?=
 =?utf-8?B?d01UU0RaV1h0eERackViSFJaSlFxMVUyZ281VjJ5dmRIcG9PWEFVaUo5SEx1?=
 =?utf-8?B?ZjRkOEdnSFZUei9xRmkreWg3dHpaVUU5RldDNTllYk50RTM5aGNhRGZPOTk2?=
 =?utf-8?B?bitWVTFMKzE3bGxCdUM0cFd1RkdQZlUrbU1RZGJqcWdpVXYyMU1SZDdzZnU1?=
 =?utf-8?B?TC9jTm1ZVVhLUi93bnVGaTdBN3dWWGZTVFdDclV0cmZUdGV3dkFZSWg2bTk4?=
 =?utf-8?B?ZkFnWjNaZFRzSjZzRkVpT2N3UUQ5WFpaRHY1RXNoLzRpbXp1cXNBREZDdU0y?=
 =?utf-8?B?L2ZLalhIU0l5UmRqb3V0M01XN1N6aVBnK1p0OUg4MjVGNUgvSkF5NVZxN3FM?=
 =?utf-8?B?UUlBV2VFeUxTQkd5T3B4T0J1QWMzMXExdkRnSGp0T09ZWUFiQ0ZIRXNRSVNO?=
 =?utf-8?B?UDJmMWdFb0J4TkdzMVdBczhsK1E1Y0dnMkdrVjR0VlJHdDZ2TURObitRRXJI?=
 =?utf-8?B?THk0SGppVnMvTGo2RndFRTVXQk9WaURvYlpQZWJwbkhYM1hTNTVWK0JBYVpE?=
 =?utf-8?B?dHVSTEo0UDQwNUFBWHlNSWJDL1hJaVFJM2NVOUo2NU8vWmwweEwrcGNaMEVM?=
 =?utf-8?B?SDhrQktoRkkwVTZ3KzJ6TVVIUUZsWk1YSWpjbW1IV21hODFWNldTOG01Tlkv?=
 =?utf-8?B?NVo5My9rLzZ0WlZrR2V1SkdlUkNnYmE0Mml0NFRKY0hZR2FGdmMzVW9qbmp5?=
 =?utf-8?B?R09SZTVCUmIwb0cvV3BEb3JmUHh5NWpISTByUmlLWEJJZUFEMWE1YW1UZ1Y0?=
 =?utf-8?B?czUwVURNdkhVUFVxdnQvZGNBUi9vL29hVkRCZ2FVZ01PeDhjMWNIYkdHYXNu?=
 =?utf-8?B?RmF2Um83WXNxamhyV3BhUVpNZkV2MGs0UFROYVNBY3BpNEUvdy9Pbk5DbEh6?=
 =?utf-8?B?eFJ3dURQRG5EejJwNldnTm54cGhqd2dyWXdFa1ZiTXY2YStWdERDM1kyNG9x?=
 =?utf-8?B?bjZBem9Cc3lkQ0VvUFg3SElQaFZGTVVOZXd4SUI3MkJqdFdVMkxQZTlSYkVx?=
 =?utf-8?B?eitDdHpOV1RMTERpaEF2Z0Nqd1Y2bEVBNmkrTzRGc3ZNSTQ4OC9GZDNXYmJa?=
 =?utf-8?B?dmxSR1dYOHpWN3RyeTZVUU5PbFlxcU9Wc2R0UmxNQmRVN1B4elBaSXNvcjFu?=
 =?utf-8?B?Y0J1YlU5U1ZKdXBHRDUrR0s2VzI5SkpvN1pNdHZFMVBiSEVFZ3VwRUFJMVN2?=
 =?utf-8?B?MXkvUHh2QXd4NTVlYld0SXVFM0gvdkhycFQ4MzNLdlV4cE1iME1FZklJdDVL?=
 =?utf-8?B?bGdHMDhDWmdwYVVSdmk3VDh4M0xlN2U5a0RyS3NBQ0Flc1FCa0NXU1drclYw?=
 =?utf-8?B?a2xpNS9ublN3Q0tDM0FhRE9GZG4xUGl4ei9SRmFubGlVbkZaQ2lPaElZTzV3?=
 =?utf-8?Q?1W4NVx+Aw1SedV9S+N?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92fc7708-dd30-4004-2c1a-08de69c31f34
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 23:13:09.7948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7fnlu/ALRSFEhsxstvlBPiYGuuT4xteIYN0wL4Jo6UUTuKMh8WhRH5uT0m6+8W7QjaUGupS/2kMLmZi9VLDyZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8558

fix gpio irq issue. (review code)
fix check_dtbs warnings.

This is last around patch serise to cleanup all warning for imx2* dtb.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Frank Li (3):
      ARM: dts: imx27-eukrea: replace interrupts with interrupts-extended
      ARM: dts: imx27-eukrea-cpuimx27: rename uart8250 to serial
      ARM: dts: imx27: remove fsl,imx-osc26m from fixed-clock node

 arch/arm/boot/dts/nxp/imx/imx27-eukrea-cpuimx27.dtsi     | 16 ++++++++--------
 .../dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts     |  2 +-
 arch/arm/boot/dts/nxp/imx/imx27.dtsi                     |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)
---
base-commit: d4c9a791ea9bca24ec28919e4703e760b24a488a
change-id: 20260211-imx25_dts_simple_warning-d5be0354a084

Best regards,
--
Frank Li <Frank.Li@nxp.com>

