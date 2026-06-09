Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A595B21A
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 06:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780986783; cv=none; b=K5aRbOhM18d0E1VGCBrEWfTwZbkZ+K4Mg7VpOea7KuZzzZ/2dKZxNlPXed7Cw7zR+1jKq+2xAv4nInCbUjeuNfOuMsOVZ0WmKVfyisBD9ltm4XQAeck9Ysw68yGvG0pDNtb0xfpqFmf1I4cvqj3S5oJmhA0I7Ix0zxnYGbpK2g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780986783; c=relaxed/simple;
	bh=kl1fmsj8cGmZ4RfCQB2pJXucYwSMi1vzWwY9lJmfaMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XJieWcldtaaJ4s+yLyxzR2xPUZLbsXHLUHLZlcABWYV6ixjXJNXaIIHHvK0nnxNNSsFl4k03EnzrRQStyaii4hWPXx6umeRIsJVNMdBm6nzPXqH3FNqb4vo2+LTI+Jz/JYvmvvsTE659cM7Wj6lh+u9KRYkH9/4ldX8NuJJdT+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BExGUfqi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UpUD5j9H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BExGUfqi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UpUD5j9H"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6596G7oE1736424
	for <imx@lists.linux.dev>; Tue, 9 Jun 2026 06:33:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M+jE/Whj3i3oRJqpHpCb6TGC
	x3wC4S9R9qh5+UO2Lzo=; b=BExGUfqiz9OhmgpdNx42og25ntWqoKIRs8q5qc7G
	O94UCRivT/rkqKSrw6Ai25Po2dLAhEwORSwO+zmtJcypFwJdt7hniCavd/4NVU7u
	6lALESpaQ9hq2M/cDW6/KyjcDsagJRzf8guD1DiEwG1YlT7yB/VNmMX1IpSHvnu6
	GUZq2n0dCDrOEx0jJU5MnrRfjTt4Jw2uebG9F41tB++mI201eRHLo9VqIUApHTSc
	Uqifw8+t3bwM8XfAUzKbkSE3oQUSFVoOuTvP3tcPVfaM7knSYi7vVDHDWzOO1Ioh
	EGCqRT7TIkmO/yjdqcNHmmXhDXUfBVsnzO8BrvgZ0sVLmA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdds828e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 09 Jun 2026 06:33:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51776d4355cso148387091cf.0
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 23:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780986780; x=1781591580; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M+jE/Whj3i3oRJqpHpCb6TGCx3wC4S9R9qh5+UO2Lzo=;
        b=UpUD5j9HjIPfMNhGiIAA+CnXSDoOlaIR2zueEGQIfd9JCo7qfPcZoAcTPzxQRxKtN2
         Sha6Ir+YBovdEU4W7CzWaX+KJh1oHeDh42gOGPgO6+M9Tw6y5GQl8MYNxDYrjy3xwonE
         T9XVeEzs1x6ZchZ2kSuwjm5tDoYD+2f5DcvatjQLBZMV3pdNyjI7Pp5tOhWFytVNEVsT
         NlSSLAdjC3jO59kRhPvZXj3/H2OjaEDMUxlfn38R21+xR7YE4BNlSISEwVI1NnB9nZcw
         SchY7Q1WGcdLHCORaSe6l27FlJnyso/Dp4PPuB0GVpDbSLV9FSX22Z6B7hkB/Va2TJLK
         JKmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780986780; x=1781591580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+jE/Whj3i3oRJqpHpCb6TGCx3wC4S9R9qh5+UO2Lzo=;
        b=rUv28u/FHiqVB7RtkMGjs9P2H+UpHkf73Z9et0Uh7/AsQ7QrynDy8lN59lY5nczxFG
         GETt61GAHR+8dqyzYxNZ1y7B3zcmG9VCf40fjTNE9wOzkF1iHq5AUeNSkz7gmYAlaBfG
         uc3/u+IC9a8gcrin6ClZk7z84glqb6+3FCQzyyyfSoxVGSsvAkXPTLfaIyJLXIsvyQMV
         Zgjd43iw56Z8ZLj7wiWl+SmxaOfqnhy6nzi7P22IssPQO7U/ozdcGCHkjPEImAPGksap
         mfpJTK37hZSCXW42xPc0aPHxRum/1/F2FLe4VvO75vtCuae6Cu3SkZz+a5+enHzRGWLr
         h/lw==
X-Forwarded-Encrypted: i=1; AFNElJ+cdz6zT3wwxVuxZXJsjZdw1IYQtF+g1Nch3xO72/jhkT+iopawrw5nk2gTiUGthScHpRc=@lists.linux.dev
X-Gm-Message-State: AOJu0YykYFQs77uXX6x+MbPeB7stGoOHEbh/qaGbV+8Ky8K9mi4x5ItD
	xR+v+pNkQWkr6nXLEi0vsTOxD1sCw+6ANXZdS5iAim/uowZPYdSeAkcXPYKSqnQwmWbSAc+Iryn
	gR5anPJ5vFDEdnqiGHyORYSzJ5WP5SL/plJgC6vVqKD4NL2JMuL2FYXU=
X-Gm-Gg: Acq92OHAUJFgX2OxLkfLwFzMtkm0/DjPilQmyJ29EfmjlCyG4U7ugzrLJ1F4e4MBzfD
	2yOyh4/LZq6dFJLJAxd00Aav+hFC9+Tt1hc6/QqwKkXBw0Du6f1/S42t03Ga95/wtTYofikr3zS
	J8Hz7sa5bGDKU1YwSppgeADkqsUxXfldMMigm2X4uJAQ07AIQAS1VNMDdM7XcZcEt/xJfWTQyCi
	gUaT3GX6rK6dppZL9SaqaDJ8YxmvH4dm4YNAfRyj8Zi+pjW6XAnzo0bZ6Ix6DkhrfPYJJXJY+z7
	ksN49/KNR4l3NnN9Obp9qUNdHrpTDgAW4oT6pDyNAZwDdJyZ0c8KRaM8esEVQw3AAKjdcFNf5MX
	uuaupvXW38UlPOy0wreLE4hLXbs+gTaIKxv3IarfAFMo=
X-Received: by 2002:ac8:5a15:0:b0:517:74f2:e578 with SMTP id d75a77b69052e-517986c4658mr178930411cf.12.1780986779573;
        Mon, 08 Jun 2026 23:32:59 -0700 (PDT)
X-Received: by 2002:ac8:5a15:0:b0:517:74f2:e578 with SMTP id d75a77b69052e-517986c4658mr178930171cf.12.1780986779034;
        Mon, 08 Jun 2026 23:32:59 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f34413csm58306473f8f.21.2026.06.08.23.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 23:32:58 -0700 (PDT)
Date: Tue, 9 Jun 2026 09:32:56 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jacky Bai <ping.bai@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] clk: imx: Add audio PLL debugfs for K-divider control
Message-ID: <5keeetqnhquzvwtpll6gb2sikg6ic2qziuxkpgqg6qzi6q525x@u2taew4tbtbp>
References: <20260604-imx8m_pll_debugfs-v3-1-4e331ebc85d7@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-imx8m_pll_debugfs-v3-1-4e331ebc85d7@nxp.com>
X-Proofpoint-ORIG-GUID: dOJtS71xOJsX2edFo9jvsAFG51R-5Ewd
X-Authority-Analysis: v=2.4 cv=EI42FVZC c=1 sm=1 tr=0 ts=6a27b39c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=BSZ3G9h0/EKbgBlQZBbU/w==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=zgkfINwa37qCbUsG4WUA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: dOJtS71xOJsX2edFo9jvsAFG51R-5Ewd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA1OSBTYWx0ZWRfX1J8DvzFsYi50
 knIghDAzI6MmGYZ5QH+ihykFG5Fl4q1O0kxI7bUmU2blDFSreRnSfEiGDc3CCENv5AMHkQTfAn+
 NqVFWeKFZWHnQQsx+VrdJJXuUEIVwFs0WpM+uXAymwDOngltFPf3jFaD6j2kqjldxm0Pgg7A6+I
 vJU46NvwJPw73oeemtUQyu4vdAA7ng+lnBYghT4R8FnByoDPQQJalfjEbR2Lttv23A//8sNjtFg
 zP88K+2UZ1KsJpFLkn/ESPId489U6AWJRGehpDwLOL8BIIBBKCnHPVnOXEdZmfoIpI2Waskva4d
 T2Lv5po8Tc4O5iZzgpeVsUvlCAgR9boIVE9A6r5EJ4fLSE+q7WHH5x9iEYQ3DCrCofa7DQgnCBe
 Hjy95JzIo/WCRHWnPa1TBTXisEiRfdfFQfrzEE7nlsptn/7A0/tAbYeCW9pCf7cb5TEC2J7Gkni
 fgx8xfflgWYv0yxg9pQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090059

On 26-06-04 21:48:01, Jacky Bai wrote:
> Add debugfs support for runtime tuning of the audio PLL K divider,
> which enables fine-grained frequency adjustments for audio PLL.
> This is used for:
>   - Audio clock calibration and testing
>   - Debugging audio synchronization issues
> 
> Two debug interfaces are exported to userspace:
>   - delta_k: It is used to adjust the K divider in PLL based on small
>     steps
>   - pll_parameter: It is used for get PLL's current M-divider,
>     P-divider, S-divider & K-divider setting in PLL register
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
