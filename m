Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023085.outbound.protection.outlook.com [40.107.159.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E2939F183
	for <imx@lists.linux.dev>; Sun, 10 May 2026 15:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.85
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778425950; cv=fail; b=uLUnWbKni18Vf8b/yYgCaPG3XEDdcTqrwZK0RVuCZa5ElkHfYk8BWT0VRvvIbpPMg+h+gJwzkOKdq0INRzXtqkvD591TWk93pXxW64Oz/RYZWulXiJYYLL9gT0kl+yAwtK2+0VjbEVS+EkK4c7ZyVkRDjFxbPd66qjaE+JiC8+0=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778425950; c=relaxed/simple;
	bh=n0lGCmDsiJgQeWFsrgdNbE42vFBxRgo+ZfZkjsHzbnE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=feGjxrz+1g3WmYanrqnFQC3sypgjnMHBePg7odDSO7k5QGbuI19pnvBB306wDqoRRQKv22OKEawyT4ExM8fruLmG3Th3B1Zx+4dgrM5z7knKz4Q2TB4AYIdcvFmh6z3w+gQ3IZfG71SjF4/NBUpbanJdswLm+8vnT5W3Q/99xVk=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=wrg/fMHH; dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b=wrg/fMHH; arc=fail smtp.client-ip=40.107.159.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="wrg/fMHH";
	dkim=pass (2048-bit key) header.d=solid-run.com header.i=@solid-run.com header.b="wrg/fMHH"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qo57eVJ1F9Y9J5/wRjfh0bkMFhCPQy+V1qpv5fws1GWmuqGwtv+ci5WHR/aY/z9MbI9I0qtMMjJ8jurWAxNYYc2lFAke4w15Hb6CS8mE9sZYc7trVz6kS7W1nQ28Nxb5SKYk38i0R2BYpGhOlytsv4JaJIONVIaE81YEV8WTSnkDtYOhvyo6TdPt4VTFbswqzLeMzEW599T6ZqCy0L90OqFqFhFvRQTZJD+IHkd78CqK0X6rKvqQ1doX5WTyxc1c1ogFIZu9nrSfSacBzD8p4K2Cy77AREmMyaYfySyqLuqWrfytOFdswgem3mSSe3ajbZ8uRIVP2DUa5LxaJeUbqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZfSpREGf5zfJiIptgjXgwDaILYd5WVxyDyGPdguQtA=;
 b=BsaQsHlZ+rMxCjifwR0qJORNH5HCc6LPd08p2D4poxtiKwUO5lzvtfv80ZmS3lPEwIUPJoxBGFz4Nzdl2Q0YO5o5OEF3HTL+TdH3Pr1bs+lMHRhKc/pkTihJ3auv4X8AMDnLcIbk0H4hzo5quj50PeCew8hLcC+zpjrycDuLMI0RVMY2icf5FVQPuGzi0rHmaTZcxpiLnUgy1I/RKkB3Oex91DLqQhms6/h0CF1HzFs0vLDkMwFbA4sAbbJrufL0TzfBqSMsc+z8a5dXjXT74AJlVwtIRF8h0mQ0I5licS9cKq4LaKTJEBXCHEqx+s0r8mvmcbvxrpnQXXY7eGi18w==
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
 bh=GZfSpREGf5zfJiIptgjXgwDaILYd5WVxyDyGPdguQtA=;
 b=wrg/fMHHt9WCPBYcO1xqt/pT7Y3Mk8qg+OfQhgWB/jp2Fttd5s7P5+OzNk0d4MijQiZYtsbciUMPb+VxZNz+GsgLZO6VLx0CebkRPinDY+54+Jxe0kb10ex9AlGVYXlhztE4paH+15lijBiN1oAMbdDhsXIfaNLgMEIvYBdzkJJsXVFxuRI7oRz3xdkdi/ZghuIZU7tc266vzn/Pb3zwqJr3DZKMQNZEfr/QCkhVK34mHgPBisW6pXh1YIxhZRqu/AWxr7bekTgYUVBpE4Uyd/G9v74MVQ3yz9KRmYysnxdpl/+qNQK7aBygFcqjtoD7WF1Ft1Bu8HfS+rZzJMMh7w==
Received: from DUZPR01CA0201.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::12) by DUYPR04MB12665.eurprd04.prod.outlook.com
 (2603:10a6:10:661::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Sun, 10 May
 2026 15:12:25 +0000
Received: from DU2PEPF00028D06.eurprd03.prod.outlook.com
 (2603:10a6:10:4b6:cafe::74) by DUZPR01CA0201.outlook.office365.com
 (2603:10a6:10:4b6::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.22 via Frontend Transport; Sun,
 10 May 2026 15:12:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solid-run.com;dmarc=pass action=none header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 DU2PEPF00028D06.mail.protection.outlook.com (10.167.242.166) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Sun, 10 May 2026 15:12:25 +0000
Received: from emails-404593-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-143.eu-west-1.compute.internal [10.20.6.143])
	by mta-outgoing-dlp-588-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 03A057FF1D;
	Sun, 10 May 2026 15:12:25 +0000 (UTC)
X-Mailbox-Line: From b'josua@solid-run.com' Sun May 10 15:12:18 2026
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qHWDQ+G4CwhKyx0ZhAmBoNhyrG+Is9dwlfl6mgSbKWj/QMmEQvGkuJvzTR2Wc+s5znkLd2nYmbXqc6awElHs/XuDkqw0WSiylPmlVhwO3DdZ/o61gac2xPZ2dUknnC3PKhmcKjpw1PW4u2roHnL5//+lnGwlY/HmCuetENE0E73pYQ1XUXcKgybV6dTEDpQ9mRhVL4XITXUkPEZ7QNuSAGLEJVu4tl7THLg4mmIHRPHI0HDb6llsvlSmpy5v3L3mBuAAyO2WbbDxMgnjybrGly8DoO3O3CLIfIGp+YTKABTL9UEvySk5kp2aim4S085G6nOKi63BUkk12rFB4vthFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GZfSpREGf5zfJiIptgjXgwDaILYd5WVxyDyGPdguQtA=;
 b=S4fzqd0I7m6hj6XLAEH7MutTgLBeGhLyoFGiNdUVHtY711fUNooqNzDD1jPAX/WKCg7UtoqVurYWZtkGBoQUnmJEtViS+cTBJS+ZET3gHwfJBP61NZx1LV4+fhM7hzw1Xyt0uqg3VhAO6Xa6pvyQZe1PDfeo4xwNwri+80q2zDpEjsIuzrkmybSpN+eeEJSyvq/xTRLV9nIWd8UKLW1+p5HyHf+XJE1qhw+94f6JVyvSj5hnZcxACIHyq9qjTAmLD/ufemaQHQlEuyHc+DuSNqK3CDE98VWJgzq/ALd3V0BoVVp6s5LTqY/X+cqf9Ccf2WaQLPhydcWyxpisSVcX3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=solid-run.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GZfSpREGf5zfJiIptgjXgwDaILYd5WVxyDyGPdguQtA=;
 b=wrg/fMHHt9WCPBYcO1xqt/pT7Y3Mk8qg+OfQhgWB/jp2Fttd5s7P5+OzNk0d4MijQiZYtsbciUMPb+VxZNz+GsgLZO6VLx0CebkRPinDY+54+Jxe0kb10ex9AlGVYXlhztE4paH+15lijBiN1oAMbdDhsXIfaNLgMEIvYBdzkJJsXVFxuRI7oRz3xdkdi/ZghuIZU7tc266vzn/Pb3zwqJr3DZKMQNZEfr/QCkhVK34mHgPBisW6pXh1YIxhZRqu/AWxr7bekTgYUVBpE4Uyd/G9v74MVQ3yz9KRmYysnxdpl/+qNQK7aBygFcqjtoD7WF1Ft1Bu8HfS+rZzJMMh7w==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=solid-run.com;
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 (2603:10a6:150:313::24) by AM0PR04MB12004.eurprd04.prod.outlook.com
 (2603:10a6:20b:746::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Sun, 10 May
 2026 15:12:14 +0000
Received: from GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b]) by GVXPR04MB12057.eurprd04.prod.outlook.com
 ([fe80::14f1:a127:2988:de5b%7]) with mapi id 15.20.9891.020; Sun, 10 May 2026
 15:12:14 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Sun, 10 May 2026 17:12:11 +0200
Subject: [PATCH v5 09/10] arm64: dts: lx2160a-cex7: add labels to i2c buses
 behind mux
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-lx2160-pci-v5-9-540b83852227@solid-run.com>
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
	GVXPR04MB12057:EE_|AM0PR04MB12004:EE_|DU2PEPF00028D06:EE_|DUYPR04MB12665:EE_
X-MS-Office365-Filtering-Correlation-Id: aeb3b955-faaf-4a83-cec3-08deaea68ae5
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 lRDBm+I6NdsIihGw3ok1QMXolwyNMCfDrSfRDX7kbfNzLnUAaY8ONjXlvqFj9/f3hGYa6Zr13lsQrEeXG6sACQme7BvLhb0mt8bO3QrDwx9sH8Hqqh7YhG6DV9gTUptdmOTbHrToHMlZokcDRbUOMUsjx2rr3z6TjOYjs/KaMUfYolx4BS8ziUuryO2mnVrmrIHEwzCcCcGzMHVVdUw9gBPyAXPfnVhT/FLAAEQ48fnhc3HtgftGHfEYd/u3vYn/LZdVtbBSRLrkOZVNeNDFXVIfjYqS0fKDz+z/8RhMBLyDfPZQG7LpPkKZ2DN0aGySguFT14kA4aNsPzpef2DDeydIPB4Z/pT2+dL6XAs9TAyhnyT8i/7bfQuw3Cd5DK82C8G4jKBqlh7TBmS00vnYZIs6uGjPUVmIYoGOp20LTgGOFsPPIE7MwpZ2OZ0ZJRvcq6FZ4BpbJyniVcerNAJ8Oktilno9vUFoyK1mylABErRZhMApUlGR8fugbQG5vvOb9gFLSbUzFkGF+WNpXzjCtJQV8kVWGS3Zu/ATycU6oWiLc3dLhG8Z2mboQEPTzKPUoDPjgyncky4ghU1iXHNtTLydaAhNqDzyEuNgHJYu01Fqqaek8hAgxsGlIX+CRalKU0iAtBPNGHFWseoUO0JxzbQst7p+YKxNkf85L7k9SZGMvRQ6gy+BRLtbihVTzTaIow6xq5+i/M7uWn4TEt6qhw7ZPTIyBNz4kvycBmzOk+dXsj4J0WnLE4yLlRhbbKfRH/t7t+b6hQVIi+xWDlKX8Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12057.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-Exchange-RoutingPolicyChecked:
 jCXdyhiDGz46HW/VmNm8V/FSduaGN3XDC47+DRxAAxasnNqTNwOkDZmrM3qAuxu2KDWibfilRcbludMhwOoSVW1M1RCBY0nD/SgbMeI5At/jrrNB7FR01OEsv0cdoc6+5zz4+MM/7WRwuXmABH84xE35FdDpClB8hJ8asDmjSFCEKjan/fjpH7knvdtVxfYkVIMg+VU5prpFh8TsRCiZpEYxcnR47Psr+waLlr01IR2xihuyGdUYxTs3DFTiDpwI988Uog4IuBIJCxv5qyCahuVAbz3+pa3ADyWzms6USoJ6lhVIJ2r63PT5UI5tVwpxfEZ8O/mDT7e03ZcAnOtA3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12004
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2-7.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: 4c1aa9b0604b4f0c8316bd6c0997bc1b:solidrun,office365_emails,sent,inline:63c53062841a7830110b76fd4aab159a
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D06.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9c0e0fd8-b16c-49d9-0657-08deaea6847e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|14060799003|1800799024|36860700016|35042699022|82310400026|7416014|376014|921020|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VJeG3tSzaq4NVMZWwfL1W/v2yTvOcXESH0tMsD/EtsxGwCa6h2W1BvvrvxZfXfOWu4IbIguTVkKDH5K8efi3Q0aM47Foz8HtsbGhaJTIFCYowQ+b0cmaIq/G/SV42k6pL4+/jMLEMOOlMh9Buj5Jd0BfIy/vyYSotpVl3bqspMXbiQZ3iy39dbWweowOYZjbhXsC3tftWO3UPwhKHuQTEgZc+oo/DaqheiVZnT19B/oZ51LjkzGreh28OcQwmVfFMbw/tGGecvW/43BXuP4PMKNVBZ7hFkgljRq/66PdAw7uZQDD5n0h7mmzJciEY+xa3jjcVsYv0yPGVxleqOLwUWsjywO0o7PXrM5JQoJW2i/K4Jl636jw3/mN7/yjISoc6CPdK/Y8x0ZiSVayNXiKi2cbvENIQ0F+JbjhUQIDdH1xmQ54y+NqgNVHlUxm+RThSb5n5nRW9x6FQ7NspXYC1+kpJzRvXvYmYIN6j00zDmwNkSTid8qNkcT+PI5isP1VxyDckaV0W9WIDnkHFP03RXGYEjemxqsf2wPT39D3cGuRRuz/Szh4RU5G78awdcH7KjX1T4+u/LvQissiBogh5wQtGYyXkZCLk7UIIKuR5YWIL2J4803zNe6gJ96o9/b29NqB6JPP8fj2Ch5k0di24hCRL+2M3i1ag2d/yXVz1J2lH8S52urgLIuoVDZ5voWt8+/a6vXCYjQoMqkojAYpinHVT18Eu7rmvl5H5sAjICZMSTlGqaWeGS+vz/FNL4fp/qv0C/XkYHfAVruNvciX9w==
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(14060799003)(1800799024)(36860700016)(35042699022)(82310400026)(7416014)(376014)(921020)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	pxd4V8pDMkBEV87ZeG9W/ff89T6OcIUHuM9fsHU3PTEsn67+1NgC+bt21bFcqPqYupRnSX9A8V/1u6ugvkzuClxa8ME0ByttJeuU1B3A5lp/ESWUjuqh1V1l4HjXYiV6Poctla1KiM9YoUvBbqV8HAuZGxIK8EyKvF2j8VBu/Oaz9e3RUxZN1DQ7k+JELZHnQN/rKCXgYzuqA4l3xRlZ7keKJ5HyVLr9+CPogJaY/GyVUYbXTxgOq6nMDHhsjs4Z+oNqmtYoyNogibnjD+9NxIrOQtIr0Dl0YqgVv8UFe6VaUVZI2mtBJh848wx904aifg+QZoeWCF618sSNj1KYErzj3ZsGkbPo7DovI//iDQX1urEFcijLGnvZobs0Ng+qZo7PEX3VpIvazaKyGrvU51INiQUlsiWUyt/hsvM+MF4hrKVwUzwbUnkHvG6n9VCQ
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2026 15:12:25.0875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb3b955-faaf-4a83-cec3-08deaea68ae5
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D06.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUYPR04MB12665

The LX2160 CEX-7 module integrates in i2c bus multiplexer. Some of its
channel nodes have labels, others do not.

Add descriptive labels to the unlabeled channels, allowing other board
dts to reference them for example in aliases.

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
index 7df93bb37d13c..ce63545abb6e6 100644
--- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-cex7.dtsi
@@ -58,7 +58,7 @@ i2c-mux@77 {
 		#size-cells = <0>;
 		reg = <0x77>;
 
-		i2c@0 {
+		ddr_i2c: i2c@0 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <0>;
@@ -84,7 +84,7 @@ eeprom@57 {
 			};
 		};
 
-		i2c@1 {
+		fan_i2c: i2c@1 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <1>;
@@ -95,7 +95,7 @@ fan-temperature-ctrlr@18 {
 			};
 		};
 
-		i2c@2 {
+		power_i2c: i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <2>;
@@ -106,7 +106,7 @@ regulator@5c {
 			};
 		};
 
-		i2c@3 {
+		i2c_smb: i2c@3 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			reg = <3>;

-- 
2.51.0

