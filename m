Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5C931353E
	for <imx@lists.linux.dev>; Mon, 22 Dec 2025 10:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766399912; cv=none; b=VYqre7VX1qJmzZrT03hWvVbFIC2iUF9Dc6Q14MqkoTQYKRyW9cc5hoo/DuepPa1jjTiD23pmyNqjD/rUdBAsUIRv+KwL7CB1jGfGW0X85E9/HDCL/wN2HT/Gt6h/0aELdg4cTasgVHax1i4DPLtxmNtk1BzP+iXYa+znSJMXklg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766399912; c=relaxed/simple;
	bh=RtYAJjQTwxOFdnR190NRlUogWwYsXWlIsU8SdM1astc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MPrephIGt0rtLtD0rd7MJ12lblnebVsYaSwG4+8sp2/YsPbfGsYCp9gvTNbPwgmFl2tSTFlrqEpQElyJ+agqnmZ8vsLGQlyFlH0AeGzx6HiNWoWCnYxAf3bZyf6+Y9w8sQcNC1gG4SBXI9VGnrtIucSDDT/x0suxdd6KYiJTCrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=MeW/xOtp; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="MeW/xOtp"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2a2ea96930cso42047365ad.2
        for <imx@lists.linux.dev>; Mon, 22 Dec 2025 02:38:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1766399910; x=1767004710; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RtYAJjQTwxOFdnR190NRlUogWwYsXWlIsU8SdM1astc=;
        b=MeW/xOtp6VMnCv26aI7W098S1utrrDxBuHPRzefLx4/SKL50Iw19DvVFsNUWsZhcUX
         HEzfjnsnihOw0cThrYxkny3zdm5VYSGS2QnrhyDPwnbPPc9l0XH3Dh731MG8pdtZBs6u
         +E9jGgEWjRFh2lQqr6DbSLr990plizbQj6Ah+5yeJ4lb17hGzdE/bW6Imq0BX7GVx/RI
         f0y3ZNtMzxWORj4ebiLTGDi0i99S7PdBVSI7cP2SaJPmJ0RxxOwWgTh+junmpR8YXXXV
         CtRu3kLmoBuBpCP5+HHwehRreWg+qyVHvRHVbdUtYLr75SjJMTJfk5eb0EJWHXPve41N
         cVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766399910; x=1767004710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RtYAJjQTwxOFdnR190NRlUogWwYsXWlIsU8SdM1astc=;
        b=bfGmiVvZU+tu8uaqlZ3ByYPLe4nYV1fMAG4VbXyvpK6B6ANbSijRN4g+ae7/k91e88
         pZDDj7m56O90sWgFG2Q8RNOyf60TKZ4EOOlL9P+HO335hCCt3xGYHG2jtBsjCuxqI/wF
         fG6dGas8LXCxbN65b5h9x/dYO80C4q+GxFXKBDJO/Q51uvP7rog8Fl+veQ96mSVhgUoY
         v8vrvFkZg5VXx2Off+8YCnxl38FLtLRj8U4Sx+xHW6RPXC5v6gVxjtOy4gxTgDaxgX1m
         yNWmVulNdG/RkNzZrWzm4fVUGYaeLTS9cxlxQlQKETPBJhILt4tGCtVbCXL8cRTyY3JH
         2flA==
X-Forwarded-Encrypted: i=1; AJvYcCWQFWNJagi/dqRFS5VleGYUuTXueAFUVUHxwo2msNHEfekJ4eo9+9MNbjqtXdMeZI70PWA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyLt4RJTIUS9p/b9WpA50ZJn1vlaOLsRz12NRkRUm0oQrZ+6KYp
	rGDhWdTKnVGlWWeUL+oax2gb+jXvOyF2nBzt0sTTlq2M4xEHFSRQSubOQFD2C6dOJjHZ1h0/OX0
	RK7F7cbJwcnZ84r/bqM4lO1Lfqh/Elwc=
X-Gm-Gg: AY/fxX6RtLb3DipHgx1TYxpzgIu2nQmlBWdddOSzVn7QqwncHuwhhECquO01yjNVycV
	Tt3socA9rGIyDkVpwMrabwNSWjRoDWUnCEmqki1DtZItUkTCecU2pbTTMUXbocg2XDoUdfa9k0H
	gFSetqJKDelBd6oFjlmEoVY2iGjQwowNe5aM+HnQTl2zyZ0grKUmz8xPzmUzC1XxLOzbWwJZb1S
	zwfRuwVVVT83QqGQvcPMzXaBSKU8kF1p+OxjQK2y0fIAvIgmmtUwLbIiHNFZ1KiEXm/kxbRlw8+
	mwUGSSqLZLoD4TXAMJNQUfY5ndzN
X-Google-Smtp-Source: AGHT+IEO/ZgFQp5AyfAAtwrHxXoiHa/X/03D0WDYxc4kBLqyULymzY/eR1r0RM8KzOikMvm9YYXtJ3AkgKqBI277jTk=
X-Received: by 2002:a17:902:f552:b0:297:c71d:851c with SMTP id
 d9443c01a7336-2a2f2736bc0mr91265875ad.36.1766399910127; Mon, 22 Dec 2025
 02:38:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
 <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-12-b5165fab8058@bootlin.com>
 <CAFBinCCUVOYsiwwVmyGtxN=MdqYatAaj-piVO9_E_iZX9gwiMQ@mail.gmail.com> <DF4KIOREQYK3.2JEGF51OECQCE@bootlin.com>
In-Reply-To: <DF4KIOREQYK3.2JEGF51OECQCE@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 22 Dec 2025 11:38:19 +0100
X-Gm-Features: AQt7F2oefOvD1VauOsJ6RYNy_cI4jR0Cqg9gQFauSbHiZ7j1ecdJHG9Us9r2rRA
Message-ID: <CAFBinCBX+DA71OA79SqrE20Nd=QUrU86SmYGXu0dAYG-R5nZ4Q@mail.gmail.com>
Subject: Re: [PATCH v3 12/22] drm/meson: encoder_hdmi: get/put the next bridge
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, Phong LE <ple@baylibre.com>, 
	Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Luca,

On Mon, Dec 22, 2025 at 8:31=E2=80=AFAM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> Hello Martin,
>
> On Sun Dec 21, 2025 at 10:51 PM CET, Martin Blumenstingl wrote:
> > On Tue, Dec 16, 2025 at 7:00=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bo=
otlin.com> wrote:
> >>
> >> This driver obtains a bridge pointer from of_drm_find_bridge() in the =
probe
> >> function and stores it until driver removal. of_drm_find_bridge() is
> >> deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
> >> refcounted and use bridge->next_bridge to put the reference on
> >> deallocation.
> >>
> >> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > And additionally I runtime tested this on meson-gxl-s905x-libretech-cc
> > where I still have HDMI output, so:
> > Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>
> Thank you for the quick testing!
Thank you for doing the hard work ;-)

> I think I can append '# meson-gxl-s905x-libretech-cc' to your 'Tested-by:=
'
> line when I'll apply the patch, to make it more informative.
Sure, please go ahead with that!


Best regards,
Martin
