Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020102.outbound.protection.outlook.com [52.101.69.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF8632ED43
	for <imx@lists.linux.dev>; Sun, 18 Jan 2026 12:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.102
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768740731; cv=fail; b=TY1Dzc6+mKzCkyHPFndjVSNtqEcbLtr/WGrKmauom9aRFsFhkzOW0CcWEisH2AdX2zN6A2MA3+BfUHzgGxPA/+kNVPqhEH2MTpatPyw5WDu6Uif24hxtRej1AseUIOUIOyMrsl3tDxBjErGeRrPMvB9WJg/keO6dvdKRee4Mgl4=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768740731; c=relaxed/simple;
	bh=ZGlC6XXFizzMWPY9bDcG9B4gqGn4BZt6eSwrU/WcspI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hHDH9U7NZwqmB6Yw7sdTJQbMBWlErGZPcxjX/omSHeQINFdw2hmad5RuCejvaaiilfAowKPhbr0SnGW9ri3qFNJXVgve0m8w/JxeGelV5NBK7P9qoGjsCG0jK1Z6UUMWyJwOtsDcExCAoF/lNU1pgQMIKhxW9K1Zp8cETgbT3xQ=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=AQewmXWi; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=AQewmXWi; arc=fail smtp.client-ip=52.101.69.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="AQewmXWi";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="AQewmXWi"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=IJFtcyBBnkAZf84XfovQFzKRbpfIaqGuyTXtk5beMgZ0Vp17oK1TBGTeZKDbNJWpQ8kDImsurKZXXX9JCjg/zJ0lKfRYZWwwQDWBpebegFE3t1USGw/iCHQejxql4n99/KTnnlvYKMEIP96nZtFBK4RNRFvOkTnj9PG+sYFhkYU2lVWUoW7X136DWB2Xi4OHR4llY4BSy+gAIUznV+KiVeksw9Fzb682f454EBYT6DT8VFLcIxNKy+wBVYDMznnyxFecJ41afv9pWkPor/65+kpxNsimBByTdoY5TRDI8uto0gNEKVzYQnFHcSAqlmo777vmv3i+DBJH1hOb6EQazw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FftODfhFhGCIaDalvwgpGTXsMyI+prYkgg6JDG8wJs8=;
 b=n97LFLvoTPD02tCgjNBsF0pqxlaQL+MEmCdgKz6GXb2BqlmscQ9nvuoAGYHC54r8GHmXzY/EErcRh8H3SLS0I6EVcxit4gj4oxJUbMNBcFwqhYRxkBXXvET/7PgizfpNfmjZwrqdBr0VQwCssEsbN7HTTLvJyFs7xIqg7LckVFhtMLqRzAC6OnYEkIdvmQ/tObubmHBSwdd07fXJZFeVcG2tjKC5kv/qxLUnsGX0DmiNWn26bjzGHznkckXWc2msUVqKIhJ0BY59yKq4FyDgXWyyGgBNtwRM2++pNxYmlvN1kT4aL40rH1qYCbbqjmiE8E1Ic+gZKkJrOy0e6s4/FQ==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FftODfhFhGCIaDalvwgpGTXsMyI+prYkgg6JDG8wJs8=;
 b=AQewmXWiIYAIyQEdI87cRuVv+2quG7fuXDvt+LoZvKzpvTRwHwx/QM7mD/iykMUdtOMPJY2rr58cwAVWe59NFrF6vXN+BFj9ew6P14FJqxzTNFd8RkjNvQ6R95adb0pZdPM56gN6RXx0aA4YhDMpbFqW9o0P4yTbrdxK9TRZed0=
Received: from AM0PR05CA0083.eurprd05.prod.outlook.com (2603:10a6:208:136::23)
 by DU2PR04MB8632.eurprd04.prod.outlook.com (2603:10a6:10:2df::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Sun, 18 Jan
 2026 12:52:04 +0000
Received: from AMS0EPF000001B5.eurprd05.prod.outlook.com
 (2603:10a6:208:136:cafe::1c) by AM0PR05CA0083.outlook.office365.com
 (2603:10a6:208:136::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.10 via Frontend Transport; Sun,
 18 Jan 2026 12:52:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF000001B5.mail.protection.outlook.com (10.167.16.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4
 via Frontend Transport; Sun, 18 Jan 2026 12:52:04 +0000
Received: from emails-2206837-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-10.eu-west-1.compute.internal [10.20.6.10])
	by mta-outgoing-dlp-141-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id BF1C080169;
	Sun, 18 Jan 2026 12:52:03 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1768740723; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=FftODfhFhGCIaDalvwgpGTXsMyI+prYkgg6JDG8wJs8=;
 b=P/C9V08Ez7ZpwzksT6tSssZsMKqHI7Jm+iTqFWX6RvdOsoLDOkuttcyuURTdGIY7OqvRk
 pfwdphArkCyZf/cx/b3s8kR7u48AWQ9U3MIKECKnorpLzaB6CR9uDjoCOf3a4t3im4nlY68
 U0XERajyGGhmPPt9QnnNLa1/k1ta9m8=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1768740723;
 b=dylYBAsStvUjZzT03fYHeoc8r0Hl/oOXTVtIccA1HvsqJJss52a+MwWRhOZ3959m+rb8l
 O2QDnVrFoURTv8/6m5pTVd48uteYyP3b3fpilWkIfmVKmc4BQ+epjTtpfYonP7CjfAm8Ag1
 rQrg7v7emjIrujaWbXVCnIe2epVrxtc=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=McmyJskKaMArmOvQjEEqYNnZGVznqxYQbl0FX2xQXG3K5/UPkbetYjgmygzCRoiF0QfVi+VjCGsZiJ13sJWNJ0aIhbLzfkOwwHwdXSfsvcZm1AQwVBKIMbrPCJsZ+71tFFZB/tgGtTgBn55ec5HsIsSlLjkWxwwcut6F7MH/Hv52eZ78CCJFfU19mrTK+GSEM3OVTfujZVgIoAD1T0vC7eQFwkd2u0yIjvo+VmQIWZDKA54vo4NjoPB0eygpf8HULUwwEDVbYr7POwMcNlukKZxDIGM7hvuiBZliMCm2TWwFwAtgkRGf0MzS34ANSM3Tigy3OMnbIDBFSBarfCmtPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FftODfhFhGCIaDalvwgpGTXsMyI+prYkgg6JDG8wJs8=;
 b=SfnsQ9gpGwcA9ooDKF2+eSYuhqTVXvquNzo0L1lEpblPTKLGcdsVXc0oRyNg0+RV0BNOZXwUx1VT1sb2pQFfobRakZB/eVreK7di6BNltiYma8ymdxGS/Xkfe1YpBOJ6Wke4h0sGI7q+9AazOv0nVxnTpF1gq+CupGGmVhK2kbECGL3RWU7shgPhnsdWikCaSWhZzYsd+nBh3BWyG6ChH2stgCGb7k9tzoa2EOYvcLeTXK/wRxb5u4VQ9qYDR3FNMUqp92mcCxo2/CuNFQWLoj2ywT/EQ8wp9HtpowNx/2PZRg4UZQxXAJtCu1N8VDjcPNzZlDsi0NpRqyx5QLMCgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FftODfhFhGCIaDalvwgpGTXsMyI+prYkgg6JDG8wJs8=;
 b=AQewmXWiIYAIyQEdI87cRuVv+2quG7fuXDvt+LoZvKzpvTRwHwx/QM7mD/iykMUdtOMPJY2rr58cwAVWe59NFrF6vXN+BFj9ew6P14FJqxzTNFd8RkjNvQ6R95adb0pZdPM56gN6RXx0aA4YhDMpbFqW9o0P4yTbrdxK9TRZed0=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by DB9PR04MB11694.eurprd04.prod.outlook.com (2603:10a6:10:60f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Sun, 18 Jan
 2026 12:51:51 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9520.005; Sun, 18 Jan 2026
 12:51:51 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 18 Jan 2026 14:51:45 +0200
Subject: [PATCH v7 8/8] arm64: dts: add description for solidrun i.mx8mm
 som and evb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260118-imx8mp-hb-iiot-v7-8-ef1176119a8e@solid-run.com>
References: <20260118-imx8mp-hb-iiot-v7-0-ef1176119a8e@solid-run.com>
In-Reply-To: <20260118-imx8mp-hb-iiot-v7-0-ef1176119a8e@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: TLZP290CA0009.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::18) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|DB9PR04MB11694:EE_|AMS0EPF000001B5:EE_|DU2PR04MB8632:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cfbd575-cb04-498a-1b44-08de56906150
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?NVVPMnlUS2N5MWI2REJvS0l4MXZRWW9taUtMYlJHR0puRHlaS1FUTkc3SE9y?=
 =?utf-8?B?WnRWWHV5ZXovTzl1MzQxOHRwdVVFZWhpYUJ5OEtFMHlSQ3JkRkRkcEsyY3Yv?=
 =?utf-8?B?Q0E4NGpSRHpXR25nK2ptMEs0VGlkbVZWK25vcytsVndHT2sySDlqeHFBWTY4?=
 =?utf-8?B?WEpMUEtQV1NJVk9qMlg0SlRTUFB6V3NtWXFjVTNQSkZqdzgwR0pTVXA0ZVdX?=
 =?utf-8?B?Ryt2N3c4S0tDbUh2bzFkeUhSNXpxSjJFZ0I2bzFsSzY0ekVJL1p6QzVFbjVB?=
 =?utf-8?B?QUczZlZIRXhqNnFqSEt2N0ZxY040MnJ1Ym9zbG9tdTdHWVNNYkVNMHptKzJw?=
 =?utf-8?B?dktFMVFoRW1nSndudU9IbXc5Y0tZS3dBUkxRWktpU1AvWEJ2V3lBVDEzUXdM?=
 =?utf-8?B?Nmx4RDJrZkJLd1dvUXFla3k5eWtNU3BFb05EZTBLNENoc0NEU1MzcnhuV2xv?=
 =?utf-8?B?bXV1Wml0a3FNMWxZS3R2emxIejhZL3VtYkFCcGlCZDdoVEluRGhXY0s4WnJt?=
 =?utf-8?B?WVFIR1ArenI2Z1RJUTNYSk10aEV0ejJIYzF4SXlyUHBpUVNIRE9wMHYxcGNQ?=
 =?utf-8?B?a2RVL3dOWkZyS2Z6RzRtOUdETjAzREVuamUvTTFyTUNSVjlOUWt3UjVjTW16?=
 =?utf-8?B?Uy9lSC9qRXhoZ2U1QWFDTXJTelo4WGZOME13QVJUWXZSd3dsQUxoRjdCcWhz?=
 =?utf-8?B?NkFCdnlSbHd3NSs3WEtrVzl6YVA5U0JsN0VLK05wK2l2NFhYYlFuNWhTbDhL?=
 =?utf-8?B?dTA1M2Z1bFZ1SjdteFRpalNBSTNuc3l0bEJBWjlnYVNoRmVCQTI2M2MreEhR?=
 =?utf-8?B?UTY1SFczTjJSTWkvQTI4b2tWclRkTmJPSWdRVk9JSVpldzZQWXUrM3JHTzk5?=
 =?utf-8?B?RnNVNWZYeGl6aVZ5dDAyQjNlOUVWM2IxSi9hTHhBOU42MUJaL1dMZlBQeVlF?=
 =?utf-8?B?cVlEK2ZkSkNnZDBtYnJMU2FSbG1WRERxMmNFYUcvZkszQmM1dzlwdEV5b24y?=
 =?utf-8?B?TDY5Q3A4RE02aGVmQVBCbXBtSkhCeFZKMXlFNGtDc0dkVDlVcG9CTktkMTJD?=
 =?utf-8?B?dEVVbXFCcVJ0RDdVWHpaeFJSdFBlR3lIYkJ6R1RCTFp3TWdQSy9iSjJIaEFO?=
 =?utf-8?B?ZkoxaFVrcW1PYnl0RFVoaDJZa3BJbVNHT3Nxc2huN1pEM3o5REJZVUlkN1Nn?=
 =?utf-8?B?RWphZUlDanBGRkpOVnFPQnNvK1FhY25naVh5ZmFLcUlBSkFDbDJLc3pNWThj?=
 =?utf-8?B?eG85VUZyVCt1NnBpeVZSemFEV0wwUG1vRW9sdm5VTmVQR3ZFS3NvbjRCcWto?=
 =?utf-8?B?QjIvRHdnVkUrLzYyYmY4NVk4SUV3ajRGbUtxRG1QTkpMVW81WnJsNzRuUDBO?=
 =?utf-8?B?dkJINVZZMzNUUWZ0R1czSVFLWEJ3ODRYT0FjQ3dYRG9iNEhCWlhKVU41aEZ0?=
 =?utf-8?B?UVA4azZiRW5XeGNjdlQySlJlUnFhaHoxY3lqRzcxemVJeFFrYmdkcnZhTWts?=
 =?utf-8?B?SzBhemhUay8wRFZsNDBZemI1MVlRdGxNQVdJWjhxaXhGRW5oWm1vbSthT3No?=
 =?utf-8?B?UDdHNnovTDNJRWhkbDAwaGc0bjdsTktCTUo3cXYwUFVEb1Y2V3BxSXpsODNi?=
 =?utf-8?B?TmE0NlVFODFUQ0lDN1N1aHNxaS9vMnlCMWlIbk5UN010cXR5NldnN01TTmZJ?=
 =?utf-8?B?VkRBYkhQSjJlTEp0SlpJRHdCQ1Zxb0hzWHEvZWhTVHBhc0VhOTZGeEFtVlA5?=
 =?utf-8?B?MXZTMGYwcTJzZ2pBU0x4NEJPakZUSnlEWVNLUE03dnVFdUJKdW1uTk1KYzA2?=
 =?utf-8?B?UWs1WVBlRVJjSFZFSWZWbXNqVjRoZ3Nidkx0czZjR3VZT3YwWnliWnRhZ1VI?=
 =?utf-8?B?aUpKWDBDdmFrQjNvUE5LUlJHYXMvcEhEWWxYZXVLOC9GbkFiZGp2Y0ZvSVpS?=
 =?utf-8?B?MWVzbGNBS0I2OWRrQlR5UXQrRTF2UXRueVRNWkxTT3FuWHdrcmxXSXg0aFpR?=
 =?utf-8?B?WUxCSUhtcWxEVWkzdFNWOUlQUURwZlNzNkNvWkU2Zi9mSjhMRkNIT2ZLNTh6?=
 =?utf-8?B?UlZUM3RvZjRsSDNRbG5qaERRaXBRTVg3RVFvaHdJMHJuenc4TFhOZ1BEenV0?=
 =?utf-8?B?U2p3MEpzUERQYXo3cTFRN3dIcUQyNk1yME1CWUNVa2NqU3R1enAxLzBKV3lQ?=
 =?utf-8?Q?eOuEsSpRBUaIbNzboZe61iE=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11694
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 233de13e64024907b92192c0e449c022:solidrun,office365_emails,sent,inline:df4c9036803ce3ce0c6c60d122810ee5
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8bded111-1ab2-47a0-5e46-08de569059f1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|1800799024|7416014|36860700013|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NXlsL1BZNmxJaVRJMjVva1pCRFF4cmpCU2tHNlZ6TTU1MzdEUFBPaVNEdjBq?=
 =?utf-8?B?OVRpblcvQjJwak04S2RKTXo3VlVwdVFlUkd0SjFVSzU4RlJnQ3pWbkl4YS9i?=
 =?utf-8?B?Lzk3VFhtaDRWSEVUM1ZXaytLVFpYNzVlazJqa1lzczJnbEdSb0NrMWdQVENx?=
 =?utf-8?B?TU1jOGc1YjFHSnFpMGxpKzg2bmkrSFpPb3FYTGRiVXU3bkNTd2lIUThmOU5k?=
 =?utf-8?B?WU5YanBxRzYzdmxBZzFTdVN0Umxlb00yOEhvaHZvTTl1akJxeHd3cHdPNVVU?=
 =?utf-8?B?UHRPR2QwM25JNjl5alB4SkdBbVVKZTYzQ3p0czdpalVHWjZCZ1l1SVN3a0NG?=
 =?utf-8?B?K1dVb2cwMEM5Yk54VjNNbEs3WThCNnlVTm9GNDllRmNhTXVaME9sU2ZTT1lS?=
 =?utf-8?B?MXFxS1k4a0M3QUdrZnF5Z2pGcUlWUkRxcGNyQVQzaFArSnE0bDJ1SzBMakl0?=
 =?utf-8?B?ODdUTkhVRzAwSTI4d3Y4NThXa1ZaRlN0Sll4TEJBSk5EQWtVcEVxMHA2eHdN?=
 =?utf-8?B?V1dGRXpla1BBSFFybVFtakp2cm1VZ1BCWTlkeThaYUlEc2FOV2R3RkI4TWpr?=
 =?utf-8?B?TzNKeW84ZjRHdE9wTXRLdDFHNzFEOUkvSytuY2hUUVFLVmZ1a3I1U3M3NnlD?=
 =?utf-8?B?YXJ3SEJOVGhzbzl5MkxGTmNkK3ozdVg3VWdiQlhsSHZFbzhDbXRIRmxyVytr?=
 =?utf-8?B?YnZkMjVkUHhTeW9WWE5TNFppMExaZmlhRVc5T1B4bm5JNGpDVEFhdXM2eVNr?=
 =?utf-8?B?cDd0UXpyVGFtNGp2bnprYzg3UmkrSTdIMmUyTWxjMEY3REVXcWVqaGpTellm?=
 =?utf-8?B?b3J2ZnZKM0hZMllwR25Ea0Z4UEJLRklrRXJ5S2ZNUExxOEV3cXVtOXQ4NGhs?=
 =?utf-8?B?T3JTaVJ0RG1oSTA5eXJRbGJLa1UzN1pIZjNlL3hYcUFuOGpBTmpOYU1nZE1K?=
 =?utf-8?B?RDlCMDArMUMxWUd4UmVIelhINnlHT2w2dlg4TkIrclJ5WXNFN2lVbWJyT2Nk?=
 =?utf-8?B?cmtCbkxqT0VnZDFKTEw4Y2xaV05QUVg1cmVScUk2S05MMGpYV3VtdkxHZHFQ?=
 =?utf-8?B?eU96R3cxTmVPc3FIK1g2TWxaRG1Qd0hSb0VZNXlHbGRVOW92Y0dVYUd2K2xx?=
 =?utf-8?B?Q1p4U2dUSXZYbGt4dlkwcHhvUTk4d0dhK0tLb0NkRjRGMitoVWkyUTM1SkFI?=
 =?utf-8?B?amJkNm1uSnNuNll4K0EvQ0VoK3Zad0ZnN0cvL0piWGtZanh2WlVBSmdNb1BQ?=
 =?utf-8?B?UG8wQ0VheW5NVmRVeHpmekJWYm16eG1zYzZMb0l4UXY0NnIvMzBzRk5zd3B4?=
 =?utf-8?B?Yyt6R1RTRzFXa1ptZ1dxZHhvV1lUamR2cGpkTUlvSWZkWGk0QmFJVEVCRkFS?=
 =?utf-8?B?TG5FS05ROXZjWEdVM3NZdXlDWFlqdVVtcGE0Q0NyVFI3K25jVVVOeEV3TkJy?=
 =?utf-8?B?cXBnYWFER3NkeWdnZkZ4OWR1Q2d5L1B6K29pK0lxVUJtQXE3Ym01WFdnMkJk?=
 =?utf-8?B?Zm81Y2dSVmJNQzJ5UXlLWTRRcWN4cVorY2hpbU51K3hxbkIxV1cyN1h0VTYx?=
 =?utf-8?B?amNQN2tqR2tld0VNSVBjSERxdDdidUE0d0o3Z2VwSktGeTZ0bENkQUhGUGxa?=
 =?utf-8?B?cFZkcXVibU9SbXlwNWtrMkZpWkM2NDBLd0UxM3hTUU9pMjIzamEremdWZEkv?=
 =?utf-8?B?TjNuSnZJZEg2eHAwWjVxMWU4cEg2UElvNVdGT2FnKzZyVmRlWVo4QXNOVi84?=
 =?utf-8?B?WjdIbEhwY1F4LzBnTTJ1RGFlcXF0c1pwZ2l2bCtSSjNXREdVbUdrSytqKzJ4?=
 =?utf-8?B?RVkxSHYrOXcvNVNVRjlZTTcxRnZvUUpwNU5TM3FzdzBmbk94eUc0WW5ZK2hF?=
 =?utf-8?B?OTVmamZEZHFNdlJYZjhLcStZWkpCZThYMmlnRm5hcm5JU0ZWN2JPMzBnSGUx?=
 =?utf-8?B?VGNUMWY3N0dJMW9SZFdBQis3Mkp4OENrNXQ1RVBRdk1pZTNCQ2hpOWFHWEo2?=
 =?utf-8?B?Qm1lWk9vaTAwWmRVaC84aitENCtUYkZCUDhBd1VjcHE5RGV6QnlVUHJ5aE5H?=
 =?utf-8?B?VkhxU0RSa2hDWCt2NnBwWlJ1OFBsV0lYQzd2elBmUTZYZkF3YWE4ZEVZZXI0?=
 =?utf-8?B?S0FiR1hzemZ3WUQxZGRIZW4ySEJvellsVGcySzc2cWdyOTNpK282M1lPTHBO?=
 =?utf-8?B?bllncytxdVd2TTVZQlpmQmRBR2kzRGVBdWx1OW1jY3ZZTTUyR2k5SUtycTFB?=
 =?utf-8?B?dWJ0b0pZd2JTZTNFdUxKY2Q0UGdRPT0=?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(1800799024)(7416014)(36860700013)(82310400026)(35042699022);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2026 12:52:04.0088
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cfbd575-cb04-498a-1b44-08de56906150
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8632

Add description for the SolidRun i.MX8M Mini SoM on HummingBoard Ripple.

The SoM features:
- 1Gbps Ethernet with PHY
- eMMC
- 1/2GB DDR
- NPU (assembly option)
- WiFi + Bluetooth

The HummingBoard Ripple features:
- 2x USB-2.0 Type-A connector
- 1Gbps RJ45 Ethernet with PoE
- microSD connector
- microHDMI connector
- mpcie connector with USB-2.0 interface + SIM card holder
- microUSB connector for console (using fdtdi chip)
- RTC with backup battery

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../dts/freescale/imx8mm-hummingboard-ripple.dts   | 335 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi   | 393 +++++++++++++++++++++
 3 files changed, 730 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index ff74f3046a45..340c65af5b03 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -124,6 +124,8 @@ imx8mm-evk-pcie-ep-dtbs += imx8mm-evk.dtb imx-pcie0-ep.dtbo
 imx8mm-evkb-pcie-ep-dtbs += imx8mm-evkb.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-evk-pcie-ep.dtb imx8mm-evkb-pcie-ep.dtb
 
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-hummingboard-ripple.dtb
+DTC_FLAGS_imx8mm-hummingboard-ripple += -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-icore-mx8mm-ctouch2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-icore-mx8mm-edimm2.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-iot-gateway.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-hummingboard-ripple.dts b/arch/arm64/boot/dts/freescale/imx8mm-hummingboard-ripple.dts
new file mode 100644
index 000000000000..e304b838a474
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-hummingboard-ripple.dts
@@ -0,0 +1,335 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+
+#include "imx8mm-sr-som.dtsi"
+
+/ {
+	model = "SolidRun i.MX8MM HummingBoard Ripple";
+	compatible = "solidrun,imx8mm-hummingboard-ripple",
+		     "solidrun,imx8mm-sr-som", "fsl,imx8mm";
+
+	aliases {
+		rtc0 = &carrier_rtc;
+		rtc1 = &snvs_rtc;
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "c";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&adv7535_out>;
+			};
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_pins>;
+
+		led-0 {
+			label = "D30";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio5 29 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		led-1 {
+			label = "D31";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		led-2 {
+			label = "D32";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio5 8 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		led-3 {
+			label = "D33";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio5 7 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		led-4 {
+			label = "D34";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio5 6 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+	};
+
+	rfkill-mpcie-wifi {
+		compatible = "rfkill-gpio";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pcie_rfkill_pins>;
+		label = "mpcie WiFi";
+		radio-type = "wlan";
+		/* rfkill-gpio inverts internally */
+		shutdown-gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>;
+	};
+
+	vmmc: regulator-mmc {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&vmmc_pins>;
+		regulator-name = "vmmc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_LOW>;
+		startup-delay-us = <250>;
+	};
+
+	vbus1: regulator-vbus-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus1";
+		gpio = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vbus1_pins>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	vbus2: regulator-vbus-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus2";
+		gpio = <&gpio4 21 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vbus2_pins>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	v_1_2: regulator-1-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+	};
+};
+
+&i2c3 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pins>;
+	status = "okay";
+
+	hdmi@3d {
+		compatible = "adi,adv7535";
+		reg = <0x3d>, <0x3f>, <0x3c>, <0x38>;
+		reg-names = "main", "edid", "cec", "packet";
+		adi,dsi-lanes = <4>;
+		avdd-supply = <&v_1_8>;
+		dvdd-supply = <&v_1_8>;
+		pvdd-supply = <&v_1_8>;
+		a2vdd-supply = <&v_1_8>;
+		v3p3-supply = <&v_3_3>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&hdmi_pins>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <7 IRQ_TYPE_EDGE_FALLING>;
+		pd-gpios = <&gpio3 22 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				adv7535_from_dsim: endpoint {
+					remote-endpoint = <&mipi_dsi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				adv7535_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+
+	carrier_eeprom: eeprom@57{
+		compatible = "st,24c02", "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+
+	carrier_rtc: rtc@69 {
+		compatible = "abracon,ab1805";
+		reg = <0x69>;
+		abracon,tc-diode = "schottky";
+		abracon,tc-resistor = <3>;
+	};
+};
+
+&iomuxc {
+	hdmi_pins: pinctrl-hdmi-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO07_GPIO1_IO7	0x0
+			MX8MM_IOMUXC_SAI5_RXD1_GPIO3_IO22	0x0
+		>;
+	};
+
+	i2c3_pins: pinctrl-i2c3-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C3_SCL_I2C3_SCL		0x400001c3
+			MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA		0x400001c3
+		>;
+	};
+
+	led_pins: pinctrl-led-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART4_TXD_GPIO5_IO29	0x0
+			MX8MM_IOMUXC_ECSPI1_SS0_GPIO5_IO9	0x0
+			MX8MM_IOMUXC_ECSPI1_MISO_GPIO5_IO8	0x0
+			MX8MM_IOMUXC_ECSPI1_MOSI_GPIO5_IO7	0x0
+			MX8MM_IOMUXC_ECSPI1_SCLK_GPIO5_IO6	0x0
+		>;
+	};
+
+	pcie_rfkill_pins: pinctrl-pcie-rfkill-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_WP_GPIO2_IO20		0x0
+		>;
+	};
+
+	usb_hub_pins: pinctrl-usb-hub-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI3_RXD_GPIO4_IO30	0x0
+		>;
+	};
+
+	usdhc2_pins: pinctrl-usdhc2-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x190
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d0
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d0
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d0
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d0
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d0
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
+			MX8MM_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
+		>;
+	};
+
+	usdhc2_100mhz_pins: pinctrl-usdhc2-100mhz-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d4
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d4
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d4
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d4
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
+			MX8MM_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
+		>;
+	};
+
+	usdhc2_200mhz_pins: pinctrl-usdhc2-100mhz-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d6
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d6
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d6
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d6
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
+			MX8MM_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
+		>;
+	};
+
+	vbus1_pins: pinctrl-vbus-1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD1_STROBE_GPIO2_IO11	0x20
+		>;
+	};
+
+	vbus2_pins: pinctrl-vbus-2-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI2_RXFS_GPIO4_IO21	0x20
+		>;
+	};
+
+	vmmc_pins: pinctrl-vmmc-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x41
+		>;
+	};
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&mipi_dsi {
+	samsung,esc-clock-frequency = <10000000>;
+	status = "okay";
+};
+
+&mipi_dsi_out {
+	remote-endpoint = <&adv7535_from_dsim>;
+};
+
+&usbotg1 {
+	dr_mode = "host";
+	vbus-supply = <&vbus2>;
+	status = "okay";
+};
+
+&usbotg2 {
+	status = "okay";
+	dr_mode = "host";
+	vbus-supply = <&vbus1>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb_hub_pins>;
+
+	hub_2_0: hub@1 {
+		compatible = "usb4b4,6502", "usb4b4,6506";
+		reg = <1>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&v_1_2>;
+		vdd2-supply = <&v_3_3>;
+	};
+
+	/* this device is not visible because host supports 2.0 only */
+	hub_3_0: hub@2 {
+		compatible = "usb4b4,6500", "usb4b4,6504";
+		reg = <2>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&v_1_2>;
+		vdd2-supply = <&v_3_3>;
+	};
+};
+
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&usdhc2_pins>;
+	pinctrl-1 = <&usdhc2_100mhz_pins>;
+	pinctrl-2 = <&usdhc2_200mhz_pins>;
+	vmmc-supply = <&vmmc>;
+	bus-width = <4>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi
new file mode 100644
index 000000000000..7c8a840686a3
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi
@@ -0,0 +1,393 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+#include <dt-bindings/phy/phy-imx8-pcie.h>
+
+#include "imx8mm.dtsi"
+
+/ {
+	model = "SolidRun i.MX8MM SoM";
+	compatible = "solidrun,imx8mm-sr-som", "fsl,imx8mm";
+
+	chosen {
+		bootargs = "earlycon=ec_imx6q,0x30890000,115200";
+		stdout-path = &uart2;
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x0 0x40000000 0 0x80000000>;
+	};
+
+	usdhc1_pwrseq: usdhc1-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+	};
+
+	v_1_8: regulator-1-8 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	v_3_3: regulator-3-3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+};
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&fec1_pins>;
+	phy-mode = "rgmii-id";
+	phy = <&phy0>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy0: ethernet-phy@4 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0x4>;
+			reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
+			phy-reset-duration = <10>;
+			qca,smarteee-tw-us-1g = <24>;
+			vddio-supply = <&vddio>;
+
+			vddio: vddio-regulator {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+		};
+	};
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+	status = "okay";
+
+	pmic@4b {
+		compatible = "rohm,bd71847";
+		reg = <0x4b>;
+		pinctrl-0 = <&pmic_pins>;
+		pinctrl-names = "default";
+		interrupt-parent = <&gpio1>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+		rohm,reset-snvs-powered;
+		#clock-cells = <0>;
+		clocks = <&osc_32k>;
+		clock-output-names = "clk-32k-out";
+
+		regulators {
+			buck1_reg: BUCK1 {
+				regulator-name = "buck1";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <1250>;
+			};
+
+			buck2_reg: BUCK2 {
+				regulator-name = "buck2";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <1250>;
+				rohm,dvs-run-voltage = <1000000>;
+				rohm,dvs-idle-voltage = <900000>;
+			};
+
+			buck3_reg: BUCK3 {
+				// BUCK5 in datasheet
+				regulator-name = "buck3";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck4_reg: BUCK4 {
+				// BUCK6 in datasheet
+				regulator-name = "buck4";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck5_reg: BUCK5 {
+				// BUCK7 in datasheet
+				regulator-name = "buck5";
+				regulator-min-microvolt = <1605000>;
+				regulator-max-microvolt = <1995000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck6_reg: BUCK6 {
+				// BUCK8 in datasheet
+				regulator-name = "buck6";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo1_reg: LDO1 {
+				regulator-name = "ldo1";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo2_reg: LDO2 {
+				regulator-name = "ldo2";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <900000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo3_reg: LDO3 {
+				regulator-name = "ldo3";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo4_reg: LDO4 {
+				regulator-name = "ldo4";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo6_reg: LDO6 {
+				regulator-name = "ldo6";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+
+	som_eeprom: eeprom@50{
+		compatible = "st,24c01", "atmel,24c01";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
+&iomuxc {
+	fec1_pins: pinctrl-fec1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_ENET_MDC_ENET1_MDC			0x3
+			MX8MM_IOMUXC_ENET_MDIO_ENET1_MDIO		0x3
+			MX8MM_IOMUXC_ENET_TD3_ENET1_RGMII_TD3		0x1f
+			MX8MM_IOMUXC_ENET_TD2_ENET1_RGMII_TD2		0x1f
+			MX8MM_IOMUXC_ENET_TD1_ENET1_RGMII_TD1		0x1f
+			MX8MM_IOMUXC_ENET_TD0_ENET1_RGMII_TD0		0x1f
+			MX8MM_IOMUXC_ENET_RD3_ENET1_RGMII_RD3		0x91
+			MX8MM_IOMUXC_ENET_RD2_ENET1_RGMII_RD2		0x91
+			MX8MM_IOMUXC_ENET_RD1_ENET1_RGMII_RD1		0x91
+			MX8MM_IOMUXC_ENET_RD0_ENET1_RGMII_RD0		0x91
+			MX8MM_IOMUXC_ENET_TXC_ENET1_RGMII_TXC		0x1f
+			MX8MM_IOMUXC_ENET_RXC_ENET1_RGMII_RXC		0x91
+			MX8MM_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x91
+			MX8MM_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x1f
+			MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22		0x19
+		>;
+	};
+
+	i2c1_pins: pinctrl-i2c1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C1_SCL_I2C1_SCL			0x400001c3
+			MX8MM_IOMUXC_I2C1_SDA_I2C1_SDA			0x400001c3
+		>;
+	};
+
+	pcie_pins: pinctrl-pcie-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO15_GPIO1_IO15		0x0
+		>;
+	};
+
+	pmic_pins: pinctrl-pmic-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x140
+		>;
+	};
+
+	uart1_pins: pinctrl-uart1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART1_RXD_UART1_DCE_RX	0x140
+			MX8MM_IOMUXC_UART1_TXD_UART1_DCE_TX	0x140
+			MX8MM_IOMUXC_UART3_RXD_UART1_DCE_CTS_B	0x140
+			MX8MM_IOMUXC_UART3_TXD_UART1_DCE_RTS_B	0x140
+			/* BT_REG_ON */
+			MX8MM_IOMUXC_SD1_DATA4_GPIO2_IO6	0x0
+			/* BT_WAKE_DEV */
+			MX8MM_IOMUXC_SD1_DATA5_GPIO2_IO7	0x0
+			/* BT_WAKE_HOST */
+			MX8MM_IOMUXC_SD1_DATA6_GPIO2_IO8	0x100
+		>;
+	};
+
+	uart2_pins: pinctrl-uart2-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART2_RXD_UART2_DCE_RX		0x140
+			MX8MM_IOMUXC_UART2_TXD_UART2_DCE_TX		0x140
+		>;
+	};
+
+	usdhc1_pins: pinctrl-usdhc1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK			0x190
+			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD			0x1d0
+			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0		0x1d0
+			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1		0x1d0
+			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2		0x1d0
+			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3		0x1d0
+			/* wifi refclk */
+			MX8MM_IOMUXC_GPIO1_IO00_ANAMIX_REF_CLK_32K	0x0
+			/* WL_REG_ON */
+			MX8MM_IOMUXC_SD1_RESET_B_GPIO2_IO10		0x0
+			/* WL_WAKE_HOST */
+			MX8MM_IOMUXC_SD1_DATA7_GPIO2_IO9		0x100
+		>;
+	};
+
+	usdhc3_pins: pinctrl-usdhc3-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x190
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d0
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d0
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d0
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d0
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d0
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d0
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d0
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d0
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d0
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x190
+		>;
+	};
+
+	usdhc3_100mhz_pins: pinctrl-usdhc3-100mhz-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x194
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d4
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d4
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d4
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d4
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d4
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d4
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d4
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d4
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d4
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x194
+		>;
+	};
+
+	usdhc3_200mhz_pins: pinctrl-usdhc3-200mhz-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x196
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d6
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d6
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d6
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d6
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d6
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d6
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d6
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d6
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d6
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x196
+		>;
+	};
+
+	wdog1_pins: pinctrl-wdog1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B	0x140
+		>;
+	};
+};
+
+&pcie_phy {
+	fsl,clkreq-unsupported;
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_OUTPUT>;
+	status = "okay";
+};
+
+/* assembly-option for AI accelerator on SoM, otherwise routed to carrier */
+&pcie0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie_pins>;
+	reset-gpios = <&gpio1 15 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>;
+	uart-has-rtscts;
+	/* select 80MHz parent clock to support maximum baudrate 4Mbps */
+	assigned-clocks = <&clk IMX8MM_CLK_UART1>;
+	assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_80M>;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm4330-bt";
+		device-wakeup-gpios = <&gpio2 7 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>;
+		max-speed = <3000000>;
+	};
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins>;
+	status = "okay";
+};
+
+&usdhc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usdhc1_pins>;
+	vmmc-supply = <&v_3_3>;
+	vqmmc-supply = <&v_1_8>;
+	bus-width = <4>;
+	mmc-pwrseq = <&usdhc1_pwrseq>;
+	status = "okay";
+};
+
+&usdhc3 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&usdhc3_pins>;
+	pinctrl-1 = <&usdhc3_100mhz_pins>;
+	pinctrl-2 = <&usdhc3_200mhz_pins>;
+	vmmc-supply = <&v_3_3>;
+	vqmmc-supply = <&v_1_8>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
+
+&wdog1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&wdog1_pins>;
+	status = "okay";
+};

-- 
2.43.0


