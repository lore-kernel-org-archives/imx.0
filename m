Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023084.outbound.protection.outlook.com [40.107.162.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6652C388E65
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 10:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.84
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773396097; cv=fail; b=CiYQrUX6i9TvelGBKXpK1HzkDa9Tl0bXybgrztIe47aYCyxvMAoai1m3Go3GjlmYqPDn9diRQGDt8vi37iop36vzBLfxmgd0tzaEpz/JlZeXH4xAseTZ58340tGJdugfiPaM/1UwdsZRyN2GGzP95CpxVryfIZbmuMOX5Y2olx4=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773396097; c=relaxed/simple;
	bh=1vRvY0IU7QJJPUdsJolBIFF+B/ivl6zY5hLn2OMvZN8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Eu/c0DRTeKP/ZVD8FYjwzOcP5rjtntf8dnV+C+Th8JglFuHsVGwX09fCH4svrVzX7XBBulBx9F3U+GScC+AfDwNDvxQcDyizjHnzBZx40jLRk292WdRg8MfDl/byrg1/RF31EEKRxPvTRaUwGYtj/REyhEgBeU4b+33fV0ANTX8=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=cLo31cQe; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=cLo31cQe; arc=fail smtp.client-ip=40.107.162.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="cLo31cQe";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="cLo31cQe"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=eEeyYAvBCK6syzkYjJYO/lupJhebg82H4QcbXB2acXEE72xj99Z7MCW9cdLJ33pU+ulcYwRebFQ3Tmo5O1cLVG4yVaPvxXxPkO7LMs+1eanqckt5dyQaWgb0mqOY6UuhZonD4sAGP0et+8rcbOsoUIEAndOK188f2z/Gzsi28ADszegGA+eaeyBpH+6aGUzPJUVg/mfJeqc12Bq+4F6TCfxSglk0On5WzJGz5O7oHPcYuSIzkwyPd0Uen63LOnff7tpv8533yRrLglnmcw7mcEf2mneHBH+ehJ1D+0+SgAtYpZPakHkx5jG8uJZFNdwGIpslxBYLDL8hTzK4xEJu2A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vRvY0IU7QJJPUdsJolBIFF+B/ivl6zY5hLn2OMvZN8=;
 b=qJR6C4bnQbooPBq+pv8GY27YIcBwk11Uf6+2cEg1sYrcmNHEqIcw9xUMpXUZpom7hlujuxHq7uTGOMeBkt2zQ0V9FxJthJhMsPOAIlynTFdeRBhmPwt5tWOo0edQIsmFtXVpCqUXvNPqqcaw00q/MwNVSPFHwR9xHsMVvag1/q6Ugfyuvr/kTZYh2VBEAJLJZCV6Q6pOkhRgU0A6RwqGCDyyQ3JCWa5A4v45qgrnNV+/V71wh95dr5doIV0aoQLVWdH5bYOACBXKev+KsYaQguzl6cIey4lf5HdkkXX96Mr9DA6JCes51nyjAv5s0FxBk8CNuMFyT0qgB9M4STpSGg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=softfail (sender ip
 is 52.17.62.50) smtp.rcpttodomain=gmail.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vRvY0IU7QJJPUdsJolBIFF+B/ivl6zY5hLn2OMvZN8=;
 b=cLo31cQe2wZQaujrLHsXABJ6fFBEQxoLVKJZj4dEiPQlSvdwrR8fjxW58E3xBVEqgBZ2vxI3VePSjCP3tsFLDr5eOwRNAgn93TUn104sCXVb+DZGmWlxTHNpOzglayRWI3zHHOGYGDZnyBOG5zDkPxOF+/FrcPANrtx+BucNFEk=
Received: from AS4P192CA0033.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:658::27)
 by AM9PR04MB8275.eurprd04.prod.outlook.com (2603:10a6:20b:3ec::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Fri, 13 Mar
 2026 10:01:28 +0000
Received: from AMS0EPF000001B6.eurprd05.prod.outlook.com
 (2603:10a6:20b:658:cafe::ce) by AS4P192CA0033.outlook.office365.com
 (2603:10a6:20b:658::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.16 via Frontend Transport; Fri,
 13 Mar 2026 10:01:30 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 solid-run.com discourages use of 52.17.62.50 as permitted sender)
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF000001B6.mail.protection.outlook.com (10.167.16.170) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Fri, 13 Mar 2026 10:01:30 +0000
Received: from emails-1266110-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-17.eu-west-1.compute.internal [10.20.6.17])
	by mta-outgoing-dlp-467-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 505ED7FEED;
	Fri, 13 Mar 2026 10:01:30 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Fri Mar 13 10:01:23 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wUN8gl2kbF5tRqMMNgLNTie7xXlCXjguVDXcC6FMnBmpiYnOp+ysG29lzMUoUQM56M59rJu+3+JgVsU2WhfPmIWvjwjrXHC7gTWPPDKMbUJF71dcC27hOFw/3K9n8rCp848epQor8xn8m1pmT/dRvZ/ii19Fd+L+sUZ9xNGq3mU3i0R9IeqAwbGdvpAYhZksrOGZokxbIjx4jvOK4y20gFNCiDMpMgDHW4hkLjEWBDE9XGIaXkGa3/3w0CRl6oT5Hd4icjlMz3+N6UF2Y7sBKeHgWnk9JejnU8jLHO6tQ1xD6YUh7kc5ClR8RtVDJ/U+ja4mvKQhif3WSRmmbGBlGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1vRvY0IU7QJJPUdsJolBIFF+B/ivl6zY5hLn2OMvZN8=;
 b=QDymIg1h3oYsbM0+yXqTemhakxb+xkrfEGF9c6S2GmgMTbHn5CsHPXirDFSAjf89o0+L3gUdOPlghGFcB9zCDv7k4KwnFt1ONt0ziDgLMvy6EshrFgG4wFM0zberldo2qJxu9UjaO09uAF2funY0AzdjtcIK26oiBAj0PocxZderQ6JFsY1ynXLaEOTvWshrD9Jjgeu4tROR96baVZcjshFKcmNoHfT/FIV6vIdgcCud7sqYbp4cp6aXBNLBgfJkLR/Z3dEhyu2JfW+z6vzTJFB3QE1t7UqJI4JFq/ov9phoLgg8ZfNOMvVe4p4iTgbbdZLG/CcLw3gDa+KPgIo13w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1vRvY0IU7QJJPUdsJolBIFF+B/ivl6zY5hLn2OMvZN8=;
 b=cLo31cQe2wZQaujrLHsXABJ6fFBEQxoLVKJZj4dEiPQlSvdwrR8fjxW58E3xBVEqgBZ2vxI3VePSjCP3tsFLDr5eOwRNAgn93TUn104sCXVb+DZGmWlxTHNpOzglayRWI3zHHOGYGDZnyBOG5zDkPxOF+/FrcPANrtx+BucNFEk=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PR3PR04MB7417.eurprd04.prod.outlook.com (2603:10a6:102:8e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 10:01:16 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::d782:fbb2:be9a:43f1%3]) with mapi id 15.20.9700.015; Fri, 13 Mar 2026
 10:01:08 +0000
From: Josua Mayer <josua@solid-run.com>
To: Frank Li <Frank.li@nxp.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Mikhail Anikin
	<mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v9 8/8] arm64: dts: add description for solidrun i.mx8mm
 som and evb
Thread-Topic: [PATCH v9 8/8] arm64: dts: add description for solidrun i.mx8mm
 som and evb
Thread-Index: AQHcpz4a7szQRaQXb0aCoWZsVdtKILWmmXiAgAW4ugA=
Date: Fri, 13 Mar 2026 10:01:08 +0000
Message-ID: <ee743a02-103a-4f20-91da-99d6cba699ff@solid-run.com>
References: <20260226-imx8mp-hb-iiot-v9-0-4533235eeb34@solid-run.com>
 <20260226-imx8mp-hb-iiot-v9-8-4533235eeb34@solid-run.com>
 <aa8TvVC8KWBiVGrG@lizhi-Precision-Tower-5810>
In-Reply-To: <aa8TvVC8KWBiVGrG@lizhi-Precision-Tower-5810>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	PAXPR04MB8749:EE_|PR3PR04MB7417:EE_|AMS0EPF000001B6:EE_|AM9PR04MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b99835a-93ee-4521-9090-08de80e78020
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|38070700021|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 48FARr8o9J8NnnJD6ofsYf+T4ttRvOobXtWczLloVqLdBMJFQW4jkq4gkhfYfo625s0x+Ht9pBybxR7mx3y27xD1F0+gR/gTzQrlArmdeVK/miJVKRAUo+0yM04aZ4cXxfA4KRLHUQKDvMA/2poTXoZ5z727y8AS2v07AzQ5j7yAp7IMY4NLbkRz9UIGomwSRjPGvJWPA4suWawEckLjUz6qOUjCxL/ipj/qYT0DaQJtlLatk5hvVJxmv5vUKL8TuavZunOoiNHDV8a72iieQrMkYuA4QLHVqu4FEiufJGk48NM7wg28D4D4QB4U3jOfncOkZf83nLrf3eVJ/anrLM8bJZWYkK1hniSbeMIR1Mo/s5SB0NPs310voIgfWE5g1OScr4nIQNcNAN224pnXwtfwuNy4R/X4ndEZk+VGMMehOPukRL6xvfXdepJc8thBLxDMITUimlwmqkTkhj+qq1vk438MshRR2HZu/tNWpu0am2Z9MWmfhJ3kUqhz5L5VRxhM3TXOolheJ0dWIXqvOnFf8+I2cbBBxrXasnXDY4b+wj1WSJF3pUMfPlvj/g9jRyZsSIv8S98HB4jAByI4xc5HgpAEj8oiAYAVm46am4f9wJ56bZHxnTyKNMB2oh+AekNfie0Zzn9FmNAE6Lv1ce5UScLs67Y32HegK30o55ZwDP5UA9qAaGydKjrNncTpidApdCGbVYKI+7QBK560hhkxXMxnAFMYMDTXI7pBPw2zh5OEsXCpPrZROXJOadWg
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <C0CF06843D4BE34D861DD7684890F17B@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 P2vHKNJ10CyWcwUhS04h7Yv9xhvpDaXJxj7rU2FUadmwmDC/ipopcl5HJFnXmGcTRKzKh7yteRBOoYgPxYQvEXPJP85y2gwrzyhudnHKudXWM2zzm9L8G5lN6DdseuvNAug1U6pS7vFPs9m4Tz7WwXNmfHU0WvzNgybBcptWf8QNQP2cs3x07fSWm5lP7iWzilKqMFOoLpsuDTK3BmhjRzfbl6VvP3Xdwaalp9r2IAS8SowtJo257lcb7YZZgha+QLSbUDHrwQg08fYIhA8eWsvHytWU74WlL8x2FoblZk6H2ZrxcHkxFfgaz9maFvS9U+ypZ9VE5nEAoGCTjLkMog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7417
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 3b530648d5024875b7f5471019a4af96:solidrun,office365_emails,sent,inline:542bd80e4450dd43529c7d8f437737e6
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001B6.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3012e0d8-ccbf-4ce6-49a8-08de80e77309
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|7416014|14060799003|35042699022|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	smerMzT9fF8zw7qYTpnhIQHGfaCFlXUwEqGGymP9RYC4T4gV/Fw/Jyx1DhwjaW5ZNPrXU/0BaZJXaY79dFh4u96ROa1I5YKYdLrdRDHIy1A9vqnG+Wi3xs5JKt4nhuPenFulLnCzgmH+p5uIVsE9s3xOK9bx2BQKzrTMSDk407wEyBGq5XuEweRGr90yj0MNHADHrPz2v2kYS2QBd15r93NVuh/3qo3wwNMEfEyuMCQ/oBr5SvKOphZRzEzTudGrtCJohrk67CjIO5h3J+nXp9cLRkukWwRvANi1nz0Vdxq73iiF/qwK1MJnrTGUpBjhs7HPNeajNOY5a6sdUuc4WycuX50uvFm1yBJZwKghVGeQTXt2IyOGPTX4UzXDcFThqHwSHkM/MSc08USRYm7cqw6x03Rb5VDGVyPfapqA3NsFVDUzWyZmnW2qEDQCX29oVeprV0kOECDL3Uyo+qRSkldBA1m/mdS1sYloGUab8sPv8OrKs+cFJ92G6wXZvFM+5XHdHOmE9A2Cc9NPOcI/CJA1ZeF1MmHn8vPWccXQUwbVnvSNRIafrVxN4vhJe8GyOcQe0STnft9Gv5AFEWgueVB3x0E3NVoOjj6L3T73b9JatzFRfvlqMPfRTYAW5cqBUBA9B6clw0adwx7xzXDBTX6CwyvyRqwAZTxPEUnYW5TupePyIK5t1RgZk8Y+9pbJXK5cl0NtM6QN4lpSldFlYFgK4cizvzYJQgmvIjKfwJ0=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(7416014)(14060799003)(35042699022)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DsJ2sFWdUjHDENktDUhwubKItI6ehnyf9XS3f5fDH0QcTyyd/CM7Xy2aCpKzHpcM1sTe7m0jU0m0TTqzHlduUcxa8gV23Vb6i8S9rWL3EdCcsKLRG+neT6ym387VgrHZXgyzAEtEQsHBBIojX/Yy2+mtgz4dbtL2iZK6CZna1l5dO2kMGjRQahxPuVb234bJKujPqiqpZIWah1NE0uB2Vs7qVuSJBwFErWjDKDZ91MH3JH5SFHU7P1796zVhOhTZmivIZ+ncGignatia3q60CYuuAE3tL6d1CotBn5S8Jayqoghxy/ELrs6UzVEScmMRcFgaZXdTcGFYQHAl4J4TDIAgp9mt+qoDgybUsVdXBE1SG/Gd2pT3ql5dtTWA8XeN1VdJ2UCWMfndcgq6/N0vwQoqRuSZjmmIM8/SBLVAruoWGYnfkKNkCxiY8yO8Pym1
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 10:01:30.7489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b99835a-93ee-4521-9090-08de80e78020
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001B6.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8275

SGkgRnJhbmssDQoNCkFtIDA5LjAzLjI2IHVtIDE5OjM4IHNjaHJpZWIgRnJhbmsgTGk6DQo+IE9u
IFRodSwgRmViIDI2LCAyMDI2IGF0IDA2OjM2OjM3UE0gKzAyMDAsIEpvc3VhIE1heWVyIHdyb3Rl
Og0KPj4gQWRkIGRlc2NyaXB0aW9uIGZvciB0aGUgU29saWRSdW4gaS5NWDhNIE1pbmkgU29NIG9u
IEh1bW1pbmdCb2FyZCBSaXBwbGUuDQo+Pg0KPj4gVGhlIFNvTSBmZWF0dXJlczoNCj4+IC0gMUdi
cHMgRXRoZXJuZXQgd2l0aCBQSFkNCj4+IC0gZU1NQw0KPj4gLSAxLzJHQiBERFINCj4+IC0gTlBV
IChhc3NlbWJseSBvcHRpb24pDQo+PiAtIFdpRmkgKyBCbHVldG9vdGgNCj4+DQo+PiBUaGUgSHVt
bWluZ0JvYXJkIFJpcHBsZSBmZWF0dXJlczoNCj4+IC0gMnggVVNCLTIuMCBUeXBlLUEgY29ubmVj
dG9yDQo+PiAtIDFHYnBzIFJKNDUgRXRoZXJuZXQgd2l0aCBQb0UNCj4+IC0gbWljcm9TRCBjb25u
ZWN0b3INCj4+IC0gbWljcm9IRE1JIGNvbm5lY3Rvcg0KPj4gLSBtcGNpZSBjb25uZWN0b3Igd2l0
aCBVU0ItMi4wIGludGVyZmFjZSArIFNJTSBjYXJkIGhvbGRlcg0KPj4gLSBtaWNyb1VTQiBjb25u
ZWN0b3IgZm9yIGNvbnNvbGUgKHVzaW5nIGZkdGRpIGNoaXApDQo+PiAtIFJUQyB3aXRoIGJhY2t1
cCBiYXR0ZXJ5DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSm9zdWEgTWF5ZXIgPGpvc3VhQHNvbGlk
LXJ1bi5jb20+DQo+PiAtLS0NCj4+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9NYWtl
ZmlsZSAgICAgICAgICAgICB8ICAgMiArDQo+PiAgLi4uL2R0cy9mcmVlc2NhbGUvaW14OG1tLWh1
bW1pbmdib2FyZC1yaXBwbGUuZHRzICAgfCAzMzUgKysrKysrKysrKysrKysrKysrDQo+PiAgYXJj
aC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1tLXNyLXNvbS5kdHNpICAgfCAzOTMgKysr
KysrKysrKysrKysrKysrKysrDQo+PiAgMyBmaWxlcyBjaGFuZ2VkLCA3MzAgaW5zZXJ0aW9ucygr
KQ0KPiBQbGVhc2UgcnVuIGh0dHBzOi8vZ2l0aHViLmNvbS9sem51YWEvZHQtZm9ybWF0IGZvciBu
ZXcgZHRzKGkpIGZpbGVzLg0KPg0KPj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
ZnJlZXNjYWxlL01ha2VmaWxlIGIvYXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvTWFrZWZp
bGUNCj4+IGluZGV4IGE2MWVkMDk4ZmY4ZC4uMTMxNGFlYzY2MzRiIDEwMDY0NA0KPj4gLS0tIGEv
YXJjaC9hcm02NC9ib290L2R0cy9mcmVlc2NhbGUvTWFrZWZpbGUNCj4+ICsrKyBiL2FyY2gvYXJt
NjQvYm9vdC9kdHMvZnJlZXNjYWxlL01ha2VmaWxlDQo+PiBAQCAtMTI2LDYgKzEyNiw4IEBAIGlt
eDhtbS1ldmstcGNpZS1lcC1kdGJzICs9IGlteDhtbS1ldmsuZHRiIGlteC1wY2llMC1lcC5kdGJv
DQo+PiAgaW14OG1tLWV2a2ItcGNpZS1lcC1kdGJzICs9IGlteDhtbS1ldmtiLmR0YiBpbXgtcGNp
ZTAtZXAuZHRibw0KPj4gIGR0Yi0kKENPTkZJR19BUkNIX01YQykgKz0gaW14OG1tLWV2ay1wY2ll
LWVwLmR0YiBpbXg4bW0tZXZrYi1wY2llLWVwLmR0Yg0KPj4gKw0KPj4gKwljYXJyaWVyX2VlcHJv
bTogZWVwcm9tQDU3ew0KPiBOZWVkIHNwYWNlIGJlZm9yZSB7LCBkdC1mb3JtYXQgY2FuIGZpeCB0
aGlzIGZvciB5b3UuIHBhdGNoIDEtNCBhbHJlYWR5DQo+IHBpY2tlZCwgb25seSBuZWVkIHJlc2Vu
dCA1LTggYWZ0ZXIgcnVuIGR0LWZvcm1hdC4NCg0KSSB0cmllZCBydW5uaW5nIHRoZSB0b29sIGFn
YWluLCBhbmQgaXQgbmljZWx5IHJlLW9yZGVyZWVkIHRoZSBuZXcgaW14OG1tLWh1bW1pbmdib2Fy
ZC1yaXBwbGUuZHRzDQoNCllldCBpdCBjcmFzaGVzIG9uIGlteDhtbi1zb2xpZHNlbnNlLW44LWNv
bXBhY3QuZHRzOg0KDQrina8gLi9kdC1mb3JtYXQgL29wdC93b3Jrc3BhY2UvbGludXgvYXJjaC9h
cm02NC9ib290L2R0cy9mcmVlc2NhbGUvaW14OG1uLXNvbGlkc2Vuc2UtbjgtY29tcGFjdC5kdHMN
CnRlcm1pbmF0ZSBjYWxsZWQgYWZ0ZXIgdGhyb3dpbmcgYW4gaW5zdGFuY2Ugb2YgJ3N0ZDo6b3V0
X29mX3JhbmdlJw0KwqAgd2hhdCgpOsKgIGJhc2ljX3N0cmluZzo6c3Vic3RyOiBfX3BvcyAod2hp
Y2ggaXMgMjYpID4gdGhpcy0+c2l6ZSgpICh3aGljaCBpcyAxOCkNClsxXcKgIMKgIDEyMDMwIElP
VCBpbnN0cnVjdGlvbiAoY29yZSBkdW1wZWQpwqAgLi9kdC1mb3JtYXQNCg0KVGhlbiBJIHJhbiBp
dCBvbiB0aGUgaWlvdCBib2FyZCBkdHMgYW5kIGR0c28sIGFuZCBpdCBzdWdnZXN0cyBvbmUgcGFy
dGljdWxhciBjaGFuZ2UgSSB3YXMgbm90IGV4cGVjdGluZzoNCg0KLSZ7L30gew0KKyYge307DQor
DQorLyB7DQoNCuKdryBmaW5kIC4gLWluYW1lICIqLmR0c28iIC1leGVjIGdyZXAgLUggIiZ7L30i
IHt9IFw7IHwgd2MgLWwNCjExMA0KDQrina8gZmluZCAuIC1pbmFtZSAiKi5kdHNvIiAtZXhlYyBn
cmVwIC1IICIvIHsiIHt9IFw7IHwgd2MgLWwNCjE1DQoNCldoaWNoIG9uZSBpcyBwcmVmZXJyZWQg
Z29pbmcgZm9yd2FyZD8NCg0K
