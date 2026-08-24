Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021135.outbound.protection.outlook.com [52.101.70.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962CA45629E
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 15:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.135
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787586464; cv=fail; b=qEBw8DBWNIawIzVjmKK6AU98234WmijvHvS2VjNB8hcJL1zbUxdvZKaDzVZ85asiBzNJyjD+c8jZl8wkfd0liL/Ghh5L4vpPd2NX0QlN/bCDu6oJL3lwc6uKV5vpmmwyJ/V9xFOmWJ44yNNiiMySkN8XtFOrTz0vX4f3U6zI9CU=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787586464; c=relaxed/simple;
	bh=6Ctj87apoZ8ULJFsC4Bvnz5BDKm4IgYXnCmPtJfsrR4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=kq2jcsr9CrNKWDK495W6h6k62AmfidE75UUkb1UDbTxTDPaSf8Yh6NjlHr/HRYVrUgvCKKCQ5qYQiMiZHOp/POzFXhNvw4GMFy6EUEHj3KX2Hw+MlfB416e5NKuMA0genqlDqBboNHQChsKIyUa1zTPH+xQYVOB5OHtli1SiC6c=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=BZUJNLH7; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=BZUJNLH7; arc=fail smtp.client-ip=52.101.70.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="BZUJNLH7";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="BZUJNLH7"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hktpdcs1lPWQrvZdGBlCB1gJ3wV+eBoVzmyQqCQQom2YQZolkLNNJgzJR8prswb7JCMRZcA78WyKeBufiRWTHSZEv2ERDH13lUX/WTDKq5Lo9lgcQZY8qYhjlgO43G4K85zaN4a/bWufndZv1uqfJWspI1VWHI0bF/C5pUvywBPZNfoJEIgC06LoTEcqKcNiU6oS4SnsTP0H8uCiCbq0l+47U8RjmGszhjneRuOLhOYy7Rpzl2oBZJ1v1vfHUil4t6ZfCd2NFEiNt2OxZMHhlkmuC7L9JOVgeyPYL/yR0uqhpFfkJNSdcE8iCtAGh1UhLrj9kttqTZK7ZCoVCFAorQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Ctj87apoZ8ULJFsC4Bvnz5BDKm4IgYXnCmPtJfsrR4=;
 b=bfRVWfZunDepjwW4if00SKcAchhNDHjcQ1ruyvJcIxVf58LLo/9MQn/O9iH23wE4sR57ydERg6Pl9G4RFxZlseuX1ShBjL5ZrDYllSTBp0Z9vBu8P7vTmglUy+CAFGAykGN9FE8nNB7P+Uzhg1UMxDuMlQwIhHMNpugux1lBVuYTGyvjPtKopdmBCrdeAMOCoWSpctnrlKUoSDrRUR1u8q/uzBj2cPWOT0R3xKdz53J3yTsr4zKp/j9Q5axnr7gXDsFpERXwKzx8c3XbkwzMAkIzmX22sIUoSvXZ+RlH3EuXBtyf/skD51fKDR919cENs6Lena4vtOptOTPsp0HoOg==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=free.fr smtp.mailfrom=solid-run.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=solid-run.com] dkim=[1,1,header.d=solid-run.com]
 dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Ctj87apoZ8ULJFsC4Bvnz5BDKm4IgYXnCmPtJfsrR4=;
 b=BZUJNLH7FfIf0kFzkS9s/KMN3CPuX8rDu/vQycl8rAQAnJC2SO59lAmhTtG0Qeichq77Ep0tJfX9NLaD53UR2TRZrqHdLwjSmi5AVn7506ogZePJ7x3Q1mP9GzPwdGfN+ibCqbG6ZuW++vBCzfEGOIkkahJiI79P4sPATtJlXRTTWucNPHtcuGpYUcJkGnf6Euk/Voi7mE6+61EMZZbfflqr+YMJTypWSM3oGrE0LGakGUSndjAeiCVI9PBTTpSMurCHo7jdTo+T9ILyiVGIJkRYFMkIvlp7gOGQ59hXfNO6+9xNnPeyLs/tw90N9jXSx79gFcbi75TLZoopxgS0lw==
Received: from DUZP191CA0062.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::25)
 by BR2PR04MB569136.eurprd04.prod.outlook.com (2603:10a6:2c8:4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 15:47:31 +0000
Received: from DB1PEPF00050A00.eurprd03.prod.outlook.com
 (2603:10a6:10:4fa:cafe::9b) by DUZP191CA0062.outlook.office365.com
 (2603:10a6:10:4fa::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Mon,
 24 Aug 2026 15:47:31 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB1PEPF00050A00.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Mon, 24 Aug 2026 15:47:31 +0000
Received: from emails-7916210-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-140.eu-west-1.compute.internal [10.20.6.140])
	by mta-outgoing-dlp-942-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 2812980864;
	Mon, 24 Aug 2026 15:47:31 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1787586451;
 b=kDrZDGzZ1Z5lTqcve0wIT5zmMANH1R8hlrG7K8kKjzp5yr6rczUnI9jKM1OvQRPdL5oML
 /R9RgG2JT4lUC6KcnEbMVdwIhJZzzOg4Lcf1+aAYerhwgxoizfmlZDhNMQnuePcrh0xyMw/
 2iFsb3VMLRIl+uDtw4NBiDIgbnEiUNA=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1787586451; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=6Ctj87apoZ8ULJFsC4Bvnz5BDKm4IgYXnCmPtJfsrR4=;
 b=kb7/YzJDBVL70qKnJjgyxep+tR6N0ma9+0FNE0oNLrML3khjEJQQx/cm0uStE8pprKteN
 ifLplbab+YFjUVvgXWoReCPYcrRoj1EkArL5hjQx1ax3QeRRIQdE/9AsmH8i1O5LR7fCIfO
 47utDbCzXWdtBAwRA0DDN41223FSQQE=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Ctj87apoZ8ULJFsC4Bvnz5BDKm4IgYXnCmPtJfsrR4=;
 b=BZUJNLH7FfIf0kFzkS9s/KMN3CPuX8rDu/vQycl8rAQAnJC2SO59lAmhTtG0Qeichq77Ep0tJfX9NLaD53UR2TRZrqHdLwjSmi5AVn7506ogZePJ7x3Q1mP9GzPwdGfN+ibCqbG6ZuW++vBCzfEGOIkkahJiI79P4sPATtJlXRTTWucNPHtcuGpYUcJkGnf6Euk/Voi7mE6+61EMZZbfflqr+YMJTypWSM3oGrE0LGakGUSndjAeiCVI9PBTTpSMurCHo7jdTo+T9ILyiVGIJkRYFMkIvlp7gOGQ59hXfNO6+9xNnPeyLs/tw90N9jXSx79gFcbi75TLZoopxgS0lw==
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by AM9PR04MB7716.eurprd04.prod.outlook.com (2603:10a6:20b:280::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 15:47:11 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%3]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 15:47:11 +0000
From: Josua Mayer <josua@solid-run.com>
To: "vjardin@free.fr" <vjardin@free.fr>, Frank Li <Frank.Li@nxp.com>, Carlos
 Song <carlos.song@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Thibaut Collet <thbt.cllt@gmail.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: lx2160a: fix incorrect pinmux
Thread-Topic: [PATCH v2 1/3] arm64: dts: lx2160a: fix incorrect pinmux
Thread-Index: AQHdM8o50qroPJRN2Ue65xPLOL+RJratWBEA
Date: Mon, 24 Aug 2026 15:47:10 +0000
Message-ID: <4271e097-2b30-4f83-8419-f04183307455@solid-run.com>
References:
 <20260824-for-upstream-lx2160a-pinmux-fix-v2-0-0a525d5f4cd5@free.fr>
 <20260824-for-upstream-lx2160a-pinmux-fix-v2-1-0a525d5f4cd5@free.fr>
In-Reply-To:
 <20260824-for-upstream-lx2160a-pinmux-fix-v2-1-0a525d5f4cd5@free.fr>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	VI1PR04MB5807:EE_|AM9PR04MB7716:EE_|DB1PEPF00050A00:EE_|BR2PR04MB569136:EE_
X-MS-Office365-Filtering-Correlation-Id: f202bb2f-bf89-49d2-4abf-08df01f70212
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|38070700021|6133799003|10067099003|4143699003|5023799004|56012099006|18002099003|22082099003|15866825006|41080700001;
X-Microsoft-Antispam-Message-Info-Original:
 Q9D7ViW+Pts4Zd9fpPtCDSiipnipMed0mo0zOJXDuPpm4/rEeEBVWw+Pjcmr8g7R4lJabB94gfLv3j4qb1qlhV6GGEh1OgcevJ7VI4fxIg9yJmDJQEFRehjwe4RJSBKhm7BwoI2zQkvWD5iroI3OaqPgmF3ZpaxQwxASub42NUluVtfoMQ6GB81K4ZUV8Y6mAewvazh9+0YdxubVV4Tf8agwOSxZDwS58W9Co0KDYpmwHGwMgFGXjm9cFlb55QFyHcRNWakIzsze21yHX9EzpBLN/sgMEF0jDuazd7UcvXuh6CZLu5RTsy+DinuEUend3OIuJ/HFhbFAbRU+2uxkGL6V+zKOfKkOOQ1nCRRMZTcX20ryvFOZdYv+vPkXAsjYbBfxHKfI0gNpWvs2pBu+E1BoJQfxwNtDmpfyErOcLb4EEzv3ISt5j2rUH8WIEhNMTzG6o1Khd0pEaM7i1qnEQzA1zacZJIo0AMnm0rJJB1c096RzyvjAyG2ecECfhtg1kM3/4VLLjVwMFmPNPcZdsTECeW+3i4xZOe/mxRvgkSszt9EReKQVVvKmKg7PCrMqeBdBqxUpqhhaauj0OnBCcal2y4Fvucj6XMXpMIjMRzdDieyq/CwPcyyhABIxQWyaKJLqj+aXIz7Pjg/yEnDIZGWivpGuKcBBZBT03jBY6iUMGre0BeCUv5mk1F0XnavJ5YEbMJ4uL3PU8hp/rAb7zVpJi9ZllMQhKPoUl47zFzXjy0216/HEHz5PjQAd6JIU2bpP+DFjUOtPQJdgG+IO1w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(38070700021)(6133799003)(10067099003)(4143699003)(5023799004)(56012099006)(18002099003)(22082099003)(15866825006)(41080700001);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8A2889D2AD31D1428262352D198721C4@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 zyvC0uvm9tose0ph3k1QWYNupUzm4S1J5ldV/Z6VDhyVig8FzTHCctngab3hD7FCcQN42YfYRbdQGbnRi5+a/MCpBkDH7vQVHMemJUESjnlQk2KcPGLKomYu8EB4PXcuIQFlNc8sVSBfaKZpddsrpNwgIOI+/n+4qplucQqLRBGmg+UMt75GtKpX/6ikfY/RjabbbkbBF2X9GJyT42+6zm95kCQOYhIFMSLPpyIidH5spBjX86qyogzaYJUTe6Km4pDtYIfAHsS52UHlic0mPR6Si4GXuv8Z8apAkyO/4QYhAc2yC/+uLlADtYziqjZvdQXMptQapT+KezWygA6VTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7716
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 0d46536a6ef14ac1939bd59204bb666e:solidrun,office365_emails,sent,inline:1d5dc2100f085a568c1eeb485abea290
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=okocsGk9EVv4gCnWLdE9jVK3xTwBqWOkFiVG5RaCfnwTFrw69ajWMGIhXjKeV73oA0VXTkw2NLDtFjGN6VuR3pc5OlsVnO8xK4jzKho93la2UGpj8MpUiXYF9BOGEyHK/3eGOHP6MB7AdA7WjpJifGPRXkNe7xq9F2cqNKo0zRSAlQc9qzFn0pWDdAhW5Rd11xcPMleTB/aJOHTXHH34lxkmDZfObES/WHPPDhADcujYWiLA7v+Q0nItTPlr0cIPB7HsRfPgZroOdguQuT5OTgzEvcvZ/VV9TejfTmx7C6IEM5UJvfYvAV742zwT+xo8kukygO//Jjvb9L00eWC2XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Ctj87apoZ8ULJFsC4Bvnz5BDKm4IgYXnCmPtJfsrR4=;
 b=ppN6XFAse7N2jsE1KrkOIVRGz4Zf1daIWGHltSRsKgF0TCjI6xBrDyCg/gNr1TEL43PmFKEfH6CvqUBwFBev2ymPaGnEZDT5ggCENZqzkDsszJtHdMcYLzrgmW4JDwqa4D9Hfcb50a0qjRfpB/N0/ZlOiabnSPVvoXG+/vJnYzKoJqIfWX3lXoAsMPnAqMJ7ocWGRnG6ppIgmRWx9h7MdFMGpLWz4hdVB6FXQs7SFseZ8ucGTch4fjC1zMMjRxOuqfx+Zdm3BodugxtbgNWYVhMGirQpBl50pomCzqQjcTKbiMbWRf9yDW/5aP7reSErbIhn6VqJ05FmaXxIts7uKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	86a20e4f-c74a-47a1-2e03-08df01f6f60b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|35042699022|14060799003|376014|36860700016|7416014|1800799024|6133799003|18002099003|22082099003|56012099006|4143699003|5023799004|10067099003|15866825006|41080700001;
X-Microsoft-Antispam-Message-Info:
	7LJSej7TJcO+rwTO2uavYiEl1sa1rOFaw9hcTAGH0ofv2VBFNo2WNPK4+pXaiHw69fLkb+cGC0Iu+RQyESU0XlBUUYeJtVLQ4z8tNrRrBIjXyaDtN/IkWIHqSQ6fBedpuXwkydNAyntTGXBazJ5x3IP36vxvUppHPczCcj5qVAjWAN7FWb995aa+JWoDsSvKSzPKrfRtWCiyZyvwfOf1Wx/ZrWaZdi40704zpsJyank3y86I1IV+5NzDDL9id26fT7K5xhTeZT+74mbUkq1VfZRebhpClFD9V8pfSw9j4qBP3wfoMabA6/V1kofWAMPY63hDbpGcMOWT7sMVr0DbBXPaycCM0j4CEJZEZUMvhMZiW0DuPL37XkJ8i3eu62Gx98gwjD7tH0ya4RPM6egku7zFTHUtXx7V1CygnnHOMuxXDVhFMZ0Ws0PEE5a565PKc6wGQkDIfU9Uh2I25UwpTqNH+qC7PhAzGRrzOt++NqGvcDzZ0or9BlJz6Ku8rkBj9xPPuiGhAVXo2eg0KfIv5kkm4POUhzEe0znKuDtlhUw7TnB20kRBfZxvvQxnpOw/siOXOI20Q2PSeEeqvOOO8wfn+KOHEKhex4SAWV/qYOxk4OtmX8X6Pe3S/rR5VhhebHLUZxx87EWB9IVC13SE+5H3dxDflC+gVv2ItGsEh74FF1rO4s4R7GLQ+M5LaoyxcYhnZfhsQMS51/UaejZa+nHFs1gEGSq3NQWPQ4zWAaRh+yZgkCnl0CS8kRUgqRTSNw+/wbcPrYHh8COhma1dLlD6jDC7I0lEkRn6XUEAA1A=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(35042699022)(14060799003)(376014)(36860700016)(7416014)(1800799024)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003)(5023799004)(10067099003)(15866825006)(41080700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GR4PIpNc6h5KEynuSeq02ZbrQX6K/i+qkELxog9KXsiNYQyIvlexIdRuM2lDYPfm29+66TYNWcH6hvNKjgDfaiCd7UlFC5LQZPpz8Qiyb2aQEOrTTwiy7Jbboa5WvpTCYgxuUlmR584LoZ1tCUAPCu3LgBOzktnykmeIgrqGn33pZyVArxlNj4ztAS6NsQhdYbnhTn8it4z0c9NflhhnkMmNxIo3HhWitHqHtJpw+iXwtqChIC6tICZP5PUFWWimj1qhjCPrVR66jKp89ujIG9B3oL4f9NkycR8CAulzaLzfr5+nMD5ShwDBVFgmogN3Ugad7gz/cf07lWgBLhiOjSd4zDOsibq3eITTc6AefSvhCi8g0OwWELohH5eB8iXLBkz2kkqJN68zsqCO519qLxUTo4o1tjMP1MatWt3FU2q+FzEB7CaN5zhIbEqIQpDT
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 15:47:31.2760
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f202bb2f-bf89-49d2-4abf-08df01f70212
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF00050A00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR2PR04MB569136

QW0gMjQuMDguMjYgdW0gMTU6MTIgc2NocmllYiBWaW5jZW50IEphcmRpbiB2aWEgQjQgUmVsYXk6
DQo+IEZyb206IFZpbmNlbnQgSmFyZGluIDx2amFyZGluQGZyZWUuZnI+DQo+DQo+IEZvciBncGlv
MSB2YWx1ZSBzZXQgZm9yIHBpbmN0cmwgaXMgb3V0c2lkZSB0aGUgbWFzayBhbmQgc28gd2lsbCBk
bw0KPiBub3RoaW5nLg0KPg0KPiBBZGQgdGhlIG1pc3Npbmcgb2Zmc2V0IGZvciB2YWx1ZSBmaWVs
ZCB0byBiZSB0aGUgc2FtZSBhcyB0aGUgbWFzayBhcw0KPiBleHBlY3RlZC4NCj4NCj4gRml4ZXM6
IDI4NGFkNzA2NGFhYSAoImFybTY0OiBkdHM6IGx4MjE2MGE6IGNvbXBsZXRlIHBpbm11eCBmb3Ig
cmN3c3IxMiBjb25maWd1cmF0aW9uIHdvcmQiKQ0KPiBTdWdnZXN0ZWQtYnk6IFRoaWJhdXQgQ29s
bGV0IDx0aGJ0LmNsbHRAZ21haWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IEphcmRp
biA8dmphcmRpbkBmcmVlLmZyPg0KPiAtLS0NCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNj
YWxlL2ZzbC1seDIxNnguZHRzaSB8IDYgKysrLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9i
b290L2R0cy9mcmVlc2NhbGUvZnNsLWx4MjE2eC5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9m
cmVlc2NhbGUvZnNsLWx4MjE2eC5kdHNpDQo+IGluZGV4IGFlNmUzNzg3MGM1ZTUuLmQ0NTIyYTE5
NDA1YTkgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1s
eDIxNnguZHRzaQ0KPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wtbHgy
MTZ4LmR0c2kNCj4gQEAgLTE2MjIsNyArMTYyMiw3IEBAIGZzcGlfZGF0YTc0X3BpbnM6IHhzcGkx
LWRhdGE3NC1waW5zIHsNCj4gIAkJCX07DQo+ICANCj4gIAkJCWdwaW8xXzMxXzI4X3BpbnM6IHhz
cGkxLWRhdGE3NC1ncGlvLXBpbnMgew0KPiAtCQkJCXBpbmN0cmwtc2luZ2xlLGJpdHMgPSA8MHgw
IDB4MSAoMHg3IDw8IDE1KT47DQo+ICsJCQkJcGluY3RybC1zaW5nbGUsYml0cyA9IDwweDAgKDB4
MSA8PCAxNSkgKDB4NyA8PCAxNSk+Ow0KPiAgCQkJfTsNCj4gIA0KPiAgCQkJZnNwaV9kYXRhMzBf
cGluczogeHNwaTEtZGF0YTMwLXBpbnMgew0KPiBAQCAtMTYzMCw3ICsxNjMwLDcgQEAgZnNwaV9k
YXRhMzBfcGluczogeHNwaTEtZGF0YTMwLXBpbnMgew0KPiAgCQkJfTsNCj4gIA0KPiAgCQkJZ3Bp
bzFfMjdfMjRfcGluczogeHNwaTEtZGF0YTMwLWdwaW8tcGlucyB7DQo+IC0JCQkJcGluY3RybC1z
aW5nbGUsYml0cyA9IDwweDAgMHgxICgweDcgPDwgMTgpPjsNCj4gKwkJCQlwaW5jdHJsLXNpbmds
ZSxiaXRzID0gPDB4MCAoMHgxIDw8IDE4KSAoMHg3IDw8IDE4KT47DQo+ICAJCQl9Ow0KPiAgDQo+
ICAJCQlmc3BpX2Rxc19zY2tfY3MxMF9waW5zOiB4c3BpMS1iYXNlLXBpbnMgew0KPiBAQCAtMTYz
OCw3ICsxNjM4LDcgQEAgZnNwaV9kcXNfc2NrX2NzMTBfcGluczogeHNwaTEtYmFzZS1waW5zIHsN
Cj4gIAkJCX07DQo+ICANCj4gIAkJCWdwaW8xXzIzXzIwX3BpbnM6IHhzcGkxLWJhc2UtZ3Bpby1w
aW5zIHsNCj4gLQkJCQlwaW5jdHJsLXNpbmdsZSxiaXRzID0gPDB4MCAweDEgKDB4NyA8PCAyMSk+
Ow0KPiArCQkJCXBpbmN0cmwtc2luZ2xlLGJpdHMgPSA8MHgwICgweDEgPDwgMjEpICgweDcgPDwg
MjEpPjsNCj4gIAkJCX07DQo+ICANCj4gIAkJCWVzZGhjMF9jbWRfZGF0YTMwX2Nsa192c2VsX3Bp
bnM6IHNkaGMxLWJhc2Utc2RoYy12c2VsLXBpbnMgew0KPg0KUmV2aWV3ZWQtYnk6IEpvc3VhIE1h
eWVyIDxqb3N1YUBzb2xpZC1ydW4uY29tPg0K
