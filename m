Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11012049.outbound.protection.outlook.com [52.101.66.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC92176231
	for <imx@lists.linux.dev>; Fri, 12 Jul 2024 16:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720802662; cv=fail; b=jNY/BiooHN5v1TVJrACc8imZYkRcAA381jvnS6q0Hi3lxH0MM3A8MsB7PL8cbUR8eUF/aT6r7TABO7eQuidNL13F3fvc2Y9TBAi6WEMq8M4V3K4wZqKgMBFtFfFiVDTzRjnRLSW/tJve/CEo698rQreZqeofc/Jq9acj4Wypg2c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720802662; c=relaxed/simple;
	bh=Mviz2XsFfzdQ7WNtFOJ6PssKsK9kssLENDkq1PJjL2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=rPjDav6l1fYVSCswQW2l26yEWYtJVLTvJdEIga+Y4RJoiXmc8tkmd+T7NafcFX3dHmkh74aAh0kfDfm3jTdQGrXAE4d6twySkYtOGDnqnhj9giYLO24vm7JKaQ44Rzgi4IOvmtZDWXc24Rz7atR0lwwrvT7wmwHp2qspltESEIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=HHYZ6bJq; arc=fail smtp.client-ip=52.101.66.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="HHYZ6bJq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=itbDJ4Z/QKoygDRecwYzjvaHd5bc6QT4RXkhEfkmERndKaMr5GKpsldUQ+dQnhQBZapLqpLc9Z5gvOTIDLKr5lL9b8InrlOVvNNgNUYolBo7M4dz/nzc/sZXLa40HbRLpTKt/zGlpzNp39V3DTXglecboSaFPaEsu0/PlZ4dbNNdZr2kWqliG1ymGrKfjUdPH+fj83eRxdNsys1VW7AEo56zv3VGFtfxBGHNhVhMUu+j4SSJfo5fb6Whvzpn+HsxLqAGM633rF/NXjXnqdGeMnH74Q+tsk+jA9cT4bAmTwKZf3Qy8xsbDmhWBb5zZSEmQ/5y7T28irL/wqe4uiTeJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I32KFVaXf8kgZDDPZZ/G8VbeDhvvUU2OlXbxpfe9+6o=;
 b=OiHLHtYauwBdC0zEGDv4lcVx5KGg9t/jnrwRZjitsat8GmllD3UHUZBdvDf3jAppSiFOnXMLqGHnwEGGYxRve3zH5o/GHKs6EZmzAitumIQSwG9/h33BW4KJLZAolTIzYSAe9EHEXOqOYQDXZvWgQ46El1EO9d7spiNW1/ir892qEi1fQfxxWfiZFilpsGqyfU9v6p1Vwfx5zj58hqmuFGl53uyIztb1+iCX6Dr3xqTpsXhao1mL8zmGrZSa5adsYTngMSyTz/8tj/HCSILQTAt7uS60Cpk1kMJCZLg74rqvUT2BQWNeB+VM+WI4qQ+o/tn46Cv0uDMpMztHOBNdWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I32KFVaXf8kgZDDPZZ/G8VbeDhvvUU2OlXbxpfe9+6o=;
 b=HHYZ6bJqDB3giXFq/h+/d0kONAomquMxICaopYk1rq/fsH0hk1nEk/PVeP3FlJCwsm4fBSIN8MtfLcGRE5QrsDYqLejhPrUsj6J7rmyn/bIj6HtBir5zUcXT+KfWB+WIuCCaGuNWxjB2TM6qP3BlL5sV/HIygz9VB+quV5S+LB0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB8756.eurprd04.prod.outlook.com (2603:10a6:20b:42f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Fri, 12 Jul
 2024 16:44:17 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 16:44:17 +0000
Date: Fri, 12 Jul 2024 12:44:10 -0400
From: Frank Li <Frank.li@nxp.com>
To: Johannes Schauer Marin Rodrigues <josch@debian.org>
Cc: imx@lists.linux.dev, Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: Distributing NXP i.MX 8 firmware blobs in Debian
Message-ID: <ZpFdWoZg9FyOSdGh@lizhi-Precision-Tower-5810>
References: <172079266731.2928366.7031846226118749814@localhost>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <172079266731.2928366.7031846226118749814@localhost>
X-ClientProxiedBy: BYAPR08CA0052.namprd08.prod.outlook.com
 (2603:10b6:a03:117::29) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB8756:EE_
X-MS-Office365-Filtering-Correlation-Id: 99b0b201-68bc-4c01-fe4b-08dca291ded0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BTCjX0FXF9rCgifiN6kENr5vKhj7F0btOjFFxVs0fwGXfmHYN99XyKOULwAl?=
 =?us-ascii?Q?Mns3QWXK1/XwybH81por+fM74rlLE4pqnfz72LMRoffhPo23kDLm34G+SMne?=
 =?us-ascii?Q?TGAqfHlRndoXKcfwAzYtpDIGzPtWdheIdHqfI4WoBThHekMklA6+BfjSAN5k?=
 =?us-ascii?Q?buEQZFG2fx3NDTOB9NmWl7hgxxGRU57u7kpVn2fO9njb9umCxGk0i3uCTMMw?=
 =?us-ascii?Q?Jieh/N2UNqeXzJe5oyedwYGRIqRrPGIb6v8+LhxV6ri9l2qc3QzsAFPHVEep?=
 =?us-ascii?Q?rwS6uBDT9Dd32XLRa07VlPGCsYF49IZDrFcgOOWnOhjJe8DL8z9Kuezw1Tu0?=
 =?us-ascii?Q?Pn1YLpKQLgUgoEk4XmtPZOoTveZ9ImAfQKxjvWKbO5oKY4M+ZE31C3tL8UXa?=
 =?us-ascii?Q?PWCYIcZjs5mDYknIWqFQ8EY9egvfyq/V7D7eSvtYKNDllkyOdItGPRKiMFVI?=
 =?us-ascii?Q?33gKVPMrw5Xt6EQcCXjhYxYNj5r4WXcZo9aJlDMI9C1la/4oC2yy+F9q1u3S?=
 =?us-ascii?Q?/jskC0BtP4Qo+8J2qg/xVVYnGWqrfp16gmmHifBoraQTzFrnwplfM8EjUeey?=
 =?us-ascii?Q?8gat9CesF91mYX0xM9LghNjCQGyYTEyE9PWFVzHY5EOeAp2FUKovZIarguAQ?=
 =?us-ascii?Q?P5PNU3+xG1/3RAvRZ+fgKgSfRP9eeLbMelPHPdKRHavFymSTsg8OCYnU+vva?=
 =?us-ascii?Q?J0vXc5E7k53zTFzU5AxygdF9xRrIJVRBOL7QZju+8ICl4WLiAjY7F/CGxuBz?=
 =?us-ascii?Q?D0mYgPUtjOhnJsGed2Ehkd/k7EVQlbKyq495WUlLGrlE3bgORvv3mQMhMmuc?=
 =?us-ascii?Q?2++63vu1JEz3RCYMXtR90CqzpfCx2ItSxNdlka5SD5xL9ELHOp6Z349cBloj?=
 =?us-ascii?Q?gWtkEPNGzw+dfpX/opwYvrC0rwOCXnsEInkKL5mkWn2uDn54YvrbdVxncBrk?=
 =?us-ascii?Q?X7OUmBLmaHumVNmJBlbijECmODv25kIyF4SSXa6nnaPHAS+gHbtRDcP6hsjR?=
 =?us-ascii?Q?fJFu5gDll5873SqhClTJclrVmuaJwWNicDR0UqYVhRlw2HEo6AZ+45Xec97g?=
 =?us-ascii?Q?6zADCKuP+7sIvxfqsFokmzCmNl15ObcAutVAzEgtOKc7WOa31raRaIXGshju?=
 =?us-ascii?Q?PNh5ASIiD4nP9u5A1MIEkTe1FqpGMoee5ySl01nwiGMQ95/iaaBKvEh6H7NC?=
 =?us-ascii?Q?RVjr8eJ9ol2XaniyMI145L+uFrvLt/cL1zf3oAwnVXjr3LVfISE7fZn65NZI?=
 =?us-ascii?Q?KhzWxQzB7u/MGw2BaE+cRkVhSgSLig7p5cLlYOduw7JR/HjDLpK5Td3Bkv+N?=
 =?us-ascii?Q?Qiv6iVLR9Dzfz+HgnVfmgeHHf9FmZJV7xk8G4Bx6U0o9d8XF3qQkIan0SoVK?=
 =?us-ascii?Q?uKx/ZVZL0xKgPAmFQJ8+iW/YNTJ32zTcThDB6uY9nZnN0GtTug=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3LUp8+sXXgbS8G9gBwb4VOHneYWdkIPu9ZRzYgverES5uD91XY2FbJe85Sox?=
 =?us-ascii?Q?DRPAnKofMxGH9bmS2jZwK7MZS84C8ke+l/EfHBSqTyLwRfE2ucZ20Z01Y0EI?=
 =?us-ascii?Q?tn5P8/hphvnAUbZvVLcBTaV/70sGYhXlgcZL1zGZPYbu++c9y5Z46btElccZ?=
 =?us-ascii?Q?yfWWR+yJgFtGwpwTkytw11pKhMaVvVn0bj/ctG9rLYvzr7ARuBJcahW07Dxh?=
 =?us-ascii?Q?6gB98McPJKVHzyEXOwz1D1VwxBEs6013+JiDYsAJLjmisBBnFbNAMCV8RxEX?=
 =?us-ascii?Q?LQmTbhcGYS3Qto+Lx2V8AQ66dOpn6EFMVEFWIMkmV5SEXg5x1enWF3hL2dDb?=
 =?us-ascii?Q?vZl4N4UV0CUDqTIgMoigaqXMeW9k+fO2Yrngl51nf7DfhjrhlgwoAeUuXRtP?=
 =?us-ascii?Q?DV/FrC+w0pYxDkAzbC5cTAx85H6VZDnG9GKhAMOWZnH9QOZd1GtBJOrTtvn6?=
 =?us-ascii?Q?klwLYtx8JW4vvc3tOxEku4awTgD02B7eS6PMW+TN/3KPUINWTGEw00xXrvL1?=
 =?us-ascii?Q?+M2WwraFgtKWxjX5F3LJDLM87sUd0jSvFzwRbCXzAWor7fiZWlF7Hk8w3avS?=
 =?us-ascii?Q?tLKbuksx25/eTNYY07EohWbKS/e2MV2Tg+BtnQbVsyptrWvqyaXb/87RlP+9?=
 =?us-ascii?Q?pyoa2sxFhA2UYiiCk2NgVc6h/ij4OH788/DGdkcmRTVxjfQ9rGl58ClTBTj4?=
 =?us-ascii?Q?Sqa6rIU8Vdc7WWMGQ9yyySNQcMmjMmlQrP3PQOgVRx4Iu+u9IAqPbXfeO944?=
 =?us-ascii?Q?DRhhF6xmrtkUnFgIxV6lKxPLxVtzFl8aHjHcqc3BCEvb9d/3dUit4fSraqhH?=
 =?us-ascii?Q?hvxtcm1A9STBEsmkRp0a231FHfhrukoX4C4uxYExCKVpKFE2M9JY1lquR2up?=
 =?us-ascii?Q?okK4OA+pRSR9PhZ9ZQ7x+H3OLELOogJxWZGyoHwMRnHzTZW1fDX3CFsSqPwn?=
 =?us-ascii?Q?IJhzSnT+xJzoURlRbyroMRzcSAz2sTSs35qV5/OCRcJtjQBVW2YJB0L4/Rb2?=
 =?us-ascii?Q?yFJDM+xrra1lRD0FXmCQopsFkbo/PziDqCluIdAfAfpbnvLmlRmseAYa5EDv?=
 =?us-ascii?Q?Be68jqJmkr7eF13tn1huKv7wO6zEZQ+imu+cZvUYtYjzSrFvhVQcF8wMQttx?=
 =?us-ascii?Q?zV/Txg8pMM412RO5doPSAzQ1pm6vkZRteTl8zKh6qaDhNcxSXYWVL1wej9Tw?=
 =?us-ascii?Q?lqYieIt3mUzscIVf/OsdsKZ6hS67uXqEks/cTwpRag4zfy/iTO6V6avrd/nb?=
 =?us-ascii?Q?ymJmawd3DFKfdGOKsF1ccCzMu7F/xv2fZIgK1784VaO1k5vXvLegW4fpHvDW?=
 =?us-ascii?Q?+qE0P5SA5pRjJMEK85ygNMYuwv6kbaUXDfv7BrHGEiclDTPDqZkw+U1jKD+K?=
 =?us-ascii?Q?J8PFizSSLBKKQK+LdO3WzUDebXwd/ToyMF6lszpslTwghwM+v8FyEsl5rsow?=
 =?us-ascii?Q?TXjgI7AwUa/jIQSYFO+EROCSPBJoUd0Q3SLwqg9avjC9K/zZo5zmG9AOQJD+?=
 =?us-ascii?Q?oz9SrAf8zRN8sIwjTEVhpPNq8aHW7tikLVHLynfeeAxTtHcBwg0WdWpCqs6G?=
 =?us-ascii?Q?KxT0MpfmZbyJid+jrLsFFiJu93gcjaeY8jxDNhlu?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99b0b201-68bc-4c01-fe4b-08dca291ded0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 16:44:17.3079
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tk2/s4N+42h9Uq53Hg80iTE7IBa5slHBMzP3P+it6mx8FMjhBJkz6DgVHxpPXgDbZXkTONTCfW7/MfB1qcgQkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8756

On Fri, Jul 12, 2024 at 03:57:47PM +0200, Johannes Schauer Marin Rodrigues wrote:
> Dear NXP team,
> 
> I'm writing you as a member of the Debian project. I am trying to add support
> for platforms like the NXP i.MX8MQ to the debian-installer disk images. These
> images need to (for example) contain the DDR training blobs which can be
> downloaded from
> https://www.nxp.com/lgfiles/NMG/MAD/YOCTO/firmware-imx-8.24-fbe0a4c.bin
> 
> Unfortunately, the NXP Software License Agreement states:
> 
> > 2.3. [..] If expressly authorized in the
> > Software Content Register, subject to the terms and conditions of this
> > Agreement, NXP grants you a [...] license solely in connection with your
> > manufacturing and distribution of an Authorized System:
> > [...]
> > (b)	to copy and distribute as needed, solely in connection with an
> > Authorized System and for use in combination with a NXP Product,
> 
> My reading of that agreement is, that Debian is not permitted to redistribute
> these blobs. But this in turn means that our disk images will not work
> out-of-the box with NXP platforms that require these blobs to be loaded early
> during boot to function.
> 
> Could you assist me in connecting with the appropriate person who can help
> resolve this issue? Maybe there is a possibility for the Debian project to be
> allowed to distribute these blobs in its repositories?
> 

Forward to internal release management team. Hope they can help this.

Frank

> Thanks a lot in advance and have a nice weekend!
> 
> Johannes Schauer Marin Rodrigues


