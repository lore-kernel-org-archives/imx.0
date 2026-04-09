Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C0B429992A
	for <imx@lists.linux.dev>; Thu,  9 Apr 2026 21:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775768795; cv=none; b=sjjbmwwBE/2NU2ktGHuMB0DWE3xP8WxTzDgEadDI3oNEzQYjYFAe4Av5vBnhQmKLLsEYEwgQEFfRDI9qIWqaEdmjfSaKk6IUwDTxkUkJ0BPsuEwguuzsydK+bFdHELWRDJ3thmz8TQavzF4dv8a+UKSu5+Xu5jK8Z8s7tVF6jzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775768795; c=relaxed/simple;
	bh=REdKr6BZsP5C2a98ix9lskwNUNfZ1QiVR443hUjwdWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rxHFDPGqeIWuJJdR5r1KIPm3+kRFV6tO9PFhl/+ZP63fz+uxTnzNvIKOkpwQanL0iBFzpYFklBe896ezIaXoAZbNfjIXhE2l3zNq6CguOrtnVrgcR98+oFWTtvXw7XCGOr0QBuBeM2wFY/eS3z8AlqmMVCLdvx49c34nLR3pdV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BIWL5Rqq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qcwe7C/2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BIWL5Rqq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qcwe7C/2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639IEbsK3352631
	for <imx@lists.linux.dev>; Thu, 9 Apr 2026 21:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BkT2BXpxWHehgHaz7HpCxZpY
	hADGt5iQQLiK/P6Xocs=; b=BIWL5Rqqsj0jnC+EeLvbLFI4/kra1Oj3NiTjbMPp
	/XQeyVBxb1yj1Xik4FOtTE05S4A4Y8Ie772HGVqYNd61VIRj2+D0qMLWU16xVOr6
	SM2jzt68Gq35kUw0JSA5klvDL3s06inD5cmehemAhJy+NTeCO4+x9w/k9DFM7GVO
	2sRadJT/Ay75272QJ8YVCFvUNQnZjK3Mo0EuFRALKPE2QdZetCMfBW3rLcVM6eDl
	9MYmcQAnR4te0uifG3MWVMAHfVb4kTUUdEuDcVYlQ4cZNNOkheYns+TXTwxVubvu
	gCj0kpjPZ6D3EUQfYXRaSw3MpMLftlHDyqgbxpS4EoM0iQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dec1qswu6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 09 Apr 2026 21:06:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d8c192b3fso57863621cf.1
        for <imx@lists.linux.dev>; Thu, 09 Apr 2026 14:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775768793; x=1776373593; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BkT2BXpxWHehgHaz7HpCxZpYhADGt5iQQLiK/P6Xocs=;
        b=Qcwe7C/2PdZxaVzbOeNk0eyNgxGsNdFWRKe4BBmK70MMUSD70jDimymbpoI0Nws3Dv
         B7pic44v+AW943XLo1mF4SF8Q6Bykkbpg4FacCVJ9fTM2jNhsluBTke5qzQ22JCci55j
         bL74gN/BrcilFyH5ILx632A+jMFwiJfdva1PCgx9Sxz3jZd2ip71cZMGNr0Jhz8QJ+Si
         QJsbGx6zsbz7klIFO8fkJT/9juuBo0b0Kp5fgj35gTZwOpPOdyOMPDHiTxOH/glOPh8V
         xG+ss/F9vfel4CB+zT2fzSVpDXsxisfrVE3As/75WZChooVwWH3aa5P8YiqEefK0imEq
         sFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775768793; x=1776373593;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BkT2BXpxWHehgHaz7HpCxZpYhADGt5iQQLiK/P6Xocs=;
        b=aytmZE5sWnR77GWbMvlzF1BBL75yYBenUSa+WJz9cXzygjzmgixLBN/jk1HOdAcIhK
         /1iVALqjOnD6Du+A06tWeEXKC1BTJAsJ/V/1YuSZrFVkNmqsGoomBc/OR7I4R082FJ6a
         xdPTAXswAbC14J1JvtTU604+E2Avybc+arQiC9qLp2MsxRDMnwgxrR8qZduhyORcSFEF
         lY6OGTWVCHiXYXhxSjHf+mt0XwLrKtZyJId2+bqrRoQXLTIzV5G61HXh7+aFRkqABR1x
         v0jpm8ujVZvJrtSZo5b7HEgT/KrcIGoVgu2Zkh1xZfWlIGOKusfzXAJfzQOv3rRfO1lS
         OjsA==
X-Forwarded-Encrypted: i=1; AJvYcCUVj1GQmMdQ1X7TdqJIL3cASPafwy1r7mjkjrovPgEWx3CXahKOqBMQ+mohlJGKU3Msouk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzdd+tQq/DnVOobpT26op5gRRJoLTM8DVJrbQvmvmO+pNPq+mMe
	2Jd/LTVpzF2v5HHJaApWiQa5eu5y4VH8hS53Guct3TfEY08RYa5WKUdOWmGxcbjT4VMJWlnIFAS
	6cx6ajnqJ/Ed1E4XWEirHfPTafrNIsR/rrZdOkh6lcAWLPN42VQoIpKk=
X-Gm-Gg: AeBDiesr2G2Yv7VfLHzjEA/bfmMUJfzD5QS7x0TPo7GwGmuWsYmdUezVDniGMW82sZr
	lEaL3Nw4EtSMWt55fEx9vx8+3JuQ3RmETdzlhm5RWn1mbsiq3r0td1cRnmcLL/DPuc5+Or63tqp
	4ZH8WBTQEOnl4VvYyeFd2C0BAyNE6QrMDtRvNfEcWRkcRu5ZmVHAK2RbK0Dv9Gl2wssfSC+Bz0h
	vQ04ENsl01oVXU1XAAZz8KIXNjIWSXUzOy6PsMiDeBpZkLLuQL/eyWFqFZoL+6BBmZGUjp8uzSF
	Fp37M3DKXcvtBrrOATJBtrW/xFS443DmJ0taYXoVxpLU4T2+eL9qzIlhqxYw1afBBIOkw2wuLHc
	rCfsOLFbyO05eWza3YU3ylIcWsu4M4TcvsesM+vRR1sQ+1MS9ic29mqADvpU9Jj+GFw4UDoUnZS
	SRiGHSZJy756BA2K8FqhkZKlbdsiI/CBnbTus=
X-Received: by 2002:ac8:5a02:0:b0:50d:8734:ba65 with SMTP id d75a77b69052e-50dd5b95bc8mr14103781cf.11.1775768792640;
        Thu, 09 Apr 2026 14:06:32 -0700 (PDT)
X-Received: by 2002:ac8:5a02:0:b0:50d:8734:ba65 with SMTP id d75a77b69052e-50dd5b95bc8mr14102751cf.11.1775768791806;
        Thu, 09 Apr 2026 14:06:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eee86641sm161191e87.3.2026.04.09.14.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 14:06:30 -0700 (PDT)
Date: Fri, 10 Apr 2026 00:06:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
        victor.liu@nxp.com, Frank.Li@nxp.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, inki.dae@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, krzk@kernel.org, jingoohan1@gmail.com,
        p.zabel@pengutronix.de, hjc@rock-chips.com, heiko@sntech.de,
        andy.yan@rock-chips.com, Laurent.pinchart@ideasonboard.com,
        jonas@kwiboo.se, jernej.skrabec@gmail.com, kernel@pengutronix.de,
        festevam@gmail.com, alim.akhtar@samsung.com, luca.ceresoli@bootlin.com,
        nicolas.frattaroli@collabora.com, dianders@chromium.org,
        m.szyprowski@samsung.com, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v13 11/17] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
Message-ID: <wmt75edxyrmhyyfxx7xrrhfdjvdu6u24zwwwsd4ryy52ctwm6f@th73j4phtvmm>
References: <20260409065301.446670-1-damon.ding@rock-chips.com>
 <20260409065301.446670-12-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409065301.446670-12-damon.ding@rock-chips.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE5NCBTYWx0ZWRfX603XuPy97Yvt
 mn4uD7MPC2ytayy1RTy7a//H5R8hsYldv55Nj0r0ebiT2iSVutgIggj1JkM7AEU6tO2gKDj49PX
 2V4W8M4SqUAHYaFUaCZS7uo65alJh6KdCmVOblgCoo9YCpW2+zkKnw6S+YcoJJUy2awr1yGwVOC
 zqUKOyTNE0PSD83I7BBRTdjaAJ+ixHom7l8L2YNwVkKhK2gemEQvLMPqoI8Ot4eZI77wXdPkkHY
 nRB/NnFQvh9mMuB8O8tSuOi4vM7/IMNrGzSu7A+Srj8rtn2T2fkgel56fLcNYeTsZe+4cGEKxEn
 LfbdIA/F17MIMCXf71FjG6xX27hoIhSyiNtg087aKa6uOWIehlpXKlBQtr4UUX9BCGCxuMj3kKz
 N4PMI3asSoFl02HAuumLGDL0oUdA51MX/w1xNWy1EY2wBPDvcqEtT5kmgiGbTGW83jVdmCz5jty
 P08Xua0UJcw/4/Jbfwg==
X-Authority-Analysis: v=2.4 cv=eOcjSnp1 c=1 sm=1 tr=0 ts=69d814d9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=s8YR1HE3AAAA:8
 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8 a=yovIxdhcBUqVpsxpVugA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-GUID: zJBAaEJ3EJbBnbhsdSyV-d9vadRDgPpK
X-Proofpoint-ORIG-GUID: zJBAaEJ3EJbBnbhsdSyV-d9vadRDgPpK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090194

On Thu, Apr 09, 2026 at 02:52:55PM +0800, Damon Ding wrote:
> Initialize bridge_connector for both Rockchip and Exynos encoder sides.
> Then, make DRM_BRIDGE_ATTACH_NO_CONNECTOR mandatory for Analogix bridge
> side, as the private &drm_connector is no longer created.
> 
> The previous &drm_connector_funcs and &drm_connector_helper_funcs APIs
> are replaced by the corresponding &drm_bridge_funcs APIs:
> 
> analogix_dp_atomic_check() -> analogix_dp_bridge_atomic_check()
> analogix_dp_detect()       -> analogix_dp_bridge_detect()
> analogix_dp_get_modes()    -> analogix_dp_bridge_get_modes()
>                               analogix_dp_bridge_edid_read()
> 
> Additionally, the compatibilities of Analogix DP bridge based on whether
> the next bridge is a 'panel'. If it is, OP_MODES and OP_DETECT are
> supported; If not (the next bridge is a 'monitor' or a bridge chip),
> OP_EDID and OP_DETECT are supported.
> 
> The devm_drm_bridge_add() is placed in analogix_dp_bind() instead of
> analogix_dp_probe(), because the type of next bridge (the panel, monitor
> or bridge chip) can only be determined after the probe process has fully
> completed.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Heiko Stuebner <heiko@sntech.de> # rk3588
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
