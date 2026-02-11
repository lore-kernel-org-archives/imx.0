Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013016.outbound.protection.outlook.com [52.101.83.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90821357734
	for <imx@lists.linux.dev>; Wed, 11 Feb 2026 23:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770851595; cv=fail; b=K9kOz2C+GIo7VABWkbj7DS1hAs+tmMJ40m9AJYeQ7xErowE0QbqykO02Y7/cJXrE/ZXO5EtriZa9RXrkXfs+TS6HfU6D2bejlh1WRe1Usn2eBS7gaxQKd/51VVtKKXHQ89n9z6o8AbBtb9LS1rMRD/91Jn/mgpWIwLErmvcgk4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770851595; c=relaxed/simple;
	bh=G16KIb4J3HzIUhzBhusE/WtDQOQRKbJQruHHaCNUusQ=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=CB5kEBsecHmNK8lmzhd9pVyX7y2H8aohY5g1BjdMeasAh82tRMVVD3Qua/TEhjUs+2c5nO22IRsgakfLAdmobnb9kgOmr0I3iZerTVVflbpTGJnZrsBG+QZWcYPz1s5O/hRnm4BiKnMvc8v/nKc/i/IkcnUfio/l1z5ubQFb9Bw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hw86lj/a; arc=fail smtp.client-ip=52.101.83.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hw86lj/a"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=is7slXm6Y1KnGga10+3Le6RnAEFvHROlrBCk+5EjD16BXy7F0yM7J34mp7bHumuL3Oswrt7zvKZKghWzLJXOoiehnVypzHAV/QI364UYbWJWHiHR80ng/NuJzWucL7Y84kpkz0flrgd/TdpLAeJRMtN9EdLkjEG+Ga96SQ1w3+gSkZydk/fn6ZOgfuaehtDz/Isd6pBiIauvkhWQPlnIv4pG8McYp4lB2P+q5HgByfnIvUA2cNtV6YoT6G0ka4ov6a6ZvEYDf9BekCoz+uPq6kKDzUIhVcmTJqbbF8neZ7GIc/O9tt2A9vXflh/Lht+vCPGP1bM34ZssmBfeLsOvHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uFD/zsj67SDUBSTtICHWq7jgAeaX60OzoUTZyZyAyGg=;
 b=TjpE7fTxMSIrRNMqzPhJB202d/qtiJUbDWBlwo9J0tP+wp768jPtNuEkZa+3ZiaimuOkmT1KYOIib84wYG+bHtc1RX5mb2MgpwiWhxJZ8OWxDN1ng9m5qQl/xHZ/7bCR6kPdeQmdhKsLSNQgaRxsYkg324aUTIFr3yZkesTHITskZxygCqm2mhBTnzEhgFVGv4xG0MbCfFOkH6QbTAldBcMD64L2H/RMAHCWu2jlPK1S+TdRg/S8vHuauv85bFS9EHS6nEzMZ8+ik1sUV8y12XaJHGTANl+7RM+Axff8i+rwcVN/oGRQ00BpCdqeSeduPPWmQRX74ilqeB8JysyJOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uFD/zsj67SDUBSTtICHWq7jgAeaX60OzoUTZyZyAyGg=;
 b=hw86lj/aEvUdsqFX362d+8Lu8fOUsg2TpNiGeOuXbf22X3C/6UFCdMvDumW0oBEfB945QYFX1jmRORuYafqxgys9jSWII109AjyM5sJWC/FRhAxinz+DZ/QtXRPVPaLt7BJc7eiJJMazGoDecrQaktZxRHhSPGSv2I5mE3P5pvqaP6bJFqUsHZAOgHWL/BZevoP72cbL0ZHX4nEcHla4Y1FSYbRxUYKMEcug9Lm95RHwnVzQVSWQc2LyhIZ8ybaLM5d32VEnUrmFHbhGhb1DAxHy33hWiTdH5dssS4ZA89roRW+VuutAcFBRFuFbiAB1SCg066NFcQLT6oBPQfsHig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by PAXPR04MB8558.eurprd04.prod.outlook.com (2603:10a6:102:215::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Wed, 11 Feb
 2026 23:13:13 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 11 Feb 2026
 23:13:13 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Wed, 11 Feb 2026 18:12:55 -0500
Subject: [PATCH 1/3] ARM: dts: imx27-eukrea: replace interrupts with
 interrupts-extended
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-imx25_dts_simple_warning-v1-1-7b40e1acca27@nxp.com>
References: <20260211-imx25_dts_simple_warning-v1-0-7b40e1acca27@nxp.com>
In-Reply-To: <20260211-imx25_dts_simple_warning-v1-0-7b40e1acca27@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Alexander Shiyan <shc_work@mail.ru>, 
 Shawn Guo <shawn.guo@freescale.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770851586; l=3187;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=G16KIb4J3HzIUhzBhusE/WtDQOQRKbJQruHHaCNUusQ=;
 b=/D8OPrMmdbesdYJoCLclQBTp5C2Qhgh5pEH1S84Vv9If+0a32Oa8KKRVR3Wc5iame29L8RayI
 C/BQK50ZMfUAWTnUvRJwcPpEL82INTQ9el2scpVRS9t/iigKEkyWB1V
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: SJ0PR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::11) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|PAXPR04MB8558:EE_
X-MS-Office365-Filtering-Correlation-Id: ac6b5baa-4200-4c6c-9848-08de69c32144
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UmtrWjNueUZrS0hlUThmaERRSnE5MWlwY0lPRzJPY0l4NTE4T0t5alU3em1J?=
 =?utf-8?B?S0JQNEVvNFdyZlZqMTlJeEU1d0ozRGRFY3YvNVlMcVdEVVl5YzlTZC9nN05y?=
 =?utf-8?B?L2U3dlFoTmlkTnQvaUJCOVZ1eVl3YytMMzB4S1Iwc1VpblVHcDREUE9naUtT?=
 =?utf-8?B?MWpVcEM3MWlsWk9PWmJPWWhMc0ZSdUtTaFJlWm9aQ2tPTG53MDhrUHdSQWNZ?=
 =?utf-8?B?OG0zUW1HTmNXRE15N2U3d1E4L05CR3I1NU9DdytzVkNDa1RHU01rR0xXRktY?=
 =?utf-8?B?WG5EMzB6cGtlQTR5V3BxOHVQb0xUK0FzaWYrSFgweitSMGorZ2ZxL2V0S0gr?=
 =?utf-8?B?WWxnU2djaDRlMW5KdTJRelJMNk43SlR1WGptR3dFNHovYXNoaFNBV0drVzFY?=
 =?utf-8?B?VlJUS3RMZEtqR1NYR2VSN1VDbnhvejhwUXZtbUgvWDM3V3hCN1k0MElJZmFT?=
 =?utf-8?B?WFBHb0d4em1PbzNoUEI5ckNYamVDMC9INHRsRkxXVUpaVUtra2RFWCtHZk9G?=
 =?utf-8?B?M2hBNW4vSHZoS2x2bmN1SEpTWEErV2RaMVJqUDNaZzhEcE9OSmMxY0Q1WEtl?=
 =?utf-8?B?NVJ6NkdjVmhGYUtWU3VBZ0xZVkcwN3Yyb3lCc3NNMTBmVXpwUjJNMU5KdCtZ?=
 =?utf-8?B?ZktNdEl6NU52azlyRlo0TXFnaWhvL2FMd0luZEpFeDVNV1AwN1dVRFgxd0k1?=
 =?utf-8?B?Q3M0Qk9lbFFtSGY2UGxHb1NoUDBlSi9aN1AvdTZXeHJ1N2xQK000T3RncEpn?=
 =?utf-8?B?LzlmeVdnNVZRMUpwR0ZOUzE1VW9RNXZmL3FBaXVHVjgxMTQxQkhLZlZQU2Jl?=
 =?utf-8?B?MjBJWTlmK1VCY29IZDZpL1Jwc2FsQmhFOENiMlh3SzFxUzFGczk5M0s5ZEx1?=
 =?utf-8?B?NUFPMkt3alFGeG1Uc3F3dzRCV2VuTmI1V1FrRlBPK0ZUY3E1Zk1YdklhaWp0?=
 =?utf-8?B?SDVLU3BzVjMwMnpmYzY2a1cyTm9qTGxHNkpVY1MvUFZ1R2RqMEpvUSt4cXE0?=
 =?utf-8?B?V0UxbFJaQTMrU3FZbitHTFIwUXNqUEJlMThOMXdjaXBiOU5EVEUzRDZpQnpS?=
 =?utf-8?B?ZDF1NGo5T3JhcW0xYk41clJacHBGd2xRamxTM2tBTUNNWEFMdlJoYTluY3U4?=
 =?utf-8?B?VVdWUnJReHFqVUVBUzVEdldGNGJzRG1tNGp6ampEU0tZODlEaVBjVjJ4dDlO?=
 =?utf-8?B?Y0Mvc09LdjAxZ0RIck1MOTQybHFWeDJVUGhteUM3aXZ4MDQ1Zy9rNEFNaXdL?=
 =?utf-8?B?S1FQYUZFdkNPK2JRWFJIcHRNdzBaN3RZTG90b3luWS9INGsvSzlCeWFFK2I5?=
 =?utf-8?B?blQvVExrcG9VaHFWWlZpVEh1TDN6S1UzRGZxWDJWWUxtcFhnNm9hZlREUFAy?=
 =?utf-8?B?Sk4wSkdLTjlSamF4WXFIY2lRYUpQV3BEYzcwNjBva3phcThXMkxwOXNRdGt5?=
 =?utf-8?B?NUlKRkZwY21XTldWNDdIOUoyUUxTUGhxNHpyWVVVZ0FSZ29OM0Q5eFQ0b01Y?=
 =?utf-8?B?ZG9wUDArZThGUU1YRFY1a1ZHQlI1OEhua29meEhPQVhFUjdXWW1wTmtXc05Y?=
 =?utf-8?B?M2ZXakN6OEJwV3VCeWZtcEdGTnZyY01TWDZ2djQ1NHJtS29hc1ZQcWM3MHlw?=
 =?utf-8?B?anZ3NG1pL1JLTGZiclFqZVFFYjNMeHk2TmNSa0prRWJEdGJxanJ3RU8vTWd0?=
 =?utf-8?B?YmNqQzdoQll5NlY4dnl6UWV0ZTN1R0lVVFFHbGFqQXN2TG92cVFQd1d4M1Fk?=
 =?utf-8?B?T1ZyWWN0dmxtRmNSazd6REtINndvcmJDMHhPT29mUmdKWWFmcWwySUdHeHY2?=
 =?utf-8?B?Y2hQOXVoSmI3dFlSMGprYzFVUzN6bFl6VU80VWFtSS9ZMUIySkdEOWQrYm45?=
 =?utf-8?B?MXJmTDVmVVQwWHI3alhpS1Q2VUt6MFNrME5lcWcwZHduNFVxcnlCRU1JREUx?=
 =?utf-8?B?UDNjYU9wK0lYMDF6aGYrTElYcC9NQ1NMRDlzZ1BORWpaaVZDVjdXVnpsbXF2?=
 =?utf-8?B?dzRpYjZHdGQ1N0kxdjNBNGFTUndHczB2NUZQV0VBcW1HWXZlQmF3TVJXZWNz?=
 =?utf-8?B?SnU0ZmlHbVkxZmlGTEUvc1V4U3JUNlAwV1I0RlNJeUQvaHc4VWg3ZmJDSC8w?=
 =?utf-8?B?VmVRQTBaNllILzB3T3d0QWpLWHRhSkdQdGt0UEs2RS9FZTdpVHJNbGtPbHlw?=
 =?utf-8?Q?ToPmTa5ICCfhcmwv6nJrSik=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXNFRGhidSszYjIyWlVsaSsyZjhiTUl4ZWNWQXZDSVhxUXJFV1RBaXowR1VK?=
 =?utf-8?B?WHUxbFJtS2pxVGxSQnFxYWluZGcwTVM3TkdobE5abWl6VURPaGxxRVVGTU5x?=
 =?utf-8?B?R1MxNW1sNHB3dVBjSHBNdUNHbFZIWU5oY3BIejh5YklMUm9oKzRsMElpc1do?=
 =?utf-8?B?YnRUa2FSNkVOYXE2SEEzcGQ5TEorVmd4cHo1R3JpWmVwcnJVemExWjlldmwy?=
 =?utf-8?B?V2o3U1FuRWpZelVpczBCUHpvVzZQaXZsVW1WU1J1Z0srTWZxTXJQWmZOdEFQ?=
 =?utf-8?B?c2tBbVpidUxzR0VnNjNjQXNsWC90Y1ROU1pyZWprVHRDQk1OWU9GcDN4eHc1?=
 =?utf-8?B?djVNelJ5TWltUDJFMlhPY1k1VmhmN3AxRXZnam5kMGxGZDFUMjFLQUtNc0dv?=
 =?utf-8?B?cFNuTmVxVmVnaE5MV1ppS1A1VjMrRTY2dVhkTy82RUlVR0Nhcmh0bm11UEFT?=
 =?utf-8?B?Q2ROZHdtcG1lMmRxNUFpV2NNdG9PaGVIMzZTTnlJekUxVE1jK2dJVFdjdDBq?=
 =?utf-8?B?TXZOMnN4L3NmOWkwWVA2dTJ5V0IyNFdqRUlySy80TUdVbExFRkNWdnRFUUs1?=
 =?utf-8?B?NVgyVkNFNVFuZUloZGxKRGsveFlFK1N2MEJMODZHdnFjbjVvSlcyRXE1ODky?=
 =?utf-8?B?RGNDTDA2LzluaDV0Wi9KK0hna00vSkgzL0l0NXhJbFhtTUx2S3hUeHk5R0Ny?=
 =?utf-8?B?UTNlcXNhcXl0Z3d3cnU2bHRPS0NHNmthMTBvcE9icjJGUGFEUUc5bTV6RS9o?=
 =?utf-8?B?bElleXBpWnhGVFFWMlZrSnNzTVhvU2l1eExEbDRHUDZ6OEZnMXo2UEJROXVH?=
 =?utf-8?B?TlpsM0pibTNJSmJOSm1aSzVwbGptcElFb05rb2ZCWnU0dGNMYzA4U0RuVVJS?=
 =?utf-8?B?RWExL0YrRnFHUDRzdzJDb093cjhNcnh1UWZJZnEvKzJIemlaNW5lTnRGTEF6?=
 =?utf-8?B?dS9CbGNuTUp2WExPVGJqbExwVTV5OUxrSVd6ekxlRm0xZExnamQ5WnBpT29T?=
 =?utf-8?B?U2l0QnQ1cXdGb2Q2K3Zvd1FvZUN4UGpud3RnU0crbDlxdWRlMWk2RTRudjVl?=
 =?utf-8?B?N1NKeHdSdzFxeFd5K042UlBpVWhza2Zqdnh3eXBBQjZqZUU0Y1k5TDhLSnB3?=
 =?utf-8?B?WnNMczNMc1BtVGZtb2lXQncyTzRmNzJUTGJwRk52a1BrZ3d2dldNZ3d3L0NM?=
 =?utf-8?B?OTJEZ2kvVGJRakFLaXNHNnhOSFk0MkxQTnlkclZ2end5OGdCV254ZEYyUFhS?=
 =?utf-8?B?ZDZGS05XMW9LK3FKMTNJSlRhRlFsVUxPQW9lT2M1ZnZZamdwQzdZdXpKSEVq?=
 =?utf-8?B?bEQ0U3JlR1ZQczltQUFDby9zaW5ZUyt3NDNxM1Y0b1RRWklwMGZiZE5LRDlI?=
 =?utf-8?B?RTlFL0JPTWVkZGxHNHlMb1FvYVN3UEp1QnlmRUpFa3U5T2dlNWUrRFlMNk5V?=
 =?utf-8?B?OHJrdDhWNnJnNmVVNHpURlNwVGFhVDlBS2o3bXJmdEcvOEFqVHBHc3pnVXVX?=
 =?utf-8?B?TEFRajZqOGgrOHpIdHFZbmhQdi9SWStmMDZCcXYzb1Z0dWdST053ME9lUk1o?=
 =?utf-8?B?VTJrTHB2WE9JQU1YQ3FLeUxyWGgwcDJUN0dpNHNhSWdTbGQzbVM5RlhsQVht?=
 =?utf-8?B?WGRoWFJlOUVGbVZTVVNXTmpJOUFEZExxRTAvYWsyNWdkMzJ4WkNGaERmT0hL?=
 =?utf-8?B?ZFFDeVcrZmJkUU5na1VRTEVZNHJWNVNCWUpHeU5EWDVXeHVUNTFackFwZWhm?=
 =?utf-8?B?S21sSlBUZFRPdVRLN2ZsRVFIUXdVUkNTdUFIZU1rSll4MEtjRjZaQXlXQW00?=
 =?utf-8?B?ZnUyMVN1Ylgrck9Fa1ZKMFBuWXBpZ0RWZEY4S2xUeUlocWRDc1hxc0VnREd0?=
 =?utf-8?B?ZS9JWmdUcDhaakh1Z0Q4dHlod2l5VlVXK0RMUG9vejA1VE9XU1hYSTVla2c1?=
 =?utf-8?B?MVlGNk5VdDg5Qk5XbERCRlV2QzhRcy9LT01od0lHeDdQRkZBSm9rcVFrTXpR?=
 =?utf-8?B?SzNtNDM5SFg0SEMyc0hyMTZpUzVYNWQxdVlTMnZIek1BbHV6dm9mN1FjU3Vl?=
 =?utf-8?B?RGhtNGorVXJTdXljekRwc2pUMUJqa3h5cTVDYnViekUrU0xycGVqZHJUZVkz?=
 =?utf-8?B?RUt6b2d1UWUzUU51OFdOZlNOUDk4T3Bkd3FuVDFtSlFLdjVHelg0dy92ZHJZ?=
 =?utf-8?B?UDZsc2tpWktXYkhYWm5sWDVuOE9uOHVNTFkyOFJ2Q2ppaEt3eStFMWpjZmM4?=
 =?utf-8?B?Vnc0ZXVrZ1VTa0lwSGUvbFpWbnRiczJLb1ZFYXYrdE9reDAvQjZCU0ViYWxy?=
 =?utf-8?Q?cFQ4dsen6v/bnz9hoa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac6b5baa-4200-4c6c-9848-08de69c32144
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 23:13:13.2004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tU3AbFziuWc1bHYRgPfZjpvzvjTvlTa+V1lX6td/gZCRJgBHXnksiG21AnNLqUSiNZ0ux8G2Cu1vzLFs0tIIIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8558

The property interrupts use default interrupt controllers. But pass down
gpio<n> as phandle. Correct it by use interrupts-extended.

Fixes: d8cae888aa2bc ("ARM: dts: Add support for the cpuimx27 board from Eukrea and its baseboard")
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Try to fix CHECK_DTB warnings, but found it is functional block. Support
irq never worked before.
arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dtb: serial@3,200000 (ns8250): interrupts: [[28], [23], [8]] is too long
        from schema $id: http://devicetree.org/schemas/serial/8250.yaml
---
 arch/arm/boot/dts/nxp/imx/imx27-eukrea-cpuimx27.dtsi           | 8 ++++----
 arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx27-eukrea-cpuimx27.dtsi b/arch/arm/boot/dts/nxp/imx/imx27-eukrea-cpuimx27.dtsi
index bc28250df7a7fb729c2ef76b1f4b3c1199e7f1ba..87dd80fc7061eeef88eeb353edb042b9a631a356 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-eukrea-cpuimx27.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx27-eukrea-cpuimx27.dtsi
@@ -110,7 +110,7 @@ uart8250@3,200000 {
 		compatible = "ns8250";
 		clocks = <&clk14745600>;
 		fsl,weim-cs-timing = <0x0000d603 0x0d1d0d01 0x00d20000>;
-		interrupts = <&gpio2 23 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio2 23 IRQ_TYPE_LEVEL_LOW>;
 		reg = <3 0x200000 0x1000>;
 		reg-shift = <1>;
 		reg-io-width = <1>;
@@ -123,7 +123,7 @@ uart8250@3,400000 {
 		compatible = "ns8250";
 		clocks = <&clk14745600>;
 		fsl,weim-cs-timing = <0x0000d603 0x0d1d0d01 0x00d20000>;
-		interrupts = <&gpio2 22 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio2 22 IRQ_TYPE_LEVEL_LOW>;
 		reg = <3 0x400000 0x1000>;
 		reg-shift = <1>;
 		reg-io-width = <1>;
@@ -136,7 +136,7 @@ uart8250@3,800000 {
 		compatible = "ns8250";
 		clocks = <&clk14745600>;
 		fsl,weim-cs-timing = <0x0000d603 0x0d1d0d01 0x00d20000>;
-		interrupts = <&gpio2 27 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio2 27 IRQ_TYPE_LEVEL_LOW>;
 		reg = <3 0x800000 0x1000>;
 		reg-shift = <1>;
 		reg-io-width = <1>;
@@ -149,7 +149,7 @@ uart8250@3,1000000 {
 		compatible = "ns8250";
 		clocks = <&clk14745600>;
 		fsl,weim-cs-timing = <0x0000d603 0x0d1d0d01 0x00d20000>;
-		interrupts = <&gpio2 30 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio2 30 IRQ_TYPE_LEVEL_LOW>;
 		reg = <3 0x1000000 0x1000>;
 		reg-shift = <1>;
 		reg-io-width = <1>;
diff --git a/arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts b/arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts
index 1c834f2f5068d16174c086c1fe540ff371444675..26833ed3339e26ca88d36c4ae1b52a30943e649e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx27-eukrea-mbimxsd27-baseboard.dts
@@ -76,7 +76,7 @@ ads7846@0 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_touch>;
 		reg = <0>;
-		interrupts = <&gpio4 25 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&gpio4 25 IRQ_TYPE_LEVEL_LOW>;
 		spi-cpol;
 		spi-max-frequency = <1500000>;
 		ti,keep-vref-on;

-- 
2.43.0

