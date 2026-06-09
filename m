Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EBF282F1C
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 08:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995238; cv=none; b=je0F4aWXHTGDL358mNV4D7gqmWg8YjhHJMLGlYBkO2bVfprFvG9rkGEVQAXYFRfAioyQKqUm87Y+5CD15Vqhd64+gfdpdTXHe9RD2F6CYRxbeH0dXIWnScSXjoD6tJUrQVNvHxHM+Mbyn1m7KkizKVYP7HIPncYxS1OFdNeFcIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995238; c=relaxed/simple;
	bh=PeNlJwYLmznoeivJvOkcwrdTA7OLro16oPrB4TKgDsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kV8h/ha+/7LtT+rk3Mrgj0I1XUmAfajFuKCySf5nxOAzQDzPtQlT3Hw4GzU6k6XU3SzmAjSy+mDG2v/gXqQtuQWYUpJOPh6ALBGu7qA0KD2pOyPxFy2HlchW4qH+MYA5nwaMhNI5kOkwlgvEdIjkEdrz1mGsA5PRvMbJK4Jm1HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B79BStWj; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B79BStWj"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-bed4f2f0898so663479166b.3
        for <imx@lists.linux.dev>; Tue, 09 Jun 2026 01:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780995235; x=1781600035; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hZrIRgISj6MusU5WRM9oV6xNWhYPCm9zSf8D1irSjCY=;
        b=B79BStWjx4lC/zL6c/1iujrrheVhKl89Kg72nbm4qOvhcrMiNMfADB3wjYA4tRutDP
         b2J4awgararbqe/R+vOXnF9+yetKb8GmUMXaB8QVEcUgIlZoKsVi7nv+N09CtRQIjzi3
         ss7RRTbt4NTOW3Sv7z1ohQ1ynAiRNz4dfS1q7Z2djvxjb9WMQXm3ViAD+qhtPyeGWc/v
         Iq2XUNbxk9bQgqKLkzVJlPICFuBrLBtsu0TubeMjPymOUIkVrkbLt3Nzz7gkL3nN304B
         Uu5poH6gmsxp948P+njAp+PHBylWERPuFr7ipXY5YVRIbXccKE7U/MCwrsULZXDzLePo
         uIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995235; x=1781600035;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hZrIRgISj6MusU5WRM9oV6xNWhYPCm9zSf8D1irSjCY=;
        b=tAtd6Y73PrskvNZwZ2Lro30/V8v9ebwGvlN5H0fdvAHbV4dcdymQYDxRjdeEpdvpWf
         ZT3Rq7OmExioJVovPJEQZgKD9OO53qbIeWmE4Zkue5Wd/YbUMT5ht0UJ1+We2hXMS3Db
         Xt6wAKbpnLDOT8be7Rg198JRZEVh2iNv8zvS+A4LCGbIMGvsBWgQsGwtiMByMtFAl0YM
         /crk3lzb3XPfR/DGJYC+tdesZbT8nMcxzoa6Fv1nuHLEgex6gDdrMVtYECCg9gtnlqxp
         QfcMRJyH7OGY6l6KoU/7bJiyCcjZy9cDGWoDGvg156AjE/CdPpHKjyIXCkT8b4mzY6uX
         Wn7w==
X-Forwarded-Encrypted: i=1; AFNElJ+CMGwhiulXX85vBDNhmCZyFYsunBydhI7KLPz6T/EOAuHKHzL3a0r2jvOPE32E2MS3Z7Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/y+DqGx7oE+vjo7q1s7Ovc3pbgoZD21QGnZrq5/YtfoBZhFwd
	7MJ/YQ2B0M/vqiewabimO3VUVEJ/1GonI4rrEN8/XfYDXlph+BrJNdY+welpjUyXtd4=
X-Gm-Gg: Acq92OFb2Z7h5YZvL19YiPRuPBvJQEt1wo/ckmInfV0GCpQSiR/458bkeVJLHq1osy6
	Hpm9Z7oMjhT5O5yHUVpDRcCV4B4vKAK5apL+Pzv3zs3GeM9it1tYqM1T7kN7iVFnW64KVqpO6i0
	nfsEzCGvbe0DRt/vgExttdimdZQv7/WsB4LC6tNqLM9t+GvTmQziUj9M30mCloZzGEOeaPaDsnp
	sb3j2gweuBfdNBeMcnTNLKB7cOrziQO7gkIec3UkEPQv5DDxgTUnShsNveXbL58IT4lRl5Lqk00
	62QmrAzfw3pQDZy8FpgaIBdhKYmvFRwa1ur2nDR+6KI5e1F1wHX9bsS6lLqMMhri7ywXc2TFtX8
	uIax+24ZtopNWB/580JoQ956PmuThFpBCZ+wRSdI004X9OTfbg5N9hxg9+Gs2+R62/j2c/XQlhW
	YFb7mr1UegvFcqDcLaFf9gRyPIOW0gupbQ8UoxWkb8/vtMuFj3zdMtZ9A=
X-Received: by 2002:a17:907:1dd3:b0:bf1:1df7:3e50 with SMTP id a640c23a62f3a-bf9365c6399mr65159966b.3.1780995234797;
        Tue, 09 Jun 2026 01:53:54 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.72.26])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0553040a7sm998205466b.50.2026.06.09.01.53.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:53:54 -0700 (PDT)
Message-ID: <d56d7468-a3e2-43dc-967f-63066bcaf1d6@linaro.org>
Date: Tue, 9 Jun 2026 09:53:53 +0100
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
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
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
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260608-shikra-camss-review-v2-3-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/06/2026 15:06, Nihal Kumar Gupta wrote:
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


Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
