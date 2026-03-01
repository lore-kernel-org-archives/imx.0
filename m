Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB6B74C14
	for <imx@lists.linux.dev>; Sun,  1 Mar 2026 10:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772359352; cv=none; b=j+WKymWgdSjkyrZ1btuEU95/wE5pWbo+Qg8K97593qWEmfiYCmuylJowHM3r9dm0N96QZh2OQ+awoCZPggN7bPRBn3pzQz3iEu6GkNNdzChSLMtEgdLIILfMvZAVqX37NZdB0KBQPiuUMGLaKJRo1l1erx797xp2uYz2O4oqq5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772359352; c=relaxed/simple;
	bh=0qeqXrjHsjlCMKeBisiWhuDOAfV33+sVSyKxf6rWuNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jA/XCtLwpfHMBgGym+S/KvT2ZIe7Ae+xWcnzk/reDuvzz3sAiZsKGcwPDf3ukgSXzok8w83lmstcVA/45+/ragDjisUYCg6ak0AE2b1QuTHLc9cyqk8IQ+yvfXQBf6NpG8638QTkz+NgXhWDSX7HedyGYe7LcYZEaziUmq6CkcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MFDwcsRM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dyno93M1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MFDwcsRM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dyno93M1"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6217ljR8498551
	for <imx@lists.linux.dev>; Sun, 1 Mar 2026 10:02:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0xpqoMV9nCv7588O/2lb3+Dy
	gEwHNzZq2QKo2gKrDEI=; b=MFDwcsRMUoLALjslv9VY/VdAydAxc3/eD8jPp+b0
	3dbJ7aTibd/9b6GV9IF2gWn6gSpe/I3btoHNAVjlHAbEwxC6eHSVdnwqOitswsKK
	BFmc5ona0teu2h6YmGm5UzCmJDzSNJQeil3gsT4tu2E/DuMyeeU2M4A9oTkvAzIU
	6Nj7aXpW3vgAMvolk/oLAysN+VfAUn/SXHBScRSfZ3wrgr7md5skbPHMUU+5C7cg
	PDWi6o6khIMR296Rtf2LMqviKvYVMgehPnRNL1VGGCDd7pD1khwDOQnaVh1y70D6
	5NTfRB58X2oh3kZa0pAyMmBzeNyGrUi6kb5A/jodMBBWgw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cksfd2f9s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sun, 01 Mar 2026 10:02:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50340e2b4dfso375999151cf.3
        for <imx@lists.linux.dev>; Sun, 01 Mar 2026 02:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772359348; x=1772964148; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0xpqoMV9nCv7588O/2lb3+DygEwHNzZq2QKo2gKrDEI=;
        b=Dyno93M1y91qSye4D+Fe2FJlb+P44kP3OxwLR3a7of1k4TJrP5l12SatPnPjEb+QRh
         ebfmxLVgLVkrEtzFh7mcTMYXJVuqYx9BYKUz93ftnpoUvnylxTirq2w9/fzVZxu+vgth
         KREaZLaXTreu6MUT8JPSSVaJKCWXbx0ngKK2hG72t/zk/M6kEsExe8IX1ABNIgB/ftF0
         mj0ZOoPzz760+tK4YQ7Rf4Z3eLB4W82oxL84vwfNMgE1ZAsAaeUZyH63Mq3goJXV+zj3
         VOLi2Dw2Y/2THkvUnXL8+BgkOhXx3lv2w+BZhtxzAwzpmCc15asIbzKlbpPU721Jo54B
         orIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772359348; x=1772964148;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0xpqoMV9nCv7588O/2lb3+DygEwHNzZq2QKo2gKrDEI=;
        b=Qrw/W3kTAqvYtWOk6YHKbDH6gcbOopxVjmwIPvKa9fgN7Hq1LcGb92rrwQ7AjiY6CX
         ZMiogSnfm/XJoq0aUeFlPjM4YXqbPLtwPbMXimJxgxuIkfAXZfH4Q2uc5Ph3hRQEOBqm
         e7WlgEXW1aDIh7uKg0h5iLVoZRkliCfTKfxn30HHGXbeGs88J6miyBIvakwxCHgptK4z
         bPz5+eEsmmxY3rctPr6NlR6gmrLfr6GSvbtT/ZyVKcR9Gnvr7pj/RM7G+TsbH5AWAlzC
         Cv2uDLMrExLFHohzBEqhcqezvEnncN5A/ko797Iet39LhRpKBDHnv2q2P0fZH9RBqJU3
         +9rQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlfLIEEnviQReCAUglcgHNkcEiKRlI8sWlGM4KeQqv483GfBeRRZTO+kIlfMrwgh2p/Ow=@lists.linux.dev
X-Gm-Message-State: AOJu0YzDtKlaEoRYH6YN6AMJ6IhxN6gyVghTU/r6jHYZRk/qVdwe9ttR
	u+5wLDUqQpcK7Bm+KUNWUSx3LlK/P+lVNkDoSFW2OV5RnpixHEvAzN0FlOysmpH+Aj0BP2ks4ll
	iQuDeBy485JdG+AOMBXjqgXeWayCBKLFQAUIx2YhiMtxjLCGZXcygljo=
X-Gm-Gg: ATEYQzzoTLxqM4b/bdX5vq8tQkKSfQI4qxfIt4+m632YxuAaMpNkZTwJ1yd1U9tF/88
	BpKjcZSZfzucJGCnPZ2yVMPdT+VcGhe5CW0yexxWa03ppoXuZvCHxlBcqQc7BIkATA0XFPltlOP
	e97hbrMlV1IcGuYj+5nEd5VMHlHUzjqdshXJcNdyK+/D7VrZkbMfj7z4Wvy3nangMeTlo+/e2+4
	UVMEiBanHUJXc6Fyt3r1JXfNUlf6MheUoDiD6uB8j4lALTy0bHRra5cjqU9HvSoevJ1feKgq95H
	y2wh1LS9ZrlJKLENjcESNoeZFRcW2Ee6zj7vun1RqUXnIZKSa1qQQ4/W+l91/G1DrsDh2NEUKMr
	E7OgHIdkYTGrPwgbbrgsyXK0p1bGoAUvwhTxSQHeQ76ayPNaEMG1eKTzO2iXtUau2eaP16SKl+m
	e6saWnjwTWoSTIaStBV535EIbZunrVdFtZwuQ=
X-Received: by 2002:a05:620a:2904:b0:8b2:e17a:37 with SMTP id af79cd13be357-8cbc8df0942mr1244110985a.43.1772359348316;
        Sun, 01 Mar 2026 02:02:28 -0800 (PST)
X-Received: by 2002:a05:620a:2904:b0:8b2:e17a:37 with SMTP id af79cd13be357-8cbc8df0942mr1244105085a.43.1772359347812;
        Sun, 01 Mar 2026 02:02:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f302285fsm22929771fa.44.2026.03.01.02.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 02:02:26 -0800 (PST)
Date: Sun, 1 Mar 2026 12:02:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Marc Zyngier <maz@kernel.org>,
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
        xen-devel@lists.xenproject.org, linux-arm-msm@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: Re: [PATCH v9 2/3] of: factor arguments passed to of_map_id() into a
 struct
Message-ID: <grcqbs42seqxmes7lm527kwhqf6osherykg6pc3w5voubd72rn@hncfl3oforza>
References: <20260301-parse_iommu_cells-v9-0-4d1bceecc5e1@oss.qualcomm.com>
 <20260301-parse_iommu_cells-v9-2-4d1bceecc5e1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301-parse_iommu_cells-v9-2-4d1bceecc5e1@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: aVVOI75JTZ43IUkaAT_DfWu0bQL_P_yJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDA4OSBTYWx0ZWRfX8WDQAT0Au4HK
 6/Bw8bT6kJRAX/2d1shgOpTToiu4LbpcleCcSIwlOWTQ4Mm7rJqLTHBQUSlw6tdYhHODfEKhasZ
 VGcopiI6smzQQ5MLUiuhL2ArgeV17OgSv8zZYo6m6lBBH8gaZ0JFcMdvyTYmZLiUk7j4SKsmJ04
 /SPeoCvW2xRyS5TFhdhDlBkg8gSIB/fDgU4v9jE9vqRUbfhgWO7yybS8mvCLW0cCzHwodC2Llo3
 kriK0lE4BsIRXRIetho4XwkLWymGisj/E66NdMWuFsRzOQ7Z4BJT+vO8ttwIY10HdCvhRRA/dI3
 /SLXiCjcwzTmfy0BkQVPDTPdajrRVKgwrgvdgCmGhUbszuBqkoXumOEryW/yva34TySnAQmp6ls
 eD5Azd2MOFp4E6/Fi7zb006zREux9R3JjMGE0oi4gFyH7Qcg7Edy59J72rbDNOCio8jXXbY53O2
 Pj/g2r1qLax1OC5cL/Q==
X-Authority-Analysis: v=2.4 cv=HKDO14tv c=1 sm=1 tr=0 ts=69a40eb5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=ZF1vm7_Oee5k7ESqZ6kA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: aVVOI75JTZ43IUkaAT_DfWu0bQL_P_yJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603010089

On Sun, Mar 01, 2026 at 02:04:20PM +0530, Vijayanand Jitta wrote:
> From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> 
> Change of_map_id() to take a pointer to struct of_phandle_args
> instead of passing target device node and translated IDs separately.
> Update all callers accordingly.
> 
> Subsequent patch will make use of the args_count field in
> struct of_phandle_args.
> 
> Suggested-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> ---
>  drivers/iommu/of_iommu.c              |  2 +-
>  drivers/of/base.c                     | 37 +++++++++++++++++------------------
>  drivers/pci/controller/dwc/pci-imx6.c |  8 +++++++-
>  drivers/pci/controller/pcie-apple.c   |  4 +++-
>  drivers/xen/grant-dma-ops.c           |  2 +-
>  include/linux/of.h                    | 21 +++++++++++++-------
>  6 files changed, 44 insertions(+), 30 deletions(-)
> 

> @@ -2193,11 +2193,10 @@ int of_map_id(const struct device_node *np, u32 id,
>  	}
>  
>  	pr_info("%pOF: no %s translation for id 0x%x on %pOF\n", np, map_name,
> -		id, target && *target ? *target : NULL);
> +		id, arg->np ? arg->np : NULL);

Is it just 'args->np' then? If it's NULL, it's NULL anyway.

>  
>  	/* Bypasses translation */
> -	if (id_out)
> -		*id_out = id;
> +	arg->args[0] = id;
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(of_map_id);
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index bff8289f804a..74fc603b3f84 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1139,12 +1139,18 @@ static int imx_pcie_add_lut_by_rid(struct imx_pcie *imx_pcie, u32 rid)
>  {
>  	struct device *dev = imx_pcie->pci->dev;
>  	struct device_node *target;
> +	struct of_phandle_args iommu_spec = { .args_count = 1 };
>  	u32 sid_i, sid_m;
>  	int err_i, err_m;
>  	u32 sid = 0;
>  
>  	target = NULL;
> -	err_i = of_map_iommu_id(dev->of_node, rid, &target, &sid_i);
> +	err_i = of_map_iommu_id(dev->of_node, rid, &iommu_spec);
> +	if (!err_i) {
> +		target = iommu_spec.np;
> +		sid_i = iommu_spec.args[0];
> +	}
> +
>  	if (target) {
>  		of_node_put(target);
>  	} else {
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index a0937b7b3c4d..e1d4b37d200d 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -755,6 +755,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>  {
>  	u32 sid, rid = pci_dev_id(pdev);
>  	struct apple_pcie_port *port;
> +	struct of_phandle_args iommu_spec = { .args_count = 1 };
>  	int idx, err;
>  
>  	port = apple_pcie_get_port(pdev);
> @@ -764,10 +765,11 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>  	dev_dbg(&pdev->dev, "added to bus %s, index %d\n",
>  		pci_name(pdev->bus->self), port->idx);
>  
> -	err = of_map_iommu_id(port->pcie->dev->of_node, rid, NULL, &sid);
> +	err = of_map_iommu_id(port->pcie->dev->of_node, rid, &iommu_spec);
>  	if (err)
>  		return err;

of_node_put(iommu_spec.np);

>  
> +	sid = iommu_spec.args[0];
>  	mutex_lock(&port->pcie->lock);
>  
>  	idx = bitmap_find_free_region(port->sid_map, port->sid_map_sz, 0);
> diff --git a/drivers/xen/grant-dma-ops.c b/drivers/xen/grant-dma-ops.c
> index 1b7696b2d762..5f1d6540049a 100644
> --- a/drivers/xen/grant-dma-ops.c
> +++ b/drivers/xen/grant-dma-ops.c
> @@ -325,7 +325,7 @@ static int xen_dt_grant_init_backend_domid(struct device *dev,
>  		struct pci_dev *pdev = to_pci_dev(dev);
>  		u32 rid = PCI_DEVID(pdev->bus->number, pdev->devfn);
>  
> -		if (of_map_iommu_id(np, rid, &iommu_spec.np, iommu_spec.args)) {
> +		if (of_map_iommu_id(np, rid, &iommu_spec)) {
>  			dev_dbg(dev, "Cannot translate ID\n");
>  			return -ESRCH;
>  		}
> diff --git a/include/linux/of.h b/include/linux/of.h
> index 824649867810..9d72d76f909d 100644
> --- a/include/linux/of.h
> +++ b/include/linux/of.h
> @@ -463,7 +463,7 @@ bool of_console_check(const struct device_node *dn, char *name, int index);
>  
>  int of_map_id(const struct device_node *np, u32 id,
>  	       const char *map_name, const char *map_mask_name,
> -	       struct device_node **target, u32 *id_out);
> +	       struct of_phandle_args *arg);
>  
>  phys_addr_t of_dma_get_max_cpu_address(struct device_node *np);
>  
> @@ -929,7 +929,7 @@ static inline void of_property_clear_flag(struct property *p, unsigned long flag
>  
>  static inline int of_map_id(const struct device_node *np, u32 id,
>  			     const char *map_name, const char *map_mask_name,
> -			     struct device_node **target, u32 *id_out)
> +			     struct of_phandle_args *arg)
>  {
>  	return -EINVAL;
>  }
> @@ -1458,17 +1458,24 @@ static inline int of_property_read_s32(const struct device_node *np,
>  }
>  
>  static inline int of_map_iommu_id(const struct device_node *np, u32 id,
> -				  struct device_node **target, u32 *id_out)
> +				  struct of_phandle_args *arg)

Document that it's the caller's responsibility to of_node_put() returned
node. As it can be seen from the previous comment, it's not obvious.

>  {
> -	return of_map_id(np, id, "iommu-map", "iommu-map-mask",
> -			 target, id_out);
> +	return of_map_id(np, id, "iommu-map", "iommu-map-mask", arg);
>  }
>  
>  static inline int of_map_msi_id(const struct device_node *np, u32 id,
>  				struct device_node **target, u32 *id_out)

Is there a reason for chaning the of_map_iommu_id() args but not
of_map_msi_id() args?

>  {
> -	return of_map_id(np, id, "msi-map", "msi-map-mask",
> -			 target, id_out);
> +	struct of_phandle_args msi_spec = { .np = *target, .args_count = 1 };

Which driver passes something being worth of storing in .np?

> +	int ret;
> +
> +	ret = of_map_id(np, id, "msi-map", "msi-map-mask", &msi_spec);
> +	if (!ret) {
> +		*target = msi_spec.np;
> +		*id_out = msi_spec.args[0];
> +	}
> +
> +	return ret;
>  }
>  
>  #define of_for_each_phandle(it, err, np, ln, cn, cc)			\
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
