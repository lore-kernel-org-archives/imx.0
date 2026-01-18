Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023114.outbound.protection.outlook.com [52.101.83.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB76332B9BE
	for <imx@lists.linux.dev>; Sun, 18 Jan 2026 12:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.114
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768740722; cv=fail; b=EzgVl9lHSA5Ir3YO1TPKggBe/T/PvknG9Vg5Z+izHFOAdsjN8Q+ktzvPJZ5umi8r48j9r2jrFd1DR6tcBclwLhx7F1B0H7EfU0CdVgUeiwuIpQauq+xs/TwrAY4AejG0Rlr7nlmarDZEr+OSMf/TB9wwfuvNggb/QbuDt7zEaxY=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768740722; c=relaxed/simple;
	bh=vBLIA7bA+eUHo+nyMDJuAcInX0koLSwqukRJKePI5TI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=pJQBYhEoTL3n1wa0XZb4iBauIXKuogDJkeOy1JtHgNee615k8aLYWw0e8IuF4d5wGaDXgF8YIXGKp6yj94g6cM24gMCbriqWoe03BCg+M1svnE5n9fFW4cTizClspzpvC6bQLKTAwejlvirBO2ybBqWUjS5AE9lq4gUFNUcfkxo=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=YQI3CEeU; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=YQI3CEeU; arc=fail smtp.client-ip=52.101.83.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="YQI3CEeU";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="YQI3CEeU"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=G5xnw4grMme+JwsJa9vzNTFrzHD7roSKaD1TnZhjOwyKjOcaLA4YOBAVIMaWOaAHB9ZyoIzW+PfPVXTalPetORj6EDgf+8ZZ3KQcFKWOTk57MSlo9RCz/2R1TQg/Jxf+oyHByRmt2f40hnEua9vh5D8NGkoE2k7N/G8HwqgpLYfDO8bclOHwmbEtk6egJ+I1nQQkSS9NZIN5o9wPTIxAFArG04bduHdERiBibi7JqtMyncqa5Q4p6CmZ0k+OPGh9cVp1D023GXeVACv2uR2fsFIxyY07X5CB81FJYYOZCP0wSw3/JkrNmCvjxHcazefHJDwwXjVsf+vmuX5qWBIm2Q==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcBzeqs7Y8H/5HRrqPvs5I8vFp/xrRxNiW8xLg3SQL0=;
 b=e1lR5tR0FFhMy3fdd9LhaHY7ttNbU4i84H1pFCZQayHJ0OK4g/NraL0mRp/gZ3K7Ebkiv3/Uaxnojri5w1ry8FHMe4nFLckYOvtsGbLcr8kOuzg4yTBSI9HZjz396G/+IJHPtlb79D8/EQX8wwZVeJ5zs0ilg7pUVNxTlxJxQx141XAA5SVhupTlwJTV6PPKJOZe26XQC0Jh+FxQVorofTRyB7k55Nd4llBkjMeX9f7Q1N7Cwpe1NkS6hjchN/0C+7yFqUJ2B8c8j3xAzjlJna6biKtJc9eurQemvanu2CX+TILTnDP8eoa8MUAB8aMUgj6oOy6oU2xqLAesF1wzdg==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcBzeqs7Y8H/5HRrqPvs5I8vFp/xrRxNiW8xLg3SQL0=;
 b=YQI3CEeUcFNCRZ1ZK3x8aFvvBIIPAeZftMYNQFkreL0LGFMf72pCXgzluLbymcn2Pbr/nu1zlndKDGFwNZ8LQIwrRDaqVP100R1aJnXgOasN5E7iYAfxblWR2HB8Bv0FdasIazj4ss4g4vMneoyau53yMt0Qc87AyVjULsbWdQU=
Received: from DUZP191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::10)
 by PA6PR04MB11780.eurprd04.prod.outlook.com (2603:10a6:102:522::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Sun, 18 Jan
 2026 12:51:57 +0000
Received: from DB5PEPF00014B9C.eurprd02.prod.outlook.com
 (2603:10a6:10:4f9:cafe::dc) by DUZP191CA0013.outlook.office365.com
 (2603:10a6:10:4f9::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.10 via Frontend Transport; Sun,
 18 Jan 2026 12:51:52 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB5PEPF00014B9C.mail.protection.outlook.com (10.167.8.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4
 via Frontend Transport; Sun, 18 Jan 2026 12:51:57 +0000
Received: from emails-2206837-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-10.eu-west-1.compute.internal [10.20.6.10])
	by mta-outgoing-dlp-141-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 4E90880169;
	Sun, 18 Jan 2026 12:51:57 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1768740717; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=UcBzeqs7Y8H/5HRrqPvs5I8vFp/xrRxNiW8xLg3SQL0=;
 b=iQgm1n+2RPLUnBbWSemtiXcBMWndes71QNmH9QXMXF6sMEQ4Yvu20xTbBJx7y7Jly7qgT
 kWVKX0oGUQN3eMDkgG9g4ogYIUcoj2FEu1oM57pMJgMmne4+i5B50c+VtdPzGvgiWy2HzH5
 GuUCMj4+T58hXGenLbAp5BDDB8Xz2lY=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1768740717;
 b=JrzL5hb6liHQ006wBjlnRDxN82HO1dvSy4PjPhCpuyvI02s1d8hXVxl9FXbnY4VdU1Z5S
 5O8ZiBFJ8ZtcWq2gEveL+l42NfdJJT1WCcyrZ+Ucb2iRhWJ+zu3IubrCiu6Z3TrMWr7J5QX
 eC3TEM9EYw9AsJb7UYhx47nTaSTyShU=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bqLw9yYQjMWma051nNjwlhEQE+cgsa/3Ne/FYNO07Zy4f2NlFYZ28b3nhA8SkC+tK6k4VNITHe1G1qFrRF6m5v2Fe48yjwYz+EqO8Eo7uOhztmKmaz0ypmAYOt6gj/Fv3BqqbQUVdSTFdK7g239W5ZP+8X8DFYmgYo2xftIqCEraQ2TE2o9Uy5EjgOpUT9X91G5GALZ+H0/Vwo8IO+0dvGDeTbyimN1w4OtUjhHEcgv3XLd7Kn2mqQ8BTGJqgOy/PzJpQoLjvUSmGPHCwVg2hJ/lL3cUpLIdwbfEIBEz2iNKhPXQeb+l63f1LmVrtr6cWZdkCb1jHmRlYlPdIAYaAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcBzeqs7Y8H/5HRrqPvs5I8vFp/xrRxNiW8xLg3SQL0=;
 b=wIGyihLz9cSWzh64B+zTB+hmX5AYVAnkfGqBlNmhPNwrh54AfqURSN7Nk7VRnHF85rgqVKwE3O5HIaH1gZ28qtbD/eqik4J+KgYAyFC9gvnRzqC0Ycr3gOSIYCIdWnziZTbV9fPwIIWV350+/5lwV44+05mkyjR7ko7dkCScTr6Gh3XjlJiTBZ7uQojTcTT17OFYfsDwL0Gh3rhE9J8B+bGsR9pLuTC9NOB3VZB/uhW81KFv0N0JijXYRlf/eT7K7tliZu8O5o4MHdeM2Zrz7CC32VH15fDwlvn3QXp0O2DcdxEwdlFl/Fzeh+9zmvtrE5m9xCMViCBiKxsGuRDTNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcBzeqs7Y8H/5HRrqPvs5I8vFp/xrRxNiW8xLg3SQL0=;
 b=YQI3CEeUcFNCRZ1ZK3x8aFvvBIIPAeZftMYNQFkreL0LGFMf72pCXgzluLbymcn2Pbr/nu1zlndKDGFwNZ8LQIwrRDaqVP100R1aJnXgOasN5E7iYAfxblWR2HB8Bv0FdasIazj4ss4g4vMneoyau53yMt0Qc87AyVjULsbWdQU=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DB9PR04MB11694.eurprd04.prod.outlook.com (2603:10a6:10:60f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Sun, 18 Jan
 2026 12:51:45 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9520.005; Sun, 18 Jan 2026
 12:51:45 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 18 Jan 2026 14:51:39 +0200
Subject: [PATCH v7 2/8] arm64: dts: imx8mp-hummingboard-pulse/cubox-m: fix
 vmmc gpio polarity
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-imx8mp-hb-iiot-v7-2-ef1176119a8e@solid-run.com>
References: <20260118-imx8mp-hb-iiot-v7-0-ef1176119a8e@solid-run.com>
In-Reply-To: <20260118-imx8mp-hb-iiot-v7-0-ef1176119a8e@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: TLZP290CA0009.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::18) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|DB9PR04MB11694:EE_|DB5PEPF00014B9C:EE_|PA6PR04MB11780:EE_
X-MS-Office365-Filtering-Correlation-Id: f9efe654-8b59-4d97-cb66-08de56905d54
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?VzhDcVpXMXNLMVVDenlYVmFIQmtDU1RDT25qbnljZGJhN2NaN3k1am56Yml4?=
 =?utf-8?B?VXFhZGloaUM5c3RYUkZ6cEdOamw2enhXcWdLSnBpRHhvK2Vaek9zbzlLNFhY?=
 =?utf-8?B?NGErcFlWNDZwTGkrWklEZmZXczZ5ODNKS25FTDM1clYrTXlpMDN1UmZ0bmlD?=
 =?utf-8?B?bHpzczhEV1RhY0xlZSthT1ZSZ3NaOGVlZ29FNkdrS056QzZzRm9OdmdxT0V6?=
 =?utf-8?B?bGNiUXJ1eHJONmlxbHNNT2FTZVdmUmNXNlE0Q0FPQXNCQXcySEd5S0RpUlBG?=
 =?utf-8?B?S1A4ZGZxNFFXdXVLM2FESUlEY0VzQzVJSmJyN1NmYkhDV0YrT3NHdHRFZFk5?=
 =?utf-8?B?UlhSaGxCajNiaWNZcXZHankzRFZoOUJKMmdBTmhaK01jc3BkUytDNUVTYVo3?=
 =?utf-8?B?bFVPMDU1clZWTlVWRFI3OU9Qa2lLOHlSU0NXUHRDQ1VXZi9xMmVKRzB5OHIy?=
 =?utf-8?B?enlxVVYwRjFYU1VXSnI5YzNDVkNhTjRPcFVldzBXblM4Q0lNd0dyVllnamJp?=
 =?utf-8?B?b0RKQVU2R3NuNFEzbi9jZzlCaFM3NURsQ281NkJ6YkxTaUtyZDFXSVVUS1RL?=
 =?utf-8?B?NzVNZUo1UWpFSXdCZG50ZHhNdjZQajJqVTZPSmZvSk1KMDNSYld3UlhpUGlK?=
 =?utf-8?B?WVZuaGxzVVJtTTd1MU5CdVZxVmR2TVlkTGJmZWlrcm0xakNkcnhlYzJjN0Y0?=
 =?utf-8?B?RUc1NzBKMEFIOXd5eDZBV2puV1dMblFrV0IydkJENkFSdnMyRkpPb0tLRENG?=
 =?utf-8?B?QzlRdjVySGg2SDVtcUllQUh6MmZNLzlMaHRDS2VXZXBSdFJVUkp3ekhnaXpz?=
 =?utf-8?B?OG9nUzZYcTRURi9yby9NUytlRXJFa2xtWHltcTYvWVlKQm5iNUdkMWxGcGJG?=
 =?utf-8?B?eDF1YklQVGRVVzRIM2FNTmpYbXZ6S1hJZHpURzdOdTJBdjB5MzVNSEoxejBh?=
 =?utf-8?B?bSsyVk5FQVhhOCsxaXRHWkpqekNNdTU5VnR5ZGhnQS9TT0FWcGtCWlBIeHpT?=
 =?utf-8?B?WWRQUXBEV3QrbWdIYVJXOFBlVnJhM1dMRlNNa3hBejh5ek1ocXZ5c0hlQk8x?=
 =?utf-8?B?YVk5cVVweGJQTXBYRnRIRkZlMXRITzRrN2ZPZU9TTTdubHpIcEp4bXVFMXJ4?=
 =?utf-8?B?UGxpbXVxbzU3WWM0VThBNENXejhwdjFnV21EUmc4VG5XT2FyenF4YkVWQW1h?=
 =?utf-8?B?dmdxdi8zL2lZNzhSVzdIS2RYSVJuOTkwRFFIOGU4V0UwSnViZW9IWDlUcmhN?=
 =?utf-8?B?WFZRWkNRd1dJRUJZWktLRGI2T0IrOEdaenU5elZTTnUyd0hGelNaV2h2eWtk?=
 =?utf-8?B?dDQ3RWFtSEkyUXY2bldaejBRUDl1YThad3p6MDMrdUFmM3kvdEx2WGExWGg0?=
 =?utf-8?B?RFhCVlZRMFlvTWcvZmZiTGlwRS9iL2NFR1VCeFNkZDJKOW9LNFc2UTF6Y3pT?=
 =?utf-8?B?WTdobzhHRHJJTlVCd09jcDM1aUh2VjZycm16Tmp5UjMrUXVveTRQMXhoRFNF?=
 =?utf-8?B?Ukp5V3NQek4wODB4akxFN3lic0lYQkdKZ0RPTm1rc0gzY1JxYkNKN0NpM2Vu?=
 =?utf-8?B?WVNManRhaXVwT3VtdmJIVmlITENVYUpKS3E3ZjAzeHBsVEdXQnRtSWQ2VVBW?=
 =?utf-8?B?Q0hMUHBDdlNzcVMwQy9IZHkzUkNPOHdpdzExeXlZL3N0cWRQUFY4YXNsREUr?=
 =?utf-8?B?TEFtOFJMamsrbXVUb09yY3JtcWV1U0IyS3pKZHoxUzFsdGdhNnVScC9zN0pz?=
 =?utf-8?B?NG9CSUYxOURUTmw1MldEeW5VMVh2SzBlS0lYVmczMUlGdzUweU5IUmJHQ0Jj?=
 =?utf-8?B?Y3N0OUprczZpd3JWTTA5REEyS2pUaDZXR2J3YVY0dUtBZURqL2hudzhiMFJR?=
 =?utf-8?B?Z2lCSmVNZTUranFwU1JyUVo2YWZKQzlOZUlHOTJ4V3plczlmZWhZajdMUjhK?=
 =?utf-8?B?QkFaTzdNMkd5eE16b0MwU05ITmljeUpCZzB5SWVnclFidGhCQTZUNVQ2dWJo?=
 =?utf-8?B?U0xMNXlEN3Q2MmhrbjhKWStPQ1lObmdIcysxZ3lRTGJmell3Z1grTFVlVnY4?=
 =?utf-8?B?cXB0bC9EUnRQdjN0RHVQU3lsd01Bby9abWVDVFlYbEY0ZTRsUndLYUY5OXU1?=
 =?utf-8?B?dGJaQTJvbG82Rlk3MnZqcDNvdzlyVEJwenlSWDllR0JZYUhyNTBrMFlRbVkx?=
 =?utf-8?Q?Dgkqtx3gYruEB6CusIVsczU=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11694
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 76d7349b0cfb4d3baaa9b72b8136a2e5:solidrun,office365_emails,sent,inline:df4c9036803ce3ce0c6c60d122810ee5
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b3769969-861e-4136-1d4b-08de56905602
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|35042699022|7416014|376014|82310400026|1800799024|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ODRoQk1NY1M1T3pGMERYT0FEdnI3Mnl2eG9JTkkzRERUcVczTSs4SjM0a3k2?=
 =?utf-8?B?SWJiT05WWG5tQmtxblpzR2ZXRjYzZjMvM0grYVRwK1NqYjVOc3NBRUN4dEpL?=
 =?utf-8?B?SkdMaTdTZXExcHpudjd2c3lmbUxVUFJtNnlEa29OZzhuQWpUNHdWRG1TWFNP?=
 =?utf-8?B?OEE5WHhUZnc3QWYvdVhoLzBudDJTbmoxcDdwNkMyWmxEdzN3cVM3M3liMkVC?=
 =?utf-8?B?SUV3MkUrZDRRamFGZHZaWEc1bTJHQm1la3RKTzRwSWwzakYweFdmRktLYlZY?=
 =?utf-8?B?Mitia0p4UjFheG5xSVlndHhOSkFiQTQxcXNpNDVtVFN2dUlIVjl4dWFlNk5y?=
 =?utf-8?B?Vjg4cE0rbFVOVDFOZ1ljSUxCZWVySEZTK0w4M3hmanZhVEZTRysyRGVUWXRz?=
 =?utf-8?B?Sm9pLzVXMXdsMWFBcFJhV0FVSklmd2h0RFRzNk9DaWR5eTNZTTFKd0xEb3hM?=
 =?utf-8?B?ankzYjdLZmdLQUE2UTlxRGFIU21KSXpQS1lZWTI2QkRxalM2dGx6TlhSNy9i?=
 =?utf-8?B?NE11eURVaGVlaU1pQWVWUVRBR0ZBSklESFNYN0x5Uk5LWXZuQk1BOG1jN3hz?=
 =?utf-8?B?VGN1RWxRY1BZVjJYYkxDQmZBMGtoQlZmVTBoYlRGRUp5VEtaRWFEVWNWS1NX?=
 =?utf-8?B?N2Y4eDc3aHZ6cndIM1haTlFXcjdPR3ZKYWFYUWFxTW1rc2FBZ3lvN0UyTkRn?=
 =?utf-8?B?dGlTMnJtLzFCNUZraTFtb29ZUTkrWDlscmhUZ204U2MrZjZlbEg5REVjd3Fl?=
 =?utf-8?B?dmJSQVJaOG1BcVMwN2Y5d1YvbVNIWEJ6U3k5QzhCUmExbFRxUGQzeWordm9E?=
 =?utf-8?B?Y0JSdjVSZ1NGaTMrY1dGNzhYU2JtaXJ6VjFMNTNlbHF0YkdyZTJ2TWdHSHg2?=
 =?utf-8?B?ZU1uclUvY0ozcUJFWEk1TE8yR29PdVhWcjRXTlNndWNXTkNYV3BNZDdnV1do?=
 =?utf-8?B?a2RJM05uVExZeE16UXpFRHFmYWNCdVJTNnZTN0FDRnkvVjFlc1QvM0VaS1d5?=
 =?utf-8?B?dUVvNzZHZDZZQ2xVd2FKblpJdlEyemVMNEZSM2xSWHNLRVQvdjNONlNrQXdM?=
 =?utf-8?B?M1hGN1h3N0dpSCs5a3I0VHhKS0NOWVZRZnY1eWRZcDJ6QzhTRzlYOTlLVmhO?=
 =?utf-8?B?Znd2SmhjdUlzN21qanNQMlBZNG45WERzZzBGOFdaY2ZuQWVMWFR1SlZhVENZ?=
 =?utf-8?B?YVpJSjVCUlEyY2U3VGVyZzhwU3AzVEM1Y0ZWT1pwZkNRUSsrcm5uNTErM3Jp?=
 =?utf-8?B?VmsvYWo5ZVlseEhRM096OGxsaVJkQUFNY0laUko4a3J0djU5cjV1SXkyb01H?=
 =?utf-8?B?c1lVWCtaci9DUUliMTZTdDV4dHo3dzNYZ0VMNTl4a0QwYkpLUlNwbDJCVlZz?=
 =?utf-8?B?NUNmaGhFQ2RCVkpjdGFmcDJYbDEwY2tYb2xobE1qRGhLaUpKb1JCcnJnMVZI?=
 =?utf-8?B?TktzalFYUGhONURrN0w4RlMxOGZsVnUrZHB3Z25rc0x2UXp2SFFRRkNITk5v?=
 =?utf-8?B?TUZUelhOMERZYjRpYzlSd3JLekhXLzY1bmNEeEFIU2x1VUszVXRMZHVZdVNw?=
 =?utf-8?B?eXBSZ1kxY0krWnNiSE9jTDgzdlpYRStlcmpKUE5sN2o0eE1iYTBXdTdmL0gr?=
 =?utf-8?B?YVdwaHFRcXQrQUd3YXpDZUI3NmZxejBLOGQzcEFWK3h4SGZObWJxUDNNSGZq?=
 =?utf-8?B?MWthckFya0Z3dkMyYlFRMVBhb2d1S3RmNHhFVVhrWmdMclNpMEZQaHo0NEdt?=
 =?utf-8?B?Vm83Q3FlditiV1grb3FveSszL253VTVvM1o2cnplampGSVMvTnU3eEdoWnMw?=
 =?utf-8?B?ak9MbWhqZHdlazFRdHNuUSs5Y3RmK3BQd3o2MWRWZ0p1YW1Qc0cyZUgrWGIr?=
 =?utf-8?B?K3VqdlVuaUFlNEcwcVJsRkRCOW5RNXRnelFZZStCQnhhY1dIUkhYcDNkcVQz?=
 =?utf-8?B?ZFpKYVhTWFZDem1BdHZxQ2xIcHZvenhBdGVlQzlRclVlbUhIVmhhSWNORnZM?=
 =?utf-8?B?ZFN5MEFEZFQxVzdUTlBQOHB3dy9MQm9OUjdCeDU3a1RmbW9nbG1DQkM1dGFo?=
 =?utf-8?B?Q1pKWjhEV0Jhdm1ORkM1VXQrejZENHdmejRJQVJMREtOSnNSNktpdmxmUk1S?=
 =?utf-8?B?OVBBZ3lidXYvVmN3dXczY0NHaDFTUytOQnYvTnRBVzgzemdqek9OMDUyclVJ?=
 =?utf-8?B?YlNNQlQ4U054cm9NNGRFZEZzSXQyL1FCSkdKTUozRlRaYWJWNGE4RkNmUm1u?=
 =?utf-8?B?Q2VuVlo5dksvTmY4Q0VCcWRVbFNBPT0=?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700013)(35042699022)(7416014)(376014)(82310400026)(1800799024)(14060799003);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 12:51:57.3886
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9efe654-8b59-4d97-cb66-08de56905d54
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR04MB11780

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
index 8290f187b79f..7bc213499f09 100644
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
index 825ad6a2ba14..5b8c8489713c 100644
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
2.43.0


