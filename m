Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2992A3F1AA8
	for <imx@lists.linux.dev>; Tue, 19 May 2026 11:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779188972; cv=none; b=sERH8STcVVboD+8TV5wzrMnQb5GBUFUhR0d9etPsqKnU1WHwl/RCR2E5junEBUJrGII6Gn6pSmcB2biwh9uIto7ZZ6WXA4YWVg8F1j8ENi5NE8rlgcbckdzf8kFP/+U25genegBwkw7/L4YUzHvbRftmPL9L0CjVCiDJYvh1Odk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779188972; c=relaxed/simple;
	bh=W4T6JRI7v5RO+jwpJHsfe9TnB3/uDmQ03PD8kFEY5Oc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sS5FfTT8kCvzxBv90IX3K+py24k6KpndGnbSNnRVCnh88l4EF6FU6CD4zABg/lk/MDZBkASHdCFWc9K51yvIRVTSWZ7JSW9j93NvWHNVGuKG9A+K8cFo0QyDHiHmZgtU7eYm24QtjPt8Btwcpxa2f/bJgBrzi4f2Venh6nVpI9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SoOrY2Mn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SoOrY2Mn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B956CC2BCB3;
	Tue, 19 May 2026 11:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779188971;
	bh=W4T6JRI7v5RO+jwpJHsfe9TnB3/uDmQ03PD8kFEY5Oc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=SoOrY2MnjIJub6y9S/ECZmRfYt9/tRXKM3OK9y/pVSvNNumftVwMgI7T/NsI3c+ts
	 w/+WypIPyu0g3a5EIvKDzhaeh4J1j4k0YiQuN01fZ1qgk//poAHvWHVNdZkunCwu63
	 7qzO22nl4JKYdXmXC/ytW4NcZEQxtv6dCAuwuEh3tFiFJYZrtA6lFBINzYNKp4nLmK
	 ZIRpgxhMi7rnIVW4vJFtO2u1CycX8/1XNSq/w0F5t7WCvhwu1Vht9+w3JlUEJKoJA3
	 FUcPBKVTxQ62s0NaJ3Vqg+NyoRrcNTg2t3lACJWskPwXLvifTvkVlBswH5IS27peJC
	 ZQdNzNR9xAjAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 25/37] drm/bridge: shutdown and cleanup on bridge unplug
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260519-drm-bridge-hotplug-v1-25-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-25-45e2bdb3dfb4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 11:09:31 +0000
Message-Id: <20260519110931.B956CC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] Use-After-Free (UAF) due to dangling `bridge->encoder` pointer
- [Critical] Stack corruption via cross-thread list iteration in `drm_encod=
er_cleanup_from()`
- [High] Unintended system-wide display shutdown (Logic Error)
--

commit c68fe5f8aeb721d87ce6a0a639bb852359b46771
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/bridge: shutdown and cleanup on bridge unplug

This commit aims to handle DRM bridge hot-unplugging by shutting down the
pipeline and detaching the removed bridge and subsequent ones, rather than
tearing down the entire card.

> With the upcoming support for DRM bridge hot(un)plugging, bridges can be
> removed at any time withotu tearing down the entire card.

The commit message states the patch avoids tearing down the entire card, but
looking at the code, could this implementation still cause a system-wide
display shutdown?

> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 5b89168411aa0..e7e17bf4fdf9e 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
[ ... ]
> @@ -462,9 +462,17 @@ EXPORT_SYMBOL(devm_drm_bridge_add);
>  void drm_bridge_remove(struct drm_bridge *bridge)
>  {
> +	if (bridge->encoder) {
> +		drm_atomic_shutdown(bridge->dev);

Looking at drm_atomic_shutdown(), it unconditionally calls
drm_atomic_disable_all(dev, &ctx), which disables all CRTCs on the device.

If a single bridge is hot-unplugged, won't this unexpectedly shut down all
other independent, active displays on the same system?

> +		drm_encoder_cleanup_from(bridge->encoder, bridge);

Is there a possibility of a use-after-free here if bridge->encoder is left
dangling?

When a DRM device is torn down, drm_encoder_cleanup() iterates over the
chain and calls drm_bridge_detach(). That function clears bridge->dev but
does not clear bridge->encoder, and the encoder memory is subsequently free=
d.

Later, when the bridge driver is unbound, drm_bridge_remove() is executed.
Since bridge->encoder is never cleared, it will still evaluate to true,
passing a dangling pointer to drm_encoder_cleanup_from().

drm_encoder_cleanup_from() would then attempt to acquire the mutex from the
freed encoder memory:

void drm_encoder_cleanup_from(...) {
    ...
    mutex_lock(&encoder->bridge_chain_mutex);
    ...
}

Additionally, could calling this function concurrently for bridges on the
same chain cause stack list corruption?

Looking at drm_encoder_cleanup_from(), it uses a stack-allocated tmplist:

void drm_encoder_cleanup_from(struct drm_encoder *encoder, struct drm_bridg=
e *bridge)
{
    ...
    LIST_HEAD(tmplist);
    mutex_lock(&encoder->bridge_chain_mutex);
    if (!list_empty(&bridge->chain_node))
        list_for_each_entry_safe_from(bridge, next, &encoder->bridge_chain,=
 chain_node)
            list_move_tail(&bridge->chain_node, &tmplist);
    mutex_unlock(&encoder->bridge_chain_mutex);
    ...
}

If two threads concurrently remove two bridges in the same chain (for examp=
le,
Thread 1 removes Bridge A, and Thread 2 removes downstream Bridge B):

Thread 1 moves both bridges to its tmplist and unlocks the mutex.

Thread 2 then locks the mutex and sees !list_empty(&bridge_B->chain_node) is
true because Bridge B is linked within Thread 1's tmplist.

Thread 2 then executes list_for_each_entry_safe_from() looking for the
termination condition &encoder->bridge_chain. Because Bridge B is inside
Thread 1's stack list, it would iterate locklessly into Thread 1's stack
memory.

Would this cause Thread 2 to interpret Thread 1's stack LIST_HEAD as a
drm_bridge and attempt to move it, corrupting both threads' lists and stack
frames?

> +	}
> +
>  	mutex_lock(&bridge_lock);
>  	list_move_tail(&bridge->list, &bridge_lingering_list);
>  	mutex_unlock(&bridge_lock);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-drm-bridge=
-hotplug-v1-0-45e2bdb3dfb4@bootlin.com?part=3D25
