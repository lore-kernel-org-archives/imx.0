Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881DB305E2D
	for <imx@lists.linux.dev>; Fri,  7 Nov 2025 10:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762512886; cv=none; b=N/5Mtd9MXI7bmS8dBjYfeVCZHd2+ccd+T4iv+vwrU5eNBIW9iwA6aEAv8IT0TIvZQm4fD+gd5Q/OZvFL8NbGjqOMGiUElwPGiRME9wCNzll4BC7J7qNUNupx9VOdjfXAxNFY63vZYWS5A7zZAaNd4WKUESZIeTnoswzyrxayoog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762512886; c=relaxed/simple;
	bh=GbYCIblRZKH7/U4QkVZcpYd2o4yIEdeSQYJGqNKsE6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FOKzXs4bfOH37ZdeXHTIf8suOwUZ50CI6a7202FT/4nYxS/30yFxzhpW2zz1Nbag8tgrWdzOtEhb0dMtznQDMjc4LY/41bnT4VQ64j8AQGORTVl63XwYyU1KoGMJQO2vpyjsZjW44OwNqZnVN2SNW3X7F3qTJqGlged9rjbc33I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D3ciq7sL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DooXy5w4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D3ciq7sL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DooXy5w4"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A74XbIv584077
	for <imx@lists.linux.dev>; Fri, 7 Nov 2025 10:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3IKVzBz5JQK8wTUX7NukAcRSdlW+wFpDRAPikZl4+E=; b=D3ciq7sL0T/1mqDA
	KQOUvXh3Mhxuk859eyTuTtyDlTSts27cCw5jo0Qy/Kqfi0+9EEgGjO78tdJgcjiI
	/ZYPn7i8YLL/cNB3YOhXlcFlNRonkS1KARKEuwJrURUm79wZUJENvHCzLGPw3vJc
	sS2fL7+89HTzvn+w8+6DMz910/EXVZ1KhlcmAk6+G8RfEVGfOiJfWEu9s2rqXdfY
	npR/UpgRmaHsmNeiItvcsNJ4uFfteDzCHsTZdCMFaDW+0I45vW7sXMrAK0mQkULJ
	PcBbv6BEOI8XYuVJ4nEOxTArWjAXQf/S/5TbwBToT9e+cq273Msh3ToXZlizm4UK
	z0AxXw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8yktjt2w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 07 Nov 2025 10:54:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8adc67e5340so21687185a.2
        for <imx@lists.linux.dev>; Fri, 07 Nov 2025 02:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762512883; x=1763117683; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t3IKVzBz5JQK8wTUX7NukAcRSdlW+wFpDRAPikZl4+E=;
        b=DooXy5w4qT+E93e/PrB6dTIR2sBe5q5ns5Ar6l67LlpNtuv34bExXx9ZKZSmBETqav
         5fVUH0snpbSRKq0nFGiqA8klEqNdT4wtDWQbbW5cZ7l4g4TKh7GBVRy+mLcjS1Y+bsN3
         8C1COhPU7USuiEDOKRbQR80osag7R4Zw2v+BQOAUNlFIG5YPZCazYaRAfKH9STYM/A3o
         c6pqsZPptyLKbFWivlf8p5xLSI/SJwKrM4Dcmggq8spPtu0BV+hS1/yvMuE3+fOI4U/e
         J018Zl1/u4CaTxtAJxO75al6ZfuSKwmRUl4WPvKmSPU5QVAhcbT9S2XbUe2yt5EW1+dI
         OucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762512883; x=1763117683;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3IKVzBz5JQK8wTUX7NukAcRSdlW+wFpDRAPikZl4+E=;
        b=JLV9SrvQe/PW98ebrLjBXWzOGEr0fbpuTHXhZFiDs2QJOZ2E9/ZbcfTVAyIOnyPFvv
         br66JwkZ45pTugR2P5+ftHYW8ZGK7kC92CBRYR2w4p8P7nDRUSnmn2BhxXtm/EsDtwPX
         PscVwaWRXXl5YRI9+4ewEZgfe0T+mHCgd2l0u9Dues3IZPpSGLFnlLqX4+kMgB3QkbgG
         FNs9JrgtCedLdOS8yYTg4nnUeg7c0YdSJREz9L5nc9q1iNVXp+vY6iaWLTKzs8zhff3j
         fqyrumZF9TbiqBAldjbn3bCuIHMWPyUMwuhteriFkyJVEO4k6OE5v8bk7yhmpmBcugL9
         rv/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWIFxSHuD+XF11P6cHaJSCXbKVbykDrpcD/doEsLupw177w7X3HojQcJ4Hx8lHjN/OWrTc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJDFEXgTZpsO+sc8oxJ7x12Nkm7qnipFBi/ow2OKl6wS2O3ozP
	3tcuAqZ8R5YuCACVAnUWBI0yl8sykZEHZenkNzADEetOD3CawgdZptrS9J/LVbhDNxXph8DO5g+
	FdgDZE4XEANn/5GWXju2jtqyxdSGQ3dh+Lyu/Eb0PbN2pK/DzvwrhNnQ=
X-Gm-Gg: ASbGnctF/jBQD1Ve9sj9uds1eMVY0IQh+YDN8kyqNP9NvPZQvZ+WQvsxKXxpZufool0
	azXQSeA/gwKSS2jTCfR55ZfUbWEM+V6mxeajV1pwwerUmwWoSInsNi5/nltONrG++bb+juu70DU
	RGiLLVPJzOknDZ3zpamjJzgYYUgYIq3BV9HIfoW6wiXbET9K1rRpHnV9homygDcrOxLgkHDsS+r
	uUwH+A54hSDwfbpzBQp1XMVh84qy721byK8Eav3In/3GeAm1dCn1ESEau1YFrr3EPsyvRo7hs9Y
	pfgf2x/eX+P5mLFdUc+0ThxJMY9OiHBk/1XLQZI54Mf3KA0eE+Wl1zBdw/6oOnjKWoy3Dkecvfw
	lm/OCySqM+wWkC/2CQZYGITjrfd6KI2CnlhpelvX4cpA8lKMVrC56NFl3
X-Received: by 2002:a05:620a:2a08:b0:8a2:a5b2:e3bf with SMTP id af79cd13be357-8b245297214mr216405085a.6.1762512882683;
        Fri, 07 Nov 2025 02:54:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFi7mPq0na085cioUOvqXq74YCfsRc6NxnJgSblNj9scHFLGnEvxVACu852vb4CayQn6idLew==
X-Received: by 2002:a05:620a:2a08:b0:8a2:a5b2:e3bf with SMTP id af79cd13be357-8b245297214mr216399685a.6.1762512882057;
        Fri, 07 Nov 2025 02:54:42 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa11367sm205508166b.68.2025.11.07.02.54.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 02:54:41 -0800 (PST)
Message-ID: <86df9697-af58-4486-93de-b01df5ba13a6@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 11:54:33 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/8] net: stmmac: qcom-ethqos: wrap emac driver data in
 additional structure
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
 <20251107-qcom-sa8255p-emac-v5-4-01d3e3aaf388@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251107-qcom-sa8255p-emac-v5-4-01d3e3aaf388@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bOgb4f+Z c=1 sm=1 tr=0 ts=690dcff3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=4r4FsD-561SDv7fJwu0A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ntmWPQGKlmta1-ZeJ_iYb1S44-X9AHFg
X-Proofpoint-GUID: ntmWPQGKlmta1-ZeJ_iYb1S44-X9AHFg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA4OCBTYWx0ZWRfX9hDBdNYQdAUC
 CzZ47XZubxSZC7dLAfAIu9kYSHFhPOcbHEEADCr1Z8Hu0PEU+TRV1nxWJGZhwoO0fshvNhZvZUZ
 3xiwLeU1/RiB2T5op6HwqZImpQFE1e1IB7uFOBFgxEZOeVThTdVH7xbAV52Z0sT+8hLyofDkUDW
 NskuycNtMwznBUHVxngwAKg0GE773QRJJifWzWMxA7C0GurD8z+ffCXVi//p+hyXKhiiu0WkC3E
 UoM6RwljU31WNbCw9q1nqcRdgcv7vDoXL6epIp4tjls9qJFZHWnJSE2fGfie+5IuSHTf6+/A4Bg
 madhKdLp4qgW+GpxRTxSv9PtKlpH02DVkLUiZPdc7F/psUov0u0q6Jv+tZBZgei3Te0ogDSTav6
 nyjrUkJvJLyFeAanVZ5wLt+LE2Py/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070088

On 11/7/25 11:29 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> As the first step in enabling power domain support in the driver, we'll
> split the device match data and runtime data structures into their
> general and power-management-specific parts. To allow that: first wrap
> the emac driver data in another layer which will later be expanded.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

[...]

>  static int qcom_ethqos_probe(struct platform_device *pdev)
>  {
> -	const struct ethqos_emac_driver_data *data;
> +	const struct ethqos_emac_driver_data *drv_data;
> +	const struct ethqos_emac_match_data *data;>  	struct plat_stmmacenet_data *plat_dat;
>  	struct stmmac_resources stmmac_res;
>  	struct device *dev = &pdev->dev;
> @@ -801,13 +822,15 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  	ethqos->mac_base = stmmac_res.addr;
>  
>  	data = device_get_match_data(dev);

This change could be made much smaller if you kept a drv_data
pointer named 'data' and called the new one match_data

but I don't really care either way

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
