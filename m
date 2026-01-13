Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013044.outbound.protection.outlook.com [40.107.159.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5436352F86
	for <imx@lists.linux.dev>; Tue, 13 Jan 2026 22:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768342390; cv=fail; b=M/q3oVPF8NiXsJBxBJaFVBd1mY0mwfQmDDEzjU5zEcLdG0Jvjas4/2RcjEbxDDgW/MKkly8lsaW5H/7Kip22q/mCfBWMH9vMetM7jRtm4NWRGwDF+uiCM6847+xJWuUTZSfvalqDBxKpf3MXP67XnNEsG8E5Nrqzn0J5ScuYrrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768342390; c=relaxed/simple;
	bh=8csKdEsgBU5R0Mh9mKdJ0SxaJ5T2TJxmY1c5p2BWkrY=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=qMxAFhj7j5csH94cQUHl7Yyw+LFHxj+rZkUMS1gEYOHy7Voz0R//A72HS7oNeGjRQYLHPyewLahGtox77GsJygrLfDOJPNzLB9Nf17hJyOhNtXCR5ZY9RAFGB/HWQi5vtvsp81UL9+ZHJiVGEDgS7BJUj3PGMRv0Y5IODC4RcNg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tS5ifsC+; arc=fail smtp.client-ip=40.107.159.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tS5ifsC+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L7kbgOKfbXmOd6kY3sJ3TQeJBcW9THh1TK+iD8fYy/FU6eGi48XoB/maGTjzmsbvgKcZt5WWSXMeoarj3EWdyBKJfKefeAXfAdA2AjF5L6qL4bWZKtAZZ19gv2xBY+qUJpzeukHC+NFqEAsQofAsf3MtvZdiY9LqUF5/UnM3VzjbeaDVUnInx5/P6KHOp+GtI4wmMHw8JoJUHaJQ3m5bsVNvgr1Mr5o5wfWXdtPw+DxDANGcVFMBbcpJI9Nkd9/m3MJuT3RYdPUpHFBwXCbqVIghu7445kv2dhKhPKYCkEDylOiocMHj7EwjYbbfXAzavOetfX1fBM19V7FayMIZ5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ft7TBjZ8bi7hQiCGE/Uc8fmHfaQS1onEt42Lv0wHAyg=;
 b=eqXZ+caBvwVAmbR43lDH0adq5kicvL5VatzN6Lp9Ma3WOtqkB7fcetHmaDbNjjlOtKMhRiypL9dGlfgyNrYC/yf1PP1HgSiFzr6i4ETcqrThyUw3vpBMtoJeqAPo0tfy12McvwSrCEgFpdsz0rD00V5O5/00FnvejeLlcuZAjl+wpqVQcg6RiXKnOceswMr6s3S8zU+HS87IzNFNAlFN8Z/D3dFrLWntbAmHQyqZMvmR0OUuFYX/WZS8Tqbj75336NjdmBcHvvoh/yzA6d6qKOJrYPYCT6FxTFSeM1Bq7d60F9suJ7mX7ZPaTbQ4uEEmAfHis0strcL6vw8nHiJeTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ft7TBjZ8bi7hQiCGE/Uc8fmHfaQS1onEt42Lv0wHAyg=;
 b=tS5ifsC+w42zFxjNfkd70/+wicqQ9YbLmVYFHRNBOKYA3YoloEPsB/FF6k1GyK/oJeE7v1vXOYrc7n3oaCGla/Vy13AlpjvIoSGWBAeM6R7NfwFOnX0QwiOncHcmCEGHagW6jnA8UKznApmx65ffX4YWGglrQeN+k9M7f8rNutuLg4Upw4FT720rm3+g8GG7w4N2ZXl6h33Frbkcwt0BByl9jxQUrCX8Jf/3TLLcJDXVqELzkbn+DJG4SjT1ydOSIldytVLp5byxDGvv5vo3myRNEKgEX3snja+FkM00moHDgeEj30+Cc6cb6RAKlucoz0c7vCz/guPRqkmfMK2+2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB8610.eurprd04.prod.outlook.com (2603:10a6:20b:425::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 22:13:04 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::4972:7eaa:b9f6:7b5e%4]) with mapi id 15.20.9520.005; Tue, 13 Jan 2026
 22:13:04 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 14 Jan 2026 06:12:41 +0800
Subject: [PATCH] soc: imx8m: Fix error handling for clk_prepare_enable()
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-fix-soc-imx8m-v1-1-143de91ef077@nxp.com>
X-B4-Tracking: v=1; b=H4sIAFjDZmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0MT3bTMCt3i/GTdzNwKi1xdU6Ok1GSzVJNk8xQzJaCegqJUoAKwedG
 xtbUAdsnjhF8AAAA=
X-Change-ID: 20260114-fix-soc-imx8m-52bec6e4c7d6
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Marco Felsch <m.felsch@pengutronix.de>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>, 
 kernel test robot <lkp@intel.com>, Dan Carpenter <error27@gmail.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:4:197::10) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|AS8PR04MB8610:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d13662c-75cf-47d6-147a-08de52f0ec2c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|19092799006|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ajRHVUVMNGc4LzBQejZjblVjYW1JWVc5YmpEUnRrSzZKTXJnLzRHcE0xRm1r?=
 =?utf-8?B?Y2g0LzFaTFR0UTZvMHF1ZzVDd3lKTEFMSCtvdmFHV0Z5dEZ5bWdMb2Zia2pF?=
 =?utf-8?B?Tk1mazBWaWxaak85Q3VxSElGRnpobjUrdFphZUg5TkpISEticU54MmxRSGpl?=
 =?utf-8?B?bzA4MXRYOE5wUkF3QVpGWE5QN2Z0dlIyN3lxNnBhSlFOZGpqS3RmQWI2UUJ3?=
 =?utf-8?B?czFNOG1BOGNHNnN6aStvY3hCR0tsanN5dU02TkZGZGFOdzBqZStZNkJFUDUr?=
 =?utf-8?B?cXY3Z0ZBRVZtcFEvQ0FOSFlMTnVkelVWWjRmWmxwOWdtbXBST040TVpuclFH?=
 =?utf-8?B?RCtTZE5zek9OaklpdCtiVDFXOXl4bEdVTDRPZ3dPdnUwQ0gxNC9jOVM3eUdJ?=
 =?utf-8?B?d1JBL0pOeCtiUnpKa0R0ZEExR055Q1ZldExkMHFFTEkxeVNxYmQxbnZZb3Vj?=
 =?utf-8?B?UFpoTWNxOHJ3YmcrZEdmMkEwY1UzZHpsbTBaSnlVN1ZqeE9Ddld3VDZDeHRN?=
 =?utf-8?B?NjkzLzNKQkRnZzc4SVZmKzNaNzFzaENVbkRidHNrY3RMWGtHTzFRaEJGYnll?=
 =?utf-8?B?TmNBbUFHQzZJNlVuc3laaEJlVjlmWlNYSDFNM1lacENmRlErQUk2YmNianR2?=
 =?utf-8?B?YTRiTFdyYVNTeHdZYzJobkhJMUt4d1BqeXozZzBZQllqL0lGVnNEbkgraXBa?=
 =?utf-8?B?dWJoS3IrNHZHdmFHaFpSV3dRL0xrTjEwNHBuL3I4dVIrc09wVEVOZE80S1Zx?=
 =?utf-8?B?dWhCalVMSVZwRE9Vb29FcDFmU3BHL0o3YWJPRXkxeDlYdi9GVkNCMkhjcXpG?=
 =?utf-8?B?VGRRalE5eDZKZDF3cjhGU3NFWWpoRGtqeXBGMU9aWTFpVmNqcnYyZkpOckY5?=
 =?utf-8?B?MUl1NTNwaTkzUlRDaGJON0J5UGpJMGhlTzlTK2VJa0srd2JMT2RUeHprZWl4?=
 =?utf-8?B?U2d0bVZEY2VTeEJna2RmKzlyM2RFOXlXYmJSVmNDdjBXd3VlZW96bDlpOTlQ?=
 =?utf-8?B?TzdobmJzL1BvMzJ0bEVzZnA3eE5RMERuNlNCRW1RSmRoWnA5QXk2UTlRQkdy?=
 =?utf-8?B?VWhqakg3RlpVa3FONlZndzkyajM2dVo5RDR6UzlLOEFtRXpua2tQck1FYVZI?=
 =?utf-8?B?b2Q3QnpOclRVMWFxL3pkMzN3eVlSbFNoZ0JZaWhyTHlhUmxUY25LS25kYVo2?=
 =?utf-8?B?Q1MvZnVnK3hjcS92SkMrcTdiM2ZnZXg1azJpTjlMOGdZTUtEbWJjWXVIOTYv?=
 =?utf-8?B?UStLeWppbXEvT296Q3h0V2RnVUJjRU5IV2Iza1dTdHNTQ1J2OThZdjNQcjJE?=
 =?utf-8?B?VU1pVXViamMxVmxWaFpaVmhQQVFMd25vMmMvaTFaMzNUd1lvSWQvTGVYbk9T?=
 =?utf-8?B?VW1saVVOQ1NtQmpwWStEbHBLT0MrTzE5RUNPKy8rQnFNSDBpeTBHQWJYOEdk?=
 =?utf-8?B?b3Z5VFl0dzRJcmEvS3pQMzZmMWNpeEdxdHBXb0VzNnY1ODhPSDdwMzVaTm9G?=
 =?utf-8?B?RXhoN2FjRHU1YkkzeExyL08xcC9tSXhpK214eGNHblRRVHNaYWtDVlpDY09N?=
 =?utf-8?B?Nm9CN1FrcVkydzk3YlA3cGs1dTE0TGNoYXR5b3BSTm5SVlBNWG9UZHBnaFNx?=
 =?utf-8?B?ZHpnU0FlQ2pQeU5kdUZ0eXJrTUZwVWp4ZzJSd2hEekhMU0YwOC9hREJtTVNs?=
 =?utf-8?B?YVEzSjBlM05lQjdXNStXN1FkUnhNcDMrVGU5SFNReTRvb3BrYjdnNzliT3cr?=
 =?utf-8?B?WXpOb2U1ZnBSaGwwdmJScnVsK0tNTndWTU5BQUVYU2N1T3I1NUIvd0xlZ2xQ?=
 =?utf-8?B?b0dBU3pnenVxOE1yNXlJMWVUSXovR1d6UllQK2Vtc05XRzUyMzhEZzVEQ01q?=
 =?utf-8?B?YUlUc09wUTRlRmxyTDU3dS90UmJUV0dOaXJ3Y01WdFJvSVZaUS9BZDQ5dHlU?=
 =?utf-8?B?Zi9JWDkzVjRrbFJDeEovTVEwSENhby9vb0gwQUNtOU9mZTdSUGd5VDAvV3BK?=
 =?utf-8?B?SEpTbDRCU3N2Yjl3KzhBakNiKzE1UmxwNDB0L2xFOWl4VVFSaW1JbXRCeFk4?=
 =?utf-8?Q?HkQREs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(19092799006)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OStuVmYvdTZJTzlDNUZDSFVVZ01ObTFEQjhWcFY5MG1YTWNjRmlnTjFPaW1P?=
 =?utf-8?B?cGZqaUlTSzl0b25LaXFiaU9zT2hKQXFsS09Wa0VJN3VmZ2NkSU1rcXlucUJ5?=
 =?utf-8?B?bTM1VzJXOEFld3UyVWpibXpoSHdEQkI2aWNRRCtJMUw5b0RESTZSTDRHZnFl?=
 =?utf-8?B?TmJKdS90VmhqWmxkZmV0VDRmQUYvU2kyTTZHL1IyU3pWMUllTXFaN2VVNGFI?=
 =?utf-8?B?Vk1MNWxmVktFR3lQTCt0QTh2YkVIWmxFZHAxNDZEL2VRSjEvQTFyVjk3Z2JP?=
 =?utf-8?B?dlc0MDJvNWE5SjJvWFl1Y3F1UGlZZVRXOTl3V0l6ekU3enpNMm5xTkt1ZTFm?=
 =?utf-8?B?dFZkdDFwdGYxb3doQlJoNXZJSDBHVHZVY3g2TkVKNVpSMW1XZnEyeWtEZUZJ?=
 =?utf-8?B?bTdFN016eVpqOHl3WWJWMktxOW5xR29Ld0tOdTNudlRnaUNSVE92TWFFanhO?=
 =?utf-8?B?ZjJKN3VaSnVHdmd1RFBNRWF4U2VGb21TYzFXVmtmTnRBdFNwa3NLZ0RkdU5o?=
 =?utf-8?B?cDVSTkh6WmtGZHJleTRpWmJkMm5PUDlFMFBjQmFTdktEaUVMQ0JoWWh6UVR6?=
 =?utf-8?B?bkhjV1JMN3pMQnVLRC9uZU13cVNpcThqbGxDdEFaenNEUFVXYW1nQU9iZ1Nm?=
 =?utf-8?B?OEZRUFNWcU1COE80cTgrbldKQ2VtMnpDeng1ZFUzZkZzK3RKZ1dQODdEdTNx?=
 =?utf-8?B?elRMd1Q5bm1YK3JseHVCZlVIMjhTTmFMOWdTK3M4aUw2eUVSamxMT2Z3WEcy?=
 =?utf-8?B?WXBlSHE2Z0ppZHFOSXRxdmt5YlduaEN5eHMxdHhiWDltZVlBS1lFOU1vUCtH?=
 =?utf-8?B?eHVQTW9LT3RUaUlmejVheVI4dUwyM20wL2QvMnE1VXVKZTFoT2xaS2NWejZk?=
 =?utf-8?B?RDZVdy9VNUN4ZzdDMkFrSFZ0dm1pbm15bjNNRGVpc01oYXNiK0JtdjkzUHFW?=
 =?utf-8?B?ZTNBS2xBNjlIQWdwZ2x2aUwwNTU1cHVtaXZRcmRLQlh1Rk9UZ0lQMEtDWmdT?=
 =?utf-8?B?ZVEzVC81MzZ1aUdUR0pHbWZYUVdSd3V1MnNPMW85VC93ZVZlcEhJVHRtRm9U?=
 =?utf-8?B?dGprczhDSnZMdmM5bjY1MlZlRzhMNFhLZXpZWS9Uck1HREhMNVZtTnhUVXB6?=
 =?utf-8?B?ZnE1cFVBaWxaTzc2cFIxSVR1Z3pGMndiMHMxUE9DRmFTaDc1Z3BYQVdCdHB3?=
 =?utf-8?B?R2dzYTUxNjBQUnl4SGhPYm5TbmJYUFFYblUvUitUTTdkb0JiWXBmV2NNeEhu?=
 =?utf-8?B?VkMyVXlucVYzbE5CaStBWVZlalFzWkIrYmxHenNNSmVwOC9LemhaZWxIdHU5?=
 =?utf-8?B?eUtMRU9RbUN4YXFERTk1Yjd6UmYzQ3FYUGlqc0JHY2ViRWRQa3RUUEIweVlF?=
 =?utf-8?B?NTNyb21TSTBoYVVyMW90Vk5KWjM5RHVlUFoyTitJZWxpeUxsN094OUZUZVpD?=
 =?utf-8?B?OG13Z08wNGVzRjYwMkNwT3hSSUx2bTZlVGd0Z3FDWFBleW5nSUxyMVh1b01k?=
 =?utf-8?B?NlF6UlQ1akN6bnRIeE5qSmVXVm9XaCtteDF2MkRyMnltcW9Oa1dISGhRRjVh?=
 =?utf-8?B?MzU3WWhySDkvdFdEUisxN3F2aVNkckU2NlFrR0QzOE8vUm5hemxEY1dub21P?=
 =?utf-8?B?YTNTc0FLL3J2RW5TdDBoVzRoL2NCMU8vQUNCcmdySHFVSmtqcXdtWnBmU0pj?=
 =?utf-8?B?RXIxbGJadkVZVmM3RVdGR1l5RTN1dEQySlRndXB0Q2UrK2ZFRDNTM1p0dmw3?=
 =?utf-8?B?dzRQMjdXT0o2Sm9qRy8xcHBLOEtaZ01uU2NRV05sWkpSV09wbVRJYkJkTmJC?=
 =?utf-8?B?S0NaYjFHREZIcnhnU2JKMjFLL0d1RG9CdUlJK3Rhd0o2SVFGbWNJbkI0Y0g5?=
 =?utf-8?B?eVBZSXRBcnNkNFl5Z0U4dk52SjloUktUMDRHVHEwYUIwbTJQelliam1ueVJv?=
 =?utf-8?B?ZkcrekJ6OTJDMHNsTTk0WTc3Y1pwemZsY0Z2bVFkYlM0Sm0wekpZcTUyUUlW?=
 =?utf-8?B?akJ3Z2MwWTNpaTJkZnVuL1E2V2U2WUxieHNVWWtSWVZFSUNXWnlVM3RtUUFQ?=
 =?utf-8?B?OXBMaGdNVWNyL2I3YmNUaHhmOHFzUGMxUVFySXRrSU5RQmJoMnlGMjJPMk1T?=
 =?utf-8?B?bkdsZGVrenJuNlY0SWJsREpONmtXVE5NMzk5WE41bDEzN25UZ3R0UG9lWjdI?=
 =?utf-8?B?ZHNncURKTzBiN3I3TnBuU2ZvV056Q3FUSlBmNUJvQVo0dVV4OXhSQ29UMzB4?=
 =?utf-8?B?NmhuRlpBZnk0RHcxVHl2eEdFS1MxTXBwTHRSVVNFd24vYjEvWDE3NTRDbEpD?=
 =?utf-8?B?S1pzYTU0eFJjTFp1alE1d1NUdkVtQWR4dTBZS05HcWZNbXhjUWxwZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d13662c-75cf-47d6-147a-08de52f0ec2c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 22:13:04.3971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7jbyO7E4v439nqGICY54qwthUweOBN/PEamLdM3hEA/pMCVmSnP+S0E+u83Oo7xiFInmHzzfTckfFUjGahE6uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8610

From: Peng Fan <peng.fan@nxp.com>

imx8m_soc_prepare() directly returns the result of clk_prepare_enable(),
which skips proper cleanup if the clock enable fails. Check the return
value of clk_prepare_enable() and release resources if failure.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202601111406.ZVV3YaiU-lkp@intel.com/
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/soc/imx/soc-imx8m.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
index 04a1b60f2f2b52cc374714f9a1205496c1762f39..8e2322999f0996d2723768469c6893b0ea22eb9d 100644
--- a/drivers/soc/imx/soc-imx8m.c
+++ b/drivers/soc/imx/soc-imx8m.c
@@ -148,7 +148,11 @@ static int imx8m_soc_prepare(struct platform_device *pdev, const char *ocotp_com
 		goto err_clk;
 	}
 
-	return clk_prepare_enable(drvdata->clk);
+	ret = clk_prepare_enable(drvdata->clk);
+	if (ret)
+		goto err_clk;
+
+	return 0;
 
 err_clk:
 	iounmap(drvdata->ocotp_base);

---
base-commit: 0f853ca2a798ead9d24d39cad99b0966815c582a
change-id: 20260114-fix-soc-imx8m-52bec6e4c7d6

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

