Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF4026B2D5
	for <imx@lists.linux.dev>; Wed,  1 Oct 2025 07:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759302788; cv=none; b=cNBI7Bapl5BT4kOEHqsEVdTSsQhfJ0cPpiGYCyokoNoI4F8oCCNmSVXbr1H0NgoocF1tqhOlHYLrmcZ5a0FjiIP7PZnGp54te77HFlJr1wHtaCfk9/tBRbW0xluug5SGiFSzKEP9wg0+NfgF5FoXi4nF6pTidp0pF0jsaFUws/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759302788; c=relaxed/simple;
	bh=gn606qEqm2hshhJbXSi61+2qare/jJSVfuZCykBiNeQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=DCDO8LpHbCh1b4OCdSPFIVKES++KRHyzt36V2byInlqDVWH7jFwsz1OtSZkRUtJynC6HHLGuzukBqKJ6MsbPd+5CKSBbGXkpsSVohdjaVN1B+3SACs0ByAnKsz+Q/Q1ZIrBhJDhHYVm18yr0EOmeEc/bhMjNyOQLTScJJEOCxkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cv01QrpO; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cv01QrpO"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-46e501a9034so21093055e9.3
        for <imx@lists.linux.dev>; Wed, 01 Oct 2025 00:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759302785; x=1759907585; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFPDhYu4aFFhwsNO2KIFrINwTJBQ61Ce1m0mUZPP1Mc=;
        b=Cv01QrpOvpzq5WbtWRXN6Ak1alIhSUBNr9iXZtKgTTKcltUMpamE+f+7RzoGL1ZNc9
         UiIHtMUp4g1kJnI67SQ/Qlql79hH3wf3fwpKCAbCC1X2791/fJhZPPxi2UdNifNe7YLi
         jYusPRcwnb5SkUcBuHBo3wVeRJRyzqlubMi/SsymqErRkyEbDGKS4VnBubXu4D65zskU
         rRH85jEXL7U3b8mLe/Ac6JH3GOGr1D9ft2ggUFZzjX7GkzmD1dUBByl5e6y236fcPZkW
         WZzArriaS5Qohct8t9WxPp2X1yueaAEb8YD6gsWlHg6cCC2GzwEPPAy91Rs5sWRKI+oA
         KEPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759302785; x=1759907585;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pFPDhYu4aFFhwsNO2KIFrINwTJBQ61Ce1m0mUZPP1Mc=;
        b=dZGsgUdBEMWW/oqQZIYLtpPkBKTrmL+WBmvhaPL8dVQXEfWQAMgvAVzamiuKG5LZxb
         qbp6yrIpgR48fcOE6CIgOzv2TLAtSWp4yOh88wrUCnj70bzbba5DVsDBEo7Ct8M1gUaU
         3nou/Sl1j42I0h+vLkEj+MNIQ7g7354AMTzHbD4rjuq+FoNr6/T0eIvUmNaLquZpRNT3
         k7h3sVTQyax1bO1QMYLI/XXh9H/Dkn+zKkS9xJUbexMc+De7eSmuLW9BnNKC2BYcmMKx
         YkXXui4KjtqeXBUPH3tIe6XitS48KvP8b8ELaWyn7a6sUphYctfYuhf5DIbLaHEn/Lfi
         sgjg==
X-Forwarded-Encrypted: i=1; AJvYcCVC/JhO0VtlaWl3gY0CTtf0hjCNzHJJD2qhCEEGw4OA7WQKurKJbGi6d5Bblnfn0//RVoI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy389+mlUvvwSOPK2x2JDDPY5C+0eYk6Bz4F24QQn19R7ETAPNI
	AZz6/QDFDWIeogGIC3lmdo5DTe4jFyPyaY1cX+sqNbpeI40HTy5iYFSTzSAPAq5Jtsc=
X-Gm-Gg: ASbGncu9DxLNNQHHEigaHLmdguMGQ5xO6nihZwpO9mkrBjuprYy2xgO7ZrTRDW5AZTH
	mXRBWGqvSFidtz42TXX2ZJnQ/1uc7M/7WVR6Mhilx4DOfFAMkmyBOeJ2F0WuVbVXTcXIToZL99P
	cOL/T41HYAoN+WygE6PqO/67pNhKH/PElRCLImOkDZr3rnKdNSSIxY55GOpRSV4seX59CCmcqbZ
	55GWNBarIwatKjFvoCPAI70sK8fWYLJI0pqN1HaYg9nfAiqmaLfuFUICC8x1PrdKJa/PFHnW3ga
	Zuh5TEt0s/2gAGAGK01iSOyvILx1GaYBtVL124PANPspEa89CuFJALDyVpzQnXh8FbRg4uJeq0Z
	rXteOrVz6GRp8TM2HnXcQeHTavrPcZ1RQKrFR9gq042fpmuYOG6uPM2HCNa+7jpjvOg8=
X-Google-Smtp-Source: AGHT+IEJybYivB1tDKi+V+W73mq1doiRwwO2NMKjXDaYOQiM4qmPaqdgd0jKteaSLsSgV9Peoc95Ww==
X-Received: by 2002:a05:600c:c162:b0:46e:37a4:d003 with SMTP id 5b1f17b1804b1-46e61202096mr20188025e9.8.1759302784682;
        Wed, 01 Oct 2025 00:13:04 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e619b36f9sm25077355e9.19.2025.10.01.00.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 00:13:04 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-0-b492ef807d12@pengutronix.de>
References: <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-0-b492ef807d12@pengutronix.de>
Subject: Re: (subset) [PATCH 0/5] arm64: dts: imx8mp-skov: add new 10"
 variant
Message-Id: <175930278378.421667.15230947171150357707.b4-ty@linaro.org>
Date: Wed, 01 Oct 2025 09:13:03 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Thu, 21 Aug 2025 09:55:27 +0200, Steffen Trumtrar wrote:
> Add a new board variant for the Skov i.MX8MP based family of boards.
> 
> This variant uses a different 10" panel than the existing ones.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/5] dt-bindings: vendor-prefixes: Add JuTouch Technology Co, Ltd
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/e3579cd78ed9945606d281be16708037eaa12c49
[2/5] dt-bindings: display: simple: Add JuTouch JT101TM023 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/510aeefc7c362c1dca57d0d3892fca07d4455141
[3/5] drm/panel: simple: add JuTouch JT101TM023
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/73bd4835f84b5f78d65f37bc97c764cb90501299

-- 
Neil

