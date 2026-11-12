Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794448414;
	b=CMsgyE5kZJi5uMuRz05PlSJScjtYgaN7vv3/WdCOwjXiHaJHteDyYi7VgQ+OQjqS35Bc
	 dG/YS3B3AvQkSKlLaR2rWjYmsynbXM/Vf6fVLwVeByU2BjifdxTfMPqV3I6QWtJVw5M/i
	 JDiCjnbm3ik1w9w6mOk33IoNfQDpLxN/Z0JFhulK5IRXKuTk8G7nskSdJ3kQNDvTdPpl9
	 RfOHa8UFDQYolkPA1ogsMU3Wv8CiCPoFli9t2mmjGgqrFRUdIaUQDFZeku4ScHdZKvGuh
	 XDskjjyUuCKBl99+SkJEDMtNpdr6BK+e44Ywk18F7YbHIaaJKkGeaOGsvNY7JaraZ9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794448414;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nfJDoQfj0ep2HSUkwX5ImipaETY4+KdyHEabS95N1+Q=;
	b=BCpAiPZHooKpZSumHfbJAPA/uArUV/jhTvT/GRNQslPQtLroLj80fhgfB6HAo4j3SgxC
	 oOveuMqrbJji2i0eZqirM522DO33nXTV2pD1vFiK+I5BCJlcOmO3Uml4IKkWsUVrEMa9P
	 zMcbB55kUT/4lmxgC8mXfxxkDgiiRRlF5Gys4vpbXvc/xGrWCHzfMAN0Q+RW+tbH84mZi
	 7glwSTa2FQ+8hfD03ZgQdyqQqqD6xJg97temAEbzl5nLs8ypyk94r58TOWf1S5yP/H0+o
	 S17KYCaNo1YtdJKFgmR5BIDFMvzkcK7MDS7LLW8Io3mC4K9SLVbKzD6wxOfXj1/ldOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oKhfNleW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF4F606A31C;
	Thu, 12 Nov 2026 01:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oKhfNleW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53BD41F00A05;
	Thu, 12 Nov 2026 01:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794448413;
	bh=nfJDoQfj0ep2HSUkwX5ImipaETY4+KdyHEabS95N1+Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oKhfNleWieu8EicN/GcFTDyypMNIBZW0zKD6T2D4EShbljxrTUDWZx6IQFJlZQl1g
	 p0yKW9NH0iW5mSAzGUnNZyDkunubWrZA9DBrY4KvfhrKJrzxgNs8b2+MKs2RSWvchK
	 Hz3ha9XDsCH3gttQtl6FzTpm3mPtu9p550QY0aGWg8y+tVUmfvEFNQ3eXzhkh/jscx
	 KjZQW32ZB0x3DtJsXAI3/O7KGHrZGjolJ0U13N640+ZCX1EdriRrkF/BatmGsMK9NB
	 4Hs52QksC+4MOd2GJudrPogxjpd9KQ+rPgKXiNgKwmVqHavoPVBZi5DxYVISmhu9bv
	 p8uqqKkd9jkQg==
Message-ID: <sashiko-outbox-210111@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] media: i2c: Add Samsung S5K3L6 image sensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Cloutier" <vincent.cloutier@icloud.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261112004636.739749-3-vincent.cloutier@icloud.com>
References: <20261112004636.739749-1-vincent.cloutier@icloud.com>
 <20261112004636.739749-3-vincent.cloutier@icloud.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 01:53:32 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] media: i2c: s5k3l6: unlocked mode read in
  s5k3l6_get_mbus_config()
- [Low] media: i2c: s5k3l6: wrap dev_pm_ops pointer with pm_ptr()
--

commit e21dc2bfba16578c02da687c308377fcc959fee4
Author: Vincent Cloutier <vincent@cloutier.co>

media: i2c: Add Samsung S5K3L6 image sensor driver

Add a V4L2 sub-device driver for the Samsung S5K3L6 raw Bayer image sensor,
supporting RAW8 and RAW10 modes over two MIPI CSI-2 data lanes.

Link: https://source.puri.sm/Librem5/linux/-/blob/ad184fca880e02e7b6973f117=
b60dddfa163ad/drivers/media/i2c/s5k3l6xx.c
Link: https://source.puri.sm/Librem5/linux/-/commit/9fa726ea0a12a1fb72e3b6e=
0ab09aadff8708078

> diff --git a/drivers/media/i2c/s5k3l6.c b/drivers/media/i2c/s5k3l6.c
> new file mode 100644
> index 0000000000000..dcd7c3620136c
> --- /dev/null
> +++ b/drivers/media/i2c/s5k3l6.c

[ ... ]

> +static int s5k3l6_update_controls(struct s5k3l6 *s5k3l6,
> +				  const struct s5k3l6_mode *mode)
> +{
> +	const struct s5k3l6_mode *old_mode =3D s5k3l6->mode;
> +	struct s5k3l6_ctrl_state old_ctrls[4];
> +	u32 hblank =3D mode->hts - mode->width;
> +	u32 vblank =3D mode->vts - mode->height;
> +	u32 exposure_max =3D mode->vts - S5K3L6_EXPOSURE_MARGIN;
> +	u32 exposure_default =3D min_t(u32, 0x03de, exposure_max);
> +	unsigned int i;
> +	int restore_ret;
> +	int ret;
> +
> +	s5k3l6_save_ctrl(&old_ctrls[0], s5k3l6->link_freq);
> +	s5k3l6_save_ctrl(&old_ctrls[1], s5k3l6->hblank);
> +	s5k3l6_save_ctrl(&old_ctrls[2], s5k3l6->vblank);
> +	s5k3l6_save_ctrl(&old_ctrls[3], s5k3l6->exposure);
> +	s5k3l6->mode =3D mode;
> +
> +	ret =3D __v4l2_ctrl_s_ctrl(s5k3l6->link_freq, mode->link_freq_index);
> +	if (ret)
> +		goto restore_ctrls;
> +
> +	ret =3D __v4l2_ctrl_modify_range(s5k3l6->hblank, hblank, hblank, 1,
> +				       hblank);
> +	if (ret)
> +		goto restore_ctrls;
> +
> +	ret =3D __v4l2_ctrl_modify_range(s5k3l6->vblank, vblank,
> +				       0xffff - mode->height, 1, vblank);
> +	if (ret)
> +		goto restore_ctrls;
> +
> +	ret =3D __v4l2_ctrl_s_ctrl(s5k3l6->vblank, vblank);
> +	if (ret)
> +		goto restore_ctrls;
> +
> +	ret =3D __v4l2_ctrl_modify_range(s5k3l6->exposure, S5K3L6_EXPOSURE_MIN,
> +				       exposure_max, 1, exposure_default);
> +	if (ret)
> +		goto restore_ctrls;
> +
> +	ret =3D __v4l2_ctrl_s_ctrl(s5k3l6->exposure, exposure_default);
> +	if (!ret)
> +		return 0;
> +
> +restore_ctrls:
> +	/* A failed mode change may have partially updated the idle sensor. */
> +	gpiod_set_value_cansleep(s5k3l6->reset_gpio, 1);
> +	s5k3l6->needs_reset =3D true;
> +	s5k3l6->mode =3D old_mode;

[ ... ]

> +static int s5k3l6_get_mbus_config(struct v4l2_subdev *sd, unsigned int p=
ad,
> +				  struct v4l2_mbus_config *config)
> +{
> +	struct s5k3l6 *s5k3l6 =3D to_s5k3l6(sd);
> +	const struct s5k3l6_mode *mode =3D s5k3l6->mode;
> +
> +	if (pad)
> +		return -EINVAL;
> +
> +	*config =3D (struct v4l2_mbus_config) {
> +		.type =3D V4L2_MBUS_CSI2_DPHY,
> +		.link_freq =3D s5k3l6_link_freq_menu[mode->link_freq_index],
> +	};
> +	config->bus.mipi_csi2.num_data_lanes =3D S5K3L6_DATA_LANES;
> +
> +	return 0;
> +}

[Severity: Medium]
Can s5k3l6_get_mbus_config() read a transient, uncommitted s5k3l6->mode
pointer without holding the subdev active state lock?

call_get_mbus_config() invokes .get_mbus_config without locking the subdev
active state, and v4l2_subdev_is_streaming(sd) remains false until
v4l2_subdev_enable_streams() runs on the sensor.  If userspace issues
VIDIOC_SUBDEV_S_FMT while the CSI-2 receiver queries v4l2_get_link_freq()
during stream startup, s5k3l6_get_mbus_config() can observe the new mode
before s5k3l6_update_controls() rolls s5k3l6->mode back to old_mode on a
control I2C failure:

CPU0                                  CPU1
s5k3l6_set_pad_format()
  s5k3l6_update_controls()
    s5k3l6->mode =3D mode;
    __v4l2_ctrl_s_ctrl(vblank)
      s5k3l6_set_ctrl()
        cci_write()  [fails]
                                      v4l2_get_link_freq()
                                        s5k3l6_get_mbus_config()
                                          mode =3D s5k3l6->mode;
                                          <-- reads uncommitted mode
    s5k3l6->mode =3D old_mode;

The receiver then configures its D-PHY timing for a link frequency that does
not match the active sensor mode.  Locking the active subdev state with
v4l2_subdev_lock_and_get_active_state() in s5k3l6_get_mbus_config() (or
reading the active format from the locked state) would serialize the access.

[ ... ]

> +static const struct dev_pm_ops s5k3l6_pm_ops =3D {
> +	SET_RUNTIME_PM_OPS(s5k3l6_power_off, s5k3l6_power_on, NULL)
> +};
> +
> +static const struct of_device_id s5k3l6_of_match[] =3D {
> +	{ .compatible =3D "samsung,s5k3l6" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, s5k3l6_of_match);
> +
> +static struct i2c_driver s5k3l6_i2c_driver =3D {
> +	.driver =3D {
> +		.name =3D "s5k3l6",
> +		.pm =3D &s5k3l6_pm_ops,
> +		.of_match_table =3D s5k3l6_of_match,
> +	},

[Severity: Low]
Should .pm use pm_ptr(&s5k3l6_pm_ops) (along with RUNTIME_PM_OPS() or
DEFINE_RUNTIME_DEV_PM_OPS()) so the compiler can drop the PM ops structure
and callbacks when CONFIG_PM is disabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112004636.7397=
49-1-vincent.cloutier@icloud.com?part=3D2
