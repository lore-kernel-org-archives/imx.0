Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023087.outbound.protection.outlook.com [52.101.72.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD4432ED22
	for <imx@lists.linux.dev>; Sun, 18 Jan 2026 12:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.87
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768740729; cv=fail; b=ksHezkBd+XSOb0jA2lHuppSRqejzJgsQQmNlhVJUbz3hpbNXe+T+dp6gT8+ZRxE9Fm9FLgv063HdzeUPvNgWpKTBTXVLTs/zCsCr/HwgSOo8WXNAlgmukQ4BIElYbLuPkVAEXZpeowTcevLkKNAkcF9lFDWZFPRP+65RUknNQx0=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768740729; c=relaxed/simple;
	bh=Jrbd7ULBInohKep5JefO3fozinJrB7Ecjz6JhETYXSE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ipws3LVU1hVVwuNJ7r3GkAHGtMav8z7LbrdXSHKxOaLCu0GJDI74efSB6/6RgswzBCFQPeONQ/ZyLSI9zIRUdbCXOQR/06E+OqIQ33qYmTmzwu+2esyNx45L9IOKym+FsgFac1CsqpQGNn15Mkyftk027HrTBUPTa7cWaJG6Ao8=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=NCSEhaeR; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=NCSEhaeR; arc=fail smtp.client-ip=52.101.72.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="NCSEhaeR";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="NCSEhaeR"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=k4Qn54dgQ2QBPBf3BQ0Mkofmn/GdzPn6s+8/OQ30pvja4wq4jY++iAqKURU5hjkEHSLn0Sz9UU0J9GWjz30PO+nkaC69xGGqF9O442NwYafxTiURPXsEGRiSSG/zwy4FWa++Or+82HWAmrwi/TuF5Zl3Vq1Z0dc4FEWH3qXDZx3Vjfqgh0qNS0SBIqEgo0nQyjr98hEksNjeW5MT1ILWyzF+GcFORgFfnY4kp9sUyo/OGjpZap9egRUnvwBkCbkJLtuyh8EFJTF6d2nUr0xmNno2ahMyu9CZ1pq+YF3q6R+mAhLdoq8mrCyTs8yDPgKO6pJpy9sDDiaR9RshRedjcg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1R1fdP5W7XsnKjefPXKWORZ8diwS0wpO/ImQAr0lS44=;
 b=F7sbrej8bdDa/tI/ZTbyfG1TehDibXzjmYxxodP5yonFWl+yCyoSmgf05MXPXjV3zEVKLNTmgMDgW7qQDondJ0gnDx1rGST+fSUVMUtF9XbFlG/IgATSqKUwhyJvTBNEpqiRUrSFZA8VkkUxukI+2ZQOTcWuZscT2VZLG1/IU7YUYJzFWWjg/Re0e5JHfvYDLgHnFKEC0fgd4BdEPbbyBwsSk4+3TIfxkyC+G2/kE++IYz5OFPMNCleaeicPcLh2N9l503cWWWsPLv5vYeiOYavvkE8MzPXYuulyYeSTkN7V41LXGnkuYzb2VHU4Syn0SIRwMds9qxsbxA8N8GwznA==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1R1fdP5W7XsnKjefPXKWORZ8diwS0wpO/ImQAr0lS44=;
 b=NCSEhaeRa1eA8pNRdxp3P33PMj1GSQ3dqdHxMsGDUND5yfAY/WUM1BT/Sv9q1EIFjH/73ACpyBvFB8RpuYYnihim51jG7brB8UdrqP1ZOslUBDP5bE7XlnWNvn4w5DI9mUL6CmYaq/w57yLkY/lqawwVfy7vVlJGS9evGE5VPuY=
Received: from AS4P191CA0005.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:5d5::15)
 by VI1PR04MB7118.eurprd04.prod.outlook.com (2603:10a6:800:127::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Sun, 18 Jan
 2026 12:52:02 +0000
Received: from AM2PEPF0001C70E.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d5:cafe::bc) by AS4P191CA0005.outlook.office365.com
 (2603:10a6:20b:5d5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.10 via Frontend Transport; Sun,
 18 Jan 2026 12:51:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AM2PEPF0001C70E.mail.protection.outlook.com (10.167.16.202) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4
 via Frontend Transport; Sun, 18 Jan 2026 12:52:01 +0000
Received: from emails-2206837-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-10.eu-west-1.compute.internal [10.20.6.10])
	by mta-outgoing-dlp-141-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 6A8567FF4C;
	Sun, 18 Jan 2026 12:52:01 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1768740721; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=1R1fdP5W7XsnKjefPXKWORZ8diwS0wpO/ImQAr0lS44=;
 b=SI8+te666YVCg6C/2h2dpta22SxD9nE10y3r3b5JYX0YSFRExd4gseK66sWrB+DEgGkTw
 2a16CmFoyYmp5ZwlkJCWHW/mFp4iqHTQ/jm3a1xaRqudZrn+rKJgZeiZCJFUCNK5PY135yR
 FKGIg45Xdj2zuf5BO+/ZU3Wz9EKWbpQ=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1768740721;
 b=RfOL4D5S5lH/YgcJZxrIXbrojbIxCFcfpZrhZ1/uU3OEUYTaYQICu55M9tYMyihZW6VKj
 Z/OA+8kzPmXA7UXjOyLhc19W1H80CA0brwifSfRGitscsFT4YQmNMXkpmkPRK53EzSAZvfh
 yF9Xn0dFeMSa8Yjq4WWc+4UfOF2uBFk=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BU/8bURdbdtGBHRrMjY4be+YQW2uv9/MEvqkfpfh8g2CYYuupxrk9GNMNg9I5+CA/9D/QuJUHlB/vuEfvLQQWRHXoxBXA92YQTLCLuAfDYsyC5w3ZbRUARgHUSROVkpcpbjTn1JVKHa+KG/Yk/fvz0BrMMqNCzcKPwFNg2tUFVB3RZbNNVbKTxl8AEO5JXcIv/CJOFV00/8okmwLBd+dc2jGTMucj3HwIulgbdYCPEzlVxvt0+gkU4HWdAFl+KKE3ztDbUj9zwqILEkSjYlJcXTXeCaaBEaSRcQvGGj9/Ja11NDSxYeCcosRDCcSvh9n7Y59HSMZZ/j/xDDi8H1i4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1R1fdP5W7XsnKjefPXKWORZ8diwS0wpO/ImQAr0lS44=;
 b=NXw8MdPPOhYSyJJ5qYkIZLkylQA+3UFdyk4jiPPupc3lbd6zzvfUzxWILRtrbHME+98KGc4zNOtgNRZNgxUGDwnr/CnRaKAdkhjo05i8dvcMGHX0hoq62gI1y+9nMTxg5BLFdzJ0A8lK/lmbjsyyDzfdJQShpiaI1zPxdG/fP4thkpJvd8ehAVYIotY0R+Prbt4sEevqZWxFTMs2aY51UVan+Pst1XXm48njNt+3S6EqFLbRnkTh3fDdILmK+w7qjigRk5Lar6xWiWq+YBurH0btK2DRcdiY1E3Z/7D92hv4/NMlSwYPpDS5T1ULHHPaoQTySCFfgqqUmFMqdF2wCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1R1fdP5W7XsnKjefPXKWORZ8diwS0wpO/ImQAr0lS44=;
 b=NCSEhaeRa1eA8pNRdxp3P33PMj1GSQ3dqdHxMsGDUND5yfAY/WUM1BT/Sv9q1EIFjH/73ACpyBvFB8RpuYYnihim51jG7brB8UdrqP1ZOslUBDP5bE7XlnWNvn4w5DI9mUL6CmYaq/w57yLkY/lqawwVfy7vVlJGS9evGE5VPuY=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DB9PR04MB11694.eurprd04.prod.outlook.com (2603:10a6:10:60f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Sun, 18 Jan
 2026 12:51:49 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9520.005; Sun, 18 Jan 2026
 12:51:49 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 18 Jan 2026 14:51:43 +0200
Subject: [PATCH v7 6/8] arm64: dts: imx8mp-hummingboard-iiot: add dt
 overlays for muxable ports
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-imx8mp-hb-iiot-v7-6-ef1176119a8e@solid-run.com>
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
	PAXPR04MB8749:EE_|DB9PR04MB11694:EE_|AM2PEPF0001C70E:EE_|VI1PR04MB7118:EE_
X-MS-Office365-Filtering-Correlation-Id: 284f3580-ba4a-49d8-9ea5-08de56905fef
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?cFBBUzNUdHlMSUQ2UDc3WHpCMm0xMzU5SkEySGszNUZVT3dkOG5Vc2szWnU1?=
 =?utf-8?B?TEVTOEhTeE9XeHBCY3BtdWhWcGNRaXBSQjhDVE41ZWlMNE56RUJJamtkUHRC?=
 =?utf-8?B?VmtMVlNGMkpxQVJzTWNrVSthM0haR0ZTSHE2c3I1eStpOTNwZ3ZnMm1WaTI0?=
 =?utf-8?B?Ykh6dkgzWE9qVWJ0ZDhOZy9xZWd1SEZXMkYyL2dDcU95Qzdiek1OeXFaNHBr?=
 =?utf-8?B?aDI0RmV4dS9kSXQzRWt4amtyZjFxbVFROG9EM25pUTl2cDZqbldvYndiTWpF?=
 =?utf-8?B?dDBZWjkwL1ErVWJwbzFEKzByVnVjWjcyaTVWdDY3YWN4dFUwN3lkeS9oN1hz?=
 =?utf-8?B?L2lQUUQzZmc0Wmx2S0ZuSDYxSW14bkJYTDZ2c3VDb2pzTEJGOUp0Q3A3M2pR?=
 =?utf-8?B?Q3Y3RWR2Ti9PZXlFY0o4WmQ0TENCQ1MzTWhPRmYrdlQwczBDUHEySWV6TU9y?=
 =?utf-8?B?WmJZMDBUQkRwL0p1bVpraWgrbWUzZDhwSFI1cG52TTFIY2U0bkQ4SDV6clEx?=
 =?utf-8?B?bm1wcVJQYzNsNHRpQkJscTdQb3ZqTE44ZlJBZlFBM2JGZW1CY2VWcXRCQVNB?=
 =?utf-8?B?OGJRR0gvaGZ1WXZZYklONFh5Sno1UkhFQnQwTnVnRDVqVWdmcCtVeVBlUVUx?=
 =?utf-8?B?cXpuN0c1VzNjdUhubkNSQ0lEUXk5bnljbzYzUTVDdllPU0pxcGVLb2NnLzlT?=
 =?utf-8?B?dVNuWWhOQ3hRMmQ4YUpNZVdYdlVQNUhreVord2o4Y0Nid2JJSzhkVG9tSU5Y?=
 =?utf-8?B?S3JFVGFyNVplMnp1eGVhUmt3ODRuSEVFekZyQlVPaXlYWXluT2JMeUVRNXZD?=
 =?utf-8?B?NlpDa3NRdmIvTGYrVXVyb01KQ0VJNTlweUgrTHU0V25Ra1JkTVhTOUthOVVG?=
 =?utf-8?B?K1ZtdjM4UkQwZEhKQitGOGV3OGoyd0Qydnl4b0k1c3M0MHQ1VlRmaXllLzh6?=
 =?utf-8?B?ZWhoZ3ZwMzh6OUJXVjh1dXc2MG9tdTNSbGZBa3pPZlh1OFRRS2xzVXhPSFh6?=
 =?utf-8?B?V2RpK1cvdGszbTdSaTNXdkE2ditZd1RTQnowWlJwMzlOUXNScEthSHpRZWhh?=
 =?utf-8?B?Smd4YUJkbXJjdVpMSTR3UFdmb3N2Tm9DWDlVb1RaeXd2aTNuVDVMTkFkQ1hK?=
 =?utf-8?B?MWtuLy83RWVDR1lMbUlCenpKMXhCQlp6SFJTUGpYUmhqekRBaGlTUUxVWnRI?=
 =?utf-8?B?cm81c0NvOFQvVlBGZmFnM0VaYlJseVNnSlZ2Mkd0QW5udDZBR1F2NTJlL21k?=
 =?utf-8?B?SWZHR09PbTYzNTBFQ1dTUElxR25BVGRsejUrU2ZKckJjbHI2QitHKzZkUkdw?=
 =?utf-8?B?TzhRWm9vQWhIR2IwYWlDUjVkYUp4YlJmQnIxR2N4VmZ3WDlXczFFRmw2bnQx?=
 =?utf-8?B?eC9jZXV6NGJieGphYzRIS2Vxeml0T1RQZGJLMEJrL0swWEJ0TzQxQ255YzU1?=
 =?utf-8?B?SEhkRFNMSW9jRlpoUm0xWlpPL1lmVVBOTnE0dXpqZHhWL2dYclc1WjRYOXQx?=
 =?utf-8?B?ZFF4UDVhYjN3TjB4VnltRkpLT0JsZmhQWXpNL1M3c1lXVGJjcExUc3YvNElM?=
 =?utf-8?B?UXlxS2tDcVZ4REg3VTlRV3E4S0pBWTZVTEFLejNsR3NOYWhUOFgwKy9sOVBF?=
 =?utf-8?B?bWFKNG9wQlliZ1hnSmY2elEwUW9laFNnNkY1b1hLS01NejhBdXRWREgzaWgr?=
 =?utf-8?B?QkF2aXM1WUEzNXFPUGRlWElUSGEwbnBuUFRxeE85TVJhMDN6bmtuQ3ozV0F1?=
 =?utf-8?B?VnNGelVEOW9FQldHcGN4TmoxYzBIQW5ZWjFweFdIMCtoQ3ZjcGxZUm1KYVlZ?=
 =?utf-8?B?eS9xcURnS0pFUHB0S0tvd043NUY0VDBacFhvSTBJdGo5OHNTYTZxYVRvYWV0?=
 =?utf-8?B?Q0NnNC9nQnNRQW1YOGRGWnNTZ0k4OWw4RzI2aE5QYm9ab3p4NXR2d0F2RHNw?=
 =?utf-8?B?U3ljcG1abVhkQzNHWS9xVGZzOTJZcjN4dlN0eFZIZ1hCd3dwcXRqT1haelNx?=
 =?utf-8?B?Y1lCNzNFTUZORmFDZ1JNb0l6cVBWaFlGcHVFL2VoK0dRdHZuMVJvbGMzUmhq?=
 =?utf-8?B?cEVNc2ZFSm5ONDlDSzdNZ3g2MVZjSTBOVG1YTGpvTDh1dXVvZXdjWjVHaDRB?=
 =?utf-8?B?RUpkVGxpL1hkZjBWT0wwTFBucTNkWndrZDBxanpieVFaZHNFYkFqcVJaQkk3?=
 =?utf-8?Q?eVb0ki8E6XOERE71AfF7eCQ=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11694
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 5305db9c489e4621ba95eb9b8d8e8504:solidrun,office365_emails,sent,inline:df4c9036803ce3ce0c6c60d122810ee5
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM2PEPF0001C70E.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6ef34363-ad1c-43d3-049d-08de569058a1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|14060799003|36860700013|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SzZsT09MQjhQNTVKSG9Zd2ZycFlGc0lCa1VuWDZiTGtUY3J2UmxtaVdVYTJi?=
 =?utf-8?B?SzNyUXgxZ1BDeUN6ZlZHRHNLeXg4ZitnNFY3Uklka2xxZ1BMblRESUVjRUxs?=
 =?utf-8?B?ZWgwRWFqY0toNlAwRkNWNnVqditmYVBtMFA0eklCQk5LbkRiOU5VV0VjMGcx?=
 =?utf-8?B?VHVRTnQ1VWFYZlBJZTBBMVVPaEhIYjNINmxIQUdwUW5kU3NBc0lRWWl3Vmlv?=
 =?utf-8?B?b1pkY2w2eW96NjMzNDFJUzFBSVJOZ3hsL2Q5RCthREFLamRnaFNRRi9CbTBD?=
 =?utf-8?B?WG9zVk93Y04rQ2VRV2Jteklsc0UrMXBFaElVd0NWc0lIMitJVGpsaWJsQWRB?=
 =?utf-8?B?eGpLV2tvMlk4YSs0RUcwQk9YYitFR3VBQ3VqWmpvNFo5aEdzR3FMVXZ3Y2Nm?=
 =?utf-8?B?eVNMc1prOEg4cUtGSllQcDBycjB4UGY2Y2dUak5vYTNNazRmbW5TYWNBVnFz?=
 =?utf-8?B?cWlFdXVMME8waGliTnNCV3VDVDFXbTBkRytlc1Q5T25ody94SEh1dEJGYnRQ?=
 =?utf-8?B?MXFIb0RHUTU4a3kvVndHOGJ2dXVHTzRDUXozdHdZWEhLb253cjNkei9Ddkl2?=
 =?utf-8?B?Yms4REhHM2M5amN0S25SNTJtU0hTRExnUzVad0E2UmQ5clVCeFZBOUlsZ2FG?=
 =?utf-8?B?dGZyZXNKRVRHVk1OQURiOXk4aFhxMld2REt4SU1TWEFKcWRpS0UwL1F2amMy?=
 =?utf-8?B?QWU1SVJJc3RBWnc2c1NCUm5PMW5WeXRKRkpTVncwSkdsV1IvRm1seGZCS0o0?=
 =?utf-8?B?bFM5VFJJQ2FkaHRTWmdTL3o2SGczazdhN0FZQW9xUWNYcWtuQVo1QjlpQm5m?=
 =?utf-8?B?OVNkZDFDam1MNUJjclNOQjJ3cE1uMFVGNTlYdUFWWThBTEt4OXRwdjdJNjhu?=
 =?utf-8?B?U2JUWGlHWDhyVFUyemdyL29WaWxSL3lFcnNOWk5IRURUUVJDeDdSbEk0RmNz?=
 =?utf-8?B?R1diM3VrNnQrVW93OXNlTUh6bmVqSk0xUDFPdlBZSHI2ZE5ZK3VvUUd4aTJM?=
 =?utf-8?B?T2tHd1B5UzBHb3ZpT0dOZ3J3SDNBWFJ0V3ZvQXVTR1gzWTZYR08wQXo3aEhy?=
 =?utf-8?B?OXFKc3RhVGhPRDNmZE5ReHFyeTNmN2hER0FUQ1Q0RVlNRGFORG12NGpvSXRL?=
 =?utf-8?B?M3JjOGZXeXpZRjhaVHQ1RHNCbTZaeTZ0S0g3WmpCYWQ4M2U4ZVhYb0RNZUxT?=
 =?utf-8?B?RTY0Q3F5cElRK2oyREM2Zy9pbnBUYUZrcGVQZ2Z2bERmMitQUG5pUXZ3UG11?=
 =?utf-8?B?cWg3dVp5S011dEhnTmg2VXp3UU5PUnlxR291eDd1bU82c01oenk3c2lMdlVP?=
 =?utf-8?B?NUVxdnBQbEs1UXB0Qkt4RmZTaXdQUllaRWdnZnZoV3ZEbHEzcmM2ZnJVdVo1?=
 =?utf-8?B?Mmk3VjVKZWxrd1hPOHBDVnBxYTBHS3o3Q2hkTDlJdGs4bFlnQjd0V2IrOEoz?=
 =?utf-8?B?cG1KMjR5LzFDVWZvUUVVU0pmN05POVpLVk9iRkpFQ2UvKzhFeWxIZ3o2ZUly?=
 =?utf-8?B?TW1MYk9WSHhjbFZaeFUwU1hLMkJZQVpVY2phVWc1dG1idzZLSUpDRUMrMC8z?=
 =?utf-8?B?UEJvbitDQ0hwZzZqUFAwYUdKbXlleUxibnQwamdla3ZkWWwzRWE2cERnRTRX?=
 =?utf-8?B?L3cyRVVDbTB2SXRESDVNUWVsRDNXREd5M0tLMDNsVjBSR1BXeWNNTzNVOS9m?=
 =?utf-8?B?OERXQUdOTVRTcGdvZ3p1RHNIKzUrSWVlVnR4ZnRibkRXYm9xc3lJTVh3QVlT?=
 =?utf-8?B?ZHEwUHAwZ2ZqQy9pSWRHS2F6NzJzc21MZFl5QzAyZzRHZU8rREFURDlsRkVR?=
 =?utf-8?B?NHF4MDYwYTZ4UGllVW5wTGtjb0NjZ1VQLzdnb3RtY1JpVUpNUXdtenl1cVJ6?=
 =?utf-8?B?Q3FyN0RldjZObTE2RnZvUW5oU3VtVlRCTVVjQThpTHF6cDNKVXhCRzU2WjdS?=
 =?utf-8?B?UFZtL0V5ZzBxY0pBRGJWZ2FZKzZlclViNGlVbGtjQ2pVaW0rcjNPYit4ajVm?=
 =?utf-8?B?d2lyY2t6dkVRU0V5ckxGZEJJNlhUTUNVYkhnaFZXbE1yNnFqM1ZhTlI2eWNo?=
 =?utf-8?B?VWhuN0ZueGZXNFRzKzhjVTI0M0xOYk5PcGNtSytVb05MS1lkc29kQjFiVHBn?=
 =?utf-8?B?MkhxY0kzazFmRHBLUnYzMFZWV0xUSXNRekxDU3N5SnhTMmppamp4SmNFemVD?=
 =?utf-8?B?elVUNVQrOVdYL0tpZWVScUZZT2lKcXZjcTM4QjJkc3k4bzdCbXcxTEZhb2ZC?=
 =?utf-8?B?VHNSaE8vVDVkZGIwRHlnNEdRRXF3PT0=?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(14060799003)(36860700013)(35042699022)(1800799024);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 12:52:01.6996
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 284f3580-ba4a-49d8-9ea5-08de56905fef
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C70E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7118

The SolidRun i.MX8MP HummingBoard IIoT has a variety of conectors, and
configurable ports:

- 2x RS232
- 2x RS485
- DSI Panel Connector
- LVDS Panel Connector

RS232 and RS485 each share a single UART from the SoC via a mux, which
are configured from the base dts for RS232 by default.

Provide addons for:

1. Reconfigure UART A from RS232 to RS485.
2. Reconfigure UART B from RS232 to RS485.
3. Configure DSI Connector for Winstar WJ70N3TYJHMNG0 Panel.
4. Configure LVDS Connector for Winstar WF70A8SYJHLNGA Panel.

A variation of the base dtb is generated for each addon to ensure that
make dtbs_check covers the resulting dtb, and applying overlay is
tested during build.

It is however expected that bootloader should apply any combination of
addons based on runtime configuration.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |  12 +++
 ...hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso |  69 ++++++++++++++
 ...ummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso | 105 +++++++++++++++++++++
 .../imx8mp-hummingboard-iiot-rs485-a.dtso          |  18 ++++
 .../imx8mp-hummingboard-iiot-rs485-b.dtso          |  18 ++++
 5 files changed, 222 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 80fb5bf084b3..0027b29b4c35 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -215,6 +215,18 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-edm-g-wb.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot.dtb
 DTC_FLAGS_imx8mp-hummingboard-iiot := -@
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
+imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0-dtbs += imx8mp-hummingboard-iiot.dtb imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo
+imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA-dtbs += imx8mp-hummingboard-iiot.dtb imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-rs485-a.dtbo
+imx8mp-hummingboard-iiot-rs485-a-dtbs += imx8mp-hummingboard-iiot.dtb imx8mp-hummingboard-iiot-rs485-a.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-rs485-a.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-rs485-b.dtbo
+imx8mp-hummingboard-iiot-rs485-b-dtbs += imx8mp-hummingboard-iiot.dtb imx8mp-hummingboard-iiot-rs485-b.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-rs485-b.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-mate.dtb
 DTC_FLAGS_imx8mp-hummingboard-mate := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pro.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso
new file mode 100644
index 000000000000..e66ee2ce69d8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtso
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT MIPI-DSI connector
+ * with Winstar WJ70N3TYJHMNG0 panel.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	dsi_backlight: dsi-backlight {
+		compatible = "gpio-backlight";
+		gpios = <&tca6408_u48 3 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&i2c_dsi {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili2130";
+		reg = <0x41>;
+		reset-gpios = <&tca6408_u48 6 GPIO_ACTIVE_LOW>;
+		interrupts-extended = <&tca6416_u21 13 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&lcdif1 {
+	status = "okay";
+};
+
+&mipi_dsi {
+	samsung,esc-clock-frequency = <10000000>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	panel@0 {
+		/* This is a Winstar panel, but the ronbo panel uses same controls. */
+		compatible = "ronbo,rb070d30";
+		reg = <0>;
+		vcc-lcd-supply = <&reg_dsi_panel>;
+		power-gpios = <&tca6408_u48 2 GPIO_ACTIVE_HIGH>;
+		/* reset is active-low but driver inverts it internally */
+		reset-gpios = <&tca6408_u48 1 GPIO_ACTIVE_HIGH>;
+		updn-gpios = <&tca6408_u48 5 GPIO_ACTIVE_HIGH>;
+		shlr-gpios = <&tca6408_u48 4 GPIO_ACTIVE_LOW>;
+		backlight = <&dsi_backlight>;
+
+		port {
+			panel_from_dsim: endpoint {
+				remote-endpoint = <&dsim_to_panel>;
+			};
+		};
+	};
+
+	port@1 {
+		dsim_to_panel: endpoint {
+			remote-endpoint = <&panel_from_dsim>;
+			data-lanes = <1 2 3 4>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso
new file mode 100644
index 000000000000..f8fb7fd0e4e4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-panel-lvds-WF70A8SYJHLNGA.dtso
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT LVDS connector
+ * with Winstar WF70A8SYJHLNGA panel.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	lvds_backlight: lvds-backlight {
+		compatible = "gpio-backlight";
+		gpios = <&tca6408_u37 3 GPIO_ACTIVE_LOW>;
+	};
+
+	panel-lvds {
+		compatible = "winstar,wf70a8syjhlnga", "panel-lvds";
+		backlight = <&lvds_backlight>;
+		power-supply = <&reg_dsi_panel>;
+		enable-gpios = <&tca6408_u37 2 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&tca6408_u37 1 GPIO_ACTIVE_HIGH>;
+		data-mapping = "vesa-24";
+		width-mm = <154>;
+		height-mm = <86>;
+
+		panel-timing {
+			/*
+			 * Note: NXP BSP hard-codes 74MHz clock in ldb driver:
+			 * drivers/gpu/drm/imx/imx8mp-ldb.c
+			 * SolidRun BSP carries patch.
+			 */
+			clock-frequency = <49500000>;
+			hactive = <1024>;
+			vactive = <600>;
+			hfront-porch = <40>;
+			hback-porch = <144>;
+			hsync-len = <104>;
+			hsync-active = <0>;
+			vfront-porch = <3>;
+			vback-porch = <11>;
+			vsync-len = <10>;
+			vsync-active = <1>;
+			de-active = <1>;
+		};
+
+		port {
+			panel_from_lvds: endpoint {
+				remote-endpoint = <&lvds_ch0_out>;
+			};
+		};
+	};
+};
+
+&i2c_lvds {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili2130";
+		reg = <0x41>;
+		reset-gpios = <&tca6408_u37 6 GPIO_ACTIVE_LOW>;
+		interrupts-extended = <&tca6416_u21 13 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+
+		port@1 {
+			lvds_ch0_out: endpoint {
+				remote-endpoint = <&panel_from_lvds>;
+			};
+		};
+	};
+};
+
+&tca6408_u37 {
+	lvds-lr-hog {
+		gpio-hog;
+		gpios = <4 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "lvds-l/r";
+	};
+
+	lvds-ud-hog {
+		gpio-hog;
+		gpios = <5 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "lvds-u/d";
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-a.dtso b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-a.dtso
new file mode 100644
index 000000000000..7bbf800b78fb
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-a.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT on-board RS485 Port A on connector J5004.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&uart3_rs_232_485_mux {
+	/* select rs485 */
+	idle-state = <1>;
+};
+
+&uart3 {
+	linux,rs485-enabled-at-boot-time;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-b.dtso b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-b.dtso
new file mode 100644
index 000000000000..d4bfea886ad1
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-iiot-rs485-b.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ *
+ * Overlay for enabling HummingBoard IIoT on-board RS485 Port B on connector J5004.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&uart4_rs_232_485_mux {
+	/* select rs485 */
+	idle-state = <1>;
+};
+
+&uart4 {
+	linux,rs485-enabled-at-boot-time;
+};

-- 
2.43.0


