Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E909935200A
	for <imx@lists.linux.dev>; Tue, 19 May 2026 11:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189427; cv=none; b=KgXusr4UYNgtakI0mcGvino3d0l25+Qne64B3M5jMiSZvvbGpUxmTZHImizL61UcV6TmnyX6yFW518zXkkFTExr4jBj75N099SE5qODQyQXFAWjOgJt9atZK0qQeYXmrh3zjOtqs3DJpvooBZyQNX0s4ykmDCtpsBJ8ODNTCqNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189427; c=relaxed/simple;
	bh=7ZJf6C2G0nJrP8KeFppLQn6YFl46gVe5+D6A2NxC5S8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FmPd8TrgPLBFhpRvRe+L+RJ4IUafJdLT7SDl2N23yyDSDKlcgDm0iQVnCa4GgCtCEmipzcePs5E6kyA9G1MHIoAwn8h2jAoGbtmpF7oZNgmLxaL0z7nKUpW3D/O6NUIK2ArC++nd2nWvuW+NgdmaNABNz0qXiJCTinSDH8c2Xl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y/tK9f+O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y/tK9f+O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72A18C2BCB3;
	Tue, 19 May 2026 11:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779189426;
	bh=7ZJf6C2G0nJrP8KeFppLQn6YFl46gVe5+D6A2NxC5S8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Y/tK9f+OFjHRhwQDnc88JZhBVBO9HGCPGC83wOu44+wNzdO0w+hD4d4EcrdBQx5Vt
	 fVmrmxXHjSd9X5LM6NkHkcQxGy8SZs49Ct4j2+PAbRATr8RnYatJbG78KF1azTsdu4
	 mQ/jDH1fZxcHSX6a8yOOoC36RDcdX6iwXVbqY39YuLu4TPuPutyj6oHqSicIwV21dN
	 XpQJkcrmDoMz5G2YtLGPob7hz76ZhZHasONOY9Hb8VRhCKzxZVdxEfWCHEMkzD6LG3
	 kAbJrNBv3U0hghnIGjBjf3tli4vHY7Gk+QQZebkzG2+xKqHcul6NcJ6n20Dh4JC7kH
	 LIegFbI1Ux7yA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 22/37] drm/bridge: initialize chain_node list head on
 detach and attach errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260519-drm-bridge-hotplug-v1-22-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-22-45e2bdb3dfb4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 11:17:06 +0000
Message-Id: <20260519111706.72A18C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Data race and NULL pointer dereference in drm_bridge_attach() erro=
r path during dynamic hotplug
--

commit b83693320d718d054d9327b487d4044213901c1e
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/bridge: initialize chain_node list head on detach and attach errors

This commit updates drm_bridge_detach() and the error path of
drm_bridge_attach() to use list_del_init() instead of list_del(). This
ensures the bridge chain_node list head is clearly empty when detached,
preventing double-detach issues during hotplug operations.

> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index f179e00745b7c..5b89168411aa0 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -598,7 +598,7 @@ int drm_bridge_attach(struct drm_encoder *encoder, st=
ruct drm_bridge *bridge,
>  	bridge->dev =3D NULL;
>  	bridge->encoder =3D NULL;
>  	mutex_lock(&encoder->bridge_chain_mutex);
> -	list_del(&bridge->chain_node);
> +	list_del_init(&bridge->chain_node);
>  	mutex_unlock(&encoder->bridge_chain_mutex);

This is an existing issue not introduced by this patch, but since dynamic
bridge hotplugging support is being introduced, can this sequence cause a N=
ULL
pointer dereference?

In this error path, bridge->dev and bridge->encoder are cleared to NULL
outside the encoder->bridge_chain_mutex critical section, while the bridge
is still linked into the encoder->bridge_chain.

If drm_bridge_attach() is executed at runtime and fails, a concurrent
userspace atomic modeset iterating over encoder->bridge_chain could observe
the bridge with bridge->encoder =3D=3D NULL. Drivers typically use this to
fetch the connector:

connector =3D drm_atomic_get_new_connector_for_encoder(state, bridge->encod=
er);

If bridge->encoder is NULL, this returns a NULL connector, which could lead
to a crash when calling drm_connector_index(connector).=20

Should the field assignments be moved inside the mutex-protected block, or
after the bridge is removed from the list?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-drm-bridge=
-hotplug-v1-0-45e2bdb3dfb4@bootlin.com?part=3D22
