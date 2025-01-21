Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2BC1EF090
	for <imx@lists.linux.dev>; Tue, 21 Jan 2025 10:44:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737456282; cv=none; b=Mvj1f15p/kkmkvsYOYV3AtfhzAkFOc5Xbg+ctNpIRIbQjN0T6Bsu+WzgmayZzX6FH9oVFdXy3VcsSpS2iWAX2wt1W+lqkbmQrWzm54kQVUCtw95wm7rgjLsXgJB8lXvEuoGti0N6kNcR5jdH8YNMmU/8qCd57n0biifc96SfyUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737456282; c=relaxed/simple;
	bh=iwqLBI6x6ziAFcEg9T4VUa24HE5Sj5tajYDP14hy/pY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OFgTR9Et2UEG94P+GeiHJ6VtaC+zUBohIY3aMw63AokiFtYLLt001QoR6EPB5RV5UciJCgMG+hdiDbAens/pcPvVxXnnVCG4kNAdFVNc+q3mzEys7mv1u7NNd4z/sfTsbx+6DdKO4/utTPJvun9g+Bj/RYTBDcKiHabwjo+JR4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aCkvU2Aj; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aCkvU2Aj"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e39f43344c5so7725380276.1
        for <imx@lists.linux.dev>; Tue, 21 Jan 2025 02:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737456279; x=1738061079; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fM4RiAz8x0xBzhbf4AlSqIUYbrQ3SaJ7YEvWtIB73WA=;
        b=aCkvU2AjdHGN1HENwcBPGwQDDWZhuhg64PEP2+g39jBaTRx5DZg6AZLAHIz5xm7uij
         XiD60pjHs+6ZBXMwV4228VnuC6EL32gvMOctmFDb6AoZLafvpyYdCnMgJyOU7bkUiNxS
         3z/iULpLh3PtkUtaVk1bqEGJDNgqxfhBxNriVV1vB2feGjMY16nL3Rc0QYML8w8jwOby
         HXwE60LdXjH4se54xQCoHtOBjadSS0wE0HmquMhYfOs52bpoqelQfnlC1y8C7oeRWxtr
         T3KHCI9JUXxoAn+36iAp5zCCANoad5lwMmqoKtTecAHr46k5QVGUM1D7Z0X6fwLdK7du
         d3Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737456279; x=1738061079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fM4RiAz8x0xBzhbf4AlSqIUYbrQ3SaJ7YEvWtIB73WA=;
        b=PpIprVK+W7UmLF8X76eOAomKi7jsJqf7M9+DY6euVX3gmF3tmJIh+ZXYEUzS9ZOIQq
         22VEhbuaU9biXVUbCqaRg1vuQJf63YZfQ68rSV/usFaP5dAJpoE4bWOxqPRqZzHh0X3F
         rOpfn/cWapcKxSiOscMrt3WvmxJbDpTV4PjK89AgHpHvaPTmV9hepQj+7jwhYeW0e558
         g1z1YhHv2KG+scg4SxCBjIULKackEbToHj1qYW92c9megXNyEQsnGGsQ5DVTRDLotQ9F
         lcQRaoUaqup+x1U3OmABSplDzmPySL58gtb/4c/EUaSIRdIUX2WPcHQDJg/h55zrDLD4
         J9gQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDt+ASTzC2zUv+durqU/aZt+k93kizSnYo170XqjiQ5GvETqQbNOovBP1rPF7aVyHguFg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxDb6LK0+okkutxGvL7442cS1Z3HGzNhxpyoYLW8yW9IFDAPhxO
	Tswapa7GpeRky9pR9Zf4Pib/4jZJjyqTb5RYrD1dW3jA3+F5YEyWzvy5sWF+VawQWMBwlpVIO/5
	LJz2eyGRi4iHcsqdDitzcwOBO9pQwaT0dEGISiA==
X-Gm-Gg: ASbGncspHE3S9Vzh/GObE+/FWkHlhLUT8uwdAj8fTZHKwMH9rzW8KWSEHt9yMaTp6Uh
	Dw/Q3n/jVqs7T2i6ZM6XySI5m41b9P5dGPw/32B3TKXQ+x7EKVWHRv1BNxrg1SD1sIQ==
X-Google-Smtp-Source: AGHT+IHO0V0jurSGd/L1Ymx0QNx/m/A6wTdCul+m+iz6FYx+lOCJoAuF4E4jOdjfH48/SXNUBM+6kJMlTjWcDWiw9yM=
X-Received: by 2002:a05:690c:3701:b0:6f6:d4bf:d01a with SMTP id
 00721157ae682-6f6eb940fb8mr129606697b3.34.1737456278815; Tue, 21 Jan 2025
 02:44:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241214-drm-connector-mode-valid-const-v2-0-4f9498a4c822@linaro.org>
 <173624946815.1500596.321177900833598022.b4-ty@linaro.org> <CAMuHMdVwcaY2Fgpf7GYhBrE5B+AEg=v0BH4OjMXgnp=wqjxmKg@mail.gmail.com>
In-Reply-To: <CAMuHMdVwcaY2Fgpf7GYhBrE5B+AEg=v0BH4OjMXgnp=wqjxmKg@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 Jan 2025 12:44:27 +0200
X-Gm-Features: AbW1kvabZ-in97OiEwfu0vjcyzelZUBMNUaWG-jd-XhigpbETlYrZDr4y_chW2I
Message-ID: <CAA8EJpos0HQpr9P4XRkto0Jy+Anf1xEH2xhEU8wtCyUQd+XwMg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] drm/connector: make mode_valid() callback accept
 const mode pointer
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
	Danilo Krummrich <dakr@redhat.com>, Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Xinhui Pan <Xinhui.Pan@amd.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Peter Senna Tschudin <peter.senna@gmail.com>, Ian Ray <ian.ray@ge.com>, 
	Martyn Welch <martyn.welch@collabora.co.uk>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Gurchetan Singh <gurchetansingh@chromium.org>, 
	Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Jani Nikula <jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 21 Jan 2025 at 11:13, Geert Uytterhoeven <geert@linux-m68k.org> wro=
te:
>
> Hi Dmitry,
>
> On Tue, Jan 7, 2025 at 12:31=E2=80=AFPM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> > On Sat, 14 Dec 2024 15:37:04 +0200, Dmitry Baryshkov wrote:
> > > While working on the generic mode_valid() implementation for the HDMI
> > > Connector framework I noticed that unlike other DRM objects
> > > drm_connector accepts non-const pointer to struct drm_display_mode,
> > > while obviously mode_valid() isn't expected to modify the argument.
> > >
> > > Mass-change the DRM framework code to pass const argument to that
> > > callback.
> > >
> > > [...]
> >
> > Applied to drm-misc-next, thanks!
> >
> > [1/5] drm/encoder_slave: make mode_valid accept const struct drm_displa=
y_mode
> >       commit: 7a5cd45fab0a2671aa4ea6d8fb80cea268387176
> > [2/5] drm/amdgpu: don't change mode in amdgpu_dm_connector_mode_valid()
> >       commit: b255ce4388e09f14311e7912d0ccd45a14a08d66
> > [3/5] drm/sti: hda: pass const struct drm_display_mode* to hda_get_mode=
_idx()
> >       commit: 5f011b442006ccb29044263df10843de80fc0b14
> > [4/5] drm/connector: make mode_valid_ctx take a const struct drm_displa=
y_mode
> >       commit: 66df9debcb29d14802912ed79a9cf9ba721b51a4
> > [5/5] drm/connector: make mode_valid take a const struct drm_display_mo=
de
> >       commit: 26d6fd81916e62d2b0568d9756e5f9c33f0f9b7a
>
> I cannot find these in drm-misc or drm-next, but they are in drm-tip?

These are in drm-misc/drm-misc-next, the commit IDs are a part of the
Git history.

> The last one due to commit 2bdc721917cf141f ("Merge remote-tracking
> branch 'drm-misc/drm-misc-next' into drm-tip").
>
> What am I missing?
> Thanks!

It might be some kind of misinteraction between drm-misc-next vs
drm-misc-next-fixes vs merge window. Let me recheck dim rebuild-tip.

>
> P.S. Sima: noticed while resolving a merge conflict using drm-tip. Thx!


--=20
With best wishes
Dmitry
