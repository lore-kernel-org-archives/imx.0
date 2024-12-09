Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAECD21B90B
	for <imx@lists.linux.dev>; Mon,  9 Dec 2024 11:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733744563; cv=none; b=tjKvp9VYEFJuz118AhHSz51fKQ/njKUvHBzdF79LBXX1e0RfFK0tsy4QTeWZQ4Fyqn6vWKYxYH0t78GXGMH6UPY8TBZhTwyjX1WigpaQtvIGzTOxJ/HBzhVDTj9pIOYpQ+loajPchmV/BZS/qB9tDJXl06rS6Nnf6fveN9XWPTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733744563; c=relaxed/simple;
	bh=IK6FGWxcat9ec7DwdOXaucjjIx7nIWIyPdA4xF3OYr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Jzp5n5a9NHMU6mtqtMDm+rsE40lSxfndVifpWPCaXZ1oQxCBIqPirfl+zwsCpzT2ivc3a4eD14cgeUZRbav+4JRJFUfdFNHx0SC1tkj9x/kZvEag2cRmaGHShZLTBwYGGi3Jco8VHL4RrB+p34+LyXbHRFx4vF6eT//JE8feMvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NsHP7VEC; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NsHP7VEC"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-434f30ba149so7556365e9.0
        for <imx@lists.linux.dev>; Mon, 09 Dec 2024 03:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733744559; x=1734349359; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W10XgeMj5m+No6tcPataZmZSnoW6PK2I9Ff3cBJBg7k=;
        b=NsHP7VECED4XmIvoadA9CKFNn4axzBmYcxcVt7fegZqa9XGUGQFIcAhHVhV7m7gArV
         ngasTEc342AlVVC2pY8H0OzSf5TWON2O89wDA2HbU3Vn7RiigMwb7F3X3EKlr1quXpFD
         B777t24+8uIRAADwx0bLqbSMEpA2MkFzL4j3ZNzRP+pdO4DH7EZxJxm/InsggZHdGIeX
         YV/En5exXutcpMwM1LjvKn10Q0fqjgQf80/R1yDWp37slwNA5NUXucmp1U8k2bmgLw2t
         mMesjEgzY2iYbSgM1Is0p6CBZ7ba+MmMw9jF9G8pkFb1dEeqTnfPdclAj8Rmg7/lUsPV
         AVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733744559; x=1734349359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W10XgeMj5m+No6tcPataZmZSnoW6PK2I9Ff3cBJBg7k=;
        b=UCYLJqxOvtVZHKifmIRIc4F2zzWOiZEvng7KTB7YYyte9zbJwd/aSMcs7TlUeX2wEV
         f5pptBD8aQptvjtLvxba/5DTSFY6Iz5+CnpzQNBtEzCxN3+1CJWSvoC42ZgN8crgtZZN
         igysHz/mVLW9sX3xd4qrJgnMkTN6aLlREtVXq0GZs1vDE/jyhgn5x54r8XeLap1cHdVC
         DTiBx+UaSIBARz3w34zqK+uBjUCb8Tmn99vJdr99xggXtlbbJKcQ6sBEKAWjfwDLEm3g
         7A/XIk2ddqVtBrXvBS+TxPCDYdn4b+ITfx/RkctkvXgMIAas6E3gLRxYfgj4DRlrVtW5
         GtwA==
X-Forwarded-Encrypted: i=1; AJvYcCUDYtWYIKALKk3iBZSBgok8GVa6wg5afo051DWmPVa6MLeRhcnK9d+IFONzfZpbf8Fvp4I=@lists.linux.dev
X-Gm-Message-State: AOJu0YzQQsmCQiPTrR7nVtCHhxIPAsCl+mJrbCcMvDTREGfOTgNxO8Cd
	plTEzXktLcZXXpV0weJwDq/9FOqWQpk7Xji2khrtXYvcHtaUjJzg8/WaqmESNEI=
X-Gm-Gg: ASbGnct8ZUJQI//D6Iuyvkw+N+NyALc5nldM8G4XZP1JHZZwMdmMSv5nK+ZqtZ/55Iv
	Lkcxo4VD6C5YOwLdWOW/YXdXsmBGsMkMTaCtJ9EWrg17T5sY5kobw2Wd3AEyxGSk5XcDhHKMcSN
	7Br+MJzrUKjUc7ctMyIExwZZeRJB47H7O+j9kXGz23Y2766XpfjGpA13DL1YzYd/23PTrm4wgJh
	1qTHMtBWeIK0JYL6OBCnBQrJb/JpZo9tWk9QWaxbvmx6NvACFwbWQmbsA5qPyc=
X-Google-Smtp-Source: AGHT+IEbIQYg8EnIUDUPigKjpDEo3nHZn5oUqp1eGUTq6LEGGzSr1WjwD8bOZqQ7VZz3k53CLChrPw==
X-Received: by 2002:a05:600c:1da7:b0:434:f871:1b97 with SMTP id 5b1f17b1804b1-434fffca42dmr648225e9.33.1733744559181;
        Mon, 09 Dec 2024 03:42:39 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434f2b08972sm60014355e9.27.2024.12.09.03.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 03:42:38 -0800 (PST)
Message-ID: <c8f42175-3501-4d65-92ba-5878fe5ea5f4@linaro.org>
Date: Mon, 9 Dec 2024 11:42:35 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] media: dt-bindings: trivial white-space and
 example cleanup
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Ming Qian <ming.qian@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 Shijie Qin <shijie.qin@nxp.com>, Michael Tretter <m.tretter@pengutronix.de>,
 Emil Velikov <emil.velikov@collabora.com>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 imx@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20241209113405.74226-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241209113405.74226-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/12/2024 11:34, Krzysztof Kozlowski wrote:
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
> index 9cc0a968a401..3469a43f00d4 100644
> --- a/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8916-camss.yaml
> @@ -1,5 +1,4 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>   %YAML 1.2
>   ---
>   $id:http://devicetree.org/schemas/media/qcom,msm8916-camss.yaml#
> diff --git a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> index 5cb0e337ea6e..644646de338a 100644
> --- a/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,msm8996-camss.yaml
> @@ -1,5 +1,4 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>   %YAML 1.2
>   ---
>   $id:http://devicetree.org/schemas/media/qcom,msm8996-camss.yaml#
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
> index 584106e275f6..68d8670557f5 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm660-camss.yaml
> @@ -1,5 +1,4 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>   %YAML 1.2
>   ---
>   $id:http://devicetree.org/schemas/media/qcom,sdm660-camss.yaml#
> diff --git a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> index d32daaef1b50..289494f561e5 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sdm845-camss.yaml
> @@ -1,5 +1,4 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>   %YAML 1.2
>   ---
>   $id:http://devicetree.org/schemas/media/qcom,sdm845-camss.yaml#
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> index 06db2c1e6079..a372d991e652 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8250-camss.yaml
> @@ -1,5 +1,4 @@
>   # SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> -
>   %YAML 1.2

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
