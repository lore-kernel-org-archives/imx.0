Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010071.outbound.protection.outlook.com [52.101.69.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600D532B124
	for <imx@lists.linux.dev>; Thu,  2 Jul 2026 16:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783008287; cv=fail; b=fhRBKMICOUxVJNdVGuyU0CDaFtfi20vcMW7sVa66BbSEDE3prD99ozZzrXUCje/BW3s8Ils8j2C6m4YxBPt6ZDe4rKGSVodU94/N9pLPKcZuWNqoEdRXNfuyzt4pmGHf+uAFf7fF7HY77n4n8g/NEBrx/z8dxLzvlP8ixhuA31s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783008287; c=relaxed/simple;
	bh=/JXgDkYDzR1SwTYGX82ghrupqQTXzTZewJtOosFi4Pk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kO9gJAH6WfMeWo0J9O2VuphSKJes16u9ATyVfzmlNTRXkSc/13xdNtB7j4mhWWLmb26kMu6k5P8dlvFrEK9qJlSW0vXN8bQuOYC25e1gujK7BdOvn7yEvMWHtruZM0t9KA2PBTFiRjnIbABlKblw9/fmxW3ehFZHTQLCmwYzSq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VNJJJbew; arc=fail smtp.client-ip=52.101.69.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VNJJJbew"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZdTdkFg24bnILlhV5m/B335NN4kA9JFh1TQgmcwxddM42QoC/ckvTmEfhRelVUYuuFeHGEJEX3kcP/j6DST/DN8xd9u4KN+GavWUohm2iYsWaKZJoelAHh4lL0882NTSePz2pgEFqJ19BOIE/7+IzKS3HcLv5rJt7sMhMI4E+fOJLsmM1/qT2gOG5jketeqQviZ9yYRyl1vVYsDjEpP6BAOyRNeMd5kAXQ7AWxki8/+tfdljecry6ghas6jTec4YKK08j3YTOasXJzf25Cg8g/qY0muiAb7hli5XTg72JRfraskwxDdRDXObIV1Xtx/ZjOmHUD3AXfaIKZF7Pzg4UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=djWWDUsqE6xgiDn/rjQGjqe5QcdRbtoRUJTzNz/9HQo=;
 b=VM4qxvtVSaSjgP8lskd+R8lNn9zdMq5LHIyHcfw+EPQf7wDVdCbPGeVMRvm8mr97SmiPd4+x0vKxMOGK4ESxk5T1lhUCjbtqIvAzhmPXbOlxDNRPcQHhCa0KjmzsqhUUo8p3pD25d+jAyQd/9YiErV3BEF5Hpw3CvypO8NeHjI5f3fb4TQfZxUZDqtwHNy0hxG/aGTAPrC+1iZeuxfdBdGNqp/YJFcPsU3+m+a2+E5f7zJiyUVT70h+zMos0vVK65AN9ALkhU8r51g/hP9rgmsPxMSAwDPdQ7iaIDlbsbiP1p6hpxoUlR9Hc2XygG72t9f9FdmQUqP8L9CLNZWq1tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=djWWDUsqE6xgiDn/rjQGjqe5QcdRbtoRUJTzNz/9HQo=;
 b=VNJJJbewdCyLbUVB0Iq4F3SyNvm5bq5SduU1fSMUb/T5izNSnM4zrOBIlj6NHeIeDRr8vv4sZYwmZuV4yheKi3IZH3MU+16cRiUAi1xgMEWxTyIIaiRSJH9QtvmTlOq39lorIvlIVvOJ0hsnyKmygc03FqAhnQahmAhh0aw7jZopEtpJHarjv71CYnl9RvU2C1e2nLWiu+x8JAozCOAEiBAdVrV0fLGqoQ1xLICmQr0zTiub/QJwX6TS45mDLjqpuDaX0AuEUbnqtI/gvJQqLMgF8/itNjQbSMJwAhgPjYMEJpPECJ47wUDAe5wH204DH5R7z/e//vs3FyDM6/6zPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB9936.eurprd04.prod.outlook.com (2603:10a6:102:38b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 16:04:40 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Thu, 2 Jul 2026
 16:04:40 +0000
From: Frank.Li@oss.nxp.com
Date: Thu, 02 Jul 2026 12:04:01 -0400
Subject: [PATCH v7 5/8] dt-bindings: media: add i.MX parallel CPI support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-imx8qxp_pcam-v7-5-b47d9e363400@nxp.com>
References: <20260702-imx8qxp_pcam-v7-0-b47d9e363400@nxp.com>
In-Reply-To: <20260702-imx8qxp_pcam-v7-0-b47d9e363400@nxp.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, 
 Martin Kepplinger-Novakovic <martink@posteo.de>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, Purism Kernel Team <kernel@puri.sm>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Guoniu Zhou <guoniu.zhou@nxp.com>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alice Yuan <alice.yuan@nxp.com>, Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783008245; l=5135;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=z1nCI3adHWFmb8jYDDba8a/rQ9Anp0gdwumrCFvnCNk=;
 b=jhfjBypYO6DdxEgWcqy05JVu3Tk7nFPSEV+x5GhiIrwztQKgGd6HUvFHj6Wpuvs0d0B+eQkxl
 nWPUIaoWvcpAtnGD8BnX8SzDgZhxW3wTmgoMEJBo/PxyM2oAdp+KS+J
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH8PR21CA0007.namprd21.prod.outlook.com
 (2603:10b6:510:2ce::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB9936:EE_
X-MS-Office365-Filtering-Correlation-Id: d19c1dea-1b9a-4a4b-1dfe-08ded8539f1e
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|23010399003|366016|921020|18002099003|22082099003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
 rzZpwf5W6jY761DHDrhGdd5z+Ip9TAgMl4ZdTPKF6mRXg9NbIsLzge2GAPcD4pPFeuW22kvR6KyWsYA9u6AswladGtHXro3wimswIGICcHt4lsaSQUlBehhckLLv1CeHD9KmDKvxt1+VC9E2KBh3z/76iVA55PJONpJhAMh9QRHWlZM4+OPKDCFvc4jcyiGROPmzcER6jhz9c8KAn2nHnTWtg0nv9M8tOFtOqCwxXLuG5SpDh3XoYKYmG7Z+4XqWIHJGWrLWuM/9YndmJVVqGNNf5snda8tavjlySNTyW6xEluSRYu+vIAq08/XVyhHF8ap2xe6Jf/z9mHyCpXl9EuQhWnlcPlJmzFmDfnQ+dv1gyS9FQKq+8P0qyddtmtmF3lyUDxTUf8dZsOJM6ZvoUigfeZ0H9qCUe4dC/Nt0tpCovr3whHFqWKIGSHZzQV4fKDV34OxMEEYIcdBCeSMJZprIKCsL/XHwCH3roPkYCF1zQw6Yx/sbv3jvqR1qgvPNf3985Nz3BCE09lzBsde+YYPoLw2xoBNBYZ2sHIFwqJd+y1raYGyxB0G/gh5BPzEfa7ZNDwsc+97I3a0xcYmdNU6qZ+SYUxlhLdlfLHDC5wyBVdodtLV/1a+8Paiyi14SCv21EA/7O96WAyZReZsT+4bPk4gD30BpLcjVORvB/uM=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(23010399003)(366016)(921020)(18002099003)(22082099003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?QVdmdHRhMzhRaWRjQVdsbnFvVElLY1hBUEhLcVJ1OHJEMkZKbm1vUlM0bkZZ?=
 =?utf-8?B?LzF3eittUFI4MC9EejZ5bmUxcUxIbUN0MklIU2xIMmVTckJCQlBlUThUSjVu?=
 =?utf-8?B?QXJ2TStLMTFsSDBYTjRqd2l2dW9JUjRRMldPallKWGhQaXovVHp5T1RlUGJ2?=
 =?utf-8?B?azdmelQxRTErTUZGRUluSFlpN3g5VDFMbTBKOUIrbGE3Z3pKSnMrSDBZS3E3?=
 =?utf-8?B?T00vOVRSbXFQZkNIQ0s4VWxLSlJDdG5yam1QOHlmaUF6OFBCVzNkaTN6aHhL?=
 =?utf-8?B?RUpvQ3JxZ0NEd01FaGNMNDN2cjl1RFpWYW14Ymc2cFNMWmtTVUY2TzdVek56?=
 =?utf-8?B?SWdEbUJ3K3c4b3R0MlZEMlF2QTd1YUVTRXZVU1ZRRitLVFJKUzI1ak5vV0Vp?=
 =?utf-8?B?dWhqMmdPNEc1OTVpa3cwdHFDeER2WVYyVnZkM3dQUFJPeGFKaVp3MVVxZ2h4?=
 =?utf-8?B?bk9JU2taa3ZwSUpqOXloaGlybkkrMTc3T0dOVm9xbFBQYVV5dHFCVDdTM3JN?=
 =?utf-8?B?cFY1NE9ZT1I4TzlWOG1uL0dMUkVmSWo4QlVEUnFBcGV2d3d6REZYaXVCK2wy?=
 =?utf-8?B?MlNJbUt5KzB1V1BZb3ZwTW91NWo3Q0tic1NQSVFpdTlkR0oyYW84Z1dvL1Yr?=
 =?utf-8?B?ZDROS1IvNmN1QnQ4TmtqZDd2cjY2Wm4yelRlQWZ5ZzcrdmtsVm9QalZBclVL?=
 =?utf-8?B?QWxTa2kxWjFvQ3ovQmVWalA4SXlTSU1KZ1NEQ2RNazhQQ3dvMkZab2V0L2FU?=
 =?utf-8?B?Y1BrK1ZmVGtXQ1luUlByVUJQTDEwdDR5VjlGelhpRVY5TW1rNU1BRkxYSW9r?=
 =?utf-8?B?NGVhSFJNRm96c3R4QS9ZajR2aTJrcGx0dDVVbnZHaTVhdXZGNENxdkJHMjY2?=
 =?utf-8?B?ZHdYTTlwdXVkOVF3dy9lK3loVmFvcWtzNjZJVGh5a0JWNHZEbWNUTHVQMmJY?=
 =?utf-8?B?WU5uSFIrOGZPREh4YzRFOElLRWtUc080clp6WkMvRG1XVUpzVlowZU5pN1Zr?=
 =?utf-8?B?ekJRTzdXNW1STWg4YnF1eGJTU0VqVTFxUzZhTkh5a00xYTVyNnpSamRWa1BO?=
 =?utf-8?B?NVZtaUVKalF6b0NLTHBMRm5iUDlzMjdrN3NWNlRuQTVMbnVxMll1ckxWRXJN?=
 =?utf-8?B?V1JWQU9oUVdtTWlwRjBwOEl4UkVlTEp3Y1plaHFtcDZGck40c01DUDlyRlZM?=
 =?utf-8?B?ZnE3MEZzR0RQdDU4a21NSC9xUW9XTk9vZFRxdmJJQ1pWODl6QWpLVTFBUkVZ?=
 =?utf-8?B?enU2U2FrTG1ld1ltTnlZRTdISG52WXJFT0hGcGdleDNqMWdDZDB4cTBpYi8y?=
 =?utf-8?B?TUJMZGpLNTVtQ2MxYVVtOU91N3NtalV4SHlIeFhLb1pTV0pXNCtESlovUXRN?=
 =?utf-8?B?V0RTdU9xT1A2UHZaaitYMHhrUmRJWE1BMTdwTG1FWUdtdlNWa3NkOSt4TUI3?=
 =?utf-8?B?dDFaL21ndnRqR0lYWXRxT1FuN1QrMTJ3VG1kNlRHNHZZclJqN01iRE1OV0sv?=
 =?utf-8?B?WW1lc3dRQ1VVNWVtMlRDTDB4a0J5blFMV3FJWXVxWlJuand6cXRFNVhWeHRZ?=
 =?utf-8?B?UzJSVWZLbmIySWR0T1BwazNBUzhnUk1iR04zMGFWYTdpZlMxNUxHa1dkTC91?=
 =?utf-8?B?MHRXdVFaanJYRHcwcXF5bXRLVTBWVUxMU0VZWmNHSDVFL082cGJrRTRnOFBX?=
 =?utf-8?B?NDArN3dGY3Vnb3BSRXJBbk1ONmh3VTduVUtqTVJjUlRIckk5S29sYnRMYjQ2?=
 =?utf-8?B?NjVGNkRRMjFOMkplZDRWVUcySVFDVERWMTBzRFg0L3FXemZVZUpnZmE0NGRp?=
 =?utf-8?B?Rm5NcFhUd0FFSzRUdTlWUlAyZ29QYUd6LzVOOW1tKzFrUEFLVkt4VE82Vllv?=
 =?utf-8?B?ODd6YkV1eHhWS2ZBcGNSaTkwQWlERjJ0VXBNcElaTHNKT1o0Sm5PR1hhaVlq?=
 =?utf-8?B?SjFMZXFIbEdLR0ZlcjVTQkVOaXNWaXV1czFEeVVXWjlaQUNHOTloUDYwY3hL?=
 =?utf-8?B?VUliZlNnM2lBQ0t2RGQ4eUhPaStHaENGTzdXaXlpMmdWaUNyTXREd1dLU1NN?=
 =?utf-8?B?cEQxY3NacTAyVmtIQWVhYjNVODdtZjRtZHEvbVhEa1hPK0ZUYk1tMlY4Tjg2?=
 =?utf-8?B?UW95a2k5TmtIclFsZHZNOGZaSHJoWXJGYmZBbGdiZ0pSQWU0aGl1TE9mRklo?=
 =?utf-8?B?OTdsL1FGbktLdnZVSkUzTVFma0pYVHRLS2tzTkFkY3k1YUUvYTViQjM0NXdZ?=
 =?utf-8?B?YTBQU1BrdFp4SDM2WDV6QmpBZ0Y5dlFxVU1NWFdCcnE0QlZVdlJjNis2TGpu?=
 =?utf-8?B?YlBGc1JpUnBTVS82cnhLOUhMeGd2RDFGckU5bEM4SXpubkdkVUhYS1RDOGY4?=
 =?utf-8?Q?D6aaWyzvcJILwI3rM/THmjGkRVf59C8LFkWS7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d19c1dea-1b9a-4a4b-1dfe-08ded8539f1e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 16:04:40.1196
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U+vaNshH8H+E96/Wgh+YVghxMjU381qADyr7OAj7OTuDpImiYkXtI+a+U93mptFKjiBDoadl/3yG8hrxQtzJwJEhF6SJ7t8o21fIU9PfPQCA+k+pCHn2pTCRSJGZ02Kg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9936

From: Alice Yuan <alice.yuan@nxp.com>

Document the binding for parallel CPI controller found in i.MX8QXP, i.MX93
and i.MX91 SoCs.

Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
Chaanges from v5 -v6
- none

Chagnes in v4
- add Laurent Pinchart's review by tag
- fix $ref: /schemas/graph.yaml#/$defs/port-base, original is
$ref: /schemas/graph.yaml#/properties/port-base

Change in v3:
- use enum at compatible string
- add ref to video-interfaces.yaml#
- use cpi as node name in examples.
- replace csi (Camera Serial Interface) with CPI (Camera Parallel Interface)
in commit message.

Change in v2:
- use pcif surfix as Laurent Pinchart's suggest.
- put power-domains into required list
---
 .../devicetree/bindings/media/fsl,imx93-pcif.yaml  | 126 +++++++++++++++++++++
 MAINTAINERS                                        |   1 +
 2 files changed, 127 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/fsl,imx93-pcif.yaml b/Documentation/devicetree/bindings/media/fsl,imx93-pcif.yaml
new file mode 100644
index 0000000000000..9dd0331f6ef75
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/fsl,imx93-pcif.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/fsl,imx93-pcif.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: i.MX8/9 Parallel Camera Interface
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+description: |
+  This is device node for the Parallel Camera Interface which enables the
+  chip to connect directly to external Parallel CMOS image sensors.
+  Supports up to 80MHz input clock from sensor.
+  Supports the following input data formats
+    - 8-bit/10-bit Camera Sensor Interface (CSI)
+    - 8-bit data port for RGB, YCbCr, and YUV data input
+    - 8-bit/10-bit data ports for Bayer data input
+  Parallel Camera Interface is hooked to the Imaging subsystem via the
+  Pixel Link.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - fsl,imx8qxp-pcif
+          - fsl,imx93-pcif
+      - items:
+          - enum:
+              - fsl,imx91-pcif
+          - const: fsl,imx93-pcif
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: pixel
+      - const: ipg
+
+  power-domains:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Input port node.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              bus-type:
+                const: 5
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Output port node.
+
+        properties:
+          endpoint:
+            $ref: video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              bus-type:
+                const: 5
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - power-domains
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx93-clock.h>
+    #include <dt-bindings/power/fsl,imx93-power.h>
+
+    cpi@4ac10070 {
+        compatible = "fsl,imx93-pcif";
+        reg = <0x4ac10070 0x10>;
+        clocks = <&clk IMX93_CLK_MIPI_CSI_GATE>,
+                 <&clk IMX93_CLK_MEDIA_APB>;
+        clock-names = "pixel", "ipg";
+        assigned-clocks = <&clk IMX93_CLK_CAM_PIX>;
+        assigned-clock-parents = <&clk IMX93_CLK_VIDEO_PLL>;
+        assigned-clock-rates = <140000000>;
+        power-domains = <&media_blk_ctrl IMX93_MEDIABLK_PD_MIPI_CSI>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                endpoint {
+                    remote-endpoint = <&mt9m114_ep>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                endpoint {
+                    remote-endpoint = <&isi_in>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 31188163a8592..f690826964369 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16246,6 +16246,7 @@ L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media.git
 F:	Documentation/admin-guide/media/imx7.rst
+F:	Documentation/devicetree/bindings/media/fsl,imx93-pcif.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
 F:	Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml

-- 
2.43.0

