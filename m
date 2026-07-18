Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDB314A60F
	for <imx@lists.linux.dev>; Sat, 18 Jul 2026 23:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784418687; cv=none; b=gXf3jdZmyTEF9BmEhS4nn783+SuQoglQWelrl3zCECCR/A+Mq/FQFElk3xWfVqY6XK5moncK5mddqgTVT+nSp8R+NM3ybqCLjqAyqQUqMRQhRuHwoM//qMBlVkusrZYQ9fw2jdMzA5SHCkv5zPFTlSGO+kvoPF5qjV3p12IuQtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784418687; c=relaxed/simple;
	bh=B2dKnCCi4tQ4OHALpR2KNMaMSjRt9Y+wGZWlPLtsgxU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t3g9nXMy8uStJZGI6/yBNIqVIoqPe6MBA1PjBNRHJAmIwgxXv7JMKEOjO22nqYlWQbrNS+SjRtKJ6PUa3UbuJOERPvamyMNh1uySiwxBUmipAND+KyfBugTrqY0EzvtZKEHipEjSCKDKzLPSBZc7CwczfWL7eYM/CQHx8mq2FPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FgSZz3sX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FgSZz3sX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C66121F000E9;
	Sat, 18 Jul 2026 23:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784418685;
	bh=4OVsQf/yiuG67ARP6+Rl9z4GLpfAIYz6W7pHbzFxoRU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FgSZz3sXBEyoc4ZJPqe6zXYKq7KFDW6SjfP6hN3kTqIG/6AhnzVeXH+ZtOPmnIAv6
	 Ef2XmFgYqEFgLICSlNXfLI1GfECIMVvxwfVf+6xoz3tSGGVxGwhURkMcvm9iScM9jS
	 +vvp38J5I2UxJYxfS9WhBrdEEmF8yv9ObZo2SzmTsdDdiWFvg1xci6/PlMXxAkWG7u
	 oQbAMBOHcf7nt2lTbIA8CPs3q5DKGnmfA+Mk5rk4Tk0yOhAmvU1DBwqGTHcd6BHgMB
	 TFHfM7ZEUrLyeeWStrBOzceTrCtUHvl6/DYwGUBtieb1G077Zed9lyxQRoAiS3Wk2b
	 w28Jde70pzdCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 14/15] drm/drm_simple: remove deprecated
 drm_simple_encoder_init function
Reply-To: sashiko-reviews@lists.linux.dev
To: "Diogo Silva" <diogompaissilva@gmail.com>
Cc: dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org, wsa+renesas@sang-engineering.com, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20260719-drm_simple_encoder_init-v1-14-a78c509e3062@gmail.com>
References: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
 <20260719-drm_simple_encoder_init-v1-14-a78c509e3062@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 18 Jul 2026 23:51:24 +0000
Message-Id: <20260718235124.C66121F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The patch successfully removes `drm_simple_encoder_init()` but fail=
s to remove its corresponding completed task from the GPU TODO list.
--

--- Patch [14]: [PATCH 14/15] drm/drm_simple: remove deprecated drm_simple_=
encoder_init function ---
commit 7fd5be63f48ba2540ec1b5b7dc137c54a85997f8
Author: Diogo Silva <diogompaissilva@gmail.com>

drm/drm_simple: remove deprecated drm_simple_encoder_init function

This patch removes the deprecated drm_simple_encoder_init() helper since all
driver users have been converted to drm_encoder_init(). It also open-codes
the remaining internal use to prevent any new users.

> diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/dr=
m_simple_kms_helper.c
> index 8e1d07b9f1e30..7878b9d7d5248 100644
> --- a/drivers/gpu/drm/drm_simple_kms_helper.c
> +++ b/drivers/gpu/drm/drm_simple_kms_helper.c

[ ... ]

> diff --git a/include/drm/drm_simple_kms_helper.h b/include/drm/drm_simple=
_kms_helper.h
> index cb672ce0e856d..c95f86ff355ff 100644
> --- a/include/drm/drm_simple_kms_helper.h
> +++ b/include/drm/drm_simple_kms_helper.h
> @@ -68,10 +68,6 @@ int drm_simple_display_pipe_init(struct drm_device *de=
v,
>  			const uint64_t *format_modifiers,
>  			struct drm_connector *connector);
> =20
> -int drm_simple_encoder_init(struct drm_device *dev,
> -			    struct drm_encoder *encoder,
> -			    int encoder_type);
> -
>  void *__drmm_simple_encoder_alloc(struct drm_device *dev, size_t size,
>  				  size_t offset, int encoder_type);
> =20

[Severity: Low]
This isn't a bug, but since this patch successfully removes the
drm_simple_encoder_init() helper, should it also remove the corresponding
completed task from Documentation/gpu/todo.rst?

Leaving the item in the TODO list might confuse future contributors since t=
he
refactoring effort is now complete.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260719-drm_simple=
_encoder_init-v1-0-a78c509e3062@gmail.com?part=3D14
