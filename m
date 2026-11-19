Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795081157;
	b=04tNP4+uarHekBnInfjE5r33OLojNIJ+zIjGjoVHa/bjVNVBKSrr7PFU+GYlz63OITGW
	 EjC19SZ+E3e6idPwGOAZCxJUN2Y5/PmQNvXHeNiO+JqX0B7FfBkIqS+grlYc+zPWMPyYo
	 1b3Uj/1wjLRTJAsO+8PX95SJYll8xVRCVpDhsLZvxnWXtrDITLcDsPLQIeLfqXAKPX/Hb
	 y+RwPxeqnehPTKeUTkfa//v92i+pd7m4r5yvqqy/37IznGVai+tuz/F5GrOp15v6hQsxS
	 gJxQtIGs8bKZkKsHqHoReYy6vKKG5qBMQtyK0Pmslx9+q83zOzffoXcqfzgmhRJ/0jA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081157;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:X-LD-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=cts4dLYsn8FGH6NTMcBVHYqM+GZNIgB6AoeVN87nofQ=;
	b=Vz1K+EEzKVD4F1N0cVkQ//VvgbHuPf5v4EhPku1Db1vqmu25RGbO226cCman3LPhPMNJ
	 W01F9an/6ra6iXn6YCqfe//A/L34TiILwb8845LD2MCnc+Tnz4cnUApKD1kf9JQgFzcKT
	 8Zhx37T15WySgtzUT3CeXywQc0lKEhYm9gnmZ2AIB9K+dLKvVWz+yCW1Pdwp4xUfXQki/
	 U3LE2QwKAvb0fnawD+1b/lb52dGIqM/o6uPxmu8nwhOuZzmLwfNh3gv1Cse7x7aIHSkdm
	 vfSfMgA8aJno6ZDYcLaBo1R+/oRuLV8OsjjzkT2yG+e0BWupNSjItNuVANVDBxNtfMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=hgUCRl0I;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.17
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011017.outbound.protection.outlook.com [52.101.70.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CBCA606A324
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 09:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CBCA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=hgUCRl0I
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I9mJpV2P1C1ZPZ5CviHi3mek5G0lUc7VuXMYFRjj3hElc6FnrulDI4JCNdHxd77GVcXIEJ8r2jkTGD2ij9mZ3617OiiJeQKOUNfpuuhFwUuXnLXUMsRW5b+iG4oMCIRX8sRjC7DrC5Rf6fHjh5ErWM0IrVYyQy9vZmK9pf/eW1R/Fv9CojxpCXErxt37qXMx4yHKLL2QGVCUU/20pPf9kYZQnqG3FCNgoiimpFgqekWQDrJwsz/ayYF3nOIsFVLyk8PCemNPUAnKx5wKiOZtB7TKTgC3pJYcF+96+LfJSGxD40F7pVA0GT9gHVVaENMgadrePZJqD0J5jn/K8ojQLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cts4dLYsn8FGH6NTMcBVHYqM+GZNIgB6AoeVN87nofQ=;
 b=Vq2TEmWWuAKOoYSijflNaGHhub4YEqqc2w32rYxLr8HIePvppdJb1OM3pJ+mFVtw9f09Ns+cGrVsspEuJDaS0qzCLPPUrtwMtJYtoWh5QRtCMUnz45zHJNBqgD71cuCmOm+XnKoF7BzrsJWQL/JRRvsfo5lT1B12zqiwmaUh4Cw+0QrFcb1EyAe5V2HHouwRo68yTSZKg6wXutgyT6XpLiP9wRObYZtDD1OdxECekL4Tylg1UhGoqfv8LfRRqOIShxMMyHVG6koLJ+vYUjczBBRNN8cIDCR/b8xQbQbP4O2G3+uJY/GrrM9LN9PAUPxfbZ15QnIPUMLzmAx4DT4wAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cts4dLYsn8FGH6NTMcBVHYqM+GZNIgB6AoeVN87nofQ=;
 b=hgUCRl0ILa79DAVgADsPw7EJ4UZQgfMF6ZaYKsrvQjF1OIUj7w037wXhRpLbeIwODmrUtI4vfu0zCA/7a8nim6YrBsUSPVO3Gzdy/S+E6eY63dyC+M+p+3gqOOiv0Rk2lWI6K6be2tRP19y8UuddvPrT/BG+0mmK7oBC/mwZH2wv+lYU3LifrBw40NgLRgaG6YGZoZ20zlvtpZA7z1d88F2GSnXCkkNVVjlc3GU83qskzuJl/IlZiPIaSdO3sradbDzeWpxgumpmrrlAA6PKHLji9ObU3iZJj7i1BrpF6MRASrbExwFFYx3sSZeIdy6irgORD1HY8sbsSh7xGqylDw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com (2603:10a6:150:2c6::8)
 by AS8PR04MB8359.eurprd04.prod.outlook.com (2603:10a6:20b:3b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 09:39:08 +0000
Received: from GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4]) by GVXPR04MB12316.eurprd04.prod.outlook.com
 ([fe80::fc6e:ca22:f065:def4%5]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 09:39:08 +0000
Message-ID: <4a4366e3-a99d-4250-9fb2-c3eb254c06f4@oss.nxp.com>
Date: Thu, 19 Nov 2026 11:42:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] arm64: dts: freescale: imx93-var: Add Cortex-M33
 configurations
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
 Stefano Radaelli <stefano.r@variscite.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
References: <20261119090600.9257-1-stefano.r@variscite.com>
 <be20af64-e729-4d1e-aba1-c8512ac6e775@oss.nxp.com>
 <av7BStmo7w4_rPci@Lord-Beerus.station>
Content-Language: en-US
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
In-Reply-To: <av7BStmo7w4_rPci@Lord-Beerus.station>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P191CA0010.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d5::13) To GVXPR04MB12316.eurprd04.prod.outlook.com
 (2603:10a6:150:2c6::8)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12316:EE_|AS8PR04MB8359:EE_
X-MS-Office365-Filtering-Correlation-Id: d9e8cd8c-f1de-4578-6792-08df4620f58c
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|19092799006|366016|23010399003|56012099006|261022105027099003|261026121527099003|4143699003|11063799006|10067099003|261026140227099003|261028144727099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 mFhuz+wRtjDcG2K4t4g57g4GIghcUamiCLfmbMKKbXcqaCEoGZtGYmUDy41MyQremhdfN7u/sEvBL3TPH/aOsm3C2QTMJeePbSWlrRappqXmC46YOkPKTQL3kQoyiQ33GW4daV1NhQp9DGV90D6UcL9SHXcx1Pqk8QYkXCKFjMktWvGD8p/XdBVQ0cBsMeq5D/Yhf9pFNVTahq1dgIcYwVvNjWkZ4HJdRuIduYKSGY50dB+aG9dN5zbyTvSP70ScSeO3K+3akh5eX/aZUe+8XRDe81owbzYbr9OOQKelGDGjhI+HD19JywmcL7TCUXU4if0BXOo46apH0Scvnln2Rh6XConVIS7Vxdhbx0N6pimBHf6pMHmOK1xXs3y44EIi0j2khIsEp8jece1NvhlfAQYXyzzLLZicnB6KhKt0QGFKOJbCgzsdkV/jazCxtmwbSEa2+c7EhTRWCynkIWFxGZ5LzzYKqmn0ntAEb3UGr5PaJWOZarnn+4hJEwQ9fmRn+l70CSayCqGCYJgbPoCVp7B7BNzOEDJiuFWIErkZOpkKun+KhYWFz4xiU4ArT8ZZIJeUVmsl4YKw5bXKcxKsvRR5zBxW0vCQcdQgFa1xSr7FVOYevutB9M2s8sfSBjR6KujeZWbVsGfEbZNG3qr6etJii9+MVK5yPnhdM6rfFTc=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12316.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(19092799006)(366016)(23010399003)(56012099006)(261022105027099003)(261026121527099003)(4143699003)(11063799006)(10067099003)(261026140227099003)(261028144727099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?R2IxMzVrV29GRS9SVHp0MXhrMDN2RXg3UUVMaG5lVGRvK2NWMVdMTzUvNDRa?=
 =?utf-8?B?SDhKbytzYmVONS9wVDl3OGU2Z2lpRzNpSmlPTDFDOUdUNjRWT3lRTlczZjE1?=
 =?utf-8?B?bzdtc2pubVpRbExoZDNpU0pLTk9VSGZSRVpjWmhUUG8wTEJ3dTk2ZW5iMy9w?=
 =?utf-8?B?ZGRPb0plMWt6RFdYcGhNMGNZejZWdlFwdzVyRFkwOFhLditWbzNEaDZQcnh4?=
 =?utf-8?B?MnBFOHpCdUMyd21mTkd0SHBQOWhvVEovZkVYNkhxTzVnTG9iMXJqcDVndWhp?=
 =?utf-8?B?K2ZwNGJnbEIyR1Vlc2NvdjcvK0VoM25CQ1UwV1lVUGhYRTJDK01ZUDJYbk9z?=
 =?utf-8?B?emxTWjNIaDk2WEVLdE83b1Z0ZDJEbmxDRGtGSWVmK2R0d1lYd1lsRGJOelE5?=
 =?utf-8?B?anBZRk1WbENldU0rVUR6VG51OXJGODREcUZCMlpMTk1hWGZJWnhUN3lLMGVE?=
 =?utf-8?B?YnhWYzdNZHovaUdOdi85UXc4Ri9LWlJHVXByZkZhS1U0N3FFUVpXRDNQZE5u?=
 =?utf-8?B?aGdxcEJQVFRKVnF1RDIwbGp2eHJiVFJuZk1uTUZQRTB0RWpneDRqNTNNRlQr?=
 =?utf-8?B?bmsrRkNpNXhieXRuMWwvczFVVGNNdUg5aWFDaTJ1UmY2UTNVYUJZZHNnb3gw?=
 =?utf-8?B?V1pCZHpOSFZTbkhXbFNpcDBDd2JXbkkrcnVpWDdyUTlnN1M4aUQrV1BXdmIy?=
 =?utf-8?B?V21ZZ1l3dTZMR1dFR1ZyUVN2akJ4OVNoRzhrZ0IrZFcrMDB0VUw2RzNWUmNu?=
 =?utf-8?B?ZUdvMElrWTdWeC9rL21Sdm5VaE02UWFDLzlOTm1TVm82M1UrWXVJYWYyTzZ4?=
 =?utf-8?B?bU9rL0Rudkt1S0VHT1pkUUI2ek0ra2doRTN1SU8xdWdSVHdsV1lXQ3RPa3o4?=
 =?utf-8?B?R3QxQU1VQ0w0YzVRV21CVWRBbnEwcEZlWDhmbkljTzMwSldCdWRtb2xuYXBJ?=
 =?utf-8?B?ekhIK0JUaStpWG1zN3NDM3l6dm5yUkRVODlyY3RMUno2R0xNemFxWEl1eEJJ?=
 =?utf-8?B?TDFYQTVBR2VZcHNVUXZ3cTdjT0drNU5KbnVhNUkxTVVRMGl3ZHZmdHp3Yk1T?=
 =?utf-8?B?RTFMbUNWeUJkSnE0clVST0Y1V0tBRjN4aXhqM0N3SnUxWUlMSUNmM3J2eWxy?=
 =?utf-8?B?R3dOT0xBQlJiNmdiY0JEVkZ0VXhQV0lvKzVsdXNaRFhhVStyc29CYXZQWjNv?=
 =?utf-8?B?cmdnd3hDVTloOER0NHFmbzhhZ3ZRTmVZRU5rN1M1VnZYeUdneU5OcDR5WGZ1?=
 =?utf-8?B?QWt3L3FxQ3ZuN2w2ZldlbkFuci9DVXF2LzM3VlZNeDJPcUduWHZETTlaV1pW?=
 =?utf-8?B?V3pXVzhkYTF6ZTlITzhYd0wrcGI4NUZUTmRTOEpFL21XTU9yN3cwV3VCdlI3?=
 =?utf-8?B?cEpMTElLUFlBUWc5K1FHZ0RrZFcvSlRrcHFwMGR0REZlZWlieDZBMmdvTHMv?=
 =?utf-8?B?WGJSeGY2QWFhajN1ZUN4aS9WL2pHL3RXZDBiNjQ3Z0pUeFdXMDdtYys1Zng4?=
 =?utf-8?B?enQvbWJFK3I4ekM4UUhwd2F3bEExM2ZOVlZrdGoxNmNIMnV5RWtHTHVHcGhk?=
 =?utf-8?B?cXg4bDhEU0txWnJvclFFK0lwa0hvK2w5aHNZbFlFM21vbnV6MWtGeTFNc3p6?=
 =?utf-8?B?dUlGZ1VTSXJOYnRva3NRL1FKdzN3eFI4eU9vWFNvSkRoTGRXQ1h6dFVSMjdl?=
 =?utf-8?B?RzdGd2NNQ2U0aEUvWWlDdm9vVlVrcE5CWEo0aVpGNUJRL053VW1TbGNOV0xH?=
 =?utf-8?B?U1QyS3pvMUwwbnpoOFNKYnpjaTNzRHpaalRYZnMvTWlLMVFPOEwyMUpQeEoy?=
 =?utf-8?B?em5ya2ZaSUV6MTdkZ216SUZyNElmMm8wakhuZjRBSFc1M1ErUE5ZOWdnQlB4?=
 =?utf-8?B?NksvTHV1emhKT3lleFRCTXh1ZmtPRDFnZ1RtdGc0UXYvQWI4ZnUyeGt3WnFQ?=
 =?utf-8?B?MG85enYxcGlBajMvWis2ZEJrZ1AwMW1Sa3UwZG5DSi9zRGZQeXMzRnVhYysx?=
 =?utf-8?B?djArQzk5MnF3UUlwN3RuS2dxM25BOFFpUEZKZnpyUVdPVkkxTEFQb0NqUmF5?=
 =?utf-8?B?T1FLSTJDdW5ZUjEzWEs3NytvSG4xb2dXUlg1bGo4UkUzdXlXdEFlUWdMNHVB?=
 =?utf-8?B?VEw5WWUwQXNsaGlFTUJyOGkyaFg1bGZZV1JJZmtiZ1RXSTFwTVdidDZHODRC?=
 =?utf-8?B?LzgwV2FqMjdyczFCc1V5Mk8rcEszMThvTTZ6TEFhNUxRK0FTcEdZY0Jwdndj?=
 =?utf-8?B?Zk5TQmR3Uno5TVNjOVRKSnYya2tLbCsyVFZFeCs4SmoydHVRTW9mLy9NZG03?=
 =?utf-8?B?Y0NuNDhZRlR3YTNkRFdvalBEcEpkNGpjOHYyd1o4b1FXV0hWRHZGUT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e8cd8c-f1de-4578-6792-08df4620f58c
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12316.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 09:39:08.3650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7nmTWQClQFtYY+4xp5LCbUE25wYDSB2bJG/KwL2C42l5VhxBfsdMubb1OVYv8U0Nd+o5yGc3IZ2TzUpQQwGu9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8359

On 11/19/26 11:28, Stefano Radaelli wrote:
> On Thu, Nov 19, 2026 at 11:18:45AM +0200, Daniel Baluta wrote:
>>
>> Use "reserved" instead of "disabled" for all the nodes that need not to probe
>> on the Application processor because they are used by the M33 FW.
>>
>> Also, instead of disable in the commit message I think it is better to say "reserve".
>>
> 
> Hi Daniel,
> 
> That makes sense, thank you for your review!
> 
> I'll use "reserved" for the peripherals used directly by the Cortex-M
> firmware, and keep "disabled" for devices that become unavailable as a
> consequence.
> For example, Wi-Fi cannot use its reset GPIO because GPIO4 is reserved
> for the M33.
> 
> Does that match what you had in mind?
Yes, that make sense. I wonder if it is a good idea to split this patch
into multiple patches each one representing a logical change.

The commit message suggests a lot of activities going on with the code which
makes it harder to understand. Either approach is fine tough, as the changes are not that big.
