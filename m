Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011012.outbound.protection.outlook.com [52.101.70.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3834D30275E
	for <imx@lists.linux.dev>; Wed,  3 Dec 2025 20:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764794774; cv=fail; b=F9rSE+KrSxneY+Ig4lOWXjzMXqzyjhpFMVapJsyl/Iaw45AZp61cVYIe90CS1L527qdoIG4ZC828jyxmnFkte/5/j24c+bnH3iWsxuJs40xe4mw8ZhhwnXkcws2Jv56pvVKvKITNoN3aXcnDmNDTlE2M8a0QVK6qfjC1oyHu5uA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764794774; c=relaxed/simple;
	bh=AGn1Ul0pU94B5x7fa2wMUwyJv6n+S/JMMVlrxd74CiY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Yg4O3xW/Tq9H9MztJ2fS3pvA5SuLOFS+V+p5jq3ybjUl0f/HNMaHRBz2FtOf83PNTS9i/zZoin0rdDECurSKTRYd5Ndg/Kc2HpgiX0999jEd8VulCVBg3PKUE9SyLUaXCayBsjUtMhYIyZLWPBVkZwX42wlPtpy3ZE0cjqBnvBg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=mssQLBP+; arc=fail smtp.client-ip=52.101.70.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="mssQLBP+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oDrxthYJ8g1LUHrKB2B0o5d2yUvVzZnHZyJW5w3TLLfMSwsCYexMtAVvI1ScZFK6uOBToAgRj78VmcS/YAQ/Y5feZ/RpTiOU1xwqZDzZqtHgbIDSIITY1UWVn7073fgflAGkDX0+W0OhmPlOyv7zsHwl35V7nEsUgDOLWr6PE2iFijUdd+AW73GvZx8dkKNT1CfHobW7jx+aE7L8BiVWpm7Il8GJL/F2CMC82HM/o1/Hg0yh8b2qTOn+OsOEmXS3JPY07jTt58im0GbF/tghXIb2XYYyu2+YWg1bSFmUYgUVQUbrQx+sY2hGjYCUbRQwMVY7P60TrVFrLKiaf8p5Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oUuEmhvuU1r5Wgkp2KuCPali74nDC2mW3dXM0zJ7tSQ=;
 b=DdIJhtQpY6lsTJsZ7SZM+1dFEjacXVmTzCPt7d1u5Darp7gB7Ayuzx+nYcslYSRW987leWHdlw17OJgLwzoGVHJn6amg7i7NWEVeC6VpvMel4yVSkl0H1BKyZo70qv2SOC2RZ0ul79YAIeXIGx/cLoZcw9DleEdfhLqXCG1EWyFQwayr6X/zmCu7mHyXrWodFK0kDkwfTRhKOr5i7l6fE1tEmiaHrFXjMB6k3s4AnBao54YCJ+lQfmuUdj54IPZOoRsyy6TKv0uxDJUreRRqu6KFgMjg3koaSnPKRE6kUJDd6AswlpiZSt0q3LceCD/o/+vixX1bxr+VlSWofq0x8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oUuEmhvuU1r5Wgkp2KuCPali74nDC2mW3dXM0zJ7tSQ=;
 b=mssQLBP+HDr1XARpz2KqjfJsr9OMM2ct2WoXglwm3ahuGq1CVdh5CRh6r5GtIu1fuT5IJRU5awr/5h3lWaC/6FT5Q428HFnLO0+GQxfe5JoZZOUVplLYkqti0qH0VwRVwC7tPj2miqpDea7OeU0WYUXdOseur1fg6sVD7k5Y9E1+ZuJmqealNDHQzB7m6INpcuyIgVF/CILBipuVfW8hEuySB7HqFdjFYWL6iHtCrgByqZV3nrn50f51DlIscOof7a2T+kM+3oJoOvUCsA37oHeq47CF33mbbtvxaCaz12Gx5Ej8pMH22ZZWpnEvFJKkH/3nsk3HMUQKj+mvPfPXXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by DU2PR04MB8949.eurprd04.prod.outlook.com (2603:10a6:10:2e0::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 20:46:06 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 20:46:06 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 03 Dec 2025 15:45:50 -0500
Subject: [PATCH v2 1/2] i3c: master: switch to use new callback
 .i3c_xfers() from .priv_xfers()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-i3c_xfer_cleanup_master-v2-1-7dd94d04ee2d@nxp.com>
References: <20251203-i3c_xfer_cleanup_master-v2-0-7dd94d04ee2d@nxp.com>
In-Reply-To: <20251203-i3c_xfer_cleanup_master-v2-0-7dd94d04ee2d@nxp.com>
To: Jorge Marques <jorge.marques@analog.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764794762; l=6714;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=AGn1Ul0pU94B5x7fa2wMUwyJv6n+S/JMMVlrxd74CiY=;
 b=zKaI7x3GsQNPpotLFJCoIm2+Vl1/y1vdxt8Kf1U2Y8Y07Lxl24jbNpfpCxukzIlA8ogXERplE
 v96bVH8AxHhB8F4Bj8ll1bJUsDJvmSTf+ZXSm6TuX2d4uMnsl8lFPlY
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY5PR17CA0015.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::28) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|DU2PR04MB8949:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ee962cd-f417-4b85-51bb-08de32acfb76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WndKc3NiS08vbC9RSHFkZ0prbUwzSGFxYndqZTIzbU96VGt5eWlvaWlIWVhU?=
 =?utf-8?B?SFVieGVhREovU1JDd2FGdm9mcjhvcmUrRkZ4K2FTTTFQUDVtSkVqY3pNdGxi?=
 =?utf-8?B?VFcxVjdpZ2xHaXc2b2lQd3d2bk0rVTEya0Q4UHRXaUdNUzlpZkw5Si8rMC8v?=
 =?utf-8?B?bHNWeFQrSFAvZGNEc3lUeTJRTjYwSWxaWTYzdFBzRVNjanVEK1VJWENTU0s1?=
 =?utf-8?B?dGlUUzFsQjNXUFp1L3VrN0NmVlNINEtJd0JFMGRhaDlnK3dWU1RqRUE2dGND?=
 =?utf-8?B?dE5abkRFYmREN0trN2p2emNSSUxiZlhabUN0WU94SVRxTGNVZ2RtMEF2emRO?=
 =?utf-8?B?bjJNRnVlMW1lNFY2Mkxzc1NvQlZSa2o2dmN2eTZEeXhhT3lzRWFTM1htMnlq?=
 =?utf-8?B?Sjc2Z0YyQWNYQzE1Y3pHaEEyOFdOUjlMa2ZzQnA4UEo1NllqNHJuSUU0Wnhn?=
 =?utf-8?B?ejJHZVZKSFZmYzgrTWVzNTFCUXhoSmtkMGZNR2xITEl0NkR0Znp6SmI2RFQz?=
 =?utf-8?B?WktOek5xL2JVaEtXL2FtbGtTaHNiM1dQeXJRRmVoVlk0VkhZOTRWZUY1Qmxt?=
 =?utf-8?B?ck1kRVptKzh6eDR6NFJNL0w0ZG1sbFhUVVpxZm51cG80NWhiaDJ6RDNkNmYz?=
 =?utf-8?B?UDd2WUcwN1BvVW5jVHk4RkJOZUxpSW5sS3d0OHlVQ3BheTBaY0x2WGZlN0xT?=
 =?utf-8?B?Y1RudllIdW44YlVkV01JaGErWUJHWVF3Vm51SkRaNWxGdkIwb2gweXlsOFZZ?=
 =?utf-8?B?MDg2UUhVbTVQSFZ6Y3p0MzZFL2czaFhJOUpUMkJxVFdlSXRSVkwxcU4yakhW?=
 =?utf-8?B?MVQxbkpkMFBmeWJQN0ZWd2pPd3dVMGYySlV6ZmRHZHZrdEtOazJNbmhrbGhF?=
 =?utf-8?B?UGhYTDBlZGRMYXFiaHVQajhOQW96bVllb1FPN3VhTUJJZEx6S0RvdVk3eTBN?=
 =?utf-8?B?dE5ZWVdrekxzditWY25rZkxXZFBwRUsrR2pvaHM1b0pNem9JdjZLWGowbDdU?=
 =?utf-8?B?NnBvY2ZNYURMTmxxeXM0Y01ySHR5MUhFTHR1M093dGtJcVZFZDBIWi9wNHF6?=
 =?utf-8?B?TndlZzVDREVsR3JZdmVwNmJmd1lUckhwbkcwSlNWSjhNZllrUlBlQks4UFZ6?=
 =?utf-8?B?VXNidHA1WXdjOXEwZTNwWHVLRDVDbTBxR2pHU2JqVkY2RTJBdlpUdStxSGs2?=
 =?utf-8?B?NkZ0WEpQcFlod1pwQjRIZ1lwTFVUY09jYzgzK2krekZyWDR5TWlLdURtZjJR?=
 =?utf-8?B?NVRkeHBob0IyazgxR01rSVErRktUWHhISkxESFdWa2t0QkRldEx6cEdzalZW?=
 =?utf-8?B?THhJbE0xckpqR1pNRzBOWTFnNnFsaUpNK3pTV1FhRDgyNkVhQUV5NVlZdHNH?=
 =?utf-8?B?OUplTGNsSkRoOEExdWJKVHFZcmxNUWdES1ZSalBDQzZ1QmZLSTdGdmJ6MzY3?=
 =?utf-8?B?SitZYzJic3htbGl2S1A3b1o4YWdYU0ZET2VUR3I4VDIyQjQ4dWZFU0lmL1hq?=
 =?utf-8?B?bkhlZk5rcGpjb3RWbVNyOGczRnJRSWw1MFhCd3JPNWdmWFJPNW5CNERYdVU5?=
 =?utf-8?B?T3RxVzY4NU5pQklHSXhZc0x2UU1xY2E3VE83dmdGa1BiY2ozYVluRjVMRVpk?=
 =?utf-8?B?MUtjUFp6S3FMNEQybjdlK0NNODJxZEk2bjA5N00xMWx2dCtBazZadUFZY2wx?=
 =?utf-8?B?czlqUlFrU1FOYUZBK291TGVhUzZCa3ZCd1dCZkZ6RndHc21ZTnRyVktmUld0?=
 =?utf-8?B?NzdITUtndk00bFgwRWZqcS9jOWd6a2ZYQmRpRE5RV2VjaFJwT2o4L0taM2RX?=
 =?utf-8?B?TlNCVnRlSXV5K09HYW9xb2lrdzA5L003bUdsbXc2cUdZSmI0SlRmdlpZZmt2?=
 =?utf-8?B?V2h1M3BpSHp2QU5pOEc2WTUyTS9za2dMd0xwd2pqODNvSmNIcFRzNWZjQVk1?=
 =?utf-8?B?bTVBaC9qaDRLZnhRdjZWaG44Z0hjL2IxWmJWVVhZTzhZdkJtU3B5alhDS0FD?=
 =?utf-8?B?d1VBWkZocTJUa3ZtT3NuQi9ZUnBOTnZ4bEpteEh2NUh0S0JUZGRQSHJaRXRj?=
 =?utf-8?Q?B8K7QP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VkV1UDlRa01EbjNjK2NKbjQ0SDFuRGJ4WUJaM1gwVHFIWnBna29wdGdlOEtV?=
 =?utf-8?B?ZkV6ZUV5dXdPR1RzNDhNTVNoUmJrbVRpZFErVEpGRzhHb05hSFJkZC9aK1Jz?=
 =?utf-8?B?ZXhxRE9iQzRVVDZaQjZkNWRWY2pKcDhNbkI1aGVBbTNLRDFMeCt1NmlRQVZ0?=
 =?utf-8?B?TXhnbThubGgyNFg1N09OUHQ2MWZxcyszS3dlbDdtUklRUzZvVUg3aXZ5VkNJ?=
 =?utf-8?B?NU9wMGM1R2RPQnFDcTIyelJ1cm1GdEJuNUZwR0g1Rjd0cUR4ZFo5MDVLdnNG?=
 =?utf-8?B?QkdBaUsyTnVZWFp1VFV4cFhzZlkzOGN5aXBVZEtGcTcwVmc3WDhDTDBGTzZP?=
 =?utf-8?B?dU5BdHNTdHl3YzJ6bWNyVVlXV0RNSXFtL1RleHVPZ0JOcG00WHZxd2g3NlAz?=
 =?utf-8?B?ei9qaHNPOUNwdGpmMXBoRkt5RDdkK1BJeWtlYXNOeTR0OHhvUnJoeDNnZ0Q4?=
 =?utf-8?B?ZnQvdk1wZzM2Wk5rWGxxRnl2cjd3NzVOY09jUUdtUVBXenByQ3F4VUV1c3BC?=
 =?utf-8?B?NVFLNWJweTBhU1d4WVcwZ05JZ3dsajRpeTA2MnpsVS9UN0pESHlqekxmb2lH?=
 =?utf-8?B?WG5kSThvU2oySmNqY0pBZVRELzRGZFE5MmNucmNYWEh5MEc4eEx5SmRMSlJE?=
 =?utf-8?B?ZnpNdkh6Rm1PZWo5N2gvN0FEcCtZaTRRRmgxVE53TVBLOEl0empVTHY3ZHht?=
 =?utf-8?B?cVlPbDVXekM5RGpRdjYySWFXYkVBVUYrUFNJWmFrUE0ramYvZzljeUp5RzVx?=
 =?utf-8?B?N0dFay9zZmZtZzZ6eDgwSUxsVTA1bUI1TVdGOTRicGlwK1VFS25CVjRuNnNq?=
 =?utf-8?B?ejkyNzdhbjRoMmsyRGFDaEdsMTVIQlJ1aG5hZkdZT09POG93RVlyVnkzdGlG?=
 =?utf-8?B?SVFpWXZSQ09sWGpVMHFJVHE5bU10YkR1eU4xRGlUUmVzT3dtS1VqMTRZclR1?=
 =?utf-8?B?WU1tUk1yQ09hZmhZY0NmQU4yRVdkZlBRaXU4LzA4TTNEQWVFOVRSS3kzZGx3?=
 =?utf-8?B?aTZkUjhjM2MvR3A2YzhqdTAzN0tpRElPU2lLOW9JS2tUNVZFbStPN0QzOHlE?=
 =?utf-8?B?ajdEbkxSVTl3RDF2VTNjQ05EaGxoMThNN2NiN09SQ2h4bHIvS2tZeUhnSDZI?=
 =?utf-8?B?QmRRYVBGQVdxeG9qMFkwcUdzUjZ2Sll1bW5UYk4rODVNRk1UNVJtWVpHeFRk?=
 =?utf-8?B?dmV0TG1iemdhWElLSUFKcDV6M0NoZzM4bmh0cFFVNUR3dHlQOWR1NmthZ3Vq?=
 =?utf-8?B?djBGTVQvVHl2SVRwdmJITDJKVk9yUEt1TDdodUJVK0Vjam42aFRrbTFmYUZq?=
 =?utf-8?B?ZXhZRGlnNG1KblJEcytpZjhYTjFoL245czJTWTA3aXV1NjRvalZuQW1UYzkz?=
 =?utf-8?B?QlZVWHpBeGdEdkdZRjZDb2pTK3lOMERFbSs2Uno4TjRqTG9RR3BheXVLWkFI?=
 =?utf-8?B?M2ZiVUlMbFBYNkYveFJOOWpvbk1oam01WXlXL2VjbDZlcmJlOUhhZXBkMDJN?=
 =?utf-8?B?Vjg2WklpYVdrejBDMzB4dWxNeUdmMmt6TXlQbVdES3JwQmJkQ0QxbTRRN2NC?=
 =?utf-8?B?enAwWVB2YUIvZFNYcGFCY2VkeGtIVXRacFMraGt0UEovNHdYWkdFVGFpU3pp?=
 =?utf-8?B?V2NkNm90czZHdzh5SENMbXVrRXlGNUhzOTZubU15SnNLTnZacWZTWVdmNUVI?=
 =?utf-8?B?dmFQZmRYK3ByRnMySEZFYXFlbko0K3NtK1dIUzNRYjNSQ2grNWN5cjQ4YVR4?=
 =?utf-8?B?b2NYRE02dkpyTGo4OTJpNGZCb0w1cDkwbVJtaE95UlA0R1JlVjhKMjhaM0pM?=
 =?utf-8?B?T3ZDMXkxL09rRzRnaVB5WlRtWjRvWWxVaUwxRzU0UVBYRFlYanBGSyt2LzZa?=
 =?utf-8?B?SVluMGxqTEM2Q3gvS0txVUdBampyREQ4bzR6UU9WUktKZ25wUWNocCtKT01J?=
 =?utf-8?B?S3ZkemtqWGtCL3htZFVQdDUyak12RVdOYnVlbjRMejRaSGtZVlgzM0lrMkJD?=
 =?utf-8?B?c1NGdUVMZHc4bFVaZGViWVZQaEZFQzBSenRqZ0J3WTNnRTJyS0JMemduTTBQ?=
 =?utf-8?B?b2pTNSszNWQ4eHNSbzByRmhXTjJEdHhNSHlwL21GS0NQYkZSalZ3OHVoNUI5?=
 =?utf-8?Q?TV0R/ESITwvjJoXk24NvGa4KM?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ee962cd-f417-4b85-51bb-08de32acfb76
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 20:46:06.8682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zYeQ1Fr3tqsV1J2rMW59uE7JJf1wV/Z6q+/2VH23P8qphUv64EV0raIyF0zM/IVRi9d03GMd4RhZ5JwnQB5IxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8949

Switch to use the new .i3c_xfers() callback, which supports all I3C
transfer modes (SDR and HDR). Also replace struct i3c_priv_xfer with the
new struct i3c_xfer, as i3c_priv_xfer is now an alias of i3c_xfer.

No functional changes.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/i3c/master/adi-i3c-master.c    | 8 ++++----
 drivers/i3c/master/dw-i3c-master.c     | 8 ++++----
 drivers/i3c/master/i3c-master-cdns.c   | 8 ++++----
 drivers/i3c/master/mipi-i3c-hci/core.c | 8 ++++----
 drivers/i3c/master/renesas-i3c.c       | 6 +++---
 5 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/i3c/master/adi-i3c-master.c b/drivers/i3c/master/adi-i3c-master.c
index 82ac0b3d057abddc78671ce973db12f528984ea1..00eb80e492afc736046f04fa454be16bb718004a 100644
--- a/drivers/i3c/master/adi-i3c-master.c
+++ b/drivers/i3c/master/adi-i3c-master.c
@@ -365,9 +365,9 @@ static int adi_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
 	return 0;
 }
 
-static int adi_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
-				     struct i3c_priv_xfer *xfers,
-				     int nxfers)
+static int adi_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
+				    struct i3c_xfer *xfers,
+				    int nxfers, enum i3c_xfer_mode mode)
 {
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct adi_i3c_master *master = to_adi_i3c_master(m);
@@ -919,7 +919,7 @@ static const struct i3c_master_controller_ops adi_i3c_master_ops = {
 	.do_daa = adi_i3c_master_do_daa,
 	.supports_ccc_cmd = adi_i3c_master_supports_ccc_cmd,
 	.send_ccc_cmd = adi_i3c_master_send_ccc_cmd,
-	.priv_xfers = adi_i3c_master_priv_xfers,
+	.i3c_xfers = adi_i3c_master_i3c_xfers,
 	.i2c_xfers = adi_i3c_master_i2c_xfers,
 	.request_ibi = adi_i3c_master_request_ibi,
 	.enable_ibi = adi_i3c_master_enable_ibi,
diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
index 276592a8222e7b098a2323e0f3f587e77fc789bd..889e2ed5bc830310c5555eeeab08674d0c579a0e 100644
--- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -902,9 +902,9 @@ static int dw_i3c_master_daa(struct i3c_master_controller *m)
 	return ret;
 }
 
-static int dw_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
-				    struct i3c_priv_xfer *i3c_xfers,
-				    int i3c_nxfers)
+static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
+				   struct i3c_xfer *i3c_xfers,
+				   int i3c_nxfers, enum i3c_xfer_mode mode)
 {
 	struct dw_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
@@ -1498,7 +1498,7 @@ static const struct i3c_master_controller_ops dw_mipi_i3c_ops = {
 	.do_daa = dw_i3c_master_daa,
 	.supports_ccc_cmd = dw_i3c_master_supports_ccc_cmd,
 	.send_ccc_cmd = dw_i3c_master_send_ccc_cmd,
-	.priv_xfers = dw_i3c_master_priv_xfers,
+	.i3c_xfers = dw_i3c_master_i3c_xfers,
 	.attach_i2c_dev = dw_i3c_master_attach_i2c_dev,
 	.detach_i2c_dev = dw_i3c_master_detach_i2c_dev,
 	.i2c_xfers = dw_i3c_master_i2c_xfers,
diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
index 97b151564d3d31092975cec14958a17ddcd91d13..8eb76b8ca2b00a46a65f3a6dc7416d8af7ca288d 100644
--- a/drivers/i3c/master/i3c-master-cdns.c
+++ b/drivers/i3c/master/i3c-master-cdns.c
@@ -720,9 +720,9 @@ static int cdns_i3c_master_send_ccc_cmd(struct i3c_master_controller *m,
 	return ret;
 }
 
-static int cdns_i3c_master_priv_xfers(struct i3c_dev_desc *dev,
-				      struct i3c_priv_xfer *xfers,
-				      int nxfers)
+static int cdns_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
+				     struct i3c_xfer *xfers,
+				     int nxfers, enum i3c_xfer_mode mode)
 {
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
@@ -1519,7 +1519,7 @@ static const struct i3c_master_controller_ops cdns_i3c_master_ops = {
 	.detach_i2c_dev = cdns_i3c_master_detach_i2c_dev,
 	.supports_ccc_cmd = cdns_i3c_master_supports_ccc_cmd,
 	.send_ccc_cmd = cdns_i3c_master_send_ccc_cmd,
-	.priv_xfers = cdns_i3c_master_priv_xfers,
+	.i3c_xfers = cdns_i3c_master_i3c_xfers,
 	.i2c_xfers = cdns_i3c_master_i2c_xfers,
 	.enable_ibi = cdns_i3c_master_enable_ibi,
 	.disable_ibi = cdns_i3c_master_disable_ibi,
diff --git a/drivers/i3c/master/mipi-i3c-hci/core.c b/drivers/i3c/master/mipi-i3c-hci/core.c
index 47e42cb4dbe71edc5a022f4cb0fdf33a281eb4a7..607d77ab0e54691705845c33a79939820a83c9f0 100644
--- a/drivers/i3c/master/mipi-i3c-hci/core.c
+++ b/drivers/i3c/master/mipi-i3c-hci/core.c
@@ -266,9 +266,9 @@ static int i3c_hci_daa(struct i3c_master_controller *m)
 	return hci->cmd->perform_daa(hci);
 }
 
-static int i3c_hci_priv_xfers(struct i3c_dev_desc *dev,
-			      struct i3c_priv_xfer *i3c_xfers,
-			      int nxfers)
+static int i3c_hci_i3c_xfers(struct i3c_dev_desc *dev,
+			     struct i3c_xfer *i3c_xfers, int nxfers,
+			     enum i3c_xfer_mode mode)
 {
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct i3c_hci *hci = to_i3c_hci(m);
@@ -515,7 +515,7 @@ static const struct i3c_master_controller_ops i3c_hci_ops = {
 	.bus_cleanup		= i3c_hci_bus_cleanup,
 	.do_daa			= i3c_hci_daa,
 	.send_ccc_cmd		= i3c_hci_send_ccc_cmd,
-	.priv_xfers		= i3c_hci_priv_xfers,
+	.i3c_xfers		= i3c_hci_i3c_xfers,
 	.i2c_xfers		= i3c_hci_i2c_xfers,
 	.attach_i3c_dev		= i3c_hci_attach_i3c_dev,
 	.reattach_i3c_dev	= i3c_hci_reattach_i3c_dev,
diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesas-i3c.c
index 275f7b9242886ee77a647149a808e2f184fb0447..426a418f29b61256fbbfc50cf578bf04629ec391 100644
--- a/drivers/i3c/master/renesas-i3c.c
+++ b/drivers/i3c/master/renesas-i3c.c
@@ -794,8 +794,8 @@ static int renesas_i3c_send_ccc_cmd(struct i3c_master_controller *m,
 	return ret;
 }
 
-static int renesas_i3c_priv_xfers(struct i3c_dev_desc *dev, struct i3c_priv_xfer *i3c_xfers,
-					 int i3c_nxfers)
+static int renesas_i3c_i3c_xfers(struct i3c_dev_desc *dev, struct i3c_xfer *i3c_xfers,
+				 int i3c_nxfers, enum i3c_xfer_mode mode)
 {
 	struct i3c_master_controller *m = i3c_dev_get_master(dev);
 	struct renesas_i3c *i3c = to_renesas_i3c(m);
@@ -1282,7 +1282,7 @@ static const struct i3c_master_controller_ops renesas_i3c_ops = {
 	.do_daa = renesas_i3c_daa,
 	.supports_ccc_cmd = renesas_i3c_supports_ccc_cmd,
 	.send_ccc_cmd = renesas_i3c_send_ccc_cmd,
-	.priv_xfers = renesas_i3c_priv_xfers,
+	.i3c_xfers = renesas_i3c_i3c_xfers,
 	.attach_i2c_dev = renesas_i3c_attach_i2c_dev,
 	.detach_i2c_dev = renesas_i3c_detach_i2c_dev,
 	.i2c_xfers = renesas_i3c_i2c_xfers,

-- 
2.34.1

