Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021091.outbound.protection.outlook.com [52.101.70.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D13A55
	for <imx@lists.linux.dev>; Thu,  1 Jan 2026 14:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.91
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767278640; cv=fail; b=drXaNI7wvUcvr14f75Ue4ZhmF6+VtCzF+KTp0vkf13DMyfSHGYEbBqC5+TEjRZZo3HSx5ABgtihzTeGyxUUCk/v7RPmz4rdM57CyEFI4tOdOV/TxgoQ3arp88XIEU56P+On5cFKOt8V2K46eDO7V2MpkF/zaJZ0/yWXDPfFbHOk=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767278640; c=relaxed/simple;
	bh=YjXPhdrvuEPC1nNppnuKTWszsIxX7jigFsW1Su1tsM4=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=k+US6/ZEWTMBQzwcvuKHGTK4lFiaes4M4RviYB3efsJecOYfXIMXlsc5VHjvJgkgMsRY++o9/vBamAzq9fqsoyLaZqbrMqo8dMBLhs8gDIBkkTZP1t9116eRZYGDb+mhi5GDqyJ9xLsKiEZYDZLgNM11WaPNpseRjDnh5a3JUdY=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=eManbvW/; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=eManbvW/; arc=fail smtp.client-ip=52.101.70.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="eManbvW/";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="eManbvW/"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=r+WKPsJlHKWO5DkZoUYTVynG3JH9q7ZBp85ug50o3lXefopZA1QPCXtaFcnUbnsarWoyp7c4zVakmV1rYSK4dSi+V6MoZC/V+kcvn7gZM8LTEKC3lmZ1yGAB+3gHhMWeg1um5mBJQmZBtLt1k2kkKal6dO1cUy0H9k0dr5hMmw9fukl4AqbgXVUkPQUiveFFx+LCIO+z5N9Ro3oNPixNlEMNSCvCewvp4b8Nf6F4bZcxJ1dxKrpCM338d6akf2XvZJf789hKx+PqWFAwbzmXJAps0ftFUcgZyuM9F09+4uGoIF6zm2KlGF31/SHE+ZujWFz1g0HjseGUckGcJiZBIQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7GbMqQl0waq0+gtv6o8J3TKs8FDEYKleluCxBJYXZ8s=;
 b=XNTshgVmkbkw/RsmyWEt9YYdshVBWcw+enBgDTjE/3bQtYWtIGXraFOgh2ob6DHNUg5czHCf0ISHXvxAO8t79PXcXDXjfyIR0ueAk6WzEYmKAN6lRMZZucOB9wsMMt51qgngvMw7Pg/99Wu2plIMyh0ggW6geTb4z46hT4lIy5Edk7nXmzDB8hNHMSMl2jrLDOet+MegAfhAad0SLzU29Gs86M4ACJOwp9C1vuw0bIZc/agmgIG+oo0ZNWZ8jqEfnaCK294UORAunknoQsKWvM/BF+OPtqxlkvPz0TTxYY7Ze/rwoYWmxAKJzrM744PlAwlwyjlFzixPGlH/bsDEvQ==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=armlinux.org.uk smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7GbMqQl0waq0+gtv6o8J3TKs8FDEYKleluCxBJYXZ8s=;
 b=eManbvW/V9dK8ketVYgylO4P/v7ivzmPcJ0R55rpREM0MbS+xY0wId4l1aK/k+sezYgWu89yfENN/j9frJOmTV3dUZmWie1PlTYcjygUSoXcF9nNn4C6JUNpOlGx/aDhOeLJjUkR36mOo4yigaO3Wku9TCsqooX5XoCrwakzF3c=
Received: from DB3PR06CA0019.eurprd06.prod.outlook.com (2603:10a6:8:1::32) by
 AM9PR04MB8731.eurprd04.prod.outlook.com (2603:10a6:20b:43e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 1 Jan
 2026 14:43:54 +0000
Received: from DB5PEPF00014B9C.eurprd02.prod.outlook.com
 (2603:10a6:8:1:cafe::53) by DB3PR06CA0019.outlook.office365.com
 (2603:10a6:8:1::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Thu, 1
 Jan 2026 14:43:55 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB5PEPF00014B9C.mail.protection.outlook.com (10.167.8.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.1
 via Frontend Transport; Thu, 1 Jan 2026 14:43:52 +0000
Received: from emails-6344409-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-218.eu-west-1.compute.internal [10.20.6.218])
	by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 728AC809D9;
	Thu,  1 Jan 2026 14:43:52 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1767278632; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=7GbMqQl0waq0+gtv6o8J3TKs8FDEYKleluCxBJYXZ8s=;
 b=IxAXyBoS4c7jkKX09fPUbIMw3cmNGtUTDKub7OfwXNC8VbweOnVvupGO6pXQICG1FTKi7
 nV5k/+44PW8igkK0nkb9A1O8FrKKS1x+Uuwjud2CCyJOhD3ZDBZZzYUSECkbr0P0J0Oi/X1
 QP27dvRnIHn32jmPMM8beCU2axQwVqo=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1767278632;
 b=OGH/YAUHuTxxHguI5kPocwXGKnJ403yVzta88q0rjopxHr4LYX5bHUNYl40Zo+CGcW19R
 XVH+vTdg1Qzua7X1WZrk+fi7HRDOajTE+BFMDnqQhZPSVntesvGzkzz7lfgJb6VnRTCIMIF
 6hkMrPGC+7TR53O2xaw5LcTc/ttHg5o=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qw3rFQMGdLvkNnN3Pjbisr4VogXz1Z+3sONTbgJ1wvUdHKyI9bF1YViRqEK7U8yOxFs+/5sZmbI9TPRJHhmwiopMyhpHtBuUlaHU2h+QRrVW+OPd5zNTKWVzVfSW+z8FPG50V81FKUkIvRccUevx2Qvw91k1w+Q0mnO+rR72XcmxfSbCyMWu1iaRBsM9v1dZK8pZthFiWEwx7MQJoWJ6DzcQS7/mAZmYrwlG7ypyyphoVtuAmthv3Es2S/nR/Iri74Dr4JZRHyVS9vBZVKsOR9riX4qFCLObxLGh2/r5Rjek0qO7aOvUa1qeCMuY1JWqPKPw+2RnDYfrBjlfl9HjvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7GbMqQl0waq0+gtv6o8J3TKs8FDEYKleluCxBJYXZ8s=;
 b=aNiKrchh+aJe80jnebAHWEXl8enau8+7z1DyJa6OnOaG5UjtfuqQ9HrYORItQgvKMHjTTSICxbJeWWHMSaO4UUTnMBzgJo0ReHo71fge84ux17l2udmjzJF1aWXjpNJBLCCm15ki2CH76nhzUA6PE8oEh8+mi5vBnaOCRjy+omLao3Iaf0+qkVKGJQUInwBZFtVQ6ssjmCwBr2UclTtMCCwolG2RuQWpV2ght/FE1xCfMApPGoLVe/BwibdklyrjupHaV0ivNDqHCkmnFyWkBUTrFJ9Op7dUwwgY5Zz4Edj09Mp+wDQpULLxu3Ksaud32BFtQpCRh2x4D1TM3cA3bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7GbMqQl0waq0+gtv6o8J3TKs8FDEYKleluCxBJYXZ8s=;
 b=eManbvW/V9dK8ketVYgylO4P/v7ivzmPcJ0R55rpREM0MbS+xY0wId4l1aK/k+sezYgWu89yfENN/j9frJOmTV3dUZmWie1PlTYcjygUSoXcF9nNn4C6JUNpOlGx/aDhOeLJjUkR36mOo4yigaO3Wku9TCsqooX5XoCrwakzF3c=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PAXPR04MB8992.eurprd04.prod.outlook.com (2603:10a6:102:20f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.14; Thu, 1 Jan
 2026 14:43:45 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9456.013; Thu, 1 Jan 2026
 14:43:45 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Thu, 01 Jan 2026 16:43:40 +0200
Subject: [PATCH v2] ARM: imx_v4_v5_defconfig: update for v6.19-rc1
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260101-armv45defconfig-v2-1-3a57f69624e0@solid-run.com>
X-B4-Tracking: v=1; b=H4sIABuIVmkC/2XMTQrCMBBA4auUWTvShDalrrxHcZGfSTtgE5loE
 UrvbhBcufwW7+1QSJgKXJodhDYunFOFPjXgF5tmQg7VoFttWtUqtLJuXR8o+pwiz6iMs1E7pc3
 ooVYPocjv73G6VUfJKz4XIfv79Err4e9TI9wUKgyDM511wY6RriXfOaC80tnnFY7jA4a6li+wA
 AAA
To: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: TL0P290CA0007.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:5::11) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|PAXPR04MB8992:EE_|DB5PEPF00014B9C:EE_|AM9PR04MB8731:EE_
X-MS-Office365-Filtering-Correlation-Id: db49ede8-d0af-4b70-8255-08de49442ede
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?YjloQ1UwYjZ6Nkxvd3dvbTdBSUpVYytPWU9VM1drblk0UHdOaFMxeHJZck5H?=
 =?utf-8?B?MUhjYXhHL1ZpcmFlZ1l2STJiL0ZjWmg0Y2ZlSENub0w3WXVTMnF6TEtKMmlG?=
 =?utf-8?B?T1gvTHVYQys1Y2djSjRmVWpMbnlrRnplRFo0cEhOc2hIOWd2Rk1pSDdXWUxC?=
 =?utf-8?B?WFVjMkQ2OW0xaW1iOTFsaUZJWURFcU1seWVrNXFOQ0dYMWtPaTZLcC9pUG5Q?=
 =?utf-8?B?ZFRXWGtYekVRSG9YL2htdStvenExWGhNMjRRS2o0Qk1VRm1sMnByeHlkbXhL?=
 =?utf-8?B?a2JmR3dndHBwWHZma0Z1YzFSUTh2S2hPWk1POUUzNUtvY0dLU2tQdjVHMFFt?=
 =?utf-8?B?K0RoTWFKR1NXZ3NwNWNYRUNWTFpOMjVkYkhWMDRGQTBxS3NzYlVSU0Q4MW1k?=
 =?utf-8?B?dU5wS1R2TGh0SlNLUlVIUVNISlNHMWZuU3dDSTVJUnRyVGdHcUhBTjhwK2Rr?=
 =?utf-8?B?ekRFcXdpdTRPTEFBMWoxRVd3UzNkTVNUWjczVFV6Y2ZrVUUxYzVjdXAwTnlr?=
 =?utf-8?B?dXBtMjc0MHdMaHlTMWtKbXJyN3JqQ3F3bFQ3MWUxaUVlcjFLOHEvZE4yL080?=
 =?utf-8?B?aXNqYnlnalplUWk3Z3BhdWxOV2ZNR2dTby9uZ1dVZ0FoMGo4dm1sbGtmcnNj?=
 =?utf-8?B?TnVKQkdoZzJHVWxwMmxja2dFa3BJSzZLUzFSUGthYlFKSy9hOUJnSytDK0lq?=
 =?utf-8?B?amI0ai9CNGlqNUpBZTRTZThUVkdDTGlzQ0ZOV0N2Rk5OZ3ZsVzJaY2ZCbkRi?=
 =?utf-8?B?UWNUYUVzYXQvK0hjNlMvcE1aSWtjcjNBeHpwV1Q3T3dlY3lZNTNZMmc4ajdo?=
 =?utf-8?B?d01iVkQvZFNRbG9XYWpqV2VIdTd6d0VtdldyZndKaVVRYXo5eVVqb2s2SnR4?=
 =?utf-8?B?ZThOUVJPOXNZbUQ0a3BXbmc4Zzc1OEZkc01vMXluczZleHcyT2R2MkRhU3Fr?=
 =?utf-8?B?cWdZb1p4REZoUWJWclVFTTdDb0FSRWJxSFIySmcwYkRKUmpZWWd4TzFuY1R2?=
 =?utf-8?B?Y1dUdzJMYk5WR0tzbzIrdmJCcSttdGpmd1orTldlK3ZVc2k4c3JNcnJkdE5h?=
 =?utf-8?B?aTg3aytNaDhZY3pIeWJzRzFKSi9FSnY2QlgzVXNJOVBmdFUyODluZ3U1bFZm?=
 =?utf-8?B?eWtJek1VM1lURUdQM09SdldaVDJuUVpQTDE0Tndweks2WFVvdWE4aTdhaGUx?=
 =?utf-8?B?UlFMaW5VY3h5N0lNRWtFSkVBMHVrS1M5QTZJejROVUprMHpWcDFtYUh2eU5Z?=
 =?utf-8?B?VGNYN2oxdnlvcERnQ2N5RXYwU1N3VDg0Q2lvQTgrTGtHcmV4NU83ZlExNERa?=
 =?utf-8?B?Q0RvT3ROZnJRNEk3dGR3aGRncDVwcEE2TXhkaWtKZnozcDJhMXp5WjgwYUtt?=
 =?utf-8?B?LzA2NENUWlRidmk3S2w0M0lpSjFWbXowZFFJZy9TMzJpYmtCMFkyK2c2eXIr?=
 =?utf-8?B?bGZJcWY4cGFWSUtBWC9tSlY0cFNtZDg5bXZ3UmwxdWkyVmJBVmlUV20razli?=
 =?utf-8?B?VFFLL0FUODFmOTlyVkhyM0diTXJmRlB2RlZrLzlvVTFVQTRrc095bnZYbk5B?=
 =?utf-8?B?V0ZicTMrcWo3RjR2Wlp3WC9KbEhacGtYaFNReDN6RWZDN3E2NmZCOGRYUmZU?=
 =?utf-8?B?UEV0MXBKMEo2NVcxbEc3NmFDdTZrV0UxTnp1WEVDMTkyYkc0dG5qZGNjNytn?=
 =?utf-8?B?bnplT3Jpc0p3cFRpcGxXZ1FwR2lOcG5pbTFyZWdYQ0taYnNWZ3UySmk5RHdl?=
 =?utf-8?B?bStMYkgyOWpQUU1NWkEzRWw2VGovNEhWYnFPTE9DR1RYTjJjblpNZGdVa1J1?=
 =?utf-8?B?dFpzTld3b1RPZlpEcVhkU01GRzU0Q0Jxay9US2wvQnhXYXV2Y1lYM29pUGVV?=
 =?utf-8?B?K1M5Y1o5MHpBSWw3T29zTEhoVjBGRHBSckJaT0QwbGdoRTUrN0dIV2QvNWdi?=
 =?utf-8?B?OEUySUxhcUpRN3g2R0RlRWtSK1d6SS8zcUFWbnJzTHg4c2ZGYzBrL2ZielRQ?=
 =?utf-8?B?UzNWMDJuNThZSVhzMUd6UEZqenpzeTdtbitQa1IzQkllVGxBc2Y2SVpTeU9Q?=
 =?utf-8?Q?100kAv?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8992
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 6d7097b975bc42888236f9f2b3d87295:solidrun,office365_emails,sent,inline:8431fd15d350c9ed43bb5f6c297d0ecf
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5PEPF00014B9C.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f1d1a57a-ad7d-440b-7bb7-08de49442a46
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|376014|1800799024|36860700013|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N3Y1eFZURnZGZllnaTBtM1BMd3NEcGoxcVZBeGFFckFjWGdNUFB4amRiSUUy?=
 =?utf-8?B?SHhnMFdOKzc3Rmd3UTU0ODU2QVZLb25lQ1RhT3I0ZmRKZkxKd3V5NE9qQ1k5?=
 =?utf-8?B?TW5KSFg2Z1Zaa2dsbDhxajVTNFZ4V2cwY1F3VkM3Z1MzYkdIUjcrdmZkVXRE?=
 =?utf-8?B?TUgvSk1BSkt0Qy90Z0ZXdXZBMmNNYW1DQnVmbHlaWEdYV3VUdXM5YUg1SFFw?=
 =?utf-8?B?aldCSnh5NmRnUHZDcUdGV2R2T2lqR28rM0lLeWlLU0xxVHZ5UnhlR2FSV2o5?=
 =?utf-8?B?ejFlelN2aEszcFY2THBMdFdGM1NWakZhbDR3OWRnZ3g5WktvV093YWdDYnJS?=
 =?utf-8?B?RFViV0Q2T0Nad3JibnNkMWJyRkdVVmV6cis2MlcxbFR4NU15ZkNqSVpmMDh5?=
 =?utf-8?B?Q2ZqT0l1UFI2aWhpcDc4VkNBREFpNmV3TXlEalc0ZkV5Q1o3L0Fwa3Y4ZFJR?=
 =?utf-8?B?ZTlnc1N0dFVJVDlFZXRRdnkwbHBjUzdGQ2lTUjR1SW9FVkpRZkliajZKMFgy?=
 =?utf-8?B?TWpCU2U1aktQQ0kyUTgyTThQNEhCN0tTN2loakN5RUI4STVjQk9MNytaR2Rn?=
 =?utf-8?B?UEdVZm1OR0UvWjBnVTlwbXNvODNrUmVqeXVaeHFFYlA1OVlSQ3hlK09VdVJO?=
 =?utf-8?B?aldTQVMvdGttWmtickI1YVpFbmtVYS9ZbEN5V3prSGNhOWNXZUJPNWNZQWJn?=
 =?utf-8?B?dGZ4d1h1QmdQeFZwdXJFQmJaRzR0WGYrUVJGZU9HR1ZGSnBOY2FZZDdoZE5z?=
 =?utf-8?B?TXFSOHUyVWpNVGNma1UrTHc5eFdabXBtVmd2bWFFZ2dXMXNHRXZUK00zTTNO?=
 =?utf-8?B?R3A1alNhbjdEcXRsYUxxdU9zbW82UHNuVEVnb0FraE9xbzlLSS85ek9HTHNC?=
 =?utf-8?B?OHVtZUNnQjBOYnZKLzQ0RnYvR3p6Um5qUndjMW9ORVhmeUY1T3ZoK3NRc1pv?=
 =?utf-8?B?cUZVdTNvUVMyR3lLQXRueThFNEZRbHI5UjdRU2FsRGdNZ3VCVDF4WVFjY1ZO?=
 =?utf-8?B?Zm5NcmRQZDVQaVlCdTJyTFQyVTFuOEkxeHAzUHF4ekRwU0IzWHhCYkY5cUlJ?=
 =?utf-8?B?VnpaTU9UdlcxZzhNc2dzbHd3TFBZS25qOHE0c2wrL2tRVjR1eWhLNHZjeHZU?=
 =?utf-8?B?aGNYd0JtdUlmV1NJVEU2TEJxR1lJVXltZ0ZSSGo1N0NSYnN3d3RpU2ZaRWEw?=
 =?utf-8?B?UGtuaUlMT013ODVqYlFjK3RHR01GbWxDWGp3VzN6ejVLN0VVNE5UcHdvMFEz?=
 =?utf-8?B?TnlVTE43aVlCL0w3cjNnUFQxTTQvbEs3QTAxcTNHMzF3cjN5aWZyYmpTT091?=
 =?utf-8?B?MTlYalVhaW5EQm9Vc3hKOXM0TmRwN0ltRjBHSWxaZjcyaXdlY0lVUWhkY09n?=
 =?utf-8?B?bml4TGJhTkdtblJqcEtSZ2xuT1ExTGlFZEVmZldRTzlNUU1Jdkl6NExtOC84?=
 =?utf-8?B?MGtscXFjSWF0UUMvZlpYVFYrYkszNlNOcm9tN0NORUs2ZzhUaFA5cHFwRUJo?=
 =?utf-8?B?UHZVTUl1ZlZyTEtNVGxnY2JEMjR6SGdJaXVEc3oxMlVIR3ZsZUY2d254TXg4?=
 =?utf-8?B?MEwxQkc2T0h1SmtTWHpVWXYvaEVucERwVjU1NjczcFQ4dGZybkpvQmRCWXNy?=
 =?utf-8?B?dEx3M3krcm5uMGJ6UHZmMHFTdldhRk53SHRkeEJuejRwdU1sT0hTY0piYXFE?=
 =?utf-8?B?ajhBbzI0bm9kc1V0VTFyYWhpMmhKZGFqa0ZjVWlPL1FIOUhvUTBjb0I3K2lz?=
 =?utf-8?B?TkVPOW5UMjJzVnNnd2Z2Q2xsWGFqdDZtZWNzcFhTU1pSQUdndnlSYm12a3hV?=
 =?utf-8?B?akhBWlkvazRDd2t4d25DM1U2WGEycWJQRWR5T1l4UDRjZzJPMFgxVHhSNkZX?=
 =?utf-8?B?WUhxaWJDbzAxcDhYTnZYZmxtT1lzcUhTYzFCclBJM2JxNWk5VjlsM3ZUWHhy?=
 =?utf-8?B?Ty9BaGhXK0JlR1BhRmE0aUtRb01FeXIwcklLTjU0TGhId1FvWVJoSTVLTDUw?=
 =?utf-8?B?QmxmNmFrY1c2c2cyRFdwNHF0U0F2YzdhcVpaUVMvaWVtZ25McVhOK2UwQVpo?=
 =?utf-8?B?MFdUTXVGcHAzNHJ5a0l2bEFUMktKbmlxMXdmSGF2emE4QjNCNlVnUmY5TjZJ?=
 =?utf-8?Q?kXlc=3D?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(376014)(1800799024)(36860700013)(82310400026)(35042699022);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2026 14:43:52.5712
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db49ede8-d0af-4b70-8255-08de49442ede
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B9C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8731

The i.MX ARM v4/v6 defconfig has gone out of sync with some dead options,
some removed and some missing.

1. Add missing options no longer enabled by default:
- CONFIG_I2C=y
- CONFIG_LCD_CLASS_DEVICE=y

2. Remove options enabled by default:
- CONFIG_CS89x0=y
- CONFIG_MEDIA_CAMERA_SUPPORT=y

3. Remove options that have no effect:
- # CONFIG_INET_XFRM_MODE_TRANSPORT is not set
- # CONFIG_INET_XFRM_MODE_TUNNEL is not set
- # CONFIG_INET_XFRM_MODE_BEET is not set

4. Remove options that have been removed completely from the kernel:
- CONFIG_USB_EHCI_MXC=y
  Removed by commit e7018751d2e6 ("usb: host: ehci-mxc: Remove the
driver").
- CONFIG_SMC911X=y
  Removed by commit a2fd08448f2b ("net: remove smc911x driver").
- -CONFIG_SND_SOC_MX27VIS_AIC32X4=y
  Removed by commit 3fbb01fb583f ("ASoC: mx27vis-aic32x4: Remove unused
driver").
- CONFIG_SND_SOC_PHYCORE_AC97=y
  Removed by commit 440534a0ecfd ("ASoC: phycore-ac97: Remove unused
driver").
- CONFIG_SND_SOC_IMX_MC13783=y
  Removed by commit 83e7e2278680 ("ASoC: imx-mc13783: Remove unused
driver").

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
Changes in v2:
- Replaced wrong i.MX5/6 reference in commit description.
  (Reported-by: Fabio Estevam <festevam@gmail.com>)
---
 arch/arm/configs/imx_v4_v5_defconfig | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm/configs/imx_v4_v5_defconfig b/arch/arm/configs/imx_v4_v5_defconfig
index 875c8cdbada7..9139d1784c70 100644
--- a/arch/arm/configs/imx_v4_v5_defconfig
+++ b/arch/arm/configs/imx_v4_v5_defconfig
@@ -29,9 +29,6 @@ CONFIG_INET=y
 CONFIG_IP_MULTICAST=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_INET_DIAG is not set
 # CONFIG_IPV6 is not set
 CONFIG_NETFILTER=y
@@ -58,11 +55,9 @@ CONFIG_BLK_DEV_SD=y
 CONFIG_ATA=y
 CONFIG_PATA_IMX=y
 CONFIG_NETDEVICES=y
-CONFIG_CS89x0=y
 CONFIG_CS89x0_PLATFORM=y
 CONFIG_DM9000=y
 CONFIG_SMC91X=y
-CONFIG_SMC911X=y
 CONFIG_SMSC911X=y
 CONFIG_SMSC_PHY=y
 CONFIG_INPUT_EVDEV=y
@@ -78,6 +73,7 @@ CONFIG_SERIAL_8250=m
 CONFIG_SERIAL_IMX=y
 CONFIG_SERIAL_IMX_CONSOLE=y
 # CONFIG_HW_RANDOM is not set
+CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_IMX=y
 CONFIG_SPI=y
@@ -100,12 +96,12 @@ CONFIG_REGULATOR_GPIO=y
 CONFIG_REGULATOR_MC13783=y
 CONFIG_REGULATOR_MC13892=y
 CONFIG_MEDIA_SUPPORT=y
-CONFIG_MEDIA_CAMERA_SUPPORT=y
 CONFIG_V4L_PLATFORM_DRIVERS=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
 CONFIG_VIDEO_CODA=y
 CONFIG_FB=y
 CONFIG_FB_IMX=y
+CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_LCD_L4F00242T03=y
 CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
@@ -115,16 +111,12 @@ CONFIG_SND=y
 # CONFIG_SND_SPI is not set
 CONFIG_SND_SOC=y
 CONFIG_SND_IMX_SOC=y
-CONFIG_SND_SOC_MX27VIS_AIC32X4=y
-CONFIG_SND_SOC_PHYCORE_AC97=y
 CONFIG_SND_SOC_EUKREA_TLV320=y
-CONFIG_SND_SOC_IMX_MC13783=y
 CONFIG_SND_SOC_FSL_ASOC_CARD=y
 CONFIG_SND_SOC_SGTL5000=y
 CONFIG_USB_HID=m
 CONFIG_USB=y
 CONFIG_USB_EHCI_HCD=y
-CONFIG_USB_EHCI_MXC=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_CHIPIDEA=y
 CONFIG_USB_CHIPIDEA_UDC=y

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20260101-armv45defconfig-16baf2b1269c

Best regards,
-- 
Josua Mayer <josua@solid-run.com>


