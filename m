Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793091354;
	b=rmavVW+GPFD4ddO774yFY7rNi6NU6wmXDp1ceVJnsJSu8Q/eM260afkvucQYN3cBq43h
	 ArgGYogKwRPzcE+FMJNhlJqjimYyey9JXxfAS2vUNguINSDrC5XrVgiCPVCS7uT/3wk7s
	 7OxPNknKkElyyOly82DG4dwFBrQ/N7Ph1+EEVLVr29i6N1QCYXj1QFx3J1ZBIinKiP5kn
	 mAm4qFLu6vV2o/8YxsrlkUlrpDyXcOTvYW8CEHA82w0GYcmQlbUQbPeU/PqIrTBwKsgl9
	 3pZ3bNn7byuersaH++zbKECYyLOFwagfG85LOWnitTRovOrr4EwyQ9J8EFPd+c7nf8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793091354;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=N+roS2hjC/wcKqOTe3oUy3DxdOVJ6Kmbylk65hYNNtk=;
	b=LokflJB2DRw6l4SuoBIBkLDJVJ7OWM1lZppE/e58805toj0QLk33405jWR0n+rjrCAON
	 VhP+JfoPgGPDGZa3PMnId9K2TtlfQuWo+Zlccg7WPPYkBtpWpffGStdmjUqlHG4+ejSH4
	 8W0KVcSoKvMvO882y53C7xOUOOwcAn7atRAskXcWHWLgcm8mi/RcB0Ae2aQG3hWYPzQjB
	 xrcXft6OLERv+yajdARoBAG5QiuoXNwEQ43nudtbnnkpfJSd+L7sn6iLgscWYuAeVFRg8
	 AgVFy8V2t87hxygNRyAVn3160ysganK0LUdRqwckKPt666Yl90YElDlrYDmiZUnaHKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X37gobev;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32377606A322
	for <imx@lists.linux.dev>; Tue, 27 Oct 2026 08:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X37gobev
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E76941F031E8
	for <imx@lists.linux.dev>; Tue, 27 Oct 2026 08:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793091352;
	bh=N+roS2hjC/wcKqOTe3oUy3DxdOVJ6Kmbylk65hYNNtk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=X37gobevIHgsMWSMYDxBeNnPo5a57h+FI8Gu2W/EisrKRqyvPj5y089nAShzkr4Se
	 fTCv2Me9O0hWiOIYCwp5knFJKrY9A806+37t/WKQ4KGNLNtN08oFhrNH8/CojLQGGb
	 ygJqjTkshmkxz7U1EgGHtwSkRVqbEc+76ei/qmgCktrhaOTjFGJRjqrQ31HHZys3N4
	 35hWdiceB5b0NPpuerTYaP679FuQD6lIEo1thGQci0I+wRAykucHVaxv6Hq/codD7A
	 4H0/enzB8NJAG6EDmgG6v9f19yzowMM9PT6tmJUHUTi970bkgicGXZp6QO6JxmMD4z
	 RhhiCmpJWTRvw==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso5959855a12.0
        for <imx@lists.linux.dev>; Tue, 27 Oct 2026 01:55:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzns10Xd/ipl4q43HUO+a4i4exZHPodTxA0ACRdcWEmrV8feXrstylmmyzPX6lZGvOMU+w=@lists.linux.dev
X-Gm-Message-State: AFq9FYJgJuzHDxm116mcSne7Bup6C1RpLrT1SnzS1zQF206BKmDR/Zm4
	Rne1X5O6gzZwIK3g8cKJ9TGsdupqvWN84Z++6AivYYT6DzF2pB30SZhD6qjBJpltY6uoTGkBtiC
	03MzpMJ58LW/prclcC9bzH0/yKqzGdsM=
X-Received: by 2002:a17:906:c10b:b0:c46:5973:2a1c with SMTP id
 a640c23a62f3a-c46bde8d652mr999291166b.37.1793091351751; Tue, 27 Oct 2026
 01:55:51 -0700 (PDT)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027065012.191348-1-chunyuzhiqiang@yinhe.ht>
In-Reply-To: <20261027065012.191348-1-chunyuzhiqiang@yinhe.ht>
From: Vincent Mailhol <mailhol@kernel.org>
Date: Tue, 27 Oct 2026 09:55:40 +0100
X-Gmail-Original-Message-ID: <CAMZ6RqJwMyaz_qO9grYU6JQcMQEr0vBJUngNHAqBuZP=Apk1nw@mail.gmail.com>
X-Gm-Features: AclHuK_J4bDR70cIab0Sgh5kSlTN88NyIziCXhnpSwYOehbkWFZr8tbpcbD0YAc
Message-ID: <CAMZ6RqJwMyaz_qO9grYU6JQcMQEr0vBJUngNHAqBuZP=Apk1nw@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] can: dev: can_fill_info(): don't wake up
 controller if interface is down
To: ChunYuZhiQiang <chunyuzhiqiang@yinhe.ht>
Cc: netdev-bot+sinfo@kernel.org, netdev@vger.kernel.org, 
	linux-can@vger.kernel.org, mkl@pengutronix.de, kernel@pengutronix.de, 
	haibo.chen@oss.nxp.com, shawnguo@kernel.org, imx@lists.linux.dev, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue. 27 Oct. 2026 at 07:54, ChunYuZhiQiang <chunyuzhiqiang@yinhe.ht> wrote:
> If the interface is down, the CAN controller might be powered down and
> its clocks gated. Don't call do_get_berr_counter() to read the bus error
> counters if the interface is down, and adjust can_get_size() to match.
>
> This removes one trigger for a synchronous external abort seen on
> i.MX8QXP when "ip link show" is run on a flexcan interface that was
> never brought up. The underlying cause is platform-specific: on i.MX8QXP
> the CAN clocks are gated through the SCU LPCG and the subsystem shares
> the IMX_SC_R_CAN_0 power domain, and there is a window after
> pm_runtime_resume_and_get() returns where the clock has not reached the
> module yet. This patch avoids the netlink query path while the interface
> is down, but does not root-cause the LPCG window itself.
>
> As a result, IFLA_CAN_BERR_COUNTER is no longer reported for down
> interfaces. Userspace must treat the attribute as optional.
>
> The issue was triggered on an i.MX8QXP board by running "ip link show"
> without ever bringing the interface up:
>
>     Internal error: synchronous external abort: 0000000096000210
>
>     pc : flexcan_read_le+0x0/0x18
>     lr : flexcan_get_berr_counter+0x4c/0x8c
>     Call trace:
>      flexcan_read_le+0x0/0x18
>      flexcan_get_berr_counter+0x4c/0x8c
>      can_fill_info+0x1f8/0x434
>      rtnl_fill_ifinfo+0x8fc/0xbb4
>      rtnl_dump_ifinfo+0x364/0x448
>
> This is the same class of problem fixed for m_can in
> commit 91a55c72a821 ("can: m_can: m_can_get_berr_counter(): don't
> wake up controller if interface is down").
>
> Fixes: ec56acfef2af1 ("can: flexcan: flexcan_get_berr_counter(): switch on clocks before accessing ecr register")
> Cc: stable@vger.kernel.org
> Signed-off-by: ChunYuZhiQiang <chunyuzhiqiang@yinhe.ht>

Reviewed-by: Vincent Mailhol <mailhol@kernel.org>
