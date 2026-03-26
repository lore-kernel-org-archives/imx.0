Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013019.outbound.protection.outlook.com [52.101.72.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB413FE36E
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 14:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774535321; cv=fail; b=Sb3fKj3dybcaSw1xGNX/96BuOjTTFZUYJRQ7hvOwpFmQXDO49TK12FHTSZHckUGHejy5RhBgczl5I0NzfYiEfrjvwr3mwe1jbQQ2lrSsUn/1utDBwPvUGkh2WyNBT986RlEAVq18kzUbBZcSNdHEArqofpLSuH3+2FsyMN4Y7w0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774535321; c=relaxed/simple;
	bh=QwIxyHykHUW6nSgoJVc5fI8SeKfz61OLmlWkiGQarIM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ig6PIABK+aNPzCvbsSQhNzY+y9tLyaiklOqsHa4avnNpi6VAmgzZmAX0TedETllUy7kyno3GgoxAqCnUASVfPVwKqrZyTuY5ljw0sq28dlbMzboE9F1AjlZrXExLmUAcfZaEn6G4xgnioj56GhMLeIY2FDO4eGJbIrS38ccy6tk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=GXFsIAib; arc=fail smtp.client-ip=52.101.72.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="GXFsIAib"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GJvI9mgQfwAyPn5iV16ZEEZoJbeIU3Unptwm5uBg+sFp0UWZANkpWLpbPah0NQHH+N9BWejt3qb47X4HY8xbJe59J+NnpSUiodAf99Sh/HrjUS6Rch4MaPpEaYFEmuWstjHhaHY/DOV2f21GzWA5nI5iAhqMPT+cqWUI9B4vQEv4Zf2MjwcsOVu7OA/Vta1wlOSxY37KqSgDYpPvfTTNonHXMj7Ui2XcIBbJM4DuMzKjdF73rDAjTi3QjgYZuY8ls+rsFxNWBzlql5X1yyLCa0SbFPFmXe/PpqK2cHWmJNcbwq5Mku46gkrwCMFxMsIZ8V87SXz3r3MlmMFnltEKEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXxhNfrsjG5BkIW8u/zXAWZcnoXSYaawf7ROBcQK2Aw=;
 b=DScgn8ih0SDK/1emv0E5CRzCNhAnVF57KEQAE0kYI8otD7F5OpPpy32Sn8VMSbliZjWal+5eYdAEOWya75qg9K/nV8YUqGNmF2xELmMiIIECIntI06H0zI+isdI9YsLA1o9je+FrqiF4jO/M7tXnNErbe1aU2JmzLgIyezbyvMWAeNus4pLXbedUwxJERfDkG5kB+rdrmks6SfQv++Ujdrcq49+S4IDAPI6Cv2n/4zipxCd4OIuQWNrm9HxSIj6eMRjNd60Dl7IIRrYz46uD5wPJF25hxkrTzXSjIZu8ayZHih+bXI0rjudyRfwtiNT2kgRDJtz62if1UigwMSk+ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nXxhNfrsjG5BkIW8u/zXAWZcnoXSYaawf7ROBcQK2Aw=;
 b=GXFsIAibBC4qKXXUNNUkfolwCSeGCMiezZ85z1eXSGVk2jOKbGZ+BQLc1tjzTDK9dFJguYUPzA+UvlyPCJsQMIyVGIHYjEcM053gJOfHet4lF20gdF5sSjkroKgzTem9xi0e/j/kWatDpr4KpZkT41WPo82bxoULPuPuVYKuNd3hODh2rEiQbLV3fXHg9N7ETXbqTPx1H6WNsXkZLTDdCEPCFgB3WctP1p5N+Im7L22JBORlqbuPSvWOvIBL0K7YAHNApqVBS8a9qcXEq+NcSnA2a7NXTPSGWNlsPv5zRzcse7VWk9uNuNZX3IuA99A5bEY1R/bKF9p91+ZQyGvK/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by GVXPR04MB12092.eurprd04.prod.outlook.com (2603:10a6:150:316::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Thu, 26 Mar
 2026 14:28:36 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 14:28:36 +0000
From: Frank Li <Frank.Li@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	Xu Yang <xu.yang_2@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jun.li@nxp.com
Subject: Re: [PATCH v2 1/2] arm64: dts: imx8qm-mek: switch Type-C connector power-role to dual
Date: Thu, 26 Mar 2026 10:28:22 -0400
Message-ID: <177453526691.4164045.13526085812002400362.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260324110459.2838767-1-xu.yang_2@nxp.com>
References: <20260324110459.2838767-1-xu.yang_2@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN6PR2101CA0009.namprd21.prod.outlook.com
 (2603:10b6:805:106::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|GVXPR04MB12092:EE_
X-MS-Office365-Filtering-Correlation-Id: 664e24b7-6627-49dc-d171-08de8b43f78c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|7416014|376014|19092799006|1800799024|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	aNpPhyZIn5Sr0soa7+WRuV2Sr/+7xnhr/+uOeVHKdRFp3DMDfadZgFYMfBRm/rMf+1S2Yh6XZAUtfuKpfSurxn3R/QdfoCCA5ucrF2tyW76q5wJf/wXPrSwPcTqc597P5y8C/I0WKFRKn35nkmbI8DDy3Zyh0bGKnc+NussCC+/XOtpsIjIFA0IkPm+gewJEBJOCJiwYWRH2rLG51by/HlbOz+vg6aKCCuV6wESp6RDHw2qk2b3f78f4KUSJM5mVz44pY78FhUc7C/RvcwaSwvajHd4uE7dpwXf04FKR35bIoPEE1vFMZI4toTf22lwQJk8ZB/yJtpizt2hluOpTBwYZ9lLfPDbDDCYSZR0CBdHexjKDhVIejFrumqGjPQoJfaPSKv+FbXgbd6QYQWrJ8P5Lh9wbuUKuiAXwU60cM3We7KFwixuLFbZjsNnzH5UHMh37reTeBFHPNGH2dwgteHIco+IlGJ139JQeMRSzD0ukiW9phyNPJtjKOz7CmO2AfUnCnx0dvt5ibaHGbBh5TcoSG2/CuQD8I8co8E0CxwK/7JO7yB1UuIcex+jCjAKPTJWBG09Wirs2kNO2Kh16YuYk2DAbTOPS3hz16kWTRyT5kWHxmZHrJIwlroQcXpP2Mnd7hE+Ow5EKKRyVhcKCFjzHt+QZUGzdZZVGME5+hXwJzeG9AEQ1IM1RRshyd0YOn1j5VyNYCqwIIopTZUrC/TYH1iPFJsfVsCH/ZpxN18UywRO2VLvYxK3aaqQWBxxFXhzgQM6IMyJt5D6m0GgZY6RdYFvvAiicq3nPWRsrMF0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(19092799006)(1800799024)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEZXRk5uakpKdmlXdENUdkdrRzZENE1mSHhmRFJOYm5GdXJ3bUZEMjc1OXUr?=
 =?utf-8?B?L1ErZzBxUGpWRWx2SGtCK3BseFpRSzV1NE5UaHhweFRRMyszNnVZMHJ6cURC?=
 =?utf-8?B?VWxpb2V3dzdUVXdaWVdLcjR4VTBVTUJFQjRIaGlFQis5ZUU4a0hyMHYrVkxD?=
 =?utf-8?B?Q0c3Mm9vMW5ZbGdQZ0t2VU5iTGJ1NTdhT2k5QjM2VXlETU95OWZYU1RwTFJz?=
 =?utf-8?B?RERUMlh5aVBnaklQeTdqMlcrTlBCbUo3Q0ZtN0tuZmJhSU1KTlpKY2VieHA4?=
 =?utf-8?B?cUYza2xxTHJJY1pOWExRSGRpNk5icGMrL2orS0hBUktDVG52dTJtWVJPYm96?=
 =?utf-8?B?Q0EwT2pla2JCZjJVck4wV1VWRUl2VjZLK0RqTDFQaElieWZ1bUI5Y2tVcUk3?=
 =?utf-8?B?YXo2VFhvVWZTTUJiTm1rVFFFVXg1TUFlOUZicWROWmovd3RpZGJMakljakFP?=
 =?utf-8?B?NEdMNVdUelUxZkx3Q3BkYWlrTGpyeUpHS0xZSjg3NmtEV0tBVW5nbGVzQ205?=
 =?utf-8?B?UHplK3ZXQnlJUk93OWdmUm9KSC9xc21WVzFta05YUzZjTGdUaEhOeUR0Slc5?=
 =?utf-8?B?UDZSTHRVRHZ3anE0dW4rN05KMU1UODZrQzNiVWFaSXhackJXODRscXNSd3VU?=
 =?utf-8?B?M2wzYW05NUJSWTZsQm5ycFJhSTl0YzNWa3l3S2tBRGlkNitQc0VYdWNtL1dQ?=
 =?utf-8?B?TjZvWTQ0MTExNG5TZUVQNEh1dlFvc20xeTZPaTdSQ3NwQ2NYa3dyVWIxWnB5?=
 =?utf-8?B?UWhleXVmMVdQN1dmL2IvZHY3c1hVQ0NOZ2RTVHdiSUJjcmxEVDJBSTdueE9Y?=
 =?utf-8?B?QmhjaFEwQWJvREhDbnhzSlQ1NlVKLzhwZzJZZVR0M282aUt2MjJuQWs0VUNL?=
 =?utf-8?B?bG0wNlBWaTl1V0UyNTdZWUc1Y01iVnF1YUd3eUtZbzVzUjhSN0d6RytEOWhP?=
 =?utf-8?B?M2tpdjNqaEtFOU9lYWNNdlRsL0VMQXNGMWp6dXlHY016UWZYV2VjMG1ER1A2?=
 =?utf-8?B?MTJISmdBWk5zQmN0RmlUL3czUFh0YkQ0ZUdHbUhBVUNTWlFwcHovdnZUaTE0?=
 =?utf-8?B?VkVocDNSMmxBYWU5Vy8wNDNSczlIVjFCVVYvdGdDQWtqM1JHT0pURTJMQlNJ?=
 =?utf-8?B?OFpiRmZ3UkdzRndUejRLZkhhRVRWdzRGRmpPZFcwYyswQUo4RC9rUStQV2Y0?=
 =?utf-8?B?V05Kd3QxTEhHL21GSlBBR3A5WWtYZytuMllzTnhXajBDbW1zcTVHL3VoZ05J?=
 =?utf-8?B?SzBFamJEZ2k3eDI5bzI2NGNPWWIwODBSZUJyMG01N1lZdUpCdUxzYTl2N3VK?=
 =?utf-8?B?QlRUTzBXN2F3NDZ0NlRzTVVwNUxzMmJveTRxYUdVYldnR0RZVVpMejN2VmtQ?=
 =?utf-8?B?UkRpeGNxK2pzV2Jscnk2TWFaL01ZbU1PU0NMdnJZWWhOTzl4TjN5R05Hb0tM?=
 =?utf-8?B?alJLQW0yZUJGeVh2TzVJZW9OSmV4MkdwMGVQS1dGUzBZdjBQWUczaTQ2ZmVD?=
 =?utf-8?B?Q1hPTzJGVmZpblIvM04zVDMzelcrcndZYnl4SCtMYldRaHlEU2dyT0llZGxY?=
 =?utf-8?B?R1RjQXpMNGlEemdCekdnbEk2V3ROUzFFK2d1cVZtR2JqMnprQmZHdWs5NGxY?=
 =?utf-8?B?bndtK2lNVGJ2ekk2VGtUb0dEWkN6UHlNd29kU1NIVTNLTkxxNmZDb2pGMnhp?=
 =?utf-8?B?R0pVTVpEd3lsVEZNLzJCM2o1Mkl2MmphSGtDTXhOcXd6eXRtaFQreWdvMnlw?=
 =?utf-8?B?UGZaY1doMituZE5HWFB4K1hYSkg0MDJTb0ErRnJiM3FtN0NOSEJtVTh4Wkk5?=
 =?utf-8?B?cncrNHExeEo5aWliTU1sMG5kR0JzNUNicUtrZ3BrOEJXcUVFUmxRZ0xwRVFr?=
 =?utf-8?B?NkF0aWdVVHQ3OEljcCtRck9FUDVKMmxyZzVRZUJ6Vy9wNjJ6MmRyNGFNWTlX?=
 =?utf-8?B?RmJzbVJteDNTWVVkZzlEMjhVaTM3RFpOTDhPMk5jSjJ4V3U4enM0eGgvYjdP?=
 =?utf-8?B?a2UwZTlTMGFvaTNCRVpWWUIwRnJnQnlTNzhxVVhEZitwNDRyK0QxVlJadk44?=
 =?utf-8?B?dUxzQ1NHUVJEbkp2R3BOTWJMMlVNQWZyOUcxK1ZyektEdDkrdkRNRnUrSzAv?=
 =?utf-8?B?MnJPRElteGNnWFRKVGdZR1FxNmhUcHJHODExUU9Da3JTcU5iQ2NuMzlWOFZo?=
 =?utf-8?B?WG1zZUVaQmVzVTE2TEtPU0JRVlQyK1hlVDBQWWV1UmtnMVIwYVdKQ21XdEUy?=
 =?utf-8?B?ckhNWnc1TEhXT2cvWEJZMlByVW1kcXBxRUR5VkNaOHMyc2NhNUgyRk5KR0pG?=
 =?utf-8?Q?cNsEuljXcu5P9e6pv4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 664e24b7-6627-49dc-d171-08de8b43f78c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 14:28:36.8523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HtCs3lVd84P+SAg5xYBeuqd7GAD/6iLiVTb0IyX0wquLR6j5m0wcqzNEdVgevu/HOxTtcjNv7XzKYBNr+BhcQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12092


On Tue, 24 Mar 2026 19:04:58 +0800, Xu Yang wrote:
> When attach to PC Type-A port, the USB device controller does not function
> at all. Because it is configured as source-only and a Type-A port doesn't
> support PD capability, a data role swap is impossible.
>
> Actually, PTN5110THQ is configured for Source role only at POR, but after
> POR it can operate as a DRP (Dual-Role Power). By switching the power-role
> to dual, the port can operate as a sink and enter device mode when attach
> to Type-A port.
>
> [...]

Applied, thanks!

[1/2] arm64: dts: imx8qm-mek: switch Type-C connector power-role to dual
      commit: 755d74cc06950d0f0449794dd23f42669811f6c4
[2/2] arm64: dts: imx8qxp-mek: switch Type-C connector power-role to dual
      commit: 8c5dbb306887fc81737e0077b9d821909f64a5fb

Add fixes tags for both patches

Best regards,
--
Frank Li <Frank.Li@nxp.com>
