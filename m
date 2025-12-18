Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4739934F24A
	for <imx@lists.linux.dev>; Thu, 18 Dec 2025 16:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766074806; cv=none; b=AGtc0IUWg6Mt26WW0/poKC1Q1B+JiQ54IdwXmb7ST/7zB+bgvNpUSEvwxgBxZpx5RSKC615Mjwbbrr9wWqDA8HfCAOUqna1+PCety30OQgHFdVLt3L6qXTW2D8dVTYGjjvJ3Dh+nGKYN6Lt0w1VRN/hvvLqgFRPMsve0PeHNGSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766074806; c=relaxed/simple;
	bh=hVY1lx5jquwRW6anCUI5JtIMpN3jK3n+nWSoUPPGJdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ucuZm9Dl4slrENhU4WfWuH9OMrn5XeCUmi9dXY7jdCgGp55gS+mHTbQhXi3XUI4owaekMHKiUPa4wKt6XFAcOA4BO8v2Lw0zBM4fS4Ls7d2/nsJfe+ot5MxYgn3V029+dFZBW5Qzv538KloHUYJlXqzIs2xiyNRuDkYvZYCgiIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PSbX+ECZ; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PSbX+ECZ"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-64b8b5410a1so153068a12.2
        for <imx@lists.linux.dev>; Thu, 18 Dec 2025 08:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766074804; x=1766679604; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9i8cWPPpk3qhAbSDSCLeR0U+nXf0Qia9C/CB0RwOtJs=;
        b=PSbX+ECZWnFvjVY7kyS4OxBRlSx6w6rDNZr6eHlJsRDTmnrUuvSwCM4qbTVZk5oIIt
         DvPCBW4BsE1tJhjPSpRLD/9vi/Bcnr0ADSDSjmYxHzlRO+RrKNHSreR2FV/ZXuK0TSAr
         oC6pwL8P304W+00s7UZwABhn6XE5Mt1ORdjwBOofZLJfSqjB552jUqgX2eFhRTwDFnFG
         UiCAPt0IsugKC0D2tz/LgEdcEekKD2TKy4TpxR6Cdwomv9xurtg5dm5/KWeANDkT/TEO
         1KxQJ7P2QgO5wkBWbPKaKbaE0sjsUE4OewTkJ81W9qDVkEAmPeig7xbCPUI3I883J1An
         3zAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766074804; x=1766679604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9i8cWPPpk3qhAbSDSCLeR0U+nXf0Qia9C/CB0RwOtJs=;
        b=URElOkq6EqOIfLobm1uOKpiF3ii2HBjIxoX1zMM5Ld0MITEScZKtPQi/ePo9J53Tcu
         lMAYQPhdwZRR5NUMPKTqnyJDdcy71Gl1z+xCTemlwWgO3CO5dGq+3xq06qMem5etLQMS
         Oa6VuHsaNWVoGIYNnxQqr5G1u/2bBIUvCOWaoXsrOSPnnVnQT4RPdSZEkSof1sPq2eKc
         8ggG5B+rhFCgrbIx1CqzeiGtnedjlF9UTkRWQY+mVbWnTcaL1cRBLJbGedyM3L8NdPmJ
         hoT+HT2/+qDs/TLBC0roOwvE82UM7UkBRNexM21uITsxvd94BAOn8NyXzaq+NegNOSkC
         GnrA==
X-Forwarded-Encrypted: i=1; AJvYcCUrD/NGAj1pmdaIV0H6Ao1zESNaixtBg80HhlIdi6c/NYRT2sbZiz0Zo7qP94Sy1ow6W6s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzxwdf0z86g4iZIJWBtFNEAQ3kKr//U+h/6E9yBbtlK/hm1Nm/y
	FELOSXGfvRMuJqh7GDhvhe0anzvUh4n5zpS3TTBBuyT5nGG6u66voESj
X-Gm-Gg: AY/fxX6nAvVCnJZUVVZanz5JCK+VJDxUsnQ5i1EZOah0xok05lKEMNJVlu0F36U9jUE
	GOR/YnLT/b55vj4NJaWuFPbDTEDgyjV9KLm52nXjDR8hxo3+6qFsmss/zl9s34fIYCZ8+luKjhp
	LYfztssxTWoailMPsiU0TXfaOaSxdDmVvl+01T/atKryVvXqnyUfdroMuMQenu6ptjARn7dayda
	wsrw0YoEX+1gftoIVeIs/1VAE/Clu2SG/Eqq+aLJV6HSqVt7qul+2DrpRQZBi4oG9L6ZxoDaF38
	zMGXzojEhwzp+tqZDwOFS0QNh+W3bo+YuCpGYdnOdwvNFG7yhqW42MaosKI2RzLQzsX0iTyWMgd
	4Za7L91JVCsQv9INBEkRZEb7t5Z51YcV/4FpeWpGIchosqnUfFbKCvpuFdhT/Dvs4204NQddXB4
	gConXi3/h1ccdoHr7ffeNOj9LhF4QgyG8ERQGDG0ERQw==
X-Google-Smtp-Source: AGHT+IEK/Oq/yKYYYk/vo1yGLO9cpqS5uZ1Iib4terF5s9b5DAyEzWO01hv02K28pdINOt39Pnr/Dg==
X-Received: by 2002:a05:6402:1ed1:b0:649:815e:3fac with SMTP id 4fb4d7f45d1cf-6499b2fe480mr19443071a12.23.1766074803307;
        Thu, 18 Dec 2025 08:20:03 -0800 (PST)
Received: from [10.25.219.74] ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b585d3f17sm3033124a12.8.2025.12.18.08.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 08:20:02 -0800 (PST)
Message-ID: <55d6fb81-5309-463e-a624-dc80f960aa24@gmail.com>
Date: Thu, 18 Dec 2025 08:20:05 -0800
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: fsl: Add compatible for i.MX95
 15x15 FRDM board
To: Lei Xu <lei.xu@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 justin.jiang@nxp.com, qijian.guo@nxp.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20251217-127-v2-0-67cb12e56242@nxp.com>
 <20251217-127-v2-1-67cb12e56242@nxp.com>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20251217-127-v2-1-67cb12e56242@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 12/17/2025 9:56 PM, Lei Xu wrote:
> Introduce a new DT compatible string for the NXP i.MX95 15x15 FRDM
> development board, a compact and cost-effective platform based on
> the i.MX95 applications processor.
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Lei Xu <lei.xu@nxp.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 68a2d5fecc43..4b6188d39be6 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1432,6 +1432,7 @@ properties:
>          items:
>            - enum:
>                - fsl,imx95-15x15-evk       # i.MX95 15x15 EVK Board
> +              - fsl,imx95-15x15-frdm      # i.MX95 15x15 FRDM Board
>                - fsl,imx95-19x19-evk       # i.MX95 19x19 EVK Board
>                - toradex,verdin-imx95-19x19-evk  # i.MX95 Verdin Evaluation Kit (EVK)
>            - const: fsl,imx95


Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

