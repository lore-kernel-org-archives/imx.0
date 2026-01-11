Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013051.outbound.protection.outlook.com [52.101.72.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7AD339863
	for <imx@lists.linux.dev>; Sun, 11 Jan 2026 12:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768135270; cv=fail; b=b1HjsLMA3/hDJ9Z1ESo5gtAVpTwtCd1zphChXO33U7/DNU5Dv6J+toFPF3QFRYZSWU1H4oyuKgkfXrjYIVT8UagH5oSHZ9tbCtXi21VfaxenvfAk8mxHsKS5jwB7gIhK3SRrPCQtlCIjCRfit6eaXlIBF+9NJAubV/XDa/geUA4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768135270; c=relaxed/simple;
	bh=CSs/i2q4lHEAS6nOO8gA0MnUohQ7+bCbLnOhsKKnmVc=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=GlRamdFW9k5Vd6sD0+wGIIOQOswATpngMzrOu5+d9ScnboDNObQsejuv6F6z5abljZPIta1jLwmO2XCPd+PkGVAnU3q7IphJpqFe9BayDx3XV26NDM2kJ3VmXrGlutippQ7hxXTElE7V1wKSf2BMzWYGeZ4jwd/rHZOpvL/R968=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tvNjbIqG; arc=fail smtp.client-ip=52.101.72.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tvNjbIqG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yUGCyceYJGK8WPkE3AgPUCifgxF25SLsq6gcxxBLOfiEPzJMFpxPoSRon1hPzb1CCDeZavzL1OUi2Dj/9ThdhGh0IEnK2MMPWkdtiE/NEwkIApHZt4r4MgJrAHlt3fb/DfamoIIJmF6/gavRgK19kKtt5N67gSwQzuzLmWxk5DgoAw6fO8jHkVcdMDSI4zZCJVUOu/S9cuBgLb/yayoG3EoUoU+z8Wu3dVfvBZWSJ5r9gS2T3/+PIFH5UGw3cHe8vLr0/5vzzDe3BpsLCz/81XzSxM/vc0z1jHl7lrzMk3607QQ1JkXdx12esbm+Rk9e4VXNeZvJhw+7cbAcFVX6vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/JTawnKEe6HYiTG01Z8T76SK2SiZ2+yU2mBtu/nl0Xs=;
 b=KumucRHQ4gFcG3FHojjIqDeZ5eQsS6QBryHNmSyKdnim0GvBSlfbjZQYTPpP+mSH5syYA9dBVih7G4TYmhbcV75oI+7pC7/0j8uhf6PN/kWzbzHghH1knsgtYO1Kz/ar+pl2IT4VDheZrjBrd3o4e6cIwXSjl0TL9SZrCNGAKhsjcdOdwxEiLaBciEvKs4YWBSzof8y1Wo0jdrLN44ysrkh9/tAlO/03wlkzixFmjo7U69i+7rRYI8C7r0gCDX7q53+6gU+2fi0PbtU74FOJ1Jx4Cn0PSUn+TGbkFLGQggy+iCBhudNS5vJp4WvSlc872Y9HqQMDGauX7lmw57Xdsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/JTawnKEe6HYiTG01Z8T76SK2SiZ2+yU2mBtu/nl0Xs=;
 b=tvNjbIqGtqS2a+JR5hzvynU7IcwRC00Tx3At+hapRkBtRNTVdaAOglCOC082r0xWXPAmEtruqK1Cdcq33LUo+XrWcLIOXOM4y7sliWggrLtQaypOiaEPzk8kFDlQLlGgg+kH/tn+wwA7jIBp9IZgvy58SpJ1hiS9nKEhlqV68cy3XqUg0hcUsZ1KrWpeYAOLW2TF0fDVYNxihTk+jPjo0kNQb+B4O92dXGTxoFIrdQ1IKpIG5PcTq31hmnc0a6/LOCPYIJHbHZ8e8IFXjk0GrpNFj+NRVGTcbt8nIvR6SIf8iPXE3lZyCJlpf9fCQRsiIDhNZJPoBrhmCbGaptainQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB11041.eurprd04.prod.outlook.com (2603:10a6:150:218::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Sun, 11 Jan
 2026 12:40:56 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9499.005; Sun, 11 Jan 2026
 12:40:56 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 11 Jan 2026 20:40:10 +0800
Subject: [PATCH v2 04/10] arm64: dts: imx952-evk: Enable UART5
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-imx952-dts-v2-v2-4-5773fa57e89e@nxp.com>
References: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com>
In-Reply-To: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:196::18) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB11041:EE_
X-MS-Office365-Filtering-Correlation-Id: 564a25b1-83ee-409f-f2a0-08de510eaa3c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NmhyTElya2JnWUF2cWNKWVJwbEZzY2VxSks2ZXpPVjBocWFPbURJRGcxUDVP?=
 =?utf-8?B?cEZHbmVpL2VNajR0Ui9FYnFmUVlQSmsvZDZGOUU4UGxENUR1ZVIveDVSMy90?=
 =?utf-8?B?RGt3YmJNcnBmM2VqYzNqZURwQ2RGeDFzNmVlcjhpQWVrN1pPVmRJR0hJdE1D?=
 =?utf-8?B?aTJOYndOb2ova0NBdnpSZVA0bkZYUHY4dGhWNTFyNUNNcmxib3liWFNMSUtE?=
 =?utf-8?B?WTU2K0RvU2RVaVJuRXM4NGwyR2E5ck9MYUZTLzVOd1B0VEptRGNtc1pUbk5t?=
 =?utf-8?B?bjd4dGxyTG5RdXBoMEVVcHhrOFRrQXRpcWdHMEZmQWRUWTg5SnN5akVYRUMz?=
 =?utf-8?B?THYzdjJxaHZmbXdQRm1SVnBtTzlaQkN3NmUzRkRwMjJLVFNveFpxdjg4ZVc0?=
 =?utf-8?B?UGVZd2kzOHlMSDNIdkwxc3BsMFpWNXJ6Vnd0bzNBdE81ZmhvendEaituOXRC?=
 =?utf-8?B?VE0zZmpPWlBKMVhzOCtaWHNrUmZpMC9zMFQ4QXFhU1UzcW4xa09SeUdZdjY3?=
 =?utf-8?B?Q0kwMnlTdWNvRSt4blR6bi9ieWRSOUtZam9RWVRtVEJmV3NsUUIwSXI2QndJ?=
 =?utf-8?B?T0NDRVVuemFLWEVNSzUyeVNTV0JIczk0K0VoTXBCNThhY1pXUkZPcHhhYWtW?=
 =?utf-8?B?a0RjUWRwK0xxOHhIb0FadWxWWTJCYlpDekp4YUJITU8zNm5hN244dWxaUFRy?=
 =?utf-8?B?RENibHJOUGhWditPWlpOdmdjaExUTEhzN29lUEg2dzcyMEhuSUZlZDcxTCtX?=
 =?utf-8?B?dkdLSHp1OTE2OHJLZFE2Y2ZwTytjM3pYRy84ekpqbGFZdlYrR2RvZmtQckhy?=
 =?utf-8?B?d1l1eGZKL0RJNWlvcHBjL2dseWdHeEYyc2xUY05XN2xsM1lHaHg1NVoyalo2?=
 =?utf-8?B?OGZ5M28zR2c5bWFFNDkvdFA1djJpUE9JTWhyZVBoNFJJbCtNWGRMNldpdGtY?=
 =?utf-8?B?cTNqdlZGczFwK3N4d2FzcWx1U0V2anQ0WTRQcTJjczZpYVhtVzQwVE5mcFpp?=
 =?utf-8?B?L09OMW9FNkhnamtsdVZhcUE5YWxocWYySkpEcSswNWV2L2lQZSs4dis0b3d2?=
 =?utf-8?B?OHdHTk8xQ0ZyNStzNEVWZk9aRzdKcmJuYUgxbzlGN0wyRGI0QkZyRXlrRlBI?=
 =?utf-8?B?UGJXK1ZWNGxiWlpnN01peHQvWDh6RWxSbzNzNnNTNkVtZ2lYNEE4TkphVldL?=
 =?utf-8?B?WkllYnR0UkZ5WUFBdWducS9iL05IL1IxL0o0Z1FqZm91VkV2UnEyUzBPVG81?=
 =?utf-8?B?d1ZPTHVhQWs5ZW1pajFzNElkblNJYkQwbFR4SkZVVDJCeVJkOW1sQWFTbk44?=
 =?utf-8?B?TlFzZjVyeGFDZkRGUUJvR29IS3BOSW1qTnZsaGZSSjZleGZiRW9JVWtEeGp4?=
 =?utf-8?B?T0wvR2tSMldSNTZpUWc2bGkvRUNnNzhmUUJkVkZJYk1XUjN2L0oxSUJLL3Er?=
 =?utf-8?B?QkJPYmxmSXloVVQxN05Fd1lNZVNiVmJMdXlJKzlDQzhuNXZHUDVvV3hOeU04?=
 =?utf-8?B?a3lWa0Rpck5XUHRlNUF5T2JKZGpta20rOVVzWi9NZitxVWNMaU14WTBiTkpx?=
 =?utf-8?B?UTRRRU90emV4VWlWMjJnN3ZZY2JwaFBZNzI5cFFOam1xejloUG0ya0RMTzNT?=
 =?utf-8?B?SW9XWmJ6MHpkclZmS2h1WHRybTNtWnJxN2JMbU9kNVh4SE9hWkk1bHFPYmpq?=
 =?utf-8?B?NVZlUGJ0clIzanlDcFdscHdUM1ZwWEhIT0g0b200WUNqR1VLcWZxYmQrSGJJ?=
 =?utf-8?B?NkVjRGJqa1JBYmtPYU83bDlGUEZDRDIrYlJoTEZLRGVwNHZHSGd5M09TbTB6?=
 =?utf-8?B?Z1UzN3dBbzBtN1RoZlJHdUFZeDZHZmR0MjJiQkh2ZlRQb21iU2JLRW9sb1dJ?=
 =?utf-8?B?YS9IbUNBRGVEcFZNQUEyQXlzdGJwYXgxU3RtZmdkcjB4SDMxTE54TmxoeFhz?=
 =?utf-8?B?dmc0T1ZNcEVyVnVxQ2RrKzhFdDZ4T0hwTU5vUmc4R0JjQThuYXlxRm8rN2R3?=
 =?utf-8?B?YlUzRmx1dzRpZE1PdjRtTnNVRHlUU2VBc2ozdWhwNVRNQUJXNGRQR0JQUkxm?=
 =?utf-8?Q?wHsPPt?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c2RGcDVDYkYxYWNTYmorMERkQy9Ga2N0V1k4U2M3THRTZE1PK3hIdDJGQTNP?=
 =?utf-8?B?TmdhK1NXRlJOdnhKb205ckFiQTFtNFZleEFpajFGellySkNYMzZEOE1NRVlu?=
 =?utf-8?B?enZaZ09TQ0I3WkxNQkNSK25qSTgxL2FUYytuU3BmcG1rRXpKbTd4VGdNWG9h?=
 =?utf-8?B?UCtCVmFDU28rYXJGRnRBekpCOWdmNlF6dnNNN0tqczJWdWtCalhtb2hsd2hu?=
 =?utf-8?B?Z2hOY0hCNU9pMmFCSDFOVWMwM00yOUNIQ0V0OGNTSzFyOHI1cXptT2h5RmpD?=
 =?utf-8?B?d0xkVTJoalhrYkljN0srOXB2ZTFHTHdoMCtEM21aeEF0UW9acXpQbkkveDFq?=
 =?utf-8?B?dkJFUmtxR21IRFc5UWpmdGh5Sm9JeTFuenV4cm5RTjhtc2Q2dWJnK2Z4Skho?=
 =?utf-8?B?cnYwRHNIeDg3M29MQ0dnV3RlOGhxMHRqMWdIblVXL2FaSmV4ekZZSUNRbzJG?=
 =?utf-8?B?RTAyNnVOclc4Q0t3QjRCMW5aVW90MllzcDJUSjJkTUtTRTM0UDhjQ05nL3l5?=
 =?utf-8?B?b1oyWmZuK3gwbnFyL3hSVkl3WEdZaEhYTEp6WWNnbE5YVkpBWUkrdE9aZy9B?=
 =?utf-8?B?U3FTRjB1VHp4aCtuZDY2c3BwUS9CUWJDVUlhcUM2b0FGSnpBKzF5aEs3S3NO?=
 =?utf-8?B?di85d2lCZ0MxeWVLdjdCMThCYWhCMy85MVZNQjBRdFU5VWhDaGR3eSt4Z0tB?=
 =?utf-8?B?NE85aTVoTVFTMVB5VW1ySU1iMm83a2dBaUNxT3VUVEE1NkZDWDV0MTliT0ZM?=
 =?utf-8?B?cElSN0JhRkVQMGIxeVhZRlFoWTBzUUFOei9SQjlNaWhKVjdYSkJSSlp3anVa?=
 =?utf-8?B?NW80ZjdGQ2VlWm9EZmpQYlFOK0QxSUVYb3dFYXQ4VSs5UVFNR2t2MUNaaUxS?=
 =?utf-8?B?Ym83cVVGdXZjS2hFZVkrK0ZJUFF4d3VlUjFvaUtyZmhHVmZKc0wwRlIrZG9t?=
 =?utf-8?B?TkpWbVNqOVFWeXpRd3hPazhUTmNzQ0IyMFJsRkZoQWxQOVNYaTVkTHFJc280?=
 =?utf-8?B?eWN0OC9vbURmYTdCOG9DcDNBcW8vOUJYblBDbHYvbk1sZzkxWkhKOFkwTWFZ?=
 =?utf-8?B?ZWZoNU9wQjk5Z2ZiK2gzUU8yMlRaTXRKcis2bklFTG8wQ1JDalhUK0svbXVv?=
 =?utf-8?B?SVcwQ3NETGs4RzI3UHJ1YVhRNDFUVng4WmdqYjZ2UllFSFhoWFZlSnNGZ1Zz?=
 =?utf-8?B?U1JBWENjOVpkL3BEclNpZExZdU1ZYTgxNG5kS1p1b1VRMmYvcHQ5TERzdVdl?=
 =?utf-8?B?ckRkL3BFRXpaRU5NcERJTjRxeHB0cDhPK0lSRVJhR0hrcld6SzJhSWdIV1dG?=
 =?utf-8?B?d253RkJJK0JpT2pnRE5kcEJnU0IxcTRhMVJKaFhEcnNMS0FHS1BzWG4zNk9L?=
 =?utf-8?B?S1l3aThHa3hLbHorL2taWVQ2YjZLZ2ZIUElrOFJ0WkdLaWM2MG9vWTF6OEx3?=
 =?utf-8?B?WGlXc0Z3QjdwOHlwUk9IS0Uyd1A0UW12clVIbGpFK1ZaMlU1QkxJdUJSYW4y?=
 =?utf-8?B?dm9OaFFCTjF4YTR5QU5WQ1lCdld1c0p5RHpLV0haNGc1VEg2MWFLSGFLcGIy?=
 =?utf-8?B?SG52SnZOaWprZnJvVEhCWmovL1VsSm9mbmE2VU1tRzl1bTJ3MG1wYlorY1pP?=
 =?utf-8?B?T3IrRGoveDFMbnBqV21BVW1mWFU2dUszY2NRVDZqdFppUHFESXQyejFNUEdX?=
 =?utf-8?B?NVRrVVpRQ2lrV0RRUUJSTm42bXplYW4yWlZ1cXhoRkhGZUxvZlpGZVNyNDVv?=
 =?utf-8?B?ajIybWxQdHpHVFJGMVR1UXhNVEVCQ0drSkhoZStFU3dhM25DSWNuZHFubm5D?=
 =?utf-8?B?UzliYUR5YzFZQkNWdDRoaTNmcVU5akVYRjA4ZGxjSWgyK1pYRkx4Y0pNNThy?=
 =?utf-8?B?TnBNMG5BcHZRaXVyNkFoQWswV3BZd0k2Nm56N3pjVUltT25sdXp6RHdDcENE?=
 =?utf-8?B?UmNSYkNJekNWRlRCTkt0T1I4ZnhNWXpSQVgwcFRnR2JTQ3dRR3kzVjFmUEhK?=
 =?utf-8?B?SndoQTRPN09JMTRMbENhY0pzb2JFbnlxKy9xR0YvNGg0OVVrbFl1dG9PejlI?=
 =?utf-8?B?OWZrMnBya1J0ejlqa2dPanJpNTcyRkgyVVdnR1UxT3FkNzhuU2liUUtSNXJL?=
 =?utf-8?B?SFdxSXc1azBCVXpua3cxWlZZeENwN2hyNzA2eUQ1S2ZCT1FlT0tkUS90cGkx?=
 =?utf-8?B?TUxuQXBKMUZGbU04YzF5d21SWHd4QmJwb0hpNVZOcTUwTnBoVXRaZFNaYnRq?=
 =?utf-8?B?T1greFpPSlp4dUh4cjBXM0s0UnhFck1NQmh0aERvT1p5SnJzUEloQUlQdisx?=
 =?utf-8?B?L09wYlNYdnJtblB6QktpY0FRemROYXlZVHYyeUNjRGxLc0tKakdXUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 564a25b1-83ee-409f-f2a0-08de510eaa3c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2026 12:40:56.1589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FCmuMSZ48VOY317lz0z69t2OxcDxD8jQh1i/eT/Zkq7PdIo+V2By/PlQZzJOYn1S5C0MtFQz3WOjLy9xXnFurg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11041

From: Peng Fan <peng.fan@nxp.com>

Enable UART5 for using Bluetooth.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952-evk.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index 98f2f96a91cc37acff64615e85cb718cb666a00b..dcc339b766a21b4f39031cf33673a4fdc6be1937 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -28,6 +28,7 @@ aliases {
 		mmc0 = &usdhc1;
 		mmc1 = &usdhc2;
 		serial0 = &lpuart1;
+		serial4 = &lpuart5;
 	};
 
 	chosen {
@@ -199,6 +200,17 @@ &lpuart1 {
 	status = "okay";
 };
 
+&lpuart5 {
+	/* BT */
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart5>;
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+	};
+};
+
 &usdhc1 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
 	pinctrl-0 = <&pinctrl_usdhc1>;
@@ -291,6 +303,15 @@ IMX952_PAD_UART1_TXD__AONMIX_TOP_LPUART1_TX		0x31e
 		>;
 	};
 
+	pinctrl_uart5: uart5grp {
+		fsl,pins = <
+			IMX952_PAD_DAP_TDO_TRACESWO__WAKEUPMIX_TOP_LPUART5_TX	0x31e
+			IMX952_PAD_DAP_TDI__WAKEUPMIX_TOP_LPUART5_RX		0x31e
+			IMX952_PAD_DAP_TMS_SWDIO__WAKEUPMIX_TOP_LPUART5_RTS_B	0x31e
+			IMX952_PAD_DAP_TCLK_SWCLK__WAKEUPMIX_TOP_LPUART5_CTS_B	0x31e
+		>;
+	};
+
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
 			IMX952_PAD_SD1_CLK__WAKEUPMIX_TOP_USDHC1_CLK		0x158e

-- 
2.37.1

