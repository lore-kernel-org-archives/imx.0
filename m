Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2082.outbound.protection.outlook.com [40.107.22.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE34022626
	for <imx@lists.linux.dev>; Fri,  2 Aug 2024 19:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722628585; cv=fail; b=s/toPGhNb10pi2c8t1B4mEYNCc8rcpL7u3yZL7uXie9XvzVAe7zvUIiTFral24wC4J2Saee5rQeLmeNsbW4VOyz5mUF7w2MflgMhAKhMgNhqnrfq0iSGrHeH6mmaH5BaKOE6RYBfNjSMH+ywNiaxylBWhrP9D1Z4MauXbDWole4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722628585; c=relaxed/simple;
	bh=kZW3/SSAwCO7iCxh3B+tMRVQ0epic7Vjbndh+E0qSH8=;
	h=Date:From:To:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=eTA/qcFHtWQysOKUYxyGEXUR3BZrGZ1tBGnmDDN4l6mpF4sO50pkHtbNJDfoomC4vD07FXeAthOn1nP8qk/faJKzJefqm1DbjxbaOurXsnbxGcKv9lN8K3azZ7A7H4eeINOsxwpKn7mA957YaKyIT4WHGB/H2ksJcQFNZ0kot+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=XmKD12Bs; arc=fail smtp.client-ip=40.107.22.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="XmKD12Bs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PyAeL0RqUii3+7hubkzMeN7mbcXtIEpZBcQ93TQqupccq1nOjHoeCuf8jnKn1U0y5FB4+AEFT/nQXNacezOsa82ZuBm6sHRJ001iErvj9lIW3FsWWRm9aWAx11d+niy9h8CD1EE6gxjep/sNZOMmDkpfGtKtRXfbL5uahu8iV59qCtrzCzwySUT770/cxhb1K1Iq8j1KtGD67sm8gYTefwaVRK0Sv8tHIWcLbBFrX1iH6U0D0SZOb+IQJi0LoFPhYX87Qp87esbbkuG7VWhs+u2oNkaW3eaecB5Q7BhB97cl0zGItwI/yXP3/KzAhzENFBsLlAbv4Kt3XZBLsmWvpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/+jh9HQklA/o9qs4d7s4QQLNOWODOrTiV8tE2sYBn4=;
 b=ftvjg1Hd5zb+qgopwZULxyGQZRfXXNNoqyoy/LvX9rVi6lsGXeseOiwXHL4SQXflqEf3pJbDq5iNP7/KM1XfT+kNLxu8ayxN9tmWxifk1P+WVdc/ZUIYNDbgDXrUWhUofzxr0MW3S2raA6o3zfEwD3qHYgbPu7mpu0Fj77eDpMdv0fLPlx43O8a6Su93mDHlLXBLyWhCvtmj+k5m+gOg04FgR69gvhx5BYzh0HPHRDjUaXtghU+du/lz8oS6B/L8wgwC56FBiedheGaWpnXkBr/gUWZYMJbCbEZkZxvnJEnWCmkB2Dy6eEUWCHaNJo1aom/I1e55WQEls3CFWISbSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/+jh9HQklA/o9qs4d7s4QQLNOWODOrTiV8tE2sYBn4=;
 b=XmKD12Bsy0HZSKXCgMBsTaMVIZtx6UnWliBNXRwbTZrxPYn6pP2QwpuHqJwDYU42NfVO0BhpVW0tdONsCUaP0rO1WjLitBIjitwVT/IncotErTUxl7FBTcF8/wLrYaFx+8U+nUr0inJ/j8G8uD1KsOzKuBgfMwcMPpN3ppThrBm91IDMvqNWbtWc0NacqPVJBq4wA2jZAtZE65hAONsgnhk+5TGumt6BPhJca07CXoAj4MilvExXLosnY5/A08hDls4fuP4wMtUYMnZk6ulIWpr+lMQkeq4d8kdaEOFxFGovT3NdADG2E19Gm1wmWjJi5nanPtwlX6t4d+l3kwL6vA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AM9PR04MB7569.eurprd04.prod.outlook.com (2603:10a6:20b:2d8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.24; Fri, 2 Aug
 2024 19:56:19 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.7828.021; Fri, 2 Aug 2024
 19:56:19 +0000
Date: Fri, 2 Aug 2024 15:56:13 -0400
From: Frank Li <Frank.li@nxp.com>
To: robh@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
Subject: layerscape interrupt-map warning problem, may be dtb.py bug
Message-ID: <Zq053X7eZG/8blYM@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR05CA0196.namprd05.prod.outlook.com
 (2603:10b6:a03:330::21) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AM9PR04MB7569:EE_
X-MS-Office365-Filtering-Correlation-Id: 86d1c71d-9358-45f4-d93a-08dcb32d2d42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cktiy2bxStvBzzWwztRxM5OhmAxIfO8TAMtSO2nGQ2vAmsnSuA6AAxDjoiH2?=
 =?us-ascii?Q?CaWjGg3INnAKhIC0hU0pNbd6eHjz5yZF3h32hQCjHqG92Q7v948bmiuduwxA?=
 =?us-ascii?Q?ZFOHRsX67jT32YJld2w2ZKsJYpD5kDCgN5Ymjee7O+223mw6onn2L2EkkN8w?=
 =?us-ascii?Q?GiVH0SDZl4sYlJQOAZtutaNO0PVnGe1DtX9hFfjUZG0cQpKr4qCPMcoZDayd?=
 =?us-ascii?Q?Y6xeWmDbbAz5r+PG+2LN/VNjSzr9x+bApeENOQefE4EUKh5WknnKpPynKhPh?=
 =?us-ascii?Q?MhvwlhE8z7csUp0R3R7QJVJrT4H0CRdMXBdUFOBuou1CMJsRzInfdlKrn5Zn?=
 =?us-ascii?Q?344QXBPmUHu5eDXUNjhsyVP1jtvLmlrwEvDNZNTn7CeCNAjouSSzElBCkLqX?=
 =?us-ascii?Q?Rrkrq5sjZSCsTsaTwvpYhDZB2WVVusKHNC1vfCc0uhyGo7qVqj/WGZJbLUfH?=
 =?us-ascii?Q?uRD3waIUHID5hAnHd0EkU6HtSSZnJypw9T+epm/TehD42q7As+c1In0aQ4CH?=
 =?us-ascii?Q?2DEYvLD6ZgzX/WAURJ2mlnzA9NpajuQeBt51orfSC2OfSfX+gwNc7T6viMBm?=
 =?us-ascii?Q?RNCjhrk2qVurnXBPoCknJXRjx9cSJTLLYpUU+J8uJn87rNFX3h87yGy13vT3?=
 =?us-ascii?Q?I4jytcGmkoDAbI6eSIDU94gJyEsqDhaJK/hNKbPHxHt9ZeZaXkAyBURkVbIU?=
 =?us-ascii?Q?CRi3L8HOjnWUQKgZc+dOBfEOGYuEdzAFH1hptfnVDnyH3c6nvulA9dmzNr5i?=
 =?us-ascii?Q?yiRNH3e3yODSwzfFF1bgWtIwhWZCN5q/w3irMkbBHuLqQY9j97BaM4l9kPZM?=
 =?us-ascii?Q?nYLtNb30z9Ioy/63YR6KoEwnpq/xV8URFjMu7cjC/4Gch97jnNLuynAABVjx?=
 =?us-ascii?Q?shISxc9wrmyPvDFa8eIAQ9FaHmh6SYxo23IQ7jQ17RtZl+9FMNeIuazmNZ9/?=
 =?us-ascii?Q?MCxfMRpFYNGrYQS+kgMg95BNHT4PDER+Yg6FUAC0mDcy3si06y/OqA/DLeLz?=
 =?us-ascii?Q?mw8OEF45BixbgPWfwrOgt2Q3zj7tMeOO05ZQSSAv71nMtw7zQwsjBzy73oUj?=
 =?us-ascii?Q?EIo6ZoLDeWhWBuFM9nRrPD6gwcH7aq5dXHImse8rfrXi+vGuZpY5I1I9n1s6?=
 =?us-ascii?Q?48hen1RhgWWEwnPsHK2oaZSTAu07x3rw9hJdgjmAvkaH2MxLfLZYOWxENWrN?=
 =?us-ascii?Q?sU6t5K6Ik/QTzzzYJ5DnCKwHP744i/j18kGRuYapVJpd3yPNErEsormCTLv8?=
 =?us-ascii?Q?lQuVmtKU1xqIUH3oOWzaDUOUOfLT/8KX3sRTkNvE+LF+E5iEC+TTHZb3XTSe?=
 =?us-ascii?Q?sxmoe8ApyDki6n4vkbDA62KGCtiSq4iG/flQqXj0Sig03FsuiIn93TLJ48cy?=
 =?us-ascii?Q?OgmLjc+0N0AqwFp7tL8rXW8u84/NLOMyaNHHbSsr+KWuNpiTjg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TGAc0SEG8PQIBVPWFP9XJrrr3l1cijMdfqRAJ1N16XYg9ZK/A7B4foFEb/2H?=
 =?us-ascii?Q?d9Zj0qS8ANu7l+c23/aNegBR77FbCQvrcf8Mo/q2X0E4yQY+RiDuDz1rW2Wg?=
 =?us-ascii?Q?DcIuI8/3ihAcR1+1tZWoQzo6bM/Pxl3bSZgwaJMDDK70TfsVQi+xeJ9SDX89?=
 =?us-ascii?Q?xo5AnwVbfJLLIwcGoiDSLzhN6IDndCyYHesulQSZiaioFqZ3CJ+Yb+i3Ffp/?=
 =?us-ascii?Q?qL7O9jqx2HsfbVAYjqh891UrzRhpAfmDBdQgILMc+nP0KI6NDp9O7n1jYh1v?=
 =?us-ascii?Q?J3s7i0j0gA4M3CIG06MvH/rYGc4Nqdji06kMz6xbpNJsABFJh88PFLI2UQr9?=
 =?us-ascii?Q?aQDmM6fqJH/Vc4KL35bmEk6C6inoY822oj8yfztsTk+tM7qCnp3FSvZFUMRW?=
 =?us-ascii?Q?VTmLuuQ6wMMhk/yx5ReopY/l78Wf2GvDxRWawkg0/eIneFqCbqamB95ZyqPs?=
 =?us-ascii?Q?s0EaH34R54fl1W63AF//mBEFbOv+wabJDQF6hy/MY90hvN1Vr+edbkaT1cOS?=
 =?us-ascii?Q?Jq96uPLTiyeuQEg2xhgB4Tc1Ezr53Mu78b8GcFu85dZKIp3OThTu6R207Q9K?=
 =?us-ascii?Q?qUjLMoSj9QP0N40Zn2ZsuhJOX1hlhmYQE0lLjn5QZFusbGav9eLIM8hMfa2X?=
 =?us-ascii?Q?l7TbpdNJA+UFjcOF8WJfq1eTPbqJ5AL8hWceVsNMDuwxHWZPA2v82QKr/bzI?=
 =?us-ascii?Q?8J6hWVJbENEDmMN45qNvooe0AKxXmXchUoJJJNJ1GGX5XwXb8yYGIIEP2R+5?=
 =?us-ascii?Q?5JaF0fIQB16lFnIQmZLW7bX62tDtwifK09qeOLA0Ksl67cuWjoqPAs0L8De4?=
 =?us-ascii?Q?RF5zCfh/73/B3CS6mUW/JTjtE5kWCl5f66Fxlvg+q8zNj8j1DMpEo6YPh/gc?=
 =?us-ascii?Q?Z1koafMODRRMHrAUaALaB610fJJg6zyUruKAPE1J/oBsLdmBaqSLz+uNW46F?=
 =?us-ascii?Q?GpIOd0thdIY8dbfFtUmBNeDogE/OTVSKRT3iumBSSZf1z4s7p9u2giwl/gP/?=
 =?us-ascii?Q?eOVwaEoMCFXoA1yyruEGLsLG6duDhzd3+CI1gttxge5UmV1GWXLi1Lw3zmFk?=
 =?us-ascii?Q?WCDTGpA4WkrWN8PpTqhHSmBu66cQtNrUWtYA3HAXnx5FEtubh5ffALJFuF8V?=
 =?us-ascii?Q?WoZPXxsFKjBqOLL2AaHaWlHuqxhked+Pg4nmK2TOzwCajieoTLcSMPt1CD6B?=
 =?us-ascii?Q?7p9amhFiVV2i32PbolnZbDSiYK4EfTQcj/QqdHbglBMN2NjBP6gmAd3yGXRG?=
 =?us-ascii?Q?N/KygM9UFvsWNWL17+YOS8+1N9WBqGXdyARKYc4FYZlVmtov51miTcQ8xMe0?=
 =?us-ascii?Q?UUP897vBh+eanfXfYSaUjviCGPfVcP36pAVLVig3x2yZm2AmM0eEE0hjE2d8?=
 =?us-ascii?Q?6pQbZVm84085pTjH+mb8EQG6EkW+WF+OFjzmmRq0prpX4fFhRirp1XYP0qra?=
 =?us-ascii?Q?Us7ES5gJUfag+c2ydaOGeClqHHaq5lbjEMRX6BnrhjNvIn/o/E9DiYy5kRQp?=
 =?us-ascii?Q?cyOW7l91UeOy4XOTG7oD0r+yifyHn54dWX6ao/7DqrUqu2cO1CVbGFvoBHwm?=
 =?us-ascii?Q?XicJAwR59ZLn2vPtJ38=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86d1c71d-9358-45f4-d93a-08dcb32d2d42
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2024 19:56:19.5136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OkkyyDDU09DIocp/SLnF6KBfzMDN4RJWulZUNopDGvVkVpy0si7whc74rNv3PGt+TIRRgIstcTT2YXSfRrr6Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7569

Rob:
	I am trying to fix the below issue

arch/arm64/boot/dts/freescale/fsl-ls2080a-rdb.dtb: syscon@1f70000: interrupt-controller@14:interrupt-map: [[0, 0, 1, 0, 0, 4, 1, 0], [1, 0, 1, 4, 2, 0, 1, 0], [2, 4, 3, 0, 1, 0, 3, 4], [4, 0, 1, 0, 4, 4, 5, 0], [1, 0, 5, 4, 6, 0, 1, 0], [6, 4, 7, 0, 1, 0, 7, 4], [8, 0, 1, 0, 8, 4, 9, 0], [1, 0, 9, 4, 10, 0, 1, 0], [10, 4, 11, 0, 1, 0, 11, 4]] is too short

gic: interrupt-controller@6000000 {
                compatible = "arm,gic-v3";
                reg = <0x0 0x06000000 0 0x10000>, /* GIC Dist */
                        <0x0 0x06100000 0 0x100000>, /* GICR (RD_base + SGI_base) */
                        <0x0 0x0c0c0000 0 0x2000>, /* GICC */
                        <0x0 0x0c0d0000 0 0x1000>, /* GICH */
                        <0x0 0x0c0e0000 0 0x20000>; /* GICV */
                #interrupt-cells = <3>;
                #address-cells = <2>;
                #size-cells = <2>;
                ranges;
                interrupt-controller;
                interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;

                its: msi-controller@6020000 {
                        compatible = "arm,gic-v3-its";
                        msi-controller;
                        #msi-cells = <1>;
                        reg = <0x0 0x6020000 0 0x20000>;
                };
};

extirq: interrupt-controller@14 {
	compatible = "fsl,ls2080a-extirq", "fsl,ls1088a-extirq";
        #interrupt-cells = <2>;
        #address-cells = <0>;
        interrupt-controller;
        reg = <0x14 4>;
        interrupt-map =
        	<0 0 &gic GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
                <1 0 &gic GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
                <2 0 &gic GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
                <3 0 &gic GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
                <4 0 &gic GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
                <5 0 &gic GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
                <6 0 &gic GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
                <7 0 &gic GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
                <8 0 &gic GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
                <9 0 &gic GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
                <10 0 &gic GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
                <11 0 &gic GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
                interrupt-map-mask = <0xf 0x0>;
        };

the binding doc
interrupt-map:
          minItems: 12
          maxItems: 12

*The key problem is wrong split matrix

[0, 0, 1, 0, 0, 4, 1, 0]
                   ^^^^, there are *two* data more than expected 6.


in def fixup_interrupts(dt, icells) of dtb.py

if '#address-cells' in phandles[phandle]:
      p_ac = _get_cells_size(phandles[phandle], '#address-cells')
else:
      p_ac = 0


I am not sure why need check '#address-ceslls' in here. If set
#address-cells = <0>, or remove #address-ceslls in gic, this problem can be
fixed.

But I think it possible dtb.py bugs, '#address-cells' should descript
child node's address size.

Frank



