Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11023089.outbound.protection.outlook.com [52.101.83.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD6228F948
	for <imx@lists.linux.dev>; Sun, 21 Dec 2025 11:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.89
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766316557; cv=fail; b=gXBmZfOqiuYrS3yAxc/InG4NDHEM9ldvR5lY5j+AW6VE4HVxP6RIZ04LbEWh/RPjiS/dvNY/7rjaAybvhYjUHGvWc/Yeg+8kjLyiLiFxu2loHaW4suY1+/gvLE8/CN+kiTYZgK4UVjNoHbsbvnuNjjfo6AZiBZKRN4t+qCG8h9I=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766316557; c=relaxed/simple;
	bh=qK3+bx7+AGHfFAWuQI7DpTJNa0wLW6xNwoxDmL6QCaI=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=FWSF5PnDAHbdh2tAmPEm7Ou4L/um90VkKAXi9u8lygr2eTtUCXXXagSn3DBMFHa408MJ21/77uuTUQ/Axr6u2X5uNSKdpjyQAItfGjT1QOu4Po1DXKCbSeiaqdf4gRQ1OzAhuZz+OcDDDDcPIV4DvvN9gXyigPsksY/+YSDukvY=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=ZxxH6Tnr; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=ZxxH6Tnr; arc=fail smtp.client-ip=52.101.83.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="ZxxH6Tnr";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="ZxxH6Tnr"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=BJsjELeCXb++2c9yhYRNUX8w3Rh/KXycdGxW/b7iQcAD+fW7RqDDNehwmRi7H2JpxQEUIkuC2NMeoutB8ity6DlgcmmRMmQj8gHb2DnNfhDhCwAnQHu1MQxpFCJ8QlY5cfs+5zOGCjDHr2u//5a7lwCg4iOhoHe9ZcQDKZLm4KVmIOfv9I0v7IfEhj3DqtgoCUN9z6tYygt5dJL9GNsXg2aW+LDL1TkoA/3svwzUJjsR/NDrG/lHxr04vg7/NsIfjKcX0Cgl5tzHRjEaMGiNm0+v2joWkju4hhu378P8UIXPiz2+JA8K2rcT3YS+9xohIMH0F3zG3yu9CW/clfsHtw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEHGbe2kI9vEteoKwzdWqIpjEOM2jRP11QL7yBBXA40=;
 b=ZrxPB70VnfeE8iqReAKYw0Hx43vGHeeOYqGgwEHP63ArtQ/luC3c2fD/dcznwuMLk3IDQjBeXXv5NTUVMFXPI/iiTDXvCwGRNM8eERmd3VhG84LSO2a1q+QLEyzYwYqtzuGiX6feBApyf7H4ChfBW22rPJn6qehE1Z1Tse0dZ7N1Jn4JEhvXXfg8ZhzRmzuLfC3VcMWPSdDoaNbXDoAh+XUYtY90WrKSZ0HsOgMZ2sbSbrzCF5QXvpFYdn1ajpHKCNVaynNM0iN+rQyoSwcJXcgXjCD4k9fVqhlOenF3+0MmpA199sMCYPIDZNUo8yPfsu76VhKrGzBk7jRApq0Heg==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEHGbe2kI9vEteoKwzdWqIpjEOM2jRP11QL7yBBXA40=;
 b=ZxxH6TnraM+pIAlh2W6x5P7HK9l2fM/DQLcEArafdq6Ag2ivzfK9fMJzQyk6Izk0OiAtyGV7rd7gW8GZw9jGf9yVHF0UdHLnUTbSbzVfYw2TLswgIGAsbFp9iF34jKSAMALZh6aE5jF1eniQ63hiseBV7SSVFI4MDHDJQ3I9v0w=
Received: from DB3PR06CA0001.eurprd06.prod.outlook.com (2603:10a6:8:1::14) by
 DB9PR04MB9646.eurprd04.prod.outlook.com (2603:10a6:10:30a::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.8; Sun, 21 Dec 2025 11:29:11 +0000
Received: from DB1PEPF00039231.eurprd03.prod.outlook.com
 (2603:10a6:8:1:cafe::3b) by DB3PR06CA0001.outlook.office365.com
 (2603:10a6:8:1::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.10 via Frontend Transport; Sun,
 21 Dec 2025 11:29:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF00039231.mail.protection.outlook.com (10.167.8.104) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.9
 via Frontend Transport; Sun, 21 Dec 2025 11:29:11 +0000
Received: from emails-7063659-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-236.eu-west-1.compute.internal [10.20.5.236])
	by mta-outgoing-dlp-834-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id E0BB67FFB8;
	Sun, 21 Dec 2025 11:29:10 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1766316550; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=WEHGbe2kI9vEteoKwzdWqIpjEOM2jRP11QL7yBBXA40=;
 b=gHB9xVW++Rs/xUFRZ3IDLJXD7bsMxTRq2pb2jas1U41XnEvNjXeLq2GU45FVSiGogxktS
 as3fY4/F7yhPb2PIg0qOVBp5buCLVqMbHVAN4LGzJnPhg4t+EvOWYQDDVqAvG94trnMvwd+
 fEgKDrZY3TuGD42BVzH7anwJ8zvI79A=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1766316550;
 b=qBocO3IgP3lasI15DFHTamvKXPbx8KW7slpgkPtPFQP2/8RrHSyajNUiwa6LuD+UjUQOh
 A6tU1YmFcAyQ+MIsrJUWhXyIcteVwJ0Gfw06P345CYxU8sVdHrkqZoWnQRfNFZ+SQeBumNk
 JnjDSG0oH07W2UadbcZAGsa4uaOktDo=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=An93oEPeRi/7Q1nnZIfZxepV0te8XC3SFYdSp8wtDAns+zneLJGVeutY4QdDEN8i8w9ljVQPiscivC19yBevM6qEAeHcwODd619ZfL5F14NtJB2K538ers9NpFRUcotpOaQLvy8Y6eJoMd79JZrPpkHbw8D9O9nVxc1odo+d7/4Pm9he1GagKb7hpkOgP1YJpcnO6j98ncFolfakpDCwHQGcFV8HZQyUYtjud3yv/gcqzvcTyvcsyDt/jqGRPcADc8zPcLokp8uNp30t7I+Tv/SxuMBh9oUOnM9tbI0R9e9A2R1jABM1Y7eZuRA4Sx98tCDJjEHIkPrTMG692tYP2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEHGbe2kI9vEteoKwzdWqIpjEOM2jRP11QL7yBBXA40=;
 b=WAy1uaKQHZieXdUy8GI7wIsyJb5CK6fLwZcpiMTOFg5Qu2y0DdMad5wa6CyXbsIoOVNB/PTl7aq43tSpSIEnr19xRzCALN7B2fHwbLdEgb4J2P897XPDjdAVW8MZEuXf2yUHcS2vlC3k+pd9PZLxfzzGqNqAIgD1HRLw2/P4v9AR5uLzaqHpdfjqQJErU3nzt93PNzrklrlUMK6rGTmXD05rzzZqJx4moqZF+Bq4qv77bgJcOJ2quMa5UNC0DkOGxYoKAngeEaWJbEz76ZhlMnXCmHPXBimslcgy/P9F/rGib1W9HRkMktWa1QEcJ6y7VwsNYgMbs0IvaH9DrTj35Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEHGbe2kI9vEteoKwzdWqIpjEOM2jRP11QL7yBBXA40=;
 b=ZxxH6TnraM+pIAlh2W6x5P7HK9l2fM/DQLcEArafdq6Ag2ivzfK9fMJzQyk6Izk0OiAtyGV7rd7gW8GZw9jGf9yVHF0UdHLnUTbSbzVfYw2TLswgIGAsbFp9iF34jKSAMALZh6aE5jF1eniQ63hiseBV7SSVFI4MDHDJQ3I9v0w=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by GV1PR04MB11037.eurprd04.prod.outlook.com (2603:10a6:150:212::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Sun, 21 Dec
 2025 11:28:54 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9434.009; Sun, 21 Dec 2025
 11:28:54 +0000
From: Josua Mayer <josua@solid-run.com>
Subject: [PATCH v5 0/7] arm64: dts: add description for solidrun imx8mp
 hummingboard-iiot
Date: Sun, 21 Dec 2025 12:28:49 +0100
Message-Id: <20251221-imx8mp-hb-iiot-v5-0-4a4dad916348@solid-run.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPLZR2kC/23MQW7CMBCF4asgr2vkGcfGYdV7VF3E8ZiM1MTIp
 hEVyt1rkBCIsPyf9L6LKJSZithvLiLTzIXTVMN8bEQ/dNOBJIfaAhUaUGglj2c3HuXgJXM6SYP
 GK+2JOouino6ZIp9v4Nd37YHLKeW/mz/Ddb1Tu1dqBqmkdTo6q83Ogfss6YeDzL/Ttk+juHIzP
 ghQawIrERxqHSi0bUvvCP1EwJrQlfARuqaPJnbuLdE8CFSwIppKGF2FYHsEH1+JZVn+AQjlaod
 5AQAA
X-Change-ID: 20251026-imx8mp-hb-iiot-525b03beea62
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Jon Nettleton <jon@solid-run.com>,
 Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
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
	PAXPR04MB8749:EE_|GV1PR04MB11037:EE_|DB1PEPF00039231:EE_|DB9PR04MB9646:EE_
X-MS-Office365-Filtering-Correlation-Id: f8a5413d-50a8-4461-4643-08de40842995
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|1800799024|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?b01yMGJRZjR1b1pyUkYyK1FHK0diU00vN1dkTW1TZnR0YVU2L2Nrd2pSSjZE?=
 =?utf-8?B?N1JPS2hyVnZmSkVuWTZjZW5aRjF6OCtMK1BlUCtnNE1jM1BkZVZnKzNrb0Ev?=
 =?utf-8?B?cS9QbU1pc1VJS1BQMzNhREtnVlhIeWxySFRET2U5d3NPVWEvRW8rMm9zWUtE?=
 =?utf-8?B?UFJpYlZnczFvZHZRdGdRMXd5QktDZlBZMDBKNnVWTDQ0c1p5VFZFZVdMQ1lU?=
 =?utf-8?B?TkZMRnBwdzNsYWJSWmlrczFwWk1GUWdjWGVFU2MybXcwZjc5NjlzT2pIZ01s?=
 =?utf-8?B?eHpOVUFsK2NVY2FjUlp4VGZiWHQvNTJDY0Vpbkd5NDNLemYyb09OemRZOTV6?=
 =?utf-8?B?eU4xR0ZqZnBCbWR2L0JwV1B1Y2tKa0VCdUx1YS92WXpXRnNucUgxRHBWV0Ju?=
 =?utf-8?B?bHpOZnFNWHJHNmh3L2MzV2tLZEdOaXFnVTN6ZVhCeW1XbnlqZjgvTmd5TmtN?=
 =?utf-8?B?T1liTFR3NlU4dGFxNHlEN1QxN0JReHJWb2lsZjJoSkdFU2M4WGVDaHAyWmZW?=
 =?utf-8?B?SVl6eHFzS2NCVGRuTE9BVWFTTEJHeVBWcUgzU296WDhMbUFxTStEUFJ2eXQ0?=
 =?utf-8?B?S0dmeHU1RmZndEErSytlNVd0VS9ibGxYSm12U1FMTi9TRGZLdEwrMlljdlJR?=
 =?utf-8?B?bjZ5QnNxVGNmcEJqN2xlcjlWZm1JMjNEcU5FRzBpOU43RUlTRmVOdCtFNGlE?=
 =?utf-8?B?L3ZRUVpyQlYvS3lkRHVWK0tjUUlBSzgzc1JwZWNTVUtVZXJmaG5rK09JQjVH?=
 =?utf-8?B?RTY0VEJmRHRKQUM4NVpaOW9TblZ4YVRlUDlpTUpNbG1LVGQzRHlGS0RZM2lH?=
 =?utf-8?B?RVVpRXNpZVZkaFFWRVprQ1FWU1lMTERvT21CRWNlVk5ReEJyYms4TVFUN0lh?=
 =?utf-8?B?djZHenFTY1lXQ05sVXVHUWRMalBSaTBUcmJaUTkyaVB6RHpKeEJQZkFiWUpH?=
 =?utf-8?B?QmxuTmpyaytMWlpsNzdCd0wwT2pBTW1DRmVuNUZ5M0NlbHVhK0IrUEpuajFp?=
 =?utf-8?B?R21Ra3NnY0JRQk1tcW1td0d6Y3ljN1BHYTFuVW03ZWhaQSs1YlVBYnQ3NUJW?=
 =?utf-8?B?a2lqeUpWY2gvcTRJUnNScFVDRUpnTW41TXBIM1A4MVBudXJWZXozMmF6azlI?=
 =?utf-8?B?clRHL1JjNDRKT0libUpOS0FJbWNKMjNrM2F4UmIvcFRwR2NlWWxDby9PVUtk?=
 =?utf-8?B?Y0w1N0UwQVNnRHJBemJFb3YyeTVLUDdNd2R6NHNWbUZYQ0RUb25Pem5samhn?=
 =?utf-8?B?NDBBaTdRdkdJSGNQbzdVc3VmeGpzYzhTUnVrVXZEdUtsc3M4QnJPYUVzWGZ4?=
 =?utf-8?B?S3ZnNHBlQnNRMm45dllvS2w5WENDSUx6LzJGek4rVllSa3FrK0FSSzZkMlg3?=
 =?utf-8?B?OHZ5MllIN3pBQXpLZDlkckR5TlY1aVlJZHFDWHUvSEVHbDkvRWRFRW1ENHVT?=
 =?utf-8?B?RndHUFBzVWNiMnBMZkc3WHRKWGQva05pYUVZZVZMT29iNGEraGFSUjFIMlhK?=
 =?utf-8?B?SVFvVzZxVEJLYWc4QklwRmdJNjdmaHg5S2tLb2M2SlQ2ZjNDdGlMWVlXaFp1?=
 =?utf-8?B?M3plSGE2bnhKRVVhaTRqbXBkVUIwRkNxOWlnTTg0Tkk4cERsdWxITXpxclI3?=
 =?utf-8?B?ZUZHQXZZbDZWalNmaXdnK1hhWUFxQVRBMjdzUk4xQk9Sb0JTd01ETzRxSDhE?=
 =?utf-8?B?VVJDdXdmVlRQNHozQ1FZdmtBTjBwNm9QRVFwOUc4SnR4SVVhNWhPS3FGdjJy?=
 =?utf-8?B?djB1dmpmUXhTNVFxa2VPVHl2bkZlRnNWU0NYL1p5UnZSbUNmWnp3RkR2UEVt?=
 =?utf-8?B?c2VuU0RVMVpKYmxqMTRFcC9rWHFiZU54WWQ5Vkp1Vkh6VUxLNGtWRDlkMmJw?=
 =?utf-8?B?UE00d2IzTG03V3dVQ0MrYThnVUVyRlZzUUkxM3BKTjk0SGhkMzFLdmNVd1FR?=
 =?utf-8?B?NzJreHdjS0ErZ3FJUTdKbFJMZjA3QWhtWENEZXhMNEp2QThrRjZwRHAwR0J6?=
 =?utf-8?B?R3A3eDAxVXJLSFNyeGQzTzhualJxaVo5SlI4bis4aWdSSnpNSVpWSEJOalRN?=
 =?utf-8?Q?e/7LR8?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB11037
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 107e751b98a74eb48a6f6340b75a2f74:solidrun,office365_emails,sent,inline:35e54c167aa7ed56355d1a669f216403
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	91f47252-6d5b-488b-4b9f-08de40841fa1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|376014|7416014|82310400026|1800799024|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K1hueU41bEtpcFVYOXdoUURTcGNGQjZJQmZkUGZqYk95TlI3NGlSOENubDY2?=
 =?utf-8?B?SlZ2ckFLR0JXNDZ2UGxMdzhMaUZPTHZ2UFVsTlAxeFlENXM2d2dGKytRd254?=
 =?utf-8?B?UWVvWmgyNk1kTDVXK0E3N2xyUmQ2TTV4OEhZTnVFaTc2b000TVFvcGJqWUM3?=
 =?utf-8?B?SnFnTGFyUm5DcnlLRU5semtWdUhvRmEzM2lVQ3JDV2JnZFZORjl3WE0rcFJH?=
 =?utf-8?B?NDEwS0xpMS9UYk1jSE1sYko0KzVpSU1teURUREQ3Nm1IZVNYcFdzdHpuZVpH?=
 =?utf-8?B?N0dXZDVZVjRaditXaDdDRkZ4by92YjgyRnQ4aTlIVVhSYmJGZlFoUEZmeXlw?=
 =?utf-8?B?YUJqR3dZdHp3TkxraE1zdmNETWh0cWlqWUtLTkV1d1RMY1VLTzhHSHAwRDlw?=
 =?utf-8?B?Ym9JNWs1SVYzS211ODREVUhNS3Y5bHM1dmlaYWFYK0l3VC9DRDAvL3NSWHVC?=
 =?utf-8?B?U3UzY3NHSUVLOG1BWFZROUtVTGpMOW1PYnZ5NjAvZjNuVHRjT1JpYkZtK1ZL?=
 =?utf-8?B?cVhnYnZwL1M4VmtnRFVQayt1aFlCTFZPSkw4RDduTkpBaXhEWmVnSXozMjBw?=
 =?utf-8?B?UlhFZ3dxbVRpQWJYelFwKzk1NmQ1K3h4VWVrdlBab2VYcmVJREhPUE5EbFlH?=
 =?utf-8?B?WE1NTklDK0FnQlJsZmNkQlRBaStGMldaVzFoM1Zjd1REU3BkcW0vQjFCUnlC?=
 =?utf-8?B?bExnNUN4dTNLYVFWM2JBQ2lNQmp3N0RaQ3BBQ2F4TXlNYkFCZmlHKzd6OFNY?=
 =?utf-8?B?VkZvNC80RGNCMDl6b0hjelhXR25WSEdwaXEzSVdQNFp0bXRxMkUySEhaUmFu?=
 =?utf-8?B?K1J1YVRRM0FrYkZxaSs0eWZEOWhzUEdDaXMxYXRZZ3F6L3pTWkJWc3FTby9U?=
 =?utf-8?B?OWFBM3Q4TThJdlZXa3ZFWExWeWNHcTlOSjVUT29nbncwRWhRS09iWEhZY1Zy?=
 =?utf-8?B?cEs5bHZ5aDNxenFYbTRQaVZVRjh5WDB4MG9xSXZuNFl4ZFY1MnNPVE4yMHpI?=
 =?utf-8?B?QnNKUGcrd2tsMXlIZFVTWHJDSzl2YmJ3UklnTU1HL2NWVUR2UWh2ZGZsS3lM?=
 =?utf-8?B?N1ZkZFlsa1dSNTd6ckdndkVTVXBFZEFLMWs2Smdwc25TVS8rLzNkVThWVURu?=
 =?utf-8?B?SXh6MVZvUXlxZ0EvLzhuZHFRMUtGYnhOWFdZMGJOdlI3NmRwZ0pMeUordHF0?=
 =?utf-8?B?ZEYxL1JFZjE1aE1MQnc0TXdKSXlQWDVtSWwxZlN6dGlkVjg1NUJBQ2t5Sm83?=
 =?utf-8?B?WjNsN3J5UEdQak5UZVZzQlExODhLTjBmR2d3R3BWZW5ucHpIZDZ1Nk1VNnJp?=
 =?utf-8?B?ZU40MlBCZUN6WVhVYk9lditaa0pwam1uc0pIanhQQ3FXYzNOOURpVklYaXpI?=
 =?utf-8?B?b1E0MktkSmFVUWdqdkNTdVRIWU1ncWNZVkNlSlMyZFRKdUlBRGxHamRPTlJz?=
 =?utf-8?B?d1dCNEd0Z3NZaGZkNjNUaklKZjRmYWtXMDBnbTg3RFdqV2JQaEtVLzFPL1BV?=
 =?utf-8?B?RW01NG1rTExtd3lYcklNUzBqcEJYQmwwRHdOdmRPMmZVeGUyb2JDWE9GZDBJ?=
 =?utf-8?B?Q2FuVzZnVmpnd09VSnN0WlhUSkNmS2tnUzlwV3ZrcDhiTFM4MHVQbEZWYXFq?=
 =?utf-8?B?NkFXMWtGeURNNG9qc1FuVTJpZ2lPaXVvY3RXNXVKVWRBaGJVb0lZMUFhVzNE?=
 =?utf-8?B?QVZQV2VnN1ZhUEVZWGxrSFowNHJFR0V6OVc4enVLbTdIS1pscGlRVGNDM205?=
 =?utf-8?B?MlMwYnZ5U2ZIbE40TWdkSXh0bi9FT3V4cU11YitxR3VxYmpIK3VOcEM0MkxT?=
 =?utf-8?B?TEVmYVhHcTVKclpZM0dkemloaTVMY29kbTZleVZYaUxSaXk5TkFPOVBmZHhG?=
 =?utf-8?B?OFYyeDk3TzNOYmNXRmN3dXVUMDFBa24xckV5R1VvQkR2Uzl0ZjJacEhRZkdE?=
 =?utf-8?B?MHZaMW1IU2t0MjhDU3plQVhGYUVWdmZMQVlnQW5JSWZiRzhOaEJDcGd1T2w3?=
 =?utf-8?B?S01NYWRZaW45cWdYb2oyMVhTUStROGJCK0kzSTdUYnAyeDcxOVpVeHRLRmx6?=
 =?utf-8?B?bjR4RllFd3p0OE9GTjJGbWM5bEJnK1kwVnFDL3IwUENTSjhtenltWE1ENE9u?=
 =?utf-8?Q?g9AE=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(35042699022)(376014)(7416014)(82310400026)(1800799024)(36860700013)(14060799003);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2025 11:29:11.0259
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f8a5413d-50a8-4461-4643-08de40842995
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00039231.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9646

This patchset mainly adds description for 3 SolidRun boards:
- i.MX8MP Hummingboard IIoT
- SolidSense N8 Compact
- i.MX8MM Hummingboard Ripple

This includes dt bindings and a range of bug-fixes:

- dt bindings for the boards
- fix to dsi panel bindings referncing panel-common and adding port
  property
- cosmetic fix to some  solidrun imx8mp boards for regulator gpio
   polarity
- fix dsi hdmi bridge on hummingboard pulse
- compile dtbs with symbols to support overlays
- gpiod_set_value _can_sleep conversion for panel and touchscreen
   drivers

Open Questions:

- How to describe HX3 USB-2.0/3.0 Hub placed on a USB-2.0-only Bus
  (affects imx8mm-hummingboard-ripple.dts)
- Is "description for" implied not only on dt-bindings patches, but also
  dts? E.g. is this commit subject acceptable?:
  "arm64: dts: add solidrun solidsense-n8 board"

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
Changes in v5:
- rebased on v6.19-rc1
- dropped ilitek-ts patch already picked into input-next
- solidsense-n8 / imx8mm-sr-som: drop untested wake-on-lan support
- hb-iiot: disable software unsupported rtc timer irq
- hb-iiot: fix wrong pins selected for uart4
- Link to v4: https://lore.kernel.org/r/20251201-imx8mp-hb-iiot-v4-0-53a4cd6c21bf@solid-run.com

Changes in v4:
- dropped patches already picked into drm-misc-next
- ronbo panel: picked up reviewed-by tag
  (Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>)
- ilitek-ts: changed mdelay calls on reset path to fsleep
  (Note Dmitry requested msleep/usleep_range)
  (Reported-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>)
- changed hummingboard-iiot tpm irq type to level
- Link to v3: https://lore.kernel.org/r/20251117-imx8mp-hb-iiot-v3-0-bf1a4cf5fa8e@solid-run.com

Changes in v3:
- sinmplified language in gpiod_can_sleep patches.
  (Reported-By: Frank Li <Frank.li@nxp.com>)
- collected ack on winstar lvds panel binding
  (Acked-by: Conor Dooley <conor.dooley@microchip.com>)
- Link to v2: https://lore.kernel.org/r/20251107-imx8mp-hb-iiot-v2-0-d8233ded999e@solid-run.com

Changes in v2:
- fix spelling mistakes in commit descriptions.
- remove redundant "binding for" from subject:
  https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst
  (Reported-by: Krzysztof Kozlowski <krzk@kernel.org>)
- remove one useless comment from imx8mm-sr-som.dtsi to fix long line
  warning.
- change ronbo panel binding to inherit panel-common and switch
  additionalProperties to unevaluatedProperties.
  (Reported-by: Krzysztof Kozlowski <krzk@kernel.org>)
- add dt binding for winstar lvds panel
- fix dtbs_check for dsi & lvds panel addons
- change n8 board dts comment-style in header
- collected ack on solidrun boards bindings patch (patch 1 in the series)
  (Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>)
- added standard led label property to hb-iiot multi-purpose leds
  ensuring consistent names in case lp5562 driver starts using it.
- Link to v1: https://lore.kernel.org/r/20251027-imx8mp-hb-iiot-v1-0-683f86357818@solid-run.com

---
Josua Mayer (7):
      dt-bindings: arm: fsl: Add various solidrun i.mx8m boards
      arm64: dts: imx8mp-hummingboard-pulse/cubox-m: fix vmmc gpio polarity
      arm64: dts: imx8mp-hummingboard-pulse: fix mini-hdmi dsi port reference
      arm64: dts: imx8mp-sr-som: build dtbs with symbols for overlay support
      arm64: dts: add description for solidrun imx8mp hummingboard-iiot
      arm64: dts: add description for solidrun solidsense-n8 board
      arm64: dts: add description for solidrun i.mx8mm som and evb

 Documentation/devicetree/bindings/arm/fsl.yaml     |   9 +
 arch/arm64/boot/dts/freescale/Makefile             |  15 +
 .../dts/freescale/imx8mm-hummingboard-ripple.dts   | 335 ++++++++
 arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi   | 394 ++++++++++
 .../dts/freescale/imx8mn-solidsense-n8-compact.dts | 851 +++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts   |   2 +-
 ...hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso |  69 ++
 ...ummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso | 105 +++
 .../imx8mp-hummingboard-iiot-rs485-a.dtso          |  18 +
 .../imx8mp-hummingboard-iiot-rs485-b.dtso          |  18 +
 .../dts/freescale/imx8mp-hummingboard-iiot.dts     | 719 +++++++++++++++++
 .../imx8mp-hummingboard-pulse-common.dtsi          |   2 +-
 .../imx8mp-hummingboard-pulse-mini-hdmi.dtsi       |  11 +-
 13 files changed, 2539 insertions(+), 9 deletions(-)
---
base-commit: 0f54ecdab3be8e6161f42980617d2d9677095999
change-id: 20251026-imx8mp-hb-iiot-525b03beea62

Best regards,
-- 
Josua Mayer <josua@solid-run.com>


