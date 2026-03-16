Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5409B3CCFA6
	for <imx@lists.linux.dev>; Mon, 16 Mar 2026 16:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773676868; cv=pass; b=m9CgKZWg8bMFumANr2m8kM6UDERO4++R0NXmSsypzDSpoPlRsU9g7WgltL9hSTWu7WdpbKJlReu5rCUCTEMfFpy2yZLfpgETz7MQnBeDhv/GOkWxTPeSM2JhsjdSeeithDEV9yTozGo0VJ7U9hoQ/77sOhPTE3i/NKCImGSfYWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773676868; c=relaxed/simple;
	bh=nRTROiegC3HHzc2PKkDT6LEu+pHZlAThf22kVsmxLDs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oqNfOL+YuMLhmquxHKHWYgnC697zOGkUo6zEQtz09NE0KnavB9N5GhcAt5CYxEDuVzz4Ej+qmrEfyFqE/0ZAvgWMH4vz0sw6p2fAjxHrC6PL6WBe0A4miYc6UipcZXMyGv6IjJ6Rzn0PF58P+zvWCRLU3UJErrZtoMhToqaeb9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LFAZu8Ks; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LFAZu8Ks"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6618bc129acso6104475a12.2
        for <imx@lists.linux.dev>; Mon, 16 Mar 2026 09:01:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773676866; cv=none;
        d=google.com; s=arc-20240605;
        b=iBCPHgkZBZBogCW4QWUjwmXGMKuHYEgaa8Adz6eaY+/Q0MPkHEcRN8WryMmJYa8psV
         6T+l0JCrFjbj/KLdTEzAPXGxBTpRy1LCrE1aCrSXiLOFPR4RsQOyVo6+45gJteb6pohI
         Egck5ZnjHa4L0GBJnChpvlM+5QHzCwa/YilLnyEiye+teHyXuRp7zWPOAgNe5lDB2Xeh
         kBl9cGzrxWiYvCmCcIiaxxvn2Z6qR01c3TmLmV6gatpHsu8Dby0hNy/sxcFX6GeNtezY
         fpIkevPtKS4n7/82kdAygyBnZvaTWpL+sanOLhIrzoE/lqrb/XyU1CGoWXIMKLNrmDKc
         ROVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nRTROiegC3HHzc2PKkDT6LEu+pHZlAThf22kVsmxLDs=;
        fh=YvDsPgVkpk1N6UkHueFt4dTdFRIZZMR6qc/158aT6aA=;
        b=UW3W81r8hcjtCERM+GxImxcJ//8NFJLiykQwQm8YkX2dGengrj9eCSaFokhHZhCmNt
         NMAmyiBMRPTrZHuT2TESSpRR8rfkT9jwmPLD5Jw/UqD1Eamtq0+iBmAkGmuLfaMP1K0E
         D1RvqoSX+Ahk1/aEHvhR8el0r7Z/gw8/7Xam0rftsRnRBRsw1GfWtupI8M/oWKS4f1W1
         ZfmpeZtOJDx6MO9eGiqQ2sn5bB8i1w6OH6JhU/om8xWAb7CPcnepQeY4r9UT4hgVrTH5
         eH0jDmpPhpdRXjJBm5DZxTButJUpRJOudomVnkSw8dRVd4wpYGKie6bBtHAa8ukAFotd
         QjNA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773676866; x=1774281666; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRTROiegC3HHzc2PKkDT6LEu+pHZlAThf22kVsmxLDs=;
        b=LFAZu8KspaaAmJ0oLseeiGo5QjN/fxWGOMQpfQQCzxtC1V7TXC3bzglSagIl28QD7k
         AO8/ZdwoGLDOtJoLrgEMXJR3F4Kj8Y4zsT3B5HHuBSjafQ3BriPnlR0NySIymVxn5NrD
         wPRMLhEjZy6jgHJib7JzgFUsWMZgfkb8W4Eo0DPITpyKUpHiJLsaVQKLc8xxXOX5YyLu
         DcdZbGD01g/5S4HKSON78LVsvi9kJ3iWo7IUmwbRnY3CydlFSXuDN+TYcKG/mu6s6hNa
         BdL/DpsPT4/8dHUKcDfSV/2nXt1nVmvpYYZhyJn3DdIqVbI7jd+UP5rhLeS/5kE732zY
         Xukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773676866; x=1774281666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nRTROiegC3HHzc2PKkDT6LEu+pHZlAThf22kVsmxLDs=;
        b=Azma153YyqTad1WQA9djiFUFSiX1ArJpKYg7LQXgFGBQ+dbznYtAFJQSmphxrWyCPR
         GyfzZgIwlBsAQJRut57tzFsDHFA6IFK0PapxBSrE2xBXHbjjAGt0tQobsvyiQiRc5NFP
         OOt3p0xVBFYWSk8bPDixZA8DbIHvNiI6YDGGiZTKbsRyOD5ZM5jc/PYS6uPDmEIJXwhC
         faLJLU9vOo/062V6frfBvWAdl37gi2Ps1HnJYzUlJcySNCq4AOGPfHiNPtY0C5oIN0FM
         ewuTS91z/E6V+bR7dTrgzyh50dmdwejjCYtd1FA3oHa+wjmmg6ceb6CuJ6ielucmMgBB
         oy2w==
X-Forwarded-Encrypted: i=1; AJvYcCUHrzuS8Zj1SFZ9DA82/hK86qVfO++tui/nSuyS/IGHAKsFT+6V4dt4+CM90ECp3lGu5kg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyzopUT167Qkxaj+cOaLKhJNEsxgAMww/JaXsHRIuTcZmdDV9v/
	qmiICmvxLgmIbhyM4BHsibUswGcViaz5dvRvPSszUdrxGHyjwUvyNglybmE//RiYtyvBbs4gL/N
	LNrCKG6dpyEEBDk7ZUk357T3GVpi2L+YKwSHr2Cprgw==
X-Gm-Gg: ATEYQzy0jbXVi1/Tpe76+jHESU/oaZnAWrMAh+0dkYlbXilrjItnx61NnmYOuF5XS34
	WHAvaV71v5qid/u+FhSEQg4HfOfiuEnjD1IeEGKoP/tBAZA8Plmr2p4LQIM1/PB4N907fOLQjg7
	hmyLXyqnVvHuu10oRF5UZyD1ivWF9p47n98bE3oAj3cCJHvL74E/CidzBP5rfvVOtQLbZjZzo0I
	d8ZtV3YycPxD84wdcIkzjljPFi1ksViKhcKOD4p9LuajeB30LgjJ669F4vmMVXunPr3M2wVFsXJ
	LTuE2b7n070+/gj1DWoHV9ULd0jqpdG4uIgXC1RAhg==
X-Received: by 2002:a05:6402:51c9:b0:65c:2af1:b7e2 with SMTP id
 4fb4d7f45d1cf-663bac17dcamr7423927a12.27.1773676865593; Mon, 16 Mar 2026
 09:01:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260313195801.2043306-1-shenwei.wang@nxp.com> <CAD++jLkVZc7J+39eUtpWz4+YQm035HDtUyiyrEFGifQkcSMsCA@mail.gmail.com>
In-Reply-To: <CAD++jLkVZc7J+39eUtpWz4+YQm035HDtUyiyrEFGifQkcSMsCA@mail.gmail.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 16 Mar 2026 10:00:53 -0600
X-Gm-Features: AaiRm52a6xRhLIv8WCDX8JG5wzLTI5tmdCIrfHWi7mJRzbOdI91SV43T2PYw5ig
Message-ID: <CANLsYkyd8x29kz1u2dkyn_5hhWVJehz6VVKEx81Ew6i1nKObwg@mail.gmail.com>
Subject: Re: [PATCH v12 0/5] Enable Remote GPIO over RPMSG on i.MX Platform
To: Linus Walleij <linusw@kernel.org>, Andrew Lunn <andrew@lunn.ch>
Cc: Shenwei Wang <shenwei.wang@nxp.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, arnaud.pouliquen@foss.st.com, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

[Adding Andrew Lunn]

On Mon, 16 Mar 2026 at 08:23, Linus Walleij <linusw@kernel.org> wrote:
>
> Hi Shenwei,
>
> On Fri, Mar 13, 2026 at 8:58=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.co=
m> wrote:
>
> > Support the remote devices on the remote processor via the RPMSG bus on
> > i.MX platform.
>
> I think v12 looks pretty good, if Arnaud gives his ACK on this patch
> series I think it's ripe for merge.

Please wait until Andrew and I have provided our RBs before merging.

>
> Yours,
> Linus Walleij
