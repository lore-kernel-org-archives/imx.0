Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011002.outbound.protection.outlook.com [40.107.130.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A8647D926
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 08:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768985861; cv=fail; b=RJ3mui4o9Az9bj9qFttPUKVJoTH6YaHTmKJ+lmDrAEsEPtK1PTBfxuNyYvxmHqbnGHGNobc7s85W+tlATICrrX6CIx3gAdWQaQip/BvNzVBgTWyRQ8OF4jQNWD01JATdbGccQvvfWa97uicU2lwofXl6umScRXPcNJsX2GZ/Cw4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768985861; c=relaxed/simple;
	bh=7QEuAhxOIw0u2oO8DRHrZP/iK1N7H24f44E0a+y4C1Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=beMkIbxx8dcEHGI0iJhwGrucb4AhMR9lV7ALqQDuxwdCi1AyVoI0CvHBxKN1b9Hvcz/K0SdFqNjFVzb8tQeNQuITUOEhJqIl4CYQKn50DPx59a7OtIGTBZwvVhuMGOozJ2LY84de6dcq46z77rjvpeL9U+m/UCt3AG6a54wH7ww=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=A8sqp/Cy; arc=fail smtp.client-ip=40.107.130.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="A8sqp/Cy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gHbqPa2a651BCrFcikM+++3kdEHkWe/mJ4FJmlm5CDGykn20Iq1TMLYpiUHrgnEbofQYF2ukkqi608REos6Tu/YdX7ZM4lSMGC+/U2bSbm8kZiejM9ma9gruKpwW3Nb6Di2VwJh/9EqJ7h7JylvpzLcd5uBe1gufj1Ff2P4Wja4NGhsEbaxq2W0hHVqDXfT1U8WkpPPMj/sBTa36dCtpCnSFZLqjKYHojRIq2Zfy/jxkykBc+TeVcnTfNkIJr0pzw6pkLQV5pjhwNLfYgXshtxjzYFr5p757V1/I6N2XX/7XZuuzYYju6hA1SNAc+hzXVLiFuwZQ9VeOoIZdWAK/dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XaQYmFXhZmj9KETYFrL1rTXvxZAHd+VSOAIQc0lwt8o=;
 b=uuZ00FmnkWSZp/p2Vc1pMnCaeXNps6lWWKxLt0w6mzlQu3pkpk4IIHxP8BQd/G+e8d+lQsRGHKsA+LU8KlxT+mPWJ1HQtgAlsgk5szLQVWx4+s0tbwOaXS5I2vl+VN6JdbZA444GKDSFC7NiOuVF59QJIhCWRbQBEuJ7xpdneozl5aVyL2DLd0dDoSJZ9l0+0zOeTJHTmtBjQSMDCbLMfyPRb6hZBXNxGvhYI6Ef+ssVY+qHx+2odHgsaKhnUxbveVppiGWe+BZ822GgzE6BTjHM17hjFQw6ZPyjDeynjwOe3oeym8qG1NPjRsJTCLUSdiM1LEmYPpORkpvSJ4JKQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XaQYmFXhZmj9KETYFrL1rTXvxZAHd+VSOAIQc0lwt8o=;
 b=A8sqp/CyiN/AQmjk6HusJFg0kLSY2GcYh2DiRI3VrkeGtb+z+BOW1Y2Xf9kSoIU78PgU9a+Q0TUjxF4FlpFGASaT63KXmQPw91G7r5ZA6gaHz/ExSJBwybnAtsfGz2zaa5LpWIDEgEk1A5/kexIPmy4UD9v6HvkMp6u3fk65QkppfBSfTWfk9qLzY54tah7plwpy/hyudy3A9YJqBxmCHuVjJthgkP0wV4pFDOiXsbEImFao3K0+Xn4+U5BoMZl4pzec4qzXkCMExwIP16cXTzzsES+BKgeydYcb/Nq4OQS4KGUB3bEwFh7lTCikT0Pc4htnSl3XlixkBxulQpDBPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by AM9PR04MB7492.eurprd04.prod.outlook.com (2603:10a6:20b:282::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Wed, 21 Jan
 2026 08:57:34 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::54cd:4aab:dc5c:6da1]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::54cd:4aab:dc5c:6da1%6]) with mapi id 15.20.9520.003; Wed, 21 Jan 2026
 08:57:34 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Wed, 21 Jan 2026 14:25:37 +0530
Subject: [PATCH v24 6/7] arm64: dts: imx8ulp: add secure enclave node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-imx-se-if-v24-6-c5222df51cc2@nxp.com>
References: <20260121-imx-se-if-v24-0-c5222df51cc2@nxp.com>
In-Reply-To: <20260121-imx-se-if-v24-0-c5222df51cc2@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768985744; l=1320;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=7QEuAhxOIw0u2oO8DRHrZP/iK1N7H24f44E0a+y4C1Y=;
 b=Qp7eew7u1oEWzzuECFyAvGjA0TbuCaR4fI3iTmLEs6L5Y+YzIv02jkHfiQ+xhjuz6I6wxoql5
 xdvB7nNoQCDDyAEzMFNgi43DuaOefnAxFLrdoCA1Q1xMCUSIHX6S1D8
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|AM9PR04MB7492:EE_
X-MS-Office365-Filtering-Correlation-Id: b83dd0cf-c296-4be9-8f7a-08de58cb1e22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OGpxYjF4dGRBMkN0UEVFUGtGUU9JUVFMZzU0Z1F2MkRFbGViSWdTRVpGV0sx?=
 =?utf-8?B?cy9rZzIyaHNFY1laeUt5OXNFc3NSYnlIS0hKeWt3WUV4c2R4aFQzOWhhUXlK?=
 =?utf-8?B?WmJiT0JJMGNPRFZ3dVpMUXZ3c2cxbExhMldFUHNQRlBsV3hIcHdlWFhrTUd1?=
 =?utf-8?B?VjNIZG5qZ21UckdzdTJpYWpJVFo0YnFKS241bHF1UDJOREt1bDBqVWxZckUw?=
 =?utf-8?B?RHVYd3RURzVEU1pQeDlERFBhc3hRd0NpUm9JU3NYdDV0anJ6U0g2WUlubzVS?=
 =?utf-8?B?ZjdYWm9YdmtjTlA1YUZuMWZWMm1GZkhoNml4SUJIalNvbHdIc3VLK1lXZkZ2?=
 =?utf-8?B?T2I2L1laLzRuOEM1NU5pTUx2Y2R2Vk1NUmt2VTFUYU5ib0pxeFFzQ3JWQnR5?=
 =?utf-8?B?MzFRMEJyaDBuR0pVOGJDdmVaamJYcERTeVVLZUM2SU04UVV5SHFRNHpub05i?=
 =?utf-8?B?d1JwT2VmVDI0RFZXd0trWStacE5oQ3BQNGFnZ3d4b1gzQUFEVWlkblR0L29m?=
 =?utf-8?B?YzhVV3NKNUczTThjMXZZdklLUEhOZWZsT0JvNkwxcVdBQktybEtvTm5KVFlv?=
 =?utf-8?B?cDRmRFZVQWQyRmZmM2Y2TFdlYUxuaURTaG1TaTRDL0tjZk9JSFVyVXVsL1Y2?=
 =?utf-8?B?ZUE3MkxtcDlvVGRZdU5oMjR4M21WWDdlbG9sY0FPMi9IS0FFcnpLQXcxdERO?=
 =?utf-8?B?Tm50TXhENmNlY3B1Mm1jTHVaWUpKMXZJRkVmNWF0ZVFVaWdvZklCN0VZSjBO?=
 =?utf-8?B?czlzbUFPSFp5S0RFcXRvYUpuYmJPVHBaZTVoQTZZMCt3aWlFSTFzZjRJaisw?=
 =?utf-8?B?MnJVNW5vSHJJUFFpM0owaFdoTzFCRWZJM21tR01UOG5VbVNOZ0Y1TVk4VVg0?=
 =?utf-8?B?QW1UZ205NzI2bUJQYTNZNkRTZXMxWlVFWjNuNjFKb0xlalkzZlFyMG5ZMXlP?=
 =?utf-8?B?YzMzZXZXUXVyeDNzeVRpVWNhaC9HWElKZmhNWGxOZFY5enBKQnpscGk5Y0py?=
 =?utf-8?B?OGpRNVZZQUtMTHA4K2NxTFNWZ2Q3UExtOWFLWmdTZW1SM0p1U2svYnpBU2li?=
 =?utf-8?B?VDI1N1FtZFRHd29Rbk5sWUorSkRLYlRXZ2dYQURUbWRFQVRNcTBJamI0VnBJ?=
 =?utf-8?B?VndQZGoxNVc3d0dDLzVvZlVDMmRMMytReWdBZUR5amlZRlhIaVUvNVFELy82?=
 =?utf-8?B?K2I1ZWQ2WVVjSms0VDFWTFREK3VHbldTSnMyU0lFMnVEcTZEVnpoYnR5cDZG?=
 =?utf-8?B?YXpTQ2VTR3hsdkhpZDd6YjdaM1hLalRqWFZpWWJpS2F4STBPZHZTZXNBWElW?=
 =?utf-8?B?NTc3VGFvT3NKT2k1bzF0WHlHZHdIYkdkNEVSNDk4aEdKeFp6eTJNSmVueVRF?=
 =?utf-8?B?QmxEaG1YdmlvM202Q0pPVDJLblJoWUdweUdLK2psbThkaDFLSVFOdnZ5NmRX?=
 =?utf-8?B?M1Q2cVEwRHU5VXBDSlRJY255UEdxV2dxc3c3NHR2T0hMdUh4TE00Nnl6UjRW?=
 =?utf-8?B?ZlpDM0xXQ2VlV2I4UEhYTE1wSHA4Rjl3eFpqUkFYQU9uT0hleFcveHBuNTJU?=
 =?utf-8?B?QTB1L2d6dU94WGREdFE2elhZdlZ3ZVpLbm5HZkNCRkd4NVZXM21KdVF2eG8w?=
 =?utf-8?B?aVhHSmZSQ0RoMG9IYlVWaFNQWXMweElUSGhiUk9PZXpHTnhEMTZFRUtWUDY3?=
 =?utf-8?B?THZUbzl2NlJzbkZFYUthWU56d3JyV3V0MjJkYk5TWjhoVjB5RjdkcWQ3ZEEx?=
 =?utf-8?B?MzBjQnNWOFlkd1dhd2JsRm5sckhNdHFUNmwwZnhsZzg0WHhxZGVpaHVmL2xD?=
 =?utf-8?B?VUQ4RXFTL09TeUUxS0JzMkh6REkyZmt4VUVFWlNIbEpKV201bVNVTkR0bHBF?=
 =?utf-8?B?OU53QVRXRGRrMkdKWXFrQ2x2aXRkdFlBam5zaWhFV2JqY05LdHVVVUsvU2Qw?=
 =?utf-8?B?czNLTFo3SWFGOUN3ZVN2M2gzamU1WFB5UkxKekUxaVlITFZSYUt4bDYzTU5F?=
 =?utf-8?B?VkNzYnZoMW1ZVDlRQVZxYXNDWTd6MjVjZnpLblZiTkRhSGw3NU1VMmJ0Vys0?=
 =?utf-8?B?WVprTXFhdERqSVJOaVRjVEd1UDgvL2l1dnRWUDJ4TEJDdElIU05rbWFjSDgw?=
 =?utf-8?B?V3h6dXZvOUVTcXZXSWUvSEwrS0ZBamhDN1B5dDNSVkNMZVhSOW8xNkpnUEQ0?=
 =?utf-8?Q?d1C9qGJi9Yng0NDqJHizonQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V09yT2crZmpFSkJ5bE82V2tNVXdIaTFIdXRua05ZdEs4blpJeG5tRDU4c1h3?=
 =?utf-8?B?d0l2VE1hNFlVWFkyY0hjYzhDU25GOThkSVZFWVUrV0Q5UW1yYzBsNTZzM3Vx?=
 =?utf-8?B?UVlxZCs0Y3FhQ0d6ek02RGdCWVFMelZyS05NMHdqQkFpWWYxdGk2elhENVRO?=
 =?utf-8?B?ZStKa0R1aEFoVlIvVEJzNkZ4MkFtMTJoR3FwSDI4eFliTkU1ZERJNHVvR3FN?=
 =?utf-8?B?em1sOSsvSlNuSy9WK3liMWNBdERqTkhiSkVlLzFEd05PWTN6ODFsMEhoaWV3?=
 =?utf-8?B?S0I2N0NXNnh0ZytFaDRLZXRTTjIrVFRYREpDcUFFa3puR3J6VEQzb0JxZlU0?=
 =?utf-8?B?bloyV0tnbXpib3NFT3pIWjVwY1dmMXBEUVE1MHJGakVxNmFOKy95aFFBeG8y?=
 =?utf-8?B?NE1IUDBGcEFYc1RmMjdLeEVjL2hxMDZYVk1TQ2VicHZYcmppM2FibGhtaXk5?=
 =?utf-8?B?dkZTMUN1cm9FNHEzTXYyNENCVW04ODVPL1E0RTBGOHdmWVRoQU8xSW1UTEt2?=
 =?utf-8?B?V1ROSnloaGcyZW9pbjZabXdZUW9KdG9WZ0h2WFVDajFTUWQycHBGYkF6TVNP?=
 =?utf-8?B?bkNoZ2t1ZTJobWFUeEJ1NWlDMHhjVlR5M1hlcDR6c0plWjNVY3Q5U2lBK2hT?=
 =?utf-8?B?a2ZFVWFubVhXVy9GM2x0bElNbi9DQkdUaGF5QjhtOW9aM0NwUzdlS1JiTmhH?=
 =?utf-8?B?MlQ4VHhsVzl3RjZGbDBBaTQwMjlpaVBFZVN0cXp1NjlqcFB2dFlWU05hZmp2?=
 =?utf-8?B?UHZRaWdKeE50TjZoSHRtRndwQW5xWG13OW1PUXNFN09JV09SSlZMY0hWRDhE?=
 =?utf-8?B?M1Jhd1JKeDRUanV5MkZ6ZUtxTGtHMmtKM2orOGZwc3duRGNVQ2lKQ0w2WUtL?=
 =?utf-8?B?Slp0a1J5UXZSWjRVTTFUdHVxR3NpNVo1TWp1c0cyS0FnRmQzbFFPZDBnbDcv?=
 =?utf-8?B?ajdtaFJPaUxPRGhlR3ZLMnp6UzRyRFhNdHRNNG9kWTVVK2lqVTZZcnpzZmc2?=
 =?utf-8?B?R3h0VTdnelpoTVB0TGZ0emE5MjJrYjkzVTZnSk52US9YUTI5V2hoZzl0Z2cw?=
 =?utf-8?B?WExRVEZseEVmNFF1alEwTWJkeHErcE1TandCeFB3ZGJDWC9meEMvR2ZuV082?=
 =?utf-8?B?UXlzSTJPQlE3aW13U2VyRmpLb0RWd2xhYWdRdW9OZVgxMXpxNWh5MzREei9r?=
 =?utf-8?B?T3l6YXI4Y3ZOekUxVFI0MUh2dFFLTXljcGhNalRSMjEwUUhPK3lBelkvclZn?=
 =?utf-8?B?N3dZVElOb3ZFNjJsNUF1SGV2YjcrOVAvbFhTVzFyaGt1RlZWZ0tvayt1cjFP?=
 =?utf-8?B?YzFXU002NDg4ZzY0VnhMWDBucjltMmljNUlPSXdYb1h3ZUZKRGxPdkVZamJ5?=
 =?utf-8?B?Uk0rTkMxMlQvd0xhM0tEMWFPdVJHSG5RSjFiQjdndk9rdVhLY0NCUXZPZFZ2?=
 =?utf-8?B?ZlE5eWxIYkwyNUFIeCtkS1ExNG5SUFpKYXR4dlFxNnFRdHFWRlZ6d040NjFO?=
 =?utf-8?B?TldMZFlCWXFzcm5JL0gwNHZwNk1ib0QzV1JlbWhyZEd2UDZ3a2xVZjRMNEpV?=
 =?utf-8?B?bFFnZGhsR2VXbk54aUUzTkZUNTFGa3M2cTE0MUg5Y1RvR0luSmRsbDFtaHFB?=
 =?utf-8?B?WEpkQlZBQjdGYW5FZkV1cjVpMHRCVzdKZTBsWWlqclc3cFVKN1Z3VXhkVTJl?=
 =?utf-8?B?cEx3MWtscmx5Yk9YN1ZRbC9pQzNJZlFQM3g3bjd4R3BVZDFucWUwY1VXSXZW?=
 =?utf-8?B?TzlrYkZBYkN4MU5KYXVkNXdpeUtVN3VxcTJGeDJoc3VidTVnOWNnN1FKNWlo?=
 =?utf-8?B?WU45S0RVaTFvS0Z3dit0Y0pDdm9JblRrYTE1SmJYelJYNHBnMCtpSjFLdkxm?=
 =?utf-8?B?T0ZSSlA2SWpVNVk0ZENOQkxEajlQd29BSHMvK01maS92OFRhalRtQ0lBekRD?=
 =?utf-8?B?UnRjSEhiVmI4Q1VMSlNHNkRvUlRuT25KUDQ0allQUlpZRGZDQjh1M3BRMFNa?=
 =?utf-8?B?OUtkN3ZJNUh2eG1VNW83ZmdkQjJoRGhSS0NCY0F0SXcxdUJSd0ZyVFZFZ2dL?=
 =?utf-8?B?WGpybWhCeE9VNG50bTNnd21YMTBic1pkalhmVWtXS2JNbExZYXJCMjF6cEgy?=
 =?utf-8?B?bk5JVmIwbHdhZlh2VTJNSU0rNXZ5VDBOZFRxTENzQ216OCtwR0ZjMmFUaTZR?=
 =?utf-8?B?eWw4TmxGaHFqTjRxaGl2NW5RYlBySCtCZGxMS2FZdkxHREVQckFFWEVldW5y?=
 =?utf-8?B?d05BWm9tQy9pV04yTEpUaUoxNGxPeFU3TWIwY3BUYUpGSi80MG1XblJqbHBF?=
 =?utf-8?B?NXNaTlBTajhtRFkvdTdITHNKZUgxeVNNbTIweURzZGY1eXkrYmU5QT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b83dd0cf-c296-4be9-8f7a-08de58cb1e22
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 08:57:34.3426
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JbNwn6buy/cmbiI/8egrdXC8H1aOJfEmGoyJVbEuWYYy5aJWK6Zzyx1EQCOAvZ8BgyKqT5MjbEjSW7GuUuqMDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7492

Add support for NXP secure enclave called EdgeLock Enclave firmware (se-fw)
for imx8ulp-evk.

Add label sram0 for sram@2201f000 and add secure-enclave node

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 13b01f3aa2a4..10a4779dd24c 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 #include <dt-bindings/clock/imx8ulp-clock.h>
@@ -154,7 +154,7 @@ sosc: clock-sosc {
 		#clock-cells = <0>;
 	};
 
-	sram@2201f000 {
+	sram0: sram@2201f000 {
 		compatible = "mmio-sram";
 		reg = <0x0 0x2201f000 0x0 0x1000>;
 
@@ -186,6 +186,13 @@ scmi_sensor: protocol@15 {
 				#thermal-sensor-cells = <1>;
 			};
 		};
+
+		hsm0: secure-enclave {
+			 compatible = "fsl,imx8ulp-se-ele-hsm";
+			 mbox-names = "tx", "rx";
+			 mboxes = <&s4muap 0 0>, <&s4muap 1 0>;
+			 sram = <&sram0>;
+		 };
 	};
 
 	cm33: remoteproc-cm33 {

-- 
2.43.0

