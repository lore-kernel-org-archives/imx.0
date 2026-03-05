Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D1A37AA6F
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 09:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772703223; cv=none; b=XUFfdcehhxGN/jvxlijGgfwlOCFzbpLbQBAilU/3r7Sj6cRqsp5wPWaHo6O+YRu32e0WSS4T+TY+C+mBHELAzYhqSFeU06RucN49JSeYJ1uy1yvgGGk6U+79pTEVLU3z6dT5wBFESfp9rm1TWorY/nHujzlasc7Qug4KnujaXBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772703223; c=relaxed/simple;
	bh=HOFCRWjfrMQ86SS6aNSy6MkJAPJRhPPCTc1Ev4hVuSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bMa3fnjiWIfEYgZXZOxynrXcK83wz76u2IRK5aQ6pBVkDjt7hdPtdujFyx7UsqUnry7EtSXeihey1hl+yKQ3ZkXgyuHt6eguchw7ILCXVxiYR1ZWwu2revSHVd0SCCYX49Tcy9GOkJbjAcibMkNX7rUWzIM1ichOt2Z4j3GcZCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SzbctnVq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GVdRnwR0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SzbctnVq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GVdRnwR0"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6258wR8F021036
	for <imx@lists.linux.dev>; Thu, 5 Mar 2026 09:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SDHdZ6o2rq8MSXktK3BRPGVCbkpy9MyaMTwLEiYLbeQ=; b=SzbctnVqNSZ+NFa5
	KZNgrd87lqL1C4EWwyQX3KRCSqm4AR1CtRNPJmQQtSDMvdXfmaYnmP1uJ9mcoU39
	x5oHt1CxUbWXIScr5LqJGXtUzjCR3EYOjo2JeJIVt2bcNqLBumFoF2xCHxj8HJ8p
	3uVKCn8YTKDR50zX3M+04OETB2mKG0qWZNedQEdQDbDZb0bLJzOCAmlar5/bjaut
	YMjVGHQb1+qtI0EAX15PuyQtZJgJfRzxhNIuefwEoIPI+6NkaOq+T0x/MsEecMhn
	ShB8NHHzJIhEeKGVmnCBE1EO3Fsny1DEDi9Ymkt7u8i8x3T9dawWdfRZXVHjFv7c
	+rn9/A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuptj4vr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 05 Mar 2026 09:33:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb38346fdbso591448085a.0
        for <imx@lists.linux.dev>; Thu, 05 Mar 2026 01:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772703220; x=1773308020; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SDHdZ6o2rq8MSXktK3BRPGVCbkpy9MyaMTwLEiYLbeQ=;
        b=GVdRnwR0eUqE8Lh/Y9hdK/p6OVdzlcce4sfc1R7J+qTfwoZ5JCrL5FZGmQW2PPaGpx
         cnCDiu96gP39yLytjMFi3tr+LTW8YmJ78FRwtJor9o9Qv0VO4ZlnaaFrW5Pn2WzNkHO3
         gXMFG9KCvBnWQyt43sEtJQqDr1JaRj+oFpfSlbjuUtxwqbuL9Md2hQ7aiwY2av0EGa+F
         zOrjrPA04uejRQEDJxwQuaWXbhBDg4mcR+JPzCBnBxEHV5QosLActwg2SuwhMiujAHjB
         pKaUjN7/lA4SEsU6zFKzH0rBGmmmgCfqdpElc6zJrReQmWHDMHaRL2RYz/Bbc4qVxMyf
         Ulkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772703220; x=1773308020;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SDHdZ6o2rq8MSXktK3BRPGVCbkpy9MyaMTwLEiYLbeQ=;
        b=FmvDAWeMMWupBIbit2Vy+MYDUmm94OEYmp2mWqnKbwAAcnjaLZ2+EggPVOg81HAOZU
         kA7GFJYDciShY6wNqQ2Exs8Yix8gR1pX67LXWcECWnOT+dDfVvJ+9a28CG0rI7CdLb7e
         pPSkEgv9sOL55vPcjQP2WS1laCi1lST89VtAoCuA/GH1R+cfB406sJrNimQhTR/dVdgS
         n2hDVALP7Iso+P8vPgcW3f0Ta971wa4238Qaju5JPT0euN+oBMkc1JumL7kPJHlFFePk
         6M9SMak9epZNPTg9EsHDqLMleGcUthJ/ZKmwrzT9zB4w4gF/NYl3kR31zcc9H75Xq+RI
         8yWA==
X-Forwarded-Encrypted: i=1; AJvYcCVu/nufd6zD6Rcm5C8DCBZBYZVCPORSejUts+XpfXCbOW4wgug4q7tLSV+A+fyf6HpfafM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxmEFCipv/ePupBdJGfTVWsJacFAOH5IFZvLsqB4Ku2EpKLRRnf
	uuap5/HL7dUJ4fOiqKVcc2bQce+f13rz+ePUIU6S8yyW/mARkABt0xLnn5GobbtAkiGUeQB91Np
	h3xw8nQzwLjeD0jvDpj2MLaG4WwO8vQKt7RFEZi28EqcM//zAObZ768M=
X-Gm-Gg: ATEYQzxsBsJeRBupDMUHmkdWMrbjBg8GC5opcu3sap75ATzVrJ0k1URZStOeL05yZQf
	49Ps/VFwWO7VcplR3ek3/pNXNrmpFGproFHCAuJLeV3U4YxsLhW15kR/agw5QRgxpFRee5p85M+
	kpV9EeZbMQsZT5QOpaBIynpVvKM14VrZQrXfVmTvv/w3zgqehO63Q/pPZrIHgN/yOrDhROaUbk4
	Y7R9T1rvNcdihy5fmGTH/jkuMaNHEW8WD4eTCsJt3m7P+l+CxforUTaaQIClKW1hvwHknFfZUkn
	3NBdajLykNJYImEgKDNSQbmWRuLr1e0WcMe4IyJ+6b7+T0S/TpzZx8bxpGCmWTZnV1LhKuwqerS
	+Oj246CZpupuHTmyt1Ib9rTNXJl1+gY19thiTh3EghGh32xdxAMVZndeC2hv6ENel65NKRp4St8
	mOQRg=
X-Received: by 2002:a05:620a:c55:b0:8c9:fefa:89d5 with SMTP id af79cd13be357-8cd5afde9cemr462863185a.10.1772703220103;
        Thu, 05 Mar 2026 01:33:40 -0800 (PST)
X-Received: by 2002:a05:620a:c55:b0:8c9:fefa:89d5 with SMTP id af79cd13be357-8cd5afde9cemr462859985a.10.1772703219701;
        Thu, 05 Mar 2026 01:33:39 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae65662sm884380166b.41.2026.03.05.01.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 01:33:38 -0800 (PST)
Message-ID: <ee2980af-e37c-4b4d-86c2-32467d2af454@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 10:33:35 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] arm64: dts: Drop CPU masks from GICv3 PPI interrupts
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Peter Griffin <peter.griffin@linaro.org>,
        =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Thierry Reding <treding@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1772643434.git.geert+renesas@glider.be>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cover.1772643434.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA3NiBTYWx0ZWRfXyHLC2/6vGYIN
 bXzO4ZjPsGIjOZ1FEMMFmTygyqhdDLQmYfzQKUrS475dxr0p8Kv6Uum12kk0G90hOt7d3DlBk1g
 xx+t+jhZPkJQP4b4kPW9ZETN5dQTwuMLWUJ2adAfqu0cdxJlBdPRbsZ+zxjT4Mys6vRzLp5VE1V
 RdjSlcbTzNI9voYVbPq2K03jADFxqNmvV9Gzxl0PJtFdIXpowJsZiZE4h7mFwln1VD2t4Z2XWx8
 coFF0B0P0UG6JKFN87XvMbHaayhdcbEVbyKwjzoU7OHS4M4+uudEhcs0pwo4BTj6t0sBf2wq9H3
 ync6zino13a/VQbf6wdtqfhHbB8ZdzSYfqL7Rpw5+wNM+psV/qovOI50fY8XlOqBNNDYrQExjnr
 lUxPNHp3EMVEIdYttaOL9FT9uoaJNkdYTmYS4NDw1gHKN5PxOB0d9eWzJjhljVcDrMoo7Fx4T1a
 z/xZNW0kvL5egfr+7xg==
X-Proofpoint-ORIG-GUID: oRI4s0QomODlD2LvmJL1KGp4A9xih8o2
X-Authority-Analysis: v=2.4 cv=Ddsaa/tW c=1 sm=1 tr=0 ts=69a94df5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=QiSWx1vRvZ7C5zKyDnUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: oRI4s0QomODlD2LvmJL1KGp4A9xih8o2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050076

On 3/4/26 6:10 PM, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> Unlike older GIC variants, the GICv3 DT bindings do not support
> specifying a CPU mask in PPI interrupt specifiers.  Hence this patch
> series drop all such masks where they are still present.

I'm having trouble finding where that's used on pre-v3 even.. does
that actually get processed on the older iterations?

Konrad
