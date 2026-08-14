Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32A214883F;
	Fri, 14 Aug 2026 00:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786667122; cv=none; b=iNRayOEpy1b8unGESAScMfV158exQILMecyEhnfblJdGpLtHszbOfjrBF3pq0eqSA9Z32RJ80n9/Kk6qgD836UWYLCE+rHJf+P1HBr8fX1lEnqWRXMofPd4cvu0Ai5S5OUMbtfY6bZ88Ru3FROid3bzVvCZRXP9+/YvCohlo0jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786667122; c=relaxed/simple;
	bh=Ovhoiiljd902TOOeT7VYQJQbJfqGR1zMfhWlqi5bARQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fKKVD5WQWhmQ+WZN8aqcS5wSvpSfTcf6Znf0kCVGxYIHNZkSsjMJ3pzpzyzVP1Lorw6+/QSvAvcJP7DwIrjteN+FLTD5ISKHe5G1CZaZdsoLerJ++E7mw6QIKYtEOLvgAdw0uTr6eZlII5FTNfWd2/fKhpgpel7M2MF/de2rKbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jNIoVAWK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jNIoVAWK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A7371F000E9;
	Fri, 14 Aug 2026 00:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786667120;
	bh=pUyYHgHwos0bcxTHxtYVnw48aE0HAeQhhQ4/rVnGlrU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jNIoVAWKuPr5A/KwHf7AVijUbJdGAIB4rhKbe1YoF9vfyzFVjLrDJ6+wOBbFTVjEN
	 0Ma4zzDZeSpYukqso8V04SYhs7FBuC/PjHEi1zcUSM+9/qc8iNaMMVovtxBSonLjKN
	 +TY1QhfIJOJbZTDP0Qx2MnAMUiS8F6aSUIXqElPiAQNg4ZuZtFqpgMzE65j2jG/k5U
	 64DkUiTXakPNmQl9/0+sofM4ssaMuOy4T5IdO0v8uAW8c/L7gDLi/N3bhzTCPL53Pn
	 cWnf6oak0+Uw99wj8eKqkA0TUzdS9uG/sTI3TW8bfLfhOIy8AxtXhY/nSzAkR8J+3P
	 YfUFe2vGmelmQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 02/11] media: uapi: v4l2-isp: Add v4l2 ISP extensible
 statistics definitions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Antoine Bouyer" <antoine.bouyer@nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260413160331.2611829-3-antoine.bouyer@nxp.com>
References: <20260413160331.2611829-3-antoine.bouyer@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 00:25:15 +0000
Message-Id: <20260814002516.2A7371F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Missing backward compatibility macro for V4L2_ISP_PARAMS_FL_DR=
IVER_FLAGS.
- [Medium] The VALID and INVALID flags described in the commit message for =
the statistics buffer are entirely missing from the code.
--

--- Patch [2]: [PATCH v1 02/11] media: uapi: v4l2-isp: Add v4l2 ISP extensi=
ble statistics definitions ---
commit 6a949d8a5a3f44c2ff93fc6087ed1842a9325479
Author: Antoine Bouyer <antoine.bouyer@nxp.com>

media: uapi: v4l2-isp: Add v4l2 ISP extensible statistics definitions

This commit extends the v4l2-isp extensible format to support statistics
buffers. It introduces v4l2_isp_stats_buffer reusing the container definiti=
ons
from v4l2_isp_params_buffer, and adds V0 and V1 versions for compatibility.

> The `v4l2_isp_stats_buffer` reuses the `v4l2_isp_params_buffer` container
> definitions, with similar header, versions and flags. V0 and V1 versions
> are provided to match with params versions. On the other side, ENABLE and
> DISABLE flags are not really meaningfull for statistics purpose. So VALID
> and INVALID flags are introduced. Purpose is to force ISP driver to
> validate a statistics buffer, before it is consumed by userspace.

[Severity: Medium]
Are the VALID and INVALID flags missing from this patch?

The commit message states they are introduced to force the ISP driver to
validate the buffer, but they do not appear in the code. Furthermore, the
added documentation for v4l2_isp_stats_block_header states there are no
generic flags for statistics.

> diff --git a/include/uapi/linux/media/v4l2-isp.h b/include/uapi/linux/med=
ia/v4l2-isp.h
> index 779168f9058e3..e84476280d431 100644
> --- a/include/uapi/linux/media/v4l2-isp.h
> +++ b/include/uapi/linux/media/v4l2-isp.h
[ ... ]
> @@ -39,64 +47,108 @@ enum v4l2_isp_params_version {
>   * Reserve the first 8 bits for V4L2_ISP_PARAMS_FL_* flag.
>   *
>   * Driver-specific flags should be defined as:
> - * #define DRIVER_SPECIFIC_FLAG0     ((1U << V4L2_ISP_PARAMS_FL_DRIVER_F=
LAGS(0))
> - * #define DRIVER_SPECIFIC_FLAG1     ((1U << V4L2_ISP_PARAMS_FL_DRIVER_F=
LAGS(1))
> + * #define DRIVER_SPECIFIC_FLAG0     ((1U << V4L2_ISP_FL_DRIVER_FLAGS(0))
> + * #define DRIVER_SPECIFIC_FLAG1     ((1U << V4L2_ISP_FL_DRIVER_FLAGS(1))
>   */
> -#define V4L2_ISP_PARAMS_FL_DRIVER_FLAGS(n)       ((n) + 8)
> +#define V4L2_ISP_FL_DRIVER_FLAGS(n)		((n) + 8)

[Severity: Critical]
Does this rename break UAPI compatibility?

Unlike v4l2_isp_params_version and V4L2_ISP_PARAMS_VERSION_V0 which received
compatibility macros earlier in the file, V4L2_ISP_PARAMS_FL_DRIVER_FLAGS is
renamed without a fallback alias. This will cause existing userspace builds
relying on the old macro to fail.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260413160331.2611=
829-1-antoine.bouyer@nxp.com?part=3D2
