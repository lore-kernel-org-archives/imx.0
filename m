Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021097.outbound.protection.outlook.com [52.101.65.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A1B273D76
	for <imx@lists.linux.dev>; Wed, 28 Jan 2026 16:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.97
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769617308; cv=fail; b=Lmjkv02lnIj5yPOf3UfrR8yCrIWZEff+FtQ9udK4XHcvuCZqwjpf7yJRhOt28xt1onRvdK7DL+QzmHw6Z9CZDBGLz8ZeSLc9sjU1YEa8glm5metdPF3x1HmRY5Y0czQxk+UW8B3Da47PZ/iPaZLL2Dh02UJqOV8zmKaD2eP0FC8=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769617308; c=relaxed/simple;
	bh=vCvn5DTFwQJ23d0rHd4YJQV6kBEgtMs+jXA8MRLda7E=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=LOg7T6xdQgJJK8Je8+NxFgdUWuqYyXzR5JbRPaatIUB4bGYi1cVz0YtGmZohlgy3KZLzk3R98r1r1E+29OSPIKr2mavDtkBKzijkuhnksAwwDvLmjvWXChN163cam8nYoO6DWOePm4nCChet4Zv4KTnWsiRw+EB+c9QUnmJFlmk=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=hjvxb+fM; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=hjvxb+fM; arc=fail smtp.client-ip=52.101.65.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="hjvxb+fM";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="hjvxb+fM"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=EEorRdR9Wy/PW6Aqv7Lerdw2WZ4iUCqHNG/xLqMxfJ59FuiYZLSLGXw0u6U3iTA6gt/OiwyQcG6R9K0+Zqw3uLbpZgX+ET7p2dFqir2EnrGCKiS4q22CzMU3QTKIknlLbxt52Z8mSdNOPbBnseIaVnvj9kyOnovxEWOpvqPZtymMNHJ8tWp6Bnp54uwwKln1rloioFY/DP97HoWdN5MzJzV9WMXIw3jnTQREufulku1ogiOCYaAq91SOaMObQjKGNAGXfNqSDVyusTd8Zo27+ospiCwErAl2Ztt4k01355AP0Xei5EFs9CnGVU3ZVzrizo9kqKYsraonjRh9bM0njw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0eVRI/OLXHWN+LtRlVKCL+PKpekstr5g7epguw5U8s=;
 b=iAsNjIWSdTHUMG/JWqAj74n219I2clSNRLq8QA0B0nGzQAvmzZn13LehOuFQJk5WV/kY+RzQxutWspz0mGXF1iZjBsI9g/s7xkMN11rrrPI5Lpv6NhWRHo861NPatGlrcLfdsR8LTJWzKUusoU/urMcZobiYBHrATtNZ+o+wx2yj/IWn90lFGXzDtYre+x1zfc5XV2s9319X+KlYp7oU33p6j77wCEHMPu3RnWSgK+Fb+jWSyCN3Y8clbJt1swOo5bZ/OUHlWCZeyLeLnZ1VVOGHC9SRPVx2PazMCakwiyrBnfPh7U/l82nKLyIEBRyDcX9oGCYwTw65Jd793RreBQ==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0eVRI/OLXHWN+LtRlVKCL+PKpekstr5g7epguw5U8s=;
 b=hjvxb+fMzZVj6rmqhtzmA3010bvUAnpyLbM+2RO1rxYJFn5WL9d1KeAzAGlj3hQMJLpTWqgcb7JvdD5n0/kXIvkAdOdYT5707kPcFspb3N0DOKwHwhq+Pai+bMkwq0eTTIZKsXJzBXYZj0+o/nViIy248jXk1I2MhEc3xIhOTTY=
Received: from DUZP191CA0039.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::13)
 by DU4PR04MB10646.eurprd04.prod.outlook.com (2603:10a6:10:58e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 16:21:43 +0000
Received: from DU6PEPF00009527.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::8f) by DUZP191CA0039.outlook.office365.com
 (2603:10a6:10:4f8::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Wed,
 28 Jan 2026 16:21:44 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU6PEPF00009527.mail.protection.outlook.com (10.167.8.8) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.3 via
 Frontend Transport; Wed, 28 Jan 2026 16:21:43 +0000
Received: from emails-4404942-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-51.eu-west-1.compute.internal [10.20.6.51])
	by mta-outgoing-dlp-834-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 4A517801B5;
	Wed, 28 Jan 2026 16:21:43 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1769617303; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=S0eVRI/OLXHWN+LtRlVKCL+PKpekstr5g7epguw5U8s=;
 b=I3DUnayew+KTQbDBLK4t7xTgciUrkVeQaPBSdhI+omcQBSFVSrR9dvyJ3FKoazAo+OeOX
 uyiKHwadwXWiFdPoM0Ut6Xdi/JuIhZJ8l/1wnVVpaioTWRuCgdLMar7AyLi9uGy2DCtRl79
 R1+19Gkvobzt1xd8X//+sVhCgbOPMFA=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1769617303;
 b=h1M4PhKcFhMn32Q/q92Y4kYpMF3DRpuGvuvOQplpA85NiiZIM6g+pjRheiJG7l/pT+7sH
 xqV1N42sreLdZ8kfry4Aht8UC5UJzbORu2Buq7PLpgxfsjhrJqW07t42ogKq/yru/ZntQzt
 KvtzOxKO+uEFtrP5eij0tqmYeiSVdnE=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=joTzc+wSZmP3vLMwYQLYBfqrnv22Mf0y0q6jIRC8fPSKXS4L98yKQmbdCebMCqQEx8lOQLUzft0E1G2LFMIiKj4SIXoPkb0HqZxopSm2iazIB/h0+Lg5Do1gQm2O2/Ug6rPVt5oRtdmuCBZZkrmzAIkaBLbUKYp8xqN0Mth7pvXANgeDrIx0XL8xbtWYyKY9oS493abCADqpSAscKXTUKbyLXl+j5r+R/WR2Wjow9AMQE+Gnm2haNNxkb5vDB2z4pKl12R5ygveGqEL7Wyp/RcjtgT4SE/yT+SWpZ5Ewb8Zq9JSMhc+RgegXJW40fZ5X1emM3Ytk3pZEByewnUBCYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0eVRI/OLXHWN+LtRlVKCL+PKpekstr5g7epguw5U8s=;
 b=tZuWGTUMq7ef8WYeAeFFbJxT798Q0yk3g4FsWZhivrJQe5ODNWoys5wakzVngMIZxgEly2rAtJJlsU/ZiWcIQUxC3PZ1BHVtpfLNwQBUoLCklhdQk6Gunh3es/j4+PebR1Son/HQzDfhgB2FINuum/1g1wj/dP+lCIMRSkrVJH4YCfrjRxUix1C0bQYo23ZqQsi9E/z+QnZs1GV8LHHwu5il5CvfNPg1ARlDsRTwU0NYTWyCH5f/d3m2thS1szh6ZLboSoSiBr4XnjEkhrfGmmzbXPmoL8W6WuMsG9x6B6F7G1f+kwh5ffOleL7VFaS399yRNHbXEvZbqhEoe5BYxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0eVRI/OLXHWN+LtRlVKCL+PKpekstr5g7epguw5U8s=;
 b=hjvxb+fMzZVj6rmqhtzmA3010bvUAnpyLbM+2RO1rxYJFn5WL9d1KeAzAGlj3hQMJLpTWqgcb7JvdD5n0/kXIvkAdOdYT5707kPcFspb3N0DOKwHwhq+Pai+bMkwq0eTTIZKsXJzBXYZj0+o/nViIy248jXk1I2MhEc3xIhOTTY=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM9PR04MB7522.eurprd04.prod.outlook.com (2603:10a6:20b:282::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Wed, 28 Jan
 2026 16:21:35 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9564.007; Wed, 28 Jan 2026
 16:21:35 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Wed, 28 Jan 2026 18:21:27 +0200
Subject: [PATCH v8 3/8] arm64: dts: imx8mp-hummingboard-pulse: fix
 mini-hdmi dsi port reference
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-imx8mp-hb-iiot-v8-3-9646a3025cf4@solid-run.com>
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
	PAXPR04MB8749:EE_|AM9PR04MB7522:EE_|DU6PEPF00009527:EE_|DU4PR04MB10646:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ab85a9f-bcb8-40ba-ca5f-08de5e895346
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?RklZTTZnYjduNXRUd0QxTVhSUUM3bTYzS2dMaGxJNkFLOEg3cmx5eDh1dElK?=
 =?utf-8?B?bDN5cnMwd3NzSkdacnB2cUZhRmtxdVNnY0hBMVpDZkFUM3ZhSHFMR1R5emYv?=
 =?utf-8?B?NkgyckVrUUNuUmtBSG5TdVZTYzlaK1R0YVJJTXRZZnEvRkZCcWJRWklLbDZU?=
 =?utf-8?B?RmVHMlpHdFc4TTVpdS9xOWlDbFluWU5LRjFUa012S0JLOGkzR3kvelBJdCtS?=
 =?utf-8?B?NGkyQVA4RHdVaUhXb29oTWhYV3ZSQzRZMzJtTW5GU1JDdGZuWFNzNFhxRlZn?=
 =?utf-8?B?empSdnpGSVFEclE5dk4xMTNLTlFZZk9LR2ZwKysxd0ZzZ1pEOThuOTJqOGwr?=
 =?utf-8?B?RHZTVloyMTdJOS9xZ00wK1JKTDNsaUI0NitkOE4zQVZFM1BkRm5hamJCMnNK?=
 =?utf-8?B?cDErUkdnbDcwQnFqa0xOempUNTZBL2VReXdrNDREQ0gxRTVsNFZSU2RtVDJF?=
 =?utf-8?B?ZSt2bzNwalFzdTc4S0QrazdVbEhRcWl5VjFuN3ptU0VGdDFXbGZhL21ld1V4?=
 =?utf-8?B?c3BqNDdmdHVPQUs5dmZ3dUtMNWpZTlZEcWtvMnIvTStuM01IK0JWZkozYXNW?=
 =?utf-8?B?WnVzV0lnWC8zWVU0cEttQTVTVC9SdVFFVWJ1dGtMWFZEajZYMDNqaThqVW5j?=
 =?utf-8?B?NzhJR3N0YXJxQ2N4U05RS0QrS0FMSDdZR2k5SGV6YXZWQ1NvdUtSeERTdGIy?=
 =?utf-8?B?L2tadUx3QWVCZzdFWmtEcDlsR2k2NUQwRlk2aEFHYkJUWnY4VGxJUWtKQVZS?=
 =?utf-8?B?NzFWU2t6QXdFeHViVHAvNWg4NS9FNmQ4WldaUEF3S0M2UkhCcWwybnQwWUlT?=
 =?utf-8?B?bG5WK0E5ZS8wNEdERVQ3MWl2clNnRk9kS1oyN2tVY3E4bk1lTU9SeTRVcHFw?=
 =?utf-8?B?ZDM1M040UTBhOHpBMHhCV2dvaWVuU2Vnc1Vzbmd6dnlNeHlOK1pXSTRKcEpo?=
 =?utf-8?B?b3NJQlNaM0ZtM0NONFNuYi9FeEtQUEp0ZGNadExPdWFKWkgwdFNGYVRZbmJm?=
 =?utf-8?B?VmhHWFpCUzhuNmYrWElrSW1wN0VXUVhoeGJWNXpMUFZsL29PZTcxb1hidFp6?=
 =?utf-8?B?QnlXWlJEZXVCTTdHL0VSSlhtam5Hbkl4STBuV3IyV0s0SzEwRUxwQml0K0Rj?=
 =?utf-8?B?Yi9lWWNYNVROdFFiMEVVYWtneWFPVUJENkJxeSs3RmtUVEhrTng3d3h0TjIx?=
 =?utf-8?B?eGdJcVgyaFdpR1BXSHdOdnhpaTZmbnBRN2NDQ0VZc1JHL1l2U0Jua3duN0Nm?=
 =?utf-8?B?S0RQbWpDdUg3QmFWb3NiMythQXlHMHFScEQ3akFZVDNaNFdlbnBPYXM3R0R2?=
 =?utf-8?B?L2o4RXBSSWJLQ0xLdEpoT0ZvNzMwdFVSNW9XZHAxdndIQ2V4K1p3dUl4Q1dF?=
 =?utf-8?B?Y0gzcTZZSjRXRVQzUll3ZUkyNXVvRE9lYktENFNuL0NxYWpjaStoampYUk9k?=
 =?utf-8?B?K3FueWVQQlQ1S1pST3JkUklacjJUNGhMSURvcTNpSVJnK01QbHNWRmhORWpV?=
 =?utf-8?B?c0NQL3RjZEJWd21mREw3OUdiaVdhR09UTTVvTVF1dFkxS0c0RlIrclFJejBa?=
 =?utf-8?B?MFRBSDBld1NkQklvQnBnR2k2VWpIY1luZHZkbTJlcnZQc1I3MWdvdzZMcXhJ?=
 =?utf-8?B?SmlHcUtqNnZpNGFMQ3E4elJ5UHNnaU9tNXJLSG9taVA1WkkzOVgyc3dnd0k4?=
 =?utf-8?B?VkhVTVZBcnNVNytEeFg5N1ZVZ1dqb2ZkYTF4SUVjaXZJQ2x0Qkc0OVRvbkFj?=
 =?utf-8?B?V1phWDlrYnZZQW1INVluK1JYWXhZcXJTUStPTEpFSUtXa2d1WUw3YjhPRUt6?=
 =?utf-8?B?N2wrS0hDT2NlV1NWTnc4QUtyUFMvSjRadTR4cm41SzFpMDFhQk9kNm5qVjNa?=
 =?utf-8?B?Rml1aFVocXE4RGlSSEhLQlNyV1pLaFFUdnBVSzJaZzBwaTd3WmRMZEZXK3Jt?=
 =?utf-8?B?Um9tSWdEZ1IxbitSZ1VyMmZHeGptMEhzcVBzKzc5dyt0MHFMMDMzK0hxQzlQ?=
 =?utf-8?B?aTk2aERiVURmRS8rRkpRS0xiK0gybVhWSnRuZ09waHBEMjRFQ0dtT2R6MTFQ?=
 =?utf-8?B?bzBRd1FhNEsxQkUyNTdtaXFCK2VTSWZBK0pvdG83RHRPMVlzRVROY2hQVmh4?=
 =?utf-8?B?ekJkdllJcEo3T084ZHVVM1E4K1I4NmlyT2w3NHZlUkM0QlVHWTZXWWNYaUFw?=
 =?utf-8?Q?gupC3ZcHDb4cKJAEib9xGAs=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7522
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 26eea43380b04e708dc5cadee3927aa4:solidrun,office365_emails,sent,inline:32bee9989c3005f395d4e7f8822551d9
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7a9c50ad-2d98-44d0-2c3b-08de5e894e4f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|35042699022|14060799003|7416014|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aVdvS2l2NkxOMDJmZEVnL0VEZGNyc2VkMHdZMGxXbnBZb0JLU1pUYWZkTDFV?=
 =?utf-8?B?Q1MyMnZZODlPVjRQcHJEVjBzZ1IvZGRWL2krODlZSWhOTzAxM3hEMzRRVzdy?=
 =?utf-8?B?VmNyNTQ2Q3YrZEw4NXRaTFVzRWZaVHkrdktQZTZ1UnVoN1pzRnZFcE4vSGpk?=
 =?utf-8?B?SGtYaC9TVkJDTEN3R0x4R0ErVENEM0hIRXZaTjNqenAxSzdncmhsNWZyaG96?=
 =?utf-8?B?YlpQSDlXOXVWTkZkenZRVHNRNWd0Z0tMR1hteTQzaGJ6U1NCZ3B6V2xCbnRH?=
 =?utf-8?B?MExtYm96MjNCN0EwZmhwNVhYM1FoQ3VHT3RIMnI1VFFiKy93WEFmODNmN1Jj?=
 =?utf-8?B?ZGJuaVpVN2ZGcytmbEEwVFo2a3hzSUdtbk82aXRLZ2U0dEhhZlZlVVRxL00y?=
 =?utf-8?B?VUM4THN6aTU4dE9XbnBIYVBoYUFlZ1dETjZmMmJsZ0xHVzNYZDY5SlNGd3pG?=
 =?utf-8?B?Yk0rVGpRUlBMWlI0NDJYUURHQkM4dkRvRUNYcUV3eXg4cGJGblpQYldZOExC?=
 =?utf-8?B?WkJMd3RHdk5raTZxTDI2eHVLcCswZExnR2ZSd3BkdFpMeDBwc05LQnBLYjl5?=
 =?utf-8?B?dGRzblhtcVFvb0wwTStMT3NrYWNkKzlYaElVckY4ZG5rM0VKV1BPd2N4aTBy?=
 =?utf-8?B?ZEcwanZDVFg4Q3B0NThtaEtMbTNLVmdZb2xadm9sQ3UrSDVsSFYzTE1YR280?=
 =?utf-8?B?eGZ4WGxOS0gybjhBZmtlOUQrVUhNMDJTbVN1MjJTZkhTWlh1WnF5QjRwbXM5?=
 =?utf-8?B?ZG1SNWF5QU1jV3JCWDh2SFBLa2lveUNYL2dpcVRmbVRpYVBvNkd3bi9JRVE1?=
 =?utf-8?B?N3VnWnY0bTB3WDdEUXVscEgwb0JSZ3hpamxjVk1SVHkxOXF4MkZaRlc4MnJE?=
 =?utf-8?B?Nkx0aXk2ZnEvd1JZdElEREM0SzZRekVyejQzd3F0cVQxcWZQSHd6U3ZQRDFs?=
 =?utf-8?B?SU9oRThMa3JzRmNQRlhCNGFwY24yUWp4Tm05TlZtd21EUEhGNWFjUWNZelRV?=
 =?utf-8?B?M1lVeEZWSERDMzdxU2dGVVVrSFdwQUJyNXg2TVRhL3RqemJ5WEsxSHVPbXQz?=
 =?utf-8?B?aS90RGJxNmgxMXJZWDY4ZmtDRkxTLytpVGJEdDZHRWk5N0VzYkNhRDI1ZW9M?=
 =?utf-8?B?by9rWUR1eFVTV1NjZWY5STJtbDNnNEJrQWxiTjl4ODdGcVlSTk0wV3gyOXVU?=
 =?utf-8?B?eVZWQjVFYzE4SXpyR0lraU11RVlvajJ1MGFtUGJXT2FXMFRLR0VDT3Z2dXVs?=
 =?utf-8?B?alczaFMxZ2EzaDlBR1N6VzBuMzhWcENTNWgvQllLNjNNSGFQL3VIWTFoUUlZ?=
 =?utf-8?B?c2RlR1V3OStXQjNLSGtWUFJXUFZveFE4S3F3RCt1RE8ra0x3aCtvMDlMeUU0?=
 =?utf-8?B?djRjWE4zQ05Kb3NmSGRuakZoazF0RUZwZm4zSmF5NDNJUHh1L1pYZlRCaGFJ?=
 =?utf-8?B?cUFsRHg1eG5HUXlFSjYycHNEYjNRUTBXUTQxUGw4RVJidTFEcml5dDJvZ2pt?=
 =?utf-8?B?d3JXV2pzR0NwZ0dwSGJ1NExwbkhCL1Y3YkhXckpreE15SzJ2THZoeDYxV21w?=
 =?utf-8?B?dDNXVHRhdFVLZDBKbTM2RStYOGFMSDdxVmJnNzRNdGFxd1VveWZQY1FPamhk?=
 =?utf-8?B?R1hodm9XSGpLWkFMSmRRTlJ6UlRNQkRzdW40L2Vvc044d0N3SWZ3aFlLNk8x?=
 =?utf-8?B?bm03VDQ3ZWZ3RDMvRkxxQ2lUbDJhU0dYb3RHaTFhd0hRd0g4RUZWRHlhZ1BQ?=
 =?utf-8?B?ODdSZzJKSUlRSk1UNm5sODZuMWt5QXpHQnpsMFNzbEpjN3hCeGFHaCtyMzBU?=
 =?utf-8?B?Y29SZnlxYmppcVFKNTNnVnhOWEZxMEhLUHJsNVZKMmRuWmpVUG40N1J4YjJB?=
 =?utf-8?B?SGZQUERaSStRQ2lMYldMRGczYnBUUnhJRGdPM2p2KzhxNTFKM1ZMdWlBOUlF?=
 =?utf-8?B?aVhtaFZqb0V6cCtSdmJXSittNzFiUTBWQUo4UHZ3THJtOEFRei84aG1lWmVw?=
 =?utf-8?B?Mm1pYVBaZWNveWpRNkgxRExXU0V0bHEzVGtIRXdWVmxQTXlKYkEzVXRsSEdv?=
 =?utf-8?B?cVFHK0lYSC9wSHdlRDRaRTd2aFRoaGtzTmN6N1gzL283TjIvVE5IZEJ3ai91?=
 =?utf-8?B?dzVMVkdjbXZvSmg2WmRzR3B6Ly90MDZza2lWMmw3SFF4YjBQQkpERlJDcXBE?=
 =?utf-8?B?RnpRRlVoZWZxOFEwU3Bmd2x6WmtrUnFVdzZkdURQSUV5eDV0bXRlMElYQVdk?=
 =?utf-8?B?cHZ4dUJEZE45K0NEVUFLZ2RENUVBPT0=?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(35042699022)(14060799003)(7416014)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 16:21:43.3419
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ab85a9f-bcb8-40ba-ca5f-08de5e895346
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009527.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10646

imx8mp.dtsi includes a default port@1 node with an empty placeholder
endpoint intended for linking to a dsi bridge or panel.

HummingBoard Pulse mini-hdmi dtsi added and linked hdmi bridge to yet
another endpoint.

This duplicate endpoint can cause dsi_attach to fail.

Remove the duplicate node and link to the one defined in soc dtsi.
Further remove the unnecessary attach-bridge property.

Fixes: 2a222aa2bee9 ("arm64: dts: add description for solidrun imx8mp hummingboard variants")
Signed-off-by: Josua Mayer <josua@solid-run.com>
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


