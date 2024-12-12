Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2059.outbound.protection.outlook.com [40.107.104.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64192187870
	for <imx@lists.linux.dev>; Thu, 12 Dec 2024 09:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.104.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733996152; cv=fail; b=ok5UY6zNZxYMTnuOtt1A7QqRFgabVlIDDy3t7mWna0pbL+A/ut1Q/H4e0reWdTXaEGPLBUjZ+OoxiT0k4vJvS2zPtL2lErxwT9Xo0kC7xZDxAFoLYzgWy6uhgqNefmTnRbWsI0JKvJs0XMrMLZLnW6A0EfRDDXbZKEkJLTxg1tw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733996152; c=relaxed/simple;
	bh=5aQF00iQ5/a0cMZzpcs2rGd94+VkLX4uUg19gIdoRnA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=bIcR0QYQsMGHb7siClBNSRmR2xtat6B9yNFksS1wtNMHW8G96YPHQqd7DaSdPbDWqk+M4P8aWVihCTGjCSiUs8tw+ZaDTu7VFr9QNS2ZuW4JyNdVbZgAFMi9s/bTEYQyC5TWJ7pYel0kJftyq62H1sM4/YN0vLjcBWavgXKpOVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=WuzGRcM2; arc=fail smtp.client-ip=40.107.104.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="WuzGRcM2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yedv5UL8Z+298afjuvFj582f/9K52VeYpkXDke/HRDjA5An8BCzDqWbRqJd4ETTSZiGtEdNetObdG12lalUoGLjYg5ZsIUTpWs9frqNXm115p2GXeYzYyeyQ7YtY6v2J5ZDY2Q51RIp3pmPU+Ws1J7LLFYT9ZtslWH7GnD53jRf+GEa+QMa3sRYPh907gPrr4eNcmT2c8LM/dObVZGlrGZOi+nwBPYmIW1PnTcpPwUjrqUtQuDQ3hZNcwtd1hmGFkoS1rO4/fip42/gJByaqdgB9e6GeQCRuwf47SXRxAuPRO5K4MqPrrBcItMcnhA8F64utVrnSnCrBAwrbyDEY6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yufxb2y3XS4I1a1WyHJvUTWE2+1F/8lV/zWaOk4QFUs=;
 b=CWqhHk1rzJ6vdWLKJu9wDgBzkGtDo/GSO7T+SJfeuw0sQPXaAhCapZHlPfn+M4y1zQ8yvWMtqcAmLgQs0ffXNEvfsBWAQjzQ9RAuK9o1hjTpB48rj+nXogZy+dfhMTUWHRoeeUOp3Qc1Y5oPMUT30K7N3gg23h8JUjAkD4Pq6A2zYTB+zb4aaxymkbP6W0mrT+87CkGMy3frB70IUf4qmaTbX701YN+3LVgjlGJttW9XTfysgLSyKnOhV9FiDsOgrgbg2VhCSqTZSHIF1I9OjZUDKLErLAS8s67HDq3uOYfAgPQuwLbFDlWpfpz2RuyeryeexEbwUUFfjGbLWUE75A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yufxb2y3XS4I1a1WyHJvUTWE2+1F/8lV/zWaOk4QFUs=;
 b=WuzGRcM28UF3pFG7qUapD+mFAMbGhlBRC9gyTtHduE9xwK1/k0YXD21OXpwqgOCD47cxo7/qrpGou0dLvL66H8Txg5E4Fsqt5psiFTrVGKEWgIy5YGy7y808QlRpAGVu4aHf8EnorrGEvCNUPmdTbC4KeyTFfq4+I1NU5Fbxt+jISDPrG76AU7sI38mHDMlBSpZ3p/YugPE/ZyRUiHr2tLbZjcWGKLVu6YWJ4bgTVNVrXAtni4VP+F9SOQGIcyxywDfLNdbdp22hXsCT1keyLdjtFbO41F6DETnq9JvTmS84LyCxUIkq2AJpmLDUg03xSAEDzol2UipRUvAEKYt4qQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com (2603:10a6:20b:429::24)
 by PA2PR04MB10279.eurprd04.prod.outlook.com (2603:10a6:102:406::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 09:35:47 +0000
Received: from AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb]) by AS8PR04MB8642.eurprd04.prod.outlook.com
 ([fe80::50d3:c32a:2a83:34bb%7]) with mapi id 15.20.8251.015; Thu, 12 Dec 2024
 09:35:47 +0000
From: Jacky Bai <ping.bai@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	aisheng.dong@nxp.com,
	peng.fan@nxp.com,
	frank.li@nxp.com
Subject: [PATCH 0/1] Add i.MX943 basic dtsi support
Date: Thu, 12 Dec 2024 17:35:54 +0800
Message-Id: <20241212093555.1376568-1-ping.bai@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0021.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::20) To AS8PR04MB8642.eurprd04.prod.outlook.com
 (2603:10a6:20b:429::24)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8642:EE_|PA2PR04MB10279:EE_
X-MS-Office365-Filtering-Correlation-Id: 086ca732-77fa-48ec-a176-08dd1a905b5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NFlzMjNlL2ZNWmlJVlF5TVhGZDFDSEpDVURreWs3RTBFM1RsRDdLMkFZd0o5?=
 =?utf-8?B?Z2s2VTR0L0FYbkljYlJEMUdNWVVJK0ZPcjFPbjk0NnVQUFhpRmRBbDNtVURB?=
 =?utf-8?B?bVhYdDFEVWhUUzhBRDlWSjBlaHRzdEk5KzVLRTVmcE9Fd2o4Q0d0WDRHYWpy?=
 =?utf-8?B?V21HbktLcXkzZW50NkpMYUNYNWdSSHdhOVF0OVhjZkJ6cGtneXR3TVMwaGFx?=
 =?utf-8?B?NlMrVU5CMjdHN2JDMm5JRW00S3RGMTlTNFJQYkEvYW5wWW1Gc2VLSGpET2ho?=
 =?utf-8?B?REVLSmlDZXNhZmNkSzBTUzRmVStGa3BJVnBTQUhWeldIaVFEVUN6NXV1SkVH?=
 =?utf-8?B?TFlhUWNHYU1XSXNhRVR3UmJZdnVOdjF5N0xqMDczMXRETHhzREZ3cGVkbG0r?=
 =?utf-8?B?eEFXMm1Xa2R5WEQ2TithWkZiU2gxbnVqTzRuRnhQNjNGMjlLNGloUTlCa2sv?=
 =?utf-8?B?OW45dUtiVlhFN0tpeWc4aFNwMnV6a0hlRE9rQ29PaGNIU3Q1Z0JTdUJJOVQv?=
 =?utf-8?B?VWZSMUNDbXVpUVRmOTN2U2poNitlUkNueVJhVkVrRUdmV0hsYWZBWEpwSzRP?=
 =?utf-8?B?aTlQZXQ4MmhMWW5RWEEzOEsvWURqNk1sQ1B1eloyTWF1NHRZanRxNnZ2NGxY?=
 =?utf-8?B?L2wza1B1cnRVT25VMVEzOTNUbC8yYzRwOVpsR3J2WnRzalJWRnJzS0l4MHM2?=
 =?utf-8?B?M29iMDdDSm04aWJHNE5ielBhZmU0UGN5OVhJNFlLdHkva0hma3VTSXAwcWRO?=
 =?utf-8?B?MkFaYnlIeDJMZUo4UjJHUE0yV0dCTVJFbWtsY1Y1Z25Vb1NIYmZBTk9YVnRk?=
 =?utf-8?B?a0pMYTU2Sk0zMlVLUkxHTGZkenN0bXV4MThvbDlGNWsxRnY3R2lGaVFFNW1V?=
 =?utf-8?B?V2VHZUxGUzNlU2pkaktXOHVTMXdCL3JTM1ZnUmxyWVhaUjJ4bVJwdCtIeXVI?=
 =?utf-8?B?bUMwU3BZU1FsT3VhdWxNUkpKcGYxUkZEaXpPOURBbm1RU3YwZ0U1eFJjNFBB?=
 =?utf-8?B?emNJcndoRmRGczhVMlFDQjlQMnNpWGpBeUdXM0xGNDVyeUd4UjJMSE5CS0pD?=
 =?utf-8?B?bFVaK1RtQURHbzhSSTNYaCtocy9VU0s3QmxRbkl2alZic05LZTJiSWFKMnNN?=
 =?utf-8?B?WGtoQ2hBT3VURGF1aXFZdHlHR2tMRDk2Zmk0Q25XRExPaDZyNnA4eUdPZDFx?=
 =?utf-8?B?Wm5pczBPbVpDVUt1RGdnY2RrN1J4Ukg3SUFoZFk0bU0zaXFyUDBrM1d2MytZ?=
 =?utf-8?B?SUdONC9tNGVMN2g0aUNKN1ZMTU1nYTh5dXduR0V1U0JmSGNpdDVpSDNiNndu?=
 =?utf-8?B?Wm5za1EvRkh6bDU2MTRZNnpGckd5Qms4WUtZMnFIMndwdVV1QVZ3ZE5UNFBM?=
 =?utf-8?B?UCtxa25ScDdISk1KaTRZY3lCbVEwMk9adkdVd0I4T3d3SFNxbVBnUmN2YnJE?=
 =?utf-8?B?Tzl6bUZVWkpNc2N0aGRFc283VFpFRjUzWWwza005YnJqNmRFZFNwYVhoSXBo?=
 =?utf-8?B?UmNwNEhkYWRpL1dvSUJsKytkS3RVdWQvdE0xNWhEWDFKZmZ4aVdTLzNWUW1k?=
 =?utf-8?B?bmdERHlZQ3M2VFNzL2p0djRVYzhqaFB1U2l2WktYVndVb1RJRnFwQnl0bmVI?=
 =?utf-8?B?M3hOaDhMNmVmRnNHcElTZHNPOS8vT1kra3hZS3hESUZXVVhLY24vSnJzOWU3?=
 =?utf-8?B?aDk4RllmUGNGL2QyaVo4MHcwcVVZOE1pZjM2NUZQam4wUnpoT0pzZmd6K09J?=
 =?utf-8?B?UUZGTndMRHlBdkZDSlRwMWpVMjdtc2lpVkJXRkh3Q08vMHgxdHJPYytaekk5?=
 =?utf-8?B?dzE2REI3RVh5VGdjL2hrKzZ2MTFNL1RYZE5URjVFUHZjWWNjdjZ6bFltTjk4?=
 =?utf-8?B?SHpVTVRPMXNsUHk3a2xmVmpNU3NXM1JzbGd1RGFDQWwxdUE9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkVzaXVvaTIrRmNtalZmc2k3d1l3bVIvNWUyYXlXeFdvRjBoVTdrS2RGNkoy?=
 =?utf-8?B?ZUVRSFZ5K21iNjBzNzNNVGhFZlRJZE1rZlVraEs4T3U4eEZSTlRPVCtFa3dY?=
 =?utf-8?B?U0d3SWNFdlZwc1J2VEhsR0xpcDRpM2F1MTZhSDMydUlKaENUQ0VXanNJMXNt?=
 =?utf-8?B?d2QwTUZnN3l1QWlhdWdOSmtvbWhBTVZFSFVGV1FscjZveXpXdnBzWUY3SzBR?=
 =?utf-8?B?c29kWnNVOWVkbkRXMlR2d1E4V0JiK2cwV0NOSmpDRXlicVFpV0dqcnJPSTAy?=
 =?utf-8?B?UWh3R3lXNGM5T2RYcktDOG9qeEdNZzFXWmlyQ09TSmtJZHVTKzI4TGhpTEpV?=
 =?utf-8?B?Q2pFQ0M1a2s3eC9VYnVvcnZsc0xTSmEwdkp1cldEKzNxVk1FYnJGeGJTY2hr?=
 =?utf-8?B?dFdEUWxLTHM4U3FFNXZvOERFK29Qc2RQaVAraCtiREswOUVqYS9uUjdEbWVF?=
 =?utf-8?B?SVhreWJVTGtSRzJ0aG5TcThoZDFNZGh4b1FkbU5WRUxxY3RHeGZMc2lHbjN6?=
 =?utf-8?B?OWxnM09RRTVyU1BINmpnVGtwRjJLRi8rTGlZS3dLWGIvQ1dLcU0xazc1NUVk?=
 =?utf-8?B?czgvWXRJRTJOUlNCOWtNWk1JbGhJZlNucFUvRVU3am03bGNldkQxS3h0Mzlr?=
 =?utf-8?B?U25GbmlBNmRIN3hlck5XMHU1VFJOaHJJN3Z5Sm9vZkYyWGFsd3JFNWdpWWx0?=
 =?utf-8?B?alJCSE5pRnc3bDVhaDdTTStTczJEaGt0aWFzM1hNLzJDb0pJU1hkd0c5R1JI?=
 =?utf-8?B?MElKWVAwR21UZXR1TFJyb2lGTkp2Z0xwVzN3UmxWM1dSbWdiRmFMVnFpWk5L?=
 =?utf-8?B?Vi82UkhuUFBLd3BUNWoxaWx1czFMM211MUlHQ3NHazhlWlBKdlVBdmdZbnFu?=
 =?utf-8?B?VGZtbE5oZlFONytFWnRidXB0ZmpMakVKOG0vSmNmNDlMZm1Qek5UYWRtVUkx?=
 =?utf-8?B?c1ZJVmt1bFJxSEpldXNrTzgrUlNsekFkYmw3Z2E1YzdzTDJRWXRaaHlxSjVy?=
 =?utf-8?B?ay9SVEU2bXVYOXlaZlN4Q0hLT3NOWlorMGtYU2czRG9mSGdmaTc4bXpyUWZK?=
 =?utf-8?B?Zk8xS1MxNitiWGdTZFoxMnhCY25Md0N0QVZWVHN6Tmt4RmtsTUtITHNycGg2?=
 =?utf-8?B?RGtUck0zZlVocmhZYkhUdklpV1NSVGxzeTBReUFQUGthSGxPbmhwMFhQU0s5?=
 =?utf-8?B?M2MyR05lM2lkcVA4eFlxd0lUbVdiakVNK1RIblN0K3hoems4azUzWVBldGRZ?=
 =?utf-8?B?cU5uaDJMUy9HcllaYnIyYjJvVVJNZkh4VGQrTEJoUEJJMEZXTlFwNXB2bG1S?=
 =?utf-8?B?VHkwUzZqWit5ZGtxMSs3K2pSRisxbmMvWUxnZ01TTzIvQXZNZ2c5V0VkNXpk?=
 =?utf-8?B?akNMclJmZTlmOGxQc2R4WlZyczF5RC8wbjd0VXF6VExPd1BQbmF4bGViNGdh?=
 =?utf-8?B?cXgzTjdvUSt0ZmpON3N5ckNaZXFLVlpTSVZkWU81eTh3WGtCdk1WNGY0K2pm?=
 =?utf-8?B?ZjFvNEQydXZrMDJIMVZZamNBdFpOZUU2dnpZS1AvNXhmZ0RHOVMyRElHYmw1?=
 =?utf-8?B?M3VjWGlNaHJVdTVFNEsydjBuelhlYnViMm9ZT1hKd2tYV1NPZEl4SWxWL3pB?=
 =?utf-8?B?dWp6NGhpMTZUQXltdGtrUVZjN21CS3lLTEYwOVl1SVZLNEZVOFV2SkRHYW8r?=
 =?utf-8?B?QVE3SndqM0dydDFBVWhBSEpEbHpzY2NtTnJPaHpnL1A5aU5ON2w2UlY2eXQ5?=
 =?utf-8?B?ckJkZU5wQmtDU0VPaTBFLzlETWo1WlRTNlJvUnpmN2RZQU5TS2tCdGJjYmp4?=
 =?utf-8?B?dkw2UXN2SlN5UUpaaGUrL0Z6TEdYblpGSGs3YldRclRxM3BWcEVNVVNKY2Vp?=
 =?utf-8?B?LzV3aEdDZDIzTjlCdUxLUjRicVNyZnA2a3JWYzgvb3BSZE9aUm5NSmVzSFhr?=
 =?utf-8?B?S0ZlbGdWa0xqZ3cxZ2x6WGZBQnFXdmZRdjUzK25QUkFsblA4dzFoTmorYnQ3?=
 =?utf-8?B?eVRxYzVBRlVkeXlqSHJFQVpFc1RETStqVUxTc0hDUmkraVFHazZBbm9Ec0VP?=
 =?utf-8?B?cFRtb1pPRVRaKy9iVEwydlc2amIrc1FBS05PYVJlSnRrY202K3A5TGRLOWlY?=
 =?utf-8?Q?HuhycQVBo9269izQkCGSe/6mr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 086ca732-77fa-48ec-a176-08dd1a905b5b
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 09:35:46.9390
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zDlLWfblTCj3IpSsrdTcqCnz8g4LFXpqhkbkesGAOvJYmtF+zIYgeGEeJMAFvrTCHUZpDl1Hmv3BapiyWGz/Xw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10279

The i.MX94 family is an i.MX MPU with an integrated time-sensitive
networking (TSN) switch, enabling configurable, secure communications
with rich protocol support in industrial and automotive environments.
This is also NXP’s first chip supporting future-proof, postquantum cryptography.
The multicore design of the i.MX 94 family delivers high-performance and low
latency across both application and real-time domains, with an integrated
functional safety island.

This chip offers a rich set of peripherals targeting industrial, automotive
telematics, and consumer IoT market segments. Part of the EdgeVerse portfolio
of intelligent edge solutions, the i.MX 943 family will be offered in commercial,
industrial, extended industrial and automotive level qualification and backed
by NXP’s product longevity program.

Jacky Bai (1):
  arm64: dts: freescale: Add basic dtsi for imx943

 arch/arm64/boot/dts/freescale/imx943-clock.h  |  196 +++
 .../arm64/boot/dts/freescale/imx943-pinfunc.h | 1542 +++++++++++++++++
 arch/arm64/boot/dts/freescale/imx943-power.h  |   41 +
 arch/arm64/boot/dts/freescale/imx943.dtsi     | 1284 ++++++++++++++
 4 files changed, 3063 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx943-clock.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx943-pinfunc.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx943-power.h
 create mode 100644 arch/arm64/boot/dts/freescale/imx943.dtsi

-- 
2.34.1

