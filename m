Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B931010F2
	for <imx@lists.linux.dev>; Tue, 19 May 2026 11:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779188506; cv=none; b=dqQ8B+T6w9IlGqy7sIM/ne3B59MXCQ7/Fwo1VmrFb9jld7CKB2DPXgrW8kS7qqjICMgnbHyzuY+WF+IfZWPBJAe2+MeBz+UPmScKyOQ6GgzkKAolTGspqc5LxS3V00B2REWtD4tqDiokmZki7MBQWosaPGNDzWChVM9PbWiurkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779188506; c=relaxed/simple;
	bh=rkiiuEjSVcyzYWEKamFlXhfuLrTpeaOfJBuJNhDC1dA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PrZ7XSX/1VRmdgANlG2bGo6oGv0OYuegpzY50xziSb+bmOANVF2/wMNkqJnkuZR09x3d45h/Rr+FxXRsjPXM7DHagajk/dhkoQTGuVbhiK2jdPLAwNzgO+VTPR9EEeY11JFkVv8yhf57jaZWobV8fe4QDx9xcLaQR66prZtpNGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PHm4mTIs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PHm4mTIs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 349FFC2BCB3;
	Tue, 19 May 2026 11:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779188506;
	bh=rkiiuEjSVcyzYWEKamFlXhfuLrTpeaOfJBuJNhDC1dA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=PHm4mTIsLBcBvDYs4apRNCT6eRbhoGEmvjefvoEl+jY6mqxQ8H8uvah4F7hqievnS
	 NewFZdxDgSC/wDww3R4ZX9Rd+ETspXHUv/u1nWuRk0RiBm82KJUDkM8Fvt6IfXqbEN
	 sBjtE5OKov9o7M/f+GcIl5W4bfvOy1TwZenxmoJdOtcPRQSvH7CwHIhvxa2yiB5bA6
	 2Q1wZ7v4Y1UnpBYpdajh8X1tSiSgIpvW9l3oKcj/3aoUu4mxbtppII8K45UV72cdKt
	 nEGP9FQg0AxcWQYfs1CMwXDd4G/WjdHsTErJAG3yuNQAO/7N7pWUsTkovO2POWCG8E
	 FgafzinDGA/yQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/37] drm/display: bridge-connector: extract
 drm_bridge_connector_get_bridges()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260519-drm-bridge-hotplug-v1-7-45e2bdb3dfb4@bootlin.com>
References: <20260519-drm-bridge-hotplug-v1-7-45e2bdb3dfb4@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 11:01:45 +0000
Message-Id: <20260519110146.349FFC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing pointer dereference when validating `connector_type`, ca=
using the error check to be bypassed.
--

commit 5a4cd30beb768eaba2369b4630833475535f79bf
Author: Luca Ceresoli <luca.ceresoli@bootlin.com>

drm/display: bridge-connector: extract drm_bridge_connector_get_bridges()

This commit splits out the code that gathers bridge pointers into a separate
function to prepare for better bridge hotplug support.

> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu=
/drm/display/drm_bridge_connector.c
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c

[ ... ]

> @@ -772,44 +772,24 @@ static void drm_bridge_connector_put_bridges(struct=
 drm_device *dev, void *data)
>  static struct drm_bridge_connector *
> -drm_bridge_connector_add_connector(struct drm_bridge_connector *bridge_c=
onnector)
> +drm_bridge_connector_get_bridges(struct drm_bridge_connector *bridge_con=
nector,
> +				 int *connector_type,
> +				 unsigned int *supported_formats,
> +				 unsigned int *max_bpc,
> +				 struct i2c_adapter **ddc,
> +				 struct drm_bridge **panel_bridge,
> +				 bool *support_hdcp)
>  {

[ ... ]

>  		if (bridge->support_hdcp)
> -			support_hdcp =3D true;
> +			*support_hdcp =3D true;
>  	}
> =20
>  	if (connector_type =3D=3D DRM_MODE_CONNECTOR_Unknown)
>  		return ERR_PTR(-EINVAL);

Is there a missing dereference on connector_type here?

Since connector_type is now an int pointer and DRM_MODE_CONNECTOR_Unknown
is 0, this evaluates as a NULL pointer check rather than checking the
value.=20

Because the address of a stack variable is passed to the function, the
pointer is never NULL, so this check will always fail and bypass the error
return.

Should this be checking *connector_type instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-drm-bridge=
-hotplug-v1-0-45e2bdb3dfb4@bootlin.com?part=3D7
