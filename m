Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013071.outbound.protection.outlook.com [52.101.83.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA304A21
	for <imx@lists.linux.dev>; Thu, 12 Feb 2026 16:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770913240; cv=fail; b=m4SN6aPNcWRLchlPUz3IBVjKrCN7TnJ0LiqiGYJZuskvLmwYQsmO07MAjehMgljoZJPi8whEttG4Oi+pmH7PugdwyZzDj7kNJZPHk/cQNfq3h9v7t+uByIz7GLzNiC53JwjTmLsH5kvkHGEFcpI3plycAyDahQx2Q4Y15nofKdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770913240; c=relaxed/simple;
	bh=bBefrEwjIldIFfuGcqJlAdfj0lsFIRs8CI6tHOvxGwo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZDfooaeU7Oov0/MH7xZcuRQ62VpNXlXMHY52ZGIUs51YUVBDhRHmNWs6OvX6EtDb0AxN+9BPcoUld6YjABFR5MLGaJyfu06EstbWn8q2lv71VsmHsawjzgmI0az0NalOApWye8ywJpuKdKhip4NVr27iylBR53V4RjSV8A93qTM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=V7JXkuN0; arc=fail smtp.client-ip=52.101.83.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="V7JXkuN0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ay4SjcTMVj7nh2+sh+r0Oi3yGnoPH3YIpcqBIA8DxA2/iw5VDLXGunqEY5VKI2wDTidZ6np6Uu0/Y62ojsB1QXc3/YLZJbWSOnxIUroZ0/7fMTG2NopvmWcJuQcMcucEaO9OCjDQ45WXFg72uLvS3RV7q2WkF1kHSpUAMq5zzXYzqQz/AGH1aey8FjUoZDGuGxLJwSFTksSJRXqGnsBziebrV531Gk8Zt+HsrJcrh2FH3dyrvcMwH3Yv5Pl949a54ddYJfQmNgqi4knByX+Eo59gleC8hRivZzmykMDnEZZqDF3aeQwlTmtlE0e4q7RMswSOp7NrwP/jKbXBvLQbAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQ20X0y81nn6Y39f/9fMFvoxto+oukfi0T1KPWZh+eA=;
 b=koRuLfo3vSDNjK8U1esSDDkwn/6CKUc1pG8oP5KVbFiQR/Z/CfEph6qhmTxMexBZMFzdk6QtmUsVFbNbhAdmRpOgSyIk+aMeD2vLqgjetktM/w+pzLW1RAn2K+/DHT7F9G8TWZEbhE66/PF704Tyl+1+9ERx/iD2ixHmjGYTIPa4YN2ltY3mrEYl+Rr6m5sl2qSNhCd4sB1QYkL0Y63Oss4FIcKsCis69KJJaObj08qYKgZ8tc5p2hfSVqmJP7dVmWhgwMnczJty5Dl6J2JH6UPO8RmYeC0XXxqjFDxZIpAwQb2COBUPktYTq/0vHwDSlSBflJDyjjd10p5I0iyWVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQ20X0y81nn6Y39f/9fMFvoxto+oukfi0T1KPWZh+eA=;
 b=V7JXkuN0V3gnG5XjhQkheks/sp7ujIXSvx4BrdF7Ioirp7UnHJs2I8BZ7rzytIG2MMvwqe7KeXgMtLX90ixghv7iQTcYkEm3Qu2lAv7NUUqLnI2xKAdSavX9Pcaej9pfKFFb7gGTnvQLxD6RakpEf4o8wtOyaQtK+9tb9cbvCYLaHBxP37cB4JMtlpkd7EV9UVXoJdjLbmcD+1FTkqYMYqS6uQjpxhX5gbFoAN9dBqSibXjQdu1PJ+1+cO/BoIuX2bHKs9ONQJWNOQC9zzAZ7knKW4whB4ZMcXsvi16tsxOXHmmJ8nnUeGNBH2qQkALJ8KI8xhgIc8xOtfGqnJaygQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB9704.eurprd04.prod.outlook.com (2603:10a6:10:303::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 16:20:24 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Thu, 12 Feb 2026
 16:20:24 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 12 Feb 2026 11:19:50 -0500
Subject: [PATCH 8/8] ARM: dts: imx28-tx28: remove undocumented aliases
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-imx28_dtb_warning-v1-8-696bcf1a992a@nxp.com>
References: <20260212-imx28_dtb_warning-v1-0-696bcf1a992a@nxp.com>
In-Reply-To: <20260212-imx28_dtb_warning-v1-0-696bcf1a992a@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770913203; l=1123;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=bBefrEwjIldIFfuGcqJlAdfj0lsFIRs8CI6tHOvxGwo=;
 b=vwyhytODTVi+M9kFek37IETAJp5gSX0KaWmWI9l0xuc5HB4EbDuNB70rH0l1HwbJlLU5pftmn
 6MTCIf3y9S7BPLljaFK4zJBrspiic3xUoMBonwEOtQZ2fkd2yzTBpoo
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SN6PR2101CA0011.namprd21.prod.outlook.com
 (2603:10b6:805:106::21) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DB9PR04MB9704:EE_
X-MS-Office365-Filtering-Correlation-Id: 88c0411b-c905-443b-877c-08de6a52a067
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SEFUNmVWbjVFazN4N0FVSWg1WTNkL1UzVVZDSzhTVUh2bGxRaXJJN3l3bXBv?=
 =?utf-8?B?Z3U3RmxXQ29ycDNRbTYwc3djNkhCZVhYODRuYmwwanRUMEZESkpkdnZQSXdw?=
 =?utf-8?B?d1EyYjdSK2RCT3FVclY5WEYvZGlPSjRkRnRWbzhhVGtQSC9pYi9PVkY1MHRX?=
 =?utf-8?B?ZG9PV1ZKcmVrcEpXWS84WGRrR1grRGJ3TUVTUTVoU0h6enZYWGNrQm5ISVpC?=
 =?utf-8?B?K2VyaFl4U3AybmYrd0tpeVlzS01vMHpibzkzWlZHUTFYTjdjUUJjRkkxd1Fp?=
 =?utf-8?B?b0p1dktiMnV4YzFRb3hZRFkzZFk1M3hoZVp6WUNwcjNqa0pxeS9IYTE0SmhF?=
 =?utf-8?B?SzZOVlA5NHZnQWV1Wm9xZFJlRjJTWm1ubVhDZ0NBWlVia3lqQWlCT3dSamlH?=
 =?utf-8?B?aU5qV0VtT0hzbjJLVDdDbzI5R0UrS2NjR29qTk95TmdQWmx5dGJ5U08zOUpr?=
 =?utf-8?B?enRwclhab3ExWmZoS0hocHZZZXdrdnk2SS9qQkRrMHdTVVo1c0JYRDgrUWxR?=
 =?utf-8?B?cjJNMXAvZ0ZYd2FzWGNUbzZ4SENtSCtDWERjNUhrYXdCUzNnZ0VpL1ZFZTM2?=
 =?utf-8?B?cllqbHRmOEc2K25tWjFSQVZMY3hJcE5hcDFsdWxwQmdVcUl5UVFQOEh5QUpR?=
 =?utf-8?B?aTBSZ0xFcXNYOStXYkVqMlJnSS9ibXdYZlBmaVZnaCtGNjJQTFYybjJXamU1?=
 =?utf-8?B?UWdzc3A0NFV5NzBJTXdIYjdMR2ZwZUk1V2o0dEEyTmY1UVRvbWVQZWZlYzRi?=
 =?utf-8?B?VGlZejlGNFB5M1NyZGo5dlNUeEF1VVFzOWlFZ2doVS9IT0JEcjNFSjY5WGNa?=
 =?utf-8?B?UXBxeTdBTzhzLzZrZWFDY3A0aHRYV0NzWEJ0cHJ6bnFoSFVrMERRYzgzOWYx?=
 =?utf-8?B?WDZOdUdtVHpSNzdUOFdobTl6NVREdDZlUDBKb25WTnEwb2M2RzRiWVhVWWdh?=
 =?utf-8?B?TEE1TmR0K1RtVnlncU1YNE1TMmlDVkRKQ2FjSlA1VDIwd2ZsNFlSVVRJZTFy?=
 =?utf-8?B?VVJjSlVRMlVtWDBGekxCclZBcmFmS0Rqeis0aVFjNnk2SGYxaWhPRUlUMUFB?=
 =?utf-8?B?NCtROW5KLzRRUnc5SExPZkNsaUIvclZNODhncHpYanlTd1JFYVNkTlh1Znlm?=
 =?utf-8?B?TEcrZWJ3RjE0WUFGazlXdUZQWGVvcnYzaVdxK2dpVDhsSzdHMHdTWGtybU05?=
 =?utf-8?B?UUlYZXlDKzhnZkNWalNsWHR1V2kyNHlxZkdQOTZsWkI1ZWs2NW1uaVFBckFK?=
 =?utf-8?B?TDBxSUpnUmZ2S0dEajBsVlJ3T0IvUUdUaHBuQ2JmU0VkTGMwQjcrVzRHSU1P?=
 =?utf-8?B?ODg3dXpJUHBsNTVZM05IOExzR0VKc2NsZ2NXclBSRGpKblRVb2pzY3p3OVNV?=
 =?utf-8?B?RVErUUY3Qld5dWhwSExQL055NXdYMm1oampUSEwwY1h4R210SzN4cmtVL3Jo?=
 =?utf-8?B?NkoyZWo0dW52M09RQUcvdncvQ2x1Zmh0ejF0YnMveXNwRnJxaVlrZFVOOFVH?=
 =?utf-8?B?VS9vcU5vcTcvTXVtdHFjbzNha0NHLzd3Uk5QTmVDVXQ3T0NpUnpGTlA3a3Na?=
 =?utf-8?B?MzRjU2dKQ0EzYTRLM3lFZnc3Q0FaMjYzeUJ0NUhVcENORTQ4TW1UVHlrbGw5?=
 =?utf-8?B?VnFHbEkrdHVKRjBOSnpyLzJSNG1kZUNWYk0vYm41bktKQjVwQjFzUkdOZ0Yw?=
 =?utf-8?B?VDdDVVRyL1B4dFVjWnEwRXhwelNhRW9MUXlOZE1HRHpFN0VSUkw0dHg0cElM?=
 =?utf-8?B?aUFoc25QQ0E3ZDZydFA4eHcyTG9LMitoWWYva2tvQTdKemVVTkEzS1FFaVNu?=
 =?utf-8?B?TUZUbUVWakxMN3dQUk92SW85WUFvWWdZaTlSVjdJZzNOeUt6aEJyS2g2UUE3?=
 =?utf-8?B?RlRHUFA2SnY0LzlTNlhQUWR2VHZjVVVZQXFpanJudDcwbkdOQnhSUE52OStv?=
 =?utf-8?B?bFZqVlFPY0J1QnkrK1ZraFlPbHpzWEFTUkZlMG5EbEtzdDhkK2pDNE1UalJR?=
 =?utf-8?B?Q05OQ2ZGTUxBSzZoZXFCOW05em1hR3k2MlZuM3NTUW1TRU1vUWlaRnEzUGQx?=
 =?utf-8?B?L3lqd1dUWkp4dzVwR053aHpLMElwdFdYcjJpY05vc1BlN2lGcEczSi8ycVc1?=
 =?utf-8?B?NmtHaVJObG84eGMxTEdRMUJSdTcxcG1vZXdBUU9jZ2s2bktETFRQY056dGFw?=
 =?utf-8?Q?pGPnouoCPAYXWCbhS7f5hPQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?di9ZYnJxOXRYY3ZWZm1zN2dzazBTZ2RoY2pnTTF4YUFSVHBUYXpWTC9uUUhx?=
 =?utf-8?B?dDlzbVBhbys5bmlacFVZTkRMNzNxbUl5ZlN6YS9vU1JLaHBLdlhENjJQQy9C?=
 =?utf-8?B?RUIzRzBFb2UwaUk4UDlNODlKQnlCUDdLajRBL0o3Q0ZpR2sreDE2NE5yNlFn?=
 =?utf-8?B?a1UxOTJkY0tkYS84ZWZoRDFZTFd4YWJnbU9rYk5zU3hPY0d4cjduaVVrUDFB?=
 =?utf-8?B?QUdzdG8xVi9HTUtMUFFWVkFJTHg3d0FTallRMGFmTS9Ua05SMmZERzEvZ2tz?=
 =?utf-8?B?VENQU0xkMXRrc1FXVDUwM1dRZTBvbVMram9QckVuYi9JdVlIRXBqNlF6MmdB?=
 =?utf-8?B?K1Z1N3JwV2NEOUZHVUl3NTRHeFl4dHF1SUcyemcyTDZjVHl0SjV0bmF6U09t?=
 =?utf-8?B?NldZWFdFZzFQZ0FtQ0dHb21wRHpmUU93UFpTU0ZkRlpCRU54eEVsTlZod3d0?=
 =?utf-8?B?WEVPMFF0a0RlM0x6b0h6RGZoTG9KN3o2NHYxRHhUcVZ4b1l2T3lNaHk5cGVx?=
 =?utf-8?B?TjRPeVpCQUhXNVpkRWVzVmd2aVljRlMvNHJxL09lNVNoR29JSHhGZVV5L2FW?=
 =?utf-8?B?V3ZVT0JEWHEzSmUwdkZJNTArSWJBaDBKZFZSR1NWb1N2MWtzMCthSFhMamdY?=
 =?utf-8?B?blVROW9qblJGNzB2UUo2V1NkOFZSRlBTMlRMdi9pY09TeEw3TjdyWFRLYThL?=
 =?utf-8?B?K1Bjc2VUbUxTb1dJbGVwUHR6REZCUEFNR1p1KzJURjkrdmNGSFJUb0w3d3ZU?=
 =?utf-8?B?MDg0UVdaeitLQmZjbEtSL0lFNUprcVo4KzZpS0Nid25Ldy96TDRwTGlGYVFK?=
 =?utf-8?B?OFRPL2JmSW54YTc3ZFZ0TWJaSy9NcUt4emdiVVc3a2hxQ1J2Y2R0Z002TTlr?=
 =?utf-8?B?ZUxNSHJ6R3BWWDNHbGZnNnl6TnE2cGdrTjJ1OHZab3lxaXA2RlhRVkNaemNR?=
 =?utf-8?B?alNqRXo3TDY5VTVSa2l6NlVLMlgzbnorQ3NoQVZVSVZHOHdUaUFNUEpGOVgr?=
 =?utf-8?B?bllITUQ4TThKZ1Fqd1Y2Qnd5VUc4V1FZK29JQ0NXUC9DV2VkNzJmYXNxUkMv?=
 =?utf-8?B?dmxyYjVXSHVTUTBlVCtFTWNNYWo0ZTRHcm04QUltRjJ2SERqMnVkMHR0bDQz?=
 =?utf-8?B?dzdrSHBPL3lNZVVzb0xHYmlPMkRSVTFXS1g1THErTzNsWWRveU54VWNaZjIz?=
 =?utf-8?B?RmlxY1QzZ3MyQ1kycjJBa3VDUWtCNlNkQ1hPbm5nQ2F5NlA1d05ZSzVpVUZI?=
 =?utf-8?B?TWdpcS8rZkpDTVFJOEZSL1NSbUxCMGs2VnJVaW13VVd0dUhydElxbjRnQzMx?=
 =?utf-8?B?bFZsMCsrYVhRNDlKYm5oYVY3RjBiVzZjU0xQWWRnZWNqQ2JQaWhBS3ZtdXV3?=
 =?utf-8?B?WXRuU3Nib054aGlXYmxncXRoUHNva0ZFVFBwUnNxdWZ2UmdCeUlNK3FTWnZQ?=
 =?utf-8?B?TWw0Ti9FQzlYM2hEUURIekd5VUMwVHFrWTB4Z21qNHdGaGwxeis0RXVEYVNn?=
 =?utf-8?B?bWo1ekw5NWVGSktPdlZ6dHVxUXBYZzhuNVVFM2pOU2Nab0dMVE8weFEwcGV1?=
 =?utf-8?B?MExrSU9aeE1td1lWc1FvOGN5U2lpVmxmWlZBWTZINDI5NHhJWlROM01lVXpI?=
 =?utf-8?B?dXY0c0RUc0FneVozT1A2L0daL2w3bDlGTFF2d25wcisxWEhGVUZ6bTZsbkl0?=
 =?utf-8?B?TzR6YU9PU1YwQXllVUFTbzlQZWg1RnFWMlpROTRaRDZjTGppSm1UakllYXFD?=
 =?utf-8?B?YllsQnJpcWxLNCtZcVRjL3pqaW1RMVhSeTVPbnNPRFdiN0syZmR5VVNKdlls?=
 =?utf-8?B?SVFGUnp5b1B3czJkbzJxbW9uUk5nMWVDZHplSGRQSit4R2xibVdKYm91WEYv?=
 =?utf-8?B?Qko2RWlDT29GOE9rancrWFhldnVsUTZPS0FqZWRPWFVlalBMK2tnSUNhZm9j?=
 =?utf-8?B?RlpTZmtkNzg4Sk9TZ0tlL2R2MXlGOTFpNVJMNjNUVmhxaDh2dURzVzAraXR4?=
 =?utf-8?B?TU4rbklIaHA5OGs1VUNKRTViRW5MWjkvK1VOcVFWSWN0dHdaaXpxS0oxcjAx?=
 =?utf-8?B?M2VXanhXYXdUNmxaNEFRbnhrcGZsZjZrS3RvcXZjbkdRbk9kZWl1cEgyNWt1?=
 =?utf-8?B?U0N6SGtwQVdkZkEybzVzSUhhNWlLdDBsQWZyd3NVN05CeE5nOTVhTG9PRnE0?=
 =?utf-8?B?QjlPVGxKaUhmUjVENFgzNEpNRkNVWnNwTmh0V0I0b1oxZW5jcWh3WjlVKzkz?=
 =?utf-8?B?VnBzSkhiWmk3NTJiKzRWVVdBR2JGOE40d0Jjc0tBeE9Fb1VUckJRVWVzWUJr?=
 =?utf-8?Q?QlQ0YYeZJlkJrS1oSG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88c0411b-c905-443b-877c-08de6a52a067
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 16:20:24.5538
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tATHCKSLBMK/fAKuteYow/Yzu5e38vHvf+LhxwnC5QNtLUSg0zPzfXu03GmMiQr7/c1ViF10oKtFBmbXg/B36g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9704

Remove undocumented aliases, which is not used in kernel to fix
CHECK_DTBS warnings.
  arch/arm/boot/dts/nxp/mxs/imx28-tx28.dtb: aliases: 'lcdif_23bit_pins', 'lcdif_24bit_pins', 'reg_can_xcvr', 'spi_gpio', 'spi_mxs' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
        from schema $id: http://devicetree.org/schemas/aliases.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts b/arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts
index c28fd07aec2c7994d0df1d3ed1763644784f14e4..208db77bbbef9b563aeb46f857a607cc5cc01bbf 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-tx28.dts
@@ -20,11 +20,6 @@ aliases {
 		ds1339 = &ds1339;
 		gpio5 = &gpio5;
 		lcdif = &lcdif;
-		lcdif_23bit_pins = &tx28_lcdif_23bit_pins;
-		lcdif_24bit_pins = &lcdif_24bit_pins_a;
-		reg_can_xcvr = &reg_can_xcvr;
-		spi_gpio = &spi_gpio;
-		spi_mxs = &ssp3;
 		stk5led = &user_led;
 		usbotg = &usb0;
 	};

-- 
2.43.0

