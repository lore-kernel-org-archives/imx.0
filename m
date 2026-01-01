Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11021139.outbound.protection.outlook.com [40.107.130.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D4523D7DB
	for <imx@lists.linux.dev>; Thu,  1 Jan 2026 15:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.139
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767279968; cv=fail; b=VIhC++MDdpKle6A9VmjsREM1Lf9cS5FzGf7gKzbWcJLOhnGkFQMPyyKlC27K0gI+iOYS623vUO5SrsEb8VcXCtaLxllbniBGBkiJPUvJawRVxatUTts2lfXi8Z702Vv1badOwLOl2FwPhC52gWfsT1Z1JubzzQyYarkgNzOjqeo=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767279968; c=relaxed/simple;
	bh=vBLIA7bA+eUHo+nyMDJuAcInX0koLSwqukRJKePI5TI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kgqp+YmyUZa60RXX6dQfbbToNH3DmaRM0XCMwRQh36xWO7YIY1UEY7p/gtWTZ2R7mEuAyY/6vUHh/S69y0ajf2shU7497ua4FcKg5CsNoXCu/nWd3Wc7RO2uv00k4m6cFv/7wKxs9E11UbDe7xYdHOgEwrRI8bkCTptuoA4lCns=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=Ihjlc4Rb; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=Ihjlc4Rb; arc=fail smtp.client-ip=40.107.130.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="Ihjlc4Rb";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="Ihjlc4Rb"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=pNfkwGj6d75WPYzIDoTUtoSY616H2i0BKIODjT8ghNe1oblieURky1GRZhst2DOOojORO8mxxriqbB84NNbozit3B+z0lg9nKeQnO5awFif5m/3sdpY+PLnvlBcblBRiVC6PAMbKJhwirefqUg+D99KRTvV7tlnjZPutGtjC3qJ5nnKB+0B2qfwxipWUbSFN9l8jiL67b4fBsaPUtBPvULQPUemVni05hnuOm45N0VK7UA8uIPlyli1ETDe+BkFejQUEj3x531BB4ziTX5z8JLu8WYECuRYujvv/UIKz4sUZLRn+KIsoNRHfmm0+xISAOlns0D+fmcZMyV/vhNABPw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcBzeqs7Y8H/5HRrqPvs5I8vFp/xrRxNiW8xLg3SQL0=;
 b=G69G5YCBx4D5Y6+LKmNVSqTdFlHJKqLo3ZbXAaiDoUw1AhZlk6OVcewiFWLd/TqlHNKtAGO3tD8K7S/0+NzW3ZOoXNaVgEkaAe7JRjASr+rjU4E+tWXUvRMnLhLG2LorSDcX9sPGBnmjD+wj73YbYj9hm5py51Tzg4mRR+QuXY5FOa0Tp+2LA3H143EOP8638i+2PlJRfx2jRzHBygvY6aPmRJ5q/QcpZ/Qctsh2lVAMMAfU0IvpTbHQFSx4f3wTwfs8IwnGNCdP1RHl/y4BQYLqIAxHBhFw/4XoCtYP9+yUM7B3ZBfr1r8waJG/nyvU/wnEWhOkeDkV8BL7QFitCw==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcBzeqs7Y8H/5HRrqPvs5I8vFp/xrRxNiW8xLg3SQL0=;
 b=Ihjlc4Rb48v6LaESZajJ8M+IL5+agUIoe8Hpv+iIBzfOYey00oIQUr3IIs9QzO2fd3ZfU68i0yiEv85Rrj/5+dJgj0BtUuMHs1EMXMm0t8yvwMB9IVGMYAB6iF5DuM1b00BQtec5N9sGB5rxraZRucbtraUOvspR6VJozVOiaos=
Received: from DU6P191CA0048.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::7) by
 AM9PR04MB8083.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 1 Jan
 2026 15:06:03 +0000
Received: from DB5PEPF00014B9E.eurprd02.prod.outlook.com
 (2603:10a6:10:53f:cafe::94) by DU6P191CA0048.outlook.office365.com
 (2603:10a6:10:53f::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Thu, 1
 Jan 2026 15:06:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB5PEPF00014B9E.mail.protection.outlook.com (10.167.8.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1
 via Frontend Transport; Thu, 1 Jan 2026 15:06:03 +0000
Received: from emails-6274464-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-24.eu-west-1.compute.internal [10.20.5.24])
	by mta-outgoing-dlp-862-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 3A2B58014E;
	Thu,  1 Jan 2026 15:06:03 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1767279963; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=UcBzeqs7Y8H/5HRrqPvs5I8vFp/xrRxNiW8xLg3SQL0=;
 b=KVVMoo8f2Uc9jpV3ih4IAttIzf9kNkSBXR8dc7UsXJbDLV5u55wbp1i5VMQedbw4swmZE
 e4FyBqsT8gG1c9+LVO/dVTOzRG5KDWf+iA1kbWEjSQZuVgnByHVCWactQLMbvWdieOAhxEA
 58wuiDGjYSQOasxgdI+vwApodFBb3NU=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1767279963;
 b=CLPjMkGmE7pnkgzB8ZeowsdUSWAOZnc9fONV7SIXtwYI9ZzoiBVpewSymG2g4tGMMvony
 ipyTJxvI0N7ckTKOWFZPGWL9Efzj1YKIvYtpDxdC9dgGKhEvtJKzrW1vGnao8EXr/RWQY/F
 142p7JvsK5/0HqsL+X7oTUfQnaOtCI0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gszS4oOCb4VGVAli8uk2HXtwyklz5JB/4bqfOdu4Pw6xsQpcTs6g4lJyOterTuMTGCVmeEFd6pQ5p5t09U6W+zJYFIDhNJxfUqDZxGc3KDR3Ci8SuxIcOZc/CADvf8/0+C4mhNEVLrU/JvLSHlU4r08Gke4xxnCRpE1ECBEx7RW6Mlhgl0/2QUxoXIxh1zG0WxFLmbG2MlBZSPZh9T8vs3TLOuJrfGDbyaf843EXvWYv1leDFnV7+AoP0Po/2RDxNoW4wS7kQYH1K2v0rGO6ywi3ZbOSiCmNSke3qAkqt/s1M/VWXfAWUoQGGoJFMqEV3KNA3cOVBYC7nu84H/H+vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcBzeqs7Y8H/5HRrqPvs5I8vFp/xrRxNiW8xLg3SQL0=;
 b=fNdfXgtEXsRBF75gDU8w2fi+EELmuFrzoe+BNlE70iZt/4Udj4iZ2BPeDLZ/vO9rSOK0gDz2aag/gslSv1DTw0X+mLqkv5ULRB6lrjjfA+D6zXVn98t9R3nrLj60uPx4QFvElqJ71mhvvLiTG/iZIauZlBdjmOBLYe86wVTCDykjoZ9lmxYm/tAgU9t6Qv0N/hVYYwaLlfAfKVs5NF4wMseV3H/lhdapBXfCP3q7BOSM+JsRb1QITTSILRkpmVLDCz31ewpb4C+uqn6tNY1hlFb/UqiNb5iAWgppB3v4w6PngDYPdXHDBDeiMzSAG+thtIHnz6415q8jb0U1NdDEeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcBzeqs7Y8H/5HRrqPvs5I8vFp/xrRxNiW8xLg3SQL0=;
 b=Ihjlc4Rb48v6LaESZajJ8M+IL5+agUIoe8Hpv+iIBzfOYey00oIQUr3IIs9QzO2fd3ZfU68i0yiEv85Rrj/5+dJgj0BtUuMHs1EMXMm0t8yvwMB9IVGMYAB6iF5DuM1b00BQtec5N9sGB5rxraZRucbtraUOvspR6VJozVOiaos=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PA4PR04MB7664.eurprd04.prod.outlook.com (2603:10a6:102:f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 1 Jan
 2026 15:05:52 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9456.013; Thu, 1 Jan 2026
 15:05:52 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Thu, 01 Jan 2026 17:05:42 +0200
Subject: [PATCH v5 2/7] arm64: dts: imx8mp-hummingboard-pulse/cubox-m: fix
 vmmc gpio polarity
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-imx8mp-hb-iiot-v5-2-b369b2e0c07f@solid-run.com>
References: <20260101-imx8mp-hb-iiot-v5-0-b369b2e0c07f@solid-run.com>
In-Reply-To: <20260101-imx8mp-hb-iiot-v5-0-b369b2e0c07f@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: TL2P290CA0003.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::20) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|PA4PR04MB7664:EE_|DB5PEPF00014B9E:EE_|AM9PR04MB8083:EE_
X-MS-Office365-Filtering-Correlation-Id: 11e9d22a-ad91-4eef-3129-08de49474816
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?K1NsUHpod1RXeHFkYlNDR2N6cW5ockJQMTRsUnVZRXl0MldqRzVBSlNEOFZZ?=
 =?utf-8?B?by9hblAwdWxQQ2pocEZYaDlYZUUrMnlSWWRJRkhuNktkaE9QQUp2NGtxdlg0?=
 =?utf-8?B?aDJkN2g2WWUyZ1NXc1ovUTc4bVgrdkx2ME9oM2g0cnFDRVF6R3pHY29QanRo?=
 =?utf-8?B?a2VLWWNoNzBCcTdaWjhWb1dacURFamxZRTNTbWFqbHRhTDcwOGkzeFI4MGlB?=
 =?utf-8?B?dXp4cXV5c0tiRVczNGN3WXBpTWNiSjF3Yys2M05FOHd2dE1reVhpUWFkMlU2?=
 =?utf-8?B?ekxYWFZRRXNrTG5DbjdjL0VvK2xsQmFsbE50aTdWNkxLcnVSQytDNk1TMjAv?=
 =?utf-8?B?akZZWEFzd3VZbUJuZWpuZndMSVZVRFNkVzUxclJjZDhLdkNtMTdJYUdVOWF2?=
 =?utf-8?B?OVk3YUVIK1Q0cWJaU2FSU051WDdvYU9UYVBzdUJYZVVYNzRoM1hjekMyQWdk?=
 =?utf-8?B?K1BaQzVBMEs0eUhkK21EL0w1RFIvSzZKajJVQ2FxUDF3elFhNHllWUJvcEZu?=
 =?utf-8?B?S0k0UTE5ZzVscEJFcXg5YUVrVjkyOXVERW4zVnB0eGVLczNjaXBoV0tQTnZY?=
 =?utf-8?B?VlNjQ1hmOEh2SC9mQ2tzUmx0dE5uQ0ZIOS9udStjWlZVK1RiMHpxQ3BWZkNv?=
 =?utf-8?B?VHJ4MzBrR0ozKzRWM0tGRS9RQjJadTI3RGptckxuN0NHeFRiM3lONE5RRHM4?=
 =?utf-8?B?Q0ROd0pTYklvSFk3NTdUUWJ1aGE4WEEvU0FqbisvcVZKT1R1b2J5OFZ5eGRB?=
 =?utf-8?B?a24vVENrUVBsOCtvOElweWJKc2VmTy9FaTRyU2kwOU0zQzlURDF0MmIzRklP?=
 =?utf-8?B?VnJadzc5U2IxZDY2Sy9qTndnZ2thYU1MNk4wS0gwUGlHSjdnUGtqNGxNckZ4?=
 =?utf-8?B?cFNOS21uS3NoQ3pnTHdXVlhZSU0zeWFpU1JmL0ZRQkdSeU84NUpoUzZIcTBB?=
 =?utf-8?B?MmUrQjlxYzU1WktjaUNDd0dFZ1VWVXZqN0ZZd2J1OFJJN1Jwd3UrQU5GQXFy?=
 =?utf-8?B?dXMrVUFISW5TdkQ1ZU1KTWZSVnRnWkRrSjNKcFBNWWVtbk82M3VlTC9IbFYx?=
 =?utf-8?B?dXA5OUpYR2ppbi9leWtOZnExWWdBNmZ1ejlnUFVXSzNGTDQvVDBvdHQ2Y2Z4?=
 =?utf-8?B?em9zbmNqcmZKSHc2U3lCSzdZT09YUEs2b09LMzBHc1hrQ25EWm12dTdsdVcz?=
 =?utf-8?B?YjFralArY0pERlpXN2VwbGJ6ZFFmKzlEVEt4QkE5ZzI4YjJHdFYremVrUnAr?=
 =?utf-8?B?RHh4bjZxUitSNHFWbG8yanFSUFY4WlcxdytBcjFKTmNOVEp5UTM4cmdqQXBT?=
 =?utf-8?B?U0dUWTk5ZjJQSjVHdDBqWkFtNXJPMVJ5bHpRNnpldS9GOEFzR05Va3RHU2cv?=
 =?utf-8?B?YkR0bXdpR3lCbFBvWERSM0RBcWRpTFRZL01qTDlUdE5xTDBpRDl3dGxEL2lC?=
 =?utf-8?B?NFdoeU9XK0VHOUFvMUo1b1UrblQ1bWxNcFltL3dsa2oyRCtUZjJRQVZKaTds?=
 =?utf-8?B?M2hSYjBFeURaWlZGM092WmhZalNxMGVJM3pOcnM0bk52WXdYUUFiV0d6Ni9K?=
 =?utf-8?B?MW1BdGcxczAzVjhIUWlBZGVpdG84R1psMGNyMndWcjdRbTRqZFY2a3B1b1la?=
 =?utf-8?B?QXN4dTVoWmNNUVNMdDJ2NithTnJ4NXBhaFRLSzJiWVVrdW5TRlhHcDl0VVA0?=
 =?utf-8?B?Y3MzSXUvQXJuMk03S1lRQlpLNHJMSkdPOHBhOHVrNURGWkk5QmY4dnRZemNJ?=
 =?utf-8?B?aXAwRGgzWncvN1IrSTF3Mk9zMGx1Y2tvSkVWQU1zZHg2Zk56MFFaQ0ZXUkxz?=
 =?utf-8?B?VFZiMkZ6OE9zMVlNWlIxWmlLby80Ukh6QkhZNFIySVl0SmNoMWQwcXVRaXBK?=
 =?utf-8?B?NEFvTkVZWkhXMWxRTFVGVzFzU0lJOFJkT2VoNzI5ZytOREhadVV2bnVLaXh5?=
 =?utf-8?B?STd0aWlhNHdrclo3eFRPdk9QZnpFRE1xVkdtNTVPVzBPMTg1QzJMQk02NGhM?=
 =?utf-8?B?cGdVeFhXUzlxOTBiQ2VtL3NISC9WTXc5SGtwYmx6K0tqVUhSVU5HZmEvRFRy?=
 =?utf-8?Q?yIpZPX?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7664
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: ffd7da35645a4c468d2bbcf1057ccf7b:solidrun,office365_emails,sent,inline:113452bdee034aaec32088b4b1e9092b
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4a8fdeb3-9f4c-4e8a-f83c-08de4947415b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|1800799024|14060799003|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R0E5TXFjN2VxUWpSTGRvL1hyTjJZb0pibWdnYkNzRFF2TnB6dmYwYTV3eTFx?=
 =?utf-8?B?WENMUnNGSWVUVE9mZDUxYlR2R0JjcnJJN2pXUDludnY1aFVoandCVGVDd3Jq?=
 =?utf-8?B?RFgvUFNrT2JkWEgzV0l1T3Y4aVhoVVJIOVJHVGtZb1laSzZnVUxKM3BHalB4?=
 =?utf-8?B?eWJJb0t6eWYraUQxNWlPRm95UEJ5bWV4eFZ6ZU5kVTFQWjVycURrRVhkRjJ0?=
 =?utf-8?B?YkFnUkFoaHpmRkdMNzN5Sm4xR2JHS1ltT0cwUnVSZGJmdlpJK1ZhVVpUc2h5?=
 =?utf-8?B?bS9JWlpkbXQ2eFhYb2hBVzQxRXNCK0NqY1pob054QTZUUEhBTzd0YnpFQnBB?=
 =?utf-8?B?Zmt6ZGo3aFJFZG1TRnNLMjh6aVNrZ0M1WGlaVXhhRDZLQ2E2bXI5ZVpTSHBs?=
 =?utf-8?B?ck5MNUU5Z2ZnQmcvdVhYS3FnZGJDaDdudzlLa3JVeUNaZEpHbjhMWUJEUUhl?=
 =?utf-8?B?Z0VsWVlBNTdVVzNrUGtZSnl6Rmh4VFRQNUJTVVZVYXQzMmdXVmlMYWZCUU82?=
 =?utf-8?B?cTZlMlZ4VHhUWHhwUU0zMGhRUlZwVTNTWGRZRDJ6dW95cGFGdldJOUFrM01v?=
 =?utf-8?B?dkVONTRpMHNNcldFcHlodFd6WkdvMVBKWlg4b3Z3djkrN2RpaDZBNU1VeFl3?=
 =?utf-8?B?ME4zVnRwRTdXZEZtQXhIT3ZBdmN2RFVXODJoeGpOTnVFZTAxS2RhRFArS2dW?=
 =?utf-8?B?Y3NQWmUzK1lsTldmZFYzSVZZZzZpcWlET1V1Y1k5TzZzRTFhanBXT2dzdkcv?=
 =?utf-8?B?T0lqVW4yQnBTaUJrOXRUZmFiT3N1NkFjWnRQU3NZSHNQajRUdG9aUmV5QkpZ?=
 =?utf-8?B?NkVrTUN1d1YvS01VcG05d0pZazA3VTA3QlIva1VBME9iQWtNLzIzTUd0aUk1?=
 =?utf-8?B?TTNDTHU2THZjdFpJbmIySXg1ZjBHSFdPWVBaU3Z0azVMZC82VW9BcjBCVmFq?=
 =?utf-8?B?MkRjZGMzL2E5eHBxcTREc0Zqc1ZqYkdXZXo3cXNmcU1jVmx4cFgrKzJmVGlP?=
 =?utf-8?B?cm5RdTMrRXZlWjVvc1ByNVpyY1krbWkzdzRtdWxtVUNTQ01EV2VkZGE5VWNX?=
 =?utf-8?B?QnAydVI1U2lkUTBoV2ltTVVoUVdBU3NBbG4wMk0vTitWcDNaUGlBMjN4dEly?=
 =?utf-8?B?Yy8ydlJOTTFKY0xtWSsyaXBjdERmcFBDeGVpTHl6UTAwRDZ3dVVzcndQb3pa?=
 =?utf-8?B?Z0JNeWNtUGNsZ0lMSU1tNHVuL2dENmdBSnU1djBadFNmenA3a0VvVFAva1BV?=
 =?utf-8?B?Yy92ZThJa0h1d3dFWUxvVUVaV3l3NU5jVzJkc2hFUkZtaXluN3JUNUtDZk5Z?=
 =?utf-8?B?ajZ1Y0JsNUlBanVYbzFoQTJyWi9FR2R6UjlZTitsSUhobk01ZjBGaEZMb2Y5?=
 =?utf-8?B?L2EycWcveEptTHJvT24rRFJmSEFtZE5aZ0h2WmdlaCtUN3BpVkVMT3RDbGlT?=
 =?utf-8?B?T01HUEM0WklJZUhuZHZWWm9tNDZFVEFZUFlKU1loc0xyR2lBOUVjdFgyVm5X?=
 =?utf-8?B?Q1NWMG5YODV0d2xRMGZVOVR3TFdzd0t6SkdzMlBuSGhMMGx1L0F4bHUwM09W?=
 =?utf-8?B?bDYzalRIcG03THcxejNDbEJuUWhCcUZzUE5tNTFrcDJ1V296RzFOTnFTNnBQ?=
 =?utf-8?B?OWFUbTR3TXZwNFBQVVhLa3lwRUU0eTJ5eTFFZXRxRERUelBoRTU3SHRPcUl0?=
 =?utf-8?B?UkRVTjFGcEU4akQ2bVI3OGNtdzVUSy8ydUlualBnYkVYWGlra1JwVnNaSmdD?=
 =?utf-8?B?c3ZncnRJWlZuaUF4K0FMS1BaeHdrd29wcTgvbkQ3ek53N0lyajZsZzJaamZ0?=
 =?utf-8?B?Y29OTDVtaW1QRDhKQ1pteVZjL2o1K0FPakJZdlFPSGxaSStIcUVsM0hKK2tv?=
 =?utf-8?B?Ukk0NkJyTWNTMU5JY3EyRGJyMlFCNWxpdzFJeVBlWDNrVEJxMStFM3pxR2s2?=
 =?utf-8?B?OTV6cTBrbGpTM1J1SS9MMmVaQzgyeGI2dmVhSW12ZGliNFJFcnJRMFhxVEVi?=
 =?utf-8?B?Tm96RlYrdlZZMHFDbmcvN1dnYWgrNWRmTEppd0N5MXNGNTJ1czdoMWlFQmEr?=
 =?utf-8?B?dTNsV2RrN09hVXc1bGY1dkFaVWF5TWZpbndSakEwREw5OGxCZGlqY2lmT1F3?=
 =?utf-8?Q?aLck=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(1800799024)(14060799003)(82310400026)(35042699022);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2026 15:06:03.3691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11e9d22a-ad91-4eef-3129-08de49474816
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8083

Fix the polarity in vmmc regulator node for the gpio from active-high to
active-low. This is a cosmetic change as regulator default to active-low
unless property enable-active-high was also specified - ignoring the
flag on gpio handle.

Fixes: a009c0c66ecb ("arm64: dts: add description for solidrun imx8mp som and cubox-m")
Fixes: 2a222aa2bee9 ("arm64: dts: add description for solidrun imx8mp hummingboard variants")
Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts                    | 2 +-
 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts b/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts
index 8290f187b79f..7bc213499f09 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-cubox-m.dts
@@ -68,7 +68,7 @@ vmmc: regulator-mmc {
 		regulator-name = "vmmc";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_LOW>;
 		startup-delay-us = <250>;
 	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi
index 825ad6a2ba14..5b8c8489713c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-common.dtsi
@@ -73,7 +73,7 @@ vmmc: regulator-mmc {
 		regulator-name = "vmmc";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
-		gpio = <&gpio2 19 GPIO_ACTIVE_HIGH>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_LOW>;
 		startup-delay-us = <250>;
 	};
 

-- 
2.43.0


