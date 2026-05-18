Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC673C76A0
	for <imx@lists.linux.dev>; Mon, 18 May 2026 07:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779087732; cv=none; b=b/iJre+zSTznRsGibQu9G3wwRmXvPcZfWQagE1APXjT75+9HovFRzFPjW41Ja2LhP2Z5zYq39ALwvcfzEm1thFbj3GY32E9eSi0WZXGBoGWSc6MKsuT9DONSJv1ocMqrRkNWFUgHp7zoXKfPRgCpFy1zuBLBpDTGlIwGC6gJExE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779087732; c=relaxed/simple;
	bh=xA2NLkJfOpPJnKy0k27hPMiqGPoQkuv60l9EZdRnReA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VVojxH7HENhMuyklAb087N8n3Eik2PENHQopN8dISGr1bElirfq4d81vXYmUv3EAkBEe4Vo5cBukvJFxPZmots1vMMYUyKLcYzxQbCuF4MVzUNNc8JFgx4Z63Q8qU7XbVqxTiC6sTciGGewm4wRMC6ptK4JpKSRTk2dyTJHpmBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U5rlg/xe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TaIsN1ez; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U5rlg/xe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TaIsN1ez"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I20uRn2303883
	for <imx@lists.linux.dev>; Mon, 18 May 2026 07:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8d252bNXxfK7aWnUfmLYfK0M
	Nvm91wjWgg9oavzJ3QE=; b=U5rlg/xeJ12UN5reNjt6RouHjoASyq3cQd4O3j9Z
	Rc7NuUs6N5saLAwrcf0uzV1B6cheRN4kv1w3nVEyADNyD+bwsz4cdndwXCGaYTZa
	K0bxsV4vs+5KzijwehqCk6bI+rNgcvfd0Zaf0TX0zCfAsJaFOpz+CLCH/qJD8UhE
	s8kGs7qFTkWqhe33Q9m1jayMs7W66JeOO0EeerWAQQRy4Z8MOWqMdUOWtgO4/d5v
	tNDXnRPW3ITTN3DBVXIZakWe3EQBk9fRrabQTw1oiPBepl77Iczvd89p4TtApw/b
	1TVCIMEckGzMjfNJXpQn4SV35Km0aDwtDkmki/AVZPUYwg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvqw44s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 18 May 2026 07:02:09 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-57536338b89so917615e0c.3
        for <imx@lists.linux.dev>; Mon, 18 May 2026 00:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779087729; x=1779692529; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8d252bNXxfK7aWnUfmLYfK0MNvm91wjWgg9oavzJ3QE=;
        b=TaIsN1ezeSVvLxL7FoPWz0MlOnf/jWiByXTz4t47Ia0Xi30PcOX1DnokbIudaQAHHm
         iqtdmAJsDxO7AemdCw/BMb02ajWWoXeOA5GOUcPrCj1ltXRgQSFdsURE1iVKoEQg529/
         a8lwRkGRvPuq5mEIDqw0rI3lRPQABKMPcE4jgNJfKx+5aEwVhkGBlyq90CnZ7CMYSn6V
         nupNOvJ1Z9mcwO6BfPF1/BBNnhBX707lF06kiyCp6jkIQM1mOAjiQfHXXx5TMuEc8ZqP
         OkZ+fELpdrxAw3TwTJfuTpxd2WmDjJ2uFTlBYDQwVRGTWUEfCOpjZW3WypZ3hXwKbxpY
         8mRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779087729; x=1779692529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8d252bNXxfK7aWnUfmLYfK0MNvm91wjWgg9oavzJ3QE=;
        b=CepI3dStJj6rxERfoV7Moak/p/QV3vumTIgSCinELZ6TVAt5WJjnLFZ+Tz8OoJkQ0x
         cn/+s/U23yhInbjCW7X2pA6XgFQdJOg0Bg6DyPE728JCVxam5iL7vKB13/K4K5xeQ7Kr
         X1h3PZeG7ZjO0HOMn79/Z4S6Y89xlkfF6HxE5d04oTkYqLKYOmlS5TmnBw/FXbwFOk85
         AOy1CnVz95kB54Au1p2XocHLDpWeYkdyvZ+giT3bmZ/zLbckZA4y07H8KpO+YKhtQ81+
         JVSmmZlfj/VCWAFxJ0A5oOxku/1jL354bQZxuYBf/luO+ZwbUDKGvcdfJeQfBMXptDJv
         Hbqw==
X-Forwarded-Encrypted: i=1; AFNElJ8HlTGRTNBOWnV+OBMMry8ZB+fU2wcL0fq1nNXSyUuMx/sch3y8DBpUYvquItCeFm7rt4I=@lists.linux.dev
X-Gm-Message-State: AOJu0YycGRec88L4zckcRrE+6sY62BPUOwZkuny8wFGuQ45vOdD07Xf4
	xquvre/jiFEtz4ixzu3GBbeNjPcsPbm0zBjn5WelrJyrlUDGab7OvKagNtY089CX4TdWUW7yT8G
	/CnRiY0+hbzIIe1GPrbwQzvNRUNmN3an75+Na20f7pbmtCTKy2GRCJ4E=
X-Gm-Gg: Acq92OHOdl9zevLg/9Jfrm88Cs7LsNn6XBI9vTD2UAI7Hnh9/xjk9qIcUE/9nC7r/Pa
	Q8Viwfm2qNjRy9AI5fXrqruQYJoDC+ehgEGiyXRW8z7qJpBWbkV3Ec//yj4XoBycEef1+KVJgZH
	ZY4FbFmEnm2N2PqYsHvCkcJZ40BYu/ftMdKslKR5fDtBlvgovQEUpREBl/XJ9F0XQrMkicH6+w+
	q50EJ14oAhT+dhv/Olr6ZUPEPyDKbjqFahF1u/EAZahTb98zHoFBFDY+ZJtWhersW5NYb4e4sx3
	BVuBeResHC+EM5GsX8qVfbxj83fMzEalfpXHJKvzuk1tvGYIqQT0u/gEWWdyxCwl/O5siP9lQh1
	eW/F9Yc4pOiF9LRIpvZ3z5A6C+GleYEEIL78=
X-Received: by 2002:a05:6122:4006:b0:56f:b2df:1791 with SMTP id 71dfb90a1353d-5760c043936mr6788671e0c.9.1779087728901;
        Mon, 18 May 2026 00:02:08 -0700 (PDT)
X-Received: by 2002:a05:6122:4006:b0:56f:b2df:1791 with SMTP id 71dfb90a1353d-5760c043936mr6788579e0c.9.1779087727532;
        Mon, 18 May 2026 00:02:07 -0700 (PDT)
Received: from oss.qualcomm.com ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe78aadsm73144795e9.29.2026.05.18.00.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 00:02:06 -0700 (PDT)
Date: Mon, 18 May 2026 10:02:04 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Paul Geurts <paul.geurts@prodrive-technologies.com>
Cc: Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>,
        Saravana Kannan <saravanak@google.com>,
        "abelvesa@kernel.org" <abelvesa@kernel.org>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "Frank.Li@nxp.com" <Frank.Li@nxp.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: clk-imx8mm: Initialize clocks in arch_initcall
Message-ID: <ks5m7sfdhbtu3njyx7bj7drxng7qnncw4rbg7uhou5nddiubbh@b5e6k3pwdyox>
References: <9f36af74-ef1a-4777-a1c3-ff13b68c2221@pengutronix.de>
 <20260409091643.3787112-1-paul.geurts@prodrive-technologies.com>
 <95e718b9-c281-4336-9c1e-3bf8aff68457@pengutronix.de>
 <GVXPR02MB109689E26A9BAE94C2BAA34FDBD2C2@GVXPR02MB10968.eurprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GVXPR02MB109689E26A9BAE94C2BAA34FDBD2C2@GVXPR02MB10968.eurprd02.prod.outlook.com>
X-Proofpoint-GUID: 64fx37Mc4FKKPVSGDkBh9so31ii4lMvR
X-Proofpoint-ORIG-GUID: 64fx37Mc4FKKPVSGDkBh9so31ii4lMvR
X-Authority-Analysis: v=2.4 cv=LKJWhpW9 c=1 sm=1 tr=0 ts=6a0ab971 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=eaySs-uAEo-cwj1-tAcA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA2NiBTYWx0ZWRfX0gEpCRYhAQmU
 PV5XehvSZxOtoaAiInxe0R+sd2ti3/zpjcy3vM2T8eOp0Noca5UOHjH/nguMmFNy1hZoIWWjKZU
 rT1HG4CGs3lrBIAp9J0tJbb64X46UFBPkCyzZfu8Rvojvj+lPuJDQTRzRJNY9ctNx17gw10ApMd
 MeAdHs1HL1rsI1x6xidDx2GlZXdPiofVF5QxXveWJRbY0Cf6e7tTigwYgNfCmQKlwvlxj5sNK1L
 ZezPNlvc3hrVA8cAcTnk5sWwtb9FbiFg0D47IIaGHUlG1EwhEF/M6bCumakwN27S/WaDFxHWwUk
 oeNzy3MflcoqD5kkk7gBVFCdQTajtJF8pbnuFX9CMmSHqVnafN8Kmn30T0kxigWiB+mFhs294hG
 cPfDRZPTbQWdvHRysQBEVajKY1VdD6Sgruu9gf6/0TUpOxqDEX7z5wNORGxgHoACA2sl2gW/f0A
 CUhLM73lv+KsKEz/F2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180066

On 26-04-21 12:00:43, Paul Geurts wrote:
> > Hello Paul,
> > 
> > Cc += Saravana
> > 
> > On 4/9/26 11:16 AM, Paul Geurts wrote:
> >>> Hello Paul,
> >>>
> >>> On 4/8/26 12:13 PM, Paul Geurts wrote:
> >>>> The i.MX8MM clock driver is implemented as module_platform_driver();,
> >>>> which makes it initialize in device_initcall(). This means that all
> >>>> drivers referencing the clock driver nodes in the device tree are
> >>>> deferred by fw_devlink, which are most of the i.MX8M platform drivers.
> >>>>
> >>>> Explicitly initialize the clock driver in arch_initcall(), to make sure
> >>>> the clock driver is ready when the rest of the drivers are probed.
> >>>>
> >>>> Fixes: af7e7ee0e428 ("clk: imx8mm: Switch to platform driver")
> >>>
> >>> Your commit message doesn't explain why this was a problem for you.
> >>> Does it delay your boot? What makes this patch a fix?
> >>
> >> Yes I could update that in the commit description. The problem is that because
> >> of this, _all_ hardware is initialized in late_initcall, as that is where
> >> deferred probes are handled.
> > 
> > There's no one initcall order that will make drivers across all systems
> > equally happy. That's why there are probe deferrals in the first place.
> 
> I understand. But this order makes all i.MX systems equally unhappy :-P.
> 
> > 
> >> For embedded devices, some sign of life is
> >> expected by most people during boot. Especially when an initrd needs to be
> >> unpacked, this sign of life is going to take a very long time.
> > 
> > Ok, so the problem is that the probes happen too late. Does the total
> > boot time take considerably longer or are you just unhappy with the
> > ordering?
> 
> Both. It takes longer, and interfaces I would expect to be live "early" are very late.
> 
> > 
> >> Some display
> >> controllers don't even get enough time to show the boot logo because of this.
> >> I don't think the idea behind the initcall levels is that _everything_ is
> >> initialized in late.
> > 
> > I suspect we could improve the situation with "post-init-providers"
> > hints, but I haven't used it myself so far.
> > Maybe Saravana could give some advice once the problem is better understood?
> 
> I could look into this, thanks!
> 
> > 
> >>> What happens if you build the driver as module with your changes applied?
> >>
> >> On module insertion, there is no initcall level, and initialization is
> >> performed on insertion (AFAIK). Fact is that the system would probably
> >> not boot when this is built as a module, as there are no peripheral clocks
> >> without it.
> > 
> > Ok, then this is patch is not acceptable. What's buildable as module
> > should work as module. I don't personally build it as module either, but
> > removing the possibility will break users relying on it for Android GKI,
> > I presume.
> 
> This patch doesn't change anything about whether the driver is usable as
> a module. I think the original driver is already not useable as a module,
> independent of this patch.

What? Why is it not usable as a module?
