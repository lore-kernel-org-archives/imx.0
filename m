Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011037.outbound.protection.outlook.com [52.101.70.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1E3E3090CC
	for <imx@lists.linux.dev>; Mon,  2 Feb 2026 19:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770061420; cv=fail; b=t38J3Itmlv60y9me+DR2pzZM4Z/qx6pIfKbi+8u1Xb3l3mBR8ejrlUTxiOwn+2BWdg4Pdhfvo0cL0MYQu7+RLLJqb/1QzqZH+hjc3Mbk3bku1h3SNnlvX2wbS8XscMTjLBJ+C1JVbnFpT4Y3JiFi0OtqxjDR6uqvH5UsjF6/HE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770061420; c=relaxed/simple;
	bh=0fml9kzPVTnr3wD2k+kavxpLbPEpvDNErZBOKSjh1zw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=RrucTyo2S92A+LQvLY5CCUgBkcEPCwMRykgOy37DK9aPio9So5ZjnI/nJGfBntjF5E1oQq7BnS8xgF3bhIfEYtM6O031B0CR67VGjjhhA8NNMi1mgqurYeT5yVOxuODbGFcQtmmhDBmfn/Vu9PQW3JSSOygIV9uQn3vS1gagW60=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=DKE+S47U; arc=fail smtp.client-ip=52.101.70.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="DKE+S47U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b7OQCvGBHXIYI3ur9VoPwi60w7fsJisN8KKQx+OeoLf4yHrw6N3PSEU0qPlxHMNBoM/pMUu5JV8b481g5l9bZr+NR5FSLTn5DnvPQVG6WvxfHb0s8h3tO7mTqEc0GnW06rNt4Rqd/y1143gmFEVCcyCp8xUH3huyiuz3HvXrlmHl3O8XPKCPv0nPp2Z/+3ar6kUEY8aQRr27uRYyJ8QCBB9e3STwUCSsuEGr13NjEOErvUwM6DWpo5S4KWmgEGtMgdsC9CZfhMv4R5ZWxuhk1cR+BnOrAzxbP9fKFwBCOcCd4w/PgGUxHxEjZKi2uSQFaONBmhZClVZJ/FXuO25++Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=757OPavUvr0dr/IegzgOEPWsh2nXLTBE2LTCR7vxJHw=;
 b=sZfxqhZP3nUuxp1N6uOZwY5l0gRtQWe9HMY7rD0RU+fXc0iWeIoKYE9+RpUhsEuuz/iDvnso8UdqnS2uvxB+3sR1H3dm3inQ19RCpyc5YFurQoZgWzaFxKcPyYyN8XTdCqv66FT76avi8omK0PPw92NtFHXcGkm0VpqhzeTAAhOQQTCV7VDci+sP/yqZJmHI1AhxidYKtFpKdyij/ae/WBLlf9ryYnCfQBbs4tQ/13YTeBrv0OX1y/1edwjyh0aznUuZTvUQ/+Nif83QnzFTLBAmfW7tR/3DgdHhLqLDHiFYSo/aj4WdK4neHdRaR33kCvHuC30MfJdMUvyEgyuWOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=757OPavUvr0dr/IegzgOEPWsh2nXLTBE2LTCR7vxJHw=;
 b=DKE+S47UXpT7v9UWl6s67fUuVuL/9LjTBQPPAzO0tsVGdmjxqmMQrdLxHx45AmJnjvAcxkYKqb+9CsAc1UNew7l183iRgA3RVEhJTNG/qgMDiWaINJlwfl0rN5U1rru32XNYLWy9rNyennBxx2jhNfHiu40S/Wy1+CJ4IelkhZjs2Viqxim7p7lYwrHZlv2DdBEiuHogVrpYSZZ8Fx8OO7v++u9sg0lOV4t4zRNjIRIkRtdNH1U7OimB25QSXgFJHs9eNTj4xDReaUMuG9DBrA/i604Zc4qTvlfgyT0MdPT5HmBBtTI4LlJ2BhvSA8iTh5m34GpTRluCsD2vgeVUXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB6800.eurprd04.prod.outlook.com (2603:10a6:803:133::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 19:43:36 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 19:43:36 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 02 Feb 2026 14:43:19 -0500
Subject: [PATCH 02/10] ARM: dts: imx35: rename i2c clock-names to ipg
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-imx31_dts_warning-v1-2-434dd2643c3b@nxp.com>
References: <20260202-imx31_dts_warning-v1-0-434dd2643c3b@nxp.com>
In-Reply-To: <20260202-imx31_dts_warning-v1-0-434dd2643c3b@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770061408; l=1450;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=0fml9kzPVTnr3wD2k+kavxpLbPEpvDNErZBOKSjh1zw=;
 b=0dW/u8MuViBM2+38Gc5Ndcnw88vkxrUT8pgjmjmqu0EdP91MyALeYJo4jt2oh8RXu6mb4IFVn
 IqEmgwj4ZtWA+HqPGeyJj4tMgPEHd47uWOM2avgWxq10lQWeLRoYjcL
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P221CA0006.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB6800:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ef1eba8-02cb-4099-d6f4-08de62935b36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RVJyQllUQmpJOEZsbkR1Y0NlV0JUSy9TNEE2dGtTMjh2eE5OMmg5ekVyNC8v?=
 =?utf-8?B?SWZnbStmZ3YwbkxCT3pYOGV3dVhObzlkTFVOOTBlTU9sMFdLY1c3blozRWRi?=
 =?utf-8?B?Ui9ac1JyWUhCN3pGY3RPcFIrR2xlZy9JYjhSdUQ3VVNPaGN3Z3dQYThYVkNZ?=
 =?utf-8?B?eU1vUEkvVzlxdWluSGcwSzVKc2g1dkN2SmpSMnRHN2tQamVXUUdhTGc1Y1J6?=
 =?utf-8?B?UytSMG1Pd1NOT3V5M2VZU0VlWG1SMWxpZlVaUG0vQmhIQ2hSZ3lzam9SbWNz?=
 =?utf-8?B?dTdtNXVSNVdhdEpINHpHNkhGWVFoYThDUldHRXI5eG5ndjZKcFA5ak1ldGtx?=
 =?utf-8?B?b3BxRjVJKy9YMWF1bTQ4bFNnVE1hRW5uNFdZVVVtek5NUittYlVXcWtWZldw?=
 =?utf-8?B?WnZMWXZRMTVVQW80ZWs2TDBaNm1PVUhQMmhRWjkzK2NWTGY3bkRkSitTNm9V?=
 =?utf-8?B?V092RzYxVnhjbkk0MVNiRkVCY0Q4QytpL0xhVWhRRTU2WG5Od2tVKzhFM1I4?=
 =?utf-8?B?dndBUGZGQXVyQTl4VXNZcFIzc1NzcHdIN1N5eS9XUnRsQTlZUU1LNVRDKzE3?=
 =?utf-8?B?aU94SEJWcktJTTVzMFI5ZHJGbnJTZFJDb2kwTnNEempQdG1nK1Yzb2hETXNM?=
 =?utf-8?B?Um1SVzVjNWFLejliVzEyNFRhdmM0L01MNjNyclZzcjhCaUZnelUwOGEyUFEr?=
 =?utf-8?B?MVViTjIyMHF5T2NxMmZULy8xeEVKTFNrbU83YnhhQnpRd3U4QmdXQTVacUlD?=
 =?utf-8?B?Z2IvcDFqODN1Y1VjclJOOG81TXNLTXh1VS9aa0JkUDVhbDUxT3JFUDZZRFYx?=
 =?utf-8?B?QmJsdVF5cTNZME5JT1ltT0NKb3RzaUZodXlNTG5wcXhMWkErbkJ6SndqU0g5?=
 =?utf-8?B?UG5lU24zOU4rZXdjQzMwOTFiaWJqb1NGWUh0UEw4TWR1b28zcEc4TUREOExZ?=
 =?utf-8?B?Z1g5RVJXc2p0YTkwUHdHNS9WYXZ0bzVCaTNSb20xaDdCRW1vNU4vNkk0SVRv?=
 =?utf-8?B?S1RTdlRUNlJpeUFtRHdoTW1GZWdHQWVhcUZaRE9KTzJpYzRZell5em9GSGk0?=
 =?utf-8?B?SFhrM0pGQmlJT2IwNlE2TnJKQXM2aEh0MVZFMXpObW1qUnpzdW5WK3dPenBk?=
 =?utf-8?B?b01iS0FKNDVWaUVjUHZIZ2ZhNGxLdzJLQTV6SHNDdnlpRExOTVlJaVV6QVhl?=
 =?utf-8?B?TzVhdldSYWUwdlhaRmwzMzFxQlpIQ1dMQmozWGJDWlh0aFc0eWtlWndCeldp?=
 =?utf-8?B?VHNqOXZMSVlVN0tsTWdpV3dpSUY3TmdKdjRObWJSNHI0RXZPL0dISDh1Mm44?=
 =?utf-8?B?RmNtMWFLNS9RSmdqdExLWUVGODJiVGpnRzRObVkwSWZLUW1GajQrSXN1RnVM?=
 =?utf-8?B?Vy9uUmdjYXJBUFMxWmFEQVpITCtNd2hDYWNEWk9EbkpqRWt5OHUxMU04T2lU?=
 =?utf-8?B?Ym1RYzAwUWtSZkxwUTBQb2tuL0pUSnl2dHZtNFVabGlWYVhVQzF5NDdpM3NJ?=
 =?utf-8?B?bVlSN1ZlWjJiNm1DZlJOMWlaZFpiQ3ZxRjRVazRCOUxva1ozK09iSWM3ZitY?=
 =?utf-8?B?bHorZVluQkc5blRzNDQ1NDNiblFIN0JSTGtvV0FaejVVdGQySElDWUNKbDl5?=
 =?utf-8?B?NHU4YkE3M2c5ai9GdzU2SzFZTmtyL3lWRnMrdW53ektJSWd1Wi9VMVAxYXFD?=
 =?utf-8?B?RVU5S29lZGdYb3RIV3NxRkVoaUhxU3gweE9oWWRiUWVSOHluRDFiU3F5T0RU?=
 =?utf-8?B?SUh1eXNzRjh5bTdoVXJDS1dqdHFWYjdBUENXakFUSld0c1VuM2s3bEpiVkFv?=
 =?utf-8?B?Rzl4bGJUejFDSE9GU1FRZkdWNGZuQXNxbGxOdlp2aGhRdGU4aitFTVlvS0Ra?=
 =?utf-8?B?dG5jZ1ExenJDWnV2TkUxWkxpM2JObnU4K0t2ejJ0RVN1MlRTSWhxUEpwa21Q?=
 =?utf-8?B?RVRsMU9xZ0c5bkRCUGYwZnFwVmFHWDN3VHZxdUJjTkk2dnF0c3dBNXAzcTRS?=
 =?utf-8?B?VkV1Q0VHU0Z0SjJ5TG5qKzlNS1ZOclVxa0Zzb3owTGxDNm0yOE0wWStxSE9k?=
 =?utf-8?B?S1NuR21IOVBZbUJnMnVKNENJS1ZaWHB1blpVcmM3VDBHK0xtUlphZUp6S3o0?=
 =?utf-8?B?THZmenhEeXpBaXh4RHdsK0JvM0hUcnAzb1lYdmxkRDBYNFRrSEFKVjRaRHZi?=
 =?utf-8?Q?e+qLMCBNbPW18TM37yXFsGU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1lNSzJXamNGNlBSVGFWNFdHWmV4V3g2anRPNXU0bVJNS2lZTEU4d1FPb3Vl?=
 =?utf-8?B?MU9pRmhyZFNmd1BXZm0ydjRJQmpka09KMFhTRElOY1BiTUs0T2hCbGQzYWN6?=
 =?utf-8?B?UEJYMUFjVUVaaWdCSWlUZUlscG8ydGxKR2pEaW9xSzRVejd4VjEzREN5QjNz?=
 =?utf-8?B?bFBQM25TdkdtSndXQSszUFVuUlliN29oZ2ZoNnNiV014cUxCc3lwci9HMURN?=
 =?utf-8?B?VmRpQTFIcWR2RUFHdkZHNEdzYXB1cGZFci9OT2xxMDhPOUh4ai82VDRLdUpP?=
 =?utf-8?B?VlJVc2ZvZy9KeVJKU1RNZGFzMjZuYzc2V0M5RDd4SVFGUFBoOXVaS1pKQzNI?=
 =?utf-8?B?T3grVUpLeEhhaW5ZUHNNZTJWU1krZEIyUk1BY21ja2RybTd5dTRubmZMK25M?=
 =?utf-8?B?c3YyM2RLc0UvTHE4ak5Cd0JQMTlmenQvTVB0NGZvenNLcSttTHVIVHl2b2d3?=
 =?utf-8?B?L2ZlcEdhWUtlWkdlaDBodjJ5WGZubVR4VWxvalZrQUM2NEU1VDJVQ2ZINDlU?=
 =?utf-8?B?YmxEZm5hT0xyYjJYZHFkRittUmErYlJoVENvRmNjNUJvUmhmeVViVzlnZ0Rz?=
 =?utf-8?B?TENUeTd4OTNacnEzbEZQeHZ2N2NzYXZwM2UzNkU2YU1YZXhWN3JiWWFRMkVv?=
 =?utf-8?B?blgxR0JPU1VYU3BTVVhjV2lpUmV2Vm1XOUNmUHZDbUt1RUc1SFZNR3B6cWxS?=
 =?utf-8?B?WlZuZERqSk1HNTdyOHFRaDF4djFCOHE1dG1EdUx5SFdQNkFyMUw0Z2d0RVF0?=
 =?utf-8?B?QUlRSmltQXBjemptM3Q2dW1wR3JzYkYxQzhxaWppZHZvcWRXN3U1VDBXeUNx?=
 =?utf-8?B?V1BWKzI5QUZPTGVFcU1CMm1ld2FEVEFsMVQybTFtZGplOFl3aUx0UjVqK3ZU?=
 =?utf-8?B?cjkwTjUvUUtFcEZrTXVHVFRlckVwQnJRT1kzeUY1cU16aGYzckJhUmdqZmVx?=
 =?utf-8?B?Tzh0dnQxWTBoYnJ3QTJIZitlTzM3S3BwUEVnNytGYjVmNmxLcTJuS3VyZmpI?=
 =?utf-8?B?K2ZXV3VpWVRvQS9KVjdSQ2RJM3k5eWpXZ2lRS01xS3FXRzBKY0VtY0pyVzhN?=
 =?utf-8?B?ZmtEMTRHRi81bENsRUZnejF1aEJXd2NGeGF6cFJZZjRnckJIM3BGbGNURW5z?=
 =?utf-8?B?cmMxdWFMUHdrNVJkTVBNSTBqM0hwMys2QTNnbEtnUmQzaHNManliaFB1NkFZ?=
 =?utf-8?B?N1d4cjYxYkQrRmpXMHhOYnlkbW5MMEZ3clU3S2cwTTlZRnF6QktuNlFMTlB4?=
 =?utf-8?B?R09BNmtlMEFpNldoblZOazJhY3dRRjB1V2lwTHFrZkYyWHRVcUc5SWt0c0k2?=
 =?utf-8?B?M1UyYTlIV1Zoa3FsYUc1Q0lwU1FBOXpIYjc2ZWsxMUZ1SVM1QWlGTm1kNTNC?=
 =?utf-8?B?YlVRK0xRUjVTSllZRXd6YmcxUHlZVmtjZWp3cnF6S0txa2dHQzhLMlplUER6?=
 =?utf-8?B?THQyTFN4MlpYbEI3N3AwcUZaSHpoTmJhbVlZSGhtOTdDcDFvMzJtSjZrc2hB?=
 =?utf-8?B?dHg4WlJaci9NS0ZsdEFQeXpPRlpnL09kM3RHUzNhNHcwSzZMSE9KZ0RjdkFv?=
 =?utf-8?B?eFRHc1dQMVFDK0VTM2NlcUU5VGx2Wms5Q1J6emIyVldQSWJ5WjF4WnFONExG?=
 =?utf-8?B?NnNaRFlyMmYyNVBZeElTcVVnOHRiM3U0MWZyRU92UFA2eTJFZU94cWtxc2Qr?=
 =?utf-8?B?RDBhSGhYcGVDOU1BOG9UUzYyVzBxaUdtNjIvWFdnK0syeWZJR2hNQmtaQ3V6?=
 =?utf-8?B?eklMWHhVNndLN1kvUmNhQmdzeGlOOFNZeW1iSlpTMTJhK21xNmt4K0hua2Fo?=
 =?utf-8?B?U3RuWUpyandpWWJrcTNBZ3NyRTBwRkVjYTlGK3hJQVhSU1h3dGtuZ1d1WVM1?=
 =?utf-8?B?U1dSOFR2OVlWYUZNQWE5L1VxRDU3NGlxTFIwclpCb3VhOTE3QXBKVUw5ZUNG?=
 =?utf-8?B?QXRZUDNEUGdIa0xnREI5azJlVmVncWRlOWErT0Z1ZURmeHRDZmtDWnk3N2Fi?=
 =?utf-8?B?aGpiRXhDaDZUdXNPRzZXVFRSNldxSVJZWDR1ZXhTYXYyT0hwaXJ3UFF2ZGNS?=
 =?utf-8?B?aWM2WStCbFNKeWNUQ2FGQmhSekVORVFrSlNuL2xLU25wdUNyMFVISmJMOEkr?=
 =?utf-8?B?TGtqb2p6Mkdjb082cTFxaExGSkYvaVRnZ3lzRmxmN0t5SGhBR1Fjc0pOTWFV?=
 =?utf-8?B?TmJlQk1QMmlMbGRaYWpYbGdvTXlzZVlJWlJvb0lvMkJ6TitnK3h2TkxXK3RH?=
 =?utf-8?B?Ykl1eS83REtuSnNWM1QvMlo0WUlzcDNzZVJhVkQxaEVVSWRodU9xdnZscmJR?=
 =?utf-8?Q?cCbyOkx92VN2Gn98gh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef1eba8-02cb-4099-d6f4-08de62935b36
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 19:43:36.4759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NisUcE88o41VAI7gLzExvY6fNy/nZN/CSsNRODf/vqq8rx25N/CxT3GSurWt4yuQv+pDhCZHEBycaEkRTwbR5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6800

Rename the i2c clock-names from "ipg_per" to "ipg" to match the binding
documentation.

Fix the following CHECK_DTBS warning:
  i2c@43f80000 (fsl,imx35-i2c): clock-names:0: 'ipg' was expected

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx35.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx35.dtsi b/arch/arm/boot/dts/nxp/imx/imx35.dtsi
index 1c010a83d5df138562cd086c7b10d34431378add..aed7fe2fd6b93fe70a0abc7213fe0b874afe579a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx35.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx35.dtsi
@@ -79,7 +79,7 @@ i2c1: i2c@43f80000 {
 				compatible = "fsl,imx35-i2c", "fsl,imx1-i2c";
 				reg = <0x43f80000 0x4000>;
 				clocks = <&clks 51>;
-				clock-names = "ipg_per";
+				clock-names = "ipg";
 				interrupts = <10>;
 				status = "disabled";
 			};
@@ -90,7 +90,7 @@ i2c3: i2c@43f84000 {
 				compatible = "fsl,imx35-i2c", "fsl,imx1-i2c";
 				reg = <0x43f84000 0x4000>;
 				clocks = <&clks 53>;
-				clock-names = "ipg_per";
+				clock-names = "ipg";
 				interrupts = <3>;
 				status = "disabled";
 			};
@@ -119,7 +119,7 @@ i2c2: i2c@43f98000 {
 				compatible = "fsl,imx35-i2c", "fsl,imx1-i2c";
 				reg = <0x43f98000 0x4000>;
 				clocks = <&clks 52>;
-				clock-names = "ipg_per";
+				clock-names = "ipg";
 				interrupts = <4>;
 				status = "disabled";
 			};

-- 
2.34.1

