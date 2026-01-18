Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021115.outbound.protection.outlook.com [40.107.130.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 983C132ABF7
	for <imx@lists.linux.dev>; Sun, 18 Jan 2026 12:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.115
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768740725; cv=fail; b=Mlqva0npwmadq37QX5rPHgJQGVUwyqVFOHtCYg0r3f/TPMWe791ibYPbYvBsilAkTvC6wFKSnGNdALWs0xGgF0lJXWIQGSQ3WKywD0gLkLHlovU0PWpr6Sbp7Hx2IIDCsXcov9A903xcThJtgr8n7R2aajekl6SBQigx+VwF0x0=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768740725; c=relaxed/simple;
	bh=Dr+Or1BixHclYaUtsuFm/s789ijk1S8vftg0M9wge+U=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=n/rAJewDN0RyxgMGZLxPXuU5FtpKlxMStu0vn66OGqvz6MICYocW0Bfvu37TnAnPoqqWbUUlmiMWpmnqm2GVqQAnlzSHYQcuODVgcfOGXFY49tMfi020lz2X2Hm2kFwfu5L8aQqQj7dtfdionFAY9BQjnSbrKWbyVZfPniJJBCA=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=o6n4c9M9; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=o6n4c9M9; arc=fail smtp.client-ip=40.107.130.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="o6n4c9M9";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="o6n4c9M9"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ECxvSasojxcWmt8SMVawDnOm0W9YS463Iv4CU8A9E27X+avAhuSCbaz8acxzgdqHaVH5A8vm2i1HXLf3KcIMg4BwrXwE4BNJUgiRWeeqBbZm1kM7hQhX7Af8n5/p4c65r0kGj9/XNSbH4eLFmii2o+5AOGjsqaYo4bagc7c1X0qar2LQIAYTo63292Pw98jQpj4SPomauPPkyFLpRQxENxqsN5WewN5g5VvobKUvgAT5QwgkqPO+eWFfs567qdMd6i6iuGUjCG9ZeMMvw4h1gwDrda6m9n+z4Y5ZfVCZlLQag0KKI1a0ebHA1lJztXJXR2flEyt9I3TcEqnLP8ij6A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOWJLsxRgnPImz6xi0RHs45xM/KcsR1AbI/tLyO9eSo=;
 b=u10AjOuV/bdFBGeM/tQ4nnpxBC8rdquNQJDuOLWVk3TspdOAA3O2QOBoYPFO7kNrWa5lDT2eX4YBbvz4GGi0KLFywBptutdmN96lTpIelDlE0siww6+u2NuRbEh/+S4qoOHjMbIdJK/1Mx9RoKjulWhFJUFU6lU21hBQlFTukZKagleZyaiysEPeXtXzB/A0H6UDrJMKsmWDNeC4f2Kic2mwyrHCoM/l/6ziNpAEJe5Oqx66deJiKcfRwXE/ypGXWSVoRlFOktdcpLCrt52NSV+7SGgQ2+107jldJMb5dpV/K2DSeTLiH3Joc9ixMEwBP90Jl9X0MkXlpeiMDhwezw==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOWJLsxRgnPImz6xi0RHs45xM/KcsR1AbI/tLyO9eSo=;
 b=o6n4c9M9YsjBap7Syf7Ei9ILEdtvtc8p9h57e5NWUv6Xi/sYSSbJkoxE5CstjI5YHkSavzW2KHHjfFAUVrkz1HC+kqvDWDW+POTl3lsGmIDvmed8eMSds5kET8XNAQJC9E9TiL18OYwo7jXTs9zlKbg0xeFxjjL8IDHxFjxFUJk=
Received: from DB9PR05CA0030.eurprd05.prod.outlook.com (2603:10a6:10:1da::35)
 by OSKPR04MB11366.eurprd04.prod.outlook.com (2603:10a6:e10:96::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Sun, 18 Jan
 2026 12:51:59 +0000
Received: from DU2PEPF0001E9C0.eurprd03.prod.outlook.com
 (2603:10a6:10:1da:cafe::98) by DB9PR05CA0030.outlook.office365.com
 (2603:10a6:10:1da::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.11 via Frontend Transport; Sun,
 18 Jan 2026 12:51:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF0001E9C0.mail.protection.outlook.com (10.167.8.69) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4 via
 Frontend Transport; Sun, 18 Jan 2026 12:51:58 +0000
Received: from emails-5544868-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-103.eu-west-1.compute.internal [10.20.5.103])
	by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 95D447FF4D;
	Sun, 18 Jan 2026 12:51:58 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1768740718; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=GOWJLsxRgnPImz6xi0RHs45xM/KcsR1AbI/tLyO9eSo=;
 b=U7b0Cs7f5G2MuUzkOy73hk5TrrDpjvRg72lP/TF8tZ43dEqNHhPv+ZC+SVZs+nOffnFRw
 mxcFM+h0z2U/VA8WSnkKoOMJqitnY92kpfj8IGBaSQfKGv0CXOpA8BgAoPiYHZBK5JqpjhG
 8tKtCqHqZmlFmzK1XLM/5RKKapzzhyY=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1768740718;
 b=MQHot04ZV24cYmdrTX5nFoQKy06c0lSUNSjMPRkqknWbEvSJ/Dg69I8rOpimj1Gde3v6I
 B1hqrsfWefEGxUv95ERLkYe0u3Ia4HY10GIuqskqgFYG7uKqbDwyNNsyiLBimTYeVXGE5Lt
 6mLuxltLeu+/qIscKlOwqWq/ze+NUzk=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZuotOb6WCiX8zrWQBGFIuoFkb1z+aDcGqF+/YJtOXTNVRNb4PBf7Pxee9SIb54eMbjXF0tp0q3BLFcwGbq8HmDSknUpT1/fj7b8vM3rwcCjrToK4y6CFzwKMMBJZqdO3pCsXFxKzQUOxo8sLWrJ9G6iaZMuj0ijtwMhRMa/fysCQqpHAfHmB5hkuMahbNo2D4Vd2Lxn43D9U3w6t3H/KzDGrif77z04jrpa4etNedF8gOMHJhmNT5kHELOsa2xjGfcQyzNURUVNRfy9ZSDEloeeNb7V3IbtcXYIiVgWfxADZJ3ZRGhbTugW5sqFXAxwWwcPAVign6bTOSyrSyQWLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOWJLsxRgnPImz6xi0RHs45xM/KcsR1AbI/tLyO9eSo=;
 b=wjccHHG31clYxc9fY7eH2fJLmELiFnHMAe163tsqivYXWZxJwxtgw0zYEUdF+vAKTygP/Yav5Ae9uyd4X8kLp4cGb33wfpUFg4kQzcUXZmVIvAddRxW2+PuyDxj4dyYUOZOIMwBbpyQp2iT5hPaWcf0I0GEFwTyzUSOz3TScpJhBZfMFLXaMJQM/BQA8Sskh6gmMnbyW0eW1/YXSYZtjxlQ5+R4pOKUwup2oWEfk4qLgrR0URFklzC9FpBMQnx8lSuQUfRsO1APCqTjeaAOSAJqohmc2EpKmujxFcPQUVv8tqY7gxKvguz6dNWWrcSNXQUjknvfTdIvzfcEe7dAeKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOWJLsxRgnPImz6xi0RHs45xM/KcsR1AbI/tLyO9eSo=;
 b=o6n4c9M9YsjBap7Syf7Ei9ILEdtvtc8p9h57e5NWUv6Xi/sYSSbJkoxE5CstjI5YHkSavzW2KHHjfFAUVrkz1HC+kqvDWDW+POTl3lsGmIDvmed8eMSds5kET8XNAQJC9E9TiL18OYwo7jXTs9zlKbg0xeFxjjL8IDHxFjxFUJk=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DB9PR04MB11694.eurprd04.prod.outlook.com (2603:10a6:10:60f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Sun, 18 Jan
 2026 12:51:46 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9520.005; Sun, 18 Jan 2026
 12:51:46 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 18 Jan 2026 14:51:40 +0200
Subject: [PATCH v7 3/8] arm64: dts: imx8mp-hummingboard-pulse: fix
 mini-hdmi dsi port reference
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-imx8mp-hb-iiot-v7-3-ef1176119a8e@solid-run.com>
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
	PAXPR04MB8749:EE_|DB9PR04MB11694:EE_|DU2PEPF0001E9C0:EE_|OSKPR04MB11366:EE_
X-MS-Office365-Filtering-Correlation-Id: d29eea8b-8e21-4603-5320-08de56905e17
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?dEk4ZDEzb2J3bUt4aEhsOURtZXpPcUlNWDVZZ1p0eFdGN0t0WTVsN3gyRFNP?=
 =?utf-8?B?OVNZa2h0YlROaSthM1hnSG1MY0VmdmEwaUVsYXRGZDZrYUdsaE1wUWlvWTR5?=
 =?utf-8?B?TUhaWUtKSzE2TDVWMVFxaGU2ajg1a3ZXUHZ2VGlzYlhHb0l1VmNaN00zZXhn?=
 =?utf-8?B?RkdqZFJvU3pGVWpUdUJRaHdNaUVUOEowRkJOUXFrc2k0ZEI4TThpWkF1aEw0?=
 =?utf-8?B?Z2paZHppV1BjMkNYc3pkUUFBRVRHNTl1TDNMUmlrejg3VGxhZG5pblpXT1JE?=
 =?utf-8?B?NElqM3lFNUcwR0FHT1cxbGtoZHJCWG9ZUUw3R1NhUURkTUgva21weVM1TUd0?=
 =?utf-8?B?a3VyUi81TjRuTVJsYVd5MytxelAxWjVKVFRuMThDSzVKY3U4VkQxZ2ZveGxX?=
 =?utf-8?B?dXFUU0paeS8wQzhhS3ltb2YwamxCWlRFNll0ZHowUllCTWVYS1NnY2VBWG9t?=
 =?utf-8?B?R253aHZsdXU2M20zVnArV1dZZFlraFhSVFRkbzNVNzBFempDMFpiQmhmZndn?=
 =?utf-8?B?QTJrbGY3R3dJSnhsZzVYRElSQVhVa3Z5VElmeXl3elNhc2RnSkcyS1dxWUMy?=
 =?utf-8?B?NWFDanh0bm5QQ2granQxek9PRkFNRXFDUFVxVGI4U0pOaEc4ekhhdlNVUXlJ?=
 =?utf-8?B?ZjBTOVZUSEswd1BJcFRtWkNFVVZBUzlxNDAvWTJHcEdYOUJHWWVSNXd4QTdv?=
 =?utf-8?B?Zkx0L25pZC9HeE9USXh3ZjcwTUFHN3NCWElFL0N6V09tSURpOUc0TXlmcGtP?=
 =?utf-8?B?MXdodFZmdWJYR28relRaNkxWZTM4d1ZLV1ZLU2RhbUM1VzJkUDk4SnpqSUcx?=
 =?utf-8?B?ZmczWm5ab2ZzS0VoQmNqbDZaUUdzQ0xkeFBHWjN5b0ZkUzVtTHI4Y05mSVlM?=
 =?utf-8?B?eW1ISHdSZ0JaaVdqVmMxS3crNXR3VnNOMGdDRkVXTGRodVFXY0R2UlkxNGV2?=
 =?utf-8?B?QzZsK1pHWHFoVitHMlFWVnJFZjJ4MVdWbVBNVEtGVXNCbnVKczlDTlk0dWRM?=
 =?utf-8?B?R3JEWkNubFNVcnplaUV6NmhKeGVvdmg5dkFTZkpUdHFtb0FndWJPY0lPS0R1?=
 =?utf-8?B?N2Z1M0dFV0gvTlBhWjZFWkZScTFiMDFrQWxKYjBERm1xNkd1Rkp0REV1S29o?=
 =?utf-8?B?cDlBdUdURFlwMFhGQmZrNW5jV3RhODU4czlIUzJDS0dqYUJjY1dNK0h1aG1M?=
 =?utf-8?B?WHhSRlRlQmRqSW0yanBaNkhuN0NCd2ZZdjZNaHJTcGE2NVhMQWpIOUlIWHZK?=
 =?utf-8?B?d25tNCtuR0xlSVRZbVdKOWJjUEJmUjhyZ3FXdUVvZ2NUSDMydkVvR3hnTDJu?=
 =?utf-8?B?bnBTL1VzN0VKNmgvd3ZldEhJdUh3T3N1VEVMMkFmK1VlN3JVd1R5MUVxdllp?=
 =?utf-8?B?RXluRm1jQmxjTXo3b0RmU0UrcjRvNVJJNzBKd21HMVhLN3U5MUR0Z2FEeE01?=
 =?utf-8?B?UUl1TWVZUEJUaCtXcnYzMDBTdXpsRExNSkFrY2lNVXgzWXUyS0JLOVhScG9p?=
 =?utf-8?B?aVpyU0dOL1BLSUlrdnB2RmxhSzFDRE1JTGZpYStMV0ZqL1JqbVllTWIwY2pQ?=
 =?utf-8?B?Y0FLandLSnhRMDNXWmZWMzYxeSt3OVVHbVdway9kZ1FZdEROUThYUDQwR1BN?=
 =?utf-8?B?Y2xFcll4NEhjRGhRaHBkWWtWTkg3aGhFbTN0dENnZ09NOTd0eWhsUHY0WDZV?=
 =?utf-8?B?aFFKemV0Nnh3MUFlaHpKYjc4RzVnem81bFN6dU1XV2R3NWJJUWpzbEhTN1NK?=
 =?utf-8?B?cXZNWk4xS25yVXMxU24wak0xaXIxS2RiYUpXcFU0Z2t5THV3UWtNNTNVZEpE?=
 =?utf-8?B?ZHo4cTAvMzZzbHo0dXhWOHZIalRQL0JkYTlkMlovd0ZJUzIvSWp3Qy9mRXR1?=
 =?utf-8?B?TWN3NWpQNm9XSk1NRXFiaUs2MDlZcDUzQ1hnd2RxWG1teklHME5HNUFCbi9G?=
 =?utf-8?B?enhwVTg4VTJRWmEySFRGRll5Qk45SUt3cjhrZlhoZDVyVmJzUkxmbWV0OW5W?=
 =?utf-8?B?MVNDWUgyMGFUQjZNcUxvT1FDMkVGdlp3c2N5Q240UktLNDg5ZU1XdDM4K1By?=
 =?utf-8?B?ZHZMelNreUJiNzF6OHFMUmhVSEgvNjYyM0xrRm1zdGI0dGNtQlBMTW9hVHpQ?=
 =?utf-8?B?aGo3THUzSTg3c0Vic09Va1B1dW1RRjVXb2x2R2diWmRsZDN4U1ZGQUhrK013?=
 =?utf-8?Q?5MToIyjMPIU06382vmhe1YM=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11694
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: d7233c63f3964053ac62a5e51097eb18:solidrun,office365_emails,sent,inline:df4c9036803ce3ce0c6c60d122810ee5
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0ba20b19-294f-4196-b957-08de569056aa
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|14060799003|35042699022|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bUZCV1BEMTgrMzlGendHQmJHQXZyekdqbTRkdFg0M05XdlNNTVNucnJRNi9W?=
 =?utf-8?B?Q0tyN0dqeERIeGpZKzhnTlE5bDlwcDdSRlJQWjdwWSt4YUxaOFJjWGlJWk0z?=
 =?utf-8?B?amk2K3Zic28rWDZtZndBVnI3ODNyZlhYdFplb2VLMDRQczd2ZW5JeXdwYkJy?=
 =?utf-8?B?aVJLamZPMEVSUVpFZEttcWQyZjVRd0RYYkpQclhqYjNFNGszL1BKSnFCZDdN?=
 =?utf-8?B?VzJxNTJDOFptb0FySEZSN043T2NRZExDeWxtT01GaTRkaytBM3h3b2VnY29j?=
 =?utf-8?B?S2R3SExuNVNHbEtrNEpNeDRUb3E5b1JyRWxyOHA0bE95R0ZnMGp0UytnWHBy?=
 =?utf-8?B?eVVYZTZ2QTgyS0FUYXVFQXdub2xtcDNMa216WlI0OXNZbEJSNGRUTUVGaWVr?=
 =?utf-8?B?MFZGS3lDaEhFcEQ3cW5jMmw2K2owY3dyYnI3dmpZa09rWkdaK2k0MVRpWTMw?=
 =?utf-8?B?cHB0azhzSUZRQ2NwZEYzdkJoeTcwV1QxOFR6RmVlWHNYaUFVbm0zYVFTTEpT?=
 =?utf-8?B?enBiVThPVDZYSjlNM0hBa3NZQWIvcnhvcU12akNMMks4VndMS3ZCSnpzUkRN?=
 =?utf-8?B?Nm5xeDlQRVlnWGhxTW5FK1RQZHVNRTJqazBrYlZyQkEwUjhQZWRpcGx6b0pL?=
 =?utf-8?B?YkpreXFCY0Erc1Frbmk2aS9UNXVRUTNNc3NMTnZYN3R6cXJQZTcyYzVwNC9w?=
 =?utf-8?B?KytTODVIazdSd3BYYlVubmRhVmdHTFU0RHBNaGR0VXFCQ1lwUDA0ZmIrMVlZ?=
 =?utf-8?B?MUR4N3pzSmZtTjVJeGx6MXRNeVFIY1RXL3B2REV1Ry9BQUxJM2xuNDduZGNU?=
 =?utf-8?B?dFdEZTVGVkdtY0x2dnpURzloeXRUQjYxS09uZ3lkZzRmWVlaTVRIeVA5MFZp?=
 =?utf-8?B?clF2dTdzUnluM0RnelloTDZoWGNWWWtCZjg3UmdPcE0vTVlkckw4TlZwYXl5?=
 =?utf-8?B?UERocUg4YlVOb0JES1NSNzZGQ2hjUGd0Z0xlamlQdWdJRWpGcFkyWXhNK3NF?=
 =?utf-8?B?NGlLTTlRZUg3NnBHOE1jajZFTDRkWHd6Tjgzdk93TmZIbndRQjRzZEllblow?=
 =?utf-8?B?L1VYNXhJV1VDdFo5OVNVOURHbkdmR0JFUjNjUDZ6SExKNnR2N21MbkMxcDgx?=
 =?utf-8?B?ZTdVZnVuSjgrN0dzUUJra3BWS3BIT0YvTXFHSC9UNEpOZS83YzR5Z2JWMW9y?=
 =?utf-8?B?ZjVnZ2Y0UFV2emNRYktyM0tDdEZWNzVmNFk1WTdESFZDV3YrVjFWYzlPbFlM?=
 =?utf-8?B?M0h5TUYxaDM5bWtRMnpMcjh6SGtiQUhMSEQ5c1BYK1VDWkdaUGo5a1ZmbU5H?=
 =?utf-8?B?VlhQR2RXU3Q2TlpqZlU5MFNTUEYxVWxvZ25UeFBiMnoydXBQN3g2U1VhN1Ay?=
 =?utf-8?B?eVlDbmRVZEIvczVSQ1BIK1RJWXFldDNQWk9LdGNweHprUC9NVEhnNXJ2Y3pQ?=
 =?utf-8?B?TmN0K3JyWWV1SDBabXV0Zmh3ZkhCRWFxRFdGYXhLaHJSck81TDJjbXpQSUJo?=
 =?utf-8?B?d0Roa04yVFh5R2gweEthbXdoN0pTNUNoWTZsdk1QSGlhaFhyZTIxZ3pMZ3Q2?=
 =?utf-8?B?WklnT1NWcVA3U0ltYXJESzMzSTBLMHFrOHpDZEcyc3l2ckVsSU9pMVp3VjI4?=
 =?utf-8?B?NklMU2ZTUmhsU01qNjlGeFhBdUg5TG95eWZCeEFLY2FkY2tsc3JNNUs3V1FS?=
 =?utf-8?B?RVpXWWVRZ3JVOWc0dWJrWUYrRjVPYTdkZkE4am5idUNOSlNOTlU5S3hyd2pY?=
 =?utf-8?B?bjQ4djBvYm16aE1qVHQrMXpicE9McmwweXY5d1NucWZod05JL0NIMVhrR0No?=
 =?utf-8?B?UUZsRWxIVUFZNTFaL2RCQVBhbjh4ZHM1T3hPRXd4cVlvWVp1OTBGZEljcHJG?=
 =?utf-8?B?TWlvZFBoT0diSnROMEVTRjRERllpdXIxYW5ZUUJ4a0M3TlRvVitQcGs0Sk9J?=
 =?utf-8?B?ZlJ2bjZpSEpXRkQyL1NVdUYwNDh0VzFXTjFsS3p5Y0xTS29PYW05emtvRWgv?=
 =?utf-8?B?bURTRWsvWnVDM09sbm5SL0dXd21ONFAwT0Z6ZmVLb0FKcjl3MWJuemVjWStk?=
 =?utf-8?B?aVNIdEdVdER3WEVmYWYzdXFOMVR6dytkbkdtckllcDhCTTB2R1JPYTNEQUJW?=
 =?utf-8?B?djRpc0dZVHhmaHE1SGtsQk1vdFNpRXlOc2ZSMnhGQlJsQnRKQ2IxTmJVNEdh?=
 =?utf-8?B?QmoxK1IwV253ak5Lb3NHQ2liTjg3V28rdnJUaHZBenBZSnExSUlia2pydG9F?=
 =?utf-8?B?MTFNR1JwKysvYlMrMDhzVlJTRXZRPT0=?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(14060799003)(35042699022)(36860700013)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 12:51:58.6643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d29eea8b-8e21-4603-5320-08de56905e17
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF0001E9C0.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSKPR04MB11366

imx8mp.dtsi includes a default port@1 node with an empty placeholder
endpoint intended for linking to a dsi bridge or panel.
HummingBoard Pulse mini-hdmi dtsi added and linked hdmi brodge to yet
another endpoint.

This duplicate endpoint can cause dsi_attach to fail.

Remove the duplicate node and link to the one defined in soc dtsi.
Further remove the unnecessary attach-bridge property.

Fixes: 2a222aa2bee9 ("arm64: dts: add description for solidrun imx8mp hummingboard variants")
Signed-off-by Josua Mayer <josua@solid-run.com>
---
 .../dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi    | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi
index 46916ddc0533..0e5f4607c7c1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi
@@ -41,7 +41,7 @@ port@0 {
 				reg = <0>;
 
 				adv7535_from_dsim: endpoint {
-					remote-endpoint = <&dsim_to_adv7535>;
+					remote-endpoint = <&mipi_dsi_out>;
 				};
 			};
 
@@ -71,11 +71,8 @@ &lcdif1 {
 &mipi_dsi {
 	samsung,esc-clock-frequency = <10000000>;
 	status = "okay";
+};
 
-	port@1 {
-		dsim_to_adv7535: endpoint {
-			remote-endpoint = <&adv7535_from_dsim>;
-			attach-bridge;
-		};
-	};
+&mipi_dsi_out {
+	remote-endpoint = <&adv7535_from_dsim>;
 };

-- 
2.43.0


