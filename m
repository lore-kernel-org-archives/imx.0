Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4300533F8A6;
	Sat, 16 May 2026 19:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778959566; cv=none; b=EHBAaD2wnJiQJ2nMzyF1HW5d+ukw0eOMNtrnJxj6hZdxhH9rEicGHSmj/2v2zd86v7ZU4UVmcIZioA/hynpooOFYFCHrXiRGvgoJqA/5F54+et/0Oo3kOgWt3TqVkZvX11QWcebS+sbC+6G57W/dfm2EiSBAxoyhXRF44zuKS8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778959566; c=relaxed/simple;
	bh=ef+UkxFdMbpVT2NPKQmyoGf1jUZgVYz3lXta2hb/PZ8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Sfi6AGiceRZ9A82SwBSJ51nazKVVN+bx2nnBd3nF9b5LNzYsXwz0GP+hvjhcHGYxEZrYlG6esqB5Euot5X9F6NzosXohibVO0b0SINVBlwZ3/UmiBKZod/+Xyvg/7CiSE3gYKj3cJZiGbu6HOxpEFbZG7XawUf45ekELjNwaoto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sFLEsRoA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sFLEsRoA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A207EC19425;
	Sat, 16 May 2026 19:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778959564;
	bh=ef+UkxFdMbpVT2NPKQmyoGf1jUZgVYz3lXta2hb/PZ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=sFLEsRoAKghj20mp7757vElwTZkZnPkc7EonF+DuCZZ2eJZXWaNCKXJpFLRNMQr5R
	 odcR4SBo4nq3+KrLi+3KRcOQMDRJ0l8dK54U0lQNlULqTQRUWaUk2KMJjQX3ODlk+W
	 C4lnZC1jc1mndpmddDs4UadM4iOwW3cIj5p6INUdBJgdBhV3FOnJXohJhxYoL3HjOo
	 uGPd8lKf4zhDTqaHp/TGQjVCFkQUeWCx82p4I6xoJNxmx2qAPjKrKXce4STlT2dVqw
	 Je3TjKqclsIDNauZ4ALbtOTDGZ359OnE5no5LBqcP4L922VyWbcSyOtrpNHLYjpXgA
	 qfITJcZw/aE2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 16/22] drm: bridge: dw_hdmi: Use display_info is_hdmi
 and has_audio
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, linux-sunxi@lists.linux.dev, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260516183838.2024991-17-jonas@kwiboo.se>
References: <20260516183838.2024991-17-jonas@kwiboo.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 16 May 2026 19:26:03 +0000
Message-Id: <20260516192604.A207EC19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Direct, lockless access to `connector->display_info` from the `ato=
mic_enable` path creates a race condition with concurrent EDID probes, whic=
h can result in incorrectly initializing the display in DVI mode with wrong=
 audio or SCDC settings.
--

commit 339e5d6c4cc3c0ee74a9425b8a94dabb6a044d69
Author: Jonas Karlman <jonas@kwiboo.se>

drm: bridge: dw_hdmi: Use display_info is_hdmi and has_audio

This commit removes the private sink_is_hdmi and sink_has_audio tracking in
dw_hdmi, and switches to using display->is_hdmi and display->has_audio
from connector->display_info directly instead.

> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/=
bridge/synopsys/dw-hdmi.c
> index 1402b3963ae12..e9c4e24c090ca 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
[ ... ]
> @@ -2053,7 +2047,7 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
>  		HDMI_FC_INVIDCONF_IN_I_P_INTERLACED :
>  		HDMI_FC_INVIDCONF_IN_I_P_PROGRESSIVE;
> =20
> -	inv_val |=3D hdmi->sink_is_hdmi ?
> +	inv_val |=3D display->is_hdmi ?

Is it safe to read connector->display_info directly in the atomic_enable pa=
th?

Since dw_hdmi_poweron() and hdmi_av_composer() are called from the bridge's
atomic_enable callback, they can run asynchronously for non-blocking commits
after the DRM modeset locks have been released.

If a concurrent EDID probe triggered by userspace (e.g., via
DRM_IOCTL_MODE_GETCONNECTOR) calls drm_edid_connector_update() on another C=
PU,
it starts by calling drm_reset_display_info() which clears display_info.is_=
hdmi
and has_audio to false until the EDID is fully re-parsed.

If this code reads the display_info fields during that window, won't it obs=
erve
transient zeroes and incorrectly program the hardware for DVI mode, as well=
 as
disabling SCDC scrambling and audio?

Would it be better to capture these properties into an atomic state structu=
re
during atomic_check() and read them safely from the state object during
atomic_enable()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516183838.2024=
991-1-jonas@kwiboo.se?part=3D16
