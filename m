Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDFE31A05B
	for <imx@lists.linux.dev>; Fri,  7 Nov 2025 10:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762512641; cv=none; b=FBnvoxxgF9ML3lHy2AhYnLRqXgt4XKIRlKo27/WRQMnLzJaFoPPpUziZrUpLkIKLj436PlEJuHgEskHWmEez0+zHCWk0iLugOe7qKbpi9xDqYjK/ZqZCr6lO9Oc68YEHakk8ztDQS8v0lAcZKT7LlPNu5mo5b8FScRrrfDFi4T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762512641; c=relaxed/simple;
	bh=H38bo1o8KZgtlMyhOjvzTVZdaXQkA/mCrkUJu/FTaCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rpebp/Az8nLhYIqB+83l/TiS2vQbywojshr9AUOv1eSlF6dkX/2Awv1LzdLEdlJDiGGQHdDSdqqzU9kO2vF8yJ7MW7FjI4wmrn1THO9no15WDOdK7P/uUbUU8wu3GVdmzY0SLWb7Ls0e/F0E+7X3hhGPi88xJYVMgAaY6GFkmd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B1EYSsnG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cdW5Zx9X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B1EYSsnG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cdW5Zx9X"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A799FiP1709754
	for <imx@lists.linux.dev>; Fri, 7 Nov 2025 10:50:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K+LRkelT4LAUbuxVybXtmeX0JCfHUQudQjQlnzvpOmA=; b=B1EYSsnG47lGPxvn
	zAiOxrAmz/Wz/9UGbFmZFaJUsrfmtRJdHGCRNLO8nK188PAywHZCZ/Czv8tlM8ve
	CGTbIUMThDuTRN2SNFnJdG0FxRGnW+6oQLaE1SUNcHDxkH1p3qM+XKbF6+ZvwhuC
	2xSpWB1caS7pSkxWxhHPfYew/g/o0fF2xf0FwgXZJ9fl/vku5K0YWUR2Bzn1GvAJ
	SLreBdufu7mVgG3gE+Go0RhRFhZFyzFhMp9WBxMVB5AfBt5uh9btC4+Yx9NldHxh
	YgAVAW7chm0tTXTd4tmqkRL7pByvT7vcNlH8wK7Ctms8y6dh9igwU/62YLoua5H6
	vkifZg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a96ue1jbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 07 Nov 2025 10:50:38 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-87ff7511178so1399036d6.2
        for <imx@lists.linux.dev>; Fri, 07 Nov 2025 02:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762512638; x=1763117438; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K+LRkelT4LAUbuxVybXtmeX0JCfHUQudQjQlnzvpOmA=;
        b=cdW5Zx9X/F5zFg774qcQtme4/lAF2GAWd2p/FA7idBWAivOSYwTW3UhMRufQdPqEz3
         IQVZZX2QYTnVnELFIwDhc0eSHJ5Wuw0OVHJPmy1dT7JWJxDj3jh53/jCwRawvV6m6Cmf
         /UAJd1aFGbzCXALQ+5BHBmrhSxKu/McjTVu28UK/EqOmnL7r4AzDQnfHBnD5OmuDL4ma
         uONyP7qp7LwLb2wllrkbnSFZLz/4JwWyyxKXYr7E07UUpzG0L+VCM5wgNUjhyyBEwOMR
         osdqAq1eOoLcrumfDh27mRwxKaA2fZFMGTH0V7nM3ZRMm7vBjV/AwsuwnxSn2GsfwurO
         hELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762512638; x=1763117438;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K+LRkelT4LAUbuxVybXtmeX0JCfHUQudQjQlnzvpOmA=;
        b=bMAlqkhBXqasCXLULcHnmzMNNXSBIQbLOnPFY4gfY47rlX03QuGAUYhmXyQj71a0gv
         bxYH99S3RWtMFlS2Tdv6g9LIz9Zm8i3E+U3LMAqIEygrdes6C2fizJXjdH1Jj0g1gX5U
         fzSOSXYS/iFJlUgyP79XfrBJUc2COpum9D2U2az5sbghRNys9fHUd3YZf1iRzL1CCLZ0
         sRPNfbxqG3gCxadWjv3Xlvu9GC406Bsg5ovr8eQOq4k7qNIk9ni19JvcztSmSTY+MdJg
         1LMWxfgOsM4CKmJztET2LLlWz7T9+NgByU3tMW4dGZgY+D829xcY2U6+BMKwxX3CPY1A
         iNGg==
X-Forwarded-Encrypted: i=1; AJvYcCUcF6mJBJ9NUIPymulgN0veBWS8a7v9kJOpQ8dF5+ECOaYr7vW7LRAwlplt1zPhginRpVs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2qgohjA83ycYccFRXzLLpoYpiFDlgvoIy8XamIl+pJ/ZXQ6ng
	h2/F2lZ7TCR40/tHG54sjQ4xFalowyekIQmj47Uafn4bSr9I27JOtsKnraIvhbpI6MCX73yegk3
	+bANHTMBJKBYoYgqgHpaq49OBL2OHO5wtI8JK7DLHJ2wGKtXXaw3UxBE=
X-Gm-Gg: ASbGncsUmCqgmfLf9VFOBrLHrCzsi+a3Nx4M1kAaFiUN2Gr6oqgTT9S4eNOaV5vSjq/
	abMp1f3cBBzm8T3eTHh5vVvqRf+EDWMk0qi9wmQiX/ikV3VA6eOJd7sBM2nBMEhmoN2S13oo0Kr
	Rm+de9+mfuuJ158GHhcAbW0LcJ8vZMABn+bfk3ew33rOR1u3UhVELk8I587KlQzo8DJL+qNKx+V
	6O+prxEt1yb2eObGy+DF8AVWzYatb8bNG8oTeTsdMjixI5mnZcBFsr5d7iBHKH4dCraZ8GgvCns
	2750BtDN3YSzojHxTEaAQl14WSTq58yXSUtBgmbQu4VWzGHeWYvJSMEo92etMJeMgowCNhttIG2
	SuNYyCujK6KCNjlB81BmrNANt8uluA8wmUR+5c/N3B+6D/fKw4QblpJS/
X-Received: by 2002:a05:622a:411:b0:4ec:ed46:9268 with SMTP id d75a77b69052e-4ed94a41994mr19484941cf.13.1762512638061;
        Fri, 07 Nov 2025 02:50:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECQ+rghHeVgkMsgvUMsj4lxwZEJlBOwE/naarHWq7nH8xBHgoJZQqQzG8SkQO4ghE/Xbce/w==
X-Received: by 2002:a05:622a:411:b0:4ec:ed46:9268 with SMTP id d75a77b69052e-4ed94a41994mr19484181cf.13.1762512637527;
        Fri, 07 Nov 2025 02:50:37 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bdbcaeaasm219104466b.1.2025.11.07.02.50.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 02:50:36 -0800 (PST)
Message-ID: <9805b902-95bb-4b18-b65f-f6efdfb6807a@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 11:50:29 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/8] net: stmmac: qcom-ethqos: improve typing in devres
 callback
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
 <20251107-qcom-sa8255p-emac-v5-3-01d3e3aaf388@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251107-qcom-sa8255p-emac-v5-3-01d3e3aaf388@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fYKgCkQF c=1 sm=1 tr=0 ts=690dcefe cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=Xr3OHDAqYAD4YnyFvXYA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: EW7AsoDY0FkoYN4iGs3wULx3gaoNRzqV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA4NyBTYWx0ZWRfX/4etpI9xFf9m
 9nAQTtGho3gOdYZCu8bofMUEhu85Cm0PEtdMEFaJp4JsT+j2rp9A6d4RE6UGSySvoNlo/TlSPkk
 VwehiO+JSdd85YqOZQiZJyLXjH+ocw2J0VbS+3kyzKXmd/IlGxB9XZJhWnaLveTd6XUhYmVYdcE
 si1cQlu4weKwh/tQluZUDPZSgf5M72SNPSy/cxPosMbUBeteFnMdaNhI9KZ8ec8kzrrRaFdT2mq
 t/98/DJH3mCSiWJ5Cv130ABtOh4q+TIWVKkmqOvGEJg9vik4QRv5ntKPq0kZCeUTIm0VCx+U6aa
 JshPbvQG9jVW5Kq2aYSmdOySmHMh4yaVChMCTylgaYMKSebhWrin79xaJagNa+o4/4rRsmGfRP4
 CaZK7R3pL+e9BMuf8vAEgwnNjKHA4w==
X-Proofpoint-GUID: EW7AsoDY0FkoYN4iGs3wULx3gaoNRzqV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070087

On 11/7/25 11:29 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> It's bad practice to just directly pass void pointers to functions which
> expect concrete types. Make it more clear what type ethqos_clks_config()
> expects.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 8578a2df8cf0d1d8808bcf7e7b57c93eb14c87db..8493131ca32f5c6ca7e1654da0bbf4ffa1eefa4e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -726,7 +726,9 @@ static int ethqos_clks_config(void *priv, bool enabled)
>  
>  static void ethqos_clks_disable(void *data)
>  {
> -	ethqos_clks_config(data, false);
> +	struct qcom_ethqos *ethqos = data;
> +
> +	ethqos_clks_config(ethqos, false);

ethqos_clks_config() takes a voidptr too

Konrad
