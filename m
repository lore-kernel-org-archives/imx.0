Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795057255;
	b=N6/K1mdiPyCEcpHrBJtYNj7LFwP1CCGG9HSHs7oxaUGmSXd66f0UXYfmAm4HzMhhtjKQ
	 yB3o+Dr/vxSCxRl17OuQvdYVuEl4YjwLmFobeDED4Chfa1/TopVbZnRL4EbPiKP6m4XBn
	 /ImDx0Ip1jVlHbDsQl+L6UT5W2kIBoEKbUBFLv55y3jx1K9darstZHQiRqaheS9S2QJhp
	 ih+qz1LG5azhIYhOs2DDB48+Yu2vzivSGQxC4Yp1gvKV0JX6SvgUwwljW7ZmzZ9XY/qBd
	 PsTQQruV0K5jFC/B9tUSbX7EL5hDn4m1RO3U8hmldSB4KHezoKmko0uGNxKofGpEt7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795057255;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:
	 Content-Transfer-Encoding:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=Lb81WHdyKjOkWG5Z7HfxyZw4N/ztd1NU8lONRHA4bSM=;
	b=bMdtfx6yW6oRgWv+U7PInHH0DTiWeQxli88MQy9WpRaTrIQb+hKAoaqqXhoszavCPzLX
	 JVBEd140hu39i0vV2acMe8qt4EHHFW0TQbTUPYrvEiQi9DzcEcHnVBoEcskpr3XPqrlGL
	 GQieepXOZdERnvzBl6WNZTcXQmLTyGbcH892wOZ6U52bMctbP3IQtJnFrplOzENpOj3Vj
	 FKzRCIr3Uf5ALS+3VnWTtZFQJO1QfThC8sxTnk8cgBn5mgA+q6DeTUmVadO7jGuKHAaf9
	 zVoXqAEvbexcc77dsh7el8hTKD2lRaWc21UACluS1+vRrgDg2KRdj5PSaS4lW/UFpbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WSNKZXuf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.46
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012046.outbound.protection.outlook.com [52.101.66.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076C560A2612
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 03:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 076C560A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WSNKZXuf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SHkGbNQOVWdIIskAxk62d9UtcOxi918F6808C7THnydjv85i3b/Tdpfvw2hac/qD6BpiQl8lHc+bKmoafNmxxjiZUIP8Qcxw70DXTM2MzecdRUs2AfhKADxXA/4qTn0hRzejqRKoF0LcdBrUBjy1RXdzhCSiyY3z2aUNlX+8SPrdsKoTBL8byjM+HrRcwI+9ccNZ4DK4U62Vceyvb02wi44BMmEOIRUZij8YVzAGwFJuSFgW6gxmunkgZORfEf0jPDMAcGXzDdquVEkgy9VpQljaXWam3n54pA8A8JLCPCxdx6l2h//BK9N2Maq02dpuJf/eF+3gBBiknMpK1wd9ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lb81WHdyKjOkWG5Z7HfxyZw4N/ztd1NU8lONRHA4bSM=;
 b=SIXRSBjM+1zWwiRXG70c3BBF2c2avj8tGJQKPPUlIKAUl3D1KzS0PZnRxxjKYbV9jjl5v3aReknIZBTMY0lP8V7XZUtpCgW1Kh1aypHl/NjDkY+log2EdRgbySi6InusAQoVAlrppmxrCxTy17sqjfYvGizt5IWIuMaxCt8LwDVqEC6ICYLTO7g5M7GX7rDH9pL9qnn0wiDtpGtQpcwb15JtnWDHtZIRGSSDZ9I7mXOQ/Tv9hnmUjWMEnNr5T+PHaQxUVi6AMdCAyFiB1f9EIJEyQazW83MXooR8SzhRrRMfuIqNXyuwqrE/kSKv4+fKaQKU9uNV2/1Uai/lA44+uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lb81WHdyKjOkWG5Z7HfxyZw4N/ztd1NU8lONRHA4bSM=;
 b=WSNKZXufV0LpI6iiAlWzsiUex3gU26G30+7gKbKg7nl/qzTDLi1if6GVCUKnjyYipQwVoEsPO7k8vzVmCi0ug9z3zRHlRcg1PMkwDpLlG148hKI7vd/0tbt1uu5Ci4/5nC10oN5vK4WhM4ae/H4hIxAH+DT+daa7XXUuwBtbFruJ83ogT6dtR8tO5h7BZOccUwCGU5d+3an5A5V7hOaE5jhrRHmQducrakmLQrCcEOVUzwFc3WP2G1D/7JqSx8nucNWuQEioPW1FGdeSk52rBHVgl3ouYo92q+eQe2SQ/HD2Rdci9slaTre3RD0wL8y3K9Ma+6Qs56ghkwWOzO80QQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22)
 by AM0PR04MB11880.eurprd04.prod.outlook.com (2603:10a6:20b:6fe::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.16; Thu, 19 Nov
 2026 03:00:52 +0000
Received: from VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74]) by VE1PR04MB7216.eurprd04.prod.outlook.com
 ([fe80::a9a5:cf83:dbe8:1f74%6]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 03:00:51 +0000
From: wei.fang@oss.nxp.com
To: xiaoning.wang@nxp.com,
	andrew@lunn.ch,
	olteanv@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	richardcochran@gmail.com,
	linusw@kernel.org,
	linux@armlinux.org.uk
Cc: wei.fang@nxp.com,
	imx@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 net-next 2/9] ptp: netc: remove unnecessary pcie_flr() call in probe
Date: Thu, 19 Nov 2026 11:05:27 +0800
Message-Id: <20261119030534.1892935-3-wei.fang@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119030534.1892935-1-wei.fang@oss.nxp.com>
References: <20261119030534.1892935-1-wei.fang@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::13) To VE1PR04MB7216.eurprd04.prod.outlook.com
 (2603:10a6:800:1b0::22)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB7216:EE_|AM0PR04MB11880:EE_
X-MS-Office365-Filtering-Correlation-Id: be6d67fe-65a5-4bc1-a516-08df45e95202
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|19092799006|7416014|376014|1800799024|22082099003|18002099003|921020|11063799006|56012099006|261028144727099003|261026140227099003|261021123027099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	x+tG2ddPnjMSKIeeTQgSqrFxEo6jPFbkWA3g1j3MFLITjF8bm3HinhuNvDcFeNZ6gCgwnjcaZPfxsXHo1D/INpp9ZwiAubY7TywQVKD/w208RURjFrpwbx80SS1CcKxTZ5f1gh2AgwuywWrMCHud1BmKuqH4Xudk/UJBooULdCtAQgwX+5ubU7obnaRT/IjOrq/UVdSTjKj1d8G/p/oeeFRLGLwhOkBzrekksSmwWRlpJFlDTChxh+OLybf9rgoKPzyKPeqRYp1N0sgwxrU7aBYRF4vuU1EJs3IHQCQWQXujNHDe4iCUVRLgF1OPsFk0qbpJHsG6Jw9knJmQkG31hih0+aYHJZ/FgeuLqqgj840HoCgzjhZGwnGIP/FBGy8ojnN/Wo9UUlFfxMMpLgJuyDaxwYX+BJrptm30tIbAmy7Ewne9CHspP8FmQcqXeZEZJcKGVPIHdsm88rVYKQ7DEjfIrEtO9AbzYEfoCi2081WKRw/x1hVYors0mUGU7nwrpr+ycpNF9YAlmzWZgcBcH/X5xjfAdN7FvZQW36o0UyTNcIKEdtugVfrjwqfg+XYsInXaBly1bhkvJ6vx1TaKvWpNChxS4KEutLtKxE8bEHd40TnrcsEvB7NoodHCxtUvIxt8CRxe0JWZva7Pz3EXDLy/b0NioFLhrSzGBulyL6ItPtKOxFWoKpmCRSjSB3KVbwQ5DMrAk2XTJ4+ug70WVA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB7216.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(7416014)(376014)(1800799024)(22082099003)(18002099003)(921020)(11063799006)(56012099006)(261028144727099003)(261026140227099003)(261021123027099003)(261022105027099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0uvE8SopJnnDZazhWX3FcehnFs3aVSvOILR4+rLHg5Rj3hVK3gga59s7oOIg?=
 =?us-ascii?Q?eYNr2q6Y0WSW/j3seVcWHu/PkbhFYvHZ+cxKOKhVTbFHnqInQG1zzH1Zw7ZO?=
 =?us-ascii?Q?5FeJuas2dmtzSUd4+cJJuJGp8HVXPcjIBH1BcjnkM/4eRvZ3UozGxnGDABRF?=
 =?us-ascii?Q?n05HmOdnKTOTF4viDEwXvddclP2w9h1orddzGR90m/2UThU4SjC9TV1VUYe4?=
 =?us-ascii?Q?X82+men98mHXd7KXm4gop/Y+nTg98ul5sBY4GOQRNE5nZ/IyEIVfy6PNWSeJ?=
 =?us-ascii?Q?z3Lh7zhmV/ifZRnVARYF4jm4gLD4+fHKGT+PdRWSIJpYaeCJYK3vS1LgmlGl?=
 =?us-ascii?Q?cOd78DQXzr2KhJ6xmBa7hnrg4u7cMDV5cNyoVQ/xeKffo8fKga8CXzw2m7L0?=
 =?us-ascii?Q?bOFTsmVbEHq773xpkTHSNYu1V5czAnPdByyF6MRxoCsUm4gEEJxtso16iys7?=
 =?us-ascii?Q?pJPdkiclRVs0jh0eglb9VOYZ9FUXlc3npcs5TG6V2RYSqS/Sp+J94RAuf3XJ?=
 =?us-ascii?Q?QsIq4QXURchvfbGdfvNafsIabBbzPSzoCgcHUwmU2h0SHrULdRDuxh4yeMAB?=
 =?us-ascii?Q?5pDFNmpgZN0wIfOyZtHtFBseQ6kfUpsY+oRX1qcUW/ZAIyUSnzlqwtZUEEiK?=
 =?us-ascii?Q?feNA4K5EoqXd7Lp8uU258QquFX0N/h/mH2nbc7aCiS9gLnAy8mu8x1Aj1X8k?=
 =?us-ascii?Q?CsDs3PhDikKkA1rdRhZ6E6dZb9mVtGee9ZpXuKGXoXDx5f9liND9wHk3CyCK?=
 =?us-ascii?Q?oWX+2MXLkUM5ryNPugnh5cXYiog2UGRJFepj2BvZe7cEAIgkq2NYdn/pzHMO?=
 =?us-ascii?Q?Hr0iMgzlQYicXQ7B2kcDa8G0EMx/zYyjlmXnd6Buc+Esr+XkT94uGnhk+2eR?=
 =?us-ascii?Q?1DuIOMtdOJij+sYFAcIyDb155UCKn8xj8a6vL9sjb0h1pT/xXVqicCqmoTFL?=
 =?us-ascii?Q?SVpeXfO+BzQpbX2N/mTgbSGX4YEr88/eXPD8tWupQ6Zpla79UXSv5Q4Hm/dq?=
 =?us-ascii?Q?Vmz606lhkZ6RWTv5es+HAvi00YwaM3UgTQ0hsJKMjYZvM8dHAKuF/qUOHFxV?=
 =?us-ascii?Q?hbPubysqB2xrHJBmDOdlyBJ1jg3fSTTZ1MTMNmNvHGacfPc0zvM2yHbFNPJk?=
 =?us-ascii?Q?FHO+HzhyoQ1idtxjaRTm/MEK+VU0/xIpvW4X3WGM8eGhcPwDMKunYSDJjOgA?=
 =?us-ascii?Q?gyj9ZqbTqL+JI8zi1lgyFjnche3uNSuk4pz7x7HeIBVGRK8xTZ0uwm0S14IQ?=
 =?us-ascii?Q?gkCfwNjRLc4NseZrPNdA86/1NqBpi8zZwvrQgevxYxAXtO5e3Nx8Tv4VQ/vQ?=
 =?us-ascii?Q?qfdTN6v5B6lMgOvFZ1YfNqIiB8V1colJwOV+jLNYsbrETL8fFBf4xPqTJgUp?=
 =?us-ascii?Q?ElVNbgiqiSvhqBOs+yg1kkQvpECJcb2NcLTkvUHYByGhe/8NaGnVovPdUkfZ?=
 =?us-ascii?Q?cH/kWxVeuiTa/fDGdaz0lQ2WQG/9wwQXWnW1//8vjrh6j5olGXgAewER+0ZT?=
 =?us-ascii?Q?cnfX58em/WteLJcJY7ppVxPys2gJWe8oIHS4Epq7XLw6fp5E1fdvL36rUSRz?=
 =?us-ascii?Q?8vvYw9bg6wcimF64HElvhGyx0HBd0YeWVoqdnpDGfT9GCecRY4A9GlvWPA3E?=
 =?us-ascii?Q?fJBiTF8vhA+7sNy7G4yK0ojSb9fT9g1I4CgLpGI4/y92nzytTVD7cYXDjQOq?=
 =?us-ascii?Q?UE3B+LH7wlYYy+/ds9W6rDC2CD4Xo7BYgDw9CN2K29nWNgSf9A1OF5iKaXX0?=
 =?us-ascii?Q?E28lQH51QGnNj6yX03YNkiwG3p6gB1JznEXU8wqlB9G5z0BPEtBi?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be6d67fe-65a5-4bc1-a516-08df45e95202
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB7216.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 03:00:51.8796
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UNNZyPy5ARnI/CDLaww3vNsZ+Q2k/oFYcYqC6SAXtRV2NWS0I2Dusu2QrxsatxuZIUQ0XlD3wiOe1hydySmoKMFRH3k2MsQR3JMrhI/qHqX+TCXytG4Vk6kEgVcAPLMZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11880

From: Wei Fang <wei.fang@nxp.com>

According to the NETC reference manual, function level reset is not
applicable to the timer as a supporting function. Remove the pcie_flr()
call from netc_timer_pci_probe() as it has no effect.

Signed-off-by: Wei Fang <wei.fang@nxp.com>
---
 drivers/ptp/ptp_netc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/ptp/ptp_netc.c b/drivers/ptp/ptp_netc.c
index 25f059efc831f..87cfea180e859 100644
--- a/drivers/ptp/ptp_netc.c
+++ b/drivers/ptp/ptp_netc.c
@@ -777,7 +777,6 @@ static int netc_timer_pci_probe(struct pci_dev *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	pcie_flr(pdev);
 	err = pci_enable_device_mem(pdev);
 	if (err)
 		return dev_err_probe(dev, err, "Failed to enable device\n");
-- 
2.34.1

