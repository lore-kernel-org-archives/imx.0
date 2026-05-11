Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395F127E1A1
	for <imx@lists.linux.dev>; Mon, 11 May 2026 22:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778537051; cv=none; b=SJHZbz5STAeGuTw6Rp5kf/s+Y/gVp+6msCLUuhpmfAS7OIT1gCJsags0IGjpDm3/3sRUx6YAunRE1c3IZDZgj/P9Wqp0dQhvAANlba8/MbFKBWNhf70EWyvn7cokoK7DcuXoa3gg1BJY5qVMyf2T3QIytN0Q93P8g8E+DixeXqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778537051; c=relaxed/simple;
	bh=fPSj+AcGqftVQcZ+qB2ss2kfQAUzD5HLOETv8aYJd+A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C7Dejq3gOCkjHkV6p4W0WxSACXM4h7tqt+CLd0p+Jtc2okMg5yX5DzT5RjAa+sUDchkCE+lNkCYCQaNqJbjrRTaMRlQRueycievEV+vgREz1/bZsTrY7ua0Cix3XpLxnN0PMKoiixEF+SLHkCf3dMflf5RVDAyoaxNIXQ2WUxTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QyXV2Jh8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QyXV2Jh8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B53F8C2BCB0;
	Mon, 11 May 2026 22:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778537050;
	bh=fPSj+AcGqftVQcZ+qB2ss2kfQAUzD5HLOETv8aYJd+A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=QyXV2Jh8uAM7KsQGpovxAtTYlMhoSFYI2RCwEX3PONtBx3dRoEOsQSB1Vpvzkk7mr
	 zjhVRXQaLIYvgczrfjzyk3dzgdw/YG2BXHDJxFXpsb72buSAoG+xHZYkmP4eSEzmuE
	 +KyofHOb0NJ8hRsSI0nnUZtZ64kzS+UKkcaTVgHszYX8PgTQP2HUJ6IJEu/eZQxxNP
	 rMUJjxyKIVsZ1P5zpCEOvOYrZxuc24OQQl1qqfs/qYMzHibyIxNjdtCXMDZTffwImh
	 zZp8P8N2tOnOt/fqWA8uERCGNL/ysgjwcle9EA+bXsn6MhP05wv/qes2X+Agc2mfrO
	 c5EKz4sG57QbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 03/21] drm: bridge: dw_hdmi: Call poweron/poweroff
 from atomic enable/disable
Reply-To: sashiko@lists.linux.dev
To: "Jonas Karlman" <jonas@kwiboo.se>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260510124111.1226584-4-jonas@kwiboo.se>
References: <20260510124111.1226584-4-jonas@kwiboo.se>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 22:04:10 +0000
Message-Id: <20260511220410.B53F8C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit message incorrectly assumes that the `drm mode_config=
 mutex` is always held during `atomic_enable` and `atomic_disable`.
--

commit dbe86704cd583592fb999cc80ea4e4d22f4f6084
Author: Jonas Karlman <jonas@kwiboo.se>

drm: bridge: dw_hdmi: Call poweron/poweroff from atomic enable/disable

This commit moves the poweron and poweroff calls directly into the
atomic_enable and atomic_disable bridge callbacks. It removes the
bridge_is_on state tracking previously handled in hotplug IRQ paths.

> A benefit of this is that drm mode_config mutex is always held at
> poweron/off, something that may reduce the need for the dw-hdmi mutex.

Is the statement about the mode_config mutex being held accurate here?

In the DRM atomic framework, bridge atomic_enable and atomic_disable
callbacks are executed from commit_tail. For non-blocking atomic commits,
commit_tail runs asynchronously in a workqueue after the IOCTL handler has
already dropped all modeset locks, including the mode_config mutex.

Because of this, no global DRM modeset locks are guaranteed to be held
during these sequences.=20

While this patch appears safe since it still explicitly acquires hdmi->mutex
in both callbacks, could relying on the mode_config mutex in future changes
introduce data races when interacting with concurrent IRQ handlers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510124111.1226=
584-1-jonas@kwiboo.se?part=3D3
