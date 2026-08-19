Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013066.outbound.protection.outlook.com [40.107.159.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417AE3812DD
	for <imx@lists.linux.dev>; Wed, 19 Aug 2026 14:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787149119; cv=fail; b=kkfY/FZznsSIqyVanbppCwXB1dLrzb/NMFBbHOVK57Jvfn4MbUg7Bz+kYZiY5eHRvj8FkAiX7uuQMxPsMupltyAhk08+4h9XOa5CP/0x2HaqnexUox9OYKNPk7I2zm3fKGS/dREjRR7PhHxazhnQY6mxOqBCy7352SsOkEhPJIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787149119; c=relaxed/simple;
	bh=HxHdIMWoieDwlg5+bJyMuvQWb/IfPfFZ29zZHqcd2X4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KJ86K1MJPwt/GkDYoF8ru32I2qjs6ijA+AyrFKuJN6F7DBcx2YPLyRNhO/UDNHHpKs+CYsTASz2VJTdGwqMZMtjkBLQy4SguT+huCnxgMNKfyplgeY4jdhuzy+IQE7h26ew1ne3McWNDIrvC5kZCxRzVoRV4Hj7YHr746HNLhb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=NRzodOPw; arc=fail smtp.client-ip=40.107.159.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="NRzodOPw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQuxQmuRRt5W8ClnOPfYgbNK4ftoidZ4cJt5NvQqgkqALHBzHXewR6irSklmN1tu+/Cx65yxfp0wASdJO6JPGwQfj7wZaIX0D1EDSdIqdEN+umXsZaczklD/SLHsBpogt/56Z6OJUDajGNT59d10KvJlIoWEoV81wKdILZzhJl7AbtZ59tsX5UmuRATpYZRj3sKw6IZId5Unt4xQH1nnMXde+VWQzSDqagbggQ07Xv7bQkFSpTvhoh1gpkOxMtoQRECbI50bMbiyhmQNcVrsOvV/p1UNoi9OTkoDEYesxUkhHE3pe1loDdwM0S7yDAdi4+ieTUpvx7XE8RNj3H1jug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0dHU9e0MdFzT+ha4hiB7Ml77KR8BCj88BQ2XMljTgAY=;
 b=WGdPig+yiJkgdhDsPvYr7BztVHiaP+diM0bjooCpLVe0QuIikv5fA/VXnEgyPcg19dN8bof+2x7drbrMIcCZp5o8nZulDg4ANi/pLiPh56BSl8avs8cqAzTvZcFwsujVtr/LN7eoDfgUqk6nXBXs7iRrvNsWlBCNKjZgDVKiB1+M/4DISRUOwqsganlUiuwiDt9tbI7tkDWJGbWnAS3vcYKyYfOGgbFubrsgxjTESgkBmoAE38GTKX1xmFNfBXwRPZQWk0vqqGlBoHll/T2vAns7IDsCt9hX6FmPElUEsDXT8Ts80FvNb8235OQI2+czxcv3ZaSeHv5OX5QdQsQtEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0dHU9e0MdFzT+ha4hiB7Ml77KR8BCj88BQ2XMljTgAY=;
 b=NRzodOPwzp9oQgBmtro/JxGTfcl+Yc2GAbDEr3DXubXi38DMojR5UcUBsio1//+EIqv1FaWGwnagAHXXb1NSLX4eEvIWv6fKazr6EgOHmkHWg3AoCbZ68ucLxMin1wXLzqmLv5UXimuagC4qMUpaiaooGh61FzPTckXwXqzptps5haE0wKpX5xHrGGbKZLG1szoHFZMQKANjMC2X2Rdc7DAnCQ/1GmkuIp9AAMwiiY065+UhszkKO9aoTanXTE/36jJOS9Qf/yHbvORopvuz3FekBsY69QFFIzKH3MwB8jgNEGgAEMza9NhdLYfAJtLCvnLpxTI/bvW0YtexREG32w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB8PR04MB7082.eurprd04.prod.outlook.com (2603:10a6:10:129::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 14:18:35 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 14:18:34 +0000
Date: Wed, 19 Aug 2026 09:18:27 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Leonardo Costa <leoreis.costa@gmail.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH 6/6] arm64: dts: freescale: imx8mp-verdin: Add Mezzanine
 with Toradex Display 10.1" LVDS V2
Message-ID: <aoW7M1CmaPWDxvhE@SMW015318>
References: <20260813133335.1941580-1-leoreis.costa@gmail.com>
 <20260813133335.1941580-7-leoreis.costa@gmail.com>
 <an3brO5COdw_F76m@SMW015318>
 <rglymw6p4c65yoqz3pjn6e6nq7cil2fa7m7dqghshgdpavby7d@kyza3ceavq6z>
 <an3tiDOUUYLb8PAq@SMW015318>
 <juuc4af7ndbajcl7gzf4tg5qz2q2j5tt3rvql4jbauradujrre@gc5nbdhhixaf>
 <aoSqJ7pHEgJ_RZmr@SMW015318>
 <gsihg6tzkrq6gcygquzbjtiqntvoxp67lo6mqntnmbyvyw7s3y@suv4t26pl5eh>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <gsihg6tzkrq6gcygquzbjtiqntvoxp67lo6mqntnmbyvyw7s3y@suv4t26pl5eh>
X-ClientProxiedBy: SA9P223CA0014.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:806:26::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB8PR04MB7082:EE_
X-MS-Office365-Filtering-Correlation-Id: 902e069f-f55a-4616-8aed-08defdfcc111
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|376014|7416014|1800799024|23010399003|10067099003|56012099006|4143699003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	1JHDwZaRpk4lsfX1d8rqVcU6kjP73YjB4N2VkuIKjLJJeQ55wWxAZ/YBYRg4ovwWJjcMqumPgeMuJ2VpgMZ/NJdy79Rsoscb3FweCS2FiC2Ygal6n4/bUbC98rw01Sa1ZqSBu7TovEUasDhyE0B2CSX22hASrztOeqDIzjt18zJOeuW7hgKe8Gqkc4SPcJPltI/l2ZCEe69yzN2mxhlHkw2zw2qCpt6V1Yv5uO/HAn8dboi0rE6Jlj5D24V3zVBZGB2GaNRzl2V+vblJw/eyryI/Zd4osIk0ciOBfCQYdp9YI0KWv9EhT0uF1FkomvoE/aShbFIKC7vUn8mMfC7+tHbDZ1vL29b3WgNYqTIjQEzEi7713eVhDz7tAL7+lfhLQpXrjo9w0v7RyVoqK8TXO1tXQ5cr7IxA9Bkci3fjh5OHqq4pf4rjdpFxGastnKfaBMU5CsScVoK1kObx1RBQRN30yojg+J94nF+2v6/NjeNoJfZFNGpEtOSGrH8b/X/cTJMQok4A7mP9bWBjNERiigB39SAqqE2yUQXB/9TApMPwvz2DW+ytP58GKUkU7YqWv3M1ysckGqT1IasszaprkuOkWTuaN+tCS9cVg4VerVt5TL+xcwTAKdz2c+P9J/W1KIvrEoDx9yBlRwMXfW5OONyQ4i8GEjjb5E54KQAlg60=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(376014)(7416014)(1800799024)(23010399003)(10067099003)(56012099006)(4143699003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8aW9VGgjXIBkUPdYfC72HrJlPMKP9ZoB7tMvWepzb14mvYYYDq4jV493kmyt?=
 =?us-ascii?Q?gzSVYufHCrpCB5+Bhr/lGIFdW8IlnKNd9AfEdsyGXVBe8JBbrK1iEYJNLylB?=
 =?us-ascii?Q?rTEZSTyGmQduolrD4Lky+uqUaXWT9ilKSLkpMYRV7Vf4q6WWkuCty4a7j6Rn?=
 =?us-ascii?Q?X9Wcd/8u4UNWDI6hqS68OrTe0/Tp1Hqyegh5Cf+vqNBY4fYnDY0GMA16Tn+7?=
 =?us-ascii?Q?3vfah+7oQj2OplOETj3fQgnIUIOQDHvvIjvvbDtT794v7vvUkL17eVX494xk?=
 =?us-ascii?Q?j+oaVIJ781REEaoWEi92+e22hif1/vwYybkWZbafEaNryLqKG7Yo3KgUBtaR?=
 =?us-ascii?Q?4wkhy0KN7EMDoMxElQm6H2XxwnoieIoY547Uis032Dz1+QTfk1QwTnGbZn7B?=
 =?us-ascii?Q?CCLtaA4kYo0anEDlcGQlfq1TVfNKt14wraozwR1IzHYjLjFtsGa8o00GoYky?=
 =?us-ascii?Q?Mb/jCBn9hbxPkgdGMMjnPtGp2VziR4MQVAMuEQiI5r95RlTMVjZAJqbWi60X?=
 =?us-ascii?Q?m03h/x0Qm09u0r2oDFxixSQGrRRdUp8MAmz6UL6IL5QV730fdXzjCDSRW+8C?=
 =?us-ascii?Q?YNPIpOwV+5hTHCrOhFiNjntM9JXA4D5bRRRpy7KYaYaaUuOm09gsPb8PgZ4O?=
 =?us-ascii?Q?1QuSnsQ8qyqyrjmMTk0zDAfFSO2cIuI2Vxm4fILCbFh9MqOudhDhztuzF70u?=
 =?us-ascii?Q?WxQT3EZ8SQG/whFkFW5a+rAwIRe7S3U8z/FB96I5JuMyTfrdUr0Uhws0YJtF?=
 =?us-ascii?Q?xmXMvgHj6D6wsbuyROdDmJugjR+4c3W/wb5p+jwCuIYDWp+McrMJePCSBHoB?=
 =?us-ascii?Q?xmrxweVc8Izzsl2LuL3wEOlEXhdFYlaYLZGw9Dcsa4YdvbmAJbf36DqlzAmg?=
 =?us-ascii?Q?x8d9QpPgcwYnLvdK0UyH67IW7lSBhdtrE2osllM5IRq3zxlrdX7RKhe0thGF?=
 =?us-ascii?Q?cHa3JYu0H1JaziIlkphGesHqcnYDVV8CDfG50TKVaFkminzcDHGlbx/v4i5+?=
 =?us-ascii?Q?FUeyG8yA9N4jV1jpdN4NsDBb+8+GR6KQdgkdAqXwEIl6GPe39m/NCqFBIc3y?=
 =?us-ascii?Q?D6jKkFLva9u+D/nTWfW8eTHw6fGy6jebygKlziJYQsdB+Fj/C3SaNLyEII1G?=
 =?us-ascii?Q?MWl1po9VLKMYdp+xtTxT9KWIJEvJrRig1dNFWmFaMfM4ETAsgQ+DdDNpDVHA?=
 =?us-ascii?Q?g2sXyDan/ztcka2XqCaAiVnFwjit64QQ87wURIyiS8yzxnyVz4CB3/cki5UB?=
 =?us-ascii?Q?0vUo48BQmgccscCNYvUgbu9Epgt0BTtTcWI+Rnb2aeHJH6axhaTWZqWQT0o3?=
 =?us-ascii?Q?Qv+Eixpk6eqFJL1FAF0yZGr4iDYotLE3qe+AnPZpkkYtKL6APhKDGTx5iF8/?=
 =?us-ascii?Q?p9IKyGFEr/sBqz8lBGZ3/l0LoIAzGNFBimO0k11bh4nqoCpauceTZxdvQjbT?=
 =?us-ascii?Q?0NTvczWXm5YEwoEaRViqhHytT3OsYJl7IWDHE7rChV+aDHYyioV0E3A/OJcw?=
 =?us-ascii?Q?IcvPswWUB8HJBjfwoyh1qbtEjEVGYPzf2tpTahfH+xXa9vom2U8/ec6hiZUD?=
 =?us-ascii?Q?LdE5epYDlXVx5stfR1BIu8B4OKEGO5R+g1a+5Utl7hnIJTe7UNihemvsewjU?=
 =?us-ascii?Q?xigrJ8X38r735plSnBcti/g/bDZ1a+XgYAWFyAFf/NGEIISS0oaPpwtD7two?=
 =?us-ascii?Q?pZBCpy/q8xD4zXflUFQD314ETfBhpbcTHoU+mxDCSM/S+nDreNibUtD0qa6i?=
 =?us-ascii?Q?c+AL9hFbFSY7HXVoEh6YBQhMWhP96wwABqYmf33sVGE58ShZg/wg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 902e069f-f55a-4616-8aed-08defdfcc111
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 14:18:34.8284
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uivjkhexcijfHdsGqbksluNji3/GhpgUTgWEXGDK91PUIOv1aj7RI+CoXxOU1Ec9nEswxBGBbRcpxOLOTLnjPN+S5eRBpNPQHKcsid4Enu9UhYgbEwYt8ISLVanTfKk3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7082

On Wed, Aug 19, 2026 at 08:56:53AM -0300, Leonardo Costa wrote:
> On Tue, Aug 18, 2026 at 01:53:27PM -0500, Frank Li wrote:
> > On Tue, Aug 18, 2026 at 03:08:33PM -0300, Leonardo Costa wrote:
> > > It seems that the drivers are being deferred at boot start by the
> > > device_links_check_suppliers() function. It runs through the drivers before
> > > they're initialized and defers them if their suppliers are not available. The
> > > GPIO and PWM drivers are able to follow the gpio-map and pwm-map properties
> > > (through the of_parse_phandle_with_args_map() function), but from what I see,
> > > device_links_check_suppliers() has no such mechanism. It follows the phandle to
> > > the nexus connector node only, and since there's no compatible driver for it,
> > > the function defers the consumer drivers used in the overlay.
> > >
> > > I think this is what is happening mainly because setting the
> > > fw_devlink=permissive kernel parameter (which sets the DL_FLAG_SYNC_STATE_ONLY
> > > flag) solved the issue, though I could be misunderstanding something.
> > >
> > > 	int device_links_check_suppliers(struct device *dev)
> > > 	{
> > > 		...
> > > 		list_for_each_entry(link, &dev->links.suppliers, c_node) {
> > > 			...
> > >
> > > 			if (link->status != DL_STATE_AVAILABLE &&
> > > 			    !device_link_test(link, DL_FLAG_SYNC_STATE_ONLY)) {
> > >
> > > 				...
> > > 				device_links_missing_supplier(dev);
> > > 				ret = dev_err_probe(dev, -EPROBE_DEFER,
> > > 						    "supplier %s not ready\n", dev_name(link->supplier));
> > > 				break;
> > > 			}
> > > 			WRITE_ONCE(link->status, DL_STATE_CONSUMER_PROBE);
> > > 		}
> > > 		...
> > > 	}
> > >
> > > Has this behavior been observed before? Do you know of any work being done that
> > > addresses this?
> >
> > Does a dummy container driver (for debug) to proof your analyer?  Let
> > me to find time to debug it.
> >
> > Frank
>
> I made a dummy driver matching that compatible string, and yes, it did
> solve the issue.

Thank you very much. Let me think how to fix this problem. Nexus node
should be direction overall.

Frank

>
> Leonardo
