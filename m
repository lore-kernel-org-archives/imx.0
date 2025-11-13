Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC5914D29B
	for <imx@lists.linux.dev>; Thu, 13 Nov 2025 13:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763040786; cv=none; b=tJleNNi+zASgY0v9GFCduPYZdq3dSKGSV55SqZ1g33WRIcvXhXKyocF6Jw9j7TsRm8zfCbor460kRmNcH+vTtxVu34DMxs+Gc2bEIYTLboxWgKS46OLcUeb2UtPaG+vtHM1QVxbhuGCM7Idr1iupb2pCIkSSSV+NcIlIW3neR/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763040786; c=relaxed/simple;
	bh=WXUFQbgGI72BGKFWLLzMLBxPdA8zEK4LiioFwjl4y0E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NlqfzqcOxBJiFnsmFrTr6N8Mem9tEsNxv1oQ8TY0etQFoB65i8HVbXd4qwgmK+MfJWWX9tDlf1theD2x0Xq6/YSrUseyxttLa+QctGAQEUGxdVtORbsm8nwSu5mq2T/3FTSEiQK5OiMDVR8GyHDr26Mn3JnwcP8jQN67rfoKKQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dCTchLVV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KpnRRdEw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dCTchLVV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KpnRRdEw"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD90UOp3113211
	for <imx@lists.linux.dev>; Thu, 13 Nov 2025 13:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wNLEUtImMXvAmjKIRtueCGZIQNgFOT3pJRe5fakSwLQ=; b=dCTchLVV2jAjgWiY
	ICFZIXcCA1dJnIdIViz48q5cmif6mK4Tv0rs91XKwf+WAKqP0coiOozMAqCNtf54
	v6WWSIzwslz5D+1JkALoTwwk/ae6y6C0EuTKEYl1O4rTOgn9jwhIMXqcJKyIBLLY
	GH+s4I/2nY0dwLFEo34gHaWMjv5jNRb9nyCg3ZtM58/JWNfCxxyRH82pTPnFmMUq
	7osKcoZo/tExDV4AhVEQD/W6FWf5rXTVCv2+piy1J93B+Y6hkdoZc9qgOc+61TyO
	XCK3H+LqmC4PnvDoQJ9QUGE62ObKb9yqGEqPJM9kWCxuO1TDgaUYSBWnqQ0cRRAI
	BI+hQg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acuw4byer-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 13 Nov 2025 13:33:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e887bef16aso1203301cf.3
        for <imx@lists.linux.dev>; Thu, 13 Nov 2025 05:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763040782; x=1763645582; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wNLEUtImMXvAmjKIRtueCGZIQNgFOT3pJRe5fakSwLQ=;
        b=KpnRRdEwOwiReORBdlArMm8eB1BIZLeuDqzXtAPPZiWNbjPtA930RLD9htYCsp8Lmn
         o9Hte/jZElbTyNnHBBsYpNQsJS1rcbKHAe60A3Z5WbKlUCt4lGSxI1rtVzRkS4O9h1h9
         O8HycuvoP25n9zPcbhcv7hsCEea68CC3AvGnnCGxmHtbUNzncQJuGvJhqr42jWhXSUFX
         02PT00ZbaVuL9g1oRMQmJzjDoJMEqlBBnfqkmbKYZBd+UdtQGCihPRB/1INyq5j+m9rP
         RwbqBzN2IAY3bbaccuWsCv6eu97foQgunxDA5iULhrvyyx+oXzLLA595qxdCI5VwYHhM
         5Eqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763040782; x=1763645582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wNLEUtImMXvAmjKIRtueCGZIQNgFOT3pJRe5fakSwLQ=;
        b=VOOB/fOmFLzhDmq6g0TEagDYMrYEO4E43gtLOrxW0WLr+QfHBnroyag0LqDEPQrVm0
         eC2IECC/MokEnYhXowZKCYbJgfvO1fNfl29AqSrhJ3dL5+6G/e8HvkWPbzwvNswkOeSQ
         FDYxIv+Z9y+gKiM7RdO66M+JM8bF9nQCiDIcUQeU0NtOutJqjFtOrcfKivTZnAQVq8lu
         FxLztlmxNMQi0OVM1K5oduZQYVX+VERrfW+Q+CFuirjV8WYxIHw+ktk8khpw/LiFIlrT
         +Qsy8DjV65sNJC/JKmSXCpI8JR/Ila4LgWHmLtyO+IfONLjBMCWiRR1g2za+KFK37gKl
         wj0g==
X-Forwarded-Encrypted: i=1; AJvYcCViS75Zm1jMrokos3tT9UB+/OuO19HZ7gs9sayYII6pipbYe4hMkQamcUmh5yr00S1ecPE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzaqT4RrZf2isN+WkkrDkARVV3BBnIK5zdlKMwXsXU6+np3SPVT
	y3+PheiqKs3bvjdP4Ny4RUTBsZ9TybJ1PGeICd/MYVsAMHgOXTGpJfOixF6Rayo8rb0YS722YqU
	mAgHzBD4SY6BziTqyVmkBMhyEFRE5lLcZ2jQGul17STrIuJxk1bSlvy4=
X-Gm-Gg: ASbGnct+aPRO9SloSYZQFAyADQAt0F64t9XvISIPWx63qOclPH652i2vCzmMvEaitHq
	3gh851VxW/ig00xVEKR9WkglnbTztCJgoAVf7KTL3GsViqATNNiSuNq8hsgxy7JGnOpf1W2kqYV
	Bn+FtGpL6ITQX+cnEtDEA6Q/n86XmCg7yJeMiBDekMR789333q7SjC02P2BMoPIK6THXWmSfQHz
	aJUAmpT38QfIkWYw9vvMsp3upIqt7DVBWbD8uLZ6H3tlI+MrxJNsQdmN2tbF8tRg22NrNsc3E4s
	HJ5bZQ/WVrYr4tL0u85CQoIVqHZPiyhJNCTQ7yCmme2n0qSrx4pcjYdjsi8Va/3cb0+/9KD7o54
	zYqFBUfG0AYA1q4MH2VHY3WatLGsZMMqhV6pI+/jab1eeiGaZ+WCJqWvV
X-Received: by 2002:ac8:5d8e:0:b0:4ed:b9ee:3ce2 with SMTP id d75a77b69052e-4eddbdae8demr64144871cf.11.1763040782421;
        Thu, 13 Nov 2025 05:33:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrzhJHhVjwGaQu/IkcGeYInBcpQOo8PGlB0mVpgZ0Fcc+3wNub2niPYVso88lX2dAHMTacPQ==
X-Received: by 2002:ac8:5d8e:0:b0:4ed:b9ee:3ce2 with SMTP id d75a77b69052e-4eddbdae8demr64144061cf.11.1763040781802;
        Thu, 13 Nov 2025 05:33:01 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fd80a11sm162333266b.39.2025.11.13.05.32.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 05:33:01 -0800 (PST)
Message-ID: <cd7c0490-a2d6-4885-aa36-ee1492f107b8@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 14:32:53 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] net: stmmac: qcom-ethqos: use generic device
 properties
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Matthew Gerlach <matthew.gerlach@altera.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Minda Chen <minda.chen@starfivetech.com>,
        Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
        Fu Wei <wefu@redhat.com>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Shuang Liang <liangshuang@eswincomputing.com>,
        Zhi Li <lizhi2@eswincomputing.com>,
        Shangjuan Wei <weishangjuan@eswincomputing.com>,
        "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
        Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
        Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>,
        Samin Guo <samin.guo@starfivetech.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Swathi K S <swathi.ks@samsung.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-2-01d3e3aaf388@linaro.org>
 <21a3d269-76e6-4da9-aa25-bfd1fb6dfb07@oss.qualcomm.com>
 <CAMRc=MexMn_GSC2EtMek5hDRLjGYA5HKM8ge9vrxw1pYDqPJgw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMRc=MexMn_GSC2EtMek5hDRLjGYA5HKM8ge9vrxw1pYDqPJgw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: A0MEshLPRe7UEMqUzBsarTqL5npOef6p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDEwMyBTYWx0ZWRfX6JneCpbtflp0
 ebDywDnsW40ZYIWf2lbGLrKYd9HA1iiz0msCU/IMvhsODkk3YRqrQwGyyn0aGPIpOh/upGvKSzt
 99OAZtbJtGr6Tfcq0ix9/KBjQWuRVFFBbxJpF8BoQYsW7N5ulFLuiOLgtQX81Ghr2EzDFCx1u55
 ZjNMzr5HtO1RXny5Q+9gWqHcU8h7iG10ioVeu1LlxNkZewoibx8Z1wH+LJRqmwG1yKmTJbinhGv
 9EZQEnMRVbae5oPLTZGMWmJrAcTNCXYLnEfRpk/eM3i+xqda/QJ6y6Y1uX9WoZAOgi6EvIdBCtl
 J1e3K7KKYxpqwVhG9o2xEA1qmpVzFB9KjFmwhT9ibqIf/9t6BmOWEHjZoVppLU+mrjtIEXUq0BZ
 qXkAeWb/OY3MOyu2SKOcqpq6hoAVZw==
X-Authority-Analysis: v=2.4 cv=F+Bat6hN c=1 sm=1 tr=0 ts=6915de0f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=Pp6BL5jzwldociJZjw0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: A0MEshLPRe7UEMqUzBsarTqL5npOef6p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130103

On 11/13/25 2:18 PM, Bartosz Golaszewski wrote:
> On Fri, Nov 7, 2025 at 11:49 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 11/7/25 11:29 AM, Bartosz Golaszewski wrote:
>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>
>>> In order to drop the dependency on CONFIG_OF, convert all device property
>>> getters from OF-specific to generic device properties and stop pulling
>>> in any linux/of.h symbols.
>>>
>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>> ---
>>
>> [...]
>>
>>> -     if (of_property_read_bool(np, "snps,tso"))
>>> +     if (device_property_present(dev, "snps,tso"))
>>
>> This is a change in behavior - "snps,tso = <0>" would have previously
>> returned false, it now returns true
>>
> 
> This property is a boolean flag, it cannot have a value.

Every DT property may have a value, so this is not as obvious as we'd
like it to be (IIUC - unless that changed recently)

Konrad
