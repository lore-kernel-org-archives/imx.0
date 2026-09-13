Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6063BCD2F
	for <imx@lists.linux.dev>; Sun, 13 Sep 2026 23:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789342440; cv=none; b=VdlEjt/aEVoILWW1VOTCGQwddknanMVXaXn3kMqKUG5hDNb6RdrKXu04bzceVkTP/vGeEHAOCKuBnKAEDIw7BZEbtBEA3099Wto43oq8OB8TLeRoL0IVWlNKkgxbsT+V2tx1vqo7xWVUndxlACJoQMV9KrClo5V737BLK2JHa8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789342440; c=relaxed/simple;
	bh=zng3/lheQcHYHRf6apSQbhsdybFIgxHykd4cCeRSALs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FByp9E67FqfreTlUWFOA8sZ5VQsYRGnaYJIseavds8tTFhdsab7zv1vnAiZnQ1Dce8ugU/rN7JQk90R0dPq9Hu0Gu/CiS8Tx4V2Q9atdpHeIIgjzlFO/3KYrQhGQUp12nIFMZYCjevrJ0QqCvoTaVe0x8cRu1adrz4QuJHTx3iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DIuwo+91; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DIuwo+91"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83AE11F008A0
	for <imx@lists.linux.dev>; Sun, 13 Sep 2026 23:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789342438;
	bh=zng3/lheQcHYHRf6apSQbhsdybFIgxHykd4cCeRSALs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=DIuwo+91E9j6P8gcffxeTWibtVYK84E/K0zWh6s/Yed5HdTiBGh4yJD4g8Yy7YMzp
	 Zmb9UrM8SFiukhfEjKlqn74cChv71bxCDBhiCj/l/UQfge2Dm3qkgzsFbSGyqVSqpp
	 Udm+lm2P+eabpV3YMbxtjsRr06pb7oVPf73ngoGqP6jy/KVGDLhpFrdPO/yuSXNhqF
	 P/mNOKNoJ2KD2X8EoD31TZAHK6RsTWpDJuSUh375d6tPe7PrV/jmdpTbTzJGdzxjb1
	 iEp1c93xdl5nZIFDK9qu4pTXYFgqdfiS/ApZ0qsmVcVZZzCDaVwmiBwLQzxdIQXZR+
	 f0lsIW/5EvTVw==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b79784a6edso1335164e87.1
        for <imx@lists.linux.dev>; Sun, 13 Sep 2026 16:33:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz1w2PTTLMNZM05JpqBk4Ls8/v4EcUwiUx4iDXnsMTyKsn7HdAacv6Ml3F6aBODWlH0lxU=@lists.linux.dev
X-Gm-Message-State: AFuF++ki79r6/uOcoANwN8HRza5lyPUrWiK4hYIIkMHjrSW0STfa6tgJ
	mrj2HxMQ2VDbSkmj9MafvpXb2SlaMaVTCX+azhBMseURZfgRwIthrCJdgHULuoAqHcn1cBV9yRq
	Tgo0aHaDFl1BDW4u0rXoWEM6xj5R4Ca0=
X-Received: by 2002:a05:6512:2204:b0:5b8:9a2d:38d with SMTP id
 2adb3069b0e04-5b8ae8a73aemr7507e87.56.1789342437102; Sun, 13 Sep 2026
 16:33:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com>
 <20260727-drm-simple-kms-removal-v3-4-cd5dc89858c6@oss.qualcomm.com>
In-Reply-To: <20260727-drm-simple-kms-removal-v3-4-cd5dc89858c6@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 01:33:45 +0200
X-Gmail-Original-Message-ID: <CAD++jLnN-dhwxWwgmWYVD7COhvVsTxbiexHwoFkzgv8ucGhxqw@mail.gmail.com>
X-Gm-Features: AcwNN1XTt4ClabPMabRSeCfNHr3d8Y53WJSzGM-8HBGT1SAK6TVjQKD-jMPJbKA
Message-ID: <CAD++jLnN-dhwxWwgmWYVD7COhvVsTxbiexHwoFkzgv8ucGhxqw@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] drm/pl111: replace struct drm_simple_display_pipe
 with regular atomic helpers
To: Ze Huang <ze.huang@oss.qualcomm.com>
Cc: Alexey Brodkin <abrodkin@synopsys.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Alex Lanzano <lanzano.alex@gmail.com>, 
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 26, 2026 at 9:46=E2=80=AFPM Ze Huang <ze.huang@oss.qualcomm.com=
> wrote:

> Replace the PL111 simple display pipe with explicit plane, CRTC and
> encoder objects.
>
> Move the existing timing, format and pitch validation into explicit
> atomic check paths. Use commit-local plane state in the CRTC enable path
> when reading framebuffer format state.
>
> Move page-flip event handling to the CRTC commit path.
>
> Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>

This patch 4/8 applied for next.

Yours,
Linus Walleij
