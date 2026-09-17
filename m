Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BEF4E0206
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 15:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658973; cv=none; b=LUzX5y5/FEjxgqabFvO3ZmZMImuk0/C9TP93/i2Z5N2hDiwvH6/VGC9Xr/fwCOHAr/nVkB1VmxIvBFrmwiy7JeDyiNSXcBo7WnrFh7KVRuzwBfmRJYQ3Fuyhx/8cDV6j0F6mtvwSWrxuvCDWQ44Lo3pWNqfjZrLtTK7PnS97z6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658973; c=relaxed/simple;
	bh=TlMRqQ6L0+W+LjZ003OtT0C1xwK4kdjOBRFHg4mzq5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MVv6ESZAarkTop4QSWd8zyCXtLaF/iqXVjFRsOq7o3RyDwRNYGkbKk3700qQcoGthYV+povGU36aUTu1eIPP0OUxcfQ3MS9jevmJialYkE0tHqVykQWONI4RCS8LIU2ADSSza4WjUWMMc5I8M2Itx3AhF7LguxqLT14RKaPI6m4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=okrG+hUE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PyLPuEZe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="okrG+hUE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PyLPuEZe"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HFOXiL782584
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 15:29:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Hk36GFpcKUAtTar/b083caQq
	YINIKpMqKrsbZbYUlBk=; b=okrG+hUEVUELGSxU2Q7Gy0F0NIDgLQdkasDpPTPv
	/5PrsfZv/no8tWk5cA81d56Ckf4IbRnjg+JBwaoOh3O+F6y/mqo5KfTIy/kNx/WN
	nUPfkg/cYuaZCQdbwrEdX/6Rc9/stSWbyrGgRC1ISGIvVgYmNlMLdWLUrkSYDZ3j
	eucRk4qbpco0a4yP9IYtDVMfcV9RpS35k8kDsTsnjdcdUGQHp9LU0Zn0KQifjvbj
	gS1zx9+IKGpbZY4H07Q3qdKaO/nsYdQz7pOIw04TZSv/Y4MM1jBgrXet/aBs14wC
	rgKjZL7TLostWY87EuGbPRj8/AV/9oIlshc3blyAkcE9Vw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grjttr0s5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 15:29:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93918756165so178198985a.0
        for <imx@lists.linux.dev>; Thu, 17 Sep 2026 08:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789658959; x=1790263759; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hk36GFpcKUAtTar/b083caQqYINIKpMqKrsbZbYUlBk=;
        b=PyLPuEZe4l4ePnC0as8l8a+bCS7qLdQckiQMxcvN4XiJIwMhOl+fGgZ16JunJWgCM0
         WS2lHJuri52sHg2sWmn15Sz09AIki6pRVqWgj2y/X9SFsHWgBiO8AXbhFL3ruwYTNYfo
         6eFGXDHr8azPzEI/3BClCmUMmXq/7+p3+qzGe1IoGNnZn4zh0/sXMnq0+Nw9dH/3TsCR
         I4kG0O7mgXfqUY1QeY3FPKkW0X6LC6Dr0fp9N2+j/9iowa9ar0Kttpjf9EBVyOyMmRmv
         +qVZnmT4ZhuT8JThnHi9DeHxcUym5Ir/OdpobZvHiyM5QHNsGgMLcy4EuVwo+vyzO7FQ
         M0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658959; x=1790263759;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hk36GFpcKUAtTar/b083caQqYINIKpMqKrsbZbYUlBk=;
        b=yoEEDF4qpp7hDBXIren+Og5L+V8WDPiPNhAju/n2pJfx8HvqhGyom47JGTKTrLY9xb
         cKlWUQQVs1K2Zf79n4I/IhQQXqKXafW2fGhKLsweedbXA0EXZkmy6KyHxI6CupQuFjTb
         RJqRVSMAZNM1mSioAQzBT/xJdhiMcgZ6Mo6e2ndAQbTbEaPej3JfndFykL+l67dthIQ4
         i75EXlBuM39tW2oJ8POykISl+HvYGu//AM6BTnEYG/h8jJ44wa5HXdHtjgaFYz2FPbVk
         bPcThgzqvCzukX/V7dUd4c4qH1tAiUheqqI4VzDz+4q+OuyxtKmE5BjUX8D3BN6NlRlQ
         yeEg==
X-Forwarded-Encrypted: i=1; AKwUvBzpUSlEp4MD1DKTYJ+vcF9kOwbdgOrGr97KjFIQe2A5lngrOKhK3tY1iqAr1bM+MyZX6rg=@lists.linux.dev
X-Gm-Message-State: AFuF++nyG7MZM9YRSYBVTvcWqZGTcQ299W6MsWRNtDZJK1fwFz1zqDBw
	9JQ6SPbneOB+wH405etPgOUjoXVmbGf3oAipxuXFc+q5oP5Ilbt4zXEXIdZzEuMzV7FG6APYoSA
	plSaKHnJ0jv6j0kqj6amxIot4Q7ocIHsPZtyI2rAbFPQqYK3/UVfb2Tw=
X-Gm-Gg: AYBFou0RliBnn00Rr+9DmUaJfIqnLBURHIm6gwE81K8ryBOP1Fg/fGAsjDxSo2PpB5l
	LSh1faB1CuudQ6C6vSYSM4Mkqng5ra5OrNKt23TpdreF+pGdH5d8LLiVS4fUpegWZs3dlGmMctT
	CmF+FdGJWkk1i672X9rfHeMgmzj8NOG7PPiAkRGLK5S1JiGQX67DJYUSayUB6rXncEfqdIzdqMw
	amhmiWirR/u2OQ1k8OWoqwZc/y7wGe4zEu0RmbNnUfGp1PUm8HX7y5NdQkl7byGXKaFRSDkiBkp
	Ygy/2ze7e4IrnIjGDG0o9Ur+2fpghkP0nolAQ2iEWfIHacxY4m1Dui7sZ2Ic7MYrC1P2mODqa+e
	cIxOzMW07S56u+g==
X-Received: by 2002:a05:620a:4592:b0:939:31b5:4e08 with SMTP id af79cd13be357-93bb7267e92mr1277598885a.0.1789658958633;
        Thu, 17 Sep 2026 08:29:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4592:b0:939:31b5:4e08 with SMTP id af79cd13be357-93bb7267e92mr1277595185a.0.1789658958112;
        Thu, 17 Sep 2026 08:29:18 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbefe1791sm68837795e9.1.2026.09.17.08.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:29:17 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:29:14 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Subject: Re: [PATCH v8 4/5] arm64: dts: qcom:
 shikra-cqm-cqs-evk-imx577-camera: Add DT overlay for Shikra
Message-ID: <z4usj632ovj2cadfgp2zvwue6vuvqhifzgjb2uvfikitxksdvk@4k7xnyojsa7e>
References: <20260917-shikra-camss-review-v8-0-9b9596221cfa@oss.qualcomm.com>
 <20260917-shikra-camss-review-v8-4-9b9596221cfa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-shikra-camss-review-v8-4-9b9596221cfa@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIyMCBTYWx0ZWRfX0Y8kaP98OS5m
 5sTUikVzOhuy85zzf17YrEHGqYRxtyEQvoPhV9pr6EEOtnjzJWkf3OZOLkpIXbtAA3nSkP0Izk7
 uVGc/mwrElI9/EfJCOadz7UNx7jIE9oFMh49j3wTvFRONRs6tCUdwcHb3EAIav3mu3haEmup01Y
 ChBPene1CyZT7hK3a5CxafsOhE5nJ/eeDpWcR1EGaPPNOapSbO1eTzPzY/pNquF/wb/t5JIx3ZE
 yDo7cCuKYFf3HZvpBOvfHBkauT2BMhl9y+uLNzAxLWf+b+BPAzTzxfy0r4PINM1Ky0Tclrdv2wS
 mi6S7qbJMFdGC5LZzwBcYxsAgTzPy2wOFJKUIwhEQi4R6Z528hHBbpIsOUIaE8Yr9ntjdpa3aVP
 VWLMZrjUvK21pGLFBL7zE/YH6cviRWEJLc3wBjYhbDbt6lmEN8YtZ8aK1GYWjx90h6TRNm7VAw/
 3ORYj+sLSlaA/feA7wQ==
X-Proofpoint-ORIG-GUID: 6I5vXgDCeE2WZvFLX5rDntzfh1ogItTC
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIyMCBTYWx0ZWRfX9mK8xAeHaA1P
 IldMev/jMNXYDlSHPdjUtNsS78rb6/jYnqjV5jt+bOYuy5YM+VjlOkyIjc5RwHIAEbYql9DeR5f
 7ujbOHbRuuBSbeTwDDx46SxlcKTpaKg=
X-Authority-Analysis: v=2.4 cv=IP2XmQvG c=1 sm=1 tr=0 ts=6aac074f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=XE-wypd_VeY0GsksmEIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 6I5vXgDCeE2WZvFLX5rDntzfh1ogItTC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170220

On 26-09-17 17:11:03, Nihal Kumar Gupta wrote:
> Shikra CQM and CQS are retail variants sharing the same PM4125 PMIC
> and identical camera supply rails. The only difference between them
> is the integrated modem on CQM, which does not affect camera hardware.
> 
> Add a shared overlay for optional IMX577 integration via CSIPHY1,
> used by both CQM and CQS EVK boards.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
