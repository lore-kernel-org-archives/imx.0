Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11023083.outbound.protection.outlook.com [40.107.162.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FDA7284880
	for <imx@lists.linux.dev>; Wed,  1 Oct 2025 12:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759322651; cv=fail; b=uvE4tHvqb2BBtveCgg7uKBaAy7GWsPu2Z5p7kW+iEfZFtMoCVY/eVHxcVS5GrdZzYCVIIh3JMFdvVG147T/4lqYUIhd7Ys4jZAvP3T4hF8p+0gbXbywV2s658XNA9j8C+NzELOl+TltLnr/5igYiyhVBJSiI5ven6Wmxjlyjh+I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759322651; c=relaxed/simple;
	bh=vuYEGSw/E7hMYio8hyzonj9Z+FQhdv6Z1UOV/g6JiOE=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=CZHkw6h/8SKdEXzo4mh2q7dhHcI8F/ntXeptsmv7R1XFF6z3BHGQkdP1yiBYR31cdHDUtv0KQGB+/hfIsdyjv4GdJxZMsFGURfPaiuE+cbR0ofAL9HEdXiDwGkiqqgKMZ7lhinS0ooFw/wjxwNITG+oZpLvewOTo1Kz681zDl1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de; spf=pass smtp.mailfrom=phytec.de; dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b=I0xDjrJ2; arc=fail smtp.client-ip=40.107.162.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=phytec.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytec.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=phytec.de header.i=@phytec.de header.b="I0xDjrJ2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LHrdeQWZ/boCgkDx3+/WT85ie/HEsegTPcMYKVBmSmNpGMmiT1Ob3eQocj6Vp+ZoAAxA+3/B3aodgqFarIgSgJTObn3RHcaGSlu8HT4ALUmOQX0VYP+0xgGP3l4wtBMwQQH3e2TO/ieWw44KK5y+gXMTY9LFOHpTbi9XjW7gBYkGJ0zYabuiU6pYzyZudF1wlcjgopSaLYF2O7yUo5roQoRGoaU33G+5IxhhjVGGiqGrputSKmL24zuY0qZHz74kuGC2HZaTp8kz8prOOLIPqw5Vdp89P2cQmLr7djAO/VrA+jIxpe+DR+w272rzYNCpzOyyRUt08Tz6a1iD+Eb7DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhmF+VdxxdRn76PMtERzb+HVa7A5guEUhF5IIhhFDnA=;
 b=ICUmA8aFzzKd5z4bneWEQht1Mc/LxEtveuE1m3S45VJAtDWcf6w/NgU42fV506MdTxghtb3t5IjQ/j/bEzrHlDVx2F/nnSP6f746SKub9omYfznfrVblv1FkEOxtevXhWz/lQOIABudfHt0VkUrrM1dtYIyI0ASNCF24HMxAn+10gnKYsmH97A+FoUGK4JWO/kOktiN1LOAfkexmnXfri0Jcar6PexKcPaJonSd3tDUfdviZsdcyOKoDoYiuIIQ0b6+c5Ie1vuXIqEfyS4v7hlpbXBaNnUbPGGGTWVwgxiK2meCf0SZFt0bj7DhatJ8e7POqkyWbPQC6Co37q5S1zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhmF+VdxxdRn76PMtERzb+HVa7A5guEUhF5IIhhFDnA=;
 b=I0xDjrJ2huPcBFvv3D1cVPhxmPkbsfX7WEEcCOPZAekVqW2R9etXxuONmvGlp8ss94jrdG7frdYSE+gLrXQnpz5Uu0Ao3Ry0JTzJ88elz8fFn50qbPsT2uc5nMxPy1QSCG+nJQF4dTCxDck5RJcuGUbL4x7/4LTthl7mX1kzjZiu/0cusfhej7ZvRlsIyWzkVhf4IkLC7eTvOROUDnRIqlYK/LARYLO0Wmjf/WpibDBlIx9gMRmSkNf++aMlYJiT0lYlvL9PCDCXmGVE0LYxOxBR9rDmEMbVxdg9mcn327jmnOVB4bRWF5+61BfTHLI6/fGf2QH7NeVF0YTpPO4QgA==
Received: from DB9PR05CA0012.eurprd05.prod.outlook.com (2603:10a6:10:1da::17)
 by GV1P195MB1972.EURP195.PROD.OUTLOOK.COM (2603:10a6:150:9b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 12:44:02 +0000
Received: from DB3PEPF0000885B.eurprd02.prod.outlook.com
 (2603:10a6:10:1da:cafe::82) by DB9PR05CA0012.outlook.office365.com
 (2603:10a6:10:1da::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9160.17 via Frontend Transport; Wed,
 1 Oct 2025 12:44:02 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB3PEPF0000885B.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Wed, 1 Oct 2025 12:44:01 +0000
Received: from augenblix2.phytec.de (172.25.0.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 1 Oct
 2025 14:44:01 +0200
From: Teresa Remmet <t.remmet@phytec.de>
Subject: [PATCH 0/2] dts: arm64: freescale: Update USB oc settings for
 PHYTEC i.MX8MM boards
Date: Wed, 1 Oct 2025 14:43:26 +0200
Message-ID: <20251001-wip-t-remmet-phytec-de-upstream-v1-0-845d71bb1e1e@phytec.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO4h3WgC/x3Nyw7CIBBG4VdpZu0kgDZWX8W4IOXHzoKWDHhpm
 r57ictvc85GBSoodO82UnykyDI32FNH4+TnF1hCMznjenM7G/5K5sqKlFA5T2vFyAH8zqUqfOK
 hd9dL9CFaWGqVrIjy+x8ez30/ALsCcvxxAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
CC: Yannic Moog <y.moog@phytec.de>, Benjamin Hahn <b.hahn@phytec.de>,
	Yashwanth Varakala <y.varakala@phytec.de>, Jan Remmet <j.remmet@phytec.de>,
	<devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<linux-arm-kernel@lists.infradead.org>, Teresa Remmet <t.remmet@phytec.de>
X-Mailer: b4 0.15-dev
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PEPF0000885B:EE_|GV1P195MB1972:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c19bbe2-2564-4433-90b7-08de00e832d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WHdHQW14SEFxSXJycWtSN2lHZ0c5S2RpcWtoT1VBM1hmd3BRaWNGWjdpTTdD?=
 =?utf-8?B?MHJ1U3lNdDQ0TThsbm02SktaL21MZDRNK01DcUh4N1FmUEw0RUpMMUI5NDVK?=
 =?utf-8?B?ZUJqa3RuUUwveUVhajgrWWdrSjJRb1kwTFoxeTBYQ3M5L0ppRFZmOGdRL2ZB?=
 =?utf-8?B?bGxjTzBJOWhtTzNIMTZVMU5BNjdBRkZEMVhRZmxHck40WTFMcWJEeW9hUDlk?=
 =?utf-8?B?MlBiUXdOSGhwcWJpM0RYKzlvWFBzNkZmRGR1cWFndnhkZHVCbmRZUDlveEtq?=
 =?utf-8?B?VGZyN3poUitLcUZ5Vlc5NVJBelJjZUZMRkFWNlRrdm5wWU03V1N6eCtXWWJz?=
 =?utf-8?B?K0tVRmR0amI1eFd0ZlBvcS8wS3RlTks3UnBRSkRycVBqMExHUi91dU1rcFda?=
 =?utf-8?B?ZXVqRlJNTTVKeDNNbHl6RjVwMVFjZWxTWUs4UFJpVlZ4MWRCbExzcWFnZWR5?=
 =?utf-8?B?Z2VEc0s5SzJrd1ZSRlYvd01uMXdSL0dXOHpIVyt2VkI5MDBPcGJhdVNSV0RF?=
 =?utf-8?B?UTdnY0I2eVBoV1FvaTZFYmJBL0h4QVNBcGdodXdtanFxbUI0VUl1RnMwTXZQ?=
 =?utf-8?B?clZvdWk4d3gzMGp4TUYrdkJHZU93a3lRdVRFRzQvT2dSTE5kakE1SFF5SWNp?=
 =?utf-8?B?d04yeXgveXRjWEphbit3bFh0Q1JGUXdxTzNrYUtFbEh2QUJGNzNwWHJnaWVQ?=
 =?utf-8?B?NjRteElWeVhIQ2JFbTIyWmgrTWd0UGh0U3hrb0IxeUYzNkM0SXdvUlByZmQv?=
 =?utf-8?B?SDZRYzF0WkZNZmFuWFlDb2JySVhlaGcvVExqTngyOXV5OVdUSGtJWXNlb3Va?=
 =?utf-8?B?QytZVEhkRkJEb0hnS3ZhQU1KYlp2YUYzZnMrUjMwR21CQlBVbFhDdm1hdWNU?=
 =?utf-8?B?NU9YcTZuWnd6R1RSeXlyNW82WHNWUlU5elVPbWxSK2l5TkZQemUwVGw2Q1Bi?=
 =?utf-8?B?azZPV0N4U3hCLy8zN3g1WDFPYTBzbXB4WjJlTW9LQkE5SWJkd3BpQmp6b2t1?=
 =?utf-8?B?SU9BSDRDUDZTV25yNkRvNkwzcmw3ZVpZZFhHc3VLQWZOZ1JpZnlZMXZqeXVx?=
 =?utf-8?B?elZ3LzB0SVJNRlJaNkxqY0VBMDVFVmhoWFRsQkpOVTlDYk04TUdiUGhTbGhD?=
 =?utf-8?B?QjhSOGx1Z0k5cFhnYTIxb1pzdGlPUTJxdjFGRTV2ZGRxeVczTkdoaysvdVlF?=
 =?utf-8?B?TXJYRldrdHR4cVR4RmlWYlNlTHBUNWMxR2ZaQkZ3djdpNnNEWkZ6bjlkbXA2?=
 =?utf-8?B?VHpOWkc4VjZVTVhVODhZVTIrZmFMYS9iNHVuV3BQOE9MT1VCK2hFbEN6ck5U?=
 =?utf-8?B?cEVPTFJmdThWb2VmUFZBY0p0TnRPNmxYRElDdXNuY0I5M1ZwN0FPejNzRDFh?=
 =?utf-8?B?SFlpTExTZTdRdFB4MGxENWNuOVJhcWxZbG5rMVBFbmw4RFJVRGpjYXlyZzg3?=
 =?utf-8?B?L3JPZTF3OXFXSGgwTDNoWVd5RVJERzRJSzM2c3dpTFVSWGxkZXBhYUZYcm8w?=
 =?utf-8?B?eThESXA4RndRRHlqcmRDUWxOUHZ1TkpWc3ltb2JnT1d6OXg1SFY4NlhRMStT?=
 =?utf-8?B?b01McGJKREdwM2ZhallIN1gySllMNGp6bFhQWTlOT012VkJGY2VoYnpNZmxl?=
 =?utf-8?B?bkppV0FPenp4Y0MzdnRyd3R0aFIvUm93SFlUWGFsRWk2NVhhQlR6QVMxekNL?=
 =?utf-8?B?ZmE5RWYzblloOXRNa2duMHhxamw3RkREeXNsMGRyd1BTWGpmMTk5Z212WFBS?=
 =?utf-8?B?TGVvUkcvZHdEVUxmL1BodTd2OURhNlVGSVZhbGxSUTA1UXVLRzg4Y29VdlVJ?=
 =?utf-8?B?ekdLVTNuWFdDaDhBK1JhQnJsZmRqYlBOa0k4dDJqQUtlSHFRcHdRZUxaK1FK?=
 =?utf-8?B?Mzc3VFZqeFRWRXFOSXpYMzBPOFp1ZmlHOTVOMnplT2JiY1JHd3BGdkc2SXQ2?=
 =?utf-8?B?NGJ5L3BoL0FmNnZkSjZIYUtjTTNEYXA2VW1BUjN6c0Zrd1dJUnNFOTd6SjFi?=
 =?utf-8?B?VndISEZVMXVmT2NjdXljbmJoZ3MxaHppeHJmOGxZb3NwVk1CNGF4TUUwTTh3?=
 =?utf-8?B?OG9GYW4yT3dsY0EvQzJCUlVZc24xWlorU0JWby90bEVJTFAvelBHN09JaFFL?=
 =?utf-8?Q?DsXs=3D?=
X-Forefront-Antispam-Report:
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 12:44:01.7964
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c19bbe2-2564-4433-90b7-08de00e832d8
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource:
	DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1P195MB1972

Update USB over-current settings for phyBOARD-Polis and phyGATE-Tauri-L.

Signed-off-by: Teresa Remmet <t.remmet@phytec.de>
---
Teresa Remmet (2):
      arm64: dts: imx8mm-phyboard-polis-rdk: Add USB1 OC pin configuration
      arm64: dts: imx8mm-phygate-tauri-l: Update pad ctl for USB OC pin

 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-rdk.dts | 8 ++++++++
 arch/arm64/boot/dts/freescale/imx8mm-phygate-tauri-l.dts    | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)
---
base-commit: e5f0a698b34ed76002dc5cff3804a61c80233a7a
change-id: 20250930-wip-t-remmet-phytec-de-upstream-85274fadf1e1

Best regards,
-- 
Teresa Remmet <t.remmet@phytec.de>

