Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011002.outbound.protection.outlook.com [40.107.130.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C7B47426B
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 15:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786634463; cv=fail; b=RYE4g/wEwGUhU9pvmowEhP8RTGiKmmMwzTVTghvrs8IEdAvX27WVb+1CYVKlctTeRtWTE0tOjy0Bx5Tmcb+97BhxpwAK+BOaQAHQrFqA482obY5CwP155Km8ru0R9jxUAoEbWmBE7TMaVeb4NpcOnzVpmzzpYnTiWPo9FRjekr8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786634463; c=relaxed/simple;
	bh=ElUsyZ43lShCucIP4DiEloVXfzv17YsvcEcLRzDiBCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=HUcERBdjf6r6argMFdvzE56DhzdFn3mO+5KnCG2PSBudZJuute1+U2Oc+rlbuKGxoe9o8rXYNe+ghskYMzwq/FvEDrH27DbeEsBZz8bpZlSOKa887mBj7YuWi9LQwCQzoczvXzj1dVoPeZGImRqkFmf6QgwmfhrMaaGRejD7wbQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=bYpTHBQ5; arc=fail smtp.client-ip=40.107.130.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="bYpTHBQ5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CDtHTxDkxlntc9YxycfjDTa+SdSprWvE/YjefLtIgxOORU7F5e+8Rt+tBuKHqbGPHte/oppz8TYoEPF0BtKBwo8vt61CRmKQE5BezJD5MjCH5eZOWFORvz14LmFtaM3vbYtQ04wm3e2gwSqPUesrrQi9R1FEej6fgArbN4H57dEGQxugnuuuMbZrw2TUaPBI2GHp8CBDxhvMRQaRfZBls2x/KBwlBArivc9YzDQt3s5Dplegw/PMgY5eNfBPHvF2Nh7BuoUdXQntPjECwmcxn1VWAKPQrM6O6jRP+SV+66JMhEsa7PaJCHBAzASs4cIWwSR8swYUlWG5zDNH6HLBcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ojPde773//tU2I5DjJUCOryoDICc4MfOqjZjtxbCtfw=;
 b=vUIRUHOZPkTD4mQKE6yi+4Sgv4n92pPMvnQC8+52hTCrnjRnGdYn22POpx8c7xBNqXdWlzfycxjA1Y5SXb2fbGEn4kgQnTtf2OgqJP23i2OplpOElMYcD0abFcv8b3Atd4ABj1CoJDbVu6W33vWlKWedyuPTKXtNQMWfCTBKsWblhUwBFYJzC12Y92CJgAbzJuASuRwcvkz7DzMYAEzoXHE+v7B6/3AoC40hqmlsydruM1MfN/LaLj0WtCN9FYDy8CxVSbCgYtOth9uP5FbqR8OHC/V9+JIg95tPeGS6fRn6gZEVdE4hKIXEtOqg9m3Co/HkSyomb5zwYVd3+Ddkbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ojPde773//tU2I5DjJUCOryoDICc4MfOqjZjtxbCtfw=;
 b=bYpTHBQ5HxkYbuvDAvQnne8IUecPSVuPbsRoYcJM7Pp8MZ3PUMeWHl2opFwwv7J3zoZkKOR54Q/e1lhIPr0MEkiWZmFLAFFH7a++RYRoxHv/fHoEPP3EJY56Mv79RcZFFf9xmuhwMFc56/KyfFO90Qi6tVTSnUcBD4TIONoDk4DQDcm3xu0kbS/VPmeSHBjSRB9hzXSHje/ZP9FQ/KAWMwiWQYryS4Qf44Ypg53p1nwowNzMst0wnTYtAQDN+LPOceS1YbJeCzdwJPDakXOGMOTrXFR6MwhgFhwS55AGs6p6436j7vOnjHUn77My8btKAAeqR3/5ZH53sPAJS9UUxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by GV1PR04MB10725.eurprd04.prod.outlook.com (2603:10a6:150:20a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 15:20:56 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 15:20:56 +0000
Date: Thu, 13 Aug 2026 10:20:48 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>, Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH v3 2/4] ARM: dts: vf-colibri: name the SODIMM gpio lines
Message-ID: <an3g0CsaF9aUp4nh@SMW015318>
References: <20260813140600.1824949-1-mehmet.fide@gmail.com>
 <20260813140600.1824949-3-mehmet.fide@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813140600.1824949-3-mehmet.fide@gmail.com>
X-ClientProxiedBy: SA0PR11CA0021.namprd11.prod.outlook.com
 (2603:10b6:806:d3::26) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|GV1PR04MB10725:EE_
X-MS-Office365-Filtering-Correlation-Id: 9505c336-4bcc-4926-d92e-08def94e7876
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|7416014|376014|23010399003|1800799024|6133799003|11063799006|56012099006|10067099003|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	ZF/QNF66Pv5wR+O9riHSyk/juiHu4rhqjxPiQKn7bjRcnTePTU+VyGozVpx5ySTKDozZ20flKZxMZONqLiQLPOSxIpfKie9rSpKb3wN2Uu89Xxs+TV5M/im9mJnbH4/FLpDsiq+VnwypxyT/K929yV7IgSiDRZwGLp3RqEX3NurnNpCJLZKBPdpfr6r89MCUpz6VgJHuapmN22JVRv9wSiAdPUEGeexR7sz6bxqEJ77tK7cOximIN/VU5fr6yJpRhHQ30/SgzPStPuLbgMuFeTSpOQxlVQ8sIQ2lRB8e5WSBnt8ckUWV3O8eYT7RVm7fqEkef2zpf3AvINYOkcNtVxXOxW4RE5p9LqSP/GHdUOgjDtvKeMy3AoQr2qg57tnppFtEfRUmHbLf0+ZepdbLOuudr+krA3hvA3tHbAZrkTpPhJATGbgDNXx3s2xALGRzovRCSMeyjn4V3PzalsAjkReNeZp5rLiy3ZJU3bay8xccIEsPQDt0z28OLGHDdXEN2U5RkiEXOms9byhaBISHR9HQpsV1NQ+wDwtj730Xs15LtycANlNXhJdNb176f//7nhviqQ1pKptfTTZmMLapKDgHyHve7RfjzoGPlgDAu38149N8ttE30++B9C3UJh1MluZvPJtNrhPYIH7/eKsWMfgWaahMvqM19UY9FBLOeDM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(7416014)(376014)(23010399003)(1800799024)(6133799003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0s2Gz/rPh3oAlaRaQPiU2kA2fMPCSKc4U6McZZKsdHMT+woJyU2+/Bv6mNzJ?=
 =?us-ascii?Q?aU3E2vcUD8QDjWaauzyfK3vAubJZqh0ko8gDi3TsXDT6UiuoAorXZ+IQ9pKE?=
 =?us-ascii?Q?Cjp36/aZ3tzTrupvPBS5lgaMwcYwVtVXNaFPieDjJ3sEtEe2vVwY7pSS3X5m?=
 =?us-ascii?Q?ygW4upiF7C3wrIjV4iYUZlxvk7Ta0vnZ1x2udW/zyOEYXjUYvzHYnPfWrd3e?=
 =?us-ascii?Q?JUy8ffNoM6hluAS9P+SHGnuzTUPf98U4n8KHiRqCa/fCiQXfPlUrxJUEMW2l?=
 =?us-ascii?Q?/9VdJygsaqmONrI/BKlFKZNwSOMvG1+eB8xHJI9TpsijFcbCzxK4csooE7Eq?=
 =?us-ascii?Q?VM3++LOGz8ZT5tUtMGeHCYDcdbw2HcfZEc83REmghWbHxXly6sUI91RrWCCR?=
 =?us-ascii?Q?naMZAUn0mYJzXQfW/ZNjZZN5fBRIOqSWr2XI1UpD/GwoDpD0/j3Pg5RsJxYr?=
 =?us-ascii?Q?7AOYxPfb7Vt/otevqOErXZOeAaiapjRu3WktwTuGbKJLyqmF5+uuCn+vublZ?=
 =?us-ascii?Q?UeX31X6NRhh026O9farDCfu1FEuROWWvCs4t8cOHyAsdY28Vi366p70QTGVP?=
 =?us-ascii?Q?CwbxLx2ZP2SyJgmkAiXw5GjG2Jw/lGHBD3zDaiJ7kghQR2EzYmWbAFXkODhR?=
 =?us-ascii?Q?ccwKmn7JnUqJsE7ZVrgLpKbpa1EdsVcwksDbd7iUrYsVBS8RoLh6BcA1c+nh?=
 =?us-ascii?Q?wvSLxH1NDm4aKoFiR54SjgPtO2hyReyDmhbX5qS3fUS3c9PIzfRtC199J/Yl?=
 =?us-ascii?Q?sfdqeS7qW6nmHMbaOW6AnMFGNtGrCvzR1pKKc5XOh17kP3JFvc9+p4JjshqJ?=
 =?us-ascii?Q?cZGVR7gIwQ+s6QNkxVHMp9dPX+KQfJl8MRMkZ6zKkvIhpBGNXDlYb4ueej9Y?=
 =?us-ascii?Q?ZnGlUE4ss3wXc2aNZ/AJkiXvfZ130qfwGh5iAiUrgR+wFi+OGlC7CqKGa1jW?=
 =?us-ascii?Q?62ZlhYOjqBPaY6Jmgd0+0Jrc+sDDc0vgAnNWyWDzkJHaeYBax1MKnap1F2M8?=
 =?us-ascii?Q?cFgb50C7wnJykJ9d84SRQGvhWQ7UROW089IjOnbN4n2EiMij3l7PO//XG0TC?=
 =?us-ascii?Q?8L2LlDfT4UoZy8nsD14yq/k1intXJiV36G1DIj+lUe7zxFW8S176CxiVeE4A?=
 =?us-ascii?Q?OGpTyt1VWQwXSmY8Iai7eK6T2+RV7BgrRpAZ2IExUjbSpSlujLi8Msnk2Noy?=
 =?us-ascii?Q?x5A4Gvp1NZOYVLrnNvCdCRcZft8mwNmMH2y21a3DNB2FZ70rGn3yY+k/xEm6?=
 =?us-ascii?Q?nPW1JhVuX/tRKBKWwFgAehtEUOHaECAVtUaekPcML0NYcVcDyKxXNcxdMPrd?=
 =?us-ascii?Q?DmzMU7ruw2OGnNzmWPTMbpEucojN4Vh4dsEFr4eKy+vdaMUb4gDu7RUwL0FQ?=
 =?us-ascii?Q?yIqZbzesI0dAe0gSGghYhB9tqy377LkixZg5v2zvU/oR6WhMWoS+5J2JI4tx?=
 =?us-ascii?Q?qK9/ndG54AHKYkm6NeuJg/27TFQ+CRv7krqiZOGAkKlIrr0uyw9pV4ZdaQnc?=
 =?us-ascii?Q?jJRDFQj9AY66TAohbeHrHvOxpgdSwjyX7ACNrDuUOPq66ex5ft0pNuJZZQbn?=
 =?us-ascii?Q?50757ePb/2b1JknnYhpK7KrMwSIVRYPgM4JbrPqHCWYHhpj6sCghX+TTtZ+3?=
 =?us-ascii?Q?+fivsRj3/CVpXq6rDJAze81yxvcNcadoz0wgs530FbSBwbBeeNtMW3hutxjF?=
 =?us-ascii?Q?01y59rDmcFw+gkP9Uq+F7vJvxe4AwP3tEQmnYOvDPthXUIv/KD+D/LEVdM2P?=
 =?us-ascii?Q?9L+nFpTjjxIKsn0L7C5aRIauW+3EQkr31oO53cyhzIVL8Uu4z66o?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9505c336-4bcc-4926-d92e-08def94e7876
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 15:20:56.0149
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gEA3UrmS1nULo+8hWkRI+F7ezahBboQvYoeUxUy7+eUnJGyZ/VjmmfeM4PVTJ4ZcUxL71zisX688zF+BV/RjLeDE4z2Q6nNRDzhe7h2/yUJYvMdMPtGYrAoq4c29zksG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10725

On Thu, Aug 13, 2026 at 04:05:58PM +0200, Mehmet Fide wrote:
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>
> The Colibri modules expose most of their GPIOs on numbered SODIMM pins,
> and the i.MX ones already carry those numbers as gpio-line-names, so the
> gpiod tools print SODIMM_43 rather than a bank and an offset. Do the same
> for the Vybrid modules.
>
> The 99 names come from the pinout table of the Colibri VFxx datasheet
> (Toradex 101355). Verified on a Colibri VF50, where gpioinfo now names
> every pin the datasheet lists.
>
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
> ---
>  arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi | 144 +++++++++++++++++++++++
>  1 file changed, 144 insertions(+)
>
> diff --git a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
> index 74afc7b0d74b..04b5d532b2c5 100644
> --- a/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
> +++ b/arch/arm/boot/dts/nxp/vf/vf-colibri.dtsi
> @@ -170,6 +170,120 @@ &usbphy1 {
>  	status = "okay";
>  };
>
> +&gpio0 {
> +	gpio-line-names = "",
> +			  "",
> +			  "SODIMM_89",
> +			  "",
> +			  "",

Can you move 4 pins to one line to file compact?

Frank

> +			  "SODIMM_102",
> +			  "SODIMM_18",
> +			  "SODIMM_134",
> +			  "SODIMM_16",
> +			  "SODIMM_14",
> +			  "SODIMM_23",
> +			  "",
> +			  "",
> +			  "",
> +			  "SODIMM_47",
> +			  "SODIMM_190",
> +			  "SODIMM_192",
> +			  "SODIMM_49",
> +			  "SODIMM_51",
> +			  "SODIMM_53",
> +			  "SODIMM_37",
> +			  "SODIMM_29",
> +			  "",
> +			  "SODIMM_30",
> +			  "SODIMM_20",
> +			  "SODIMM_24",
> +			  "SODIMM_21",
> +			  "SODIMM_19",
> +			  "SODIMM_94",
> +			  "SODIMM_81",
> +			  "SODIMM_28";
> +};
> +
> +&gpio1 {
> +	gpio-line-names = "SODIMM_35",
> +			  "SODIMM_33",
> +			  "SODIMM_27",
> +			  "SODIMM_25",
> +			  "SODIMM_196",
> +			  "SODIMM_194",
> +			  "SODIMM_63",
> +			  "SODIMM_55",
> +			  "SODIMM_65",
> +			  "SODIMM_45",
> +			  "SODIMM_43",
> +			  "SODIMM_73",
> +			  "SODIMM_77",
> +			  "SODIMM_71",
> +			  "SODIMM_98",
> +			  "SODIMM_101",
> +			  "SODIMM_103",
> +			  "SODIMM_79",
> +			  "SODIMM_97",
> +			  "",
> +			  "",
> +			  "SODIMM_85",
> +			  "",
> +			  "",
> +			  "",
> +			  "",
> +			  "",
> +			  "",
> +			  "",
> +			  "",
> +			  "",
> +			  "SODIMM_106";
> +};
> +
> +&gpio3 {
> +	gpio-line-names = "SODIMM_105",
> +			  "",
> +			  "SODIMM_93",
> +			  "",
> +			  "",
> +			  "",
> +			  "",
> +			  "SODIMM_95",
> +			  "SODIMM_22",
> +			  "SODIMM_68",
> +			  "SODIMM_82",
> +			  "SODIMM_56",
> +			  "SODIMM_131",
> +			  "SODIMM_44",
> +			  "SODIMM_144",
> +			  "SODIMM_146",
> +			  "SODIMM_52",
> +			  "SODIMM_54",
> +			  "SODIMM_66",
> +			  "SODIMM_64",
> +			  "SODIMM_57",
> +			  "SODIMM_61",
> +			  "SODIMM_140",
> +			  "SODIMM_142",
> +			  "SODIMM_80",
> +			  "SODIMM_46",
> +			  "SODIMM_62",
> +			  "SODIMM_48",
> +			  "SODIMM_74",
> +			  "SODIMM_50",
> +			  "SODIMM_136",
> +			  "SODIMM_138";
> +};
> +
> +&gpio4 {
> +	gpio-line-names = "SODIMM_76",
> +			  "SODIMM_70",
> +			  "SODIMM_60",
> +			  "SODIMM_58",
> +			  "SODIMM_78",
> +			  "SODIMM_72",
> +			  "SODIMM_96";
> +};
> +
>  &gpio2 {
>  	/*
>  	 * EXT_IO_0..2 belong to no device, so hog the pin group here rather
> @@ -177,6 +291,36 @@ &gpio2 {
>  	 */
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_gpio_ext>;
> +
> +	gpio-line-names = "SODIMM_69",
> +			  "SODIMM_99",
> +			  "SODIMM_104",
> +			  "SODIMM_107",
> +			  "SODIMM_127",
> +			  "SODIMM_184",
> +			  "SODIMM_186",
> +			  "",
> +			  "",
> +			  "",
> +			  "",
> +			  "",
> +			  "",
> +			  "",
> +			  "",
> +			  "SODIMM_38",
> +			  "SODIMM_36",
> +			  "SODIMM_34",
> +			  "SODIMM_32",
> +			  "SODIMM_129",
> +			  "SODIMM_86",
> +			  "SODIMM_90",
> +			  "SODIMM_92",
> +			  "SODIMM_88",
> +			  "SODIMM_133",
> +			  "SODIMM_135",
> +			  "SODIMM_188",
> +			  "SODIMM_75",
> +			  "SODIMM_100";
>  };
>
>  &iomuxc {
> --
> 2.54.0
>
>
