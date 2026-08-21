Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493D635B65D
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 03:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787282904; cv=none; b=cSGDd72A9yr+G0kEEkTOsDmdxD21tPo6K2x0WltIQ+KlFtKh+bl5ryDmZyF/Gdt3Wlw4678N3Uy8kMZO+X8rJf0KUXSWZwof48vdX7yJW/7FHLkBZyueI4AXNXMzvnerVgmy72lhEXCcTCI5VibiVIyKzLupMGA9fD3hfGqgJYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787282904; c=relaxed/simple;
	bh=CVY5b7SwRl6Vq/WFf6i4vxxeBv+tNJ4n2zl6kXlCkj0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZ0MzHgLBzEzbBJiAOVS6/io8k9QHk+vB+DkmRMii7NPnSUS1YgukSI1ImaUFlIeqPTOZDUMqwjuFsGa/psnCG2xHIMu4/Zbtag1E1YPjDQ2BxXf0O3tC5If97+qqv3yFYeaAHrvfD1CWKKbkzuPRS2kjByKSqItCtpHi93jzj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MkJ6ueZk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i0MKLIzj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MkJ6ueZk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i0MKLIzj"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L2vvQ94121346
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 03:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UI1Tbvhc6FTvaWPxg1sYLXwp
	R1ISlm99MjydVZW2xP0=; b=MkJ6ueZkoMbniUl0k8Zi7TGTcIEqlBhKknD5JoIl
	+O30DzGTMPjWSzKRiRADSOoGmQAzNq2kgBvmzxDuC2Ud+f5c2gItdov2DmwKiKyd
	UoEp0GEmUid8SbuPl8MEcHZrzDBKbnGla4jDzflauXpcwPGc6nIBq8BAkycQWQSh
	U871CWtaT8lu7xo91E+UIRADBH6GGYbDVdvCqLAF4gJgeuZId5oC6lVm4vYwIoIE
	w55gFHoRYUJEpouBscCzjFN0RExPzMAuVf2c9kE7WHbK+xWYwFE5Xs8qBtZeCGMl
	FSOT1gBdgHYVuGwpZZk1hJPg+6kyk2FMfFH23gxM8PuQeg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6ebur2rw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 21 Aug 2026 03:28:20 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97c5ad30efbso402836241.1
        for <imx@lists.linux.dev>; Thu, 20 Aug 2026 20:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787282899; x=1787887699; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UI1Tbvhc6FTvaWPxg1sYLXwpR1ISlm99MjydVZW2xP0=;
        b=i0MKLIzjegkGIPZvyzLW8Otz6JbQCLw4DLPAcTfaaUvS1FRf/obDnv5D1xfnkb5byL
         lwPr7dh1MWDpCEYgya4Ksn3xI5wmv+FetV+hCyVtRo3UIpqptqXV9/Fq8aocFjE8aXe1
         ftXaZ7gxSh2BUxCpH9gPaHPOw4Jz+iLkD/6JlPv0pjhK2r1Fp59+/KSqGwgugE8Ro6XJ
         PzsxZVFTHvPsby9ev56wT2T1hPRZD75y4PlKK5vv1TzUaHV06hImV5KQ75C6DYc9oxwH
         g3e61c7XN9p7M70gmriS05tCrXfeJmrA8za2QHmtVpm+FEhRFbDHY3WTlngs+T+tGSTQ
         LV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787282899; x=1787887699;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UI1Tbvhc6FTvaWPxg1sYLXwpR1ISlm99MjydVZW2xP0=;
        b=HzI1640NoDAtd9ytPjAvADSkTQDo+nNKsvG3QQIkcddaS5yI/uOVD4uYpUepmuaX97
         aXgjFRKrLpMV3wdO7CMB5daf8Q6sTfsQkYg55Aq5Vhj01HRP04kJGZwqMnR3az4wP1nb
         40nOO78baKJii54qxt07bC1BiwDF6ENVAjPlPzM4KsPIe5kML1/jLRr8nddaprZAeTWn
         VjLMkLwrfQ/5W42WYERyhgVkv6tRXXdpbBtjBahfNu99q5AKSaFkDErJgq6hixqfF6ZS
         xZ6ydRdfpwiASxFjs6m9ZLqHcbkEinUV06ZJs+P0p/f8JfyjpJ6mYsRUTYJhM7p3iILK
         dCqg==
X-Forwarded-Encrypted: i=1; AHgh+RrAEoSs0AGjupk4H7DqrOvXLwREVsFuFDaFrlYAXQdbYzyAcjEGYKb2I9WH16pQRaXQfPA=@lists.linux.dev
X-Gm-Message-State: AFuF++mOCJbCZBRSTzK8JH7MASxYa6h26AjNn4BjK/bO9f+B/c67YaUj
	+f6YYG19eDUWhNen5qK1MPXc6JsjljzjUTWXaKRjoU2lCqIPItae1Q8tm91WlaY8MiiaQqz2Yvl
	b+g0MeFELrTtgnWSyo2jx35sHRxRPnCg/fZDsQuOLzwUHNQ0SKBcQiD4=
X-Gm-Gg: AR+sD13EnQ+0ZOEYcJnTT7GcH1BUKiTVJnt9PgNQCKKjYkGqayGJ8cIS8cSQLlBGPPI
	Ble48HqUlPnQ+KlZEnw1k6bPSJXDVO5sA1n8EZMecoR+fXHpIZf1yqAaWGi48eD7pUL1CwLwRo/
	/MqA8xUEtOLucdWWNUgLjrdhrwPSRBbKjl/7PR7OSwEwcXnCO7Hq06kg+5T6hEK+tMNrQvkwPii
	IlY210ZZ6Ax/XxDgiPmhVKNFZ/RbVIWDnFRfPcOikVY0hTMs5he7R8uy/ym5qXUVza6Day17gOg
	FmE4CV8x2Y2MvcIiery5uBbO9AYcXxzqyQNuIG13uECNWlshTbNUcY3/1vJWKDdyX9VtChsTYjb
	hUPATB8yC8LWw78A=
X-Received: by 2002:a05:6102:839b:20b0:778:6695:2f71 with SMTP id ada2fe7eead31-778f33e1026mr2377725137.15.1787282899186;
        Thu, 20 Aug 2026 20:28:19 -0700 (PDT)
X-Received: by 2002:a05:6102:839b:20b0:778:6695:2f71 with SMTP id ada2fe7eead31-778f33e1026mr2377717137.15.1787282898603;
        Thu, 20 Aug 2026 20:28:18 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3feec9d46sm4377106a12.1.2026.08.20.20.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 20:28:17 -0700 (PDT)
Date: Fri, 21 Aug 2026 06:28:14 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: Simon Horman <horms@kernel.org>, "Wei Fang (OSS)" <wei.fang@oss.nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        "richardcochran@gmail.com" <richardcochran@gmail.com>,
        "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "pabeni@redhat.com" <pabeni@redhat.com>, Frank Li <frank.li@nxp.com>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net] ptp: netc: fix period truncation and potential
 divide-by-zero in PEROUT
Message-ID: <qdqufnjopqbl5yjwicf7zsmi6dbvzrq4teyj33pqhtx5naf7dw@2jc32iztcu54>
References: <20260818033342.3154990-1-wei.fang@oss.nxp.com>
 <20260820155615.GA265046@horms.kernel.org>
 <GV2PR04MB11739C05FD4C2D5A8B477B82D88A32@GV2PR04MB11739.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GV2PR04MB11739C05FD4C2D5A8B477B82D88A32@GV2PR04MB11739.eurprd04.prod.outlook.com>
X-Proofpoint-GUID: Rby0G4O6Iv5ZHJ-TjZZ4D6znPh8IG83l
X-Proofpoint-ORIG-GUID: Rby0G4O6Iv5ZHJ-TjZZ4D6znPh8IG83l
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDAyMiBTYWx0ZWRfX/2AzApZwm1Jq
 AA2lwsofQC1wQMp09qeH3X/Qw/1O3Df3OzOLoMT+05GvukCEWRacNgU8k4gHXdlEr8tUVydBAp1
 ab++TZ1DLZjq7mYLsBYXQ6yQ1dqO9d8=
X-Authority-Analysis: v=2.4 cv=QJlYgALL c=1 sm=1 tr=0 ts=6a87c5d4 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=8AirrxEcAAAA:8 a=AzQT1qjVLsAWKmEbjuUA:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDAyMiBTYWx0ZWRfX8QNQU8DH2XDp
 Xfpw5F1qu/TAgL8Tyx8LpOfVJIQhp55BEFjn9wZMlJgYDWoDtVQG9RYvrYeZ1PcvpTWv4B8QP2u
 rPFMdTCGVdH/1kLu/2d/SFqkeku1BG0XMS7LNlhStVNuI7wdNqk+WL9H3Lt2mgumWHUAqtKI1sI
 r72HGLHqFOQpakqykmVghL1ucNCWRgcAw8BYlfoQa9eN8ueKWf//AFJHUA1QIZI+Ab6Msh792EK
 T4bRhJqCPuAuuaI/xw7TH1WuxFGLczYLx1zeDTnCdWfBs7rI/zPj439BMjz8NyTLPMI7nwl+o/8
 o731IsbhQWtEFyev02DHA5siISQjlipQa6gxJc7xAFjRj9tbVrZrsaB0VsIaQSPtDWm/DgqkOT+
 eCx/1NClHVTJpqfY3MtpkSVo+8UuOPGwHkgqWuzBFaO2vepirTXy382xuVteO/u8WB7da5KXbCk
 EBPxMLxl3UoIz3Pejxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_01,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210022

On 26-08-21 01:52:37, Wei Fang wrote:
> 
> NXP Confidential

Which part is confidential ?

> > On Tue, Aug 18, 2026 at 11:33:41AM +0800, wei.fang@oss.nxp.com wrote:
> > > From: Wei Fang <wei.fang@nxp.com>
> > >
> > > The max_period bound in net_timer_enable_perout() was computed as:
> > >
> > >   max_period = (u64)NETC_TMR_DEFAULT_FIPER + integral_period;
> > >
> > > which exceeds U32_MAX when integral_period > 0 (e.g. 0x100000002 for
> > > the default 333333333 Hz clock). A period_ns that passes this check but
> > > exceeds U32_MAX is then silently truncated when stored into the u32
> > > struct netc_pp::period field.
> > >
> > > A truncated value of zero can reach netc_timer_set_perout_alarm(), where
> > > the local u32 period variable would also be 0, causing a divide-by-zero
> > > in roundup_u64(delta, period) whenever the stime < min_time branch is
> > > taken (which always happens for a start time of {0, 0}).
> > >
> > > Additionally, netc_timer_enable_periodic_pulse() and
> > > netc_timer_enable_fiper() both compute:
> > >
> > >   fiper = pp->period - integral_period;
> > >
> > > A zero pp->period results in an unsigned wraparound to 0xFFFFFFFD,
> > > mis-programming the FIPER hardware register.
> > >
> > > Fix all three issues by capping max_period at NETC_TMR_DEFAULT_FIPER
> > > (0xFFFFFFFF). This ensures that any period_ns passing the range check
> > > fits in a u32 without truncation, so the stored value is always valid
> > > and non-zero. The accepted range is reduced by integral_period ns
> > > (typically only a few nanoseconds), which is negligible in practice.
> > >
> > > Fixes: 671e266835b8 ("ptp: netc: add periodic pulse output support")
> > > Signed-off-by: Wei Fang <wei.fang@nxp.com>
> >
> > If so, then I think NETC_TMR_DEFAULT_FIPER can simply be used in
> > place of max_period.
> 
> Yes, I also considered this modification, but ultimately chose this lazy
> approach. Since you brought it up, I will improve it in the next version.
> Thanks. :)

Hopefully, not the lazy part. ;-)
