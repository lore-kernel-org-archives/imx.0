Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011002.outbound.protection.outlook.com [40.107.130.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C58A47CC6A
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 08:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768985856; cv=fail; b=CcGx8jVW0kZ3t9diITmMyvemMZWEOyYW34y5Wuswm5KfBWXlhaT+EkVlnhgnedVof5nSKYUDbCptHcQQlp4zT0Ygl+mYuHIaRJR4WjWOCf6+hk8fwrHDdORyppTqYB0/a+9Lp6yf3JQPou6Rr1RkYSFXW9V3IPNr2llK8cZDM8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768985856; c=relaxed/simple;
	bh=Mu+yAYj7USYeRkZF64gvYlLZb5NAFiH2REiCNE3upOU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Xrq+OxC5yNxvwleU7m5yeoG5vjfI41wkKEecjUWjTJf2zZlhsmW4aGEslCoK3+Y2AZJSCrTYg4naAiOL67UyQEh57qA35/QFzSyiH0qTULeQkmaGswTXb33xIzXvIyVp1XhhBnCgtA+I7TanfLfr+eDCAd6tDbAbph4EtWpYsGM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nfY9YBcj; arc=fail smtp.client-ip=40.107.130.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nfY9YBcj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gh4u8OKaTn4B+0hsHK5EVjjI5UkCC5aZ+sVudSCU2uKYp+N41U35V4YuxaXX8x4ThFKw/U2Kbp4ieLj/ImrwX+pSigaAM1rrFEcO8CeK0y464HORIoABctoomLtm3yCvDKzd2K+01Zt7MiRcIcAvtLmRcBF5COBDSD+1EVJ0aBXqijy+uRhZN//6BPD5kOZC9U/8+RgDItZkLB2+v05FdDCA0Flg5oNI31yM8GaDe8pp2MLM9iDP5yirJi5ZK8lhqxB8BLiK7wMbR8FfE2qKYqHHMQIB/LLNfJmRbAhojz70eJoCuE3PjzmsThCxQ6T5saxdg/8ufmiAr9SNswLcLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1B5wSQdrWTMZjLM0OtlA3Tc9BTZ2g7pyvLgVfPDUhdQ=;
 b=mr+ZSwVsNtLD3w0l+mf6kOfbtW2vatywIwcqlGwSTec/d1+oxdPRLnButxt6GJzNVnQxE/GqamwSo/ignnNvm9IVV46RgoQO1VEljY0xOvi9/jVfjC2eXjSvBBkzFMg5rFIXvTlOnWKojZYY6ws+YbG2B4U94K2VX1XrMZNUwxxRnz5qna1qEkAca64gVVdJmCPMFEeovpibrQWm0vRSb237oNBLMzXE/Z624GJpOnUeryKSIAghgA5/mQBYU9C8dz83s6jfZw5lcmNL5+2YnRVaZP8tYENQpibj9J74B3hnA4icA7wSH9dysJgRhTeokOHvbRhKNZ/tL2LDwJYbrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1B5wSQdrWTMZjLM0OtlA3Tc9BTZ2g7pyvLgVfPDUhdQ=;
 b=nfY9YBcjUbAKnJonMrWcDZ5cN6CCYYTaVd3HnO7/LEhWrLmBpw+pokiemoRrPJO47n61NB8KnS6UuTiMvC6Tcy77gljubrOfeeZd/aFPoTnfuR5m7hTnYbNfZEHYigF9V0iyqxi3JlTHSRXSw5DF3DlvaxNVTLZ8Hti78IS8uw5uc0okd6NzIsLpz10wkmTnyCz4abeo1Yt0sLp+bRL20ZArefIx9WXbLlwIzK0iyH2EvLNLReXA53S2VpX8SVhnUNrqlwzyFTmclZYNcOMxxyoitPz7F2sA0E5BqzHrf2fJETDkrAkxj5Qw5n4JpXkuIdrQE9AVQ9TduxiFVAO4sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by AM9PR04MB7492.eurprd04.prod.outlook.com (2603:10a6:20b:282::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Wed, 21 Jan
 2026 08:57:30 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::54cd:4aab:dc5c:6da1]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::54cd:4aab:dc5c:6da1%6]) with mapi id 15.20.9520.003; Wed, 21 Jan 2026
 08:57:29 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Wed, 21 Jan 2026 14:25:36 +0530
Subject: [PATCH v24 5/7] firmware: drivers: imx: adds miscdev
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-imx-se-if-v24-5-c5222df51cc2@nxp.com>
References: <20260121-imx-se-if-v24-0-c5222df51cc2@nxp.com>
In-Reply-To: <20260121-imx-se-if-v24-0-c5222df51cc2@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768985744; l=38766;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=Mu+yAYj7USYeRkZF64gvYlLZb5NAFiH2REiCNE3upOU=;
 b=r9nKw4v90zh+WoBGqd89RPdWTifMBOCX7TpyVYlPhYzk/bRZnb/VT6Wdj1vO57pX10YKHpk2+
 ppNtu0VhGgdC4vZ3vDrryl3o13ItfKH7xJ2W6t8VNp7DpTFfjRy09bJ
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|AM9PR04MB7492:EE_
X-MS-Office365-Filtering-Correlation-Id: 660f76e1-6dd5-4255-c124-08de58cb1b48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|7416014|52116014|366016|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eHdSUnRScERFV2FEeitxaVNEaitKMFVBNld0MTUxem1qT1pwajJlamcvNFA4?=
 =?utf-8?B?WjQ0Tnc3ZGNHMUNVNlVMMkZTTHFJUkFibDNWbU9xL2VEL0RSanJ6WktQaTRr?=
 =?utf-8?B?NjVIQmo5MW5tUm1tUXNZYVEzK2ZyWGR5dWh5NlZ1YUxiZ2tlUm10OFVqSm5i?=
 =?utf-8?B?WkNmVHlubjVhTEQvZnhhUDBGQzJ3SXFPRE9aMGFyNHUza2FvUzlXUW1RYmI1?=
 =?utf-8?B?eHJRdm1WL2JmUTMvRWZseHpkd1hTb1JxNXJ3R2h5dGpBMENWcVd4Z05rTnFa?=
 =?utf-8?B?NGZTL3hHVzlRNXQvZ3cxSllLbmRLZWtMT3FmT1RqL0o3MVhXaHNwRm1pVUVY?=
 =?utf-8?B?U1EwOHdla1Z4NFJja3d1STUxV2pyZWRGSnNKZjRYcExNaHZXRWRQbFdPWU1L?=
 =?utf-8?B?UVd5U1ZhMndBdERRcU51SWpqaUlQVERwbGFoT2s1NDVLcFRWWGtCL1l2cUZC?=
 =?utf-8?B?VzJLQjRoeUxMbTNsb3hJSHdvUnVjMi9ET2RLZEN3cDZSQVdpeHd4WDd4VVBX?=
 =?utf-8?B?NXU3RHhwUUo1Y0c1SVRSclBOOVVadnl5K0VwZk5mMDhOb2oxbjVHSE9DSWMv?=
 =?utf-8?B?eFFncSs0SmJaZlVEeFh4bjVtVTc2M2hGbDNxZDV5c3FIUTh2Q3JIblNqcjJP?=
 =?utf-8?B?U1pTUXhRMFM5cUs0WUh3MHR5eHNnV2NjdXpYRkdnSVUrMjdidS9CQ0w2M2Rm?=
 =?utf-8?B?Vkgvd1B6Sjl1NmU2YlBiNndBLzNBK2ZtOVJkNkxyVUxuUXcvSFZGSjJpRlNR?=
 =?utf-8?B?b2pKZDZwNHBTcThZak9nYXR3Qks2ZHJJemVWQXpEdGFYckR6czFRbFE5TXZ4?=
 =?utf-8?B?eERZYkxubVRhVHlqMzZKS0FFK3ZXVy9xY2VrWms2Wmx2V3gvSW5yb0NjdnBp?=
 =?utf-8?B?ZGZkWGxRdFFIL3Y0Q0V5ZForYzVoYXdibmxGbkVsaU5jMUVIYnZOZUYwM2F4?=
 =?utf-8?B?d2NOSVYxUlVTeEJvYmdxWXU3bGxIQ1oyZDc3c1BiQ2Q2K1FvNnErVWtiY1U4?=
 =?utf-8?B?SGN6TXJnZzhiQm9tQ0psRTA0L20xU0cxelhSejZzVHN1bG5pQTJpSy8wL0JH?=
 =?utf-8?B?TEM0cC9OVU9oblY3Wmk3c2FYTkZsaXJnMWxTejhDRDdTSlFoSWwzenQzd29D?=
 =?utf-8?B?OTFtVkNZWVdSR2JOQVNhRXRkTWhoOTJQOVFWRVQ5VFlWdlo1ZlBVYStLd0VI?=
 =?utf-8?B?MXk2SHJ4ZEd5empjVUtXb2p1SWxaRSt0aGRkSGNlRG5GMFV0YnM1Mm1HUE9v?=
 =?utf-8?B?VkhqM0ExazRZelkvKzYzTkxlWkdXUGt6N0pmajB1a0tCWFAvdUczOHZkU2RZ?=
 =?utf-8?B?eFhiQktZNTdMYzFPUzFZMHdXdFV4UFhPdWNFVkZlLzFzMk9vR0lSc2p1ZWJz?=
 =?utf-8?B?TjBmV1pkVGtDUmtzS0RnQXZUNWE3Vk1JdGg5b1dwNGRkRXlkQTFCQndsQ0la?=
 =?utf-8?B?Y1JCamkwL1RMYklhMlRkdldEY0VOSm92S09MM0JRdDJFNXVvK1lJWk9xRW1j?=
 =?utf-8?B?WXZvUExIZkZRSVFDaDhJYm5xYXU3UFBJS2tqMkorVm05UlFCY2sxak9mOE5k?=
 =?utf-8?B?SkhGVlpET0ZWUWY2NG5tc2o5V3RhTW0waVpCanBxaXJ4b3FsVE1nZkFQQjlm?=
 =?utf-8?B?czdsU1VqdGZJN2JaTERnQmFGdTkrMERDZkcvWkN0RXQwSzMyWlZFQzZmR3hX?=
 =?utf-8?B?UHpoaUhDY1lXMGFRWnluSWpITG1hTmxRV25KUHFsU1BtQnd4YVhLNnlCWjdY?=
 =?utf-8?B?R0dxMUdBNmErUm42NDJPUVBCZ1JkTGg0cGVuNjl2TWxzcHl1YkVCV2ZUV0tj?=
 =?utf-8?B?TXkyempOSHp1bzVocGdTRDhPaVJuZ3RWVDBsKzE5U3Avd2Z1dFIvd2hFSk53?=
 =?utf-8?B?amk4Vjdma3ZmVlhFdmx3cU9FeHJOMFRqbGJpUDE2aW5Dc2pjdE81SGJqeVRy?=
 =?utf-8?B?N2dVaG5adC8zNUl3K0tyY3dSdStWbll3S1ZTcld0UldiU2l6YWJ4Tm1RS0l4?=
 =?utf-8?B?cGh2aGhwUitzUGVhbUo0bzYyUkorMHJWSk0xOFVCQVBnaU9zTlE0NjNKblBy?=
 =?utf-8?B?bHdtOHl0T0JNTlVJamxCVmJhYUFuM3lzeUE2YVpSaStPS2I1WDd2KzgrMkE5?=
 =?utf-8?B?V2NhaUhmeHEwMmpGOUk1c1lrQStDcGJwMkNHdmpRZTg0RHJkN0hIMUJQcEhH?=
 =?utf-8?Q?K7sV2aICqxKmW8E5dsWS4kwjStE7/GGGaHp6KL11m3hk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(7416014)(52116014)(366016)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVNRbzVCR2ZuYkpEKzI2L2dpNUU0aTlCN2ZYczlBM29xdm1RTHAvQTd5MC9C?=
 =?utf-8?B?NU1iSTJHY0t1KzdvcmxSQlpMVGhLMzFFNldjaUtRMTZiZWtBVGF6NnBoeTBJ?=
 =?utf-8?B?M3dhTEk0OW5Xd08zUytHV3V1YzBISWZCU0FmN3A4VnJCYWh4ekRoM0xhNURJ?=
 =?utf-8?B?cHNyV1hoVlNibEdUTFNCMzlUQ1VmQjlhNmgrR0xENDhpQlFWcVZBRFdITk5u?=
 =?utf-8?B?ZlZTbGxLUzFWdm1qL0JQQ3lyTUp3RzFiU2luM3FuQzBIcmxQVURuUTRIclBD?=
 =?utf-8?B?MHprUTE4VjVjNDNyVllKWjhOU2NDV3g1L3hPa0hOTmxHNktwN0lOUHc5ajJy?=
 =?utf-8?B?SzJsUGF2anhBUWpEWjM2ZXFST0ZjSFlqeGNYak13cVRseHJNeGkzTmFHTFlz?=
 =?utf-8?B?MnN5THNSbWpoZDR1N2JXNWllTGRWZ0NvQ2x4UEk0bTRYWjkrY29CbTVCQnlU?=
 =?utf-8?B?OXdNZURjdWFBWXZHUVVYQmtJTkhBLzJkYWhhRUg4ZDhlSGJBZ1JmU3l5eTh1?=
 =?utf-8?B?Vno1WkY0WHZ1RzFORURLZXM3YmtnTzNkSzFUSkZxTnVXY1hsME82OE4wTkFH?=
 =?utf-8?B?dzFNOXhUT1Yvakl2dkpKN28rdXViZnNHN0FsZmx5SW96YkpuREgxNTZZUGRj?=
 =?utf-8?B?c2FHN2R0UW84OEYxL3hxbFpLM1k4WkZybUx5dXZYU0VockZ2aDg2My8xUVVo?=
 =?utf-8?B?SEdvbjhLK1pBa0wvdXhtOTJEWlJyVkowS2diRzZ3ZEtjc0FSczRWWlpCc3N6?=
 =?utf-8?B?UkVhdVdFWkhNMWduZUNiT3BXRG1Tcm5CZFdUejlNWDkvS1BPVmcxZWR4M1VZ?=
 =?utf-8?B?MFVzeXlLd0pndDdqVTRFclJiOExROGMrck1NTS9LejRod0NLbG9mZDc2S1pw?=
 =?utf-8?B?WHFwaTk1azVTeDRoNWR1S0J3RGlLcEhOc0o0N21neWNGWkY5c3RkR1BSNzVC?=
 =?utf-8?B?STRkODJOQVR5b1lGOFN1cVZHbjk5SjViOTRTUitxQnoxN0Z0MnlETlNiN0gr?=
 =?utf-8?B?NXhDbUlBQ1o0K0dSSTdIOXI3NVVramYxRDJHcXdrTWV1NGozcnNHSXlMeStp?=
 =?utf-8?B?bFNmVE45YVBrczFYMGdUckg3RnZjbEEra2ZWNUdRNW1yMVBhSUxZRXJTVFp1?=
 =?utf-8?B?bTFpUFF5NHpKYWpxMVl3ZGdoaGdoKy9KOGpQVDRkelRhbjMwQllhaWhIYktT?=
 =?utf-8?B?T2pxdWZaQW9oMnRncnJ2dGZHblFFK1BmdVZ6VlN0SW1XQWRnWkxaaThXUzB6?=
 =?utf-8?B?SE5lYTlRemI4dlcyejB4dEdsbzc1NWhqVE1ucWRsaXJtZjFoMGpyenlhejZj?=
 =?utf-8?B?ayt2SEFTcExZMXhHQnBYdURuQ1Z2ck9yM3NTUHhmQ0xXTzQyY1YyU25qamhZ?=
 =?utf-8?B?MUdhQVYzYWtmUHYzYmJFVTVsOWJ0a2tuWGxmS243Q0RpM3huTFFkeUNwL3Q4?=
 =?utf-8?B?R2RvcTFxbW9ZVWYwcndJOVNHWFQrc281bWlZQXEwckV4anpKRThadnh0M0lC?=
 =?utf-8?B?Wnp1bHY5ZzQ4ZlJHdFJuWXc0RU5lZDdWclc4R0lZbXRLVTJrSzdKcTdmQWlL?=
 =?utf-8?B?azFEOFhwcW9PcGdxUUhGRWNsRUxrOGt3bEZTMHRncGN5eHZRMG4zbXFTajBL?=
 =?utf-8?B?MGFIU1Fmck1jbU83K1lCS2VTOWZicHhNN21ZVkJiMXYrdGtZRUlIMkpseThw?=
 =?utf-8?B?UVU0UGRxMnZ2NVoyUnNaRkdDbm55bWg3OHE0NzUrR1FmNDZ0S0wvaXd1MitU?=
 =?utf-8?B?b3lSYmlZazE2TUlGRVcxenJRaWx6c2lsQjBMQ2NyNitmN200QmRNcDhJcnJp?=
 =?utf-8?B?cUxhckREQ04zOGcvRXROK0owVmlPVkpUam41VzFSZVJJSmVxVHF1aUJOd2pa?=
 =?utf-8?B?Ni95U3p6dEFqT3ZTNTBGVW1jK2Y5NVhqa1h5NGdkd0tyQXRTTjlyaHpMSlFm?=
 =?utf-8?B?RjEwWWFFWHp2elVDeU9DNkxwRmdhM1NiVE5ubU80VGFBZnpxVEcwNVdUZHFP?=
 =?utf-8?B?cWQ0MnZDQllVUm4yaEJIelhIOTZtMkFJTTFrRlFFK09SMXJwMCtGNSsxV2tR?=
 =?utf-8?B?TVk1RDc2R3o2ZG9VM3c5cmwxWlQzclcvQVJMRW1JczlxdmxwbXVPVDhxZ0ps?=
 =?utf-8?B?TUdXdHFmK0NYMFVPbFg0bTJhczF0TWluVmg4SWZyb1VNaVJhS1YyS3lxU3ov?=
 =?utf-8?B?aEUzc1hyTUQyVGNTL2kwdkErOEM2dWxsbXpJc29WejNwSGVYNEhObGRrYk81?=
 =?utf-8?B?SVpCV29tVWtUTHJ1NHBtRUhVeXlrTE16NGZmelR0UHB5Qlc5UGFvQVBPVGg5?=
 =?utf-8?B?TGp2REIxVjdmT0ZBQ0VDeThBTkc2NDZ3cVZpdzhyWFRhZkEzbk5nZz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 660f76e1-6dd5-4255-c124-08de58cb1b48
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 08:57:29.5908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ys6jXpmviJJsZzClUpSTneNr6H9rMNbDX6Krp0e4YfAmKG+7dJWa6zTNqgN64AVlfuofn9ONu7wFq4HsAoAX6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7492

Adds the driver for communication interface to secure-enclave, that
enables exchanging messages with NXP secure enclave HW IP(s)
like EdgeLock Enclave, from:
- User-Space Applications via character driver.

ABI documentation for the NXP secure-enclave driver.

User-space library using this driver:
- i.MX Secure Enclave library:
  -- URL: https://github.com/nxp-imx/imx-secure-enclave.git,
- i.MX Secure Middle-Ware:
  -- URL: https://github.com/nxp-imx/imx-smw.git

Following checks are performed on the incoming msg-header,
to block exchanging invalid arbitrary commands:
- maximum allowed words,
- check if command-tag & response-tag are valid
- version,
- command id validation check, to allow limited base-line API(s)
  and restrict following:
  - exchanging power management commands.
  - reset requests.
  - BBSM configuration requests.
  - re-initializing the FW.
  - RNG init
  - CAAM resource release management
  - SE's internal memory management.
from user-space.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
Changes from v23 to v24
- fixes kernel bot reported warning errors.

temp

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 Documentation/ABI/testing/se-cdev   |  43 +++
 drivers/firmware/imx/ele_base_msg.c |  28 ++
 drivers/firmware/imx/ele_base_msg.h |  20 +
 drivers/firmware/imx/ele_common.c   |  37 +-
 drivers/firmware/imx/ele_common.h   |   6 +
 drivers/firmware/imx/se_ctrl.c      | 743 +++++++++++++++++++++++++++++++++++-
 drivers/firmware/imx/se_ctrl.h      |  33 ++
 include/uapi/linux/se_ioctl.h       |  97 +++++
 8 files changed, 995 insertions(+), 12 deletions(-)

diff --git a/Documentation/ABI/testing/se-cdev b/Documentation/ABI/testing/se-cdev
new file mode 100644
index 000000000000..dad39ffd245a
--- /dev/null
+++ b/Documentation/ABI/testing/se-cdev
@@ -0,0 +1,43 @@
+What:		/dev/<se>_mu[0-9]+_ch[0-9]+
+Date:		Mar 2025
+KernelVersion:	6.8
+Contact:	linux-imx@nxp.com, pankaj.gupta@nxp.com
+Description:
+		NXP offers multiple hardware IP(s) for secure enclaves like EdgeLock-
+		Enclave(ELE), SECO. The character device file descriptors
+		/dev/<se>_mu*_ch* are the interface between userspace NXP's secure-
+		enclave shared library and the kernel driver.
+
+		The ioctl(2)-based ABI is defined and documented in
+		[include]<linux/firmware/imx/ele_mu_ioctl.h>.
+		ioctl(s) are used primarily for:
+			- shared memory management
+			- allocation of I/O buffers
+			- getting mu info
+			- setting a dev-ctx as receiver to receive all the commands from FW
+			- getting SoC info
+			- send command and receive command response
+
+		The following file operations are supported:
+
+		open(2)
+		  Currently the only useful flags are O_RDWR.
+
+		read(2)
+		  Every read() from the opened character device context is waiting on
+		  wait_event_interruptible, that gets set by the registered mailbox callback
+		  function, indicating a message received from the firmware on message-
+		  unit.
+
+		write(2)
+		  Every write() to the opened character device context needs to acquire
+		  mailbox_lock before sending message on to the message unit.
+
+		close(2)
+		  Stops and frees up the I/O contexts that were associated
+		  with the file descriptor.
+
+Users:		https://github.com/nxp-imx/imx-secure-enclave.git,
+		https://github.com/nxp-imx/imx-smw.git
+		crypto/skcipher,
+		drivers/nvmem/imx-ocotp-ele.c
diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index 475ba98be199..23f68076b85c 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -15,6 +15,34 @@
 
 #define FW_DBG_DUMP_FIXED_STR		"ELE"
 
+int ele_uapi_allowed_base_cmd(struct se_if_priv *priv,
+			      struct se_msg_hdr *header)
+{
+	switch (header->command) {
+	case ELE_PING_REQ: return 0;
+	case ELE_DEBUG_DUMP_REQ: return 0;
+	case ELE_OEM_AUTH_CONTAINER_REQ: return 0;
+	case ELE_OEM_VERIFY_IMAGE_REQ: return 0;
+	case ELE_OEM_REL_CONTAINER_REQ: return 0;
+	case ELE_FW_LIFE_CYCLE_REQ: return 0;
+	case ELE_READ_FUSE_REQ: return 0;
+	case ELE_GET_FW_VERS_REQ: return 0;
+	case ELE_RETURN_LIFE_CYCLE_REQ: return 0;
+	case ELE_GET_EVENT_REQ: return 0;
+	case ELE_COMMIT_REQ: return 0;
+	case ELE_GEN_KEY_BLOB_REQ: return 0;
+	case ELE_GET_FW_STATUS_REQ: return 0;
+	case ELE_XIP_DECRYPT_REQ: return 0;
+	case ELE_WRITE_FUSE: return 0;
+	case ELE_GET_INFO_REQ: return 0;
+	case ELE_DEV_ATTEST_REQ: return 0;
+	case ELE_WRITE_SHADOW_FUSE_REQ: return 0;
+	case ELE_READ_SHADOW_FUSE_REQ: return 0;
+	default:
+		return -EACCES;
+	}
+}
+
 int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 {
 	dma_addr_t get_info_addr = 0;
diff --git a/drivers/firmware/imx/ele_base_msg.h b/drivers/firmware/imx/ele_base_msg.h
index 8e5b015e99a2..f8fabac331fd 100644
--- a/drivers/firmware/imx/ele_base_msg.h
+++ b/drivers/firmware/imx/ele_base_msg.h
@@ -15,6 +15,24 @@
 
 #define ELE_NONE_VAL			0x0
 
+
+#define ELE_OEM_AUTH_CONTAINER_REQ	0x87
+#define ELE_OEM_VERIFY_IMAGE_REQ	0x88
+#define ELE_OEM_REL_CONTAINER_REQ	0x89
+#define ELE_FW_LIFE_CYCLE_REQ		0x95
+#define ELE_READ_FUSE_REQ		0x97
+#define ELE_GET_FW_VERS_REQ		0x9d
+#define ELE_RETURN_LIFE_CYCLE_REQ	0xa0
+#define ELE_GET_EVENT_REQ		0xa2
+#define ELE_COMMIT_REQ			0xa8
+#define ELE_GEN_KEY_BLOB_REQ		0xaf
+#define ELE_GET_FW_STATUS_REQ		0xc5
+#define ELE_XIP_DECRYPT_REQ		0xc6
+#define ELE_WRITE_FUSE                  0xd6
+#define ELE_DEV_ATTEST_REQ              0xdb
+#define ELE_WRITE_SHADOW_FUSE_REQ       0xf2
+#define ELE_READ_SHADOW_FUSE_REQ        0xf3
+
 #define ELE_GET_INFO_REQ		0xda
 #define ELE_GET_INFO_REQ_MSG_SZ		0x10
 #define ELE_GET_INFO_RSP_MSG_SZ		0x08
@@ -92,4 +110,6 @@ int ele_service_swap(struct se_if_priv *priv, phys_addr_t addr,
 int ele_fw_authenticate(struct se_if_priv *priv, phys_addr_t contnr_addr,
 			phys_addr_t img_addr);
 int ele_debug_dump(struct se_if_priv *priv);
+int ele_uapi_allowed_base_cmd(struct se_if_priv *priv,
+			      struct se_msg_hdr *header);
 #endif
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index fcd0f561d72d..78440f62bf92 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -6,6 +6,23 @@
 #include "ele_base_msg.h"
 #include "ele_common.h"
 
+int se_chk_tx_msg_hdr(struct se_if_priv *priv, struct se_msg_hdr *header)
+{
+	if (!header->size || header->size > MAX_WORD_SIZE)
+		return -EINVAL;
+
+	if (header->tag != priv->if_defs->cmd_tag &&
+	    header->tag != priv->if_defs->rsp_tag)
+		return -EINVAL;
+
+	if (header->ver == priv->if_defs->base_api_ver)
+		return ele_uapi_allowed_base_cmd(priv, header);
+	else if (header->ver == priv->if_defs->fw_api_ver)
+		return 0;
+
+	return -EINVAL;
+}
+
 /*
  * se_get_msg_chksum() - to calculate checksum word by word.
  *
@@ -42,15 +59,22 @@ u32 se_get_msg_chksum(u32 *msg, u32 msg_len)
 	return chksum;
 }
 
+void set_se_rcv_msg_timeout(struct se_if_priv *priv, u32 timeout_ms)
+{
+	priv->se_rcv_msg_timeout_ms = timeout_ms;
+}
+
 int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl)
 {
-	unsigned long timeout;
+	unsigned long timeout_ms;
 	int ret;
 
 	do {
-		timeout = MAX_SCHEDULE_TIMEOUT;
+		timeout_ms = MAX_SCHEDULE_TIMEOUT;
+		if (dev_ctx->priv->cmd_receiver_clbk_hdl.dev_ctx != dev_ctx)
+			timeout_ms = msecs_to_jiffies(dev_ctx->priv->se_rcv_msg_timeout_ms);
 
-		ret = wait_for_completion_interruptible_timeout(&se_clbk_hdl->done, timeout);
+		ret = wait_for_completion_interruptible_timeout(&se_clbk_hdl->done, timeout_ms);
 		if (ret == -ERESTARTSYS) {
 			if (dev_ctx->priv->waiting_rsp_clbk_hdl.dev_ctx) {
 				dev_ctx->priv->waiting_rsp_clbk_hdl.signal_rcvd = true;
@@ -59,6 +83,13 @@ int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk
 			ret = -EINTR;
 			break;
 		}
+		if (ret == 0) {
+			ret = -ETIMEDOUT;
+			dev_err(dev_ctx->priv->dev,
+				"Fatal Error: SE interface: %s0, hangs indefinitely.\n",
+				get_se_if_name(dev_ctx->priv->if_defs->se_if_type));
+			break;
+		}
 		ret = se_clbk_hdl->rx_msg_sz;
 		break;
 	} while (ret < 0);
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
index 5bac14439d7d..bdc13d1b715d 100644
--- a/drivers/firmware/imx/ele_common.h
+++ b/drivers/firmware/imx/ele_common.h
@@ -12,6 +12,11 @@
 
 #define IMX_ELE_FW_DIR                 "imx/ele/"
 
+#define MAX_WORD_SIZE			0x20
+#define SE_RCV_MSG_DEFAULT_TIMEOUT	5000
+#define SE_RCV_MSG_LONG_TIMEOUT		5000000
+
+void set_se_rcv_msg_timeout(struct se_if_priv *priv, u32 val);
 u32 se_get_msg_chksum(u32 *msg, u32 msg_len);
 
 int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl);
@@ -42,4 +47,5 @@ int se_save_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem);
 
 int se_restore_imem_state(struct se_if_priv *priv, struct se_imem_buf *imem);
 
+int se_chk_tx_msg_hdr(struct se_if_priv *priv, struct se_msg_hdr *header);
 #endif /*__ELE_COMMON_H__ */
diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index f2ff1d77221b..db3f26e6b452 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/dev_printk.h>
@@ -25,6 +26,7 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/sys_soc.h>
+#include <uapi/linux/se_ioctl.h>
 
 #include "ele_base_msg.h"
 #include "ele_common.h"
@@ -34,12 +36,6 @@
 #define MBOX_TX_NAME			"tx"
 #define MBOX_RX_NAME			"rx"
 
-#define SE_TYPE_STR_DBG			"dbg"
-#define SE_TYPE_STR_HSM			"hsm"
-
-#define SE_TYPE_ID_DBG			0x1
-#define SE_TYPE_ID_HSM			0x2
-
 struct se_fw_img_name {
 	const u8 *prim_fw_nm_in_rfs;
 	const u8 *seco_fw_nm_in_rfs;
@@ -132,6 +128,13 @@ char *get_se_if_name(u8 se_if_id)
 	return NULL;
 }
 
+static u32 get_se_soc_id(struct se_if_priv *priv)
+{
+	const struct se_soc_info *se_info = device_get_match_data(priv->dev);
+
+	return se_info->soc_id;
+}
+
 static struct se_fw_load_info *get_load_fw_instance(struct se_if_priv *priv)
 {
 	return &var_se_info.load_fw;
@@ -205,8 +208,215 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
 	return 0;
 }
 
+static int load_firmware(struct se_if_priv *priv, const u8 *se_img_file_to_load)
+{
+	const struct firmware *fw = NULL;
+	dma_addr_t se_fw_dma_addr;
+	phys_addr_t se_fw_phyaddr;
+	u8 *se_fw_buf;
+	int ret;
+
+	if (!se_img_file_to_load) {
+		dev_err(priv->dev, "FW image is not provided.");
+		return -EINVAL;
+	}
+	ret = request_firmware(&fw, se_img_file_to_load, priv->dev);
+	if (ret)
+		return ret;
+
+	dev_info(priv->dev, "loading firmware %s.", se_img_file_to_load);
+
+	/* allocate buffer to store the SE FW */
+	se_fw_buf = dma_alloc_coherent(priv->dev, fw->size, &se_fw_dma_addr, GFP_KERNEL);
+	if (!se_fw_buf) {
+		ret = -ENOMEM;
+		goto exit;
+	}
+
+	memcpy(se_fw_buf, fw->data, fw->size);
+	se_fw_phyaddr = dma_to_phys(priv->dev, se_fw_dma_addr);
+	ret = ele_fw_authenticate(priv, se_fw_phyaddr, se_fw_phyaddr);
+	if (ret < 0) {
+		dev_err(priv->dev,
+			"Error %pe: Authenticate & load SE firmware %s.",
+			ERR_PTR(ret), se_img_file_to_load);
+		ret = -EPERM;
+	}
+	dma_free_coherent(priv->dev, fw->size, se_fw_buf, se_fw_dma_addr);
+exit:
+	release_firmware(fw);
+
+	return ret;
+}
+
+static int se_load_firmware(struct se_if_priv *priv)
+{
+	struct se_fw_load_info *load_fw = get_load_fw_instance(priv);
+	int ret = 0;
+
+	if (!load_fw->is_fw_tobe_loaded)
+		return 0;
+
+	if (load_fw->imem.state == ELE_IMEM_STATE_BAD) {
+		ret = load_firmware(priv, load_fw->se_fw_img_nm->prim_fw_nm_in_rfs);
+		if (ret) {
+			dev_err(priv->dev, "Failed to load boot firmware.");
+			return -EPERM;
+		}
+	}
+
+	ret = load_firmware(priv, load_fw->se_fw_img_nm->seco_fw_nm_in_rfs);
+	if (ret) {
+		dev_err(priv->dev, "Failed to load runtime firmware.");
+		return -EPERM;
+	}
+
+	load_fw->is_fw_tobe_loaded = false;
+
+	return ret;
+}
+
+static int init_se_shared_mem(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct se_if_priv *priv = dev_ctx->priv;
+
+	INIT_LIST_HEAD(&se_shared_mem_mgmt->pending_out);
+	INIT_LIST_HEAD(&se_shared_mem_mgmt->pending_in);
+
+	/*
+	 * Allocate some memory for data exchanges with S40x.
+	 * This will be used for data not requiring secure memory.
+	 */
+	se_shared_mem_mgmt->non_secure_mem.ptr =
+			dma_alloc_coherent(priv->dev, MAX_DATA_SIZE_PER_USER,
+					   &se_shared_mem_mgmt->non_secure_mem.dma_addr,
+					   GFP_KERNEL);
+	if (!se_shared_mem_mgmt->non_secure_mem.ptr)
+		return -ENOMEM;
+
+	se_shared_mem_mgmt->non_secure_mem.size = MAX_DATA_SIZE_PER_USER;
+	se_shared_mem_mgmt->non_secure_mem.pos = 0;
+
+	return 0;
+}
+
+static void cleanup_se_shared_mem(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct se_if_priv *priv = dev_ctx->priv;
+
+	/* Free non-secure shared buffer. */
+	dma_free_coherent(priv->dev, MAX_DATA_SIZE_PER_USER,
+			  se_shared_mem_mgmt->non_secure_mem.ptr,
+			  se_shared_mem_mgmt->non_secure_mem.dma_addr);
+
+	se_shared_mem_mgmt->non_secure_mem.ptr = NULL;
+	se_shared_mem_mgmt->non_secure_mem.dma_addr = 0;
+	se_shared_mem_mgmt->non_secure_mem.size = 0;
+	se_shared_mem_mgmt->non_secure_mem.pos = 0;
+}
+
+/* Need to copy the output data to user-device context.
+ */
+static int se_dev_ctx_cpy_out_data(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct se_if_priv *priv = dev_ctx->priv;
+	struct se_buf_desc *b_desc, *temp;
+	bool do_cpy = true;
+
+	list_for_each_entry_safe(b_desc, temp, &se_shared_mem_mgmt->pending_out, link) {
+		if (b_desc->usr_buf_ptr && b_desc->shared_buf_ptr && do_cpy) {
+			dev_dbg(priv->dev, "Copying output data to user.");
+			if (do_cpy && copy_to_user(b_desc->usr_buf_ptr,
+						   b_desc->shared_buf_ptr,
+						   b_desc->size)) {
+				dev_err(priv->dev, "Failure copying output data to user.");
+				do_cpy = false;
+			}
+		}
+
+		if (b_desc->shared_buf_ptr)
+			memset(b_desc->shared_buf_ptr, 0, b_desc->size);
+
+		list_del(&b_desc->link);
+		kfree(b_desc);
+	}
+
+	return do_cpy ? 0 : -EFAULT;
+}
+
+/*
+ * Clean the used Shared Memory space,
+ * whether its Input Data copied from user buffers, or
+ * Data received from FW.
+ */
+static void se_dev_ctx_shared_mem_cleanup(struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct list_head *pending_lists[] = {&se_shared_mem_mgmt->pending_in,
+						&se_shared_mem_mgmt->pending_out};
+	struct se_buf_desc *b_desc, *temp;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(pending_lists); i++) {
+		list_for_each_entry_safe(b_desc, temp, pending_lists[i], link) {
+			if (b_desc->shared_buf_ptr)
+				memset(b_desc->shared_buf_ptr, 0, b_desc->size);
+
+			list_del(&b_desc->link);
+			kfree(b_desc);
+		}
+	}
+	se_shared_mem_mgmt->non_secure_mem.pos = 0;
+}
+
+static int add_b_desc_to_pending_list(void *shared_ptr_with_pos,
+				      struct se_ioctl_setup_iobuf *io,
+				      struct se_if_device_ctx *dev_ctx)
+{
+	struct se_shared_mem_mgmt_info *se_shared_mem_mgmt = &dev_ctx->se_shared_mem_mgmt;
+	struct se_buf_desc *b_desc;
+
+	b_desc = kzalloc(sizeof(*b_desc), GFP_KERNEL);
+	if (!b_desc)
+		return -ENOMEM;
+
+	b_desc->shared_buf_ptr = shared_ptr_with_pos;
+	b_desc->usr_buf_ptr = io->user_buf;
+	b_desc->size = io->length;
+
+	if (io->flags & SE_IO_BUF_FLAGS_IS_INPUT) {
+		/*
+		 * buffer is input:
+		 * add an entry in the "pending input buffers" list so
+		 * that copied data can be cleaned from shared memory
+		 * later.
+		 */
+		list_add_tail(&b_desc->link, &se_shared_mem_mgmt->pending_in);
+	} else {
+		/*
+		 * buffer is output:
+		 * add an entry in the "pending out buffers" list so data
+		 * can be copied to user space when receiving Secure-Enclave
+		 * response.
+		 */
+		list_add_tail(&b_desc->link, &se_shared_mem_mgmt->pending_out);
+	}
+
+	return 0;
+}
+
+/* interface for managed res to unregister a character device */
+static void if_misc_deregister(void *miscdevice)
+{
+	misc_deregister(miscdevice);
+}
+
 static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
-				    struct se_if_device_ctx **new_dev_ctx)
+				    struct se_if_device_ctx **new_dev_ctx,
+				    const struct file_operations *se_if_fops)
 {
 	struct se_if_device_ctx *dev_ctx;
 	int ret = 0;
@@ -222,12 +432,516 @@ static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
 	if (!dev_ctx->devname)
 		return -ENOMEM;
 
+	mutex_init(&dev_ctx->fops_lock);
+
+	dev_ctx->priv = priv;
+	*new_dev_ctx = dev_ctx;
+
+	dev_ctx->miscdev = devm_kzalloc(priv->dev, sizeof(*dev_ctx->miscdev), GFP_KERNEL);
+	if (!dev_ctx->miscdev) {
+		*new_dev_ctx = NULL;
+		return -ENOMEM;
+	}
+
+	dev_ctx->miscdev->name = dev_ctx->devname;
+	dev_ctx->miscdev->minor = MISC_DYNAMIC_MINOR;
+	dev_ctx->miscdev->fops = se_if_fops;
+	dev_ctx->miscdev->parent = priv->dev;
+	ret = misc_register(dev_ctx->miscdev);
+	if (ret)
+		return dev_err_probe(priv->dev, ret, "Failed to register misc device.");
+
+	ret = devm_add_action_or_reset(priv->dev, if_misc_deregister, dev_ctx->miscdev);
+	if (ret)
+		return dev_err_probe(priv->dev, ret,
+				     "Failed to add action to the misc-dev.");
+	return ret;
+}
+
+static int init_device_context(struct se_if_priv *priv, int ch_id,
+			       struct se_if_device_ctx **new_dev_ctx)
+{
+	struct se_if_device_ctx *dev_ctx;
+	int ret = 0;
+
+	dev_ctx = kzalloc(sizeof(*dev_ctx), GFP_KERNEL);
+
+	if (!dev_ctx)
+		return -ENOMEM;
+
+	dev_ctx->devname = kasprintf(GFP_KERNEL, "%s0_ch%d",
+				     get_se_if_name(priv->if_defs->se_if_type),
+				     ch_id);
+	if (!dev_ctx->devname) {
+		kfree(dev_ctx);
+		return -ENOMEM;
+	}
+
+	mutex_init(&dev_ctx->fops_lock);
 	dev_ctx->priv = priv;
 	*new_dev_ctx = dev_ctx;
 
+	list_add_tail(&dev_ctx->link, &priv->dev_ctx_list);
+	priv->active_devctx_count++;
+
+	ret = init_se_shared_mem(dev_ctx);
+	if (ret < 0) {
+		kfree(dev_ctx->devname);
+		kfree(dev_ctx);
+		*new_dev_ctx = NULL;
+	}
+
 	return ret;
 }
 
+static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev_ctx,
+					    u64 arg)
+{
+	struct se_ioctl_cmd_snd_rcv_rsp_info cmd_snd_rcv_rsp_info = {0};
+	struct se_if_priv *priv = dev_ctx->priv;
+	int err = 0;
+
+	if (copy_from_user(&cmd_snd_rcv_rsp_info, (u8 __user *)arg,
+			   sizeof(cmd_snd_rcv_rsp_info))) {
+		dev_err(priv->dev,
+			"%s: Failed to copy cmd_snd_rcv_rsp_info from user.",
+			dev_ctx->devname);
+		err = -EFAULT;
+		goto exit;
+	}
+
+	if (cmd_snd_rcv_rsp_info.tx_buf_sz < SE_MU_HDR_SZ) {
+		dev_err(priv->dev, "%s: User buffer too small(%d < %d)",
+			dev_ctx->devname, cmd_snd_rcv_rsp_info.tx_buf_sz, SE_MU_HDR_SZ);
+		err = -ENOSPC;
+		goto exit;
+	}
+
+	err = se_chk_tx_msg_hdr(priv, (struct se_msg_hdr *)cmd_snd_rcv_rsp_info.tx_buf);
+	if (err)
+		goto exit;
+
+	struct se_api_msg *rx_msg __free(kfree) =
+		kzalloc(cmd_snd_rcv_rsp_info.rx_buf_sz, GFP_KERNEL);
+	if (!rx_msg) {
+		err = -ENOMEM;
+		goto exit;
+	}
+
+	struct se_api_msg *tx_msg __free(kfree) =
+		memdup_user(cmd_snd_rcv_rsp_info.tx_buf,
+			    cmd_snd_rcv_rsp_info.tx_buf_sz);
+	if (IS_ERR(tx_msg)) {
+		err = PTR_ERR(tx_msg);
+		goto exit;
+	}
+
+	if (tx_msg->header.tag != priv->if_defs->cmd_tag) {
+		err = -EINVAL;
+		goto exit;
+	}
+
+	if (tx_msg->header.ver == priv->if_defs->fw_api_ver &&
+	    get_load_fw_instance(priv)->is_fw_tobe_loaded) {
+		err = se_load_firmware(priv);
+		if (err) {
+			dev_err(priv->dev, "Could not send msg as FW is not loaded.");
+			err = -EPERM;
+			goto exit;
+		}
+	}
+	set_se_rcv_msg_timeout(priv, SE_RCV_MSG_LONG_TIMEOUT);
+
+	err = ele_msg_send_rcv(dev_ctx, tx_msg, cmd_snd_rcv_rsp_info.tx_buf_sz,
+			       rx_msg, cmd_snd_rcv_rsp_info.rx_buf_sz);
+	if (err < 0)
+		goto exit;
+
+	dev_dbg(priv->dev, "%s: %s %s.", dev_ctx->devname, __func__,
+		"message received, start transmit to user");
+
+	/* We may need to copy the output data to user before
+	 * delivering the completion message.
+	 */
+	err = se_dev_ctx_cpy_out_data(dev_ctx);
+	if (err < 0)
+		goto exit;
+
+	/* Copy data from the buffer */
+	print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4, rx_msg,
+			     cmd_snd_rcv_rsp_info.rx_buf_sz, false);
+
+	if (copy_to_user(cmd_snd_rcv_rsp_info.rx_buf, rx_msg,
+			 cmd_snd_rcv_rsp_info.rx_buf_sz)) {
+		dev_err(priv->dev, "%s: Failed to copy to user.", dev_ctx->devname);
+		err = -EFAULT;
+	}
+
+exit:
+
+	/* shared memory is allocated before this IOCTL */
+	se_dev_ctx_shared_mem_cleanup(dev_ctx);
+
+	if (copy_to_user((void __user *)arg, &cmd_snd_rcv_rsp_info,
+			 sizeof(cmd_snd_rcv_rsp_info))) {
+		dev_err(priv->dev, "%s: Failed to copy cmd_snd_rcv_rsp_info from user.",
+			dev_ctx->devname);
+		err = -EFAULT;
+	}
+
+	return err;
+}
+
+static int se_ioctl_get_mu_info(struct se_if_device_ctx *dev_ctx,
+				u64 arg)
+{
+	struct se_if_priv *priv = dev_ctx->priv;
+	struct se_ioctl_get_if_info if_info;
+	struct se_if_node *if_node;
+	int err = 0;
+
+	if_node = container_of(priv->if_defs, typeof(*if_node), if_defs);
+
+	if_info.se_if_id = 0;
+	if_info.interrupt_idx = 0;
+	if_info.tz = 0;
+	if_info.did = 0;
+	if_info.cmd_tag = priv->if_defs->cmd_tag;
+	if_info.rsp_tag = priv->if_defs->rsp_tag;
+	if_info.success_tag = priv->if_defs->success_tag;
+	if_info.base_api_ver = priv->if_defs->base_api_ver;
+	if_info.fw_api_ver = priv->if_defs->fw_api_ver;
+
+	dev_dbg(priv->dev, "%s: info [se_if_id: %d, irq_idx: %d, tz: 0x%x, did: 0x%x].",
+		dev_ctx->devname, if_info.se_if_id, if_info.interrupt_idx, if_info.tz,
+		if_info.did);
+
+	if (copy_to_user((u8 __user *)arg, &if_info, sizeof(if_info))) {
+		dev_err(priv->dev, "%s: Failed to copy mu info to user.",
+			dev_ctx->devname);
+		err = -EFAULT;
+	}
+
+	return err;
+}
+
+/*
+ * Copy a buffer of data to/from the user and return the address to use in
+ * messages
+ */
+static int se_ioctl_setup_iobuf_handler(struct se_if_device_ctx *dev_ctx,
+					u64 arg)
+{
+	struct se_shared_mem *shared_mem = NULL;
+	struct se_ioctl_setup_iobuf io = {0};
+	int err = 0;
+	u32 pos;
+
+	if (copy_from_user(&io, (u8 __user *)arg, sizeof(io))) {
+		dev_err(dev_ctx->priv->dev, "%s: Failed copy iobuf config from user.",
+			dev_ctx->devname);
+		return -EFAULT;
+	}
+
+	dev_dbg(dev_ctx->priv->dev, "%s: io [buf: %p(%d) flag: %x].", dev_ctx->devname,
+		io.user_buf, io.length, io.flags);
+
+	if (io.length == 0 || !io.user_buf) {
+		/*
+		 * Accept NULL pointers since some buffers are optional
+		 * in FW commands. In this case we should return 0 as
+		 * pointer to be embedded into the message.
+		 * Skip all data copy part of code below.
+		 */
+		io.ele_addr = 0;
+		goto copy;
+	}
+
+	/* No specific requirement for this buffer. */
+	shared_mem = &dev_ctx->se_shared_mem_mgmt.non_secure_mem;
+
+	/* Check there is enough space in the shared memory. */
+	dev_dbg(dev_ctx->priv->dev, "%s: req_size = %d, max_size= %d, curr_pos = %d",
+		dev_ctx->devname, round_up(io.length, 8u), shared_mem->size,
+		shared_mem->pos);
+
+	if (shared_mem->size < shared_mem->pos ||
+	    round_up(io.length, 8u) > (shared_mem->size - shared_mem->pos)) {
+		dev_err(dev_ctx->priv->dev, "%s: Not enough space in shared memory.",
+			dev_ctx->devname);
+		return -ENOMEM;
+	}
+
+	/* Allocate space in shared memory. 8 bytes aligned. */
+	pos = shared_mem->pos;
+	shared_mem->pos += round_up(io.length, 8u);
+	io.ele_addr = (u64)shared_mem->dma_addr + pos;
+
+	memset(shared_mem->ptr + pos, 0, io.length);
+	if ((io.flags & SE_IO_BUF_FLAGS_IS_INPUT) ||
+	    (io.flags & SE_IO_BUF_FLAGS_IS_IN_OUT)) {
+		/*
+		 * buffer is input:
+		 * copy data from user space to this allocated buffer.
+		 */
+		if (copy_from_user(shared_mem->ptr + pos, io.user_buf, io.length)) {
+			dev_err(dev_ctx->priv->dev,
+				"%s: Failed copy data to shared memory.",
+				dev_ctx->devname);
+			return -EFAULT;
+		}
+	}
+
+	err = add_b_desc_to_pending_list(shared_mem->ptr + pos, &io, dev_ctx);
+	if (err < 0)
+		dev_err(dev_ctx->priv->dev, "%s: Failed to allocate/link b_desc.",
+			dev_ctx->devname);
+
+copy:
+	/* Provide the EdgeLock Enclave address to user space only if success.*/
+	if (copy_to_user((u8 __user *)arg, &io, sizeof(io))) {
+		dev_err(dev_ctx->priv->dev, "%s: Failed to copy iobuff setup to user.",
+			dev_ctx->devname);
+		err = -EFAULT;
+	}
+
+	return err;
+}
+
+/* IOCTL to provide SoC information */
+static int se_ioctl_get_se_soc_info_handler(struct se_if_device_ctx *dev_ctx, u64 arg)
+{
+	struct se_ioctl_get_soc_info soc_info;
+	int err = -EINVAL;
+
+	soc_info.soc_id = get_se_soc_id(dev_ctx->priv);
+	soc_info.soc_rev = var_se_info.soc_rev;
+
+	err = copy_to_user((u8 __user *)arg, (u8 *)(&soc_info), sizeof(soc_info));
+	if (err) {
+		dev_err(dev_ctx->priv->dev, "%s: Failed to copy soc info to user.",
+			dev_ctx->devname);
+		err = -EFAULT;
+	}
+
+	return err;
+}
+
+/*
+ * File operations for user-space
+ */
+
+/* Write a message to the MU. */
+static ssize_t se_if_fops_write(struct file *fp, const char __user *buf,
+				size_t size, loff_t *ppos)
+{
+	struct se_if_device_ctx *dev_ctx = fp->private_data;
+	struct se_if_priv *priv = dev_ctx->priv;
+	int err;
+
+	dev_dbg(priv->dev, "%s: write from buf (%p)%zu, ppos=%lld.", dev_ctx->devname,
+		buf, size, ((ppos) ? *ppos : 0));
+
+	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
+		if (dev_ctx != priv->cmd_receiver_clbk_hdl.dev_ctx)
+			return -EINVAL;
+
+		err = se_chk_tx_msg_hdr(priv, (struct se_msg_hdr *)buf);
+		if (err)
+			return err;
+
+		if (size < SE_MU_HDR_SZ) {
+			dev_err(priv->dev, "%s: User buffer too small(%zu < %d).",
+				dev_ctx->devname, size, SE_MU_HDR_SZ);
+			return -ENOSPC;
+		}
+
+		struct se_api_msg *tx_msg __free(kfree) = memdup_user(buf, size);
+		if (IS_ERR(tx_msg))
+			return PTR_ERR(tx_msg);
+
+		print_hex_dump_debug("from user ", DUMP_PREFIX_OFFSET, 4, 4,
+				     tx_msg, size, false);
+
+		err = ele_msg_send(dev_ctx, tx_msg, size);
+
+		return err;
+	}
+}
+
+/*
+ * Read a message from the MU.
+ * Blocking until a message is available.
+ */
+static ssize_t se_if_fops_read(struct file *fp, char __user *buf, size_t size,
+			       loff_t *ppos)
+{
+	struct se_if_device_ctx *dev_ctx = fp->private_data;
+	struct se_if_priv *priv = dev_ctx->priv;
+	int err;
+
+	dev_dbg(priv->dev, "%s: read to buf %p(%zu), ppos=%lld.", dev_ctx->devname,
+		buf, size, ((ppos) ? *ppos : 0));
+
+	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
+		if (dev_ctx != priv->cmd_receiver_clbk_hdl.dev_ctx) {
+			err = -EINVAL;
+			goto exit;
+		}
+
+		err = ele_msg_rcv(dev_ctx, &priv->cmd_receiver_clbk_hdl);
+		if (err < 0) {
+			dev_err(priv->dev, "%s: Err[0x%x]:Interrupted by signal."
+				"Current active dev-ctx count = %d.",
+				dev_ctx->devname, err, dev_ctx->priv->active_devctx_count);
+			goto exit;
+		}
+
+		/* We may need to copy the output data to user before
+		 * delivering the completion message.
+		 */
+		err = se_dev_ctx_cpy_out_data(dev_ctx);
+		if (err < 0)
+			goto exit;
+
+		/* Copy data from the buffer */
+		print_hex_dump_debug("to user ", DUMP_PREFIX_OFFSET, 4, 4,
+				     priv->cmd_receiver_clbk_hdl.rx_msg,
+				     priv->cmd_receiver_clbk_hdl.rx_msg_sz,
+				     false);
+
+		if (copy_to_user(buf, priv->cmd_receiver_clbk_hdl.rx_msg,
+				 priv->cmd_receiver_clbk_hdl.rx_msg_sz)) {
+			dev_err(priv->dev, "%s: Failed to copy to user.",
+				dev_ctx->devname);
+			err = -EFAULT;
+		} else {
+			err = priv->cmd_receiver_clbk_hdl.rx_msg_sz;
+		}
+exit:
+		priv->cmd_receiver_clbk_hdl.rx_msg_sz = 0;
+
+		se_dev_ctx_shared_mem_cleanup(dev_ctx);
+
+		return err;
+	}
+}
+
+/* Open a character device. */
+static int se_if_fops_open(struct inode *nd, struct file *fp)
+{
+	struct miscdevice *miscdev = fp->private_data;
+	struct se_if_device_ctx *misc_dev_ctx;
+	struct se_if_device_ctx *dev_ctx;
+	struct se_if_priv *priv;
+	int err = 0;
+
+	priv = dev_get_drvdata(miscdev->parent);
+	misc_dev_ctx = priv->priv_dev_ctx;
+
+	scoped_cond_guard(mutex_intr, return -EBUSY, &misc_dev_ctx->fops_lock) {
+		priv->dev_ctx_mono_count++;
+		err = init_device_context(priv,
+					  priv->dev_ctx_mono_count ?
+					  priv->dev_ctx_mono_count
+					  : priv->dev_ctx_mono_count++,
+					  &dev_ctx);
+		if (err)
+			dev_err(priv->dev, "Failed[0x%x] to create dev-ctx.", err);
+		else
+			fp->private_data = dev_ctx;
+
+		return err;
+	}
+}
+
+/* Close a character device. */
+static int se_if_fops_close(struct inode *nd, struct file *fp)
+{
+	struct se_if_device_ctx *dev_ctx = fp->private_data;
+	struct se_if_priv *priv = dev_ctx->priv;
+
+	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
+		/* check if this device was registered as command receiver. */
+		if (priv->cmd_receiver_clbk_hdl.dev_ctx == dev_ctx) {
+			priv->cmd_receiver_clbk_hdl.dev_ctx = NULL;
+			kfree(priv->cmd_receiver_clbk_hdl.rx_msg);
+			priv->cmd_receiver_clbk_hdl.rx_msg = NULL;
+		}
+
+		se_dev_ctx_shared_mem_cleanup(dev_ctx);
+		cleanup_se_shared_mem(dev_ctx);
+
+		priv->active_devctx_count--;
+		list_del(&dev_ctx->link);
+
+		kfree(dev_ctx->devname);
+		kfree(dev_ctx);
+	}
+
+	return 0;
+}
+
+/* IOCTL entry point of a character device */
+static long se_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
+{
+	struct se_if_device_ctx *dev_ctx = fp->private_data;
+	struct se_if_priv *priv = dev_ctx->priv;
+	long err;
+
+	/* Prevent race during change of device context */
+	scoped_cond_guard(mutex_intr, return -EBUSY, &dev_ctx->fops_lock) {
+		switch (cmd) {
+		case SE_IOCTL_ENABLE_CMD_RCV:
+			if (!priv->cmd_receiver_clbk_hdl.dev_ctx) {
+				if (!priv->cmd_receiver_clbk_hdl.rx_msg) {
+					priv->cmd_receiver_clbk_hdl.rx_msg =
+						kzalloc(MAX_NVM_MSG_LEN,
+							GFP_KERNEL);
+					if (!priv->cmd_receiver_clbk_hdl.rx_msg) {
+						err = -ENOMEM;
+						break;
+					}
+				}
+				priv->cmd_receiver_clbk_hdl.rx_msg_sz = MAX_NVM_MSG_LEN;
+				priv->cmd_receiver_clbk_hdl.dev_ctx = dev_ctx;
+				err = 0;
+			} else {
+				err = -EBUSY;
+			}
+			break;
+		case SE_IOCTL_GET_MU_INFO:
+			err = se_ioctl_get_mu_info(dev_ctx, arg);
+			break;
+		case SE_IOCTL_SETUP_IOBUF:
+			err = se_ioctl_setup_iobuf_handler(dev_ctx, arg);
+			break;
+		case SE_IOCTL_GET_SOC_INFO:
+			err = se_ioctl_get_se_soc_info_handler(dev_ctx, arg);
+			break;
+		case SE_IOCTL_CMD_SEND_RCV_RSP:
+			err = se_ioctl_cmd_snd_rcv_rsp_handler(dev_ctx, arg);
+			break;
+		default:
+			err = -EINVAL;
+			dev_dbg(priv->dev, "%s: IOCTL %.8x not supported.",
+				dev_ctx->devname, cmd);
+		}
+	}
+
+	return err;
+}
+
+/* Char driver setup */
+static const struct file_operations se_if_fops = {
+	.open		= se_if_fops_open,
+	.owner		= THIS_MODULE,
+	.release	= se_if_fops_close,
+	.unlocked_ioctl = se_ioctl,
+	.read		= se_if_fops_read,
+	.write		= se_if_fops_write,
+};
+
 /* interface for managed res to free a mailbox channel */
 static void if_mbox_free_channel(void *mbox_chan)
 {
@@ -248,7 +962,7 @@ static int se_if_request_channel(struct device *dev, struct mbox_chan **chan,
 	ret = devm_add_action_or_reset(dev, if_mbox_free_channel, t_chan);
 	if (ret)
 		return dev_err_probe(dev, -EPERM,
-				     "Failed to add-action for removal of mbox: %s\n",
+				     "Failed to add-action for removal of mbox: %s.",
 				     name);
 	*chan = t_chan;
 
@@ -257,6 +971,7 @@ static int se_if_request_channel(struct device *dev, struct mbox_chan **chan,
 
 static void se_if_probe_cleanup(void *plat_dev)
 {
+	struct se_if_device_ctx *dev_ctx, *t_dev_ctx;
 	struct platform_device *pdev = plat_dev;
 	struct se_fw_load_info *load_fw;
 	struct device *dev = &pdev->dev;
@@ -281,6 +996,13 @@ static void se_if_probe_cleanup(void *plat_dev)
 		load_fw->imem.buf = NULL;
 	}
 
+	if (priv->dev_ctx_mono_count) {
+		list_for_each_entry_safe(dev_ctx, t_dev_ctx, &priv->dev_ctx_list, link) {
+			list_del(&dev_ctx->link);
+			priv->active_devctx_count--;
+		}
+	}
+
 	/*
 	 * No need to check, if reserved memory is allocated
 	 * before calling for its release. Or clearing the
@@ -322,6 +1044,7 @@ static int se_if_probe(struct platform_device *pdev)
 	priv->se_mb_cl.tx_block		= false;
 	priv->se_mb_cl.knows_txdone	= true;
 	priv->se_mb_cl.rx_callback	= se_if_rx_callback;
+	set_se_rcv_msg_timeout(priv, SE_RCV_MSG_DEFAULT_TIMEOUT);
 
 	ret = se_if_request_channel(dev, &priv->tx_chan, &priv->se_mb_cl, MBOX_TX_NAME);
 	if (ret)
@@ -343,6 +1066,7 @@ static int se_if_probe(struct platform_device *pdev)
 					     "Unable to get sram pool = %s.",
 					     if_node->pool_name);
 	}
+	INIT_LIST_HEAD(&priv->dev_ctx_list);
 
 	if (if_node->reserved_dma_ranges) {
 		ret = of_reserved_mem_device_init(dev);
@@ -351,7 +1075,7 @@ static int se_if_probe(struct platform_device *pdev)
 					    "Failed to init reserved memory region.");
 	}
 
-	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
+	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx, &se_if_fops);
 	if (ret)
 		return dev_err_probe(dev, ret,
 				     "Failed[0x%x] to create device contexts.",
@@ -393,6 +1117,7 @@ static int se_suspend(struct device *dev)
 	struct se_fw_load_info *load_fw;
 	int ret = 0;
 
+	set_se_rcv_msg_timeout(priv, SE_RCV_MSG_DEFAULT_TIMEOUT);
 	load_fw = get_load_fw_instance(priv);
 
 	if (load_fw->imem_mgmt) {
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
index fdb820458f85..7f9b0d199cfc 100644
--- a/drivers/firmware/imx/se_ctrl.h
+++ b/drivers/firmware/imx/se_ctrl.h
@@ -15,6 +15,7 @@
 #define SE_MSG_WORD_SZ			0x4
 
 #define RES_STATUS(x)			FIELD_GET(0x000000ff, x)
+#define MAX_DATA_SIZE_PER_USER		(65 * 1024)
 #define MAX_NVM_MSG_LEN			(256)
 #define MESSAGING_VERSION_6		0x6
 #define MESSAGING_VERSION_7		0x7
@@ -38,10 +39,38 @@ struct se_imem_buf {
 	u32 state;
 };
 
+struct se_buf_desc {
+	u8 *shared_buf_ptr;
+	void __user *usr_buf_ptr;
+	u32 size;
+	struct list_head link;
+};
+
+struct se_shared_mem {
+	dma_addr_t dma_addr;
+	u32 size;
+	u32 pos;
+	u8 *ptr;
+};
+
+struct se_shared_mem_mgmt_info {
+	struct list_head pending_in;
+	struct list_head pending_out;
+
+	struct se_shared_mem non_secure_mem;
+};
+
 /* Private struct for each char device instance. */
 struct se_if_device_ctx {
 	struct se_if_priv *priv;
+	struct miscdevice *miscdev;
 	const char *devname;
+
+	/* process one file operation at a time. */
+	struct mutex fops_lock;
+
+	struct se_shared_mem_mgmt_info se_shared_mem_mgmt;
+	struct list_head link;
 };
 
 /* Header of the messages exchange with the EdgeLock Enclave */
@@ -90,6 +119,10 @@ struct se_if_priv {
 	const struct se_if_defines *if_defs;
 
 	struct se_if_device_ctx *priv_dev_ctx;
+	struct list_head dev_ctx_list;
+	u32 active_devctx_count;
+	u32 dev_ctx_mono_count;
+	u32 se_rcv_msg_timeout_ms;
 };
 
 char *get_se_if_name(u8 se_if_id);
diff --git a/include/uapi/linux/se_ioctl.h b/include/uapi/linux/se_ioctl.h
new file mode 100644
index 000000000000..0c948bdc8c26
--- /dev/null
+++ b/include/uapi/linux/se_ioctl.h
@@ -0,0 +1,97 @@
+/* SPDX-License-Identifier: (GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause*/
+/*
+ * Copyright 2025 NXP
+ */
+
+#ifndef SE_IOCTL_H
+#define SE_IOCTL_H
+
+#include <linux/types.h>
+
+#define SE_TYPE_STR_DBG			"dbg"
+#define SE_TYPE_STR_HSM			"hsm"
+#define SE_TYPE_ID_UNKWN		0x0
+#define SE_TYPE_ID_DBG			0x1
+#define SE_TYPE_ID_HSM			0x2
+/* IOCTL definitions. */
+
+struct se_ioctl_setup_iobuf {
+	void __user *user_buf;
+	__u32 length;
+	__u32 flags;
+	__u64 ele_addr;
+};
+
+struct se_ioctl_shared_mem_cfg {
+	__u32 base_offset;
+	__u32 size;
+};
+
+struct se_ioctl_get_if_info {
+	__u8 se_if_id;
+	__u8 interrupt_idx;
+	__u8 tz;
+	__u8 did;
+	__u8 cmd_tag;
+	__u8 rsp_tag;
+	__u8 success_tag;
+	__u8 base_api_ver;
+	__u8 fw_api_ver;
+};
+
+struct se_ioctl_cmd_snd_rcv_rsp_info {
+	__u32 __user *tx_buf;
+	int tx_buf_sz;
+	__u32 __user *rx_buf;
+	int rx_buf_sz;
+};
+
+struct se_ioctl_get_soc_info {
+	__u16 soc_id;
+	__u16 soc_rev;
+};
+
+/* IO Buffer Flags */
+#define SE_IO_BUF_FLAGS_IS_OUTPUT	(0x00u)
+#define SE_IO_BUF_FLAGS_IS_INPUT	(0x01u)
+#define SE_IO_BUF_FLAGS_USE_SEC_MEM	(0x02u)
+#define SE_IO_BUF_FLAGS_USE_SHORT_ADDR	(0x04u)
+#define SE_IO_BUF_FLAGS_IS_IN_OUT	(0x10u)
+
+/* IOCTLS */
+#define SE_IOCTL			0x0A /* like MISC_MAJOR. */
+
+/*
+ * ioctl to designated the current fd as logical-reciever.
+ * This is ioctl is send when the nvm-daemon, a slave to the
+ * firmware is started by the user.
+ */
+#define SE_IOCTL_ENABLE_CMD_RCV	_IO(SE_IOCTL, 0x01)
+
+/*
+ * ioctl to get the buffer allocated from the memory, which is shared
+ * between kernel and FW.
+ * Post allocation, the kernel tagged the allocated memory with:
+ *  Output
+ *  Input
+ *  Input-Output
+ *  Short address
+ *  Secure-memory
+ */
+#define SE_IOCTL_SETUP_IOBUF	_IOWR(SE_IOCTL, 0x03, struct se_ioctl_setup_iobuf)
+
+/*
+ * ioctl to get the mu information, that is used to exchange message
+ * with FW, from user-spaced.
+ */
+#define SE_IOCTL_GET_MU_INFO	_IOR(SE_IOCTL, 0x04, struct se_ioctl_get_if_info)
+/*
+ * ioctl to get SoC Info from user-space.
+ */
+#define SE_IOCTL_GET_SOC_INFO      _IOR(SE_IOCTL, 0x06, struct se_ioctl_get_soc_info)
+
+/*
+ * ioctl to send command and receive response from user-space.
+ */
+#define SE_IOCTL_CMD_SEND_RCV_RSP _IOWR(SE_IOCTL, 0x07, struct se_ioctl_cmd_snd_rcv_rsp_info)
+#endif

-- 
2.43.0

