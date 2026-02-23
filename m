Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013035.outbound.protection.outlook.com [40.107.201.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E124436EAAE
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 19:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771875184; cv=fail; b=gLy/0XPlR8c7GNoZEObty0d4auhPi1/N0YMftHNHEPkY8m02vHOH7p48daISW3Ig/WdQ5I/3sEMTUjJK/LVurjF5V9T2q+bg6TSsv6A79ixFFD4Y5sG1gzQ7bTMKcHpP+7zrWTQ4yhZXSPZWljwlAcNoWgba6A4pRdO0QoKDEK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771875184; c=relaxed/simple;
	bh=Gl7RkaPogIO/JVuSV2kdOVkA9WxlOu6M0rUtUO5hBmM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=GPGvNOEoe4vO/L/SkCF3RyZBkuqqfr9vqkLxjucG6LZz0LDJK/kfGb5yfObjqxOXNMqRpb66UZKzt721c9tRC40mnrI8Kj4BburJtUUeNoYkcHkFRt72sL0hAVb3393giaZoYj4JGVfhIoNcgD2yJDfiSI1epMFWkgK5XxUwQYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=0Uw39fN/; arc=fail smtp.client-ip=40.107.201.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="0Uw39fN/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RCvWl4PVkgUMOQrB7M+5utsMkY7ILDLkIY7sAP2LJ/73DxGyfY48yjUM+Yrcm32bKBEt0+gVAbOIWexmxJiTJwMpKOooFla/DAhNKhEU+KMD0X5Dtqk4gRBo0pkn07EIebgYTeMMWZwktIRKgodoVXBsG8UgJiMnusRHUNBKSY+zReWZmF7iIyoVOUyx5aLdaYLoZXtI7JPav5c4oryPzuBaD2so3R8O5d8IPZ3+EUmUYtmYyoPNSwkFDXTK4g5YnSontw0b5YEQajTc2x6Gyh2peo11DuuJg2CNDDNJ83/DwcWzhDtsyTinB5dcrvlZWAjCVrmLyPUluKMFX0smvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gl7RkaPogIO/JVuSV2kdOVkA9WxlOu6M0rUtUO5hBmM=;
 b=ycSyv6sgTdXffD3SM8CsTDsGaKRXJ9QlS9gGugA/E7loKQ9Reds7oNUf8WZsfd/TXIBNPBuYZDwfPPYixfyIw68ZPYZ8wmzguZiU1AKq7t13BlPTRS7HZzYetuErL5WCrgVp0Wbi421zLvw5lKfcf11ZgfAcA9TgLRznD92AWKSQcIyfc26SLgwoqpM+9RXy6JllhmFqs9SjT12MVDvr92I3ewklKRXtlOYem81Ib2UBmYPCdKYO2DVmwHb++5FzRK8P55E9ZmDxCG+SEk2Ny+N0anG0e0M9Ua2ltX9ItG23vc0kI46oQiPWdXWYg9R48lyzvdOyRrRBSgof66cMmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gl7RkaPogIO/JVuSV2kdOVkA9WxlOu6M0rUtUO5hBmM=;
 b=0Uw39fN/6xt0EvH+Y7eeXTo3QOrgj0TzcpXE/2UEIh8r+9or7lKUQryrHx/fHb9Hb00cYKFmdHodAA5lO+tqUusVygl5xBR938O82CsS1gUDnpepK0BlfKqKso9mDmDkk+AjEbd9AD54PbWbsVhQz96H/V8PKa8tQqnTwPKfqUhIFMURz/LRn11w1vwCFvHLDvGTsOONUhoN0NAjrPFKOsh837tlO9DZR5JcrXPiPdLRUF65CS3vsRMbnlLbsC06m4XnCj/GAGPD58aGt3RbiVP3Hu7kf1+FebkaRXzYy1rx7htIOY5lQUQsur8elXt5DBrtDfjKyC5ppm+nIJyzkQ==
Received: from DS4PPF990BCE628.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::3d) by BL1PR11MB5255.namprd11.prod.outlook.com
 (2603:10b6:208:31a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 19:32:58 +0000
Received: from DS4PPF990BCE628.namprd11.prod.outlook.com
 ([fe80::8506:9081:db3b:1669]) by DS4PPF990BCE628.namprd11.prod.outlook.com
 ([fe80::8506:9081:db3b:1669%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 19:32:58 +0000
From: <Conor.Dooley@microchip.com>
To: <Frank.Li@nxp.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
	<kernel@pengutronix.de>, <festevam@gmail.com>, <nathan@kernel.org>,
	<nsc@kernel.org>
CC: <imx@lists.linux.dev>
Subject: Re: (subset)(test, ignore it) [PATCH v3 0/9] arm64: dts: imx8m*: misc
 update
Thread-Topic: (subset)(test, ignore it) [PATCH v3 0/9] arm64: dts: imx8m*:
 misc update
Thread-Index: AQHcpPs2WODbDqYayE6Bk4S4gO3KBg==
Date: Mon, 23 Feb 2026 19:32:57 +0000
Message-ID: <e7bc7121-d5f4-4031-9c5e-0987a21cb369@microchip.com>
References: <20260118-misc_dts-v3-0-d3564716cbf6@nxp.com>
 <177186899738.395969.14983394502364609399.b4-ty@nxp.com>
In-Reply-To: <177186899738.395969.14983394502364609399.b4-ty@nxp.com>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPF990BCE628:EE_|BL1PR11MB5255:EE_
x-ms-office365-filtering-correlation-id: bb2a1d5b-8f21-4693-169b-08de73125937
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003|38070700021|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?eWZVRGtmcEVCVEw5a2taaWc0cHhsRXhQaldiSGZ5ekMwTHdMS2tYK1lab3I3?=
 =?utf-8?B?OXlvb21NakV6Ri8wQk9FQ3NtUWFia0E2WHBOZXFVMlJnRWNWenUxbUQxVUtS?=
 =?utf-8?B?U0NySzlQOFRITXNreGVMQW1FZXhRUnVFK0dyMktYNndVMW03ZkpocWYvV0xF?=
 =?utf-8?B?WUJ2VitDakNWdVBkYVhzWGNlc1U4RSszOHcyZkhZQVAxczcyVURJai81M0pj?=
 =?utf-8?B?N1dNb0VZRG00cUFjcGpSbHpkZVBnNHRFbW1rcWt4azJyaElJdlFoY2pGOWNm?=
 =?utf-8?B?azVxUGY1ajA1MkZkNy9WdWpTL3RwM0hpNzFhdHJUK08rRERHUm5rRTBnQi84?=
 =?utf-8?B?UXRKV25uMEltOWMyMVVMRGEwZDY2cEc5b1BlSFQ1N0JFSXI2bGY1RVpCb0R0?=
 =?utf-8?B?emFLTmxlY3JVdVpUSStXMHozcnNIM0J5dnN4c1g1RUJ2eVhMY2RKSDlzbXdl?=
 =?utf-8?B?ajgyTVhoWjUvWlpkWXFwN0QxZXpXbzgyU0E5SVE1OElFRmgvOHlzZ0dVajlL?=
 =?utf-8?B?S1RpVjNGUGxsNXM4SlRJRDVEWXNjbVBwVSs3VktreGVrd215M3cxSU9SQ21O?=
 =?utf-8?B?aGcvQVY2V3VhUWtyWHhGcEowam5ZTG9NM3BkZndoTkVicmtrNitneXpwejlM?=
 =?utf-8?B?SkplZVVPOXBhTmU0UW9aMWhRM1FTUTdDQ2svUEtsNVhINTFKbE5GaGN4RzhI?=
 =?utf-8?B?QWVLQjJSQWUrTURTREFYdjdUSVdERVB1cmdYZlhjc1RuWDR4a3phZ2g5cHdX?=
 =?utf-8?B?N3kwK1Y1akE0Q0hQSmZrQnVieWJDRW9MOVZ0NDNxVnRFU3RIMEtTbUJ5NUFF?=
 =?utf-8?B?UWVJQlExREVnUkdWc05xbzE1bVlna0l5RWhtWU10MFdlUXJ3dTd5NUNON0NQ?=
 =?utf-8?B?SVNjME1pS3Rqd3M0ZDZML2h4dnN4UlpFRHBibE51WkpQZWthekFFbkxZNkhx?=
 =?utf-8?B?YzVibm1tSXRqYk9vYnJrRWVJeUtLNnp0MmJnSXFLMnBFcU1nMEFjUmF5azlm?=
 =?utf-8?B?R241TnpwSmdCcVIvbFFmU0l3d3BUZFRBOHVxQXJISDJxNXlIWFU1bGNMeS9h?=
 =?utf-8?B?VXkvc2x5Z2J6QTFyTEpMUktXVit1MGI0TzdvVXU0RWJxWUZQcjJESG9JNktB?=
 =?utf-8?B?WXVOZGlxL1hrbWVCcmVid1hXWlY3Z3Z0M0NiQXZINEs2eHVDeXNCQkFFSUpo?=
 =?utf-8?B?ejFyU1c5eGNtZ0F6cUVNS3M1c3A4M1UxWFpma0VFOElIYSs4dGhDbUhTSE9P?=
 =?utf-8?B?NjhPN0ZDM2czTzBBcnRiTHRUL2tDLzNoWjQ3MHJqbnUwaWZmZHd6emdWSFdN?=
 =?utf-8?B?S0tRemxkSjFLR1VLbXUxcjdGS04xa3dWcHFobmxKSkNKRkwwNVlwNFlqa0Mx?=
 =?utf-8?B?QlRBZ09Bc1FxcmJSY25CMjBRM3FhclBKYzRHbVVQRmtUREVZVjJsYzZMa1N2?=
 =?utf-8?B?Tjl1NHYxRkQwL1RlY0w3Q0JJZmVLbGNDa1BWWWErNEpnQzhoeno1UVNhbURR?=
 =?utf-8?B?REdJdzlIYlVFMm42RjJxUWlkZHRmbFBRbEFzV09aM09rL2JMUGJSWkRNRnZT?=
 =?utf-8?B?N3hEZ0FHd3d3N1J3bE1Xd2RCazV3TjBzcHYxNlZVV0g4OTFIckxMVi9sazg1?=
 =?utf-8?B?T3RyeTdoSDNIMEg1N1NQS052Y2tqZ1dsblVYbDVtODhUWURta25ab1htbkUy?=
 =?utf-8?B?TXNuUTJDSjVxNEQ0elF2U2xyVUhFY1Z1MG5OcTE0ZU9OK2lXbUY4SWJraVVa?=
 =?utf-8?B?eUVuMFRYeDBLVkE0TEszU1V0MEo2WktFZElXaVBLRk5ZNGVVb1QwcWZTSkFz?=
 =?utf-8?B?VnBUTitYZWs0MEJ3ZXZzWm5DbXBWZVZzc0lyeUVmS0dIQ0V1SXFLWWVLcXM3?=
 =?utf-8?B?S3BxdGMveEhHbjNrNERxTkEwV1pvZWFYRk5maW1iZEsvYmdCcHpPeXRiZnJz?=
 =?utf-8?B?Y3pkUzY4Mk1WQUxpK2NCVTNIbUxqdUEzc2VsQ2srL3pSRXQ5QlBoTTdncUhP?=
 =?utf-8?B?TjdhM2E3eEZBU2dsZVdybEFSdm1iV2VBQU5pbFFoUUtYcnZjZWQ5UW1aV0U4?=
 =?utf-8?B?eWZlNnBpSEIzcktZU215KzlJU29lZmExODhJaUYzMVBGZStuTXBxNXFxYTZn?=
 =?utf-8?B?b2lieTY3TkRCUWd0NTRXVGY1NS9UQ0sxVW9FcFRUaHFsYXJTc1pTRHhBQzVx?=
 =?utf-8?Q?4VL09UPq3un/UMGARSff3XgB8vNzO5JS6CE3aqBzdVrv?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF990BCE628.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(38070700021)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SytCR1ZWU0k5Vm9RV1J4TjFwR0NzQTJVcWUwc2tEbnRuZ2xoM2g1a1ZDNzJG?=
 =?utf-8?B?VmYwV1ZmM1pWWEJNSGZ4Rk1Bb3UyY29WblBRUEVzN2pQbDlkNmxTbUl5L0Fs?=
 =?utf-8?B?S21GaU1jT0ZFTkhXb0h2NGZrZEpkTkZpS0NQMTMzcHZoUU42VE9qdFNOYmNP?=
 =?utf-8?B?MU1oWmFqNjEraVZ4K01TWnJCVmdnQUpBSStGNmFPUklBY0VVOXkzaXBRaDRH?=
 =?utf-8?B?QVNTQWl2ZkRyb1RSK0ZkM1AzcDlFWGVwSGVHSmN3ZEJ3Uzd6MnpQWVcxakdL?=
 =?utf-8?B?R2xURU5sL1lYUGIxb2tNSEVOa1hWUGc2SW9QZnFVNXZ0Zjc4QTcrdFU1Y3FM?=
 =?utf-8?B?Ujl1Q1pTM3VlUkJJc01HdFZvc1pVRjU3emtJL05rUDBtZTF5VmhFcG8zYzho?=
 =?utf-8?B?eW9JTGtwcnMrZXkrZm1IWktnU1Npc3B6YWNZdVdGMklEOVd6Z2UwaVZpWGVI?=
 =?utf-8?B?M0JMcHRkZGNVN3Fhd200Y28wWDFDWnVDa24zWmd3SGdJKzBrZXpUdTNNbXFK?=
 =?utf-8?B?SHdGTTZkaEpXK3VlYXNzMVhvSHpYekJKMFo5bWE0L1VjMUVFc0JRMGJHd2RP?=
 =?utf-8?B?c2habHhnMUFBUzRYOTRqTFFMUHVFSHh6RXpWRFVmU2cvT1haeDNXeU5FYUdJ?=
 =?utf-8?B?RldnVEFpYnFhdC9UL2RIN1J5TWhRamRFV1ZNRW14MDAyNlVaV3hNdENGQkxM?=
 =?utf-8?B?L05pVHZDa3plSnNkMjJic21aclhCMC9idm5pSVVYdGJ2b1RxeTNxZ0hzZ3RV?=
 =?utf-8?B?ZmZpclNzRTk0c0J2MTg2cElJNlFDR1hBbHZZOUJYZFNqejlNUDlHYXdWWk5J?=
 =?utf-8?B?VlA5SXUrWldjWHZsTXF4OEEzZHJ6VXRyOFJsMGlDUFVBZm1DNXBoYk5LRzVZ?=
 =?utf-8?B?YUQ1RnAyM1Z6NzZQUmJpWEdEM3FPRjFHMzVIZDJuY2c2bTNWZ1RPaTk0TUNj?=
 =?utf-8?B?K2Z3cDkwMEkzS2k5eWxjTzdNL0RVeGQ4b0pTdHZhdG54VjhnNTdMWmtTRi94?=
 =?utf-8?B?bjVpdjNYOSs1S0tFdWFEYzArTWpxZ0FvYVRWSTU2NTBSWU5qdWdQQ3JrNU9t?=
 =?utf-8?B?UXZQNThRTUxVK3FmeEUxYjZIU3A3R1MxSVhsSVhBSjl4ekYwSTdRNUN5MWNw?=
 =?utf-8?B?c3FJMTB1Tyt3TnpIK0xZRHJPUUFpVERNOGUyRUI1VUY2dDZVZE1VTzUxUEpt?=
 =?utf-8?B?YkVad1BJdlh2UkpqWng3elRqKzhlNjZpaVBZcFU5eENKb0ZEZFRoVldaQ1BN?=
 =?utf-8?B?T2JjL29mNVBibmdWUkFNMktkemlnR01VVi8zczRMaWZKS0FrOVd0RHFidExp?=
 =?utf-8?B?VnpuYVBFa1RMd0pBMHRPMWNZZVN0L1U3S0VDbnM5a3lXUkUrUkQ2TE9QMFAz?=
 =?utf-8?B?UkVLU3VJaEl1cElsQ1g2aVN1dGJCZ09EakEyWDMvUGVhbldaa3pUNjBVbVhp?=
 =?utf-8?B?dWMzaUtGSC9NV3dmOC9HMG1pK0YvUHdyUkV4UG41Nk9sbXpjK0dUd09CL2t4?=
 =?utf-8?B?UDBsVFJZRW10Uko4TkF4OXMxMGEwMFJvNFNJZmROeGM1eTIxdWExeVFDV3VQ?=
 =?utf-8?B?Z0trSFVSVUN6eEVGa0JRWGxQbUZDMytuTC9TcGRkM0hrLzBmc1NiMHNDZmF2?=
 =?utf-8?B?eTJxdUVCNHQ2U0NDOHA4NlZHeHZiQ1psRlFnSmt4eDljWWMwN0dVNW5MUnlX?=
 =?utf-8?B?d1ViaFRrek5uVS9uUXVpdTZxTjIyTkpTM1lFVm9EVy9VK05aSFdWeDNYTEdU?=
 =?utf-8?B?OUNramNPeUlXYUJIQW5MaGlRQklnTnVNSDB3UFFKWGpyeVpDQWhseDZjV21O?=
 =?utf-8?B?eXRrTUNKeEl4MnR0cHR1LzZ6RTYyaVkwYU9XSFNnUzVsZVE3bmEzVFNXT1pw?=
 =?utf-8?B?RjFyTXFYa1RsRldxWXIyUGhzMk5CQ1NuSzQrTWtzTkVHblJXQURscE81NGtu?=
 =?utf-8?B?SHNjSTRaVktCNGtGM3d4MzdNcTcxN09ncEF6Z040TWZLekhEdzRPMFk0NTJs?=
 =?utf-8?B?MW5iZmJ2ekVzekVveFRvd1V0T0U1eGFBWFRNZCs0azJzTHpqRk5nQXZHcVR5?=
 =?utf-8?B?blV5OHVrVk5HTjhwRVNYY2NqU1EwZWVMd3l3cWg5aVZEYkZkTmRmaEFud3M0?=
 =?utf-8?B?Qmh3TEdLc25nMnlvNmtKNllpREgxK1FiSDh3c3lhRmNIVmVQN01NWjVmd2Ey?=
 =?utf-8?B?bDhrTTRLUEFyQ1UwYS9VZDNHS3VEMFdSN3BkUlVkUzBPQVdMaEJlVUZOM0c5?=
 =?utf-8?B?UmU3cDJvNzBMdklNbDEvUGNuTzNYWTBUbFZSazlVWFE5L0NkWjlqdjl5aFN0?=
 =?utf-8?B?UXVBbHRiOTNFWXYvYVRtTzJ2SnBkcmlqS1pqTUIycUJ3NnlMR2FBdHZ2NHBz?=
 =?utf-8?Q?glFkrGizEa7z+TJBr+Ztsl7t4zqMD2ORdZjYrnQGZSU3P?=
x-ms-exchange-antispam-messagedata-1: ug66OWzWoa4AyQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <89CC759AB29B194A84436A861BA00508@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF990BCE628.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb2a1d5b-8f21-4693-169b-08de73125937
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 19:32:57.6441
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GtkaSj8Aqp/hsqx72nQT5PdX7V07MY17DmC1Q+SXf7VjiR5SXrSukUwMSd4FlyiKBjWTuDE8oAPZ8aBgXfhzm3st5pLyheGI5mflsTABG2g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5255

T24gMjMvMDIvMjAyNiAxOToxOCwgRnJhbmsgTGkgd3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlMOiBE
byBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhl
IGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gU3VuLCAxOCBKYW4gMjAyNiAxMToyNzo1NyAtMDUw
MCwgRnJhbmsgTGkgd3JvdGU6DQo+PiBTb21lIG1pc2MgdXBkYXRlIGZvciBpbXg4bSogZHRzDQo+
Pg0KPj4NCj4gDQo+IEFwcGxpZWQsIHRoYW5rcyENCg0KDQpZb3UndmUgZHJvcHBlZCBhbGwgdGhl
IENDIGxpc3RzIGFnYWluLg0KWW91IHNob3VsZCBiZSBhYmxlIHRvIHRlc3QgdGhpcyB3aXRob3V0
IG1haWxpbmcgdXMgYWxsLCBhcw0KZ2l0IHNlbmQtZW1haWwgaGFzIGEgLS1kcnktcnVuIGFyZ3Vt
ZW50Lg0KDQo=
