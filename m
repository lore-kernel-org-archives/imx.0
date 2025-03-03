Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE8C215F7D
	for <imx@lists.linux.dev>; Mon,  3 Mar 2025 17:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741023218; cv=none; b=SwxB6kp1Wjfbi3d10h5n7OLrgze7kObboIL4U0igOl5yK0ewL5uBlCYW5g857Zplul5BIyIcFcd5PzDqQ6HGLDWJqoVKe1/pcGCxK0t/O4Ds3QV3wtt44wzQh8NEHH75r2Dsc1guYEWh3lyJMLd7/yx5BONEx59/S+Y+X5hOBYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741023218; c=relaxed/simple;
	bh=tsWu4EeOlFGbDPeji246ZamPqZJ7HH9+BLmwhTUya04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=osp0UFP8dYWT1OZVp9ewyJj6xUz82uX4CREaa5zaQTerJkkAZq+YJkLPocDuvOlbiIHF8Ne+VvLx4ZV4bLZykvdx1EgxM+T4Vw0ANA3m9JsB5/nBOqHc8HSS32UuDHvkC/nMcfsyfnrtw1wAWUiTYcp6OWxd76mS2QNPoiNLgrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z1MDjUX/; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z1MDjUX/"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e4f5cc3172so5120457a12.0
        for <imx@lists.linux.dev>; Mon, 03 Mar 2025 09:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741023215; x=1741628015; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OUhmolDFCbsRrygEyjdB/SNREOTYrW2sTqcKH1rfaVc=;
        b=z1MDjUX/yHd5mrvye9tv5JEuDQmC8uCOfy7baIHTcwS9RYh7e+FQZ4S9GdEhaiOVBe
         r0qrYVdqlTKwrANG0u2PAHOAg7jLK1txfP7q/4SZpPTXPkg0Vke2siBmZ7EtMYDbwlzU
         8dkRUWe//pRmgj4/kMUA4i0R+dVBPGZ9FBnzheL1dzNH4nisvANN9g4zoCi5w9rEXfIl
         LGPwB0lK/+n15h7OxFunodtULFa0rDF8HLCnKY0DzZxlh3JNz2+BrO9yVjkCNPw6B2cW
         cKIqvtdJFTqXwzOI2Csx1r8olJsReXcOxaymuG96r8SdM9kZTxK6FieqXFqBAkYlMDcC
         oGpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741023215; x=1741628015;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OUhmolDFCbsRrygEyjdB/SNREOTYrW2sTqcKH1rfaVc=;
        b=Ap6OTde6dQT8Yo3vURSuI20bTiMAAcFIw3ZfQPKT3nH7kS/264m2hiUDtMDzhwxO41
         FN1z5He/KqE2nbyMI2UfG+4p41/hwo25Zo4kPNRyyA3cOP+wsb1OT7QkgtW3GhVM5gjg
         c7wM7eGZZJsPAl2V3ZyZKjiiE7ciHmxR9s0/Ea8ncMlwRTPhDzuvWoak+h3ZZGpu1htm
         j9BZuA4nO4Y76htaN6SFI0uPzB6bxIXh2MX04qQ7wveEq7XKrNWnvuK52mxeqwnRFqIN
         BrcOcTN5Yzkr04d7oLMrfSXPJO2SdPXGESmQQIDXKFPJU/szUqW1lNtChFDPr1ApRJjc
         mWVg==
X-Forwarded-Encrypted: i=1; AJvYcCWeORWV87OsJzkQQYTpaRv8RskKR59HQTeBolZOo/baYbD8H06VEayzGom3Q9WMgldrDyw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyaEkTRv6MY+J/Fc1V3jlO35Drjpz09FXZpYhFa3Z4D8ybvHmZu
	Zc9vIT5Bao3a/zWPSHikLubYUmI4p3Su3X0B98v8TLbW67kYUGkSwXSMyqXQLek=
X-Gm-Gg: ASbGncvt3ugbOtMLykaaaXkFwZE1i39auyF/pK2kPzEJ+Of3pAMS2VkbCSbF08Oteln
	FlLZVc1m+ngL6qeXn2DZQAritl277f4qPybYCOPpKSJkSH60sogtf9D9JSZ29WeCZr8bj6PQoIw
	U7eYArdD2raOxi5rxHyhuOIyMsUUfpCbADFAedaXRzBqVnbgbeU5DkjI0PDlgi9C1OOGpz6GBlH
	/tmJu2R5qEmAb7zZQ/cpasssVI3iLJOPSS2q10C8BAIutbpc9cLzyxgAyK8m6AjnbRjY0PFhvfb
	pyW7JWDQwzKrcwDyCR81I9EGZa8iuXbMIsC2575CCQ==
X-Google-Smtp-Source: AGHT+IEfd6FqNltMqV3tCjIrZsZmfb/5XycRyRy8vJsW4t7vzj04maxfZbsm1bvOwLU1xzzl3b3NTQ==
X-Received: by 2002:a05:6402:350e:b0:5de:db0e:311f with SMTP id 4fb4d7f45d1cf-5e4d6ac4393mr14943743a12.4.1741023215104;
        Mon, 03 Mar 2025 09:33:35 -0800 (PST)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e50751c496sm5104649a12.67.2025.03.03.09.33.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 09:33:34 -0800 (PST)
Date: Mon, 3 Mar 2025 19:33:33 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Marek Vasut <marex@denx.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Adam Ford <aford173@gmail.com>,
	Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] clk: imx8mp: fix parents of AUDIOMIX DSP/OCRAM_A
Message-ID: <Z8Xn7f6vXg0aM4zx@linaro.org>
References: <20250226164513.33822-1-laurentiumihalcea111@gmail.com>
 <174102305899.2928950.8837177294161174759.b4-ty@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174102305899.2928950.8837177294161174759.b4-ty@linaro.org>

On 25-03-03 19:30:58, Abel Vesa wrote:
> 
> On Wed, 26 Feb 2025 11:45:09 -0500, Laurentiu Mihalcea wrote:
> > Correct the parent of the AUDIOMIX DSP and OCRAM_A clock gates by setting
> > it to AUDIO_AXI_CLK_ROOT, instead of AUDIO_AHB_CLK_ROOT. Additionally, set
> > the frequency of AUDIO_AXI_CLK_ROOT to 800MHz instead of the current
> > 400MHz.
> > 
> 
> Applied, thanks!
> 
> [1/4] dt-bindings: clock: imx8mp: add axi clock
>       commit: 2471a101938b0d1835b1983df08daeb98eef1205
> [2/4] clk: clk-imx8mp-audiomix: fix dsp/ocram_a clock parents
>       commit: 91be7d27099dedf813b80702e4ca117d1fb38ce6
> [3/4] arm64: dts: imx8mp: add AUDIO_AXI_CLK_ROOT to AUDIOMIX block
>       (no commit info)
> [4/4] arm64: dts: imx8mp: change AUDIO_AXI_CLK_ROOT freq. to 800MHz
>       (no commit info)

Applied only patches 1 and 2.

My b4 setup messed up. Sorry.

> 
> Best regards,
> -- 
> Abel Vesa <abel.vesa@linaro.org>
> 
