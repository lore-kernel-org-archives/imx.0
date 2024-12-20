Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2049.outbound.protection.outlook.com [40.107.247.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C2A2156F6
	for <imx@lists.linux.dev>; Fri, 20 Dec 2024 12:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734698375; cv=fail; b=auSGxxqAAaUhkWMesgBCOlWoBdgfN+vWhHs/1o7CfdGuDD35NqH9MNLiI0G67o6lpYYmBMU7edDi5hv9Jn3PZAc98zrlkFPTIrd/DyUCAgFkbdWqbRn5KkU9igJBxyz7gZfrYuYpWpSuesJhrBNYoWtgwfH9aNxtmRcn7H1JjdM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734698375; c=relaxed/simple;
	bh=fKJZ0yRZJBhdcBIvBo7tIoRZVSYpM761/9nDtOzAdpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CuMLn68vM1hkoBwho48Jgi90j8FbRKPQmicMAE1thLpEN1dYjFtRXxkwPLONksxlIwQZWFg4Cho8we3wy2IeuExILKfRyfIn8JQTNdoHZZ40LAvBVMw/UfEC7Wn0HwsMiM1itStK5Va8rC92piNLPW0lYN4QxJAF2ymicUvD23g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cO2DAkVM; arc=fail smtp.client-ip=40.107.247.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cO2DAkVM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yhjNiTpCkMtMi/CU/LHUIvzfBtX9csFclPDnrg742coyL+MLZDbkUxx7a/V91VVHqkcYs68zCyJxi6HcktjlqiXavIjjz7SEhZ9OyUxA4bRd2QHj0wG00jrBhxMS6+EdaNWMUUid91WVI8KSnvbU0rqOBLAZ336ddC0G4SYphJF7BF0TJahRtrFYuj7EgcKjTRNE4my5/0sGe/rNAdbMymXTut4uDAtA75k6FeEA7PtDxrQHcXSiCCOCTb5gQ3K0UjGgqOxK7vdGh96bt4GkV5r7rUiz76w2BZ40/5i1UegMjdf1RiJDpmjYmaeHMkpxV0h7MJ2yTx+t+H4SciMJ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkNB8LywE7M88QDtjZgOzjmkSZR4KFRF9D1R1Fvu8ZA=;
 b=BL5SzSo9z2enJPV5TSZdNNC1w7TIP36vkxPoZnW1G89DAPnDxTaqHtSqU/hve3E5tARxf2UOplCeJmA9blAaqoJtVdIeA1vKnVJTNZILEb3AdBrLn0jaLGlBYK1MmUkbL1iRi3Afv/l6FCljvDYqJ2voY5R/oaQBLAcpKosI5DIUfeV4zfkGMuyl3NiEG8TTAC9p1xZPt65y1MF6ooJK7Ucce3i+i/lRIPQ2wsV4ml9oUrISyOI2ECnim75XkiTR6c5I719tg0kVM5BIP7f780cbskOTPVRkJpfZYuX13xxFwJe5k8P5gEDiKGcRlP1WcDkNBkmnXhJeJBfjcVrYTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkNB8LywE7M88QDtjZgOzjmkSZR4KFRF9D1R1Fvu8ZA=;
 b=cO2DAkVMsmH8+SnR/OceD3FUFrFQojHtCpf6zvdOBw0J0BvXCO1CIsOwt/6eKV6wAysOMXrILcVkyUglPQDv80jiqfgmtXqwCZT2MyhtEPFRTHPkqlBdTsZRERg2WMxUqop88GG50Etpjby1je/QsKlkDXgJb0Cw6UYPQGI4Jinyb0uTwZ6PjNKzv9VXNbi3dhdYu+ayQ9xEQoErGimSR+g1Wh4/qFBu73Kc4ZUOr4azDuScGI32oqBRkYpV/TbTinuv9u5OEa8OqU8u0YhHaLejVbSG3IsQcWG6LMgFuMr99u1wMY9mxPEhYMf4EBvzUati/gDmaJZpkRRGWTnGfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by GV1PR04MB9516.eurprd04.prod.outlook.com (2603:10a6:150:29::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 12:39:28 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 12:39:28 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v4 3/4] arm64: dts: s32g: include necessary 'EVB/RDB' common board dtsi
Date: Fri, 20 Dec 2024 14:39:15 +0200
Message-ID: <20241220123916.1452582-4-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241220123916.1452582-1-ciprianmarian.costea@oss.nxp.com>
References: <20241220123916.1452582-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0002.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::15) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|GV1PR04MB9516:EE_
X-MS-Office365-Filtering-Correlation-Id: 4591ec42-ad8b-48fc-a68c-08dd20f357fd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a3Q0OW9IcGJBTkcyM2lQNjR2Szg3d0VmUnZJbFJnOVNrMFNySkh5MUhLVzBZ?=
 =?utf-8?B?dExySTFGcjJFaVZLUk0xV2JXQnNRYmd4SHBjSXJyNHFBanViRUpFMGZuVXJ1?=
 =?utf-8?B?SFVNSnBmeXNtZk51ekxkdWVlcVpublBJUjRCaUwrenlQVnVPTWZQdFJiRVBk?=
 =?utf-8?B?a0pKRHBkN2tPbkxnbFc1ZUgzZ0h6L1lDWGdueEtqclovaHNLQXBzbzlwVEgv?=
 =?utf-8?B?dEVSZVVpVzIwdVRlQlJZUGZ6SUJOUFJrWlZ3dERac1Bnd2dySXNOQml5UzA1?=
 =?utf-8?B?VlorQmRSa2ZzT09JN2ZOZ0liKy9keFdHaWgrSWRiMVhrTW9qNXJjNjhPU2JH?=
 =?utf-8?B?Qlo0cFN1MWQreGwyMzRZUUdyVWxKNHlsOUZ6b0ZBUDlSVzJQZGQ2c1lzNEZR?=
 =?utf-8?B?VnNqblZHNWE3WUlOYkxGNVMwZzRYZTRBTEJyeTFSYmdUaUlUOWZwY0JFR2lT?=
 =?utf-8?B?RW9aLzFrZlUrckpXeWJBMlhWc0hWOWlCdnBreVJ3b2RyRENFclBiZmZKWmNY?=
 =?utf-8?B?NkdUWlJKZVZMcGNtYzFVazc1RjRrMC9YK1FIRm1yNkZaVVlOWU9hQ3VSci9W?=
 =?utf-8?B?NVJ3c1B6NEx1SUNMUDBmenl5UkZwNyszQnhETmxUcDhORmhiL05hMGtab3Z5?=
 =?utf-8?B?dm9Zem1yZUE5S2NseFJ0U0VMYk02QTMvSUUrSjFnajc2RXZ6RUc5TlRQMENi?=
 =?utf-8?B?MVRXdkhIdWtXWGdVR0dyRENLVjJWeU9Oa1p4bnE3cTNRUVo2RnBVZ2xGeEN2?=
 =?utf-8?B?THRJTjFNdEwzM01tMVpNa2N4RC80RW51TkJWU3dyUVR1RjliM0QvRm0ySVBY?=
 =?utf-8?B?M3QrZmcrZUlpU0YxeGNiT2NiakFWdWJDc2Y1UkR0SWMxakIwenZSQ1J3clJB?=
 =?utf-8?B?bThKWi9GUkNaMlc4WTgyWDRkZXgycExWbEtoYTF0ZEZkSkJBOWw4d0k2NVlw?=
 =?utf-8?B?alNWcHdRM3YvcUdxRlIzSGFqRk1nSUZoaEd6THBGZE5Zb2svRXVJSlNVU3Nr?=
 =?utf-8?B?dUZDMXdEOHBTKytOUklrL0N1UUNwQXVlbmF5OVVqN2dXQjFkK0U2TTFURWNn?=
 =?utf-8?B?SW1TbmxSZ1BFT1ZVTGwvWjFYbE15U2k1N3AwZzhtQUNOYnI1NWQxTzJQaStT?=
 =?utf-8?B?YzdDdEt0bUJHczRTdEZtaGMyWEdOaHhtRURrd0hRakFxZkgvVWFnU2plZVIr?=
 =?utf-8?B?RWluYXZBWXpseGtyWUNScXFwNjVkRzVoYW1GZUFnaEVvWlJ2VEVDR0pidGJu?=
 =?utf-8?B?SlpaVlltdXljYzlLdXIxMXMxd2dkdWVISTZQd1ZLQTBGbW5icmh3d3Q1SlNB?=
 =?utf-8?B?MS9ZbDVrczc0TGRvUlFLRnF4Njh5aytwVTEwMlRvTzVOM29RZm9Cb1A0Zkxt?=
 =?utf-8?B?TExpL2lnVHJDNVBhVXk1NnJJN04vc1dGVnNwVnhCSGxOYm8wcEJEMU1GYjM2?=
 =?utf-8?B?eTMxTTFoZW1LalF4QWsyazc5UlpxNG9MbkhFcTZoek9TMWtDb25XUmMxUnBC?=
 =?utf-8?B?THBRL1FCWElEV0tBY0hBRWppZFFYN2owVVJhdlVrTE1ZUFNHWFovSmFUaGhK?=
 =?utf-8?B?MlVtOVZFODUrTWIyRFdjTzkrdnExSnN0V3dSTDhRTms0ZWVvdndmUkFsSVlM?=
 =?utf-8?B?dG0yTWlvUU5mdHl4bVA5dFgrT3F6ZFBNVjllM00yRzlJT3FLNUpWd3g4eHg5?=
 =?utf-8?B?U3pWTDNzK0o3a2xPczFPdGNETlpXOW1WQ2ZWNU5QN1hNM09Fbm5pNWdualUw?=
 =?utf-8?B?VjNwTWFldWVCYnhmS0RvakxqMFZtRi9mYWZ0TVIxR05NU09DWWdqV3Uwblp1?=
 =?utf-8?B?S1ZiUWRESGEzdHY3SXMwVXNyY0ttWjFTazNHK1JkOFh2VUxLalpjbm1pdEIv?=
 =?utf-8?Q?wmvC3V16MJFkK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MUpUM09GTlV2TnRYZkM2TngrNG84UGk4Y2ZGcUpNK1RBNXBjYU5wOWZ6VC9z?=
 =?utf-8?B?S0FNYTh5NW9PSnNlaTBWRk51aWd6TEw2R3NLa2hia0tBbmxwYis0YmN0bStV?=
 =?utf-8?B?K1o5eXpvQU8waWdSbEVCdjUrb2dnSmpTbUNNRmNCSitmMTQxaHRJQnRVYkVZ?=
 =?utf-8?B?bnFxc0xvcTFyS3gwdVJUSFlhanJ2cG9UeUNXNlFUWjNvTEdTWlR5cUpZT0E0?=
 =?utf-8?B?U2ZQeU9PSW04eWFUZzFuNzRodVZlVjlUZ1BhR3hwVTFIdS9PYXdpa1JMOVlX?=
 =?utf-8?B?cjNpOFBBSmtnemRwRVBnNEFqK1BaemVvT0FIMXZ4REN1dmErYXBWUFNYbW5D?=
 =?utf-8?B?L0lEMGswM0dkSE1zaW95R3puaFpPZ0hPcjE4RW00aWtOU1QxbFdhUGJ1a0Fy?=
 =?utf-8?B?TWtrNjNERHBVem10eEFUOGZzdG1OalZIVUM5NWcrczFtT252dk8xNDRUUFVt?=
 =?utf-8?B?bzQ2MzhtN29sem93dGhKMzRUUzZpbm5IaVF5MzV6bGpPVUlDeXVUT3R1T3hl?=
 =?utf-8?B?VGNXN3JvZFZHZmJsZ25iWGdPWmhzWEhzMklURkFQQ1I2ZWZLSHNnOEcxMUN4?=
 =?utf-8?B?bHV2d2VJTms1ZmdlcDNaUnNuRjgvNyszK0hYNG9TS3kzc0FYN3VjVE9hTC90?=
 =?utf-8?B?M25KUHJheGJPVFl0c1k4OGdITGJ2T0E2dWJaS21hc00reTRkUndVNWFMc05G?=
 =?utf-8?B?VUZPd3RWWXpybjM1VzJXcFlCTlI0M0FLajJ6L21LTldicWZ6WjVQNEkrNTVm?=
 =?utf-8?B?ZFlsK0U4UXM4U2JBZnJWTEo5aGtjdmloTnNsTktwL0U0K2h6SGRBTTRQVXA2?=
 =?utf-8?B?QUlZQlhWWkhsbXZweDlqS090UWRPNUMzNEVqVnM5T25PWVAzV0JFSFlaUlNz?=
 =?utf-8?B?blo2eldUMS9pTGtFNGVHNmoxMTlmTzQvZ1E5SWMyWmEwQ2ZvM3ZZVEJKd0pI?=
 =?utf-8?B?MXNPSVFGVTZid1FyeEk0R3FuVG9aWjBFeDBGUEY5eEs2d2xUVW9Qd0RIbHNP?=
 =?utf-8?B?OHE3R0hjWmFnWTNmWmMvVzJka2N2Z0xVSnRVdTVNV3JFQU8wOGRQMnI0VTdR?=
 =?utf-8?B?dTlmNWQ4R3lzOEtRbldKeVRKNUY2WTl2cmhnTU5hcW5TVmMzSHpvTlFNOE9S?=
 =?utf-8?B?cmZkSDVoemt4VkgzTlRQZzJOeGVTS0JCUzVtQy96amVkRTZudFpUSktjUGtv?=
 =?utf-8?B?K0Zjd1BDalJtYTVmcmQ3YzdKOE00U0lidU43Rm81TC9lMm9JUmw2VGpsZVE3?=
 =?utf-8?B?cU1sSWdYaU9lK0JzTEsvejZ3VjUvTGVYRWczREdtYXEycml5TXZhbTBhazRR?=
 =?utf-8?B?d09RdVVaby9TVkFHTytZMitQN09idXRaU1dkU3JzM3hoSHNqdEJObjd0YTBj?=
 =?utf-8?B?RjFRWk5yY0tWcE43VERVVjlKNk1MY2x5WWR5T09vVVQ0TW1nazRNaW0rM1V3?=
 =?utf-8?B?RG1SYkR4cURDbVl5c2NJWFpDMm53TWxPQjRkUE9kUkRhUnhlZnlHKzIrZnVj?=
 =?utf-8?B?VWRyOFhhMUs4bGZtRC9uYStVWDBFQ1NCdHhBemRLc0dKR0dES1g2bkhLZktq?=
 =?utf-8?B?cUxvVEFXYlJISWZaWmlVTTRETS9HTDFyakZjUk9LV1lJVkxTdnkvekZ6eEFP?=
 =?utf-8?B?S0RtbDBNYWo0dEVyKzRDSENOeXBZa1NJdHBJS0NmYkl0a0kxbWxwU21KR3Ev?=
 =?utf-8?B?YmdFUVYxSzhkTmxkWDNMbjE0QnR3Z2dpaHk3eHNLcHYzMk9nVkdvOEJKRGNT?=
 =?utf-8?B?NTRZYTIvWlBXNWZBNXpxaVBxQ3k2SEZ0ZzhuMHYxNWZ2eVlYOWNJYmo2UjhR?=
 =?utf-8?B?dDZnOHBoc0ZSaVhDL3NBVnRWUms1QWhEUUd1MkUrRjlOVlF0REhHSXNSOWFx?=
 =?utf-8?B?U1Y1bkI1dDBENU40TndSbnhoNW56bEVnZ1ZQeVNUc0I5QnFteXJDcFBPMU1m?=
 =?utf-8?B?U1lIaE1ndEpEcFVFTC8zbURxaTRBZWw1aWpRTFJQZ2pmdVhWZHFRSFdubDdK?=
 =?utf-8?B?WkVBZ2kwcWZ3ZHhZVzNqa0pBRmk5VVI3WEFwSWJib205TENKdzhSdFBQLzJi?=
 =?utf-8?B?dm1IczB3ZFpPQlFzYXQxT0FtbHdNWk9aVnVuaVA2NmhQMDdJMmxJRk1hY2p5?=
 =?utf-8?B?UlBqVzlJK1RIRW1vTjhKek1ucC9YNUN2b3RHcjJFVGVqY3EwQnMyZGdJTElE?=
 =?utf-8?B?M2c9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4591ec42-ad8b-48fc-a68c-08dd20f357fd
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 12:39:28.3332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mM120ZVjku1aK1uKZPk6gm7pNiC1VyvTBjJfyNp0IKWKVhFGN/p/8u+HE+TzO0ptG+g/H7kBwd75v4t0r1kn6vp/fBzXI36YLF6zMOTdM48=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9516

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

After the 'S32G2/S32G3' common 'EVB' and 'RDB' dtsi support addition,
include the necessary header depending on board flavour.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 arch/arm64/boot/dts/freescale/s32g274a-evb.dts  | 1 +
 arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts | 1 +
 arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g274a-evb.dts b/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
index b9a119eea2b7..c4a195dd67bf 100644
--- a/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
+++ b/arch/arm64/boot/dts/freescale/s32g274a-evb.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "s32g2.dtsi"
+#include "s32gxxxa-evb.dtsi"
 
 / {
 	model = "NXP S32G2 Evaluation Board (S32G-VNP-EVB)";
diff --git a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
index aaa61a8ad0da..b5ba51696f43 100644
--- a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
+++ b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "s32g2.dtsi"
+#include "s32gxxxa-rdb.dtsi"
 
 / {
 	model = "NXP S32G2 Reference Design Board 2 (S32G-VNP-RDB2)";
diff --git a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
index 828e353455b5..94f531be4017 100644
--- a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
+++ b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
@@ -8,6 +8,7 @@
 /dts-v1/;
 
 #include "s32g3.dtsi"
+#include "s32gxxxa-rdb.dtsi"
 
 / {
 	model = "NXP S32G3 Reference Design Board 3 (S32G-VNP-RDB3)";
-- 
2.45.2

