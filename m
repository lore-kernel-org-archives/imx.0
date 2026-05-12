Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11021115.outbound.protection.outlook.com [52.101.65.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE413C4B68
	for <imx@lists.linux.dev>; Tue, 12 May 2026 14:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.115
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596782; cv=fail; b=Z9EZwVGp/Mm+tApxZwyVdxjmVe3g+ov77iIn3we4kLVGRK2FhaI8tKmHiqEvPJ26+bwxQN9IGbYodYgWLEwO43kCLUsH9Iz7tN8EejwoosDzOEF1KXvuisBWlWEsre/wabVUvuvK/R4K786HxYbDyhFOU5+/sd+O3JOlvp370io=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596782; c=relaxed/simple;
	bh=tViz19iz3RssNeE052VduAK2g0qWzA/P8H6UJHBCk2U=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=eydqIDOnNzm0qyDCTkvhCB/jPu6x7XXaf49q+qSp1GhFXTOE5/xc6bw3aCZj3MozsU3eBTrSeOMF4XrFuzhllP6wbrHjBV6dr6xR5Hg9G8q70XZQGeExDY8j6M+MRrPWrWkBEl7R5BuS/94FOpGyTnmjWKqXqF01jiVwAVY3DFE=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=lyYW7EKQ; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=lyYW7EKQ; arc=fail smtp.client-ip=52.101.65.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="lyYW7EKQ";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="lyYW7EKQ"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=yvyegsDx9PKyVsRAyFJd7G0AUn6I6EpQL36F48oA4zWnKVeFwHu7RMGCWDTXuSEH1tMTZRHXIUsOJ8Ebk4H78lqGo3UsCz0RDTZSqBwOkitl8U38Vz2cg2xqw9/zvtO9lTPDE1QHE9qDi3vdbgMB9g4H2oVtuOxRl0Ki1BMCeS/hVqecr8E6mU3B94FGKECJ/MuVjgD7ksxAsepS+1csnrheJZ/nwhDCU/SnngCZPsce54mixMytsDzH8nA4WgTOzG2N4PgoiQHEcLFs40yu1htquVPjk/29ZncXcWURFWvo8p7Qfj0IoALMweUf6NDBw7qNdw9uQAQxqG3BwqxjPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUDTyxzBFtPEJE7wp6ia2ZRTQqNLAwQ0PS43es9C84U=;
 b=oafwyccc5IIdRaJ+lDFpu01tuOlHjiSas6BxO5ILWnpnPdZUGDssl3UYMLT+P3ezvtgOvaQjlvXYHWtXxypZIbpk3Al5JyBIlH5XXj4T/+Vwox3i7RmMwSGBcA2l4WrVSYvaE+xHvuehlZEl98XJ+hE2qvLNMFUAHfOtHClSNZd80g0/LY2XuNricqoiCOcvBXxnVV5KWEiyTTNOGsMX4GekHltb+nukr4EQ+E5GUIpR8ysThzos6R+fobnS76f5aoCptV/A4lpKLcgxpzkF17cAFuuIkqf7u1KtI3namSqxq+x0DDY+kBYILKwvsvVTrWXXrMaJITL1MTY0Zef19g==
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
 bh=mUDTyxzBFtPEJE7wp6ia2ZRTQqNLAwQ0PS43es9C84U=;
 b=lyYW7EKQrcneNJI9VAju8n/PY2xwACb5tOlif2ZUE7PT0y8U02ZqjBeb4dO+cUSpMJl6V1WjpCsIKjQLu67DcHLcNwzPvItzfE7atYFvewB0T+LKYLXnQtC4JbTUwVxgQ9suTObaGQycSuQUM6obWrp3Qbu0rxjpfZrPbESph4X78ZmlpP5XOINPG2mDh9ENRtplOpcYrXevkWYGyncE7QDNQyuG9nIQqJ+Gxx1qlj6YsMHCs9A2EmiSX/S9FfQKA+/fN5JXd6HAk1rMiWLCmjywhvnuWYmPoxH1L2eD7059SPWlPA+aBm/iHE9YA4upVjv2a+A8VXSreKrnqMhIGQ==
Received: from CWLP123CA0254.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:19e::22)
 by AM0PR04MB6786.eurprd04.prod.outlook.com (2603:10a6:208:184::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Tue, 12 May
 2026 14:39:34 +0000
Received: from AMS1EPF00000043.eurprd04.prod.outlook.com
 (2603:10a6:400:19e:cafe::b0) by CWLP123CA0254.outlook.office365.com
 (2603:10a6:400:19e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 14:39:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS1EPF00000043.mail.protection.outlook.com (10.167.16.40) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 14:39:34 +0000
Received: from emails-721842-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-5-220.eu-west-1.compute.internal [10.20.5.220])
	by mta-outgoing-dlp-305-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 439637FE80;
	Tue, 12 May 2026 14:39:34 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Tue May 12 14:39:09 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hy37JKvDbathXCV6hO6ZD20aEzpGApu0DJhm4crb+Ha4BViQ5Wb/HNtZv1xa+HLce5YGPRPDjgmUPNgM4dKzGkD09byPsoAIkep4+Lna3URdtUs7b0pxK1WCmi6xXtlbuZxQ38l2f22DkmTi1F+tgiEWefkboLLP4nhFY2NJqKq68VZxZBBIVW9BqgqR89nDUQQTTa7mgxlsHflB/5YocC4PBeXrh2epRxFRHlY2abZfo2W1EhhMA8y+y5NCH6aJJzfOaWmGW4GFgAJfroDlMm+5VTMPmPJFhUbmgRQ1E6N4GEOWoLuBzj3RqbaVEn1B7aDCZw+uI7lglDb0Iqp7+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mUDTyxzBFtPEJE7wp6ia2ZRTQqNLAwQ0PS43es9C84U=;
 b=dTR97CeNpZLtgR32OhBAIrCxTjyKRJzB+s11cIQ3dHXaoVMXD6NtQuhPOB9T9Qr673t2KVo6qtajuRhq5f+ydDwgvcsveRxqrtUXLNxX4K18TDP7OISSsr2KdOQAuB/cWpUUubqUUyIuQDatfSktll6BXY+Deah2gaFYBOyNZYAGuIt/HHSIGAHXQnL8lrx2tbjUodWfDqVmMFtESeDz+U0X/UZBjhwmvPA9C7BLdJ4/OTv7Rd8uwtq5d6++OkrdLkShLf/zMQTG5JoKNNb86M1TJ5kCS1gbLbbcpM2gQ2gxQ03yVHSe666rYN4RyL1PkS4g0YDErdeBckrc81FALg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mUDTyxzBFtPEJE7wp6ia2ZRTQqNLAwQ0PS43es9C84U=;
 b=lyYW7EKQrcneNJI9VAju8n/PY2xwACb5tOlif2ZUE7PT0y8U02ZqjBeb4dO+cUSpMJl6V1WjpCsIKjQLu67DcHLcNwzPvItzfE7atYFvewB0T+LKYLXnQtC4JbTUwVxgQ9suTObaGQycSuQUM6obWrp3Qbu0rxjpfZrPbESph4X78ZmlpP5XOINPG2mDh9ENRtplOpcYrXevkWYGyncE7QDNQyuG9nIQqJ+Gxx1qlj6YsMHCs9A2EmiSX/S9FfQKA+/fN5JXd6HAk1rMiWLCmjywhvnuWYmPoxH1L2eD7059SPWlPA+aBm/iHE9YA4upVjv2a+A8VXSreKrnqMhIGQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by PA4PR04MB7629.eurprd04.prod.outlook.com
 (2603:10a6:102:f2::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 14:39:04 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 14:39:04 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Tue, 12 May 2026 16:39:00 +0200
Subject: [PATCH v6 05/10] dt-bindings: arm: fsl: Add solidrun lx2160a twins
 board
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-lx2160-pci-v6-5-d0ff72d3c983@solid-run.com>
References: <20260512-lx2160-pci-v6-0-d0ff72d3c983@solid-run.com>
In-Reply-To: <20260512-lx2160-pci-v6-0-d0ff72d3c983@solid-run.com>
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
X-ClientProxiedBy: FR3P281CA0160.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::15) To GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GVXPR04MB12057:EE_|PA4PR04MB7629:EE_|AMS1EPF00000043:EE_|AM0PR04MB6786:EE_
X-MS-Office365-Filtering-Correlation-Id: e74ed7b1-2fd1-4781-a6a6-08deb0344932
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 qeMQSPXgDSY11kE3XX+Y5GWN/p9woZBM+2zbCxnk7ISxEO9MWZkpizOB9h8cAR0JzWHOC/cLJHFOWKIz7f4pvBMysmhdbpUnVdEeIeBBiZUWaWcXkEAasCdO5Ng8iIXyeSa0n6Gq+3y089EKuqgUMMx6/SD47sFYgftmIo0n7XeCKz6mmoF2E4HwtZLkh1KTCHb6sNzAfw53TIuC1o1O6aI5kliti/fRqqwLIDc2DwjUqO1gWmj3QCRxHd3FjhOYCeONMdfIEM7/P+sM4A633lghBMHaQ6LF4Ddx0jxO/ikjPSBcVUBjSS7fSOY6FYpTecCCEASpruuzgPZ9igxkzZdpkgiHXSgqJraVRuAIcLfERPxQa5VhpYGjLe/vZF7A+Y3eRndyQ3iio7mCtg//6WyZYy6pecDzmWTG/LBfBaxiQwwTF8KbWthtRhGyI0EoE3adCI9yHOkxhC6X9ScFwStHxT65KCtjDcU/HqhGKrYgO1hjrgqD2vfcu7HawG5Xk79/eeoVbwBMyjYQ5J6fCUtCkppBpgf/97ywbrLaPX7F34xIif4N/pE4itNfL+A1qw26z2lN6v+gMbAJRns3wVq1CRtgTTQHJ08u53ri4HhlD8UvklcUdFAX1PhXk0dt532blqyEYDJWaY1Bsn/6eIn6uRl7U2lBkq1cm6mMQbpOEY3njqHOCZscc+ntwEjpsB2KpxdIvYSgzTrRa+I87FAURjPc8gSkquzGRfqWMZkByvPgWVRq77FCZ1CM2lKe/nVYm9osm7MNM44WErqSkw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 hWVmyp0z5SFPH/cHWMim2yoETjpFG+KXqjsBuW2jps0IgL0m1cPLET9exYFWdy0HtQIFWkukAATk7NGysRN2cR/1FJuY1HZrjCR/Wu2qYTyaLdNnicQ1CY7wvdQcH8qhIvI4ySNWVZoOu1InIjLHIZGtocPMj0d4xZk4woOYCyVjUFzaHI2rIeZZGyGChCAOYEHgxSYiy5rwDnBedHZxcv2BHj0Zsbx8MlehbE7AXZIJ2nw41SXz3XnY1lJUvB5FCOzv+eqsD9ZbZpITe+wh9qcxeMpICQ08d36tVMMBl0KCtKqdW/ZQTqzO74dTskmfZRMMiL7OFbhy1g+b01u8uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7629
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: f0691bc6f3bc42c586597f2806a4ae33:solidrun,office365_emails,sent,inline:419adc75474dac978fa76f6589bce4c6
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS1EPF00000043.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	10a6627a-1efd-45c1-e6c1-08deb034370a
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|7416014|376014|14060799003|82310400026|1800799024|36860700016|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	GqbEGU9Nl1Y9zfdwOVjFtuMmj+ElOAvEjbityuM2ZvaBgVSILUjE2n8HJcoQwbYbQI8qIDmKzqnU92oZ/osWW3TTzZGcARkIzPw5x/afYYLzjeiQNt0DsQ+G7O1roBp3cVQTeOVkqiJDiTMHw3UkaoyVP+hk4pGi05FicO3btI82fNkQMpWkU7/kiop/mrs8fkzNZEoWdZ2qfNHMaDFm6hYdJu5sDc3SRbbjCWt8OjX5AnpeuK88Vmk503pFtE1soe1fSgy7kuuJfEmQ6TMEYgTNQabA8QMZJdeFbiMiC2iiSXTrNQPleybXQKVahPZj7MwD6TEmSfoJwS+c7G8QrQIEF4r7DWLXv1Otmx0k9EsQpByJESLFwWTWWLXHmTJXxwkDYnMgc5DJucRZasWFnv3gMD1SYUiYrD+/XPzVl/ZouYwjFk1Q8xE2tztbP76VekWlLZHpqPLQ2Fwlpg+TrrZQRcnLiXrKoBxYUB5gAssXVh3xliAK7hhmkl2wx7Ie0oKry0NTpHoZt7XiVlJuhG+LPKREqKWLH5z72ikIcJvuBeE0eHrkXl7tL7AscXmPsYof9VEs/9e46WTxZo2eYTaeLiWLPK1CTbCzfkVcPgq3ftxXua2KRihtkE65iDIQ8buz1bjL0pGKyh2JngdDA0Lck33wump7Tg08i7ALh8EsTkHueO5yeXCT8P6y+8qqkoy08ooa2j9Uz/7DqMBy8Vu5htvjxmBNxAG2+IjGZ+2/stC1UBoJRGWkD651XOjcwFY0K4rTWGSqkbhHS+E+XA==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(35042699022)(7416014)(376014)(14060799003)(82310400026)(1800799024)(36860700016)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EolVNeQFZJm+HSjJ3YWxJxMXbODiJjSpOgH0u61rMWlLgTMxAbGMzD/DS5kzPZMgO0f3iWiOc8VxSs3uh1bcUBQKWV8GbpyQoVukIildqFQFD+ya3luF6HL04LDEjZVuIV9dfLQiPV1lGfKx/xoUklxCN/VcdsExgtAA2H08rk+qViGB3SKmfW4q8kUXe1ZV4DK5bNKqlHvzNcW9oF4mQmoSjLGmfQ2kOi+DDXt7O+EiuH7aBJ0qThaXdkgfdQSRF084ypHz3u77/CqAkjGifyjRxpWJh1ZQ/y0PqMTi1qv1Qiv8fDrUxq/XbATxkSQkycmnhhIjWHVvCY89JzWHykCd0MMr3FsjbGSm2nZxhlYgxhxf0uxRsMRpv21dec9NC1cj4y0syXWpCLaW1MH99i/glSlf7p1HYgrLBCoRdillUrHeHMxJvtNVQ8ugeGDB
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 14:39:34.5029
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e74ed7b1-2fd1-4781-a6a6-08deb0344932
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS1EPF00000043.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6786

The SolidRun LX2160A Twins board supports two configurations, one with
with a sinle CEX-7 module, and one with two (dual).

The dual configuration was not yet tested.

Add binding for the single variant only.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 0023cd1268075..1f11c1208c248 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1868,6 +1868,7 @@ properties:
           - enum:
               - solidrun,clearfog-cx
               - solidrun,honeycomb
+              - solidrun,twins-single
           - const: solidrun,lx2160a-cex7
           - const: fsl,lx2160a
 

-- 
2.51.0

