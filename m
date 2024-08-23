Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B0918A951
	for <imx@lists.linux.dev>; Fri, 23 Aug 2024 16:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724429788; cv=none; b=PuxIYzasa+p5gys2y2LO6psIOCeZGbDbv0+DnKPzFQdB4p/SCD54AIDkfSx4XgGd4pqyxFD9g6wIwfqvwxtTeQkwwuVsd1BVI24AQlG/dYizPGTr8FpbKF37mM2wBB/YaMmbPgb01oKWRDoSpMWZgL4IyotY7ep8kpVTCC1lLuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724429788; c=relaxed/simple;
	bh=MGClmCeEP0HXyMUOWkT+lYMrNWdOMftY0DP5vSj6WPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YHaIl3o6jk4iIW1O08eStdWCGnLaStUeXWg2ZEO/IMpbVY6S/CZTizuhnpNYaLp6fFl36yCiq72Wv4b9RKF7XYoJJOkot0J8YmpBOvDlzMa5FZ9bPadLNY6//JcLerJz4pa/WyJjJ+8KBOucTpQgI9W8iCyueolvpNUOOBQyI1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OnP5nFXs; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OnP5nFXs"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5334adf7249so2726847e87.3
        for <imx@lists.linux.dev>; Fri, 23 Aug 2024 09:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724429785; x=1725034585; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGClmCeEP0HXyMUOWkT+lYMrNWdOMftY0DP5vSj6WPQ=;
        b=OnP5nFXstS8wukjWtTogBLy//b/KVGhK292uw/NOqfYROBDs2mATD8Uxvetqyi/QCU
         ceZdEJrlb2RRTSptNom4plGqdaOS1VPQingJdd5xwuHVMbEd5vMTq22hS4T/3/uWS6FY
         Moq3VtIh2kD1M+P/RvM3znb/nHASxEFqkW5K+vlA/jI0CJMKVuRnQfO2qr2horZtVDN0
         fHiUc3YFNtjigOfXfqlGWEN/CJ3SVPFyy2u+p1kMCalxXUhSbsw/IjroccEMpxBaZ086
         ceIWpw/RDWhzs/3Fq88eGqyeDNCc0lNLwWUdeaYy7T5H8L7tyUQuTaJsvOfNDuzfHPr7
         u4tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724429785; x=1725034585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MGClmCeEP0HXyMUOWkT+lYMrNWdOMftY0DP5vSj6WPQ=;
        b=BpoIkt4DJdGArSBpSvStvPhDq6hN68nviJ1Nl0oxjCt9KuwqPJc9KE+UoAja80PpcU
         0Kd2zF5qNogbfX3V8kaMtDrND2fFgAk4HL/60Jcb1CAc4atXZLZ9n8hb18907Gk5pMVu
         GH9A9PVJnAqhNOpeFE7F8d6GZKcV0TUKqdpExFNB4CIknH8QgQJ6E7zlPAwUbScRWxPG
         Y7C//98NV+gjUcvoWr7sdEAtUGSV+XlpyhzA9QA0RMB76HMQaODOKdWJyUB6ls1knC1e
         Kha04p/GEMLo09Zreg/EJKl9XuaQyyz5x2RstzRqpbw0/S1bcuw++8fqpvX6jU6HOHLV
         f0JA==
X-Forwarded-Encrypted: i=1; AJvYcCUEwM3rNVSQOyDstDG2B03GcljwlYY5/uNA7soXRnJlRNYnPIbqkWNk6p1mhWJJsVECveI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5FzTbY51eS4wUr9goypwgbKIaoeQ9ePdP13Uiwnr2Zy+B0M2c
	/ErhEUqB4MHmHBdE3TvI6zWCSeGtDQpyBRtv0zERynL+Kv1FBYZ/ScpSuEqESf2eWGlzjl7HIbg
	m7M5x67Ya/clB165HF5z9gxtl6uPg7yu5Y/MtPA==
X-Google-Smtp-Source: AGHT+IHspvXB/tGbmLkBqEhQCgkC7XBBDbpWT6LUntEQlW1UijvLDCKQ5afYQnptsKLM6cReVB2QWCm8j1h3WRMii5k=
X-Received: by 2002:a05:6512:33ce:b0:52c:e1cd:39b7 with SMTP id
 2adb3069b0e04-53438755465mr2335456e87.5.1724429784893; Fri, 23 Aug 2024
 09:16:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240808162750.244092-1-festevam@gmail.com>
In-Reply-To: <20240808162750.244092-1-festevam@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Aug 2024 18:16:13 +0200
Message-ID: <CACRpkdaaM_JHH-E7t=TX-3M-Jx3VDYdKnsMvxH7fwDqBCAwm7A@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: imx: Switch to LATE_SYSTEM_SLEEP_PM_OPS()
To: Fabio Estevam <festevam@gmail.com>
Cc: aisheng.dong@nxp.com, ping.bai@nxp.com, linux-gpio@vger.kernel.org, 
	peng.fan@nxp.com, imx@lists.linux.dev, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 8, 2024 at 6:28=E2=80=AFPM Fabio Estevam <festevam@gmail.com> w=
rote:

> From: Fabio Estevam <festevam@denx.de>
>
> Replace SET_LATE_SYSTEM_SLEEP_PM_OPS() with its modern
> LATE_SYSTEM_SLEEP_PM_OPS() alternative.
>
> The combined usage of pm_sleep_ptr() and LATE_SYSTEM_SLEEP_PM_OPS() allow=
s
> the compiler to evaluate if the runtime suspend/resume() functions
> are used at build time or are simply dead code.
>
> This allows removing the __maybe_unused notation from the runtime
> suspend/resume() functions.
>
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Patch applied!

Yours,
Linus Walleij
