Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E0631BC84
	for <imx@lists.linux.dev>; Fri,  7 Nov 2025 11:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762513230; cv=none; b=oekr4U49rcoOc2qdqsfzYkLWOjJ73E3XUuDSmHT/n2NlUJ2RqhdqTad29weM0dNhS6azR6UWex50nMRyImCuSROFPoeQqVeoYbgLqPAZdR106uNCF6IhkeXtbaBZ//Tl+Ys2WbgKVuqHtVsZuS9ceZ0OmKuJKhwkHwlI+eCS1X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762513230; c=relaxed/simple;
	bh=YP5Kx7k+Nd09x0w4SUTnReHV8qPMtlpM4hSGSOzvfg8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EV/hReIJa8mxejtECiNxZ0EZa1lv86PWdzImAIptDNuSLH133tVOtKN8Rks5TqR1WJFI0FbQlgodQGkn0Ap5G0uh+UB8IGHzxxf7Khg4nA0UnSTCHsGQUWDCP8UiiDsyFG4ZeJVnZdjmvtUZnisepEfJRvTmit2I7BASeeIhzTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=meYRNVo/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SX8o3fKU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="meYRNVo/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SX8o3fKU"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A7B0QB02878523
	for <imx@lists.linux.dev>; Fri, 7 Nov 2025 11:00:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Yxrppr7/emo5nMkfpN1y9e7bjiQLYqkReu/RHenH+8=; b=meYRNVo/ytmsLIw3
	9yLlW7GI4+rmzu1SkLLhvRhvP8rWpFv8etdCh6oOI0eghmA6tDSc4+hVriUcpmbT
	bvUyQrcf9TgGLMtQn9G+DabVKcab8kJVoyw9dkotpbWXALEFwxkESHu9/xGv20VL
	nacxkzyq6bconr1T4lWp2oNzE6cnmBNsSKhavXJQtBCa7T+USx4Ja6Uje777/aBI
	6S25I9Inyk4w65tWzgHYtI+hnsskEBJILnxbA1HqfHj1VXyZUvwbpaTp6JPz2umy
	TUX/veb7bU/ued1EGhEUm+QNtaAtvgdwI55azNJSswoyx0dkp6JjaiBc//hM8H2d
	w5LLEA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9fh1r00n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 07 Nov 2025 11:00:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b1be0fdfe1so22175385a.2
        for <imx@lists.linux.dev>; Fri, 07 Nov 2025 03:00:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762513224; x=1763118024; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Yxrppr7/emo5nMkfpN1y9e7bjiQLYqkReu/RHenH+8=;
        b=SX8o3fKUL+nkF5sP9yij99Y0UF9tG1TEVzfs7ejzB9LLntLfQiui7OL9A7IWFuCAQL
         iio4QOS4xKEmRtRh5PfutoSnv5Bt5RH+zOcLvVF2Lw4lJc7DEtv13/JHFLXtzOm95xys
         /iZkVwJBqel7iFZgrt3kz7DKZqePA1dIIxh9Pr6+ML66xeVOJVUhdPqvI9fvQwA7s7P9
         dpw4rMu/5R874tyEbvBqmsycmsiSxfiVNZbQkyAQibb+D93N1VLcBY8V5O5eUyzClGqp
         2pNakf8OOx6RoLAr1HUnDQgdSNj1ZfZVQtqCXVdi7QeGk758Isck//hoXoaSPiWI33Jd
         RRDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762513224; x=1763118024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3Yxrppr7/emo5nMkfpN1y9e7bjiQLYqkReu/RHenH+8=;
        b=Tcg680GIB4KV03uX9qbZyvhUKmJo3LIuP4bcggV4lHqRUIrEarUMyw6qZCuwfOJU5r
         Q5mB+h2TQKn+SYxNTxtQPw0CpnFl34M9WSQ904OIRhCx89n6jMUr/PF1m15Dt1TfB3md
         3oHCGfV8/aGttcboqZuBKNw+TnX5TccXwnv8L9W1yADLFMq22STfPutOV0hmj2mxKGwo
         h2/+SXzOdgxevhu/74jyrFu7OXcgAWlVnPcEywQ+vXmPHBgGdKRRaWAD+fhe75nIKgTP
         ysUWHvBtU6PVgsOs853IvP6WbosNgHqQby4MxYQQJflDfd4Lm2kFqtCnsQNeNmXcs9a6
         7Cdw==
X-Forwarded-Encrypted: i=1; AJvYcCWQQqGhmR8hNsoigiAPtbI/RYhECUKl8Fvngly5+3MasE1i8k8yFabZwqEatt1wM2pkusk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzw1kuK4ysLZQCszXRmFD/hwoxaqu1WRDbZYMe5ri/+1J2KbAVh
	Z7fdaL/IVserwzKnZFU6fk6iVzIWDMlFSwrz43DiOBvsyBRGsJizBR821hdiOtMeIWNZerHwUWY
	PdbCBRJSa3q3HVDxWsqRa3jk+iIGOIkc8d2ukkPhrWCPhjsZcE6bajao=
X-Gm-Gg: ASbGncvznnD7wNm2Dw+sBOUXeJ5pQh9U2kZe8C9CzYaRycbPTu5+UVoK1rr5PDcef+q
	zpZfygnWfNnHxf/36SL2yifUpFUzl82Fiuatjnr4cHmOsayccOJtAn04ad0NP2QBlIh69LUMNWZ
	kTj8OHx0qbpLpsbGPAasrTDrnkPcSiXEG7GbqyQJ3zZgfo8j6jYzd1855j3oMRuolZTrD6auR+1
	Ea8eKBW2nwNcrk+Bhr5GuOM1tXM4HYKiE1MCMqnUeZzkLLRmxYeLT1nsSvQ2o/6ylkeYTufJPH+
	RFKxQZ6k60gpgj5/UIXV4O3NRSqv6PMWjQ+voYVy6rzns8OW/ecngshoFAkwRZeuuemrCR5c0Kx
	CzfjpVMZdXsHiwCPITDMSFgmpS91DsR8AnTbghnL6RGOz+nikmxPUq9t5
X-Received: by 2002:a05:620a:4049:b0:85f:89:e114 with SMTP id af79cd13be357-8b245280933mr239717385a.1.1762513224053;
        Fri, 07 Nov 2025 03:00:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH34Ma6AlYFANasFLA7REiIDlipeT0LBwxV1S1iyIGEImmErkoaBKdKchVkLndS6HBNKbTjKQ==
X-Received: by 2002:a05:620a:4049:b0:85f:89:e114 with SMTP id af79cd13be357-8b245280933mr239705785a.1.1762513223227;
        Fri, 07 Nov 2025 03:00:23 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf9bc874sm216910666b.54.2025.11.07.03.00.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 03:00:21 -0800 (PST)
Message-ID: <14f95efb-0eb0-48ee-9132-df35abddfcc7@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 12:00:12 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/8] net: stmmac: qcom-ethqos: split power management
 context into a separate struct
To: Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
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
        Swathi K S <swathi.ks@samsung.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini
 <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251107-qcom-sa8255p-emac-v5-0-01d3e3aaf388@linaro.org>
 <20251107-qcom-sa8255p-emac-v5-6-01d3e3aaf388@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251107-qcom-sa8255p-emac-v5-6-01d3e3aaf388@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA4OCBTYWx0ZWRfXzTtYYi9rD+he
 cRPR0WWMA0QSNIO6tAvOGGDFk6+Ai+DdcRMgm0XfGbf/HYeuiCv6Dx+Jj1iGjbXzEP48curZL+M
 N4fZx2dQpSiJzwfpj0isUSLUQhytysbJydpIIdJH5ZAOzFS5Fr3ZYiHtcTyO5GdywEzHcvwerno
 K91AqWg6IzOuZ49pR+ASgXce8LKI+5dnm4cXL5gVsLtFe6MFCytm3pcpXN1CvJ6n3wQ6RUhozwu
 G4AZL2fnh/lp5rPPh3TT9DAz4WT1SJhS8oTGQM9yUbE6au4Q0Z6TiPVDhrYnvHfGcrbhNoC0f9u
 KQw9kOvFcmBFCF4ZrhGvUbEcnPCD1YHeOASryZtsY8Mzpf+4KIqVYrojbneOFMd9w1aAtn+uqGL
 Ztn7HGj0QWocJXw4ExwziA8ViL6VaQ==
X-Proofpoint-GUID: ADRt6GSglW8rs0wzFU0HMiu_mGJ1M3WY
X-Proofpoint-ORIG-GUID: ADRt6GSglW8rs0wzFU0HMiu_mGJ1M3WY
X-Authority-Analysis: v=2.4 cv=IcuKmGqa c=1 sm=1 tr=0 ts=690dd149 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=iTm1nGh4yTgqJnnOKdQA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070088

On 11/7/25 11:29 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> With match data split into general and power-management sections, let's
> now do the same with runtime device data.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 46 ++++++++++++----------
>  1 file changed, 25 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 1f00556bbad997e2ec76b521cffe2eb14fabb79e..09f122062dec87aa11804af2769ddff4964e6596 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -105,17 +105,21 @@ struct ethqos_emac_match_data {
>  	const struct ethqos_emac_pm_data *pm_data;
>  };
>  
> +struct ethqos_emac_pm_ctx {
> +	struct clk *link_clk;
> +	unsigned int link_clk_rate;
> +	struct phy *serdes_phy;

What is the benefit of doing this? PHY APIs happily consume a nullptr
and NOP out, and the PHY is already retrieved with _optional(),
similarly with clk

Konrad
