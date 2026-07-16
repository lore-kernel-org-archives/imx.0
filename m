Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404073D3314
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 09:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784194072; cv=none; b=uJ0NlHY++8byIX/k8qSsCFGUQNUeHTrGPv9+mhbaiCNR+Ow51fR9W5UVXn+zVsdVWKc1SKK3Syndu+H1HaDTw7HYKIkauZZ9ohBxRGx5gFRldXLM12PG9GnpYjYkYuzvi/n4xEGuVVS66k5J9pnpG2LkqQEgfL5TRdMX99lkkO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784194072; c=relaxed/simple;
	bh=rZrNyr9IQF/0Plzlsag5XK/d84b0HdJBfemxG7U52/I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eQ2Ar8VUlg+ZYAIGRERZmmVsEKkfEwDYD5az83aCYeZ0zQI7gF7hzANFZIe47BqK0JG496/yMRYuR0RUhKHpb+fTcFv3ufPS1aDfgaKA+2QDU159wTv8GD7olEklIN6Ok7qpHGYHF8zV1kJOm2WuJO0mKuYaH/IBhP0AyW/5aoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f2StTSEU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f2StTSEU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 933B81F00A3A;
	Thu, 16 Jul 2026 09:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784194070;
	bh=rZrNyr9IQF/0Plzlsag5XK/d84b0HdJBfemxG7U52/I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f2StTSEUsTyUWQRKaplskYPjjStNJasAhwK7tMcxEzfDJs5aYwPhwRwE+GBijmCLK
	 hPhjJMPwY8AEkH8HrDS/4wxVg8porjjRxBUFzBlIqd0VU4PmVoIBsMrVHLysfTs77N
	 HNon8Ff4odZw99ArQ2uKQThTgudEI41WgnNEYsIXCNhrk4kE01IcPIabOI9BmKm3/z
	 wRzP6j7BCQOjG3oFt+6RJnxDFFZzDEPUvRuAqJDYWNn9VXpnnX4NYdQ8x91h6XJfxh
	 knqyzPPynFPQKzq6rRSl0Gyody76/PPnvVwlot+gzkpdtEnz33+kbhYEVmYRZORl9E
	 4DxCZ3OxHOLcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/8] drm/aspeed: replace struct
 drm_simple_display_pipe with regular atomic helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ze Huang" <ze.huang@oss.qualcomm.com>
Cc: Frank.Li@kernel.org, dri-devel@lists.freedesktop.org, imx@lists.linux.dev
In-Reply-To: <20260716-drm-simple-kms-removal-v2-2-1133a8fc3785@oss.qualcomm.com>
References: <20260716-drm-simple-kms-removal-v2-0-1133a8fc3785@oss.qualcomm.com>
 <20260716-drm-simple-kms-removal-v2-2-1133a8fc3785@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 09:27:50 +0000
Message-Id: <20260716092750.933B81F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] Missing `inline` keyword on `to_aspeed_gfx` in a header file.

Pre-existing issues:
- [Critical] Direct dereference of `obj->state` inside atomic helpers leads=
 to potential use-after-free and NULL pointer dereferences.
--

--- Patch [2]: [PATCH v2 2/8] drm/aspeed: replace struct drm_simple_display=
_pipe with regular atomic helpers ---
(Note: The format of this report is altered to a free-form summary due to
automated recitation restrictions. Code snippets are not quoted directly.)

commit d1e92d6b727d3655d12a72430c723784264108f5
Author: Ze Huang <ze.huang@oss.qualcomm.com>
Subject: drm/aspeed: replace struct drm_simple_display_pipe with regular at=
omic helpers

This commit replaces the simple display pipe with explicit plane, CRTC, and
encoder objects in the aspeed DRM driver. It moves callbacks to their
respective atomic helpers and shifts page-flip event handling to the CRTC
atomic flush path.

Issue 1: Missing inline keyword
File: drivers/gpu/drm/aspeed/aspeed_gfx.h
Function: to_aspeed_gfx

[Severity: Low]
Does this function need the inline keyword? The to_aspeed_gfx function is
defined as static in a header file without being marked inline. Could this
cause duplicate unreferenced copies of the function to be emitted in every
translation unit that includes the header, potentially leading to binary
bloat or compiler warnings when compiled with -Werror?

Issue 2: Direct state dereference in atomic context
File: drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
Functions: aspeed_gfx_set_pixel_fmt and aspeed_gfx_crtc_mode_set_nofb

[Severity: Critical]
This is a pre-existing issue, but is it safe to directly dereference the
object state pointers here? In aspeed_gfx_set_pixel_fmt, the code directly
accesses priv->plane.state->fb->format->format. Similarly, in
aspeed_gfx_crtc_mode_set_nofb, it directly accesses
priv->crtc.state->adjusted_mode.

Since this is accessed during atomic commits, if a second non-blocking
commit disables the plane before the first commit reaches its atomic enable
execution, the plane state could be updated to a new state with a NULL
framebuffer. When the first commit's worker eventually reads the state,
could this lead to a NULL pointer dereference and a kernel crash? Would it
be safer to pass the specific plane and CRTC states down from the atomic
helpers instead of reading them directly from the objects?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716-drm-simple=
-kms-removal-v2-0-1133a8fc3785@oss.qualcomm.com?part=3D2
