Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023134.outbound.protection.outlook.com [52.101.72.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA2640B6C5
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 10:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.134
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768989988; cv=fail; b=o0f1+hnBX6SpY2XdM09OCyGIcwBFHoMbHmZtxEhvVtv12JWgg7uE6TTe/80SVyOPT680+WpcP4gMTPIeufbOowCKfPrg8BZbpXvAugA7DQA/u8lp2nWeq3OllGFSnqWDUdYByMI8GBP/w7GFdTHuAfq7pGEvUnN0+6RuoQH3UKE=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768989988; c=relaxed/simple;
	bh=jwLNUtyM98Wkz28YzY3eHpWObmjcxVjddD9NfHcoVUc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Z5y3g60AtV7pLO65kh8UTnMJ9S7WXz8S+27d/VqBJWZFc3KMYsGi7B7nNXHn4f2mOIpA7IY3huGm+Fu6qXtA456eEekRFJjNuj2MOW8W+KC9TQpfEf+U0apqyzbOU6BPCKfZhYSFCIGTTxaykrsqWbkkgRxjPBNBmqvmGK31LqA=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=fEKmGdt1; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=fEKmGdt1; arc=fail smtp.client-ip=52.101.72.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="fEKmGdt1";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="fEKmGdt1"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hjNEhGfnaZWwxN8oRkApfD5qcz2UcsSd9kb1E0GiMOYOPwxwK8/nVQED8xApbgTyO71esJ08beJFLU8PGy5sNUYkeWnm53lNAGCTuDQgkaAiRP6mWqhYblyOKgWox5oBKPCbr9MjDeY4CXZm9zySxnW/u6qu5oLUi92D9kQBKY+ECDCJO3H4Y//GZiBmtcLfQVnnhTUJECU72dIeDJfqRVDbvwtXeBy9u/vc/11GWRvG5S25I5+RJMHXbYcJ8WwEyE8GK5go6XeycXRLcumFCTGSgL+fe7orbkUX/16cvh/yLx+YL/G1zE9BHZA1SXGf8IKvbMoAv2h0cpuXGu7M/w==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwLNUtyM98Wkz28YzY3eHpWObmjcxVjddD9NfHcoVUc=;
 b=FX+Ip6rwBKmhWl8F8zO4J5mQSmOeF7m4W2FMal5qOlP/pXL1hfcNErQ6x68Xa1zJ91FdOtHT3d27sRB8gY4t3PbU2JgZIC5z0qBlIOo/2ue+P/jCnpYhbma6mO8Rt0vZyf4/1bY+W0QbQn8fdHNfcZpVvaTPEGOKqIL09ci5FDWSLjUwCwH77vBrnxOy4PfWo1GSmCYfFLoFbxdC133is3deUTMxYqwmtNnTlFGxC02dcRMEO/4QdhqJCYCvN2MejkjAADyAA6v6BVAhQB/HxxuGL4cvox8nHamZI2/q8Kwex41P7VjlXLpzqKJlM3bXx6fRBXNZloVKdi6GhdRMeg==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=amarulasolutions.com
 smtp.mailfrom=solid-run.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwLNUtyM98Wkz28YzY3eHpWObmjcxVjddD9NfHcoVUc=;
 b=fEKmGdt1w5rreIl2GJ4/eeCt19Dl5LQ7EE75F3OFV2EvVt/M48Ro5m/iyo72JDSjt4wWtFx0x08qm7iXu8N60J7Z5L3Xf6SQkNC3BdrjMmJZ+KYF4wHByCVKRNyNJt8Qg50K0vdhnvJuIA3VUwAadCjNPmhBxzSmKhL7N58Bg/M=
Received: from DU7P189CA0003.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:552::9) by
 AM8PR04MB7780.eurprd04.prod.outlook.com (2603:10a6:20b:24c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 10:06:23 +0000
Received: from DU6PEPF00009526.eurprd02.prod.outlook.com
 (2603:10a6:10:552:cafe::be) by DU7P189CA0003.outlook.office365.com
 (2603:10a6:10:552::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 10:06:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU6PEPF00009526.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.4 via
 Frontend Transport; Wed, 21 Jan 2026 10:06:22 +0000
Received: from emails-2962344-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-30.eu-west-1.compute.internal [10.20.6.30])
	by mta-outgoing-dlp-431-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id D70948063C;
	Wed, 21 Jan 2026 10:06:22 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1768989982; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=jwLNUtyM98Wkz28YzY3eHpWObmjcxVjddD9NfHcoVUc=;
 b=jmZtgJUQIziDHPTf1mf4w1sYVhgw0lyba3jnGLiJS/5hN9gqpCM7DptKg0lE12/3Tvd75
 ZXdelhVe6eA0IBGhJRKS4B6K2Uvdt96G8/ZrQng37TpbzzEeOAFZGdS9bbjrKq4Vemc6Sp6
 qop7Z4WJcuA+WnJlU9CWdu9MxG2LUeU=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1768989982;
 b=eWRcktkgJJ7XOdWuNaArpImcURAmBOXOqf7b8GbwcS+h8A8EZqqF9xPszEOsVB6yfU9PB
 1xIFk9EiJON2m+ITBuOx2I/01FFqG23CXNWLaeo9RHbDBLJ7OxMr988wve99q5jnrTkm8BG
 LTdeV8wjKdygVpj1ll4SWfoSoT7UN+0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UEBIDSy7awq52FwZPFpdbwT08Eg7kfIPGBKGutYv+nz9GFPJwOtwb67WAlx0zldJz0nN54FrY/9SYyl+6i4ZFnTk7l3fdBi5fHmqhAT27sV0XzcwPRkq+5AM8AjWTQaq3z0z/ghlFwkB3+nnBYqkxMlojl3VZmhwNtk7MEH/3pf4+VhJ/n3eVSmrvq+1VK4BIW+3RJjJKkE/7Jp4g85fYbR/VTUUlVuyDr60+9PphikFs/NOqqOuT166DV8E4kbE0O9WDRnDxEiKR9nPzg9xGgal3azJTLEdpqUgqhhnQ1xOh3r0U80lHzVwK0W38wzpoF9Mbi9PSYx+Ue/a5J7vBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jwLNUtyM98Wkz28YzY3eHpWObmjcxVjddD9NfHcoVUc=;
 b=TKTNYyAhBKPQuSuUU3gc3ajIHCWrlbsshaLMunnonbRXsOq6CouQUAidhBhwwzW5F1GYgzS2dCKVTpxuelgkIngtViTHhJYmJNTiKGuHATVRaC4UwnnzppoF+shuwGZveBWsIuBMIxI1Hun4az7C6LZkKtu3jjYm/WDae8dccAgBVVd/JnqgSR+ipEMt5oCraAk0lQBmQoAyKlJ4GMd2WuEG25hFHhhQwrTy9xV4vvLx3mLJvTwIrwLIX0xldx+5qRDG2KasBGrzLRBzsO3cj49y2qZ1yU1ccp1btmvxjT0QCJZNwlUojynsO5EA0TNQLS0HC+PePlESv8MY957MdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwLNUtyM98Wkz28YzY3eHpWObmjcxVjddD9NfHcoVUc=;
 b=fEKmGdt1w5rreIl2GJ4/eeCt19Dl5LQ7EE75F3OFV2EvVt/M48Ro5m/iyo72JDSjt4wWtFx0x08qm7iXu8N60J7Z5L3Xf6SQkNC3BdrjMmJZ+KYF4wHByCVKRNyNJt8Qg50K0vdhnvJuIA3VUwAadCjNPmhBxzSmKhL7N58Bg/M=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by AM0PR04MB7154.eurprd04.prod.outlook.com (2603:10a6:208:19f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 10:06:11 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%7]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 10:06:11 +0000
From: Josua Mayer <josua@solid-run.com>
To: Daniel Baluta <daniel.baluta@gmail.com>, Sherry Sun <sherry.sun@nxp.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Frank Li <frank.li@nxp.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, Daniel Baluta
	<daniel.baluta@nxp.com>, "dario.binacchi@amarulasolutions.com"
	<dario.binacchi@amarulasolutions.com>, "alexander.stein@ew.tq-group.com"
	<alexander.stein@ew.tq-group.com>, "Markus.Niebel@tq-group.com"
	<Markus.Niebel@tq-group.com>, "matthias.schiffer@tq-group.com"
	<matthias.schiffer@tq-group.com>, "y.moog@phytec.de" <y.moog@phytec.de>,
	Francesco Dolcini <francesco.dolcini@toradex.com>, "primoz.fiser@norik.com"
	<primoz.fiser@norik.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "kernel@pengutronix.de"
	<kernel@pengutronix.de>
Subject: Re: [PATCH 1/2] dt-bindings: arm: fsl: Add i.MX93W EVK board
Thread-Topic: [PATCH 1/2] dt-bindings: arm: fsl: Add i.MX93W EVK board
Thread-Index:
 AQHcifdWr3G6LGzEnEOVFcBeN70PYLVbQV4AgAC0AICAAEZfgIAACcCAgAAdmYCAAAQegA==
Date: Wed, 21 Jan 2026 10:06:11 +0000
Message-ID: <b604d66e-d7c6-492d-9213-8d7e748dcc29@solid-run.com>
References: <20260120102604.1989725-1-sherry.sun@nxp.com>
 <20260120102604.1989725-2-sherry.sun@nxp.com>
 <aW+ullwMtDq0RpNt@lizhi-Precision-Tower-5810>
 <VI0PR04MB121146CD3EDDE9C4771B83A939296A@VI0PR04MB12114.eurprd04.prod.outlook.com>
 <2394637b-f85b-47b7-ae30-f7ac2be49c59@kernel.org>
 <VI0PR04MB1211472ABF4E87D0323D5713A9296A@VI0PR04MB12114.eurprd04.prod.outlook.com>
 <CAEnQRZDCNXcAH7kBCPLJm2pPrJ9akXX+ZMW98H7MO8Hptjp3TA@mail.gmail.com>
In-Reply-To:
 <CAEnQRZDCNXcAH7kBCPLJm2pPrJ9akXX+ZMW98H7MO8Hptjp3TA@mail.gmail.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-traffictypediagnostic:
	PAXPR04MB8749:EE_|AM0PR04MB7154:EE_|DU6PEPF00009526:EE_|AM8PR04MB7780:EE_
X-MS-Office365-Filtering-Correlation-Id: b3df0112-ac68-4313-9c98-08de58d4bb2c
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700021;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?U1ZDaHR1M1FlbEdIVWpSMDVUWk02RFNXWC90UTdrVFNCWWlBUGV6YjNlNkh1?=
 =?utf-8?B?U2w3bkhyVE9NZ1hENTVRUE9KdUFZcmppWG8zUEhqQzh2MisrcHlmWHdQRkZt?=
 =?utf-8?B?S3RHSzFwb2RRL3VjVjBMMnE1MlBuT1doSzdvSFpBL3RPSEE4dThEUUR5R0VE?=
 =?utf-8?B?M2Y1a0ZwRWRmUU5FUHFDV1lRNGFqRnhKMXg4ckFqR2taUFBnQk9YSFByRDIv?=
 =?utf-8?B?RkcwNzczRGRuSGJUdG1LR1FEQ21CZW5VMGNuQ0EwSFhhMUZDRDVTVm5PNHZ2?=
 =?utf-8?B?c0dKSG91MCsxblMwTm1laHpjTFM0Vkd3WWFGaSswdmZLMTJNNlZNektiZHpP?=
 =?utf-8?B?YlhBL0JsZ3hPY0VsdlJ5WTdyM1hJejFEY1lCOTQxTGZMb1RBeDlpRzlwZE5q?=
 =?utf-8?B?Zmc0QnVrd2RrZFlGaU5QK0d2akRUb3ZmV0NWK08weEhnZWRzVFJrOXBRTnVl?=
 =?utf-8?B?cFN0MFFqblUwZ2ZNeHFCbytHeXB5dzJINXNLZnE0dVhDbHNPWWtLc0NhTEk4?=
 =?utf-8?B?U0kwRy96T21FeDJMMjEvSWVFQ2VyK2p5bDlPc0dUQnVQRTh3VEMvamx5S212?=
 =?utf-8?B?aGNBcWF1ZHJIdnI5eE15aEU1WVdUdVdmZFVBbVlXbFZlQlBBdElqd3JVTFlj?=
 =?utf-8?B?UXZwV3pQM29QdXJVQXYvRXZCY0lBajhPYWRqcjdUZlg3cCtQV0llKzR1eUE1?=
 =?utf-8?B?Yi9JTFptbEV6WHpLemtPUnhzV0dvcnh6ZUZldlhUWGZYY2ZJZTlaejZUSktn?=
 =?utf-8?B?dmNuRHJFUlpMNmhybEdEQmx0eDV6Vk1IWDVEbFUrLzhVUzNNV0grYkhuMzky?=
 =?utf-8?B?YWx1M2gwcWprZTdaTXdIN3VueVhraE5oZkc2ZFZvK2hPUkx6cHVLTDk3QW14?=
 =?utf-8?B?dHJKbXlVdE5qbGxoeEpWYStLK1A5Wkp3R2JDNCt0YVhWWStPcHZrS2dkSkdQ?=
 =?utf-8?B?REI2ZjdJY0NvVHFvNUd3dm8vZHVDeDVFbDI0TEJNY05PeCs3Y1d4RnBzakor?=
 =?utf-8?B?enVTUmhSekZKK01xbUdjMjlQRVpZWXU2UE9FVDMyNC9nbWJ0d0sydld6bkRI?=
 =?utf-8?B?VWZjM21CTEJiUUptNTBJMERyR1l6RnZma2JsbS81UUVFVVZXQVY5a1ZVc2hs?=
 =?utf-8?B?eEdGaUFieTJRTjVMWC9lUlBRZ2szSmNpazhOZzhDWCt2aXUxUGNrM05kRHQw?=
 =?utf-8?B?ZVoxdmdGTTd0bjM5ZTI3bVBUeVg2SUlZOEFBM2dwcjI5SHdpVkxFckVYdHIr?=
 =?utf-8?B?VjM5M0RVcVUyVXFlVytKc3NHdVVrVlRTMThOQjkvVk93VktIdGdNS0RuU204?=
 =?utf-8?B?ZU1ncWNkaDRVMlhtanFiWWVyTTZTQ1dkSkYrd0dmTGVLaWJhSEV3em9ReUtz?=
 =?utf-8?B?bFVOK1czS2FFRDZuYXRDZGhYSTVjcjF2MGpZekVGSm1IZ1dJQWFlbEE1NlBH?=
 =?utf-8?B?eU51Q3NOTmhTQnczODhNM3VzTnA1RWg5dm9jcEQ3eEpVY0NDMGxmNzMvMWZp?=
 =?utf-8?B?d3FlOFpjNnFoRGxESmRIaFF2anUySXJncUZYUUZzcDhUZUg2dW00RXNGaUlZ?=
 =?utf-8?B?MXZLQXlvVXV2eUlqYXJuSmUzcTd1TERpeDNFNlQ3d1lBRk1ZVzFwY2k0eWln?=
 =?utf-8?B?aTFkdUVqdGd5Z21oK1M3UGRSMVptQUloK29ESjJFZGZtZXdvSC9NdThWTG1j?=
 =?utf-8?B?THlhUkxLYVk4RzBka2FWZDI5a0VSdXkrUHo5ZnY1eExJUFNyYm9kMnFzNmV2?=
 =?utf-8?B?R2lEaHgwOEI5NmFjTUJDWXVPTDJDQ2dvOEI5KzB4OFRYZElsKzZTeDRrSGhv?=
 =?utf-8?B?b1hlNUNHVW1naU5VRCtpbXdjc1B6cjV4NUFXbXlRK0hPM1oxSDNqKzVkTU4x?=
 =?utf-8?B?MTRQV1RtbmJOaERKWmdwYWM4TTUvNy9TcFVJODN1VjFmbEkxUWtJZEpHWUdK?=
 =?utf-8?B?NkYrSk1OcExxM1AvV3N1TGtVOFRad3FJYXFyYVMrOXcyNHZCSzdhdlJKb29O?=
 =?utf-8?B?aWIwR3JWTUdOSjNMR0xla3lPdm0xTU55SkhDS1pBTEptb2E4TVlOSWlxWjY2?=
 =?utf-8?B?aXlJY0hhQm1iUzVzTENtVmVGNlh3eHJGNDNkbEhrc2lKekVVQkN2TWFRL1lN?=
 =?utf-8?B?bTAyenR4bjhwZXNTSWpzOFFCUUZFQzFiM0lPNE9LbFpGR0pyMGpRUGEzUmFE?=
 =?utf-8?Q?TWWzLnvgfBZbg5bDlpB7VpM=3D?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <EDA4FCE0CC3E2C478FB0D042AC339011@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7154
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 3f3cf8f91aae43dd9b7b382e14208867:solidrun,office365_emails,sent,inline:c7234bc0305b26618823c27138c1a338
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	41cbc9f5-f259-42c0-3d4e-08de58d4b45b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|7416014|14060799003|1800799024|35042699022|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SXZQcmJ1L0VzOU44dzRCN0FEbkJ2S2xoeis5aCtvUWVzWlE2NHl3NDVXYXl2?=
 =?utf-8?B?bi9xc3Z5SEdSbU0wNjhxQVYrQTJ3Vy82YVptdllibVV0S0llc0RiaEZEdVVM?=
 =?utf-8?B?RUl2c3psSjBkVGRzM0FpSXpkSDhBTmZmbDMxRGJ6Kzd4ZTNHUlVJWGJmc2R0?=
 =?utf-8?B?Z0MwbmZOaGxPM2VOQldmNzdpR1l1SmtITkltQStxSFI1NmNxL0VWMHlPU1ds?=
 =?utf-8?B?YWJaSzV5cjAvOFpRV014emRueWN3cEx1WVlCYXFkMWRlRFY2d1EyZFV3RDha?=
 =?utf-8?B?MWdZb2IrV2psK2NPS1hoRGtINDVHOU0rc1ZsYnFyRW4yQXJFSmFFdnJXcW1O?=
 =?utf-8?B?K1RuV1RPS2VsZlNEaWU1VlVmcm5hZitxWjBDQ1lLQVJ3bzVIMXVSUWN0ajVI?=
 =?utf-8?B?S0lCTXcydFlwYUEwM0dHMkpWT2FKQW1MMHhiUW9SSWFNOXIxb3FZeE5WWERK?=
 =?utf-8?B?YSs1SnhpbnZIRjNGSWxmeHdvcnNqNFI1QkROWmJ4ajdTUGhTOE1CMkUycHRy?=
 =?utf-8?B?VjM2OHBaZFdXZXVoblJtUkFWWmUrV3doNk9DdW1HSkMyYWI5Y2dZekRaSFZ2?=
 =?utf-8?B?RVBNU3NGbTRaajV3VHczeDRGR3lYTEFHU1FRM0dJVXRiSzFzcjVvWWVQZkZU?=
 =?utf-8?B?YVJyU1E1K1o4M3c4UU1jM21vWURjWWs1Z29UNjUvdkhHa1JKMWdqUkcybm9j?=
 =?utf-8?B?bkV3K2RUcW83OWgyN2h0eTVDemc3SGovZ0JmSURqdTdHVVFrTXN3MEJFKy8z?=
 =?utf-8?B?ZmpKaElQKzVQSW5SeGt3VVJrelo3RGh5R1NmbTQ3cXQwRmRIQzJBemI4UWxr?=
 =?utf-8?B?azNLSHJDdW1IeVpmYWZpczZ5bHowT0hWbjQ0bzV6c1JlWExBZlQwdUJkMk1k?=
 =?utf-8?B?K2pkUjJkcDdvWWM4ODczVnZzd2NvUkRwOWpXOWE5TEhRbFB3b2tEU2RjOHRo?=
 =?utf-8?B?N3RNdnVyZHVycERLWjJ2anpsV0IvbFFsei9nOTBqdk02eTBXdStzOWcyOUVY?=
 =?utf-8?B?S2VJaFZOempiYnRKQU1MaldzZEhRWDNvVEg4K3VkcFhvWTZWNTBYV2xqdVJ4?=
 =?utf-8?B?YWNEdzk4UG92b1ZxbnU0Mi91bEZEZWdoQnNWNTIzVkNMN0xoZVB2RXFHVlI0?=
 =?utf-8?B?Qjh4b2FJMkdJN3F1RWNaNWEyZVN4bUdpaDZ4ZGN4VXIvR3l2VGZUdlc5ZE95?=
 =?utf-8?B?ZWNuMFFtUlpWRUJ5eVhSeFJvZ0t2TlpMS3dDQWdySU9iTDFWRWx1MjVQVzNt?=
 =?utf-8?B?amJ0cjFjWGY2V0UyRm9leWdqRS9paEpEZkRKbjdBenZMWklWeEFSMVhwOXBF?=
 =?utf-8?B?ZXZvS1NQUHk0NXNHc0ZEY2VoRklPWmZnR28zcG1kUTZhR0hWRm52L1RQZmhD?=
 =?utf-8?B?MmgxQ0JhSVRzdUdrZkpTQjRabE9MVXV6N1kvTC9VYVF1TzdCZUt1QkZWNU95?=
 =?utf-8?B?TGV6S2NmaFI0eVJJVFZXN1JKT01PMVZoNEhqV3RlMVFzNTBxNENCdUIvcDd0?=
 =?utf-8?B?THM5S0ZlWGlicW1CZWVLeE4rZ3VRMEZ2RUp5dUR4dnMzZ0ZBL2wxbFNSOXQ2?=
 =?utf-8?B?cWxKbDkxUTVRWlk5dkxMbXhpeWZtRjBOaEU3bGlPOFVvcnJ4bkdjRnk5ZEsw?=
 =?utf-8?B?ZzV5SUxSL01za0tieTZhU290bFVnaEpoUm9zcTZVOC96VkY5MU5xSGZrMWhY?=
 =?utf-8?B?SkFQajd0dnZ4SnlJTWc1bjhCOFVOVDdCWW1VbWdITzByWXY1YmJlRG43ejhS?=
 =?utf-8?B?WXNDZGtoWVdkMUtHaHJkZURKOXM3NHEvSTNzMlFMZkhYRVpqYVpVSkZaUkZJ?=
 =?utf-8?B?c3Y5S1lhWDV4M2ltOFhQbDBHMG5YVDJuSFF1Z1FHOXJhQWJoUGxHdUxOVFpD?=
 =?utf-8?B?ZDB0MGZVR3FidVl0Wi83VXVsVU1QQlFieFhEaUwrOXBiWk11bEZFZ2gxRmlS?=
 =?utf-8?B?ZTJueTJvRTZJVlJIbkF3RW8ydSs0K2VnYVBMWlN6WWx5d3dnb1RJODN1Mm1G?=
 =?utf-8?B?TGFEOXdxSUpnTVVSdFl5cWUxbkpUOVJEM1lkNE5DOGphNnl3Rm1aTXJFOWsz?=
 =?utf-8?B?bW9LSUxzTjV3Wi9taUNhY2hNSTJMdVNaMkxvNUxYWm1ad3Y1VFpmYjRyWjVD?=
 =?utf-8?B?eXlReVZrOWx5ZUZQckNPV21uZWlGTnNkdy9DUHZrVDdFZldoYXpQblVveWNv?=
 =?utf-8?B?RWExS3BqYTd1cHNZVVJYaUlYZTlXOTZPeHhGU1ZrVGF2ZjkzWXh6a2l0MHhI?=
 =?utf-8?B?Ti81U2trMFIrZnErYkZ3dkFyS0V3PT0=?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(7416014)(14060799003)(1800799024)(35042699022)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 10:06:22.9332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3df0112-ac68-4313-9c98-08de58d4bb2c
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7780

SGkgRGFuaWVsLA0KDQpPbiAyMS8wMS8yMDI2IDExOjUxLCBEYW5pZWwgQmFsdXRhIHdyb3RlOg0K
PiA8c25pcD4NCj4NCj4+Pj4+PiArICAgICAgICAgICAgICAtIGZzbCxpbXg5M3ctZXZrICAgICAg
ICAgICAgIyBpLk1YOTNXIEVWSyBCb2FyZA0KPj4+Pj4gSXMgOTN3IDExeDExIG9yIDE0eDE0PyBj
YW4geW91IGFkZCBzdWZmaXggdG8ga2VlcCBhbGlnbiBleGlzdGluZyBvbmUuDQo+Pj4+Pg0KPj4+
PiBIaSBGcmFuaywNCj4+Pj4NCj4+Pj4gSU1YOTNXLUVWSyBpcyB0aGUgb2ZmaWNpYWwgYm9hcmQg
bmFtZSwgaXQgYmFzaWNhbGx5IHJldXNlIHRoZSAgaS5NWDkzDQo+Pj4+IDExeDExIEVWSyBib2Fy
ZCwgYXMgZGVzY3JpYmVkIGluIHRoZSBjb3ZlciBsZXR0ZXIgYW5kIGR0cyBwYXRjaC4gSQ0KPj4+
PiBwcmVmZXIgdG8gc3RpbGwgdXNlIHRoaXMgbmFtZSAoaW14OTN3LWV2aykgdG8ga2VlcCBhbGln
biB3aXRoIHRoZSBib2FyZA0KPj4+IG9mZmljaWFsIG5hbWUuDQo+Pj4gSXQncyBzZWNvbmQgY2Fz
ZSwgcHJldmlvdXMgd2FzIGZyZG0sIHdpdGggdGhlIHNhbWUgYXJndW1lbnQuIEkgZG9uJ3QgY2Fy
ZQ0KPj4+IHdoYXQgeW91IHByZWZlciBpbnRlcm5hbGx5LiBZb3UgbXVzdCBhbGlnbiB0byB1cHN0
cmVhbSBhbmQgYWxsIE5YUCBib2FyZHMgYXJlDQo+Pj4gY2FsbGVkIHNvYy1mb28uIE5vdCBzb2Nm
b28uDQo+PiBIaSBLcnp5c3p0b2YsDQo+Pg0KPj4gVGhlIHNvYyBuYW1lIGlzIGlteDkzdywgdGhl
IGJvYXJkIGlzIGJhc2ljYWxseSByZXVzZSB0aGUgaS5NWDkzIDExeDExIEVWSywNCj4+IHNvIGRv
IHlvdSBzdWdnZXN0IHdlIG5hbWUgaXQgZnNsLGlteDkzdy0xMXgxMS1ldmsgb3IgZnNsLGlteDkz
dy1ldms/DQo+IEFzIHBlciBteSB1bmRlcnN0YW5kaW5nIGZyb20gS3J6eXN6dG9mIGNvbW1lbnQg
dGhpcyBzaG91bGQgYmUgIGZzbCxpbXg5My13LWV2ay4NCj4gTGlrZSBzb2MtZm9vIG5vdCBzb2Nm
b28uDQpJZiB0aGUgc29jIGlzICJpbXg5M3ciLCB0aGUgcGh5c2ljYWwgc2l6ZSAvIHZhcmlhbnQg
aXMgIjExeDExIiBhbmQgdGhlIA0KYm9hcmQgaXMgImV2ayIsDQp0aGVuIEknZCBkZWZpbmUgY29t
cGF0aWJsZSBhcyAiZnNsLGlteDkzdy0xMXgxMS1ldmsiLCAiZnNsLGlteDkzdyIsIA0KImZzbCxp
bXg5MyIuDQo=

