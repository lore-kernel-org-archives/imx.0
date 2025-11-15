Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013055.outbound.protection.outlook.com [40.107.159.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A3B14A60C
	for <imx@lists.linux.dev>; Sat, 15 Nov 2025 02:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763174243; cv=fail; b=tl+VTFo2VrLjBM18iM9lzajvc0K99144Ik9iJ2LKfDuTTx7LOaUCFinSZj2V1CtjYG9T/vJi21gymCdinheiz1W6PFlNBGp7wY50geJTGu7x9hAZ2nC21vrO8m3LCjNcI+0iTb9cwAdGot1PeTbIbjWjBix8WjSDxdh4yHnU+k0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763174243; c=relaxed/simple;
	bh=PBI/gSwc970UVYWOvlNGq2v94cEzZ7WmqHnBZujU4Vc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WGJxEfoYE8IqtXS+mY6E3l9NkG5x/8jOF5YU3rH7yabrZFtfhjPSzTg6YUkF1RpW/NlQ/PN8iOS7i+1bwZtaXf0QInaFhUySX0oC+blqj0FcYjijrvU1Me6WrkxK29AHZW1P45Gdcf0DYb7Cuaevsb7hY9wZA0gA0v7cwRTmKmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aSwqVscS; arc=fail smtp.client-ip=40.107.159.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aSwqVscS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nUhzblm04jWrg8okpkTkjxSbFKbDfOW+hEdEnn+acM/Htq41vf001JsrHUJ78wIKdH9gJFdKCL7wzOvK6znrbxCT+W/SXBBmktaLFxsG9RZ72SrKsEhyEEtaA3pyVMXWzwlm5dw1kpVuprajLVBphXVoNW0CYDagCo/rwvjFJCgJKRSZwV82N1Meylq99le52IDJ2TmyAtZv4wwasUuc4/Qygv8H6gdyycv6DvZ8H8drJruQSbIzAnCWtgxVF7VOeBmszdM13CaBw0C/e8J8ti92LbVaWwhoRJ0d7LiLQdl8GvFj2ktKihoLhfjv+UYRZe3UO5Ff4vkrgImF2lCqmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KjdIeUg71DDCFPRamGLLA2n3xbPI7VUj0Y6RMswGlwM=;
 b=q06xZsUwBk7uylRjT5jw0tTmwou1CWZM7PShWwbKUMg5lDuCXEBtrUKC7m6QH2FfMl4yTvWodY5T/SnsldHrf5NLZb5e3zZ+rzs0aHPmBZMvPCrTAMjenrIYtE1Ra7mgrWDwkCh7jdsw6plR2FZW7RcMgGs1C4IDEKJw1+dClfgvldTYnWtJzd8pvL0SDLgcB0tZGBs7gzb0I+Jp6AuKYpVRcFtrdMXMhD0qaKJTFhsW+xDjcY5NbE4f9XQW/sWvyBOHkavKzwPTqklwPmaneLpWcsBX8Z3pKvEFlizKfljklM4PbHOax1355Cq6w9etEPzslIUsEsdl7ubGXBcZbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KjdIeUg71DDCFPRamGLLA2n3xbPI7VUj0Y6RMswGlwM=;
 b=aSwqVscSks/Ge7GGAnvBdNwiNAdC48+mNQYsHyVWTfjsK9WuXohVRTJ/uprkx65Iy63geWw6/Ldo+nUQSY6sQop0liHp8QkWrMcvauA/adxhHPL6s5VRtnoWRBDBhCYKcxMYlCZl71Dqt/MT6l+ADCoBiivGvgQTZLpjNFtD8l8wUmrT5sf0Ja5eVqXhbG4syOZgsHvcd2focD5/ThyBVsvXQxI+cBb5S7Mc4LmJYnyS9TNFBCHjUVi5xdL/ZvOtLfPxTnQw9miiHSU+p8yUu3yv4eVIfT0MMIhCXLAHcyAxpdW/8k6hT6ybEgrFN+ewqe0vj2GyktmzvvqJqtSexQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com (2603:10a6:102:20c::17)
 by DU4PR04MB12081.eurprd04.prod.outlook.com (2603:10a6:10:641::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Sat, 15 Nov
 2025 02:37:18 +0000
Received: from PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad]) by PAXPR04MB8829.eurprd04.prod.outlook.com
 ([fe80::cdc5:713a:9592:f7ad%7]) with mapi id 15.20.9320.018; Sat, 15 Nov 2025
 02:37:18 +0000
Date: Sat, 15 Nov 2025 10:30:35 +0800
From: Xu Yang <xu.yang_2@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: myungjoo.ham@samsung.com, cw00.choi@samsung.com, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH] extcon: ptn5150: handle pending IRQ events during system
 resume
Message-ID: <33elsbnw6zjpq35scsrngtjkmv6cj7lnalk2tfc5pzivm7ac5y@u662rtextfsy>
References: <20251114074212.1214255-1-xu.yang_2@nxp.com>
 <21309a6f-4bf8-4567-a439-a3183713f17a@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21309a6f-4bf8-4567-a439-a3183713f17a@kernel.org>
X-ClientProxiedBy: SG2PR01CA0149.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::29) To PAXPR04MB8829.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::17)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8829:EE_|DU4PR04MB12081:EE_
X-MS-Office365-Filtering-Correlation-Id: f0b60662-53e6-48a1-d561-08de23efe45d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|19092799006|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?q1mkd+xYAnNYQQl/Ww0p08hTxIdEMYsQygLVcC6iokKOKhC6wZXUGKf/4mTX?=
 =?us-ascii?Q?NtgK+Hn7aLHuJpMylHRvOk0oKfcF5Z+azpMk9C34qhdS9JojdTvjbxxekAzt?=
 =?us-ascii?Q?XGGmK0XF6Z8xRR2iO4XpKsTXvY4dgo8RBBVLnIuOdVrLMBSaanmfkl/WsiSV?=
 =?us-ascii?Q?92LhBKnuB+iNTUzV4w36nO6zKk4lErpWherrA3vtikx4rcOpV//27JL1G2Hu?=
 =?us-ascii?Q?0Y655yojXx5bC39rnrSIROAKWVan9/Eky0DaDJ08SGaenxsaMECc2UuG/y61?=
 =?us-ascii?Q?/SYALJNXOAX6WQbJbDZbZo57NX/ulD+WcSaJFSdHUbxt8/QHPo+Khbs+LiW5?=
 =?us-ascii?Q?GPiGPKZZwHKSc+zDyB88gxRQVqeYI18Jm9Mb/sz3ak/Sy4zdaYp+F8n5MNN8?=
 =?us-ascii?Q?WNnk9hA7XERDsszC66bfP0K+eJg5zZ0LQRvnDdB1Dwg+oDxg3gT0AL6EToo5?=
 =?us-ascii?Q?IJ/DRkavPBa67+Y7v+AL5wT0mMUx8eIJ/9hS9/MGOT62MmVvTiLLZw1OfDUx?=
 =?us-ascii?Q?NEPBR0tT63T0pmcf5Ggax6PQPJwskoYHZqh7hvXLH8VhYb927N8t/Az71lAT?=
 =?us-ascii?Q?BvSdZRYDxEqVd5zAIpncCNC0YkzGo6uAgt/IvzRaINBvB4ugZ6TKV+tPQCMX?=
 =?us-ascii?Q?oxuxr3EGLmpswi8t0du/PIRuKb5RDPkcIJOMTOqMpvdvMn2IiW6YOHYQnzx8?=
 =?us-ascii?Q?nlJd662FfCDRk+Gn6Sn5y2EQCWIGMFaYF+m7SYDEFtnxvuIM/+6vKEBkBPNp?=
 =?us-ascii?Q?y8elyZUZEtugYXsDUcV8i8oRr/YR9UMDev8baimWHCOtKMbXwNLGQtz7niC4?=
 =?us-ascii?Q?hMRddJj3mRjHJweRuVYA4A2paozhL20q3sVTrYY2uQg1A1SyqCOS9HQ7f39M?=
 =?us-ascii?Q?k2tT0eIhzbo0/52jIThFEdPz1KeER9wTelJayZIqf4yzsxLykVllswmg72su?=
 =?us-ascii?Q?MKnTxChhFb6gQz9s+QgN+wC2yKZjCbJOwmx1V4J2uwgcVWdRmRMI2I9fbV7r?=
 =?us-ascii?Q?oPTu4XvraElGIUDSRTg2T9Sr3BS33ROHpwtEUXnGJxBPkiKPGWpwk+/Cy0XT?=
 =?us-ascii?Q?71qtAvVQt+gNmDXf/0G7GcngreSCNOOFgJYovZDitzcdtu/tFr+5foYvKFkK?=
 =?us-ascii?Q?6IuCSAEWlLOqK58A0m5wXJXMyvlayrLbPyC+V2ZQPebyanCaoQLM66Xu70H+?=
 =?us-ascii?Q?69pM3q5XhaOayF8wzMeLKW1pjUMJjJeTgSoiAS/Mz+lFCk67QZUFXWMYU0AT?=
 =?us-ascii?Q?BbEsRHFy02nRYzNZou1ao95G8MJs/57eFZ6qH3eUSQq/Kt3P/ns/c/FxbVHn?=
 =?us-ascii?Q?GrZi3+aMwI6/2LbnGq9uLzpI+BFoz8oeAeLnRGcrjwv5066OujHrs8pDEpWr?=
 =?us-ascii?Q?nBgjiCxkYM/X7H9AlcuA3Nmz9zjkyECU+VnuqrHcjiKgdc5tdYaTbFY6iIOh?=
 =?us-ascii?Q?6cjPFrXRPK3E4nVTWLpqtXawlHgENmRMtbRzcFNRueBvFzZXEsqRkhWJTZVT?=
 =?us-ascii?Q?UVaHYEgB9tR4iGXXwOQinVBFC0a1JUSGvLhc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8829.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(19092799006)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2DZbVIPAKbxuw5avOau7qMZq9rAOsCQWSWvR7325bLAz6D1HYWIavZpSgu2t?=
 =?us-ascii?Q?uD3mbSL2PbzQVEcl4Psvl92uW8zOABHxGQQ1ORqsf8P/TjqXQij2pz0AikMD?=
 =?us-ascii?Q?qRgdFheisPa/Diin+iE0IKBDtqN+P7jXDh8wgsONziAQ1VHSHmEmVICW7ben?=
 =?us-ascii?Q?f+mQ2tUc1bpcDZatrbs/0oiEC9Mt6deiaK8S55qawXxa7v4jHY4cuZWUUcV8?=
 =?us-ascii?Q?Mm5xObAW4od30B+MIL1P3W4Dw9UycHXL5FMQvRKHI9AoLUZ4XwtA3KB0LmB9?=
 =?us-ascii?Q?Dy2NlYJkYvcwRB/yFUFJ8hlxkHDKq8vXkAxvdVogXAr+E2NGViNnBvpF31pE?=
 =?us-ascii?Q?SEnxCoRILG5CaxtEVPhv4q8O2htXdWS+xY+FxklqKkFN/pPQF696dORElV2N?=
 =?us-ascii?Q?JqIDHMICwr6tNoAXwfYbEvBshh4PDSDsBA4VlS+ueIHMsjx19bYq+LfbfD34?=
 =?us-ascii?Q?DHkFX52VV3Pyhrf+46JDS3WyGpWXOv7f2jIwNZbTadRdle1fNkb0h+LN1jYG?=
 =?us-ascii?Q?aeH7hMLvx+tStHsanew1OlmVXHx89jvfb7O7gSOpl5mocS5l6WabOO3CTVjD?=
 =?us-ascii?Q?CLZgAyeBDHOR6sOU28RTzWeuOVaL9yz4l0yO9itACtU8jo5bgWxcEKuJ0xQ/?=
 =?us-ascii?Q?aKmwgD6dxMjKNKDdaGGCflyjjbp7EmSya11AScxB8dGtjJDhhcBQTGvg4qdW?=
 =?us-ascii?Q?TvZP+WMOdJ8nA6/s9IyLGo3eW7t3ndAvi+gEFqujNBmhLbOPz3wMX6ZkDiiB?=
 =?us-ascii?Q?nEhBm+uNksC3yfkQpgugIOwLxJF5PqoNC0+HsB8dk3HrKdqOqF8jp94UHqFj?=
 =?us-ascii?Q?VlbEY9jrQmoi3M3kwrdvNlODPDKmFNnBiHeEcxChlbafs/U3Se2yJV1tc1V8?=
 =?us-ascii?Q?wnxjTDY4Ott9YrMuOM8R+Q+bD8CgyFFUAmbpqi9MVcmuRB/Pq4g6afNFkue3?=
 =?us-ascii?Q?4fcro0OzIsnnOkz+Fl/8O/SmeOsq0rhR/RTAyi/Ho+3XUh7j3SofrpyHe1sv?=
 =?us-ascii?Q?j64gE8rfQZH5PHQ/OIPu07g0jUpMLiGmhRIkcpqBjz4YOHUjEknmRlPZw+60?=
 =?us-ascii?Q?1/YZk0jVH97Z7lgzV4VLtlfGWYpawIRcvO7Sz5ClJEKHcFIrIce2kS4f9WLR?=
 =?us-ascii?Q?H3+3zdPFREwrEn0EsQIINgdPkfSJl3zBxQfmrDagPdcXE+z5QthyJHFhDYzv?=
 =?us-ascii?Q?Fvrdi3KM+7excjem9WJ9BjUMtgUnrfEeP+JRMx73ov2uQ+fUAtGrOdt0txkm?=
 =?us-ascii?Q?CMpYF5bchjL/px//NtgMVkJabiF+d2jw0ZMicOqL6opwwhYPSjD6DCPuQxOa?=
 =?us-ascii?Q?91hVcntqgTpsMWbW81XtbBptU9UIgODT+gi1EarilVMi//Caehm1cVQ/LhK9?=
 =?us-ascii?Q?ZyF6IF/nFzTL29grI7OmlUjfVumGnlguR6LjCpkX2wNtCgNGV2vIeamWbzbQ?=
 =?us-ascii?Q?aYTrpHDj1XtdQI/rYmKuP2ungGh79hYJmAoP15un75ZcnkOA2vuYvxyqu8z2?=
 =?us-ascii?Q?thrT6DGR3Cx2P8TeMa2BLfU/Xiwj2+ukjRiGq261ihMJykSBw/5tVkduQEWw?=
 =?us-ascii?Q?mbM+wznG5I2CFsffbXkJG8NdPq68Lkz9nESlOaJN?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0b60662-53e6-48a1-d561-08de23efe45d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8829.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 02:37:18.4771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FxDZAZaeNdL97xXm3nnFZFFRdTOtJ3rRlAkYeh33Fiz74WAdcakBhbnjIyQWYhHMTQXiGFvc2E9mMcGyD4H/hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB12081

On Fri, Nov 14, 2025 at 09:08:24AM +0100, Krzysztof Kozlowski wrote:
> On 14/11/2025 08:42, Xu Yang wrote:
> >  
> > +static int ptn5150_resume(struct device *dev)
> > +{
> > +	struct i2c_client *i2c = to_i2c_client(dev);
> > +	struct ptn5150_info *info = i2c_get_clientdata(i2c);
> > +
> > +	/* Need to check possible pending interrupt events */
> > +	schedule_work(&info->irq_work);
> > +
> > +	return 0;
> > +}
> > +
> > +DEFINE_SIMPLE_DEV_PM_OPS(ptn5150_pm_ops, NULL, ptn5150_resume);
> 
> static
> 
> With this fixed:

Will do.

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Thanks,
Xu Yang

> 
> Best regards,
> Krzysztof
