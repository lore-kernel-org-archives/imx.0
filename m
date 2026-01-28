Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023105.outbound.protection.outlook.com [40.107.159.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A2B366824
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 15:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.105
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769613522; cv=fail; b=fDMyXyKMZz+SqjaNiY6jLQX/HgzEY6D5firaWSuCgiqGhjryE06IW4BfVIn8EJzgmM1S52n5FeKFyZtA+3SVB+ztQeCuThglocC9s4vm66zKVl3OKxGIw17IC2VqmDjo416zWYFVKczvonWTTsXlFFMchl6tbhMpSvG1CL0mW8c=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769613522; c=relaxed/simple;
	bh=tXKr+1CAgcBucdQVPDdn7s1Or6aoHIF99XNARZijY10=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Uk+8fnUrcFf5bkeGZ7Ahp0IW7me56tq738kLOgzrqe5fdwb7Fsk72fRzMQ6kRr+syVCkGZzaPgVS7cAMbHBvorO9N+RF8hVS7v/TfYVoAWiN2BeS57H0t7fFt+jdSlM4kDq1E3O7UcJtJh3yeeSJFhQ9R46167ghCoIgaswm1cg=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=nL8ptRHt; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=nL8ptRHt; arc=fail smtp.client-ip=40.107.159.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="nL8ptRHt";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="nL8ptRHt"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=eunH13cxkjfqWhBIGheukPHRffJNKTEeKsMkArjkvFzsXrp/pImFEtynBG2W9bRxnP0xsqHPwlEx5rToGdOAgcO4pbLGtpcubnZtm/WJ9WB+/INndsL+oOWRXOHdlEwdrB5TQ8YcCO06sC6ZyY41e+0PkLOiKkelQIqKfxmXHHpcKkMPlyoKMxyVp5Ujk+EnviHsbdrlCqUMEZL1m7Nps/P9aoxGKQMYO0ljgKtFw80y9Igye4TLq4QoDpcE7/NXT0mbIpNW3AlfijUS8DfsWecs7oGn681ITuocAtmTvctWB4eqjS3k9vQhvLUu7ljGtgHoLmLm4orLuEskNiDCeQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXKr+1CAgcBucdQVPDdn7s1Or6aoHIF99XNARZijY10=;
 b=H+UA9gHQDtMuXaTVg4jSZPFQOwdQT5gHsbHGGUHAq3ptu5U8/v3eebWdesPeb6b3Pb+re5q5fk+e7EXjDCgaFnTkTymKORElpE6jieDpxOtmu3Ez6LFWn2ZYWhRz7S8q72XeU5Y0pqRUgFprPxzPzvjefbgeEt7bV6CMGgR3HwM+TJdGq+83LLiGFSvUTIU3gm66myRHt4xIj9HRUjqMy+hOaBVAFgy3RCK9LsKKguLlI5+LqQPPnIzTUNODQWq1soIimCEuiuI3fwCHsfC30T6LXHVAXa5muqCKLYv5lD62LGc2OcaIj6tik4m/UVFXi08t7qb9jyLYzWU+JMEasQ==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXKr+1CAgcBucdQVPDdn7s1Or6aoHIF99XNARZijY10=;
 b=nL8ptRHtnoZcqZQXsVXzhCTCgt2b7c1jyBUD6enarvdFEcAp9suU8DLY9JEc0uNMeK4f9ZxK9SphWxJnOajouSxVJrJkDFJsWVcEWFUrkaryaXMKMCiqqNfBp/UP1/GZIpQfQLT5lFqyHRv01hoQyXdexq/5k0A0/ArM+wxPRtk=
Received: from AM0PR02CA0178.eurprd02.prod.outlook.com (2603:10a6:20b:28e::15)
 by AM7PR04MB7078.eurprd04.prod.outlook.com (2603:10a6:20b:121::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 15:18:37 +0000
Received: from AMS1EPF0000004D.eurprd04.prod.outlook.com
 (2603:10a6:20b:28e:cafe::71) by AM0PR02CA0178.outlook.office365.com
 (2603:10a6:20b:28e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Wed,
 28 Jan 2026 15:18:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF0000004D.mail.protection.outlook.com (10.167.16.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Wed, 28 Jan 2026 15:18:36 +0000
Received: from emails-3650189-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-51.eu-west-1.compute.internal [10.20.6.51])
	by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 7FE85806C5;
	Wed, 28 Jan 2026 15:18:36 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1769613516; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=tXKr+1CAgcBucdQVPDdn7s1Or6aoHIF99XNARZijY10=;
 b=qqaDwRESP5tM6JGsST5U2kGgN0PC3izVS75/JbGNVF2n+ymyzYmXqab7yxHPV9UcU6u3l
 9MOuNXruoWxyIjlj/IMlADVFP2v65vuHWZqWDdfnoy6L17SYb5+aB3NG6CXCgYKJw51ZlfP
 ni7vJLGGwTDEfvvnSFb/9S9DySijR0A=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1769613516;
 b=hR31buoXrcGIUNotzzL1+hvKYcz7q3e3+0Xd9AM65o3hxeZDUZTT6MQwSVHqQsL91FSY4
 x0FEkcSxexrxz7zAt0tWcB6Yuh2fwM8zn9mTI0a7CxBRBWdTzrIZBAED+d/y0PRG7xZQJTH
 UQG+IJUoj/Rc3jc+EddZeqK8rQTOLGU=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=br9bpJcRFTf/C6s6UrUe8ivbpDUenTxbvnX+KGtVoB/Ien/NyYbM45ypJEwZO5k2/VIxfxTTAX7ncWxj1KGFmFbFusiiLzpQmGdBhrQjnrXqpmwQMDW/sKScJZ8RUU4fkXbiu4RBZT5HBX1nbKWZk0fLxwJUAOC7OfQpJXTnEUgG7rwEI6+DOaLHMrs9mpAnFgBu75MkHq43xmhAb/LKiPb3mqjlL38CumqkncyUS+gqJWasv6uSX6aoCsxNs58+Byv8d0tvu+zJki+hGO21ZuHgVyi/PidZ8ky1szDF19JYzdZUU18wk1Yb5cjVGUlFCl+UMr/AnDHCYbZLJr1n9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXKr+1CAgcBucdQVPDdn7s1Or6aoHIF99XNARZijY10=;
 b=n3bO3OBhzH/E/FJayWHY2ZvVj/ymYVFA3QeTo8NTZh1eD1AsvtDtJ2w2slHNfSJ/Uuqp3x79e5TYu2O5PBTNa3JNW2v2kjrXCCL2+uGGZv0jY22d1Rg4oWdx+FRk8idaDI9GzMuBTpy4sEYGLvpVd1h+MMF/+5ZK7wqSB921dW6ANAQr1WduOIrgDCtDmuVQvG6LvGGbMF+4cOtsfCVzM8duL1c+ioq0W+zT6jjWQmhFKEBiX9hLvGNbZGx5jfWLK1Et6aXlCsS30LfnHpwwn6RYvjogO3ZE7udpsH7SGbf9FIx0AQ5IrlOScAoU5frV7jm1U+TY/3AbZDRg4TXMHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXKr+1CAgcBucdQVPDdn7s1Or6aoHIF99XNARZijY10=;
 b=nL8ptRHtnoZcqZQXsVXzhCTCgt2b7c1jyBUD6enarvdFEcAp9suU8DLY9JEc0uNMeK4f9ZxK9SphWxJnOajouSxVJrJkDFJsWVcEWFUrkaryaXMKMCiqqNfBp/UP1/GZIpQfQLT5lFqyHRv01hoQyXdexq/5k0A0/ArM+wxPRtk=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by VI0PR04MB10639.eurprd04.prod.outlook.com (2603:10a6:800:261::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 15:18:25 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9564.007; Wed, 28 Jan 2026
 15:18:24 +0000
From: Josua Mayer <josua@solid-run.com>
To: Frank Li <Frank.li@nxp.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Mikhail Anikin
	<mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v7 5/8] arm64: dts: add description for solidrun imx8mp
 hummingboard-iiot
Thread-Topic: [PATCH v7 5/8] arm64: dts: add description for solidrun imx8mp
 hummingboard-iiot
Thread-Index: AQHciHk1hSw/ui62QUSrTcaeEdIZN7VdGzgAgAqmhQA=
Date: Wed, 28 Jan 2026 15:18:24 +0000
Message-ID: <b6c10b70-1b5a-4f3c-b59f-c03ef8e93fe8@solid-run.com>
References: <20260118-imx8mp-hb-iiot-v7-0-ef1176119a8e@solid-run.com>
 <20260118-imx8mp-hb-iiot-v7-5-ef1176119a8e@solid-run.com>
 <aXE5lImvUBOb8hqS@lizhi-Precision-Tower-5810>
In-Reply-To: <aXE5lImvUBOb8hqS@lizhi-Precision-Tower-5810>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic:
	PAXPR04MB8749:EE_|VI0PR04MB10639:EE_|AMS1EPF0000004D:EE_|AM7PR04MB7078:EE_
X-MS-Office365-Filtering-Correlation-Id: 7495042e-b1da-4869-45dc-08de5e80825f
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?Z2hPQVJnRWJqOVBxSUQzdDhBYWJST1gxVDN2U09xU0gybzFtbUdyWWJuV25l?=
 =?utf-8?B?WkFYdExCVUU5SkZrYkxLY0pRcmhKV1I3cisyQ2JMSndVVG1helNiVUhDb0li?=
 =?utf-8?B?WDNMRTltTkVwd2RzY0dWeE5UenYzWWJ5VXBmWEhwdks0WjdXSXpIYm11NUkv?=
 =?utf-8?B?Wit4YXhrS1BRa29BNVBQTFhpNGlyZlhiM1VwN3NNT0tIRGt1QlNZcDhiZ0xX?=
 =?utf-8?B?Yi9jeGoxTVkrdlJUaE9XQi8vajFlVmlHd3RhTlBwWnNXczl6TnpTVFI0Tm12?=
 =?utf-8?B?ak9iay9LSFprNDlDVEhVZWpLN042THRpbEVnN0J5bTZ5TVREMXNWUFRxTmx4?=
 =?utf-8?B?NU5FQThvbTE5MHlXOGtnMG5DeVFDekJuNnc5aXpoN3ZDKy9uSEZkTjFISDFY?=
 =?utf-8?B?MVdYajJtWkVrQVl6NkdsZm9iTEdsV3VKV1hDeUowNTZ5cnBXbEswQmh5akhN?=
 =?utf-8?B?dHpQUzFlUEU3SGE3bnplN09RcWRQRWMySW5CcXp0M0VtalJuUEY0RVp0MHZ5?=
 =?utf-8?B?RzBJUG4xdk1IZHJEU09tSzJLczhldHArMi8wNVg2eHhObDhRTUs0Vk1ISE1N?=
 =?utf-8?B?NHUwYTBRVW05eEF1OGFTMExUMzVzTmFXZ3puSTRuejlFaDAzZTluVlEyOVZH?=
 =?utf-8?B?aUJCakNTUW1KaUxRV0VoWDhwbDcxMllRM0paTklKVzhuUHNVRXZST2FhMmNm?=
 =?utf-8?B?cG5lOEtZUVduMHhIMzlzVGM4cUExcVZ4RjZXUW5oVTdRakV6dnNUS1c0RXho?=
 =?utf-8?B?bDJNMWtjVm1uR281dlNGNDQ2TmVieXVGTXNqc25JRjhJbW9NUmpSam04RGhs?=
 =?utf-8?B?S3RkekRFNi9EQ3dCR21oYTJYYUgxVVdjdUZhRFh1OTJMMXoxUmVzUG82eGhM?=
 =?utf-8?B?MjRIMVVGVGw3TFZaYVQ5ckpJTHNRMERRalZrV2Foc1V3bW9IbmlFNGtHL2ds?=
 =?utf-8?B?b0NMWWxHdmlvSjlHT0pCK2RnamFUT1hkWUNrZEx1Z0lrSSs3OWwwWUVqblND?=
 =?utf-8?B?QkduVXlCVUJuMXNESzVGTzFDaFh1VW9BRkpMY0VkMjJMWStZZ1I2SGtTK3l5?=
 =?utf-8?B?SUFxRlFSajZaR1g4QmFwSVlDdy9hN2RKUmhmdS9YVEJRNjVMaTh6bkxQc2cx?=
 =?utf-8?B?NHJtRjgveU5pQWV0OFJlZTFpdHdWakVtS3dBb1RXWnNEc0xZZFFSdEpMRFFz?=
 =?utf-8?B?Z3l1UzVGZi93TGhOQ1NzSnFieTk2WURxa3RRRUpya05uam1iT0lZS0tsN29i?=
 =?utf-8?B?cjFiQUdPMXhHRThKOHVFa0NYK2gyOVZaeEczS3J2M2pGSXZWQTZEVWhaTlZq?=
 =?utf-8?B?MlJlVWEzZVJONURaZHUrTnBRREdrbUVYV0VlQWdmQmxjQXNYVncrejFFRXE2?=
 =?utf-8?B?Ukx1ZlIram1nYUEzQXB0R2NRZllZR21xWlJjS1NiSFZrYTN0RUozRnh5QlU1?=
 =?utf-8?B?blJVUk5YcEFhN3dzdlhoeTBKU05meDJKZGVxZkN5aHFEODNrb0x5aVRUN3dq?=
 =?utf-8?B?U1VvN1k0cmZQM0RJWHMwYzFNNXpjcFZ4Qm5HQTZKT3RZL3o4SCtvcEdvcEtX?=
 =?utf-8?B?Vk45UFhFK2RtRm4reWV4YTdQSTljQ0hWZ3B5RitNNUd0UzIvaC92TjZDaGJo?=
 =?utf-8?B?OGNqbC9NRS9ncnJZYVdEQXVncUtEKytXUGVXOGJNbWo1a3JzQVdPbUhZbEFt?=
 =?utf-8?B?SVA0dEN2MEl5eTBhRUVNcEgyc0xNSDRiRlBlenR1cit5d0NkditYdTR4eS9J?=
 =?utf-8?B?bXY5Y1Npb0lyQ2NnaXNJb0FaMzJsclhyM2Z1STV2R3RYZXVNdSt2S3NKRnJR?=
 =?utf-8?B?WnlXSEliTE5na2d6Q3lJM0hLNVZUYzZKbUNkTzBDOE0vUkdGZVQxdjJ3Qm5T?=
 =?utf-8?B?cCtRU1hmZG1IY1lwNDcvOXVqaUJQMnd0Tkd6OWRHcTBxcERJMlVTNXRvN3N3?=
 =?utf-8?B?ZlRBNnJVVWprUmxWK3RDMjFOckNMQXJSOVFBL1pLbTdobWdwZWZjV0xkaUhT?=
 =?utf-8?B?TVl0M2N1alVCYzJsYTg3RXowZHFXNWxLQ1B5dHJ4RjhQVFc5NUwzMGZnME5D?=
 =?utf-8?B?eExlYzlnK3N0NGoxU2gyQ0JsTCtxeVFKa2tGQ1VWVWppVXMwVC8veklYYXBu?=
 =?utf-8?B?cSt0S0txdnYrRWdzMG5UajlHVzFHcTUrWlIzazZTZEwzaElpSmxCUTZjMlFv?=
 =?utf-8?Q?fzv3XbYlMiNr72xhgK5B4fk=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700021);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <BB8CB9372878B1408B082301BC09950B@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10639
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: c2cad54b59b64d8795b45f44495d7584:solidrun,office365_emails,sent,inline:542bd80e4450dd43529c7d8f437737e6
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7ce66902-7532-4a07-648c-08de5e807b28
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|14060799003|35042699022|82310400026|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VXJmT0xhQ3ZjdVZpMDRBWnoxNXlDQTQwdStYN1pMMXJuNUFlaVZBQzNNU0FI?=
 =?utf-8?B?ZDZKOGsveHRXQTlOV0l1MnRQODFVUEpISFk5dWY3VzFSdzRueTVoM0ptSksx?=
 =?utf-8?B?MU5SZFFxTzVRRTdmcjZDYnJZYVd4NENjS3Q0MlA4SzVxMjFxak1qekFZOXBX?=
 =?utf-8?B?WkdaWE9SeG16R244cHpDMHBHMkpDd01lQU1mRytNVStPRVZsYUo5a2kwNVRu?=
 =?utf-8?B?R3JLcXdpMCtBbFhjUnZkWDhDMnUwY2JJS3hTNU5jQzN0cEdEdDJLQVFaejhh?=
 =?utf-8?B?akVnakNpRGdVYkVQdUVvblJ5M3BYOTBLaGwxYnZYV0RJUnNnYk5PaHpkVG5j?=
 =?utf-8?B?bmF2QjBDbXJ0QWwzeW16Y3ZpbnJLZGtDNFVqRDlGKzhxd0VxTWZaVEcvUEJs?=
 =?utf-8?B?dll6SXRxQzdhVS9sbTE3MHR2QkNJRVdZa0hnQlpFM2VyTmlvcm1aRVRDSDlu?=
 =?utf-8?B?WmlRc3dYV0NLcXlLOFNSVUVydVN0cHhsR2ZvNURiTkFJZVJxRG5welZIa0dH?=
 =?utf-8?B?dDVja0Q5YXkwcGZOd1dJenBuUmorRGk0c3pvZ1luMzBpQ3ZETWVuNG03VVRu?=
 =?utf-8?B?UVpYZEszanR5eU1lNlBTRmwrM3lsRzRHTUtPNmVjUmVKM1lkRXVNSmVmWVBR?=
 =?utf-8?B?ajEreTQzMVRvVWRWelVKVSsvTk04Vng4ZkYwV2ZOMlVTN1V5YnhPUWVnZEZ2?=
 =?utf-8?B?V2ljMWd4Y3dkM1Bzb1NETDJQOHBCT09CZXhma3VDS2pJRU5iTTVvSDB3VWZr?=
 =?utf-8?B?Mnl6bzJJYmhWM1AxNXpCdjJ6bHMxU2NGcE14RjYrUTRWRC9lRzAwUC9OdVQ5?=
 =?utf-8?B?SmRJd3VJckFtQjNaZnlobjJKUXRNYWM0d1NaTWphcGlHVzdQMndUdWlvN1J3?=
 =?utf-8?B?WGtxY1hiS1NSU28vcnFzUEtHa2J6MTVsNDM3bHZ4RVY3RmxacDF5MXJ3NEJJ?=
 =?utf-8?B?V0xERUdSdVVxQWU0ejFhdTF5VnRNOW1rVmRCa3I1TDZ2NzZxQzRGTWVxN0k2?=
 =?utf-8?B?bG9pNW1mbFE1VG0rUmtsWWhwQVAvWXhkdlNZL2s5OXRBVnQvMnFkZUxlS1lN?=
 =?utf-8?B?Q2xrcGpRSjlrdzlRZktYQXhtbWMwVThHbjdjVExXL01ZT0VqMVpvS280UDUw?=
 =?utf-8?B?b2FROU1PaEt0WC9NcTYvMHIvdzZGUGxOWDlmeUVvK29KYVErUG5HM2cwcnVv?=
 =?utf-8?B?eVZkcGdNay9DU3RqVmt4U3pWeTdjbkJKZjc2Ty9YU1VPS0RyK1M0TmV3OHk0?=
 =?utf-8?B?U0lXSUxWV29zcUQxRmJKKzZ6K1hwcGlyTDBoU2JMSlpCTkRib2hqbWp1QUF5?=
 =?utf-8?B?Q2pFSFFuaTZZb3N5ZTAyQ3g2U2N2QW1xZ3RicjB0cGM2b0JXZGlLTUt0L093?=
 =?utf-8?B?VjBwY242blVsa1pMVUtEeUpqL0xrT0EreHhidmRISmFRWW5ucmQ4Zm1NZGl0?=
 =?utf-8?B?cDlGMHBGdXA0SjhmdWRzL05YeCtrc2lSTTY1Q2N4RUhvZnpTY3FNYURxMjFC?=
 =?utf-8?B?NDZWa3FBc3dyUVUvMHk5UFZ0NkkwR0lLeUZ6ZEdKVFpzdDZudGszWEMvSjdM?=
 =?utf-8?B?aFJ6NHh2ZUJ0azFnbUZpb0hqSGRVNFB2QVE0K1pWTGhRTS9udk1teFhzdlBR?=
 =?utf-8?B?U1hFc0g4cjUzbTNhV0tDekFoSnBxdWhnMzFpZk1laDNYdG1ZRnMrbDI3VHZM?=
 =?utf-8?B?TVl6em50QVdEYWo0dVFKak1YMGRCd09Hd3V0MzdoVGRkQkpwOTFINHVxWDIr?=
 =?utf-8?B?M01FL01iS2hhMzZaTTlndG9VQk51THJsRDdoS0NKc1RyQWd0NDlmcjNmbExI?=
 =?utf-8?B?VzlyQmNreXNIdStOUnNGNkFoWG1IWWVLUTYyTnZtRkl4YmcyNFlvRUdTYXFD?=
 =?utf-8?B?bjVsNUJEbDUvYXVoUUlVQ3JJWmp5VHhNdDh0TWVtVzJJY3VqamNQT3ExTjhU?=
 =?utf-8?B?RisxTVk4cWVCSTBLSXV2S29aM3BERk5ycXRqSG5iU0dWdlpqYkZzaWZwOEpa?=
 =?utf-8?B?QVJTNHBFS2FRUXJTVUtIUk85NnI0SytlK0w1dXNReVVFZSs3em4vdGlnVmpS?=
 =?utf-8?B?amZEM2kvVjlUWFhBU0Z4ZGNhSE1CVDloWmp1bVpzM3RPcEpTdmQrcWY3WTZs?=
 =?utf-8?B?Z1BkOHR1ek84NjNmUFZscG5PeHhvZ0FIdUJKV0UyNGxTS0ozSDhHQmxWUFZB?=
 =?utf-8?B?ZTdic0VFL29EYmloSFFXc0pLVUp0T2VBUTN3QTZxS0FyaEhadEk1OG4zZUk0?=
 =?utf-8?B?STcyNkE0U2NNb2dsUjZFRzBSdk13PT0=?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(14060799003)(35042699022)(82310400026)(36860700013)(376014)(7416014);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 15:18:36.8297
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7495042e-b1da-4869-45dc-08de5e80825f
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF0000004D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7078

T24gMjEvMDEvMjAyNiAyMjozOSwgRnJhbmsgTGkgd3JvdGU6DQo+IE9uIFN1biwgSmFuIDE4LCAy
MDI2IGF0IDAyOjUxOjQyUE0gKzAyMDAsIEpvc3VhIE1heWVyIHdyb3RlOg0KPj4gQWRkIGRlc2Ny
aXB0aW9uIGZvciB0aGUgU29saWRSdW4gaS5NWDhNUCBIdW1taW5nQm9hcmQgSUlvVC4NCj4+IFRo
ZSBib2FyZCBpcyBhIG5ldyBkZXNpZ24gYXJvdW5kIHRoZSBpLk1YOE1QIFN5c3RlbSBvbiBNb2R1
bGUsIG5vdA0KPj4gc2hhcmluZyBtdWNoIHdpdGggcHJldmlvdXMgSHVtbWluZ0JvYXJkcy4NCj4g
c3VnZ2VzdGVkIGNvbW1pdCBtZXNzYWdlDQo+DQo+IGFkZCBzdXBwb3J0IGZvciBTb2xpZFJ1biBp
Lk1YOE1QIEh1bW1pbmdCb2FyZCBJSW9UDQo+DQo+IEludHJvZHVjZSBzdXBwb3J0IGZvciB0aGUg
U29saWRSdW4gaS5NWDhNUCBIdW1taW5nQm9hcmQgSUlvVCBwbGF0Zm9ybS4NCj4gVGhpcyBib2Fy
ZCBpcyBhIG5ldyBkZXNpZ24gYmFzZWQgb24gdGhlIGkuTVg4TVAgU3lzdGVtIG9uIE1vZHVsZSBh
bmQNCj4gZG9lcyBub3Qgc2hhcmUgbXVjaCBoYXJkd2FyZSB3aXRoIHByZXZpb3VzIEh1bW1pbmdC
b2FyZCB2YXJpYW50cy4NCj4NCj4+IEl0IGNvbWVzIHdpdGggc29tZSBjb21tb24gZmVhdHVyZXM6
DQo+PiAtIDN4IFVTQi0zLjAgVHlwZSBBIGNvbm5lY3Rvcg0KPj4gLSAyeCAxR2JwcyBSSjQ1IEV0
aGVybmV0DQo+PiAtIFVTQiBUeXBlLUMgQ29uc29sZSBQb3J0DQo+PiAtIG1pY3JvU0QgY29ubmVj
dG9yDQo+PiAtIFJUQyB3aXRoIGJhY2t1cCBiYXR0ZXJ5DQo+PiAtIFJHQiBTdGF0dXMgTEVEDQo+
PiAtIDF4IE0uMiBNLUtleSBjb25uZWN0b3Igd2l0aCBQQ0ktRSBHZW4uIDMgeDENCj4+IC0gMXgg
TS4yIEItS2V5IGNvbm5lY3RvciB3aXRoIFVTQi0yLjAvMy4wICsgU0lNIGNhcmQgaG9sZGVyDQo+
PiAtIDF4IExWRFMgRGlzcGxheSBDb25uZWN0b3INCj4+IC0gMXggRFNJIERpc3BsYXkgQ29ubmVj
dG9yDQo+PiAtIEdQSU8gaGVhZGVyDQo+PiAtIDJ4IFJTMjMyL1JTNDg1IHBvcnRzIChjb25maWd1
cmFibGUpDQo+PiAtIDJ4IENBTg0KPj4NCj4+IEluIGFkZGl0aW9uIHRoZXJlIGlzIGEgYm9hcmQt
dG8tYm9hcmQgZXhwYW5zaW9uIGNvbm5lY3RvciB0byBzdXBwb3J0DQo+PiBjdXN0b20gZGF1Z2h0
ZXIgYm9hcmRzIHdpdGggYWNjZXNzIHRvIFNQSSwgYSByYW5nZSBvZiBHUElPcyBhbmQgLQ0KPj4g
bm90YWJseSAtIENBTiBhbmQgVUFSVC4gQm90aCAyeCBDQU4gYW5kIDJ4IFVBUlQgY2FuIGJlIG11
eGVkIGVpdGhlcg0KPj4gdG8gdGhpcyBiMmIgY29ubmVjdG9yLCBvciBhIHRlcm1pYW5sIGJsb2Nr
IGNvbm5lY3RvciBvbiB0aGUgYmFzZSBib2FyZC4NCj4+DQo+PiBUaGUgcm91dGluZyBjaG9pY2Ug
Zm9yIFVBUlQgYW5kIENBTiBpcyBleHByZXNzZWQgdGhyb3VnaCBncGlvDQo+PiBtdXgtY29udHJv
bGxlcnMgaW4gRFQgYW5kIGNhbiBiZSBjaGFuZ2VkIGJ5IGFwcGx5aW5nIGR0YiBhZGRvbnMuDQo+
IHMvYWRkb25zL292ZXJsYXkNCj4NCj4+IFNpZ25lZC1vZmYtYnk6IEpvc3VhIE1heWVyIDxqb3N1
YUBzb2xpZC1ydW4uY29tPg0KPj4gLS0tDQo+PiAgIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNj
YWxlL01ha2VmaWxlICAgICAgICAgICAgIHwgICAyICsNCj4+ICAgLi4uL2R0cy9mcmVlc2NhbGUv
aW14OG1wLWh1bW1pbmdib2FyZC1paW90LmR0cyAgICAgfCA3MTkgKysrKysrKysrKysrKysrKysr
KysrDQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgNzIxIGluc2VydGlvbnMoKykNCj4+DQo+IC4uLg0K
Pj4gKw0KPj4gKwl1YXJ0M19yc18yMzJfNDg1X211eDogbXV4LWNvbnRyb2xsZXItNCB7DQo+PiAr
CQljb21wYXRpYmxlID0gImdwaW8tbXV4IjsNCj4+ICsJCSNtdXgtY29udHJvbC1jZWxscyA9IDww
PjsNCj4+ICsJCS8qDQo+PiArCQkgKiBNdXggc3dpdGNoZXMgdWFydDMgdHgvcnggYmV0d2VlbiBy
czIzMiBhbmQgcnM0ODUNCj4+ICsJCSAqIHRyYW5zY2VpdmVycy4gdXNpbmcgb25lIEdQSU86IDAg
PSByczIzMjsgMSA9IHJzNDg1Lg0KPj4gKwkJICovDQo+PiArCQltdXgtZ3Bpb3MgPSA8JnRjYTY0
MTZfdTIwIDEgR1BJT19BQ1RJVkVfSElHSD47DQo+PiArCQkvKiBkZWZhdWx0IHJzMjMyICovDQo+
PiArCQlpZGxlLXN0YXRlID0gPDA+Ow0KPj4gKwl9Ow0KPj4gKw0KPj4gKwl1YXJ0NF9yc18yMzJf
NDg1X211eDogbXV4LWNvbnRyb2xsZXItNSB7DQo+PiArCQljb21wYXRpYmxlID0gImdwaW8tbXV4
IjsNCj4+ICsJCSNtdXgtY29udHJvbC1jZWxscyA9IDwwPjsNCj4+ICsJCS8qDQo+PiArCQkgKiBN
dXggc3dpdGNoZXMgdWFydDQgdHgvcnggYmV0d2VlbiByczIzMiBhbmQgcnM0ODUNCj4+ICsJCSAq
IHRyYW5zY2VpdmVycy4gdXNpbmcgb25lIEdQSU86IDAgPSByczIzMjsgMSA9IHJzNDg1Lg0KPj4g
KwkJICovDQo+PiArCQltdXgtZ3Bpb3MgPSA8JnRjYTY0MTZfdTIwIDIgR1BJT19BQ1RJVkVfSElH
SD47DQo+PiArCQkvKiBkZWZhdWx0IHJzMjMyICovDQo+PiArCQlpZGxlLXN0YXRlID0gPDA+Ow0K
Pj4gKwl9Ow0KPj4gKw0KPj4gKwlncGlvLWtleXMgew0KPiBwbGVhc2Ugb3JkZXIgYXMgbm9kZSBu
YW1lLiBzdWdnZXN0IHVzZQ0KPiBodHRwczovL2dpdGh1Yi5jb20vbHpudWFhL2R0LWZvcm1hdA0K
PiB0byByZW9yZGVyIGl0Lg0KV2lsbCBkbywgSSB3YXMgbm90IGF3YXJlIG9mIHRoaXMgdG9vbCAt
IGFuZCBtYW51YWwgc29ydGluZyBjYW4gYmVjb21lDQpjdW1iZXJzb21lIHdpdGggdGhpcyBtYW55
IHVub3JkZXJlZCBub2Rlcy4NCj4NCj4+ICsJCWNvbXBhdGlibGUgPSAiZ3Bpby1rZXlzIjsNCj4+
ICsNCj4+ICsJCXdha2V1cC1ldmVudCB7DQo+PiArCQkJbGFiZWwgPSAibTItbS13YWtldXAiOw0K
Pj4gKwkJCWludGVycnVwdHMtZXh0ZW5kZWQgPSA8JnRjYTY0MTZfdTIxIDExIElSUV9UWVBFX0VE
R0VfRkFMTElORz47DQo+PiArCQkJbGludXgsY29kZSA9IDxLRVlfV0FLRVVQPjsNCj4+ICsJCQl3
YWtldXAtc291cmNlOw0KPj4gKwkJfTsNCj4+ICsJfTsNCj4+ICt9Ow0KPj4gKw0KPiAuLi4NCj4+
ICsNCj4+ICsmaTJjMiB7DQo+PiArCWkyYy1tdXhANzAgew0KPj4gKwkJY29tcGF0aWJsZSA9ICJu
eHAscGNhOTU0NiI7DQo+PiArCQlyZWcgPSA8MHg3MD47DQo+PiArCQkvKg0KPj4gKwkJICogVGhp
cyByZXNldCBpcyBvcGVuIGRyYWluLA0KPj4gKwkJICogYnV0IHJlc2V0IGNvcmUgZG9lcyBub3Qg
c3VwcG9ydCBHUElPX09QRU5fRFJBSU4gZmxhZy4NCj4+ICsJCSAqLw0KPj4gKwkJcmVzZXQtZ3Bp
b3MgPSA8JnRjYTY0MTZfdTIxIDIgR1BJT19BQ1RJVkVfTE9XPjsNCj4+ICsJCSNhZGRyZXNzLWNl
bGxzID0gPDE+Ow0KPj4gKwkJI3NpemUtY2VsbHMgPSA8MD47DQo+PiArDQo+PiArCQkvKiBjaGFu
bmVsIDAgcm91dGVkIHRvIGV4cGFuc2lvbiBjb25uZWN0b3IgKEoyMikgKi8NCj4+ICsJCWkyY19l
eHA6IGkyY0AwIHsNCj4+ICsJCQlyZWcgPSA8MD47DQo+PiArCQkJI2FkZHJlc3MtY2VsbHMgPSA8
MT47DQo+PiArCQkJI3NpemUtY2VsbHMgPSA8MD47DQo+PiArCQl9Ow0KPj4gKw0KPj4gKwkJLyog
Y2hhbm5lbCAxIHJvdXRlZCB0byBtaXBpLWNzaSBjb25uZWN0b3IgKEoyMykgKi8NCj4+ICsJCWky
Y19jc2k6IGkyY0AxIHsNCj4+ICsJCQlyZWcgPSA8MT47DQo+PiArCQkJI2FkZHJlc3MtY2VsbHMg
PSA8MT47DQo+PiArCQkJI3NpemUtY2VsbHMgPSA8MD47DQo+PiArCQl9Ow0KPj4gKw0KPj4gKwkJ
LyogY2hhbm5lbCAyIHJvdXRlZCB0byBtaXBpLWRzaSBjb25uZWN0b3IgKEoyNSkgKi8NCj4+ICsJ
CWkyY19kc2k6IGkyY0AyIHsNCj4+ICsJCQlyZWcgPSA8Mj47DQo+PiArCQkJI2FkZHJlc3MtY2Vs
bHMgPSA8MT47DQo+PiArCQkJI3NpemUtY2VsbHMgPSA8MD47DQo+PiArDQo+PiArCQkJdGNhNjQw
OF91NDg6IGdwaW9AMjEgew0KPj4gKwkJCQljb21wYXRpYmxlID0gInRpLHRjYTY0MDgiOw0KPj4g
KwkJCQlyZWcgPSA8MHgyMT47DQo+PiArCQkJCS8qDQo+PiArCQkJCSAqIHJlc2V0IHNoYXJlZCBi
ZXR3ZWVuIFUzNyBhbmQgVTQ4LCB0byBiZQ0KPj4gKwkJCQkgKiBzdXBwb3J0ZWQgb25jZSBncGlv
LXBjYTk1M3ggc3dpdGNoZXMgdG8NCj4+ICsJCQkJICogcmVzZXQgZnJhbWV3b3JrLg0KPj4gKwkJ
CQkgKg0KPj4gKwkJCQkgKiByZXNldC1ncGlvcyA9IDwmdGNhNjQxNl91MjEgNCAoR1BJT19BQ1RJ
VkVfTE9XfEdQSU9fUFVMTF9VUHxHUElPX09QRU5fRFJBSU4pPjsNCj4gZG9zZSBjaGVja3BhdGNo
IHJlcG9ydCBlcnJvcj8gbGluZSB3aWR0aCBvdmVyIDEwMA0KSXQgZG9lcywgYnV0IHNvbWV0aW1l
cyBsb25nIGxpbmVzIGNhbiBiZSBhbGxvd2VkIGZvciByZWFkYWJpbGl0eT8NCkFueWhvdyBJIHdp
bGwgYnJlYWsgaXQgZG93bi4NCg0KVGhhbmtzIQ0KDQoNCg==

