Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793017532;
	b=HHiEThqlvHQJhJq8NBYDraMNP5CdhJ5YrKC1RW8RDiAe5qrXbbPg5VqR9ql2M9oE4/kd
	 OJLca/3CoW8oAP96N8KnoXeqkEBXDwSQ5S8z8oed7dnALdu1ohYdSKolX3L260waMot54
	 avFr5pDEVLzMcK03aUAjcX1atQUjcUerqV/Q9TjuOFx9rqSUgHq0edmC4VSoAKa7uvJJg
	 3r//KXH+RHDRGvrFigYFB0sGPnWFVxBtUDq9cQd5CPGWUBrITgzy0o4lMzfFS9CgrxO61
	 MNM+IIK89KNJ9Vt33ujRMS9EWx/FE7IT0r7+TfFC2yd+2r9E/BARTto9kRJza7kH5Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793017532;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Uy/PqV0xn8AdfJOF2rmqxMZ7uFIic9NZvt40QP1514k=;
	b=g2BjXU7GfUGYpt/8up7zA/ptot8W7uFYtKhS52dqFsHZ29obeYxpPXh/RxpQqsekNIf3
	 FziZP5Ki4yz95M72fTBRcXii6gV8EDERcVr4SaBTJYy+YfGFFAjgVmd0KErI8ID0EJoyF
	 H+BnuHUFG5ldQKvJZHy/iEtSNwcutJLOeFncAUo4WRGSdVqXNuw0ct78PCkIqbrmGh96p
	 m/kubXXYrnp16/HwSQRNkBCb09mDTCP4dH0D8Jz5qHOATrsIrS1z6RV+ABVuVfyUts7bl
	 +3CTTzGqw3DsS+X85KX26VMyHYKzlDpSZqd24ZO/4tUtYsXB/oQCpcMPJoNtnCkOKTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iQSBDIMF;
	arc=none smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AF2606A31D
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 12:25:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00AF2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iQSBDIMF
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-97ca72f2cd9so2138149241.2
        for <imx@lists.linux.dev>; Mon, 26 Oct 2026 05:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793017531; x=1793622331; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uy/PqV0xn8AdfJOF2rmqxMZ7uFIic9NZvt40QP1514k=;
        b=iQSBDIMFFiviWdvbN7Utnp464KZwm1kqvTKzxzhI3XjSGtgvpfRXpMmgFfNyCIzk8I
         nVmEUYnTdbf3576bwyfqXA4lXsfdh5LaJA49+/Z8xHGoJWO9Bqk75IP5oodxOfzNAQVl
         jjSpnjlLvYZtCRXkHSWMQ+uPLbpk9Wvl86c96g98HZp18US6N+HLE4yMurKSxXq/u06a
         qGjcjrkvG0UqA3BmcWsojCY3q3q2YmvLzt2Uk5qhP0IaA2+XlCVT+vgxHzzPRyr0MZ+M
         mIjtCbuOoxGxUVgW6Gv/P3/zH8FW+BWppIW1dSpsxmImeHNDPujYWWckOxfAJ9QhVSfw
         7/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793017531; x=1793622331;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uy/PqV0xn8AdfJOF2rmqxMZ7uFIic9NZvt40QP1514k=;
        b=TRwHYT+JJ4/MYWlw4cksiI0QSgAgGIU/pc5KnCWRq6zXvPTA+Ly1oomTBZ5EdYhH/6
         8N540+Q/waZxhQRlocgkhXzXrAMtpuC8FyxMEwOqu7aXMWsqh118Q7rx3OOLqsY0K4/S
         0VuLE0LNl8tj35KZO3Zc4IyOHzeP/4WazyMP+XH+FlBIc+St6IVZyo6oqtpsOuGHCvJI
         NJFimpjIiMkVCt6dATG7L3LHqipw9a9d2mV3zxtvIhkqT8mdoRse3kHVeVab/7dxb4F2
         rwLKDat6OYN2LlvBAcjv9TLmtA3KT/aCBiC9BkqFkS/E7nS9lIdagENo2B+OWU/fGQHQ
         a81Q==
X-Forwarded-Encrypted: i=1; AKwUvBzdYAcjSpKLqr7C38ya7xH5eB9zoWaIQ/49GQGdfoll33WgH0wn2nekFlag//oJ730ESzc=@lists.linux.dev
X-Gm-Message-State: AFq9FYKNT9aQFDfaCjDaOsiFSP0xd1k86WPPBpUbLnSQJKl+CY9Fw+AN
	8TMRcTfaNGDIi8zH+BBG00ZzUHywVUQvwoX+qMu7+56eUgbr1xvPW0G/
X-Gm-Gg: AYBFou2fGOPybkVV63S1KYiNMRaU4Vx814NEuVYubQRvDRNOBRbAOjgdS4NOr1errAL
	In8NJOgSFFCq6sNcfiZ48z2EfVBSHGGqY6gVaf+sdDR+x6gjDZcJDiV8y/c9J2cceRLPxxUfE4R
	dNGrWaLbfFcAicrFjW0Ge6fwJjAOq0SXz1j7CPOnXXIAc2eqJKur8gxt64bf1kQkAdfN8GptipJ
	/zm+leKBM5TolKRMsJTKNWG8NFxkPE4Rj0KVCS5+hA13uDX8GmTmz0Ru2CTO0wEPHapZFYwRbAZ
	w7kirOpQnFRx8SSSkWDvyyrCaYWi2R3NvKTDJTW/MZrD/L7ATEtPBuSaqclFzsjV4IUSzrRmiyh
	ijaZsPpatkS5n8BVVbQPg6w7a8UMpPuhz5jRMbhQx1aaNNkA6vB6JF4mt8CsHaMaWjhmaabUiZs
	6X41HRStMgrWYKWQXHtBPmmn6gg5kLTxyg4mC3YSeWfYGRp3yCHnu6p8FH/TTL/eGtNonY25A2W
	OxEVfvlPEiwGKC86sV14+gdEjzQcsfOTknl5XmkzUsNXAo4GDQCV5W9UifkIw==
X-Received: by 2002:a05:6102:604e:b0:7cc:1b19:9258 with SMTP id ada2fe7eead31-7ce5ca1e48fmr1995133137.3.1793017530653;
        Mon, 26 Oct 2026 05:25:30 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9910e7b7069sm8121766241.3.2026.10.26.05.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 05:25:30 -0700 (PDT)
Date: Mon, 26 Oct 2026 09:25:20 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH v2 3/3] ARM: dts: imx6q-apalis: Add VGA overlay
Message-ID: <wancrsxcem5uep5oy5pnw5prewefqah7drmhiu5wrq3ctykltl@akwvtqbebblb>
References: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
 <20261019-v2-apalis-imx6-enable-vga-v2-3-ef6a3a780472@toradex.com>
 <atZxhWaUWthEHkti@SMW015318>
 <lozimedmt3h7v6odvp4svvmatvk7726a4ztn3j7ft44oto7p5p@dmrudrmzyz3s>
 <ateQWqoTtXSBSBvm@SMW015318>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ateQWqoTtXSBSBvm@SMW015318>

Hi Frank,

On Tue, Oct 20, 2026 at 11:01:30AM -0500, Frank Li wrote:
> On Tue, Oct 20, 2026 at 07:33:10AM -0300, Leonardo Costa wrote:
> > On Mon, Oct 19, 2026 at 02:37:41PM -0500, Frank Li wrote:
> > > On Mon, Oct 19, 2026 at 07:17:16AM -0300, Leonardo Costa wrote:
> > > > From: Leonardo Costa <leonardo.costa@toradex.com>
> > > >
> > > > Add a device tree overlay for the VGA output available on the Apalis
> > > > Evaluation Board, which is driven from a parallel RGB interface passing
> > > > through a non-programmable video DAC to a VGA connector, without VESA
> > > > DDC I2C signals.
> > > >
> > > > The non-programmable video DAC consists of a simple resistor ladder that
> > > > converts the digital 16-bit RGB signal to VGA. The VGA output is gated by
> > > > an active-low data-enable signal.
> > > >
> > > > The overlay is also combined with the various Apalis Evaluation Board
> > > > device trees to provide ready-to-use DTBs.
> > > >
> > > > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > > > ---
> > > >  arch/arm/boot/dts/nxp/imx/Makefile                 | 21 ++++++
> > > >  .../boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso    | 80 ++++++++++++++++++++++
> > >
> > > what's difference with
> > >
> > > https://lore.kernel.org/imx/20261019-colibri-imx6-overlays-v1-5-e4d028727382@toradex.com/T/#u
> > >
> > > Is it possible share one dtso also?
> > >
> > > Frank
> >
> > Hi Frank,
> >
> > The Apalis iMX6 one needs to set up the connection between the IPU the
> > LCD interface (endpoints ipu2_di0_disp0 and vga_display_in), and the
> > Colibri iMX6 one uses a DVI connector instead of a VGA one. Most of all,
> > the bridge on the Colibri iMX6 doesn't have any control signals, while
> > this one on the Apalis iMX6 has an active-low data-enable signal
> 
> This make sense to use difference dtso to cover it. Is it use name
> imx6q-ipu-di0-vga.dtso, because this dtso have not boards specific part,
> which can reuse for other similar hardware? Or we can rename it when reuse
> happen.

I think the overlay should be kept as imx6q-apalis-eval-vga.dtso. As it
currently is, it's easy to identify the hardware it may be used with. If
another board is added which uses the same interface in this same way,
we can evaluate if it's adequate to change names for reusability.

Best regards,
Leonardo
