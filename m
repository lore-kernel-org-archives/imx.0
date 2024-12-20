Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2060.outbound.protection.outlook.com [40.107.22.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF313FB3B
	for <imx@lists.linux.dev>; Fri, 20 Dec 2024 16:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734710559; cv=fail; b=LwxEQrc0QffkiN3DRdoudVIXlEKK1bL8W4cwrdRc+fi0T9zfDswyV//6pG1A76gl7Y7AsIcMjt+T0F3wh7FqITpO2TaNO3JRxknPJD87h/7GY3zdOXEJ5Fh+gIAeEMlSytNSqLM53+roeFx97WPUaa1UMq7DCcefClJdApoqrWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734710559; c=relaxed/simple;
	bh=seDL3KAi0NyNCoc9iFYPePYPeLGuB1P2MnKnE37z74s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=imh7mib2c55xFLZaUjMGdPzjgCrY0+U+aYDwR/BMF1DshdN3Cv8FEdS5ebch5LBYnb2W9Ow0edLykGrFz3pKL7k4V5PGSduKc2SkV+1TleKyjW/HprinYERM0dlyjLTSVtVTpsdP3RRVCul3ZAkZ7xB0qzgT2tpyHvTFRY36ca4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=nwiWqoMH; arc=fail smtp.client-ip=40.107.22.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="nwiWqoMH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BNT4erDJ+DLF595ZdGD695HFkoGfHWzb3lQeTpOd1r+CZa6kN14Wa1h6QpIv4cEKKJbapQLyK/KiZKdWkdbZX2KKgAzz0GaRWhLHdmRLNLDekDli+4MZslBv5V7tvDX0aShr9b2fN7oFkPZZzOX1+3QZEimcxyGLvWa9a1MbJxmm+pdpK7I08R3baOwotE/BUQ3gf6TCUCxfq0rz4uwMavuXDRMEbrXSJjyQeZpUm46pifxX3BIIzmNUbmnzGsesw9aceUX795lROqMtB6SygJnYELraNdaaTh8cZ+9/hdGWrdhnlZHPW6J3ehsu0nLUf65LOePbEvTinWqcgu6kpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecxJGO67NOlwppXZ5iyvN9h3Aj7hitbfF+FgIu3j23g=;
 b=ltXW42JhCIuv5IfgpvT66yKf4UiohAeuS446V8tjRspUoyPSg/8H99+1RV6t5udytls6j3UPUddzzQd2Clab+v45g6n9WypnTnqk3WTwG2DHHuBOh20mvtGKIFvP3lnAfOtgx/i1YNEwGk6k66Hf3yEuV+fqv6JnWL92I+uXFL0aZHSCQujAbX8Q/XaqTkuLY6WPSDMklZY5vANkJuX4st9XCWVpaG/vxV2ohfXAos2GaCRPuKFe/D24rd3qjoGeIG21Bz2M6L4AiQVzJD3U9MjkVNdGO0IrU58CiIzWGC/0psvv09FvGeje5Gf49qvn6agNTKpae6LUlo8gaeFnMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ecxJGO67NOlwppXZ5iyvN9h3Aj7hitbfF+FgIu3j23g=;
 b=nwiWqoMHmcy/iUo0DTU7EPbXYmEtCRvMxI1F1oXDfGUX3TuWtj1Z/y5jofRqZN7lZvU0mouUHzJ2ED9lJAYqnhUUoQ2ld8LQq52CWtp2BfMgdd6AqZEnhtdhFndAIVozEeNE5mmeGbeJTT2dixyaLRVnqGkouLwxGOfIP13jTLVkbGg7SKIReQKdk0LAdscSNDqMSxktI9jzg8XtujWto0y7J1JdE/lOdRouH/qofrcDb2SNUFjMjswACh7AzQLhHYXwFX9oKQbFXf+e/pagreQqigViwrsLuVD4fAGMDoAbtpkIepfq2E6Rhl69HUQsS5fK/BLjMvuCahPCOmpZxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB8PR04MB7036.eurprd04.prod.outlook.com (2603:10a6:10:12f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 16:02:30 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 16:02:30 +0000
Date: Fri, 20 Dec 2024 11:02:19 -0500
From: Frank Li <Frank.li@nxp.com>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>, Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>
Subject: Re: [PATCH v4 2/4] arm64: dts: s32g: add common 'S32G-EVB' and
 'S32G-RDB' board support
Message-ID: <Z2WVCyJbJTpU/FrY@lizhi-Precision-Tower-5810>
References: <20241220123916.1452582-1-ciprianmarian.costea@oss.nxp.com>
 <20241220123916.1452582-3-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241220123916.1452582-3-ciprianmarian.costea@oss.nxp.com>
X-ClientProxiedBy: SJ0PR03CA0348.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::23) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB8PR04MB7036:EE_
X-MS-Office365-Filtering-Correlation-Id: aeac43af-b6ce-463d-011f-08dd210fb4c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K25yTlRTUmtFalhMd2FGOEdOdGNJTEhyVFRIWlp3b2FWOEQrTkdxYWlsWkd0?=
 =?utf-8?B?TUtHa3lBRVprZU5tNVhoelAreVBOMEpHTFRZQ3BwL0VYRGtXV0xhd3E2cWRk?=
 =?utf-8?B?T0ZFWHZ2Q2hzaFJFb0Z0S0gwR3QzSHNRR0VsZ0UyWXR1UDJMaUpvVStDQzho?=
 =?utf-8?B?VmF0WDlZSG9aZHNxMTR5ZFA3anphS0FQZFJOR1ZJMUREeXoySjFBbjdIUGpR?=
 =?utf-8?B?eEJBc2p1RGwwVVNKVm1JN05XZlhVSFhhUHRFN1RhUkNiVnpORGZyZUpWMHFx?=
 =?utf-8?B?TUFMclRSWk4rSHJ5ZEs5cXRLdGhJWFl2c1phUUJSM1BYOHlkUlZjWFlzWjRU?=
 =?utf-8?B?QlkwOFFmWGY1ZjllSHA5U2xCLzBSUExFSGpPQzE5bE1waGZFeXAvd2EvWVpa?=
 =?utf-8?B?QXVNYUFEOW9WTFlpSnk4SWtSeGcrVGYyN1NlY2dZdWJMc3M4eFBWS3grVnRu?=
 =?utf-8?B?UFBIQkMzdzFpZXpWRktFRmRoVFR4bDNDZ2o5TzF6SEJGNmNSaHNlWDRuanZ3?=
 =?utf-8?B?dnJxUldXeE84bDJ1N0pTY2JXN1ZqZEFncGVrUGEvQ3AyL3FqY0hMdWpna21L?=
 =?utf-8?B?amRNQVpGbEJDQkRMRW1acGpMdE5UaVlyRTdzMXVHNGhzMjFnaStFNTJmNXRi?=
 =?utf-8?B?aThlMk5waE9KSjFFQTBVcmNHc0xRVWxVc0h3RUJDU0ZKSEpqaWFkQWhTZUR0?=
 =?utf-8?B?anlXWXZFdnpDY2JOTUpxa3Yyd3BVTzN5dzgyR01kd1gyK0VjaWEvYk1wei8y?=
 =?utf-8?B?cURLU2hXTE5OYWNENU9NZy9vR0hLSHMzRXZ3bVhuZ0p2NHVCOTFpb205MWdn?=
 =?utf-8?B?d1YzS2NJM0E4OWZCMFZLZ05pR0k5bnFIVGk5UlBOUUd1MXYzM1JHV3RWQnVQ?=
 =?utf-8?B?YUJ5dWFIdFVydHU4R0JYZUNtR0IvTWY0czdETFJZcnFFSnBPZmJTY2NZSzQv?=
 =?utf-8?B?Qm4wOHpiK2ZjL0h0UVk1UEloODBHUDV2YjR2dU1oU3VLOTJSYnVKNXVwVUlt?=
 =?utf-8?B?aC9mRmczTVdvbEdIR1U1elkzSnRNck9jbHdGZzBieUhwQmtUcStrMSs2R0Fk?=
 =?utf-8?B?cDF4dFVWWVJQcHAwT0tvTm13bEEwUGR2RVVnWFdoQVFtOHc2ek8ydWt3OStH?=
 =?utf-8?B?RHdQZThtbEpTWVMwdC83N2VwRHlxbFNKZXVTV1NmQ1ZVWlU1dWV4Z25DaU5W?=
 =?utf-8?B?MG1PNmxwYXkyS2hvTmhRbU9ZNHdqVGpzb1kxK3E3TTVIKzNKTThYZXh6emJE?=
 =?utf-8?B?RHV6NEVsS0g1SjI4c0JzOElkSXRLSE9tMFhUUmxWa3ZBL3paSHdjT1R3ZFRo?=
 =?utf-8?B?akY5UzZhd0U1WWVJWGtaU2tuN2Rnd1lNeVBzd1FwK3lCU3lUckpTQlE2NVE4?=
 =?utf-8?B?TTQ4VlNRL1FwRDlEVzZaZG9ZSDFNYTZzZ1g2U3cyY2FTSzJrNWUybEFmT2J4?=
 =?utf-8?B?YUlsT1NHbnpqa2R6ZlZVeHB0UDJYOGZYQUYrNlh0YjFWYmpHVjgwdURCVHE1?=
 =?utf-8?B?L3RYVWJnRlBrdTFQSW5mTjZYTERrZVFTQlJtaU9wdjVsWm5RaFg3ZUlRMHB6?=
 =?utf-8?B?N3I0YzFBVnBHS0VRM0daN29jNHluMStoSmkvOGpMdlZFNU8zOHBoSlVsNmts?=
 =?utf-8?B?cXVsMnMrVWZhSy9yaUlsenFHRzRadWhhZ2NFdmhlRmZtbk1nQjVsT1ZEZFJW?=
 =?utf-8?B?c244UFBSR25QdWttOS83YVR2bVZFT2dya3dKNTc0YkVZUUF4ZGUwTHdCL2FU?=
 =?utf-8?B?TVlwSDBILzRscWRENzVTWTFjS2dNOEpXdEdJSE9velp0UGcwU3VSNmRlbWl2?=
 =?utf-8?B?YmNCTDVva216d3RGQUNjYTNTbHd3ZVRra1laenhscWJFcXltY3FlQ0Q1SlY4?=
 =?utf-8?B?Uy9EZTkzSFFZNXA5a2hPbFdLbWllYVBLbHdSU1ZVRDBiRnRRYVZSNXRpZklC?=
 =?utf-8?Q?te2ml9SAKfJSc5vwCmkiQZnI0mot0W2P?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVpqWUREaHNTb2VYRUx5Uk9kb0pRYjJ4RS9ZbzlGYm5Va3hLcDg4eVBzV0dN?=
 =?utf-8?B?YjlOS0lYamhPK1JWOGtCY1J4Y3Jsd3ArMEZ0bnRhdFlrb0ppcEZuYzFlcnlJ?=
 =?utf-8?B?d1phK0JGQkhQSDMrVjhkejRNN3RKMG50RnJPVHNwMTkxUHRCNXZoOWNIYUxK?=
 =?utf-8?B?VUl5RkRYT2hYTDl5cWQvV0dXcHlocVVSeGRBMGtvaU9BVTEyb3doV28rajUy?=
 =?utf-8?B?VjJEVTh3KzdmcDlBMmtrWmFOM3FRRnpQM3AzN3JZdCszTTJISzJzdHRlSXFV?=
 =?utf-8?B?WU1ZTmZaOTZhQ0c2c1VSZ1lHa1JnTFE5WHkxdTNOWi9VN25WNXZwLzg0Y0tL?=
 =?utf-8?B?UVRibG9sNFF4TWNEalZNd1pBWUdUQXhRZllZdGVJU2JwZmR6djZNeDl0Yi9H?=
 =?utf-8?B?Ni9CMEY3bEJjUGJFRHBQN0ZuU3F1dmZtMGYrYWtDOXl0RDl2MjFmTEtnYWZU?=
 =?utf-8?B?VUpadTBKM1hFMG5QVWIvVkticlE2S3NuZ3hqWm5WWklZakdRSDd2Mmd1Rngv?=
 =?utf-8?B?SDBJbGZtc1owWnd4Sm9YTExEWWMweXhaY1F5QUhSRk1ydFZrNWlSZXRGZTQ1?=
 =?utf-8?B?ODZXdTQvV1JLcXpRL2h4QnNxcjFnOTJUNndkbFVVb25wVUNrbENabWV2cTE4?=
 =?utf-8?B?ZzFKUjBKOHpEQWFmVEVtVnY1MWdSMjdoZVVXOW4zQUtSVGlMZWNjLzRDeGU5?=
 =?utf-8?B?d0M0ZUtsQUpydHRuNDZCWnNmNG5IT1BnRGlqWS9BdWlnNjltdkJrMmFYTjF2?=
 =?utf-8?B?c3JWQTlyL1FyZUlIUTBTY1ovN2dxU1ZaUEdSQmVsZHd2TnBNRGVYOFAvMysy?=
 =?utf-8?B?UnZUUzZyYm5mZWZ3dnpJTC9tbnVtTUJYelllejlmaEZBczNSRm91dytnOUtY?=
 =?utf-8?B?KzhSaHFjYUc2bHFRVTJjSjVsSHRHNXluZm5ZMkZzV2ZrS2FwNllXMFBQOG1G?=
 =?utf-8?B?YnA1SGd6Zzg3ZnNZUTlFQlhJQTlSSThQdjJmaEJTdDc4Qi9URmNzN0tnc2tX?=
 =?utf-8?B?bmFibmk2N1p0aXVITzRTNkpDSjFZN05wamlNdmg5ZEwrRkJWcUZSNTZJTS9W?=
 =?utf-8?B?YUUwMDNSUFdvd3BUVDJWam1JcG1hUHFBMDl5WGtlVFkxRkJZTUh6RG9NWnIz?=
 =?utf-8?B?UXc5R1dTandPT0h5MWFOc3JYY3U4aUFqU2RSeFB4VVVNdlVzOWd1RWI3YlBy?=
 =?utf-8?B?bFlJQTgxbmZ6cTdsSS9McUtjQ0wvYjVqdlpzSVRoMWtIWE5OOThDQWI5aGtR?=
 =?utf-8?B?dFBLR1pYOEhFTys3NHpzVDBDS2MxZndmSHh4RjdQS0xNL3FTM1Vic0s1MlYy?=
 =?utf-8?B?VEZyV2tTQjMrNWlRTmt2Mk5ya28xNTY1c3ZzU2lqeWlFYUNPSjNCTzZ5MzZa?=
 =?utf-8?B?QVFEUXluaTYrbG5VZHdjU1BOY3BJQmw5Y3pBTWhQaVFFdURTOEdqc3pOenFR?=
 =?utf-8?B?bDFDQ1pXTmwwVTAwak9Jd0tDS3FYUkFSNko3enJMUzZnek9VOFU0N1FQTTRL?=
 =?utf-8?B?ZHVaUTVXNU8yZlh2T3pKcVY0OW1oMmtXQlBsajZlZVlOZVVTdEdIZGZYUXVq?=
 =?utf-8?B?OXdUUERJUkprOW5OSlBlNVhtZ2ZEdllWT3Y4ODIyU1JNeTcvb2ppQ21yQXlO?=
 =?utf-8?B?bkU2MkF0cVJHUmQzV3B6OGxsNDVrZ3RZNXRvTEJHbWp0RWVyWlpzUEF0endR?=
 =?utf-8?B?bllMRk9xUzBIZVErMVVsbkJYUW4veTIrUTZjbEFLRUJ1NytYNlpZR3BKN203?=
 =?utf-8?B?WnVEYjJ1U3U2TE9hMkdlQ3g1UjNyTHc4NnZSOVF0Q3BYaUVSRC9SNGErUWNO?=
 =?utf-8?B?RUpDa2krNDFPUWZSY2tRMWd2c01GdUw5MzVtbSttRCtIZWo5MUQ1UVhaZGxB?=
 =?utf-8?B?MUFqakdiS1JwUUprb253Q1ltOGduZjQvMXZmYmxCL2xNNERqeE9zeUx6NmR4?=
 =?utf-8?B?bk1tUldnM1hPUG9tUWlxektPYVRmSzh4d1R6TEVad1pvc2FHcVdKRXY2cTNl?=
 =?utf-8?B?TDNOc0lsazgwRXZsSkwwN3JBQ3J1bVFlYmtnWDFOd2l6dnVrMmFIb2JtdjBG?=
 =?utf-8?B?MGFFSVFEOVlGRTU0S3JUNXlsZmoyUDk1akpKTlVCVUtrS0M0aUVFK3ZkczMx?=
 =?utf-8?Q?pSkTFaStUdnhe1E04I+kqStxU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeac43af-b6ce-463d-011f-08dd210fb4c8
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 16:02:30.0592
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6RHhb4YwqazPWmhB5z0g0Q+WXYCRvGHft4FERk8okKiD+EXJZUvMvlXJ4k5zR4Il2M/UqNuO4qSB6E3bUkoqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7036

On Fri, Dec 20, 2024 at 02:39:14PM +0200, Ciprian Costea wrote:
> From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
>
> With respect to S32G2/S32G3 SoC based boards, there are multiple RDB
> (rdb2 vs rdb3) and EVB (for G2 vs for G3) board revisions. These versions
> are quite similar. The common part for the EVB revisions will be
> centralized in 's32gxxa-evb.dtsi' file, while the RDB commonalities will
> be placed in 's32gxxa-rdb.dtsi' file.
>
> This refactor will also serve for other modules in the future, such as
> FlexCAN, DSPI.


https://docs.kernel.org/process/submitting-patches.html
"Describe your changes in imperative mood, e.g. “make xyzzy do frotz”
instead of “[This patch] makes xyzzy do frotz” or “[I] changed xyzzy to do
frotz”, as if you are giving orders to the codebase to change its
behaviour."

So suggest..

Create common part, s32gxxa-evb.dtsi and s32gxxa-rdb.dtsi, for S32G2/S32G3
RDB2\3 and EVB G2/G3 boards to avoid copy duplicate part in boards dts
file. Prepare to add other modules easily in the future.

>
> Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> ---
>  .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 150 ++++++++++++++++++
>  .../boot/dts/freescale/s32gxxxa-rdb.dtsi      | 122 ++++++++++++++
>  2 files changed, 272 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
>  create mode 100644 arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi

I think you should squash patch 3/4 to this one. All is for the boards dts.

Frank
>
> diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
> new file mode 100644
> index 000000000000..a44eff28073a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
> @@ -0,0 +1,150 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright 2024 NXP
> + *
> + * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> + *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> + *          Larisa Grigore <larisa.grigore@nxp.com>
> + */
> +
> +&pinctrl {
> +	i2c0_pins: i2c0-pins {
> +		i2c0-grp0 {
> +			pinmux = <0x101>, <0x111>;
> +			drive-open-drain;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <133>;
> +		};
> +
> +		i2c0-grp1 {
> +			pinmux = <0x2352>, <0x2362>;
> +		};
> +	};
> +
> +	i2c0_gpio_pins: i2c0-gpio-pins {
> +		i2c0-gpio-grp0 {
> +			pinmux = <0x100>, <0x110>;
> +			drive-open-drain;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <133>;
> +		};
> +
> +		i2c0-gpio-grp1 {
> +			pinmux = <0x2350>, <0x2360>;
> +		};
> +	};
> +
> +	i2c1_pins: i2c1-pins {
> +		i2c1-grp0 {
> +			pinmux = <0x131>, <0x141>;
> +			drive-open-drain;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <133>;
> +		};
> +
> +		i2c1-grp1 {
> +			pinmux = <0x2cd2>, <0x2ce2>;
> +		};
> +	};
> +
> +	i2c1_gpio_pins: i2c1-gpio-pins {
> +		i2c1-gpio-grp0 {
> +			pinmux = <0x130>, <0x140>;
> +			drive-open-drain;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <133>;
> +		};
> +
> +		i2c1-gpio-grp1 {
> +			pinmux = <0x2cd0>, <0x2ce0>;
> +		};
> +	};
> +
> +	i2c2_pins: i2c2-pins {
> +		i2c2-grp0 {
> +			pinmux = <0x151>, <0x161>;
> +			drive-open-drain;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <133>;
> +		};
> +
> +		i2c2-grp1 {
> +			pinmux = <0x2cf2>, <0x2d02>;
> +		};
> +	};
> +
> +	i2c2_gpio_pins: i2c2-gpio-pins {
> +		i2c2-gpio-grp0 {
> +			pinmux = <0x150>, <0x160>;
> +			drive-open-drain;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <133>;
> +		};
> +
> +		i2c2-gpio-grp1 {
> +			pinmux = <0x2cf0>, <0x2d00>;
> +		};
> +	};
> +
> +	i2c4_pins: i2c4-pins {
> +		i2c4-grp0 {
> +			pinmux = <0x211>, <0x222>;
> +			drive-open-drain;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <133>;
> +		};
> +
> +		i2c4-grp1 {
> +			pinmux = <0x2d43>, <0x2d33>;
> +		};
> +	};
> +
> +	i2c4_gpio_pins: i2c4-gpio-pins {
> +		i2c4-gpio-grp0 {
> +			pinmux = <0x210>, <0x220>;
> +			drive-open-drain;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <133>;
> +		};
> +
> +		i2c4-gpio-grp1 {
> +			pinmux = <0x2d40>, <0x2d30>;
> +		};
> +	};
> +};
> +
> +&i2c0 {
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&i2c0_pins>;
> +	pinctrl-1 = <&i2c0_gpio_pins>;
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&i2c1_pins>;
> +	pinctrl-1 = <&i2c1_gpio_pins>;
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&i2c2_pins>;
> +	pinctrl-1 = <&i2c2_gpio_pins>;
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&i2c4_pins>;
> +	pinctrl-1 = <&i2c4_gpio_pins>;
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
> new file mode 100644
> index 000000000000..91fd8dbf2224
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi
> @@ -0,0 +1,122 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> +/*
> + * Copyright 2024 NXP
> + *
> + * Authors: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
> + *          Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
> + *          Larisa Grigore <larisa.grigore@nxp.com>
> + */
> +
> +&pinctrl {
> +	i2c0_pins: i2c0-pins {
> +		i2c0-grp0 {
> +			pinmux = <0x1f2>, <0x201>;
> +			drive-open-drain;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <133>;
> +		};
> +
> +		i2c0-grp1 {
> +			pinmux = <0x2353>, <0x2363>;
> +		};
> +	};
> +
> +	i2c0_gpio_pins: i2c0-gpio-pins {
> +		i2c0-gpio-grp0 {
> +			pinmux = <0x1f0>, <0x200>;
> +			drive-open-drain;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <133>;
> +		};
> +
> +		i2c0-gpio-grp1 {
> +			pinmux = <0x2350>, <0x2360>;
> +		};
> +	};
> +
> +	i2c2_pins: i2c2-pins {
> +		i2c2-grp0 {
> +			pinmux = <0x151>, <0x161>;
> +			drive-open-drain;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <133>;
> +		};
> +
> +		i2c2-grp1 {
> +			pinmux = <0x2cf2>, <0x2d02>;
> +		};
> +	};
> +
> +	i2c2_gpio_pins: i2c2-gpio-pins {
> +		i2c2-gpio-grp0 {
> +			pinmux = <0x2cf0>, <0x2d00>;
> +		};
> +
> +		i2c2-gpio-grp1 {
> +			pinmux = <0x150>, <0x160>;
> +			drive-open-drain;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <133>;
> +		};
> +	};
> +
> +	i2c4_pins: i2c4-pins {
> +		i2c4-grp0 {
> +			pinmux = <0x211>, <0x222>;
> +			drive-open-drain;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <133>;
> +		};
> +
> +		i2c4-grp1 {
> +			pinmux = <0x2d43>, <0x2d33>;
> +		};
> +	};
> +
> +	i2c4_gpio_pins: i2c4-gpio-pins {
> +		i2c4-gpio-grp0 {
> +			pinmux = <0x210>, <0x220>;
> +			drive-open-drain;
> +			output-enable;
> +			input-enable;
> +			slew-rate = <133>;
> +		};
> +
> +		i2c4-gpio-grp1 {
> +			pinmux = <0x2d40>, <0x2d30>;
> +		};
> +	};
> +};
> +
> +&i2c0 {
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&i2c0_pins>;
> +	pinctrl-1 = <&i2c0_gpio_pins>;
> +	status = "okay";
> +
> +	pcal6524: gpio-expander@22 {
> +		compatible = "nxp,pcal6524";
> +		reg = <0x22>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +	};
> +};
> +
> +&i2c2 {
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&i2c2_pins>;
> +	pinctrl-1 = <&i2c2_gpio_pins>;
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	pinctrl-names = "default", "gpio";
> +	pinctrl-0 = <&i2c4_pins>;
> +	pinctrl-1 = <&i2c4_gpio_pins>;
> +	status = "okay";
> +};
> --
> 2.45.2
>
