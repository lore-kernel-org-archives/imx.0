Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285005;
	b=QwN0LPRYvieczQCvQHN5zTJvCiKtbkP76xDDYWuwSB+85f0BarMCa+2tKMTruxTWSUK8
	 AZHiBLuoDmofdc05J6+IzjOqq3A2CFh6MaujOmZpw1WZG9gNuUuOs06X8Y6bA/r8SV+JC
	 P7S261VWjKCnT1PXFegyXPpJPPtqZBUBM2RVBTB3UYwxJ2xUMotK69VomsovDVKvs20F6
	 Ee11vxjwKl+fnZsA0ksxtFI2mQDzZnUwCPjLHL5CajVZonXyFiw197EfgmHgxo4sl7QN1
	 tz/ZqwlncaV5RQJXOw7L1IcCdCnqFaYLC4YjzylIEmXPBC/lt11p9nKBd57vEtzkk4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285005;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RbdSCMbiyh6ayadBGz0vrgrRVd0upGpP2iuAv9wrEII=;
	b=SbPPllZe9OHyUd0j3KVdGdmTgWzCwiZapZxeplVUSZ8QK1Q3jr0OhIycaXiFWVm87e5o
	 mxPzanqCshuTYKZt9Wm8Rxca/tTwKHGBE0+pXfjrNbybhlociduy9TYBY3iNEJ652oakr
	 Qr75TcUJQdsmHOcesqZFNn9UoKCmxFl5a1gv1r5nAmHffnEuiUEygaxzFp4AQDzyjzuob
	 zaQAREOZQZS8QgN1+cWpFM4lLy4u1kmASi7tENvpdHo5FP5NFz2jxIJWd8gGGxJ8Gvzao
	 LicCCxfmlXjdMVbscSSnFDmkWHzeBjU/FPVI1adtJ4Lta0EXgxxksCzMu1elGwpiJnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cj1MB3hN;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DA2606A320
	for <imx@lists.linux.dev>; Sat, 21 Nov 2026 18:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cj1MB3hN
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6A4C1F000C0;
	Sat, 21 Nov 2026 18:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795285005;
	bh=RbdSCMbiyh6ayadBGz0vrgrRVd0upGpP2iuAv9wrEII=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cj1MB3hNtiIF7BIdY3o3cOZEeYjEU6wl2K3MTySnjtWyOJ/RVuV/PHpomY3a+qJk2
	 ro50p8m1JoBDR6AUzZD4j5cEb9bCIMAWH1TP2qpCPDglHe5KxKVE/ooY8a88T6lvVY
	 qr7SA4+WwVm0+DGnK3TiUkRZJ+TG/P1Bnrvf7Nuabc+EuhcolY0zI3/Ou4PjtzE0Fr
	 nDItI4VMCLDhPMBU3E38Rv1n7fHaAh6i/f5ufNgREuM750RhzDqBSeRH/8ks4hv18t
	 Y8mt0bO0OBlUDYZgoNxWl8tvRz0FhHMVYF5WICSMwdZxJ/U9aBkJAdcRkLkfzJdF/i
	 I4slGEruMJRSg==
Message-ID: <sashiko-outbox-227242@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] media: v4l2-core: add frame interval monitor
 helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaqi Shi" <shijiaqi_develop@163.com>, imx@lists.linux.dev
Cc: Frank.Li@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261121180044.424315-3-shijiaqi_develop@163.com>
References: <20261121180044.424315-1-shijiaqi_develop@163.com>
 <20261121180044.424315-3-shijiaqi_develop@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 21 Nov 2026 18:16:44 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] media: v4l2-core: missing kernel-doc for new v4l2-fim public API
--

commit 70fa26e77e3e68f76d9d83df7734532469e6749d
Author: Jiaqi Shi <shijiaqi_develop@163.com>

media: v4l2-core: add frame interval monitor helper

This commit moves the generic frame interval monitoring implementation from
the i.MX staging media driver to v4l2-core as a reusable helper module.

> diff --git a/include/media/v4l2-fim.h b/include/media/v4l2-fim.h
> new file mode 100644
> index 0000000000000..e44dd4ac90105
> --- /dev/null
> +++ b/include/media/v4l2-fim.h
> @@ -0,0 +1,41 @@

[ ... ]

> +#define V4L2_FIM_NUM_CONTROLS	5
> +
> +struct v4l2_fim_config {
> +	u32 ctrl_base;
> +	u32 event_type;
> +	void *priv;
> +	bool (*external_timestamp)(void *priv, bool curval, bool use_val);
> +	void (*wait_first_timestamp)(void *priv);
> +};
> +
> +struct v4l2_fim *v4l2_fim_init(struct v4l2_subdev *sd,
> +			       struct v4l2_ctrl_handler *hdlr,
> +			       const struct v4l2_fim_config *config);
> +void v4l2_fim_reset(struct v4l2_fim *fim, bool curval, struct v4l2_ctrl =
*ctrl);
> +void v4l2_fim_set_stream(struct v4l2_fim *fim,
> +			 const struct v4l2_fract *frame_interval, bool on);
> +void v4l2_fim_eof_monitor(struct v4l2_fim *fim, ktime_t timestamp);
> +void v4l2_fim_monitor_timestamp(struct v4l2_fim *fim, ktime_t timestamp);
> +bool v4l2_fim_is_streaming(struct v4l2_fim *fim);
> +
> +#endif

[Severity: Low]
This isn't a bug, but the new public v4l2-core helper API has no kernel-doc
comments describing allocation, cleanup, or locking expectations:

- v4l2_fim_init() allocates struct v4l2_fim with devm_kzalloc(sd->dev, ...)
  and adds V4L2_FIM_NUM_CONTROLS controls starting at config->ctrl_base to
  hdlr, which the caller remains responsible for freeing with
  v4l2_ctrl_handler_free().
- config->external_timestamp() is called under spin_lock_irqsave(&fim->lock)
  with the control handler lock held, while config->wait_first_timestamp()
  is called from process context in v4l2_fim_set_stream() with
  v4l2_ctrl_lock() held.
- v4l2_fim_set_stream() acquires v4l2_ctrl_lock(), v4l2_fim_reset() and
  v4l2_fim_is_streaming() expect the caller to hold the control handler
  lock, and v4l2_fim_eof_monitor() / v4l2_fim_monitor_timestamp() acquire
  spin_lock_irqsave(&fim->lock) and may be called from interrupt context.

Also, reset_fim() invokes config->external_timestamp(fim->config.priv,
curval, !curval && !core_active); passing both curval and use_val is
redundant since the callback only needs a single boolean indicating whether
to read uncommitted control->val or committed control->cur.val.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261121180044.4243=
15-1-shijiaqi_develop@163.com?part=3D2
