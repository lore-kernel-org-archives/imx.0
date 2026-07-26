Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C66533793AA
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 19:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785095955; cv=none; b=VtBxPaxLURg2LiFbwIxBHzB6jFXlbylQH+HpJuDe1vG5r40AKA66dSGB16kwX9obOvFl0ez/km+oXvhXyt6G6sZw5K+FAGupbi1JyX4e99jMuFnzi9NlSkSen6qURiGUzUTwwe0DTMg7llSn7DBTWcj6q+pYmZd8ziXpTfwEkc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785095955; c=relaxed/simple;
	bh=GYVxbtF+CoNFFPTdXK7OW7STzaolfwcdNl/fSyU7PlI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a/SYytm3sbWGGlKeuctXcWCPj5EMM3Vm1Jd2MID/MMqGONtGywGXv/ll6ztcfe6I9meH+8+FrdGN3Gut+w0Ve5maTO4BPNBa7aRzFveJAEAz9p77qr+3Nh22iQBwM1qR7y1h65VWkD0G9VoUEFujnz0m1KILUO6gvfIEi+/SagI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GHHYwDaw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GHHYwDaw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12FD21F000E9;
	Sun, 26 Jul 2026 19:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785095954;
	bh=GYVxbtF+CoNFFPTdXK7OW7STzaolfwcdNl/fSyU7PlI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GHHYwDawZ5J3h/yv+16NrM64zMexNvHdrsqfE3P/YsdlbMeurYOq2yJkT0H7UXjN2
	 jyxMIT7uU1SXX5XbXC7zeCv9wB2mdq9AV2NChgArLxSm2LxZzxEYj8+X2Jp6Gvq5vb
	 +RRehV4baJ0YCBwLs6zJ0Dz98Pbr4QJdCvmLbBFqq/0and9LYwEytydtz4zpI6Trj9
	 lUfvoXZOYHKppblKsXvyObv+jomeYI9pLbJZ76IlmWye/IoVR5eJHs2gh80FnMvNpJ
	 T2B0yPqIIUNBn20ZgFQCsVLBM2uQAZ41oZMfcFasdRExo4bZtfj6cq7qdWdnLCLklE
	 w2t0hrV5zzRvA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/8] drm/aspeed: replace struct
 drm_simple_display_pipe with regular atomic helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ze Huang" <ze.huang@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260727-drm-simple-kms-removal-v3-2-cd5dc89858c6@oss.qualcomm.com>
References: <20260727-drm-simple-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com>
 <20260727-drm-simple-kms-removal-v3-2-cd5dc89858c6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Jul 2026 19:59:13 +0000
Message-Id: <20260726195914.12FD21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver fails to trigger a CRTC modeset when the primary plane'=
s framebuffer pixel format changes, causing the hardware to incorrectly int=
erpret pixels.
--

--- Patch [2]: [PATCH v3 2/8] drm/aspeed: replace struct drm_simple_display=
_pipe with regular atomic helpers ---
Note: The format of this report has been altered to use a free-form summary
due to code recitation restrictions. No inline code quoting is used.

commit 82b41ef8182b1e0fe64dd5371b72b906d9c02892
Author: Ze Huang <ze.huang@oss.qualcomm.com>
Subject: drm/aspeed: replace struct drm_simple_display_pipe with regular at=
omic helpers

This commit replaces the simple display pipe with explicit plane, CRTC, and
encoder objects. It moves callbacks to plane and CRTC helpers, wires vblank
handling through drm_crtc_funcs, and uses commit-local state for programmin=
g.

[Severity: High]
This is a pre-existing issue, but does the driver fail to trigger a CRTC
modeset when the primary plane's framebuffer pixel format changes?

Looking at aspeed_gfx_plane_helper_atomic_check() in=20
drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c, there doesn't seem to be a check=
=20
to see if the pixel format has changed between the old and new plane states.

Since the hardware registers for the format (CRT_CTRL1) are only programmed=
=20
during the atomic_enable() path, which requires a full modeset, a format=20
change during a simple plane update will only update the DMA address in=20
aspeed_gfx_plane_helper_atomic_update(). The format configuration in the=20
hardware will remain stale.

Could this lead to corrupted rendering if userspace changes the framebuffer=
=20
format (e.g., from RGB565 to XRGB8888) without changing the display mode?=20
Should aspeed_gfx_plane_helper_atomic_check() explicitly set=20
crtc_state->mode_changed =3D true if the new format differs from the old on=
e=20
to enforce a full modeset?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-drm-simple=
-kms-removal-v3-0-cd5dc89858c6@oss.qualcomm.com?part=3D2
