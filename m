Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2050.outbound.protection.outlook.com [40.107.105.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C3F1F37D2
	for <imx@lists.linux.dev>; Tue, 21 Jan 2025 15:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737471988; cv=fail; b=NNoSdtYCG11yzjotWf1KMvrGc2R752iK0duAaOtd4iARC6SC247UtmKX/GyAx5eGxMPbRaotk/Nb3fglXzbRLgkZ14VOEG3ti3GGjOVyFPN635QGlUWNH1uxe6FPoUJMDJaOTteCAI8r0gi4qxfcdFm1IB7f3mnjuG4F85DqlpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737471988; c=relaxed/simple;
	bh=j9W1QmsiL4ZM5YYJDPTXeoKJGBgXw/CDksoKJm0NaX0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=E105rLDsQETsJrJeMQoxEusB7fBopJXSK76TYdxRMNIyXngMS+uGBwLgoag0O8HM0mAjmLpn/aJclUdtGeVz/JOTvU0JL3JFuT6OdnkQVjiDcsMqP6w0UBZmzaZuVZgjf7VRUy0dbc3fwzqyduvuSpBH94NXuCkiPEOWLtXNpN8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=exQMF9vX; arc=fail smtp.client-ip=40.107.105.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="exQMF9vX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YuiY0kd/z1m7nqtODwEQE0e/S+JlnZN65s4KyDWpL9k7Lip7oTiItV6eKisYgowG16ETwVItJ2dPQ+1psRf0+oZO137CUsI4O7wBmc0/NQdZkQ+aeVRUWJvrmEQ7xbkPC5MW0Z24YH7l/7cNNaq6KSwWwqvraBus9euJE24k62Hd4LenOP67vtU7PzU5tRJNmkCo1DEsEO2G+Y20EyX/o3WFAVaqKiFJi/tn0nRPzwywQzMXxYUX1YQHSv6m2411UxMefQ1UehMHZe286RJpw14Hp/EdjjfRW+HtHz8Yen7qFNjzK7D9hoeSIFhYQSWh02g1BlYhqMawW3E7NYxOVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsEDvNEYhF3R8DXfZgJKKwqLRbmEeD16rDVIKjmLYLA=;
 b=jZt0yThwbJmQiuoGMGmzxVoOm5NRoK4FYEDxzerufMfXByj7HE0umVNHBGyWxqxz2iQ1up8CkPhTaEHrwLrINbTNM0gkUOvG4IEnuAfzzjr0JxO90JerxoPUPftb4ks3+L233klA/9rJsQgY/0D0+lqRksA7rwYK4CIkTRvj5GiF9JsQPBVddYeq0pbSZgjMjJvok0OtxVb006uobIoMApYRftTMvXfWul3PsEkgvJx7mEkvU59PU6nZp3/2aSQZlUrH/lvG5N/NhlF+0y3qpQkbzS7Fhm5pAJ4cN4oCANAz6HcBuxF4PzazUc5876BEdvvC11YtRFjRh2xbF2YLog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsEDvNEYhF3R8DXfZgJKKwqLRbmEeD16rDVIKjmLYLA=;
 b=exQMF9vXmyNVAC5UvYcI2a0VWcKay8FP6olgOAVLh2Nrj7njSHcikHLs6Bztzm4YEbf9I7rZq23+UkyQi65oDHmyNiMQS20Nmq4ACgsGkY24JYfuvQM+hvkNpCA2spi1Y5w6eHNYmsqBFpxqbuZ0IiIwqvcLXLYnDo4p5Eq9Iqwcf5DjoKyFmtY5IFubPEoogHWtcTRgNy8uE7b2Zum7r7pnbQjV5CIFzLKFPfHF/QSUmbQ1wlWxQ7Lxv7einHLzMAJDYyOBbX4eFRzDTMJi2jSYWY1ntFnKojY+fVvxQn3W4vWqAeWcX/IbVN0ylxIUy19xw3TtvfgvRGJVwHex8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA4PR04MB9295.eurprd04.prod.outlook.com (2603:10a6:102:2a6::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Tue, 21 Jan
 2025 15:06:25 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 15:06:25 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Tue, 21 Jan 2025 23:05:31 +0800
Subject: [PATCH v6 1/2] dt-bindings: nvmem: imx-ocotp: Introduce
 #access-controller-cells
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-imx-ocotp-v6-1-76dab40e13db@nxp.com>
References: <20250121-imx-ocotp-v6-0-76dab40e13db@nxp.com>
In-Reply-To: <20250121-imx-ocotp-v6-0-76dab40e13db@nxp.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737471947; l=4068;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=4MXzYq4oLyYtlA95EQap1UQZ2xOM248M5j3t6NvUUFI=;
 b=hirbKyc9oP13CRXY8HY82fHLvdWKWL9zBq0DZ6ihd1ndlJr7JRTan9n2fB9wHYjAZjJZnAZgB
 sFK4SG/khzPBD30f+L2MOjB8dz0NG73FxxbH0lfnNMw/TvGwKHqafg0
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:4:188::23) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PA4PR04MB9295:EE_
X-MS-Office365-Filtering-Correlation-Id: 16e557e8-d7fc-4328-eb35-08dd3a2d2c7f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VlA2RXI1ZU9HdXFrR2hRaVcwUmRFWWhpekZBbDFvQWRUN25iYk1Baml0K0cv?=
 =?utf-8?B?WkFHb01rWWJzUjJESVFKQWRxNGRzaEtvWHppRmlUaFVUUE9QdTRtSXZZa29W?=
 =?utf-8?B?OFlzZXV2a09vWlBCWUJlWjlpZXJEb1FVMkdBc3A5UUl5bU1MWllKM0I0bHk0?=
 =?utf-8?B?dmhXc1VGOXpiQStlb1JJRnZVS0hLd3l3dnVYbUR3MEpDR0trMjJYazlYN1py?=
 =?utf-8?B?MHdZL0Rldk5zWGlqVGY0Y0VjcTlUekJpekhXRXBnM2xDQ2xvcno3S25YK1Vp?=
 =?utf-8?B?ZXh2M1VpTnd5OVlKREloM3JhSnFvS2hIU3NHTGpRYi9LZ1VnV3UvdEpvRnpu?=
 =?utf-8?B?ZFdBMFZqZStVNU5ZRHJab3dTWU9zdFhrQVBYek1WT05JS08wRGZvbTM5RlZI?=
 =?utf-8?B?NE9BVDBTcm1UQVFnMnBNY2d3cUxNSjZ1V1U0K3hsN3VYcW1OOHZKdy8vTlFR?=
 =?utf-8?B?OGprU1MzNzd5TmhPUzdOMU56V1V3bmNUUjhHdU9FMGNKVzJ6MlBkMEhOaUxT?=
 =?utf-8?B?TS9hSlpwNUE0YUZhd0FSWDA5aDFDQ1VnRkF2anpJRGlRL0ZyRFQwODFVbWRR?=
 =?utf-8?B?cWdENGYzd2tKSVFKSzk5WmdCMnVHL0FHZzJvSGtmbnBxSnc1MGFocEw3Rkh6?=
 =?utf-8?B?cWtJb3dva2pQWUdUd1Q3azBuVzM5NG9DQkxwYngreUp4bHR1ajJKY3ZDOVpC?=
 =?utf-8?B?MlRsbDdlR25RY09tRUdmSkptSi82c0tQOFdVeWFvVXEvWnZObnlMMHlUUjA5?=
 =?utf-8?B?ZFJxVHZoVCthN01MY1U4ZERzYUlBSG5DcVByUUVjQWhtQ0d4blFNVGYvV3Rn?=
 =?utf-8?B?WXFLN1ZscWNJa3dieFZVYkZXbnI1YTNOV0FtWkJPWGtMUUY0ckNuU3pGdVlo?=
 =?utf-8?B?bm9iS2RFdlhvL3hPU1JmUS9XZElnbmhUNjUyTG1tVXNLV2h1dDRGOEV2VVMx?=
 =?utf-8?B?UzB3OEJTVmtsTnN4anZtTnpWZlpKS3VLOHZkTkVKRGprWmw2c1JOZEhWNzI2?=
 =?utf-8?B?RWplTmwxSEMySC9kMVZvR3RGay90THduZTh5RXU4ZE95THJncFNIS0kwTlRm?=
 =?utf-8?B?RzdUOGV3QjZvZHdLTm0yUHdlb1BNSDljeW9yM094d2k3WFJYbnpFZ0c3Z0Z1?=
 =?utf-8?B?amd5MlllU0krSHRnSE5tWFA4MG9McjBnQXl3dWxWbjZOZnR0SzVvUG4yTjVs?=
 =?utf-8?B?RHIzOGRZaENBOXNPUXVwRW5mcWFEUnpadkNlTFdNem1Mb3VVa1gxVmpIUERs?=
 =?utf-8?B?TTBvaWRMK3loeXA5VFcyWnFVamxGNU1ITXNCMGZndS9mVU9TbWFqZnJRTG1K?=
 =?utf-8?B?elRiY0RqZlE2WG42Z3ZWV050YTc5ODVJVm1yelhzNXkrV1RJSlU4Z2F3dSt3?=
 =?utf-8?B?MHdKMjVQUWZLSnlTL2E3cUZwQVJEaDdzbDVZSjh0cTVCakR1Z0d1ZUlCdWwr?=
 =?utf-8?B?b3NZMUJwRFU0VWplNU0ydUlxakwvVnFLTVluaWJXdWhxTm5UR1cwN1hwWk5J?=
 =?utf-8?B?dm5BanBLLzZiSUJHK0xENitZSzYvaEorS1dEbDJFWGcvNFlGODZjRmZkdlM1?=
 =?utf-8?B?d3ZCQ2trWEl5RFAvN3FWNlZIMVhqMDRnZUJsSVFXZ0tnSm04VW9JZ0pSeXRP?=
 =?utf-8?B?NVlMODVNOGcxRkJZNEdJZnhUTXlMUFQ4S1kyTTlwN3g1VVNqTDFuMWlRc2Zn?=
 =?utf-8?B?UWxNV1ltTXZRYU1rVDVWWEFZZEsvbmdSUi9lSU1qaFRFZG1OZE5aMjJhaXF3?=
 =?utf-8?B?dHNiMkxrS2FXMHArampWdnVPa2lha0dSODNZeFcxcGF6TXZXM0lXY0FuUDJ4?=
 =?utf-8?B?OG9ZcHZQQ2VlVTFyMWVjL2FmR2sxUjBzWnBPeTkwT2tjYldORW5xdHZIUzJB?=
 =?utf-8?B?TzhiakN4L0lPNVQ2emRBelFaUnFONm00OVd0TnNiUW8rT01CWHB5TkowWjBM?=
 =?utf-8?Q?BmGQwpsG6xkr+dSMEcJ6/njAGJpkcRv6?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFAvb3RDNEdoS1VsZ1JDNUVtL2NHd2IxMnd3UVUrQnRIOWk1YW5KMDNlR3ZX?=
 =?utf-8?B?SFJqNmNFRzEvZUNXbTNrcmlPWDhZenNXL1FHaWtGcWRoZG4yVWNNeUZoQ3V0?=
 =?utf-8?B?UGUvOUZoSDRIb1FzM0hDQXdaRWo0d0dBVWpUS1VYZUdvSXBaWGtPaWZqTEJR?=
 =?utf-8?B?R3dqdzFIWnFKcjN6aFE2SUplUUdwZ3ZIVHR1NjU0RDl0STZiR01PUVVUUm95?=
 =?utf-8?B?aFoyUEs5TTU0MHo3c0tJK09aWmg4NkkyRi8yUWdHUW1vM0IzVEhBYW1BNTFr?=
 =?utf-8?B?d0tGaUpsZmZJOWp3Nld4U2svNkdsbzZSZFpGa2xKaStpb21wWVVaQ2VrSWpH?=
 =?utf-8?B?SFQ4dmpWbExqWXhDdUpGREtscGV5a3J5ekNua3Nlc0ZrL3IxSEJWKzVGRGI4?=
 =?utf-8?B?L2haM2Q4QXlGSnBFaDFCbnFmNlU0akRESTlORzVPVXFESHg3aWc0RTByc2dp?=
 =?utf-8?B?VFVId0w1S0x3MUl1WjdXQnVvWEVxMU5DcHk2Sy95WDJKdk5FNUFVcWV4aGlN?=
 =?utf-8?B?MEtyZFY1UEV1OEwzYy8vYXJGeE00UEtsUjJ2LzRhREg0THVNeFBldGVuSWRl?=
 =?utf-8?B?NytldkJDaktJVFRjUnZEYWszQkd3aldMMjg2eGxhOTlaeTlsdTN5K05rNUNo?=
 =?utf-8?B?NmlmZUdvN3hOdVNPNmxtRkpER1dOM2dWZUZpYlB4b1gycVhFMEFlOWs4M1Vw?=
 =?utf-8?B?NTFGUWE5Q1RLNlE2K3ZRdjdjaTBuZXA1TFBNaWVWbENQOVFOVHRITmxFZWRW?=
 =?utf-8?B?RWVoR1kzRVhvMlJ0OHVadit1ZVROQXdoUk1jZWxPeXEwY3ZWSGVKNlZMNjZu?=
 =?utf-8?B?Y2JFSEFTclZKUUJDMFdZSzRGS0p3ZFN1TVkwRkpCWnJYbEpSSWhjcDR3YWxw?=
 =?utf-8?B?a3F1UnA2WEdKTHlRREtNNWNhdkxHamtxdFFRSU9ERk1UK2lyVHZvdUFESnB5?=
 =?utf-8?B?akpnU0RHZ1hubTVES0VJZ0laMG1SZFArbTJ0eHpRc2dvdE9BYlUwUFpIYzJa?=
 =?utf-8?B?V2xOanluS2RrdXFPdjFGc0dWaU9HT2hkaXJNZUpqUGtjR2k4NEMwWVRLOFBo?=
 =?utf-8?B?bTBXdDJRVmhoSVFTbmhwUkJaVlpFL0JJQWs2R2JNVTVQOTMwNDRpczkzUGlQ?=
 =?utf-8?B?NS9NUENuK2ZUbU8xNTlUeVJnemVzb0NKUDNIYWhxbGE1NFBhQ2RCZE1LK2Z3?=
 =?utf-8?B?UDdXZ2xqU2IzdzN0VW9ab1E1U2xPSGlLZDFlQWFxWms5VzdyMW11cjl6VFFx?=
 =?utf-8?B?cmg1ZlN0ZklCdnZETklaNkFUQVhISE84K29jVllEKy9ZTTQ1MklrVVBXT3ZI?=
 =?utf-8?B?L2tkTnVmclNrdWtWYm9pclIwRk9UUkdkcEpoSXVmN1NhTVZobGhISXVoenpR?=
 =?utf-8?B?N2UydGdlaFRxaGhLWWtiYm1OM3FkVGl1OXl6U1ZDdTF1NGNWREtFbTVUNnFz?=
 =?utf-8?B?YnZsdXNkRGpnQ2tjRXNSSzFVV0hxbFY5NVcyTDE5YlhkZ09WRkRUS0VxVTB4?=
 =?utf-8?B?UC9LNUFYdnhJWm9RZ2x3cWlsYlU2SFVud2ZWMTNMU2ZvOGdzeXY2dFBxdFZG?=
 =?utf-8?B?QUczYy9hS29ueU5DMUM0UFdqU0FFVXYvYjJCK2xRVU8wcGZiM0psWHF1U1Jo?=
 =?utf-8?B?R1hQeGZqS3RySk03TU5YaEVJSmdEYklKeHRXNitjb2FIVkdhWS9veXJxTmx0?=
 =?utf-8?B?K0RJandJQkhZSjloNGRkdkFNNGYwTGt3ZGFRcGhVc1dRYzhiNmZxZFZqMlZx?=
 =?utf-8?B?Y0R3eE5DRWpWL0ZkbERLd1ZpdzB5dzA3YXBOK1BrS0dMd2RHekZaTjFqeXlj?=
 =?utf-8?B?UDFkMnVyZXo4OTluRWlXUFBuYkthVW1tRkpPK0U0VGx2Z29UZTY5Yzl4VFpM?=
 =?utf-8?B?eWEvZ1N1ZjFkdE5PTUlGVHJYT0NESTdMTmtuZFhIQ2pac2VHRzEzRjJHOE1M?=
 =?utf-8?B?OTk3WWkrbWZtYnUzNkozeG1lb2J3Y0lIR1NCcXhQTkxra3BQMU9Nc09PWDdj?=
 =?utf-8?B?c2lQaE5sZzBadDlEYXVtSkNtSXZZcFl2WCtQU05GS2tRTTNWUlhjZUhsMUJD?=
 =?utf-8?B?dGlXem9FdHpaTjV5dERYYUhqN29OVkR5d0FGcWF4dE1lUTA5UThtV3FTbTZk?=
 =?utf-8?Q?UbzayM+MJ6gT+b735p/zxWxDS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e557e8-d7fc-4328-eb35-08dd3a2d2c7f
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2025 15:06:25.3015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TM70L4F6wJM6FWdoHGf3+R3xctCqx5R2KJDGk3fLvOchchCUOrwFjpEcZCxRmMccYYeQCc7Dq81sAE53+IbBfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9295

From: Peng Fan <peng.fan@nxp.com>

Introduce "#access-controller-cells" to make OCOTP be an accessing
controller, because i.MX Family OCOTP supports a specific peripheral
or function being fused which means being disabled.

Add the i.MX[95,93] OCOTP gate index.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 .../devicetree/bindings/nvmem/imx-ocotp.yaml       |  5 +++
 include/dt-bindings/nvmem/fsl,imx93-ocotp.h        | 24 ++++++++++++
 include/dt-bindings/nvmem/fsl,imx95-ocotp.h        | 43 ++++++++++++++++++++++
 3 files changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
index b2cb76cf9053a883a158acaf5eaa108895818afc..c78e202ced22f1c278f7be827b71ba434832d2a7 100644
--- a/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
+++ b/Documentation/devicetree/bindings/nvmem/imx-ocotp.yaml
@@ -54,6 +54,11 @@ properties:
   clocks:
     maxItems: 1
 
+  "#access-controller-cells":
+    const: 1
+    description:
+      Contains the gate ID associated to the peripheral.
+
 required:
   - "#address-cells"
   - "#size-cells"
diff --git a/include/dt-bindings/nvmem/fsl,imx93-ocotp.h b/include/dt-bindings/nvmem/fsl,imx93-ocotp.h
new file mode 100644
index 0000000000000000000000000000000000000000..6ef525173845fd4ee0e847cf5a17e53a14f71362
--- /dev/null
+++ b/include/dt-bindings/nvmem/fsl,imx93-ocotp.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+
+#ifndef _DT_BINDINGS_NVMEM_IMX93_OTPC_H
+#define _DT_BINDINGS_NVMEM_IMX93_OTPC_H
+
+#define IMX93_OCOTP_NPU_GATE		0
+#define IMX93_OCOTP_A550_GATE		1
+#define IMX93_OCOTP_A551_GATE		2
+#define IMX93_OCOTP_M33_GATE		3
+#define IMX93_OCOTP_CAN1_FD_GATE	4
+#define IMX93_OCOTP_CAN2_FD_GATE	5
+#define IMX93_OCOTP_CAN1_GATE		6
+#define IMX93_OCOTP_CAN2_GATE		7
+#define IMX93_OCOTP_USB1_GATE		8
+#define IMX93_OCOTP_USB2_GATE		9
+#define IMX93_OCOTP_ENET1_GATE		10
+#define IMX93_OCOTP_ENET2_GATE		11
+#define IMX93_OCOTP_PXP_GATE		12
+#define IMX93_OCOTP_MIPI_CSI1_GATE	13
+#define IMX93_OCOTP_MIPI_DSI1_GATE	14
+#define IMX93_OCOTP_LVDS1_GATE		15
+#define IMX93_OCOTP_ADC1_GATE		16
+
+#endif
diff --git a/include/dt-bindings/nvmem/fsl,imx95-ocotp.h b/include/dt-bindings/nvmem/fsl,imx95-ocotp.h
new file mode 100644
index 0000000000000000000000000000000000000000..2d21d1f690974d0215c71352168378a150f489af
--- /dev/null
+++ b/include/dt-bindings/nvmem/fsl,imx95-ocotp.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+
+#ifndef _DT_BINDINGS_NVMEM_IMX95_OTPC_H
+#define _DT_BINDINGS_NVMEM_IMX95_OTPC_H
+
+#define IMX95_OCOTP_CANFD1_GATE		0
+#define IMX95_OCOTP_CANFD2_GATE		1
+#define IMX95_OCOTP_CANFD3_GATE		2
+#define IMX95_OCOTP_CANFD4_GATE		3
+#define IMX95_OCOTP_CANFD5_GATE		4
+#define IMX95_OCOTP_CAN1_GATE		5
+#define IMX95_OCOTP_CAN2_GATE		6
+#define IMX95_OCOTP_CAN3_GATE		7
+#define IMX95_OCOTP_CAN4_GATE		8
+#define IMX95_OCOTP_CAN5_GATE		9
+#define IMX95_OCOTP_NPU_GATE		10
+#define IMX95_OCOTP_A550_GATE		11
+#define IMX95_OCOTP_A551_GATE		12
+#define IMX95_OCOTP_A552_GATE		13
+#define IMX95_OCOTP_A553_GATE		14
+#define IMX95_OCOTP_A554_GATE		15
+#define IMX95_OCOTP_A555_GATE		16
+#define IMX95_OCOTP_M7_GATE		17
+#define IMX95_OCOTP_DCSS_GATE		18
+#define IMX95_OCOTP_LVDS1_GATE		19
+#define IMX95_OCOTP_ISP_GATE		20
+#define IMX95_OCOTP_USB1_GATE		21
+#define IMX95_OCOTP_USB2_GATE		22
+#define IMX95_OCOTP_NETC_GATE		23
+#define IMX95_OCOTP_PCIE1_GATE		24
+#define IMX95_OCOTP_PCIE2_GATE		25
+#define IMX95_OCOTP_ADC1_GATE		26
+#define IMX95_OCOTP_EARC_RX_GATE	27
+#define IMX95_OCOTP_GPU3D_GATE		28
+#define IMX95_OCOTP_VPU_GATE		29
+#define IMX95_OCOTP_JPEG_ENC_GATE	30
+#define IMX95_OCOTP_JPEG_DEC_GATE	31
+#define IMX95_OCOTP_MIPI_CSI1_GATE	32
+#define IMX95_OCOTP_MIPI_CSI2_GATE	33
+#define IMX95_OCOTP_MIPI_DSI1_GATE	34
+#define IMX95_OCOTP_V2X_GATE		35
+
+#endif

-- 
2.37.1

