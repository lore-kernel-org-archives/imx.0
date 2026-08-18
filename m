Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108232BE7BE
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 00:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787014700; cv=none; b=Ayakq8fvPy+TsyQ74gHgHmqYVcVwfywOe/1SH8j5/9bJ2uGHpVKRrpUnofuUD1NMhPO7zBJQ4rQV/TojgNtKx+IL1nxCdoFLXl8AaSbXqFAAuI5rhSyuJ8p3wP5QBPwXTs+7sSQKamNRjLRWQ576zOJatUODBv/oJAdkcdEIYPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787014700; c=relaxed/simple;
	bh=joYuO7f48uZoFbfGhgYUW6mhPzMWg0Ff40EKVAM/6qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bDmn5335kZnTETv5rOX913WGVnk0L3s2qpBdmn/Ec75fi4Q8Ba0ZxzFz++XRbcG8PIuSdwMzuqHfrsEbb2t3j41a09TYG5epdSJr3uoGJD/P95YOI7Ll5zU8C5uasoB1eJrhuwy2UVPAgSO7hDl8ng6zXRDkERks4N1ZkWjST1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m6GIWZdC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=alfF2Wcy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m6GIWZdC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="alfF2Wcy"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HLknE13059105
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 00:58:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t9VrvGoHX6Bv1WgT6pX7+u+s
	sDo3NZIStFSLIc19qOo=; b=m6GIWZdClIgMNqVtdwhzOvWtLmZ1MI4dZAClaJVt
	6Zht0DmnJUtiVA7Zn3uAWskhghly8/4en3SoBbZe9wSeaiTqHolC49vtegzbDMKN
	371OBXupH2ghpWD+5HTrlo5hhjnxdbuMPkt0m+KFsDjnZdoBahTzIdzd2gCBI47b
	zERQ8yIX40PKDcDhUmhxDeAXRruLWtdSgW819y/eLol5742bcTF8buQ2Js3UMBlk
	pJpigx84xtl9pgiNMgvuOD3QjHb8Fx2ffIKoqXFWyJMzQ//9Scjm6PyFGlcYLNHt
	5gFvKQGGJYsNgtCC6vYGIwt3dt3VhH24XGdLfWoaBkRM/A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xx7kmfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 18 Aug 2026 00:58:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9349c5af52bso675701185a.0
        for <imx@lists.linux.dev>; Mon, 17 Aug 2026 17:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787014697; x=1787619497; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t9VrvGoHX6Bv1WgT6pX7+u+ssDo3NZIStFSLIc19qOo=;
        b=alfF2Wcyv5aNDenVVBwNoZnTG6NU1xEhUL+AU5ODMEy/2unOW3vvbSqUd7W8S2YU+4
         Ls4jRBlvYMTjUDmp0muTNT2qbxYeXCKifGRHD20jKSMDYvhp0UZRaCyzZ6y1Q43yvSWS
         qM6HfMYfZdxz2t2Hevh/jzph2++hwEp8QfLHRtvEeo0ia/0k2LMywClGxgvJCS7cQN6P
         8rg1XpLeAYHfvAD8ltLCXEDe0/aul5zJRnsxxuc88m2Iu2NcRX204I/UdwY40zaOgXjc
         9x5qRv1RLe1jHO+FpxhVRTw/rysWGXRE45yK4VkYcyiCw+6xpHbMcH/Mh/m2G7Y4wgL7
         qoWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787014697; x=1787619497;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t9VrvGoHX6Bv1WgT6pX7+u+ssDo3NZIStFSLIc19qOo=;
        b=sQqLP/9g81QybgoO16KlVWOUWYbKM2s56qV3aF9exGv4Ic/e56iZ7uTNfVkazap/fL
         G1cAd4vDqf/WawPfev1fLu7ORjjyWZMmPHWxehIg4utu+1N1hlpqyQTwrlYrKzjbwdMH
         gUR1RrJfQWHqw5ZI5OG/IWqNAZf6KnjJjVIOFBFD3VDtUHQCAcmqS9fyRyU/O2enS7jx
         RsDDWfskAZFSz4yle1riZgXsIN5oOluGiLAPUNXMygXotZ1NhnwVbf8j7A7y+xl51OgG
         /K/Zmj0QoDonK49fABUEyoZ+iSEiFFTAFu2MbDaws39WdWSyFs1s3Dz9EY0NONum2eRq
         Tjrg==
X-Forwarded-Encrypted: i=1; AHgh+RrEdSb9KBzuIKuN9A92bQcvMW2fupAs4gCpniFaC8YVxcR8M13nD+9D9KtVxsGeIdRG4tc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwCrhXLzOZ/vfi83pdqV3hySXs0rTCCm50jk6LYghUPwckMWuqO
	rUetZCv5nyuHXq7f1oUi30UNMRvn3KxqcQhcIB+nSxoQsOFbRc2XRlacCzdYg128cmLgYWq3SXq
	pC4M1DTsyV3zTlQX8y99JUPNGTZPoKWgApfLhBONEq3OifCqfMCDB2jk=
X-Gm-Gg: AR+sD13ivbUBQS/0mHTpj1TZNl1XvM3gedMH2psvfMVfmkpgaQ/Ic1onPgYGjruNYv1
	L0biVKZLUL2HiubAwkcjd4PgbLbQp6rc70salB8iYG3yj+yvhkfE/cZKfXer0JklGFE4QTUsYw6
	F2CZ3LJpPx27a2/Te30dr9zqtrS3rWPhCdMyw27kwG6ByQM9VA/p/uwr18cGuwJLx4jvkU3ckLR
	NfMfAbUMuM3YgqQeQ17wk95ovlt4qr5yHuNij13qKlec6VOs4ueonCqsGU+vRQkSHOfgDdcKTqb
	UF4c2BG5fXpD06IEUiVwy9UxJGG0+9KfqYZuPO5xgXf9nzTvOolz11zOMBl54Ypz9kErUVRJjpN
	M4eIyEupQCWHz0yUlk3P1iWFygyRIuqPHdrY1GQFHmXXPuKHyW2ppdu3b+aXhPlgRqPW8kldJAl
	B7EOJMdt6vlOkg
X-Received: by 2002:a05:620a:199f:b0:92e:fc45:3472 with SMTP id af79cd13be357-936d233171amr2785463485a.29.1787014697433;
        Mon, 17 Aug 2026 17:58:17 -0700 (PDT)
X-Received: by 2002:a05:620a:199f:b0:92e:fc45:3472 with SMTP id af79cd13be357-936d233171amr2785461285a.29.1787014696974;
        Mon, 17 Aug 2026 17:58:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b1bcde2sm8651721fa.30.2026.08.17.17.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 17:58:14 -0700 (PDT)
Date: Tue, 18 Aug 2026 03:58:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, nathan@kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 2/4] media: iris: Guard the QCOM_UBWC_CONFIG select
 with QCOM_SMEM
Message-ID: <plwrjn7mzqgphhgjuaqcvz66g6d73u27xmlshua5vobrwwfoke@zlij3jglzxy5>
References: <20260817123542.48475-1-daniel.baluta@nxp.com>
 <20260817123542.48475-3-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817123542.48475-3-daniel.baluta@nxp.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAwNCBTYWx0ZWRfX/LhOEefx0SPr
 SlKV5orJU8unTOTOeU+F65HRy6KIkqMGsw7ZTotcHlk7DEu9WhVhdrZwlP+Q7ep0337A2xbjJaV
 v1rC0nmOOF7ea/hm/G7ousMFkfc3kO8=
X-Authority-Analysis: v=2.4 cv=TK91jVla c=1 sm=1 tr=0 ts=6a83ae2a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=8AirrxEcAAAA:8 a=L1AqNCugDRGGcWq5ZiEA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: lATgL7qUq1MH8Z1nq7T-fp_Cu8iCITqY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAwNCBTYWx0ZWRfX/z7oeqPCSGfH
 DTTm5UrVdNaqrLTURuZm7Mp9xZzCu1kIWYZuGLkRtue7zkUI2orC5dMIAgAtWsNYQ1IN6yNGML0
 y9kk3RyDam6zqrHswgns5dT1c+WYHdTbc3VdXn13ZiZiFu0TXTp6YuIUAyhnjXXB2p26aoOlLQS
 PySNxiPf38UImGMAHUmt8+V9n9J1vLW5DDVlgNsVpQC8uXgGP6yT08VKokO1bQSRmF4VaDOhS4D
 Da6TSMzrK5XrWhD8m2M1SkHqyf7O3VQgHyQN++LhjQ69iab02DwAbtRJ+sx7CCqDrGGIxPdFgCt
 ccKCsAFvg7YEeQoN/uC4knn+dDnTBIJTKhhfH2GztjC/tcOoZ3cbePADs8/pm2iRKTQRNkBR+Wa
 QWPPAvYU9uZlMlWn9GyzumroDFJuAI1a68z4LkFjxdxbinXl1F4QoaGg2dbJmtqv4Bq8pybfpRV
 lLw0Dp19tp2vS53IoIQ==
X-Proofpoint-ORIG-GUID: lATgL7qUq1MH8Z1nq7T-fp_Cu8iCITqY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180004

On Mon, Aug 17, 2026 at 03:35:39PM +0300, Daniel Baluta wrote:
> QCOM_UBWC_CONFIG is about to depend on QCOM_SMEM. Guard the
> VIDEO_QCOM_IRIS select with 'if ARCH_QCOM && QCOM_SMEM', and add
> 'depends on QCOM_SMEM || QCOM_SMEM=n' so a built-in driver is never
> selected against a missing or modular SMEM.
> 
> Fixes: c43207553867 ("media: iris: retrieve UBWC platform configuration")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  drivers/media/platform/qcom/iris/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry
