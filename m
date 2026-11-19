Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.1
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795118890;
	b=N2UrEl2ELlhV9ATGkdrB3Hw3dIyYc/i6WWhMEanW0SSiIXE7JLjLpdRRgE5bOsYn2i4O
	 QHYuxqi2Xf0v7OnlZhXWW4Jk1YSk0sYOOe1Q29+tjA9aVTtMvRF3gZcefk3lrxJpGJCpF
	 oEs6LedOICt7UnNyl6PFRxB2RS8KnBQdS5c/IdFB28usbwO2mY2iG8PVYbgDzfmZbKqIp
	 x8ive8iptwHWTDHs0sj5T1O+L15ubVr42jkePNpG9uGcd7h0r9FTBXG4iU7eaw3FjTxSw
	 ldqEpO5/IGowkrFiKRhnoB2tHPbSIXExFNJqFayLGA9iN39Ot17hg0A+dR6nqB34xCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795118890;
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
	bh=OrNavfq8QGpF87p2/4FjPuH+1VV/cfwQYy2hDi0g8mQ=;
	b=DwEEd4tKVwzAWoII0b3hVeknC0yU/SdRfNJ5/wP8wqmYfvLXlsKNQNb0Ax3XHALI3YFh
	 gI+ptei8WAd5XItXBnw0qFH/H+BP/A3uzLDJ3ZP1idOrFcxPUBxhGDttdyoQNay7EmMtL
	 ajTZWLn0CyBL9bptcGB7Z20GRwTkQ64dGSzL+FKaUqbrKkoIZQdbNngR7igFSeMmE9c60
	 TYAuDHCh8/kYiKGy83eutMAORi/gihOJ+AAt6p3exhnISTF3hw/btvh6/1Q96MbDAR72I
	 S8z6plq63wtS5I7zhS9DxqE1vnu1Ykxu7OWDFYEr+Zih0M99fDpTiNBo0xJfPJf2cZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=HJ00JxjQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.1
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011001.outbound.protection.outlook.com [52.101.70.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B8E606A331
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 20:08:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54B8E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=HJ00JxjQ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSesMCYxtLxiEyoi+VToJdq4oizVS+ZHJg8fasvKGhDN5WnHvTEXRRKA+hZYojPkRn0fQJFygUwYMqbaln5ftFBOqsJC3WYFsfOoT0s2KA1Gv5aphRLuyaXRcQgzQuorqugkr7U9xq5PMDTcAvORnHLPUAaFehuz42p6fIYu0uLS9NlfKynAXc3jffDK2HEohoo9FWfz/96Xhc9IFUl1LMHhuLF/+VhjeY9MS7Gmtsyfqb+3zX67qZ3rjWAqmzlu05QIXonXRa0G0YsRPQ2vydTeNIbNv3OOcM5y3mmM49z3Ce1IyPkKdKn8hhCvpFO8TJh56elZBQg5DJdB1KndfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OrNavfq8QGpF87p2/4FjPuH+1VV/cfwQYy2hDi0g8mQ=;
 b=lb/v3Ri59N7gT7mcSnHnL0N27qWprC5S+7hXUski/QFDfpYszoL656lyqP0BpK0uLlEjmj+1w7QfCkza5Nhgr1fPO47O9767n7+3gqEWRGnKWwXU7n2KeEVdpIb9Pk6yd4Ln7LWg2EwvEQcWfaE/geuRdKnuYLkH1EuVxbVSJYdyftxltOvGYznTviW3A7occ3MK4zyqGcZPgygM1hdlpUfYhrvxuIe3l74aJJPyUi87ef07S4FQkyoF13sXLJDyjQ4vGdWC8oDSkQgXgdM8i5cXQK+g3z9l4qUHecaAbmRcJ/8KtG094F7gAMkPIjeueqklZa3W+3s+SWrj3jShTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OrNavfq8QGpF87p2/4FjPuH+1VV/cfwQYy2hDi0g8mQ=;
 b=HJ00JxjQv9I34hJCvdNDpPTarCDroIWxbLiBu067+AET7wKv0IuQ6TyhSt8+wBsV1dUSmtLLz7Qwr9LwyMYEsrhGy4NzHVPZdXS/SBsJMDRnXmATpKCWAXZ6cyQ3SAVvw5UYXhEy6ziZqKHe1iAEIuBRInLqYPmPiUzGjNWDBPCG/XoUfDl50FJdbCWW0HsP5rwlbw63wYc0dB/+qhr+bdRMNB4TJoHF3fgl6fLr2c2hr4gj1htaKIGx8AlCv52l2fCQUVTtpPSxEB7YHluLmSb1ALiKfi0LlYQXgGry3Ey8jZUGq/R9fACVRPCaO+Uzq2ieYigvndXVR76Xs1PI1g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MA6PR04MB210153.eurprd04.prod.outlook.com (2603:10a6:250:55::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Thu, 19 Nov
 2026 20:08:06 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 20:08:05 +0000
Date: Thu, 19 Nov 2026 14:07:55 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Nas Chung <nas.chung@chipsnmedia.com>
Cc: mchehab@kernel.org, hverkuil@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com,
	s.hauer@pengutronix.de, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	festevam@gmail.com, kernel@pengutronix.de,
	nicolas.dufresne@collabora.com, ming.qian@oss.nxp.com,
	marek.vasut@mailbox.org, jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com
Subject: Re: [PATCH v8 02/11] media: chips-media: wave6: Add Wave6 control
 driver
Message-ID: <av9XG97eKQ1gZCFb@SMW015318>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
 <6b00047b748267a2ff4e18ccbfd573ea92166d34.1795075580.git.nas.chung@chipsnmedia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b00047b748267a2ff4e18ccbfd573ea92166d34.1795075580.git.nas.chung@chipsnmedia.com>
X-ClientProxiedBy: PH8P221CA0038.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::9) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MA6PR04MB210153:EE_
X-MS-Office365-Filtering-Correlation-Id: ebadca54-3e21-4080-5c5e-08df4678d2c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|23010399003|376014|7416014|366016|22082099003|18002099003|261009223027099003|11063799006|5023799004|56012099006|10067099003|4143699003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261022075727099003|261022105027099003|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	UMV8H1p6vQKuw36MrboGyY0Th/yMdFX6X1m6BaDTzW44m0UmBxNp36f9SH+qZOeMMM0aFClUqkiQPoanKh+siJzbAyteW8L1bG6Wh9Ccf/hUObxhE9Ynm7FIV8EU34f0BT2Gw/cdlbqsmtyaJ+4RBPoVPRHfl5hsDF5wGDjQjedv5F7Yd7/+NRCRVR+57kXqJJkaWiPUk3Y6nFhpy5Z7JWB+5KYfEksoTHH2TkDr5kVUEtWV/Rer0KcGQZX15kxJ1lHYyKw1cr6SSbiKgHGcCB/pO3UUXcPyPMKJognzo8y+xirXRT3xbIR8Z8bt5Wa8H4EYslNFCsReAkRQoE3ecoVK9nEQ+AIOm3X6bDqUTMBrSyqYxeFGhdVcqF0x/P02xIZr7EQyaVbcDGapZ9O2ncrrr8Dc6ndLrIDrqoK6LJBTJAKKrnXwJixsBsdYdhoDDtFoJ9sRNqd6rm4iwW13TmtFD1Vvs2vkcwtuAW2xEzDi5Y0dZThQhERTHKnb4J50mvt2iCqlT69EqtQZnNTeZbeDK9aeVa35dt/VtZjgSmZR4Z30YL3NTK2doOcTKJpRfjeV3WisDLOC663fDv2lI2lcT7FUcQnmcUEUjR/BF33kvIcxiCHH44E/7NsV28mRnppu6qLu7VJf0LMTb9i2W5GnB+gH3p92DWmoN2AOvMQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(23010399003)(376014)(7416014)(366016)(22082099003)(18002099003)(261009223027099003)(11063799006)(5023799004)(56012099006)(10067099003)(4143699003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261022075727099003)(261022105027099003)(261021121427099003)(261021123027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QRrI8UjZuCRSr8Bfis6BW091qwLEPm2m6SjynfmF2awKuUSNZ/hr9PdcMB5K?=
 =?us-ascii?Q?CCplUVxCCZ0E87K8CPjQ9qhopQegjbWntBzO0OrchbR/8FJICaUt+JI1eMOe?=
 =?us-ascii?Q?f43KPXCPYd/Y2F/gb8aBt/g3D+yed5BAPsf+HO1QGkk4JaFxm1RTWyfIVboU?=
 =?us-ascii?Q?EX/489gxsEOS5TorDq5ZhI0AzCf8kaJE2YEPeNf0IB9iwDmB+aZh5EQHXYjN?=
 =?us-ascii?Q?sUNJ50UW/OOQd3EvkHy4zqI9gBCFrNjHtqTyLNLORV4VkaLCjxrI2+yzg9AH?=
 =?us-ascii?Q?lGRqD8p/A5yMzNZfdNPNWFXI7q9uFnFtZtd2ClpSF+InORXex9M5RMpWt5GU?=
 =?us-ascii?Q?r5yxHjtEw1hidVTIlyz5LTPrw8CjKbsz0C9WJNkjIH3RgHj95vob+7cllZZw?=
 =?us-ascii?Q?1d9jKFodRHd+CnUMgNu5zg60ww6+lc+fQc+Trw3QOTXr9htT/JyYRIQNyG7/?=
 =?us-ascii?Q?3QgS/W6gTaUidUrb5qOyqIrI8pngUXaNZEAgiL3b+fMI3x1TwSGyrWEVQdnL?=
 =?us-ascii?Q?LvuZ+JkNygLEHw3m3ISpxf8QXy3J32up48dS8Gxu3EorUejnt9DFWDRPtg+y?=
 =?us-ascii?Q?QuQnlVGrIg7AtE0voZz2WAwk/glphwFADGk/l+ptwOaDd0z2n9nprdkLZIoL?=
 =?us-ascii?Q?w1YGMVP5KQoru8uipdWCleZ51yJXAdlELhEPMq7k3gKB4C/Dw8ng0jY6//0R?=
 =?us-ascii?Q?1xA4rL0CWLGhOgdwSL3gQVcoI3orXeS/17N/8L3bqp3hkEprnkYUUf6W81gb?=
 =?us-ascii?Q?NgcVkk7kix/8cQdSglbqCZbKGdYhClCsHCoTEtWNx8OqSQW3Q7N8/zep1x4N?=
 =?us-ascii?Q?QMQlOu6PTpTxpMU+t2jZcVBQUvUIwz7v2Z1Z4IsGgoCiVzwoydlPON79Munq?=
 =?us-ascii?Q?X7W3bPzjyZF2a7j3YEPhuyKsjX9E4DG5Se0kJAfspNtW0U1zvGjLFi39z+0s?=
 =?us-ascii?Q?Ruk1Ku3sNplq8KAFBO/21axXLPdIUNjWqc+SAO7Z/C8QHVa/xGjhuE3UcH5z?=
 =?us-ascii?Q?izXC2PIBNCeP1A1eph+iAyD/5bmKB6uD1t6UtR8sZO0fzTWjRpWA2W3BnGBV?=
 =?us-ascii?Q?ESUJT/7AC1/bfeA2rq7IPBbcgYmahNLsf4MoTIdbVowM2KgOBhEFthS7Z06X?=
 =?us-ascii?Q?srNN5rlkhYGuewBOIMgoLuW/XyyuS/IQQLhhxgyMBtfrmxMxn67zXy9JrnYj?=
 =?us-ascii?Q?C+F6rMrv50t1e1H9bMfqLDU2YGiE+TeedGmqGN/U4ImJLL+u35Ll2gtw7WVi?=
 =?us-ascii?Q?klpAdeCS5LPvmnykUY2MEPUsIz1xGzS9SBqEPEXPDUuKjZaZai9aABHbGqcg?=
 =?us-ascii?Q?FbZ8r0IpeomECXCqHxs29yfHrvBXSs74I8+OaX6eqp1RPyj5WnRCBA7C0BxS?=
 =?us-ascii?Q?Mti9JTbpnMuYPW94VpKlQnTpJif34DtHV1lEoSQWwmuVuu7zFXbn5+DNxwIf?=
 =?us-ascii?Q?7DTNEBmXHY8f1uijW8YdqLUpUEKrNSN1jZ5Ciz5wCU4bbnMUGzeUk8q8wS2w?=
 =?us-ascii?Q?b4HQMkAUImiNOALr/mkIhDQmg5oxG8Jkdv3LYLe+Hjk7F51i5iaUGnZcUpVv?=
 =?us-ascii?Q?3aHUb/EsIQMOnAHG+5IO/n9ZDqIg+u5OhMB9vlIIhAoKhp0gwx0IRYztDwCi?=
 =?us-ascii?Q?1l2lXUmTHcWcayzykJfm2b00Rs3VcfiQwgDCircARDR6Poy5K0uQHjK5v3sm?=
 =?us-ascii?Q?JBvYNqigdjb/AvIzMYbUPND8+LUTk1wCQRl47NQfgtlAZUxMz7O0zH5QdKd6?=
 =?us-ascii?Q?bWilfHn8zsJc/RVVdPearu5L4BpaOlU3aA6915o7UvASAlC2iZVH?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebadca54-3e21-4080-5c5e-08df4678d2c5
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 20:08:05.8613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OdpEhzyDjJsXKCX2IXJgeHRHjnZauCO0XmSD+VjKFB9z0n1/g6qlP/dTqbdqGRrZF4Fj1jRiFTme0ckHLryxKmfIP2Uz7+OouOSpHM/PAm+C0RsjXrfeTRS5+aYOWtPU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA6PR04MB210153

On Thu, Nov 19, 2026 at 05:59:56PM +0900, Nas Chung wrote:
> Add the control driver for the Chips&Media Wave6 video codec IP.
>
> The hardware contains one control register region and four interface
> register regions for a shared video processing engine.
>
> This driver handles the control region and manages shared resources such
> as firmware loading, firmware memory allocation, and coordination required
> by the interface register regions.
>
> It also instantiates and coordinates with the `wave6-core` child devices
> for firmware and power state management.
>
> Tested-by: Ming Qian <ming.qian@oss.nxp.com>
> Tested-by: Marek Vasut <marek.vasut@mailbox.org>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> ---
...
> +
> +static inline int wave6_vdi_alloc_dma(struct device *dev, struct vpu_buf *vb)
> +{
> +	void *vaddr;
> +	dma_addr_t daddr;

Nit try keep revise christmas order, check others

dma_addr_t daddr;
void *vaddr;

> +
> +	if (!vb || !vb->size)
> +		return -EINVAL;
> +
> +	vaddr = dma_alloc_coherent(dev, vb->size, &daddr, GFP_KERNEL);
> +	if (!vaddr)
> +		return -ENOMEM;
> +
> +	vb->vaddr = vaddr;
> +	vb->daddr = daddr;
> +	vb->dev = dev;
> +
> +	return 0;
> +}
> +
...
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/clk.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/property.h>
> +#include <linux/of_irq.h>
> +#include <linux/firmware.h>
> +#include <linux/interrupt.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/pm_domain.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/iopoll.h>
> +#include <linux/genalloc.h>

order by alpabet.

> +
> +#include "wave6-vpuconfig.h"
> +#include "wave6-regdefine.h"
> +#include "wave6-vpu.h"
> +
> +static const struct wave6_vpu_resource wave633c_data = {
> +	.fw_name = "cnm/wave633c_imx9_codec_fw.bin",
> +	/* For HEVC, AVC, 4096x4096, 8bit */
> +	.sram_size = 0x14800,
> +};
> +
...
> +
> +static u32 wave6_vpu_get_code_buf_size(struct wave6_vpu_device *vpu)
> +{
> +	return min_t(u32, vpu->code_buf.size, W6_MAX_CODE_BUF_SIZE);

now use min()

> +}
> +
...
> +
> +static int wave6_vpu_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np;
> +	struct wave6_vpu_device *vpu;
> +	const struct wave6_vpu_resource *res;
> +	int ret;
> +
> +	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "failed to set DMA mask: %d\n", ret);
> +		return ret;
> +	}

Needn't check when mask > 32, if check,

	return dev_err_probe()

> +
> +	res = device_get_match_data(&pdev->dev);
> +	if (!res)
> +		return -ENODEV;
> +
...
> +
> +	wave6_vpu_allocate_work_buffers(vpu);
> +
> +	pm_runtime_enable(&pdev->dev);

devm_pm_runtime_enable();

you have not enable clock here, so you need select PM at Kconfig, otherwise
if !CONFIG_PM, other register access will be hang because stub do nothing
of runtime pm when !CONFIG_PM

> +
> +	init_completion(&vpu->fw_done);
> +	ret = firmware_request_nowait_nowarn(THIS_MODULE,
> +					     vpu->res->fw_name,
> +					     &pdev->dev,
> +					     GFP_KERNEL,
> +					     vpu,
> +					     wave6_vpu_load_firmware);
> +	if (ret) {
> +		dev_err(&pdev->dev, "request firmware fail, ret = %d\n", ret);
> +		goto error;
> +	}
> +
> +	return 0;
> +
> +error:
> +	wave6_vpu_release(vpu);
> +	pm_runtime_disable(&pdev->dev);
> +error_detach_pm_domains:
> +	wave6_vpu_detach_pm_domains(vpu);

use devm_add_action_or_reset() to avoid goto in probe()

> +
> +	return ret;
> +}
> +
...
> +
> +module_platform_driver(wave6_vpu_driver);
> +MODULE_DESCRIPTION("chips&media Wave6 VPU driver");
> +MODULE_AUTHOR("CHIPS&MEDIA INC");
> +MODULE_FIRMWARE("cnm/wave633c_imx9_codec_fw.bin");
> +MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu.h b/drivers/media/platform/chips-media/wave6/wave6-vpu.h
> new file mode 100644
> index 000000000000..96d67e931e71
> --- /dev/null
> +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu.h
> @@ -0,0 +1,137 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause) */
> +/*
> + * Wave6 series multi-standard codec IP - wave6 driver
> + *
> + * Copyright (C) 2026 CHIPS&MEDIA INC
> + */
> +
> +#ifndef __WAVE6_VPU_H__
> +#define __WAVE6_VPU_H__
> +
> +#include <linux/completion.h>
> +#include <linux/device.h>
> +
> +#include "wave6-vpuconfig.h"
> +#include "wave6-vdi.h"
> +
> +#define WAVE6_VPU_PLATFORM_DRIVER_NAME "wave6-vpu"
> +#define WAVE6_VPU_CORE_PLATFORM_DRIVER_NAME "wave6-vpu-core"

If only use once, needn't define macro.

> +
> +struct wave6_vpu_device;
> +
> +/**
> + * enum wave6_vpu_state - VPU states
> + * @WAVE6_VPU_STATE_OFF:	VPU is powered off
> + * @WAVE6_VPU_STATE_PREPARE:	VPU is booting
> + * @WAVE6_VPU_STATE_ON:		VPU is running
> + * @WAVE6_VPU_STATE_SLEEP:	VPU is in a sleep mode
> + */
...
> +
> +#define W6_VPU_MAX_NUM_CORE		4
> +#define MAX_NUM_INSTANCE		32
> +
> +#define W6_VPU_POLL_DELAY_US		10
> +#define W6_VPU_POLL_TIMEOUT		300000

Need unit surfix

Frank

> +
> +#define W6_MAX_REMAP_PAGE_SIZE		(1024 * 1024)
> +#define W6_MAX_CODE_BUF_SIZE		(4 * 1024 * 1024)
> +#define W6_CODE_BUF_SIZE		(1 * 1024 * 1024)
> +#define W6_EXTRA_CODE_BUF_SIZE		(256 * 1024)
> +#define W637DEC_WORKBUF_SIZE_FOR_CQ	(3 * 512 * 1024)
> +
> +static inline bool wave6_is_product_w_series(u32 code)
> +{
> +	return code == WAVE617_CODE || code == WAVE627_CODE ||
> +	       code == WAVE633_CODE || code == WAVE637_CODE ||
> +	       code == WAVE663_CODE || code == WAVE677_CODE;
> +}
> +
> +#endif /* __WAVE6_VPUCONFIG_H__ */
> --
> 2.41.0.windows.3
>
>
