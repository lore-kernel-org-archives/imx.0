Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EA031B833
	for <imx@lists.linux.dev>; Fri,  7 Nov 2025 11:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762513815; cv=none; b=jml4zWDVr3tpFd/0dxZ6Br4xJuVvCQeHkSMo5hH5+oKt820V/WGE6fYQinZO3Lrm2HVQrfqUp5HUKje15ZvBb0cG36siT/KNOljH9hhfg//W1wGa5wOa6X4Ef64U8TQgmH2afvePSQV+p+5reMrJmkfhFOqWS/1rpWwTcTnmb8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762513815; c=relaxed/simple;
	bh=uvdSLrRqeSgJ29fmx5TFOH169Lf+Eo9jUOrniAkdVq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bj0CU3KjlbkPUwM/6QJtWgu/JY7xN/SDe0kSu3B29Y1bBsaDhve1sJIMbJBJQDz38YgmE8zVfAuWnn3XxayQcfAfNJQpRzS9jKnWQYcDKRoWd0XpWob0GwtQHu4ESV3W0eD8zJkzHMJPg60g9bKTuCBo1I24o8EXikGwUrFMFHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kTVL2uNA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dsnWXuLr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kTVL2uNA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dsnWXuLr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A79EE2n1713270
	for <imx@lists.linux.dev>; Fri, 7 Nov 2025 11:10:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vP5CsM5g0HeHOTSJ0OMxMqeLtmj8J5VZdu7ouInriPk=; b=kTVL2uNAU7+oNJ0t
	NR/5a4pLbFGYY5wf72iiXu3Aa4fetjFKQ9zdlH8oYDu1NewO8kjuYZOdjhXjdvUv
	bf9H5CrpXtD3FxEPcZGGEe/I7iM/0aRRpxXoXCHoPjp7StVXZ72j9UVDYvOKO9PK
	dM6P/R36KX94fYH/c+vCqaqes2PvZ/LrkNM01vU7XAbdqPBV6FVSt3SDB1O09pk8
	SELlf5XSIHWr6/eEojdjY43BaCIsGJtdJhRfz412+r7RW1eoyiS4nL6TQwJhxIf7
	B3ni+nzSCZoHdKpoDZxL3P9Eh96zOXP7YNsyWVkUNd24P1KuGRuBYPvKnw4TQFFq
	CgY3uQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a96ue1ky5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Fri, 07 Nov 2025 11:10:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed73c9e3aaso816681cf.0
        for <imx@lists.linux.dev>; Fri, 07 Nov 2025 03:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762513812; x=1763118612; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vP5CsM5g0HeHOTSJ0OMxMqeLtmj8J5VZdu7ouInriPk=;
        b=dsnWXuLrCIKyrG3NYg/3t/Vw4uD5h99fv+l00ePjW0sGuU3VdbVZ6bsT0JGda7xKXz
         5R8Jdsd7AN1qFL5aLTZ9gU+9rwXgtMTee8hIR7MyZeqxzYueBFMZui1gGxh1HoNUlYzD
         v3cC3DCjt9tGusJvRVCZVlo6i9REQctVV/m2q3mlm5e0wQ1UGQaFMzyksQuqTkUOtK9D
         DKGM7A9DJ9iyjy8IoT7JYfbRJvy5lxN1FX5O943KNH/76ah8Tn5ssduF6aaEVgMROXR2
         XdM0EMSUjztq5QxEGE5X/1TMA5AbEoQdyJT07KzLRwzgQJ0CeMXAfxZ/D433fYcUiaTw
         CNXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762513812; x=1763118612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vP5CsM5g0HeHOTSJ0OMxMqeLtmj8J5VZdu7ouInriPk=;
        b=imSmQJpQuXc3RYcxEVUeDx/mZQvveGXk2oWGVXQVw27VAp++zdWHaCaNjp3tqQHe3u
         WEW2996U5Zu3MRUjznVRjcIzUqWKfpvezntnxGWez0ryqyXnxQeY1mmfryYPXR8aUYN7
         I1dNy38UFPDc28MqSZHSjGvgMuGSKhT2omtn5+oA+HxUO/aPeHC0JBJRWNlKQneNENSU
         NFlKBQx5hCTBOu8sTycPIqqu3ZyfiezkC9UQf5wVv4oRZ6Mgql95N/IPijSFVRg2mkaP
         k83vSPBv/upyLEsf0JAgBZMZXPq9JHYSb3ADUu945jE+gjGEv5YPblN8D67HlEfTzL70
         XNjA==
X-Forwarded-Encrypted: i=1; AJvYcCWhKoxuu97Gs9E7Jeah+Gjs7qTfxgl+p4UjA+Ng8BTyrJXI1V8g8bs15X04P0IM87DfRU4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyo9crkGOw+Jb9Ctz9dFky9ne7+RV0WjmCQ6j8Bq973bB1F4eCo
	m6o507ifJ7F4E3ZVYOE+ZauskPbX1N5X/OTfGPzj6jr4HPkwS8GEcLSf8XU6cEBLh31YkRkeLXw
	ovYwmn7mGDAP7Bk4UF7qUC25cJTZSTPinddBnXRk/81BHEpzP58huvw0=
X-Gm-Gg: ASbGncuYKFnGaPfgz0jnMUx+2gmg3D26Idu8gfqw/bTa6IQdjMnypi0qVKOX8eII7QK
	rc8Wmx18Oy/vW35ZaV3JfNWKG+mVO5JC9eDy8RYuGB8rti9ZK1ko3Xkiro1HOmLLkHBJW33dZGb
	7YJaMd/TvUczAH73q0/rhrGCF5mrlzBWaXUJ8SPfp8mfMbll0/eO4WJjwbvxx0a9y21OIq1vbn3
	jue4DcEo1XeX6EypCpFzzm/bf77lZrCBYiEPlUxyeutK9ff4MxkIQWp6AX6lYD5bCaoX8xopbcq
	m6W7I0wGmtTd2nK6NOMTWCACm20Es97PmFV/qjLi+ENVuuOnkEseZxhEO9vk6Q5Tgr2QcJOjcbX
	OZA+J5WRm5QM/zOpcNn8Tt3ndiljd0p3jydyZSM+K5ZZmAKVLPte9XoJD
X-Received: by 2002:ac8:108f:0:b0:4ed:94e7:97bc with SMTP id d75a77b69052e-4ed94e79806mr13951831cf.3.1762513811877;
        Fri, 07 Nov 2025 03:10:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+oSsE67XF0MhznsqL3RMh0VmCG7Jg2iUSdY+a5r8YCwj9SfReJWThGgi5T1OFd6OFN1sfjw==
X-Received: by 2002:ac8:108f:0:b0:4ed:94e7:97bc with SMTP id d75a77b69052e-4ed94e79806mr13951281cf.3.1762513811430;
        Fri, 07 Nov 2025 03:10:11 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf31286esm217650966b.21.2025.11.07.03.10.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 03:10:10 -0800 (PST)
Message-ID: <5fea976c-a047-43a4-a062-fee1d40447b4@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 12:10:02 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/8] net: stmmac: qcom-ethqos: add support for sa8255p
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
 <20251107-qcom-sa8255p-emac-v5-8-01d3e3aaf388@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251107-qcom-sa8255p-emac-v5-8-01d3e3aaf388@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fYKgCkQF c=1 sm=1 tr=0 ts=690dd394 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=hDgXwu4zDwT_Ch0b-w8A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: wIZWQhZdKb7mn4fFvbQsolh_vOKEUtNi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDA5MCBTYWx0ZWRfXxA87oAgGwhay
 O4UMjcP3mPyEHDuT+ZCE3URwpgMaKlzllfHs99eMXG1cg5QC8CSM7kFVFMcDEYgtLjIZwCCSlMK
 LW2m6nACH4txctWKoe3cT5NsqsA5zbQ5c3xN6pPgSBVq98XuNbH2lVWjXtmxesT1ZOqSIvZoS/9
 NZhi7qzq8nDL9cHL8BCLayCiQmqTJCusVIyNXlpGTeRiFZXdQnT1iskRcT09JoN8k6IBdKihz8J
 /ytxjqY+iYLlkyY+JyZtSTe7XSN6Wan6fAXYu7PjTLnb1ptK7LHxSbdPnSfc5IBUiAWNL2G3q58
 PlDZjotMBUvplLMecKQkB0GBZciDp9CpOoox2d9pUXyIzJSe7Z0gYIY8aWtcW7m2n3Bp3v/lrEk
 48zEbx4xxAQDa0EO/nl57e91ZukPVg==
X-Proofpoint-GUID: wIZWQhZdKb7mn4fFvbQsolh_vOKEUtNi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070090

On 11/7/25 11:29 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Extend the driver to support a new model - sa8255p. Unlike the
> previously supported variants, this one's power management is done in
> the firmware using SCMI. This is modeled in linux using power domains so
> add support for them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

[...]
> +static void qcom_ethqos_pd_serdes_powerdown(struct net_device *ndev, void *priv)
> +{
> +	struct qcom_ethqos *ethqos = priv;
> +
> +	/* TODO set level */
> +	qcom_ethqos_domain_off(ethqos, ETHQOS_PD_SERDES);

dev_pm_opp_set_level(dev, 0);?

perhaps with _index?

Konrad
