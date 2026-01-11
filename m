Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013051.outbound.protection.outlook.com [52.101.72.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 537CB33C1BB
	for <imx@lists.linux.dev>; Sun, 11 Jan 2026 12:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768135282; cv=fail; b=cAMgwJrPYv6+NjPJgCYx7Sh8KYRRsOZ55CWStX8C6RIQxZfcSe40EkYn12+dxJWnudogot1CpIS/ulJoiIQkNpYfZWq9bhGzNypv1jtYSemwBVYmMYuyfQ3buFsqII3gVZvOHOga2Uc5cxlrnKPdfaMs+D8wVK1rJrjKXXtld7I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768135282; c=relaxed/simple;
	bh=tPPk2xbGHNZvFiI1QhOqT1mkDiJil4hW3dkljqsQIL4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=hy9XlqNNx92GJy+w2k+Q3VT27KHAqCxcYc6njsB/Zj7Vl+K2WFHQAs+GDik0K88HflbgJThYTKv0U3Ku4GyUf2ZROZVm43cZzaVbkmbPzn0/ubceVHWlRC2ULL2fsGuM4cUShyDDdRBrvIYA+pZAofUVeNcOK0JjkL8uc8zy2Tk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=R9zLJ+7S; arc=fail smtp.client-ip=52.101.72.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="R9zLJ+7S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CHNgdXWyW5RfGB4VVgTrHLYPGhSxrmO0HkviEVYc/Rq8NG27LIdfV8LC1gBJtayGzonMqGqLoCGosxZwBDTlcJiQTiaoZFUxAAT0qb+D+I+N8s//wPPXxEH41JaZLs1F4vmldU0B+bXK4Fj5ZKhN+rKGRIaIJM2cgZXphL3AHZ/B30/U3eVvEul/2Ejgta5zWpudEc8yXM4Rn7YACSSWJuwlZdf7VULpqe8d6KhM+8JKTCuALrAGgI3TeyawQkfIDo6IzVEvB/Qwblok5Y2QtwelbLbLxeqDGLcyMqgAIIgw3bn7qJoHYK0z9rfD7RKortl9FwRR0kZsBHGl7vrx7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BB6RS672ZZiXWllL9KgiC24zbC9Y1tx1IsFa5q4UkJs=;
 b=cfG5i/1k0Y+9ExQqNaxBA33Pd33HsxjC3aGki9c/4bJoRDZcAbuylDC/B60StGiLK/v7mv8oeeJrkBT1Q1zf7sDruNifXdBAACw01zeReLsNa3fbyyBIHo0HBOE9TM1tR9VDtsPycV5/RXNQugNnq3jQVMgPIskDNULLk1WFmyQGOK8fR9WC54xSA6A714AC0FVpPizFh2oNOk8QLoevUjvqBQk3BIk2E72C6JcvghQpupszv8V/Jj37JLKV13PCS+H7kHGZUSC5WVJ80LwaN/8+2xfnhuKPE1HHRk4tqhhzW9GREkl1gjN4jzLDk6xtGT58Xu6W5QQmIXUrHOjHYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BB6RS672ZZiXWllL9KgiC24zbC9Y1tx1IsFa5q4UkJs=;
 b=R9zLJ+7S/Y9B6Q3aUvb8YUGzfqJypIx8h3iuDsckpiEqq+B4BiZi0O3YRHfH2u2wh/R6zm1TvQLLBrkBL69xCU4EJMcdcsuyPpBlFEbAG+9PgAfl/AroN1jZDNkVZSQUghVmDlvoB/fE4Cf07p0vVN2sCHPXCMZUK0Nb65dIGVg7q3Cmaw0HgpojgM2AW2PDSMWUhZDuRmoPtDSeApOqDPJROCwvWrdAl5sK20Cd2RNApC/71zBFtKFMfpwP6qCNK4vViXkCTKbDY/WkzrmE/kzHkWYbtuMg3B7gLNM0YYWh4mMQ/n+bVEA4RYvGxYev2sAIvZwDXSRlwzt0eH5Dcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GVXPR04MB11041.eurprd04.prod.outlook.com (2603:10a6:150:218::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Sun, 11 Jan
 2026 12:41:07 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9499.005; Sun, 11 Jan 2026
 12:41:06 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Sun, 11 Jan 2026 20:40:13 +0800
Subject: [PATCH v2 07/10] arm64: dts: imx952-evk: Enable wdog3
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260111-imx952-dts-v2-v2-7-5773fa57e89e@nxp.com>
References: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com>
In-Reply-To: <20260111-imx952-dts-v2-v2-0-5773fa57e89e@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI2PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:196::18) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GVXPR04MB11041:EE_
X-MS-Office365-Filtering-Correlation-Id: aaebc351-c8f2-4497-79f7-08de510eb08d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cjlXeFQrS2JIN0kwUTFMNnRZT2RqVVNPK3hXMDhSR2pNRzV0enlRa0RjTFB6?=
 =?utf-8?B?dzhiWFJLbkpoc09ERTFzYmVGK0J3TDByVEg2d1MzcWVWOVB1TXVYS3JMcDBk?=
 =?utf-8?B?YmgyM1FHMWoxQktRRGRydEhzZkhOQmFwYUdva0tWWENjUUtiNWRtaVhBNnd6?=
 =?utf-8?B?dHd0OWZLZzhqczlaTkprclF3Mk96QW42dGtVWHA4dklTdEE5a3pZbDFVajg3?=
 =?utf-8?B?QWgyZEJ1ZmErelMvL0F4OUdUZVk1aFpRU1JZb2UzVU5GdDhtU2hwaWdRS08w?=
 =?utf-8?B?RFhCMkcwSGxsTTgxVVlTSlFtK3V1WlJRRTg2Q29MMXZEMzlEMy81dnpFaVB3?=
 =?utf-8?B?K1ZmZ2QvTnI5NSsyK3FzbTZYMEZyQnRUcU5RdmwrbVBvSVc1eXhnYnpoKzRz?=
 =?utf-8?B?NDY4MmhrV2cxUk1ISHFUZ3dmbjM2QnFWODZtM3UySFhRTFo2SDRpbFAzT25F?=
 =?utf-8?B?TVBWaldSR3RrYWJ1aFRGVXZ3UVpyb0c4R2pZR0k4N09LU3AycmQ4M2w2eUxs?=
 =?utf-8?B?ckttSVdHSU9HYTZueEd1NHRyU2FUU3FUVGVKdWl5M3M2dmRoWDQ2Z0N0TUxC?=
 =?utf-8?B?cFMzdGxMUGJ2T0ZNY2RJaTgwOXI4QzRrVWNDSmR2MVFaOGVvcG1nU0xiYm9U?=
 =?utf-8?B?T1JleWplNEFvOU1nL1RwZ3MweklxV0N6a0ZZMTNLc2JRWWtva3RJd0NWZFJ4?=
 =?utf-8?B?TlAwZ2RsUEZnUU9PQVk1QTlVWjZSQnFuVkN6OXUvT1ZJSUI2cFk1a1o5dDcz?=
 =?utf-8?B?T1BKcWVOcm93TVBiTVhvajY4VGVoK095RDkrZlVCMzRwMm5HaGpEeGdFeEVV?=
 =?utf-8?B?OGZOOU1qUk1xbDVFRHU2Rm1NZThWTUZXVkJJWHRTOTgwUGVwV2lpRGFkQThH?=
 =?utf-8?B?bS91ZFRnaEJGWGpsVkhGYnAvK2NnalhySnUxakxJUmpld0w0MWpPMS9Ua0VT?=
 =?utf-8?B?MjJKWVdmL1JrSFNscnlseUx1UWMwQ0RwcDBON2lXbTNwQjZ3MnNLbDlXZXZF?=
 =?utf-8?B?UzBWRjVIOWlaVG9JNURwd2N5dmh3MTRGeUl6TmJmQTdzMHN2dGtUKzl3bXUw?=
 =?utf-8?B?QXJCdkM2ZTJXUG5XT1RHYWZKV01qaUpvc1l0ZnE1NXVDcmZ4Mm1SbUt5bTkz?=
 =?utf-8?B?Myt5UmNIUkxrcTduMVNsUFdVQzh0M0lZMHdxcUpFViszajRFNk5CeUpKSG14?=
 =?utf-8?B?WlZYL2cxOGJMU3NtZVRWSmQ4V3FRL1dvV21BU1lyNHRJck16em1qVm9xWFRR?=
 =?utf-8?B?VndFM2x0NXBBQjdTWm1JQXBhT0laZjVDUFNsNHI5bFpMbGZiYmNqemsrb0R2?=
 =?utf-8?B?ZG1JUmhwVkk3MVl3SzdEYU1sbWYxUW1jV2g3WGptVlRNazVqOVk1OEZCWjJ3?=
 =?utf-8?B?SlJiUWFXTTJ0RHFPYmRrRTQ3Zm1OTUhpdEZlSlZHekdxenViUCtselBXRFBq?=
 =?utf-8?B?VGpjb0E3WHhvajJLYUNteG9tOVlSNnJTWUpmYWxCTnlpeG4zQ3A1SWtHL2lG?=
 =?utf-8?B?ajBsL3VXQlhyNlhtNk5tV2JGU1ovRXROUHZXZ1o2YXhKWUF2ZFg5RExUSURt?=
 =?utf-8?B?NVZqaHdqYlh3STFaTWZpcjVtUGdrdW9waGpZNWJNb080OThPcWdYaW9MbC9G?=
 =?utf-8?B?WFJERHpqNDVmSk0xYzBseitTRExRcXZlczRlbGZGQk45cFVGWkFpOGZFRWNG?=
 =?utf-8?B?OXM0dzBLdEcweHIvaHpvdnBUWXJ2andYRGJHVjRFdFhtZmVEMk9ISWFuSVoy?=
 =?utf-8?B?MTlYVTlMNTZhTHZlblVZWkcyWkJ1bzJONEVSY1BaUjNkaFJXK3Y1NGFPanNN?=
 =?utf-8?B?dU5RL3g3SkI0NTNiandsTFYvOTlKbkRvbEp5WDhIMklNaGFidThrMGpkTnE4?=
 =?utf-8?B?WFNHeFYyVndieE8yZDJSTVR0bEdJR2FwTzlvWEVBbm8rcUdSSXAzbHN0ZWNj?=
 =?utf-8?B?aDJyRjVkejRQU1JrQThmQlQyVTBrbWZ1ZjBDV3ZrRVo3NG43MWh5WWtVdGwy?=
 =?utf-8?B?bmJpMm9IaEpJcHI5cUdpdWtiOTZiUWk0dUd1RlBMOGlVZXRzWjRPRTNnelNk?=
 =?utf-8?Q?wdAH9f?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VlluUTBmNlRsRkt6eElOUUVuRFBwK0dlOUZsVThBN3Z1dXduUzBFOUVsSkdG?=
 =?utf-8?B?bWZyVzQwd2tyR3d3NEtlelBMa21EdEs2UlZiQ1VRSEg2MFEwOU9yWitQdkk3?=
 =?utf-8?B?ZTZaK1BWcHVpM0ZMVnVHbDkrOHVhZVVTZE45bXVpbXArS0w4S040a09ZQUNV?=
 =?utf-8?B?bXY4RHhmNXhadDhqK0N4VGt2SUdZa1BFL2QvUWJ4THdvcWZjK05wZXl6SGNh?=
 =?utf-8?B?OUw2TTVWNjdJcldrTDNDTjZ2bkVRZDRwdHdIOWlzeE5Heit2amFGRENXdEZI?=
 =?utf-8?B?dEtXTGp0Zm5vRGtkUitmakNhUlkybXY4YzJjQ3dPSFRPM2txeWdsRXpwVXN6?=
 =?utf-8?B?dHpvWmxVNFRNUXgybTZEMVBHNVpFVGxnQm1pcitIbjFqbkpBcyswcTd3dUVV?=
 =?utf-8?B?K1I1cTBWMnJxczN4VXY2MkNEanpYeVhpR2hCbndQRC9PTzV0TjJObzUra0Vs?=
 =?utf-8?B?VENZYkNXbFFwUmhlTlhKU20zUVpJMDFOaHZ3dWVhVDBybkY4NGRZUTBRdjF2?=
 =?utf-8?B?a2hJVGZ3UXh3Tk8xZkJYc29RRmlTYVBvNWZJdnlqOWMwWHdmVWVqcDhkZE1Y?=
 =?utf-8?B?TUIwU2gxR3VDQUhaMnRtM1o1UElGc0lIM2ErTElwNzVtMWNCTGI1WTNnSEtQ?=
 =?utf-8?B?UUpReTVwbmw3UmV6THUrSGt1UlB2ZWlyNEZlUTN1TklLNmlsWUw0N1hieHdP?=
 =?utf-8?B?N1NrMWk0djVXd2pCbFpVVERXeVZGTXpRRmw1VU53WWxaR29xaWQ3b3N1V25z?=
 =?utf-8?B?RGtXY2JEU2FNdzJjQ2RUaEJVZWVsR3FZdDdlQXI2VGVLOVYzYktQSWVMc1Bo?=
 =?utf-8?B?K3JFU2t4dDRUdG1VQnFYOEhJQmowY0ZacUJHdms0QXR1cDI1LzVYUnh4U2Jo?=
 =?utf-8?B?SjBGbzB1RHRnNFdMNUI1VXpWcExWb05RV3FuSWpCUVFKNFBuVkEzblBteWJ6?=
 =?utf-8?B?MEhPbUl3NWl2Q2k2OHBrSU5SSjZxcHRPMzRGa1c1NEFVaEpGdUVtTDBIRGht?=
 =?utf-8?B?czJoUEZJalJ4L3VRaERieG1HcHZlQk1SOHF2R3RRNGFqTjJ1dzgwTTcxTDgx?=
 =?utf-8?B?L1ZySzVlUUltU3FIMlJoMFJuVjNLUjZNUjk0dXRIaTRiakN1N2phYm1sMmNo?=
 =?utf-8?B?cmoram13eTdsQ25YcDFpR1F5MVI3Sld2UTg5c0R6WklsanNlYXZPQ1A2RUl4?=
 =?utf-8?B?L3ZqWmVyL2RxVkt0bDBCZHcwc3RySjNibVpIUHhGb0oyWVNZc1pKVVpJNHRt?=
 =?utf-8?B?OEVCNlpVNGw0TTkwcVNJYW9uR1BCd0M0Z3c5ZEN6dzIwYjRIQ1FxZzlQcnU3?=
 =?utf-8?B?anNSWUMvNVRqUlBFTEtVTHRra3RrTkR2ZWJiN3VYU0hoMTV4ZGF1MS8vM0RJ?=
 =?utf-8?B?bisvaUVQYXB2TjU3Yy9sS2szV2I0UUxzckFmcXFkbFRWcWhqeFFwbnpyanhB?=
 =?utf-8?B?SmdnRVpQQ0I4VVJoSlVudFRuMk0yekNocWhZdnY1bjB1ZEFzNGs0b3hpUCs3?=
 =?utf-8?B?aFFXZmJ4aTAxd2lmb25FOHlURE5kYnRhbmpwS0VEZU03MWdXNktyZjBEelpO?=
 =?utf-8?B?bityaHFVa04ya1QxMUx6eU9LVllRbmY0MEN3QlJPRnFCZWx0ZGxLcllyMnpF?=
 =?utf-8?B?T3Z6NlFwYnZ1WFNJbzRrY1IrTG4wWWlUK1JGeDF1bXhKMHk1T1FzMlROTWFQ?=
 =?utf-8?B?d3c4eEYwRE9NcW5tY29nOUhOaXBJRDVIaWxoQ3p6aktJbEpyRFRIajVpMGNO?=
 =?utf-8?B?Qm1tUzliTXJIU1JTdzZoK3ZOMVgwUUlsRjU3bC9qWVhzUFZETExURFlqMklx?=
 =?utf-8?B?ZmVOR2xxVWZrQWNTd2QyNlJyM05uTkhLMTZMZytBamdKbkVNUjNPOEl6dEU4?=
 =?utf-8?B?cTR3SVdOMlpPMHhMZEhGSGdlUTQ1TEs0S0N0eGhnY3BYU0hLbnEybmZDVEpI?=
 =?utf-8?B?QXNWbVExSEVBd3B2cDNPYS9QeVZkajFFRjk3MzZON2gwT0p3eUE3blozUXhq?=
 =?utf-8?B?SklmSUI0QUtiNzJrRDh4Zk5SSGQ3OE1hWHZUQWpwOFFsZkV2RnpndUYzOFNl?=
 =?utf-8?B?K2Z3T3ZlTUMxeVM4eEh5N0tXbnlDOVg0VXdvQURBbnRwZnU1TEMzaDYydTZh?=
 =?utf-8?B?MlQ1eE1SdjF5NkpjYjRHTlRwb3I3M1FpMStvbSs4a1hJNGFiMmFjOHoralRh?=
 =?utf-8?B?RFZzdmVkQTQ5d2phTTFROWFKV1JMY2tNRDFzMUNTZzl1Uk1teWkwTkhDbkgz?=
 =?utf-8?B?dzdiY2JmN3pScGxqQlpXNDNGOUliVGdTSDhNZlFhVHpHNHdnVWliSS9qU2lJ?=
 =?utf-8?B?T3VPUk9HZWo4SmNFN0tFWVlBSFhwcDlhQTJwaWx2L3ZRd01VSW12Zz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaebc351-c8f2-4497-79f7-08de510eb08d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2026 12:41:06.8956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zzEMqwwfwwQA7rxF1ny6sqvmpWe5giKgQoatvR0YRRBbVhtLRw1zBEgYaKCFHF3t/DwRdScT5XrOPUrIMo/eIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB11041

From: Peng Fan <peng.fan@nxp.com>

Enable wdog3 to allow System manager reset Linux.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952-evk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index 0b6b28c24e465846e9d9664c44248af1ad407d73..24a3468b1817a673765a9a9cc378d5830d5afd97 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -314,6 +314,11 @@ &usdhc2 {
 	status = "okay";
 };
 
+&wdog3 {
+	fsl,ext-reset-output;
+	status = "okay";
+};
+
 &scmi_iomuxc {
 	pinctrl_lpi2c2: lpi2c2grp {
 		fsl,pins = <

-- 
2.37.1

