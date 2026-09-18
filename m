Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD484F3EA3
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 10:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726588; cv=none; b=EJ11Mp5B2gz2VCzjfx2aAtpg8Tab3+/Y95kIRiKbUqjzgz1Z9dcL+u5JIfUlH9JcPej14YpwcjQq2XAa7YM8KglU38bpJ6lYhEixdUgR9yILyoW5MuMSXeI9NT4AXvHWB6t/OMfklNkIZyC3WDqr4ZJuAOGE8v/vQyG2Mzbnf10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726588; c=relaxed/simple;
	bh=GKSirKHvfn9lZan03ZeAgUC1tA3Nnr12Pp3mvCfeg8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kDhWkm7TWMM74SjThUzJVZHFaCZ1KJOzMQrfcQhjWMEArCDiOrdZ9JC2LZkvnPB3zeD91uD7SY4BICPRo8FD7v8fWCGhky9rqobpuSuEq6LJ3MAUyXx5OlFVTEWi4Z3MOvguceW8RncCgqs94fsbP4jIKLtj9pddcpble6ZTVBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m62CTU1Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cth6II5y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m62CTU1Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cth6II5y"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9daDJ385312
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 10:16:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lkWvd6wXs7ggjF+yLAJdymgWMfkLNdqnHiJr+Shk/Qk=; b=m62CTU1YnGapAeDc
	+qy7Soc6UKFvvtv+bZtezgCUvRpCy7x9WoLiUAuzSwXaLcsIs2vpyBQiqiD1qxlg
	4gu7HD2oaZnE2c7oBLTBTO+ZWNzFqctmWuwsEiFldYgdTJI1Rc94jm1zTORMfwdN
	Enz3kgmWZ7vAm8RKEXb5U1ZAo6GvmEqCjfSiyLzXlWYp9N82JQ0iDG1ZmXKQAU1S
	k92qUVLmxi8kWdJo5RtKARbqTr9LqLWILs3fYPDOjPlkn2jQ4D/Y3XpEGvCNjPOp
	IX43ijDUmFzVlZqdhl1kH0lIZtaqNdTTlzNNRRWDhO1K3MV6JGS43+G8Zm/8vCwc
	aiiiwQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grwxrsdux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 10:16:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90cdc69a7b5so13333286d6.2
        for <imx@lists.linux.dev>; Fri, 18 Sep 2026 03:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789726579; x=1790331379; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lkWvd6wXs7ggjF+yLAJdymgWMfkLNdqnHiJr+Shk/Qk=;
        b=cth6II5yk/2ZVrcPqfpZhyV9wAK8vhSFc8O2Je1t0tljtfkF+QQoBRLLI4y5Kn01Fm
         Ipn8g/FufFLUJ+8d6iOO9sJLlmDolCdwLW7KzypJ8TGC7EsVFdaJsTUlZ38nIB57CQPY
         /VljeyFyayFHvUEz714OJ/ym28T1s/G65jZ6nO+MLgjk4VpSrdFeQ4cXwOw1HD9bv3GG
         IkFjtK/ZplR2J9SpmsGNWelCDjq4bzrZ52Z66ZvIRUzxac/dNlypAr8Ny2cO2V06SufH
         muvzfhmK/lvIIW1HaK9BdZbG2nCLESW81GAw9cX95UKa5GnHvcURofI6dDvPRg7SJikL
         3yKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789726579; x=1790331379;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lkWvd6wXs7ggjF+yLAJdymgWMfkLNdqnHiJr+Shk/Qk=;
        b=tnl83oNCN/nU1JCk1ZwxG82/7lPHrER/yxPwNgoK5uq95a/gmWCJOqin3F4j2I2lLY
         CtgeH1Bt5flblDMGkhnbrJuj1OIP7/k4ANgTvBN8eSMA8aPfNK8W9mFvrv4TpLcPkdhz
         XkH15lU0zzzyOK9MmmVFOIxTuuhkn8w4M10g5HAhC1puliRKD+aIY3yb7w03N7UCwSXg
         7v5LheHykTIoX67H73Q7B7ofg9dv0ZrxDB8TjvtnXWyQGrldyACrko2nKtLNmMQ0vqsC
         4MkxbzEItb6RKvaUckTvX1DUvZDm+4BdIuS4KLiG84icQyl37nyOI2TnTdTDho3xjXpW
         B9HA==
X-Forwarded-Encrypted: i=1; AKwUvBzxO7LyHTQ4P5q5K7IWGLx7SSQ5OnKASR6fyRl1pj7x45h4fsl/IcpcIp5NFWvb+BhhcRk=@lists.linux.dev
X-Gm-Message-State: AFuF++nbIxwnCiDH0lxXcf61l/OMZHFQFUCgu8DK9ReZe3Eh+dso85HP
	KSuwyuRPqjVGRm0ddzfNrcGDYShdNXtj3NGtTByPDwr0R8ikSVr0BauLt5snOU/m4tLe5AXCyky
	ci+sHb9rwhR4tldAbUyVlhmBaqgAAr0nAjawJswKV59V35A5gh4wejMI=
X-Gm-Gg: AYBFou3x+CER+kbTg5FfXExMTKxYr/9onlNWCCaEUWNH3N08R4Wk6gXSLiFQXBFFcJx
	AYN4SeC+CP26fhu2LzPSbkfMoVoXUDO+RZBPvyexUQLiaT2yppvCTbKWA26lHuvbt3wZdLDkiQb
	lp1xKQY0gtKRQ+kJsxZ/1Q6X2fwIvhptjvXRq2Uwi4zzSeQg3HxH9nC2dyZq41r/iLyHMXSaeZT
	papA4cfqlpMM97vAjDZJqa1DmasdAmWKrXJkrdY9Cg2VN3WpnUTfJsnK7Jh+SLP8H3rJvcDmpnw
	Psbc5nn41av6yaevKgVDmpUKdA7XVC2y6sc8xKXYeOJeO0AZcFvojZmQ47gG7hKj+nXiqSOiVzS
	hz5DxC8wc9ISpZlFk8Lai0v+spkLmbLGF1k17VA/1OXkVnzjIP7preD3bHylckvg=
X-Received: by 2002:a05:620a:2b96:b0:930:f337:ebeb with SMTP id af79cd13be357-93bdc6d5ad6mr217943785a.12.1789726578888;
        Fri, 18 Sep 2026 03:16:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2b96:b0:930:f337:ebeb with SMTP id af79cd13be357-93bdc6d5ad6mr217940385a.12.1789726578407;
        Fri, 18 Sep 2026 03:16:18 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:82ae:cd75:d970:e66f? ([2a05:6e02:1041:c10:82ae:cd75:d970:e66f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd17051fsm147325645e9.0.2026.09.18.03.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:16:17 -0700 (PDT)
Message-ID: <dcf28454-a583-4f6b-a11e-483d63be3bae@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:16:16 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/imx9: Constify struct
 thermal_zone_device_ops
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
References: <5cce9ea713edcf2aa3c0efd5d31e9d9fd9f40a88.1786220585.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <5cce9ea713edcf2aa3c0efd5d31e9d9fd9f40a88.1786220585.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EMWTQFZC c=1 sm=1 tr=0 ts=6aad0f74 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=_H6WjYdI7YG0SsD1Ov0A:9
 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MiBTYWx0ZWRfX2uXDWKcDGv+7
 ToXOMYNpkOvvnEs+mFT+QiJAXlIfWEypvXBKfagiS5Y7n7zMf811h3fUfX2HLAdBFlUoWhOKuDD
 TtBsScEzDXsX4WbsWb2tZFYVtOkFv2v3AIEK9zRKGFXEJf0C4kj55syl0TNc3QOmY78RzJYfjnX
 fZKeId1NhyeYMxA3uVpiWgkKIWQzgGbbtaAkT/j56oe2UQnwzX3NlHobWhknqRLibMEodrHOEaj
 fENRKLPTneHu6S07dXdapKhi1pvvdcOStlrhkHWrS28hV6l0XkzA16VH+uZkpMFsxEeABcWUPdy
 GSVs3AUJOW9Ot3ad4rLigbv0TBAxfTCMTq4kaRkoqmXhw5N3olGNpcYd4XltCKHgSofx8uUq9B/
 9FHzAE7dRFgdEnjlM2NKFF9rr5RELv4qokU+UWSEh3apoDpnMTarNm8I0bWXijuANtuWjQdIsQZ
 Hl3tXAqKHtjlcK73MfQ==
X-Proofpoint-GUID: 5iTw4CqUjeFoVAx9vKWgUu-9Vpmb6-vJ
X-Proofpoint-ORIG-GUID: 5iTw4CqUjeFoVAx9vKWgUu-9Vpmb6-vJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MiBTYWx0ZWRfX5fEPAS0wfCMF
 1j9notxZrDDMNX1RSAReo3IXx0Uhgawi1F/IIVNgSXJK0GEWLRYKEv6Px3eYs6H14uyT7FkQHv5
 qKzNlqnaW50fYc0HLkwKLB1DhUVCjlY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 spamscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180142

On 8/8/26 22:23, Christophe JAILLET wrote:
> 'struct thermal_zone_device_ops' is not modified in this driver.
> 
> Constifying this structure moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> On a x86_64, with allmodconfig:
> Before:
> ======
>     text	   data	    bss	    dec	    hex	filename
>     8567	   2144	      0	  10711	   29d7	drivers/thermal/imx91_thermal.o
> 
> After:
> =====
>     text	   data	    bss	    dec	    hex	filename
>     8695	   2016	      0	  10711	   29d7	drivers/thermal/imx91_thermal.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Applied, thanks

