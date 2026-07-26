Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0AD82F7F1C
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 20:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785097941; cv=none; b=uGSM/hMVSNwcrcE74mxkOtaO7GhK5ttbO5HImOb87Jlk6zS37PP213SHdku0Org/zpB7hj53Q00N9H9FPhXrX2kezne+l+uPxSY9kO2FyjsvzPecZOqdRHMuPnXfbvNAXl4DraHx5gFX4kYnLblAVXRkLQPVIdUpaWdJRcaNhRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785097941; c=relaxed/simple;
	bh=nkBZFniCUCzkEJIn51pXlmXmi8cVBb/p5U1a6qJ9Ixg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=baXFv0ZaQJ2rp6IkFssfalnr1gHnqeWQYM5QDbo2rnZepoifKn1glkBaOasu88tyQ9IEFsdt+5xyRYho+SiVUTsPsalLtqdlcsHaeo96KP3kOKTfDThUFKma6ko4JxU0LwrafNxo28td5qU3y+nBj5lUcvpuq77JLK5P8T972NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W4PHVQaN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W4PHVQaN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D9EB1F00AC4
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 20:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785097940;
	bh=nkBZFniCUCzkEJIn51pXlmXmi8cVBb/p5U1a6qJ9Ixg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=W4PHVQaN9xLoqX8eDXdj+/bdltzbpdrXuJcD/IwTHED/OAS43NtSi09Vq3d6U04b+
	 OZrfY1BdRBIr3/BvT4jphHKxshW4iPLq0SEQ9WJZ6UCiJXker7nVXzDJTQTJeSQmCJ
	 nqQTHDVkWE6CIw3XfTavcgeKi0qWFBHLD4jbLvVP/w0wy9EuQuHMdSUYi0WkY8Th+6
	 o3h8KWUIz3JqQ5OnPdjn8CRQ129kqIKO0RvU9aDDIqv2knEzTV6ddZotNnccrjNDf3
	 gD5p2j+s8qJDRnjJCabcz24JHju2UhLKMDmQz+l+lUVP9hxrlhIX6gKr3NzT1t2xHy
	 xsYC8WtlBRvmg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3997a448ecbso20113751fa.0
        for <imx@lists.linux.dev>; Sun, 26 Jul 2026 13:32:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq1E9rZVE8eBxUp9sDJrqMl4kBa0mgL3EZ3vNZieITfH2s4Vmnhm6NY0lf1Mj0gZ6zpEKA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwifIGG0cm3WRg+F29lUUxi04pz7xROj9G8ZI/XOqoq60zcL+qe
	jkYrYI0BwKht8zQR5bgGQN0KXXSzWRB00gr3LfhALCx9EdfwBasXX35pR8X26Ooqu/7cR2zQ+k/
	Z/EjzhOqhE1P08osjENvO2LWDE5fzAyo=
X-Received: by 2002:a2e:b8d5:0:b0:39c:99e9:da37 with SMTP id
 38308e7fff4ca-39f28779970mr10082271fa.1.1785097939063; Sun, 26 Jul 2026
 13:32:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com>
In-Reply-To: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 26 Jul 2026 22:32:06 +0200
X-Gmail-Original-Message-ID: <CAD++jL=x2Ya_MXrO7FGF6WDzr4dv83K8-TS2AWkA2O0Dko8G4g@mail.gmail.com>
X-Gm-Features: AUfX_mwB4HUeh3S2YxcI83VgRSuUorQHaI7-JMSYPXy-LrwQZEzjVUoz5QHNF0A
Message-ID: <CAD++jL=x2Ya_MXrO7FGF6WDzr4dv83K8-TS2AWkA2O0Dko8G4g@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] drm: replace simple display pipe users with atomic helpers
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

Hi Ze,

On Sun, Jul 26, 2026 at 9:45=E2=80=AFPM Ze Huang <ze.huang@oss.qualcomm.com=
> wrote:

> struct drm_simple_display_pipe was meant to simplify simple DRM
> drivers, but instead adds an extra wrapper around normal DRM atomic
> helper setup. As noted in Documentation/gpu/todo.rst, remaining users
> should be converted to regular atomic helpers and stop depending on the
> simple-KMS interfaces.

Are these patches independent of other stuff so they can be tested on
top of v7.2-rc1 or do they need other stuff from drm-misc-next?

Yours,
Linus Walleij
