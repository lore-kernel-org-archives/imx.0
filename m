Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DC833343C
	for <imx@lists.linux.dev>; Fri, 14 Aug 2026 14:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786718882; cv=none; b=sbgVJKQemGlSC+nXQAX+KE56qAiBBgUijy+2LmBq92Spv3DT+BCv+4GATjfC5doPnN6UTrkxbghjD5C6JaG4bPDeGC33dYi8395n4yKcTrURjIf2xVY80rUM5uYXnwYnjnYQqA2RL4m/9PVx7Qjvmb/piOORZ466ThVYSsOfIE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786718882; c=relaxed/simple;
	bh=PRfChCSkOVqWm54rFZ/7XVe82dB5Yyazj7g0F5AHQQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUH9DHBo4IfPsFPnp6zMHulhfxexD69RmbU/+UNA1H7ZRmd5MPo5wbze2S/BidVt85msjBxJBQ6SrHutST2fwRvFTl5NWQdM/DgDDHQiPt6TskwB96O+B/IRbxi0GWMkO9aA5q614Y2tzUzgCNCKklrT+rYMMk4rGJnXWm46OBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aHZhPcuJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GbNHOJGe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aHZhPcuJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GbNHOJGe"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EDxnSn1100999
	for <imx@lists.linux.dev>; Fri, 14 Aug 2026 14:48:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3zH28m0yMIFAHiTATXVrk8Tu
	QRDiVPyngjoADZud3w4=; b=aHZhPcuJcnrfwzER91for0kgtLwJjXoAIk9QHB0T
	LqDdcyCNSFbBQrTiEgyap39kiV9oHd22g10ypRqPq9GnEmoluYnZDoHFHvYBqK7K
	kAtdsB5/TnfdTgn8rQCD7QiaTL5/RfP3zcbBxEkxm7S3w8Y6HCqqimDMnPF4mnBB
	dOwJ21pNq6sAfckngDf5LH98eUOBudEC6ZhaW1SQO9E0ekqFO3IeweBBMdv4djgD
	yaIxiT4XTEhzHxV4psZi2EEtInJjAqaonTH0lBFq6INQtoCE75YXJzCX9RDOJi/m
	XQcmJVygzIRMGgF6zIg9bTuXolnM7rJsH6SZMzl7cjM3yA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1m42m0yc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 14 Aug 2026 14:48:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d33c89a29so15073861cf.1
        for <imx@lists.linux.dev>; Fri, 14 Aug 2026 07:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786718879; x=1787323679; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3zH28m0yMIFAHiTATXVrk8TuQRDiVPyngjoADZud3w4=;
        b=GbNHOJGe40LkEqlVVgk/OQdnoFrPGZJhHPCUoWRPg76IIz9rmveSggiZJrbe7U/ewk
         HTQ1fApdKofrfGS5BBuYN7tKIIEzoSH38iKjsC0FpV9qQLtmumLS2zler5ZswKEwCd/4
         kKE8cFNgH3spaB/OoyWBzLTABq6kQ+Hm1mJYQrbsYFxlgJhaSW3VGMniyETTdZSyslnO
         mY7TfRl4aFGJkwF3eyCnlrWY46eEQ7oJKoipU1Tcip3bculPoPo5kyAg4QJKO1UcyMaa
         J61d357698SF/bHNX31EXQfgFomIiMgJd8VtCqixd/kE1LaHEokrFyxFIuKvALhLne4c
         URAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786718879; x=1787323679;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3zH28m0yMIFAHiTATXVrk8TuQRDiVPyngjoADZud3w4=;
        b=pF5WAR/DkPzyrSP2sg7aaT1RxF/VieDd4b3+jn7HrJLN5VYUvy/nshhP2KHTCgsTxP
         j6HECkJyQcaR4f75FNhYqEl9VxQ1dThZcuMYhC9JJ9mywyxGrBmU0ndnY26oZaB+ijTS
         OEeAejGB4Kuaan8mObnAQclvn1kALmWG+fIQoggJmW88M7GZU6NbdPdSTtfifk+dKF9F
         Q6bD7jSq/d/g+KOBYJ5MgAzZW6b+bgOThx8rqdAKdIDeMg8u/SjJEp45Tj3VKbk69IY5
         PNvaZPz2mvN77OxRvr+pMrPwESba1h98tc0RX/SFNPR5DpZ2pskqWhvyd+iN+Q/GZqht
         9KOA==
X-Forwarded-Encrypted: i=1; AHgh+Rpk3/FOG9AqjU/AsBdUbT85CY1bAG2RgaNMKjrW50K1E8fulVv8FztWGOFzS/4PTaoNRqE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzopJ3iYVPqTfA6wGe5AyaIFRC2H/4ehYKPHhJ+/aN5gRKzWzyq
	ycqym0RyyYFdCZI743HiedEYoI8KGkAkJjIqz30gfoREyaLVMm/fN+vG/oJlydosnLaTXSvHvdS
	S3ktHMQM2XrxMq1aQyVz9R8FFLXW1Yh43jVCz20L74dFmNPE10xbVqw8=
X-Gm-Gg: AR+sD11RnxHlZG6M8zTxMSZ2BaGFzqFZRraF68wpMn4nF4ucjW64kTl97dM43TrWH/x
	VAK1Mi/UMbIjzR8RKzN4pqxqeu9kPCBADKGfsZQEJ5R9hLYGaaQkN4YOMu4rMcqiGCvWx88TJzm
	Mx4yqD5BtEQmNDy7Oja/udeIDTUVn96XZpa7xFgjdrNHUza2m7zZakdz13FnKPMzNs+/MGvVskm
	BWHU3OLaF4cRCZBCSr0A6vz03kXiOhOrbFXgvXzoC95uxrihyDrkKopBxeDzS2T2DfKKOn1Mx+X
	p11HBmO/s++3/eQ4CJLRfwjnM4SYU56qk91iRptOrPFRo/1g7gMSbXRrl6vVFgG9uqtvkk+s/dT
	8ynkjDyEpr43YQAWw4ICbpqi41k8GjVkgaGugNXOME5o2hf1abgMCXWsS5bTyN6LfioOl1ijyas
	vrNeHsg2wIXUHw
X-Received: by 2002:ac8:5f95:0:b0:51c:73f:e3a7 with SMTP id d75a77b69052e-52d85422700mr67910251cf.26.1786718879351;
        Fri, 14 Aug 2026 07:47:59 -0700 (PDT)
X-Received: by 2002:ac8:5f95:0:b0:51c:73f:e3a7 with SMTP id d75a77b69052e-52d85422700mr67909581cf.26.1786718878719;
        Fri, 14 Aug 2026 07:47:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458bfe388sm593150e87.59.2026.08.14.07.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 07:47:57 -0700 (PDT)
Date: Fri, 14 Aug 2026 17:47:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        nathan@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v5 1/3] drm/msm: Guard the QCOM_UBWC_CONFIG select with
 QCOM_SMEM
Message-ID: <4xhwuoehp3tzncetn5y4eydefkxmwsyd7jih25ngsxeagdxbta@r7ofralz2er4>
References: <20260814141724.1006382-1-daniel.baluta@nxp.com>
 <20260814141724.1006382-2-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814141724.1006382-2-daniel.baluta@nxp.com>
X-Authority-Analysis: v=2.4 cv=I+dVgtgg c=1 sm=1 tr=0 ts=6a7f2aa0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=8AirrxEcAAAA:8
 a=EUspDBNiAAAA:8 a=qCMfp5iw1hmu5WYrWjYA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: 3V_ubw3sEnDaWZvUFcglR5OhuMTPmwFv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDExMiBTYWx0ZWRfX+a2XVbtbCTKY
 WnPaKblXopWQNkvjI8I1RVkO4P6GeTdpgOKPeNX4Kf2ozrdv3SDE7ZkiBM2ZEaVg8V7D0y7prpp
 xdngR8Z1USie23gzr01/DtOocKMnv7RwdP50j7OOWoxcWMHL9BMAZkI519v0btqq/vzYtt8rR8B
 1DRnU/gWnFTDACmPF4cCHeIHPJIcZ5NebMNQnEJ1gG71/8+ITrh1mQi2K/jSJKtPZ24ZtTJ9qmd
 KuzPQKuV3I4qDu+SCHrBh/Qx6xOBHc+clAADyVuzkHD61NwRYomcq1qZUC4Gd1wl80npIRMtzKT
 4RQrtJ1dXAavlymeIQp3/hJKsFB5To36qfDSZPYzIYT+fSIxDNfaeaXKP6Z73QRgvUfkHRttBIN
 gebgvXZjg+yS3CYr/ryYg18XfJLAklCPfIiJLoEDy7cFE7FjTOH2rol+IWpQhnMUsoNT5NpY7DZ
 OP7lHeYtjDB8p1RDKXg==
X-Proofpoint-GUID: 3V_ubw3sEnDaWZvUFcglR5OhuMTPmwFv
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDExMiBTYWx0ZWRfX7smHc82t8g/d
 DOVbKuuvwv8D8NINgbWb47Mlf74IuycBgfD0DnhtK7gYCk9cg/UI0Wqp0rkSnNBszPgcaHbNanR
 XJNYomssV34h6ipSrgDOXziyjZfi6Qg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140112

On Fri, Aug 14, 2026 at 05:17:22PM +0300, Daniel Baluta wrote:
> QCOM_UBWC_CONFIG is about to depend on QCOM_SMEM. Guard the DRM_MSM
> select with 'if ARCH_QCOM && QCOM_SMEM', and add
> 'depends on QCOM_SMEM || QCOM_SMEM=n' so a built-in driver is never
> selected against a missing or modular SMEM.
> 
> Fixes: 1b445022d1d0 ("soc: qcom: ubwc: Get HBB from SMEM")
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  drivers/gpu/drm/msm/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

FWIW, for taking it through soc tree:


Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

(Rob was also fine with that in private communication)

-- 
With best wishes
Dmitry
