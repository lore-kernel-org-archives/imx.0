Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013071.outbound.protection.outlook.com [52.101.83.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7BF286A8
	for <imx@lists.linux.dev>; Thu, 12 Feb 2026 16:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770913212; cv=fail; b=uSpfDPEzI2+TiIKlPMRWKHFh8Y1l8LKTM5pyofVOtUhNCC2UOXXeAHitcQHyxGprX+0P4DaqCJJ/tjavkhgzygzbKK4712S1Qozv0pc9w5HjkRznifHuFNGRL577TWQi77W7uL+tI0ePAhf1N50I+MtQW+NdLMoJAuNdg8mwmVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770913212; c=relaxed/simple;
	bh=gXRz7jhXNrwW9GIuPhKNPueUOSDn6hF5UawU5fJTeXw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=H1N2I2v0sVS/7MlTIeUNU5JkPI/jyCLDIFKHM3ctUg8iEq/WvxebT+K0Mw60a7xivaRVTfawJu7NxuKvsJSnnIrNQd81WlhY1NnoVPbMivvFfbvlzPEy7bQQY0ryWerRCd4ii/O2dcbY4GbIEkOLIBrj111nuD7B0CPFN+dW0oQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=O7T8FVA9; arc=fail smtp.client-ip=52.101.83.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="O7T8FVA9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nCUesN3Cx1GciQvYqE6Q6ZWPKWMqL7+LrnkcK4MclJLTWpRNTwTdcQ7DFA1pm+IA/W67Mw8auGGeuuNceNow8IjWL8fI8XaWVy+C66LIjXnCVVqTV1IeQduaDKoNFNXvloNWzKjG249XvDvCFLmv3IAaG08M9GQBTfaSYa7ImjlrFSk0Jy7riI6x6h1oQ9JbnaNtDvl7MwSxg3UOybkZiCUMVAth8mOlkK3b3qhoIGiGzs+s/lttfviOUdx+MCXFTHLZFGgd5Ct+RaNh8724FI80RT8BnAZt8yKuPgcvGsCl4IucxshK/ykvRJgdaxCFSLsdKtILN0pWd0Y//KkUHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QNutKRIE9vW6LhVYjx1/M9M7A6sdEpgDIBVL6l/rzc=;
 b=U6cvCmpvrnahv+ILSLR3knjcRFIDOIph/V9p+Sr+8MO4DaMPlC+xryVriZrt0EkRZj3rYAV/pO5Mc06XE2nRpdOxxsk7pLfRmcRZ+WtZ48P5/0ZzgrgyL0y9DsI0ssRWtcQML0PYYhhyOSRxVNzKXnC1X6gDrHa5gcL1jPzaAtd8WEMyqDZBivIUAWnvmyzDAmoEUrSAdKFM7CPlO1ZuEKyLJResKkT2heB8F76unyBL0OprQS0m0e8xBjOGrzWKIKVK7T7TtoMhrJKTn/DkBSLYB0MQ8bsyqlFrp1Rmc8TX9Z4br2jKMMBiFRrTczVAMh12ygZo9QYUB9M19Pr/SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QNutKRIE9vW6LhVYjx1/M9M7A6sdEpgDIBVL6l/rzc=;
 b=O7T8FVA9e3trNbV1SdpiyOINIVV7Cv0hyiC+xN0mUrdY5VAymeSx9vxR1U6LSLll1F/Ow/5YMHg6rJh6/LsVgsUHtTl2RE/6WeXWTL+kstKku9F9wUnM1LCcnoBhlKLCS8MEAD3NqKiPx1egocVXzStq+a8sHsVmBPoOJmNW2ypyDVPWv21wtwtJAp3hvDSLXClYHoBvKzLPl5EWYWnLFA1X8tKkDjIC6AisjQ5yX0z040q/Q8CXGo7RqaS3j94SeVC+GJwtVuaAE5atFlZ8LaFdD9z+YHXXZBUcq6VxTXUnIJT4SkPRFoOpntSfOydi/l21o/1ytQN7tUHOCklXpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DB9PR04MB9704.eurprd04.prod.outlook.com (2603:10a6:10:303::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 16:20:08 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Thu, 12 Feb 2026
 16:20:08 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Thu, 12 Feb 2026 11:19:43 -0500
Subject: [PATCH 1/8] ARM: dts: imx23/28: set #size-cells of NAND controller
 to 0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260212-imx28_dtb_warning-v1-1-696bcf1a992a@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770913203; l=1585;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=gXRz7jhXNrwW9GIuPhKNPueUOSDn6hF5UawU5fJTeXw=;
 b=Qpcej+y8BhUtZbpFF1OdGDKFZ4VbWPOTsm5drwzW35BOzA5mazXV1R4zge9215jJagmqkmgEc
 0HJdKd/iQ8ZD6+0abAezli7eF49bgzioO1AUovbKhpWFQwcnAsK8F6m
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
X-MS-Office365-Filtering-Correlation-Id: 4550d6be-ca87-4f22-ffb8-08de6a5296a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TjhkQmgwMXBEYUZlZjhnOFpRS2hkSHBybzZZVDNvSDZJanRJMHFzV2pWUGdB?=
 =?utf-8?B?c3NFSk1CeERyd3hoTFlLZ0YzcHYwSlUwNnY4U1RKRHFhbzAyVU5CaThvNER3?=
 =?utf-8?B?SXpqM2RuK3VqR1VpSHBtZjhPUVlKMmJmWTBkeElPSk13Z20xQUtIY0w5d05X?=
 =?utf-8?B?L2tPSkUwWXlmZ0x1V0wyekt4NlJ6bXJKcjI3ZXRFZDZwUDBUcjIzTUJIM0xm?=
 =?utf-8?B?TWRneERxbnJvQzJOTW91bGhvSVpjMm1yTG9BdVcweTFkUWJLTk5PTG9NTG9U?=
 =?utf-8?B?ZVN6aE9VdHNXZW9YT21VbFVGUmE0UkgveGwzZFUvWnp6SlJZOXBZWERTU2JQ?=
 =?utf-8?B?TkV1L1d2VGRFUENRbkZIdG5VczhNdCtlRnN4czV3MUlnOFZzQlNHTXRZUU8v?=
 =?utf-8?B?MWZsc1ErcDcrbEZqbWc5NjM4V1VDaXlaY1k0d1FmNVgyR0REeU5iZ2EwaXJv?=
 =?utf-8?B?R2lGQm1iajJjT1JrM0doUlpRSmQ4dXlBS2dUQlR6N1FhQnJTNGJOenhxVDRt?=
 =?utf-8?B?WS9jeXpEbzI3TjBzeXoxV3NxK1R5UFFzdDArK29PaWsxTGVyNVYxei8xaThY?=
 =?utf-8?B?d2ZOdHpHWVRVMXg2RzRpUXBQbmVtc3JnNlh1c1VVQmVkcHNmcmxBckZGQkpW?=
 =?utf-8?B?TXVTVlRoYkJEMGRrdGtzQU82QzlyU1pDaldaQkJWeDNkb0VJa0s3M1Z2Ynk4?=
 =?utf-8?B?dWVrMEh2ckhLU0djeVlhSGdxRy9WMmIwY3VNa1N0OHZSY0grMlFONUorOElE?=
 =?utf-8?B?d3dTU3haOElEZXcrdVRSVy96MFRIbUF6dlZjNFg3Q2pWcnZrc29mQ2tXMDlV?=
 =?utf-8?B?NUY2Y2VFL1IxLzVkVFJSMDZ4VmxYZFhpQjFyK09iOTEvTnk2dXhJZmdNUitK?=
 =?utf-8?B?a2NGYkdaajFYSlBLdjIvK1N1cWxyV0VGYmdMRDVXRHRmSm9aUDB6TWNYUGN5?=
 =?utf-8?B?RjV0ZkdNNDBIN0srdXJaMVBGZE8yTjVkcVlpSTRsL3k0WmRRc2RNa2dIZW8z?=
 =?utf-8?B?SndqcVgyMW1ISWJCODVCdUZOSXo3Z1V3WlMxMFMzTElvVE95c0NDL3ZhM0JG?=
 =?utf-8?B?eHRQaGV6QWVVY0ZRTGNyU1hsQTFCQ3JjWjNvaWlBUC9yZUZyMGM2elhDekNJ?=
 =?utf-8?B?MGNaVlg1Q2t1eVVhemhrUGxiRHpiKzdBWnpmRzhOaHJMUU16OENCMk1tNDda?=
 =?utf-8?B?SkIrR3cvdnNoSGpmVXFwNk5wYnJHbTA0WlBLOURyZ2J0RTZ4RXNBbUtQeWlp?=
 =?utf-8?B?blp1aTZrTjBpTGlBR0FMSUpSWkdZTis0cTAzU1VFM0gxbVZIcXVQOStJYVZv?=
 =?utf-8?B?TVpBclJoTCs5bk9SVnRmajhGdmorc3k3bEFGSWQ1WWhsVmtWVDU1TlFqaCs2?=
 =?utf-8?B?ekpQSkZON2U4ZWhhZzhFMkd1WmVrMURnMUdEaloxM0M1eC9GOUloMk9mRVF3?=
 =?utf-8?B?cVZRN3hOTFZ1QXV4VWIwRDl4V1ovcDdFZTR3NGNHaENUWHdQbERqQXFXU2dB?=
 =?utf-8?B?OStYejRqV3BKL2JMRU5BZDNzNUo1dG96cVlPZWJSWU1icW51WDJVUUt6dmNa?=
 =?utf-8?B?STcwNmlHRzV6b0d1SXNVM1VmcW9HZ0JVcUthcEN3eEt2cDB2NTVQTXk1WUFs?=
 =?utf-8?B?VG9xSUFRUDFtWW45aXRkVVBJRXV2SmhhTC8vWWJVYjBCSGo0dG9wTThjUDdW?=
 =?utf-8?B?dFd6ZmtycWZxd29mNTQ4Z1FKR0ZGT1lRZENwZ25SNkhsOEh3MG12NkFmc0ho?=
 =?utf-8?B?alBmUVp1THJ6QXE2dElyM0RzdTNPeUpwTVVQQVJTb1pDRXpEdnhtZUVVWExL?=
 =?utf-8?B?RFBOYWg0QWhEY1NNQXk4bmhjODBZc1NZNW9nc1BKdlBJc3ExVXVEaVdIRVJM?=
 =?utf-8?B?WFVrK3lrcEpPUkxTa3JRNnpKZjllRzVZU2NXUjhGejZjTEgyNEFXNTFMamZ3?=
 =?utf-8?B?RkpVaUp3Qnl1UUw3a3R6cjBvQ2VFREZEN1pmMXB4RVVlNVVvT3NHZDNpVFpi?=
 =?utf-8?B?TDRSWVpXZU9DR0pwOUdwU1R5Q0xCUTdzK2o0ZDJENWc5d2dycUNwQXBlR3Z6?=
 =?utf-8?B?OEFkT2FRdmNiMWpOMjE1dWRiQTlsbStmMlFrMHIvMS9QMk9jZVJDcHNGUldN?=
 =?utf-8?B?R1MvRTdKZDJLTVl4RmJIVVROcmF0OGc3bTFoUDB0VXh6WE1hOThoZWpPZjFU?=
 =?utf-8?Q?/OnE1H2IaDonz7VCkvFfCdY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?elo2RXpCQ1ZvMTJaTDJBWEg3N3g0YnlJMDdkRElPQ3RySit0L0Zyc0pGTDl3?=
 =?utf-8?B?WDRNQTlFUGFRZitOQUx3KzkvZ3JhZW5YQXpCaVU1TnEwbVJFUGxIdjY4Z3lK?=
 =?utf-8?B?T3NMbWhkSlFoWkxvZlVLYU8rWW1pRVJMSnUwNTJNbEtZeWVaL0F0b1QxSWox?=
 =?utf-8?B?Q2s3YWYzNk5YZS93NzZIdjJsZEVsQU13Q09BNXVnMGYvNGlKdWdNZ3BOU3hE?=
 =?utf-8?B?bHdCWFV0UFZRTTFWbk92WGhGak5iTFdsY2c3RU1wT21Cb2pHQ3BsT1psWGlY?=
 =?utf-8?B?ZHpkUyt1QUtQdGxYN09lMU1wMVhBVHp2N21ra3p2bXh3SXNoMTcxNUtZZEx0?=
 =?utf-8?B?eldoUG9PN2c5TTkvbkk2U3F4aHpOOVRsK0VaQWxxTEx3Sk4wL0JPODN2bXE5?=
 =?utf-8?B?ampzbThDejdPd2hiUTcwd3grL2RhWGx5R052cW1BdHk1Z0l5a3JqTndyTnRq?=
 =?utf-8?B?SVpnM2tBUnZUODg0VENXVHp1THErK0Y5MGU1c3l2VFV0RlU5U2o0NjJZVEI1?=
 =?utf-8?B?MWJKQkNxUWJ5NFA4OVNvWkc2UCtxTTlvbEk2MFVjVEtodFlHWlN4L1VZWDJp?=
 =?utf-8?B?bGhhMlRCUjlnRGw4WDJmZnc3dlN0WURha2F4anJ1VGVMaTRQQlM3RDNkVm1m?=
 =?utf-8?B?WEd4ekErcnk5VFI5MjNGUVRxSUJEU25NV3BKWXlVaEdtZU9vZkpFOVR4RkRV?=
 =?utf-8?B?bGlzL0tUR1gzTTREV2ErT1YrM3dHakF5bm1sS3l2dlJBbHp5aU1zV3VSNU5S?=
 =?utf-8?B?WS9uZ0NDeXlneHU3KytiNFZvTCt4OThpTm5vVDNWWHRnVVlVc2F1cVg2TENO?=
 =?utf-8?B?RG44SFBDOWJqTmlKSk43L2tEb2tpLys0ZHVyZDF0SEg4WHBOWnlHcUJJaVFt?=
 =?utf-8?B?SVg0UlFWaFh2M01VOTR5NWlBaGxSVGhiZ2ozeW9zdFhUdXhiWERKblhqdGVL?=
 =?utf-8?B?blFPNkRJQ2lvUTNTaUdNajIyeHltSGVHTWI3R081d3NleVBwcEdUWVdhYmYx?=
 =?utf-8?B?VktuVS9ybzFwK1lKclFmb3pzOG9FaUI4bDlydG4yT2luc0JXZmRtVWJ1OGt4?=
 =?utf-8?B?QmtpYlVCZ05GdEhLc2tqM1lvTzlVTHR0VFNXcTNJejIybXdMRXpka3JrSGhy?=
 =?utf-8?B?L0RIZ2ppR2NSbDhteHJlb0NUOGlaTFA3RkYyUXdoSGpVUSt1RXh4anhBYSts?=
 =?utf-8?B?bFg2dTJjL2tyNUhZZTVFdG4yTU5zWCtDcHBvK0oydjhEWm1HQ1U5MkgzZmRV?=
 =?utf-8?B?dGIvUk95ZUpQWEloZ2Y0ME1BNXY4bjJmRDk3VEZpZnNSVGRyM2VjdERpVkNB?=
 =?utf-8?B?d3FJNHNIUUJQdkE5czFjQVhOUEo1K0pjK1owVDNZQkltK29kZytDVXJEQkNN?=
 =?utf-8?B?clI4ZXRYcjlVVEVkM0RvaHdKRVV1L1ZFN1NuTjNPRktIYVhpK3JvNkluWlJE?=
 =?utf-8?B?ZU42VEZrb0E1TW1pbmFRMWxGNXZaY1EzQy9yWE1yWkRnVjlYazc5ZnhRWkNr?=
 =?utf-8?B?eDlxMzhjVWhVcmNRTGpNRU1vVWpqeEU2WTVtRVczblI2NXNaaWZtQ244Mi8w?=
 =?utf-8?B?UUNiSzZxVUNpU0R4WDNZckdOZVE3VlJqTDloNm43R1RMRklLTWszeEdpT2Rq?=
 =?utf-8?B?REhGOWlKbE1FNzFXYkpWTHJvTHdKeXQxcVJBQ3BoMUdDb3BZbk9YN2MwVG0y?=
 =?utf-8?B?bmhvSDBrdkp6RStVWitDTlIxenkyQVB0NTRMK25SN3dPbkZ1ZnljV1RzVC95?=
 =?utf-8?B?L25GcUlPS0lLbnBuRzlFaEJ4aDJmUHRzN2hOZUxKYUdRWUsvVjVjVFM5UzZ1?=
 =?utf-8?B?ekl3U2RPbHVCK2Y0ZHBZV1dmaklCZjhiNHNoUm55cUR5a3Z6eGNIelV5bmVt?=
 =?utf-8?B?M24yc1hVU3pQNGNRTWMzSEVCSXdJVmVXbytFeFcxQ1AvemlPcXJ1UVZXTFRG?=
 =?utf-8?B?YmhrWlg1cm5SMmtNVDd0R1NwcXJKcWNPdXY3YVRpSXM1M0RTNlMvS1VTMlk1?=
 =?utf-8?B?WWllRzhLTDBVcW5CUWwwZXFZdEtLMkhFZU1sUm5qcU1INU80bmZ6QXNYaytw?=
 =?utf-8?B?YUQ2ZmorZmVqY2NpS3pvR0xLc3VBRnIvRHJ6OTJsNkxTYWphQUlzWElkdE9M?=
 =?utf-8?B?TnlBZnp6NmhsZ3JBbCs2RTZBU1JtdVFvVGtvSGh5TksrQVJFT1BYRXAxUWlL?=
 =?utf-8?B?UVpKc2lBaGZrcisxb0lsQlNlby9oOThiM0hFaW81Sit0ekRSMjd2UU4weUpP?=
 =?utf-8?B?YUdhQ1JXVURZT1l1bTNaYWJMZGlpUU03emZJUkV1WW1pR0lOdVBQL3FOTjQr?=
 =?utf-8?Q?LE/p+mGNUHMnFfFoo8?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4550d6be-ca87-4f22-ffb8-08de6a5296a3
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 16:20:08.3088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bEQNPR1B5coHiXyYEpyCbzeYoekaCcSviEifT0KAtH4SvUs05Bbj4tqyJ+SDrjjMMPDUTRViyjFKqOOCEHrQHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9704

Set #size-cells of the nand-controller node to 0 to fix CHECK_DTBS
warnings.
arch/arm/boot/dts/nxp/mxs/imx28-apf28.dtb: nand-controller@8000c000 (fsl,imx28-gpmi-nand): #size-cells: 0 was expected

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/mxs/imx23.dtsi | 2 +-
 arch/arm/boot/dts/nxp/mxs/imx28.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx23.dtsi b/arch/arm/boot/dts/nxp/mxs/imx23.dtsi
index 5e21252fb7c96965a627db7dd90f53889c72af30..368ba94d8a20b2f2c240dfbfc053985c19f4b643 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx23.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx23.dtsi
@@ -77,7 +77,7 @@ ecc@80008000 {
 			nand-controller@8000c000 {
 				compatible = "fsl,imx23-gpmi-nand";
 				#address-cells = <1>;
-				#size-cells = <1>;
+				#size-cells = <0>;
 				reg = <0x8000c000 0x2000>, <0x8000a000 0x2000>;
 				reg-names = "gpmi-nand", "bch";
 				interrupts = <56>;
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
index ece46d0e7c7fcd7d36e1a3beb96d36c6c4d594da..281a0249a0e1d7bd84d6db82f89e780238899ff2 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
@@ -99,7 +99,7 @@ perfmon: perfmon@80006000 {
 			gpmi: nand-controller@8000c000 {
 				compatible = "fsl,imx28-gpmi-nand";
 				#address-cells = <1>;
-				#size-cells = <1>;
+				#size-cells = <0>;
 				reg = <0x8000c000 0x2000>, <0x8000a000 0x2000>;
 				reg-names = "gpmi-nand", "bch";
 				interrupts = <41>;

-- 
2.43.0

