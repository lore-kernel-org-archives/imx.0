Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2098.outbound.protection.outlook.com [40.107.7.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEA0132C17
	for <imx@lists.linux.dev>; Tue,  2 Apr 2024 14:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.7.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712068472; cv=fail; b=jlPM3FLaVl/9JyVHCzEQNRDaGT2WJsYXcZb4upqxfk/LvIkLX1PP4NPnKfnfoNcp3ONuh2oCeNyz2v2MTOyXJS21vJbbFgsYsMsXtSaQTrrc6z890Gpd4y4VYkAnTlCTGwgJt2J2JnUvSCHXZhi4DuXAYWLu+xCEvA1fKmIeCWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712068472; c=relaxed/simple;
	bh=7LEmma9asVcc2UpABKTIPCze0Rfq/WnOrCDirUI9M1s=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=TeOTgYWEuly5uygBPCxCWJLrMOrLJUyl2DkN+MMkhABW8AjTi/PQx4KTc6JSpq9boVC2qRXLTVup0qL/XRYoN50oexUfoLIRBxDEvCb+Vv8c2ijzl13abGj/Dg4U0hiO9RAa76Xqi8O0I3/pgItqI9WpjefBwbSH1gIm9rP69eE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=Khhpuut8; arc=fail smtp.client-ip=40.107.7.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Khhpuut8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f3pVfNN6EFLScJoBv6ZjKdcPitGCWGhsELFZCEExTjHjZhsC+1FTM1aSa+jOUuwPL9P/MHtSXKDRuWaHykuDIzrA5sj7fcV2tYXgeEs41aV4k1n+r+BAvvLZ620BWCSfuh8udCSZdW2rCZKX4zZuuCxlOHA64rBhCMlObsmgPgWYI5wL4oYKe5GfTdgFq6UHW9fi5shcufR/sgXf+/wvCdxPJjmPvBse4N7spqJOKjTfOxg4ei6qRbicBtXCrug4XPE3a9oBwaEJzRcZd8r3wTrgJuT69VLhKZJMSmw6LGYUwXrsO5vRpeZ/fra2YdVqw1v6AVJsXuAhe5m10pK1rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bYoXCN2Cg7BevWD2QEgj8BjNP6h0jRB2sBiityVf9KU=;
 b=J2nRjrbzvQUpaaXxZMMn3f4kSI9vD4In7eCzMSAj6nPgTY16mSU4Htq4CCg4ztGNgEvfju8KJbRnsIxujlwr6f3of50hKBrgMCDZFJlOn9h8iAln1GP87guhXXMfTaKjI5l/2B2T5ADz4tJRxrIAJh1b9Dp++bUp5tJJpURLxZJNbUOBzD0ITbruKtLbuMdieEV30peNEdVENaHCjSf56+GFutW/x59QfQPz6FnXHXg/lzr/UxzI487CSutOU46npSD6qwBJHCNcu4LyqisGQT4JzZch88Vsx1xGO1DMUg2We6pCBO9DwdPDFIMtvr7oYlbtSqeLXmeMkiDE1AZtUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bYoXCN2Cg7BevWD2QEgj8BjNP6h0jRB2sBiityVf9KU=;
 b=Khhpuut8llAmT6ecUhT5Bk3lX65Ao9J5cWg6/WPjJrrosCYUKOzefB2YGg0SkhUHTD65CHxxnkKUw+3755pH3NPigJpjHLp/TAGgekbn9m4L13Z7Obn9k0R6kwijpp6dHSNTTT2/2+37OXXE5M+nyw8TeNc4e4NPrxN2zZJBNsc=
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DB9PR04MB10036.eurprd04.prod.outlook.com (2603:10a6:10:4c8::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 2 Apr
 2024 14:34:23 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::3168:91:27c6:edf6]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::3168:91:27c6:edf6%3]) with mapi id 15.20.7409.042; Tue, 2 Apr 2024
 14:34:23 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 02 Apr 2024 10:33:41 -0400
Subject: [PATCH v3 05/11] MAINTAINERS: pci: imx: update imx6* to imx* since
 rename driver file
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240402-pci2_upstream-v3-5-803414bdb430@nxp.com>
References: <20240402-pci2_upstream-v3-0-803414bdb430@nxp.com>
In-Reply-To: <20240402-pci2_upstream-v3-0-803414bdb430@nxp.com>
To: Richard Zhu <hongxing.zhu@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 bpf@vger.kernel.org, devicetree@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1712068432; l=1049;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=7LEmma9asVcc2UpABKTIPCze0Rfq/WnOrCDirUI9M1s=;
 b=aftJlbsjlodAFp9hOENvhR2GZ+yUnZOJ1sTDdeqq1T7D7XylZ2L5kxqtXf9dSPd+zYpkLaUAQ
 e+z/jbMBjs7Cx5kCjrMfUhUk+uP5yRVEvEpdAKaBPuts0JyXJ27mfLz
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: PH7PR17CA0011.namprd17.prod.outlook.com
 (2603:10b6:510:324::20) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DB9PR04MB10036:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pBtQjS0iOVcQTQYi5/xlOcZW2nv2d0Mh9qWvsLFnVL5agshxfgsKswqMviXH5/f2R3Sd0HLNJ6nQX8Ypfu4M93gj8wZWNSzgRD5BOJ8So4fH2YvtMsaEH8IC512V1ztJ+K2N4dIw3uW2bQdK4qQLfXB/HTuOfW2gWzXVnn3uX+t4yp3Lu2hhdMWY+ZXaUE9HSZ6NZ2YbPHL1vGEGr+ZHdHL9vrB/fqSAh0eHBAqLIeuPesoW17Df4wXCurUzX1sg0OZymgmcJYNaWf8ctAw2J3qxfH/EX6b0ejAw5PH6Dhvn/pFzqyu15V4ezKGXnE+q1rIQ3kasYfEY0oRrb0Rc/p4DgxKe4+jugIEaQ4I5MlE5ho2xTVExHV8j5ziL0O1RoblABpW+axZk+iGadY5xQzhQPvgp5QoBERNoj8hHYwVNf0+G66/jVdRILmUrg4+IgkI62LC0AhhlmROvL/tw4ykldZA85gPngMFbBPBa/TTtiYf13vVfBocUqP3txcesUyH8jcYiIvY74XrvsMngS/Ror2TMw7Q9gjHiM+/hSMWgkkzE6Hmi8LsOvTpfD+Eg3z6TnZa3LIeY4VKhaVTZ2U0S0THr8vqdnKfwjMSY7PqomKnPoEm8fdF6XU7M4afIx/3094/Ex6YCcl2a18KtP5atkRWFrXq06r9Nhm/vyYYg1Ekj3mp/8baVmNJW+0ooLNSJkBh5/eInH9v4JspLX+xhvUXkFVUVfcLtp2uNC7I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(376005)(52116005)(1800799015)(921011)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmZEUnBBT0RhNnJkalp3QXZGM05NMjg5d3hhODdQZ1I3OVVaL3VoY1N0NW1r?=
 =?utf-8?B?Q2ZxbXdPSmtJeDZ3ZWdBNDFCMEdCYUYwZFdVdUl0REhMRFpjU1l4dWVBaVB2?=
 =?utf-8?B?eGc2aENxOGcvZXEyMVpkdStWQ2pwV3VBdE92UnQ4RUVMT2NGNytyYmRmUy9C?=
 =?utf-8?B?aUJRdGVqOGdGNmNHRytNZGxYckFyNEh2ZzVYcWdIazhGMVh4Nkt2R0pZQVlC?=
 =?utf-8?B?Q3AzUFN6SVhhTzBOTnprNUNEeTcvbkVYbHg5UDZVUFRxUFAyQlpRdVZPRk55?=
 =?utf-8?B?bUJ1Y3JSaTh1NkhuRDNlQW9MOXhaUkF1c0F3Nmhab0pTMkM3ZC9lVW00Sysx?=
 =?utf-8?B?WGVOZS9YUWNZQnVYWWxIVFRXdjVXUEVQbUd1TGYzNWJGZ251aFl2KzlkcUZ2?=
 =?utf-8?B?YW5FSlhCVEJJbnFnS3BXQm1XdG9YdEZlYkltZEdIZ2xSdE92eFZQaHlXY0w4?=
 =?utf-8?B?QjJzN1g0OEpxM1NDcXVGaEw5WlY3YjFnNXZ6Zy9NeG5jajl1amVzdkIzWXFY?=
 =?utf-8?B?RFgzV3F0Si96NmNwcDdPOTZiSXdQUmdyMitmNTFlMzFPcHU2M1NpUXplcHJO?=
 =?utf-8?B?K3RYcGpncXdJZmJmcUpPTGNQSDVOOVNuSExGbTMzOHQ3dEtmdXN1UmRNV2lL?=
 =?utf-8?B?RjlvOTVVTStSaHhUWUxaQjN3UjB1MFI1RGtuZkQxWXU5OXJid09JR3B3ckxG?=
 =?utf-8?B?LytXVU14Qk1oemw1QzcyK242ZVR4TGxKdWZZOHFqelJBamdmOVdCeWU5ZkNk?=
 =?utf-8?B?OFlTVjVMR0VOaUFOVmsvc2xhRVd0bk5QRUV4c0o1Z3dYd1dxUlp0UHJyMENF?=
 =?utf-8?B?WjhiVDAyb3hGa05ENlc3KzFlMVJQUWRGcEhibXY0TU9LWVNRNkQ2b2kyc1Bz?=
 =?utf-8?B?Rk93NkthbC9yU04vcFVsc1NGMHd1ditpWVdzdWJpOUx5VHo5TWpOSFRxTGti?=
 =?utf-8?B?anFJYWZVZWo5M3pkNXJNTUkvVFlSRnoyVk1mYjYzZTBCSHJXbUZ5MGhlWXln?=
 =?utf-8?B?OWlRaS9WSTg2SFhuWmlYWUUxaHQyYk96Rm5EMlA5T1Y5THlvc2Zqd2RFN2pi?=
 =?utf-8?B?V1RTKzArNnNZSW56OHkwdFU1OS8xWVRNZmxFbEkvRUFzaWJ3WnNsU2cxV3A4?=
 =?utf-8?B?eDFDVjNvRHBJejh3VVgrQW1RQ2VhckFPSloxaVZJNFJFVEkxeEtqWG50RHFr?=
 =?utf-8?B?WnlkSmRRTGQzb2RZWFJsckgvdzZOMGUzaEhYbVdMWkQ1b2dDeTFzeElmenZ0?=
 =?utf-8?B?VG9DY28wc1FPRHlWRU1iZHI5V2NQd2Q5c2NjZ3hxQzJiRnZNaVE0Szh0SHk2?=
 =?utf-8?B?MzVhWFdDM2xVdlF0bGlCRUFVb2ZacjBMYzZKd2pkUEpnd1pkd3piTjZwRFRn?=
 =?utf-8?B?Tnh5cnRZcHRaV1Fpb0tNSlZsWXdFbXVNcFNKK0N6ZXdIUUZrUTlYblM4eUtu?=
 =?utf-8?B?akE2aVpqejNmQzNLNHZrYlpqT1hRVFUrNHZ5VFZYRHEzMW9ORnZyZ1V6Rnpa?=
 =?utf-8?B?L3dOU2dmRGFFSzhkQzdOOTc3eG51QVp6OFBVQ0RRVFYvUHJVOW8vMUdEYXNl?=
 =?utf-8?B?RUZ6ZjZHYUJuMU9UYUFaekszT1ZNNDRKWjR3WmZJLzZORFZxUVBjRldwRlli?=
 =?utf-8?B?SnhobXJ0c0xnQkNIemdnOTFCWW1xeExjd3AxdExTU0tybytiL2JmVFAyNGtw?=
 =?utf-8?B?SUR2SUpOMEpBVDdSdGE1YjgxS0FaeDNOUkllczdBQkhKRVJ1WC90MEpScmEx?=
 =?utf-8?B?VjFoTk1ncnBDSndDSSsrVDZEU0huMUZqR1hUOGU4UkQ5SlZGVnlHc3JuVkF4?=
 =?utf-8?B?U0JZREczbE1naEo3VVdJbDFtcWV1SXhua29JS1BaTUlBM3RrUGdzZGM4bGdG?=
 =?utf-8?B?anZsZ3cxT3M2K2xGMURabFlabmNmZHZ4Y05TclhNbnRuMUExSE00RzhMNjE1?=
 =?utf-8?B?ajZNU0xld2xvU29vMytvVHFOK2haWDV0WlJkUGdsRk9mblNINzk2OE1UejBK?=
 =?utf-8?B?SzM4NElxcldXbFp0TU1RWHdCZ1M5N0h2L0k5OVJTSXBEMnc4VHlPTmNTbHRn?=
 =?utf-8?B?THBlNDVnY0pvQ1cxQjFCdGxKQy9kWmNmeUlrTHFPYzZsNzZSaG02dEhBR0RH?=
 =?utf-8?Q?ElFU=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d06e67-10a7-4ca8-72a1-08dc5321fd5a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 14:34:23.0805
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ais2wvSUtmHhVl4IR3Q5m2CeT87NwRTV8jtRMFKpQcDzbODX7KczqgVJUchWvuQkS6qjh3/ABgNkHlvCmsyEKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB10036

Add me to imx pcie driver maintainer.
Add mail list imx@lists.linux.dev.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d1052fa6a692..59a409dd604d8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16736,14 +16736,16 @@ F:	drivers/pci/controller/pci-host-generic.c
 
 PCI DRIVER FOR IMX6
 M:	Richard Zhu <hongxing.zhu@nxp.com>
+M:	Frank Li <Frank.Li@nxp.com>
 M:	Lucas Stach <l.stach@pengutronix.de>
 L:	linux-pci@vger.kernel.org
+L:	imx@lists.linux.dev
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-common.yaml
 F:	Documentation/devicetree/bindings/pci/fsl,imx6q-pcie-ep.yaml
 F:	Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
-F:	drivers/pci/controller/dwc/*imx6*
+F:	drivers/pci/controller/dwc/*imx*
 
 PCI DRIVER FOR INTEL IXP4XX
 M:	Linus Walleij <linus.walleij@linaro.org>

-- 
2.34.1

