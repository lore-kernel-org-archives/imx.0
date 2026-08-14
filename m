Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27AC94756A1
	for <imx@lists.linux.dev>; Fri, 14 Aug 2026 14:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786718225; cv=none; b=a07XmniYjmuUVVb4XkQvZD9Md97sNcbQIFXwr8Ama7flPkLCGV4NyLMg1JAVLlzGY4ca/Fuc2+SpdAWTqiXDhIG08X21kvx9gc4Jg/6rzOwJPAd2djJW4bNeoMny29e9u5N4zMGhclM8pkAnP/wbc0VoS+hlGnsZsfyhx+E4zeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786718225; c=relaxed/simple;
	bh=TBZnFKfa+kb7VN3/hihNTcK2yQd4hVrAu3/Y0tr3uRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gqzh6OZ10wjBIIMWymdxs4FaML2zNOT40COSHZzDc4mwOeYwl3ZYLAqohnjoTSvHhkMMgySDmy7p7IEmbdDDuYP8q4Mq9UVjupnce/9cMobp27OO3Rcz3GBYEmTIKVTCeh3z0hrcFPYW136oMqFCCOPkj5uYZmL1UIFZH7nB+JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JT0tjnTO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fegx1Dz2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JT0tjnTO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fegx1Dz2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EDwwdL1935040
	for <imx@lists.linux.dev>; Fri, 14 Aug 2026 14:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L6dR0LgW9NvqKnuim+dpko9a
	TKhI2c01MoDNn4yRQwM=; b=JT0tjnTOhmBQdgVrOYS7O2ATlz9Cdl9pP8KdPbJz
	ZbH0OMTKaWp7kQkPPzw1cj0J1zV1sPfQLGoCsg1OsuB4nHLrpQ9/dmYC9sEkInWw
	snHScmpeN6R58teksUyVMEKgSv6FjT4Aoxv2Tz5bwwp/zjiGfZJxzn9eM5aH/wvN
	ngCevUvhye7ZAtqYWbRvAmUIkoT7gt/MPLT9YM/quFeIsw3bjv7BJlRr8oLf2giJ
	PWH1d27KXAcejgxjlVCic46+t1izYQTwX5LhPndTSHRH6cwn+4j/igNvxiJzIdiT
	lRe7AC61gd4UjYfLwUkTaN3WaPJrN3EIUDqz8M60pUwe7Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g20gn96n0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 14 Aug 2026 14:36:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bf321d786so17199541cf.1
        for <imx@lists.linux.dev>; Fri, 14 Aug 2026 07:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786718214; x=1787323014; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L6dR0LgW9NvqKnuim+dpko9aTKhI2c01MoDNn4yRQwM=;
        b=fegx1Dz2YYZ8HFEq/y0NiMzTyE4Q/9B/BXLRHZ7ODtH6+u6mD8eoae7wIQAfcI16bp
         aNWvvfPucjwnZTQWO1elBBayyV75lgGmtFqWH4PSCrHp48OgKvB8H/nAT/xcgc8uVdNQ
         3mQMDaqihqti/A7fMPzyRwOb9flejtgtZxgPsT+/wBVLdjI5QmMlN8rYfuweGsvlVvjX
         BlnO5Pf5fplTXiNKSeZigoh64/4o0H81caElAiEpW0moY76T8P3d8WICPgs/TBBE97tt
         5b3D5GUMAkYp4PHvuAEwH8VPD7XDyUN+0RN/A5n9oJx2FUF9puZV1SaVnVVYRng6vXUr
         yrVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786718214; x=1787323014;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L6dR0LgW9NvqKnuim+dpko9aTKhI2c01MoDNn4yRQwM=;
        b=BVto89dpO4U6LANcijJMSIffQsP0roAnOw++mB0Q45+ze5H15oApXd0vakClGoznHb
         HYHbvqRMxgJbxByX0Opp4VFoMabNV4knBZbjowUf+TR3LGn+YWU9a98nw54uD4LnAaFM
         TBq65Tb/eQmrwR3jmnU6GZZYB92W7c0qerzKM2sDxMLLxJSYU7WVBJgLgp7+WP9xaG9z
         DQIBoTw5xfx3BDvU6HbpGULtXU6RvvRv82iF2ES1I2XyBv00LsUXuUjfT0oHvjGlviH5
         0KIWFPOUFNYoNMrBLKJ1GYgXuJy9mpl9QkRgEThcOJnuFRDJH3y5NmwqYwlS658pacg8
         SjGw==
X-Forwarded-Encrypted: i=1; AHgh+Rq77vV60clmTQ23Hd9rP/IVOJ9+VP1RESLKCeDqcQQE+9g4Za0txHg7jI/iOOBWQ+P05H8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxgYvS+4RIDCtvPmYIr26qQjPTF/HYFhTD6mR4cfWtz7P0/r2Vb
	ZCEQW/Y7k4cx+glx6F0RAYPilt8e/tLuoIBmbGgNIz+8dJx7NgrbYa5JiqvSkw6CQgcH0CibZfK
	Cu/z4MY6ynxM+Ebotq3zso47vo1tJc/t9I0j41Obx0mQQMwaAHp0tNaw=
X-Gm-Gg: AR+sD12tQqdV+Egmm5ZffuCA0Yp1DItoN5ygVIuW4uLfTorh/CqqMkmoRyUgyKwFavf
	DAD0iD5yihTX7jIMeMOJjsVmuvn6o/M6Wjw+41pVwUvrCeqNcowQhcPONtCA9Cc2Y5r1NVhgz2c
	Hmk7ZrFOntSNLavVkmAomcUABt3/KGsqWHcNAcuiGNa+mkDbQot0d1KqtYiFrImY/JJB+gXWMq7
	f9W/KKMCs9N7acdDZzjrlnXgAYFZeWkEAtlD2dSrb2YdfjnLqZQSoeEm3D1tVUpgU5RmpIlryFH
	d4TbRVmFqM/aAeG7RM56eamzdk5/JV/S6HamMQO8txhZP+IwwDilwNHDOQVKXhutg68xxBvf5pA
	aO5quYH+zo2jDT3HHErzc4yvUrGQGcRGdd/3zeseIFoLHRIX5NYp8urh/5Fr96XhLitYssrZHDg
	Wdo5B47cr7peaY
X-Received: by 2002:a05:622a:1aaa:b0:51c:1d67:379 with SMTP id d75a77b69052e-52d854390aamr68465361cf.23.1786718213586;
        Fri, 14 Aug 2026 07:36:53 -0700 (PDT)
X-Received: by 2002:a05:622a:1aaa:b0:51c:1d67:379 with SMTP id d75a77b69052e-52d854390aamr68464401cf.23.1786718212874;
        Fri, 14 Aug 2026 07:36:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b458b3eb0esm595885e87.0.2026.08.14.07.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 07:36:51 -0700 (PDT)
Date: Fri, 14 Aug 2026 17:36:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        nathan@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v5 1/3] drm/msm: Guard the QCOM_UBWC_CONFIG select with
 QCOM_SMEM
Message-ID: <wkewemdeuqadlke3taanexambmzput4midbm5mlmafz6d7dhty@djmrwd7lzmty>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDExMSBTYWx0ZWRfXxb3zeConZDt+
 4T5QyPCTmRar8egXQJi6++QMsy6MYzCLjJ7NTZboKfXKci+cg6px8h8RlugRDF2OIOT9xgqQ3h9
 0bnJmteDghfds+XXLZsAdkyYQmG8eyB41m1oDSyhQ+83BsfK3B7nW8c9NLPAEOG5b9SwmHCsKPX
 U+eEmZITG5awMc78bJ2ynKhDE5Yz1FovmrUvtBp9IKePJzYqZnSFmMX5pH8rinGt5YjrYW8YQQg
 E4Hdbee7s5r+S1q5PKM2ASFM64fU7dY4JD6F/IN6IfDi8umjj0xlbPqlgusH6wqiLlVbGJE5FS7
 BOCLcnQJyxj9M7FU4yMa8ILESFS8WHMgs0daBQ6gYxCm/+tUD/XgWuHQ4ADrhpL1XP4dH7xXmZY
 02ksiAixMWuNmGW8xzL2fnFkkmo2z2YKW2ddPEe7JVluWAexwf5vBgY8+OD30ehwjcOHnbUwaIo
 +9mKsfet9cO1MrqxnLg==
X-Authority-Analysis: v=2.4 cv=DdMnbPtW c=1 sm=1 tr=0 ts=6a7f2806 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=8AirrxEcAAAA:8
 a=EUspDBNiAAAA:8 a=qCMfp5iw1hmu5WYrWjYA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDExMSBTYWx0ZWRfXzRgsY3jal9Bf
 +yhcqDOb8t2MVfRl5aCyfZJy6D/CqU+QeaFOfaWU4m59bLTG6JhxaZFn5RRjxn247SP0H+rRRvG
 +RWd56S76AL+6hw68ew/mus3GaB6RZs=
X-Proofpoint-GUID: ebh4--j7yMxD5YexzykPiFEmj5C-fhzw
X-Proofpoint-ORIG-GUID: ebh4--j7yMxD5YexzykPiFEmj5C-fhzw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140111

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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
