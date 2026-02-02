Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012067.outbound.protection.outlook.com [52.101.66.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64673309DDB
	for <imx@lists.linux.dev>; Mon,  2 Feb 2026 19:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770061426; cv=fail; b=Ps0RKPwB5xmWul1z5LF2ai8lawJaZV6llIqeEV8yD82fWtzZ1uZzJMqwm98wX0I+capEpiYkFC2UlKEJ5YcIhVsQ3xpYWiVLOeD0qz2HZnXGRW0lf/tbedSgBzG3OrakANgzaTMiz7bXDBl1CoWo6Fdlko40fpiPgyg1VKNcGmI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770061426; c=relaxed/simple;
	bh=p4CnX6P58NChfcjGXOsBuRct8nsP92/cFLuPQ2AGUL8=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=E2AHvIeJ8YRBnfj9CeJpNiePucdPGbM1gTsyihJJyxROK7jmXGfAjJY805DfISBFmJC58VERxwWL/mYtq7JBRE8W2RxPGaOex7VylYPh/7ht2RL1q+vXYTnPHNP8Bn16KeA9FI2cC9HpjZP6Hujb2j5H8cYd+NBYThLo3aWI+3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Zmdx9ELm; arc=fail smtp.client-ip=52.101.66.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Zmdx9ELm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UBJW63W/e10UB+JT/gJrc1tCe8ApGXAFT3XHbWSatBIcpxmBS+aG/BXJ5AsVNVlDUhVW9baoB2pTnNq3ciRAT1Ck5eFUAkXHTJCpHQwbnF8nV1vknxjJHc3vhWM+LsAfAjLtHjU8D62VHGDgRHSvjD4cIH47NQhMgkEnGm0TaZrtiqf/jgEQ+LujEsXK4prrRUHUCv+nMv6biFPO2gv7YLFBEdQhwjVAkqhxWND1zCr4SvJ/gZ9KZkxlyNpB3mX1tLhdsMh+f20f4Vv7n/gF0YlqayF8V2C3RD3KQ7+ZkyhOrepCx8B2pKA0hpRDBLLPsHRtNEKtE4qCrfEravD2CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jd4g3QG7ZIU8ot8Ui6X0mFa4HifY0/Fv+pad0ExLkhs=;
 b=n/WmMzPZ87ZAOG65sK5kHIZ748iIBL6bCUFjVSTU5uVHiU7Np0uY2LnorH+pNMP0bbX8XkvOJghQUBw69IPhtg/BeNMfmdDNvh5zpdKKzr8A+c9PmRBnXXZFAeAy1HSTkD1odtnFy91syZsW5DCxWmjU9KZAtsWNMQsQSRDcf7R3mLGHpqTq/KxDaWMVGL/WA+FLWI3tLPnGVoFSz+YMBqZKzXjCikk81mP00Gzx63GFjVw1fLyXhVgugTyNwvfc8zp5/GZLazGn+CqyiZbuTQA7NL2IfgZpKU1JEVVAHFZFQV1Wgkbj2BvgT2u9Il+Cwu0IsXaTH6Ip+NwPriczFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jd4g3QG7ZIU8ot8Ui6X0mFa4HifY0/Fv+pad0ExLkhs=;
 b=Zmdx9ELm8ZAd/6o3+DPqMp7UCt88ETggyzm1nhM1P7AyqIe/9iWWnjFvOgYmkYG34Mg1/hfWLH1CpZwWk2Mu8B1VSZJMali9mdbJSUna7nOedV+ldO7jsj0hvY98pzk4ugwar272gYDo3USGl1cheNTNyNtjeqn1L//ksAAxB7HqC0lU5P3Q0yXng2l7q0pOdJy1RpZ/qRLq6SRwtxeltaPsHmHKJk/AwtMwQ1JUPANDh9VwpNtEg00WBxf2pag9j61wLnN3tv8kK2kiv5SQvM7RHq59DuIVUwDIF1phjoesnnG7sSWo0IW+wjPUEv/7kHGOqIiYjmf17seU5s37Tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AM9PR04MB8667.eurprd04.prod.outlook.com (2603:10a6:20b:43e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 19:43:42 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 19:43:42 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Mon, 02 Feb 2026 14:43:21 -0500
Subject: [PATCH 04/10] ARM: dts: imx51-ts4800: rename fpga@0 to fpga@0,0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-imx31_dts_warning-v1-4-434dd2643c3b@nxp.com>
References: <20260202-imx31_dts_warning-v1-0-434dd2643c3b@nxp.com>
In-Reply-To: <20260202-imx31_dts_warning-v1-0-434dd2643c3b@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770061408; l=1018;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=p4CnX6P58NChfcjGXOsBuRct8nsP92/cFLuPQ2AGUL8=;
 b=+uG4g5RcEH1I8h73aVHu8QZER+gI0w3pG7Yn4rFdUAuJOQI0OvvPiHNi0dextU/fCAaSXYHgF
 Jczj9SV3conC5+UC55VAcxvgfQ9upA5qAIrPiJKMLVB1DgwgglLK0tW
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7P221CA0006.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AM9PR04MB8667:EE_
X-MS-Office365-Filtering-Correlation-Id: 96e7cf02-8e1b-4984-1bfc-08de62935e8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UzhxTEpkMFdYRTU2dlljeVFEeC9PVGlFYjczbXlGZ3Z0TWxCM2kxbmdYRmhE?=
 =?utf-8?B?ZnhIdkswUE1rbTFXaG5aQ2pQQkxSaTlieXhlMjZPSDAzZVZKUmpmb2QwR1ds?=
 =?utf-8?B?VzNYT1pWS0NocnhmUFRTTjh5NWFUZkgvNm00WHkza2VEckRkc1pNeUJTbXdv?=
 =?utf-8?B?YzBJRVlUNHJkQlZZam42TTF0KythOGxQTFFSd28vTzB4U293TmFTeWpoemQw?=
 =?utf-8?B?RW9rQnphVGFRNWRJSTQvZnlKSC81YTRmWVVDd3MzT0VZNnpHUmRNWGs2RXpW?=
 =?utf-8?B?ZS9lN2laakIyTW81bVl1b0VtdHRObjhiL0tSZWY2cTRhcHM5cjJXb29RZ2M2?=
 =?utf-8?B?cGVFUHEzekN1aExyWlBrZkFVUmdYYlFNN1N6ZzNLSHdXU2U4MXU5Y05ERmMy?=
 =?utf-8?B?VFYyeS91UGRUWkxOcmRXazE5dFNQcWMvUUw3MUw3cEpWcUlKYm9udHRuMCtZ?=
 =?utf-8?B?azZNWGJpcnRVWW9UMmZjVEpMOEorSmVCM0Z3bXhNQWpINWhRNWxOSEJPMVRT?=
 =?utf-8?B?Mk9nNmpQK0lvOCtHNE1DdmZ0TzcvckhYL3oyM2NzRXA0a2NXYjVYaEQ1a0dW?=
 =?utf-8?B?Qlg2c1Yra1Q3K3BoV3BoY0hjcnh5N0EvSy80MGtaSnlMOFU5R1NGT2Z0anlT?=
 =?utf-8?B?ZUc1d2tBSFBNaXkvYUxHSHUrRzBldC9neW1EazRyM2J6Z25pOTMwZW5hdGpS?=
 =?utf-8?B?RHlobzJRNTBxSSswU2syV1FxWjdoYXlVTTVDYUxxVkJaSmRPTWFKRVk4VGdk?=
 =?utf-8?B?UHFrMWFpSko4eVRqdWU4ZkZXbisrbU0yaGY2OEhmdjkvSGpkKzVqaGlHdXZw?=
 =?utf-8?B?c2ZQeW9mR2QvZHZUakJzUCtDTVZWUDNEMFc3N2UvSnhEVXI5V3lGWGJhNHRP?=
 =?utf-8?B?VTc1WTZzODhNMnVvWnEzRmlJelpsV0JPblZFNlBJNVM3aEg0ZUE4MnJsQlU2?=
 =?utf-8?B?S1I5K0U4R0R5Qk1mb3R0UGdpdWN6Zm1KSG9wS2tYY2d5SHU5azNPbmxEZDU4?=
 =?utf-8?B?TlcxNkw3dy9wYXhOQUtIRzNaWkNITDcyNmh6TFRWMys5MjE5UktTdHRDYjNK?=
 =?utf-8?B?UUJWQjJDeGNlbWlkbFRHYnp1cmlvWk1VTk56ckNxTFVGakQ2S3JiSDBjMUta?=
 =?utf-8?B?TXpITmh1M3djUFZQempYZjBSOFFPVkhjL1lVRTBCZVlwRWxSanVOajcrZUZs?=
 =?utf-8?B?OHo3UDZIUGhHZHNMdGVjemVOUS9DNW9yZkFpcGsydGplV0xEaHd1akNhQzd6?=
 =?utf-8?B?ZzNKaldFS25OSVJoQ1BXYmRpZ3g2UWVSVVQ3OGd4U1BDT0ExTWNYNXhyQy85?=
 =?utf-8?B?UXBLMnJLL2RJOGVvTllmbGNpRUtKWE9uYUFqUEkrRTQ4SG9lOTBWYzkzK3dh?=
 =?utf-8?B?VUdhK1ZNNlpONjhnY0hjcmlpZzk5bHJmWFlTbXJyK2N3dVVXWWtEbElUeVZp?=
 =?utf-8?B?ZEZzQzU5RGx3V0dSL3ZMZy9PTVJWd2k3b0JrMHlBb1FKMDg4c2QxcnNzTE9M?=
 =?utf-8?B?SWZFSFVxTHFwQmRJclQ4T1pIOVkwSFRBUXo5bjZ3MnNYenhsSmtTdHA2MTY0?=
 =?utf-8?B?UkV4cmhYMitCSHNyMFZXbVlkWXdKVXpVbWlCc0ZQd09aUUp5SU1pNGQ4RS9O?=
 =?utf-8?B?R1dzNnVJTG4rVHZ3dEMxR0REc3hVbERnOE93T2U1dXVpNDNiVXhHZE9LdXNF?=
 =?utf-8?B?clYzOXhUUC9YTWd0UFk5YjRZamtYeHB5ZzAzK1hhbTVEb0NwWjFDZ2xZejNq?=
 =?utf-8?B?eVlDTVBwVXozRHppUXBLakdwYlRyQVBVYXRESCs4RE1SRkhGUXhHS0s2WDR1?=
 =?utf-8?B?YkJodFpLQk9pYTlLbzBUdUJqUnU5UVJBSkxIZmNLVHZhSnA1M3RQMVIwa3Rq?=
 =?utf-8?B?M1dMZlJObkc0YVh6LzF1RFNhN1pwVmhLTFlUTlVkcWRWcG1BT1VTdDdnQjJ1?=
 =?utf-8?B?bWNjVFRGRlJNMFdIU1RuUWdFeHp1ZEhvTDNCMEVtUHdHWC9yMkxFSFhVSHVV?=
 =?utf-8?B?eHFUSkZTTEFOZURDY2ZjVWdEaWt4aFpnYkZ0YTJQUUdCZ3d3TExPSk1sYlcx?=
 =?utf-8?B?TTdydC9zUmwxL0x0ck5BUlhOVDljU1N4UFJjSUZyekN4Y2dFWWRTbTU4L0ZO?=
 =?utf-8?B?STViVGErUnpleGFwbmxxNHVpM0Q0Q2h6QmJvTVNJdGhLTFo2SW9aK2hab3E3?=
 =?utf-8?Q?fZhIjaH40KnwYPflil8WaL8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SGZFMDVGRkhlS2VmSW5mY1FDbEt3TUlXbkxKa1NkdTNQSG40UXlkWnY2WUhP?=
 =?utf-8?B?NUNMYVNPZkw0Vm9QSmZXU1Y3Q2oycVNXYlk1MWtoVU1oTXVFQVhRSjg1ZUd6?=
 =?utf-8?B?ZW5ZVmZ1WjNKdVQwa0J4dVdRNTBrR2dpR0ZNTTdablo2NW5OYlZadmVjNmFl?=
 =?utf-8?B?Q2JaT2NPYVhFSlluclBqU0I4aC9FK09qc2xnRjNlL3lCUWJjSnpmV0haSzQx?=
 =?utf-8?B?RksrNjIvYnd0VWlNd042M1ZOYU13RmdYZnpaMmtXUGxmZUlQWVlGV0RIb1F5?=
 =?utf-8?B?RHg3MlBuWFZVWThSTmhsT1d0aERLOWlLNzN1TnJzNk1YWG01N3J6VWdNMjF3?=
 =?utf-8?B?bEV0UTFkN3JXZWRCQjNXa3FhMTY1TmlLTzdIYkJ4bldaR2JTRW0xR2FIVHB2?=
 =?utf-8?B?TzlDUm1KdjRIQkJhbG1XVmhneWJicjdlNlVKRklNRU42TlhDZ3hSUi9PeFVJ?=
 =?utf-8?B?cm9Ia3YrWUJESTBaRW1uNmU0N2RrRHdBdDVqRkVxaFF5TWdYUk1RaWd5QXYx?=
 =?utf-8?B?cWRmOTUrbmQvUmtlYmlPRFBvckpOYzh5WVRvNTRtZ0xrRXZzQjlQMEVvVjRh?=
 =?utf-8?B?cG9pdXJya3dEQjRGQWw0R3IwQWRXbW9FYUNRMk95ZG5BS0ZXcXcrSnA5ODhD?=
 =?utf-8?B?bE5lYit1OFFObUFwdERkOFg3ajI1Q3VIS1V4TjNvcFlYRk41OG5aVnVVRzVo?=
 =?utf-8?B?RzdwNE1YT2xaZ0hHdzhzU1Rub1lDMFRpNUVyWE5qOVdHT21KM2E5SDNJMzZt?=
 =?utf-8?B?bm9JUm5zSGM3alhjVEMzNDQ0amlYb2JoOGFZWi9Sc01Dc1NnRSs0QVpCU2FG?=
 =?utf-8?B?VUJ3b1JhRW9tdlQzZ0ZQS2txS3oxQTlGNjJGeHFEa285OGxsRnVtZmVVYXBw?=
 =?utf-8?B?bGNZWW5iaTUrUkpZdHBDWTlWYlJuMXNSemNRNjZDc3U3MnR5Y000YlFoUXRI?=
 =?utf-8?B?TEdvUzVzWjh3eW5zdGJ5UXlSazVkQVdVMUdrQm1KVk5US0xRb1EzT1hRRkt6?=
 =?utf-8?B?cnRYd3I3aUNsdngxSXN2Z2VucWpjRGU1L0p0QVQ0K1NxRnJ4czcwL0sxWWU0?=
 =?utf-8?B?empXdjcvY2dPbVpnd0ZXTnVGMHpEZ1k4VXJtcWlUSHZvVDluUHhCRWZ2RjlW?=
 =?utf-8?B?WEhVODhDYlNoQVdQeWYyRTFkYUVXSHNwejc0em5QR24rZDRFOW5CRXJlU1lF?=
 =?utf-8?B?d3NoUHc0QXBCU21KZzNWMSt5WXE4cWtCQ3hiMXV2bWdjVEhpRHcwMnB4Y0Rx?=
 =?utf-8?B?blhuWSttUHdGMjFkbzBNQ1ZNNWpQYmJIVEVtMEhRangzeXk2MFF5b2JrdWpG?=
 =?utf-8?B?UTNnYnNUdXRqaHJ4bEZaU2hCdVFFQis4T1FRTEtHendzT2xXZmtnZk9xVVpl?=
 =?utf-8?B?OC93Ylg0eXR0bnZYcFF3c3owd1JSK3pyV1prK3ZXVzMybEl4dU5ld3hHcGJJ?=
 =?utf-8?B?endlMHlBZlU0eFVhbzFSc0doZUNiQ3ZwbncvdjlEbjRWVzU0ZlZVenFodUlJ?=
 =?utf-8?B?MHhDc09FTndMTFAvVGtDSmlDKzJKN3loQ0NuSEt5SzdqaGV1QVYwbElITWZj?=
 =?utf-8?B?MnU1KzRqU1JIRmtLN0NIWlhtbFNkOGtLLzlabXZCcFFOdjNkM2RKa0M2VGcv?=
 =?utf-8?B?UWdpenA0TEJTK0I2NEJvTjYvbTRjeU1GcUZ6UjhqK1FTSEZIczZHUU42NWV5?=
 =?utf-8?B?WWFkTWRpd282Vlh4cnFGcDMveGo5Wk5VQlFQUVkwN0VVbmJEVHhLeU13M2pF?=
 =?utf-8?B?bU50ZWhJL3VuNG1FMktlM05jMklLbWYyWlhuWG9lZk42dGg5M2dldytHVjRE?=
 =?utf-8?B?UXFrZ2p4b3lUeUlyWWp5Y2Jaa2VTQmNFdGZ0a0N4bXdOWTNRSGtUOFdSMS9s?=
 =?utf-8?B?d2FsTkN5aXRlNG9qRjdNM2tJcU4xZmFBWUxML29YazBEWlA4QUk2dkdXcmc3?=
 =?utf-8?B?SmFqd0RIWU02VVZRQk8vU2sxejY2OWc2Q2M2d0FMQ1V3eUhwVDJJSHNDdDc4?=
 =?utf-8?B?SmN5aWlnRDJPUXljYnF0V2VyMzlLSmdIVmxNcFQwajhKS1FLR1VIVGE2RmVE?=
 =?utf-8?B?WkpQZ3ZrdFBPV2NOc0laMnNaYlMzN2h1QkpQWk9nQWhoTE1vUlo4Ynk4YlNy?=
 =?utf-8?B?Ykd3T0ZUQlArMVVybzl4LzcycWNGWGxhUE9JVTluVEJQeHRUNkIxYlY5VlNq?=
 =?utf-8?B?TjBDeVBacWdSVEFvVndlcnp0UTdrazlrQXFsaU4yNmdpWGFKd2wzRFRiUkxW?=
 =?utf-8?B?eGNlaWRpZFk2VGJZZzVibDIwVDc4QXVUeDFyeU1SN3gwdUlXMnA3dTNITStw?=
 =?utf-8?Q?h/Mutjq1nTZ7k33/Ci?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96e7cf02-8e1b-4984-1bfc-08de62935e8b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 19:43:42.0335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 255hd5/qHiTThAQ2VoO0LSOvzvGvFZAJ8kZ3gRzm45rbjghOg2IzIUlupu9QVjsk60rbeJsZy0mBMwCvsjL8dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8667

Change node name fpga@0 to fpga@0,0 to fix below CHECK_DTBS warnings:
memory-controller@83fda000 (fsl,imx51-weim): 'fpga@0' does not match any of the regexes: '^.*@[0-7],[0-9a-f]+$', '^pinctrl-[0-9]+$'
        from schema $id: http://devicetree.org/schemas/memory-controllers/fsl/fsl,imx-weim.yam

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts b/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts
index 079bd3d14999f96ef141964a10f492cb2920d9b5..5118a68dbbdc320a895decd7efa2ad5db6a0dd99 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts
@@ -141,7 +141,7 @@ &weim {
 	pinctrl-0 = <&pinctrl_weim>;
 	status = "okay";
 
-	fpga@0 {
+	fpga-bus@0,0 {
 		compatible = "simple-bus";
 		fsl,weim-cs-timing = <0x0061008F 0x00000002 0x1c022000
 				      0x00000000 0x1c092480 0x00000000>;

-- 
2.34.1

