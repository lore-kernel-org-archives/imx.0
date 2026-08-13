Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B913B9DB6
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 18:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786645732; cv=pass; b=XGXyZfjY5V22zooT/w7ksv04tOmeg5NrghT/StIRWXeqiS3jcfhn4Y720ZHysqocMIIf3NgOKhLfJKVhrdel6caCgjq+UZZq4xu8H5ulC3Q++rTn0OkQUpAlKKePLd/UKN7CbtsC9TR3Q+p9DfGQ+FYH3i8zCvfKFRoN0Mkrq2Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786645732; c=relaxed/simple;
	bh=MgYHjE0rvaOuonMGe+vIDYz9g966fBHZGfyHDLSnHq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CQDtD9mjD7Tdeo3gHcPEJ23GBzOmGlmNcnF1IPjoekaCMm1hyONZAf9Kw3p/tu4MtkD9ZIws7VapuMGyN0wCPh9+HeFEIan/OdlnHElnEgY7TntIEk+qHT4JeNIj8DX6bQuZjL0kfcQfFOvHYjZohytgyiHQ4oPfaixY9LtBdEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OTmotMl7; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTmotMl7"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-39c7fd21b63so1306981fa.0
        for <imx@lists.linux.dev>; Thu, 13 Aug 2026 11:28:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786645729; cv=none;
        d=google.com; s=arc-20260327;
        b=gtLVdMcvekezpN7IS5gj783iTu3l1wfZs2qVGOF9P4cw0MnplKJorqDzZ/QtU/ifxe
         a/Q9JjjVL3U+BOkMdKcX3MD77J42/Frco2nWEZtV2I2F1g6Jm1KtW69eG6bLxEiF85mW
         NT5wG7A+IqHflRyUZ7HNYgbDTelvQjPX9QEp+bfKyRlPX4ksIsWJcxlxm3OLMs+I4Wzr
         t/5Eb2bmafmuBFtO/ZWdoOz+wJ3j2qFxPUz9LH90jJM3j/3x0YHXuLhjYCNoN02orxR0
         GTGbKVRRB7f0Jl3NYbIOAfmoHTGAsxYSNuI/3ng6SDifB/YtIbfD8+SQfUb0VC+qSB8O
         rnFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MgYHjE0rvaOuonMGe+vIDYz9g966fBHZGfyHDLSnHq4=;
        fh=DI7NuwNjdEk0UO05qnQYe5HvX3jhMI6Q66Uk8VaCIRI=;
        b=G/MYL8ZM3AO6lWSo3SxcRAA7vsoQpyg5WINmEXicOTYizC2v9wyzTG2MF5ZC0N6JNW
         Hv/S65+wBAqI6dL8R+qMET7LDPxF8t5vyGj+NfCHbYXOKU9weNxLBH5z04IIqz7xnAAr
         tfx3GnLB+ndLUoR4E5SBqdmuvjCJpZRQ9QZBSpTAaQPyYNb3sBnJ/hWG0BgQ1voWbQzv
         hXCRpboZ9f2eTVYmC6dhk/o74VTuGZRDYtpN1ogwSiOYNYUvT6vhLSpa2D96QJ1kevzH
         7hsUQtWjRMTnqD4sstwPDHyh10esi/CjHkq+7BZYIuS9JAr5XOk3j2n0OYvKnHMPLXWI
         q+qg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786645729; x=1787250529; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MgYHjE0rvaOuonMGe+vIDYz9g966fBHZGfyHDLSnHq4=;
        b=OTmotMl75xR6xq6f2hJZqtFVWtLncASerdpUFTpD8YN0ILN1CHAHZM6W9tOzgs4zuT
         hUQxtl1wzCXXNbETR4jQTYv9sKro/M6mOo6C3RCG+goaEssr7H/7o4kJRqsFE8z+22Ym
         9LwYOgThqHRl71bu6xPYkN6BuCDW6eeznIPY89tl1+TH3Mv8vwQkw0pdG8EYAbVuE2jX
         TYfIpc7If+4ByUckC7yKCoN4k5d1koh6ga2j/J3HG6tvB2tHzAdbWiOcbd/mkRsBiT4j
         9gEoTQZ2i8+tGuz1Wq1OOwUHHBL3pyoZNpjRnbIBtStvndfe+TDCYcNTepWR+rOXO9LY
         oA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786645729; x=1787250529;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MgYHjE0rvaOuonMGe+vIDYz9g966fBHZGfyHDLSnHq4=;
        b=jqlSdAj/xayp+TZ1uo53mur7wCeBV5s5DL1DucMXXQRAzpv60LWv+WM2knbvOgqfcH
         OSM8CyeC1bYre/ws+Gxf2PnSGO6lgbK/Mn07TARgI/jLSR9YuWag0/d5PFIy/FOdHl0P
         7F3GVBN65hpq8gveP0gIhbcVhlhnut/+gNLDzSjXhTS/V7gwFNumajH8CmvZ5x27DZ4e
         +p0n3nWRr8ggbz6iZeNJmwOZ1zDHnN0GFhyW2HH4Mv15YtMxKaw2MQtbL9TY+i5jB/Pa
         gLws1B+UfG4nf1mI/vtng6MLJqr66lWJhhH2oZyLq0itH3pOPqChy4djeIVWW8+RdE5L
         cNNQ==
X-Forwarded-Encrypted: i=1; AHgh+RpSRZzp6mjrMEH80lnJoutjAa16t9BitFPXxC5+YgeyqRhXrxoZTvf69qmNEoCFaNV10Go=@lists.linux.dev
X-Gm-Message-State: AOJu0YwfR4vY6le2j6OcIgJKLud5oUMNqgu6rhCsdxl+iL85fKi8zyaQ
	5yPWCVnUpypQa7ySFy1dqGJVer7IdFaJ6buid4hKHAlngEuSKSbiaBapzrBSqhOopNFgj6O0UZQ
	25dvJUTHOXAiusJZ28nuXIdRaozzVhB8=
X-Gm-Gg: AR+sD10v8ebQAvK78LxDnsmhL/ZMns144SDNP9h5BAjcFX+AyUN72XNCmJE2k0hvh/M
	iLeQ70zBHZ32mpptlAMCQJx0ar6OG75IVXJkrvdXjL4MV1AWPtuif4JZsliSavIZJcjP0yNNdiq
	oyc3iUfnhJ3QV35YZeCJ0D0MqTqyORo/4/ba64SIfzdK0RR/AZ8wVuWl+5QnSOcGPnbLZpSm/eE
	Ln0mQS0sQj92hMh//y0kdMGfutTLHNxDrZtkGRbW+XFCsBTx2BOqI3/CT8wvlJKgPUxF+5b/Res
	67zwhBYaOn2I4slep9WD6yjtJwqqUqUFoK3fRFTgn7mJ0rni8rl6lAXLw2rUmXwFIG+3n3PRTKY
	s3WfDRBkLb7rc+/fM4wvmegrxyK2oqVk5ug==
X-Received: by 2002:a05:651c:144c:b0:39f:a2be:bc3f with SMTP id
 38308e7fff4ca-3a1324a50b0mr553821fa.16.1786645728923; Thu, 13 Aug 2026
 11:28:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260813161101.2274327-1-mehmet.fide@gmail.com>
In-Reply-To: <20260813161101.2274327-1-mehmet.fide@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 13 Aug 2026 15:28:36 -0300
X-Gm-Features: AUfX_my5p0yWdwpoBKfTk9A0esYAtB3NODe2jCHwBG5CaU5OZpEHLSdJGKH_EW4
Message-ID: <CAOMZO5BwLCRd_cTV82J0KgPfSF6_kUKiSUbG-SKxNxiNu0VKOg@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] ARM: dts: vf: Iris carrier board for the Colibri
 VF50 and VF61
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Stefan Agner <stefan@agner.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Francesco Dolcini <francesco@dolcini.it>, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mehmet,

On Thu, Aug 13, 2026 at 1:11=E2=80=AFPM Mehmet Fide <mehmet.fide@gmail.com>=
 wrote:
>
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>
> This adds a device tree for the Toradex Iris carrier board carrying the
> Vybrid Colibri modules, plus two small preparatory patches for the
> module-level dtsi that the i.MX Colibri variants already had.
>
> Everything was tested on a Colibri VF50 on an Iris V1.1 running 6.18.

What about the latest mainline kernel, 7.2-rc7?
