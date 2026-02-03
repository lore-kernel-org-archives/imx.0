Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A394529BDBA
	for <imx@lists.linux.dev>; Tue,  3 Feb 2026 08:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770107616; cv=pass; b=X1QYrTWTbPSweH9lQsD+aIvGx+cMjbnM8aUYSgK9YrlAja+y0uTWk/uqXSwE9tTLGGQZczuCOojCnQ1cCLHuOVdw+kr9qyFxHF/DOUhQbrF/Vfvr65tQW3YaUnDnvDqDG9B3Ab8FW4ULXJBFB6hBr9DhWq8zuPZevwotGei7DDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770107616; c=relaxed/simple;
	bh=emyZuy7uXV7Ze/RJbFb/MJbjgAkf0STJ6afujsD5fLM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mI6hQ/v1RgSyY6it3zPYxNfZdHe5ACJRirT/1r87fojW3NYuDdwVb+ep1fLB7F2aQEE5o/pnmqpx8aUnRoJ4KoMP37ENryscYv8D8j+F+2RPyGbq3DdTNBfq/gEvstY/mokY1dpZSqWE5+HqAGZbTGFQzbZnJE/Njn4pKdSDlH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M4lpGdFA; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M4lpGdFA"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12460a7caa2so8128280c88.1
        for <imx@lists.linux.dev>; Tue, 03 Feb 2026 00:33:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770107615; cv=none;
        d=google.com; s=arc-20240605;
        b=DQutAng/41BzQXDb5vrBPwIsORy2a/Mn4qrcVgD//H7uK6MFYjNLVCtts7CZ05FxZh
         zvr/TjW3GSd4OXR1WVhD4ljkC4cRrXgYvMPhXrSNHCOD8cwPkXBaIsaOU6eWuTCVxmfU
         GY8WmH02Ya+cm/1n+JlJEHZcA7pwAwoOFXOAa+7wYhp8fpM18wIAbMNdDhMrq/R+W/K8
         X9m1PgJ5BlA0CLg+ur+KSf8gBnjATn2XT5ckd45g6VIn0xihipa0GYgBip7UTNw5bi+a
         xmwh+4H50fMNrw8/r0uhFHbxj8+nZgTYA8uGZ9AjQs4cex0Svz63G+VRg09CL5RRPtbd
         qRQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=emyZuy7uXV7Ze/RJbFb/MJbjgAkf0STJ6afujsD5fLM=;
        fh=dOzYz+UgUdkWuA/nXU0nl2o3jYACgTqkRTl4K+Cgl/c=;
        b=RL4bESuNpyq4/oavusZ9wk3E5/PiSgvo+jtVzyij4oGjvBR0yHZkTrWwZZkjVR/OeT
         d+95k3urTPuKqdLBJ+uzeFooVxqEQBhrwzVRKQIPDYGBKypt6aEJT06dHfvLWAD9P/1t
         icE9PxFMzoPkQwVqdIeJarbSZB0w9a5AkELPH7fvqvtMK91mBx/0olNgkuLh/Xkft4AL
         B+ymOQXiGu/FvoB/J62pkJEW/zPDydU67N5/gyVSMWCjw0ECrHvU77PcFxM3RVn0W6wP
         /p6qBRwLM2Cp8g2YmP0G2oa5iNiX4Vly/WJY2zS7K6LhFyn4RuQ4W0U2iAb4O8cumZSZ
         xw5Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770107615; x=1770712415; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emyZuy7uXV7Ze/RJbFb/MJbjgAkf0STJ6afujsD5fLM=;
        b=M4lpGdFAp064Ce+VyQan0khsnCxBBDZvnZiy3rTJOjaaOPSIUytXgfAs0pDJxj8xQL
         tP7QBcw9B1ZQKiNx4Vhv9JoFnovGjUvGRoop1oqzAvVP9QsjLTg1qIqPnPNA5nG1KGNy
         EbJrIQcjRF7Vq7CTLdHqXNb5sSa2ysxAuHMYJEyszwD1fmH+7Fmkt2/eRCsX8zWkyqw0
         2SOuQ7IXpET77KeS64dwvZfZP+VithFZHOi+tCb/5CJPIPvKan0LLiI/WAfyg3l9y+45
         dInL/3vU6AeswDppkg88J7fkwt5+BYdU+uO8LU9Lkhux8Wj+lq2zjb1F6ydyJcHa64YK
         Vslg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770107615; x=1770712415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=emyZuy7uXV7Ze/RJbFb/MJbjgAkf0STJ6afujsD5fLM=;
        b=rsPldROgKn4yWHoDGTHWKMEjP8guBUIhHXv55Hyw1Tdi3n0Wa0AA5x22CqB8ZBHyex
         cyJik5urMgwDvoz9Jeht7CMRsFXzOXzx+WqwIJRmw5l55iDoMb5ODeVZZc9sXlbEpYqv
         a31xW46e9B81yaniiDU+csIdkquqRZtcX7YvLrVfo6VKG1ttui5D+OTEKzTtKixIWL8m
         JuSKsKapeSj3qbpR94TNdzqwmIPR26/Ch7RRR1+OjOnwGcK9in4nKFBhAdTpkbLh0rVL
         axTkzOTh7ataJcXBZC+uFomhXNKkV7zLEjMmjDO4NNkMDPIdlkaEHJ0QMpv5UZQbt44S
         +Pbw==
X-Forwarded-Encrypted: i=1; AJvYcCXFkmcg7i5U0krXaW39eINelS1pLgGYpeoPjdQ8UDTn7SBKh9XgS4BLmAQYuJvK7A9sLUI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwzvomrYyrGzX0EDYESiRLLwf0umuAFWinQeEhD2zci/a/pIjfn
	6GS12KmglBQD0KXvhjiXa5jCIYhLNf2RKOAeZDdOHbieQGA+BKIyI8U+EUJT/xIWz/RUGGs0bAb
	PcOk4t6dXCf9nTxejBBySD881BEThpI8=
X-Gm-Gg: AZuq6aJAJWUhR8tyW0iLv0O+np7LK13Kv/yWuGBDydAhflrrF/9MIIDO1IDiU+tlRgM
	GH18o7wbwe+pz5s0knXUNoPHwjzbBudxGRqEx4muagBavonzJJ831XUIouHVpLh9jiFcBqSF2+q
	l9QjFsJIsRSIzBUjz8XTT660pDSiYOfCGMDhxW6c24xBrc+eyoe2Lmh/yia7yQc5BQ2ayBjaade
	HkHQsgWVNeg+TwqkwU+FxTi9V1jaQjDKlRlP+MyzYhitCeZ2QsbnpQ7cn69RZ68WsK0MqxH3Cfm
	nUgGe5gxpa6+ovyEavLBPSQUc7GAXrCnbZ/8wcG3ilNLVDnZfVrFKMH+RhW8NtgPKBtsM/pGvMg
	ILDQHVojZ5Q==
X-Received: by 2002:a05:7022:403:b0:119:fac9:ce12 with SMTP id
 a92af1059eb24-125c0f9d262mr7374498c88.13.1770107614645; Tue, 03 Feb 2026
 00:33:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260203031345.3850533-1-shengjiu.wang@nxp.com> <20260203031345.3850533-4-shengjiu.wang@nxp.com>
In-Reply-To: <20260203031345.3850533-4-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 3 Feb 2026 10:36:16 +0200
X-Gm-Features: AZwV_QiN7aElCqGBVfp3lxdbVrrkTZK84USf8JhpYodb0geCaRz0C4JnQWtK0dQ
Message-ID: <CAEnQRZBkKG61b8ytdGKsRqRsfHZ33Q3y+fK0Pkx1hUnw8bWkUQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] ASoC: fsl_asrc: Add support for i.MX952 platform
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 3, 2026 at 5:13=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.com=
> wrote:
>
> Add a compatible string, clock mapping table and enable the option
> 'start_before_dma' to support ASRC on the i.MX952 platform.
>
> The clock mapping table is to map the clock sources on i.MX952 to the
> clock ids in the driver, the clock ids are for all the clock sources on
> all supported platforms.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
