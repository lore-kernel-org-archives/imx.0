Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7FE1DFDAF
	for <imx@lists.linux.dev>; Tue,  7 Jan 2025 20:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736282193; cv=none; b=HhjUI5p4zhveezHoUcSoqYSdB35n21VIqYnyjn0/HItToYBChLteRnELy6y4sz0r7xiW/ceG/CI12uOQAzb75+GfxMxzXbPMYzWgNKS//GCODwY42UFSEo/x0gemJGgFb/lDIfmcPKSSpMOroK3H+LOllzNnnPbOBZ4vikSTjcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736282193; c=relaxed/simple;
	bh=qYQ7E76CkhHf7z8mHbaeAvsIbpxTsY/ZInvAEaM94Hs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FwLreq1Wq7Hb3B4t1nra8pZgNYTQqCXfPMPvaPNGl+5rWULld90XGfoA7wy8YrRiPL4e/gQBkG94THH0/hFX02zmpC0VK5VUIzoo3KfpKh0HDpVsMB4HLWOnfm8mvQrzrAoYa6bmjEdDoqjBPrO4lslGJSe68nlxim/wcQQZu68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Lx7D3izw; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Lx7D3izw"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-219f8263ae0so187687065ad.0
        for <imx@lists.linux.dev>; Tue, 07 Jan 2025 12:36:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736282191; x=1736886991; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5J+gh+iXgRwyFdRk/bfAnhtBt/J24ElglqD+pzBrcM=;
        b=Lx7D3izw3z06D7qQazVC58QUWqUYA2R2fQFabfxo25IYvR/1hkNLMVRKLQ74SiKKgA
         RLF5O3DaUc13FqfgVVOd2rGDkvIHsUEK1NajoxdTHHMC56voPBI6q72gcoMj/sCujb9v
         sosi4jUTRNV/P1cDYhSrW0dua2qaKC1va9JOWi0eL2elSsqArd96/Wi3R42ByPK4XGZc
         fMQpstX7WdmL/QEspxQMsdQLBlClu5gtMpYu5zqhoOja0X3QUKEw1HtbOutf5ArZ1e5t
         auJB+ZEgwhuoe4clSLl22B38QSCW8p1cdWVRJ6+GA8BvOSG6cupiH3v85KnK8iXt0Qvd
         n92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736282191; x=1736886991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k5J+gh+iXgRwyFdRk/bfAnhtBt/J24ElglqD+pzBrcM=;
        b=ogg5B52hyYnMbr8dvcGtZ9A3S1hFagu2D5bSinjCkSqy3Vlcp5nZdEOHqbpO2Hbf7q
         6MFcdqumxr9WoFoi3ZvfSnhpDIcLE5MbvP9fH+i6jNUUR1wtZ4aqOxU8olEY9I90qBCC
         jE29w9uuQNMukWdU3UrqFw9BH+0cODcSCHSbPC+GNLnNq/h9yJ8tTvV3XCdvnhPkL3pv
         ANxDmf9avNfJRvcz0wV8in5j5ESu1aNj2GMfCap1CScQsxywlqegL+zTCcHF1GFBmwc/
         YvIAr45zbwTEOU5IlkL6aBQfo7Xl41OXDJuajYfjCn2HWLuqmjI/EKi7iikA+xPYBxn1
         CHqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjoNPDxCn4IbUJT1SWkIuReD4Y5kPxktabGL5QeWCeM7U47zq7bs3SFFkcH55IO1Vnmu8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzfTM3ZR9g3HTIo9SnwEhH11/ds8tFOAPN3BkxLL9mLfWpXB7eL
	42jsq15PS0x/IuylF8fftnKhwktN65mo2m85aGx22MalAfNuMoH2nWAhKJ2YFWtSgf/F5p3Dff9
	OdTskRHTb2O9c6KV9fkr5aC327uo=
X-Gm-Gg: ASbGncvzJfIRxVWbOgMlkgvdkB/qccBV2ZFzCHdfPTwL6ZhbvOxL+HNkEHbRG2sPhT6
	6PK1nnx4ly1wkrOZs+/0F/N8yc1z/1cZc8Q9FW5dGMTNOJ78oc3kZ
X-Google-Smtp-Source: AGHT+IHgiQDN0G5/PdDd430gJpVrEIqkV02owORB8V1V6tlHZDq0VmXjlHDjVTSTRjC3ezsidQtyveZkFyttC72Msfc=
X-Received: by 2002:a17:902:f70a:b0:216:8319:2949 with SMTP id
 d9443c01a7336-21a84000ae2mr5997805ad.56.1736282191527; Tue, 07 Jan 2025
 12:36:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250107125854.227233-1-krzysztof.kozlowski@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jan 2025 21:36:20 +0100
X-Gm-Features: AbW1kvat2n17hvPwDrGQUj8U_8QFAMpbYP8hJMpXB_xRYGmIfR0aXMkOm1WMYyw
Message-ID: <CAFBinCCqekcg75YPnck5NEiLftpiDR5KhX7Ngc2xuRKpbMik+A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: Correct indentation and style in
 DTS example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Jonathan Marek <jonathan@marek.ca>, Mahadevan <quic_mahap@quicinc.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Jacopo Mondi <jacopo+renesas@jmondi.org>, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 7, 2025 at 1:58=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
>
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../display/amlogic,meson-dw-hdmi.yaml        |  8 +-
For amlogic,meson-dw-hdmi.yaml:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
