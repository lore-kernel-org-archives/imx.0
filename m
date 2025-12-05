Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023106.outbound.protection.outlook.com [40.107.159.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE332494FE
	for <imx@lists.linux.dev>; Fri,  5 Dec 2025 18:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764958984; cv=fail; b=VrYh2RF9FSnXXXcbsgND2vlVf0f290EtAlzUGwHioGFZGa76ihS3UFjkY0Wjr9XKaene2s+upjG+rcbjbcmGmfqJ+Zr45V5Yr7z0Qh5gCmCzv8bkDT21Gzrv3baepEjpwE9UCOZdwsyPHA7JCivAU/L2AIXZ/qZuiLdFbpZNkv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764958984; c=relaxed/simple;
	bh=H1tFb+XLyyoC2hV8dyFq8vBzVScE0Qo6s6IX8UKyp8k=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=JDayvNwTMU1jVQXC4e8W51kSU76yiyFHZBHMb7UqD6zKbfItV+rk9n+t4Y6s1QW5ls5/b+lQXnbSDRC9XKvw/YgF8MsNSvw0bklYXoJh/5X1k03F9sYSrUXji9OJare1HROoSAVcfLxOH9gVFPSpvKqJP8g+rl3vvUMoOyQUios=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=variscite.com; spf=pass smtp.mailfrom=variscite.com; dkim=pass (2048-bit key) header.d=variscite.com header.i=@variscite.com header.b=adFGB45A; arc=fail smtp.client-ip=40.107.159.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=variscite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=variscite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=variscite.com header.i=@variscite.com header.b="adFGB45A"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EqgYJb29lqIZ+GiD/bqLvZP40mlqWfOWPgusTpcIkMoLsYm3blVCy9wV9Cvw/rixfDu5crQILGy6KXynHAgvha0pEAONDYZbe8oCWsHIqSxPrd9qPbYDkNdY8YLJzyDsvxs324E5DGjXzD6d8dhjqfzUvlUhVJKt0JsO3C2aVIwnORYSuVP/P9IOWD5f6hUQDNdeZg+jDqbpDjg7ailtWrNk8mW/w/22cFtX7GWp8Gwln7D3+Q/o6c4og99AhbT4NYu7305aHD5pjYOQwupsTCJ7a77Cr2XXm3+aU42XiDlMXj+2nKsV74WE5oYQuwlQofTzgGFc3BBTg/UEY1+/GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/MpyvcBIFAM8YToly7xmiIFLnl5UCMAay42VGRdCj0=;
 b=we+zUmGnPBIbXYz3vUaPGD+4W7V4UF52pDp68ykIUJyrS2cwzc+HAn7IhcFDRK53h02gPnnazx1QI4cs5P7WyqFTiSQCUSTS8jL2cFH+wi1uiDbZE3o7DzKQRb7c/imx9k7vA9u/Bk/hJsWZjWchhPw5O+iM2R/vP6I9fBOZDTYpI5VquwjPiV1RIw7q5jqbyLbE2BUkZjPLEq3V2TM4sM33TJFqEqxk/uEuHgay2qeZfNxZalyq2eTLIFc0zC6NsOtzmPglOd9OPR8EQzNwsistaR/w59bzJ6yngqTJqpepn007CgxadgozvLgHPf61SFIRcKhqYdnFYhR25vIf3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=variscite.com; dmarc=pass action=none
 header.from=variscite.com; dkim=pass header.d=variscite.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=variscite.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/MpyvcBIFAM8YToly7xmiIFLnl5UCMAay42VGRdCj0=;
 b=adFGB45AdddwbpHtl/i8Y2/tkxT8SX8xEEmJBpmEAH0EwH1JCU29wyKrFnpAlOumRam1hnqB09XQtR4RKeYqM2Vsc/5spiUD2rhxF0q7dXGurBWmtuKodSRsVS/xX8VwBigt2JR2fDV97/UgTb46P7sVK1uytB8yxdKDe77rsHR+gvBPOV9wDaw3nFPhmWPCDOXe32r7tJw6d0wRKV19YLq7zriAXW7dBCyoKAe3QwExollGTXbUARVLKM/KaH+0/qNozieNdZZ4TUkB5OjMR6NDLLK0bZdUwgap+rH9DNvZna2wwvD66VU82MDNF1Cnr328dJ66AoC4s+//xnlMRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=variscite.com;
Received: from DB4PR08MB10341.eurprd08.prod.outlook.com (2603:10a6:10:3ff::18)
 by AS8PR08MB6712.eurprd08.prod.outlook.com (2603:10a6:20b:393::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 18:23:00 +0000
Received: from DB4PR08MB10341.eurprd08.prod.outlook.com
 ([fe80::24bb:a230:6690:f824]) by DB4PR08MB10341.eurprd08.prod.outlook.com
 ([fe80::24bb:a230:6690:f824%6]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 18:22:59 +0000
From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 0/4] arm64: dts: imx93-var-som-symphony: align DTS with hw revision
Date: Fri,  5 Dec 2025 19:22:53 +0100
Message-ID: <20251205182258.50397-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR2P278CA0024.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:46::13) To DB4PR08MB10341.eurprd08.prod.outlook.com
 (2603:10a6:10:3ff::18)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB4PR08MB10341:EE_|AS8PR08MB6712:EE_
X-MS-Office365-Filtering-Correlation-Id: ffc13720-7fed-4333-f80a-08de342b5211
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QWFucDZwU0YrTGpZdVBuQzQ1ZFB1bWNVaFR5UlNPODRnaG5XcnJoWnBhUWhk?=
 =?utf-8?B?S2w5aFJzZWRmM2szS3VDNXNxWmRWakptUFNNRVZvUU13clcwSFppNDZ2QnlC?=
 =?utf-8?B?QlR0ek80S0RqRnlVMGVnY2tocEJEQkpqY2ZrU2hURksxNUQ4MmVnNUtKYUVB?=
 =?utf-8?B?ZTNhdTMvMFloSVZqZGNZVDVsb1NIa0thRTRZcmxDQjJaeGdNUFpFQVRnankv?=
 =?utf-8?B?Mld4SndiNS8rcmQ0WFNyMzJlY3A1QndtendxdWdITE1yaTIyRDhzNitJWjZo?=
 =?utf-8?B?OTZsTVduTnRQN29mTXl1QlpuRXpuenB0SWQzUVpGQnhyZitySFNBRy9hdTF3?=
 =?utf-8?B?RW9pSE5iaEdjWGgxekxtM0ViZkR0dGlaRXl1WWJpUFpUby9hZ3BJcWpmT2xZ?=
 =?utf-8?B?RG5vN3hDN291Rm1HaDVTSDVYYVU3azhncDVrZThRc1AwaG5NT3h3SGUxY0d0?=
 =?utf-8?B?UkdyTkp5b2lIa3BzMEU5MjdvUDd6SUxPbWU2cmYrWWdRNnZRTUVFWXd4YWti?=
 =?utf-8?B?WW5JTUlGOGxGdklzT3JzSkRQOElUMDFtdWk3S3dyMTVLQkhGTXFOdit1aERD?=
 =?utf-8?B?MGdsSGM2QmFwall5bVNQMEJqd3Q4VDVKUG5pRDEyMVdNME40MllvMUE0VmpS?=
 =?utf-8?B?VUM3eWVhYThGMHI5KzVIM3pUcXZ0U3ptZlNpWk5OS2t2QXBCU2ZmMDI5bDQz?=
 =?utf-8?B?K1BZR25zb3RXMjdOVENDaWFiWis5VEZBczRZcjdVdVN1b3JjWUdTWUhzbHNI?=
 =?utf-8?B?cG9GTHZtQ0VPK0QzaW5ZbUJPY0ViOVF5ZHpZQVp6a3lJbVphRS9sQnhaYXl2?=
 =?utf-8?B?K05Nelp2TTVJMEhxcFBZWWtoUXNZZmt0cFFBL2gyeGdrN04rcGtFU1VicDZH?=
 =?utf-8?B?L3JJcldpT2lkUnpJRUQvTlNsTkx5aWVCSmI1bFo2MTNoYkJTMUJDS2ZRN0gv?=
 =?utf-8?B?ZWRXZmpTc0FmcGU3L1YwV2EySUFOdVh2bE1QVENrVlZHM1A4bWdiQWZtQmF2?=
 =?utf-8?B?YXBtQTFWRlRtWTBzVnhSMHpCb3llenZkbVRPNHQvRmNrSkJvNlhDckxCRDVE?=
 =?utf-8?B?b1RKU0s1L1I0b1QvZktuUi9rVlhiaE9NcVhmVDVZVy9HYmVPZkowdzFtTkp0?=
 =?utf-8?B?aXFBcnFhSFJpSlFnZzhFd1ArVktJcVUzRzB3dUlHbk1xV002alVDZTNxalNn?=
 =?utf-8?B?Ri9ORG8rNWtVdVZaUlJnRTVvZCtGY1FnYjhkbUk2R2owK3NOUTVYQWRwUjlv?=
 =?utf-8?B?WlRsZlVkalZGdk1HTmlkaUNvVGk2QnNCWjQyY1VMb0orRjdaZ3RDdlpnR2w2?=
 =?utf-8?B?a0hHS1VOeGpPRDFmMG9XNGNVSzdINUY3RkdyQzc3VlluZE0yQ1ZjN3Z3V0Ry?=
 =?utf-8?B?Q3Vja3laYUJDNC84WE81My9kTHFlRWpycmVvcUdnaFpXTVBiS01RTjRBVGwr?=
 =?utf-8?B?ZlJJM09uSnplZCtMeU1RWklBRjZ4dXk5cXBacFl4eWJ1NHpvZWcrYnBVbllV?=
 =?utf-8?B?SHViSTQ3dmYxWnIzZG9QT2VML254bmVGVjNGSVlONEN0ZVJFd1VDWDJYZDJI?=
 =?utf-8?B?YXgrY3d5Z2xCK2VadWVSbGY5VnZ5bFJDRnVLQUVPQXhpcUpOMDNUb2RWT3px?=
 =?utf-8?B?Mk94MkJDd0luTmd1VThCRVpaMC9iTHJxTWM5VkRoV1E1NHhiQXRBNGlRWk5K?=
 =?utf-8?B?dGdyWEVTODY3Ylc4T1pMaTRMWXdNS1JMVDFEZFlQQnlhTEo2dVRWbzRKelJL?=
 =?utf-8?B?TWNBNWNQdG1zd2pmWUdSVEZxRTFwQWhhbWthU0gyVWJJamxDVzJ4Q2xkMXhq?=
 =?utf-8?B?QVZoMUo5UHd5NGtqZ0dRY1pNZTR4dzl5MDVSQWJTODJ1eTUvTmdVOXJPVEI0?=
 =?utf-8?B?MGZJTEpIQ0Z1ZlplUkhwQnkrcnA0TmVhUzdGYmJIMnl0c1hBZ0VHdGN5bTZT?=
 =?utf-8?Q?cRRcfzUPl7GRYWs3xpvwtVjulZ22kyz7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR08MB10341.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0tnVWtpM2l6VmMrS1BnNGFDN0hOeld1Mkhjakt6WDZZclVXQWZTRWltUVFq?=
 =?utf-8?B?c0g4em5adUNmaXkxMXJ0czIrL0lLdmQwV2tSMDVUd1FFUVBMYWphU0k0a2xR?=
 =?utf-8?B?OU9EMzN3NDdIckxLU0J0U1BoSC95SVVhM0J6WGd6bkk3OURFcm96L2Rwb1FC?=
 =?utf-8?B?bnV3dVdHNkI0ak5BYlF2dkdnOFNPNmI4WlNka2dkeWFOaW4rZDZCTnYzQ21K?=
 =?utf-8?B?NDFFNk9zcWZYOS9MWmNOVFB3TVdlZWFjVWRBTlVpNWJUUE5kaXY5R0lSK0Nl?=
 =?utf-8?B?NlRnSXhGVFc0VTAvUjBjQ2x0MUd1UzN5QlUrR0U4bis1enQybEhuWHZ3TE8z?=
 =?utf-8?B?S2poZ2F1cEthT1ZXaGpSSk5qbzEzUVZYU3I0NkVwTHRhTUU2dlpFZ2RDQnZi?=
 =?utf-8?B?b3kzdGdYOHZFS2dEWFRHTk12dUI4TnZnWEkzNWJCTExZd01CMXFCZkNsSFdh?=
 =?utf-8?B?N01MRG4wYUgwMUV5S05nRzk2Q0k3N20wODhpdWpNY05EWitzcFg0QmF0Qnh4?=
 =?utf-8?B?clVDVFNha1VOUnZURUhsUFpsYU1PZENYSldCaWhod0ViS1JNaXhTQ2RpVitM?=
 =?utf-8?B?MVJCMzRTUkpxZmdESGRJbnMvTXp0NVpMTVFlbDk1K2wyNXlwVDUrVUdSTXVy?=
 =?utf-8?B?cHFiMG8wOEZxL2FCcVp1S0NYT21NUVd6UGI5bHVxcmw2WldJMEhWOEF6UE0v?=
 =?utf-8?B?ZFRwU0lVYUtlelNwQ1pMd29NeUhZUWpua01EelJIdnRZMEtOeEFoalh3amV2?=
 =?utf-8?B?YmNFdGJKYnF5MXdFanYwRjRmUElFWGZVOXAweEJyK0RoR3cvSzVlelF0RGpF?=
 =?utf-8?B?elN3YVlZU2dRSEIzVDVtdE5oUjFPU1BPMnRmSXZkZ2I4SnF6SThncWpvME1j?=
 =?utf-8?B?L0FyUThnT1M1alZpVzZpZTI1eUk5U29LYUg1UWJvNVhuS3Jwc2tSOFFYMmpq?=
 =?utf-8?B?Qno5MDRlUkN6K1R2SEpKWDFGY2pJbFhUYVdnbms4a1pzQjFnb0d1YndWSDJP?=
 =?utf-8?B?ZEpIMGxCM2xWdFF4bGQzZFdEamRVSmFnem1qTktvaTZ6U09ObCtRZXl4eS9M?=
 =?utf-8?B?UWlzRmFZR0tXRURNQWgyV0xBWisrR3laSDl0YTN6RDdveUR0U0dsaU1taExk?=
 =?utf-8?B?TGFqYU41VHNpaDlXUGNNaUhlUDFYb21mSUJYR2l6bU9UOEtINmFFM2FTY1J5?=
 =?utf-8?B?aTRSR0dmeU1qaWRXY3dZK2d1U052Ui9OQ09VOXo3RnVjZGQrbEJJaEo5NTBY?=
 =?utf-8?B?Z2p5YkRqdkhFcXlRc1RLWE9CY0tJSEx5TWI0NVg3eHNwaUFXaXNpQ3RRdFRh?=
 =?utf-8?B?aGtQQXplY1lsMlJvMFhHTXY3SWNWbDVKMnVxbUkvTHNzTlhjZzM4UHBtNWNJ?=
 =?utf-8?B?TXBRSGE0MnRBbGRacGRYMGdmQ2pGSlpieFZCREhxZFZoNFVkdE9nRjZwTEFE?=
 =?utf-8?B?cW1XcXVmd0dYaDBweUJzTDdaR3RzbGd6VWwzcDRURkhGaHBnVzB5Ky80U29z?=
 =?utf-8?B?TTBQdUpGUk5XRjAwVnhkQzlpa2IxUjhWWEcrK3BJNklHRWVBTHRXZklrRDNn?=
 =?utf-8?B?UVF5VFBBeVp0WU84dzBtRkFmRlkwc1hlQTI0cm00ejhiTElMV29KV3c2ZHF5?=
 =?utf-8?B?NkpTWjdEbnBWRHJnR1VFQ1FjOFJCVncrUjdWNXJKRVpNNmZyT214d3pyTk55?=
 =?utf-8?B?dnBZSXFPaUFzeEdpazUxdjVjSURHbUFhL2NKbGxPeG53WGVBRmlrUHpNUEFD?=
 =?utf-8?B?dGRSZUFDSGVkbVl2akpvMCs4NFJWeWV4dW5pSUlzS2ZiUDhUWTcxR2FqY2tS?=
 =?utf-8?B?dlZuOEs0eGdjNTZ4TmhFaGFUeDJkL2FkdmhLbHVyVGZCT0FjWVdJOTFHR1k4?=
 =?utf-8?B?TFVmei92R1haTVRUdmk1bGxvT1ZtWDFSQzhXMXAzamY5YVgvNjQzSXBqU0FM?=
 =?utf-8?B?bEdOVTBOZ0FIL2dyVktzSTNqVHFqdXJTSldtbXU3NTdOMTNUUmlkd3FEUWhn?=
 =?utf-8?B?WHkwSHMwWVV6azg1NlQxUTlwcXhnTDgxWk0rTGZmMGErM2xrU1J0TkpYYWdS?=
 =?utf-8?B?VExIY0RFdlZQOFhyczc5Nkswc3M5U3VXY1V5UHp1a3FPZHNUb3FGWEdTV1dw?=
 =?utf-8?B?WDN5S3hZVnJidThHTzZOdkNjZ2FkaHgvZHJnRDdDRWorVzhHcTNNbzZzZzI4?=
 =?utf-8?B?R0E9PQ==?=
X-OriginatorOrg: variscite.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffc13720-7fed-4333-f80a-08de342b5211
X-MS-Exchange-CrossTenant-AuthSource: DB4PR08MB10341.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 18:22:59.8953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 399ae6ac-38f4-4ef0-94a8-440b0ad581de
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d32p1YLP//d5O0JKxfAhQqILOeUJwhwVASKItFdNUp3tENVvopqIF4tk7+x0Xlr7Yz2HDaW6+DpP1icEn54BxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6712

This series adds support for several peripherals available on the
Variscite Symphony carrier board for the VAR-SOM-MX93 module.

The patches introduce:

- GPIO aliases cleanup to better expose available GPIOs
- FT5x06 capacitive touch controller
- USB1 (OTG, via PTN5150 Type-C controller) and USB2 (host-only) support
- LPSPI6 controller exposed on the expansion connector

These changes describe real hardware connections and make the exposed
interfaces available to user applications.

Tested on the Symphony board with a VAR-SOM-MX93.

Stefano Radaelli (4):
  arm64: dts: imx93-var-som-symphony: Update gpio aliases
  arm64: dts: imx93-var-som-symphony: Add support for ft5x06 touch
    controller
  arm64: dts: imx93-var-som-symphony: Add USB support
  arm64: dts: imx93-var-som-symphony: Enable LPSPI6 controller

 .../dts/freescale/imx93-var-som-symphony.dts  | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)


base-commit: 3f9f0252130e7dd60d41be0802bf58f6471c691d
-- 
2.47.3

