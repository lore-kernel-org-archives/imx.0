Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2073.outbound.protection.outlook.com [40.107.21.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9661E515
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 13:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734615196; cv=fail; b=klovfmr9WzqCDddQkjUwBJSoxS0qOzJQ5BG2X8+5Jo1H01y4xFCjZTRt8W2q14MOaj4+Ky4uAM57AaFU/YO9zdV8hCyQIXm5BLlCkXchBr/Jft9k+qOIJY7ipiKrGQcP0gPyOl5KW7owZRg+bfmkio8R1kieeFOnuBmeFsXjyWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734615196; c=relaxed/simple;
	bh=heVTcdtxJKa9/YX4q5h7A1o7ntRI+1uq2DjnZWsR+vM=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=Tf81YHVWWQKfJFeg7pibUW0IcciN2lALbn3dPkWYtHiilw0Z41TUtZZTU7ECgFtnzw0VPIiy6ZuGG8uQi12GRFjublb5D/Opl/JpLP7PQSXgF6tOBbRD+NaVKxy1E/btAYs5Zv0ynU5QAf3vDRhob+wsWBZ2OC7CVxy0atH+Puo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=e7FgvPMo; arc=fail smtp.client-ip=40.107.21.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="e7FgvPMo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KoiGkvfVCL3uGdcBL1ChDZZ35Wp5ft1R2nWvxVRfX8TLZDS1z9QyL19XLUwzv5q8/8Aj0hNhZDR+zoykmUHclxC1rPpSEbg70jXMTWduHjUCKM2ndQb7t49T4fWoH3Yf+ubbF/IM0oLvD3htwyQ9mXQGsHHtmrhgA6Q9c7cQNznyNfoh3AxTo2cKoUF/TJzgMl590OFlZSH52vcxr9ugQ8qcdZ+ejUxh+oCkv2z2wQrpt7tAsMT79KN53HFLB/EtWpSKUHyhy3N+1iT3cB8jautIBFfBQN/fkWxJ/Nls1L/DMavxSFE6aaz+SKafX7CZRoNfQuWAnDc4Nd6rZfG7OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AzA2DkkmxINtSmW/2AaVBOTDA3GPt+oc7xct2akeIF0=;
 b=vjFXsImvyOs2Zuz3KZqw5zWJSCdfztSA7+aGY7T6g93lh6XnRcJ5QVZTcPzhlIY5xFWc7yQW0HKD9h4OGIc7fOosGQPZDSNmf2Jgz/6IqADuNzCykhJ5Yr2bzehEyHeGOGg7l5fagjl9W3v8xt7XPOCmojPkhPCZmMPfREKosas6FIPeqXUBx8+pcYZ9V4hSfh/S59niAfZE3SplHKcjTf5W0qZ49G3darZhVDzio15mIR2fuCFLuWE9sww/zSzMx9JA8LYr8I+btMQvuJ7lxRqgT62lDee4yPleXZ7ZoNy7ecNStdlnr6jRISETn63vsRgKAUTArLxkUsfNFn4M8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AzA2DkkmxINtSmW/2AaVBOTDA3GPt+oc7xct2akeIF0=;
 b=e7FgvPMo/BnGF1YcTepZzNkLZPraRs7ul+nU7XRFYdWOB7pqLAzrsMwb3p/apRMQiTWnjc5zPTgkxG3+13CNsyJHJo/icgJUJfvg+cqv1f7YSQwDuWlLWpQ9MyJxJvPbRdHQluH+pRF7hiiZXOvIEkRu3e87jDpf+tDIiZCajYugFGk3CUuQ0YM47/oPAH/9ZtBFjTDQF9qNNrp6w/QUw/EynUD/x1EQfAwMh99n/pB7h2GY9ZVCWpiRRcO6ynVz2NXf7xFoQ2oYutf5X/UzRwA1F3qwJZ9q4//K51eVFaoixlpQ0nMLHtBSyV8H4pQ9XvNj3OB5qwc4wFyW1O3nYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by DUZPR04MB9919.eurprd04.prod.outlook.com (2603:10a6:10:4d9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 13:33:09 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%4]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 13:33:09 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Subject: [PATCH v11 0/5] v11: firmware: imx: driver for NXP secure-enclave
Date: Fri, 20 Dec 2024 00:27:21 +0530
Message-Id: <20241220-imx-se-if-v11-0-0c7e65d7ae7b@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJFsZGcC/13SyU4DMQwG4FepcibIdnZOvAfikMlCc+iiGTQqq
 vruuBVikh5t5fvtRLmKpcytLOJtdxVzWdvSTkcuEF92Iu3j8avIlrkhCEiDASfb4SIX7lYZNYA
 xEFROVvD581xquzzCPj653rfl+zT/PLJXvHf/UhC6lBUlSHLJROt0QJvfj5fzazodxD1jpc6R6
 h2xY1Qz+hCNCqNTm7PYb70qdtFl8rlEk3Qcnd6cA9M7fZ9HGQAK+ohPe5rOIfXOsLM2uhBARe9
 odLZzNDjLrhSybCZPz3u6zQXQvXOPd6mZ4uQ0WT06/+8QcLifZxfQaOV5qMtqdKF3tneBXc2+R
 kigS5xGh7BBHBflbwByqmDBq5SCq5u83W6/YFxgdpsCAAA=
To: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734634652; l=21431;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=heVTcdtxJKa9/YX4q5h7A1o7ntRI+1uq2DjnZWsR+vM=;
 b=56YRaz1tiLBJTHiTXIbL+4NVHAytV9g1KKVT+FaEYCVJc+JN8F11rEGCaLSMtqDpkF/ax4UDK
 xiDKbG0wG9jC/5BTEwWwVHPLCSUwtLrqB0eqGpBt7n/vq8Fh4mxku/v
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SG2P153CA0012.APCP153.PROD.OUTLOOK.COM (2603:1096::22) To
 AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|DUZPR04MB9919:EE_
X-MS-Office365-Filtering-Correlation-Id: 050c3285-a55b-4890-d536-08dd2031ab32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cnBrdDQveVhlTjRCaXNURXl1LzY1QXd6aDhaSW9GNlpkeHdiZWllbWtQUUFq?=
 =?utf-8?B?N0JKM2JPZmU4TWFNTkxwNlYySnk1WnpmK3hGMDhVRzNkMFR1aE9mZldLcDB5?=
 =?utf-8?B?b1M3MlNwTEptOEZVNjByeGJDUGMrRUZ3RklLck5vZFpYSHF3YzdoZTBvYzJ6?=
 =?utf-8?B?citTNk03dW5NNEpvSVJKZzJtZVFZNVhESDFvZXdMRlRsei9rK3RFL0g5Y3Zj?=
 =?utf-8?B?eEM3M2w2Y2R2V3B2MTN4THVGckJtZm5Id2dTeWlQOHRZYjRmVzdIeFZ6WFRX?=
 =?utf-8?B?NE1vL0xqcFEzSkhvYkZyOXJyOGlHVE1IWjVISGhRY0xPQjFXN2ViKzVPWllp?=
 =?utf-8?B?NnpSaUhvY0hNWXJSNk0wL2hrUjFjVUF0U1g0dlVYcldjK1lzMlRrUTVpRGNq?=
 =?utf-8?B?SDhBSlFDM2tycktSQ0RNNUNhM2NEZ0Y1NFJ4aHplNHh1bDBzRkFXR01HanFh?=
 =?utf-8?B?NGFxUmJNa2ZnQk5HSmRlaFJiRnRVRy9ZZVRiNFJxdTZDdnVVSmZ4ZVpLdFZz?=
 =?utf-8?B?VGRrN1ZWQms0UjhWbzlRWjFqMTdRYzN1dFZoK3ZlTGdNODBnemwxYkF0QVJR?=
 =?utf-8?B?Z2pnME95NlB3dFM2UkcxbCtqeDJENXhtOWphZm5GblhxaWo4RVpDSmswZUht?=
 =?utf-8?B?K3pRb0JxSm9hc3VvMEdBWnFQS254LzJ1dFJtd2Z1TGZJTC9GVVFQTWFmaXhy?=
 =?utf-8?B?c2IwbkgreW5RdXRHOVFvcFRUWk1NdjZPOXQzMkJPQUJwV0RKN1RnU1pualM0?=
 =?utf-8?B?c1N3WGI5b1MvMDRqckhaOXJHZlY0OFBUYzhHRUtuaHpKWFNLNHQ0c0xzcUhL?=
 =?utf-8?B?cWxibjNHUmQrZnJuRTNBcjZjMDNRaXJNQk84QWZlRjlBK2VRNlZNb1B2V0VH?=
 =?utf-8?B?c2hIMXhjOEhxeHUwczVzdlpVbFcyWkZaVllEbFViSWtpeldhcXBnOTJUOGt0?=
 =?utf-8?B?VUI2MkI2d1hiaVE1MFRpRkJzdEt4d1o2L0RHOTdrTmVYbjNoRzYxa0FxZzk3?=
 =?utf-8?B?N2RxVUprTmJVTmpwQWxwazBJTVA5c3FDb1dIS0NqNDlyVkdzNXFybS81Vlpj?=
 =?utf-8?B?Qldsc2lIQTBnbDhlNENvSlZGQVBENmRyOWYrTE1EcEVUclpFYy9zSWVZQm54?=
 =?utf-8?B?ZERxdzJPVE52Zmh3OTJseXFkaFJhRmZnSzBuQ2c2WUVINWtRRlB5b0I2UmRx?=
 =?utf-8?B?QUJnWnQ3aGliTlhZU0t1U3ZZV29pTWx0emRJQnVMQ2l1R3lkT0ZRWlJTb0Vt?=
 =?utf-8?B?WFBPVEIyVVFsSWg3T29WNjNTaDd6MjN4N3BBQ2MwTE8wTkxxQ21QY1BjbUw2?=
 =?utf-8?B?RkxweTBnb2RXKzNpWSsyMVRKN2RaMmhJaThDNVBBTlVZTm90STdiRjVUdnVw?=
 =?utf-8?B?NWJvU3h5alFRTUdiOEk1cVJjdkZTRW9LNERCTlhqSklJeGNmWkZkeGg0bjZC?=
 =?utf-8?B?aXZYRkFjcUlkNnpGcmpTR3BkZDhDbEtrZkZ4QzhrTjduZTBZYXpsdUNGVmwr?=
 =?utf-8?B?ZjhXT1lVQWgybEF0SWdLcGJaSzNYUlRiVkdJMm5MUzZFNE5HVUw2cDFha1Jx?=
 =?utf-8?B?eGVLZnRKU05JUzVaVWlJcjdxWXlLRzdxL25CVUFVZWJobjlxS3lDYjRCbHAr?=
 =?utf-8?B?VEdwbjJ6MkUvOGpWN256RFBhcGNpR24yMy9xbEVjN1R4YVdQeGV4R1VNcy9I?=
 =?utf-8?B?SUNjeDRKMTcvclJzODdyVXgrQ3kvLzFRczRvZFJad0M2eklyWkNlK2tLdVl0?=
 =?utf-8?B?K2pNanJPWjlNd1o0U0hGUzF5c1U5NjBQeGlrUFQ2WU5HWTY4Z2tpWGl1SDFG?=
 =?utf-8?B?eFJxSDAxTHZOUWF0S0szUi85NVlXcE5RT2JmbjVXL21wUlV0LzVjclQrVExQ?=
 =?utf-8?B?OHp0SGduYnhxWkZQNzMrd202aG0yZWtHdGtocGZ0WWlRaG9LSjRZTXhSZ0RI?=
 =?utf-8?Q?iyJjpAVtn8p2UClVnIjy6nbus8bv+N7D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1BKM2doWTJiTFVDVk1QYys2Yjgvem9Dc2JmQng0RldZZHFUYStVL0tuMWMy?=
 =?utf-8?B?K0NKVHRRemdIc2FlR2JSZUU1WFNoM3RRazVKMUVhOFJnWkpMaysyNVFma3o0?=
 =?utf-8?B?anNPUThVdUFUS2xGWG1NUWhuQ2xrWGQ5Yk1CT3pOV1dkb2ZmTmk0eHFYU3o4?=
 =?utf-8?B?eDF1bDNxMENHSmVON09FcmFWWlR6c3h2MGxJejFZNlgrYmZOTTl4UDV6a2xk?=
 =?utf-8?B?eDZERmE3aXRwdTZWVWx5ekZmdkVwOXg1bVYyeXd1RHB0WWxkKzNHa0pucHRs?=
 =?utf-8?B?L0F2NkdlS3IxWUNpV2h2U2hCbDVuTmk5dlgxbTRob0toNTFWeXpOeHRBa0lz?=
 =?utf-8?B?Z2F5YTFVSXFqVXZKT2FWTXBZNkxRbnhic25hMU9SUFBqN04wSXFMTGhTNFpZ?=
 =?utf-8?B?aTkrRmJnbjRWWVZ6cXNZK3VYRzUrSGFHTFpNRkF5ei9BT2RESFhhQ0RjZWJk?=
 =?utf-8?B?VXo1ZEpaN2pGczJOWEdyaGxIcmVQcDByYi9UK3plb2dNa0hRWmZGZXBETlVD?=
 =?utf-8?B?akw2cXVRaWZaL3plU0tHTlFlL3l0MmhsQUEyci9XUVIvNGFUMmErNkJkT0tK?=
 =?utf-8?B?Y1JTZEZxVG5vbkEzbnZZRy9ObUMrcFI4MmxER1RuRTNYeVp1T1JoRU1zMnh0?=
 =?utf-8?B?emRsdG1FTU1SWHdWQnF3QzZocGVGQmtKQWN1SXV6MlExV3FJaEJ5clN3dmtz?=
 =?utf-8?B?QkwzMzJheEYzTnBsUGQ3NFNCWFN4bFZoeFdJcXc1emcxNEFNYXpFNU5Odnp2?=
 =?utf-8?B?cFFOZ0kzVFFSdVd2ei93MTJlN3A1amlYbS9pNXh2MG9vN3pXRXkrZS9yVWZH?=
 =?utf-8?B?UHNVOGxzdVUxNGZBMERiT05qWjZaQjdvUzZ0Z1k3ajVuSGtQbmVzOW9xVUhP?=
 =?utf-8?B?MWlMNDVOc1BGbXRPSnUzdHNRdjZQRGR5VHFHMEFLZEhCaVBzMzQ3TVEyVEhO?=
 =?utf-8?B?aUZMbTdHRnZIYjluWDQyWGJzaGlEVVBncUlFZXB3SmZkQndTU2NvZTFJNjlQ?=
 =?utf-8?B?eXVjb0p3bE9abXV0UWQ1cXJoS0tTRUZWRStvamp5Y0xPR2JRSnA0T1lUaHQz?=
 =?utf-8?B?bGxRbHZhY2lWczVjVmN5bk9DNndOVk9SSlRHYTA2eHg3TVZvaElpZVpob1lI?=
 =?utf-8?B?L1BnQi9iYmg4MGQrT2ZJZU5iNE84WE9UaDNaZmZ5MU9XcDZWTGxhYjh5OWNZ?=
 =?utf-8?B?dWdLcXNBN3pGRWVwVENaTkJiZ2pya0QrdlVrUmpMZGhnQmtzc3U5OFlDLzVO?=
 =?utf-8?B?aVcvQytZY3NkcStLUjVXTTkxNFArOVg5Y21qanIzNkZFMVM3TmdpMmN0M0hM?=
 =?utf-8?B?NXZOM2xnV0FMMWdOcm0vWGRnanZMUE1TdTB2SjZ3M0o4dHlOV3djR0IyL1JJ?=
 =?utf-8?B?VWlydGp6STBGVm1LT1E2MjRlTnNMdGZPMDRUT01ld01VNyt1KzZtajB4MFZG?=
 =?utf-8?B?ZGNDYkswU3BiN0pBenBCV0lrbmQ4RWh3RzVac2xpTDNPWmJrZm1FNEt6VUtj?=
 =?utf-8?B?UU05NjJsQUh4Q3pqN05EbVZCT2tiZ0hyeDhpWHZWSUgvdkd2NWpTWmNwM0tL?=
 =?utf-8?B?dDZQb0kzWlgxekk4Qkl0SndDa0NRRlV6a1B3VXlqeGZlN2ZTcUdWR1lCNi9j?=
 =?utf-8?B?c1BuZDFVQTVnR3ZIcFIzZ3ArRzZDTFpqNG9HWVVuYjBJa1F0Q3JyOFVuRWRG?=
 =?utf-8?B?eUIwYU1BbHpRc1VwOVllY1lKalRxSmd5RGZVS3RIcy9RTUxBQ2tiYnFJbUJh?=
 =?utf-8?B?OU16cGFBS3FTZGhBdTNKaE1OaUd0RW9Ka0NETldsL3FpVDJ6VTBPRDRWMUxi?=
 =?utf-8?B?SXdkVDhUSVg1WDRsQkVKUUVvZUVzUWlyazlYTnNLdTZsdWNCMGx4dWRKWXVJ?=
 =?utf-8?B?Nm9Lb0tRRFhPVlVyWm93eVNodmNSNTVWQkNFdGdMSDNpMmZZQnl2VXE0eklU?=
 =?utf-8?B?a2lqaEpuZmZwU1pUZUVuWXBKYU9EZkRjbXVnSnAyMUtlaFVnNEpsYVN4MTJ5?=
 =?utf-8?B?YzdmN1JiSnpPY2RuRndnWnZtUkZxbjdFQnhad1BrNDFIbm5vclBCL2dCSUkw?=
 =?utf-8?B?SitRUnFLUmY0bXlLSmJLTXA5Y2ZVRFprcUtWMmN3eklHSWREVDBiSnFrbVRJ?=
 =?utf-8?Q?g8c5koNxQR8q7otPnnfXncefB?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 050c3285-a55b-4890-d536-08dd2031ab32
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 13:33:09.0787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aS9sXv/CMb+WYhtCTX/RzPybRWwVHGkA1gexcrktm4/Z9LTFzW3F7cmYvdDApx9U821O+dhVX68GqJtbSBLWBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9919

Changes in v11:

5/5
- devname is constructed by concatinating get_se_if_name(se_if_id) & se_if_instance_id.
- ele_rcv_msg(), is updated to add the wait_interruptible_timeout for the non-NVM-Daemon message exchanges, such that in case of no response from FW,
  Linux donot hangs.
- added a new helper function get_se_if_name(), to return the secure-enclave interface owner's name string.
- added a new helper function get_se_soc_id(), to return the secure-enclave's SoC id.

4/5
- moved the se_if_node_info member "soc_register", to the struct "se_if_node_info_list"; as soc registration done once, not per interface.
- moved the se_if_node_info member "se_fetch_soc_info", to the struct "se_if_node_info_list"; as soc info fetching is done once, not per interface.
- Added two member variable se_if_id and se_if_instance_id to struct se_if_defines.
- removed the member "se_name" from struct "se_if_node_info". Rather, it will constructed by concatinating get_se_if_name(se_if_id) & se_if_instance_id.
- moved the static global variable "se_version", to the newly created structure "struct se_var_info".
- moved the member "struct se_fw_load_info load_fw" of "se_if_node_info_list", to the newly created structure "struct se_var_info".
- Replaced RUNTIME_PM_OPS with SET_SYSTEM_SLEEP_PM_OPS, in power-managment ops.

3/5
- No change

2/5
- No change

1/5
- No change

Reference:
- Link to v10: https://lore.kernel.org/r/20241104-imx-se-if-v10-0-bf06083cc97f@nxp.com

v10: firmware: imx: driver for NXP secure-enclave

Changes in v10:
5/5
- replaced the u8, u16, u32, u64, with __u8, __u16, __u32, __u64 in
  'include/uapi/linux/se_ioctl.h'.

4/5
- No change

3/5
- No change

2/5
- No change

1/5
- No change

Reference:
- Link to v9: https://lore.kernel.org/r/20241016-imx-se-if-v9-0-fd8fa0c04eab@nxp.com

Changes in v9:

4/5
- change se_if_remove function signature, required after rebase to v6.12-rc1.
- move the info->macros to a structure "struct se_if_defines if_defs".
- Removed "info" from "struct se_if_defines if_defs".
- Moved "mem_pool" from "struct se_if_defines if_defs" to "priv".
- Fetching "info" using container-of.

5/5
- Fetching "info" using container-of.
- Fixed issue reported by sparse.

Reference:
- Link to v8: https://lore.kernel.org/r/20241015-imx-se-if-v8-0-915438e267d3@nxp.com

Changes in v8:

5/5
- Remove the check for SE_IF_CTX_OPENED.
- replaced dev_ctx->priv-dev, priv->dev, whereever possible.
- func "if_misc_deregister" moved before func "init_device_context".
- func "init_device_context" before func "se_ioctl_cmd_snd_rcv_rsp_handler".
- func "se_if_fops_write" and "se_if_fops_read", are moved after func "se_ioctl_get_mu_info".
- non static functions "se_dev_ctx_cpy_out_data, se_dev_ctx_shared_mem_cleanup & init_device_context" are moved static and local scope.
- Removed back & forth between the two structs "struct se_if_device_ctx *dev_ctx" and "struct se_shared_mem_mgmt_info *se_shared_mem_mgmt"
- removed the NULL check for bdesc.
- fops_open, is corrected for acquiring the fops_lock.
- Fops_close, mutex unlock is removed. Infact check for waiting_rsp_clbk_hdl.dev_ctx, is removed.
- sema_init(&dev_ctx->fops_lock, 1);, replaced with Mutex.
- structure member se_notify, is removed.

4/5
- removed initializing err to zero in func ele_fetch_soc_info(),
- replaced 'return 0', with 'goto exit', if the condition (!priv->mem_pool) is true.
- replaced "struct *dev" with "struct se_if_priv *priv", in base_message API(s) and others.
- Created a separate structure "struct se_if_defines" to maintain interface's fixed values like cmd_tag, rsp_tag, success_tag etc.
- removed the macros "WORD_SZ", "SOC_VER_MASK", "DEFAULT_IMX_SOC_VER", "RESERVED_DMA_POOL".
- Added handling for "ctrl+c", by postponing the interrupt, till the response to the "command in flight" is received.
- Removed the mutext lock "se_if_lock".
- furnction prototype for "se_save_imem_state" and "se_restore_imem_state", is changed to pass "imem" by reference.
- Added a new structure "struct se_fw_load_info", dedicated to contain FW loading relevant info. It is a member of struct info_list.
- split "imem_mgmt_file_in_rfs" into two "prim_fw_nm_in_rfs" and "seco_fw_nm_in_rfs", to be part of "struct se_fw_load_info".
- moved the function "se_load_firmware" prior to func "if_mbox_free_channel".
- function "se_load_firmware" is updated to use "request_firmware", instead of "request_firmware_no_wait".
- function "se_load_firmware" is updated to load "primary" fw image, if the imem_state is not BAD. Then load the "secondary FW" image.
- Added a new mutex_lock in the function "se_load_firmware", for ensuring FW loading done once, when there are multiple application are in play.
- instead of "wait_queue_head_t wq", used "sruct completion".
- add devm_add_action with action as se_if_probe_cleanup.

Reference:
- Link to v7: https://lore.kernel.org/r/20240904-imx-se-if-v7-0-5afd2ab74264@nxp.com

Changes in v7:

5/5
- struct se_clbk_handle, is added with a member struct se_if_device_ctx *dev_ctx.
- func call to ele_miscdev_msg_rcv() & ele_miscdev_msg_send(), are removed.
- func se_ioctl_cmd_snd_rcv_rsp_handler(), is modified to remove the func call to ele_miscdev_msg_rcv() & ele_miscdev_msg_send()
- func se_ioctl_cmd_snd_rcv_rsp_handler is callig func ele_msg_send_rcv(), instead.
- Mutext "se_cmd_if_lock", handling is removed from this patch.
- func ele_miscdev_msg_send() is replaced with func ele_msg_send(), in fops_write.
- func ele_miscdev_msg_rcv() is replaced with func ele_msg_rcv(), in fops_read.
- fops_open is modified to create the new dev_ctx instance (using func init_device_context()), which is not registered as miscdev.
- Only one dev_ctx is registered as miscdev and its reference is stored in the struct se_if_priv, as priv_dev_ctx.
- Separate func cleanup_se_shared_mem() & func init_se_shared_mem(), for shared memory handling part of struct dev_ctx.
- Input param for func(s) ele_msg_rcv(), ele_msg_send() & ele_msg_send_rcv(), is replaced from struct se_if_priv to struct se_if_device_ctx.

4/5
- A new structure is defined name struct "se_clbk_handle", to contain members processed in mailbox call-back function.
- "struct se_if_priv" is modified to contain the two structures of "se_clbk_handle" - waiting_rsp_clbk_hdl & cmd_receiver_clbk_hdl.
- func ele_msg_rcv() is modified to take a new additional input reference param "struct se_clbk_handle *se_clbk_hdl".
- func ele_msg_send() is modified to take a new additional input tx_msg_sz.
- func ele_msg_send_rcv(), is modified to take 2 more inputs - tx_msg_sz & exp_rx_msg_sz.
- func se_val_rsp_hdr_n_status(), is modified to take input of rx_msg buffer, instead of header value, as input param.
- each caller of the func ele_msg_send_rcv(), is sending these two additional input params.
- func se_if_callback(), is modified to work on two structures of "se_clbk_handle" - waiting_rsp_clbk_hdl & cmd_receiver_clbk_hdl.
- Variable "max_dev_ctx", is removed from info & priv struture, as well its usage.
- New member variable "se_img_file_to_load", is added to structure "priv".
- Other member variables - rx_msg(ptr), rx_msg_sz, completion done & list of dev_ctxs, is removed from priv struture, along with their usage.
- func se_resume(), updated to wakeup the two "wq", part of "struct se_clbk_handle": priv->waiting_rsp_clbk_hdl & priv->cmd_receiver_clbk_hdl.

3/5
- Node name is changed from senclave-firmware@0 to "secure-enclave"

2/5
- Node name is changed to "secure-enclave".

Reference:
- Link to v6: https://lore.kernel.org/r/20240722-imx-se-if-v6-0-ee26a87b824a@nxp.com

Changes in v6:

5/5
- replaced scope_gaurd with gaurd.

4/5
- replaced scope_gaurd with gaurd.
- remove reading the regs property from dtb.
- Added NULL check for priv data fetched from device, as a sanity check, for ele_base_msg apis)

3/5
- replace firmware with senclave-firmware.

2/5
- replace firmware with senclave-firmware.
- drop description for mbox
- Replaced "items:" with maxItems:1 for "memory-region"
- Replaced "items:" with maxItems:1 for "sram"
- remove regs property.
- remove "$nodename"

Reference:
- Link to v5: https://lore.kernel.org/r/20240712-imx-se-if-v5-0-66a79903a872@nxp.com

Changes in v5:

2/5
- updated the description of mboxes
- updated the description & items for mbox-names.
- updated the description of memory-region
- move "additional properties: false" after allOf block.
- removed other example except one.

4/5
- Corrected the indentation in Kconfig.
- info members:mbox_tx_name & mbox_rx_name, are replaced with macros.

5/5
- Replaced "for  secure enclaves", with "for secure enclaves"
- Replaced "user space" with "userspace".
- End the line "[include]<linux/firmware/imx/ele_mu_ioctl.h>" with a period.

Reference:
- Link to v4: https://lore.kernel.org/r/20240705-imx-se-if-v4-0-52d000e18a1d@nxp.com

Changes in v4:

1/5
a. Removed - from EdgeLock Enclave.

b. Removed , after "Each of the above feature,"

c. replace "can exists" with "can exist".

d.
-messaging units(MU) per SE. Each co-existing 'se' can have one or multiple exclusive
-MU(s), dedicated to itself. None of the MU is shared between two SEs.
+messaging units(MU) per SE. Each co-existing SE can have one or multiple exclusive
+MUs, dedicated to itself. None of the MU is shared between two SEs.
 Communication of the MU is realized using the Linux mailbox driver.

e.
-All those SE interfaces 'se-if' that is/are dedicated to a particular SE, will be
-enumerated and provisioned under the very single 'SE' node.
+Although MU(s) is/are not shared between SE(s). But for SoC like i.MX95 which has
+multiple SE(s) like HSM, V2X-HSM, V2X-SHE; all the SE(s) and their interfaces 'se-if'
+that is/are dedicated to a particular SE will be enumerated and provisioned using the
+single compatible node("fsl,imx95-se").

f. Removed ",". Replaced for "Each 'se-if'," with "Each se-if'.

g. removed ","
-  This layer is responsible for ensuring the communication protocol, that is defined
+  This layer is responsible for ensuring the communication protocol that is defined

h. removed "-"
-  - FW can handle one command-message at a time.
+  - FW can handle one command message at a time.

i.
-  Using these multiple device contexts, that are getting multiplexed over a single MU,
-  user-space application(s) can call fops like write/read to send the command-message,
-  and read back the command-response-message to/from Firmware.
-  fops like read & write uses the above defined service layer API(s) to communicate with
+  Using these multiple device contexts that are getting multiplexed over a single MU,
+  userspace application(s) can call fops like write/read to send the command message,
+  and read back the command response message to/from Firmware.
+  fops like read & write use the above defined service layer API(s) to communicate with
   Firmware.

j. Uppercase for word "Linux".

2/5
a. Rephrased the description to remove list of phandles.

b. Moved required before allOf:
+required:
+  - compatible
+  - reg
+  - mboxes
+  - mbox-names
+
+additionalProperties: false
+
 allOf:

c. replaced not: required: with properties: <property-name>: false.
   # memory-region
-      not:
-        required:
-          - memory-region
+      properties:
+        memory-region: false

   # sram
-    else:
-      not:
-        required:
-          - sram

d. Reduced examples. keeping example of i.MX95.
e. node-name is changed to "firmware@<hex>"

3/5
- node name changed to "firmware@<hex>".

4/5
- used sizeof(*s_info)
- return early, rather than doing goto exit, in ele_get_info().
- Use upper_32_bits() and lower_32_bits()
- use rx_msg here instead of priv->rx_msg
- Moved the status check to validate_rsp_hdr. Rename the function to "se_val_rsp_hdr_n_status"
- typecasting removed header = (struct se_msg_hdr *) msg;
- Converted the API name with prefix imx_ele_* or imx_se_*, to ele_* and se_*, respectively.
- Removed the functions definition & declaration for: free_phybuf_mem_pool() & get_phybuf_mem_pool()
- removed the mbox_free_channel() calls from clean-up.
- Flag "priv->flags" is removed.
- Converted the int se_if_probe_cleanup() to void se_if_probe_cleanup().
- Replaced NULL initialization of structure members: priv->cmd_receiver_dev & priv->waiting_rsp_dev , with comments.
- Removed the function's declaration get_phy_buf_mem_pool1

5/5
Changes to Documentation/ABI/testing/se-cdev.
a. Removed "-" from "secure-enclave" and "file-descriptor".

b. Removed "-" from "shared-library"

c. Replaced "get" with "getting".

d. Added description for the new IOCTL "send command and receive command response"

e. Replaced "wakeup_intruptible" with "wait_event_interruptible"

f. Removed ";"

g. Removd "," from "mailbox_lock,"

h. Replaced "free" with "frees"

i. In mailbox callback function, checking the buffer size before
copying.

Reference:
- Link to v3: https://lore.kernel.org/r/20240617-imx-se-if-v3-0-a7d28dea5c4a@nxp.com

Changes in v3:
5/5:
- Initialize tx_msg with NULL.
- memdup_user() returns an error pointer, not NULL. correct it by adding check for err_ptr.
- new IOCTL is added to send & recieve the message.
- replaced the while loop till list is empty, with list_for_each_entry.
- replaced __list_del_entry, with list_del.
- Removed the dev_err message from copy to user.
- Removed the casting of void *.
- corrected the typcasting in copy to user.
- removed un-necessary goto statement.
- Removed dead code for clean-up of memory.
- Removed un-mapping of secured memory
- Passing se_if_priv structure to init_device_context.
- Updated the below check to replace io.length with round_up(io.length).
	if (shared_mem->size < shared_mem->pos|| io.length >= shared_mem->size - shared_mem->pos)
- Created a function to cleanup the list of shared memory buffers.
- Used list_for_each_entry_safe(). created a separate functions: se_dev_ctx_cpy_out_data() & se_dev_ctx_shared_mem_cleanup()

4/5
- Changed the compatible string to replace "-ele", to "-se".
- Declaration of imx_se_node_info, is done as const in the whole file
- Remove the unused macros from ele_base_msg.h
- Remove the function declaration get_phy_buf_mem_pool1, from the header file.
- Replace the use of dmam_alloc_coherent to dma_alloc_coherent
- Check for function pointer, before calling the fucntion pointer in imx_fetch_se_soc_info
- Removed the unused flag for SE_MU_IO_FLAGS_USE_SEC_MEM.
-  Removed the unused macros WORD_SZ
- instead of struct device *dev, struct se_if_priv *priv, is used as argument to the funtions:se_save_imem_state, se_restore_imem_state, imx_fetch_se_soc_info
- Removed ret from validate_rsp_hdr.
- changed the prefix of the funtion: plat_add_msg_crc and plat_fill_cmd_msg_hdr.
- indentation correction for info structures.
- remove the check for priv not null from se_if_probe_cleanup
- Removed the casting of void *.
- se_load_firmware function is corrected for not freeing the buffer when allocation fails.
- Checking if get_imx_se_node_info() can return NULL, in se_if_probe()
- imem.size has type u32. return value from se_save_imem_state() will be assigned to imem.size in case of success only.
- removed the flag un-setting in case of failure. priv->flags &= (~RESERVED_DMA_POOL);
- removed the function call for devm_of_platform_populate(dev);
- Checking for not-NULL,  before calling the funtion pointer se_fetch_soc_info.
- Removed the checking for reserved memory flag, before freeing up the reserved memory, in se_probe_if_cleanup.

3/5
- Changed the compatible string to replace "-ele", to "-se".

2/5
- to fix the warning error, replaced the "-ele" & "-v2x" in compatible string, to "-se".
- Added an example for ele@0 for compatible string "fsl,imx95-se"

Reference
- Link to v2: https://lore.kernel.org/r/20240523-imx-se-if-v2-0-5a6fd189a539@nxp.com

Changes in v2:

4/4
- Split this patch into two: 1. base driver & 2. Miscdev
- Initialize the return variable "err" as 0, before calling 'return err', in the file ele_common.c
- Fix the usage of un-iniitialized pointer variable, by initializing them with NULL, in ele_base_msg.c.
- Fix initializing the ret variable, to return the correct error code in case of issue.
- replaced dmam_alloc_coherent with dma_alloc_coherent.
- Replace the use of ELE_GET_INFO_READ_SZ, with sizeof(soc_info).
- Replaced -1 with -EPERM
- Removed the safety check on func-input param, in ele_get_info().
- fix the assigning data[1] with lower 32 address, rather than zero, for ele_fw_authenticate API.
- Correctly initializing the function's return error code, for file  ele_base_msg.c.
- replaced 'return' with 'goto'.
- Use length in bytes.
- Corrected the structure se_msg_hdr.
- Moved setting of rx_msg  to priv, into the function imx_ele_msg_send_rcv
- Will add lockdep_assert_held, to receive path, in v2.
- corrected the spacing at "ret  = validate_rsp_hdr"
- FIELD_GET() used for RES_STATUS
- Re-write the structure soc_info, matching the information provided in response to this api.
- The "|" goes to the end of the previous line.
- Moved the locking and unlocking of the command lock to the caller of the function.
- removed the safety check for device private data.
- Structure memory reference, used to read message header.
- In the interrupt call back function, remove assigning waiting_rsp_dev to NULL, in case of response message rcv from FW.
- do while removed.
- replaced BIT(1) for RESERVED_DMA_POOL, to BIT(0)
- The backslash is removed while assigning the file name with absolute path to structure variable.fw_name_in_rfs =.
- Update the 'if' condition by removing "idx < 0".
- mbox_request_channel_byname() uses a "char" for the name not a u8. Corrected.
- devm managed resources, are not cleaned now, in function se_probe_if_cleanup
- Used dev_err_probe().
- Used %pe to print error string.
- remove "__maybe_unused" for "struct platform_device *enum_plat_dev __maybe_unused;"
- used FIELD_GET(), for  RES_STATUS. Removed the use of MSG_TAG, MSG_COMMAND, MSG_SIZE, MSG_VER.
- Depricated the used of member of struct se_if_priv, bool no_dev_ctx_used;
- Moved the text explaing the synchronization logic via mutexes, from patch 1/4 to se_ctrl.h.
- removed the type casting of info_list = (struct imx_se_node_info_list *) device_get_match_data(dev->parent);
- Used static variable priv->soc_rev in the se_ctrl.c, replaced the following condition: if (info_list->soc_rev) to if (priv->soc_rev) for checking if this flow is already executed or not.
- imx_fetch_soc_info will return failure if the get_info function fails.
- Removed devm_free from imx_fetch_soc_info too.

3/3
- Made changes to move all the properties to parent node, without any child node.

2/4
- Use Hex pattern string.
- Move the properties to parent node, with no child node.
- Add i.MX95-ele to compatible nodes to fix the warning "/example-2/v2x: failed to match any schema with compatible: ['fsl,imx95-v2x']"

1/1
- Corrected the spelling from creats to creates.
- drop the braces around the plural 's' for interfaces
- written se in upper case SE.
- Replace "multiple message(s)" with messages.
- Removed too much details about locks.

Testing
- make CHECK_DTBS=y freescale/imx8ulp-evk.dtb;
- make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j8  dt_binding_check DT_SCHEMA_FILES=fsl,imx-se.yaml
- make C=1 CHECK=scripts/coccicheck drivers/firmware/imx/*.* W=1 > r.txt
- ./scripts/checkpatch.pl --git <>..HEAD
- Tested the Image and .dtb, on the i.MX8ULP.

Reference
- Link to v1: https://lore.kernel.org/r/20240510-imx-se-if-v1-0-27c5a674916d@nxp.com

---
Pankaj Gupta (5):
      Documentation/firmware: add imx/se to other_interfaces
      dt-bindings: arm: fsl: add imx-se-fw binding doc
      arm64: dts: imx8ulp-evk: add nxp secure enclave firmware
      firmware: imx: add driver for NXP EdgeLock Enclave
      firmware: imx: adds miscdev

 Documentation/ABI/testing/se-cdev                  |   43 +
 .../devicetree/bindings/firmware/fsl,imx-se.yaml   |   91 ++
 .../driver-api/firmware/other_interfaces.rst       |  121 ++
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      |   17 +-
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi         |   13 +-
 drivers/firmware/imx/Kconfig                       |   13 +
 drivers/firmware/imx/Makefile                      |    2 +
 drivers/firmware/imx/ele_base_msg.c                |  273 ++++
 drivers/firmware/imx/ele_base_msg.h                |   94 ++
 drivers/firmware/imx/ele_common.c                  |  358 ++++++
 drivers/firmware/imx/ele_common.h                  |   51 +
 drivers/firmware/imx/se_ctrl.c                     | 1323 ++++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h                     |  136 ++
 include/linux/firmware/imx/se_api.h                |   14 +
 include/uapi/linux/se_ioctl.h                      |  101 ++
 15 files changed, 2647 insertions(+), 3 deletions(-)
---
base-commit: 607c67544a955d27a91698aaa00a5f7fd0d7d14c
change-id: 20240507-imx-se-if-a40055093dc6

Best regards,
-- 
Pankaj Gupta <pankaj.gupta@nxp.com>

