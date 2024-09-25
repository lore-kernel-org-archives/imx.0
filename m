Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11011033.outbound.protection.outlook.com [52.101.65.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71971AACB
	for <imx@lists.linux.dev>; Wed, 25 Sep 2024 16:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727281852; cv=fail; b=Mc5bnIEkHaXbSdAhYhWFmvKezv6JiuTvcEWpOXvYYSW+PPurLSp8qn+FwTozVMfkz4dt/rg/7fB2/2vXCn5HToQ8fp98mxrx9lZfCexuLi7gjR862ARUPXALoQSgrxKxtrUsprt9Lf8qFN0NwZtVmKSZaTpNl5V6QcdjyPnTLiM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727281852; c=relaxed/simple;
	bh=onea6KPlM1mMGDy5hN33JepbS749PVTbVUhFyPK6AQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QtsbBQ241QTGiqa55mKoXGQ//oDYFI+n2bifuEJB26bDyhGEvAPko6RkKg5FKgcpQHZIjzrg8qcw5/uWQ+ZSDkhZhO8BCbzYoAjUwnStFVzgpm9+2qgc3oGnxxxGjW9QfGAkgpbx2aR9HkaJJllMfdAWE2lxmuyA7djIzEUDNso=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=djncxuZH; arc=fail smtp.client-ip=52.101.65.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="djncxuZH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D3hRC9no3h6zB9iOPxiLZq8QI8Q7eyIYTTZ+149KhpJn4K0VCmg5wZY9ZcsHCVf2O0qV/ybaewnWbJBnY2v/4bwQB1UTQNkGrSXhLsHAmqOaDyKCZV1HWrY9eSNAtSjsjPBA3Oh874F677c3ifZHAx+z5Mho7OGlMfJOvTVt9INQQH2JPMYf/0oM/eh2kNgwwt+Totu2La+yscUNORJ9KcoYbpnXkGb4s+AL+u1hH2lhwg8KaKsSc9CaXiVv2kinn7tfBApQPWUtRnyyesvBvvtNqi/t2bJrm1hW/63oASOu+iXbifds0d5yUoTcC8cMQKYQwUOLbnvZTaasQVZdNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNCWJoA4uie2U4wWOsA+ia01onjNHQh06sTSl1uAAG0=;
 b=dAy+Wig5A6LW2ALmZdep3yqK+zOXEMr9uTg62HGogvfcXTWt5795BXN7HVVgUV9Py3lAhSfbe+YLvUQ4IxOMYLMtsA3KfRZzCPdzc35l8F3r5fQyCSWH9hZ0k5cBYCW9kfsw+7+v1lbDRkSNwpz4M2qHE5nBoVgv8s5PRKs2VriPZckKP9r7L+QXE/SFyk2jBmNYMWdDE/c86CVnxRh96a/DICdqYexMA3UIMFZvNSMHbxDuK9yQDWVFtW64Ypy42jAxruQHAaOCGf8GFbGOcHdrrozQpy/dT0rftF6SKveWU9Oj4o/SrRa9EZIzgT3lMR97H5rpt/TSiGpzjiiGrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNCWJoA4uie2U4wWOsA+ia01onjNHQh06sTSl1uAAG0=;
 b=djncxuZH3pvaz/bgfYAT6U6z0LZwPWixM9Lbqml9mgssMky9IlbpuHGCU9uZmdKNnxgRnhKxMos6870uB+f7TgduBoKgYzTq/Sl6QyFUVVcC+W2mPI4Aq6SDgG8QtxRaiBor37FY0aDfIQzx8esOaHjeVj1q1UEwmvmt0XBBtjp11FaEKyEvpoct0A3NVFcUnjXjtkvcPxf56dRz7+laIOKI4PVdSW2ZqM0LrRsztUQWBiDVBJlpYHRQBsZrt5Ex1s2+fTNkDBvIAePgZ20W9hYoMNa3ap6KHHenXtPsqZ7AFN0JLr67X5belDt58fmitzsyRqi1o1tT53JvuibG+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS1PR04MB9432.eurprd04.prod.outlook.com (2603:10a6:20b:4d8::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Wed, 25 Sep
 2024 16:30:42 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 16:30:42 +0000
Date: Wed, 25 Sep 2024 12:30:33 -0400
From: Frank Li <Frank.li@nxp.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org, kernel@dh-electronics.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Gregor Herburger <gregor.herburger@ew.tq-group.com>,
	Hiago De Franco <hiago.franco@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Joao Paulo Goncalves <joao.goncalves@toradex.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mathieu Othacehe <m.othacehe@gmail.com>,
	Max Merchel <Max.Merchel@ew.tq-group.com>,
	Michael Walle <mwalle@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH 2/2] arm64: dts: imx8mp: Add DH i.MX8MP DHCOM SoM on
 DRC02 carrier board
Message-ID: <ZvQ6qWMAEZaR/5pl@lizhi-Precision-Tower-5810>
References: <20240925001628.669604-1-marex@denx.de>
 <20240925001628.669604-2-marex@denx.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925001628.669604-2-marex@denx.de>
X-ClientProxiedBy: BY3PR05CA0006.namprd05.prod.outlook.com
 (2603:10b6:a03:254::11) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS1PR04MB9432:EE_
X-MS-Office365-Filtering-Correlation-Id: ac822f57-a4ca-47da-1957-08dcdd7f65f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|1800799024|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?zr52AwZFUl5E/ldI6JvXOuPH5guYabOZJVF8murdk7m3i62M58d4RVja9ibb?=
 =?us-ascii?Q?RqUcQ1htzQwY8hHxF+JO7F/NYvmHwX4Zxz5pS33bbAY4H8Mn/DQNhlJq6yTu?=
 =?us-ascii?Q?5p1VVxKsQoTbGn3maoKZDbLgHaclwzhwHKjSMfv/vQu0s3GqjT15jzTte2kw?=
 =?us-ascii?Q?4LsLBVVklwX0XHZH/R6iEGEE/xMNTPPAGz2C+Hui1UyjiWSpGVQkOYbt2PCX?=
 =?us-ascii?Q?V7xqKD9ytUVQ+DA6t/sMq99SEvKy5asNF1xMe9IbgzEDSMsWHBYCDxFon3z7?=
 =?us-ascii?Q?MBSIJgYPpehDlYRIbqGtRFA9b+dC3LRGSC24J1LGNjZphqZ0hP0mIz6/BMsv?=
 =?us-ascii?Q?jeOVJx7Bit91dQL0D86LzAVaD1TJBlqHtZ6unjgFjzpszfkPGqcLVjvCDaQ7?=
 =?us-ascii?Q?vZfhh2p+tAKPuLS+A/uFvNxFl+x+ELhm70hs9nWH9gdoKrEHYUaFu45lgcjI?=
 =?us-ascii?Q?bGvuxwX/CkkukeIiEbwmf/gwntv150iSdp8uV+tQ2ZG0TYn6QVGyi+77oK9N?=
 =?us-ascii?Q?oaXe1s2mG3hTrPDTpIPB8lI56ja/82aIRLCmLPsNDAc9yy9V7q/lkqb47kmw?=
 =?us-ascii?Q?7WiYDG/UNatslslU24ab8QLrmu79aNlbR/hP6EZVLbHUQdc1Rn0M7vcIu+F/?=
 =?us-ascii?Q?3FrT+O5e7pbn9PUaN+S2MdKxBcOA+aCg0eQsyfXA6b+EVCm590XFLqqruwjs?=
 =?us-ascii?Q?xuti6wpsWkk130XzJksg/E3hNk7OxFtaSdCJ6WGRjgKDuW58HR+Tk9SbiOz3?=
 =?us-ascii?Q?5EObRkp6QAUoDz18/dv95xniF710BJGZCtgyGpfeLmhIkRA/P/9gUR7My1IS?=
 =?us-ascii?Q?AOOiSllJLwGPg8jKnDYB3wP+DQbfQNgO/iPnsFN+AbT7NsjFZySAU7xPAz46?=
 =?us-ascii?Q?9SHJIFUILld1PBTl99NVnjmylWn4VC/kFmfOPZt6MDXcHThzl0xb1dKgO5we?=
 =?us-ascii?Q?EdoFFdUdym0X0c1kkDU+5PGQez+/zo3IpJymDWL8TXu1K2caHNF1TnrPapPx?=
 =?us-ascii?Q?lmzsTWai/nmFiFjLUjLcBho6r7Dwpot23KYGtMVipooOro5PpNlo3ii0oQTE?=
 =?us-ascii?Q?YbwTsGeYMooQeMEaR9xLMUVZ7AZVO3N0O2O2JKKg4u1RB/tegmL9hzgk5yZl?=
 =?us-ascii?Q?nTi7WxTq9BZAKo+qsRLJi6o2WwyKj4GYaWEBMTsk7FrJfNNI0dxtp2dh/Kgo?=
 =?us-ascii?Q?ahLS+lUNH3TPHIf2PLUUJehYj0FG09OiYpc/TfjhOEL6OYYIRxhAGXZbV7tG?=
 =?us-ascii?Q?heL3QHsAZflXeOD/LLUWGE7Hj3neJKzEQ6kGzaD7RaRxvLcF96QisV6v4bKj?=
 =?us-ascii?Q?pSJiHvM0MAayjF2swt3cB7wucVgNDeUBaBt2TukP4gww3Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?plzdN7NE/ngyJymGQkLyWeOuTSx1OfU7QtXVa1F9a24dDwRXt/nPf+F6af33?=
 =?us-ascii?Q?k/EF9YNiWn/8cUhwUV9cmJm5F3hat7B1Ahq6RWKgWdT+6WhaytBW9IxeBVzL?=
 =?us-ascii?Q?d/W5jqEIDUCT70G6Y8UxrUDJuymToopbmssbuFNSqN+gCJI/Q2cdt9z5uKBh?=
 =?us-ascii?Q?XZbqXVzaqh532sEXruswLTkgti3BX0HPKzf59AOo3cUeQjyxPFqJGndWZNmF?=
 =?us-ascii?Q?ufyaoRoJCS5ccbTE1EJaEws1fYcw/ZHZN1qLH40tv1+MpOVirwmLA1lpUdCD?=
 =?us-ascii?Q?FFh7AABD2+iWCgUoMAGLeDwEJdEoVzWriUmWDwJvsyb9F4MEjoSo7WBIpEN8?=
 =?us-ascii?Q?K/6NfCBtWPEdFogkKYNBeXNsrscBE+7XWdnRu87A2qRfcjspxPatDTeucmQh?=
 =?us-ascii?Q?F0kI5QpDDkxM+telOVOzqciQG9FoWar3HbnRqGjUYWYt+hbeM31Kiyvw8Znb?=
 =?us-ascii?Q?Z/Vz2AE814FtNUHQ8L6nSlrQOh/YKwQii8TAIv1ZzMssKmV4aJZBtvhr3HSY?=
 =?us-ascii?Q?N8dUFmQn1FqWa0EXLZSbFY9QLYMWrBCPXE2pL1OxlAPKsKySmcDSnS8aBTQH?=
 =?us-ascii?Q?RZkRg6Q1zTcDUsIWO2CaBQcEnzk4FfKup98hj6N/7DrYo8Y4P1IXFukLhIvk?=
 =?us-ascii?Q?N3CGX9keVc4wcKB4Q4KMuXGb4ZvHBWc6rw5wcz8ogD4aSQFd5O6j27Hc/gZu?=
 =?us-ascii?Q?C8LfA9K6hUPakihWwH8e+OkQkBshitVBKwBMhNwtKks4qn8A6guzrTmkg5JU?=
 =?us-ascii?Q?eEb8bmPZdqFVrrS5sQO2rZv9DkmKEfgDqzMkdsJAS6u8GD+6bJZA1NxfT22b?=
 =?us-ascii?Q?p/FSxlI9GzZD2fAlKnmDcP8wbx5Sv87uQKkHlLIWmZAm9RyUzpj9DnmojGGB?=
 =?us-ascii?Q?Cc6e/KHPDh/uC+56Yxgk3eXJho61BWv9FCjvA2i0we6JAWeWdgM5Kt2ZT8Ng?=
 =?us-ascii?Q?dKj0ej0hr3q8cygYuFtDgTTTvVCmvy9fJtXkpKD/DSXX0kqDposMbEWr9pZK?=
 =?us-ascii?Q?s9sY+GxsQMpB6fyWsdv1Sgt+i50gF8TymNwe1GhgUxk67WkFAT6evXGSfeDc?=
 =?us-ascii?Q?mJvSNQl9X8R2J/pRZvW/0fKU4tPl6trt8wuDoQRVhZxlxiDYLXa6qNzA6Sn7?=
 =?us-ascii?Q?naIhLoqt2/Yr95uBn1Fj2PGKQI9zFXMSZ0MMxAguNCfuzKW5RX8kXiDOtbAA?=
 =?us-ascii?Q?APNyA72ZCFPEU1ViS16OoKXlzCN/s+LvB/urnV8zcIlBwV0KcZYHsihEPMdV?=
 =?us-ascii?Q?W99hMSzEKjcQBu3Go92PXMkx/VnxsSNJkR9li435VYzqLGxen9jAO6xIAm5W?=
 =?us-ascii?Q?WH0oBZkJfVkwt0i8VBpDVaEDce108ADC9gvMAjIQyFIEjmM42XMdxtOxTxWx?=
 =?us-ascii?Q?snUcbgsjyf51d9PKo0M3XF+lV6sdkSq9cn9V2YA536dS5BQtj78FRhrTPddF?=
 =?us-ascii?Q?+rRHkLjUQMdG6QsMXKfAoYzMLWcqiUPtQjmISHKY7RaoYH3t6oUrcVQsd8OF?=
 =?us-ascii?Q?UoksjoEFk0pALvhvA9pvTBhzHUoAKfT3Yr3wVKqb53IWEnnPN3XeQi//VtdM?=
 =?us-ascii?Q?0cOOO/aY5S3VrxVIORk=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac822f57-a4ca-47da-1957-08dcdd7f65f2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 16:30:42.3223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FFobrrQHrs8fY30cdTXXWM+x8d3mA78Yv0m5US0TYWuqvGdYIDVaHymIlDY2d60A6lbO0ZVEl55YwBhL6MwDNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9432

On Wed, Sep 25, 2024 at 02:15:17AM +0200, Marek Vasut wrote:
> Add support for DH electronics i.MX8MP DHCOM SoM on DRC02 carrier board.
> This system is populated with two ethernet ports, two CANs, RS485 and RS232,
> USB, capacitive buttons and an OLED display.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Gregor Herburger <gregor.herburger@ew.tq-group.com>
> Cc: Hiago De Franco <hiago.franco@toradex.com>
> Cc: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> Cc: Joao Paulo Goncalves <joao.goncalves@toradex.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Mathieu Othacehe <m.othacehe@gmail.com>
> Cc: Max Merchel <Max.Merchel@ew.tq-group.com>
> Cc: Michael Walle <mwalle@kernel.org>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: imx@lists.linux.dev
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../boot/dts/freescale/imx8mp-dhcom-drc02.dts | 255 ++++++++++++++++++
>  2 files changed, 256 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dts
>
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 9d3df8b218a2e..f6b8041c1e8f7 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -167,6 +167,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-beacon-kit.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-data-modul-edm-sbc.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-debix-model-a.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-debix-som-a-bmb-08.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-drc02.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk2.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk3.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dts b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dts
> new file mode 100644
> index 0000000000000..c6bf7fd919814
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-drc02.dts
> @@ -0,0 +1,255 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2024 Marek Vasut <marex@denx.de>
> + *
> + * DHCOM iMX8MP variant:
> + * DHCM-iMX8ML8-C160-R204-F1638-SPI16-E2-CAN2-RTC-I-01D2
> + * DHCOM PCB number: 660-100 or newer
> + * DRC02 PCB number: 568-100 or newer
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/phy/phy-imx8-pcie.h>
> +#include "imx8mp-dhcom-som.dtsi"
> +
> +/ {
> +	model = "DH electronics i.MX8M Plus DHCOM on DRC02";
> +	compatible = "dh,imx8mp-dhcom-drc02", "dh,imx8mp-dhcom-som",
> +		     "fsl,imx8mp";
> +
> +	chosen {
> +		stdout-path = &uart1;
> +	};
> +};
> +
> +&eqos {	/* First ethernet */
> +	pinctrl-0 = <&pinctrl_eqos_rmii>;
> +	phy-handle = <&ethphy0f>;
> +	phy-mode = "rmii";
> +
> +	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_266M>,
> +				 <&clk IMX8MP_SYS_PLL2_100M>,
> +				 <&clk IMX8MP_SYS_PLL2_50M>;
> +	assigned-clock-rates = <0>, <100000000>, <50000000>;
> +};
> +
> +&ethphy0g {	/* Micrel KSZ9131RNXI */
> +	status = "disabled";
> +};
> +
> +&ethphy0f {	/* SMSC LAN8740Ai */
> +	status = "okay";
> +};
> +
> +&fec {	/* Second ethernet */
> +	pinctrl-0 = <&pinctrl_fec_rmii>;
> +	phy-handle = <&ethphy1f>;
> +	phy-mode = "rmii";
> +	status = "okay";
> +
> +	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_266M>,
> +				 <&clk IMX8MP_SYS_PLL2_100M>,
> +				 <&clk IMX8MP_SYS_PLL2_50M>,
> +				 <&clk IMX8MP_SYS_PLL2_50M>;
> +	assigned-clock-rates = <0>, <100000000>, <50000000>, <0>;
> +};
> +
> +&ethphy1f {	/* SMSC LAN8740Ai */
> +	status = "okay";
> +};
> +
> +&flexcan1 {
> +	status = "okay";
> +};
> +
> +&flexcan2 {
> +	status = "okay";
> +};
> +
> +&gpio1 {
> +	gpio-line-names =
> +		"DRC02-In1", "", "", "", "", "DHCOM-I", "DRC02-HW2", "DRC02-HW0",
> +		"DHCOM-B", "DHCOM-A", "", "DHCOM-H", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "";
> +
> +	/*
> +	 * NOTE: On DRC02, the RS485_RX_En is controlled by a separate
> +	 * GPIO line, however the i.MX8 UART driver assumes RX happens
> +	 * during TX anyway and that it only controls drive enable DE
> +	 * line. Hence, the RX is always enabled here.
> +	 */
> +	rs485-rx-en-hog {
> +		gpio-hog;
> +		gpios = <13 0>; /* GPIO Q */
> +		line-name = "rs485-rx-en";
> +		output-low;
> +	};
> +};
> +
> +&gpio2 {
> +	gpio-line-names =
> +		"", "", "", "", "", "", "", "",
> +		"DHCOM-O", "DHCOM-N", "", "SOM-HW1", "", "", "", "",
> +		"", "", "", "", "DRC02-In2", "", "", "",
> +		"", "", "", "", "", "", "", "";
> +};
> +
> +&gpio3 {
> +	gpio-line-names =
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "SOM-HW0", "",
> +		"", "", "", "", "", "", "SOM-MEM0", "SOM-MEM1",
> +		"SOM-MEM2", "SOM-HW2", "", "", "", "", "", "";
> +};
> +
> +&gpio4 {
> +	gpio-line-names =
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "SOM-HW1", "", "", "", "",
> +		"", "", "", "DRC02-Out2", "", "", "", "";
> +};
> +
> +&gpio5 {
> +	gpio-line-names =
> +		"", "", "DHCOM-C", "", "", "", "", "",
> +		"", "", "", "", "", "", "", "",
> +		"", "", "", "", "", "", "DHCOM-E", "DRC02-Out1",
> +		"", "", "", "", "", "", "", "";
> +};
> +
> +/* No HS connector on this SoM variant, so no HDMI, PCIe and only USB HS. */
> +&hdmi_blk_ctrl {
> +	status = "disabled";
> +};
> +
> +&hdmi_pvi {
> +	status = "disabled";
> +};
> +
> +&hdmi_tx {
> +	status = "disabled";
> +};
> +
> +&hdmi_tx_phy {
> +	status = "disabled";
> +};
> +
> +&i2c3 {
> +	/* Resistive touch controller not populated on this one SoM variant. */
> +	touchscreen@49 {
> +		status = "disabled";
> +	};
> +};
> +
> +&irqsteer_hdmi {
> +	status = "disabled";
> +};
> +
> +&lcdif3 {
> +	status = "disabled";
> +};
> +
> +&pcie_phy {
> +	status = "disabled";
> +};
> +
> +&pcie {
> +	status = "disabled";
> +};
> +
> +/* Console UART */
> +&pinctrl_uart1 {
> +	fsl,pins = <
> +		/* No pull-ups on DRC02, enable in-SoC pull-ups */
> +		MX8MP_IOMUXC_SAI2_RXC__UART1_DCE_RX		0x149
> +		MX8MP_IOMUXC_SAI2_RXFS__UART1_DCE_TX		0x149
> +	>;
> +};
> +
> +&pinctrl_uart3 {
> +	fsl,pins = <
> +		/* No pull-ups on DRC02, enable in-SoC pull-ups */
> +		MX8MP_IOMUXC_ECSPI1_SCLK__UART3_DCE_RX		0x149
> +		MX8MP_IOMUXC_ECSPI1_MOSI__UART3_DCE_TX		0x149
> +	>;
> +};
> +
> +&uart1 {
> +	/*
> +	 * Due to the use of CAN2 the signals for CAN2 Tx and Rx are routed to
> +	 * DHCOM UART1 RTS/CTS pins. Therefore this UART have to use DHCOM GPIOs
> +	 * for RTS/CTS. So configure DHCOM GPIO I as RTS and GPIO M as CTS.
> +	 */
> +	/delete-property/ uart-has-rtscts;
> +	cts-gpios = <&gpio5 5 GPIO_ACTIVE_HIGH>; /* GPIO M */
> +	pinctrl-0 = <&pinctrl_uart1 &pinctrl_dhcom_i &pinctrl_dhcom_m>;
> +	pinctrl-names = "default";
> +	rts-gpios = <&gpio1 5 GPIO_ACTIVE_HIGH>; /* GPIO I */
> +};
> +
> +&uart3 {
> +	/*
> +	 * On DRC02 this UART is used as RS485 interface and RS485_TX_En is
> +	 * controlled by DHCOM GPIO P. So remove RTS/CTS pins and the property
> +	 * uart-has-rtscts from this UART and add the DHCOM GPIO P pin via
> +	 * rts-gpios. The RS485_RX_En is controlled by DHCOM GPIO Q, see gpio1
> +	 * node above.
> +	 */
> +	/delete-property/ uart-has-rtscts;
> +	linux,rs485-enabled-at-boot-time;
> +	pinctrl-0 = <&pinctrl_uart3 &pinctrl_dhcom_p &pinctrl_dhcom_q>;
> +	pinctrl-names = "default";
> +	rts-gpios = <&gpio2 10 GPIO_ACTIVE_HIGH>; /* GPIO P */
> +};
> +
> +/* No WiFi/BT chipset on this SoM variant. */
> +&uart2 {
> +	bluetooth {
> +		status = "disabled";
> +	};
> +};
> +
> +/* USB_OTG port is not routed out on DRC02. */
> +&usb3_0 {
> +	status = "disabled";
> +};
> +
> +&usb_dwc3_0 {
> +	status = "disabled";
> +};
> +
> +/* USB_HOST port has USB Hub connected to it, PWR/OC pins are unused */
> +&usb3_1 {
> +	fsl,disable-port-power-control;
> +	fsl,permanently-attached;
> +};

Suggest run https://github.com/lznuaa/dt-format to sort node

&usb_dwc3_0
&usb_dwc3_1
&usb3_0
&usb3_1

Any issue about tools, let me know.

Frank

> +
> +&usb_dwc3_1 {
> +	dr_mode = "host";
> +	maximum-speed = "high-speed";
> +};
> +
> +/* No WiFi/BT chipset on this SoM variant. */
> +&usdhc1 {
> +	status = "disabled";
> +};
> +
> +&iomuxc {
> +	/*
> +	 * GPIO I is connected to UART1_RTS
> +	 * GPIO M is connected to UART1_CTS
> +	 * GPIO P is connected to RS485_TX_En
> +	 * GPIO Q is connected to RS485_RX_En
> +	 */
> +	pinctrl-0 = <&pinctrl_hog_base
> +		     &pinctrl_dhcom_a &pinctrl_dhcom_b &pinctrl_dhcom_c
> +		     &pinctrl_dhcom_d &pinctrl_dhcom_e &pinctrl_dhcom_f
> +		     &pinctrl_dhcom_g &pinctrl_dhcom_h &pinctrl_dhcom_j
> +		     &pinctrl_dhcom_k &pinctrl_dhcom_l &pinctrl_dhcom_n
> +		     &pinctrl_dhcom_o &pinctrl_dhcom_r &pinctrl_dhcom_s
> +		     &pinctrl_dhcom_int>;
> +};
> --
> 2.45.2
>
