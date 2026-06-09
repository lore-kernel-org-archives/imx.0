Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FAF3DB996
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 08:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995441; cv=none; b=IK4Hm1jpOrWjVuYPcar5SMxDuRFz2klH3VOkA6yraQLsSCK10YPCcNdDteLeOQORZLBpW4TVnxqUTK3KNyye415DtP3ENuKLsQ6blK/lJ0xKY5dRFRjcm+ZudjWGw88nZJe/sl6LeaG7S3xqssPrtpZDZ/3PyLvNl67fk0fAYPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995441; c=relaxed/simple;
	bh=zZCsXnjVimwX+u/Cp9VUCXkd7AOaMc73JPe7POemOaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=erIIuQFIhCtMPQheMMk6gxxKe3C4m0vnRYd9XNkrdfvD7XOcNq7TbVnDPR0avXyEtpJCbva7oJiKNVS1jIqxX+z5o+9sVOQEsMGDN1sz+WAzA+ubBxIAMqE4/z9kE29TYuJVKWHMixHtuwuWUo58LPFAjdTHlBcByNFyQ/IthOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iGzfCUVa; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iGzfCUVa"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-68bfcf11050so9607951a12.0
        for <imx@lists.linux.dev>; Tue, 09 Jun 2026 01:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780995437; x=1781600237; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FPwdVwz7ctVs0k+br7o6SIlRqfvmba+MdXedF8Oh3cc=;
        b=iGzfCUVao+2M2P8urlLuwwl2PPBybv7JzY77OMCON0f1hoWE+8JTI4xePpD7Ov/Txf
         K194WzqW/PweWssa2rxvEcC+bajg7/iMeit5v6EhuVAhGexmyATaN24XTjNZNNyV1INv
         evwRqoW5wDJ+r22rjM6hwzy2R25WHRInV7UTFUoW6N7GcmwtfBSlaXImkupJpuqIFSff
         60rfPSZlzHOe0Gu52GQA7JKXlhkrlqE5mIIgyYe8L85XBz1WNqV1l7jW4+9BkwjErFNl
         Q4mHHy4bWGFZ3ltKDDRQctHnJmXdmFKNnmL2vbTbgXKJGrFfTefoBwZru64PfnhXMhqV
         zL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995437; x=1781600237;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FPwdVwz7ctVs0k+br7o6SIlRqfvmba+MdXedF8Oh3cc=;
        b=ELupKTHlTHfzfyRVD3w5HQnlCjUmM4vWIqPcBGR8tC8b9jTCJpBuMsJ2b0YZ9d3b08
         d1CZE9C1NqqheTqouUbVbKbpan+aJ/HHJN2k786xOHwdDMg51rCCqZUOo/si5rubedcv
         ZBv/yrCUWptO/E0yuLT8h6i3gYTg1XgtRVi8LXCrguNLHo+d4te1/2o89oHOMlzueXru
         ckDuKP4uCOZ1Hhn6pUCUzZTroDU6LCTap9/1nQSvD3J6i6Gx/9I3596euFkKqJxaC7Yx
         wDJozUT9Q1HkiXEJvh5PVbhd1Bkc964pohbioCPn+BbTPmaJ1O2onDKG9WrLxO4iCYCy
         /a/w==
X-Forwarded-Encrypted: i=1; AFNElJ90L/sIMoQa9Q/5QjdVNU7otgvi95meoHEspb+k7uiqguziGmW4oFwjJjT+Zthd03/hcB4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCJLHh08kUajJVy3fkNkl4PfAUnEOym64Ge6dN1l/hIJ9KAJy3
	XS5YWOvKXtrXQJYJYxUCDZNFKwoDLoeujXdsha1kKNDJ3MIPqdJ1ucReGTFoKwXtPMw=
X-Gm-Gg: Acq92OEkVO7GfYhTE7K6PHTp/yNdJjp4A7xJ5LPSCmNR7wf2iztqgDq3brF0BgW0Awh
	HguyO+jVhp/pVP53pudGvpZzBTwKydF2Zc2N1OJVyXjkmdl2bZUuL70O+8Mp3K7imqjd6mrCGU4
	CTbFlN/Csu92epKHK5j4QpNYt01HkTLCxq3uk30r/9f95HE7wgvdysT4oc18pUXYI2XxUpfkgyJ
	HtXucfpPRfKCyR6MYGSlexUu37IyQUdnzGoXsCjgcdw00yZsh11scvrlT9iLFqQe4FdR2jQn3JE
	XSI72KKM0uBKw5fxCxIFADvqvyzNlGbzEfyl84NlwckPxYdYkJhXMx6VnB4o+xmCwaMQun57BL9
	ECBP1PAzshe+1y1uatfquUHU1fFdmspfF8efAW2Scn31HeoTKsVZAxJBiYIU9dwqYKNfvj6hlZQ
	ucP0eL7ybXUSWVmJmw7f1F1HKFIWhGgQkPbywm3MC10Fxn
X-Received: by 2002:a05:6402:4303:b0:688:1d5:44c5 with SMTP id 4fb4d7f45d1cf-692381fb3c7mr835032a12.2.1780995437379;
        Tue, 09 Jun 2026 01:57:17 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.72.26])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65b55d81sm8343493a12.27.2026.06.09.01.57.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:57:16 -0700 (PDT)
Message-ID: <c3b9dca7-7297-424c-9ab7-3ea29e9cf914@linaro.org>
Date: Tue, 9 Jun 2026 09:57:12 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Add CAMSS and IMX577 sensor support for Shikra EVK
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
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/06/2026 15:06, Nihal Kumar Gupta wrote:
> Shikra EVK is based on the Qualcomm Shikra SoC.
> It lacks a camera sensor in its default configuration.
> This series adds CAMSS driver support, CCI definitions and enables
> the 22-pin IMX577 sensor via CSIPHY1 through device tree overlays.
> 
> We have tested IMX577 Sensor on CCI1 with following commands:
> - media-ctl --reset
> - media-ctl -d /dev/media0 -V '"imx577 1-001a":0[fmt:SRGGB10/4056x3040 field:none]'
> - media-ctl -d /dev/media0 -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
> - media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> - media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> - media-ctl -d /dev/media0 -l '"msm_csiphy1":1->"msm_csid0":0[1]'
> - media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> - yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
> 
> Used following tools for the sanity check of these changes.
> - make -j32 W=1
> - checkpatch.pl
> - make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=i2c/qcom,i2c-cci.yaml dt_binding_check
> - make DT_CHECKER_FLAGS=-m DT_SCHEMA_FILES=media/qcom,qcm2290-camss.yaml dt_binding_check W=1
> - make CHECK_DTBS=y W=1 qcom/qrb2210-rb1-vision-mezzanine.dtb
> - make CHECK_DTBS=1 W=1 qcom/shikra-cqm-cqs-evk-imx577-camera.dtb
> - make CHECK_DTBS=1 W=1 qcom/shikra-iqs-evk-imx577-camera.dtb
> - make CHECK_DTBS=y W=1 dtbs
> 
> This patch series depends on patch series:
> https://lore.kernel.org/all/20260527-shikra-dt-v4-0-b5ca1fa0b392@oss.qualcomm.com/
> https://lore.kernel.org/all/20260608-shikra-gcc-rpmcc-clks-v5-0-94cefe092ee3@oss.qualcomm.com/
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
> Changes in v2:
> - Drop qcm2390_resources struct and CAMSS_2390 enum; use qcom,qcm2290-camss
>    as fallback compatible string since Shikra CAMSS is register-compatible
>    with QCM2290 (Loic, Bryan)
> - Use oneOf in iommus to describe all valid SID combinations: VFE-only
>    (Shikra) and VFE+CDM+OPE read+OPE write (QCM2290/Agatti); add
>    per-entry descriptions naming each SID (Krzysztof, Bryan)
> - Rename shikra-cqm-evk-imx577-camera overlay to
>    shikra-cqm-cqs-evk-imx577-camera, shared by both CQM and CQS EVK
>    boards which use the same PM4125 PMIC and camera supply rails (Bryan)
> - Add reset-gpios pinctrl state for IMX577 sensor (gpio33, cam1-reset-default-state)
> - Add comment in overlay DTS explaining absent regulators are powered
>    by the daughter board (Bryan)
> - Collect Reviewed-by tags
> - Add reset-gpios pinctrl state for IMX577 sensor.
> - Link to v1: https://lore.kernel.org/r/20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com
> 
> ---
> Nihal Kumar Gupta (7):
>        dt-bindings: media: qcom: Add Shikra CAMSS compatible
>        dt-bindings: i2c: qcom-cci: Document Shikra compatible
>        arm64: dts: qcom: shikra: Add CAMSS node
>        arm64: dts: qcom: shikra: Add CCI definitions
>        arm64: dts: qcom: shikra: Add pin configuration for mclks
>        arm64: dts: qcom: shikra-cqm-cqs-evk-imx577-camera: Add DT overlay
>        arm64: dts: qcom: shikra-iqs-evk-imx577-camera: Add DT overlay
> 
>   .../devicetree/bindings/i2c/qcom,i2c-cci.yaml      |   2 +
>   .../bindings/media/qcom,qcm2290-camss.yaml         |  16 +-
>   arch/arm64/boot/dts/qcom/Makefile                  |   8 +
>   .../dts/qcom/shikra-cqm-cqs-evk-imx577-camera.dtso |  70 ++++++++
>   arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts        |   9 +
>   arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts        |   9 +
>   .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     |  70 ++++++++
>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts        |   9 +
>   arch/arm64/boot/dts/qcom/shikra.dtsi               | 197 +++++++++++++++++++++
>   9 files changed, 387 insertions(+), 3 deletions(-)
> ---
> base-commit: 6e845bcb78c95af935094040bd4edc3c2b6dd784
> change-id: 20260526-shikra-camss-review-cf6f66ac566b
> prerequisite-change-id: 20260511-shikra-dt-d75d97454646:v4
> prerequisite-patch-id: 3a689e8dda5fd2755b689d94d095806b3f2e6eed
> prerequisite-patch-id: 2acc300a68ed8c5364fb5f2f7d28fc0d56ab07bf
> prerequisite-patch-id: 2357cac636e019eaf14d6a493a1c72bca56fe405
> prerequisite-patch-id: 2885f299e711582da312ca9d13983d296a3dd5dc
> prerequisite-patch-id: 91af5f3c01e766a53ce8de69aa21847a2d6bbbf8
> prerequisite-change-id: 20260429-shikra-gcc-rpmcc-clks-2094edfff3b0:v5
> prerequisite-patch-id: 59bb0a7828e41f546f734f127d81da83c0adcda9
> prerequisite-patch-id: 197da6bcb15cadc47869dba88c8020987b25c335
> prerequisite-patch-id: 8ec9c1eb03f052ae232ed54117abed38672c23f6
> prerequisite-patch-id: 350db4f4bcdfc0fad9ed57cd5b1723f85ad44f5d
> 
> Best regards,

I really think you did a good job taking v1 feedback BTW, good work.


For the series.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
