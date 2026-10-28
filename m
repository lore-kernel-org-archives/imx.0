Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793227989;
	b=4jKTHUNPkl/eiiV1YmuHfffqibaoiMWkaXU76aSTN1X2DdnkENQr2xgev58SIzHvvb84
	 eKFPnBTMLwtjI2DBh4aqhqvXP9IiYuxTfIqHaXx58LQDF8RVpPZKVSdvCJaEOSzdmXlAv
	 9ETu3y5GCp3UJ/jh8Cd/RlEbCn3qiLOuV7pf0mne9qaIOG/f/Qu2ykrLWWYVjom0rJ/v+
	 iTzdwhwwSXxZ4p+dVAUoZy0dB3XPsWJ64pZMS04GhUQLfLeicfaxIM9XC/Ytl3lnyK6p+
	 jJGezxFnt1kisawb6c9o5525k1YSbpyZf/+ldB+4euIvCCs62wT6w660ULa3B2XJyNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793227989;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LUzzsIAM6IlGqlO6QeE7+4Pmhv4eAgzjV7MKduHlPpI=;
	b=N6MljjT/N3Cn31joDHddZ689q1bP0jhdSq79F3BUEuPEZD7mR9q8hmrk2OjEH65FfL3h
	 +9uZPNDZ5f14f8LwQXCtXDFRGw60OJqIzD0pq/Ifuui2iM+0CHbimGR7clY8Q7fzv7aSe
	 rRhet5B0VehgYGdN1Q8rMDPjzVw7zna5vthl/yJKADq5VlYdiDg+UvsEV3zcvVGLkQLk7
	 v2BBpeaU7yNx0fJghGTla3qHW6BPSnhlvkmbQffHWp/oXqBDKxe1E9kU43+0sDk266xWU
	 Y65pMznYv0Zw8nbmNlQcatFIj49L6NlmbEeL3ufm4RT1rjac9hYMuE8uldCJWKnkAcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MoG3Tpvr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029B5606A32A
	for <imx@lists.linux.dev>; Wed, 28 Oct 2026 22:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MoG3Tpvr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A447F1F031E7
	for <imx@lists.linux.dev>; Wed, 28 Oct 2026 22:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793227987;
	bh=LUzzsIAM6IlGqlO6QeE7+4Pmhv4eAgzjV7MKduHlPpI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MoG3TpvrBpkcNOjjXlzCqkry5e09Sbh4WEMosecwIm0u4ucwfmxyGCSH6HmVBLD+E
	 mqnizOjovDh3TSi8hfYf1rVMAOGP3Sb6kXOELfx52ckxd8gMtYgQ3On7WqlUiS7ArT
	 JWqMZmtJ4vCAtC6uAVKi0bEueAN7uWAFbG3DqtVJoxzjjkfb1dvSk+WJbQ5vBaTI2V
	 OePwGMMsXiu1K8mjxMbs/4pzQehbukEjthpphFtH2j3MehP7uF5L2a1OpcsQWtl88F
	 kyC3lhriuzdzXzzQSvd+Y3U2nXTKABoymr5BNtHdbnNHPkQiGJoww8nQmkWNNqbFbk
	 dQPs7jqom46rw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bcb440d1cbso109449e87.1
        for <imx@lists.linux.dev>; Wed, 28 Oct 2026 15:53:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw9WVZ1ncY4ON6C0jo+2OyMFVIfxygteMgGKuKpIIUY1N9Cnlv2GOYTCLRMuEdwqB+3zaw=@lists.linux.dev
X-Gm-Message-State: AFq9FYJnqph5ovpb3t9inqIyxChYyJyRMLeNms1JHve9OMvGTMvghD9z
	3ukQb8o+87hb50FAN4jd8QJmXOjRVLmSZHqxMU+kiG6J5gn1L5yAKKskbF/6MXXdypgnftw7L4U
	hOvU2YRJzBkwMa5S62cbPP+Fcug1SykU=
X-Received: by 2002:a05:6512:3186:b0:5bf:b7d3:beb4 with SMTP id
 2adb3069b0e04-5bfd11acd08mr221499e87.15.1793227986490; Wed, 28 Oct 2026
 15:53:06 -0700 (PDT)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027-gpio-mxc-cleanup-v7-4-v7-0-7b602d70c149@nxp.com> <20261027-gpio-mxc-cleanup-v7-4-v7-2-7b602d70c149@nxp.com>
In-Reply-To: <20261027-gpio-mxc-cleanup-v7-4-v7-2-7b602d70c149@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 28 Oct 2026 23:52:53 +0100
X-Gmail-Original-Message-ID: <CAD++jLngFzjoieJNkpp5-m-86CqNNfK3TDw9NDa1S7oMhOm1sQ@mail.gmail.com>
X-Gm-Features: AclHuK_KQ4oBhICxbJAF69cbCxAU7hikZMXoxY43y-DzbhGz00AVIZeTD4WQFRs
Message-ID: <CAD++jLngFzjoieJNkpp5-m-86CqNNfK3TDw9NDa1S7oMhOm1sQ@mail.gmail.com>
Subject: Re: [PATCH v7 02/12] gpio: mxc: use for_each_set_bit() to iterate
 wakeup pads
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 1:13=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Use for_each_set_bit() to iterate over the enabled wakeup pads instead
> of checking every bit individually.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Neat!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
