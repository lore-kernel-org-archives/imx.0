Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793687574;
	b=qCSOcMd82sxu/TzZQn87Li2XF4gSeRIm8VouxxbwDYlMEcvlqHyfEthZaQwJNq/js0lu
	 JbEM4eA7wxpT4ifkvO3hLae0xON7dBl0Sp6tb7SsHhmDGJ0G6ugMpIc0XoWWp9F5D2Sem
	 +IiEoIFTZE5+/olKRwalHipAJr+zGon4ujfHwTNyRSDDgHVyURiankA7Im18uNGs9hGnP
	 wMM7QB3RrtcLjYBvbLszsF9p7dQOBea3ViLQCkq9w/7xu61kSXY7xc0aQ/RCM+gKYahXE
	 MNTxyblmhzGek0z6MfC1ABsObggSTzi37EkeDWUNg51e3rKlCPd2ifNKt6YLOcR0ktQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793687574;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YiVTmPDWNkxPi0DGwzvarOc7hSTcBicLTW8ltICNVIE=;
	b=tyVpr9w+eJ2ASPJ3zy5duRp4en91Q62OVBeXXqx6fokKWq8dznTegbxXLgCceNL0r8TE
	 KgGx8ht1qBrxaC9Tt+I4vaLfM+KKKXfRFiv8S9i8KCUqRqmuFsqbI6Z4acKXOCkwlMDMj
	 CmiBjUYpX9CGNT7J/md329r/bK2DZaLrB+0Z1e50O4kbZ0txUhDxNSQsDPB8QRn8JjkeZ
	 ByH+VNraX6Vum1RA0llP5gd+Hs2tGbaLO0FfwjFTBIA+fIzKsoIY7a1qG8AqhMJTZvY6n
	 Y2Sm0LGXdf17FUxlGZuFbGVyBj/YCwhhJAzP2HziR/2IfjfYSKh2hq1KQOPox6JyaqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YhgCriqA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DEF606A324;
	Tue,  3 Nov 2026 06:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YhgCriqA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C698B1F000C1;
	Tue,  3 Nov 2026 06:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793687574;
	bh=YiVTmPDWNkxPi0DGwzvarOc7hSTcBicLTW8ltICNVIE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YhgCriqAhhl3hxzprWdZiG9gx4WWTKzQq454zFgMjfKYv9FoeVSjgHGW57yKpeY/f
	 bcXbRXpikYJQne7FoyZ5S9tyfYeMD/raqO03yQd0ff0sNQyCBfC+SSg7Mpo1Qh/XCQ
	 U4gDT/h0xug49uN3xfgWcYjTK4MwQCHfsqJSFcKRvqIJXaskmHGRnfEU1j/SlWIgwG
	 T0ShvdJwFkZC7W1tu1ElBSsyYr210VL6dInVEpJwFYXxDQR6l5M1fiISDPOBqVWcx8
	 OGqVY4x8lkYkkpmwzuRWPO4dCJO4OoPUh7b+WtSQ4Zk2hFWOPbSUPZXrR5oXG2WAjP
	 GBbnAttHHrg2w==
Message-ID: <sashiko-outbox-194636@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 06/16] drm/imx: dc: Flag CRTC status in
 GENERALPURPOSE register
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liu Ying" <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261103-imx8-dc-prefetch-v9-6-3b985e7636e2@nxp.com>
References: <20261103-imx8-dc-prefetch-v9-0-3b985e7636e2@nxp.com>
 <20261103-imx8-dc-prefetch-v9-6-3b985e7636e2@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 06:32:53 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] drm/imx: dc: commit message mismatch for dc_drv_set_crtc_{enable,di=
sable}()
--

commit 1bad6b1819c8236cf47f95cfccc89fe8559ef3c8
Author: Liu Ying <victor.liu@nxp.com>

drm/imx: dc: Flag CRTC status in GENERALPURPOSE register

This commit maps the Display Controller's GENERALPURPOSE register via an
MMIO regmap and adds helpers to set, clear, and query the CRTC enablement
status bits.

>     drm/imx: dc: Flag CRTC status in GENERALPURPOSE register
>    =20
>     Map Display Controller's register GENERALPURPOSE at offset 0x100 and
>     create an MMIO regmap to access the register.  Create helpers
>     dc_drv_flag_crtc_{enable,disable}() with the 2 LSB bits in the regist=
er
>     to flag the CRTC enablement/disablement status.  Also, create a helper
>     dc_drv_crtc_is_enabled() so that the CRTC driver can use it to check
>     if the CRTC is enabled by a previous boot or not.  This is a preparat=
ion
>     for an upcoming patch to disable display controller at boot if the CR=
TC
>     was enabled by the driver during a previous boot instead of a bootloa=
der.
>    =20
>     Reviewed-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
>     Signed-off-by: Liu Ying <victor.liu@nxp.com>

[Severity: Low]
As reported by Sashiko on v8 [1], the commit message states that helpers
dc_drv_flag_crtc_{enable,disable}() are created, whereas
drivers/gpu/drm/imx/dc/dc-drv.c and drivers/gpu/drm/imx/dc/dc-drv.h define
and declare dc_drv_set_crtc_enable() and dc_drv_set_crtc_disable(). Should
the commit message be updated to reference
dc_drv_set_crtc_{enable,disable}()?

[1] https://lore.kernel.org/r/sashiko-outbox-190808@kernel.org

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103-imx8-dc-pr=
efetch-v9-0-3b985e7636e2@nxp.com?part=3D6
