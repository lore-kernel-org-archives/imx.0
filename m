Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5311826A1BE
	for <imx@lists.linux.dev>; Thu, 24 Jul 2025 10:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753354671; cv=none; b=Qway94ZMeDqsqqhyaJJUjDfkt8+lfQM6dEm+k4IMnAoDJJmQR0yo+ysHyCrNXgu6mGXUfo3qbKH6k5P27SRV0zzum7AF1AddENOcu7Qhr3sZpuHw+6M2aM4MxZR5ob4p7Q/eNCIZjHCItpCVSjmQvBMEhMH4pUfEpgl9JWo0e/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753354671; c=relaxed/simple;
	bh=FHUm8JgjLCIAyUcbE9ObMrZ2uKu/jiL8r01fKXYzPAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EnX0uBCB8BfYgLCGQzPvG8N1gRxP+NT/xeyPOHbrqEpmdg+bdkw0RR45p5/oLoj8dtbwNbPRmBeSn2yrspXS26cv0fd0YqHiq2SsOOGfuxr8L1g2S1X6Lx9MLellgxTZSQbO2keVm4A+zEQuI3QJzMP18zhlUg1mcmD3soiG7wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MCM9U+EI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MCM9U+EI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9Ve6P015228
	for <imx@lists.linux.dev>; Thu, 24 Jul 2025 10:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	frgttlq1wUpHfs85c6sOB8oFTBM5O4TFBHJ8W4S/2Zg=; b=MCM9U+EIRXdUhkkj
	RnaQHyphmlwj8ufux4uRqT1CeeRyh4WJeQyMhFCoM7HUZE8B54OyMur9MQ7pLAHK
	q7Q1KVrS7BFGTDMUnHwdUrmlCjNOXtf0Rp/Gdwturu54n0TsR+qJU3AtKnFv2WhV
	Ajeq9g9mm1HxhnKm5PMSdv09h5GF5GTeKQLa+UREcjMI+vHbBSZEp5ZsQOJYdrBc
	29cuk/jHFBZqdsYWQeB8ET0R6F2HpIBhXtEQ0eTVFTrqxXZJKuhGlQ4XUWQjybWw
	SQmEEyV1+dpeOxXC5puV3gSzpq8fRjewj3wouaPKzcYBH4zMbbbQ82M9zd+81FQV
	uLJMxQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483379tk87-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 24 Jul 2025 10:57:47 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6fb030f541bso2733526d6.1
        for <imx@lists.linux.dev>; Thu, 24 Jul 2025 03:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753354666; x=1753959466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=frgttlq1wUpHfs85c6sOB8oFTBM5O4TFBHJ8W4S/2Zg=;
        b=we6RhCVjM2Gi8jDtxuuIEwe9xFm089sOHsuMY0VPSKt4Rf5ZcDVTdKiddOfZyHfJaG
         jTCwIqaLuYL6lFtTTH9zqGfqhrRzGx+VWhDEb8dAByeavIxPhizNMR5nLjf9ID6CuAeB
         vhbr0RXTsGICR81qx4aDt/AOTXEnXlzEaikPydRx7UGgEV6FJStK0a0Hc69KVGr7xeP/
         cO97LQEZLEyigCKgCvDuPXrKo7Pw93EAB7wgjUDOwwbmnpoa3eoufOZ/3a4sLyEPAH1J
         EidnMlnGINMNKJO7X6/BbShuuUH/o/vip/DEs2lF4fINeZgQhHg7O1/yITE9WkvIJzve
         vBfg==
X-Forwarded-Encrypted: i=1; AJvYcCUqKIGdk0VKTW/RVxAZxZUHSE2RApMgk91Xer//VUBaXBTKH25zKdQjcEexKlzturzRqRk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwymGXmc+JnNvXe5isChYi9kZBRVh5yecnc5cMF0LS2m0r0FPw4
	tHJfryj4y7bQbaC9OooildK7tqktvl5P7KIyYHGaHFDQ/EPMiAt3iJP/l4iHGpcGT0qA+wMKncJ
	Cr5FbS1JU3DF16dS7xhpm3TUdZFknCRVKqkkJ/cXG/0ITi/1HUgj66WM=
X-Gm-Gg: ASbGncsCiplC+19ofQ1IYxKQSQCiU4nhxseFw9IEBPHVycvRB/aazQ6LT3DxzQXFMlW
	IBeGZy9kgp1jjeA435eDxvmAPpxty0+2KBqucJltVx0UTgg30VyLsQSjNWWcRO7iCIRa+bDN+cy
	UAP8uPFVzvspA+J5s2v+eTGn+GdDz0R7k7JJrdfjTROLYxlMUUHVQA+ZsEkZ9+Q+xPoGul9QrBw
	wHSH4AGKMMPe4sEac9ld1scp29A7NiS6fUB8i+lu+emnl40veQMvyniRoCZ8XNc0oWw/vIzjsyt
	LHktTtFrGCxrX45j5XNx+NbQN95esKuwWbDais3pbFeJcUsejUR+NCnOs0ahEXTGpRiPztxlqtg
	TZK0eICB3HE4iOtBQaQ==
X-Received: by 2002:a05:6214:1d2f:b0:702:d3c5:2bf1 with SMTP id 6a1803df08f44-70700537849mr43874846d6.3.1753354666063;
        Thu, 24 Jul 2025 03:57:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOPUGD8doV9+jglxqU2GB0DYEWEF7aTYg/TWGqOaOfQBWULvPms9oF3r1fFWzU0hBkNoKlEg==
X-Received: by 2002:a05:6214:1d2f:b0:702:d3c5:2bf1 with SMTP id 6a1803df08f44-70700537849mr43874396d6.3.1753354665532;
        Thu, 24 Jul 2025 03:57:45 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af47cc6e753sm95191866b.50.2025.07.24.03.57.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 03:57:44 -0700 (PDT)
Message-ID: <bbb07270-cf7d-4fc6-9a74-334fcaf00f05@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 12:57:39 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/15] pinctrl: qcom: use generic pin function helpers
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Andrew Morton
 <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
        Jacky Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP S32 Linux Team <s32@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang
 <haojian.zhuang@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-hardening@vger.kernel.org, linux-mm@kvack.org,
        imx@lists.linux.dev, linux-omap@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-11-af4db9302de4@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-11-af4db9302de4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: eTFBZ2gnt6etN7GVP_QYxAcDu2yeq9nW
X-Authority-Analysis: v=2.4 cv=btxMBFai c=1 sm=1 tr=0 ts=688211ab cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=jpok1_DMC_Ne8w05vhoA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA4MiBTYWx0ZWRfX04+u+j6mWcDk
 E4KJ2rPUnpx7hRK/auz2qFNLh2MS4j0ODth65ESkMznWlw8LIiloYxM4EgNZH46uhsaLyKyY/Zm
 MnC40xcv49ES8/xAygVvwUj0DoSWS02ewYU4S76SE2s8r5Ad9A35/k0YEa7gBNCRjMU/h82fLM6
 jGXdPxE7ECUN8F4YRXx2y93mzwSxI1SZNTWWEN8eoLJIjyL3ZgX35xhqSij9t/Nt9P8kEHL6OYD
 zIf7uJ4lZ31RXEjiJX6NRe7pvhK/Qke7ufJdbuITXqgluxqk7UpqAajJM+7+ylfmyxvpFLhFTi4
 GlEQLbE1qDez4G7eQv5Ls0bevB+uODa3K7gdLmt2GfsHk0xmHmdd7rFrmA1xmZg5u8wSHfG/Fp7
 31VCwFDmyV9Kep7B5bytiram82bj5SJqGiC4E8GL/ns8dab7vVFYhADgVXJ3IzBholUjQUFE
X-Proofpoint-ORIG-GUID: eTFBZ2gnt6etN7GVP_QYxAcDu2yeq9nW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=508 impostorscore=0 mlxscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240082

On 7/24/25 11:24 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> With the pinmux core no longer duplicating memory used to store the
> struct pinfunction objects in .rodata, we can now use the existing
> infrastructure for storing and looking up pin functions in qualcomm
> drivers. Remove hand-crafted callbacks.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
