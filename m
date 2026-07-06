Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011003.outbound.protection.outlook.com [40.107.130.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B883E3D8104
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 19:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783365804; cv=fail; b=pbtOsPaThh+CFDcQfqp1FWTgveV+L+2TcaFAkydqLCnJM2VX7mG0bDQAdQyWX22CghMWysjczEcpojHqatlc2LzWC+v5+wl5W54lCSgpjNvrPNrLLo6g2ryvmK0227jN/qMPohgiFZOMRP0O9drC5zoFZgei6Mdnss11Z92aRmw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783365804; c=relaxed/simple;
	bh=ZsnZMjalfY1Lg5Al7fhC+a4+zf++/9UoZplq1S1ygac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Efd9hcM2IM/oh9Zxy3Q+sIt/Mu4Z8id8dM2DbVC15uFa2zSXxncXYCKK+WWdlW77Qg6EW+zifLRGgVl0ZzaAzOnRYmoC6N6FM7WTciiFcJMC4YlvjQdYk5z7PQhXtpzyny48Zk7p7qAOAE3kgcFceZCaGCrNZI3PofEuUrW7Ns0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Lz+E0xNu; arc=fail smtp.client-ip=40.107.130.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Lz+E0xNu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ni5J2u4wXnQwgZRy79iuxaIHjKDm0Q8HewpMWgdC+x+ktaKuEhQOiUNJBpL/Y+qdmSPgFAZyd15qGNht6XzaWjaFCOXJKGRNXKSXRenJF2ixgxNfcWbzB5eyTkYDVKs57cySWR4bOUodu658qImls+TeA5N75g4uuoD1atxZFkA7DsacHXYmMcXB1gc3ErFsCZmQqDvdxNfwwDH9dM8jPkoQPYUYkp9BA/FpcyptIFBHinaHR+zvI33Yi14eunPyaWh/sD6l/LRMMOeIyQ4i/7PMB+ky4nRDeObRXeOClmyZIDU1gMqVcZFM2oZR268AuKV54/sSE3Yiz1dIKQAw3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sU8wk1X8x9fRTV4gbzAyD8N+DiUn2ogLi8OpP5ps0A0=;
 b=k6Jc45j2WlmUyr1YpZsyj54R0Y/4xxz0/ycrIOfnON7Oyl+q3l2xg8uzLvW5Mti48bQfU6KKj9ihMoVKEimA3OEwdAMQGKoet/VHzjIAFckUGBvgQJCjAxOyR0xbGdpHZV+GGk5+hhwMknXHeverjzeaY24hFjwpcautWTV/J6goIxtM9Ba8X1DCYJBlYMYxpkBE1wXvo3LsGL7q6OLcgYo8RmqCg4162jC3s89cXE+qvUnseFKY4cDpF64Ka+yWD6aiiKKgbEaDux4MSqQnynVuze91u5x6Jb5b8+wnooaMP6DnA9FyEZFjZVeBENxvcYLv3s/7FlHWChutJJJMlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sU8wk1X8x9fRTV4gbzAyD8N+DiUn2ogLi8OpP5ps0A0=;
 b=Lz+E0xNuy1B8vhFb84t1ygYpyOVmbt4xe+iSa7GffOPNxZM/8ffsnhYX6Bqb2b2LQmk8uLTFP9+8YaX42qRlpqi5V6Bw4EU/37Pb0nLIM2xlqngzRI06aRB7Ek2zDDM2GXIjdxyEP24JsxH378RXW9wufJ94YGzE22+WVDfCA9VLI+YVTZgvQIctrGMScBMt9gcL0Y1M9SlKddcZEXlrTUESjsGYYyRPaW3+QVbXo0IH4SOpFMpPht9lGOD15qh/SNu8byQklzJyJC36vJiECnV4GHm1UA0cYpWkNhdMLXx+EM1MPiWEUDLpe/eYDKfZ6IEdtNhUXhcXISAQ5Sb0eQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM7PR04MB7094.eurprd04.prod.outlook.com (2603:10a6:20b:11f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Mon, 6 Jul
 2026 19:23:19 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 6 Jul 2026
 19:23:19 +0000
Date: Mon, 6 Jul 2026 14:23:07 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Frank.Li@nxp.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	vladimir.oltean@nxp.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/5] arm64: dts: lx2160a: transition to
 device-specific SerDes compatible strings
Message-ID: <akwAmzAbtg0Ejey0@SMW015318>
References: <20260701131137.940145-1-ioana.ciornei@nxp.com>
 <20260701131137.940145-2-ioana.ciornei@nxp.com>
 <akUjt5OPiO5cJ1D9@SMW015318>
 <b5lpw3xu6svsq7xmmgp3jn4cg455zhp3iw4q6lcsxq4bqy7mwh@guuitghg3xal>
 <akZYUNtEmdLp0Kvu@SMW015318>
 <jzpkcoqnyl63w6ugyv6vph3yp7fsoiemutqknqsykd7ebyw3lo@qpkzhpknirk7>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <jzpkcoqnyl63w6ugyv6vph3yp7fsoiemutqknqsykd7ebyw3lo@qpkzhpknirk7>
X-ClientProxiedBy: PH7PR13CA0011.namprd13.prod.outlook.com
 (2603:10b6:510:174::26) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM7PR04MB7094:EE_
X-MS-Office365-Filtering-Correlation-Id: 24ea9914-706c-4eb8-b8e0-08dedb9408f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|19092799006|23010399003|18002099003|22082099003|56012099006|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	4cV1LHpg+Al9zHa6fTEMYTvdMw2U9rfPkejeyUfhKa3ROqQCnxjz/8ZH09mRyOwz9uRAYyJq1+zpDXsZMAHomIn+nyO3xgiuwNVsA5F0hjIj1r5EEwAv35MZwDle+t65fHKpwe+4fOIDShW1O6Yn3L6Wh/oR1V7s/0M0WZeWD5rpVGK8eIuizfP35AqDC6gjg1toGEpRhgTBpTZfsEQ0F7mgI+7zNUziDaYklOtwapfjepvaALDe6PMLc5bCW1UrESXVOWYWHWQD4tCaWQCAk5a6eg3u6yko9H0ZZOdNc/xR0ruPUoJGbi7U3+ZYCtjZSNLMoFKy+tJAgtUwEvHzZssKpFZuyW1yQCTwUSHLQfgNGWJ00Jyc4mT27cGCHBuQo+60WTygT/GFWuMfGyAbMqwgDL2C1FwCgwnAcJkSRU3F0qTV1PTB8FWnyLhVGZmG5Pz/g4BfF1n5f/g2ysSp0H9vEfoGlHZLXHE1N/+SDDm3ixV2HIn4Wp7+pXQotvEsLE1UOeHanTy4qAbiuvC6USnlhKQ3bDDbbGMeD4nlvUgM/3rceoAjAl3DTWVY8UkCj78iHfydIQJklab42hoL1zk8wovoAN88zDMKaD9/FHiyC0D9X2uc0WKLsVW5Ne9JznSlqqoMApLHyKkXVkY1MKOmC30HgI6gSlcqV9x8eJE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(19092799006)(23010399003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Nv/YcKTtqL7FE9LD1Auv/7OwBi9LYLRupeewnqRBJ3nh+Mrk9DD2V/+GC0nD?=
 =?us-ascii?Q?Wx4QZYOFJDeU9Tsxbs6S/dkQooV0POG7TfECShaFevtA0l/Hwkxmnxh4N4Cm?=
 =?us-ascii?Q?XoFO6ja1kd5v6CqnVD4S3fPUre97AyXcJOy5aRBo/BaRdrkbkVpwUZTqMCE8?=
 =?us-ascii?Q?ddwy8CZUZ7VyJozG6IdVVKEYKFvpUNFhC30vAVOZ4UOrjxzHSQa3UGiJ/xV+?=
 =?us-ascii?Q?UCbRf7vgDfbIPvtp9Q0DvNFdd/9lv/VghonwoEotwSFz6mQ0p49POO051IS9?=
 =?us-ascii?Q?328jQ9m6PXLuTpyhkTmW+48kToWXKEY2xbDRRYdWct1oYcBoG23zSXUKQ4VF?=
 =?us-ascii?Q?aF1awFQz/z1YLq0Q5DawthvxPXxJZgmd0pmy3WwdCk2WZKk1vKbPOCXDdyTM?=
 =?us-ascii?Q?cbOszf3LfdmTWsnqAkQ1DcxI1krcOiqBr86UMHG+RBnRC0N978suoHG/kfrC?=
 =?us-ascii?Q?ojTMu7tI6pSeZB6/lQlkJ2LWIhHjY1GPtnSZKFeSnWrEv7Uvs78E3N7cax6M?=
 =?us-ascii?Q?KahJK7m09Q5vK9eS62AqKnWHOtMh/rYEKaKrYE27KDjMyG41nTn4PNsM/oO6?=
 =?us-ascii?Q?N2jqamVqvQY7//Tbw4+r/73lnA83NGEdIUQKP3F+kRul8YsI7F08Mmv7H1PZ?=
 =?us-ascii?Q?gDzQW3BBErePXRG6LRrAJ1EyWzMWTO7wMLHnjmVD57saa5jQ4kFnjbNisVIu?=
 =?us-ascii?Q?nVJlObDRiLXtKNOT0RuxvV083FFWImeKVwUtDXVNxFbW6nqL82kgfCzLUPiq?=
 =?us-ascii?Q?ehIALsTpaaYwIheGZJDQEP7bqhoLNujj6ShhQRWdNPNyKbuztO4aFUDmtJ8G?=
 =?us-ascii?Q?pu5fKx24OpYyHfKofLAAfW0vAEWhWgvM2u1xVcsveqxscgMGIwT4l/qCqM7o?=
 =?us-ascii?Q?1ikFfxqO64MGrgSL84fcLGp9asPdfQ1YGxAginz2w2PxQShpCq0ZtlPCCqQG?=
 =?us-ascii?Q?NjVbrWDq3f3Ori2eMzcWaf5XJENciSMHpSEddpdgFXMF8bmO9/spmWCTt9L+?=
 =?us-ascii?Q?4EltDAtMoI53B6rK4T1bNJExPGd3WYkek3TV6SWgd0cDS5GihNGxvOGG4kuo?=
 =?us-ascii?Q?4SsRraiDuiJm/tVM2xdjesoRrdlzyYbdoTSHHe/juq3JV+AmaUAHEIbd9yt5?=
 =?us-ascii?Q?iX9/CMBc58OGw2lPoSbbNetprm9yBq4x0pdrQ4R/y7WiIBg5+3/szKKqscXc?=
 =?us-ascii?Q?7j1AFUS5R3VgA9qLJ6WwUR4S2nmCRpZfshOx8nTa+L3bWQvNnCE9W0DCMv/B?=
 =?us-ascii?Q?Vc3RmBWM1xL5AaMbnHSMG7SSvSr0uV9XEcu7cPjP2o883pZaSCgTpIUKlKLH?=
 =?us-ascii?Q?vTvsiIviNPPQzw0VOCPD09kDUD1nnc/FfThGog3te+YY8Lhocmx8cJ/Uf3Da?=
 =?us-ascii?Q?PTOikCzY6Ymo7snAOwltoiN/RXi+GzYmdiEk7HjtbAYc5y1SHVfVJzUyg05P?=
 =?us-ascii?Q?uUUvpuwcSVyzpV2eOXY3NY/VXRpQbMqkAAMFS/bz9xG77gRN5p3v3GauYRIL?=
 =?us-ascii?Q?In0/mMerISP1MqSTk3uQMd/DdwBK0kkZ280mJcPp/QxQAg5dfAspVTZ+2Vps?=
 =?us-ascii?Q?09K8sIehGsdCEpLDdP4p8cZU0Nf/x0UqGxrhGInrPkGDneqYXcjhCuM5AWwc?=
 =?us-ascii?Q?ZovVlADfIIOLuPY6qMME3/bY6GsKjAzpK3Iplowek2ukyEpaPxBqwlpgzRA4?=
 =?us-ascii?Q?5LK+dbD1tcYaFHf5fVhkQvPH2e/33/H4i55mNFIiD2la6DIV3GYJs+ftKPNL?=
 =?us-ascii?Q?7ss/RvmeESulJQfQ/koKQW1n2+MqJ+vn7fgBOINuWO6SHyPTMxgu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ea9914-706c-4eb8-b8e0-08dedb9408f2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 19:23:18.9680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gv7LpqoitM29aKARS4zTdVI2uaoh27/Q990nJOZoQN6bo9J1F4tugwhZnMheWkw3Ukj847s69bY3GmLGOUTQsiC1irgmYnYnZj3CenR5DE22u7X6XpxTjchSN3K2XDLx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7094

On Fri, Jul 03, 2026 at 02:42:39PM +0300, Ioana Ciornei wrote:
> I just realized that I somehow didn't reply-all to this message and only
> responded to Frank. My response is copied below now.
>
> > > > > +
> > > > > +#include "fsl-lx2160a-rev2.dtsi"
> > > > > +
> > > > > +&serdes_1 {
> > > > > +       compatible = "fsl,lx2162a-serdes1", "fsl,lynx-28g";
> > > > > +
> > > > > +       /delete-node/ phy@0;
> > > > > +       /delete-node/ phy@1;
> > > > > +       /delete-node/ phy@2;
> > > > > +       /delete-node/ phy@3;
> > > >
> > > > Now, do not perfer delete-node. if ver2 is not include phy@0, ...
> > > >
> > > > create ver2 files, let ver2 include it. Now most people like A + B, not
> > > > A - B.
> > > >
> > >
> > > I am not sure I follow what you say about the ver2 files - are you
> > > referring to -rev2 or LX2162A?
> > >
> > > The LX2162A is a version of the LX2160A SoC, also known as "LX2-Lite".
> > > And the main difference is that the LX2162A does not have the 3rd SerDes
> > > block and only 4 SerDes lanes on the first block.
> >
> > If it is the same die and it is disable by fuse box. I suggest leave it here
> > now because default it is disabled and try to access-control-cell in future.
> >
> > https://lore.kernel.org/imx/20241212-imx-ocotp-v1-1-198bb0af86a0@nxp.com/
> >
> > That these nodes can be dymatically disabled it.
> >
> > If it is difference die, it should lx2160a.dtsi include lx2-lite. you
> > can rename old lx2160a.dtsi to lx2-lites.dtsi. You need adjust file name
> > and I just said overwhole method.
>
> LX2160A and LX2162A are different dies but the process is not that
> simple as just a rename of the fsl-lx2160a.dtsi. First of all, because
> the LX2162A has the same PCIe controller as LX2160A Rev2
> (fsl-lx2160a-rev2.dtsi) and not LX2160A Rev1 (fsl-lx2160a.dtsi), so if
> there would be a rename it should be fsl-lx2160a-rev2.dtsi ->
> fsl-lx2162a.dtsi.
>
> But even that rename is problematic. SerDes nodes currently live in the
> fsl-lx2160a.dtsi (common for Rev1 and Rev2) which would mean that
> fsl-lx2162a.dtsi would still inherit all the SerDes nodes, even the
> SerDes block #3 not present on LX2162A. I can combat this by keeping
> only the common SerDes nodes in fsl-lx2160a.dtsi and add the necessary
> extra SerDes nodes in fsl-lx2160a-rev2.dtsi. But this would leave the
> Rev1 dtsi without all the necessary nodes, which is not ok.
>
> In this context, I think that if there is a need to not use delete-node
> I need to come up with some kind of a scheme like below:
>
> fsl-lx216x.dtsi			---> fsl-lx2160a.dtsi (PCIe gen4, 3 SerDes blocks)
> (no PCIe, no SerDes)		---> fsl-lx2160a-rev2.dtsi (PCIe gen3, 3 SerDes blocks)
> 				---> fsl-lx2162a.dtsi (PCIe gen3, 2 SerDes blocks)

try it, let's look what finial result.

Frank
>
> For the "PCIe gen4", "PCIe gen3", "3 SerDes nodes" and "2 SerDes blocks"
> above I would add independent .dtsi files that can be included as
> needed, so that there is no dt duplication.
>
> That is why I said that there would be a lot of unnecessary churn.
>
> Ioana
