Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013051.outbound.protection.outlook.com [40.107.159.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B36F2C1786
	for <imx@lists.linux.dev>; Fri, 19 Dec 2025 05:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766121719; cv=fail; b=JM5vfpap4+sUh+/ZQxQcXaVkjAOZgFErNpDB7hsm/DELv80k8k6268n+PLuwZwDKX1HD/MdH7CJHIdNvC79zjBfnbW0hz5pqR3XP3RxP03Dpau57tAgkAyDsV/mn7ZOdV+Dr997A+blEShMZe0ZkY3Vfmd+ne9KocHkoP+ELIKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766121719; c=relaxed/simple;
	bh=tOtSXomq2KH+8clEacb9RWYs1iYcwyaRAGNdBtHVSY4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=V4FkH/Y6tnqbdw/GpHtA44OrcZcQYL3YyihLSw+wBAJpyoDCkfG8zceZ9g7ofIywDym44t/ntakltCEEx2O1qDLgiRNDWBZ8M86zBuYNPpFCvwLcLYtzt882HCMG6haOqSJ1wCOA0l3Zq0NsirC78tPmGm0uol/vxxzz0grttEM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=X0zKRL7I; arc=fail smtp.client-ip=40.107.159.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="X0zKRL7I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ApL/qXj5AQfhwwFO4Ntx2T2yA59myKxKg91GsLq//xbpTb+YjhpfMprIk5X6j7WnfZqdCncVuynkZyuUcfo1ys7EM2vC8QHhlwhFuro9H9yTE/xrMDEJ2Py4TXkORAqflo+iLOkD+lY8z2YEWCJ1WFTGT26Gc8t6aYS61uA+oQQ7Hz2+wwY9Uu7jGV3N7p3/VAHrPQDk0GUZTfcbUwOjYS7Mcb+eodNHEvnh054AsKd3pvu/tV+7UdtPuGdlpeoXU+hc/qqH3ydQTvE/Wmg2SmRZEsmnCjOn5Gj37RcjmEZA76GRm/N1LWVJIsNk4Ba/iapCuGf1I0c87CEo8e1Ahw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9LQ6U97DJmOvAnP/Hm3/sLsl0YOZft52i2nAtpwopw=;
 b=PONSeZobWkf6YyIdDdHczTVyjOj2Ngn2wT2T5SnnnR9jj3e2BvJRaWolJEIz8EWCHUVywPloUvcUlVZGEgsMmFNawd0x6hvf7wSAtu/rI8ilR/ejx07bjkYONluYJSPLn9uvelnWedxtq685x/ipS3DeuLtYt2Bh5FcZYIOB5T3RO8JHMSecGGHX0oJeYTjDC27EL82gR2jDl+kZnFC/l9Z7eUSlBYACbEkfd9q4wW2+F94koOPF9NfOI1G7/qzxvhGaZKLPQinX5tFXq1G3f7P7X03C+0m//w1kQdtlTk0jEkHN14Tu5kpNqdvqqfKgIOl4ORm5cbnboeGNu0T1Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q9LQ6U97DJmOvAnP/Hm3/sLsl0YOZft52i2nAtpwopw=;
 b=X0zKRL7IR4i0CMs5c95kPbQPQnoQZDhK8yfhFRRSwijzKqLYmNL0NwktBABDEU45NPmirjAHOZjOLdUdeTtpfmyPE9fNxV9gI0Po0c7vtT5qKJdh/5ygfL1zNj6HIR3Y4py2FbkjXn1fkRaN5dbR9wJMqWvrwTsb+QDnTKxIbEY5L8bCGwB38mvwN8lffTPM+qLjvz7CMX85qTOMySp91LzJgTygVQrD9oFDJsZNWano1hCVCfmUuBvVAi8UQ6Z0jd+UP/5H7/SqEtUGilJWNSmcDJThSSD8uj4kE6QYhrfs85oMzleTDmYlOAFrMPf4ZbDvoUxSGNciadug6vgahA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by AS8PR04MB9062.eurprd04.prod.outlook.com (2603:10a6:20b:445::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Fri, 19 Dec
 2025 05:21:55 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%3]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 05:21:55 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Fri, 19 Dec 2025 10:50:40 +0530
Subject: [PATCH v23 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-imx-se-if-v23-2-5c6773d00318@nxp.com>
References: <20251219-imx-se-if-v23-0-5c6773d00318@nxp.com>
In-Reply-To: <20251219-imx-se-if-v23-0-5c6773d00318@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766121652; l=3201;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=tOtSXomq2KH+8clEacb9RWYs1iYcwyaRAGNdBtHVSY4=;
 b=ADnIgQq1hFqaOVsFU/UWovHlgj6hHviiMrhCsL/xIA62p66qvOB8t8O4jpeV/oAdyQwkNc3+B
 dWdQW0NLPv/CgpzTSkYfqXr8FXG3kKSk0IU7li6oyflEx3XJGvNuV1i
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SG2PR04CA0200.apcprd04.prod.outlook.com
 (2603:1096:4:187::15) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|AS8PR04MB9062:EE_
X-MS-Office365-Filtering-Correlation-Id: c32b983e-f2e7-4b19-f852-08de3ebe867f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|7416014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V0VTenNjeGpDckxxUlMrZjJnNU1vY0JKQitpSi9zWFpsclhxNFNMU3VaQy9T?=
 =?utf-8?B?UFliemdTNXE2L3MxQVZUMEVBN0xZdzBHbWxKcUlWZ2tpclVrQ0JYSmh2K2Nl?=
 =?utf-8?B?U0pOUjA0QkJZR241U0RQaFhHaitaYWtVb0lGb2xRL3VRZURIbkZreHJ6M3FS?=
 =?utf-8?B?QWdpWE9RbnY5aDhnc1luYjBkM2l1Q1NIbEtNMnR4d2lLZ3ZKV2JLTzhlbTVR?=
 =?utf-8?B?WXRFeFZmdWN1UUJXQmtsT3VKRFJqT0d0QjdHbEF0cXp5VnBiN1Y4cFo2bElW?=
 =?utf-8?B?ajhFK0plaGxoY0pSZkkwS1J5aGplUTk2Q1NrY1lMVzVQaUIyd2tOdWhhZ045?=
 =?utf-8?B?QUFKblFDTjRCK0FkOG5CMEV0VWtrQzFRZy81TThPaDJBQ1R6U2xrcWJpUUh1?=
 =?utf-8?B?aGc2eDNiWUVRZStJOEcyVGtMMGZacEZiWE9VWk83YVVwSm1nbEdSazF5dTRw?=
 =?utf-8?B?YTRrcDRpdFhrNUFxdjl1Q1ZDT21hQWlQVCtJS25xc2VPMlhXNWZOZnBaRllt?=
 =?utf-8?B?YlZSSmk4empybGRzNWFoenB3NC9FUFM1WjdsOEdXMzVMRmN3aG1IZllSRzZw?=
 =?utf-8?B?Tm1xMUVpOFZOYjNHWkJSTkpGdlFYZFlldStRK0J6RGFESCtmZ3BnQjNjTGcw?=
 =?utf-8?B?bTRsTTY0RGY3Tmo2eEpYVVlVR2ZPSy9NWWxEek1Ebmk3cjBaajdNN0twN1B4?=
 =?utf-8?B?WkhPeFdCbWxabTNiU2JsNElkYjZmdmpia0tRT1Z1RUR2UUZ0U3NhS3lzQlpI?=
 =?utf-8?B?Q1oyRDA1QUJ3ZUlyUlZGL1RFdVN2VlBoQWxRSmM1WllwVXJHZ045QXRWQ0dO?=
 =?utf-8?B?RXR4Rjl0SDBYWFZMcHpVT2N4RGk4SDNmL09tWlRrQ2RxYU9PZHJxR3dmbzJq?=
 =?utf-8?B?MGJmS1BNRU9IQzJ3VnoxajRoYTNZTng0M3dhb09OelkrZTNWeEcwSk5VSXJF?=
 =?utf-8?B?UFA3K3ZqNERMNzdBcXN2ZVY0QUhZR1dxNHZFY08vdDd4anFyOGdJcFE1MW9i?=
 =?utf-8?B?Q01kTGo0ZTBzSUFCcjZIbVI4TDdtVWo5Vi83UzNCelV3dzZ6VGZndEQrbU5Q?=
 =?utf-8?B?VVVKc3Rsb3dNR2t2ajc2aDd5Mk9GWmxzQWJNNGpiK2FiVW44V3UzZTlUMGpM?=
 =?utf-8?B?RGdLMkk5Y1BXT1JwNm5LZFduK2IzOWM2SWs3R1lPdStRZFhXd0VWa2dHYWhx?=
 =?utf-8?B?ZFZ5Zk9mbjk2MUNhSHB1TWdpUllneTg0a29NK3JIRWJhNGtnRVBmK2ZoZFNj?=
 =?utf-8?B?dnNuMi9VVzNiSlRKSVdCV3h1STVNVFNCdE9pRExnN2FFeFJmOEdJd0JMSHdZ?=
 =?utf-8?B?RE5YSGdTVm14SEJkR3c0T25JUWM2cDJ1b1FnUHlHMVA3aGJnNXc0ajNKMkxT?=
 =?utf-8?B?TksreWVLQVhxc3NwMERuc1VYeXgrWmo4RkNOK1doY09UbWc4ZllVeVNKbDB1?=
 =?utf-8?B?MkF5bFBYd0drK0FpYmpvS0I0SXhxRmVTTVZoc1FjQU9tNktMMnVuczRaME93?=
 =?utf-8?B?RWtKc1FjczM3a0crbDRKRERNckQ3bDVvNDlmV2RzMXd1R3BBaFk4WUc2R2tT?=
 =?utf-8?B?WlRKc2VZcmFPUVFqR3ZoV0M3WGRRMmlCNkN4SGUwbmVkYVBkamY5ZlZmYTVU?=
 =?utf-8?B?QlU2MlNpd0U1TXE0WEpzalZmVVFDWmVuekwzRXR3cGFxdkl0aXF4ZXFCcXNw?=
 =?utf-8?B?d1c2WTlxcDFHK1Z4MUZuQUViR0x5azdGNzVHTkhMSHRSTGcwNUdITzdOYlRR?=
 =?utf-8?B?OHNmS1RkVmgwakdmNVdqSE1LemxidGVvK3BCN3hyRm9iOTVvb3pEU1VicnQv?=
 =?utf-8?B?UnNnMzRwYVhObzJ1MWxBaXMzMi9qd1JPTWFxaXZHV25nNmUwNGkrbk1BTDd1?=
 =?utf-8?B?a0hoZGN1WWJhTEU5KzBINXF3cUZNcnRnWnV4L1NNcGU1cktMYVFBRFJXblA1?=
 =?utf-8?B?SnFtNDJpazBub3V1OEtwbzFLZHNsalk3Z012ekdTUlZRTkk2TEZEeGY3NVla?=
 =?utf-8?B?UmVSZDR5OUxBPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(7416014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDZOYWluYTdvUHlad2JBdUpaM2tWT3hsOE1ZeTRad2NTMllZTmdIMktLS0lU?=
 =?utf-8?B?ZVVwUjAwd2lCR0xxajVNSmQ3cW42SVBjOHZFdHhZMGxuSE0xeWQzb01CNVlB?=
 =?utf-8?B?ZWF6Q0ZYTEYxVzkrMUVsNTNsZzdsVmZqTVBHZTdwdnJKK3ptWWx5QzJpVWo1?=
 =?utf-8?B?eE14NFFwOW8wK3d5SFpFZVZGZHp5OTJqUXUvMDVzM3dMK3U1U3lSQXJPbmJs?=
 =?utf-8?B?eUVFeVRLRmlveGMzd2twc3hQM0R1dUZXVUNvUUVjR09hdEpyaGVId0dtTytj?=
 =?utf-8?B?VWtRYldMRHFPS29kZW5BMmVFUEZZMDhUUmhZRXpKb3ZWTG1CbS9sSU5wcytt?=
 =?utf-8?B?NzBkR05ZWTlsU0p0THpYRnRiMmJLdTJnYVNuc1RXSnNTTWppbVFMaVpxSWNr?=
 =?utf-8?B?dS83OWNWci9ncEtJdU9KYldOSnRSblpyQm95Z2NNeDdmY0ZuMHh1YXdxUjk1?=
 =?utf-8?B?aFphdnZ2clRmbXNrS2hxMDlLbi8xODJzYnErV2pTdzRUeEY5SDRBNDBDTUgw?=
 =?utf-8?B?STYySWdpcFBocjBObzYwcWs2MWxVbit4RURoVjhUY1RrWE5TMDQ5SlVyVkgx?=
 =?utf-8?B?TFI2QUhJZlExRXQ4dGNxaHVOQ2YwV2ZoRjJnR2hmRkFEbldXR3JuMnlNUDJQ?=
 =?utf-8?B?YzRTV0VuN09rUmlTajVhZTlDMjBHWnFVeTdpR3UzMUFidEI3UjNMcTlReEp5?=
 =?utf-8?B?RDZnYk9RZzczeXdGTjBVWGhPd3J6bzFZeEliTDZtNndwdDVBRHF2cFQ1WWxi?=
 =?utf-8?B?bTJTSHJLS0tGTThLRFVjQUtOVmFyS1NYWklZSC9WT080WlpyWUdBUDNvc3Jo?=
 =?utf-8?B?MDgzNEFYdk50WmdUVmdIVzV2dURrQXRnUVJoUnBidWs1Si9DMzJkcldDRWtT?=
 =?utf-8?B?QjdjNE0rbUN1ZVREb3dnaVZUNy9uWEl3d1lrM1J1MzF0RFFTbGRIeXpMdlVm?=
 =?utf-8?B?Mi9vNkVEV2VhbTRNWjBkMUEydG9GMTJoNU5kVmZ1dUt0Z1N6RWVqSC9zZTdI?=
 =?utf-8?B?QTYzOS9nd3ZrRXpESnAyUWkyd2ZUdno1UVo3Qkk3MWZ1MEhkM2tiOHhMU3Fz?=
 =?utf-8?B?UVREN2F3SUFtb2t5dHlZdFBhUGV0OU1GLy91Wkc2L1dxTzR5NDFTREJVNTJI?=
 =?utf-8?B?dUJyVElPTkJpR2FxalpUYjFDWWpuRmxjc0ViUXZRVWxRSHVUeW9mamlhcFRi?=
 =?utf-8?B?UnNteWZ1bE8vMEhSaTFzRlRsQzBsMityQVpCTk9IZHlQNTRHSTUwejJHMFht?=
 =?utf-8?B?b3VDSTdqZG1BRjJNOEdnUDAvb0JPQmxWUkVIbmpaL2JXQ3hScCtWTmdZcTJs?=
 =?utf-8?B?Rzk2Vk04VVU5VDh3SVhaVncwK1UrVlZGTzhrOXdoMHRwR0tOSmZMd0ZKcnhQ?=
 =?utf-8?B?TmRlOE5QTDdOcWJDOVBLR2krY3g3bTFjd3JQc1RYVS9BMExld2I0R29kS0ky?=
 =?utf-8?B?VWsxbGdnbFJHTHNLVlpITUg3bVU3MzNqbmR3ZXltV0cxTVlXOGNzMGNtRUJw?=
 =?utf-8?B?ZThuRURUWE80SmsyWG1EbzNhc0QzK0VLSFhpeERYS0pGWFlMcXdVT0hTRW5u?=
 =?utf-8?B?QnRGUGViVDFkUGlNS0VuNVAyRHlLbUxuV0NxWkVrMVNTb1V6cHR1N3BES3d1?=
 =?utf-8?B?bTlCOHpoRGFERnRKVDMydjdQZWhKVDJxKzQxRnBRN0E2Q1NyRitDU1ZMamhy?=
 =?utf-8?B?TXVrZzZ5M3I4MFlBZTUzN1ErSTJvWmExZjdhcHp4K052VFBVdTdiZ1dkUVo4?=
 =?utf-8?B?YW5nUzk5cmNhMHQ4NEhoL3JRL2ltd2ZlcWQvWTJEV25RUjhNNUNienVBYjZv?=
 =?utf-8?B?dlRRVWJFdEJML0cxRWpsT0RUZ1NhbWRtVHF1N3grSy9jTE5RVEgxQ2FYUGE0?=
 =?utf-8?B?T2Ewamo4eHptODZYUUx6VGpWZ0x2aVlUdU0wQWVkaldCYlpiUStUWGIwbkR2?=
 =?utf-8?B?MXVSNkNSZEZNRytsSkw2M2RWRUlScUt3SXMvUDFCQ29RemZJVmprZjNla016?=
 =?utf-8?B?NHc3bnBscmp2UXNsRzQvcEpPdjEwbzIyYThiWi9MaDdmZ01YNytkRVhqSnR6?=
 =?utf-8?B?N0NXYUJpaWJleDlBL0pMekxGK2dDN21MSEpnUTloYlY1ZDFhSDZ6cCswME9K?=
 =?utf-8?Q?6Trn51zQP9M3fYlCugKnrEKj1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c32b983e-f2e7-4b19-f852-08de3ebe867f
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 05:21:55.5733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fHOOMw0stE8kieOcmghAVIZqOK72NgooV/xEBtQfaeeBYuxZfIlb9KaOkkV49qoIoK+A8vadTLPiTDe+siFajA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9062

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

