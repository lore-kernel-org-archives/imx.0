Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565E136C0AC
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 07:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251017; cv=none; b=ZicJdNJcHaxII9JWoBt/nU3zS9OFIuWScFoK1JtleX8VRaU1JgE0BJEzoy6Sl2rvZDxrw6eSHWBwMUVwuxmaQSuhOA+ShQ+8ojXmHjwO0dWobtXCP7nCAWPuAd7TYOXe/9Sk7qVA7bDsotWYcjbRvLBm2t++aQRBQ/K7yAlxmY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251017; c=relaxed/simple;
	bh=ojfQXHezIap4Q2ED7Rej+tWoCJU08h2r1pKMtJQAkTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ADDsH7rzu68kh4zPX5mxTOmEbdHp2XQhNLS4tyx8QjdDbQN6swWCe/FJUxBf45DeKGUtSaWheNvRXaZsTmVAdHyssag6ptQsJUU6rT1tRk46qHWo3RM3Xwli5HPcLGumzvX32l5MLRIFovZzb6AAFPaj8f2AYogZ7HQFdMocBwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZrTT2ZIh; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZrTT2ZIh"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aa679cc2c9so94800e87.1
        for <imx@lists.linux.dev>; Fri, 12 Jun 2026 00:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781251013; x=1781855813; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aLIFEbFe2aJSbSCxVWR8no0e1CK686vhmp4FsclPvxE=;
        b=ZrTT2ZIhJ0D98ByJqNbvT7qvfkoNZiS0QuWTQNZpMSW7Ut+auU9E3JHfgVCOmlL+54
         y0uAf6nnLaT+1nuHM8+6Ja8eGRHqByIGk2P625ZMHDqZeh2Y+MSQz3R/E1XoEU7CBFUp
         BAE7IUzh77q40ZSkqYJBbyeUg94rCF8D32pIajrUiSUHGbWlDIcJYifpg5ROwvbUeCgF
         yK5LnHzBEb500irPW33cZaYce7PxEDbrY9fcL3C0c4sehgFK8eqsDuagYtgQFYiGTtRV
         +0WOkHqFHe2NLKZLi5iGctLt8Dlf4mayM1QbKq4iVQ0JJrQfiZKdprs6EMpsuz2+DBSH
         XRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251013; x=1781855813;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aLIFEbFe2aJSbSCxVWR8no0e1CK686vhmp4FsclPvxE=;
        b=tFMqKIQrhlehCSklxQ7QAXdZLUeQiRJkk1GTzR8YC35cksexRcue/94RdNVwt5KlGI
         FkIvr3YHOSOnOIJ5lZjFy9iM4i1rnDcBpyKVIYjg9LjYl/wj0jrEOnxWdDXCo0yvUdxu
         5yr3mBoAamI3c69O2aMkOYsp5dyiNtdcT3zs4aj6BA1n/lrWsBzqs1qmef/Pl1UVLB8e
         NjkYI44mLioQL+GHRuUDNhP3BuKG8k2s6gPKEtDLhuEtiaa+LQBK1mwu3919BOoMEt2U
         ObpMPoD4WfhJ4g+T1knpE8oK/HgeBszBgCrtu433XxwQxqFlFVs/lPnXc16Hjq5kVzrh
         L4ng==
X-Forwarded-Encrypted: i=1; AFNElJ9TqO5w3KG5d5fCgCNhK3dUiaAz0hVTsO28MUifl1MTKwizoMjau89R1NKm+Jez5P/heUk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNEAgoUl32HRxNjDm+eW8WLi7laaC27W0uMTHg9XTewrb1yUL1
	DXZ2lZLgSPh0q1J0ZBfnaa/XnMJ64ARKBA8SWtYQHt1wkz8bpzwhOHEE6t4pE4jON0M=
X-Gm-Gg: Acq92OEYVOngDEfx5xMBQwjaylkwVYYj3kcZmgCduB839k7szA06QBE64/bVwYEy0Kk
	qo19kBlGL/2EOqDCDoY89DaLTYpVx1AFvG8dUzlkQplCvE9DZzRgJmLtDMCfkvc63Zr+0TE1m++
	wA0alzpvXk/IGNBtMUo3zTHhwI8zPGr3Qos8xfUe53dlsfTjEa2wJH7hoT8BlrHyzzHcML3ClCa
	WQy8k/VXg6NJiOjhBrAmLyvV6+YzO14PO9y9Xt3LoXmpxCbR8S+A8dOE8uIX/EsAQ3hbp1IvJRw
	aRI1nLKDV1OjSqPhDgAsukZKbPaSlSJzg4GkM0ubGB1QTFNaeOeDVVA1V1jUGBaGV2YzWu9f4VN
	6riTvt3Ke1jJ6RHbxf6jNL5pTLljT/HiQkPx3ZfYZQBew4OFrZTIVNFlCh/LxjLwzXNLE9dJETF
	FvLtitIByMc9z8hdTRSXJuN2t/WOxPLnlkXQnWTZEGbeswkGhehVXPjEGpKh2sjgoWZy/Gs6gS0
	CHrJA==
X-Received: by 2002:ac2:414c:0:b0:5aa:635f:7c08 with SMTP id 2adb3069b0e04-5ad2db710dcmr172654e87.7.1781251013504;
        Fri, 12 Jun 2026 00:56:53 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e161f69sm329636e87.4.2026.06.12.00.56.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 00:56:53 -0700 (PDT)
Message-ID: <3ec2bd75-4d88-492e-a8c2-b21000ef2afc@linaro.org>
Date: Fri, 12 Jun 2026 10:56:52 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] arm64: dts: qcom: shikra: Add CAMSS node
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
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
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-3-ca1936bf1219@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260608-shikra-camss-review-v2-3-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/8/26 17:06, Nihal Kumar Gupta wrote:
> Add the Camera Subsystem node. Shikra shares the same IP as QCM2290
> with two CSIPHYs, two CSIDs and two VFEs, but does not include CDM
> and OPE blocks, so only a single IOMMU context bank is needed.
> 
> Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/shikra.dtsi | 99 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 99 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..b93ce4a92a998ea5d9d4268d2fd46030fafc4084 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -604,6 +604,105 @@ opp-384000000 {
>   			};
>   		};
>   
> +		camss: camss@5c11000 {
> +			compatible = "qcom,shikra-camss", "qcom,qcm2290-camss";
> +
> +			reg = <0x0 0x05c11000 0x0 0x1000>,
> +			      <0x0 0x05c6e000 0x0 0x1000>,
> +			      <0x0 0x05c75000 0x0 0x1000>,
> +			      <0x0 0x05c52000 0x0 0x1000>,
> +			      <0x0 0x05c53000 0x0 0x1000>,
> +			      <0x0 0x05c66000 0x0 0x400>,
> +			      <0x0 0x05c68000 0x0 0x400>,
> +			      <0x0 0x05c6f000 0x0 0x4000>,
> +			      <0x0 0x05c76000 0x0 0x4000>;
> +			reg-names = "top",
> +				    "csid0",
> +				    "csid1",
> +				    "csiphy0",
> +				    "csiphy1",
> +				    "csitpg0",
> +				    "csitpg1",
> +				    "vfe0",
> +				    "vfe1";
> +
> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&gcc GCC_CAMSS_AXI_CLK>,
> +				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
> +				 <&gcc GCC_CAMSS_RT_AXI_CLK>,
> +				 <&gcc GCC_CAMSS_TFE_0_CSID_CLK>,
> +				 <&gcc GCC_CAMSS_TFE_1_CSID_CLK>,
> +				 <&gcc GCC_CAMSS_CPHY_0_CLK>,
> +				 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
> +				 <&gcc GCC_CAMSS_CPHY_1_CLK>,
> +				 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
> +				 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
> +				 <&gcc GCC_CAMSS_TFE_0_CLK>,
> +				 <&gcc GCC_CAMSS_TFE_0_CPHY_RX_CLK>,
> +				 <&gcc GCC_CAMSS_TFE_1_CLK>,
> +				 <&gcc GCC_CAMSS_TFE_1_CPHY_RX_CLK>;
> +			clock-names = "ahb",
> +				      "axi",
> +				      "camnoc_nrt_axi",
> +				      "camnoc_rt_axi",
> +				      "csi0",
> +				      "csi1",
> +				      "csiphy0",
> +				      "csiphy0_timer",
> +				      "csiphy1",
> +				      "csiphy1_timer",
> +				      "top_ahb",
> +				      "vfe0",
> +				      "vfe0_cphy_rx",
> +				      "vfe1",
> +				      "vfe1_cphy_rx";
> +
> +			interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 72 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 73 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 309 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 310 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 211 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 213 IRQ_TYPE_EDGE_RISING 0>;
> +			interrupt-names = "csid0",
> +					  "csid1",
> +					  "csiphy0",
> +					  "csiphy1",
> +					  "csitpg0",
> +					  "csitpg1",
> +					  "vfe0",
> +					  "vfe1";
> +
> +			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
> +					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
> +					<&mmrt_virt MASTER_CAMNOC_HF RPM_ALWAYS_TAG
> +					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
> +					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
> +					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
> +			interconnect-names = "ahb",
> +					     "hf_mnoc",
> +					     "sf_mnoc";
> +
> +			iommus = <&apps_smmu 0x400 0x0>;
> +			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;

Please add an empty line between the properties above.

> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +				};
> +			};
> +		};
> +
>   		qupv3_0: geniqup@4ac0000 {
>   			compatible = "qcom,geni-se-qup";
>   			reg = <0x0 0x04ac0000 0x0 0x2000>;
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
