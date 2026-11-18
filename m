Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794974338;
	b=G8hK0gm1HwxFSs4axElY4unD4nJqijkuuO3xcUPMwIpx1xfhqAmvRFEjY3TjtlOKZWF2
	 oTaEdU+PyjK6PDf+TNU2WO3cvc9GuaRIRRei1dfUu4/8vbwFHPW8CCFUTvJX1PNTMwrHM
	 Dj8KreMpc602cJf7JYKSAOGLTl1VJ7lEGEFzbeQzNfCasUXnm03gbqVhHrZ2uW0sk/B97
	 OJv8fuIrHmp3aiTc9H94ONqydZVSq0VrbEpIbSeuFkKjaLQkK7mc3ToNagW3zW61kGme1
	 DJFjhd+thuOdSKaHdHiz9wYU4efM0pdAm8i4NS6h77spk7XOAVHaBN++4uld0VtpyZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794974338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IOskFv7B1qRwSI1xnDutWFbR8KW2ByneEJ1ja9wWCsE=;
	b=rLliFQS7pi0Ss2fl0zCXL/E7pqGhmlh2vtAw2kwrWnvOWCJt8U5oEA+OjnIA8aD3rSTQ
	 h6YD7u8in8f2S3Dmi80qzg3kt1BPHXrtsQZjq0uvyDiZaXzQlXpKw47FnKYGpDlLFBoei
	 6SeYVhgugc3/BabJbU16AzHRaFALicHt5ewjQI5gf78+NvBO8FEHkBrPLIBau/PYah+01
	 MkMmTxabutJvOB/vUa2N1fncVmI9W/gHelhy9p6ipvE6S6gye6EVL2qZ9S9Ak2WEZva8y
	 DuWJV/bTCx/EbcttafZgdWLmkzicmQZSZsDuybXV3CQvufSNO+yIP97cKmaaSr+wrDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IgXzMXNX;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D99606A31C
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 03:58:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3D99606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IgXzMXNX
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c50933bdf4bso110074166b.1
        for <imx@lists.linux.dev>; Tue, 17 Nov 2026 19:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794974336; x=1795579136; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IOskFv7B1qRwSI1xnDutWFbR8KW2ByneEJ1ja9wWCsE=;
        b=IgXzMXNXPq/Z0YinAyKidLWa63/pa7llo9kfOsfBRux+ySwNDf8ewce3no+h5kYwhC
         MpTbAkjGtfzHAnWrAQxQjU5VjloMKFZSIbEeVssV5R81zCjuErMaXA7qz9L2ojdUpZqz
         wyTNBafOa/gz250dogjsH18dFZ7zT4uKb9fOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794974336; x=1795579136;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IOskFv7B1qRwSI1xnDutWFbR8KW2ByneEJ1ja9wWCsE=;
        b=Zeug9ArkE+EIlACV8Xno27x7BrJGp7pPLiayJHnJsefQUVqgf4S8Hkr23PWjb+Weln
         yBsKTR8XwLtiWo8QTzyWcA1fYiQ0IlkG41lPBjdZQf/wJch1/mz7ITpSURxAlYeW2Ulv
         VyuvTFozhtEZRFdqt/E5OCdS7m7IiF+1NdkEo73ug4DDAME64YglqTJORlAdVszchqsE
         xWf/zMUKHiYuNLw1z5DBN+4rQA4Wd6bfizwhNVjiOp/26F7B931f13utRVTTc/78obn/
         ZgvXlpk37xd+3Qw+sksSMwxj2H58SUMRkl9+EoZDJYyimFbLVPSSESa+WR1HIYO87jny
         Ii2Q==
X-Forwarded-Encrypted: i=1; AL+hErGSZIOh32GqZv63pmPBVgTDK7abBhsv+KMC7Ec5qKLPnXlnyMy/NgrltEKIycILwO7EorE=@lists.linux.dev
X-Gm-Message-State: APuU4Z+ngV532B5gbi2FQ2d5nSgwawxp9yIizf5TxKMoWLkEUIGrBR4h
	grLLKJfHYN/SQ/nKCDFG3om5wzCtotSEiiUx0NKa3kEqrlfDHe17FwFtMDYrKrRC7UsLqQrBOIg
	5pvjE6GD+
X-Gm-Gg: AYBFou2jzYUV1rSdo9MY2+42JtdHteh40b0CvqcNjbj3Jg9EfVRWYEsYhLVjx8ltn2b
	BBUMIZ8O5/SwiJDFw0zfs0VYzwV7+B6DkFHO2Pvdo7zkxtsFhe1n1j8ktpnLspUzj3pSEPdfi3+
	FIxVnCw+Eodz8ubYnNf+9ZGljTqNq5kSeaxE8SMsE5jq/k4ycFX1WcnO2aWf41uGwh1kVz5HCP8
	XI6m0iPmG5KEgfxUdP8lQ0bFYh5bxn8C3+tl3b5/6i4bsWGnhe485Kqj89ECI82xj5BQD/vhVFL
	ruBKtZW2e1lNTKDMj/bgUjHPTp5VcJ/oOb6wu/j5/qOwY27LKCnW9y7F3VF2O6vsXxatPwazrBd
	vnedecn3zzUfr1GSSJquXkCPqu/HhqLaoU62sx5ySIVjy2Sj2oTY9sIQFKRT+xF6XvS1n/ukudq
	+jw8/5ELcMsVkoDn40ZawpHKiHqW3Lwoczdl4cEzPqtlVbTah3YhZzc5gLLhuJDGyFQRjo973bi
	lZgCG9Dzq2NOTls52X155SDxqCrufmECUNyMpdDaquVW8qv87f+mKn5O/bRBsi26fxCU3fJgR9r
	pLdPnOaxiahsX45rhu9o+d0qvEVK1IAon9tacTQX3tbzHXX/4mMrBxDxruLSAuw6sjdY
X-Received: by 2002:a17:907:84a:b0:c40:9b35:ad91 with SMTP id a640c23a62f3a-c510e2b7e2amr91851066b.13.1794974336069;
        Tue, 17 Nov 2026 19:58:56 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c510cab3000sm51410666b.56.2026.11.17.19.58.55
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 19:58:55 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4d5b2db4bbso105123466b.0
        for <imx@lists.linux.dev>; Tue, 17 Nov 2026 19:58:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFmpU+ttHvaBgiwl5aWTjeaY4F/4hCZeZYm/y+lUAIip67y83GcAUs3BH+6qXkaJGu7I7w=@lists.linux.dev
X-Received: by 2002:a05:6000:2893:b0:498:364d:7509 with SMTP id
 ffacd0b85a97d-4a3774cbbbamr10035694f8f.24.1794974022637; Tue, 17 Nov 2026
 19:53:42 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261116-reform2-internal-panel-v1-0-765cf8d5ff4f@igalia.com> <20261116-reform2-internal-panel-v1-1-765cf8d5ff4f@igalia.com>
In-Reply-To: <20261116-reform2-internal-panel-v1-1-765cf8d5ff4f@igalia.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 17 Nov 2026 19:53:31 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XQ0Nw6tuUjr_pC_DQnWQZ0XD=jH+_djvbduQSd3XSrcg@mail.gmail.com>
X-Gm-Features: Aa3M54pcJVKrzVh9hl7PlSfdr6bBBDt4Ls2uHxZOi9oF_y8egwxD6E6UxsIqAlM
Message-ID: <CAD=FV=XQ0Nw6tuUjr_pC_DQnWQZ0XD=jH+_djvbduQSd3XSrcg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/panel-edp: Fix Innolux N125HCE-GN1 mode
To: Christian Gmeiner <christian.gmeiner@gmail.com>, Lucas Stach <dev@lynxeye.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sam Ravnborg <sam@ravnborg.org>, "Lukas F. Hartmann" <lukas@mntre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Christian Gmeiner <cgmeiner@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 16, 2026 at 4:11=E2=80=AFAM Christian Gmeiner
<christian.gmeiner@gmail.com> wrote:
>
> From: Christian Gmeiner <cgmeiner@igalia.com>
>
> The mode has a pixel clock of 162 MHz, which is 70 Hz. The EDID of the
> panel only has 60 Hz and 40 Hz. Output of edid-decode:
>
>   DTD 1:  1920x1080   60.001038 Hz  16:9     66.721 kHz    138.780000 MHz
>                Hfront   46 Hsync  30 Hback   84 Hpol P
>                Vfront    2 Vsync   4 Vback   26 Vpol N
>   DTD 2:  1920x1080   40.000692 Hz  16:9     44.481 kHz     92.520000 MHz
>                Hfront   46 Hsync  30 Hback   84 Hpol P
>                Vfront    2 Vsync   4 Vback   26 Vpol N
>
> On the MNT Reform 2 with i.MX8MQ the picture flickers at 70 Hz. Use the
> 60 Hz timing from the EDID.
>
> Fixes: a14c6b0eef77 ("panel-simple: add Innolux N125HCE-GN1")
> Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

Hmmm, this worries me a little bit. I know that on some boards people
purposely set a clock rate that didn't match the EDID because it was
the only rate achievable with the PLLs available. It kinda seems like
that's the case for at least one user of this board. In commit
eb893e34309c ("arm64: dts: mnt-reform2: add internal display
support"), for instance, I see:

> Clocking
> is derived from a system PLL, which provides quite good rate matching
> for the single supported display mode and keeps the video PLL free for
> usage with the external display, which isn't supported yet.

By picking a different rate here, you might break someone's setup.
...or is that your setup?

FWIW, it would be better to change how the panel is expressed in the
device tree rather than changing this mode. Can you change to using
the generic "edp-panel" under the AUX bus? Then everything just comes
from the EDID anyway.

-Doug
