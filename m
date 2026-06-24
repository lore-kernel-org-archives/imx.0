Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E108B21638D;
	Wed, 24 Jun 2026 20:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782334660; cv=none; b=e6APS3NnCbyUQ6nrmrQXj7lqmqNjlSpoWOYDaabboncOnlR9UlTitKO84tfwis344GzmUhPmmtfgrsYyBxXnDfwAOFOIB5v/Uxa3ngTJO0Iy7BjYbC12FFwEoROGYKJMRPkuGU8qgZrzHxw8P0vi4PhVKNL9inC89ETK7tFC0uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782334660; c=relaxed/simple;
	bh=axiYKaIioZyNN4UxlIpvSlve0tQO7OKxq6+qa3/umpo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J3huAJt5oTS9fA6KUwbWRVvaM94JcrbX8rbZZj0H8XRxQ0kfwAlbr0FwU+IOzOgDxzDw/cB2hPJEukiYtAcdsNg34Ad/woPy+MBuu4mnv/edWI2ejre4eFhY9Wz3/UCKePk2I3ZX2ccIHkvuNKgifQqy8gz4W8RyXCIIreDUH/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DG9iUjep; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DG9iUjep"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F781F000E9;
	Wed, 24 Jun 2026 20:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782334659;
	bh=DR4ZGpwY3GfKmM52IVxT0rmhtjCkXFdR+ad9ypfbzyw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DG9iUjepVfzfix5CAy3NdC0a/B0/r1p+6ogOhGi8e24eNsMP11dkKMVv3FNUReR/4
	 j2WrWrc2IDLfb3yLOLAEvQwLZaxlhGVyHuBorLMijvOl3j6+0dkpvyGBEUrIhUCYym
	 Kgn9NiXnFfjTjTzfm6w2LcbUUXvZ7GOXD+mUqZ9xbgI4HO52rE4npndbv1oh4LXkxi
	 Uo0U7PZDpv+XsRYWrq7vzUGLeh+3JXRay5cHcOq8+K+cQ9+wLq5Ihd1WQu6GQCbItb
	 Zc84AGz7zmz/V/hzzIOWBiEYKlWlB8sPNZW7WlI6bzLwJ9q7CyDwGui4IMBS9td2ff
	 /QNOonLkvDTxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/9] dt-bindings: media: add i.MX parallel CPI
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260624-imx8qxp_pcam-v6-6-4b3f45920d2f@nxp.com>
References: <20260624-imx8qxp_pcam-v6-0-4b3f45920d2f@nxp.com>
 <20260624-imx8qxp_pcam-v6-6-4b3f45920d2f@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 20:57:38 +0000
Message-Id: <20260624205739.31F781F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unhandled resource leaks (memory and fwnode references) and double=
-free risk in `__media_async_register_subdev` and its cleanup path.
--

commit 050e10af8571659357b0d6bb808eab4e58871636
Author: Frank Li <Frank.Li@nxp.com>

media: subdev: Add media_async_register_subdev() helper

This commit adds media_async_register_subdev(), a helper to register a V4L2
sub-device with the asynchronous sub-device framework. It parses the firmwa=
re
graph, creates media pads for endpoints, and registers asynchronous notifie=
rs.
This centralizes common initialization and link creation to reduce boilerpl=
ate.

> diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-c=
ore/v4l2-fwnode.c
> index 62a3a452f7884..169059654478f 100644
> --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> @@ -1302,6 +1303,160 @@ int __v4l2_async_register_subdev_sensor(struct v4=
l2_subdev *sd, struct module *m
>  }
>  EXPORT_SYMBOL_GPL(__v4l2_async_register_subdev_sensor);
> =20
[ ... ]
> +void media_async_subdev_cleanup(struct v4l2_subdev *sd)
> +{
> +	v4l2_async_unregister_subdev(sd);
> +	v4l2_subdev_cleanup(sd);
> +	media_entity_cleanup(&sd->entity);
> +	v4l2_async_nf_unregister(sd->subdev_notifier);
> +	v4l2_async_nf_cleanup(sd->subdev_notifier);
> +	kfree(sd->entity.pads);
> +}
> +EXPORT_SYMBOL_GPL(media_async_subdev_cleanup);

[Severity: High]
Does this cleanup function leak fwnode references?

v4l2_async_nf_parse_fwnode() parses endpoints directly into pad->vep, taking
an fwnode reference via fwnode_handle_get(). It appears this cleanup functi=
on
fails to iterate over the pads to call v4l2_fwnode_endpoint_free(&pad->vep)=
 to
release these references.

Also, if a driver explicitly invokes this cleanup helper to recover after
__media_async_register_subdev() fails, will kfree(sd->entity.pads) cause a
double-free panic?

> +
> +int __media_async_register_subdev(struct v4l2_subdev *sd, struct module =
*module)
> +{
> +	struct device *dev =3D sd->dev;
> +	u32 ep_count;
> +	int ret;
> +
[ ... ]
> +	struct media_pad *pads __free(kfree) =3D kzalloc_objs(struct media_pad,=
 ep_count);
> +	if (!pads)
> +		return -ENOMEM;
> +
> +	ret =3D v4l2_async_nf_parse_fwnode(dev, pads, notifier);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D media_entity_pads_init(&sd->entity, ep_count, pads);
> +	if (ret)
> +		goto out_cleanup;
> +
> +	ret =3D v4l2_async_nf_register(notifier);
> +	if (ret < 0)
> +		goto out_cleanup;
> +
> +	ret =3D v4l2_subdev_init_finalize(sd);
> +	if (ret)
> +		goto out_unregister;
> +
> +	ret =3D __v4l2_async_register_subdev(sd, module);
> +	if (ret < 0)
> +		goto out_unregister;
> +
> +	sd->subdev_notifier =3D no_free_ptr(notifier);
> +	retain_and_null_ptr(pads);
> +
> +	return 0;
> +
> +out_unregister:
> +	v4l2_async_nf_unregister(notifier);
> +
> +out_cleanup:
> +	v4l2_async_nf_cleanup(notifier);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(__media_async_register_subdev);

[Severity: High]
If __v4l2_async_register_subdev() fails, the error path returns without
calling v4l2_subdev_cleanup(sd) to free the active state allocated by
v4l2_subdev_init_finalize(). Can this leak sd->active_state?

Additionally, pads is allocated with __free(kfree) and linked to
sd->entity.pads. On a registration failure, pads is automatically freed when
the function returns, but sd->entity.pads is not cleared.

Could this leave a dangling pointer that causes a double-free if error
recovery is attempted?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624-imx8qxp_pc=
am-v6-0-4b3f45920d2f@nxp.com?part=3D6
