Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11022107.outbound.protection.outlook.com [52.101.66.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C766283C89
	for <imx@lists.linux.dev>; Thu,  1 Jan 2026 15:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.107
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767279969; cv=fail; b=BGxJNVjcGzxrNwWmpclBDaupF2mFarUBSbhzSqVxCmPWp1r9KoFzcLgfMXfZYlst5vvz32DPTnFXkDI39zxDBVC86p84H7Lljtnz+rjCnpZhi5gWLYCodG6b0YRfDHfGsiyxKOeCedSY4rsaq+XLY4GJ3y/ZyiUf63wWCFAnJyY=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767279969; c=relaxed/simple;
	bh=Dr+Or1BixHclYaUtsuFm/s789ijk1S8vftg0M9wge+U=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UJtz/U7PUza7gk5K/6s4VONmSHXPCuX02HEsNyUrWas/vCgQ7YRc78nUL6YBovX9SGSFdo8RidbyYsbcM3qbx2A4IeygKW8ho8ZYoJdAIxQCnPorabZH05Go9MiO0Y1kPKdJDLrZy6ojRSDqdalF3VoHn29eahvZjdsd3VP/FoA=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=c+uzNIwY; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=c+uzNIwY; arc=fail smtp.client-ip=52.101.66.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="c+uzNIwY";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="c+uzNIwY"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=FEidQcACaObmCKb8hEfXZcTaQJ/cTxR3zaIVguD7KFMcwvcWgbaWfYvIsC1PWPhjWIa+g7+opMofwgd2DdJ+haxnB4qxPx7Bx0YJpNCrOfWpMAcBsaTsIfmdm6WUSzg2FFfa/fomaaEOA+1LNeR2QDBivvrtf4/bti4D54uY2lo2jKfSs+sNOQWIfCwXNB5ATTyMPUQtC5MD6jiwvYJehLJEIJ02fHjuxNecaZeaYR/M0R1U0D+c7A5mj+4otI3dGoIBTj5s4ZLIb04xhFL370ylWYQ0i+yBCcGD6AgIg0rx/s99IyDznYI4uQeffekA0QiRhQrT5ijfpy0SRXRAUQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOWJLsxRgnPImz6xi0RHs45xM/KcsR1AbI/tLyO9eSo=;
 b=SBHrMckgitk74Rtlukb+xKCShlzm1emQp4IntnBYlIHL+NwwnrjdmQu4lHOlNNp+xWJ9/9mdKInCcva9oMQB2csOpYUgAFvNGyGxmqYvS6OhE3LBIX9Ni4mvfofxMFs3xYMFTL4+NGZMH/6hey0x8STokiZIGn5CsZkje7+XIwnnfFJK/MpXXa1Sdi95cPUCqlw4yIoZEVSkH77RYxzNx2LW+f1vAMcw3hrMve4HjINyTk0ujYhD6fiP+4cB1fcvq89JymO/sumXJMydtCm8wKIJrG501biUfTknKp7S3QNGHOq3OWovCn98O5Nmk6inDQ6x1+d7+ifI1z0idzGQGA==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOWJLsxRgnPImz6xi0RHs45xM/KcsR1AbI/tLyO9eSo=;
 b=c+uzNIwYlNX0tSH9sJUZ/6T4QlATQT91YsYsRYcyfoSIMuUS3SYh6QMfEsvQc1ENYhBfmm2eYMglXpIBgDEwmXnlg8+H97ugf/lfDlAXrg+0bigLsfHK8cu3iGZd8B+MppxxHeR4Omar6pbXDAtPXC4eCjSvahBuGUd1cVG3wvA=
Received: from DB8PR06CA0061.eurprd06.prod.outlook.com (2603:10a6:10:120::35)
 by AS8PR04MB7749.eurprd04.prod.outlook.com (2603:10a6:20b:2a9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 1 Jan
 2026 15:06:04 +0000
Received: from DU6PEPF0000B61E.eurprd02.prod.outlook.com
 (2603:10a6:10:120:cafe::66) by DB8PR06CA0061.outlook.office365.com
 (2603:10a6:10:120::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9456.14 via Frontend Transport; Thu,
 1 Jan 2026 15:06:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU6PEPF0000B61E.mail.protection.outlook.com (10.167.8.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1
 via Frontend Transport; Thu, 1 Jan 2026 15:06:04 +0000
Received: from emails-6274464-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-24.eu-west-1.compute.internal [10.20.5.24])
	by mta-outgoing-dlp-141-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 683547FEFA;
	Thu,  1 Jan 2026 15:06:04 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1767279964; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=GOWJLsxRgnPImz6xi0RHs45xM/KcsR1AbI/tLyO9eSo=;
 b=OCmqmQzE7wfv+Wc/nZ53jPJRCigxoY6By31E3NeZAEP2FRI+U/kRjBWucW02eC1VG66J7
 gzeTvyM1a3f8VAxxJaR22dABZ1dcaO+UXNJ2Q289QjnJhw++xdWZrreof+h1/54yuUugO6O
 G+YfPCqY8MJ30JI5uYGYbwThBZemXDI=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1767279964;
 b=Ru7t08b2NYQ0sb7NJHOWNfqGMSXZ72GjOtKV8YDRadXdjoDmkxluZHzmxoKTzG4gy3uRi
 66JKnZAusJE85egLkbHrCd/MIu5kihqZJ66x1qoq8xMqr3lB+PPBCdPFsIdoFZSC36LIAhT
 o1SUgbAONXbNUtDNCEHDLJ5vHieqYQM=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fGthCkVwOIcjazLzsMS9adLdjSHqyF/E0WDlFifLpGg439rcOdF0p97ap1/P73EvFeZMfb1B+zG37ATlSDF8J/sKWBTppyKZ7uyLhR3fhlAFd3frCex17Xo9o+ykRx54LvKsGXXJGZI/8OBo483D/QtQr464E1qj+5SMKgPTRZuN1qoxOj4BRQIiOu0n5UaxX+hwSQBmq2kfDifWG+7H+fMmzbZapJdQfVPrQtOfA4cNtBvrt5g0J88XxmN8ykOKTwJ7+i2J4vBaoeNSk0+2mFtuEEWTAK5tAjas9vQLYJkwuLbR6CBrD62ilf7rDZ1YhdUj6WTl9+xVnyB1Ze+VvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOWJLsxRgnPImz6xi0RHs45xM/KcsR1AbI/tLyO9eSo=;
 b=vip+QgU9DcXVuh+Tm/gqX/hRoIV5mNXPzMTQQ87J7IznLPrhjQoQGlFg0RqoQmS/6OqZYG0T3/zOhdBucNYXicm8+M1SMKST7XVMcxmyczARi1UBt3aRvBlR/MZKB1tDUF8lRpUI/F5Gh+KV2ROYze4XGYg6NvNp6isxLcAuzacgVdxXq2nvsiyCvZ+51mq70lLhsz+2yu4cXMQlu6C/5NDuAH48YO+YT8cGM6zwCovYwoRpfLOyX0EboZkKzm5DPa2Rtqf90cOfC3U9YOTBLnWz720Z4oN9zLcssEfFYFg4x06VK3ABR9+icb+zgh8sUrUz7871J0EGHjRjkCf0Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOWJLsxRgnPImz6xi0RHs45xM/KcsR1AbI/tLyO9eSo=;
 b=c+uzNIwYlNX0tSH9sJUZ/6T4QlATQT91YsYsRYcyfoSIMuUS3SYh6QMfEsvQc1ENYhBfmm2eYMglXpIBgDEwmXnlg8+H97ugf/lfDlAXrg+0bigLsfHK8cu3iGZd8B+MppxxHeR4Omar6pbXDAtPXC4eCjSvahBuGUd1cVG3wvA=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PA4PR04MB7664.eurprd04.prod.outlook.com (2603:10a6:102:f1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 1 Jan
 2026 15:05:53 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9456.013; Thu, 1 Jan 2026
 15:05:53 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Thu, 01 Jan 2026 17:05:43 +0200
Subject: [PATCH v5 3/7] arm64: dts: imx8mp-hummingboard-pulse: fix
 mini-hdmi dsi port reference
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-imx8mp-hb-iiot-v5-3-b369b2e0c07f@solid-run.com>
References: <20260101-imx8mp-hb-iiot-v5-0-b369b2e0c07f@solid-run.com>
In-Reply-To: <20260101-imx8mp-hb-iiot-v5-0-b369b2e0c07f@solid-run.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: TL2P290CA0003.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::20) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|PA4PR04MB7664:EE_|DU6PEPF0000B61E:EE_|AS8PR04MB7749:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c2ccb23-5ce5-41b0-c871-08de494748c7
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?czdWZDZNd0ljTCtPNlMyZHh0Q3hlSVBDV0o4VzROaTZ0M1RxTlNMN2Y5WDZ2?=
 =?utf-8?B?QTUvbmFhczU0SVN5MGQvdXZvMUpOTWcvcHBRWVI2UHFwcG5ObkY0SkdrRkFO?=
 =?utf-8?B?SjgvZXY0eEs1L0N4KzhCaFVremc2eUVrejVUQ2VXTTZqZExja3Vibk1DRTFM?=
 =?utf-8?B?b2NZSGxQU2lWRHJEZDBJM3JrY1BaK09PL0pxRGdwWmlVTy9zaUI0NEt0amtP?=
 =?utf-8?B?WTl2YUpiZmM3MEM0SE9Hb1NCbk9IWjJ2bnpxSWdTbk9tU2Y4V0RkWUJHQ25E?=
 =?utf-8?B?aVpMaE92TmR2TnpwT0FWN1ZMY3FnU1o5QmN2TWtNLzF5T1F6K29yTlBzWStE?=
 =?utf-8?B?Q2JQb1lWNklwc1pmNUlKS2ltMU5NbnBGWUhWeUdpeWxlZHhvazd3UmR0VS9J?=
 =?utf-8?B?R3FCUXFja2ZhQlJ5dUJ4TVlTSXV0azlaeGhKNGV1eUp5TDZHL0d1UFdyYkRx?=
 =?utf-8?B?WDNIUGNoR1FiNjhKajVtMGJHY2RnSWRlUEtuTDFnWllUZjFvbSt4a3Y0S0tH?=
 =?utf-8?B?VSs2WGZnT2p5VjFaN0FNK2licGt0cjRheENOK284blJOZzBsNTZKTjJoOHBv?=
 =?utf-8?B?azBnUnBTZ0NwNFk5TnVmalFEOTFOdUpSdFJuUjdZUTVMQmJJNGVtWTRqRzVj?=
 =?utf-8?B?Y09DNDZWNnd0QlNXTUgyT0o1WWV5ckRPdnNncHZaT0cvcTFWUTZ6S202Qy9Y?=
 =?utf-8?B?czl1dms0OHFrMjVpMll5UzRNRS9KdjB5aEJBa202MWNMU1dtTFM2Smc1OCtY?=
 =?utf-8?B?eTBtcW4vampWSktOSmtEdVdyT1QrSmtrUWxjTkVGVE5HYUwwRUpqVS9Ibzl3?=
 =?utf-8?B?UTJSczVkMUtHYmhUOG9IMW1OM2xtYzJTampUU1h1WXlDU0d6RHp6K3lGZW5M?=
 =?utf-8?B?alFyMFUrVGJYLzZXT3Fxb3ArZjd2THZYSk52LzQ3aVl1cGFKM3lMT2p0WktY?=
 =?utf-8?B?VTNqb3RyUnh6bGRPS01jRG83TC8vYmRmL01NZHAxRXBYakxhS3huUlFCRzZt?=
 =?utf-8?B?RHZrOENNWGZCdEthZi82QkhSdm8vZUE4K3RUbzB6aCtlTGN3ODlIR1VBRlAy?=
 =?utf-8?B?UmZ3cVIrcVlQWHBrVVloWld0SllwelFVN2hhcXFqY0ZCM1h1anluNG9rcDlt?=
 =?utf-8?B?ekd1U0Y3S3N4cnNIdmdWeFAwSzB5cllVVmUvVm1SekFUVXRqcXpoOE1JSXZS?=
 =?utf-8?B?anlrWVpEbjY0T1ZwZDFkc3R3YnJPS1dtTElzcmVYNlpBOHRtNzNqbmlWWDVj?=
 =?utf-8?B?b3czb1o3RHZ1NW1PYThjaHl0TG03QUtLc1NMRCtmRHp4Y2tTTTBCUFNtNXpG?=
 =?utf-8?B?bFBibEFMbE1xM3lCZUVlTlM4WW1IOUtoSGdRdVdRbUo1Q2UxNExYMENVeVE4?=
 =?utf-8?B?OEdDdTFrZm1SenAyNWs2RmdHd3J3YUtidklVM0lFenQ3YlZLVExwRXdjUm1n?=
 =?utf-8?B?eUZRVzdwQldFdjhuT0ZhOXovR2R1eEtaMjlSVlRYaXVFZEN0Q3pFSHNlQjVB?=
 =?utf-8?B?V3NicWNRQkRTcDQraFBJZVFoMnNxMnFxOE5aeC9GbWxxUkdoQ2l5Uys4MG0x?=
 =?utf-8?B?cXk3SDR6cUpmeXlYV2NOZjVIUklYUVd4YkZUWGczNkNhaWRlMWp2cFgwTm0v?=
 =?utf-8?B?Q3lMZVF1OFN5N0xqd25qSkZhaFBXZERiYmNENXNOamowZFJ3LzlkZlR1RzR5?=
 =?utf-8?B?WHlBcDEvelNCeUZaSWFNTGlMVExSMWFaN09VYjNnbHI0M0UwdE9majgwaGtU?=
 =?utf-8?B?ek9zWThMc3VzaW5nc0JCdVZ6TU8yeW4vRWYrSVVKTEZHUmFVay9acEhwUlBs?=
 =?utf-8?B?bXBRWHBaUmFVYjdGenpxTm9zQUNseG96YVhzem9FTUpocmdkMW9aS1ZpOGhD?=
 =?utf-8?B?cDJKOHlFeXFYZ3hWRlJETExpSjJlbkYyOUI1TDhjbFlUd0lueGhJekplT3JI?=
 =?utf-8?B?UkVhUVpISHZRY3c5S2NuOW9GdDJXQ2RWMG5lenZ1VlRSRUpZcWFYNHFlS1NU?=
 =?utf-8?B?UEFBVzhNVld4L3NBNHBKWHRKbWtOUDVkdytXbXFXNG9tc3IyMmZEYWRKVXJ6?=
 =?utf-8?Q?355vLt?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7664
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 8496352f431f470090565500c5f03207:solidrun,office365_emails,sent,inline:113452bdee034aaec32088b4b1e9092b
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B61E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ba5aa541-c216-455b-806a-08de494741f3
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|14060799003|1800799024|376014|7416014|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eVkxOC9yNUF2VUNzSEhNazZNZ0FRY2lyTVlLMElPQmZJeEp5V0hlNUl6L1Vj?=
 =?utf-8?B?Tk41WnNzd2tWM2NIODVlclg5WGhvSHByNWVSMlltaG95U29wRTFZaHUyak9a?=
 =?utf-8?B?c1ZRQnFDUUVDM1N6b05nNEZkdmlFUVFLZC9nSGdIdDFNRXRUemRlMHM0QzU0?=
 =?utf-8?B?SWpMZzFyZVloK09iTmduZ1JhSW12cis0MFN4NU5EQXZBYUlnVHJic0VtdlBF?=
 =?utf-8?B?eEd5aHFUcXNRVG1nZ3diWDNGZllGVUVLZjB0NFc2KzhObi9JSkg2Z0dHcm5s?=
 =?utf-8?B?cFVvYzE4eUlmVmRRR3FwNjI2dHJpNDNHekcwSkRJQ1p1d05lV3QyV2F0NDhr?=
 =?utf-8?B?cWpFWDRrUTdMM3hCNVh2dmtBU2RlVkl2Uy9yUTVPcW1DSUZBRWYyY0doMERW?=
 =?utf-8?B?eldtYlArQnVYdVhmUTdxa000dkJJOGxuQ1Y1czdZSEtiNktlZWhwQlQyTGds?=
 =?utf-8?B?NWpSQVl4M1VEdys4Q0RDNGRSd25BS0Ivc1hYWk1jU1owSk5CcWdxRnI1Rm5Z?=
 =?utf-8?B?eWp2L256N3hnY1JMTFd6Z2t6amVsMk5rRkxRTWZNTDJwMkZKSCtleTVIQmpO?=
 =?utf-8?B?TytrTHdRWWNiMFN1RU54TW01Wmc0MXd5enlwejM0aGRNRWpQUERFYnVRU2lz?=
 =?utf-8?B?RmZHWUlIWkVPS0FuZFRqTXlPaFd2TDhoQWpaeU9DaDRHTUNHV090RjhoVmQw?=
 =?utf-8?B?MHVudUlPOEpOQ2xsODI5U0FSR3pwOVRaRVdVMWZwd2lwemdOMm1sNktuYjFt?=
 =?utf-8?B?OEtXR0RXMVRrOUcxUElXbUVtdG1DS0dNcTlTWkFBQXkvVWcybFdMOU4yc1JR?=
 =?utf-8?B?aEtGellMcjh6b005bUh6WWU0Umh2WjBLK3NmTkpnZDhzR25vaHJnRGxSK29R?=
 =?utf-8?B?UmpwK3FPU3JIMmFZTWxkRW11WG5uakRnK2lpTXhhZ2NiVVVCbjhVWTR5NTNs?=
 =?utf-8?B?MERHN3RWNm02NlliOFUwNHlNdEVZb3JjN1prWXBnTUJIUVRoWlB3TzJrQy92?=
 =?utf-8?B?RVNaeHh4dUVhMWlFRm5YWnhRYmNoVnNreXVhTmVRTWl5QXdZWU04VHhmOW1C?=
 =?utf-8?B?VGw0a1ZaWHNBU0NoKzc2aDlINVF5dnkrWmFJUVAwVEJld2JqSER6M3IwdFVw?=
 =?utf-8?B?V3RBc0F4Qm9wYnFmNHpNL3M5UGwwYWZDbmVMa0I4SWdEaGxSMVExTTE3b1ho?=
 =?utf-8?B?OG5xa242TFQxMTFZTTFvaDNSbVIyanpuVVZaQ0g4L2dENmFLa0xyVFhuWlNS?=
 =?utf-8?B?SS9tUGo2VkVtZmhVRHI5bGV3aUJyaGhmUFNjeDlQcTd0cGJQbCtMWTdIR3F0?=
 =?utf-8?B?R2lvZDhuN3IrNDRqandscGRsb3g1YjkrbXk4Uk54TkkvQlR1QkVTd0Z0b0Nl?=
 =?utf-8?B?YkUzNWMwQXVDd0V3RGcvbUJDWlpYRXk5TG5RV0IxUERiWmVkdUl3RmF5citV?=
 =?utf-8?B?UDltbnNrc0ovMVNmNXJ2RXl0a3hMcHorazBMZ1V6Vi9aYlJYRUY3QnZNVTFi?=
 =?utf-8?B?Nk1rOEppV0xOemZnRGRiSE9SYkxBalp5SndRUkZ3bHgwRmpDV3pJdG8xVzVL?=
 =?utf-8?B?MVFTVStuNUFVS3hMV096dld5T0Z4Z245TXRnYnIzUUxwcTlkczBJYUU1dWhk?=
 =?utf-8?B?ejVBcnY5ZmlyOEVZWHV2ZXNoVlFWYTlxRXlmMkMvNVB3NHd5T2UvMnFqTWlk?=
 =?utf-8?B?SVlrOWk5WlhVT05ZekpOTDVidHlwMm5pUXh0M3ovL0NwUmJjOHFZVGF5c0dD?=
 =?utf-8?B?eUJyQ3FkekphbmRaVmhrTUk1Z3BmeHVsdkVVRzJwcFAxckcvVFlPL2RpZFk0?=
 =?utf-8?B?Y2xYdm8zZFR0R0NFaGpzRkJxTmwzVHJkVEpnK1I1ZXMwcCtLY2l5NDVpbHZN?=
 =?utf-8?B?azJneUt2a3ZrdUVOUDl6YWZIZXMyS3g1TkRScjNpaktZY29ic1o3VDRRRThu?=
 =?utf-8?B?SUlMY2FKcEcyanNiWGlGZnloc25QcktXR0VsUW1sTXhtOFlTM2hBUFBRc3Ey?=
 =?utf-8?B?bnc0RldRUWsrVWt0NXhGYmVRRlAzOTZkRDNiQ3laTm93RFpGQUFsTFNoUW10?=
 =?utf-8?B?cEt0aTM4MEhuL1hkaExCNmMrSkI0TndMTlAwQ1o0NS9vSHplcGwvcDk4MlJQ?=
 =?utf-8?Q?KCuQ=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(82310400026)(14060799003)(1800799024)(376014)(7416014)(35042699022)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2026 15:06:04.5304
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c2ccb23-5ce5-41b0-c871-08de494748c7
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7749

imx8mp.dtsi includes a default port@1 node with an empty placeholder
endpoint intended for linking to a dsi bridge or panel.
HummingBoard Pulse mini-hdmi dtsi added and linked hdmi brodge to yet
another endpoint.

This duplicate endpoint can cause dsi_attach to fail.

Remove the duplicate node and link to the one defined in soc dtsi.
Further remove the unnecessary attach-bridge property.

Fixes: 2a222aa2bee9 ("arm64: dts: add description for solidrun imx8mp hummingboard variants")
Signed-off-by Josua Mayer <josua@solid-run.com>
---
 .../dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi    | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi
index 46916ddc0533..0e5f4607c7c1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi
@@ -41,7 +41,7 @@ port@0 {
 				reg = <0>;
 
 				adv7535_from_dsim: endpoint {
-					remote-endpoint = <&dsim_to_adv7535>;
+					remote-endpoint = <&mipi_dsi_out>;
 				};
 			};
 
@@ -71,11 +71,8 @@ &lcdif1 {
 &mipi_dsi {
 	samsung,esc-clock-frequency = <10000000>;
 	status = "okay";
+};
 
-	port@1 {
-		dsim_to_adv7535: endpoint {
-			remote-endpoint = <&adv7535_from_dsim>;
-			attach-bridge;
-		};
-	};
+&mipi_dsi_out {
+	remote-endpoint = <&adv7535_from_dsim>;
 };

-- 
2.43.0


