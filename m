Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2044.outbound.protection.outlook.com [40.107.105.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22491F4712
	for <imx@lists.linux.dev>; Tue, 21 Jan 2025 15:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737471995; cv=fail; b=bdGT6vSofzjwzuTnCE2pScFjj9+ww5+Oivjy7AQ0nAo8LTncWNo0aQGlwdmNZZxbcewLr4yk+iIpl9IJtrEl3/+2UGwOZb4PPqUpOS03pf7kooHFdiclYDvTZGUnP/Q5LW2cwmJN76xFeFPIANui/q5P1n4bk8FD6KpGQ66hsjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737471995; c=relaxed/simple;
	bh=SoCUuS0ai5FJ7EFPPhnO1vvGzyUmIgnKsPW1E/Tlsao=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=qGyWb1mQmA9gIjRRCFeWetMErbwUCVoxVYPuaAIuIZ5b0bR4/x1uAcO4epnphgLV6skjuRJ+EwAc5/MOhkweSXYAzfT67wDLz1ta7dT/EHtppPibZ69bYt9oNodcskO5Ivw0epGZjmvmGkASsWT7V4d42E/365vaTyt/u7PhInE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QcXkqu0K; arc=fail smtp.client-ip=40.107.105.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QcXkqu0K"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b8YbSraPoylov2qfoux3z0HYVwqLSdyC1sxYIkyapiT2jGdroChFCStymc6Ay3rEC+RIvQKDbu++LCzExDIXnTKeBmfuDK50uRBqBgurGKTXUFKwqjCT2FUE+IdWKXwcjLhIVS4P7q8JmTNGmMdgC48U0UFPbkEUTo42vNWjIu9vt0EupK4sUXDajGUxeIiBOiNmbW1Z+S9ryeYeDDo76gaFRovGjpUbw77hy/KTPDC+h6gzseGxwTPHAV9AnfIDYa34sXzNidJUZCRuhoBb5vO+Wwewjq4R1bMDlMa/AcY5mK0zg+CZytEjKV8GnuiQtXJTAsIjVHD1Wyj7ahHUmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NoQKZLTbR21LXDKQOZkJFS0OxuAVgfiu7By1xR04+6o=;
 b=ZHS/dktbynqoBHVV5Kpz1gowlduG+8c003D920OdM+0EpB7Plp7/X0pfyprCbn8Y3fQ0mmguRoRppCR8qGOt3rwRn/5Z+6rsAPFqljK4aldyO0MtjDTEV1gIUSlrzFjpNT5cu4wt23Euzj0dsRrrTO9snBa2FjGIpkp8PlQcn2jUObvxXj7YTrnt37Qm3vlW+UusXNlYPx3Sa5CMMVbH5LwqHQrFjIYkLZTUCKl3aUF5NYIfQ2FvHnZmt8451NaCkRTgQ1OeuglHYhNJj34H7qNyT4PzrY3bNTMzArZE4ggbQsYx9zoxlPNJLrbWT7XTgfhyvNpUxXh46cM2gFs4YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NoQKZLTbR21LXDKQOZkJFS0OxuAVgfiu7By1xR04+6o=;
 b=QcXkqu0KH3ZjF1w3jPSxAbszqUeG/wDwlvAC2XhK4W4TwM6xSA3o5hufzI7uEoD6ruFp8xpYjjJoFqhB6GQpeD6VeH8SOqJtpuTLqZ9Vl60InYdQzqRG3CckxWw090wietcO/qWKa0d525QvPvE1qcajaNPsPKKPeaAWh9tliUnzZlMgNMTFrLc7MO0tB1dK1Wu8AMOeh3sggKPDVitw6LSrFjTGmQw+CvrO7Hgw7WPrX8TUd1SDbTxDboievEE2myiQvgwGfqhNqncA04/hGWAhPQv3N/mE9ERlPeIdqWuQZ+t+CBWL4cv9GJOGeNuNaRoZWRiwlDv8OAckwsbeJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB9295.eurprd04.prod.outlook.com (2603:10a6:102:2a6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 15:06:29 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 15:06:29 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 21 Jan 2025 23:05:32 +0800
Subject: [PATCH v6 2/2] nvmem: imx-ocotp-ele: Support accessing controller
 for i.MX9
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-imx-ocotp-v6-2-76dab40e13db@nxp.com>
References: <20250121-imx-ocotp-v6-0-76dab40e13db@nxp.com>
In-Reply-To: <20250121-imx-ocotp-v6-0-76dab40e13db@nxp.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737471947; l=9107;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=CivJ/dkdlR5J1G+iH4A3XJvFEDAAqKsxHI1c3/ElmTs=;
 b=SsBVfTKKOGj176E2OCm+mHDfNvXfve/XjphphhZExNWdiH+oeCH03ZHPwh3jBFJl7hWQpPHe8
 XDiMVtfC22UBM/kHrr/b+0l2cKY7aiPQdBc/t9adGS8Cu10KNgwS3YH
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:4:188::23) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB9295:EE_
X-MS-Office365-Filtering-Correlation-Id: 59cd4115-63e6-4a70-5200-08dd3a2d2ef9
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bkp6K09jNmordlR1NkorNzNta2t4NWJQZm9aMGdBbWpmNFNZVFFTMzdnYTdn?=
 =?utf-8?B?OXRDK1ZEK21nQVJoS2lMNmdrNzA1R2Z5SlBNMUtzekIweUFzZm5OUW9XM1ZE?=
 =?utf-8?B?Q2prZmx2WHNIVHBHMjhtcDIxQkhzL1o3dncwcWE3THloWjBhaWk4L0c0L25W?=
 =?utf-8?B?Mk8yU2FnVDdBYm5CY2MxcVZzeXhROFUwdUFoM3ZIZnQzZWVObml3QVVGS2t5?=
 =?utf-8?B?V3FWSmVRU1EvMHV3UHppTE9yclJYRDV1bFpuV0FTU2Vxay91T0swUzlaY2JT?=
 =?utf-8?B?b2lieks3S00rMTErVEhMYytiYVB6SDg3RWJxckVKZ3FQRUxCVmJvYzdEL2xC?=
 =?utf-8?B?QWhKZVluVXZCSlpsKy9HSFlrZVJKVllEQU1vWTduYjRQbWhDbFExc3M1NzR2?=
 =?utf-8?B?eGxYZXlFRFZyR1pZa3dzYy8veEVLK3FxejJvdGVKLzNHcnBjNTVHSlY4eHcv?=
 =?utf-8?B?VktTOEZtZmx2RkZGUmlwZW9hOU5KRXU3T1pnMGFvcVA0cTVyeGNreVJWRDBV?=
 =?utf-8?B?bmdtYTRyZVhONVkrcWxMNjRuTitwa0xUa25NQVRWMlVVanpCYnU4aXNuc3V6?=
 =?utf-8?B?OTRPWXhlY1N6TjJZdWpFMmxpT0ZvMXkyT0w5Q3RZQzBXdWhuU3ZKcW0vNXN2?=
 =?utf-8?B?Sk5WNFFNL00xTnJqVTQ3N3V4OWJKeUhIbnBWN0wrcmNuZ1BMemx0czhGL0M1?=
 =?utf-8?B?QUdMWXNGa1dxbkJjR3VJTTQzUVhlVlA4TVBvNE5maW9LQThDSXF2UkJmYjZn?=
 =?utf-8?B?QXJjUTBLTmt3QmxGeERLb3AzYVRyMDNuc0RqTVRSYkliT0Z0dTFHWFVqR0V4?=
 =?utf-8?B?aldIbjgybU1QeWExMDM5ZVR2aFc1bGo3Z1BMdzBoVExEQ1dZZ3FtK3lSQTgw?=
 =?utf-8?B?SStoUm5hU05YMHRVRi9NdDlPd2tUdkJZQjZkODlIeHZ4dFVXMkRsbjhEdkdj?=
 =?utf-8?B?WjlYVEszMnNnRXFLRGtiWHV6aHlPRVRGeWRzRDAvcGJKUHg4cjN0djBtaVNI?=
 =?utf-8?B?dmpUQ1pSSkt1ejdlOWxsUGg0MmJkSEpvQ3YxV25BT1ZRb3RJQlcxUHh0N1Ju?=
 =?utf-8?B?L3JRTFpWZ3FNRmdIL3psODBXZjFISE90L282NUhrREthd2k5ZHEvRzFNV0Zx?=
 =?utf-8?B?YWJZN2pIUTJRTGEzandvMm84L3hYZ202cFBMU3ZCWG1sQlRLdFh0YURhckZU?=
 =?utf-8?B?RWM0bVZEWjl5ZEgyVGI1akxiY0hJVjZhc0xqUDRqSXI2cy9XbkY3c1R4M1N4?=
 =?utf-8?B?TVp6RSttWjB2UVk4elBNUmFWdlBzQlpmYkxhei9VTHlMb2VXVHg2NERzS2Rk?=
 =?utf-8?B?aVN0SlNVUDBjZU1aM1VwZEV4VUFTenNZMjZOM0ZEZnM5bDFyaFJzZHBGNkJ0?=
 =?utf-8?B?bXoxM1lnQ0JCOVZlYW9UUGFaeVQvZU1LSHlRNVd3MWtRVWRTaFgvZWkrODZE?=
 =?utf-8?B?b3E4cUY5WlJPVGplOE5oL0h5R2JGdWd1ZjF1eGV1N3hWQ256SjIwdFJBcnVT?=
 =?utf-8?B?N3lqZkZCYWg4RGRvYUFIdWhxWWQ1VUFHcXNYNVZZYksyUHN2QmxXcFd5V3h6?=
 =?utf-8?B?TGlYRUR3YURSNmNVYTZqOWRVbHpkeHp4YkVFbE4rb0RnQWtlUkZUUEVkK28y?=
 =?utf-8?B?dks0RVJpRis2d1R2MWxUeEdMM09rdE9rT3FhMVBwSndOTHpjT0tLOUVnYnBF?=
 =?utf-8?B?UkdmT1pvZExDY1VHQ0JBT3hxWFBUNUE3QTBOaGdMZnBGeGd0SVIvYmRKRW1n?=
 =?utf-8?B?ZHNXZHRwY0R6M3h1bk4rZnNuQkd1UlI2WW9jM1lKTmdHWU9WY3g3TEU2b09Q?=
 =?utf-8?B?QlRSUCtrV0I1TFFrMUtGVnBjY0NVOXVpQVJZYkZvWFo0QmpMVitKblZ6SFpl?=
 =?utf-8?B?clF0SXNKY2txanZhYzduaTJoM1pFZzRDa2hleGhtZFpLUWNvNy90MkZWUk9F?=
 =?utf-8?Q?mciGFv+qnxV+PICPB+K3m4smLcQZtXtZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1oyL2pHcXZMYXMrT3lWcnprRHQ0bVBhZEdpNWdHMzFsZUgzMVZvOU9RK0tx?=
 =?utf-8?B?NUZsQ0NXbWM2RW9SL2pSMkcxcmtYOXc0eWxyM2NPc2ZPd1ZjdDdhdncvcW5l?=
 =?utf-8?B?NWtkSVgvWlpmQUVGWHg5WWRoNm1xZW5xemJhV21XaUVHcUZULzA2VHNCczdV?=
 =?utf-8?B?K0p5V0dIb2N6RUova3AwWWsyTzBaNHFQT3V2SUx2dVUzQVI4ZWhkbE1ibUZp?=
 =?utf-8?B?cjBtZ1NhdTRFamprZHBRaXJZdVowclVSYUZBSGpkT3J6aklTMXUveFJyU2Iz?=
 =?utf-8?B?WEg0SEVrdHlIbWtjOU1iWVNad1U2YUZ1NEtMOXZwcFhWb2VwTk1jQmxucGc5?=
 =?utf-8?B?UkdFRGlSeFFicGw1a3dVZFpZR1FNOGxMM01pK1ZtZ1IrZ0tsRUIrZ3FDWkF6?=
 =?utf-8?B?K1NkYkJEblBvQVF2S1FPakdiSHQ3czluVmE1UkVtcXEzR3ZGTFVGS0tCb0hU?=
 =?utf-8?B?Zi9CT29lTGZOUWVLT0pHSW5IK3FzVi85RXprQm8xUjhIUUlzcnBzdUdDOHBR?=
 =?utf-8?B?dmRhNFN3VmsyQk5qdFpsTlMzVE16RXNHNGNGY3g2eklaTkZGSW1HeU1rZXZn?=
 =?utf-8?B?aFRaNnV1a1ZuRks5TEUrWTd6elpmNk5CM2wxL0hOU09BZVVBNDNaQ0FwQ2Zl?=
 =?utf-8?B?b0RwbTFEc01FeUVUTGV4c293Y21GRm1BYng3eFU1UmJuZDhwQU4xQjFCVS9G?=
 =?utf-8?B?QXgxdnFtNytJUWJmS2lORlJvd2ZmSXprS05vKzZiSGF2RGtPeWhpODkzVDEr?=
 =?utf-8?B?WlVSNDRDanFnQ1haVGhqazhtNkVIaXlaUWVCRU05VFdRck9hR0tIOGhZRnph?=
 =?utf-8?B?S3ZsTk5TZ2V3elVnNFMvd0RGM2ZaWS9qQk1PY0QrRUxRVzc1Y0ZvdVdrVzRL?=
 =?utf-8?B?YUFYZVZFWENWVDFGajhYQmNBQkwvVFRvWFNQMVc4UUJHUkhqeXFVdmZrb2lL?=
 =?utf-8?B?cDllMVErZ0M0L2JwcHNoNXB4VGlyRFlJLzh0YW1XTjZ4bkhmSjlrY1NsS21z?=
 =?utf-8?B?cmlIQlZsVDRhd3ZZM3ZyMTVWMm9BMlZCUmFzc3ltdmdVZ0ZSYU1PVno1elZM?=
 =?utf-8?B?M21mUTU2MGJVOWE2Z0VwQmpKNXlXY1l4MlVLRFQzeTV4TS9sS1o2aG44bDFH?=
 =?utf-8?B?UFNDZnlSMENqUHR3Rm5vZWZaNTFBRmJ4Sm5WK2luQXp1YmJMK2haaFd1TjlF?=
 =?utf-8?B?b0R3bHFHZHZnYlN1TlRmMjBNeUtNc3JHeFBpcTRlWXIwZDN1QnUwajAzQVdl?=
 =?utf-8?B?MWcycG5RVElKY2NSWlh3dHJoL0hPQVBhMnh2NU9NMXVlajZGMWNNSlIvc0Nn?=
 =?utf-8?B?T2N1RmxJcWxMbGU0QnE1eTU0eUNwc1RxU3dCU1ZkcFV0SUhFaWRlQUFtQkdO?=
 =?utf-8?B?cDZXb1h0M0FPVUVSMjNDVjZSbS8xSndCalVwZGtkeDllUDRoVCtwZWZ4bnh6?=
 =?utf-8?B?UElnTEppeUxuU2NnemRmUzJaK2VtS3dPOUczWUdtY2VqYlFtdFhjZnVGL0V6?=
 =?utf-8?B?VkNnWUIxMzVObzZLUFI1dDBoZU1UYUMrcm5pYStPTjNwZU9WdCt6Smk0S2xU?=
 =?utf-8?B?bVVrRWRDYVFvanZ3aHB5T3VzekhBV25nZER3WTlVYzBuM3pBKzNVYzZJejc3?=
 =?utf-8?B?dTQvUTlONXhwMUxLLzRBOVQzbnUzb0RqVXNFRGFaaGFmbFlGMDkwU0xudERR?=
 =?utf-8?B?VGdzdWtjcC95K3lvSmw5d1BZY0lvbnlDcGNBaERjemVYME9OR1ZlK3BPS3dl?=
 =?utf-8?B?eUltTWVsNWhYY0xlQ2FYdmxFNzV0aHBoZkJYMlJDR0NCRkYzdytRUU9qU0tP?=
 =?utf-8?B?QXBWZmQ1SlJGdUU1Um4wQm9BWHlnN2x5NnVzWUx4ajB5R1FxWm9nVlBoVHFX?=
 =?utf-8?B?dlBTNlJiZHNPSGZ5Z0ZxOWU2eDUzd21NdnlxWGtDa09DdzZjNGxwRTJqNmtP?=
 =?utf-8?B?VitZeWdpdGJqM3lwdXJWdHlzR014RkJmektpVjd3N1c5QlFFclNpbm9OWGw0?=
 =?utf-8?B?dDUyWnRZQWtpaWRFMWEvQnpqZHFFNHYvMTY3YnBSblR4UDdmT1JBTXUrZ1BM?=
 =?utf-8?B?TkpqKzJJMEtlQlNyMStNelROYkRIYVlrZGNTNnNSMnZLYWUrNnVzMG9TeXI0?=
 =?utf-8?Q?B9dJDzRihWT/9jdB6d54tOIID?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59cd4115-63e6-4a70-5200-08dd3a2d2ef9
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 15:06:29.3714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gdHpAzNAkA9rn+AD8vxykS+w/MfbSczv+WWzhd9BOyjZcAUSBKtBeiMmoGlHpUXulvrg7FKCtkyuvIIE7z7pHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9295

From: Peng Fan <peng.fan@nxp.com>

i.MX9 OCOTP supports a specific peripheral or function being fused
which means disabled, so
 - Introduce ocotp_access_gates to be container of efuse gate info
 - Iterate all nodes to check accessing permission. If not
   allowed to be accessed, detach the node

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/nvmem/Kconfig         |   3 +
 drivers/nvmem/imx-ocotp-ele.c | 172 +++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 174 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
index 8671b7c974b933e147154bb40b5d41b5730518d2..77cc496fd5e0e1afd753534b56fe1f5ef3e3ec55 100644
--- a/drivers/nvmem/Kconfig
+++ b/drivers/nvmem/Kconfig
@@ -93,6 +93,9 @@ config NVMEM_IMX_OCOTP_ELE
 	  This is a driver for the On-Chip OTP Controller (OCOTP)
 	  available on i.MX SoCs which has ELE.
 
+	  If built as modules, any other driver relying on this working
+	  as access controller also needs to be a module as well.
+
 config NVMEM_IMX_OCOTP_SCU
 	tristate "i.MX8 SCU On-Chip OTP Controller support"
 	depends on IMX_SCU
diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index ca6dd71d8a2e29888c6e556aaea116c1a967cb5f..5ea6d959ce38760eeed44a989992fb35c462c0b4 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -5,6 +5,8 @@
  * Copyright 2023 NXP
  */
 
+#include <dt-bindings/nvmem/fsl,imx93-ocotp.h>
+#include <dt-bindings/nvmem/fsl,imx95-ocotp.h>
 #include <linux/device.h>
 #include <linux/io.h>
 #include <linux/module.h>
@@ -27,6 +29,7 @@ struct ocotp_map_entry {
 };
 
 struct ocotp_devtype_data {
+	const struct ocotp_access_gates *access_gates;
 	u32 reg_off;
 	char *name;
 	u32 size;
@@ -36,6 +39,20 @@ struct ocotp_devtype_data {
 	struct ocotp_map_entry entry[];
 };
 
+#define OCOTP_MAX_NUM_GATE_WORDS 4
+
+struct access_gate {
+	u32 word;
+	u32 mask;
+};
+
+struct ocotp_access_gates {
+	u32 num_words;
+	u32 words[OCOTP_MAX_NUM_GATE_WORDS];
+	u32 num_gates;
+	struct access_gate *gates;
+};
+
 struct imx_ocotp_priv {
 	struct device *dev;
 	void __iomem *base;
@@ -131,6 +148,82 @@ static void imx_ocotp_fixup_dt_cell_info(struct nvmem_device *nvmem,
 	cell->read_post_process = imx_ocotp_cell_pp;
 }
 
+static int imx_ele_ocotp_check_access(struct imx_ocotp_priv *priv, u32 id)
+{
+	const struct ocotp_access_gates *access_gates = priv->data->access_gates;
+	void __iomem *reg = priv->base + priv->data->reg_off;
+	u32 word, mask, val;
+
+	if (id >= access_gates->num_gates) {
+		dev_err(priv->config.dev, "Index %d too large\n", id);
+		return -EACCES;
+	}
+
+	word = access_gates->gates[id].word;
+	mask = access_gates->gates[id].mask;
+
+	reg = priv->base + priv->data->reg_off + (word << 2);
+	val = readl(reg);
+
+	dev_dbg(priv->config.dev, "id:%d word:%d mask:0x%08x\n", id, word, mask);
+	/* true means not allow access */
+	if (val & mask)
+		return -EACCES;
+
+	return 0;
+}
+
+static int imx_ele_ocotp_grant_access(struct imx_ocotp_priv *priv, struct device_node *parent)
+{
+	struct device *dev = priv->config.dev;
+
+	for_each_available_child_of_node_scoped(parent, child) {
+		struct of_phandle_args args;
+		u32 id, idx = 0;
+
+		while (!of_parse_phandle_with_args(child, "access-controllers",
+						   "#access-controller-cells",
+						   idx++, &args)) {
+			of_node_put(args.np);
+			if (args.np != dev->of_node)
+				continue;
+
+			/* Only support one cell */
+			if (args.args_count != 1) {
+				dev_err(dev, "wrong args count\n");
+				continue;
+			}
+
+			id = args.args[0];
+
+			dev_dbg(dev, "Checking node: %pOF gate: %d\n", child, id);
+
+			if (imx_ele_ocotp_check_access(priv, id)) {
+				of_detach_node(child);
+				dev_info(dev, "%pOF: Not granted, device driver will not be probed\n",
+					 child);
+			}
+		}
+
+		imx_ele_ocotp_grant_access(priv, child);
+	}
+
+	return 0;
+}
+
+static int imx_ele_ocotp_access_control(struct imx_ocotp_priv *priv)
+{
+	struct device_node *root __free(device_node) = of_find_node_by_path("/");
+
+	if (!priv->data->access_gates)
+		return 0;
+
+	/* This should never happen */
+	WARN_ON(!root);
+
+	return imx_ele_ocotp_grant_access(priv, root);
+}
+
 static int imx_ele_ocotp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -161,14 +254,45 @@ static int imx_ele_ocotp_probe(struct platform_device *pdev)
 	priv->config.fixup_dt_cell_info = imx_ocotp_fixup_dt_cell_info;
 	mutex_init(&priv->lock);
 
+	platform_set_drvdata(pdev, priv);
+
 	nvmem = devm_nvmem_register(dev, &priv->config);
 	if (IS_ERR(nvmem))
 		return PTR_ERR(nvmem);
 
-	return 0;
+
+	return imx_ele_ocotp_access_control(priv);
 }
 
+struct access_gate imx93_access_gate[] = {
+		[IMX93_OCOTP_NPU_GATE]		= { .word = 19, .mask = BIT(13) },
+		[IMX93_OCOTP_A550_GATE]		= { .word = 19, .mask = BIT(14) },
+		[IMX93_OCOTP_A551_GATE]		= { .word = 19, .mask = BIT(15) },
+		[IMX93_OCOTP_M33_GATE]		= { .word = 19, .mask = BIT(24) },
+		[IMX93_OCOTP_CAN1_FD_GATE]	= { .word = 19, .mask = BIT(28) },
+		[IMX93_OCOTP_CAN2_FD_GATE]	= { .word = 19, .mask = BIT(29) },
+		[IMX93_OCOTP_CAN1_GATE]		= { .word = 19, .mask = BIT(30) },
+		[IMX93_OCOTP_CAN2_GATE]		= { .word = 19, .mask = BIT(31) },
+		[IMX93_OCOTP_USB1_GATE]		= { .word = 20, .mask = BIT(3) },
+		[IMX93_OCOTP_USB2_GATE]		= { .word = 20, .mask = BIT(4) },
+		[IMX93_OCOTP_ENET1_GATE]	= { .word = 20, .mask = BIT(5) },
+		[IMX93_OCOTP_ENET2_GATE]	= { .word = 20, .mask = BIT(6) },
+		[IMX93_OCOTP_PXP_GATE]		= { .word = 20, .mask = BIT(10) },
+		[IMX93_OCOTP_MIPI_CSI1_GATE]	= { .word = 20, .mask = BIT(17) },
+		[IMX93_OCOTP_MIPI_DSI1_GATE]	= { .word = 20, .mask = BIT(19) },
+		[IMX93_OCOTP_LVDS1_GATE]	= { .word = 20, .mask = BIT(24) },
+		[IMX93_OCOTP_ADC1_GATE]		= { .word = 21, .mask = BIT(7) },
+};
+
+static const struct ocotp_access_gates imx93_access_gates_info = {
+	.num_words = 3,
+	.words = {19, 20, 21},
+	.num_gates = ARRAY_SIZE(imx93_access_gate),
+	.gates = imx93_access_gate,
+};
+
 static const struct ocotp_devtype_data imx93_ocotp_data = {
+	.access_gates = &imx93_access_gates_info,
 	.reg_off = 0x8000,
 	.reg_read = imx_ocotp_reg_read,
 	.size = 2048,
@@ -183,7 +307,53 @@ static const struct ocotp_devtype_data imx93_ocotp_data = {
 	},
 };
 
+struct access_gate imx95_access_gate[] = {
+		[IMX95_OCOTP_CANFD1_GATE]	= { .word = 17, .mask = BIT(20) },
+		[IMX95_OCOTP_CANFD2_GATE]	= { .word = 17, .mask = BIT(21) },
+		[IMX95_OCOTP_CANFD3_GATE]	= { .word = 17, .mask = BIT(22) },
+		[IMX95_OCOTP_CANFD4_GATE]	= { .word = 17, .mask = BIT(23) },
+		[IMX95_OCOTP_CANFD5_GATE]	= { .word = 17, .mask = BIT(24) },
+		[IMX95_OCOTP_CAN1_GATE]		= { .word = 17, .mask = BIT(25) },
+		[IMX95_OCOTP_CAN2_GATE]		= { .word = 17, .mask = BIT(26) },
+		[IMX95_OCOTP_CAN3_GATE]		= { .word = 17, .mask = BIT(27) },
+		[IMX95_OCOTP_CAN4_GATE]		= { .word = 17, .mask = BIT(28) },
+		[IMX95_OCOTP_CAN5_GATE]		= { .word = 17, .mask = BIT(29) },
+		[IMX95_OCOTP_NPU_GATE]		= { .word = 18, .mask = BIT(0) },
+		[IMX95_OCOTP_A550_GATE]		= { .word = 18, .mask = BIT(1) },
+		[IMX95_OCOTP_A551_GATE]		= { .word = 18, .mask = BIT(2) },
+		[IMX95_OCOTP_A552_GATE]		= { .word = 18, .mask = BIT(3) },
+		[IMX95_OCOTP_A553_GATE]		= { .word = 18, .mask = BIT(4) },
+		[IMX95_OCOTP_A554_GATE]		= { .word = 18, .mask = BIT(5) },
+		[IMX95_OCOTP_A555_GATE]		= { .word = 18, .mask = BIT(6) },
+		[IMX95_OCOTP_M7_GATE]		= { .word = 18, .mask = BIT(9) },
+		[IMX95_OCOTP_DCSS_GATE]		= { .word = 18, .mask = BIT(22) },
+		[IMX95_OCOTP_LVDS1_GATE]	= { .word = 18, .mask = BIT(27) },
+		[IMX95_OCOTP_ISP_GATE]		= { .word = 18, .mask = BIT(29) },
+		[IMX95_OCOTP_USB1_GATE]		= { .word = 19, .mask = BIT(2) },
+		[IMX95_OCOTP_USB2_GATE]		= { .word = 19, .mask = BIT(3) },
+		[IMX95_OCOTP_NETC_GATE]		= { .word = 19, .mask = BIT(4) },
+		[IMX95_OCOTP_PCIE1_GATE]	= { .word = 19, .mask = BIT(6) },
+		[IMX95_OCOTP_PCIE2_GATE]	= { .word = 19, .mask = BIT(7) },
+		[IMX95_OCOTP_ADC1_GATE]		= { .word = 19, .mask = BIT(8) },
+		[IMX95_OCOTP_EARC_RX_GATE]	= { .word = 19, .mask = BIT(11) },
+		[IMX95_OCOTP_GPU3D_GATE]	= { .word = 19, .mask = BIT(16) },
+		[IMX95_OCOTP_VPU_GATE]		= { .word = 19, .mask = BIT(17) },
+		[IMX95_OCOTP_JPEG_ENC_GATE]	= { .word = 19, .mask = BIT(18) },
+		[IMX95_OCOTP_JPEG_DEC_GATE]	= { .word = 19, .mask = BIT(19) },
+		[IMX95_OCOTP_MIPI_CSI1_GATE]	= { .word = 19, .mask = BIT(21) },
+		[IMX95_OCOTP_MIPI_CSI2_GATE]	= { .word = 19, .mask = BIT(22) },
+		[IMX95_OCOTP_MIPI_DSI1_GATE]	= { .word = 19, .mask = BIT(23) },
+};
+
+static const struct ocotp_access_gates imx95_access_gates_info = {
+	.num_words = 3,
+	.words = {17, 18, 19},
+	.num_gates = ARRAY_SIZE(imx95_access_gate),
+	.gates = imx95_access_gate,
+};
+
 static const struct ocotp_devtype_data imx95_ocotp_data = {
+	.access_gates = &imx95_access_gates_info,
 	.reg_off = 0x8000,
 	.reg_read = imx_ocotp_reg_read,
 	.size = 2048,

-- 
2.37.1

