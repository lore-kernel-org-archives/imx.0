Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011025.outbound.protection.outlook.com [52.101.65.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A0420DD48
	for <imx@lists.linux.dev>; Thu, 18 Dec 2025 07:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766041383; cv=fail; b=G4lXDeq0vZJa3s/K+AQtXAVd3/oNeg+/+ImqsrquJqoY0BmSJRVFWpqrIP56sG8DxHIqdZnfRlIPKlsZ83bic8qplXhrb/YXmzetYj/p+HufBCtVf+mY4kx7WS0zyUYc0kfcnLE1bXimoeHO2gpxWqR6WGvrdSPYBcnsCCfiG58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766041383; c=relaxed/simple;
	bh=OGudE4kvJKIcCujWbKnAIhMZmTCfUNyT1XKn//TVFvM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Ypo7dnYbZAJcamG1dnLR6OQc3D0aul7Si5UV3xe4Tga7GO4C4+mKlxvmLRR1bpVS3bsW3kTqAhSG1Qz13A4Tnnq247bURBQoRNaQA6NI2yCR3AFN2wtzyb9iBAU5q5DEFXKVBzf0Ky1x67irPGAOsIIZaSTuc7ct3eo3Zm/xb2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZHKHjP4B; arc=fail smtp.client-ip=52.101.65.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZHKHjP4B"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QArNmLl1Gl4NRRm84Ku7bRtTjsMpSZVsYus2l/IehNTPAzgZye/YsG//IvgezlI1PzpSnzR10Avf70uqaufakJvbfB4V5277W0NOcJCYYuCgVbsk0dHt8q1JWIOKoyGngLXpHsDjMtWXrTk4r/gVQJpmSzZTNDNwaDv/9kiiavJou7B3HNfrz/Bd3gbczTTtoqg0ZfSZUVPDfGWM2uz7bE0nls0DAwh7e266yykTmemAjsilr8S5XVKRI/TsQZQNQ3pI5wjXCSt6oQlG5AxxMeq0tbnIufzUr/1ogbJ+aEFCXZ34Cd2gZvZUdVfUlbEKqXBGcIUXGxdKo9xVwG+d7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHnyxSzA6BjHjJU5k0LoH5zEz6gkN1C0oKNPwGlk8AY=;
 b=Xzzq2t/WfSqnGXfpY8KMt9jIIbU7RZtXy3cX0PMLQMls15v1Da5BJ/pY5Z0j8vrR4K/ZObytkDf7p9ES3C66MLWaEQE/QW7vhIrjNbrr633E0Ekwbzt114GP6q/5I1yB0ZXqMOfrDlNRUuVsANgrUfyLpKtJofAHee5P8vLUuuuBi2l8dG11JpBQzHvMa9wyldPT3Ebq4lzjzYxbNaKhcIZD/SUa7L1NxZbWw61K1miS86DSVBRe7bdvLIju/YPr97WCCCLi2kHkpG1uEzRX40qSivjlj+PIcYDM7W71wrPl83udmSluU+eS1yp6HOx8ikVdKm3bLiBPdAciNRCnSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHnyxSzA6BjHjJU5k0LoH5zEz6gkN1C0oKNPwGlk8AY=;
 b=ZHKHjP4B9yY2TO4cNqlgJ3r4eGQWVXmTmJBnxXsxmR5s534MW325OKWfiAmobxb0kwl2M9nZ01GsjZE4YN0hTMYRwX+EtKHCRnMzso3JYz3FDezo3tkR/IPjNC9ERycssh3I8+ErCHjfWkELxCAyTrFSiC9kp3B30LEvl8ai16DTj1LLJ8DOAhA4wwBUuSWe7QXFAV7GHFkmnhTqzg/a1usRqxp+oiB5OIMXYRPphvHfLBz50Ront1tomGv6Af0vgKxmVuGgSwPxo3i6ZwTyfEsZKLzUFtzou+vF1v/tfmbL6h7UoEY+9XVQi3pl4GYVjwv74+BJWWix7OYNHq39kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8599.eurprd04.prod.outlook.com (2603:10a6:10:2da::7)
 by DBBPR04MB7756.eurprd04.prod.outlook.com (2603:10a6:10:1e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 06:47:50 +0000
Received: from DU2PR04MB8599.eurprd04.prod.outlook.com
 ([fe80::c32a:2bd1:a6c0:601]) by DU2PR04MB8599.eurprd04.prod.outlook.com
 ([fe80::c32a:2bd1:a6c0:601%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 06:47:50 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Thu, 18 Dec 2025 12:16:24 +0530
Subject: [PATCH v22 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-imx-se-if-v22-1-07418c872509@nxp.com>
References: <20251218-imx-se-if-v22-0-07418c872509@nxp.com>
In-Reply-To: <20251218-imx-se-if-v22-0-07418c872509@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766040412; l=7425;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=OGudE4kvJKIcCujWbKnAIhMZmTCfUNyT1XKn//TVFvM=;
 b=hyCJCH4gAE6sDjQFoO8IOFmixpjZNvYyTl8zcf6oAa9xYtV1eWl6rvq0G9ONo4F2wklRPvz2z
 +W3qQ3lU4R+BIF6YBys6E6XwuXCGSmvgW2hf0jlYhzTKr/cSd80SUAU
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:195::18) To DU2PR04MB8599.eurprd04.prod.outlook.com
 (2603:10a6:10:2da::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8599:EE_|DBBPR04MB7756:EE_
X-MS-Office365-Filtering-Correlation-Id: 4add7f61-5666-43bf-d70b-08de3e015c8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|19092799006|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?WnVOQU8wb2dVUE1sQnpPSDhtOFZpS0I0MTFtd1pWbWJzKzF2akF1NDR4Zm5Q?=
 =?utf-8?B?ODQzUTc2WW1hekYyZ1FFcmRKTDNXNkc0MWttU0J0bDNLOExkdXhCMUFtWHpk?=
 =?utf-8?B?dytIcEN3WmtIVG1QaFZBY1dPa1h4K3J2djVnY0tyOVhvRVdiN0pVZDZ3NXBQ?=
 =?utf-8?B?Z2szV3daQkgzdHJUWWs3K2tZTFlaOFRFTlhJSksyOExHa2Y4Wkhsb3pKN3A0?=
 =?utf-8?B?djczZEhwQ0IzZUIzSDMzVGNjTnpOd0t1NzY4d2tubVJTY0xLTFFDWVJFWVlE?=
 =?utf-8?B?aHUzK2ZqSDBBSWlqR0NmYStEL3JtQ2doRXNLclhiblZRWXAxQk9wYTZJeWZy?=
 =?utf-8?B?UFJKcHplMVhBQUZZWW44b0w3NnNXa1dNdmIxTzNJMGZKVTFlaWJWU3BrSGNZ?=
 =?utf-8?B?TzBXQnR3bEZNcjBvRzQxY0ZEb3VXd1Z3OGxUbEFHWlVZdXF6emJ6M3BDK1Zq?=
 =?utf-8?B?WWxQV3VNeWlGRUFtR2R6eGh6S3BqTXhrWituTjI3YkhyZGRiUjgzazZpeDA4?=
 =?utf-8?B?Wjc3RFFkODU4WlZqMFh6djhseE9iMzJlc0Fkb0s0b245TVZzOEVtZ3RpdHFV?=
 =?utf-8?B?UnRDTS9wZGIxS3l1b3o1R1FibmxJdmxmKzJ5dlBQTFZBOGdkb2hJM2tIMVZM?=
 =?utf-8?B?VVI5OFF3Y2xTODBoRm9HazdLNHd1WkM0QUdPTk5Od21mT05wUnc5cDVES3Qx?=
 =?utf-8?B?Nzh4T1BlUE5hUGlSWnNXeGhFVlJYbnFvaCtJbWQrMXlBSTdMTitUNU00Nkw3?=
 =?utf-8?B?a3FxZEpiVWZjSWl5RnkzdmJuUlAzOU5qa1hRcUVyUE9hcGZQcHptUGtUdmlk?=
 =?utf-8?B?UmE4d29YUGE2N3VoT0NFM2tpS2VrNnF2ZUJ5S0hFUnpSeUJmVHFYSHRTZitl?=
 =?utf-8?B?SXorc3lwK292TVRLKy9CSHNQTXF0VUwzangyVXpuYkdrSEYyd3ZaL29XcnMr?=
 =?utf-8?B?ZzgwdjVncktzazJxMGtUbzJBUU50aXkyb2NLRzZ2Z2ZvMGsxaXdnZ0o2UU1O?=
 =?utf-8?B?NDBCcmgzbnVTZEYvN05WWUNTbEY2SUVlMUxza0NhUzd6eitZaFVMODZLNlRL?=
 =?utf-8?B?SUFOQjlFR0ppOHpsR3pYSmU5bW9CbHY2Vmk5eGZkeW1QYkg0QlRXdllPMDM0?=
 =?utf-8?B?d3J1a0VENWZqVm50dVFtdTNtUElYZWxJWTliN1JmdXBkZjFyaDNVbGlDcDRX?=
 =?utf-8?B?Q29FMGxyUlpUNm1KNlJ2eFdmRUMzdjFmQ3hLY2M0ZVVScHozRG1JTm9NRVBS?=
 =?utf-8?B?V2U0QW9pSHpqT25kd2UvbVluOXc1cHpueVVRdWZJU0RXZEhERW1TUWZnQW5i?=
 =?utf-8?B?M1FzYVVObFdaZjQrallzQkdpSnUwZ2FMdXdIMWxhbTlWN05lWURTcUM4R3Rj?=
 =?utf-8?B?Q2FvSTlvNkdpYmlTekJzazljaE5XR2ZHME9aRjF0Y0JZYXJkdG9WbDB4YUhT?=
 =?utf-8?B?a2p2dmNIaDJBZmR4RFpIZ2FqTGJ4MXUwUTAxRjg2U3J3Y2lFaWRvTkQxemNp?=
 =?utf-8?B?eGJ2bGJaTHBWU2JaUTZ0dFFIK2hsU2hheG44c25vOHFCMTNtK1JGVG5RYnhB?=
 =?utf-8?B?R2Mwa2xYSkx0Z2E0MW5EbDJKNEE1OGFvanZvUUdaSXBJNmZIem9wKzhvTTFs?=
 =?utf-8?B?Nlk4blVCZ3lnaU4wWEo5TjM3WjZRMStnd3lJbnAwOHBpL3FSSjFPOUxDazRx?=
 =?utf-8?B?VHlwV2Rra3JjRXJQRXE5Nk1hUmpPWXEwTTk2SFhWVmJoVG1pTzczY2JVZXM4?=
 =?utf-8?B?L09PYTRxMlo5OUcvY2dtMjVGOUN3NmVjTjZ1ekIxVmR5K0ZWRjl4Qmd5SE82?=
 =?utf-8?B?MS92NGRLUys3TTZxbDdPV1NlSU11UlltVGc0MFlLNWpuRjB0WmFPb29tVmNL?=
 =?utf-8?B?cDVYMkVqQnA3dys5ZUsyV3c1TVdxKzNRcHB1M2Jyc1JVekUvbGJBemtmbXF2?=
 =?utf-8?B?SzFickdtelkvSmpwUjNmNzNIZFFRa2V0N3E5NHk1NzgxOU5LQlhOV252YU4v?=
 =?utf-8?B?TVpKUFVpM29ya3dFVkZNM21uUjRPOWZHRVlYeWhYb2xzWTM4MWR2OFJhNXM2?=
 =?utf-8?Q?gaf7Ef?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8599.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(19092799006)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?WG9iWStrc1NTNGhJRTdReEFxc3NMZnJhQUF1Yjl0N3NMS2owaEVOc0NTbGRp?=
 =?utf-8?B?Z1pNOGIybGJxanUrVW4yUEtnREZ5cmRyaWgrelgzYWZSWTZYUUtzVEIrSkVp?=
 =?utf-8?B?WVZpdXllMGpBZlE2YmxFemV0aEg1Yi81MHdycTNUK0orZUxWVGIwMWVaNWRP?=
 =?utf-8?B?UUdzVVNsS0xyTVZYcWtKeUIzd29DZ3ZRNjVlWFU3akFkVVRyWHZUOEJ3QnI3?=
 =?utf-8?B?MG05UzlYV0ZVblA3MzUxdkVRTGhoSzJpR1lyZVFadlMxVGxFNzJieHR6Tk9y?=
 =?utf-8?B?d0VHSEQwRmpOamkyTGlJbjd2MlpQODZtS24vNFN6YXd4UktXV2V5aXl1d2lU?=
 =?utf-8?B?b1BKaUdTOE5FY2YwMGZ3SldUWnpyOWY5c1R1ZnFnekVOUkRBRG1FTEM2RkZ5?=
 =?utf-8?B?akJvdDNtc1JkcFVRTkNnKzNGT0tHanZpK042UGdlS0ZGMEY2VW1lWGlTUGpw?=
 =?utf-8?B?ektIWUNrVTRZQWU3QWlveFdob2hodXBqQWpGc0lHbkowQVN1ZnhuamE1d1Np?=
 =?utf-8?B?NE9EWXRibVN0azg1Vmw1T2pIL2R1WlFURjAvRDFSOGpINHlVRUNnSDJaZDEr?=
 =?utf-8?B?ZnBIK1RxODljREJoNG1nREljUjRGYUV5Y2pIdTYwOVBnM3NpdWN2TjBCQnlO?=
 =?utf-8?B?U2dNTVJvaGU2cHdDRWtYVFlCL0pLUGZ3bDc4U0xYYWJPK3NRaSs4UXJhTDlQ?=
 =?utf-8?B?d0htQ01PU2dicUhsQzl2bGRqTk00eUFiUTE0azA5enhpditCMngzTkVoWWhX?=
 =?utf-8?B?MjcyNDJ3MERIQWUxYVMyZjdjcnc5djRlczJ4akl5T2tSZjJkbE5ZUWphM3hB?=
 =?utf-8?B?RkRJa0RiQVRvOXRScktKellLV1JhVWhGbGhUc2ZOK1NOUjFVRS9mTTVnL0xj?=
 =?utf-8?B?ZVBpYUFjSEhYVmovZG82K3JHdVIyZnR6bG5USVNKYXRJN3hYUS9tbEVwanVu?=
 =?utf-8?B?VmZ5WWh3emZNT2pkb1p5OGMybkRwSkN4cStuNEtqaGtXcFhzYnhzODNYaFo3?=
 =?utf-8?B?RVU3UHRZdkphVzBUQU02NHRub1QxNEdTZWVtYk5xTjVudGhXNFI4NC9vTHl1?=
 =?utf-8?B?RTVMc0NPOXNxNWR6ZlJDaFBEM0J2OEc1Q3VrYWNUNjlROVYzdytyQ3JBNWMv?=
 =?utf-8?B?ZVlxUEJhSUNSR1lHbTZtRXEvbGJ2WkRGWkJvSU94ODlzYktlSWVEaWtjL0JI?=
 =?utf-8?B?U3orNkhtZzArZ0p4SkVYamRrb2NNSDRWeStwa0F6OWNUSHpmVzhqVEJKMmhZ?=
 =?utf-8?B?MDFJdnVJNWZxU1hHMmI5ZmZKWnFmVWJKa1g4bzBoOGVHNG05SklOckZQNmp0?=
 =?utf-8?B?bGlrM2NtMHZJUG5ld09SenkwTUoyQ2NleWVQMkpHcFhmZEEwR1QzMEVKN3FW?=
 =?utf-8?B?bDZlVlVGS284R2lHTXFycFlmR3BrN2xNWkdIZm9vaW0rNk1ubmsvcllsVjZP?=
 =?utf-8?B?VE50S1UxQ2dZaE9zeDhjTnRXQy9yMnUyaW13dHNwcTd6ZHFUYkF4eDJhUDlX?=
 =?utf-8?B?VHllb3RCWFd1VjMrN1ArcHdKL21SUjd5Mk0xcTVNR0ZkVEs4ajlxcjhWbU5h?=
 =?utf-8?B?cDRJQi9Zc3Bwc3k0Vzk3ZVdLOGp0Q2puWGRFNFBIWnc4WE91M1cxeWt1L3cv?=
 =?utf-8?B?Nk1sOFF2d3ZLTTg0U1NOc3RwbjQwNm5UYzY4VW9pTWt0MlFFeWxSS2dTN1Ur?=
 =?utf-8?B?VFEwNDVlTDhiWkR1d0Y2NUZHM0hEZURNL3RDQUNzUFh0QTN5T203RmJOMTA0?=
 =?utf-8?B?M3k4d2pMR1JDTjRpSFlXWlpJeDVMV3JWWlFiUUMyNFBsSTNyQWIweTEzZk1Y?=
 =?utf-8?B?MnFBRlpSMTc0WDRtWTNGMThxTStuaG9wUVh6SDRtbURUYUJzODVHZWpRK3k4?=
 =?utf-8?B?UmFrWkh1YUE5L0JrcUhmRjN0MFB6ZXJsTitKUWtCbHViNkJGK1liNjFSWjU4?=
 =?utf-8?B?TVFmem4zeFNQVUpmZmtNVkswOEJmMThWL1VDbnJjVGxPL2U1bE1weWgrVW5X?=
 =?utf-8?B?OW5ILzk3QWtoOTIybkNWaHRjT1h5WlgxTHhxYUQwYzRjbll6blFML0dGQS9U?=
 =?utf-8?B?Y1R3RG52a0Vkdnpxc0I3TnY0T21qVjUxTm5nNEFta0dDMkVPRnZJK1ljQ1Er?=
 =?utf-8?Q?Vbvw7leV4JFdm9npryXgPVoFq?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4add7f61-5666-43bf-d70b-08de3e015c8e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8599.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 06:47:50.2966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dbCEiCOlmqWW5VALKwuRbRmUKlVa11VkRKfaD0PYKr+jEZRPLc8D4GQG7QQ46UgNQ+7Uhk3FHvsTB10w8B2SHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7756

Documents i.MX SoC's Service layer and C_DEV driver for selected SoC(s)
that contains the NXP hardware IP(s) for Secure Enclaves(se) like:
- NXP EdgeLock Enclave on i.MX93 & i.MX8ULP

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
Changes from v21 to v22
- rename the se_fw.c to se_ctrl.c
---
 .../driver-api/firmware/other_interfaces.rst       | 131 +++++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Documentation/driver-api/firmware/other_interfaces.rst
index 06ac89adaafb..cbd425c5a11d 100644
--- a/Documentation/driver-api/firmware/other_interfaces.rst
+++ b/Documentation/driver-api/firmware/other_interfaces.rst
@@ -49,3 +49,134 @@ of the requests on to a secure monitor (EL3).
 
 .. kernel-doc:: drivers/firmware/stratix10-svc.c
    :export:
+
+NXP Secure Enclave Firmware Interface
+=====================================
+
+Introduction
+------------
+The NXP's i.MX HW IP like EdgeLock Enclave, V2X etc., creates an embedded secure
+enclave within the SoC boundary to enable features like
+ - Hardware Security Module (HSM)
+ - Security Hardware Extension (SHE)
+ - Vehicular to Anything (V2X)
+
+Each of the above feature is enabled through dedicated NXP H/W IP on the SoC.
+On a single SoC, multiple hardware IP (or can say more than one secure enclave)
+can exist.
+
+NXP SoCs enabled with the such secure enclaves(SEs) IPs are:
+i.MX93, i.MX8ULP
+
+To communicate with one or more co-existing SE(s) on SoC, there is/are dedicated
+messaging units(MU) per SE. Each co-existing SE can have one or multiple exclusive
+MUs, dedicated to itself. None of the MU is shared between two SEs. Communication
+of the MU is realized using the mailbox driver. Each secure enclave can cater to
+multiple clients by virtue of these exclusive MUs. Also, they can distinguish
+transactions originating from these clients based on the MU used and core security
+state. The communication between the clients and secure enclaves is in form of
+command/response mechanism. Each client could expose specific set of secure enclave
+features to the higher layers, based on the commands supported by that client. For
+example, the secure enclave could simultaneously support an OPTEE TA and Linux
+middleware as clients. Each of these clients can expose specific set of secure
+enclave features based on the command set supported by them.
+
+NXP Secure Enclave(SE) Interface
+--------------------------------
+Although MU(s) is/are not shared between SE(s). But for SoC like i.MX95 which has
+multiple SE(s) like HSM, V2X-HSM, V2X-SHE; all the SE(s) and their interfaces 'se-if'
+that is/are dedicated to a particular SE will be enumerated and provisioned using the
+single compatible node("fsl,imx95-se").
+
+Each 'se-if' comprise of twp layers:
+- (C_DEV Layer) User-Space software-access interface.
+- (Service Layer) OS-level software-access interface.
+
+::
+   +--------------------------------------------+
+   |            Character Device(C_DEV)         |
+   |                                            |
+   |   +---------+ +---------+     +---------+  |
+   |   | misc #1 | | misc #2 | ... | misc #n |  |
+   |   |  dev    | |  dev    |     | dev     |  |
+   |   +---------+ +---------+     +---------+  |
+   |        +-------------------------+         |
+   |        | Misc. Dev Synchr. Logic |         |
+   |        +-------------------------+         |
+   |                                            |
+   +--------------------------------------------+
+
+   +--------------------------------------------+
+   |               Service Layer                |
+   |                                            |
+   |      +-----------------------------+       |
+   |      | Message Serialization Logic |       |
+   |      +-----------------------------+       |
+   |          +---------------+                 |
+   |          |  imx-mailbox  |                 |
+   |          |   mailbox.c   |                 |
+   |          +---------------+                 |
+   |                                            |
+   +--------------------------------------------+
+
+- service layer:
+  This layer is responsible for ensuring the communication protocol that is defined
+  for communication with firmware.
+
+  FW Communication protocol ensures two things:
+  - Serializing the messages to be sent over an MU.
+
+  - FW can handle one command message at a time.
+
+- c_dev:
+  This layer offers character device contexts, created as '/dev/<se>_mux_chx'.
+  Using these multiple device contexts that are getting multiplexed over a single MU,
+  userspace application(s) can call fops like write/read to send the command message,
+  and read back the command response message to/from Firmware.
+  fops like read & write use the above defined service layer API(s) to communicate with
+  Firmware.
+
+  Misc-device(/dev/<se>_mux_chn) synchronization protocol:
+::
+
+                                Non-Secure               +   Secure
+                                                         |
+                                                         |
+                +-----------+      +-------------+       |
+                | se_ctrl.c +<---->+imx-mailbox.c|       |
+                |           |      |  mailbox.c  +<-->+------+    +------+
+                +-----+-----+      +-------------+    | MU X +<-->+ ELE |
+                      |                               +------+    +------+
+                      +----------------+                 |
+                      |                |                 |
+                      v                v                 |
+                  logical           logical              |
+                  receiver          waiter               |
+                     +                 +                 |
+                     |                 |                 |
+                     |                 |                 |
+                     |            +----+------+          |
+                     |            |           |          |
+                     |            |           |          |
+              device_ctx     device_ctx     device_ctx   |
+                                                         |
+                User 0        User 1       User Y        |
+                +------+      +------+     +------+      |
+                |misc.c|      |misc.c|     |misc.c|      |
+ kernel space   +------+      +------+     +------+      |
+                                                         |
+ +------------------------------------------------------ |
+                    |             |           |          |
+ userspace     /dev/ele_muXch0    |           |          |
+                          /dev/ele_muXch1     |          |
+                                        /dev/ele_muXchY  |
+                                                         |
+
+When a user sends a command to the firmware, it registers its device_ctx
+as waiter of a response from firmware.
+
+Enclave's Firmware owns the storage management, over Linux filesystem.
+For this c_dev provisions a dedicated slave device called "receiver".
+
+.. kernel-doc:: drivers/firmware/imx/se_ctrl.c
+   :export:

-- 
2.43.0

