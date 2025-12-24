Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011054.outbound.protection.outlook.com [40.107.130.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA92155322
	for <imx@lists.linux.dev>; Wed, 24 Dec 2025 11:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766574973; cv=fail; b=ToaUZGZwFg5rGnL40R00v3p8uw9UUu7sICGP+u/iEVMrBvLADt0uEW/pUf2jQPbPOvFxKySPEZ8rcr6YXy94acUwJYaeM7pZ4U7BERBeSC3QigQchz9tXvddPxVkWwLZD1NMsE9oPShXZav4sMIU2zl4CehWwEWInwb9SVWJEbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766574973; c=relaxed/simple;
	bh=TTWhLAEZzMULsuhktXE3l2IXglPJ74sE1nQnEpZSgJc=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=h+x1Unhcf3cvUJuAvEuObH/+V9ZefGA6g534pgIrcmA7/id4v5hBjtAP/p1TDyv/hUqvELpoUr5rhtB3vMxFIfmjSa0pKkGMX4QgR4KBPVgHljxwr8kRTkScWBR7J1iCcX2UAh9NyAiB7OWO773ap+U3EoVMyma777tODKHSskA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=VnK396FA; arc=fail smtp.client-ip=40.107.130.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="VnK396FA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x1Ggrq1RoROjPlKdTAw9vWuSfGDI1xPBWHCg/sCUI3jTp78QWoNPPBjy80WPKFOQVSoUL8+vf76dYLggs7ng0OkAQLHTu9czhQshfS5cXBrpt0XL/KdelBhJ2HXobGUg/Gsj28Y6HjvFw346I8b+6YeueaTiQN/GsxyVpsLKNBN/HRk5LFPwI7avQbuA82kjCcimKrMPD5NYn+j15zNkW7edRlz8bMO/2Bd8cfHdyxqKv5fnh1FlOcfn2G7BTpi0+xeP6ltC6idWwJL7l+0pp6uRiSvb+y+Op6CYIdpr7f42IMPoLoPiOlAmKrMGdlxLfnkWFyroU7o7/bHoAomifA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m64RIY7F2lrzzehDa/bH7XbqKOxmzju0oObLsJmWjCc=;
 b=rYEbH8LjiwQlk7M+3hH/Mv6wr81q/KzKykT1OEArEXS8Vhze4mVgICCqiIhICkEzmo93cydOIx+wgBUye3sl57uzppzlP8F3hYlEu23KOV5fbfdQaZxyHi9JnBdDNklBqzksQ+M9zISjTANmXxABuYy0Q97/QcsVZwAE7j0C6JVpToM3nrfHh1lZ130p7oarNGEyj6MHPLeLI30uGxVUwHT1KvWjHqxl5mvnBCXXQEPIo1ezjIrvHdrzogdsTDSJRMUr/QU40CM+jyWqwpTPGSr9gll6jW9ntBiE0Jbjd3pAe4MMx+WdfJh4x7PVp6pZl0eaLUPjNQ6DGLNDWB4TgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m64RIY7F2lrzzehDa/bH7XbqKOxmzju0oObLsJmWjCc=;
 b=VnK396FAkEZ3sBvFzEmugEc9TEJssrGKgJzrJ6g7cMiLz+0eJUsrWxNqQB4GyU6lzSskDwQItJC7M+HplhMqNu3D886N51uOjrulRgK75NMl6bQIxqzcxAepxdKJUPKxOkrh1GUlrUOlDwcpF9E3tVZHegjmIiiX5XFAs2e90B73gHwu2o3spzxwsrDzcory9hwbeff5gmOJDAxrQFC4fFIwb62hL8w6G581YwsYd3hzk2GaemCU+j95yozOGDdaWy1ENwqW+FUy54uFyBBoPm1MABUOJteUlBSCSegm/Wx7q8Yu1Ga/og8DRbb4gCjTGWlKZuPFSWNlMsk5fmRT5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com (2603:10a6:10:2e1::11)
 by GVXPR04MB10753.eurprd04.prod.outlook.com (2603:10a6:150:219::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Wed, 24 Dec
 2025 11:16:05 +0000
Received: from DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce]) by DU2PR04MB8822.eurprd04.prod.outlook.com
 ([fe80::c67b:71cd:6338:9dce%5]) with mapi id 15.20.9434.009; Wed, 24 Dec 2025
 11:16:05 +0000
From: Xu Yang <xu.yang_2@nxp.com>
To: vkoul@kernel.org,
	neil.armstrong@linaro.org,
	shawnguo@kernel.org,
	kernel@pengutronix.de,
	festevam@gmail.com,
	jun.li@nxp.com,
	Frank.Li@nxp.com
Cc: linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] phy: fsl-imx8mq-usb: add debugfs to access control register
Date: Wed, 24 Dec 2025 19:17:16 +0800
Message-Id: <20251224111716.2925597-1-xu.yang_2@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR01CA0002.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::21) To DU2PR04MB8822.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8822:EE_|GVXPR04MB10753:EE_
X-MS-Office365-Filtering-Correlation-Id: d786c7bc-a114-4719-d5b7-08de42ddd477
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z2pzSkxuT0JRWmIwU1VIRERhaFVyVmhYSHdNMVRlUWpOOXBtcFg4bmw2dDQw?=
 =?utf-8?B?NEY4U1RUUkVBTFZyVjE0S3pXN0lpL3AwdDExTk11UWo3WFJtVjVlaVVuN1BD?=
 =?utf-8?B?WVM3NUdGc1c0QVhRTDRJOVFjSnJKMG40b3VBMWxUd3ZFTXp3SGdZOEgyT2Zn?=
 =?utf-8?B?K2hhVUJ2cUxkd2RRSmxDb1NBOThLU1NodVIxRk41MmxBQWQ2d1A0ZUFKdXdK?=
 =?utf-8?B?TVJXWTNnaHRyOWFIdmwycmNMMm1SMGdLazUvY0pBTFc5R0dyTzNiUXd2dkRH?=
 =?utf-8?B?d2xYQ3ZEVHFabUdZNUtqcnNzTHdvNWE1eFo5S2VHUlZzbjJDRzFKUW5mQnFr?=
 =?utf-8?B?U2Fja2p1N09sL2pmNEFYVk9pUHlJVHpoWVhjcHBaMzFNb0VYUDR2S0JkSUIw?=
 =?utf-8?B?aU1nUC9xUGtRQmVuelczVlhCSDZtVVovL285L3Q0UFJVOW1iVWxJYmRnN2Iz?=
 =?utf-8?B?V053bnpxekdjQ29WMW5sMlhKTXRPMCtlcTg3YkErWEVGWTAzYTRUb2g2NDlW?=
 =?utf-8?B?L1BQenJBZC9Mdlk2a2xIZk1Nb2pBcnM4M2pXZUpDNkhOT1lHb3BhM1RBaDNq?=
 =?utf-8?B?OVNidVEzSzJiK2M2T1lJWm9yTFo1bmxORThVM3lraVRqVTlwSlBVQ0ZGQlpH?=
 =?utf-8?B?RXk0Q3FGUE9RaDlhY3R4VExFNndNVVdJM2NKVzVpNnhGZjFTZGU3eHRKYkM1?=
 =?utf-8?B?WHh2dldhcXA1SmZmcU1MZnFYV3E4SDVYeVZJM2RxV2IxRDZFd0Z5UEgzVjJi?=
 =?utf-8?B?cTdvLzRDZlp3azJkUUZpaG9EYy9OMEd3R2ZUckdpK2YvUUc5cC9MUGl4dzl2?=
 =?utf-8?B?R2dkMm1NNlF5a1RCWFRDVFloODV4ZXNXVGt1a0dYTFoyWnpsTzlkSjB2QS9r?=
 =?utf-8?B?eWlzOHhvRDIrSDBoY1hLWm81K2sya1BuTWU4UzBja2YyR29BVDFWNzhTOElQ?=
 =?utf-8?B?dk1CcXF6d05RMm5UTTNXaU5UaWtEMzM2Z2JIMFhUY09XakxHNWdZQXVjN3JF?=
 =?utf-8?B?ek1idXUvUzlhWHZ4YVV2OVF4Z3JWT05nS1JoL0NuUGJCellKYkhJdlh2VnRC?=
 =?utf-8?B?cE93ZjdkK2RTMm9pQkdmMDBXRVRTQ0RPMU9TRVJNVjVNTkdYQlhzY1ZjZzlw?=
 =?utf-8?B?aHNsUkhYcno2S2Q0UldTZkJBWnByWGY0b0FnNkVkNkE4ZTNsZjI5NUtxNFA1?=
 =?utf-8?B?L0drTnJkdmEzbGdFcTFOajNjamRwYW9lRUwrWU9GaW4wd2MvYVc1YzJObi9O?=
 =?utf-8?B?Q3AxaGxzUkpUNXV2ZHB1cE52M0NLZHQ0OHM1Nnc1VjUyblJZNEJjOGpqbzRH?=
 =?utf-8?B?S3NXSGMyVXlUbkZ3TzVpNkI3eUdPTEpyUnNoU1pHSUVLQlVuV3FvUmtMbkhS?=
 =?utf-8?B?c1U5cGNsV0paTXpFQlJRNDJabGx1TEVyMS9kMDVIWUFVdmpxczR5M1MvdDV5?=
 =?utf-8?B?ZlgwQXJIaEdlbC9pZDhCbm40WWowSVlCV3F2SkN2SU9RUjBmeXBOKzZRR3h4?=
 =?utf-8?B?TWIrY3FzeGlYRHdPd3RUMTBENXBCblM3cHF6L3Z0MTlwaldpRGhYcUtGZ3Nv?=
 =?utf-8?B?RlR2SkZVRzY2Y2k5QWYvRUtvc25ZSkhVRkEwTGtzZFlUWEpBNi9WMlUrS2t5?=
 =?utf-8?B?c0VYRTBCV3I0bE1zZWRhMTMrMDVZcWp0UVBoekI0MzczR205Mkx1NzBuNnZt?=
 =?utf-8?B?VEhMRG5pQ2RnaHVsYzVCQ0ZNQ3lwZklKcE8zUEM5ZGRDUmlrYzZUVTZCQnJP?=
 =?utf-8?B?aHpSbVE1alAzSWtTWHJObnA5WG41ZUl4WDFnMmFHMVZ6cTFNOVYvSXlhWkQ4?=
 =?utf-8?B?N0I2b3FUeG1yK3dBQzBvY1RSVERkQ21BbGNvUk9LTWFLbFYrSXVNbXRqRTd6?=
 =?utf-8?B?S1VIQW9kSHoxeEd0WEJIdno5RVk2Q3NEODhoN0k2MS8zOUZ4WlVDVFYxdzdm?=
 =?utf-8?B?d2pRUHZlMnQ0OEpiWGhFVDFJcXhJaXBHa2lLcXdKUWt5dVhLb3Y3WUlTWXlJ?=
 =?utf-8?B?ZTF5TEtGRFFTc1gzWkcxRXdTb2VSQ0FIbWZCVFBLYXZsZ1oxK2szamFkdnNm?=
 =?utf-8?Q?ZUHDFk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8822.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M2NOUU05bzV3UWNpT2hIdTh2ZXg1N3Z4bzRmUDFkWWJvSjZ2em5wQ2NZYkRk?=
 =?utf-8?B?QVJ5OHFmOWp2d1FpbXRyL29PS01KZ1cvMDBwcEdiTWdJODNXTURWdkVPc0xn?=
 =?utf-8?B?a1Q0Z2UzZUxDS2VvZ3VOeDF5ZEc5eUJnMmp1cXNzbkY5SVhiL1ByL1lNMTVL?=
 =?utf-8?B?SDBCL3NTdHpSOEdQSDlGeHhXVHlRQmgxYUFLV2hzOTQxeWlRdUk2enF0eHdV?=
 =?utf-8?B?cVZCZlpJMngvakhJRmY5LzhINUZISlpnSEtBQkIxUGxMeFBVQWMwN294MlhO?=
 =?utf-8?B?WURqeDhuYlgvZ0lrUWlVV3N0MVZJOUFOemplZmFKYVJrTUl4LzFSclJ4cnhz?=
 =?utf-8?B?TmtZcDdtaXdSeHpic3FUUjhuL1ROdzBkSlltUGVjMTRDcHhaWXczc1dyZEQr?=
 =?utf-8?B?aFJCMHg1U1pxSWtRd2Fjdzc0N0czSktUMUFZN1JpbEY5dTluWlE1U1RoRDRm?=
 =?utf-8?B?aEo0dzVTaEs2VkQwQ3FWZWN6aHVqdVI5Y1JWQmFxODFBaXltdmRaRnVYankx?=
 =?utf-8?B?K05DcElFZUdKajRJYU1obzVIQ2JKTUdMK0tYdGdaQmZkWm0zT0sySXk0bFZ1?=
 =?utf-8?B?VytzaW5pd09ocHdrQzJWck1rVzdkZllNdklxdmszUXBQMlVVaTgrd21KUHVM?=
 =?utf-8?B?YWVYYzd2ZUlobEZDWGQwcm50VDBVQU9NbS9WM1hBd1lCOWVzbHBHeGZTSEVJ?=
 =?utf-8?B?OHNiMTlwS1ZkL1MvY2IxMHJCc25zZ2phNG5UM1J1NHd4bHZHZHdnQzZ5ZEZ0?=
 =?utf-8?B?T0RmU2V3dC9VMkRFTDJoaHFpWFM1aVRCS2ZUMGRZMHd1Y2R0dDdJNmw4Qmpo?=
 =?utf-8?B?SU5BelRvb0JUTlVNZ0RISHBDNmMwNDcyNWxXWEMwNTR2SmZLb3hSb1hoVFE0?=
 =?utf-8?B?RDJPN2ZBQlAwYk5JY3VqRFVGYjRZcGI2TlkwT0M2SVFqYzdHNmJrckN3S2xN?=
 =?utf-8?B?dUVTK0YrajFzcEdocVJlYUtkckw2blpVQWtCc2VEYkYyMEJXUnptNlgwUFUw?=
 =?utf-8?B?TSs2YVFNc1JWR0VaUEhqMnFXaW1tTFg5UCtPS29NZWVDblpvTlpGY2NEM2p3?=
 =?utf-8?B?M29nSEY0Yit4dlVoOGNySmRsdWUyN1pFTFd6TTRqWnZUQjNId0E4UFY4My9s?=
 =?utf-8?B?Y09SUG1OQ1BYZ0MzZDk2S0JUUlRDeThlN0J1Ui9EL0lsODVtL3Qwd2wwZEtZ?=
 =?utf-8?B?cXpaR3pFdEhzUFRZOGJtZkRHblVHY1RXRkFWbUxqLzdveVFJVmxGbEphZ2F6?=
 =?utf-8?B?cVlPOFVpcWJMK0FmTVZ2VW5PaEo2S3NQa2ovc2E4MEFiR2xPbVRwR2VlNTRM?=
 =?utf-8?B?Z2daS1ZoUUVteU5ka3lBalg4eG01Mm95dkV6UUJFK21jRFkzN08wb1pZUmpr?=
 =?utf-8?B?ZWdIU0FoWnhIejJzR3E5OGE5T00wbXM5eklFY1JsSEQ1QUJjalNNRHFubTRO?=
 =?utf-8?B?Y0FBWEpOWm5YTmV0QUdVeTJPc1lLTmFySWxJdGFnS0NLT1R3ZUx0Qkd6Nldj?=
 =?utf-8?B?ZGlLOEFiUmVmeS9jajZ5RUxwVGNHdmI3Z0VPVThOaHBUK2FIVDVpT0VlRkFv?=
 =?utf-8?B?d1l3VmhUUnVWb0RRNDJ5MjBpK3F0dnc4MFRuckMzTUF1dTh2RHA4aTJNU051?=
 =?utf-8?B?RERNNkN2eFQrcU5BMS9nc3Q0czd5OWJXSHpIa3YyVFZTdkowSE9mdmQ2NzVZ?=
 =?utf-8?B?azZFMzZLc1pVWjBEMyt0R0tWQWlEVlVyYTdWYngvMEIvQ211OHF6RG9oMGlx?=
 =?utf-8?B?VXVubEV1WVRLYkVaUEdLa3V0VThOUld6S3pOMDEyR3lzd3NqOVcrU3A2cHlo?=
 =?utf-8?B?TmNiUU5uVUxNWWtBSEdvSE9qMzl2SFpIMkZ4dUJ4TXFITFFWT3RIeW5VVTJ6?=
 =?utf-8?B?cXNnQ0YzdVVRVTZ6T2dwNStMK1RadE5teHlQZ2srMytQeXRmSE9rSHVvUUtW?=
 =?utf-8?B?Y21qZGE5S0ZteWhrNnBIZzRQcElBdnF6QWQvd1ZRKzJtS3hDTkRzNUZUYUha?=
 =?utf-8?B?bjUvckZqUGNBV25LTEJOakNaOCsxVCtxT29KdWViZERsckpOUStMbUZ6amhn?=
 =?utf-8?B?UElkNWxremFCOC81azY3cERtYXlzVHVmUEJ6VzR1K0JDY1IrOThrcWNxcldJ?=
 =?utf-8?B?cDdPMDFvcXdkUnZTSWpSY1kzb0lnM1BvQi9EZlhxRXdoQS9kQis2c0ljMEgy?=
 =?utf-8?B?RzRmK21Yb0k0by91bGdYdWhRWmU5bUhpOWNtSW4rVEhBTk5XcjhLMy9zZGJB?=
 =?utf-8?B?MkcrYzdtYUgyVGpwRlRMTk8ybFIzV0dwOXFNQ3JCOFFUMXluQVI3aHJEMXlt?=
 =?utf-8?B?SERBNWlMSlhMZW4vNDhETndNb0hNYmFaWEpUSlN3VHJRbUY0dXpRdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d786c7bc-a114-4719-d5b7-08de42ddd477
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8822.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2025 11:16:05.6314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: et81Iulq4cj/CGZ6MTQbja22zk5kMlGMlC3I0boXxJZzfz7cstSMuh1xI6TNolVRdIf9kp4mBNJ6RAVgLSsREw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10753

The CR port is a simple 16-bit data/address parallel port that is
provided for on-chip access to the control registers inside the
USB 3.0 femtoPHY. While access to these registers is not required
for normal PHY operation, this interface enables you to access
some of the PHY’s diagnostic features during normal operation or
to override some basic PHY control signals.

3 debugfs files are created to read and write control registers,
all use hexadecimal format:
ctrl_reg_base: the register offset to write, or the start offset
               to read.
ctrl_reg_count: how many continuous registers to be read.
ctrl_reg_value: read to show the continuous registers value from
                the offset in ctrl_reg_base, to ctrl_reg_base
                + ctrl_reg_count - 1, one line for one register.
                when write, override the register at ctrl_reg_base,
                one time can only change one 16bits register.

Signed-off-by: Li Jun <jun.li@nxp.com>
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

---
Changes in v2:
 - correct copyright
 - add imx8mq_phy_wait_for_cr_ack() helper and use it
 - use DEFINE_SHOW_STORE_ATTRIBUTE()
 - directly create debugfs file under imx phy debugfs
 - remove debug_remove_files() since the phy core will handle it
---
 drivers/phy/freescale/phy-fsl-imx8mq-usb.c | 180 ++++++++++++++++++++-
 1 file changed, 178 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
index e991a480b882..a5a6321f1f27 100644
--- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
+++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
@@ -1,10 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0+
-/* Copyright (c) 2017 NXP. */
+/* Copyright 2017-2025 NXP. */
 
 #include <linux/bitfield.h>
 #include <linux/clk.h>
+#include <linux/debugfs.h>
 #include <linux/delay.h>
-#include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/phy/phy.h>
@@ -57,6 +58,20 @@
 
 #define PHY_TUNE_DEFAULT		0xffffffff
 
+/* PHY control register access */
+#define PHY_CTRL_REG_OFFSET_MAX		0x201f
+
+#define PHY_CRCTL			0x30
+#define PHY_CRCTL_DATA_IN_MASK		GENMASK(15, 0)
+#define PHY_CRCTL_CAP_ADDR		BIT(16)
+#define PHY_CRCTL_CAP_DATA		BIT(17)
+#define PHY_CRCTL_CR_WRITE		BIT(18)
+#define PHY_CRCTL_CR_READ		BIT(19)
+
+#define PHY_CRSR			0x34
+#define PHY_CRSR_DATA_OUT_MASK		GENMASK(15, 0)
+#define PHY_CRSR_CR_ACK			BIT(16)
+
 #define TCA_CLK_RST			0x00
 #define TCA_CLK_RST_SW			BIT(9)
 #define TCA_CLK_RST_REF_CLK_EN		BIT(1)
@@ -118,6 +133,9 @@ struct imx8mq_usb_phy {
 	void __iomem *base;
 	struct regulator *vbus;
 	struct tca_blk *tca;
+	struct dentry *debugfs;
+	u16 cr_access_base;
+	u16 cr_read_count;
 	u32 pcs_tx_swing_full;
 	u32 pcs_tx_deemph_3p5db;
 	u32 tx_vref_tune;
@@ -425,6 +443,163 @@ static u32 phy_pcs_tx_swing_full_from_property(u32 percent)
 	percent = min(percent, 100U);
 
 	return (percent * 127) / 100;
+};
+
+static int imx8mq_phy_wait_for_cr_ack(struct imx8mq_usb_phy *imx_phy,
+				      u32 stage, u32 *data)
+{
+	void __iomem	*cr_ctrl = imx_phy->base + PHY_CRCTL;
+	void __iomem	*cr_sr = imx_phy->base + PHY_CRSR;
+	u32		val;
+	int		ret;
+
+	writel(readl(cr_ctrl) | stage, cr_ctrl);
+	/* Wait CRSR[16] == 1 */
+	ret = readl_poll_timeout(cr_sr, val,
+				 (val & PHY_CRSR_CR_ACK) == PHY_CRSR_CR_ACK,
+				 1, 100);
+	if (ret)
+		return ret;
+
+	if (stage == PHY_CRCTL_CR_READ)
+		*data = readl(cr_sr) & 0xffff;
+
+	writel(readl(cr_ctrl) & (~stage), cr_ctrl);
+	/* Wait CRSR[16] == 0 */
+	return readl_poll_timeout(cr_sr, val, (val & PHY_CRSR_CR_ACK) == 0, 1, 100);
+}
+
+static int imx8mq_phy_ctrl_reg_addr(struct imx8mq_usb_phy *imx_phy, u16 offset)
+{
+	void __iomem	*cr_ctrl = imx_phy->base + PHY_CRCTL;
+	struct device	*dev = &imx_phy->phy->dev;
+	int		ret;
+
+	writel(offset, cr_ctrl);
+	ret = imx8mq_phy_wait_for_cr_ack(imx_phy, PHY_CRCTL_CAP_ADDR, NULL);
+	if (ret < 0) {
+		dev_err(dev, "Failed to address reg 0x%04x\n", offset);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int imx8mq_phy_ctrl_reg_read(struct imx8mq_usb_phy *imx_phy,
+				    u16 offset, u32 *val)
+{
+	struct device *dev = &imx_phy->phy->dev;
+	int ret;
+
+	if (offset > PHY_CTRL_REG_OFFSET_MAX) {
+		dev_err(dev, "Invalid reg address 0x%04x\n", offset);
+		return -EINVAL;
+	}
+
+	/* Address stage */
+	ret = imx8mq_phy_ctrl_reg_addr(imx_phy, offset);
+	if (ret)
+		return ret;
+
+	/* Read data stage */
+	ret = imx8mq_phy_wait_for_cr_ack(imx_phy, PHY_CRCTL_CR_READ, val);
+	if (ret < 0) {
+		dev_err(dev, "Failed to read reg 0x%04x\n", offset);
+		return -EIO;
+	}
+
+	return ret;
+}
+
+static int imx8mq_phy_ctrl_reg_write(struct imx8mq_usb_phy *imx_phy,
+				     u16 offset, u16 val)
+{
+	struct device	*dev = &imx_phy->phy->dev;
+	void __iomem	*cr_ctrl = imx_phy->base + PHY_CRCTL;
+	int		ret;
+
+	if (offset > PHY_CTRL_REG_OFFSET_MAX) {
+		dev_err(dev, "Invalid reg address 0x%04x\n", offset);
+		return -EINVAL;
+	}
+
+	/* Address stage */
+	ret = imx8mq_phy_ctrl_reg_addr(imx_phy, offset);
+	if (ret)
+		return ret;
+
+	/* Capture data stage */
+	writel(val, cr_ctrl);
+	ret = imx8mq_phy_wait_for_cr_ack(imx_phy, PHY_CRCTL_CAP_DATA, NULL);
+	if (ret < 0)
+		goto cr_write_err;
+
+	/* Write data stage */
+	ret = imx8mq_phy_wait_for_cr_ack(imx_phy, PHY_CRCTL_CR_WRITE, NULL);
+	if (ret < 0)
+		goto cr_write_err;
+
+	return 0;
+
+cr_write_err:
+	dev_err(dev, "Failed to write reg 0x%04x\n", offset);
+	return -EIO;
+}
+
+static int ctrl_reg_value_show(struct seq_file *s, void *unused)
+{
+	struct imx8mq_usb_phy *imx_phy = s->private;
+	u16 base = imx_phy->cr_access_base;
+	u32 val;
+	int i, ret;
+
+	for (i = 0; i < imx_phy->cr_read_count; i++) {
+		ret = imx8mq_phy_ctrl_reg_read(imx_phy, base + i, &val);
+		if (ret < 0)
+			return ret;
+
+		seq_printf(s, "Control Register 0x%04x value is 0x%04x\n",
+			   base + i, val);
+	}
+
+	return 0;
+}
+
+static ssize_t ctrl_reg_value_write(struct file *file, const char __user *ubuf,
+				    size_t count, loff_t *ppos)
+
+{
+	struct seq_file		*s = file->private_data;
+	struct imx8mq_usb_phy	*imx_phy = s->private;
+	u16			cr_value;
+	int			ret;
+
+	ret = kstrtou16_from_user(ubuf, count, 16, &cr_value);
+	if (ret)
+		return ret;
+
+	ret = imx8mq_phy_ctrl_reg_write(imx_phy, imx_phy->cr_access_base, cr_value);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+DEFINE_SHOW_STORE_ATTRIBUTE(ctrl_reg_value);
+
+static void imx8m_create_debug_files(struct imx8mq_usb_phy *imx_phy)
+{
+	struct dentry *debugfs = imx_phy->phy->debugfs;
+
+	debugfs_create_x16("ctrl_reg_base", 0600, debugfs,
+			   &imx_phy->cr_access_base);
+	debugfs_create_x16("ctrl_reg_count", 0600, debugfs,
+			   &imx_phy->cr_read_count);
+	debugfs_create_file("ctrl_reg_value", 0600, debugfs,
+			    imx_phy, &ctrl_reg_value_fops);
+
+	imx_phy->cr_access_base = 0;
+	imx_phy->cr_read_count = 1;
 }
 
 static void imx8m_get_phy_tuning_data(struct imx8mq_usb_phy *imx_phy)
@@ -744,6 +919,7 @@ static int imx8mq_usb_phy_probe(struct platform_device *pdev)
 					"failed to get tca\n");
 
 	imx8m_get_phy_tuning_data(imx_phy);
+	imx8m_create_debug_files(imx_phy);
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 
-- 
2.34.1

