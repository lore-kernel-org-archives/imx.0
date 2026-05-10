Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023086.outbound.protection.outlook.com [40.107.162.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A6639EF1F
	for <imx@lists.linux.dev>; Sun, 10 May 2026 15:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.86
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778425949; cv=fail; b=FVfN2QVMjKeu//siDmamMcv+P4x7eYSrGqDCO4LEP2oOjwxGTEywXUTtyU7ryuak4dWXxet8PML50TIXzBPHWZyQh3JsONMYKsvEzTzHandppXwmZUgxBFbrmdSYvIE2PlNQyUUQR19H4q08KYGbFOkX9yveZ80tkSyN3lzRvp0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778425949; c=relaxed/simple;
	bh=acCcqgKKVTjzFWJAo3qV2PbUHeVfVY4AlQNgUjcWunU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=txQe+hwYR2v8F0gCupbAo49633wQKUlU4az/nr5v7kBTR2W9RbSJyhkfks7WB+XVwvDt9j8iS0yeVZ6SR2esKe/hjc6Nhw8lWp8QW3Xj/3ldjinwEiggbr7OBzsn8uJMYBJBQo3ye6nWXK/n1gRjUNDBTH5iiqjExu9p6m3KJ8I=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=AFS0Sxck; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=AFS0Sxck; arc=fail smtp.client-ip=40.107.162.86
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="AFS0Sxck";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="AFS0Sxck"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rKPQ5+u/otnLu9+/AfrC2jKa1iKND2BSneA9QdpMRY5hung4vyuMQ2Uln+gv84JMrPGmli/CFXPK3U+/iHUF8UdBuDk6weY0kcHEfNvSsZUEDbBnW0npKwpHGt4fih/e6K9nd0ngJfCHhrYE1C/hTqj8NxUnvuGTRM5SsqzubzqhjqeF+/CHwR18YtjTONqpk65ErhKpncRquwb94GoDhliondNDg7tAjgCXWnM78C+h7+q/yxLLlTcmKP/4xMGxWxtSEHXYaMNFOtRtWpxVHsC3cIz6oBBZHx04YJ+l+d/2ZtZllO1tPcwUQ3jVxvUCCkLuWYB20qgLWrnamyecZg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+cbhDP1c/1nbeCLQ0DX9NnQlEbvRi1FGZImxoAJc7E=;
 b=AAk3WWiq0iI4b8O9151K4mnH8OL0yokjMAeWW3rXNxMNtCvFuUKeBbVa99/qARPJ53WBFn4H8YVb5ZT4AAt1XTNC6oj48FQTovsvmYhx0unzhuq9WMDwxOyi1CZwZ50SiT5xyLgZxrO/YWHBxjSURN3k9UhQgqxB76thBTzz3eYFoTSb5DttMLTw2gTafrMR9ECw4jXPfdLVSyCwUvSMSTsG3pOwWM77y2TBSPrlrCxAu30HWZCvaspgY48yubrFKdCtRQ63y1xsCzsRqriLzNo/f/FGglrqkBEM5nUmPFrcTBe9wqqtsBwL9EWnWeOS4nohUox+7QEVEdpHarYiNg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+cbhDP1c/1nbeCLQ0DX9NnQlEbvRi1FGZImxoAJc7E=;
 b=AFS0SxckrLCFdOmrAGJXKjFYH4oygfSYanl3rF2G9p8YtSLVg9UWv6gn1ktQlOAXBUGmOaJJ0nMx39+lLBkh0IYiwTm/tZfleyDVv6A2IYUdIBEFO/1ywjPZkzlYwZMPp/OdJvmIFCv85KswoFRFktyHsiFTFURlcH3AW2UdQg2glgfCccALMCWsSfg75y6kIrZ0icMTnh1fm5lAeBFpHgD4NsMxKZgIBBS1mVNmXOefzpMtENNgEHvXJed2FdlnIZRl5gWmPQWn4yCkrL14HGVcnGavAP4Km1DXTxR1d6gSacf0oWr47sDsNMIeuL/aLKeG/bBkGTIBFRDRrYNURw==
Received: from DU7P191CA0026.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::6) by
 VI1PR04MB10003.eurprd04.prod.outlook.com (2603:10a6:800:1e1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Sun, 10 May
 2026 15:12:22 +0000
Received: from DU6PEPF0000B620.eurprd02.prod.outlook.com
 (2603:10a6:10:54e:cafe::59) by DU7P191CA0026.outlook.office365.com
 (2603:10a6:10:54e::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.22 via Frontend Transport; Sun,
 10 May 2026 15:12:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU6PEPF0000B620.mail.protection.outlook.com (10.167.8.136) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Sun, 10 May 2026 15:12:21 +0000
Received: from emails-9057011-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-220.eu-west-1.compute.internal [10.20.5.220])
	by mta-outgoing-dlp-305-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id BBAF6805BC;
	Sun, 10 May 2026 15:12:21 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun May 10 15:12:15 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pktRHx2ZL5JORfqI06NdObXtLqwOUZhxUXai1A3c95jLoPx8Re9YubVOU/Ejt/ZJJDoKL7LzT9OFjMmewiHT81eWCZg3eiH1IEfJAPA9PBf1vL/+j2T3U8I6oQvh6hhQGNn/mVwHKel6Nhk9j2qN9T+EoHCHHBrVavZ1bhjJ/BItPJxh1rCqJmMWbRg5WSyJy6Gv8j6VwsUW5PhDx0QlmMmtnZtTBMLYfq9cN+R2dmS4gUgIYLWyWNdmAigMpvC2hVwJfhnJq0gF1nQ4+Unom6UMFy8mkpz1s4OjsrWamayez7vIuoQdH712zHflqMJq4SmqhjG3DVGVwe47q61wVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f+cbhDP1c/1nbeCLQ0DX9NnQlEbvRi1FGZImxoAJc7E=;
 b=RCNkpooXxPxLIPgC2dU1f5P5oPJsKcaPJyc3M8egOJX0fESIZGiKkYyA9WuEQvXzx0zr06gEPLSLwJCROZ+7lWi4lien3CSpsLDg2CBXFsi8O7Px/IpZRrmmchQgrH0e2QeA7CXepdZH6PTUiIA8GAhfbbP5p1mWkh1Ls8lBN6AvqQ0Uaq7CR5oVvZ9UY5fAea0y/9Dkb5ps4Xor0spOp239OHWii48KcOSWRPngJ/cHPHlDAh2Uzt4VOO630tOUbfjQWkvlvufzZYPlZb2DHjvDQxLMgSVkLeBLPkABnl63KXoUXdP7h7Ih1sH/hQmNvTGA8KcOGqxB4qs8VDmtzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f+cbhDP1c/1nbeCLQ0DX9NnQlEbvRi1FGZImxoAJc7E=;
 b=AFS0SxckrLCFdOmrAGJXKjFYH4oygfSYanl3rF2G9p8YtSLVg9UWv6gn1ktQlOAXBUGmOaJJ0nMx39+lLBkh0IYiwTm/tZfleyDVv6A2IYUdIBEFO/1ywjPZkzlYwZMPp/OdJvmIFCv85KswoFRFktyHsiFTFURlcH3AW2UdQg2glgfCccALMCWsSfg75y6kIrZ0icMTnh1fm5lAeBFpHgD4NsMxKZgIBBS1mVNmXOefzpMtENNgEHvXJed2FdlnIZRl5gWmPQWn4yCkrL14HGVcnGavAP4Km1DXTxR1d6gSacf0oWr47sDsNMIeuL/aLKeG/bBkGTIBFRDRrYNURw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by AM0PR04MB12004.eurprd04.prod.outlook.com
 (2603:10a6:20b:746::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Sun, 10 May
 2026 15:12:13 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9891.020; Sun, 10 May 2026
 15:12:13 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 10 May 2026 17:12:10 +0200
Subject: [PATCH v5 08/10] arm64: dts: lx2160a: add labels to thermal
 trip-point nodes
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260510-lx2160-pci-v5-8-540b83852227@solid-run.com>
References: <20260510-lx2160-pci-v5-0-540b83852227@solid-run.com>
In-Reply-To: <20260510-lx2160-pci-v5-0-540b83852227@solid-run.com>
To: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Yazan Shhady <yazan.shhady@solid-run.com>, 
 Jon Nettleton <jon@solid-run.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: FR4P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::12) To GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GVXPR04MB12057:EE_|AM0PR04MB12004:EE_|DU6PEPF0000B620:EE_|VI1PR04MB10003:EE_
X-MS-Office365-Filtering-Correlation-Id: 523b8114-afcd-40c1-40de-08deaea688f6
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 6QB+Q9KeAqpyFuk2x9FUqN6ze68crZnJen3PzURL1VHL9URhwXqoofygIpACHGzIvoIVFZO36d2qNKZqNya3FipofnyQOQ3/IN0loiIo7M9pZMI6ArvZheqxZpza2SeIfkjm2MBR639TqGj0j9iotruTmO7pwLui8yMTJ6ifT96SU8PHrfJIOe8SuCGCqZNcBcAzy+GpQtALnkLs9j3rQh6FRZEGPmaMv/wGTZgL3P+W+IBOxrljXKGvM9fn1SvHiz9CywRA8bpigWVMvDGQiB6vuUoy4YIjybvcdEigohPjaGgRzQLmAoYdaEsNAMPWOGflbzQfguLk56TdAYKqFz89NXQogusdXWEpwUJtqJRfmi8IaHbROBdao/hvUmT8xoagkfkPWf0s2rj5rsyn3rUSyuOGtfS60nHnb4kGQ288RcqVEDXSX2oCBk3xV7LS5YjpAfJOaopCCc60sHBGSHDrrGDh8rFI2UfPzIJN4umF+bzTsqHG2BVpqfHTObHty6F20f8i58QyKqf4Kb7SxxrmivwA8FGUWLyZffH2YslA3XP7ct75NDGvfw4ExvR9jvILUWKqVCjk0A38ytDWbA06/+QYT2AJxaTQEEyPk5b2RXzrhrwH42DubSmjjUN5ZRiqgONp/yz+PRhi7x4EcMum68QzCqhU1X7tBuvkrN3UHRzrDG/oQYjAbJ6cF6g03/7Su9ijG48fcsjxboa5oT/EeGKbblz8q0TEdSkzhGS+mU1GscbCyPPI1Vwag3hDzIizFjY3p7Y60NqO81UtAw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 gseYJNiAM6U29WbyneEvLvcHVog261vM6CFI5VTZy7Aot9VlSKAocbUiIRstZNJBaCIdAttmotzw9bI987kryuiuofjmYdeZe1BCHeMhP/vMn6zAaDBvYSmaF+Jay9h/PySAJqO/E+fYR4D94cazt9NLjE+6k8vjdX3LdKRfARboIMF06GIFYRZlM28xbGvaUwTO5HpEpro4HlP1KeB1uJ6xsuP9lxPJZOGABtCVRPwoojTY5Z7ou0YvAatP7RM9Epl11AFi/5QoxK3S38Tu4HKZTTBYq7Usyj5DHr8FSYUTptwfLLkTp7cdIupy3i7JowOIENOOMduqZGzn9yhiCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12004
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: d59866a50d0e432f84e7461e8a4b0069:solidrun,office365_emails,sent,inline:63c53062841a7830110b76fd4aab159a
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d3bfd42f-faac-44a9-d2f6-08deaea68407
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700016|1800799024|14060799003|35042699022|82310400026|18002099003|22082099003|921020|56012099003;
X-Microsoft-Antispam-Message-Info:
	tTtK4s4eGuIQEpJP705YG8MVXJ4w15eNi8y/aWqXn0eRzdPKR+kZc7n3+kl2/bg65HSkSkOebXaxtpmsazom9Z2LA6EseWLVJuH8oRwHn/yioj2+rOXN0gf5LuNrtHIg/bXrE0mJnGm1Ky3/p66chvA//jKqOhPcVp6jLx1Ra/XCI+CQBVfaCC5h+scMCnXeTbZAY/q9pmHBcVEmXxJf4SNY+5JlGF2SKwzgxejV5rxAU4WB29eVBWClBUcYLSiS3aobOu0pQhtj9no3FZToyP5JlpxB5RC5oK0pXok1GT57Th8J72WkWA9FxGc+DWppmz5hHCONVHK3Ii47+wJ1XAun9aE3QFvK8Dj1CEwYwlDET5tz3fPfu5tTiSyUHXI2sD7M9DqUoSFn6PvcVchiEX25eyCT5P6wCwOM8h6EjNedNpPUASlCHUtT9SiXedhfSCCk9muKieAeR5wU/XX2QOrGbBRCuoIodJJz8DXx0wGij/rfalIiVt1X1V8FVzt+eDW7j8srnMjMwf7+61KEeRXUxw6iyQwvFj7KGNUI/oNAOBqvyAtGI4st8PHSRyzrr+lTS20hufjDRumUSzrNT8ijPoFTtdonOdaI3TZwa6COsBjmCn2tB+9LCfISxGwxuaAhb93RuG+MOMEJo0AyWjZGJp87K6lIFu/Vef+s8YvBP1eTibyJHafYG+fBBvMeOHERk4ebHEf6wEQ2kshmdvzFvUbwK96HQpjTkUEreM2XpHz4LFHKYafv30JgNDzOFetYd+VP1saYI4Akvari1Q==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700016)(1800799024)(14060799003)(35042699022)(82310400026)(18002099003)(22082099003)(921020)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	i+bLRmeQ79OGMY2Y5cojm1JaLnh4ivCl6eYg3bmt3AFQ+6DFg/dQoigdm8WqJquYZ47vCTE3AfOuTZO+DqRC99X9gRjT8gSP9yPtJBEU7Gnj+84+FvArK9lidwhmYyymK2vlzkc1FdxBNOHHIoYmEfLdUVHKGcKo1Rq03jNpYgKA9QcOGSs343SaU7D8ovnlpsbkqSMJeMO56TpwmG2Vg0RIBre6IU2/8R9vg79u4tudCcJyaJ2FD0InIvgCw0imZnkRLpUasCYwcVoq7ay4MABnXrt4+yaj56dkNX+9pDdbkV8xT46ywgQxR+8N2T4hy3X7OQ96TJoduLeCYYe0Ps2Nuv/4zH18kzO0ORW6ZipwIngYv+GIoLVJnaCi6jf6QU070o3v1ZaW/EF9WHaMdbpUmVqE7kXbtXygdOYoL98V6ysAajkPbMkGYfy1dhHy
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2026 15:12:21.8406
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 523b8114-afcd-40c1-40de-08deaea688f6
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B620.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB10003

LX2160A SoC dtsi defines rather conservative thermal trip points,
alert at 85°C and critical at 95°C.

This is okay for most boards, however the SoC maximum junction
temperature is 105°C in both commercial and industrial version.

Industrial grade boards need to change the thresholds to avoid premature
thermal shutdown in high-temeprature environments.

Add labels to all thermal trip point nodes, enabling board dts to
reference them and modify properties.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index 3f63fbf2485e5..e2de7e596d2b6 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -499,13 +499,13 @@ ddr-ctrl5-thermal {
 			thermal-sensors = <&tmu 1>;
 
 			trips {
-				ddr-cluster5-alert {
+				cluster5_alert: ddr-cluster5-alert {
 					temperature = <85000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				ddr-cluster5-crit {
+				cluster5_crit: ddr-cluster5-crit {
 					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "critical";
@@ -519,13 +519,13 @@ wriop-thermal {
 			thermal-sensors = <&tmu 2>;
 
 			trips {
-				wriop-alert {
+				wriop_alert: wriop-alert {
 					temperature = <85000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				wriop-crit {
+				wriop_crit: wriop-crit {
 					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "critical";
@@ -539,13 +539,13 @@ dce-thermal {
 			thermal-sensors = <&tmu 3>;
 
 			trips {
-				dce-qbman-alert {
+				dce_qbman_alert: dce-qbman-alert {
 					temperature = <85000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				dce-qbman-crit {
+				dce_qbman_crit: dce-qbman-crit {
 					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "critical";
@@ -559,13 +559,13 @@ ccn-thermal {
 			thermal-sensors = <&tmu 4>;
 
 			trips {
-				ccn-dpaa-alert {
+				ccn_dpaa_alert: ccn-dpaa-alert {
 					temperature = <85000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				ccn-dpaa-crit {
+				ccn_dpaa_crit: ccn-dpaa-crit {
 					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "critical";
@@ -579,13 +579,13 @@ cluster4-thermal {
 			thermal-sensors = <&tmu 5>;
 
 			trips {
-				clust4-hsio3-alert {
+				cluster4_alert: clust4-hsio3-alert {
 					temperature = <85000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				clust4-hsio3-crit {
+				cluster4_crit: clust4-hsio3-crit {
 					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "critical";
@@ -599,13 +599,13 @@ cluster2-3-thermal {
 			thermal-sensors = <&tmu 6>;
 
 			trips {
-				cluster2-3-alert {
+				cluster2_3_alert: cluster2-3-alert {
 					temperature = <85000>;
 					hysteresis = <2000>;
 					type = "passive";
 				};
 
-				cluster2-3-crit {
+				cluster2_3_crit: cluster2-3-crit {
 					temperature = <95000>;
 					hysteresis = <2000>;
 					type = "critical";

-- 
2.51.0

