Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013048.outbound.protection.outlook.com [52.101.83.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6D22FE595
	for <imx@lists.linux.dev>; Mon, 26 Jan 2026 03:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769399249; cv=fail; b=lwUTSnwFPkKG2JaUKZNMS2piuQCYUlkdkLisxhlo4gcIJ5TwF5pEdxPq/OEFaitje1Cj99Z/hUfyEV5s6+0wphHTJ26PDvh0xAplmwkHT9H85a995GmhXjIIXOZ1BcKNqspJLzG1Nvl4QAJ0VHVkjnW7+B3zUeCNvKMw9VnZMM8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769399249; c=relaxed/simple;
	bh=0Uf1+M0dCP3F+PtqXVsBvtgARUDANyEZWx833kSBp9o=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=tEURmsMsv3G4CArc9etb+QJifuv8OSY1ET2jlu+X6sUIWgQcYlyrlUWONxouwYRBtjC/U+YPwBXusyrzJ+LbZysESKNEbhQojHUwZZHIe9GUMvaImuwODpj9Z9clRbkzV2oXwA7zUrmCZ9khpkJlkiBVcbKyWIvMb1PIdZ/s7Ew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qWu7Hm9p; arc=fail smtp.client-ip=52.101.83.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qWu7Hm9p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JlZr516dAFjY14x6/Kgp1s0sVJ+9sEvXhF5AsGsPewl8TsScMPjpmrGfvMFvFVSsVKuFsNQ1M32xjKWu6qiK2C4IoRbtTU+PM7eomd9WsIR2nm3BaQCJFn5V2tczsgsAQ9R70wetIzwE4u3dQkgfeUFhCV0E0upy3yInXX1MBulhoedVNCA+Jmr20pGnVWguE9TkwMUYKijuOlF9xLXiqxJOVYllzcfAZGmvHprS02gkuZT6ZwBsAi+JCjqSq+CV3ZLv0PXI6VK3BdJHiqR7F/dHef+hWmMaT4djI5vFPbP9xRQivfJ7LAsKHg5XaYDFvrhYhJ2fWl0G4BOEL+TqkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMJ4VVE+DNPWBNdqEYRgaGP5GcHQ4LxUSb18CS0IOI0=;
 b=wtEbPaa959JPSh06HwR8HF/1qV1xmd6FOi3bkhbZrygLAwDUv9GaeXmBd34t5tU82N9ggfhmaOt5psrIPi7KwC8RkNYLrrBy/JFdgyFKBXtiLLczvLKv+TrDA4JJN7/tGI7sEgKJQiqKO1NCKZXrq9GEhu3viaLMBMdPdkLo3lZZRjzKYaNxSeva/4xd4eH8ZvPNVsEmWeEHLiQbeOjF6O4GjGCBnZW6JiwYbLTmAexgt0LijOg/s5bq6P61TpWhLnoqVyHb6PHcmSI7OL9boiXMG1LnwThrA8fBvvAt1vdHiBQUpw5If2r/JABtGljvj8b85sNY1Fkr+DJBfW3kqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MMJ4VVE+DNPWBNdqEYRgaGP5GcHQ4LxUSb18CS0IOI0=;
 b=qWu7Hm9pfMYmGn+uJw1f5qLq6k5kAmOGnfzDJoKFxCVxp1ehnR0WMjfd+ZRFwsrFUZGbWxxfy0jyb8aA3jLbABbSdTM8cQnC0slnj5yXEdIKT5Th/pTAl7xM11+UgbF1tHp7f0i0yzj1IPHE9Mlm3Bs2BmvWvz6pJ3CZE61+C2kxGivdqzIEbwPmPrRCvSGeHbfcvjYXgEqo7/xHiwTKX0LHtWUm9lIetj+G9Ol43b/AOjHgiQmgNV+jXRJHDZXEtMWtWU6J5awhWVzW1Sa+HeZKWVDx70na2hBt1gggp5/9CRd4G9vYLf5hIuF55mzpa6aYuyRKUvxjqaAqREbUkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by GVXPR04MB11654.eurprd04.prod.outlook.com (2603:10a6:150:2c3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 03:47:23 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 03:47:23 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 26 Jan 2026 11:47:02 +0800
Subject: [PATCH] dt-bindings: firmware: fsl,scu: Mark multi-channel MU
 layouts as deprecated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-scu-v1-1-b9d31da12860@nxp.com>
X-B4-Tracking: v=1; b=H4sIALXjdmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyMz3eLkUt1kS+MUE9NUY0PLNCMloMqCotS0zAqwKdGxtbUAyA66i1U
 AAAA=
X-Change-ID: 20260126-scu-c93d45e319f2
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
 Frank Li <frank.li@nxp.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR02CA0127.apcprd02.prod.outlook.com
 (2603:1096:4:188::7) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|GVXPR04MB11654:EE_
X-MS-Office365-Filtering-Correlation-Id: 54de6c93-1af0-4ae8-b65b-08de5c8d9d02
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|52116014|19092799006|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VGJBb0owM3lGTFpNSVlYd083RTR6ODJuL01YalJQUHoxNjhZNm5vZkgxc2lF?=
 =?utf-8?B?ZEZKWjJ5S01pNnY5OHJlSWh6QldqZkdZVHhTR204OW9KN3BIaEVGOGtmVWs0?=
 =?utf-8?B?cWl0UmwrWE93NTdYTFJpTG9qbzdMQks4R3BxNHJVNDZ2aGk1MmdaazJVV0JG?=
 =?utf-8?B?R3hmUGkrYXN1TXVNOHdIWHNlRSthVmFLNE1HcmdFUFRZU1BLbjdnS1NISjR0?=
 =?utf-8?B?Z2NDdWZZOGx4eDA3K29kY1pUaUF0R0RUZ0JYVTNYR25BN2pRSXA1QmZoek9L?=
 =?utf-8?B?YnpBRmVSL3h2RWgyS2ExaDFodzMzM0F0V0IyUGFabkVGa2cxRGJHdzh4Z2Y3?=
 =?utf-8?B?ei9ES29ZNXc1RmpEOERJaFZNM2Vvd0lXa1hFdmRqb1RxYkkydS9zY2ZPallh?=
 =?utf-8?B?NVA0dnpaMk1MOHgxR3Q0SlI0QzdmOWNKQ0tEdjZKV1VPODBiOVJNNk84V2dr?=
 =?utf-8?B?bExOUjNqZktrVklNTXFtNzMvbUNQTVZjYzBWZEFrUHRWUVQ4dmpxUmJXUDkz?=
 =?utf-8?B?bUlYMDhjT1llY0ozWWhmaVlqL3hnTjRIeDc4RDFSU0JsZUNjaUdRYlQrQlJO?=
 =?utf-8?B?Q01Cb3JmTjJqNkhqZkZ1NlRxZVozaE1rQWxrU0FqMzRXMzAyMkdaODR2VVVZ?=
 =?utf-8?B?eEppT095NlJFVUtBU29rYkVMbjUxTFRSL3dobCtubDI4VU5aRm5jN2N6NFU0?=
 =?utf-8?B?MXVlKzVndHlqRUJreVNDTlNTR25udXZsbUx1cGlSMklveWtUdHlEeW81MFV0?=
 =?utf-8?B?UFYyYWFhL3ljR01rS0JCalFKcHdIZ3I2UDVwQU5mTlQyL1ZRb3VPK1hhTHdD?=
 =?utf-8?B?clRJby93Qm53aHZ5cEdyT0xEYk5MYmQ2NGk0OXp3bkRJdmQxQ3NBbU9LdzNO?=
 =?utf-8?B?eEl2UDUyMzBxM0ovd0ZzZERRd2ZySGZTUzJ2QzdxcmM5ZmNuQjVxRUQxMkd0?=
 =?utf-8?B?REw2SXdhekVBbkdLalAxMFZldTZzZnpnWVJLdGRMRFJ1aGdVTjV5N0lmdmJh?=
 =?utf-8?B?VVJ0SnN4TEdHRkg2TU9SZEdsQ3lSSE9aa3JGM3RYK0pxU012QXZKdTk5aytr?=
 =?utf-8?B?cFVkSTFQRlFpU09sQjJDaWVDYW1VNDJ0eFRza0tNWFVOekxYWlc4SU5lMlo4?=
 =?utf-8?B?d0pCQVJzYWVUL25LWnNNUFU2U0lRUEhveUJrSUJPd0t2V2tvRFpDWGx1Ujhq?=
 =?utf-8?B?OXc4N0M2Nkc0dTdWcFVLazFyTUdFWUViSGNnM1REbTlUL1VzWEFIQWZtTkpF?=
 =?utf-8?B?Z3FySnozc1FEbklhdVNTc2t1d1hYYnpsMUNra3ZPRlI2REdTczB4NU9jQWdI?=
 =?utf-8?B?YzZucWtkQjEwNUxuSG5jRy9PT0VBTTk3NGJDSXo4ZTQrLzEzV1Q5ZEY0OVFM?=
 =?utf-8?B?cXQyNUJ1akViRnAySExvR2hVVGg0clMwZmxBMXFMTVZNcWRRdFo0djkyUHI1?=
 =?utf-8?B?SG9XUkRGY0JkbWdZZ2EwMDQyMDd5VVY2Q3NxM0EyUEJFOE1hRy9KVHZvYXRI?=
 =?utf-8?B?YSszWk52SWFsdlB4NGJxSDhsMFJhWEZ1bHN6M2YvQ2x1dHNyZzhmNS8ySyt1?=
 =?utf-8?B?aG8vUnhQVzRDNnhOOUZ3bmFUUlY0eTZKZEZrVXNMWFRZU0g3WVlDaitTRlp0?=
 =?utf-8?B?NlQ5L2E0dzhPQmJJWlcrWnhYVTZITzVOSXdiaVlHbUxFUFowVlNRT0dOMmZ6?=
 =?utf-8?B?V1hua3k0b0xNbkt4SWhvSEJuSlpRWWMrQ1Q0NVhVYVdUOHl6Tk9vM2RUb280?=
 =?utf-8?B?OEgrbkNZaTQrN3NiY2xpU1ZvRDQ4VVpqQzNUMGQ5MjN6UlR1aDBCWmN6aWdR?=
 =?utf-8?B?NS9DWlExcnpQbDg0bFd2YkdFbUVDbTJzWERKMExNbkwxVmRuWllEVFBIOEVo?=
 =?utf-8?B?cEZHalBBWXJGazAwMC8vZWdYUnRna2s4b29ibmdFQStPV1ZqblVEdWRycmlH?=
 =?utf-8?B?Z2NuNGpKclFQOHQyd0dZMm9mbEZFbnRtSU13U2lGancvQmtYbFE1TVVldmlH?=
 =?utf-8?B?MXhua3VFS0hUd2Z0Yzk4UTQycVV6UE1ZbFZkM0lUYVRIVGRMZG5QRElkTngw?=
 =?utf-8?B?Sk41cnVRcHNoMFZGaVY5cGVlakZIeVo1N0dCNXpNVHdEZzBycFg5azhyb3Qv?=
 =?utf-8?B?cUhWV3hQRnB3REJ3L3c4elFzeWxCWjlYRzBRM1FwZTk2NDFLdktGVS9uUGdI?=
 =?utf-8?Q?6P9Ln7KkhohXT4Y4O8vIXtM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(52116014)(19092799006)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0xnWWVDV0UxVHljbWlSWWZYekhFU0Ntck1MRWM3eEkreEhLTFN2VDNLaXFD?=
 =?utf-8?B?M3FzQ3NPKzBIVkNBS3MyWkVyZXFGRUZ1djU1VEwxSkhXaDNLSGZxUjFNZk9l?=
 =?utf-8?B?ODNWZjRCVHJCc3ZEVmtERUNQZ0liSTROenZRSEVNSkprOTl6Y201VVVQcDBJ?=
 =?utf-8?B?LzIybzFhOGRaMXVnNTBMMXFRVlpDT1RCTkFwODl4QW9LYzlYSk0xSmlnSHFB?=
 =?utf-8?B?RWs4Z3lneDlQNndGVnNVYjNRV1ZKNmk1SUswejJaUE9GeFVBNHkrSmdBcFJY?=
 =?utf-8?B?UnE4WktQT2pLYU1JaXk2d0U0T1g1cGIzVnhtVmJTOGkrdFhkU05ySE1vLzdS?=
 =?utf-8?B?TWo0RC9JeDhSV2padzhWVnU2UVJQam44YkFzclVISVliZUtPZXpzNjdjRFJj?=
 =?utf-8?B?R2xUT3lYOUlhd1NPWUY1V21GZ1VBRVp6Y1k2NzUzY29pblA1ZEhjd2FSejFh?=
 =?utf-8?B?TDRWZTQ0a2FLRU16R3prczRXVU5jaXZCYmhaRlB4ekdMUHpTYTBCZjdLcjFr?=
 =?utf-8?B?cVdMRGRGNDU5WWlKckVJVXpXNFAzRUY3VFVyanVRcDNTNklWRC9rR1Uxelk0?=
 =?utf-8?B?NE1CK2RYNkNoU1pnV0xvVjJYdHJYTUExcG5UTUQ5LzlVaThIcWhldndPbG5i?=
 =?utf-8?B?TG9CODBaUWRpalpIcGRKZUtMKzVTUUE4aDhwNkhYN0pRK0wyOHpIdU1IR3V6?=
 =?utf-8?B?Uytzc1pqeGdOb3hCSVMySmZLYXU4R05taFpwS2NEZFRWWTlBa2VQVlVFQ0s5?=
 =?utf-8?B?cTUrZGdlVjZxKy9pT1lPVTZqTUxaQUs2WjNQZ003aCtBbGVLSnRacU1yMjE1?=
 =?utf-8?B?T2wyWEtSV0l1YThJTWNqVUh2bFRFZDhnRitPUjk0eEFkTGhzSmlHVXBnRzdk?=
 =?utf-8?B?UUF4aEl5TTJiekN2VGY1NTMvbWFoNXZLZ05ZRzUyZThMRzB2d25Sc0E5c1Ji?=
 =?utf-8?B?L1QyaEVzSUljWkJZck1RREs4aDE3Q3FacjZCZnZyNVdFUkg3VVdpeU05aGRM?=
 =?utf-8?B?Q005aDBCa2NVUzV6YzIyWkk2eVlvUTNJakMyZjhxcURmeVR5TlYwVkdnU2lM?=
 =?utf-8?B?V2VocDlNSHM2VG5jVFBpWW5ZdUdlRHJzM0gzSHFNYmExQmxHdUdnd3FwN25z?=
 =?utf-8?B?a1dQYWR0TlRQaE5VR1ZIN25FQUlRdmkvS3F6cXlaT0EyR3ViUFlmVWJVVnBv?=
 =?utf-8?B?SENuMmhMNWhUVHFLcjdTS0dDQ1NmcTBXenM5MXB6NjlOMXJsTVRMNU9veGUw?=
 =?utf-8?B?YTlSTU1YbC9MUTV4QUs4dXlaNnVDaUFDNjBWQnI2Ukt4UnNCLzhlSzJCa3dy?=
 =?utf-8?B?VnhmQ0t4SVBteXpSWkhnZW85ZEdlRXlhMUgxUVlTN1lzZjRQanZCVUhLOVlp?=
 =?utf-8?B?SHRlbEtRejlBLzdHdmx4cERjTHlUSHlHcUVCbjM1VlhsKzZRVFJtYmlkYVZs?=
 =?utf-8?B?ZHNqRTY5ZEZhTW4yRlpDMkxnU0tiSGVHNnZTc2d1bUZIYXNuSTVUQ0sycW1Q?=
 =?utf-8?B?YkhVaHM4MDJLMy9WZEU2UU9nSDBTSFN6YkhRRDQ3MktHYUJWQlNvVUNMeHBO?=
 =?utf-8?B?NlFlUndabm05clgzUVRhY2w0V0dlczlvN0VLN1dicUdWVFdNV2t1Sm01YjJQ?=
 =?utf-8?B?VjVTQlNwc1k4VGptaWpWakRTeFZGVmVCK3dIR25kVE81SUUvVVFsNVVlcU52?=
 =?utf-8?B?R2RKZGE5WGtHWDdUaUQxb0wvd0hxUEpmZ05RZTBQV1FxeGdJRHVncVNpRS9p?=
 =?utf-8?B?bW9YeTF5WWIyMktJQ1JDU2s5U1o4V203MUxCc0x4aTh6S1hoekd2cXgwVFNV?=
 =?utf-8?B?WklIUmNnUG9WRm5UaUxXcFgzeEd5T2d4dDhzbHNNNkszMVpRZW9oT1kwUTVQ?=
 =?utf-8?B?Q3hjRldrclB5OVdlenNLeG9LaEFhWjhKQUl6OXZUZy92QXg5ZkJBWFlJNnAy?=
 =?utf-8?B?UzIwSmxYemxrT1BkQzVJRktuMTVoS2E5M25RSllqWWkvbzBKTkh6bU43QnIr?=
 =?utf-8?B?RHNDSjVXdStQYlVYRkpuTVlNOGN6cStuQVVTVzRxZldnNUl4UXAxUm44Wm0v?=
 =?utf-8?B?cGd6d1BOSzkxTm93ZlBDSHpBNm83aEkxcWhDUkJ5c2YvTUR1L3VNaTRGeGlF?=
 =?utf-8?B?Nk5DNjV6UVpSZnV2U3dnUWVBcTFpRGdTQ090eTM3T09LOXI5bi85bURUTFlu?=
 =?utf-8?B?RVc1MUJ3emtFVi9Fa3o3VGFGb2tuZFU5Tzd5UXo0N1JERXVFSTQ4OVFkckZE?=
 =?utf-8?B?VkFSbkExQ0o3Ukl2MXI2M1Nxdm9GSmFpSldmWTdWZC84d0hoNmFLWk9Lb0d0?=
 =?utf-8?B?SXRTdmk1N1hMMWdWM1c5Y040UDlNd0NTbEhxWHNFVVU2S2ZmRTdsZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54de6c93-1af0-4ae8-b65b-08de5c8d9d02
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 03:47:23.0444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7t0fdc6UNu33QTwTWdLnwfiUDBgLuAGEiAnlzcGmwIGdldLN5ghbJYFH+2D2/xfzym6F7CXctWuD2FXEjy4Bsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11654

From: Peng Fan <peng.fan@nxp.com>

The SCU MU driver has long supported the simple and efficient single-TX and
single-RX channel layout. The older multi-channel MU configurations
(tx0..tx3 and rx0..rx3) are less efficient in practice and not needed.

Mark these legacy mbox-names and mboxes tuple layouts as deprecated in the
binding schema. The driver continues to support them for backward
compatibility in case firmware publishes the legacy properties.

The example section is updated accordingly to demonstrate the recommended
layout.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../devicetree/bindings/firmware/fsl,scu.yaml        | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml b/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
index f9ba18f06369215691c69cdc1538b53dfd369f37..307f1c6278532ace94db92e6e8b68312eb4c8a4f 100644
--- a/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
+++ b/Documentation/devicetree/bindings/firmware/fsl,scu.yaml
@@ -76,7 +76,8 @@ properties:
           - description: TX0 MU channel
           - description: RX0 MU channel
           - description: optional MU channel for general interrupt
-      - items:
+      - deprecated: true
+        items:
           - description: TX0 MU channel
           - description: TX1 MU channel
           - description: TX2 MU channel
@@ -85,7 +86,8 @@ properties:
           - description: RX1 MU channel
           - description: RX2 MU channel
           - description: RX3 MU channel
-      - items:
+      - deprecated: true
+        items:
           - description: TX0 MU channel
           - description: TX1 MU channel
           - description: TX2 MU channel
@@ -105,7 +107,8 @@ properties:
           - const: tx0
           - const: rx0
           - const: gip3
-      - items:
+      - deprecated: true
+        items:
           - const: tx0
           - const: tx1
           - const: tx2
@@ -114,7 +117,8 @@ properties:
           - const: rx1
           - const: rx2
           - const: rx3
-      - items:
+      - deprecated: true
+        items:
           - const: tx0
           - const: tx1
           - const: tx2
@@ -167,11 +171,9 @@ examples:
     firmware {
         system-controller {
             compatible = "fsl,imx-scu";
-            mbox-names = "tx0", "tx1", "tx2", "tx3",
-                         "rx0", "rx1", "rx2", "rx3",
-                         "gip3";
-            mboxes = <&lsio_mu1 0 0 &lsio_mu1 0 1 &lsio_mu1 0 2 &lsio_mu1 0 3
-                      &lsio_mu1 1 0 &lsio_mu1 1 1 &lsio_mu1 1 2 &lsio_mu1 1 3
+            mbox-names = "tx0", "rx0", "gip3";
+            mboxes = <&lsio_mu1 0 0
+                      &lsio_mu1 1 0
                       &lsio_mu1 3 3>;
 
             clock-controller {

---
base-commit: ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
change-id: 20260126-scu-c93d45e319f2

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

