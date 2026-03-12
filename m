Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7433537D7
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 14:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773325107; cv=none; b=tTS3LF+SyniPSNMvbsYOriqGao24EHqjrBUPrk/dg0m/WnsnLm6XV2cax6s/gzeu1RbXM6zmzpLlo7EWUK6jUVxmzY2N9PcolDeXwTT14ktQ4k7uI1NylntiI+hjX8ex7oeLKk4hfEnM6ulFDUFiiKlz254ZlWJs8G1W9uWrKCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773325107; c=relaxed/simple;
	bh=WBp6aG8OIPb/dsUpez1Ic8Jytais2oVJHc39FfdijWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UK8muLSi7xYuDyECKA/J7IQ9cxbVk1fPddxUFyPOs0Eqh8lYcROMr7SBPzjoO+sUY/D8KjG2avu5+nDeZweHRSjtho37PR6AiWz4eyDqN4+u13yUtmTdBtWCvcJfDG/qKehAmTWDxq9D7/YON04x+GbTYic9uu8N921YPv1WzJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pC9s3oCR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dSpduiLU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pC9s3oCR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dSpduiLU"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C8kfpo3666513
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 14:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y7xFTGXb5DPsTd4oxsCvF8mg+z4yb1CrqE2iNac3ooo=; b=pC9s3oCR3E3pJGcF
	6UBJOzneozRH8yHPflsxqstBz8NmkNtzIcCOMzWl7Mf8bniEEG3tg1o8Gf6eOER8
	iEH5SI48La5x3ShD7d2U00BqfTQnGC86RMZBVy2//Y+3lQg8W+seoMLrQOG0EE+z
	dNM8ykzfkh7kNSve4jqCX2isXmsW6au2z2aD2Vl0RhkvgqBsHAjer2W60uOZM/ou
	G8q60QJZpk6R8OE+8EDLj6gFvBCIXS+427OcZgRvCgssFzBbiFfuWMcbTcw+C5VY
	9kymaHldyvZ6go56cowbutM/NN/MqcTN7b0pv0p53rwa2PzV2geT4iFmeTzVyLMA
	ChezqA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh60jcde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 14:18:25 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5ffbe27449cso17918633137.0
        for <imx@lists.linux.dev>; Thu, 12 Mar 2026 07:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773325105; x=1773929905; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=y7xFTGXb5DPsTd4oxsCvF8mg+z4yb1CrqE2iNac3ooo=;
        b=dSpduiLUmJTHdJEcpQoGMYmWAjwwLJ/bI+eEt3rQ41ZIBz/DPGVbxWOmNOKbAnudfC
         VoJ8MRiGnhaaCmU3Tq6WNWl2+lU87Hd5z4Q2GFNxtc1wIs/1UOk8Hj48xednhpMGWZYT
         T762nnWRZXs/cGoJo/eJPzhLDT2ys7pxPP4sf/nVFGRpFTomLcPftyDpnWOYamFkWOAQ
         KhXP7Fbzm+LRr44CH3wAbzwCs9+2xmtDl7Ts13IfEll7Z1OY7PaLGtnBj2VTtWrU14ZT
         FBIy5XEAV2EvIIEPA7HQpBJIXExeVCWoYSrCi6xXw9VFdCw8wP7FcJl7ZIUIOwRORTCD
         gcxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773325105; x=1773929905;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y7xFTGXb5DPsTd4oxsCvF8mg+z4yb1CrqE2iNac3ooo=;
        b=hT9Wk5eVqKxeIOIMjWXONPz59Cnmp4t9u2frfy5RSz3A9KtpzS17T5e68Encc482qF
         5gU5XXTCbGk6sW5Ils+id28rJCKaOCHhrlIIwmr+drM2zhFFrpoF3L6tV0XbW1TeUObJ
         5BEvSATOtXZ7mBqg8VLW11cBV8MlkNCToTHc4gO57Y6F7+z25h3+8Mgg6XBEtC4dJyxu
         s2JHSWYGOjdsKy2oNFwGbRoWw+VYqdd0SioRlxjZ3n/sm990+xWL5j9ubJQDkplj6bEO
         9YA2lk391b1ztiOc1+sxiGg6b++qPFJGhhSLTsOha4rDwC+pG5QMFWpKOtVXkpFo+SCr
         TWzA==
X-Forwarded-Encrypted: i=1; AJvYcCWNEzI4HB+bg7QfnUIJWnSfcmVU1OvfBJlEDSUc+0nH6DmzRlSkeBdNaSIwN8KWp+2e4FE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzUUtSdUh4sjSzyU9JXN2uiQIYjF93UHiWt1p29ynO/CQxlieUY
	IMH/GSe3dT+c/gHOLxV7fNaA2eYx3JIA78cSISztvt76gz7L7LQ+/2XAl46ugd29218RsXXNKex
	TWF4N2hS1qpW8hj2vxRpjw+9n9bTLAUWvpfUjuMOe8ed06Nl/To28ImU=
X-Gm-Gg: ATEYQzwWtUGe9H5ZZWa6kq3mXUDQ5dJTRYKY28BHz3se7/PfmAGwYh0k960GwXEiCks
	+Mfez3W0t963+lt9GJxaAa61RWA6DCjAQs/1/jJxmGDbnu9fykGBr2wZcxj8aeineOKZoHrsHvH
	fWt+8pbMgr+SpAfNi8OCYlLD4fIcH/6sjuvbOeeDFi1G05d0RPcSdG1I1QeldbPf+x0NGfiscIo
	P3SJHqUvBgoODSkntxLx0vG4nqV/u/tljzV3noHeA0zBBrGGvSPsUq5SkUmqYhNs2MVr9wp7/o5
	1NI/D7t191UqyHy7sV+9HVQNZ3baSax2jBRaw21S+osWyjkpalRiU/liU5PZ2n6MgeJ+Th6alot
	IvO4eF3LcpH7Sjrf2W15erQ97SW7X7/p7S4yozmcM2m+S3eO9/gzGs6XSXK56TrySr4mKb1Vjon
	al5avoU4S7Laub6TukesQppegDAI4iD2rqaZk=
X-Received: by 2002:a05:6102:f11:b0:5ff:eaf0:6e77 with SMTP id ada2fe7eead31-601f4a44a79mr1406602137.17.1773325104550;
        Thu, 12 Mar 2026 07:18:24 -0700 (PDT)
X-Received: by 2002:a05:6102:f11:b0:5ff:eaf0:6e77 with SMTP id ada2fe7eead31-601f4a44a79mr1406556137.17.1773325104042;
        Thu, 12 Mar 2026 07:18:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e268sm977710e87.21.2026.03.12.07.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 07:18:22 -0700 (PDT)
Date: Thu, 12 Mar 2026 16:18:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH v10 2/3] of: factor arguments passed to of_map_id() into
 a struct
Message-ID: <dyjdwxaq4oc7ahri3iuhnmobh3gwmn6drhox7t2elep4rlqhuq@fe4gp5t7q5r5>
References: <20260309-parse_iommu_cells-v10-0-c62fcaa5a1d8@oss.qualcomm.com>
 <20260309-parse_iommu_cells-v10-2-c62fcaa5a1d8@oss.qualcomm.com>
 <esfzpgpgenydif2sxahsetkglz6kewsgjhkmzr6ulrrkctnkbq@a4zsfdmhbxui>
 <27edd195-b0d3-4214-9df3-74a84da1e3e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <27edd195-b0d3-4214-9df3-74a84da1e3e1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 98SIm7Vcse2H68Ipf_A7lP2XYUNytmJt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDExNCBTYWx0ZWRfX2X3NGfGx2bZq
 KM1579f503XXRH6fdr/XfSfoI8v13glU74i0hYX1I7UIg6yThvugQf7gBm2TLn6uBpnHMqeul9p
 14gz/t3Dk0irqHIA8Ed0d49mWjEBu7j4huGtidlbBJg4OYxqR0uz64eCLVWUcnSg+lgN8OUbA/7
 CuY4/x4poYufRt+PU42A2R06MUFHXAVNEBfs0s55paqOAqwFh20yYk2v9k6mAiyTw6e7SOccoM3
 higgWOHD+7MT5Ft00ppSlzjko8b/0C/fCjPrmtsAqnODf4ES6yk0O4vzhot9mXLNx2wTxvkPm1r
 k6orCmcjw5M14eIa470pL37RMyoIbmh8z2EhNueEPRQflaLGPoLV8ak1d5EKwuDI7B81DJb0mSQ
 AiEXbs1lslQKT2RmHFLg3UZwKdl5ypT2NhoI7N9XSs4MwK7HW0St3REW2xBevbymSQhfb8vfNg2
 279f1FeT2e24YIBrVIw==
X-Authority-Analysis: v=2.4 cv=DsRbOW/+ c=1 sm=1 tr=0 ts=69b2cb31 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=KPxCMH61eqygQ3DODZ0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: 98SIm7Vcse2H68Ipf_A7lP2XYUNytmJt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120114

On Thu, Mar 12, 2026 at 05:12:51PM +0530, Vijayanand Jitta wrote:
> 
> 
> On 3/10/2026 2:53 AM, Dmitry Baryshkov wrote:
> > On Mon, Mar 09, 2026 at 01:03:38AM +0530, Vijayanand Jitta wrote:
> >> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> >>
> >> Change of_map_id() to take a pointer to struct of_phandle_args
> >> instead of passing target device node and translated IDs separately.
> >> Update all callers accordingly.
> >>
> >> Subsequent patch will make use of the args_count field in
> >> struct of_phandle_args.
> >>
> >> Suggested-by: Rob Herring (Arm) <robh@kernel.org>
> >> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> >> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> >> ---
> >>  drivers/cdx/cdx_msi.c                    |  5 ++-
> >>  drivers/iommu/of_iommu.c                 |  2 +-
> >>  drivers/irqchip/irq-gic-its-msi-parent.c | 11 ++++--
> >>  drivers/of/base.c                        | 63 ++++++++++++++++----------------
> >>  drivers/of/irq.c                         |  8 +++-
> >>  drivers/pci/controller/dwc/pci-imx6.c    | 16 ++++++--
> >>  drivers/pci/controller/pcie-apple.c      |  5 ++-
> >>  drivers/xen/grant-dma-ops.c              |  4 +-
> >>  include/linux/of.h                       | 12 +++---
> >>  9 files changed, 76 insertions(+), 50 deletions(-)
> >>
> >> diff --git a/drivers/cdx/cdx_msi.c b/drivers/cdx/cdx_msi.c
> >> index 63b3544ec997..03232b5ffbca 100644
> >> --- a/drivers/cdx/cdx_msi.c
> >> +++ b/drivers/cdx/cdx_msi.c
> >> @@ -121,6 +121,7 @@ static int cdx_msi_prepare(struct irq_domain *msi_domain,
> >>  			   struct device *dev,
> >>  			   int nvec, msi_alloc_info_t *info)
> >>  {
> >> +	struct of_phandle_args msi_spec = { .np = NULL };
> > 
> > Why do you need to set it? Parse functions ignore passed args, don't
> > they?
> > 
> 
> The parse function does check arg->np on input — if it is non-NULL,
> it is used to match only entries targeting that specific node.
> 
> Also, there is this existing path in drivers/pci/msi/irqdomain.c which
> pre-sets the node and passes it as input to of_msi_xlate(), so the node
> pointer is not ignored by the parse code:

Is it only being used for MSIs? If so, can we make that explicit in the
API by having the 'filter' device_node pointer?

> 
> u32 pci_msi_domain_get_msi_rid(struct irq_domain *domain, struct pci_dev *pdev)
> {
>         struct device_node *of_node;
>         u32 rid = pci_dev_id(pdev);
> 
>         pci_for_each_dma_alias(pdev, get_msi_id_cb, &rid);
> 
>         of_node = irq_domain_get_of_node(domain);
>         rid = of_node ? of_msi_xlate(&pdev->dev, &of_node, rid) :
>                         iort_msi_map_id(&pdev->dev, rid);
> 
>         return rid;
> }
> 

-- 
With best wishes
Dmitry
