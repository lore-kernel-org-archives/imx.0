Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2059.outbound.protection.outlook.com [40.107.247.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BB1224B1F
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 13:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734613849; cv=fail; b=F4qQnUSvBh27U9ow0zu+pmDlmXs0cNpwlnzXFMO900QqEa/N1UNWiEFiPLPua17qyLrxu/F8rz8M6d9Zep8NKefNJtwPglnSWbQxPf99O6kDYFIWQ1jNqXwhUk9cCUv2mrDKMIyV4k05uRAn7akqfoVi+jTzn1y6qKFzzQgapcQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734613849; c=relaxed/simple;
	bh=fKJZ0yRZJBhdcBIvBo7tIoRZVSYpM761/9nDtOzAdpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eqIQmG+Scdd9M4CBdk0+WY7eAIjdMkwt/mTL2VRqsHn+qfjgQ3Q/BCXEVa5DbmBT4CM7UICemIJ3aF91FObwbDh2soDWRq1L1TefWOZ2Ikv0FtK7hwXQaHbzUFAJsME5DqpXZ4TKYXlVxF0ry0sKSGFQLGn39VZ5+2JlcZRfAUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Xvz7Cfst; arc=fail smtp.client-ip=40.107.247.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Xvz7Cfst"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NKrojv7Rki81ocbfnmEiElzrQfXqlGJ7aMkxh8iBXchKgYUlG5OQEUFSIU/2+lF1DXnq5BLxbi1WcQLvjCO3m3CKuV7RLhBYmL06LmiI/4i+GfknF334Ak6mmM04kiPYCz9ExbWcIEJc+2nUkcuKBvfFYxkB32Sibq0ubVlSZQO5DYtoBedavzB5MOj0jBMCVzndF34n+1jT8mAF5uO9Xk45K99BfuQSCxZsEYU/VjUOHHwBsJF/oXr5eRwLVvTh/9fJa+g8yVJTl559u5K4w+OuEkHbs6h1djRkhkx0wBm2bfUWo/Lnv7tDWC/cQUb+hA78jYJ2vDwu7RyUtUs0bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkNB8LywE7M88QDtjZgOzjmkSZR4KFRF9D1R1Fvu8ZA=;
 b=Myyw8v1gutltVaZTcgfnTIUTN9weYhy7lEbUAc9I/Y+82vTLx80hhGJGlCiiLCxlD8ObZf/7bOw8eB/zqki75jPzZstUITo++iTXH423irjuCYQijbkjKRlQi82m2XB+C51HvAdmOS2Yb6PUBvHDUvNg+PZdQFXKbun4qLa2zcUQlQPS0Tqp/9wBoJsPpHavnIF9Cuvvz27KkiCpNEeEOnfAMfwH2F3KPY7RVlOPIGe+ZBDjaYWkzCA3tq0CxEfd3Drpw/wJe6gVX7dnFtVz6SK8Ah0d60W7Pahp/OnYMNm4KDAzdC3JnNuhOFXW3EkujV5pSPONmNNhwapCqQMfxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkNB8LywE7M88QDtjZgOzjmkSZR4KFRF9D1R1Fvu8ZA=;
 b=Xvz7Cfst8tBIZmH1gz6C9LgV3cH9Wo4v+Yxjfii2rDyE2Z6Ggl7Ojd4moUaOyivkm/WCQFLvi7q3bmvJJC7KdakyzNC6HxoxrcqfPKSFn2TibiMGUlKturd/BmW+/XeMIfCTGXdXBF+VBHCJSSIS7wEo+ov1PqblzUINV0jManWp4q2m6VpY5nJK1XOdDh1aRoJRG3nfuNEyQg+d2VhSCjJCGo7EJ9ZcVmbRO6Tbvzah5ioXyf+Zqddge2x2sh/CiSj9fPyjiL1uDRw0g2l5AKAUcG34rYhYA1hts7nmAI12rjOp0p9wv601wX6EP2PujZD7zTdBOPA0D4ZkPfkiqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0SPRMB0099.eurprd04.prod.outlook.com (2603:10a6:10:47e::21)
 by VE1PR04MB7278.eurprd04.prod.outlook.com (2603:10a6:800:1b1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 13:10:42 +0000
Received: from DU0SPRMB0099.eurprd04.prod.outlook.com
 ([fe80::81f7:ab08:594d:c11a]) by DU0SPRMB0099.eurprd04.prod.outlook.com
 ([fe80::81f7:ab08:594d:c11a%4]) with mapi id 15.20.8251.015; Thu, 19 Dec 2024
 13:10:41 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v3 3/4] arm64: dts: s32g: include necessary 'EVB/RDB' common board dtsi
Date: Thu, 19 Dec 2024 15:10:28 +0200
Message-ID: <20241219131029.1139720-4-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241219131029.1139720-1-ciprianmarian.costea@oss.nxp.com>
References: <20241219131029.1139720-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR04CA0047.eurprd04.prod.outlook.com
 (2603:10a6:208:1::24) To DU0SPRMB0099.eurprd04.prod.outlook.com
 (2603:10a6:10:47e::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0SPRMB0099:EE_|VE1PR04MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: b5988501-6ff0-4d90-831c-08dd202e894a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MXNPVVhDR3Q3T3p1eitwRThDWWo5eGUxZ3VwdXZhRmhSSWQxaTBuMitrbnpt?=
 =?utf-8?B?UlB2NWRvMFlDSndFL0RTc0lUU2hpTUdycDRFNWl3cm9EWkoybzdBMzRwcXhC?=
 =?utf-8?B?QkJmOHFiS2k4ekRqREI4eThXc0lTcGdnWDhPczM5UDM1TW8rdnR6ME1Ua21n?=
 =?utf-8?B?VGVFTmFWWmtHNVdVNExqYjRnR0h5QjJUaGU5NTVaS0Q3L0NGUkR2cnFwWndE?=
 =?utf-8?B?U2VTUTN4TDZHMnRwa3ZLNzlLckJwcTg2ZXZmT3VBU1ZFRHU1aGxDWEVTWkx6?=
 =?utf-8?B?V2d6NTZzVUx6TnRCcmVqbFhFWGloYXd4U0gwNGMvU1doTEZ4Ykk1c0thYi9H?=
 =?utf-8?B?Z3M4U2w3Rk15cmJscVd6dUEzOTNka0MvLzd2dGhYUUIyR1o5QVM1NWF4b2JQ?=
 =?utf-8?B?djloL2RaQzZtem9jN2tjKzB0dVJRSDhEVzdTUnFCeDZkWnV2MDI3aW9BUE5j?=
 =?utf-8?B?V0tUTkhFQUhKU2lRNk5PbGJvNURPM3U5SnVqYUxRaldkdFF5S3ZKMnJ1bm0w?=
 =?utf-8?B?cllPMzZKRElja0N0aTZPTzc4RW4xZFcvOS9VcWpnSW1LZGo4RkFPcjZPWnpn?=
 =?utf-8?B?V29WbU1QeUF2QmZyaHphTWNvak5WV3VTM3UwaHpDNVpRS2wvelBVeGlKSmx6?=
 =?utf-8?B?MXZQc05ZV0E5cTRzVDh4MWptck8vUE4ybDZTdXVqK2cvYmIzRkRndU9TOERP?=
 =?utf-8?B?ZHZVT3h6cFFoZEZYcGFEMWJHZG45OWJuL1FSM2lCQitZcllsTzQzUUJxOS9H?=
 =?utf-8?B?dGxzYnhTcEdjdHlQTXBvWmFiSGtyNy9BcXQvazlqQ0lrblFRd3VCQnZjb3or?=
 =?utf-8?B?UzB6SU9EblhWQ1lZWGVUUXY3dFgwK1VwWjZqbG1jc2E0dDZ2b0hUcjdSY2Ur?=
 =?utf-8?B?Qm05d24vZWhMNllZNWpLcVZNUzdibDU1YmVIdWg1UWpnTURIVkl0VXFnT3dF?=
 =?utf-8?B?M0NCbTJHVkxwdEJiUkIwSzV2RTh1MGQrQjM3U3NmbkFrRnpoVEhndXVaZTAw?=
 =?utf-8?B?bVNYbDQ4WXNiTVl3bVpCeGdoc3dVTmNRQVVPYnkrdjRDT0VwQ2gwNTByNzVY?=
 =?utf-8?B?V1pwUG1FWkl5KzlBZ0UwVFpVV3QrWm9SRDRtVEMrTzFYMlpnaGI5dVlMU0xV?=
 =?utf-8?B?ZWMvTGkzSEthR09YLy9MUmIyeDVJczVZSUNQL25QL1lSRDFmSndEZHNKR0VS?=
 =?utf-8?B?RGlTaXNpK2t5UUJ0QmtLajJqdm96UWRlVGJKd0YyTFVvbSsvQm5jWUIrZ3U1?=
 =?utf-8?B?S0xnMWhPbGt4SzA5ZWJxOU9Oc3h6SWdycmFyNDZEc3ZPa3pTNXpGSzlKam1L?=
 =?utf-8?B?dUZQMTNjWWRlWFBkaG9jT0FKNU54N3plR2pZUUpVbDRmdnZWOTN5U3BEUDk5?=
 =?utf-8?B?ZTFrLzkxWmZEZXNBNWRydlNZT1NIQkdnYktLQVRDMmo1dUtlOGVMVjhKTGov?=
 =?utf-8?B?WHBLMFUrU0d3ODVwMnV6eTlwdE9JY1QvTEszNWs5RTRnVTNna1F0K3BJMXZy?=
 =?utf-8?B?TTExSDdUVWtvRVFia3pvb3RWbnZtQzRCc0krZHhrcFBQSmtMcnkvd1pxcFR1?=
 =?utf-8?B?eW1XUU1KWlU5QW1WVXVUL3VXK0J3U3FhM3NFbnA4Z0dGTnA2NzF0WHFYcFV2?=
 =?utf-8?B?cjFKbDBQWHI3TkhwOEJVenhBN2ZYRUhGejFtZUdmTmhaSUJ4SjJpalFaRHVO?=
 =?utf-8?B?VVpzbVl5RGRjbnQvZ1M5RURaUFhsUFpxTjRzSHhlVVdJYmxPVVNOWWN2UHpR?=
 =?utf-8?B?OVNzb3BCMkVSNlg0ZThPOE12bTdTdG92RjJNcThQeldsejRhbUtrOVI1TVND?=
 =?utf-8?B?TnFHN3U2ZXZaL01aWVNzWnExUzQ0Ull6OVZ5TmRPRnloaC9qZFE1NXI0c1dt?=
 =?utf-8?Q?YTXWMaNMtEN8r?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0SPRMB0099.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0pqbjlmZDI0aDN1YjFQL2YyOHN3bmkzdWpTdUhPMU5lam44aVUzQmtrSWYy?=
 =?utf-8?B?blhyczY0WlJYVWdPZ2FibHd4aFNDL2VmRkN5WTgzcWtHTjBwbEVGbmhoc2x2?=
 =?utf-8?B?R3h3Y3FMSTB4blZtSUFoTFBaZXF4Z1kwZ0lmZEV4OU5LVEJPZTltUFQrTWRm?=
 =?utf-8?B?Y2tqRGViQkd4WU9rMnA4YUpORUp0VWM3NEtWaUx0K3VwTDFUa0pIVGo3Smts?=
 =?utf-8?B?MS9ac05hMkdtY3l2aTB5T2l2QmlNVEZMWHZ5NUcyaHAvaitiZ0JIY0tDR1pT?=
 =?utf-8?B?c3I1UlVFQjJJU1FpeEtqS1loY0pDdklXTXJBbjVWaE9NTVUvcHRNSlJZMDRW?=
 =?utf-8?B?b0lJeWhPWjB5dHhGOEpnSWhWNFg3MVl2R1ZKdXNSelIzYkxVK2FyTnJnK1ZH?=
 =?utf-8?B?d2VIdjlndnM4czBlb3QrMC8yNjBKZngzbG5uTUUzTGNGMEI1QXQ3TWg5TGJm?=
 =?utf-8?B?cFlhbFJJOVY1N1ZoeFVUa1hUMkppSXcvRUpFaU9CdjVWVGdBd3J4NlhFc0Vy?=
 =?utf-8?B?SVBvdFlxOUpLVXdzS2R5aVcxTXRrWnMvMitPODViUmkwVndUN1NiTlVPQ2ZH?=
 =?utf-8?B?bmtRN3ZPUHdIOUhlb2g4MjBad3psdEZTTlZJUldRUzhmdUNmalJObFF5aWlt?=
 =?utf-8?B?WXFCY3VSU2dDem8wSnBDcm0rMHhZSkJQUmNuTCs3b1Z4QnlRZmNWUFBGMXBj?=
 =?utf-8?B?WXpyNnh5OThDNG5veFkrcUI4ai9sczdMKzQ2czBlUndDUGpMUVhIM2VBdHl0?=
 =?utf-8?B?QmE4VHYvcCtyYkdheDc5M1dpR2NQQUJESnRERHFZTTd0dWpmd1JXQnYvTXVS?=
 =?utf-8?B?RzNGc0FZelVndVZScjRCUGQ5SDNvdExVWUpoZjFnUjNEYmQvNW05UDAvNzJT?=
 =?utf-8?B?Mzh1RmhjVy9NTnBTUnd5SXRoRnQ1ODRSQnZiOGRDTHhZaWpCQVFPVWVHMEJI?=
 =?utf-8?B?QjFzOVlNd3p6cmZaZnNmNzQvZW9sdG1mZkhNcmtadXM2K3RrV3lxRm5JUWky?=
 =?utf-8?B?V0l4ZGZWZEpFS3J4RVFSSHk1RVE5SVhTMTlNSWpDYlJUSk85ZkJ4dnpWODIz?=
 =?utf-8?B?S25xbjdwdnZDbWthRk42UHdLNGNQWXJMWEhiZzEwVElSRnphMHlnMWxBbi9m?=
 =?utf-8?B?M0JaRDZpUlRYdDR5dzFlbUZ0Q0wrbWxVeUJObnYrN1dPZVNHWXdsU3hVaE42?=
 =?utf-8?B?M2FNb29mbHhOT3ZmRWZUN0ZmN2lscUpuYm1FSlJqRFBjWThyd2Zzd0h6a1Zp?=
 =?utf-8?B?c1d1WFduN1NZSVFOVXplSFg5UHlHTXhWMGVjRW16SDlDenFHRjE5UmZqTnh4?=
 =?utf-8?B?SnVUOUhsUHFtVjVUNUlFTUZwVFR6czV1dFVzK3JjM2p5NVc1Y0ZOOFVCL21y?=
 =?utf-8?B?VHlVTC9ZQnQvVko1VFRYSnhXbnB5UDBCM3dMSGlGMHp3V0RaYjJvTlQ2b0xo?=
 =?utf-8?B?RlNHU0c2NzQ2NElGWU4wVFJoUXg5ZVZDY2VkSnhrdVBqK0tGYlkwZTViS3hV?=
 =?utf-8?B?YXB4eXNyZHc5WWRLTWFrbzBUOThXZkY4TXphOUtRZHpmNWZXdk5aSUVlOHVq?=
 =?utf-8?B?dmZYQlFHdDZnUUJqSUxlb0xDemF3aEx1L3NjRVBBODVyUFZNTHRxd3RLYzZo?=
 =?utf-8?B?WWVmc2plN0UxZE1DOG8wZ1ZvaFBWZ3V6c1lQVzlUZmJtc0xGTTJGN2g2Z2xk?=
 =?utf-8?B?ZWloWXJuYnRhMm9jVnluZXBkWWxPVU9KWitEMVREQkNvNFY5Rmg1UVg1Wjh4?=
 =?utf-8?B?VXlwalMxd2dla3FUOFhYTTYyUE1CTndRR1FycHQvUysvcG9sM1NhSDRIOElF?=
 =?utf-8?B?UVBQRlZMcjRUZTNGSkV5aGlxREYzc1RLNjVoemFDV2grdjVrdGQ4QXpQQkxW?=
 =?utf-8?B?bmQ1YUtzYVJnWmNtanU2U3ZLSmlkZWsvRjd4TG9mbDlkZU44S01EaHRLbTJl?=
 =?utf-8?B?Q0tsL0wvZTJwbGcrZUxHTzgzaUlqSFkzd3VNSHh5aTJoNGhPREIyaTg3WWh5?=
 =?utf-8?B?bFRHYUt6SlYvTk4xNjIwanhKVHppblhUNTdXSGFzT3pWQnZLcndxSURVNGtZ?=
 =?utf-8?B?eTcwckd0UElnNlRibDIybURnSXErcEl2NEJneEFqRDlxbDZ6eEZXWklKLzlY?=
 =?utf-8?B?aS9RVGc4KzFrS0tHSjNWZDJETXZOWHJ3RVBBNjhraTJ5UTIxRmpjUEhRUWxC?=
 =?utf-8?B?Znc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5988501-6ff0-4d90-831c-08dd202e894a
X-MS-Exchange-CrossTenant-AuthSource: DU0SPRMB0099.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 13:10:40.1855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8t6Z3TSFFscKbrMm6bZd3gTfjOpZA0SsWWbS/bd2tIooGrTJsCVnn0m7Zc0D0A4CGYPzzYn5xw5fkryaVVFoQRAjD+l8N1fIek4LPS+Lapc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7278

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

After the 'S32G2/S32G3' common 'EVB' and 'RDB' dtsi support addition,
include the necessary header depending on board flavour.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g274a-evb.dts  | 1 +
 arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts | 1 +
 arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g274a-evb.dts b/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
index b9a119eea2b7..c4a195dd67bf 100644
--- a/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
+++ b/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "s32g2.dtsi"
+#include "s32gxxxa-evb.dtsi"
 
 / {
 	model = "NXP S32G2 Evaluation Board (S32G-VNP-EVB)";
diff --git a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
index aaa61a8ad0da..b5ba51696f43 100644
--- a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
+++ b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "s32g2.dtsi"
+#include "s32gxxxa-rdb.dtsi"
 
 / {
 	model = "NXP S32G2 Reference Design Board 2 (S32G-VNP-RDB2)";
diff --git a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
index 828e353455b5..94f531be4017 100644
--- a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
+++ b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 
 #include "s32g3.dtsi"
+#include "s32gxxxa-rdb.dtsi"
 
 / {
 	model = "NXP S32G3 Reference Design Board 3 (S32G-VNP-RDB3)";
-- 
2.45.2

