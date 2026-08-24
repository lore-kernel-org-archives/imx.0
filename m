Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023134.outbound.protection.outlook.com [52.101.72.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7632A3EB81D
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 11:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.134
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787572079; cv=fail; b=XU7j9Hwl2B7TwV77pF7V5nWnwbzd+4YSUCLqLhjsgzrFiCZe2KY8NOBtX2iXtmKOsYajIcngyTq/RMu0H2AznC4t8DNTUKLPn3UQKMG6U9hewjuznOBZh40D7VJY6d7Hw/AAteVID7mtDZN2IgekWdt5i9nKR2s8KsGw2zpFeXQ=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787572079; c=relaxed/simple;
	bh=WUNMFi16YVSDDXWqlKTWG6K4KUhSm7Gu8pZ9yMgd8Ao=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=EBFHKeUa3bhndtED4UPyuXQRTQoXkrc/WPyFgS8o7Ltxhp+u/yz0S8lxcLJ0NcJuMf8P0K21aEw4CVxCPB2/CS5Rh1XfDGD7FWhYAvxVavnHdNVo9t+BtdmQ7M05frBLyk2uUDC+d3/gEcw8GLx+Ziqg5UaxsxS26zzDQPnMxbM=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=mrlFK1B6; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=mrlFK1B6; arc=fail smtp.client-ip=52.101.72.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="mrlFK1B6";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="mrlFK1B6"
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=A1XDQnmQhZZoH2HxKltvuCwfniwBJjePhEqZhp5bYmWkyN39Xcks4CEN/xFZdjyMNobEP2mgPEWIpuR3FFSbUzFENskFEvAhdOitFy8Ik6xhMx3vVzOcyJexPhDLjd+iNo40pl76YiPlwY8bqwDBO/2cxyZail8nLqrz9HgWjXIaN+vwjcdLU0aYvyRNf/E2NB+aDupsbn+DB/y3viIm0rl2cnYw/o+6hf6M9m/ERg4LFpqypojt5+4ulVaz9iradu6fgLOG3n/DXFnV4vozNOdOMHphbcqLcpBb+rOXIbkSDeRMSLgSA5ihY3CP/A4uJ3KosMNBEWcu7pij/cikfA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUNMFi16YVSDDXWqlKTWG6K4KUhSm7Gu8pZ9yMgd8Ao=;
 b=R06kOlvBaVEzy223yvyADM6z7jfqt2Y6U3PSV2yvQNuXOAx2ooGIoCz5NCu1pzeiLT/JXo12WtBm+8tE0tCRROa47/N5xqzOKi+t0qak2ic3wryguayYhX8ahA3RdTDohuY+oB61NAq8o/QAp0VX/PS/7dMlukCC4Jm2ErPlrZBqLrt6nmSBxvOIE/IDjL5ciLrnazmBrd4gPdRjnpJmgEWtVEvZrtsGa4FFUN9+CDJ+Zg8aWqq/2wFFoXATBNcmxdoFVp6dwQxKs6yqa3J25IlkS01pXfqGeGQuwk5IcK2kNCE5ZrXdp9dqvFVb1rXuUlDrrM+HKCZrtQZT6DtN6A==
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
 bh=WUNMFi16YVSDDXWqlKTWG6K4KUhSm7Gu8pZ9yMgd8Ao=;
 b=mrlFK1B6WtCwZ6gIEGv++pB2pIMaG0QWJiCO1T8+56ezShVko5Cqv4eE+eOdI4MXcFsiW6NSycCVofUE9FOQ1GRhRjuZ1R7kv1/FkhnIaDa8+TxQ9he5ezLIgaLQrzAav9CLKYDSjaRZbtRuEjJSO4ZDppCKyswHPjNLVL5rO4fKglhzN521Trg4Yt7rXRwiT4zPYOMUrMCJQPs09MxLH7EYsRCzEPubSsWEiln/C8cTtnydjRZSox4foehjxrkX21xFbG8IacEhtlKJc2ipoiUe4Hf/pwiUXqQ7vpcNWmExfcO5q2Tt6RldPrM9yo1o6I0qYJk66qjW/6uvlflEQA==
Received: from AS4P190CA0005.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5de::17)
 by AM9PR04MB7524.eurprd04.prod.outlook.com (2603:10a6:20b:286::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 11:47:54 +0000
Received: from AMS1EPF00000049.eurprd04.prod.outlook.com
 (2603:10a6:20b:5de:cafe::2a) by AS4P190CA0005.outlook.office365.com
 (2603:10a6:20b:5de::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.12 via Frontend Transport; Mon,
 24 Aug 2026 11:47:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF00000049.mail.protection.outlook.com (10.167.16.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Mon, 24 Aug 2026 11:47:54 +0000
Received: from emails-4773976-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-140.eu-west-1.compute.internal [10.20.6.140])
	by mta-outgoing-dlp-517-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id D5F8080632;
	Mon, 24 Aug 2026 11:47:53 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1787572073;
 b=SD27eJvQ6qaFgM+2ptnaWiEdjIxBoxMI1FquwbBAs9Nz1NzXbt+bVhlcEbTdrUC6FL/CS
 bLxlGX4QdepCKlrw3Hk4sKxAK3kcEjKBdXqphKd1h2tSbmT3Nl7VCjRzgn5IK3B1L7ibmG9
 nFzHYnc/+KOlK3Kc1RqSU/rT6YdHFRE=
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1787572073; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=WUNMFi16YVSDDXWqlKTWG6K4KUhSm7Gu8pZ9yMgd8Ao=;
 b=ZmgPQW3WbC+OPtGqmAWh9goynivlFasi/WGZNpjyFe/kth7t2haZwK9mC54AaCaKJKIUB
 +z/EujYdL/d6Qqde1Ee6zOlDR9mwufzA1+OBxlgqB+LiGpvtZuPS6gGVf27BQvJKMuMbqNu
 ayGWhZYzZ5gpvgM6jBXYY7TYbHKBzzQ=
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com;
 arc=pass;
 dkim=none header.d=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WUNMFi16YVSDDXWqlKTWG6K4KUhSm7Gu8pZ9yMgd8Ao=;
 b=mrlFK1B6WtCwZ6gIEGv++pB2pIMaG0QWJiCO1T8+56ezShVko5Cqv4eE+eOdI4MXcFsiW6NSycCVofUE9FOQ1GRhRjuZ1R7kv1/FkhnIaDa8+TxQ9he5ezLIgaLQrzAav9CLKYDSjaRZbtRuEjJSO4ZDppCKyswHPjNLVL5rO4fKglhzN521Trg4Yt7rXRwiT4zPYOMUrMCJQPs09MxLH7EYsRCzEPubSsWEiln/C8cTtnydjRZSox4foehjxrkX21xFbG8IacEhtlKJc2ipoiUe4Hf/pwiUXqQ7vpcNWmExfcO5q2Tt6RldPrM9yo1o6I0qYJk66qjW/6uvlflEQA==
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 by PA4PR04MB8000.eurprd04.prod.outlook.com (2603:10a6:102:c1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 11:47:44 +0000
Received: from VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de]) by VI1PR04MB5807.eurprd04.prod.outlook.com
 ([fe80::3da4:2827:d637:37de%3]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 11:47:44 +0000
From: Josua Mayer <josua@solid-run.com>
To: "vjardin@free.fr" <vjardin@free.fr>, Frank Li <Frank.Li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: lx2160a: fix incorrect pinmux
Thread-Topic: [PATCH] arm64: dts: lx2160a: fix incorrect pinmux
Thread-Index: AQHdM05IkBx6n9kXmU2mUUeZjBW/xLatFiKA
Date: Mon, 24 Aug 2026 11:47:43 +0000
Message-ID: <3d4fe161-895e-4820-a99d-8cd5fd6d9ad2@solid-run.com>
References:
 <20260824-for-upstream-lx2160a-pinmux-fix-v1-1-33a3c8d5ea8a@free.fr>
In-Reply-To:
 <20260824-for-upstream-lx2160a-pinmux-fix-v1-1-33a3c8d5ea8a@free.fr>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
x-ms-traffictypediagnostic:
	VI1PR04MB5807:EE_|PA4PR04MB8000:EE_|AMS1EPF00000049:EE_|AM9PR04MB7524:EE_
X-MS-Office365-Filtering-Correlation-Id: 983d8c4a-c2b3-4dc0-525d-08df01d588a1
x-cloud-sec-av-info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|38070700021|6133799003|10067099003|5023799004|56012099006|18002099003|22082099003|15866825006|41080700001;
X-Microsoft-Antispam-Message-Info-Original:
 smXinkvCs3xrYa01zZ6REnyJfhfmQFG6oCL3QXI5YyvuGS9XIdTdf4uFNZUkXe+gf0RNZzX7eXqZjAT0NUzilSrdGD9ZucyOBlmoO8N4Sw2iWl4gEONqJIVwDOn13XDSVsV/uIM04bZ1QD0UE4woljY4FT342G7GuwcYQrtdvQCYXL58wRUEIS6/R7Xut7NuuCoZ1dr5v4pw342yCCDOM4qrLoNbJld+/t54d/MDYmUwO1iSARMXbM6WXyuzSidNvEvwxhy+O6VDs89u4fgNT34bICYEadU3IHAc3FbR7L25fDh6yascKDIQVYLnKdWLSNEG2imy3fsQ1t4A9NoixBk0zXp9fc0FiK/Q81aMvkE3RIBQ89H5PXStCv4hqEqTkDJZXvXylqhDts1trJDSSVJ5QgsVy8A1GqMuTkDaBDDGZnBt/IlGeuc6uWbvbMcYcIdJJO9p1bjuK2yK18HJigWue6MjULXHLnnxaK+JsOHW2K/WLZcOAAClgRMRIfDfPmiFrrHPBOYnjh5w08Y063/HBGNb3RUyNLU5Gp4WQl7KsBwhuPg3O9KDC+ygbawKCQ6TcsE/KCmxgANeNDy8rSNaRnt5Ps5eQaDT6JfbYSViYI8VP0cWsHWyuOKd7feqFjlP2vroAXR7XwnjDn9WOyYTTnn5Ttf+7OlVBt50iZ7nqgN6sAPZAftf6euYYRzVBRLon6Jw6fUPlTrttxuySt4wzBBY4xuGYNM7b6hR91J2A/wqxNdHyQpuZofQWd/Pr34zrh8AhGihifDSKT8SXw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5807.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(38070700021)(6133799003)(10067099003)(5023799004)(56012099006)(18002099003)(22082099003)(15866825006)(41080700001);DIR:OUT;SFP:1102;
Content-Type: text/plain; charset="utf-8"
Content-ID: <43468595530F484E9995D6380E5B7852@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked:
 UMZ95d7TM7R6xSFmz/2EPylSmkuwtfRY74Llc/w6MaG6KKauHOhVML5KU4qDD/CHlJTrET6KelI9Ymal6eaE5Cbbosww2+4QcX1IrRywVDd6OoYO1hx1+A16/jDbLMC+hNxhF2SFB3gk5hZCUBIHwgtjcSYATUOvDErQi366X3yA9Ss9TPltdyvTAHdGur9DN4jqAi2akA+adsXwoEbaBzYzPJopT6rimOMmtGspx3V9p/VK+uZUPLdDoCmR21yl7fkYbsYIXl9V+kItzn+ffiKMbEJ5UhCeMKQiqD4oCDkzmU8B3vCLMarTJPpkrTJ1Uah76eLaVkq9YeQDtwRgkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB8000
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: f48711a327304ad589f54ce01190b47a:solidrun,office365_emails,sent,inline:01e4d69cb00ddb784d974af47c8a159a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rH+9HOGpChsJOy6x1WaRmJGdEZS2ScwgHPOm9zktl5ZU4fHpyQMi6Inwqo2uu/UDeiqG2fTwerd3KqGdEcgPPzzux5Hh/e+Zr1CRFFh6mY/+UXa72cVBIYDRFNoshj6bWauTI7wNwKO+jHpviWFoAf1WYRqbCQK6SCZRRtpUrFcUDZqaJravVTf2BDfmr5FI10At/Dq0HBTA6c/Jm2FjDBDvtnU+phe4Rjh8R86DlhU9RxxrMNQNhqG8VgNu+iHNo7sZDlYd/Lz2MeiwNoeCHLDcKRcJ44svytOgTOKzpBk6d2+cm97uLCw0rtgbUJEeGV4zC4vM9D6f3TPmEj2Knw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WUNMFi16YVSDDXWqlKTWG6K4KUhSm7Gu8pZ9yMgd8Ao=;
 b=bIox6uI8nuWkkPDjyzEyTim4PK2PGmUx921rJqUo6Nd/PcXO3W7UhMlxotVAqG8udOH2MKdUmUaf+zfY8QSAK+AGoFVYk+P5ZDsxMdNCeEb+5kwFYU6PzjSnenBtAVNg2NW4dzJaIvSx5ls3VMYP0P9X/y6oZ3Oe8NWbMPHtC0X53AaX3vSehu+sf7uLNqZAuSxw/wsss49kydBG5ThamT2Wt1i9aMGXDzhGHugDO5n+vKp/B5CD9p9hhRyFbiUr3qkQkoYr2bb4dPUNtDKgbLvwtJG1DWzHP/veKcX44Ff3yIFDb/j/kBQkxMznEycCX+j+eoiIYOTJq421AIhwFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c9f8e3f6-4e56-405c-385d-08df01d5827f
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|36860700016|35042699022|1800799024|82310400026|7416014|376014|23010399003|18002099003|22082099003|5023799004|56012099006|6133799003|10067099003|41080700001|15866825006;
X-Microsoft-Antispam-Message-Info:
	9VUPcJ7wd3PHHl1srcsOoGVbf3N7GldUS3NMJFcaaEaCM1Pt19Mnz1EKl7Y/j0aG6q9cL1vAvMYFCaBkBcxiLi7WB5iEyguASUJ2Z3znDzMOu5FZMUjmyKoHVlbjDqzhmsVBkmZX1EJEjdxDG/KA9VvVCEjkKlpQX4+3VoyD4xeZOAr03+phpUmnIaenYU5gkiuYEvF7U/riLOHyI14ynB+YtiTa3+YSw+2ZN1VwhErjs16un9KkjjLPWhM7k3qW+FyLB1MLvuInTtLhZLBndZS3If3sOsjEBtehriMCj46ta0xqIS4Web5AiAYgu2gRGf1nRwKcAwlVKfxfuy0X8jsbp8bu+F2StNeLZaeiRM/tOoSFmQC3YrccjN5j/VNVsfRhb37yUZrLG+J/fecJr0pHs9Q4h/E+msn+VXRsX/gCKQNmc4B68pKwlF9pOEEh72+/GrlC9odDaZLtovI2qoQXdVTsz1eEKQfF7dyTg3JYiPpPVhVpchaSHI3KSe9io+bwClhRVKhhwt6HqlHsSAXHsxp8T2VJqa3bZ/uyGZA0fcUM9WKf6lYiSoQv/L5NS4k3v8iNbTH6V5Dh32rQzaS411jouP7IRGTzp/KWKe/8tsG5yK9Cpa0V35Z4dzC8JDoY3CdqvZkn1N1HNu9Ji/UCf/TWgThfSwIiqEEtuW+266XmiGt44YDoy4NWDpfFoKEA1xP3bTbIJrWM59PN6wWwqRvivaxUeqU47m7pSPT7pwnXRTROmBgi39P83iZaAuHeda8oz2xvfB1RH7lQlIBlGdsdOem1uvA2hzxEvoU=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(36860700016)(35042699022)(1800799024)(82310400026)(7416014)(376014)(23010399003)(18002099003)(22082099003)(5023799004)(56012099006)(6133799003)(10067099003)(41080700001)(15866825006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6lJmKiJl1CpMvtnkV8z5ZdWnaRfQKOfh2Y9bRuMY411UixPO2JbHKCZNuiDRgpSC+V9M5ihV/sKAgGFGppKcLouPqn/e/jTs9ZPbGovaSUdvUW3FA2wqoXMpWC8HBJGvwvK/pybdJRZ461t497bbaM46SVDHYQNEzVcWaioqIA/tX/KA4C8416tvBorOWqC43kUK9+u0/ts5GqG+UeuhM2mRVM8ZScsQFdJcMZj/myBQ761zE7fr6JS1HpssgJVDxQgx01dHTxDxIXQerBUdOep0LyLnwvwkiQ2rmFmQuaG93bf0ssZFPTz0RXZ9Z8Qkl6XseKzlKmiqgMTFOzTU+45hH15dLQaeBIRmZFu2iT6LHExpjCsIRgYyIHhgKZed7FsLRpKTp+GSJ23bRVf8Myr9swmEGKZD+RV2CPGmZuiJ8ClEIdVUwm0jk6L0ylxR
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 11:47:54.1010
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 983d8c4a-c2b3-4dc0-525d-08df01d588a1
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000049.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7524

QW0gMjQuMDguMjYgdW0gMDA6MjQgc2NocmllYiBWaW5jZW50IEphcmRpbiB2aWEgQjQgUmVsYXk6
DQo+IEZyb206IFZpbmNlbnQgSmFyZGluIDx2amFyZGluQGZyZWUuZnI+DQo+DQo+IEZvciBncGlv
MSB2YWx1ZSBzZXQgZm9yIHBpbmN0cmwgaXMgb3V0c2lkZSB0aGUgbWFzayBhbmQgc28gd2lsbCBk
bw0KPiBub3RoaW5nLg0KPiBBZGQgdGhlIG1pc3Npbmcgb2Zmc2V0IGZvciB2YWx1ZSBmaWVsZCB0
byBiZSB0aGUgc2FtZSBhcyB0aGUgbWFzayBhcw0KPiBleHBlY3RlZC4NCj4NCj4gRml4ZXM6IDI4
NGFkNzA2NGFhYSAoImFybTY0OiBkdHM6IGx4MjE2MGE6IGNvbXBsZXRlIHBpbm11eCBmb3IgcmN3
c3IxMiBjb25maWd1cmF0aW9uIHdvcmQiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IEphcmRp
biA8dmphcmRpbkBmcmVlLmZyPg0KPiAtLS0NCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNj
YWxlL2ZzbC1seDIxNjBhLmR0c2kgfCA2ICsrKy0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4NCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1seDIxNjBhLmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRz
L2ZyZWVzY2FsZS9mc2wtbHgyMTYwYS5kdHNpDQo+IGluZGV4IDFkNzNhYmZmYTZiNy4uYjlmMDc5
YzQ5ZTE5IDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9mc2wt
bHgyMTYwYS5kdHNpDQo+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvZnJlZXNjYWxlL2ZzbC1s
eDIxNjBhLmR0c2kNCj4gQEAgLTE4MDMsNyArMTgwMyw3IEBAIGZzcGlfZGF0YTc0X3BpbnM6IHhz
cGkxLWRhdGE3NC1waW5zIHsNCj4gIAkJCX07DQo+ICANCj4gIAkJCWdwaW8xXzMxXzI4X3BpbnM6
IHhzcGkxLWRhdGE3NC1ncGlvLXBpbnMgew0KPiAtCQkJCXBpbmN0cmwtc2luZ2xlLGJpdHMgPSA8
MHgwIDB4MSAoMHg3IDw8IDE1KT47DQo+ICsJCQkJcGluY3RybC1zaW5nbGUsYml0cyA9IDwweDAg
KDB4MSA8PCAxNSkgKDB4NyA8PCAxNSk+Ow0KPiAgCQkJfTsNCj4gIA0KPiAgCQkJZnNwaV9kYXRh
MzBfcGluczogeHNwaTEtZGF0YTMwLXBpbnMgew0KPiBAQCAtMTgxMSw3ICsxODExLDcgQEAgZnNw
aV9kYXRhMzBfcGluczogeHNwaTEtZGF0YTMwLXBpbnMgew0KPiAgCQkJfTsNCj4gIA0KPiAgCQkJ
Z3BpbzFfMjdfMjRfcGluczogeHNwaTEtZGF0YTMwLWdwaW8tcGlucyB7DQo+IC0JCQkJcGluY3Ry
bC1zaW5nbGUsYml0cyA9IDwweDAgMHgxICgweDcgPDwgMTgpPjsNCj4gKwkJCQlwaW5jdHJsLXNp
bmdsZSxiaXRzID0gPDB4MCAoMHgxIDw8IDE4KSAoMHg3IDw8IDE4KT47DQo+ICAJCQl9Ow0KPiAg
DQo+ICAJCQlmc3BpX2Rxc19zY2tfY3MxMF9waW5zOiB4c3BpMS1iYXNlLXBpbnMgew0KPiBAQCAt
MTgxOSw3ICsxODE5LDcgQEAgZnNwaV9kcXNfc2NrX2NzMTBfcGluczogeHNwaTEtYmFzZS1waW5z
IHsNCj4gIAkJCX07DQo+ICANCj4gIAkJCWdwaW8xXzIzXzIwX3BpbnM6IHhzcGkxLWJhc2UtZ3Bp
by1waW5zIHsNCj4gLQkJCQlwaW5jdHJsLXNpbmdsZSxiaXRzID0gPDB4MCAweDEgKDB4NyA8PCAy
MSk+Ow0KPiArCQkJCXBpbmN0cmwtc2luZ2xlLGJpdHMgPSA8MHgwICgweDEgPDwgMjEpICgweDcg
PDwgMjEpPjsNCj4gIAkJCX07DQo+ICANCj4gIAkJCWVzZGhjMF9jbWRfZGF0YTMwX2Nsa192c2Vs
X3BpbnM6IHNkaGMxLWJhc2Utc2RoYy12c2VsLXBpbnMgew0KPg0KPiAtLS0NCj4gYmFzZS1jb21t
aXQ6IDNkNmQ4MTc2MjJiMGE5NzIxZTNjYzQwNGRmMzQ2OTE3MTU4MmJlMTMNCj4gY2hhbmdlLWlk
OiAyMDI2MDgyNC1mb3ItdXBzdHJlYW0tbHgyMTYwYS1waW5tdXgtZml4LTZkMDllODJiZDVjYg0K
Pg0KPiBCZXN0IHJlZ2FyZHMsDQpUaGFua3MhDQoNClJldmlld2VkLWJ5OiBKb3N1YSBNYXllciA8
am9zdWFAc29saWQtcnVuLmNvbT4NCg==
