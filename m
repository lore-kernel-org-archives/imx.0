Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311401C28E
	for <imx@lists.linux.dev>; Wed, 12 Nov 2025 02:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762914036; cv=none; b=fXWxVeMhbfnmKnHr59szgWcezMhSS9lgdgqj5oqblrR12xt9I8mLHGU2laUwIL54tNT2kBl3owDLsNRUAh8jIfFHvzy+OOfFw82zfnDGjAMlfC4cj8XOiz6+99C5+gQXLWrmmBTVSMg0j1ZVKg99cuHRU9Dlxfd2CHBQUShgT4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762914036; c=relaxed/simple;
	bh=vgXKVXLg5ka/gs4146ICOeO84aHJl7Kla8+sb4iHUbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FWtg7SuFaXbq/zrLhHHfMoDohnoa+IZcZbBMTLdOXSyuvbU+uygGvgJ9hI+Z97nDIHYE0WnXU/Hzj+Ya/jnH1vsiT77jriSWOjqyIGXAOapnhYCXefJU0toZGlN+EEvJWIp7zNqr2rOHBbR+7wBSCejTeIwjHQqQ33D0jL1M7O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k7tCmyji; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k7tCmyji"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3439e1b6f72so364063a91.2
        for <imx@lists.linux.dev>; Tue, 11 Nov 2025 18:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762914032; x=1763518832; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LxUF+h7S30BNbJmH4g7pCp3lBzmymefVuj0S5lsfjbg=;
        b=k7tCmyjiqwGFTokidN1niLKcBuG4M921c3PsLdS9HSISl9d7LFeoIGXrYyvNbxJcMh
         AuH3G4GBD//jexvC5fEkPOgBgO3zutiqMS1ZjGmwGhyuaCI4FzGJTlXHDqHVH7dDKC9I
         9S8ofYR120y+SfB7bIZuwRNYQqj9jINuhkW+Naq9p8n6XBdWlO0W3b1JVum2AJEKFu61
         E/K+UglBVgwJL7YE+5qac59AJwFlyG2FrVygMJh5p/KhfdYnkqDrZe4JbF7pN5qtd/F4
         obaOzvUGCAQg/NqdjY/mBnHhRxQZJWTAhb3r8AcJmw6uUnAbNswlbBUwMHafR50UYZZB
         arxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762914032; x=1763518832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LxUF+h7S30BNbJmH4g7pCp3lBzmymefVuj0S5lsfjbg=;
        b=dRveRoYBsQgQ5wCInV15Vxt2i3fGlEkXGcjPozdH4E9PXB6TaPFfJVDVmjly9lmyl+
         Xh5Zcu2YbdmTODAjvqZnO7wWrKKAaReZ/7J9rtFA/c/QO8CXyr489F2O0acds/0BTksS
         uQRwYRTfravlTNhcER2is716nISz15zycgQRtb2uKonqyfoTmnC9x1nrNzBLpTUuK3ZY
         3AUYd4A7hmioB8OvYHuHAN3jQjDbHKypCyNL8cFuCJpm79uaZdiiaBi/Izpjh0FpenMT
         Jyc2Kn8dTW5vEKcCorxl/gfFti0bSyQe8HUPrJK3rZsVIspuCLA+qhtDVT96FtIIvwae
         F3Aw==
X-Forwarded-Encrypted: i=1; AJvYcCXYV1wCAvG3dJuIupVx/Ro7zJCnA/g8pyn+NFKzQLj6442p8D6Rr0v3C3tfNUxZ7OiDOCo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2esitOuvleUElJo980GfN4I6E8CoqKqI6o6jPhWo+D8xPK0+u
	LBG3V1lzKqlkwBRh/WuTQ2cqnPoUtFuvNHDs/vG+rwPj8HzyZ3oOhB4O39Gjxzq9DCz+XtT9XhC
	ADW9qZa+NfwM10d65/Y2yisuqXfCaVQk=
X-Gm-Gg: ASbGncs7gAz6+//QHoK/vw43M0joyqqXHA1ALZzEleHCHxgwte759wX2QORHL0tUVym
	wwvW2Cz4qtVNriuY1pQBHNZCAzyWWiKQLI3r9bKp4KvRNFjZghbbTH5JlF+LlTKqLAkZi8Galm/
	PpwNIUa2QE7s3F5PZ0vxwrSIGLLsgzVWgHEjoAuZtTXRgPjDkzipC3B2H96tvcEbduRaFl9lIRb
	vfhTQw9mEua/gICJTvEgoEVXcOmXY6WuZ75XlsV6frNMniv1xdWqVhvle61
X-Google-Smtp-Source: AGHT+IFtc6HQrz/xKZ9emyb5FEGlT0SRf+ATUq6DWBXr3zYhujoZ6/yNyjXJ5nXZWWbTjr5BzqbESW0tw1NXrAGBcT8=
X-Received: by 2002:a17:90a:d88b:b0:340:be4d:8980 with SMTP id
 98e67ed59e1d1-343dde27552mr1630702a91.14.1762914032513; Tue, 11 Nov 2025
 18:20:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
In-Reply-To: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 12 Nov 2025 10:20:20 +0800
X-Gm-Features: AWmQ_bk8d1h8tBpBrZUtGjow-hV3gnwT5P-EgH-CH9iaE3RQY3pwj7BwDScJKrc
Message-ID: <CAA+D8APHUZmP8qfta4=YL200hJkiikru8yQPddvBZyx-+-1ZtQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/7] drm/bridge: imx: Add HDMI PAI driver on i.MX8MP
To: Shengjiu Wang <shengjiu.wang@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org, 
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	victor.liu@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, l.stach@pengutronix.de, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shawn

On Tue, Sep 23, 2025 at 1:30=E2=80=AFPM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
> acts as the bridge between the Audio Subsystem to the HDMI TX Controller.
>
> Add HDMI PAI driver on i.MX8MP to make HDMI audio function fully work.
>
> changes in v7:
> - add back the mutex which removed in v6
> - add Tested-by tag from Alexander.
>
> changes in v6:
> - remove mutex in dw_hdmi_set_sample_iec958()
>
> changes in v5:
> - add empty line commit message for patch 7
> - remove blank line in dts node
> - add component_unbind_all when dw_hdmi_probe return error
>
> changes in v4:
> - separate dts for soc and board
> - bind hdmi_pai with hdmi_tx by moving some code to .bind() and .unbind()
> - add "select DRM_DW_HDMI" to fix build error reported by test robot
> - remove unnecessary code/definition in pai driver
>
> changes in v3:
> - add space and 'U' in asoundef.h
> - add more commit message for binding doc commit
> - add bitfield.h header for fixing build error
>
> changes in v2:
> - address some comments on commit messages
> - add two more commits:
>   add definitions for the bits in IEC958 subframe
>   add API dw_hdmi_set_sample_iec958() for iec958 format
> - use component helper in hdmi_pai and hdmi_tx driver
> - use regmap in hdmi_pai driver.
> - add clocks in binding doc
>
> Shengjiu Wang (7):
>   dt-bindings: display: imx: add HDMI PAI for i.MX8MP
>   ALSA: Add definitions for the bits in IEC958 subframe
>   drm/bridge: dw-hdmi: Add API dw_hdmi_to_plat_data() to get plat_data
>   drm/bridge: dw-hdmi: Add API dw_hdmi_set_sample_iec958() for iec958
>     format
>   drm/bridge: imx: add driver for HDMI TX Parallel Audio Interface
>   arm64: dts: imx8mp: Add hdmi parallel audio interface node
>   arm64: dts: imx8mp-evk: enable hdmi_pai device

Could you please review the above two dts patches?
Thanks.

Best regards
Shengjiu wang

>
>  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    |  12 ++
>  .../display/imx/fsl,imx8mp-hdmi-pai.yaml      |  69 ++++++++
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts  |   4 +
>  arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  27 ++-
>  drivers/gpu/drm/bridge/imx/Kconfig            |  11 ++
>  drivers/gpu/drm/bridge/imx/Makefile           |   1 +
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c  | 158 ++++++++++++++++++
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c   |  65 ++++++-
>  .../drm/bridge/synopsys/dw-hdmi-gp-audio.c    |   5 +
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |  18 +-
>  include/drm/bridge/dw_hdmi.h                  |  11 +-
>  include/sound/asoundef.h                      |   9 +
>  12 files changed, 382 insertions(+), 8 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx=
8mp-hdmi-pai.yaml
>  create mode 100644 drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pai.c
>
> --
> 2.34.1
>
