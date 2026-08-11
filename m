Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4B547D951
	for <imx@lists.linux.dev>; Tue, 11 Aug 2026 21:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786484934; cv=none; b=e2FsSGOwHOw86FH7MaFSuclYoABeOF0RLsxYF/UM3+XL/CRlZX1aZ2FSNRaIoicHR4cUoxgER69wXn4Uw0o4HpdP3dR5JVwyra3VEwjRfXB988Zr6A1zSwAbTY5a8DZxcTX6QqGnEQ3WNECVvZ7o/JBr5ddAJkrjL76USvMB7NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786484934; c=relaxed/simple;
	bh=3YphB6p5bvAlpt7s8fIhH3wwoDBC0+jKMak0/KZ3isY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nSlkKioRB/n7OWQ4WS9k0z8g2ng0k4S65q7Fh+GFI39va8UvecXdFZPW4bjCxqLhAPoukacjeM92rnXFVjNUXML+1C+5duWbe/0Z5ZukDTFlVeAIlw/P2BQfiEotuddYzh8CwyWsLU4is5FEbN/yzuOgUS2zSI7c3CbbxTXYY5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RekMB71R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CnKIxaLa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RekMB71R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CnKIxaLa"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BLbAfn1780534
	for <imx@lists.linux.dev>; Tue, 11 Aug 2026 21:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RDpWL6YX7Ibdac3Brq/BRIWn
	1DCIJBB7LKdAqaLHbeM=; b=RekMB71RMMNB3jONZ6iqeiZs+eUhhyBO2sw9Lcq5
	A8TVkohuwoCdeg09RSghhnpTGY/fe1J9s7i7fjt3vIe/n+S6H21ToTcocApbkKVN
	d2xxA9Tjw6Jwa9mfyvIJYuYOxqhpYWS+pmVSKzjEr7ObBwE9sXwp14DrSI8WPOba
	VL/MTWBEkCMfiXKGFVSJOsf0KhJl5XdxfuJfZ+dR5zPQB+M6v08Kux2nH4UVB0Ac
	e2XOeU5o7Q02BMzjHK1Wv+OwFAj4dbvMgZkMBdX7EVgnvIO7l3DQwRRLFiQGksBj
	ahVvuQY/eyAd+aPq8ggyOiyn5kBgbiKr1X67/KSAeqyPWg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049gt8mc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 11 Aug 2026 21:48:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1b4d961dso3382051cf.1
        for <imx@lists.linux.dev>; Tue, 11 Aug 2026 14:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786484931; x=1787089731; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RDpWL6YX7Ibdac3Brq/BRIWn1DCIJBB7LKdAqaLHbeM=;
        b=CnKIxaLagO87ms8i6bBJ7MJpRf8i1Q+UmT8tclI0WhdOayTuWr4+lHY7jATPDtzwKQ
         205v8ki2oQtA1/t2BdyXXj/p50mdEd0gjRz60aGCJVfpBOTM7RudJ/Zg4xJA2+0mzUeZ
         FJJf2mEpRG4Dx13y1iDcXgHhSe9NYLen3NlLGvU/1jmf5K7AEqIijMt62BAAWNW+pukm
         WyfLqZcWRmVQIpxw3UZ0M7a5VKgwnyS2D0jZqojHAQDZp93/Mp0k7jhw2RHa+qG2ZIyD
         xGO4jQ4r5StD7jRiiryDUk8ANnvcFCeIzorj6//XVjVFpgrzfuNMZ3S80MekVfGMZ5VQ
         KwOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786484931; x=1787089731;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RDpWL6YX7Ibdac3Brq/BRIWn1DCIJBB7LKdAqaLHbeM=;
        b=IhPbqkhlrXr87WSjKwoi6+L6Pzjydf9N620CS684hwZJhr6mNSXK0dCMnQ3H9HsVpk
         4wEBkt+xuze4ZiJpA6DFDwiSoCO9zK3wd/JRUXxu+u/HIMupltVAuKlTsgJNPSJn2eDa
         xI/6YOFaObnSSu4CwP9IvtKqY1mduYhZfwKy1jKxlxAi01uN5VnpLJuy652B/Si8AD2p
         54B3zb7wqEQVMk/VF5RegmG77FUVWM5LUWgk0wV3LBLw24oDUnXH2PvSuP3nULPXpm7r
         GSKckiYjifgVPwCvf0n6CKmzswvRWY0sX8tvs9+e3Mzn4kT+hz5NiCXM8KkDTNsIWmoo
         9cUw==
X-Forwarded-Encrypted: i=1; AHgh+RpMGRKVaBrgJqGuhQyFHWN+FFWusgHcvHxtTWl34H4Wn5GosrVZUITRZwPGozGEs+qBGqg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwFth/EruFAOS1xeIpNCpi9SdApC/QiVKBlZfbLbcaRSo67qzT2
	ScSuJvgZEnvDlXD7Qs6LcX3I2fNcrXWgveRmsOP+Z1ud6YX/VZZW8GEpdYh4jyQ2Y6J08HpXjw8
	SQJT41xVI5s3fU9nyxmicx+hInEdEq2OTnnbVsRGwSSCE+y6wT5Wy5nQ=
X-Gm-Gg: AR+sD11KVinl0frT+jbHS0N7G8imZoJvXsdG+CAC/ECXNtclMTndvjUMoue4BBUZUvs
	cQBpsAj23hqMHbch7UsIr2t3UDC7I2Emj55VdjV1pMTU6iIoDPHaNTIlgfakRu+WNlcLabv19dA
	K+KntdIo50PkF3GU2i4/64kHQwyToApsvi7aqIrxQuasQsjoumwvzSn7ljVKAJDbqgyiFaTXey6
	hC5mntLpwn/APRjVlNZHRVy9Vj63kfGZYTSlxnyCPR8ZINtJY1AUmSZntd5qdTEskr/bPE1Z2Y/
	JLG6uFSWGijqiB7faZcSNgtpvdM528VG0fF7tWLNnIAk+JpvJeNyuElCI7P/Tgx4wenc5+Aes1M
	w2ainhN+7kNROTv5hVg93/SJOLNbIFoLuVpfejLSXiRyzBFS2LRIu3LJzBpyrUmee34f+TQYkAt
	fOVzXV26MesXWq5Q==
X-Received: by 2002:a05:622a:1dca:b0:528:317d:eaf3 with SMTP id d75a77b69052e-52d60204d8cmr31340991cf.6.1786484931334;
        Tue, 11 Aug 2026 14:48:51 -0700 (PDT)
X-Received: by 2002:a05:622a:1dca:b0:528:317d:eaf3 with SMTP id d75a77b69052e-52d60204d8cmr31340721cf.6.1786484930905;
        Tue, 11 Aug 2026 14:48:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b44cfc4217sm110801e87.28.2026.08.11.14.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:48:47 -0700 (PDT)
Date: Wed, 12 Aug 2026 00:48:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev
Subject: Re: [PATCH v2] soc: qcom: ubwc: Fix link error when QCOM_SMEM=n
Message-ID: <eptix3j7cqs6mhbk5ano3y6nhsl7r6fhrkfz5dpollvkpnu7wh@uy7y6txd27q5>
References: <20260811151905.311267-1-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811151905.311267-1-daniel.baluta@nxp.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE4NCBTYWx0ZWRfX3M45rWTso8Mv
 HuY1W/5OEZeVApKvOWu+rx7E15Vw1bAKAxnm9BOQOaLmg6FSTsiXS7VS1HpiQ8RBBkTcHQyrJo6
 4fa3VySHHbguF84dRCX3R+TZWQ2hlVU=
X-Proofpoint-ORIG-GUID: 4qgvp04R_e2G4dhzVe1jhGAnu9Zz6x6J
X-Proofpoint-GUID: 4qgvp04R_e2G4dhzVe1jhGAnu9Zz6x6J
X-Authority-Analysis: v=2.4 cv=cvarVV4i c=1 sm=1 tr=0 ts=6a7b98c3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=tRDJS1cfbB0_5xRKd5IA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE4NCBTYWx0ZWRfX8pHUD8V04yyH
 QufFkqbc5Ya29ZX4vb7iHxGA8lPfN6yWyvkrsynnrFxfReR4J7GQbYPLQy686i4Zcsrx/bffDHJ
 iObOOAP9P+tmeK7XU/vN37h8FjDey9p7+XVg7Gbc6RV/rNU/7QdT+UbABwBnk3w6pIdIeMuR7xe
 ysMna6nRPPN6GwMvnauV3wP2gY9RIdwNh/NgV3vgGj7TeCK4R6Fr2rmwhzeh0cYYcb+bbrNZDhh
 /QAtwYvnOAaD8i5KHUhav+UV0LKKfnDAizyWGUTMTga/XE9CZ/cQwzNoYcxNVGpNrpgmEALgqLo
 YVvUa2Uyr3vc4vul/WF9khETcSdy9/dzcVEdbtNK3Pi6i6Q4h5fJFk9PcFHUqT5tPrwRYYsSSBp
 ZCxkMmEKls1uMRYFLQCiN/A2y56Art/Q1pASpgbIWJ4OEtK+jI627G0jZalIA5BB9eIZukC7NNy
 Gf9kMqMKi6nxzxFoJrg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110184

On Tue, Aug 11, 2026 at 06:19:05PM +0300, Daniel Baluta wrote:
> DRM_MSM unconditionally selects QCOM_UBWC_CONFIG, which calls SMEM APIs,
> causing a link error on non-Qcom platforms (e.g. SOC_IMX5):
> 
>   arm-linux-gnueabihf-ld: ubwc_config.c:(.text+0x2c): undefined
>       reference to 'qcom_smem_is_available'
>   arm-linux-gnueabihf-ld: ubwc_config.c:(.text+0x4c): undefined
>       reference to 'qcom_smem_dram_get_hbb'
> 
> Relax the selection of QCOM_UBWC_CONFIG to ARCH_QCOM only and make QCOM_UBWC_CONFIG
> depend on QCOM_SMEM make the requirement explicit.
> 
> Fixes: 1b445022d1d0 ("soc: qcom: ubwc: Get HBB from SMEM")
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
> Changes since v1:
> - (addressed feedback from Dmitry) replace adding static inline stubs with preparing a better config
>   dependecies so that we use the qcom_smem symbols only on QCOM platforms.
> - Link to v1: https://lore.kernel.org/imx/sy2ulk536ryakhy6fdnqr4asvzvufqk3dlo2awdrfomulyf4n4@qtp4qoazqmhj/T/#t
> 
>  drivers/gpu/drm/msm/Kconfig | 2 +-
>  drivers/soc/qcom/Kconfig    | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
