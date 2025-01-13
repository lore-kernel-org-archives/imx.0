Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2080.outbound.protection.outlook.com [40.107.105.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E3022F14F
	for <imx@lists.linux.dev>; Mon, 13 Jan 2025 11:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736766323; cv=fail; b=aW248X5dKOxIZTLTM84RG4Fr/mCfdgCpLymQbiJwzrlNxThYKbFJxItrk0hZoo6m2dUQ5zjp+WqEu5nVnNfAypzthVAoUmvuV6ZxMjnKePqHy/n4D6btkC2aSpmVWf4p1DaLRU6LPIt9R+Lsv9o+HNTANOAVXnuI/VNhcUuu1HU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736766323; c=relaxed/simple;
	bh=CpI/1txKHm3TO/ncg+7RPRJVQWMO6He+kueGYQ1a5fw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=AcIeJZBJfdoRhgPhaPtZfMM4CAB5o29Rurq81gxd8SKfT/ioYUsOTK41kIR0LN3JPx6dltAQkAbQW6ouPDeDjFi0YbivKWpPR9qktn+JKKcLWo04NeXN1bdk3RvG4P18EqK5aFVVksThjyA+M1nweGNSVAnSvt16DL8cqHfinrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZdgeOiNb; arc=fail smtp.client-ip=40.107.105.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZdgeOiNb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IUZu+u343OR2Cx+GTEybYfIKPgScjTsBUryd1IUac+3bgzaL8PWleXzBSJMABGpmP1hPdo2+BH8ZafCmx7nJ+c6eO1pPFzrOjseOVRjWqQefhcgelTrve62D+NhLKc+sFYmN6uLoZXkHUME7XLVZzJs2uaUFQPlROgetjATo1xI5178lOwwvlBatYM7zsgCSc6IxSHCdF9sh2e4eBVM+mm0smMrktgUGUxT78Ay4kn8Plaja3lEJlydETPysvK8/3ZKW6R+2a1E9YT4NQxsMX4NAVd+ooQpSoDGMhmkTCNNr0xgzeYEcOtV1f062LuB/xFNO6MsWSsZAjvzMlZYTgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ht+P97KVnXAHbipYTvkjCYpUHAJdkHOyO78TPbeNm1Y=;
 b=Ekj8QPT1WwFiWIZLDP3ZaKpJZJq8CmwIUYw7g8noZOuvmhMLqz8OnZlQBiZGk+djR2xQmkNRK1rXmiqIcW/TuSV6vpj9txrkRDWpFXr4OG+7hsSTniOQuqt+0JZUzbJheSJk+96hl5/lA4v2gKvmcTYNmPJCCqFv5/9Ut9fh0GOw9ir6e5qfb+0WpPbFZbSAxD3KYm/bCxR9lOKv0b3uwOrsKsjLsx0eqT7UOkC5c0tskOIJHaqK8QYTZdAQke16pZXFo69hgWnmrGnRN0MePGl/+r78iCFe/wVHxW8EJm+vK49q4ALvISbTiiuSaQxT3yKDUxx9ISA2PRwOC84c4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ht+P97KVnXAHbipYTvkjCYpUHAJdkHOyO78TPbeNm1Y=;
 b=ZdgeOiNbC3aPr0PACzM7U9cWn/ROU/hCqSsggMnTP3TebSqWDT21qc3mKSQEENgdQUhlvcB1+AIeLOxdDBK+LcoQ7i7VaFPBX83vyqWX4hZKPvR0M6mVlBJ0D/FtGgc3ggXFrisGFIumRXkf8weNfZlMXLJbdggCBEn+Po49xXKyNHCrY6+ntooPUiKqyCMqzddtVzmYf5MP6JbRKsU67ozDsYFakk/0G3tq0bXwwKmXGmAa+XCPSQ5zekfsB5nHb8UBnz0AVgiR1aLhBVWY5XWVb92k11rbBLIFZd4UAcTqAf1tSNY2GZ28GNvQq+9PYmggnNBmMS/4rLqtk8fczQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AM8PR04MB7425.eurprd04.prod.outlook.com (2603:10a6:20b:1d6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Mon, 13 Jan
 2025 11:05:16 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%5]) with mapi id 15.20.8335.017; Mon, 13 Jan 2025
 11:05:16 +0000
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
Subject: [PATCH v5 0/3] add I2C DTS support for S32G2/S32G3 SoCs
Date: Mon, 13 Jan 2025 13:05:09 +0200
Message-ID: <20250113110512.506007-1-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR07CA0036.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::49) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|AM8PR04MB7425:EE_
X-MS-Office365-Filtering-Correlation-Id: f1b284c6-0911-4473-b87f-08dd33c228fd
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K1dQUnRITXJIankwNWtLSjF6enR4cjlpUW40WGhsZUJUQ0czdVB0VTUrS09w?=
 =?utf-8?B?NStBWGpFTFhhNXU3R1RjZSsxcXJrakNxNDRIZzVMTWdEYThvQVFtRHRFVDk5?=
 =?utf-8?B?dllOMkI0WXlrdjFVTy93N2VMRFhHNXRhQWpoeGw1UDBBSzhnczJsQWNsV09N?=
 =?utf-8?B?NEhuZ0ZEdUxlNUFGV0pCZkRvNmVOZmVvemtINjVTYWFxMzFyd3hpczFIM2s2?=
 =?utf-8?B?ZkZ0WWE2enNTNnZXWjRYYms0TnNsSGp6dWFlb3J2Z1pkK1IyU2UxODNRa3Fk?=
 =?utf-8?B?U3VMVjJzTktJMUdkenFRdjFTSmluaHB2emFkelhkd00xdlJSRnY1TkNkM2R4?=
 =?utf-8?B?OExmVm1nRjRZWXkremRmY1hqSm8xbzhsL3I3aFYvRGpsckU1ZWJVamp6VFM4?=
 =?utf-8?B?SVh4NWpMdko4Q3RHTGIxS3M4VG10OVphRkhWRm8zakZ4SFpiQVEySWRNZmZp?=
 =?utf-8?B?bTdYUnAwUGNVZ29kMmwxSnVFcXVjK0dYb0tyTU5la2Y0Y25kMExIdjV6OHlw?=
 =?utf-8?B?OThXOUl2UUN6amNmLzUvMDNSalJhUmxjc0ROZjRxa3A4WVh0enhNT0d4SHFh?=
 =?utf-8?B?cXZBQlRMN3lNM3lZNWFpV0Y2L0xlQ2l4ek41OGpJNGNWc1VEc0JvV0xQVWx0?=
 =?utf-8?B?RGk2U0MvelVmSkVRdUFPc2pkWENLSjVHNG1mby9iQTZwdVh4bDA3MkdwajRM?=
 =?utf-8?B?Y1RjVExKaVltYmI4ODRJTGVEcXF0TWlYN3k2OU9hNDg4bGF2MDgycmdNcDVU?=
 =?utf-8?B?TXp6OTVkRXV1TEtDL2tHK291RlUxckxvWW4zN2U1NDZEQkF3YUgwMmRnYWhK?=
 =?utf-8?B?K2VzTkV2d2tOVGdqZ0Q1L1BJMHJiYUdUQnpJM1RmR1Q0bjZySjVDZlpDbXN2?=
 =?utf-8?B?cGlmcFhGNkMxK08yM1h4eGh2bDBRMGs5WlhuS1NRWUZ5azBldHdnOXV4d2hX?=
 =?utf-8?B?d1dkL2tFb1dTRG9OTlJFSGVYVmZxbWZNQ29XSnNnOUxDdTJ6RjE5eU1NMk8w?=
 =?utf-8?B?c3JDNjBhZCtqM1VIQ0twVGJ3VzRiT2ljZWd2U0RjYkhuaktpanc0OHRZTFNx?=
 =?utf-8?B?K2RyVk9UQ21aT1R0blJkUUpwcURWN05Ya0hXRkRqQ25FOXJWUmQwbm9GZll1?=
 =?utf-8?B?U0lNOWVIQTI4SGlRdXhuc2ZZQXpDVnhydHRyYVRrVFlvaTg4YjFxdVlYUGh4?=
 =?utf-8?B?N3hPanVvV29iclo3K3FQRFpweDVWOENJWWQybml6cjdFc2JHL3NpYUhMb3ZG?=
 =?utf-8?B?NXlGMHB1eEErNkZsbWZJZzh5UjVqYTFJUEpiSFBlK0xsQ2YzYk1Pd0J4bTg2?=
 =?utf-8?B?WVN4bDhmR0NlOVFReXV1amRVd1MzdTdsWnFuTzZxdFJxdW83VXprTXhsVFRy?=
 =?utf-8?B?RmgvV2ppTWtkZkwwUmFYbVNwaFhXU2Q5Zis5WG1aV1pEQ1Z5NnBaV1RKNVhZ?=
 =?utf-8?B?cVZrQ1JhaVY0V25DWmdLQXU1aEJJQ0YvZkdIK1Zha3o0YitUZkJPM1k4Rzh3?=
 =?utf-8?B?cWR0aDlOdVBZTkFISExOWHJvNkFvdTJ0NWV2WmhGcXo5clZYSEZaMGNYVmt1?=
 =?utf-8?B?WERaakhGOEh6Q1dyMmVlTTFPM0dTc1dYQmZpcEJnQzdNMTdoSW9FRmptTzR1?=
 =?utf-8?B?YUdDMm43cys2WEpYM2QwT1IraG9VZVEyaUdpWHFCdDlSd1RzeEVRbTBKNXpI?=
 =?utf-8?B?dnlzR0pWSGRKdjhRNm1TcmU5T3IzbzdkbENrVmFpUW1pZjh1YkpnajRiRGFB?=
 =?utf-8?B?ckJwWWV1YU4rcWlFNmhXeXE5cGdSenZGYzVPQ3ZWTUpQUGdPdmxIbGFFUHYy?=
 =?utf-8?B?R1RnZDV4OGFkdmJtZzl5M2ZZV2ZYejZEaVF6eVFjdUVmc0M2VDR5TndUWHJy?=
 =?utf-8?Q?rVymqPngSVOsy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlBYNDJlWHR0WGtpUEZVbVdQSHhlU0FsdU1CYWFWRWMxWGs5ZFlmNDRXcmVl?=
 =?utf-8?B?bmRKN0hpNGNIRDlkU1VRdnM4Ym9yUG1qVUM5ZTRLai9aNk1zWXhmZGNjSVRp?=
 =?utf-8?B?SlRrRWVKZVppTHhyL0xGRGFKM3g1cmRGUS9TL2lnRGRMVzNNM2R1UW04NUhw?=
 =?utf-8?B?YkZ4ckxRRDNvRUtvcnozdVFMeHZDWmQzazdBVmt4QnhrMFZTVUNqL2VrUll0?=
 =?utf-8?B?UEJwOWpBRGtxZ3o4NGpnam4vbjNoUE91Q2tIczYyZWh5RVBjbURlTWxqUFla?=
 =?utf-8?B?bm5FMW9uSjFCZEpwT1RHdEEwTHpFd09jTFZlTDd4dEthMG44b0xRTmorR05t?=
 =?utf-8?B?VEZjaGZwZFp3VXZlMVlVelBuMkVIMWZNSFkvZWFFRWZrd3ROK09rVTBTdVdZ?=
 =?utf-8?B?QlhpMDVkUE9KMWE3aEx5ZEpBYXlzRFdEVy90WHRaenlCV3dkU1FiaXlMdzFj?=
 =?utf-8?B?U1h3eTY4WVBXVTBBVXJoTnExbFh0bjRwT2syTXBqT3hXLzNBRHBsRElEVldk?=
 =?utf-8?B?RVd1YjV3RlJIQTFBdFlEc3hnUzdJMUYrWllyT1FnZ1QveHhVQVFDaFk0ZlZJ?=
 =?utf-8?B?TDJjRjdheVlCUWRZS3FVM01VTlRQVVZrMTIwWmE4Uy9DcDBtWmZWMitJRmhI?=
 =?utf-8?B?by95T29BM3RaRnFTck5jdGtrelVWR3dvakIwYkpabWthZTJOMkJsenRFR1Jh?=
 =?utf-8?B?Y01EaEl3cmNWc1Q1ZzZYMm40ZEovRFNtMXMrNWNIRitNUnUvNERIbjV0cW5C?=
 =?utf-8?B?R1hoMFJlY1BoQlcwS2NZNzJIZk5WWmh4MEt6bjY0d0xjSzBxeHVDNTVaZGZw?=
 =?utf-8?B?ZExqMCthV2MyeVlOZTdFbWNYekFNOTRaTFJYd2Rsa2wrcHc1VHQ5OG05cm5D?=
 =?utf-8?B?eXgwYytPVzhsaytLVzhMT2JVMXZQUXp4M2x3OFNWa2wyY3RyRDI5aVlPcDBO?=
 =?utf-8?B?Z3R3NXpFT0RYQjVTaTZvbmtsdGRkc0VZZ21IRVNZdTFiN2l6MFprMTE2R3NJ?=
 =?utf-8?B?OE1FbGl1bG1PMTBaWXRvKzhmYlBiOUxEVzQ5MkpyWU12NldMZnRzMzkwUXZT?=
 =?utf-8?B?elJrUU80NkRTQm8xVjMzSUF4bWtNVnRGT2xzaU1RMHpSSldiaE1DQ2FiV3ZE?=
 =?utf-8?B?OGtOOU1tKzBFcUVPcHpCOENIeHVGRDFwLytuVHFTMldZR05xL2dIb3ptSTha?=
 =?utf-8?B?UWtyNFpReVRYekFPUDQvZThKZEwwdzVTcGlWT1NSZVczbm03Y1IwTmRWUmJl?=
 =?utf-8?B?dnk5d3o1UjRnWkJodEVwM1hpVC9RZXBnL3hRSDBObXdHOU5Qb3R2Qi9pNTk5?=
 =?utf-8?B?L2l3djN3U0xiMzZ5QWh1TW4yVlBFRUN5eEdXRWNxRG1vMXdvMzN3N1Z0YXRT?=
 =?utf-8?B?WWxJcUE1VVIvNnMwNmtpcjhaSG5ocU8reXdFQ2ROL2t2RUlKNDNsWU9peVVL?=
 =?utf-8?B?MUdPaFpHaFlMdmc0OGNlcVg0SXBpeWxIUHlINGpxMGdYOHdIaXFhODJld2JB?=
 =?utf-8?B?QW1kdk1KUW9yY09IOHNFTHFlQnU1VnFkaGZBSy9wYW05cTAwaHZmL0dodVVo?=
 =?utf-8?B?aWtoWnBmSnkxSTdxYytHT3c3cFRmdG5lK3BtbHBTS20vcXJ4Nm8yQUZBSFhp?=
 =?utf-8?B?andab21FWGp4ZDEyVHlYSXQyaEIybUkyT1RPMXZSdlBHZXdDVGw2M2h2czcx?=
 =?utf-8?B?T1ZZRlo2aHdXL1k3NW5ydXRPa0dSOHkxay9HSytHalpPWjEwTE5mZnVCa0Yw?=
 =?utf-8?B?QmNRUHFjK2g2WnBleUJBSXlJRVFOdjBmbmdaYWwwc3U0SEJvZ0w3clF3YjlY?=
 =?utf-8?B?SThSd1pneU5SbS8xL0F5TEtQUWVIcnFLcnN5bnhIR1U5R29jTmx2SnJ0V243?=
 =?utf-8?B?OXJ1UmlLOFZWTWYrczZzK1hZQzNRbVIrQ2tYYjlNeEF1SE9od01wMkNNVWhO?=
 =?utf-8?B?RUkvdWNrdW5PZzU2M3dVWDZ6OGtQWFVrM3plT050dFF5OFNEZWtxOVhrVlo4?=
 =?utf-8?B?L0JhM2dqMGVTSHNPV2xTcXhUMHVzdmdHME15UTFNbXRCVDlZNjVOYW0yUkZ1?=
 =?utf-8?B?RWtvL1h3MkVEYWsxL094eTZ1akhsT1ZSQnhhUmppbzNsZzNCVjV6Tmp5QVNz?=
 =?utf-8?B?SlVnaG1iWDQ0MnhKSjNEMFg2YVBueXJvWHZxTTEva2wzR0dYWm1Obmc2Sjdy?=
 =?utf-8?B?Wnc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1b284c6-0911-4473-b87f-08dd33c228fd
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2025 11:05:16.3257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HiFW1cnkAWYvZeDyETe3TCyFBvt6aQd35l8nCGBe42RimXZLwM2Ci0lZUAyWDuGBK6S9oMq+JMqKlp5vmY8pJ0ipsxnbpsRgA90BY677awM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7425

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

This patchset aims to add two changes to the S32G2/S32G3 dtsi support:
- Adding I2C dts support for S32G SoC based boards
- Centralize the common part of 'S32G-EVB' and 'S32G-RDB' board revisions
into dtsi files. This refactor will serve I2C in this patchset, but in the
future it will also be used for other modules such as : FlexCAN and DSPI.

Changes in V5:
- Updated several commit titles and descriptions.
- Moved 'reg' dtsi node entry after 'compatible'.
- Squashed commit 3/4.
- Changed 'ina231' dtsi node name to 'current-sensor'.

Changes in V4:
- Moved I2C nodes '#address-size' and '#address-cells' entries from board
common level to S32G2/S32G3 SoC level.

Changes in V3:
- Separated patchset into multiple stages: common 'I2C' dts entries, board
'I2C' dts entries and the introduction of common 'S32GXXXA-EVB/RDB' dtsi.
- Added missing changelog for V2 of this patchset

Changes in V2:
- Moved I2C end device '#address-size' and '#address-cells' entries from
board dts to common 's32gxxxa-evb/rdb' common dtsi.

Ciprian Marian Costea (3):
  arm64: dts: s32g: add I2C[0..2] support for s32g2 and s32g3
  arm64: dts: s32g: add common 'S32G-EVB' and 'S32G-RDB' board support
  arm64: dts: s32g399a-rdb3: Add INA231 sensor entry over I2C4

 arch/arm64/boot/dts/freescale/s32g2.dtsi      |  55 +++++++
 .../arm64/boot/dts/freescale/s32g274a-evb.dts |   1 +
 .../boot/dts/freescale/s32g274a-rdb2.dts      |   1 +
 arch/arm64/boot/dts/freescale/s32g3.dtsi      |  60 +++++++
 .../boot/dts/freescale/s32g399a-rdb3.dts      |   9 ++
 .../boot/dts/freescale/s32gxxxa-evb.dtsi      | 150 ++++++++++++++++++
 .../boot/dts/freescale/s32gxxxa-rdb.dtsi      | 122 ++++++++++++++
 7 files changed, 398 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi

-- 
2.45.2

