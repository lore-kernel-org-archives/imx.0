Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25343A7F51
	for <imx@lists.linux.dev>; Fri, 19 Jun 2026 15:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781883423; cv=none; b=m8dTVOw0LYuS9LGQeMxK8q13Qbu3z0QjIQ1qtEX0CQ96S1uGOSspl6JT6ww2bgtVfHS2W68z6QEn4Z2epx98NQxVxAUPTp/oNxldXwQn1UeucS3j9LPFMPffFEskuEsS+wyaXJVWtgZW5V4hKXTCNdwKUogcpFXS8SZZPas5a0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781883423; c=relaxed/simple;
	bh=Ue+aoWk4rNKM0Od3UOoy/W5n1XtBpOFjK2/UGI6BV0w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fY6R0NZ/vOLGetDBSODKeMfdklHcDNywANtERrz4QHOEuHyGsplK7o1A/oRyh9tCwmbywEvE0gZMAqF0Pi4Zz3fr2VN4aV94oAIhujSyHOvMs/1jYFf2lbtDABF5VWcO96R4HQHCFCdLxWokJ2GCY+fYEqg4tCQ7f5/2+DjGe7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NTEjpDPM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PtFnm6Zp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NTEjpDPM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PtFnm6Zp"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65JD9kiN260251
	for <imx@lists.linux.dev>; Fri, 19 Jun 2026 15:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l+ZBZUukYW3UATRdgCDpkV2aWJmXCVShzbz3nEXQmKM=; b=NTEjpDPMMF3fClMq
	99XprWICtZJqKb5hCefZmSdGR+n4Vkjm9DPB8qEYu4aFFUqW2+3wERYRO6NZ0K8x
	/CEeFego/qLHer9/xB+4BypzIfgNNXuTCrTCaXilPy5mq136KVEOcvXNaRH5XvN6
	HldYzixLRRiHk0Y56tfhsC7n58hRLQxe00jmpLmO5nw0vUwIma1wZAclSEFMqHV2
	NSrx1uZVHLd8R7FJjvQY8RTQrPCIqx3hZCF4Z9dAHvAGx4KPp9LcAOBQ9z+FvQ5s
	TCw8URFrGr/P+AC6guothYIFhpWY/TVtHZ+gaFTl1W46sULmb7p5cgr2Hav5XWPi
	gLJLnw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evp673r35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 19 Jun 2026 15:37:00 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51780e3ca44so2500031cf.3
        for <imx@lists.linux.dev>; Fri, 19 Jun 2026 08:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781883420; x=1782488220; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l+ZBZUukYW3UATRdgCDpkV2aWJmXCVShzbz3nEXQmKM=;
        b=PtFnm6ZpLTzvVl3wdGTzx98zh9K/zjc1Zi6HwRx1lBHpHZ1z+Urzebv0FjCo89Pe4+
         T4mBTFWjv2S25LWsho7F35bLAAtHfU9UKexjzVpzpMDdtEgY+DnfujWXjYwe/O4wLuDV
         HlzdfGKyeV4S04Vpwngf1PuSQ++P9iHPzQcePGsmXUaz4qsgVRQSQwwnwI/NzTmo6blD
         yc0OkIooVyLiKhCiuBcqlowj6jg3Zf8DyNny4VAr6Uix3XRpxkbPB6LFqUXFJp08kOcK
         QQ8iXwYv+KeI+L/jUNSGxcEcKqtjQwc09vNkMYSzfADJVHMQ6hbcapYOmjuOw7pMsOjI
         J8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781883420; x=1782488220;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l+ZBZUukYW3UATRdgCDpkV2aWJmXCVShzbz3nEXQmKM=;
        b=i9jIKn7+VfriE/VSnMtw5J7WKnrjpdPgNNqIFU/GWnJ+omibAvB7DwcS0eRxRdtJ7C
         K7FsW4n+L/LMnTjTTF2D0rm8x08bwxt/ERUpfWFnUTgqhLEpwyQgiGIppySrMhxPkcyU
         /OeEJjZQ6HRDjBMrycs06gH0NbCdO2H+15KZmJF2TpSHMpIpe0iu0B9mWC+kFmIklXFe
         o9Lg5OVh5MsWDWWBn4UWMcMaAvEl0qHvI+glfvLNiVKwCk6i6SlASuJorL3A4zq0aJPC
         Sq3Xvdq1V6ck+JGbRRLwp3an8LiBauzpdgGn76sVICX8tGXAH7IeePi2As/uKqUjcUAI
         MIgQ==
X-Forwarded-Encrypted: i=1; AFNElJ/XGGl2oLsU5N1KnTjH19cs1CHWqAZmYO1VdyG8HyyuRRaeLjtsBaTGGaa6E/PRLJWXzu0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzafvkm2lzcevrwXlx6GZN7JH8PaMa5uCxFFF2v/RqEcv7gdFWd
	9fn+f35h2UoKkXV5cyr+X6Nut6zTpwo70e0tej02z1/XWbLRlDkqLZ8nj02ck3bNa2VzKAP5qng
	SvFC9XC6kT1kL2HCE0/PwolWffSy0KylHBayhNjuP8w0vsWqDCnLsihQ=
X-Gm-Gg: AfdE7ckDXEciyk4zGUGX46u+OwWKQTcLpvYtsJsQxRwSAbs6mt0Gl9pa+BfKdIzErsK
	RkpkJnr8+1y8pf5hhAm2WjwYHcP+AlrL6ghAzlex3EPqPu+s8NwWXj4dH2ldDHs6HnUZhVE/DRH
	07Jq8S4vaCKHY9xhzWK6qgGWyUzaL8O7C6zojonZAUwre2sxdQrt/buB5Uob2GB+tWPGgBW6xfP
	tfQ3q1W3vRRGoW7XORoJyC+eq3rtxllRbI1TFxgpl6fd0M47jgE5RlJvGZpBUVEVIRYKtwDlOZu
	g+b2tCaoWpwrPFOuYQteZOG6USfmTvqqI06dZ/Wc+syrju/Fz1fgThLflaaMMhXFdKkFQUnOPw8
	AbQ6PkCtkOcrlemfnKoW+yeA8BuLxogIb+rc=
X-Received: by 2002:a05:622a:1393:b0:50e:487a:bfef with SMTP id d75a77b69052e-519e4a25406mr39022281cf.2.1781883419860;
        Fri, 19 Jun 2026 08:36:59 -0700 (PDT)
X-Received: by 2002:a05:622a:1393:b0:50e:487a:bfef with SMTP id d75a77b69052e-519e4a25406mr39021521cf.2.1781883419316;
        Fri, 19 Jun 2026 08:36:59 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-696edc76242sm1042750a12.4.2026.06.19.08.36.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 08:36:58 -0700 (PDT)
Message-ID: <6e760884-87b1-4ec8-9ae1-e53901451b65@oss.qualcomm.com>
Date: Fri, 19 Jun 2026 17:36:54 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/6] arm64: dts: qcom: shikra: Add pin configuration
 for mclks
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260615-shikra-camss-review-v4-0-bcb51081735b@oss.qualcomm.com>
 <20260615-shikra-camss-review-v4-4-bcb51081735b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-camss-review-v4-4-bcb51081735b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jZh6hY__UsLb4EOlVNo3u7FLos272buk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE5MDE0NyBTYWx0ZWRfX4FFI9JVVqSwV
 JMnwickoDPZwgCk1jrLTAYfG1BiXXUwKTJfjpObjKT3HkSX6fclnJ0AUoMmklEgTxAWGz2WVQuY
 3M+3yA6K8fKR3mBdRKlZ/oqTE7kr0PT8SkzA/HPdwaTT0xC4ygmgOJVFlXbg2XJS/3/agSlZTW2
 zT49N3YloEjSZeTKlx9KSeZXXH2vilOqsdiASwnCaYTKX5GlSW/ueMXXTgKmXq3gTMTKKcyFoxZ
 vIY33oFIITQ+dy7uCpPjD4BFAjG0QB2MbP92JhD8w1PjLJKd7T9Sq4bSffM9VMmWncjkn412dtz
 m+9mKm+SPCcVTJ8uNZAn5G3Ure8HXCUK5FPVUJKE+xfS2rr6JYmQM+ZJAdY33eqPH/e+34HE+oR
 pdXjA1BYvg477RHmMeAI5jLwmA8uI8sH1tOreYc9Ck0sgjPJvN9/TA1ZT2iIJV7TRs+OS3eMAWi
 +jgomrZLASXXv69Lpmg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE5MDE0NyBTYWx0ZWRfX2tANvgdTdCD1
 LtC78VC59Ob7NcsGDAtQLe9x4I8WL1uVmhEcHdX3CPYbOC8xSI2cAP3My0mJ8+TxCCB2oxURnq1
 0q3fz3mMhWuIvPGOgW/cAI/0z1p1sCQ=
X-Proofpoint-GUID: jZh6hY__UsLb4EOlVNo3u7FLos272buk
X-Authority-Analysis: v=2.4 cv=TdOmcxQh c=1 sm=1 tr=0 ts=6a35621c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=EY8lGxjS-5OGnG_HtjIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-19_03,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606190147

On 6/15/26 10:33 AM, Nihal Kumar Gupta wrote:
> Add pinctrl configuration for the four available camera master clocks.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 57732804a6c6a114a407a4a541a1cc7af7635ea2..16b547131e8b14541abc68ff7cda126ba777ad80 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -380,6 +380,34 @@ cci_i2c1_sleep: cci-i2c1-sleep-state {
>  				bias-pull-down;
>  			};
>  
> +			cam_mclk0_default: cam-mclk0-default-state {
> +				pins = "gpio34";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk1_default: cam-mclk1-default-state {
> +				pins = "gpio35";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk2_default: cam-mclk2-default-state {
> +				pins = "gpio96";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			cam_mclk3_default: cam-mclk3-default-state {
> +				pins = "gpio98";
> +				function = "cam_mclk";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};

Please try to keep the entries roughly sorted by the pin index

For the entries themselves:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
