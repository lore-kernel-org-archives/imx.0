Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010013.outbound.protection.outlook.com [52.101.69.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDBB3396E9
	for <imx@lists.linux.dev>; Tue, 24 Feb 2026 20:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771964420; cv=fail; b=h93OnxhzwQCbF72McG6R+RHlo7Vm6OIFpZCqgt01adfNwBp/k0tGQX2QFF5Xc4zYJd3bpIPvvSR4phW6dPc37SUMGe4Y6bCa1xbbGOLc2nltfFqfSpXZegeHWcK5qBpVd5iV3UgNDxeGjNphlC3XyN3WNMv+2iAhhXEYqiaMYrU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771964420; c=relaxed/simple;
	bh=gowrDvir1jo71yQOhpL1Q6cb3p2hKNE6uIX+k4ZCTZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ci0D8J7lAfq1EFTqc1H1dRQxQTiSEL5gjihx23Mng62zss4AjHJTOd0BkUb3eo7PTwqgxgGbTcTR1Isgchx2xEPRauJrcXyPabJqoyUT274q0h7l15wNofSN8yRBO1GWf+NUK1ZJY2sw2cJJ/WjVQzw2vcjBLrHCmeBFMV/iNFw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=HViKbPmr; arc=fail smtp.client-ip=52.101.69.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="HViKbPmr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pWIzmC6oW/9E9KC2+lzJwru4G92PyDF6vkSenV4XT1ePwvPXYrieu+vDY9lDgvybjXFe0XX7f5IM081kjcLYC84DCYCoXd+kyBbdyGkmi6C4ip+qrv8+WW1fF+B7RnxTXzqXmJFGDIEm5ijGznVzaOUg6nFzUf1igHCCNZUEdOL+WAO2eyncMAnXHhYKl3HB7lIJ2hbQb7YXcCLEXoOU66dULHCq3ipMej13a5HAVBZY6GZxVLIpyF7TG/o2pxSUh/Fbg+Q1jrkUIDjiriZioJbh2rIntoZzgxW3x8uzNBshn1Ha6NLorQjLQo9sYQprZtbKIzoPUKJAXSUQe9zN0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=478NH7HAdte8MuXpwY7E4bNtVRswXIvfV6YWFxbbdNk=;
 b=SZocULYoeOkEJjhjtm+MOO9xocW+6JIP2MlZs0kMA10OWNa2W6o3XoZIEWLQvsPfCTEwjLMpRF0+bWuaJjXBXdOXvX0bie2Gb4lAlnPRTJWgp4C6qRze6Vx1ODHdjY1LvZp0P8IUtoQIf9Ec8P+PbXE+CgvWEHHvmImZiQnkcyY425T2oaUjT73483UjE9IUDfuGThz79cAxWdWr78Jlpt1I1Xags1nT7+won87F5vxL7sOtpvjQDwo7EMPbeaO1ZjP9fWLIDLZOOvaTiRdQ0fvvM9UFeNwh2MtTvectq++Yb/lWasi3wMiSzNCVCP3m95xP/fhtU7TAWygOL4Na8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=478NH7HAdte8MuXpwY7E4bNtVRswXIvfV6YWFxbbdNk=;
 b=HViKbPmrBZYDF6ue8PuBCjY1QYNZPAJuAwA30MfueO6AL6a6nn5HJ4jv3y5LXMZQHlRDSQ98SdfXRGGJQo9J5Lrglhpsf9IfxAk7EwrpJ2uKEfivXYD1C9LgVbMy9MUb7rYq7oYYkyi+ux1xMWX3p7dVStoIZmJBxGHbENMDMJR/WHr/pwSdJgucS67utdOHZVQ8TrB4k/GdKx4lf2opA+4CNAZ007PS1ZmnPodXyG3hxw7HNwzKMbKoifW2vs5P1UT+QeXKr3/fSAyDSDC4fhu2AletGl/ov2D97RzeC42mlELdoAtIsKIV3VqkLYWcSqSjx0Ynoeiq9TeDCjsq4w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by DU6PR04MB11159.eurprd04.prod.outlook.com (2603:10a6:10:5c4::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Tue, 24 Feb
 2026 20:19:02 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 20:19:02 +0000
Date: Tue, 24 Feb 2026 15:18:53 -0500
From: Frank Li <Frank.li@nxp.com>
To: Wig Cheng <onlywig@gmail.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, shawnguo@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	zaq14760@gmail.com
Subject: Re: [PATCH v4 1/1] arm64: dts: freescale: add pixpaper display
 overlay for i.MX93 FRDM
Message-ID: <aZ4HrSNp32lbnVT-@lizhi-Precision-Tower-5810>
References: <20260129022910.3942028-1-onlywig@gmail.com>
 <20260129022910.3942028-2-onlywig@gmail.com>
 <aXsdyzZEUaVzC34W@shlinux89>
 <CAPStFe7ASmYxJdDorJ0KAerfTH51ioZ=89F8fRcs6fBVqqhdUw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPStFe7ASmYxJdDorJ0KAerfTH51ioZ=89F8fRcs6fBVqqhdUw@mail.gmail.com>
X-ClientProxiedBy: SJ0PR03CA0065.namprd03.prod.outlook.com
 (2603:10b6:a03:331::10) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|DU6PR04MB11159:EE_
X-MS-Office365-Filtering-Correlation-Id: 30650aa2-2c86-472a-71a3-08de73e1f33a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|19092799006|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MEaaJe88KHswZ5Z2u51pDJWE8FfF0VQV59p/4l10E1mVMuOXRiEKlb+zbIm+?=
 =?us-ascii?Q?vB/Im0FbBSlW5rEwRqA2fbK8QNluGeKRpWJWXFVWCFGpd8pBvqHnfzmliTyM?=
 =?us-ascii?Q?kQzk13fslBMl/GIb4oDBnRt89W9CBU4NGc/QlFELXAC5GOGT44jIKBXlDSlC?=
 =?us-ascii?Q?ry4p9OljYcGZJ97QhUTeidpcvu2HmWeF1VNCYrzUI+1NZ3BSNAPLXO+o8Zmc?=
 =?us-ascii?Q?+8SFU41nxJO5l62ZRbt/2Ui/KksHMQP05nZVj4dn5NIxtryYBaOMZf0spAAQ?=
 =?us-ascii?Q?N5PFuT2V+w1F7/qFn+P19OhWX7b6tdTCF3FOssp6mu4DJlGG6qIfgEZqrtza?=
 =?us-ascii?Q?Gzxfl4NRaRWDm1MiLLG7IfqiVi3WzHVthBmcyewTJmN5L7c8m/qC7HeYGrZr?=
 =?us-ascii?Q?TtGced33c//xsJlAQpQQgGQ3Zq+brpbUD5X7CJVZBrwsH4o7z2rkVfqoL2WU?=
 =?us-ascii?Q?BWGc9zkoKIDnUZwTF5Fc+kkM7sx21SopQ/krJLbR/wNIBkCX4B8/A9irDXlF?=
 =?us-ascii?Q?mQHFUb3kzPzwLdYgXtiQXoQI/7HsCLSdsoM4CadzeY7veFNST0YI2zFmCxcB?=
 =?us-ascii?Q?UaL3eHL3L4CBArMBJckhIjTOsS4BvHHgBT66I2SygX0mkg+HdQ+ZzCskvavI?=
 =?us-ascii?Q?+PBm+u7A23hqdGMPyrGNO+yu0hBLhQ0rIDkqVULQLC+UR4Dgmq8TFzOKKZsF?=
 =?us-ascii?Q?sfgkbTVYdzEcx0gIo9x/CHafnzLdwvtUMYiieI+eBXcIqFanfRBgy9CJ/9pD?=
 =?us-ascii?Q?2DXXgYfPkLTZwPrJoISFa/KqIhdoQbrl1C9pzAJtO2Z2u3gzU9nNAdO6ETg3?=
 =?us-ascii?Q?WHkeTAlDH/pW0q67DTSwqnu5yGENitzbMvQeh8d23hPqGozmOza1D8YdDhCv?=
 =?us-ascii?Q?emTmILAiMvpRBckAvErBdFeTDYVqIB3YjH5WYlhT5fohy05RXZ245PsRKlzK?=
 =?us-ascii?Q?7OSX76CL/9KRc6Gpm9inOeVHQsa99ypW2NhIfaDa8Yk7gm3MEH345TXnUEoX?=
 =?us-ascii?Q?AYrbfw1U3/W/og2OziJFp0O9otanNrlVI0SUqFYrMXpO0KTTmUh3nAKCNjNG?=
 =?us-ascii?Q?k3o/VCb58IxXD/HkOKiUI0aqRXdfGav7hE+GqhK9yzsE+IDCw5j+CECCYZVs?=
 =?us-ascii?Q?lx9sByfDJJ4+IlYR7sMD+xnlyQJ0zoZj0ZIHZainNPYo0DlN2oH/qNTK0heE?=
 =?us-ascii?Q?oGrXF9cTpnnx728GcwKux0BNOmeryQ+kpsDxiCM6JajJfFRY3SSiz3EFBtHC?=
 =?us-ascii?Q?dO73EsDDxkzvA61sNf4v22rXLelkCbZND/xbwnUYGq39po7Som42uP13SL4k?=
 =?us-ascii?Q?5zFrWRVKRTRwTQsLTUMTDWe7uN3xlByTmtGkTpLYZGKgMQ7CReSS7/ihDEEF?=
 =?us-ascii?Q?huKkDKWLpUMWfbG/ZBZ/HVVMVlY3cOFPaZHwj85G8hQmsRjE9gQDP0vpSQzB?=
 =?us-ascii?Q?3RzV/wmf2blj+NFZTRxP4RmSHzNQr+BS3J75xlFyDVqtnUd7WxlYhk4Okexa?=
 =?us-ascii?Q?nbTc/K8aSTmzVNdq5XrOh7dlJ0UWFxplf0QcAl1JcPEcsKkkNKrZzf0u5BH1?=
 =?us-ascii?Q?wrsO8iyvisvDyzCAGI8QTG6CyoCAYJZc7STcqq0CxERDXR2J3+llapD1iwnP?=
 =?us-ascii?Q?oP99nuO0xS2/WJosuAUSLiw=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(19092799006)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ocb/pLqsW1yEBKTrHVwXZFkQpWiRRsnF4QUX1cyw6YZnXHQFDLLuJLCk1UiP?=
 =?us-ascii?Q?z7xdlqU5bHWtVQEDX0XTa5MdLQU3rMdVx3XjMrm6Ok7igCQAcYqIbXEYCDHj?=
 =?us-ascii?Q?dfRgLCAwOkavO8gXErlaOUXqHci8Yi1YlutosmSXlfOMNSloTL1RNSMVg0a1?=
 =?us-ascii?Q?FL6gsxtY7jvBUZYzY5K5RubRunztmtowRHHo2cmOujpKV7Me+Q4blUXjVtNA?=
 =?us-ascii?Q?qSkw5QAKARCoZ1mWNJYiQ5V401Qj0jl6JOiHrLvdUoBDutnOig8u7GDn3MxL?=
 =?us-ascii?Q?LPl4qqDXDIokrui2eS7ah2tozWpA0wd9wMKZHWeCdmMy4Ujd3qr/fCWs5YNx?=
 =?us-ascii?Q?4eTga5893GiIo254dORmLn1LBwVsXN8n7BDe17gSBpcnla50CYZZOU8IpNS0?=
 =?us-ascii?Q?xAe660w0YnylpM5i7CyRv+YMa4FSe0wbo2nDqxjITCBXOhsRxrHnZLpW0kq4?=
 =?us-ascii?Q?4QmQUdgR5EXImIJaze9kmzLqu2QotVGadIedj62cAxe78+uFx0k658Fk9hiQ?=
 =?us-ascii?Q?64O3KciJx5zVzkO/dHil/kRm4SQ/ge67HCXlbsrnzqPyEcitr63fw8s7dmGl?=
 =?us-ascii?Q?7OLq5nKegnfmvJZ02P0YEthmJYcHwSVUa0VBg/EC+qkltaqZVihgsbqjuD86?=
 =?us-ascii?Q?PvK6u81NSKV56aWgv/YCkgTeegzHO5iAbNKihaoRsymskUiQlL4sArZ68pgu?=
 =?us-ascii?Q?WmyA+RRKsmiBtQRCn3tuuzj3lOuFA78uWmSDsvpKzpuIK98Bln4VvSXIdU/J?=
 =?us-ascii?Q?VNtiXFHscBK02ev2L2to2TmxjJN9CYPyoQnC3PpLXfKXSmhCvoHpWQ4jWiML?=
 =?us-ascii?Q?doHd4e4CLr9dAAaBfR68CvbZG32gRsOpPVUj9mYLoueH6K3kPWfE4I+gWwO3?=
 =?us-ascii?Q?rgXUUArV0HShF2TV5UMAYWftbiwV/vBw+vTw7NH8+2Dl1SOtByHMCpoQvISi?=
 =?us-ascii?Q?/hMPsTtjvD7tr7OEfiw4rZBHPC3D2Wl+bYy5tZZPiV7mWfDgvimUIDh+JMr8?=
 =?us-ascii?Q?csIv3QzHea8lcyzkZAf8JV+7wbGFMbY+BgvrfSKXcG0dcdEi2/ktU/lqIUio?=
 =?us-ascii?Q?2eOB5xnQjH9lAHJWjwqg5uYpfR27+DL5QWY8E2+QZDYvWDU7chX5mhQyVtmD?=
 =?us-ascii?Q?hwIAFxV5ScVHMun3NId4mU+rBevCJ95VQH++TCiXXZ/UJ3IG74LlkagfTBa6?=
 =?us-ascii?Q?ZY9Jy1WojB0Yj7pd1/ZtvO7t0usTR2U/lO027DQchwKkO8NgEUmB8NH8xpx2?=
 =?us-ascii?Q?WKDZUjSRxre79vHF8Ttrwejg6Qrnmad52ywAXRX/vk8UgUvbX5Qr8f+teJVe?=
 =?us-ascii?Q?yGvkIKrnRKQayGB9YpBc/dZaoDGxYlczDax5lAVjH9koh5cDMRSZ5DtQlGIr?=
 =?us-ascii?Q?RHvZq6G/9YB1CfZFE1MfIvFPF0mWVuSAwXC1qyoUcRl2ZrDEZfhY2PYNZt8F?=
 =?us-ascii?Q?wwekeEuJHABhd9PG2ZTxerxzhHO2Cgqj+/+H05ZjyBPVlfhwU2aNs/to4JRt?=
 =?us-ascii?Q?43yW3BykpVLy71B6FL5pKBKsyFjgnBCgv7asdx9mAaJDWoxjI6VVsGdPNQZy?=
 =?us-ascii?Q?0magTdMzFHl1CtMV4WjogAYzYFtuol4Sb5B1ByHtsU2J3mZDm/9DgQUHclUw?=
 =?us-ascii?Q?X1qN9V/lQKaNqIhEEngIoh3kSBdJSTDy8wzBUrONsaCziSl9x/dkabR96SKv?=
 =?us-ascii?Q?YCUgXPWmAGb05HYnehZQF7aTci5rQdVKJcAPufQhM9iu5dmOWFEq9Z2YFyau?=
 =?us-ascii?Q?L0tMMfG2sQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30650aa2-2c86-472a-71a3-08de73e1f33a
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 20:19:02.4550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U80MbLkY6DY8v+0wDEhxe8KkPcUshukbQkE38SRrd3W1GaL30QViCSRLKvIM/CNXWulpPSgHV4u6umffpQaAwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU6PR04MB11159

On Fri, Feb 06, 2026 at 12:14:21AM +0800, Wig Cheng wrote:
> >
> > On Thu, Jan 29, 2026 at 10:29:10AM +0800, Wig Cheng wrote:
> > >Add device tree overlay to support the MayQueen PixPaper e-paper display
> > >on the NXP i.MX93 FRDM board. The display is connected via LPSPI3
> > >interface and uses GPIO pins for reset, busy and DC control.
> > >
> > >The overlay configures:
> > >    - LPSPI3 pinmux for SPI communication (MOSI, MISO, CLK, CE0)
> > >    - PixPaper display device with proper GPIO assignments
> > >    - SPI frequency set to 5MHz for stable operation
> > >
> > >Enable Open-EP Community pixpaper-213-c support on NXP i.MX93.
> > >
> > >Signed-off-by: Wig Cheng <onlywig@gmail.com>
> >
> > Reviewed-by: Peng Fan <peng.fan@nxp.com>
>
> Hi reviewers,
>
> Thanks to Peng for the review.
>
> Just a gentle ping on this patch.
> Please let me know if any further reviews or changes are needed.

There are CHECK_DTBS warning

arch/arm64/boot/dts/freescale/imx93-11x11-frdm-pixpaper.dtb: display@0 (mayqueen,pixpaper): spi-max-frequency: 5000000 is greater than the maximum of 1000000
	from schema $id: http://devicetree.org/schemas/display/mayqueen,pixpaper.yaml

Does 1000000 work for spi-max-frequency? or need update binding doc?

Frank

>
> Thanks,
> Wig
