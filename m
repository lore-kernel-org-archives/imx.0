Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A697C3815E3;
	Sun, 12 Jul 2026 12:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783858041; cv=none; b=AADFWL8FKtuO+DBAycyHsTfUrHRgjTLhn87Qlb7KDQktw0+1UqXPk7SATXYMFvCUU28g/ddecRQMEqiCkwxw589p0NmJlvvDtQTs2nLswC6aJTWczceqCN4SmB1x4cFk1P2skmyiTfwYMGZ0UWyCI7wuqbP4Q65Q2kAihXNUSLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783858041; c=relaxed/simple;
	bh=ZvBRhigkoWz67o5JGAoPYFzt13uqcPxAK66wE0Lc6xM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=J5+69TwITu0TT2roSOfv5vVM/Qr8ZcjmgqSDoL13HEo0iXndOrVdwVdgK9vPm/vA6gPbulHLcZ/5X6DkZNvVvhxO452W3Kn9OXevyRfpSfjSzvxX4QH4esi0FOzN7UvGMuQCMgBKeofQZGyoFs6Gz59cxGBxj25hR/iAwCRGGfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n++QStdL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n++QStdL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E512A1F000E9;
	Sun, 12 Jul 2026 12:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783858040;
	bh=95Cy4FfwSIBLQnILoq3IY+3n8//x8s6ByOsR4JuKkd8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=n++QStdL9W6sMeZ9ai2iMNupgWWCYs/6tEPoSjYzyvj1GJysgBau3aVWjA0z1D9kz
	 DpIY591yBLUOftP636aLv+JR+zrzhwDMUA9J8EugRiQRYbA8DMfCQ1+XFHzfWn7ljp
	 XYsqWihPjrLTqFMoCDdxaPwbuqf6Ru00FtfBP9Kyovng4N8B8ZN+xB/WlS8PFrIucM
	 B06KHDFMCiQ9y0mEJkwLvnASVTB28+KoHXEQ1j4K9rMDrrtxegF2x6zK3OrQrKZoj6
	 d3tifKnSmwePWv7S/n+kA8CP63bl/fZcNarHMtI8aOwBMumi7qZkCZp8Kky2hk15fG
	 kceFXbN4alTVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/5] media: hi846: Fix modes handling for different
 lane cases
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengyu Luo" <mitltlatltl@gmail.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260712115012.91600-4-mitltlatltl@gmail.com>
References: <20260712115012.91600-1-mitltlatltl@gmail.com>
 <20260712115012.91600-4-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 12:07:19 +0000
Message-Id: <20260712120719.E512A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] `hi846_check_link_freqs()` iterates over all modes without filteri=
ng them by the active MIPI lanes, demanding bogus link frequencies for unsu=
pported configurations.

Pre-existing issues:
- [High] The sensor's default active mode is unconditionally initialized to=
 an unsupported mode for 4-lane MIPI configurations during probe.
--

--- Patch [3]: [PATCH v5 3/5] media: hi846: Fix modes handling for differen=
t lane cases ---
commit 110c167f519b3b39914f2d9ef7ed2f39cf8cf0d1
Author: Pengyu Luo <mitltlatltl@gmail.com>

media: hi846: Fix modes handling for different lane cases

This patch fixes an issue where v4l2_find_nearest_size() could return
an unsupported 640x480 mode on 4-lane configurations. It introduces
filter_by_mipi_lanes() to filter modes based on MIPI lanes when finding
the nearest size and enumerating frame sizes.

Link: https://lore.kernel.org/linux-media/OmTXoHZJTSGePymL9I-1Cw@puri.sm

> diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
> index 6bcd862aee301..df7ea3ecf0d82 100644
> --- a/drivers/media/i2c/hi846.c
> +++ b/drivers/media/i2c/hi846.c
> @@ -1688,6 +1688,16 @@ static int __maybe_unused hi846_resume(struct devi=
ce *dev)
>  	return hi846_power_on(hi846);
>  }
> =20
> +static bool filter_by_mipi_lanes(const void *array, size_t index,
> +				 const void *context)
> +{
> +	const struct hi846_mode *mode =3D array;
> +	const struct hi846 *hi846 =3D context;
> +
> +	return (hi846->nr_lanes =3D=3D 2 && mode->reg_list_2lane.num_of_regs) ||
> +	       (hi846->nr_lanes =3D=3D 4 && mode->reg_list_4lane.num_of_regs);
> +}
> +

[Severity: High]
Since we are filtering unsupported modes by lanes here, do we also need to
apply this filter in hi846_check_link_freqs()?

Currently, hi846_check_link_freqs() iterates over all modes without filteri=
ng
by active MIPI lanes:

drivers/media/i2c/hi846.c:hi846_check_link_freqs() {
    ...
	for (i =3D 0; i < freqs_count; i++) {
		link_freq =3D hi846_get_link_freq(hi846, &supported_modes[i]);
		for (j =3D 0; j < ep->nr_of_link_frequencies; j++)
    ...
}

This demands link frequencies for unsupported configurations. For a 4-lane
setup, it will calculate a link frequency for the unsupported 640x480 mode.
If this frequency is correctly omitted from the device tree's
link-frequencies property, the probe will fail with -EINVAL, making the
driver unusable on 4-lane hardware.

[Severity: High]
This is a pre-existing issue, but the default mode initialized in
hi846_probe() might be unsupported on 4-lane configurations:

drivers/media/i2c/hi846.c:hi846_probe() {
    ...
	hi846->cur_mode =3D &supported_modes[0];
    ...
}

The first mode in supported_modes is the 640x480 mode, which has
reg_list_4lane.num_of_regs =3D 0. When userspace starts streaming without
explicitly changing the format, hi846_start_streaming() will execute zero
MIPI configuration register writes for 4-lane setups:

drivers/media/i2c/hi846.c:hi846_start_streaming() {
    ...
	else
		ret =3D hi846_write_reg_list(hi846,
					   &hi846->cur_mode->reg_list_4lane);
    ...
}

This leaves the sensor in a non-functional state. Should the probe function
initialize cur_mode to a supported mode using the new filtering logic?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260712115012.9160=
0-1-mitltlatltl@gmail.com?part=3D3
