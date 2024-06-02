Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDE63BBC1
	for <imx@lists.linux.dev>; Sun,  2 Jun 2024 13:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717334502; cv=none; b=QBhU5RKEBHtS6XErWO6gkpHye3sSWD+/n+uHdRjOkiV1nsgLL7MzzNVhKy6gVwyPu8QsiUfPhaG6Fbk0CrhKTvZJ77eV/14VzNjwYFBXoWUqo53C9davKEeRl2T+C+ROsAHzEdOXQnOWX1PobftC5EvpyN69DRdx4zjxWq9E8fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717334502; c=relaxed/simple;
	bh=w9qAtj/Q6OMUm4l3FP+hub4S5StaD/SWZRWY3ZBKnIk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aRjAPqWOgNL9DovJhje54BkPDO8KXq7yIPGgGtdJwR/m3IJSx0HH7fj00KweaOoMdncq6WXTD3n5rlrDQj6j25bonolApXU0H0v+xZEBU8roWh/cw+TpuRGGgGAiTXTB780gavLCvGgP66nIgqKjpaVmgVPRrZlXMWN5Xm+Hfp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K87yqO/x; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K87yqO/x"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2c21571e99bso64506a91.2
        for <imx@lists.linux.dev>; Sun, 02 Jun 2024 06:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717334501; x=1717939301; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w9qAtj/Q6OMUm4l3FP+hub4S5StaD/SWZRWY3ZBKnIk=;
        b=K87yqO/xmfiTwxtmzdmjoet18riQ3qjrueDxHvX65Fh3M3XQWApSPQcS0gHb6YGo0W
         ngmgIscf2ME3nsAdWoCllgK7FfZYq0iNPAF2Jh48/o8OQjWelZV+Pw09FSIKFAWOeuw5
         jI3bUOTAAzqmTeyEKxtQw66Jc1Q1FieheWHUh7qUlyZ7Cmn49c+Ayx98dNGEZBKO9R0z
         bKtiqXhbLwbB23CL7MTpBww9OGdvjfSCSxBxN34Y+hDd5Qze1vHxJH9Z9N71DQQ3O+LN
         VpqPmzTlwRd4ewbJVXTnrZSBTlm7z2KfYogmdUZM7d0x863c/6y97NRZ2aaRly4kK3t8
         TNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717334501; x=1717939301;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w9qAtj/Q6OMUm4l3FP+hub4S5StaD/SWZRWY3ZBKnIk=;
        b=UxR+Nh2GWOLfPA27EYvCxxK2jgNO3HVF8DgEyBbp6aWMZVkvAHsnOxyDmzibHwBz1y
         E5k1oMLLP2SdZ6wMNRk/HWXjmwKi2MY2gRSSfp3P0Z3nVm5su0CZ0v4tpIJ0KwYcG2bA
         F/qBWwx80n9aZAw0rZUHJoUYdnKsoBumI+H3ghU5qlAx9Enm69XOjkmUA4W2hfiOwcOU
         uQb41Z7CM0da01wWrZ1mhk3JukNgzYEoRwzTWSUsXdq+3T5mZ9DAItiuiZLTzmwbG/sF
         FQ2XMlFm/tgSDn3tSRxBls6X6sElK14aDmObGN65u6zwHjZ8jlJTYCcqh3AFNYoQzJgl
         JJCA==
X-Forwarded-Encrypted: i=1; AJvYcCUfADHUoj9eNsTBUovcyJjxSi1ADPPQgyzQjo7Ia+HvN94qwnLoBHjqECXOOCS+AuL5e73eALIIw2rmbnt8loN2nWEU
X-Gm-Message-State: AOJu0YxYrao78SJwN4HmHoqI8xUlWMxVpBne/LKBFI2grobCErQQQUvv
	3Vn+pHTunNjTPjTPPAsZDEAQh6lmZUxdljOaIa7RaxeZLqLneiRxpxnwOnd3i89K2QiJARQEzdq
	81vnp5wmugtLKX64zEwfCyuYHdm4=
X-Google-Smtp-Source: AGHT+IFxFx9jMlGIxkqoDIJGkMsPnJnWQKdTJk+XxjFR4fcHMa+VR6s2lNNgn+Px80s2ZL4pgkP7iwiMERFEMa04H3k=
X-Received: by 2002:a17:90a:ea85:b0:2b2:4bff:67b7 with SMTP id
 98e67ed59e1d1-2c1dc5da0a5mr5628590a91.3.1717334500480; Sun, 02 Jun 2024
 06:21:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240602-imx-sii902x-defconfig-v1-1-71a6c382b422@linaro.org>
In-Reply-To: <20240602-imx-sii902x-defconfig-v1-1-71a6c382b422@linaro.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 2 Jun 2024 10:21:28 -0300
Message-ID: <CAOMZO5DgB6g7wydECav35wfAQ+p+XuYrOC2=8oksj7ALeQTOew@mail.gmail.com>
Subject: Re: [PATCH] ARM: imx_v6_v6_defconfig: enable DRM_SII902X and DRM_DISPLAY_CONNECTOR
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On Sun, Jun 2, 2024 at 7:47=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:

There is a typo in the Subject line: s/imx_v6_v6_defconfig/imx_v6_v7_defcon=
fig

> Enable the LVDS-to-HDMI bridge and the HDMI display connector drivers
> used on the iMX53 board with the HDMI mezzanine.

"i.MX53 QSB board".

Reviewed-by: Fabio Estevam <festevam@gmail.com>
