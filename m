Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE8C37B3F2
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 03:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787283080; cv=none; b=ahogb/2eZC/z41Nd3TRnFvhTZQlNFnk4iqvYOwqX6v+XCLKgIqTjD0U6pd7lg2XdDl1teBG49BxY3uU5NnGTrgoVDTe9vP026XKu6JcOV+YDrmNeozHnyUgOXoblbYq6HYKpMAIlqXDqob8jb/4YI2tMN3XJUZ0eKYizPmcfHb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787283080; c=relaxed/simple;
	bh=rRLjEKOLQTMb3MSs7xUoB278zcnrFLWzrc9athBYbT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uh2ESW8u4eAqR84YueDjpE2tuCgCjNW5nukgP88JhanQ0V4/kmC8Kttkn+80BP63pz5d6ahBhOLNMbbKVmzWmYMWDSb5ID+rZ44L6OSKhgaAkAr/2E4OkNwH8obxqKYyz7aw0vMUhoSiiqpknec3EZ+PMx/1S3VX1MsGyLP/VYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bfUBn51c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RzeZCbtU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bfUBn51c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RzeZCbtU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L21U2M498362
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 03:31:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=D0BJKbNWPl65wpikRy//Ivdi
	8hshU2EcZQfRlKLXdf0=; b=bfUBn51cj+4qnKl6bAsvBrdGbGMw/iGoS7nPicYG
	Nn8QPmqNHk8rxREjVkgWGIW8tyAwKdNVMg8Yjr0KCGoNIH8zAVT4Q5GVKzsCgVM4
	vAmqfqewKISGPcwbdHIbc4XRd+7P7RUma9RFK3p7Vobeut5DyyGKBhNBLcTUUIFd
	SmFo7lLf/klJHxQbGomoO7c2vcK5SmD8NTQTNy2JdTEQq1EgJJ41uCxA/G/pEuk+
	D4CEBlCDceuoGeNZzguo6zUzvWqFpBekUkyidzEH/7puOYGuYLZknJzDotDvHzd2
	rtcu8Og2FVryCEX2pbO1eePFEPeFGuDOhwj5ODfpYaNg6A==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5vh7vs0e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 03:31:16 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9772e18c186so520817241.1
        for <imx@lists.linux.dev>; Thu, 20 Aug 2026 20:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787283076; x=1787887876; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D0BJKbNWPl65wpikRy//Ivdi8hshU2EcZQfRlKLXdf0=;
        b=RzeZCbtU6ycmXEGd7HtDwt1b9YyAn3vhAFxNc9C1N7jpFTaT+vjXBQhrNZmtQb3VB6
         t8pa5QEVgnhbyELBRxeRbC1DzQ1WNpWOelSfDRyn9lqXg1HaGcbY0JiV3NuBG37GsOip
         iaYVWGdmtNtksE44qFo3Fh3dJfKKP35U//EymtiDPjWZeGCCFVY5NGm3KLExFF9DWcM0
         dfze5rz5tVI5m+XFJRQbqBDoJ/D2vHbtErRJ2HQ3sWG43UkVNj08o20t8iE82LEBRy1C
         aFTLN64MtFxd2LA6uc2lSXZ5qNHYBSaaJAnmr54mEIOmCPTp06Wwn23e+BtaE8A03kED
         lM3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787283076; x=1787887876;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D0BJKbNWPl65wpikRy//Ivdi8hshU2EcZQfRlKLXdf0=;
        b=MAy0I3oVbmMormSsNz/Gq2MyvqfZHjgr+L4uUVyR9oZl0Z5U4XNnNIPuYL0OI36SoA
         IyYgZcsVLLJVubmCTNijCZNJAzzV8oaNcD/n0R1zYfbAPGP4xOrrrwRU9f1PHkc4E1QF
         LTxAcuqeOwPMtivfk66w2eD3f6mSQFv/dJWXMCsqoq2bFirvbDazGqRfLpR8w/dMHsFR
         rOvtGdPgZZKve50+XhVSGwZVwUVB2ijGs/Io2/G2mQtxBeVw7m9rYn8WXNOWHv27qsjT
         BNMp2lJgUe3VUDpIzBuOj0SUPmpJLPlz+uZN4qXSbnMmrte5flPN7zA/aaFJMSd4FzjJ
         DrVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp5KDet92EHXyKYH0DGFg2g9idCQt49dO0pwrBOZXJ9yOvf3Vgi3t9AyOoPN4TYyTVTVcM=@lists.linux.dev
X-Gm-Message-State: AFuF++m9ZtNbryn5NlDJFoodzXR5QDtu9K6Ao4DWW0pAl6a7zWRZj8/T
	UmwceMzmT2AQb49sCRQspouiYXCoxWUchppfdC/YNtckv51jXWlmvQRq/LefTRDdcrKGJFe5pwT
	eZ/0k2RBva/mdrlMg8JwOXx2nTa+bPPW1/MkTf6fQ/WD7hDVDrVK1Q90=
X-Gm-Gg: AR+sD1307YBoXT486HDmfNHBkiBFZ8kJYKO3kaWZBBH+K3Dve11yRgv8xt9ePm8ov7z
	UOZUAXXUc+asROJ1h2QSgubPkDrTYtnFgkCyNAA3nPggeHm1M+mXj38G+6ZFzwdQMxlc3quG8O3
	Y54mAHWBQv0YmZxKscSnzKN1tL9qrhb7CWjUkLo7epOpAX8JjcZDGrwN5i9cPs+y/nG4xGL3n1q
	hv7L82d2r+ZI8fqJwIIePOJg+QkNqlOt6N3jOV7Y1lyNB2DWq1EZ2g+kPfVse+hmHwbOCdPsylj
	IHJRzlJeugkx2R9mBqmkkYd8zqEXNpEVTe19/gYVchwYS7mNz3rOFps1pP6BNjGa99lQaLuwqvU
	EkEp5sPwxvoRyEBQ=
X-Received: by 2002:a05:6102:441e:b0:778:295f:d915 with SMTP id ada2fe7eead31-77a64767987mr1520083137.13.1787283075717;
        Thu, 20 Aug 2026 20:31:15 -0700 (PDT)
X-Received: by 2002:a05:6102:441e:b0:778:295f:d915 with SMTP id ada2fe7eead31-77a64767987mr1520063137.13.1787283075188;
        Thu, 20 Aug 2026 20:31:15 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff16c3bbsm4318886a12.24.2026.08.20.20.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 20:31:13 -0700 (PDT)
Date: Fri, 21 Aug 2026 06:31:10 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: wei.fang@oss.nxp.com
Cc: xiaoning.wang@nxp.com, richardcochran@gmail.com, andrew+netdev@lunn.ch,
        davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, Frank.Li@nxp.com, horms@kernel.org,
        wei.fang@nxp.com, imx@lists.linux.dev, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 net] ptp: netc: fix period truncation and potential
 divide-by-zero in PEROUT
Message-ID: <3pct7p5r66gcjk6lv7lczavowqqeho5auwsdxzcuvpfyqatbqc@5mclaxpjrp32>
References: <20260821032449.1235065-1-wei.fang@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821032449.1235065-1-wei.fang@oss.nxp.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDAyMiBTYWx0ZWRfX8KWrvQdLwz2s
 TtCzIzZfLklA8AcuMa6AFwR4PTLCDoqVyeYRuxlPvQdL/Yx1zRvkukyiIAnhzrZEuUGhfbT9yg+
 voBLTYthcfNK+r6KrBM7WL5s9BugM2TkBbu4gXRGpt9PcuDW4/BDPFQcXfJGGwLCQ5ikB/KktJg
 cdpSwMN/fkjb5O58EPOXNR/Dv6KQUx7hD8lZURLhmycuc5tlLeeM3UMAFEQQGQzeBWUHZwV5rTN
 Z8j2BKtPX5i1T7gg7kfvAmSh9S+cUMz+07O+F/RWdn/tq73b16egq2hZIY9bP8dqitLB6PAa7wN
 OoHwCjd5mGszZxeXwrmNvQ9tpwHVc4/Rf0vZIGYs0h1yAr894lXzTuVEznUPj/0OxkrLkSrgHA7
 seWbwi9knfFPU+RsXCz7+Hpmbt7VXTpcNKOf5w5N0C63cFuKWl+iHltdqUPQvoAS2HqE7GPHq0Z
 BFn8T5PiKMg2lQ2ozDA==
X-Proofpoint-ORIG-GUID: 4EiaqwCxI5jGKUf_HraeD3rjmxB2dFPV
X-Authority-Analysis: v=2.4 cv=Y7fIdBeN c=1 sm=1 tr=0 ts=6a87c684 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=yuO1uXqJhx-VUX7VmG0A:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDAyMiBTYWx0ZWRfX4dglpAzMl4dQ
 AwUkuKdvWtR+YuUgqOs2ZFcNG1Q9q/bDPmRRuYd5upzF/Qp00+QcNl2gw4tL3q76sjXiRd5urPK
 vZrCGVUzU+BBg5MFUMJFjIqG3OLGPyQ=
X-Proofpoint-GUID: 4EiaqwCxI5jGKUf_HraeD3rjmxB2dFPV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210022

On 26-08-21 11:24:49, wei.fang@oss.nxp.com wrote:
> From: Wei Fang <wei.fang@nxp.com>
> 
> The max_period bound in net_timer_enable_perout() was computed as:
> 
>   max_period = (u64)NETC_TMR_DEFAULT_FIPER + integral_period;
> 
> which exceeds U32_MAX when integral_period > 0 (e.g. 0x100000002 for
> the default 333333333 Hz clock). A period_ns that passes this check but
> exceeds U32_MAX is then silently truncated when stored into the u32
> struct netc_pp::period field.
> 
> A truncated value of zero can reach netc_timer_set_perout_alarm(), where
> the local u32 period variable would also be 0, causing a divide-by-zero
> in roundup_u64(delta, period) whenever the stime < min_time branch is
> taken (which always happens for a start time of {0, 0}).
> 
> Additionally, netc_timer_enable_periodic_pulse() and
> netc_timer_enable_fiper() both compute:
> 
>   fiper = pp->period - integral_period;
> 
> A zero pp->period results in an unsigned wraparound to 0xFFFFFFFD,
> mis-programming the FIPER hardware register.
> 
> Fix all three issues by capping max_period at NETC_TMR_DEFAULT_FIPER
> (0xFFFFFFFF). This ensures that any period_ns passing the range check
> fits in a u32 without truncation, so the stored value is always valid
> and non-zero. The accepted range is reduced by integral_period ns
> (typically only a few nanoseconds), which is negligible in practice.
> 
> Fixes: 671e266835b8 ("ptp: netc: add periodic pulse output support")
> Signed-off-by: Wei Fang <wei.fang@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
