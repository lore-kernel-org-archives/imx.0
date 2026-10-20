Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792492400;
	b=G/axR6TpmFyW7TyNIqOM1hHPJkZW8G7FYT5U1fQN2yw95Ke77B/aAOPdZeburBoscnB6
	 AL+x3NP1z9XM+pNOhRYqVmpclx46xN/d0Z1XPr4Syb9yWOAW0trA1J0gmpxbmj7DJUuhp
	 tiN8JZNHPX+FdHwnckW8wKBBnYE1tz0pUUx0KD4ET6iAPgveZkwX+ECblwY8K1DdrCYDh
	 kU55vxxsyXzFbyymE96NR/uM9YYwzlaDFMC3FWJelaJ6gXclI2ZWIhl/a60LZ6XgBVOXE
	 /MGMPpVnE3ArwAsnz2F1Q91Qrt3jbQe/DckxbF0XwETJvTq3SkOuCU9TleMIeLFTlBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792492400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=iQyv3UXDKrcHPg5SiBMTwmI7JSOMjEBmbwi+E5uk+A8=;
	b=z1bU1ZH50kJ3zih/1mpk11jvCCu303xBx/ung/8AuLGGwb9cA3cEadMXZ/YPyUl3pmH1
	 XrtZzlFDPC0BnTQ8XrsB4j90Qudv8msKOE4fJKLcwd9P59K1pcgVZ8e1Fhx2H08yioD/H
	 9lhKUJMHdeFB6hrkeb5+XuYb/Huwi5CNeXow+9N0oIaD7VGDu/u3SSUPoYJcpQTowiJyq
	 Q74F18rZAdY9xQhYD2QwglCkdqli3wBCOtjnfNPTGOz6kAtep/WOip3B72eoxdgMrkXiE
	 D63qEsT8VxlQVf4HhmZHrr1ivhpiV5H4IwayuU+0HNLs6nw9lfeN8a+HftGO+gaR5Yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lmbIuvP2;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF85B606A31B
	for <imx@lists.linux.dev>; Tue, 20 Oct 2026 10:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF85B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lmbIuvP2
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33fb4680717so5720661eec.1
        for <imx@lists.linux.dev>; Tue, 20 Oct 2026 03:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792492399; x=1793097199; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iQyv3UXDKrcHPg5SiBMTwmI7JSOMjEBmbwi+E5uk+A8=;
        b=lmbIuvP2UmqBjuVc2xD4BWplp8f5uKBGlNxwC4RRj6Gl7MSmCzBbUcUJAq+xFq7qzS
         yfTpgvAXxUX9nzLumb3T7Tn/OUR0vVsNiogKRw8uYckjseONfm0cJeMJBO1Bd6qAuUCP
         oPxe2aqDuTGtmjT6lZsLQ3oFOlOf1Vcn5QGo+rEZOzvcgNuzLYgKnTpKlb6r1hNzqp5e
         GPKJnQcY4Ln/CvktpPZxd+zHNlI1PPBZ8BtZ0jirAnET3W3NfZN+A7JyaeNoNMCUCwC7
         0E02baOwTsT3Wjh/ZwFKQu2oRzHZqE4I+d0JsHVbTvb9xR5+lDDvoC77iGCgivayr7c1
         ziAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792492399; x=1793097199;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQyv3UXDKrcHPg5SiBMTwmI7JSOMjEBmbwi+E5uk+A8=;
        b=YHIre7+3jVnf0jU07dZA3Q0WX9AQI9B4CA2bT09zkmLi9NKb2Ygu9H3iGKyE4a2+9q
         onRCm5i/k5iKyu+nZRZQNjPlLIK40YE94l5QCPyEbbyT86HDrte88mlx3rqRA5dm3Mxw
         47S6IPEtTrWFYRhFW+PHXPsIShydorWCSTDhi40YDP0LXXA+hkeHIoRaOVYKqbgi5YLr
         Xc+Y4eqEOixXgBYCTiaPK1DtFUYLaCd86L29J/WwlHL/CfczRKC8wfRDSiO6iym2QyNb
         jnZX9bEucuRkj0HkhckfCEsHfl/3nxycoYbos7yEfqSg5S9HkfuJPuxbKqj+v9tlAm5o
         fT9Q==
X-Forwarded-Encrypted: i=1; AKwUvByIRld5UA9GUlwNoDlAHGX3EbWvh5ZyFcKT1IqE6ODi7k76qSV35BG3z1OuDCZkfobuYZ8=@lists.linux.dev
X-Gm-Message-State: AFq9FYJWur8kUB8gR0Rv7s/vYfztiIw/8xCJRiDZVJ6fWq0/6j5GoWot
	ERRnDL42eXvTz5hxUqwsUsQ4/Hpn6Oq8r/1t8AFIAcDyOJms9Q+MNjMS
X-Gm-Gg: AYBFou1SOFGPP1Q+VQE0zDpY12to05PeWV0xesjFbo97JxBJkm5mVSoro1aHK1dot6S
	qJXCSrmbO+kuda3GCIbRbUBvNPqtDGeP8ZAsm6o56zzXUfzZSLIs30g0L0OwQtzA1n0b0f/IMnV
	CDo8yP11Wgspc1X452/CVpTYA+OhTJfZd2TbCW86eoj1ch0wIw7yBZ02jb1wNmNzur4yQnvSLR6
	6GCgSUcHJKU9edhr4ZV/AoWXS0Eoq96gzMXWuQ4cYsGK7sTfkgssuO+OkobIAq6JS4KQHQRYoUx
	5sXr5JKAxfHZmBvw3U4o7Tc7VNl9RE4g4KsXvLwq7CYIshkLG19mvQ8E04rG1f6Xi+d8BqQBjFG
	uM9iGmbS5eHw6P/485EvzqjngxtpJHHWBgziw4pUzWuVEZX+42v/6qrpcJa9AjOmvKoBGCXA3CY
	8PZlpB9m/P1+AF+jYpXUxb7SXH6Y/X7TDHP8xCCZFGTJtk4W7rNJ32BuKMSahNfbodMwi1YHSm+
	10F
X-Received: by 2002:a05:7022:1001:b0:14c:be8e:69fe with SMTP id a92af1059eb24-1850c8da80emr20220476c88.5.1792492398134;
        Tue, 20 Oct 2026 03:33:18 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c4d4675sm35068908c88.21.2026.10.20.03.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 03:33:17 -0700 (PDT)
Date: Tue, 20 Oct 2026 07:33:10 -0300
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
Message-ID: <lozimedmt3h7v6odvp4svvmatvk7726a4ztn3j7ft44oto7p5p@dmrudrmzyz3s>
References: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
 <20261019-v2-apalis-imx6-enable-vga-v2-3-ef6a3a780472@toradex.com>
 <atZxhWaUWthEHkti@SMW015318>
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
In-Reply-To: <atZxhWaUWthEHkti@SMW015318>

On Mon, Oct 19, 2026 at 02:37:41PM -0500, Frank Li wrote:
> On Mon, Oct 19, 2026 at 07:17:16AM -0300, Leonardo Costa wrote:
> > From: Leonardo Costa <leonardo.costa@toradex.com>
> >
> > Add a device tree overlay for the VGA output available on the Apalis
> > Evaluation Board, which is driven from a parallel RGB interface passing
> > through a non-programmable video DAC to a VGA connector, without VESA
> > DDC I2C signals.
> >
> > The non-programmable video DAC consists of a simple resistor ladder that
> > converts the digital 16-bit RGB signal to VGA. The VGA output is gated by
> > an active-low data-enable signal.
> >
> > The overlay is also combined with the various Apalis Evaluation Board
> > device trees to provide ready-to-use DTBs.
> >
> > Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
> > ---
> >  arch/arm/boot/dts/nxp/imx/Makefile                 | 21 ++++++
> >  .../boot/dts/nxp/imx/imx6q-apalis-eval-vga.dtso    | 80 ++++++++++++++++++++++
> 
> what's difference with
> 
> https://lore.kernel.org/imx/20261019-colibri-imx6-overlays-v1-5-e4d028727382@toradex.com/T/#u
> 
> Is it possible share one dtso also?
> 
> Frank

Hi Frank,

The Apalis iMX6 one needs to set up the connection between the IPU the
LCD interface (endpoints ipu2_di0_disp0 and vga_display_in), and the
Colibri iMX6 one uses a DVI connector instead of a VGA one. Most of all,
the bridge on the Colibri iMX6 doesn't have any control signals, while
this one on the Apalis iMX6 has an active-low data-enable signal
specified on the input endpoint. Because of all of these, the overlay
needs to be different between these modules.

Best regards,
Leonardo
