Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37272E175F
	for <imx@lists.linux.dev>; Sun,  1 Mar 2026 10:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772362770; cv=none; b=koPHm8K2SfSE+tqKslXHbjtOxErIl2pJ6EHPr4HRV2zTPlZYrSkAXj4fp82fNM3/tDZ5P9Y44Qx080OrnUXYFHKamRMhnLUeBqRWYFXBHvoWk1xG2f2tEi+CsvSXCabNm/+wYXCxLZit7tNhDhWdgZCHXEX4obXY/RGR+Lh6ArQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772362770; c=relaxed/simple;
	bh=ma5KFEqHslgRuuIwDm092krRisjxb/PVQ/WF+lX7RAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P1uqcTY/08/syHrAT7v/tioq+TU1C/Tlc9pEa5iO5+gf6lefGE+Juribl4DM+CDkCdtshrjlEQotB9fAGfXJ2H9jiteTRVN8qybVRuFSEZ6KKr6ccI2T9byNREiF/5ADjCc5AD+TrJOnZjT9PJknU/5l/vmnxo95SqZyEsGGCi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZbRtpKNV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HhZem0dd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZbRtpKNV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HhZem0dd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6216gpwd1083280
	for <imx@lists.linux.dev>; Sun, 1 Mar 2026 10:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tWvbzoSirp2+/mfj208EVtuC
	kSsURTVI0XL++QIzXe8=; b=ZbRtpKNVrLZlATBeln8U+o1HVMJ1NJFODQD2g1Xt
	5zqmD26FEi7oT89X6dB/3Kf0XkkF6A8sXLJiy6k2cdCfTElYXz+CjMK5FIy3AQPe
	xpwFsAEbry2aIJz+ovYfTdhNnokCCupYZNrBBmfiE6N5iXxEnaecxqJfkBq7jA6g
	atxv+7P2SKJ+CThu9PnqyE+e14r5zyxB6+fChJWyb7bmsbhO1nbIl9sdXtyQ92aF
	9NNtP7wU75FlG/y0oxLuqIE1sXvncry7ovuFrwD64sbYiUvq0bz1X2QeTCCuTyIj
	PQrXowySKFMO/mebdHFA3zvBB6060oQ2+M3ZZuPrtLkY+g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ckshd2key-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sun, 01 Mar 2026 10:59:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb3b0d938dso3401669285a.2
        for <imx@lists.linux.dev>; Sun, 01 Mar 2026 02:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772362768; x=1772967568; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tWvbzoSirp2+/mfj208EVtuCkSsURTVI0XL++QIzXe8=;
        b=HhZem0dd/R4S3YLBZ9tRzqRxNuw7hyWtdXsFx7LKL8zOicob2fW5NNWkFb46AUiWMB
         W+Gu41dNQM7q5n/wF/Li+/AwuhOCTQBAmBvaIp5rePUtJ8urkDg880g/Eo1E9V7fDxAm
         BpfWhS/NFif5wlUjLZ4lvnfJKu5esqYhnXSrr4aycSTClHpxniGrZ7kHySACwMCirxii
         WH2K9TPvzYvCB4hmk34rcbZnq5EgLzHDVddziaL5r22cTWJJeSAKBdTwBF0Zs9ejNKhe
         45hdj5RbV5BiaeuWf2UYTMo+Vzg5pzTqqpVWJ//nSuvdXMYI/FjJEdD7Yk3jOTMmGbVS
         HRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772362768; x=1772967568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tWvbzoSirp2+/mfj208EVtuCkSsURTVI0XL++QIzXe8=;
        b=RDFot2Ak5jlYjmf8M/VXUlcvfzoCu+TUsZL5WoJfWQe0+Udk8amfLacMn3nto3UJR8
         f4X/EqoSzuR1Qe+xuydlWjCIukkcBl20xa0JhIHOcURYPP4t/TLbUoy7dBd8Xh2K14LC
         XsmUOcrBOSeoZqQnPbeMYLhHbsnWbZq+VafHKjSXlNSjRDKtAqk02oJgTrudPOdaLKFj
         vsjFm1pH7qW40El5rx3KNIbo1SKBWS5KPRC84D1xAZadRSiI4nJuXwlxIMgmAIZrpU3Q
         EA2iYlsu5telQIFazDgbUAC5zlcMm8p04YcA9qENxOgi1USkYkKyhdsQdc7ECAp1tTsw
         RGIg==
X-Forwarded-Encrypted: i=1; AJvYcCUaONGsoF5LkzgIXgc7UsNbFJAVipXGFT2pWoQkofBRCvZm8l+2UyAEki8AgudMIEx61nI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzoItw2QINVoNFkt1ULAG/gVG19/93x2ToYWWdthm+cwIGchwXy
	R0ILCnxhLPUtuBIoh6Nz3kcwCZRNsvqew9tCjK0gCA708bUQj76aBxhrIf8yJKYhKivmQPAJ0k8
	COYnI6psqcQws0tJCp2Zhsp4PfyTrdOvP/CpB5AnNK9YKzWTJ5SsHaN4=
X-Gm-Gg: ATEYQzygJ0mWLk9+ctVnhDT+Bd8QBhUkK5w4s31oPMk4rsRAthyEjzARtdLGITMkm1b
	TVHwVc7RMCtKLdTlwtcR0cB+hAj89l3OvXcJbev5lCtprCEKSxZhN6ADqNpPq11IGq9UOiFGHbm
	V9oxAfbUn6qQHOXmRPiwAaMdJMfXQrupt5HiydO2f+N/cvstYF0GEIv4iYRReXPP2xrmJWCpp99
	lr896Ucb02VW64W1xRVeXJEBLk2/TeyeeOXDmuE512TfB8f029tYXaUwrqbCde5A1GaO7WLJDkL
	vJ+PkhMDGNzplo/xfaBb2qnquPVICCmrvMwTi86VE+/pdcrzdUQujE9vLpTQ1LVKRFPE4laxbsW
	zCrjhIjMRJipj6Wdu84GM5Qgo+cfuY+TbxcMkI1pziG3kRUyeHRZtDUrl3v4IbMeqZIZwyVOSdG
	UC8AEnCx2X+Rd4rOA7vhPgU3MinmgSUxUCaTQ=
X-Received: by 2002:a05:620a:3949:b0:8c7:1b3f:7d0c with SMTP id af79cd13be357-8cbc8e55216mr1090397185a.16.1772362767979;
        Sun, 01 Mar 2026 02:59:27 -0800 (PST)
X-Received: by 2002:a05:620a:3949:b0:8c7:1b3f:7d0c with SMTP id af79cd13be357-8cbc8e55216mr1090393285a.16.1772362767407;
        Sun, 01 Mar 2026 02:59:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a116de019esm872280e87.3.2026.03.01.02.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 02:59:26 -0800 (PST)
Date: Sun, 1 Mar 2026 12:59:23 +0200
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
Message-ID: <bo5kb53hrzvl6e5mctvnpqluobdgbpq4x3m5ca7mwtfnl53npw@7axqsph2vyqd>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAxMDA5OSBTYWx0ZWRfX/btnyadkGTZc
 z2XseRnP2KyQf4Evm0DZBSGbRLOxu1pyrr6o81jTBDh59DSKnl7LL+BIzJT6KrhHKtMEy6LbfxU
 tWFVIJVcWt56sKlS3DUgyPhBpsrHt35aCf6fBrGbAPMuv2U7RdnB9siTMPz7YIg2zNwmWEpkACM
 VEhHLCCliAMUVy6AC6IzIh0zMwrxTcBapSvzxBdizqYjLJR3QDTjUsvw7EVa24Uol40OsPMBB5P
 +n5D2I+o+Z2KAPRyN4nY6mEqx3iISn/Q0sGtYTjzq0+NSMPFp2b6RPhbqtalhnUTo5JnfRuQMe8
 AXBv8slThsaTrWEQLZsZ5Q3ObfjnNGFVze8mEodKD4D8b+xGHKtv1pCE8iCKqL7c+IDKp4Horpn
 EFqze9QMPPHdKPbG3m8n7SE7CMwCebzju94SdveI2on5RdjSasKw6fJrKLkDwqq4xdr39Qd679p
 vdLQgFEE/jk8cwCjhRg==
X-Proofpoint-ORIG-GUID: KMILTpWhIP_cVh_KsN4Bk1AK9WqdRq8L
X-Proofpoint-GUID: KMILTpWhIP_cVh_KsN4Bk1AK9WqdRq8L
X-Authority-Analysis: v=2.4 cv=COYnnBrD c=1 sm=1 tr=0 ts=69a41c11 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=Dq95N7oyZucg39lo86YA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-01_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603010099

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
> diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
> index a0937b7b3c4d..e1d4b37d200d 100644
> --- a/drivers/pci/controller/pcie-apple.c
> +++ b/drivers/pci/controller/pcie-apple.c
> @@ -755,6 +755,7 @@ static int apple_pcie_enable_device(struct pci_host_bridge *bridge, struct pci_d
>  {
>  	u32 sid, rid = pci_dev_id(pdev);
>  	struct apple_pcie_port *port;
> +	struct of_phandle_args iommu_spec = { .args_count = 1 };

Hmm, I didn't notice this. Parsing functions are expected to ignore
of_phandle_args before the parsing. So passing .args_count = 1 is
strange.

>  	int idx, err;
>  
>  	port = apple_pcie_get_port(pdev);

-- 
With best wishes
Dmitry
