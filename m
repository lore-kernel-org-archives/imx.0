Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0811F34A79B
	for <imx@lists.linux.dev>; Sat, 10 Jan 2026 15:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768057793; cv=none; b=WSLGr9xB0XnsVl58E2QR3b+9yYqSrO2GN/0pIkAVaog329bqjs8R4UinQ1v5PrGEWJgDlWsUDyiv3w+NPcMydPR21x4vc1/H5ceRzO93xBdE1Et+m4/YhWGGVXucZ2IRDEHfQ9wiVJgOKzyB2NDQNuu9ofU5DOoaVujv//8BHDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768057793; c=relaxed/simple;
	bh=veOrw/m8cCXNOzS0YhBEMZHiqb+wrCM+D/j1ZadzRgQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WTdrJuknZSwZiS8vKuMiRTYVYrCbfsD0mE5/SEKs9iLUEtkIW/Jawd+iSs2I9V06nXIalau+PEp90+Ymo2+esT4kwhx5uFMfRUEvr2TZxWS/m0R0HL9M7uENBco/MnwqbUn/vPux0z8XdDj19hqyWdoVZrHLTo95jh81wPbGBcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=MdKsCVVg; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="MdKsCVVg"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-432755545fcso2961670f8f.1
        for <imx@lists.linux.dev>; Sat, 10 Jan 2026 07:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1768057784; x=1768662584; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZYFiIfX0/KjQWE2M1MYc+2i7VSmAxQXe92tai7T06wg=;
        b=MdKsCVVgQso3xlBMS7ds9u4uTK4wxOFop+voOovGEdygzHGSYKYkpdIIxnHzgIGhvK
         lP8Dm1jUVZzkOwpgrL7RGNhE8LN0fqgrzpu+cZGNpCjLVIf/aEwRS2cIZkgxyw33j/DI
         3URAp1xvrwMbTxC/kTJMeUZE0r3S5/7XwFZnjNTXovjGcXhhYieYiGa4pZFXXQbcF2R8
         DiW5kDa5GmSzyYzSLQN8q0XUrAU5EiXrZIstj76V5w7XlFKYaH1PIpMOuPFFXYr97fYl
         nqj6/QPMT0CpvwHxSs7d3onvsnHRUNx86VogsUtpjgLwd+gcxMYCJvcwb1Tlzmku7G/b
         3Z/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768057784; x=1768662584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYFiIfX0/KjQWE2M1MYc+2i7VSmAxQXe92tai7T06wg=;
        b=foK2jYT5j1p66ITRMiykJnwTtLpvXwT8pV4ZFRiM79Dbjxa6OugbKSxi6VpnOTtST1
         QFWhyu+0Do5DzGEe4D85r1ODJNtyFurCpBU4gxBPO1WD6q8PtnUcZZu8JyqtZjX0XOSN
         4QLQHK/09iGD5OGaUfLYJNU9EqkyY2c1cIVV4T+cSu4pawjnI4tcFaPnxJv4/Kvh9doz
         4gtQ9z2S1N7xJey6Bu6gCcUBZ22bNyjhrbZcgXxuL5FbtvmBzy4EFxK38sTchlXQvXbn
         VJcgqEggNhztkn+MUIvLklH9SgPyUwb6xZ5Dd8qNr+xzqWV0squDaNbP894IgqZDNdY4
         KvEA==
X-Forwarded-Encrypted: i=1; AJvYcCV58tmUYYHOLK1B9ktkTP0kZUlSjbq8AqmZhQULcthcruB6iMth1M2Nas2fcwx5WfCh/2c=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZqTLhygtbXU1dDbjgtC6IRsKwFRRLy6fEkEdlC+9RTbpew/NX
	+dj2kAle/6zOWcS056/T4XS4BvpXx0ltxwBj5ZA9qRJFkPA2NI1CqQbpfxS8O5Hvc6Y=
X-Gm-Gg: AY/fxX6AKGGdOYmT8JuWvzM0RxOG80fJU6vqpOUYnYFJ0R78wb6dR37/rTD7GUu2Tl7
	aDFMhFQIAedTOBxSN6BXCPJrUN74AtCW63cTW5AqjweRQEg0P4P1GGiMXd/aB4kWaNSSbAd9Sun
	BBWEMzgeVp5EHz/L0sQSvhqbSjJE5vvjd7M6/UYRKMvV+eXaTq0rxB5gSviuTNjYOnFMh96PFGL
	CYO54Es3cM+/tH8LAdT6vrq25RnbebVN8IArVpZBYjQ7HVSsts1jglPJvkUezwnoY68Rp8uS0VX
	B8hDdBtOLvuyLnAQtZYX7gpTdIF93EZScoj3nIcMPiNJU9qrQa1uBpMtYsR0SLDat8qoOd+sDiT
	lPbvyWwAr20+0t8xT+NiCXSa1hgyQzGhHvQiSrDf3dNTeN4KzmFPI2XKhbPCEKOhXZRLPROgl/M
	+O0XisTnfhYLm5STS9E4A8e7pJ02T1
X-Google-Smtp-Source: AGHT+IHwvRNK+qwBLjP9mJj148RzU5png6+Rsy9u3J7EYhE07UUYa3vVSxYXarlT5BZGC6AC5xVP2w==
X-Received: by 2002:a05:6000:40da:b0:430:f23f:4bc5 with SMTP id ffacd0b85a97d-432c3760d02mr14529601f8f.45.1768057784134;
        Sat, 10 Jan 2026 07:09:44 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e199bsm28208208f8f.16.2026.01.10.07.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jan 2026 07:09:43 -0800 (PST)
Message-ID: <6c2612f9-97de-49e4-a7c2-eacea2d33f51@tuxon.dev>
Date: Sat, 10 Jan 2026 17:09:40 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] ARM: at91: Simplify with scoped for each OF
 child loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Russell King <linux@armlinux.org.uk>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Nipun Gupta <nipun.gupta@amd.com>, Nikhil Agarwal <nikhil.agarwal@amd.com>,
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-clk@vger.kernel.org, imx@lists.linux.dev, dmaengine@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pm@vger.kernel.org,
 Jonathan Cameron <jonathan.cameron@huawei.com>
References: <20260109-of-for-each-compatible-scoped-v3-0-c22fa2c0749a@oss.qualcomm.com>
 <20260109-of-for-each-compatible-scoped-v3-2-c22fa2c0749a@oss.qualcomm.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260109-of-for-each-compatible-scoped-v3-2-c22fa2c0749a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/9/26 18:57, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
