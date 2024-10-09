Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DCA1865FA
	for <imx@lists.linux.dev>; Wed,  9 Oct 2024 07:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728460560; cv=none; b=Vq6lelKdvG6R3S2NS/s7or5yg4/pP2JFg4nfwN5oi0Yc1BKhWg3obxZLOYH16EVtkKX40D1JxPYwanVgyp4I+dS0swDii7wKB/3nyIaHsN8/AXamUN/QIk8c5Gtn4y1D6i1NH74LyagjMh0u1qzhoUkhhKrQdLysk0BZqByS5FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728460560; c=relaxed/simple;
	bh=A4lSNrRXaEkXG8jgMnUAfOsb+5/EvFkHHsoQooCyPwU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EBqcQ3hu1ORxI+BqWvK3u4C+JXXuL9fcJocm5qQcTWHyG0J1JLzMP0WBOva85Mu8SSBEbMade37UDE7ew3DAc8KMtQN6ptgg1mAluji7xdoWISwNxXNI9CCL3dTF9ZqS6wtPFnlSKe0ao4iXVW/8PzIO9R6xnCkusvL6NTBjgzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n30OwXLm; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n30OwXLm"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42cacabd2e0so61533625e9.3
        for <imx@lists.linux.dev>; Wed, 09 Oct 2024 00:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728460557; x=1729065357; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vF+bwgt5K0DxX6gVjgMOFqltEB1h2u/fKc87de81MiQ=;
        b=n30OwXLmDLwxZLuf5Gugzk9lBrRtrpBx7umi4tG972uyanRCI2WzB7HbX0hvBspaB/
         nEUly5D60Nz9N8DgDlVgvNPP51S2h0Y88+3hO81DPfqKAuCR8dy03Oy+uYfnGmMgGbSR
         7gMKMS0DPRs+de4Kakz8cTWXkBqmjZXmaSlmq8iPCCfP0q6NiGIp5oeMneTxl6+2WFM3
         LKq1XEFNVZV9K9yxU2O7nOmsQvMWbjfGX7vzFwCiAK12GzDUPFUAocd7/agP1iSpw6ku
         9N0JWBO3qsNE5oJMk7+vgBMEMOgWixV5yFppXa/X5dGPc8VKMHAz1LnbOuXEFoIReAnx
         JdRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728460557; x=1729065357;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vF+bwgt5K0DxX6gVjgMOFqltEB1h2u/fKc87de81MiQ=;
        b=l+HLRGkIV8LmwoBoeipN4eB6P6wryh3tudLzjDNw3lE1FfOJXdwXU7oyHR5h71pNea
         zVcKwyaJSEtfUFdngxnJ+1IQUrhsXGl6IQJtc7R/lTS4Y7pch0pj5jkS5Nl/OpJ7nH8d
         qEJaRjYgVc3qILzXy6Xpt6eWgVNBJJzLvkz+Q5K9erC6uByNgjBJySvrydz8A87g36UT
         p0hLC5xzr0mbLCaiEXyB5Mo8MkxqeeYzSxxN4KIF16VLrmZja85eN+2ZGdvaHhGdwEjP
         Y5Le6wDHEQLWLc+sXuudH0jlKMBGNDK8mH7NltjT8NQWVD+MS5B3XKkz/WcjyyT2Fat/
         GjLw==
X-Forwarded-Encrypted: i=1; AJvYcCUj6phCyBKxshD+th9PbuZY5QI+IkmSwe24dWEvhraYpHxPdWAkL4Q+AB79tXT8DXFVxPU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwaeavN8eYRCnJSuOM9N7KlhWK7tv1QSi6BpkO6B60MOlB4hBOE
	HsN/DFhfr5ZJZPAiX+ucAr3wA3xjUPQlKyupp6g14mCseboGE6szDEtQ73OwYOU=
X-Google-Smtp-Source: AGHT+IHLlUU3NnG9hXwulDxBDdXbtdhESRXfgH6ae8spTgJdMsE262PfGzNXfp3eWmSSA9CE1JyGgA==
X-Received: by 2002:adf:fa82:0:b0:37c:cd71:2b96 with SMTP id ffacd0b85a97d-37d3aa84533mr951060f8f.36.1728460556864;
        Wed, 09 Oct 2024 00:55:56 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d16972fd9sm9660342f8f.104.2024.10.09.00.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 00:55:56 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona.vetter@ffwll.ch>, Frieder Schrempf <frieder@fris.de>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Chris Morgan <macromorgan@hotmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Gregor Herburger <gregor.herburger@ew.tq-group.com>, 
 Heiko Stuebner <heiko.stuebner@cherry.de>, 
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Joao Paulo Goncalves <joao.goncalves@toradex.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Parthiban Nallathambi <parthiban@linumiz.com>, Peng Fan <peng.fan@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20240828074753.25401-1-frieder@fris.de>
References: <20240828074753.25401-1-frieder@fris.de>
Subject: Re: (subset) [PATCH v2 0/4] arm64: dts: imx8mm-kontron: Add HDMI
 and LVDS display support
Message-Id: <172846055533.3028267.13306014745754490027.b4-ty@linaro.org>
Date: Wed, 09 Oct 2024 09:55:55 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.1

Hi,

On Wed, 28 Aug 2024 09:46:52 +0200, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> 
> This add support for the display bridges (DSI->LVDS and DSI->HDMI)
> on the BL i.MX8MM and the 7" LVDS panel in a separate overlay.
> 
> Only one of the interfaces (HDMI or LVDS) is supported at the same
> time. Enabling the LVDS overlay will disable the HDMI interface.
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] dt-bindings: vendor-prefixes: Add Jenson Display
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/763dc2cdeb2ac5a5067972b614f9f0603f716f9b
[2/4] dt-bindings: display: panel-lvds: Add compatible for Jenson BL-JT60050-01A
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/15bda06bc93fca828e5f11ca6b773fed19e45b8e

-- 
Neil

