Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013051.outbound.protection.outlook.com [52.101.83.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABE748124E
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 11:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768994061; cv=fail; b=WaGtkxRucFOpO38+5PACTICSu1qgrVJNUpmCoP3IF/VyzXYSNz6r3hN/kuQMZZghJ3PvSKO4C3U+zEfXwmu3btn1+sO9DOYzC+T2YdsPVl6Of3gwXwT1Xr+NPU1o7JI+WO6FWhpJG5KFigNZbH2MY0dKArv4orBJPZyBUTrjZOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768994061; c=relaxed/simple;
	bh=4F9c8RvcXj7mxwf9vx0THS8otc8kArspdEFaxSXTSfI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=iWgh35bp665GT9moR0No8KRjYoBZ3gO5yomg43L9nkMWaHmv0gDPPgor2cInXerYH4w545+QQ5Ri4FrNXPPoh6UCKZniX2Sv2sUjStiEwQYCTFqmPX08kLyCO4KmD0OIOi/sbVeNT5EA+Sp/zlMjedBKrpp5PEi7XIOyfOQoYbo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WUBRD5M8; arc=fail smtp.client-ip=52.101.83.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WUBRD5M8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yyIA9j3uiFlPsoekoJoG8kLRnwGhgdISLM6Tz3WMtrq5XttjwNkwUfpn+HpXlBp2KZjDG873yoqxFCl1uyzM7AZo2UCGu07jL+cAFbyvkD5k7F19PC814DwjbN2FqsGhiGFAcKb0sn9ZiftDKKTQ9zF+UtdvzrAgQ1XIIgWTNbbIOx9nYBt10A0ye8ThaO/sitYEX2m0d33AiP3IljWyCXUPOYYcvUjAiaby4xjfBBkrHhpkA3cHT9c1j3oXXoHGnYrp9cw9G89KO7rq5y/NQlGUZPXaU/qBH03WPX1wnx+D9jhowSY88XcSUepQPJu8ZWabMwmLWGJbWyz+j3huXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IpFNBg6OKE8D1CjFk2QPMBchV60yycsinsMWbkIh9Fk=;
 b=WPFmg3zKXebYJSmSFTWM6Xcx5UVDG9IUVQSBTFBRWuScB1MCyWt7TwBrz1xfnIn8nGd9/7JA5WuO7siEd8PsXqTyVLlRn0HUSDtw7Cw6yFbJwgem24PU9gWKIIOMP2kI/VrOT5ntOWdSe41FfUiA7hVg4WwSSK7nEuS/RXrFM0HMAv4kxePh2+T5TGdI7hVmbXpH68X2AlHCsGYMqvK5MNuCMfb0EwQC+XIc1+MqjqA5cE7/OvYZalXY7nm9mJvLQ7KGH8wzlzImwAooGLMM5dFmSgs5mwhHpgZmsdlv/z5ZUnhBOem6dlg56WQagOyYauN2Sm8rMxgVJToj69ZstQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IpFNBg6OKE8D1CjFk2QPMBchV60yycsinsMWbkIh9Fk=;
 b=WUBRD5M864k5ijDpXdfFV6bA7NOoIYPC1KqPlgd6qj8RD2i90pCbN0MtOefyLmcGJFKq77YgUKpayBVpy0hBPR5Jrm9MR+HXDZHpHlDORmNOY3HfcNjSh8Tncx3Y8xNA3TAwYMdTIFi4wAIFXhaUMQNLKqG+pMQkx3VeEW4aP/8/HJ67d6qriNOeRsb80iLyCREzmRxuX+C5LEKvx5Ana2fMu+dfT4+3mvf/HMpGqQ3iqjDQaBslrce5iu2k2PST3sXFn6ytxOURLm2hg484h932VvgLGlv3/jtkBAnIgZcvzgCNJWi4tDE6NG/bIfOYzPnLtZ086VgPMKNIbe6hXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13) by AM7PR04MB6917.eurprd04.prod.outlook.com
 (2603:10a6:20b:109::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Wed, 21 Jan
 2026 11:14:15 +0000
Received: from VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7]) by VI0PR04MB12114.eurprd04.prod.outlook.com
 ([fe80::2943:c36f:6a8c:81f7%5]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 11:14:15 +0000
From: Sherry Sun <sherry.sun@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2] arm64: dts: imx93-evk/qsb: add m2-pcm-level-shifter-hog to enable BT HFP
Date: Wed, 21 Jan 2026 19:13:46 +0800
Message-Id: <20260121111346.2598783-1-sherry.sun@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:194::9) To VI0PR04MB12114.eurprd04.prod.outlook.com
 (2603:10a6:800:315::13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI0PR04MB12114:EE_|AM7PR04MB6917:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d876d37-0197-42a7-0d30-08de58de36ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ekNNeFM5L0YxVi9OaXFaUnV2Ykh2VVJDY042azZabHJaOGNtT2pJQTliYTlr?=
 =?utf-8?B?SE9ESWVURVZYNmxtNVViRU9tY0RTVDVpYzJDMjFhc3FEejg0UXdGWUZWYXhU?=
 =?utf-8?B?SkpnODQvNlA1ekV0ekFVcDNWUWJkcUZ6cXZyMCtVWjdTanlDVEhWbWtwTDJD?=
 =?utf-8?B?SGtiZ0lkd2JmWWxRUldSdkQvR2RMVmU3aVNxdUY1ZE9FS1lZbHJVN1V2em1a?=
 =?utf-8?B?Yzc2ckZEMFdFZXJZT1VuTEI0UGxPNklmc01vY1JiL0tvbUFMQ0NMVnMreTBz?=
 =?utf-8?B?U3BUdnZlc2xKQjdQR3BIYXdjeXE4bFpOeGtscFVvWWtsRGQ0cGZDd1Q3UmNm?=
 =?utf-8?B?by9jWUlyVHJRNlVqOEVkeHJ0bi9KNlJITDJkSldyTXRiN1BsNjdoK3N4eGZs?=
 =?utf-8?B?MGhqNW5UMlg4K0pJd2pFeDlxcDF2allEVmM3ZVljSVIvd3A3RmlOdXlpU0xG?=
 =?utf-8?B?TEdielZOVlFLUThWV0w1RlNiYjBscTBoaUREUEJBNStTZ1NRVFZGb3RUUUM3?=
 =?utf-8?B?UGxPNHhNWGU2VEZsM1NQZ00yUDBGdHdoQjZPd1dJSFN5djVZMzdEM0ExM1RJ?=
 =?utf-8?B?WER4VUJIeDYzZVZ4U0Qra3F6QWk0QXc5dXVHOHlhaS9uQ1BOaXRWR0tHT3RU?=
 =?utf-8?B?a0tWMXJJKzFwOEJuSDR3U3hhK01nTmd3TG9iNzMzcklmejM4WFMyTUtkalpt?=
 =?utf-8?B?ZWFwUmhJUFA5Z2F2TmVDa2tNTjU5RWY2SStwOWxRTFQwUVhScHhsWE1iMndv?=
 =?utf-8?B?RElDWE9CRjRqdGhSa2hxNXc1dEhLbVMzSGFGRTJtV09pc1VhY29XNU1DUnov?=
 =?utf-8?B?MStYTmRmTDk2eFJhUFJDK0Z4OEtkQ25FekZIalQvNUZDWS9mY00xaGNtVUo0?=
 =?utf-8?B?YVdvUTRWQWZoYmJyZU9lVjJLNXEvYmU5NXhVeDYyeVZMVHVwajZKWkhaUVor?=
 =?utf-8?B?M1JmQzdpSk9YRzlYU2c4a3dPc2luM0xoaHdMOVViNmpxdG55SFJyckJaZERO?=
 =?utf-8?B?T05KQ1MzV2hJaFM5TTJ0bzEwc3c2ai9qQk41WllBTHFCRTMzcHpWZEx2UDB2?=
 =?utf-8?B?ZzU0MU1DWXdKSkhiK1pPcVo2NkR1dGQrRzRtQWR0dksxZVc2WGlicWlCaExB?=
 =?utf-8?B?RDRMSVFlS1ZXTFJxMnRuR1kzTVVwbXFydGlvT2FCdWtadll3eVlsQkhPSk1q?=
 =?utf-8?B?ZldjNVBmQmVGNjB3QTFqUklNYlZpOTY3YUVGME0wY0l1eHBZRnlHR0F4V0JX?=
 =?utf-8?B?MFlUcVNaQkQxM2VjajlxTW5pS1BVOUp6cnErT0pDNlQ2SVd6cFY1UEt0R3k5?=
 =?utf-8?B?azBRaFFPamZxdjkwTHF2SW54MFhhRWpqVWdOcWlNQjJoczROeWlrOXA5d2Zh?=
 =?utf-8?B?UCtmeGNaQzRnQlRrOTV3cElBRVpqZXRYMVVhT2RRcy9RUjU1MlVpaGhWeHpm?=
 =?utf-8?B?SUIvOVc2d3ZZQkVsZWtPTmlxblVtYmM1am9GZHNyODFkS1FUb0daTjFIWlNq?=
 =?utf-8?B?L3l3VFpjNDF2elJEYzF0K1dCSy80MHZSdGxmMFVibjMvajJhY0NxakxPdmsy?=
 =?utf-8?B?K1hoU3VEZmVRWEpBeXFEd3doK3dXN1RRN1hUUEFScjJFVE5TZ09LMGdtbk1V?=
 =?utf-8?B?bVQ2cWJLN3NnNUlDSXZUT2ptMUNGL2JLcFVhSzdWbkhlS0l4WXFUemdsREJu?=
 =?utf-8?B?QU55VVB1bUVsRWYzMFhCd25NbXlhc2g5c1lDdGNLRG41emJlTjhOK0x3Q3hQ?=
 =?utf-8?B?RTdmZWhFTEkyaU1pY1BNd3JjKzc4NVZ5R0R1Zzd3RW16MkorRk9jNWtQREhx?=
 =?utf-8?B?WEM2bTF6MUV1VUxvV2YzUzY3MlpNK0VUYTlpeEdEZ2FCWTI3YzdDSDRpNzNZ?=
 =?utf-8?B?T3RHaEhhamlzUXJUUmp3RVpwRkFqb082UGsyd01jaWhqdzZjVkNCTUg2My9Y?=
 =?utf-8?B?cU5tbkthek44b3o0NjRqei9zZUZDR0F3RG1nV3AvUW1hY3gwTGl0bEVPeHp3?=
 =?utf-8?B?MkVEVUNjMHZwaysxLzBWVDJvOEpYOE1UOWhrZHl1Y2t5U3JGcW1NbHFERjRD?=
 =?utf-8?B?YUlqblhXVlYxZytpNXpxR1dXSkt0c2tCSEF6ay9qcmtQMURmTU5LYi9GblJV?=
 =?utf-8?B?bVZHU0pjOEFwUXJiMkhOSkN0SzZmNTlWdkxDVE4veDBHd3pGNFYxa2FDQ2JD?=
 =?utf-8?Q?soggASP+zrAcJ/sSQVl9ObE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI0PR04MB12114.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVBleUNFKzlhTGpVUnlTVHNPZFBlRzNDYXphdUJBeVJ0cTF4aDFWK0VxYVZI?=
 =?utf-8?B?ZkRTWUQybER3R0o2WkRkcFRJRG96dWdwQlZNRkp0MzkweGRnRkIyeWROaG9h?=
 =?utf-8?B?VHFyMWFqaEVSczNqQkxEOWlXdExmVzNPQlhkVmV1Q3Rzb0N2TjZlZzZCYVRS?=
 =?utf-8?B?Q0hCdGQ3cEE5YktVdTRHR2NMWStJWjdQM295RWlic0lBMlNqa1NzNmhqbmUz?=
 =?utf-8?B?VDRPNW5hYVlRbVpGMHc0aVdLblBnWFBlTE9rblhaOHhhVUIxeFlocHU5aUgy?=
 =?utf-8?B?Q291V3J5SngyS0VEZDhlT3RDNVFPVTFEU0V0N29JSTNNc2lGcWViaWkyZm1L?=
 =?utf-8?B?bXd0YjdCZDVhT1pSRUt3TDJBV2hRVEVYb1BLYS91UUNYTGJMVFE2WGhoQ3Ez?=
 =?utf-8?B?YlpKNWY5WnJ5VHVuaUFWU08rRk0vUzZnWXlXK2hHVGdFeXZxTDRGOHgzaFdS?=
 =?utf-8?B?cHhqS0MzdkpTcXNPRnZlUDR4Z0gyKzJqclg0Tkd0NFZseGI5N2s1Q1Y5TVIr?=
 =?utf-8?B?ZlJ3ZnFrWDNWRnQzZlhmai9ndTIvVGgwQzF3MkkvQWRwa1BrMUIxNC9hRHpW?=
 =?utf-8?B?eXBYcm9IM2JKOFUrdzRqZ2FlRHNNT0swY3ovVzNZZTBPK0F3WVVwRUNEVURy?=
 =?utf-8?B?RmQzdVBRa3FOTUlJMnR3S1JCNkFVYkFBTGV1dzVXaFlKb3E0VXpkazlCQjMx?=
 =?utf-8?B?LzhyYVVtSDcwZHQyQ3NpRnVheE9yQlY4aG4xWmhpS1dZdXMvVGh4Um5VbjUx?=
 =?utf-8?B?TVFkU2RZazlwVEpVTEhlOXQxek11dk01QTNMeHR5czNjVnRsQmJlTjhFUFd6?=
 =?utf-8?B?NURMK0JNd2MrNFRQbjBudlNJbW9tTFUzLzNrZWdKVTRHMVNDWjU1NDUxdGx3?=
 =?utf-8?B?Q1V4NUx4NUF1bkNaamtxeGc2b3NJWkx3a1FpRnkyN3MzRTk5dmwrTFVXOVFl?=
 =?utf-8?B?aGZWTCs0Z3h5Q29ad3VxdzB3K1ZVdVVHUnhKZk91T0s5TDJSck56aE5wRkM1?=
 =?utf-8?B?b29QWlB3Qi93eW9DYkF5cmVLUXdGY2RXcXJ6RFpaQlpwSTdaR1pjZXlUaUZI?=
 =?utf-8?B?MWtrZFVxeEZ6OXFMcjY1VHFqRnFHQmxrTVRqalZqeVMvVTFQbi9WVEJmbTcr?=
 =?utf-8?B?YkZqMGtuSzBtVmsxYzdBV0duZ2U5TTZQM0dnMUJsMDFqbWpKWS80T0htYWlo?=
 =?utf-8?B?MXYvRG9pdEVJbW54NGJrZUxwQ3l6azJTZ245VkdaUU9Yb1hHcmdoSituc2JG?=
 =?utf-8?B?MjFXT0JVa2R2YlU2MWx6dXphWkRZMVROdWwwQ2JhTnI5U3lMZDBYSGVVbWVJ?=
 =?utf-8?B?ZmlVMVB2ZVgzc0Z5U21KR2pZdzlCNU9YRE94TUFxVnRxYnR0eXhLV0tFcmpS?=
 =?utf-8?B?bDFJUDFhL21WNnhjVGZqRWlhQzFmSWpjMGpaVVN1Q1dpK1AxdkhQejJKYWhP?=
 =?utf-8?B?MEdSNjVaVFpKOUptdUs3cmNUYm1jVWlBcnFUQ1NYNFNoMmtPWHFiQVBzaFBX?=
 =?utf-8?B?WEg3bDhkVG1zSzF3Q00vLzVoeDdTN0RPMEMvUWRIQjlqVUJuU29LYXhYTDB6?=
 =?utf-8?B?aDlvN0p3L01UTml6Y2F3WDNBWWNjSjdIWUV3cnpXOEhIdFROVXJhK1B4SGQz?=
 =?utf-8?B?NzZjTmNKV3BGR0tMSGg2b0UreXZRa1phWCtKVm8xbGdEb25DRW4ySWJ3cWJ0?=
 =?utf-8?B?VWwwdFllQnFnRnhveUZZeDVTM3pVdjgyd1FDYVBCVFphZksxTGNqOUplOW9W?=
 =?utf-8?B?YkIyZkJWNzI3YWxSZ09jbURBaERKd1QwbXpXS0lid2h5bTkxZlg2ejVIcGZ5?=
 =?utf-8?B?d0JYTEtFS0R3QVk2cGlJRkZnUXFwRmkvRkNjMFhhY3M5N2ZKRXNRY2QvanBI?=
 =?utf-8?B?bE5iWWRVVHBMUUttZlFGL1ArR2FJdk5KenBPNkhZRE1lRWNQd3RIS1d5SFZV?=
 =?utf-8?B?STRlRVJCWjRFRjdhV21xblA0c0lQellLSFJyREpqajN4dTBSSFJhWFJSVWRG?=
 =?utf-8?B?NXBZK0w0VzE0cVR2ZTMybEhXRGFMWC81U2ZFdm5lNkVpUkFYSWdMWVh6SXZN?=
 =?utf-8?B?TzVmZCsyTVd5WmtTOFlodW83RmlpVGJWWWxKQzdIVzRLcUloQ3Mrc3BWejBK?=
 =?utf-8?B?eDNwMk12SDhVbnlyYUxKUmdKaWIxN0R0dURrZnRGdWdlRUxCUlJQbjdHVVhB?=
 =?utf-8?B?VlNSeDY0NHVXUjEzaWFNUTJ5WTVVQkNPWnRBeGthaFV2dStlSTRWTERNYzda?=
 =?utf-8?B?WnFCOSs4blVJM0RIWVJXRVE3d0M0WWVVT0Z3SW5hSXNtRnZqOU5XbWM2Vldv?=
 =?utf-8?B?c2pHNGpkaVZqK01GY3dkRDNKdDJzeFlxL1Q1Vmk2cHJTc0hxc0ppdz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d876d37-0197-42a7-0d30-08de58de36ac
X-MS-Exchange-CrossTenant-AuthSource: VI0PR04MB12114.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 11:14:15.7245
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phUWTOvO4Ezpv2qxJTXriW3oUnpUM3gORMqiI9rX00cN8XNaxDzIlBITlgWrg+tR7lomt/75b9dVyTuGb3HMqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6917

For i.MX93 11x11 EVK and 9x9 QSB boards, add the gpio-hog to enable the
M.2 PCM pins level shifter connected between soc sai1 interface and M.2
PCM pins so that HFP feature can be supported.

Since the HFP is only used at a later stage — after the BT firmware has
been downloaded and the BT connection with the remote device has been
established — both the pcal6524 expander and sai1 interface are already
fully initialized and available by that time. Therefore, using a
gpio-hog here will not introduce any probe ordering or dependency issues
for the HFP use case.

Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
---
Changes in V2:
1. Improve the commit message to avoid confusion.
---
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts | 6 ++++++
 arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts   | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index 8dd5340e8141..acb160d3186c 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -356,6 +356,12 @@ pcal6524: gpio@22 {
 		#interrupt-cells = <2>;
 		interrupt-parent = <&gpio3>;
 		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
+
+		m2-pcm-level-shifter-hog {
+			gpio-hog;
+			gpios = <19 GPIO_ACTIVE_HIGH>;
+			output-high;
+		};
 	};
 
 	pmic@25 {
diff --git a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
index 0852067eab2c..11e08673083b 100644
--- a/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-9x9-qsb.dts
@@ -349,6 +349,12 @@ mic-can-sel-hog {
 			gpios = <17 GPIO_ACTIVE_HIGH>;
 			output-low;
 		};
+
+		m2-pcm-level-shifter-hog {
+			gpio-hog;
+			gpios = <19 GPIO_ACTIVE_HIGH>;
+			output-high;
+		};
 	};
 
 	pmic@25 {
-- 
2.37.1

