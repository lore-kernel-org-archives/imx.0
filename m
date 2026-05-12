Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023135.outbound.protection.outlook.com [40.107.159.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852553C4B76
	for <imx@lists.linux.dev>; Tue, 12 May 2026 14:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.135
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778596769; cv=fail; b=BmpqNTVk+8R+HKtBJIjYgbi5SwLBDQMF3AHKr2ZPFVgXKdUNjvCCzDe0tB47x01hhBxM57LVsYZw2ZPfEmhMsJL/dJBm7tz8vZGjtAHxeSAcNgIAyfanftHj4KpUEIj+pL61k7SMd6j4UPkdRNrULCRzlS9ClhQPY8Rj0u5tV9k=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778596769; c=relaxed/simple;
	bh=FUytqX845VCtWNQ8ptAQ0EvOD6VLKY3ENd4zJC+KEEg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=u/+7sVOPskjUPVjTEQdOMeR3s7Ubti93Owqnfng1MYQc0wyQGBtFUMQAumI3KadnMvjZL/KadVDPEUEM+tyf9clPw5E4a9DYQ7m74ZLWy6XtI+8XekiCQGKyNus/l2kQL31bsUo7Q1Lv4TS+ucQDH6oAF/57qfXnCesVbehOYHc=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=lRVYdHqn; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=lRVYdHqn; arc=fail smtp.client-ip=40.107.159.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="lRVYdHqn";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="lRVYdHqn"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=KvMFJWvC7Tv5lX55F/Spg05HFiehmUM7Cff29aMiAew2vzzzb9Y8kLWK1TttRa09RXA/F4WzxRnhT/7jY2Sc28KVfDCQX28/Lop3eU8c/U/1HY4a+c2kHuzsMTdKtVXdn00RQ22Gmqs6FdHdxR+dcyTLv9F5HgIwa+tmcP63jVB9pluoXkc4BKB7xeFh+9Y8g/JZJXnIDpfpe7Q6IOKqEGF9U97kJmbpTm16zGKfnUig4N2v9NClGGWdoOmlN6pEU51xfgpLJTkXP9r1UezMhNxzofoAki6nzgQ6FYINgU5uvjBQqz8Z6zln+zDKMA+PPnh6n7ZeHJ16NlHMtiRArA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQRczjeHD6wrgvMGG8wWlmweHvBT0bpTFUpI73r9lss=;
 b=pJfAEdz2jzvUoFagXPepg8c3CtMx1wTyxUS3ubkyUj63bIoODpmCaXoUtDPoUAzMDGYhcLZKiba3CXE1J+amoh19Rp01ReZRqr05F+gD5iDEISIQv1MVdYzAenhpCyFyY67OGsrHu45H/1ZWzciuj/OwzIP3eUgzASXtJpPrL50SzLs9z2KzaG89xKIZQWgoNVQmat4I1Tbro4MAXGSp0APeRjujbA7GIpzZeE+Jj9Bmiyju9Qb3YhNKhIB/TACTFSm15EFFZAh0BYvDtbSmZtIvK1PLuTvgPU4MiE+9wUHagEacZtGW0Jx+peUiiDwIIONy8ytowuLCdavaK2X/2w==
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
 bh=LQRczjeHD6wrgvMGG8wWlmweHvBT0bpTFUpI73r9lss=;
 b=lRVYdHqnX/67BNrDxHuNVqKTE3p5QGd2H0py4S7FSCqARrfmDYczEJimIv4reGoCGz3DUlIDy2y15K27k+xSE2bIACrfUHsqGUcCgkhuAli/JLqAa8neyNxcRCTvPYP3JFOX31j/0z3xP05XPZD2NVkN7UzOZ0gbu05XmKJdoVddf0NIA04BLTKd3TPI+RvR+1MjUQ8shkYqbfjZFHw4v82Pi9Bz6NTgYu17OZ8y5kwPYkNfV2N3oEmxtjld1yUbESjkbBVegKf0tAOhbQJOhzZPaRpGpooGPmaOD9dKlSUTiCE3LTJYecZP7ly4O4I6PsLlAAAZqVPBjEHiLyB68g==
Received: from DB9PR02CA0015.eurprd02.prod.outlook.com (2603:10a6:10:1d9::20)
 by AM8PR04MB7282.eurprd04.prod.outlook.com (2603:10a6:20b:1d9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 14:39:23 +0000
Received: from DB3PEPF0000885F.eurprd02.prod.outlook.com
 (2603:10a6:10:1d9:cafe::48) by DB9PR02CA0015.outlook.office365.com
 (2603:10a6:10:1d9::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9913.11 via Frontend Transport; Tue,
 12 May 2026 14:39:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DB3PEPF0000885F.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Tue, 12 May 2026 14:39:22 +0000
Received: from emails-9587203-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-103.eu-west-1.compute.internal [10.20.6.103])
	by mta-outgoing-dlp-305-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id BF9397FE88;
	Tue, 12 May 2026 14:39:22 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Tue May 12 14:39:05 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cAkYxcSzexcJ/vM3UQvzzEdaKkF32qEmlaRCMByImrjxszzTZRvW93eX00yc9AVinwojiHm/mlBv7mxTpm8sHxDVAssqVboWa9OOugC9ghTmmPalL4CxD4rRo4W0/kAI46t8XoNJdWYTECwcboT5+QL3/pKlhN7SXhyAvkdL0A7kfAm8i5JvuJdcKXJoHVXGj8uU5QfYOfKHubNaAglCeuf/Zab5NfqPyygxwZAa3J9vXK/lWwWTa5O/JwyzlTmBdlwYPQidFmxtwSy4lGRIvajudHn9DIbQKqxCbCXcqNfoRErrv2UOq4vnLb2a5yWJMUkdfoy5nliZRdWSjlwF4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQRczjeHD6wrgvMGG8wWlmweHvBT0bpTFUpI73r9lss=;
 b=ZvAzNRwZpN7cviOtS7Fratk3218b9AoIcTB3x5uYBnHWEAXAE5mkZ07upZn0WPVu0FzEOB3E3gEKgyQOa2QOUUDGkPnZWPKGoCEjf+L/o9gfPmVdUCDjbC/1go/g3rEdMFgIxuW87E/iSNaxYonJenvEMHN+4i5UcSeGGm6xU2XafJkc1E7rxtd1s3W2vqwE+plTZyTfeWpGZHR/erlKAdA0qT794Rv/OwPto2b5YcZgEnwuH/RDatjc4tqqKZew/hWv3GVGg5qoSqE3fozMjHDF4KdIVYk57DXJ3iY97rqMqW6aSznPDwDKsGfymzYzePZPAQOYcK1RXSueqnnXhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQRczjeHD6wrgvMGG8wWlmweHvBT0bpTFUpI73r9lss=;
 b=lRVYdHqnX/67BNrDxHuNVqKTE3p5QGd2H0py4S7FSCqARrfmDYczEJimIv4reGoCGz3DUlIDy2y15K27k+xSE2bIACrfUHsqGUcCgkhuAli/JLqAa8neyNxcRCTvPYP3JFOX31j/0z3xP05XPZD2NVkN7UzOZ0gbu05XmKJdoVddf0NIA04BLTKd3TPI+RvR+1MjUQ8shkYqbfjZFHw4v82Pi9Bz6NTgYu17OZ8y5kwPYkNfV2N3oEmxtjld1yUbESjkbBVegKf0tAOhbQJOhzZPaRpGpooGPmaOD9dKlSUTiCE3LTJYecZP7ly4O4I6PsLlAAAZqVPBjEHiLyB68g==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by PA4PR04MB7629.eurprd04.prod.outlook.com
 (2603:10a6:102:f2::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Tue, 12 May
 2026 14:39:03 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9891.021; Tue, 12 May 2026
 14:39:03 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Tue, 12 May 2026 16:38:59 +0200
Subject: [PATCH v6 04/10] arm64: dts: lx2162a-clearfog: specify sfp ports
 led colour and function
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-lx2160-pci-v6-4-d0ff72d3c983@solid-run.com>
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
	GVXPR04MB12057:EE_|PA4PR04MB7629:EE_|DB3PEPF0000885F:EE_|AM8PR04MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cc4f903-a724-4578-3db3-08deb0344245
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 BfWk3b8738IBMCJgDLP+E5Q2KZb6ccoJ6xZ5JAPku5EFS3Scdns3mlLZcSeKqp1bj0zw8q9tUztEiX/0TPt0u6s4RpSBNPmJ7HfGmPIKsUSh9QuV1ewcHBLmElWYPcK5qAZuqmmeHB1+6t41yFoVa1DZOA7w4PBObecxjZdd3f6/iowzOFUBIIfThT62eKN5JY9aImkGvOLWEKpjWnx7ol7v1jWNj/vXf6ViiWpio9W3+P5wceQ2T4BWNxUmY/Wjr1U0+6OQDn+Fp9tGadTOp9IEyLtoAHIhGCXeasR+PqHxRamSnGwayVA2oXUxmEWyd6wuchhuzPX4gAuqCtq6Sdns75CtjpjIl7hQxHPCgf74Vafm7mUsbxB3hE0ZO+if0p3G6R2uWl0EAZEGmBrKtNvv+SjPww1t5ou0ywOwxWPbm+joxrL/ya46TsSXwBlHtNDLnFlU5ihMjisfl6RuTriqIZgNIF/l9+1YljTbUkayZmtT9IxOPxl8IpUCpiO1oo6WaPAYspBb1kNvGXO92bzC3HEkQcKGp7vRm4GJhGzVAOcVX/aFg6sq8dtcDgXiVCGQ1tO/PASxKEAakLR3R8fWVNGJxKt0WL5F80qQw8S67y+8mxoi+Eps003Um8f0jVh4Nc57PyctkBqjxOlQ7Uf1iWmDr46J4qEQZio31wemdzmZjvjk3q6pNeR/pi2y4haoxMNvEjeb/PIlLKzC7qGOD4NUAxCfGi6hsw5uaMUlEG3mwoJwGSzQUMqqkMEs6q3R3SXOE068LRK6nZ0v9g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 ZpxMqjoLchm7yZAPUlx3TPA6yg/MWhzkOlOFSJ+7KfX9ocEqLJ0FdwMRmBCAunlPiJDXTcxn5MNzRPE4LBKxYSMLdYcISXz97bo8WSB3HGWtPNc3PH2QYS77sMH8Fpf+eEkjlQ7AGHeTHkys9IMW3/888TFpRZbogrtk8iKbF1LQQZqodyqLisUlMe7j8eZsuvhlTbv8nsh5HAAYzTI+LO6fMVlasMP00HZNBrauONeWQE5iS1P8yg4E/rTEn3x+nwlf4T/+Gh+Ot6Wys7H2HEqMyqwKrYj4F06GMf3bIjEM4ccFIjkRMmQ/aZ85FXg1imV6gtJ+ArKJtWZ7aor2tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7629
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: e961948564914942b941d679a4b2f78b:solidrun,office365_emails,sent,inline:419adc75474dac978fa76f6589bce4c6
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB3PEPF0000885F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1a733817-4b35-4eb6-77f7-08deb0343695
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|14060799003|7416014|376014|35042699022|1800799024|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ov0dGQ4vkmvCKCN7z4r5FRwCCaEuZ8HO81niC8VJhnf0Wk/j7c++j+AbYa3xIG21M4axhOvUz8yAljFzNOebqKqhMN2DTxyZxZukCyKjEZzB0Z2s3W100B9UkpAM1GetAgokuPhQmleksTxraworri6ll+HSteFIeKewhYHnzjzv5C39nr5SKtmBLTx9Ix1Y4nV5m+UcksJC6r0N6DlET539LT7fm8h4qS5gZBef0lmCpecIls0buzqErSKDolGNjsX41Gj8Xdahk85EBcSoiRBfCbrkbcqiLgUL0GDWj6DHllwpcFY7s+A0LyeiSd7EPj5S/D16AeYEeLiJ3H1NKykz3sYsJ4YWqa3R+gwp3I0eWMMhM0PgnTsS4QdFwZPmN5LRXcJPQIz9QbmI2XbMRrgmkdE3oLaApmVTdFZYoKkywUfLtVNTdfkzJf+ECrQRMCroyhVQAfGe50ajbwDQJFtqXncoiyVNhG8shS7sSLvD9XL8u7vz4MjuXd3GE/6zVwlJwbaPFyYTrZFwv4UakulONix3TmSZom9naSM6MfzUI8c6ZhH90sQGerUaFkf7ln7PQCT1eyAVnykaPvyFFIBOGB1z0Q8jfBFuuH0soTFD2tn5RC8ZJZ3UZVR4X/gMiFMNI3XaWTCL71C5xOyepVUxcScri2fpnhOhTFVkirpYrykmY0nJkVLH/UP/ZW3gm1lcfGDcFMqHkddfGC51A4KSZCBRhOI18COFml3IVl9CfwU6JojyLafJabuGiMNfJ8k0rzBvd7K8THQmHmMqNA==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(14060799003)(7416014)(376014)(35042699022)(1800799024)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LICpkvOs0oRGlk9Ct3zx4YLjkHuLLIHvTNxHRbSr8wY7oX4E0cE2KugQ5Q2khXO9xnUWZ+b+Dky2gqrRwfiyIZfoATWg4ueN3796zwArjUc4epVZvebhXp5sRy7j38lzzp1c3djz7KZDNz4phsgFroOVFHmenEvKz0Ov41f5WN4d81CJ30tl7ZA20Aw9tOt/k2SkguWfwEN1HSi+lLsBCNjCxEvN58TCB9zdHscoMSrvmEcLI1XGmqTBnNEB+77CmgIdJD7lZPM0Jl+NwwPd0WEQUBCZmNJ+dgVA6a+7x4VQaeOCGw/g0r4U1PGZf6HhjjrQ/ANe7kWUWyo83dnGoni/85Um3eEBlsj73gi/euCGZyEilA+i7rsWlKirXG0za+ACV4WpN/X8KeUOYRj/Y/B7kyv/Jp5m2vbpy7OVOJuhoeYA8W5QZBeqDEjv/dyx
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 14:39:22.9358
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cc4f903-a724-4578-3db3-08deb0344245
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7282

The LX2162A Clearfog board has a green LED on each of four SFP ports.

Describe in device-tree that their colour is green and function "lan".

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts b/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
index 6fd85a5cac94e..99ee2b1c0f13b 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2162a-clearfog.dts
@@ -6,6 +6,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/leds/common.h>
+
 #include "fsl-lx2160a-rev2.dtsi"
 #include "fsl-lx2162a-sr-som.dtsi"
 
@@ -38,6 +40,9 @@ leds {
 		compatible = "gpio-leds";
 
 		led_sfp_at: led-sfp-at {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <1>;
 			gpios = <&gpio2 5 GPIO_ACTIVE_HIGH>; /* PROC_IRQ5 */
 			default-state = "off";
 			linux,default-trigger = "netdev";
@@ -45,6 +50,9 @@ led_sfp_at: led-sfp-at {
 		};
 
 		led_sfp_ab: led-sfp-ab {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <2>;
 			gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>; /* PROC_IRQ11 */
 			default-state = "off";
 			linux,default-trigger = "netdev";
@@ -52,6 +60,9 @@ led_sfp_ab: led-sfp-ab {
 		};
 
 		led_sfp_bt: led-sfp-bt {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <3>;
 			gpios = <&gpio2 13 GPIO_ACTIVE_HIGH>; /* EVT1_B */
 			default-state = "off";
 			linux,default-trigger = "netdev";
@@ -59,6 +70,9 @@ led_sfp_bt: led-sfp-bt {
 		};
 
 		led_sfp_bb: led-sfp-bb {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			function-enumerator = <4>;
 			gpios = <&gpio2 14 GPIO_ACTIVE_HIGH>; /* EVT2_B */
 			default-state = "off";
 			linux,default-trigger = "netdev";

-- 
2.51.0

