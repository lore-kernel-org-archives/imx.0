Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795468408;
	b=0t9VSuaHpGmggQDFvtaC5TA0M/H89AQvysnpj962DDKYNad6l5asPxTK/F/lIArjNy2e
	 X9n9HnT135OFmq0v4Q0IyPEvwNccDGgQJmMB1sIh6nwaaznHrC+B4WYLbQdHhOHSVlH5U
	 ApDR5Ik/tXZHdE/tzjrIu9VR5fMhX3UXj3nrBw44FfVBGJdBFsuSwUW+i/ziTUpbinoYY
	 SKqPwSV7JMpv7DuPS2d7AZCOtxlrz4snI2UJl+KRaKZnPbVm7HjymoWnARaYubJnMzS6X
	 HCAIuveuPanQTuqfaZ1AbG/qFgXDKGXN5llX2sonstQ4gVaXElnW2KLL96yB+Gnhd8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795468408;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=+EieMyba9uNMpYOLIwLVd5GgABFVwkAVkohhhM9/1P0=;
	b=toVo391CITr5DZvZIwQtNU709PjnBVv3EPEf1vOAom8GM69NXrWd/sWfEzRX96+EdcjJ
	 6WUTTqY+9Y2A5/Zvvl77rnDAMc2H/QNwW2Ae75FMR9DzJUrfk9n2XteeTogDhHA1+QWyg
	 MdqWHSCzAagoNhLLv7grIrGG8g6smfVqHdAOD2toaP/oqIj3pWuzFMPB3zwIg81vqeOFB
	 yB8dTH3VACqcRpd/g+dZB+78Im7D2XfvynnXETMPvRUlRtv+U26iJnx134hPl1chCc4FV
	 Z5NkxdbG9i2Ob40GJFbVQs3L98hXarpMvzLIPa9u364LCPGKydqs+dtrig7BoPimjWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=jVuDFlap;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.5
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011005.outbound.protection.outlook.com [52.101.65.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E8C606A31E
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 21:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3E8C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=jVuDFlap
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r3kLOdV9DdmGaEr82Nx8V1Be6AzRmoKH/hYyxaeTKFVHsvtnQmmzTSvKf/ElmbKK47ndxilC5qM2z12ojrE+KBFO0W0DehUBGJhSS4NAKnjOpjNAuBUyI+zozuQzfdxIbBjEsdl7pr9mvWdPwI6P93rj+HxlrYMDjxIsFwyoW5ELVXW3dR+ynevEphB4kMvX/B4Z4hEtLb9Ua9Nb/FUfeZkB7rMJln6i4I/XNAH3HpYDD5nSffrNzI2E4UztBbJxpH7UkFQlZQqabQYVI7V5oxCkh5fzk074SFoRRNmGIAxdRdYGs++M/OdT+hgC3MFiWYmqSr8+KH3t6KvtmXWGSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+EieMyba9uNMpYOLIwLVd5GgABFVwkAVkohhhM9/1P0=;
 b=kbuzx2jPAtu2vrQ6whq2xdpbfIjyytVXt/+2cPvsKM4bc9sj5Gl8m/hfmuCEgUrKbsIRVYbpsOGMB//wksLR8VSnLjIx+hJyGPH63+wxHMN74GSTlokaU5zZ5Pr1TD5HiIl+Y5sdYk9rhfdsTnl63STExXAEIBB6GpniOaMhWCtJVC3V5S3V9keMwyJlu+J00guTKgukBkH6El+fjxOB2n3L/F9RM2DStjrgDYvP5vEgPieCfFllqLnIR4G7lme9+nhpqYmFYA1zDVZqxszWRSP+dJ4Ki0YFGQQ40khAf8nqlPAJaksVwmCWP2HRKwWTXtl4FpJEqIWSfd69d0bDiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+EieMyba9uNMpYOLIwLVd5GgABFVwkAVkohhhM9/1P0=;
 b=jVuDFlapXE2+bzzArGLvX8gZqi+uUBDOT0B+tn3rmBwQ9FlyS+VwHEBu9nWJDpB1IxQt2ihHV2hpSxpn+7YjZ/csMunCI9Ioy2fGnUygPTWuTFt+KSprXujVPJfjH/dRKX6IxphEK9AZq58AAJEJx7H1C3D5Rg3sIAK4H/zurWrvo1VrFHkO1xS6lCSVVDhVI9qJAMGRvwRpGO901fQSpv/FJCSxfRldmevgpiRXkGO1wk9hS2P8eIa7pdfGY7sE+ENu1M3hLSeath1A2kcveUru711kA231HAic4KEs7+AsXsUczFpsMozSyUsiCPN04AnILHvDQQOMDIg3nBNt2w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU4PR04MB10364.eurprd04.prod.outlook.com (2603:10a6:10:560::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 21:13:23 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 21:13:23 +0000
Date: Mon, 23 Nov 2026 16:13:13 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>,
	"hverkuil@kernel.org" <hverkuil@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"Frank.Li@nxp.com" <Frank.Li@nxp.com>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"festevam@gmail.com" <festevam@gmail.com>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	"nicolas.dufresne@collabora.com" <nicolas.dufresne@collabora.com>,
	"ming.qian@oss.nxp.com" <ming.qian@oss.nxp.com>,
	"marek.vasut@mailbox.org" <marek.vasut@mailbox.org>,
	"jackson.lee" <jackson.lee@chipsnmedia.com>,
	"lafley.kim" <lafley.kim@chipsnmedia.com>
Subject: Re: [PATCH v8 02/11] media: chips-media: wave6: Add Wave6 control
 driver
Message-ID: <awSsaTb57yK58Gyf@lizhi-Precision-Tower-5810>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
 <6b00047b748267a2ff4e18ccbfd573ea92166d34.1795075580.git.nas.chung@chipsnmedia.com>
 <av9XG97eKQ1gZCFb@SMW015318>
 <SL2P216MB2441AAC89D661DE574918603FB782@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SL2P216MB2441AAC89D661DE574918603FB782@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
X-ClientProxiedBy: PH8PR15CA0004.namprd15.prod.outlook.com
 (2603:10b6:510:2d2::15) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DU4PR04MB10364:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b694be3-c408-49e7-d82e-08df49a69bc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|366016|7416014|376014|18002099003|22082099003|4143699003|10067099003|56012099006|11063799006|261102123227099003|261028144727099003|261022075727099003|261026140227099003|261022105027099003|261021135927099003|261021121427099003;
X-Microsoft-Antispam-Message-Info:
	+J/diUWKMHZx/f6pF3qcpQJE/4E7T3/hBnt7W7h1tWjBTM9Q/xMG7DkBvNhwEXgbcTccRnvG648Ay+mui2ynclYDr/rwcGnJCSsV+b0M19XzBo/1JfMODriKz77UZ5VmWQ82gdX4U5sqac03eVBe0KJgsslpVpwYeK49bvtS8LyZ0jq1hr4h3wGAB7GxSayChaTE6YpT+T0SvYxmvIt2gpx/axc5iR+uUGAwdv7Jb3CKj5mE9eNrIfcFvv08V2VXTG1x0NTZOfOdmWpvihGxV62k/OCQvXAJwqNg0AeUvAehw18sTZ2ZpcE7Gibn6XhDpGnyjrrQ8C80bUAhC3qkGtXMA0FzLYdJ8HOXkpf5YTohiTMgO4V0hT9454BEqarl0OVohxxwmjAbeag1F/ZTOImdbOduC5TZRFCvZXIoyqOZdziYpdZNMlZC+Ndd/pYkSTA2K6d947nXvCsHZUmVamEknT/pIUbLZe1n+SCwxvQaeaa/daElDORFoHThaKtgTHyiu/GOVsExJdktMZCiItb3R8mPHntF6VvLAh0dKza5YBYdrhpivMRT2JIPKa8O3pKjVRhkON774ks0qhsuw0TQdf/01vMduNP0Zk/bkEYsaTyhuVniqFDMIlhOCx4J7wq52w3Rqo1vz02anzAYQ608qtDB1wzijovCbVzaV0Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(366016)(7416014)(376014)(18002099003)(22082099003)(4143699003)(10067099003)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261022075727099003)(261026140227099003)(261022105027099003)(261021135927099003)(261021121427099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zFFK1lE5NE3yp7ga2e6Ov6AqEhZMUORBHDQg3dDZXmZ1kl5lMqlG6H8bqyGG?=
 =?us-ascii?Q?+6ucAMClw04UHP4JuRIjwtnVf8Xv1xhYuzWdYfdtB2kVCv2Lk28mhPV5JhuA?=
 =?us-ascii?Q?hNDiYcMqsxCahrQ6gjbBm3p5ZbogfWqo4215CQYMft/5DW6bzUAOrdsGPdtA?=
 =?us-ascii?Q?oXF/9AWLNFGwqeV1orPTWK0EJZRnkfhVef3x2f9XZOiyv4KeOpozgL72xBZO?=
 =?us-ascii?Q?bj6oMq4Vu4YZ4JWrsPExlRixLdQXl31AyfjZIgs61fCjrBDW7lgD31MSjS6p?=
 =?us-ascii?Q?JkU6RahGrdT4tr1Usn+DFQT0be/pRVr0g0X3EVo7faRdI8J+Byg3WgZrdwH3?=
 =?us-ascii?Q?6sCtlJCoPW5jV3EqAy/eDTYguOKM7fnD87doXxRCFhgVQT3+0qz+4VVJEo2M?=
 =?us-ascii?Q?fvjXOdGhDPFt3xWEWvEdNw8mlvw+tUHjt4WQU12sQuilLIreqmKxAiKJLs6H?=
 =?us-ascii?Q?URWg5cbL8GKfG9DnoAhC1D5xGwL2UoSd1301OU31+HQKDmsOM6VRm63qit94?=
 =?us-ascii?Q?ftpIX2o4X9WV4CAJV698nMDk1wyI7aiDQb3xVtIUdJCwEyKAE4k2QUdw3111?=
 =?us-ascii?Q?vxtlf/090Gn2lCzoA+0YXq7O8RKtwiohIWL+7bt5ZeLTmUH9HbKyw5i5R3dB?=
 =?us-ascii?Q?lNz1GvRwTCSIxMjeFnlAZ+0pKbvAWtnu8pet0OHaZL2yPKBzAXgANfoNeOwL?=
 =?us-ascii?Q?FUIOzVs3iM0l1OcTQLv40IiEebTes/qW38J9GR+P3+zuflNFAZOwFO6xl6eB?=
 =?us-ascii?Q?Okm3QIkRSKAJZWf7blMj7+OqvcBfbLoftkHNQ9jafz+uZfFTIoKFT3YYV4pq?=
 =?us-ascii?Q?FRWkfBUFNKvaL+X+SpBJDh3uPjo0BBn6plvDvK99j58wZ5SSV9P2M0MT45CG?=
 =?us-ascii?Q?eUn2gyhIAss3JwL+OU2i/DkeLFPn+HBMSV7sCefqrsFSLt4Su33dcxCZeCKC?=
 =?us-ascii?Q?1xKfV2Xk55tGOeFyGzKazowIhsd0u5RCa+HT/eHXGVS86HRu8lNWD9jP69AJ?=
 =?us-ascii?Q?Mu7ukhW+9bBdz5qRPzeveAV78MJNw6R1YB+oGVH3N40kDF5T5KBcCa8EfBRI?=
 =?us-ascii?Q?BhJ1ivxXLfuVnyIQU7cp1/dgvZTQKOlfbmiU0hh+SEkI46YiJho4mOMwEInv?=
 =?us-ascii?Q?eSmo/SyfgNKOssfwQVRhsXQRoIDDaT4OASIexxFlQVP6MQZ4WiIzIual4Sc8?=
 =?us-ascii?Q?dbKlpWtvKvdRwrXXrbfdvOCDKgyo7xw3uhsL0OSMJ1NPdNy9Y/gCYBehE67u?=
 =?us-ascii?Q?5s4PRhy/SyUn3+TefiHeIrFBHlrsAWFf8o3lUG0DMMww3s6nP7Fp6kWrapLE?=
 =?us-ascii?Q?zBOnOd3QJzS4lOgrYTnoJXXl76mifCIh9VmKuYgI144isOPqf59Ku2MX/MjB?=
 =?us-ascii?Q?fiOcK1Z5oJw2mNbGZFGgVeyFDMCl/CpCiPrQaCZqTfIp+HtuzgZl2CntObAF?=
 =?us-ascii?Q?UMCQZgVoC+CPY00n/lbmPtUP/VF1kVnPvC/8CkMdQAeIdDktPFxIMSHnfdnk?=
 =?us-ascii?Q?eX09XGqGRUePsS6NiVkH6JBI4rGSA6uz81gKBQlycrtuZ80cax/nvDhACryG?=
 =?us-ascii?Q?JpRolyexp/lZXwq58KTbEJbkdBh4e41cePantL5sWl+6QYzdVmZz2q5FHptY?=
 =?us-ascii?Q?bq8xW/63BWq7eeMoz7tXL548+D2HCbQu4Ux5pP93OPJPwuQFvquVL/7O4nTg?=
 =?us-ascii?Q?fcZ6nXGGAJz8dSlAa0R84wr+5wSRQr+h5Rwy0x9K9VSdvRepQrMiv2SKWij/?=
 =?us-ascii?Q?SJaRWhQVVDUb+Ot7SEqrC1V76q5mdQqoBjPoBrNMqEf2KX9Bg9pX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b694be3-c408-49e7-d82e-08df49a69bc4
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 21:13:23.7365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YRBtLTIxgvMndQYz/rVBkBBvVWGallsineGkEQoB1IXSMd8Bk698CxeC5W4iCZUQDWS7MY8EIG79Wfbf4aSliMMO5WSAjKQZ5y7OXxWaPXknb63pbDANq3ftWdNQqseg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10364

On Fri, Nov 20, 2026 at 08:58:07AM +0000, Nas Chung wrote:
> Hi, Frank.
>
> >-----Original Message-----
> >From: Frank Li <Frank.li@oss.nxp.com>
> >Sent: Friday, November 20, 2026 5:08 AM
> >To: Nas Chung <nas.chung@chipsnmedia.com>
> >Cc: mchehab@kernel.org; hverkuil@kernel.org; robh@kernel.org;
> >krzk+dt@kernel.org; conor+dt@kernel.org; Frank.Li@nxp.com;
> >s.hauer@pengutronix.de; linux-media@vger.kernel.org;
> >devicetree@vger.kernel.org; linux-kernel@vger.kernel.org;
> >imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org;
> >festevam@gmail.com; kernel@pengutronix.de; nicolas.dufresne@collabora.com;
> >ming.qian@oss.nxp.com; marek.vasut@mailbox.org; jackson.lee
> ><jackson.lee@chipsnmedia.com>; lafley.kim <lafley.kim@chipsnmedia.com>
> >Subject: Re: [PATCH v8 02/11] media: chips-media: wave6: Add Wave6 control
> >driver
> >
> >On Thu, Nov 19, 2026 at 05:59:56PM +0900, Nas Chung wrote:
> >> Add the control driver for the Chips&Media Wave6 video codec IP.
> >>
> >> The hardware contains one control register region and four interface
> >> register regions for a shared video processing engine.
> >>
> >> This driver handles the control region and manages shared resources such
> >> as firmware loading, firmware memory allocation, and coordination
> >required
> >> by the interface register regions.
> >>
> >> It also instantiates and coordinates with the `wave6-core` child devices
> >> for firmware and power state management.
> >>
> >> Tested-by: Ming Qian <ming.qian@oss.nxp.com>
> >> Tested-by: Marek Vasut <marek.vasut@mailbox.org>
> >> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> >> ---
> >...
> >> +
> >> +static inline int wave6_vdi_alloc_dma(struct device *dev, struct vpu_buf
> >*vb)
> >> +{
> >> +	void *vaddr;
> >> +	dma_addr_t daddr;
> >
> >Nit try keep revise christmas order, check others
> >
> >dma_addr_t daddr;
> >void *vaddr;
>
> OK, I'll fix it across the driver.

Needn't reply argee part, only reply what need discuss part to reduce mail
list loading.

Frank
