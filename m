Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011007.outbound.protection.outlook.com [52.101.70.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6224E21D3F2
	for <imx@lists.linux.dev>; Thu, 18 Dec 2025 06:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766040479; cv=fail; b=hnqAgeZkwRGnntADNV5h1ebifFu6+p05ommwdx6nML2KuielNW1clc+3yNImIeZ+M+J144t8ON/BmiUqq8vkJqXqeB2MQ9O7alGMSDuLpAkknVx1T4R/+dW7iHh/73AMBrV8sl3kMu5TuLY31yxOIvXQfG52PfbsSC2chx7kcAA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766040479; c=relaxed/simple;
	bh=tOtSXomq2KH+8clEacb9RWYs1iYcwyaRAGNdBtHVSY4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=heU2bP6X89LD0M5bltCBitBsB8IbphucMImoeWAhnYqTsgBb2wQHd1W1at3MWn1OhG4cd8znlVMa+SZkNtyLyYXrg1gyCMt8cNxoCuwdK3M0g1Cg0uJUrfw0MX+7eupm8H8s0ab/50QKV6J7h+oSgnnEx/I2+3gOBtNJK+kisOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=U51/R0b6; arc=fail smtp.client-ip=52.101.70.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="U51/R0b6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=razN69/Fhh2OFG46nOuOdDyNf16LGEESfnayFSHP2L2UuG/Ia7smN8Ma9K1dX4alhqGZodITMTWndIBe7bUujFTAZHozpSShnVVO0tZg3D2y80UNX8jjvyzSMRhyPmzoY674jhRCHswg15BG5C2+CPkWP170a+Y0X38oA7ouUzECwilc0dUJa9opsy09ixqnC+SEEb8ibawBOakX2j7dH6ZL1rjyUlC4R4bK+v1dX+xJf4ASsCgxXKcxlrjQzdHddPIYIfRM0GVddju1Lzkix+YERcE4GYVtG66gpjm17Ktv2EdPXIBdIHA0GFg1EJSOCGAVSFpkN5BFJeiSmaBFuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9LQ6U97DJmOvAnP/Hm3/sLsl0YOZft52i2nAtpwopw=;
 b=PxDdqpd0NUPh6KRCtMSNagySbloQ2yJxO0FgeIYECmoKKGK+OSvKm6mt9B/qETcGpJVdF/wL/VyA7O1PpeJcQWMxghnYTTGeFzsFi8JB0KH1h4SifOUuPuNEliQVRaF18JSk3enodduUxIlNiBVA0xER4h6XQWFUQ6Bxa7KIZb5y7EsvGrYDMScTrUamsKXvQOzuHAnJujYt95MMqJtURe3sj5nDZDE7/+eAryHeuENSHcBYQ6vmsJCV22Qnndpg4CfIDoNtgx77hXjgny3T6279fZTyAyjQPmLEsXE8OMas7YATH7Z96/Jd5RzxJQ9Byv7M5SmKxIeWN6dgHhGwWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9LQ6U97DJmOvAnP/Hm3/sLsl0YOZft52i2nAtpwopw=;
 b=U51/R0b6I9JI+XjyLfFg6+ONxEqvvWSbS/npd5WHqwVQXvslVH0qNFk6fV8Qm7jPv3NpHXmX57Yc6YukpTEswSjl5Z28ZgD74FOiT/2+k6f1PNil/QRqP1ECXbWK0GmF00eymQqx7FnxddjG4nPm0XFPSjEZJLEVNYygEgek8+SCsy9OJdDLYfveGkmQHDqlH1b/4syw7lf0w10tUnmoPL/CYnWfjPRe/GbAB6+qT9creKo8sbFnqIn3dy+x52JV2CWKFfI7a2tuQGdBukRR9poP2s3RICPV4mdEYb6gF4FuApfECSO9Qc9EetCyOAhgW4niiCPGxajClyJiXjSsFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8599.eurprd04.prod.outlook.com (2603:10a6:10:2da::7)
 by DBBPR04MB7756.eurprd04.prod.outlook.com (2603:10a6:10:1e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 06:47:54 +0000
Received: from DU2PR04MB8599.eurprd04.prod.outlook.com
 ([fe80::c32a:2bd1:a6c0:601]) by DU2PR04MB8599.eurprd04.prod.outlook.com
 ([fe80::c32a:2bd1:a6c0:601%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 06:47:54 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Thu, 18 Dec 2025 12:16:25 +0530
Subject: [PATCH v22 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-imx-se-if-v22-2-07418c872509@nxp.com>
References: <20251218-imx-se-if-v22-0-07418c872509@nxp.com>
In-Reply-To: <20251218-imx-se-if-v22-0-07418c872509@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766040412; l=3201;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=tOtSXomq2KH+8clEacb9RWYs1iYcwyaRAGNdBtHVSY4=;
 b=iXgdmTV8Bxvg93eAk90beMTE4byrhJw8UD/DJPdpBuac0AkY+w8CgPZ2I5PxnBvnSP4TQdpse
 bj8hEz4FUraDGzC4Us2OR7fhU0Tr3R6O7kdJbgSYaOJmXceBo5RNIVz
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:195::18) To DU2PR04MB8599.eurprd04.prod.outlook.com
 (2603:10a6:10:2da::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8599:EE_|DBBPR04MB7756:EE_
X-MS-Office365-Filtering-Correlation-Id: be482323-cc06-4922-e71b-08de3e015f0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|19092799006|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZzVMYld6RVdMTE9DTFdFOGxydDdlaVlaZGdIejhZUWZaUTN3NkpaU1ZJbHJU?=
 =?utf-8?B?UUJHUWYzWk8wM2kyQUd6OE56SFJ0cnI3b3ZXU2YreU5CQVpONGo5MGdJQ3VT?=
 =?utf-8?B?aklUNldJVi9RUUpjVzdjNDdFWUE0azhaV3Z4TFJma3pkdGQwVkZLWDltZ1Nu?=
 =?utf-8?B?czZRem8rRlRkVlg3WlBvMkt4ZXpBdktPdjVqVWJNVHJVcHNmQU8reCtWR1Ri?=
 =?utf-8?B?V2IrR1RvQ2xDSFhucUZtaHYwZVlRRnl4VHhaSTJsbHdBUUNMa3NScEVMOFV5?=
 =?utf-8?B?cWVqVjlKMHhUaE95NFprY01SdWdIQXdQQU5SK3BnYWJ3bEF6aXpzdzlzWFJy?=
 =?utf-8?B?TlRrVjA1KzdSeVV1Y3RMa1NGd3U3K1kzd3A0YitxaHZuSEgyRTdReGw1WW4y?=
 =?utf-8?B?cXJ4SFllMWlnUDE3SlhsRkJhZVVER3M5dVZSRmg2dkIxSThhUk5wckFTdHZH?=
 =?utf-8?B?ZDE0Nkd3U1ZmcllTaDN1dGhycmdIV25kL2JpU1BNNHg5N0NDQjdKbHJMQVFv?=
 =?utf-8?B?Qy94U2o4bnA0OWxWWlppRUlVSXFLUHoyVWRPYmsvNkdDc3pEL1VGY3VZSE5u?=
 =?utf-8?B?WDlWM2I0eXJlSnJTemwxZW95ZlpHL3pVRjQ1aWtLMVBFUEZYcXpIUGVleUcv?=
 =?utf-8?B?UXljVG5GUVZwb25SZnRDVkY2dEpHNU84NENNTm5qdm9BZlRFOG9qOS8wZzdI?=
 =?utf-8?B?aWVmTEVpbDhBOVNPQUh6SEI4cUw0SUxMOExqV2piQm9rRUR0bjNXbXE5OGw2?=
 =?utf-8?B?dHkyVC9SREVpNm1PRS9oQWVtaDRoNmhjelpWOWlBbWh0bFhEY09naENyTUxz?=
 =?utf-8?B?aUVTcXFHT2tzRjhYekRjelZjWnZsWmlSbW9vVEk1cDF4bzRhV0FhTXRySzNv?=
 =?utf-8?B?WHlDRkdWMkI0QWJDeDVkZ1UvTWVLd3lhYVRlczNUbGh5THR3clJGd2NpYmE5?=
 =?utf-8?B?NTQ0WEt4TS84ZjhHUmVmZVlkdXVpRzlWTVpEdk81b1JvNU55VjZIOUFJdEow?=
 =?utf-8?B?VGgwZzdlSkE2S2JJbG9SMFNYQU4wbG1wZ2hrVS8xOWlhdUxRaHhmOTRmVGRn?=
 =?utf-8?B?N3NWcUQxYm1weGxiRmZkWHhLaGpYT09mM2poeEFCV0RjMU9lcVhrd25xTy8w?=
 =?utf-8?B?a29KdC9kcndVWk9BMlQ4OUVmMDN4Kyt5MTFPb2ZoMDg1VDE1Z1UvQUsyQmNW?=
 =?utf-8?B?cno4VWFwVnB0b2lDWDVWWjlGOHZPZkVvSDhpclo5NUhmalVMYmlHQkJXWnB1?=
 =?utf-8?B?SW9VT2I1L2VMQlNXSy9LbE44bGNhSUdVMW5CR3poTFFFZDVlcDBteXVKWXVj?=
 =?utf-8?B?amVOZkVUZFhtY3ZNaGd0bjlMcWFlbVFTNUpKNVhCK1UrejFNcEUzQlFjYjd3?=
 =?utf-8?B?Sm8rTXNoa256MG9zcDdWNW0yWWZsdEg3ZUIxRy94YmdQLzcybGt5MDlYYmlp?=
 =?utf-8?B?R2FSeHRFZHZJZi9Yc1ZhVTh0OUw1aHYwdENyaXlPUjlkUVcxOFFVWGRWWjV6?=
 =?utf-8?B?NWpUSkZHRHhqQ0pCRnNDSFZVNTVCcVhKZ3JLYzU0Y3A4bVc0L0hJTmlGK092?=
 =?utf-8?B?eHdkakFaNkViMEpLcWpQZnR1d2tDSnhkVHY3eWJ6TGRnUXdmckIxK3pYSm5O?=
 =?utf-8?B?L3FuVHZ4cVFiV3diNnJ5ZjZBbWlMOXR5MGVRaHArME9ZMm9oU1dmeDhsbXNj?=
 =?utf-8?B?OFduZ2o4OEhpTkdXNUtONlh4RUZpdThKR1g3ZjZ4Y1BoUEYvejRrbk1DSjhL?=
 =?utf-8?B?eWR1S3k5RTh5b1ZsbzMra0NBM1NTMnNBaURIWE9YTENGdE1TeWQ2bVMvY3pX?=
 =?utf-8?B?SWRjU24yUGpaeXZ3RDR6b3ZaU1N4T00wSHgwdWI4eHdrMEFrK3NnLy9zZitm?=
 =?utf-8?B?WERGTGphN0VYRkFibDJ1aVlMYlBRUHNUU1hqNk04SXlpaytZc2VEblg1WWJy?=
 =?utf-8?B?NW9vQ0RLNGlVbnZEa2hkbStRUHVCeXpQT2kxVFhla01vZFlkVmdTNkkxRUp4?=
 =?utf-8?B?dFFETlkvelp3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8599.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(19092799006)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0xWL1VoM3FVWVRvWFIrSVhodmRXanBadXc4QjJYaFNpeis4VkthRHJucEg2?=
 =?utf-8?B?dDhUbGdsM3MwRjVoeExQMHNFQ0t4aTdGN1cvYU8yUGpxNDE5QzdpNUFvbEl4?=
 =?utf-8?B?emhDWHprSlp4VG50SVkrTERuMDhGQlVRZms2dWdIY01pa3Z4LzhUeHhpN0N5?=
 =?utf-8?B?RGx2aGh2blRaWWVIQUdZeXAvTi9CdXp1c0VIUFVXN3lzOGpoYmdNczd3TDBK?=
 =?utf-8?B?WmhpcHk3OFhsYXRaakNrS3krc1h0dDczSmpIYjkwZVZQL1YwVk56SVlhd2Jh?=
 =?utf-8?B?OWlkNEg5NzJaRG1tM3dRZjRsTVEzWlQ5N0tYM3hsci9Yc2I1VzBTMzhTZTI4?=
 =?utf-8?B?bFlvTzY2U1lGRjJwZzRwRHQ0N2tIdDBLUFYzTmZqMWdraFhZYUFuMmdZT3Y3?=
 =?utf-8?B?QkcrUVpPRFdGeHdKS05EMjc5ejZDaHI0cmtETTVDMjRodzBlR2VTcnV4TjNy?=
 =?utf-8?B?d1pqTmhlc0hjTE02NGxZNytVejE4RUFTYjZxaGZINjZoYXlhZDRDYU1vdito?=
 =?utf-8?B?KytlYmt6Y3N3eDlSR1c5bzEyS2hoYkJiWnh5YnRnOHZ2bUQ5OU1DVXNMV2Fj?=
 =?utf-8?B?VGFRbHVROExHdlBYcHFSaE9ud0dMcVlZZW5wM3hWZHFIRTBUcnQ1VTBmMW81?=
 =?utf-8?B?KzFRS1VIdTB4dU94Y3U1aUNpTDJTRnd1QW9oTW5zaWV3ZmloNFMyMjhDODZS?=
 =?utf-8?B?SkdHTlp0aVROWGJydzUwSGJhYU9SL05DMERWYVd5NEc1bWxQbEt3Vk9tZTE0?=
 =?utf-8?B?bWlBd0xEYXpvdkJGaHdTbTBSeXVVUkNMQ3l0aG4yVWZEUTFCWWtMTmFDSWZu?=
 =?utf-8?B?QktMQ0R0ZmJEV0J2V0RRa2ZqeXZSS1pKTVNxY2w1akE3ZmptT2VxRE8vVGRu?=
 =?utf-8?B?Umd4NG9ZdXBKdHg1M0RxNGlkSkkvMTYwK2tKWE9wcWprZHIxMUc0YUlzeXV6?=
 =?utf-8?B?RjIrVG5La0Zzb0hka3lBaEo1QlVja0NpaDM5VzAvMEc0cWJnbXE0RTZTMmF6?=
 =?utf-8?B?Nml4Qk1xc1NaKzJjZGpFa09pNjYrWGxvbGswamEzQmYrT2hDRkJOWEVoM2VV?=
 =?utf-8?B?KysvaURvOWpHeUxCT2F1d2JDRGU3NFNHTXNlaFYzT0xDRVgvMitjcm9vSXN6?=
 =?utf-8?B?WHdoYXJiUUZ6bkE5bUdBdHhkeHRRL2ZqSTI1K0IrTzkrRGs2REVvUUxwNERr?=
 =?utf-8?B?RHNMYXdpUG1EZ2trc0t6eW9ybVdtTHdSQ0ZZQVp4YmwxQmRzUlFrcUlKczcz?=
 =?utf-8?B?THJ3MXAxdDEyNjNqK3RIV1pvRDUwbVM2K2JrY0Y5YTROSmlHRXM5d2FDek1v?=
 =?utf-8?B?Z2RZc3A5d0VQanc5SFlJU0NHNmx1ZWdnTXZBVytSMVhFaW5zdDFHblBEL2dr?=
 =?utf-8?B?a05KU3pOU3dySVJzS01aVW9WSHB5SXFZcml0dGFRb0pNWkIxVnZNb3hMSTY4?=
 =?utf-8?B?eGlkS2dPalRCbm1ONDE2WlJLMXBQV3BTa3JJMVoxRGRvTWhXMFI5MCs0WVBQ?=
 =?utf-8?B?bzAxR3hmbFZsalgrakJnNHhFWitNQXlXczBoZWVxSlBOUTdTeXo4ZG1SSVk4?=
 =?utf-8?B?STF5azVhZ0w2YjRvdkJhM1lPRjlTaVhObXVMZUtJQUZnb3Y4QjJUdTFmbCsx?=
 =?utf-8?B?NFdSOWtqZ0hMOWFEeXVqWjlvTVorSFg1TS91Q1BrME1vNTBUWEtQOWtGd1hK?=
 =?utf-8?B?Y2tGeGNhdStxVWxBSGg4cEs1OFBxV25QbFZkeVk4a3AvdWRod2hDTWZSSUgv?=
 =?utf-8?B?MlFBVW9hOWlVeTY3TU9sbVpxTnRnNk1tNkk4TXZFbkRnRUNuWHN3N25SdzZM?=
 =?utf-8?B?cFFTVWhld1Y2cnM2dWoxblVCbzU1TFZzOTRzNXJMR1dYV2c2Tk1yQXkwQ0k4?=
 =?utf-8?B?T2hpTUx5TUY2S1g3aUxpdUxqV0pOSzBjK1F1SVNrVnZEZ3YzT3VxRyt2aXJR?=
 =?utf-8?B?Skd4ZS9TdzhOL05YM0k0c0lwT2lrSmFKdUovOGk3YjFBQUdiT1pJMHcxVDJa?=
 =?utf-8?B?V0dYcUd3M25YeEtxQURFZmVIYU5GTGt0RDlNd05JUUNuWmpMTVpWSXF3RW5I?=
 =?utf-8?B?S3ArOGltWnk1czA4KzJSRUZjVmprMjBBL2RTcVhaaFRJZFh1dU9oSTJKZ0tL?=
 =?utf-8?Q?4prhoJkFeZpCSQLCYEDP+NFDJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be482323-cc06-4922-e71b-08de3e015f0e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8599.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 06:47:54.6042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UN+Ubqhb5ZUNqDI0FCVALkAx4s1wHZRJ/p0MBGePRDu0Ucr0NlNXXa40FfG+HzH4FMdw/xxHsLvUNsivRnQMHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7756

The NXP security hardware IP(s) like: i.MX EdgeLock Enclave, V2X etc.,
creates an embedded secure enclave within the SoC boundary to enable
features like:
- HSM
- SHE
- V2X

Secure-Enclave(s) communication interface are typically via message
unit, i.e., based on mailbox linux kernel driver. This driver enables
communication ensuring well defined message sequence protocol between
Application Core and enclave's firmware.

Driver configures multiple misc-device on the MU, for multiple
user-space applications, to be able to communicate over single MU.

It exists on some i.MX processors. e.g. i.MX8ULP, i.MX93 etc.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/firmware/fsl,imx-se.yaml   | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
new file mode 100644
index 000000000000..fa81adbf9b80
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/fsl,imx-se.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX HW Secure Enclave(s) EdgeLock Enclave
+
+maintainers:
+  - Pankaj Gupta <pankaj.gupta@nxp.com>
+
+description: |
+  NXP's SoC may contain one or multiple embedded secure-enclave HW
+  IP(s) like i.MX EdgeLock Enclave, V2X etc. These NXP's HW IP(s)
+  enables features like
+    - Hardware Security Module (HSM),
+    - Security Hardware Extension (SHE), and
+    - Vehicular to Anything (V2X)
+
+  Communication interface to the secure-enclaves(se) is based on the
+  messaging unit(s).
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8ulp-se-ele-hsm
+      - fsl,imx93-se-ele-hsm
+      - fsl,imx95-se-ele-hsm
+
+  mboxes:
+    items:
+      - description: mailbox phandle to send message to se firmware
+      - description: mailbox phandle to receive message from se firmware
+
+  mbox-names:
+    items:
+      - const: tx
+      - const: rx
+
+  memory-region:
+    maxItems: 1
+
+  sram:
+    maxItems: 1
+
+required:
+  - compatible
+  - mboxes
+  - mbox-names
+
+allOf:
+  # memory-region
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+              - fsl,imx93-se-ele-hsm
+    then:
+      required:
+        - memory-region
+    else:
+      properties:
+        memory-region: false
+
+  # sram
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+    then:
+      required:
+        - sram
+
+    else:
+      properties:
+        sram: false
+
+additionalProperties: false
+
+examples:
+  - |
+    secure-enclave {
+      compatible = "fsl,imx95-se-ele-hsm";
+      mboxes = <&ele_mu0 0 0>, <&ele_mu0 1 0>;
+      mbox-names = "tx", "rx";
+    };
+...

-- 
2.43.0

