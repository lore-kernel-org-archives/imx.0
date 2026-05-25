Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA31F382294
	for <imx@lists.linux.dev>; Mon, 25 May 2026 12:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779713572; cv=none; b=pvip1I5wuuLUiWUeFuf4FlfrD7LJWhZuSQzJupPsCfAv9/jlHz6jM8iDchxuSDPVsGm/OiSsXicSvKB/vdAzbHVOAt/NjTqZqcC2gRO9VNqsaV11Ybdq98MtgqBHKkGR6K4EBlXw0ThzkZiv4vV8Pr/93h154OY1p7gfbLmxbxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779713572; c=relaxed/simple;
	bh=eCc7hZro3sukGdKk+rDds8H6ZCx+O9dGtp3uVqlctV0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=M355dwrM79NpMa71eqb06iVfJbiuXdJ2CeUacfq02n3Zs6C72Rk75tRhEiyti0BlkZi3PxuIYlkY1NzJJGZOUaDIReOtd0CtfQbt5VkTQXSsvTrmZL9gqgqK6umGw94lcO7i+uYRp4bw0/Eoi6g29ApgYxk7kIBQhlcHk7/bIxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RaQiCK2O; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RaQiCK2O"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49056b9f04aso23089725e9.0
        for <imx@lists.linux.dev>; Mon, 25 May 2026 05:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779713569; x=1780318369; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H9aiTARP7drgu+dP0YCc4GfgWTsxTwUR3Caw1q6/RRg=;
        b=RaQiCK2OwBoO7qh6O5kez+WsHh+XysDNcK3UZtfisXVPFPt5IM507g+v9584Y0NPg8
         8xwEkr1FrIXEKPIVOTOao+jldH4hDlxPcytIvX29G/DV9h/tDxT0933wyqnGje9oc2FU
         XCGVOuyJ8WvFh3SyvEv7OdPHxftacYvONLfLvZo5FCl9TzSiLE0LkBUc0y1eliDTV0ct
         4gqdkN4lovaEjz6iWHDF+4lVTvHqWr+EM30JEZHh7QVYARZraKwOvDFNm8sx8KSs5ONp
         j6y1LhGYrz2tehKUWBMw7wzHlFnqhjOiZUSMZ/PTdGJWtOH67BmyXm1XSbubyQjVn8s2
         V7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779713569; x=1780318369;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H9aiTARP7drgu+dP0YCc4GfgWTsxTwUR3Caw1q6/RRg=;
        b=PMpxE6jnzKS3qtOMCdpkUbGCcO1vxyMOcsiL6GtF5rWF44S/w8dxmLBPB6qjm2l8GU
         gKR1ZxSdXgGp4EGVXJcdUjzZuacUUIxhEiiwujI2sj7WOBeIhQFworJreSl20UVmw89A
         Z2q2aPT/ZBx6+PJZFj3QCPb5wNJsjwuFhJ+qvTvLeTW8C7FpGiFm9zRSdsyxJAsS4BAZ
         GOujr71+7opSjrAJ23T9GaWablMtChbBY9LwstyjeMOGsyzo4/FnF3pNfiOPPZUQ66nW
         +lSH6FvFsrtD8SUUKOlhnU63l3E11OgKfmC58+4nYlmQDqlqWqfj6KbXqul+7olNi41c
         gS5g==
X-Forwarded-Encrypted: i=1; AFNElJ+0UOw0TA+tbCa5F1ghQZWpL1p9qAipSDuc72O2ffcsi39ZRORtOQe5LKoli6V42gKV2tk=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywfo0/TcSMDzvVDUX9wuiwTwG3WObkiPelCv3WyAfAu/WWF//hg
	/OEDLebOjpqabWjd0t+e6fujqXnKOMubNY5L4eJ1yTc3OeygWjS9HGXj
X-Gm-Gg: Acq92OHud0H7QRdbSqCY+jLaU+FgHwrtx4rY5I8U4MuGNQaiBpkHveHpxjLaY9VIuOH
	4mohdplv8KCMYRc3QSmOdefirS+CTBdn6txWCL6fj2WnrOAfB/Z3b24InL79B1PW/nltIgpM2tY
	zxJy5g7q4Tn9TV5dLvFMEgtvMyIWIhFmEPkBx47sD7AgzEZEVpIx5kOYK2oNdJZ4HKB56jVkkC0
	wRUuW+m3x3+HBSCZGB+Zmy9TI1+9Ygxj1/jhCSS3JW914R8g+nV+uyPM15//H3c4Yz4W7PexF+G
	woOcNj9UVAP3xVPRfsOFplrewrbiepdjJRzYiEPbVCUz5+NZmmBLAbLI0cLqlnwyZqkt8S2zKfJ
	vGh1tDsf+yZOjDb6UXSUmbexNAgVoOF7p5Z+J1CdvF5eC/bD1jxIkJvMywUK35dc8T8CHEqIwqe
	OAeg6YSpYUSxqJl0k60aN+NDrCld1Cui+8WEzy57pkS86i6tELs8ZGmeBh
X-Received: by 2002:a05:600c:1c0d:b0:48f:d612:3c59 with SMTP id 5b1f17b1804b1-490424b3927mr260477655e9.9.1779713569065;
        Mon, 25 May 2026 05:52:49 -0700 (PDT)
Received: from [10.25.212.250] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904561f682sm267142095e9.13.2026.05.25.05.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 05:52:48 -0700 (PDT)
Message-ID: <a9e929ef-f8fe-45ce-b1a1-de1c1e23dfa4@gmail.com>
Date: Mon, 25 May 2026 05:52:46 -0700
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: remoteproc: imx_rproc: document optional
 "memory-region-names"
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
 <20260522111849.783-2-laurentiumihalcea111@gmail.com>
Content-Language: en-US
In-Reply-To: <20260522111849.783-2-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/22/2026 4:18 AM, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Document the optional "memory-region-names" property.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml     | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index c18f71b64889..6679b10f9da5 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -62,6 +62,14 @@ properties:
>      minItems: 1
>      maxItems: 32
>  
> +  memory-region-names:
> +    minItems: 1
> +    maxItems: 32
> +    items:
> +      oneOf:
> +        - const: rsc-table
> +        - pattern: '^vdev[0-9](buffer|vring[0-9])$'
> +
>    power-domains:
>      minItems: 2
>      maxItems: 8

So, I think the AI bot is right on this one. I've missed the fact that the programming
model allows you to specify additional carveouts (currently not allowed by the constraints
here), based on the firmware used. An in-tree example of this would be imx95-verdin, which
takes another carveout called "m7_reserved".

Based on this, I wonder if it would make more sense to leave this property unconstrained
w.r.t the names we allow.
