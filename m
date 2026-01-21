Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011025.outbound.protection.outlook.com [40.107.130.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B537E44BC92
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 08:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768985836; cv=fail; b=HAPSFgP6/WqG3LQQV4fY87eiD8HXAqiqWxEYXVsDuZJd44UWPt8y05KPpHvKqMOCi6jP0aKdwuuBeoFYF1OkIVPMsOgSz45Du3WhKsk/jpwRxuoihK317J8uH8tTSLzPEB+IwR5tK4Y5Ff5XuxzeJyTSCQyOSZ+y8ab7Vrc4l0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768985836; c=relaxed/simple;
	bh=OGudE4kvJKIcCujWbKnAIhMZmTCfUNyT1XKn//TVFvM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=mvEHnhQYja/MQ9yPTAjMPzeUjOY+2TTRcT74ETvS6ciGIdprAHaYjgWeW4Kl8LW3mNcUdF8rHQ1DclS2/zJM6XqWpkz9PAgLk9G/12YaDGRh/Y2p/S0qpXecneU/xEyZVlXYdPaHYwVRxvbphRpheoUWfdabMWNLmdVTqdw47Yk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=m3a8eaR1; arc=fail smtp.client-ip=40.107.130.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="m3a8eaR1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r79a9w2gZkyz8Q2CaNGTt95hLY/lmc1KdXSL27u8SwJKW3WHvvWQDaZwpgq90+nyIiuktHcqZExKb4kYNuDTufvR+gMmCK9j8qMOKYMaJWtDtBcaTdPKQUcInix27ZxfipGtcmP31QIF1sPzucwLmcSYrYjMVr4Zxa+uAXH40e2VdlaQffwcn77iq6tVcZtdKi3L9vGtqxE5Za3yhv+1wyca9wb0rAqTqJmdimUKs8S4hNvEjiQXSV1KjU9jUYiNN+6f4O0+PQ0tLTHEBXX005QG6sXenl8NcWlw5qug+dm3X+hGqtxjRYWwKAuyRkaRKYm5frMa1Aeo0711Hn6/KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHnyxSzA6BjHjJU5k0LoH5zEz6gkN1C0oKNPwGlk8AY=;
 b=neC4GjfrTjw/obLN2yOTGyPfX0SwvFEGn0UOh7t92g60HK9WVV/1SAy3zk+3CukuQwQleBm5kAdXpgHX4Het5CAUSCPnnZRHJeLRiGhJGMZFnkpO3KxGO9VKhrtGGnLeFRurdj2Jf6F/xWV13dpgRfD9bKwBNQGh7tHVuacEVIOLO7LASy2YQuMpZ8NPdBDU+uoDcg59TqpuvVGZL0o7tgWWjFDQAhA9V38e0uMbfxrSaVV9OScQKAnDAQdvDaqqDwPUP+s1uter9Dr466lPyJigngOrY8IlOrXjKaq7YCwdhvP4nqXzPImgOzFgaZe6s2ukAaNBYxnwnCfy+f6IrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uHnyxSzA6BjHjJU5k0LoH5zEz6gkN1C0oKNPwGlk8AY=;
 b=m3a8eaR1A8JwXblfOqcDmYtVTyZSgsfWLiKRWz1QcqxY6MKalKKQRMwdW9j23GquFqiW4C61gcLxZ6UYbxHGMK+WYoRCHNq5DoYi3CAc6ByV29hwlcXXK3W7ELacRBZ6bWTXM6ZNP/Csmk6aXGkc1M+Wyucjt09/n4pBTE81eG0SmBodRylEkuDVMV0gxM8DeCJsrCe3Xwh0zUSX+lrHmtvowT9iOnvJEOXueC46rN/ekyQ1AbuZ34y2OmsXzODtrU5PDvl+KQwl21mrdyANMcqg3HB2JGhdPPJqE6TlpkL+NBPQYE+uoZXLQwo/toj2wd3LZi8gfhjMtJQA5Wp+sw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by AM9PR04MB7492.eurprd04.prod.outlook.com (2603:10a6:20b:282::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Wed, 21 Jan
 2026 08:57:10 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::54cd:4aab:dc5c:6da1]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::54cd:4aab:dc5c:6da1%6]) with mapi id 15.20.9520.003; Wed, 21 Jan 2026
 08:57:10 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Wed, 21 Jan 2026 14:25:32 +0530
Subject: [PATCH v24 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-imx-se-if-v24-1-c5222df51cc2@nxp.com>
References: <20260121-imx-se-if-v24-0-c5222df51cc2@nxp.com>
In-Reply-To: <20260121-imx-se-if-v24-0-c5222df51cc2@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768985744; l=7425;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=OGudE4kvJKIcCujWbKnAIhMZmTCfUNyT1XKn//TVFvM=;
 b=lorJsL/A5YwQyvj6/+LbTnoiLfGL2cU3PiOkLD/PmAOlXL+kdYjDpJN6kfyOQqYznJs4HxrSB
 8yOPZQuacj/CNnEUFandaWhZBWnzoDwpNWIpqhC9c8U/CQ+utZR2oy6
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SI1PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::12) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|AM9PR04MB7492:EE_
X-MS-Office365-Filtering-Correlation-Id: 037ad54d-6b76-4254-5848-08de58cb0fdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cGpueWpPSDZUTGJWS00zR1NSeTFXcHo3TVQxdUVSMTB2NmhEdGtRS0xoNnIv?=
 =?utf-8?B?NVJnRmt1RlpyZjhhRlA3MkNTY1htbVhDcFpMR2wzbWtJSy9FQ3M3VHBzOVln?=
 =?utf-8?B?eHFNdEZzbWlCYnF4dFk4eVdPS0xCMGhOTEVxblcrTHFzV0o5dGhOZG1WYUpD?=
 =?utf-8?B?ZGtROXdNRlR0eGxmaHdTL0dUcE1SOUp3SVNBNERBa1RNZ0hBNU1ac0pyQWhP?=
 =?utf-8?B?TndFcENnbW5VemRaNFllUGhJSlNLdllCNmhnM25FL0ZLZ25LYWw1M1ZsY0ZX?=
 =?utf-8?B?cEExbjVnWHZua1k0Z1V3NlRyd0lRNUFIektiWHo3aGJYQ2ovYU5HaGNCeHRj?=
 =?utf-8?B?Rkwvb0t0WXBwQjlNRjVzS0Z3dVRaTXFTRkJsVGw3Mm5qNHJzaGJ0YlgrOTIz?=
 =?utf-8?B?cExLNTNpN2hPWnp4L0tLaHNkMW5rRkt3cDd3c2tVbjBCaWJZTzBhUEhVZkdq?=
 =?utf-8?B?SWo5SlMyVjhHNUJVclJSdmtxWHB1eGcwVEZ1ZU5KUGptSElyRFoxMFRjUmN4?=
 =?utf-8?B?aFY4V3VGcDdOR2pvSDhHaVk5cUlCVFRhSHBabWt3bEpOeFo3a2FOTjVGc1Bp?=
 =?utf-8?B?TzZKMnJTQ05xeGJRaDh2M0pBeDdmaUdVb2pDSGJjOTVQaHN3eStCeWJhd1pV?=
 =?utf-8?B?Z212OFo4VUorY2svazhqT0FBUmVhZFVibUdOMnFmL1VtUGhGZUxhVDZjNXVz?=
 =?utf-8?B?aDFTSURmNy90dnVzOVFla0RPTisyZUVGVzFsSWNPeEtUaXRtQkhRRFgrblAw?=
 =?utf-8?B?ejQxdmt2SzZrZEFCWkN2YnA3MThDUXhCRlNoSXd2M3lHbkQyMENhL0IwU3Zw?=
 =?utf-8?B?QjYyM056a1gxUk5mL0pzMDNpMWNza29seFlqYXA2WVZtRTlobU5XL1hLVks3?=
 =?utf-8?B?cUpOVURpL1FNd1JNS3UyRFRsTUIrWWViZXFXaW81TzdFZnpFcFcwdUp6dDFV?=
 =?utf-8?B?akJxcXRrbVJLMlBLS3V2VE1RamVxU0lhOUhpV0ZHaVZLNWZ4blJCU1BXZkU2?=
 =?utf-8?B?MTBxOC8yOTl0dytuTUtKT1YvVm1Yc1I2MGZ3bDFPRnkyb1R0UitxeUdNSXU0?=
 =?utf-8?B?cE56ODM0VGVaN0psK2N4VU9oZXFSTjZCMnZsNXZBUllBSjF5ZHZqY0sxK2kx?=
 =?utf-8?B?SHZqQUpEbjVFTVFvcnl1RW80UHVNY0lMZlBpbUExTzhPc011VEhyR1FBQUtn?=
 =?utf-8?B?ejlxQWVEN01xUFVveDk1QXhhM09pNUxnZmhzSFRrbThaQ0tUQjl0RTc0eUxZ?=
 =?utf-8?B?emhiMmQ3TWJNUytQWXllc1Job055Rnh1aHNrY0kvVEdOMXJWbUpmdnF6NitS?=
 =?utf-8?B?aEYxajQvRlNSZm9OVFRLU1VuWklIY21uNlRmTTUxVmREOFRMVk5GQ2RLNkZ3?=
 =?utf-8?B?NmJsZW1Jdm9CVm1lTkxWbzNvY01WS1hFeUZsUUFNQXpYV0dhUVhZOEZJMi8y?=
 =?utf-8?B?R0FUbUliU1I1V3AwOW9LRUphc1d1MHlUVEhxYTk3L0NmNWU2QlQ4N2dIdGl0?=
 =?utf-8?B?SzJsd0kxV2x2QjVvK0NUSlRzRU42bUNoTDJzT3dJcm9XSnRNam91bnBvMmkr?=
 =?utf-8?B?bVFvN3l5dGx3Ykl5QU0wc3JubmJ3RkQ0NlR0RWdKVUNXTlNtMG5mMnNoSE1Z?=
 =?utf-8?B?ZFc5endRUUZ1citVMUxWRDZ1TkJjZ24wb0g4czJrM1U4b2tuZUNqUXRWK05t?=
 =?utf-8?B?RzNsYmlLTzJLM1pTZ0hhZFI2Y2dJMy9WMytPYUVmMS9mTG4ydXhmaXJIdjNv?=
 =?utf-8?B?Y3hRQTFNMGZFWnVLU2ZaQlJkZ0NRL1RZNGNHT0NzNEV1U0pmeERBOTN0aXdI?=
 =?utf-8?B?VngvdDRkRm0yV3UxRFl5U0F3a3cycWNPWHd6NnZWMDEvWmpIMExaR3J1YTBZ?=
 =?utf-8?B?NUtxemkxeklEOU04OS9vN2trYUVocGlsK3dabittZ1RFNGpVS09laFQvaHps?=
 =?utf-8?B?ekZRNHRlQUNDSnBFWHh3dGE1a1lUMnBBRVpjSVFzMGpuem1NZXY2ZUQ4T3dL?=
 =?utf-8?B?Zi9pRExPRnZRYy8zOEhLN21xKzg5b3ZBeC9TY0IvR2JqYVlLZ2JHVFNyQmxk?=
 =?utf-8?B?ME5hQS9BQi9LbWlyWEdoL3hLcUFMVDloNDRKNWdndDJHWk16c0hSb0xNREdU?=
 =?utf-8?B?ZFFLTzRRanNqMXlYVm5QTXM1U2ZYeEZUMklzYWkxRG5GMnoyaURjYzRuVGV2?=
 =?utf-8?Q?DevZuTcmekNm7dH0CXuDePE=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzVyMHBheWgrSXRDTTV6VTd6L3VNOTF4QThJZzlvdEFPZ1RXMEtDZUFwcytZ?=
 =?utf-8?B?YXJmYTBlNVM5R2ZyVFFhYm1xbHlYQmdrc05WWXg1dnJDWDlFa3ZtZWdDZHRv?=
 =?utf-8?B?TmRQVHd2VFJ5cWZQZ3c2aEpTaTFCNi9LcGwyU2gyTnlBUzlrNy9vWUoyQXUr?=
 =?utf-8?B?SVFUcEZaVi92a09qZ01hV09FUGVWdXRLZ0NyZlVlWTFPVis2blF2Qk5TMnBn?=
 =?utf-8?B?L2Y5ZVF0WmUzcUVYRklSeForTExqMWN6d3cydWtwN0s2TFh0czh1NlYvOUti?=
 =?utf-8?B?S204aUQxRmpSTmJCMUp3VjN1a3huSjFLR3o2RVNwK01ZVUo2b0FVV05vdTBy?=
 =?utf-8?B?WjJSeEY0Smp0UzdNTk5OaXF2ZEg0ajE2UE1wbWlQN2xaTWl6dHJFTlhoWk1V?=
 =?utf-8?B?QzZ6QzlGenJXM3lSYjRReGJjVERFdGpZcDJROUJLclY0bWxQd2N1a1QzQVJT?=
 =?utf-8?B?aU93VXVySWQrbTc2d3phRFN3VjdXU3NUZ29hS0Y3R2U4VnFqM0dqYTVabHFJ?=
 =?utf-8?B?SzNJeWlSbWJpQS9BK1E1ZEZxZW4xN2dwZkFZTTVaS3JKU2dNUlB0MFkvZ3Iz?=
 =?utf-8?B?bjJlRVdDSzJ0dEE1WVVQc0djRVdyZ0FFR0c4Tk1yK1k1SnplNmpZdEhqZ09L?=
 =?utf-8?B?VWplL2xkQm5Sc1A0K085SUFBZ0J0UlErREhTT3dCQTBZR1I1VHAxc1pDdDVt?=
 =?utf-8?B?b0hZajY1a3ZqQncvSjJtaVVRVi9mSzJ0UE5SZTlnbUdvNE84a2wzaXlkbXdu?=
 =?utf-8?B?QkRId0ZJTlhIbVdIRGZ0TVkzQXhNOXcyRGRIOG51ZVVvRENGNzlMdnpoa2Fp?=
 =?utf-8?B?SzRkaEFSSTVhU1FvN1BoWGdpcHFQa253eHF1UHFzYTlQcXgrYmF3bkFudEwx?=
 =?utf-8?B?OGdYQW5ac2RsaGpESDhMV2ZrRm9qVFhRM09xVVFvaW5KMHB3NEttT3FmQXFs?=
 =?utf-8?B?Tllyanc1eVVadUppczQ3dXNCZElLcmhBRWsxL2orZXN0YVAzOWxQRkxIT3Y1?=
 =?utf-8?B?eUptVXFUNjVJTzR3ZGdhNnFHTWNFQW8yWDk5UnQvSS9CNnA0QnFId0QvVTVH?=
 =?utf-8?B?YnovWXpGaDJLZU9RczB5dVhKT3lzcDkybzhISTBSOHo1VHZhZGp0R3pNZHJH?=
 =?utf-8?B?RytkTEV5akhnaFJpWUNiY2docnIreDBoTTh3QjJzSVZyWllvOUdINU1BQkFn?=
 =?utf-8?B?djZQL3pxd2JtU2hnZlp6aWg0WEZhR0ZnemU2TUgrTzRHOW1rZW1oVEZveUhj?=
 =?utf-8?B?THlTVTFVeXJ4cEM2emR0bjlTTTJXbGo2eWtlWlJxTXQzVTFXTHdTbENMMnFa?=
 =?utf-8?B?cnFpcjBqVTRSY0tsT2tLdUhGQlM0L25UNHBqdllWM1dTQnJuekMzSENzYlhU?=
 =?utf-8?B?SXc2RW5CR0tpMUQ5c3NOZERSM2psQzZaaDJ5S1FoRkRQQ2QyVzRsdXdsLzdk?=
 =?utf-8?B?ejB6cC9ZZVdrbkZiWFhUR3ArMUVUMmZ3LzQvYi9KeXN2UGZmeXFhMEozM3NR?=
 =?utf-8?B?UGtXVllvSG1qY08xMFVURFRRZFdOUktlSVRoRzhtTWUvQW1vUUxqNnV2ejIy?=
 =?utf-8?B?dzZPZHVubkpEN1NDNm9rQzRwN2c4WFBvWm9SMkM3S3BIcWJOa3pVNytUbUdH?=
 =?utf-8?B?ZndmeVUyTmNIQk9UR2NDeWMzR1JIUEh1Rk1vM05uQzZ0empIRkEvTk52VXh0?=
 =?utf-8?B?OS8zV1VNWTV5VytKTFppc2hxSGZTL3JmRldvYmhyVGtHRGhBVHNvYkJ6NHJm?=
 =?utf-8?B?ZTAzdjRaUGFkbXUrMlViYnczRFcwMHU3L2Y4RUU5aUVqYXlWRm1rcGx0TWlK?=
 =?utf-8?B?TkVXNmZ0bVNIUDJTZnF3SElVSk81VHIzVklOY29va2EvS290UFlRUlhkeHB0?=
 =?utf-8?B?akd4b3BRWVpQZmgyVXJ1MDJnSVhZZVplRFJjTmg2KzdrbHdBenFiOHBXN2Ez?=
 =?utf-8?B?Rlk2cmpkRnhCTmliZENBV2dZNlVCSzY4dEZYOXJ3Wm5YU1MyTVlqbHByOVpG?=
 =?utf-8?B?OXhvS1o4eHRyb0FmYW5iZUdvbkc3RFllUy9FV2pESktuczVrS0VMTlBhZW84?=
 =?utf-8?B?Z1ZFamVtdzZjSG9QQ1ZsSDVLeVdaWUZaVDZBdXB1N3NXQUtTRjJDTEVSWXBD?=
 =?utf-8?B?ZlVkN29KbVhOd2dyNEJ3Z256dWtBZGJuNGVyNG5ESXQ5VUdzVWxBYmU2K2M3?=
 =?utf-8?B?UEN4QVFHYUlTTloxcXdmNFNhWE9PUjVnWEpDbTBkbmVneU1xbzAzTEhlYnls?=
 =?utf-8?B?UGxKRThraW9NUUFMOTl4elMzbkpKSUVSZU5VZEt5bDBOVi9SWTArYjhvN1RK?=
 =?utf-8?B?YzlTbjNXdXEvUmp6bTZ0YnNCdFd6Sm9odTNSakQ2ZGNnQ1c3Vmxydz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 037ad54d-6b76-4254-5848-08de58cb0fdd
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 08:57:10.4682
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QZ9y398PPrmkjE/OR4FR4JaRQg1nxV4kweB+maZk2VPEmnlvvUWkAzARrhEzvI2KIn9AeWOpMEKdSL0wGS/Ogg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7492

Documents i.MX SoC's Service layer and C_DEV driver for selected SoC(s)
that contains the NXP hardware IP(s) for Secure Enclaves(se) like:
- NXP EdgeLock Enclave on i.MX93 & i.MX8ULP

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
---
Changes from v21 to v22
- rename the se_fw.c to se_ctrl.c
---
 .../driver-api/firmware/other_interfaces.rst       | 131 +++++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Documentation/driver-api/firmware/other_interfaces.rst
index 06ac89adaafb..cbd425c5a11d 100644
--- a/Documentation/driver-api/firmware/other_interfaces.rst
+++ b/Documentation/driver-api/firmware/other_interfaces.rst
@@ -49,3 +49,134 @@ of the requests on to a secure monitor (EL3).
 
 .. kernel-doc:: drivers/firmware/stratix10-svc.c
    :export:
+
+NXP Secure Enclave Firmware Interface
+=====================================
+
+Introduction
+------------
+The NXP's i.MX HW IP like EdgeLock Enclave, V2X etc., creates an embedded secure
+enclave within the SoC boundary to enable features like
+ - Hardware Security Module (HSM)
+ - Security Hardware Extension (SHE)
+ - Vehicular to Anything (V2X)
+
+Each of the above feature is enabled through dedicated NXP H/W IP on the SoC.
+On a single SoC, multiple hardware IP (or can say more than one secure enclave)
+can exist.
+
+NXP SoCs enabled with the such secure enclaves(SEs) IPs are:
+i.MX93, i.MX8ULP
+
+To communicate with one or more co-existing SE(s) on SoC, there is/are dedicated
+messaging units(MU) per SE. Each co-existing SE can have one or multiple exclusive
+MUs, dedicated to itself. None of the MU is shared between two SEs. Communication
+of the MU is realized using the mailbox driver. Each secure enclave can cater to
+multiple clients by virtue of these exclusive MUs. Also, they can distinguish
+transactions originating from these clients based on the MU used and core security
+state. The communication between the clients and secure enclaves is in form of
+command/response mechanism. Each client could expose specific set of secure enclave
+features to the higher layers, based on the commands supported by that client. For
+example, the secure enclave could simultaneously support an OPTEE TA and Linux
+middleware as clients. Each of these clients can expose specific set of secure
+enclave features based on the command set supported by them.
+
+NXP Secure Enclave(SE) Interface
+--------------------------------
+Although MU(s) is/are not shared between SE(s). But for SoC like i.MX95 which has
+multiple SE(s) like HSM, V2X-HSM, V2X-SHE; all the SE(s) and their interfaces 'se-if'
+that is/are dedicated to a particular SE will be enumerated and provisioned using the
+single compatible node("fsl,imx95-se").
+
+Each 'se-if' comprise of twp layers:
+- (C_DEV Layer) User-Space software-access interface.
+- (Service Layer) OS-level software-access interface.
+
+::
+   +--------------------------------------------+
+   |            Character Device(C_DEV)         |
+   |                                            |
+   |   +---------+ +---------+     +---------+  |
+   |   | misc #1 | | misc #2 | ... | misc #n |  |
+   |   |  dev    | |  dev    |     | dev     |  |
+   |   +---------+ +---------+     +---------+  |
+   |        +-------------------------+         |
+   |        | Misc. Dev Synchr. Logic |         |
+   |        +-------------------------+         |
+   |                                            |
+   +--------------------------------------------+
+
+   +--------------------------------------------+
+   |               Service Layer                |
+   |                                            |
+   |      +-----------------------------+       |
+   |      | Message Serialization Logic |       |
+   |      +-----------------------------+       |
+   |          +---------------+                 |
+   |          |  imx-mailbox  |                 |
+   |          |   mailbox.c   |                 |
+   |          +---------------+                 |
+   |                                            |
+   +--------------------------------------------+
+
+- service layer:
+  This layer is responsible for ensuring the communication protocol that is defined
+  for communication with firmware.
+
+  FW Communication protocol ensures two things:
+  - Serializing the messages to be sent over an MU.
+
+  - FW can handle one command message at a time.
+
+- c_dev:
+  This layer offers character device contexts, created as '/dev/<se>_mux_chx'.
+  Using these multiple device contexts that are getting multiplexed over a single MU,
+  userspace application(s) can call fops like write/read to send the command message,
+  and read back the command response message to/from Firmware.
+  fops like read & write use the above defined service layer API(s) to communicate with
+  Firmware.
+
+  Misc-device(/dev/<se>_mux_chn) synchronization protocol:
+::
+
+                                Non-Secure               +   Secure
+                                                         |
+                                                         |
+                +-----------+      +-------------+       |
+                | se_ctrl.c +<---->+imx-mailbox.c|       |
+                |           |      |  mailbox.c  +<-->+------+    +------+
+                +-----+-----+      +-------------+    | MU X +<-->+ ELE |
+                      |                               +------+    +------+
+                      +----------------+                 |
+                      |                |                 |
+                      v                v                 |
+                  logical           logical              |
+                  receiver          waiter               |
+                     +                 +                 |
+                     |                 |                 |
+                     |                 |                 |
+                     |            +----+------+          |
+                     |            |           |          |
+                     |            |           |          |
+              device_ctx     device_ctx     device_ctx   |
+                                                         |
+                User 0        User 1       User Y        |
+                +------+      +------+     +------+      |
+                |misc.c|      |misc.c|     |misc.c|      |
+ kernel space   +------+      +------+     +------+      |
+                                                         |
+ +------------------------------------------------------ |
+                    |             |           |          |
+ userspace     /dev/ele_muXch0    |           |          |
+                          /dev/ele_muXch1     |          |
+                                        /dev/ele_muXchY  |
+                                                         |
+
+When a user sends a command to the firmware, it registers its device_ctx
+as waiter of a response from firmware.
+
+Enclave's Firmware owns the storage management, over Linux filesystem.
+For this c_dev provisions a dedicated slave device called "receiver".
+
+.. kernel-doc:: drivers/firmware/imx/se_ctrl.c
+   :export:

-- 
2.43.0

