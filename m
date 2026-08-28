Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F26C46D09A
	for <imx@lists.linux.dev>; Fri, 28 Aug 2026 14:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787928611; cv=none; b=b9eVzzt9ZjAWgGhMaTeSdFv8T3nOoHkEJNh7FJYA6liUuKOgX2kQTc+bBQEvpx73pLuLQIOR3Hs3z2rY5pkUYxPE8heNqeNcNrB2ccSv83cB8LQUFAVGm42qAxSh1QrV3k8vT750drTojA8XgCMSEjhyG04j2xNFMDsB61EFpT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787928611; c=relaxed/simple;
	bh=YnWdCCD1qxKEg7762yorNJg/ecsxeveY3xQED7Gsy64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AeLjvSkQ+96gASDVe/1u9mb4My7ruv6dXVkcJhFYCJdR6CdKiGgTSIYm5OSyUxb82jlPAeNCZUlaGjGSS2z9jc3YTZ3DQSmEmLJEB2D6lefhYgDsLsHrji9Sopek2zlZUlgg0vycgR2JWEu2vX504fQAImtL30XcdtmpG/GHfRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dnExEQ/t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dsBlPNFe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dnExEQ/t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dsBlPNFe"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDkcO73075326
	for <imx@lists.linux.dev>; Fri, 28 Aug 2026 14:50:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hMfz7Vhc8U0TsC57RZ2pmSfybZVbiyDGTC2Y9/EyfeQ=; b=dnExEQ/tkR3FHbuq
	C2YHv9pwKXa5wkI0RGBfLdmjTG7PffoW9MPOAlMpDvx/OkD0LqTDT6tIMnRcPd3y
	XmsN0OV1ML92ZCGkNvH9VB2ZunDL9+rnQWtx8jJNztfHN0wINeOm7iCBUPOkcz7z
	+PSO6d/pwvYp7vSRni5VRqAVJmF1lL25bu7oK2G5wC1eDhwpa/dzegkWvgc4a2e/
	ddYmqKrI6WZCazeJDUq6ssxzv3nqSTGFJSaQU6NmNLAcaYrJrseun4PmVCD112vd
	Tksj/4RUsVn67ZuQ6vK89u8rqQEHOioUdN0KOLGCKOqGfrf9P/mYMbNCtcz+BY2A
	3t7rKw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb1v3asf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 28 Aug 2026 14:50:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-385d2703b64so2764749a91.1
        for <imx@lists.linux.dev>; Fri, 28 Aug 2026 07:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787928608; x=1788533408; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hMfz7Vhc8U0TsC57RZ2pmSfybZVbiyDGTC2Y9/EyfeQ=;
        b=dsBlPNFeNK0MHBkFSkkjJhVZzgOPfD8l+4vz5bBf7yM+kVeacEhYZUodBMACAiVqv6
         CCTfim4zettsSfLH/oD2uU28Apr6IWplPGhb3DyMGcGdcnI37QaaLqwX8y+EWq1qigVR
         vHABXLSOzGUcrSdF9S5M7KFRwRk9trnE5+XuoP0/cyRAakSxqvEo8hDWOSgW/hfrGdOi
         rQoqN7jpjPfwFUlmOoIQnIubJvjYFE2YWP1pCNdv4zxRuKZMnpw24ZqhgrzyoQFfScn5
         q9bgCbctt+owUl6b2fYs+F0pNZyiEvJ4uLUaznhciAfwGFDkUTro4MxX+bK+Y70hgsLo
         QmqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787928608; x=1788533408;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hMfz7Vhc8U0TsC57RZ2pmSfybZVbiyDGTC2Y9/EyfeQ=;
        b=PP4eOWzTg6cvTUVwtunPYVx0BRJ049G60nwlNQ0WvMjrnXvPSskY7ciF7UJb4CUGZn
         SywIPnF+D2ZjBqiplN3gJjW5pirjXyqfvbXPWI385WCQexyMoofR2MWQL62FSJWFy/0b
         SwMjeB+Vyfgs4H2nqp4ZF1RtzHsrGwfXsNYycf27+LGMiDN72HuaUDu2MOvptOX/q/4j
         ED55KC+Fp4I6SAvmHwPgpVZHJbAf91R2GrMY3YLZGka0JUUeX0tdijf2mTr0o8qPdqaz
         YgcUTu9v81KiOgvehnnuevyqUxbM15kChoO2+v2VIHl8a+hmTljyDVDcbybyHG6WQJp1
         StYg==
X-Forwarded-Encrypted: i=1; AHgh+Rqf72UP3antN/JSjl39oNcJ5c04Ob414QN+ZTKg3qJQL3g+PazCjj4AdOdDDKNoa2ck4A8=@lists.linux.dev
X-Gm-Message-State: AFuF++kjK4UoKmbNeDazPJAqwyAI5/Gj5iwKEox0033+ymBTg47HNG3P
	biLD6eCXjVc4ERiSIFTmmsOk3NXvkq3WiuW0Odx5tWiWZgiwMKl6ZOlw486q/T6AMNQyy6qKo1A
	M3CV/VLc45bob8xnbMishowJbTzMGXZr21cwMIOtVcc0x09t45F86L6I=
X-Gm-Gg: AR+sD11QRDz7vc85mXdWe1esRn/3weQkZ0GC5b+KStNLmz7LOtRkIncxCpwRbiUVmjm
	pdbH2MB7Ffu1qowT1Ckhp9lkdy+4aIpAwWEzbASdF8zO2MzSVNx6+H7yBbafBh1ZEjb6Mejw3jW
	1sjxcGBzSHXHJ9SWFEN3929KmHuhBU5wELTdlFglVQ/dDQCYXXt4N9kM3G0bYfgC24mzfv9TI4q
	Wx3bltgrCsWedycmHVURFbuXksJkUIS/kiIK87Z21rGa698hFhBWZ7KlJPDhLXwb4QskunUVrWA
	hnCbzqbMihxvTSWFLXVVzBoS+Ss3pL7M1ZISLwdrkUAy2Hp7wMj6VOEh6WmwtP8JSSWTL+0CxRc
	GX7c7x5PsLXbFWN8i7Gog17Kdkw2KuDh5fA==
X-Received: by 2002:a17:90b:4d88:b0:398:9bd3:d6d4 with SMTP id 98e67ed59e1d1-3989bd3d8c8mr344656a91.14.1787928607882;
        Fri, 28 Aug 2026 07:50:07 -0700 (PDT)
X-Received: by 2002:a17:90b:4d88:b0:398:9bd3:d6d4 with SMTP id 98e67ed59e1d1-3989bd3d8c8mr344578a91.14.1787928607246;
        Fri, 28 Aug 2026 07:50:07 -0700 (PDT)
Received: from [192.168.29.63] ([49.43.230.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d6925e92sm1131305a91.2.2026.08.28.07.50.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 07:50:06 -0700 (PDT)
Message-ID: <aabc3dbd-3e5b-4272-807f-f0743606e25a@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 20:20:00 +0530
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] PCI: imx6: Enable ASPM L1 only iff CLKREQ# is
 supported
To: Michal Gorlas <michal.gorlas@9elements.com>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260828-l1-conditional-imx-v3-1-6fbba62164d9@9elements.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20260828-l1-conditional-imx-v3-1-6fbba62164d9@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEyOCBTYWx0ZWRfXzehFN30zNtXr
 +t3tyv/Y8w8nq7TQfnIdctcfGFWxI89ZA0JCALkoEYw/jZX+WnVII9NmsAAbJGc1Q6RFdVXgWZn
 Jfe6newyXdSfRRuupmk2lX4CXpAo811XsmXmM8YabeWe8AgdRN8aYQpGypCX6J5GTZlldu0OzFw
 Nz1T2Dv4kZXcAjUA+D9EUM4OJv2J86EPru7QwB6PWXOK5ru0eAp32SgZR+hR5B8/nFG2z0AUBh+
 bcPIptja+n4/LHq2jboEm6YxMDgNqsFYp8/SG3ike4ZjuaW3Eyenvx6z0CVNAYUTJtbhQXM6/0X
 c+cWd2fV8z5EHkBL3T9ZLxADsB0dNJo7HDY55MsPplkET7dZ0Wl8uwM8h7JIPb06loYewt7HGAj
 IJp4/K/OG8MrsXNJbnbGzpTZuk8uN/duY/0Ngkw2YwKUuNh4BDs8pkUOERDohSC3kXNUwu8MLz6
 4T9XA/7LTWdC6HAz7VA==
X-Proofpoint-ORIG-GUID: uu9rG1sQAL7QXF434-5rOyaex4afu9ii
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEyOCBTYWx0ZWRfX54OFeDgIrVf5
 SoC+rl3GZ7ZDPhlsAQyx/jxcQWTgu+TgZ2dGosyT3f+uvbPTjFz22lSDMPXo8xCZk8i+vxvY//M
 1HS9DeYJvzSIWyr4BHxKkcyy8eWveS8=
X-Authority-Analysis: v=2.4 cv=faedDUQF c=1 sm=1 tr=0 ts=6a91a021 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=LZewZZGB/thYnPi3wayTIg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=YG64nluAAAAA:20 a=VwQbUJbxAAAA:8 a=bC-a23v3AAAA:8 a=PzGKxP3WAAAA:8
 a=8AirrxEcAAAA:8 a=kMM-w56GI0ZO-asq7NAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22 a=zCCnohV0i-_k6euCn0hJ:22
 a=ST-jHhOKWsTCqRlWije3:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: uu9rG1sQAL7QXF434-5rOyaex4afu9ii
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280128



On 8/28/2026 6:40 PM, Michal Gorlas wrote:
> Since commit f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM
> states for devicetree platforms"), ASPM states are force enabled
> on all devicetree platforms. This causes PCI devices on some i.MX SoCs
> (for e.g. i.MX 8M Plus Kontron SMARC eval carrier) to enter L1 even
> though CLKREQ# is not supported (and consequently supports-clkreq is
> not set in pcie controller node of their DT), which causes the device to
> never wake up from L1.
CLKREQ pin will not play any role  in entry and exit L1, it will be used only for
L1 sub states entry and exit.

If you want to disable L1, try to add aspm-no-l1 property in root port[1].
Recently aspm driver change was merged which will disable L1 if that property
is present[2]

[1]: dt-schema/dtschema/schemas/pci/pci-bus-common.yaml at main ·
devicetree-org/dt-schema
<https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/pci/pci-bus-common.yaml#L167>
[2]: Re: [PATCH v6 0/3] PCI/ASPM: Mask ASPM states based on Devicetree
properties - Bjorn Helgaas
<https://lore.kernel.org/all/20260812023735.GA846004@bhelgaas/>

- Krishna Chaitanya.
>
> Hence, disable L1 capability in the LNKCAP register if supports-clkreq
> is not set in the DT explicitly. For devices that set
> IMX_PCIE_FLAG_BROKEN_SUSPEND, disable L1 on resume as well, as these
> skip imx_pcie_host_init().
>
> Note, the logic here is very similar to 613f3255a35a, only difference
> is that leaving L0s enabled does not cause issues (at least
> I never encountered them myself when testing on the device) as its
> not dependent on CLKREQ# being physically there.
> Since there is already a way of specifying its presence in the DT,
> the driver should be aware and disable L1.
>
> Fixes: f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")
> Signed-off-by: Michal Gorlas <michal.gorlas@9elements.com>
> Tested-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v3:
> - pick up the reviewed-by tag
> - Link to v2: https://patch.msgid.link/20260827-l1-conditional-imx-v2-1-40b324aa2a94@9elements.com
>
> Changes in v2:
> - disable L1 unconditionally on resume for platforms advertising
> IMX_PCIE_FLAG_BROKEN_SUSPEND (Sashiko)
> - typos in the commit message
> - Link to v1: https://patch.msgid.link/20260719-l1-conditional-imx-v1-1-a55a57915c68@9elements.com
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 98e1db751132..1fdcbcd2422e 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1318,6 +1318,22 @@ static void imx_pcie_assert_perst(struct imx_pcie *imx_pcie, bool assert)
>  	}
>  }
>  
> +static void imx_pcie_disable_l1(struct dw_pcie *pci)
> +{
> +	u32 val;
> +	u8 offset;
> +
> +	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> +
> +	dw_pcie_dbi_ro_wr_en(pci);
> +
> +	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
> +	val &= ~PCI_EXP_LNKCAP_ASPM_L1;
> +	dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCAP, val);
> +
> +	dw_pcie_dbi_ro_wr_dis(pci);
> +}
> +
>  static int imx_pcie_host_init(struct dw_pcie_rp *pp)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> @@ -1442,6 +1458,9 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
>  
>  	imx_setup_phy_mpll(imx_pcie);
>  
> +	if (!imx_pcie->supports_clkreq)
> +		imx_pcie_disable_l1(pci);
> +
>  	return 0;
>  
>  err_phy_off:
> @@ -1748,6 +1767,7 @@ static int imx_pcie_resume_noirq(struct device *dev)
>  			return ret;
>  		imx_pcie_deassert_core_reset(imx_pcie);
>  		imx_pcie_assert_perst(imx_pcie, false);
> +		imx_pcie_disable_l1(imx_pcie->pci);
>  
>  		/*
>  		 * Using PCIE_TEST_PD seems to disable MSI and powers down the
>
> ---
> base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
> change-id: 20260713-l1-conditional-imx-c2bfd20ae085
>
> Best regards,
> --  
> Michal Gorlas <michal.gorlas@9elements.com>
>
>

