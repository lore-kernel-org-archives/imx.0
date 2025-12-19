Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013035.outbound.protection.outlook.com [52.101.83.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42466222584
	for <imx@lists.linux.dev>; Fri, 19 Dec 2025 05:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766121730; cv=fail; b=bSHgGDEYOvsVW/xpsfEKn7KSJw9gFqWol/2ao4GcH0K3a3Q4PD6wX8JcNLb9A4P5hHqXLl/1E4NbMj+Zq3PkSbvj4KDh+/AcDuhwC08V7jeTqC1KuwKXVRVS6WmFekxmU8PA4fIc8WRYk8UkYTzJae1z9mNQyCLSbq12EovwmAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766121730; c=relaxed/simple;
	bh=4IUW24SqukAYNBjhb7oZQPmdvD4bJWBM4qbgC5YRIx0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Af6huqvRfDVr6gnRObYw8n7dCI5omqOclWJWbkI/n10vfnyqMmpKM8m0miAQBeMEjG1Aix01OBW/vrK1KAqwzJwLXC6ChUt4uSPLWFU/WQ3H+ZZiams0cJ9RBG9ORBp7iJDYQO8n3MTes0z1yBYSYmVvH56iCRkDys35iEsY75o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=AIveX0lk; arc=fail smtp.client-ip=52.101.83.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="AIveX0lk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aWYy1Gz8VCwaoX+PTBeDSk+vi7hSZuicalT2YduzjQiu1+MiqNIMbufaZL2yBE37jXZKGw/IqttNs4acYFzetR/kEgOTUA/yai53Ks4tdzZwaNYcBwsfzaPVL7owc2GgN4q593xx5tbkWHkJAs4SZXhi4pTalaT0zbWWmO1JkLIH6exoO6iKpPFyVZuJ6hKCOtrF1rn6qLn3Lxx/+F2044p1dRuXd4cITcvDwdQyipzc2rIInIuxgORADGNXOW6SEUDyqKZmk9daokCvoD8UAdM1584V2AC0ptURtf4R1UvlYgFvRN27TPmUiuDFWOmLHouhX153F2fRxrcdKk5DkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qR/ZU2M65lCz1sLo5f0c4o2VWIfZ3XIGBXTmrY6+Ac4=;
 b=lkYjZNsq5vmQ+b8qyH/ASwPd6dM303Y5MMSkwBuJj8Txm0vJpMxhF4KJ4VwEMPbFSsdtbpakdUVmaRViAIjRhwh2kvAMLXSG58lOQ6O64Gb8ApzA2TKw+G3YFeQAvQPs6yML0S8M5QOhbJhL01gNoVfDaQCktYhTku0Gy2/8YbSwUPQ8BG5XzgBgJFXQFDgm1q+SSDkljVPls7XVln0Ju8U3rvFBFYv8IKWkCtyMeXs4kmqcbYHPaD4TfcxFBM3yvHWB+pz1a5m9XKb/I8iS2lXH9pXeAAzR6IIFIMz4LD9+vTTkV4XLdCpAlw9qMWhNTboc1Sq3WxWFyS0VhAGcSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qR/ZU2M65lCz1sLo5f0c4o2VWIfZ3XIGBXTmrY6+Ac4=;
 b=AIveX0lkKe/XMpMedj07Z2QuPaOU+jvkrjBDVhJgCk2knnUIYnzww1A7tuN7Eh07Xh24S1hFceyipzpAnHWAz1u0SIa96876ydTwq9cB5EViU56QP00jPBMZmtsYhNUUlS6SvGzUENO4LDAwHW3fqFXg5Vr2GVdn4hMFjwxmInQjadvyXieVzEPscBDidwqezjuLJc3dWe+qwtWN+7ruJLuvYaz2/nUdAxpPjLSjfnEbSZt1x/TI085VRFI6BFISblublkmH+aigGQhMWU7zIVkbfpgu0pKgquZy1FMsRCsjZgQRQbbRT5TP78oIjmLNaDutT2eaxifUGLWz54BDQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com (2603:10a6:20b:43b::21)
 by AS8PR04MB9062.eurprd04.prod.outlook.com (2603:10a6:20b:445::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Fri, 19 Dec
 2025 05:22:04 +0000
Received: from AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827]) by AM9PR04MB8604.eurprd04.prod.outlook.com
 ([fe80::e751:223e:aa3d:5827%3]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 05:22:04 +0000
From: Pankaj Gupta <pankaj.gupta@nxp.com>
Date: Fri, 19 Dec 2025 10:50:42 +0530
Subject: [PATCH v23 4/7] firmware: imx: device context dedicated to priv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-imx-se-if-v23-4-5c6773d00318@nxp.com>
References: <20251219-imx-se-if-v23-0-5c6773d00318@nxp.com>
In-Reply-To: <20251219-imx-se-if-v23-0-5c6773d00318@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766121652; l=11122;
 i=pankaj.gupta@nxp.com; s=20240523; h=from:subject:message-id;
 bh=4IUW24SqukAYNBjhb7oZQPmdvD4bJWBM4qbgC5YRIx0=;
 b=qxTo7WMl3LYJeDE2wAupz0rxqY608E1xEr0pza+bVyW6QZeDAuV1ttYA/L7bLqiglbIr7UCn4
 XPLODxJZvBTAT9wPGoMnfcQf9AFgnHMPlpmWJ2pIfNHwB9C4UMocFPe
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=OA0pBQoupy5lV0XfKzD8B0OOBVB6tpAoIf+0x1bYGRg=
X-ClientProxiedBy: SG2PR04CA0200.apcprd04.prod.outlook.com
 (2603:1096:4:187::15) To AM9PR04MB8604.eurprd04.prod.outlook.com
 (2603:10a6:20b:43b::21)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8604:EE_|AS8PR04MB9062:EE_
X-MS-Office365-Filtering-Correlation-Id: 0952fc35-a559-4367-6f97-08de3ebe8bd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|7416014|366016|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bGVMdGtLeXAxUzlodlZPQ0VidzdsVCtBS0xydENqSXNBWEphaWswOGJ0U1lO?=
 =?utf-8?B?aHFzaG5WUVJhTjdmS3VzQ3dJVXpubi9DUlJ5Z1VlZmRtNVJCUUsrUlZ4VlBV?=
 =?utf-8?B?QmFRTHR1dW9MS0NkQ2hucDJ4dmpUWno4NHNHdUtnQmlrTlZSSlN2N1g2NlZD?=
 =?utf-8?B?MFNONjhJNTQ2QjR0NkZXeUhZVTk1SHNRL2RCNjRnS3dpdkdMendrMVJFWmN0?=
 =?utf-8?B?M05QWUZrTkN5M3kwamZkY1NuWGo1bGZsWi9zSlhabDNWaVVxQVlRZXVwYXdl?=
 =?utf-8?B?anVWaTl2VWkrWG9tMzBnVURzakVSTjJDRnpINms3RmpyZS8rQkU3Qkc2NFVp?=
 =?utf-8?B?QUJmMmRobjIxVXE5T1M5VGtBVUVQaUFCc01mdkcwTmtRd3VKNlFVMzlPZXFF?=
 =?utf-8?B?cU5wOFpYam8ydEZ1M3Ywa09qSC8yY0RFTEZxTXVLdmkxS21kZThsRk5VUDdk?=
 =?utf-8?B?b2l5d2IxaUJkQnpzSGZOOXZhZW5yeVdqY3lKSWdYa0hhMGMwWGFKQ1lSclBp?=
 =?utf-8?B?Z0JZdEN5bmhjT1FJOTV2bGdZNDI3Y2xoUWlhYVJCRFFtSjNYK2xCSDhSMHpB?=
 =?utf-8?B?TithWDFDcnc4Uyt5dEZsN0p0SStXWmZDeldsQTlVMkdRY1cxMEZVbU1GeWJj?=
 =?utf-8?B?b25US3g4RmRtN0wrQ2Z0QVRXQmVuSTN0cnpWNjRRUXVzek5WTmwrbUFhYVE1?=
 =?utf-8?B?MVdkaUJaQlRObElRdGV3RUJPb1RJZjUzT3h6Z0loeW01eUFhT0dhTEE2VEdh?=
 =?utf-8?B?amtPR3ljWFI3a1BDTWp6a1dGaFJ1U0g1MTBic1k2S2JCNTN6NEl3TDVCdUVo?=
 =?utf-8?B?Z3VYaThhTGZIWG1YZDkxUGJRcWVMM3R2QWNPMTQ3VUJJa2NMT1d5MG9CQWsw?=
 =?utf-8?B?SGdUTGNDZmMxTXZQNDd6TjhEQVpwZWR3YjkvWm00TlBWTkVCNExXenhLcW1a?=
 =?utf-8?B?eU5LcWxlSzRKcHRJWGswN0E4d3RRUFg0VnUxZkNmOVRndGxKOTR6R0xhVzBT?=
 =?utf-8?B?WFFnbnBYeFNyUHFUaUJhR1JPeVd3QnZvSDhOM3k2MTRTR2JTM01BdCtmK2oy?=
 =?utf-8?B?djNRUUgyOWQvVkg5em9oQW5WaHUwN3U5djZ6bUxzS01sbkw3bEJNSjVyM0RN?=
 =?utf-8?B?MjhkK1h4ZWRjK3BBMTliVnlLWW5yMmxQWHFjK2M0WHZJbDA2R1VEOEFVWUpl?=
 =?utf-8?B?TXIyc1pIeFRsL3ZSQnowRXdkMzBOWEo1WklNWjlLZEZLam1Tc1dNQmlJVVRR?=
 =?utf-8?B?aHBnWkFtNjhLbFhJc3B4TnRaMFJCbE1HZDJCMmdDR0kxSVpsN2lRU1lFckhM?=
 =?utf-8?B?TlBxZEY0cXdzSEx4b2RKQXdJNnNJTHpWeExWK2NDc0pHdXlNVDE3ci9VQnFK?=
 =?utf-8?B?TTNPZTFyMUw1REhQUzIxUkRwUzJVK0xQOFprV2lqM2JITmJUY3hPNTBTS2Q0?=
 =?utf-8?B?VW1VQm5QdmJmWGtmQ2pnci9hT1dMTnhUMy9EenB6aXF5blE0Y0lFUE5VdnN3?=
 =?utf-8?B?Z0ppMFNHcy9rZE8vcStjK09sZS9SZzNFZ2JkR0VHRE9RYjNOSVBQSGJBcWhx?=
 =?utf-8?B?SnBML1hWdnQ5K3RwOTcwZlovL1pwdVJVZmVNZzk1UE9OKzdsSVNDNTZwUnpG?=
 =?utf-8?B?dHlqRndXTVFldEQ5bDMzRWx2NlFZYUtsWE8vOEUvL00xU0cybSt0bW83eU94?=
 =?utf-8?B?QVZYYnIyR0NnVmJScUFGb2NDOTJta0R6QmZYSkRPMndEd0lUdFh5V3dHb2dt?=
 =?utf-8?B?YXkvZVgrUVY2Unczb3Q5YUE2R2hReGVoYUNnY0tUVEtsTFNGbjNGT1JReWIx?=
 =?utf-8?B?Z2NpQk9nSFdVUlVyQW1nNlVjSTduQmJPcVVkVzlVYjFKK1F3TmJMenU2dTcy?=
 =?utf-8?B?Y2hKUXc5WE1Qd0pQQVZxSE5wUndXRExCRk5MWk54WGRMSG9kNjFoblBoVGpB?=
 =?utf-8?B?MjBGU2ZxK2ZmZm1Yc1JSMVNMZ24wWE1iOXJhRXNPUEVTUzkrUnYwaW5uZm8x?=
 =?utf-8?B?OVZwMFJpbjRNNHMzdFgyOXczK1ZWbTdXK1lqaTl5a09rYm1nRWlSNVB2SFdV?=
 =?utf-8?Q?bnUwjC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8604.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(7416014)(366016)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bGZvZDFYcXovOW1GZitwUHlodnJFcGhLc1p1N3QzTGZudzY0ZGpzZTE1Y243?=
 =?utf-8?B?T2QwQXU1ZklJaFN1VFN3M2ZVS2tNQVlhYnhETDdpZlFLRkxPM2k0QktFblRU?=
 =?utf-8?B?T2s3L2RlT2hjWXlwRGNTTG9zZUpNU2U5eHhXREtmVnVINzZRNm1NYWs0TmRr?=
 =?utf-8?B?QUNJaVRCdzlnNlJCZUVGaVhDOTFRajMrTGhOMWZzMGVuV3R5TFRCQ2ZEL282?=
 =?utf-8?B?cW53NVJ6NGdmOHlpdE9SeFRENlBqV3p6WXdQTTRMc2R2SGhyTS9IMExOMkcz?=
 =?utf-8?B?akZDNHpaSnhNdzJXZHhRS1FHTG5ibk5VcG1oNURRWW93a2IyaW5PVUVKd1k4?=
 =?utf-8?B?KzR5SnVYc3RQM1NQak4rT0R6ZEVFdDhySWpwdCtQWlNuWEhodHU5b3RPQXB5?=
 =?utf-8?B?em9XRFpyVlVjZ1ZIUFRwSk1hYmFoSnlxNTRPTDNlVFlieFVLYXZJc0pYRmk4?=
 =?utf-8?B?MldVZENrVnNhQjdBZG5GejVEc3hSZ2F6SFphNWh5ZzFUaVh3ZGdUQm1CUDRu?=
 =?utf-8?B?QVBhSU9yYjJTZ2pmNTgzbElzeEtiRnE1dUhKR0Y4a1Z0RWhnYnlnQmxoTE15?=
 =?utf-8?B?OGY2T3hRZUxEdHE1SENRcEMyZCtFNUpyY1hqeDhSY3B1Vy9jdXNtb01GRjND?=
 =?utf-8?B?eTNiSjY1QjRsVEovb3Z0MW4yU1J3YjJGOC9IZDJLUkRwa05tZjd5TVh3SDd4?=
 =?utf-8?B?aWIyU0VaVGtYcDR0K1NXYXExUzhIeHRybXU0OUhITW9xSko3WXhvaytJM2Jn?=
 =?utf-8?B?Uis2emFrQ1RTMFBOQnNEdThmMlVFbHZYVkFac2J2MW9WVXQvUWp6TStQZ0dy?=
 =?utf-8?B?T3AwN3JsQVhObFpZNS9SdjlaVDZ1MTdVS0hYWFNTaDBKY2V6dzU2YTQ0YU0r?=
 =?utf-8?B?a3pqQUY4MVJBZlFBbVJEMU9uWWlaN0xrWGNIQSs2VWhyUnF5ZGMvYU80a3hG?=
 =?utf-8?B?RGZKclVrdVJ6VkFrUnJJb0xGckdoejRaVUMrVnBBSzNjQ0Y3TEtKWTEvZmN6?=
 =?utf-8?B?SU5OSzI5VzdlN1k2b28wQ093U3hxQmdKMG50eDNiVFV6MTZpd3ByUFRuc3pm?=
 =?utf-8?B?YkN0UGlwcTE0enFFZmQyZ1h0cVBhamFUaGZiMTEwdG1FVUkxYlNaZk9veVlX?=
 =?utf-8?B?MWZiQndUd1dkT1IydklTbUpHdlFlMSsvZ1Rnd2hYbVVycHFQTnVkTzZOeUtz?=
 =?utf-8?B?Ri9xYnpOVjRlY0VkcFBpMDZBbHBic292RytIcjBvZ0gvQ2IzZGNIUGl5UXZm?=
 =?utf-8?B?VGNobHlybGZRQkJTWTBaWmVvdEUwTnVHYXhXWjdDMmVBcElReVJOdkw3Syti?=
 =?utf-8?B?VXdFdUZWSzNLY3VWME9odWlyczhLN2JQQXFMSmFIam9VR2RBRFhROHpWT0M1?=
 =?utf-8?B?UHFUVHBPOGNjbGZZdHI4Q29xM0I2NkpYTVVyODkvRllrdll0YlA4dDRONTVp?=
 =?utf-8?B?Q2lqWHhGWVpQb0RObS9JamJCZ0RPQmJoUjd0c2FqaXFSeFRJZXFLdkF6THE5?=
 =?utf-8?B?SXdOUUFINHpmYnl0aGlqUHdOaSt6Z3ZRNnFqMHI0NEVwS3d2eVVyd0wwSGVP?=
 =?utf-8?B?dEJsYmxlQndlWm52ZGZoNWQ5aDhxdzJQTFVaZjZNZFhiYU14NXNDeUZpTCt3?=
 =?utf-8?B?T09VaUgzejNwY3NCOWhOWXpsMGtmME11UGZHRFZNT1dWdFhlZVNMNVh1MTVI?=
 =?utf-8?B?NGtFUU5FaGR3K05MeWZxSVR6aStCSDZxQ1ZoRnlvZklwZXhwclV1M0tZbVk0?=
 =?utf-8?B?OVlHZzhTS2podkJCZWVHczdxTVE0dW5OMzdqZGtyVmgvTFlWS1ZyNW5DVlhv?=
 =?utf-8?B?R3FLMXJDNy9FSXNZMXlaNTdzQVFSQmJET3Fva29EeGx5eWRxOVcxOXhTdWl6?=
 =?utf-8?B?K0VlRUFUd2JvNzhRK2hSclBDL0d1UVo3NkJvOTJHMk9CSFNxMVZzcVlFTlJ4?=
 =?utf-8?B?enAwaTYyWmdQT0F5NURab3F5V1VNVmVYcjhRN3NuZ0NGTm4zblE5MjFxaHBT?=
 =?utf-8?B?dVJPUmdkcDViRDZIcHNZOWVWV2FyQ1ZIc3EzWm1HbDNJTmVSYnNsTnNFeS9x?=
 =?utf-8?B?aDRrVk5NRVBTN0FiQXJlYkoyVVBIWWtiWjJUeWJqV3BybVhsN3cwbTR4U0Zm?=
 =?utf-8?Q?JqN7CEM7MDDYb4xKXBWPiYBUG?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0952fc35-a559-4367-6f97-08de3ebe8bd8
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8604.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 05:22:04.5018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SuyLi8Iu5Fzcq6H/HV6uU4oZqmFiQjwicEN6NUf8DWLhbubyE09CpaCRetV6apGZx0mPgoMiIdURsgNQdbIBDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9062

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

