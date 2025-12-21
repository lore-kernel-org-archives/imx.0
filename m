Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F6026F295
	for <imx@lists.linux.dev>; Sun, 21 Dec 2025 21:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766353920; cv=none; b=SFMM3RJctRBWQZUi+AAdoBCQMN0QE8LYKk/o0oxOK/7nTzwlwJqNSQM38UHOseHPH+e9Z/AR5qfUoGMK/JqyoYj4qnTuOcwpSbX9/VbyRlAh2e8YwzDILFOcsYia7uesTCmena5jj+8FpZcI5J72yxR6cOJdpAbY63v/5MxdSko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766353920; c=relaxed/simple;
	bh=rCv4G4ZvpwPYN7jvzeJNzTGzYbAJCmcgEYZi8qw+CSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y0XGNgD3nUAwMGyi4ML2IfgMCIfdiMcCIxBuqhru5IzO0P3/IUVJdCQxgTSyOBGEh4g8wJ+z0ZkasDRb+jEtfDUXR/aKHkN+PpCWBNNPhe+DBRSYCVuOUXYp3mUVAWyosSQuqpWWzfLPJBzQs5wzM3YoI6t9ed3w3QyGr/GTka0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Cchv/K8B; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Cchv/K8B"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a0a33d0585so31181195ad.1
        for <imx@lists.linux.dev>; Sun, 21 Dec 2025 13:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1766353918; x=1766958718; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCv4G4ZvpwPYN7jvzeJNzTGzYbAJCmcgEYZi8qw+CSQ=;
        b=Cchv/K8BfdK5rfHo61w7XGzT3HZ1j4jytg7B1GOL46ppoXKMPM9zMKP4P9ODWDGcoP
         HnPYqXEQMPE5+PFNdNPrGFwY+7mVZb6VhFxSI5yWd7ORhplCZ8wEecJsICh9tkOfBLrz
         GTW3HEuB9zw1/Ey/S52GHUrXLNWxZrJu25QhXoUYw+E7aGg1Ix9B+XRFQj9fR7inqv9I
         eNDnZX5RTvO90Cn5JJUjMniSmsCB1fbWvV10lZjyz1C6TORP9K5Zaac3iIX/H6PDnqvG
         jKE+YzbWbVV97oW6lQml3OyJ/Lu+HjutaHlFZJbYUGp+PekX2bC6j2sNT/FSxD9jJW7n
         xIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766353918; x=1766958718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rCv4G4ZvpwPYN7jvzeJNzTGzYbAJCmcgEYZi8qw+CSQ=;
        b=PwizcWRikaf9smckEI4dCpfrskNWT+/PugjPxjikN0PZJzW+SCzrHsh559uI4D6EIa
         CESwoNeB1VolH0evPc1/edCOqNnIDmZnmoKTdfGElxAwU57+TqkJE46/V7F2+Wlydhln
         eXLigLW+9oAB1PPKjahAdJAqAQYDWkceYiKv6FdtPWKcpDDJfSYtk1IT/zMhuWXallXk
         2uNoLwSCkv18E/zE3J3xVKoYdWjoXkfHrmdXV9P6QSjkFPl17AudXgdm8JBAnloFlu9T
         ZFPMkG91YgJOIHwHPYZ6BxDnyQlS1XIEnVJLjY941ymlOAYgKpmrlyHjnmIwjjn0JVLX
         Rk9A==
X-Forwarded-Encrypted: i=1; AJvYcCVaYWACiiUd9LCbghInTsFnme9ZSQol7y8Sua+klGJcVyQj9JqZ6o6SwKaVxTpghGfBtw4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzIB4LcHX6k6szgCahS4usU7uSaft7p0A411d8pSC1yoPu2Yml9
	RboO3j7/VGHiblO3Q4EXHs+dpsbk1LOPKdCNbLREBCRaq6UREyt38LWW90xtJ6sUWhMeOHrgbuX
	RdOynewXO6HN+qJc//EMnHrSn5PmXWpk=
X-Gm-Gg: AY/fxX5tVxmoJ9JrZTyNytPJVASglvpmkFOUYFr3RQUpzzAd0fLHW/v8pP2vAynu0GQ
	6LqRMdBaOE/Wde11ExrhXk4aI1RqfcVgcfDy+uY2yzK+OZiNRuICWCRkNRySrMm1bxttrWBJPCc
	rhsPBKLDHYF1uzd4yZIk6IHmXlTELWUY4AloPHhrPwvqS0kuTSXoJ4OdE/2CXSMKharmL6C00tL
	mugyO+fmA/LUm9KfKrQU/2yuSV9cyoXxdtDlDwTwosNx4bY9n71ryGQEnMVZs61GD2gF6TvSOWU
	MwuUQVCxPokrd6hurhcN/KCQTwdl
X-Google-Smtp-Source: AGHT+IFhVsKQ8B8hFSiqKoLGfXbsRY75c2m0MOxZCySUkGexjvaMcQL0jHgp8m1+S1WmJwyBE3X0eYB56oovc6ceHh8=
X-Received: by 2002:a17:902:ccc7:b0:2a0:9759:66fe with SMTP id
 d9443c01a7336-2a2f2735242mr95258195ad.32.1766353917909; Sun, 21 Dec 2025
 13:51:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
 <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-12-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-12-b5165fab8058@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 21 Dec 2025 22:51:46 +0100
X-Gm-Features: AQt7F2rrzqrcB2CqEcsVtsm58CwTVijhfO5EKXQK9KI68D9dnI-HolBL_A2auf8
Message-ID: <CAFBinCCUVOYsiwwVmyGtxN=MdqYatAaj-piVO9_E_iZX9gwiMQ@mail.gmail.com>
Subject: Re: [PATCH v3 12/22] drm/meson: encoder_hdmi: get/put the next bridge
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, Phong LE <ple@baylibre.com>, 
	Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 7:00=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> This driver obtains a bridge pointer from of_drm_find_bridge() in the pro=
be
> function and stores it until driver removal. of_drm_find_bridge() is
> deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
> refcounted and use bridge->next_bridge to put the reference on
> deallocation.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
And additionally I runtime tested this on meson-gxl-s905x-libretech-cc
where I still have HDMI output, so:
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
