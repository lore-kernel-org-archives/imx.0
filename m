Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11EE264A65
	for <imx@lists.linux.dev>; Wed,  4 Mar 2026 23:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772668092; cv=none; b=ZCIXHpQ6THMh05ImZvcf3ygk0TNn4PETQ9Xmwhx9RwMkHx1NzJaPMZSoicDisFS66LNwiUfresSQ1+z1u1p8xgODStR4sN4Dnx/GqvJBw9Dbfb/PsFYtl51evop6ps0M0Z0dedjCt0VKQxoO+UaKCbo/a49ceLjG0D507ePWFJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772668092; c=relaxed/simple;
	bh=iDgzPdTfY/YmV2gOcRHkK0iaClE0CXMdo2FdxhnA42g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HbibfVNSajVzmrWhrLo2RrTinDRhDLQQB9FGNNQs8gzZMAh2ZXlyog0ASw42m+VKJdurnxKhU8efl9XM/14I7TxpqSNEMskDyhkzmkOYVO9flpN7nWWIo4f/an4aEOytSRoPscseEs9b/7QwwZyJfO/Hl4G+/sWrPWP08aOdvz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aVdHPngs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RoKnMfVx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aVdHPngs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RoKnMfVx"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624KLEfC3616153
	for <imx@lists.linux.dev>; Wed, 4 Mar 2026 23:48:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UJZs6BbEFPW8OUhQ3kN9LgfRkepS1RZtU3P9VDciA7k=; b=aVdHPngsjbyqgrIW
	m0MJv9aGvPSOv7JHKGUvwROWy47iUsBdiQmtf8e0Vc2Bz3qNf7NAxjbYrjpXQhaX
	EKCyjBQQVy3MK7f/jU4u0nknS/GaC6/sGyDa+XlKtdvBgiyRJ0lbzrrfNrkVMuBh
	f3euURbkqHuLnHx12azkHWv8cwQiOUvW0nubrOJYqPhT8oL5TQ+VQUCQ34e+5xE5
	9M3r3YAGA6/v6aUxLAxzIZ37vMVDkG7+r5SY5xMSNg+q9Wppsol1jYxs64OOMeaL
	dhQKmoQFsQ/I5gNQKL8MQ2Os574Lbh57rptn8P8Aj4ezUttSie6dKLNuheXOOduW
	hmaQuQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuptgf40-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 04 Mar 2026 23:48:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb37db8b79so5399755585a.3
        for <imx@lists.linux.dev>; Wed, 04 Mar 2026 15:48:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772668089; x=1773272889; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UJZs6BbEFPW8OUhQ3kN9LgfRkepS1RZtU3P9VDciA7k=;
        b=RoKnMfVxE6O2HT3IeerTpUfGjJZAcp76fV0sbOqMYIoS3FLX4XzcC1xcu9ZHfNSEM8
         6ACNJzkZOzQBJubLqiawpa0Q1M1T1t/MPmWWHLqKQX8r2Qqh8NxBRuN9J72s2eMAtvOX
         8aitDa2qpdNzvWnBYjsmZVkmuedfRlKtpi+MzqhnM6BEIUz7AM+fpMgQe/FOj7tczG/e
         3mgXUJSLitxz3ceWhobLdMQ0+U+s55FZcNm1z6Be5HkKT6fAzNSg6/ZPtBYVEIA+et7L
         VXGKhs/MpSwWsmde+C1QftYmNahzgpJCsGF58BFceO+A1eGYtW2CYZabAVlXlF/9sC9V
         i/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772668089; x=1773272889;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UJZs6BbEFPW8OUhQ3kN9LgfRkepS1RZtU3P9VDciA7k=;
        b=PlktRqVCb5O4r4wwX2sAipQ9uyqYIpsnK+wVPOHbHpSMyNCGeA4zhJzAinnCr4j17R
         i3V5x8d2FEnEEOgyEoNs+slHu5QuNyZNJlzTg4j1RXRyRcTjAxP7+g54D+A2SnaWEsHF
         /ecvZrxI9Yfb3TUu6Un9/3d9xMsiZr2+UJPA7grdISeFaGXugrvefBd4i+KIsXCsQESK
         8OcYwLI5B4lTj5pw+eLMX9IHCJt6Er6lQFGje6DFHVsXurzv/TZQ7uEDhoBiKjoX1XK8
         YjunjfjcomTGjoHtqQpFGrJXSujh01XQVKOmhkoP2v+mOQorPZFXy5pr81yppjBCZOMj
         veiQ==
X-Forwarded-Encrypted: i=1; AJvYcCULYvRWLtHI1R395zQ8LRDcUXB90jwxtyiP6oRc2vvYlYLLGtco9Nl+9BulHZteU2HfkMI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxsGpmtR74YPueYZs3hMDOLLepRd/kU13yZT65LbXQT85YR68M+
	Xhq7NFf6XQXaqFZplHPXLM64CAdCz9z/k3Sd8b7wJR1yEQKx6+rZTf3UY4Kp6epr5dOWQHkwFXz
	4UTUv1a5wE+aBkCnOjo2GaYR0vz9kUHjvxiZvmR0k8LlhX5ChuY1QFZs=
X-Gm-Gg: ATEYQzyzXb9fLJEKtcMFT/6dAYFAVYOrefQpW3enM9eZiOw2t3qqHc0LUVsvA4AfCoX
	czsYY70kWl+CcHMxvnOPCGdFvSW5irfCaNC13vg6uXa1KSFHSoUCTHDd2jfF+X1N4ra/UCen12U
	0Ez+sJJdVbxchqTXegm0bVltUNkdZo1PkWSn5ZwWEN3JKo0Gna1dQQ4ZGp4rhiWjUUQSvX3zHXO
	gstQ5mkxUN7RbXf6/Ynh2U0Y/kZNBw7yhCn/1l70IetdZRrDWE/FF7xcLlXkEzjZ23yaCWXcXP3
	sVIFYym868RkfsLAHyKjytwUBVHuLgMzLwBSY0JvsYkIkP3JugQz0WBSNiN5qdOVUlVHKum+xou
	tjWEIGKImM9bRN/JOxgVL8Kt6efZY4RUc9j/aaPuT3tGt3FMdLVA+7KPNA8OsbX1Rn1iBYCZ0Ak
	0pg2plIq8tAwKjIp2RD5SBFx15XMQ9e/tL34U=
X-Received: by 2002:a05:620a:460b:b0:8cb:7b27:9336 with SMTP id af79cd13be357-8cd5aedbea3mr527939285a.5.1772668088890;
        Wed, 04 Mar 2026 15:48:08 -0800 (PST)
X-Received: by 2002:a05:620a:460b:b0:8cb:7b27:9336 with SMTP id af79cd13be357-8cd5aedbea3mr527933085a.5.1772668088325;
        Wed, 04 Mar 2026 15:48:08 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a12357fa9dsm1597108e87.33.2026.03.04.15.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:48:07 -0800 (PST)
Date: Thu, 5 Mar 2026 01:48:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Marc Zyngier <maz@kernel.org>, Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
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
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, imx@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v9 1/3] of: Add convenience wrappers for of_map_id()
Message-ID: <iuy4mdv4hr7qdem2zm3yg5eostdhlcta6tifqasyov3ag26yje@huragoeossqf>
References: <20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com>
 <20260301-parse_iommu_cells-v9-1-4d1bceecc5e1@oss.qualcomm.com>
 <86342janlx.wl-maz@kernel.org>
 <d3687764-024d-4dbc-9342-8edc9b4f1fdd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d3687764-024d-4dbc-9342-8edc9b4f1fdd@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE5NiBTYWx0ZWRfXw0If/PjbPIBJ
 2hJ0WKiIp9kf52bF188BDtBt098jZx9RDc9X2DWFIHKJjk+w5wm6230mzbrqokb1PvQ5Pnwuuj2
 wzz6h2OX2Gpim6vi1EKMdfA67/rKW9sxZSaoE+BHbF9Wml7gp+s9fi9GItgiaFjSRDthJPRxN9z
 SYzBiWozs0k7vvUXJZ0iXdpRVGJBHHqnFcyE/fo6+fqoi3ZhHeMLBRD3qzqsWd1AGY1+ykSm+B2
 t6kGfgqfUyHm1idih3bGckQB+7coUsgObDc4gCFAIc6lDNO6C7WUpCqXU5Wnk5eEoamngC80wwQ
 oRMIJtyxCIpiSavU09OPGnpsMqcMrUI5tAtZW29yWzPyR3S7k/rzyUTfVREDZRE1tRNegB67hBo
 hwZ/kkey/QrdscSNzWK2Nxoryh1OWBaaeWdvNxFz+gRQq2XZGBwemZ5R+rQq6BQpEhyQsPn87h8
 U5GZro6BYa4qVnTsWuQ==
X-Proofpoint-ORIG-GUID: LXpjgnJFWyh0jbuxgWumygR_KdESQPs9
X-Authority-Analysis: v=2.4 cv=Ddsaa/tW c=1 sm=1 tr=0 ts=69a8c4ba cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8 a=srtYxZOELw0pIWJIyL0A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=a-qgeE7W1pNrGK8U0ZQC:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: LXpjgnJFWyh0jbuxgWumygR_KdESQPs9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_09,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040196

On Wed, Mar 04, 2026 at 03:02:14PM +0530, Vijayanand Jitta wrote:
> 
> 
> On 3/1/2026 3:16 PM, Marc Zyngier wrote:
> > On Sun, 01 Mar 2026 08:34:19 +0000,
> > Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com> wrote:
> >>
> >> From: Robin Murphy <robin.murphy@arm.com>
> >>
> >> Since we now have quite a few users parsing "iommu-map" and "msi-map"
> >> properties, give them some wrappers to conveniently encapsulate the
> >> appropriate sets of property names. This will also make it easier to
> >> then change of_map_id() to correctly account for specifier cells.
> >>
> >> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> >> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> >> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> >> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> >> ---
> >>  drivers/cdx/cdx_msi.c                    |  3 +--
> >>  drivers/iommu/of_iommu.c                 |  4 +---
> >>  drivers/irqchip/irq-gic-its-msi-parent.c |  2 +-
> >>  drivers/of/irq.c                         |  3 +--
> >>  drivers/pci/controller/dwc/pci-imx6.c    |  6 ++----
> >>  drivers/pci/controller/pcie-apple.c      |  3 +--
> >>  drivers/xen/grant-dma-ops.c              |  3 +--
> >>  include/linux/of.h                       | 14 ++++++++++++++
> >>  8 files changed, 22 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/drivers/cdx/cdx_msi.c b/drivers/cdx/cdx_msi.c
> >> index 91b95422b263..63b3544ec997 100644
> >> --- a/drivers/cdx/cdx_msi.c
> >> +++ b/drivers/cdx/cdx_msi.c
> >> @@ -128,8 +128,7 @@ static int cdx_msi_prepare(struct irq_domain *msi_domain,
> >>  	int ret;
> >>  
> >>  	/* Retrieve device ID from requestor ID using parent device */
> >> -	ret = of_map_id(parent->of_node, cdx_dev->msi_dev_id, "msi-map", "msi-map-mask",
> >> -			NULL, &dev_id);
> >> +	ret = of_map_msi_id(parent->of_node, cdx_dev->msi_dev_id, NULL, &dev_id);
> >>  	if (ret) {
> >>  		dev_err(dev, "of_map_id failed for MSI: %d\n", ret);
> >>  		return ret;
> >> diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
> >> index 6b989a62def2..a511ecf21fcd 100644
> >> --- a/drivers/iommu/of_iommu.c
> >> +++ b/drivers/iommu/of_iommu.c
> >> @@ -48,9 +48,7 @@ static int of_iommu_configure_dev_id(struct device_node *master_np,
> >>  	struct of_phandle_args iommu_spec = { .args_count = 1 };
> >>  	int err;
> >>  
> >> -	err = of_map_id(master_np, *id, "iommu-map",
> >> -			 "iommu-map-mask", &iommu_spec.np,
> >> -			 iommu_spec.args);
> >> +	err = of_map_iommu_id(master_np, *id, &iommu_spec.np, iommu_spec.args);
> >>  	if (err)
> >>  		return err;
> >>  
> >> diff --git a/drivers/irqchip/irq-gic-its-msi-parent.c b/drivers/irqchip/irq-gic-its-msi-parent.c
> >> index d36b278ae66c..b63343a227a9 100644
> >> --- a/drivers/irqchip/irq-gic-its-msi-parent.c
> >> +++ b/drivers/irqchip/irq-gic-its-msi-parent.c
> >> @@ -180,7 +180,7 @@ static int of_pmsi_get_msi_info(struct irq_domain *domain, struct device *dev, u
> >>  
> >>  	struct device_node *msi_ctrl __free(device_node) = NULL;
> >>  
> >> -	return of_map_id(dev->of_node, dev->id, "msi-map", "msi-map-mask", &msi_ctrl, dev_id);
> >> +	return of_map_msi_id(dev->of_node, dev->id, &msi_ctrl, dev_id);
> >>  }
> >>  
> >>  static int its_pmsi_prepare(struct irq_domain *domain, struct device *dev,
> >> diff --git a/drivers/of/irq.c b/drivers/of/irq.c
> >> index 6367c67732d2..e37c1b3f8736 100644
> >> --- a/drivers/of/irq.c
> >> +++ b/drivers/of/irq.c
> >> @@ -817,8 +817,7 @@ u32 of_msi_xlate(struct device *dev, struct device_node **msi_np, u32 id_in)
> >>  	 * "msi-map" or an "msi-parent" property.
> >>  	 */
> >>  	for (parent_dev = dev; parent_dev; parent_dev = parent_dev->parent) {
> >> -		if (!of_map_id(parent_dev->of_node, id_in, "msi-map",
> >> -				"msi-map-mask", msi_np, &id_out))
> >> +		if (!of_map_msi_id(parent_dev->of_node, id_in, msi_np, &id_out))
> >>  			break;
> >>  		if (!of_check_msi_parent(parent_dev->of_node, msi_np))
> >>  			break;
> >> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> >> index a5b8d0b71677..bff8289f804a 100644
> >> --- a/drivers/pci/controller/dwc/pci-imx6.c
> >> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> >> @@ -1144,8 +1144,7 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
> >>  	u32 sid = 0;
> >>  
> >>  	target = NULL;
> >> -	err_i = of_map_id(dev->of_node, rid, "iommu-map", "iommu-map-mask",
> >> -			  &target, &sid_i);
> >> +	err_i = of_map_iommu_id(dev->of_node, rid, &target, &sid_i);
> >>  	if (target) {
> >>  		of_node_put(target);
> >>  	} else {
> >> @@ -1158,8 +1157,7 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
> >>  	}
> >>  
> >>  	target = NULL;
> >> -	err_m = of_map_id(dev->of_node, rid, "msi-map", "msi-map-mask",
> >> -			  &target, &sid_m);
> >> +	err_m = of_map_msi_id(dev->of_node, rid, &target, &sid_m);
> >>  
> >>  	/*
> >>  	 *   err_m      target
> >> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> >> index 2d92fc79f6dd..a0937b7b3c4d 100644
> >> --- a/drivers/pci/controller/pcie-apple.c
> >> +++ b/drivers/pci/controller/pcie-apple.c
> >> @@ -764,8 +764,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
> >>  	dev_dbg(&pdev->dev, "added to bus %s, index %d\n",
> >>  		pci_name(pdev->bus->self), port->idx);
> >>  
> >> -	err = of_map_id(port->pcie->dev->of_node, rid, "iommu-map",
> >> -			"iommu-map-mask", NULL, &sid);
> >> +	err = of_map_iommu_id(port->pcie->dev->of_node, rid, NULL, &sid);
> >>  	if (err)
> >>  		return err;
> >>  
> >> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
> >> index c2603e700178..1b7696b2d762 100644
> >> --- a/drivers/xen/grant-dma-ops.c
> >> +++ b/drivers/xen/grant-dma-ops.c
> >> @@ -325,8 +325,7 @@ static int xen_dt_grant_init_backend_domid(struct device *dev,
> >>  		struct pci_dev *pdev = to_pci_dev(dev);
> >>  		u32 rid = PCI_DEVID(pdev->bus->number, pdev->devfn);
> >>  
> >> -		if (of_map_id(np, rid, "iommu-map", "iommu-map-mask", &iommu_spec.np,
> >> -				iommu_spec.args)) {
> >> +		if (of_map_iommu_id(np, rid, &iommu_spec.np, iommu_spec.args)) {
> >>  			dev_dbg(dev, "Cannot translate ID\n");
> >>  			return -ESRCH;
> >>  		}
> >> diff --git a/include/linux/of.h b/include/linux/of.h
> >> index be6ec4916adf..824649867810 100644
> >> --- a/include/linux/of.h
> >> +++ b/include/linux/of.h
> >> @@ -1457,6 +1457,20 @@ static inline int of_property_read_s32(const struct device_node *np,
> >>  	return of_property_read_u32(np, propname, (u32*) out_value);
> >>  }
> >>  
> >> +static inline int of_map_iommu_id(const struct device_node *np, u32 id,
> >> +				  struct device_node **target, u32 *id_out)
> >> +{
> >> +	return of_map_id(np, id, "iommu-map", "iommu-map-mask",
> >> +			 target, id_out);
> >> +}
> >> +
> >> +static inline int of_map_msi_id(const struct device_node *np, u32 id,
> >> +				struct device_node **target, u32 *id_out)
> >> +{
> >> +	return of_map_id(np, id, "msi-map", "msi-map-mask",
> >> +			 target, id_out);
> >> +}
> >> +
> > 
> > Any particular reason why this is made inline instead of out of line
> > in of/base.c? Also, some documentation would be helpful for the
> > aspiring hackers dipping into this.
> > 
> > Other than that,
> > 
> > Acked-by: Marc Zyngier <maz@kernel.org>
> > 
> > 	M.
> > 
> 
> Thanks Marc.
> 
> I made them static inline mainly because they’re just trivial wrappers
> around of_map_id(), so keeping them in include/linux/of.h avoids adding
> new global symbols/exports and keeps the callsites simple (similar to
> the existing of_property_read_*() inline wrappers).
> 
> That said, I don’t have a strong preference—if you’d rather have
> out-of-line helpers in drivers/of/base.c, I’m happy to respin accordingly.
> 
> Re Documentation, Sure I'll add comments for of_map_iommu_id() and
> of_map_msi_id() in follow up patch.

... in the next iteration, please.

> 
> Thanks,
> Vijay
> 
> 
> 

-- 
With best wishes
Dmitry
