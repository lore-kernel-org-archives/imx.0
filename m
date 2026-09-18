Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DF154705D;
	Fri, 18 Sep 2026 10:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726752; cv=none; b=mTkpKrk1zn+uU7zGmYqlOXaB/RqbxRSNUh33rzBTZtI9Le3BmY5f/3myALk6zXa99S/rWHyVZdsjLsYnTYrwzlvHb3psdEY91Rxt5qNqepyslTg/rrCixz7iq08e5JZlc78DRj0gFzpJtbeoDCyr2AFx0MMzM4VIJNRR3DW1zuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726752; c=relaxed/simple;
	bh=ReI/5bdtZ2277fpeNjtnStQnH+LxBZibQL7zdu5ONHA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QGJvH9mGqbHqEuN9N8BPlASfiXb3/s+jjZEX15TbBErgmIAfoW6LNze0qBSzhh5IO5///QQl1sAMybSocVtGR/REFtwrIiA4LZnPR1JbEtxnuIcke4tVSuscJwK5CleWTXsDe8HBpw3Owf+wCRCN2Ijhu6c4ZD/WOocJ4a5dFz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FIvCn62/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FIvCn62/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B5E71F00893;
	Fri, 18 Sep 2026 10:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789726743;
	bh=eLu0OL+aI6fE/xNf2p/advQtFn+ljCa4K7T0GFa9Qnk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FIvCn62/tvtpf8fREbg82nY3eokAudGYvNGOwIv18Hx9yQzZXwkflqG2mdPi2J5Y1
	 dJSvWSmC5VssJWsCVKHBxIWbdwLn/h9K9J7uYjsH8RL5zQHU4EqNLwC02j6DmSG6Rq
	 RlEJvWETsC3XZi0768E7fhK1A2Z2mAFt/tKCSRtaSGLigw0HY6vSvFw2s7JLjve/vf
	 2Due+4cn+bGtdhWU6hWRQ3NrKoduw4/eM7572eLbFhez3XMAxFVC/RJfACHtY+BUXf
	 IXNuil0tVXNkEzHq0BHns/8XhzK+Y4/OpAHDH2LHL5Ab+PFgiUH1ADvpPJNPz83xot
	 Q9+0/AAf3AzOA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 6/6] dt-bindings: media: i2c: himax,hm1246: Use
 video-interface-devices
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kieran Bingham" <kieran.bingham@ideasonboard.com>
Cc: wsa+renesas@sang-engineering.com, devicetree@vger.kernel.org, media-ci@linuxtv.org, imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260918-kbingham-orientation-v5-6-e1a134326988@ideasonboard.com>
References: <20260918-kbingham-orientation-v5-0-e1a134326988@ideasonboard.com>
 <20260918-kbingham-orientation-v5-6-e1a134326988@ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 10:19:02 +0000
Message-Id: <20260918101903.7B5E71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: incorrect macro substitution for orientation
--

commit 009f981811cc18f443edfd8ba45e1a412697cced
Author: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

dt-bindings: media: i2c: himax,hm1246: Use video-interface-devices

This commit updates the himax,hm1246 device tree binding example to use
the new video-interface-devices definitions for the orientation property,
replacing the previous hardcoded integer values.

> diff --git a/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yam=
l b/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml
> index a65488fcc643f..ca5817684e1e2 100644
> --- a/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml
[ ... ]
> @@ -103,7 +104,7 @@ examples:
>              iovdd-supply =3D <&hm1246_iovdd>;
>              dvdd-supply =3D <&hm1246_dvdd>;
> =20
> -            orientation =3D <2>;
> +            orientation =3D <MEDIA_ORIENTATION_FRONT>;

[Severity: Low]
Does this mistakenly change the orientation value in the example?

In dt-bindings/media/video-interface-devices.h, MEDIA_ORIENTATION_FRONT=20
is defined as 0, while MEDIA_ORIENTATION_EXTERNAL is defined as 2.

Replacing <2> with <MEDIA_ORIENTATION_FRONT> alters the actual value from
External (2) to Front (0) in the device tree example. Should this use=20
<MEDIA_ORIENTATION_EXTERNAL> instead to maintain a direct macro replacement?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918-kbingham-o=
rientation-v5-0-e1a134326988@ideasonboard.com?part=3D6
