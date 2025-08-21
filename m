Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C281D2EA494
	for <imx@lists.linux.dev>; Thu, 21 Aug 2025 08:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755763271; cv=none; b=SfP8FinPcVSPjh4i7hTTlwkI/WkJa7F1KQteSZAd3xcBF/WhRZs3QCCRNRKRA0To6GBRnTf9aa8HHASkIguxBu7mmsnLA0cGMvoMavxYQKYj1DdcmN47CV7z4wvr1cYt0C8iq7ODkgnMivS8bFJqicXn4GdNa1eJ/c6LHvk+NFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755763271; c=relaxed/simple;
	bh=WM8iBOuPE1mzfpli1zA7QCdO0jJda95qiYQylczUrj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TLXJE1KDw6PUXgTL25C85oHjegVr6jK+W399BuacjyWH3GRztvvTm7j/i2/ObFJ0T30+7OVx/8bPDkM2mPTvJL38kIGXydQdiNqK9NkSq/62H5udfAcyskQE1VLqY4PdV1S3cYU75+9hgN7y7WABJB4GmcvUSOt6RsRISEImnEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dpIF7/Rh; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dpIF7/Rh"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb79fb221so7127766b.2
        for <imx@lists.linux.dev>; Thu, 21 Aug 2025 01:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755763268; x=1756368068; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BiJM73jXetXZPDg3FG4r1HGiBdkCRmSbEWZmqbaw5yc=;
        b=dpIF7/Rh0RTBnwuqtw2HcvvxY1IWEq0JpZ4rFYgXXAbCWSuh+oSaYVCHqdddsF6kwf
         SPZyztOUSlLy4NWsjvkTGvDGIcJGwxU9TFwlx+q9jc+RNWZWLiF0bkvcLmcWdXr55BF8
         DPC8v6Z7edepT/AnJOgCS1z15ET7kwZIt1OP7Zvw1Y2V+s7LEIPcI8p3hoUtgEZXo9dL
         cu28CLleBck0ulHg8fP8v2oDVF+znXr3uBQCT813iNpPE4AC/4TzDi2NiLX346htmyxM
         okqqAaX2B2Cl1Cf118dq68GYbzBkW1AUZoKOVLnXUPIDx8JKFmC5OXLod09WrU1lypFR
         hsEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755763268; x=1756368068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BiJM73jXetXZPDg3FG4r1HGiBdkCRmSbEWZmqbaw5yc=;
        b=naMHzjNUQg/CN3NMoPjV1EY2X77raib5GfGT+BcZdHEJpfgH+W/zX6bYFqETFvoFrM
         mpMZYaZQMLS3JsLDUCsg9WNoKj/FaVS76m1Az0g1jsaka/uvLlmZUANtbC6WWsKZCUFL
         XWMshQNNSCUqBMG+JvQWMAdo3c8xAKB0VyHS4DQRIj5rMCIhvXP+2FPVr21/KmvvXrDH
         wiDCImAoLXML4mYnZo+aYiAvgjCsJCoVeGzXKWsNwKsrwV602vi/XUGN5zz3GJZynXNF
         6j3ImADPri+bR4p8/So8Gs8nFRuiChEk6Jk030mr4oXy7gx5EaEo1h+TrBeVG1PZp9Eu
         N+1g==
X-Forwarded-Encrypted: i=1; AJvYcCUYTuRZ4/EM5DfyomwoArwYKkBp/4/ddb4qR1zY4rFn2MD7vsWPRcscfWXRgfUAlDtDYh0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzbCU2iv2z0mESzQYg1VqUp6top88Ool4yFXELFgw5vfdXv95CT
	cGqk/D949UFLlDSnr5gNMNo9gWs4R1kJzwEcyCjP8PfLq3Xxcawv6jCovCbWh+YVx7U=
X-Gm-Gg: ASbGncti42LhcJ2h/72I/0G7tbByLUrCdOOBnm0YdYIjjAufn6JSIF2UAuiUMr+ci+A
	Jm2dc+vMjpTw+ltZw4JnmCOnBOzLb5laJovGJRo+mQ0jn6ahhAbk3ncmoztkag26UFhbgnU3IeF
	STaCq6SY6jxy+CTLshEsFW6b35aOJWRFud1M6BfngwL3qGcVsoIl8/asoC12L3qqTCtrEtPRXeu
	CBmtfWnd5JqFaE78NItWVVaIII4NO3nqCNOG4vgY1kK2sK6fMOE4WZVNb7VYjNxHOZEjYGbs0/T
	w+JLDWeIHyLUzVuXdMgCu3vQ6wTiPku5wSc2Zm6jNsrhtTN2sPADVS/gQrawxIhNwl2JMuJCYMC
	l7DWMx2UeU1sTAwQ7lkSyla5j+pL2Op5VZA==
X-Google-Smtp-Source: AGHT+IH3gn8Qycx/6jx0+ZrjQBw2uOwmfgWlfZLnew0fX/8+fSDm7labToVuHmhoQfKaLY1+ZXezHA==
X-Received: by 2002:a17:907:86a2:b0:ae1:808:85ea with SMTP id a640c23a62f3a-afe07e22fcemr84096366b.8.1755763267959;
        Thu, 21 Aug 2025 01:01:07 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe0051f99asm160445566b.80.2025.08.21.01.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 01:01:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: krzk@kernel.org,
	Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	robh@kernel.org,
	conor+dt@kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: w1: imx: Add an entry for the interrupts property
Date: Thu, 21 Aug 2025 10:01:03 +0200
Message-ID: <175576325985.37108.788865752007366111.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250819121344.2765940-1-festevam@gmail.com>
References: <20250819121344.2765940-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=583; i=krzysztof.kozlowski@linaro.org;
 h=from:subject:message-id; bh=UUyNC56jMamtus4MZ2ppbC8jQAbVbVoRYAvxv/kIeFs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoptI/a3T64yN5wlcUrqeGW4KNHuT3rYZvmUNH/
 ciOSNLG6IuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKbSPwAKCRDBN2bmhouD
 1/XHD/41SooDF0qcGmR2Qhh0gauo86YW3mpcfx1AzIwEZhSD324gIuU3H7MZBaG25RqaD06ZYeN
 +heUHEl7QH4vYE0OohCVvkoIp/GguLA6UcIbCqJGBsX39YrkXdp3FnDbOYnKd+szao3B/d54FsA
 eM49dfRC942RaPkWQB1Sgjo7IYRuqx8w6mvViW8JnRIFs2gRXjEKmfQ/El0vqe6E5k/OxNT3TFU
 MEOR0pfn5Meq3JXarvlpgb5sNM+dX/mOkJLvq8O6iIFrQVQFJleJ39F7mh18EcgivTj/K/apU+S
 vq7mRhBJu4slSp3B3oiXwF6cpy4zs6DJUchtv7oyAk3dfiqYZvh3E85RGWfsGsMXt1lzAlVDNfj
 xn6hzTHPodZtWTv52hXVXJ1xkg14rXs7senXyOhwwwaOGkqMz+XR1scYcLSji/L+ML2PgluBdUt
 pLlpX75dc57GnCpnNDDd33w4sYrOMfcojxAC0dprF6KAqQmss3I+58yUv9Fc0NIojTabKBlqc7t
 tk4wbbpO/snTfsI39DTZOcJ4HRp91pESOOf6MoWqQ0ROphHbFQgrAdC9sRIlui593hksQdmeVVd
 rnpy4GeI7lpgH/5WgUcWGbmeqfZL7nlc+alCh9hM49IKGtGRbINi4wDZ3KiTHQYyPJnk/fXkbMJ dqTkIVLo0L3lS4A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit


On Tue, 19 Aug 2025 09:13:44 -0300, Fabio Estevam wrote:
> There is an interrupt line connected to the one-wire block on
> the i.MX51 and i.MX53.
> 
> Add an entry for the interrupt property to avoid the following dt-schema
> warning:
> 
> 'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: w1: imx: Add an entry for the interrupts property
      https://git.kernel.org/krzk/linux-w1/c/411053cb6657a3cf8db50a2d004a112070ca14b2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
