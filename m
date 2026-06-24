Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAAD37DAB1;
	Wed, 24 Jun 2026 20:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782334217; cv=none; b=eCYkr5/hWVz4ihSN/K4NvVZzNG8/TZGqoE+t9ZYCnZ1KWsmHtwJ446foJo/RoNvFBKJvpi37Jqf6+aBJsxSaWwlr4xdYfY3pZAjBvLqohP11Lq2itEZkTlBClLQeAzcYOLH4sW+H2CC3hiF0mkc3fWtHMBtCYYPlrr6sSx+S5Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782334217; c=relaxed/simple;
	bh=j0rBgWVUy25YpWKsdpSWYY8GQbofvELkmFArhhiDd6w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=u2GCV4ZDD6KPmXQ5Baz0C4IPRhpkBul8FyWV7Pm1GYvqBWnuWIDy3PtXNTRZKlWKFRwWm3WaPA+hzibxGpUdT649hS+w5y2W6g7J4tShKjFzCvKc52p/UnuFFjSJkBTFtl1ucG6ohodbfTCoWQw863jz3IZjrSv76bZBZaZgqXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XnjoIst1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XnjoIst1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 849AB1F000E9;
	Wed, 24 Jun 2026 20:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782334212;
	bh=sugJ0uNedzcsQzvjSAJ3mfPObD/6hBsKY8i872vDn2E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XnjoIst1jxNKHyXp18BEJwIQ7cPnyYT3rearXsZx5VLIgdRLmRjsfRNeMs1wqkWVJ
	 TSIDR1X0d4KKD8uHRZzbfSpkn/4ZGN+J149+xmR4TwcIN/34Iv9QUdseO4YQolOUeG
	 oExv0ghjfwSYbiMUEHGvwMfvWgiiEHIYtv8Ih+HyZFLG5i9GtpyTpcRKlnQYIbD3+k
	 0okcw3p+pYRlO02qTxutdu3lhgbODSMfhW7l26GaIpL8G4WqN5eXBZy4O2Yzdp5hXo
	 Rc/ci/Nm5HIxDvsMsUkUZHMkcMVb7J0HbCmzHSFfukhlsgiQsEX6+GWqpBdQb5aDGx
	 wexzxMceT0evA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/9] media: subdev: Add set_pad_by_ep() callback to
 internal ops
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260624-imx8qxp_pcam-v6-2-4b3f45920d2f@nxp.com>
References: <20260624-imx8qxp_pcam-v6-0-4b3f45920d2f@nxp.com>
 <20260624-imx8qxp_pcam-v6-2-4b3f45920d2f@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 20:50:12 +0000
Message-Id: <20260624205012.849AB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Severe layering violation by tightly coupling the core Media Con=
troller framework with V4L2-specific firmware parsing.
- [Low] Typo in the callback documentation.
--

commit 3e6e9fb5a2a23ceb5cd559adeba28603dd1f9e0f
Author: Frank Li <Frank.Li@nxp.com>

media: subdev: Add set_pad_by_ep() callback to internal ops
   =20
This commit adds a set_pad_by_ep() callback to v4l2_subdev_internal_ops.
The callback is invoked while parsing firmware node endpoints and allows
subdevice drivers to configure media pad properties based on endpoint
information.

> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
> index d256b7ec8f848..eb652eb76d33f 100644
> --- a/include/media/v4l2-subdev.h
> +++ b/include/media/v4l2-subdev.h
> @@ -935,6 +935,10 @@ struct v4l2_subdev_ops {
>   *	the v4l2_subdev structure. It is almost certainly required for any
>   *	sub-device that sets the V4L2_SUBDEV_FL_HAS_DEVNODE flag.
>   *
> + * @set_pad_by_ep: Set pad informaiton by fwnode endpoint, parsed fwnode=
 already

[Severity: Low]
This isn't a bug, but there is a typo in information (informaiton).

> + *		   saved into pad->vep. return < 0 means can't support this type
> + *		   endpoint. Set pad->flags according to pad->vep information.
> + *
>   * .. note::
>   *	Never call this from drivers, only the v4l2 framework can call
>   *	these ops.
> @@ -947,6 +951,7 @@ struct v4l2_subdev_internal_ops {
>  	int (*open)(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh);
>  	int (*close)(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh);
>  	void (*release)(struct v4l2_subdev *sd);
> +	int (*set_pad_by_ep)(struct v4l2_subdev *sd, struct media_pad *pad);

[Severity: Medium]
Does this callback signature enforce an architectural layering violation?

By omitting the vep argument, the callback design expects the parsed V4L2
endpoint configuration to be passed via pad->vep. struct media_pad is part =
of
the generic Media Controller API, which is shared across various subsystems
like ALSA and DVB.

Embedding the V4L2-specific struct v4l2_fwnode_endpoint directly into the
generic struct media_pad creates an inappropriate subsystem dependency and
wastes memory for all non-V4L2 media pads.

Could the V4L2-specific endpoint be passed directly as an argument to the
callback, such as:
int (*set_pad_by_ep)(struct v4l2_subdev *sd, struct media_pad *pad,
                     struct v4l2_fwnode_endpoint *vep);

>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624-imx8qxp_pc=
am-v6-0-4b3f45920d2f@nxp.com?part=3D2
