Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011028.outbound.protection.outlook.com [52.101.70.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F7A1DF248
	for <imx@lists.linux.dev>; Mon, 20 Jan 2025 11:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737372509; cv=fail; b=nb+HUfDKgwzUXx27yPYc4lDWWT/H+mieWt0DdF1iz1ZrPB7UCGn2lTrKDi7BnaywTsh6nnEMky3FPv6KcPho8v3FBGiBzjPwvMNiNotKX5v2c44E01tOLEkLIIqHw+kVtIjX1lKKkPA82/ocfmopnQA2WdUWYH3GWNGxwxjih0Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737372509; c=relaxed/simple;
	bh=FwHu8HOgjdeesS4jBLvkey7Y+WnnBYkcgUp1hGR75ZU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Nxgi3rLW9OYYD5w6HHdWoOc4SnAVbfpbAV6ehts0GErSDXOV+kOJrp+CnEDPXRWMR3KD48S2x9EOH4gyuZ8Kjx8XNiQRMKJKZxS2fq5smE8SfJNmp+IKdpZ+nT+3cit7ej6479ycDEsPrQ3yYwihObtC0q9P2L+MSIBX4N5c2WQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IfcN8LkA; arc=fail smtp.client-ip=52.101.70.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IfcN8LkA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJH8TjO7IWQ6j5AwFTCluD5bdraFgDb5rST95TK02wZEgUi3sU2HlQ7AfE3TBmDiOcujJiP1qBADZ8AtqhHKR7fKsJ5X9NUNQlS8RuGKf/FAWn2+8dIt7BmNlqrflnn8gZTrJqd4ZdUsZupT9rZnhhB63L5Ay3VMjORqutz/J5NO8Ssj+0vuSvFwgeGEfU13iDyuTwl75e2bXpMVBUsYaACZc6PIMijNG68cN6bHP9zJoLocGqJJhLaYV1yFap2SRY9slM3rCU2bEqEpvykgsPD+UE4JfYU1ZsFupfmgTqs6Vri74GkG6SJj99Ay1XLKX2KA3NVkX/hw3vFLXGsdBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rydjPSyjFpE1b+KVUJhSPw9jPLhoKfIzwxtGoWGJhg4=;
 b=e//1lb5rkhV1RdLnyyGBZSRgxWEZUe/QYfuYCTJBe7egw1KxRexR1mGWPvWAdXfSpn0KzLzd2z6Uar7ezDeHsx2jFQZsOn2wOdTcKMEVlGVFq9iudCENkksPD2OtQAETXI60aI4xjuxGo9iAeno0JPOs3G2iE9IUY0pZuR0b0Vqayd+W6VcHoJHMqvxbkvM18vItXa+cYXF5fK5E58DGodIUB5wmWb0w8bJCX/zvggFZShctGQlmdzbOA55QENhw/CQHu3s48ol5GzpW2oYXKXGvQ3MPCxLR1B0CJ/U0UIUUqgiDhj/lfu6wB2CDyZBnVx679xuTxz2eKQbJvfABcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rydjPSyjFpE1b+KVUJhSPw9jPLhoKfIzwxtGoWGJhg4=;
 b=IfcN8LkAgYaZTjEaoPa4UVvPeNz2dd9tPMUQh51pPR/2Ydknc4HlJZ3sRYMbVCTT0+1yUqMNd2L4SDY8LrDSjOxoKArkqfN/IwNoF42cHY6cf3PfDsa27fWFbHbs7dQn/6Cc4ZsQzc9PSS4GSU/3LihzYT4RGbTeC+eFNDEnFF6AmCpMewFBYItOtO+XArxDp1+fKbzyB8WSHMZDXCe5kpkL55DEJhmIlOkrHHY+ytDj7baWBE0n0lCDfJmdMgLYNmFls6Nq9X55KHGqm4NLmDHpN6m0f9wIyEaTLuzIIs69mzjxwQibWdmJxGir3MNd/74xMXeWFn9E47st/BNSSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by AS4PR04MB9551.eurprd04.prod.outlook.com (2603:10a6:20b:4fa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.18; Mon, 20 Jan
 2025 11:28:24 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%5]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 11:28:22 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Mon, 20 Jan 2025 22:22:19 +0530
Subject: [PATCH v12 1/5] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250120-imx-se-if-v12-1-c5ec9754570c@nxp.com>
References: <20250120-imx-se-if-v12-0-c5ec9754570c@nxp.com>
In-Reply-To: <20250120-imx-se-if-v12-0-c5ec9754570c@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737391948; l=6679;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=FwHu8HOgjdeesS4jBLvkey7Y+WnnBYkcgUp1hGR75ZU=;
 b=FkDT1G0Atyo7olhjuBC+wodw4DNxmd/iD4OuRdhPUwo/WMdyniGH2PLq55ZHrdv83/EoZIZMk
 29yp4ShIuOzDcPYAHolOswhIpu7liDcxMhnUr35V3kXzzXAlZGcnurd
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|AS4PR04MB9551:EE_
X-MS-Office365-Filtering-Correlation-Id: f28d382f-0526-4994-d425-08dd39458c55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WFpvMWk2WkVMakx2aFhhb1JySU1iRFN4Vm84VXBJV3ZJUXM3a2JqcXVRcnlt?=
 =?utf-8?B?Z1pMbm05YTkvN3pTWmw5bUUxQ2s1eXc3eFVjSzhkU1UyVFJhTWl2TWpGWDBh?=
 =?utf-8?B?MCtzbkxwYStuR3h6Y3NVaFhMU3RXRkhNVkcxTUpkQ1NUbHZzbVVFcElQaURj?=
 =?utf-8?B?ZmRUOEZPUzZwK3JHMUdoQTFob2VpaVhSTnhFVXZzZGp2UkVSdzJmL1BBQVpn?=
 =?utf-8?B?Z05zZGdocTNCejV4dXBpbHhRRWNhOXBRU3R2VUIwLzJCdm1FU0lBckdtbjFZ?=
 =?utf-8?B?eE5nR3l4R3c2Skg4dWxIQkxtYkdWL29aYjN6dzREay9LTFp5UW5yVTNUUHJw?=
 =?utf-8?B?V0lKQXlyWGdtK3gwK0Jvek52ajFhYkYxUTNlbnFjdjBMY3VLUkdFdWlrYnJL?=
 =?utf-8?B?UFRJdXB1RlNDU3gvSGUyNkFMZnYzMFAwSTMwZi9hYlRyV0Z2MWorMlRRNkNX?=
 =?utf-8?B?dittcDViYWp5VzJYS0d1ek94Q1Jwb2VydXlYQTJpeTQvb3FpQ3JCcFFoS0ty?=
 =?utf-8?B?eVRlcjQ2Z1A4cEVyRzAzVStuQnVWcm9qYkd3UFp3QTNQNTVnT2FLdmxLTkdD?=
 =?utf-8?B?VXdDczRKWmNSa2cvMVRuT1U4cTdyMjRVaEFkYXhNdFQ1U3hNSHBZWnZFQXh4?=
 =?utf-8?B?anNkcGFFNXZxVGUydkNKb3hBOWwwZXg4YXFXMlU1bGxZbGN3eU1LcWJOd20w?=
 =?utf-8?B?TjhQaFpXcDEzSGU3djlMc3lXdlQ4cmpvKzhXU2NXeXNQc2doaVMyTlowend6?=
 =?utf-8?B?WG9nYllKWjJSZk9jSXVqZkJpRUZQRENnYVVDM1FnZnQ0RURDZnNPUW1nOHlC?=
 =?utf-8?B?dE5ZUjJQTWFNbktEYmFKNGhlNjlLdk1QMEVGUGJXNkpBVG9CU09lbDN4SXRZ?=
 =?utf-8?B?bXFNZmN6VlNuVHJtZUJBR1Vic3daUFNjaHBiQ3NoYkQ1bFhPUmUxazdzRkJq?=
 =?utf-8?B?VStuckRZejZ1U1RrRS9zdVJja241cmVocWR0NkRQWTlDWndIMDNzSW9sTk1N?=
 =?utf-8?B?bEhKZVRiZzdUbFhrNFlZekpQamFNUmVLRHc5MFFCZ1VGUFFvT3RTQW5BcWox?=
 =?utf-8?B?R3RzTzU4RzBMR090Y0g2cGFjS0gzSTVtZVNxc0lsTkJqZnlNZXk0NE9KbmMv?=
 =?utf-8?B?NU8wREpMcEJDdXUrNk92RE50RmQ4OWpUZmV3R3BDeTNHYWs0MFkxWHpqbFY5?=
 =?utf-8?B?cjFsSmZLemwraGF5T0MrYm5qdm1rdEdlRG1Hb1JTd0NSd3hTbWhnWDVCclhW?=
 =?utf-8?B?RDVqN0RqRWxERVlPWGRyUDl1ZGtEbm1rWnlvSDlmdjF6RlhvTXlxYUZnbXNl?=
 =?utf-8?B?dVduYVVhSGxxcEdyUnU0RHgybVFBMlV4akJMbWxHUjNEMnBTSXpkVTlZcXFa?=
 =?utf-8?B?NkJ0dTdKZmNZellTQmFUaXUxaUhMUTZsWTNQQ1psMlFQcng4NEhYUFM0U2Vk?=
 =?utf-8?B?SHVhR3FNa0xPR01hU0RDekxXRnBTdUVFWXM2UVBVa09YNlo5WkdTQlFRNmFv?=
 =?utf-8?B?TDhJQTdrelVGYmRkdTExTmFpT05PT2VPWHEzaG9GZVl3c2Y1YXB1TStBL0s0?=
 =?utf-8?B?bWJzZi9TRWcyVi9jNzNjMUxTR2oyZDRjMDhVOVBDdTlqSHpBeitXT01lVHVI?=
 =?utf-8?B?Nkhpa0g5QkhwOTBqRDZQa2ZOSHNWOGd3RGpDaEU0V3U2b0IxTWZia2s3YWV3?=
 =?utf-8?B?ZXYxS0pWMnJ4a1ZmZUVWYW5jT2xuWmlxbkRvVE0vN05qcFUrTTNRRk5EdHMz?=
 =?utf-8?B?ZjVESjRqUHFOTnlNaDRXWituT0k0czlJMXdTa21tYkRSQWFMbnA4L3VZS3Rs?=
 =?utf-8?B?M3VMT3NsbVc1TDAwZTlvUHM4MkhHVjBwRlFEc2VWcEZMMlp6bS8wT1pOUTdv?=
 =?utf-8?B?OURISFlKNFV6K1hRcTZldm9lYktCeVFlMXJaMUhGSm0zVHNwRmVJUGZ6eW9h?=
 =?utf-8?Q?5cxVg9yZjom0ZIpEhTOW9j4XyylrK1tP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OERvMmNUUzZSejFMejBHYXFXSVVxcDJscm1iZE1oczlYY3hCdFhwdVVFTGVY?=
 =?utf-8?B?TXV6eitPNDhZS3J2cFRiZGJPcXpsM3ZwT1NTazNLenlUSjNZSERVYnRlOWV6?=
 =?utf-8?B?NmliRVI1QWV6S1FMU2R3YXJpSXZSai8wanl3em0vUTRyYlZidzB4NXdrbFNJ?=
 =?utf-8?B?TCt5d1pHWmxWSjhLNkdic25KNGlzak9BQ3UzR29Cb3NUdEp2T0xSOWVFRFZn?=
 =?utf-8?B?aDRyREtLMURHNzA5Mlp3K1dyWHNFc3B5YVBIdDF0VUdGT3g1ZU1rdStOVjRN?=
 =?utf-8?B?aEFCNU9JdExGaGlaaENOV3htK2ZrS2hzRVU4dXREcVl6Ni9xUmo1L0dST2s3?=
 =?utf-8?B?ZnpLQzlaR3dmNFE2RkNNY2FnSktISGpTamdWSWMraFliYzZwVUc4UVU0Q1Qv?=
 =?utf-8?B?OEh1UFRqdjlJdm1ZdTZHU1M3ZFpnQzlYdjF2bTJzSUZVMnFrUWRrVzJUc2Mv?=
 =?utf-8?B?eGRPeXU3YWhvUVhqMWtSU2FnQjBvTmJBa0pydXhhc1c0cjZ4enFEekxIUnRV?=
 =?utf-8?B?WTVzY1d6bW5nL3BOekhJK0dMSjFnUUc2ZlRnaVJzRXpJOVk1cEdid3RvRFhr?=
 =?utf-8?B?VjZmSGNldHpvSzdJbVlQQ2FRdGNQV0RhZlRySFNSaUJqUzJWSzRXOVhaMzAw?=
 =?utf-8?B?MXMyaXNtSWlGREJEckduN3FnRzQ3dnhPdUpDOVI3aWpQbk5idzI2VDFQNjZr?=
 =?utf-8?B?ZFh1eFhRUTVDdmlxUmc2dFdMSWZsY1NrSmVwSW1Kb2pDME9VeDhYcU9TOE9k?=
 =?utf-8?B?SldNbEZ3eHBBSi9scDF3YXNoV09VQ3ZlNGtDQ2JUYncvY2k0NDdOOElRT2VT?=
 =?utf-8?B?N09TL0wwK2hGWU1uODJ0c09oRS9FV0w4a1krK2FPNVBGVmNsRGFBcjFsaE9G?=
 =?utf-8?B?cGlMampUTjg5bHhBOWJjekdCaHNHSmJvc04yOFN4VzNRTnhPQkFsK20wWE9I?=
 =?utf-8?B?QlRXdGNiUnRHSlJCMlNsc05mQkYwelJnc3UxU284a2JZUnVGUlRJZXZLUkNB?=
 =?utf-8?B?WTV3MUJST0NKVURTTXBoZkJhNjBzSExqUFFiWTl6THFiVGlHRFVtcUVjUzdQ?=
 =?utf-8?B?Qm84SXdVRGM4S25oeVh0bzc4ZmhFQTNzZVNtcG1LSVhGVkRIeXNURjhBeThy?=
 =?utf-8?B?SWYrNlRPOVJ3NW9pTUFFanVxeEdwbWlNWEVNeUt1bGxVSHV5aG9YajQySWZT?=
 =?utf-8?B?OTJxeGl0S05tOXBYQm83eXl0ZStXNmRqQ1AxWm5NV2V6R1V5TDU0WS82YkVt?=
 =?utf-8?B?Rm9iajJrY2w4Yjd6ZnFzUFpVNkFCc3NCaXVlaGQ2SWZFY0pLbldqcVlZazc3?=
 =?utf-8?B?aGxBc0IzTHRlNkdobVIyYkZ5ZmJJNE5ubW10U3BLQU9jY2F0S2plNExmbVZE?=
 =?utf-8?B?NmdMRVNYcnpXV2Z0dVNTWFpGeVB2clRicFBKdWxYMkVsaWpkSXByRG5va2JD?=
 =?utf-8?B?UE9Wd200dnVyc1AyeEo5SWliUkx0UlA0TEJ6bmxndVFWVVh0UUpNbk1HOWRQ?=
 =?utf-8?B?aWlNb2YzcnNaaUxoN21velphWSs1cXpNbGNKVlllSit0U0NZakduSkhIVS8z?=
 =?utf-8?B?L01YZFhxRm5QaGFOLytDSmZ2TGxTZmFZUjBFNERkaHBoWHRMT0tReExMSlBi?=
 =?utf-8?B?Rk9TUG9PU3g2d2t0THJ6ZHFJMnRLQ1dGVjZWYkZMeWo0VnNQOUQ2UnRJQjZx?=
 =?utf-8?B?anN3S2lSSXBQbTJhUXluRHhSNERZZXFYUUdNMjQ0aDF4NUVmZ0lob3ZNQ0pR?=
 =?utf-8?B?ejdXMGhQaStUTC8vcU5zQjlDYmJLemZOZXRrelJTcFo2SW9leUFXV3pmSlZG?=
 =?utf-8?B?bUlHMjFGMWIvMVZ0bG9KcGl6RkhQNmY5M2F4c0dudGFKMzJYN2NTdEhCWm1B?=
 =?utf-8?B?WUwrOWJjSmxlMmRwWGowOTVPVEJ4ZnZZWmJscHg3UXVKR1RZQWh0YWEybCtm?=
 =?utf-8?B?WjV2U08vcTNJZVlPY3FGdzdCYUZtVTNDNEU1SmhNaTgwdVVIcURrTzNab0lr?=
 =?utf-8?B?Q05BU1dlSDRGNElRdzhWaVcweWZ4NktuZk9jVHVvaDVIRGxKbDNDTWpPK05E?=
 =?utf-8?B?Y3RscmNVYkdkRVBhOW5Xa1NUcE5KLzkyWEN5M25zbnhXRTdUbm9ONkVtRnMx?=
 =?utf-8?Q?WNzS8FLNZR9Icqjl0F5S0tK2V?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f28d382f-0526-4994-d425-08dd39458c55
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 11:28:22.7372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cstHu/dum3joOUnw94N0AzDZWS6AhOsc/CJdf2sOpQmc9l88f5qon0OwnkCynuGwveH+fmPWlD2uvRxsz8MUUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9551

Documents i.MX SoC's Service layer and C_DEV driver for selected SoC(s)
that contains the NXP hardware IP(s) for Secure Enclaves(se) like:
- NXP EdgeLock Enclave on i.MX93 & i.MX8ULP

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
 .../driver-api/firmware/other_interfaces.rst       | 121 +++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Documentation/driver-api/firmware/other_interfaces.rst
index 06ac89adaafb..a3a95b54a174 100644
--- a/Documentation/driver-api/firmware/other_interfaces.rst
+++ b/Documentation/driver-api/firmware/other_interfaces.rst
@@ -49,3 +49,124 @@ of the requests on to a secure monitor (EL3).
 
 .. kernel-doc:: drivers/firmware/stratix10-svc.c
    :export:
+
+NXP Secure Enclave Firmware Interface
+=====================================
+
+Introduction
+------------
+The NXP's i.MX HW IP like EdgeLock Enclave, V2X etc., creates an embedded secure
+enclave within the SoC boundary to enable features like
+ - Hardware Security Module (HSM)
+ - Security Hardware Extension (SHE)
+ - Vehicular to Anything (V2X)
+
+Each of the above feature is enabled through dedicated NXP H/W IP on the SoC.
+On a single SoC, multiple hardware IP (or can say more than one secure enclave)
+can exist.
+
+NXP SoCs enabled with the such secure enclaves(SEs) IPs are:
+i.MX93, i.MX8ULP
+
+To communicate with one or more co-existing SE(s) on SoC, there is/are dedicated
+messaging units(MU) per SE. Each co-existing SE can have one or multiple exclusive
+MUs, dedicated to itself. None of the MU is shared between two SEs.
+Communication of the MU is realized using the Linux mailbox driver.
+
+NXP Secure Enclave(SE) Interface
+--------------------------------
+Although MU(s) is/are not shared between SE(s). But for SoC like i.MX95 which has
+multiple SE(s) like HSM, V2X-HSM, V2X-SHE; all the SE(s) and their interfaces 'se-if'
+that is/are dedicated to a particular SE will be enumerated and provisioned using the
+single compatible node("fsl,imx95-se").
+
+Each 'se-if' comprise of twp layers:
+- (C_DEV Layer) User-Space software-access interface.
+- (Service Layer) OS-level software-access interface.
+
+   +--------------------------------------------+
+   |            Character Device(C_DEV)         |
+   |                                            |
+   |   +---------+ +---------+     +---------+  |
+   |   | misc #1 | | misc #2 | ... | misc #n |  |
+   |   |  dev    | |  dev    |     | dev     |  |
+   |   +---------+ +---------+     +---------+  |
+   |        +-------------------------+         |
+   |        | Misc. Dev Synchr. Logic |         |
+   |        +-------------------------+         |
+   |                                            |
+   +--------------------------------------------+
+
+   +--------------------------------------------+
+   |               Service Layer                |
+   |                                            |
+   |      +-----------------------------+       |
+   |      | Message Serialization Logic |       |
+   |      +-----------------------------+       |
+   |          +---------------+                 |
+   |          |  imx-mailbox  |                 |
+   |          |   mailbox.c   |                 |
+   |          +---------------+                 |
+   |                                            |
+   +--------------------------------------------+
+
+- service layer:
+  This layer is responsible for ensuring the communication protocol that is defined
+  for communication with firmware.
+
+  FW Communication protocol ensures two things:
+  - Serializing the messages to be sent over an MU.
+
+  - FW can handle one command message at a time.
+
+- c_dev:
+  This layer offers character device contexts, created as '/dev/<se>_mux_chx'.
+  Using these multiple device contexts that are getting multiplexed over a single MU,
+  userspace application(s) can call fops like write/read to send the command message,
+  and read back the command response message to/from Firmware.
+  fops like read & write use the above defined service layer API(s) to communicate with
+  Firmware.
+
+  Misc-device(/dev/<se>_mux_chn) synchronization protocol:
+
+                                Non-Secure               +   Secure
+                                                         |
+                                                         |
+                  +---------+      +-------------+       |
+                  | se_fw.c +<---->+imx-mailbox.c|       |
+                  |         |      |  mailbox.c  +<-->+------+    +------+
+                  +---+-----+      +-------------+    | MU X +<-->+ ELE |
+                      |                               +------+    +------+
+                      +----------------+                 |
+                      |                |                 |
+                      v                v                 |
+                  logical           logical              |
+                  receiver          waiter               |
+                     +                 +                 |
+                     |                 |                 |
+                     |                 |                 |
+                     |            +----+------+          |
+                     |            |           |          |
+                     |            |           |          |
+              device_ctx     device_ctx     device_ctx   |
+                                                         |
+                User 0        User 1       User Y        |
+                +------+      +------+     +------+      |
+                |misc.c|      |misc.c|     |misc.c|      |
+ kernel space   +------+      +------+     +------+      |
+                                                         |
+ +------------------------------------------------------ |
+                    |             |           |          |
+ userspace     /dev/ele_muXch0    |           |          |
+                          /dev/ele_muXch1     |          |
+                                        /dev/ele_muXchY  |
+                                                         |
+
+When a user sends a command to the firmware, it registers its device_ctx
+as waiter of a response from firmware.
+
+Enclave's Firmware owns the storage management, over Linux filesystem.
+For this c_dev provisions a dedicated slave device called "receiver".
+
+.. kernel-doc:: drivers/firmware/imx/se_fw.c
+   :export:

-- 
2.34.1

