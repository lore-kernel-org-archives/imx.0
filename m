Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB542D541E
	for <imx@lists.linux.dev>; Thu, 13 Nov 2025 14:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763045244; cv=none; b=PjS15GZVwPr6uAz+94I3kT0WM6/pRoJTAkSme9lQlU24fq/CJItcim9mK8v3LyQn047LoHTT7gFsaVA2H/fvii3bgSPalzoNjQeH9EetmWYrdAOPlXR7aKFk07XAUUp03XeglL/kIO8uo/7w2GvincvQRMf772PCEQ1UjHVdgYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763045244; c=relaxed/simple;
	bh=F2kBxpSXrkU6fwfKy+g1N0BGk9Qwugl4Eo5aCFQcm9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pC8N0D/88bo1gHwLmqzWsxi7Jyc/olhL5fJiRY0LNMqG54QKG3hb9FQ3qZ3JKNUlsXX9p65AoejDWsf856ypyPzsFbJ6j962yOnyUCholJmELMR2o2lpIwWNNYjcAs7KOSZyipZralbIOKHAjKVmyLQ+5oT0y+03ppZsSJLtRrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/JRKlQa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CkjsmoxX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/JRKlQa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CkjsmoxX"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADCL9WR3440860
	for <imx@lists.linux.dev>; Thu, 13 Nov 2025 14:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c/j8O4OMZ/iO6ANHgdWOttUeORFw+6paoVM6GB+aNhc=; b=b/JRKlQaoXhQbjBg
	7mm9S/5h3Fp/qe27uSlmDQXdKJyVelTPms9TAYlDvBXVpwrx7Y/JPF42qOoJETR1
	cZsoxMoudkiU5Xx0VLidAV4Vf4PHDod433Ykxn74s+LsoMkTrwjARIl3IDm/A+Rr
	grUZjvJu70AF5w6jwH7l4Aq5Be8BuM4nP6pt3KJhqDbJ+xtwdCLznzo3aNk/9SZu
	F6Qj+Ub89gKav1oigAckmv9WKdjgeoUN7Q2qgBe471l3GyeBKiIxCveVSXs/+XGB
	RXI/WhEDsA6qtDMbbTNJWwMSedDbYI2Id5NJthr9QY3IvsFmN+3HmL11WKKwX00L
	cTlHdQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ad9789pwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 13 Nov 2025 14:47:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b10c2ea0b5so39283885a.0
        for <imx@lists.linux.dev>; Thu, 13 Nov 2025 06:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763045239; x=1763650039; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c/j8O4OMZ/iO6ANHgdWOttUeORFw+6paoVM6GB+aNhc=;
        b=CkjsmoxXOVOJAeOeiLBuVUx7jzqP/K+CAYziQdfqeGnRXo+c2B5QVh4geQyV+GJbOa
         gQcG9ScpQrB1Ns4ZLtq6wtN9iTZ04XOgCoYBYB5Ew9hZTGpEh2R72/ecHm+Lu5bKgLMo
         vKLo4k4DtJNG9e8Ozmqv9DQ8zQD7Al53uv2xlKUrF6MNOkTm9NPUspydkYjlrxcUTVc8
         ZVtJYsemTGZWfUyZdt6JtuzN1ecGkpWljFu2RKUE3d4CZg/rf/shbJ4s96+gZhnpgWlc
         DZbUBawVkbTyDreWreSUiHnwSmjKo+ps7eAGTFDrOGJE5I7OMbuKaSBbwK0GKih6nAp/
         pGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763045239; x=1763650039;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/j8O4OMZ/iO6ANHgdWOttUeORFw+6paoVM6GB+aNhc=;
        b=bzYzYRFtxUbg6Va+lXISue8xeYbspGAD8g36+R9Vv5qtdH7NqUEjABvngfE01oJ8SP
         kqXSFWz9NsTLT9WHBCFeMDmwOkd9rerYULJdDC/DMOaoSXiS/6yBW0MeZQWjgCbXuqxd
         fMPaUNpsK8ywzQZftbz+dkY0zc1QhApJ+7Xy012zhSwxGeUFBZdbw6K7iI/sf35mc4nZ
         nN0UZmLTMi/MFalGaVv5rXeGX5l92KHOoM1a4EooQTBZ7opXjesfYeHpHfq1enUI5Xov
         LP8q5KR92jrtnp1DikBEhtpiVS+nsRcZAXTKVs5OnuTzKOB1TNLQbbZL9KdihozC+GTc
         aR6A==
X-Forwarded-Encrypted: i=1; AJvYcCUWd6lwdcJO6U0kH3eG1spAgeZk4Jq7NpHq5BFknseW6g/vifQStRftrEgQS+lt5rzDyw8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwPHXRrv3TMcL5Ewp/hn7H3R/hrn6eBd70Q2W8hDrlW0b0OVPMx
	mmDZAhgPi6vgiIH8FIfCTpOSlTc+raUmqW4a095kyWw7o5RSGePZNvVzXD4zG4irTvkwutiMaml
	eUldQ/lMd1+2ImOgJOM2eAq6wN7k6Q9LPytjgbyq2eT5ZQ4vzTbMVxTM=
X-Gm-Gg: ASbGncuYT35GqtV1o77Hu/dHHGHzbKVsLbCpq9Fklkddcrg3XI3wb/NnsuIduhudoRq
	7VDfo4VmXsuilLaQmVxivVEu0+fF5O1vb3LBPiggEmDMU0sJ7pKn8SI1P1jtoAEILtR0ab/sg5t
	rYBxFIcJBa5Yvbe0y6WS2iXm1K3QncTzya1gqNcaczZowa/HsMM1wp3GMcRDXfTE6bsiPGY8ZOP
	1i2nJT0ZLsOtRqUCT0mo7AhgdGENd1uCdLuBxPia3Z3gtlKLbUhP7CCEpJqnXGXpBmI56O/vfFB
	adbp4KLdnLH7cMDlLjFlxlGWUePohU3xPiEJFjg210LP/Z8mHu5ZW78RFfNm/GkYZLkOd+/bocJ
	8cNQLwZAAsEQVzKIhVY6vpOx03hysEdSdoJBN5/5IzIZhnS4uKszDp4Tw
X-Received: by 2002:ac8:5f10:0:b0:4ed:7ca:5f33 with SMTP id d75a77b69052e-4eddbc9256dmr60355141cf.5.1763045238395;
        Thu, 13 Nov 2025 06:47:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFM7YamsAo7x44iby6/PzuNKLIab4wveVf6S4JQ4cd4mg9yAzxbvu88BKH+RnT7m5FWyF+0JA==
X-Received: by 2002:ac8:5f10:0:b0:4ed:7ca:5f33 with SMTP id d75a77b69052e-4eddbc9256dmr60354251cf.5.1763045237576;
        Thu, 13 Nov 2025 06:47:17 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fdaf6dasm176196266b.63.2025.11.13.06.47.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 06:47:17 -0800 (PST)
Message-ID: <45915f40-caa1-417b-95bb-deb7363a2ffc@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 15:47:09 +0100
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
 <cd7c0490-a2d6-4885-aa36-ee1492f107b8@oss.qualcomm.com>
 <CAMRc=MeuByh=N_-F2+zPiqnh+Qp9u97kiMheLJ-xxcSZSy+_tw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMRc=MeuByh=N_-F2+zPiqnh+Qp9u97kiMheLJ-xxcSZSy+_tw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDExNCBTYWx0ZWRfX/oCtd6DHsil4
 TV6C/YEbyOw9DAjoZ97chOjMd8oFasr6DZXfRwEe6HNLtrErW2kwUX4Zoz430cSEq/tcZJep5cW
 +LA/ZTxRl7ElO3PJy/D6R9HMesHLZvjb4BrZZ/OCmNY9EWtzxLwA2PcPehW+fxs1Yf0UqEXWlg5
 hn/9uQxvvzNlybzWSHoYTKbDjHgg131fNd6KX0RmWcDc9qJgnvNIyPKcEx2tbCMJ92YRolJ2n+t
 bz7N6kowf1FYuCh2U5IzzzHtfeD8JNJiSyoXoKQideEiyOzWCIRGUXM5vRGrmZAWZfBdzS3hoPu
 hlNwbAb0Zc7R2php+hert40di6QQnsVnZkpaMc7tqd0tMtgnCjM/1UekwKNcwfzjjD2E6suzJol
 D8GO9wBKwol1aIrlOwWAy7cgStIsmA==
X-Proofpoint-ORIG-GUID: pcAL7nYVxLmfPmCz8I-FQd64UxA2IsEz
X-Proofpoint-GUID: pcAL7nYVxLmfPmCz8I-FQd64UxA2IsEz
X-Authority-Analysis: v=2.4 cv=PIYCOPqC c=1 sm=1 tr=0 ts=6915ef77 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=IegXRtMujPCPvfbY5ZIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_02,2025-11-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130114

On 11/13/25 2:41 PM, Bartosz Golaszewski wrote:
> On Thu, Nov 13, 2025 at 2:33 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 11/13/25 2:18 PM, Bartosz Golaszewski wrote:
>>> On Fri, Nov 7, 2025 at 11:49 AM Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 11/7/25 11:29 AM, Bartosz Golaszewski wrote:
>>>>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>>
>>>>> In order to drop the dependency on CONFIG_OF, convert all device property
>>>>> getters from OF-specific to generic device properties and stop pulling
>>>>> in any linux/of.h symbols.
>>>>>
>>>>> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> -     if (of_property_read_bool(np, "snps,tso"))
>>>>> +     if (device_property_present(dev, "snps,tso"))
>>>>
>>>> This is a change in behavior - "snps,tso = <0>" would have previously
>>>> returned false, it now returns true
>>>>
>>>
>>> This property is a boolean flag, it cannot have a value.
>>
>> Every DT property may have a value, so this is not as obvious as we'd
>> like it to be (IIUC - unless that changed recently)
>>
> 
> That's new to me. I thought that if a property is a
> /schemas/types.yaml#/definitions/flag then only its boolean form is
> allowed. The fact that the dtc can compile it with a value doesn't
> matter as the bindings are the higher authority for DT sources?

You're right, I misrepresented the issue. read_bool() was historically
used for making sure a property is present and this was a problem
when the type was != flag.

Please discard my comment

Konrad
