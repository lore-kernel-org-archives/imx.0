Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF16315794
	for <imx@lists.linux.dev>; Sun, 14 Dec 2025 21:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765748573; cv=none; b=RI86Xp2NRVvvjf/iaoBesP+xEEdr6l5N7rCyb+vkcpohAMSeP4WSzz3Gq7U/i/5dcKeaDcRxoXLgglMKdpCMuykTmxnrzR3jIYLUYIuUMr4Pc0yIlcu0ixrioHL070/YrGbKSAz4CeLYDrcFcr+VYY7Sao+E2DSmhbLuXALxKx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765748573; c=relaxed/simple;
	bh=9ho59uSAoTWYspH50cR6tVu+jU+ieBT0P9CayfXeAOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SEpPo8/Qbsd8wJ/H1O2SQIJtUzLdsMhq3C4+/FJwvr2nILFARYliJixouOlIk2ZWMVeG6Urxfxmm/e3GKd9BrMCMESj+mE+2jB961u0OGhoHfXJgWeLP3zwyA3G914SLWQ1UCK8RHFqnfaezFANWZwn9l6aCDodPizM3ZX08edg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T6qsnwGZ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T6qsnwGZ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so1939479f8f.2
        for <imx@lists.linux.dev>; Sun, 14 Dec 2025 13:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765748570; x=1766353370; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pK1WczCMZIw0u/2xZq8mRqHd/PyjP8Py22ENm90CJTA=;
        b=T6qsnwGZbPrPaX6xdonRu1RwBgzorwKudqdHLVBpNskU6KM0xC6Q211A7P5Wa+Ls1Q
         RLgwlp51/0HIPaHCAi5xKVQa4gcBc+H93OLNA8O7v1BB8jD5Ly96pQVEklne1G3AMu/i
         Az35YHpeohqLicvX8CFjLgFj6gvLtiKILa3oNrcknGK/PVxXSibMPT33o+CzddKTDoZW
         oeYHxiPyiOOZqFp5yNyiR1NiMywhusSQvBCYAiwiNMS2b70rP/pdJQJAWTVLr2Kkx4vP
         g5Wsh611QQ/26yqCwiGgDcjAhKtcpiAzkhoWFx+234OHSefbXqAMZ8vyn0ndJNBIsgER
         QfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765748570; x=1766353370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pK1WczCMZIw0u/2xZq8mRqHd/PyjP8Py22ENm90CJTA=;
        b=cKAnRKe0tJXNc3dOSrXJR67VUEp8feH3e2oqWfp/3x9NqpG1GB0xBDl0DuP6OqOJZ5
         JpBQVTTZ/mg+MsTbB0OifAUk/tiwiMJw2oe0Jdjde+X30Sw98NM9PEKgobUJ/k4N1c5a
         2DAbPcnDifxa7Jmx2npfo5gR3woLCGqvswDb+wYaKKpErP4xJV/awCFfkwTdI6FEWUNa
         OWmrd1vOUzqY46BwiT3bH73ExOIGKGuj3opuyNmAqFF4VKRvEJ6dnkx/JLUlkGX2rmm0
         aNcWkY0mCKL1x6veW6JP/WXWhkwqM6HTHNDcGijs1DZ8lq4LgUdB24K8Lo2ED1+8xx58
         uiWw==
X-Forwarded-Encrypted: i=1; AJvYcCV7Trjw27fGnQiywZQh3hEbNa255Ua9qflnjFgkm5T0XcMI55bTANuSPQR63bL6J4460tM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxyH3hHoa6zw/B0x52ihaVYdKwqYeEW10Uxv1cPw7QNikDSNgiR
	t+yKrSWgGz3R3/cAJYpwtZwhvmKjD39kn3CVQ7hi2AurMmuqXtELyk4M
X-Gm-Gg: AY/fxX6FSQfdEQ3Xhy4ckixQq/nkSWCNFQlxxvJYuxI9z9gUtR7oZsh4tugBrU4uFww
	djCE+bJSfuHUX5tDTq1GCr+X6zHMbBNCSYeThQ5MULUdMLwnrAT6hj/HZWbJH22d7v/PKgVy7ok
	0xBuWCrHUsBO/eDyPbO3vNvhMATZijur28unZ1av10edT22TwTsqC6drG/+8ZS1JpvrKlg01hV2
	X0TrTLb42mZAmNvCUiQV1ths1SBLZH2yDEQoZKr2sc6BOGvWdsmXt9Os4Tz1jFM0ce0Mqb8oc9+
	5Nt8/3ZLX6sGUT84UA5WICTiuUGPoxYgBCBzz9sWsHXrw+IJkiCq24y9yBeA6LGeEsbdFf9NRAH
	tQNOhjX8R8LEbngOOx4jttTMViShy0VTwK1BC1x+TQSgf39SBOikR4sxoVLfGRsqFJ1vgIZ/dsg
	UHYZ3RqS3tRTGBrcQbOotKlphKcMLrFbZBCdzYn5tAtGfD+GKdqDzWzcYDLrQl+cxj4UjomPVaS
	tkVMQPlgIgsKs1H3UzLgg==
X-Google-Smtp-Source: AGHT+IGSOBeRKEVKVoegRRzx46nWQ9m2s3+RwYkJz4Dz4oFh7swBSjzkSvsc4nPXR0ZZ6L2YMWaIlQ==
X-Received: by 2002:a05:6000:26d3:b0:430:fc5a:40ac with SMTP id ffacd0b85a97d-430fc5a456amr2022627f8f.54.1765748570209;
        Sun, 14 Dec 2025 13:42:50 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-5.cust.vodafonedsl.it. [5.94.28.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f7c3040esm5989065f8f.37.2025.12.14.13.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 13:42:49 -0800 (PST)
Date: Sun, 14 Dec 2025 22:42:47 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 6/6] arm64: dts: imx8mp-var-som: Add support for
 ADS7846 touchscreen
Message-ID: <aT8vV_5cZW99YIB-@Lord-Beerus.station>
References: <20251214110531.9475-1-stefano.r@variscite.com>
 <20251214110531.9475-7-stefano.r@variscite.com>
 <CAOMZO5AzuZVkD3rTLEDGFpCx0ovtKfzjZtNgGG0uLDXbPkiqRg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5AzuZVkD3rTLEDGFpCx0ovtKfzjZtNgGG0uLDXbPkiqRg@mail.gmail.com>

Hi Fabio,

> 
> I understand they are both from the same family of touchscreen
> controllers, but shouldn't you use the ti,tsc2046 compatible string
> instead?

thank you very much for the hint, I hadn't noticed that compatible string.
Even though it belongs to the same family and uses the same driver, I will
use the ti,tsc2046 compatible as you suggest, so that it matches the
hardware more accurately.

Best regards,
Stefano

