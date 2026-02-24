Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011021.outbound.protection.outlook.com [52.101.70.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B3F339840
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 20:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771964759; cv=fail; b=TjpKWHTTmRhpGvWvStBvT3FXE/KWDkvgpQLT3w7PGY4Jzxt3VgAPacivKd9+/e9nmSG68hIl/rRIOWZvcFh96M6m07Ch+8MZOxnHEogPS/RDGPvlORnHRZrREU7iDze4jAU0tc3S/XxjKW+/f8Dbl8mNbdUBBe9QHGEnBgtJJ5k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771964759; c=relaxed/simple;
	bh=Q2EVSDTUoUX9yvRRnRIHKvc+VM2BFTMJlj2J3V6PIMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b9L8Jp0wKSTQXmPPmmlUFGzvROt2BWIb9edYBqNDjmCyeWr0BnkEb3UgYm4yw4vgc2DucrXm0VbzxNHidsCx75xgxGaVgEVJR6ycBrcjD6hPOjofYIz9gGEMiYiLX6l4GhC1epcjCDaxP5RVsYZ2kcqVn0snrf7Ke3sWpMVcjvA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=SKtYS+cf; arc=fail smtp.client-ip=52.101.70.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="SKtYS+cf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PAqOPCVjyrHNcDP8nT+MvCPbmgCHKJI/jDS3gLIqQW8W7ruWzCwVGSMBstLC/7a7VsNCgJDUezCjJue+gbqNvG0bmUyAdVQUTZuJSh994r6vwHHuPG8q7F5ZdaRyibpVqNiCbWleRpqH/pKVhwsUMIIB/jmhcRLlbYeo5Q2Glsje1B1zv0pNOIcKjrmu5pQx2301KzYsAeXdViUhRoRw0JdZIo1RRs9ZWjAdB0L8kXUzmTxXNQGw/atb0U4Sm5pLAFHOfsxhz0yVdcMO26BSEys5aZIfIi7F0Do5cg55FbYMBSLGZwG/BPR5knj7YVtWKX/Rr/Qctbu2MZ1exLNG2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptQ1Tjy2XCMzC9w9ESkGQs7p8szYR0LKQgDZvPdTEng=;
 b=qvFKo2WEJZHa3Qepuy5bjOEg0onUP7+9gYOwm1RqdXz7HBKTz7iibApszghhj5n5QXQHlLumWBM1rsQuB2kKxbb4YudZIRD49kxaPDyVCeOCvPt4ZnxcQm7Zp2ERsCqbXRQa0Sk1xoUrytZ3SoTzmXWY3CZ5zuZWxyGa8RmcpEv9hOOWlu2+wk6/0/uijvWsqlglqTHjI/G0ItclDXSaTMh7lXxY5vJvv3j11y7h6zUWpxMMCWPsfLX+PEBLgmGbozksrETRkga0tUJxEfwNB0V0+85GdI2NeVMgdy1pc14CV1FEoFT7FjAtrGO0YWDd9s8YaOMMSoVSd4V4s5LRmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptQ1Tjy2XCMzC9w9ESkGQs7p8szYR0LKQgDZvPdTEng=;
 b=SKtYS+cfoucRper7HGz5O6hIw2VilLgG/mEzWNIIHPT9W6gDlaqRR7OM5rV3Mo6+RNoSdoPyYleNDtZZvmoQT9I+we/fJZTp4x8ea6YibyHuN956d6EUhsBhv4QOJ4DWXa83lAgoSmki1Fmtdm9PWqHESnNV5FL1uijiNPFxub78buM3uA36WiIrJU4CVj0VUteNBKdZE8vH6bpcwOmxpbX2pc06uoxjZJ53h8htztlk3CjlrIvuVtOazBuT/GdK7fHvTYwZTYTMOrOSZHbZOJ0xO8DNvM/RD1Ft5W/7KGFqoOsEp5GqeRosBvUsfiiuMNWGs+TauJfLXBVWMaQrzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU4PR04MB11848.eurprd04.prod.outlook.com (2603:10a6:10:624::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 20:25:55 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 20:25:55 +0000
From: Frank Li <Frank.Li@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	shawnguo@kernel.org,
	daniel.baluta@nxp.com,
	dario.binacchi@amarulasolutions.com,
	alexander.stein@ew.tq-group.com,
	Markus.Niebel@tq-group.com,
	matthias.schiffer@tq-group.com,
	y.moog@phytec.de,
	josua@solid-run.com,
	francesco.dolcini@toradex.com,
	primoz.fiser@norik.com,
	Sherry Sun <sherry.sun@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH V6 0/5] arm64: dts: imx93: Add i.MX93 Wireless EVK and refactor common parts
Date: Tue, 24 Feb 2026 15:25:36 -0500
Message-ID: <177196471174.3292492.16035886420401299688.b4-ty@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260204083551.2867263-1-sherry.sun@nxp.com>
References: <20260204083551.2867263-1-sherry.sun@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR02CA0050.namprd02.prod.outlook.com
 (2603:10b6:510:2da::19) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU4PR04MB11848:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b0678d9-215b-4175-6a8f-08de73e2e936
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|7416014|376014|52116014|366016|19092799006|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?aytzWS91MXhEN2VxajdiTUJVL25FQ09rUDQrN0VhTUxXMEIxUFgrV2pHRU00?=
 =?utf-8?B?UmxlWnQ5eU5NZ05RMUc3a3Bya2J5V2RxZjgrTFdGMnB0TUZxcEFidkZBMEhm?=
 =?utf-8?B?cDhEWGVueGs3MTRsVlhsS3p1enRHSXd4bHAxS3JNNnBjTVVrd2l5RGVVZDN5?=
 =?utf-8?B?cUlIMmFMeDI4K3dqY1djSFJaUTFWRVM1c0RiSHFIUzFkbUg4bHB2dDVqV1RV?=
 =?utf-8?B?M0trdlZvOUE0anVDMXpuaGFEWmw5eEV2RTNwcVhQdFE5VHpIbC9tL3RRa1M1?=
 =?utf-8?B?bmJsQlIxdFBvQVVFOExyYlY0RXNzQnJCaDkwRFl2eWxTSjBrMlQvbmhBbHZo?=
 =?utf-8?B?QnYzLytBa0RueVdNcG95YlN0NFRLOHJsVUM3b1dJWHJzdHFYV3Z2Q1F4UkFp?=
 =?utf-8?B?cTFTazdGWG5iSWlXbFBQRG5JMnlXQVVCMld5b01Pa215VnF2MXJWYng1OWdE?=
 =?utf-8?B?cEFvYXU2NktINnU5UW1qV0c2RDZtWUpCanZqVnBiTmZ2VU8rd3BhTThFb21U?=
 =?utf-8?B?enlmNEtJNUxjQ2pYSkxZYzFDN3FlTUNHeVVwZEx3eWVrcm5rZkg5Unhyc1lJ?=
 =?utf-8?B?dEdZU2p6QmxBcWpzOFBBVUdadDd0R1hXcnhIQlExWjlSS1Q3bHNpb1NPYUhj?=
 =?utf-8?B?Vmx2b1VHSlRNQkNKQUVOVVozY01YdFM0QllTRnRZV09qNFh4T0NPQXRvaUtY?=
 =?utf-8?B?UlJkZkQ3bEwwSnZ0Q0x2R1VHSG1nNWp3dGpCTThNeHRVNE11VUpNS1RGRlhI?=
 =?utf-8?B?Rm1IVDlENmVWb0NxVkdsdDVKN2FXcWpwdXJZV3k0a1lqbjJhMG5rSzkvaGtp?=
 =?utf-8?B?bnZtS1UxOHhwZnpxVFZKWFhweVFNUVJRZ0RpUXNCN3BDMjc5VFNlbUpXcFBy?=
 =?utf-8?B?NVR0d21pRk8remV2dGN4cFNieFF6NGJLaitUdlVMMXo0Sk5xVWJvVDh4TzBl?=
 =?utf-8?B?YjlJL0p4ZTl6S01aS09iSEtKbXU5OGVtQk5WSEpOU0RNMERnMFRKVkw0U2lL?=
 =?utf-8?B?eC9Xak90L29mYzhUNWZubHZHRUtCUDhMVS9zZ25XZmVVcWYyOXBhWVppVTF6?=
 =?utf-8?B?K3dZKzM0V3BIWFZJS3hMb2hnTEE4Z3lkbU9aZlc1NitaWHplK21NdUdDaE9u?=
 =?utf-8?B?eS9HdnJldm90cFFkd2R1TFVCNmlDVjlHS1FuN25qWithZGFWaTloeXJRK1Fk?=
 =?utf-8?B?RVNLZThkZjA5cEE3cGV3U3kwWVovSG1LNEJHNGJ4enYwNzhFTEkvMk94N2VT?=
 =?utf-8?B?Q2VTQTEzSUJCMHZYanhlbEhGOUVWeFZtSHJ2eWhTSUJKOUhITXZJc1BlMVBM?=
 =?utf-8?B?bU5IMTY3d0I3UDl3UGRKQVY2STMyYzRVaDVTRnp2TXo5bXNoSzJIbGpqN2Jh?=
 =?utf-8?B?Vm5wNEdQOG1ab3BxZHJWajk0VDBoeUE2N0xURFFBV2MweDFwMXpLSWY0VjhR?=
 =?utf-8?B?VFNuTGNZLzNMS3dGZjEyZlU4OWgyYVJuODF0STExTVVQMi9kVEdaNVVYUU45?=
 =?utf-8?B?SDhsMjdYNTE0RUt5c0tISTZBeUZ4YzdKYThZeEpFOWpPR0JLcU4zUy9XeU1v?=
 =?utf-8?B?ODlyemUvcm1xMXMwb3hXWkhjOVI0MFF4T29lb2pJRVRwam1MYnpnc1IrY0xS?=
 =?utf-8?B?RFFBZERaNDN1NVg0YUloVUxSQ0NHZUw3L0hSdHBLcWtITlF0Yk9wRHRxT05F?=
 =?utf-8?B?RGlBZ3Nyanc3Nm4vYVpwY1RoYy9ieDlrZFBySlFMSk41SHdrQlNpNWViYVlF?=
 =?utf-8?B?dXhTM3RJZzBSZGxRVTcyVDlqbG5zNHk4TGk2eEE5b0REM2VNZnZjcUxTd1R3?=
 =?utf-8?B?OFljUmVPbllpaXlFcVJWNkNXT3h2R3F5UzFvczJmWUhNTXRwMlRKUW9mKzNa?=
 =?utf-8?B?bTlaMXVKT2dWTlFta1FybGUzVE8wRm9OYzRVV2J4UTd1NUtSblNxWlYzamN3?=
 =?utf-8?B?Qy90T1krY3UvdTJqa2t4dlJZRHdMdllxTGFmd1dnWkxpVEM2QzBsVVphUGxy?=
 =?utf-8?B?YzhBMjdzeXJKUDRhdkVUSVBha0VvWWJ4N3J0anZIYlk2YVNBZUgrSFNtbDZV?=
 =?utf-8?B?RGU3c0Q2WCsxejZzY1h2d2RhMlFnN0kydkxGTzMyMVV6S3RZdTRGai9zN3d6?=
 =?utf-8?B?d3NaamJvcmdlaktoZW9FcGRVMzJKVEVFV2o0Q3FYZzZLRUtMaC9mV2ZLc3Nr?=
 =?utf-8?Q?ggUlzi4PHRWdXmroaFpGvIJyad5rIPXrPQjFDyOU/6rB?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(52116014)(366016)(19092799006)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?U0Z5T3ZwZ1RtZS9qN1NTK2s0b2lIUklmdWt0ZFlrdVEvL2dTVmxPemRRMmJI?=
 =?utf-8?B?RWhpOE1IWlR5U0pQQTByYmtSUGRyc3pQVVhNL3hQOTZZU0pEL2czRjN1VHZS?=
 =?utf-8?B?Z3o1djV5NjVPc1l3R2dqTmZHLzF4VVR1TE5jQ0kwTmlscVRrOG91dDMwNGJE?=
 =?utf-8?B?SERDYm1pdkVzVnlweldPMVdNUGdhVWVaOEJrbEdYVlNFL3V6c1lXY1AwWHZ0?=
 =?utf-8?B?emlLem5SMHZodm8vRklBaWxlVnZpWlhOV1d1elZmTzZKOGxob3lmYnVEck55?=
 =?utf-8?B?T2Q2V3U3QlRxNHkxRDZKZDcyaUVycHdmTWtEUzZRZDBvQ0d6aXpoQmQ4WlpV?=
 =?utf-8?B?aURhNjU5RXQ2WHZXb3JxVmV0cVRNUHBkeWs1ZUVEYkdXZEdFaTFZeEFGdjhm?=
 =?utf-8?B?M3ZNODBHRUVxZ0h6ZTVDcHdSdjF0YWZvaG80cEpERzVYRGJDUk9reFZpVFll?=
 =?utf-8?B?ZklVaTZIMEZYUVV6TlNqa3R5NDRFVmV1Q2gvbHlpdzZtQk50L1Bicm1Xd041?=
 =?utf-8?B?UUlObGN4RTVDU1hpb1MxYkRBMEo4b0E5dkovaWxvdFA1eGZQQkFtemh5SnYx?=
 =?utf-8?B?a1pEOXFqRThKOW1lSEduRU5VZVp1QmlJcHBrNHBtRVF4d3lTRkgyOFJ3QkhK?=
 =?utf-8?B?SGNnQ1NibklPOTZGNlpPUjBwYkpkM0VZNm1IUlcrblh3ZFBEQ09oeGhwMVBN?=
 =?utf-8?B?RW8rUU9VQ3o1NURzQUZvOWUwNUswb0tMTm1EdVAzcE9IZ3N3L3o3TU1IM0Z0?=
 =?utf-8?B?d3FHR1JEREhvQ2QvaXM3dDRQc200NnFlekhHb05OckM3WFk2WU9VSDNxTGVh?=
 =?utf-8?B?RUE1cjY1bjUzQ3lhQW9BUEwvMUt5STJGY3dxcTN2ZkhSL3dDT0lIdEcwMlJK?=
 =?utf-8?B?TU9KZHozZUJmcEE1V3VxWjE4YStxOHFjWnA3N202SWZONllCdDZ3K2N3MTdr?=
 =?utf-8?B?cGxlUi9sVUhsSmViaDJkL29CUTNtMGthWUk0TVBwYjVGZEtXeUE4c1dkYnFs?=
 =?utf-8?B?aDRIWVJaaXpuSncxWTc2eUJDVDluODY2azVlVzkrMy9GZTRsc1VHMUkyUTVP?=
 =?utf-8?B?M3dtTkp1M1ZvL0lDb3pITFk3d1BBV3U0SllrM1IyaFFjUUwwZ2Y5QUt6V1Fu?=
 =?utf-8?B?QjVBYzQyTElvdEFJUXJSeVUyN0dPNW1YT2NxbzYxUWZObXZraUQ0ZEVTalBv?=
 =?utf-8?B?Z1ZhVExVSVFzRTZBZHNFOWNPbktqQVJmYjJaRWJrQTZWZDBjbDJ2NVdubHNk?=
 =?utf-8?B?TFdDZG9jcGllV1RFeHBvc0tzMkZoMzJQeGdvdUsra1U0eEYxSkJIZEtMZ1oz?=
 =?utf-8?B?YzhuUC9mV1JTY2E3ZHlNejluSG1OTEFGTlBHV0c0S2pVZWJVM0J0cG5kTXB1?=
 =?utf-8?B?R1Y0eHhrR01sbGhNcFpaanJmUGJzeDVDYmpCVGV6ZXovRmdzNmJNNUIzL2tL?=
 =?utf-8?B?NFhpaHFTYkJlREM5V1RBVWVJVm00dDByVXRRZkhON2tMaFVlYXRrMVNReDlq?=
 =?utf-8?B?dUlXRU9JaXlGeG9HZy91Yll5U3ZyenlMd2gvTnBpRm8vbWVrRndDUWFIUGFa?=
 =?utf-8?B?aXFodGk1NzBiOGdEdmo1dDkwN1BrNEtadFpnc1g5VWxyWndhbVNBVzdxQzBU?=
 =?utf-8?B?QzF1djBwcEQvaEdjdDl2RUxSVm43byt6bXRvaVJpQVZzM3F2L1VrYmg1UkQ5?=
 =?utf-8?B?MmtVaDZTU3VwVXVzODIyOFRDVEpxQnNaMzU4QkJhZ0dqMFFHQmcvVStEdmdO?=
 =?utf-8?B?REtIYXhQRWN2RzNnWUIvUUFXQlJZdGVqWVV3WHFsOWl0ODd2V3pTNkcvT1FQ?=
 =?utf-8?B?bEx1Rkp1dk0vUzhvTGdNamtJREdKQzNOUEJOcFQxL1BkWHVPcmhPaXczTU45?=
 =?utf-8?B?WEFxMUtyT3F6ckZ3L0w1cTY0aEo5RHZZVEl6SjMwekVNS2VrU2dnMFRxZlpX?=
 =?utf-8?B?V1NIUWxhUWF4SENmeWFRQlhQZUdxblNrRUExOXRSd3BGd2czSXpUTDc0WWJO?=
 =?utf-8?B?YnQ4SlJpcGIxVkZYUmVFclRyalFaT0dLWTlQenpNa1YxaG83cU1YaHVOTVRM?=
 =?utf-8?B?VmJ6VUlyUS9CVmVEdENqb25LaFFWM3pkRitBM0wyNkl3ZUp2dzJsMlMrQ2dW?=
 =?utf-8?B?U2FrL0xQb3lXNnZkYlpBWmdqYmpvSmlyK1ZORXJjRUZqNkM5M3NOVlJoelgz?=
 =?utf-8?B?R1hWNFFxa1FHSktUM0NLWGZaM2x3amFWa2RtZXFjaHYrYzFxUHBaeHJvSVkw?=
 =?utf-8?B?cGdpbWI5U3dFQVlveTdrQjhsNEdlVjFDczlZTlFLREFjMnFUdjZsaTFFVE1K?=
 =?utf-8?B?NDRnZERMbFJrS2hqYXNUQUtwMFdrSFhuSENCQ1RjSFNpZ01uVUVqUT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b0678d9-215b-4175-6a8f-08de73e2e936
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 20:25:54.9440
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DnQOJmmFkE0Gn0P/UUW0Y8Ptxz+xUgFOn8/ppc1zuaMS41NtCw86R47Fs0Q15DmGTZShfZAmG0snXwXsUT807w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11848


On Wed, 04 Feb 2026 16:35:46 +0800, Sherry Sun wrote:
> This patch set adds support for the NXP i.MX93 Wireless EVK and refactors
> the existing i.MX93 11x11 EVK DTS to share the common parts via a new
> imx93-11x11-evk-common.dtsi. The Wireless EVK integrates i.MX93 with an
> IW610(WiFi + BLE + 802.15.4) SiP and reuses most of the 11x11 EVK design
> with minor functional and pin connection differences.
> 
> Also introduce imx93w.dtsi to describe the new NXP i.MX93 Wireless SiP so
> that can be reused by multiple boards adopting the i.MX93 Wireless SiP.
> 
> [...]

Applied, thanks!

[2/5] arm64: dts: imx93: Extract common EVK description into shared dtsi
      (no commit info)
[3/5] arm64: dts: imx93: Move 11x11 EVK specific parts back to imx93-11x11-evk.dts
      (no commit info)
[4/5] arm64: dts: imx93: Add imx93w.dtsi for i.MX93 Wireless SiP
      (no commit info)
[5/5] arm64: dts: imx93: Add i.MX93 Wireless EVK board support
      (no commit info)

Best regards,
--
Frank Li <Frank.Li@nxp.com>
