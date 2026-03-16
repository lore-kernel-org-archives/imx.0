Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C2A3E9F68
	for <imx@lists.linux.dev>; Mon, 16 Mar 2026 19:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773690176; cv=none; b=iWLGXEoxaMRNGcNZ5zYVaUC0E1ZFrIKKO8hwJpdfkctJUa6Gl2uR9QGO0l46KFBVrQ2xwCfpAdhZ8Ah/PL6j0Q2TFYGZEBrVYF9I2NJh9tNM8oz4pasRN/YtGVZZzTtfoKN3uOvAXrojIM79VTw88SC8cUyBibQQUiY7J8iYX74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773690176; c=relaxed/simple;
	bh=8pKSoyetPXKpNKLPG0IjYbFaZYicC2/GSi26W65ckfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKJz+kcNja1pXUYqxN1GiHjJvq9LQ9CmpZ/fsPJ6z4NhF0mE3keohNdSHUdUfPJMMApzw5/YUn9nXvjLSJYADeeufH/7rp8FMU6Cx2BlKN8AWol7SF6qFVFkHNf4bz36QiL6d+51mxq5jwR5cGaGmIlgDxD+/jZy+o+PhI3H5h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TZMBzrho; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ITvNcFzz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TZMBzrho";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ITvNcFzz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GG70wP4023448
	for <imx@lists.linux.dev>; Mon, 16 Mar 2026 19:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+cnQIkFDXwporw30NasLf4kS
	q8rzFR+Uzt/PemH3SE8=; b=TZMBzrho1ZI9j3MecyDJMrQhyfYnbp7F+HbgPg7R
	mqfG+xh/rvJqlW2mwKsCyVLwfzrC53QO8yBljjCYZZZjYabFv0bm9U5n4/bMcabq
	YF91ns+etwVEXWpgUnVfpVioCHWVnw7Cx0EpIQWBBbaQQV+X0Z4FCLk/ECUB2gu9
	IFz9s4XLYnswCOPX/A5G3JbjNPfwmH51uRI3xjMeiVaFLgWnjFPeSppW8kGt/5db
	2TR/0eQePYHL75VvPioyDrfUy4lTd5GC02JHxagrRGm3bXDSnk3HmHyicFSh+ZvW
	B756UKaOFmyJet8cUhVlEyPQtuuFGVvOCTwZLpwxvLTArw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxn3fgqtp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 16 Mar 2026 19:42:54 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd820c6a4fso4405549985a.2
        for <imx@lists.linux.dev>; Mon, 16 Mar 2026 12:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773690173; x=1774294973; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+cnQIkFDXwporw30NasLf4kSq8rzFR+Uzt/PemH3SE8=;
        b=ITvNcFzz1Hy8oKLBV+DUeoBO70/Hdt3ASrKfc+vw0cZSwrDjFAN6sek3OaY8soITvS
         RLcJLbbIABeOO2tAS/nnQaEJ/Y20BIh0SMWwkuI31S55SsSc76BMPUqFp6AsXfoGCUSm
         lImaPpuaNcESNiuMzd5I8R/IcBp3f1Zu+zvEGPVmcplWGclhHc6zW8TNYFGjQ+JqWDbN
         Abxjp/y7tA7WakB8p6IOgrJYWykAul6g5LJ2Jt6QHtd3TZYUPAat8FgqZKHkmWD+sECu
         9HiRcvl7tRpP4E0LvVWTwJzzB7x4wCS+O7C4Ut9n8KF6vNOcawkeEq5mHttLnQcrG7cd
         uXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773690173; x=1774294973;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+cnQIkFDXwporw30NasLf4kSq8rzFR+Uzt/PemH3SE8=;
        b=XYRcS8in9Oz1mkLUFAWze1SvV17uzvEIbjuzsEYKZQNjmyEJcjw3mRG/PDQhkvWgNC
         maK+DrUhhg9o1vqdY6W556hLiXcgq7LUlNJTyv56E//SHxk28ho8E0GKgtzl9tR/M9kY
         5VQtdzaijntye0IgJqDTXXy8C042H9EfGMzfRwbT3UkcaNqJBQtEud1BP/BNMmMItgaN
         3Cc9Xa3yvxPY3emKOxdzhqEENPf2QUPluRsnYyZK5qdTux4QZ/t8kKN7HAKw6pv7QgGN
         SN2votYnkceujJ214bVu5K7PJuY4t43HPOeJjeERMLZ/GecHw94vvE35WAaiMb8XlonR
         4ehQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxg577HO423Mt50i+uhKf5i1zoUVkUCnBIDuGqmbDidL/u7uueTn3Ha1pxBMlm2IVnjt0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwA4962nOQmgzRGql728Nb3Rd7St4sR9svAEQcIraiR8gZRmhv7
	80WNXjsxHjuESGxVTfSGoNgFhomCBukHRqGYhDddBC/CeydNYiQR3/436eQNNIN6wdQ2pqfDY7e
	SEGu58QzZDV6MbGUu9/WZeton0Y/Rs61z2b1xksp4/XNwkF4uxisGZU4=
X-Gm-Gg: ATEYQzz0R2CNJknCrlk/yYYo/kJPq8786UxtlFiAySwtVkLv0GEVJMHhccZr9UdNmbf
	RS++/VJmEKl6t4xgclLk1geFJ3kav54MNi3F6vbAtw1x63iF1p8ytSONglPZqmR+2TY9Jb8AgWf
	LoYtEn6LMfzmcasHaHegB5ZS3BClWpjXDKTXKs002Z2z4UQBdk98C9K6xZpkfyqc1/ge2kfmkpK
	JWo51YpleC5U1TKTGOAKxPT3M4tf5kSakkqF1RRDNcwM6JwGG75bV0WxVJlukpQbAzX18IchzsA
	LqkK5I+l90k3ewm5eoV+aGpexEtiszWVWUUcjwF/Vs5vTPTDVgedkvk3IX5+qNV/vWa7b8u7h7y
	dL1jkWrApDnq6YHO1ZYr5sFunqncCErJBMpV1c/JtKBT0mZH0JuO/v985esdjVeWz5lfxfxnxCo
	JFZHYUDhzeXaIGrXbN9nlS3C9JFVFkkRInGHw=
X-Received: by 2002:a05:620a:28cc:b0:8cb:72b2:2a14 with SMTP id af79cd13be357-8cdb5a4b8f1mr1825087485a.16.1773690173097;
        Mon, 16 Mar 2026 12:42:53 -0700 (PDT)
X-Received: by 2002:a05:620a:28cc:b0:8cb:72b2:2a14 with SMTP id af79cd13be357-8cdb5a4b8f1mr1825082085a.16.1773690172393;
        Mon, 16 Mar 2026 12:42:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a155f33be6sm3676665e87.7.2026.03.16.12.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 12:42:51 -0700 (PDT)
Date: Mon, 16 Mar 2026 21:42:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Marc Zyngier <maz@kernel.org>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] of/iommu: support multiple iommu-map entries per
 input ID
Message-ID: <z4eqsfnxiprfktxi5g7miqqukhjsqqbivs4jqmox6r75x6pbyd@hgtkiy3ltyzu>
References: <20260315-iommu_multi_map-v2-1-51b98cb79331@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260315-iommu_multi_map-v2-1-51b98cb79331@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=C5bkCAP+ c=1 sm=1 tr=0 ts=69b85d3e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=b47Md4NF8ZsVKqcXDakA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: gcTjL67j4k0M6kbh7ta3oYu-ewPLV33c
X-Proofpoint-ORIG-GUID: gcTjL67j4k0M6kbh7ta3oYu-ewPLV33c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDE1OCBTYWx0ZWRfX8dYcqHeQ6J54
 c8tfgoph2/2Q7c/V8CxGmQScwZUNOOrV5rAMKo5OXRhi1pNVzb7Nhb6WW322w7NMI2eOM7kY1zI
 VA8lynXNp4hnMElc/6Du2+cIO4OF94yD3HjQZdp30WCA7q5GH1exyMFJP2hKkI9skJTklEg0rOA
 w/OCn2DE0I0IQFw/hyyIllDqH7KUfhbtNfdvZm/8jxkegJJrwdLVfWacxJKh2i2L/SRXlrI1rI3
 G0FtOcpCLLqTrX9V2Smc1AVzJHQ3H1OzQ/DrPGXi1gCUlIaG36YcbXeQhs67bHtan9rLyvg/u7C
 qBWA9LSxT6vuIqGJwVlOBoMTdMMDyU3gW2NeG8CB32Aul1XmFr/jFG8Usi5WpA15ITubCxVZP9o
 0xw70u3A/Zkpp4v9CVeKv98qTvCPiJjl6XdiwJTDllxn3TEYowZ4qrZxXweCSC3gEkpctzkbF2Z
 ezlyDQlFiZb2F4vocaw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_05,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160158

On Sun, Mar 15, 2026 at 10:37:43PM +0530, Vijayanand Jitta wrote:
> When multiple mappings are present for an input ID, linux matches
> just the first one. There is a usecase [1] where all the mappings
> are to be maintained in parallel for an iommu-map entry of a same
> input id.
> 
> Add a next_offset iterator parameter to of_map_iommu_id() and
> refactor of_map_id() internals into a static helper to carry it.
> Update of_iommu_configure_dev_id() to loop over all matching
> entries to support this case. All other callers pass NULL and
> are unaffected.
> 
> [1] https://lore.kernel.org/all/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/
> 
> Signed-off-by: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
> ---
> On Qualcomm kaanapali, the VPU hardware has multiple internal blocks
> that generate different stream IDs for the same input ID. The device
> tree encodes them as separate iommu-map entries sharing the same input
> ID:

Vijayanand, even I would not understand what you mean here. What is the
"input ID". Please describe the issue _exactly_, which blocks, what do
they genrate and when.

> 
>   iommu-map = <0x100 &apps_smmu 0x1940 0x1>,
>               <0x100 &apps_smmu 0x1a20 0x1>, ...
> 
> This requires multiple iommu-map entries per device.
> of_iommu_configure_dev_id() currently stops at the first match,
> so only one stream ID gets registered with the IOMMU.
> 

-- 
With best wishes
Dmitry
