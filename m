Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013025.outbound.protection.outlook.com [52.101.83.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7613EFD21
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 09:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562217; cv=fail; b=NCrmsyf4rvjKCxbYXAus2ftLbHVzq/XKXUPP44odbaWFcYTvyAMM1Xw+PhJ1lgiljNfHbnFM2eA5g0YJJn73276PhkTNVedsZ17fGScWu4jimBQ2oAb8fveDhdVnigA3cDwmXGQLo5TGHDlCoEJZeGu6UtM3iS34rMrdTZ++fW4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562217; c=relaxed/simple;
	bh=WfluPOdaobNyASzLifvc+gACHqb7NRrJYF/o/2HOF2s=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=fqnR/hy2c2DDwGPlVdJveImTyFeAdrxInxw6q9mLUBJeurII1/y86m8hnjUKAk06n8j4TcLqvpodqXTwg5lCFY2cT7+DBAo9BAMXzG/lB1usSqfUxaya/C6CeiBknAOYRnImImEV6eaFS0o5CALeD7oiJ8FeO7wlo8nli8/SKuw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=OT9fVWkD; arc=fail smtp.client-ip=52.101.83.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="OT9fVWkD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DYLrWqV+J9EuOJq35Wuwj+bCplui0fMO0Vd2/2OZFF5zwvCgU9mvcJcOCmQF5BzfNVwhRpN5YxYwwT/+WJdJWvCElP/v2dEE2g1b9ysUPQ90qWZczOG4RiAfFipXLmPtTWPDbOQqDSbWWOUe4LlnBJUmi06RpayKa7yUMAke3iPn0orM2IMdvemMXWIcG/2N1OfdgAknliR/S0ne3Z13ZQYNzclW51f8dDn/NHQNyKoJth3lhLdZNAcMuHYgrHRI0v6gesctNakJCB+hjCVrCZNZ/HxkTVsv+xFtPJv2pa+dvrVi+BDWlGyFzceb/+pH3iz0N/NK21944oNIby6/Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLhtH2MKlJ+P6ZQRYHm9oYT8VfHbCh78GpX3+Mh8jdw=;
 b=ywvdb4ogywWvZc1I/UxuiwqgZ3UYQT5u1jW1L8rSpvEe87YWKibwL1POpiuJFy19hD8yg7BHnPfYP7E49/sq8Y3RjxU9j4vLa2is8A/qVZkl1U0H3MEF7VDZprJIQBP15gT04xLT9hjcreJK17AHMMrE8jhipusB42bDDufJSL2G/iZJf7MH9nqbwcfQ3DHcuTkmuFnUFJ/eTy3ax8okCYfPbEqJY/lPnJns1fTsuK1ebOTS8bdLY8XBYpQgPxZQK/fU2/My+TT++JRNkjlue8y6yqFwZnt1/419EWORTpQEQJSUblHYfjjH53MIP9+z6JpUvI/e/z4nY/COn54aCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLhtH2MKlJ+P6ZQRYHm9oYT8VfHbCh78GpX3+Mh8jdw=;
 b=OT9fVWkD3tRxyAP49Bnwni8T+YLOtk9Lwj1TYgnoH6sAFDN7kEqWDKGTSSbxmJIxbydYg1W4/afBNcy38aSykHVW1i4f0vU1lh40bTydrRChT35rkygxm7qp51sTRTaBxKzkNEBF+OvRHz4GuXgq26g9Ol2AHwMbL1brYoEnI/Gx9xpUWTep//SnV0jdA5WgSKLsOmAp0HNJKGwA5v6naKhKB90rg1S65C1D9qa80uDXzqRQy6Bfg6Nk3W6UuW1OzxcqiCiqDFUnz3B1lds5aIu4ddxBFBt4LkBTAUZcEMXBn+lEFqa2lgFZ3PDyO6Kcx11OI0F3ozThi8nmiMuGDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by GV1PR04MB10478.eurprd04.prod.outlook.com (2603:10a6:150:1d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Mon, 24 Aug
 2026 09:03:31 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0339.012; Mon, 24 Aug 2026
 09:03:31 +0000
From: pankaj.gupta@oss.nxp.com
Date: Mon, 24 Aug 2026 20:03:29 +0530
Subject: [PATCH v41 4/7] firmware: imx: device context dedicated to priv
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-imx-se-if-v41-4-29cf129e4d86@nxp.com>
References: <20260824-imx-se-if-v41-0-29cf129e4d86@nxp.com>
In-Reply-To: <20260824-imx-se-if-v41-0-29cf129e4d86@nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787582007; l=16271;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=xDwhD3tcIPNYf8iNMMrFGI2yIbBMriZW5qWh3i2lBJM=;
 b=iAl3FUdXp60znRxGAivItupqrHdvUOK3kbCEeFQaFSHgwauUQOub1jr6knUVQBx4JYwtmkrfH
 bKM2UgA+CLdDbJB9woC6p0OMQHb6sNnm8ZQIVWHr51tCXNNeiGNdGLV
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: SI2P153CA0014.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::6)
 To AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|GV1PR04MB10478:EE_
X-MS-Office365-Filtering-Correlation-Id: 4065615e-25ce-41ae-9a31-08df01be91a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|366016|23010399003|11063799006|56012099006|10067099003|6133799003|921020|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Zxsr+cKZHg+Pb7brMPBbCmJy5lTilWPYaqZez1C/jEd1W+Jkb4H0bgTJm9UQRXdQco+JEV6FEvjDRKrCHqNtku3ZycP/nHBIZq3arN0VVLZ9Yda05jcyyIJOC5bWn+0n/diRIn3MagXbsfPS4EZlMZrMwrF2af8LPs53fH36M8etl6FcFuLSp895YLY8W9bcgyKdPibC0laFRIu4FNISz3jHOeov3i/tUAbEl4fykrWdbBiXAAjT0TrAgwVU8gvhyEH39tPmwuQr3Oh46mzZfZlS8rVkrmiBBsPL38bCIQ6JtfULJ6WAYPaO5isWTnefglZOIMUGZGtUTcC/7Uwwx13mCXMlJ2EQiglPjG24QVQ+Q579qO/uq6sN6UDwaNi4SEe2iHTuMbpLfVPA3skKoiciYtF3AT8Kxrn2kY6bbwx0hhxHMsP30eyCR38VCLUS2//ZGkUH6Buv89oIozliphu29BYqgEuEPMXk38cv4VTdJhVcUCbVROroHdu8DN8lCvTnoW+gTUzS9o2gVM6XumSK6Ic8VSPhM5E3pUkCTXbyPZm9pPOTZkpmwMUrL0wLv0SqOTc1AETeB86rC2YMhQJj8UcNuTchykOTyFzKkAQA7irz3NzcheOQTZnbwyr32h0nsWfYi0bXCAPXCUmzQx2uUqdLpBkUr37lrNmziYfqVW8EXUp8yFe3HwmyjQIS8WuQR3usUUVtAozqEfq6aw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(366016)(23010399003)(11063799006)(56012099006)(10067099003)(6133799003)(921020)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VmxiQXpDaWk4b3BPd2hQQU9iZEl2QmFGSGFJdGtJK2oxc05vMTdBNGIrVTlk?=
 =?utf-8?B?YmdoQVdoUUlrSnFpSFpBSHlxMUJnNWtaL2ZndEpYOFBOWWpJNTJZbmZJMUln?=
 =?utf-8?B?TjJLbXdCY0FpVHgydGkwUXhqTEtteWM2WVkvejZCOEJvekE4UDdiSWJyaGwx?=
 =?utf-8?B?TnJjcjVJc0pvOE5Bbk1ZblN0U3lYSXN4NnpHL3d5NnpleElpOXNHZnh4QWpC?=
 =?utf-8?B?RWlFRFlQRTlxTmlOUkQ2YUdLUnE4Y2R5bC9pMzgvRVhzWGRmYjZ4YiszYzN1?=
 =?utf-8?B?YW9zNlNoNnN5WU5DYmdyZXIxREZPZktiaUdpcng5bVVleG5mWmFJRXlNWkR2?=
 =?utf-8?B?ME5SWjFvMlMzRVIyU2Fpa29UR1p0ZmNGdUZSdGh1dmVGbURQYXUzaFFERksy?=
 =?utf-8?B?UGN4M1AvRFYyZjg4SkFlL0R0V0syVDFPTGlrOG9tZFZQYzArTlM4Z0QxWGhi?=
 =?utf-8?B?VDREblVpcEJJQ3dRSSsxV2RwMjFHR0pQRTI2UnRJTXNIMUJKLzd2aXBFVllr?=
 =?utf-8?B?Mnc2OElnbWlHSm9CNElFdUxEY1Z0emE2b0dEdU9SR21NYXBCVUordGpEWFZu?=
 =?utf-8?B?MWgveVJsVHhaWWtsNjhXNzFmNE04di90aTVnRmN2aVlrTzYxdTNHV1QzcGxt?=
 =?utf-8?B?RVBzYVVmWmNqdmIreVBvR29FSWlBWUdTSUZlb2FUc2xDYjB5NXhBRFVNWk1Q?=
 =?utf-8?B?SFZiWGhKdERlVmV0RGh5QkNoVEc3dXlGSmluOGJzS1J4UjAvdDBOWE5lNExo?=
 =?utf-8?B?SlhWM2xJcGJVTVB1bFNmUUdBMndvWlZ6Tk4zTUFXZ2Z3WXJzdjJpUmg3Rnl6?=
 =?utf-8?B?L3NpUFMzK0lXTjgxdUFOMnpVTUJyZmI4SFNCUFJET05JbTY0Vko0UUllc1pY?=
 =?utf-8?B?MzlwdGpBTEUxd2YvWXQ3VS81TXVJOUYrMzRUK0VydWhXK3Y3Z0RDMlMvQm5U?=
 =?utf-8?B?azV2UGtOdWxkZlFERzZMSXU1Qml1Rjc5NEJZajlvdXlQMURudVZkMTlncEls?=
 =?utf-8?B?K2k5QkFWOEJtazdTZGJET0poZkx6UjlVRHBwM2xuSlpKcjdyYlErajAvMUcw?=
 =?utf-8?B?U2lRZHM5bU9ZdW94MzVGRHlrN2E1S2xjRnVaRHU3RHlJaCs2aXV3QjBLWjBl?=
 =?utf-8?B?K0RadDFRenQ4K2hlSi81T0d1eHNMU0MxaTJZNWkxcGcwYWsra25KMUlrVEZ5?=
 =?utf-8?B?VjllQmpwV1pOWEFVbWY5VENtaTJaLzQzbjcxc2l4b3hYMmJTVzVkTUU1WHJo?=
 =?utf-8?B?RjAvemw0WWJTVHJPZ1JHdVlTdlFsTzN5aThqdnlqd1ZxdFgya3BseFNTUUo3?=
 =?utf-8?B?bk9rSnN4TWNOZXdjMHNOOEdWVVdBdFd2MkFSYXRQQWdheXFSU0R1a3luS1d5?=
 =?utf-8?B?YjdRNHZFVStiUFRLb3M3Ri9XcXZIbEZoRnlMOGd4TVpEYXpLS3dJS2xVVnM4?=
 =?utf-8?B?MlJmY0NPTDc2SDNLcjk1NVk0eWo0ejQ0MWJURnhhU2xTYTRrTzRhL2hGV3lu?=
 =?utf-8?B?QmdYN3puL203c2ZRazBpNk1oQTlab1FxWlBJVzdlcmk2R0h5ZzkwMWlhZ0JR?=
 =?utf-8?B?UUphQmxtakdHb09SWDdsYXFJTDhnaGRIWExlMlRqcVMyQnhWcnNtU2s3VXFY?=
 =?utf-8?B?MEh1S3AvRk9Db0szb2lkM2hPdTNxUmpJUVNyclNwT1VoRnRnbDJZdnY3UEhN?=
 =?utf-8?B?dVZuQUdHOUZ1WlpyZGlGQ00xUGpLTlN4QkpqOTlENCtBTmxpMU84cGlVMkUx?=
 =?utf-8?B?V1R2d1BDalVxMHlkM0VPUHhGVGpEZml2UUptUTVpV010UWNObkhTUmV6T2V0?=
 =?utf-8?B?aXVEKzFsWFpGa21lSWdEeElaODk4OUFFOXhXdUt5Q2VXRXVidnYvVTQya2N1?=
 =?utf-8?B?eEZlaU5ITW1QRlhsUnFJUGxwLy9oamdKNXJLOXRrV2J4QU4rb2RINjc2NERD?=
 =?utf-8?B?aUI1bHVlUTlCbUZFUDZzY3MvcDZHV2w3YWZCQkxLaytSdmhLUmRoK0l4WUlG?=
 =?utf-8?B?akpEeUtVVnVqU1c4ZHBLSzN0eFc1RDlXYjEvMVB6TWVwSUVJS3JUdXdPeXdM?=
 =?utf-8?B?eUl5aWFYVVdPdnA2QTlpdko2WkZvTlc4d0RaOTRqZzIzVkVtT1o5VWcxNURN?=
 =?utf-8?B?NHBHcUROdWxKYWl4QlhKc25MYUFla3NkeVZUOUZGdUt2NEhJUlhQMVZqdTZC?=
 =?utf-8?B?eksrZEg1MW15TUJjL05ER1cxcy9UdXZidDFhTWZTRWIyVjJueXdVQkttM3BY?=
 =?utf-8?B?bFl3S3Zwa2JPR0MvblJTaWtNL2k2bm5DZXZXV0I3R3luVjNhR0Zxc1YyY2hm?=
 =?utf-8?B?QjBLdTdac0NXYWJOUXlkMjFYQTFlS2UwenZ5R3ZCcms4RUJvR3pzb0Y2ZEd1?=
 =?utf-8?Q?E7TzZAKW1B/kBkRLt4PFu3dUwx4cMWLI1m9bM?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4065615e-25ce-41ae-9a31-08df01be91a2
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2026 09:03:31.0675
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R9zRZaZabQR5EFL4XgjxDJWi+8jjlYcynn8tnizvoDiHNbijy+eQnPhGddt5ZESl4Z/bfVxnEtRaK2I0dCYN2SkCLehAGY3Ije2be9PKxjk+qUtf0ULtVGXXIzwvpK1d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10478

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Add priv_dev_ctx to prepare enabling misc-device context based send-receive
path, to communicate with FW.

No functionality change.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Changes from v40 to v41

- init_misc_device_context(): drop the pointless err_str local variable
  and the redundant 'int ret = -ENOMEM' initialiser; return -ENOMEM
  directly in both OOM paths.  No message is printed for -ENOMEM as the
  MM subsystem already does that.

- se_if_probe(): drop the redundant error-code argument (%x) from the
  dev_err_probe() format string for the init_misc_device_context()
  failure path; dev_err_probe() already logs the error code.

- Add the mandatory trailing newline to every dev_err_probe() format
  string in se_ctrl.c that was missing one (seven call sites across
  get_se_soc_info(), se_if_request_channel(), and se_if_probe()).

- ele_msg_send(): add missing trailing newline to both dev_err()
  format strings.
---
 drivers/firmware/imx/ele_base_msg.c | 15 +++++----
 drivers/firmware/imx/ele_common.c   | 66 +++++++++++++++++++++++--------------
 drivers/firmware/imx/ele_common.h   |  8 ++---
 drivers/firmware/imx/se_ctrl.c      | 33 +++++++++++++++++++
 drivers/firmware/imx/se_ctrl.h      |  9 +++++
 5 files changed, 95 insertions(+), 36 deletions(-)

diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
index a9a0fc16a553..d63dc4fbd4c8 100644
--- a/drivers/firmware/imx/ele_base_msg.c
+++ b/drivers/firmware/imx/ele_base_msg.c
@@ -82,8 +82,9 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
 	tx_msg->data[0] = upper_32_bits(get_info_addr);
 	tx_msg->data[1] = lower_32_bits(get_info_addr);
 	tx_msg->data[2] = sizeof(*s_info);
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_GET_INFO_REQ_MSG_SZ, rx_msg,
-			       ELE_GET_INFO_RSP_MSG_SZ);
+
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_GET_INFO_REQ_MSG_SZ,
+			       rx_msg, ELE_GET_INFO_RSP_MSG_SZ);
 	if (ret < 0) {
 		ele_get_info_cleanup(priv, get_info_data, get_info_addr, get_info_len);
 		return ret;
@@ -143,8 +144,8 @@ int ele_ping(struct se_if_priv *priv)
 	se_fill_cmd_msg_hdr(priv, (struct se_msg_hdr *)&tx_msg->header,
 			    ELE_PING_REQ, ELE_PING_REQ_SZ, true);
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_PING_REQ_SZ, rx_msg,
-			       ELE_PING_RSP_SZ);
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_PING_REQ_SZ,
+			       rx_msg, ELE_PING_RSP_SZ);
 	if (ret < 0)
 		return ret;
 
@@ -201,7 +202,7 @@ int ele_service_swap(struct se_if_priv *priv,
 	if (ret)
 		return -EINVAL;
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_SERVICE_SWAP_REQ_MSG_SZ,
 			       rx_msg, ELE_SERVICE_SWAP_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -257,7 +258,7 @@ int ele_fw_authenticate(struct se_if_priv *priv, dma_addr_t contnr_addr,
 	tx_msg->data[1] = 0;
 	tx_msg->data[2] = lower_32_bits(img_addr);
 
-	ret = ele_msg_send_rcv(priv, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
+	ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_FW_AUTH_REQ_SZ, rx_msg,
 			       ELE_FW_AUTH_RSP_MSG_SZ);
 	if (ret < 0)
 		return ret;
@@ -305,7 +306,7 @@ int ele_debug_dump(struct se_if_priv *priv)
 	do {
 		memset(rx_msg, 0x0, ELE_DEBUG_DUMP_RSP_SZ);
 
-		ret = ele_msg_send_rcv(priv, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
+		ret = ele_msg_send_rcv(priv->priv_dev_ctx, tx_msg, ELE_DEBUG_DUMP_REQ_SZ,
 				       rx_msg, ELE_DEBUG_DUMP_RSP_SZ);
 		if (ret < 0)
 			return ret;
diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
index 74cdac45231c..f7a6df5ea582 100644
--- a/drivers/firmware/imx/ele_common.c
+++ b/drivers/firmware/imx/ele_common.c
@@ -47,7 +47,7 @@ int se_update_msg_chksum(u32 *msg, u32 msg_len)
 
 /**
  * ele_msg_rcv() - wait for a response from the secure enclave.
- * @priv: pointer to the SE interface private data.
+ * @dev_ctx: pointer to the SE dev context data.
  * @se_clbk_hdl: callback handle whose completion will be signaled when the
  *               response arrives.
  *
@@ -60,8 +60,9 @@ int se_update_msg_chksum(u32 *msg, u32 msg_len)
  * Return: number of bytes received on success, negative errno on error
  * (e.g. -ETIMEDOUT, -ERESTARTSYS).
  */
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl)
 {
+	struct se_if_priv *priv = dev_ctx->priv;
 	bool is_rsp_wait_with_timeout = false;
 	bool wait_uninterruptible = false;
 	unsigned long remaining_jiffies;
@@ -150,7 +151,7 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
 
 /**
  * ele_msg_send() - send a message to the secure enclave over the mailbox.
- * @priv: pointer to the SE interface private data.
+ * @dev_ctx: pointer to the SE device context.
  * @tx_msg: buffer containing the message to send.
  * @tx_msg_sz: size of @tx_msg in bytes; must match the size field in the
  *             message header.
@@ -161,7 +162,7 @@ int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
  *
  * Return: @tx_msg_sz on success, negative errno on error.
  */
-int ele_msg_send(struct se_if_priv *priv,
+int ele_msg_send(struct se_if_device_ctx *dev_ctx,
 		 void *tx_msg,
 		 int tx_msg_sz)
 {
@@ -173,9 +174,9 @@ int ele_msg_send(struct se_if_priv *priv,
 	 * carried in the message.
 	 */
 	if (header->size << 2 != tx_msg_sz) {
-		dev_err(priv->dev,
-			"User buf hdr: 0x%x, sz mismatched with input-sz (%d != %d).\n",
-			*(u32 *)header, header->size << 2, tx_msg_sz);
+		dev_err(dev_ctx->priv->dev,
+			"%s: User buf hdr: 0x%x, sz mismatched with input-sz (%d != %d).\n",
+			dev_ctx->devname, *(u32 *)header, header->size << 2, tx_msg_sz);
 		return -EINVAL;
 	}
 
@@ -185,9 +186,10 @@ int ele_msg_send(struct se_if_priv *priv,
 	 * caller-provided tx_msg pointer after mbox_send_message() returns, so
 	 * the caller-owned buffer may be released after a successful send.
 	 */
-	err = mbox_send_message(priv->tx_chan, tx_msg);
+	err = mbox_send_message(dev_ctx->priv->tx_chan, tx_msg);
 	if (err < 0) {
-		dev_err(priv->dev, "Error: mbox_send_message failure.\n");
+		dev_err(dev_ctx->priv->dev,
+			"%s: Error: mbox_send_message failure.\n", dev_ctx->devname);
 		return err;
 	}
 
@@ -199,6 +201,7 @@ static void ele_msg_send_rcv_cleanup(struct se_if_priv *priv)
 	unsigned long flags;
 
 	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
+	priv->waiting_rsp_clbk_hdl.dev_ctx = NULL;
 	priv->waiting_rsp_clbk_hdl.rx_msg = NULL;
 	priv->waiting_rsp_clbk_hdl.rx_msg_sz = 0;
 	spin_unlock_irqrestore(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
@@ -206,7 +209,7 @@ static void ele_msg_send_rcv_cleanup(struct se_if_priv *priv)
 
 /**
  * ele_msg_send_rcv() - send a command and wait for the response.
- * @priv: pointer to the SE interface private data.
+ * @dev_ctx: pointer to the dev_ctx data.
  * @tx_msg: buffer containing the command message to send.
  * @tx_msg_sz: size of @tx_msg in bytes.
  * @rx_msg: caller-provided buffer to receive the response into.
@@ -219,32 +222,34 @@ static void ele_msg_send_rcv_cleanup(struct se_if_priv *priv)
  *
  * Return: number of bytes received on success, negative errno on error.
  */
-int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
-		     void *rx_msg, int exp_rx_msg_sz)
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
+		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz)
 {
+	struct se_if_priv *priv = dev_ctx->priv;
 	unsigned long flags;
 	int err;
 
 	guard(mutex)(&priv->se_if_cmd_lock);
 
 	if (atomic_read(&priv->fw_busy)) {
-		dev_dbg(priv->dev, "ELE became unresponsive.\n");
+		dev_dbg(priv->dev, "%s: ELE became unresponsive.\n", dev_ctx->devname);
 		return -EBUSY;
 	}
 	reinit_completion(&priv->waiting_rsp_clbk_hdl.done);
 	/* Publish rx_msg/rx_msg_sz under the lock read by se_if_rx_callback(). */
 	spin_lock_irqsave(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
+	priv->waiting_rsp_clbk_hdl.dev_ctx = dev_ctx;
 	priv->waiting_rsp_clbk_hdl.rx_msg_sz = exp_rx_msg_sz;
 	priv->waiting_rsp_clbk_hdl.rx_msg = rx_msg;
 	spin_unlock_irqrestore(&priv->waiting_rsp_clbk_hdl.clbk_rx_lock, flags);
 
-	err = ele_msg_send(priv, tx_msg, tx_msg_sz);
+	err = ele_msg_send(dev_ctx, tx_msg, tx_msg_sz);
 	if (err < 0) {
 		ele_msg_send_rcv_cleanup(priv);
 		return err;
 	}
 
-	err = ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
+	err = ele_msg_rcv(dev_ctx, &priv->waiting_rsp_clbk_hdl);
 
 	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
 		/*
@@ -255,7 +260,8 @@ int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
 		if (err > 0)
 			err = -ERESTARTSYS;
 		priv->waiting_rsp_clbk_hdl.signal_rcvd = false;
-		dev_dbg(priv->dev, "Err[0x%x]:Interrupted by signal.\n", err);
+		dev_dbg(priv->dev, "%s: Err[0x%x]:Interrupted by signal.\n",
+			dev_ctx->devname, err);
 	}
 
 	ele_msg_send_rcv_cleanup(priv);
@@ -290,6 +296,11 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 {
 	struct se_clbk_handle *se_clbk_hdl;
 	struct device *dev = mbox_cl->dev;
+	/*
+	 * devname_snap: a local copy of dev_ctx->devname taken while
+	 * clbk_rx_lock is held.
+	 */
+	char devname_snap[32];
 	struct se_msg_hdr *header;
 	bool sz_mismatch = false;
 	struct se_if_priv *priv;
@@ -313,7 +324,7 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 	if (header->tag == priv->if_defs->cmd_tag) {
 		se_clbk_hdl = &priv->cmd_receiver_clbk_hdl;
 		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
-		if (!se_clbk_hdl->rx_msg) {
+		if (!se_clbk_hdl->dev_ctx || !se_clbk_hdl->rx_msg) {
 			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 			dev_warn(dev, "No command receiver registered for message: %.8x\n",
 				 *((u32 *)header));
@@ -327,8 +338,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		 * SE_IOCTL_ENABLE_CMD_RCV and is not subject to the timeout/circuit-
 		 * breaker handling used for rsp_tag messages.
 		 */
-		dev_dbg(dev, "Selecting cmd receiver: for mesg header:0x%x.\n",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting cmd receiver:%s for mesg header:0x%x.\n",
+			se_clbk_hdl->dev_ctx->devname,  *(u32 *)header);
 
 		/*
 		 * Pre-allocated buffer of MAX_NVM_MSG_LEN
@@ -343,13 +354,15 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 		 * Clamp the copy length to the pre-allocated receiver buffer (MAX_NVM_MSG_LEN).
 		 */
 		se_clbk_hdl->rx_msg_sz = min(rx_msg_sz, MAX_NVM_MSG_LEN);
+		strscpy(devname_snap, se_clbk_hdl->dev_ctx->devname,
+			sizeof(devname_snap));
 		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
 		complete(&se_clbk_hdl->done);
 		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 		if (sz_mismatch)
 			dev_err(dev,
-				"CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header,
+				"%s: CMD-RCVER NVM: hdr(0x%x) with different sz(%d != %d).\n",
+				devname_snap, *(u32 *)header,
 				(header->size << 2), rx_msg_sz);
 	} else if (header->tag == priv->if_defs->rsp_tag) {
 		bool exception_for_sz_mismatch = check_hdr_exception_for_sz(priv, header);
@@ -371,8 +384,8 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 			return;
 		}
 		exp_rx_msg_sz = se_clbk_hdl->rx_msg_sz;
-		dev_dbg(dev, "Selecting resp waiter: for mesg header:0x%x.\n",
-			*(u32 *)header);
+		dev_dbg(dev, "Selecting resp waiter:%s for mesg header:0x%x.\n",
+			se_clbk_hdl->dev_ctx->devname, *(u32 *)header);
 
 		/*
 		 * For rsp_tag traffic, the sender provides the expected response
@@ -384,14 +397,17 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
 			sz_mismatch = true;
 
 		se_clbk_hdl->rx_msg_sz = min(rx_msg_sz, exp_rx_msg_sz);
+		/* Snapshot devname before complete() can free the context. */
+		strscpy(devname_snap, se_clbk_hdl->dev_ctx->devname,
+			sizeof(devname_snap));
 		memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
 		complete(&se_clbk_hdl->done);
 		spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
 
 		if (sz_mismatch)
 			dev_err(dev,
-				"Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
-				*(u32 *)header,
+				"%s: Rsp to CMD: hdr(0x%x) with different sz(%d != %d).\n",
+				devname_snap, *(u32 *)header,
 				(header->size << 2), exp_rx_msg_sz);
 	} else {
 		dev_err(dev, "Failed to select a device for message: %.8x\n",
diff --git a/drivers/firmware/imx/ele_common.h b/drivers/firmware/imx/ele_common.h
index 7bf2febefc45..07e6b6a1bafa 100644
--- a/drivers/firmware/imx/ele_common.h
+++ b/drivers/firmware/imx/ele_common.h
@@ -16,12 +16,12 @@
 
 int se_update_msg_chksum(u32 *msg, u32 msg_len);
 
-int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl);
+int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk_hdl);
 
-int ele_msg_send(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz);
+int ele_msg_send(struct se_if_device_ctx *dev_ctx, void *tx_msg, int tx_msg_sz);
 
-int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_sz,
-		     void *rx_msg, int exp_rx_msg_sz);
+int ele_msg_send_rcv(struct se_if_device_ctx *dev_ctx, void *tx_msg,
+		     int tx_msg_sz, void *rx_msg, int exp_rx_msg_sz);
 
 void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg);
 
diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 107cf384dc7f..5f420975c8b6 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -293,6 +293,29 @@ static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se
 	return 0;
 }
 
+static int init_misc_device_context(struct se_if_priv *priv, int ch_id,
+				    struct se_if_device_ctx **new_dev_ctx)
+{
+	struct se_if_device_ctx *dev_ctx;
+
+	dev_ctx = kzalloc_obj(*dev_ctx, GFP_KERNEL);
+	if (!dev_ctx)
+		return -ENOMEM;
+
+	dev_ctx->devname = kasprintf(GFP_KERNEL, "%s0_ch%d",
+				     get_se_if_name(priv->if_defs->se_if_type),
+				     ch_id);
+	if (!dev_ctx->devname) {
+		kfree(dev_ctx);
+		return -ENOMEM;
+	}
+
+	dev_ctx->priv = priv;
+	*new_dev_ctx = dev_ctx;
+
+	return 0;
+}
+
 static int se_if_request_channel(struct device *dev, struct mbox_chan **chan,
 				 struct mbox_client *cl, const char *name)
 {
@@ -337,6 +360,11 @@ static void se_if_probe_cleanup(void *plat_dev)
 
 	dev_set_drvdata(dev, NULL);
 
+	if (priv->priv_dev_ctx) {
+		kfree(priv->priv_dev_ctx->devname);
+		kfree(priv->priv_dev_ctx);
+	}
+
 	kfree(priv);
 }
 
@@ -437,6 +465,11 @@ static int se_if_probe(struct platform_device *pdev)
 		load_fw->imem_mgmt = true;
 	}
 
+	ret = init_misc_device_context(priv, 0, &priv->priv_dev_ctx);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to create device contexts.\n");
+
 	if (if_node->if_defs.se_if_type == SE_TYPE_ID_HSM) {
 		ret = get_se_soc_info(priv, se_info);
 		if (ret)
diff --git a/drivers/firmware/imx/se_ctrl.h b/drivers/firmware/imx/se_ctrl.h
index 54b2a262a2c3..dd4a1ea7e35a 100644
--- a/drivers/firmware/imx/se_ctrl.h
+++ b/drivers/firmware/imx/se_ctrl.h
@@ -20,6 +20,7 @@
 #define MESSAGING_VERSION_7		0x7
 
 struct se_clbk_handle {
+	struct se_if_device_ctx *dev_ctx;
 	struct completion done;
 	bool signal_rcvd;
 	u32 rx_msg_sz;
@@ -44,6 +45,12 @@ struct se_imem_buf {
 	u32 state;
 };
 
+/* Private struct for each char device instance. */
+struct se_if_device_ctx {
+	struct se_if_priv *priv;
+	const char *devname;
+};
+
 /* Header of the messages exchange with the EdgeLock Enclave */
 struct se_msg_hdr {
 	u8 ver;
@@ -106,6 +113,8 @@ struct se_if_priv {
 	struct se_fw_load_info load_fw;
 
 	atomic_t fw_busy;
+
+	struct se_if_device_ctx *priv_dev_ctx;
 };
 
 char *get_se_if_name(u8 se_if_id);

-- 
2.43.0

