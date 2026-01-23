Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011033.outbound.protection.outlook.com [40.107.130.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD902D3225
	for <imx@lists.linux.dev>; Fri, 23 Jan 2026 09:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769160114; cv=fail; b=esjYl/Mjthb4K1Ky+qH8YHHPgaculAkQjDQYdsZznsFXEmaJZ/mk/Hby57556krawh9+MkA6gwRn8EjrlBRF01pMH/7aOnpF0Gdh4V9HpUE3tnNw2XpQjfuTgGd3S7i31eYJ9Ws40OdY96KJNMk9bdXWxbKxTQRsv/qf0a2AJPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769160114; c=relaxed/simple;
	bh=yGVMq8D8woe/Mx9tuiKrAUYdf25mYMwhwG0juFyAXBs=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=mpGQniye+vJ9RJQ60WaR6IRZlk7I0+eZn40TKsM/t1b65lPxCxg/Bso59p/zl8uV5Bb+ACKKpNmr26bXo718WB01CkajYzRHU7j1y7TQuUOFhPlfEfqt4G6lhml4J0f7xyhDvPA0P1VLTivXlHvrIyX7PLO4ByTtS6mmQy5BrBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jEBhjTA2; arc=fail smtp.client-ip=40.107.130.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jEBhjTA2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ob2spziT+66LK9zgTjRoIw5uaI2qkrs6haO6YL1+yid25Fe5YuBtGFwKWpxTLsVSPhG24upf7YKWrlqh7/LI1XL2DMAcTQqeEZaIx+Xmrj3EYlCzmjhB2v7msjUwTaH3Up/padCtiJyZV+Dbq8dgssrAr5ZIuRc26XK/dbqeuaiJnkI1xs4sBJjdFxVJkYuAt6MhV07kMRikDeUK2L63VwPammbEaGMr+AoHo91o9bPRQa+lTB6IsM/8239rR5M1WD4PnJh8rJ0VkWK2aXEZMoaTOL5l4zc6JNpvY5eB59osxrJU3OrKqCuza0FIKxuBC1QHH9OVlJJf6mXt5ay/Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DdGV2q8VqSVtP4E9fSkJzN0ctdcn5f2zfgYJOWtRzJc=;
 b=HkqNMlJhCvPkDJf+VOX7Ru527SPlUSNw0nQt+N0OrmNIDPbCkTT9xVC69GAiBeeBox3FfCn5Lvmo83uyXYLrPGjNj6Xk2ESs5pQHPiY3mqEXDtxcHtorzyn+nUfCHEIOzPH1ax+MF7HFKuPNHU4uWgFbuNGWp2IjAqKnLPaFGOGKeHITQfwcWN9JGsCgY0sLCHM/4P00SAJPboRxa+rBawVg9oapqj96n75vmzAaN0B6qEMuOPr1qK9DFcecaVflih54btarr2sN+o903qJOSt80jlCgjX784H76V4zwKCuEvhtwAsKLvY0BD+u5X/019AyGUldzR+JqQ0TYz6U6xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdGV2q8VqSVtP4E9fSkJzN0ctdcn5f2zfgYJOWtRzJc=;
 b=jEBhjTA2TS6M75HbvQdG39QlssP87M+y1i357PGLUIqYGENqbc0bhUALV42s1qlDnp9lvddVeexN8XpD9rVJASmuczSj1thGxGYZP0+bYnCDLG1gPjxc05ty2LeQhPuUnIzHIuSmxcM51tDLpuWKqlwY7PctKTftelUWF96yqZ99rOW/tn1l0Bhpdpgu9IowRGpkEZUT567wrBwWdSbxLQt1qxbLLN9wfm+TVwXt3VDedgPbvE91VRv+p3mUqHNsY459OD7CLEJl7p9IaiER0sV80GbA699rv6LFwcqYnTC3wVljT9/DkFS/sTxekfabXEtlIWuWsBay0K/3YLlYPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB8282.eurprd04.prod.outlook.com (2603:10a6:10:24a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.10; Fri, 23 Jan
 2026 09:21:48 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%4]) with mapi id 15.20.9542.010; Fri, 23 Jan 2026
 09:21:48 +0000
From: Liu Ying <victor.liu@nxp.com>
Subject: [PATCH 0/3] drm/bridge: imx: A few fixes
Date: Fri, 23 Jan 2026 17:22:14 +0800
Message-Id: <20260123-imx8qxp-drm-bridge-fixes-v1-0-8bb85ada5866@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMY9c2kC/x2LQQqEMAwAvyI5b6AGrbJfkT3YNmoOupqCFMS/G
 zwOM3NBZhXO8K0uUD4ly38zqD8VxGXcZkZJxkCOvKuJUNbSH2XHpCsGlWTFJIUzptjFQK1vWuf
 B9l35FXYPv/t+AE5++dRqAAAA
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Liu Ying <victor.liu@nxp.com>
X-Mailer: b4 0.13.0
X-ClientProxiedBy: SG2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096::24) To
 AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DB9PR04MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: 4115adbb-dba4-4901-e2b2-08de5a60d5c3
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|52116014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?am5YT2trQzl0QUFRV0lBVU5ZUGpnQmk3UEFqT0Rjd1ArNW5hYzZOeXhHMHdv?=
 =?utf-8?B?cVBOdlJrQlQ0NVhZWFUzRFB6bHFtVWhoblU4N0FIV1NmeFZuYVVoS05zSXMw?=
 =?utf-8?B?ZVY2K0RxS0RPL3duWFdQcGdHRWxQb2M5VXhsNm1kb3lzVzNZYWNsSGVEUVRL?=
 =?utf-8?B?VzAvbnIzNENjMW0rWGZuNlBWa2c1c1ZOYWxudGJBdEtsdWhRUmhXRlBET2sw?=
 =?utf-8?B?dWNFOXBnRXNrVUMwajYvVCtXTlhZRnRxUDl1YjVDbGlocGVPVkpDdk52LzBO?=
 =?utf-8?B?L0FKNWRKdGk5ZXpBUWFpVVlzOXNaeUN5RFd3U0RXcDdLQVpXZFVjY0QyazAx?=
 =?utf-8?B?UnhFSkR0WkNDWU82UVNWSEZFQ3dyYURjaWpvWGdMSENIcmdXV1plc0F5Skds?=
 =?utf-8?B?L1VwU2JyNGpxNS9LSXlpaFViZDV6QVA4ZHdsWjUzWEd3NFppbnhXS0JZUHJl?=
 =?utf-8?B?YnpCNjd5MzdTcm5QNDFOd2NrdzZndi9Vd2Rqc21oVi9KeGZlanRKeFgvWmNG?=
 =?utf-8?B?M2lHZXdxRHFCNDZGUVljU21HWWM0K2Y4anY2ZFE1TjJ2UXFOYXBTeHNqeGFD?=
 =?utf-8?B?K0ZjTi9uTzV6QWl0TFFnSzZCZjR0L09jMnpRbExGc01vSFF6U0JlVEVjQmlH?=
 =?utf-8?B?cSthL1g5cTBoYS8xZHhFcU1SS2QwcVdCcE00Ykh4dkpMclNGN2g3SzE0bEtF?=
 =?utf-8?B?SzVMRkpUY0FJTE5meHlJQjhBcFdmSEs3MTY4T3A4YnFQTzFUUnJVTlZ3RWZ5?=
 =?utf-8?B?SkwrcVBkdjViUnFTUVVtamZGV1dTYnRTZUd0RjN1SmdvOW1uTXdTNThOVjJ4?=
 =?utf-8?B?RFFRdWZsTWtZSjAwR3hSbEFBQmlqTHVRK2NJUFN0SjQwakc4UEZVdzc4UWo1?=
 =?utf-8?B?L0QwVU54b0ZZWGN2eVNWS2R4L0xiWGJEcWxSN3U3eXIyU2xGSVh4K2NiUTl5?=
 =?utf-8?B?ZHdsc20xcUZSU1ZoZ2tKQkhlODJ0SEZvRlpTYURmK0lvY3Z6Y3JPb0NSWkFn?=
 =?utf-8?B?OTRvMDVlOGZ5V0JWc3NHSW9CWVRzTWJValpKaEg1VEhreVZaRFBLUUxmMjUx?=
 =?utf-8?B?eG8vZkJkdTZEK2JMdnYyTXRhWTRsTm9KTWU4aW93bENiYXZBazVxOVpDWE0y?=
 =?utf-8?B?WEJqWHVsR21KRVZ3WEhxMVlQemI1VEVaMVQ2WnRZcEdURjFiQ1pIU1ZOU0U3?=
 =?utf-8?B?MmxzM2tIRTJoNVEvRE1KcGp6NlhnQ0YwSlNDQXIyeXErUWtSSnhySzJGZk1a?=
 =?utf-8?B?T1Fnb1VZOHAwTFk4eXA3MmV1ckl2REEwcnFhQkpiQ0hybzdKdjMzdGlzcWFq?=
 =?utf-8?B?YWNMT0VqWnljNm1maFp3ZDQ4cWRHc2hVRlV0Q3FzbVA1dnZpdVpKeWZGOWpY?=
 =?utf-8?B?LzJ4ZzVnamVkcEZyMUl3VHZabCtQNUhadTdaOXdQcHA3bjVoWXp4bDA2NVQ0?=
 =?utf-8?B?aGd1Q0dxSitlTi81blZCaDhueHdTNUdqSDhteXZXdnlSTWtYOGlDSUJCMWJL?=
 =?utf-8?B?ckp5S0F1cUwvUUFZOXFvckc2bEZURWUrYWVKbkNDdE94R0NTSDA1eU1xYzFz?=
 =?utf-8?B?SWFjMDB4WG10Y2YzWXFYbXRBVHkrV2dyQVRFRzRMOG5lMDdtUCtrZkpqVGp2?=
 =?utf-8?B?ek83RTRzYWRJalFMNXBFZkhxK3dRMEZkcHZWTXV2d0psRTJJWU9VUVVTbkdx?=
 =?utf-8?B?QzAwb3VuckJIWUljTFhUeU9DclJYTUhaVDRVTGhiWCt1SjM3RzdidWt6bHF2?=
 =?utf-8?B?eXlqR2VjanhQNEZTVFpBVkRDNU9lQmRkNjdFUkNsSUpuYkp5OC9jOEk5K0Y5?=
 =?utf-8?B?Z0NMb0w2OVZNdXR0cWZLNTlqMWlPeUtBRERmcmlTVXVrZWdkUll1bXd0aFZn?=
 =?utf-8?B?bzdsckRzMkhQeng2anVjN01mbmZjY2tuRHhlbnVwcW04dlFrTldZclhvMkRR?=
 =?utf-8?B?ZkJRdS93UjVhRk9ObTRteGV6aE1jQllIckN5c25yTStKRWF3bzYwWjJCbjNM?=
 =?utf-8?B?bXNLNWNJZ2liT2JoU3E0RFhjMnRBUC90Z3RPWVA4SW1mS3hXb2lMYmVQUnFR?=
 =?utf-8?B?VW9BZkVlRVlSUURPSXU2dDY5UDhWUncvaHhMdEh1NCs4U3p5d012eC9vcnVi?=
 =?utf-8?B?WWdjUFNKUDBzdUZJdXozS1IrVUhFK0ppcHUvTTVzTnlGYlI2ankyZzNNY00y?=
 =?utf-8?Q?Y1vy04NqEgMydYUFotUVj1Y+zDWp5Mpn6HrFJhWyYOK9?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(52116014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?NlQreXlXeU5WZ1N0WVFIeE1XeEZzYytqQUtnZENCMlN2bkJoUzZlZFVNYkpS?=
 =?utf-8?B?alhQcUtmZUFleFg2Mmt6RlBOUGhjUGh1ZWdTd2xVYzJNbmQ0QkxHYXFlUHRL?=
 =?utf-8?B?MkRkWlVReXh5NXU1YWd4d1lKcllBblpjUzNsTlA1Smp0UzI4cTVDdDM5b2or?=
 =?utf-8?B?ZUg1Zkc2Ny9wcnRkK0pNckE3dUhhd0hGNzNBb0hJLytUcHVjcVM0ckhRdjJk?=
 =?utf-8?B?YXpqYXcyeUp4QUt5dWZxTE5jREtuTUwxbmhOd3E5bmZVMVF2bjVtcjVCWE9M?=
 =?utf-8?B?V0pqNFh2TGp0ZkpMN1BhbllmS0pVNk1IRVErTlN0UlRKeDM5ZUZBZHp3SVgv?=
 =?utf-8?B?RHNZMTk4blNKMVV6ZGNoaGZtaHZiOXpDR0dxWTZOKzMzM1hCa2g3dk5rZ0pS?=
 =?utf-8?B?TVJmekJ4ZXkrbllZYW1xbFJseGhqcTVnMmVpYWg5Q1ZrZ21QbzltNEhFbVhS?=
 =?utf-8?B?R1BTTXFyditBWTZHU1QrQzIwRUVKd2FudE9ialF4d1pHK3hibDJQTUFVQXIr?=
 =?utf-8?B?TzFhUFgxc2FqNjViVWd0Yk5WYWFNblFpT015NEZTV2hWOHJzdG5mNFVqZ2Ft?=
 =?utf-8?B?UDhsaWtpNHZNdzY3aWZLQkRpQ0J2NWYwV2dGWXVNR1VpSXNheEJNVEkzc2pU?=
 =?utf-8?B?aW1CUHBhY2o4LytmUlY1U2xGQUVUYy9hR2w2amgzY1lEZVF6QytBRzg5NVBW?=
 =?utf-8?B?eHdDZlpheWE0cS9IM3g0TlEyRFh5ckU2UHJMTUZaWnNxSXVJSDhSRnVMS0sr?=
 =?utf-8?B?czNxRytVeXZteXdUMzd1VzR6aFVqdklVQ2VVQndvZjh2cnBVZWxFakttUG0z?=
 =?utf-8?B?YVVsSVpZZllHRHdIN1lpOE45SWJaQWxVRjl1b0RxS2lXMkhZWEF1WnZRc21p?=
 =?utf-8?B?R3laV2t2UXhYSGg3SmMxZnZ4eFFkRGNrTndPY2lMcC90OXRTbEhUdXFhMmpH?=
 =?utf-8?B?UzBFZ0Ryb0RaaXBkZnpMclA4RkR3NmE5UnJFeE0wejRTVC9pT2lwdXZ6Vmxl?=
 =?utf-8?B?YWZSZCt2S2lQOG14aThYelR0ZGF6MGhIWmpGR3VhSisyb1hqWnBCMGR3RnZu?=
 =?utf-8?B?SEZCYVFTc2Y2U0FwVkZQOHhxbERvWXp0dnNZU1hJNDFzR2ZOazF6RHNIRVVj?=
 =?utf-8?B?NUM3UmFsOVJzeVZrbjRDd2U1MGdRSUJKM2VNZFJpZkZJTVVaMXZWU0FudWo3?=
 =?utf-8?B?WTNIOWFnRmowUy9DY2dCejJ5Wmtod0oybUxmOVh3S2JrNlB3dFYvNGdaeGZC?=
 =?utf-8?B?aTM0anZJMXNVRHIvUHNleVBtTmFtaSs4eUZ2aGhUNTMxbmNWM21xdFR0Mytm?=
 =?utf-8?B?K2o5NmQ3aDdqcHppZ3I2S2FVUm9QdVFRV2Y5VzZYQkZsaUV0ejF1UksxRjV4?=
 =?utf-8?B?ZnRmc0d0a2RUWWsxNUxjdHQvTW05NkJCSk5SbmlwWWlXL1JUWnMraTJ0K1lQ?=
 =?utf-8?B?TDd1SHVvMTdGK3dWZ2NZU0JnQ2N5aVltZ1A5UjNFd0ZyMmpxWTN2TmlKU3Fx?=
 =?utf-8?B?NXQvRzJQUWkvSEhubko1Q2Zjc3pjV2hZeHFKSlZBc1RtYVRUMU1TNEJaa1or?=
 =?utf-8?B?a1lvWk0yc21xYnZoR3pWMUt4WENsY3lJTit0TVA1cmVRcGI5T3dzc0lkN3ly?=
 =?utf-8?B?SWU5am5OZEpFVytoc2RBdTkrdXd3bHRacVQ5MThidnNIWnJXd0g4VDcvRTVB?=
 =?utf-8?B?SnpYNTJoZXdvQ1RMK09iVm8zZlN6Z2VIa3IwSDRGZC9MeFZ1MVQ2eUQzcXpY?=
 =?utf-8?B?RUtaMXpoSDdMOTh4L1Fnd054UW1vaFovM1d6WDd4NXJtb29ZcGpLNDNzd294?=
 =?utf-8?B?WjFGWk4xd2RCZ25HNldKbExYZnBGK1Y3K0pIR3FMN0s2TTdDZVRHcXRyOE1Y?=
 =?utf-8?B?ZjlnMmZqWXJGRkdET0dja2p5VHJrYjM4VWlVVXZmcXRrSEVVcnkxTkxiSXpR?=
 =?utf-8?B?dTFwY1NrWlRaKy9tWi9FZDcvRmlOWmhWRXpKdXg4bE0wQjZQQ0xGbmJ6SFR4?=
 =?utf-8?B?dFp5VnNsWkNHbTFmY2lOWDdMdWZGM3FtSENYeTV2TVR3U3VobkRPQitYT2Jw?=
 =?utf-8?B?Y2o4TzQ4RHB2VHZZb3kxL2ZFTU9ZMG04cVhyQ1h0V1h6NmdySWJVblUvTk1Z?=
 =?utf-8?B?QWNPN0ppVGs3cDdycVZMTWJIbk5ENGVndjlaR2k4SWJSY1VyNUtWRU1JMm9x?=
 =?utf-8?B?M0lrazZSSEpMQzVUNTZqYytOT1JNUDRmL0tpZzhVNUtYMWZuMWJ0SGs0bTlZ?=
 =?utf-8?B?OUo1S041aE1qait0Y24zdVVNYVNSSmYweDJZNjIvdk1nekpETzEramFPd0cv?=
 =?utf-8?B?c2F4ejBqRTUvTzExODFOTzNVY1NIVk1Hd0M1MDBpUHEvVTlraGs5QT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4115adbb-dba4-4901-e2b2-08de5a60d5c3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 09:21:48.4402
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QjLye9wjJjQiwnvVllToTX2I0x5ZI8l18nj6iWkEYhBGo+5NT+OhBJuh74arI3ypyf+h24jUR6+SLREwm8AZ3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8282

Hi,

This patch series contains 3 bug fixes for i.MX8QXP DRM bridges.
Each patch fixes a NULL pointer dereference issue and stands alone.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
Liu Ying (3):
      drm/bridge: imx8qxp-ldb: Fix NULL pointer dereference in imx8qxp_ldb_bridge_destroy()
      drm/bridge: imx8qxp-pxl2dpi: Fix NULL pointer dereference in imx8qxp_pxl2dpi_bridge_destroy()
      drm/bridge: imx8qxp-pixel-combiner: Fix bailout for imx8qxp_pc_bridge_probe()

 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c            | 7 +++++--
 drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c | 2 +-
 drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c        | 3 +++
 3 files changed, 9 insertions(+), 3 deletions(-)
---
base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
change-id: 20260122-imx8qxp-drm-bridge-fixes-dc7cb2564506

Best regards,
-- 
Liu Ying <victor.liu@nxp.com>

