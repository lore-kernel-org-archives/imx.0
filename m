Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE8739F187
	for <imx@lists.linux.dev>; Tue,  9 Jun 2026 08:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780995195; cv=none; b=UOQh9jkpnu56Ioe51YgP2s0m6hvQrslOof8OSmQ3WbKZml6tqxd5eIumoSDrGyj0QHXs9Tlg1pVp88R40xiNZ4nJEAjLtsSjD2n5os/sESHr8s1rjh6SFp4at3FllcS30Q432RN3UhACevzVt9Cpj+/l2xuHSZxpK9VQ9yZpXa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780995195; c=relaxed/simple;
	bh=hO/azaYVEfXjB6ij8N/yUOBnpCCFhFhBm81VvQU7s44=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kPiujgxrEIbStESvI7emcS7hKvbFyl5GupSVeUS88JsReBjP8F5Ua+DjvLQLWtwNs1TO7B8r3s4UL2y+VlEvWL6SiQoA9zBMTIPDllNHh1G8kESJJT4GgmLRm6gAb3VaxdeHhNf1hJSRmbAMhH9tx7gD8jsX1NBVvJxMBRRm2XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GODENuya; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GODENuya"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6914a658115so4039275a12.0
        for <imx@lists.linux.dev>; Tue, 09 Jun 2026 01:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780995192; x=1781599992; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N1J30wpRr/zoxFVY10vvN98wpm4s2FZR/qZwrLhfn4I=;
        b=GODENuyaMUZL2efHJtJzOUTU6EGYxw3O8vHS3WSHHD78svK/Zfq09sAWw+fVGFfMU1
         ckU6LXfXq+EnLVJ1CHK6UqY2pMYxlPLT44z3y1PJGdHj5p8jNKSI5FIE5XL1pBq+y6n1
         PzMFTAIqQL9PdfBeD7Xw6rX4MMWYsfcIu4CtA0J3OicqUMsv33rPVGqL4cFcikKiObBQ
         iJWEBt6zmfA1h5xiRNIg4MjFKQqaZe2VzkY78CINquFelhOhEm2NAub6DdELgPrKAeGQ
         f8QcgnV6STOSTHdZiI0khX33obCRJp2VjOGAKpxT9UrvqLh6BRzndEo3ERLXCxvYe3Lk
         KxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995192; x=1781599992;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N1J30wpRr/zoxFVY10vvN98wpm4s2FZR/qZwrLhfn4I=;
        b=W3S3AlxAkQpbjkm5+Z67MyDH0oWPPObhkNpcSBra5WXv8ZOTvo3oNw30IJFeCDLcTu
         /yf0IfD9Z9TGBhZaX0Rv1JQZmFTTYI41kXdQu8ho/FnV8Zzris43+2M4jGlx3yylFnL0
         HyQV3kI1skeNtyezxdhiTdAP1+l49kZssy3usm22cnSaOPulJ8jWplsj2b1QLm1OI7PB
         j/9qdLSgUYrToiFfH3GZuZRsauboIQgEaMkM6JQn0hzo1yzI9P4mBBD/znFrNVZo7hhT
         Tq1TzQlkVBw4Tp3sbXzEz6RQnQSFZ52DxGcm2N1jkUNlXIGEZ6TSAt1t8sP741Zeshar
         6mgw==
X-Forwarded-Encrypted: i=1; AFNElJ+sLzfweLpkysekg1Bg3EgddocADLv5c8DZV1X3VcA0OZaMHP0E3Fp/NrJkXsIULHmhodw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyp/xkqzzyTifywYpLLh5u8RYul+USqzFW+0nCW1Nqmk5FBnUi8
	xn+J4Em8sEsbvgg7hp/nGJ0e42kQI3d8hlbhjHJt53B2wVUShbjemrglvySQsiU4zX0=
X-Gm-Gg: Acq92OGH8OJq6moBo/JFVXCuMGQ4G6BGthVF2kvVSTV9hI9894sW7Lbl1eWPdkHWZTX
	z5VhENKWXuLHMhGh6j5BabF0JRqMqlDPAAx5LLHhiJv3N7Cx1YmWIis668x7SRm9TrwWjM9g9pA
	Thed5pP0jEHbLfB4uhCKwwQIEIyh38H7wVeHNP2+/+NqVZRKxD5WEzICrwxbGdyV54LcXkGvmiA
	GHBslxlQqPhWj0rG40RJU19+l06QlCBlxCS5BqOJZC7zpQH2jtEJM+XdUvcxLiA4X+RnSxRUbjX
	UBBEzmLNjdWuSwAU9sRNH8OUuUk+b1E20J02CYr+8NvxuYjUIyauFcjtOHK60rZD/8C+qUicIh4
	A9PMOeD9CZDGgacxWT3jqzHsMXArheiNFRHuxSMmiBjYKL5lHY7W1fvdOBU0sNXUikVsgrciJuA
	zpF/YyeC0E00WkL1KlsuGW1uomGSPhkt+BVjC/Vfpq96uS
X-Received: by 2002:a05:6402:4506:b0:68a:88cd:eb22 with SMTP id 4fb4d7f45d1cf-68fa535d734mr8754916a12.26.1780995192260;
        Tue, 09 Jun 2026 01:53:12 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.72.26])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6595c722sm8240110a12.22.2026.06.09.01.53.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:53:11 -0700 (PDT)
Message-ID: <11db2b96-975d-40df-b902-c1772f83a1fd@linaro.org>
Date: Tue, 9 Jun 2026 09:53:09 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
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
 <20260608-shikra-camss-review-v2-1-ca1936bf1219@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260608-shikra-camss-review-v2-1-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/06/2026 15:06, Nihal Kumar Gupta wrote:
> Shikra contains the same Camera Subsystem IP as QCM2290. Document the
> platform-specific compatible string, using qcom,qcm2290-camss as
> fallback.
> 
> Unlike QCM2290, Shikra omits the CDM and OPE blocks, requiring only a
> single IOMMU context bank instead of four.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/media/qcom,qcm2290-camss.yaml    | 16 +++++++++++++---
>   1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> index 391d0f6f67ef5fdfea31dd3683477561516b1556..4f39eefb4898ebc22117407f26cfb4f41deb111b 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> @@ -14,8 +14,11 @@ description:
>   
>   properties:
>     compatible:
> -    const: qcom,qcm2290-camss
> -
> +    oneOf:
> +      - items:
> +          - const: qcom,shikra-camss
> +          - const: qcom,qcm2290-camss
> +      - const: qcom,qcm2290-camss
>     reg:
>       maxItems: 9
>   
> @@ -76,7 +79,14 @@ properties:
>         - const: sf_mnoc
>   
>     iommus:
> -    maxItems: 4
> +    oneOf:
> +      - items:
> +          - description: S1 HLOS VFE non-protected (VFE only)
> +      - items:
> +          - description: S1 HLOS VFE non-protected
> +          - description: S1 HLOS CDM non-protected
> +          - description: S1 HLOS OPE read non-protected
> +          - description: S1 HLOS OPE write non-protected
>   
>     power-domains:
>       items:
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod
