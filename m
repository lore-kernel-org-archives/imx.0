Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013007.outbound.protection.outlook.com [40.107.162.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5279521D3F2
	for <imx@lists.linux.dev>; Thu, 18 Dec 2025 06:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766040494; cv=fail; b=ss0Iadh4pQ6iCKMtu8uLzb78AcGvqbDnwfcE55xZh7BDcVkcnOuzZ0Xv315ptzjUmPqDAuIBB8+KKARo1mOVrTaHQcdqktrm3PFz+HGPV7PPZ3FLmayu0Iyy07Mk/3ADqr26T2xUHDrl+URGS0BfYIfq+Uxub5HLPne17GOjPPc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766040494; c=relaxed/simple;
	bh=4IUW24SqukAYNBjhb7oZQPmdvD4bJWBM4qbgC5YRIx0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=uIQkVyJZ1bMkAu0rg3R5D/Ppp0bY3lha+X45UIJ4VB8/WLWC+Mo7fveX5DxddToqJWP0kEScVhKW1GOn8FMpIvGq0xR7F/Tw6KQ9gnekrZMhI2pGxrV1PCu82ebqCfQWgG8EEwoj7LP5EwVrRGphUSDXAozgOONwPHNlzG7De2s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Kq+tvGc+; arc=fail smtp.client-ip=40.107.162.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Kq+tvGc+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ad3nuN7AJH9izB6iz5Ud8d0jYUbki4M1H7WZMoxj+5yI4Pt5Lhjaz/NlmsOI6dCdfU7jXYeZ+lEpPnJJkB/5JrO9YbuBN0/52V1Mo5HDI/wiz+m03Xiiomqx7jf1uedu/lWCKzD6EKHy/1B46deNibwlsUdDup6EiQ1GC3bimmxAlIcN7Qr+DuVEdcWtjWUZWY8k4VU7xKApC7+n+9ccY6v2Q+oCgfRlBRqMpPWxd9P1uVYJ2i8SlNZenuLCU0rrSBdZ/bHYBNEd0ksPMfD50H4h/i6U0VOzDfgkO72A3ASOzuJEKxIaSYd/lijEy+hM581K3P5DN5/YrtP2A2ZPNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qR/ZU2M65lCz1sLo5f0c4o2VWIfZ3XIGBXTmrY6+Ac4=;
 b=b5O/LUxFfwfAuwxsq7RoFHXzRgTTnxgeIg5R751rU0epiiyRPBdViMl66Vm/IwMPzDjGOi6FTgAsximE+2el0yVCoZlPRPyrdtkR9clVcHmxDxFmfUR/206+HkqkxUvNaFyJo+zg0/xRW/9NyC7oQ5zEW0o1kZWHcNtZvv9PpY2ycBQSE1Iprdbw4m9c1eSIKx4Jy8JrHQdX4/5YedGo6YC4aD0k//ZI0579JMVUnJ3ScPE1w/gaLYnGHa7WUShDP1f8p6BuRJhH5UwshNLu/85dTzK8c2I5wcu6pS7SkDt379kWZTjphCnxwdEROYm2WYrwDD2cpUlTt0HqkOsf4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qR/ZU2M65lCz1sLo5f0c4o2VWIfZ3XIGBXTmrY6+Ac4=;
 b=Kq+tvGc+WmSxWO7Mwjl++wfOy8nmF1gtf0kayqFUu1T7/ae9ncyyl0RkxkgM0dj/v+h+c6wdOW5brpdYwxJf8ZCAqmf0PUuQxM8t9j3NAB+mZncpDJi0/TmVo+vyJeO3skR7PG1QO7dD4XK6e6ZTbnhoMXEgC7xt2aylzOZ1Q28d87QG+ZPM+RlNOdJSe+mvg3S6OZEJGkJVItEIkFgjKSvZJ1Y9X3Cc/hsMDhMC7fMqXaiRFeCi2MCrc2WuX77U+SUblYYVtA/eu0ZyK72HxX5VG4xhpZz771Nn7og0iFoUX15PDGT9oFoAD8i2plMUKQfYWDJ1qsFCE/ePq7++Vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8599.eurprd04.prod.outlook.com (2603:10a6:10:2da::7)
 by DBBPR04MB7756.eurprd04.prod.outlook.com (2603:10a6:10:1e3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 06:48:04 +0000
Received: from DU2PR04MB8599.eurprd04.prod.outlook.com
 ([fe80::c32a:2bd1:a6c0:601]) by DU2PR04MB8599.eurprd04.prod.outlook.com
 ([fe80::c32a:2bd1:a6c0:601%6]) with mapi id 15.20.9434.001; Thu, 18 Dec 2025
 06:48:04 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Thu, 18 Dec 2025 12:16:27 +0530
Subject: [PATCH v22 4/7] firmware: imx: device context dedicated to priv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-imx-se-if-v22-4-07418c872509@nxp.com>
References: <20251218-imx-se-if-v22-0-07418c872509@nxp.com>
In-Reply-To: <20251218-imx-se-if-v22-0-07418c872509@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766040412; l=11122;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=4IUW24SqukAYNBjhb7oZQPmdvD4bJWBM4qbgC5YRIx0=;
 b=Kwfq+eIZ6l/3RdMrJr9Px80hgplSbJjIxRdFL6yv5uzGKb9qz1Bo4Rabgc/PPbzEE9d6SOCNH
 R6oTIZcorsgALzyY5kP6t1U0VdkMkw14OesRdoZQy5v7V8camKy78vQ
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI2PR02CA0024.apcprd02.prod.outlook.com
 (2603:1096:4:195::18) To DU2PR04MB8599.eurprd04.prod.outlook.com
 (2603:10a6:10:2da::7)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8599:EE_|DBBPR04MB7756:EE_
X-MS-Office365-Filtering-Correlation-Id: bb1bbcf5-1a5a-45d4-8ab5-08de3e0164c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|19092799006|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VGxtWmJTbWZwcmhWTFg5aXNYVExFSkltWGF0MDIwMXROSDFhMEdwdjFFNjBW?=
 =?utf-8?B?NjFicmNDdDdEWkd5N1JaNUNKNUY4T0FhTGgxY0Y4RXRFRzhMaGlZckhhTHNm?=
 =?utf-8?B?Ym05N240aURjbUZxYk9DZFhXVmI5NFJLcmVtMVFoRzRmYXNHU3ZKa1RxL2p2?=
 =?utf-8?B?QnE5bzEweFU2NUFITmN2cGtOa2V0RGZKV05Kb1gvNHhwSjlZMG4xYXVVMjVK?=
 =?utf-8?B?SEVJTDlHTEtjUnhCZHNjcXJxQitiMS9wMzVQOURoaGJyckRmWGFHb0toS1pW?=
 =?utf-8?B?dUZKTHZxZ0t3T2lNOWo0c1dtWGdwVzV0QWdmVFpXajEvNG55ZmJNUlN4SXhW?=
 =?utf-8?B?M3VVQitFTFg0UmtVL1RNUWlyZEJEUG9MZ1pLdUVNU2RCaEVhNk44WFNva2Ix?=
 =?utf-8?B?c210YnlvQ0JKWndLRTVCRTZtdTFVV3ZydG1Rd0VkcGpoMFp3UitSWG9EOXY1?=
 =?utf-8?B?dUFDTGE1SUhtalhMR2h4MVlrUDQ0aUdVMVlGQnRBNDlQMjJIU3l5emVqVzZy?=
 =?utf-8?B?dFJwY0tnOXFzUXZ4VnF1RTlnSDJiSjg5YlFnRkRmMFgyeEpMUjJ3azVvamFp?=
 =?utf-8?B?Z1h6RFh5WVlLTVdjOEZCUXJwT0RoQ1cwT0JFOXovSWhLdHpzYnhRK1FYSkcz?=
 =?utf-8?B?Q25XdjJtRyt0V2ZSZ2JpNVh3VU1zbUxkVnpIUWZvMXFtbnhCemJpZFpBc2s3?=
 =?utf-8?B?MURjWDhkQVh2R1E4T05jZnFRSlc2UUl0TiszWm91V0JuN084S3kzL0NzWFZq?=
 =?utf-8?B?Z0xYaXRYL1l0aUozOFJ2NGt1V2tGMCtleUZvM1ROTkp4VlR1bmk2ZG5BYk94?=
 =?utf-8?B?M0lTUmRndVNvSFhPOEN2ZkRoTnVGd25USW9vNDRScVFKNmRNU2dyRnRmcVFZ?=
 =?utf-8?B?VWNVd0RTZjB6MlZRbDdOanArUlpPTmJhQjdDWGFKTDh3UUF4Y3BBWWhxdFpq?=
 =?utf-8?B?U3p1N3RuZVo1MTBvUkxrbCs5N2w2dDU5TEswSnpGVWxuakRYU2s3U01xbHRV?=
 =?utf-8?B?Z1dSMFRHNW9QODFLSFFnTlpBRXNJNVdESS92cTJycng4TDgyeDUwVGpWb2FW?=
 =?utf-8?B?RHBQRHlSKytKRHBvZm00WHdVdjFHNDlWdGttanNzcHVGUm9KVkhXR2p5bWtR?=
 =?utf-8?B?ZmdMR05BdkpndjZMemdFRFhkNERSS1BvQjV5cGVva2hjNVBLajJBRXI2eXRG?=
 =?utf-8?B?bE9oaXcrU01YZ3R1alpTM2MrRW5XRWdCYlNxWVRHZ0ZuVzFIRHBiS2tNNDh3?=
 =?utf-8?B?MWFrS2RxUXgzN29iRUpZRVl6cGFCYVNzMWhLZWZEdGVWcEg0MVYreEwwRjVC?=
 =?utf-8?B?c2l5UlV1c3YvYjdWMVJrY1JqM2tmN245ckRueDNoNkRkZXRjZEsyTkxvQWFB?=
 =?utf-8?B?WDNqOFVzQUt6Q3VPTVllczNwMFk0ck8vQ2Nyc2RFcnd4M00yWlNPcmN6alE0?=
 =?utf-8?B?WGF0b1NUb1huWGJNVmpZUm8yZXVXNmp1WWJhUUtIVVB3MzZxelVFMHhzcXZt?=
 =?utf-8?B?NTh4S2UvZGw1dWtCdzZUcEkwdnpJQlhab2VEWkJ2RCtjM1g1aWZtU2t4aTRZ?=
 =?utf-8?B?L3JzMC9kZE5lM0U5bzBQZmlvWW8ycGxKNXdBMmxnVm9ncCtPZldVT21NVnRx?=
 =?utf-8?B?dFg3T2dvT1A0UVpWM2JWSU5BdVByQnhvTXEvNDZpc2hrSjN1VjhGemJmWW1T?=
 =?utf-8?B?UkZ4MDdPeks3K3htaGFZTExIdlcydkp5Lzc2M0xSN0lJODN3NGIyOE9lT3lO?=
 =?utf-8?B?MWVTZ0pMUUxIZkY3dEQzd25aVlU4UlJvL2lYU2RaQXY1ZHNmazlZSVI4aVhp?=
 =?utf-8?B?ckFvNlRtNWdkelpQNEhabVdQMUpRUlpvYTVFbDA3eHprRjdJS01ObFdYOVZO?=
 =?utf-8?B?M0xOVkdSaHR5eTc3M3ZvdmdNRis1eGNKMTJheGRCdExRTFJ1c1I4cWVZTGp1?=
 =?utf-8?B?aUdvaVF5cnhadlRWMUpjdmFHWUZpUnloTFlncDdqS2YvMHptV1dSMU5MN0ta?=
 =?utf-8?B?ZzRiS0tpdGo4UU53Y3d6MmVKRVg3L3p3K2FISzVXbTZZWGdXaEdJWWozbldG?=
 =?utf-8?Q?8hLzUU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8599.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(19092799006)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NmU4QXE4bXVoa1VNUFVLKzZSZ1NBVmZJMnRhVktISG9tODg3RWFGblNKMWxu?=
 =?utf-8?B?MWVVVTF2Rjl0Zk9QOWJjQ0x5cFdIR3RFQ0Z1eGxxU3IrVTJ3cFFUZTVJdGxM?=
 =?utf-8?B?UWViYkZqS0tBVndsVFkyc0UyY3hsQ1FkZkxEL0htb0trbk5ldmNwOElHNlVY?=
 =?utf-8?B?bDZhYzYyNHhVSmJFRTVnUmpnVnJRbkNHVENmU2xzbmJEVmEzcTRyamc4b2Vl?=
 =?utf-8?B?SVBUYkdWRDJpTG1YZDdiTGhoV3g3d0hOckVXWEVMUHorVGN3dVN5ZENzOXk3?=
 =?utf-8?B?Vm5sMmVUb1JzNFBKRWl1N1Iyc2JWVU5taUcyZkZIcjJ5V3ZMbGtUeVpDS3Nn?=
 =?utf-8?B?dUI1UkJMOU9XdnBRc1ErTnpIU2tGN3BuWDJwMnY4T3UxM21DRkJCR3VPam5j?=
 =?utf-8?B?SUtLWTdHeTZ5RlpKV1gxeldpcG93WUdKVzZHbk9EbXNGL1RXM0ZsUlRKTE83?=
 =?utf-8?B?ZjhXZ0Y0azZJWVdrbFBxRWdjWnFrTmIzdHZsTEdHc1Q3YjdEajg3Q0F4bnZu?=
 =?utf-8?B?ZlVubjl4V3FRRTNHNm44N3kyV3hKbTBFdy9zRHpBT0VRSEZqUWZ3NFY0cnRx?=
 =?utf-8?B?WGExZnlzUWk1bXduS3RuUzlnTjM4cUFhZGdscVhadXY1Y1M3RFJYanE1K25k?=
 =?utf-8?B?VGhaOGZQV1hqcFE0YmQ1VzUzdEoreWplN2kyanVPNXlxTmJkMVQvaE5WNkFl?=
 =?utf-8?B?NllXWEdLekVqZVFpbzVHZjI4TnoyWHN0NnR6M3VxUjEwWEh3TnV4djdHeTdG?=
 =?utf-8?B?VTcrOFF1ZEtXT0YyVlJhbHpNK1dPNzU5bnAyRHMwaVVUbTk1QisvMW1LME1T?=
 =?utf-8?B?eUpFdU1uYmRFRnpOa3ZYcDEySm15bURsR1Fyb1B2QlV5SWNsQlBsWUQ4ZzN3?=
 =?utf-8?B?cXEreFZNUzRlUWZYZERqSnhpUHFtZHVXNUllblZ3R0xqWUI0V2YxdjNkK0d6?=
 =?utf-8?B?Q095SGdNSVNjaHJJS3RtTm14bldETGJMMkZaTWpIUXpKUld6ekhQS3VhdnpN?=
 =?utf-8?B?N2xZS3JzV1ZYWVNOOUpsaXdaY2hudWpSSE0vVjM3aXN0RkxlQmxrYjU2Q0t6?=
 =?utf-8?B?akhFc2hDYVlOaUhsdnpPeWRJaVdxYzFJeVp2NDR1dVBDTktHT3Q2bzkzWlJx?=
 =?utf-8?B?RVM4SGhCZ1lERUJmbmJNNTZDTVJzQkt0TVJkbXhxOER3TWdWdnIzTEk3Ui9j?=
 =?utf-8?B?eE5WNWVMZGkxQ1luRWpSQkViM3hEMXRrbzczb3JmSm8yLzFuMWhyd21hY1lp?=
 =?utf-8?B?Y1BXMHdTZk5HTngreHJjWTRBS1FEYjJpOHRxbGI0UlArRWFzZCs3dkd2VkVK?=
 =?utf-8?B?VDRKd202NGw4MDBvQ1RvTVduZExId0QzU21YSVQ4VGc2YUU0SzBvR2RpckZL?=
 =?utf-8?B?cXhXK2dCVHNnVXNZVUU5WitvVno1YXIrUWFpeEFydmxBcm96T3Z2S0FtT3dT?=
 =?utf-8?B?SU0wWkQxQmpQMjU1NEdTRndPV2g2bDdDaXl1KzhQRnc0aDJDRUMwUWxuQ3hW?=
 =?utf-8?B?RUVqaW80ZWdMK2NuNDRncEtzVDk1RnFUVFZjeE13Q3BYQVFCMG1CQnRUejJm?=
 =?utf-8?B?ei9MeG1SMjByRkRyNGNtV3NtWTJ4RExFSC85RzEyVHZ3Mmo2TFZFdVoxQWl1?=
 =?utf-8?B?bGNzRUpySU5ZUnRRZG0xdGFIZHRJMWNQVkduMjNzVTV6azQvbDRlOE1JK1N0?=
 =?utf-8?B?a3ZzN0ROTVlYZml1dWxOVzVINFphMTdsNnRDdHRjS0x5QlN3dDE4R0RMVlo3?=
 =?utf-8?B?SDBWZHJOMkNWTzFUN3BMcE4wTXlFeCt2N3RrK1hWZUF1azNwUmdVcWdUVHc0?=
 =?utf-8?B?QUM4aEI0djF2ZkxFcVRoeXRBNkREZDM4b29vNUl0azJlaXAwUmRIbDMrb2s3?=
 =?utf-8?B?NzhNeFlVZ1pMQVNTMUtTT1p1SGVpWC9Ma2JJSE9zSUV5Q0ZYZWEzaW1DUlpn?=
 =?utf-8?B?Ris4RGYzbkNFOGtQYUZOQjBBdEtSeGVOTDRhRTNacXhEVDBLNTZOeWlQVEY5?=
 =?utf-8?B?eUNVL3J2WHZNbU0wYmw1TjlwdTY1UFkxYXdwb3NpOUU5akV3Zm5RRlVJTzFr?=
 =?utf-8?B?YWtqenJCVzNQTlNJbE4rNVNlRjlWQS9CYzRTcGdVTlpZUzNaK1phb2tmZVc4?=
 =?utf-8?Q?IQWF5hdxeV5k/mQphjmyRhWsl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb1bbcf5-1a5a-45d4-8ab5-08de3e0164c6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8599.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 06:48:04.1823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PFNyN9YfW8hjaZaqKYe7/XQyRA+t3I1PYI6oULkkwAsYhc9oJxSNJWBvBr+QzJFNNh4RPgjZ7PiDnXmFOctVlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7756

Add priv_dev_ctx to prepare enabling misc-device context based send-receive
path, to communicate with FW.

No functionality change.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/firmware/imx/ele_base_msg.c | 14 +++++-----
 drivers/firmware/imx/ele_common.c   | 51 +++++++++++++++++++++----------------
 drivers/firmware/imx/ele_common.h   |  8 +++---
 drivers/firmware/imx/se_ctrl.c      | 29 +++++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h      |  9 +++++++
 5 files changed, 78 insertions(+), 33 deletions(-)

diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index da50686786f2..475ba98be199 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -60,8 +60,8 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 	tx_msg->data[0] = upper_32_bits(get_info_addr);
 	tx_msg->data[1] = lower_32_bits(get_info_addr);
 	tx_msg->data[2] = sizeof(*s_info);
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_GET_INFO_REQ_MSG_SZ, rx_msg,
-			       ELE_GET_INFO_RSP_MSG_SZ);
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_GET_INFO_REQ_MSG_SZ,
+			       rx_msg, ELE_GET_INFO_RSP_MSG_SZ);
 	if (ret < 0)
 		goto exit;
 
@@ -109,8 +109,8 @@ int ele_ping(struct se_if_priv *priv)
 		return ret;
 	}
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_PING_REQ_SZ, rx_msg,
-			       ELE_PING_RSP_SZ);
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_PING_REQ_SZ,
+			       rx_msg, ELE_PING_RSP_SZ);
 	if (ret < 0)
 		return ret;
 
@@ -154,7 +154,7 @@ int ele_service_swap(struct se_if_priv *priv,
 	if (!tx_msg->data[4])
 		return -EINVAL;
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
 			       rx_msg, ELE_SERVICE_SWAP_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -199,7 +199,7 @@ int ele_fw_authenticate(struct se_if_priv *priv, phys_addr_t contnr_addr,
 	tx_msg->data[1] = upper_32_bits(contnr_addr);
 	tx_msg->data[2] = img_addr;
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
 			       ELE_FW_AUTH_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -239,7 +239,7 @@ int ele_debug_dump(struct se_if_priv *priv)
 	do {
 		memset(rx_msg, 0x0, ELE_DEBUG_DUMP_RSP_SZ);
 
-		ret = ele_msg_send_rcv(priv, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
+		ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
 				       rx_msg, ELE_DEBUG_DUMP_RSP_SZ);
 		if (ret < 0)
 			return ret;
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index a7150ff8e3b9..fcd0f561d72d 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -42,7 +42,7 @@ u32 se_get_msg_chksum(u32 *msg, u32 msg_len)
 	return chksum;
 }
 
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl)
 {
 	unsigned long timeout;
 	int ret;
@@ -52,8 +52,8 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
 
 		ret = wait_for_completion_interruptible_timeout(&se_clbk_hdl->done, timeout);
 		if (ret == -ERESTARTSYS) {
-			if (priv->waiting_rsp_clbk_hdl.rx_msg) {
-				priv->waiting_rsp_clbk_hdl.signal_rcvd = true;
+			if (dev_ctx->priv->waiting_rsp_clbk_hdl.dev_ctx) {
+				dev_ctx->priv->waiting_rsp_clbk_hdl.signal_rcvd = true;
 				continue;
 			}
 			ret = -EINTR;
@@ -66,7 +66,7 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
 	return ret;
 }
 
-int ele_msg_send(struct se_if_priv *priv,
+int ele_msg_send(struct se_if_device_ctx *dev_ctx,
 		 void *tx_msg,
 		 int tx_msg_sz)
 {
@@ -78,15 +78,16 @@ int ele_msg_send(struct se_if_priv *priv,
 	 * carried in the message.
 	 */
 	if (header->size << 2 != tx_msg_sz) {
-		dev_err(priv->dev,
-			"User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
-			*(u32 *)header, header->size << 2, tx_msg_sz);
+		dev_err(dev_ctx->priv->dev,
+			"%s: User buf hdr: 0x%x, sz mismatced with input-sz (%d != %d).",
+			dev_ctx->devname, *(u32 *)header, header->size << 2, tx_msg_sz);
 		return -EINVAL;
 	}
 
-	err = mbox_send_message(priv->tx_chan, tx_msg);
+	err = mbox_send_message(dev_ctx->priv->tx_chan, tx_msg);
 	if (err < 0) {
-		dev_err(priv->dev, "Error: mbox_send_message failure.\n");
+		dev_err(dev_ctx->priv->dev,
+			"%s: Error: mbox_send_message failure.", dev_ctx->devname);
 		return err;
 	}
 
@@ -94,27 +95,31 @@ int ele_msg_send(struct se_if_priv *priv,
 }
 
 /* API used for send/receive blocking call. */
-int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
-		     void *rx_msg, int exp_rx_msg_sz)
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
+		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz)
 {
+	struct se_if_priv *priv = dev_ctx->priv;
 	int err;
 
 	guard(mutex)(&priv->se_if_cmd_lock);
 
+	priv->waiting_rsp_clbk_hdl.dev_ctx = dev_ctx;
 	priv->waiting_rsp_clbk_hdl.rx_msg_sz = exp_rx_msg_sz;
 	priv->waiting_rsp_clbk_hdl.rx_msg = rx_msg;
 
-	err = ele_msg_send(priv, tx_msg, tx_msg_sz);
+	err = ele_msg_send(dev_ctx, tx_msg, tx_msg_sz);
 	if (err < 0)
 		return err;
 
-	err = ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
+	err = ele_msg_rcv(dev_ctx, &priv->waiting_rsp_clbk_hdl);
 
 	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
 		err = -EINTR;
 		priv->waiting_rsp_clbk_hdl.signal_rcvd = false;
-		dev_err(priv->dev, "Err[0x%x]:Interrupted by signal.\n", err);
+		dev_err(priv->dev, "%s: Err[0x%x]:Interrupted by signal.",
+			dev_ctx->devname, err);
 	}
+	priv->waiting_rsp_clbk_hdl.dev_ctx = NULL;
 
 	return err;
 }
@@ -159,8 +164,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 	/* Incoming command: wake up the receiver if any. */
 	if (header->tag == priv->if_defs->cmd_tag) {
 		se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
-		dev_dbg(dev, "Selecting cmd receiver for mesg header:0x%x.",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting cmd receiver:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname,  *(u32 *)header);
 
 		/*
 		 * Pre-allocated buffer of MAX_NVM_MSG_LEN
@@ -169,8 +174,9 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		 */
 		if (rx_msg_sz > MAX_NVM_MSG_LEN) {
 			dev_err(dev,
-				"CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header, rx_msg_sz, se_clbk_hdl->rx_msg_sz);
+				"%s: CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
+				se_clbk_hdl->dev_ctx->devname, *(u32 *)header,
+				rx_msg_sz, se_clbk_hdl->rx_msg_sz);
 
 			se_clbk_hdl->rx_msg_sz = MAX_NVM_MSG_LEN;
 		}
@@ -178,14 +184,15 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 
 	} else if (header->tag == priv->if_defs->rsp_tag) {
 		se_clbk_hdl = &priv->waiting_rsp_clbk_hdl;
-		dev_dbg(dev, "Selecting resp waiter for mesg header:0x%x.",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting resp waiter:%s for mesg header:0x%x.",
+			se_clbk_hdl->dev_ctx->devname, *(u32 *)header);
 
 		if (rx_msg_sz != se_clbk_hdl->rx_msg_sz &&
 		    check_hdr_exception_for_sz(priv, header)) {
 			dev_err(dev,
-				"Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header, rx_msg_sz, se_clbk_hdl->rx_msg_sz);
+				"%s: Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
+				se_clbk_hdl->dev_ctx->devname, *(u32 *)header,
+				rx_msg_sz, se_clbk_hdl->rx_msg_sz);
 
 			se_clbk_hdl->rx_msg_sz = min(rx_msg_sz, se_clbk_hdl->rx_msg_sz);
 		}
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
index 96e987ef6f88..5bac14439d7d 100644
--- a/drivers/firmware/imx/ele_common.h
+++ b/drivers/firmware/imx/ele_common.h
@@ -14,12 +14,12 @@
 
 u32 se_get_msg_chksum(u32 *msg, u32 msg_len);
 
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl);
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl);
 
-int ele_msg_send(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz);
+int ele_msg_send(struct se_if_device_ctx *dev_ctx, void *tx_msg, int tx_msg_sz);
 
-int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
-		     void *rx_msg, int exp_rx_msg_sz);
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
+		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz);
 
 void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg);
 
diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 1c91b4698465..63562a4d9a3e 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -203,6 +203,29 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
 	return 0;
 }
 
+static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
+				    struct se_if_device_ctx **new_dev_ctx)
+{
+	struct se_if_device_ctx *dev_ctx;
+	int ret = 0;
+
+	dev_ctx = devm_kzalloc(priv->dev, sizeof(*dev_ctx), GFP_KERNEL);
+
+	if (!dev_ctx)
+		return -ENOMEM;
+
+	dev_ctx->devname = devm_kasprintf(priv->dev, GFP_KERNEL, "%s0_ch%d",
+					  get_se_if_name(priv->if_defs->se_if_type),
+					  ch_id);
+	if (!dev_ctx->devname)
+		return -ENOMEM;
+
+	dev_ctx->priv = priv;
+	*new_dev_ctx = dev_ctx;
+
+	return ret;
+}
+
 /* interface for managed res to free a mailbox channel */
 static void if_mbox_free_channel(void *mbox_chan)
 {
@@ -325,6 +348,12 @@ static int se_if_probe(struct platform_device *pdev)
 					    "Failed to init reserved memory region.");
 	}
 
+	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed[0x%x] to create device contexts.",
+				     ret);
+
 	if (if_node->if_defs.se_if_type == SE_TYPE_ID_HSM) {
 		ret = get_se_soc_info(priv, se_info);
 		if (ret)
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
index b15c4022a46c..b5e7705e2f26 100644
--- a/drivers/firmware/imx/se_ctrl.h
+++ b/drivers/firmware/imx/se_ctrl.h
@@ -19,6 +19,7 @@
 #define MESSAGING_VERSION_7		0x7
 
 struct se_clbk_handle {
+	struct se_if_device_ctx *dev_ctx;
 	struct completion done;
 	bool signal_rcvd;
 	u32 rx_msg_sz;
@@ -36,6 +37,12 @@ struct se_imem_buf {
 	u32 state;
 };
 
+/* Private struct for each char device instance. */
+struct se_if_device_ctx {
+	struct se_if_priv *priv;
+	const char *devname;
+};
+
 /* Header of the messages exchange with the EdgeLock Enclave */
 struct se_msg_hdr {
 	u8 ver;
@@ -80,6 +87,8 @@ struct se_if_priv {
 
 	struct gen_pool *mem_pool;
 	const struct se_if_defines *if_defs;
+
+	struct se_if_device_ctx *priv_dev_ctx;
 };
 
 char *get_se_if_name(u8 se_if_id);

-- 
2.43.0

