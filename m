Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013032.outbound.protection.outlook.com [40.107.159.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1D8401A3E
	for <imx@lists.linux.dev>; Tue, 24 Mar 2026 14:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774363634; cv=fail; b=QubFgtH8IFPrZVevJN1TIVHxocgKVzAWnm2s/kcG3XFLQnJaEeX6heEAD7PRRWZJ43YRmhlznCDkx/K7zNJY9wKNOzI+DD9pKeZOXjOBK9oh1UX3NyxhpChsDaY/cHsL+HzmnzduXG4yEfatquffCKq+gMqgOULTWhJl15cL7VM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774363634; c=relaxed/simple;
	bh=VqXgHC2imfP0ejs7pnKEVvNKLdvGW/zHtLfxl1kpBzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ovZCeAKW08Y9SBpcSEfdfCV9wL1FO1DyVINPia/uAC0J9ajIXYYbmUeKoDHW/j3YCOOxa7PxcMVl8e/1cCKPPBXIwozVZYR3tcb0o/h3A/2bPOQyPdc+6X4xBwBpsL6hOxVBPg35VH3X4VMHFDjXYw3trt/B6ktd9By0k2lzomk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=N9ggSINe; arc=fail smtp.client-ip=40.107.159.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="N9ggSINe"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ovj0aAxBz6EB/gcbD7blrvw1ptFjoH3/2dBGJ3vLt79KElSgFNN63Q3a6MEKmNbY10FaVhpH0KtTI51dZ3BcKk71njEHuU8fZogfpGBwPm01Up7TtdqbBjM/BkdasINglGZ+FoKJcqbvRiRKBcwZowpmBbj59iC4IdeqWIQoxicB0s6FEDya7PQJHLjr/jwt85dC34AJolmpMT+zmsxWMY26MTBjpBeUd7THPRrxD4q3+Wxeqx0vygXrU4IzpG02NFZjrfohxF6Uuz3RbD8LQ7GVyQkgE1TIyRrytjThwHiwcw5TwJ2RzKo5x16w7Cqh19fGV7vO/N277CIrzM3zqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//4dXG69BfkjHlm/1bc3BTC1DThDBxKE38Q+uJjrG+w=;
 b=CWAeNVscXOBib1SC6uU9TelhzqL8/fEIhBkQg7uZV8azUxbmnz5VxQz6MF+7g+WRQ3ELGdKd/kbFlwVcIxHhWGGoILQgLvQf+alRmf3xfU7bxNw82NLbTAhRJWKEkul1T+igIj9M/Yf27Kuj/9EalwiPfBTuMvLihFnW4Pe5kV4M4wCPIu7lZhms3svroUrB417H2CkBsoaJzvlPrqRyUUzqvBow4wu42hYtW6CV5OpCEamSwe6R6z4IDnAHpTPg0I/8dgx1ijCjZBwd4FfBE3kseOit8a6o0q1NzJGt45pOSd3lKykSCsDRXb95ExHxOz2+wxs63n+DaHAJHg45fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//4dXG69BfkjHlm/1bc3BTC1DThDBxKE38Q+uJjrG+w=;
 b=N9ggSINeZ4cwqnf7fCASn5Rdr/qkq4pDsVWzxUcFbvsQ2fpX9iKICw4bsxb5v84XJFhBCv5+ZBG/915QOLcFZoRxZb9rMBxPw4E0cpnAtTVt+IRBvmqykWa69mNhrxlqFepK095lAP7wBJ11tet23YCmusH4iAf7w8r2B+AKkMZxdtrBPe5xvgL7uF2YrrFrULQot3T+K8q6ZCX25yBuKWFMhjJk0NnbsrxH70IZt4BK1kMRijuBUjsAGT561PGOwQMFyQiKkEhudrtf9d5YPdieTHLRbNBIqdellQ6JYn2pgS6oux8oezzvsTuGeqklJsVXQ8MhDFSEv3k/DxLVhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS8PR04MB8850.eurprd04.prod.outlook.com (2603:10a6:20b:42d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 14:46:37 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 14:46:58 +0000
Date: Tue, 24 Mar 2026 10:46:58 -0400
From: Frank Li <Frank.li@nxp.com>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	Hongxing Zhu <hongxing.zhu@nxp.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V2] arm64: dts: imx8mp-evk: Disable PCIe bus in the
 default dts
Message-ID: <acKj4sWpzyAYExrK@lizhi-Precision-Tower-5810>
References: <20260320090353.1483418-1-sherry.sun@nxp.com>
 <acGN-QsB65Kbs7Gf@lizhi-Precision-Tower-5810>
 <VI0PR04MB121147DEDEA2B8058666867F19248A@VI0PR04MB12114.eurprd04.prod.outlook.com>
 <VI0PR04MB121140F94476DBC9D2F845ADC9248A@VI0PR04MB12114.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VI0PR04MB121140F94476DBC9D2F845ADC9248A@VI0PR04MB12114.eurprd04.prod.outlook.com>
X-ClientProxiedBy: SA1P222CA0110.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::22) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS8PR04MB8850:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b4fa3eb-f936-4e2e-45cf-08de89b43322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|19092799006|1800799024|366016|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NXBn0P8FiuoN00P8UIN2lbFb7SlflW/CuF6LENam087PZXa/C1fq8OXg5Dl+fAg0TV/LfLW1UY1c0RWrh9Jg6c0ZlahlJHcfriNMDSBfqOxytKkKekqvmyh/piz33cp/G9uzVDYAWFbXoBU3IMSckXShWuo3RiBkgnDSU0BU2Dfb4MwstR9/gjUoJYNC5DsSp/lC4UgRGGDtmfGI72u6jJuyJJW4FuLHLfcjyml9WqDR6nxNcd/vcz+9UxWspZ+KN8sN2+Vdjl1mCybTeVmbkkDcWipvBWr9rrZ+QVjWyLrWvDWwkh/5L6GwGtBYXSrsy24Xa2maxeLRgs3QvVo5xfk44O6iUtnqDcplkkcgDJBQNgjguj3FWbF06HkTD4bGn+D/xbtBXGUKZGqucruaxjL29kRidDhnZFY1yZySamfapD2RXu8tv9eVIRMiVXXMuqqp0hTC+jBFe4nxutcanWflaRvNgULtmPysh5q3cDQd0DoikRxx29ef3tvJNzWkUheDVkc42zfgTb7ygo9J4LB27baH24dR6ETK/5P0MIW9O2mfadGlI+VwB3hw/xMU00VFRL5QE/pvZffZZ9/k/Rn3mBpQCU3igAV8CKYBEMZRZOpUtUsR50heciVNrjJtEy9oWRv8pVCYKkZmV3sOynlXLCntULNTaGuoN5ShsCxjNleFUS+q7bED4RleWf5RIf///bpGEU/R2FIfkPcpxQ8rQC58F5FoI/ZDqN+sJ6jVIlQ6/7gxu5x/uSMJDN1gMoumzpKFIBvkt6KEmvzQG8a3D2R16g1lp/AL0TMwpG0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(19092799006)(1800799024)(366016)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XxWKKug4jVtGYuyLW/sjKxZVO8u87BXgbd2ZNb0MyKzGhU1KzFw5HgZz+cH8?=
 =?us-ascii?Q?s7KCQSH4182lrlc6KNgBECLcCCvsGM4PNp3w49Zmx6TYFqHTDV76tmNUlKip?=
 =?us-ascii?Q?szWwggzR1xTQn6GU9VK30aXLIG4cZrvNXoJzMz7+SnsrPvnLCgJleNLltY2f?=
 =?us-ascii?Q?+uRjMVINRz3btsrc/cLOuT0jS9qy83r244Z+6yHh/m+JLjFrsjIcm1jO/oEG?=
 =?us-ascii?Q?hdcQzeSs03pM7MpZjF7P/FPZ9oHA6053nu1y5DowOuqe4MD9qOstqjCWtEsW?=
 =?us-ascii?Q?bAITaR33u4z2Nn8aEyilFhPSaouj2hyODDYutU1iWX7h2DtgpR1Ga+5/E/Ca?=
 =?us-ascii?Q?hLF7U+c+Cp62E9lFePGwd3enQYHPijhiymWwC9O1xUr+y3p9L5qJVRmtpzbo?=
 =?us-ascii?Q?+7zgXmMQixasBLUOgOUn/XpluJBpntyTF+ji/IsAOXN1LJHJF4TiDzjrrSX9?=
 =?us-ascii?Q?KzWJPWTmap6A/Cc7JaQEe5spQ3C2D5IoTzHJx2aOSLEt4fSci7KKs0xz2TKQ?=
 =?us-ascii?Q?wBbZiEK2dHSsL/rXlJQsLIDlH3B/3HqrzX5sOPVAgszvg2ctv6RMcAUFsfx5?=
 =?us-ascii?Q?YH/UYmCaG19XMkyf4jlsrQULIqoRrYrm9oCXTLG8AMVmWRdYM6Ff4jXDiSZ1?=
 =?us-ascii?Q?++RO6p7hBafoVyFyvyCOm7EvWjTkRNmrN2LSu38f8Gwb9S7MD67NH/GSyaMW?=
 =?us-ascii?Q?L1kG4eWeU59d1KYeUB+IbGcOiyhmHLd/wQVkY7c9hJMzj2Sfhfkl/pFbL+n1?=
 =?us-ascii?Q?QX8EiZqqle4oFB5eeVLEd7oOhMyWmFG1alQMAjeNnjbsO9XExt1+2ziLGyr2?=
 =?us-ascii?Q?1WVK7EdErQy8uk4V6qmY4s10PfG9WQYObCBdMyXaSlVZbwfYPWXjMV32lSss?=
 =?us-ascii?Q?VMi2a6Nf4jLtZ1H2o9xmy871SCXMSwa2buK7FTniPgyttn4Ywxf6iDcKIYHX?=
 =?us-ascii?Q?Ttx5m2qVPaDgKmkwKJkEjom7+qm/JgRL84bjRRAMJEhbMgEZ21dTIQRlfkVd?=
 =?us-ascii?Q?bvhqUQ0M/0pPlQFeF/ffrnJmblMe9t6f5YUTIoHP+HSlnaKYigOnqwG5lYkR?=
 =?us-ascii?Q?iwG96Ye0EuyWrR69GTssRhrL2qk4V3aE7GM7QkmMVedrAgVC0n0Gh/6pPA/x?=
 =?us-ascii?Q?UOzXRWL/fA37Xu+ZddAy8WPR/b/s22/cQCW1Ax+NSvYIZypr+/u3RanK9Khj?=
 =?us-ascii?Q?pj9pqDKUw0N0etwC4EhmFC8cokBOSZAO0ko8cqGhEs0UZxmJ5YwrxuUFTJ35?=
 =?us-ascii?Q?lkcAV6gmTPEU/p2jRn+yOXm00qFOSwmWgnmVdcbAOShqwWHbjXvV2XmB/A5C?=
 =?us-ascii?Q?A72rNL9ZS4Jt0Ego7rMFi4+XlFosghgEtWgYzpH/zRWrwOJabH9uQGdksZlZ?=
 =?us-ascii?Q?oSI2R2VG1tg4TZ7WBCAkoj4Dwul9F+zy3bvOtQ/qBpPg9XxRBTQLuhxXbiIS?=
 =?us-ascii?Q?vCrE+Hk/Bg6zESSHstvHbxShcUOfSIgiXtZQRmv/XWrpg8ILKDlFT6MZ6z+N?=
 =?us-ascii?Q?9LIPSa3XoBXE78dN494BWOiOMcQhbXCrMM+Rd7GfnB8XlbEELYfS4sqoGvjy?=
 =?us-ascii?Q?t6YfshiyIsNpr8HHu11gx7fg80qFhB6C8H9YLdb8QM6yr+V/dmo7a0T2KinB?=
 =?us-ascii?Q?0faL+u3xyK2Pd8Lmb9ptFGrOBow2TfnVHkY4Y33mb14j9zQsktiYVyIp6kk/?=
 =?us-ascii?Q?qGt77YTb76ah+PFUER5IF7I6CI9mAw6Xi07O8yCUo7r5+kvr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b4fa3eb-f936-4e2e-45cf-08de89b43322
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 14:46:58.1449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G+ONkNfGNPb24l1Pw5RgdUAgf0h2CTOLH8JC9RADqw8kXxZw9CM6REcbLCxFd2gHeYn/zTLBSHPYlW6le0yOPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8850

On Tue, Mar 24, 2026 at 02:45:39AM +0000, Sherry Sun wrote:
> > > Subject: Re: [PATCH V2] arm64: dts: imx8mp-evk: Disable PCIe bus in
> > > the default dts
> > >
> > > On Fri, Mar 20, 2026 at 05:03:53PM +0800, Sherry Sun wrote:
> > > > Disable the PCIe bus in the default device tree to avoid shared
> > > > regulator conflicts between SDIO and PCIe buses. The
> > > > non-deterministic probe order between these two buses can break the
> > > > PCIe initialization sequence, causing PCIe devices to fail detection
> > intermittently.
> > > >
> > > > On i.MX8MP EVK board, the M.2 connector is physically wired to both
> > > > USDHC1 and PCIe0, however the out-of-box module is SDIO IW612 WiFi,
> > > > so enable the SDIO WiFi in the default imx8mp-evk.dts, and provide a
> > > > separate device tree overlay (imx8mp-evk-pcie.dtso) to enable the
> > > > PCIe bus when needed.
> > > >
> > > > Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> > > > ---
> > > > Chanegs in V2:
> > > > 1. Improve the commit message to clarify SDIO WiFi is the out-of-box
> > > module on
> > > >    i.MX8MP EVK board.
> > > > ---
> > > >  arch/arm64/boot/dts/freescale/Makefile        |  4 +++-
> > > >  .../boot/dts/freescale/imx8mp-evk-pcie.dtso   | 19
> > +++++++++++++++++++
> > > >  arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |  4 ++--
> > > >  3 files changed, 24 insertions(+), 3 deletions(-)  create mode
> > > > 100644 arch/arm64/boot/dts/freescale/imx8mp-evk-pcie.dtso
> > > >
> > > > diff --git a/arch/arm64/boot/dts/freescale/Makefile
> > > > b/arch/arm64/boot/dts/freescale/Makefile
> > > > index 780682258e71..107ca270ef32 100644
> > > > --- a/arch/arm64/boot/dts/freescale/Makefile
> > > > +++ b/arch/arm64/boot/dts/freescale/Makefile
> > > > @@ -333,12 +333,14 @@ imx8mp-evk-lvds0-imx-lvds-hdmi-dtbs +=
> > > > imx8mp-evk.dtb imx8mp-evk-lvds0-imx-lvds-
> > > > imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0-dtbs += imx8mp-evk.dtb
> > > > imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtbo
> > > >  imx8mp-evk-lvds1-imx-lvds-hdmi-dtbs += imx8mp-evk.dtb
> > > > imx8mp-evk-lvds1-imx-lvds-hdmi.dtbo
> > > >  imx8mp-evk-mx8-dlvds-lcd1-dtbs += imx8mp-evk.dtb
> > > > imx8mp-evk-mx8-dlvds-lcd1.dtbo -imx8mp-evk-pcie-ep-dtbs +=
> > > > imx8mp-evk.dtb imx-pcie0-ep.dtbo
> > > > +imx8mp-evk-pcie-dtbs := imx8mp-evk.dtb imx8mp-evk-pcie.dtbo
> > > > +imx8mp-evk-pcie-ep-dtbs += imx8mp-evk-pcie.dtb imx-pcie0-ep.dtbo
> > > >  dtb-$(CONFIG_ARCH_MXC) +=
> > > > imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtb
> > > >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds0-imx-lvds-hdmi.dtb
> > > >  dtb-$(CONFIG_ARCH_MXC) +=
> > > > imx8mp-evk-lvds1-imx-dlvds-hdmi-channel0.dtb
> > > >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-lvds1-imx-lvds-hdmi.dtb
> > > >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-mx8-dlvds-lcd1.dtb
> > > > +dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-pcie.dtb
> > > >  dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-pcie-ep.dtb
> > > >
> > > >  imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33-dtbs +=
> > > > imx8mp-tqma8mpql-mba8mpxl.dtb
> > > > imx8mp-tqma8mpql-mba8mpxl-lvds-tm070jvhg33.dtbo
> > > > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk-pcie.dtso
> > > > b/arch/arm64/boot/dts/freescale/imx8mp-evk-pcie.dtso
> > > > new file mode 100644
> > > > index 000000000000..4f6546d442bf
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk-pcie.dtso
> > > > @@ -0,0 +1,19 @@
> > > > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > > +/*
> > > > + * Copyright 2026 NXP
> > > > + */
> > > > +
> > > > +/dts-v1/;
> > > > +/plugin/;
> > > > +
> > > > +&pcie_phy {
> > > > +	status = "okay";
> > > > +};
> > > > +
> > > > +&pcie0 {
> > > > +	status = "okay";
> > > > +};
> > > > +
> > > > +&usdhc1 {
> > > > +	status = "disabled";
> > > > +};
> > >
> > > Please use one overlay for both imx95 and imx8mp to enable pcie0 and
> > > disable usdhc1.
> >
> > Hi Frank,
> >
> > imx8mp has a specific pcie_phy, I disabled it in the default imx8mp-evk.dts

Suppose, you needn't disable phy.

> > and enabled it in xxx-pcie.dtso, if we use one overlay for both imx95 and
> > imx8mp, is it acceptable that we need to keep the 8mp pcie_phy enabled
> > even in non-PCIe usage scenarios?
> >
>
> In addition, another difference between imx8mp and imx95 is that imx8mp connects usdhc1 to the M.2 connector, while imx95 connects usdhc3 to the M.2 connector. The usdhc interfaces are different, so we cannot use the same DTSO file.

you use addtional label.

for example

m2_usdhc: &usdhc1 {
	...
};

in overlay file

&m2_usdhc {
	status = "disabled";
}

Frank
>
> Best Regards
> Sherry
