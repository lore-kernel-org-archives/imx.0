Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023088.outbound.protection.outlook.com [52.101.72.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B7439FCDC
	for <imx@lists.linux.dev>; Sun, 10 May 2026 15:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.88
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778425952; cv=fail; b=ca8pMyZA3l5C+mCoWMz7jNa33dNLcXEHBURRNnxXf4M2tGSuCpCjNK0aZz7E3T8+VOwcEgegv+ouZZK7E4n7S6wDhkv8cqx11pwbWRc+wlnnBBETE0L0x6t84caP3wMlqDczDNCePaowLr6+8xd7oZ03hNrioAyPcJBv6eIiznY=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778425952; c=relaxed/simple;
	bh=d0+p8VL/MZLRIKFyxVcGSj48chQHr0AYg+t58b9qYdg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kffObKfsgTRzTOxKQnHtV2Fz9AHGlgrryG1eFDVdGRKGSZBqgfLGlAduvUuacOvpC/ecOZtOT3d3uTH4EQBXDrBvHPGhHF4zxJ6UkXUqAfIShsbXJDJKMm9VebD58BGrDutbubwSTj1dp470YlvdLtXocKjRsyCCTNPHCKwVL60=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=rqPx5uS7; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=rqPx5uS7; arc=fail smtp.client-ip=52.101.72.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="rqPx5uS7";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="rqPx5uS7"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=YLk7dY35/npjrRb1ptRTN8tj0IJzHI/YIKrZ23nzVo6NK8fXuWl0o+9TYkytqSr9nN/8FMWAwqSaZL8OVnUuK1iQYeVU0alggHkMFZK7vxFXY8TxOJWCwvtn0Y0/IEh3HDO4c18eoNABOSLG2rLQKtYeW56xezHj7qTsjjBtJ4YavEtuD2mBbObpqMFTB2MzPwYlNgXTdWiLi6p/Qy4fXWZqupF/sFAWAAZwKC9+J3zUX+xrUmMvEf31K2w91LxzAALxSxcNKKsYcKplqzqJYC3O+J0dUHsT2NTNMYGeHL7bAa3l0/4NpwMlfieE57qBx7FTEipxwE7xaYP4m8ugVw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AeeoTwWk95BYAjfb7AMXaSOKQlLmfGm2kXjk5GrJbvE=;
 b=VblK3Idw8h0g2qu2Pz+wgVu+IksLFRKE7N+JR5z4sBLqFoGg6MhXlgC3be3tPQEoVXbjXZQ3EBDfPHYTGmT3nwkvYdet/RIbMiBSLnBjmiuIdoaMfh7MBEBH45/s0PuSZTERNTVd0MteEXBveBKd/YX2dbvaaJTfEdGI4YfksaaCtqfjw1lur/J6Trpgswexi1UnUKXbbQRIn8+QtPDKpMjnIHpYoYgMjJw4ZD8amdtTRqvEz1e/poJwgPGsExne6XeZn8OnQKgohFUt0ZnIHZy9D/WNScGh0IHDcPOWzxSVA02E+5U+NcrjWxZjmA6+VO09lImvNIfevNulPYxXvQ==
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
 bh=AeeoTwWk95BYAjfb7AMXaSOKQlLmfGm2kXjk5GrJbvE=;
 b=rqPx5uS7Qx+mYo5rFtxDKUUFHYX9QWYmU9VeB9gfljVXyB+Vc24Df0Ql2kGmlDEBU4FLCOL58ZztrESEgvThyQv2F/iMFkSof5POYk6spfoxywB8nbttKGm/9tuIBTbvN/cRkiSotntc77MmvljQ7lL5gl9Yd2LnTTua4niTQO9k9aZa2x+8rdPV5jOhRaQw4Y2AFnFm1L0EgHDTGGJeRq8JAGWXh9cUO9bzlEuUZ2N3obeu5ESDo8eTKOg1u2yIzqM2WykN2BXHikqrQN911FuoibtPtxdI5IS7BEbjhjR4H5QCIPgVqbORdIBh95YQjcveFzdJCUrpKC5zhcfnYQ==
Received: from DUZPR01CA0319.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::18) by AMBPR04MB12288.eurprd04.prod.outlook.com
 (2603:10a6:20b:730::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Sun, 10 May
 2026 15:12:24 +0000
Received: from DU6PEPF0000B61D.eurprd02.prod.outlook.com
 (2603:10a6:10:4ba:cafe::7b) by DUZPR01CA0319.outlook.office365.com
 (2603:10a6:10:4ba::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.22 via Frontend Transport; Sun,
 10 May 2026 15:12:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU6PEPF0000B61D.mail.protection.outlook.com (10.167.8.137) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Sun, 10 May 2026 15:12:23 +0000
Received: from emails-6537907-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-143.eu-west-1.compute.internal [10.20.6.143])
	by mta-outgoing-dlp-305-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id B05B8805BD;
	Sun, 10 May 2026 15:12:23 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun May 10 15:12:15 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lVhVMVM7lX7r7zAg5JFn9RX79+cCxuk/7nw2NDZa/eJA25zcAfC4Rfx8pwwfj1AMTwk1Ecmc3Tf7QF/BW5kQv51CKBAWca6TFK41Dmd0Cz7TuEwMwgrj+uBysHSd8Q0eVU7kGbumHgxzDKKXA9IDKN1s+honLnBHLD4cG5GoRH9qaaPD+M4QI71wWZ9zhthHz5LcJuh6//9TNBYNPA0dqWKjRhQFicGXvF9wefSg+qeNf24QJWi46aq0Y+ojH3glHQ7DVh5pNyiAxKxXEuV9gY/mbQRNS6eKclZBpf8wpCBSwP5mg9vOi5U2D9gA+TiUobaH/MPCg6c9SMo4JBXaQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AeeoTwWk95BYAjfb7AMXaSOKQlLmfGm2kXjk5GrJbvE=;
 b=CMaVMegJfp0IJfcgPzbunksuAH0hI5vnG9gNdRFsH0wf0RaYubO7lMl6vds8+BRs1jIxKROEdSZSI27FSaI6vA5cOezKwmy4DfzqAEKcG91RCY9LVdh+5o564kJxgTf3IaF4Zz3CldKEcjkPLl1g9v+wjZt+Q2i/K/ueE/+BnjkNaJx/msDwARUSmtMh9GQb+7kHXQWwEtWwYFhnJS04AAfYY5H51D3EHYgo1PbRqDNGKCv7gC5BcT2WXVgHZR0NITa9Tm9SkTAqjNRVaRXElJo4kZLRTYLVFqs8zlfh1/jwmFdCkS0G+gjz6O0o77pvajuPQe3S1TdShWA9cEIuXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AeeoTwWk95BYAjfb7AMXaSOKQlLmfGm2kXjk5GrJbvE=;
 b=rqPx5uS7Qx+mYo5rFtxDKUUFHYX9QWYmU9VeB9gfljVXyB+Vc24Df0Ql2kGmlDEBU4FLCOL58ZztrESEgvThyQv2F/iMFkSof5POYk6spfoxywB8nbttKGm/9tuIBTbvN/cRkiSotntc77MmvljQ7lL5gl9Yd2LnTTua4niTQO9k9aZa2x+8rdPV5jOhRaQw4Y2AFnFm1L0EgHDTGGJeRq8JAGWXh9cUO9bzlEuUZ2N3obeu5ESDo8eTKOg1u2yIzqM2WykN2BXHikqrQN911FuoibtPtxdI5IS7BEbjhjR4H5QCIPgVqbORdIBh95YQjcveFzdJCUrpKC5zhcfnYQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by DU4PR04MB11055.eurprd04.prod.outlook.com
 (2603:10a6:10:58f::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Sun, 10 May
 2026 15:12:09 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9891.020; Sun, 10 May 2026
 15:12:08 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 10 May 2026 17:12:03 +0200
Subject: [PATCH v5 01/10] arm64: dts: lx2160a: extend 32-bit, and add
 64-bit pci regions
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-lx2160-pci-v5-1-540b83852227@solid-run.com>
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
	GVXPR04MB12057:EE_|DU4PR04MB11055:EE_|DU6PEPF0000B61D:EE_|AMBPR04MB12288:EE_
X-MS-Office365-Filtering-Correlation-Id: 609ea342-cc01-441a-a78f-08deaea68a20
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 HF9ZcMahmY4CsdxFXupxmzKanoiZ5QF0AJAdTM2iCgZcfdSWVsFDKfzzho51KGgB+HsLYB/a1tT7JcA/q+2iVi7NAURaiwXmsEmdGyIsyiT1THGMjbIv018e3ZTBs1tST9IrmafrBrMC4igkN9tRlxrNrZcqEfVHukZohhwo4B/aA23e3KnA1dB+NQxNmSgD8cGNtnE9yqc3QN1XMJGMzwUw4Qk/tbmFW/WK2Rn4TKuiACHVr7i7ZddwLahPOy6OCP43/b0j3BpsR9z48iq0NkSRiKHFr5X9lfEp+OG2z4PSAM8lzAP6RMKiJARpUT2lYZ6BUtUWI/bTSRWLzZnQfa3W27ieDu88UEok++CqVhtRjUOj3ZXzTOC6ZkXQkmS9vjzQH/DIaNOlzcIL3ZboCfgSvXqWPOFIFvRjXhhmRy6PBzWisALMurdjuLs3ghei3OKjed1Q7b+XywGzxHWjA/xNCzMZweSKJhJ+TUwIOpFNhMq0y8ckBlIYSMGAGpgXh7qAxX0loH6uR02VjSpYXklJe714PrlTd3G5J+I4/KXb+ZuPutfztQeNhp5GG4iktd5JpAdgRW7g+yHc7SX1+39CRkftgx8pH6VkVnW76rqR/7kFWv4LeE5JeAPGwVAPPpgLPs5MnJinuC2+Lkq3M5o26gSZrxwnfgtjbS0pwW+ALce7fGBGaa3cR1wm7Eupzwf1BFxL0O3R4uRL5nJFt8gpkIUCjQqtpIYipGKjKPniWgZcOf/SuopHOB1InmTgZI67xsfoFHSFUV7OqBOqfw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 KyHvFI4QcFIo5WIhCwtYU+3zSKy7vgMZiroMb5/+5PAbRZozhVBFQgI6fAjSb1YcTZY+YUHZICE9A7X7RgNKlfOP+IJ4CTa1/frv9vAi9y5CjeDtzFwEoan4WM5ytZHbBE0qY2rZ/K3QbFqa+6dol3o5IVVDF0zNQM5DeTQWDX6GO7PDKeQRn8XVeg064EDxN3iOqhgeOP11VLNFQClTHZBKkyeOWCA5SJPpQNa91V+qgyIDP/Vu4RiPId9s9ZFQlpwNKSDUldLKEscIY2VDzuRNca0dkcE+RJwQqOj/VLl8z0+Q/m7uFuTK5bhBcOERWrwLdC6HfDQVJef8Zd0Ziw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11055
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 05e69f28439d447bbc1ec1e77ced2fcf:solidrun,office365_emails,sent,inline:63c53062841a7830110b76fd4aab159a
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	75076edf-5091-41ed-2d90-08deaea680d9
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|36860700016|35042699022|82310400026|7416014|376014|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	OPNiE7ssxunEJ5famDgkU1b5wiVWeodyn/eO/X+qVqZ6u6Lo1hQ0lWLGPlLzcK7yLcPXtx4yhUMQ9+w/cMJmLDjqZNt/RGW9x34aJIUfwhFMRSICiuwCZLOkzjYgGC0pJJGYrAAD1KioFOaZO0EY6agtn39ulk6uHoZ37FpDakDX/YBRDvlsj8+HnYU3n3YMP2Wa7bNb8MfD/3AIgQ35ZN8QERcgjruU6k5Yp/jkieaOJMjVL1gEKUg84hhPzFBHnlm1jQT+HO8Fabo5eeAPhfXmR1qSD6CckPsM44DJKfPxmTiYVXMGlm7VMxFIt0PCjPCWEBNgaWYn1SoOR5LfOlJ9bA9AYCXeJes4loQIR06pegQFQbQH4oMq8REQYI2kYsFSqEIbs9NSF4HlLmmyjJr8csYzmjkoJlAfPSMuJLhPGdbbHBSRKzDqyFPrTZYuXKp1f/ZmAAYzqNQmIjiXT2c+506SHUMgisIbjJuJXfcnLwfX9/N4KfZ5C6SdDqpYPR2Remo7ykGF1HFA993gTkZNN+0bY/1llbWVvf96ffpcsVmOdndx7ABmR40kLayb31jt9ITqgXxOVld3kG9afUZUosfhY23t9RyeoLfQRrJL8fyGmjllE3buuSJim5xJpX0qL1dqIXth5IQXr8dFQbH22MMXaIbW7Wp48SL8u6mMxhxIL1qh/MAhiWLTbuDYuOSOdQSmkmdOx+c13uY03Ax8BNy5t46py0M93bSuqEo1F7wneWpLk1IykRbvREareroFH+ni0LlDsYF/Ar3D3w==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(36860700016)(35042699022)(82310400026)(7416014)(376014)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Y4DrVhx1yXE4LFJ8eM2l5LdPHiipsdeLQPyi2pYMtwMhrnZM/QpWhJAJQ3KveWM0QraTXlljl5UMULyVPGEy4wcobLWvmEiDnW5f5w53QStGTOh8y74bTtZ3PTbYQZGRERMGkXnHhAUQ9Bs8zu5eaL0aQtJuTkIAApE1f8rWgA5QIcMnm1K5GfrTlMsC9wfbJPHubuCmrVaPtMK4uHpKJWJKZrcoboAx0rY8VNknqWTNH4EKegSNoKFbOlwrpXlX8nFba9bbKelu68wot06j488zfNVPMCuIBR2XcnIC1kzX0JsxAZ/rEimfPx9AiqbZSaAuwcl9DeOAqkTH1UsQlLcsGbFQX13CsIHE7ab+FqTpX4fpl0zNSxHGI45cnsV/OPO9IbLbNlQUKXZ6TNmgIfSbl81yAzAs8TsDmHuDMcS9uUMpsaXX3kbYx1GzdqF7
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2026 15:12:23.7943
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 609ea342-cc01-441a-a78f-08deaea68a20
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF0000B61D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12288

LX2160 SoC pci-e controller supports 64-bit memory regions up to 16GB,
32-bit regions up to 3GB and 16-bit regions up to 64k.

For each pci-e controller:
- extend the existing 32-bit regions to 3GB size
- drop IORESOURCE_BUSY flag
- add 64-bit region
See [1] and [2] for boot messages showing ranges before and after.

IORESOURCE_BUSY is dropped since it has no effect when specified in dts.

For LX2160A Silicon revision 1, the 16GB 64-bit area is split into 4
pieces, because the layerscape pcie driver fails to program atu for
larger ranges [3].

Similar memory allocation with similar flags was tested with UEFI and ACPI
on pcie3 and pcie5, on a variety of nxp vendor fork versions.

This patch was tested on Linux v7.1-rc1 and u-boot, with two pcie cards:
- pcie5: Radeon Pro WX2100
- pcie3: ADATA NVME

This fixes allocation of large, and 64-bit BARs as requested by many pci
cards - especially graphics processors or AI accelerators, e.g.:

[    2.941187] pci 0000:01:00.0: BAR 0: no space for [mem size 0x200000000 64bit pref]
[    2.948834] pci 0000:01:00.0: BAR 0: failed to assign [mem size 0x200000000 64bit pref]

[1] example of new allocations (pcie5):
[    1.182745] layerscape-pcie 3800000.pcie: host bridge /soc/pcie@3800000 ranges:
[    1.182760] layerscape-pcie 3800000.pcie:      MEM 0xa400000000..0xa7ffffffff -> 0xa400000000
[    1.182771] layerscape-pcie 3800000.pcie:      MEM 0xa040000000..0xa0ffffffff -> 0x0040000000
[    1.182778] layerscape-pcie 3800000.pcie:       IO 0xa000010000..0xa00001ffff -> 0x0000000000
[    1.183642] layerscape-pcie 3800000.pcie: iATU: unroll F, 256 ob, 24 ib, align 4K, limit 4G
[    1.385429] layerscape-pcie 3800000.pcie: PCIe Gen.3 x8 link up
[    1.385481] layerscape-pcie 3800000.pcie: PCI host bridge to bus 0001:00
[    1.385484] pci_bus 0001:00: root bus resource [bus 00-ff]
[    1.385488] pci_bus 0001:00: root bus resource [mem 0xa400000000-0xa7ffffffff pref]
[    1.385491] pci_bus 0001:00: root bus resource [mem 0xa040000000-0xa0ffffffff] (bus address [0x40000000-0xffffffff])
[    1.385494] pci_bus 0001:00: root bus resource [io  0x10000-0x1ffff] (bus address [0x0000-0xffff])
[    1.385516] pci 0001:00:00.0: [1957:8d80] type 01 class 0x060400 PCIe Root Port
[    1.385538] pci 0001:00:00.0: PCI bridge to [bus 01-ff]
[    1.385544] pci 0001:00:00.0:   bridge window [io  0x11000-0x11fff]
[    1.385548] pci 0001:00:00.0:   bridge window [mem 0xa040000000-0xa0502fffff]
[    1.385605] pci 0001:00:00.0: supports D1 D2
[    1.385607] pci 0001:00:00.0: PME# supported from D0 D1 D2 D3hot
[    1.386778] pci 0001:01:00.0: [1002:6995] type 00 class 0x030000 PCIe Legacy Endpoint
[    1.387336] pci 0001:01:00.0: BAR 0 [mem 0xa040000000-0xa04fffffff 64bit pref]
[    1.387368] pci 0001:01:00.0: BAR 2 [mem 0xa050000000-0xa0501fffff 64bit pref]
[    1.387385] pci 0001:01:00.0: BAR 4 [io  0x11000-0x110ff]
[    1.387402] pci 0001:01:00.0: BAR 5 [mem 0xa050200000-0xa05023ffff]
[    1.387418] pci 0001:01:00.0: ROM [mem 0xa050240000-0xa05025ffff pref]
[    1.387493] pci 0001:01:00.0: enabling Extended Tags
[    1.388960] pci 0001:01:00.0: supports D1 D2

[2] example of previous allocations (pcie5):
[    1.716744] layerscape-pcie 3800000.pcie: host bridge /soc/pcie@3800000 ranges:
[    1.724060] layerscape-pcie 3800000.pcie:      MEM 0xa040000000..0xa07fffffff -> 0x0040000000
[    1.733277] layerscape-pcie 3800000.pcie: iATU: unroll F, 256 ob, 24 ib, align 4K, limit 4G
[    1.836220] layerscape-pcie 3800000.pcie: PCIe Gen.3 x8 link up
[    1.842186] layerscape-pcie 3800000.pcie: PCI host bridge to bus 0001:00
[    1.848883] pci_bus 0001:00: root bus resource [bus 00-ff]
[    1.854363] pci_bus 0001:00: root bus resource [mem 0xa040000000-0xa07fffffff] (bus address [0x40000000-0x7fffffff])
[    1.864892] pci 0001:00:00.0: [1957:8d80] type 01 class 0x060400 PCIe Root Port
[    1.872216] pci 0001:00:00.0: PCI bridge to [bus 01-ff]
[    1.877438] pci 0001:00:00.0:   bridge window [io  0x1000-0x1fff]
[    1.883526] pci 0001:00:00.0:   bridge window [mem 0xa040000000-0xa0502fffff]

[3] error programming atu beyond 4GB:
[    1.716762] layerscape-pcie 3800000.pcie: host bridge /soc/pcie@3800000 ranges:
[    1.724080] layerscape-pcie 3800000.pcie:      MEM 0xa400000000..0xa7ffffffff -> 0xa400000000
[    1.732615] layerscape-pcie 3800000.pcie:      MEM 0xa040000000..0xa0ffffffff -> 0x0040000000
[    1.741142] layerscape-pcie 3800000.pcie:       IO 0xa010000000..0xa01000ffff -> 0x0000000000
[    1.750379] layerscape-pcie 3800000.pcie: iATU: unroll F, 256 ob, 24 ib, align 4K, limit 4G
[    1.759089] layerscape-pcie 3800000.pcie: Failed to set MEM range [mem 0xa400000000-0xa7ffffffff flags 0x2200]
[    1.769089] layerscape-pcie 3800000.pcie: probe with driver layerscape-pcie failed with error -22

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 .../arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi | 30 +++++++++++-------
 arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi     | 37 ++++++++++++++++++----
 2 files changed, 49 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi
index f54005e37924b..318210ad5bec1 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-rev2.dtsi
@@ -14,8 +14,9 @@ &pcie1 {
 	      0x80 0x00000000 0x0 0x00002000>; /* configuration space */
 	reg-names = "regs", "config";
 
-	ranges = <0x81000000 0x0 0x00000000 0x80 0x00010000 0x0 0x00010000
-		  0x82000000 0x0 0x40000000 0x80 0x40000000 0x0 0x40000000>;
+	ranges = <0x42000000 0x84 0x00000000 0x84 0x00000000 0x04 0x00000000>, /* 64-Bit - prefetchable - 16GB */
+		 <0x02000000 0x00 0x40000000 0x80 0x40000000 0x00 0xc0000000>, /* 32-Bit - non-prefetchable */
+		 <0x01000000 0x00 0x00000000 0x80 0x00010000 0x00 0x00010000>; /* 16-Bit IO Window */
 
 	interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-names = "intr";
@@ -30,8 +31,9 @@ &pcie2 {
 	       0x88 0x00000000 0x0 0x00002000>; /* configuration space */
 	reg-names = "regs", "config";
 
-	ranges = <0x81000000 0x0 0x00000000 0x88 0x00010000 0x0 0x00010000
-		  0x82000000 0x0 0x40000000 0x88 0x40000000 0x0 0x40000000>;
+	ranges = <0x42000000 0x8c 0x00000000 0x8c 0x00000000 0x04 0x00000000>, /* 64-Bit - prefetchable - 16GB */
+		 <0x02000000 0x00 0x40000000 0x88 0x40000000 0x00 0xc0000000>, /* 32-Bit - non-prefetchable */
+		 <0x01000000 0x00 0x00000000 0x88 0x00010000 0x00 0x00010000>; /* 16-Bit IO Window */
 
 	interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-names = "intr";
@@ -46,8 +48,9 @@ &pcie3 {
 	       0x90 0x00000000 0x0 0x00002000>; /* configuration space */
 	reg-names = "regs", "config";
 
-	ranges = <0x81000000 0x0 0x00000000 0x90 0x00010000 0x0 0x00010000
-		  0x82000000 0x0 0x40000000 0x90 0x40000000 0x0 0x40000000>;
+	ranges = <0x42000000 0x94 0x00000000 0x94 0x00000000 0x04 0x00000000>, /* 64-Bit - prefetchable - 16GB */
+		 <0x02000000 0x00 0x40000000 0x90 0x40000000 0x00 0xc0000000>, /* 32-Bit - non-prefetchable */
+		 <0x01000000 0x00 0x00000000 0x90 0x00010000 0x00 0x00010000>; /* 16-Bit IO Window */
 
 	interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-names = "intr";
@@ -63,8 +66,9 @@ &pcie4 {
 	       0x98 0x00000000 0x0 0x00002000>; /* configuration space */
 	reg-names = "regs", "config";
 
-	ranges = <0x81000000 0x0 0x00000000 0x98 0x00010000 0x0 0x00010000
-		  0x82000000 0x0 0x40000000 0x98 0x40000000 0x0 0x40000000>;
+	ranges = <0x42000000 0x9c 0x00000000 0x9c 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 16GB */
+		 <0x02000000 0x00 0x40000000 0x98 0x40000000 0x00 0xc0000000>, /* 32-Bit - non-prefetchable */
+		 <0x01000000 0x00 0x00000000 0x98 0x00010000 0x00 0x00010000>; /* 16-Bit IO Window */
 
 	interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-names = "intr";
@@ -79,8 +83,9 @@ &pcie5 {
 	       0xa0 0x00000000 0x0 0x00002000>; /* configuration space */
 	reg-names = "regs", "config";
 
-	ranges = <0x81000000 0x0 0x00000000 0xa0 0x00010000 0x0 0x00010000
-		  0x82000000 0x0 0x40000000 0xa0 0x40000000 0x0 0x40000000>;
+	ranges = <0x42000000 0xa4 0x00000000 0xa4 0x00000000 0x04 0x00000000>, /* 64-Bit - prefetchable - 16GB */
+		 <0x02000000 0x00 0x40000000 0xa0 0x40000000 0x00 0xc0000000>, /* 32-Bit - non-prefetchable */
+		 <0x01000000 0x00 0x00000000 0xa0 0x00010000 0x00 0x00010000>; /* 16-Bit IO Window */
 
 	interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-names = "intr";
@@ -95,8 +100,9 @@ &pcie6 {
 	       0xa8 0x00000000 0x0 0x00002000>; /* configuration space */
 	reg-names = "regs", "config";
 
-	ranges = <0x81000000 0x0 0x00000000 0xa8 0x00010000 0x0 0x00010000
-		  0x82000000 0x0 0x40000000 0xa8 0x40000000 0x0 0x40000000>;
+	ranges = <0x42000000 0xac 0x00000000 0xac 0x00000000 0x04 0x00000000>, /* 64-Bit - prefetchable - 16GB */
+		 <0x02000000 0x00 0x40000000 0xa8 0x40000000 0x00 0xc0000000>, /* 32-Bit - non-prefetchable */
+		 <0x01000000 0x00 0x00000000 0xa8 0x00010000 0x00 0x00010000>; /* 16-Bit IO Window */
 
 	interrupts = <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
 	interrupt-names = "intr";
diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
index 479982948ee53..3f63fbf2485e5 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a.dtsi
@@ -1193,7 +1193,12 @@ pcie1: pcie@3400000 {
 			apio-wins = <8>;
 			ppio-wins = <8>;
 			bus-range = <0x0 0xff>;
-			ranges = <0x82000000 0x0 0x40000000 0x80 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+			ranges = <0x42000000 0x87 0x00000000 0x87 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0x86 0x00000000 0x86 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0x85 0x00000000 0x85 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0x84 0x00000000 0x84 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x02000000 0x00 0x40000000 0x80 0x40000000 0x00 0xc0000000>; /* 32-Bit - non-prefetchable */
+
 			msi-parent = <&its 0>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
@@ -1221,7 +1226,11 @@ pcie2: pcie@3500000 {
 			apio-wins = <8>;
 			ppio-wins = <8>;
 			bus-range = <0x0 0xff>;
-			ranges = <0x82000000 0x0 0x40000000 0x88 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+			ranges = <0x42000000 0x8f 0x00000000 0x8f 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0x8e 0x00000000 0x8e 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0x8d 0x00000000 0x8d 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0x8c 0x00000000 0x8c 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x02000000 0x00 0x40000000 0x88 0x40000000 0x00 0xc0000000>; /* 32-Bit - non-prefetchable */
 			msi-parent = <&its 0>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
@@ -1249,7 +1258,11 @@ pcie3: pcie@3600000 {
 			apio-wins = <256>;
 			ppio-wins = <24>;
 			bus-range = <0x0 0xff>;
-			ranges = <0x82000000 0x0 0x40000000 0x90 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+			ranges = <0x42000000 0x97 0x00000000 0x97 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0x96 0x00000000 0x96 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0x95 0x00000000 0x95 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0x94 0x00000000 0x94 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x02000000 0x00 0x40000000 0x90 0x40000000 0x00 0xc0000000>; /* 32-Bit - non-prefetchable */
 			msi-parent = <&its 0>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
@@ -1277,7 +1290,11 @@ pcie4: pcie@3700000 {
 			apio-wins = <8>;
 			ppio-wins = <8>;
 			bus-range = <0x0 0xff>;
-			ranges = <0x82000000 0x0 0x40000000 0x98 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+			ranges = <0x42000000 0x9f 0x00000000 0x9f 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0x9e 0x00000000 0x9e 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0x9d 0x00000000 0x9d 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0x9c 0x00000000 0x9c 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x02000000 0x00 0x40000000 0x98 0x40000000 0x00 0xc0000000>; /* 32-Bit - non-prefetchable */
 			msi-parent = <&its 0>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
@@ -1305,7 +1322,11 @@ pcie5: pcie@3800000 {
 			apio-wins = <256>;
 			ppio-wins = <24>;
 			bus-range = <0x0 0xff>;
-			ranges = <0x82000000 0x0 0x40000000 0xa0 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+			ranges = <0x42000000 0xa7 0x00000000 0xa7 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0xa6 0x00000000 0xa6 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0xa5 0x00000000 0xa5 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0xa4 0x00000000 0xa4 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x02000000 0x00 0x40000000 0xa0 0x40000000 0x00 0xc0000000>; /* 32-Bit - non-prefetchable */
 			msi-parent = <&its 0>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;
@@ -1333,7 +1354,11 @@ pcie6: pcie@3900000 {
 			apio-wins = <8>;
 			ppio-wins = <8>;
 			bus-range = <0x0 0xff>;
-			ranges = <0x82000000 0x0 0x40000000 0xa8 0x40000000 0x0 0x40000000>; /* non-prefetchable memory */
+			ranges = <0x42000000 0xaf 0x00000000 0xaf 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0xae 0x00000000 0xae 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0xad 0x00000000 0xad 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x42000000 0xac 0x00000000 0xac 0x00000000 0x01 0x00000000>, /* 64-Bit - prefetchable - 4GB chunk */
+				 <0x02000000 0x00 0x40000000 0xa8 0x40000000 0x00 0xc0000000>; /* 32-Bit - non-prefetchable */
 			msi-parent = <&its 0>;
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 7>;

-- 
2.51.0

