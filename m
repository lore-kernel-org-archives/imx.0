Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023117.outbound.protection.outlook.com [40.107.162.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56823313558
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 16:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.117
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769617317; cv=fail; b=cWhcKAKt75BOvSPmbQMLL66kNdDdARzqXZ/XTsNs5ud28Juu8db18eZ4nrvrqCzIBujfkqCwPC54hIetBLvnn9sUNGLPvwEbLOsyAFmHuMeStmX2C0Z+97uzb49hXmcUsA4x0xGfrksy8YP4llez+5E9qSv+OCUyl1Te7OhcNLs=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769617317; c=relaxed/simple;
	bh=+QWU9CZNXdWX9lDjgwLuBMg151APCuqKG6Z0SR1vqGg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=TdpJaOg1IQ0RZ7+X4BVtgM055xfgEbLIrko3IU9J9vIP2q/6zQ8kEhBA1lB2Z99ZwFNLT9X+o4t3xAeryOFaet2KbE1prHEIG6ignBzg3Kbnc3JRFTCOHJvuITwN+t7x1m6vOLahaIgrUn+bo2ur+nFwI7f8Iu1t2mR3XB7ptFI=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=FTA5cF56; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=FTA5cF56; arc=fail smtp.client-ip=40.107.162.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="FTA5cF56";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="FTA5cF56"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hI3DpCleaHz2gHCuZ6/0YhC3gykvhhm+wKHAsmAl0GXyRK+IhIZSY1mv62q52EaB53BHpfV5kH3plXiWDvztyuWc7Y4FRegwkLyq9JE6c20WCQoFj3r9c0ITZvxoFlZ249hyhRex5V4Udfp0jyeVcB1IQXch8WybD9Gw6WvdugZTBTsh5AKPCg88arp1erOy7zVrhGmg/w6FpTS50GU828LXzdm+1t6sQGkNYPcmR3MzhxVMDNACSN1TQUwk4jg+ykb5I3Xa15vC00yqhDekLCH5CkNIpkaGQSv4cuWXi1/4q13QFSJy4xRh9rshlJ1FEtFBuMV5frXQWBmVFgyBTQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eMcvEsmN7X39WczDiKcCnJTygZql43vVSsmLdvIPxic=;
 b=awvemFh8PwclBOD41dPmc/Q/qC5Zi2hELatLLj55OlouykDKSW3qNmOmkJzXVw1a1MEnyKRtqc9EytKaxKbKGF54SQNIE465/Wc33/O4Pl43yF52qQmHQu5MiKlWunMxdKSL6phs8WCoeyCPNgaXCM+7cqKSlsqXkQWTkp4/uOouJImFc+n/8Y1z7OnLi4csqsB/HdmF6nguHPRFuDvi0eZcHQRjOp3AuxqEPsQluMdfznU/qQi42LCBi9qaBgUMscHHxAILezzrE+WlRmWWz6lApGDaFI9Yq0yY+sYkucWBlnnjRFLzYwxhvgra11KmXYCuriF7eqtNyA1TxpQNSA==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eMcvEsmN7X39WczDiKcCnJTygZql43vVSsmLdvIPxic=;
 b=FTA5cF56mrUyvUZgDMfQl1aSB7hnjSbg2JSsAbv+TBnMgcU6RPasyED1a3hnNTdXSi2p57kz0Nu5J5D7XVdMkWazTNICKAlgW2YlftNj8rPcBClOEVSePvRZzwdsWoIU4Fv/Vaz8Qjifsr5nGSQ+XsNYYUEokj8b3f2h7JaTUKg=
Received: from DB8PR06CA0051.eurprd06.prod.outlook.com (2603:10a6:10:120::25)
 by DB9PR04MB8364.eurprd04.prod.outlook.com (2603:10a6:10:24c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Wed, 28 Jan
 2026 16:21:50 +0000
Received: from DU6PEPF0000B621.eurprd02.prod.outlook.com
 (2603:10a6:10:120:cafe::2f) by DB8PR06CA0051.outlook.office365.com
 (2603:10a6:10:120::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Wed,
 28 Jan 2026 16:21:47 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU6PEPF0000B621.mail.protection.outlook.com (10.167.8.138) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3
 via Frontend Transport; Wed, 28 Jan 2026 16:21:50 +0000
Received: from emails-8219456-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-155.eu-west-1.compute.internal [10.20.5.155])
	by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 0EA0D80727;
	Wed, 28 Jan 2026 16:21:50 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1769617310; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=eMcvEsmN7X39WczDiKcCnJTygZql43vVSsmLdvIPxic=;
 b=GMi0cHOYqJkrzHPsUj9XJe4IIbFKQanB76fo0D/96cS3vjqoukqFwaFMTfAHjeIzcf6hl
 JsHsXfvQFntFft1eS3Ny7KERpvTuJZTj8Ifi1/sFZdI3N6vtBUYft/m6L8ovgyI/6Pwusg2
 zgkrs5CDmsBhHbe+dwd86OqKaupdZ4c=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1769617310;
 b=Ew/TvjxyZNVcqGBMvxN9fbCkBEaYwrymU5fqFNRHpskro0rxg6Lb4+j24zVZ+Y3Z2p7jy
 d+eA15JXlOXjOEq5nGR/BnlS9pBf0Yeffe1mCDpuP7/VnftMnnou35pPp+Nj4nqAjyktfsK
 Ii68WQha7nrTwGUoaW6yPEY0kdPgpKA=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kNlYXAu/mFRyWgPy3kireYwshv49ZH1dB9KAQBZ86hRe7jcA+Y5jjkAg9IsN8nKXy0HHKyTTLBQrqUvacw24eNp5IyACBxhjp2KsXzQOSYC/nt8dIy2qr6s5lOBmCNl5kgUv5xzsMLAq6zyjE72B3DgVR/yMJQzk2asDEDYLyfCX1vEx1+WtayDUnjKsg6SC8yC87PGIh9octTZiEnwRNnDMyojRaJyypjGslJ2bEXnW39wU1Xb8O4irNUK1ZISMrLdOMfnPhQbuOlHf7WFU+BlDrCNwCnJPiU2YrnWYkjc5e7c/EGZhB5WZsbW4rXfdceLksJMP2aOsKgTU26jzyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eMcvEsmN7X39WczDiKcCnJTygZql43vVSsmLdvIPxic=;
 b=co9TL2bAgcjNkyE1KPu9m+gJe1l8mes1bYaubUAXlm0ICDxcZfqm2jXtPHI6ugtH38CkZ1HdD+6Xc9AgQ/oYHGEAXXPL+vryrUJIygroROh9PhkBDV9YcHs2Wgf6f7bRUQjMrrK3njW40iDRMe3ZJg7Fwjr7Bf7LbBjbH3fx5McLdXJ0GEuS2R+wWXmqBv/6iedRxLabFDzF9mit5fmiRi9vm4kS/2Hh2lQEMB28Ye/pd/d4IZlgbYMlAFPzMYdDGJArKzlToVEPsz4LUYHO2r5WTGXnTRBu6U1MgQViHKI+dOzbCgXGqagr1iSrkd5f5WZMlvGWy360KKaHOmvrNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eMcvEsmN7X39WczDiKcCnJTygZql43vVSsmLdvIPxic=;
 b=FTA5cF56mrUyvUZgDMfQl1aSB7hnjSbg2JSsAbv+TBnMgcU6RPasyED1a3hnNTdXSi2p57kz0Nu5J5D7XVdMkWazTNICKAlgW2YlftNj8rPcBClOEVSePvRZzwdsWoIU4Fv/Vaz8Qjifsr5nGSQ+XsNYYUEokj8b3f2h7JaTUKg=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM9PR04MB7522.eurprd04.prod.outlook.com (2603:10a6:20b:282::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 16:21:41 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9564.007; Wed, 28 Jan 2026
 16:21:41 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Wed, 28 Jan 2026 18:21:32 +0200
Subject: [PATCH v8 8/8] arm64: dts: add description for solidrun i.mx8mm
 som and evb
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-imx8mp-hb-iiot-v8-8-9646a3025cf4@solid-run.com>
References: <20260128-imx8mp-hb-iiot-v8-0-9646a3025cf4@solid-run.com>
In-Reply-To: <20260128-imx8mp-hb-iiot-v8-0-9646a3025cf4@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Mikhail Anikin <mikhail.anikin@solid-run.com>,
 Yazan Shhady <yazan.shhady@solid-run.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: TLZP290CA0008.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::20) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|AM9PR04MB7522:EE_|DU6PEPF0000B621:EE_|DB9PR04MB8364:EE_
X-MS-Office365-Filtering-Correlation-Id: c58b32cf-ff64-44f5-b18e-08de5e895750
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?TURWbGtlZlB6OFhRR3dRTE1PZFVLOFg0bnVTNlg2Mlh3QTgwVmVMMHlyLzF0?=
 =?utf-8?B?QnQrQnFSR25ELzVlMXBPZE9yWHZLYnJ2QlhFQkdmczRtR2xqMVJLeHBUeDNH?=
 =?utf-8?B?YU9NZEs1WmtVNUJEVDQrU3pFY2MwbkdYQ1JJYlluMXllTGc0Y2FoQm5YcTc5?=
 =?utf-8?B?cU5za0JpeDI1UVpLbVhaOWZqNW14SXF1NzNJSXRiV1YxNzZTZUVLZzVCS3gr?=
 =?utf-8?B?Z1lxZkJlajNMMEYrSHFXd2xURXBqbzJrdDFwV0d1aXovZmpzaGJRYzVnd0Vo?=
 =?utf-8?B?Ky92RzcxaEZQdks5aVQyWlRleWlQei9aeGtiRk9TaERZN2ViekNCdHVoOU95?=
 =?utf-8?B?M3ZWcGdxbWlSR0dDdHAvUkIyT1NUUlJQYmtZQk9YQzdGaEpJdEtEM280L200?=
 =?utf-8?B?ai9RTUpBVFE2K1dhTVJzQ2lRZ3NZWUc4WGcvUXpWS0hNN0w0eTNSS3hJOHRa?=
 =?utf-8?B?WGhrMWNhNkxrZDVMT1Y0c1dNSmtkU1dhVUtaSWR0cE9DSmNPd2lzMWlnK0pw?=
 =?utf-8?B?bG5FbEJuYTk2SDV1N0t3bW11VzZaN3NXS2dlUi9Yd0FwcnkwOUJLa0x2ZzdH?=
 =?utf-8?B?VExXbzlVeXhDeTE1WmlwM0UyVjd4RWsySTdZM0V2bTNTY1BEeFVVTUZzdmxy?=
 =?utf-8?B?bFlUZkhOV1ZBanBIT2syQ2tBWjRRVE9FVjhoeGltbmVvMDBoRklLeFBUTEdv?=
 =?utf-8?B?c2lyRHlZZFJwVXlzcTZYVElQV29SZEpodDZQeHlaRXBLMTBMRlNreFJ3Rmw0?=
 =?utf-8?B?NzNzaDU0eW9iTjV4N01CY1F3VG1aNXUxQlp4MTZOMlBVc1piUm1zb2VnOWlT?=
 =?utf-8?B?Y3ZNS1ZGQ2hiMks3TjRWcFNURTEwRU1zZmhIMEl6NFFnZ1BLQ0UzNjRnNUhH?=
 =?utf-8?B?VE5CSUZLTGVHSy9kdGwxRmtkYzN2aGVaNitaQ05JaWMvaTZEWnhFa1Z3aGpT?=
 =?utf-8?B?bmcrYUZ6RVJ4bWpReGMybDArOEJ2S0xRRHd0RERNOEJEcEU2VWgxYXc1dFJV?=
 =?utf-8?B?RW41RFY1dncrejdSV09nWDNNM0FFUmhham51QXg5Ujc0U2NZTHJBcVROcTB4?=
 =?utf-8?B?cjRab0s5R2l4dWFIQ2ZTek1NYVd4RzZiSGEwUTVTQ1BxNFJ4c2RHdUltMktM?=
 =?utf-8?B?RndyYk9PUFhRZGFYN083VzNRMHVnRFkyb0R3TWNlMVpsa2tvRUtTb1VHREdh?=
 =?utf-8?B?TnRBeDhvMHkyMGxUZ3VBRExuTU5xenZ2ejFONGlKVHI0L2VxQUowUkUvRUYw?=
 =?utf-8?B?YnZkODBaYXZCMWRCMTdJenU4WFF5QkJuNGtQaGNDZVpFQ2NmaXZNMllwcFNY?=
 =?utf-8?B?ZExYdEYxWDhKOWVOZWY1Y0pZOGlueHVEWlAyWHlEZUxJSTVjWEJ5NTFuUUYr?=
 =?utf-8?B?SmZBSnFlQTFJV3BybGtQcFFUNEY1NTJ2Zm43K3dSY0xmM2hIV05SUXRPZU5v?=
 =?utf-8?B?a3JvRDN1VDJ2SWFZcGxtZlk3dmpQdWdSeVhGQmQrVm9jQVR6NGxYS21HMVE4?=
 =?utf-8?B?Rk16VjhnVnM4eEF5ZDBobWVkWHhadW1OUUtYM0dOZndUMVdoM0tFTS9OdWNK?=
 =?utf-8?B?V3dnRk1URWRNamFEUUVFOGkyNUlhUmpFdk9mZ0o2VXBNUzB2dk84RGpWdG5X?=
 =?utf-8?B?WTRtY3JMWDkzSTF1cXdyejZQQ2xCZ0MvdGtobmd3bzVsTE1aYVI1STRXWTMw?=
 =?utf-8?B?TzJ0QlpsWXZ1enBtNmdHdUczYTl3Wk5QK1hlWTIxYnRuUzRzK0I0Um5OdFBR?=
 =?utf-8?B?Q1UrUHNtNGt6azZ3MmNlcnNNNHhncjU1V2ZwaGQ1eGFaRmVFa00rQzFIQkJk?=
 =?utf-8?B?RkpNbWpCVStUL1RFNlpDVTdScFUrK1ZGdmNrZ2NSakkwM0JxYW5sRVlEMXBP?=
 =?utf-8?B?MGM1SlhBRzRPNjRaRmtyeE1NWk55VjN2RDRQQzI4RUppdjhvQjkvR0N6NjZj?=
 =?utf-8?B?Yld2WUJsM3hQOE1JVHFzWXgyWGpLSDdUN3JUUTVYeFlxbm91ZXpUeXIzc0pq?=
 =?utf-8?B?eXkwSmNjK1M1RkxKekJUWDliVXdScWV6Qnd0bDdNbWhPVzZSTFlNdzg1T1dz?=
 =?utf-8?B?Nzh4ZDd5RkJrV3pjelZsMmttMjhwUEJHVmhVb1Zsd0RBMmprZUp5NGJjQ0JI?=
 =?utf-8?B?dGNVa1pjTC9zVGtqSld6aEpxNkhrMnF2ZFNDRTI2Ti94TDc4Snk0QUZrNHUx?=
 =?utf-8?Q?sRr+kqDExuSw5GJgQrL4Uu0=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7522
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 7807a77349294211a956aded306fff0f:solidrun,office365_emails,sent,inline:32bee9989c3005f395d4e7f8822551d9
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9c2a6b17-28ae-4388-a06d-08de5e8951c3
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|36860700013|7416014|376014|82310400026|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MHNVT3RxZnJTVEROOVBwMnFZOVpieWRkMVRidWJsbTc5c2N6N0R3YXUvUm5y?=
 =?utf-8?B?bVVSK2h1WnpUVHZWa2xCTXFkcVhkZ0ZPeDVxWVc1QlJvQmxLTXIwTUJOQkI2?=
 =?utf-8?B?SWF3Y0RxbVlFV245Y2J6V3MxRnd2ZkxnN3lLTzgyN0pPcUFLb1ZrSTdXb0Iz?=
 =?utf-8?B?MEZHbVlLSmY4UlZvK2lHTmMxUUE5eno2elBOWEtiTjROQTBzaGttR0xBdU16?=
 =?utf-8?B?Mkc5eGN1TmZDZEhIaTlBaXdiSU56MGk5eUJzUU1EZEprNVZoeERGQ1kyTE8z?=
 =?utf-8?B?eWNnRngyVHAxaVdGNTdpdkRIamY1Vy9WUHpzaGJiLzB6NEZ1UHZnTFJta3NR?=
 =?utf-8?B?VEdSNVlodEhKajBVNkRvUHI2dVpHZEZpV3BmRjB4L0xiTjBGZFJxN0lnOStJ?=
 =?utf-8?B?eTI3ajdjZmdMZGoxYzB5SzNiMzlLQWNuZnR3WGZtZUhaZWNTS0trYnVvMWpC?=
 =?utf-8?B?Si9mK1ZmNDZ0VWtOM1VnRHV5M2lsNnNxdEdSdkxGNXFET1M5d0VmYUVaWGVD?=
 =?utf-8?B?eU9NSjVwaVovWHkwMzFhcHdGeHNoRE0rRUFLb3NyTVF5ajN1V2t5UUtTN2xK?=
 =?utf-8?B?eCtjVlpKZytSYlA4dHNMcW9XUGFLdEcybXJTWHJQOWU5WFA4cjFXZWxCS1A0?=
 =?utf-8?B?QkJhOWc1cVdZVTNlSEdTN0lBRlNudm9SWGFGVm5XMEhmb2Y1aTRwVVBmUi9E?=
 =?utf-8?B?L1l3V2NDVHpIcE5CNXFTdkMrQWR4SFNwNU5aSGdYOGxTaGtvMWo1dnBqMTVr?=
 =?utf-8?B?Y1N0Tml2bkpsNTZiKzNEeExDN0JqWXlwK0pGUU5qZnhHakFVRGhod2tYT1Fv?=
 =?utf-8?B?bGZPVW9waENvbjZHV2xqVzF2VEw4RlpJc3RnTzQ2NWtsaVcyaVZkQUg3ZzdG?=
 =?utf-8?B?Y2xheVdHTXN6SGVRUG1zc1BQblZJWVFQU2t0SmJTUkpjMGl6MC9vcmVmT0Zv?=
 =?utf-8?B?VHJlRFk5Vzhmc0s2KzB3c3VqU3QwVTBqenBCRkZ0KytuYVBxSCtkU0hpamVS?=
 =?utf-8?B?c1BVRE5xWFJ2eW11V2Rxam9acml1S00yQmQ2MGV6amVGZkgwczBvUTNQZjl1?=
 =?utf-8?B?NmZ5RGRHN1hXbHUzTklRZllQY3ZjaCs1RkJLa3EzWmM4b2JHQXZCNms4bWNh?=
 =?utf-8?B?L0ZubWhybndsTGdpemNPK2dxWE5oMDNybG8yTnRvK0t2aTk5dUFvT0FaQjQ3?=
 =?utf-8?B?SHBFK1ExcythODV0U3hvQitad2NmT1VJaHJ6UHdYS3VrTk9GVmJoMzdDc3c0?=
 =?utf-8?B?NSsxTUdqL204cXF5bEpKSUo0SitnT1VrSzdKcHdYMlFwQXpLeVI4Q0JHcGVC?=
 =?utf-8?B?Qk1FU3JocW9kN2NPQVRVajUxb1VxYXZlSVdTcDZQWlZPZzE1VGlIaWhTb0lp?=
 =?utf-8?B?MERHZHZCa0plUDEwYzFoS3NTTzVRai90YWk0REFQRE9vN2M4VktQRVFBNDNN?=
 =?utf-8?B?VDVKRUVacFhXNFpKQTZKZWhlbHFES1M5ejBXamtjY1R0aHJXbm9ZQUliK3dO?=
 =?utf-8?B?Mk1RZjlwTGdjNm5IRmNNZlpmaFR1eGVqOEpTOWNSSkJiWUxpeTFWSE8xNjZW?=
 =?utf-8?B?YXJiUHYzcENlQVFBZ0xFT0dUUlA1RU85ZE9lK1NFTFA1aEhaNngyR2JGUkUw?=
 =?utf-8?B?NzE3a1Urb0JKYkZRTko0TnlPWllVQS9wYm1FUEZXdm96VmorQXVJbThkbk9r?=
 =?utf-8?B?Tk9va2kzNklUck5PVC9HeGJsOG40ZGhVNmFMd2Zhank5ZmtXRXc3Ri9VbFNV?=
 =?utf-8?B?Rnp0SGVFWW1yVnBJWW1neGVqKzg4YkpHTndTRTFOeFlQZG5LVzBsaDNjVmdZ?=
 =?utf-8?B?SE1TVVRrcU56RGxlSkN2SGY2a1RCeUFWSTVERkFCTEdIT2l6R3NyWThmUjFF?=
 =?utf-8?B?YWFOZVRsN1pyS0VIeUFEKzZLcFkzUkJNM1g1MmlLQm1qN3BCdUErTXJXcWVs?=
 =?utf-8?B?eXNTSDJJM3VnSjdleWdHS1l0Y2g2S1JjL1hyWlJiOStnMkEyS3NmRWlONUxM?=
 =?utf-8?B?cGpIaUNHY0U3cTgzVzVBeDJmLzhtUm1BNjloUm1BTXk5SWZBd2dTTVUrNDlk?=
 =?utf-8?B?SnlXTXNPK2hFWDdGYlRDL2FVSjdOTk9BR21VQWZPMCthKytMOHBmVmlzMGlS?=
 =?utf-8?B?YXJ6SXlNaGxBVGFvbDZybFA4b0pVMGJFV2g3UnFDdjF3VVBzemgvU2lkRmxG?=
 =?utf-8?B?SEhDWnI1R2ZPRitaYnI5dkpkRHRvd3VmNTJaZlFLZy9TVVBETDN1cGxnNnBF?=
 =?utf-8?B?cWZKL0E3cklLOWFzUXlqaW9tdXVnPT0=?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(36860700013)(7416014)(376014)(82310400026)(14060799003);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 16:21:50.1207
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c58b32cf-ff64-44f5-b18e-08de5e895750
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B621.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8364

Add description for the SolidRun i.MX8M Mini SoM on HummingBoard Ripple.

The SoM features:
- 1Gbps Ethernet with PHY
- eMMC
- 1/2GB DDR
- NPU (assembly option)
- WiFi + Bluetooth

The HummingBoard Ripple features:
- 2x USB-2.0 Type-A connector
- 1Gbps RJ45 Ethernet with PoE
- microSD connector
- microHDMI connector
- mpcie connector with USB-2.0 interface + SIM card holder
- microUSB connector for console (using fdtdi chip)
- RTC with backup battery

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/Makefile             |   2 +
 .../dts/freescale/imx8mm-hummingboard-ripple.dts   | 335 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi   | 393 +++++++++++++++++++++
 3 files changed, 730 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index e33bbfd9bb42..7b49f3ff6135 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -124,6 +124,8 @@ imx8mm-evk-pcie-ep-dtbs += imx8mm-evk.dtb imx-pcie0-ep.dtbo
 imx8mm-evkb-pcie-ep-dtbs += imx8mm-evkb.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-evk-pcie-ep.dtb imx8mm-evkb-pcie-ep.dtb
 
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-hummingboard-ripple.dtb
+DTC_FLAGS_imx8mm-hummingboard-ripple += -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-icore-mx8mm-ctouch2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-icore-mx8mm-edimm2.2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-iot-gateway.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-hummingboard-ripple.dts b/arch/arm64/boot/dts/freescale/imx8mm-hummingboard-ripple.dts
new file mode 100644
index 000000000000..71746d3c106c
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-hummingboard-ripple.dts
@@ -0,0 +1,335 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+
+#include "imx8mm-sr-som.dtsi"
+
+/ {
+	model = "SolidRun i.MX8MM HummingBoard Ripple";
+	compatible = "solidrun,imx8mm-hummingboard-ripple",
+		     "solidrun,imx8mm-sr-som", "fsl,imx8mm";
+
+	aliases {
+		rtc0 = &carrier_rtc;
+		rtc1 = &snvs_rtc;
+	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "c";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&adv7535_out>;
+			};
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_pins>;
+
+		led-0 {
+			label = "D30";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio5 29 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		led-1 {
+			label = "D31";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio5 9 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		led-2 {
+			label = "D32";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio5 8 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		led-3 {
+			label = "D33";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio5 7 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		led-4 {
+			label = "D34";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpio5 6 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+	};
+
+	v_1_2: regulator-1-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+	};
+
+	vmmc: regulator-mmc {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&vmmc_pins>;
+		regulator-name = "vmmc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio2 19 GPIO_ACTIVE_LOW>;
+		startup-delay-us = <250>;
+	};
+
+	vbus1: regulator-vbus-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus1";
+		gpio = <&gpio2 11 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vbus1_pins>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	vbus2: regulator-vbus-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vbus2";
+		gpio = <&gpio4 21 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vbus2_pins>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	rfkill-mpcie-wifi {
+		compatible = "rfkill-gpio";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pcie_rfkill_pins>;
+		label = "mpcie WiFi";
+		radio-type = "wlan";
+		/* rfkill-gpio inverts internally */
+		shutdown-gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&i2c3 {
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c3_pins>;
+	status = "okay";
+
+	hdmi@3d {
+		compatible = "adi,adv7535";
+		reg = <0x3d>, <0x3f>, <0x3c>, <0x38>;
+		reg-names = "main", "edid", "cec", "packet";
+		adi,dsi-lanes = <4>;
+		avdd-supply = <&v_1_8>;
+		dvdd-supply = <&v_1_8>;
+		pvdd-supply = <&v_1_8>;
+		a2vdd-supply = <&v_1_8>;
+		v3p3-supply = <&v_3_3>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&hdmi_pins>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <7 IRQ_TYPE_EDGE_FALLING>;
+		pd-gpios = <&gpio3 22 GPIO_ACTIVE_LOW>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				adv7535_from_dsim: endpoint {
+					remote-endpoint = <&mipi_dsi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				adv7535_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+
+	carrier_eeprom: eeprom@57{
+		compatible = "st,24c02", "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+
+	carrier_rtc: rtc@69 {
+		compatible = "abracon,ab1805";
+		reg = <0x69>;
+		abracon,tc-diode = "schottky";
+		abracon,tc-resistor = <3>;
+	};
+};
+
+&iomuxc {
+	hdmi_pins: pinctrl-hdmi-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO07_GPIO1_IO7	0x0
+			MX8MM_IOMUXC_SAI5_RXD1_GPIO3_IO22	0x0
+		>;
+	};
+
+	i2c3_pins: pinctrl-i2c3-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C3_SCL_I2C3_SCL		0x400001c3
+			MX8MM_IOMUXC_I2C3_SDA_I2C3_SDA		0x400001c3
+		>;
+	};
+
+	led_pins: pinctrl-led-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART4_TXD_GPIO5_IO29	0x0
+			MX8MM_IOMUXC_ECSPI1_SS0_GPIO5_IO9	0x0
+			MX8MM_IOMUXC_ECSPI1_MISO_GPIO5_IO8	0x0
+			MX8MM_IOMUXC_ECSPI1_MOSI_GPIO5_IO7	0x0
+			MX8MM_IOMUXC_ECSPI1_SCLK_GPIO5_IO6	0x0
+		>;
+	};
+
+	pcie_rfkill_pins: pinctrl-pcie-rfkill-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_WP_GPIO2_IO20		0x0
+		>;
+	};
+
+	usb_hub_pins: pinctrl-usb-hub-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI3_RXD_GPIO4_IO30	0x0
+		>;
+	};
+
+	usdhc2_pins: pinctrl-usdhc2-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x190
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d0
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d0
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d0
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d0
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d0
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
+			MX8MM_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
+		>;
+	};
+
+	usdhc2_100mhz_pins: pinctrl-usdhc2-100mhz-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x194
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d4
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d4
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d4
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d4
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d4
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
+			MX8MM_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
+		>;
+	};
+
+	usdhc2_200mhz_pins: pinctrl-usdhc2-100mhz-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_CLK_USDHC2_CLK		0x196
+			MX8MM_IOMUXC_SD2_CMD_USDHC2_CMD		0x1d6
+			MX8MM_IOMUXC_SD2_DATA0_USDHC2_DATA0	0x1d6
+			MX8MM_IOMUXC_SD2_DATA1_USDHC2_DATA1	0x1d6
+			MX8MM_IOMUXC_SD2_DATA2_USDHC2_DATA2	0x1d6
+			MX8MM_IOMUXC_SD2_DATA3_USDHC2_DATA3	0x1d6
+			MX8MM_IOMUXC_GPIO1_IO04_USDHC2_VSELECT	0x140
+			MX8MM_IOMUXC_SD2_CD_B_USDHC2_CD_B	0x0
+		>;
+	};
+
+	vbus1_pins: pinctrl-vbus-1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD1_STROBE_GPIO2_IO11	0x20
+		>;
+	};
+
+	vbus2_pins: pinctrl-vbus-2-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI2_RXFS_GPIO4_IO21	0x20
+		>;
+	};
+
+	vmmc_pins: pinctrl-vmmc-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD2_RESET_B_GPIO2_IO19	0x41
+		>;
+	};
+};
+
+&lcdif {
+	status = "okay";
+};
+
+&mipi_dsi {
+	samsung,esc-clock-frequency = <10000000>;
+	status = "okay";
+};
+
+&mipi_dsi_out {
+	remote-endpoint = <&adv7535_from_dsim>;
+};
+
+&usbotg1 {
+	dr_mode = "host";
+	vbus-supply = <&vbus2>;
+	status = "okay";
+};
+
+&usbotg2 {
+	status = "okay";
+	dr_mode = "host";
+	vbus-supply = <&vbus1>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb_hub_pins>;
+
+	hub_2_0: hub@1 {
+		compatible = "usb4b4,6502", "usb4b4,6506";
+		reg = <1>;
+		peer-hub = <&hub_3_0>;
+		reset-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&v_1_2>;
+		vdd2-supply = <&v_3_3>;
+	};
+
+	/* this device is not visible because host supports 2.0 only */
+	hub_3_0: hub@2 {
+		compatible = "usb4b4,6500", "usb4b4,6504";
+		reg = <2>;
+		peer-hub = <&hub_2_0>;
+		reset-gpios = <&gpio4 30 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&v_1_2>;
+		vdd2-supply = <&v_3_3>;
+	};
+};
+
+&usdhc2 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&usdhc2_pins>;
+	pinctrl-1 = <&usdhc2_100mhz_pins>;
+	pinctrl-2 = <&usdhc2_200mhz_pins>;
+	vmmc-supply = <&vmmc>;
+	bus-width = <4>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi
new file mode 100644
index 000000000000..7c8a840686a3
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-sr-som.dtsi
@@ -0,0 +1,393 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 Josua Mayer <josua@solid-run.com>
+ */
+
+#include <dt-bindings/phy/phy-imx8-pcie.h>
+
+#include "imx8mm.dtsi"
+
+/ {
+	model = "SolidRun i.MX8MM SoM";
+	compatible = "solidrun,imx8mm-sr-som", "fsl,imx8mm";
+
+	chosen {
+		bootargs = "earlycon=ec_imx6q,0x30890000,115200";
+		stdout-path = &uart2;
+	};
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x0 0x40000000 0 0x80000000>;
+	};
+
+	usdhc1_pwrseq: usdhc1-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
+	};
+
+	v_1_8: regulator-1-8 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	v_3_3: regulator-3-3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+};
+
+&fec1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&fec1_pins>;
+	phy-mode = "rgmii-id";
+	phy = <&phy0>;
+	status = "okay";
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		phy0: ethernet-phy@4 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0x4>;
+			reset-gpios = <&gpio4 22 GPIO_ACTIVE_LOW>;
+			phy-reset-duration = <10>;
+			qca,smarteee-tw-us-1g = <24>;
+			vddio-supply = <&vddio>;
+
+			vddio: vddio-regulator {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+		};
+	};
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+	status = "okay";
+
+	pmic@4b {
+		compatible = "rohm,bd71847";
+		reg = <0x4b>;
+		pinctrl-0 = <&pmic_pins>;
+		pinctrl-names = "default";
+		interrupt-parent = <&gpio1>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+		rohm,reset-snvs-powered;
+		#clock-cells = <0>;
+		clocks = <&osc_32k>;
+		clock-output-names = "clk-32k-out";
+
+		regulators {
+			buck1_reg: BUCK1 {
+				regulator-name = "buck1";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <1250>;
+			};
+
+			buck2_reg: BUCK2 {
+				regulator-name = "buck2";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-boot-on;
+				regulator-always-on;
+				regulator-ramp-delay = <1250>;
+				rohm,dvs-run-voltage = <1000000>;
+				rohm,dvs-idle-voltage = <900000>;
+			};
+
+			buck3_reg: BUCK3 {
+				// BUCK5 in datasheet
+				regulator-name = "buck3";
+				regulator-min-microvolt = <700000>;
+				regulator-max-microvolt = <1350000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck4_reg: BUCK4 {
+				// BUCK6 in datasheet
+				regulator-name = "buck4";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck5_reg: BUCK5 {
+				// BUCK7 in datasheet
+				regulator-name = "buck5";
+				regulator-min-microvolt = <1605000>;
+				regulator-max-microvolt = <1995000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			buck6_reg: BUCK6 {
+				// BUCK8 in datasheet
+				regulator-name = "buck6";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <1400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo1_reg: LDO1 {
+				regulator-name = "ldo1";
+				regulator-min-microvolt = <1600000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo2_reg: LDO2 {
+				regulator-name = "ldo2";
+				regulator-min-microvolt = <800000>;
+				regulator-max-microvolt = <900000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo3_reg: LDO3 {
+				regulator-name = "ldo3";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo4_reg: LDO4 {
+				regulator-name = "ldo4";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+
+			ldo6_reg: LDO6 {
+				regulator-name = "ldo6";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+
+	som_eeprom: eeprom@50{
+		compatible = "st,24c01", "atmel,24c01";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
+&iomuxc {
+	fec1_pins: pinctrl-fec1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_ENET_MDC_ENET1_MDC			0x3
+			MX8MM_IOMUXC_ENET_MDIO_ENET1_MDIO		0x3
+			MX8MM_IOMUXC_ENET_TD3_ENET1_RGMII_TD3		0x1f
+			MX8MM_IOMUXC_ENET_TD2_ENET1_RGMII_TD2		0x1f
+			MX8MM_IOMUXC_ENET_TD1_ENET1_RGMII_TD1		0x1f
+			MX8MM_IOMUXC_ENET_TD0_ENET1_RGMII_TD0		0x1f
+			MX8MM_IOMUXC_ENET_RD3_ENET1_RGMII_RD3		0x91
+			MX8MM_IOMUXC_ENET_RD2_ENET1_RGMII_RD2		0x91
+			MX8MM_IOMUXC_ENET_RD1_ENET1_RGMII_RD1		0x91
+			MX8MM_IOMUXC_ENET_RD0_ENET1_RGMII_RD0		0x91
+			MX8MM_IOMUXC_ENET_TXC_ENET1_RGMII_TXC		0x1f
+			MX8MM_IOMUXC_ENET_RXC_ENET1_RGMII_RXC		0x91
+			MX8MM_IOMUXC_ENET_RX_CTL_ENET1_RGMII_RX_CTL	0x91
+			MX8MM_IOMUXC_ENET_TX_CTL_ENET1_RGMII_TX_CTL	0x1f
+			MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22		0x19
+		>;
+	};
+
+	i2c1_pins: pinctrl-i2c1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_I2C1_SCL_I2C1_SCL			0x400001c3
+			MX8MM_IOMUXC_I2C1_SDA_I2C1_SDA			0x400001c3
+		>;
+	};
+
+	pcie_pins: pinctrl-pcie-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO15_GPIO1_IO15		0x0
+		>;
+	};
+
+	pmic_pins: pinctrl-pmic-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3		0x140
+		>;
+	};
+
+	uart1_pins: pinctrl-uart1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART1_RXD_UART1_DCE_RX	0x140
+			MX8MM_IOMUXC_UART1_TXD_UART1_DCE_TX	0x140
+			MX8MM_IOMUXC_UART3_RXD_UART1_DCE_CTS_B	0x140
+			MX8MM_IOMUXC_UART3_TXD_UART1_DCE_RTS_B	0x140
+			/* BT_REG_ON */
+			MX8MM_IOMUXC_SD1_DATA4_GPIO2_IO6	0x0
+			/* BT_WAKE_DEV */
+			MX8MM_IOMUXC_SD1_DATA5_GPIO2_IO7	0x0
+			/* BT_WAKE_HOST */
+			MX8MM_IOMUXC_SD1_DATA6_GPIO2_IO8	0x100
+		>;
+	};
+
+	uart2_pins: pinctrl-uart2-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_UART2_RXD_UART2_DCE_RX		0x140
+			MX8MM_IOMUXC_UART2_TXD_UART2_DCE_TX		0x140
+		>;
+	};
+
+	usdhc1_pins: pinctrl-usdhc1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SD1_CLK_USDHC1_CLK			0x190
+			MX8MM_IOMUXC_SD1_CMD_USDHC1_CMD			0x1d0
+			MX8MM_IOMUXC_SD1_DATA0_USDHC1_DATA0		0x1d0
+			MX8MM_IOMUXC_SD1_DATA1_USDHC1_DATA1		0x1d0
+			MX8MM_IOMUXC_SD1_DATA2_USDHC1_DATA2		0x1d0
+			MX8MM_IOMUXC_SD1_DATA3_USDHC1_DATA3		0x1d0
+			/* wifi refclk */
+			MX8MM_IOMUXC_GPIO1_IO00_ANAMIX_REF_CLK_32K	0x0
+			/* WL_REG_ON */
+			MX8MM_IOMUXC_SD1_RESET_B_GPIO2_IO10		0x0
+			/* WL_WAKE_HOST */
+			MX8MM_IOMUXC_SD1_DATA7_GPIO2_IO9		0x100
+		>;
+	};
+
+	usdhc3_pins: pinctrl-usdhc3-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x190
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d0
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d0
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d0
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d0
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d0
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d0
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d0
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d0
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d0
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x190
+		>;
+	};
+
+	usdhc3_100mhz_pins: pinctrl-usdhc3-100mhz-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x194
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d4
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d4
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d4
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d4
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d4
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d4
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d4
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d4
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d4
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x194
+		>;
+	};
+
+	usdhc3_200mhz_pins: pinctrl-usdhc3-200mhz-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_NAND_WE_B_USDHC3_CLK		0x196
+			MX8MM_IOMUXC_NAND_WP_B_USDHC3_CMD		0x1d6
+			MX8MM_IOMUXC_NAND_DATA04_USDHC3_DATA0		0x1d6
+			MX8MM_IOMUXC_NAND_DATA05_USDHC3_DATA1		0x1d6
+			MX8MM_IOMUXC_NAND_DATA06_USDHC3_DATA2		0x1d6
+			MX8MM_IOMUXC_NAND_DATA07_USDHC3_DATA3		0x1d6
+			MX8MM_IOMUXC_NAND_RE_B_USDHC3_DATA4		0x1d6
+			MX8MM_IOMUXC_NAND_CE2_B_USDHC3_DATA5		0x1d6
+			MX8MM_IOMUXC_NAND_CE3_B_USDHC3_DATA6		0x1d6
+			MX8MM_IOMUXC_NAND_CLE_USDHC3_DATA7		0x1d6
+			MX8MM_IOMUXC_NAND_CE1_B_USDHC3_STROBE		0x196
+		>;
+	};
+
+	wdog1_pins: pinctrl-wdog1-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO02_WDOG1_WDOG_B	0x140
+		>;
+	};
+};
+
+&pcie_phy {
+	fsl,clkreq-unsupported;
+	fsl,refclk-pad-mode = <IMX8_PCIE_REFCLK_PAD_OUTPUT>;
+	status = "okay";
+};
+
+/* assembly-option for AI accelerator on SoM, otherwise routed to carrier */
+&pcie0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie_pins>;
+	reset-gpios = <&gpio1 15 (GPIO_ACTIVE_HIGH|GPIO_OPEN_DRAIN)>;
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>;
+	uart-has-rtscts;
+	/* select 80MHz parent clock to support maximum baudrate 4Mbps */
+	assigned-clocks = <&clk IMX8MM_CLK_UART1>;
+	assigned-clock-parents = <&clk IMX8MM_SYS_PLL1_80M>;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm4330-bt";
+		device-wakeup-gpios = <&gpio2 7 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpio2 6 GPIO_ACTIVE_HIGH>;
+		max-speed = <3000000>;
+	};
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2_pins>;
+	status = "okay";
+};
+
+&usdhc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&usdhc1_pins>;
+	vmmc-supply = <&v_3_3>;
+	vqmmc-supply = <&v_1_8>;
+	bus-width = <4>;
+	mmc-pwrseq = <&usdhc1_pwrseq>;
+	status = "okay";
+};
+
+&usdhc3 {
+	pinctrl-names = "default", "state_100mhz", "state_200mhz";
+	pinctrl-0 = <&usdhc3_pins>;
+	pinctrl-1 = <&usdhc3_100mhz_pins>;
+	pinctrl-2 = <&usdhc3_200mhz_pins>;
+	vmmc-supply = <&v_3_3>;
+	vqmmc-supply = <&v_1_8>;
+	bus-width = <8>;
+	non-removable;
+	status = "okay";
+};
+
+&wdog1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&wdog1_pins>;
+	status = "okay";
+};

-- 
2.43.0


