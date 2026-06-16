Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013050.outbound.protection.outlook.com [52.101.83.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C6537DE9B
	for <imx@lists.linux.dev>; Tue, 16 Jun 2026 20:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781640345; cv=fail; b=DsBpFMDTttrXUFYXwcqyuMFCATLgVgP4btZUaHbRUH6Lfcs51V7KvUpPL4fRPNOonjrusHIfH34JhPgur6vkHrcu9Zvgt6/+BoMW4kqSM0r+Tiqj+khmSduIh0zPoaG1wmiyD/M/e38F7LmHWNN3xJwAJVSNwoR4LZTRMALpfCU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781640345; c=relaxed/simple;
	bh=fTY0eNerYN27C3yy4o/+IQHXoSs4hxvfssBzGuOK1QE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kmJEUn88BjGrQYT5oyHbjVeOWipyg+Geva7I4jWxyH1Gy9iNeXY7yQPTDXUEPjQuSwpovTQEkt+0j28YC8FwpuiPn9tLhnswJJetChSLHNMwcRAzNr6KS347JT70J9sFqZ+TcGGlCzMy+8B4Lg6/5LT5hRIlho4b4x3v2mxQFWU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tC84T4/y; arc=fail smtp.client-ip=52.101.83.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tC84T4/y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jY/TYeo+L8O5YxjF8Yey0mvilfAlABEZkyGN+q8IKdrchQ6ccnU0r0v/BvksUXVrHWoBK9Sq9djfXj8BhhPDeL74WUWbss1ZDLhuW76RAcaG+d44YQNqNErYTKemu+2Y3MmOrvRnlRE1z0SwYyxxOe9oesAEEcRpObx5aIjBOm+vXg19LyHcy6FnH1jv5RfZ2hGVwkX3lSw9LgkIEhUW0PYUZznAu4qpkHReX+TvAQqLesWAu30nU29htnpkUQAGyJbn49IVb05ANDMpVvm/sFGvSdPj2yuafvRBTZAV+bw88SdInxnRqp5Nswl49NcbtV0PgyJeENHA70yeLn9bAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JtgtpSY73X06kWZ12u3F56RSEjsP7QCcTSrGkKIKgR8=;
 b=w9Hjhh9Gwx8VUxSB/cD2OkQKwX8Hkv1gk/cpv0PyhDAbelQltp5NB9yz16k0TLCMCZZJMX+Kd7GW02lHke4urmPtwUlax7KCtU3dw3jUDudA7C661HvPf0kgtHpLcA2BASE8Ekq4uzDPV76AuaAVU/JMn/+cTT5J5HzA5ZJApB+NZIUubXGG89RtjqZ2tGEjMWPEHZ0eVmFffE64M//aze/VcXcGKcZTGfOGvKOjdIWqzLuwMFfTsVCM6o9uMvQTzPYexpzQem629OvqioEUXi/nn4/Wm7+ZSB9Rnyl3tPHv4gBWPQYpUSf+N/ISihtjhQ5ldqjaOKtU4fIS4hcQlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JtgtpSY73X06kWZ12u3F56RSEjsP7QCcTSrGkKIKgR8=;
 b=tC84T4/yIcdTdRtDBmRzHqkaMvfBZJl7bEKQF+OIdWU3Jg8rEipSU6TeTZl7vv5kq/PG/RO4Yl5PDr7FEKXy7YsaaTCaFYBn4GUe5EvLDmeXhnHtixTQvqHcPUP/QFwGfP9L9Gv9gpMT5kI9ORXz86ogYNkV/Coj191RAwGw9ZeWc9w42wk3j+Wcum7WtqBOMJSIYNH1SGA0wzeYfcu9TE3yCrr3a9LqkCL30rIAt02vne2SAPS5j1uS2YSBIVBpYaDclxuuTl4CRR1LfP7FPrFW+6mrC2eHHDX+AfCvA4SYz4YkEXXr6J/1SHLUDQ6R6ukhWd+WBiTxjZBw7kkMiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB12037.eurprd04.prod.outlook.com (2603:10a6:150:317::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 20:05:40 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 20:05:39 +0000
Date: Tue, 16 Jun 2026 15:05:30 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Frieder Schrempf <frieder@fris.de>, Pankaj Gupta <pankaj.gupta@nxp.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/9] firmware: imx: ele: Add API functions for OCOTP fuse
 access
Message-ID: <ajGsiglUUbDTIxTh@SMW015318>
References: <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-0-cb7f3698c3e6@kontron.de>
 <20260616-upstreaming-next-20260609-imx-ocotp-ele-v1-3-cb7f3698c3e6@kontron.de>
 <ajFtkysqxuLV8GgF@SMW015318>
 <cea74ed4-1003-419e-8da3-1c62b1ace726@kontron.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cea74ed4-1003-419e-8da3-1c62b1ace726@kontron.de>
X-ClientProxiedBy: SN6PR2101CA0011.namprd21.prod.outlook.com
 (2603:10b6:805:106::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB12037:EE_
X-MS-Office365-Filtering-Correlation-Id: 00f28881-2fe4-4202-b635-08decbe2a32c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|19092799006|23010399003|366016|1800799024|56012099006|4143699003|11063799006|6133799003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	jFsA7tii87z3XxO4WoZBsuJ3vUByhlA4iRXOfmA3FImf4/V7MNNA3dFFoMCzdKyfMcVRidpGJ8wdn0zPH6N9y+U2yaYCZ1fP29ZLA0055e0Pb9GW3A8kNQl7oQ52SyTvvsoZmuNeSqDx2Sr/oR6L7yzi0pB9OEgGiRv4BJQ0fERrD34fJnj6MRwCUTzCgqiC2K8N061PyHV74nuWrbkzLqMoz5vUQT3QNBd95KHmbIBq+j7oZ/Xj9lb0owNRLRQYB7HPuogLUbjSWuQZ+UjP2yCBAP/WAjq2Lxit2uZApD/HMVrejlXHi+4SyyHh+IcC0h+XKF9uI0CMsqhvIIAk7ODwFEeTwayI4kw/x8gUsTBsojqsRKgqnyftOEKp2kbJ7wZiyY2SSHZILtxvtyjqhKORTO4dULIMaVkhc0yMj72yqywZ084hcNN4XD/1EkGvAXT5T1DYLUVNQcKjfisMnVCjiJkMc34WbbOLojDOT+D64PufaNpqtPhIbpa7WRMuhEwMLVDdaXCFL2npZvKsvAw0+2FK2exPAvFXzbbTHRuFDscmfCt9xbJgmE6Mid3NFiw4yoo2gpofj2xfkI7Q4+eil+YLHQhEOydIRZwP5pN8I3rInC/nFXH5vT1wQxxaL9+BUNomW5AGVFNRMShEgESKJIaWeds90H0uhfIeCFagGC7Z5//SdDx8xVSSP/W8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(23010399003)(366016)(1800799024)(56012099006)(4143699003)(11063799006)(6133799003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZnFnCrVwi7k3oINSOT/t6xfiLI+ri9cjYlOMBkKmH/5bcAqjQwH5zEZseOzt?=
 =?us-ascii?Q?gOZLBNsa9PYmrsW8HJrcFZSziwKMdm8hGqqsPtkWxdMUC8YysZ+J3p61doY2?=
 =?us-ascii?Q?7s22B7rPPZdE1HfTWDG5fqKk4mX48oDSDyn0oIlc/gic09jwcOVuuxuX7nkV?=
 =?us-ascii?Q?Jue7XQC3L1sbv1D+kkVPsGdb+B/bmDX05sY+LH+2ebKKCyb+UNUevdy9Qo2b?=
 =?us-ascii?Q?47N2AA1EfmYhG7klyX7Z9fj8ed1bp9GHPs4HakQbIWOG29Ar3IY9HZ4yGsO7?=
 =?us-ascii?Q?QLJeOu0q/6yA5QuHItljKH/Un9SV+Qz5DZ0TjK9U5magrYrbn2Y8rsAy7ZjK?=
 =?us-ascii?Q?hL3yQU5LYTqhnwIMVCd2m2erO/IENDorqUkftel3VOhf+0wmvJWbh+u0m2LM?=
 =?us-ascii?Q?anaJkemkOz4bFNoYv7Fb9bndzql7skjaKSLuPKyc/2rFMSCIirpJDymp4cho?=
 =?us-ascii?Q?xhQ2F8jeZjon6IdkBplM8vn0tb+CtoR9zesH0qIwRovI1fpibep2roZTyixt?=
 =?us-ascii?Q?a4e50VJCI+xkMEtKcve5z6L1+H+Fl011DOcqXq99xDGVvW0I6RXsO9ZZ3edp?=
 =?us-ascii?Q?1IkuvS0PRqpdC2oIIbHJ6uQnPNefUkwDqgsAFEU/mzSm0kvGPhEnm9CVkwcp?=
 =?us-ascii?Q?Ul90IMk08U2jegr73aGSXe/K98Zml0r/U5LeF9s8ld2HRCBmgX0bKKZaCwty?=
 =?us-ascii?Q?qITXyzFTKa9Ia/4/hNnmfo1CgIX37bkY0meNVNgxQbD5DTxjgQ6iG+pd0/B/?=
 =?us-ascii?Q?IM0UB/vck2Jbi42Fen9oJDdQMwt1cxeaHAdk4ELxsLU7jZ7swoUZlxbzBxQs?=
 =?us-ascii?Q?gW81l4uljxvW96SJqyAzLQiEM4ekwE9SOrceZsEJU/NPt1hEFu1QzPmiTZ6z?=
 =?us-ascii?Q?ZtiS9d5kmA/FG2xfo9rvVL8pN45fCtXbWpwwkqghOWqrr4hvkW93GQcao8y9?=
 =?us-ascii?Q?qa5Scf5+i3FTMyfalNnCsAsJfolncTcdFqbDuYbg78jstkVYUAr+pecyJWgl?=
 =?us-ascii?Q?6ineayKkuP1G7qv+S5H+u51zB6kQciWg0E7PvhJgtIS/Big4IqmXhwCeyPp4?=
 =?us-ascii?Q?hspBxvAPKiRYgfoLu4jpLZMOfnt6DaZjvuB/AmJXZ2qvr9zUIVorZJAYvGV0?=
 =?us-ascii?Q?eqPiybRVikzR7/92AaxBq9JZTWZiwjmFWtNNUqYjAFgesFMz+agcX6HN3209?=
 =?us-ascii?Q?LESxlhmnCENzGLfSSXl9EPDf8Qf6TCJL0tryo7i9hdABUmB2iKBRILi3AajW?=
 =?us-ascii?Q?GaNWrnTcT0bTUrdJG5UNAvJAREum7sbX+o2chPLyz7cwFlUt04KfyTF+dMka?=
 =?us-ascii?Q?LPLe6J7FkdNt/EgpUCuOw9q0VN19EI/daY7No4VzNM79xInP9MHty0yNcijC?=
 =?us-ascii?Q?CL94DddgNpPfcvhv/YeTptThRojiWuFIKklg4mlMmbETlkUYVxVL+AzZO4WR?=
 =?us-ascii?Q?qVUkRTmFURCNkyRTdvyHQV2EiEq5WJvRHotusj/r96TNpm4eXoeLMM3Tyzb+?=
 =?us-ascii?Q?Itp+2KDCf6EkRg5m3RLrmjHeghuM281z7ZLURqP4r5nwtGQsObrHDNwbY28O?=
 =?us-ascii?Q?/kVn9YknerjWiU5V3BV5BPVW36mxJFfdfpf24MeDIDoZEzgg2qpTwA/uPtYw?=
 =?us-ascii?Q?93x8eQe4Sr1CUJOz11B2lJr73ccC5N3t7mHlDfpSZswxdWqs2TUinQ6dJKdp?=
 =?us-ascii?Q?G35Q9Z3cAiXSmrd4IeLPgGZbTrvR4OnTxxwt5gJZjbeQPkJvgeIvWPBZyJNV?=
 =?us-ascii?Q?bUL5WulFAUTQr0+0OZYOs+5xR+bOCgIrXO0bLKnGWzWnzsBh42+C?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00f28881-2fe4-4202-b635-08decbe2a32c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 20:05:39.7052
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Vnllz9tCuNRFBN4LOjAl91kye/ve5EmGNE1sVqvkZYYmGJtc1SLne7GRStd+Ody6rivrt+Vw+h0dMPJUDiYIV/PBLCf5k0gaxgxwhI6M6CwLK1sc8F4uINZoGZz+zTU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12037

On Tue, Jun 16, 2026 at 07:59:54PM +0200, Frieder Schrempf wrote:
> On 16.06.26 17:36, Frank Li wrote:
> > On Tue, Jun 16, 2026 at 01:52:18PM +0200, Frieder Schrempf wrote:
> >> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> >>
> >> The ELE S400 API provides read and write access to the OCOTP fuse
> >> registers. This adds the necessary API functions imx_se_read_fuse()
> >> and imx_se_write_fuse() to be used by other drivers such as the
> >> OCOTP S400 NVMEM driver.
> >>
> >> This is ported from the downstream vendor kernel.
> >>
> >> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> >> ---
> >>  drivers/firmware/imx/ele_base_msg.c | 122 ++++++++++++++++++++++++++++++++++++
> >>  drivers/firmware/imx/ele_base_msg.h |   6 ++
> >>  include/linux/firmware/imx/se_api.h |   3 +
> >>  3 files changed, 131 insertions(+)
> >>
> > ...
> >> +++ b/include/linux/firmware/imx/se_api.h
> >> @@ -11,4 +11,7 @@
> >>  #define SOC_ID_OF_IMX8ULP		0x084d
> >>  #define SOC_ID_OF_IMX93			0x9300
> >>
> >> +int imx_se_read_fuse(void *se_if_data, uint16_t fuse_id, u32 *value);
> >> +int imx_se_write_fuse(void *se_if_data, uint16_t fuse_id, u32 value);
> >> +
> >
> > This API should implement in fuse drivers. Other consume should use standard
> > fuse API to get value. If put here, it may bypass fuse driver.
>
> The reason this is here, is the downstream implementation in linux-imx
> and the current code organization.

Downstream may not good enough, sometime, it is quick solution.

> I thought there is some good reason
> to have shared functions and it looks like Pankaj structured it like
> this so all API functions live in ele_base_msg.c and the internal
> structs and defines in ele_base_msg.h and se_ctrl.h are not exposed to
> other drivers.
>
> If I would move this into imx-ocotp-ele.c, then I would also need to
> change how the code is organized and make the internal se_api functions
> exposed to other drivers. I don't know if that is really a good idea.
>
> I get your point but it looks like this contradicts the intention of
> having a clean API in the firmware driver.

You can refer imx-ocotp-scu.c, structure should be similar, only difference
is that lower transfer APIs.

Frank


