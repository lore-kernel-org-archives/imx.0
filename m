Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2083.outbound.protection.outlook.com [40.107.20.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D091BC5C
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 13:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734613841; cv=fail; b=IhpLXwyfcgoMwyXnuNhT5aSSmLV/pk4bdDCVxuAlZvAVIjv6RAa346hM7dcfvKDwhiBcYil1IfO2Nfpx7Gq6FqsDHwURfXXI51336XBFr5gE4HjFopKoEamuWKSWNRzh2kepgkceKhz9VPNYf+u725GXYlM0GO7cxTI48ulUQuU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734613841; c=relaxed/simple;
	bh=xZfnwLsaRWh5b3U2krWyYj4gxxTu7csSNyVDPJfXafo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=LZYADK69HefF+VupQz/H2fZ4WlTnMzUX1xPuaVK5V2Aje5pLHMudRXSsZTngNorYYRlU2qFl5FmZNv73Md6B6BHlo040U6CY0bcaJHNLrKEfTXSXZCFcuWIIy23WkGrANrMu3Vq8D9tLkOEJSoiZZ5JDAJ/Ktbq/iDgrtoHOTqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=aQ2CV3Ne; arc=fail smtp.client-ip=40.107.20.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="aQ2CV3Ne"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xLUG5b7wakw4Bv+JnSp0SJVKOmZVwdVMqn+yy4sYLy62BAVaxUZs47heOW60TXt+X/lZKL+MXMRHEPSfMgvfcoXuNEEeBPk4bekVMuOjpK2kD9sasOGg45DyH+IpIP/NRbJKJY8gEgy3HCeyPfeJz4EyKydAmX1/s5CSRMnMmv8rt3cTf2XatFuaODxKnmnHv9z7hvXaHHrnzCSPy2VvB7nV4SNNpggOmu2/EPnpyP8C6XYL/SlbH9tcPVOLSmZCrH8oUBPcdTRD3n2bJmbkIPHbNqj29x73cS2VttlffMLjGx5G+rvnbC/7jt4XzJYwroPyDSjIxTZXZ5HJdBKCvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1O37GGDiNqX9BN5G4PEOUKadcZso7tqGm3oWW9QOEMI=;
 b=ulpTh7IrrI0AvYH1mDuO7RGyEnKDbAz2DEV+8My058z2uZXSBFC8X7tu7Qijmi9dDXVbPhQIruyd629d/TsVR+TMcuyjldiCRbq3BN1IHGYEQdDrvDW87PnwhJQMHjfgq90Mzl7C59SmBJ5mRo6IixUPiCLJJALpaxi+suxt8bqTgxyfiNCn4uI5MGG1midMz4ZCNu/s9MU7/8k4MkCJTBlhg66WqPmM2tDh6yWEtC6ybO2W61/7T/Jx8oG99aQk+YbZaubGuYwsGSiKCISGd3S+X3cA9vUf2ZmEqwcosTHxyre4vTsDFtX6HTsUP/EXvp6iPJZY/Mwpx1EQiTOGvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1O37GGDiNqX9BN5G4PEOUKadcZso7tqGm3oWW9QOEMI=;
 b=aQ2CV3NeThMEp8fTStf0XOlZqW6R4qhLgHngDV5YQfsZCFfj6AGdBjVNY8vCnYPbQU39i1iuqtDAvqcuAXGMSkMJnLK/5/cQZBpKpiB7NiQVzTI3sB2VpMn/jWh8ZDzAoE148f6gg2VUp2LmG4/RunvwzJNRgQRj5vlbLi61kB/yRGh2vlrFDikkHWhiPcFjCyUYroUHgNiwgfg9BWVYF8kQY3iiNC1C1dkSDbpC7IkQWjq3wVN3Z0Vb0NwadosP9MvQ3no/GNgctjzvn4hm15eRNHnvnSBUu357dPZxUFu4yVKMqQey4AB5jc1Llxy+YOafTA6IezBprePpQMaJuQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0SPRMB0099.eurprd04.prod.outlook.com (2603:10a6:10:47e::21)
 by DBBPR04MB7754.eurprd04.prod.outlook.com (2603:10a6:10:1ee::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 13:10:34 +0000
Received: from DU0SPRMB0099.eurprd04.prod.outlook.com
 ([fe80::81f7:ab08:594d:c11a]) by DU0SPRMB0099.eurprd04.prod.outlook.com
 ([fe80::81f7:ab08:594d:c11a%4]) with mapi id 15.20.8251.015; Thu, 19 Dec 2024
 13:10:34 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v3 0/4] add I2C DTS support for S32G2/S32G3 SoCs
Date: Thu, 19 Dec 2024 15:10:25 +0200
Message-ID: <20241219131029.1139720-1-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR04CA0057.eurprd04.prod.outlook.com
 (2603:10a6:208:1::34) To DU0SPRMB0099.eurprd04.prod.outlook.com
 (2603:10a6:10:47e::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0SPRMB0099:EE_|DBBPR04MB7754:EE_
X-MS-Office365-Filtering-Correlation-Id: 0876c3bf-fc72-4264-de52-08dd202e85eb
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UkViSFNNSllXMXV2Y2l5eHNNSHRwRHRmWTVSWGo5SlEzNHhrT1lodW5WdUlF?=
 =?utf-8?B?S1BPUnVyNkgvdTNaN3c4ZW1tYzZveWVnWXZGNmg1U3lzRmkrNGF2VUdLVmIx?=
 =?utf-8?B?azZhMFJVNk5LZ2dtQzBvcUNYSXpzN0VWM0Z0M05lMlpLZmFwZG9CcDVhc1Bt?=
 =?utf-8?B?enRQcERwaTgyVmdOaFE4NFVWdGZId1V5VU95QVhPYTBFcXBpSmMvMFdNU29z?=
 =?utf-8?B?L3RNRXQ3U0g3ZDNxRFYxeFZCbFhxcmZNYWtCaXBIbVp3cjhCbEY3VEptS015?=
 =?utf-8?B?elhvN0orcDZRZkJqcnlvZGVFRTBUMFg0c0QvZUorM08wR04vQ1UyODNkRUw1?=
 =?utf-8?B?VVYrRmc2MXJWSG1wd1pPMTZWR1JCNXZjK3NoTFJienlKd21Uc1Z5K2p3Tzla?=
 =?utf-8?B?SzZhb09iV1hndW1tT1Z2M01yREVaYVd2ckxoekpTNnppMTJQQ2FHUElWazEv?=
 =?utf-8?B?WXppU3cyazMrTzZoazBZVWl3Q2dRR2p1cGNRODNQZ0RxZTNXNWtqR0EwWGlG?=
 =?utf-8?B?WlZYWVdwVndRWmczSkIwWnFVZlJ3UXJxN0I5T0JSdEJWNmJKR0h2STBxSHRH?=
 =?utf-8?B?SnZkaXlmSjJicm1ab2p0VmUwU2Zyc3ZMUnkvWnJTaWdCcEQ2bkNFMXIvZk5q?=
 =?utf-8?B?UFBZSVJCRXZzdGNLWjA5cmV2WDhWMFNEVDVkUTAybEhQdVhxTG8rV1pZWkc5?=
 =?utf-8?B?UXFTcy9uVmE1UUcrOWRZK0UyQkxSTGZQUVE1V2U2RXl5Zml2dDR0dk5GWk4y?=
 =?utf-8?B?RlNaMUlJOGFkcTdDa1VYRWxjczVJMVJFTit5RmpIUzNmaDg0bkg0Q3JrRWtq?=
 =?utf-8?B?Sk12M3JSNm80MXdmUysyQlVuNWpibjdveFFNSVpiOTlqRGpnZGJsd3Bodkd1?=
 =?utf-8?B?azFSZDlTSVZ4S3ZIYWxRYWN1OUlMUEFBTVdPMlhxdHdxdGJ6WDl4OXZGb0t4?=
 =?utf-8?B?cnd6MHVROHk0a3Q2VTBmeDdRZG4vSm5DbGVzc1pvMzdmNXhRTGd0bFRhRk5P?=
 =?utf-8?B?bldxNXZaNGM1TnlNMCtPUGpuK1RZZm1lUGdORGNjeDRubzIvRGFTOTZxdGlW?=
 =?utf-8?B?Vno5UE1aNzdmQlhQWk9qRmVEU0pGRmxOMXgxSEZwNkF6TkFjanBMT0EyNGNs?=
 =?utf-8?B?cTJ1U0dnakEzY2tEVHJaUkIwQkFsVFJiVnZvTS9wVElIalNNNTl1emErWFVk?=
 =?utf-8?B?TnFLb3FwZ2UwQldBRHZ3NE5OS2VJSmxTblo0SEFlL2czUGtuQTcybVdpeUp5?=
 =?utf-8?B?Y0diU2tyZnlMcHpXMjVXRzJhdnNMUHI0eDBrN1JUemhmbWxlT2xZZzkzUUVS?=
 =?utf-8?B?ajgyNzJDbVJ4N2p5a0wwMjRoMDRuQm5ieit4aVJzcnB3UXFXeWZaTWgydFlO?=
 =?utf-8?B?dFExKzJNM1U0YitiRWdIT3ZONjJlY3JGUnF2MWFKYWZGVDVON1gxNjN4VU9F?=
 =?utf-8?B?TXZCY1pYTnJJTisxc2ZwdWlINWtBemFPdFRHTkFrcFBVN1VaTGcwNTR5dXRD?=
 =?utf-8?B?S2kyMkp5SGplME81bVFtd0ROdkZmNzk2WS9rWWRLVWtOSnVLK3JxVWFNK3VE?=
 =?utf-8?B?b0ZiNG54SWpXN3ZaNmk1aDIyS2VJTkdjaG90emdPd3V1T3FBTEVKcFI1QUN3?=
 =?utf-8?B?UndqbnlVeWtWVGNsRFVYRUxGZ1p2bVFDZ2VMM0wyK2J0Y1F3Nm4vNDVrdXVJ?=
 =?utf-8?B?TkZISkUzMStrVUt1U3hmVDRXTURxVjU1RlNBK0YzNW9ibHd2RnZSNnN4Wk1N?=
 =?utf-8?B?SGNWRk9oS1RUZisyekozeVZ5cEt0OGlNUmVVNzVuZG5VMVFXa2x5RSs4YnFs?=
 =?utf-8?B?OFVkd3VLZXE2OTlUSXhCZjBNQitzNWxkOFVDdnZ6UmVkcXFScWJicTZBQ2tu?=
 =?utf-8?Q?zb3oY69p0bUsq?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0SPRMB0099.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UFp2akRBK1grOWJaQXBaTzE2M1huMDJZT3h4NTkrQWpmK0pXWnFzYTdUV3BQ?=
 =?utf-8?B?a08wQk1pTVhnbkdCaEVGZGVjVzdvRUUrbG1yd2pKRTZ3aityUXdkdlY3YnlL?=
 =?utf-8?B?U1VCSm9wdHRNTVVZVXdkLzJtQm56UmkrS1hIRUJIK2ZYY1UxdlJuVDZDR1Zn?=
 =?utf-8?B?Y1dLL0YvVFk3b3lTVlN2dmxRekplYWowK3JYdkxzVW90TTJvZUZFQmJQRm4r?=
 =?utf-8?B?ZWYrcGdERFZqWFp0Z2Rza3hQZ0pnWkc3YnJYaVZNZVlKVS94MUdPMnczVE1h?=
 =?utf-8?B?aHFUTUo3SkhhSEMwSkNyLy9QWUV1L2E4YzdvZWN2cVlCai9iSEdrWEdtRWpa?=
 =?utf-8?B?SWRDVWNSbTJrMjVSZkp4NkhxOHFUaXRmSTNzbFJGNGl6bUlKSzRXR2oxVUxm?=
 =?utf-8?B?bk94SEp5M1pDUnE4dmpPWmNyc1RrMkc3emx3Q0ZMa09MM3gzYWFacHMxUXV3?=
 =?utf-8?B?WVVCNnAyM2dwVHQ4Rko0U21laE5OUWIvVE1TeWZrdGpMVHhzemFHbWh6ZE9B?=
 =?utf-8?B?eXQ5djUvSDhNNlM4QTRXOVhsWWpYYWQvNlVWV3RNd2s3cThYRUt2UzltaElG?=
 =?utf-8?B?S1VGeENtT0h1MGpNVnVnSURLZ3JEMEc5Wm5HRkJwanBxZ1FNVUQ3Nk43Y2pv?=
 =?utf-8?B?WXRUNWxoOWNMblhEQmNoOXBoVEVXb2tXR2Qwa01kRVIyYUlReXJuYisvNlli?=
 =?utf-8?B?Mm0wS3FYelVqWmIxK1g1SzBET3pBallHWGNyM2doSmswYk44QitaRXh6ZXhz?=
 =?utf-8?B?SC9XUTZlTlFkVm85RjltM1NtQTVMZkkvcFppaEF1aEt5TDRjdkRTZmc5RHVy?=
 =?utf-8?B?eng4V0tYeHJidzN5SFJldCsyUTVRWlErU3RhZUEzM3dXWHpSV2RQUlQxcVEr?=
 =?utf-8?B?bXc2RlhYU0pEaE9qSnNkYkYvQUZGeEFCOVp0cHZLRFpPa2FVMTlZVkFudm9K?=
 =?utf-8?B?L1JYZW9OUzJBMDhxb1FGWVBLOFk0NUJuT2xlbjZhTzh5Y2lZQzlmaHgyNXVI?=
 =?utf-8?B?LzQzcGZGekg0cHA1TTN0QmFKVUpFZ3MwMm5IOUVaeVRxOFVZQUJtS3RKMVJy?=
 =?utf-8?B?ays5dzFUN0JMYUZWMmUvUmMzYytSWW5YbUxnVklVZnN2SEFnYU1FbXB4Nmkr?=
 =?utf-8?B?MzlzNExLdzRKbmRFRXltOXNaYVdQMlY0cll6ejBubnJQWldBTHBZYWdFRTlO?=
 =?utf-8?B?a09iczVNdVF3RGJVV1BWelNJYXlTZzdSZXg2c3NRd3dmRWpDcXJWUXF6MUt4?=
 =?utf-8?B?VGtCczVNWXc1UDdFQ1JuRklZSXQrdFY5d2hody9VZGptNnNsQStDcE5yV3Qr?=
 =?utf-8?B?R3V1TC9iM1hONENuL3lxOUZtd2FuRVl4UTNrNFRkVVJaZEZoVlI0L3dhVVY3?=
 =?utf-8?B?bWU4bDIxcjU0UHlOdlViK01yVnZFdmRoN3UzUUVzM1ZGWjdKNmQ1aUMrbzBI?=
 =?utf-8?B?eWVwUkgrRi90WG54dVhqVEs4MnVNUHFwdUFuSE9vUlNrN0IrdmZhTU8rU1lF?=
 =?utf-8?B?R2JsQ3hKb0tEbGlXOXJ2ODNkSzkzaDlwUDNoV1dPL3dFdUZERHEydmtqanhT?=
 =?utf-8?B?bHo1SmZUUWNpU0NPYWUxbm92RUw1NnpYVllnVU5qSENNUGtzUTBOM2ZrQmM3?=
 =?utf-8?B?WmVnYm9PUk5wb3NkV3VZaVdXRFVoUGt3bTQ3ZjhXeERhWmpReWVicEJlQnlM?=
 =?utf-8?B?S0ZQZjdyQkhibUU0UTRxYnV6TDh3VGNTdHNmRWtaYk9kMW5jYVRhTWZ3R1dt?=
 =?utf-8?B?eEVWR0syMWFnSnk1WHJOaU1ETW0zUW40dFR5djd5V0dMcE1qcmVTeEVZZDJv?=
 =?utf-8?B?ZlQxQTJxNWxFZHNaaGRlM1RucmdnYXhBT1liK2VWSzVkbmkzcHNERnlBNDdN?=
 =?utf-8?B?N3U3bzB5YXlZd2h6RUVCdHRPYTA3ZDB0cDRxbGxaVkY5WENGMkRvanl4MmE1?=
 =?utf-8?B?SEZFVGN4elBnWENxazEwNTEwbmhRL1hLK3hPcmlTMkZqL0s2MVVUYnVrMTBK?=
 =?utf-8?B?K0gzVFVQSzJTbnB3YnZ0TUdCMmhiWW9teHNYMEwxVy9lOUJYS01FWWFETHN0?=
 =?utf-8?B?NHhJZ2xJVzRjTDY2cE9wT1JTUTFSWmQxV21PRFRHektpWXh3aEpTZkZxbFNp?=
 =?utf-8?B?d1hQOFlDREhDYlNxN2ZOM0RYaXdxZ2xYZGFZKzFuQTFYbHhZeU15N1hianNu?=
 =?utf-8?B?Ymc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0876c3bf-fc72-4264-de52-08dd202e85eb
X-MS-Exchange-CrossTenant-AuthSource: DU0SPRMB0099.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 13:10:34.5422
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: doWZ1SQvnvavCvWr5F1InZ8tCQQdhrBZ1VadZteVHNMOluGs1xg92Yh3V9CxNbMWFUQvHvsYxGHcZzZGV/BNHwZIIjNa/MSeyRvQqtPWE2U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7754

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

This patchset aims to add two changes to the S32G2/S32G3 dtsi support:
- Adding I2C dts support for S32G SoC based boards
- Centralize the common part of 'S32G-EVB' and 'S32G-RDB' board revisions
into dtsi files. This refactor will serve I2C in this patchset, but in the
future it will also be used for other modules such as : FlexCAN and DSPI.

Changes in V3:
- Separated patchset into multiple stages: common 'I2C' dts entries, board
'I2C' dts entries and the introduction of common 'S32GXXXA-EVB/RDB' dtsi.
- Added missing changelog for V2 of this patchset

Changes in V2:
- Moved I2C end device '#address-size' and '#address-cells' entries from
board dts to common 's32gxxxa-evb/rdb' common dtsi.

Ciprian Marian Costea (4):
  arm64: dts: s32g: add 'I2C' common board support
  arm64: dts: s32g: add common 'S32G-EVB' and 'S32G-RDB' board support
  arm64: dts: s32g: include necessary 'EVB/RDB' common board dtsi
  arm64: dts: s32g399a-rdb3: Add INA231 sensor entry over I2C4

 arch/arm64/boot/dts/freescale/s32g2.dtsi      |  45 ++++++
 .../arm64/boot/dts/freescale/s32g274a-evb.dts |   1 +
 .../boot/dts/freescale/s32g274a-rdb2.dts      |   1 +
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |  50 ++++++
 .../boot/dts/freescale/s32g399a-rdb3.dts      |   9 ++
 .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 150 ++++++++++++++++++
 .../boot/dts/freescale/s32gxxxa-rdb.dtsi      | 126 +++++++++++++++
 7 files changed, 382 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi

-- 
2.45.2

