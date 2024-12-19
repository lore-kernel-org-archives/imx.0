Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2051.outbound.protection.outlook.com [40.107.20.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B44BF9E8
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 13:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734615209; cv=fail; b=VS/3tlwcXuGfXi2/dHOb40D1zZ5OZDs50+bFdk9aMlaLmb10gB4h+uLlY8BegPaSGc6/puiayNVEXAgbGeNHkGufNZjsZrziylH/Sf74nyWdjhy/SFbeEXmo4XLQa1OQcfRPeOv5Iv9WSYdOom2stMGLEKaLFSiBhiriq3KfZyg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734615209; c=relaxed/simple;
	bh=FwHu8HOgjdeesS4jBLvkey7Y+WnnBYkcgUp1hGR75ZU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dlAmRVCE2Nbq7ZYJ47LcgSjglZcw1d3hN0/CZEDgy3jN9UVoKD1EptYFwFd48Q31CS8gml8bBysZcT94kP4F7IgoicySzQv76XutdrE3rY+C2mLwtj+318Xxp3HmLDNxtjEUuE1qL0sGKfFmpnD2XoET99QQVH+R/4Wwe44aNKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hWimqy5P; arc=fail smtp.client-ip=40.107.20.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hWimqy5P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n6yaFlaSOH80c5bQcMygDWRL5iOEaCcA5ORqtuCIAhzognZWar83lDprz10p0Xpr9Y29jhK/ntVZwZ/gYnkOsECLEx2eSoolKDSQLFcMrPxbpqxVEf9bhrVxyP/GzTXSbFFGYzlIlTaIHGl6gXKtBTcBXn6CKfBmOBfOQQJt5U3A5JqX2COaeWmtOkHaeSNBKNgcVyENP414fCvU9x7k3J3XM2WcExIebwFa49Cj0iY0apkbOls4kec7UcoiqRPmwoUSw+MvWt14WSXfmfWSmf4+lh/CTLMP+oaurUFvOHztBPpj2Yb7A7xoasqtw6ERmrg8+p7+KOMFcunh0dde4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rydjPSyjFpE1b+KVUJhSPw9jPLhoKfIzwxtGoWGJhg4=;
 b=d6oMa3B47XRxFPp+Eo67qPPlDitzpzdMRLZXUvY7PBPK/335HP0ORxXxQY57camsNilhMrJld0jrnsBzupn5yt5+9gma8Jk2gA6/Ky0AAvdhDNGztUn3fe5ncWm6qZ9nDHM00LQh1iKs25/n5kZQYbSjjf+YpnPVrFVrza+WXf1i/KxTFYf2Jd3yXESqU4eVP5nWry0Q9I2sUUjdpw48N6FUxF+Ck85OLoV9o91KQlapE7Pxs/LPqefgljuyyNHrvt/7i8Wuj2anQUpHQIKaWuy03rZ65QmkVBS5JsDNXDd4VThtP0M5vXjKYbr2JiHk5fz9yjB9LOqiwydNFEwsJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rydjPSyjFpE1b+KVUJhSPw9jPLhoKfIzwxtGoWGJhg4=;
 b=hWimqy5PWINeC/BUscdkGW71x1E5m0q1s3NDk//cGUMCT0qeA+tbBzOIdUbw5At2pjfIv1swe2fQtadabgxL40r4iU2AxfJi4UxzF61A7DoeXY3rLy1ZRDqAeNwCC+j5XqWyKoB204W3IQQkj2PY+ODt/XDb7z304qAC8vJiuuaFD5aKQw8Q5AYaU7pQC3QNLZHauTpJZDJnPUIN9OvlX5J6ys3r3QY/UU4CapKM0rQgmU6J1jM6b93gAdzOJdcjfIDULWaNB1dVJdymm5BjI6DUGGgsSzbm2dIDhOJx95arTUx4G9290MvNLFiyBjAvuiOULaCjUCWbw2rI+iByZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by DUZPR04MB9919.eurprd04.prod.outlook.com (2603:10a6:10:4d9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 13:33:25 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%4]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 13:33:25 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Fri, 20 Dec 2024 00:27:22 +0530
Subject: [PATCH v11 1/5] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-imx-se-if-v11-1-0c7e65d7ae7b@nxp.com>
References: <20241220-imx-se-if-v11-0-0c7e65d7ae7b@nxp.com>
In-Reply-To: <20241220-imx-se-if-v11-0-0c7e65d7ae7b@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734634652; l=6679;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=FwHu8HOgjdeesS4jBLvkey7Y+WnnBYkcgUp1hGR75ZU=;
 b=uOfJCs2uqohNFlKFXi5wpmFQWkW1t+bdDE8E7GgpDJMclASvmVndXPz4YplsCo2mH5msuQuPd
 d0WHmpUya04Dlg8UJRvcWTL3zeFs9Nc2GKZEeVjFlTlgkoNpkCcFexv
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) To
 AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|DUZPR04MB9919:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ab33ec8-a56d-4d0f-7953-08dd2031afcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?S0haa1ZZY1lsMFdtakJGT2c4alVBdjJlbWRFWXFkUGdPb1VOT1hOTzA3K2FI?=
 =?utf-8?B?bHZ4SGdGOHJYZFNENWIrY0NWMzljUHVTZ1FSUVpiQ3dXNVNva1lWdEdGeXdU?=
 =?utf-8?B?SmRwNnl2WjN1VURxK0w1T0N3ZEgyUDZmMHM3YXYvUXN5K3ZrVEhrRDNRR3Zy?=
 =?utf-8?B?d3NidGxHbmdXT0hiMEozRG5nZFNsSVBhV01JQjQzWFRQcm1iY1hqQ3k2YU1i?=
 =?utf-8?B?S3VTRmlaSlFSalVUM1RTTEpGSFJEd0tXdnRSa29YU05GcVZoa2xwSGVnVGNW?=
 =?utf-8?B?R2kvOTk4VVNqMGVGWUVyMG1TTmR1QzE5bEFVZ1owYjQ2SVZTcFJMR3JFSUds?=
 =?utf-8?B?UDh6RFBOdDdtVVk0SmJxS2dPUi9mOXFVczRYU0hkOG5IN3R1VjJlTDNUQkJo?=
 =?utf-8?B?T2o1RVR1dEtPNHhKdy9hMksrRGlyUU8rR0QybXdxcU5kYVAwN3hMdHZIbFZt?=
 =?utf-8?B?Q0VxQ2g1WjJRSEZXUlhWaGVQVVBYTDJiWkhOYUVnanU1UFZ4azFpcExRLzZv?=
 =?utf-8?B?UVFqcWoyTDZma1hpUW9FV2Vadmk1RXp0dVc0OFV3dVEyTUxmN2tmVXoxTEdQ?=
 =?utf-8?B?QUpJUG54QUJ3Z05vT2lSZGRxSEEwNjA2bG1BWS90eGhMZkdsR0FURUU1dllO?=
 =?utf-8?B?UlpRa0JvR3lpYmVCNzU5eTBvSFRCQ2M5T2hoQ0E4aGxNRTJ0ZjBqa2p1YjFM?=
 =?utf-8?B?c09xbWVmQTZrcGhkWWFUZjVZYmwvL2xpb1NObHd6YXlrUGs3V2ovbGhlejBD?=
 =?utf-8?B?VUo1SXh3dGRoSGRzd2tlbEUveHZoQVFwOUtaMDl1dm1lb2djaVRNc3FwNVR3?=
 =?utf-8?B?SWZCaGQ1OWxjOTZHR3BsNFFGSVNjSnMxOGtLOXVHUVhMR2NEbVNVTTdzYTVH?=
 =?utf-8?B?Tjk3c25QUEdRSFcwYWgvcEFzekpFZVd3M2tjOXdJemRLNGVvMS9xTkRZSzNJ?=
 =?utf-8?B?c2pzRUZod1FEclhRakVjdWxJbGJQTGU0RFp0em1qWUlJcGJMcmFYNCsvVFdQ?=
 =?utf-8?B?ckFiZStyZERPMnpxelVhN0dnamgvdmJGVWRWdTVwdHBIVmZxeTN5b0Jva3ZY?=
 =?utf-8?B?OG9UVXlwcnNLdW5qdVAxVUpWWkRoZkRqOFI1QUhvcktvTUNna0M2WXhiYk9i?=
 =?utf-8?B?eSs3b2NvTFRHK290ZnNtbnR3YXE1d2lmSVBxN3VQbC9oTG9PTjRSbVdNcmV0?=
 =?utf-8?B?anhKdzYzc1NTRzIwdjhXdWM4MW5selI2eWNqVENiUGd3bVMxWU94R3FWMENC?=
 =?utf-8?B?TDNCZG51MWZPbjh6QWYrbUdyVGtXTTU4clBQS2h0TEU0d2NFN0YxR2k0SWdL?=
 =?utf-8?B?QVF6TEc3RC9wVmpQU3BrMnQyUmpiZUVKVDBVVVViS0NPOTVNVVRoQXpWMlB5?=
 =?utf-8?B?bER1aFRPbXFubWtBbXphcy95ZVkwNVlUOERNem9BYVNFTzFoVTB3cnVkM2h1?=
 =?utf-8?B?ek1neHpYcXN6NGxNYW45TlcwWkNtT3NYcWYrdWNyZERCb1JUVXRib2RTaDhn?=
 =?utf-8?B?VGFMKzNRUnBVRTdmMktiTEltY29pNG45TjMvelBsbkxmZWc3UXNDaC9yNUUv?=
 =?utf-8?B?ZmNVRmpvU2hTZGNLbjZQdFNsb0lnRWVRRE03aDRLeXFLN0Nxb1F1cnFHcDJI?=
 =?utf-8?B?V1UxTGN1YjJtU0FNTms2a3FOeDExNUVDUitmUWhtOUdXUjJYRjd4SjEzaDhO?=
 =?utf-8?B?ZHkwSWJLTjBwR1hiU2REV3JnenA0OC8reDA0czErRW9SYWNlZ2ZKM0RlQjlG?=
 =?utf-8?B?VWNFQ3pSMHBKSVpENnBUWVVpTnAxTXZqeXpBRk4wN1RPK3lQa1N0bFFRYkJV?=
 =?utf-8?B?cThWSXVaZ1VwSzdORU40eHBueUdzWlY5RUEzc3BER2tRNWNyVlNMdENFVG1v?=
 =?utf-8?B?alNLYjFXcmgzTGtnV3dVSlk2c2JjZ3MwSGMyRGVHSHBRUEJiaENFV0d0L2F0?=
 =?utf-8?Q?IAQoDmfZPXQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2VGK2V2SXhZazJYTkZsR1JZbTltcUd0SWdPMVNETlFmMzU1U1VMMWpNTlk3?=
 =?utf-8?B?TitEa2gwSmVodlZiaEdob2xCR2dYMUNXczN2N0k1dUhKMmo3SlZFYmxKa21N?=
 =?utf-8?B?d2NpcktlUWlPSU9jNTB5QjgxUlp1ZVhtNEVudU03eGp3OFFpdE9vR1JDRnd3?=
 =?utf-8?B?a1ZVZkVVcDVvdFMybWpKQW82bXFZZDhEWlZDcUw0V1Fqc0M5RXhYWm4yUldt?=
 =?utf-8?B?SC96bVBvSHpCclBlSlZJOEd2QzVYSlN6enJwdDhqTzMveEM0bVd1ekVsRTY2?=
 =?utf-8?B?bUNRN3Vrai9ZVWdzWXppZTNBYU44NUhxZDB1RWlENHpoeWhOY2pJR0JPRjhn?=
 =?utf-8?B?am9udFdwOGVhSWdvRG1lOEdXWWp3dER2UzU5b3FnQllyVDBidTVCYjRERjht?=
 =?utf-8?B?UmFUYjh5eEoxWWROdHpLMW9hWXhCU2FwaEZ4d1ZqZ2F5UzFWWDErTDMrVkI4?=
 =?utf-8?B?anBkUitZUzR3c05Ydyt6d3cxT3VRWFAxYVphSWhxdmx1VXdpOGNIblVlTTdW?=
 =?utf-8?B?VWFjMjFjeDhMdU5XNnlBS3pobG0yT1JRaVdxRmhVUENXdjhWVFMwdHpGVFdr?=
 =?utf-8?B?ZmhUMTdWYzdzSWNIS2JCQU5LY3BWM1BjaTdTTTJsc3NxNVBEd3NVYndPcXBu?=
 =?utf-8?B?NURrSHZxSDIrcSsxYlhKTjkyZ2F1emM5OUxUY0V1Y0pINjdhaDFnNDI2MUll?=
 =?utf-8?B?bUlRUGIzalhvYTVHeVZKZXZCcTZCTGxXekh5dk13WXhSbmdKbVFML0JUSEFy?=
 =?utf-8?B?aGQ1TC9vSWppci9yd01ITzNSbnlXNEk1bGlHQ2xmS1FydHlRS1FCOUxESHhL?=
 =?utf-8?B?TW0xZnZYV1JiU08rYXE4US9JT216SGlNa09nYUxlbExHUExabHNNcEFNRHNa?=
 =?utf-8?B?OWErdXlHQlB4TlhjbTBwTmpWRW9JdExyTnJhTVRaODM3cjU3TDFueXhaKzRS?=
 =?utf-8?B?Vk5VeXNwMXF0QWNZS0UyU3lFcXBiYzNqdG9RV0VwN1Y4VGZWaUFvUHFObytm?=
 =?utf-8?B?Sks5WnpSWHkxTlZ3dkVkakZCVmFNQUlZSXdiZ1ViQ1JYaEpSOEc5N1dhMWJM?=
 =?utf-8?B?V0k1U3pHWDk2ZVdodElEZVZjYkFpenI3aUlsZ2hFejdyUWFjOVpiTk82NkxW?=
 =?utf-8?B?cG13K3RpSEFWU0ZOZzVBV0RtTGFITi9QYk4wZU9UUEpnc241RTgzTXE4NzFt?=
 =?utf-8?B?SjNYYURQdGVmb3FvZVBwRDZjU0sxVkxYd3ZIRFhsQVBVQmFEMThpeW9BakU1?=
 =?utf-8?B?NnNVSTNmSmhzT2ZTMlFUWTRHazM2di96bEk3S0FXUXYvOWhWVkRlWGVGVkRL?=
 =?utf-8?B?T3grQjNiNjNxdk5pVFlOa2pSWCtOQk9jTE9hYWFBTS9OTzZ6N2Z3R0MvSE9x?=
 =?utf-8?B?TEwvbExiK2VtSUE2U0tmWlBiazdIZnlXb1Y4Z0JSS2R6cW55Z0NuaTJCekZL?=
 =?utf-8?B?aWwwQjR3dUxtVzh6Wnk0Y0JKdXZVOVorRHNyTlV2L2ExUHFUL1Y5VXVQMUFO?=
 =?utf-8?B?RTRqY1NYVGtjaXJzVnFOanRVUTdmbHJRSG5Tc0NUU2ZGNTlpZXNuTkdDWlhL?=
 =?utf-8?B?WFEydkg1Q3pnZ0dnZGZmNjlubU50cHZmaGQrMk16ZkdaRS80YjFaVDFQRXFB?=
 =?utf-8?B?d3ZrYUlHeGs3YklWZkNhcTV3UWs1TVlFU2wrNDZPRDJWcUNibVJKNTRBUEVh?=
 =?utf-8?B?eCtyU2VrZ05SNitxSDlQYUEwUklUZW5KYkpsYUJKT0JwMXVjZkJXQ3dUcVpu?=
 =?utf-8?B?UVlQaXI3a3pRaHpENHQ4V255TmZSSy9Ga2lBRHhkS05WRk4yUzhsdVoyckQz?=
 =?utf-8?B?b2xZZ0FaWGNuUFVyNFZ1WTA1N2V3SzJOTGMzWWRLRCtCc1NGYVpYbkRHVm1r?=
 =?utf-8?B?WmMySnRwS0NRQkdQakQxQ0tDbklkZHZ3R09xaFVKU2RyRnFLUjJ5d0s1bUVL?=
 =?utf-8?B?ZGd5R1NOZU5Va1hzeXQrS1YyQ0swTDF4bjg3N2lWS2U4UUF4Yk5tZDNPcXhp?=
 =?utf-8?B?d0RSbWZ3TEtqL2F0UWxDV2xZc2hHakUxS0NuWCtmL2JyWFhpMlFRNTZXbkI0?=
 =?utf-8?B?eVVkZDU1VlF6S0RPTjJLZXpUY3dha0g0L0M4bEprWG51T1hNRUUzM1Z5TWUx?=
 =?utf-8?Q?gV6bLLxONSE9jWeGX8rc7qtrC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ab33ec8-a56d-4d0f-7953-08dd2031afcb
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 13:33:21.7287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pgy4w0txBD3/3XwSRUl0nBov9kiHTxTtKXQPS3vu92nM+whezLOe5MydyE8yJZ/4OL5t9h7+o/c9PdF9Hyosyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9919

Documents i.MX SoC's Service layer and C_DEV driver for selected SoC(s)
that contains the NXP hardware IP(s) for Secure Enclaves(se) like:
- NXP EdgeLock Enclave on i.MX93 & i.MX8ULP

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 .../driver-api/firmware/other_interfaces.rst       | 121 +++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Documentation/driver-api/firmware/other_interfaces.rst
index 06ac89adaafb..a3a95b54a174 100644
--- a/Documentation/driver-api/firmware/other_interfaces.rst
+++ b/Documentation/driver-api/firmware/other_interfaces.rst
@@ -49,3 +49,124 @@ of the requests on to a secure monitor (EL3).
 
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
+MUs, dedicated to itself. None of the MU is shared between two SEs.
+Communication of the MU is realized using the Linux mailbox driver.
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
+
+                                Non-Secure               +   Secure
+                                                         |
+                                                         |
+                  +---------+      +-------------+       |
+                  | se_fw.c +<---->+imx-mailbox.c|       |
+                  |         |      |  mailbox.c  +<-->+------+    +------+
+                  +---+-----+      +-------------+    | MU X +<-->+ ELE |
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
+.. kernel-doc:: drivers/firmware/imx/se_fw.c
+   :export:

-- 
2.34.1

