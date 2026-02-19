Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011029.outbound.protection.outlook.com [52.101.70.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6D7222154B
	for <imx@lists.linux.dev>; Thu, 19 Feb 2026 19:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771530372; cv=fail; b=q7/1V+n8ThCQ4uLJ55RbywhIgjWzjdLBC+WL6YWWkXmW7SA2HxFTpQSzk5fAj9CY15uGyxhpEYGcaVpbdfi3bYpYtbxV4ZIFBzpyoKXvJvTHVmisQ/PiGZMORe24i5dpfLqiZWDk71X4LKTQWec/W5SvopmgxqeyCRRBNLqn7E0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771530372; c=relaxed/simple;
	bh=l05llze0I8L0e/Vn+YvNIcG6ItZbTM5gRgTFQrtEf5o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=hAbvCGnDof45KIVh5f7293h3Ao86Re7sF6yINqPqQluPU5iUhuAdSaDxMyc0Pt1gkHDgBLBEIXhWL1lb+BgrfKdXBFbCxGKS1BPwjYVDtIo94D5F5jXNYlW58wiZeM/8PPE2Y0vYwz+fO6c6JMlJzvPeib8neEXkkwNSu9E8EQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=A7srBHeq; arc=fail smtp.client-ip=52.101.70.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="A7srBHeq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hd5DR81dzVXN1suVrnkM28ElfpL5IgJj70cgittDii/oj782JhdLVPIplBit2OaKmMyVDKZIDnHfIxymbA51gCFaOOhHVuOMgxbAVuzDwcVBc1Hd2gbeEDLHSmzrL8FwDVQ/2W8tAW2zRrUYpHzPbGrIrwNPyvd0FWasqjoi/4WvwKfTZUrMvqNUjMB470Mj+BkyEz3Uc+Sayi70cbc2dRFSBVkg6/l/ZPGOXWggKiuXCF7buuGQ7vlRJTvqcPeGb8F+vYYI5eqC/OxTcE5RTKeWRXZejFOpmHjBgWSEUnFFIPQ36HMFVp1A765M1BNd2HwORz1apb+BNavrhCBn+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l05llze0I8L0e/Vn+YvNIcG6ItZbTM5gRgTFQrtEf5o=;
 b=gVu/1rW7kwDZg+WP+F3w9ON7aul/P5UQVd2Fl1xggOYfp45yUx+BOtB+2C93bSbmMmd3PKirOAdnIn7/R99hWvh0fgxgP68pw0shnQ3fkh/yUg9fDuEKjp7f1zdy1NRhgXiJCBxpmi9zxvOD9xffVKf6Qo2v55FMANBmudJdrr8N7GvgzWMxA4PcvlPYOr8nKK1A/nI0G7qdvQUOryypkFZaoIMTT9k05NINrIMsy+oil9+89YlFlYVig1MaPvQLDWS7YcOI9SxlIcUdIYIje66v2ZpCgYwrxRGvemxpF3wBrbPsDf4cTPJIqPbFA4WGDYn2dAOPN7eMBPphPD0QCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l05llze0I8L0e/Vn+YvNIcG6ItZbTM5gRgTFQrtEf5o=;
 b=A7srBHeqH9PYYWEWnYTQmhmWUUkOMstMME0z4mq4NcGQfMlEzCMHdZCtPkpY82YAfJEH+PZrijevpwZGQQTgaiQ01gYZX8eOnkPIBjmLSr64uTl9cDp/Xsl9OCMeu/AuM4HYbSUURJUS1XBHeljETUj03sS+d8IDlT4/M9z8ICD7Y8d+W9tO2mJHBXuxqTX8anedWO1+Hbqp8+b5IuYqke7QKmgmxVBjopNcz6QnmaVMLS6jNSsxuHeA+469bfmU7P66XDzSU18Ay4RtAFcHHizJ+8Xbf/nOetZfpBZVAkeB4Z3YJ/ZGqjkwk1DSxmtzJWmPO4AYtkRvrIQlLzMGrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by AS4PR04MB9716.eurprd04.prod.outlook.com (2603:10a6:20b:4fa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Thu, 19 Feb
 2026 19:46:06 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 19:46:06 +0000
Date: Thu, 19 Feb 2026 14:45:58 -0500
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Max Merchel <Max.Merchel@ew.tq-group.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] ARM: dts: TQMa6UL: modify for use in bootloaders
Message-ID: <aZdodgOZcM9Nzh99@lizhi-Precision-Tower-5810>
References: <20260218132339.32157-1-Max.Merchel@ew.tq-group.com>
 <aZXw76CuH9u8csFk@lizhi-Precision-Tower-5810>
 <6c001865-c8e3-4133-bf10-46384fdaf511@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c001865-c8e3-4133-bf10-46384fdaf511@kernel.org>
X-ClientProxiedBy: BYAPR01CA0050.prod.exchangelabs.com (2603:10b6:a03:94::27)
 To PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|AS4PR04MB9716:EE_
X-MS-Office365-Filtering-Correlation-Id: 88a04f1b-4e4c-477d-1b00-08de6fef8557
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ueKZSNnVi2VozeQyZurdi5fvLCUL3EadhQzp2C/g4LbxZl8+itFhWPFNG1b3?=
 =?us-ascii?Q?2HrghB8nCXeeHxg+3lzHQgacrF23cPukSfmIofCxexwgukaEQKYcsHwJk6S2?=
 =?us-ascii?Q?gvNaMZVjxK8XLKMOgiDPfRgdE9lq09nadMD7lqAF/LPPRbpDB2rpeS8WtVM6?=
 =?us-ascii?Q?LcQ0vjCCsbf1y1kAwNZ1hgEn26ythy7aKtjZsYBdPQfpMUbZopi69VjSSlE7?=
 =?us-ascii?Q?Sm3r4Mwvgy2Tg2JsF6Tz+xg2JVRO6wWvb3I9vuvIqQxuvZQCk162VKCc2YeT?=
 =?us-ascii?Q?kXWlpxE7ie16QpHO9Q4J8XqkqBz6Dk+9hWjYO31iRDWV9NyUC10jCiJ+0jZR?=
 =?us-ascii?Q?+4uw8IUCyz/fCyeIIvvx88noFpxtLVbqSdI4G1kizMMAH6CY0NIAYe1+v8ct?=
 =?us-ascii?Q?FaAaPzZs20Y+Cu6z8wxvrU1FggA5P8na0LDwz7RpeVykHOfU/Ww7AdUK1iYM?=
 =?us-ascii?Q?0vqPH1usxid4XKYsjS6RuX2gDDIM03/I0S9D+O43IBz8BD8vC6x3IyJu4Eev?=
 =?us-ascii?Q?+EK0aXkw8ntry3kHRYtoDXh5qyvV2TkpahM/I0VCPnRJhbS8k0tV7iTxL9u1?=
 =?us-ascii?Q?CroDHzH/oX9ubh1iVm0de80MWLN/F5ZFrPn659h6rhc0bFk8Pd1aSW4wpCYA?=
 =?us-ascii?Q?Wx+tjwlpKHhIljhF9kSWKjDJQgeN180Bs2qBcJWAUUH5AcQ/NZrz5aBLlbzt?=
 =?us-ascii?Q?5knyevYPkLR7tte3VpwMjA20zgHGU4gM33QCJhlVrCyBlTbqm92J7PCVQjz9?=
 =?us-ascii?Q?kY4tgz2OortLOs0ujKiQlF+oZoVuAah0vKgjzC5xPv+/6quqrk2qfP685cKB?=
 =?us-ascii?Q?RHyVldnUd+Rd5fqc+rpv7mJry59TiZjPAwi1Sad6WbtX6d3FaQ9Z48lN7C0s?=
 =?us-ascii?Q?hAKmMnqbnCsBD4rzyMgs5CCFC4znoD1gyqVJG2pJM5A0zZvTEeO53WTrMZy+?=
 =?us-ascii?Q?pO8xBC/xv1MZX/zz9MzNVN+l1mK+NOTrcF8SQCzM02n/F1Qr2PXvi6L6Cphw?=
 =?us-ascii?Q?c9SrYYnihUsHXQgRXFc+5eriAKLDNpMLrpEvOrt9JUneg5rm5leJw/z2Otf7?=
 =?us-ascii?Q?J2Ubv+8HYwVqBXbcdbA4K2wwkDq6xDNM/vLq5LAOtTp7JoAy+EQCy/Q5PPC5?=
 =?us-ascii?Q?yJZKp1RhbHB9cRPjwykhwAi2JXZtvieG2/drZC1hynBWdzth3Q3eBWmHXFke?=
 =?us-ascii?Q?Ml1Z1+SkJulgVWREGj3uLuqNvdTD0EpR4s7HFZEW/MVdhgrEUbDKtNzuOkLK?=
 =?us-ascii?Q?QxU7q5R5Y3Af4oPnW4kL4HaEFbly7Zw+NOf5Qrkqyl7qulAUa7uk47eFj5Aa?=
 =?us-ascii?Q?FczQIEFpBLXXICgm/60bYCo7UJsoZeLffGSE3HAQSI/1i7mGzaRViYm/TmWA?=
 =?us-ascii?Q?pMpnd7Dv9tGqDFIzIJ4c/il8I5DBFNN+HdTcRGARkJoZiSkovGdelmcxsE0H?=
 =?us-ascii?Q?VtPC5EhaArh3x2/rHN56jEKY8Woeh1XsvGH/VkZCQBh242fHlAAfvpvnTXS1?=
 =?us-ascii?Q?iY5AvHZOvvVRjGw0FegT4am/7/RNaJ+ercB+C+K8AfrVx7NNhFqJD7x2/71N?=
 =?us-ascii?Q?xtLPShaJxmYDoa03+sgor975KeF4k2ebTQt1bI6BhA/OBKGnbuISjrfA8Bnc?=
 =?us-ascii?Q?mbR2JSrlNpG93fig2o07NJM=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7hK5sOewtU6gattg2ZLR8LaYCTW5ZTT3sy+TSr4A16gCt5u+A94K4Z7OBDfF?=
 =?us-ascii?Q?0Nhg1mthYVYZ4+Ngkn4mARAuiSALoUKkK7AOil1wXoQqOH7R/7hewqsNVPs+?=
 =?us-ascii?Q?awaAc/dUr1cU9PqNEpcdd1t1qAzLijQWZ6GeDbTkRt89VHEuXt/KfoZpKCEt?=
 =?us-ascii?Q?JUbC/BrZbd+z4L/Cg6BSGD0BoriMBaOmk8b7mTL/zJcSz+tZMcgsMaAf8Qoa?=
 =?us-ascii?Q?IMUQZGtemLOnuI197lgcdrgx/PZktMZl2C5nhGD1MbFWi4rWTTOeyi/YbGJu?=
 =?us-ascii?Q?8Q2sCPLUQoXAUASZAbfFT6cv+SDgBT1QUlRfl4DAbEAB8y5hyS6fl0Mu1X9i?=
 =?us-ascii?Q?NvLPrrTV4AZ/aUJq+hvTxFqD7DqrUJPywuXuWzJa8dkMbfhh/TRPsuPRmHFY?=
 =?us-ascii?Q?hf0QPFtrIIbMhkevTTJFotxKAZAbhs5QNT4WObjyzOhhmnofHiGXg6uOWqh/?=
 =?us-ascii?Q?4pDV1ILSI8FkULg0nwgT5GbTtEHMQrDRVSVKkbiKx02v5Xp2uZ+0YpImFXlU?=
 =?us-ascii?Q?vvW0v4XD2r+OVw5oq7mIlNtqYc04BA1KNzR2LxQDDGpgMoCU6F6odhKF4R5L?=
 =?us-ascii?Q?vq7uq3YAsdbFT2stV/sTBHXS6yNxWN7cnjTNolbJd6n6jJWZJkdVj4AbGDCC?=
 =?us-ascii?Q?4ogBkTa0HWeYwNUf+l3hXuI7v0e6wyfcJAXhDO0TTAeeVKmS6mnsC4UMDgjQ?=
 =?us-ascii?Q?JNnQyvlCpmYk99paxJzqMvIkDGaDxksLQHrww+VG7tLbSwegpX/mFzuko2ca?=
 =?us-ascii?Q?cycU+4oFTB4WjWbxvD+4GhOUopNqwtCjcIQk2dZztIu/JokbQKc4OobzoIz/?=
 =?us-ascii?Q?+7b0KzLPoaWhba4DRh1l1wu693wqk0dlVeqq1DFtK2K5ZvRbOr+Eq67259j+?=
 =?us-ascii?Q?I5TXmXef3HrLKgtA0epfREwwtq/v3qBsLlCBHlkcZThd52FHpDgcA3Ntn/Pf?=
 =?us-ascii?Q?J/7Vv/D86OvLZgM2cfbaCYQhQwnnYWxdRp+8OtlSS2K4iU+tKgpvqSpoT4ln?=
 =?us-ascii?Q?dil+Kpx4mAlucSO6TDHNtLe+/BdqWrQNmMBmO8CPmAUvG+2+cTmpcKCTEycj?=
 =?us-ascii?Q?Pu5vn8/j17q3CJlMkPWSNizvkUeT3hnupvCIrXggxxOkFINsJ7kZUiKFi04G?=
 =?us-ascii?Q?m/2tMeNyUqPo0q5cgcOZIWLkm0qZDawGahwcjYPyhRiOfxRG30N2reG59a8Y?=
 =?us-ascii?Q?hiZDmNrnqfTI0lxRl0PeDdZ3uAY+X99I3Mce4YHbgUqUApoSlTjhEVM8x6pG?=
 =?us-ascii?Q?fkrYg+uaAAeaXuDju1/jljcRWXtYCap6RqVj9EzDOmi7T9SuEVIk0sLsEqho?=
 =?us-ascii?Q?VblHiv7L6ph9kbXOe0HQYCWtS7ijbGIZ/HsF8kMtLwv1bQAUcuYyXf4OfK2p?=
 =?us-ascii?Q?RSgBraLTuubcwIskmviwIjtHJmg3hKclQ+oW0r4VU2bdzz41RMR157fMrMcL?=
 =?us-ascii?Q?Bq6by6N5pNUW6KsTmoY7qFXoXBxZouDd3Td0kue9jnjFNEnY2B3c9qwufJcc?=
 =?us-ascii?Q?mBLmeDYnK268vLinS4iNqApBrgNPQfbDcSPv/kOMLMDhSRST93e2Dh8az7US?=
 =?us-ascii?Q?dQCU6qFj+9uQhGV9KrWyUjQLNKvP2p+xqKlVChCJqsxwkj0o/bKHq27TQQlb?=
 =?us-ascii?Q?+A9vFSc05i+sgdEqzQi7TAmIVJxWrrF6w7Aee9/wMz8SlCThOQElMHDWeiYJ?=
 =?us-ascii?Q?o1YsSlxbz8ivxpirpTn7XesG5+B/8IQzxEMfYhBjlYu+wOQc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88a04f1b-4e4c-477d-1b00-08de6fef8557
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 19:46:06.0107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t3pijpnh8HVFybTu48MvANRde+3t+aycxR9BL+hD/F62tojsplASyDlMvHvlseZBXhlzvfK8iT8UIOSRZ610Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9716

On Wed, Feb 18, 2026 at 08:44:17PM +0100, Krzysztof Kozlowski wrote:
> On 18/02/2026 18:03, Frank Li wrote:
> > On Wed, Feb 18, 2026 at 02:23:33PM +0100, Max Merchel wrote:
> >> This series contains modifications for using Linux device trees
> >> in bootloaders. Changes from U-Boot bootloader are incorporated
> >> directly into the Linux device trees.
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
>
> Hi Frank,
>
> Why are you giving review tags instead of applying the patches? Aren't

Now merge windows, wait for v7.0-rc1 come out. Still waitting for other
reviewer's comments. I leave tag here to mark it is basic good to pick up.

Frank

> you the maintainer which handles the patches for IMX?
>
> Best regards,
> Krzysztof
