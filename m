Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE16413D8B5
	for <imx@lists.linux.dev>; Tue, 22 Oct 2024 21:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729630885; cv=none; b=MTFOaUmpna9rR3CPz+lyr6E8xBqky/0dXfS6yV7GlE7bU8LA1NTjjMxInrgQ9ymv/3ZU7SMN3UpIHzqZdk1h/LVi7l2tnfGgRFdaZvnkNmJIVDKlwxB53ZZWC5fpCPIOryQiofHVs9+07Ee6IEr7VX2wUsBTgDIKd8LSxWTyxIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729630885; c=relaxed/simple;
	bh=/Eb8Epx6wfm9bBzZZn0HhtMt385+tm/cZYTfYX0sSRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q6mVjj9cZvyHhHKLsVG3lL67GIQz8yrruDl88Ebl0X8BTo9csoSm16xxEViw5AM6RMnsea6vqgAqEGnU0ZJds0sVr9HoQUuJTxBar0VzTFoS54GW1GkuxCz/G+MqGEBU0w65O7XtcKHyywGedew/UNLcDZvtsskHFFfcCSZPoM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rr0YumDK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rr0YumDK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D534C4CEE8
	for <imx@lists.linux.dev>; Tue, 22 Oct 2024 21:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729630885;
	bh=/Eb8Epx6wfm9bBzZZn0HhtMt385+tm/cZYTfYX0sSRw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rr0YumDKrBJtuc86LhNq7CBmFKLJizJeRi0XHohygfowhFAPjF8U5idf9IlcIDzyw
	 I6Q/aDHzyKejDEZMvhx0Ysgb7+SCNviN+uNMkMarATVVDefl4SzO0VqTAd1t1xRp+J
	 AxV+ZrLZIdceHs0bSzJ1Q+9nhj9oIA87oBUYqWDQWUaRKI1eFH+sPhIGgj5ebde4NT
	 hyCqz0BwyjAqV8h3JGLlvEsvbISz/VjPF6cwkojh+PYWqc07zPkRa0RB7K7wAnyK+f
	 B0W2xyUimhtc8m/wXT1VeNi5HfHdVGUbVejL2eu7ne7FaBnkaMt5z3izJRjvLgw0O1
	 uzKT741p2Bhaw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539ebb5a20aso6204264e87.2
        for <imx@lists.linux.dev>; Tue, 22 Oct 2024 14:01:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWyk7asO/Fs/RnalID8KFrItYfYYO6TBRKndLQYgkST0L5xYjFOMbP1vDFnQ4ltUHgL4R4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+HFqBdk82ZAucQlSuFsB70xgd7Lm3kG8DPGFefOHe3ZERr2/s
	Mul1QsI4kdgTtioPmrU1h4CoDNKV4+1HunuSHQqEpk+pfLt6+0VfpIGsk9hpjSV94THqDOSCa9p
	LHeusFbEAYON/72pIDXSGHsa5/w==
X-Google-Smtp-Source: AGHT+IFMewjcXqmLqdhk0eJoJ416asx50Q53bJsigv4hfQaxhRgbhx/qVQoe8z9gkYT5WTjL4Lqcd1xnc8Rf0gKC4hE=
X-Received: by 2002:a05:6512:1583:b0:52e:9762:2ba4 with SMTP id
 2adb3069b0e04-53b1a315eeemr101458e87.25.1729630883921; Tue, 22 Oct 2024
 14:01:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241022133040.686562-1-lukma@denx.de> <20241022133040.686562-2-lukma@denx.de>
In-Reply-To: <20241022133040.686562-2-lukma@denx.de>
From: Rob Herring <robh@kernel.org>
Date: Tue, 22 Oct 2024 16:01:11 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJzeLMd+buYBhp+UJEX9RiTQ92dWxXB_TYWp0fUkX0Fqw@mail.gmail.com>
Message-ID: <CAL_JsqJzeLMd+buYBhp+UJEX9RiTQ92dWxXB_TYWp0fUkX0Fqw@mail.gmail.com>
Subject: Re: [PATCH v10 2/4] dt-bindings: display: Add powertip,hx8238a as DT
 Schema description
To: Lukasz Majewski <lukma@denx.de>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 8:31=E2=80=AFAM Lukasz Majewski <lukma@denx.de> wro=
te:
>
> This patch provides the DT Schema description of powertip,hx8238a
> 320 x 240 LCD display.
>
> Signed-off-by: Lukasz Majewski <lukma@denx.de>
> ---
>
> Changes for v9:
> - New patch
>
> Changes for v10:
> - None

Perhaps read my comment on v9.
