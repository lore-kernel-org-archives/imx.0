Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011071.outbound.protection.outlook.com [52.101.65.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5439A2F616A
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 07:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787297528; cv=fail; b=NeFP1XN/X0T/0YFrzb8Nw3nJzlVI9JysSqRLtd5hKEwP13o9QZtROIvxOoy2MT6a73B/ygaCsp4HM6nneEFJ1rQtox3U0BpLM0bM9Ykl/12QztSeyucCzMJQQpMI7XjAtRQtDwpm9a6EIPT+ED7XhIie7F/Z534NwKgUGHR0PgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787297528; c=relaxed/simple;
	bh=g/tspJdnIjaYPLnhYruDKhmk89UURmZxtfy22fiiEOA=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=iOtX6P9hZF+dIr1fPi6vqZbsYDiQMcC/xV48kVbD/fsxam05s2bIhnkPgOjg59OCruJwwudDWH++3v4750N9JtE9Sk+/XLML3brP/NB9YkdIUJ6L9z/W9iubmOFS8e3rgZMecoVVFXgYRrVC1CHTpqXr7V/jOcE5cRHGiA7zVOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=E1bCFve3; arc=fail smtp.client-ip=52.101.65.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="E1bCFve3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JIllkRyVIWpq8J23wlIkggQ1E6nC6eNkK/XN0p+EtSFMvFY4Tnr2uYDG2MA1txQqPOBoAQA2g8knXBwwb2N3ILyiUxDzmM0iqkuTaq+e5B0Yp6K/jnatu+MVGNIhMM6JRpYBKuXeYKZe+8z74UHWOuweTx02zXdSEcmZD/qDX5d/St56UFl7+AFHe8n5gL3IG+avyA8PGy/C1x/5voytfLCtzlJ/N/l5+TswWqQ7mHEmB4BKVefd73daWB0g77WT1kzOHN6Khf1ZCciP1WGlpdAqxFbiUicgd8No6Ed5NcO8tOtVJGU/f8p4qmi8PdI+lK5UJ826qNr+vX/ufuYfrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=UE+UytDi9fOzGhoi76FwKNT4CoIRY0dUm0r41Jorqm0ObyvEvtrD1xWCDqQQdrGFuuBmG1w4Onpp0/5YgPX0Q5AkET6fV1SPp7RJQ2YCDUdkgNJuVTYqi5o1k58kLpHRBKz2Qi6bgFbySmdKhfCSl0+8/WT3CA9gW+o3TsGSybaJZRlUYhjapw1r2f4h4ttxMm7TYBHwKiq89NGDhBj5gx5oF542dbKDOvXqYIuP1PlUjsLIBw5MVED2JJEYLg0PSuyxwb3tXSsqEms1h6lK5CNRzQHYj9Eeki7SFUdygLippwXvLiWLnmHc4DT8huz16n9iaCG/RsjetXe8gVJ4xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v0gFZIF2db8KJGG1tEkguhOHK5K/jZjmuXvyiKIoMp0=;
 b=E1bCFve3cx6y09Guw/HZFrw2mqzWpfTDeW/pAN5ybV7ZuDaH1j0TUygkrWAXH12UVqnHUPPUufTaVCQTkprGR0qetsscEy7gmQiimwGppU8dDsHPZqmMMoFK3EzyqFV8/nCUSLg7oxzpOTdo/Gm5kd/61x+JFAgMPg05INUk9aNhdaDDsryfi/65dzorhKjf44TrUzV6NdphvP/T28AmgqO/twpRzuW3b489KfcAl+Yz6OFJr1NCK7MBa9dWJa14gaGEy5MbhVe4mu/b1L1lh/ypjvP86Nq8zV2eXq0L+AK7LmGD8LLMxjcKGebte+e368H9F1bNcutejluzIVpHAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by PA4PR04MB9392.eurprd04.prod.outlook.com (2603:10a6:102:2ab::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Fri, 21 Aug
 2026 07:32:00 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0339.010; Fri, 21 Aug 2026
 07:32:00 +0000
From: pankaj.gupta@oss.nxp.com
Date: Fri, 21 Aug 2026 18:32:18 +0530
Subject: [PATCH v39 1/7] Documentation/firmware: add imx/se to
 other_interfaces
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-imx-se-if-v39-1-41e4257c2afc@nxp.com>
References: <20260821-imx-se-if-v39-0-41e4257c2afc@nxp.com>
In-Reply-To: <20260821-imx-se-if-v39-0-41e4257c2afc@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787317340; l=7403;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=ZSAmXRvPjYNeGEa/I9hefXFuALx9geFcXzYMsSoJmHQ=;
 b=1YN4hqtAx4CPu8s0gv4TiGOd2BT+HMrDB9iiKyWmUGsbVIVP1nP1ANlGqW7Jl5tSoQh93Lmy+
 JMb+U81D3nYCYL3at8waNleu/y7qtPOTa1r49HJOxvArzxTkfdsA84w
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI1PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::14) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|PA4PR04MB9392:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a7d8f6a-f2a6-4675-803c-08deff5649a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|1800799024|23010399003|376014|19092799006|921020|56012099006|6133799003|3023799007|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TAZa1tyODSOVPyV/CSaMdvWih33Dt0MjQrzKWSGUZureY7LXcAZvgpFleTOFeofYd338KvEzO7kplXW8X3jSL2UBgGbsAkv9YWoICPwubXG4OmSTGcdxPVYWXwQk+fZGRYaBUW0CPg1K1s1UdwW9QENiI8AgNLYc9CxWreE011JZYrhd7wJRFz82iSdCCXfcemvY0DZSoGLXJbVtoJkP87NiozvDmOfFEWLD8SLHcHzJ7p5ClauOH2vVsf4ILRz3m3HXdz/+GVgMN8CRtniMfHGGBHtHPO8iDJPrJ+I4/YOnsGe9jOQgBVHMqnFBf93hAoCDxtgkwR8KB+GEpeiFlfastVO0UhwZ3UGGZHUdV2xr1pAH583Jw4qbcYANdOue5Sqw9e2qkqEP8nqaEuOcpI1WPD/WBfTf6tItaxQnbbDWSt/mprlZovNyhCRCokof23fCu11GhH5ek0FhpnolUhbHQTcgz0Hw4qDOG0uJDrfQsrpEzd/yLwU7YXdBN4Iu0E0RC2ngNKc1BWHtzpX7+C3HdM+IbbBZpCJrYK7rHD+ytBzvwDt35IyM2yMB6k6BEcphPFXdqUBTYab1rUfBWd6xgZKaMDg7yNZj01tIgMyC3xzwnse5LX6Hs3zK7KOFc1bRPXjpJKlHH+8ZQu0D3w75gzssYZDuqctmbwRnWXbpLPzcEwjg6m0mBg1wrw8SJgb5in5HQu54kzSDmO1OZg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(23010399003)(376014)(19092799006)(921020)(56012099006)(6133799003)(3023799007)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZFc0L1A5N1Juc1RrcFlySStDRVRoSHhocndYeEN2ZElQbjRKUnU1Q0RDd21m?=
 =?utf-8?B?QUFSdlVzSEtUZlU1Wkt0OUdmZHVmVmtXQmQxNmI4KzhNM29SaGp1Zy9rajhF?=
 =?utf-8?B?cVErc3JHNy9xbFFzZnpPeHU1WSt3bUdNYy9OZGFkT1pacVNWTnNab2Z5am1v?=
 =?utf-8?B?K2JnQ09ZeW93T1Bjc3Y2N0tPUW1Tc3JNUjM2eUJqeVhYRjJmQitqaUZhdldY?=
 =?utf-8?B?bW9NNis2MGpWNXYvbUdablJERitXVHR2bmdneStybjY3MFNwK3FYZTM5NXht?=
 =?utf-8?B?VmFnTU8xYWlKbHozcFloOEFCcXZTMjFzRUJxYktZSlhXVTlDMlB2ajJ4ZFBR?=
 =?utf-8?B?TXZQVFV1NElyL3hPQkxBYks0a2tkUG5NVjhDYTBHdnhoMFRTWnVzVnJXSWdi?=
 =?utf-8?B?NlJuTlpIZFNoOTFwM2h1WThqYnlzU3QrK2xDVCtwaVdHRnB4OUNOYThsSUJE?=
 =?utf-8?B?Z1ZnTGQvc1lhcGNXVktYZHNPTkdESldXQmd1c3FTSjZJVHVHSWxNNFRYZ2VJ?=
 =?utf-8?B?bzhaeklzUk5vWnN4Z2JjR0F3MkNKWk5ubjFtVXRWejNmM0FxMjh5bTJ0eFBh?=
 =?utf-8?B?RHFZSXRqWTAyaDMvZVA3WHpTVjNpb2xtODJac2ZYT05ibmp6c2RncUFtQTJq?=
 =?utf-8?B?eGRycHRVSktpZDdteThONkZXY3ROaHZ2azY1ZTlmVDhLc3NUNzVrMml2ZDAz?=
 =?utf-8?B?aU9BYUhzR1dzc3kySjVHTHNrS3VFRG1GcTVPengvdUZ4alhRUEllODBadGI0?=
 =?utf-8?B?am9IdC9qWGZaaXlUTEZOK3RzU1ZUTzhsYXdlWmZQSTBiblQxNm1JUEhiSXFE?=
 =?utf-8?B?R3BXTU9EL3U3elRCSCtvbnJyTVFnK0psMEtYb2k4SjBiWnpqaVcwYlF4MVVV?=
 =?utf-8?B?OHdCeTdyTkU5ZUcxcmVZYUNqNlpqRndUcTBLWW5QcW1oakZ5QVh4cy85WDhZ?=
 =?utf-8?B?Y0x4elhrWnhSS3VDUVk1VnhpOEkxUE9ieVRCTW1Na0QycVpLd1A3UGZXNFFl?=
 =?utf-8?B?Q0Vmc0Z2OURuU2xJMWhrUmhvcXBLb0hGNkZnenZyYnpWNk9tb1V5cTVoaEk5?=
 =?utf-8?B?OFRrYlV1S0pKS2VBbnR2L1VHeFlEKzBJUDV6dGt4eFdJUllIYlhzQ0k4M0FD?=
 =?utf-8?B?MEh0NFhTdncvMUNYSm1oVjNoUHhZdzllbHR1cHRtdVFLaFdxdkhya2xyM2RK?=
 =?utf-8?B?dzdMd28yTG5VZXdrZnZUbXpHNXFxd000VTN6RVNWRDNaaW9Md29YRVl6Tnh0?=
 =?utf-8?B?ejZOYjg4TmRhVDEwSW4vcTJUc2RteFhmOEdZOThreXVYQUUvdDRrcWMzbVhM?=
 =?utf-8?B?V1BIaFJsVzZjazZxSGVyUVllczlmZ2NXNE54N1RKSTN0QnNJSkdQM1ZzK0Ux?=
 =?utf-8?B?cnp0SnRFN0JYanZJRTFxRDQzQzlReitTaDFEVlUyYzNZdVNsWWdBMXZtOFFz?=
 =?utf-8?B?NkFjd1c3Z1Z5ZG1HZ010V3JhdzMraEtxMTdnZCtGUVN2eFNuaXN4dERUL1VD?=
 =?utf-8?B?Vi9WM2U4eVVIREVrTDlsMGFpOEhWKzl0ZC9wbWlpQVA5QWZQVHQzWG12T2dX?=
 =?utf-8?B?SEgyVGtUVCt6eHQyYnhTNklTTTgweW42VkRTZFU2QlRlQVhFUzZWU0UxNTky?=
 =?utf-8?B?RG13UzhmdjFDcm9RR0Jhcjc4aU16V3V6aHNEZm9KL2d0WXVUWFlZZ3NvLzNu?=
 =?utf-8?B?NGt3bm5Ea01QamlzVnpIREFDY0FMeGFweDNSTlFTTWREQWorMEFNUklBQldY?=
 =?utf-8?B?emVWaitZZitBSDg1ZHQrVGtKRktpM3ZnQ3JBaHUyY2xJUXZqOU96cmxyZUMr?=
 =?utf-8?B?LzhMMHcvamV1dnpEQTFtWXBRRll1Z1piMFZLUCtXOS9VNHBoYk9uM0o4TG85?=
 =?utf-8?B?aHQ5QUpQVy9TYW1kb2VyZXhGbUFPTU9xQmMvSkswMm9zMVQ4R3ZaMmd3blhv?=
 =?utf-8?B?WGV2cUQvYjlFczRSR29DbklMS29RZ1lWd211UGo1eTUwNE9TUTFhbE92ZHVM?=
 =?utf-8?B?cjZUYkpEMnl0WFZLczg4Qk5IQUxSZHg0QlVXTmY2bklObEg4YjZCSTM3L3dY?=
 =?utf-8?B?c1FzR3lZWUc1RC8rbm0xU2hMV0FQVFVFbWJ2UjY4ME0vNHBiNEJmT0RQbWRZ?=
 =?utf-8?B?Y0ZVVlZYWmpFbUkxT05KTEZjMWhyaXE0Rnl1SjZGVUhBUi9oaXZmTEVyckJ2?=
 =?utf-8?B?RCtoaXhiUFp2K0Eva0h0dXVsS1p1c3dJWCtPMi9HcDFzcERmVmRlOUhKb3NC?=
 =?utf-8?B?VWxhejcwT2d1N1lnVkY2N205S3FVREZiaDczOS83M1NaSXZrdmd6YmVQQ0ZH?=
 =?utf-8?B?Y1cwNDNTanNackQvK0ROaEc0bWgyaHR1VVhScGJVWExhWWJuRmtuc3pLWFRq?=
 =?utf-8?Q?CL2Ha15L9Of5yxW7LVgUlxsddTNiBjESxlJkg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a7d8f6a-f2a6-4675-803c-08deff5649a4
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 07:32:00.6677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SHTr/2gHhha6vlkuLxkwa6E0MD2F94fMnhdQJNHkE5u7MHunHE+ZJZRp5+NJet2EFHaeY5hYjqkIysMgcNhGqA1Iy1jRDQUzd84ifoKWiDJIbfDSKhdZtr2zaqgAmn4Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9392

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Documents i.MX SoC's Service layer and C_DEV driver for selected SoC(s)
that contains the NXP hardware IP(s) for Secure Enclaves(se) like:
- NXP EdgeLock Enclave on i.MX93 & i.MX8ULP

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../driver-api/firmware/other_interfaces.rst       | 133 +++++++++++++++++++++
 1 file changed, 133 insertions(+)

diff --git a/Documentation/driver-api/firmware/other_interfaces.rst b/Documentation/driver-api/firmware/other_interfaces.rst
index 06ac89adaafb..6c6fa9a0ba1d 100644
--- a/Documentation/driver-api/firmware/other_interfaces.rst
+++ b/Documentation/driver-api/firmware/other_interfaces.rst
@@ -49,3 +49,136 @@ of the requests on to a secure monitor (EL3).
 
 .. kernel-doc:: drivers/firmware/stratix10-svc.c
    :export:
+
+NXP Secure Enclave Firmware Interface
+=====================================
+
+Introduction
+------------
+The NXP's i.MX HW IP like EdgeLock Enclave, V2X etc., creates an embedded secure
+enclave within the SoC boundary to enable features like:
+
+- Hardware Security Module (HSM)
+- Security Hardware Extension (SHE)
+- Vehicular to Anything (V2X)
+
+Each of the above features is enabled through dedicated NXP H/W IP on the SoC.
+On a single SoC, multiple hardware IP (or can say more than one secure enclave)
+can exist.
+
+NXP SoCs enabled with the such secure enclaves(SEs) IPs are:
+i.MX93, i.MX8ULP
+
+To communicate with one or more co-existing SE(s) on SoC, there is/are dedicated
+messaging units(MU) per SE. Each co-existing SE can have one or multiple exclusive
+MUs, dedicated to itself. None of the MU is shared between two SEs. Communication
+of the MU is realized using the mailbox driver. Each secure enclave can cater to
+multiple clients by virtue of these exclusive MUs. Also, they can distinguish
+transactions originating from these clients based on the MU used and core security
+state. The communication between the clients and secure enclaves is in the form of
+a command/response mechanism. Each client could expose a specific set of secure enclave
+features to the higher layers, based on the commands supported by that client. For
+example, the secure enclave could simultaneously support an OPTEE TA and Linux
+middleware as clients. Each of these clients can expose a specific set of secure
+enclave features based on the command set supported by them.
+
+NXP Secure Enclave(SE) Interface
+--------------------------------
+MU(s) is/are not shared between SE(s). But for an SoC like i.MX95 which has
+multiple SE(s) like HSM, V2X-HSM, V2X-SHE, all the SE(s) and their interfaces 'se-if'
+that is/are dedicated to a particular SE will be enumerated and provisioned using the
+single compatible node("fsl,imx95-se").
+
+Each 'se-if' comprises two layers:
+
+- (C_DEV Layer) User-Space software-access interface.
+- (Service Layer) OS-level software-access interface.
+
+::
+
+   +--------------------------------------------+
+   |            Character Device(C_DEV)         |
+   |                                            |
+   |   +---------+ +---------+     +---------+  |
+   |   | misc #1 | | misc #2 | ... | misc #n |  |
+   |   |  dev    | |  dev    |     | dev     |  |
+   |   +---------+ +---------+     +---------+  |
+   |        +-------------------------+         |
+   |        | Misc. Dev Synchr. Logic |         |
+   |        +-------------------------+         |
+   |                                            |
+   +--------------------------------------------+
+
+   +--------------------------------------------+
+   |               Service Layer                |
+   |                                            |
+   |      +-----------------------------+       |
+   |      | Message Serialization Logic |       |
+   |      +-----------------------------+       |
+   |          +---------------+                 |
+   |          |  imx-mailbox  |                 |
+   |          |   mailbox.c   |                 |
+   |          +---------------+                 |
+   |                                            |
+   +--------------------------------------------+
+
+- service layer:
+  This layer is responsible for ensuring the communication protocol that is defined
+  for communication with firmware.
+
+  FW Communication protocol ensures two things:
+
+  - Serializing the messages to be sent over an MU.
+  - FW can handle one command message at a time.
+
+- c_dev:
+  This layer offers character device contexts, created as '/dev/<se>_mux_chx'.
+  Using these multiple device contexts that are multiplexed over a single MU,
+  userspace application(s) can call fops like write/read to send the command message,
+  and read back the command response message to/from Firmware.
+  fops like read & write use the above defined service layer API(s) to communicate with
+  Firmware.
+
+  Misc-device(/dev/<se>_mux_chn) synchronization protocol::
+
+                                Non-Secure               +   Secure
+                                                         |
+                                                         |
+                +-----------+      +-------------+       |
+                | se_ctrl.c +<---->+imx-mailbox.c|       |
+                |           |      |  mailbox.c  +<-->+------+    +------+
+                +-----+-----+      +-------------+    | MU X +<-->+ ELE |
+                      |                               +------+    +------+
+                      +----------------+                 |
+                      |                |                 |
+                      v                v                 |
+                  logical           logical              |
+                  receiver          waiter               |
+                     +                 +                 |
+                     |                 |                 |
+                     |                 |                 |
+                     |            +----+------+          |
+                     |            |           |          |
+                     |            |           |          |
+              device_ctx     device_ctx     device_ctx   |
+                                                         |
+                User 0        User 1       User Y        |
+                +------+      +------+     +------+      |
+                |misc.c|      |misc.c|     |misc.c|      |
+   kernel space +------+      +------+     +------+      |
+                                                         |
+   +---------------------------------------------------- |
+                    |             |           |          |
+   userspace   /dev/ele_muXch0    |           |          |
+                          /dev/ele_muXch1     |          |
+                                        /dev/ele_muXchY  |
+                                                         |
+
+When a user sends a command to the firmware, it registers its device_ctx
+as waiter of a response from firmware.
+
+Enclave's Firmware owns the storage management over a Linux filesystem.
+For this c_dev provisions a dedicated slave device called "receiver".
+
+.. kernel-doc:: drivers/firmware/imx/se_ctrl.c
+   :export:

-- 
2.43.0

